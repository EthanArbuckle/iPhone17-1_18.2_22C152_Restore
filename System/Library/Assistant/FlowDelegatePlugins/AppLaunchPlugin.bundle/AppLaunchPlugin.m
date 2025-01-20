uint64_t sub_5380()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_53B8();
  return v0;
}

uint64_t sub_53B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_7620();
  sub_70FC();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_C098 != -1) {
    swift_once();
  }
  sub_67C4(v2, (uint64_t)qword_C278);
  sub_715C();
  v8();
  v9 = sub_7610();
  os_log_type_t v10 = sub_7660();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)sub_7144();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Initializing AppLaunchPlugin", v11, 2u);
    sub_7118((uint64_t)v11);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  return v1;
}

uint64_t sub_5518(uint64_t a1, unint64_t a2)
{
  uint64_t v39 = a1;
  unint64_t v40 = a2;
  uint64_t v3 = sub_7620();
  sub_70FC();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_7130();
  uint64_t v38 = v7;
  uint64_t v37 = sub_7580();
  sub_70FC();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_718C();
  uint64_t v11 = sub_75B0();
  sub_70FC();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_C0A0 != -1) {
    swift_once();
  }
  sub_67C4(v11, (uint64_t)qword_C290);
  sub_715C();
  v17();
  sub_7570();
  v18 = sub_75A0();
  os_signpost_type_t v19 = sub_7690();
  if (sub_76A0())
  {
    v20 = (uint8_t *)sub_7144();
    uint64_t v36 = v5;
    uint64_t v21 = v3;
    v22 = v20;
    *(_WORD *)v20 = 0;
    os_signpost_id_t v23 = sub_7560();
    _os_signpost_emit_with_name_impl(&dword_0, v18, v19, v23, "AppLaunchPlugin#warmup", "", v22, 2u);
    uint64_t v24 = (uint64_t)v22;
    uint64_t v3 = v21;
    uint64_t v5 = v36;
    sub_7118(v24);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v37);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  if (qword_C098 != -1) {
    swift_once();
  }
  sub_67C4(v3, (uint64_t)qword_C278);
  uint64_t v25 = v38;
  sub_715C();
  v26();
  unint64_t v27 = v40;
  swift_bridgeObjectRetain_n();
  v28 = sub_7610();
  os_log_type_t v29 = sub_7660();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = v5;
    v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v37 = v3;
    uint64_t v33 = v32;
    uint64_t v42 = v32;
    *(_DWORD *)v31 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_6850(v39, v27, &v42);
    sub_76C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v28, v29, "AppLaunchPlugin#warmup for %s", v31, 0xCu);
    swift_arrayDestroy();
    sub_7118(v33);
    sub_7118((uint64_t)v31);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v25, v37);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v3);
  }
  return sub_7540();
}

uint64_t sub_5908(uint64_t a1)
{
  uint64_t v83 = a1;
  uint64_t v76 = sub_75C0();
  sub_70FC();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_718C();
  uint64_t v85 = sub_74F0();
  sub_70FC();
  uint64_t v84 = v6;
  __chkstk_darwin(v7);
  sub_7130();
  uint64_t v82 = v8;
  uint64_t v9 = sub_7620();
  sub_70FC();
  uint64_t v87 = v10;
  __chkstk_darwin(v11);
  sub_71D4();
  v73 = (char *)v12;
  __chkstk_darwin(v13);
  v90 = (char *)&v73 - v14;
  uint64_t v91 = sub_7580();
  sub_70FC();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_7168(v18, (uint64_t)v73);
  uint64_t v20 = __chkstk_darwin(v19);
  __chkstk_darwin(v20);
  uint64_t v21 = sub_71E8();
  sub_70FC();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  sub_71D4();
  uint64_t v86 = v25;
  __chkstk_darwin(v26);
  v28 = (char *)&v73 - v27;
  if (qword_C0A0 != -1) {
    swift_once();
  }
  uint64_t v74 = v2;
  uint64_t v75 = v4;
  uint64_t v29 = sub_67C4(v21, (uint64_t)qword_C290);
  uint64_t v30 = *(void *)(v23 + 16);
  uint64_t v78 = v29;
  uint64_t v79 = v23 + 16;
  uint64_t v77 = v30;
  sub_715C();
  v31();
  sub_7570();
  uint64_t v32 = sub_75A0();
  os_signpost_type_t v33 = sub_7680();
  if (sub_76A0())
  {
    v34 = (uint8_t *)sub_7144();
    uint64_t v89 = v9;
    uint64_t v35 = v21;
    uint64_t v36 = v23;
    uint64_t v37 = v16;
    uint64_t v38 = v34;
    *(_WORD *)v34 = 0;
    os_signpost_id_t v39 = sub_7560();
    _os_signpost_emit_with_name_impl(&dword_0, v32, v33, v39, "appLaunchPluginMakeFlow", "", v38, 2u);
    uint64_t v40 = (uint64_t)v38;
    uint64_t v16 = v37;
    uint64_t v23 = v36;
    uint64_t v21 = v35;
    uint64_t v9 = v89;
    sub_7118(v40);
  }

  uint64_t v41 = v91;
  sub_715C();
  v42();
  sub_75F0();
  swift_allocObject();
  sub_75E0();
  v43 = *(void (**)(void, void))(v16 + 8);
  uint64_t v89 = v16 + 8;
  v81 = v43;
  v43(v1, v41);
  v45 = *(void (**)(void, void))(v23 + 8);
  uint64_t v44 = v23 + 8;
  v80 = v45;
  v45(v28, v21);
  if (qword_C098 != -1) {
    swift_once();
  }
  uint64_t v88 = v44;
  uint64_t v46 = sub_67C4(v9, (uint64_t)qword_C278);
  uint64_t v47 = v87;
  v48 = *(void (**)(char *, uint64_t, uint64_t))(v87 + 16);
  v48(v90, v46, v9);
  v49 = sub_7610();
  os_log_type_t v50 = sub_7660();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)sub_7144();
    *(_WORD *)v51 = 0;
    _os_log_impl(&dword_0, v49, v50, "AppLaunchPlugin#makeFlowFor", v51, 2u);
    sub_7118((uint64_t)v51);
  }

  v52 = *(void (**)(char *, uint64_t))(v47 + 8);
  v52(v90, v9);
  sub_7550();
  uint64_t v53 = v82;
  sub_7530();
  sub_67FC((uint64_t)v92);
  uint64_t v54 = sub_74E0();
  if (v54)
  {
    uint64_t v55 = v54;
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v53, v85);
    sub_715C();
    v56();
    v57 = sub_75A0();
    sub_75D0();
    os_signpost_type_t v58 = sub_7670();
    if (sub_76A0())
    {
      swift_retain();
      uint64_t v59 = v74;
      sub_7600();
      swift_release();
      uint64_t v60 = v75;
      uint64_t v61 = v76;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v75 + 88))(v59, v76) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v62 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
        v62 = "";
      }
      v63 = (uint8_t *)sub_7144();
      *(_WORD *)v63 = 0;
      os_signpost_id_t v64 = sub_7560();
      _os_signpost_emit_with_name_impl(&dword_0, v57, v58, v64, "appLaunchPluginMakeFlow", v62, v63, 2u);
      sub_7118((uint64_t)v63);
    }

    sub_71A8();
    v65();
    sub_71A8();
    v66();
    swift_release();
    return v55;
  }
  else
  {
    v48(v73, v46, v9);
    v68 = sub_7610();
    os_log_type_t v69 = sub_7650();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (_WORD *)sub_7144();
      _WORD *v70 = 0;
      sub_71B4(&dword_0, v71, v72, "Unable to create a flow. Crashing.");
      sub_7118((uint64_t)v70);
    }

    v52(v73, v9);
    uint64_t result = sub_7710();
    __break(1u);
  }
  return result;
}

uint64_t sub_60B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v60 = a2;
  uint64_t v3 = sub_75C0();
  sub_70FC();
  uint64_t v5 = v4;
  ((void (*)(void))__chkstk_darwin)();
  sub_7130();
  uint64_t v53 = v6;
  uint64_t v59 = sub_7620();
  sub_70FC();
  uint64_t v58 = v7;
  ((void (*)(void))__chkstk_darwin)();
  sub_7130();
  uint64_t v63 = v8;
  uint64_t v64 = sub_7580();
  sub_70FC();
  uint64_t v10 = v9;
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = __chkstk_darwin(v11);
  __chkstk_darwin(v12);
  uint64_t v13 = sub_71E8();
  sub_70FC();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_7168(v17, v52);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v52 - v19;
  if (qword_C0A0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_67C4(v13, (uint64_t)qword_C290);
  uint64_t v66 = v15;
  uint64_t v22 = *(void (**)(void))(v15 + 16);
  uint64_t v55 = v21;
  uint64_t v65 = v13;
  uint64_t v56 = v15 + 16;
  uint64_t v54 = v22;
  v22(v20);
  sub_7570();
  uint64_t v23 = sub_75A0();
  os_signpost_type_t v24 = sub_7680();
  if (sub_76A0())
  {
    uint64_t v25 = (uint8_t *)sub_7144();
    uint64_t v62 = v5;
    uint64_t v26 = v3;
    uint64_t v27 = v10;
    v28 = v25;
    *(_WORD *)uint64_t v25 = 0;
    os_signpost_id_t v29 = sub_7560();
    _os_signpost_emit_with_name_impl(&dword_0, v23, v24, v29, "appLaunchPluginMakeFlow", "", v28, 2u);
    uint64_t v30 = (uint64_t)v28;
    uint64_t v10 = v27;
    uint64_t v3 = v26;
    uint64_t v5 = v62;
    sub_7118(v30);
  }

  uint64_t v31 = v64;
  sub_715C();
  v32();
  sub_75F0();
  swift_allocObject();
  sub_75E0();
  os_signpost_type_t v33 = *(void (**)(void, void))(v10 + 8);
  uint64_t v62 = v10 + 8;
  v57 = v33;
  v33(v2, v31);
  v34 = *(void (**)(void))(v66 + 8);
  v66 += 8;
  sub_71A8();
  v34();
  if (qword_C098 != -1) {
    swift_once();
  }
  uint64_t v35 = v59;
  sub_67C4(v59, (uint64_t)qword_C278);
  uint64_t v36 = v58;
  sub_715C();
  v37();
  uint64_t v38 = sub_7610();
  os_log_type_t v39 = sub_7660();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (_WORD *)sub_7144();
    *uint64_t v40 = 0;
    sub_71B4(&dword_0, v41, v42, "AppLaunchPlugin#findFlowForX");
    sub_7118((uint64_t)v40);
  }

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v63, v35);
  sub_7550();
  sub_7530();
  sub_67FC((uint64_t)v67);
  sub_715C();
  v43();
  uint64_t v44 = sub_75A0();
  sub_75D0();
  os_signpost_type_t v45 = sub_7670();
  if (sub_76A0())
  {
    swift_retain();
    uint64_t v46 = v53;
    sub_7600();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v46, v3) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v47 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v46, v3);
      uint64_t v47 = "";
    }
    v48 = (uint8_t *)sub_7144();
    *(_WORD *)v48 = 0;
    os_signpost_id_t v49 = sub_7560();
    _os_signpost_emit_with_name_impl(&dword_0, v44, v45, v49, "appLaunchPluginMakeFlow", v47, v48, 2u);
    sub_7118((uint64_t)v48);
  }

  sub_71A8();
  v50();
  sub_71A8();
  v34();
  return swift_release();
}

uint64_t sub_66C4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AppLaunchPlugin()
{
  return self;
}

uint64_t sub_66F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_60B4(a1, a2);
}

uint64_t sub_6710@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_5380();
  *a1 = result;
  return result;
}

uint64_t sub_673C(uint64_t a1, unint64_t a2)
{
  return sub_5518(a1, a2);
}

uint64_t sub_6758(uint64_t a1)
{
  return sub_5908(a1);
}

unint64_t sub_6778()
{
  unint64_t result = qword_C158;
  if (!qword_C158)
  {
    type metadata accessor for AppLaunchPlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C158);
  }
  return result;
}

uint64_t sub_67C4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_67FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_6850(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_6924(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7058((uint64_t)v12, *a3);
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
      sub_7058((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7008((uint64_t)v12);
  return v7;
}

uint64_t sub_6924(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_6A7C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_76D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_6B54(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_76F0();
    if (!v8)
    {
      uint64_t result = sub_7700();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_6A7C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7720();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_6B54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_6BEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6DC8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6DC8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_6BEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_7640();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_6D60(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_76E0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_7720();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_7700();
  __break(1u);
  return result;
}

void *sub_6D60(uint64_t a1, uint64_t a2)
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
  sub_70B4(&qword_C160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_6DC8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_70B4(&qword_C160);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_6F78(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_6EA0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_6EA0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7720();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_6F78(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_7720();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_7008(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7058(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_70B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7118(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_7144()
{
  return swift_slowAlloc();
}

void sub_7168(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 320) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_718C()
{
  return 0;
}

void sub_71B4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_71E8()
{
  return sub_75B0();
}

uint64_t sub_7208()
{
  sub_7274();
  uint64_t result = sub_76B0();
  qword_C270 = result;
  return result;
}

unint64_t sub_7274()
{
  unint64_t result = qword_C168;
  if (!qword_C168)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_C168);
  }
  return result;
}

uint64_t sub_72B4()
{
  uint64_t v0 = sub_7620();
  sub_7340(v0, qword_C278);
  sub_67C4(v0, (uint64_t)qword_C278);
  if (qword_C090 != -1) {
    swift_once();
  }
  id v1 = (id)qword_C270;
  return sub_7630();
}

uint64_t *sub_7340(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_73A4()
{
  uint64_t v0 = sub_7620();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_75B0();
  sub_7340(v4, qword_C290);
  sub_67C4(v4, (uint64_t)qword_C290);
  if (qword_C098 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_67C4(v0, (uint64_t)qword_C278);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_7590();
}

uint64_t sub_74E0()
{
  return FlowSearchResult.flow.getter();
}

uint64_t sub_74F0()
{
  return type metadata accessor for FlowSearchResult();
}

uint64_t sub_7500()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_7510()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_7520()
{
}

uint64_t sub_7530()
{
  return AppLaunchFlowProvider.findFlow(for:)();
}

uint64_t sub_7540()
{
  return static AppLaunchFlowProvider.warmup(refId:)();
}

uint64_t sub_7550()
{
  return AppLaunchFlowProvider.init()();
}

uint64_t sub_7560()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_7570()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_7580()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_7590()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_75A0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_75B0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_75C0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_75D0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_75E0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_75F0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_7600()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_7610()
{
  return Logger.logObject.getter();
}

uint64_t sub_7620()
{
  return type metadata accessor for Logger();
}

uint64_t sub_7630()
{
  return Logger.init(_:)();
}

Swift::Int sub_7640()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_7650()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_7660()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_7670()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_7680()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_7690()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_76A0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_76B0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_76C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_76D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_76E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_76F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_7700()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7710()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7720()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t self
{
  return _self;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}