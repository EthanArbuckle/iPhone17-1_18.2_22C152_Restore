uint64_t sub_220C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_3A20();
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_39B0();
  sub_2348(v4, qword_8168);
  sub_23AC(v4, (uint64_t)qword_8168);
  if (qword_8098 != -1) {
    swift_once();
  }
  v5 = sub_23AC(v0, (uint64_t)qword_8180);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_3990();
}

uint64_t *sub_2348(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23E4()
{
  uint64_t v0 = sub_3A20();
  sub_2348(v0, qword_8180);
  sub_23AC(v0, (uint64_t)qword_8180);
  if (qword_80A0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_8198;
  return sub_3A30();
}

uint64_t sub_2470()
{
  sub_24D8();
  uint64_t result = sub_3AA0();
  qword_8198 = result;
  return result;
}

unint64_t sub_24D8()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_80A8);
  }
  return result;
}

uint64_t sub_2518()
{
  uint64_t v0 = swift_allocObject();
  sub_2550();
  return v0;
}

uint64_t sub_2550()
{
  uint64_t v1 = sub_3A20();
  sub_374C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_3824();
  if (qword_8098 != -1) {
    swift_once();
  }
  sub_23AC(v1, (uint64_t)qword_8180);
  sub_3854();
  sub_37FC();
  v5();
  v6 = sub_3A10();
  os_log_type_t v7 = sub_3A50();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)sub_3768();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "Initializing VideoFlowDelegatePlugin", v8, 2u);
    sub_37C0((uint64_t)v8);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return v0;
}

uint64_t sub_2694(uint64_t a1)
{
  uint64_t v66 = a1;
  uint64_t v61 = sub_39C0();
  sub_374C();
  uint64_t v60 = v1;
  __chkstk_darwin(v2);
  sub_37E8();
  sub_37D8(v3);
  uint64_t v65 = sub_38A0();
  sub_374C();
  uint64_t v64 = v4;
  __chkstk_darwin(v5);
  sub_3814();
  uint64_t v8 = v7 - v6;
  uint64_t v71 = sub_3A20();
  sub_374C();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_3780();
  v58 = v12;
  sub_3808();
  __chkstk_darwin(v13);
  v15 = (char *)&v57 - v14;
  uint64_t v16 = sub_3980();
  sub_374C();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_3780();
  uint64_t v68 = v20;
  sub_3808();
  uint64_t v22 = __chkstk_darwin(v21);
  __chkstk_darwin(v22);
  v24 = (char *)&v57 - v23;
  if (qword_8090 != -1) {
    swift_once();
  }
  uint64_t v70 = v10;
  uint64_t v25 = sub_39B0();
  uint64_t v26 = sub_23AC(v25, (uint64_t)qword_8168);
  sub_3970();
  uint64_t v62 = v26;
  v27 = sub_39A0();
  os_signpost_type_t v28 = sub_3A70();
  if (sub_3A90())
  {
    v29 = (uint8_t *)sub_3768();
    *(_WORD *)v29 = 0;
    os_signpost_id_t v30 = sub_3960();
    _os_signpost_emit_with_name_impl(&dword_0, v27, v28, v30, "makeFlowFor", "", v29, 2u);
    sub_37C0((uint64_t)v29);
  }

  sub_37FC();
  v31();
  sub_39F0();
  swift_allocObject();
  sub_39E0();
  v32 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  uint64_t v69 = v16;
  uint64_t v67 = v18 + 8;
  v63 = v32;
  v32((uint64_t)v24, v16);
  if (qword_8098 != -1) {
    swift_once();
  }
  uint64_t v33 = v71;
  uint64_t v34 = sub_23AC(v71, (uint64_t)qword_8180);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 16);
  v35(v15, v34, v33);
  v36 = sub_3A10();
  os_log_type_t v37 = sub_3A50();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)sub_3768();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_0, v36, v37, "VideoFlowDelegatePlugin#makeFlowFor", v38, 2u);
    sub_37C0((uint64_t)v38);
  }

  v39 = *(void (**)(char *, uint64_t))(v70 + 8);
  v40 = v15;
  uint64_t v41 = v71;
  v39(v40, v71);
  sub_3910();
  sub_38F0();
  sub_36F8((uint64_t)v72);
  uint64_t v42 = sub_3880();
  if (v42)
  {
    uint64_t v43 = v42;
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v8, v65);
    v44 = sub_39A0();
    uint64_t v45 = v68;
    sub_39D0();
    os_signpost_type_t v46 = sub_3A60();
    if (sub_3A90())
    {
      swift_retain();
      uint64_t v47 = v59;
      sub_3A00();
      swift_release();
      uint64_t v48 = v60;
      uint64_t v49 = v61;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v60 + 88))(v47, v61) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v50 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
        v50 = "";
      }
      v51 = (uint8_t *)sub_3768();
      os_signpost_id_t v52 = sub_3868(v51);
      _os_signpost_emit_with_name_impl(&dword_0, v44, v46, v52, "makeFlowFor", v50, v51, 2u);
      sub_37C0((uint64_t)v51);
    }

    v63(v45, v69);
    swift_release();
    return v43;
  }
  else
  {
    v35(v58, v34, v41);
    v54 = sub_3A10();
    os_log_type_t v55 = sub_3A40();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)sub_3768();
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_0, v54, v55, "Unable to create a flow. Crashing.", v56, 2u);
      sub_37C0((uint64_t)v56);
    }

    v39(v58, v71);
    uint64_t result = sub_3AB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v78 = a1;
  uint64_t v79 = a2;
  uint64_t v73 = sub_39C0();
  sub_374C();
  uint64_t v72 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_3780();
  uint64_t v68 = v3;
  sub_3808();
  ((void (*)(void))__chkstk_darwin)();
  sub_37D8((uint64_t)&v65 - v4);
  uint64_t v66 = sub_3A20();
  sub_374C();
  uint64_t v75 = v5;
  ((void (*)(void))__chkstk_darwin)();
  sub_37E8();
  sub_37D8(v6);
  uint64_t v71 = sub_3940();
  sub_374C();
  uint64_t v70 = v7;
  ((void (*)(void))__chkstk_darwin)();
  sub_37E8();
  sub_37D8(v8);
  uint64_t v9 = sub_38E0();
  sub_374C();
  uint64_t v11 = v10;
  ((void (*)(void))__chkstk_darwin)();
  sub_3814();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_3980();
  sub_374C();
  uint64_t v17 = v16;
  ((void (*)(void))__chkstk_darwin)();
  sub_3780();
  v76 = v18;
  sub_3808();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v67 = (char *)&v65 - v19;
  sub_3808();
  uint64_t v20 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v65 - v21;
  if (qword_8090 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_39B0();
  uint64_t v24 = sub_23AC(v23, (uint64_t)qword_8168);
  sub_3970();
  uint64_t v77 = v24;
  uint64_t v25 = sub_39A0();
  os_signpost_type_t v26 = sub_3A70();
  char v27 = sub_3A90();
  uint64_t v80 = v15;
  if (v27)
  {
    os_signpost_type_t v28 = (uint8_t *)sub_3768();
    os_signpost_id_t v29 = sub_3868(v28);
    _os_signpost_emit_with_name_impl(&dword_0, v25, v26, v29, "makeFlowFor", "", v28, 2u);
    uint64_t v30 = (uint64_t)v28;
    uint64_t v15 = v80;
    sub_37C0(v30);
  }

  sub_37FC();
  v31();
  sub_39F0();
  swift_allocObject();
  sub_39E0();
  v32 = *(void (**)(char *, uint64_t))(v17 + 8);
  v32(v22, v15);
  sub_37FC();
  v33();
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 88))(v14, v9);
  int v35 = enum case for Parse.NLv3IntentOnly(_:);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v9);
  if (v34 == v35
    && (v36 = v69, sub_3930(), uint64_t v37 = sub_3920(), (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v36, v71), v37))
  {
    if (qword_8098 != -1) {
      swift_once();
    }
    uint64_t v38 = v66;
    sub_23AC(v66, (uint64_t)qword_8180);
    sub_37FC();
    v39();
    v40 = sub_3A10();
    os_log_type_t v41 = sub_3A50();
    BOOL v42 = os_log_type_enabled(v40, v41);
    uint64_t v43 = v67;
    if (v42)
    {
      v44 = (uint8_t *)sub_3768();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_0, v40, v41, "Got frame from controls project, using it", v44, 2u);
      sub_37C0((uint64_t)v44);
    }

    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v38);
    sub_3890();
    swift_release();
    uint64_t v45 = sub_39A0();
    sub_39D0();
    os_signpost_type_t v46 = sub_3A60();
    if (sub_3A90())
    {
      uint64_t v47 = v32;
      swift_retain();
      sub_3A00();
      swift_release();
      uint64_t v48 = sub_3794();
      if (v49(v48) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v50 = "[Error] Interval already ended";
      }
      else
      {
        uint64_t v62 = sub_383C();
        v63(v62);
        v50 = "";
      }
      uint64_t v57 = (uint8_t *)sub_3768();
      os_signpost_id_t v58 = sub_3868(v57);
      os_signpost_type_t v59 = v46;
      uint64_t v60 = v45;
      uint64_t v61 = v50;
LABEL_21:
      _os_signpost_emit_with_name_impl(&dword_0, v60, v59, v58, "makeFlowFor", v61, v57, 2u);
      sub_37C0((uint64_t)v57);
      v32 = v47;
    }
  }
  else
  {
    sub_3910();
    sub_38F0();
    sub_36F8((uint64_t)v81);
    uint64_t v45 = sub_39A0();
    uint64_t v43 = v76;
    sub_39D0();
    os_signpost_type_t v51 = sub_3A60();
    if (sub_3A90())
    {
      uint64_t v47 = v32;
      swift_retain();
      sub_3A00();
      swift_release();
      uint64_t v52 = sub_3794();
      if (v53(v52) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v54 = "[Error] Interval already ended";
      }
      else
      {
        uint64_t v55 = sub_383C();
        v56(v55);
        v54 = "";
      }
      uint64_t v57 = (uint8_t *)sub_3768();
      os_signpost_id_t v58 = sub_3868(v57);
      os_signpost_type_t v59 = v51;
      uint64_t v60 = v45;
      uint64_t v61 = v54;
      goto LABEL_21;
    }
  }

  v32(v43, v80);
  return swift_release();
}

uint64_t sub_33E8()
{
  uint64_t v1 = sub_3A20();
  sub_374C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_3824();
  uint64_t v5 = sub_3980();
  sub_374C();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_3814();
  uint64_t v11 = v10 - v9;
  sub_3A80();
  if (qword_80A0 != -1) {
    swift_once();
  }
  sub_3970();
  sub_3950();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  if (qword_8098 != -1) {
    swift_once();
  }
  sub_23AC(v1, (uint64_t)qword_8180);
  sub_3854();
  sub_37FC();
  v12();
  uint64_t v13 = sub_3A10();
  os_log_type_t v14 = sub_3A50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)sub_3768();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "Plugin received warmup signal", v15, 2u);
    sub_37C0((uint64_t)v15);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return sub_3900();
}

uint64_t sub_35F8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VideoFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_362C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2CF8(a1, a2);
}

uint64_t sub_3644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2518();
  *a1 = result;
  return result;
}

uint64_t sub_3670()
{
  return sub_33E8();
}

uint64_t sub_368C(uint64_t a1)
{
  return sub_2694(a1);
}

unint64_t sub_36AC()
{
  unint64_t result = qword_8160;
  if (!qword_8160)
  {
    type metadata accessor for VideoFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8160);
  }
  return result;
}

uint64_t sub_36F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_3768()
{
  return swift_slowAlloc();
}

uint64_t sub_3794()
{
  return v0;
}

uint64_t sub_37C0(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_37D8@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_383C()
{
  return v0;
}

uint64_t sub_3854()
{
  return v0;
}

uint64_t sub_3868(_WORD *a1)
{
  *a1 = 0;
  return sub_3960();
}

uint64_t sub_3880()
{
  return FlowSearchResult.flow.getter();
}

uint64_t sub_3890()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_38A0()
{
  return type metadata accessor for FlowSearchResult();
}

uint64_t sub_38B0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_38C0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_38D0()
{
}

uint64_t sub_38E0()
{
  return type metadata accessor for Parse();
}

uint64_t sub_38F0()
{
  return VideoFlowProvider.findFlow(for:)();
}

uint64_t sub_3900()
{
  return static VideoFlowProvider.prewarm()();
}

uint64_t sub_3910()
{
  return VideoFlowProvider.init()();
}

uint64_t sub_3920()
{
  return ControlsFlowProvider.makeFlow(for:)();
}

uint64_t sub_3930()
{
  return ControlsFlowProvider.init()();
}

uint64_t sub_3940()
{
  return type metadata accessor for ControlsFlowProvider();
}

uint64_t sub_3950()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_3960()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_3970()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_3980()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_3990()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_39A0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_39B0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_39C0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_39D0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_39E0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_39F0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_3A00()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_3A10()
{
  return Logger.logObject.getter();
}

uint64_t sub_3A20()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3A30()
{
  return Logger.init(_:)();
}

uint64_t sub_3A40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_3A50()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_3A60()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_3A70()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_3A80()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_3A90()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3AA0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_3AB0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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