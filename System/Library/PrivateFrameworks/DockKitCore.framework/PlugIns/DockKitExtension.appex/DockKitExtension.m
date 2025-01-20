uint64_t sub_100003424()
{
  uint64_t v0;

  v0 = sub_10000A808();
  sub_100007954(v0, qword_100010318);
  sub_100007828(v0, (uint64_t)qword_100010318);
  return sub_10000A7F8();
}

uint64_t sub_1000034A8()
{
  *(void *)(v1 + 64) = v0;
  return _swift_task_switch(sub_1000034C8, 0, 0);
}

uint64_t sub_1000034C8()
{
  uint64_t v1 = v0[8];
  unint64_t v2 = sub_100003FF4((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000A384(0, &qword_100010238);
  Class isa = sub_10000A9B8(5242880).super.super.isa;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1000076B8((uint64_t)isa, 0x6953676F4C78616DLL, 0xEA0000000000657ALL, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  Class v5 = sub_10000A9B8(2).super.super.isa;
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_1000076B8((uint64_t)v5, 0x746F687370616E73, 0xEC00000065707954, v6);
  v0[9] = v2;
  swift_bridgeObjectRelease();
  v0[10] = *(void *)(v1 + OBJC_IVAR____TtC16DockKitExtension16DockKitExtension_manager);
  v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  void *v7 = v0;
  v7[1] = sub_100003650;
  return DockCoreManager.connectedDockAccessory()();
}

uint64_t sub_100003650(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    v4 = sub_100003B8C;
  }
  else
  {
    v4 = sub_10000376C;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000376C()
{
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    if (qword_100010310 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_10000A808();
    sub_100007828(v2, (uint64_t)qword_100010318);
    id v3 = v1;
    v4 = sub_10000A7E8();
    os_log_type_t v5 = sub_10000A998();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      v7 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 138412290;
      uint64_t v8 = sub_10000A7D8();
      v0[7] = v8;
      sub_10000A9C8();
      void *v7 = v8;

      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Got accessory %@, attempting to pull diagnostics...", v6, 0xCu);
      sub_100007860(&qword_100010240);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v11 = sub_10000A7D8();
    v0[14] = v11;
    v12 = (void *)swift_task_alloc();
    v0[15] = v12;
    void *v12 = v0;
    v12[1] = sub_1000039D0;
    uint64_t v13 = v0[9];
    return DockCoreManager.getAccessoryDiagnostics(info:options:)(v11, v13);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = (uint64_t (*)(void, void))v0[1];
    return v9(0, 0);
  }
}

uint64_t sub_1000039D0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 128) = v2;
  swift_task_dealloc();
  if (v2)
  {
    v7 = sub_100003DB4;
  }
  else
  {
    uint64_t v8 = (void *)v6[14];
    swift_bridgeObjectRelease();

    v6[17] = a2;
    v6[18] = a1;
    v7 = sub_100003B14;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100003B14()
{
  uint64_t v1 = *(void *)(v0 + 136);

  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v2 = *(void *)(v0 + 144);
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v2, v3);
}

uint64_t sub_100003B8C()
{
  uint64_t v10 = v0;
  if (qword_100010310 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10000A808();
  sub_100007828(v1, (uint64_t)qword_100010318);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10000A7E8();
  os_log_type_t v3 = sub_10000A988();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_10000AB28();
    *(void *)(v0 + 48) = sub_100006CD8(v5, v6, &v9);
    sub_10000A9C8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to capture diagnostic snapshot: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  v7 = *(uint64_t (**)(void, void))(v0 + 8);
  return v7(0, 0);
}

uint64_t sub_100003DB4()
{
  v12 = v0;
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = (void *)v0[12];
  swift_bridgeObjectRelease();

  if (qword_100010310 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10000A808();
  sub_100007828(v3, (uint64_t)qword_100010318);
  swift_errorRetain();
  swift_errorRetain();
  v4 = sub_10000A7E8();
  os_log_type_t v5 = sub_10000A988();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    swift_getErrorValue();
    uint64_t v7 = sub_10000AB28();
    v0[6] = sub_100006CD8(v7, v8, &v11);
    sub_10000A9C8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unable to capture diagnostic snapshot: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = (uint64_t (*)(void, void))v0[1];
  return v9(0, 0);
}

unint64_t sub_100003FF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007860(&qword_100010250);
  uint64_t v2 = (void *)sub_10000AAB8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100007330(v5, v6);
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

uint64_t sub_100004110()
{
  uint64_t v130 = sub_10000A818();
  uint64_t v128 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  v123 = (char *)&v120 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_10000A838();
  uint64_t v124 = *(void *)(v125 - 8);
  uint64_t v2 = __chkstk_darwin(v125);
  v121 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v122 = (char *)&v120 - v4;
  uint64_t v5 = sub_100007860(&qword_100010258);
  __chkstk_darwin(v5 - 8);
  v127 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A708();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007860(&qword_100010260);
  __chkstk_darwin(v11 - 8);
  BOOL v13 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000A768();
  unint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  v18 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v120 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 56);
  uint64_t v133 = v22;
  v21(v13, 1, 1);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for URL.DirectoryHint.inferFromPath(_:), v7);
  sub_10000A748();
  v131 = v0;
  v23 = &v0[OBJC_IVAR____TtC16DockKitExtension16DockKitExtension_attachments];
  swift_beginAccess();
  v132 = v23;
  *(void *)v23 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  v24 = self;
  id v25 = [v24 defaultManager];
  sub_10000A738(1);
  NSString v26 = sub_10000A868();
  swift_bridgeObjectRelease();
  unsigned int v27 = [v25 fileExistsAtPath:v26];

  unint64_t v129 = v15;
  v126 = v20;
  if (!v27)
  {
    if (qword_100010310 != -1) {
LABEL_70:
    }
      swift_once();
    uint64_t v45 = sub_10000A808();
    sub_100007828(v45, (uint64_t)qword_100010318);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v133);
    v46 = sub_10000A7E8();
    os_log_type_t v47 = sub_10000A988();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v137[0] = (id)swift_slowAlloc();
      *(_DWORD *)v48 = 136315138;
      uint64_t v49 = sub_10000A738(1);
      v136[0] = sub_100006CD8(v49, v50, (uint64_t *)v137);
      sub_10000A9C8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v133);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "No log directory in temporary file path: %s", v48, 0xCu);
      swift_arrayDestroy();
      uint64_t v51 = v130;
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_47;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v133);

    uint64_t v52 = v125;
    uint64_t v53 = v124;
    v54 = v123;
    v55 = v122;
    v56 = v121;
    uint64_t v51 = v130;
    goto LABEL_48;
  }
  id v28 = [v24 defaultManager];
  sub_10000A718(v29);
  v31 = v30;
  sub_100007860(&qword_100010278);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_10000B060;
  *(void *)(v32 + 32) = NSURLIsRegularFileKey;
  *(void *)(v32 + 40) = NSURLIsReadableKey;
  type metadata accessor for URLResourceKey();
  v33 = NSURLIsRegularFileKey;
  v34 = NSURLIsReadableKey;
  Class isa = sub_10000A8D8().super.isa;
  swift_bridgeObjectRelease();
  v137[0] = 0;
  id v36 = [v28 contentsOfDirectoryAtURL:v31 includingPropertiesForKeys:isa options:21 error:v137];

  id v37 = v137[0];
  if (!v36)
  {
    id v57 = v137[0];
    sub_10000A6F8();

    swift_willThrow();
    if (qword_100010310 == -1)
    {
LABEL_13:
      uint64_t v58 = sub_10000A808();
      sub_100007828(v58, (uint64_t)qword_100010318);
      swift_errorRetain();
      swift_errorRetain();
      v59 = sub_10000A7E8();
      os_log_type_t v60 = sub_10000A988();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = (uint8_t *)swift_slowAlloc();
        v137[0] = (id)swift_slowAlloc();
        *(_DWORD *)v61 = 136315138;
        swift_getErrorValue();
        uint64_t v62 = sub_10000AB28();
        v136[0] = sub_100006CD8(v62, v63, (uint64_t *)v137);
        sub_10000A9C8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "Unable to load contents of log directory: %s", v61, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v51 = v130;
      goto LABEL_47;
    }
LABEL_77:
    swift_once();
    goto LABEL_13;
  }
  uint64_t v38 = sub_10000A8E8();
  id v39 = v37;

  __chkstk_darwin(v40);
  *(&v120 - 2) = (uint8_t *)v20;
  v18 = 0;
  uint64_t v41 = (uint64_t)sub_1000055B4((void (*)(uint64_t *__return_ptr, uint64_t))sub_100007E70, (uint64_t)(&v120 - 4), v38);
  swift_bridgeObjectRelease();
  uint64_t v135 = v41;
  unint64_t v42 = *(void *)(v41 + 16);
  if (!v42)
  {
    uint64_t v44 = 0;
    v20 = v132;
    goto LABEL_19;
  }
  uint64_t v43 = 0;
  v20 = v132;
  while (*(void *)(v41 + 8 * v43 + 32))
  {
    if (v42 == ++v43)
    {
      uint64_t v44 = *(void *)(v41 + 16);
      goto LABEL_19;
    }
  }
  if (__OFADD__(v43, 1))
  {
    __break(1u);
LABEL_80:
    __break(1u);
  }
  if (v43 + 1 == v42)
  {
LABEL_18:
    uint64_t v44 = v42;
    unint64_t v42 = v43;
    v20 = v132;
    if (v44 >= v43)
    {
LABEL_19:
      sub_10000A1CC(v42, v44);
      sub_1000056FC(&v135);
      if (qword_100010310 != -1) {
        goto LABEL_74;
      }
      goto LABEL_20;
    }
    __break(1u);
    goto LABEL_77;
  }
  uint64_t v107 = v43 + 5;
  while (1)
  {
    unint64_t v15 = v107 - 4;
    if (v107 - 4 >= v42)
    {
      __break(1u);
      goto LABEL_68;
    }
    v109 = *(void **)(v41 + 8 * v107);
    if (!v109) {
      goto LABEL_53;
    }
    if (v15 != v43) {
      break;
    }
LABEL_65:
    if (__OFADD__(v43++, 1))
    {
      __break(1u);
      goto LABEL_70;
    }
    uint64_t v41 = v135;
    unint64_t v42 = *(void *)(v135 + 16);
LABEL_53:
    uint64_t v108 = v107 - 3;
    ++v107;
    if (v108 == v42) {
      goto LABEL_18;
    }
  }
  if ((v43 & 0x8000000000000000) == 0)
  {
    if (v43 >= v42) {
      goto LABEL_72;
    }
    v110 = *(void **)(v41 + 32 + 8 * v43);
    id v111 = v109;
    id v112 = v110;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v135 = v41;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v41 = sub_10000A1B8();
      uint64_t v135 = v41;
    }
    uint64_t v114 = v41 + 8 * v43;
    v115 = *(void **)(v114 + 32);
    *(void *)(v114 + 32) = v109;

    sub_10000A908();
    uint64_t v116 = v135;
    char v117 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v135 = v116;
    if ((v117 & 1) == 0)
    {
      uint64_t v116 = sub_10000A1B8();
      uint64_t v135 = v116;
    }
    if (v15 >= *(void *)(v116 + 16)) {
      goto LABEL_73;
    }
    v118 = *(void **)(v116 + 8 * v107);
    *(void *)(v116 + 8 * v107) = v110;

    sub_10000A908();
    goto LABEL_65;
  }
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  swift_once();
LABEL_20:
  uint64_t v64 = sub_10000A808();
  sub_100007828(v64, (uint64_t)qword_100010318);
  v65 = sub_10000A7E8();
  os_log_type_t v66 = sub_10000A998();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v67 = 134217984;
    swift_beginAccess();
    v137[0] = *(id *)(v135 + 16);
    sub_10000A9C8();
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Found %ld file(s)", v67, 0xCu);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v68 = v135;
  if (*(void *)(v135 + 16) >= 5uLL) {
    uint64_t v69 = 5;
  }
  else {
    uint64_t v69 = *(void *)(v135 + 16);
  }
  sub_10000AB08();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v70 = (void *)swift_dynamicCastClass();
  if (!v70)
  {
    swift_bridgeObjectRelease();
    v70 = _swiftEmptyArrayStorage;
  }
  uint64_t v71 = v70[2];
  swift_release();
  if (v71 == v69)
  {
    v72 = (void *)swift_dynamicCastClass();
    if (!v72)
    {
      swift_bridgeObjectRelease();
      v72 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v72 = sub_100007E9C(v68, v68 + 32, 0, (2 * v69) | 1);
  }
  swift_bridgeObjectRelease();
  uint64_t v73 = v72[2];
  if (v73)
  {
    v136[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_10000AA48();
    uint64_t v74 = 0;
    do
    {
      v75 = (void *)v72[v74 + 4];
      if (!v75) {
        goto LABEL_80;
      }
      ++v74;
      id v76 = v75;
      sub_10000AA28();
      sub_10000AA58();
      sub_10000AA68();
      sub_10000AA38();
    }
    while (v73 != v74);
    v77 = (void *)v136[0];
    swift_release();
  }
  else
  {
    swift_release();
    v77 = _swiftEmptyArrayStorage;
  }
  swift_beginAccess();
  sub_10000577C((unint64_t)v77);
  swift_endAccess();
  v78 = v131;
  v79 = sub_10000A7E8();
  os_log_type_t v80 = sub_10000A998();
  if (os_log_type_enabled(v79, v80))
  {
    uint64_t v51 = v130;
    v81 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v81 = 134217984;
    if (*(void *)v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v82 = (void *)sub_10000AA88();
      swift_bridgeObjectRelease();
    }
    else
    {
      v82 = *(void **)((*(void *)v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v136[0] = (uint64_t)v82;
    sub_10000A9C8();

    _os_log_impl((void *)&_mh_execute_header, v79, v80, "Using %ld attachments(s)", v81, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    v79 = v78;
    uint64_t v51 = v130;
  }

  v83 = v78;
  v84 = sub_10000A7E8();
  os_log_type_t v85 = sub_10000A978();
  if (os_log_type_enabled(v84, v85))
  {
    v86 = (uint8_t *)swift_slowAlloc();
    v136[0] = swift_slowAlloc();
    *(_DWORD *)v86 = 136315138;
    v120 = v86 + 4;
    sub_10000A384(0, &qword_100010280);
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_10000A8F8();
    unint64_t v89 = v88;
    swift_bridgeObjectRelease();
    uint64_t v134 = sub_100006CD8(v87, v89, v136);
    sub_10000A9C8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v84, v85, "%s", v86, 0xCu);
    swift_arrayDestroy();
    uint64_t v51 = v130;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
LABEL_47:
  uint64_t v52 = v125;
  uint64_t v53 = v124;
  v54 = v123;
  v55 = v122;
  v56 = v121;
LABEL_48:
  id v90 = v131;
  dispatch_group_enter(*(dispatch_group_t *)&v131[OBJC_IVAR____TtC16DockKitExtension16DockKitExtension_group]);
  uint64_t v91 = sub_10000A968();
  uint64_t v92 = (uint64_t)v127;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v127, 1, 1, v91);
  v93 = (void *)swift_allocObject();
  v93[2] = 0;
  v93[3] = 0;
  v93[4] = v90;
  id v94 = v90;
  sub_100006038(v92, (uint64_t)&unk_100010270, (uint64_t)v93);
  swift_release();
  sub_10000A828();
  void *v54 = 60;
  uint64_t v95 = v128;
  (*(void (**)(void *, void, uint64_t))(v128 + 104))(v54, enum case for DispatchTimeInterval.seconds(_:), v51);
  sub_10000A848();
  (*(void (**)(void *, uint64_t))(v95 + 8))(v54, v51);
  v96 = *(void (**)(char *, uint64_t))(v53 + 8);
  v96(v56, v52);
  sub_10000A9A8();
  v96(v55, v52);
  if (qword_100010310 != -1) {
LABEL_68:
  }
    swift_once();
  uint64_t v97 = sub_10000A808();
  sub_100007828(v97, (uint64_t)qword_100010318);
  v98 = sub_10000A7E8();
  os_log_type_t v99 = sub_10000A998();
  BOOL v100 = os_log_type_enabled(v98, v99);
  v101 = v126;
  unint64_t v102 = v129;
  if (v100)
  {
    v103 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v103 = 0;
    _os_log_impl((void *)&_mh_execute_header, v98, v99, "Done collecting diagnostics!", v103, 2u);
    swift_slowDealloc();
  }

  unint64_t v104 = swift_bridgeObjectRetain();
  uint64_t v105 = sub_1000061DC(v104);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v101, v133);
  return v105;
}

uint64_t sub_100005388@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_10000A708();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A768();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = sub_10000A738(1);
  v15[1] = v10;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.notDirectory(_:), v2);
  sub_10000A464();
  sub_10000A758();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  sub_10000A738(1);
  id v11 = objc_allocWithZone((Class)DEAttachmentItem);
  NSString v12 = sub_10000A868();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithPath:v12];

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *a1 = v13;
  return result;
}

void *sub_1000055B4(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v6)
  {
    id v13 = &_swiftEmptyArrayStorage;
    sub_10000AA48();
    uint64_t v9 = *(void *)(sub_10000A768() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_10000AA28();
      sub_10000AA58();
      sub_10000AA68();
      sub_10000AA38();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1000056FC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000A1B8();
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000081B0(v6);
  return sub_10000A908();
}

uint64_t sub_10000577C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000AA88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10000AA88();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10000AA08();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100009FA4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10000AA88();
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
  return sub_10000A908();
}

uint64_t sub_100005948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  uint64_t v6 = sub_10000A768();
  v4[10] = v6;
  v4[11] = *(void *)(v6 - 8);
  v4[12] = swift_task_alloc();
  sub_100007860(&qword_100010260);
  v4[13] = swift_task_alloc();
  uint64_t v7 = sub_10000A808();
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v4[17] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_100005AE0;
  v8[8] = a4;
  return _swift_task_switch(sub_1000034C8, 0, 0);
}

uint64_t sub_100005AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = a2;
  v3[18] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100005BE8, 0, 0);
}

void sub_100005BE8()
{
  uint64_t v40 = v0;
  if (v0[18])
  {
    id v1 = objc_allocWithZone((Class)DEAttachmentItem);
    NSString v2 = sub_10000A868();
    swift_bridgeObjectRelease();
    id v3 = [v1 initWithPath:v2];

    if (v3)
    {
      if (qword_100010310 != -1) {
        swift_once();
      }
      uint64_t v5 = v0[15];
      uint64_t v4 = v0[16];
      uint64_t v6 = v0[14];
      uint64_t v7 = sub_100007828(v6, (uint64_t)qword_100010318);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
      id v8 = v3;
      uint64_t v9 = sub_10000A7E8();
      os_log_type_t v10 = sub_10000A998();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 136315138;
        id v12 = [v8 path];
        uint64_t v13 = v0[13];
        if (v12)
        {
          uint64_t v14 = v12;
          os_log_type_t v36 = v10;
          log = v9;
          uint64_t v38 = v8;
          uint64_t v15 = v0[11];
          uint64_t v16 = v0[12];
          uint64_t v17 = v0[10];
          sub_10000A728();

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v13, v16, v17);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v17);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v17) != 1)
          {
            uint64_t v18 = v0[15];
            uint64_t v19 = v0[13];
            uint64_t v34 = v0[14];
            uint64_t v35 = v0[16];
            uint64_t v21 = v0[10];
            uint64_t v20 = v0[11];
            uint64_t v22 = sub_10000A738(1);
            unint64_t v24 = v23;
            (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
            v0[8] = sub_100006CD8(v22, v24, &v39);
            sub_10000A9C8();
            swift_bridgeObjectRelease();
            id v8 = v38;

            _os_log_impl((void *)&_mh_execute_header, log, v36, "attaching diagnostic snapshot: %s", v11, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v35, v34);
LABEL_10:
            id v28 = (void *)(v0[9] + OBJC_IVAR____TtC16DockKitExtension16DockKitExtension_attachments);
            swift_beginAccess();
            id v29 = v8;
            sub_10000A8C8();
            if (*(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_10000A918();
            }
            sub_10000A938();
            sub_10000A908();
            swift_endAccess();

            goto LABEL_13;
          }
        }
        else
        {
          v33 = v0 + 10;
          uint64_t v32 = v0[10];
          uint64_t v31 = v33[1];

          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v13, 1, 1, v32);
          __break(1u);
        }

        __break(1u);
        return;
      }
      uint64_t v25 = v0[15];
      uint64_t v26 = v0[16];
      uint64_t v27 = v0[14];

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
      goto LABEL_10;
    }
  }
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(v0[9] + OBJC_IVAR____TtC16DockKitExtension16DockKitExtension_group));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v30 = (void (*)(void))v0[1];
  v30();
}

uint64_t sub_100006038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A968();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000A958();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000A4C8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000A948();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000061DC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10000AA88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_100008020(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_10000A9F8();
        sub_10000A384(0, &qword_100010280);
        swift_dynamicCast();
        id v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100008020(0, v3[2] + 1, 1);
          id v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100008020(v6 > 1, v7 + 1, 1);
          id v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_10000A4B8(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_10000A384(0, &qword_100010280);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        id v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100008020(0, v3[2] + 1, 1);
          id v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_100008020(v10 > 1, v11 + 1, 1);
          id v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_10000A4B8(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_100006640()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DockKitExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DockKitExtension()
{
  return self;
}

uint64_t sub_1000066F4(uint64_t a1, uint64_t a2)
{
  return sub_10000696C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000670C(uint64_t a1, id *a2)
{
  uint64_t result = sub_10000A878();
  *a2 = 0;
  return result;
}

uint64_t sub_100006784(uint64_t a1, id *a2)
{
  char v3 = sub_10000A888();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100006804@<X0>(void *a1@<X8>)
{
  sub_10000A898();
  NSString v2 = sub_10000A868();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006848@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10000A868();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A898();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000068BC(uint64_t a1)
{
  uint64_t v2 = sub_10000A6B4(&qword_1000102F8);
  uint64_t v3 = sub_10000A6B4((unint64_t *)&unk_100010300);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006954(uint64_t a1, uint64_t a2)
{
  return sub_10000696C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000696C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10000A898();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000069B0()
{
  sub_10000A898();
  sub_10000A8A8();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100006A04()
{
  sub_10000A898();
  sub_10000AB38();
  sub_10000A8A8();
  Swift::Int v0 = sub_10000AB48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100006A78()
{
  uint64_t v0 = sub_10000A898();
  uint64_t v2 = v1;
  if (v0 == sub_10000A898() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10000AAF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100006B04(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100006BE0;
  return v6(a1);
}

uint64_t sub_100006BE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006CD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006DAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000078F4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000078F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000078A4((uint64_t)v12);
  return v7;
}

uint64_t sub_100006DAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A9D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006F68(a5, a6);
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
  uint64_t v8 = sub_10000AA18();
  if (!v8)
  {
    sub_10000AA78();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000AAC8();
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

uint64_t sub_100006F68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007000(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000071E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000071E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007000(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007178(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A9E8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000AA78();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A8B8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000AAC8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000AA78();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007178(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100007860(&qword_100010248);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000071E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007860(&qword_100010248);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_10000AAC8();
  __break(1u);
  return result;
}

unint64_t sub_100007330(uint64_t a1, uint64_t a2)
{
  sub_10000AB38();
  sub_10000A8A8();
  Swift::Int v4 = sub_10000AB48();
  return sub_1000079B8(a1, a2, v4);
}

uint64_t sub_1000073A8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007860(&qword_100010250);
  char v38 = a2;
  uint64_t v6 = sub_10000AAA8();
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
    uint64_t v22 = (void *)(v5 + 64);
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
          unint64_t v3 = v35;
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
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10000AB38();
    sub_10000A8A8();
    uint64_t result = sub_10000AB48();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

void sub_1000076B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007330(a2, a3);
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
    sub_100007A9C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000073A8(v15, a4 & 1);
  unint64_t v20 = sub_100007330(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10000AB18();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_100007828(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007860(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000078A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000078F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100007954(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000079B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000AAF8() & 1) == 0)
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
      while (!v14 && (sub_10000AAF8() & 1) == 0);
    }
  }
  return v6;
}

id sub_100007A9C()
{
  uint64_t v1 = v0;
  sub_100007860(&qword_100010250);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000AA98();
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

uint64_t sub_100007C50()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100007C90()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007D24;
  return sub_100005948((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100007D24()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void type metadata accessor for URLResourceKey()
{
  if (!qword_1000102D8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000102D8);
    }
  }
}

uint64_t sub_100007E70@<X0>(void *a1@<X8>)
{
  return sub_100005388(a1);
}

void *sub_100007E9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      int64_t v9 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        sub_100007860(&qword_100010298);
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100007860(&qword_1000102A0);
      int64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  id result = (void *)sub_10000AAC8();
  __break(1u);
  return result;
}

uint64_t sub_100008020(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008040(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100008040(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007860(&qword_1000102C0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
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
  uint64_t result = sub_10000AAC8();
  __break(1u);
  return result;
}

void sub_1000081B0(uint64_t *a1)
{
  uint64_t v3 = (void *)sub_10000A798();
  uint64_t v4 = *(v3 - 1);
  __chkstk_darwin(v3);
  v171 = (char *)&v144 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007860(&qword_1000102A8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v144 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  v167 = (char *)&v144 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v152 = (char *)&v144 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v158 = (char *)&v144 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v148 = (char *)&v144 - v17;
  __chkstk_darwin(v16);
  v149 = (char *)&v144 - v18;
  v147 = a1;
  Swift::Int v19 = a1[1];
  Swift::Int v20 = sub_10000AAE8(v19);
  if (v20 >= v19)
  {
    if (v19 < 0) {
      goto LABEL_154;
    }
    if (v19) {
      sub_1000090AC(0, v19, 1, v147);
    }
    return;
  }
  if (v19 >= 0) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v19 + 1;
  }
  if (v19 < -1) {
    goto LABEL_180;
  }
  Swift::Int v154 = v19;
  Swift::Int v146 = v20;
  if (v19 < 2)
  {
    int64_t v24 = (char *)_swiftEmptyArrayStorage;
    v173 = _swiftEmptyArrayStorage;
    v159 = (void **)&_swiftEmptyArrayStorage[4];
    if (v19 != 1)
    {
      unint64_t v28 = _swiftEmptyArrayStorage[2];
LABEL_118:
      if (v28 >= 2)
      {
        uint64_t v135 = *v147;
        do
        {
          unint64_t v136 = v28 - 2;
          if (v28 < 2) {
            goto LABEL_149;
          }
          if (!v135) {
            goto LABEL_173;
          }
          int64_t v1 = v28 - 1;
          v137 = v24;
          v138 = v24 + 32;
          uint64_t v139 = *(void *)&v24[16 * v136 + 32];
          uint64_t v140 = *(void *)&v24[16 * v28 + 24];
          uint64_t v141 = v161;
          sub_10000947C((void **)(v135 + 8 * v139), (void **)(v135 + 8 * *(void *)&v138[16 * v28 - 16]), (void **)(v135 + 8 * v140), v159);
          if (v141) {
            goto LABEL_130;
          }
          if (v140 < v139) {
            goto LABEL_150;
          }
          uint64_t v161 = 0;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v137 = sub_100009E58((uint64_t)v137);
          }
          if (v136 >= *((void *)v137 + 2)) {
            goto LABEL_151;
          }
          v142 = &v137[16 * v136 + 32];
          *(void *)v142 = v139;
          *((void *)v142 + 1) = v140;
          unint64_t v143 = *((void *)v137 + 2);
          if (v28 > v143) {
            goto LABEL_152;
          }
          int64_t v24 = v137;
          memmove(&v137[16 * v1 + 32], &v137[16 * v28 + 32], 16 * (v143 - v28));
          *((void *)v137 + 2) = v143 - 1;
          unint64_t v28 = v143 - 1;
        }
        while (v143 > 2);
      }
      swift_bridgeObjectRelease();
      v173[2] = 0;
      sub_10000A908();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v22 = v21 >> 1;
    sub_100007860(&qword_100010298);
    uint64_t v23 = sub_10000A928();
    *(void *)(v23 + 16) = v22;
    v159 = (void **)(v23 + 32);
    v173 = (void *)v23;
  }
  int64_t v25 = 0;
  uint64_t v26 = *v147;
  v169 = (id *)(v4 + 32);
  v170 = (id *)(v4 + 56);
  v168 = (char **)(v4 + 48);
  v163 = (void (**)(char *, id))(v4 + 8);
  uint64_t v145 = v26 + 16;
  uint64_t v144 = v26 - 8;
  int64_t v24 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v27 = v154;
  uint64_t v164 = v26;
  v156 = v3;
  while (1)
  {
    int64_t v1 = v25 + 1;
    int64_t v155 = v25;
    if (v25 + 1 < v27)
    {
      id v29 = *(void **)(v26 + 8 * v1);
      if (!v29) {
        goto LABEL_174;
      }
      uint64_t v30 = *(void **)(v26 + 8 * v25);
      id v31 = v30;
      id v32 = v29;
      id v33 = [v32 modificationDate];
      if (!v33) {
        goto LABEL_175;
      }
      uint64_t v34 = v33;
      uint64_t v35 = v171;
      sub_10000A778();

      int64_t v36 = v149;
      v166 = (void (*)(char *, char *, void *))*v169;
      v166(v149, v35, v3);
      id v172 = *v170;
      ((void (*)(char *, void, uint64_t, void *))v172)(v36, 0, 1, v3);
      v160 = *v168;
      if (((unsigned int (*)(char *, uint64_t, void *))v160)(v36, 1, v3) == 1) {
        goto LABEL_176;
      }
      if (!v30) {
        goto LABEL_177;
      }
      id v37 = [v31 modificationDate];
      if (!v37) {
        goto LABEL_178;
      }
      char v38 = v37;
      uint64_t v39 = v171;
      sub_10000A778();

      uint64_t v40 = v148;
      v166(v148, v39, v3);
      ((void (*)(char *, void, uint64_t, void *))v172)(v40, 0, 1, v3);
      if (((unsigned int (*)(char *, uint64_t, void *))v160)(v40, 1, v3) == 1) {
        goto LABEL_179;
      }
      uint64_t v41 = v149;
      uint64_t v153 = sub_10000A788();
      unint64_t v42 = *v163;
      (*v163)(v148, v3);
      v151 = v42;
      v42(v41, v3);

      Swift::Int v27 = v154;
      int64_t v25 = v155;
      int64_t v1 = v155 + 2;
      if (v155 + 2 >= v154)
      {
        uint64_t v26 = v164;
      }
      else
      {
        uint64_t v43 = (void **)(v145 + 8 * v155);
        v150 = v24;
        while (1)
        {
          Swift::Int v165 = v1;
          uint64_t v44 = *v43;
          if (!*v43) {
            goto LABEL_166;
          }
          uint64_t v45 = *(v43 - 1);
          id v46 = v45;
          id v47 = v44;
          id v48 = [v47 modificationDate];
          if (!v48) {
            goto LABEL_167;
          }
          uint64_t v49 = v48;
          unint64_t v50 = v171;
          sub_10000A778();

          uint64_t v51 = v158;
          v166(v158, v50, v3);
          ((void (*)(char *, void, uint64_t, void *))v172)(v51, 0, 1, v3);
          if (((unsigned int (*)(char *, uint64_t, void *))v160)(v51, 1, v3) == 1) {
            goto LABEL_168;
          }
          v157 = v43;
          if (!v45) {
            goto LABEL_169;
          }
          uint64_t v52 = v47;
          id v53 = [v46 modificationDate];
          if (!v53) {
            goto LABEL_170;
          }
          v54 = v53;
          v55 = v46;
          v56 = v171;
          sub_10000A778();

          id v57 = v152;
          v166(v152, v56, v3);
          ((void (*)(char *, void, uint64_t, void *))v172)(v57, 0, 1, v3);
          if (((unsigned int (*)(char *, uint64_t, void *))v160)(v57, 1, v3) == 1) {
            goto LABEL_171;
          }
          BOOL v58 = v153 == 1;
          v59 = v158;
          uint64_t v60 = sub_10000A788();
          v61 = v151;
          v151(v57, v3);
          v61(v59, v3);

          if (v58 == (v60 != 1)) {
            break;
          }
          uint64_t v43 = v157 + 1;
          uint64_t v26 = v164;
          int64_t v1 = v165 + 1;
          Swift::Int v27 = v154;
          int64_t v24 = v150;
          if (v154 == v165 + 1)
          {
            int64_t v1 = v154;
            goto LABEL_35;
          }
        }
        Swift::Int v27 = v154;
        uint64_t v26 = v164;
        int64_t v1 = v165;
        int64_t v24 = v150;
LABEL_35:
        int64_t v25 = v155;
      }
      if (v153 == 1)
      {
        if (v1 < v25) {
          goto LABEL_155;
        }
        if (v25 < v1)
        {
          int64_t v62 = v1 - 1;
          int64_t v63 = v25;
          do
          {
            if (v63 != v62)
            {
              if (!v26) {
                goto LABEL_172;
              }
              uint64_t v64 = *(void *)(v26 + 8 * v63);
              *(void *)(v26 + 8 * v63) = *(void *)(v26 + 8 * v62);
              *(void *)(v26 + 8 * v62) = v64;
            }
            BOOL v116 = ++v63 < v62--;
          }
          while (v116);
        }
      }
    }
    if (v1 < v27)
    {
      if (__OFSUB__(v1, v25)) {
        goto LABEL_153;
      }
      if (v1 - v25 < v146) {
        break;
      }
    }
LABEL_70:
    if (v1 < v25) {
      goto LABEL_148;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v24 = sub_100009CA0(0, *((void *)v24 + 2) + 1, 1, v24);
    }
    unint64_t v85 = *((void *)v24 + 2);
    unint64_t v84 = *((void *)v24 + 3);
    unint64_t v28 = v85 + 1;
    uint64_t v26 = v164;
    if (v85 >= v84 >> 1)
    {
      uint64_t v134 = sub_100009CA0((char *)(v84 > 1), v85 + 1, 1, v24);
      uint64_t v26 = v164;
      int64_t v24 = v134;
    }
    *((void *)v24 + 2) = v28;
    v86 = v24 + 32;
    uint64_t v87 = &v24[16 * v85 + 32];
    *(void *)uint64_t v87 = v155;
    *((void *)v87 + 1) = v1;
    Swift::Int v165 = v1;
    if (v85)
    {
      while (1)
      {
        unint64_t v88 = v28 - 1;
        if (v28 >= 4)
        {
          v93 = &v86[16 * v28];
          uint64_t v94 = *((void *)v93 - 8);
          uint64_t v95 = *((void *)v93 - 7);
          BOOL v99 = __OFSUB__(v95, v94);
          uint64_t v96 = v95 - v94;
          if (v99) {
            goto LABEL_137;
          }
          uint64_t v98 = *((void *)v93 - 6);
          uint64_t v97 = *((void *)v93 - 5);
          BOOL v99 = __OFSUB__(v97, v98);
          uint64_t v91 = v97 - v98;
          char v92 = v99;
          if (v99) {
            goto LABEL_138;
          }
          unint64_t v100 = v28 - 2;
          v101 = &v86[16 * v28 - 32];
          uint64_t v103 = *(void *)v101;
          uint64_t v102 = *((void *)v101 + 1);
          BOOL v99 = __OFSUB__(v102, v103);
          uint64_t v104 = v102 - v103;
          if (v99) {
            goto LABEL_140;
          }
          BOOL v99 = __OFADD__(v91, v104);
          uint64_t v105 = v91 + v104;
          if (v99) {
            goto LABEL_143;
          }
          if (v105 >= v96)
          {
            v123 = &v86[16 * v88];
            uint64_t v125 = *(void *)v123;
            uint64_t v124 = *((void *)v123 + 1);
            BOOL v99 = __OFSUB__(v124, v125);
            uint64_t v126 = v124 - v125;
            if (v99) {
              goto LABEL_147;
            }
            BOOL v116 = v91 < v126;
            goto LABEL_107;
          }
        }
        else
        {
          if (v28 != 3)
          {
            uint64_t v117 = *((void *)v24 + 4);
            uint64_t v118 = *((void *)v24 + 5);
            BOOL v99 = __OFSUB__(v118, v117);
            uint64_t v110 = v118 - v117;
            char v111 = v99;
            goto LABEL_101;
          }
          uint64_t v90 = *((void *)v24 + 4);
          uint64_t v89 = *((void *)v24 + 5);
          BOOL v99 = __OFSUB__(v89, v90);
          uint64_t v91 = v89 - v90;
          char v92 = v99;
        }
        if (v92) {
          goto LABEL_139;
        }
        unint64_t v100 = v28 - 2;
        v106 = &v86[16 * v28 - 32];
        uint64_t v108 = *(void *)v106;
        uint64_t v107 = *((void *)v106 + 1);
        BOOL v109 = __OFSUB__(v107, v108);
        uint64_t v110 = v107 - v108;
        char v111 = v109;
        if (v109) {
          goto LABEL_142;
        }
        id v112 = &v86[16 * v88];
        uint64_t v114 = *(void *)v112;
        uint64_t v113 = *((void *)v112 + 1);
        BOOL v99 = __OFSUB__(v113, v114);
        uint64_t v115 = v113 - v114;
        if (v99) {
          goto LABEL_145;
        }
        if (__OFADD__(v110, v115)) {
          goto LABEL_146;
        }
        if (v110 + v115 >= v91)
        {
          BOOL v116 = v91 < v115;
LABEL_107:
          if (v116) {
            unint64_t v88 = v100;
          }
          goto LABEL_109;
        }
LABEL_101:
        if (v111) {
          goto LABEL_141;
        }
        v119 = &v86[16 * v88];
        uint64_t v121 = *(void *)v119;
        uint64_t v120 = *((void *)v119 + 1);
        BOOL v99 = __OFSUB__(v120, v121);
        uint64_t v122 = v120 - v121;
        if (v99) {
          goto LABEL_144;
        }
        if (v122 < v110) {
          goto LABEL_14;
        }
LABEL_109:
        unint64_t v127 = v88 - 1;
        if (v88 - 1 >= v28)
        {
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
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        if (!v26) {
          goto LABEL_165;
        }
        uint64_t v128 = v24;
        unint64_t v129 = &v86[16 * v127];
        uint64_t v130 = *(void *)v129;
        uint64_t v3 = (void *)v88;
        int64_t v1 = (int64_t)&v86[16 * v88];
        uint64_t v131 = *(void *)(v1 + 8);
        uint64_t v132 = v161;
        sub_10000947C((void **)(v26 + 8 * *(void *)v129), (void **)(v26 + 8 * *(void *)v1), (void **)(v26 + 8 * v131), v159);
        if (v132)
        {
LABEL_130:
          swift_bridgeObjectRelease();
          v173[2] = 0;
          sub_10000A908();
          swift_bridgeObjectRelease();
          return;
        }
        if (v131 < v130) {
          goto LABEL_134;
        }
        if ((unint64_t)v3 > *((void *)v128 + 2)) {
          goto LABEL_135;
        }
        *(void *)unint64_t v129 = v130;
        *(void *)&v86[16 * v127 + 8] = v131;
        unint64_t v133 = *((void *)v128 + 2);
        if ((unint64_t)v3 >= v133) {
          goto LABEL_136;
        }
        int64_t v24 = v128;
        uint64_t v161 = 0;
        unint64_t v28 = v133 - 1;
        memmove((void *)v1, (const void *)(v1 + 16), 16 * (v133 - 1 - (void)v3));
        *((void *)v128 + 2) = v133 - 1;
        uint64_t v26 = v164;
        uint64_t v3 = v156;
        if (v133 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v28 = 1;
LABEL_14:
    Swift::Int v27 = v154;
    int64_t v25 = v165;
    if (v165 >= v154) {
      goto LABEL_118;
    }
  }
  if (__OFADD__(v25, v146)) {
    goto LABEL_156;
  }
  if (v25 + v146 >= v27) {
    v65 = (void **)v27;
  }
  else {
    v65 = (void **)(v25 + v146);
  }
  if ((uint64_t)v65 >= v25)
  {
    if ((void **)v1 != v65)
    {
      v150 = v24;
      os_log_type_t v66 = (char *)(v144 + 8 * v1);
      v162 = v9;
      v157 = v65;
      do
      {
        v67 = *(void **)(v26 + 8 * v1);
        v160 = v66;
        Swift::Int v165 = v1;
        while (1)
        {
          if (!v67) {
            goto LABEL_158;
          }
          id v68 = *(id *)v66;
          id v172 = *(id *)v66;
          v166 = v67;
          id v69 = [v166 modificationDate];
          if (!v69) {
            goto LABEL_162;
          }
          v70 = v69;
          uint64_t v71 = v171;
          sub_10000A778();

          v72 = (void (*)(char *, char *, int64_t))*v169;
          uint64_t v73 = v167;
          ((void (*)(char *, char *, void *))*v169)(v167, v71, v3);
          uint64_t v74 = v3;
          uint64_t v3 = *v170;
          ((void (*)(char *, void, uint64_t, void *))*v170)(v73, 0, 1, v74);
          v75 = *v168;
          int64_t v1 = (int64_t)v74;
          if (((unsigned int (*)(char *, uint64_t, void *))*v168)(v73, 1, v74) == 1) {
            goto LABEL_163;
          }
          if (!v68) {
            goto LABEL_161;
          }
          id v76 = [v172 modificationDate];
          if (!v76) {
            goto LABEL_159;
          }
          v77 = v76;
          v78 = v171;
          sub_10000A778();

          v79 = v162;
          v72(v162, v78, v1);
          uint64_t v9 = v79;
          ((void (*)(char *, void, uint64_t, int64_t))v3)(v79, 0, 1, v1);
          uint64_t v3 = (void *)v1;
          if (((unsigned int (*)(char *, uint64_t, int64_t))v75)(v79, 1, v1) == 1) {
            goto LABEL_160;
          }
          os_log_type_t v80 = v167;
          uint64_t v81 = sub_10000A788();
          v82 = *v163;
          (*v163)(v9, v3);
          v82(v80, v3);

          if (v81 != 1) {
            break;
          }
          uint64_t v26 = v164;
          int64_t v1 = v165;
          if (!v164) {
            goto LABEL_164;
          }
          id v83 = *(id *)v66;
          v67 = (void *)*((void *)v66 + 1);
          *(void *)os_log_type_t v66 = v67;
          *((void *)v66 + 1) = v83;
          v66 -= 8;
          if (v1 == ++v25) {
            goto LABEL_57;
          }
        }
        uint64_t v26 = v164;
        int64_t v1 = v165;
LABEL_57:
        ++v1;
        os_log_type_t v66 = v160 + 8;
        int64_t v25 = v155;
      }
      while ((void **)v1 != v157);
      int64_t v1 = (int64_t)v157;
      int64_t v24 = v150;
    }
    goto LABEL_70;
  }
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  ((void (*)(char *, uint64_t, uint64_t, int64_t))v3)(v162, 1, 1, v1);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  ((void (*)(char *, uint64_t, uint64_t, id))*v170)(v167, 1, 1, v3);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  ((void (*)(char *, uint64_t, uint64_t, void *))v172)(v158, 1, 1, v3);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  ((void (*)(char *, uint64_t, uint64_t, void *))v172)(v152, 1, 1, v3);
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  ((void (*)(char *, uint64_t, uint64_t, id))*v170)(v149, 1, 1, v3);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  ((void (*)(char *, uint64_t, uint64_t, void *))v172)(v148, 1, 1, v3);
LABEL_179:
  __break(1u);
LABEL_180:
  sub_10000AA78();
  __break(1u);
}

void sub_1000090AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v38 = a1;
  uint64_t v7 = (void *)sub_10000A798();
  uint64_t v8 = (void (**)(void, void))*(v7 - 1);
  ((void (*)(void))__chkstk_darwin)();
  id v48 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007860(&qword_1000102A8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v47 = (char *)&v36 - v13;
  uint64_t v37 = a2;
  if (a3 != a2)
  {
    uint64_t v14 = *a4;
    uint64_t v45 = (void (**)(void))(v8 + 4);
    id v46 = (void **)(v8 + 7);
    uint64_t v44 = (unsigned int (**)(char *, uint64_t, void *))(v8 + 6);
    uint64_t v40 = (void (**)(char *, void *))(v8 + 1);
    uint64_t v41 = v12;
    uint64_t v42 = v14;
    uint64_t v15 = v14 + 8 * a3 - 8;
LABEL_5:
    uint64_t v16 = *(void **)(v42 + 8 * a3);
    uint64_t v17 = v38;
    uint64_t v39 = v15;
    uint64_t v43 = a3;
    while (v16)
    {
      id v18 = *(id *)v15;
      id v49 = *(id *)v15;
      id v19 = v16;
      id v20 = [v19 modificationDate];
      if (!v20) {
        goto LABEL_17;
      }
      uint64_t v21 = v20;
      uint64_t v22 = v48;
      sub_10000A778();

      uint64_t v23 = *v45;
      int64_t v24 = v47;
      ((void (*)(char *, char *, void *))*v45)(v47, v22, v7);
      int64_t v25 = v7;
      uint64_t v7 = *v46;
      ((void (*)(char *, void, uint64_t, void *))*v46)(v24, 0, 1, v25);
      uint64_t v26 = (unsigned int (*)(char *, uint64_t, void (**)(void, void)))*v44;
      Swift::Int v27 = v24;
      uint64_t v8 = (void (**)(void, void))v25;
      if ((*v44)(v27, 1, v25) == 1) {
        goto LABEL_18;
      }
      if (!v18) {
        goto LABEL_19;
      }
      id v28 = [v49 modificationDate];
      if (!v28) {
        goto LABEL_20;
      }
      id v29 = v28;
      sub_10000A778();

      uint64_t v30 = v41;
      v23();
      ((void (*)(char *, void, uint64_t, void (**)(void, void)))v7)(v30, 0, 1, v8);
      uint64_t v7 = v8;
      if (v26(v30, 1, v8) == 1) {
        goto LABEL_21;
      }
      id v31 = v47;
      uint64_t v32 = sub_10000A788();
      uint64_t v8 = (void (**)(void, void))v40;
      id v33 = *v40;
      (*v40)(v30, v7);
      v33(v31, v7);

      uint64_t v34 = v43;
      if (v32 == 1)
      {
        if (!v42) {
          goto LABEL_22;
        }
        id v35 = *(id *)v15;
        uint64_t v16 = *(void **)(v15 + 8);
        *(void *)uint64_t v15 = v16;
        *(void *)(v15 + 8) = v35;
        v15 -= 8;
        if (v34 != ++v17) {
          continue;
        }
      }
      a3 = v34 + 1;
      uint64_t v15 = v39 + 8;
      if (a3 == v37) {
        return;
      }
      goto LABEL_5;
    }
    __break(1u);
LABEL_17:
    ((void (*)(char *, uint64_t, uint64_t, void *))*v46)(v47, 1, 1, v7);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    ((void (*)(char *, uint64_t, uint64_t, void (**)(void, void)))v7)(v41, 1, 1, v8);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
}

uint64_t sub_10000947C(void **a1, void **a2, void **a3, void **a4)
{
  uint64_t v89 = sub_10000A798();
  v79 = *(void ***)(v89 - 8);
  __chkstk_darwin(v89);
  unint64_t v88 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007860(&qword_1000102A8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  id v76 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v84 = (char *)&v74 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v82 = (char *)&v74 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v74 - v16;
  uint64_t v18 = (char *)a2 - (char *)a1;
  uint64_t v19 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v19 = (char *)a2 - (char *)a1;
  }
  uint64_t v20 = v19 >> 3;
  uint64_t v21 = a2;
  os_log_type_t v80 = a3;
  uint64_t v22 = (char *)a3 - (char *)a2;
  uint64_t v23 = v22 / 8;
  char v92 = a1;
  uint64_t v91 = a4;
  if (v19 >> 3 >= v22 / 8)
  {
    if (v22 >= -7)
    {
      id v47 = a2;
      if (a4 != a2 || &a2[v23] <= a4) {
        memmove(a4, a2, 8 * v23);
      }
      id v48 = &a4[v23];
      uint64_t v90 = v48;
      char v92 = a2;
      if (v22 >= 8 && a1 < a2)
      {
        v82 = (char *)(v79 + 4);
        id v83 = (void ***)(v79 + 7);
        uint64_t v81 = v79 + 6;
        v75 = (void (**)(char *, uint64_t))(v79 + 1);
        id v49 = v80 - 1;
        v86 = a4;
        uint64_t v87 = a1;
        while (1)
        {
          uint64_t v51 = v48 - 1;
          unint64_t v50 = *(v48 - 1);
          if (!v50) {
            goto LABEL_60;
          }
          v79 = v48;
          os_log_type_t v80 = v47;
          id v53 = v47 - 1;
          uint64_t v52 = *(v47 - 1);
          unint64_t v85 = v52;
          id v78 = v50;
          id v54 = [v78 modificationDate];
          if (!v54) {
            goto LABEL_61;
          }
          v55 = v54;
          v56 = v88;
          sub_10000A778();

          id v57 = *(void (**)(char *, char *, uint64_t))v82;
          BOOL v58 = v84;
          uint64_t v59 = v89;
          (*(void (**)(char *, char *, uint64_t))v82)(v84, v56, v89);
          a4 = *v83;
          ((void (*)(char *, void, uint64_t, uint64_t))*v83)(v58, 0, 1, v59);
          uint64_t v60 = (unsigned int (*)(char *, uint64_t, uint64_t))*v81;
          if (((unsigned int (*)(char *, uint64_t, uint64_t))*v81)(v58, 1, v59) == 1) {
            goto LABEL_62;
          }
          if (!v52) {
            goto LABEL_63;
          }
          id v61 = [v85 modificationDate];
          if (!v61) {
            goto LABEL_64;
          }
          int64_t v62 = v61;
          int64_t v63 = v88;
          sub_10000A778();

          uint64_t v64 = v76;
          v65 = v63;
          uint64_t v66 = v89;
          v57(v76, v65, v89);
          ((void (*)(char *, void, uint64_t, uint64_t))a4)(v64, 0, 1, v66);
          if (v60(v64, 1, v66) == 1) {
            goto LABEL_65;
          }
          v77 = v49;
          v67 = v49 + 1;
          id v68 = v64;
          id v69 = v84;
          uint64_t v70 = sub_10000A788();
          uint64_t v71 = *v75;
          (*v75)(v68, v66);
          v71(v69, v66);

          a4 = v86;
          if (v70 == 1)
          {
            id v48 = v79;
            v72 = v77;
            if (v67 != v80 || v77 >= v80) {
              void *v77 = *v53;
            }
            char v92 = v53;
          }
          else
          {
            uint64_t v90 = v51;
            id v53 = v80;
            v72 = v77;
            if (v67 < v79 || v77 >= v79 || v67 != v79) {
              void *v77 = *v51;
            }
            id v48 = v51;
          }
          if (v48 > a4)
          {
            id v49 = v72 - 1;
            id v47 = v53;
            if (v53 > v87) {
              continue;
            }
          }
          break;
        }
      }
LABEL_53:
      sub_100009D9C((void **)&v92, (const void **)&v91, &v90);
      return 1;
    }
  }
  else if (v18 >= -7)
  {
    if (a4 != a1 || &a1[v20] <= a4) {
      memmove(a4, a1, 8 * v20);
    }
    uint64_t v81 = &a4[v20];
    uint64_t v90 = v81;
    if (v18 >= 8 && a2 < v80)
    {
      unint64_t v84 = (char *)(v79 + 4);
      unint64_t v85 = v79 + 7;
      id v83 = (void ***)(v79 + 6);
      ++v79;
      while (1)
      {
        uint64_t v87 = a1;
        int64_t v24 = *a2;
        if (!*a2) {
          break;
        }
        v86 = a4;
        id v25 = *a4;
        a4 = *a4;
        id v26 = v24;
        id v27 = [v26 modificationDate];
        if (!v27) {
          goto LABEL_55;
        }
        id v28 = v27;
        id v29 = v88;
        sub_10000A778();

        uint64_t v30 = *(void (**)(char *, char *, uint64_t))v84;
        uint64_t v31 = v89;
        (*(void (**)(char *, char *, uint64_t))v84)(v17, v29, v89);
        uint64_t v21 = (void **)*v85;
        ((void (*)(char *, void, uint64_t, uint64_t))*v85)(v17, 0, 1, v31);
        uint64_t v32 = *v83;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))*v83)(v17, 1, v31) == 1) {
          goto LABEL_56;
        }
        if (!v25) {
          goto LABEL_57;
        }
        id v33 = [a4 modificationDate];
        if (!v33) {
          goto LABEL_58;
        }
        uint64_t v34 = v33;
        id v35 = v88;
        sub_10000A778();

        uint64_t v36 = v82;
        uint64_t v37 = v35;
        uint64_t v38 = v89;
        v30(v82, v37, v89);
        uint64_t v39 = v38;
        ((void (*)(char *, void, uint64_t, uint64_t))v21)(v36, 0, 1, v38);
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v32)(v36, 1, v38) == 1) {
          goto LABEL_59;
        }
        uint64_t v40 = sub_10000A788();
        uint64_t v41 = v36;
        uint64_t v42 = v40;
        uint64_t v43 = (void (*)(char *, uint64_t))*v79;
        ((void (*)(char *, uint64_t))*v79)(v41, v39);
        v43(v17, v39);

        if (v42 == 1)
        {
          uint64_t v44 = a2 + 1;
          a4 = v86;
          uint64_t v45 = v87;
          if (v87 < a2 || v87 >= v44 || v87 != a2) {
            *uint64_t v87 = *a2;
          }
        }
        else
        {
          id v46 = v86;
          uint64_t v45 = v87;
          if (v87 != v86) {
            *uint64_t v87 = *v86;
          }
          a4 = v46 + 1;
          uint64_t v91 = a4;
          uint64_t v44 = a2;
        }
        a1 = v45 + 1;
        char v92 = a1;
        if (a4 < v81)
        {
          a2 = v44;
          if (v44 < v80) {
            continue;
          }
        }
        goto LABEL_53;
      }
      __break(1u);
LABEL_55:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v85)(v17, 1, 1, v89);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v21)(v82, 1, 1, v89);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v83)(v84, 1, 1, v89);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))a4)(v76, 1, 1, v89);
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
    goto LABEL_53;
  }
LABEL_66:
  uint64_t result = sub_10000AAC8();
  __break(1u);
  return result;
}

char *sub_100009CA0(char *result, int64_t a2, char a3, char *a4)
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
    sub_100007860(&qword_1000102B0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

char *sub_100009D9C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_10000AAC8();
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

char *sub_100009E58(uint64_t a1)
{
  return sub_100009CA0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_100009E6C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100009F1C(v6, a2, a3);
  return sub_100009ED4;
}

void sub_100009ED4(void *a1)
{
  int64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100009F1C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10000A9F8();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100009F9C;
  }
  __break(1u);
  return result;
}

void sub_100009F9C(id *a1)
{
}

uint64_t sub_100009FA4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10000AA88();
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
    uint64_t v10 = sub_10000AA88();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000A3C0();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007860(&qword_100010288);
          uint64_t v12 = sub_100009E6C(v16, i, a3);
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
    sub_10000A384(0, &qword_100010280);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10000AAC8();
  __break(1u);
  return result;
}

uint64_t sub_10000A1B8()
{
  return sub_10000AA08();
}

uint64_t sub_10000A1CC(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = v4;
  if (!isUniquelyReferenced_nonNull_native || v5 - v7 > *(void *)(v4 + 24) >> 1)
  {
    swift_bridgeObjectRetain();
    *uint64_t v2 = sub_10000AA08();
    swift_bridgeObjectRelease();
    uint64_t v4 = *v2;
  }
  uint64_t v10 = v4 + 32;
  int64_t v11 = (char *)(v4 + 32 + 8 * a1);
  sub_100007860(&qword_100010298);
  swift_arrayDestroy();
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v12 = *(void *)(*v2 + 16);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  if (v14 < 0)
  {
LABEL_27:
    uint64_t result = sub_10000AAC8();
    __break(1u);
    return result;
  }
  uint64_t v15 = (char *)(v10 + 8 * a2);
  if (a1 != a2 || v11 >= &v15[8 * v14]) {
    memmove(v11, v15, 8 * v14);
  }
  uint64_t v16 = *(void *)(*v2 + 16);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (v13)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  *(void *)(*v2 + 16) = v17;
LABEL_17:
  return sub_10000A908();
}

uint64_t sub_10000A384(uint64_t a1, unint64_t *a2)
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

unint64_t sub_10000A3C0()
{
  unint64_t result = qword_100010290;
  if (!qword_100010290)
  {
    sub_10000A41C(&qword_100010288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010290);
  }
  return result;
}

uint64_t sub_10000A41C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000A464()
{
  unint64_t result = qword_1000102B8;
  if (!qword_1000102B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102B8);
  }
  return result;
}

_OWORD *sub_10000A4B8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000A4C8(uint64_t a1)
{
  uint64_t v2 = sub_100007860(&qword_100010258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A528()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A560(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007D24;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000102C8 + dword_1000102C8);
  return v6(a1, v4);
}

uint64_t sub_10000A618()
{
  return sub_10000A6B4(&qword_1000102E0);
}

uint64_t sub_10000A64C()
{
  return sub_10000A6B4(&qword_1000102E8);
}

uint64_t sub_10000A680()
{
  return sub_10000A6B4(&qword_1000102F0);
}

uint64_t sub_10000A6B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A6F8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000A708()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_10000A718(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000A728()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A738(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10000A748()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10000A758()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10000A768()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A778()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A788()
{
  return Date.compare(_:)();
}

uint64_t sub_10000A798()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A7C8()
{
  return type metadata accessor for DockCoreManager();
}

uint64_t sub_10000A7D8()
{
  return dispatch thunk of DockCoreAccessory.info.getter();
}

uint64_t sub_10000A7E8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A7F8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A808()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000A818()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_10000A828()
{
  return static DispatchTime.now()();
}

uint64_t sub_10000A838()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10000A848()
{
  return + infix(_:_:)();
}

uint64_t sub_10000A858()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10000A868()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A878()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10000A888()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10000A898()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A8A8()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A8B8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A8C8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000A8D8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A8E8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A8F8()
{
  return Array.description.getter();
}

uint64_t sub_10000A908()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A918()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000A928()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10000A938()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000A948()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A958()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000A968()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000A978()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A988()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A998()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000A9A8()
{
  return OS_dispatch_group.wait(timeout:)();
}

NSNumber sub_10000A9B8(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10000A9C8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A9D8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A9E8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A9F8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000AA08()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000AA18()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000AA28()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10000AA38()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10000AA48()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10000AA58()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10000AA68()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000AA78()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000AA88()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000AA98()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000AAA8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000AAB8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000AAC8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000AAE8(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10000AAF8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000AB08()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10000AB18()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000AB28()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000AB38()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000AB48()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}