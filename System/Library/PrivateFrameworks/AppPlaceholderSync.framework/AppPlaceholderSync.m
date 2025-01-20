void SelfDestruct(void *a1)
{
  [a1 UTF8String];
  _os_crash();
  __break(1u);
}

uint64_t StoreContext.deinit()
{
  swift_release();
  return v0;
}

uint64_t StoreContext.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_247D0BE4C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8440);
    uint64_t v2 = sub_247D28760();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v30 + 1;
    if (!v12)
    {
      int64_t v13 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v30 = v13;
LABEL_28:
    v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    v15 = *(void **)&v33[0];
    *(void *)&v32[0] = v16;
    type metadata accessor for FileProtectionType(0);
    id v17 = v15;
    id v18 = v16;
    swift_dynamicCast();
    uint64_t v19 = *(void *)&v33[0];
    sub_247D11F68((_OWORD *)((char *)v33 + 8), v31);
    sub_247D11F68(v31, v33);
    sub_247D11F68(v33, v32);
    sub_247D284D0();
    sub_247D28870();
    sub_247D28500();
    uint64_t v20 = sub_247D28890();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v19;
    uint64_t result = (uint64_t)sub_247D11F68(v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    sub_247D11F78();
    return v2;
  }
  unint64_t v12 = *(void *)(v29 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t Store.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  uint64_t v4 = sub_247D27E60();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_247D0C264(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v130 = *MEMORY[0x263EF8340];
  uint64_t v118 = sub_247D27DA0();
  uint64_t v4 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v93 = (char *)v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_247D28280();
  uint64_t v6 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  v98 = (char *)v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247D283E0();
  MEMORY[0x270FA5388](v8 - 8);
  v109 = (char *)v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247D28390();
  MEMORY[0x270FA5388](v10 - 8);
  v108 = (char *)v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247D27E60();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v92 = (char *)v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)v88 - v16;
  uint64_t v18 = sub_247D283A0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  v119 = (char *)v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void (**)(void))(v13 + 16);
  uint64_t v112 = v2 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  v105 = v21;
  v21();
  uint64_t v104 = type metadata accessor for PlaceholderRecord();
  uint64_t v103 = sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  uint64_t v101 = sub_247D28300();
  uint64_t v95 = 0;
  v124 = 0;
  uint64_t v100 = v19 + 16;
  uint64_t v106 = v19;
  v102 = (void (**)(char *, uint64_t))(v19 + 8);
  v97 = (void (**)(char *, uint64_t))(v6 + 8);
  v88[1] = &v127;
  LODWORD(v6) = *MEMORY[0x263F06E50];
  uint64_t v107 = v13 + 16;
  unint64_t v22 = (void (**)(uint64_t, uint64_t))(v13 + 8);
  uint64_t v23 = a1;
  v94 = v22;
  *(void *)&long long v24 = 136315138;
  long long v96 = v24;
  v88[2] = MEMORY[0x263F8EE58] + 8;
  long long v125 = xmmword_247D29080;
  uint64_t v90 = a1;
  uint64_t v120 = v12;
  v111 = v17;
  uint64_t v110 = v18;
  uint64_t v89 = v2;
  unsigned int v117 = v6;
  v91 = (void (**)(char *, void, uint64_t))(v4 + 104);
  v116 = (void (**)(char *, uint64_t))(v4 + 8);
  while (1)
  {
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_247D28220();
    BOOL v26 = (void *)__swift_project_value_buffer(v25, (uint64_t)qword_26B137118);
    swift_retain_n();
    id v123 = v26;
    uint64_t v27 = sub_247D28200();
    os_log_type_t v28 = sub_247D28630();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      int64_t v30 = (void *)swift_slowAlloc();
      id v128 = v30;
      *(_DWORD *)uint64_t v29 = v96;
      uint64_t v31 = sub_247D27E20();
      *(void *)(v29 + 4) = sub_247D1E1F8(v31, v32, (uint64_t *)&v128);
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247D0A000, v27, v28, "Loading store: %s", (uint8_t *)v29, 0xCu);
      swift_arrayDestroy();
      v33 = v30;
      id v17 = v111;
      MEMORY[0x24C569DE0](v33, -1, -1);
      uint64_t v18 = v110;
      MEMORY[0x24C569DE0](v29, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    v34 = v119;
    uint64_t v35 = v2;
    ((void (*)(char *, uint64_t, uint64_t))v105)(v17, v23, v120);
    sub_247D28380();
    sub_247D283B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AC8);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = v125;
    uint64_t v37 = v103;
    *(void *)(v36 + 32) = v104;
    *(void *)(v36 + 40) = v37;
    uint64_t v38 = v23;
    sub_247D283F0();
    sub_247D28440();
    swift_allocObject();
    sub_247D28450();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AD0);
    uint64_t v39 = v106;
    unint64_t v40 = (*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = v125;
    (*(void (**)(unint64_t, char *, uint64_t))(v39 + 16))(v41 + v40, v34, v18);
    swift_retain();
    v42 = v124;
    uint64_t v43 = sub_247D282F0();
    v44 = v42;
    if (!v42) {
      break;
    }
    (*v102)(v34, v18);
    swift_release();
    v124 = 0;
    id v46 = v42;
    v47 = v98;
    sub_247D28260();
    char v48 = sub_247D28270();

    (*v97)(v47, v99);
    if ((v48 & 1) == 0)
    {
      swift_release();
      id v128 = 0;
      unint64_t v129 = 0xE000000000000000;
      sub_247D28670();
      sub_247D28510();
      uint64_t v126 = (uint64_t)v44;
      goto LABEL_28;
    }

    uint64_t v23 = v38;
    sub_247D27E20();
    sub_247D284F0();
    int v49 = sub_247D28230();
    uint64_t v50 = swift_release();
    if (v49 < 0)
    {
      MEMORY[0x24C5690B0](v50);
      swift_bridgeObjectRelease();
      v61 = sub_247D28200();
      os_log_type_t v62 = sub_247D28600();
      uint64_t v2 = v35;
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_247D0A000, v61, v62, "Failed to open the store, trying again in 60 seconds...", v63, 2u);
        MEMORY[0x24C569DE0](v63, -1, -1);
      }

      sleep(0x3Cu);
    }
    else
    {
      close(v49);
      swift_bridgeObjectRelease();
      id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
      swift_retain_n();
      v52 = sub_247D28200();
      os_log_type_t v53 = sub_247D28620();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        v55 = (void *)swift_slowAlloc();
        id v128 = v55;
        *(_DWORD *)v54 = v96;
        uint64_t v56 = sub_247D27E20();
        uint64_t v126 = sub_247D1E1F8(v56, v57, (uint64_t *)&v128);
        sub_247D28640();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247D0A000, v52, v53, "Failed to load the store, deleting %s.", v54, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C569DE0](v55, -1, -1);
        MEMORY[0x24C569DE0](v54, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      uint64_t v58 = v118;
      v59 = v93;
      v60 = v92;
      v64 = v94;
      v121 = (void *)sub_247D27DC0();
      unint64_t v122 = v65;
      v66 = (void *)sub_247D27DD0();
      id v128 = 0;
      unsigned int v67 = objc_msgSend(v51, sel_removeItemAtURL_error_, v66, &v128);

      id v123 = v51;
      if (!v67)
      {
        id v83 = v128;
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v84 = sub_247D27D80();

        goto LABEL_25;
      }
      id v68 = v128;
      sub_247D27DF0();
      id v128 = v121;
      unint64_t v129 = v122;
      swift_bridgeObjectRetain();
      sub_247D28510();
      v115 = *v91;
      v115(v59, v117, v58);
      unint64_t v69 = sub_247D11E30();
      id v17 = v111;
      unint64_t v114 = v69;
      sub_247D27E50();
      v113 = *v116;
      v113(v59, v58);
      swift_bridgeObjectRelease();
      v70 = *v64;
      v71 = v60;
      v72 = v60;
      uint64_t v73 = v120;
      v70((uint64_t)v71, v120);
      v74 = (void *)sub_247D27DD0();
      v70((uint64_t)v17, v73);
      id v128 = 0;
      unsigned int v75 = objc_msgSend(v123, sel_removeItemAtURL_error_, v74, &v128);

      id v76 = v128;
      if (!v75)
      {
        v85 = v76;
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v84 = sub_247D27D80();

LABEL_25:
        id v79 = v123;
LABEL_27:
        swift_willThrow();

        id v128 = 0;
        unint64_t v129 = 0xE000000000000000;
        sub_247D28670();
        sub_247D28510();
        uint64_t v126 = v84;
LABEL_28:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF0);
        sub_247D28710();
        v87 = (void *)sub_247D284A0();
        swift_bridgeObjectRelease();
        SelfDestruct(v87);
      }
      sub_247D27DF0();
      id v128 = v121;
      unint64_t v129 = v122;
      sub_247D28510();
      uint64_t v77 = v118;
      v115(v59, v117, v118);
      sub_247D27E50();
      v113(v59, v77);
      swift_bridgeObjectRelease();
      v70((uint64_t)v72, v73);
      v78 = (void *)sub_247D27DD0();
      v70((uint64_t)v17, v73);
      id v128 = 0;
      id v79 = v123;
      LODWORD(v77) = objc_msgSend(v123, sel_removeItemAtURL_error_, v78, &v128);

      id v80 = v128;
      if (!v77)
      {
        v86 = v80;
        swift_release();
        uint64_t v84 = sub_247D27D80();

        goto LABEL_27;
      }

      uint64_t v2 = v89;
      uint64_t v23 = v90;
      uint64_t v18 = v110;
    }
  }
  uint64_t v45 = v43;
  swift_release();
  swift_retain();
  sub_247D11050(v38);
  (*v102)(v119, v18);
  swift_release();
  *(void *)(v35 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_container) = v45;
  sub_247D282D0();
  swift_allocObject();
  uint64_t v81 = sub_247D282E0();
  (*v94)(v38, v120);
  *(void *)(v35 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_context) = v81;
  return v35;
}

uint64_t sub_247D0D170()
{
  type metadata accessor for StoreContext();
  uint64_t v0 = swift_allocObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 16) = sub_247D282E0();
  return v0;
}

uint64_t type metadata accessor for StoreContext()
{
  return self;
}

uint64_t Store.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  uint64_t v2 = sub_247D27E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t Store.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  uint64_t v2 = sub_247D27E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t StoreContext.add(item:)(uint64_t a1)
{
  uint64_t v32 = sub_247D27EA0();
  uint64_t v4 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247D27EC0();
  unint64_t v9 = sub_247D0D7C4(v7, v8);
  swift_bridgeObjectRelease();
  uint64_t v31 = v2;
  if (v9)
  {
    uint64_t v30 = v1;
    uint64_t v10 = a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate;
    uint64_t v11 = v9 + OBJC_IVAR____TtC18AppPlaceholderSync17PlaceholderRecord___observationRegistrar;
    unint64_t v33 = v9;
    swift_getKeyPath();
    uint64_t v28 = sub_247D11C08(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
    uint64_t v29 = v11;
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
    sub_247D11C08(&qword_26B137228, MEMORY[0x263F07490]);
    sub_247D28360();
    swift_release();
    char v12 = sub_247D27E80();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
    v13(v6, v32);
    if (v12)
    {
      uint64_t v14 = v10;
      uint64_t v15 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v14, v32);
      unint64_t v33 = v9;
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_247D27F00();
      swift_release();
      v13(v6, v15);
      sub_247D28290();
    }
    return swift_release();
  }
  else
  {
    uint64_t v30 = *(void *)(v1 + 16);
    uint64_t v18 = sub_247D27EC0();
    uint64_t v28 = v19;
    uint64_t v29 = v18;
    uint64_t v20 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
    uint64_t v21 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier + 8);
    uint64_t v22 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
    uint64_t v23 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version + 8);
    int v24 = *(_DWORD *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate, v32);
    uint64_t v26 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier);
    uint64_t v25 = *(void *)(a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier + 8);
    type metadata accessor for PlaceholderRecord();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_247D23AEC(v29, v28, v20, v21, v22, v23, v24, v6, v26, v25);
    swift_bridgeObjectRelease();
    sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
    sub_247D282C0();
    swift_release();
    return sub_247D28290();
  }
}

unint64_t sub_247D0D7C4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137258);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A40);
  uint64_t v6 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137250);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  char v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = a1;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = type metadata accessor for PlaceholderRecord();
  sub_247D27EF0();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28310();
  id v17 = v8;
  unint64_t result = sub_247D282A0();
  unint64_t v14 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_247D28730();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v15) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
    {
LABEL_8:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v18);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v15;
    }
  }
  if ((v14 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = MEMORY[0x24C569500](0, v14);
    goto LABEL_8;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v15 = *(void *)(v14 + 32);
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t StoreContext.delete(item:)()
{
  uint64_t v0 = sub_247D27EC0();
  unint64_t v2 = sub_247D0D7C4(v0, v1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v2)
  {
    type metadata accessor for PlaceholderRecord();
    sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
    sub_247D282B0();
    sub_247D28290();
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StoreContext.delete(items:)(Swift::OpaquePointer items)
{
  if (!((unint64_t)items._rawValue >> 62))
  {
    uint64_t v2 = *(void *)(((unint64_t)items._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    sub_247D28290();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_247D28730();
  if (!v2) {
    goto LABEL_12;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (((unint64_t)items._rawValue & 0xC000000000000001) != 0) {
        MEMORY[0x24C569500](i, items._rawValue);
      }
      else {
        swift_retain();
      }
      uint64_t v4 = sub_247D27EC0();
      unint64_t v6 = sub_247D0D7C4(v4, v5);
      swift_bridgeObjectRelease();
      if (v6)
      {
        type metadata accessor for PlaceholderRecord();
        sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
        sub_247D282B0();
        swift_release();
      }
      swift_release();
    }
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t sub_247D0DF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137258);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A40);
  uint64_t v28 = *(void *)(v15 - 8);
  uint64_t v29 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v27 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137250);
  uint64_t v17 = *(void *)(v26 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v26);
  uint64_t v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[2] = a1;
  v25[3] = a2;
  MEMORY[0x270FA5388](v18);
  if (a4)
  {
    v25[-6] = a1;
    v25[-5] = a2;
    v25[-4] = a3;
    v25[-3] = a4;
  }
  else
  {
    v25[-4] = a1;
    v25[-3] = a2;
  }
  v25[-2] = a5;
  v25[-1] = a6;
  uint64_t v30 = type metadata accessor for PlaceholderRecord();
  sub_247D27EF0();
  uint64_t v21 = v26;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v20, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v21);
  type metadata accessor for PlaceholderRecord();
  sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  uint64_t v22 = v27;
  sub_247D28310();
  uint64_t v23 = sub_247D282A0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v29);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v21);
  return v23;
}

uint64_t sub_247D0E598@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v59 = a6;
  uint64_t v60 = a7;
  uint64_t v56 = a5;
  uint64_t v55 = a4;
  uint64_t v70 = a3;
  v61 = a8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137210);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371F8);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v73 = v14;
  uint64_t v74 = v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371D8);
  uint64_t v72 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371C0);
  uint64_t v75 = *(void *)(v54 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v54);
  os_log_type_t v53 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v52 = (char *)&v51 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137130);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v57 = v24;
  uint64_t v58 = v25;
  MEMORY[0x270FA5388](v24);
  v71 = (char *)&v51 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = *a1;
  uint64_t v76 = a2;
  uint64_t v77 = v70;
  sub_247D27D60();
  uint64_t v64 = sub_247D122E8(&qword_26B137208, &qword_26B137210);
  sub_247D27D70();
  swift_getKeyPath();
  os_log_type_t v62 = v13;
  uint64_t v63 = v10;
  sub_247D27D40();
  swift_release();
  id v68 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v70 = v11 + 8;
  v68(v13, v10);
  uint64_t v66 = sub_247D122E8(&qword_26B1371D0, &qword_26B1371D8);
  uint64_t v27 = sub_247D122E8(&qword_26B1371F0, &qword_26B1371F8);
  uint64_t v65 = v18;
  uint64_t v28 = v73;
  uint64_t v51 = v27;
  sub_247D27D30();
  uint64_t v29 = v74 + 8;
  unsigned int v67 = *(void (**)(char *, uint64_t))(v74 + 8);
  v67(v17, v28);
  uint64_t v74 = v29;
  uint64_t v30 = v72 + 8;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v72 + 8);
  v31(v20, v18);
  uint64_t v72 = v30;
  uint64_t v76 = v55;
  uint64_t v77 = v56;
  sub_247D27D60();
  unint64_t v33 = v62;
  uint64_t v32 = v63;
  sub_247D27D70();
  swift_getKeyPath();
  sub_247D27D40();
  swift_release();
  v68(v33, v32);
  v34 = v53;
  uint64_t v35 = v17;
  uint64_t v36 = v65;
  uint64_t v37 = v73;
  sub_247D27D30();
  uint64_t v38 = v35;
  v67(v35, v37);
  v31(v20, v36);
  uint64_t v56 = sub_247D122E8(&qword_26B1371B8, &qword_26B1371C0);
  uint64_t v39 = v52;
  uint64_t v40 = v54;
  sub_247D27D50();
  uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
  v75 += 8;
  v41(v34, v40);
  v41(v39, v40);
  uint64_t v76 = v59;
  uint64_t v77 = v60;
  sub_247D27D60();
  uint64_t v43 = v62;
  uint64_t v42 = v63;
  sub_247D27D70();
  swift_getKeyPath();
  sub_247D27D40();
  swift_release();
  v68(v43, v42);
  uint64_t v44 = v65;
  uint64_t v45 = v73;
  sub_247D27D30();
  v67(v38, v45);
  v31(v20, v44);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371A8);
  v47 = v61;
  v61[3] = v46;
  v47[4] = sub_247D12054();
  __swift_allocate_boxed_opaque_existential_1(v47);
  sub_247D122E8(&qword_26B137198, &qword_26B137130);
  char v48 = v71;
  uint64_t v49 = v57;
  sub_247D27D50();
  v41(v39, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v48, v49);
}

uint64_t sub_247D0ED60@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void (*a3)(void, void)@<X2>, uint64_t a4@<X3>, void (*a5)(void, void)@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v37 = a3;
  uint64_t v44 = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137210);
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371F8);
  uint64_t v46 = *(void *)(v12 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371D8);
  uint64_t v45 = *(void *)(v15 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371C0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v42 = v18;
  uint64_t v43 = v19;
  uint64_t v20 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v39 = (char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v38 = (char *)v36 - v22;
  v36[3] = *a1;
  uint64_t v47 = a2;
  char v48 = v37;
  sub_247D27D60();
  sub_247D122E8(&qword_26B137208, &qword_26B137210);
  sub_247D27D70();
  swift_getKeyPath();
  sub_247D27D40();
  swift_release();
  uint64_t v23 = *(void (**)(void, void))(v9 + 8);
  v36[2] = v9 + 8;
  uint64_t v37 = v23;
  v23(v11, v8);
  v36[1] = sub_247D122E8(&qword_26B1371D0, &qword_26B1371D8);
  v36[0] = sub_247D122E8(&qword_26B1371F0, &qword_26B1371F8);
  uint64_t v24 = v15;
  sub_247D27D30();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v46 + 8);
  v46 += 8;
  uint64_t v26 = v12;
  v25(v14, v12);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v45 + 8);
  v45 += 8;
  v27(v17, v24);
  uint64_t v47 = v40;
  char v48 = v41;
  sub_247D27D60();
  sub_247D27D70();
  swift_getKeyPath();
  sub_247D27D40();
  swift_release();
  v37(v11, v8);
  uint64_t v28 = v39;
  sub_247D27D30();
  v25(v14, v26);
  v27(v17, v24);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137130);
  uint64_t v30 = v44;
  v44[3] = v29;
  v30[4] = sub_247D120D0();
  __swift_allocate_boxed_opaque_existential_1(v30);
  sub_247D122E8(&qword_26B1371B8, &qword_26B1371C0);
  uint64_t v31 = v38;
  uint64_t v32 = v28;
  uint64_t v33 = v42;
  sub_247D27D50();
  v34 = *(void (**)(char *, uint64_t))(v43 + 8);
  v34(v32, v33);
  return ((uint64_t (*)(char *, uint64_t))v34)(v31, v33);
}

uint64_t sub_247D0F2D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137210);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371F8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371D8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  sub_247D27D60();
  sub_247D122E8(&qword_26B137208, &qword_26B137210);
  sub_247D27D70();
  swift_getKeyPath();
  sub_247D27D40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371C0);
  uint64_t v18 = v22;
  v22[3] = v17;
  v18[4] = sub_247D12144();
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_247D122E8(&qword_26B1371D0, &qword_26B1371D8);
  sub_247D122E8(&qword_26B1371F0, &qword_26B1371F8);
  uint64_t v19 = v23;
  sub_247D27D30();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t StoreContext.fetchItem(bundleIdentifier:version:deviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6 = sub_247D0DF90(a1, a2, a3, a4, a5, a6);
  unint64_t v7 = v6;
  if (!(v6 >> 62))
  {
    uint64_t result = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t result = sub_247D28730();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
    uint64_t v9 = MEMORY[0x24C569500](0, v7);
    goto LABEL_6;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v9 = *(void *)(v7 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_247D26050(v9);
    swift_release();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t StoreContext.fetchItems(bundleIdentifier:deviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = sub_247D0DF90(a1, a2, 0, 0, a3, a4);
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = sub_247D28730();
  if (!v6) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t result = sub_247D286E0();
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = MEMORY[0x24C569500](v8, v5);
      }
      else
      {
        uint64_t v9 = *(void *)(v5 + 8 * v8 + 32);
        swift_retain();
      }
      ++v8;
      sub_247D26050(v9);
      swift_release();
      sub_247D286C0();
      sub_247D286F0();
      sub_247D28700();
      sub_247D286D0();
    }
    while (v6 != v8);
    uint64_t v10 = v11;
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t StoreContext.fetchItem(identifier:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_247D0D7C4(a1, a2);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_247D26050(v2);
  swift_release();
  return v3;
}

uint64_t sub_247D0F858()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137258);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A40);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137250);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[3] = type metadata accessor for PlaceholderRecord();
  sub_247D27EF0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v2, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v2, 0, 1, v7);
  sub_247D11C08(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28310();
  uint64_t v11 = sub_247D282A0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

uint64_t sub_247D0FCA0@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1371E8);
  a1[4] = sub_247D121E0(&qword_26B1371E0, &qword_26B1371E8);
  __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_247D27D60();
}

uint64_t StoreContext.fetchAllItems()()
{
  unint64_t v0 = sub_247D0F858();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = sub_247D28730();
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t result = sub_247D286E0();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x24C569500](v4, v1);
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      sub_247D26050(v5);
      swift_release();
      sub_247D286C0();
      sub_247D286F0();
      sub_247D28700();
      sub_247D286D0();
    }
    while (v2 != v4);
    uint64_t v6 = v7;
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D0FE60()
{
  return swift_release();
}

uint64_t sub_247D0FF98(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_247D27EA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v13 = *a2;
  uint64_t v8 = v13;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  sub_247D11C08(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F00();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_247D10120(uint64_t a1, uint64_t a2)
{
  return sub_247D1067C(a1, a2, MEMORY[0x263F8D308]);
}

void sub_247D10150(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_247D10158@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_247D1016C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_247D1019C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_247D101B0(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_247D101C4(uint64_t a1, uint64_t a2)
{
  return sub_247D1067C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_247D101DC(uint64_t a1, id *a2)
{
  uint64_t result = sub_247D284B0();
  *a2 = 0;
  return result;
}

uint64_t sub_247D10254(uint64_t a1, id *a2)
{
  char v3 = sub_247D284C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_247D102D4@<X0>(uint64_t *a1@<X8>)
{
  sub_247D284D0();
  uint64_t v2 = sub_247D284A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_247D10318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void *sub_247D10330@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_247D1033C()
{
  uint64_t v0 = sub_247D284D0();
  uint64_t v2 = v1;
  if (v0 == sub_247D284D0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_247D28800();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_247D103C8(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_247D103D4(uint64_t a1)
{
  uint64_t v2 = sub_247D11C08(&qword_26B137A88, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_247D11C08(&qword_2692C84C8, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_247D10490(uint64_t a1)
{
  uint64_t v2 = sub_247D11C08(&qword_2692C84B8, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_247D11C08(&qword_2692C84C0, type metadata accessor for FileProtectionType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_247D1054C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_247D284A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_247D10594@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247D284D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247D105C0(uint64_t a1)
{
  uint64_t v2 = sub_247D11C08(&qword_2692C84A8, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_247D11C08(&qword_2692C84B0, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_247D1067C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_247D284D0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_247D106C0()
{
  sub_247D284D0();
  sub_247D28500();

  return swift_bridgeObjectRelease();
}

uint64_t sub_247D10714()
{
  sub_247D284D0();
  sub_247D28870();
  sub_247D28500();
  uint64_t v0 = sub_247D28890();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_247D10788(uint64_t a1)
{
  sub_247D284D0();
  sub_247D28870();
  sub_247D28500();
  uint64_t v2 = sub_247D28890();
  swift_bridgeObjectRelease();

  return sub_247D10A80(a1, v2);
}

unint64_t sub_247D1081C(uint64_t a1, uint64_t a2)
{
  sub_247D28870();
  sub_247D28500();
  uint64_t v4 = sub_247D28890();

  return sub_247D10BF8(a1, a2, v4);
}

unint64_t sub_247D10894(uint64_t a1)
{
  sub_247D280A0();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F63F00];
  sub_247D11C08(&qword_2692C8458, MEMORY[0x263F63F00]);
  uint64_t v3 = sub_247D28480();
  return sub_247D10CDC(a1, v3, MEMORY[0x263F63F00], &qword_2692C8460, v2, MEMORY[0x263F63F20]);
}

unint64_t sub_247D10968(uint64_t a1)
{
  sub_247D27EE0();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F07508];
  sub_247D11C08(&qword_2692C8448, MEMORY[0x263F07508]);
  uint64_t v3 = sub_247D28480();
  return sub_247D10CDC(a1, v3, MEMORY[0x263F07508], &qword_2692C8450, v2, MEMORY[0x263F07528]);
}

unint64_t sub_247D10A3C(uint64_t a1)
{
  uint64_t v2 = sub_247D28860();

  return sub_247D10E7C(a1, v2);
}

unint64_t sub_247D10A80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_247D284D0();
    uint64_t v8 = v7;
    if (v6 == sub_247D284D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_247D28800();
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
          uint64_t v13 = sub_247D284D0();
          uint64_t v15 = v14;
          if (v13 == sub_247D284D0() && v15 == v16) {
            break;
          }
          char v18 = sub_247D28800();
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

unint64_t sub_247D10BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247D28800() & 1) == 0)
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
      while (!v14 && (sub_247D28800() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_247D10CDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_247D11C08(v23, v24);
      char v19 = sub_247D28490();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_247D10E7C(uint64_t a1, uint64_t a2)
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

void (*sub_247D10F18(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_247D10FC8(v6, a2, a3);
  return sub_247D10F80;
}

void sub_247D10F80(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_247D10FC8(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x24C569500](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_247D11048;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D11048()
{
  return swift_release();
}

void sub_247D11050(uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_247D27DA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v92 = v2;
  uint64_t v93 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247D27E60();
  uint64_t v91 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v90 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v75 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v75 - v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  uint64_t v94 = a1;
  sub_247D27E20();
  uint64_t v15 = (void *)sub_247D284A0();
  swift_bridgeObjectRelease();
  *(void *)&long long v96 = 0;
  id v16 = objc_msgSend(v14, sel_attributesOfItemAtPath_error_, v15, &v96);

  uint64_t v17 = (void *)v96;
  if (!v16)
  {
    id v26 = (id)v96;
    uint64_t v27 = (void *)sub_247D27D80();

    swift_willThrow();
LABEL_6:

    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_247D28220();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B137118);
    id v29 = v27;
    id v30 = v27;
    uint64_t v31 = sub_247D28200();
    os_log_type_t v32 = sub_247D28620();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 138412290;
      id v35 = v27;
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v96 = v36;
      sub_247D28640();
      void *v34 = v36;

      _os_log_impl(&dword_247D0A000, v31, v32, "Error fixing file protection: %@", v33, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v34, -1, -1);
      MEMORY[0x24C569DE0](v33, -1, -1);
    }
    else
    {
    }
    return;
  }
  uint64_t v87 = v6;
  type metadata accessor for FileAttributeKey(0);
  uint64_t v19 = v18;
  uint64_t v88 = sub_247D11C08(&qword_26B137A88, type metadata accessor for FileAttributeKey);
  uint64_t v89 = v19;
  uint64_t v20 = sub_247D28470();
  id v21 = v17;

  uint64_t v22 = (void *)*MEMORY[0x263F080A8];
  if (*(void *)(v20 + 16))
  {
    id v23 = v22;
    unint64_t v24 = sub_247D10788((uint64_t)v23);
    if (v25)
    {
      sub_247D11F0C(*(void *)(v20 + 56) + 32 * v24, (uint64_t)&v96);
    }
    else
    {
      long long v96 = 0u;
      long long v97 = 0u;
    }
  }
  else
  {
    long long v96 = 0u;
    long long v97 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v97 + 1))
  {

    sub_247D11E98((uint64_t)&v96);
    return;
  }
  type metadata accessor for FileProtectionType(0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return;
  }
  uint64_t v37 = (void *)*MEMORY[0x263F080B0];
  id v86 = v95;
  uint64_t v38 = sub_247D284D0();
  uint64_t v40 = v39;
  if (v38 == sub_247D284D0() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:

LABEL_23:
    return;
  }
  char v42 = sub_247D28800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_22;
  }
  uint64_t v83 = sub_247D27DC0();
  uint64_t v85 = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8438);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247D29080;
  *(void *)(inited + 32) = v22;
  *(void *)(inited + 40) = v37;
  id v45 = v22;
  id v46 = v37;
  unint64_t v84 = sub_247D15480(inited);
  sub_247D0BE4C(v84);
  uint64_t v82 = MEMORY[0x263F8EE58] + 8;
  uint64_t v47 = (void *)sub_247D28460();
  swift_bridgeObjectRelease();
  sub_247D27E20();
  char v48 = (void *)sub_247D284A0();
  swift_bridgeObjectRelease();
  *(void *)&long long v96 = 0;
  unsigned int v49 = objc_msgSend(v14, sel_setAttributes_ofItemAtPath_error_, v47, v48, &v96);

  if (!v49)
  {
    id v73 = (id)v96;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v27 = (void *)sub_247D27D80();

LABEL_35:
    swift_willThrow();

    id v14 = v86;
    goto LABEL_6;
  }
  id v50 = (id)v96;
  sub_247D0BE4C(v84);
  uint64_t v82 = sub_247D28460();
  swift_bridgeObjectRelease();
  sub_247D27DF0();
  *(void *)&long long v96 = v83;
  *((void *)&v96 + 1) = v85;
  swift_bridgeObjectRetain();
  sub_247D28510();
  uint64_t v51 = v93;
  v52 = *(void (**)(void))(v93 + 104);
  unsigned int v79 = *MEMORY[0x263F06E50];
  uint64_t v53 = v92;
  uint64_t v80 = v93 + 104;
  v78 = (void (*)(char *, void, uint64_t))v52;
  v52(v5);
  unint64_t v77 = sub_247D11E30();
  sub_247D27E50();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v51 + 8);
  uint64_t v93 = v51 + 8;
  uint64_t v76 = v54;
  v54(v5, v53);
  swift_bridgeObjectRelease();
  uint64_t v55 = *(void (**)(char *, uint64_t))(v91 + 8);
  uint64_t v56 = v87;
  v55(v11, v87);
  sub_247D27E20();
  uint64_t v81 = v55;
  v55(v13, v56);
  uint64_t v57 = (void *)sub_247D284A0();
  swift_bridgeObjectRelease();
  *(void *)&long long v96 = 0;
  uint64_t v58 = (void *)v82;
  LODWORD(v51) = objc_msgSend(v14, sel_setAttributes_ofItemAtPath_error_, v82, v57, &v96);

  id v59 = (id)v96;
  if (!v51)
  {
    uint64_t v74 = v59;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_34:
    uint64_t v27 = (void *)sub_247D27D80();

    goto LABEL_35;
  }
  sub_247D0BE4C(v84);
  swift_bridgeObjectRelease();
  uint64_t v60 = (void *)sub_247D28460();
  swift_bridgeObjectRelease();
  sub_247D27DF0();
  *(void *)&long long v96 = v83;
  *((void *)&v96 + 1) = v85;
  sub_247D28510();
  uint64_t v61 = v92;
  v78(v5, v79, v92);
  sub_247D27E50();
  v76(v5, v61);
  swift_bridgeObjectRelease();
  os_log_type_t v62 = v81;
  v81(v11, v56);
  sub_247D27E20();
  v62(v13, v56);
  uint64_t v63 = (void *)sub_247D284A0();
  swift_bridgeObjectRelease();
  *(void *)&long long v96 = 0;
  LODWORD(v61) = objc_msgSend(v14, sel_setAttributes_ofItemAtPath_error_, v60, v63, &v96);

  id v64 = (id)v96;
  if (!v61)
  {
    uint64_t v74 = v64;
    goto LABEL_34;
  }
  if (qword_26B137110 != -1) {
    swift_once();
  }
  uint64_t v65 = sub_247D28220();
  __swift_project_value_buffer(v65, (uint64_t)qword_26B137118);
  uint64_t v66 = v90;
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v90, v94, v56);
  unsigned int v67 = sub_247D28200();
  os_log_type_t v68 = sub_247D28630();
  if (!os_log_type_enabled(v67, v68))
  {

    v62(v66, v56);
    goto LABEL_23;
  }
  uint64_t v69 = (uint8_t *)swift_slowAlloc();
  uint64_t v70 = swift_slowAlloc();
  *(void *)&long long v96 = v70;
  *(_DWORD *)uint64_t v69 = 136315138;
  uint64_t v71 = sub_247D27E20();
  uint64_t v95 = (void *)sub_247D1E1F8(v71, v72, (uint64_t *)&v96);
  sub_247D28640();
  swift_bridgeObjectRelease();
  v81(v90, v87);
  _os_log_impl(&dword_247D0A000, v67, v68, "Fixed file protection on %s", v69, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24C569DE0](v70, -1, -1);
  MEMORY[0x24C569DE0](v69, -1, -1);
}

uint64_t sub_247D11C08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247D11C50()
{
  return sub_247D21AF8();
}

uint64_t method lookup function for StoreContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoreContext);
}

uint64_t sub_247D11C84()
{
  return type metadata accessor for Store();
}

uint64_t type metadata accessor for Store()
{
  uint64_t result = qword_26B1378B8;
  if (!qword_26B1378B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247D11CD8()
{
  uint64_t result = sub_247D27E60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for Store(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Store);
}

uint64_t dispatch thunk of Store.makeContext()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_247D11E30()
{
  unint64_t result = qword_26B137A58;
  if (!qword_26B137A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137A58);
  }
  return result;
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_247D11E98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8430);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

uint64_t sub_247D11F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_247D11F68(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_247D11F78()
{
  return swift_release();
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_247D1202C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247D0ED60(a1, *(void *)(v2 + 16), *(void (**)(void, void))(v2 + 24), *(void *)(v2 + 32), *(void (**)(void, void))(v2 + 40), a2);
}

uint64_t sub_247D12038@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247D0E598(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a2);
}

unint64_t sub_247D12054()
{
  unint64_t result = qword_26B1371A0;
  if (!qword_26B1371A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1371A8);
    sub_247D120D0();
    sub_247D12144();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1371A0);
  }
  return result;
}

unint64_t sub_247D120D0()
{
  unint64_t result = qword_26B137190;
  if (!qword_26B137190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B137130);
    sub_247D12144();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137190);
  }
  return result;
}

unint64_t sub_247D12144()
{
  unint64_t result = qword_26B1371B0;
  if (!qword_26B1371B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1371C0);
    sub_247D121E0(&qword_26B1371C8, &qword_26B1371D8);
    sub_247D12250();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1371B0);
  }
  return result;
}

uint64_t sub_247D121E0(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_247D12250()
{
  unint64_t result = qword_26B137138;
  if (!qword_26B137138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1371F8);
    sub_247D122E8(&qword_26B137200, &qword_26B137210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137138);
  }
  return result;
}

uint64_t sub_247D122E8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247D1232C@<X0>(uint64_t *a1@<X8>)
{
  return sub_247D0F2D0(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_247D12360(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_247D123A8()
{
  return sub_247D11C08(&qword_2692C8468, type metadata accessor for FileAttributeKey);
}

uint64_t sub_247D123F0()
{
  return sub_247D11C08(&qword_2692C8470, type metadata accessor for FileAttributeKey);
}

uint64_t sub_247D12438()
{
  return sub_247D11C08(&qword_2692C8478, type metadata accessor for FileProtectionType);
}

uint64_t sub_247D12480()
{
  return sub_247D11C08(&qword_2692C8480, type metadata accessor for FileProtectionType);
}

uint64_t sub_247D124C8()
{
  return sub_247D11C08(&qword_2692C8488, type metadata accessor for FileProtectionType);
}

uint64_t sub_247D12510()
{
  return sub_247D11C08(&qword_2692C8490, type metadata accessor for URLResourceKey);
}

uint64_t sub_247D12558()
{
  return sub_247D11C08(&qword_2692C8498, type metadata accessor for URLResourceKey);
}

uint64_t sub_247D125A0()
{
  return sub_247D11C08(&qword_2692C84A0, type metadata accessor for URLResourceKey);
}

uint64_t sub_247D125E8()
{
  return sub_247D11C08(&qword_26B137A90, type metadata accessor for FileAttributeKey);
}

uint64_t sub_247D12640()
{
  return sub_247D11C50();
}

ValueMetadata *type metadata accessor for ContainerLookup()
{
  return &type metadata for ContainerLookup;
}

void sub_247D12684()
{
  if (container_copy_sandbox_token())
  {
    if (sandbox_extension_consume() != -1)
    {
      JUMPOUT(0x24C569DE0);
    }
    sub_247D28670();
    uint64_t v1 = sub_247D28510();
    int v2 = MEMORY[0x24C5690B0](v1);
    if (!strerror(v2)) {
      __break(1u);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692C84D0);
    sub_247D28710();
    uint64_t v3 = sub_247D28510();
    MEMORY[0x24C5690B0](v3);
    sub_247D287F0();
    sub_247D28510();
    swift_bridgeObjectRelease();
    sub_247D28510();
    uint64_t v4 = (void *)sub_247D284A0();
    swift_bridgeObjectRelease();
    SelfDestruct(v4);
  }
  uint64_t v0 = (void *)sub_247D284A0();
  SelfDestruct(v0);
}

unint64_t destroy for ContainerLookup.RetrieveContainerError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18AppPlaceholderSync15ContainerLookupV22RetrieveContainerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for ContainerLookup.RetrieveContainerError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ContainerLookup.RetrieveContainerError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContainerLookup.RetrieveContainerError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ContainerLookup.RetrieveContainerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_247D12A14(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_247D12A30(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerLookup.RetrieveContainerError()
{
  return &type metadata for ContainerLookup.RetrieveContainerError;
}

uint64_t sub_247D12A60()
{
  uint64_t v0 = type metadata accessor for Defaults();
  __swift_allocate_value_buffer(v0, qword_26B137980);
  unint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_26B137980);
  return sub_247D12AAC(v1);
}

uint64_t sub_247D12AAC@<X0>(void *a1@<X8>)
{
  v126[12] = *MEMORY[0x263EF8340];
  uint64_t v111 = sub_247D281F0();
  uint64_t v108 = *(void *)(v111 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v111);
  uint64_t v110 = (char *)&v101 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v107 = (char *)&v101 - v5;
  MEMORY[0x270FA5388](v4);
  v109 = (char *)&v101 - v6;
  uint64_t v120 = sub_247D27DA0();
  uint64_t v7 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v9 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137218);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247D27E60();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v112 = (char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v106 = (uint64_t *)((char *)&v101 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v101 - v19;
  v124 = a1;
  *a1 = 2;
  _set_user_dir_suffix();
  id v21 = objc_msgSend(self, sel_standardUserDefaults);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C84D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247D29080;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000247D2A660;
  *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 48) = 1;
  sub_247D1558C(inited);
  id v23 = (void *)sub_247D28460();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_registerDefaults_, v23);

  if (!container_query_create())
  {
    sub_247D15210();
    uint64_t v90 = swift_allocError();
    *uint64_t v91 = 0;
    v91[1] = 0;
    goto LABEL_31;
  }
  container_query_set_class();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  xpc_string_create("com.apple.appplaceholdersyncd");
  container_query_set_identifiers();
  swift_unknownObjectRelease();
  if (!container_query_get_single_result())
  {
    unint64_t v92 = 0x8000000247D2A6F0;
    if (container_query_get_last_error())
    {
      uint64_t v96 = container_error_copy_unlocalized_description();
      uint64_t v93 = 0xD000000000000017;
      if (v96)
      {
        uint64_t v97 = v96;
        uint64_t v93 = sub_247D28520();
        unint64_t v92 = v98;
        MEMORY[0x24C569DE0](v97, -1, -1);
      }
    }
    else
    {
      uint64_t v93 = 0xD000000000000017;
    }
    sub_247D15210();
    uint64_t v90 = swift_allocError();
    *uint64_t v99 = v93;
    v99[1] = v92;
LABEL_31:
    swift_willThrow();
    v126[0] = 0;
    v126[1] = 0xE000000000000000;
    sub_247D28670();
    sub_247D28510();
    uint64_t v125 = v90;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF0);
    sub_247D28710();
    uint64_t v100 = (void *)sub_247D284A0();
    swift_bridgeObjectRelease();
    SelfDestruct(v100);
  }
  path = (const char *)container_get_path();
  if (!path)
  {
    sub_247D15210();
    uint64_t v90 = swift_allocError();
    *uint64_t v94 = xmmword_247D29710;
    goto LABEL_31;
  }
  char v25 = v9;
  if ((uint64_t)strlen(path) <= 0)
  {
    sub_247D15210();
    uint64_t v90 = swift_allocError();
    *uint64_t v95 = xmmword_247D29700;
    goto LABEL_31;
  }
  sub_247D12684();
  uint64_t v26 = v14;
  uint64_t v27 = v14 + 56;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v117 = v27;
  v28(v12, 1, 1, v13);
  sub_247D27E00();
  sub_247D15264((uint64_t)v12);
  id v29 = (int *)type metadata accessor for Defaults();
  id v30 = (char *)v124 + v29[9];
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v103 = v26 + 32;
  uint64_t v104 = v31;
  v113 = v30;
  v31(v30, v20, v13);
  unsigned int v118 = *MEMORY[0x263F06E30];
  os_log_type_t v32 = *(void (**)(char *))(v7 + 104);
  uint64_t v33 = v9;
  uint64_t v122 = v7 + 104;
  uint64_t v34 = v120;
  v32(v33);
  id v35 = v32;
  uint64_t v102 = v26;
  id v123 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v121 = v26 + 16;
  v123(v12, v30, v13);
  v28(v12, 0, 1, v13);
  uint64_t v36 = v124;
  v105 = (char *)v124 + v29[11];
  sub_247D27E30();
  uint64_t v37 = v118;
  v115 = (void (*)(char *, uint64_t, uint64_t))v35;
  ((void (*)(char *, void, uint64_t))v35)(v25, v118, v34);
  v123(v12, v113, v13);
  v28(v12, 0, 1, v13);
  v116 = v28;
  uint64_t v38 = v29[10];
  v119 = v29;
  unint64_t v114 = (char *)v36 + v38;
  sub_247D27E30();
  ((void (*)(char *, uint64_t, uint64_t))v35)(v25, v37, v34);
  v123(v12, v113, v13);
  v28(v12, 0, 1, v13);
  uint64_t v39 = v106;
  sub_247D27E30();
  uint64_t v40 = v112;
  sub_247D27D90();
  (*(void (**)(void *, uint64_t))(v102 + 8))(v39, v13);
  v104((char *)v124 + v29[6], v40, v13);
  v126[0] = 0;
  v126[1] = 0xE000000000000000;
  sub_247D28670();
  swift_bridgeObjectRelease();
  v126[0] = 0xD000000000000010;
  v126[1] = 0x8000000247D2A710;
  uint64_t v125 = 2;
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  v113 = (char *)v126[1];
  uint64_t v41 = v118;
  char v42 = v115;
  v115(v25, v118, v34);
  v123(v12, v105, v13);
  uint64_t v43 = v116;
  v116(v12, 0, 1, v13);
  sub_247D27E30();
  v42(v25, v41, v120);
  v123(v12, v114, v13);
  v43(v12, 0, 1, v13);
  sub_247D27E30();
  v113 = (char *)self;
  id v44 = objc_msgSend(v113, sel_defaultManager);
  id v45 = (void *)sub_247D27DD0();
  v126[0] = 0;
  LODWORD(v29) = objc_msgSend(v44, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v45, 1, 0, v126);

  if (v29)
  {
    id v46 = (id)v126[0];
  }
  else
  {
    id v47 = (id)v126[0];
    char v48 = (void *)sub_247D27D80();

    swift_willThrow();
    uint64_t v49 = sub_247D27E20();
    unint64_t v51 = v50;
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_247D28220();
    __swift_project_value_buffer(v52, (uint64_t)qword_26B137118);
    id v53 = v48;
    swift_bridgeObjectRetain();
    id v54 = v48;
    uint64_t v55 = sub_247D28200();
    os_log_type_t v56 = sub_247D28620();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v106 = (void *)swift_slowAlloc();
      uint64_t v112 = (char *)swift_slowAlloc();
      v126[0] = (uint64_t)v112;
      *(_DWORD *)uint64_t v57 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v125 = sub_247D1E1F8(v49, v51, v126);
      sub_247D28640();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v57 + 12) = 2112;
      id v58 = v48;
      uint64_t v59 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v125 = v59;
      sub_247D28640();
      uint64_t v60 = v106;
      *uint64_t v106 = v59;

      _os_log_impl(&dword_247D0A000, v55, v56, "error creating %s: %@", (uint8_t *)v57, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v60, -1, -1);
      uint64_t v61 = v112;
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v61, -1, -1);
      MEMORY[0x24C569DE0](v57, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  v126[0] = 0;
  v126[1] = 0xE000000000000000;
  sub_247D28670();
  swift_bridgeObjectRelease();
  strcpy((char *)v126, "Placeholders-v");
  HIBYTE(v126[1]) = -18;
  uint64_t v125 = 2;
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  v115(v25, v118, v120);
  v123(v12, v114, v13);
  v116(v12, 0, 1, v13);
  sub_247D27E30();
  id v62 = objc_msgSend(v113, sel_defaultManager);
  uint64_t v63 = (void *)sub_247D27DD0();
  v126[0] = 0;
  unsigned int v64 = objc_msgSend(v62, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v63, 1, 0, v126);

  if (v64)
  {
    id v65 = (id)v126[0];
  }
  else
  {
    id v66 = (id)v126[0];
    unsigned int v67 = (void *)sub_247D27D80();

    swift_willThrow();
    uint64_t v68 = sub_247D27E20();
    unint64_t v70 = v69;
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_247D28220();
    __swift_project_value_buffer(v71, (uint64_t)qword_26B137118);
    id v72 = v67;
    swift_bridgeObjectRetain();
    id v73 = v67;
    uint64_t v74 = sub_247D28200();
    os_log_type_t v75 = sub_247D28620();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = swift_slowAlloc();
      unint64_t v77 = (void *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      v126[0] = v78;
      *(_DWORD *)uint64_t v76 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v125 = sub_247D1E1F8(v68, v70, v126);
      sub_247D28640();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v76 + 12) = 2112;
      id v79 = v67;
      uint64_t v80 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v125 = v80;
      sub_247D28640();
      *unint64_t v77 = v80;

      _os_log_impl(&dword_247D0A000, v74, v75, "error creating %s: %@", (uint8_t *)v76, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v77, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v78, -1, -1);
      MEMORY[0x24C569DE0](v76, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  uint64_t v81 = v111;
  uint64_t v82 = v110;
  uint64_t v83 = v109;
  unint64_t v84 = v107;
  sub_247D281B0();
  sub_247D281C0();
  char v85 = sub_247D281E0();
  uint64_t v86 = v108;
  uint64_t v87 = *(void (**)(char *, uint64_t))(v108 + 8);
  v87(v84, v81);
  (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v82, v83, v81);
  if (v85)
  {
    char v88 = 1;
  }
  else
  {
    sub_247D281D0();
    char v88 = sub_247D281E0();
    v87(v84, v81);
  }
  v87(v82, v81);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v87)(v83, v81);
  *((unsigned char *)v124 + v119[12]) = v88 & 1;
  return result;
}

uint64_t static Defaults.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Defaults();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B137980);
  swift_beginAccess();
  return sub_247D13DD4(v3, a1);
}

uint64_t type metadata accessor for Defaults()
{
  uint64_t result = qword_26B137158;
  if (!qword_26B137158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247D13DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Defaults();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static Defaults.shared.setter(uint64_t a1)
{
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Defaults();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B137980);
  swift_beginAccess();
  sub_247D13ED4(a1, v3);
  swift_endAccess();
  return sub_247D13F38(a1);
}

uint64_t sub_247D13ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Defaults();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_247D13F38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Defaults();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*static Defaults.shared.modify())()
{
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Defaults();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B137980);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t Defaults.schemaVersion.getter()
{
  return *(void *)v0;
}

uint64_t Defaults.publisherStoreURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 20);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.tmpURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 24);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.generatedPlaceholdersDirURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 28);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.installedPlaceholdersDirURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 32);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.containerURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 36);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.cachesDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 40);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.documentsDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Defaults() + 44);
  uint64_t v4 = sub_247D27E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Defaults.supportedPlatform.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Defaults() + 48));
}

id Defaults.lastSchemaVersion.getter()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v1 = (void *)sub_247D284A0();
  id v2 = objc_msgSend(v0, sel_integerForKey_, v1);

  return v2;
}

void sub_247D1442C(void *a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v3 = (void *)sub_247D284A0();
  id v4 = objc_msgSend(v2, sel_integerForKey_, v3);

  *a1 = v4;
}

void sub_247D144BC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  id v3 = (id)sub_247D284A0();
  objc_msgSend(v2, sel_setInteger_forKey_, v1, v3);
}

void Defaults.lastSchemaVersion.setter(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  id v3 = (id)sub_247D284A0();
  objc_msgSend(v2, sel_setInteger_forKey_, a1, v3);
}

void (*Defaults.lastSchemaVersion.modify(void *a1))(uint64_t *a1)
{
  id v2 = self;
  a1[1] = v2;
  id v3 = objc_msgSend(v2, sel_standardUserDefaults);
  id v4 = (void *)sub_247D284A0();
  id v5 = objc_msgSend(v3, sel_integerForKey_, v4);

  *a1 = v5;
  return sub_247D146A4;
}

void sub_247D146A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  id v3 = objc_msgSend((id)a1[1], sel_standardUserDefaults);
  id v2 = (void *)sub_247D284A0();
  objc_msgSend(v3, sel_setInteger_forKey_, v1, v2);
}

char *initializeBufferWithCopyOfBuffer for Defaults(char *a1, char *a2, int *a3)
{
  id v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *(void *)a2;
    *(void *)id v4 = *(void *)a2;
    id v4 = (char *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_247D27E60();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v11(&v4[a3[6]], &a2[a3[6]], v10);
    v11(&v4[a3[7]], &a2[a3[7]], v10);
    v11(&v4[a3[8]], &a2[a3[8]], v10);
    v11(&v4[a3[9]], &a2[a3[9]], v10);
    v11(&v4[a3[10]], &a2[a3[10]], v10);
    v11(&v4[a3[11]], &a2[a3[11]], v10);
    v4[a3[12]] = a2[a3[12]];
  }
  return v4;
}

uint64_t destroy for Defaults(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_247D27E60();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  v8(a1 + a2[6], v5);
  v8(a1 + a2[7], v5);
  v8(a1 + a2[8], v5);
  v8(a1 + a2[9], v5);
  v8(a1 + a2[10], v5);
  uint64_t v6 = a1 + a2[11];

  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v5);
}

char *initializeWithCopy for Defaults(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_247D27E60();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  a1[a3[12]] = a2[a3[12]];
  return a1;
}

char *assignWithCopy for Defaults(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_247D27E60();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  a1[a3[12]] = a2[a3[12]];
  return a1;
}

char *initializeWithTake for Defaults(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_247D27E60();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  a1[a3[12]] = a2[a3[12]];
  return a1;
}

char *assignWithTake for Defaults(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_247D27E60();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  a1[a3[12]] = a2[a3[12]];
  return a1;
}

uint64_t getEnumTagSinglePayload for Defaults(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247D14F54);
}

uint64_t sub_247D14F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247D27E60();
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
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 48));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for Defaults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247D1503C);
}

uint64_t sub_247D1503C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_247D27E60();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 48)) = a2 + 1;
  }
  return result;
}

uint64_t sub_247D150FC()
{
  uint64_t result = sub_247D27E60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
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

unint64_t sub_247D15210()
{
  unint64_t result = qword_2692C84E0;
  if (!qword_2692C84E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2692C84E0);
  }
  return result;
}

uint64_t sub_247D15264(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137218);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247D152C4()
{
  uint64_t v0 = sub_247D28220();
  __swift_allocate_value_buffer(v0, qword_26B137118);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B137118);
  return sub_247D28210();
}

uint64_t logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B137110 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247D28220();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B137118);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t static ReplicatorConstants.clientIdentifier.getter()
{
  return 0xD000000000000029;
}

unint64_t static ReplicatorConstants.zoneIdentifier.getter()
{
  return 0xD000000000000010;
}

ValueMetadata *type metadata accessor for ReplicatorConstants()
{
  return &type metadata for ReplicatorConstants;
}

uint64_t sub_247D1542C()
{
  uint64_t v0 = sub_247D27FA0();
  __swift_allocate_value_buffer(v0, qword_26B137B38);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B137B38);
  return sub_247D27F80();
}

unint64_t sub_247D15480(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C84F8);
  uint64_t v2 = (void *)sub_247D28760();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_247D10788((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_247D1558C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8558);
  uint64_t v2 = sub_247D28760();
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
    sub_247D2099C(v6, (uint64_t)&v15, &qword_2692C8560);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_247D1081C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_247D11F68(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_247D156C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8548);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8550);
  uint64_t v6 = sub_247D28760();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247D2099C(v12, (uint64_t)v5, &qword_2692C8548);
    unint64_t result = sub_247D10894((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_247D280A0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = sub_247D27EE0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, v9, v20);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_247D158F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8538);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8528);
  uint64_t v6 = sub_247D28760();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247D2099C(v12, (uint64_t)v5, &qword_2692C8538);
    unint64_t result = sub_247D10968((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_247D27EE0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_247D15AEC()
{
  if (qword_26B1377C8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26B1377C0;
  type metadata accessor for SyncManager();
  uint64_t v1 = swift_allocObject();
  *(unsigned char *)(v1 + 32) = 0;
  *(void *)(v1 + 16) = v0;
  swift_retain();
  uint64_t result = sub_247D26F0C();
  *(void *)(v1 + 24) = result;
  qword_26B137148 = v1;
  return result;
}

uint64_t static SyncManager.shared.getter()
{
  if (qword_26B137588 != -1) {
    swift_once();
  }

  return swift_retain();
}

void static SyncManager.upgrade()()
{
  v65[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137218);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247D27DA0();
  uint64_t v4 = *(NSObject **)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v60 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_247D27E60();
  uint64_t v6 = *(char **)(v53 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v53);
  uint64_t v59 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v55 = (char *)&v44 - v9;
  id v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  if (qword_26B137150 != -1) {
LABEL_25:
  }
    swift_once();
  uint64_t v46 = type metadata accessor for Defaults();
  uint64_t v10 = (void **)__swift_project_value_buffer(v46, (uint64_t)qword_26B137980);
  id v11 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v12 = (void *)sub_247D284A0();
  uint64_t v13 = (char *)objc_msgSend(v11, sel_integerForKey_, v12);

  swift_beginAccess();
  id v45 = v10;
  char v15 = (char *)*v10;
  if ((uint64_t)v15 < (uint64_t)v13) {
    __break(1u);
  }
  uint64_t v54 = 0;
  uint64_t v63 = (void (**)(char *, char *, uint64_t))(v6 + 16);
  unsigned int v58 = *MEMORY[0x263F06E38];
  os_log_type_t v56 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v57 = v4 + 13;
  id v62 = (void (**)(char *, uint64_t))(v6 + 8);
  *(void *)&long long v14 = 136315394;
  long long v50 = v14;
  uint64_t v49 = MEMORY[0x263F8EE58] + 8;
  uint64_t v16 = v53;
  uint64_t v6 = v55;
  uint64_t v51 = v3;
  uint64_t v52 = v2;
  id v44 = v15;
  while (1)
  {
    if (v13 != (char *)1) {
      goto LABEL_19;
    }
    uint64_t v17 = (char *)v45 + *(int *)(v46 + 40);
    uint64_t v61 = *v63;
    v61(v6, v17, v16);
    sub_247D27E20();
    uint64_t v18 = (void *)sub_247D284A0();
    swift_bridgeObjectRelease();
    v65[0] = 0;
    id v19 = objc_msgSend(v64, sel_contentsOfDirectoryAtPath_error_, v18, v65);

    uint64_t v4 = v65[0];
    if (v19)
    {
      uint64_t v48 = 1;
      uint64_t v20 = sub_247D28560();
      uint64_t v21 = v4;

      uint64_t v22 = *(void *)(v20 + 16);
      uint64_t v47 = v20;
      if (v22)
      {
        uint64_t v23 = (unint64_t *)(v20 + 40);
        do
        {
          uint64_t v24 = *(v23 - 1);
          unint64_t v25 = *v23;
          swift_bridgeObjectRetain();
          if (sub_247D28540()) {
            goto LABEL_8;
          }
          ((void (*)(char *, void, uint64_t))v57->isa)(v60, v58, v3);
          v61(v2, v6, v16);
          (*v56)(v2, 0, 1, v16);
          swift_bridgeObjectRetain();
          uint64_t v26 = v59;
          sub_247D27E30();
          uint64_t v27 = (void *)sub_247D27DD0();
          (*v62)(v26, v16);
          v65[0] = 0;
          uint64_t v4 = objc_msgSend(v64, sel_removeItemAtURL_error_, v27, v65);

          id v28 = v65[0];
          if (v4)
          {
LABEL_8:
            swift_bridgeObjectRelease();
          }
          else
          {
            id v29 = v28;
            id v30 = (void *)sub_247D27D80();

            swift_willThrow();
            if (qword_26B137110 != -1) {
              swift_once();
            }
            uint64_t v54 = 0;
            uint64_t v31 = sub_247D28220();
            __swift_project_value_buffer(v31, (uint64_t)qword_26B137118);
            id v32 = v30;
            swift_bridgeObjectRetain();
            id v33 = v30;
            uint64_t v4 = sub_247D28200();
            os_log_type_t v34 = sub_247D28620();
            if (os_log_type_enabled(v4, v34))
            {
              uint64_t v35 = swift_slowAlloc();
              uint64_t v36 = (void *)swift_slowAlloc();
              uint64_t v37 = (void *)swift_slowAlloc();
              v65[0] = v37;
              *(_DWORD *)uint64_t v35 = v50;
              swift_bridgeObjectRetain();
              *(void *)(v35 + 4) = sub_247D1E1F8(v24, v25, (uint64_t *)v65);
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v35 + 12) = 2112;
              id v38 = v30;
              uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
              *(void *)(v35 + 14) = v39;
              *uint64_t v36 = v39;

              _os_log_impl(&dword_247D0A000, v4, v34, "error removing %s: %@", (uint8_t *)v35, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
              swift_arrayDestroy();
              uint64_t v40 = v36;
              uint64_t v3 = v51;
              MEMORY[0x24C569DE0](v40, -1, -1);
              swift_arrayDestroy();
              uint64_t v41 = v37;
              uint64_t v2 = v52;
              MEMORY[0x24C569DE0](v41, -1, -1);
              MEMORY[0x24C569DE0](v35, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            uint64_t v16 = v53;
            uint64_t v6 = v55;
          }
          v23 += 2;
          --v22;
        }
        while (v22);
      }
      swift_bridgeObjectRelease();
      (*v62)(v6, v16);
      uint64_t v13 = (char *)v48;
      char v15 = v44;
LABEL_19:
      if (v13 == v15) {
        break;
      }
      goto LABEL_20;
    }
    id v43 = v65[0];
    uint64_t v4 = sub_247D27D80();

    swift_willThrow();
    uint64_t v6 = v55;
    (*v62)(v55, v16);

    uint64_t v54 = 0;
    if (v15 == (char *)1) {
      break;
    }
LABEL_20:
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
  }
}

void sub_247D163A8(uint64_t a1, Swift::OpaquePointer a2)
{
  uint64_t v3 = sub_247D28190();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = sub_247D280F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F63F50], v4);
  sub_247D28020();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  StoreContext.delete(items:)(a2);
  if (v8)
  {
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_247D28220();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B137118);
    id v10 = v8;
    id v11 = v8;
    uint64_t v12 = sub_247D28200();
    os_log_type_t v13 = sub_247D28620();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      char v15 = (void *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v21 = v16;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v20 = sub_247D1E1F8(0xD000000000000020, 0x8000000247D2A870, &v21);
      sub_247D28640();
      *(_WORD *)(v14 + 12) = 2112;
      id v17 = v8;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v20 = v18;
      sub_247D28640();
      void *v15 = v18;

      _os_log_impl(&dword_247D0A000, v12, v13, "%s: error deleting items: %@", (uint8_t *)v14, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v15, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v16, -1, -1);
      MEMORY[0x24C569DE0](v14, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_247D16A8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247D28190();
  uint64_t v39 = *(void *)(v2 - 8);
  uint64_t v40 = v2;
  MEMORY[0x270FA5388](v2);
  id v38 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247D280F0();
  uint64_t v42 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v41 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t isUniquelyReferenced_nonNull_native = sub_247D27EE0();
  uint64_t v43 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = MEMORY[0x263F8EE78];
  unint64_t v50 = sub_247D158F8(MEMORY[0x263F8EE78]);
  unint64_t v9 = StoreContext.fetchAllItems()();
  unint64_t v10 = v9;
  if (v9 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_247D28730();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11)
    {
LABEL_3:
      uint64_t v36 = v1;
      uint64_t v37 = v4;
      unint64_t v46 = v10 & 0xC000000000000001;
      uint64_t v47 = (void (**)(char *, uint64_t, uint64_t))(v43 + 16);
      unint64_t v44 = v10;
      id v45 = (void (**)(char *, uint64_t))(v43 + 8);
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v12 = v4 - 4;
        if (v46)
        {
          uint64_t v13 = MEMORY[0x24C569500](v4 - 4, v10);
          uint64_t v14 = v4 - 3;
          if (__OFADD__(v12, 1)) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v13 = swift_retain();
          uint64_t v14 = v4 - 3;
          if (__OFADD__(v12, 1))
          {
LABEL_21:
            __break(1u);
LABEL_22:
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
        }
        uint64_t v48 = v14;
        uint64_t v15 = v11;
        uint64_t v16 = v13;
        id v17 = *v47;
        uint64_t v1 = isUniquelyReferenced_nonNull_native;
        (*v47)(v8, v13 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier, isUniquelyReferenced_nonNull_native);
        unint64_t v18 = v50;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v49 = (void *)v18;
        unint64_t v50 = 0x8000000000000000;
        uint64_t v19 = (uint64_t)v8;
        unint64_t v10 = sub_247D10968((uint64_t)v8);
        uint64_t v21 = *(void *)(v18 + 16);
        BOOL v22 = (v20 & 1) == 0;
        uint64_t v23 = v21 + v22;
        if (__OFADD__(v21, v22)) {
          goto LABEL_22;
        }
        char v24 = v20;
        if (*(void *)(v18 + 24) >= v23)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_247D1EFE4();
          }
        }
        else
        {
          sub_247D1EBD8(v23, isUniquelyReferenced_nonNull_native);
          unint64_t v25 = sub_247D10968(v19);
          if ((v24 & 1) != (v26 & 1))
          {
            uint64_t result = sub_247D28810();
            __break(1u);
            return result;
          }
          unint64_t v10 = v25;
        }
        uint64_t isUniquelyReferenced_nonNull_native = v1;
        uint64_t v27 = v49;
        if (v24)
        {
          *(void *)(v49[7] + 8 * v10) = v16;
          swift_release();
          uint64_t v8 = (char *)v19;
        }
        else
        {
          v49[(v10 >> 6) + 8] |= 1 << v10;
          uint64_t v8 = (char *)v19;
          v17((char *)(v27[6] + *(void *)(v43 + 72) * v10), v19, v1);
          *(void *)(v27[7] + 8 * v10) = v16;
          uint64_t v28 = v27[2];
          BOOL v29 = __OFADD__(v28, 1);
          uint64_t v30 = v28 + 1;
          if (v29) {
            goto LABEL_23;
          }
          v27[2] = v30;
        }
        unint64_t v50 = (unint64_t)v27;
        swift_bridgeObjectRelease();
        (*v45)(v8, v1);
        ++v4;
        uint64_t v11 = v15;
        unint64_t v10 = v44;
        if (v48 == v15)
        {
          swift_bridgeObjectRelease();
          uint64_t v4 = v37;
          goto LABEL_26;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_26:
  uint64_t v31 = sub_247D27FF0();
  id v33 = v41;
  uint64_t v32 = v42;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  *(&v36 - 2) = (uint64_t)&v50;
  *(&v36 - 1) = (uint64_t)&v51;
  sub_247D1F644(v34, (void (*)(char *, char *))sub_247D208A0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v33, *MEMORY[0x263F63F50], v4);
  swift_bridgeObjectRetain();
  sub_247D28020();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_247D174F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v8 = sub_247D280A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(*(void *)a3 + 16) || (unint64_t result = sub_247D10968(a2), (v13 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
    unint64_t v14 = *a4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_247D1DDE0(0, *(void *)(v14 + 16) + 1, 1, v14);
      *a4 = v14;
    }
    unint64_t v17 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_247D1DDE0(v16 > 1, v17 + 1, 1, v14);
      *a4 = v14;
    }
    *(void *)(v14 + 16) = v17 + 1;
    return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v17, v11, v8);
  }
  return result;
}

void sub_247D17690(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (objc_msgSend(a1, sel_developerType) == 1) {
    return;
  }
  id v6 = objc_msgSend(a1, sel_bundleIdentifier);
  if (!v6) {
    return;
  }
  id v26 = v6;
  uint64_t v7 = sub_247D284D0();
  uint64_t v9 = v8;
  id v10 = objc_msgSend(a1, sel_shortVersionString);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_247D284D0();
    uint64_t v14 = v13;

    uint64_t v15 = sub_247D18840();
    unint64_t v17 = sub_247D0DF90(v7, v9, v12, v14, v15, v16);
    unint64_t v18 = v17;
    if (v17 >> 62)
    {
      if (sub_247D28730()) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      if ((v18 & 0xC000000000000001) != 0)
      {
        uint64_t v19 = MEMORY[0x24C569500](0, v18);
        goto LABEL_9;
      }
      if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v19 = *(void *)(v18 + 32);
        swift_retain();
LABEL_9:
        swift_bridgeObjectRelease();
        sub_247D26050(v19);
        swift_bridgeObjectRelease();

        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
      __break(1u);
      goto LABEL_27;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(self, sel_applicationWithBundleIdentifier_, v26);

    unsigned int v21 = objc_msgSend(v20, sel_isHidden);
    if (!v21)
    {
      unint64_t v18 = *a4;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_21:
        unint64_t v24 = *(void *)(v18 + 16);
        unint64_t v23 = *(void *)(v18 + 24);
        if (v24 >= v23 >> 1)
        {
          unint64_t v18 = (unint64_t)sub_247D1E048((void *)(v23 > 1), v24 + 1, 1, (void *)v18);
          *a4 = v18;
        }
        *(void *)(v18 + 16) = v24 + 1;
        unint64_t v25 = (void *)(v18 + 16 * v24);
        void v25[4] = v7;
        v25[5] = v9;
        return;
      }
LABEL_27:
      unint64_t v18 = (unint64_t)sub_247D1E048(0, *(void *)(v18 + 16) + 1, 1, (void *)v18);
      *a4 = v18;
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_247D17988(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_247D179D4()
{
  id v10 = (void *)MEMORY[0x263F8EE78];
  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v0 = StoreContext.fetchAllItems()();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    id v6 = (void *)MEMORY[0x263F8EE78];
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_12:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8._rawValue = v6;
    sub_247D163A8(v7, v8);
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_247D28730();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x24C569500](v4, v1);
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      uint64_t v9 = v5;
      sub_247D17B40(&v9, (unint64_t *)&v11, &v10);
      swift_release();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    id v6 = v10;
    uint64_t v7 = v11;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_247D17B40(uint64_t *a1, unint64_t *a2, void *a3)
{
  unsigned int v67 = a2;
  uint64_t v6 = sub_247D28080();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v64 = (uint64_t)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v62 - v9;
  uint64_t v11 = sub_247D280A0();
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v66 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v69 = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v68 = (void *)((char *)v62 - v14);
  uint64_t v15 = *a1;
  uint64_t v16 = (uint64_t *)(*a1 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v19 = sub_247D25F74(v17, v18, 0);
  if (!v3)
  {
    id v26 = v19;
    v62[1] = 0;
    uint64_t v27 = *(void *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
    uint64_t v28 = *(void *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version + 8);
    swift_bridgeObjectRetain();
    id v29 = objc_msgSend(v26, sel_shortVersionString);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v63 = a3;
      uint64_t v31 = sub_247D284D0();
      uint64_t v33 = v32;

      if (v27 == v31 && v28 == v33)
      {
        swift_bridgeObjectRelease_n();
        char v36 = 0;
        a3 = v63;
        goto LABEL_24;
      }
      char v35 = sub_247D28800();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v36 = 0;
      a3 = v63;
      if (v35)
      {
LABEL_24:
        uint64_t v48 = self;
        uint64_t v49 = (void *)sub_247D284A0();
        id v50 = objc_msgSend(v48, sel_applicationWithBundleIdentifier_, v49);

        unsigned int v51 = objc_msgSend(v50, sel_isHidden);
        if ((v36 & 1) == 0)
        {
          uint64_t v52 = v68;
          if (!v51) {
            return;
          }
          goto LABEL_28;
        }
LABEL_27:
        uint64_t v52 = v68;
LABEL_28:
        sub_247D27EC0();
        uint64_t v53 = sub_247D27EE0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v10, 1, 1, v53);
        sub_247D207D8((uint64_t)v10, v64, MEMORY[0x263F63EE8]);
        sub_247D28060();
        sub_247D20200((uint64_t)v10);
        uint64_t v55 = v65;
        uint64_t v54 = v66;
        (*(void (**)(char *, void *, uint64_t))(v65 + 16))(v69, v52, v66);
        os_log_type_t v56 = v67;
        unint64_t v57 = *v67;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *os_log_type_t v56 = v57;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          unint64_t v57 = sub_247D1DDE0(0, *(void *)(v57 + 16) + 1, 1, v57);
          *unsigned int v67 = v57;
        }
        unint64_t v60 = *(void *)(v57 + 16);
        unint64_t v59 = *(void *)(v57 + 24);
        if (v60 >= v59 >> 1)
        {
          unint64_t v57 = sub_247D1DDE0(v59 > 1, v60 + 1, 1, v57);
          *unsigned int v67 = v57;
        }
        *(void *)(v57 + 16) = v60 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v57+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v60, v69, v54);
        uint64_t v61 = swift_retain();
        MEMORY[0x24C5693C0](v61);
        if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_247D28580();
        }
        sub_247D28590();
        sub_247D28570();
        (*(void (**)(void *, uint64_t))(v55 + 8))(v52, v54);
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    char v36 = 1;
    goto LABEL_24;
  }
  uint64_t v63 = a3;
  id v73 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF0);
  sub_247D2030C();
  swift_dynamicCast();
  id v20 = v72;
  id v21 = objc_msgSend(v72, sel_domain);
  uint64_t v22 = sub_247D284D0();
  uint64_t v24 = v23;

  if (v22 == sub_247D284D0() && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v37 = sub_247D28800();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (objc_msgSend(v20, sel_code) == (id)-10814)
  {

    a3 = v63;
    goto LABEL_27;
  }
LABEL_15:
  if (qword_26B137110 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_247D28220();
  __swift_project_value_buffer(v38, (uint64_t)qword_26B137118);
  swift_retain_n();
  id v39 = v20;
  uint64_t v40 = sub_247D28200();
  os_log_type_t v41 = sub_247D28610();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v68 = (void *)swift_slowAlloc();
    unint64_t v69 = (char *)swift_slowAlloc();
    uint64_t v71 = v69;
    *(_DWORD *)uint64_t v42 = 136315394;
    uint64_t v43 = *v16;
    unint64_t v44 = v16[1];
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_247D1E1F8(v43, v44, (uint64_t *)&v71);
    sub_247D28640();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2112;
    uint64_t v70 = (uint64_t)v39;
    id v45 = v39;
    sub_247D28640();
    unint64_t v46 = v68;
    *uint64_t v68 = v39;

    _os_log_impl(&dword_247D0A000, v40, v41, "syncPublisherWithLaunchServices: error locating LS record for %s: %@", (uint8_t *)v42, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
    swift_arrayDestroy();
    MEMORY[0x24C569DE0](v46, -1, -1);
    uint64_t v47 = v69;
    swift_arrayDestroy();
    MEMORY[0x24C569DE0](v47, -1, -1);
    MEMORY[0x24C569DE0](v42, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_247D18354()
{
  type metadata accessor for StoreContext();
  uint64_t v1 = swift_allocObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + 16) = sub_247D282E0();
  id v2 = objc_msgSend(self, sel_enumeratorWithOptions_, 192);
  uint64_t v13 = MEMORY[0x263F8EE78];
  id v3 = (void *)swift_allocObject();
  v3[2] = v1;
  v3[3] = v0;
  v3[4] = &v13;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_247D1E91C;
  *(void *)(v4 + 24) = v3;
  aBlock[4] = sub_247D1E938;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247D17988;
  aBlock[3] = &block_descriptor;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_swift_forEach_, v5);
  _Block_release(v5);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = v13;
    uint64_t v8 = *(void *)(v13 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = (unint64_t *)(v7 + 40);
      do
      {
        id v10 = (void *)*(v9 - 1);
        unint64_t v11 = *v9;
        swift_bridgeObjectRetain();
        sub_247D18B28(v10, v11);
        swift_bridgeObjectRelease();
        v9 += 2;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }

    swift_release();
    swift_bridgeObjectRelease();
    sub_247D179D4();
    sub_247D16A8C();
    return swift_release();
  }
  return result;
}

uint64_t sub_247D185D0()
{
  type metadata accessor for StoreContext();
  uint64_t v1 = swift_allocObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + 16) = sub_247D282E0();
  sub_247D1FB30();
  id v2 = objc_msgSend(self, sel_enumeratorWithOptions_, 192);
  uint64_t v13 = MEMORY[0x263F8EE78];
  id v3 = (void *)swift_allocObject();
  v3[2] = v1;
  v3[3] = v0;
  v3[4] = &v13;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_247D20A00;
  *(void *)(v4 + 24) = v3;
  aBlock[4] = sub_247D20A0C;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247D17988;
  aBlock[3] = &block_descriptor_14;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_swift_forEach_, v5);
  _Block_release(v5);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = v13;
    uint64_t v8 = *(void *)(v13 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = (unint64_t *)(v7 + 40);
      do
      {
        id v10 = (void *)*(v9 - 1);
        unint64_t v11 = *v9;
        swift_bridgeObjectRetain();
        sub_247D18B28(v10, v11);
        swift_bridgeObjectRelease();
        v9 += 2;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }

    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247D18840()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137248);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247D27EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247D27FD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_247D208F0((uint64_t)v2, &qword_26B137248);
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v7 = 0xD000000000000024;
    uint64_t v8 = sub_247D28220();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B137118);
    uint64_t v9 = sub_247D28200();
    os_log_type_t v10 = sub_247D28620();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_247D0A000, v9, v10, "Failed to get .localDeviceID from the replicator", v11, 2u);
      MEMORY[0x24C569DE0](v11, -1, -1);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    uint64_t v7 = sub_247D27EC0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

uint64_t sub_247D18A94(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    id v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v3 = (void *)*(v2 - 1);
      unint64_t v4 = *v2;
      swift_bridgeObjectRetain();
      sub_247D18B28(v3, v4);
      swift_bridgeObjectRelease();
      v2 += 2;
      --v1;
    }
    while (v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_247D18B28(void *a1, unint64_t a2)
{
  id v171 = a1;
  uint64_t v151 = sub_247D280F0();
  uint64_t v150 = *(void *)(v151 - 8);
  MEMORY[0x270FA5388](v151);
  v147 = (char *)&v141 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_247D27FB0();
  uint64_t v4 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  v146 = (char *)&v141 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v165 = sub_247D27EE0();
  uint64_t v164 = *(void *)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  v145 = (char *)&v141 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247D280E0();
  uint64_t v158 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v156 = (char *)&v141 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_247D280D0();
  uint64_t v155 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  os_log_type_t v10 = (char *)&v141 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247D27E60();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v166 = v11;
  uint64_t v167 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v141 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137218);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  v144 = (char *)&v141 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v160 = (unint64_t)&v141 - v19;
  MEMORY[0x270FA5388](v18);
  v159 = (char *)&v141 - v20;
  uint64_t v21 = sub_247D28080();
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v163 = (uint64_t)&v141 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v162 = (char *)&v141 - v24;
  uint64_t v25 = sub_247D280A0();
  uint64_t v168 = *(void *)(v25 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  v143 = (char *)&v141 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v153 = (char *)&v141 - v29;
  MEMORY[0x270FA5388](v28);
  v169 = (char *)&v141 - v30;
  if (qword_26B137110 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_247D28220();
  uint64_t v32 = __swift_project_value_buffer(v31, (uint64_t)qword_26B137118);
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_247D28200();
  os_log_type_t v34 = sub_247D28630();
  BOOL v35 = os_log_type_enabled(v33, v34);
  v161 = v14;
  uint64_t v152 = v7;
  v154 = v10;
  uint64_t v148 = v4;
  if (v35)
  {
    char v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = v32;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v175 = v38;
    *(_DWORD *)char v36 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v39 = (uint64_t)v171;
    uint64_t v172 = sub_247D1E1F8((uint64_t)v171, a2, &v175);
    sub_247D28640();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247D0A000, v33, v34, "Adding record for bundle identifier '%s'", v36, 0xCu);
    swift_arrayDestroy();
    uint64_t v40 = v38;
    uint64_t v32 = v37;
    MEMORY[0x24C569DE0](v40, -1, -1);
    MEMORY[0x24C569DE0](v36, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v39 = (uint64_t)v171;
  }
  os_log_type_t v41 = self;
  uint64_t v42 = (void *)sub_247D284A0();
  id v43 = objc_msgSend(v41, sel_applicationWithBundleIdentifier_, v42);

  id v171 = v43;
  unsigned __int8 v44 = objc_msgSend(v43, sel_isHidden);
  uint64_t v45 = v39;
  if ((v44 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_247D18840();
    uint64_t v52 = (char *)sub_247D267CC(v39, a2, v50, v51);
    v142 = (uint64_t *)v32;
    v176 = v52;
    type metadata accessor for StoreContext();
    uint64_t inited = swift_initStackObject();
    sub_247D282D0();
    swift_allocObject();
    swift_retain();
    *(void *)(inited + 16) = sub_247D282E0();
    sub_247D27EC0();
    uint64_t v54 = (uint64_t)v162;
    (*(void (**)(char *, uint64_t, uint64_t, void))(v164 + 56))(v162, 1, 1, v165);
    sub_247D207D8(v54, v163, MEMORY[0x263F63EE8]);
    sub_247D28060();
    sub_247D20200(v54);
    uint64_t v55 = v176;
    uint64_t v56 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier];
    uint64_t v57 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier + 8];
    uint64_t v59 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version];
    uint64_t v58 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version + 8];
    uint64_t v61 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier];
    uint64_t v60 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v163 = inited;
    unint64_t v62 = sub_247D0DF90(v56, v57, v59, v58, v61, v60);
    unint64_t v63 = v62;
    if (v62 >> 62) {
      uint64_t v64 = sub_247D28730();
    }
    else {
      uint64_t v64 = *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v65 = v142;
    if (v64)
    {
      if ((v63 & 0xC000000000000001) != 0)
      {
        uint64_t v66 = MEMORY[0x24C569500](0, v63);
      }
      else
      {
        if (!*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_43;
        }
        uint64_t v66 = *(void *)(v63 + 32);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      uint64_t v67 = sub_247D26050(v66);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      char v68 = sub_247D27E90();
      uint64_t v69 = v166;
      if (v68)
      {
        swift_retain_n();
        uint64_t v70 = sub_247D28200();
        os_log_type_t v71 = sub_247D28600();
        if (os_log_type_enabled(v70, v71))
        {
          id v72 = (uint8_t *)swift_slowAlloc();
          uint64_t v73 = swift_slowAlloc();
          uint64_t v175 = v73;
          *(_DWORD *)id v72 = 136315138;
          swift_retain();
          uint64_t v74 = SyncItem.description.getter();
          v162 = (char *)v25;
          unint64_t v76 = v75;
          swift_release();
          uint64_t v172 = sub_247D1E1F8(v74, v76, &v175);
          uint64_t v69 = v166;
          sub_247D28640();
          swift_release_n();
          uint64_t v25 = (uint64_t)v162;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247D0A000, v70, v71, "Existing item unchanged, will check for replicator record: %s", v72, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C569DE0](v73, -1, -1);
          MEMORY[0x24C569DE0](v72, -1, -1);
        }
        else
        {

          swift_release_n();
        }
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137180);
      uint64_t v78 = v168;
      unint64_t v79 = (*(unsigned __int8 *)(v168 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v168 + 80);
      uint64_t v80 = swift_allocObject();
      *(_OWORD *)(v80 + 16) = xmmword_247D29080;
      (*(void (**)(unint64_t, char *, uint64_t))(v78 + 16))(v80 + v79, v169, v25);
      uint64_t v77 = v167;
      uint64_t v81 = (uint64_t)v159;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v167 + 56))(v159, 1, 1, v69);
      uint64_t v82 = sub_247D28030();
      sub_247D208F0(v81, &qword_26B137218);
      swift_bridgeObjectRelease();
      uint64_t v83 = *(void *)(v82 + 16);
      swift_bridgeObjectRelease();
      if (v83)
      {
        swift_retain_n();
        unint64_t v84 = sub_247D28200();
        os_log_type_t v85 = sub_247D28600();
        if (os_log_type_enabled(v84, v85))
        {
          uint64_t v86 = (uint8_t *)swift_slowAlloc();
          uint64_t v87 = swift_slowAlloc();
          uint64_t v175 = v87;
          *(_DWORD *)uint64_t v86 = 136315138;
          swift_retain();
          uint64_t v88 = SyncItem.description.getter();
          uint64_t v89 = v25;
          unint64_t v91 = v90;
          swift_release();
          uint64_t v172 = sub_247D1E1F8(v88, v91, &v175);
          sub_247D28640();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247D0A000, v84, v85, "Have replicator record, will not add: %s", v86, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C569DE0](v87, -1, -1);
          MEMORY[0x24C569DE0](v86, -1, -1);
          swift_release();

          swift_release();
          (*(void (**)(char *, uint64_t))(v168 + 8))(v169, v89);
LABEL_39:
          swift_release();
          return;
        }
        swift_release_n();
LABEL_33:

        swift_release();
LABEL_38:
        (*(void (**)(char *, uint64_t))(v168 + 8))(v169, v25);
        goto LABEL_39;
      }
      swift_release();
      v176 = (char *)v67;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v69 = v166;
      uint64_t v77 = v167;
    }
    swift_beginAccess();
    uint64_t v92 = (uint64_t)v176;
    uint64_t v93 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier];
    uint64_t v94 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier + 8];
    swift_bridgeObjectRetain();
    uint64_t v95 = v93;
    uint64_t v96 = v160;
    sub_247D1AE18(v95, v94, v160);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v96, 1, v69) == 1)
    {
      sub_247D208F0(v96, &qword_26B137218);
      unint64_t v84 = sub_247D28200();
      os_log_type_t v97 = sub_247D28620();
      if (os_log_type_enabled(v84, v97))
      {
        unint64_t v98 = (uint8_t *)swift_slowAlloc();
        uint64_t v99 = swift_slowAlloc();
        uint64_t v174 = v99;
        *(_DWORD *)unint64_t v98 = 136315138;
        swift_retain();
        uint64_t v100 = v25;
        uint64_t v101 = SyncItem.description.getter();
        unint64_t v103 = v102;
        swift_release();
        uint64_t v173 = sub_247D1E1F8(v101, v103, &v174);
        sub_247D28640();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247D0A000, v84, v97, "Failed to create placeholder for %s", v98, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C569DE0](v99, -1, -1);
        MEMORY[0x24C569DE0](v98, -1, -1);

        swift_release();
        (*(void (**)(char *, uint64_t))(v168 + 8))(v169, v100);
        goto LABEL_39;
      }
      goto LABEL_33;
    }
    uint64_t v104 = (uint64_t)v161;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 32))(v161, v96, v69);
    sub_247D27D20();
    swift_allocObject();
    uint64_t v105 = sub_247D27D10();
    sub_247D27CF0();
    uint64_t v174 = v92;
    type metadata accessor for SyncItem();
    sub_247D208A8(&qword_26B137490, (void (*)(uint64_t))type metadata accessor for SyncItem);
    swift_retain();
    uint64_t v106 = sub_247D27D00();
    unint64_t v108 = v107;
    v159 = (char *)v105;
    swift_release();
    v109 = v144;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v144, v104, v69);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v77 + 56))(v109, 0, 1, v69);
    sub_247D2025C(v106, v108);
    uint64_t v59 = (uint64_t)v154;
    uint64_t v141 = v106;
    unint64_t v160 = v108;
    sub_247D280C0();
    uint64_t v110 = *(char **)(v168 + 16);
    v162 = (char *)v25;
    v144 = v110;
    ((void (*)(char *, char *, uint64_t))v110)(v153, v169, v25);
    (*(void (**)(char *, uint64_t, void))(v164 + 16))(v145, v92 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier, v165);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AE8);
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF8);
    unint64_t v112 = (*(unsigned __int8 *)(*(void *)(v111 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v111 - 8) + 80);
    uint64_t v58 = swift_allocObject();
    long long v165 = xmmword_247D29080;
    *(_OWORD *)(v58 + 16) = xmmword_247D29080;
    uint64_t v65 = (uint64_t *)(v58 + v112);
    uint64_t v55 = (char *)v65 + *(int *)(v111 + 48);
    if (qword_26B1378A0 == -1)
    {
LABEL_30:
      uint64_t v113 = sub_247D27FA0();
      __swift_project_value_buffer(v113, (uint64_t)qword_26B137B38);
      *uint64_t v65 = sub_247D27F90();
      (*(void (**)(char *, uint64_t, uint64_t))(v155 + 16))(v55, v59, v157);
      sub_247D1F47C(v58);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      unint64_t v114 = v156;
      sub_247D280B0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AC0);
      uint64_t v115 = v158;
      unint64_t v116 = (*(unsigned __int8 *)(v158 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v158 + 80);
      uint64_t v117 = swift_allocObject();
      *(_OWORD *)(v117 + 16) = v165;
      (*(void (**)(unint64_t, char *, uint64_t))(v115 + 16))(v117 + v116, v114, v152);
      uint64_t v118 = v148;
      v119 = v146;
      uint64_t v120 = v149;
      (*(void (**)(char *, void, uint64_t))(v148 + 104))(v146, *MEMORY[0x263F63CC8], v149);
      uint64_t v121 = v150;
      uint64_t v122 = v147;
      uint64_t v123 = v151;
      (*(void (**)(char *, void, uint64_t))(v150 + 104))(v147, *MEMORY[0x263F63F50], v151);
      sub_247D28010();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v121 + 8))(v122, v123);
      (*(void (**)(char *, uint64_t))(v118 + 8))(v119, v120);
      v124 = v143;
      uint64_t v125 = v162;
      ((void (*)(char *, char *, char *))v144)(v143, v169, v162);
      uint64_t v126 = sub_247D28200();
      os_log_type_t v127 = sub_247D28630();
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v129 = swift_slowAlloc();
        uint64_t v170 = swift_slowAlloc();
        uint64_t v174 = v170;
        *(_DWORD *)uint64_t v129 = 136315394;
        sub_247D208A8(&qword_26B137A38, MEMORY[0x263F63F00]);
        uint64_t v130 = sub_247D287F0();
        uint64_t v173 = sub_247D1E1F8(v130, v131, &v174);
        sub_247D28640();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v168 + 8))(v124, v125);
        *(_WORD *)(v129 + 12) = 2080;
        uint64_t v133 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier];
        unint64_t v132 = *(void *)&v176[OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier + 8];
        swift_bridgeObjectRetain();
        uint64_t v173 = sub_247D1E1F8(v133, v132, &v174);
        sub_247D28640();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247D0A000, v126, v127, "Added replicator record with id=%s for bundle identifier=%s", (uint8_t *)v129, 0x16u);
        uint64_t v134 = v170;
        swift_arrayDestroy();
        MEMORY[0x24C569DE0](v134, -1, -1);
        MEMORY[0x24C569DE0](v129, -1, -1);
      }
      else
      {
        (*(void (**)(char *, char *))(v168 + 8))(v124, v125);
      }

      uint64_t v25 = (uint64_t)v125;
      uint64_t v135 = v166;
      uint64_t v136 = v167;
      unint64_t v137 = v160;
      uint64_t v138 = swift_retain();
      StoreContext.add(item:)(v138);
      swift_release();
      swift_release();
      uint64_t v139 = v152;
      sub_247D202B4(v141, v137);
      (*(void (**)(char *, uint64_t))(v158 + 8))(v156, v139);
      (*(void (**)(char *, uint64_t))(v155 + 8))(v154, v157);
      uint64_t v140 = (uint64_t)v161;
      sub_247D1A9DC((uint64_t)v161);

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v140, v135);
      goto LABEL_38;
    }
LABEL_43:
    swift_once();
    goto LABEL_30;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v46 = sub_247D28200();
  os_log_type_t v47 = sub_247D28630();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v175 = v49;
    *(_DWORD *)uint64_t v48 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v172 = sub_247D1E1F8(v45, a2, &v175);
    sub_247D28640();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247D0A000, v46, v47, "Skipping %s because it is hidden", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C569DE0](v49, -1, -1);
    MEMORY[0x24C569DE0](v48, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_247D1A9DC(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_247D27E60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_defaultManager);
  uint64_t v7 = (void *)sub_247D27DD0();
  id v27 = 0;
  unsigned int v8 = objc_msgSend(v6, sel_removeItemAtURL_error_, v7, &v27);

  id v9 = v27;
  if (!v8)
  {
    uint64_t v24 = (uint64_t)v27;
    id v11 = v27;
    uint64_t v12 = (void *)sub_247D27D80();

    swift_willThrow();
    id v27 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF0);
    sub_247D2030C();
    swift_dynamicCast();
    uint64_t v13 = v26;
    if ([v26 code] != (id)4)
    {
      if (qword_26B137110 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_247D28220();
      __swift_project_value_buffer(v14, (uint64_t)qword_26B137118);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      uint64_t v15 = v13;
      uint64_t v13 = sub_247D28200();
      os_log_type_t v16 = sub_247D28620();
      if (!os_log_type_enabled(v13, v16))
      {

        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        goto LABEL_12;
      }
      uint64_t v17 = swift_slowAlloc();
      uint64_t v23 = (void *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v28[0] = v24;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v18 = sub_247D27E20();
      uint64_t v25 = sub_247D1E1F8(v18, v19, v28);
      sub_247D28640();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      *(_WORD *)(v17 + 12) = 2112;
      uint64_t v25 = (uint64_t)v15;
      uint64_t v20 = v15;
      sub_247D28640();
      uint64_t v21 = v23;
      *uint64_t v23 = v15;

      _os_log_impl(&dword_247D0A000, v13, v16, "Error removing placeholder at %s: %@", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v21, -1, -1);
      uint64_t v22 = v24;
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v22, -1, -1);
      MEMORY[0x24C569DE0](v17, -1, -1);
    }
LABEL_12:

    return;
  }

  id v10 = v9;
}

uint64_t sub_247D1AE18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v80 = a3;
  uint64_t v81 = a2;
  v86[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_247D27DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247D27E60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v72 - v13;
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Defaults();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26B137980);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v16 + *(int *)(v15 + 28), v8);
  uint64_t v76 = a1;
  uint64_t v17 = v81;
  v86[0] = a1;
  v86[1] = v81;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06E50], v4);
  sub_247D11E30();
  sub_247D27E40();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v78 = v9 + 8;
  uint64_t v77 = v18;
  v18(v12, v8);
  sub_247D27DE0();
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(v14, v12, v8);
  uint64_t v75 = v9;
  unint64_t v19 = v14;
  unint64_t v20 = v17;
  if (qword_26B137110 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_247D28220();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B137118);
  uint64_t v23 = sub_247D28200();
  os_log_type_t v24 = sub_247D28600();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v79 = v8;
  if (v25)
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v86[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_beginAccess();
    uint64_t v28 = sub_247D27E20();
    v83[0] = (id)sub_247D1E1F8(v28, v29, v86);
    sub_247D28640();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247D0A000, v23, v24, "Attempt to create placeholder at: %s", v26, 0xCu);
    swift_arrayDestroy();
    unint64_t v20 = v17;
    MEMORY[0x24C569DE0](v27, -1, -1);
    MEMORY[0x24C569DE0](v26, -1, -1);
  }

  uint64_t v30 = v76;
  id v31 = objc_msgSend(self, sel_defaultManager);
  swift_beginAccess();
  uint64_t v32 = (void *)sub_247D27DD0();
  v83[0] = 0;
  unsigned int v33 = objc_msgSend(v31, sel_removeItemAtURL_error_, v32, v83);

  id v34 = v83[0];
  if (!v33)
  {
    BOOL v35 = v34;
    char v36 = (void *)sub_247D27D80();

    swift_willThrow();
    v83[0] = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF0);
    sub_247D2030C();
    swift_dynamicCast();
    id v37 = v85;
    if (objc_msgSend(v85, sel_code) == (id)4)
    {
    }
    else
    {
      id v38 = v37;
      uint64_t v39 = sub_247D28200();
      os_log_type_t v40 = sub_247D28620();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = swift_slowAlloc();
        uint64_t v73 = (void *)swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        uint64_t v84 = v74;
        *(_DWORD *)uint64_t v41 = 136315394;
        uint64_t v76 = v22;
        uint64_t v42 = sub_247D27E20();
        uint64_t v82 = sub_247D1E1F8(v42, v43, &v84);
        sub_247D28640();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2112;
        uint64_t v82 = (uint64_t)v38;
        id v44 = v38;
        sub_247D28640();
        uint64_t v45 = v73;
        *uint64_t v73 = v38;

        _os_log_impl(&dword_247D0A000, v39, v40, "Error removing %s: %@", (uint8_t *)v41, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
        swift_arrayDestroy();
        MEMORY[0x24C569DE0](v45, -1, -1);
        uint64_t v46 = v74;
        swift_arrayDestroy();
        MEMORY[0x24C569DE0](v46, -1, -1);
        MEMORY[0x24C569DE0](v41, -1, -1);
      }
      else
      {
      }
      unint64_t v20 = v81;
    }
  }
  os_log_type_t v47 = (void *)sub_247D284A0();
  uint64_t v48 = (void *)sub_247D27DD0();
  v83[0] = 0;
  int v49 = MICreateSerializedPlaceholderForInstalledApplication();

  id v85 = v83[0];
  id v50 = v83[0];
  if (v49)
  {
    uint64_t v51 = sub_247D28200();
    os_log_type_t v52 = sub_247D28610();
    BOOL v53 = os_log_type_enabled(v51, v52);
    uint64_t v54 = v79;
    if (v53)
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = (void *)swift_slowAlloc();
      v83[0] = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      uint64_t v57 = sub_247D27E20();
      uint64_t v84 = sub_247D1E1F8(v57, v58, (uint64_t *)v83);
      sub_247D28640();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247D0A000, v51, v52, "Successfully created placeholder at: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v56, -1, -1);
      MEMORY[0x24C569DE0](v55, -1, -1);
    }

    uint64_t v59 = v80;
    sub_247D27D90();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v59, 0, 1, v54);

    uint64_t v60 = v19;
    uint64_t v61 = v54;
  }
  else
  {
    swift_bridgeObjectRetain_n();
    unint64_t v62 = sub_247D28200();
    unint64_t v63 = v20;
    os_log_type_t v64 = sub_247D28620();
    if (os_log_type_enabled(v62, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      uint64_t v66 = (void *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      uint64_t v84 = v67;
      *(_DWORD *)uint64_t v65 = 136315394;
      swift_bridgeObjectRetain();
      v83[0] = (id)sub_247D1E1F8(v30, v63, &v84);
      sub_247D28640();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v65 + 12) = 2112;
      swift_beginAccess();
      id v68 = v85;
      if (v85)
      {
        uint64_t v82 = (uint64_t)v85;
        id v69 = v85;
      }
      else
      {
        uint64_t v82 = 0;
      }
      sub_247D28640();
      void *v66 = v68;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v66, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v67, -1, -1);
      MEMORY[0x24C569DE0](v65, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v70 = v79;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 56))(v80, 1, 1, v79);

    uint64_t v60 = v19;
    uint64_t v61 = v70;
  }
  return v77(v60, v61);
}

uint64_t sub_247D1B8D0(uint64_t a1)
{
  uint64_t v3 = sub_247D28080();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v58 = (uint64_t)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (char *)v49 - v6;
  uint64_t v56 = sub_247D280A0();
  uint64_t v59 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v60 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137248);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247D27EE0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v63 = MEMORY[0x263F8EE78];
  type metadata accessor for StoreContext();
  uint64_t inited = swift_initStackObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  uint64_t v16 = sub_247D282E0();
  uint64_t v61 = inited;
  *(void *)(inited + 16) = v16;
  uint64_t v17 = (unsigned int (**)(char *, uint64_t, void))v11;
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v50 = v1;
  if (v18)
  {
    uint64_t v19 = *(void *)(v1 + 24);
    uint64_t v55 = (unsigned int (**)(char *, uint64_t, void))(v12 + 48);
    v49[0] = v12;
    os_log_type_t v52 = (void (**)(char *, unsigned int (**)(char *, uint64_t, void)))(v12 + 8);
    BOOL v53 = (void (**)(char *, char *, unsigned int (**)(char *, uint64_t, void)))(v12 + 32);
    swift_bridgeObjectRetain();
    v49[1] = a1;
    unint64_t v20 = (uint64_t *)(a1 + 40);
    unint64_t v54 = (unint64_t)"v16@?0@\"LSApplicationRecord\"8";
    do
    {
      uint64_t v25 = *(v20 - 1);
      uint64_t v26 = *v20;
      swift_bridgeObjectRetain();
      sub_247D27FD0();
      if ((*v55)(v10, 1, v17) == 1)
      {
        sub_247D208F0((uint64_t)v10, &qword_26B137248);
        if (qword_26B137110 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_247D28220();
        __swift_project_value_buffer(v27, (uint64_t)qword_26B137118);
        uint64_t v28 = sub_247D28200();
        os_log_type_t v29 = sub_247D28620();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          unint64_t v51 = v25;
          id v31 = v10;
          uint64_t v32 = v19;
          unsigned int v33 = v14;
          id v34 = v17;
          BOOL v35 = v30;
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl(&dword_247D0A000, v28, v29, "Failed to get .localDeviceID from the replicator", v30, 2u);
          char v36 = v35;
          uint64_t v17 = v34;
          uint64_t v14 = v33;
          uint64_t v19 = v32;
          uint64_t v10 = v31;
          uint64_t v25 = v51;
          MEMORY[0x24C569DE0](v36, -1, -1);
        }

        unint64_t v23 = v54 | 0x8000000000000000;
        unint64_t v21 = 0xD000000000000024;
      }
      else
      {
        (*v53)(v14, v10, v17);
        unint64_t v21 = sub_247D27EC0();
        unint64_t v23 = v22;
        (*v52)(v14, v17);
      }
      v20 += 2;
      unint64_t v24 = StoreContext.fetchItems(bundleIdentifier:deviceIdentifier:)(v25, v26, v21, v23);
      swift_bridgeObjectRelease();
      sub_247D1BFDC(v24);
      swift_bridgeObjectRelease();
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    uint64_t v12 = v49[0];
  }
  id v37 = (void *)v63;
  if (!(v63 >> 62))
  {
    uint64_t v38 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v38) {
      goto LABEL_14;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x263F8EE78];
LABEL_24:
    swift_bridgeObjectRetain();
    v48._rawValue = v37;
    sub_247D163A8(v44, v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_247D28730();
  if (!v38) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v62 = MEMORY[0x263F8EE78];
  uint64_t result = sub_247D1E978(0, v38 & ~(v38 >> 63), 0);
  if ((v38 & 0x8000000000000000) == 0)
  {
    uint64_t v40 = 0;
    uint64_t v41 = (void (**)(uint64_t, uint64_t, uint64_t, unsigned int (**)(char *, uint64_t, void)))(v12 + 56);
    unint64_t v54 = v59 + 32;
    uint64_t v55 = v17;
    os_log_type_t v52 = (void (**)(char *, unsigned int (**)(char *, uint64_t, void)))0x8000000247D2A780;
    BOOL v53 = (void (**)(char *, char *, unsigned int (**)(char *, uint64_t, void)))0xD000000000000010;
    unint64_t v51 = 0x8000000247D2A750;
    uint64_t v42 = (uint64_t)v57;
    do
    {
      unint64_t v43 = v37;
      swift_retain();
      sub_247D27EC0();
      (*v41)(v42, 1, 1, v55);
      sub_247D207D8(v42, v58, MEMORY[0x263F63EE8]);
      sub_247D28060();
      sub_247D20200(v42);
      swift_release();
      uint64_t v44 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247D1E978(0, *(void *)(v44 + 16) + 1, 1);
        uint64_t v44 = v62;
      }
      unint64_t v46 = *(void *)(v44 + 16);
      unint64_t v45 = *(void *)(v44 + 24);
      os_log_type_t v47 = v60;
      if (v46 >= v45 >> 1)
      {
        sub_247D1E978(v45 > 1, v46 + 1, 1);
        os_log_type_t v47 = v60;
        uint64_t v44 = v62;
      }
      ++v40;
      *(void *)(v44 + 16) = v46 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v59 + 32))(v44+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v46, v47, v56);
      uint64_t v62 = v44;
      id v37 = v43;
    }
    while (v38 != v40);
    swift_bridgeObjectRelease();
    id v37 = (void *)v63;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D1BFDC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_247D28730();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_247D28730();
    swift_bridgeObjectRelease();
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = v4 + v3;
  if (__OFADD__(v4, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  uint64_t v4 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v4 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v5) {
      uint64_t v9 = v5;
    }
    swift_bridgeObjectRetain();
    *uint64_t v1 = MEMORY[0x24C569510](v4, v9, 1, v6);
    swift_bridgeObjectRelease();
    uint64_t v8 = *v1 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_247D1F278(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_247D28730();
    swift_bridgeObjectRelease();
    unint64_t v6 = *v1;
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

  return sub_247D28570();
}

uint64_t sub_247D1C1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_247D28080();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v33 = sub_247D280A0();
  uint64_t v11 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  BOOL v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for StoreContext();
  uint64_t inited = swift_initStackObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  *(void *)(inited + 16) = sub_247D282E0();
  uint64_t v27 = v2;
  uint64_t v15 = sub_247D18840();
  uint64_t v26 = inited;
  unint64_t v17 = StoreContext.fetchItems(bundleIdentifier:deviceIdentifier:)(a1, a2, v15, v16);
  swift_bridgeObjectRelease();
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_247D28730();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (!v18)
  {
LABEL_14:
    v25._rawValue = (void *)v17;
    sub_247D163A8(v19, v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    return swift_release();
  }
  uint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t result = sub_247D1E978(0, v18 & ~(v18 >> 63), 0);
  if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = 0;
    uint64_t v30 = v11 + 32;
    unint64_t v31 = v17 & 0xC000000000000001;
    unint64_t v28 = 0x8000000247D2A750;
    unint64_t v29 = 0x8000000247D2A780;
    unint64_t v32 = v17;
    do
    {
      if (v31) {
        MEMORY[0x24C569500](v21, v17);
      }
      else {
        swift_retain();
      }
      sub_247D27EC0();
      uint64_t v22 = sub_247D27EE0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v10, 1, 1, v22);
      sub_247D207D8((uint64_t)v10, (uint64_t)v8, MEMORY[0x263F63EE8]);
      sub_247D28060();
      sub_247D20200((uint64_t)v10);
      swift_release();
      uint64_t v19 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247D1E978(0, *(void *)(v19 + 16) + 1, 1);
        uint64_t v19 = v34;
      }
      unint64_t v24 = *(void *)(v19 + 16);
      unint64_t v23 = *(void *)(v19 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_247D1E978(v23 > 1, v24 + 1, 1);
        uint64_t v19 = v34;
      }
      ++v21;
      *(void *)(v19 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v19+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v24, v13, v33);
      uint64_t v34 = v19;
      unint64_t v17 = v32;
    }
    while (v18 != v21);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D1C5CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AA8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26B137B30 = result;
  return result;
}

void sub_247D1C604()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A60);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B137580 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_26B137B30 + 16));
  if ((*(unsigned char *)(v0 + 32) & 1) == 0)
  {
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v4 = sub_247D285C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v0;
    swift_retain();
    sub_247D1D94C((uint64_t)v3, (uint64_t)&unk_2692C84F0, (uint64_t)v5);
    swift_release();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_26B137B30 + 16));
}

uint64_t sub_247D1C75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_247D27EE0();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  uint64_t v6 = sub_247D27F70();
  v4[10] = v6;
  v4[11] = *(void *)(v6 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  sub_247D28080();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v7 = sub_247D280A0();
  v4[18] = v7;
  v4[19] = *(void *)(v7 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  uint64_t v8 = sub_247D27F40();
  v4[24] = v8;
  v4[25] = *(void *)(v8 - 8);
  v4[26] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A70);
  v4[27] = v9;
  v4[28] = *(void *)(v9 - 8);
  v4[29] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A68);
  v4[30] = v10;
  v4[31] = *(void *)(v10 - 8);
  v4[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247D1CA7C, 0, 0);
}

uint64_t sub_247D1CA7C()
{
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[27];
  sub_247D27FE0();
  sub_247D285D0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[33] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_247D1CB7C;
  uint64_t v5 = v0[30];
  return MEMORY[0x270FA1F68](v0 + 5, 0, 0, v5);
}

uint64_t sub_247D1CB7C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_247D1CC78, 0, 0);
}

uint64_t sub_247D1CC78()
{
  uint64_t v117 = v0;
  uint64_t v1 = v0 + 5;
  uint64_t v2 = v0[5];
  if (v2)
  {
    type metadata accessor for StoreContext();
    uint64_t inited = swift_initStackObject();
    sub_247D282D0();
    swift_allocObject();
    swift_retain();
    *(void *)(inited + 16) = sub_247D282E0();
    uint64_t v4 = *(void *)(v2 + 16);
    if (v4)
    {
      uint64_t v5 = v0[25];
      uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      uint64_t v113 = *(void *)(v5 + 72);
      while (1)
      {
        sub_247D207D8(v6, v0[26], MEMORY[0x263F63C60]);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v9 = v0[26];
        uint64_t v10 = v0[18];
        uint64_t v11 = v0[19];
        uint64_t v13 = v0[16];
        uint64_t v12 = v0[17];
        if (EnumCaseMultiPayload != 1)
        {
          uint64_t v115 = v4;
          uint64_t v34 = v0[20];
          uint64_t v35 = v0[7];
          uint64_t v36 = v0[8];
          (*(void (**)(void, uint64_t, void))(v0[11] + 32))(v0[15], v9, v0[10]);
          sub_247D27F50();
          sub_247D28090();
          uint64_t v111 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
          v111(v34, v10);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 56))(v13, 1, 1, v35);
          char v37 = MEMORY[0x24C568EE0](v12, v13);
          sub_247D20200(v13);
          sub_247D20200(v12);
          if (v37)
          {
            if (qword_26B137110 != -1) {
              swift_once();
            }
            uint64_t v38 = v0[14];
            uint64_t v39 = v0[15];
            uint64_t v40 = v0[10];
            uint64_t v41 = v0[11];
            uint64_t v42 = sub_247D28220();
            __swift_project_value_buffer(v42, (uint64_t)qword_26B137118);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v38, v39, v40);
            unint64_t v43 = sub_247D28200();
            os_log_type_t v44 = sub_247D28600();
            if (os_log_type_enabled(v43, v44))
            {
              uint64_t v45 = v0[20];
              uint64_t v46 = v0[18];
              uint64_t v100 = v0[14];
              *(void *)type = v0[11];
              uint64_t v106 = v0[10];
              uint64_t v108 = v0[15];
              uint64_t v47 = swift_slowAlloc();
              os_log_t log = (os_log_t)swift_slowAlloc();
              uint64_t v116 = (uint64_t)log;
              *(_DWORD *)uint64_t v47 = 136315138;
              sub_247D27F50();
              sub_247D208A8(&qword_26B137A38, MEMORY[0x263F63F00]);
              uint64_t v48 = sub_247D287F0();
              unint64_t v50 = v49;
              v111(v45, v46);
              *(void *)(v47 + 4) = sub_247D1E1F8(v48, v50, &v116);
              swift_bridgeObjectRelease();
              unint64_t v51 = *(void (**)(uint64_t, uint64_t))(*(void *)type + 8);
              v51(v100, v106);
              _os_log_impl(&dword_247D0A000, v43, v44, "ignoring local updated record: %s", (uint8_t *)v47, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24C569DE0](log, -1, -1);
              MEMORY[0x24C569DE0](v47, -1, -1);

              v51(v108, v106);
            }
            else
            {
              uint64_t v82 = v0[14];
              uint64_t v81 = v0[15];
              uint64_t v83 = v0[10];
              uint64_t v84 = v0[11];

              id v85 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
              v85(v82, v83);
              v85(v81, v83);
            }
            uint64_t v4 = v115;
          }
          else
          {
            if (qword_26B137110 != -1) {
              swift_once();
            }
            uint64_t v61 = v0[15];
            uint64_t v63 = v0[12];
            uint64_t v62 = v0[13];
            uint64_t v64 = v0[10];
            uint64_t v65 = v0[11];
            uint64_t v66 = sub_247D28220();
            __swift_project_value_buffer(v66, (uint64_t)qword_26B137118);
            uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
            v67(v62, v61, v64);
            v67(v63, v61, v64);
            id v68 = sub_247D28200();
            os_log_type_t v69 = sub_247D28600();
            if (os_log_type_enabled(v68, v69))
            {
              uint64_t v70 = v0[20];
              uint64_t v71 = v0[18];
              uint64_t v109 = v0[15];
              uint64_t v72 = v0[13];
              uint64_t v96 = v0[11];
              uint64_t v97 = v0[10];
              uint64_t v98 = v0[9];
              uint64_t v99 = v0[12];
              uint64_t v101 = v0[8];
              loga = v68;
              uint64_t v73 = v0[7];
              uint64_t v74 = swift_slowAlloc();
              uint64_t v107 = swift_slowAlloc();
              uint64_t v116 = v107;
              *(_DWORD *)uint64_t v74 = 136315394;
              os_log_type_t typea = v69;
              sub_247D27F50();
              sub_247D208A8(&qword_26B137A38, MEMORY[0x263F63F00]);
              uint64_t v75 = sub_247D287F0();
              unint64_t v77 = v76;
              v111(v70, v71);
              *(void *)(v74 + 4) = sub_247D1E1F8(v75, v77, &v116);
              swift_bridgeObjectRelease();
              unint64_t v112 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
              v112(v72, v97);
              *(_WORD *)(v74 + 12) = 2080;
              sub_247D27F60();
              sub_247D208A8(&qword_26B137240, MEMORY[0x263F07508]);
              uint64_t v78 = sub_247D287F0();
              unint64_t v80 = v79;
              (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v98, v73);
              *(void *)(v74 + 14) = sub_247D1E1F8(v78, v80, &v116);
              swift_bridgeObjectRelease();
              v112(v99, v97);
              _os_log_impl(&dword_247D0A000, loga, typea, "record updated: %s, version: %s", (uint8_t *)v74, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x24C569DE0](v107, -1, -1);
              MEMORY[0x24C569DE0](v74, -1, -1);

              v112(v109, v97);
            }
            else
            {
              uint64_t v86 = v0[15];
              uint64_t v88 = v0[12];
              uint64_t v87 = v0[13];
              uint64_t v89 = v0[10];
              uint64_t v90 = v0[11];

              unint64_t v91 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
              v91(v88, v89);
              v91(v87, v89);
              v91(v86, v89);
            }
            uint64_t v4 = v115;
          }
          goto LABEL_5;
        }
        uint64_t v14 = v0[7];
        uint64_t v15 = v0[8];
        (*(void (**)(void, uint64_t, void))(v11 + 32))(v0[23], v9, v0[18]);
        sub_247D28090();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
        char v16 = MEMORY[0x24C568EE0](v12, v13);
        sub_247D20200(v13);
        sub_247D20200(v12);
        if (v16)
        {
          if (qword_26B137110 != -1) {
            swift_once();
          }
          uint64_t v17 = v0[22];
          uint64_t v18 = v0[23];
          uint64_t v19 = v0[18];
          uint64_t v20 = v0[19];
          uint64_t v21 = sub_247D28220();
          __swift_project_value_buffer(v21, (uint64_t)qword_26B137118);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v17, v18, v19);
          uint64_t v22 = sub_247D28200();
          os_log_type_t v23 = sub_247D28600();
          BOOL v24 = os_log_type_enabled(v22, v23);
          uint64_t v25 = v0[22];
          uint64_t v26 = v0[23];
          uint64_t v27 = v0[18];
          uint64_t v28 = v0[19];
          if (v24)
          {
            uint64_t v29 = swift_slowAlloc();
            uint64_t v110 = v26;
            uint64_t v30 = swift_slowAlloc();
            uint64_t v116 = v30;
            *(_DWORD *)uint64_t v29 = 136315138;
            sub_247D208A8(&qword_26B137A38, MEMORY[0x263F63F00]);
            uint64_t v31 = sub_247D287F0();
            uint64_t v114 = v4;
            *(void *)(v29 + 4) = sub_247D1E1F8(v31, v32, &v116);
            swift_bridgeObjectRelease();
            uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
            v33(v25, v27);
            _os_log_impl(&dword_247D0A000, v22, v23, "ignoring local deleted record: %s", (uint8_t *)v29, 0xCu);
LABEL_22:
            swift_arrayDestroy();
            MEMORY[0x24C569DE0](v30, -1, -1);
            MEMORY[0x24C569DE0](v29, -1, -1);

            v33(v110, v27);
            uint64_t v4 = v114;
            goto LABEL_5;
          }
        }
        else
        {
          if (qword_26B137110 != -1) {
            swift_once();
          }
          uint64_t v52 = v0[23];
          uint64_t v53 = v0[21];
          uint64_t v54 = v0[18];
          uint64_t v55 = v0[19];
          uint64_t v56 = sub_247D28220();
          __swift_project_value_buffer(v56, (uint64_t)qword_26B137118);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v53, v52, v54);
          uint64_t v22 = sub_247D28200();
          os_log_type_t v57 = sub_247D28600();
          BOOL v58 = os_log_type_enabled(v22, v57);
          uint64_t v26 = v0[23];
          uint64_t v25 = v0[21];
          uint64_t v27 = v0[18];
          uint64_t v28 = v0[19];
          if (v58)
          {
            uint64_t v29 = swift_slowAlloc();
            uint64_t v110 = v26;
            uint64_t v30 = swift_slowAlloc();
            uint64_t v116 = v30;
            *(_DWORD *)uint64_t v29 = 136315138;
            sub_247D208A8(&qword_26B137A38, MEMORY[0x263F63F00]);
            uint64_t v59 = sub_247D287F0();
            uint64_t v114 = v4;
            *(void *)(v29 + 4) = sub_247D1E1F8(v59, v60, &v116);
            swift_bridgeObjectRelease();
            uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
            v33(v25, v27);
            _os_log_impl(&dword_247D0A000, v22, v57, "record deleted: %s", (uint8_t *)v29, 0xCu);
            goto LABEL_22;
          }
        }

        uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v7(v25, v27);
        v7(v26, v27);
LABEL_5:
        v6 += v113;
        if (!--v4)
        {
          swift_release();
          uint64_t v1 = v0 + 5;
          goto LABEL_35;
        }
      }
    }
    swift_release();
LABEL_35:
    swift_bridgeObjectRelease();
    uint64_t v94 = (void *)swift_task_alloc();
    v0[33] = v94;
    *uint64_t v94 = v0;
    v94[1] = sub_247D1CB7C;
    uint64_t v95 = v0[30];
    return MEMORY[0x270FA1F68](v1, 0, 0, v95);
  }
  else
  {
    (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
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
    uint64_t v92 = (uint64_t (*)(void))v0[1];
    return v92();
  }
}

uint64_t sub_247D1D94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247D285C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247D285B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247D208F0(a1, &qword_26B137A60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247D285A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SyncManager.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t SyncManager.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_247D1DB60(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_247D1DB70(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_247D1DBAC(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_247D1DBE4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247D1DC0C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_247D1DCE8;
  return v6(a1);
}

uint64_t sub_247D1DCE8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247D1DDE0(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137180);
  uint64_t v10 = *(void *)(sub_247D280A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_247D28720();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_247D280A0() - 8);
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
    sub_247D1F8E4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_247D1E048(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8520);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
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
    sub_247D1FA3C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D1E158(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247D1E180(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_247D1E1F8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_247D28640();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_247D1E1F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247D1E2CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_247D11F0C((uint64_t)v12, *a3);
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
      sub_247D11F0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_247D1E2CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247D28650();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247D1E488(a5, a6);
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
  uint64_t v8 = sub_247D286B0();
  if (!v8)
  {
    sub_247D28720();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247D28770();
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

uint64_t sub_247D1E488(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247D1E520(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247D1E700(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247D1E700(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247D1E520(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247D1E698(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247D28680();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247D28720();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247D28530();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247D28770();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247D28720();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247D1E698(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247D1E700(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8540);
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
  uint64_t result = sub_247D28770();
  __break(1u);
  return result;
}

unsigned char **sub_247D1E850(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_247D1E860(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_247D28640();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_247D1E91C(void *a1)
{
  sub_247D17690(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unint64_t **)(v1 + 32));
}

uint64_t sub_247D1E928()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247D1E938()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_247D1E978(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247D1E998(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_247D1E998(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137180);
  uint64_t v10 = *(void *)(sub_247D280A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_247D280A0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_247D28770();
  __break(1u);
  return result;
}

uint64_t sub_247D1EBD8(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_247D27EE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8528);
  int v46 = a2;
  uint64_t v10 = sub_247D28750();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_39;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v20++, 1)) {
      goto LABEL_41;
    }
    if (v20 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v20];
    if (!v26)
    {
      int64_t v27 = v20 + 1;
      if (v20 + 1 >= v41)
      {
LABEL_32:
        swift_release();
        unint64_t v3 = v40;
        if ((v46 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v26 = v42[v27];
      if (!v26)
      {
        while (1)
        {
          int64_t v20 = v27 + 1;
          if (__OFADD__(v27, 1)) {
            break;
          }
          if (v20 >= v41) {
            goto LABEL_32;
          }
          unint64_t v26 = v42[v20];
          ++v27;
          if (v26) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v20;
    }
LABEL_19:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_20:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_247D208A8(&qword_2692C8448, MEMORY[0x263F07508]);
    uint64_t result = sub_247D28480();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_40;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  unint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  *unint64_t v3 = v12;
  return result;
}

void *sub_247D1EFE4()
{
  uint64_t v1 = v0;
  uint64_t v28 = sub_247D27EE0();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  unint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8528);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_247D28740();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_23:
    *uint64_t v1 = v7;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v14 = v28;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_25;
    }
    if (v10 >= v25)
    {
LABEL_21:
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v23;
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v10);
    if (!v21) {
      break;
    }
LABEL_20:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v14);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v14);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v10 + 1;
  if (v10 + 1 >= v25) {
    goto LABEL_21;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    ++v10;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_21;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_247D1F278(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_247D28730();
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
    uint64_t v10 = sub_247D28730();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_247D20844();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8510);
          uint64_t v12 = sub_247D10F18(v16, i, a3);
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
    type metadata accessor for SyncItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_247D28770();
  __break(1u);
  return result;
}

unint64_t sub_247D1F47C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AB0);
    uint64_t v7 = (void *)sub_247D28760();
    uint64_t v8 = (char *)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_247D2099C(v9, (uint64_t)v5, &qword_26B137AF8);
      uint64_t v11 = *v5;
      unint64_t result = sub_247D10A3C(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_247D280D0();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
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

uint64_t sub_247D1F644(uint64_t a1, void (*a2)(char *, char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8530);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v26 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v27 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v27) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v12;
    if (!v23)
    {
      int64_t v12 = v22 + 1;
      if (v22 + 1 >= v27) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v26 + 8 * v12);
      if (!v23)
      {
        int64_t v12 = v22 + 2;
        if (v22 + 2 >= v27) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v26 + 8 * v12);
        if (!v23)
        {
          int64_t v12 = v22 + 3;
          if (v22 + 3 >= v27) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v26 + 8 * v12);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v14 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_5:
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = sub_247D280A0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v6, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v16);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = sub_247D27EE0();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = v17 + *(void *)(v19 + 72) * v14;
    unint64_t v21 = &v6[*(int *)(v4 + 48)];
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v20, v18);
    a2(v6, v21);
    uint64_t result = sub_247D208F0((uint64_t)v6, &qword_2692C8530);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v27) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v12 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v12 >= v27) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v26 + 8 * v12);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_247D1F8E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_247D280A0() - 8);
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
  uint64_t result = sub_247D28770();
  __break(1u);
  return result;
}

uint64_t sub_247D1FA3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_247D28770();
  __break(1u);
  return result;
}

uint64_t sub_247D1FB30()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137248);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v51 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247D27EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v50 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = v0;
  type metadata accessor for StoreContext();
  uint64_t inited = swift_initStackObject();
  sub_247D282D0();
  swift_allocObject();
  swift_retain();
  uint64_t v7 = sub_247D282E0();
  uint64_t v58 = inited;
  *(void *)(inited + 16) = v7;
  id v8 = objc_msgSend(self, sel_hiddenApplications);
  sub_247D285F0();
  unint64_t v9 = sub_247D28560();

  if (v9 >> 62)
  {
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_247D28730();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v52 = v9;
  if (!v10)
  {
    uint64_t v45 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_42;
  }
  uint64_t v11 = 0;
  uint64_t v56 = *(void *)(v44 + 24);
  unint64_t v57 = v52 & 0xC000000000000001;
  uint64_t v54 = v3;
  uint64_t v55 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  uint64_t v48 = (void (**)(unint64_t, uint64_t))(v4 + 8);
  unint64_t v49 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  unint64_t v46 = v52 + 32;
  unint64_t v47 = (unint64_t)"v16@?0@\"LSApplicationRecord\"8";
  uint64_t v45 = (void *)MEMORY[0x263F8EE78];
  uint64_t v53 = v10;
  do
  {
    uint64_t v4 = (uint64_t)v51;
    while (1)
    {
      if (v57)
      {
        id v12 = (id)MEMORY[0x24C569500](v11, v52);
        BOOL v13 = __OFADD__(v11++, 1);
        if (v13) {
          goto LABEL_43;
        }
      }
      else
      {
        id v12 = *(id *)(v46 + 8 * v11);
        BOOL v13 = __OFADD__(v11++, 1);
        if (v13)
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
      }
      unint64_t v59 = (unint64_t)v12;
      id v14 = objc_msgSend(v12, sel_bundleIdentifier);
      uint64_t v15 = sub_247D284D0();
      uint64_t v17 = v16;

      sub_247D27FD0();
      if ((*v55)(v4, 1, v3) == 1)
      {
        sub_247D208F0(v4, &qword_26B137248);
        if (qword_26B137110 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_247D28220();
        __swift_project_value_buffer(v18, (uint64_t)qword_26B137118);
        uint64_t v19 = sub_247D28200();
        os_log_type_t v20 = sub_247D28620();
        if (os_log_type_enabled(v19, v20))
        {
          unint64_t v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v21 = 0;
          _os_log_impl(&dword_247D0A000, v19, v20, "Failed to get .localDeviceID from the replicator", v21, 2u);
          int64_t v22 = v21;
          uint64_t v10 = v53;
          uint64_t v3 = v54;
          MEMORY[0x24C569DE0](v22, -1, -1);
        }

        unint64_t v23 = v47 | 0x8000000000000000;
        unint64_t v24 = 0xD000000000000024;
      }
      else
      {
        unint64_t v9 = (unint64_t)v50;
        (*v49)(v50, v4, v3);
        unint64_t v24 = sub_247D27EC0();
        unint64_t v23 = v25;
        (*v48)(v9, v3);
      }
      unint64_t v26 = sub_247D0DF90(v15, v17, 0, 0, v24, v23);
      unint64_t v27 = v26;
      if (v26 >> 62)
      {
        uint64_t v28 = sub_247D28730();
        if (!v28)
        {
LABEL_28:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v31 = MEMORY[0x263F8EE78];
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v28 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v28) {
          goto LABEL_28;
        }
      }
      unint64_t v60 = MEMORY[0x263F8EE78];
      sub_247D286E0();
      if (v28 < 0) {
        goto LABEL_44;
      }
      uint64_t v29 = 0;
      do
      {
        if ((v27 & 0xC000000000000001) != 0)
        {
          uint64_t v30 = MEMORY[0x24C569500](v29, v27);
        }
        else
        {
          uint64_t v30 = *(void *)(v27 + 8 * v29 + 32);
          swift_retain();
        }
        ++v29;
        sub_247D26050(v30);
        swift_release();
        sub_247D286C0();
        sub_247D286F0();
        sub_247D28700();
        sub_247D286D0();
      }
      while (v28 != v29);
      unint64_t v31 = v60;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = (uint64_t)v51;
      uint64_t v10 = v53;
      uint64_t v3 = v54;
LABEL_29:
      unint64_t v9 = v59;
      if (v31 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v32 = sub_247D28730();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v32 > 0) {
        break;
      }

      if (v11 == v10) {
        goto LABEL_42;
      }
    }
    id v33 = objc_msgSend((id)v9, sel_bundleIdentifier);
    uint64_t v34 = sub_247D284D0();
    uint64_t v36 = v35;

    uint64_t v37 = v45;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v37 = sub_247D1E048(0, v37[2] + 1, 1, v37);
    }
    unint64_t v39 = v37[2];
    unint64_t v38 = v37[3];
    if (v39 >= v38 >> 1) {
      uint64_t v37 = sub_247D1E048((void *)(v38 > 1), v39 + 1, 1, v37);
    }
    v37[2] = v39 + 1;
    uint64_t v45 = v37;
    uint64_t v40 = &v37[2 * v39];
    v40[4] = v34;
    v40[5] = v36;

    uint64_t v10 = v53;
    uint64_t v3 = v54;
  }
  while (v11 != v53);
LABEL_42:
  swift_bridgeObjectRelease_n();
  uint64_t v41 = swift_bridgeObjectRetain();
  sub_247D1B8D0(v41);
  swift_bridgeObjectRelease_n();
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_247D201F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247D20200(uint64_t a1)
{
  uint64_t v2 = sub_247D28080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247D2025C(uint64_t a1, unint64_t a2)
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

uint64_t sub_247D202B4(uint64_t a1, unint64_t a2)
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

unint64_t sub_247D2030C()
{
  unint64_t result = qword_26B137AA0;
  if (!qword_26B137AA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B137AA0);
  }
  return result;
}

uint64_t sub_247D2034C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_247D2038C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_247D20440;
  return sub_247D1C75C(a1, v4, v5, v6);
}

uint64_t sub_247D20440()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for SyncManager()
{
  return self;
}

uint64_t method lookup function for SyncManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SyncManager);
}

uint64_t dispatch thunk of SyncManager.syncPublisherWithLaunchServices()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SyncManager.syncPublisherWithAppProtection()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SyncManager.localDeviceIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SyncManager.add(bundleIdentifiers:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SyncManager.add(bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SyncManager.createPlaceholder(bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of SyncManager.delete(bundleIdentifiers:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SyncManager.delete(bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SyncManager.syncSubscriberWithReplicator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SyncManager.startRecordReceiver()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t sub_247D206E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247D20720(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247D20440;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692C8500 + dword_2692C8500);
  return v6(a1, v4);
}

uint64_t sub_247D207D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_247D20844()
{
  unint64_t result = qword_2692C8518;
  if (!qword_2692C8518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692C8510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C8518);
  }
  return result;
}

unint64_t sub_247D208A0(uint64_t a1, uint64_t a2)
{
  return sub_247D174F8(a1, a2, *(void *)(v2 + 16), *(unint64_t **)(v2 + 24));
}

uint64_t sub_247D208A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247D208F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_247D2099C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t static PublisherStore.defaultURL.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Defaults();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B137980);
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(v2 + 20);
  uint64_t v5 = sub_247D27E60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, v4, v5);
}

uint64_t sub_247D20AE0()
{
  uint64_t v0 = sub_247D27E60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PublisherStore();
  swift_allocObject();
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Defaults();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B137980);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5 + *(int *)(v4 + 20), v0);
  uint64_t result = sub_247D0C264((uint64_t)v3);
  qword_26B1377C0 = result;
  return result;
}

uint64_t static PublisherStore.shared.getter()
{
  if (qword_26B1377C8 != -1) {
    swift_once();
  }

  return swift_retain();
}

void static PublisherStore.upgrade()()
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137218);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v43 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_247D27DA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v56 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_247D27E60();
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  if (qword_26B137150 != -1) {
    swift_once();
  }
  uint64_t v54 = type metadata accessor for Defaults();
  uint64_t v8 = (void **)__swift_project_value_buffer(v54, (uint64_t)qword_26B137980);
  id v9 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v10 = (void *)sub_247D284A0();
  uint64_t v11 = (char *)objc_msgSend(v9, sel_integerForKey_, v10);

  swift_beginAccess();
  uint64_t v53 = v8;
  BOOL v13 = (char *)*v8;
  if ((uint64_t)*v8 < (uint64_t)v11) {
    __break(1u);
  }
  uint64_t v44 = 0;
  unint64_t v51 = (void (**)(char *, char *, uint64_t))(v5 + 16);
  unint64_t v52 = (void (**)(char *, void, uint64_t))(v3 + 104);
  unsigned int v50 = *MEMORY[0x263F06E30];
  uint64_t v48 = (void (**)(char *, uint64_t))(v5 + 8);
  unint64_t v49 = (void (**)(char *, void, uint64_t, uint64_t))(v5 + 56);
  id v14 = (void *)0xD00000000000001ALL;
  unint64_t v47 = 0x8000000247D2ABC0;
  *(void *)&long long v12 = 136315394;
  long long v42 = v12;
  uint64_t v41 = MEMORY[0x263F8EE58] + 8;
  uint64_t v15 = v43;
  uint64_t v46 = v2;
  unint64_t v39 = v13;
  unint64_t v45 = 0xD00000000000001ALL;
  while (1)
  {
    if (v11 == (char *)1)
    {
      uint64_t v40 = 1;
      for (uint64_t i = 0; i != 48; i += 16)
      {
        id v58 = v14;
        unint64_t v59 = v47;
        swift_bridgeObjectRetain();
        sub_247D28510();
        swift_bridgeObjectRelease();
        uint64_t v18 = (uint64_t)v58;
        unint64_t v17 = v59;
        (*v52)(v56, v50, v2);
        uint64_t v19 = v55;
        (*v51)(v15, (char *)v53 + *(int *)(v54 + 44), v55);
        (*v49)(v15, 0, 1, v19);
        swift_bridgeObjectRetain();
        sub_247D27E30();
        os_log_type_t v20 = (void *)sub_247D27DD0();
        (*v48)(v7, v19);
        id v58 = 0;
        unsigned int v21 = objc_msgSend(v57, sel_removeItemAtURL_error_, v20, &v58);

        id v22 = v58;
        if (v21)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          unint64_t v23 = v22;
          unint64_t v24 = (void *)sub_247D27D80();

          swift_willThrow();
          if (qword_26B137110 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_247D28220();
          __swift_project_value_buffer(v25, (uint64_t)qword_26B137118);
          id v26 = v24;
          swift_bridgeObjectRetain();
          id v27 = v24;
          uint64_t v28 = sub_247D28200();
          os_log_type_t v29 = sub_247D28620();
          BOOL v30 = os_log_type_enabled(v28, v29);
          uint64_t v44 = 0;
          if (v30)
          {
            uint64_t v31 = swift_slowAlloc();
            uint64_t v32 = (void *)swift_slowAlloc();
            id v33 = (void *)swift_slowAlloc();
            id v58 = v33;
            *(_DWORD *)uint64_t v31 = v42;
            swift_bridgeObjectRetain();
            *(void *)(v31 + 4) = sub_247D1E1F8(v18, v17, (uint64_t *)&v58);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v31 + 12) = 2112;
            id v34 = v24;
            uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v31 + 14) = v35;
            *uint64_t v32 = v35;

            _os_log_impl(&dword_247D0A000, v28, v29, "error removing %s: %@", (uint8_t *)v31, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B137170);
            swift_arrayDestroy();
            MEMORY[0x24C569DE0](v32, -1, -1);
            swift_arrayDestroy();
            uint64_t v36 = v33;
            uint64_t v15 = v43;
            MEMORY[0x24C569DE0](v36, -1, -1);
            MEMORY[0x24C569DE0](v31, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          id v14 = (void *)v45;
          uint64_t v2 = v46;
        }
      }
      swift_arrayDestroy();
      uint64_t v11 = (char *)v40;
      BOOL v13 = v39;
    }
    if (v11 == v13) {
      break;
    }
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      break;
    }
  }
}

uint64_t PublisherStore.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  uint64_t v2 = sub_247D27E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t PublisherStore.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync5Store_url;
  uint64_t v2 = sub_247D27E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_247D214A8()
{
  return type metadata accessor for PublisherStore();
}

uint64_t type metadata accessor for PublisherStore()
{
  uint64_t result = qword_26B1377D0;
  if (!qword_26B1377D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247D214FC()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PublisherStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PublisherStore);
}

uint64_t sub_247D2154C()
{
  return sub_247D21570();
}

uint64_t sub_247D21558@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D21564()
{
  return sub_247D21570();
}

uint64_t sub_247D21570()
{
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  swift_release();
  return v0;
}

uint64_t sub_247D2166C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D21678@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_247D21780()
{
  return sub_247D21570();
}

uint64_t sub_247D2178C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D21798()
{
  return sub_247D21570();
}

uint64_t sub_247D217A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D217B0()
{
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  swift_release();
  return v1;
}

uint64_t sub_247D218B4@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247D219C0()
{
  return swift_release();
}

uint64_t sub_247D21AF8()
{
  return swift_release();
}

unint64_t sub_247D21BD0(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 3:
      unint64_t result = 0x6D726F6674616C70;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247D21C8C()
{
  return sub_247D28890();
}

uint64_t sub_247D21CD4()
{
  return sub_247D28880();
}

uint64_t sub_247D21D00()
{
  return sub_247D28890();
}

unint64_t sub_247D21D44()
{
  return sub_247D21BD0(*v0);
}

uint64_t sub_247D21D4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247D23F94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247D21D74()
{
  return 0;
}

void sub_247D21D80(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_247D21D8C(uint64_t a1)
{
  unint64_t v2 = sub_247D246E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247D21DC8(uint64_t a1)
{
  unint64_t v2 = sub_247D246E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t *sub_247D21E04(void *a1)
{
  uint64_t v3 = sub_247D27EA0();
  uint64_t v34 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8570);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PlaceholderRecord();
  v1[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A48);
  uint64_t v10 = sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  v44[0] = v9;
  v44[1] = v9;
  v44[2] = v10;
  uint64_t v45 = v10;
  v1[6] = swift_getOpaqueTypeConformance2();
  uint64_t v11 = (uint64_t)(v1 + 2);
  __swift_allocate_boxed_opaque_existential_1(v1 + 2);
  uint64_t v38 = v9;
  sub_247D28320();
  unint64_t v39 = (char *)v1 + OBJC_IVAR____TtC18AppPlaceholderSync17PlaceholderRecord___observationRegistrar;
  uint64_t v40 = v1;
  sub_247D27F20();
  uint64_t v12 = a1[3];
  uint64_t v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_247D246E8();
  uint64_t v37 = v8;
  BOOL v13 = v46;
  sub_247D288A0();
  if (v13)
  {
    uint64_t v14 = (uint64_t)(v1 + 2);
    uint64_t v32 = v40;
    uint64_t v15 = (uint64_t)v41;
    uint64_t v16 = v39;
    __swift_destroy_boxed_opaque_existential_0(v14);
    uint64_t v17 = sub_247D27F30();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    swift_deallocPartialClassInstance();
    __swift_destroy_boxed_opaque_existential_0(v15);
  }
  else
  {
    LOBYTE(v44[0]) = 0;
    uint64_t v19 = sub_247D28790();
    uint64_t v21 = v20;
    sub_247D24628(v11, (uint64_t)v44);
    uint64_t v46 = __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    uint64_t v42 = v19;
    uint64_t v43 = v21;
    sub_247D28250();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    LOBYTE(v44[0]) = 1;
    uint64_t v22 = sub_247D28790();
    uint64_t v24 = v23;
    sub_247D24628(v11, (uint64_t)v44);
    uint64_t v46 = __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    uint64_t v42 = v22;
    uint64_t v43 = v24;
    sub_247D28250();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    LOBYTE(v44[0]) = 2;
    uint64_t v25 = sub_247D28790();
    uint64_t v27 = v26;
    sub_247D24628(v11, (uint64_t)v44);
    uint64_t v46 = __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    uint64_t v42 = v25;
    uint64_t v43 = v27;
    sub_247D28250();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    LOBYTE(v44[0]) = 3;
    LODWORD(v25) = sub_247D287B0();
    sub_247D24628(v11, (uint64_t)v44);
    __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    LODWORD(v42) = v25;
    sub_247D28250();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    LOBYTE(v44[0]) = 4;
    sub_247D2473C(&qword_26B137228, MEMORY[0x263F07490]);
    sub_247D287A0();
    sub_247D24628(v11, (uint64_t)v44);
    __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    sub_247D2473C(&qword_26B137220, MEMORY[0x263F07490]);
    uint64_t v28 = v36;
    sub_247D28250();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    LOBYTE(v44[0]) = 5;
    uint64_t v29 = sub_247D28790();
    uint64_t v31 = v30;
    sub_247D24628(v11, (uint64_t)v44);
    __swift_project_boxed_opaque_existential_1(v44, v45);
    swift_getKeyPath();
    uint64_t v42 = v29;
    uint64_t v43 = v31;
    sub_247D28250();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v28);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
    return v40;
  }
  return v32;
}

uint64_t sub_247D22598(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247D27EA0();
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C8580);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D246E8();
  sub_247D288B0();
  uint64_t v11 = v2 + OBJC_IVAR____TtC18AppPlaceholderSync17PlaceholderRecord___observationRegistrar;
  uint64_t v23 = v2;
  swift_getKeyPath();
  uint64_t v21 = sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  uint64_t v22 = v11;
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  uint64_t v20 = sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  swift_release();
  LOBYTE(v23) = 0;
  uint64_t v12 = v24;
  sub_247D287C0();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    uint64_t v17 = v6;
    uint64_t v24 = v8;
    uint64_t v13 = v19;
    swift_bridgeObjectRelease();
    uint64_t v23 = v2;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    LOBYTE(v23) = 1;
    sub_247D287C0();
    swift_bridgeObjectRelease();
    uint64_t v23 = v2;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    LOBYTE(v23) = 2;
    sub_247D287C0();
    swift_bridgeObjectRelease();
    uint64_t v23 = v2;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    LOBYTE(v23) = 3;
    sub_247D287E0();
    uint64_t v23 = v2;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    uint64_t v15 = (void (*)(uint64_t))MEMORY[0x263F07490];
    sub_247D2473C(&qword_26B137228, MEMORY[0x263F07490]);
    uint64_t v16 = v17;
    sub_247D28360();
    swift_release();
    LOBYTE(v23) = 4;
    sub_247D2473C(&qword_26B137220, v15);
    sub_247D287D0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
    uint64_t v23 = v2;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    LOBYTE(v23) = 5;
    sub_247D287C0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D22C04(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for PlaceholderRecord();
  *(void *)(v2 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A48);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_247D28320();
  sub_247D27F20();
  sub_247D24628(a1, (uint64_t)&v7);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  sub_247D2468C(&v7, (uint64_t)v4);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v2;
}

uint64_t sub_247D22D3C()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync17PlaceholderRecord___observationRegistrar;
  uint64_t v2 = sub_247D27F30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_247D22DE4()
{
  return type metadata accessor for PlaceholderRecord();
}

uint64_t type metadata accessor for PlaceholderRecord()
{
  uint64_t result = qword_26B137290;
  if (!qword_26B137290) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247D22E38()
{
  uint64_t result = sub_247D27F30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderRecord._SwiftDataNoType()
{
  return &type metadata for PlaceholderRecord._SwiftDataNoType;
}

uint64_t *sub_247D22EFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for PlaceholderRecord();
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_247D21E04(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_247D22F58(void *a1)
{
  return sub_247D22598(a1);
}

uint64_t sub_247D22F7C()
{
  uint64_t v1 = sub_247D27EA0();
  uint64_t v7 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_247D28670();
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  swift_release();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D28360();
  swift_release();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D28360();
  swift_release();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D28360();
  swift_release();
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  uint64_t v4 = (void (*)(uint64_t))MEMORY[0x263F07490];
  sub_247D2473C(&qword_26B137228, MEMORY[0x263F07490]);
  sub_247D28360();
  swift_release();
  sub_247D2473C(&qword_26B137230, v4);
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v1);
  sub_247D28510();
  uint64_t v8 = v0;
  swift_getKeyPath();
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D28360();
  swift_release();
  sub_247D28510();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_247D234F0()
{
  return sub_247D22F7C();
}

uint64_t sub_247D23514(uint64_t a1)
{
  type metadata accessor for PlaceholderRecord();
  uint64_t v2 = swift_allocObject();
  sub_247D22C04(a1);
  return v2;
}

uint64_t sub_247D23558@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_247D24628(v1 + 16, a1);
}

uint64_t sub_247D235A4(long long *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_247D2468C(a1, v3);
  return swift_endAccess();
}

void (*sub_247D23600(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  sub_247D24628(v1 + 16, (uint64_t)v3);
  return sub_247D2367C;
}

void sub_247D2367C(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(v2 + 128) + 16;
    sub_247D24628(*a1, (uint64_t)v3);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0(v4);
    sub_247D2468C(v3, v4);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0(v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128) + 16;
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0(v5);
    sub_247D2468C((long long *)v2, v5);
    swift_endAccess();
  }

  free((void *)v2);
}

uint64_t sub_247D23750()
{
  return sub_247D28890();
}

uint64_t sub_247D237DC()
{
  return sub_247D28350();
}

uint64_t sub_247D23834()
{
  return sub_247D28890();
}

uint64_t sub_247D2389C()
{
  return sub_247D28340();
}

uint64_t sub_247D23918(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EFE8F0](v4, v5, a3, WitnessTable);
}

uint64_t sub_247D23984()
{
  return sub_247D2473C(&qword_2692C8568, MEMORY[0x263F18140]);
}

uint64_t sub_247D239CC()
{
  return sub_247D2473C(&qword_26B137280, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
}

uint64_t sub_247D23A14()
{
  return sub_247D2473C(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
}

uint64_t sub_247D23A5C()
{
  return sub_247D2473C(&qword_26B137278, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
}

uint64_t sub_247D23AA4()
{
  return sub_247D2473C(&qword_26B137288, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
}

uint64_t *sub_247D23AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, char *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v28 = a8;
  int v27 = a7;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a3;
  uint64_t v30 = a9;
  uint64_t v31 = a10;
  uint64_t v14 = sub_247D27EA0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v26 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for PlaceholderRecord();
  v10[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137A48);
  uint64_t v29 = v10;
  uint64_t v18 = sub_247D2473C(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  v34[0] = v17;
  v34[1] = v17;
  v34[2] = v18;
  uint64_t v35 = v18;
  v10[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v10 + 2);
  sub_247D28320();
  sub_247D27F20();
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  sub_247D28250();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  uint64_t v32 = v23;
  uint64_t v33 = a4;
  sub_247D28250();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  uint64_t v32 = v24;
  uint64_t v33 = v25;
  sub_247D28250();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  LODWORD(v32) = v27;
  sub_247D28250();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  uint64_t v19 = v26;
  uint64_t v20 = v28;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v26, v28, v14);
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  sub_247D2473C(&qword_26B137220, MEMORY[0x263F07490]);
  sub_247D28250();
  swift_release();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v15 + 8);
  v21(v19, v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  sub_247D24628((uint64_t)(v10 + 2), (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_getKeyPath();
  uint64_t v32 = v30;
  uint64_t v33 = v31;
  sub_247D28250();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  v21(v20, v14);
  return v29;
}

uint64_t sub_247D23F94(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_247D28800() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247D2ACE0 || (sub_247D28800() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 || (sub_247D28800() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_247D28800() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247D2AD00 || (sub_247D28800() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247D2AD20)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_247D28800();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_247D24208()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AD8);
  sub_247D283D0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247D29890;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137188);
  sub_247D28410();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_247D29080;
  sub_247D28400();
  sub_247D28420();
  swift_allocObject();
  sub_247D28430();
  sub_247D2473C(&qword_26B137A50, MEMORY[0x263F181D0]);
  sub_247D283C0();
  swift_getKeyPath();
  sub_247D283C0();
  swift_getKeyPath();
  sub_247D283C0();
  swift_getKeyPath();
  sub_247D283C0();
  swift_getKeyPath();
  sub_247D283C0();
  swift_getKeyPath();
  sub_247D283C0();
  return v0;
}

uint64_t sub_247D2459C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D245BC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D245DC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D24608@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_247D21678(a1, a2);
}

uint64_t sub_247D24628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247D2468C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

unint64_t sub_247D246E8()
{
  unint64_t result = qword_2692C8578;
  if (!qword_2692C8578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C8578);
  }
  return result;
}

uint64_t sub_247D2473C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaceholderRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlaceholderRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x247D248F0);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_247D24918(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247D24920(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderRecord.CodingKeys()
{
  return &type metadata for PlaceholderRecord.CodingKeys;
}

unint64_t sub_247D2493C()
{
  unint64_t result = qword_2692C8588;
  if (!qword_2692C8588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C8588);
  }
  return result;
}

unint64_t sub_247D24994()
{
  unint64_t result = qword_2692C8590;
  if (!qword_2692C8590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C8590);
  }
  return result;
}

unint64_t sub_247D249EC()
{
  unint64_t result = qword_2692C8598;
  if (!qword_2692C8598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C8598);
  }
  return result;
}

uint64_t SyncItem.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247D24B08(&OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier, MEMORY[0x263F07508], a1);
}

uint64_t SyncItem.bundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SyncItem.version.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SyncItem.platform.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform);
}

uint64_t SyncItem.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247D24B08(&OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate, MEMORY[0x263F07490], a1);
}

uint64_t sub_247D24B08@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);

  return v7(a3, v5, v6);
}

uint64_t SyncItem.deviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_247D24BB8(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 3:
      unint64_t result = 0x6D726F6674616C70;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_247D24C74()
{
  return sub_247D24BB8(*v0);
}

uint64_t sub_247D24C7C(uint64_t a1)
{
  unint64_t v2 = sub_247D251CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247D24CB8(uint64_t a1)
{
  unint64_t v2 = sub_247D251CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SyncItem.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier;
  uint64_t v2 = sub_247D27EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate;
  uint64_t v4 = sub_247D27EA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SyncItem.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier;
  uint64_t v2 = sub_247D27EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate;
  uint64_t v4 = sub_247D27EA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_247D24EF8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AB8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D251CC();
  sub_247D288B0();
  v8[15] = 0;
  sub_247D27EE0();
  sub_247D26EA8(&qword_26B137238, MEMORY[0x263F07508]);
  sub_247D287D0();
  if (!v1)
  {
    v8[14] = 1;
    sub_247D287C0();
    v8[13] = 2;
    sub_247D287C0();
    v8[12] = 3;
    sub_247D287E0();
    v8[11] = 4;
    sub_247D27EA0();
    sub_247D26EA8(&qword_26B137220, MEMORY[0x263F07490]);
    sub_247D287D0();
    v8[10] = 5;
    sub_247D287C0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_247D251CC()
{
  unint64_t result = qword_26B137478;
  if (!qword_26B137478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137478);
  }
  return result;
}

uint64_t SyncItem.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  SyncItem.init(from:)(a1);
  return v2;
}

uint64_t SyncItem.init(from:)(void *a1)
{
  uint64_t v2 = sub_247D27EA0();
  uint64_t v35 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247D27EE0();
  uint64_t v34 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692C85A0);
  uint64_t v6 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  int v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_247D251CC();
  uint64_t v37 = v8;
  uint64_t v10 = v39;
  sub_247D288A0();
  if (v10)
  {
    uint64_t v14 = (uint64_t)v38;
    uint64_t v16 = v40;
    type metadata accessor for SyncItem();
    swift_deallocPartialClassInstance();
    uint64_t v31 = v14;
  }
  else
  {
    uint64_t v33 = v4;
    uint64_t v11 = v6;
    uint64_t v12 = v35;
    uint64_t v39 = v2;
    char v46 = 0;
    sub_247D26EA8(&qword_2692C85A8, MEMORY[0x263F07508]);
    uint64_t v13 = v36;
    sub_247D287A0();
    uint64_t v16 = v40;
    uint64_t v17 = *(void (**)(void))(v34 + 32);
    v32[1] = v40 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier;
    v17();
    char v45 = 1;
    uint64_t v18 = sub_247D28790();
    uint64_t v19 = (uint64_t *)(v16 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
    *uint64_t v19 = v18;
    v19[1] = v20;
    char v44 = 2;
    v32[0] = 0;
    uint64_t v21 = sub_247D28790();
    uint64_t v22 = v12;
    uint64_t v23 = (uint64_t *)(v16 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
    *uint64_t v23 = v21;
    v23[1] = v24;
    char v43 = 3;
    *(_DWORD *)(v16 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform) = sub_247D287B0();
    char v42 = 4;
    sub_247D26EA8(&qword_26B137228, MEMORY[0x263F07490]);
    uint64_t v25 = v33;
    uint64_t v26 = v39;
    sub_247D287A0();
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v16 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate, v25, v26);
    char v41 = 5;
    uint64_t v27 = sub_247D28790();
    uint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v37, v13);
    uint64_t v30 = (uint64_t *)(v16 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier);
    *uint64_t v30 = v27;
    v30[1] = v29;
    uint64_t v31 = (uint64_t)v38;
  }
  __swift_destroy_boxed_opaque_existential_0(v31);
  return v16;
}

uint64_t type metadata accessor for SyncItem()
{
  uint64_t result = qword_26B137498;
  if (!qword_26B137498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247D2589C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for SyncItem();
  uint64_t v5 = swift_allocObject();
  uint64_t result = SyncItem.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_247D258F8(void *a1)
{
  return sub_247D24EF8(a1);
}

uint64_t SyncItem.description.getter()
{
  sub_247D28670();
  sub_247D28510();
  sub_247D27EE0();
  sub_247D26EA8(&qword_26B137240, MEMORY[0x263F07508]);
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  swift_bridgeObjectRetain();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  swift_bridgeObjectRetain();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  uint64_t v2 = *(unsigned int *)(v0 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform);
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  sub_247D27EA0();
  sub_247D26EA8(&qword_26B137230, MEMORY[0x263F07490]);
  sub_247D287F0();
  sub_247D28510();
  swift_bridgeObjectRelease();
  sub_247D28510();
  swift_bridgeObjectRetain();
  sub_247D28510();
  swift_bridgeObjectRelease();
  return HIDWORD(v2);
}

uint64_t sub_247D25BE0()
{
  return SyncItem.description.getter();
}

uint64_t sub_247D25C04()
{
  return type metadata accessor for SyncItem();
}

uint64_t sub_247D25C0C()
{
  uint64_t result = sub_247D27EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_247D27EA0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SyncItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SyncItem);
}

uint64_t dispatch thunk of SyncItem.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SyncItem.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

unsigned char *storeEnumTagSinglePayload for SyncItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x247D25E34);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncItem.CodingKeys()
{
  return &type metadata for SyncItem.CodingKeys;
}

unint64_t sub_247D25E70()
{
  unint64_t result = qword_2692C85B0;
  if (!qword_2692C85B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692C85B0);
  }
  return result;
}

unint64_t sub_247D25EC8()
{
  unint64_t result = qword_26B137488;
  if (!qword_26B137488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137488);
  }
  return result;
}

unint64_t sub_247D25F20()
{
  unint64_t result = qword_26B137480;
  if (!qword_26B137480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B137480);
  }
  return result;
}

id sub_247D25F74(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_247D284A0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_247D27D80();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_247D26050(uint64_t a1)
{
  uint64_t v2 = sub_247D27EA0();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v27 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137248);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = a1;
  swift_getKeyPath();
  sub_247D26EA8(&qword_26B137268, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D27F10();
  swift_release();
  swift_getKeyPath();
  sub_247D26EA8(&qword_26B137270, (void (*)(uint64_t))type metadata accessor for PlaceholderRecord);
  sub_247D28360();
  swift_release();
  sub_247D27EB0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_247D27EE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v26 = v6;
  uint64_t result = v9(v6, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v30 = a1;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    uint64_t v24 = v31;
    uint64_t v25 = v30;
    uint64_t v30 = a1;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    uint64_t v22 = v31;
    uint64_t v23 = v30;
    uint64_t v30 = a1;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    int v21 = v30;
    uint64_t v30 = a1;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D26EA8(&qword_26B137228, MEMORY[0x263F07490]);
    uint64_t v11 = v27;
    sub_247D28360();
    swift_release();
    uint64_t v30 = a1;
    swift_getKeyPath();
    sub_247D27F10();
    swift_release();
    swift_getKeyPath();
    sub_247D28360();
    swift_release();
    uint64_t v12 = v30;
    uint64_t v13 = v31;
    type metadata accessor for SyncItem();
    uint64_t v14 = swift_allocObject();
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 32))(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier, v26, v7);
    uint64_t v15 = (void *)(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
    uint64_t v16 = v24;
    void *v15 = v25;
    v15[1] = v16;
    uint64_t v17 = (void *)(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
    uint64_t v18 = v22;
    *uint64_t v17 = v23;
    v17[1] = v18;
    *(_DWORD *)(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform) = v21;
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v28 + 32))(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate, v11, v29);
    uint64_t v19 = (void *)(v14 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier);
    *uint64_t v19 = v12;
    v19[1] = v13;
    return v14;
  }
  return result;
}

uint64_t sub_247D2659C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B137178);
    uint64_t v3 = sub_247D28660();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      id v6 = *(void **)(v32 + 8 * v4);
      sub_247D284D0();
      sub_247D28870();
      id v7 = v6;
      sub_247D28500();
      uint64_t v8 = sub_247D28890();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_247D284D0();
        uint64_t v17 = v16;
        if (v15 == sub_247D284D0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_247D28800();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_247D284D0();
          uint64_t v24 = v23;
          if (v22 == sub_247D284D0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_247D28800();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

id sub_247D267CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v70 = a4;
  uint64_t v62 = a3;
  uint64_t v71 = a2;
  uint64_t v6 = sub_247D27EE0();
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v64 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137140);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247D27E60();
  uint64_t v68 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v67 = (char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247D27CE0();
  uint64_t v63 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v69 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247D27EA0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v56 - v20;
  id v22 = objc_allocWithZone(MEMORY[0x263F01878]);
  id v23 = sub_247D25F74(a1, v71, 0);
  if (v4)
  {
    swift_bridgeObjectRelease();
    return (id)v15;
  }
  uint64_t v24 = v23;
  unint64_t v59 = v10;
  uint64_t v60 = v11;
  id v57 = v19;
  uint64_t v58 = v13;
  uint64_t v61 = v16;
  uint64_t v71 = v15;
  sub_247D27E70();
  id v25 = objc_msgSend(v24, sel_URL);
  uint64_t v26 = v67;
  sub_247D27E10();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B137AE0);
  char v27 = v24;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247D29080;
  BOOL v29 = (void *)*MEMORY[0x263EFF5F8];
  *(void *)(inited + 32) = *MEMORY[0x263EFF5F8];
  id v30 = v29;
  sub_247D2659C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_247D27DB0();
  uint64_t v31 = v21;
  v56[1] = 0;
  (*(void (**)(char *, uint64_t))(v68 + 8))(v26, v60);
  swift_bridgeObjectRelease();
  uint64_t v33 = (uint64_t)v59;
  sub_247D27CD0();
  uint64_t v34 = v61;
  uint64_t v35 = v71;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v33, 1, v71) == 1)
  {
    sub_247D26E44(v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v35);
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v31, v33, v35);
  }
  id result = objc_msgSend(v27, sel_bundleIdentifier);
  if (result)
  {
    uint64_t v36 = result;
    uint64_t v37 = v31;
    uint64_t v38 = sub_247D284D0();
    uint64_t v40 = v39;

    char v41 = v27;
    id v42 = objc_msgSend(v27, sel_shortVersionString);
    uint64_t v67 = v40;
    uint64_t v68 = v38;
    if (v42)
    {
      char v43 = v42;
      uint64_t v60 = sub_247D284D0();
      unint64_t v45 = v44;
    }
    else
    {
      uint64_t v60 = 0;
      unint64_t v45 = 0xE000000000000000;
    }
    char v46 = v57;
    unsigned int v47 = objc_msgSend(v41, sel_platform);
    uint64_t v48 = v71;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v46, v37, v71);
    unint64_t v49 = v64;
    sub_247D27ED0();
    type metadata accessor for SyncItem();
    uint64_t v15 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 32))(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_identifier, v49, v66);
    unsigned int v50 = (uint64_t *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_bundleIdentifier);
    unint64_t v51 = v67;
    *unsigned int v50 = v68;
    v50[1] = (uint64_t)v51;
    unint64_t v52 = (uint64_t *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_version);
    uint64_t *v52 = v60;
    v52[1] = v45;
    *(_DWORD *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_platform) = v47;
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_lastModifiedDate, v46, v48);

    uint64_t v53 = (void *)(v15 + OBJC_IVAR____TtC18AppPlaceholderSync8SyncItem_deviceIdentifier);
    uint64_t v54 = v69;
    uint64_t v55 = v70;
    *uint64_t v53 = v62;
    v53[1] = v55;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v54, v58);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v48);
    return (id)v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_247D26E44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B137140);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247D26EA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247D26F0C()
{
  uint64_t v53 = sub_247D28130();
  *(void *)&long long v52 = *(void *)(v53 - 8);
  uint64_t v0 = MEMORY[0x270FA5388](v53);
  unsigned int v47 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  unint64_t v51 = (char *)&v43 - v2;
  uint64_t v3 = sub_247D27FA0();
  uint64_t v44 = *(void *)(v3 - 8);
  *(void *)&long long v45 = v3;
  MEMORY[0x270FA5388](v3);
  char v46 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247D281A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247D28160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247D28110();
  uint64_t v49 = *(void *)(v13 - 8);
  uint64_t v50 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v48 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(self, sel_defaultManager);
  uint64_t v16 = (void *)sub_247D284A0();
  unsigned int v17 = objc_msgSend(v15, sel_fileExistsAtPath_, v16);

  if (v17)
  {
    int v56 = 10;
    swift_beginAccess();
    sub_247D28050();
    uint64_t v53 = 0;
    *(void *)&long long v18 = 138412546;
    long long v52 = v18;
    swift_allocObject();
    uint64_t v19 = sub_247D28000();
    swift_release();
    swift_retain_n();
    sub_247D28040();
    swift_release();
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_247D28220();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B137118);
    swift_retain();
    BOOL v29 = sub_247D28200();
    os_log_type_t v30 = sub_247D28610();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v57[0] = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v54 = v19;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692C85C8);
      uint64_t v33 = sub_247D284E0();
      uint64_t v54 = sub_247D1E1F8(v33, v34, v57);
      sub_247D28640();
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v32, -1, -1);
      MEMORY[0x24C569DE0](v31, -1, -1);

      swift_release();
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F63FF8], v9);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F64040], v5);
    if (qword_26B1378A0 != -1) {
      swift_once();
    }
    uint64_t v20 = v45;
    uint64_t v21 = __swift_project_value_buffer(v45, (uint64_t)qword_26B137B38);
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v46, v21, v20);
    id v22 = v48;
    sub_247D28100();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692C85B8);
    sub_247D28150();
    uint64_t v23 = swift_allocObject();
    long long v45 = xmmword_247D29080;
    *(_OWORD *)(v23 + 16) = xmmword_247D29080;
    sub_247D27F80();
    sub_247D28140();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692C85C0);
    uint64_t v24 = v49;
    unint64_t v25 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = v45;
    (*(void (**)(unint64_t, char *, uint64_t))(v24 + 16))(v26 + v25, v22, v50);
    char v27 = v51;
    sub_247D28120();
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v47, v27, v53);
    sub_247D156C4(MEMORY[0x263F8EE78]);
    sub_247D28050();
    swift_allocObject();
    uint64_t v19 = sub_247D27FC0();
    sub_247D28040();
    if (qword_26B137110 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_247D28220();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B137118);
    swift_retain_n();
    uint64_t v36 = sub_247D28200();
    os_log_type_t v37 = sub_247D28610();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v55[0] = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      v57[0] = v19;
      swift_retain();
      uint64_t v40 = sub_247D284E0();
      v57[0] = sub_247D1E1F8(v40, v41, v55);
      sub_247D28640();
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x24C569DE0](v39, -1, -1);
      MEMORY[0x24C569DE0](v38, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v50);
  }
  return v19;
}

uint64_t sub_247D27CD0()
{
  return MEMORY[0x270EEEFA8]();
}

uint64_t sub_247D27CE0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_247D27CF0()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_247D27D00()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_247D27D10()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_247D27D20()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_247D27D30()
{
  return MEMORY[0x270EEF518]();
}

uint64_t sub_247D27D40()
{
  return MEMORY[0x270EEF548]();
}

uint64_t sub_247D27D50()
{
  return MEMORY[0x270EEF5E0]();
}

uint64_t sub_247D27D60()
{
  return MEMORY[0x270EEF740]();
}

uint64_t sub_247D27D70()
{
  return MEMORY[0x270EEF750]();
}

uint64_t sub_247D27D80()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247D27D90()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_247D27DA0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_247D27DB0()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_247D27DC0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_247D27DD0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247D27DE0()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_247D27DF0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_247D27E00()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t sub_247D27E10()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247D27E20()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_247D27E30()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_247D27E40()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_247D27E50()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_247D27E60()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247D27E70()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_247D27E80()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_247D27E90()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_247D27EA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_247D27EB0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_247D27EC0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_247D27ED0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247D27EE0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247D27EF0()
{
  return MEMORY[0x270EF1778]();
}

uint64_t sub_247D27F00()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_247D27F10()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_247D27F20()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_247D27F30()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_247D27F40()
{
  return MEMORY[0x270F5B408]();
}

uint64_t sub_247D27F50()
{
  return MEMORY[0x270F5B448]();
}

uint64_t sub_247D27F60()
{
  return MEMORY[0x270F5B450]();
}

uint64_t sub_247D27F70()
{
  return MEMORY[0x270F5B460]();
}

uint64_t sub_247D27F80()
{
  return MEMORY[0x270F5B478]();
}

uint64_t sub_247D27F90()
{
  return MEMORY[0x270F5B490]();
}

uint64_t sub_247D27FA0()
{
  return MEMORY[0x270F5B4A8]();
}

uint64_t sub_247D27FB0()
{
  return MEMORY[0x270F5B4B0]();
}

uint64_t sub_247D27FC0()
{
  return MEMORY[0x270F5B5F8]();
}

uint64_t sub_247D27FD0()
{
  return MEMORY[0x270F5B600]();
}

uint64_t sub_247D27FE0()
{
  return MEMORY[0x270F5B610]();
}

uint64_t sub_247D27FF0()
{
  return MEMORY[0x270F5B618]();
}

uint64_t sub_247D28000()
{
  return MEMORY[0x270F5B630]();
}

uint64_t sub_247D28010()
{
  return MEMORY[0x270F5B638]();
}

uint64_t sub_247D28020()
{
  return MEMORY[0x270F5B640]();
}

uint64_t sub_247D28030()
{
  return MEMORY[0x270F5B648]();
}

uint64_t sub_247D28040()
{
  return MEMORY[0x270F5B650]();
}

uint64_t sub_247D28050()
{
  return MEMORY[0x270F5B660]();
}

uint64_t sub_247D28060()
{
  return MEMORY[0x270F5B768]();
}

uint64_t sub_247D28070()
{
  return MEMORY[0x270F5B788]();
}

uint64_t sub_247D28080()
{
  return MEMORY[0x270F5B798]();
}

uint64_t sub_247D28090()
{
  return MEMORY[0x270F5B7A0]();
}

uint64_t sub_247D280A0()
{
  return MEMORY[0x270F5B7B0]();
}

uint64_t sub_247D280B0()
{
  return MEMORY[0x270F5B7C8]();
}

uint64_t sub_247D280C0()
{
  return MEMORY[0x270F5B7E8]();
}

uint64_t sub_247D280D0()
{
  return MEMORY[0x270F5B800]();
}

uint64_t sub_247D280E0()
{
  return MEMORY[0x270F5B818]();
}

uint64_t sub_247D280F0()
{
  return MEMORY[0x270F5B888]();
}

uint64_t sub_247D28100()
{
  return MEMORY[0x270F5B8C8]();
}

uint64_t sub_247D28110()
{
  return MEMORY[0x270F5B8D8]();
}

uint64_t sub_247D28120()
{
  return MEMORY[0x270F5B910]();
}

uint64_t sub_247D28130()
{
  return MEMORY[0x270F5B930]();
}

uint64_t sub_247D28140()
{
  return MEMORY[0x270F5B938]();
}

uint64_t sub_247D28150()
{
  return MEMORY[0x270F5B960]();
}

uint64_t sub_247D28160()
{
  return MEMORY[0x270F5B998]();
}

uint64_t sub_247D28170()
{
  return MEMORY[0x270F5B9A8]();
}

uint64_t sub_247D28180()
{
  return MEMORY[0x270F5B9B0]();
}

uint64_t sub_247D28190()
{
  return MEMORY[0x270F5B9B8]();
}

uint64_t sub_247D281A0()
{
  return MEMORY[0x270F5B9F0]();
}

uint64_t sub_247D281B0()
{
  return MEMORY[0x270FA1730]();
}

uint64_t sub_247D281C0()
{
  return MEMORY[0x270FA17F0]();
}

uint64_t sub_247D281D0()
{
  return MEMORY[0x270FA1898]();
}

uint64_t sub_247D281E0()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_247D281F0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_247D28200()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247D28210()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247D28220()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247D28230()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t sub_247D28240()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_247D28250()
{
  return MEMORY[0x270EFE750]();
}

uint64_t sub_247D28260()
{
  return MEMORY[0x270EFE770]();
}

uint64_t sub_247D28270()
{
  return MEMORY[0x270EFE778]();
}

uint64_t sub_247D28280()
{
  return MEMORY[0x270EFE780]();
}

uint64_t sub_247D28290()
{
  return MEMORY[0x270EFE7D0]();
}

uint64_t sub_247D282A0()
{
  return MEMORY[0x270EFE7D8]();
}

uint64_t sub_247D282B0()
{
  return MEMORY[0x270EFE7F8]();
}

uint64_t sub_247D282C0()
{
  return MEMORY[0x270EFE800]();
}

uint64_t sub_247D282D0()
{
  return MEMORY[0x270EFE818]();
}

uint64_t sub_247D282E0()
{
  return MEMORY[0x270EFE828]();
}

uint64_t sub_247D282F0()
{
  return MEMORY[0x270EFE850]();
}

uint64_t sub_247D28300()
{
  return MEMORY[0x270EFE878]();
}

uint64_t sub_247D28310()
{
  return MEMORY[0x270EFE8B8]();
}

uint64_t sub_247D28320()
{
  return MEMORY[0x270EFE8D0]();
}

uint64_t sub_247D28340()
{
  return MEMORY[0x270EFE8F8]();
}

uint64_t sub_247D28350()
{
  return MEMORY[0x270EFE900]();
}

uint64_t sub_247D28360()
{
  return MEMORY[0x270EFE918]();
}

uint64_t sub_247D28370()
{
  return MEMORY[0x270EFE928]();
}

uint64_t sub_247D28380()
{
  return MEMORY[0x270EFE958]();
}

uint64_t sub_247D28390()
{
  return MEMORY[0x270EFE970]();
}

uint64_t sub_247D283A0()
{
  return MEMORY[0x270EFE988]();
}

uint64_t sub_247D283B0()
{
  return MEMORY[0x270EFE9A0]();
}

uint64_t sub_247D283C0()
{
  return MEMORY[0x270EFEA50]();
}

uint64_t sub_247D283D0()
{
  return MEMORY[0x270EFEA58]();
}

uint64_t sub_247D283E0()
{
  return MEMORY[0x270EFEA68]();
}

uint64_t sub_247D283F0()
{
  return MEMORY[0x270EFEA70]();
}

uint64_t sub_247D28400()
{
  return MEMORY[0x270EFEA90]();
}

uint64_t sub_247D28410()
{
  return MEMORY[0x270EFEA98]();
}

uint64_t sub_247D28420()
{
  return MEMORY[0x270EFEAA0]();
}

uint64_t sub_247D28430()
{
  return MEMORY[0x270EFEAA8]();
}

uint64_t sub_247D28440()
{
  return MEMORY[0x270EFEAB8]();
}

uint64_t sub_247D28450()
{
  return MEMORY[0x270EFEAC0]();
}

uint64_t sub_247D28460()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247D28470()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247D28480()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247D28490()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247D284A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247D284B0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_247D284C0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_247D284D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247D284E0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247D284F0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_247D28500()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247D28510()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247D28520()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_247D28530()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247D28540()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_247D28550()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_247D28560()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247D28570()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247D28580()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_247D28590()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_247D285A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247D285B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247D285C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247D285D0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_247D285F0()
{
  return MEMORY[0x270F0CCA0]();
}

uint64_t sub_247D28600()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247D28610()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_247D28620()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247D28630()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247D28640()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247D28650()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247D28660()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247D28670()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247D28680()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247D28690()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247D286A0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_247D286B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247D286C0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247D286D0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247D286E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_247D286F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247D28700()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247D28710()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_247D28720()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247D28730()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247D28740()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247D28750()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247D28760()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247D28770()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247D28790()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247D287A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247D287B0()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_247D287C0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247D287D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247D287E0()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_247D287F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247D28800()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247D28810()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247D28820()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247D28830()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247D28840()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247D28850()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247D28860()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_247D28870()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247D28880()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247D28890()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247D288A0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247D288B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t MICreateSerializedPlaceholderForInstalledApplication()
{
  return MEMORY[0x270F4ADF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}