void sub_21CB3BD08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void *v18;
  uint64_t v19;

  v1 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  v3 = sub_21CB88070();
  v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21CA00000, v3, v4, "👀 FMFSecureLocCtrl: setting location update block", v5, 2u);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }

  v6 = *(void **)(v1 + 24);
  v7 = swift_allocObject();
  swift_weakInit();
  v18 = sub_21CB4E7D4;
  v19 = v7;
  v14 = MEMORY[0x263EF8330];
  v15 = 1107296256;
  v16 = sub_21CB3C4C4;
  v17 = &unk_26CD70900;
  v8 = _Block_copy(&v14);
  v9 = v6;
  swift_release();
  objc_msgSend(v9, sel_setLocationUpdateBlock_, v8);
  _Block_release(v8);

  v10 = *(void **)(v1 + 24);
  v11 = swift_allocObject();
  swift_weakInit();
  v18 = sub_21CB4E7DC;
  v19 = v11;
  v14 = MEMORY[0x263EF8330];
  v15 = 1107296256;
  v16 = sub_21CB3CA4C;
  v17 = &unk_26CD70928;
  v12 = _Block_copy(&v14);
  v13 = v10;
  swift_release();
  objc_msgSend(v13, sel_startMonitoringFailedSubscriptions_, v12);
  _Block_release(v12);
}

uint64_t sub_21CB3BF74(unint64_t a1)
{
  uint64_t v2 = sub_21CB88100();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21CB88150();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_21CB88D10();
      uint64_t v21 = v6;
      uint64_t v22 = v3;
      if (result)
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v13 = (id)MEMORY[0x21D4B5CA0](0, a1);
        }
        else
        {
          if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          id v13 = *(id *)(a1 + 32);
        }
        v14 = v13;
        swift_bridgeObjectRelease();
        id v15 = objc_msgSend(v14, sel_publishReason);

        if (v15 == (id)7)
        {
          char v16 = 1;
LABEL_12:
          v17 = *(void **)(v11 + 136);
          uint64_t v18 = swift_allocObject();
          *(void *)(v18 + 16) = a1;
          *(void *)(v18 + 24) = v11;
          *(unsigned char *)(v18 + 32) = v16;
          aBlock[4] = sub_21CB4E84C;
          aBlock[5] = v18;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_21CA1B084;
          aBlock[3] = &unk_26CD709C8;
          v19 = _Block_copy(aBlock);
          swift_bridgeObjectRetain();
          id v20 = v17;
          swift_retain();
          sub_21CB88120();
          uint64_t v23 = MEMORY[0x263F8EE78];
          sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
          sub_21CA57E34((uint64_t *)&unk_267C96DD0);
          sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
          sub_21CB88A60();
          MEMORY[0x21D4B5A20](0, v9, v5, v19);
          _Block_release(v19);
          swift_release();

          (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v2);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
          return swift_release();
        }
LABEL_11:
        char v16 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v21 = v6;
      uint64_t v22 = v3;
      if (v12) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_21CB3C324(unint64_t a1, uint64_t a2, char a3)
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21CB880A0();
  sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_21CB88D10();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v6, v7, "👀 FMFSecureLocCtrl: %ld locations received from spd (location update block)", v8, 0xCu);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_21CB4227C(a1, 0, a3 & 1);
}

uint64_t sub_21CB3C4C4(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_21CA05908(0, &qword_267C95D58);
  uint64_t v2 = sub_21CB88510();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB3C548(uint64_t a1)
{
  uint64_t v2 = sub_21CB88100();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21CB88150();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v16 = v3;
    uint64_t v17 = v6;
    uint64_t v12 = *(void **)(result + 136);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a1;
    *(void *)(v13 + 24) = v11;
    aBlock[4] = sub_21CB4E814;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21CA1B084;
    aBlock[3] = &unk_26CD70978;
    v14 = _Block_copy(aBlock);
    id v15 = v12;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_21CB88120();
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v9, v5, v14);
    _Block_release(v14);
    swift_release();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB3C840()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21CB880A0();
  sub_21CA4CC18(v0, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  v1 = sub_21CB88070();
  os_log_type_t v2 = sub_21CB88880();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v12 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = MEMORY[0x21D4B5620](v5, MEMORY[0x263F8D310]);
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_21CA4E450(v6, v8, &v12);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v1, v2, "👀 FMFSecureLocCtrl: Failed subscription received from spd, no location for findMyIds: %s. Clear cached locations", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v4, -1, -1);
    MEMORY[0x21D4B6B70](v3, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_21CA5893C(v9);
  swift_bridgeObjectRelease();
  sub_21CB4227C(MEMORY[0x263F8EE78], v10, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB3CA4C(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_21CB88510();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB3CABC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_21CB88100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v44 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21CB88150();
  uint64_t v43 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_21CA5893C(v11);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(void *)(*(void *)(v3 + 80) + 16) <= *(void *)(v12 + 16) >> 3)
  {
    aBlock[0] = v12;
    uint64_t v30 = swift_bridgeObjectRetain();
    sub_21CA45DF8(v30);
    swift_bridgeObjectRelease();
    uint64_t v14 = aBlock[0];
    if (*(void *)(aBlock[0] + 16)) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_21CA44DD4(v13, v12);
  swift_bridgeObjectRelease();
  if (!*(void *)(v14 + 16)) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  char v15 = a2 & 1;
  swift_beginAccess();
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_21CB3D06C(v16);
  swift_endAccess();
  uint64_t v17 = sub_21CA4D61C(v14);
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_21CB3D1EC((uint64_t)v17);
  swift_retain();
  uint64_t v40 = sub_21CB2295C(v18);
  unint64_t v20 = v19;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v41 = v8;
  uint64_t v42 = v6;
  uint64_t v21 = sub_21CB880A0();
  sub_21CA4CC18(v21, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_21CB88070();
  os_log_type_t v23 = sub_21CB88880();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v39 = v5;
    uint64_t v25 = v24;
    uint64_t v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)uint64_t v25 = 136315394;
    v38 = v17;
    LOBYTE(v45) = v15;
    uint64_t v26 = sub_21CB88310();
    uint64_t v45 = sub_21CA4E450(v26, v27, aBlock);
    uint64_t v17 = v38;
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_21CA4E450(v40, v20, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v22, v23, "👀 FMFSecureLocCtrl: telling FMFManager begin waiting for %s for %s", (uint8_t *)v25, 0x16u);
    uint64_t v28 = v37;
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v28, -1, -1);
    uint64_t v29 = v25;
    uint64_t v5 = v39;
    MEMORY[0x21D4B6B70](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v32 = *(void **)(v3 + 144);
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = v15;
  *(void *)(v33 + 24) = v3;
  *(void *)(v33 + 32) = v17;
  aBlock[4] = (uint64_t)sub_21CB4E78C;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21CA1B084;
  aBlock[3] = (uint64_t)&unk_26CD708D8;
  v34 = _Block_copy(aBlock);
  id v35 = v32;
  swift_retain();
  sub_21CB88120();
  uint64_t v45 = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  v36 = v44;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v10, v36, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v5);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v41);
  return swift_release();
}

uint64_t sub_21CB3D06C(uint64_t result)
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
    swift_bridgeObjectRetain();
    sub_21CA589D4(&v16, v11, v12);
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

uint64_t sub_21CB3D1EC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_21CA7C0F8(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_21CA57E34((uint64_t *)&unk_267C95220);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21CA7C0F8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v11;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21CA7C0F8(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v11;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21CB3D32C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_21CB88100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21CB88150();
  uint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_21CA5893C(v11);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_21CB4C3A0(v13, v12);
  swift_bridgeObjectRelease();
  if (*(void *)(v14 + 16))
  {
    char v15 = a2 & 1;
    swift_beginAccess();
    sub_21CA45DF8(v14);
    swift_endAccess();
    uint64_t v16 = sub_21CA4D61C(v14);
    swift_release();
    uint64_t v39 = v16;
    uint64_t v17 = sub_21CB3D1EC((uint64_t)v16);
    swift_retain();
    uint64_t v38 = sub_21CB2295C(v17);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v40 = v8;
    uint64_t v41 = v6;
    uint64_t v20 = sub_21CB880A0();
    sub_21CA4CC18(v20, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_21CB88070();
    os_log_type_t v22 = sub_21CB88880();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v37 = v5;
      uint64_t v24 = v23;
      uint64_t v36 = swift_slowAlloc();
      aBlock[0] = v36;
      *(_DWORD *)uint64_t v24 = 136315394;
      LOBYTE(v44) = v15;
      uint64_t v25 = sub_21CB88310();
      uint64_t v44 = sub_21CA4E450(v25, v26, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_21CA4E450(v38, v19, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v21, v22, "👀 FMFSecureLocCtrl: telling FMFManager end waiting for %s for %s", (uint8_t *)v24, 0x16u);
      uint64_t v27 = v36;
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v27, -1, -1);
      uint64_t v28 = v24;
      uint64_t v5 = v37;
      MEMORY[0x21D4B6B70](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v29 = *(void **)(v3 + 144);
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = v15;
    v31 = v39;
    *(void *)(v30 + 24) = v3;
    *(void *)(v30 + 32) = v31;
    aBlock[4] = (uint64_t)sub_21CB4E700;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21CA1B084;
    aBlock[3] = (uint64_t)&unk_26CD70888;
    v32 = _Block_copy(aBlock);
    id v33 = v29;
    swift_retain();
    sub_21CB88120();
    uint64_t v44 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    v34 = v43;
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v10, v34, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v5);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v40);
  }
  return swift_release();
}

uint64_t sub_21CB3D89C(char a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), void (*a5)(uint64_t))
{
  if (a1)
  {
    uint64_t result = MEMORY[0x21D4B6C80](a2 + 184);
    if (!result) {
      return result;
    }
    a4(a3);
  }
  else
  {
    uint64_t result = MEMORY[0x21D4B6C80](a2 + 168);
    if (!result) {
      return result;
    }
    a5(a3);
  }

  return swift_unknownObjectRelease();
}

uint64_t sub_21CB3D930(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_21CB88100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21CB88150();
  uint64_t v41 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_21CA5893C(v11);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(void *)(*(void *)(v3 + 88) + 16) <= *(void *)(v12 + 16) >> 3)
  {
    aBlock[0] = v12;
    uint64_t v28 = swift_bridgeObjectRetain();
    sub_21CA45DF8(v28);
    swift_bridgeObjectRelease();
    uint64_t v14 = aBlock[0];
    if (*(void *)(aBlock[0] + 16)) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_21CA44DD4(v13, v12);
  swift_bridgeObjectRelease();
  if (!*(void *)(v14 + 16)) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  swift_beginAccess();
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_21CB3D06C(v15);
  swift_endAccess();
  uint64_t v16 = sub_21CA4D61C(v14);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_21CB3D1EC((uint64_t)v16);
  swift_retain();
  uint64_t v38 = sub_21CB2295C(v17);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v39 = v8;
  uint64_t v40 = v6;
  uint64_t v20 = sub_21CB880A0();
  sub_21CA4CC18(v20, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_21CB88070();
  os_log_type_t v22 = sub_21CB88880();
  if (os_log_type_enabled(v21, v22))
  {
    char v23 = a2 & 1;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = v5;
    aBlock[0] = v36;
    *(_DWORD *)uint64_t v24 = 136315394;
    LOBYTE(v43) = v23;
    uint64_t v25 = sub_21CB88310();
    uint64_t v43 = sub_21CA4E450(v25, v26, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_21CA4E450(v38, v19, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v21, v22, "👀 FMFSecureLocCtrl: telling FMFManager to set fallback-to-legacy from %s for %s", (uint8_t *)v24, 0x16u);
    uint64_t v27 = v36;
    swift_arrayDestroy();
    uint64_t v5 = v37;
    MEMORY[0x21D4B6B70](v27, -1, -1);
    MEMORY[0x21D4B6B70](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v30 = *(void **)(v3 + 144);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v3;
  *(void *)(v31 + 24) = v16;
  aBlock[4] = (uint64_t)sub_21CB4E6CC;
  aBlock[5] = v31;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21CA1B084;
  aBlock[3] = (uint64_t)&unk_26CD70838;
  v32 = _Block_copy(aBlock);
  id v33 = v30;
  swift_retain();
  sub_21CB88120();
  uint64_t v43 = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  v34 = v42;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v10, v34, v32);
  _Block_release(v32);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v5);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v39);
  return swift_release();
}

uint64_t sub_21CB3DED8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_21CB88100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21CB88150();
  uint64_t v42 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_21CA5893C(v12);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_21CB4C3A0(v14, v13);
  swift_bridgeObjectRelease();
  if (*(void *)(v15 + 16))
  {
    uint64_t v38 = v8;
    uint64_t v39 = v9;
    swift_beginAccess();
    sub_21CA45DF8(v15);
    swift_endAccess();
    uint64_t v16 = sub_21CA4D61C(v15);
    swift_release();
    uint64_t v17 = sub_21CB3D1EC((uint64_t)v16);
    swift_retain();
    uint64_t v37 = sub_21CB2295C(v17);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v40 = v6;
    uint64_t v41 = v5;
    uint64_t v20 = sub_21CB880A0();
    sub_21CA4CC18(v20, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_21CB88070();
    os_log_type_t v22 = sub_21CB88880();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = a2 & 1;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      aBlock[0] = v36;
      *(_DWORD *)uint64_t v24 = 136315394;
      LOBYTE(v43) = v23;
      uint64_t v25 = sub_21CB88310();
      uint64_t v43 = sub_21CA4E450(v25, v26, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_21CA4E450(v37, v19, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v21, v22, "👀 FMFSecureLocCtrl: telling FMFManager to clear fallback-to-legacy from %s for %s", (uint8_t *)v24, 0x16u);
      uint64_t v27 = v36;
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v27, -1, -1);
      MEMORY[0x21D4B6B70](v24, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v28 = *(void **)(v3 + 144);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v3;
    *(void *)(v29 + 24) = v16;
    aBlock[4] = (uint64_t)sub_21CB4E66C;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21CA1B084;
    aBlock[3] = (uint64_t)&unk_26CD707E8;
    uint64_t v30 = _Block_copy(aBlock);
    id v31 = v28;
    swift_retain();
    sub_21CB88120();
    uint64_t v43 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    v32 = v38;
    uint64_t v33 = v41;
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v11, v32, v30);
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v39);
  }
  return swift_release();
}

uint64_t sub_21CB3E43C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = MEMORY[0x21D4B6C80](a1 + 168);
  if (result)
  {
    a3(a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21CB3E4AC(unint64_t a1, char a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_21CB88D10();
    uint64_t v5 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v7 = 0;
  char v8 = a2 & 1;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x21D4B5CA0](v7, a1);
    }
    else {
      id v9 = *(id *)(a1 + 8 * v7 + 32);
    }
    uint64_t v10 = v9;
    ++v7;
    uint64_t v11 = v9;
    sub_21CB3E5AC(&v11, v2, v8);
  }
  while (v5 != v7);
LABEL_10:

  return swift_bridgeObjectRelease();
}

void sub_21CB3E5AC(void **a1, uint64_t a2, char a3)
{
  char v5 = a3 & 1;
  uint64_t v6 = sub_21CB87590();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v11 = *(void **)(a2 + 216);
  id v12 = v10;
  id v13 = objc_msgSend(v12, sel_timestamp);
  sub_21CB87560();

  uint64_t v14 = (void *)sub_21CB87510();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v15 = objc_msgSend(v11, sel_stringFromDate_, v14);

  uint64_t v16 = sub_21CB882F0();
  uint64_t v18 = v17;

  sub_21CA57E34(&qword_267C97020);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21CB91CF0;
  objc_msgSend(v12, sel_latitude);
  uint64_t v20 = MEMORY[0x263F8D538];
  uint64_t v21 = MEMORY[0x263F8D5B8];
  *(void *)(v19 + 56) = MEMORY[0x263F8D538];
  *(void *)(v19 + 64) = v21;
  *(void *)(v19 + 32) = v22;
  objc_msgSend(v12, sel_longitude);
  *(void *)(v19 + 96) = v20;
  *(void *)(v19 + 104) = v21;
  *(void *)(v19 + 72) = v23;
  uint64_t v24 = MEMORY[0x263F8D310];
  *(void *)(v19 + 136) = MEMORY[0x263F8D310];
  unint64_t v25 = sub_21CA4ECA4();
  *(void *)(v19 + 144) = v25;
  *(void *)(v19 + 112) = v16;
  *(void *)(v19 + 120) = v18;
  id v26 = objc_msgSend(v12, sel_locationLabel);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = sub_21CB882F0();
    unint64_t v30 = v29;

    id v31 = (uint64_t *)(v19 + 152);
    *(void *)(v19 + 176) = v24;
    *(void *)(v19 + 184) = v25;
    if (v30)
    {
      uint64_t *v31 = v28;
      goto LABEL_6;
    }
  }
  else
  {
    id v31 = (uint64_t *)(v19 + 152);
    *(void *)(v19 + 176) = v24;
    *(void *)(v19 + 184) = v25;
  }
  uint64_t *v31 = 7104878;
  unint64_t v30 = 0xE300000000000000;
LABEL_6:
  *(void *)(v19 + 160) = v30;
  LOBYTE(v55) = v5;
  uint64_t v32 = sub_21CB88310();
  *(void *)(v19 + 216) = v24;
  *(void *)(v19 + 224) = v25;
  *(void *)(v19 + 192) = v32;
  *(void *)(v19 + 200) = v33;
  uint64_t v34 = sub_21CB3A7BC((uint64_t)objc_msgSend(v12, sel_publishReason));
  *(void *)(v19 + 256) = v24;
  *(void *)(v19 + 264) = v25;
  *(void *)(v19 + 232) = v34;
  *(void *)(v19 + 240) = v35;
  uint64_t v36 = sub_21CB88300();
  unint64_t v38 = v37;
  sub_21CA57E34(&qword_267C95218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
  id v40 = objc_msgSend(v12, sel_findMyId);
  uint64_t v41 = sub_21CB882F0();
  uint64_t v43 = v42;

  *(void *)(inited + 32) = v41;
  *(void *)(inited + 40) = v43;
  swift_retain();
  uint64_t v44 = sub_21CB2295C(inited);
  unint64_t v46 = v45;
  swift_release();
  swift_setDeallocating();
  sub_21CA57E34((uint64_t *)&unk_267C95220);
  swift_arrayDestroy();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v47 = sub_21CB880A0();
  sub_21CA4CC18(v47, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v48 = sub_21CB88070();
  os_log_type_t v49 = sub_21CB88880();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v55 = v51;
    *(_DWORD *)uint64_t v50 = 136315394;
    uint64_t v53 = v36;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_21CA4E450(v44, v46, &v55);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v50 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_21CA4E450(v53, v38, &v55);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v48, v49, "👀 FMFSecureLocCtrl: spd location for %s: %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v51, -1, -1);
    MEMORY[0x21D4B6B70](v50, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_21CB3EAB8(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v8 = a2 & 1;
  uint64_t v9 = sub_21CB88100();
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_21CB88150();
  uint64_t v12 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = *(void **)(v4 + 136);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = v4;
  *(unsigned char *)(v16 + 32) = v8;
  *(void *)(v16 + 40) = a3;
  *(void *)(v16 + 48) = a4;
  aBlock[4] = sub_21CB4EA50;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD70AB8;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v18 = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CB88120();
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v21);
  return swift_release();
}

uint64_t sub_21CB3ED94(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v91 = a4;
  uint64_t v92 = a5;
  LODWORD(v94) = a3;
  uint64_t v7 = type metadata accessor for FMFFriend();
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void *)(a1 + 16);
  v95 = a2;
  uint64_t v93 = v8;
  if (v11)
  {
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v13 = *(void *)(v8 + 72);
    uint64_t v90 = a1;
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
    uint64_t v15 = v11;
    uint64_t v96 = v7;
    do
    {
      sub_21CA570B0(v12, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      if ((*((unsigned char *)v10 + *(int *)(v7 + 36)) & 2) != 0)
      {
        uint64_t v17 = *v10;
        uint64_t v16 = v10[1];
        swift_bridgeObjectRetain();
        sub_21CA581B8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FMFFriend);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v14 = sub_21CAC7864(0, v14[2] + 1, 1, v14);
        }
        unint64_t v19 = v14[2];
        unint64_t v18 = v14[3];
        if (v19 >= v18 >> 1) {
          uint64_t v14 = sub_21CAC7864((void *)(v18 > 1), v19 + 1, 1, v14);
        }
        v14[2] = v19 + 1;
        uint64_t v20 = &v14[2 * v19];
        v20[4] = v17;
        v20[5] = v16;
        uint64_t v7 = v96;
      }
      else
      {
        sub_21CA581B8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      }
      v12 += v13;
      --v15;
    }
    while (v15);
    a1 = v90;
    swift_bridgeObjectRelease();
    a2 = v95;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  }
  int v21 = v94 & 1;
  uint64_t v22 = sub_21CB3D1EC((uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v23 = sub_21CB2295C(v22);
  unint64_t v25 = v24;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_21CB880A0();
  sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_21CB88070();
  os_log_type_t v28 = sub_21CB88880();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v94 = swift_slowAlloc();
    v98[0] = v94;
    *(_DWORD *)uint64_t v29 = 136315394;
    LOBYTE(v101) = v21;
    uint64_t v90 = v23;
    uint64_t v30 = sub_21CB88310();
    LODWORD(v96) = v21;
    uint64_t v101 = sub_21CA4E450(v30, v31, v98);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_21CA4E450(v90, v25, v98);
    int v21 = v96;
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v27, v28, "👀 FMFSecureLocCtrl: asked-subscribing %s for %s", (uint8_t *)v29, 0x16u);
    uint64_t v32 = v94;
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v32, -1, -1);
    uint64_t v33 = v29;
    a2 = v95;
    MEMORY[0x21D4B6B70](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = a2[4];
  uint64_t v35 = a2[7];
  uint64_t v100 = v35;
  uint64_t v101 = v34;
  if (v21)
  {
    if (v11)
    {
      unint64_t v38 = (uint64_t *)(a1
                      + ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80)));
      uint64_t v39 = *(void *)(v93 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      do
      {
        sub_21CB40330(v38, (uint64_t)&v100, (uint64_t)a2, 1);
        unint64_t v38 = (uint64_t *)((char *)v38 + v39);
        --v11;
      }
      while (v11);
      swift_bridgeObjectRelease();
      uint64_t v35 = v100;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v61 = swift_bridgeObjectRetain();
    uint64_t v62 = sub_21CB3A640(v61);
    uint64_t v63 = sub_21CB4E19C(v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v64 = sub_21CABAFB0(v63);
    swift_bridgeObjectRelease();
    swift_retain();
    uint64_t v65 = sub_21CB2295C((uint64_t)v64);
    unint64_t v67 = v66;
    swift_release();
    swift_release();
    uint64_t v68 = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LOBYTE(v63) = sub_21CB3ADF4(v35, v68);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v71 = sub_21CB88070();
      os_log_type_t v72 = sub_21CB88880();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        v98[0] = v74;
        *(_DWORD *)uint64_t v73 = 136315394;
        LOBYTE(v99) = 1;
        uint64_t v75 = sub_21CB88310();
        uint64_t v96 = v65;
        uint64_t v99 = sub_21CA4E450(v75, v76, v98);
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v99 = sub_21CA4E450(v96, v67, v98);
        sub_21CB889C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21CA00000, v71, v72, "👀 FMFSecureLocCtrl: elected-subscribing %s for %s", (uint8_t *)v73, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v74, -1, -1);
        MEMORY[0x21D4B6B70](v73, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v81 = swift_bridgeObjectRetain();
      uint64_t v82 = sub_21CB3A4C4(v81);
      uint64_t v83 = sub_21CA5893C(v82);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v85 = v91;
      uint64_t v84 = v92;
      sub_21CB44230(v83, 1, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      uint64_t v86 = swift_bridgeObjectRetain();
      uint64_t v87 = sub_21CB3A334(v86);
      uint64_t v88 = sub_21CB4E0C4(v87);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      a2[7] = v88;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a2[8] = v85;
      a2[9] = v84;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    swift_bridgeObjectRelease();
    v48 = sub_21CB88070();
    os_log_type_t v49 = sub_21CB88840();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v99 = v51;
      *(_DWORD *)uint64_t v50 = 136315394;
      LOBYTE(v98[0]) = 1;
      uint64_t v69 = sub_21CB88310();
      v98[0] = sub_21CA4E450(v69, v70, &v99);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2048;
      swift_beginAccess();
      uint64_t v97 = *(void *)(v100 + 16);
      sub_21CB889C0();
      uint64_t v54 = "👀 FMFSecureLocCtrl: no change for subscribing %s for %ld handles";
      goto LABEL_37;
    }
LABEL_38:

LABEL_45:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (v11)
  {
    uint64_t v36 = (uint64_t *)(a1 + ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80)));
    uint64_t v37 = *(void *)(v93 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    do
    {
      sub_21CB3FA68(v36, &v101, (uint64_t)a2, 0);
      uint64_t v36 = (uint64_t *)((char *)v36 + v37);
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v34 = v101;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v40 = swift_bridgeObjectRetain();
  uint64_t v41 = sub_21CA4D61C(v40);
  swift_bridgeObjectRelease();
  uint64_t v42 = sub_21CB3D1EC((uint64_t)v41);
  swift_release();
  swift_retain();
  uint64_t v43 = sub_21CB2295C(v42);
  unint64_t v45 = v44;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v46 = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v47 = sub_21CB3AB50(v34, v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47)
  {
    swift_bridgeObjectRelease();
    v48 = sub_21CB88070();
    os_log_type_t v49 = sub_21CB88840();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v99 = v51;
      *(_DWORD *)uint64_t v50 = 136315394;
      LOBYTE(v98[0]) = 0;
      uint64_t v52 = sub_21CB88310();
      v98[0] = sub_21CA4E450(v52, v53, &v99);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2048;
      swift_beginAccess();
      uint64_t v97 = *(void *)(v101 + 16);
      sub_21CB889C0();
      uint64_t v54 = "👀 FMFSecureLocCtrl: no change for subscribing %s %ld handles";
LABEL_37:
      _os_log_impl(&dword_21CA00000, v48, v49, v54, (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v51, -1, -1);
      MEMORY[0x21D4B6B70](v50, -1, -1);
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  uint64_t v55 = sub_21CB88070();
  os_log_type_t v56 = sub_21CB88880();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    v98[0] = v58;
    *(_DWORD *)uint64_t v57 = 136315394;
    LOBYTE(v99) = 0;
    uint64_t v59 = sub_21CB88310();
    uint64_t v99 = sub_21CA4E450(v59, v60, v98);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_21CA4E450(v43, v45, v98);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v55, v56, "👀 FMFSecureLocCtrl: elected-subscribing %s for %s", (uint8_t *)v57, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v58, -1, -1);
    MEMORY[0x21D4B6B70](v57, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v77 = v101;
  uint64_t v78 = swift_bridgeObjectRetain();
  uint64_t v80 = v91;
  uint64_t v79 = v92;
  sub_21CB44230(v78, 0, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  a2[4] = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a2[5] = v80;
  a2[6] = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB3FA68(uint64_t *a1, uint64_t *a2, uint64_t a3, char a4)
{
  char v6 = a4 & 1;
  uint64_t v7 = type metadata accessor for FMFFriend();
  if ((*((unsigned char *)a1 + *(int *)(v7 + 36)) & 2) != 0)
  {
    swift_retain();
    char v17 = sub_21CA3C974((uint64_t)a1);
    swift_release();
    if (v17)
    {
      uint64_t v19 = *a1;
      uint64_t v18 = a1[1];
      swift_bridgeObjectRetain();
      sub_21CA589D4(&v45, v19, v18);
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *a2;
      uint64_t v22 = *a1;
      uint64_t v21 = a1[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_21CB3FFE8(v22, v21, v20);
      uint64_t v25 = v24;
      unsigned __int8 v27 = v26;
      int v28 = ~v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21CB4E9AC(v23, v25, v27);
      if (v28)
      {
        sub_21CA57E34((uint64_t *)&unk_267C96F20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
        *(void *)(inited + 32) = v22;
        *(void *)(inited + 40) = v21;
        swift_bridgeObjectRetain();
        sub_21CB3D32C(inited, v6);
        swift_setDeallocating();
        return swift_arrayDestroy();
      }
      else
      {
        sub_21CA57E34(&qword_267C95218);
        uint64_t v30 = swift_initStackObject();
        *(_OWORD *)(v30 + 16) = xmmword_21CB8B220;
        *(void *)(v30 + 32) = v22;
        *(void *)(v30 + 40) = v21;
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v31 = sub_21CB2295C(v30);
        unint64_t v33 = v32;
        swift_release();
        swift_setDeallocating();
        sub_21CA57E34((uint64_t *)&unk_267C95220);
        swift_arrayDestroy();
        if (qword_267C94990 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_21CB880A0();
        sub_21CA4CC18(v34, (uint64_t)qword_267CA5368);
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_21CB88070();
        os_log_type_t v36 = sub_21CB88880();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v45 = v44;
          *(_DWORD *)uint64_t v37 = 136315394;
          uint64_t v43 = v31;
          char v38 = v6;
          LOBYTE(v46) = v6;
          uint64_t v39 = sub_21CB88310();
          uint64_t v46 = sub_21CA4E450(v39, v40, &v45);
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v46 = sub_21CA4E450(v43, v33, &v45);
          sub_21CB889C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CA00000, v35, v36, "👀 FMFSecureLocCtrl: fallback to legacy (not capable) %s for %s", (uint8_t *)v37, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v44, -1, -1);
          MEMORY[0x21D4B6B70](v37, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          char v38 = v6;
        }
        sub_21CA57E34((uint64_t *)&unk_267C96F20);
        uint64_t v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = xmmword_21CB8B220;
        uint64_t v42 = a1[1];
        *(void *)(v41 + 32) = *a1;
        *(void *)(v41 + 40) = v42;
        swift_bridgeObjectRetain();
        sub_21CB3D930(v41, v38);
        swift_setDeallocating();
        return swift_arrayDestroy();
      }
    }
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = *a1;
    uint64_t v10 = a1[1];
    swift_bridgeObjectRetain();
    uint64_t v11 = swift_bridgeObjectRetain();
    sub_21CB4DA70(v11, v9, v10);
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v13)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21CB4BB14(v9, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21CA57E34(&qword_267C95260);
      unint64_t v15 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_21CB8B220;
      sub_21CA570B0((uint64_t)a1, v16 + v15, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      sub_21CB40594(v16, v6);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unint64_t sub_21CB3FFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_21CB89050();
    sub_21CB88380();
    uint64_t v6 = sub_21CB89090();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21CB88F50() & 1) != 0) {
        return v8;
      }
      uint64_t v14 = ~v7;
      unint64_t v8 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
      {
        while (1)
        {
          unint64_t v15 = (void *)(v10 + 16 * v8);
          BOOL v16 = *v15 == a1 && v15[1] == a2;
          if (v16 || (sub_21CB88F50() & 1) != 0) {
            break;
          }
          unint64_t result = 0;
          unint64_t v8 = (v8 + 1) & v14;
          if (((*(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
            return result;
          }
        }
        return v8;
      }
    }
  }
  return 0;
}

unint64_t sub_21CB40140(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    int v7 = a3 & 1;
    int v8 = a3 & 0x100;
    int v9 = a3 & 0x10000;
    sub_21CB89050();
    swift_bridgeObjectRetain();
    uint64_t v28 = a1;
    sub_21CB88380();
    swift_bridgeObjectRelease();
    sub_21CB89070();
    sub_21CB89070();
    sub_21CB89070();
    uint64_t v10 = sub_21CB89090();
    uint64_t v11 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    uint64_t v13 = a4 + 56;
    if ((*(void *)(a4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
    {
      uint64_t v14 = ~v11;
      uint64_t v15 = *(void *)(a4 + 48);
      uint64_t v16 = v28;
      int v26 = v8;
      int v27 = v9;
      do
      {
        uint64_t v20 = v15 + 24 * v12;
        int v21 = *(unsigned __int8 *)(v20 + 16);
        int v22 = *(unsigned __int8 *)(v20 + 17);
        int v23 = (v9 != 0) ^ *(unsigned __int8 *)(v20 + 18);
        if (*(void *)v20 == v16 && *(void *)(v20 + 8) == a2)
        {
          if ((((v7 != 0) ^ v21 | (v8 != 0) ^ v22 | v23) & 1) == 0) {
            return v12;
          }
        }
        else
        {
          BOOL v29 = v8 != 0;
          uint64_t v17 = v13;
          uint64_t v18 = v14;
          char v19 = sub_21CB88F50();
          uint64_t v14 = v18;
          uint64_t v13 = v17;
          uint64_t v16 = v28;
          int v8 = v26;
          int v9 = v27;
          if (!(((v7 != 0) ^ v21) & 1 | ((v19 & 1) == 0) | (v29 ^ v22 | v23) & 1)) {
            return v12;
          }
        }
        unint64_t v12 = (v12 + 1) & v14;
      }
      while (((*(void *)(v13 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
    }
  }
  return 0;
}

uint64_t sub_21CB40330(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = type metadata accessor for FMFFriend();
  if ((*((unsigned char *)a1 + *(int *)(v7 + 36)) & 2) != 0)
  {
    swift_retain();
    char v17 = sub_21CA3C974((uint64_t)a1);
    uint64_t result = swift_release();
    if (v17)
    {
      uint64_t v18 = *(void *)(a3 + 56);
      char v19 = *(unsigned char *)(v18 + 32);
      uint64_t v20 = 1 << v19;
      uint64_t v21 = -1;
      if (1 << v19 < 64) {
        uint64_t v21 = ~(-1 << (1 << v19));
      }
      if ((v21 & *(void *)(v18 + 56)) == 0)
      {
        unsigned int v22 = v19 & 0x3F;
        if (v22 >= 7)
        {
          if (*(void *)(v18 + 64)) {
            return result;
          }
          if (v22 >= 8)
          {
            if (*(void *)(v18 + 72) || *(void *)(v18 + 80)) {
              return result;
            }
            if (v22 >= 9)
            {
              if (*(void *)(v18 + 88) || *(void *)(v18 + 96) || *(void *)(v18 + 104)) {
                return result;
              }
              int64_t v23 = (unint64_t)(v20 + 63) >> 6;
              if (v23 <= 7) {
                int64_t v23 = 7;
              }
              int64_t v24 = v23 - 7;
              uint64_t v25 = (uint64_t *)(v18 + 112);
              while (v24)
              {
                uint64_t v26 = *v25++;
                --v24;
                if (v26) {
                  return result;
                }
              }
            }
          }
        }
        uint64_t v28 = *a1;
        uint64_t v27 = a1[1];
        swift_bridgeObjectRetain();
        sub_21CB61C30((uint64_t)v29, v28, v27, 0);
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = *a1;
    uint64_t v10 = a1[1];
    swift_bridgeObjectRetain();
    uint64_t v11 = swift_bridgeObjectRetain();
    sub_21CB4DC18(v11, v9, v10);
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v13)
    {
      swift_bridgeObjectRelease();
      sub_21CA57E34(&qword_267C95260);
      unint64_t v15 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_21CB8B220;
      sub_21CA570B0((uint64_t)a1, v16 + v15, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      sub_21CB40594(v16, a4 & 1);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_21CB40594(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = sub_21CB88100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_21CB88150();
  uint64_t v9 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)(v2 + 136);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = v2;
  *(unsigned char *)(v13 + 32) = v4;
  aBlock[4] = sub_21CB4E940;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD70A18;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v12;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CB88120();
  v17[1] = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v17[0]);
  return swift_release();
}

void sub_21CB40858(uint64_t a1, void *a2, int a3)
{
  uint64_t v123 = sub_21CB88100();
  uint64_t v128 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  v122 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_21CB88150();
  uint64_t v127 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  v120 = (char *)&v113 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FMFFriend();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  v124 = (uint64_t *)((char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v113 - v12);
  int64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = MEMORY[0x263F8EE78];
  v125 = a2;
  uint64_t v116 = a1;
  uint64_t v129 = v9;
  int64_t v130 = v14;
  if (v14)
  {
    LODWORD(v126) = a3;
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21CA45524(0, v14, 0);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v17 = *(void *)(v9 + 72);
    uint64_t v15 = aBlock[0];
    do
    {
      sub_21CA570B0(v16, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v18 = *v13;
      uint64_t v19 = v13[1];
      swift_bridgeObjectRetain();
      sub_21CA581B8((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21CA45524(0, *(void *)(v15 + 16) + 1, 1);
        uint64_t v15 = aBlock[0];
      }
      unint64_t v21 = *(void *)(v15 + 16);
      unint64_t v20 = *(void *)(v15 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_21CA45524(v20 > 1, v21 + 1, 1);
        uint64_t v15 = aBlock[0];
      }
      *(void *)(v15 + 16) = v21 + 1;
      uint64_t v22 = v15 + 16 * v21;
      *(void *)(v22 + 32) = v18;
      *(void *)(v22 + 40) = v19;
      v16 += v17;
      --v14;
    }
    while (v14);
    a2 = v125;
    LOBYTE(a3) = v126;
  }
  int v23 = a3 & 1;
  uint64_t v24 = sub_21CB3D1EC(v15);
  swift_retain();
  uint64_t v114 = sub_21CB2295C(v24);
  unint64_t v26 = v25;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_21CB880A0();
  uint64_t v28 = sub_21CA4CC18(v27, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  uint64_t v115 = v28;
  BOOL v29 = sub_21CB88070();
  os_log_type_t v30 = sub_21CB88880();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315394;
    LOBYTE(v136) = v23;
    uint64_t v33 = sub_21CB88310();
    uint64_t v136 = sub_21CA4E450(v33, v34, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v136 = sub_21CA4E450(v114, v26, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v29, v30, "👀 FMFSecureLocCtrl: asked-unsubscribing %s for %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    a2 = v125;
    MEMORY[0x21D4B6B70](v32, -1, -1);
    MEMORY[0x21D4B6B70](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v35 = v129;
  sub_21CB3DED8(v15, v23);
  sub_21CB3D32C(v15, v23);
  swift_bridgeObjectRelease();
  if (!v23)
  {
    uint64_t v36 = a2[4];
    uint64_t v136 = v36;
    v135 = (char *)MEMORY[0x263F8EE88];
    if (v130)
    {
      unint64_t v113 = v26;
      unint64_t v37 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
      uint64_t v38 = *(void *)(v35 + 72);
      swift_bridgeObjectRetain();
      uint64_t v39 = (uint64_t *)(v37 + swift_bridgeObjectRetain() + 8);
      do
      {
        uint64_t v40 = v136;
        uint64_t v41 = *(v39 - 1);
        uint64_t v42 = *v39;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v43 = sub_21CB3FFE8(v41, v42, v40);
        uint64_t v45 = v44;
        unsigned __int8 v47 = v46;
        int v48 = ~v46;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v48)
        {
          sub_21CB4CB80(v43, v45);
          sub_21CB4E9AC(v43, v45, v47);
          swift_bridgeObjectRelease();
        }
        uint64_t v39 = (uint64_t *)((char *)v39 + v38);
        swift_bridgeObjectRetain();
        sub_21CA589D4(aBlock, v41, v42);
        swift_bridgeObjectRelease();
        --v130;
      }
      while (v130);
      swift_bridgeObjectRelease();
      uint64_t v78 = v136;
      a2 = v125;
      uint64_t v36 = v125[4];
      unint64_t v26 = v113;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v78 = v36;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v80 = sub_21CB3AB50(v78, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v80)
    {
      swift_bridgeObjectRelease();
      uint64_t v81 = sub_21CB88070();
      os_log_type_t v82 = sub_21CB88840();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = swift_slowAlloc();
        uint64_t v84 = swift_slowAlloc();
        uint64_t v134 = v84;
        *(_DWORD *)uint64_t v83 = 136315394;
        LOBYTE(aBlock[0]) = 0;
        uint64_t v85 = sub_21CB88310();
        aBlock[0] = sub_21CA4E450(v85, v86, &v134);
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v83 + 12) = 2048;
        swift_beginAccess();
        uint64_t v131 = *(void *)(v136 + 16);
        sub_21CB889C0();
        _os_log_impl(&dword_21CA00000, v81, v82, "👀 FMFSecureLocCtrl: no change for unsubscribing %s for %ld handles", (uint8_t *)v83, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v84, -1, -1);
        MEMORY[0x21D4B6B70](v83, -1, -1);
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_21CB88070();
      os_log_type_t v88 = sub_21CB88880();
      if (os_log_type_enabled(v87, v88))
      {
        uint64_t v89 = swift_slowAlloc();
        uint64_t v90 = swift_slowAlloc();
        aBlock[0] = v90;
        *(_DWORD *)uint64_t v89 = 136315394;
        LOBYTE(v134) = 0;
        uint64_t v91 = sub_21CB88310();
        uint64_t v134 = sub_21CA4E450(v91, v92, aBlock);
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v134 = sub_21CA4E450(v114, v26, aBlock);
        sub_21CB889C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21CA00000, v87, v88, "👀 FMFSecureLocCtrl: unsubscribing %s for %s", (uint8_t *)v89, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v90, -1, -1);
        MEMORY[0x21D4B6B70](v89, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v107 = (char *)a2[5];
      int64_t v108 = a2[6];
      swift_bridgeObjectRetain();
      v109 = (char *)swift_bridgeObjectRetain();
      sub_21CB45550(v109, 0, 0, 0xE000000000000000, v107, v108);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2[4] = v136;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  uint64_t v49 = a2[7];
  uint64_t v136 = v49;
  v135 = (char *)MEMORY[0x263F8EE88];
  if (v130)
  {
    unint64_t v113 = v26;
    uint64_t v50 = v116 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
    uint64_t v126 = *(void *)(v35 + 72);
    v119 = v133;
    v118 = (void (**)(char *, uint64_t))(v128 + 8);
    v117 = (void (**)(char *, uint64_t))(v127 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v51 = 0;
    int64_t v52 = v130;
    unint64_t v53 = v124;
    do
    {
      uint64_t v56 = sub_21CA570B0(v50, (uint64_t)v53, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v57 = v136;
      MEMORY[0x270FA5388](v56);
      *(&v113 - 2) = (unint64_t)v53;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_21CB3A900(sub_21CB09880, (uint64_t)(&v113 - 4), v57);
      uint64_t v60 = v59;
      int v62 = v61;
      swift_bridgeObjectRelease();
      if (v60)
      {
        uint64_t v127 = v51;
        uint64_t v128 = v50;
        int64_t v130 = v52;
        uint64_t v63 = v125;
        v64 = (void *)v125[18];
        uint64_t v65 = swift_allocObject();
        *(void *)(v65 + 16) = v63;
        *(void *)(v65 + 24) = v58;
        *(void *)(v65 + 32) = v60;
        *(unsigned char *)(v65 + 40) = v62 & 1;
        *(unsigned char *)(v65 + 41) = BYTE1(v62) & 1;
        *(unsigned char *)(v65 + 42) = BYTE2(v62) & 1;
        v133[2] = sub_21CB4E954;
        v133[3] = v65;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        v133[0] = sub_21CA1B084;
        v133[1] = &unk_26CD70A68;
        unint64_t v66 = _Block_copy(aBlock);
        uint64_t v67 = v58;
        id v68 = v64;
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v69 = v120;
        sub_21CB88120();
        uint64_t v134 = MEMORY[0x263F8EE78];
        sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
        sub_21CA57E34((uint64_t *)&unk_267C96DD0);
        sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
        unint64_t v70 = v122;
        uint64_t v71 = v123;
        sub_21CB88A60();
        MEMORY[0x21D4B5A20](0, v69, v70, v66);
        _Block_release(v66);

        (*v118)(v70, v71);
        (*v117)(v69, v121);
        swift_release();
        uint64_t v72 = v136;
        LODWORD(v69) = v62 & 0x10101 | v129 & 0xFF000000;
        swift_bridgeObjectRetain();
        LODWORD(v129) = v69;
        unint64_t v73 = sub_21CB40140(v67, v60, (int)v69, v72);
        uint64_t v75 = v74;
        unsigned __int8 v77 = v76;
        LODWORD(v63) = ~v76;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v63)
        {
          sub_21CB4CA68(v73, v75);
          sub_21CB4E9AC(v73, v75, v77);
          swift_bridgeObjectRelease();
        }
        int64_t v52 = v130;
        unint64_t v53 = v124;
        uint64_t v51 = v127;
        uint64_t v50 = v128;
      }
      uint64_t v54 = *v53;
      uint64_t v55 = v53[1];
      swift_bridgeObjectRetain();
      sub_21CA589D4(aBlock, v54, v55);
      swift_bridgeObjectRelease();
      sub_21CA581B8((uint64_t)v53, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      v50 += v126;
      --v52;
    }
    while (v52);
    swift_bridgeObjectRelease();
    uint64_t v79 = v136;
    a2 = v125;
    uint64_t v49 = v125[7];
    unint64_t v26 = v113;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v79 = v49;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v93 = sub_21CB3ADF4(v79, v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v93 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_21CB88070();
    os_log_type_t v102 = sub_21CB88880();
    if (os_log_type_enabled(v101, v102))
    {
      uint64_t v103 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      aBlock[0] = v104;
      *(_DWORD *)uint64_t v103 = 136315394;
      LOBYTE(v134) = 1;
      uint64_t v105 = sub_21CB88310();
      uint64_t v134 = sub_21CA4E450(v105, v106, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v103 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v134 = sub_21CA4E450(v114, v26, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v101, v102, "👀 FMFSecureLocCtrl: unsubscribing %s for %s", (uint8_t *)v103, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v104, -1, -1);
      MEMORY[0x21D4B6B70](v103, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v110 = v135;
    v111 = (char *)a2[8];
    int64_t v112 = a2[9];
    swift_bridgeObjectRetain();
    sub_21CB45550(v110, 1, 0, 0xE000000000000000, v111, v112);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a2[7] = v136;
LABEL_48:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v94 = sub_21CB88070();
  os_log_type_t v95 = sub_21CB88840();
  if (os_log_type_enabled(v94, v95))
  {
    uint64_t v96 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    aBlock[0] = v97;
    *(_DWORD *)uint64_t v96 = 136315394;
    LOBYTE(v134) = 1;
    uint64_t v98 = sub_21CB88310();
    uint64_t v134 = sub_21CA4E450(v98, v99, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v96 + 12) = 2048;
    uint64_t v100 = *(void *)(v79 + 16);
    swift_bridgeObjectRelease();
    uint64_t v134 = v100;
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v94, v95, "👀 FMFSecureLocCtrl: no change for unsubscribing %s for %ld handles", (uint8_t *)v96, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v97, -1, -1);
    MEMORY[0x21D4B6B70](v96, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_21CB419AC(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  char v4 = BYTE2(a4);
  uint64_t result = MEMORY[0x21D4B6C80](a1 + 184);
  if (result)
  {
    sub_21CB17E54(a2, a3, v4 & 1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21CB41A24(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21CB88100();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = sub_21CB88150();
  uint64_t v8 = *(void *)(v19[0] - 8);
  MEMORY[0x270FA5388](v19[0]);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21CB880A0();
  sub_21CA4CC18(v11, (uint64_t)qword_267CA5368);
  uint64_t v12 = sub_21CB88070();
  os_log_type_t v13 = sub_21CB88880();
  if (os_log_type_enabled(v12, v13))
  {
    int64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v14 = 0;
    _os_log_impl(&dword_21CA00000, v12, v13, "👀 FMFSecureLocCtrl: start refreshing", v14, 2u);
    MEMORY[0x21D4B6B70](v14, -1, -1);
  }

  sub_21CB3BD08();
  sub_21CB3EAB8(a1, 0, 0, 0);
  uint64_t v15 = *(void **)(v2 + 136);
  aBlock[4] = sub_21CB4E634;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD70798;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v15;
  swift_retain();
  sub_21CB88120();
  v19[1] = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v10, v7, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, void))(v8 + 8))(v10, v19[0]);
  return swift_release();
}

uint64_t sub_21CB41D94()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_21CB3A4C4(v0);
  uint64_t v2 = sub_21CA5893C(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CB44230(v2, 1, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB41E30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21CB88100();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_21CB88150();
  uint64_t v6 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_21CB880A0();
  sub_21CA4CC18(v9, (uint64_t)qword_267CA5368);
  uint64_t v10 = sub_21CB88070();
  os_log_type_t v11 = sub_21CB88880();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21CA00000, v10, v11, "👀 FMFSecureLocCtrl: stop refreshing", v12, 2u);
    MEMORY[0x21D4B6B70](v12, -1, -1);
  }

  os_log_type_t v13 = *(void **)(v1 + 136);
  aBlock[4] = sub_21CB4E62C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD70770;
  int64_t v14 = _Block_copy(aBlock);
  id v15 = v13;
  swift_retain();
  sub_21CB88120();
  v17[1] = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v8, v5, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v17[0]);
  return swift_release();
}

uint64_t sub_21CB42180(void *a1)
{
  uint64_t v2 = (char *)a1[5];
  int64_t v3 = a1[6];
  swift_bridgeObjectRetain();
  uint64_t v4 = (char *)swift_bridgeObjectRetain();
  sub_21CB45550(v4, 0, 0, 0xE000000000000000, v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_21CB3A4C4(v5);
  uint64_t v7 = (char *)sub_21CA5893C(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (char *)a1[8];
  int64_t v9 = a1[9];
  swift_bridgeObjectRetain();
  sub_21CB45550(v7, 1, 0, 0xE000000000000000, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = MEMORY[0x263F8EE88];
  a1[4] = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  a1[7] = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB4227C(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v150 = a2;
  int v6 = a3 & 1;
  uint64_t v7 = type metadata accessor for FMFLocation();
  uint64_t v161 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v157 = (void *)((char *)v146 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v160 = (uint64_t)v146 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v159 = (uint64_t)v146 - v13;
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v146 - v14;
  int v151 = v6;
  uint64_t v163 = v3;
  sub_21CB3E4AC(a1, v6);
  unint64_t v16 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_162;
  }
  uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v164 = v17;
    unint64_t v165 = a1;
    int64_t v148 = v17 & ~(v17 >> 63);
    if (!v17) {
      goto LABEL_12;
    }
    v175[0] = MEMORY[0x263F8EE78];
    uint64_t result = sub_21CA45524(0, v17 & ~(v17 >> 63), 0);
    if (v164 < 0) {
      break;
    }
    uint64_t v20 = 0;
    uint64_t v18 = v175[0];
    unint64_t v21 = a1 & 0xC000000000000001;
    do
    {
      uint64_t v22 = v18;
      if (v21) {
        id v23 = (id)MEMORY[0x21D4B5CA0](v20, a1);
      }
      else {
        id v23 = *(id *)(a1 + 8 * v20 + 32);
      }
      uint64_t v24 = v23;
      id v25 = objc_msgSend(v23, sel_findMyId);
      uint64_t v26 = sub_21CB882F0();
      uint64_t v28 = v27;

      uint64_t v18 = v22;
      v175[0] = v22;
      unint64_t v29 = *(void *)(v22 + 16);
      unint64_t v30 = *(void *)(v18 + 24);
      if (v29 >= v30 >> 1)
      {
        sub_21CA45524(v30 > 1, v29 + 1, 1);
        uint64_t v18 = v175[0];
      }
      ++v20;
      *(void *)(v18 + 16) = v29 + 1;
      uint64_t v31 = v18 + 16 * v29;
      *(void *)(v31 + 32) = v26;
      *(void *)(v31 + 40) = v28;
      a1 = v165;
    }
    while (v164 != v20);
LABEL_12:
    uint64_t v32 = v18;
    char v33 = v151;
    sub_21CB3D32C(v18, v151);
    uint64_t v149 = v32;
    sub_21CB3DED8(v32, v33);
    if (v16)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_21CB88D10();
    }
    else
    {
      uint64_t v34 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v35 = v34;
    }
    if (v35)
    {
      unint64_t v156 = a1 & 0xC000000000000001;
      uint64_t v155 = v35;
      v154 = (uint64_t *)(v163 + 104);
      swift_beginAccess();
      unint64_t v36 = 0;
      unint64_t v37 = a1;
      a1 = 0;
      uint64_t v153 = v37 & 0xFFFFFFFFFFFFFF8;
      unint64_t v152 = v37 + 32;
      while (1)
      {
        if (v156)
        {
          id v39 = (id)MEMORY[0x21D4B5CA0](v36, v165);
        }
        else
        {
          if (v36 >= *(void *)(v153 + 16)) {
            goto LABEL_158;
          }
          id v39 = *(id *)(v152 + 8 * v36);
        }
        uint64_t v40 = v39;
        BOOL v41 = __OFADD__(v36, 1);
        unint64_t v42 = v36 + 1;
        if (v41) {
          goto LABEL_157;
        }
        unint64_t v162 = v42;
        if (objc_msgSend(v39, sel_publishReason) == (id)6)
        {
          id v43 = objc_msgSend(v40, sel_findMyId);
          uint64_t v44 = sub_21CB882F0();
          uint64_t v46 = v45;

          uint64_t v47 = *v154;
          if (!*(void *)(*v154 + 16))
          {

            goto LABEL_98;
          }
          swift_bridgeObjectRetain();
          unint64_t v48 = sub_21CA5BCE0(v44, v46);
          if ((v49 & 1) == 0)
          {

            swift_bridgeObjectRelease();
LABEL_98:
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          id v38 = *(id *)(*(void *)(v47 + 56) + 8 * v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          objc_msgSend(v38, sel_invalidate);
        }
        else if (objc_msgSend(v40, (SEL)&selRef_setLocalizedDateFormatFromTemplate_ + 2) == (id)7)
        {
          uint64_t v50 = *(void *)(v163 + 56);
          uint64_t v51 = *(void *)(v50 + 56);
          uint64_t v166 = v50 + 56;
          uint64_t v52 = 1 << *(unsigned char *)(v50 + 32);
          if (v52 < 64) {
            uint64_t v53 = ~(-1 << v52);
          }
          else {
            uint64_t v53 = -1;
          }
          unint64_t v54 = v53 & v51;
          int64_t v167 = (unint64_t)(v52 + 63) >> 6;
          uint64_t v171 = v50;
          swift_bridgeObjectRetain();
          unint64_t v55 = 0;
          int64_t v56 = 0;
          v169 = v40;
          int v170 = v4;
          if (v54)
          {
LABEL_34:
            unint64_t v57 = __clz(__rbit64(v54));
            uint64_t v58 = (v54 - 1) & v54;
            unint64_t v59 = v57 | (v56 << 6);
            unint64_t v60 = v55 + 1;
            if (!__OFADD__(v55, 1)) {
              goto LABEL_52;
            }
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
            goto LABEL_159;
          }
          while (1)
          {
            BOOL v41 = __OFADD__(v56++, 1);
            if (v41) {
              goto LABEL_156;
            }
            if (v56 >= v167) {
              goto LABEL_96;
            }
            unint64_t v61 = *(void *)(v166 + 8 * v56);
            if (!v61)
            {
              int64_t v62 = v56 + 1;
              if (v56 + 1 >= v167) {
                goto LABEL_96;
              }
              unint64_t v61 = *(void *)(v166 + 8 * v62);
              if (!v61)
              {
                int64_t v62 = v56 + 2;
                if (v56 + 2 >= v167) {
                  goto LABEL_96;
                }
                unint64_t v61 = *(void *)(v166 + 8 * v62);
                if (!v61)
                {
                  int64_t v62 = v56 + 3;
                  if (v56 + 3 >= v167) {
                    goto LABEL_96;
                  }
                  unint64_t v61 = *(void *)(v166 + 8 * v62);
                  if (!v61)
                  {
                    int64_t v62 = v56 + 4;
                    if (v56 + 4 >= v167) {
                      goto LABEL_96;
                    }
                    unint64_t v61 = *(void *)(v166 + 8 * v62);
                    if (!v61)
                    {
                      int64_t v62 = v56 + 5;
                      if (v56 + 5 >= v167)
                      {
LABEL_96:

                        swift_release();
                        goto LABEL_19;
                      }
                      unint64_t v61 = *(void *)(v166 + 8 * v62);
                      if (!v61)
                      {
                        while (1)
                        {
                          int64_t v56 = v62 + 1;
                          if (__OFADD__(v62, 1)) {
                            goto LABEL_160;
                          }
                          if (v56 >= v167) {
                            goto LABEL_96;
                          }
                          unint64_t v61 = *(void *)(v166 + 8 * v56);
                          ++v62;
                          if (v61) {
                            goto LABEL_51;
                          }
                        }
                      }
                    }
                  }
                }
              }
              int64_t v56 = v62;
            }
LABEL_51:
            uint64_t v58 = (v61 - 1) & v61;
            unint64_t v59 = __clz(__rbit64(v61)) + (v56 << 6);
            unint64_t v60 = v55 + 1;
            if (__OFADD__(v55, 1)) {
              goto LABEL_155;
            }
LABEL_52:
            unint64_t v172 = v60;
            unint64_t v173 = v58;
            unint64_t v168 = v55;
            uint64_t v174 = v56;
            uint64_t v63 = *(void *)(v171 + 48) + 24 * v59;
            uint64_t v64 = *(void *)v63;
            uint64_t v65 = *(void *)(v63 + 8);
            unint64_t v16 = *(unsigned __int8 *)(v63 + 16);
            int v66 = *(unsigned __int8 *)(v63 + 17);
            int v67 = *(unsigned __int8 *)(v63 + 18);
            swift_bridgeObjectRetain_n();
            id v68 = objc_msgSend(v40, sel_findMyId);
            uint64_t v69 = sub_21CB882F0();
            uint64_t v71 = v70;

            if (v64 == v69 && v65 == v71)
            {
              uint64_t v74 = swift_bridgeObjectRelease_n();
              LODWORD(v4) = v170;
            }
            else
            {
              char v73 = sub_21CB88F50();
              swift_bridgeObjectRelease();
              uint64_t v74 = swift_bridgeObjectRelease();
              LODWORD(v4) = v170;
              if ((v73 & 1) == 0)
              {
                swift_bridgeObjectRelease();
                unint64_t v55 = v172;
                unint64_t v54 = v173;
                uint64_t v40 = v169;
                int64_t v56 = v174;
                if (v173) {
                  goto LABEL_34;
                }
                continue;
              }
            }
            if (*(unsigned char *)(v163 + 208))
            {
              uint64_t v176 = 0x403E000000000000;
              if (qword_267C949A0 != -1) {
                uint64_t v74 = swift_once();
              }
              MEMORY[0x270FA5388](v74);
              LOBYTE(v146[-2]) = 3;
              v146[-1] = &v176;
              sub_21CB88910();
              double v75 = *(double *)v175;
            }
            else
            {
              double v75 = *(double *)(v163 + 200);
            }
            if (v66) {
              int v76 = 256;
            }
            else {
              int v76 = 0;
            }
            int v77 = v158 & 0xFF000000 | v16 | v76;
            if (v67) {
              int v78 = 0x10000;
            }
            else {
              int v78 = 0;
            }
            int v158 = v77 | v78;
            sub_21CB49D64(v64, v65, v77 | v78, 1, v75);
            uint64_t v40 = v169;
            if ((v16 | v66) == 1)
            {
              unint64_t v16 = *(void *)(v163 + 56);
              uint64_t v79 = *(void *)(v16 + 16);
              if (v79)
              {
                sub_21CA57E34(&qword_267C952B8);
                char v80 = (void *)swift_allocObject();
                size_t v81 = j__malloc_size(v80);
                v80[2] = v79;
                v80[3] = 2 * ((uint64_t)(v81 - 32) / 24);
                uint64_t v82 = sub_21CB4D2B4((uint64_t)v175, (uint64_t)(v80 + 4), v79, v16);
                uint64_t v147 = v175[2];
                v146[2] = v175[3];
                v146[1] = v175[4];
                swift_bridgeObjectRetain_n();
                uint64_t result = sub_21CA7CFF0();
                if (v82 != v79) {
                  goto LABEL_166;
                }
                swift_bridgeObjectRelease();
                LODWORD(v4) = v170;
              }
              else
              {
                char v80 = (void *)MEMORY[0x263F8EE78];
              }
              uint64_t result = swift_isUniquelyReferenced_nonNull_native();
              if ((result & 1) == 0)
              {
                uint64_t result = (uint64_t)sub_21CB4C38C(v80);
                char v80 = (void *)result;
              }
              if (v168 >= v80[2]) {
                goto LABEL_165;
              }
              uint64_t v83 = &v80[3 * v168];
              v83[4] = v64;
              v83[5] = v65;
              *((_WORD *)v83 + 24) = 0;
              *((unsigned char *)v83 + 50) = 1;
              swift_bridgeObjectRelease();
              uint64_t v84 = v80[2];
              sub_21CB4D4D4();
              uint64_t v176 = sub_21CB88750();
              uint64_t v147 = (uint64_t)v80;
              if (v84)
              {
                unint64_t v16 = (unint64_t)v80 + 50;
                do
                {
                  uint64_t v85 = *(void *)(v16 - 18);
                  uint64_t v86 = *(void *)(v16 - 10);
                  int v87 = *(unsigned __int8 *)(v16 - 2);
                  int v88 = *(unsigned __int8 *)(v16 - 1);
                  int v90 = *(unsigned __int8 *)v16;
                  v16 += 24;
                  int v89 = v90;
                  int v91 = v4 & 0xFF000000 | v87;
                  if (v88) {
                    int v92 = 256;
                  }
                  else {
                    int v92 = 0;
                  }
                  int v93 = v91 | v92;
                  if (v89) {
                    int v94 = 0x10000;
                  }
                  else {
                    int v94 = 0;
                  }
                  LODWORD(v4) = v93 | v94;
                  swift_bridgeObjectRetain();
                  sub_21CB61C30((uint64_t)v175, v85, v86, v4);
                  swift_bridgeObjectRelease();
                  --v84;
                }
                while (v84);
              }
              swift_bridgeObjectRelease();
              *(void *)(v163 + 56) = v176;
              swift_bridgeObjectRelease();
              uint64_t v40 = v169;
              unint64_t v54 = v173;
              int64_t v56 = v174;
              unint64_t v55 = v172;
              int v170 = v4;
              if (v173) {
                goto LABEL_34;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              unint64_t v54 = v173;
              int64_t v56 = v174;
              unint64_t v55 = v172;
              if (v173) {
                goto LABEL_34;
              }
            }
          }
        }

LABEL_19:
        unint64_t v36 = v162;
        if (v162 == v155)
        {
          swift_bridgeObjectRelease();
          goto LABEL_101;
        }
      }
    }
    swift_bridgeObjectRelease();
    a1 = 0;
LABEL_101:
    uint64_t v95 = MEMORY[0x263F8EE78];
    if (v164)
    {
      v175[0] = MEMORY[0x263F8EE78];
      uint64_t result = sub_21CA3D644(0, v148, 0);
      if (v164 < 0) {
        goto LABEL_164;
      }
      uint64_t v96 = 0;
      uint64_t v95 = v175[0];
      unint64_t v97 = v165 & 0xC000000000000001;
      do
      {
        if (v97) {
          id v98 = (id)MEMORY[0x21D4B5CA0](v96, v165);
        }
        else {
          id v98 = *(id *)(v165 + 8 * v96 + 32);
        }
        sub_21CA90D4C(v98, (uint64_t)v15);
        v175[0] = v95;
        unint64_t v100 = *(void *)(v95 + 16);
        unint64_t v99 = *(void *)(v95 + 24);
        if (v100 >= v99 >> 1)
        {
          sub_21CA3D644(v99 > 1, v100 + 1, 1);
          uint64_t v95 = v175[0];
        }
        ++v96;
        *(void *)(v95 + 16) = v100 + 1;
        sub_21CA590D4((uint64_t)v15, v95+ ((*(unsigned __int8 *)(v161 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80))+ *(void *)(v161 + 72) * v100, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      }
      while (v164 != v96);
    }
    uint64_t v101 = swift_allocObject();
    *(void *)(v101 + 16) = v95;
    uint64_t v102 = v150;
    if (!v150 || v151)
    {
      swift_bridgeObjectRelease();
LABEL_141:
      uint64_t v123 = *(void *)(v101 + 16);
      int64_t v124 = *(void *)(v123 + 16);
      uint64_t v125 = MEMORY[0x263F8EE78];
      if (v124)
      {
        v175[0] = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_21CA7C0F8(0, v124, 0);
        uint64_t v126 = *(unsigned __int8 *)(v161 + 80);
        uint64_t v174 = v123;
        uint64_t v127 = v123 + ((v126 + 32) & ~v126);
        uint64_t v128 = *(void *)(v161 + 72);
        uint64_t v125 = v175[0];
        do
        {
          uint64_t v129 = v157;
          sub_21CA570B0(v127, (uint64_t)v157, (uint64_t (*)(void))type metadata accessor for FMFLocation);
          uint64_t v131 = *v129;
          uint64_t v130 = v129[1];
          swift_bridgeObjectRetain();
          sub_21CA581B8((uint64_t)v129, (uint64_t (*)(void))type metadata accessor for FMFLocation);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21CA7C0F8(0, *(void *)(v125 + 16) + 1, 1);
            uint64_t v125 = v175[0];
          }
          unint64_t v133 = *(void *)(v125 + 16);
          unint64_t v132 = *(void *)(v125 + 24);
          if (v133 >= v132 >> 1)
          {
            sub_21CA7C0F8(v132 > 1, v133 + 1, 1);
            uint64_t v125 = v175[0];
          }
          *(void *)(v125 + 16) = v133 + 1;
          uint64_t v134 = v125 + 16 * v133;
          *(void *)(v134 + 32) = v131;
          *(void *)(v134 + 40) = v130;
          v127 += v128;
          --v124;
        }
        while (v124);
        swift_bridgeObjectRelease();
      }
      swift_retain();
      uint64_t v135 = sub_21CB2295C(v125);
      unint64_t v137 = v136;
      swift_bridgeObjectRelease();
      swift_release();
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v138 = sub_21CB880A0();
      sub_21CA4CC18(v138, (uint64_t)qword_267CA5368);
      swift_bridgeObjectRetain();
      v139 = sub_21CB88070();
      os_log_type_t v140 = sub_21CB88880();
      if (os_log_type_enabled(v139, v140))
      {
        v141 = (uint8_t *)swift_slowAlloc();
        uint64_t v142 = swift_slowAlloc();
        v175[0] = v142;
        *(_DWORD *)v141 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v176 = sub_21CA4E450(v135, v137, v175);
        sub_21CB889C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21CA00000, v139, v140, "👀 FMFSecureLocCtrl: shifting locations for %s", v141, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v142, -1, -1);
        MEMORY[0x21D4B6B70](v141, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v143 = v163;
      uint64_t v144 = *(void *)(v101 + 16);
      uint64_t v145 = swift_allocObject();
      *(void *)(v145 + 16) = v143;
      *(void *)(v145 + 24) = v101;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_21CA2B814(v144, (uint64_t)sub_21CB4E538, v145);
      swift_release();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    swift_bridgeObjectRetain();
    uint64_t v103 = sub_21CA5893C(v149);
    swift_bridgeObjectRelease();
    v175[0] = v102;
    sub_21CB4CC60(v103);
    int64_t v104 = 0;
    uint64_t v105 = v175[0];
    uint64_t v106 = *(void *)(v175[0] + 56);
    uint64_t v174 = v175[0] + 56;
    uint64_t v107 = 1 << *(unsigned char *)(v175[0] + 32);
    uint64_t v108 = -1;
    if (v107 < 64) {
      uint64_t v108 = ~(-1 << v107);
    }
    unint64_t v16 = v108 & v106;
    int64_t v4 = (unint64_t)(v107 + 63) >> 6;
    if ((v108 & v106) != 0)
    {
LABEL_115:
      unint64_t v109 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v110 = v109 | (v104 << 6);
      goto LABEL_127;
    }
    while (1)
    {
      BOOL v41 = __OFADD__(v104++, 1);
      if (v41) {
        break;
      }
      if (v104 >= v4) {
        goto LABEL_140;
      }
      unint64_t v111 = *(void *)(v174 + 8 * v104);
      if (!v111)
      {
        int64_t v112 = v104 + 1;
        if (v104 + 1 >= v4) {
          goto LABEL_140;
        }
        unint64_t v111 = *(void *)(v174 + 8 * v112);
        if (!v111)
        {
          int64_t v112 = v104 + 2;
          if (v104 + 2 >= v4) {
            goto LABEL_140;
          }
          unint64_t v111 = *(void *)(v174 + 8 * v112);
          if (!v111)
          {
            int64_t v112 = v104 + 3;
            if (v104 + 3 >= v4)
            {
LABEL_140:
              swift_release();
              goto LABEL_141;
            }
            unint64_t v111 = *(void *)(v174 + 8 * v112);
            if (!v111)
            {
              while (1)
              {
                int64_t v104 = v112 + 1;
                if (__OFADD__(v112, 1)) {
                  goto LABEL_161;
                }
                if (v104 >= v4) {
                  goto LABEL_140;
                }
                unint64_t v111 = *(void *)(v174 + 8 * v104);
                ++v112;
                if (v111) {
                  goto LABEL_126;
                }
              }
            }
          }
        }
        int64_t v104 = v112;
      }
LABEL_126:
      unint64_t v16 = (v111 - 1) & v111;
      unint64_t v110 = __clz(__rbit64(v111)) + (v104 << 6);
LABEL_127:
      unint64_t v113 = (uint64_t *)(*(void *)(v105 + 48) + 16 * v110);
      uint64_t v114 = *v113;
      uint64_t v115 = v113[1];
      uint64_t v176 = 0x403E000000000000;
      uint64_t v116 = qword_267C949A0;
      uint64_t v117 = swift_bridgeObjectRetain();
      if (v116 != -1) {
        uint64_t v117 = swift_once();
      }
      id v15 = (char *)v146;
      MEMORY[0x270FA5388](v117);
      LOBYTE(v146[-2]) = 4;
      v146[-1] = &v176;
      sub_21CB88910();
      sub_21CB48A50(v114, v115, 0, *(double *)v175);
      LOBYTE(v175[0]) = 0;
      uint64_t v118 = v159;
      sub_21CA916BC(v114, v115, (char *)v175, 0, v159);
      sub_21CA570B0(v118, v160, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      unint64_t v119 = *(void *)(v101 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v101 + 16) = v119;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v119 = sub_21CA47FB4(0, *(void *)(v119 + 16) + 1, 1, v119);
        *(void *)(v101 + 16) = v119;
      }
      unint64_t v122 = *(void *)(v119 + 16);
      unint64_t v121 = *(void *)(v119 + 24);
      if (v122 >= v121 >> 1)
      {
        unint64_t v119 = sub_21CA47FB4(v121 > 1, v122 + 1, 1, v119);
        *(void *)(v101 + 16) = v119;
      }
      *(void *)(v119 + 16) = v122 + 1;
      sub_21CA590D4(v160, v119+ ((*(unsigned __int8 *)(v161 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80))+ *(void *)(v161 + 72) * v122, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      sub_21CA581B8(v159, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      if (v16) {
        goto LABEL_115;
      }
    }
LABEL_159:
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
LABEL_162:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_21CB88D10();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
  return result;
}

uint64_t sub_21CB43478()
{
  int64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  int64_t v3 = v2;
  if (!v1)
  {
    int64_t v6 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_26;
    }
    int64_t v7 = (unint64_t)(v0[2] + 64) >> 6;
    if (v6 < v7)
    {
      uint64_t v8 = v0[1];
      uint64_t v9 = *(void *)(v8 + 8 * v6);
      if (v9)
      {
LABEL_8:
        uint64_t v4 = (v9 - 1) & v9;
        int64_t v3 = v6;
        goto LABEL_3;
      }
      int64_t v10 = v2 + 2;
      int64_t v3 = v2 + 1;
      if (v2 + 2 < v7)
      {
        uint64_t v9 = *(void *)(v8 + 8 * v10);
        if (v9)
        {
LABEL_11:
          int64_t v6 = v10;
          goto LABEL_8;
        }
        int64_t v3 = v2 + 2;
        if (v2 + 3 < v7)
        {
          uint64_t v9 = *(void *)(v8 + 8 * (v2 + 3));
          if (v9)
          {
            int64_t v6 = v2 + 3;
            goto LABEL_8;
          }
          int64_t v10 = v2 + 4;
          int64_t v3 = v2 + 3;
          if (v2 + 4 < v7)
          {
            uint64_t v9 = *(void *)(v8 + 8 * v10);
            if (v9) {
              goto LABEL_11;
            }
            int64_t v6 = v2 + 5;
            int64_t v3 = v2 + 4;
            if (v2 + 5 < v7)
            {
              uint64_t v9 = *(void *)(v8 + 8 * v6);
              if (v9) {
                goto LABEL_8;
              }
              int64_t v3 = v7 - 1;
              int64_t v11 = v2 + 6;
              while (v7 != v11)
              {
                uint64_t v9 = *(void *)(v8 + 8 * v11++);
                if (v9)
                {
                  int64_t v6 = v11 - 1;
                  goto LABEL_8;
                }
              }
            }
          }
        }
      }
    }
    uint64_t v5 = 0;
    v0[3] = v3;
    v0[4] = 0;
    return v5;
  }
  uint64_t v4 = (v1 - 1) & v1;
LABEL_3:
  v0[3] = v3;
  v0[4] = v4;
  uint64_t v5 = v0[5];
  if (!__OFADD__(v5, 1))
  {
    v0[5] = v5 + 1;
    swift_bridgeObjectRetain();
    return v5;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21CB43628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v45 = sub_21CA57E34(&qword_267C959C8);
  uint64_t v4 = *(void *)(v45 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v45);
  int64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = type metadata accessor for FMFLocation();
  uint64_t v44 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21CB88100();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v40 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21CB88150();
  uint64_t v38 = *(void *)(v16 - 8);
  uint64_t v39 = v16;
  MEMORY[0x270FA5388](v16);
  unint64_t v37 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    uint64_t v35 = v14;
    uint64_t v36 = v13;
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21CA3D644(0, v18, 0);
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v43 = *(void *)(v4 + 72);
    uint64_t v20 = aBlock[0];
    do
    {
      sub_21CA24E80(v19, (uint64_t)v9, &qword_267C959C8);
      uint64_t v21 = *(int *)(v45 + 48);
      uint64_t v22 = (uint64_t)&v7[v21];
      uint64_t v23 = (uint64_t)&v9[v21];
      sub_21CA570B0((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      sub_21CA24E80(v23, v22, (uint64_t *)&unk_267C96EF0);
      sub_21CA590D4((uint64_t)v7, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      sub_21CA1B88C(v22, (uint64_t *)&unk_267C96EF0);
      sub_21CA1B88C((uint64_t)v9, &qword_267C959C8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21CA3D644(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v20 = aBlock[0];
      }
      unint64_t v25 = *(void *)(v20 + 16);
      unint64_t v24 = *(void *)(v20 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_21CA3D644(v24 > 1, v25 + 1, 1);
        uint64_t v20 = aBlock[0];
      }
      *(void *)(v20 + 16) = v25 + 1;
      sub_21CA590D4((uint64_t)v12, v20+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(void *)(v44 + 72) * v25, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      v19 += v43;
      --v18;
    }
    while (v18);
    uint64_t v14 = v35;
    uint64_t v13 = v36;
    uint64_t v26 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v26 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  uint64_t v27 = v41;
  uint64_t v28 = *(void **)(v41 + 136);
  unint64_t v29 = (void *)swift_allocObject();
  v29[2] = v27;
  v29[3] = v20;
  v29[4] = v42;
  aBlock[4] = sub_21CB4E5C0;
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD706F8;
  unint64_t v30 = _Block_copy(aBlock);
  id v31 = v28;
  swift_retain();
  swift_retain();
  uint64_t v32 = v37;
  sub_21CB88120();
  uint64_t v46 = v26;
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  char v33 = v40;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v32, v33, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v33, v13);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v32, v39);
  return swift_release();
}

uint64_t sub_21CB43B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a1;
  uint64_t v39 = a3;
  uint64_t v4 = type metadata accessor for FMFLocation();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  int64_t v7 = (uint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_21CB88100();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v44 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21CB88150();
  uint64_t v42 = *(void *)(v11 - 8);
  uint64_t v43 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v41 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v13 = *(void *)(a2 + 16);
  uint64_t v40 = a2;
  if (v13)
  {
    uint64_t v36 = v9;
    uint64_t v37 = v8;
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21CA7C0F8(0, v13, 0);
    uint64_t v14 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v15 = *(void *)(v5 + 72);
    uint64_t v16 = aBlock[0];
    do
    {
      sub_21CA570B0(v14, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      uint64_t v18 = *v7;
      uint64_t v17 = v7[1];
      swift_bridgeObjectRetain();
      sub_21CA581B8((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FMFLocation);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21CA7C0F8(0, *(void *)(v16 + 16) + 1, 1);
        uint64_t v16 = aBlock[0];
      }
      unint64_t v20 = *(void *)(v16 + 16);
      unint64_t v19 = *(void *)(v16 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_21CA7C0F8(v19 > 1, v20 + 1, 1);
        uint64_t v16 = aBlock[0];
      }
      *(void *)(v16 + 16) = v20 + 1;
      uint64_t v21 = v16 + 16 * v20;
      *(void *)(v21 + 32) = v18;
      *(void *)(v21 + 40) = v17;
      v14 += v15;
      --v13;
    }
    while (v13);
    uint64_t v9 = v36;
    uint64_t v8 = v37;
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  uint64_t v23 = v38;
  swift_retain();
  uint64_t v24 = sub_21CB2295C(v16);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v27 = *(void **)(v23 + 144);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = v24;
  v28[3] = v26;
  uint64_t v30 = v39;
  uint64_t v29 = v40;
  v28[4] = v23;
  v28[5] = v30;
  v28[6] = v29;
  aBlock[4] = sub_21CB4E61C;
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  aBlock[3] = &unk_26CD70748;
  id v31 = _Block_copy(aBlock);
  id v32 = v27;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  char v33 = v41;
  sub_21CB88120();
  uint64_t v45 = v22;
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v34 = v44;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v33, v34, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v34, v8);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v43);
  return swift_release();
}

uint64_t sub_21CB44020(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_21CB880A0();
  sub_21CA4CC18(v9, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_21CB88070();
  os_log_type_t v11 = sub_21CB88880();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v17 = a5;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v18[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    sub_21CA4E450(a1, a2, v18);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v10, v11, "👀 FMFSecureLocCtrl: telling FMFManager we got locations for %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v13, -1, -1);
    uint64_t v14 = v12;
    a5 = v17;
    MEMORY[0x21D4B6B70](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t result = MEMORY[0x21D4B6C80](a3 + 168);
  if (result)
  {
    swift_beginAccess();
    uint64_t v16 = swift_bridgeObjectRetain();
    sub_21CB16524(v16, a5);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21CB44230(uint64_t result, char a2, uint64_t a3, unint64_t a4)
{
  if (*(void *)(result + 16))
  {
    uint64_t v5 = v4;
    uint64_t v8 = result;
    int v45 = a2 & 1;
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = sub_21CA4D61C(v9);
    swift_bridgeObjectRelease();
    uint64_t v44 = (uint64_t)v10;
    uint64_t v11 = sub_21CB3D1EC((uint64_t)v10);
    swift_retain();
    uint64_t v42 = sub_21CB2295C(v11);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_21CB880A0();
    sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_21CB88070();
    os_log_type_t v16 = sub_21CB88880();
    uint64_t v43 = v8;
    uint64_t v41 = v5;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      aBlock[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v47 = (void *)sub_21CA4E450(a3, a4, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2080;
      LOBYTE(v47) = v45;
      uint64_t v19 = sub_21CB88310();
      uint64_t v47 = (void *)sub_21CA4E450(v19, v20, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v47 = (void *)sub_21CA4E450(v42, v13, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v15, v16, "👀 FMFSecureLocCtrl: %sregistering subscription %s for %s", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v18, -1, -1);
      uint64_t v21 = v17;
      uint64_t v5 = v41;
      MEMORY[0x21D4B6B70](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F66180]), sel_init);
    swift_bridgeObjectRetain();
    uint64_t v23 = (void *)sub_21CB882C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setClientApp_, v23);

    if (v45)
    {
      objc_msgSend(v22, sel_setSubscriptionMode_, 2);
      sub_21CA57E34(&qword_267C94E60);
      uint64_t v24 = (void *)sub_21CB881E0();
      objc_msgSend(v22, sel_setPushIdentifiers_, v24);
    }
    else
    {
      objc_msgSend(v22, sel_setSubscriptionMode_, 1);
    }
    uint64_t v47 = (void *)MEMORY[0x263F8EE78];
    swift_retain();
    id v25 = v22;
    sub_21CB4D870(v43, v5, &v47, v45, v25);
    swift_release();

    if (v47[2])
    {
      uint64_t v26 = swift_bridgeObjectRetain();
      sub_21CB3CABC(v26, v45);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_21CB88070();
    os_log_type_t v28 = sub_21CB88880();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      id v40 = v25;
      uint64_t v30 = swift_slowAlloc();
      aBlock[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v31 = sub_21CB88310();
      sub_21CA4E450(v31, v32, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21CA4E450(v42, v13, aBlock);
      uint64_t v5 = v41;
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v27, v28, "👀 FMFSecureLocCtrl: calling SPSecureLocMgr.subscribe %s for %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      uint64_t v33 = v30;
      id v25 = v40;
      MEMORY[0x21D4B6B70](v33, -1, -1);
      MEMORY[0x21D4B6B70](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v34 = *(id *)(v5 + 24);
    uint64_t v35 = (void *)sub_21CB884F0();
    uint64_t v36 = swift_allocObject();
    swift_weakInit();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v36;
    *(unsigned char *)(v37 + 24) = v45;
    *(void *)(v37 + 32) = v42;
    *(void *)(v37 + 40) = v13;
    *(void *)(v37 + 48) = v44;
    *(void *)(v37 + 56) = v43;
    aBlock[4] = (uint64_t)sub_21CB4E444;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CB454C4;
    aBlock[3] = (uint64_t)&unk_26CD70608;
    uint64_t v38 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v34, sel_subscribeAndFetchLocationForIds_context_completion_, v35, v25, v38);
    _Block_release(v38);

    if (!v45)
    {
      if (qword_267C949A0 != -1) {
        uint64_t v39 = swift_once();
      }
      MEMORY[0x270FA5388](v39);
      sub_21CB88910();
      sub_21CB47A84(v44, 0, *(double *)aBlock);
    }
    swift_release();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_21CB449E0(uint64_t *a1, uint64_t a2, void **a3, char a4, void *a5)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  swift_retain();
  BOOL v10 = sub_21CB2224C(v9, v8);
  swift_release();
  if (v10)
  {
    uint64_t v11 = *a3;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v11 = sub_21CAC7864(0, v11[2] + 1, 1, v11);
      *a3 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      uint64_t v11 = sub_21CAC7864((void *)(v13 > 1), v14 + 1, 1, v11);
      *a3 = v11;
    }
    v11[2] = v14 + 1;
    uint64_t v15 = &v11[2 * v14];
    v15[4] = v9;
    v15[5] = v8;
  }
  if (a4)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v16 = sub_21CB21CDC(v9, v8);
    swift_release();
    id v17 = objc_msgSend(a5, sel_pushIdentifiers);
    sub_21CA57E34(&qword_267C94E60);
    sub_21CB88200();

    if (v16)
    {
      char v18 = swift_isUniquelyReferenced_nonNull_native();
      sub_21CB8472C(v16, v9, v8, v18);
    }
    else
    {
      sub_21CB80DDC(v9, v8);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v19 = (void *)sub_21CB881E0();
    swift_bridgeObjectRelease();
    objc_msgSend(a5, sel_setPushIdentifiers_, v19);
  }
}

uint64_t sub_21CB44C24(void *a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = a6;
  uint64_t v36 = a8;
  uint64_t v34 = a5;
  uint64_t v12 = sub_21CB88100();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21CB88150();
  uint64_t v37 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v20 = result;
    uint64_t v32 = v13;
    uint64_t v33 = v16;
    uint64_t v21 = *(void **)(result + 136);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v20;
    *(unsigned char *)(v22 + 24) = a4 & 1;
    uint64_t v23 = v34;
    uint64_t v24 = v35;
    *(void *)(v22 + 32) = a2;
    *(void *)(v22 + 40) = v23;
    *(void *)(v22 + 48) = v24;
    *(void *)(v22 + 56) = a7;
    uint64_t v34 = v12;
    *(void *)(v22 + 64) = v36;
    *(void *)(v22 + 72) = a1;
    aBlock[4] = sub_21CB4E4B8;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_21CA1B084;
    aBlock[3] = &unk_26CD70658;
    id v25 = _Block_copy(aBlock);
    id v31 = v21;
    swift_retain();
    id v26 = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v27 = a1;
    sub_21CB88120();
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    uint64_t v28 = v34;
    sub_21CB88A60();
    uint64_t v29 = v31;
    MEMORY[0x21D4B5A20](0, v18, v15, v25);
    _Block_release(v25);
    swift_release();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v28);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v33);
    return swift_release();
  }
  return result;
}

void sub_21CB44F7C(uint64_t a1, char a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  int v14 = a2 & 1;
  sub_21CB4889C();
  if (a3)
  {
    id v15 = a3;
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_21CB880A0();
    sub_21CA4CC18(v16, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain();
    id v17 = a3;
    swift_bridgeObjectRetain();
    id v18 = a3;
    uint64_t v19 = sub_21CB88070();
    os_log_type_t v20 = sub_21CB88880();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v37 = a4;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v38 = v35;
      *(_DWORD *)uint64_t v21 = 136315650;
      uint64_t v22 = sub_21CB88310();
      sub_21CA4E450(v22, v23, &v38);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21CA4E450(v37, a5, &v38);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v24 = sub_21CB89000();
      sub_21CA4E450(v24, v25, &v38);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v19, v20, "👀 FMFSecureLocCtrl: failed SPSecureLocMgr.subscribe %s for %s: %s", (uint8_t *)v21, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v35, -1, -1);
      MEMORY[0x21D4B6B70](v21, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    sub_21CB46858(v14, 15.0);
    sub_21CB3D32C(a6, v14);
    sub_21CB4227C(MEMORY[0x263F8EE78], a7, v14);
    if (!v14) {
      sub_21CB3D930(a6, 0);
    }
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_21CB880A0();
    sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain_n();
    id v27 = sub_21CB88070();
    os_log_type_t v28 = sub_21CB88880();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v38 = v36;
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v30 = sub_21CB88310();
      sub_21CA4E450(v30, v31, &v38);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21CA4E450(a4, a5, &v38);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v27, v28, "👀 FMFSecureLocCtrl: succeeded SPSecureLocMgr.subscribe %s for %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v36, -1, -1);
      MEMORY[0x21D4B6B70](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v32 = objc_msgSend(a8, sel_locations);
    sub_21CA05908(0, &qword_267C95D58);
    unint64_t v33 = sub_21CB88510();

    objc_msgSend(a8, sel_expiresIn);
    sub_21CB46858(v14, v34);
    sub_21CB4227C(v33, a7, v14);
    swift_bridgeObjectRelease();
  }
}

void sub_21CB454C4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

void sub_21CB45550(char *a1, char a2, uint64_t a3, uint64_t a4, char *a5, int64_t a6)
{
  uint64_t isUniquelyReferenced_nonNull_native = v6;
  uint64_t v111 = a3;
  int64_t v112 = a5;
  LODWORD(v11) = a2 & 1;
  uint64_t v12 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v105 = (uint64_t)v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = type metadata accessor for FMFFriend();
  uint64_t v101 = *(void *)(v104 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v104);
  uint64_t v16 = (char *)v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v99 = (uint64_t)v95 - v17;
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_21CA4D61C(v18);
  uint64_t v107 = a1;
  swift_bridgeObjectRelease();
  unint64_t v97 = v19;
  uint64_t v20 = sub_21CB3D1EC((uint64_t)v19);
  swift_retain();
  uint64_t v21 = sub_21CB2295C(v20);
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    goto LABEL_97;
  }
LABEL_2:
  uint64_t v24 = sub_21CB880A0();
  uint64_t v25 = sub_21CA4CC18(v24, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v95[1] = v25;
  uint64_t v26 = sub_21CB88070();
  os_log_type_t v27 = sub_21CB88880();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v100 = isUniquelyReferenced_nonNull_native;
  int v106 = v11;
  unint64_t v98 = v23;
  uint64_t v96 = v21;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    int64_t v110 = a6;
    uint64_t v30 = v29;
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)uint64_t v30 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v113 = sub_21CA4E450(v111, a4, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2080;
    LOBYTE(v113) = v106;
    uint64_t v31 = sub_21CB88310();
    uint64_t v113 = sub_21CA4E450(v31, v32, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 22) = 2080;
    uint64_t isUniquelyReferenced_nonNull_native = v100;
    swift_bridgeObjectRetain();
    uint64_t v113 = sub_21CA4E450(v21, v98, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v26, v27, "👀 FMFSecureLocCtrl: %sunregistering subscription %s for %s", (uint8_t *)v30, 0x20u);
    swift_arrayDestroy();
    uint64_t v33 = v11;
    LODWORD(v11) = v106;
    MEMORY[0x21D4B6B70](v33, -1, -1);
    MEMORY[0x21D4B6B70](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v21 = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F66180]), sel_init);
  swift_bridgeObjectRetain();
  double v34 = (void *)sub_21CB882C0();
  swift_bridgeObjectRelease();
  objc_msgSend((id)v21, sel_setClientApp_, v34);

  if (v11)
  {
    objc_msgSend((id)v21, sel_setSubscriptionMode_, 2);
    sub_21CA57E34(&qword_267C94E60);
    uint64_t v35 = (void *)sub_21CB881E0();
    objc_msgSend((id)v21, sel_setPushIdentifiers_, v35);
  }
  else
  {
    objc_msgSend((id)v21, sel_setSubscriptionMode_, 1);
  }
  uint64_t v36 = *((void *)v107 + 7);
  int64_t v112 = v107 + 56;
  uint64_t v37 = 1 << v107[32];
  uint64_t v38 = -1;
  if (v37 < 64) {
    uint64_t v38 = ~(-1 << v37);
  }
  a4 = v38 & v36;
  int64_t v108 = (unint64_t)(v37 + 63) >> 6;
  uint64_t v102 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48);
  uint64_t v103 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v101 + 56);
  swift_bridgeObjectRetain();
  a6 = 0;
  unint64_t v23 = 0;
  id v109 = (id)v21;
  while (1)
  {
    while (a4)
    {
      unint64_t v41 = __clz(__rbit64(a4));
      a4 &= a4 - 1;
      unint64_t v42 = v41 | (a6 << 6);
      if (v11)
      {
LABEL_33:
        int64_t v110 = a6;
        uint64_t v111 = a4;
        uint64_t v46 = (uint64_t *)(*((void *)v107 + 6) + 16 * v42);
        uint64_t v11 = *v46;
        uint64_t v47 = v46[1];
        swift_bridgeObjectRetain_n();
        swift_retain();
        sub_21CA57E34(&qword_267C95D50);
        sub_21CB88910();
        uint64_t v48 = *(void *)(aBlock[0] + 16);
        if (v48)
        {
          uint64_t v49 = v101;
          uint64_t v50 = aBlock[0]
              + ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80));
          swift_bridgeObjectRetain();
          uint64_t v51 = *(void *)(v49 + 72);
          while (1)
          {
            sub_21CA570B0(v50, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for FMFFriend);
            BOOL v52 = v11 == *(void *)v16 && v47 == *((void *)v16 + 1);
            if (v52 || (sub_21CB88F50() & 1) != 0) {
              break;
            }
            sub_21CA581B8((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for FMFFriend);
            v50 += v51;
            if (!--v48)
            {
              swift_bridgeObjectRelease();
              uint64_t v53 = 1;
              uint64_t v21 = (uint64_t)v109;
              goto LABEL_44;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v54 = v105;
          sub_21CA590D4((uint64_t)v16, v105, (uint64_t (*)(void))type metadata accessor for FMFFriend);
          uint64_t v53 = 0;
          uint64_t v21 = (uint64_t)v109;
        }
        else
        {
          uint64_t v53 = 1;
LABEL_44:
          uint64_t v54 = v105;
        }
        uint64_t v55 = v104;
        (*v103)(v54, v53, 1, v104);
        swift_bridgeObjectRelease();
        if ((*v102)(v54, 1, v55) == 1)
        {
          sub_21CA1B88C(v54, &qword_267C96F10);
          a6 = 0;
        }
        else
        {
          uint64_t v56 = v54;
          uint64_t v57 = v99;
          sub_21CA590D4(v56, v99, (uint64_t (*)(void))type metadata accessor for FMFFriend);
          a6 = *(void *)(v57 + 40);
          swift_bridgeObjectRetain();
          sub_21CA581B8(v57, (uint64_t (*)(void))type metadata accessor for FMFFriend);
        }
        swift_release();
        id v58 = objc_msgSend((id)v21, sel_pushIdentifiers);
        a4 = sub_21CA57E34(&qword_267C94E60);
        uint64_t v59 = sub_21CB88200();

        if (a6)
        {
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          aBlock[0] = v59;
          uint64_t v21 = sub_21CA5BCE0(v11, v47);
          uint64_t v61 = *(void *)(v59 + 16);
          BOOL v62 = (v60 & 1) == 0;
          uint64_t v63 = v61 + v62;
          if (__OFADD__(v61, v62)) {
            goto LABEL_94;
          }
          char v64 = v60;
          if (*(void *)(v59 + 24) >= v63)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_21CB861C4();
            }
          }
          else
          {
            sub_21CB82A28(v63, isUniquelyReferenced_nonNull_native);
            unint64_t v65 = sub_21CA5BCE0(v11, v47);
            if ((v64 & 1) != (v66 & 1)) {
              goto LABEL_99;
            }
            uint64_t v21 = v65;
          }
          uint64_t isUniquelyReferenced_nonNull_native = v100;
          uint64_t v71 = (void *)aBlock[0];
          if (v64)
          {
            uint64_t v39 = *(void *)(aBlock[0] + 56);
            swift_bridgeObjectRelease();
            *(void *)(v39 + 8 * v21) = a6;
          }
          else
          {
            *(void *)(aBlock[0] + 8 * ((unint64_t)v21 >> 6) + 64) |= 1 << v21;
            uint64_t v72 = (uint64_t *)(v71[6] + 16 * v21);
            *uint64_t v72 = v11;
            v72[1] = v47;
            *(void *)(v71[7] + 8 * v21) = a6;
            uint64_t v73 = v71[2];
            BOOL v43 = __OFADD__(v73, 1);
            uint64_t v74 = v73 + 1;
            if (v43) {
              goto LABEL_95;
            }
            v71[2] = v74;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
LABEL_13:
          swift_bridgeObjectRelease();
          LODWORD(v11) = v106;
          uint64_t v21 = (uint64_t)v109;
          a6 = v110;
          goto LABEL_14;
        }
        swift_bridgeObjectRetain();
        unint64_t v67 = sub_21CA5BCE0(v11, v47);
        char v69 = v68;
        swift_bridgeObjectRelease();
        if ((v69 & 1) == 0) {
          goto LABEL_13;
        }
        char v70 = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = v59;
        LODWORD(v11) = v106;
        a6 = v110;
        if ((v70 & 1) == 0)
        {
          sub_21CB861C4();
          uint64_t v59 = aBlock[0];
        }
        swift_bridgeObjectRelease();
        sub_21CB838B4(v67, v59);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = (uint64_t)v109;
LABEL_14:
        id v40 = (void *)sub_21CB881E0();
        swift_bridgeObjectRelease();
        objc_msgSend((id)v21, sel_setPushIdentifiers_, v40);
        swift_bridgeObjectRelease();

        a4 = v111;
      }
    }
    BOOL v43 = __OFADD__(a6++, 1);
    if (v43)
    {
      __break(1u);
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
      goto LABEL_96;
    }
    if (a6 >= v108) {
      goto LABEL_67;
    }
    unint64_t v44 = *(void *)&v112[8 * a6];
    if (!v44) {
      break;
    }
LABEL_32:
    a4 = (v44 - 1) & v44;
    unint64_t v42 = __clz(__rbit64(v44)) + (a6 << 6);
    if (v11) {
      goto LABEL_33;
    }
  }
  int64_t v45 = a6 + 1;
  if (a6 + 1 >= v108) {
    goto LABEL_67;
  }
  unint64_t v44 = *(void *)&v112[8 * v45];
  if (v44) {
    goto LABEL_31;
  }
  int64_t v45 = a6 + 2;
  if (a6 + 2 >= v108) {
    goto LABEL_67;
  }
  unint64_t v44 = *(void *)&v112[8 * v45];
  if (v44) {
    goto LABEL_31;
  }
  int64_t v45 = a6 + 3;
  if (a6 + 3 >= v108) {
    goto LABEL_67;
  }
  unint64_t v44 = *(void *)&v112[8 * v45];
  if (v44) {
    goto LABEL_31;
  }
  int64_t v45 = a6 + 4;
  if (a6 + 4 >= v108) {
    goto LABEL_67;
  }
  unint64_t v44 = *(void *)&v112[8 * v45];
  if (v44) {
    goto LABEL_31;
  }
  int64_t v45 = a6 + 5;
  if (a6 + 5 >= v108)
  {
LABEL_67:
    uint64_t v16 = v107;
    swift_release();
    unint64_t v75 = v98;
    swift_bridgeObjectRetain_n();
    int v76 = sub_21CB88070();
    os_log_type_t v77 = sub_21CB88880();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = swift_slowAlloc();
      uint64_t v111 = swift_slowAlloc();
      aBlock[0] = v111;
      *(_DWORD *)uint64_t v78 = 136315394;
      LOBYTE(v113) = v11;
      uint64_t v79 = sub_21CB88310();
      uint64_t v113 = sub_21CA4E450(v79, v80, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v78 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v81 = v96;
      uint64_t v113 = sub_21CA4E450(v96, v75, aBlock);
      uint64_t v16 = v107;
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v76, v77, "👀 FMFSecureLocCtrl: calling SPSecureLocMgr.unsubscribe %s for %s", (uint8_t *)v78, 0x16u);
      uint64_t v82 = v111;
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v82, -1, -1);
      MEMORY[0x21D4B6B70](v78, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v81 = v96;
    }
    a4 = (uint64_t)*(id *)(isUniquelyReferenced_nonNull_native + 24);
    uint64_t v83 = (void *)sub_21CB884F0();
    swift_release();
    uint64_t v84 = swift_allocObject();
    *(unsigned char *)(v84 + 16) = v11;
    *(void *)(v84 + 24) = v81;
    *(void *)(v84 + 32) = v75;
    aBlock[4] = (uint64_t)sub_21CB4E3E8;
    aBlock[5] = v84;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CB4F760;
    aBlock[3] = (uint64_t)&unk_26CD705B8;
    uint64_t v85 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend((id)a4, sel_unsubscribeForIds_context_completion_, v83, v109, v85);
    _Block_release(v85);

    sub_21CB47828(v11);
    uint64_t v86 = 1 << v16[32];
    uint64_t v87 = -1;
    if (v86 < 64) {
      uint64_t v87 = ~(-1 << v86);
    }
    a6 = v87 & *((void *)v16 + 7);
    uint64_t v21 = (unint64_t)(v86 + 63) >> 6;
    swift_bridgeObjectRetain();
    uint64_t v88 = 0;
    while (1)
    {
      if (a6)
      {
        unint64_t v89 = __clz(__rbit64(a6));
        a6 &= a6 - 1;
        unint64_t v90 = v89 | (v88 << 6);
      }
      else
      {
        BOOL v43 = __OFADD__(v88++, 1);
        if (v43) {
          goto LABEL_93;
        }
        if (v88 >= v21)
        {
LABEL_91:
          swift_release();
          sub_21CB4889C();

          return;
        }
        unint64_t v93 = *(void *)&v112[8 * v88];
        if (!v93)
        {
          uint64_t v94 = v88 + 1;
          if (v88 + 1 >= v21) {
            goto LABEL_91;
          }
          unint64_t v93 = *(void *)&v112[8 * v94];
          if (!v93)
          {
            uint64_t v94 = v88 + 2;
            if (v88 + 2 >= v21) {
              goto LABEL_91;
            }
            unint64_t v93 = *(void *)&v112[8 * v94];
            if (!v93)
            {
              uint64_t v94 = v88 + 3;
              if (v88 + 3 >= v21) {
                goto LABEL_91;
              }
              unint64_t v93 = *(void *)&v112[8 * v94];
              if (!v93)
              {
                while (1)
                {
                  uint64_t v88 = v94 + 1;
                  if (__OFADD__(v94, 1)) {
                    break;
                  }
                  if (v88 >= v21) {
                    goto LABEL_91;
                  }
                  unint64_t v93 = *(void *)&v112[8 * v88];
                  ++v94;
                  if (v93) {
                    goto LABEL_86;
                  }
                }
LABEL_96:
                __break(1u);
LABEL_97:
                swift_once();
                goto LABEL_2;
              }
            }
          }
          uint64_t v88 = v94;
        }
LABEL_86:
        a6 = (v93 - 1) & v93;
        unint64_t v90 = __clz(__rbit64(v93)) + (v88 << 6);
      }
      int v91 = (uint64_t *)(*((void *)v16 + 6) + 16 * v90);
      a4 = *v91;
      uint64_t v92 = v91[1];
      swift_bridgeObjectRetain();
      sub_21CB49A04(a4, v92);
      swift_bridgeObjectRelease();
    }
  }
  unint64_t v44 = *(void *)&v112[8 * v45];
  if (v44)
  {
LABEL_31:
    a6 = v45;
    goto LABEL_32;
  }
  while (1)
  {
    a6 = v45 + 1;
    if (__OFADD__(v45, 1)) {
      break;
    }
    if (a6 >= v108) {
      goto LABEL_67;
    }
    unint64_t v44 = *(void *)&v112[8 * a6];
    ++v45;
    if (v44) {
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_99:
  sub_21CB88FA0();
  __break(1u);
}

void sub_21CB463DC(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a1)
  {
    id v7 = a1;
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_21CB880A0();
    sub_21CA4CC18(v8, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain();
    id v9 = a1;
    swift_bridgeObjectRetain();
    id v10 = a1;
    oslog = sub_21CB88070();
    os_log_type_t v11 = sub_21CB88880();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v26 = v13;
      *(_DWORD *)uint64_t v12 = 136315650;
      uint64_t v14 = sub_21CB88310();
      sub_21CA4E450(v14, v15, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21CA4E450(a3, a4, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v16 = sub_21CB89000();
      sub_21CA4E450(v16, v17, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, oslog, v11, "👀 FMFSecureLocCtrl: failed SPSecureLocMgr.unsubscribe %s for %s: %s", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v13, -1, -1);
      MEMORY[0x21D4B6B70](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_21CB880A0();
    sub_21CA4CC18(v18, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_21CB88070();
    os_log_type_t v20 = sub_21CB88880();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v23 = sub_21CB88310();
      sub_21CA4E450(v23, v24, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21CA4E450(a3, a4, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v19, v20, "👀 FMFSecureLocCtrl: succeeded SPSecureLocMgr.unsubscribe %s for %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v22, -1, -1);
      MEMORY[0x21D4B6B70](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_21CB46858(char a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21CB88100();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v54 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_21CB88150();
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  id v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v12 = sub_21CB3A4C4(v11);
    uint64_t v10 = sub_21CA5893C(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
  }
  int v13 = a1 & 1;
  uint64_t v14 = sub_21CA4D61C(v10);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_21CB3D1EC((uint64_t)v14);
  swift_release();
  swift_retain();
  uint64_t v58 = sub_21CB2295C(v15);
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_21CB880A0();
  sub_21CA4CC18(v18, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_21CB88070();
  os_log_type_t v20 = sub_21CB88880();
  BOOL v21 = os_log_type_enabled(v19, v20);
  int v59 = v13;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t aBlock = v23;
    *(_DWORD *)uint64_t v22 = 134218498;
    if ((~*(void *)&a2 & 0x7FF0000000000000) != 0)
    {
      if (a2 > -9.22337204e18)
      {
        if (a2 < 9.22337204e18)
        {
          uint64_t v24 = v23;
          uint64_t v67 = (uint64_t)a2;
          sub_21CB889C0();
          *(_WORD *)(v22 + 12) = 2080;
          uint64_t v52 = v3;
          LOBYTE(v67) = v13;
          uint64_t v25 = sub_21CB88310();
          uint64_t v67 = sub_21CA4E450(v25, v26, &aBlock);
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v22 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v67 = sub_21CA4E450(v58, v17, &aBlock);
          uint64_t v3 = v52;
          sub_21CB889C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CA00000, v19, v20, "👀 FMFSecureLocCtrl: setting up %ld-sec %s re-subscription timer for %s)", (uint8_t *)v22, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v24, -1, -1);
          MEMORY[0x21D4B6B70](v22, -1, -1);

          if (a2 <= 0.0) {
            goto LABEL_11;
          }
          goto LABEL_14;
        }
LABEL_21:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }

  swift_bridgeObjectRelease_n();
  if (a2 <= 0.0)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    os_log_type_t v27 = sub_21CB88070();
    os_log_type_t v28 = sub_21CB88880();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t aBlock = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      LOBYTE(v67) = v59;
      uint64_t v31 = sub_21CB88310();
      uint64_t v67 = sub_21CA4E450(v31, v32, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_21CA4E450(v58, v17, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v27, v28, "👀 FMFSecureLocCtrl: discarding (interval too short) %s re-subscription timer for %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v30, -1, -1);
      MEMORY[0x21D4B6B70](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v33 = *(void *)(v3 + 152);
  char v34 = v59;
  if (*(void *)(v33 + 16))
  {
    unint64_t v35 = sub_21CAC957C(v59);
    if (v36) {
      objc_msgSend(*(id *)(*(void *)(v33 + 56) + 8 * v35), sel_invalidate);
    }
  }
  uint64_t v37 = swift_allocObject();
  swift_weakInit();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  *(unsigned char *)(v38 + 24) = v34;
  unint64_t v65 = sub_21CB4E360;
  uint64_t v66 = v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_21CB477C0;
  char v64 = &unk_26CD704C8;
  uint64_t v39 = _Block_copy(&aBlock);
  id v40 = self;
  swift_retain();
  id v41 = objc_msgSend(v40, sel_timerWithTimeInterval_repeats_block_, 0, v39, a2);
  _Block_release(v39);
  swift_release();
  swift_release();
  swift_beginAccess();
  id v42 = v41;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v60 = *(void *)(v3 + 152);
  *(void *)(v3 + 152) = 0x8000000000000000;
  sub_21CB845F4((uint64_t)v42, v34, isUniquelyReferenced_nonNull_native);
  *(void *)(v3 + 152) = v60;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
  unint64_t v44 = (void *)sub_21CB88900();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v42;
  unint64_t v65 = (uint64_t (*)(uint64_t))sub_21CB4EB78;
  uint64_t v66 = v45;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_21CA1B084;
  char v64 = &unk_26CD70518;
  uint64_t v46 = _Block_copy(&aBlock);
  id v47 = v42;
  swift_release();
  sub_21CB88120();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  uint64_t v48 = v9;
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v49 = v54;
  uint64_t v50 = v57;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v48, v49, v46);
  _Block_release(v46);

  (*(void (**)(char *, uint64_t))(v56 + 8))(v49, v50);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v48, v55);
}

uint64_t sub_21CB47144(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = sub_21CB88100();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21CB88150();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v18 = v5;
    uint64_t v19 = v8;
    uint64_t v14 = *(void **)(result + 136);
    uint64_t v15 = swift_allocObject();
    *(unsigned char *)(v15 + 16) = a3 & 1;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_21CB4E3A4;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_21CA1B084;
    aBlock[3] = &unk_26CD70568;
    unint64_t v16 = _Block_copy(aBlock);
    id v17 = v14;
    swift_retain();
    sub_21CB88120();
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v11, v7, v16);
    _Block_release(v16);
    swift_release();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB4743C(char a1, void *a2)
{
  if (a1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = sub_21CB3A4C4(v5);
    uint64_t v4 = sub_21CA5893C(v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = a2[4];
    swift_bridgeObjectRetain();
  }
  int v7 = a1 & 1;
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_21CA4D61C(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_21CB3D1EC((uint64_t)v9);
  swift_release();
  swift_retain();
  uint64_t v11 = sub_21CB2295C(v10);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21CB880A0();
  sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_21CB88070();
  os_log_type_t v16 = sub_21CB88880();
  int v30 = v7;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v31 = v29;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v18 = sub_21CB88310();
    sub_21CA4E450(v18, v19, &v31);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21CA4E450(v11, v13, &v31);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v15, v16, "👀 FMFSecureLocCtrl: 🔥 firing up %s re-subscription timer for %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v29, -1, -1);
    MEMORY[0x21D4B6B70](v17, -1, -1);

    if (*(void *)(v4 + 16)) {
      goto LABEL_8;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = sub_21CB3A4C4(v25);
    uint64_t v27 = sub_21CA5893C(v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = a2[8];
    uint64_t v22 = a2[9];
    swift_bridgeObjectRetain();
    uint64_t v23 = v27;
    uint64_t v24 = 1;
    goto LABEL_13;
  }

  swift_bridgeObjectRelease_n();
  if (!*(void *)(v4 + 16)) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v20 = sub_21CA4D61C(v4);
  swift_bridgeObjectRelease();
  sub_21CB3DED8((uint64_t)v20, v30);
  swift_release();
  if (v30) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v21 = a2[5];
  uint64_t v22 = a2[6];
  swift_bridgeObjectRetain();
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = 0;
LABEL_13:
  sub_21CB44230(v23, v24, 2975090, 0xE300000000000000, v21, v22);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21CB477C0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_21CB47828(char a1)
{
  uint64_t v2 = v1;
  char v3 = a1 & 1;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21CB880A0();
  sub_21CA4CC18(v4, (uint64_t)qword_267CA5368);
  uint64_t v5 = sub_21CB88070();
  os_log_type_t v6 = sub_21CB88880();
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v23[0] = v8;
    *(_DWORD *)int v7 = 136315138;
    uint64_t v9 = sub_21CB88310();
    sub_21CA4E450(v9, v10, v23);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v5, v6, "👀 FMFSecureLocCtrl: cancelling %s re-subscription timer for all", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }

  uint64_t v11 = (uint64_t *)(v2 + 152);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v2 + 152);
  if (*(void *)(v12 + 16))
  {
    unint64_t v13 = sub_21CAC957C(v3);
    if (v14) {
      objc_msgSend(*(id *)(*(void *)(v12 + 56) + 8 * v13), sel_invalidate);
    }
  }
  swift_beginAccess();
  unint64_t v15 = sub_21CAC957C(v3);
  if (v16)
  {
    unint64_t v17 = v15;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v11;
    uint64_t v22 = *v11;
    *uint64_t v11 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_21CB86020();
      uint64_t v19 = v22;
    }
    uint64_t v20 = *(void **)(*(void *)(v19 + 56) + 8 * v17);
    sub_21CB83A8C(v17, v19);
    *uint64_t v11 = v19;

    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

void sub_21CB47A84(uint64_t a1, char a2, double a3)
{
  uint64_t v4 = v3;
  int v7 = a2 & 1;
  uint64_t v8 = sub_21CB88100();
  uint64_t v49 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v47 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_21CB88150();
  uint64_t v46 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_21CB3D1EC(v11);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v50 = sub_21CB2295C(v12);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_21CB880A0();
  sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  char v16 = sub_21CB88070();
  os_log_type_t v17 = sub_21CB88880();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t aBlock = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    if ((~*(void *)&a3 & 0x7FF0000000000000) != 0)
    {
      if (a3 > -9.22337204e18)
      {
        if (a3 < 9.22337204e18)
        {
          uint64_t v57 = (uint64_t)a3;
          uint64_t v42 = v19;
          sub_21CB889C0();
          *(_WORD *)(v18 + 12) = 2080;
          uint64_t v44 = v3;
          LOBYTE(v57) = v7;
          int v43 = v7;
          uint64_t v20 = sub_21CB88310();
          uint64_t v57 = sub_21CA4E450(v20, v21, &aBlock);
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v18 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v57 = sub_21CA4E450(v50, v14, &aBlock);
          LOBYTE(v7) = v43;
          uint64_t v4 = v44;
          sub_21CB889C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CA00000, v16, v17, "👀 FMFSecureLocCtrl: setting up %ld-sec no-result-when-subscribing %s->legacy fallback timer for %s", (uint8_t *)v18, 0x20u);
          uint64_t v22 = v42;
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v22, -1, -1);
          MEMORY[0x21D4B6B70](v18, -1, -1);

          goto LABEL_9;
        }
LABEL_16:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }

  swift_bridgeObjectRelease_n();
LABEL_9:
  objc_msgSend(*(id *)(v4 + 120), sel_invalidate);
  if (a3 <= 0.0)
  {
    swift_bridgeObjectRetain();
    char v36 = sub_21CB88070();
    os_log_type_t v37 = sub_21CB88880();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t aBlock = v39;
      *(_DWORD *)uint64_t v38 = 136315394;
      LOBYTE(v57) = v7;
      uint64_t v40 = sub_21CB88310();
      uint64_t v57 = sub_21CA4E450(v40, v41, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_21CA4E450(v50, v14, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v36, v37, "👀 FMFSecureLocCtrl: discarding (interval too short) no-result-when-subscribing %s->legacy fallback timer for %s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v39, -1, -1);
      MEMORY[0x21D4B6B70](v38, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v23 = swift_allocObject();
    swift_weakInit();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v23;
    *(void *)(v24 + 24) = a1;
    *(unsigned char *)(v24 + 32) = v7;
    *(void *)(v24 + 40) = v50;
    *(void *)(v24 + 48) = v14;
    uint64_t v55 = sub_21CB4E29C;
    uint64_t v56 = v24;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v52 = 1107296256;
    uint64_t v53 = sub_21CB477C0;
    uint64_t v54 = &unk_26CD703D8;
    uint64_t v25 = _Block_copy(&aBlock);
    uint64_t v26 = self;
    swift_bridgeObjectRetain();
    swift_retain();
    id v27 = objc_msgSend(v26, sel_timerWithTimeInterval_repeats_block_, 0, v25, a3);
    _Block_release(v25);
    swift_release();
    swift_release();
    os_log_type_t v28 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v27;
    id v29 = v27;

    sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
    int v30 = (void *)sub_21CB88900();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    uint64_t v55 = (uint64_t (*)(uint64_t))sub_21CB4EB78;
    uint64_t v56 = v31;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v52 = 1107296256;
    uint64_t v53 = sub_21CA1B084;
    uint64_t v54 = &unk_26CD70428;
    unint64_t v32 = _Block_copy(&aBlock);
    id v33 = v29;
    swift_release();
    char v34 = v45;
    sub_21CB88120();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    unint64_t v35 = v47;
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v34, v35, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v8);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v48);
  }
}

uint64_t sub_21CB4828C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = sub_21CB88100();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21CB88150();
  uint64_t v24 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v18 = result;
    uint64_t v23 = v14;
    uint64_t v19 = *(void **)(result + 136);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = a3;
    *(unsigned char *)(v20 + 32) = a4 & 1;
    *(void *)(v20 + 40) = a5;
    *(void *)(v20 + 48) = a6;
    aBlock[4] = sub_21CB4E310;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_21CA1B084;
    aBlock[3] = &unk_26CD70478;
    unint64_t v21 = _Block_copy(aBlock);
    id v22 = v19;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21CB88120();
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v16, v13, v21);
    _Block_release(v21);
    swift_release();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v23);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB485A0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5)
{
  char v8 = a3 & 1;
  swift_retain();
  uint64_t v9 = sub_21CB21FD8(a2);
  swift_release();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_21CB3D1EC(v10);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v12 = sub_21CB2295C(v11);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_21CB880A0();
  sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  char v16 = sub_21CB88070();
  os_log_type_t v17 = sub_21CB88880();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v23 = v12;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v24 = v19;
    *(_DWORD *)uint64_t v18 = 136315650;
    uint64_t v20 = sub_21CB88310();
    sub_21CA4E450(v20, v21, &v24);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21CA4E450(v23, v14, &v24);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_21CA4E450(a4, a5, &v24);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v16, v17, "👀 FMFSecureLocCtrl: 🔥 firing up no-result-when-subscribing (spd crash?) %s->legacy fallback timer for %s from %s", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v19, -1, -1);
    MEMORY[0x21D4B6B70](v18, -1, -1);

    if (!v9[2]) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_7;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  if (v9[2]) {
LABEL_7:
  }
    sub_21CB3D930((uint64_t)v9, v8);
  return swift_bridgeObjectRelease();
}

void sub_21CB4889C()
{
  uint64_t v1 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  uint64_t v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_21CB88310();
    sub_21CA4E450(v7, v8, &v10);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v3, v4, "👀 FMFSecureLocCtrl: cancelling no-result-when-subscribing %s->legacy fallback timer for all", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v6, -1, -1);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 120), sel_invalidate);
  uint64_t v9 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;
}

void sub_21CB48A50(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  int v58 = a3 & 1;
  uint64_t v9 = sub_21CB88100();
  uint64_t v54 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v56 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21CB88150();
  uint64_t v55 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CA57E34(&qword_267C95218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v57 = sub_21CB2295C(inited);
  unint64_t v16 = v15;
  swift_release();
  swift_setDeallocating();
  sub_21CA57E34((uint64_t *)&unk_267C95220);
  swift_arrayDestroy();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_21CB880A0();
  uint64_t v18 = sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v18;
  uint64_t v19 = sub_21CB88070();
  os_log_type_t v20 = sub_21CB88880();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v52 = v11;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t aBlock = v22;
    *(_DWORD *)uint64_t v21 = 134218498;
    if ((~*(void *)&a4 & 0x7FF0000000000000) != 0)
    {
      if (a4 > -9.22337204e18)
      {
        if (a4 < 9.22337204e18)
        {
          uint64_t v66 = (uint64_t)a4;
          uint64_t v49 = v22;
          sub_21CB889C0();
          *(_WORD *)(v21 + 12) = 2080;
          uint64_t v51 = v13;
          LOBYTE(v66) = v58;
          uint64_t v50 = v5;
          uint64_t v23 = sub_21CB88310();
          uint64_t v66 = sub_21CA4E450(v23, v24, &aBlock);
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v66 = sub_21CA4E450(v57, v16, &aBlock);
          uint64_t v5 = v50;
          unint64_t v13 = v51;
          sub_21CB889C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CA00000, v19, v20, "👀 FMFSecureLocCtrl: setting up %ld-sec no-location %s->legacy fallback timer for %s", (uint8_t *)v21, 0x20u);
          uint64_t v25 = v49;
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v25, -1, -1);
          MEMORY[0x21D4B6B70](v21, -1, -1);

          uint64_t v11 = v52;
          if (a4 <= 0.0) {
            goto LABEL_8;
          }
          goto LABEL_11;
        }
LABEL_19:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }

  swift_bridgeObjectRelease_n();
  if (a4 <= 0.0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_21CB88070();
    os_log_type_t v27 = sub_21CB88880();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t aBlock = v29;
      *(_DWORD *)uint64_t v28 = 136315394;
      LOBYTE(v66) = v58;
      uint64_t v30 = sub_21CB88310();
      uint64_t v66 = sub_21CA4E450(v30, v31, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_21CA4E450(v57, v16, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v26, v27, "👀 FMFSecureLocCtrl: discarding (interval too short) no-location %s->legacy fallback timer for %s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v29, -1, -1);
      MEMORY[0x21D4B6B70](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
LABEL_11:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v32 = *(void *)(v5 + 104);
  if (*(void *)(v32 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_21CA5BCE0(a1, a2);
    if (v34)
    {
      id v35 = *(id *)(*(void *)(v32 + 56) + 8 * v33);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v35, sel_invalidate);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v36 = swift_allocObject();
  swift_weakInit();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v36;
  *(void *)(v37 + 24) = a1;
  *(void *)(v37 + 32) = a2;
  *(unsigned char *)(v37 + 40) = v58;
  char v64 = sub_21CB4E248;
  uint64_t v65 = v37;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  uint64_t v62 = sub_21CB477C0;
  uint64_t v63 = &unk_26CD702E8;
  uint64_t v38 = _Block_copy(&aBlock);
  uint64_t v39 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  id v40 = objc_msgSend(v39, sel_timerWithTimeInterval_repeats_block_, 0, v38, a4);
  _Block_release(v38);
  swift_release();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v41 = v40;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v59 = *(void *)(v5 + 104);
  *(void *)(v5 + 104) = 0x8000000000000000;
  sub_21CB845E8((uint64_t)v41, a1, a2, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 104) = v59;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
  int v43 = (void *)sub_21CB88900();
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v41;
  char v64 = (uint64_t (*)(uint64_t))sub_21CB4EB78;
  uint64_t v65 = v44;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  uint64_t v62 = sub_21CA1B084;
  uint64_t v63 = &unk_26CD70338;
  uint64_t v45 = _Block_copy(&aBlock);
  id v46 = v41;
  swift_release();
  sub_21CB88120();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  id v47 = v56;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v13, v47, v45);
  _Block_release(v45);

  (*(void (**)(char *, uint64_t))(v54 + 8))(v47, v9);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
}

uint64_t sub_21CB493E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = sub_21CB88100();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21CB88150();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v22 = v9;
    uint64_t v23 = v12;
    uint64_t v18 = *(void **)(result + 136);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v17;
    *(void *)(v19 + 24) = a3;
    *(void *)(v19 + 32) = a4;
    *(unsigned char *)(v19 + 40) = a5 & 1;
    aBlock[4] = sub_21CB4E260;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_21CA1B084;
    aBlock[3] = &unk_26CD70388;
    os_log_type_t v20 = _Block_copy(aBlock);
    id v21 = v18;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_21CB88120();
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v15, v11, v20);
    _Block_release(v20);
    swift_release();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v23);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB496F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v6 = a4 & 1;
  sub_21CA57E34((uint64_t *)&unk_267C96F20);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
  *(void *)(inited + 32) = a2;
  *(void *)(inited + 40) = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_21CB21FD8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_release();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_21CB3D1EC(v9);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v11 = sub_21CB2295C(v10);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21CB880A0();
  sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_21CB88070();
  os_log_type_t v16 = sub_21CB88880();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v19 = sub_21CB88310();
    sub_21CA4E450(v19, v20, &v23);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21CA4E450(v11, v13, &v23);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v15, v16, "👀 FMFSecureLocCtrl: 🔥 firing up no-location %s->legacy fallback timer for %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v18, -1, -1);
    MEMORY[0x21D4B6B70](v17, -1, -1);

    if (!v8[2]) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_7;
  }

  swift_bridgeObjectRelease_n();
  if (v8[2])
  {
LABEL_7:
    uint64_t v21 = swift_bridgeObjectRetain();
    sub_21CB3D930(v21, v6);
    swift_bridgeObjectRelease();
    sub_21CB3D32C((uint64_t)v8, v6);
  }
  return swift_bridgeObjectRelease();
}

void sub_21CB49A04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_21CA57E34(&qword_267C95218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_21CB2295C(inited);
  unint64_t v9 = v8;
  swift_release();
  swift_setDeallocating();
  sub_21CA57E34((uint64_t *)&unk_267C95220);
  swift_arrayDestroy();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_21CB880A0();
  sub_21CA4CC18(v10, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21CB88070();
  os_log_type_t v12 = sub_21CB88880();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v22[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v15 = sub_21CB88310();
    sub_21CA4E450(v15, v16, v22);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21CA4E450(v7, v9, v22);
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v11, v12, "👀 FMFSecureLocCtrl: cancelling no-location %s->legacy fallback timer for %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v14, -1, -1);
    MEMORY[0x21D4B6B70](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t v17 = *(void *)(v3 + 104);
  if (*(void *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_21CA5BCE0(a1, a2);
    if (v19)
    {
      id v20 = *(id *)(*(void *)(v17 + 56) + 8 * v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_invalidate);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v21 = (void *)sub_21CB80CF0(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
}

void sub_21CB49D64(uint64_t a1, uint64_t a2, int a3, char a4, double a5)
{
  uint64_t v6 = v5;
  int v62 = a4 & 1;
  uint64_t v55 = sub_21CB88100();
  uint64_t v58 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v60 = &v51[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_21CB88150();
  uint64_t v59 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v56 = &v51[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21CA57E34(&qword_267C95218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
  uint64_t v61 = a1;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v14 = sub_21CB2295C(inited);
  unint64_t v16 = v15;
  swift_release();
  swift_setDeallocating();
  sub_21CA57E34((uint64_t *)&unk_267C95220);
  swift_arrayDestroy();
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_21CB880A0();
  sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  unint64_t v18 = sub_21CB88070();
  int v19 = sub_21CB88880();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t aBlock = v21;
    *(_DWORD *)uint64_t v20 = 134218498;
    if ((~*(void *)&a5 & 0x7FF0000000000000) != 0)
    {
      if (a5 > -9.22337204e18)
      {
        if (a5 < 9.22337204e18)
        {
          uint64_t v70 = (uint64_t)a5;
          uint64_t v53 = v21;
          sub_21CB889C0();
          *(_WORD *)(v20 + 12) = 2080;
          LOBYTE(v70) = v62;
          uint64_t v54 = a2;
          uint64_t v22 = sub_21CB88310();
          int v52 = v19;
          uint64_t v70 = sub_21CA4E450(v22, v23, &aBlock);
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v70 = sub_21CA4E450(v14, v16, &aBlock);
          a2 = v54;
          sub_21CB889C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21CA00000, v18, (os_log_type_t)v52, "👀 FMFSecureLocCtrl: setting up %ld-sec %s pause timer for %s", (uint8_t *)v20, 0x20u);
          uint64_t v24 = v53;
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v24, -1, -1);
          MEMORY[0x21D4B6B70](v20, -1, -1);

          if (a5 <= 0.0) {
            goto LABEL_8;
          }
          goto LABEL_11;
        }
LABEL_19:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }

  swift_bridgeObjectRelease_n();
  if (a5 <= 0.0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_21CB88070();
    unint64_t v26 = v16;
    os_log_type_t v27 = sub_21CB88880();
    if (os_log_type_enabled(v25, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t aBlock = v29;
      *(_DWORD *)uint64_t v28 = 136315394;
      LOBYTE(v70) = v62;
      uint64_t v30 = sub_21CB88310();
      uint64_t v70 = sub_21CA4E450(v30, v31, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_21CA4E450(v14, v26, &aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v25, v27, "👀 FMFSecureLocCtrl: discarding (interval too short) %s pause timer for %s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v29, -1, -1);
      MEMORY[0x21D4B6B70](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
LABEL_11:
  swift_beginAccess();
  uint64_t v32 = *(void *)(v6 + 96);
  if (*(void *)(v32 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_21CA5BCE0(v61, a2);
    if (v34)
    {
      id v35 = *(id *)(*(void *)(v32 + 56) + 8 * v33);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v35, sel_invalidate);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v36 = swift_allocObject();
  swift_weakInit();
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37 + 16) = v62;
  *(void *)(v37 + 24) = v14;
  *(void *)(v37 + 32) = v16;
  uint64_t v38 = v61;
  *(void *)(v37 + 40) = v36;
  *(void *)(v37 + 48) = v38;
  *(void *)(v37 + 56) = a2;
  *(unsigned char *)(v37 + 64) = a3 & 1;
  *(unsigned char *)(v37 + 65) = BYTE1(a3) & 1;
  *(unsigned char *)(v37 + 66) = BYTE2(a3) & 1;
  char v68 = sub_21CB4BA10;
  uint64_t v69 = v37;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_21CB477C0;
  uint64_t v67 = &unk_26CD701A8;
  uint64_t v39 = _Block_copy(&aBlock);
  id v40 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  id v41 = objc_msgSend(v40, sel_timerWithTimeInterval_repeats_block_, 0, v39, a5);
  _Block_release(v39);
  swift_release();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v42 = v41;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v63 = *(void *)(v6 + 96);
  *(void *)(v6 + 96) = 0x8000000000000000;
  sub_21CB845E8((uint64_t)v42, v38, a2, isUniquelyReferenced_nonNull_native);
  *(void *)(v6 + 96) = v63;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
  uint64_t v44 = (void *)sub_21CB88900();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v42;
  char v68 = sub_21CB4BA50;
  uint64_t v69 = v45;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v65 = 1107296256;
  uint64_t v66 = sub_21CA1B084;
  uint64_t v67 = &unk_26CD701F8;
  id v46 = _Block_copy(&aBlock);
  id v47 = v42;
  swift_release();
  uint64_t v48 = v56;
  sub_21CB88120();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v49 = v60;
  uint64_t v50 = v55;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v48, v49, v46);
  _Block_release(v46);

  (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v49, v50);
  (*(void (**)(unsigned char *, uint64_t))(v59 + 8))(v48, v57);
}

uint64_t sub_21CB4A730(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v46 = a3;
  int v12 = a2 & 1;
  uint64_t v13 = sub_21CB88100();
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v45 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21CB88150();
  uint64_t v44 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v42 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_21CB880A0();
  sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
  swift_bridgeObjectRetain_n();
  unint64_t v18 = sub_21CB88070();
  os_log_type_t v19 = sub_21CB88880();
  BOOL v20 = os_log_type_enabled(v18, v19);
  int v41 = v12;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v38 = a6;
    uint64_t v22 = v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v40 = v15;
    uint64_t v37 = v23;
    aBlock[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    LOBYTE(v49) = v12;
    uint64_t v39 = a7;
    uint64_t v24 = sub_21CB88310();
    uint64_t v49 = sub_21CA4E450(v24, v25, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_21CA4E450(v46, a4, aBlock);
    a7 = v39;
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v18, v19, "👀 FMFSecureLocCtrl: 🔥 firing up %s pause timer for %s", (uint8_t *)v22, 0x16u);
    uint64_t v26 = v37;
    swift_arrayDestroy();
    uint64_t v15 = v40;
    MEMORY[0x21D4B6B70](v26, -1, -1);
    uint64_t v27 = v22;
    a6 = v38;
    MEMORY[0x21D4B6B70](v27, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v29 = result;
    uint64_t v30 = *(void **)(result + 136);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    *(void *)(v31 + 24) = a6;
    *(void *)(v31 + 32) = a7;
    *(unsigned char *)(v31 + 40) = a8 & 1;
    *(unsigned char *)(v31 + 41) = BYTE1(a8) & 1;
    *(unsigned char *)(v31 + 42) = BYTE2(a8) & 1;
    *(unsigned char *)(v31 + 43) = v41;
    *(void *)(v31 + 48) = v46;
    *(void *)(v31 + 56) = a4;
    aBlock[4] = (uint64_t)sub_21CB4BAB4;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CA1B084;
    aBlock[3] = (uint64_t)&unk_26CD70248;
    uint64_t v32 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    id v33 = v30;
    swift_retain();
    swift_bridgeObjectRetain();
    char v34 = v42;
    sub_21CB88120();
    uint64_t v47 = MEMORY[0x263F8EE78];
    sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    id v35 = v45;
    sub_21CB88A60();
    MEMORY[0x21D4B5A20](0, v34, v35, v32);
    _Block_release(v32);
    swift_release();

    (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v13);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v34, v15);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB4AC6C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, uint64_t a6, unint64_t a7)
{
  unint64_t v67 = a7;
  uint64_t v66 = a6;
  int v68 = a4;
  int v65 = a5 & 1;
  uint64_t v11 = sub_21CB88100();
  uint64_t v73 = *(void *)(v11 - 8);
  uint64_t v74 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v72 = &v64[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v71 = sub_21CB88150();
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v69 = &v64[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = -1 << *(unsigned char *)(*(void *)(a1 + 56) + 32);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(v15 + 56);
  uint64_t v16 = v15 + 56;
  uint64_t v17 = v18;
  uint64_t v19 = ~v14;
  uint64_t v20 = -v14;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  else {
    uint64_t v21 = -1;
  }
  uint64_t aBlock = *(void *)(a1 + 56);
  uint64_t v83 = v16;
  uint64_t v84 = (uint64_t (*)(uint64_t))v19;
  uint64_t v85 = 0;
  uint64_t v86 = (uint64_t (*)())(v21 & v17);
  uint64_t v87 = 0;
  swift_bridgeObjectRetain();
  uint64_t v79 = a1;
  while (1)
  {
    uint64_t v23 = sub_21CB43478();
    if (!v25) {
      break;
    }
    unint64_t v26 = v23;
    if (v24 == a2 && v25 == a3)
    {
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t v27 = *(void *)(a1 + 56);
      uint64_t v28 = *(void *)(v27 + 16);
      if (v28)
      {
        sub_21CA57E34(&qword_267C952B8);
        uint64_t v29 = (void *)swift_allocObject();
        size_t v30 = j__malloc_size(v29);
        v29[2] = v28;
        v29[3] = 2 * ((uint64_t)(v30 - 32) / 24);
        uint64_t v31 = sub_21CB4D2B4((uint64_t)v81, (uint64_t)(v29 + 4), v28, v27);
        uint64_t v77 = v81[0];
        uint64_t v78 = v31;
        a1 = v81[2];
        uint64_t v75 = v81[4];
        uint64_t v76 = v81[3];
        swift_bridgeObjectRetain_n();
        sub_21CA7CFF0();
        if (v78 != v28) {
          goto LABEL_37;
        }
        swift_bridgeObjectRelease();
        a1 = v79;
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRetain();
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        if ((v26 & 0x8000000000000000) != 0) {
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v29 = sub_21CB4C38C(v29);
        if ((v26 & 0x8000000000000000) != 0)
        {
LABEL_30:
          __break(1u);
          break;
        }
      }
      if (v26 >= v29[2])
      {
        __break(1u);
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
      uint64_t v32 = &v29[3 * v26];
      v32[4] = a2;
      v32[5] = a3;
      *((_WORD *)v32 + 24) = 256;
      *((unsigned char *)v32 + 50) = 0;
      swift_bridgeObjectRelease();
      sub_21CB4D4D4();
      uint64_t v33 = sub_21CB88750();
      uint64_t v80 = v33;
      uint64_t v34 = v29[2];
      if (v34)
      {
        id v35 = (unsigned __int8 *)v29 + 50;
        do
        {
          uint64_t v36 = *(void *)(v35 - 18);
          uint64_t v37 = *(void *)(v35 - 10);
          int v38 = *(v35 - 2);
          int v39 = *(v35 - 1);
          int v41 = *v35;
          v35 += 24;
          int v40 = v41;
          unsigned int v42 = v7 & 0xFF000000 | v38;
          if (v39) {
            int v43 = 256;
          }
          else {
            int v43 = 0;
          }
          int v44 = v42 | v43;
          if (v40) {
            int v45 = 0x10000;
          }
          else {
            int v45 = 0;
          }
          int v7 = v44 | v45;
          swift_bridgeObjectRetain();
          sub_21CB61C30((uint64_t)v81, v36, v37, v7);
          swift_bridgeObjectRelease();
          --v34;
        }
        while (v34);
        swift_bridgeObjectRelease();
        a1 = v79;
        uint64_t v46 = v80;
      }
      else
      {
        uint64_t v46 = v33;
        swift_bridgeObjectRelease();
      }
      *(void *)(a1 + 56) = v46;
      swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_21CB88F50();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_10;
      }
    }
  }
  sub_21CA7CFF0();
  if (qword_267C94990 == -1) {
    goto LABEL_32;
  }
LABEL_38:
  swift_once();
LABEL_32:
  uint64_t v47 = sub_21CB880A0();
  sub_21CA4CC18(v47, (uint64_t)qword_267CA5368);
  unint64_t v48 = v67;
  swift_bridgeObjectRetain_n();
  uint64_t v49 = sub_21CB88070();
  os_log_type_t v50 = sub_21CB88880();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t aBlock = v52;
    *(_DWORD *)uint64_t v51 = 136315394;
    LOBYTE(v81[0]) = v65;
    uint64_t v53 = sub_21CB88310();
    v81[0] = sub_21CA4E450(v53, v54, &aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2080;
    swift_bridgeObjectRetain();
    v81[0] = sub_21CA4E450(v66, v48, &aBlock);
    a1 = v79;
    sub_21CB889C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CA00000, v49, v50, "👀 FMFSecureLocCtrl: telling FMFManager pausing for %s for %s", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v52, -1, -1);
    MEMORY[0x21D4B6B70](v51, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v55 = *(void **)(a1 + 144);
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = a1;
  *(void *)(v56 + 24) = a2;
  *(void *)(v56 + 32) = a3;
  int v57 = v68;
  *(unsigned char *)(v56 + 40) = v68 & 1;
  *(unsigned char *)(v56 + 41) = BYTE1(v57) & 1;
  *(unsigned char *)(v56 + 42) = BYTE2(v57) & 1;
  uint64_t v86 = sub_21CB4BAFC;
  uint64_t v87 = v56;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v83 = 1107296256;
  uint64_t v84 = sub_21CA1B084;
  uint64_t v85 = &unk_26CD70298;
  uint64_t v58 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  id v59 = v55;
  swift_retain();
  uint64_t v60 = v69;
  sub_21CB88120();
  v81[0] = MEMORY[0x263F8EE78];
  sub_21CA365D0((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v61 = v72;
  uint64_t v62 = v74;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v60, v61, v58);
  _Block_release(v58);

  (*(void (**)(unsigned char *, uint64_t))(v73 + 8))(v61, v62);
  (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v60, v71);
  return swift_release();
}

uint64_t sub_21CB4B3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x21D4B6C80](a1 + 184);
  if (result)
  {
    sub_21CA57E34((uint64_t *)&unk_267C96F20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    sub_21CB172CC(inited);
    swift_unknownObjectRelease();
    swift_setDeallocating();
    return swift_arrayDestroy();
  }
  return result;
}

void sub_21CB4B4AC(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_currentRunLoop);
  objc_msgSend(v2, sel_addTimer_forMode_, a1, *MEMORY[0x263EFF588]);
}

id *sub_21CB4B528()
{
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

  swift_release();
  swift_bridgeObjectRelease();
  sub_21CA640FC((uint64_t)(v0 + 21));
  sub_21CA640FC((uint64_t)(v0 + 23));

  return v0;
}

uint64_t sub_21CB4B5D8()
{
  sub_21CB4B528();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FMFSecureLocationRefreshController()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for FMFSecureLocationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x21CB4B6FCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMFSecureLocationMode()
{
  return &type metadata for FMFSecureLocationMode;
}

uint64_t sub_21CB4B738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiveFriend(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  return a1;
}

__n128 initializeWithTake for LiveFriend(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LiveFriend(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveFriend(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 19)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveFriend(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 19) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveFriend()
{
  return &type metadata for LiveFriend;
}

unint64_t sub_21CB4B8E4()
{
  unint64_t result = qword_267C97850;
  if (!qword_267C97850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97850);
  }
  return result;
}

unint64_t sub_21CB4B93C()
{
  unint64_t result = qword_267C97858;
  if (!qword_267C97858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97858);
  }
  return result;
}

uint64_t sub_21CB4B990()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21CB4B9C8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 67, 7);
}

uint64_t sub_21CB4BA10(uint64_t a1)
{
  if (*(unsigned char *)(v1 + 65)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  int v3 = v2 | *(unsigned __int8 *)(v1 + 64);
  if (*(unsigned char *)(v1 + 66)) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  return sub_21CB4A730(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), v3 | v4);
}

void sub_21CB4BA50()
{
  sub_21CB4B4AC(*(void *)(v0 + 16));
}

uint64_t sub_21CB4BA6C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21CB4BAB4()
{
  if (*(unsigned char *)(v0 + 41)) {
    int v1 = 256;
  }
  else {
    int v1 = 0;
  }
  int v2 = v1 | *(unsigned __int8 *)(v0 + 40);
  if (*(unsigned char *)(v0 + 42)) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  return sub_21CB4AC6C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), v2 | v3, *(unsigned char *)(v0 + 43), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_21CB4BAF4()
{
  return sub_21CB2BCA8(43);
}

uint64_t sub_21CB4BAFC()
{
  return sub_21CB4E96C((uint64_t (*)(void, void, void, void))sub_21CB4B3FC);
}

uint64_t sub_21CB4BB14(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_21CB89050();
  swift_bridgeObjectRetain();
  sub_21CB88380();
  uint64_t v6 = sub_21CB89090();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_21CB88F50() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_21CB88F50() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *int v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21CB640B8();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_21CB4BF3C(v8);
  *int v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_21CB4BCA4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_21CA57E34(&qword_267C97160);
  uint64_t result = sub_21CB88B40();
  uint64_t v8 = result;
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
    BOOL v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_21CB89050();
    swift_bridgeObjectRetain();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
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
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
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

unint64_t sub_21CB4BF3C(unint64_t result)
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
    uint64_t v8 = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v10 = sub_21CB89090();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *unint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_21CB4C104(unint64_t result)
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
    uint64_t v8 = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      uint64_t v21 = v3;
      uint64_t v22 = v4;
      do
      {
        uint64_t v11 = 24 * v6;
        int64_t v12 = v2;
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        sub_21CB89070();
        sub_21CB89070();
        sub_21CB89070();
        uint64_t v13 = sub_21CB89090();
        swift_bridgeObjectRelease();
        unint64_t v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9)
          {
            uint64_t v3 = v21;
            uint64_t v4 = v22;
          }
          else
          {
            uint64_t v3 = v21;
            uint64_t v4 = v22;
            if (v2 >= (uint64_t)v14) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v3 = v21;
          uint64_t v4 = v22;
          if (v14 >= v9 || v2 >= (uint64_t)v14)
          {
LABEL_12:
            uint64_t v15 = *(void *)(v3 + 48);
            unint64_t v16 = v15 + 24 * v2;
            uint64_t v17 = (long long *)(v15 + v11);
            if (24 * v2 < v11 || v16 >= (unint64_t)v17 + 24 || (int64_t v2 = v6, v12 != v6))
            {
              long long v10 = *v17;
              *(void *)(v16 + 16) = *((void *)v17 + 2);
              *(_OWORD *)unint64_t v16 = v10;
              int64_t v2 = v6;
            }
          }
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void *sub_21CB4C350(void *a1)
{
  return sub_21CAC7864(0, a1[2], 0, a1);
}

void *sub_21CB4C364(void *a1)
{
  return sub_21CAC81A8(0, a1[2], 0, a1);
}

uint64_t sub_21CB4C378(unint64_t a1)
{
  return sub_21CA47FB4(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_21CB4C38C(void *a1)
{
  return sub_21CAC82D0(0, a1[2], 0, a1);
}

uint64_t sub_21CB4C3A0(uint64_t isStackAllocationSafe, uint64_t a2)
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
    uint64_t v7 = sub_21CB4C528((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_21CB4C528((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_21CB4C528(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  int v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v20 = sub_21CB89090();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      BOOL v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_21CB88F50() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_21CB88F50() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    int v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_21CB89050();
    swift_bridgeObjectRetain();
    sub_21CB88380();
    uint64_t v47 = sub_21CB89090();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_21CB88F50() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_21CB4BCA4(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        unint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_21CB88F50() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_21CB4CA68(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((a1 & 0x8000000000000000) != 0 || (uint64_t v7 = *v3, 1 << *(unsigned char *)(*v3 + 32) <= (uint64_t)a1))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (((*(void *)(v7 + 8 * (a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(_DWORD *)(v7 + 36) != a2)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
LABEL_10:
    sub_21CB64898();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 48) + 24 * a1);
  sub_21CB4C104(a1);
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21CB4CB80(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((a1 & 0x8000000000000000) != 0 || (uint64_t v7 = *v3, 1 << *(unsigned char *)(*v3 + 32) <= (uint64_t)a1))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (((*(void *)(v7 + 8 * (a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(_DWORD *)(v7 + 36) != a2)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
LABEL_10:
    sub_21CB640B8();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 48) + 16 * a1);
  sub_21CB4BF3C(a1);
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21CB4CC60(uint64_t result)
{
  uint64_t v2 = result;
  int64_t i = 0;
  uint64_t v4 = result + 56;
  uint64_t v5 = -1 << *(unsigned char *)(result + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(63 - v5) >> 6;
  if (v7) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1))
  {
    __break(1u);
LABEL_29:
    __break(1u);
    return result;
  }
  if (v11 < v8)
  {
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    int64_t v13 = i + 1;
    if (v12) {
      goto LABEL_21;
    }
    int64_t v13 = i + 2;
    if (i + 2 >= v8) {
      goto LABEL_25;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v13);
    if (v12) {
      goto LABEL_21;
    }
    int64_t v13 = i + 3;
    if (i + 3 >= v8) {
      goto LABEL_25;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v13);
    if (v12)
    {
LABEL_21:
      unint64_t v7 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
      for (i = v13; ; unint64_t v10 = v9 | (i << 6))
      {
        int64_t v15 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
        uint64_t v17 = *v15;
        uint64_t v16 = v15[1];
        uint64_t v18 = *v1;
        swift_bridgeObjectRetain();
        if (sub_21CB3B114(v17, v16, v18))
        {
          sub_21CB4BB14(v17, v16);
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (!v7) {
            goto LABEL_8;
          }
        }
        else
        {
          sub_21CA589D4(&v19, v17, v16);
          uint64_t result = swift_bridgeObjectRelease();
          if (!v7) {
            goto LABEL_8;
          }
        }
LABEL_7:
        unint64_t v9 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
      }
    }
    int64_t v14 = i + 4;
    if (i + 4 < v8)
    {
      unint64_t v12 = *(void *)(v4 + 8 * v14);
      if (v12)
      {
        int64_t v13 = i + 4;
        goto LABEL_21;
      }
      while (1)
      {
        int64_t v13 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_29;
        }
        if (v13 >= v8) {
          break;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v13);
        ++v14;
        if (v12) {
          goto LABEL_21;
        }
      }
    }
  }
LABEL_25:

  return sub_21CA7CFF0();
}

uint64_t sub_21CB4CE30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
  uint64_t v26 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v20 = *(void *)(a4 + 48) + 32 * v16;
    uint64_t v22 = *(void *)v20;
    uint64_t v21 = *(void *)(v20 + 8);
    uint64_t v23 = *(void *)(v20 + 16);
    char v24 = *(unsigned char *)(v20 + 24);
    char v25 = *(unsigned char *)(v20 + 25);
    LOBYTE(v20) = *(unsigned char *)(v20 + 26);
    *(void *)uint64_t v11 = v22;
    *(void *)(v11 + 8) = v21;
    *(void *)(v11 + 16) = v23;
    *(unsigned char *)(v11 + 24) = v24;
    *(unsigned char *)(v11 + 25) = v25;
    *(unsigned char *)(v11 + 26) = v20;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 32;
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
      uint64_t v7 = v26;
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

uint64_t sub_21CB4D064(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
    uint64_t v10 = 0;
LABEL_39:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
  uint64_t v26 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v20 = *(void *)(a4 + 56) + 32 * v16;
    uint64_t v22 = *(void *)v20;
    uint64_t v21 = *(void *)(v20 + 8);
    uint64_t v23 = *(void *)(v20 + 16);
    char v24 = *(unsigned char *)(v20 + 24);
    char v25 = *(unsigned char *)(v20 + 25);
    LOBYTE(v20) = *(unsigned char *)(v20 + 26);
    *(void *)uint64_t v11 = v22;
    *(void *)(v11 + 8) = v21;
    *(void *)(v11 + 16) = v23;
    *(unsigned char *)(v11 + 24) = v24;
    *(unsigned char *)(v11 + 25) = v25;
    *(unsigned char *)(v11 + 26) = v20;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 32;
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
      uint64_t v7 = v26;
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

uint64_t sub_21CB4D298(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CA4918C(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for FMFFriend, (uint64_t (*)(void))type metadata accessor for FMFFriend);
}

uint64_t sub_21CB4D2B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v20 = *(void *)(a4 + 48) + 24 * v16;
    uint64_t v22 = *(void *)v20;
    uint64_t v21 = *(void *)(v20 + 8);
    char v23 = *(unsigned char *)(v20 + 16);
    char v24 = *(unsigned char *)(v20 + 17);
    LOBYTE(v20) = *(unsigned char *)(v20 + 18);
    *(void *)uint64_t v11 = v22;
    *(void *)(v11 + 8) = v21;
    *(unsigned char *)(v11 + 16) = v23;
    *(unsigned char *)(v11 + 17) = v24;
    *(unsigned char *)(v11 + 18) = v20;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 24;
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
      uint64_t v7 = v25;
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

unint64_t sub_21CB4D4D4()
{
  unint64_t result = qword_267C97860;
  if (!qword_267C97860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97860);
  }
  return result;
}

void sub_21CB4D528(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_21CB87CC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v42 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v12 = MEMORY[0x270FA5388](v11);
  int64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v15 = a4 + 56;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 24);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
LABEL_37:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 24);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8, v12);
    unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    v30(a2, v22, v8);
    if (v21 == v40) {
      goto LABEL_36;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_37;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_21CB4D870(uint64_t a1, uint64_t a2, void **a3, char a4, void *a5)
{
  char v10 = a4 & 1;
  uint64_t v24 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a1 + 56);
  int64_t v26 = (unint64_t)(v11 + 63) >> 6;
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
    uint64_t v21 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v22 = v21[1];
    v25[0] = *v21;
    v25[1] = v22;
    swift_bridgeObjectRetain();
    sub_21CB449E0(v25, a2, a3, v10, a5);
    if (v5)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v15++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v15 >= v26) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v15);
    if (!v19)
    {
      int64_t v20 = v15 + 1;
      if (v15 + 1 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19) {
        goto LABEL_14;
      }
      int64_t v20 = v15 + 2;
      if (v15 + 2 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19) {
        goto LABEL_14;
      }
      int64_t v20 = v15 + 3;
      if (v15 + 3 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19)
      {
LABEL_14:
        int64_t v15 = v20;
        goto LABEL_15;
      }
      int64_t v23 = v15 + 4;
      if (v15 + 4 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v23);
      v15 += 4;
      if (!v19) {
        break;
      }
    }
LABEL_15:
    unint64_t v13 = (v19 - 1) & v19;
  }
  while (1)
  {
    int64_t v15 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v15 >= v26) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v15);
    ++v23;
    if (v19) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21CB4DA70(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  int64_t v6 = 0;
  uint64_t v7 = result + 56;
  uint64_t v8 = 1 << *(unsigned char *)(result + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(result + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v14 >= v11) {
      return 0;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        return 0;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          return 0;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15)
        {
          int64_t v6 = v14 + 3;
          if (v14 + 3 >= v11) {
            return 0;
          }
          unint64_t v15 = *(void *)(v7 + 8 * v6);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    if (*v17 == a2 && v17[1] == a3)
    {
      uint64_t v18 = a2;
LABEL_29:
      swift_bridgeObjectRetain();
      return v18;
    }
    uint64_t result = sub_21CB88F50();
    if (result) {
      goto LABEL_29;
    }
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return 0;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_21CB4DC18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t result = a1 + 56;
  uint64_t v7 = v8;
  uint64_t v20 = result;
  uint64_t v9 = 1 << *(unsigned char *)(result - 24);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v7;
  int64_t v21 = (unint64_t)(v9 + 63) >> 6;
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
      goto LABEL_33;
    }
    if (v14 >= v21) {
      return 0;
    }
    unint64_t v15 = *(void *)(v20 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v21) {
        return 0;
      }
      unint64_t v15 = *(void *)(v20 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v21) {
          return 0;
        }
        unint64_t v15 = *(void *)(v20 + 8 * v5);
        if (!v15)
        {
          int64_t v5 = v14 + 3;
          if (v14 + 3 >= v21) {
            return 0;
          }
          unint64_t v15 = *(void *)(v20 + 8 * v5);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 24 * v13);
    uint64_t v18 = *v17;
    if (*v17 == a2 && v17[1] == a3)
    {
      uint64_t v18 = a2;
LABEL_29:
      swift_bridgeObjectRetain();
      return v18;
    }
    uint64_t result = sub_21CB88F50();
    if (result) {
      goto LABEL_29;
    }
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v21) {
    return 0;
  }
  unint64_t v15 = *(void *)(v20 + 8 * v16);
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
    if (v5 >= v21) {
      return 0;
    }
    unint64_t v15 = *(void *)(v20 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_21CB4DE30(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  sub_21CB4E858();
  uint64_t result = sub_21CB88750();
  uint64_t v18 = result;
  if (v3)
  {
    int64_t v5 = (unsigned __int8 *)(a1 + 58);
    do
    {
      uint64_t v6 = *(void *)(v5 - 26);
      uint64_t v7 = *(void *)(v5 - 18);
      uint64_t v8 = *(void *)(v5 - 10);
      int v9 = *(v5 - 2);
      int v10 = *(v5 - 1);
      int v12 = *v5;
      v5 += 32;
      int v11 = v12;
      unsigned int v13 = v1 & 0xFF000000 | v9;
      if (v10) {
        int v14 = 256;
      }
      else {
        int v14 = 0;
      }
      int v15 = v13 | v14;
      if (v11) {
        int v16 = 0x10000;
      }
      else {
        int v16 = 0;
      }
      int v1 = v15 | v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21CB61420((uint64_t)v17, v6, v7, v8, v1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
    return v18;
  }
  return result;
}

uint64_t sub_21CB4DF28(uint64_t a1)
{
  uint64_t v2 = sub_21CB87CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_21CA365D0(&qword_267C97870, MEMORY[0x263F3CF58]);
  uint64_t result = sub_21CB88750();
  uint64_t v17 = result;
  if (v9)
  {
    unsigned int v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    int v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v5, v14, v2);
      sub_21CB6190C((uint64_t)v8, v5);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_21CB4E0C4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  sub_21CB4D4D4();
  uint64_t result = sub_21CB88750();
  uint64_t v17 = result;
  if (v3)
  {
    int64_t v5 = (unsigned __int8 *)(a1 + 50);
    do
    {
      uint64_t v6 = *(void *)(v5 - 18);
      uint64_t v7 = *(void *)(v5 - 10);
      int v8 = *(v5 - 2);
      int v9 = *(v5 - 1);
      int v11 = *v5;
      v5 += 24;
      int v10 = v11;
      unsigned int v12 = v1 & 0xFF000000 | v8;
      if (v9) {
        int v13 = 256;
      }
      else {
        int v13 = 0;
      }
      int v14 = v12 | v13;
      if (v10) {
        int v15 = 0x10000;
      }
      else {
        int v15 = 0;
      }
      int v1 = v14 | v15;
      swift_bridgeObjectRetain();
      sub_21CB61C30((uint64_t)&v16, v6, v7, v1);
      swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
    return v17;
  }
  return result;
}

uint64_t sub_21CB4E19C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_21CA57E34((uint64_t *)&unk_267C95220);
  sub_21CB4EA80();
  uint64_t result = sub_21CB88750();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_21CB61EF8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21CB4E240()
{
  return sub_21CB2BCA8(41);
}

uint64_t sub_21CB4E248(uint64_t a1)
{
  return sub_21CB493E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40));
}

uint64_t sub_21CB4E258()
{
  return sub_21CB2BCA8(41);
}

uint64_t sub_21CB4E260()
{
  return sub_21CB496F8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_21CB4E270()
{
  return sub_21CB4E9F0(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_21CB4E29C(uint64_t a1)
{
  return sub_21CB4828C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_21CB4E2AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21CB4E2E4()
{
  return sub_21CB4E9F0(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_21CB4E310()
{
  return sub_21CB4EA68((uint64_t (*)(void, void, void, void, void))sub_21CB485A0);
}

uint64_t sub_21CB4E328()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_21CB4E360(uint64_t a1)
{
  return sub_21CB47144(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_21CB4E36C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21CB4E3A4()
{
  return sub_21CB4743C(*(unsigned char *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21CB4E3B0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21CB4E3E8(void *a1)
{
  sub_21CB463DC(a1, *(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_21CB4E3F4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21CB4E444(void *a1, void *a2)
{
  return sub_21CB44C24(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_21CB4E458()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_21CB4E4B8()
{
  sub_21CB44F7C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void **)(v0 + 72));
}

uint64_t sub_21CB4E4D0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21CB4E508()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EED8], MEMORY[0x263F8EED8], 32);
}

uint64_t sub_21CB4E538(uint64_t a1)
{
  return sub_21CB43628(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_21CB4E540@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_21CA02F5C(*(unsigned char *)(v1 + 16));
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_21CB4E578()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21CB4E5C0()
{
  return sub_21CB43B98(v0[2], v0[3], v0[4]);
}

uint64_t sub_21CB4E5CC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21CB4E61C()
{
  return sub_21CB44020(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_21CB4E62C()
{
  return sub_21CB42180(v0);
}

uint64_t sub_21CB4E634()
{
  return sub_21CB41D94();
}

uint64_t sub_21CB4E63C()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0], 32);
}

uint64_t sub_21CB4E66C()
{
  return sub_21CB3E43C(*(void *)(v0 + 16), *(void *)(v0 + 24), (void (*)(uint64_t))sub_21CB170C0);
}

uint64_t sub_21CB4E69C()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0], 32);
}

uint64_t sub_21CB4E6CC()
{
  return sub_21CB3E43C(*(void *)(v0 + 16), *(void *)(v0 + 24), (void (*)(uint64_t))sub_21CB170A0);
}

uint64_t sub_21CB4E700()
{
  return sub_21CB3D89C(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), (void (*)(uint64_t))sub_21CB1796C, (void (*)(uint64_t))sub_21CB17284);
}

uint64_t sub_21CB4E74C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21CB4E78C()
{
  return sub_21CB3D89C(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), (void (*)(uint64_t))sub_21CB172A8, (void (*)(uint64_t))sub_21CB17260);
}

uint64_t sub_21CB4E7D4(unint64_t a1)
{
  return sub_21CB3BF74(a1);
}

uint64_t sub_21CB4E7DC(uint64_t a1)
{
  return sub_21CB3C548(a1);
}

uint64_t sub_21CB4E7E4()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8], 32);
}

uint64_t sub_21CB4E814()
{
  return sub_21CB3C840();
}

uint64_t sub_21CB4E81C()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8], 33);
}

uint64_t sub_21CB4E84C()
{
  return sub_21CB3C324(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

unint64_t sub_21CB4E858()
{
  unint64_t result = qword_267C97868;
  if (!qword_267C97868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97868);
  }
  return result;
}

uint64_t sub_21CB4E8AC()
{
  return sub_21CB4E8DC(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8], 33);
}

uint64_t sub_21CB4E8DC(void (*a1)(void), void (*a2)(void), uint64_t a3)
{
  a1(*(void *)(v3 + 16));
  a2(*(void *)(v3 + 24));

  return MEMORY[0x270FA0238](v3, a3, 7);
}

void sub_21CB4E940()
{
  sub_21CB40858(*(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_21CB4E94C()
{
  return sub_21CB2BCA8(43);
}

uint64_t sub_21CB4E954()
{
  return sub_21CB4E96C((uint64_t (*)(void, void, void, void))sub_21CB419AC);
}

uint64_t sub_21CB4E96C(uint64_t (*a1)(void, void, void, void))
{
  if (*(unsigned char *)(v1 + 41)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  int v3 = v2 | *(unsigned __int8 *)(v1 + 40);
  if (*(unsigned char *)(v1 + 42)) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  return a1(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v3 | v4);
}

uint64_t sub_21CB4E9AC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_21CAB561C(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_21CB4E9C4()
{
  return sub_21CB4E9F0(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB4E9F0(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 24));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v2, 56, 7);
}

uint64_t sub_21CB4EA50()
{
  return sub_21CB4EA68((uint64_t (*)(void, void, void, void, void))sub_21CB3ED94);
}

uint64_t sub_21CB4EA68(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

unint64_t sub_21CB4EA80()
{
  unint64_t result = qword_267C97878;
  if (!qword_267C97878)
  {
    sub_21CA5EEBC((uint64_t *)&unk_267C95220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97878);
  }
  return result;
}

uint64_t FMFGetURLInfoAction.__allocating_init(url:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  uint64_t v4 = sub_21CB87480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  *(unsigned char *)(v2 + 16) = 0;
  return v2;
}

uint64_t FMFGetURLInfoAction.init(url:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  uint64_t v4 = sub_21CB87480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  *(unsigned char *)(v1 + 16) = 0;
  return v1;
}

uint64_t sub_21CB4ECE0()
{
  return 60;
}

unint64_t sub_21CB4EE4C()
{
  unint64_t result = qword_267C97880;
  if (!qword_267C97880)
  {
    sub_21CB87480();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97880);
  }
  return result;
}

void FMFGetURLInfoAction.__allocating_init(requiresRefresh:)()
{
}

void FMFGetURLInfoAction.init(requiresRefresh:)()
{
}

uint64_t sub_21CB4EF04()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  uint64_t v2 = sub_21CB87480();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t FMFGetURLInfoAction.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  uint64_t v2 = sub_21CB87480();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FMFGetURLInfoAction.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url;
  uint64_t v2 = sub_21CB87480();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_21CB4F074()
{
  return type metadata accessor for FMFGetURLInfoAction();
}

uint64_t type metadata accessor for FMFGetURLInfoAction()
{
  uint64_t result = qword_267C97888;
  if (!qword_267C97888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21CB4F0C8()
{
  uint64_t result = sub_21CB87480();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FMFGetURLInfoAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FMFGetURLInfoAction);
}

uint64_t dispatch thunk of FMFGetURLInfoAction.__allocating_init(url:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t FMFRespondToInviteAction.__allocating_init(friendId:accepted:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = a1;
  *(void *)(result + 32) = a2;
  *(unsigned char *)(result + 40) = a3;
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t FMFRespondToInviteAction.init(friendId:accepted:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(unsigned char *)(v3 + 40) = a3;
  *(unsigned char *)(v3 + 16) = 0;
  return v3;
}

uint64_t sub_21CB4F1E4()
{
  return 60;
}

void FMFRespondToInviteAction.__allocating_init(requiresRefresh:)()
{
}

void FMFRespondToInviteAction.init(requiresRefresh:)()
{
}

uint64_t sub_21CB4F440()
{
  return swift_bridgeObjectRelease();
}

uint64_t FMFRespondToInviteAction.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FMFRespondToInviteAction.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FMFRespondToInviteAction()
{
  return self;
}

uint64_t method lookup function for FMFRespondToInviteAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FMFRespondToInviteAction);
}

uint64_t dispatch thunk of FMFRespondToInviteAction.__allocating_init(friendId:accepted:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_21CB4F4F0(uint64_t a1)
{
  uint64_t v22 = sub_21CB87CC0();
  uint64_t v3 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v6) {
    return v7;
  }
  v19[0] = v1;
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_21CA443E0(0, v6, 0);
  uint64_t v7 = v24;
  uint64_t result = sub_21CA44CF4(a1);
  int64_t v9 = result;
  int v11 = v10;
  int v13 = v12 & 1;
  uint64_t v20 = v3;
  uint64_t v21 = a1 + 56;
  v19[1] = v3 + 32;
  uint64_t v14 = MEMORY[0x263F8EE78];
  while ((v9 & 0x8000000000000000) == 0 && v9 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(v21 + (((unint64_t)v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v11) {
      goto LABEL_14;
    }
    int v23 = v13;
    swift_bridgeObjectRetain_n();
    sub_21CB6114C(v14);
    sub_21CB87CA0();
    swift_bridgeObjectRelease();
    uint64_t v24 = v7;
    unint64_t v16 = *(void *)(v7 + 16);
    unint64_t v15 = *(void *)(v7 + 24);
    if (v16 >= v15 >> 1)
    {
      sub_21CA443E0(v15 > 1, v16 + 1, 1);
      uint64_t v7 = v24;
    }
    *(void *)(v7 + 16) = v16 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v7+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v16, v5, v22);
    uint64_t result = sub_21CA44500(v9, v11, v23 & 1, a1);
    int64_t v9 = result;
    int v11 = v17;
    int v13 = v18 & 1;
    if (!--v6)
    {
      sub_21CAB561C(result, v17, v13);
      return v7;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

void sub_21CB4F760(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t FMFActionStatus.rawValue.getter()
{
  return qword_21CB921E8[*v0];
}

FMFCore::FMFActionStatus_optional __swiftcall FMFActionStatus.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 200) {
    char v2 = 2;
  }
  else {
    char v2 = 3;
  }
  if (rawValue) {
    char v3 = v2;
  }
  else {
    char v3 = 1;
  }
  if (rawValue == -1) {
    char v3 = 0;
  }
  char *v1 = v3;
  return (FMFCore::FMFActionStatus_optional)rawValue;
}

BOOL sub_21CB4F80C(char *a1, char *a2)
{
  return qword_21CB921E8[*a1] == qword_21CB921E8[*a2];
}

uint64_t sub_21CB4F830()
{
  return sub_21CB89090();
}

uint64_t sub_21CB4F880()
{
  return sub_21CB89060();
}

uint64_t sub_21CB4F8B8()
{
  return sub_21CB89090();
}

FMFCore::FMFActionStatus_optional sub_21CB4F904(Swift::Int *a1)
{
  return FMFActionStatus.init(rawValue:)(*a1);
}

void sub_21CB4F90C(void *a1@<X8>)
{
  *a1 = qword_21CB921E8[*v1];
}

uint64_t sub_21CB4F92C()
{
  uint64_t v1 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  swift_retain_n();
  char v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = *(void *)(v1 + 16);
    unint64_t v7 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_21CA30E24(0xCuLL, v6, v7);
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x21D4B5450](v8, v10, v12, v14);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_21CA4E450(v15, v17, &v20);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v3, v4, "FMFActionsController<%s>.deinit", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v19, -1, -1);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRelease();
  sub_21CA640FC(v1 + 32);
  swift_release();

  sub_21CA2B0D0(v1 + 64);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21CB4FB74()
{
  sub_21CB4F92C();

  return swift_deallocClassInstance();
}

uint64_t sub_21CB4FBA8(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21CB4C364(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_21CB65B50(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21CB4FC18(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v4 = v3;
  uint64_t v92 = a3;
  uint64_t v91 = a2;
  uint64_t v6 = sub_21CB87CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v101 = v6;
  uint64_t v102 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v87 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v89 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_21CB88100();
  uint64_t v95 = *(void (***)(char *, uint64_t))(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v99 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_21CB88150();
  uint64_t v94 = *(void (***)(char *, uint64_t))(v98 - 8);
  MEMORY[0x270FA5388](v98);
  unint64_t v97 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v96 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v15 - 8);
  unint64_t v17 = (uint8_t *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21CA57E34(&qword_267C96F10);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v90 = (uint64_t)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v84 - v21;
  uint64_t v23 = type metadata accessor for FMFFriend();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v104 = v23;
  uint64_t v105 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v88 = (uint64_t *)((char *)&v84 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (uint64_t *)((char *)&v84 - v28);
  MEMORY[0x270FA5388](v27);
  uint64_t v86 = (uint64_t)&v84 - v30;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_21CB880A0();
  sub_21CA4CC18(v31, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v32 = sub_21CB88070();
  os_log_type_t v33 = sub_21CB88880();
  BOOL v34 = os_log_type_enabled(v32, v33);
  unint64_t v93 = a1;
  uint64_t v103 = v22;
  if (v34)
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(void *)&long long aBlock = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v85 = v35 + 4;
    uint64_t v112 = *v4;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v37 = sub_21CB88310();
    uint64_t v112 = sub_21CA4E450(v37, v38, (uint64_t *)&aBlock);
    sub_21CB889C0();
    a1 = v93;
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v32, v33, "%s: shareLocation action initiated", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v36, -1, -1);
    MEMORY[0x21D4B6B70](v35, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v39 = a1[5];
  if (v39)
  {
    uint64_t v85 = v17;
    uint64_t v40 = a1[4];
    uint64_t v41 = v4[6];
    sub_21CA57E34(&qword_267C95D50);
    uint64_t v84 = v41;
    sub_21CB88910();
    uint64_t v42 = *(void *)(aBlock + 16);
    if (v42)
    {
      uint64_t v43 = aBlock + ((*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80));
      uint64_t v44 = *(void *)(v105 + 72);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_21CA2E134(v43, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for FMFFriend);
        uint64_t v45 = v29[1];
        *(void *)&long long aBlock = *v29;
        *((void *)&aBlock + 1) = v45;
        uint64_t v112 = v40;
        uint64_t v113 = v39;
        sub_21CA4D63C();
        if (sub_21CB88A30()) {
          break;
        }
        sub_21CB66EB0((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for FMFFriend);
        v43 += v44;
        if (!--v42)
        {
          swift_bridgeObjectRelease();
          a1 = v93;
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v49 = (uint64_t)v103;
      sub_21CB71074((uint64_t)v29, (uint64_t)v103, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v47 = v104;
      uint64_t v46 = v105;
      uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56);
      v48(v49, 0, 1, v104);
      a1 = v93;
    }
    else
    {
LABEL_12:
      uint64_t v47 = v104;
      uint64_t v46 = v105;
      uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56);
      uint64_t v49 = (uint64_t)v103;
      v48((uint64_t)v103, 1, 1, v104);
    }
    swift_bridgeObjectRelease();
    int v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v49, 1, v47);
    uint64_t v51 = (uint64_t)v85;
    if (v50 != 1)
    {
      uint64_t v63 = (uint64_t)v96;
      uint64_t v64 = v86;
      sub_21CB71074(v49, v86, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v65 = v90;
      sub_21CA2E134(v64, v90, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      v48(v65, 0, 1, v47);
      uint64_t v66 = type metadata accessor for FMFIntermediateFriend();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v51, 1, 1, v66);
      uint64_t v112 = 1;
      LOBYTE(v113) = 0;
      uint64_t v110 = 0;
      char v111 = 1;
      uint64_t v67 = type metadata accessor for FMFLocation();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v63, 1, 1, v67);
      uint64_t v109 = 0;
      long long v107 = 0u;
      long long v108 = 0u;
      long long aBlock = 0u;
      int v68 = v88;
      sub_21CA5572C(v65, v51, (unint64_t *)&v112, (uint64_t)&v110, v63, 0, 1, (uint64_t *)&aBlock, v88, 0, 0, 2u, 2u, 2);
      sub_21CB66EB0(v64, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      sub_21CB71074((uint64_t)v68, v64, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      LOBYTE(aBlock) = 2;
      sub_21CB26744(v64, &aBlock);
      sub_21CB66EB0(v64, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      goto LABEL_23;
    }
    sub_21CA1B88C(v49, &qword_267C96F10);
  }
  uint64_t v90 = a1[3];
  uint64_t v52 = *(void *)(v90 + 16);
  if (v52)
  {
    uint64_t v88 = v4;
    uint64_t v103 = v4 + 4;
    uint64_t v96 = (char *)&v107;
    ++v95;
    ++v94;
    uint64_t v53 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    unint64_t v54 = v97;
    BOOL v55 = v99;
    do
    {
      uint64_t v56 = *(v53 - 1);
      uint64_t v57 = *v53;
      uint64_t v58 = MEMORY[0x21D4B6C80](v103);
      if (v58)
      {
        uint64_t v59 = *(void *)(v58 + 88);
        uint64_t v105 = *(void *)(v59 + 56);
        uint64_t v60 = (void *)swift_allocObject();
        v60[2] = v59;
        v60[3] = v56;
        v60[4] = v57;
        *(void *)&long long v108 = sub_21CB66DC4;
        *((void *)&v108 + 1) = v60;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v107 = sub_21CA1B084;
        *((void *)&v107 + 1) = &unk_26CD70EA8;
        uint64_t v61 = _Block_copy(&aBlock);
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        sub_21CB88120();
        uint64_t v112 = MEMORY[0x263F8EE78];
        sub_21CB66900((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
        sub_21CA57E34((uint64_t *)&unk_267C96DD0);
        sub_21CA6D91C();
        uint64_t v104 = v57;
        uint64_t v62 = v100;
        sub_21CB88A60();
        MEMORY[0x21D4B5A20](0, v54, v55, v61);
        _Block_release(v61);
        (*v95)(v55, v62);
        (*v94)(v54, v98);
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      v53 += 2;
      --v52;
    }
    while (v52);
    swift_bridgeObjectRelease();
    os_log_type_t v4 = v88;
    a1 = v93;
  }
LABEL_23:
  uint64_t v69 = sub_21CB87190();
  *((void *)&v107 + 1) = v69;
  *(void *)&long long v108 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v70 = sub_21CA6D80C((uint64_t *)&aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v69 - 8) + 104))(v70, *MEMORY[0x263F3CA30], v69);
  char v71 = MEMORY[0x21D4B4280](&aBlock);
  sub_21CA2B0D0((uint64_t)&aBlock);
  uint64_t v72 = a1[3];
  if ((v71 & 1) == 0) {
    return sub_21CB51374(a1[3], (uint64_t)a1, v91, v92);
  }
  int64_t v73 = *(void *)(v72 + 16);
  if (v73)
  {
    uint64_t v88 = v4;
    *(void *)&long long aBlock = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21CA443E0(0, v73, 0);
    uint64_t v74 = aBlock;
    uint64_t v105 = v72;
    uint64_t v75 = v72 + 40;
    uint64_t v76 = v87;
    do
    {
      swift_bridgeObjectRetain();
      sub_21CB87CA0();
      *(void *)&long long aBlock = v74;
      unint64_t v78 = *(void *)(v74 + 16);
      unint64_t v77 = *(void *)(v74 + 24);
      if (v78 >= v77 >> 1)
      {
        sub_21CA443E0(v77 > 1, v78 + 1, 1);
        uint64_t v74 = aBlock;
      }
      v75 += 16;
      *(void *)(v74 + 16) = v78 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v102 + 32))(v74+ ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80))+ *(void *)(v102 + 72) * v78, v76, v101);
      --v73;
    }
    while (v73);
    swift_bridgeObjectRelease();
    os_log_type_t v4 = v88;
    a1 = v93;
  }
  else
  {
    uint64_t v74 = MEMORY[0x263F8EE78];
  }
  uint64_t v80 = sub_21CB88640();
  uint64_t v81 = (uint64_t)v89;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56))(v89, 1, 1, v80);
  uint64_t v82 = (void *)swift_allocObject();
  v82[2] = 0;
  v82[3] = 0;
  v82[4] = v74;
  v82[5] = a1;
  uint64_t v83 = v91;
  v82[6] = v4;
  v82[7] = v83;
  v82[8] = v92;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21CB09F98(v81, (uint64_t)&unk_267C97920, (uint64_t)v82);
  return swift_release();
}

uint64_t sub_21CB50A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  sub_21CA57E34(&qword_267C978E0);
  v8[8] = swift_task_alloc();
  uint64_t v9 = sub_21CB87870();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  sub_21CB878E0();
  v8[12] = swift_task_alloc();
  uint64_t v10 = sub_21CB87940();
  v8[13] = v10;
  v8[14] = *(void *)(v10 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB50C18, 0, 0);
}

uint64_t sub_21CB50C18()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[16] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: perform offer location", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[4];

  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *MEMORY[0x263F3CCF8], v6);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[17] = sub_21CB87E30();
  uint64_t v10 = sub_21CB87CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = v9 + OBJC_IVAR____TtC7FMFCore22FMFShareLocationAction_duration;
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[18] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_21CB50E54;
  uint64_t v13 = v0[15];
  uint64_t v14 = v0[8];
  uint64_t v15 = v0[3];
  return MEMORY[0x270F29698](v13, v15, v14, v11, 0);
}

uint64_t sub_21CB50E54()
{
  uint64_t v2 = *v1;
  (*v1)[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[8], &qword_267C978E0);
    swift_bridgeObjectRelease();
    swift_release();
    os_log_type_t v3 = sub_21CB51150;
  }
  else
  {
    uint64_t v5 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v6 = v2[13];
    uint64_t v7 = v2[8];
    swift_bridgeObjectRelease();
    swift_release();
    sub_21CA1B88C(v7, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    os_log_type_t v3 = sub_21CB50FF4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB50FF4()
{
  uint64_t v10 = v0;
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2) {
    sub_21CB27000(*(void *)(v1 + 32), v2, 0);
  }
  if (MEMORY[0x21D4B6C80](v0[5] + 32))
  {
    sub_21CB0D468();
    swift_unknownObjectRelease();
  }
  os_log_type_t v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21CA00000, v3, v4, "FMFActionsController: share location operation completed.", v5, 2u);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }
  uint64_t v6 = (void (*)(char *, void))v0[6];

  char v9 = 2;
  v6(&v9, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_21CB51150()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2) {
    sub_21CB27000(*(void *)(v1 + 32), v2, 1);
  }
  os_log_type_t v3 = (void *)v0[19];
  id v4 = v3;
  id v5 = v3;
  uint64_t v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  BOOL v8 = os_log_type_enabled(v6, v7);
  char v9 = (void *)v0[19];
  if (v8)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v9;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v13;
    sub_21CB889C0();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_21CA00000, v6, v7, "FMFActionsController: error offering location: %@", v10, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v11, -1, -1);
    MEMORY[0x21D4B6B70](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (void *)v0[19];
  uint64_t v15 = (void (*)(char *, void *))v0[6];
  char v19 = 0;
  id v16 = v14;
  v15(&v19, v14);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_21CB51374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v41 = a3;
  uint64_t v6 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v6 - 8);
  BOOL v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21CA57E34((uint64_t *)&unk_267C951B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21CB87190();
  uint64_t v45 = (void *)v12;
  uint64_t v13 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v46 = (uint64_t (*)(uint64_t, void *))v13;
  uint64_t v14 = sub_21CA6D80C((uint64_t *)aBlock);
  uint64_t v15 = *MEMORY[0x263F3CA28];
  id v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  v16(v14, v15, v12);
  char v17 = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v17)
  {
    uint64_t v45 = (void *)v12;
    uint64_t v46 = (uint64_t (*)(uint64_t, void *))v13;
    uint64_t v18 = sub_21CA6D80C((uint64_t *)aBlock);
    v16(v18, v15, v12);
    char v19 = MEMORY[0x21D4B4280](aBlock);
    uint64_t result = sub_21CA2B0D0((uint64_t)aBlock);
    if (v19)
    {
      uint64_t v21 = sub_21CB88640();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
      uint64_t v22 = (void *)swift_allocObject();
      v22[2] = 0;
      uint64_t v22[3] = 0;
      uint64_t v23 = v41;
      uint64_t v24 = v42;
      v22[4] = a1;
      v22[5] = v24;
      v22[6] = a2;
      v22[7] = v23;
      v22[8] = v43;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98((uint64_t)v8, (uint64_t)&unk_267C97910, (uint64_t)v22);
      return swift_release();
    }
  }
  else
  {
    uint64_t v48 = MEMORY[0x263F8EE88];
    uint64_t v25 = *(void *)(a1 + 16);
    if (v25)
    {
      uint64_t v26 = self;
      swift_bridgeObjectRetain();
      uint64_t v27 = a1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        uint64_t v28 = (void *)sub_21CB882C0();
        id v29 = objc_msgSend(v26, sel_handleWithId_, v28);

        if (v29)
        {
          sub_21CB6166C(aBlock, v29);
        }
        swift_bridgeObjectRelease();
        v27 += 16;
        --v25;
      }
      while (v25);
      swift_bridgeObjectRelease();
    }
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA80]), sel_init);
    uint64_t v31 = swift_bridgeObjectRetain();
    sub_21CB5188C(v31);
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)sub_21CB88720();
    swift_bridgeObjectRelease();
    sub_21CA83354((uint64_t)v11);
    uint64_t v33 = sub_21CB87590();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v11, 1, v33) != 1)
    {
      uint64_t v35 = (void *)sub_21CB87510();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v33);
    }
    uint64_t v36 = (void *)swift_allocObject();
    uint64_t v37 = v41;
    uint64_t v38 = v42;
    v36[2] = a2;
    v36[3] = v38;
    uint64_t v39 = v43;
    v36[4] = v37;
    v36[5] = v39;
    uint64_t v46 = sub_21CB66CC0;
    uint64_t v47 = v36;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    uint64_t aBlock[2] = sub_21CB52144;
    uint64_t v45 = &unk_26CD70E30;
    uint64_t v40 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_, v32, 0, 0, v35, v40);
    _Block_release(v40);

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21CB5188C(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_21CB88AA0()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x263F8EE88];
    if (v2) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v30 = v1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t result = swift_retain();
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  sub_21CA57E34(&qword_267C978F0);
  uint64_t v3 = sub_21CB88B40();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CB88A90();
  sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
  sub_21CB66C54();
  uint64_t result = sub_21CB88780();
  uint64_t v1 = v34;
  uint64_t v30 = v35;
  uint64_t v5 = v36;
  uint64_t v6 = v37;
  unint64_t v7 = v38;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v11 = v3 + 56;
  while (v1 < 0)
  {
    uint64_t v16 = sub_21CB88AC0();
    if (!v16) {
      goto LABEL_45;
    }
    *(void *)&long long v31 = v16;
    sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
    swift_dynamicCast();
LABEL_36:
    sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
    swift_dynamicCast();
    uint64_t result = sub_21CB88AE0();
    uint64_t v22 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v11 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = *(void *)(v3 + 48) + 40 * v12;
    *(_OWORD *)uint64_t v13 = v31;
    *(_OWORD *)(v13 + 16) = v32;
    *(void *)(v13 + 32) = v33;
    ++*(void *)(v3 + 16);
  }
  if (v7)
  {
    unint64_t v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_35:
    id v21 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    goto LABEL_36;
  }
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v29) {
      goto LABEL_45;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    uint64_t v19 = v6 + 1;
    if (!v18)
    {
      uint64_t v19 = v6 + 2;
      if (v6 + 2 >= v29) {
        goto LABEL_45;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v19);
      if (!v18)
      {
        uint64_t v19 = v6 + 3;
        if (v6 + 3 >= v29) {
          goto LABEL_45;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v19);
        if (!v18)
        {
          uint64_t v19 = v6 + 4;
          if (v6 + 4 >= v29) {
            goto LABEL_45;
          }
          unint64_t v18 = *(void *)(v30 + 8 * v19);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            if (v6 + 5 >= v29) {
              goto LABEL_45;
            }
            unint64_t v18 = *(void *)(v30 + 8 * v19);
            if (!v18)
            {
              uint64_t v20 = v6 + 6;
              while (v29 != v20)
              {
                unint64_t v18 = *(void *)(v30 + 8 * v20++);
                if (v18)
                {
                  uint64_t v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_21CA7CFF0();
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

uint64_t sub_21CB51CB4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *))
{
  uint64_t v8 = *(void *)(a3 + 40);
  if (v8) {
    sub_21CB27000(*(void *)(a3 + 32), v8, a2 != 0);
  }
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_21CB880A0();
    sub_21CA4CC18(v9, (uint64_t)qword_267CA5368);
    swift_retain();
    id v10 = a2;
    swift_retain();
    id v11 = a2;
    unint64_t v12 = sub_21CB88070();
    os_log_type_t v13 = sub_21CB88880();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v29 = v15;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v16 = sub_21CB88310();
      sub_21CA4E450(v16, v17, &v29);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v14 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v18 = sub_21CB88990();
      sub_21CA4E450(v18, v19, &v29);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v12, v13, "%s: error when sharing location: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v15, -1, -1);
      MEMORY[0x21D4B6B70](v14, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v29) = 0;
    BOOL v27 = a2;
  }
  else
  {
    if (MEMORY[0x21D4B6C80](a4 + 32))
    {
      sub_21CB0D468();
      swift_unknownObjectRelease();
    }
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_21CB880A0();
    sub_21CA4CC18(v20, (uint64_t)qword_267CA5368);
    swift_retain_n();
    id v21 = sub_21CB88070();
    os_log_type_t v22 = sub_21CB88880();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)unint64_t v23 = 136315138;
      uint64_t v29 = v24;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v25 = sub_21CB88310();
      sub_21CA4E450(v25, v26, &v29);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v21, v22, "%s: share location operation completed.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v24, -1, -1);
      MEMORY[0x21D4B6B70](v23, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    LOBYTE(v29) = 2;
    BOOL v27 = 0;
  }
  return a5(&v29, v27);
}

uint64_t sub_21CB52144(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_21CB88200();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB521F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[7] = a4;
  uint64_t v9 = sub_21CB87CC0();
  v8[12] = v9;
  v8[13] = *(void *)(v9 - 8);
  v8[14] = swift_task_alloc();
  sub_21CA57E34(&qword_267C978E0);
  v8[15] = swift_task_alloc();
  uint64_t v10 = sub_21CB87940();
  v8[16] = v10;
  v8[17] = *(void *)(v10 - 8);
  v8[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB52344, 0, 0);
}

uint64_t sub_21CB52344()
{
  uint64_t v1 = v0[7];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[13];
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_21CA443E0(0, v2, 0);
    uint64_t v4 = v16;
    uint64_t v5 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_21CB87CA0();
      unint64_t v7 = *(void *)(v16 + 16);
      unint64_t v6 = *(void *)(v16 + 24);
      if (v7 >= v6 >> 1) {
        sub_21CA443E0(v6 > 1, v7 + 1, 1);
      }
      uint64_t v8 = v0[14];
      uint64_t v9 = v0[12];
      *(void *)(v16 + 16) = v7 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v16+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v7, v8, v9);
      v5 += 16;
      --v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  v0[19] = v4;
  uint64_t v10 = v0[9];
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[13] + 56))(v0[15], 1, 1, v0[12]);
  uint64_t v11 = v10 + OBJC_IVAR____TtC7FMFCore22FMFShareLocationAction_duration;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[20] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_21CB52538;
  uint64_t v13 = v0[18];
  uint64_t v14 = v0[15];
  return MEMORY[0x270F29698](v13, v4, v14, v11, 0);
}

uint64_t sub_21CB52538()
{
  int64_t v2 = *v1;
  (*v1)[21] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[15], &qword_267C978E0);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_21CB52960;
  }
  else
  {
    uint64_t v5 = v2[17];
    uint64_t v4 = v2[18];
    uint64_t v8 = v2 + 15;
    uint64_t v6 = v2[15];
    uint64_t v7 = v8[1];
    swift_bridgeObjectRelease();
    sub_21CA1B88C(v6, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
    uint64_t v3 = sub_21CB526C0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB526C0()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0[9];
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2) {
    sub_21CB27000(*(void *)(v1 + 32), v2, 0);
  }
  if (MEMORY[0x21D4B6C80](v0[8] + 32))
  {
    sub_21CB0D468();
    swift_unknownObjectRelease();
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21CB880A0();
  sub_21CA4CC18(v3, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[8];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    v0[5] = *v7;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v10 = sub_21CB88310();
    v0[6] = sub_21CA4E450(v10, v11, &v16);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v4, v5, "%s: share location operation completed.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v9, -1, -1);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v12 = (void (*)(char *, void))v0[10];
  char v15 = 2;
  v12(&v15, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_21CB52960()
{
  unint64_t v26 = v0;
  uint64_t v1 = v0[9];
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2) {
    sub_21CB27000(*(void *)(v1 + 32), v2, 1);
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)v0[21];
  uint64_t v4 = sub_21CB880A0();
  sub_21CA4CC18(v4, (uint64_t)qword_267CA5368);
  swift_retain();
  id v5 = v3;
  swift_retain();
  id v6 = v3;
  uint64_t v7 = sub_21CB88070();
  os_log_type_t v8 = sub_21CB88880();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[21];
  unint64_t v11 = (void *)v0[8];
  if (v9)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v25 = v23;
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[2] = *v11;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v14 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v14, v15, &v25);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2112;
    id v16 = v10;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v17;
    sub_21CB889C0();
    *uint64_t v13 = v17;

    _os_log_impl(&dword_21CA00000, v7, v8, "%s: error when sharing location: %@", (uint8_t *)v12, 0x16u);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v23, -1, -1);
    MEMORY[0x21D4B6B70](v12, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  uint64_t v18 = (void *)v0[21];
  unint64_t v19 = (void (*)(char *, void *))v0[10];
  char v24 = 0;
  id v20 = v18;
  v19(&v24, v18);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_21CB52CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  sub_21CA57E34(&qword_267C978E0);
  v8[8] = swift_task_alloc();
  uint64_t v9 = sub_21CB87870();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  sub_21CB878E0();
  v8[12] = swift_task_alloc();
  uint64_t v10 = sub_21CB87940();
  v8[13] = v10;
  v8[14] = *(void *)(v10 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB52E2C, 0, 0);
}

uint64_t sub_21CB52E2C()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[16] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: perform stop sharing my location", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[8];

  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *MEMORY[0x263F3CCF8], v6);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[17] = sub_21CB87E30();
  uint64_t v9 = swift_bridgeObjectRetain();
  size_t v10 = sub_21CABAFD0(v9);
  v0[18] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21CB87CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[19] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_21CB53064;
  uint64_t v13 = v0[15];
  uint64_t v14 = v0[8];
  return MEMORY[0x270F29620](v13, v10, v14, 0);
}

uint64_t sub_21CB53064()
{
  uint64_t v2 = *v1;
  (*v1)[20] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[8], &qword_267C978E0);
    swift_release();
    swift_release();
    os_log_type_t v3 = sub_21CB53370;
  }
  else
  {
    uint64_t v5 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v6 = v2[13];
    uint64_t v7 = v2[8];
    swift_release();
    swift_release();
    sub_21CA1B88C(v7, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    os_log_type_t v3 = sub_21CB53214;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB53214()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[4];
  sub_21CB27000(*(void *)(v0[5] + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend), *(void *)(v0[5] + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend + 8), 0);
  if (MEMORY[0x21D4B6C80](v1 + 32))
  {
    sub_21CB0D468();
    swift_unknownObjectRelease();
  }
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: Stop share completed successfully.", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = (void (*)(char *, void))v0[6];

  char v8 = 2;
  v5(&v8, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21CB53370()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[20];
  sub_21CB27000(*(void *)(v0[5] + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend), *(void *)(v0[5] + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend + 8), 1);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[20];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    char v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_21CB889C0();
    *char v8 = v10;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: Stop share completed with error: %@", v7, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[20];
  }
  uint64_t v12 = (void *)v0[20];
  uint64_t v13 = (void (*)(char *, void *))v0[6];
  char v17 = 0;
  id v14 = v12;
  v13(&v17, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

void sub_21CB5359C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = a2;
  uint64_t v6 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21CB87190();
  uint64_t v40 = (void *)v9;
  uint64_t v10 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t, void *))v10;
  uint64_t v11 = sub_21CA6D80C((uint64_t *)aBlock);
  uint64_t v12 = *MEMORY[0x263F3CA28];
  uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  v13(v11, v12, v9);
  char v14 = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v14)
  {
    uint64_t v40 = (void *)v9;
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t, void *))v10;
    unint64_t v15 = sub_21CA6D80C((uint64_t *)aBlock);
    v13(v15, v12, v9);
    char v16 = MEMORY[0x21D4B4280](aBlock);
    sub_21CA2B0D0((uint64_t)aBlock);
    if (v16)
    {
      uint64_t v17 = sub_21CB88640();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = 0;
      uint64_t v18[3] = 0;
      v18[4] = a1;
      v18[5] = v3;
      v18[6] = v38;
      v18[7] = a3;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98((uint64_t)v8, (uint64_t)&unk_267C978D8, (uint64_t)v18);
      swift_release();
    }
  }
  else
  {
    uint64_t v19 = MEMORY[0x263F8EE88];
    uint64_t v43 = MEMORY[0x263F8EE88];
    uint64_t v20 = *(void *)(a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend + 32);
    if (*(void *)(v20 + 16))
    {
      uint64_t v36 = v3;
      uint64_t v37 = a3;
      uint64_t v21 = v20 + 56;
      uint64_t v22 = 1 << *(unsigned char *)(v20 + 32);
      uint64_t v23 = -1;
      if (v22 < 64) {
        uint64_t v23 = ~(-1 << v22);
      }
      uint64_t v24 = v23 & *(void *)(v20 + 56);
      int64_t v25 = (unint64_t)(v22 + 63) >> 6;
      swift_bridgeObjectRetain();
      int64_t v26 = 0;
      if (!v24) {
        goto LABEL_9;
      }
LABEL_8:
      for (v24 &= v24 - 1; ; uint64_t v24 = (v28 - 1) & v28)
      {
        swift_bridgeObjectRetain();
        uint64_t v30 = (void *)sub_21CB882C0();
        swift_bridgeObjectRelease();
        id v31 = objc_msgSend(self, sel_handleWithId_, v30);

        if (!v31) {
          break;
        }
        sub_21CB6166C(aBlock, v31);

        if (v24) {
          goto LABEL_8;
        }
LABEL_9:
        int64_t v27 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          break;
        }
        if (v27 >= v25) {
          goto LABEL_26;
        }
        uint64_t v28 = *(void *)(v21 + 8 * v27);
        ++v26;
        if (!v28)
        {
          int64_t v26 = v27 + 1;
          if (v27 + 1 >= v25) {
            goto LABEL_26;
          }
          uint64_t v28 = *(void *)(v21 + 8 * v26);
          if (!v28)
          {
            int64_t v26 = v27 + 2;
            if (v27 + 2 >= v25) {
              goto LABEL_26;
            }
            uint64_t v28 = *(void *)(v21 + 8 * v26);
            if (!v28)
            {
              int64_t v29 = v27 + 3;
              if (v29 >= v25)
              {
LABEL_26:
                swift_release();
                uint64_t v19 = v43;
                uint64_t v3 = v36;
                a3 = v37;
                goto LABEL_27;
              }
              uint64_t v28 = *(void *)(v21 + 8 * v29);
              if (!v28)
              {
                while (1)
                {
                  int64_t v26 = v29 + 1;
                  if (__OFADD__(v29, 1)) {
                    goto LABEL_30;
                  }
                  if (v26 >= v25) {
                    goto LABEL_26;
                  }
                  uint64_t v28 = *(void *)(v21 + 8 * v26);
                  ++v29;
                  if (v28) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v26 = v29;
            }
          }
        }
LABEL_22:
        ;
      }
      __break(1u);
    }
    else
    {
LABEL_27:
      id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA80]), sel_init);
      sub_21CB5188C(v19);
      swift_bridgeObjectRelease();
      uint64_t v33 = (void *)sub_21CB88720();
      swift_bridgeObjectRelease();
      uint64_t v34 = (void *)swift_allocObject();
      v34[2] = v3;
      v34[3] = a1;
      v34[4] = v38;
      v34[5] = a3;
      uint64_t v41 = sub_21CB66B70;
      uint64_t v42 = v34;
      aBlock[0] = (id)MEMORY[0x263EF8330];
      aBlock[1] = (id)1107296256;
      uint64_t aBlock[2] = sub_21CB53E78;
      uint64_t v40 = &unk_26CD70DB8;
      uint64_t v35 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v32, sel_stopSharingMyLocationWithHandles_groupId_callerId_completion_, v33, 0, 0, v35);
      _Block_release(v35);
    }
  }
}

uint64_t sub_21CB53A94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, void *))
{
  sub_21CB27000(*(void *)(a5 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend), *(void *)(a5 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend + 8), a3 != 0);
  if (a3)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_21CB880A0();
    sub_21CA4CC18(v9, (uint64_t)qword_267CA5368);
    id v10 = a3;
    id v11 = a3;
    uint64_t v12 = sub_21CB88070();
    os_log_type_t v13 = sub_21CB88880();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = v15;
      *(_DWORD *)char v14 = 136315138;
      id v16 = a3;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v17 = sub_21CB88310();
      sub_21CA4E450(v17, v18, &v28);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v12, v13, "Stop share completed with error - %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v15, -1, -1);
      MEMORY[0x21D4B6B70](v14, -1, -1);
    }
    else
    {
    }
    LOBYTE(v28) = 0;
    int64_t v26 = a3;
  }
  else
  {
    if (MEMORY[0x21D4B6C80](a4 + 32))
    {
      sub_21CB0D468();
      swift_unknownObjectRelease();
    }
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_21CB880A0();
    sub_21CA4CC18(v19, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v20 = sub_21CB88070();
    os_log_type_t v21 = sub_21CB88880();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v28 = v23;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v24 = sub_21CB88310();
      sub_21CA4E450(v24, v25, &v28);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v20, v21, "%s: Stop share completed successfully.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v23, -1, -1);
      MEMORY[0x21D4B6B70](v22, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    LOBYTE(v28) = 2;
    int64_t v26 = 0;
  }
  return a6(&v28, v26);
}

uint64_t sub_21CB53E78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_21CB882F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB53F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  sub_21CA57E34(&qword_267C978E0);
  v7[10] = swift_task_alloc();
  uint64_t v8 = sub_21CB87940();
  v7[11] = v8;
  v7[12] = *(void *)(v8 - 8);
  v7[13] = swift_task_alloc();
  uint64_t v9 = sub_21CB87CC0();
  v7[14] = v9;
  v7[15] = *(void *)(v9 - 8);
  v7[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB54060, 0, 0);
}

uint64_t sub_21CB54060()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend;
  v0[17] = OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend;
  uint64_t v3 = *(void *)(v1 + v2 + 32);
  if (!*(void *)(v3 + 16))
  {
    unint64_t v13 = MEMORY[0x263F8EE78];
LABEL_28:
    v0[18] = v13;
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[15] + 56))(v0[10], 1, 1, v0[14]);
    os_log_type_t v21 = (void *)swift_task_alloc();
    v0[19] = v21;
    *os_log_type_t v21 = v0;
    v21[1] = sub_21CB5439C;
    uint64_t v8 = v0[13];
    uint64_t v10 = v0[10];
    unint64_t v9 = v13;
    uint64_t v11 = 0;
    return MEMORY[0x270F29620](v8, v9, v10, v11);
  }
  uint64_t v4 = v0[15];
  uint64_t v23 = v3 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v3 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  uint64_t v7 = v5 & *(void *)(v3 + 56);
  int64_t v24 = (unint64_t)(63 - v6) >> 6;
  uint64_t v8 = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  unint64_t v13 = MEMORY[0x263F8EE78];
  if (!v7) {
    goto LABEL_6;
  }
LABEL_5:
  for (v7 &= v7 - 1; ; uint64_t v7 = (v15 - 1) & v15)
  {
    swift_bridgeObjectRetain();
    sub_21CB87CA0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v13 = sub_21CA44504(0, *(void *)(v13 + 16) + 1, 1, v13);
    }
    unint64_t v18 = *(void *)(v13 + 16);
    unint64_t v17 = *(void *)(v13 + 24);
    if (v18 >= v17 >> 1) {
      unint64_t v13 = sub_21CA44504(v17 > 1, v18 + 1, 1, v13);
    }
    uint64_t v19 = v0[16];
    uint64_t v20 = v0[14];
    *(void *)(v13 + 16) = v18 + 1;
    uint64_t v8 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v13+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v18, v19, v20);
    if (v7) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v14 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v14 >= v24) {
      goto LABEL_26;
    }
    uint64_t v15 = *(void *)(v23 + 8 * v14);
    ++v12;
    if (!v15)
    {
      int64_t v12 = v14 + 1;
      if (v14 + 1 >= v24) {
        goto LABEL_26;
      }
      uint64_t v15 = *(void *)(v23 + 8 * v12);
      if (!v15)
      {
        int64_t v12 = v14 + 2;
        if (v14 + 2 >= v24) {
          goto LABEL_26;
        }
        uint64_t v15 = *(void *)(v23 + 8 * v12);
        if (!v15) {
          break;
        }
      }
    }
LABEL_19:
    ;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v24)
  {
LABEL_26:
    swift_release();
    goto LABEL_28;
  }
  uint64_t v15 = *(void *)(v23 + 8 * v16);
  if (v15)
  {
    int64_t v12 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v12 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v12 >= v24) {
      goto LABEL_26;
    }
    uint64_t v15 = *(void *)(v23 + 8 * v12);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_32:
  __break(1u);
  return MEMORY[0x270F29620](v8, v9, v10, v11);
}

uint64_t sub_21CB5439C()
{
  uint64_t v2 = *v1;
  (*v1)[20] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[10], &qword_267C978E0);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_21CB547CC;
  }
  else
  {
    uint64_t v5 = v2[12];
    uint64_t v4 = v2[13];
    uint64_t v8 = v2 + 10;
    uint64_t v6 = v2[10];
    uint64_t v7 = v8[1];
    swift_bridgeObjectRelease();
    sub_21CA1B88C(v6, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
    uint64_t v3 = sub_21CB54524;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB54524()
{
  unint64_t v17 = v0;
  uint64_t v1 = v0[7];
  uint64_t v2 = (uint64_t *)(v0[6] + v0[17]);
  sub_21CB27000(*v2, v2[1], 0);
  if (MEMORY[0x21D4B6C80](v1 + 32))
  {
    sub_21CB0D468();
    swift_unknownObjectRelease();
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21CB880A0();
  sub_21CA4CC18(v3, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[7];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    v0[4] = *v7;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v10 = sub_21CB88310();
    v0[5] = sub_21CA4E450(v10, v11, &v16);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v4, v5, "%s: Stop share completed successfully.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v9, -1, -1);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  int64_t v12 = (void (*)(char *, void))v0[8];
  char v15 = 2;
  v12(&v15, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_21CB547CC()
{
  uint64_t v22 = v0;
  uint64_t v1 = (uint64_t *)(v0[6] + v0[17]);
  sub_21CB27000(*v1, v1[1], 1);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[20];
  uint64_t v3 = sub_21CB880A0();
  sub_21CA4CC18(v3, (uint64_t)qword_267CA5368);
  id v4 = v2;
  id v5 = v2;
  BOOL v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[20];
  if (v8)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    v0[2] = v9;
    id v12 = v9;
    sub_21CA57E34((uint64_t *)&unk_267C96F50);
    uint64_t v13 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v13, v14, &v21);
    sub_21CB889C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21CA00000, v6, v7, "Stop share completed with error - %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v11, -1, -1);
    MEMORY[0x21D4B6B70](v10, -1, -1);
  }
  else
  {
  }
  char v15 = (void *)v0[20];
  uint64_t v16 = (void (*)(char *, void *))v0[8];
  char v20 = 0;
  id v17 = v15;
  v16(&v20, v15);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

void sub_21CB54A50(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  swift_beginAccess();
  os_log_type_t v7 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = a2;
  id v8 = a2;

  dispatch_group_leave(a4);
}

void sub_21CB54ABC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, id), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v14 = (id *)(a1 + 16);
  swift_beginAccess();
  if (*(void *)(a1 + 16))
  {
    sub_21CB27B9C(*(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend), *(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend + 8), 1);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_21CB880A0();
    sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
    swift_retain_n();
    swift_retain_n();
    uint64_t v16 = sub_21CB88070();
    os_log_type_t v17 = sub_21CB88880();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v74[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v20 = sub_21CB88310();
      v73[0] = sub_21CA4E450(v20, v21, v74);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      swift_beginAccess();
      id v22 = *(id *)(a1 + 16);
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v23 = sub_21CB88310();
      v72[0] = sub_21CA4E450(v23, v24, v74);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v16, v17, "%s: removeFollower error: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v19, -1, -1);
      MEMORY[0x21D4B6B70](v18, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_release_n();
    }
    LOBYTE(v72[0]) = 0;
    swift_beginAccess();
    id v36 = *v14;
    id v37 = *v14;
    uint64_t v38 = v72;
LABEL_20:
    a4(v38, v36);
    int v50 = v36;
LABEL_21:

    return;
  }
  uint64_t v25 = (id *)(a6 + 16);
  swift_beginAccess();
  if (*(void *)(a6 + 16))
  {
    sub_21CB27B9C(*(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend), *(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend + 8), 1);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_21CB880A0();
    sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
    swift_retain_n();
    swift_retain_n();
    int64_t v27 = sub_21CB88070();
    os_log_type_t v28 = sub_21CB88880();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v73[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v31 = sub_21CB88310();
      v72[0] = sub_21CA4E450(v31, v32, v73);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_beginAccess();
      id v33 = *(id *)(a6 + 16);
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v34 = sub_21CB88310();
      v71[0] = sub_21CA4E450(v34, v35, v73);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v27, v28, "%s: removeFollowingError error: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v30, -1, -1);
      MEMORY[0x21D4B6B70](v29, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_release_n();
    }
    LOBYTE(v71[0]) = 0;
    swift_beginAccess();
    id v36 = *v25;
    id v49 = *v25;
    uint64_t v38 = v71;
    goto LABEL_20;
  }
  uint64_t v39 = (id *)(a7 + 16);
  swift_beginAccess();
  if (*(void *)(a7 + 16))
  {
    sub_21CB27B9C(*(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend), *(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend + 8), 1);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_21CB880A0();
    sub_21CA4CC18(v40, (uint64_t)qword_267CA5368);
    swift_retain_n();
    swift_retain_n();
    uint64_t v41 = sub_21CB88070();
    os_log_type_t v42 = sub_21CB88880();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t type = swift_slowAlloc();
      v72[0] = type;
      *(_DWORD *)uint64_t v43 = 136315394;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v44 = sub_21CB88310();
      v71[0] = sub_21CA4E450(v44, v45, v72);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      swift_beginAccess();
      id v46 = *(id *)(a7 + 16);
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v47 = sub_21CB88310();
      uint64_t v70 = sub_21CA4E450(v47, v48, v72);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v41, v42, "%s: removeFutureFollowingError error: %s", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](type, -1, -1);
      MEMORY[0x21D4B6B70](v43, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_release_n();
    }
    LOBYTE(v70) = 0;
    swift_beginAccess();
    id v62 = *v39;
    id v63 = *v39;
    uint64_t v64 = &v70;
LABEL_32:
    a4(v64, v62);
    int v50 = v62;
    goto LABEL_21;
  }
  swift_beginAccess();
  uint64_t v51 = *(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  uint64_t v52 = *(void *)(a3 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend + 8);
  if (*(void *)(a8 + 16))
  {
    sub_21CB27B9C(v51, v52, 1);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_21CB880A0();
    sub_21CA4CC18(v53, (uint64_t)qword_267CA5368);
    swift_retain_n();
    swift_retain_n();
    unint64_t v54 = sub_21CB88070();
    os_log_type_t v55 = sub_21CB88880();
    if (os_log_type_enabled(v54, v55))
    {
      os_log_type_t typea = v55;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      v71[0] = v66;
      *(_DWORD *)uint64_t v56 = 136315394;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v57 = sub_21CB88310();
      uint64_t v70 = sub_21CA4E450(v57, v58, v71);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      swift_beginAccess();
      id v59 = *(id *)(a8 + 16);
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v60 = sub_21CB88310();
      uint64_t v69 = sub_21CA4E450(v60, v61, v71);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v54, typea, "%s: removeFutureFollowerError error: %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v66, -1, -1);
      MEMORY[0x21D4B6B70](v56, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_release_n();
    }
    LOBYTE(v69) = 0;
    swift_beginAccess();
    id v62 = *v39;
    id v65 = *v39;
    uint64_t v64 = &v69;
    goto LABEL_32;
  }
  sub_21CB27B9C(v51, v52, 0);
  LOBYTE(v71[0]) = 2;
  a4(v71, 0);
}

uint64_t sub_21CB55608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a8;
  v8[8] = v13;
  v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  v8[4] = a5;
  sub_21CA57E34(&qword_267C978E0);
  v8[9] = swift_task_alloc();
  v8[10] = swift_task_alloc();
  uint64_t v9 = sub_21CB87870();
  v8[11] = v9;
  v8[12] = *(void *)(v9 - 8);
  v8[13] = swift_task_alloc();
  sub_21CB878E0();
  v8[14] = swift_task_alloc();
  uint64_t v10 = sub_21CB87940();
  v8[15] = v10;
  v8[16] = *(void *)(v10 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB557B0, 0, 0);
}

uint64_t sub_21CB557B0()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[19] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: performing respond to friendship invite", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  uint64_t v8 = v0[3];

  LODWORD(v8) = *(unsigned __int8 *)(v8 + 40);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *MEMORY[0x263F3CCF8], v6);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[20] = sub_21CB87E30();
  uint64_t v9 = swift_bridgeObjectRetain();
  size_t v10 = sub_21CABAFD0(v9);
  v0[21] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21CB87CC0();
  uint64_t v12 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  if (v8 == 1)
  {
    v12(v0[10], 1, 1, v11);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[22] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_21CB55A90;
    uint64_t v14 = v0[18];
    uint64_t v15 = v0[10];
    return MEMORY[0x270F29680](v14, v10, v15, 0);
  }
  else
  {
    v12(v0[9], 1, 1, v11);
    uint64_t v16 = (void *)swift_task_alloc();
    v0[24] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_21CB55CF4;
    uint64_t v17 = v0[17];
    uint64_t v18 = v0[9];
    return MEMORY[0x270F29688](v17, v10, v18, 0);
  }
}

uint64_t sub_21CB55A90()
{
  uint64_t v2 = *v1;
  (*v1)[23] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[10], &qword_267C978E0);
    swift_release();
    swift_release();
    os_log_type_t v3 = sub_21CB55EA4;
  }
  else
  {
    uint64_t v4 = v2[18];
    uint64_t v5 = v2[15];
    uint64_t v6 = v2[16];
    uint64_t v7 = v2[10];
    swift_release();
    swift_release();
    sub_21CA1B88C(v7, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    os_log_type_t v3 = sub_21CB55C40;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB55C40()
{
  sub_21CB27000(**(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 8), 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21CB55CF4()
{
  uint64_t v2 = *v1;
  (*v1)[25] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[9], &qword_267C978E0);
    swift_release();
    swift_release();
    uint64_t v3 = sub_21CB560C4;
  }
  else
  {
    uint64_t v5 = v2[16];
    uint64_t v4 = v2[17];
    uint64_t v6 = v2[15];
    uint64_t v7 = v2[9];
    swift_release();
    swift_release();
    sub_21CA1B88C(v7, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_21CB71418;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB55EA4()
{
  uint64_t v15 = v0;
  uint64_t v1 = *(void **)(v0 + 184);
  sub_21CB27000(**(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 8), 1);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    sub_21CB889C0();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: error when performing respond to friendship invite action: %@", v6, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v7, -1, -1);
    MEMORY[0x21D4B6B70](v6, -1, -1);
  }
  else
  {
  }
  size_t v10 = *(void (**)(char *, void *))(v0 + 56);
  char v14 = 0;
  id v11 = v1;
  v10(&v14, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_21CB560C4()
{
  uint64_t v15 = v0;
  uint64_t v1 = *(void **)(v0 + 200);
  sub_21CB27000(**(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 8), 1);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    sub_21CB889C0();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: error when performing respond to friendship invite action: %@", v6, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v7, -1, -1);
    MEMORY[0x21D4B6B70](v6, -1, -1);
  }
  else
  {
  }
  size_t v10 = *(void (**)(char *, void *))(v0 + 56);
  char v14 = 0;
  id v11 = v1;
  v10(&v14, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_21CB562E4(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t *, void *))
{
  sub_21CB27000(*a4, a4[1], a2 != 0);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_21CB880A0();
    sub_21CA4CC18(v7, (uint64_t)qword_267CA5368);
    swift_retain();
    id v8 = a2;
    swift_retain();
    id v9 = a2;
    size_t v10 = sub_21CB88070();
    os_log_type_t v11 = sub_21CB88880();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v27 = v13;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v14 = sub_21CB88310();
      sub_21CA4E450(v14, v15, &v27);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v16 = sub_21CB88990();
      sub_21CA4E450(v16, v17, &v27);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v10, v11, "%s: error when respoding to invite: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v13, -1, -1);
      MEMORY[0x21D4B6B70](v12, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v27) = 0;
    uint64_t v25 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_21CB880A0();
    sub_21CA4CC18(v18, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v19 = sub_21CB88070();
    os_log_type_t v20 = sub_21CB88880();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)unint64_t v21 = 136315138;
      uint64_t v27 = v22;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v23 = sub_21CB88310();
      sub_21CA4E450(v23, v24, &v27);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v19, v20, "%s: invite respond completed successfully.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v22, -1, -1);
      MEMORY[0x21D4B6B70](v21, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v27) = 2;
    uint64_t v25 = 0;
  }
  return a5(&v27, v25);
}

uint64_t sub_21CB56748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  sub_21CA57E34(&qword_267C978E0);
  v6[7] = swift_task_alloc();
  uint64_t v7 = sub_21CB87870();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  sub_21CB878E0();
  v6[11] = swift_task_alloc();
  uint64_t v8 = sub_21CB87940();
  v6[12] = v8;
  v6[13] = *(void *)(v8 - 8);
  v6[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB568C4, 0, 0);
}

uint64_t sub_21CB568C4()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[15] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  id v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: performing now now action", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v8 = v0[7];

  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_21CB4F4F0(v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21CB4DF28(v10);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *MEMORY[0x263F3CCF8], v6);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[16] = sub_21CB87E30();
  size_t v12 = sub_21CABAFD0(v11);
  v0[17] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_21CB87CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[18] = v14;
  void *v14 = v0;
  v14[1] = sub_21CB56B50;
  uint64_t v15 = v0[14];
  uint64_t v16 = v0[7];
  return MEMORY[0x270F29648](v15, v12, v16, 0);
}

uint64_t sub_21CB56B50()
{
  id v2 = *v1;
  (*v1)[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_21CA1B88C(v2[7], &qword_267C978E0);
    swift_release();
    swift_release();
    os_log_type_t v3 = sub_21CB56E1C;
  }
  else
  {
    uint64_t v5 = v2[13];
    uint64_t v4 = v2[14];
    uint64_t v6 = v2[12];
    uint64_t v7 = v2[7];
    swift_release();
    swift_release();
    sub_21CA1B88C(v7, &qword_267C978E0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    os_log_type_t v3 = sub_21CB56D00;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB56D00()
{
  uint64_t v8 = v0;
  uint64_t v1 = sub_21CB88070();
  os_log_type_t v2 = sub_21CB88880();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_21CA00000, v1, v2, "FMFActionsController: finished not now action", v3, 2u);
    MEMORY[0x21D4B6B70](v3, -1, -1);
  }
  uint64_t v4 = *(void (**)(char *, void))(v0 + 40);

  char v7 = 2;
  v4(&v7, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_21CB56E1C()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[19];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[19];
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v10;
    sub_21CB889C0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: error when performing not now action: %@", v7, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[19];
  }
  size_t v12 = (void *)v0[19];
  uint64_t v13 = (void (*)(char *, void *))v0[5];

  char v17 = 0;
  id v14 = v12;
  v13(&v17, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_21CB57020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a8;
  v8[8] = v14;
  v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  v8[4] = a5;
  sub_21CA57E34(&qword_267C978E0);
  v8[9] = swift_task_alloc();
  uint64_t v9 = sub_21CB87CC0();
  v8[10] = v9;
  v8[11] = *(void *)(v9 - 8);
  v8[12] = swift_task_alloc();
  uint64_t v10 = sub_21CB87870();
  v8[13] = v10;
  v8[14] = *(void *)(v10 - 8);
  v8[15] = swift_task_alloc();
  sub_21CB878E0();
  v8[16] = swift_task_alloc();
  uint64_t v11 = sub_21CB87940();
  v8[17] = v11;
  v8[18] = *(void *)(v11 - 8);
  v8[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB57204, 0, 0);
}

uint64_t sub_21CB57204()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[20] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  id v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: performing ask to follow friendship invite", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[15];
  uint64_t v7 = v0[13];
  uint64_t v6 = v0[14];
  uint64_t v8 = v0[11];
  uint64_t v14 = v0[9];
  uint64_t v15 = v0[10];

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F3CCF8], v7);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[21] = sub_21CB87E30();
  swift_bridgeObjectRetain();
  sub_21CB6114C(MEMORY[0x263F8EE78]);
  sub_21CB87CA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v14, 1, 1, v15);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  void *v9 = v0;
  v9[1] = sub_21CB5744C;
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[12];
  uint64_t v12 = v0[9];
  return MEMORY[0x270F296B0](v10, v11, v12, 0);
}

uint64_t sub_21CB5744C()
{
  id v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 96);
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  uint64_t v5 = *(void *)(*(void *)v1 + 80);
  uint64_t v6 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  sub_21CA1B88C(v6, &qword_267C978E0);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    uint64_t v7 = sub_21CB57778;
  }
  else
  {
    (*(void (**)(void, void))(v2[18] + 8))(v2[19], v2[17]);
    uint64_t v7 = sub_21CB57628;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_21CB57628()
{
  uint64_t v9 = v0;
  uint64_t v1 = sub_21CB88070();
  os_log_type_t v2 = sub_21CB88880();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21CA00000, v1, v2, "FMFActionsController: finished performing ask to follow friendship invite", v3, 2u);
    MEMORY[0x21D4B6B70](v3, -1, -1);
  }
  uint64_t v4 = (void (*)(char *, void))v0[7];
  uint64_t v5 = v0[6];

  sub_21CB27000(*(void *)(v5 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend), *(void *)(v5 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend + 8), 0);
  char v8 = 2;
  v4(&v8, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21CB57778()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[23];
  sub_21CB27000(*(void *)(v0[6] + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend), *(void *)(v0[6] + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend + 8), 1);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[23];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    char v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_21CB889C0();
    *char v8 = v10;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: error when performing ask to follow action: %@", v7, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[23];
  }
  uint64_t v12 = (void *)v0[23];
  uint64_t v13 = (void (*)(char *, void *))v0[7];
  char v17 = 0;
  id v14 = v12;
  v13(&v17, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_21CB579B0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6, void *a7, const char *a8, const char *a9)
{
  sub_21CB27000(*(void *)(a4 + *a7), *(void *)(a4 + *a7 + 8), a2 != 0);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_21CB880A0();
    sub_21CA4CC18(v12, (uint64_t)qword_267CA5368);
    swift_retain();
    id v13 = a2;
    swift_retain();
    id v14 = a2;
    uint64_t v15 = sub_21CB88070();
    os_log_type_t v16 = sub_21CB88880();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v32 = v18;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v19 = sub_21CB88310();
      sub_21CA4E450(v19, v20, &v32);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v21 = sub_21CB88990();
      sub_21CA4E450(v21, v22, &v32);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v15, v16, a9, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v18, -1, -1);
      MEMORY[0x21D4B6B70](v17, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v32) = 0;
    uint64_t v30 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_21CB880A0();
    sub_21CA4CC18(v23, (uint64_t)qword_267CA5368);
    swift_retain_n();
    unint64_t v24 = sub_21CB88070();
    os_log_type_t v25 = sub_21CB88880();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v32 = v27;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v28 = sub_21CB88310();
      sub_21CA4E450(v28, v29, &v32);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v24, v25, a8, v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v27, -1, -1);
      MEMORY[0x21D4B6B70](v26, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v32) = 2;
    uint64_t v30 = 0;
  }
  return a5(&v32, v30);
}

uint64_t sub_21CB57E14(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(_OWORD *, void *))
{
  memset(v24, 0, sizeof(v24));
  sub_21CB2821C((uint64_t *)v24, 0);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21CB880A0();
    sub_21CA4CC18(v6, (uint64_t)qword_267CA5368);
    id v7 = a2;
    id v8 = a2;
    id v9 = sub_21CB88070();
    os_log_type_t v10 = sub_21CB88880();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(void *)&v24[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v13 = sub_21CB88990();
      sub_21CA4E450(v13, v14, (uint64_t *)v24);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v9, v10, "FMFActionsController: error when show/hide location: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v12, -1, -1);
      MEMORY[0x21D4B6B70](v11, -1, -1);
    }
    else
    {
    }
    LOBYTE(v24[0]) = 0;
    unint64_t v22 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_21CB880A0();
    sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
    swift_retain_n();
    os_log_type_t v16 = sub_21CB88070();
    os_log_type_t v17 = sub_21CB88880();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      *(void *)&v24[0] = v19;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v20 = sub_21CB88310();
      sub_21CA4E450(v20, v21, (uint64_t *)v24);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v16, v17, "%s: show/hide location operation completed.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v19, -1, -1);
      MEMORY[0x21D4B6B70](v18, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v24[0]) = 2;
    unint64_t v22 = 0;
  }
  return a4(v24, v22);
}

uint64_t sub_21CB581BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  uint64_t v8 = sub_21CB87870();
  v7[7] = v8;
  v7[8] = *(void *)(v8 - 8);
  v7[9] = swift_task_alloc();
  sub_21CB878E0();
  v7[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB582AC, 0, 0);
}

uint64_t sub_21CB582AC()
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  v0[11] = sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  id v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21CA00000, v2, v3, "FMFActionsController: performing update me device", v4, 2u);
    MEMORY[0x21D4B6B70](v4, -1, -1);
  }
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[3];

  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, *MEMORY[0x263F3CCF8], v6);
  sub_21CB878F0();
  sub_21CB87E20();
  swift_allocObject();
  v0[12] = sub_21CB87E30();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  uint64_t v11 = (void *)swift_task_alloc();
  v0[13] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_21CB58474;
  return MEMORY[0x270F29720](v9, v10);
}

uint64_t sub_21CB58474()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_21CB586BC;
  }
  else
  {
    swift_release();
    id v2 = sub_21CB58590;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21CB58590()
{
  uint64_t v8 = v0;
  uint64_t v1 = sub_21CB88070();
  os_log_type_t v2 = sub_21CB88880();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_21CA00000, v1, v2, "FMFActionsController: finsihed performing update me device", v3, 2u);
    MEMORY[0x21D4B6B70](v3, -1, -1);
  }
  uint64_t v4 = *(void (**)(_OWORD *, void))(v0 + 40);

  memset(v7, 0, 57);
  sub_21CB28A30((uint64_t)v7, 0);
  LOBYTE(v7[0]) = 2;
  v4(v7, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_21CB586BC()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[14];
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21CB88070();
  os_log_type_t v5 = sub_21CB88880();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[14];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_21CB889C0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_21CA00000, v4, v5, "FMFActionsController: error when setting active location sharing device: %@", v7, 0xCu);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[14];
  }
  uint64_t v12 = (void *)v0[14];
  uint64_t v13 = (void (*)(char *, void *))v0[5];
  char v17 = 0;
  id v14 = v12;
  v13(&v17, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_21CB588AC(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(_OWORD *, void *))
{
  memset(v26, 0, 57);
  sub_21CB28A30((uint64_t)v26, 0);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21CB880A0();
    sub_21CA4CC18(v6, (uint64_t)qword_267CA5368);
    swift_retain();
    id v7 = a2;
    swift_retain();
    id v8 = a2;
    id v9 = sub_21CB88070();
    os_log_type_t v10 = sub_21CB88880();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)&v26[0] = v12;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v13 = sub_21CB88310();
      sub_21CA4E450(v13, v14, (uint64_t *)v26);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v15 = sub_21CB88990();
      sub_21CA4E450(v15, v16, (uint64_t *)v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v9, v10, "%s: error when show/hide location: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v12, -1, -1);
      MEMORY[0x21D4B6B70](v11, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v26[0]) = 0;
    unint64_t v24 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_21CB880A0();
    sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v18 = sub_21CB88070();
    os_log_type_t v19 = sub_21CB88880();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      *(void *)&v26[0] = v21;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v22 = sub_21CB88310();
      sub_21CA4E450(v22, v23, (uint64_t *)v26);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v18, v19, "%s: show/hide location operation completed.", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v21, -1, -1);
      MEMORY[0x21D4B6B70](v20, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v26[0]) = 2;
    unint64_t v24 = 0;
  }
  return a4(v26, v24);
}

uint64_t sub_21CB58D1C(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(_OWORD *, void *), uint64_t a5, const char *a6, const char *a7)
{
  memset(v31, 0, sizeof(v31));
  sub_21CB2821C((uint64_t *)v31, 0);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_21CB880A0();
    sub_21CA4CC18(v11, (uint64_t)qword_267CA5368);
    swift_retain();
    id v12 = a2;
    swift_retain();
    id v13 = a2;
    unint64_t v14 = sub_21CB88070();
    os_log_type_t v15 = sub_21CB88880();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)&v31[0] = v17;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v18 = sub_21CB88310();
      sub_21CA4E450(v18, v19, (uint64_t *)v31);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v20 = sub_21CB88990();
      sub_21CA4E450(v20, v21, (uint64_t *)v31);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v14, v15, a7, (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v17, -1, -1);
      MEMORY[0x21D4B6B70](v16, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v31[0]) = 0;
    unint64_t v29 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_21CB880A0();
    sub_21CA4CC18(v22, (uint64_t)qword_267CA5368);
    swift_retain_n();
    unint64_t v23 = sub_21CB88070();
    os_log_type_t v24 = sub_21CB88880();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v25 = 136315138;
      *(void *)&v31[0] = v26;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v27 = sub_21CB88310();
      sub_21CA4E450(v27, v28, (uint64_t *)v31);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v23, v24, a6, v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v26, -1, -1);
      MEMORY[0x21D4B6B70](v25, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v31[0]) = 2;
    unint64_t v29 = 0;
  }
  return a4(v31, v29);
}

uint64_t sub_21CB5917C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v64 = a3;
  uint64_t v62 = a2;
  uint64_t v61 = type metadata accessor for FMFLabelledLocation();
  id v65 = *(uint64_t (**)())(v61 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v61);
  id v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v67 = (uint64_t)&v58 - v10;
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v58 - v11;
  uint64_t v13 = sub_21CA57E34(&qword_267C95078);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v58 - v17;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_21CB880A0();
  sub_21CA4CC18(v19, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v20 = sub_21CB88070();
  os_log_type_t v21 = sub_21CB88880();
  BOOL v22 = os_log_type_enabled(v20, v21);
  id v63 = v4;
  uint64_t v66 = v18;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    id v59 = v16;
    os_log_type_t v24 = (uint8_t *)v23;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v58 = a1;
    uint64_t v26 = v25;
    v73[0] = v25;
    uint64_t v60 = v8;
    *(_DWORD *)os_log_type_t v24 = 136315138;
    v72[0] = *v4;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v27 = sub_21CB88310();
    v72[0] = sub_21CA4E450(v27, v28, v73);
    uint64_t v18 = v66;
    id v8 = v60;
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v20, v21, "%s: adding or updating label action initiated", v24, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v26;
    a1 = v58;
    MEMORY[0x21D4B6B70](v29, -1, -1);
    uint64_t v30 = v24;
    uint64_t v16 = v59;
    MEMORY[0x21D4B6B70](v30, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v31 = (uint64_t *)(a1 + OBJC_IVAR____TtC7FMFCore23FMFAddUpdateLabelAction_locationToLabel);
  uint64_t v32 = type metadata accessor for FMFLocation();
  sub_21CB66AE0((uint64_t)v31 + *(int *)(v32 + 44), (uint64_t)v72);
  sub_21CB66AE0((uint64_t)v72, (uint64_t)v73);
  if (sub_21CA7CDBC((uint64_t)v73) == 1 || !v74)
  {
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v65 + 7))(v18, 1, 1, v61);
  }
  else
  {
    id v59 = v16;
    uint64_t v60 = v8;
    uint64_t v33 = *(void *)(v74 + 16);
    if (v33)
    {
      uint64_t v34 = v74 + ((*((unsigned __int8 *)v65 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v65 + 80));
      uint64_t v35 = *((void *)v65 + 9);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_21CA2E134(v34, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
        if (*((void *)v12 + 3)) {
          break;
        }
LABEL_11:
        sub_21CB66EB0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
        v34 += v35;
        if (!--v33) {
          goto LABEL_16;
        }
      }
      switch(v12[32])
      {
        case 1:
        case 2:
          char v36 = sub_21CB88F50();
          swift_bridgeObjectRelease();
          if ((v36 & 1) == 0) {
            goto LABEL_11;
          }
          break;
        case 3:
          break;
        default:
          swift_bridgeObjectRelease();
          break;
      }
      uint64_t v18 = v66;
      sub_21CB71074((uint64_t)v12, (uint64_t)v66, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
      (*((void (**)(char *, void, uint64_t, uint64_t))v65 + 7))(v18, 0, 1, v61);
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_16:
      uint64_t v18 = v66;
      (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v65 + 7))(v66, 1, 1, v61);
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = v59;
    id v8 = v60;
  }
  sub_21CA24E80((uint64_t)v18, (uint64_t)v16, &qword_267C95078);
  uint64_t v37 = *(void *)(a1 + OBJC_IVAR____TtC7FMFCore23FMFAddUpdateLabelAction_label + 8);
  __int16 v38 = *(_WORD *)(a1 + OBJC_IVAR____TtC7FMFCore23FMFAddUpdateLabelAction_label + 16);
  v69[0] = *(void *)(a1 + OBJC_IVAR____TtC7FMFCore23FMFAddUpdateLabelAction_label);
  v69[1] = v37;
  __int16 v70 = v38;
  uint64_t v39 = *v31;
  uint64_t v40 = v31[1];
  sub_21CB66AE0((uint64_t)v72, (uint64_t)v71);
  int v41 = sub_21CA7CDBC((uint64_t)v71);
  if (v41 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v42 = 0;
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v44 = (void *)v71[38];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    objc_msgSend(v44, sel_coordinate);
    uint64_t v43 = v45;
    sub_21CB66AE0((uint64_t)v72, (uint64_t)v68);
    objc_msgSend(v68[38], sel_coordinate);
    uint64_t v42 = v46;
  }
  uint64_t v47 = v67;
  FMFLabelledLocation.init(labelledLocation:label:userId:latitude:longitude:)((uint64_t)v16, v69, v39, v40, v43, v41 == 1, v42, v41 == 1, v67);
  sub_21CA2E134(v47, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
  type metadata accessor for FMFAddUpdateLabelRequest();
  uint64_t v48 = swift_allocObject();
  sub_21CA2E134((uint64_t)v8, v48 + qword_267CA52D8, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
  id v49 = sub_21CA36A84();
  id v65 = type metadata accessor for FMFLabelledLocation;
  sub_21CB66EB0((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for FMFLabelledLocation);
  int v50 = v63;
  uint64_t v51 = v63[11];
  uint64_t v52 = v63[12];
  uint64_t v61 = (uint64_t)sub_21CA2B2CC(v63 + 8, v51);
  uint64_t v53 = (void *)swift_allocObject();
  uint64_t v54 = v62;
  v53[2] = v50;
  v53[3] = v54;
  v53[4] = v64;
  os_log_type_t v55 = *(void (**)(void *, void (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v52 + 64);
  uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v55(v49, sub_21CB66B60, v53, refreshed, v51, v52);
  swift_release();
  swift_release();
  sub_21CB66EB0(v67, (uint64_t (*)(void))v65);
  return sub_21CA1B88C((uint64_t)v66, &qword_267C95078);
}

void sub_21CB598F8(uint64_t a1, void *a2, uint64_t *a3, void (*a4)(uint64_t *, void *))
{
  uint64_t v43 = a4;
  uint64_t v7 = sub_21CA57E34(&qword_267C94E48);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t *)((char *)&v42 - v12);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v42 - v14);
  if (!a2)
  {
    if (!a1)
    {
LABEL_19:
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_21CB880A0();
      sub_21CA4CC18(v35, (uint64_t)qword_267CA5368);
      swift_retain_n();
      char v36 = sub_21CB88070();
      os_log_type_t v37 = sub_21CB88880();
      if (os_log_type_enabled(v36, v37))
      {
        __int16 v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(_DWORD *)__int16 v38 = 136315138;
        uint64_t v44 = *a3;
        uint64_t v45 = v39;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v40 = sub_21CB88310();
        uint64_t v44 = sub_21CA4E450(v40, v41, &v45);
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_21CA00000, v36, v37, "%s: Updated labels.", v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v39, -1, -1);
        MEMORY[0x21D4B6B70](v38, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      LOBYTE(v45) = 2;
      uint64_t v29 = 0;
      goto LABEL_25;
    }
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)&v42 - v14, &qword_267C94E48);
    uint64_t v27 = type metadata accessor for FMFCommandResponseFragment();
    unint64_t v28 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48);
    if (v28(v15, 1, v27) == 1)
    {
      sub_21CA1B88C((uint64_t)v15, &qword_267C94E48);
    }
    else
    {
      uint64_t v30 = *v15;
      sub_21CB66EB0((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
      if (v30 == 529) {
        goto LABEL_18;
      }
    }
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v13, &qword_267C94E48);
    if (v28(v13, 1, v27) == 1)
    {
      sub_21CA1B88C((uint64_t)v13, &qword_267C94E48);
    }
    else
    {
      uint64_t v31 = *v13;
      sub_21CB66EB0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
      if (v31 == 530) {
        goto LABEL_18;
      }
    }
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v10, &qword_267C94E48);
    if (v28(v10, 1, v27) == 1)
    {
      sub_21CA1B88C((uint64_t)v10, &qword_267C94E48);
      goto LABEL_19;
    }
    uint64_t v32 = *v10;
    sub_21CB66EB0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
    if (v32 != 531) {
      goto LABEL_19;
    }
LABEL_18:
    LOBYTE(v45) = 0;
    sub_21CB66948();
    uint64_t v33 = (void *)swift_allocError();
    *(void *)uint64_t v34 = 3;
    *(_WORD *)(v34 + 8) = 256;
    v43(&v45, v33);

    return;
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_21CB880A0();
  sub_21CA4CC18(v16, (uint64_t)qword_267CA5368);
  swift_retain();
  id v17 = a2;
  swift_retain();
  id v18 = a2;
  uint64_t v19 = sub_21CB88070();
  os_log_type_t v20 = sub_21CB88880();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v44 = *a3;
    uint64_t v45 = v22;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v23 = sub_21CB88310();
    uint64_t v44 = sub_21CA4E450(v23, v24, &v45);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v44 = (uint64_t)a2;
    sub_21CA57E34(&qword_267C975A0);
    uint64_t v25 = sub_21CB88990();
    uint64_t v44 = sub_21CA4E450(v25, v26, &v45);
    sub_21CB889C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21CA00000, v19, v20, "%s: error when updating labels: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v22, -1, -1);
    MEMORY[0x21D4B6B70](v21, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  LOBYTE(v45) = 0;
  uint64_t v29 = a2;
LABEL_25:
  v43(&v45, v29);
}

uint64_t sub_21CB59FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21CB880A0();
  sub_21CA4CC18(v8, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v9 = sub_21CB88070();
  os_log_type_t v10 = sub_21CB88880();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = a2;
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v25 = v12;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v13 = sub_21CB88310();
    sub_21CA4E450(v13, v14, &v25);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v9, v10, "%s: removing labels action initiated", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v12;
    a2 = v24;
    MEMORY[0x21D4B6B70](v15, -1, -1);
    MEMORY[0x21D4B6B70](v11, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v16 = *(void *)(a1 + 24);
  type metadata accessor for FMFRemoveLabelsRequest();
  *(void *)(swift_allocObject() + qword_267CA5438) = v16;
  swift_bridgeObjectRetain();
  id v17 = sub_21CA36A84();
  uint64_t v18 = v4[11];
  uint64_t v19 = v4[12];
  sub_21CA2B2CC(v4 + 8, v18);
  os_log_type_t v20 = (void *)swift_allocObject();
  v20[2] = v4;
  v20[3] = a2;
  v20[4] = a3;
  uint64_t v21 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v19 + 64);
  uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v21(v17, sub_21CB66AD4, v20, refreshed, v18, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_21CB5A2BC(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t *, void *))
{
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21CB880A0();
    sub_21CA4CC18(v6, (uint64_t)qword_267CA5368);
    swift_retain();
    id v7 = a2;
    swift_retain();
    id v8 = a2;
    uint64_t v9 = sub_21CB88070();
    os_log_type_t v10 = sub_21CB88880();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      uint64_t v26 = v12;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v13 = sub_21CB88310();
      sub_21CA4E450(v13, v14, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v11 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v15 = sub_21CB88990();
      sub_21CA4E450(v15, v16, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v9, v10, "%s: error when removing labels: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v12, -1, -1);
      MEMORY[0x21D4B6B70](v11, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v26) = 0;
    uint64_t v24 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_21CB880A0();
    sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v18 = sub_21CB88070();
    os_log_type_t v19 = sub_21CB88880();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v20 = 136315138;
      uint64_t v26 = v21;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v22 = sub_21CB88310();
      sub_21CA4E450(v22, v23, &v26);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v18, v19, "%s: Removed labels.", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v21, -1, -1);
      MEMORY[0x21D4B6B70](v20, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    LOBYTE(v26) = 2;
    uint64_t v24 = 0;
  }
  return a4(&v26, v24);
}

void sub_21CB5A70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21CB87190();
  uint64_t v22 = (void *)v8;
  uint64_t v23 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v9 = sub_21CA6D80C(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F3CA28], v8);
  LOBYTE(v8) = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v8)
  {
    sub_21CB5AF00(a1, a2, a3);
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_21CB880A0();
    sub_21CA4CC18(v10, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v11 = sub_21CB88070();
    os_log_type_t v12 = sub_21CB88880();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      aBlock[0] = v14;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v15 = sub_21CB88310();
      sub_21CA4E450(v15, v16, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v11, v12, "%s: removing location alert action initiated", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v14, -1, -1);
      MEMORY[0x21D4B6B70](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA80]), sel_init);
    id v18 = FMFLocationAlert.fence.getter();
    os_log_type_t v19 = (void *)swift_allocObject();
    void v19[2] = v4;
    v19[3] = a2;
    v19[4] = a3;
    uint64_t v23 = (uint64_t)sub_21CB66AB0;
    uint64_t v24 = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CB4F760;
    uint64_t v22 = &unk_26CD70D18;
    os_log_type_t v20 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_deleteFence_completion_, v18, v20);
    _Block_release(v20);
  }
}

uint64_t sub_21CB5AAB0(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t *, void *))
{
  if (a1)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_21CB880A0();
    sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
    swift_retain();
    id v6 = a1;
    swift_retain();
    id v7 = a1;
    uint64_t v8 = sub_21CB88070();
    os_log_type_t v9 = sub_21CB88860();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v25 = v11;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v12 = sub_21CB88310();
      sub_21CA4E450(v12, v13, &v25);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v10 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v14 = sub_21CB88990();
      sub_21CA4E450(v14, v15, &v25);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v8, v9, "%s: error when removing location alert: %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v11, -1, -1);
      MEMORY[0x21D4B6B70](v10, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v25) = 0;
    uint64_t v23 = a1;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_21CB880A0();
    sub_21CA4CC18(v16, (uint64_t)qword_267CA5368);
    swift_retain_n();
    id v17 = sub_21CB88070();
    os_log_type_t v18 = sub_21CB88880();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v19 = 136315138;
      uint64_t v25 = v20;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v21 = sub_21CB88310();
      sub_21CA4E450(v21, v22, &v25);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v17, v18, "%s: Location alert removed.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v20, -1, -1);
      MEMORY[0x21D4B6B70](v19, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    LOBYTE(v25) = 2;
    uint64_t v23 = 0;
  }
  return a3(&v25, v23);
}

uint64_t sub_21CB5AF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21CB87190();
  v28[3] = v11;
  v28[4] = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v12 = sub_21CA6D80C(v28);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v12, *MEMORY[0x263F3CA28], v11);
  LOBYTE(v11) = MEMORY[0x21D4B4280](v28);
  uint64_t result = sub_21CA2B0D0((uint64_t)v28);
  if (v11)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_21CB880A0();
    sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
    swift_retain_n();
    unint64_t v15 = sub_21CB88070();
    os_log_type_t v16 = sub_21CB88880();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v25 = a2;
      os_log_type_t v18 = (uint8_t *)v17;
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v18 = 136315138;
      uint64_t v26 = a1;
      uint64_t v27 = *v4;
      v28[0] = v19;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v20 = sub_21CB88310();
      uint64_t v27 = sub_21CA4E450(v20, v21, v28);
      a1 = v26;
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v15, v16, "%s: removing location alert action initiated", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v19, -1, -1);
      unint64_t v22 = v18;
      a2 = v25;
      MEMORY[0x21D4B6B70](v22, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v23 = sub_21CB88640();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
    uint64_t v24 = (void *)swift_allocObject();
    _OWORD v24[2] = 0;
    v24[3] = 0;
    v24[4] = a1;
    v24[5] = v4;
    v24[6] = a2;
    v24[7] = a3;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21CB09F98((uint64_t)v10, (uint64_t)&unk_267C978C0, (uint64_t)v24);
    return swift_release();
  }
  return result;
}

uint64_t sub_21CB5B28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  uint64_t v8 = sub_21CB87AC0();
  v7[11] = v8;
  v7[12] = *(void *)(v8 - 8);
  v7[13] = swift_task_alloc();
  sub_21CA57E34(&qword_267C96F00);
  v7[14] = swift_task_alloc();
  uint64_t v9 = sub_21CB875D0();
  v7[15] = v9;
  v7[16] = *(void *)(v9 - 8);
  v7[17] = swift_task_alloc();
  v7[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB5B3EC, 0, 0);
}

uint64_t sub_21CB5B3EC()
{
  uint64_t v32 = v0;
  if (!*(void *)(v0[7] + OBJC_IVAR____TtC7FMFCore28FMFRemoveLocationAlertAction_locationAlert + 8)) {
    goto LABEL_4;
  }
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[14];
  sub_21CB875A0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_21CA1B88C(v0[14], &qword_267C96F00);
LABEL_4:
    uint64_t v4 = sub_21CB87170();
    sub_21CB66900(&qword_267C978C8, MEMORY[0x263F3C9B0]);
    uint64_t v5 = (void *)swift_allocError();
    strcpy(v6, "fenceID is nil");
    v6[15] = -18;
    (*(void (**)(char *, void, uint64_t))(*(void *)(v4 - 8) + 104))(v6, *MEMORY[0x263F3C9A8], v4);
    swift_willThrow();
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_21CB880A0();
    sub_21CA4CC18(v7, (uint64_t)qword_267CA5368);
    swift_retain();
    id v8 = v5;
    swift_retain();
    id v9 = v5;
    uint64_t v10 = sub_21CB88070();
    os_log_type_t v11 = sub_21CB88860();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v13 = (void *)v0[8];
    if (v12)
    {
      uint64_t v14 = swift_slowAlloc();
      unint64_t v15 = (void *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v31[0] = v30;
      *(_DWORD *)uint64_t v14 = 136315394;
      v0[2] = *v13;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v16 = sub_21CB88310();
      v0[3] = sub_21CA4E450(v16, v17, v31);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2112;
      id v18 = v5;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      v0[4] = v19;
      sub_21CB889C0();
      *unint64_t v15 = v19;

      _os_log_impl(&dword_21CA00000, v10, v11, "%s: error when removing location alert: %@", (uint8_t *)v14, 0x16u);
      sub_21CA57E34(&qword_267C95020);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v15, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v30, -1, -1);
      MEMORY[0x21D4B6B70](v14, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    uint64_t v20 = (void (*)(uint64_t *, void *))v0[9];
    LOBYTE(v31[0]) = 0;
    id v21 = v5;
    v20(v31, v5);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v22 = (uint64_t (*)(void))v0[1];
    return v22();
  }
  uint64_t v24 = v0[17];
  uint64_t v25 = v0[18];
  uint64_t v26 = v0[15];
  uint64_t v27 = v0[16];
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 32))(v25, v0[14], v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v24, v25, v26);
  MEMORY[0x21D4B4BB0](v24);
  unint64_t v28 = (void *)swift_task_alloc();
  v0[19] = v28;
  *unint64_t v28 = v0;
  v28[1] = sub_21CB5B90C;
  uint64_t v29 = v0[13];
  return MEMORY[0x270F29658](v29);
}

uint64_t sub_21CB5B90C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[12] + 8))(v2[13], v2[11]);
  if (v0) {
    uint64_t v3 = sub_21CB5BCFC;
  }
  else {
    uint64_t v3 = sub_21CB5BA74;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB5BA74()
{
  id v18 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = (void *)v0[8];
  if (v4)
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = v7;
    *(_DWORD *)id v6 = 136315138;
    v0[5] = *v5;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v8 = sub_21CB88310();
    v0[6] = sub_21CA4E450(v8, v9, &v17);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v2, v3, "%s: Location alert removed.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v7, -1, -1);
    MEMORY[0x21D4B6B70](v6, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v10 = v0[18];
  uint64_t v11 = v0[15];
  uint64_t v12 = v0[16];
  unint64_t v13 = (void (*)(char *, void))v0[9];
  char v16 = 2;
  v13(&v16, 0);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_21CB5BCFC()
{
  unint64_t v22 = v0;
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  uint64_t v1 = (void *)v0[20];
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  swift_retain();
  id v3 = v1;
  swift_retain();
  id v4 = v1;
  uint64_t v5 = sub_21CB88070();
  os_log_type_t v6 = sub_21CB88860();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[8];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[2] = *v8;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v11 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v11, v12, &v21);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v14;
    sub_21CB889C0();
    *uint64_t v10 = v14;

    _os_log_impl(&dword_21CA00000, v5, v6, "%s: error when removing location alert: %@", (uint8_t *)v9, 0x16u);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v19, -1, -1);
    MEMORY[0x21D4B6B70](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  unint64_t v15 = (void (*)(char *, void *))v0[9];
  char v20 = 0;
  id v16 = v1;
  v15(&v20, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_21CB5C040(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t *, void *), uint64_t a5, const char *a6, uint64_t (*a7)(void), const char *a8)
{
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_21CB880A0();
    sub_21CA4CC18(v12, (uint64_t)qword_267CA5368);
    swift_retain();
    id v13 = a2;
    swift_retain();
    id v14 = a2;
    unint64_t v15 = sub_21CB88070();
    os_log_type_t v16 = a7();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v33 = v18;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v19 = sub_21CB88310();
      sub_21CA4E450(v19, v20, &v33);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v21 = sub_21CB88990();
      sub_21CA4E450(v21, v22, &v33);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v15, v16, a8, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v18, -1, -1);
      MEMORY[0x21D4B6B70](v17, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v33) = 0;
    uint64_t v31 = a2;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_21CB880A0();
    sub_21CA4CC18(v24, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v25 = sub_21CB88070();
    os_log_type_t v26 = sub_21CB88880();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v33 = v28;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v29 = sub_21CB88310();
      sub_21CA4E450(v29, v30, &v33);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v25, v26, a6, v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v28, -1, -1);
      MEMORY[0x21D4B6B70](v27, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v33) = 2;
    uint64_t v31 = 0;
  }
  return a4(&v33, v31);
}

uint64_t sub_21CB5C498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  uint64_t v8 = sub_21CB87C50();
  v7[11] = v8;
  v7[12] = *(void *)(v8 - 8);
  v7[13] = swift_task_alloc();
  v7[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB5C56C, 0, 0);
}

uint64_t sub_21CB5C56C()
{
  FMFLocationAlert.fmlFence.getter(v0[13]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = (uint64_t)v1;
  void *v1 = v0;
  v1[1] = sub_21CB5C918;
  uint64_t v3 = v0[13];
  uint64_t v2 = v0[14];
  return MEMORY[0x270F29660](v2, v3);
}

uint64_t sub_21CB5C918()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[12] + 8))(v2[13], v2[11]);
    uint64_t v3 = sub_21CB5CCD4;
  }
  else
  {
    uint64_t v4 = v2[13];
    uint64_t v5 = v2[14];
    BOOL v7 = v2 + 11;
    uint64_t v6 = v2[11];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7[1] + 8);
    v8(v4, v6);
    v8(v5, v6);
    uint64_t v3 = sub_21CB5CA7C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21CB5CA7C()
{
  unint64_t v15 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = (void *)v0[7];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v14 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[5] = *v5;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v8 = sub_21CB88310();
    v0[6] = sub_21CA4E450(v8, v9, &v14);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v2, v3, "%s: Location alert updated.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v7, -1, -1);
    MEMORY[0x21D4B6B70](v6, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v10 = (void (*)(char *, void))v0[9];
  char v13 = 2;
  v10(&v13, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_21CB5CCD4()
{
  unint64_t v22 = v0;
  uint64_t v1 = (void *)v0[16];
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  swift_retain();
  id v3 = v1;
  swift_retain();
  id v4 = v1;
  uint64_t v5 = sub_21CB88070();
  os_log_type_t v6 = sub_21CB88860();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[7];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[2] = *v8;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v11 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v11, v12, &v21);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v14;
    sub_21CB889C0();
    *uint64_t v10 = v14;

    _os_log_impl(&dword_21CA00000, v5, v6, "%s: error when updating location alert: %@", (uint8_t *)v9, 0x16u);
    sub_21CA57E34(&qword_267C95020);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v19, -1, -1);
    MEMORY[0x21D4B6B70](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  unint64_t v15 = (void (*)(char *, void *))v0[9];
  char v20 = 0;
  id v16 = v1;
  v15(&v20, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_21CB5CFEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t))
{
  if (a1)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_21CB880A0();
    sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
    swift_retain_n();
    os_log_type_t v6 = sub_21CB88070();
    os_log_type_t v7 = sub_21CB88880();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v21 = v9;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v10 = sub_21CB88310();
      sub_21CA4E450(v10, v11, &v21);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v6, v7, "%s: Error when muting fences", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v9, -1, -1);
      MEMORY[0x21D4B6B70](v8, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v21) = 0;
    uint64_t v19 = a1;
  }
  else
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_21CB880A0();
    sub_21CA4CC18(v12, (uint64_t)qword_267CA5368);
    swift_retain_n();
    id v13 = sub_21CB88070();
    os_log_type_t v14 = sub_21CB88880();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)unint64_t v15 = 136315138;
      uint64_t v21 = v16;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v17 = sub_21CB88310();
      sub_21CA4E450(v17, v18, &v21);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v13, v14, "%s: Fences muted", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v16, -1, -1);
      MEMORY[0x21D4B6B70](v15, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v21) = 2;
    uint64_t v19 = 0;
  }
  return a3(&v21, v19);
}

uint64_t sub_21CB5D3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = a8;
  v8[15] = v15;
  v8[12] = a6;
  v8[13] = a7;
  v8[10] = a4;
  v8[11] = a5;
  sub_21CA57E34((uint64_t *)&unk_267C951B0);
  v8[16] = swift_task_alloc();
  uint64_t v9 = sub_21CB87590();
  v8[17] = v9;
  v8[18] = *(void *)(v9 - 8);
  v8[19] = swift_task_alloc();
  uint64_t v10 = sub_21CB878D0();
  v8[20] = v10;
  v8[21] = *(void *)(v10 - 8);
  v8[22] = swift_task_alloc();
  uint64_t v11 = sub_21CB87CC0();
  v8[23] = v11;
  v8[24] = *(void *)(v11 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  sub_21CA57E34(&qword_267C979C0);
  v8[27] = swift_task_alloc();
  uint64_t v12 = sub_21CB87C80();
  v8[28] = v12;
  v8[29] = *(void *)(v12 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21CB5D60C, 0, 0);
}

uint64_t sub_21CB5D60C()
{
  v0[32] = *(void *)(v0[10] + 112);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[33] = v1;
  void *v1 = v0;
  v1[1] = sub_21CB5D6A8;
  return MEMORY[0x270F29718]();
}

uint64_t sub_21CB5D6A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = v1;
  swift_task_dealloc();
  if (v1) {
    id v4 = sub_21CB5E638;
  }
  else {
    id v4 = sub_21CB5D7BC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21CB5D7BC()
{
  id v49 = v0;
  uint64_t v1 = v0[34];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
LABEL_12:
    uint64_t v15 = 1;
    goto LABEL_15;
  }
  uint64_t v3 = v0[29];
  uint64_t v5 = *(void (**)(void, uint64_t, void))(v3 + 16);
  uint64_t v4 = v3 + 16;
  uint64_t v45 = v5;
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
  os_log_type_t v7 = (void (**)(uint64_t, uint64_t))(v0[24] + 8);
  uint64_t v43 = v0[12];
  uint64_t v44 = *(void *)(v4 + 56);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v8 = v0[26];
    uint64_t v9 = v0[23];
    v45(v0[30], v6, v0[28]);
    sub_21CB87C70();
    uint64_t v10 = sub_21CB87CB0();
    uint64_t v12 = v11;
    (*v7)(v8, v9);
    if (!v12) {
      goto LABEL_3;
    }
    if (v10 == v0[11] && v12 == v43) {
      break;
    }
    char v14 = sub_21CB88F50();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_14;
    }
LABEL_3:
    (*(void (**)(void, void))(v4 - 8))(v0[30], v0[28]);
    v6 += v44;
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  (*(void (**)(void, void, void))(v0[29] + 32))(v0[27], v0[30], v0[28]);
  uint64_t v15 = 0;
LABEL_15:
  uint64_t v16 = v0[28];
  uint64_t v17 = v0[29];
  uint64_t v18 = v0[27];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v18, v15, 1, v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16) == 1)
  {
    sub_21CA1B88C(v0[27], &qword_267C979C0);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_21CB880A0();
    sub_21CA4CC18(v19, (uint64_t)qword_267CA5368);
    swift_bridgeObjectRetain_n();
    char v20 = sub_21CB88070();
    os_log_type_t v21 = sub_21CB88860();
    BOOL v22 = os_log_type_enabled(v20, v21);
    unint64_t v23 = v0[12];
    if (v22)
    {
      uint64_t v24 = v0[11];
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v48 = v26;
      *(_DWORD *)uint64_t v25 = 136446466;
      v0[4] = sub_21CA4E450(0xD00000000000001CLL, 0x800000021CB986C0, &v48);
      sub_21CB889C0();
      *(_WORD *)(v25 + 12) = 2082;
      swift_bridgeObjectRetain();
      v0[5] = sub_21CA4E450(v24, v23, &v48);
      sub_21CB889C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21CA00000, v20, v21, "%{public}s No friend with friendId: %{public}s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v26, -1, -1);
      MEMORY[0x21D4B6B70](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v35 = (void (*)(char *, void *))v0[13];
    char v47 = 0;
    sub_21CB66948();
    char v36 = (void *)swift_allocError();
    *(void *)uint64_t v37 = 2;
    *(_WORD *)(v37 + 8) = 256;
    v35(&v47, v36);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    __int16 v38 = (uint64_t (*)(void))v0[1];
    return v38();
  }
  else
  {
    uint64_t v28 = v0[24];
    uint64_t v27 = v0[25];
    uint64_t v29 = v0[23];
    uint64_t v30 = v0[18];
    uint64_t v46 = v0[17];
    uint64_t v31 = v0[15];
    uint64_t v32 = v0[16];
    (*(void (**)(void, void, void))(v0[29] + 32))(v0[31], v0[27], v0[28]);
    sub_21CB87C70();
    sub_21CB87C90();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    sub_21CB878A0();
    sub_21CA24E80(v31 + OBJC_IVAR____TtC7FMFCore19FMFMuteFencesAction_muteEndDate, v32, (uint64_t *)&unk_267C951B0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v32, 1, v46) == 1)
    {
      sub_21CA1B88C(v0[16], (uint64_t *)&unk_267C951B0);
      uint64_t v33 = (void *)swift_task_alloc();
      v0[36] = v33;
      *uint64_t v33 = v0;
      v33[1] = sub_21CB5DE28;
      uint64_t v34 = v0[22];
      return MEMORY[0x270F29668](v34);
    }
    else
    {
      (*(void (**)(void, void, void))(v0[18] + 32))(v0[19], v0[16], v0[17]);
      uint64_t v39 = (void *)swift_task_alloc();
      v0[38] = v39;
      *uint64_t v39 = v0;
      v39[1] = sub_21CB5DF3C;
      uint64_t v40 = v0[22];
      uint64_t v41 = v0[19];
      return MEMORY[0x270F29640](v40, v41);
    }
  }
}

uint64_t sub_21CB5DE28()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_21CB5EBEC;
  }
  else {
    uint64_t v2 = sub_21CB5E364;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21CB5DF3C()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_21CB5E8E8;
  }
  else {
    uint64_t v2 = sub_21CB5E050;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21CB5E050()
{
  uint64_t v25 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[17];
  uint64_t v8 = (void *)v0[10];
  if (v4)
  {
    uint64_t v22 = v0[19];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v24 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[8] = *v8;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v11 = sub_21CB88310();
    v0[9] = sub_21CA4E450(v11, v12, &v24);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v2, v3, "%s: Fences muted", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v10, -1, -1);
    MEMORY[0x21D4B6B70](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v22, v7);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  uint64_t v13 = v0[31];
  uint64_t v14 = v0[28];
  uint64_t v15 = v0[29];
  uint64_t v17 = v0[21];
  uint64_t v16 = v0[22];
  uint64_t v18 = v0[20];
  uint64_t v19 = (void (*)(char *, void))v0[13];
  char v23 = 2;
  v19(&v23, 0);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_21CB5E364()
{
  os_log_type_t v21 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21CB880A0();
  sub_21CA4CC18(v1, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v2 = sub_21CB88070();
  os_log_type_t v3 = sub_21CB88880();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = (void *)v0[10];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v20 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[6] = *v5;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v8 = sub_21CB88310();
    v0[7] = sub_21CA4E450(v8, v9, &v20);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v2, v3, "%s: Fences unmuted", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v7, -1, -1);
    MEMORY[0x21D4B6B70](v6, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v10 = v0[31];
  uint64_t v11 = v0[28];
  uint64_t v12 = v0[29];
  uint64_t v14 = v0[21];
  uint64_t v13 = v0[22];
  uint64_t v15 = v0[20];
  uint64_t v16 = (void (*)(char *, void))v0[13];
  char v19 = 2;
  v16(&v19, 0);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_21CB5E638()
{
  uint64_t v17 = v0;
  uint64_t v1 = (void *)v0[35];
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  swift_retain_n();
  os_log_type_t v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[10];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[2] = *v6;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v9 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v9, v10, &v16);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v3, v4, "%s: Error when muting fences", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v8, -1, -1);
    MEMORY[0x21D4B6B70](v7, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v11 = (void (*)(char *, void *))v0[13];
  char v15 = 0;
  id v12 = v1;
  v11(&v15, v1);

  swift_task_dealloc();
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

uint64_t sub_21CB5E8E8()
{
  char v23 = v0;
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  uint64_t v5 = v0[21];
  uint64_t v4 = v0[22];
  uint64_t v6 = v0[20];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v7 = (void *)v0[39];
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21CB880A0();
  sub_21CA4CC18(v8, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v9 = sub_21CB88070();
  os_log_type_t v10 = sub_21CB88880();
  BOOL v11 = os_log_type_enabled(v9, v10);
  id v12 = (void *)v0[10];
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v0[2] = *v12;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v15 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v15, v16, &v22);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v9, v10, "%s: Error when muting fences", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v14, -1, -1);
    MEMORY[0x21D4B6B70](v13, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v17 = (void (*)(char *, void *))v0[13];
  char v21 = 0;
  id v18 = v7;
  v17(&v21, v7);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_21CB5EBEC()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = (void *)v0[37];
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21CB880A0();
  sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[10];
  if (v8)
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    v0[2] = *v9;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v12 = sub_21CB88310();
    v0[3] = sub_21CA4E450(v12, v13, &v19);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v6, v7, "%s: Error when muting fences", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v11, -1, -1);
    MEMORY[0x21D4B6B70](v10, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v14 = (void (*)(char *, void *))v0[13];
  char v18 = 0;
  id v15 = v4;
  v14(&v18, v4);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_21CB5EED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v33 = sub_21CB87480();
  uint64_t v8 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  os_log_type_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21CB880A0();
  sub_21CA4CC18(v11, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v12 = sub_21CB88070();
  os_log_type_t v13 = sub_21CB88880();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v30 = a1;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v32 = a3;
    uint64_t v16 = v15;
    uint64_t v31 = a2;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v34 = *v4;
    uint64_t v35 = v15;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v17 = sub_21CB88310();
    uint64_t v34 = sub_21CA4E450(v17, v18, &v35);
    a2 = v31;
    sub_21CB889C0();
    a1 = v30;
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v12, v13, "%s: removing labels action initiated", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v16;
    a3 = v32;
    MEMORY[0x21D4B6B70](v19, -1, -1);
    MEMORY[0x21D4B6B70](v14, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v21 = v33;
  v20(v10, a1 + OBJC_IVAR____TtC7FMFCore19FMFGetURLInfoAction_url, v33);
  type metadata accessor for FMFGetURLInfoRequest();
  uint64_t v22 = swift_allocObject();
  v20((char *)(v22 + qword_267CA52A0), (uint64_t)v10, v21);
  char v23 = sub_21CA36A84();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  uint64_t v24 = v4[11];
  uint64_t v25 = v4[12];
  sub_21CA2B2CC(v4 + 8, v24);
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = v4;
  v26[3] = a2;
  _OWORD v26[4] = a3;
  uint64_t v27 = *(void (**)(void *, void (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v25 + 64);
  uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v27(v23, sub_21CB669B4, v26, refreshed, v24, v25);
  swift_release();
  return swift_release();
}

void sub_21CB5F298(uint64_t a1, void *a2, uint64_t *a3, void (*a4)(uint64_t *, void *))
{
  uint64_t v50 = a4;
  uint64_t v7 = sub_21CA57E34(&qword_267C94E48);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v49 - v11);
  if (a2)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_21CB880A0();
    sub_21CA4CC18(v13, (uint64_t)qword_267CA5368);
    swift_retain();
    id v14 = a2;
    swift_retain();
    id v15 = a2;
    uint64_t v16 = sub_21CB88070();
    os_log_type_t v17 = sub_21CB88880();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v51 = *a3;
      uint64_t v52 = v19;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v20 = sub_21CB88310();
      uint64_t v51 = sub_21CA4E450(v20, v21, &v52);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v51 = (uint64_t)a2;
      sub_21CA57E34(&qword_267C975A0);
      uint64_t v22 = sub_21CB88990();
      uint64_t v51 = sub_21CA4E450(v22, v23, &v52);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v16, v17, "%s: error when getting info for URL: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v19, -1, -1);
      MEMORY[0x21D4B6B70](v18, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    LOBYTE(v52) = 0;
    v50(&v52, a2);
    return;
  }
  if (a1)
  {
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)&v49 - v11, &qword_267C94E48);
    uint64_t v24 = type metadata accessor for FMFCommandResponseFragment();
    uint64_t v25 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48);
    if (v25(v12, 1, v24) == 1)
    {
      sub_21CA1B88C((uint64_t)v12, &qword_267C94E48);
    }
    else
    {
      uint64_t v26 = *v12;
      sub_21CB66EB0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
      if (v26 == 500)
      {
        if (qword_267C94990 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_21CB880A0();
        sub_21CA4CC18(v27, (uint64_t)qword_267CA5368);
        uint64_t v28 = sub_21CB88070();
        os_log_type_t v29 = sub_21CB88880();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl(&dword_21CA00000, v28, v29, "%%@: The command response was invalid", v30, 2u);
          MEMORY[0x21D4B6B70](v30, -1, -1);
        }

        LOBYTE(v52) = 0;
        sub_21CB66948();
        uint64_t v32 = (void *)swift_allocError();
        uint64_t v33 = 1;
        goto LABEL_32;
      }
    }
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v9, &qword_267C94E48);
    if (v25(v9, 1, v24) == 1)
    {
      sub_21CA1B88C((uint64_t)v9, &qword_267C94E48);
      goto LABEL_24;
    }
    uint64_t v34 = *v9;
    sub_21CB66EB0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
    if (v34 != 516) {
      goto LABEL_24;
    }
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_21CB880A0();
    sub_21CA4CC18(v35, (uint64_t)qword_267CA5368);
    swift_retain_n();
    char v36 = sub_21CB88070();
    os_log_type_t v37 = sub_21CB88880();
    if (os_log_type_enabled(v36, v37))
    {
      __int16 v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)__int16 v38 = 136315138;
      uint64_t v51 = *a3;
      uint64_t v52 = v39;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v40 = sub_21CB88310();
      uint64_t v51 = sub_21CA4E450(v40, v41, &v52);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v36, v37, "%s: The request was to add friend to self", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v39, -1, -1);
      MEMORY[0x21D4B6B70](v38, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    LOBYTE(v52) = 0;
    sub_21CB66948();
    uint64_t v32 = (void *)swift_allocError();
    uint64_t v33 = 4;
LABEL_32:
    *(void *)uint64_t v31 = v33;
    *(_WORD *)(v31 + 8) = 256;
    v50(&v52, v32);

    return;
  }
LABEL_24:
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_21CB880A0();
  sub_21CA4CC18(v42, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v43 = sub_21CB88070();
  os_log_type_t v44 = sub_21CB88850();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v51 = *a3;
    uint64_t v52 = v46;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v47 = sub_21CB88310();
    uint64_t v51 = sub_21CA4E450(v47, v48, &v52);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21CA00000, v43, v44, "%s: Got info for url.", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v46, -1, -1);
    MEMORY[0x21D4B6B70](v45, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  LOBYTE(v52) = 2;
  v50(&v52, 0);
  sub_21CB5FB50(a1, a3);
}

void sub_21CB5FB50(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C978B0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21CA57E34(&qword_267C94E48);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v57 - v11;
  uint64_t v13 = sub_21CA57E34(&qword_267C95190);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21CB87480();
  uint64_t v17 = *(void *)(v16 - 8);
  __n128 v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_4;
  }
  id v63 = v6;
  uint64_t v64 = v20;
  sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v12, &qword_267C94E48);
  unint64_t v21 = (int *)type metadata accessor for FMFCommandResponseFragment();
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, int *))(*((void *)v21 - 1) + 48);
  if (v22(v12, 1, v21) == 1)
  {
    sub_21CA1B88C((uint64_t)v12, &qword_267C94E48);
LABEL_4:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v17 + 56))(v15, 1, 1, v16, v18);
LABEL_5:
    sub_21CA1B88C((uint64_t)v15, &qword_267C95190);
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_21CB880A0();
    sub_21CA4CC18(v23, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v24 = sub_21CB88070();
    os_log_type_t v25 = sub_21CB88880();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v65[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v66 = *a2;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v28 = sub_21CB88310();
      uint64_t v66 = sub_21CA4E450(v28, v29, v65);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v24, v25, "%s: Got info but there is no url.", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v27, -1, -1);
      MEMORY[0x21D4B6B70](v26, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    return;
  }
  sub_21CA24E80((uint64_t)&v12[v21[6]], (uint64_t)v15, &qword_267C95190);
  sub_21CB66EB0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1) {
    goto LABEL_5;
  }
  uint64_t v30 = v64;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v64, v15, v16);
  uint64_t v31 = MEMORY[0x21D4B6C80](a2 + 4);
  if (v31)
  {
    uint64_t v32 = v31;
    sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse, (uint64_t)v9, &qword_267C94E48);
    if (v22(v9, 1, v21) == 1)
    {
      sub_21CA1B88C((uint64_t)v9, &qword_267C94E48);
      uint64_t v33 = type metadata accessor for FMFActionURLInfo();
      uint64_t v34 = (uint64_t)v63;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v63, 1, 1, v33);
    }
    else
    {
      uint64_t v34 = (uint64_t)v63;
      sub_21CA24E80((uint64_t)&v9[v21[6]], (uint64_t)v63, &qword_267C95190);
      uint64_t v35 = &v9[v21[7]];
      uint64_t v36 = *(void *)v35;
      uint64_t v37 = *((void *)v35 + 1);
      __int16 v38 = &v9[v21[8]];
      uint64_t v40 = *(void *)v38;
      uint64_t v39 = *((void *)v38 + 1);
      uint64_t v62 = v40;
      uint64_t v60 = v36;
      uint64_t v61 = v39;
      uint64_t v41 = v21[10];
      uint64_t v42 = &v9[v21[9]];
      uint64_t v43 = *((void *)v42 + 1);
      uint64_t v59 = *(void *)v42;
      uint64_t v44 = (uint64_t)&v9[v41];
      uint64_t v45 = (int *)type metadata accessor for FMFActionURLInfo();
      sub_21CA24E80(v44, v34 + v45[8], (uint64_t *)&unk_267C951B0);
      uint64_t v46 = v21[12];
      uint64_t v47 = &v9[v21[11]];
      uint64_t v48 = *((void *)v47 + 1);
      uint64_t v58 = *(void *)v47;
      sub_21CA24E80((uint64_t)&v9[v46], v34 + v45[10], (uint64_t *)&unk_267C96EC0);
      uint64_t v49 = (void *)(v34 + v45[5]);
      *uint64_t v49 = v60;
      v49[1] = v37;
      uint64_t v50 = (void *)(v34 + v45[6]);
      uint64_t v51 = v61;
      *uint64_t v50 = v62;
      v50[1] = v51;
      uint64_t v52 = (void *)(v34 + v45[7]);
      *uint64_t v52 = v59;
      v52[1] = v43;
      uint64_t v53 = (void *)(v34 + v45[9]);
      *uint64_t v53 = v58;
      v53[1] = v48;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21CB66EB0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FMFCommandResponseFragment);
      (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v45 - 1) + 56))(v34, 0, 1, v45);
    }
    uint64_t v54 = v64;
    swift_beginAccess();
    if (MEMORY[0x21D4B6C80](v32 + 32))
    {
      uint64_t v55 = *(void *)(v32 + 40);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v55 + 112))(v32, v34, v54, ObjectType, v55);
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    sub_21CA1B88C(v34, &qword_267C978B0);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v54, v16);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v30, v16);
  }
}

void sub_21CB6026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21CB87190();
  uint64_t v23 = (void *)v8;
  uint64_t v24 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v9 = sub_21CA6D80C(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F3CA20], v8);
  LOBYTE(v8) = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v8)
  {
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_21CB880A0();
    sub_21CA4CC18(v10, (uint64_t)qword_267CA5368);
    swift_retain_n();
    uint64_t v11 = sub_21CB88070();
    os_log_type_t v12 = sub_21CB88880();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      aBlock[0] = v14;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v15 = sub_21CB88310();
      sub_21CA4E450(v15, v16, aBlock);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21CA00000, v11, v12, "%s: Updating Stewie location...", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v14, -1, -1);
      MEMORY[0x21D4B6B70](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v17 = *(void **)(v4 + 56);
    uint64_t v18 = *(void *)(a1 + 24);
    uint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v4;
    v19[3] = a2;
    v19[4] = a3;
    uint64_t v24 = (uint64_t)sub_21CB66894;
    os_log_type_t v25 = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CB5C494;
    uint64_t v23 = &unk_26CD70C28;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain();
    id v21 = v17;
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_publishCurrentLocationToStewieWithReason_completion_, v18, v20);
    _Block_release(v20);
  }
}

uint64_t sub_21CB605D0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_21CB88100();
  uint64_t v25 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_21CB88150();
  uint64_t v13 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
  uint64_t v23 = sub_21CB88900();
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  aBlock[4] = sub_21CB668F0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  uint64_t aBlock[3] = &unk_26CD70C78;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a1;
  id v19 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  sub_21CB88120();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21CB66900((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA6D91C();
  sub_21CB88A60();
  uint64_t v20 = (void *)v23;
  MEMORY[0x21D4B5A20](0, v15, v12, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v24);
}

void sub_21CB608C0(id a1, void *a2, uint64_t a3, void (*a4)(void **, uint64_t))
{
  if (a1)
  {
    objc_msgSend(a1, sel_nextAllowedPublish);
    uint64_t v8 = v7;
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (a2)
    {
LABEL_3:
      uint64_t v49 = a2;
      id v9 = a2;
      id v10 = a2;
      sub_21CA57E34((uint64_t *)&unk_267C96F50);
      type metadata accessor for SecureLocationsStewieError(0);
      if (swift_dynamicCast())
      {
        sub_21CB66900(&qword_267C94BA0, type metadata accessor for SecureLocationsStewieError);
        sub_21CB873C0();
        if (v49 == (void *)1 && a1)
        {
          if (qword_267C94990 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_21CB880A0();
          sub_21CA4CC18(v11, (uint64_t)qword_267CA5368);
          swift_retain_n();
          id v12 = v48;
          uint64_t v13 = sub_21CB88070();
          os_log_type_t v14 = sub_21CB88880();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = swift_slowAlloc();
            uint64_t v46 = swift_slowAlloc();
            *(_DWORD *)uint64_t v15 = 136315650;
            uint64_t v49 = (void *)v46;
            sub_21CA57E34(&qword_267C978A0);
            uint64_t v16 = sub_21CB88310();
            sub_21CA4E450(v16, v17, (uint64_t *)&v49);
            sub_21CB889C0();
            swift_bridgeObjectRelease();
            swift_release_n();
            *(_WORD *)(v15 + 12) = 2080;
            sub_21CB66900(&qword_267C94B60, type metadata accessor for SecureLocationsStewieError);
            uint64_t v18 = sub_21CB89000();
            sub_21CA4E450(v18, v19, (uint64_t *)&v49);
            sub_21CB889C0();
            swift_bridgeObjectRelease();

            *(_WORD *)(v15 + 22) = 2080;
            uint64_t v20 = sub_21CB88700();
            sub_21CA4E450(v20, v21, (uint64_t *)&v49);
            sub_21CB889C0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21CA00000, v13, v14, "%s: Updated Stewie location failed %s (next allowed publish: %s", (uint8_t *)v15, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x21D4B6B70](v46, -1, -1);
            MEMORY[0x21D4B6B70](v15, -1, -1);
          }
          else
          {
            swift_release_n();
          }
          LOBYTE(v49) = 0;
          sub_21CB66948();
          uint64_t v44 = swift_allocError();
          *(void *)uint64_t v45 = v8;
          *(_WORD *)(v45 + 8) = 0;
          a4(&v49, v44);

          uint64_t v43 = (void *)v44;
LABEL_23:

          return;
        }
      }
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_21CB880A0();
      sub_21CA4CC18(v32, (uint64_t)qword_267CA5368);
      swift_retain();
      id v33 = a2;
      swift_retain();
      id v34 = a2;
      uint64_t v35 = sub_21CB88070();
      os_log_type_t v36 = sub_21CB88880();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315394;
        uint64_t v49 = (void *)v47;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v38 = sub_21CB88310();
        sub_21CA4E450(v38, v39, (uint64_t *)&v49);
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v37 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v40 = sub_21CB89000();
        sub_21CA4E450(v40, v41, (uint64_t *)&v49);
        sub_21CB889C0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21CA00000, v35, v36, "%s: Updated Stewie location failed %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v47, -1, -1);
        MEMORY[0x21D4B6B70](v37, -1, -1);
      }
      else
      {
        swift_release_n();
      }
      LOBYTE(v49) = 0;
      id v42 = a2;
      a4(&v49, (uint64_t)a2);

      uint64_t v43 = a2;
      goto LABEL_23;
    }
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_21CB880A0();
  sub_21CA4CC18(v22, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v23 = sub_21CB88070();
  os_log_type_t v24 = sub_21CB88880();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v49 = (void *)v26;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v27 = sub_21CB88310();
    sub_21CA4E450(v27, v28, (uint64_t *)&v49);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v25 + 12) = 2080;
    if (a1)
    {
      uint64_t v29 = sub_21CB88700();
      unint64_t v31 = v30;
    }
    else
    {
      unint64_t v31 = 0xE300000000000000;
      uint64_t v29 = 7104878;
    }
    sub_21CA4E450(v29, v31, (uint64_t *)&v49);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v23, v24, "%s: Updated Stewie location succeeded (next allowed publish: %s)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v26, -1, -1);
    MEMORY[0x21D4B6B70](v25, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  LOBYTE(v49) = 2;
  a4(&v49, 0);
}

unint64_t sub_21CB6114C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_21CA57E34(&qword_267C978E8);
  uint64_t v2 = (void *)sub_21CB88D40();
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
    unint64_t result = sub_21CB61260(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v10 = (uint64_t *)(v2[6] + 16 * result);
    *id v10 = v5;
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

unint64_t sub_21CB61260(uint64_t a1, uint64_t a2)
{
  sub_21CB89050();
  sub_21CB88380();
  uint64_t v4 = sub_21CB89090();

  return sub_21CB612D8(a1, a2, v4);
}

unint64_t sub_21CB612D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_21CB88F50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_21CB88F50() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_21CB88F50()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_21CB61420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = *v5;
  sub_21CB89050();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21CB88380();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21CB89090();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = *(void *)(v10 + 48);
    uint64_t v15 = 32 * v13;
    uint64_t v16 = (void *)(v14 + 32 * v13);
    BOOL v17 = *v16 == a2 && v16[1] == a3;
    if (v17 || (sub_21CB88F50() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void *)(*v6 + 48) + v15;
      uint64_t v20 = *(void *)v18;
      uint64_t v19 = *(void *)(v18 + 8);
      uint64_t v21 = *(void *)(v18 + 16);
      char v22 = *(unsigned char *)(v18 + 24);
      char v23 = *(unsigned char *)(v18 + 25);
      LOBYTE(v18) = *(unsigned char *)(v18 + 26);
      *(void *)a1 = v20;
      *(void *)(a1 + 8) = v19;
      *(void *)(a1 + 16) = v21;
      *(unsigned char *)(a1 + 24) = v22;
      *(unsigned char *)(a1 + 25) = v23;
      *(unsigned char *)(a1 + 26) = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v25 = ~v12;
    while (1)
    {
      unint64_t v13 = (v13 + 1) & v25;
      if (((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
        break;
      }
      uint64_t v15 = 32 * v13;
      uint64_t v26 = (void *)(v14 + 32 * v13);
      BOOL v27 = *v26 == a2 && v26[1] == a3;
      if (v27 || (sub_21CB88F50() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v31 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21CB63664(a2, a3, a4, a5 & 0x10101, v13, isUniquelyReferenced_nonNull_native);
  *uint64_t v6 = v31;
  swift_bridgeObjectRelease();
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(unsigned char *)(a1 + 24) = a5 & 1;
  *(unsigned char *)(a1 + 25) = BYTE1(a5) & 1;
  uint64_t result = 1;
  *(unsigned char *)(a1 + 26) = BYTE2(a5) & 1;
  return result;
}

uint64_t sub_21CB6166C(void *a1, void *a2)
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
    id v8 = a2;
    uint64_t v9 = sub_21CB88AB0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_21CB88AA0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_21CB620C4(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_21CB628E0();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_21CB635E0((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_21CB88950();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_21CB88960();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_21CB88960();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_21CB6383C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_21CB6190C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21CB87CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_21CB66900(&qword_267C97870, MEMORY[0x263F3CF58]);
  swift_bridgeObjectRetain();
  id v33 = a2;
  uint64_t v11 = sub_21CB88260();
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
    id v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    id v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      id v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_21CB66900(&qword_267C97948, MEMORY[0x263F3CF58]);
      char v21 = sub_21CB882B0();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      id v14 = v20;
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
    id v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    os_log_type_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_21CB639C4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_21CB61C30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  int v10 = a4 & 1;
  int v38 = a4 & 0x10000;
  int v39 = a4 & 0x100;
  uint64_t v11 = *v5;
  sub_21CB89050();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21CB88380();
  uint64_t v41 = a3;
  swift_bridgeObjectRelease();
  char v40 = v10;
  sub_21CB89070();
  sub_21CB89070();
  sub_21CB89070();
  uint64_t v12 = sub_21CB89090();
  uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v14 = v12 & ~v13;
  uint64_t v15 = v11 + 56;
  os_log_type_t v36 = v5;
  uint64_t v37 = a1;
  int v35 = a4;
  if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    uint64_t v16 = ~v13;
    uint64_t v17 = *(void *)(v11 + 48);
    uint64_t v19 = a2;
    uint64_t v18 = v41;
    while (1)
    {
      uint64_t v21 = v17 + 24 * v14;
      int v22 = *(unsigned __int8 *)(v21 + 16);
      int v23 = *(unsigned __int8 *)(v21 + 17);
      int v24 = (v38 != 0) ^ *(unsigned __int8 *)(v21 + 18);
      if (*(void *)v21 == v19 && *(void *)(v21 + 8) == v18)
      {
        if ((((v10 != 0) ^ v22 | (v39 != 0) ^ v23 | v24) & 1) == 0)
        {
LABEL_11:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v26 = *(void *)(*v36 + 48) + 24 * v14;
          uint64_t v28 = *(void *)v26;
          uint64_t v27 = *(void *)(v26 + 8);
          char v29 = *(unsigned char *)(v26 + 16);
          char v30 = *(unsigned char *)(v26 + 17);
          LOBYTE(v26) = *(unsigned char *)(v26 + 18);
          *(void *)uint64_t v37 = v28;
          *(void *)(v37 + 8) = v27;
          *(unsigned char *)(v37 + 16) = v29;
          *(unsigned char *)(v37 + 17) = v30;
          *(unsigned char *)(v37 + 18) = v26;
          swift_bridgeObjectRetain();
          return 0;
        }
      }
      else
      {
        char v20 = sub_21CB88F50();
        uint64_t v19 = a2;
        uint64_t v18 = v41;
        if (!(((v10 != 0) ^ v22) & 1 | ((v20 & 1) == 0) | (((v39 != 0) ^ v23) | v24) & 1)) {
          goto LABEL_11;
        }
      }
      unint64_t v14 = (v14 + 1) & v16;
      if (((*(void *)(v15 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
        goto LABEL_13;
      }
    }
  }
  uint64_t v19 = a2;
  uint64_t v18 = v41;
LABEL_13:
  uint64_t v32 = v18;
  uint64_t v33 = v19;
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v42 = *v36;
  void *v36 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21CB63C64(v33, v32, v35 & 0x10101, v14, isUniquelyReferenced_nonNull_native);
  void *v36 = v42;
  swift_bridgeObjectRelease();
  *(void *)uint64_t v37 = v33;
  *(void *)(v37 + 8) = v32;
  *(unsigned char *)(v37 + 16) = v40;
  *(unsigned char *)(v37 + 17) = BYTE1(v39);
  uint64_t result = 1;
  *(unsigned char *)(v37 + 18) = BYTE2(v38);
  return result;
}

uint64_t sub_21CB61EF8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_21CB89050();
  sub_21CB89070();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_21CB88380();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = sub_21CB89090();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_21CB63F00(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v20;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  uint64_t v11 = ~v9;
  uint64_t v12 = *(void *)(v7 + 48);
  while (1)
  {
    uint64_t v13 = (void *)(v12 + 16 * v10);
    uint64_t v14 = v13[1];
    if (v14) {
      break;
    }
    if (!a3) {
      goto LABEL_15;
    }
LABEL_6:
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (!a3) {
    goto LABEL_6;
  }
  BOOL v15 = *v13 == a2 && v14 == a3;
  if (!v15 && (sub_21CB88F50() & 1) == 0) {
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v16 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
  uint64_t v17 = v16[1];
  *a1 = *v16;
  a1[1] = v17;
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_21CB620C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_21CA57E34(&qword_267C97900);
    uint64_t v2 = sub_21CB88B30();
    uint64_t v14 = v2;
    sub_21CB88A90();
    if (sub_21CB88AC0())
    {
      sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_21CB628E0();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_21CB88950();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_21CB88AC0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_21CB622BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97160);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                  *char v30 = -1 << v29;
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
      sub_21CB89050();
      sub_21CB88380();
      uint64_t result = sub_21CB89090();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21CB6259C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97930);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
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
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = *(void *)(v2 + 48) + 32 * v14;
      uint64_t v20 = *(void *)v19;
      long long v34 = *(_OWORD *)(v19 + 8);
      char v21 = *(unsigned char *)(v19 + 24);
      char v22 = *(unsigned char *)(v19 + 25);
      char v23 = *(unsigned char *)(v19 + 26);
      sub_21CB89050();
      swift_bridgeObjectRetain();
      sub_21CB88380();
      swift_bridgeObjectRelease();
      uint64_t result = sub_21CB89090();
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
            goto LABEL_38;
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
      uint64_t v12 = *(void *)(v4 + 48) + 32 * v11;
      *(void *)uint64_t v12 = v20;
      *(_OWORD *)(v12 + 8) = v34;
      *(unsigned char *)(v12 + 24) = v21;
      *(unsigned char *)(v12 + 25) = v22;
      *(unsigned char *)(v12 + 26) = v23;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21CB628E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97900);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
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
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
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
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_21CB88950();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21CB62B80()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_21CB87CC0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_21CA57E34(&qword_267C97950);
  uint64_t v5 = sub_21CB88B20();
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
    int v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
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
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_21CB66900(&qword_267C97870, MEMORY[0x263F3CF58]);
      uint64_t result = sub_21CB88260();
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
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_21CB62F7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97928);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
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
    for (i = v2; ; uint64_t v2 = i)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = *(void *)(v2 + 48) + 24 * v14;
      uint64_t v19 = *(void *)v18;
      uint64_t v20 = *(void *)(v18 + 8);
      char v21 = *(unsigned char *)(v18 + 16);
      char v22 = *(unsigned char *)(v18 + 17);
      char v23 = *(unsigned char *)(v18 + 18);
      sub_21CB89050();
      swift_bridgeObjectRetain();
      sub_21CB88380();
      swift_bridgeObjectRelease();
      sub_21CB89070();
      sub_21CB89070();
      sub_21CB89070();
      uint64_t result = sub_21CB89090();
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
            goto LABEL_38;
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
      uint64_t v12 = *(void *)(v4 + 48) + 24 * v11;
      *(void *)uint64_t v12 = v19;
      *(void *)(v12 + 8) = v20;
      *(unsigned char *)(v12 + 16) = v21;
      *(unsigned char *)(v12 + 17) = v22;
      *(unsigned char *)(v12 + 18) = v23;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21CB632D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C979C8);
  uint64_t v3 = sub_21CB88B20();
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_35;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_35;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_35;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_35:
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
                    goto LABEL_41;
                  }
                  if (v11 >= v8) {
                    goto LABEL_35;
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
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      sub_21CB89050();
      sub_21CB89070();
      if (v20)
      {
        swift_bridgeObjectRetain();
        sub_21CB88380();
        swift_bridgeObjectRelease();
      }
      uint64_t result = sub_21CB89090();
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
            goto LABEL_40;
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
      *unint64_t v13 = v21;
      v13[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_21CB635E0(uint64_t a1, uint64_t a2)
{
  sub_21CB88950();
  unint64_t result = sub_21CB88A80();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_21CB63664(uint64_t result, uint64_t a2, uint64_t a3, int a4, unint64_t a5, char a6)
{
  unint64_t v7 = v6;
  uint64_t v12 = result;
  unint64_t v13 = *(void *)(*v6 + 16);
  unint64_t v14 = *(void *)(*v6 + 24);
  if (v14 > v13 && (a6 & 1) != 0) {
    goto LABEL_22;
  }
  if (a6)
  {
    sub_21CB6259C();
  }
  else
  {
    if (v14 > v13)
    {
      unint64_t result = (uint64_t)sub_21CB6426C();
      goto LABEL_22;
    }
    sub_21CB64C18();
  }
  uint64_t v15 = *v6;
  sub_21CB89050();
  swift_bridgeObjectRetain();
  sub_21CB88380();
  swift_bridgeObjectRelease();
  unint64_t result = sub_21CB89090();
  uint64_t v16 = -1 << *(unsigned char *)(v15 + 32);
  a5 = result & ~v16;
  uint64_t v17 = v15 + 56;
  if ((*(void *)(v15 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
  {
    uint64_t v18 = *(void *)(v15 + 48);
    uint64_t v19 = (void *)(v18 + 32 * a5);
    BOOL v20 = *v19 == v12 && v19[1] == a2;
    if (v20 || (unint64_t result = sub_21CB88F50(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_21CB88F90();
      __break(1u);
    }
    else
    {
      uint64_t v21 = ~v16;
      while (1)
      {
        a5 = (a5 + 1) & v21;
        if (((*(void *)(v17 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) == 0) {
          break;
        }
        uint64_t v22 = (void *)(v18 + 32 * a5);
        if (*v22 != v12 || v22[1] != a2)
        {
          unint64_t result = sub_21CB88F50();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v24 = *v7;
  *(void *)(*v7 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  uint64_t v25 = *(void *)(v24 + 48) + 32 * a5;
  *(void *)uint64_t v25 = v12;
  *(void *)(v25 + 8) = a2;
  *(void *)(v25 + 16) = a3;
  *(unsigned char *)(v25 + 24) = a4 & 1;
  *(unsigned char *)(v25 + 25) = BYTE1(a4) & 1;
  *(unsigned char *)(v25 + 26) = BYTE2(a4) & 1;
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
  return result;
}

void sub_21CB6383C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21CB628E0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_21CB64448();
      goto LABEL_14;
    }
    sub_21CB64F28();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_21CB88950();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_21CA05908(0, (unint64_t *)&qword_267C951F8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_21CB88960();

    if (v12)
    {
LABEL_13:
      sub_21CB88F90();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_21CB88960();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_21CB639C4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v32 = a1;
  uint64_t v6 = sub_21CB87CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __n128 v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  uint64_t v30 = v7;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_21CB62B80();
  }
  else
  {
    if (v12 > v11)
    {
      sub_21CB645F4();
      goto LABEL_12;
    }
    sub_21CB651A4();
  }
  uint64_t v13 = *v3;
  sub_21CB66900(&qword_267C97870, MEMORY[0x263F3CF58]);
  uint64_t v14 = sub_21CB88260();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v14 & ~v15;
  uint64_t v31 = v13;
  uint64_t v16 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v15;
    BOOL v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v7 + 16;
    BOOL v18 = v20;
    uint64_t v21 = *(void *)(v19 + 56);
    do
    {
      v18(v10, *(void *)(v31 + 48) + v21 * a2, v6);
      sub_21CB66900(&qword_267C97948, MEMORY[0x263F3CF58]);
      char v22 = sub_21CB882B0();
      (*(void (**)(char *, uint64_t))(v19 - 8))(v10, v6);
      if (v22) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v16 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(v24 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v23 + 32))(*(void *)(v24 + 48) + *(void *)(v23 + 72) * a2, v32, v6, v8);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_21CB88F90();
  __break(1u);
  return result;
}

uint64_t sub_21CB63C64(uint64_t result, uint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t v7 = a2;
  uint64_t v8 = result;
  int v9 = a3 & 1;
  unsigned int v10 = a3 & 0x100;
  int v11 = a3 & 0x10000;
  unint64_t v12 = *(void *)(*v5 + 16);
  unint64_t v13 = *(void *)(*v5 + 24);
  unsigned int v33 = (a3 & 0x10000u) >> 16;
  unsigned int v34 = v10 >> 8;
  if (v13 <= v12 || (a5 & 1) == 0)
  {
    uint64_t v36 = result;
    if (a5)
    {
      sub_21CB62F7C();
    }
    else
    {
      if (v13 > v12)
      {
        uint64_t result = (uint64_t)sub_21CB64898();
        goto LABEL_18;
      }
      sub_21CB65554();
    }
    uint64_t v14 = *v5;
    sub_21CB89050();
    swift_bridgeObjectRetain();
    sub_21CB88380();
    swift_bridgeObjectRelease();
    sub_21CB89070();
    sub_21CB89070();
    sub_21CB89070();
    uint64_t result = sub_21CB89090();
    uint64_t v15 = -1 << *(unsigned char *)(v14 + 32);
    a4 = result & ~v15;
    uint64_t v16 = v14 + 56;
    if ((*(void *)(v14 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
    {
      uint64_t v17 = ~v15;
      uint64_t v18 = *(void *)(v14 + 48);
      uint64_t v8 = v36;
      uint64_t v7 = a2;
      int v19 = v11;
      unsigned int v35 = v10;
      while (1)
      {
        uint64_t v20 = v18 + 24 * a4;
        uint64_t result = *(void *)v20;
        int v21 = *(unsigned __int8 *)(v20 + 16);
        int v22 = *(unsigned __int8 *)(v20 + 17);
        int v23 = (v19 != 0) ^ *(unsigned __int8 *)(v20 + 18);
        if (*(void *)v20 == v8 && *(void *)(v20 + 8) == v7)
        {
          if ((((v9 != 0) ^ v21 | (v10 != 0) ^ v22 | v23) & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {
          BOOL v37 = v10 != 0;
          uint64_t v25 = v16;
          uint64_t v26 = v18;
          uint64_t result = sub_21CB88F50();
          uint64_t v18 = v26;
          uint64_t v16 = v25;
          uint64_t v7 = a2;
          uint64_t v8 = v36;
          unsigned int v10 = v35;
          if (!(((v9 != 0) ^ v21) & 1 | ((result & 1) == 0) | (v37 ^ v22 | v23) & 1))
          {
LABEL_17:
            uint64_t result = sub_21CB88F90();
            __break(1u);
            break;
          }
        }
        a4 = (a4 + 1) & v17;
        if (((*(void *)(v16 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) == 0) {
          goto LABEL_19;
        }
      }
    }
LABEL_18:
    uint64_t v8 = v36;
    uint64_t v7 = a2;
  }
LABEL_19:
  uint64_t v27 = *v32;
  *(void *)(*v32 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v28 = *(void *)(v27 + 48) + 24 * a4;
  *(void *)uint64_t v28 = v8;
  *(void *)(v28 + 8) = v7;
  *(unsigned char *)(v28 + 16) = v9;
  *(unsigned char *)(v28 + 17) = v34;
  *(unsigned char *)(v28 + 18) = v33;
  uint64_t v29 = *(void *)(v27 + 16);
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30) {
    __break(1u);
  }
  else {
    *(void *)(v27 + 16) = v31;
  }
  return result;
}

uint64_t sub_21CB63F00(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21CB632D4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_21CB64A68();
      goto LABEL_22;
    }
    sub_21CB65878();
  }
  uint64_t v11 = *v4;
  sub_21CB89050();
  sub_21CB89070();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_21CB88380();
    swift_bridgeObjectRelease();
  }
  uint64_t result = sub_21CB89090();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v11 + 48);
    do
    {
      uint64_t v16 = (void *)(v15 + 16 * a3);
      uint64_t v17 = v16[1];
      if (v17)
      {
        if (a2)
        {
          BOOL v18 = *v16 == v8 && v17 == a2;
          if (v18 || (uint64_t result = sub_21CB88F50(), (result & 1) != 0))
          {
LABEL_21:
            sub_21CA57E34((uint64_t *)&unk_267C95220);
            uint64_t result = sub_21CB88F90();
            __break(1u);
            break;
          }
        }
      }
      else if (!a2)
      {
        goto LABEL_21;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_22:
  uint64_t v19 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v20 = (uint64_t *)(*(void *)(v19 + 48) + 16 * a3);
  *uint64_t v20 = v8;
  v20[1] = a2;
  uint64_t v21 = *(void *)(v19 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v23;
  }
  return result;
}

void *sub_21CB640B8()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97160);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_21CB6426C()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97930);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v16 = 32 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    char v21 = *(unsigned char *)(v17 + 24);
    char v22 = *(unsigned char *)(v17 + 25);
    LOBYTE(v17) = *(unsigned char *)(v17 + 26);
    uint64_t v23 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v23 = v19;
    *(void *)(v23 + 8) = v18;
    *(void *)(v23 + 16) = v20;
    *(unsigned char *)(v23 + 24) = v21;
    *(unsigned char *)(v23 + 25) = v22;
    *(unsigned char *)(v23 + 26) = v17;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_21CB64448()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97900);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21CB645F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21CB87CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CA57E34(&qword_267C97950);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_21CB88B10();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  char v22 = v1;
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v10);
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
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    id result = (void *)swift_release();
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

void *sub_21CB64898()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97928);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24)
      {
        int64_t v9 = v23 + 2;
        if (v23 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v6 + 8 * v9);
        if (!v24) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    char v21 = *(unsigned char *)(v17 + 17);
    LOBYTE(v17) = *(unsigned char *)(v17 + 18);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(unsigned char *)(v22 + 16) = v20;
    *(unsigned char *)(v22 + 17) = v21;
    *(unsigned char *)(v22 + 18) = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v13) {
    goto LABEL_28;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21CB64A68()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C979C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_21CB64C18()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97930);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v33 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v34 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  uint64_t v35 = v2;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v36 = v10;
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
    if (v15 >= v34) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    int64_t v17 = v10 + 1;
    if (!v16)
    {
      int64_t v17 = v10 + 2;
      if (v10 + 2 >= v34) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v10 + 3;
        if (v10 + 3 >= v34) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    int64_t v36 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    uint64_t v19 = *(void *)(v2 + 48) + 32 * v14;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    uint64_t v22 = *(void *)(v19 + 16);
    char v23 = *(unsigned char *)(v19 + 24);
    char v24 = *(unsigned char *)(v19 + 25);
    char v25 = *(unsigned char *)(v19 + 26);
    sub_21CB89050();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_21CB88380();
    swift_bridgeObjectRelease();
    uint64_t result = sub_21CB89090();
    uint64_t v26 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v32 = *(void *)(v8 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v11 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v4 + 48) + 32 * v11;
    *(void *)uint64_t v12 = v20;
    *(void *)(v12 + 8) = v21;
    *(void *)(v12 + 16) = v22;
    *(unsigned char *)(v12 + 24) = v23;
    *(unsigned char *)(v12 + 25) = v24;
    *(unsigned char *)(v12 + 26) = v25;
    ++*(void *)(v4 + 16);
    uint64_t v2 = v35;
    int64_t v10 = v36;
  }
  uint64_t v18 = v10 + 4;
  if (v10 + 4 >= v34)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v10 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v34) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21CB64F28()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97900);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v27 = v0;
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
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_21CB88950();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
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

uint64_t sub_21CB651A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21CB87CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_21CA57E34(&qword_267C97950);
  uint64_t v7 = sub_21CB88B20();
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
  int64_t v34 = v0;
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
    sub_21CB66900(&qword_267C97870, MEMORY[0x263F3CF58]);
    uint64_t result = sub_21CB88260();
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

uint64_t sub_21CB65554()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C97928);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  for (i = v2; ; uint64_t v2 = i)
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
    if (v15 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v31 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v31 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(v2 + 48) + 24 * v14;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    char v21 = *(unsigned char *)(v18 + 16);
    char v22 = *(unsigned char *)(v18 + 17);
    char v23 = *(unsigned char *)(v18 + 18);
    sub_21CB89050();
    swift_bridgeObjectRetain_n();
    sub_21CB88380();
    swift_bridgeObjectRelease();
    sub_21CB89070();
    sub_21CB89070();
    sub_21CB89070();
    uint64_t result = sub_21CB89090();
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
          goto LABEL_36;
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
    uint64_t v12 = *(void *)(v4 + 48) + 24 * v11;
    *(void *)uint64_t v12 = v19;
    *(void *)(v12 + 8) = v20;
    *(unsigned char *)(v12 + 16) = v21;
    *(unsigned char *)(v12 + 17) = v22;
    *(unsigned char *)(v12 + 18) = v23;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v31 + 8 * v17);
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
    if (v10 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21CB65878()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_21CA57E34(&qword_267C979C8);
  uint64_t v3 = sub_21CB88B20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_37:
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
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_35;
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
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_21CB89050();
    sub_21CB89070();
    if (v20)
    {
      swift_bridgeObjectRetain_n();
      sub_21CB88380();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_21CB89090();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v21;
    v13[1] = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_35:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_37;
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
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_21CB65B50(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_21CB88EE0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v88 = 0;
      uint64_t v89 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v91 = *(void *)(v89 + 24 * i + 16);
        uint64_t v92 = v88;
        do
        {
          uint64_t v93 = v89 + v92;
          if (v91 >= *(void *)(v89 + v92 + 16)) {
            break;
          }
          if (!v89) {
            goto LABEL_140;
          }
          uint64_t v94 = *(void *)(v93 + 24);
          uint64_t v95 = (void *)(v89 + v92);
          uint64_t v96 = *(void *)(v89 + v92 + 32);
          *(_OWORD *)(v93 + 24) = *(_OWORD *)v93;
          uint64_t result = *(void *)(v93 + 16);
          *(void *)(v93 + 40) = result;
          void *v95 = v94;
          v95[1] = v96;
          *(void *)(v93 + 16) = v91;
          v92 -= 24;
        }
        while (v92 != -24);
        v88 += 24;
      }
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
    goto LABEL_145;
  }
  uint64_t v6 = result;
  uint64_t v105 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      unint64_t v97 = v12;
      uint64_t v107 = v9;
      if (v13 >= 2)
      {
        uint64_t v98 = *v105;
        do
        {
          unint64_t v99 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v98) {
            goto LABEL_144;
          }
          uint64_t v100 = v97;
          uint64_t v101 = *(void *)&v97[16 * v99 + 32];
          uint64_t v102 = *(void *)&v97[16 * v13 + 24];
          sub_21CB6625C((char *)(v98 + 24 * v101), (char *)(v98 + 24 * *(void *)&v97[16 * v13 + 16]), v98 + 24 * v102, __dst);
          if (v1) {
            break;
          }
          if (v102 < v101) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v100 = sub_21CAD2EA0((uint64_t)v100);
          }
          if (v99 >= *((void *)v100 + 2)) {
            goto LABEL_133;
          }
          uint64_t v103 = &v100[16 * v99 + 32];
          *(void *)uint64_t v103 = v101;
          *((void *)v103 + 1) = v102;
          unint64_t v104 = *((void *)v100 + 2);
          if (v13 > v104) {
            goto LABEL_134;
          }
          memmove(&v100[16 * v13 + 16], &v100[16 * v13 + 32], 16 * (v104 - v13));
          unint64_t v97 = v100;
          *((void *)v100 + 2) = v104 - 1;
          unint64_t v13 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v107 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v107 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = sub_21CB88580();
    *(void *)(v8 + 16) = v7;
    uint64_t v107 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v106 = *a1 + 64;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v108 = v6;
  uint64_t v109 = v3;
  uint64_t v110 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 24 * v10 + 16);
      uint64_t v16 = *(void *)(v11 + 24 * v14 + 16);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v17 = (uint64_t *)(v106 + 24 * v14);
        uint64_t v18 = v15;
        while (1)
        {
          uint64_t v20 = *v17;
          v17 += 3;
          uint64_t v19 = v20;
          if (v15 < v16 == v20 >= v18) {
            break;
          }
          ++v10;
          uint64_t v18 = v19;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v21 = 24 * v10;
          uint64_t v22 = 24 * v14;
          uint64_t v23 = v10;
          uint64_t v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = v11 + v21;
              long long v27 = *(_OWORD *)(v11 + v22);
              uint64_t v28 = *(void *)(v11 + v22 + 16);
              uint64_t v29 = *(void *)(v11 + v21 - 8);
              *(_OWORD *)uint64_t v25 = *(_OWORD *)(v11 + v21 - 24);
              *(void *)(v25 + 16) = v29;
              *(_OWORD *)(v26 - 24) = v27;
              *(void *)(v26 - 8) = v28;
            }
            ++v24;
            v21 -= 24;
            v22 += 24;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v30 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v30 >= v3) {
      uint64_t v30 = v3;
    }
    if (v30 < v14) {
      break;
    }
    if (v10 != v30)
    {
      uint64_t v31 = (uint64_t *)(v11 + 24 * v10);
      do
      {
        uint64_t v32 = *(void *)(v11 + 24 * v10 + 16);
        uint64_t v33 = v14;
        int64_t v34 = v31;
        do
        {
          if (v32 >= *(v34 - 1)) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v35 = *v34;
          uint64_t v36 = v34[1];
          *(_OWORD *)int64_t v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *(v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      uint64_t v10 = v30;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_21CAD2AD8(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v38 = *((void *)v12 + 2);
    unint64_t v37 = *((void *)v12 + 3);
    unint64_t v13 = v38 + 1;
    uint64_t v11 = v110;
    if (v38 >= v37 >> 1)
    {
      uint64_t v87 = sub_21CAD2AD8((char *)(v37 > 1), v38 + 1, 1, v12);
      uint64_t v11 = v110;
      unint64_t v12 = v87;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v39 = v12 + 32;
    int64_t v40 = &v12[16 * v38 + 32];
    *(void *)int64_t v40 = v14;
    *((void *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        unint64_t v41 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v46 = &v39[16 * v13];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_119;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_120;
          }
          unint64_t v53 = v13 - 2;
          uint64_t v54 = &v39[16 * v13 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_122;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_125;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_129;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v70 = *((void *)v12 + 4);
            uint64_t v71 = *((void *)v12 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_77;
          }
          uint64_t v43 = *((void *)v12 + 4);
          uint64_t v42 = *((void *)v12 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_121;
        }
        unint64_t v53 = v13 - 2;
        uint64_t v59 = &v39[16 * v13 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_124;
        }
        id v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_127;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_128;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_83:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v64) {
          goto LABEL_123;
        }
        uint64_t v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_126;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
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
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        uint64_t v81 = v12;
        uint64_t v82 = &v39[16 * v80];
        uint64_t v83 = *(void *)v82;
        uint64_t v84 = &v39[16 * v41];
        uint64_t v85 = *((void *)v84 + 1);
        sub_21CB6625C((char *)(v11 + 24 * *(void *)v82), (char *)(v11 + 24 * *(void *)v84), v11 + 24 * v85, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v85 < v83) {
          goto LABEL_116;
        }
        if (v41 > *((void *)v81 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v82 = v83;
        *(void *)&v39[16 * v80 + 8] = v85;
        unint64_t v86 = *((void *)v81 + 2);
        if (v41 >= v86) {
          goto LABEL_118;
        }
        unint64_t v12 = v81;
        unint64_t v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((void *)v81 + 2) = v86 - 1;
        uint64_t v11 = v110;
        if (v86 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v108;
    uint64_t v3 = v109;
    if (v10 >= v109)
    {
      uint64_t v9 = v107;
      goto LABEL_102;
    }
  }
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
  uint64_t result = sub_21CB88CF0();
  __break(1u);
  return result;
}

uint64_t sub_21CB6625C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v26 = __src;
  uint64_t v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      unint64_t v17 = &v4[24 * v11];
      uint64_t v24 = v17;
      uint64_t v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v18 = a3 - 24;
        do
        {
          uint64_t v19 = (char *)(v18 + 24);
          if (*((void *)v17 - 1) >= *((void *)v6 - 1))
          {
            uint64_t v24 = v17 - 24;
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              long long v22 = *(_OWORD *)(v17 - 24);
              *(void *)(v18 + 16) = *((void *)v17 - 1);
              *(_OWORD *)unint64_t v18 = v22;
            }
            uint64_t v20 = v6;
            v17 -= 24;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v20 = v6 - 24;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              long long v21 = *(_OWORD *)v20;
              *(void *)(v18 + 16) = *((void *)v6 - 1);
              *(_OWORD *)unint64_t v18 = v21;
            }
            uint64_t v26 = v6 - 24;
            if (v20 <= v7) {
              break;
            }
          }
          v18 -= 24;
          uint64_t v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_21CAD2DD0((void **)&v26, &v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    unint64_t v12 = &v4[24 * v9];
    uint64_t v24 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      unint64_t v13 = v4;
      while (1)
      {
        if (*((void *)v6 + 2) >= *((void *)v13 + 2))
        {
          uint64_t v4 = v13 + 24;
          uint64_t v15 = v13;
          uint64_t v14 = v6;
          if (v7 == v13)
          {
            v13 += 24;
            if (v7 < v4) {
              goto LABEL_18;
            }
          }
          else
          {
            v13 += 24;
          }
        }
        else
        {
          uint64_t v14 = v6 + 24;
          uint64_t v15 = v6;
          if (v7 == v6 && v7 < v14) {
            goto LABEL_18;
          }
        }
        long long v16 = *(_OWORD *)v15;
        *((void *)v7 + 2) = *((void *)v15 + 2);
        *(_OWORD *)uint64_t v7 = v16;
LABEL_18:
        v7 += 24;
        if (v13 < v12)
        {
          uint64_t v6 = v14;
          if ((unint64_t)v14 < a3) {
            continue;
          }
        }
        uint64_t v25 = v4;
        uint64_t v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  uint64_t result = sub_21CB88D50();
  __break(1u);
  return result;
}

BOOL _s7FMFCore15FMFActionsErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  unint64_t v4 = *(unsigned __int8 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 9);
  if (*(unsigned char *)(a1 + 9) == 1)
  {
    switch(*(void *)&v2)
    {
      case 1:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 1uLL;
        goto LABEL_14;
      case 2:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 2uLL;
        goto LABEL_14;
      case 3:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 3uLL;
        goto LABEL_14;
      case 4:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 4uLL;
        goto LABEL_14;
      case 5:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 5uLL;
        goto LABEL_14;
      case 6:
        BOOL v6 = v5 == 0;
        *(void *)&v3 ^= 6uLL;
        goto LABEL_14;
      case 7:
        if (!*(unsigned char *)(a2 + 9) || __PAIR128__(v4, *(unint64_t *)&v3) < 7) {
          return 0;
        }
        goto LABEL_21;
      default:
        BOOL v6 = v5 == 0;
LABEL_14:
        uint64_t v9 = *(void *)&v3 | v4;
        if (v6 || v9 != 0) {
          return 0;
        }
LABEL_21:
        BOOL result = 1;
        break;
    }
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    int v7 = *(unsigned __int8 *)(a1 + 8);
    if ((v7 | v4)) {
      return v7 & v4 & 1;
    }
    else {
      return v2 == v3;
    }
  }
  return result;
}

unint64_t sub_21CB66634()
{
  unint64_t result = qword_267C97898;
  if (!qword_267C97898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97898);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FMFActionStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21CB66754);
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

ValueMetadata *type metadata accessor for FMFActionStatus()
{
  return &type metadata for FMFActionStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for FMFActionsError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMFActionsError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FMFActionsError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(_WORD *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 10) = v3;
  return result;
}

uint64_t sub_21CB667F0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21CB6680C(uint64_t result, int a2)
{
  if (a2)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 9) = 1;
  }
  else
  {
    *(unsigned char *)(result + 9) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMFActionsError()
{
  return &type metadata for FMFActionsError;
}

uint64_t sub_21CB66840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_21CB66854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_21CB66868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_21CB6687C()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB66894(void *a1, void *a2)
{
  return sub_21CB605D0(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_21CB668A0()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_21CB668F0()
{
  sub_21CB608C0(*(id *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void (**)(void **, uint64_t))(v0 + 40));
}

uint64_t sub_21CB66900(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_21CB66948()
{
  unint64_t result = qword_267C978A8;
  if (!qword_267C978A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C978A8);
  }
  return result;
}

uint64_t sub_21CB6699C()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

void sub_21CB669B4(uint64_t a1, void *a2)
{
  sub_21CB5F298(a1, a2, *(uint64_t **)(v2 + 16), *(void (**)(uint64_t *, void *))(v2 + 24));
}

uint64_t sub_21CB669C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_21CA65B10;
  return sub_21CB5B28C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_21CB66A98()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB66AB0(void *a1)
{
  return sub_21CB5AAB0(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t *, void *))(v1 + 24));
}

uint64_t sub_21CB66ABC()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB66AD4(uint64_t a1, void *a2)
{
  return sub_21CB5A2BC(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24));
}

uint64_t sub_21CB66AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C951F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CB66B48()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

void sub_21CB66B60(uint64_t a1, void *a2)
{
  sub_21CB598F8(a1, a2, *(uint64_t **)(v2 + 16), *(void (**)(uint64_t *, void *))(v2 + 24));
}

uint64_t sub_21CB66B70(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_21CB53A94(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t (**)(uint64_t *, void *))(v3 + 32));
}

uint64_t sub_21CB66B80(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_21CA65B10;
  return sub_21CB53F10(a1, v4, v5, v6, v7, v9, v8);
}

unint64_t sub_21CB66C54()
{
  unint64_t result = qword_267C978F8;
  if (!qword_267C978F8)
  {
    sub_21CA05908(255, (unint64_t *)&qword_267C951F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C978F8);
  }
  return result;
}

uint64_t sub_21CB66CC0(uint64_t a1, void *a2)
{
  return sub_21CB51CB4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32));
}

uint64_t sub_21CB66CD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21CA73F2C;
  return sub_21CB521F0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21CB66DAC()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EEA0]);
}

void sub_21CB66DC4()
{
  sub_21CB25CC8(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_21CB66DD4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21CA65B10;
  return sub_21CB50A98(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21CB66EB0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21CB66F10(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t v6 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v51 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v14 - 8);
  long long v16 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for FMFFriend();
  uint64_t v53 = *(void *)(v17 - 8);
  uint64_t v54 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (void *)((char *)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = a3;
  uint64_t v20 = qword_267C94990;
  dispatch_group_t v52 = a3;
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_21CB880A0();
  uint64_t v22 = sub_21CA4CC18(v21, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v23 = sub_21CB88070();
  os_log_type_t v24 = sub_21CB88880();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v48 = v16;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v49 = v10;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v50 = a1;
    uint64_t v28 = v27;
    *(void *)&long long v56 = v27;
    v47[1] = v22;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v62 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v29 = sub_21CB88310();
    uint64_t v62 = sub_21CA4E450(v29, v30, (uint64_t *)&v56);
    sub_21CB889C0();
    swift_release_n();
    long long v16 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v23, v24, "%s: stop sharing action initiated", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v28;
    a1 = v50;
    MEMORY[0x21D4B6B70](v31, -1, -1);
    uint64_t v32 = v26;
    uint64_t v10 = v49;
    MEMORY[0x21D4B6B70](v32, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    uint64_t v33 = sub_21CB88070();
    os_log_type_t v34 = sub_21CB88860();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_21CA00000, v33, v34, "Action is restricted. Returning with error", v35, 2u);
      MEMORY[0x21D4B6B70](v35, -1, -1);
    }

    dispatch_group_leave(v52);
  }
  else
  {
    sub_21CA2E134(a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v16, 0, 1, v54);
    uint64_t v36 = type metadata accessor for FMFIntermediateFriend();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v13, 1, 1, v36);
    uint64_t v62 = 0;
    char v63 = 1;
    uint64_t v60 = 1;
    char v61 = 0;
    uint64_t v37 = type metadata accessor for FMFLocation();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v10, 1, 1, v37);
    uint64_t v59 = 0;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    sub_21CA5572C((uint64_t)v16, (uint64_t)v13, (unint64_t *)&v62, (uint64_t)&v60, (uint64_t)v10, 0, 1, (uint64_t *)&v56, v19, 0, 0, 2u, 2u, 2);
    LOBYTE(v56) = 3;
    sub_21CB26744((uint64_t)v19, &v56);
    uint64_t v38 = sub_21CB87190();
    *((void *)&v57 + 1) = v38;
    *(void *)&long long v58 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
    uint64_t v39 = sub_21CA6D80C((uint64_t *)&v56);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v39, *MEMORY[0x263F3CA30], v38);
    LOBYTE(v38) = MEMORY[0x21D4B4280](&v56);
    sub_21CA2B0D0((uint64_t)&v56);
    if (v38)
    {
      uint64_t v40 = swift_bridgeObjectRetain();
      uint64_t v41 = sub_21CB4F4F0(v40);
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_21CB4DF28(v41);
      swift_bridgeObjectRelease();
      uint64_t v43 = sub_21CB88640();
      uint64_t v44 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v51, 1, 1, v43);
      char v45 = (void *)swift_allocObject();
      v45[2] = 0;
      v45[3] = 0;
      v45[4] = v42;
      v45[5] = a2;
      v45[6] = a1;
      v45[7] = sub_21CB6FCC8;
      v45[8] = v55;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98(v44, (uint64_t)&unk_267C97940, (uint64_t)v45);
      swift_release();
    }
    else
    {
      sub_21CB5359C(a1, (uint64_t)sub_21CB6FCC8, v55);
    }
    sub_21CB66EB0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

uint64_t sub_21CB676A8(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), NSObject *a6)
{
  uint64_t v106 = a1;
  uint64_t v11 = sub_21CB88100();
  uint64_t v101 = *(void *)(v11 - 8);
  uint64_t v102 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v99 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_21CB88150();
  uint64_t v98 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  unint64_t v97 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for FMFFriend();
  MEMORY[0x270FA5388](v14);
  uint64_t v95 = (uint64_t)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  uint64_t v107 = v16;
  uint64_t v17 = qword_267C94990;
  swift_retain();
  swift_retain();
  dispatch_group_t v105 = a6;
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_21CB880A0();
  uint64_t v19 = (uint64_t *)sub_21CA4CC18(v18, (uint64_t)qword_267CA5368);
  swift_retain_n();
  unint64_t v104 = v19;
  uint64_t v20 = sub_21CB88070();
  os_log_type_t v21 = sub_21CB88880();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v103 = (uint64_t)a5;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v96 = v14;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v108 = *a2;
    aBlock[0] = v24;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v25 = sub_21CB88310();
    uint64_t v108 = sub_21CA4E450(v25, v26, aBlock);
    uint64_t v14 = v96;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v20, v21, "%s: removeFriend action initiated", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v24, -1, -1);
    uint64_t v27 = v23;
    a5 = (uint64_t (*)(uint64_t *, void *))v103;
    MEMORY[0x21D4B6B70](v27, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    uint64_t v28 = sub_21CB88070();
    os_log_type_t v29 = sub_21CB88860();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v30 = 0;
      _os_log_impl(&dword_21CA00000, v28, v29, "Action is restricted. Returning with error", v30, 2u);
      MEMORY[0x21D4B6B70](v30, -1, -1);
    }

    LOBYTE(aBlock[0]) = 0;
    sub_21CB66948();
    uint64_t v31 = (void *)swift_allocError();
    *(void *)uint64_t v32 = 5;
    *(_WORD *)(v32 + 8) = 256;
    sub_21CB0FD34((char *)aBlock, v31, a3, a4, a5, (uint64_t)v105);
  }
  else
  {
    uint64_t v33 = a2[6];
    os_log_type_t v34 = (uint64_t *)(v106 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
    sub_21CB2747C(v106 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
    dispatch_group_t v105 = dispatch_group_create();
    uint64_t v96 = swift_allocObject();
    *(void *)(v96 + 16) = 0;
    uint64_t v35 = *(int *)(v14 + 36);
    unint64_t v104 = v34;
    uint64_t v36 = *(NSObject **)((char *)v34 + v35);
    uint64_t v103 = (uint64_t)v36;
    if (v36)
    {
      dispatch_group_t v37 = v105;
      dispatch_group_enter(v105);
      uint64_t v39 = *v104;
      uint64_t v38 = v104[1];
      type metadata accessor for FMFRemoveFriendRequest();
      uint64_t v40 = (uint64_t *)(swift_allocObject() + qword_267CA5450);
      *uint64_t v40 = v39;
      v40[1] = v38;
      swift_bridgeObjectRetain();
      uint64_t v93 = sub_21CA36A84();
      uint64_t v94 = v33;
      uint64_t v41 = a2[11];
      unint64_t v42 = a2[12];
      sub_21CA2B2CC(a2 + 8, v41);
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = v96;
      *(void *)(v43 + 24) = v37;
      uint64_t v44 = *(void (**)(void *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, unint64_t))(v42 + 64);
      uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      uint64_t v46 = v37;
      v44(v93, sub_21CB71414, v43, refreshed, v41, v42);
      swift_release();
      swift_release();
      dispatch_group_enter(v46);
      uint64_t v47 = v95;
      sub_21CA2E134((uint64_t)v104, v95, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      type metadata accessor for FMFStopSharingAction();
      uint64_t v48 = swift_allocObject();
      sub_21CB71074(v47, v48 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      *(unsigned char *)(v48 + 16) = 1;
      uint64_t v36 = v46;
      sub_21CB66F10(v48, a2, v36);
      swift_release();

      LOBYTE(v36) = v103;
    }
    uint64_t v95 = swift_allocObject();
    *(void *)(v95 + 16) = 0;
    if ((v36 & 2) != 0)
    {
      dispatch_group_t v49 = v105;
      dispatch_group_enter(v105);
      uint64_t v50 = *v104;
      uint64_t v51 = v104[1];
      sub_21CB230E8(*v104, v51);
      type metadata accessor for FMFRemoveFriendRequest();
      dispatch_group_t v52 = (uint64_t *)(swift_allocObject() + qword_267CA5450);
      *dispatch_group_t v52 = v50;
      v52[1] = v51;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_21CA36A84();
      uint64_t v53 = a2[11];
      unint64_t v54 = a2[12];
      uint64_t v94 = (uint64_t)sub_21CA2B2CC(a2 + 8, v53);
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = v95;
      *(void *)(v55 + 24) = v49;
      long long v56 = *(void (**)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, unint64_t))(v54 + 64);
      uint64_t v57 = type metadata accessor for FMFInitRefreshClientResponse();
      long long v58 = v49;
      swift_retain();
      v56(v36, sub_21CB6FC70, v55, v57, v53, v54);
      LOBYTE(v36) = v103;
      swift_release();
      swift_release();
    }
    uint64_t v94 = swift_allocObject();
    *(void *)(v94 + 16) = 0;
    if ((v36 & 4) != 0)
    {
      dispatch_group_t v59 = v105;
      dispatch_group_enter(v105);
      uint64_t v61 = *v104;
      uint64_t v60 = v104[1];
      type metadata accessor for FMFRemoveFriendRequest();
      uint64_t v62 = (uint64_t *)(swift_allocObject() + qword_267CA5450);
      *uint64_t v62 = v61;
      v62[1] = v60;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_21CA36A84();
      uint64_t v63 = a2[11];
      unint64_t v64 = a2[12];
      uint64_t v93 = sub_21CA2B2CC(a2 + 8, v63);
      uint64_t v65 = swift_allocObject();
      *(void *)(v65 + 16) = v94;
      *(void *)(v65 + 24) = v59;
      uint64_t v66 = *(void (**)(NSObject *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, unint64_t))(v64 + 64);
      uint64_t v67 = type metadata accessor for FMFInitRefreshClientResponse();
      uint64_t v68 = v59;
      swift_retain();
      v66(v36, sub_21CB71414, v65, v67, v63, v64);
      LOBYTE(v36) = v103;
      swift_release();
      swift_release();
    }
    uint64_t v103 = swift_allocObject();
    *(void *)(v103 + 16) = 0;
    if ((v36 & 8) != 0)
    {
      dispatch_group_t v69 = v105;
      dispatch_group_enter(v105);
      uint64_t v71 = *v104;
      uint64_t v70 = v104[1];
      type metadata accessor for FMFRespondToInviteRequest();
      uint64_t v72 = swift_allocObject();
      uint64_t v73 = (uint64_t *)(v72 + qword_267CA52F0);
      *uint64_t v73 = v71;
      v73[1] = v70;
      *(unsigned char *)(v72 + qword_267CA52F8) = 0;
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_21CA36A84();
      uint64_t v75 = a2[11];
      unint64_t v76 = a2[12];
      unint64_t v104 = sub_21CA2B2CC(a2 + 8, v75);
      uint64_t v77 = swift_allocObject();
      *(void *)(v77 + 16) = v103;
      *(void *)(v77 + 24) = v69;
      uint64_t v78 = *(void (**)(void *, void (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, unint64_t))(v76 + 64);
      uint64_t v79 = type metadata accessor for FMFInitRefreshClientResponse();
      unint64_t v80 = v69;
      swift_retain();
      v78(v74, sub_21CB71414, v77, v79, v75, v76);
      swift_release();
      swift_release();
    }
    sub_21CA05908(0, (unint64_t *)&qword_267C96F80);
    unint64_t v104 = (uint64_t *)sub_21CB88900();
    uint64_t v81 = (void *)swift_allocObject();
    uint64_t v82 = v95;
    v81[2] = v96;
    v81[3] = a2;
    uint64_t v83 = v107;
    v81[4] = v106;
    void v81[5] = sub_21CB713F0;
    v81[6] = v83;
    v81[7] = v82;
    uint64_t v84 = v103;
    v81[8] = v94;
    v81[9] = v84;
    aBlock[4] = (uint64_t)sub_21CB6FC50;
    aBlock[5] = (uint64_t)v81;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CA1B084;
    uint64_t aBlock[3] = (uint64_t)&unk_26CD70F98;
    uint64_t v85 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    unint64_t v86 = v97;
    sub_21CB88120();
    uint64_t v108 = MEMORY[0x263F8EE78];
    sub_21CB66900((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA6D91C();
    uint64_t v87 = v99;
    uint64_t v88 = v102;
    sub_21CB88A60();
    uint64_t v89 = v104;
    dispatch_group_t v90 = v105;
    sub_21CB888A0();
    _Block_release(v85);

    (*(void (**)(char *, uint64_t))(v101 + 8))(v87, v88);
    (*(void (**)(char *, uint64_t))(v98 + 8))(v86, v100);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21CB68304(uint64_t a1, void *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  uint64_t v61 = a5;
  v12[4] = a5;
  v12[5] = a6;
  uint64_t v13 = qword_267C94990;
  swift_retain();
  uint64_t v62 = a4;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21CB880A0();
  sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v15 = sub_21CB88070();
  os_log_type_t v16 = sub_21CB88880();
  uint64_t v60 = a3;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v63 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v19 = sub_21CB88310();
    sub_21CA4E450(v19, v20, &v63);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v15, v16, "%s: ShowHideLocation: action initiated", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v18, -1, -1);
    MEMORY[0x21D4B6B70](v17, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    os_log_type_t v21 = sub_21CB88070();
    os_log_type_t v22 = sub_21CB88860();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_21CA00000, v21, v22, "Action is restricted. Returning with error", v23, 2u);
      MEMORY[0x21D4B6B70](v23, -1, -1);
    }

    LOBYTE(v63) = 0;
    sub_21CB66948();
    uint64_t v25 = (void *)swift_allocError();
    uint64_t v26 = 5;
    goto LABEL_21;
  }
  sub_21CA57E34(&qword_267C95598);
  sub_21CB88910();
  uint64_t v27 = v65;
  if (!v65)
  {
    swift_retain_n();
    uint64_t v38 = sub_21CB88070();
    os_log_type_t v39 = sub_21CB88880();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v63 = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v42 = sub_21CB88310();
      sub_21CA4E450(v42, v43, &v63);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v38, v39, "%s: ShowHideLocation: Operation cannot be completed if no prefs exist in store.", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v41, -1, -1);
      MEMORY[0x21D4B6B70](v40, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v63) = 0;
    sub_21CB66948();
    uint64_t v25 = (void *)swift_allocError();
    uint64_t v26 = 2;
LABEL_21:
    *(void *)uint64_t v24 = v26;
    *(_WORD *)(v24 + 8) = 256;
    uint64_t v55 = v25;
    long long v56 = a3;
LABEL_22:
    sub_21CB0FD34((char *)&v63, v55, v56, v62, v61, a6);

    return swift_release();
  }
  dispatch_group_t v59 = a2;
  uint64_t v28 = v63;
  uint64_t v29 = v64;
  uint64_t v30 = v66;
  int v31 = *(unsigned __int8 *)(a1 + 17);
  if ((((v63 & 0x100) == 0) ^ v31))
  {
    sub_21CA59D84(v63, v64, v65);
    swift_retain_n();
    uint64_t v32 = sub_21CB88070();
    os_log_type_t v33 = sub_21CB88880();
    if (os_log_type_enabled(v32, v33))
    {
      os_log_type_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v63 = v35;
      *(_DWORD *)os_log_type_t v34 = 136315138;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v36 = sub_21CB88310();
      sub_21CA4E450(v36, v37, &v63);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v32, v33, "%s: ShowHideLocation: Existing value of hideLocation is not different. Skipping action.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v35, -1, -1);
      MEMORY[0x21D4B6B70](v34, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v63) = 0;
    sub_21CB66948();
    uint64_t v25 = (void *)swift_allocError();
    *(void *)uint64_t v58 = 2;
    *(_WORD *)(v58 + 8) = 256;
    uint64_t v55 = v25;
    long long v56 = v60;
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21CA59D84(v28, v29, v27);
  uint64_t v44 = 256;
  if (!v31) {
    uint64_t v44 = 0;
  }
  uint64_t v45 = v44 | v28 & 0xFF010001;
  type metadata accessor for FMFSavePrefsRequest();
  uint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + qword_267C95578) = 1;
  uint64_t v47 = (uint64_t *)(v46 + qword_267C95570);
  *uint64_t v47 = v45;
  v47[1] = v29;
  void v47[2] = v27;
  v47[3] = v30;
  uint64_t v48 = (void *)(v46 + qword_267C95580);
  void *v48 = 0;
  v48[1] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  dispatch_group_t v49 = sub_21CA36A84();
  uint64_t v63 = v45;
  uint64_t v64 = v29;
  uint64_t v65 = v27;
  uint64_t v66 = v30;
  sub_21CB2821C(&v63, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v50 = v59[11];
  uint64_t v51 = v59[12];
  sub_21CA2B2CC(v59 + 8, v50);
  dispatch_group_t v52 = (void *)swift_allocObject();
  v52[2] = v59;
  v52[3] = sub_21CB713F0;
  v52[4] = v12;
  uint64_t v53 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v51 + 64);
  uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
  swift_retain();
  swift_retain();
  v53(v49, sub_21CB6FDCC, v52, refreshed, v50, v51);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21CB68BA0(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v65 = a1;
  uint64_t v11 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v63 = (void *)((char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v61 = (uint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for FMFFriend();
  uint64_t v59 = *(void *)(v18 - 8);
  uint64_t v60 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v64 = (void *)((char *)v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  uint64_t v21 = qword_267C94990;
  uint64_t v62 = a3;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_21CB880A0();
  uint64_t v23 = sub_21CA4CC18(v22, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v24 = sub_21CB88070();
  os_log_type_t v25 = sub_21CB88880();
  if (os_log_type_enabled(v24, v25))
  {
    v55[1] = v23;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v56 = a4;
    uint64_t v27 = (uint8_t *)v26;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v57 = a5;
    uint64_t v29 = v28;
    *(void *)&v66[0] = v28;
    uint64_t v58 = a6;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v70 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v30 = sub_21CB88310();
    uint64_t v70 = sub_21CA4E450(v30, v31, (uint64_t *)v66);
    a6 = v58;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v24, v25, "%s: stop following action initiated", v27, 0xCu);
    swift_arrayDestroy();
    uint64_t v32 = v29;
    a5 = v57;
    MEMORY[0x21D4B6B70](v32, -1, -1);
    os_log_type_t v33 = v27;
    a4 = v56;
    MEMORY[0x21D4B6B70](v33, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    os_log_type_t v34 = sub_21CB88070();
    os_log_type_t v35 = sub_21CB88860();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_21CA00000, v34, v35, "Action is restricted. Returning with error", v36, 2u);
      MEMORY[0x21D4B6B70](v36, -1, -1);
    }

    LOBYTE(v66[0]) = 0;
    sub_21CB66948();
    unint64_t v37 = (void *)swift_allocError();
    *(void *)uint64_t v38 = 5;
    *(_WORD *)(v38 + 8) = 256;
    sub_21CB0FD34((char *)v66, v37, v62, a4, a5, a6);
  }
  else
  {
    uint64_t v39 = v65 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend;
    uint64_t v40 = *(void *)(v65 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend);
    uint64_t v41 = *(void *)(v65 + OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend + 8);
    type metadata accessor for FMFRemoveFriendRequest();
    uint64_t v42 = (uint64_t *)(swift_allocObject() + qword_267CA5450);
    *uint64_t v42 = v40;
    v42[1] = v41;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_21CA36A84();
    uint64_t v43 = v61;
    sub_21CA2E134(v39, v61, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v43, 0, 1, v60);
    uint64_t v44 = type metadata accessor for FMFIntermediateFriend();
    uint64_t v45 = (uint64_t)v63;
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v63, 1, 1, v44);
    uint64_t v70 = 0;
    char v71 = 1;
    uint64_t v68 = 2;
    char v69 = 0;
    uint64_t v46 = type metadata accessor for FMFLocation();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v13, 1, 1, v46);
    uint64_t v67 = 0;
    memset(v66, 0, sizeof(v66));
    uint64_t v47 = v64;
    sub_21CA5572C(v43, v45, (unint64_t *)&v70, (uint64_t)&v68, (uint64_t)v13, 0, 1, (uint64_t *)v66, v64, 0, 0, 2u, 2u, 2);
    LOBYTE(v66[0]) = 5;
    sub_21CB26744((uint64_t)v47, v66);
    sub_21CB230E8(v40, v41);
    uint64_t v48 = a2[11];
    unint64_t v49 = a2[12];
    uint64_t v63 = sub_21CA2B2CC(a2 + 8, v48);
    uint64_t v50 = (void *)swift_allocObject();
    uint64_t v51 = v65;
    v50[2] = a2;
    v50[3] = v51;
    v50[4] = sub_21CB713F0;
    v50[5] = v20;
    dispatch_group_t v52 = *(void (**)(unsigned char *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, unint64_t))(v49 + 64);
    uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    swift_retain();
    swift_retain();
    swift_retain();
    v52(v62, sub_21CB6FDE0, v50, refreshed, v48, v49);
    swift_release();
    swift_release();
    sub_21CB66EB0((uint64_t)v47, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

uint64_t sub_21CB692E8(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v65 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v64 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v63 = (uint64_t)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for FMFFriend();
  uint64_t v61 = *(void *)(v21 - 8);
  uint64_t v62 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (uint8_t **)((char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = (void *)swift_allocObject();
  _OWORD v24[2] = a3;
  v24[3] = a4;
  v24[4] = a5;
  v24[5] = a6;
  uint64_t v25 = qword_267C94990;
  uint64_t v66 = a3;
  swift_retain();
  uint64_t v67 = a4;
  swift_retain();
  swift_retain();
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_21CB880A0();
  uint64_t v27 = sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v60 = v27;
  uint64_t v28 = sub_21CB88070();
  os_log_type_t v29 = sub_21CB88880();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v57 = a5;
    unint64_t v31 = (uint8_t *)v30;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v58 = a6;
    uint64_t v33 = v32;
    *(void *)&long long v68 = v32;
    uint64_t v59 = v14;
    *(_DWORD *)unint64_t v31 = 136315138;
    uint64_t v56 = v31 + 4;
    uint64_t v74 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v34 = sub_21CB88310();
    uint64_t v74 = sub_21CA4E450(v34, v35, (uint64_t *)&v68);
    uint64_t v14 = v59;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v28, v29, "%s: stop sharing action initiated", v31, 0xCu);
    swift_arrayDestroy();
    uint64_t v36 = v33;
    a6 = v58;
    MEMORY[0x21D4B6B70](v36, -1, -1);
    unint64_t v37 = v31;
    a5 = v57;
    MEMORY[0x21D4B6B70](v37, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    uint64_t v38 = sub_21CB88070();
    os_log_type_t v39 = sub_21CB88860();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_21CA00000, v38, v39, "Action is restricted. Returning with error", v40, 2u);
      MEMORY[0x21D4B6B70](v40, -1, -1);
    }

    LOBYTE(v68) = 0;
    sub_21CB66948();
    uint64_t v41 = (void *)swift_allocError();
    *(void *)uint64_t v42 = 5;
    *(_WORD *)(v42 + 8) = 256;
    sub_21CB0FD34((char *)&v68, v41, v66, v67, a5, a6);
  }
  else
  {
    uint64_t v43 = v63;
    sub_21CA2E134(a1 + OBJC_IVAR____TtC7FMFCore20FMFStopSharingAction_friend, v63, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56))(v43, 0, 1, v62);
    uint64_t v44 = type metadata accessor for FMFIntermediateFriend();
    uint64_t v45 = (uint64_t)v64;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v64, 1, 1, v44);
    uint64_t v74 = 0;
    char v75 = 1;
    uint64_t v72 = 1;
    char v73 = 0;
    uint64_t v46 = type metadata accessor for FMFLocation();
    uint64_t v47 = (uint64_t)v65;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v65, 1, 1, v46);
    uint64_t v71 = 0;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v68 = 0u;
    sub_21CA5572C(v43, v45, (unint64_t *)&v74, (uint64_t)&v72, v47, 0, 1, (uint64_t *)&v68, v23, 0, 0, 2u, 2u, 2);
    LOBYTE(v68) = 3;
    sub_21CB26744((uint64_t)v23, &v68);
    uint64_t v48 = sub_21CB87190();
    *((void *)&v69 + 1) = v48;
    *(void *)&long long v70 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
    unint64_t v49 = sub_21CA6D80C((uint64_t *)&v68);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v48 - 8) + 104))(v49, *MEMORY[0x263F3CA30], v48);
    LOBYTE(v48) = MEMORY[0x21D4B4280](&v68);
    sub_21CA2B0D0((uint64_t)&v68);
    if (v48)
    {
      uint64_t v50 = swift_bridgeObjectRetain();
      uint64_t v51 = sub_21CB4F4F0(v50);
      swift_bridgeObjectRelease();
      uint64_t v52 = sub_21CB4DF28(v51);
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_21CB88640();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v14, 1, 1, v53);
      unint64_t v54 = (void *)swift_allocObject();
      v54[2] = 0;
      v54[3] = 0;
      v54[4] = v52;
      v54[5] = a2;
      v54[6] = a1;
      v54[7] = sub_21CB713F0;
      v54[8] = v24;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98((uint64_t)v14, (uint64_t)&unk_267C97958, (uint64_t)v54);
      swift_release();
    }
    else
    {
      sub_21CB5359C(a1, (uint64_t)sub_21CB713F0, (uint64_t)v24);
    }
    sub_21CB66EB0((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

uint64_t sub_21CB69B1C(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v132 = (uint64_t)&v124 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v129 = (char *)&v124 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v133 = (char *)&v124 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v18 - 8);
  unint64_t v137 = (char *)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v135 = (uint64_t)&v124 - v21;
  uint64_t v136 = type metadata accessor for FMFFriend();
  uint64_t v22 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  uint64_t v24 = (char *)&v124 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (uint64_t *)((char *)&v124 - v26);
  MEMORY[0x270FA5388](v28);
  uint64_t v131 = (uint64_t)&v124 - v29;
  MEMORY[0x270FA5388](v30);
  uint64_t v134 = (uint64_t *)((char *)&v124 - v31);
  MEMORY[0x270FA5388](v32);
  v146 = (uint64_t *)((char *)&v124 - v33);
  uint64_t v130 = v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v138 = (uint64_t *)((char *)&v124 - v36);
  unint64_t v37 = (void *)swift_allocObject();
  v37[2] = a3;
  v37[3] = a4;
  uint64_t v144 = a5;
  v37[4] = a5;
  v37[5] = a6;
  uint64_t v38 = qword_267C94990;
  uint64_t v142 = a3;
  swift_retain();
  uint64_t v143 = a4;
  swift_retain();
  uint64_t v145 = a6;
  swift_retain();
  if (v38 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_21CB880A0();
  uint64_t v40 = sub_21CA4CC18(v39, (uint64_t)qword_267CA5368);
  swift_retain_n();
  swift_retain_n();
  uint64_t v141 = v40;
  uint64_t v41 = sub_21CB88070();
  os_log_type_t v42 = sub_21CB88880();
  int v43 = v42;
  BOOL v44 = os_log_type_enabled(v41, v42);
  uint64_t v140 = v22;
  if (v44)
  {
    uint64_t v45 = swift_slowAlloc();
    LODWORD(v128) = v43;
    uint64_t v46 = v45;
    uint64_t v47 = swift_slowAlloc();
    v139 = v37;
    uint64_t v127 = v47;
    *(void *)&long long v147 = v47;
    *(_DWORD *)uint64_t v46 = 136315394;
    uint64_t v153 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v48 = sub_21CB88310();
    uint64_t v153 = sub_21CA4E450(v48, v49, (uint64_t *)&v147);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v50 = a2;
    uint64_t v51 = *(void *)(a1 + 24);
    unint64_t v52 = *(void *)(a1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v153 = sub_21CA4E450(v51, v52, (uint64_t *)&v147);
    sub_21CB889C0();
    swift_release_n();
    a2 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v41, (os_log_type_t)v128, "%s: respond to invite action initiated for friend ID: %s", (uint8_t *)v46, 0x16u);
    uint64_t v53 = v127;
    swift_arrayDestroy();
    unint64_t v37 = v139;
    MEMORY[0x21D4B6B70](v53, -1, -1);
    MEMORY[0x21D4B6B70](v46, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_release_n();
  }
  uint64_t v54 = (uint64_t)v146;
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    uint64_t v55 = sub_21CB88070();
    os_log_type_t v56 = sub_21CB88860();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_21CA00000, v55, v56, "Action is restricted. Returning with error", v57, 2u);
      MEMORY[0x21D4B6B70](v57, -1, -1);
    }

    LOBYTE(v147) = 0;
    sub_21CB66948();
    uint64_t v59 = (void *)swift_allocError();
    uint64_t v60 = 5;
    goto LABEL_29;
  }
  unint64_t v61 = a2[6];
  sub_21CA57E34(&qword_267C95D50);
  unint64_t v128 = v61;
  sub_21CB88910();
  uint64_t v127 = 0;
  uint64_t v62 = *(void *)(v147 + 16);
  uint64_t v126 = a1;
  if (v62)
  {
    uint64_t v125 = a2;
    v139 = v37;
    uint64_t v63 = v147 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
    uint64_t v64 = *(void *)(a1 + 24);
    uint64_t v65 = *(void *)(a1 + 32);
    uint64_t v66 = *(void *)(v140 + 72);
    uint64_t v124 = v147;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_21CA2E134(v63, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v67 = v27[1];
      *(void *)&long long v147 = *v27;
      *((void *)&v147 + 1) = v67;
      uint64_t v153 = v64;
      uint64_t v154 = v65;
      sub_21CA4D63C();
      char v68 = sub_21CB88A30();
      sub_21CA2E134((uint64_t)v27, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      if (v68) {
        break;
      }
      uint64_t v69 = *((void *)v24 + 4);
      swift_bridgeObjectRetain();
      LOBYTE(v69) = sub_21CB3B114(v64, v65, v69);
      swift_bridgeObjectRelease();
      sub_21CB66EB0((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      if (v69) {
        goto LABEL_18;
      }
      sub_21CB66EB0((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      v63 += v66;
      if (!--v62)
      {
        swift_bridgeObjectRelease();
        unint64_t v37 = v139;
        a2 = v125;
        uint64_t v54 = (uint64_t)v146;
        goto LABEL_16;
      }
    }
    sub_21CB66EB0((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for FMFFriend);
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v72 = v135;
    sub_21CB71074((uint64_t)v27, v135, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    uint64_t v70 = v140;
    uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v140 + 56);
    uint64_t v73 = v136;
    v71(v72, 0, 1, v136);
    unint64_t v37 = v139;
    a2 = v125;
    uint64_t v54 = (uint64_t)v146;
  }
  else
  {
LABEL_16:
    uint64_t v70 = v140;
    uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v140 + 56);
    uint64_t v72 = v135;
    uint64_t v73 = v136;
    v71(v135, 1, 1, v136);
  }
  swift_bridgeObjectRelease();
  int v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v72, 1, v73);
  char v75 = v138;
  uint64_t v76 = (uint64_t)v137;
  if (v74 == 1)
  {
    sub_21CA1B88C(v72, &qword_267C96F10);
    swift_retain_n();
    uint64_t v77 = sub_21CB88070();
    os_log_type_t v78 = sub_21CB88860();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      *(void *)&long long v147 = v80;
      *(_DWORD *)uint64_t v79 = 136315138;
      uint64_t v153 = *a2;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v81 = sub_21CB88310();
      uint64_t v153 = sub_21CA4E450(v81, v82, (uint64_t *)&v147);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v77, v78, "%s: Friend not present right now. Action may be triggered from notification", v79, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v80, -1, -1);
      MEMORY[0x21D4B6B70](v79, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v147) = 0;
    sub_21CB66948();
    uint64_t v59 = (void *)swift_allocError();
    uint64_t v60 = 1;
LABEL_29:
    *(void *)uint64_t v58 = v60;
    *(_WORD *)(v58 + 8) = 256;
    sub_21CB0FD34((char *)&v147, v59, v142, v143, v144, v145);

    return swift_release();
  }
  sub_21CB71074(v72, (uint64_t)v138, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  uint64_t v83 = *(uint64_t *)((char *)v75 + *(int *)(v73 + 36));
  sub_21CA2E134((uint64_t)v75, v54, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  if ((v83 & 8) != 0)
  {
    sub_21CB66EB0(v54, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    goto LABEL_32;
  }
  uint64_t v84 = *(void *)(v54 + *(int *)(v73 + 36));
  sub_21CB66EB0(v54, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  if ((v84 & 2) != 0)
  {
LABEL_32:
    int v91 = *(unsigned __int8 *)(v126 + 40);
    sub_21CA2E134((uint64_t)v75, v76, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    v71(v76, 0, 1, v73);
    uint64_t v92 = type metadata accessor for FMFIntermediateFriend();
    uint64_t v93 = (uint64_t)v133;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v133, 1, 1, v92);
    if (v91 == 1)
    {
      uint64_t v153 = 1;
      LOBYTE(v154) = 0;
      uint64_t v151 = 0;
      char v152 = 1;
    }
    else
    {
      uint64_t v153 = 0;
      LOBYTE(v154) = 1;
      uint64_t v151 = 8;
      char v152 = 0;
    }
    uint64_t v94 = type metadata accessor for FMFLocation();
    uint64_t v95 = (uint64_t)v129;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v129, 1, 1, v94);
    uint64_t v150 = 0;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v147 = 0u;
    uint64_t v96 = v134;
    sub_21CA5572C(v76, v93, (unint64_t *)&v153, (uint64_t)&v151, v95, 0, 1, (uint64_t *)&v147, v134, 0, 0, 2u, 2u, 2);
    LOBYTE(v147) = v91;
    sub_21CB26744((uint64_t)v96, &v147);
    uint64_t v97 = swift_bridgeObjectRetain();
    uint64_t v98 = sub_21CB4F4F0(v97);
    uint64_t v99 = sub_21CB4DF28(v98);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_21CB87190();
    *((void *)&v148 + 1) = v100;
    *(void *)&long long v149 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
    uint64_t v101 = sub_21CA6D80C((uint64_t *)&v147);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v100 - 8) + 104))(v101, *MEMORY[0x263F3CA30], v100);
    LOBYTE(v100) = MEMORY[0x21D4B4280](&v147);
    sub_21CA2B0D0((uint64_t)&v147);
    if (v100)
    {
      uint64_t v102 = sub_21CB88640();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v132, 1, 1, v102);
      uint64_t v103 = v131;
      sub_21CA2E134((uint64_t)v75, v131, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      unint64_t v104 = (*(unsigned __int8 *)(v70 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
      unint64_t v105 = (v130 + v104 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v106 = (void *)swift_allocObject();
      v106[2] = 0;
      v106[3] = 0;
      v106[4] = v126;
      v106[5] = v99;
      v106[6] = a2;
      sub_21CB71074(v103, (uint64_t)v106 + v104, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v107 = (void *)((char *)v106 + v105);
      void *v107 = sub_21CB713F0;
      v107[1] = v37;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98(v132, (uint64_t)&unk_267C97968, (uint64_t)v106);
      swift_release();
      sub_21CB66EB0((uint64_t)v134, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v108 = (uint64_t)v75;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v110 = *v75;
      uint64_t v109 = v75[1];
      type metadata accessor for FMFRespondToInviteRequest();
      uint64_t v111 = swift_allocObject();
      uint64_t v112 = (void *)(v111 + qword_267CA52F0);
      *uint64_t v112 = v110;
      v112[1] = v109;
      *(unsigned char *)(v111 + qword_267CA52F8) = v91;
      swift_bridgeObjectRetain();
      uint64_t v113 = sub_21CA36A84();
      uint64_t v114 = a2[11];
      unint64_t v115 = a2[12];
      v146 = sub_21CA2B2CC(a2 + 8, v114);
      uint64_t v116 = v131;
      sub_21CA2E134((uint64_t)v75, v131, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v117 = a2;
      unint64_t v118 = (*(unsigned __int8 *)(v70 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
      unint64_t v119 = (v130 + v118 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v120 = swift_allocObject();
      *(void *)(v120 + 16) = v117;
      sub_21CB71074(v116, v120 + v118, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      unint64_t v121 = (void *)(v120 + v119);
      *unint64_t v121 = sub_21CB713F0;
      v121[1] = v37;
      unint64_t v122 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t, unint64_t))(v115 + 64);
      uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v122(v113, sub_21CB701E0, v120, refreshed, v114, v115);
      swift_release();
      swift_release();
      sub_21CB66EB0((uint64_t)v134, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v108 = (uint64_t)v138;
    }
    sub_21CB66EB0(v108, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    return swift_release();
  }
  uint64_t v85 = sub_21CB88070();
  os_log_type_t v86 = sub_21CB88880();
  if (os_log_type_enabled(v85, v86))
  {
    uint64_t v87 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v87 = 0;
    _os_log_impl(&dword_21CA00000, v85, v86, "%%@: Cannot respond to invite from someone who has not sent the invite", v87, 2u);
    MEMORY[0x21D4B6B70](v87, -1, -1);
  }

  LOBYTE(v147) = 0;
  sub_21CB66948();
  uint64_t v88 = (void *)swift_allocError();
  *(void *)uint64_t v89 = 1;
  *(_WORD *)(v89 + 8) = 256;
  sub_21CB0FD34((char *)&v147, v88, v142, v143, v144, v145);

  sub_21CB66EB0((uint64_t)v75, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  return swift_release();
}

uint64_t sub_21CB6ACA4(void **a1, void **a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), unint64_t a6)
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_allocObject();
  *(void *)(isUniquelyReferenced_nonNull_native + 16) = a3;
  *(void *)(isUniquelyReferenced_nonNull_native + 24) = a4;
  *(void *)(isUniquelyReferenced_nonNull_native + 32) = a5;
  *(void *)(isUniquelyReferenced_nonNull_native + 40) = a6;
  uint64_t v12 = qword_267C94990;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v12 != -1) {
LABEL_61:
  }
    swift_once();
  uint64_t v13 = sub_21CB880A0();
  sub_21CA4CC18(v13, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v14 = sub_21CB88070();
  os_log_type_t v15 = sub_21CB88880();
  uint64_t v83 = isUniquelyReferenced_nonNull_native;
  uint64_t v81 = a6;
  uint64_t v82 = a4;
  uint64_t v80 = a5;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v86 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    dispatch_group_t v90 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v18 = sub_21CB88310();
    dispatch_group_t v90 = sub_21CA4E450(v18, v19, &v86);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v14, v15, "%s: set favorite action initiated", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v17, -1, -1);
    MEMORY[0x21D4B6B70](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v20 = (char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_friend;
  if ((v20[*(int *)(type metadata accessor for FMFFriend() + 36)] & 2) == 0)
  {
    swift_retain_n();
    uint64_t v21 = sub_21CB88070();
    os_log_type_t v22 = sub_21CB88880();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v86 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      dispatch_group_t v90 = *a2;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v25 = sub_21CB88310();
      dispatch_group_t v90 = sub_21CA4E450(v25, v26, &v86);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v21, v22, "%s: SaveFavorites: Error saving favorite. Friend needs to be sharing location with me.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v24, -1, -1);
      MEMORY[0x21D4B6B70](v23, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v86) = 0;
    sub_21CB66948();
    uint64_t v48 = (void *)swift_allocError();
    *(void *)uint64_t v49 = 1;
    *(_WORD *)(v49 + 8) = 256;
    sub_21CB0FD34((char *)&v86, v48, a3, v82, v80, v81);

    return swift_release();
  }
  sub_21CA57E34(&qword_267C95598);
  uint64_t v27 = 0;
  sub_21CB88910();
  uint64_t v28 = v88;
  if (!v88
    || (v29 = v89, v30 = v86, uint64_t v14 = v87, swift_bridgeObjectRetain(), sub_21CA59D84(v30, (uint64_t)v14, v28), !v29))
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x263F8EE78];
  }
  uint64_t v79 = a2;
  dispatch_group_t v90 = v29;
  sub_21CB4FBA8((void **)&v90);
  p_Class isa = (void *)MEMORY[0x263F8EE78];
  uint64_t v85 = (void *)MEMORY[0x263F8EE78];
  Class isa = v90[2].isa;
  if (isa)
  {
    uint64_t v14 = *(NSObject **)v20;
    Class v33 = (Class)*((void *)v20 + 1);
    uint64_t v34 = (char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order;
    uint64_t v27 = v90 + 5;
    do
    {
      uint64_t v36 = v27[-1].isa;
      Class v37 = v27->isa;
      BOOL v38 = v14 == v36 && v33 == v37;
      if (!v38 && (sub_21CB88F50() & 1) == 0 || v34[8] != 1)
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          p_Class isa = sub_21CAC7864(0, p_isa[2] + 1, 1, p_isa);
        }
        unint64_t v40 = p_isa[2];
        unint64_t v39 = p_isa[3];
        uint64_t v41 = p_isa;
        if (v40 >= v39 >> 1) {
          uint64_t v41 = sub_21CAC7864((void *)(v39 > 1), v40 + 1, 1, p_isa);
        }
        v41[2] = v40 + 1;
        p_Class isa = v41;
        uint64_t v35 = &v41[2 * v40];
        v35[4] = v36;
        v35[5] = v37;
        uint64_t v85 = v41;
      }
      v27 += 3;
      Class isa = (Class)((char *)isa - 1);
    }
    while (isa);
  }
  swift_bridgeObjectRelease();
  os_log_type_t v42 = (uint64_t *)((char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order);
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC7FMFCore20FMFSetFavoriteAction_order + 8)) {
    goto LABEL_35;
  }
  int v43 = p_isa;
  uint64_t v44 = *v42;
  uint64_t v45 = (uint64_t)v43[2].isa;
  if (*v42 >= v45)
  {
    uint64_t v27 = *(NSObject **)v20;
    uint64_t v44 = *((void *)v20 + 1);
    swift_bridgeObjectRetain();
    uint64_t v14 = v43;
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_32:
      unint64_t v51 = (unint64_t)v14[2].isa;
      unint64_t v50 = (unint64_t)v14[3].isa;
      if (v51 >= v50 >> 1) {
        uint64_t v14 = sub_21CAC7864((void *)(v50 > 1), v51 + 1, 1, v14);
      }
      v14[2].Class isa = (Class)(v51 + 1);
      unint64_t v52 = &v14[2 * v51];
      v52[4].Class isa = (Class)v27;
      v52[5].Class isa = (Class)v44;
      p_Class isa = &v14->isa;
      goto LABEL_35;
    }
LABEL_63:
    uint64_t v14 = sub_21CAC7864(0, v45 + 1, 1, v14);
    goto LABEL_32;
  }
  if (v44 < 0)
  {
    __break(1u);
    goto LABEL_63;
  }
  uint64_t v47 = *(void *)v20;
  uint64_t v46 = *((void *)v20 + 1);
  swift_bridgeObjectRetain();
  sub_21CB29CA0(v44, v44, v47, v46);
  p_Class isa = v85;
LABEL_35:
  a1 = (void **)p_isa[2];
  if (!a1)
  {
    a5 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x263F8EE78];
    uint64_t v53 = (void *)MEMORY[0x263F8EE80];
LABEL_55:
    swift_bridgeObjectRelease();
    sub_21CB88910();
    uint64_t v69 = v88;
    if (v88)
    {
      uint64_t v71 = v86;
      uint64_t v70 = (uint64_t)v87;
      swift_bridgeObjectRetain();
      sub_21CA59D84(v71, v70, v69);
      uint64_t v86 = v71 & 0xFF010101;
      uint64_t v87 = v70;
      uint64_t v88 = v69;
      uint64_t v89 = a5;
      sub_21CB2821C(&v86, 0);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    type metadata accessor for FMFSaveFavoritesRequest();
    *(void *)(swift_allocObject() + qword_267CA50F0) = v53;
    uint64_t v72 = sub_21CA36A84();
    uint64_t v73 = v79[11];
    uint64_t v74 = v79[12];
    sub_21CA2B2CC(v79 + 8, v73);
    char v75 = (void *)swift_allocObject();
    v75[2] = v79;
    v75[3] = sub_21CB713F0;
    v75[4] = v83;
    uint64_t v76 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v74 + 64);
    uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    swift_retain();
    swift_retain();
    v76(v72, sub_21CB70774, v75, refreshed, v73, v74);
    swift_release();
    swift_release();
    return swift_release();
  }
  a2 = 0;
  a3 = p_isa + 5;
  a5 = (uint64_t (*)(uint64_t *, void *))MEMORY[0x263F8EE78];
  uint64_t v53 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    a4 = *((void *)a3 - 1);
    uint64_t v54 = *(void *)a3;
    swift_bridgeObjectRetain_n();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v86 = (uint64_t)v53;
    a6 = sub_21CA5BCE0(a4, v54);
    uint64_t v56 = v53[2];
    BOOL v57 = (v55 & 1) == 0;
    uint64_t v58 = v56 + v57;
    if (__OFADD__(v56, v57))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    char v59 = v55;
    if (v53[3] < v58) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v53 = (void *)v86;
      if (v55) {
        goto LABEL_44;
      }
    }
    else
    {
      sub_21CB85700();
      uint64_t v53 = (void *)v86;
      if (v59)
      {
LABEL_44:
        *(void *)(v53[7] + 8 * a6) = a2;
        goto LABEL_48;
      }
    }
LABEL_46:
    v53[(a6 >> 6) + 8] |= 1 << a6;
    uint64_t v62 = (uint64_t *)(v53[6] + 16 * a6);
    *uint64_t v62 = a4;
    v62[1] = v54;
    *(void *)(v53[7] + 8 * a6) = a2;
    uint64_t v63 = v53[2];
    BOOL v64 = __OFADD__(v63, 1);
    uint64_t v65 = v63 + 1;
    if (v64) {
      goto LABEL_60;
    }
    v53[2] = v65;
    swift_bridgeObjectRetain();
LABEL_48:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a5 = (uint64_t (*)(uint64_t *, void *))sub_21CAC81A8(0, *((void *)a5 + 2) + 1, 1, a5);
    }
    unint64_t v67 = *((void *)a5 + 2);
    unint64_t v66 = *((void *)a5 + 3);
    if (v67 >= v66 >> 1) {
      a5 = (uint64_t (*)(uint64_t *, void *))sub_21CAC81A8((void *)(v66 > 1), v67 + 1, 1, a5);
    }
    *((void *)a5 + 2) = v67 + 1;
    char v68 = (void *)((char *)a5 + 24 * v67);
    v68[5] = v54;
    v68[6] = a2;
    a3 += 16;
    v68[4] = a4;
    a2 = (void **)((char *)a2 + 1);
    if (a1 == a2) {
      goto LABEL_55;
    }
  }
  sub_21CB818C0(v58, isUniquelyReferenced_nonNull_native);
  unint64_t v60 = sub_21CA5BCE0(a4, v54);
  if ((v59 & 1) == (v61 & 1))
  {
    a6 = v60;
    uint64_t v53 = (void *)v86;
    if (v59) {
      goto LABEL_44;
    }
    goto LABEL_46;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = sub_21CB88FA0();
  __break(1u);
  return result;
}

uint64_t sub_21CB6B708(uint64_t a1, void *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  uint64_t v69 = a5;
  v12[4] = a5;
  v12[5] = a6;
  uint64_t v13 = qword_267C94990;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21CB880A0();
  sub_21CA4CC18(v14, (uint64_t)qword_267CA5368);
  swift_retain_n();
  os_log_type_t v15 = sub_21CB88070();
  os_log_type_t v16 = sub_21CB88880();
  uint64_t v70 = a6;
  unint64_t v67 = a3;
  uint64_t v68 = a4;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    unint64_t v72 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v19 = sub_21CB88310();
    v71[0] = sub_21CA4E450(v19, v20, (uint64_t *)&v72);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v15, v16, "%s: updating prefs action initiated", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v18, -1, -1);
    MEMORY[0x21D4B6B70](v17, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  sub_21CA57E34(&qword_267C95598);
  sub_21CB88910();
  uint64_t v21 = v74;
  if (v74)
  {
    uint64_t v65 = a2;
    unint64_t v66 = v12;
    uint64_t v23 = v72;
    uint64_t v22 = v73;
    unint64_t v24 = v72 >> 24;
    LOWORD(v72) = v72 & 0x101;
    BYTE2(v72) = BYTE2(v23) & 1;
    BYTE3(v72) = v24;
    uint64_t v25 = *(unsigned __int8 *)(a1 + 24);
    int v26 = *(unsigned __int8 *)(a1 + 25);
    int v27 = *(unsigned __int8 *)(a1 + 26);
    uint64_t v28 = *(unsigned __int8 *)(a1 + 27);
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 40);
    unint64_t v31 = *(void *)(a1 + 48);
    LOBYTE(v71[0]) = v25;
    BYTE1(v71[0]) = v26;
    BYTE2(v71[0]) = v27;
    BYTE3(v71[0]) = v28;
    uint64_t v63 = v30;
    uint64_t v64 = v29;
    v71[1] = v30;
    v71[2] = v29;
    uint64_t v71[3] = v31;
    char v32 = _s7FMFCore14FMFPreferencesV2eeoiySbAC_ACtFZ_0((unsigned __int8 *)&v72, (unsigned __int8 *)v71);
    sub_21CA59D84(v23, v22, v21);
    if (v32)
    {
      swift_retain_n();
      Class v33 = sub_21CB88070();
      os_log_type_t v34 = sub_21CB88880();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        unint64_t v72 = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        v71[0] = *v65;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v37 = sub_21CB88310();
        v71[0] = sub_21CA4E450(v37, v38, (uint64_t *)&v72);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CA00000, v33, v34, "%s: Existing prefs match the action prefs. Action is not needed.", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v36, -1, -1);
        MEMORY[0x21D4B6B70](v35, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      LOBYTE(v72) = 0;
      sub_21CB66948();
      unint64_t v60 = (void *)swift_allocError();
      *(void *)uint64_t v61 = 2;
      *(_WORD *)(v61 + 8) = 256;
      sub_21CB0FD34((char *)&v72, v60, v67, v68, v69, v70);
    }
    else
    {
      uint64_t v45 = 256;
      if (!v26) {
        uint64_t v45 = 0;
      }
      uint64_t v46 = v45 | v25;
      uint64_t v47 = 0x10000;
      if (!v27) {
        uint64_t v47 = 0;
      }
      unint64_t v48 = v46 | v47 | (v28 << 24);
      type metadata accessor for FMFSavePrefsRequest();
      uint64_t v49 = swift_allocObject();
      *(unsigned char *)(v49 + qword_267C95578) = 0;
      unint64_t v50 = (unint64_t *)(v49 + qword_267C95570);
      *unint64_t v50 = v48;
      v50[1] = v63;
      v50[2] = v64;
      v50[3] = v31;
      unint64_t v51 = (void *)(v49 + qword_267C95580);
      *unint64_t v51 = 0;
      v51[1] = 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v52 = sub_21CA36A84();
      unint64_t v72 = v48;
      uint64_t v73 = v63;
      uint64_t v74 = v64;
      unint64_t v75 = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21CB2821C((uint64_t *)&v72, 0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v53 = v65[11];
      uint64_t v54 = v65[12];
      sub_21CA2B2CC(v65 + 8, v53);
      char v55 = (void *)swift_allocObject();
      void v55[2] = v65;
      v55[3] = sub_21CB713F0;
      v55[4] = v66;
      uint64_t v56 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v54 + 64);
      uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v56(v52, sub_21CB707C0, v55, refreshed, v53, v54);
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_retain_n();
    unint64_t v39 = sub_21CB88070();
    os_log_type_t v40 = sub_21CB88880();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      unint64_t v72 = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      sub_21CA57E34(&qword_267C978A0);
      uint64_t v43 = sub_21CB88310();
      v71[0] = sub_21CA4E450(v43, v44, (uint64_t *)&v72);
      sub_21CB889C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CA00000, v39, v40, "%s: Existing prefs not avaiable. Operation can be completed only if prefs exist in store.", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v42, -1, -1);
      MEMORY[0x21D4B6B70](v41, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v72) = 0;
    sub_21CB66948();
    uint64_t v58 = (void *)swift_allocError();
    *(void *)uint64_t v59 = 2;
    *(_WORD *)(v59 + 8) = 256;
    sub_21CB0FD34((char *)&v72, v58, v67, v68, v69, v70);
  }
  return swift_release();
}

uint64_t sub_21CB6BF4C(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v69 = a1;
  uint64_t v11 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v68 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  uint64_t v14 = qword_267C94990;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_21CB880A0();
  uint64_t v16 = sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v17 = sub_21CB88070();
  os_log_type_t v18 = sub_21CB88880();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v67 = a6;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v64 = v16;
    unint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v66 = a4;
    uint64_t v22 = v21;
    uint64_t v71 = v21;
    uint64_t v65 = a5;
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v70 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v23 = sub_21CB88310();
    uint64_t v70 = sub_21CA4E450(v23, v24, &v71);
    a6 = v67;
    a5 = v65;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v17, v18, "%s: updating me action initiated", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v22;
    a4 = v66;
    MEMORY[0x21D4B6B70](v25, -1, -1);
    MEMORY[0x21D4B6B70](v20, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    int v26 = sub_21CB88070();
    os_log_type_t v27 = sub_21CB88860();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_21CA00000, v26, v27, "Action is restricted. Returning with error", v28, 2u);
      MEMORY[0x21D4B6B70](v28, -1, -1);
    }

    LOBYTE(v71) = 0;
    sub_21CB66948();
    uint64_t v29 = (void *)swift_allocError();
    *(void *)uint64_t v30 = 5;
    *(_WORD *)(v30 + 8) = 256;
    sub_21CB0FD34((char *)&v71, v29, a3, a4, a5, a6);
  }
  else
  {
    uint64_t v31 = a2[6];
    sub_21CA57E34(&qword_267C95CF0);
    sub_21CB88910();
    uint64_t v32 = v71;
    uint64_t v62 = a2;
    uint64_t v63 = v13;
    uint64_t v67 = v31;
    if (v71)
    {
      uint64_t v34 = v76;
      uint64_t v33 = v77;
      uint64_t v35 = v73;
      uint64_t v36 = v72;
      LODWORD(v66) = v78 & 1;
      uint64_t v37 = *(uint64_t (**)(uint64_t *, void *))(v69 + 24);
      uint64_t v38 = *(void *)(v69 + 32);
      uint64_t v64 = v75;
      uint64_t v65 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21CA2D658(v32);
      uint64_t v71 = v32;
      uint64_t v72 = v36;
      uint64_t v13 = v63;
      uint64_t v73 = v35;
      uint64_t v74 = (uint64_t)v65;
      uint64_t v75 = v38;
      uint64_t v76 = v34;
      uint64_t v77 = v33;
      char v78 = v66;
      sub_21CB28A30((uint64_t)&v71, 0);
      swift_bridgeObjectRelease();
      a2 = v62;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v39 = sub_21CB87190();
    uint64_t v74 = v39;
    uint64_t v75 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
    os_log_type_t v40 = sub_21CA6D80C(&v71);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v39 - 8) + 104))(v40, *MEMORY[0x263F3CA30], v39);
    LOBYTE(v39) = MEMORY[0x21D4B4280](&v71);
    sub_21CA2B0D0((uint64_t)&v71);
    if (v39)
    {
      uint64_t v41 = sub_21CB88640();
      uint64_t v42 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v68, 1, 1, v41);
      uint64_t v43 = (void *)swift_allocObject();
      v43[2] = 0;
      v43[3] = 0;
      v43[4] = v69;
      v43[5] = a2;
      v43[6] = sub_21CB713F0;
      v43[7] = v13;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98(v42, (uint64_t)&unk_267C97978, (uint64_t)v43);
      swift_release();
    }
    else
    {
      uint64_t v44 = *(void *)(v69 + 24);
      uint64_t v45 = *(void *)(v69 + 32);
      type metadata accessor for FMFSavePrefsRequest();
      uint64_t v46 = swift_allocObject();
      *(unsigned char *)(v46 + qword_267C95578) = 0;
      uint64_t v47 = (_OWORD *)(v46 + qword_267C95570);
      *uint64_t v47 = 0u;
      v47[1] = 0u;
      unint64_t v48 = (uint64_t *)(v46 + qword_267C95580);
      uint64_t *v48 = v44;
      v48[1] = v45;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_21CA36A84();
      sub_21CB88910();
      uint64_t v50 = v71;
      if (v71)
      {
        uint64_t v69 = v44;
        uint64_t v52 = v76;
        uint64_t v51 = v77;
        uint64_t v54 = v72;
        uint64_t v53 = v73;
        LODWORD(v68) = v78 & 1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        a2 = v62;
        sub_21CA2D658(v50);
        uint64_t v71 = v50;
        uint64_t v72 = v54;
        uint64_t v73 = v53;
        uint64_t v74 = v69;
        uint64_t v75 = v45;
        uint64_t v76 = v52;
        uint64_t v77 = v51;
        char v78 = (char)v68;
        sub_21CB28A30((uint64_t)&v71, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v13 = v63;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v55 = a2[11];
      uint64_t v56 = a2[12];
      sub_21CA2B2CC(a2 + 8, v55);
      BOOL v57 = a2;
      uint64_t v58 = (void *)swift_allocObject();
      v58[2] = v57;
      v58[3] = sub_21CB713F0;
      v58[4] = v13;
      uint64_t v59 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v56 + 64);
      uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v59(v49, sub_21CB7080C, v58, refreshed, v55, v56);
      swift_release();
      swift_release();
    }
  }
  return swift_release();
}

uint64_t sub_21CB6C780(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v55 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  uint64_t v56 = a3;
  BOOL v57 = a5;
  v14[4] = a5;
  v14[5] = a6;
  uint64_t v15 = qword_267C94990;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_21CB880A0();
  sub_21CA4CC18(v16, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v17 = sub_21CB88070();
  os_log_type_t v18 = sub_21CB88880();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v52 = v14;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v54 = a1;
    unint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v53 = a6;
    uint64_t v22 = v21;
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v58 = *a2;
    v59[0] = v21;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v23 = sub_21CB88310();
    uint64_t v58 = sub_21CA4E450(v23, v24, v59);
    uint64_t v14 = v52;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v17, v18, "%s: not now action initiated", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v22;
    a6 = v53;
    MEMORY[0x21D4B6B70](v25, -1, -1);
    int v26 = v20;
    a1 = v54;
    MEMORY[0x21D4B6B70](v26, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  os_log_type_t v27 = (void *)(a1 + OBJC_IVAR____TtC7FMFCore15FMFNotNowAction_friend);
  uint64_t v28 = type metadata accessor for FMFFriend();
  if ((*((unsigned char *)v27 + *(int *)(v28 + 36)) & 2) != 0
    && ((int v29 = *((unsigned __int8 *)v27 + *(int *)(v28 + 40)), v29 != 2) ? (v30 = (v29 & 1) == 0) : (v30 = 0), v30))
  {
    uint64_t v37 = sub_21CB87190();
    v59[3] = v37;
    v59[4] = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
    uint64_t v38 = sub_21CA6D80C(v59);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v38, *MEMORY[0x263F3CA30], v37);
    LOBYTE(v37) = MEMORY[0x21D4B4280](v59);
    sub_21CA2B0D0((uint64_t)v59);
    if (v37)
    {
      uint64_t v39 = sub_21CB88640();
      uint64_t v40 = (uint64_t)v55;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v55, 1, 1, v39);
      uint64_t v41 = (void *)swift_allocObject();
      v41[2] = 0;
      v41[3] = 0;
      v41[4] = a1;
      v41[5] = sub_21CB713F0;
      v41[6] = v14;
      swift_retain();
      swift_retain();
      sub_21CB09F98(v40, (uint64_t)&unk_267C97988, (uint64_t)v41);
    }
    else
    {
      uint64_t v42 = a2;
      uint64_t v44 = *v27;
      uint64_t v43 = v27[1];
      type metadata accessor for FMFNotNowRequest();
      uint64_t v45 = (void *)(swift_allocObject() + qword_267CA5230);
      *uint64_t v45 = v44;
      v45[1] = v43;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_21CA36A84();
      uint64_t v47 = v42[11];
      uint64_t v48 = v42[12];
      sub_21CA2B2CC(v42 + 8, v47);
      uint64_t v49 = (void *)swift_allocObject();
      v49[2] = v42;
      v49[3] = sub_21CB713F0;
      v49[4] = v14;
      uint64_t v50 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, uint64_t))(v48 + 64);
      uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
      swift_retain();
      swift_retain();
      v50(v46, sub_21CB7095C, v49, refreshed, v47, v48);
      swift_release();
    }
    swift_release();
  }
  else
  {
    uint64_t v31 = sub_21CB88070();
    os_log_type_t v32 = sub_21CB88880();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_21CA00000, v31, v32, "%%@: Cannot respond not now when the friend is not sharing location with me.", v33, 2u);
      MEMORY[0x21D4B6B70](v33, -1, -1);
    }

    LOBYTE(v59[0]) = 0;
    sub_21CB66948();
    uint64_t v34 = (void *)swift_allocError();
    *(void *)uint64_t v35 = 1;
    *(_WORD *)(v35 + 8) = 256;
    sub_21CB0FD34((char *)v59, v34, v56, a4, v57, a6);
  }
  return swift_release();
}

uint64_t sub_21CB6CD8C(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21CA57E34((uint64_t *)&unk_267C96EF0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v80 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21CA57E34(&qword_267C95040);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v79 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21CA57E34(&qword_267C96F10);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v78 = (uint64_t)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for FMFFriend();
  uint64_t v77 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v22 = (uint64_t *)((char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a3;
  uint64_t v23[3] = a4;
  uint64_t v85 = a5;
  v23[4] = a5;
  v23[5] = a6;
  uint64_t v24 = qword_267C94990;
  uint64_t v83 = a3;
  swift_retain();
  uint64_t v84 = a4;
  swift_retain();
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_21CB880A0();
  uint64_t v26 = sub_21CA4CC18(v25, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v82 = v26;
  os_log_type_t v27 = sub_21CB88070();
  os_log_type_t v28 = sub_21CB88880();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v75 = v23;
    BOOL v30 = (uint8_t *)v29;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v76 = v22;
    uint64_t v32 = v31;
    *(void *)&long long v86 = v31;
    uint64_t v74 = a6;
    *(_DWORD *)BOOL v30 = 136315138;
    uint64_t v92 = *a2;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v33 = sub_21CB88310();
    uint64_t v92 = sub_21CA4E450(v33, v34, (uint64_t *)&v86);
    a6 = v74;
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v27, v28, "%s: ask to follow action initiated", v30, 0xCu);
    swift_arrayDestroy();
    uint64_t v35 = v32;
    uint64_t v22 = v76;
    MEMORY[0x21D4B6B70](v35, -1, -1);
    uint64_t v36 = v30;
    uint64_t v23 = v75;
    MEMORY[0x21D4B6B70](v36, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(a2[13] + 40) == 1)
  {
    uint64_t v37 = sub_21CB88070();
    os_log_type_t v38 = sub_21CB88860();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_21CA00000, v37, v38, "Action is restricted. Returning with error", v39, 2u);
      MEMORY[0x21D4B6B70](v39, -1, -1);
    }

    LOBYTE(v86) = 0;
    sub_21CB66948();
    uint64_t v41 = (void *)swift_allocError();
    uint64_t v42 = 5;
LABEL_17:
    *(void *)uint64_t v40 = v42;
    *(_WORD *)(v40 + 8) = 256;
    sub_21CB0FD34((char *)&v86, v41, v83, v84, v85, a6);

    return swift_release();
  }
  uint64_t v43 = (void *)(a1 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend);
  if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend + *(int *)(v81 + 36)) & 2) != 0
    || (v44 = v43[4], uint64_t v45 = (unsigned char *)sub_21CA44BD4(v44), !v46))
  {
    BOOL v57 = sub_21CB88070();
    os_log_type_t v58 = sub_21CB88880();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_21CA00000, v57, v58, "%%@: Cannot ask to follow when the friend is already sharing location.", v59, 2u);
      MEMORY[0x21D4B6B70](v59, -1, -1);
    }

    LOBYTE(v86) = 0;
    sub_21CB66948();
    uint64_t v41 = (void *)swift_allocError();
    uint64_t v42 = 1;
    goto LABEL_17;
  }
  uint64_t v83 = v45;
  uint64_t v84 = v44;
  uint64_t v85 = v46;
  uint64_t v47 = v78;
  sub_21CA2E134((uint64_t)v43, v78, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v77 + 56))(v47, 0, 1, v81);
  uint64_t v48 = type metadata accessor for FMFIntermediateFriend();
  uint64_t v49 = (uint64_t)v79;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v79, 1, 1, v48);
  uint64_t v92 = 4;
  char v93 = 0;
  uint64_t v90 = 0;
  char v91 = 1;
  uint64_t v50 = type metadata accessor for FMFLocation();
  uint64_t v51 = (uint64_t)v80;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v80, 1, 1, v50);
  uint64_t v89 = 0;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  sub_21CA5572C(v47, v49, (unint64_t *)&v92, (uint64_t)&v90, v51, 0, 1, (uint64_t *)&v86, v22, 0, 0, 2u, 2u, 2);
  LOBYTE(v86) = 4;
  sub_21CB26744((uint64_t)v22, &v86);
  uint64_t v52 = sub_21CB87190();
  *((void *)&v87 + 1) = v52;
  *(void *)&long long v88 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v53 = sub_21CA6D80C((uint64_t *)&v86);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v52 - 8) + 104))(v53, *MEMORY[0x263F3CA30], v52);
  LOBYTE(v52) = MEMORY[0x21D4B4280](&v86);
  sub_21CA2B0D0((uint64_t)&v86);
  if (v52)
  {
    uint64_t v54 = sub_21CB88640();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v14, 1, 1, v54);
    uint64_t v55 = (void *)swift_allocObject();
    void v55[2] = 0;
    v55[3] = 0;
    uint64_t v56 = v85;
    v55[4] = v83;
    v55[5] = v56;
    v55[6] = a2;
    v55[7] = a1;
    v55[8] = sub_21CB713F0;
    v55[9] = v23;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21CB09F98((uint64_t)v14, (uint64_t)&unk_267C97998, (uint64_t)v55);
    swift_release();
    sub_21CB66EB0((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_21CA57E34((uint64_t *)&unk_267C96F20);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_21CB8B220;
    uint64_t v62 = v43[1];
    *(void *)(v61 + 32) = *v43;
    *(void *)(v61 + 40) = v62;
    swift_bridgeObjectRetain();
    uint64_t v63 = swift_bridgeObjectRetain();
    uint64_t v64 = sub_21CA4D61C(v63);
    swift_bridgeObjectRelease();
    type metadata accessor for FMFAskToFollowRequest();
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + qword_267CA5310) = v61;
    *(void *)(v65 + qword_267CA5318) = v64;
    uint64_t v66 = sub_21CA36A84();
    uint64_t v67 = a2[11];
    unint64_t v68 = a2[12];
    uint64_t v85 = (uint64_t (*)(uint64_t *, void *))sub_21CA2B2CC(a2 + 8, v67);
    uint64_t v69 = a2;
    uint64_t v70 = (void *)swift_allocObject();
    v70[2] = v69;
    v70[3] = a1;
    v70[4] = sub_21CB713F0;
    v70[5] = v23;
    uint64_t v71 = *(void (**)(void *, uint64_t (*)(uint64_t, void *), void *, uint64_t, uint64_t, unint64_t))(v68 + 64);
    uint64_t refreshed = type metadata accessor for FMFInitRefreshClientResponse();
    uint64_t v76 = v22;
    uint64_t v73 = refreshed;
    swift_retain();
    swift_retain();
    swift_retain();
    v71(v66, sub_21CB70AB8, v70, v73, v67, v68);
    swift_release();
    swift_release();
    sub_21CB66EB0((uint64_t)v76, (uint64_t (*)(void))type metadata accessor for FMFFriend);
  }
  return swift_release();
}

uint64_t sub_21CB6D7B8(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v46 = a1;
  uint64_t v11 = type metadata accessor for FMFLocationAlert();
  uint64_t v45 = *(uint8_t **)(v11 - 8);
  uint64_t v12 = *((void *)v45 + 8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  uint64_t v17 = sub_21CB87190();
  v48[3] = v17;
  v48[4] = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v18 = sub_21CA6D80C(v48);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v18, *MEMORY[0x263F3CA28], v17);
  swift_retain();
  swift_retain();
  swift_retain();
  LOBYTE(v17) = MEMORY[0x21D4B4280](v48);
  sub_21CA2B0D0((uint64_t)v48);
  if (v17)
  {
    if (qword_267C949C0 != -1) {
      swift_once();
    }
    if (byte_267C975B8)
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_21CB880A0();
      sub_21CA4CC18(v19, (uint64_t)qword_267CA5368);
      swift_retain_n();
      uint64_t v20 = sub_21CB88070();
      os_log_type_t v21 = sub_21CB88880();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v46 = v23;
        uint64_t v45 = v22;
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v44 = v22 + 4;
        uint64_t v47 = *a2;
        v48[0] = v23;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v24 = sub_21CB88310();
        uint64_t v47 = sub_21CA4E450(v24, v25, v48);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v26 = v45;
        _os_log_impl(&dword_21CA00000, v20, v21, "%s: Dismissing FMFLocationAlert update due to demo mode.", v45, 0xCu);
        uint64_t v27 = v46;
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v27, -1, -1);
        MEMORY[0x21D4B6B70](v26, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      LOBYTE(v48[0]) = 0;
      sub_21CB66948();
      uint64_t v36 = (void *)swift_allocError();
      *(void *)uint64_t v37 = 6;
      *(_WORD *)(v37 + 8) = 256;
      sub_21CB0FD34((char *)v48, v36, a3, a4, a5, a6);
    }
    else
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_21CB880A0();
      sub_21CA4CC18(v28, (uint64_t)qword_267CA5368);
      swift_retain_n();
      uint64_t v29 = sub_21CB88070();
      os_log_type_t v30 = sub_21CB88880();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        uint64_t v44 = (uint8_t *)v32;
        *(_DWORD *)uint64_t v31 = 136315138;
        uint64_t v43 = v31 + 4;
        uint64_t v47 = *a2;
        v48[0] = v32;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v33 = sub_21CB88310();
        uint64_t v47 = sub_21CA4E450(v33, v34, v48);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CA00000, v29, v30, "%s: updating location alert action initiated", v31, 0xCu);
        uint64_t v35 = v44;
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v35, -1, -1);
        MEMORY[0x21D4B6B70](v31, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      uint64_t v38 = sub_21CB88640();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v15, 1, 1, v38);
      sub_21CA2E134(v46, (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for FMFLocationAlert);
      unint64_t v39 = (v45[80] + 40) & ~(unint64_t)v45[80];
      uint64_t v40 = (void *)swift_allocObject();
      v40[2] = 0;
      v40[3] = 0;
      v40[4] = a2;
      sub_21CB71074((uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v40 + v39, (uint64_t (*)(void))type metadata accessor for FMFLocationAlert);
      uint64_t v41 = (void *)((char *)v40 + ((v12 + v39 + 7) & 0xFFFFFFFFFFFFFFF8));
      *uint64_t v41 = sub_21CB713F0;
      v41[1] = v16;
      swift_retain();
      swift_retain();
      sub_21CB09F98((uint64_t)v15, (uint64_t)&unk_267C979A8, (uint64_t)v40);
      swift_release();
    }
  }
  return swift_release();
}

void sub_21CB6DE90(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a6;
  uint64_t v13 = sub_21CB87190();
  uint64_t v36 = (void *)v13;
  uint64_t v37 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v14 = sub_21CA6D80C(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v14, *MEMORY[0x263F3CA28], v13);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  LOBYTE(v13) = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v13)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21CB6D7B8(a1, a2, a3, a4, a5, a6);
    swift_release();
    swift_release_n();
    swift_release_n();
    swift_release_n();
  }
  else
  {
    if (qword_267C949C0 != -1) {
      swift_once();
    }
    if (byte_267C975B8)
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_21CB880A0();
      sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
      swift_retain_n();
      uint64_t v16 = sub_21CB88070();
      os_log_type_t v17 = sub_21CB88880();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 136315138;
        aBlock[0] = v34;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v19 = sub_21CB88310();
        sub_21CA4E450(v19, v20, aBlock);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CA00000, v16, v17, "%s: Dismissing FMFLocationAlert update due to demo mode.", v18, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v34, -1, -1);
        MEMORY[0x21D4B6B70](v18, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      LOBYTE(aBlock[0]) = 0;
      sub_21CB66948();
      uint64_t v27 = (void *)swift_allocError();
      *(void *)uint64_t v28 = 6;
      *(_WORD *)(v28 + 8) = 256;
      sub_21CB0FD34((char *)aBlock, v27, a3, a4, a5, a6);

      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_21CB880A0();
      sub_21CA4CC18(v21, (uint64_t)qword_267CA5368);
      swift_retain_n();
      uint64_t v22 = sub_21CB88070();
      os_log_type_t v23 = sub_21CB88880();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        buf = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136315138;
        aBlock[0] = (uint64_t)buf;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v25 = sub_21CB88310();
        sub_21CA4E450(v25, v26, aBlock);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CA00000, v22, v23, "%s: updating location alert action initiated", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](buf, -1, -1);
        MEMORY[0x21D4B6B70](v24, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA80]), sel_init);
      id v30 = FMFLocationAlert.fence.getter();
      uint64_t v31 = (void *)swift_allocObject();
      uint64_t v31[2] = a2;
      v31[3] = sub_21CB713F0;
      v31[4] = v12;
      uint64_t v37 = (uint64_t)sub_21CB70C5C;
      uint64_t v38 = v31;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      uint64_t aBlock[2] = (uint64_t)sub_21CB5C494;
      uint64_t v36 = &unk_26CD71470;
      uint64_t v32 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_addFence_completion_, v30, v32);
      _Block_release(v32);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_21CB6E554(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6, const char *a7, void *a8)
{
  uint64_t v16 = qword_267C94990;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_21CB880A0();
  sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
  swift_retain_n();
  uint64_t v18 = sub_21CB88070();
  os_log_type_t v19 = sub_21CB88880();
  if (os_log_type_enabled(v18, v19))
  {
    id v29 = a5;
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = a1;
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v30 = v21;
    sub_21CA57E34(&qword_267C978A0);
    uint64_t v22 = sub_21CB88310();
    sub_21CA4E450(v22, v23, &v30);
    sub_21CB889C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CA00000, v18, v19, a7, v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    a1 = v28;
    MEMORY[0x21D4B6B70](v24, -1, -1);
    uint64_t v25 = v20;
    a5 = v29;
    MEMORY[0x21D4B6B70](v25, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v26 = a1 + *a8;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21CB6DE90(v26, a2, a3, a4, a5, a6);
  swift_release_n();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_21CB6E7E8(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34(&qword_267C95028);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = a6;
  uint64_t v16 = sub_21CB87190();
  v38[3] = v16;
  v38[4] = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v17 = sub_21CA6D80C(v38);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, *MEMORY[0x263F3CA28], v16);
  swift_retain();
  swift_retain();
  swift_retain();
  LOBYTE(v16) = MEMORY[0x21D4B4280](v38);
  sub_21CA2B0D0((uint64_t)v38);
  if (v16)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = *(void *)(a1 + 24);
      uint64_t v20 = sub_21CB88640();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 1, 1, v20);
      uint64_t v21 = (void *)swift_allocObject();
      v21[2] = 0;
      v21[3] = 0;
      v21[4] = a2;
      v21[5] = v19;
      v21[6] = v18;
      v21[7] = sub_21CB713F0;
      v21[8] = v15;
      v21[9] = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21CB09F98((uint64_t)v14, (uint64_t)&unk_267C979B8, (uint64_t)v21);
      swift_release();
    }
    else
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_21CB880A0();
      sub_21CA4CC18(v22, (uint64_t)qword_267CA5368);
      swift_retain_n();
      unint64_t v23 = sub_21CB88070();
      os_log_type_t v24 = sub_21CB88880();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v36 = v26;
        uint64_t v35 = v25;
        *(_DWORD *)uint64_t v25 = 136315138;
        v34[1] = v25 + 4;
        uint64_t v37 = *a2;
        v38[0] = v26;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v27 = sub_21CB88310();
        uint64_t v37 = sub_21CA4E450(v27, v28, v38);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        id v29 = v35;
        _os_log_impl(&dword_21CA00000, v23, v24, "%s: Error when muting fences- no friend handle", v35, 0xCu);
        uint64_t v30 = v36;
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v30, -1, -1);
        MEMORY[0x21D4B6B70](v29, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      LOBYTE(v38[0]) = 0;
      sub_21CB66948();
      uint64_t v31 = (void *)swift_allocError();
      *(void *)uint64_t v32 = 2;
      *(_WORD *)(v32 + 8) = 256;
      sub_21CB0FD34((char *)v38, v31, a3, a4, a5, a6);
    }
  }
  return swift_release();
}

void sub_21CB6EC48(uint64_t a1, uint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), uint64_t a6)
{
  uint64_t v12 = sub_21CA57E34((uint64_t *)&unk_267C951B0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&aBlock[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = a6;
  uint64_t v16 = sub_21CB87190();
  uint64_t v35 = (void *)v16;
  uint64_t v36 = sub_21CB66900((unint64_t *)&qword_267C94E20, MEMORY[0x263F3CA38]);
  uint64_t v17 = sub_21CA6D80C(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, *MEMORY[0x263F3CA28], v16);
  swift_retain();
  swift_retain();
  swift_retain();
  LOBYTE(v16) = MEMORY[0x21D4B4280](aBlock);
  sub_21CA2B0D0((uint64_t)aBlock);
  if (v16)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21CB6E7E8(a1, a2, a3, a4, a5, a6);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = (void *)sub_21CB882C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v19 = objc_msgSend(self, sel_handleWithId_, v18);

    if (v19)
    {
      id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA80]), sel_init);
      sub_21CA24E80(a1 + OBJC_IVAR____TtC7FMFCore19FMFMuteFencesAction_muteEndDate, (uint64_t)v14, (uint64_t *)&unk_267C951B0);
      uint64_t v21 = sub_21CB87590();
      uint64_t v22 = *(void *)(v21 - 8);
      unint64_t v23 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v14, 1, v21) != 1)
      {
        unint64_t v23 = (void *)sub_21CB87510();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v21);
      }
      os_log_type_t v24 = (void *)swift_allocObject();
      _OWORD v24[2] = a2;
      v24[3] = sub_21CB713F0;
      v24[4] = v15;
      uint64_t v36 = (uint64_t)sub_21CB71234;
      uint64_t v37 = v24;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      uint64_t aBlock[2] = (uint64_t)sub_21CB4F760;
      uint64_t v35 = &unk_26CD71538;
      uint64_t v25 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v20, sel_muteFencesForHandle_untilDate_completion_, v19, v23, v25);
      _Block_release(v25);
      swift_release();
    }
    else
    {
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_21CB880A0();
      sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
      swift_retain_n();
      uint64_t v27 = sub_21CB88070();
      os_log_type_t v28 = sub_21CB88880();
      if (os_log_type_enabled(v27, v28))
      {
        id v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        aBlock[0] = v30;
        *(_DWORD *)id v29 = 136315138;
        uint64_t v38 = *a2;
        sub_21CA57E34(&qword_267C978A0);
        uint64_t v31 = sub_21CB88310();
        uint64_t v38 = sub_21CA4E450(v31, v32, aBlock);
        sub_21CB889C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CA00000, v27, v28, "%s: Error when muting fences- no friend handle", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v30, -1, -1);
        MEMORY[0x21D4B6B70](v29, -1, -1);
        swift_release();
      }
      else
      {
        swift_release();

        swift_release_n();
      }
    }
  }
}

uint64_t sub_21CB6F1D8(uint64_t a1, unint64_t *a2, unsigned char *a3, uint64_t a4, uint64_t (*a5)(uint64_t *, void *), NSObject *a6)
{
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  type metadata accessor for FMFUpdateStewieLocationAction();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v12 = swift_dynamicCastClass();
  if (v12)
  {
    uint64_t v13 = v12;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6026C(v13, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
LABEL_34:
    swift_release();
    swift_release();
    swift_release_n();
    swift_release();
    goto LABEL_35;
  }
  type metadata accessor for FMFShareLocationAction();
  uint64_t v14 = swift_dynamicCastClass();
  if (v14)
  {
    uint64_t v15 = (uint64_t *)v14;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB4FC18(v15, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFRemoveFriendAction();
  uint64_t v16 = swift_dynamicCastClass();
  if (v16)
  {
    uint64_t v17 = v16;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB676A8(v17, a2, a3, a4, a5, a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFShowHideLocationAction();
  uint64_t v18 = swift_dynamicCastClass();
  if (v18)
  {
    uint64_t v19 = v18;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB68304(v19, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFStopFollowingAction();
  uint64_t v20 = swift_dynamicCastClass();
  if (v20)
  {
    uint64_t v21 = v20;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB68BA0(v21, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFStopSharingAction();
  uint64_t v22 = swift_dynamicCastClass();
  if (v22)
  {
    uint64_t v23 = v22;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB692E8(v23, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFRespondToInviteAction();
  uint64_t v24 = swift_dynamicCastClass();
  if (v24)
  {
    uint64_t v25 = v24;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB69B1C(v25, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFSetFavoriteAction();
  uint64_t v26 = swift_dynamicCastClass();
  if (v26)
  {
    uint64_t v27 = (void **)v26;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6ACA4(v27, (void **)a2, a3, a4, a5, (unint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdatePrefsAction();
  uint64_t v28 = swift_dynamicCastClass();
  if (v28)
  {
    uint64_t v29 = v28;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6B708(v29, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdateMeDeviceAction();
  uint64_t v30 = swift_dynamicCastClass();
  if (v30)
  {
    uint64_t v31 = v30;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6BF4C(v31, (uint64_t *)a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFNotNowAction();
  uint64_t v32 = swift_dynamicCastClass();
  if (v32)
  {
    uint64_t v33 = v32;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6C780(v33, (uint64_t *)a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFAddUpdateLabelAction();
  uint64_t v34 = swift_dynamicCastClass();
  if (v34)
  {
    uint64_t v35 = v34;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB5917C(v35, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFRemoveLabelsAction();
  uint64_t v36 = swift_dynamicCastClass();
  if (v36)
  {
    uint64_t v37 = v36;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB59FC0(v37, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFAskToFollowAction();
  uint64_t v38 = swift_dynamicCastClass();
  if (v38)
  {
    uint64_t v39 = v38;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6CD8C(v39, a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  type metadata accessor for FMFAddLocationAlertAction();
  uint64_t v40 = swift_dynamicCastClass();
  if (v40)
  {
    uint64_t v41 = v40;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    uint64_t v42 = "%s: adding location alert action initiated";
    uint64_t v43 = &OBJC_IVAR____TtC7FMFCore25FMFAddLocationAlertAction_locationAlert;
LABEL_33:
    sub_21CB6E554(v41, (uint64_t *)a2, a3, a4, a5, (uint64_t)a6, v42, v43);
    goto LABEL_34;
  }
  type metadata accessor for FMFUpdateLocationAlertAction();
  uint64_t v44 = swift_dynamicCastClass();
  if (v44)
  {
    uint64_t v41 = v44;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    uint64_t v42 = "%s: updating location alert action initiated";
    uint64_t v43 = &OBJC_IVAR____TtC7FMFCore28FMFUpdateLocationAlertAction_locationAlert;
    goto LABEL_33;
  }
  type metadata accessor for FMFRemoveLocationAlertAction();
  uint64_t v46 = swift_dynamicCastClass();
  if (v46)
  {
    uint64_t v47 = v46;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB5A70C(v47, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFGetURLInfoAction();
  uint64_t v48 = swift_dynamicCastClass();
  if (v48)
  {
    uint64_t v49 = v48;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB5EED4(v49, (uint64_t)sub_21CB6FBA0, (uint64_t)v11);
    goto LABEL_34;
  }
  type metadata accessor for FMFMuteFencesAction();
  uint64_t v50 = swift_dynamicCastClass();
  if (v50)
  {
    uint64_t v51 = v50;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_21CB6EC48(v51, (uint64_t *)a2, a3, a4, a5, (uint64_t)a6);
    goto LABEL_34;
  }
  uint64_t v52 = qword_267C94990;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  if (v52 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_21CB880A0();
  sub_21CA4CC18(v53, (uint64_t)qword_267CA5368);
  uint64_t v54 = sub_21CB88070();
  os_log_type_t v55 = sub_21CB88880();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl(&dword_21CA00000, v54, v55, "FMFActionsController: cannot map action to request", v56, 2u);
    MEMORY[0x21D4B6B70](v56, -1, -1);
  }

  char v59 = 0;
  sub_21CB66948();
  BOOL v57 = (void *)swift_allocError();
  *(void *)uint64_t v58 = 0;
  *(_WORD *)(v58 + 8) = 256;
  sub_21CB0FD34(&v59, v57, a3, a4, a5, (uint64_t)a6);

  swift_release();
  swift_release();
  swift_release_n();
LABEL_35:
  swift_release();
  swift_release_n();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_21CB6FBA0(char *a1, void *a2)
{
  return sub_21CB0FD34(a1, a2, *(unsigned char **)(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_21CB6FBB0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21CB6FBE8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_21CB6FC50()
{
  sub_21CB54ABC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t *, id))(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

void sub_21CB6FC70(uint64_t a1, void *a2)
{
  sub_21CB54A50(a1, a2, *(void *)(v2 + 16), *(NSObject **)(v2 + 24));
}

uint64_t sub_21CB6FC90()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21CB6FCC8()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_21CB6FCD4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21CA65B10;
  return sub_21CB52CAC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21CB6FDB4()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB6FDCC(uint64_t a1, void *a2)
{
  return sub_21CB57E14(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24));
}

uint64_t sub_21CB6FDE0(uint64_t a1, void *a2)
{
  return sub_21CB579B0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(void *)(v2 + 40), &OBJC_IVAR____TtC7FMFCore22FMFStopFollowingAction_friend, "%s: Successfully stopped following a friend.", "%s: Error removing friend sharing location with me. Error - %s");
}

uint64_t sub_21CB6FE2C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_21CB6FE88()
{
  uint64_t v1 = (int *)type metadata accessor for FMFFriend();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_21CB87590();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v5 + v1[19] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = v5 + v1[20];
  uint64_t v10 = type metadata accessor for FMFLocation();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v9 + *(int *)(v10 + 32);
    uint64_t v12 = sub_21CB875D0();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    uint64_t v14 = v9 + *(int *)(v10 + 44);
    uint64_t v15 = *(void **)(v14 + 304);
    if (v15)
    {
      if (*(void *)(v14 + 168))
      {
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
        uint64_t v15 = *(void **)(v14 + 304);
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_21CB701E0(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for FMFFriend() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, void *))(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_21CB562E4(a1, a2, v7, (uint64_t *)(v2 + v6), v8);
}

uint64_t sub_21CB70294()
{
  uint64_t v1 = (int *)type metadata accessor for FMFFriend();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_21CB87590();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v5 + v1[19] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = v5 + v1[20];
  uint64_t v10 = type metadata accessor for FMFLocation();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v9 + *(int *)(v10 + 32);
    uint64_t v12 = sub_21CB875D0();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    uint64_t v14 = v9 + *(int *)(v10 + 44);
    uint64_t v15 = *(void **)(v14 + 304);
    if (v15)
    {
      if (*(void *)(v14 + 168))
      {
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
        uint64_t v15 = *(void **)(v14 + 304);
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_21CB70604(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for FMFFriend() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v11 = (uint64_t)v1 + v5;
  uint64_t v12 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_21CA65B10;
  return sub_21CB55608(a1, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_21CB7075C()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB70774(uint64_t a1, void *a2)
{
  return sub_21CB58D1C(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24), *(void *)(v2 + 32), "%s: Saved favorites.", "%s: Error saving favorites - %s");
}

uint64_t sub_21CB707A8()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB707C0(uint64_t a1, void *a2)
{
  return sub_21CB58D1C(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24), *(void *)(v2 + 32), "%s: Updated prefs.", "%s: error when updating prefs: %s");
}

uint64_t sub_21CB707F4()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB7080C(uint64_t a1, void *a2)
{
  return sub_21CB588AC(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(_OWORD *, void *))(v2 + 24));
}

uint64_t sub_21CB7081C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21CB7086C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_21CA65B10;
  return sub_21CB581BC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_21CB70944()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB7095C(uint64_t a1, void *a2)
{
  return sub_21CB5C040(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24), *(void *)(v2 + 32), "%s: not now request completed successfully.", MEMORY[0x263F90290], "%s: error sending not now: %s");
}

uint64_t sub_21CB709A0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21CB709E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_21CA65B10;
  return sub_21CB56748(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21CB70AB8(uint64_t a1, void *a2)
{
  return sub_21CB579B0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t *, void *))(v2 + 32), *(void *)(v2 + 40), &OBJC_IVAR____TtC7FMFCore20FMFAskToFollowAction_friend, "%s: ask to follow request completed successfully.", "%s: error sending ask to follow: %s");
}

uint64_t sub_21CB70AFC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_21CB70B54(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21CA65B10;
  return sub_21CB57020(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21CB70C44()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB70C5C(uint64_t a1, void *a2)
{
  return sub_21CB5C040(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t *, void *))(v2 + 24), *(void *)(v2 + 32), "%s: Location alert updated.", MEMORY[0x263F90280], "%s: error when updating location alert: %s");
}

uint64_t sub_21CB70CA4()
{
  uint64_t v1 = (int *)type metadata accessor for FMFLocationAlert();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v16 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v4 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[12];
  uint64_t v6 = type metadata accessor for FMFSchedule();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = v5 + *(int *)(v6 + 40);
    uint64_t v8 = sub_21CB876F0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + v1[23] + 168))
  {
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
  }
  uint64_t v10 = v4 + v1[26];
  uint64_t v11 = sub_21CB87590();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  uint64_t v14 = v4 + v1[27];
  if (!v13(v14, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v16 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_21CB71074(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21CB710DC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for FMFLocationAlert() - 8);
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
  v13[1] = sub_21CA65B10;
  return sub_21CB5C498(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_21CB7121C()
{
  return sub_21CA0DCB8(MEMORY[0x263F8EED8]);
}

uint64_t sub_21CB71234(uint64_t a1)
{
  return sub_21CB5CFEC(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t *, uint64_t))(v1 + 24));
}

uint64_t sub_21CB71244()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21CB7128C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_21CB712E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21CA65B10;
  return sub_21CB5D3A8(a1, v4, v5, v6, v7, v8, v9, v10);
}

BOOL static FMImageCacheError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FMImageCacheError.hash(into:)()
{
  return sub_21CB89060();
}

uint64_t FMImageCacheError.hashValue.getter()
{
  return sub_21CB89090();
}

unint64_t sub_21CB714A8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21CB714C4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB7150C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FMImageCache.__allocating_init(converter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  FMImageCache.init(converter:)(a1, a2);
  return v4;
}

uint64_t sub_21CB715A4()
{
  return sub_21CB88910();
}

uint64_t sub_21CB71628@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v113 = a5;
  uint64_t v107 = a4;
  uint64_t v111 = (void (*)(char *))a3;
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*a1 + 96);
  sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
  uint64_t v9 = sub_21CB890A0();
  uint64_t v103 = *(void *)(v9 - 8);
  uint64_t v104 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v102 = (char *)&v93 - v10;
  uint64_t v11 = *(void *)(v7 + 80);
  uint64_t v110 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v95 = (char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v99 = (char *)&v93 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v96 = (char *)&v93 - v17;
  MEMORY[0x270FA5388](v18);
  unint64_t v105 = (char *)&v93 - v19;
  uint64_t v109 = (void (*)(uint64_t, uint8_t *, uint64_t))sub_21CB889A0();
  uint64_t v114 = *((void *)v109 - 1);
  MEMORY[0x270FA5388](v109);
  uint64_t v98 = (char *)&v93 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v112 = (char *)&v93 - v22;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v93 - v24;
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v106 = (uint8_t *)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v93 - v30;
  uint64_t v97 = a1 + 6;
  swift_beginAccess();
  uint64_t v32 = a1[6];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v33 = *(char **)(AssociatedConformanceWitness + 16);
  swift_bridgeObjectRetain();
  uint64_t v115 = v11;
  MEMORY[0x21D4B5340](a2, v32, v11, v8, v33);
  swift_bridgeObjectRelease();
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
  if (v34((uint64_t)v25, 1, v8) == 1)
  {
    unint64_t v105 = v33;
    uint64_t v108 = v26;
    uint64_t v35 = *(void (**)(char *, void (*)(uint64_t, uint8_t *, uint64_t)))(v114 + 8);
    v114 += 8;
    v35(v25, v109);
    uint64_t v36 = (uint64_t)v112;
    sub_21CB76558((uint64_t)v112);
    int v37 = v34(v36, 1, v8);
    uint64_t v38 = v8;
    uint64_t v100 = (uint8_t *)a2;
    if (v37 == 1)
    {
      v35(v112, v109);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v39 = v115;
      char v40 = sub_21CB88790();
      swift_bridgeObjectRelease();
      uint64_t v41 = v108;
      if ((v40 & 1) == 0)
      {
        if (qword_267C94990 != -1) {
          swift_once();
        }
        uint64_t v42 = sub_21CB880A0();
        sub_21CA4CC18(v42, (uint64_t)qword_267CA5368);
        uint64_t v43 = v110;
        uint64_t v44 = v95;
        (*(void (**)(char *, uint8_t *, uint64_t))(v110 + 16))(v95, v100, v39);
        uint64_t v45 = sub_21CB88070();
        os_log_type_t v46 = sub_21CB88880();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc();
          uint64_t v114 = swift_slowAlloc();
          uint64_t v118 = v114;
          *(_DWORD *)uint64_t v47 = 136315138;
          uint64_t v48 = sub_21CB88F70();
          uint64_t v116 = sub_21CA4E450(v48, v49, &v118);
          uint64_t v41 = v108;
          sub_21CB889C0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v95, v115);
          _os_log_impl(&dword_21CA00000, v45, v46, "FMImageCache: Cached data for request: %s not found, regenerating.", v47, 0xCu);
          uint64_t v50 = v114;
          swift_arrayDestroy();
          MEMORY[0x21D4B6B70](v50, -1, -1);
          MEMORY[0x21D4B6B70](v47, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v39);
        }

        sub_21CB72C00((uint64_t)v100, (uint64_t)v111, v107);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v113, 1, 1, v38);
    }
    else
    {
      uint64_t v67 = v108;
      unint64_t v68 = *(void (**)(uint64_t, uint8_t *, uint64_t))(v108 + 32);
      uint64_t v69 = (uint64_t)v112;
      uint64_t v114 = v8;
      uint64_t v112 = (char *)(v108 + 32);
      uint64_t v109 = v68;
      v68((uint64_t)v106, (uint8_t *)v69, v8);
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v70 = sub_21CB880A0();
      sub_21CA4CC18(v70, (uint64_t)qword_267CA5368);
      uint64_t v71 = v110;
      uint64_t v72 = v96;
      uint64_t v73 = v115;
      uint64_t v95 = *(char **)(v110 + 16);
      ((void (*)(char *, uint8_t *, uint64_t))v95)(v96, v100, v115);
      uint64_t v74 = sub_21CB88070();
      os_log_type_t v75 = sub_21CB88840();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = (uint8_t *)swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        v117[0] = v94;
        *(_DWORD *)uint64_t v76 = 136315138;
        uint64_t v77 = sub_21CB88F70();
        uint64_t v118 = sub_21CA4E450(v77, v78, v117);
        uint64_t v73 = v115;
        uint64_t v67 = v108;
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
        _os_log_impl(&dword_21CA00000, v74, v75, "FMImageCache: Found cached data for request: %s in disk cache.", v76, 0xCu);
        uint64_t v79 = v94;
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v79, -1, -1);
        MEMORY[0x21D4B6B70](v76, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
      }

      uint64_t v85 = v106;
      ((void (*)(char *, uint8_t *, uint64_t))v95)(v99, v100, v73);
      long long v86 = *(void (**)(char *, uint8_t *, uint64_t))(v67 + 16);
      long long v87 = v98;
      uint64_t v88 = v114;
      v86(v98, v85, v114);
      uint64_t v110 = *(void *)(v67 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t))v110)(v87, 0, 1, v88);
      swift_beginAccess();
      sub_21CB88230();
      sub_21CB88250();
      swift_endAccess();
      uint64_t v89 = v111;
      if (v111)
      {
        uint64_t v90 = v102;
        v86(v102, v85, v88);
        uint64_t v91 = v104;
        swift_storeEnumTagMultiPayload();
        v89(v90);
        (*(void (**)(char *, uint64_t))(v103 + 8))(v90, v91);
      }
      uint64_t v92 = v113;
      v109(v113, v85, v88);
      return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v110)(v92, 0, 1, v88);
    }
  }
  else
  {
    uint64_t v51 = *(void (**)(uint64_t, uint8_t *, uint64_t))(v26 + 32);
    uint64_t v112 = (char *)(v26 + 32);
    uint64_t v109 = v51;
    v51((uint64_t)v31, (uint8_t *)v25, v8);
    uint64_t v52 = v8;
    uint64_t v53 = v31;
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_21CB880A0();
    sub_21CA4CC18(v54, (uint64_t)qword_267CA5368);
    uint64_t v55 = v110;
    uint64_t v56 = v105;
    uint64_t v57 = v115;
    (*(void (**)(char *, uint64_t, uint64_t))(v110 + 16))(v105, a2, v115);
    uint64_t v58 = sub_21CB88070();
    os_log_type_t v59 = sub_21CB88840();
    if (os_log_type_enabled(v58, v59))
    {
      unint64_t v60 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v114 = v52;
      uint64_t v62 = v61;
      v117[0] = v61;
      uint64_t v108 = v26;
      uint64_t v106 = v60;
      *(_DWORD *)unint64_t v60 = 136315138;
      uint64_t v100 = v60 + 4;
      uint64_t v63 = sub_21CB88F70();
      uint64_t v118 = sub_21CA4E450(v63, v64, v117);
      uint64_t v26 = v108;
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
      uint64_t v65 = v106;
      _os_log_impl(&dword_21CA00000, v58, v59, "FMImageCache: Found cached data for request: %s in memory cache.", v106, 0xCu);
      swift_arrayDestroy();
      uint64_t v66 = v62;
      uint64_t v52 = v114;
      MEMORY[0x21D4B6B70](v66, -1, -1);
      MEMORY[0x21D4B6B70](v65, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
    }

    uint64_t v80 = v111;
    if (v111)
    {
      uint64_t v81 = v102;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v102, v53, v52);
      uint64_t v82 = v104;
      swift_storeEnumTagMultiPayload();
      v80(v81);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v81, v82);
    }
    uint64_t v83 = v113;
    v109(v113, (uint8_t *)v53, v52);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v83, 0, 1, v52);
  }
}

uint64_t sub_21CB72338()
{
  uint64_t v1 = v0;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  uint64_t v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21CA00000, v3, v4, "FMImageCache: Purging cache...", v5, 2u);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }

  uint64_t v6 = *(NSObject **)(v1 + 24);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_21CB76BF8;
  *(void *)(v7 + 24) = v1;
  v10[4] = sub_21CA18880;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  void v10[2] = sub_21CA18830;
  v10[3] = &unk_26CD715D8;
  uint64_t v8 = _Block_copy(v10);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v8);
  _Block_release(v8);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

void sub_21CB72524(void *a1)
{
  v54[7] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_21CA57E34(&qword_267C95190);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v52 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21CB87480();
  uint64_t v5 = *(void **)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v44 - v9;
  swift_getAssociatedConformanceWitness();
  uint64_t v11 = sub_21CB881D0();
  swift_beginAccess();
  a1[4] = v11;
  swift_bridgeObjectRelease();
  swift_getTupleTypeMetadata2();
  sub_21CB88570();
  uint64_t v12 = sub_21CB88220();
  swift_beginAccess();
  a1[6] = v12;
  swift_bridgeObjectRelease();
  id v51 = self;
  id v13 = objc_msgSend(v51, sel_defaultManager);
  (*(void (**)(void))(*a1 + 160))();
  uint64_t v14 = (void *)sub_21CB87430();
  unint64_t v49 = (void (*)(char *, uint64_t))v5[1];
  uint64_t v50 = v5 + 1;
  v49(v10, v4);
  v54[0] = 0;
  id v15 = objc_msgSend(v13, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v14, 0, 5, v54);

  id v16 = v54[0];
  if (!v15)
  {
    uint64_t v32 = v16;
    uint64_t v33 = (void *)sub_21CB87400();

    swift_willThrow();
LABEL_13:
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_21CB880A0();
    sub_21CA4CC18(v35, (uint64_t)qword_267CA5368);
    id v36 = v33;
    id v37 = v33;
    uint64_t v38 = sub_21CB88070();
    os_log_type_t v39 = sub_21CB88880();
    if (os_log_type_enabled(v38, v39))
    {
      char v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      v54[0] = v41;
      *(_DWORD *)char v40 = 136315138;
      swift_getErrorValue();
      uint64_t v42 = sub_21CB89000();
      uint64_t v53 = sub_21CA4E450(v42, v43, (uint64_t *)v54);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v38, v39, "FMImageCache: Error deleting file : %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v41, -1, -1);
      MEMORY[0x21D4B6B70](v40, -1, -1);
    }
    else
    {
    }
    return;
  }
  uint64_t v17 = sub_21CB88510();

  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v20 = (void (*)(char *, unint64_t, uint64_t))v5[2];
    uint64_t v19 = v5 + 2;
    uint64_t v47 = v20;
    unint64_t v21 = (*((unsigned __int8 *)v19 + 64) + 32) & ~(unint64_t)*((unsigned __int8 *)v19 + 64);
    v44[2] = v17;
    unint64_t v22 = v17 + v21;
    uint64_t v45 = v19[7];
    unint64_t v23 = (unint64_t)(v19 + 5);
    os_log_type_t v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 4);
    uint64_t v48 = v19;
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v19 + 2);
    v44[1] = v23 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v25 = v52;
    uint64_t v26 = v7;
    while (1)
    {
      v47(v25, v22, v4);
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v23;
      (*(void (**)(char *, void, uint64_t, uint64_t))v23)(v25, 0, 1, v4);
      if ((*v46)(v25, 1, v4) == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
      (*v24)(v26, v25, v4);
      id v28 = objc_msgSend(v51, sel_defaultManager);
      uint64_t v29 = (void *)sub_21CB87430();
      v54[0] = 0;
      unsigned int v30 = objc_msgSend(v28, sel_removeItemAtURL_error_, v29, v54);

      if (!v30) {
        break;
      }
      id v31 = v54[0];
      v49(v26, v4);
      v22 += v45;
      --v18;
      uint64_t v25 = v52;
      if (!v18) {
        goto LABEL_10;
      }
    }
    id v34 = v54[0];
    swift_bridgeObjectRelease();
    uint64_t v33 = (void *)sub_21CB87400();

    swift_willThrow();
    v49(v26, v4);
    goto LABEL_13;
  }
  uint64_t v27 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v5[7];
  uint64_t v25 = v52;
LABEL_10:
  v27(v25, 1, 1, v4);
  swift_bridgeObjectRelease();
}

uint64_t sub_21CB72C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v27 = *v3;
  uint64_t v6 = v27;
  uint64_t v31 = sub_21CB88100();
  uint64_t v34 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21CB88150();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v6 + 80);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v30 = v4[3];
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v26 - v16, a1, v13);
  unint64_t v18 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  *(_OWORD *)(v19 + 24) = *(_OWORD *)(v27 + 88);
  *(void *)(v19 + 40) = *(void *)(v6 + 104);
  *(void *)(v19 + 48) = v4;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v19 + v18, v17, v13);
  uint64_t v20 = (uint64_t *)(v19 + ((v15 + v18 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v22 = v28;
  uint64_t v21 = v29;
  *uint64_t v20 = v28;
  v20[1] = v21;
  aBlock[4] = sub_21CB77468;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  uint64_t aBlock[3] = &unk_26CD718B0;
  unint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  sub_21CAD160C(v22);
  sub_21CB88120();
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_21CA5DEF4((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v24 = v31;
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v12, v8, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v24);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v33);
  return swift_release();
}

void sub_21CB72FF8(uint64_t a1, uint8_t *a2, uint8_t *a3)
{
  uint64_t v79 = a3;
  long long v87 = a2;
  uint64_t v91 = a1;
  uint64_t v4 = (void *)*v3;
  uint64_t v5 = *(void *)(*v3 + 80);
  uint64_t v92 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  long long v86 = (char *)v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v78 = (char *)v75 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v90 = (char *)v75 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v77 = (char *)v75 - v13;
  uint64_t v85 = v14;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v75 - v15;
  uint64_t v17 = v4[12];
  uint64_t v18 = sub_21CB889A0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v75 - v20;
  swift_beginAccess();
  uint64_t v22 = v3[6];
  uint64_t v23 = v4[11];
  uint64_t v83 = v4[13];
  uint64_t v82 = v23;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v24 = *(void *)(AssociatedConformanceWitness + 16);
  swift_bridgeObjectRetain();
  uint64_t v25 = v91;
  MEMORY[0x21D4B5340](v91, v22, v5, v17, v24);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  uint64_t v84 = v17;
  LODWORD(v25) = v27(v21, 1, v17);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  uint64_t v28 = v92 + 16;
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v92 + 16);
  v29(v16, v26, v5);
  uint64_t v88 = v29;
  uint64_t v89 = v28;
  uint64_t v81 = v3;
  if (v25 == 1)
  {
    v75[1] = v3 + 4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v75[2] = v24;
    char v30 = sub_21CB88790();
    swift_bridgeObjectRelease();
    uint64_t v31 = (uint8_t *)(v92 + 8);
    uint64_t v32 = *(uint8_t **)(v92 + 8);
    ((void (*)(char *, uint64_t))v32)(v16, v5);
    if ((v30 & 1) == 0)
    {
LABEL_13:
      if (qword_267C94990 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_21CB880A0();
      sub_21CA4CC18(v55, (uint64_t)qword_267CA5368);
      uint64_t v56 = v77;
      v29(v77, v26, v5);
      uint64_t v57 = sub_21CB88070();
      os_log_type_t v58 = sub_21CB88880();
      BOOL v59 = os_log_type_enabled(v57, v58);
      uint64_t v76 = v32;
      v75[0] = v31;
      if (v59)
      {
        unint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        aBlock[0] = v61;
        *(_DWORD *)unint64_t v60 = 136315138;
        long long v87 = v60 + 4;
        uint64_t v62 = sub_21CB88F70();
        uint64_t v93 = sub_21CA4E450(v62, v63, aBlock);
        uint64_t v26 = v91;
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v32)(v56, v5);
        _os_log_impl(&dword_21CA00000, v57, v58, "FMImageCache: Attempting to load request: %s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v61, -1, -1);
        MEMORY[0x21D4B6B70](v60, -1, -1);
      }
      else
      {
        ((void (*)(char *, uint64_t))v32)(v56, v5);
      }

      unint64_t v64 = v88;
      v88(v90, v26, v5);
      uint64_t v65 = swift_allocObject();
      uint64_t v66 = v81;
      swift_weakInit();
      uint64_t v67 = v78;
      v64(v78, v26, v5);
      uint64_t v68 = v92;
      unint64_t v69 = (*(unsigned __int8 *)(v92 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
      uint64_t v70 = (char *)swift_allocObject();
      uint64_t v71 = v82;
      *((void *)v70 + 2) = v5;
      *((void *)v70 + 3) = v71;
      uint64_t v72 = v83;
      *((void *)v70 + 4) = v84;
      *((void *)v70 + 5) = v72;
      *((void *)v70 + 6) = v65;
      (*(void (**)(char *, char *, uint64_t))(v68 + 32))(&v70[v69], v67, v5);
      uint64_t v73 = v90;
      uint64_t v74 = (void *)(*(uint64_t (**)(char *, uint64_t (*)(void *, unint64_t, char), char *, uint64_t, uint64_t))(v72 + 24))(v90, sub_21CB770B0, v70, v71, v72);
      objc_msgSend((id)v66[2], sel_addOperation_, v74, v75[0]);
      v88(v67, v26, v5);
      swift_beginAccess();
      sub_21CB887A0();
      sub_21CB88760();
      ((void (*)(char *, uint64_t))v76)(v73, v5);
      swift_endAccess();

      return;
    }
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v33 = *(uint8_t **)(v92 + 8);
    ((void (*)(char *, uint64_t))v33)(v16, v5);
  }
  uint64_t v34 = v86;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_21CB880A0();
  sub_21CA4CC18(v35, (uint64_t)qword_267CA5368);
  v29(v34, v26, v5);
  id v36 = sub_21CB88070();
  os_log_type_t v37 = sub_21CB88880();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = v34;
    os_log_type_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v76 = v33;
    uint64_t v41 = v40;
    aBlock[0] = v40;
    *(_DWORD *)os_log_type_t v39 = 136315138;
    uint64_t v42 = sub_21CB88F70();
    uint64_t v93 = sub_21CA4E450(v42, v43, aBlock);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v76)(v38, v5);
    _os_log_impl(&dword_21CA00000, v36, v37, "FMImageCache: Loading declined, we are already processing similar location: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v41, -1, -1);
    MEMORY[0x21D4B6B70](v39, -1, -1);
  }
  else
  {
    ((void (*)(char *, uint64_t))v33)(v34, v5);
  }

  uint64_t v32 = v87;
  if (v87)
  {
    uint64_t v44 = v81;
    uint64_t v45 = v81[3];
    os_log_type_t v46 = v90;
    v88(v90, v26, v5);
    uint64_t v47 = v92;
    unint64_t v48 = (*(unsigned __int8 *)(v92 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
    unint64_t v49 = (v85 + v48 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v50 = (char *)swift_allocObject();
    uint64_t v51 = v82;
    *((void *)v50 + 2) = v5;
    *((void *)v50 + 3) = v51;
    uint64_t v52 = v83;
    *((void *)v50 + 4) = v84;
    *((void *)v50 + 5) = v52;
    *((void *)v50 + 6) = v44;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v50[v48], v46, v5);
    uint64_t v53 = (uint8_t **)&v50[v49];
    uint64_t v31 = v79;
    *uint64_t v53 = v32;
    v53[1] = v31;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_21CB76F34;
    *(void *)(v5 + 24) = v50;
    aBlock[4] = (uint64_t)sub_21CA6257C;
    uint64_t v95 = (void (*)(char *, uint64_t, uint64_t))v5;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_21CA18830;
    uint64_t aBlock[3] = (uint64_t)&unk_26CD71798;
    uint64_t v54 = _Block_copy(aBlock);
    uint64_t v29 = v95;
    sub_21CAD160C((uint64_t)v32);
    sub_21CAD160C((uint64_t)v32);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v45, v54);
    sub_21CAD2F4C((uint64_t)v32);
    _Block_release(v54);
    LOBYTE(v44) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (v44)
    {
      __break(1u);
      goto LABEL_13;
    }
  }
}

uint64_t sub_21CB73AC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v6 = (void *)*a1;
  uint64_t v7 = *(void *)(*a1 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v26 = (char *)&v21 - v10;
  uint64_t v24 = v9 + 40;
  swift_beginAccess();
  uint64_t v11 = a1[5];
  uint64_t v12 = v6[12];
  swift_bridgeObjectRetain();
  sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
  sub_21CB890A0();
  swift_getFunctionTypeMetadata1();
  uint64_t v13 = sub_21CB885E0();
  uint64_t v14 = v6[13];
  uint64_t v15 = v6[11];
  uint64_t v16 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
  uint64_t v25 = a2;
  MEMORY[0x21D4B5340](v27, a2, v11, v7, v13, v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = v27[0];
  if (!v27[0]) {
    uint64_t v17 = sub_21CB88570();
  }
  uint64_t v28 = v17;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v7;
  uint64_t v18[3] = v15;
  v18[4] = v12;
  v18[5] = v14;
  uint64_t v19 = v23;
  v18[6] = v22;
  v18[7] = v19;
  v27[0] = sub_21CB77364;
  v27[1] = v18;
  swift_retain();
  sub_21CB885C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v26, v25, v7);
  v27[3] = v28;
  swift_beginAccess();
  sub_21CB88230();
  sub_21CB88250();
  return swift_endAccess();
}

uint64_t sub_21CB73D70(void *a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v41 = a7;
  uint64_t v42 = a8;
  uint64_t v40 = a5;
  int v43 = a3;
  uint64_t v44 = a1;
  unint64_t v45 = a2;
  uint64_t v10 = sub_21CB88100();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21CB88150();
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  os_log_type_t v46 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a6 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v37 = a9;
    id v39 = *(id *)(result + 24);
    swift_release();
    uint64_t v21 = swift_allocObject();
    uint64_t v38 = v13;
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v40, a6);
    unint64_t v22 = (*(unsigned __int8 *)(v17 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    unint64_t v23 = (v18 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v40 = v14;
    uint64_t v24 = v11;
    uint64_t v25 = v10;
    uint64_t v26 = (char *)swift_allocObject();
    uint64_t v27 = v41;
    *((void *)v26 + 2) = a6;
    *((void *)v26 + 3) = v27;
    uint64_t v28 = v37;
    *((void *)v26 + 4) = v42;
    *((void *)v26 + 5) = v28;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v26[v22], v19, a6);
    *(void *)&v26[v23] = v21;
    uint64_t v29 = &v26[(v23 + 15) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v31 = v44;
    unint64_t v30 = v45;
    *(void *)uint64_t v29 = v44;
    *((void *)v29 + 1) = v30;
    LOBYTE(v22) = v43 & 1;
    v29[16] = v43 & 1;
    aBlock[4] = sub_21CB771E4;
    uint64_t aBlock[5] = v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_21CA1B084;
    uint64_t aBlock[3] = &unk_26CD71838;
    uint64_t v32 = _Block_copy(aBlock);
    swift_retain();
    sub_21CB77284(v31, v30, v22);
    uint64_t v33 = v46;
    sub_21CB88120();
    uint64_t v48 = MEMORY[0x263F8EE78];
    sub_21CA5DEF4((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
    sub_21CA57E34((uint64_t *)&unk_267C96DD0);
    sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
    uint64_t v34 = v38;
    sub_21CB88A60();
    uint64_t v35 = v39;
    MEMORY[0x21D4B5A20](0, v33, v34, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v34, v25);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v40);
    swift_release();
    return swift_release();
  }
  return result;
}

void *sub_21CB7420C(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v142 = a7;
  LODWORD(v125) = a5;
  unint64_t v127 = a4;
  uint64_t v126 = a3;
  uint64_t v124 = sub_21CB889A0();
  uint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  unint64_t v128 = (char *)&v113 - v13;
  sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
  uint64_t v134 = sub_21CB890A0();
  uint64_t v122 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  unint64_t v121 = (uint8_t **)((char *)&v113 - v14);
  uint64_t v15 = sub_21CB889A0();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v116 = (char *)&v113 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v129 = (uint64_t *)((char *)&v113 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  unint64_t v119 = (uint8_t **)((char *)&v113 - v21);
  uint64_t v120 = v22;
  uint64_t v23 = sub_21CB890A0();
  uint64_t v139 = *(void *)(v23 - 8);
  uint64_t v140 = v23;
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v132 = (uint8_t *)&v113 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v138 = (uint64_t *)((char *)&v113 - v27);
  uint64_t v28 = *(void *)(a6 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t AssociatedConformanceWitness = (char *)&v113 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  unint64_t v137 = (char *)&v113 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v113 - v33;
  uint64_t v131 = (char *)(a2 + 16);
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_21CB880A0();
  uint64_t v36 = sub_21CA4CC18(v35, (uint64_t)qword_267CA5368);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  uint64_t v136 = v28 + 16;
  uint64_t v135 = v37;
  v37(v34, a1, a6);
  uint64_t v114 = v36;
  uint64_t v38 = sub_21CB88070();
  os_log_type_t v39 = sub_21CB88880();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v141 = a1;
  uint64_t v118 = a8;
  uint64_t v130 = a9;
  uint64_t v117 = v18;
  uint64_t v115 = (void (*)(uint8_t **, char *, uint64_t))v28;
  if (v40)
  {
    uint64_t v41 = v28;
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v146 = (char *)v43;
    *(_DWORD *)uint64_t v42 = 136315138;
    uint64_t v113 = v42 + 4;
    swift_getAssociatedConformanceWitness();
    uint64_t v44 = sub_21CB88F70();
    uint64_t v145 = sub_21CA4E450(v44, v45, (uint64_t *)&v146);
    sub_21CB889C0();
    swift_bridgeObjectRelease();
    os_log_type_t v46 = *(void (**)(char *, uint64_t))(v41 + 8);
    v46(v34, a6);
    _os_log_impl(&dword_21CA00000, v38, v39, "FMImageCache: Finished loading request: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B6B70](v43, -1, -1);
    MEMORY[0x21D4B6B70](v42, -1, -1);
  }
  else
  {
    os_log_type_t v46 = *(void (**)(char *, uint64_t))(v28 + 8);
    v46(v34, a6);
  }

  swift_beginAccess();
  uint64_t result = (void *)swift_weakLoadStrong();
  uint64_t v48 = AssociatedConformanceWitness;
  unint64_t v49 = (char *)v132;
  if (result)
  {
    uint64_t v50 = result;
    uint64_t v51 = v138;
    sub_21CB75340(v126, v127, v125 & 1, result, v138);
    (*(void (**)(char *, uint64_t *, uint64_t))(v139 + 16))(v49, v51, v140);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v52 = *(uint8_t **)v49;
      uint64_t v53 = v141;
      v135(v48, v141, a6);
      uint64_t v54 = v52;
      uint64_t v55 = v52;
      uint64_t v56 = sub_21CB88070();
      os_log_type_t v57 = sub_21CB88880();
      int v58 = v57;
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v59 = swift_slowAlloc();
        uint64_t v132 = (uint8_t *)swift_slowAlloc();
        v146 = (char *)v132;
        *(_DWORD *)uint64_t v59 = 136315394;
        swift_getAssociatedConformanceWitness();
        LODWORD(v131) = v58;
        uint64_t v60 = sub_21CB88F70();
        uint64_t v143 = sub_21CA4E450(v60, v61, (uint64_t *)&v146);
        uint64_t v53 = v141;
        sub_21CB889C0();
        swift_bridgeObjectRelease();
        v46(v48, a6);
        *(_WORD *)(v59 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v62 = sub_21CB89000();
        uint64_t v143 = sub_21CA4E450(v62, v63, (uint64_t *)&v146);
        sub_21CB889C0();
        uint64_t v64 = v130;
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21CA00000, v56, (os_log_type_t)v131, "FMImageCache: Failed to fetch image for request: %s due to: %s", (uint8_t *)v59, 0x16u);
        uint64_t v65 = v132;
        swift_arrayDestroy();
        MEMORY[0x21D4B6B70](v65, -1, -1);
        MEMORY[0x21D4B6B70](v59, -1, -1);

        uint64_t v66 = v123;
      }
      else
      {
        v46(v48, a6);

        uint64_t v66 = v123;
        uint64_t v64 = v130;
      }
      swift_beginAccess();
      uint64_t v102 = v50[5];
      uint64_t v103 = v134;
      swift_getFunctionTypeMetadata1();
      uint64_t v104 = sub_21CB885E0();
      uint64_t v105 = v64;
      uint64_t AssociatedConformanceWitness = (char *)swift_getAssociatedConformanceWitness();
      uint64_t v106 = *((void *)AssociatedConformanceWitness + 2);
      swift_bridgeObjectRetain();
      MEMORY[0x21D4B5340](&v143, v53, v102, a6, v104, v106);
      uint64_t v107 = swift_bridgeObjectRelease();
      if (v143)
      {
        uint64_t v144 = v143;
        MEMORY[0x270FA5388](v107);
        uint64_t v108 = v142;
        *(&v113 - 6) = (uint8_t *)a6;
        *(&v113 - 5) = (uint8_t *)v108;
        *(&v113 - 4) = (uint8_t *)v118;
        *(&v113 - 3) = (uint8_t *)v105;
        *(&v113 - 2) = v52;
        swift_getWitnessTable();
        sub_21CB884B0();
        uint64_t v103 = v134;
        swift_bridgeObjectRelease();
      }
      uint64_t v109 = v121;
      *unint64_t v121 = v52;
      swift_storeEnumTagMultiPayload();
      uint64_t v110 = *(void (**)(uint64_t, uint8_t **))(*v50 + 288);
      uint64_t v111 = v52;
      v110(v53, v109);

      (*(void (**)(uint8_t **, uint64_t))(v122 + 8))(v109, v103);
      uint64_t v101 = v124;
    }
    else
    {
      uint64_t v67 = *(int *)(v120 + 48);
      uint64_t v68 = v120;
      unint64_t v69 = v119;
      uint64_t v70 = (char *)v119 + v67;
      uint64_t v71 = &v49[v67];
      unint64_t v72 = *((void *)v49 + 1);
      uint64_t v113 = *(uint8_t **)v49;
      unint64_t v125 = v72;
      void *v119 = v113;
      v69[1] = (uint8_t *)v72;
      uint64_t v73 = v118;
      uint64_t v74 = *(void *)(v118 - 8);
      uint64_t v75 = v74;
      uint64_t v76 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
      uint64_t v77 = v74 + 32;
      v76(v70, v71, v118);
      v135(v137, v141, a6);
      unint64_t v78 = (char *)v129 + *(int *)(v68 + 48);
      uint64_t v79 = (uint8_t *)a6;
      uint64_t v80 = *(void **)(v75 + 16);
      uint64_t v131 = v70;
      unint64_t v127 = v75 + 16;
      uint64_t v126 = v80;
      ((void (*)(char *, char *, uint64_t))v80)(v78, v70, v73);
      uint64_t v81 = v116;
      uint64_t v115 = (void (*)(uint8_t **, char *, uint64_t))v76;
      uint64_t v114 = v77;
      v76(v116, v78, v73);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v75 + 56))(v81, 0, 1, v73);
      swift_beginAccess();
      uint64_t v82 = (uint64_t)v113;
      sub_21CA1E93C((uint64_t)v113, v72);
      uint64_t AssociatedConformanceWitness = (char *)swift_getAssociatedConformanceWitness();
      uint64_t v83 = *((void *)AssociatedConformanceWitness + 2);
      sub_21CB88230();
      sub_21CB88250();
      swift_endAccess();
      uint64_t v84 = v82;
      uint64_t v85 = v141;
      sub_21CB759DC(v82, v72, v141);
      long long v86 = v129;
      swift_beginAccess();
      uint64_t v87 = v50[5];
      swift_getFunctionTypeMetadata1();
      uint64_t v88 = sub_21CB885E0();
      swift_bridgeObjectRetain();
      uint64_t v89 = v85;
      uint64_t v90 = v120;
      uint64_t v132 = v79;
      MEMORY[0x21D4B5340](&v143, v89, v87, v79, v88, v83);
      swift_bridgeObjectRelease();
      uint64_t v91 = v117;
      if (v143)
      {
        uint64_t v144 = v143;
        uint64_t v92 = (char *)v86 + *(int *)(v90 + 48);
        unint64_t v93 = v125;
        *long long v86 = v84;
        v86[1] = v93;
        uint64_t v94 = ((uint64_t (*)(char *, char *, uint64_t))v126)(v92, v131, v73);
        MEMORY[0x270FA5388](v94);
        uint64_t v95 = v142;
        *(&v113 - 6) = v132;
        *(&v113 - 5) = (uint8_t *)v95;
        uint64_t v96 = v130;
        *(&v113 - 4) = (uint8_t *)v73;
        *(&v113 - 3) = (uint8_t *)v96;
        *(&v113 - 2) = (uint8_t *)v86;
        sub_21CA1E93C(v84, v93);
        swift_getWitnessTable();
        sub_21CB884B0();
        long long v86 = v129;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t *, uint64_t))(v91 + 8))(v86, v90);
      }
      uint64_t v97 = (char *)v86 + *(int *)(v90 + 48);
      unint64_t v98 = v125;
      *long long v86 = v84;
      v86[1] = v98;
      ((void (*)(char *, char *, uint64_t))v126)(v97, v131, v73);
      sub_21CA36618(v84, v98);
      uint64_t v99 = v121;
      v115(v121, v97, v73);
      uint64_t v100 = v134;
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v141;
      (*(void (**)(uint64_t, uint8_t **))(*v50 + 288))(v141, v99);
      (*(void (**)(uint8_t **, uint64_t))(v122 + 8))(v99, v100);
      (*(void (**)(uint8_t **, uint64_t))(v91 + 8))(v119, v90);
      a6 = (uint64_t)v132;
      uint64_t v101 = v124;
      uint64_t v66 = v123;
    }
    swift_beginAccess();
    sub_21CB887A0();
    uint64_t v112 = v128;
    sub_21CB88770();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v112, v101);
    swift_endAccess();
    v135(v137, v53, a6);
    uint64_t v144 = 0;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_21CB885E0();
    sub_21CB88230();
    sub_21CB88250();
    swift_endAccess();
    swift_release();
    return (void *)(*(uint64_t (**)(uint64_t *, uint64_t))(v139 + 8))(v138, v140);
  }
  return result;
}

id sub_21CB75340@<X0>(void *a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t v27 = a2;
  uint64_t v9 = *(void *)(*a4 + 96);
  uint64_t v10 = sub_21CB889A0();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v26 - v16;
  if (a3)
  {
    *a5 = (uint64_t)a1;
    swift_getTupleTypeMetadata2();
    sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
    sub_21CB890A0();
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  else
  {
    uint64_t v26 = v15;
    uint64_t v18 = (void (*)(void *, unint64_t))a4[7];
    unint64_t v19 = v27;
    sub_21CA1E93C((uint64_t)a1, v27);
    v18(a1, v19);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v9) == 1)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v10);
      sub_21CB772D8();
      uint64_t v20 = swift_allocError();
      *uint64_t v21 = 1;
      sub_21CB771D8(a1, v27, 0);
      *a5 = v20;
      swift_getTupleTypeMetadata2();
    }
    else
    {
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v23(v17, v13, v9);
      uint64_t v24 = (char *)a5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      unint64_t v25 = v27;
      *a5 = (uint64_t)a1;
      a5[1] = v25;
      v23(v24, v17, v9);
    }
    sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
    sub_21CB890A0();
    return (id)swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_21CB756C0(void (**a1)(char *), char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = TupleTypeMetadata2 - 8;
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v11 = (_OWORD *)((char *)&v20 - v10);
  sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
  uint64_t v12 = sub_21CB890A0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v20 - v14;
  uint64_t v21 = *a1;
  uint64_t v16 = *(int *)(v9 + 56);
  uint64_t v17 = (char *)v11 + v16;
  *uint64_t v11 = *(_OWORD *)a2;
  uint64_t v18 = *(void *)(a5 - 8);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v17, &a2[v16], a5);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v17, a5);
  swift_storeEnumTagMultiPayload();
  v21(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_21CB758BC(void (**a1)(char *), void *a2)
{
  sub_21CA5EEBC((uint64_t *)&unk_267C96F50);
  uint64_t v4 = sub_21CB890A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v8 = *a1;
  *(uint64_t *)((char *)&v11 - v6) = (uint64_t)a2;
  swift_storeEnumTagMultiPayload();
  id v9 = a2;
  v8(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_21CB759DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)MEMORY[0x21D4B6380]();
  sub_21CB75A50(v3, a3, a1, a2);
}

uint64_t sub_21CB75A50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v75 = a4;
  uint64_t v74 = a3;
  v83[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  uint64_t v6 = sub_21CB87480();
  uint64_t v80 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v72 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v71 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v71 - v14;
  uint64_t v77 = *(void (**)(void))(v5 + 160);
  ((void (*)(uint64_t))v77)(v13);
  uint64_t v16 = *(void *)(v5 + 80);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v16, AssociatedConformanceWitness);
  unint64_t v78 = v15;
  sub_21CB87440();
  swift_bridgeObjectRelease();
  uint64_t v71 = v7;
  unint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v18 = (void (*)(void))(v7 + 8);
  v19(v12, v6);
  char v82 = 0;
  uint64_t v20 = self;
  id v21 = objc_msgSend(v20, sel_defaultManager);
  uint64_t v73 = a1;
  uint64_t v22 = v77;
  v77();
  sub_21CB87460();
  uint64_t v79 = v19;
  v19(v12, v80);
  uint64_t v23 = v20;
  uint64_t v24 = (void *)sub_21CB882C0();
  swift_bridgeObjectRelease();
  LOBYTE(v15) = objc_msgSend(v21, sel_fileExistsAtPath_isDirectory_, v24, &v82);

  if (v15) {
    goto LABEL_3;
  }
  id v25 = objc_msgSend(v20, sel_defaultManager);
  v22();
  uint64_t v26 = (void *)sub_21CB87430();
  v79(v12, v80);
  v83[0] = 0;
  unsigned int v27 = objc_msgSend(v25, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v26, 1, 0, v83);

  id v28 = v83[0];
  if (v27)
  {
LABEL_3:
    uint64_t v29 = v78;
    id v30 = v76;
    sub_21CB874D0();
    uint64_t v31 = v30;
    if (!v30)
    {
      uint64_t v32 = v18;
      id v33 = objc_msgSend(v23, (SEL)&selRef_sharedService + 3);
      sub_21CA57E34(&qword_267C97248);
      uint64_t inited = swift_initStackObject();
      uint64_t v35 = (void **)MEMORY[0x263F080A8];
      *(_OWORD *)(inited + 16) = xmmword_21CB8B220;
      uint64_t v36 = *v35;
      *(void *)(inited + 32) = *v35;
      uint64_t v37 = (void *)*MEMORY[0x263F08098];
      type metadata accessor for FileProtectionType(0);
      *(void *)(inited + 64) = v38;
      *(void *)(inited + 40) = v37;
      id v39 = v36;
      id v40 = v37;
      sub_21CA366F4(inited);
      type metadata accessor for FileAttributeKey(0);
      sub_21CA5DEF4(&qword_267C94BC0, type metadata accessor for FileAttributeKey);
      uint64_t v41 = (void *)sub_21CB881E0();
      swift_bridgeObjectRelease();
      sub_21CB87460();
      uint64_t v42 = (void *)sub_21CB882C0();
      swift_bridgeObjectRelease();
      v83[0] = 0;
      unsigned int v43 = objc_msgSend(v33, sel_setAttributes_ofItemAtPath_error_, v41, v42, v83);

      if (v43)
      {
        id v44 = v83[0];
        return ((uint64_t (*)(char *, uint64_t))v79)(v29, v80);
      }
      id v60 = v83[0];
      uint64_t v31 = (void *)sub_21CB87400();

      swift_willThrow();
      uint64_t v18 = v32;
    }
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_21CB880A0();
    sub_21CA4CC18(v61, (uint64_t)qword_267CA5368);
    id v62 = v31;
    id v63 = v31;
    uint64_t v64 = sub_21CB88070();
    os_log_type_t v65 = sub_21CB88860();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v77 = v18;
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      v83[0] = v67;
      *(_DWORD *)uint64_t v66 = 136315138;
      swift_getErrorValue();
      uint64_t v68 = sub_21CB89000();
      uint64_t v81 = sub_21CA4E450(v68, v69, (uint64_t *)v83);
      sub_21CB889C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21CA00000, v64, v65, "FMImageCache: Could not save objects to disk %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v67, -1, -1);
      MEMORY[0x21D4B6B70](v66, -1, -1);
    }
    else
    {
    }
    return ((uint64_t (*)(char *, uint64_t))v79)(v29, v80);
  }
  else
  {
    os_log_type_t v46 = v28;
    uint64_t v47 = (void *)sub_21CB87400();

    swift_willThrow();
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_21CB880A0();
    sub_21CA4CC18(v48, (uint64_t)qword_267CA5368);
    unint64_t v49 = v72;
    uint64_t v50 = v78;
    uint64_t v51 = v80;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v72, v78, v80);
    uint64_t v52 = sub_21CB88070();
    os_log_type_t v53 = sub_21CB88880();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v77 = v18;
      uint64_t v54 = swift_slowAlloc();
      id v76 = v47;
      uint64_t v55 = (uint8_t *)v54;
      uint64_t v56 = (void *)swift_slowAlloc();
      v83[0] = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      sub_21CA5DEF4((unint64_t *)&qword_267C97880, MEMORY[0x263F06EA8]);
      uint64_t v57 = sub_21CB88F00();
      uint64_t v81 = sub_21CA4E450(v57, v58, (uint64_t *)v83);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      uint64_t v59 = (uint64_t (*)(char *, uint64_t))v79;
      v79(v49, v51);
      _os_log_impl(&dword_21CA00000, v52, v53, "FMImageCache: Could not create directory for content: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v56, -1, -1);
      MEMORY[0x21D4B6B70](v55, -1, -1);

      return v59(v78, v51);
    }
    else
    {

      uint64_t v70 = (uint64_t (*)(char *, uint64_t))v79;
      v79(v49, v51);
      return v70(v50, v51);
    }
  }
}

id sub_21CB76370()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_21CB87480();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v17 - v8;
  (*(void (**)(uint64_t))(v1 + 160))(v7);
  uint64_t v10 = *(void *)(v1 + 80);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v10, AssociatedConformanceWitness);
  sub_21CB87440();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  id v13 = objc_msgSend(self, sel_defaultManager);
  sub_21CB87460();
  uint64_t v14 = (void *)sub_21CB882C0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  v12(v9, v2);
  return v15;
}

uint64_t sub_21CB76558@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *((void *)*v1 + 12);
  uint64_t v4 = sub_21CB889A0();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v39 - v5;
  uint64_t v6 = sub_21CB87480();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v44 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v39 - v10;
  __n128 v13 = MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v39 - v14;
  (*((void (**)(__n128))v2 + 20))(v13);
  uint64_t v16 = *((void *)v2 + 10);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v16, AssociatedConformanceWitness);
  sub_21CB87440();
  swift_bridgeObjectRelease();
  uint64_t v18 = v6;
  unint64_t v45 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v46 = v7 + 8;
  v45(v11, v6);
  unint64_t v19 = v15;
  uint64_t v20 = sub_21CB87490();
  unint64_t v22 = v21;
  uint64_t v24 = v40;
  uint64_t v23 = v41;
  id v25 = v42;
  v1[7]();
  sub_21CA36618(v20, v22);
  uint64_t v26 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v25, 1, v3) == 1)
  {
    uint64_t v43 = v3;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v23);
    uint64_t v27 = v18;
    id v28 = v44;
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_21CB880A0();
    sub_21CA4CC18(v29, (uint64_t)qword_267CA5368);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v28, v19, v27);
    id v30 = sub_21CB88070();
    os_log_type_t v31 = sub_21CB88880();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v49 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      sub_21CA5DEF4((unint64_t *)&qword_267C97880, MEMORY[0x263F06EA8]);
      uint64_t v34 = sub_21CB88F00();
      uint64_t v48 = sub_21CA4E450(v34, v35, &v49);
      sub_21CB889C0();
      swift_bridgeObjectRelease();
      uint64_t v36 = v45;
      v45(v28, v27);
      _os_log_impl(&dword_21CA00000, v30, v31, "FMImageCache: Failed to load cached image from disk: %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B6B70](v33, -1, -1);
      MEMORY[0x21D4B6B70](v32, -1, -1);
    }
    else
    {

      uint64_t v36 = v45;
      v45(v28, v27);
    }
    v36(v19, v27);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v47, 1, 1);
  }
  else
  {
    v45(v19, v18);
    uint64_t v38 = v47;
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v47, v25, v3);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v38, 0, 1, v3);
  }
}

uint64_t FMImageCache.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t FMImageCache.__deallocating_deinit()
{
  FMImageCache.deinit();

  return swift_deallocClassInstance();
}

BOOL sub_21CB76B78()
{
  return (sub_21CB76370() & 1) == 0;
}

uint64_t sub_21CB76BA8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_21CB76BD8@<X0>(uint64_t a1@<X8>)
{
  return sub_21CB71628(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

void sub_21CB76BF8()
{
  sub_21CB72524(v0);
}

uint64_t sub_21CB76C00()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_21CB76C14()
{
  unint64_t result = qword_267C979D0[0];
  if (!qword_267C979D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267C979D0);
  }
  return result;
}

uint64_t dispatch thunk of FMImageCacheRequest.fileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FMImageCacheOperation.init(request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

unsigned char *storeEnumTagSinglePayload for FMImageCacheError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21CB76D5CLL);
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

ValueMetadata *type metadata accessor for FMImageCacheError()
{
  return &type metadata for FMImageCacheError;
}

uint64_t dispatch thunk of FMImageCache.cacheRoot.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FMImageCache.__allocating_init(converter:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of FMImageCache.cachedImage(for:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of FMImageCache.purge()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of FMImageCache.forwardToDelegate(request:result:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t sub_21CB76E50()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_21CB76F34()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_21CB73AC8(*(void **)(v0 + 48), v0 + v1, *(void *)(v0 + v2), *(void *)(v0 + v2 + 8));
}

uint64_t sub_21CB76FA4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21CB76FB4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21CB76FEC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_21CB770B0(void *a1, unint64_t a2, char a3)
{
  return sub_21CB73D70(a1, a2, a3 & 1, v3[6], (uint64_t)v3+ ((*(unsigned __int8 *)(*(void *)(v3[2] - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3[2] - 8) + 80)), v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_21CB7711C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  sub_21CB771D8(*(id *)(v0 + v5), *(void *)(v0 + v5 + 8), *(unsigned char *)(v0 + v5 + 16));

  return MEMORY[0x270FA0238](v0, v5 + 17, v4);
}

void sub_21CB771D8(id a1, unint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    sub_21CA36618((uint64_t)a1, a2);
  }
}

void *sub_21CB771E4()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(v0[2] - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_21CB7420C((uint64_t)v0 + v1, *(uint64_t *)((char *)v0 + v2), *(void **)((char *)v0 + ((v2 + 15) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t *)((char *)v0 + ((v2 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *((unsigned __int8 *)v0 + ((v2 + 15) & 0xFFFFFFFFFFFFFFF8) + 16), v0[2], v0[3], v0[4], v0[5]);
}

id sub_21CB77284(id a1, unint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)sub_21CA1E93C((uint64_t)a1, a2);
  }
}

uint64_t sub_21CB77290(void (**a1)(char *))
{
  return sub_21CB758BC(a1, *(void **)(v1 + 48));
}

uint64_t sub_21CB772B4(void (**a1)(char *))
{
  return sub_21CB756C0(a1, *(char **)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_21CB772D8()
{
  unint64_t result = qword_267C97A58;
  if (!qword_267C97A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97A58);
  }
  return result;
}

uint64_t sub_21CB7732C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21CB77364()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_21CB7738C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  if (*(void *)(v0 + v5)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v5 + 16, v3 | 7);
}

void sub_21CB77468()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_21CB72FF8(v0 + v1, *(uint8_t **)(v0 + v2), *(uint8_t **)(v0 + v2 + 8));
}

uint64_t sub_21CB77508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

void sub_21CB7751C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 32), sel_aa_primaryAppleAccount);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_aa_personID);
    if (v3)
    {
      uint64_t v4 = sub_21CB882F0();
      os_log_t oslog = v5;
    }
    else
    {
      uint64_t v4 = 0;
      os_log_t oslog = 0;
    }
    uint64_t v9 = self;
    uint64_t v10 = (void *)sub_21CB882C0();
    uint64_t v11 = (void *)sub_21CB882C0();
    id v30 = v9;
    id v12 = objc_msgSend(v9, sel_stringForKey_inDomain_, v10, v11);

    if (v12)
    {
      uint64_t v13 = sub_21CB882F0();
      id v15 = v14;

      if (oslog)
      {
        if (v15)
        {
          if (v4 == v13 && oslog == v15)
          {
            swift_bridgeObjectRelease();
LABEL_28:
            if (qword_267C94990 != -1) {
              swift_once();
            }
            uint64_t v21 = sub_21CB880A0();
            sub_21CA4CC18(v21, (uint64_t)qword_267CA5368);
            swift_bridgeObjectRetain();
            unint64_t v22 = sub_21CB88070();
            os_log_type_t v23 = sub_21CB88880();
            if (os_log_type_enabled(v22, v23))
            {
              uint64_t v24 = (uint8_t *)swift_slowAlloc();
              uint64_t v25 = swift_slowAlloc();
              uint64_t v33 = v25;
              *(_DWORD *)uint64_t v24 = 136315138;
              swift_bridgeObjectRetain();
              sub_21CA57E34((uint64_t *)&unk_267C95220);
              uint64_t v26 = sub_21CB88310();
              sub_21CA4E450(v26, v27, &v33);
              sub_21CB889C0();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_21CA00000, v22, v23, "FMFGarbageCollector: saveFmfPersonID new: %s", v24, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x21D4B6B70](v25, -1, -1);
              MEMORY[0x21D4B6B70](v24, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            id v28 = (void *)sub_21CB882C0();
            uint64_t v29 = (void *)sub_21CB882C0();
            objc_msgSend(v30, sel_setString_forKey_inDomain_, v3, v28, v29);

            return;
          }
          char v16 = sub_21CB88F50();
          swift_bridgeObjectRelease();
          if (v16) {
            goto LABEL_28;
          }
        }
      }
      else
      {
        if (!v15) {
          goto LABEL_28;
        }
        swift_bridgeObjectRelease();
      }
    }
    else if (!oslog)
    {
      goto LABEL_28;
    }
    if (qword_267C94990 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_21CB880A0();
    sub_21CA4CC18(v17, (uint64_t)qword_267CA5368);
    uint64_t v18 = sub_21CB88070();
    os_log_type_t v19 = sub_21CB88880();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21CA00000, v18, v19, "FMFGarbageCollector: purging cache because person id are not matching.", v20, 2u);
      MEMORY[0x21D4B6B70](v20, -1, -1);
    }

    sub_21CB785E4();
    goto LABEL_28;
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21CB880A0();
  sub_21CA4CC18(v6, (uint64_t)qword_267CA5368);
  osloga = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88860();
  if (os_log_type_enabled(osloga, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21CA00000, osloga, v7, "FMFGarbageCollector: saveFmfPersonID - error retrieving primary account", v8, 2u);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }
}

uint64_t sub_21CB77A28(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21CB88100();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_21CB88150();
  uint64_t v8 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(v2 + 64);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_21CB78AD8;
  uint64_t aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  uint64_t aBlock[3] = &unk_26CD71928;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v11;
  swift_retain();
  id v15 = a1;
  sub_21CB88120();
  v17[1] = MEMORY[0x263F8EE78];
  sub_21CA364F8((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  sub_21CB88A60();
  MEMORY[0x21D4B5A20](0, v10, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, void))(v8 + 8))(v10, v17[0]);
  return swift_release();
}

void sub_21CB77CE4(uint64_t a1, void *a2)
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21CB880A0();
  sub_21CA4CC18(v4, (uint64_t)qword_267CA5368);
  swift_retain();
  uint64_t v5 = sub_21CB88070();
  os_log_type_t v6 = sub_21CB88880();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 67109120;
    v18[0] = *(unsigned __int8 *)(a1 + 41);
    sub_21CB889C0();
    swift_release();
    _os_log_impl(&dword_21CA00000, v5, v6, "FMFGarbageCollector: scheduleAccountVerification alreadyPending?: %{BOOL}d", v7, 8u);
    MEMORY[0x21D4B6B70](v7, -1, -1);

    if (*(unsigned char *)(a1 + 41)) {
      return;
    }
  }
  else
  {

    swift_release();
    if (*(unsigned char *)(a1 + 41)) {
      return;
    }
  }
  if (*(void *)(a1 + 56))
  {
    id v8 = objc_msgSend(a2, sel_userInfo);
    if (!v8) {
      return;
    }
    uint64_t v9 = v8;
    uint64_t v10 = sub_21CB88200();

    uint64_t v16 = sub_21CB882F0();
    uint64_t v17 = v11;
    sub_21CB88B00();
    if (*(void *)(v10 + 16) && (unint64_t v12 = sub_21CAC95EC((uint64_t)v18), (v13 & 1) != 0))
    {
      sub_21CA4E524(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v19);
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_21CA74238((uint64_t)v18);
    if (!*((void *)&v20 + 1))
    {
      sub_21CA34054((uint64_t)&v19);
      return;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      return;
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if (!v14)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (v16 == *(void *)(a1 + 48) && v14 == v17)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = sub_21CB88F50();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0) {
        return;
      }
    }
  }
  sub_21CB77FD4();
}

uint64_t sub_21CB77FD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21CB88100();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v34 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_21CB88150();
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v32 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_21CB88170();
  uint64_t v5 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  os_log_type_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = sub_21CB88110();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + 41) = 1;
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_21CB880A0();
  sub_21CA4CC18(v15, (uint64_t)qword_267CA5368);
  uint64_t v16 = sub_21CB88070();
  os_log_type_t v17 = sub_21CB88880();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = v1;
    long long v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v19 = 0;
    _os_log_impl(&dword_21CA00000, v16, v17, "FMFGarbageCollector: Dispatching verification on background", v19, 2u);
    long long v20 = v19;
    uint64_t v1 = v18;
    MEMORY[0x21D4B6B70](v20, -1, -1);
  }

  sub_21CA182AC();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F040], v11);
  uint64_t v30 = sub_21CB88940();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_21CB88160();
  MEMORY[0x21D4B5290](v7, 0.2);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v22 = v31;
  v21(v7, v31);
  aBlock[4] = sub_21CB78ACC;
  uint64_t aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_21CA1B084;
  uint64_t aBlock[3] = &unk_26CD718D8;
  os_log_type_t v23 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v24 = v32;
  sub_21CB88120();
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_21CA364F8((unint64_t *)&qword_267C96FC0, MEMORY[0x263F8F030]);
  sub_21CA57E34((uint64_t *)&unk_267C96DD0);
  sub_21CA3566C((unint64_t *)&qword_267C96FD0, (uint64_t *)&unk_267C96DD0);
  uint64_t v25 = v34;
  uint64_t v26 = v37;
  sub_21CB88A60();
  unint64_t v27 = (void *)v30;
  MEMORY[0x21D4B59C0](v10, v24, v25, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v35);
  v21(v10, v22);
  return swift_release();
}

void sub_21CB784FC(uint64_t a1)
{
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21CB880A0();
  sub_21CA4CC18(v2, (uint64_t)qword_267CA5368);
  uint64_t v3 = sub_21CB88070();
  os_log_type_t v4 = sub_21CB88880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21CA00000, v3, v4, "FMFGarbageCollector: Async verifying account", v5, 2u);
    MEMORY[0x21D4B6B70](v5, -1, -1);
  }

  sub_21CA1E994();
  *(unsigned char *)(a1 + 41) = 0;
}

void sub_21CB785E4()
{
  uint64_t v1 = v0;
  v34[3] = *(id *)MEMORY[0x263EF8340];
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    id v2 = objc_msgSend(self, sel_defaultManager);
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v32 = *(void *)(v3 + 16);
    if (!v32)
    {
LABEL_29:
      if (MEMORY[0x21D4B6C80](v1 + 72))
      {
        sub_21CB1543C();

        swift_unknownObjectRelease();
      }
      else
      {
      }
      return;
    }
    uint64_t v30 = v0;
    uint64_t v33 = v3 + 32;
    swift_bridgeObjectRetain();
    unint64_t v4 = 0;
    uint64_t v1 = v32;
    uint64_t v31 = v3;
    while (v4 < *(void *)(v3 + 16))
    {
      uint64_t v5 = v33 + 16 * v4;
      os_log_type_t v7 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
      swift_bridgeObjectRetain();
      uint64_t v8 = (void *)sub_21CB882C0();
      v34[0] = 0;
      id v9 = objc_msgSend(v2, sel_contentsOfDirectoryAtPath_error_, v8, v34);

      id v10 = v34[0];
      if (v9)
      {
        uint64_t v11 = sub_21CB88510();
        id v12 = v10;

        uint64_t v13 = *(void *)(v11 + 16);
        if (v13)
        {
          uint64_t v14 = v11 + 40;
          for (uint64_t i = v13 - 1; ; --i)
          {
            v34[0] = v7;
            v34[1] = v6;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_21CB883D0();
            swift_bridgeObjectRelease();
            uint64_t v16 = (void *)sub_21CB882C0();
            swift_bridgeObjectRelease();
            v34[0] = 0;
            unsigned int v17 = objc_msgSend(v2, sel_removeItemAtPath_error_, v16, v34);

            if (!v17)
            {
              id v19 = v34[0];
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v3 = v31;
              uint64_t v1 = v32;
              goto LABEL_16;
            }
            if (!i) {
              break;
            }
            v14 += 16;
            id v18 = v34[0];
          }
          id v25 = v34[0];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v3 = v31;
          uint64_t v1 = v32;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        id v19 = v34[0];
        swift_bridgeObjectRelease();
LABEL_16:
        long long v20 = (void *)sub_21CB87400();

        swift_willThrow();
        if (qword_267C94990 != -1) {
          swift_once();
        }
        uint64_t v21 = sub_21CB880A0();
        sub_21CA4CC18(v21, (uint64_t)qword_267CA5368);
        uint64_t v22 = sub_21CB88070();
        os_log_type_t v23 = sub_21CB88860();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_21CA00000, v22, v23, "FMFGarbageCollector: Error deleting file", v24, 2u);
          MEMORY[0x21D4B6B70](v24, -1, -1);
        }
      }
      if (++v4 == v1)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v30;
        goto LABEL_29;
      }
    }
    __break(1u);
    goto LABEL_34;
  }
  if (qword_267C94990 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v26 = sub_21CB880A0();
  sub_21CA4CC18(v26, (uint64_t)qword_267CA5368);
  unint64_t v27 = sub_21CB88070();
  os_log_type_t v28 = sub_21CB88880();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_21CA00000, v27, v28, "FMFGarbageCollector: Not purging files since not using cache", v29, 2u);
    MEMORY[0x21D4B6B70](v29, -1, -1);
  }

  if (MEMORY[0x21D4B6C80](v1 + 72))
  {
    sub_21CB1543C();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_21CB78A6C()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_21CA640FC(v0 + 72);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void sub_21CB78ACC()
{
  sub_21CB784FC(v0);
}

void sub_21CB78AD8()
{
  sub_21CB77CE4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21CB78AE0()
{
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB78AEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21CB78B00()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_21CB78B20(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_21CA57E34(&qword_267C97AB0);
  uint64_t v2 = sub_21CB88D40();
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
    sub_21CA24E80(v6, (uint64_t)&v15, &qword_267C97AB8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21CA5BCE0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_21CA33FEC((uint64_t)&v17, v3[7] + 32 * result);
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

unint64_t sub_21CB78C58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_21CA57E34(&qword_267C94E08);
  uint64_t v2 = sub_21CB88D40();
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
    sub_21CA24E80(v6, (uint64_t)&v15, &qword_267C94E10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21CA5BCE0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21CA38B20(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21CB78D90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_21CA57E34(&qword_267C97AD8);
  uint64_t v2 = (void *)sub_21CB88D40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_21CA5BCE0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

FMFCore::InitialTabInfo __swiftcall InitialTabInfo.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *uint64_t v0 = MEMORY[0x263F8EE78];
  v0[1] = v1;
  v0[2] = v1;
  return result;
}

unint64_t sub_21CB78EC0(char a1)
{
  unint64_t result = 0x65746E6F43706174;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x64657463656C6573;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 1935827316;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21CB78F84(char *a1, char *a2)
{
  return sub_21CA7F8A8(*a1, *a2);
}

uint64_t sub_21CB78F90()
{
  return sub_21CB89090();
}

uint64_t sub_21CB79018()
{
  sub_21CB88380();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB79084()
{
  return sub_21CB89090();
}

uint64_t sub_21CB79108@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_21CB88D70();
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

void sub_21CB79168(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x626C6C61436E696DLL;
  if (*v1) {
    uint64_t v2 = 0x626C6C614378616DLL;
  }
  *a1 = v2;
  a1[1] = 0xEB000000006B6361;
}

void *assignWithCopy for InitialTabInfo(void *a1, void *a2)
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

uint64_t assignWithTake for InitialTabInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InitialTabInfo(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InitialTabInfo(uint64_t result, int a2, int a3)
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

uint64_t sub_21CB792F8()
{
  sub_21CA37A10(v0 + qword_267CA53F8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + qword_267CA5418);

  return sub_21CA37A70(v1);
}

uint64_t sub_21CB79370()
{
  return type metadata accessor for FMFInitRefreshClientRequest();
}

unsigned char *storeEnumTagSinglePayload for FMFRefreshReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x21CB79444);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMFRefreshReason()
{
  return &type metadata for FMFRefreshReason;
}

unint64_t sub_21CB79480()
{
  unint64_t result = qword_267C97A70;
  if (!qword_267C97A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97A70);
  }
  return result;
}

id sub_21CB794D4()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id result = objc_msgSend(self, sel_standardUserDefaults);
  qword_267C97AE0 = (uint64_t)v0;
  *(void *)algn_267C97AE8 = result;
  return result;
}

id static FMUserDefaults.shared.getter@<X0>(void *a1@<X8>)
{
  if (qword_267C949E0 != -1) {
    swift_once();
  }
  int v3 = (void *)qword_267C97AE0;
  uint64_t v2 = *(void *)algn_267C97AE8;
  id v6 = *(id *)algn_267C97AE8;
  *a1 = qword_267C97AE0;
  a1[1] = v2;
  id v4 = v3;

  return v6;
}

Swift::Bool __swiftcall FMUserDefaults.BOOL(for:)(Swift::String a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  if (!objc_msgSend(*(id *)v1, sel_isInternalBuild)) {
    return 0;
  }
  int v3 = (void *)sub_21CB882C0();
  unsigned __int8 v4 = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return v4;
}

Swift::String_optional __swiftcall FMUserDefaults.string(for:)(Swift::String a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild)
    && (int v3 = (void *)sub_21CB882C0(),
        id v4 = objc_msgSend(v2, sel_stringForKey_, v3),
        v3,
        v4))
  {
    uint64_t v5 = sub_21CB882F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = v5;
  id v9 = v7;
  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  return result;
}

Swift::Int_optional __swiftcall FMUserDefaults.int(for:)(Swift::String a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild))
  {
    int v3 = (void *)sub_21CB882C0();
    id v4 = objc_msgSend(v2, sel_stringForKey_, v3);

    if (v4)
    {
      uint64_t v5 = sub_21CB882F0();
      unint64_t v7 = v6;

      uint64_t v9 = HIBYTE(v7) & 0xF;
      uint64_t v10 = v5 & 0xFFFFFFFFFFFFLL;
      if ((v7 & 0x2000000000000000) != 0) {
        uint64_t v11 = HIBYTE(v7) & 0xF;
      }
      else {
        uint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
      }
      if (v11)
      {
        if ((v7 & 0x1000000000000000) != 0)
        {
          uint64_t v13 = (uint64_t)sub_21CB79E50(v5, v7, 10);
          LOBYTE(v5) = v28;
LABEL_46:
          swift_bridgeObjectRelease();
          char v24 = v5 & 1;
          if (v5) {
            Swift::Int v8 = 0;
          }
          else {
            Swift::Int v8 = v13;
          }
          goto LABEL_57;
        }
        if ((v7 & 0x2000000000000000) == 0)
        {
          if ((v5 & 0x1000000000000000) != 0) {
            uint64_t v12 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            uint64_t v12 = (unsigned __int8 *)sub_21CB88BD0();
          }
          uint64_t v13 = (uint64_t)sub_21CB79F38(v12, v10, 10);
          LOBYTE(v5) = v14 & 1;
          goto LABEL_46;
        }
        v29[0] = v5;
        v29[1] = v7 & 0xFFFFFFFFFFFFFFLL;
        if (v5 == 43)
        {
          if (!v9) {
            goto LABEL_61;
          }
          if (v9 == 1 || (BYTE1(v5) - 48) > 9u) {
            goto LABEL_33;
          }
          uint64_t v13 = (BYTE1(v5) - 48);
          if (v9 != 2)
          {
            if ((BYTE2(v5) - 48) > 9u) {
              goto LABEL_33;
            }
            uint64_t v13 = 10 * (BYTE1(v5) - 48) + (BYTE2(v5) - 48);
            uint64_t v15 = v9 - 3;
            if (v15)
            {
              uint64_t v16 = (unsigned __int8 *)v29 + 3;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_33;
                }
                uint64_t v18 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v13 = v18 + v17;
                if (__OFADD__(v18, v17)) {
                  goto LABEL_33;
                }
                LOBYTE(v5) = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_46;
                }
              }
            }
          }
        }
        else
        {
          if (v5 == 45)
          {
            if (v9)
            {
              if (v9 != 1 && (BYTE1(v5) - 48) <= 9u)
              {
                if (v9 == 2)
                {
                  LOBYTE(v5) = 0;
                  uint64_t v13 = -(uint64_t)(BYTE1(v5) - 48);
                  goto LABEL_46;
                }
                if ((BYTE2(v5) - 48) <= 9u)
                {
                  uint64_t v13 = -10 * (BYTE1(v5) - 48) - (BYTE2(v5) - 48);
                  uint64_t v23 = v9 - 3;
                  if (!v23) {
                    goto LABEL_45;
                  }
                  id v25 = (unsigned __int8 *)v29 + 3;
                  while (1)
                  {
                    unsigned int v26 = *v25 - 48;
                    if (v26 > 9) {
                      break;
                    }
                    uint64_t v27 = 10 * v13;
                    if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                      break;
                    }
                    uint64_t v13 = v27 - v26;
                    if (__OFSUB__(v27, v26)) {
                      break;
                    }
                    LOBYTE(v5) = 0;
                    ++v25;
                    if (!--v23) {
                      goto LABEL_46;
                    }
                  }
                }
              }
LABEL_33:
              uint64_t v13 = 0;
              LOBYTE(v5) = 1;
              goto LABEL_46;
            }
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          if (!v9 || (v5 - 48) > 9u) {
            goto LABEL_33;
          }
          uint64_t v13 = (v5 - 48);
          if (v9 != 1)
          {
            if ((BYTE1(v5) - 48) > 9u) {
              goto LABEL_33;
            }
            uint64_t v13 = 10 * (v5 - 48) + (BYTE1(v5) - 48);
            uint64_t v19 = v9 - 2;
            if (v19)
            {
              long long v20 = (unsigned __int8 *)v29 + 2;
              while (1)
              {
                unsigned int v21 = *v20 - 48;
                if (v21 > 9) {
                  goto LABEL_33;
                }
                uint64_t v22 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v13 = v22 + v21;
                if (__OFADD__(v22, v21)) {
                  goto LABEL_33;
                }
                LOBYTE(v5) = 0;
                ++v20;
                if (!--v19) {
                  goto LABEL_46;
                }
              }
            }
          }
        }
LABEL_45:
        LOBYTE(v5) = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
    }
  }
  Swift::Int v8 = 0;
  char v24 = 1;
LABEL_57:
  LOBYTE(v10) = v24;
LABEL_62:
  result.is_nil = v10;
  result.value = v8;
  return result;
}

Swift::Double_optional __swiftcall FMUserDefaults.double(for:)(Swift::String a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  if (!objc_msgSend(*(id *)v1, sel_isInternalBuild)
    || (id v4 = (void *)sub_21CB882C0(),
        id v5 = objc_msgSend(v2, sel_stringForKey_, v4),
        v4,
        !v5))
  {
    Swift::Bool v13 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = sub_21CB882F0();
  uint64_t v8 = v7;

  MEMORY[0x270FA5388](v9);
  if ((v8 & 0x1000000000000000) != 0 || !(v8 & 0x2000000000000000 | v6 & 0x1000000000000000))
  {
    sub_21CB88B50();
  }
  else
  {
    MEMORY[0x270FA5388](v10);
    if ((v8 & 0x2000000000000000) != 0)
    {
      BOOL v15 = (v6 > 0x20u || ((0x100003E01uLL >> v6) & 1) == 0)
         && (char v14 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v14 == 0;
      char v16 = v15;
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    if ((v6 & 0x1000000000000000) != 0)
    {
      uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v12 = v6 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v11 = sub_21CB88BD0();
    }
    char v16 = sub_21CB7A6A0(v11, v12, (void (*)(uint64_t *__return_ptr))sub_21CB7A770) & 1;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  if (v16) {
    Swift::Bool v13 = 0;
  }
  else {
    Swift::Bool v13 = 0;
  }
LABEL_23:
  result.value = v3;
  result.is_nil = v13;
  return result;
}

void FMUserDefaults.set(value:for:)(uint64_t a1)
{
  double v3 = *(void **)(v1 + 8);
  if (objc_msgSend(*(id *)v1, sel_isInternalBuild))
  {
    sub_21CB7A7B4(a1, (uint64_t)v12);
    uint64_t v4 = v13;
    if (v13)
    {
      id v5 = sub_21CA2B2CC(v12, v13);
      uint64_t v6 = *(void *)(v4 - 8);
      __n128 v7 = MEMORY[0x270FA5388](v5);
      uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v6 + 16))(v9, v7);
      uint64_t v10 = sub_21CB88F30();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
      sub_21CA2B0D0((uint64_t)v12);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = (void *)sub_21CB882C0();
    objc_msgSend(v3, sel_setValue_forKey_, v10, v11);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_21CB79DBC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_21CB88450();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x21D4B5520](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_21CB79E38(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_21CB79F38(a1, a2, a3);
}

unsigned __int8 *sub_21CB79E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21CB88480();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_21CB7A1B4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_21CB88BD0();
  }
LABEL_7:
  uint64_t v11 = sub_21CB79F38(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21CB79F38(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21CB7A1B4()
{
  unint64_t v0 = sub_21CB88490();
  uint64_t v4 = sub_21CB7A234(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21CB7A234(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_21CB7A38C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_21CA4E94C(v9, 0);
      unint64_t v12 = sub_21CB7A48C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_21CB88BD0();
LABEL_4:
        JUMPOUT(0x21D4B5470);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x21D4B5470](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x21D4B5470]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_21CB7A38C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_21CB79DBC(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_21CB79DBC(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_21CB7A48C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    Swift::Double_optional result = v12;
    if (v17 == v15) {
      Swift::Double_optional result = sub_21CB79DBC(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      Swift::Double_optional result = sub_21CB88440();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        Swift::Double_optional result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          Swift::Double_optional result = sub_21CB88BD0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    Swift::Double_optional result = sub_21CB79DBC(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_21CB88410();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21CB7A6A0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_21CB7A700@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_21CB7A770@<X0>(unsigned char *a1@<X8>)
{
  Swift::Double_optional result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_21CB7A7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C955B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for FMUserDefaults(void *a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for FMUserDefaults(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for FMUserDefaults(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  BOOL v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for FMUserDefaults(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for FMUserDefaults(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FMUserDefaults(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)Swift::Double_optional result = a2 ^ 0x80000000;
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
      *(void *)Swift::Double_optional result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMUserDefaults()
{
  return &type metadata for FMUserDefaults;
}

uint64_t type metadata accessor for FMFRemoveLabelsRequest()
{
  uint64_t result = qword_267C97AF0;
  if (!qword_267C97AF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21CB7AA08()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21CB7AA58()
{
  uint64_t v1 = *(void *)(v0 + qword_267CA5438);
  v3[3] = sub_21CA57E34(&qword_267C94E60);
  v3[0] = v1;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21CA3769C((uint64_t)v3, 0x736C6562616CLL, 0xE600000000000000);
  return swift_endAccess();
}

uint64_t sub_21CB7AAE8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB7AAF8()
{
  uint64_t v0 = sub_21CB87730();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + qword_267CA51F8;
  uint64_t v2 = sub_21CB87590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21CB7ABDC()
{
  sub_21CB7AAF8();

  return swift_deallocClassInstance();
}

uint64_t sub_21CB7AC30()
{
  return type metadata accessor for FMFRemoveLabelsRequest();
}

uint64_t static FMSystemInfo.isKoreaSKU()()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v1 = objc_msgSend(v0, sel_isInternalBuild);

  if (!v1
    || (id v2 = objc_msgSend(self, sel_standardUserDefaults),
        unsigned int v3 = (void *)sub_21CB882C0(),
        unsigned int v4 = objc_msgSend(v2, sel_BOOLForKey_, v3),
        v2,
        v3,
        !v4))
  {
    sub_21CB7B0C8((uint64_t)v13);
    if (v14)
    {
      if ((swift_dynamicCast() & 1) != 0 && v11 == 18507 && v12 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
        char v9 = 1;
        return v9 & 1;
      }
    }
    else
    {
      sub_21CA34054((uint64_t)v13);
    }
    char v9 = sub_21CB88F50();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21CB880A0();
  sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
  id v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21CA00000, v6, v7, "SystemInfo simulating Korea SKU device.", v8, 2u);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }

  char v9 = 1;
  return v9 & 1;
}

uint64_t static FMSystemInfo.isChinaSKU()()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v1 = objc_msgSend(v0, sel_isInternalBuild);

  if (!v1
    || (id v2 = objc_msgSend(self, sel_standardUserDefaults),
        unsigned int v3 = (void *)sub_21CB882C0(),
        unsigned int v4 = objc_msgSend(v2, sel_BOOLForKey_, v3),
        v2,
        v3,
        !v4))
  {
    sub_21CB7B0C8((uint64_t)v13);
    if (v14)
    {
      if ((swift_dynamicCast() & 1) != 0 && v11 == 18499 && v12 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
        char v9 = 1;
        return v9 & 1;
      }
    }
    else
    {
      sub_21CA34054((uint64_t)v13);
    }
    char v9 = sub_21CB88F50();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
  if (qword_267C94990 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21CB880A0();
  sub_21CA4CC18(v5, (uint64_t)qword_267CA5368);
  id v6 = sub_21CB88070();
  os_log_type_t v7 = sub_21CB88880();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21CA00000, v6, v7, "SystemInfo simulating China SKU device.", v8, 2u);
    MEMORY[0x21D4B6B70](v8, -1, -1);
  }

  char v9 = 1;
  return v9 & 1;
}

void sub_21CB7B0C8(uint64_t a1@<X8>)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = (void *)sub_21CB882C0();
  uint64_t v3 = MGCopyAnswerWithError();

  if (v3)
  {
    *(void *)(a1 + 24) = swift_getObjectType();
    *(void *)a1 = v3;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

uint64_t FMFAddress.displayAddress.getter()
{
  uint64_t v2 = v0[1];
  unint64_t v1 = v0[2];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  unint64_t v5 = v0[12];
  uint64_t v7 = v0[17];
  unint64_t v6 = v0[18];
  if (v5 && (uint64_t v8 = v0[11], sub_21CB883A0() >= 1))
  {
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_4;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = v7;
    unint64_t v5 = v6;
    if (!v4)
    {
LABEL_4:
      if (!v5)
      {
        if (!v1) {
          goto LABEL_6;
        }
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v8 = v2;
        unint64_t v5 = v1;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  if (!v5) {
    goto LABEL_21;
  }
  if (v3 == v8 && v4 == v5 || (sub_21CB88F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (!v1)
    {
LABEL_6:
      if (!v4) {
        return 0;
      }
      goto LABEL_21;
    }
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v9 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v9 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    type metadata accessor for FMLocalize();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (v4)
    {
      uint64_t v11 = self;
      swift_bridgeObjectRetain();
      id v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_21CB872B0();

      sub_21CA57E34(&qword_267C97020);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_21CB8AC70;
      uint64_t v14 = MEMORY[0x263F8D310];
      *(void *)(v13 + 56) = MEMORY[0x263F8D310];
      unint64_t v15 = sub_21CA4ECA4();
      *(void *)(v13 + 32) = v3;
      *(void *)(v13 + 40) = v4;
      *(void *)(v13 + 96) = v14;
      *(void *)(v13 + 104) = v15;
      *(void *)(v13 + 64) = v15;
      *(void *)(v13 + 72) = v8;
      *(void *)(v13 + 80) = v5;
    }
    else
    {
      id v20 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_21CB872B0();

      sub_21CA57E34(&qword_267C97020);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_21CB8B220;
      *(void *)(v21 + 56) = MEMORY[0x263F8D310];
      *(void *)(v21 + 64) = sub_21CA4ECA4();
      *(void *)(v21 + 32) = v8;
      *(void *)(v21 + 40) = v5;
    }
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
LABEL_21:
  type metadata accessor for FMLocalize();
  uint64_t v16 = swift_getObjCClassFromMetadata();
  unint64_t v17 = self;
  swift_bridgeObjectRetain();
  id v18 = objc_msgSend(v17, sel_bundleForClass_, v16);
  sub_21CB872B0();

  sub_21CA57E34(&qword_267C97020);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21CB8B220;
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  *(void *)(v19 + 64) = sub_21CA4ECA4();
  *(void *)(v19 + 32) = v3;
  *(void *)(v19 + 40) = v4;
LABEL_23:
  uint64_t v22 = sub_21CB88300();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t FMFAddress.fmlPlacemark.getter()
{
  return sub_21CB87FC0();
}

id FMFAddress.placemark.getter()
{
  uint64_t v1 = v0[2];
  uint64_t v14 = v0[6];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[18];
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BA70]), sel_init);
  if (v3)
  {
    uint64_t v7 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setLocality_, v7);
  }
  if (v5)
  {
    uint64_t v8 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setAdministrativeArea_, v8);
  }
  if (v1)
  {
    uint64_t v9 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setCountry_, v9);
  }
  if (v4)
  {
    unint64_t v10 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setState_, v10);
  }
  if (v2)
  {
    uint64_t v11 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setStreetAddress_, v11);
  }
  if (v14)
  {
    id v12 = (void *)sub_21CB882C0();
    objc_msgSend(v6, sel_setStreetName_, v12);
  }
  return v6;
}

__n128 FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:mapFormattedAddress:coarseAddressModern:streetAddressModern:smallAddressModern:mediumAddressModern:largeAddressModern:poiAddressModern:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, uint64_t a15, long long a16, long long a17, long long a18, long long a19, long long a20,long long a21,long long a22,__n128 a23,uint64_t a24)
{
  __n128 result = a23;
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
  *(void *)(a9 + 152) = 0;
  *(void *)(a9 + 160) = 0;
  *(void *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(_OWORD *)(a9 + 184) = a17;
  *(_OWORD *)(a9 + 200) = a18;
  *(_OWORD *)(a9 + 216) = a19;
  *(_OWORD *)(a9 + 232) = a20;
  *(_OWORD *)(a9 + 248) = a21;
  *(_OWORD *)(a9 + 264) = a22;
  *(__n128 *)(a9 + 280) = a23;
  *(void *)(a9 + 296) = a24;
  return result;
}

double FMFAddress.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_locality);
  uint64_t v5 = sub_21CB882F0();
  uint64_t v29 = v6;
  uint64_t v30 = v5;

  id v7 = objc_msgSend(a1, sel_administrativeArea);
  uint64_t v8 = sub_21CB882F0();
  uint64_t v27 = v9;
  uint64_t v28 = v8;

  id v10 = objc_msgSend(a1, sel_country);
  uint64_t v26 = sub_21CB882F0();
  uint64_t v12 = v11;

  id v13 = objc_msgSend(a1, sel_state);
  uint64_t v14 = sub_21CB882F0();
  uint64_t v16 = v15;

  id v17 = objc_msgSend(a1, sel_streetAddress);
  uint64_t v18 = sub_21CB882F0();
  uint64_t v20 = v19;

  id v21 = objc_msgSend(a1, sel_streetName);
  uint64_t v22 = sub_21CB882F0();
  uint64_t v24 = v23;

  *(void *)a2 = 0;
  *(void *)(a2 + 8) = v26;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v22;
  *(void *)(a2 + 48) = v24;
  *(void *)(a2 + 56) = v18;
  *(void *)(a2 + 64) = v20;
  *(void *)(a2 + 72) = v30;
  *(void *)(a2 + 80) = v29;
  *(void *)(a2 + 88) = v14;
  *(void *)(a2 + 96) = v16;
  double result = 0.0;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  *(void *)(a2 + 136) = v28;
  *(void *)(a2 + 144) = v27;
  *(void *)(a2 + 152) = 0;
  *(void *)(a2 + 160) = 0;
  *(void *)(a2 + 168) = MEMORY[0x263F8EE78];
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  return result;
}

{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  double result;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  id v4 = objc_msgSend(a1, sel_postalAddress);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = _s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0((uint64_t)v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(a1, sel_country);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_21CB882F0();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = objc_msgSend(a1, sel_ISOcountryCode);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = sub_21CB882F0();
    uint64_t v83 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v83 = 0;
  }
  uint64_t v16 = objc_msgSend(a1, sel_postalAddress);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = objc_msgSend(v16, sel_street);

    uint64_t v19 = sub_21CB882F0();
    uint64_t v81 = v20;
    char v82 = v19;
  }
  else
  {
    uint64_t v81 = 0;
    char v82 = 0;
  }
  id v21 = objc_msgSend(a1, sel_thoroughfare);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_21CB882F0();
    uint64_t v79 = v24;
    uint64_t v80 = v23;
  }
  else
  {
    uint64_t v79 = 0;
    uint64_t v80 = 0;
  }
  uint64_t v25 = objc_msgSend(a1, sel_locality);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = sub_21CB882F0();
    uint64_t v77 = v28;
    unint64_t v78 = v27;
  }
  else
  {
    uint64_t v77 = 0;
    unint64_t v78 = 0;
  }
  uint64_t v29 = objc_msgSend(a1, sel_postalCode);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = sub_21CB882F0();
    uint64_t v75 = v32;
    id v76 = v31;
  }
  else
  {
    uint64_t v75 = 0;
    id v76 = 0;
  }
  uint64_t v33 = objc_msgSend(a1, sel_postalCode);
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = sub_21CB882F0();
    uint64_t v73 = v36;
    uint64_t v74 = v35;
  }
  else
  {
    uint64_t v73 = 0;
    uint64_t v74 = 0;
  }
  uint64_t v37 = objc_msgSend(a1, sel_name);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = sub_21CB882F0();
    uint64_t v71 = v40;
    unint64_t v72 = v39;
  }
  else
  {
    uint64_t v71 = 0;
    unint64_t v72 = 0;
  }
  uint64_t v41 = objc_msgSend(a1, sel_administrativeArea);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = sub_21CB882F0();
    unint64_t v69 = v44;
    uint64_t v70 = v43;
  }
  else
  {
    unint64_t v69 = 0;
    uint64_t v70 = 0;
  }
  unint64_t v45 = objc_msgSend(a1, sel_subAdministrativeArea);
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = sub_21CB882F0();
    uint64_t v67 = v48;
    uint64_t v68 = v47;
  }
  else
  {
    uint64_t v67 = 0;
    uint64_t v68 = 0;
  }
  uint64_t v49 = objc_msgSend(a1, sel_areasOfInterest);
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v66 = sub_21CB88510();
  }
  else
  {
    uint64_t v66 = MEMORY[0x263F8EE78];
  }
  uint64_t v51 = objc_msgSend(a1, sel_fullThoroughfare);
  if (v51)
  {
    uint64_t v52 = v51;
    os_log_type_t v53 = sub_21CB882F0();
    uint64_t v55 = v54;
  }
  else
  {
    os_log_type_t v53 = 0;
    uint64_t v55 = 0;
  }
  uint64_t v56 = objc_msgSend(a1, sel__geoMapItem);
  uint64_t v57 = v56;
  if (v56)
  {
    unint64_t v58 = objc_msgSend(v56, sel_addressObject);
    swift_unknownObjectRelease();
    if (v58)
    {
      os_log_type_t v65 = v14;
      uint64_t v59 = v11;
      id v60 = v9;
      uint64_t v61 = v6;
      id v62 = objc_msgSend(v58, sel_fullAddressNoCurrentCountryWithMultiline_, 0);

      if (v62)
      {
        unint64_t v58 = (id)sub_21CB882F0();
        uint64_t v57 = v63;
      }
      else
      {

        unint64_t v58 = 0;
        uint64_t v57 = 0;
      }
      uint64_t v6 = v61;
      uint64_t v9 = v60;
      uint64_t v11 = v59;
      uint64_t v14 = v65;
    }
    else
    {

      uint64_t v57 = 0;
    }
  }
  else
  {

    unint64_t v58 = 0;
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v83;
  *(void *)(a2 + 40) = v82;
  *(void *)(a2 + 48) = v81;
  *(void *)(a2 + 56) = v80;
  *(void *)(a2 + 64) = v79;
  *(void *)(a2 + 72) = v78;
  *(void *)(a2 + 80) = v77;
  *(void *)(a2 + 88) = v76;
  *(void *)(a2 + 96) = v75;
  *(void *)(a2 + 104) = v74;
  *(void *)(a2 + 112) = v73;
  *(void *)(a2 + 120) = v72;
  *(void *)(a2 + 128) = v71;
  *(void *)(a2 + 136) = v70;
  *(void *)(a2 + 144) = v69;
  *(void *)(a2 + 152) = v68;
  *(void *)(a2 + 160) = v67;
  *(void *)(a2 + 168) = v66;
  *(void *)(a2 + 176) = v53;
  *(void *)(a2 + 184) = v55;
  *(void *)(a2 + 192) = v58;
  *(void *)(a2 + 200) = v57;
  double result = 0.0;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  return result;
}

double FMFAddress.init(from:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21CB87FD0();
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  uint64_t v6 = sub_21CB87F90();
  uint64_t v45 = v7;
  uint64_t v46 = v6;
  uint64_t v8 = sub_21CB87FB0();
  uint64_t v39 = v9;
  uint64_t v40 = v8;
  uint64_t v10 = sub_21CB87FE0();
  uint64_t v41 = v11;
  uint64_t v42 = v10;
  uint64_t v12 = sub_21CB87F80();
  uint64_t v35 = v13;
  uint64_t v36 = v12;
  uint64_t v14 = sub_21CB87F30();
  uint64_t v16 = v15;
  uint64_t v17 = sub_21CB87FA0();
  uint64_t v18 = sub_21CB87F60();
  uint64_t v33 = v19;
  uint64_t v34 = v18;
  uint64_t v20 = sub_21CB87F20();
  uint64_t v37 = v21;
  uint64_t v38 = v20;
  uint64_t v32 = sub_21CB87F50();
  uint64_t v23 = v22;
  uint64_t v24 = sub_21CB87F70();
  uint64_t v26 = v25;
  uint64_t v27 = sub_21CB87F40();
  uint64_t v29 = v28;
  uint64_t v30 = sub_21CB88000();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8))(a1, v30);
  *(void *)a2 = v17;
  *(void *)(a2 + 8) = v40;
  *(void *)(a2 + 16) = v39;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v14;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v36;
  *(void *)(a2 + 64) = v35;
  *(void *)(a2 + 72) = v44;
  *(void *)(a2 + 80) = v43;
  *(void *)(a2 + 88) = v42;
  *(void *)(a2 + 96) = v41;
  double result = 0.0;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  *(void *)(a2 + 136) = v46;
  *(void *)(a2 + 144) = v45;
  *(void *)(a2 + 152) = 0;
  *(void *)(a2 + 160) = 0;
  *(void *)(a2 + 168) = MEMORY[0x263F8EE78];
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(void *)(a2 + 208) = v34;
  *(void *)(a2 + 216) = v33;
  *(void *)(a2 + 224) = 0;
  *(void *)(a2 + 232) = 0;
  *(void *)(a2 + 240) = v32;
  *(void *)(a2 + 248) = v23;
  *(void *)(a2 + 256) = v24;
  *(void *)(a2 + 264) = v26;
  *(void *)(a2 + 272) = v27;
  *(void *)(a2 + 280) = v29;
  *(void *)(a2 + 288) = v38;
  *(void *)(a2 + 296) = v37;
  return result;
}

double FMFAddress.init(mapItem:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_geoAddress);
  id v5 = objc_msgSend(v4, sel_structuredAddress);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, sel_locality);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_21CB882F0();
      uint64_t v82 = v10;
      uint64_t v83 = v9;
    }
    else
    {
      uint64_t v82 = 0;
      uint64_t v83 = 0;
    }
    id v11 = objc_msgSend(v6, sel_administrativeArea);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_21CB882F0();
      uint64_t v80 = v14;
      uint64_t v81 = v13;
    }
    else
    {
      uint64_t v80 = 0;
      uint64_t v81 = 0;
    }
    id v15 = objc_msgSend(v6, sel_subAdministrativeArea);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_21CB882F0();
      uint64_t v78 = v18;
      uint64_t v79 = v17;
    }
    else
    {
      uint64_t v78 = 0;
      uint64_t v79 = 0;
    }
    id v19 = objc_msgSend(v6, sel_country);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_21CB882F0();
      uint64_t v76 = v22;
      uint64_t v77 = v21;
    }
    else
    {
      uint64_t v76 = 0;
      uint64_t v77 = 0;
    }
    id v23 = objc_msgSend(v6, sel_administrativeAreaCode);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = sub_21CB882F0();
      uint64_t v74 = v26;
      uint64_t v75 = v25;
    }
    else
    {
      uint64_t v74 = 0;
      uint64_t v75 = 0;
    }
    id v27 = objc_msgSend(v6, sel_postCode);
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = sub_21CB882F0();
      uint64_t v72 = v30;
      uint64_t v73 = v29;
    }
    else
    {
      uint64_t v72 = 0;
      uint64_t v73 = 0;
    }
  }
  else
  {
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
  }
  id v31 = objc_msgSend(a1, sel_name);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = sub_21CB882F0();
    uint64_t v84 = v34;

    if (v6) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    uint64_t v85 = v33;
    if (!v4) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  uint64_t v33 = 0;
  uint64_t v84 = 0;
  if (!v6) {
    goto LABEL_26;
  }
LABEL_23:
  id v35 = objc_msgSend(v6, sel_thoroughfare);
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = sub_21CB882F0();
    uint64_t v70 = v38;
    uint64_t v71 = v37;
  }
  else
  {
    uint64_t v70 = 0;
    uint64_t v71 = 0;
  }
  id v39 = objc_msgSend(v6, sel_fullThoroughfare);
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = sub_21CB882F0();
    uint64_t v68 = v42;
    uint64_t v69 = v41;
  }
  else
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
  }
  id v43 = objc_msgSend(v6, sel_countryCode);
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = sub_21CB882F0();
    uint64_t v66 = v46;
    uint64_t v67 = v45;

    uint64_t v85 = v33;
    if (!v4) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v85 = v33;
    if (!v4)
    {
LABEL_38:
      uint64_t v49 = v4;
      goto LABEL_39;
    }
  }
LABEL_36:
  id v47 = objc_msgSend(v4, sel_formattedAddressLines);
  if (!v47) {
    goto LABEL_38;
  }
  uint64_t v48 = v47;
  uint64_t v49 = v4;
  sub_21CB88500();

LABEL_39:
  id v50 = objc_msgSend(a1, sel_geoAddress);
  if (v50)
  {
    uint64_t v51 = v50;
    id v52 = objc_msgSend(v50, sel_structuredAddress);

    if (v52)
    {
      id v53 = objc_msgSend(v52, sel_areaOfInterests);

      if (v53)
      {
        sub_21CB88500();
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v54 = MEMORY[0x263F8EE78];
  id v55 = objc_msgSend(a1, sel_geoAddress);
  uint64_t v56 = v55;
  if (v55)
  {
    id v57 = objc_msgSend(v55, sel_structuredAddress);

    if (v57)
    {
      id v58 = objc_msgSend(v57, sel_fullThoroughfare);

      if (v58)
      {
        id v57 = (id)sub_21CB882F0();
        uint64_t v56 = v59;

        goto LABEL_50;
      }
      id v57 = 0;
    }
    uint64_t v56 = 0;
  }
  else
  {
    id v57 = 0;
  }
LABEL_50:
  id v60 = objc_msgSend(a1, sel_addressObject);
  uint64_t v61 = v60;
  if (!v60)
  {

    swift_unknownObjectRelease();
LABEL_55:
    uint64_t v64 = 0;
    goto LABEL_56;
  }
  id v62 = objc_msgSend(v60, sel_fullAddressNoCurrentCountryWithMultiline_, 0);

  if (!v62)
  {

    swift_unknownObjectRelease();
    uint64_t v61 = 0;
    goto LABEL_55;
  }
  uint64_t v61 = (void *)sub_21CB882F0();
  uint64_t v64 = v63;

  swift_unknownObjectRelease();
LABEL_56:
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = v77;
  *(void *)(a2 + 16) = v76;
  *(void *)(a2 + 24) = v67;
  *(void *)(a2 + 32) = v66;
  *(void *)(a2 + 40) = v71;
  *(void *)(a2 + 48) = v70;
  *(void *)(a2 + 56) = v69;
  *(void *)(a2 + 64) = v68;
  *(void *)(a2 + 72) = v83;
  *(void *)(a2 + 80) = v82;
  *(void *)(a2 + 88) = v75;
  *(void *)(a2 + 96) = v74;
  *(void *)(a2 + 104) = v73;
  *(void *)(a2 + 112) = v72;
  *(void *)(a2 + 120) = v85;
  *(void *)(a2 + 128) = v84;
  *(void *)(a2 + 136) = v81;
  *(void *)(a2 + 144) = v80;
  *(void *)(a2 + 152) = v79;
  *(void *)(a2 + 160) = v78;
  *(void *)(a2 + 168) = v54;
  *(void *)(a2 + 176) = v57;
  *(void *)(a2 + 184) = v56;
  *(void *)(a2 + 192) = v61;
  *(void *)(a2 + 200) = v64;
  double result = 0.0;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  return result;
}

FMFCore::FMFAddressLevelType_optional __swiftcall FMFAddressLevelType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 5;
  if ((unint64_t)rawValue < 5) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (FMFCore::FMFAddressLevelType_optional)rawValue;
}

uint64_t FMFAddressLevelType.rawValue.getter()
{
  return *v0;
}

FMFCore::FMFAddressLevelType_optional sub_21CB7C350(Swift::Int *a1)
{
  return FMFAddressLevelType.init(rawValue:)(*a1);
}

uint64_t FMFAddress.formattedAddressLines.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFAddress.country.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.countryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.locality.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.stateCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.postalCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.landmark.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.administrativeArea.getter()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.subAdministrativeArea.getter()
{
  uint64_t v1 = *(void *)(v0 + 152);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.areaOfInterest.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFAddress.fullThoroughfare.getter()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.mapFormattedAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.coarseAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 208);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.streetAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.smallAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.mediumAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 256);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.largeAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 272);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFAddress.poiAddressModern.getter()
{
  uint64_t v1 = *(void *)(v0 + 288);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_21CB7C6C8(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7972746E756F63;
      break;
    case 2:
      unint64_t result = 0x437972746E756F63;
      break;
    case 3:
      unint64_t result = 0x614E746565727473;
      break;
    case 4:
      unint64_t result = 0x6441746565727473;
      break;
    case 5:
      unint64_t result = 0x7974696C61636F6CLL;
      break;
    case 6:
      unint64_t result = 0x646F436574617473;
      break;
    case 7:
      unint64_t result = 0x6F436C6174736F70;
      break;
    case 8:
      unint64_t result = 0x6B72616D646E616CLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0xD000000000000015;
      break;
    case 11:
      unint64_t result = 0x6E49664F61657261;
      break;
    case 12:
      unint64_t result = 0xD000000000000011;
      break;
    case 13:
    case 14:
    case 15:
    case 17:
      unint64_t result = 0xD000000000000013;
      break;
    case 16:
      unint64_t result = 0xD000000000000012;
      break;
    case 18:
      unint64_t result = 0xD000000000000012;
      break;
    case 19:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21CB7C910(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_21CB7C6C8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_21CB7C6C8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21CB88F50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21CB7C99C()
{
  char v1 = *v0;
  sub_21CB89050();
  sub_21CB7C6C8(v1);
  sub_21CB88380();
  swift_bridgeObjectRelease();
  return sub_21CB89090();
}

uint64_t sub_21CB7CA00()
{
  sub_21CB7C6C8(*v0);
  sub_21CB88380();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB7CA54()
{
  char v1 = *v0;
  sub_21CB89050();
  sub_21CB7C6C8(v1);
  sub_21CB88380();
  swift_bridgeObjectRelease();
  return sub_21CB89090();
}

uint64_t sub_21CB7CAB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB7E674();
  *a1 = result;
  return result;
}

unint64_t sub_21CB7CAE4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_21CB7C6C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21CB7CB10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB7E674();
  *a1 = result;
  return result;
}

void sub_21CB7CB38(unsigned char *a1@<X8>)
{
  *a1 = 20;
}

uint64_t sub_21CB7CB44(uint64_t a1)
{
  unint64_t v2 = sub_21CA61070();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FMFAddress.displayAddressWithStreetName.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[5];
  if (*v0 && *(void *)(v1 + 16)) {
    uint64_t v2 = *(void *)(v1 + 32);
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FMFAddress.displayAddressWithoutStreetName.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[7];
  if (*v0 && *(void *)(v1 + 16) >= 2uLL) {
    uint64_t v2 = *(void *)(v1 + 48);
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FMFAddress.formattedAddress.getter()
{
  uint64_t v3 = *v0;
  uint64_t v2 = v0 + 1;
  uint64_t v1 = v3;
  if (!v3 || !*(void *)(v1 + 16))
  {
    memcpy(v10, v2, sizeof(v10));
    id v5 = FMFAddress.postalAddress.getter();
    uint64_t v6 = _s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0((uint64_t)v5);

    if (v6)
    {
      if (v6[2])
      {
        sub_21CA57E34(&qword_267C94E60);
        sub_21CB7E930();
        uint64_t v4 = sub_21CB88290();
        swift_bridgeObjectRelease();
        return v4;
      }
      swift_bridgeObjectRelease();
    }
    type metadata accessor for FMLocalize();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v4 = sub_21CB872B0();

    return v4;
  }
  sub_21CA57E34(&qword_267C94E60);
  sub_21CB7E930();
  return sub_21CB88290();
}

id FMFAddress.postalAddress.getter()
{
  uint64_t v1 = v0[2];
  uint64_t v20 = v0[4];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[18];
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB18]), sel_init);
  if (v2)
  {
    id v8 = (void *)sub_21CB882C0();
    objc_msgSend(v7, sel_setStreet_, v8);
  }
  if (v3)
  {
    uint64_t v9 = (void *)sub_21CB882C0();
    objc_msgSend(v7, sel_setCity_, v9);
  }
  if (!v4)
  {
LABEL_13:
    if (!v6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v10 = objc_msgSend(v7, sel_city);
  uint64_t v11 = sub_21CB882F0();
  uint64_t v13 = v12;

  if (v5 == v11 && v4 == v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v15 = sub_21CB88F50();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v16 = (void *)sub_21CB882C0();
  objc_msgSend(v7, sel_setState_, v16);

LABEL_15:
  if (v1)
  {
    uint64_t v17 = (void *)sub_21CB882C0();
    objc_msgSend(v7, sel_setCountry_, v17);
  }
  if (v20)
  {
    uint64_t v18 = (void *)sub_21CB882C0();
    objc_msgSend(v7, sel_setISOCountryCode_, v18);
  }
  return v7;
}

void FMFAddress.levelType.getter(unsigned char *a1@<X8>)
{
  unint64_t v2 = v1[2];
  unint64_t v3 = v1[8];
  unint64_t v4 = v1[10];
  unint64_t v5 = v1[18];
  if (v3 && ((v3 & 0x2000000000000000) != 0 ? (uint64_t v6 = HIBYTE(v3) & 0xF) : (uint64_t v6 = v1[7] & 0xFFFFFFFFFFFFLL), v6))
  {
    *a1 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_15;
    }
    uint64_t v7 = v1[9] & 0xFFFFFFFFFFFFLL;
    if ((v4 & 0x2000000000000000) != 0) {
      uint64_t v7 = HIBYTE(v4) & 0xF;
    }
    if (v7)
    {
      *a1 = 2;
    }
    else
    {
      if (!v5) {
        goto LABEL_20;
      }
LABEL_15:
      uint64_t v8 = v1[17] & 0xFFFFFFFFFFFFLL;
      if ((v5 & 0x2000000000000000) != 0) {
        uint64_t v8 = HIBYTE(v5) & 0xF;
      }
      if (v8)
      {
        *a1 = 3;
      }
      else
      {
        if (!v2) {
          goto LABEL_22;
        }
LABEL_20:
        uint64_t v9 = v1[1] & 0xFFFFFFFFFFFFLL;
        if ((v2 & 0x2000000000000000) != 0) {
          uint64_t v9 = HIBYTE(v2) & 0xF;
        }
        if (v9) {
          *a1 = 4;
        }
        else {
LABEL_22:
        }
          *a1 = 0;
      }
    }
  }
}

double FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, uint64_t a15, long long a16, uint64_t a17)
{
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
  *(void *)(a9 + 152) = 0;
  *(void *)(a9 + 160) = 0;
  *(void *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(void *)(a9 + 184) = a17;
  double result = 0.0;
  *(_OWORD *)(a9 + 272) = 0u;
  *(_OWORD *)(a9 + 288) = 0u;
  *(_OWORD *)(a9 + 240) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 208) = 0u;
  *(_OWORD *)(a9 + 224) = 0u;
  *(_OWORD *)(a9 + 192) = 0u;
  return result;
}

double FMFAddress.init(formattedAddressLines:country:countryCode:streetName:streetAddress:locality:stateCode:postalCode:landmark:administrativeArea:areaOfInterest:fullThoroughfare:mapFormattedAddress:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, uint64_t a15, long long a16, long long a17, uint64_t a18)
{
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
  *(void *)(a9 + 152) = 0;
  *(void *)(a9 + 160) = 0;
  *(void *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 168) = a16;
  *(_OWORD *)(a9 + 184) = a17;
  *(void *)(a9 + 200) = a18;
  double result = 0.0;
  *(_OWORD *)(a9 + 272) = 0u;
  *(_OWORD *)(a9 + 288) = 0u;
  *(_OWORD *)(a9 + 240) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 208) = 0u;
  *(_OWORD *)(a9 + 224) = 0u;
  return result;
}

uint64_t FMFAddress.encode(to:)(void *a1)
{
  uint64_t v3 = sub_21CA57E34(&qword_267C97B10);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v60 = v1[2];
  uint64_t v61 = v7;
  uint64_t v9 = v1[3];
  uint64_t v58 = v1[4];
  uint64_t v59 = v9;
  uint64_t v10 = v1[5];
  uint64_t v56 = v1[6];
  uint64_t v57 = v10;
  uint64_t v11 = v1[8];
  uint64_t v54 = v1[7];
  uint64_t v55 = v11;
  uint64_t v12 = v1[10];
  uint64_t v52 = v1[9];
  uint64_t v53 = v12;
  uint64_t v13 = v1[12];
  uint64_t v50 = v1[11];
  uint64_t v51 = v13;
  uint64_t v14 = v1[13];
  uint64_t v48 = v1[14];
  uint64_t v49 = v14;
  uint64_t v15 = v1[15];
  uint64_t v46 = v1[16];
  uint64_t v47 = v15;
  uint64_t v16 = v1[17];
  uint64_t v44 = v1[18];
  uint64_t v45 = v16;
  uint64_t v43 = v1[19];
  uint64_t v42 = v1[20];
  uint64_t v41 = v1[21];
  uint64_t v40 = v1[22];
  uint64_t v39 = v1[23];
  uint64_t v38 = v1[24];
  uint64_t v37 = v1[25];
  uint64_t v36 = v1[26];
  uint64_t v35 = v1[27];
  uint64_t v34 = v1[28];
  uint64_t v33 = v1[29];
  uint64_t v32 = v1[30];
  uint64_t v31 = v1[31];
  uint64_t v28 = v1[32];
  uint64_t v27 = v1[33];
  uint64_t v30 = v1[34];
  uint64_t v29 = v1[35];
  uint64_t v17 = v1[37];
  uint64_t v26 = v1[36];
  sub_21CA2B2CC(a1, a1[3]);
  sub_21CA61070();
  sub_21CB890C0();
  uint64_t v63 = v8;
  char v65 = 0;
  sub_21CA57E34(&qword_267C95130);
  sub_21CA4A5B4();
  uint64_t v18 = v62;
  sub_21CB88EB0();
  if (v18) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v20 = v58;
  uint64_t v19 = v59;
  uint64_t v21 = v57;
  uint64_t v25 = v17;
  uint64_t v62 = v4;
  uint64_t v63 = v61;
  uint64_t v64 = v60;
  char v65 = 1;
  uint64_t v22 = sub_21CA57E34((uint64_t *)&unk_267C95220);
  sub_21CA4A500((unint64_t *)&qword_267C94A70, (uint64_t *)&unk_267C95220);
  sub_21CB88EB0();
  uint64_t v63 = v19;
  uint64_t v64 = v20;
  char v65 = 2;
  sub_21CB88EB0();
  uint64_t v63 = v21;
  uint64_t v64 = v56;
  char v65 = 3;
  uint64_t v61 = v22;
  sub_21CB88EB0();
  uint64_t v63 = v54;
  uint64_t v64 = v55;
  char v65 = 4;
  sub_21CB88EB0();
  uint64_t v63 = v52;
  uint64_t v64 = v53;
  char v65 = 5;
  sub_21CB88EB0();
  uint64_t v63 = v50;
  uint64_t v64 = v51;
  char v65 = 6;
  sub_21CB88EB0();
  uint64_t v63 = v49;
  uint64_t v64 = v48;
  char v65 = 7;
  sub_21CB88EB0();
  uint64_t v63 = v47;
  uint64_t v64 = v46;
  char v65 = 8;
  sub_21CB88EB0();
  uint64_t v63 = v45;
  uint64_t v64 = v44;
  char v65 = 9;
  sub_21CB88EB0();
  uint64_t v63 = v43;
  uint64_t v64 = v42;
  char v65 = 10;
  sub_21CB88EB0();
  uint64_t v63 = v41;
  char v65 = 11;
  sub_21CA57E34(&qword_267C94E60);
  sub_21CA4A500(&qword_267C95140, &qword_267C94E60);
  sub_21CB88EB0();
  uint64_t v63 = v40;
  uint64_t v64 = v39;
  char v65 = 12;
  sub_21CB88EB0();
  uint64_t v63 = v38;
  uint64_t v64 = v37;
  char v65 = 13;
  sub_21CB88EB0();
  uint64_t v63 = v36;
  uint64_t v64 = v35;
  char v65 = 14;
  sub_21CB88EB0();
  uint64_t v63 = v34;
  uint64_t v64 = v33;
  char v65 = 15;
  sub_21CB88EB0();
  uint64_t v63 = v32;
  uint64_t v64 = v31;
  char v65 = 16;
  sub_21CB88EB0();
  uint64_t v63 = v28;
  uint64_t v64 = v27;
  char v65 = 17;
  sub_21CB88EB0();
  uint64_t v63 = v30;
  uint64_t v64 = v29;
  char v65 = 18;
  sub_21CB88EB0();
  uint64_t v63 = v26;
  uint64_t v64 = v25;
  char v65 = 19;
  sub_21CB88EB0();
  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v6, v3);
}

uint64_t sub_21CB7DD68(void *a1)
{
  return FMFAddress.encode(to:)(a1);
}

uint64_t _s7FMFCore10FMFAddressV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  uint64_t v139 = *(void *)(a1 + 88);
  uint64_t v142 = *(void *)(a1 + 96);
  uint64_t v136 = *(void *)(a1 + 104);
  uint64_t v141 = *(void *)(a1 + 112);
  uint64_t v132 = *(void *)(a1 + 120);
  uint64_t v137 = *(void *)(a1 + 128);
  uint64_t v128 = *(void *)(a1 + 136);
  uint64_t v134 = *(void *)(a1 + 144);
  uint64_t v126 = *(void *)(a1 + 152);
  uint64_t v130 = *(void *)(a1 + 160);
  uint64_t v124 = *(void **)(a1 + 168);
  uint64_t v118 = *(void *)(a1 + 176);
  uint64_t v122 = *(void *)(a1 + 184);
  uint64_t v114 = *(void *)(a1 + 192);
  uint64_t v119 = *(void *)(a1 + 200);
  uint64_t v110 = *(void *)(a1 + 208);
  uint64_t v116 = *(void *)(a1 + 216);
  uint64_t v107 = *(void *)(a1 + 224);
  uint64_t v112 = *(void *)(a1 + 232);
  uint64_t v103 = *(void *)(a1 + 240);
  uint64_t v108 = *(void *)(a1 + 248);
  uint64_t v99 = *(void *)(a1 + 256);
  uint64_t v104 = *(void *)(a1 + 264);
  uint64_t v95 = *(void *)(a1 + 272);
  uint64_t v100 = *(void *)(a1 + 280);
  uint64_t v93 = *(void *)(a1 + 288);
  *(void *)&long long v96 = *(void *)(a1 + 296);
  uint64_t v15 = *(void **)a2;
  uint64_t v14 = *(void *)(a2 + 8);
  uint64_t v17 = *(void *)(a2 + 16);
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v19 = *(void *)(a2 + 32);
  uint64_t v18 = *(void *)(a2 + 40);
  uint64_t v21 = *(void *)(a2 + 48);
  uint64_t v20 = *(void *)(a2 + 56);
  uint64_t v22 = *(void *)(a2 + 64);
  uint64_t v23 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 80);
  uint64_t v24 = *(void *)(a2 + 88);
  uint64_t v26 = *(void *)(a2 + 96);
  uint64_t v135 = *(void *)(a2 + 104);
  uint64_t v140 = *(void *)(a2 + 112);
  uint64_t v131 = *(void *)(a2 + 120);
  uint64_t v138 = *(void *)(a2 + 128);
  uint64_t v127 = *(void *)(a2 + 136);
  uint64_t v133 = *(void *)(a2 + 144);
  uint64_t v125 = *(void *)(a2 + 152);
  uint64_t v129 = *(void *)(a2 + 160);
  uint64_t v123 = *(void **)(a2 + 168);
  uint64_t v117 = *(void *)(a2 + 176);
  uint64_t v121 = *(void *)(a2 + 184);
  uint64_t v113 = *(void *)(a2 + 192);
  uint64_t v120 = *(void *)(a2 + 200);
  uint64_t v109 = *(void *)(a2 + 208);
  uint64_t v115 = *(void *)(a2 + 216);
  uint64_t v105 = *(void *)(a2 + 224);
  uint64_t v111 = *(void *)(a2 + 232);
  uint64_t v101 = *(void *)(a2 + 240);
  uint64_t v106 = *(void *)(a2 + 248);
  uint64_t v97 = *(void *)(a2 + 256);
  uint64_t v102 = *(void *)(a2 + 264);
  uint64_t v94 = *(void *)(a2 + 272);
  uint64_t v98 = *(void *)(a2 + 280);
  uint64_t v92 = *(void *)(a2 + 288);
  *((void *)&v96 + 1) = *(void *)(a2 + 296);
  if (v3)
  {
    if (!v15) {
      return 0;
    }
    uint64_t v78 = *(void *)(a2 + 72);
    uint64_t v80 = v9;
    uint64_t v74 = v11;
    uint64_t v76 = *(void *)(a2 + 80);
    uint64_t v83 = v10;
    uint64_t v86 = *(void *)(a2 + 48);
    uint64_t v71 = *(void *)(a2 + 96);
    uint64_t v72 = *(void *)(a2 + 88);
    uint64_t v69 = *(void *)(a2 + 16);
    uint64_t v70 = v13;
    uint64_t v27 = v12;
    uint64_t v89 = *(void *)(a2 + 64);
    uint64_t v28 = v8;
    uint64_t v29 = *(void *)(a2 + 56);
    uint64_t v68 = v7;
    uint64_t v30 = v6;
    uint64_t v31 = *(void *)(a2 + 40);
    uint64_t v32 = v4;
    uint64_t v33 = v5;
    uint64_t v34 = *(void *)(a2 + 32);
    uint64_t v35 = *(void *)(a2 + 24);
    uint64_t v36 = *(void *)(a2 + 8);
    char v37 = sub_21CA4C01C(v3, v15);
    uint64_t v14 = v36;
    uint64_t v16 = v35;
    uint64_t v19 = v34;
    uint64_t v5 = v33;
    uint64_t v4 = v32;
    uint64_t v18 = v31;
    uint64_t v6 = v30;
    uint64_t v7 = v68;
    uint64_t v17 = v69;
    uint64_t v20 = v29;
    uint64_t v8 = v28;
    uint64_t v21 = v86;
    uint64_t v22 = v89;
    uint64_t v12 = v27;
    uint64_t v13 = v70;
    uint64_t v26 = v71;
    uint64_t v24 = v72;
    uint64_t v11 = v74;
    uint64_t v9 = v80;
    uint64_t v10 = v83;
    uint64_t v25 = v76;
    uint64_t v23 = v78;
    if ((v37 & 1) == 0) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  if (v4)
  {
    if (!v17) {
      return 0;
    }
    if (v5 != v14 || v4 != v17)
    {
      uint64_t v81 = v20;
      uint64_t v84 = v12;
      uint64_t v87 = v21;
      uint64_t v90 = v22;
      uint64_t v73 = v16;
      uint64_t v75 = v19;
      uint64_t v38 = v8;
      uint64_t v77 = v18;
      uint64_t v79 = v6;
      char v39 = sub_21CB88F50();
      uint64_t v16 = v73;
      uint64_t v19 = v75;
      uint64_t v18 = v77;
      uint64_t v6 = v79;
      uint64_t v20 = v81;
      uint64_t v12 = v84;
      uint64_t v8 = v38;
      uint64_t v21 = v87;
      uint64_t v22 = v90;
      char v40 = v39;
      uint64_t result = 0;
      if ((v40 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v17)
  {
    return 0;
  }
  if (v7)
  {
    if (!v19) {
      return 0;
    }
    if (v6 != v16 || v7 != v19)
    {
      uint64_t v82 = v20;
      uint64_t v85 = v10;
      uint64_t v88 = v21;
      uint64_t v91 = v22;
      uint64_t v42 = v12;
      uint64_t v43 = v8;
      uint64_t v44 = v18;
      char v45 = sub_21CB88F50();
      uint64_t v18 = v44;
      uint64_t v8 = v43;
      uint64_t v21 = v88;
      uint64_t v22 = v91;
      uint64_t v12 = v42;
      uint64_t v20 = v82;
      uint64_t v10 = v85;
      char v46 = v45;
      uint64_t result = 0;
      if ((v46 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v19)
  {
    return 0;
  }
  if (v8)
  {
    if (!v21) {
      return 0;
    }
    if (v9 != v18 || v8 != v21)
    {
      uint64_t v47 = v20;
      uint64_t v48 = v10;
      uint64_t v49 = v12;
      char v50 = sub_21CB88F50();
      uint64_t v20 = v47;
      uint64_t v12 = v49;
      uint64_t v10 = v48;
      char v51 = v50;
      uint64_t result = 0;
      if ((v51 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v21)
  {
    return 0;
  }
  if (v10)
  {
    if (!v22) {
      return 0;
    }
    if (v11 != v20 || v10 != v22)
    {
      uint64_t v52 = v12;
      char v53 = sub_21CB88F50();
      uint64_t v12 = v52;
      char v54 = v53;
      uint64_t result = 0;
      if ((v54 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v22)
  {
    return 0;
  }
  if (v13)
  {
    if (!v25) {
      return 0;
    }
    if (v12 != v23 || v13 != v25)
    {
      char v55 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v55 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v25)
  {
    return 0;
  }
  if (v142)
  {
    if (!v26) {
      return 0;
    }
    if (v139 != v24 || v142 != v26)
    {
      char v56 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v56 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v26)
  {
    return 0;
  }
  if (v141)
  {
    if (!v140) {
      return 0;
    }
    if (v136 != v135 || v141 != v140)
    {
      char v57 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v57 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v140)
  {
    return 0;
  }
  if (v137)
  {
    if (!v138) {
      return 0;
    }
    if (v132 != v131 || v137 != v138)
    {
      char v58 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v58 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v138)
  {
    return 0;
  }
  if (v134)
  {
    if (!v133) {
      return 0;
    }
    if (v128 != v127 || v134 != v133)
    {
      char v59 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v59 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v133)
  {
    return 0;
  }
  if (v130)
  {
    if (!v129) {
      return 0;
    }
    if (v126 != v125 || v130 != v129)
    {
      char v60 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v60 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v129)
  {
    return 0;
  }
  if ((sub_21CA4C01C(v124, v123) & 1) == 0) {
    return 0;
  }
  if (v122)
  {
    if (!v121) {
      return 0;
    }
    if (v118 != v117 || v122 != v121)
    {
      char v61 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v61 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v121)
  {
    return 0;
  }
  if (v119)
  {
    if (!v120) {
      return 0;
    }
    if (v114 != v113 || v119 != v120)
    {
      char v62 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v62 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v120)
  {
    return 0;
  }
  if (v116)
  {
    if (!v115) {
      return 0;
    }
    if (v110 != v109 || v116 != v115)
    {
      char v63 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v63 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v115)
  {
    return 0;
  }
  if (v112)
  {
    if (!v111) {
      return 0;
    }
    if (v107 != v105 || v112 != v111)
    {
      char v64 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v64 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v111)
  {
    return 0;
  }
  if (v108)
  {
    if (!v106) {
      return 0;
    }
    if (v103 != v101 || v108 != v106)
    {
      char v65 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v65 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v106)
  {
    return 0;
  }
  if (v104)
  {
    if (!v102) {
      return 0;
    }
    if (v99 != v97 || v104 != v102)
    {
      char v66 = sub_21CB88F50();
      uint64_t result = 0;
      if ((v66 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v102)
  {
    return 0;
  }
  if (v100)
  {
    if (v98)
    {
      if (v95 != v94 || v100 != v98)
      {
        char v67 = sub_21CB88F50();
        uint64_t result = 0;
        if ((v67 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_128;
    }
    return 0;
  }
  if (v98) {
    return 0;
  }
LABEL_128:
  uint64_t result = v96 == 0;
  if ((void)v96 && *((void *)&v96 + 1))
  {
    if (v93 == v92 && (void)v96 == *((void *)&v96 + 1))
    {
      return 1;
    }
    else
    {
      return sub_21CB88F50();
    }
  }
  return result;
}

uint64_t sub_21CB7E674()
{
  unint64_t v0 = sub_21CB88F80();
  swift_bridgeObjectRelease();
  if (v0 >= 0x14) {
    return 20;
  }
  else {
    return v0;
  }
}

void *_s7FMFCore10FMFAddressV21formattedAddressLines3forSaySSGSgSo08CNPostalD0C_tFZ_0(uint64_t a1)
{
  uint64_t v24 = sub_21CB87280();
  uint64_t v2 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(self, sel_stringFromPostalAddress_style_, a1, 0);
  uint64_t v6 = sub_21CB882F0();
  uint64_t v8 = v7;

  uint64_t v27 = v6;
  uint64_t v28 = v8;
  uint64_t v25 = 10;
  unint64_t v26 = 0xE100000000000000;
  sub_21CA4D63C();
  uint64_t v9 = sub_21CB889E0();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v23 = v9;
    uint64_t v12 = (uint64_t *)(v9 + 40);
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v14 = *v12;
      uint64_t v27 = *(v12 - 1);
      uint64_t v28 = v14;
      swift_bridgeObjectRetain();
      sub_21CB87230();
      uint64_t v15 = sub_21CB88A00();
      unint64_t v17 = v16;
      (*v11)(v4, v24);
      swift_bridgeObjectRelease();
      uint64_t v18 = HIBYTE(v17) & 0xF;
      if ((v17 & 0x2000000000000000) == 0) {
        uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
      }
      if (v18)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v13 = sub_21CAC7864(0, v13[2] + 1, 1, v13);
        }
        unint64_t v20 = v13[2];
        unint64_t v19 = v13[3];
        if (v20 >= v19 >> 1) {
          uint64_t v13 = sub_21CAC7864((void *)(v19 > 1), v20 + 1, 1, v13);
        }
        v13[2] = v20 + 1;
        uint64_t v21 = &v13[2 * v20];
        v21[4] = v15;
        v21[5] = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v12 += 2;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v13;
}

unint64_t sub_21CB7E930()
{
  unint64_t result = qword_267C97120;
  if (!qword_267C97120)
  {
    sub_21CA5EEBC(&qword_267C94E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267C97120);
  }
  return result;
}

unint64_t sub_21CB7E990()
{
  unint64_t result = qword_267C97B18;
  if (!qword_267C97B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97B18);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FMFAddressLevelType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21CB7EAB0);
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

ValueMetadata *type metadata accessor for FMFAddressLevelType()
{
  return &type metadata for FMFAddressLevelType;
}

void *assignWithCopy for FMFAddress(void *a1, void *a2)
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
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  a1[18] = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[19] = a2[19];
  a1[20] = a2[20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[21] = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[22] = a2[22];
  a1[23] = a2[23];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[24] = a2[24];
  a1[25] = a2[25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[26] = a2[26];
  a1[27] = a2[27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[28] = a2[28];
  a1[29] = a2[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[30] = a2[30];
  a1[31] = a2[31];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[32] = a2[32];
  a1[33] = a2[33];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[34] = a2[34];
  a1[35] = a2[35];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[36] = a2[36];
  a1[37] = a2[37];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for FMFAddress(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x130uLL);
}

uint64_t assignWithTake for FMFAddress(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_21CB7EF24()
{
  unint64_t result = qword_267C97B20;
  if (!qword_267C97B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97B20);
  }
  return result;
}

uint64_t type metadata accessor for FMFRemoveFriendRequest()
{
  uint64_t result = qword_267C97B38;
  if (!qword_267C97B38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21CB7EFC4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21CB7F010()
{
  uint64_t v1 = *(void *)(v0 + qword_267CA5450);
  uint64_t v2 = *(void *)(v0 + qword_267CA5450 + 8);
  v4[3] = MEMORY[0x263F8D310];
  v4[0] = v1;
  v4[1] = v2;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21CA3769C((uint64_t)v4, 25705, 0xE200000000000000);
  return swift_endAccess();
}

uint64_t sub_21CB7F098()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB7F0AC()
{
  uint64_t v0 = sub_21CB87730();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + qword_267CA51F8;
  uint64_t v2 = sub_21CB87590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21CB7F194()
{
  sub_21CB7F0AC();

  return swift_deallocClassInstance();
}

uint64_t sub_21CB7F1E8()
{
  return type metadata accessor for FMFRemoveFriendRequest();
}

uint64_t sub_21CB7F1F0(unsigned __int8 *a1, char *a2)
{
  return sub_21CA7FD0C(*a1, *a2);
}

uint64_t sub_21CB7F1FC()
{
  return sub_21CB89090();
}

uint64_t sub_21CB7F318()
{
  sub_21CB88380();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB7F41C()
{
  return sub_21CB89090();
}

uint64_t sub_21CB7F534@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB7F980();
  *a1 = result;
  return result;
}

void sub_21CB7F564(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x7472656C61;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xED0000747865746ELL;
      uint64_t v3 = 0x6F43726576726573;
      goto LABEL_3;
    case 2:
      *a1 = 0x746E6F4361746164;
      a1[1] = 0xEB00000000747865;
      break;
    case 3:
      *a1 = 0x6174536863746566;
      a1[1] = 0xEB00000000737574;
      break;
    case 4:
      *a1 = 0x52646E616D6D6F63;
      a1[1] = 0xEF65736E6F707365;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_21CB7F658@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB7F980();
  *a1 = result;
  return result;
}

void sub_21CB7F680(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_21CB7F68C(uint64_t a1)
{
  unint64_t v2 = sub_21CA2ABB0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_21CB7F6C8(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_21CA2A458(a1);
  return v2;
}

uint64_t sub_21CB7F718()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21CA191E0(v0 + OBJC_IVAR____TtC7FMFCore15FMFBaseResponse_commandResponse);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_21CB7F79C()
{
  return type metadata accessor for FMFBaseResponse();
}

unsigned char *storeEnumTagSinglePayload for FMFBaseResponseError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x21CB7F870);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMFBaseResponseError()
{
  return &type metadata for FMFBaseResponseError;
}

unint64_t sub_21CB7F8D4()
{
  unint64_t result = qword_267C97B80;
  if (!qword_267C97B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97B80);
  }
  return result;
}

unint64_t sub_21CB7F92C()
{
  unint64_t result = qword_267C97B88;
  if (!qword_267C97B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97B88);
  }
  return result;
}

uint64_t sub_21CB7F980()
{
  unint64_t v0 = sub_21CB88D70();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t type metadata accessor for FMFUpdateLocationAlertRequest()
{
  uint64_t result = qword_267C97BA0;
  if (!qword_267C97BA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21CB7FA18()
{
  uint64_t result = type metadata accessor for FMFLocationAlert();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21CB7FAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = sub_21CA57E34(&qword_267C96AD0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LiveRelabilityStats(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_21CA1B88C(a1, &qword_267C96AD0);
    sub_21CB804A8(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_21CA1B88C((uint64_t)v10, &qword_267C96AD0);
  }
  else
  {
    sub_21CA5920C(a1, (uint64_t)v13, type metadata accessor for LiveRelabilityStats);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    sub_21CB83F54((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *unsigned int v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21CB7FC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = sub_21CA57E34(&qword_267C97190);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21CA57E34(&qword_267C97188);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_21CA1B88C(a1, &qword_267C97190);
    sub_21CB80878(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_21CA1B88C((uint64_t)v10, &qword_267C97190);
  }
  else
  {
    sub_21CB865A4(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    sub_21CB84154((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *unsigned int v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21CB7FE40()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  sub_21CB87220();
  swift_allocObject();
  sub_21CB87210();
  type metadata accessor for FMFLocationAlert();
  sub_21CB8025C();
  uint64_t v0 = sub_21CB87200();
  unint64_t v2 = v1;
  swift_release();
  int v3 = self;
  unsigned int v4 = (void *)sub_21CB874B0();
  v10[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 0, v10);

  id v6 = v10[0];
  if (v5)
  {
    sub_21CB88A40();
    swift_unknownObjectRelease();
    sub_21CA38B20(v11, v12);
    sub_21CA4E524((uint64_t)v12, (uint64_t)v11);
    sub_21CA57E34(&qword_267C955B0);
    if (swift_dynamicCast())
    {
      sub_21CB8637C((uint64_t)v10[0], (void (*)(uint64_t, uint64_t, unsigned char *))sub_21CB802B4);
      sub_21CA36618(v0, v2);
      sub_21CA2B0D0((uint64_t)v12);
      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_21CA36618(v0, v2);
      return sub_21CA2B0D0((uint64_t)v12);
    }
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = (void *)sub_21CB87400();

    swift_willThrow();
    return sub_21CA36618(v0, v2);
  }
}

uint64_t sub_21CB80098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21CA4E524(a3, (uint64_t)v6);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21CA3769C((uint64_t)v6, a1, a2);
  return swift_endAccess();
}

uint64_t sub_21CB80124()
{
  return sub_21CA7DF00(v0 + qword_267CA5480);
}

uint64_t sub_21CB80134()
{
  uint64_t v0 = sub_21CB87730();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + qword_267CA51F8;
  uint64_t v2 = sub_21CB87590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_21CA7DF00(v0 + qword_267CA5480);

  return swift_deallocClassInstance();
}

uint64_t sub_21CB80254()
{
  return type metadata accessor for FMFUpdateLocationAlertRequest();
}

unint64_t sub_21CB8025C()
{
  unint64_t result = qword_267C95A60;
  if (!qword_267C95A60)
  {
    type metadata accessor for FMFLocationAlert();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C95A60);
  }
  return result;
}

uint64_t sub_21CB802B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21CB80098(a1, a2, a3);
}

uint64_t sub_21CB802BC(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *int v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21CB84AC4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_21CB82D40(v6, v9);
  *int v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_21CB803A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CA38B30();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21CA38B20((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_21CB82F18(v8, v11);
    *unsigned int v4 = v11;
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

uint64_t sub_21CB804A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CB85028(type metadata accessor for LiveRelabilityStats, &qword_267C97C00, type metadata accessor for LiveRelabilityStats);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for LiveRelabilityStats(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_21CA5920C(v12 + *(void *)(v20 + 72) * v8, a3, type metadata accessor for LiveRelabilityStats);
    sub_21CA484EC(v8, v11, type metadata accessor for LiveRelabilityStats);
    *unsigned int v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for LiveRelabilityStats(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_21CB80690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CB85028(type metadata accessor for ShallowRelabilityStats, &qword_267C97C08, type metadata accessor for ShallowRelabilityStats);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for ShallowRelabilityStats(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_21CA5920C(v12 + *(void *)(v20 + 72) * v8, a3, type metadata accessor for ShallowRelabilityStats);
    sub_21CA484EC(v8, v11, type metadata accessor for ShallowRelabilityStats);
    *unsigned int v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for ShallowRelabilityStats(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_21CB80878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CB8529C();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_21CA57E34(&qword_267C97188);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_21CB865A4(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_21CB832D0(v8, v11);
    *unsigned int v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_21CA57E34(&qword_267C97188);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_21CB80A10(uint64_t a1, uint64_t a2)
{
  return sub_21CB80CFC(a1, a2, &qword_267C97C18);
}

uint64_t sub_21CB80A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CB85028((uint64_t (*)(void))type metadata accessor for FMFFriend, &qword_267C97BB8, (uint64_t (*)(void))type metadata accessor for FMFFriend);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for FMFFriend();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_21CA5920C(v12 + *(void *)(v20 + 72) * v8, a3, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    sub_21CA484EC(v8, v11, (uint64_t (*)(void))type metadata accessor for FMFFriend);
    *unsigned int v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for FMFFriend();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

double sub_21CB80C04@<D0>(unsigned __int8 a1@<W0>, _OWORD *a2@<X8>)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21CA34A58(a1);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t v12 = *v3;
    *int v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21CB85CB4();
      uint64_t v10 = v12;
    }
    sub_21CA38B20((_OWORD *)(*(void *)(v10 + 56) + 32 * v6), a2);
    sub_21CB83508(v6, v10);
    *int v3 = v10;
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

uint64_t sub_21CB80CF0(uint64_t a1, uint64_t a2)
{
  return sub_21CB80CFC(a1, a2, &qword_267C97BC8);
}

uint64_t sub_21CB80CFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  uint64_t *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21CB85E74(a3);
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_21CB838B4(v8, v11);
  uint64_t *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_21CB80DDC(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21CA5BCE0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *int v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21CB861C4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_21CB838B4(v6, v9);
  *int v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21CB80EAC(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97AC0);
  char v37 = a2;
  uint64_t v6 = sub_21CB88D30();
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
  uint64_t v34 = v2;
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
          int v3 = v34;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_21CB89050();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v34;
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
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB811B8(uint64_t a1, int a2)
{
  int v3 = v2;
  uint64_t v5 = sub_21CA57E34(&qword_267C97188);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_21CA57E34(&qword_267C97C10);
  int v43 = a2;
  uint64_t v9 = sub_21CB88D30();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  char v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    unint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          int v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_21CB865A4(v30, (uint64_t)v7);
    }
    else
    {
      sub_21CB86674(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_21CB89050();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_21CB865A4((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  int v3 = v39;
  unint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *int v3 = v10;
  return result;
}

uint64_t sub_21CB81560(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97BC0);
  char v40 = a2;
  uint64_t v6 = sub_21CB88D30();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              int v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 56 * v21;
      uint64_t v33 = *(void *)(v32 + 8);
      uint64_t v34 = *(void *)(v32 + 24);
      uint64_t v44 = *(void *)(v32 + 16);
      char v43 = *(unsigned char *)(v32 + 32);
      uint64_t v35 = *(void *)(v32 + 48);
      uint64_t v41 = *(void *)v32;
      uint64_t v42 = *(void *)(v32 + 40);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_21CB89050();
      sub_21CB88380();
      uint64_t result = sub_21CB89090();
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
            goto LABEL_39;
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
      *unint64_t v18 = v30;
      v18[1] = v31;
      uint64_t v19 = *(void *)(v7 + 56) + 56 * v17;
      *(void *)uint64_t v19 = v41;
      *(void *)(v19 + 8) = v33;
      *(void *)(v19 + 16) = v44;
      *(void *)(v19 + 24) = v34;
      *(unsigned char *)(v19 + 32) = v43;
      *(void *)(v19 + 40) = v42;
      *(void *)(v19 + 48) = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB818C0(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97C20);
  char v37 = a2;
  uint64_t v6 = sub_21CB88D30();
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
  uint64_t v34 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
          int v3 = v34;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_21CB89050();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
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
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
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
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB81BCC(uint64_t a1, int a2)
{
  return sub_21CA58D20(a1, a2, (uint64_t (*)(void))type metadata accessor for FMFFriend, &qword_267C97BB8, (uint64_t (*)(void))type metadata accessor for FMFFriend);
}

uint64_t sub_21CB81C00(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97BF0);
  char v40 = a2;
  uint64_t v6 = sub_21CB88D30();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              int v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      uint64_t v33 = *(void *)v32;
      uint64_t v34 = *(void *)(v32 + 8);
      char v35 = *(unsigned char *)(v32 + 16);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_21CB89050();
      sub_21CB88380();
      uint64_t result = sub_21CB89090();
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
            goto LABEL_39;
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
      *unint64_t v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(void *)uint64_t v19 = v33;
      *(void *)(v19 + 8) = v34;
      *(unsigned char *)(v19 + 16) = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB81F28(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97AC8);
  uint64_t v6 = sub_21CB88D30();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_42;
  }
  uint64_t v33 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  swift_retain();
  int64_t v13 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v19 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v20 = v19 | (v13 << 6);
    goto LABEL_31;
  }
  int64_t v21 = v13 + 1;
  if (__OFADD__(v13, 1)) {
    goto LABEL_43;
  }
  if (v21 >= v11)
  {
    swift_release();
    int v3 = v33;
    int64_t v22 = (void *)(v5 + 64);
    if (a2)
    {
LABEL_38:
      uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
      if (v31 >= 64) {
        bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *int64_t v22 = -1 << v31;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v13;
    if (v23) {
      goto LABEL_30;
    }
    int64_t v13 = v21 + 1;
    if (v21 + 1 >= v11) {
      goto LABEL_35;
    }
    unint64_t v23 = *(void *)(v34 + 8 * v13);
    if (v23)
    {
LABEL_30:
      unint64_t v10 = (v23 - 1) & v23;
      unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
      char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
      uint64_t v30 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v20);
      if (a2) {
        sub_21CA38B20(v30, v35);
      }
      else {
        sub_21CA4E524((uint64_t)v30, (uint64_t)v35);
      }
      sub_21CB89050();
      sub_21CB88380();
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_21CB89090();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = v14 & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_8;
      }
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      while (++v17 != v26 || (v25 & 1) == 0)
      {
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
        if (v28 != -1)
        {
          unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
LABEL_8:
          *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
          *(unsigned char *)(*(void *)(v7 + 48) + v18) = v29;
          sub_21CA38B20(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v18));
          ++*(void *)(v7 + 16);
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      JUMPOUT(0x21CB8241CLL);
    }
    int64_t v24 = v21 + 2;
    if (v24 < v11)
    {
      unint64_t v23 = *(void *)(v34 + 8 * v24);
      if (!v23)
      {
        while (1)
        {
          int64_t v13 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_44;
          }
          if (v13 >= v11) {
            goto LABEL_35;
          }
          unint64_t v23 = *(void *)(v34 + 8 * v13);
          ++v24;
          if (v23) {
            goto LABEL_30;
          }
        }
      }
      int64_t v13 = v24;
      goto LABEL_30;
    }
LABEL_35:
    swift_release();
    int v3 = v33;
    if (a2) {
      goto LABEL_38;
    }
  }
LABEL_42:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB82450(uint64_t a1, char a2, uint64_t *a3)
{
  unsigned int v4 = v3;
  uint64_t v6 = *v3;
  sub_21CA57E34(a3);
  char v39 = a2;
  uint64_t v7 = sub_21CB88D30();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unsigned int v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
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
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_21CB89050();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
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
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unsigned int v4 = v36;
  unint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unsigned int v4 = v8;
  return result;
}

uint64_t sub_21CB8275C(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97BD8);
  uint64_t result = sub_21CB88D30();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v30 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v30) {
          goto LABEL_33;
        }
        unint64_t v20 = v31[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v30) {
            goto LABEL_33;
          }
          unint64_t v20 = v31[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v30)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                int v3 = v2;
                goto LABEL_40;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v31 = -1 << v29;
              }
              int v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v31[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v30) {
                  goto LABEL_33;
                }
                unint64_t v20 = v31[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      char v26 = *(unsigned char *)(*(void *)(v5 + 48) + v18);
      unint64_t v27 = *(void **)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        id v28 = v27;
      }
      sub_21CB89050();
      sub_21CB89060();
      uint64_t result = sub_21CB89090();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *int v3 = v7;
  return result;
}

uint64_t sub_21CB82A28(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  sub_21CA57E34(&qword_267C97BE0);
  char v36 = a2;
  uint64_t v6 = sub_21CB88D30();
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
    char v22 = (void *)(v5 + 64);
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
    sub_21CB89050();
    sub_21CB88380();
    uint64_t result = sub_21CB89090();
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
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

unint64_t sub_21CB82D40(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v9 = sub_21CB89090();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21CB82F18(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v10 = sub_21CB89090();
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
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
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

unint64_t sub_21CB830F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v10 = sub_21CB89090();
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
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (32 * v3 != 32 * v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
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

unint64_t sub_21CB832D0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v9 = sub_21CB89090();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        int64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_21CA57E34(&qword_267C97188) - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
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

unint64_t sub_21CB834F0(unint64_t a1, uint64_t a2)
{
  return sub_21CA484EC(a1, a2, (uint64_t (*)(void))type metadata accessor for FMFFriend);
}

unint64_t sub_21CB83508(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        sub_21CB88380();
        swift_bridgeObjectRelease();
        uint64_t result = sub_21CB89090();
        unint64_t v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v3);
          int64_t v13 = (unsigned char *)(v11 + v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 32 * v3);
          int64_t v16 = (_OWORD *)(v14 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 2))
          {
            long long v9 = v16[1];
            *uint64_t v15 = *v16;
            v15[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
    JUMPOUT(0x21CB83880);
  }
  *(void *)(a2 + 16) = v22;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

unint64_t sub_21CB838B4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        swift_bridgeObjectRetain();
        sub_21CB88380();
        uint64_t v9 = sub_21CB89090();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21CB83A8C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21CB88A70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21CB89050();
        sub_21CB89060();
        uint64_t result = sub_21CB89090();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          uint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            void *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *int64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21CB83C48(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21CA5BCE0(a2, a3);
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
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_21CB84C80();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  sub_21CB80EAC(result, a4 & 1);
  uint64_t result = sub_21CA5BCE0(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_21CB88FA0();
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
  BOOL v20 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1 & 1;
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

uint64_t sub_21CB83DB4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, char a7)
{
  unint64_t v8 = (void **)v7;
  uint64_t v15 = (void *)*v7;
  unint64_t v17 = sub_21CA5BCE0(a5, a6);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a7 & 1) != 0)
  {
LABEL_7:
    uint64_t v23 = *v8;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7] + 32 * v17;
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)uint64_t v24 = a1;
      *(void *)(v24 + 8) = a2;
      *(void *)(v24 + 16) = a3;
      *(unsigned char *)(v24 + 24) = a4 & 1;
      *(unsigned char *)(v24 + 25) = BYTE1(a4) & 1;
      *(unsigned char *)(v24 + 26) = BYTE2(a4) & 1;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_21CB84E38();
    goto LABEL_7;
  }
  sub_21CA45798(v20, a7 & 1);
  unint64_t v26 = sub_21CA5BCE0(a5, a6);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_15:
    uint64_t result = sub_21CB88FA0();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = *v8;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  sub_21CB848E4(v17, a5, a6, a1, a2, a3, a4 & 0x10101, v23);

  return swift_bridgeObjectRetain();
}

uint64_t sub_21CB83F54(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_21CA5BCE0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t v20 = type metadata accessor for LiveRelabilityStats(0);
      return sub_21CA5BE3C(a1, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v12, type metadata accessor for LiveRelabilityStats);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21CB85028(type metadata accessor for LiveRelabilityStats, &qword_267C97C00, type metadata accessor for LiveRelabilityStats);
    goto LABEL_7;
  }
  sub_21CA58D20(v15, a4 & 1, type metadata accessor for LiveRelabilityStats, &qword_267C97C00, type metadata accessor for LiveRelabilityStats);
  unint64_t v22 = sub_21CA5BCE0(a2, a3);
  if ((v16 & 1) != (v23 & 1))
  {
LABEL_15:
    uint64_t result = sub_21CB88FA0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v22;
  uint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_21CA5C728(v12, a2, a3, a1, v18, type metadata accessor for LiveRelabilityStats, type metadata accessor for LiveRelabilityStats);

  return swift_bridgeObjectRetain();
}

void sub_21CB84148(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

uint64_t sub_21CB84154(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_21CA5BCE0(a2, a3);
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
      sub_21CB8529C();
      goto LABEL_7;
    }
    sub_21CB811B8(v15, a4 & 1);
    unint64_t v22 = sub_21CA5BCE0(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_21CB88FA0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(sub_21CA57E34(&qword_267C97188) - 8) + 72) * v12;
    return sub_21CB8660C(a1, v20);
  }
LABEL_13:
  sub_21CB8494C(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

void sub_21CB842BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_21CB842C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_21CA5BCE0(a2, a3);
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
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_21CB85E74(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_21CB82450(v17, a4 & 1, a5);
  unint64_t v22 = sub_21CA5BCE0(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_21CB88FA0();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  swift_bridgeObjectRetain();
}

uint64_t sub_21CB84450(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21CA5BCE0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21CB8550C();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 56 * v12;
      return sub_21CB86548(a1, v19);
    }
    goto LABEL_13;
  }
  sub_21CB81560(v15, a4 & 1);
  unint64_t v21 = sub_21CA5BCE0(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_21CB88FA0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 56 * v12;
  long long v25 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 16);
  long long v27 = *(_OWORD *)(a1 + 32);
  *(void *)(v24 + 48) = *(void *)(a1 + 48);
  *(_OWORD *)(v24 + 16) = v26;
  *(_OWORD *)(v24 + 32) = v27;
  *(_OWORD *)uint64_t v24 = v25;
  uint64_t v28 = v18[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v30;

  return swift_bridgeObjectRetain();
}

void sub_21CB845E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_21CB845F4(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  char v7 = a2 & 1;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_21CAC957C(a2 & 1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_21CB86020();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = v7;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_21CB8275C(v13, a3 & 1);
  unint64_t v18 = sub_21CAC957C(v7);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_21CB88FA0();
  __break(1u);
}

uint64_t sub_21CB8472C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21CA5BCE0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21CB861C4();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_21CB82A28(v15, a4 & 1);
  unint64_t v21 = sub_21CA5BCE0(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_21CB88FA0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_21CB8489C(unint64_t result, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(unsigned char *)(a5[7] + result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_21CB848E4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void *a8)
{
  a8[(result >> 6) + 8] |= 1 << result;
  uint64_t v8 = (void *)(a8[6] + 16 * result);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a8[7] + 32 * result;
  *(void *)uint64_t v9 = a4;
  *(void *)(v9 + 8) = a5;
  *(void *)(v9 + 16) = a6;
  *(unsigned char *)(v9 + 24) = a7 & 1;
  *(unsigned char *)(v9 + 25) = BYTE1(a7) & 1;
  *(unsigned char *)(v9 + 26) = BYTE2(a7) & 1;
  uint64_t v10 = a8[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a8[2] = v12;
  }
  return result;
}

uint64_t sub_21CB8494C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_21CA57E34(&qword_267C97188);
  uint64_t result = sub_21CB865A4(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_21CB849E8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_21CA5C728(a1, a2, a3, a4, a5, (uint64_t (*)(void))type metadata accessor for FMFFriend, (uint64_t (*)(void))type metadata accessor for FMFFriend);
}

_OWORD *sub_21CB84A14(unint64_t a1, char a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_21CA38B20(a3, (_OWORD *)(a4[7] + 32 * a1));
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

unint64_t sub_21CB84A7C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void *sub_21CB84AC4()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97220);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    char v23 = (void *)(*(void *)(v4 + 48) + v16);
    *char v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB84C80()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97AC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    void *v19 = v18;
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

void *sub_21CB84E2C()
{
  return sub_21CB85924(&qword_267C95B38);
}

void *sub_21CB84E38()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97BF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    int64_t v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      int64_t v9 = v29 + 1;
      if (v29 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v30 = *(void *)(v6 + 8 * v9);
      if (!v30) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v30 - 1) & v30;
    unint64_t v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    char v25 = *(unsigned char *)(v21 + 24);
    char v26 = *(unsigned char *)(v21 + 25);
    LOBYTE(v21) = *(unsigned char *)(v21 + 26);
    int64_t v27 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v27 = v19;
    v27[1] = v18;
    uint64_t v28 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v28 = v22;
    *(void *)(v28 + 8) = v23;
    *(void *)(v28 + 16) = v24;
    *(unsigned char *)(v28 + 24) = v25;
    *(unsigned char *)(v28 + 25) = v26;
    *(unsigned char *)(v28 + 26) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v31 = v29 + 2;
  if (v31 >= v13) {
    goto LABEL_26;
  }
  unint64_t v30 = *(void *)(v6 + 8 * v31);
  if (v30)
  {
    int64_t v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v9);
    ++v31;
    if (v30) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB85028(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = a1(0);
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - v7;
  sub_21CA57E34(a2);
  unint64_t v30 = v3;
  uint64_t v9 = *v3;
  uint64_t v10 = sub_21CB88D20();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v30 = v11;
    return result;
  }
  uint64_t result = (void *)(v10 + 64);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v13) {
    uint64_t result = memmove(result, (const void *)(v9 + 64), 8 * v13);
  }
  uint64_t v31 = v9 + 64;
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 64);
  int64_t v32 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v32) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v27);
    ++v15;
    if (!v28)
    {
      int64_t v15 = v27 + 1;
      if (v27 + 1 >= v32) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v31 + 8 * v15);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v20 = __clz(__rbit64(v28)) + (v15 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    uint64_t v22 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    unint64_t v25 = *(void *)(v33 + 72) * v20;
    sub_21CA57180(*(void *)(v9 + 56) + v25, (uint64_t)v8, a3);
    char v26 = (void *)(*(void *)(v11 + 48) + v21);
    *char v26 = v23;
    v26[1] = v24;
    sub_21CA5920C((uint64_t)v8, *(void *)(v11 + 56) + v25, a3);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v32) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v31 + 8 * v29);
  if (v28)
  {
    int64_t v15 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v15 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v15 >= v32) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v15);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB8529C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21CA57E34(&qword_267C97188);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CA57E34(&qword_267C97C10);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_21CB88D20();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  int64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_21CB86674(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    uint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *uint64_t v22 = v19;
    v22[1] = v20;
    sub_21CB865A4((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_21CB8550C()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97BC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    int64_t v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      int64_t v9 = v31 + 1;
      if (v31 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v32 = *(void *)(v6 + 8 * v9);
      if (!v32) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v32 - 1) & v32;
    unint64_t v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 56 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    uint64_t v25 = *(void *)(v21 + 24);
    char v26 = *(unsigned char *)(v21 + 32);
    uint64_t v27 = *(void *)(v21 + 40);
    uint64_t v28 = *(void *)(v21 + 48);
    uint64_t v29 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v29 = v19;
    v29[1] = v18;
    uint64_t v30 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v30 = v22;
    *(void *)(v30 + 8) = v23;
    *(void *)(v30 + 16) = v24;
    *(void *)(v30 + 24) = v25;
    *(unsigned char *)(v30 + 32) = v26;
    *(void *)(v30 + 40) = v27;
    *(void *)(v30 + 48) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v33 = v31 + 2;
  if (v33 >= v13) {
    goto LABEL_26;
  }
  unint64_t v32 = *(void *)(v6 + 8 * v33);
  if (v32)
  {
    int64_t v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v9);
    ++v33;
    if (v32) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB85700()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97C20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_21CB858B0()
{
  return sub_21CB85028((uint64_t (*)(void))type metadata accessor for FMFLocation, &qword_267C97BE8, (uint64_t (*)(void))type metadata accessor for FMFLocation);
}

void *sub_21CB858E4()
{
  return sub_21CB85028((uint64_t (*)(void))type metadata accessor for FMFFriend, &qword_267C97BB8, (uint64_t (*)(void))type metadata accessor for FMFFriend);
}

void *sub_21CB85918()
{
  return sub_21CB85924(&qword_267C97BD0);
}

void *sub_21CB85924(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_21CA57E34(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_21CB88D20();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v14) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v7 + 8 * v27);
    ++v10;
    if (!v28)
    {
      int64_t v10 = v27 + 1;
      if (v27 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v7 + 8 * v10);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v28 - 1) & v28;
    unint64_t v16 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = 24 * v16;
    uint64_t v22 = *(void *)(v3 + 56) + v21;
    uint64_t v23 = *(void *)v22;
    uint64_t v24 = *(void *)(v22 + 8);
    LOBYTE(v22) = *(unsigned char *)(v22 + 16);
    int64_t v25 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v25 = v20;
    v25[1] = v19;
    uint64_t v26 = *(void *)(v5 + 56) + v21;
    *(void *)uint64_t v26 = v23;
    *(void *)(v26 + 8) = v24;
    *(unsigned char *)(v26 + 16) = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v14) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v7 + 8 * v29);
  if (v28)
  {
    int64_t v10 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v7 + 8 * v10);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB85AE8()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97BF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    LOBYTE(v21) = *(unsigned char *)(v21 + 16);
    uint64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v24 = v19;
    v24[1] = v18;
    uint64_t v25 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v25 = v22;
    *(void *)(v25 + 8) = v23;
    *(unsigned char *)(v25 + 16) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB85CB4()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97AC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    sub_21CA4E524(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v20);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = v16;
    uint64_t result = sub_21CA38B20(v20, (_OWORD *)(*(void *)(v4 + 56) + 32 * v15));
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_21CB85E74(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_21CA57E34(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_21CB88D20();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_21CB86020()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97BD8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21CB861C4()
{
  uint64_t v1 = v0;
  sub_21CA57E34(&qword_267C97BE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21CB88D20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_21CB8637C(uint64_t a1, void (*a2)(uint64_t, uint64_t, unsigned char *))
{
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
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      int64_t v9 = v15 + 1;
      if (v15 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v20 + 8 * v9);
      if (!v16)
      {
        int64_t v9 = v15 + 2;
        if (v15 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v20 + 8 * v9);
        if (!v16)
        {
          int64_t v9 = v15 + 3;
          if (v15 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v20 + 8 * v9);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_21CA4E524(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    uint64_t result = sub_21CA1B88C((uint64_t)v18, &qword_267C97BB0);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v7) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v20 + 8 * v17);
  if (v16)
  {
    int64_t v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21CB86548(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_21CB865A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C97188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CB8660C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C97188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CB86674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21CA57E34(&qword_267C97188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FMFRemoveFriendAction.__allocating_init(friend:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_21CAD9D08(a1, v2 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  *(unsigned char *)(v2 + 16) = 1;
  return v2;
}

uint64_t FMFRemoveFriendAction.init(friend:)(uint64_t a1)
{
  sub_21CAD9D08(a1, v1 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  *(unsigned char *)(v1 + 16) = 1;
  return v1;
}

uint64_t sub_21CB86760()
{
  return 0;
}

void FMFRemoveFriendAction.__allocating_init(requiresRefresh:)()
{
}

void FMFRemoveFriendAction.init(requiresRefresh:)()
{
}

uint64_t sub_21CB86904()
{
  return sub_21CA4C4F4(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
}

uint64_t FMFRemoveFriendAction.deinit()
{
  sub_21CA4C4F4(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);
  return v0;
}

uint64_t FMFRemoveFriendAction.__deallocating_deinit()
{
  sub_21CA4C4F4(v0 + OBJC_IVAR____TtC7FMFCore21FMFRemoveFriendAction_friend);

  return swift_deallocClassInstance();
}

uint64_t sub_21CB869A0()
{
  return type metadata accessor for FMFRemoveFriendAction();
}

uint64_t type metadata accessor for FMFRemoveFriendAction()
{
  uint64_t result = qword_267C97C28;
  if (!qword_267C97C28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for FMFRemoveFriendAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FMFRemoveFriendAction);
}

uint64_t dispatch thunk of FMFRemoveFriendAction.__allocating_init(friend:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t FMFMyInfo.emails.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FMFMyInfo.firstName.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.meDeviceId.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.deviceId.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMFMyInfo.eligibleAutoMe.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_21CB86AC0(unsigned __int8 *a1, char *a2)
{
  return sub_21CA7E230(*a1, *a2);
}

uint64_t sub_21CB86ACC()
{
  return sub_21CB89090();
}

uint64_t sub_21CB86BD4()
{
  sub_21CB88380();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21CB86CC4()
{
  return sub_21CB89090();
}

uint64_t sub_21CB86DC8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB87124();
  *a1 = result;
  return result;
}

void sub_21CB86DF8(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x736C69616D65;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000065;
      uint64_t v3 = 0x6D614E7473726966;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x656369766544656DLL;
      *(void *)(a1 + 8) = 0xEA00000000006449;
      break;
    case 3:
      *(void *)a1 = 0x6449656369766564;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 4:
      strcpy((char *)a1, "eligibleAutoMe");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_21CB86ED8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21CB87124();
  *a1 = result;
  return result;
}

uint64_t sub_21CB86F00(uint64_t a1)
{
  unint64_t v2 = sub_21CA17F48();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21CB86F3C(uint64_t a1)
{
  unint64_t v2 = sub_21CA17F48();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t assignWithCopy for FMFMyInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for FMFMyInfo(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

unint64_t sub_21CB870D0()
{
  unint64_t result = qword_267C97C50;
  if (!qword_267C97C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C97C50);
  }
  return result;
}

uint64_t sub_21CB87124()
{
  unint64_t v0 = sub_21CB88D70();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_21CB87170()
{
  return MEMORY[0x270F28C88]();
}

uint64_t sub_21CB87180()
{
  return MEMORY[0x270F28D08]();
}

uint64_t sub_21CB87190()
{
  return MEMORY[0x270F28DD0]();
}

uint64_t sub_21CB871A0()
{
  return MEMORY[0x270F28DE0]();
}

uint64_t sub_21CB871B0()
{
  return MEMORY[0x270F28DE8]();
}

uint64_t sub_21CB871C0()
{
  return MEMORY[0x270F28DF0]();
}

uint64_t sub_21CB871D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21CB871E0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21CB871F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21CB87200()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21CB87210()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21CB87220()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21CB87230()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_21CB87240()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_21CB87250()
{
  return MEMORY[0x270EEE1C8]();
}

uint64_t sub_21CB87260()
{
  return MEMORY[0x270EEE1D0]();
}

uint64_t sub_21CB87270()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_21CB87280()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_21CB87290()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_21CB872A0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_21CB872B0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_21CB872C0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_21CB872D0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_21CB872E0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_21CB872F0()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_21CB87300()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_21CB87310()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_21CB87320()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_21CB87330()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_21CB87340()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_21CB87350()
{
  return MEMORY[0x270EEF428]();
}

uint64_t sub_21CB87360()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_21CB87370()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_21CB873C0()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_21CB873F0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21CB87400()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21CB87410()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21CB87420()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_21CB87430()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21CB87440()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_21CB87450()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21CB87460()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21CB87470()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_21CB87480()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21CB87490()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_21CB874A0()
{
  return MEMORY[0x270EF0118]();
}

uint64_t sub_21CB874B0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21CB874C0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21CB874D0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_21CB874E0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21CB874F0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_21CB87500()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_21CB87510()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21CB87520()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_21CB87530()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_21CB87540()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_21CB87550()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_21CB87560()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21CB87570()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_21CB87580()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21CB87590()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21CB875A0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_21CB875B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21CB875C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21CB875D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21CB875E0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_21CB875F0()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_21CB87600()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_21CB87610()
{
  return MEMORY[0x270EF0F20]();
}

uint64_t sub_21CB87620()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21CB87630()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21CB87640()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_21CB87650()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_21CB87660()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_21CB87670()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_21CB87680()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_21CB87690()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_21CB876A0()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_21CB876B0()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_21CB876C0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_21CB876D0()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_21CB876E0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_21CB876F0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_21CB87700()
{
  return MEMORY[0x270F280F0]();
}

uint64_t sub_21CB87710()
{
  return MEMORY[0x270F280F8]();
}

uint64_t sub_21CB87720()
{
  return MEMORY[0x270F28100]();
}

uint64_t sub_21CB87730()
{
  return MEMORY[0x270F28108]();
}

uint64_t sub_21CB87740()
{
  return MEMORY[0x270F28110]();
}

uint64_t sub_21CB87750()
{
  return MEMORY[0x270F28118]();
}

uint64_t sub_21CB87760()
{
  return MEMORY[0x270F28120]();
}

uint64_t sub_21CB87770()
{
  return MEMORY[0x270F28128]();
}

uint64_t sub_21CB87780()
{
  return MEMORY[0x270F28130]();
}

uint64_t sub_21CB87790()
{
  return MEMORY[0x270F28138]();
}

uint64_t sub_21CB877A0()
{
  return MEMORY[0x270F28140]();
}

uint64_t sub_21CB877B0()
{
  return MEMORY[0x270F29180]();
}

uint64_t sub_21CB877C0()
{
  return MEMORY[0x270F29188]();
}

uint64_t sub_21CB877D0()
{
  return MEMORY[0x270F29190]();
}

uint64_t sub_21CB877E0()
{
  return MEMORY[0x270F29198]();
}

uint64_t sub_21CB877F0()
{
  return MEMORY[0x270F291A0]();
}

uint64_t sub_21CB87800()
{
  return MEMORY[0x270F291A8]();
}

uint64_t sub_21CB87810()
{
  return MEMORY[0x270F291B0]();
}

uint64_t sub_21CB87820()
{
  return MEMORY[0x270F291B8]();
}

uint64_t sub_21CB87830()
{
  return MEMORY[0x270F291C0]();
}

uint64_t sub_21CB87840()
{
  return MEMORY[0x270F29208]();
}

uint64_t sub_21CB87850()
{
  return MEMORY[0x270F29210]();
}

uint64_t sub_21CB87860()
{
  return MEMORY[0x270F29218]();
}

uint64_t sub_21CB87870()
{
  return MEMORY[0x270F29228]();
}

uint64_t sub_21CB87880()
{
  return MEMORY[0x270F29238]();
}

uint64_t sub_21CB87890()
{
  return MEMORY[0x270F29240]();
}

uint64_t sub_21CB878A0()
{
  return MEMORY[0x270F29248]();
}

uint64_t sub_21CB878B0()
{
  return MEMORY[0x270F29250]();
}

uint64_t sub_21CB878C0()
{
  return MEMORY[0x270F29258]();
}

uint64_t sub_21CB878D0()
{
  return MEMORY[0x270F29260]();
}

uint64_t sub_21CB878E0()
{
  return MEMORY[0x270F29270]();
}

uint64_t sub_21CB878F0()
{
  return MEMORY[0x270F29280]();
}

uint64_t sub_21CB87900()
{
  return MEMORY[0x270F29300]();
}

uint64_t sub_21CB87910()
{
  return MEMORY[0x270F29318]();
}

uint64_t sub_21CB87920()
{
  return MEMORY[0x270F29320]();
}

uint64_t sub_21CB87930()
{
  return MEMORY[0x270F29328]();
}

uint64_t sub_21CB87940()
{
  return MEMORY[0x270F29350]();
}

uint64_t sub_21CB87950()
{
  return MEMORY[0x270F29378]();
}

uint64_t sub_21CB87960()
{
  return MEMORY[0x270F29380]();
}

uint64_t sub_21CB87970()
{
  return MEMORY[0x270F29388]();
}

uint64_t sub_21CB87980()
{
  return MEMORY[0x270F29390]();
}

uint64_t sub_21CB87990()
{
  return MEMORY[0x270F29398]();
}

uint64_t sub_21CB879A0()
{
  return MEMORY[0x270F293A0]();
}

uint64_t sub_21CB879B0()
{
  return MEMORY[0x270F293A8]();
}

uint64_t sub_21CB879C0()
{
  return MEMORY[0x270F293B0]();
}

uint64_t sub_21CB879D0()
{
  return MEMORY[0x270F293B8]();
}

uint64_t sub_21CB879E0()
{
  return MEMORY[0x270F293C0]();
}

uint64_t sub_21CB879F0()
{
  return MEMORY[0x270F293C8]();
}

uint64_t sub_21CB87A00()
{
  return MEMORY[0x270F293D0]();
}

uint64_t sub_21CB87A10()
{
  return MEMORY[0x270F293D8]();
}

uint64_t sub_21CB87A20()
{
  return MEMORY[0x270F293E0]();
}

uint64_t sub_21CB87A30()
{
  return MEMORY[0x270F293E8]();
}

uint64_t sub_21CB87A40()
{
  return MEMORY[0x270F293F0]();
}

uint64_t sub_21CB87A50()
{
  return MEMORY[0x270F293F8]();
}

uint64_t sub_21CB87A60()
{
  return MEMORY[0x270F29400]();
}

uint64_t sub_21CB87A70()
{
  return MEMORY[0x270F29408]();
}

uint64_t sub_21CB87A80()
{
  return MEMORY[0x270F29410]();
}

uint64_t sub_21CB87A90()
{
  return MEMORY[0x270F29418]();
}

uint64_t sub_21CB87AA0()
{
  return MEMORY[0x270F29420]();
}

uint64_t sub_21CB87AB0()
{
  return MEMORY[0x270F29428]();
}

uint64_t sub_21CB87AC0()
{
  return MEMORY[0x270F29430]();
}

uint64_t sub_21CB87AD0()
{
  return MEMORY[0x270F29438]();
}

uint64_t sub_21CB87AE0()
{
  return MEMORY[0x270F29440]();
}

uint64_t sub_21CB87AF0()
{
  return MEMORY[0x270F29448]();
}

uint64_t sub_21CB87B00()
{
  return MEMORY[0x270F29450]();
}

uint64_t sub_21CB87B10()
{
  return MEMORY[0x270F29458]();
}

uint64_t sub_21CB87B20()
{
  return MEMORY[0x270F29460]();
}

uint64_t sub_21CB87B30()
{
  return MEMORY[0x270F29468]();
}

uint64_t sub_21CB87B40()
{
  return MEMORY[0x270F29470]();
}

uint64_t sub_21CB87B50()
{
  return MEMORY[0x270F29478]();
}

uint64_t sub_21CB87B60()
{
  return MEMORY[0x270F29480]();
}

uint64_t sub_21CB87B70()
{
  return MEMORY[0x270F29488]();
}

uint64_t sub_21CB87B80()
{
  return MEMORY[0x270F29490]();
}

uint64_t sub_21CB87B90()
{
  return MEMORY[0x270F29498]();
}

uint64_t sub_21CB87BA0()
{
  return MEMORY[0x270F294A0]();
}

uint64_t sub_21CB87BB0()
{
  return MEMORY[0x270F294A8]();
}

uint64_t sub_21CB87BC0()
{
  return MEMORY[0x270F294B0]();
}

uint64_t sub_21CB87BD0()
{
  return MEMORY[0x270F294B8]();
}

uint64_t sub_21CB87BE0()
{
  return MEMORY[0x270F294C0]();
}

uint64_t sub_21CB87BF0()
{
  return MEMORY[0x270F294C8]();
}

uint64_t sub_21CB87C00()
{
  return MEMORY[0x270F294D0]();
}

uint64_t sub_21CB87C10()
{
  return MEMORY[0x270F294D8]();
}

uint64_t sub_21CB87C20()
{
  return MEMORY[0x270F294E0]();
}

uint64_t sub_21CB87C30()
{
  return MEMORY[0x270F294E8]();
}

uint64_t sub_21CB87C40()
{
  return MEMORY[0x270F294F0]();
}

uint64_t sub_21CB87C50()
{
  return MEMORY[0x270F294F8]();
}

uint64_t sub_21CB87C60()
{
  return MEMORY[0x270F29588]();
}

uint64_t sub_21CB87C70()
{
  return MEMORY[0x270F295A0]();
}

uint64_t sub_21CB87C80()
{
  return MEMORY[0x270F295B0]();
}

uint64_t sub_21CB87C90()
{
  return MEMORY[0x270F295B8]();
}

uint64_t sub_21CB87CA0()
{
  return MEMORY[0x270F295E8]();
}

uint64_t sub_21CB87CB0()
{
  return MEMORY[0x270F295F0]();
}

uint64_t sub_21CB87CC0()
{
  return MEMORY[0x270F295F8]();
}

uint64_t sub_21CB87CF0()
{
  return MEMORY[0x270F29638]();
}

uint64_t sub_21CB87E20()
{
  return MEMORY[0x270F29768]();
}

uint64_t sub_21CB87E30()
{
  return MEMORY[0x270F29780]();
}

uint64_t sub_21CB87E40()
{
  return MEMORY[0x270F29790]();
}

uint64_t sub_21CB87E50()
{
  return MEMORY[0x270F29798]();
}

uint64_t sub_21CB87E60()
{
  return MEMORY[0x270F297A0]();
}

uint64_t sub_21CB87E70()
{
  return MEMORY[0x270F297B0]();
}

uint64_t sub_21CB87E80()
{
  return MEMORY[0x270F297B8]();
}

uint64_t sub_21CB87E90()
{
  return MEMORY[0x270F297C0]();
}

uint64_t sub_21CB87EA0()
{
  return MEMORY[0x270F297C8]();
}

uint64_t sub_21CB87EB0()
{
  return MEMORY[0x270F297D0]();
}

uint64_t sub_21CB87EC0()
{
  return MEMORY[0x270F297D8]();
}

uint64_t sub_21CB87ED0()
{
  return MEMORY[0x270F297E0]();
}

uint64_t sub_21CB87EE0()
{
  return MEMORY[0x270F297F0]();
}

uint64_t sub_21CB87EF0()
{
  return MEMORY[0x270F297F8]();
}

uint64_t sub_21CB87F00()
{
  return MEMORY[0x270F29800]();
}

uint64_t sub_21CB87F10()
{
  return MEMORY[0x270F29808]();
}

uint64_t sub_21CB87F20()
{
  return MEMORY[0x270F29810]();
}

uint64_t sub_21CB87F30()
{
  return MEMORY[0x270F29818]();
}

uint64_t sub_21CB87F40()
{
  return MEMORY[0x270F29820]();
}

uint64_t sub_21CB87F50()
{
  return MEMORY[0x270F29828]();
}

uint64_t sub_21CB87F60()
{
  return MEMORY[0x270F29830]();
}

uint64_t sub_21CB87F70()
{
  return MEMORY[0x270F29838]();
}

uint64_t sub_21CB87F80()
{
  return MEMORY[0x270F29840]();
}

uint64_t sub_21CB87F90()
{
  return MEMORY[0x270F29848]();
}

uint64_t sub_21CB87FA0()
{
  return MEMORY[0x270F29850]();
}

uint64_t sub_21CB87FB0()
{
  return MEMORY[0x270F29860]();
}

uint64_t sub_21CB87FC0()
{
  return MEMORY[0x270F29868]();
}

uint64_t sub_21CB87FD0()
{
  return MEMORY[0x270F29870]();
}

uint64_t sub_21CB87FE0()
{
  return MEMORY[0x270F29878]();
}

uint64_t sub_21CB87FF0()
{
  return MEMORY[0x270F29880]();
}

uint64_t sub_21CB88000()
{
  return MEMORY[0x270F29888]();
}

uint64_t sub_21CB88010()
{
  return MEMORY[0x270F18248]();
}

uint64_t sub_21CB88020()
{
  return MEMORY[0x270F18288]();
}

uint64_t sub_21CB88030()
{
  return MEMORY[0x270F18290]();
}

uint64_t sub_21CB88040()
{
  return MEMORY[0x270F18298]();
}

uint64_t sub_21CB88050()
{
  return MEMORY[0x270F182A8]();
}

uint64_t sub_21CB88060()
{
  return MEMORY[0x270F182B0]();
}

uint64_t sub_21CB88070()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21CB88080()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21CB88090()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_21CB880A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21CB880B0()
{
  return MEMORY[0x270EE3AC0]();
}

uint64_t sub_21CB880C0()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_21CB880D0()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_21CB880E0()
{
  return MEMORY[0x270EE3F48]();
}

uint64_t sub_21CB880F0()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_21CB88100()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21CB88110()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_21CB88120()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21CB88130()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_21CB88140()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_21CB88150()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21CB88160()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21CB88170()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21CB88180()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_21CB88190()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_21CB881A0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_21CB881B0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_21CB881C0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_21CB881D0()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_21CB881E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21CB881F0()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_21CB88200()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21CB88210()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21CB88220()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21CB88230()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_21CB88240()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_21CB88250()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_21CB88260()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21CB88270()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_21CB88280()
{
  return MEMORY[0x270F9D418]();
}

uint64_t sub_21CB88290()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_21CB882A0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_21CB882B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21CB882C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21CB882D0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21CB882E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21CB882F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21CB88300()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21CB88310()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21CB88320()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_21CB88330()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_21CB88340()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_21CB88350()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21CB88360()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_21CB88370()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_21CB88380()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21CB88390()
{
  return MEMORY[0x270F9D720]();
}

uint64_t sub_21CB883A0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21CB883B0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_21CB883C0()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_21CB883D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21CB883E0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_21CB883F0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_21CB88400()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21CB88410()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_21CB88420()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_21CB88440()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_21CB88450()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_21CB88460()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_21CB88470()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_21CB88480()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_21CB88490()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_21CB884A0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_21CB884B0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_21CB884C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_21CB884D0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_21CB884E0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21CB884F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21CB88500()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_21CB88510()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21CB88520()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21CB88530()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21CB88540()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_21CB88550()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_21CB88560()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21CB88570()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_21CB88580()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21CB88590()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_21CB885A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21CB885B0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_21CB885C0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_21CB885D0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_21CB885E0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21CB885F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21CB88600()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_21CB88630()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21CB88640()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21CB88650()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_21CB88670()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_21CB88680()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_21CB88690()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_21CB886A0()
{
  return MEMORY[0x270FA2008]();
}

uint64_t sub_21CB886C0()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_21CB886D0()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_21CB886E0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_21CB886F0()
{
  return MEMORY[0x270FA2090]();
}

uint64_t sub_21CB88700()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_21CB88710()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_21CB88720()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_21CB88730()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_21CB88740()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_21CB88750()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21CB88760()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_21CB88770()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_21CB88780()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_21CB88790()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_21CB887A0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_21CB887B0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_21CB887C0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_21CB887D0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_21CB887E0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_21CB887F0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_21CB88800()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_21CB88810()
{
  return MEMORY[0x270F9E218]();
}

uint64_t sub_21CB88820()
{
  return MEMORY[0x270F9E2F8]();
}

uint64_t sub_21CB88830()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_21CB88840()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21CB88850()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21CB88860()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21CB88870()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21CB88880()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21CB88890()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_21CB888A0()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_21CB888B0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21CB888C0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_21CB888D0()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_21CB888E0()
{
  return MEMORY[0x270FA0CE8]();
}

uint64_t sub_21CB888F0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21CB88900()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21CB88910()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_21CB88920()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21CB88930()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21CB88940()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_21CB88950()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_21CB88960()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21CB88970()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_21CB88980()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_21CB88990()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_21CB889A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21CB889B0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_21CB889C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21CB889D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21CB889E0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_21CB889F0()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_21CB88A00()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_21CB88A10()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_21CB88A20()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_21CB88A30()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_21CB88A40()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21CB88A60()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21CB88A70()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21CB88A80()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_21CB88A90()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_21CB88AA0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_21CB88AB0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_21CB88AC0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_21CB88AD0()
{
  return MEMORY[0x270EF2608]();
}

uint64_t sub_21CB88AE0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21CB88AF0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21CB88B00()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21CB88B10()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21CB88B20()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21CB88B30()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_21CB88B40()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21CB88B50()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_21CB88B60()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_21CB88B70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21CB88B80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21CB88B90()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_21CB88BA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21CB88BB0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21CB88BC0()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t sub_21CB88BD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21CB88BE0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_21CB88BF0()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_21CB88C00()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21CB88C10()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21CB88C20()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21CB88C30()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21CB88C40()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21CB88C50()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_21CB88C60()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_21CB88C70()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_21CB88C80()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_21CB88C90()
{
  return MEMORY[0x270F9ECE0]();
}

uint64_t sub_21CB88CA0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21CB88CB0()
{
  return MEMORY[0x270FA2238]();
}

uint64_t sub_21CB88CC0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_21CB88CD0()
{
  return MEMORY[0x270F9ED78]();
}

uint64_t sub_21CB88CE0()
{
  return MEMORY[0x270F9ED80]();
}

uint64_t sub_21CB88CF0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21CB88D00()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21CB88D10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21CB88D20()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21CB88D30()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21CB88D40()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21CB88D50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21CB88D70()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21CB88D90()
{
  return MEMORY[0x270F28148]();
}

uint64_t sub_21CB88DA0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_21CB88DB0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_21CB88DC0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_21CB88DD0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_21CB88DE0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_21CB88DF0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_21CB88E00()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_21CB88E10()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_21CB88E20()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21CB88E30()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_21CB88E40()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_21CB88E50()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_21CB88E60()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_21CB88E70()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_21CB88E80()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_21CB88E90()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_21CB88EA0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_21CB88EB0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21CB88EC0()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_21CB88ED0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_21CB88EE0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21CB88EF0()
{
  return MEMORY[0x270FA2310]();
}

uint64_t sub_21CB88F00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21CB88F10()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_21CB88F20()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_21CB88F30()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21CB88F40()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_21CB88F50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21CB88F70()
{
  return MEMORY[0x270F9F7D8]();
}

uint64_t sub_21CB88F80()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_21CB88F90()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21CB88FA0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21CB88FB0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_21CB88FD0()
{
  return MEMORY[0x270FA2398]();
}

uint64_t sub_21CB89000()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21CB89010()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21CB89020()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21CB89030()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21CB89040()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21CB89050()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21CB89060()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21CB89070()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_21CB89080()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_21CB89090()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21CB890A0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_21CB890B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21CB890C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_21CB890D0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_21CB890E0()
{
  return MEMORY[0x270FA0080]();
}

uint64_t sub_21CB89110()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x270F183E8]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x270F183F0]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x270F183F8]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x270F0CD98]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x270F0CDA8]();
}

uint64_t CPPhoneNumberCopyLastKnownNetworkCountryCode()
{
  return MEMORY[0x270F0CDB0]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x270F0CDB8]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x270EE8758]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8808]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x270EDB7E8](*(void *)&state, path);
}