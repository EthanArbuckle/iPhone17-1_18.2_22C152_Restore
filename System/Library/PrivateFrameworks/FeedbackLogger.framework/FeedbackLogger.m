uint64_t sub_1BA2BA840()
{
  uint64_t result;

  result = sub_1BA2BA868(5);
  byte_1E9F41718 = result & 1;
  return result;
}

uint64_t sub_1BA2BA868(char a1)
{
  sub_1BA2BA940(a1);
  v1 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRelease();
  uint64_t v2 = MGCopyAnswer();

  if (!v2) {
    return 0;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v4;
  }
  return result;
}

char *sub_1BA2BA8F4()
{
  if (qword_1E9F41220 != -1) {
    swift_once();
  }
  return &byte_1E9F41718;
}

unint64_t sub_1BA2BA940(char a1)
{
  unint64_t result = 0x726556646C697542;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E746375646F7250;
      break;
    case 2:
      unint64_t result = 0x54746375646F7250;
      break;
    case 3:
      unint64_t result = 0x56746375646F7250;
      break;
    case 4:
      unint64_t result = 0x6F436E6F69676552;
      break;
    case 5:
      unint64_t result = 0x6C616E7265746E49;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0x48746375646F7250;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BA2BAA88()
{
  return byte_1E9F41718;
}

ValueMetadata *type metadata accessor for OSVariant()
{
  return &type metadata for OSVariant;
}

uint64_t sub_1BA2BAAB8()
{
  uint64_t v0 = sub_1BA2D9B58();
  __swift_allocate_value_buffer(v0, qword_1E9F41720);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41720);
  return sub_1BA2D9B48();
}

id sub_1BA2BAB3C()
{
  sub_1BA2D9CA8();
  MEMORY[0x1F4188790]();
  uint64_t v1 = sub_1BA2D9CB8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  unsigned __int8 v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2D9B98();
  MEMORY[0x1F4188790]();
  sub_1BA2BE464(0, &qword_1EB9DC590);
  v5 = v0;
  sub_1BA2D9B78();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCC68], v1);
  uint64_t v9 = MEMORY[0x1E4FBC860];
  sub_1BA2BE4A0(&qword_1EB9DC588, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9DC578);
  sub_1BA2BE4E8(&qword_1EB9DC580, &qword_1EB9DC578);
  sub_1BA2D9D38();
  *(void *)&v5[OBJC_IVAR___FLAutoBugCapture_queue] = sub_1BA2D9CD8();
  *(void *)&v5[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)FLAutoBugCapture;
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_1BA2BADEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA8AF0]), sel_init);
  sub_1BA2BDCC0(a1, a2, a3, a4, a5, a6, a7, a8, v17, v8);
}

void sub_1BA2BAFBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = a1 + 16;
  swift_beginAccess();
  uint64_t v19 = MEMORY[0x1BA9E8E60](v18);
  if (v19)
  {
    v20 = (void *)v19;
    sub_1BA2BB070(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

void sub_1BA2BB070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  v11 = v10;
  uint64_t v88 = a7;
  uint64_t v89 = a5;
  uint64_t v90 = a4;
  uint64_t v91 = a2;
  uint64_t v92 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v15 = sub_1BA2D9928();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2D9918();
  sub_1BA2D98F8();
  double v20 = v19;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v21 = OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger;
  if (*(double *)&v11[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] >= v20)
  {
    if (qword_1E9F41228 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1BA2D9B58();
    __swift_project_value_buffer(v30, (uint64_t)qword_1E9F41720);
    v31 = v11;
    v32 = sub_1BA2D9B38();
    os_log_type_t v33 = sub_1BA2D9C98();
    if (!os_log_type_enabled(v32, v33))
    {

      return;
    }
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 134218240;
    double v93 = v20;
    sub_1BA2D9D08();
    *(_WORD *)(v34 + 12) = 2048;
    double v93 = *(double *)&v11[v21];
    sub_1BA2D9D08();

    _os_log_impl(&dword_1BA2B8000, v32, v33, "SymptomDiagnosticReporter throttled since currentTime (%f) <= nextTime (%f)", (uint8_t *)v34, 0x16u);
    MEMORY[0x1BA9E8E10](v34, -1, -1);
    goto LABEL_23;
  }
  uint64_t v83 = a6;
  uint64_t v84 = ObjectType;
  *(double *)&v11[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] = v20 + 120.0;
  if (qword_1E9F41228 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_1BA2D9B58();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1E9F41720);
  v24 = v11;
  *(void *)&long long v87 = v23;
  v25 = sub_1BA2D9B38();
  os_log_type_t v26 = sub_1BA2D9C98();
  BOOL v27 = os_log_type_enabled(v25, v26);
  v85 = v24;
  unint64_t v86 = a8;
  if (v27)
  {
    v28 = v24;
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    double v93 = *(double *)&v11[v21];
    sub_1BA2D9D08();

    _os_log_impl(&dword_1BA2B8000, v25, v26, "SymptomDiagnosticReporter updated nextTimeToTrigger with cooldown %f", v29, 0xCu);
    MEMORY[0x1BA9E8E10](v29, -1, -1);
  }
  else
  {

    v25 = v24;
  }
  uint64_t v35 = v91;

  if (sub_1BA2D9C48() < 1)
  {
    uint64_t v36 = 0;
    unint64_t v37 = 0xE000000000000000;
  }
  else
  {
    double v93 = 1.67792004e243;
    unint64_t v94 = 0xEA0000000000203ALL;
    sub_1BA2D9C58();
    uint64_t v36 = *(void *)&v93;
    unint64_t v37 = v94;
  }
  id v38 = objc_msgSend(self, sel_processInfo);
  id v39 = objc_msgSend(v38, sel_processName);

  uint64_t v40 = sub_1BA2D9C18();
  uint64_t v42 = v41;

  uint64_t v43 = swift_getObjectType();
  v44 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(a10 + 8))(0x7372615065726F43, 0xEA00000000006365, 0x6B63616264656546, 0xEE00726567676F4CLL, v92, v35, v36, v37, v40, v42, 0, 0, v43, a10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v44
    || (v93 = 0.0, id v45 = v44, sub_1BA2D9BB8(), v45, v46 = *(void *)&v93, v93 == 0.0))
  {
    id v59 = v44;
    v32 = sub_1BA2D9B38();
    os_log_type_t v60 = sub_1BA2D9C98();
    if (!os_log_type_enabled(v32, v60))
    {

      return;
    }
    v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    double v93 = *(double *)&v62;
    *(_DWORD *)v61 = 136315138;
    uint64_t v95 = (uint64_t)v44;
    id v63 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F412E8);
    uint64_t v64 = sub_1BA2D9C28();
    uint64_t v95 = sub_1BA2BD404(v64, v65, (uint64_t *)&v93);
    sub_1BA2D9D08();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BA2B8000, v32, v60, "SymptomDiagnosticReporter couldn't parse signature: %s", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9E8E10](v62, -1, -1);
    MEMORY[0x1BA9E8E10](v61, -1, -1);

LABEL_23:
    return;
  }
  uint64_t v91 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F412F0);
  uint64_t inited = swift_initStackObject();
  long long v87 = xmmword_1BA2DE200;
  *(_OWORD *)(inited + 16) = xmmword_1BA2DE200;
  double v93 = COERCE_DOUBLE(sub_1BA2D9C18());
  unint64_t v94 = v48;
  uint64_t v49 = MEMORY[0x1E4FBB1A0];
  sub_1BA2D9D68();
  *(void *)(inited + 96) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 72) = 0;
  uint64_t v90 = sub_1BA2D9BD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F412F8);
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = v87;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41300);
  uint64_t v82 = v43;
  if (v86 >> 60 == 15)
  {
    uint64_t v51 = swift_initStackObject();
    *(_OWORD *)(v51 + 16) = xmmword_1BA2DE220;
    uint64_t v52 = sub_1BA2D9C18();
    uint64_t v53 = MEMORY[0x1E4FBB3D0];
    *(void *)(v51 + 32) = v52;
    *(void *)(v51 + 40) = v54;
    *(void *)(v51 + 72) = v53;
    *(double *)(v51 + 48) = v20;
    *(void *)(v51 + 80) = sub_1BA2D9C18();
    *(void *)(v51 + 88) = v55;
    *(void *)(v51 + 120) = v49;
    uint64_t v56 = v84;
    uint64_t v57 = v83;
    uint64_t v58 = v89;
    if (!v83)
    {
      swift_bridgeObjectRetain();
      uint64_t v58 = v92;
      uint64_t v57 = v35;
    }
    *(void *)(v51 + 96) = v58;
    *(void *)(v51 + 104) = v57;
  }
  else
  {
    uint64_t v66 = swift_initStackObject();
    *(_OWORD *)(v66 + 16) = xmmword_1BA2DE210;
    uint64_t v67 = sub_1BA2D9C18();
    uint64_t v68 = MEMORY[0x1E4FBB3D0];
    *(void *)(v66 + 32) = v67;
    *(void *)(v66 + 40) = v69;
    *(void *)(v66 + 72) = v68;
    *(double *)(v66 + 48) = v20;
    *(void *)(v66 + 80) = sub_1BA2D9C18();
    *(void *)(v66 + 88) = v70;
    *(void *)(v66 + 120) = v49;
    uint64_t v56 = v84;
    uint64_t v71 = v83;
    uint64_t v72 = v89;
    if (!v83)
    {
      swift_bridgeObjectRetain();
      uint64_t v72 = v92;
      uint64_t v71 = v35;
    }
    *(void *)(v66 + 96) = v72;
    *(void *)(v66 + 104) = v71;
    *(void *)(v66 + 128) = sub_1BA2D9C18();
    *(void *)(v66 + 136) = v73;
    *(void *)(v66 + 168) = MEMORY[0x1E4F277C0];
    uint64_t v74 = v88;
    unint64_t v75 = v86;
    *(void *)(v66 + 144) = v88;
    *(void *)(v66 + 152) = v75;
    sub_1BA2BD278(v74, v75);
  }
  swift_bridgeObjectRetain();
  *(void *)(v50 + 32) = sub_1BA2D9BD8();
  uint64_t v76 = sub_1BA2BB9B8(v50);
  swift_bridgeObjectRelease();
  uint64_t v77 = swift_allocObject();
  v78 = v85;
  *(void *)(v77 + 16) = v85;
  *(void *)(v77 + 24) = v56;
  v79 = *(void (**)(uint64_t, uint64_t, void, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, double))(a10 + 16);
  v80 = v78;
  v79(v46, v76, 0, v90, sub_1BA2BE238, v77, v82, a10, 0.0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

uint64_t sub_1BA2BB974(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1BA2BB9B8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1BA2BDBBC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41328);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BA2BDBBC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1BA2BDBBC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_1BA2BE39C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1BA2BBAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BA2D9B68();
  os_log_t v52 = *(os_log_t *)(v6 - 8);
  MEMORY[0x1F4188790]();
  long long v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1BA2D9B98();
  uint64_t v9 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790]();
  v11 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BA2D9928();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (qword_1E9F41228 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1BA2D9B58();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E9F41720);
    os_log_t v52 = (os_log_t)sub_1BA2D9B38();
    os_log_type_t v19 = sub_1BA2D9C98();
    if (os_log_type_enabled(v52, v19))
    {
      double v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v20 = 0;
      _os_log_impl(&dword_1BA2B8000, v52, v19, "SymptomDiagnosticReporter reporter returned no response", v20, 2u);
      MEMORY[0x1BA9E8E10](v20, -1, -1);
    }
    os_log_t v21 = v52;

    return;
  }
  *(void *)&long long v56 = sub_1BA2D9C18();
  *((void *)&v56 + 1) = v16;
  sub_1BA2D9D68();
  sub_1BA2BC61C((uint64_t)aBlock, a1, &v56);
  sub_1BA2BE240((uint64_t)aBlock);
  uint64_t v50 = a1;
  if (v57)
  {
    if (swift_dynamicCast())
    {
      int v17 = v53;
      goto LABEL_14;
    }
  }
  else
  {
    sub_1BA2BE294((uint64_t)&v56);
  }
  int v17 = 0;
LABEL_14:
  sub_1BA2D9918();
  sub_1BA2D98F8();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v49[1] = *(void *)(a2 + OBJC_IVAR___FLAutoBugCapture_queue);
  uint64_t v24 = swift_allocObject();
  v49[0] = a2;
  swift_unknownObjectWeakInit();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  *(unsigned char *)(v25 + 24) = v17;
  *(void *)(v25 + 32) = v23;
  *(void *)(v25 + 40) = a3;
  aBlock[4] = (uint64_t)sub_1BA2BE32C;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BA2BB974;
  aBlock[3] = (uint64_t)&block_descriptor_17;
  os_log_type_t v26 = _Block_copy(aBlock);
  swift_retain();
  sub_1BA2D9B88();
  *(void *)&long long v56 = MEMORY[0x1E4FBC860];
  sub_1BA2BE4A0(&qword_1E9F412D0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F412D8);
  sub_1BA2BE4E8(&qword_1E9F412E0, &qword_1E9F412D8);
  sub_1BA2D9D38();
  MEMORY[0x1BA9E83A0](0, v11, v8, v26);
  _Block_release(v26);
  ((void (*)(char *, uint64_t))v52[1].isa)(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v51);
  swift_release();
  swift_release();
  if (v17)
  {
    id v53 = (id)sub_1BA2D9C18();
    unint64_t v54 = v27;
    sub_1BA2D9D68();
    sub_1BA2BC61C((uint64_t)aBlock, v50, &v56);
    sub_1BA2BE240((uint64_t)aBlock);
    if (v57)
    {
      sub_1BA2BE464(0, &qword_1E9F41318);
      if (swift_dynamicCast())
      {
        id v28 = v53;
LABEL_23:
        if (qword_1E9F41228 != -1) {
          swift_once();
        }
        uint64_t v33 = sub_1BA2D9B58();
        __swift_project_value_buffer(v33, (uint64_t)qword_1E9F41720);
        id v34 = v28;
        uint64_t v35 = sub_1BA2D9B38();
        os_log_type_t v36 = sub_1BA2D9C98();
        if (!os_log_type_enabled(v35, v36))
        {

          return;
        }
        unint64_t v37 = (uint8_t *)swift_slowAlloc();
        id v38 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v37 = 138412290;
        aBlock[0] = (uint64_t)v34;
        id v39 = v34;
        sub_1BA2D9D08();
        *id v38 = v34;

        _os_log_impl(&dword_1BA2B8000, v35, v36, "SymptomDiagnosticReporter snapshot accepted with sessionID %@", v37, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41320);
        swift_arrayDestroy();
        MEMORY[0x1BA9E8E10](v38, -1, -1);
        MEMORY[0x1BA9E8E10](v37, -1, -1);

        goto LABEL_45;
      }
    }
    else
    {
      sub_1BA2BE294((uint64_t)&v56);
    }
    sub_1BA2BE464(0, &qword_1E9F41318);
    id v28 = (id)sub_1BA2D9CE8();
    goto LABEL_23;
  }
  id v53 = (id)sub_1BA2D9C18();
  unint64_t v54 = v29;
  sub_1BA2D9D68();
  uint64_t v30 = v50;
  sub_1BA2BC61C((uint64_t)aBlock, v50, &v56);
  sub_1BA2BE240((uint64_t)aBlock);
  if (v57)
  {
    sub_1BA2BE464(0, &qword_1E9F41310);
    if (swift_dynamicCast())
    {
      id v31 = v53;
      id v32 = objc_msgSend(v53, sel_integerValue);

      goto LABEL_30;
    }
  }
  else
  {
    sub_1BA2BE294((uint64_t)&v56);
  }
  id v32 = 0;
LABEL_30:
  id v53 = (id)sub_1BA2D9C18();
  unint64_t v54 = v40;
  sub_1BA2D9D68();
  sub_1BA2BC61C((uint64_t)aBlock, v30, &v56);
  sub_1BA2BE240((uint64_t)aBlock);
  if (!v57)
  {
    sub_1BA2BE294((uint64_t)&v56);
    goto LABEL_34;
  }
  if (!swift_dynamicCast())
  {
LABEL_34:
    uint64_t v42 = 0;
    unint64_t v41 = 0xE000000000000000;
    goto LABEL_35;
  }
  uint64_t v42 = (uint64_t)v53;
  unint64_t v41 = v54;
LABEL_35:
  if (sub_1BA2BC818((uint64_t)v32))
  {
    if (qword_1E9F41228 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1BA2D9B58();
    __swift_project_value_buffer(v43, (uint64_t)qword_1E9F41720);
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1BA2D9B38();
    os_log_type_t v44 = sub_1BA2D9C98();
    if (os_log_type_enabled(v35, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)uint64_t v45 = 134218242;
      *(void *)&long long v56 = v32;
      sub_1BA2D9D08();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v56 = sub_1BA2BD404(v42, v41, aBlock);
      sub_1BA2D9D08();
      swift_bridgeObjectRelease_n();
      v47 = "SymptomDiagnosticReporter snapshot rejected with unexpected reason %ld %s";
LABEL_44:
      _os_log_impl(&dword_1BA2B8000, v35, v44, v47, (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BA9E8E10](v46, -1, -1);
      MEMORY[0x1BA9E8E10](v45, -1, -1);
LABEL_45:

      return;
    }
  }
  else
  {
    if (qword_1E9F41228 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_1BA2D9B58();
    __swift_project_value_buffer(v48, (uint64_t)qword_1E9F41720);
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1BA2D9B38();
    os_log_type_t v44 = sub_1BA2D9C98();
    if (os_log_type_enabled(v35, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)uint64_t v45 = 134218242;
      *(void *)&long long v56 = v32;
      sub_1BA2D9D08();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v56 = sub_1BA2BD404(v42, v41, aBlock);
      sub_1BA2D9D08();
      swift_bridgeObjectRelease_n();
      v47 = "SymptomDiagnosticReporter snapshot rejected with expected reason %ld %s";
      goto LABEL_44;
    }
  }

  swift_bridgeObjectRelease_n();
}

double sub_1BA2BC61C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_1BA2C7F38(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1BA2BE340(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_1BA2BC680(uint64_t a1, char a2, double a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1BA9E8E60](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    double v8 = 3600.0;
    if (a2) {
      double v8 = 86400.0;
    }
    *(double *)(v6 + OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger) = v8 + a3;
    if (qword_1E9F41228 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1BA2D9B58();
    __swift_project_value_buffer(v9, (uint64_t)qword_1E9F41720);
    uint64_t v10 = v7;
    v11 = sub_1BA2D9B38();
    os_log_type_t v12 = sub_1BA2D9C98();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      sub_1BA2D9D08();

      _os_log_impl(&dword_1BA2B8000, v11, v12, "SymptomDiagnosticReporter updated nextTimeToTrigger %f", v13, 0xCu);
      MEMORY[0x1BA9E8E10](v13, -1, -1);
    }
    else
    {

      v11 = v10;
    }
  }
}

uint64_t sub_1BA2BC818(uint64_t result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  return *MEMORY[0x1E4FA8B68] != result
      && *MEMORY[0x1E4FA8B70] != result
      && *MEMORY[0x1E4FA8B60] != result
      && *MEMORY[0x1E4FA8B88] != result
      && *MEMORY[0x1E4FA8B90] != result;
}

id sub_1BA2BC8A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  return sub_1BA2BC8B4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

id sub_1BA2BC8B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v15 = a4;
  if (a2)
  {
    uint64_t v16 = (void *)sub_1BA2D9C08();
    if (!v15) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v16 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v15 = (void *)sub_1BA2D9C08();
LABEL_4:
  if (a6) {
    a6 = (void *)sub_1BA2D9C08();
  }
  if (a8) {
    a8 = (void *)sub_1BA2D9C08();
  }
  int v17 = a12;
  if (!a10)
  {
    uint64_t v18 = 0;
    if (!a12) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v18 = (void *)sub_1BA2D9C08();
  if (a12) {
LABEL_10:
  }
    int v17 = (void *)sub_1BA2D9C08();
LABEL_11:
  id v19 = objc_msgSend(v12, sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_, v16, v15, a6, a8, v18, v17);

  return v19;
}

id sub_1BA2BC9E4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, double a7)
{
  os_log_type_t v12 = a2;
  if (a1)
  {
    uint64_t v14 = (void *)sub_1BA2D9BA8();
    if (!v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  if (a2) {
LABEL_3:
  }
    os_log_type_t v12 = (void *)sub_1BA2D9C88();
LABEL_4:
  if (a3) {
    a3 = (void *)sub_1BA2D9BA8();
  }
  if (a4) {
    a4 = (void *)sub_1BA2D9BA8();
  }
  if (a5)
  {
    v17[4] = a5;
    v17[5] = a6;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 1107296256;
    v17[2] = sub_1BA2BCB84;
    v17[3] = &block_descriptor_20;
    a5 = _Block_copy(v17);
    swift_retain();
    swift_release();
  }
  id v15 = objc_msgSend(v7, sel_snapshotWithSignature_delay_events_payload_actions_reply_, v14, v12, a3, a4, a5, a7);
  _Block_release(a5);

  return v15;
}

uint64_t sub_1BA2BCB84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_1BA2D9BC8();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_1BA2BCC14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  double v8 = &v5[OBJC_IVAR___FLAutoBugHelper_eventValue];
  *(_OWORD *)double v8 = xmmword_1BA2DE230;
  *(void *)&v5[OBJC_IVAR___FLAutoBugHelper_autoBugCapture] = a1;
  uint64_t v9 = &v5[OBJC_IVAR___FLAutoBugHelper_bundleID];
  *(void *)uint64_t v9 = a2;
  *((void *)v9 + 1) = a3;
  uint64_t v10 = *(void *)v8;
  unint64_t v11 = *((void *)v8 + 1);
  *(void *)double v8 = a4;
  *((void *)v8 + 1) = a5;
  id v12 = a1;
  sub_1BA2BD278(a4, a5);
  sub_1BA2BD20C(v10, v11);
  v15.receiver = v5;
  v15.super_class = (Class)FLAutoBugHelper;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  sub_1BA2BD20C(a4, a5);

  return v13;
}

void sub_1BA2BCD78(unint64_t a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR___FLAutoBugHelper_autoBugCapture);
  uint64_t v4 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_1BA2D9C08();
  OUTLINED_FUNCTION_1();
  if (!v16 & v15)
  {
    OUTLINED_FUNCTION_0(v7, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v8, v9, v10, v11, v12, v13, v25, 0);
  }
  else
  {
    uint64_t v17 = *v14;
    sub_1BA2BD1B4(*v14, a1);
    id v26 = (id)sub_1BA2D98C8();
    int v18 = sub_1BA2BD20C(v17, a1);
    OUTLINED_FUNCTION_0(v18, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
  }
}

void sub_1BA2BCEFC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5 = *(id *)(v3 + OBJC_IVAR___FLAutoBugHelper_autoBugCapture);
  uint64_t v6 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRetain();
  int v7 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRelease();
  int v8 = (void *)sub_1BA2D9C08();
  OUTLINED_FUNCTION_1();
  if (!v18 & v17)
  {
    OUTLINED_FUNCTION_0(v9, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v10, v11, v12, v13, v14, v15, v27, 0);
  }
  else
  {
    uint64_t v19 = *v16;
    sub_1BA2BD1B4(*v16, a3);
    id v28 = (id)sub_1BA2D98C8();
    int v20 = sub_1BA2BD20C(v19, a3);
    OUTLINED_FUNCTION_0(v20, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v28);
  }
}

void __swiftcall FLAutoBugHelper.init()(FLAutoBugHelper *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void FLAutoBugHelper.init()()
{
}

uint64_t type metadata accessor for FLAutoBugCapture(uint64_t a1)
{
  return sub_1BA2BE464(a1, &qword_1E9F412A8);
}

uint64_t type metadata accessor for FLAutoBugHelper(uint64_t a1)
{
  return sub_1BA2BE464(a1, &qword_1E9F412C8);
}

uint64_t sub_1BA2BD1B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1BA2BD20C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1BA2BD220(a1, a2);
  }
  return a1;
}

uint64_t sub_1BA2BD220(uint64_t a1, unint64_t a2)
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

uint64_t sub_1BA2BD278(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1BA2BD1B4(a1, a2);
  }
  return a1;
}

char *sub_1BA2BD28C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1BA2D9DA8();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_1BA2BD320(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 32 * a2 > a1) ? (v6 = a1 + 32 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_1BA2D9DA8();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x1F4186418](v7, v5);
}

uint64_t sub_1BA2BD404(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BA2BD4D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BA2BE340((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BA2BE340((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BA2BD4D8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1BA2BD630((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1BA2D9D18();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1BA2BD708(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1BA2D9D88();
    if (!v8)
    {
      uint64_t result = sub_1BA2D9D98();
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

void *sub_1BA2BD630(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1BA2D9DA8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1BA2BD708(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BA2BD7A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1BA2BD97C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1BA2BD97C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BA2BD7A0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1BA2D9C68();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1BA2BD914(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1BA2D9D78();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1BA2D9DA8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1BA2D9D98();
  __break(1u);
  return result;
}

void *sub_1BA2BD914(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41338);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1BA2BD97C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41338);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int v12 = v10 + 32;
  int v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1BA2BDB2C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BA2BDA54(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1BA2BDA54(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1BA2D9DA8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1BA2BDB2C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1BA2D9DA8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_1BA2BDBBC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BA2BDBDC(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1BA2BDBDC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41330);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int v12 = v10 + 32;
  int v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1BA2BD28C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BA2BD320((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

id sub_1BA2BDCC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v38 = a6;
  uint64_t v39 = a3;
  uint64_t v40 = a5;
  uint64_t v41 = a2;
  uint64_t v42 = a4;
  uint64_t v13 = sub_1BA2D9B68();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790]();
  char v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1BA2D9B98();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790]();
  int v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(self, sel_isInternalBuild);
  if (result)
  {
    uint64_t v36 = v14;
    uint64_t v37 = v17;
    uint64_t v22 = *(void *)(a10 + OBJC_IVAR___FLAutoBugCapture_queue);
    id v33 = a9;
    uint64_t v34 = v22;
    uint64_t v23 = swift_allocObject();
    uint64_t v35 = v18;
    uint64_t v24 = v23;
    swift_unknownObjectWeakInit();
    int v25 = (void *)swift_allocObject();
    v25[2] = v24;
    v25[3] = a1;
    uint64_t v27 = v38;
    uint64_t v26 = v39;
    uint64_t v28 = v42;
    v25[4] = v41;
    v25[5] = v26;
    uint64_t v29 = v40;
    v25[6] = v28;
    v25[7] = v29;
    v25[8] = v27;
    v25[9] = a7;
    v25[10] = a8;
    v25[11] = a9;
    v25[12] = &off_1F13B93C0;
    aBlock[4] = sub_1BA2BE0E4;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BA2BB974;
    aBlock[3] = &block_descriptor;
    uint64_t v30 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA2BD278(a7, a8);
    id v31 = v33;
    sub_1BA2D9B88();
    uint64_t v43 = MEMORY[0x1E4FBC860];
    sub_1BA2BE4A0(&qword_1E9F412D0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F412D8);
    sub_1BA2BE4E8(&qword_1E9F412E0, &qword_1E9F412D8);
    sub_1BA2D9D38();
    MEMORY[0x1BA9E83A0](0, v20, v16, v30);
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v13);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v37);
    swift_release();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_1BA2BE03C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BA2BE074()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 80);
  if (v1 >> 60 != 15) {
    sub_1BA2BD220(*(void *)(v0 + 72), v1);
  }

  return MEMORY[0x1F4186498](v0, 104, 7);
}

void sub_1BA2BE0E4()
{
  sub_1BA2BAFBC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96));
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1BA2BE200()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BA2BE238(uint64_t a1)
{
  sub_1BA2BBAE8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1BA2BE240(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BA2BE294(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BA2BE2F4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BA2BE32C()
{
  sub_1BA2BC680(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1BA2BE340(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1BA2BE39C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
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

uint64_t sub_1BA2BE464(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BA2BE4A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BA2BE4E8(unint64_t *a1, uint64_t *a2)
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

id OUTLINED_FUNCTION_0(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(v10, a2, v13, v11, v12, a10);
}

id sub_1BA2BE580(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  uint64_t v43 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  OUTLINED_FUNCTION_0_0();
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v9 = (uint64_t *)((char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v46 = sub_1BA2D9928();
  uint64_t v10 = *(void *)(v46 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v42 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v40 - v16;
  uint64_t v18 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v40 - v21;
  *(_OWORD *)((char *)&v40 - v21 + 32) = xmmword_1BA2DE290;
  sub_1BA2D9958();
  *((void *)v22 + 6) = a1;
  *((void *)v22 + 7) = a2;
  unint64_t v23 = a2;
  uint64_t v24 = v45;
  *((void *)v22 + 2) = v44;
  *((void *)v22 + 3) = v24;
  *(void *)uint64_t v22 = 2;
  v22[8] = 1;
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0xE000000000000000;
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((_OWORD *)v17 + 2) = xmmword_1BA2DE2A0;
  *((void *)v17 + 6) = 0xE000000000000000;
  *((void *)v17 + 7) = 0;
  *((void *)v17 + 8) = 0xE000000000000000;
  *((void *)v17 + 9) = 0;
  *((void *)v17 + 10) = 0xE000000000000000;
  sub_1BA2BD1B4(a1, v23);
  swift_bridgeObjectRetain();
  uint64_t v25 = MEMORY[0x1E4FBC860];
  *((void *)v17 + 11) = sub_1BA2D9BD8();
  sub_1BA2D9958();
  sub_1BA2D9908();
  sub_1BA2D98F8();
  double v27 = v26;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v46);
  double v29 = v27 * 1000.0;
  if ((~COERCE__INT64(v27 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v29 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v29 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *((void *)v17 + 2) = (uint64_t)v29;
  *uint64_t v9 = v25;
  uint64_t v30 = v43;
  sub_1BA2D9958();
  uint64_t v31 = (uint64_t)v9 + *(int *)(v30 + 24);
  __swift_storeEnumTagSinglePayload(v31, 1, 1, v18);
  uint64_t v32 = (uint64_t)v9 + *(int *)(v30 + 28);
  __swift_storeEnumTagSinglePayload(v32, 1, 1, v13);
  sub_1BA2BEE84();
  sub_1BA2BEED8(v31, &qword_1E9F41348);
  sub_1BA2BEF2C();
  __swift_storeEnumTagSinglePayload(v31, 0, 1, v18);
  sub_1BA2BEE84();
  sub_1BA2BEED8(v32, &qword_1E9F41350);
  sub_1BA2BEF2C();
  __swift_storeEnumTagSinglePayload(v32, 0, 1, v13);
  sub_1BA2BEF80();
  uint64_t v33 = sub_1BA2D9A58();
  unint64_t v35 = v34;
  uint64_t v50 = v40;
  uint64_t v51 = v41;
  uint64_t v48 = 0x6C7070612E6D6F63;
  unint64_t v49 = 0xEA00000000002E65;
  strcpy(v47, "com.apple.dpg.");
  v47[15] = -18;
  sub_1BA2BF05C();
  uint64_t v36 = sub_1BA2D9D28();
  uint64_t v38 = v37;
  objc_allocWithZone((Class)FLDPGBatch);
  sub_1BA2BD1B4(v33, v35);
  id result = sub_1BA2BEFD0(v36, v38, v33, v35);
  if (result)
  {
    id v39 = result;
    sub_1BA2BD220(v33, v35);
    sub_1BA2BF0A8((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
    sub_1BA2BF0A8((uint64_t)v17, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1BA2BF0A8((uint64_t)v22, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    return v39;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1BA2BEBD0()
{
  return sub_1BA2D9C78();
}

uint64_t sub_1BA2BEC38(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BEC64(a1, a2, (uint64_t)&type metadata for OSVariant, (uint64_t)&off_1F13B9388) & 1;
}

uint64_t sub_1BA2BEC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4) & 1) != 0 || (sub_1BA2D9C78()) {
    return 1;
  }
  return sub_1BA2D9C78();
}

FLDPGBatchFactory __swiftcall FLDPGBatchFactory.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (FLDPGBatchFactory)objc_msgSend(v0, sel_init);
}

id FLDPGBatchFactory.init()()
{
  v1.super_class = (Class)FLDPGBatchFactory;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for FLDPGBatchFactory()
{
  unint64_t result = qword_1E9F41340;
  if (!qword_1E9F41340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9F41340);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1BA2BEE84()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  v3(v2);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_1BA2BEED8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1BA2BEF2C()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  v3(v2);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

unint64_t sub_1BA2BEF80()
{
  unint64_t result = qword_1E9F41358;
  if (!qword_1E9F41358)
  {
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41358);
  }
  return result;
}

id sub_1BA2BEFD0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = (void *)sub_1BA2D9C08();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1BA2D98C8();
  id v9 = objc_msgSend(v4, sel_initWithBundleID_payload_, v7, v8);
  sub_1BA2BD220(a3, a4);

  return v9;
}

unint64_t sub_1BA2BF05C()
{
  unint64_t result = qword_1E9F41360;
  if (!qword_1E9F41360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41360);
  }
  return result;
}

uint64_t sub_1BA2BF0A8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return 0;
}

BOOL sub_1BA2BF124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

BOOL sub_1BA2BF130(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1BA2BF140(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_1BA2D9DC8();
  a3(v4);
  OUTLINED_FUNCTION_46();
  return sub_1BA2D9DD8();
}

uint64_t sub_1BA2BF198()
{
  return sub_1BA2D9DD8();
}

uint64_t sub_1BA2BF1F0()
{
  return sub_1BA2D9DD8();
}

uint64_t sub_1BA2BF244(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_1BA2D9DC8();
  a4(v5);
  OUTLINED_FUNCTION_46();
  return sub_1BA2D9DD8();
}

uint64_t sub_1BA2BF298@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_23(a1);
  *(_OWORD *)(v1 + 32) = xmmword_1BA2DE290;
  *(_OWORD *)(v1 + 48) = xmmword_1BA2DE290;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  return sub_1BA2D9958();
}

uint64_t sub_1BA2BF2D8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = xmmword_1BA2DE2A0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0xE000000000000000;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0xE000000000000000;
  *(void *)(a1 + 88) = sub_1BA2D9BD8();
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  return sub_1BA2D9958();
}

uint64_t sub_1BA2BF354@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x1E4FBC860];
  uint64_t v2 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  sub_1BA2D9958();
  uint64_t v3 = (uint64_t)a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  uint64_t v5 = (uint64_t)a1 + *(int *)(v2 + 28);
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  return __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
}

void sub_1BA2BF3F4()
{
}

void sub_1BA2BF404(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_1BA2BF414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7B8(a1, a2, a3, (uint64_t (*)(void))sub_1BA2BF3F4);
}

uint64_t sub_1BA2BF42C()
{
  return nullsub_1(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_1BA2BF438(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7FC(a1, a2, a3, (uint64_t (*)(void))sub_1BA2BF3F4);
}

uint64_t sub_1BA2BF450@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*(void *)v1, *(unsigned __int8 *)(v1 + 8));
  *a1 = result;
  return result;
}

uint64_t sub_1BA2BF480()
{
  return sub_1BA2BF140(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1BA2CBC2C);
}

uint64_t sub_1BA2BF4BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BA2C83F0();
  return MEMORY[0x1F4127160](a1, a2, v4);
}

uint64_t sub_1BA2BF508(uint64_t a1)
{
  return sub_1BA2BF244(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1BA2CBC2C);
}

BOOL sub_1BA2BF544(uint64_t a1, uint64_t *a2)
{
  return sub_1BA2BF124(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_1BA2BF560()
{
  qword_1E9F41738 = (uint64_t)&unk_1F13B90A8;
}

uint64_t *sub_1BA2BF574()
{
  if (qword_1E9F41230 != -1) {
    swift_once();
  }
  return &qword_1E9F41738;
}

uint64_t sub_1BA2BF5C0@<X0>(void *a1@<X8>)
{
  sub_1BA2BF574();
  *a1 = qword_1E9F41738;
  return swift_bridgeObjectRetain();
}

void sub_1BA2BF600()
{
}

uint64_t sub_1BA2BF60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7B8(a1, a2, a3, (uint64_t (*)(void))sub_1BA2BF600);
}

uint64_t sub_1BA2BF624(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7FC(a1, a2, a3, (uint64_t (*)(void))sub_1BA2BF600);
}

uint64_t sub_1BA2BF63C()
{
  return sub_1BA2BF140(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1BA2CBB8C);
}

uint64_t sub_1BA2BF678(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BA2C843C();
  return MEMORY[0x1F4127160](a1, a2, v4);
}

uint64_t sub_1BA2BF6C4(uint64_t a1)
{
  return sub_1BA2BF244(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1BA2CBB8C);
}

void sub_1BA2BF700()
{
  qword_1E9F41740 = (uint64_t)&unk_1F13B9268;
}

uint64_t *sub_1BA2BF714()
{
  if (qword_1E9F41238 != -1) {
    swift_once();
  }
  return &qword_1E9F41740;
}

uint64_t sub_1BA2BF760@<X0>(void *a1@<X8>)
{
  sub_1BA2BF714();
  *a1 = qword_1E9F41740;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA2BF7A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7B8(a1, a2, a3, (uint64_t (*)(void))sub_1BA2CBCC8);
}

uint64_t sub_1BA2BF7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  return OUTLINED_FUNCTION_40(v4, v5);
}

uint64_t sub_1BA2BF7E4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA2BF7FC(a1, a2, a3, (uint64_t (*)(void))sub_1BA2CBCC8);
}

uint64_t sub_1BA2BF7FC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4(*a1);
  return OUTLINED_FUNCTION_40(v4, v5);
}

uint64_t sub_1BA2BF82C()
{
  return sub_1BA2BF140(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1BA2CBAEC);
}

uint64_t sub_1BA2BF868(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BA2C84D8();
  return MEMORY[0x1F4127160](a1, a2, v4);
}

uint64_t sub_1BA2BF8B4(uint64_t a1)
{
  return sub_1BA2BF244(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1BA2CBAEC);
}

void sub_1BA2BF8F0()
{
  qword_1E9F41748 = (uint64_t)&unk_1F13B9188;
}

uint64_t *sub_1BA2BF904()
{
  if (qword_1E9F41240 != -1) {
    swift_once();
  }
  return &qword_1E9F41748;
}

uint64_t sub_1BA2BF950@<X0>(void *a1@<X8>)
{
  sub_1BA2BF904();
  *a1 = qword_1E9F41748;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA2BF990@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1BA2DE290;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
  return sub_1BA2D9958();
}

uint64_t sub_1BA2BF9E8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = MEMORY[0x1E4FBC860];
  *(_OWORD *)(a1 + 8) = xmmword_1BA2DE290;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(0);
  return sub_1BA2D9958();
}

uint64_t sub_1BA2BFA34@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_23(a1);
  *(void *)(v1 + 32) = MEMORY[0x1E4FBC860];
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
  return sub_1BA2D9958();
}

uint64_t sub_1BA2BFA74()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41750);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41750);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE210;
  __int16 v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 0;
  *(void *)unint64_t v6 = "PAYLOAD_UNKNOWN";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  id v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "PAYLOAD_AVRO_RECORD";
  *((void *)v10 + 1) = 19;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)uint64_t v12 = "PAYLOAD_PROTO_RECORD";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2BFC68(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41248, (uint64_t)qword_1E9F41750);
}

uint64_t sub_1BA2BFC8C()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41768);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41768);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE2C0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "EVENT_HEADERS_INVALID";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  id v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "EVENT_BODY_INVALID";
  *(void *)(v10 + 8) = 18;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)uint64_t v12 = "EVENT_BODY_TOO_LARGE";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 3;
  *(void *)uint64_t v14 = "EVENT_SCHEMA_UNKNOWN";
  *((void *)v14 + 1) = 20;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 4;
  *(void *)uint64_t v16 = "EVENT_UNSUPPORTED";
  *((void *)v16 + 1) = 17;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 5;
  *(void *)uint64_t v18 = "EVENT_TIMEOUT";
  *((void *)v18 + 1) = 13;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 6;
  *(void *)uint64_t v20 = "EVENT_PRODUCER_FAILED";
  *((void *)v20 + 1) = 21;
  v20[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2BFF74(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41250, (uint64_t)qword_1E9F41768);
}

uint64_t sub_1BA2BFF98(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_1BA2C3C50(a3, a4);
  OUTLINED_FUNCTION_47();
  sub_1BA2D9B28();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = OUTLINED_FUNCTION_34();
  return v5(v4);
}

uint64_t sub_1BA2C0000()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41780);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41780);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE210;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 0;
  *(void *)unint64_t v6 = "OK";
  *(void *)(v6 + 8) = 2;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  id v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "FAILED_ALL";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)uint64_t v12 = "FAILED_PARTIAL";
  *((void *)v12 + 1) = 14;
  v12[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C01F0(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41258, (uint64_t)qword_1E9F41780);
}

uint64_t sub_1BA2C0214()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41798);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41798);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE210;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 4;
  *(void *)unint64_t v6 = "payload";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  id v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 6;
  *(void *)unint64_t v10 = "headers";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 7;
  *(void *)uint64_t v12 = "metadata";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C040C()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 7:
          OUTLINED_FUNCTION_2();
          sub_1BA2C058C();
          break;
        case 6:
          uint64_t v3 = OUTLINED_FUNCTION_2();
          sub_1BA2C3478(v3, v4, v5, v6, v7, &qword_1E9F41448, v8);
          break;
        case 4:
          OUTLINED_FUNCTION_2();
          sub_1BA2C04DC();
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C04DC()
{
  return sub_1BA2D9A38();
}

uint64_t sub_1BA2C058C()
{
  return sub_1BA2D9A38();
}

uint64_t sub_1BA2C063C()
{
  OUTLINED_FUNCTION_26();
  uint64_t result = sub_1BA2C075C(v2);
  if (!v1)
  {
    if (*(void *)(*(void *)v0 + 16))
    {
      type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
      sub_1BA2C4FB8(&qword_1E9F41448, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
      sub_1BA2D9AE8();
    }
    OUTLINED_FUNCTION_26();
    sub_1BA2C098C(v4);
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
    return sub_1BA2D9948();
  }
  return result;
}

uint64_t sub_1BA2C075C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  sub_1BA2C61BC(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1E9F41348);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_1BA2BEED8((uint64_t)v4, &qword_1E9F41348);
  }
  sub_1BA2C620C((uint64_t)v4, (uint64_t)v7);
  sub_1BA2C4FB8(&qword_1E9F41448, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  sub_1BA2D9AF8();
  return sub_1BA2C6268((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

BOOL sub_1BA2C0928(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

uint64_t sub_1BA2C098C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  sub_1BA2C61BC(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_1E9F41350);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_1BA2BEED8((uint64_t)v4, &qword_1E9F41350);
  }
  sub_1BA2C620C((uint64_t)v4, (uint64_t)v7);
  sub_1BA2C4FB8(&qword_1E9F41468, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  sub_1BA2D9AF8();
  return sub_1BA2C6268((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1BA2C0B58(uint64_t *a1, uint64_t *a2)
{
  uint64_t v76 = a2;
  sub_1BA2D9968();
  OUTLINED_FUNCTION_0_1();
  uint64_t v67 = v4;
  uint64_t v68 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_41();
  uint64_t v66 = v5;
  MEMORY[0x1F4188790](v6);
  unint64_t v65 = (char *)&v63 - v7;
  uint64_t v73 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_42();
  uint64_t v64 = v9;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_42();
  uint64_t v74 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
  MEMORY[0x1F4188790](v12 - 8);
  OUTLINED_FUNCTION_41();
  uint64_t v69 = v13;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v71 = (uint64_t)&v63 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v72 = (uint64_t)&v63 - v17;
  uint64_t v18 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414E8);
  uint64_t v23 = v22 - 8;
  MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  double v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v27);
  uint64_t v32 = (char *)&v63 - v31;
  MEMORY[0x1F4188790](v30);
  unint64_t v34 = (char *)&v63 - v33;
  uint64_t v35 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  uint64_t v36 = *(int *)(v35 + 24);
  unint64_t v75 = a1;
  sub_1BA2C61BC((uint64_t)a1 + v36, (uint64_t)v34, &qword_1E9F41348);
  uint64_t v37 = v35;
  sub_1BA2C61BC((uint64_t)v76 + *(int *)(v35 + 24), (uint64_t)v32, &qword_1E9F41348);
  uint64_t v38 = (uint64_t)&v25[*(int *)(v23 + 56)];
  sub_1BA2C61BC((uint64_t)v34, (uint64_t)v25, &qword_1E9F41348);
  sub_1BA2C61BC((uint64_t)v32, v38, &qword_1E9F41348);
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v18) == 1)
  {
    sub_1BA2BEED8((uint64_t)v32, &qword_1E9F41348);
    sub_1BA2BEED8((uint64_t)v34, &qword_1E9F41348);
    OUTLINED_FUNCTION_17();
    if (!v39) {
      goto LABEL_8;
    }
    sub_1BA2BEED8((uint64_t)v25, &qword_1E9F41348);
  }
  else
  {
    sub_1BA2C61BC((uint64_t)v25, (uint64_t)v29, &qword_1E9F41348);
    OUTLINED_FUNCTION_17();
    if (v39)
    {
      sub_1BA2BEED8((uint64_t)v32, &qword_1E9F41348);
      sub_1BA2BEED8((uint64_t)v34, &qword_1E9F41348);
      sub_1BA2C6268((uint64_t)v29, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_8:
      uint64_t v40 = &qword_1E9F414E8;
      uint64_t v41 = (uint64_t)v25;
LABEL_9:
      sub_1BA2BEED8(v41, v40);
LABEL_22:
      char v60 = 0;
      return v60 & 1;
    }
    sub_1BA2C620C(v38, (uint64_t)v21);
    sub_1BA2C2534();
    char v43 = v42;
    sub_1BA2C6268((uint64_t)v21, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1BA2BEED8((uint64_t)v32, &qword_1E9F41348);
    sub_1BA2BEED8((uint64_t)v34, &qword_1E9F41348);
    sub_1BA2C6268((uint64_t)v29, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1BA2BEED8((uint64_t)v25, &qword_1E9F41348);
    if ((v43 & 1) == 0) {
      goto LABEL_22;
    }
  }
  uint64_t v44 = v75;
  uint64_t v45 = v76;
  if ((sub_1BA2C6DC4(*v75, *v76) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v46 = v37;
  uint64_t v47 = v72;
  sub_1BA2C61BC((uint64_t)v44 + *(int *)(v37 + 28), v72, &qword_1E9F41350);
  uint64_t v48 = v71;
  sub_1BA2C61BC((uint64_t)v45 + *(int *)(v37 + 28), v71, &qword_1E9F41350);
  uint64_t v49 = v74;
  uint64_t v50 = v74 + *(int *)(v70 + 48);
  sub_1BA2C61BC(v47, v74, &qword_1E9F41350);
  sub_1BA2C61BC(v48, v50, &qword_1E9F41350);
  if (__swift_getEnumTagSinglePayload(v49, 1, v73) == 1)
  {
    sub_1BA2BEED8(v48, &qword_1E9F41350);
    sub_1BA2BEED8(v47, &qword_1E9F41350);
    OUTLINED_FUNCTION_17();
    if (!v39) {
      goto LABEL_19;
    }
    sub_1BA2BEED8(v49, &qword_1E9F41350);
  }
  else
  {
    uint64_t v51 = v69;
    sub_1BA2C61BC(v49, v69, &qword_1E9F41350);
    OUTLINED_FUNCTION_17();
    if (v39)
    {
      sub_1BA2BEED8(v48, &qword_1E9F41350);
      sub_1BA2BEED8(v47, &qword_1E9F41350);
      sub_1BA2C6268(v51, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
LABEL_19:
      uint64_t v40 = &qword_1E9F414E0;
      uint64_t v41 = v49;
      goto LABEL_9;
    }
    uint64_t v52 = v64;
    sub_1BA2C620C(v50, v64);
    sub_1BA2C1BB4();
    char v54 = v53;
    sub_1BA2C6268(v52, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1BA2BEED8(v48, &qword_1E9F41350);
    sub_1BA2BEED8(v47, &qword_1E9F41350);
    sub_1BA2C6268(v51, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1BA2BEED8(v49, &qword_1E9F41350);
    if ((v54 & 1) == 0) {
      goto LABEL_22;
    }
  }
  uint64_t v56 = v67;
  uint64_t v55 = v68;
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  uint64_t v58 = v65;
  v57(v65, (char *)v44 + *(int *)(v46 + 20), v68);
  id v59 = v66;
  v57(v66, (char *)v45 + *(int *)(v46 + 20), v55);
  sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
  char v60 = sub_1BA2D9BF8();
  v61 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v61((uint64_t)v59, v55);
  v61((uint64_t)v58, v55);
  return v60 & 1;
}

unint64_t sub_1BA2C1284()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_1BA2C12A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1BA2C1314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_1BA2C1384())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C13A8()
{
  return sub_1BA2C040C();
}

uint64_t sub_1BA2C13C0()
{
  return sub_1BA2C063C();
}

uint64_t sub_1BA2C13DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F414D8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C145C(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41260, (uint64_t)qword_1E9F41798);
}

uint64_t sub_1BA2C1480(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8((unint64_t *)&qword_1E9F41358, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C14EC()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, &qword_1E9F41488, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t sub_1BA2C1548()
{
  sub_1BA2C4FB8((unint64_t *)&qword_1E9F41358, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C15CC()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F417B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F417B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1BA2DE2C0;
  unint64_t v4 = v20 + v3 + v1[14];
  *(void *)(v20 + v3) = 1;
  *(void *)unint64_t v4 = "fqn";
  *(void *)(v4 + 8) = 3;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x1E4F70FB8];
  uint64_t v6 = sub_1BA2D9B08();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v20 + v3 + v2 + v1[14];
  *(void *)(v20 + v3 + v2) = 2;
  *(void *)unint64_t v8 = "timestamp_ms";
  *(void *)(v8 + 8) = 12;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v20 + v3 + 2 * v2);
  uint64_t v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 3;
  *(void *)uint64_t v10 = "request_id";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v20 + v3 + 3 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 4;
  *(void *)uint64_t v12 = "topic_override";
  *((void *)v12 + 1) = 14;
  v12[16] = 2;
  v7();
  uint64_t v13 = (void *)(v20 + v3 + 4 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 5;
  *(void *)uint64_t v14 = "source_cluster";
  *((void *)v14 + 1) = 14;
  v14[16] = 2;
  v7();
  uint64_t v15 = (void *)(v20 + v3 + 5 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 6;
  *(void *)uint64_t v16 = "stream";
  *((void *)v16 + 1) = 6;
  v16[16] = 2;
  v7();
  uint64_t v17 = (void *)(v20 + v3 + 6 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 7;
  *(void *)uint64_t v18 = "legacyHeaders";
  *((void *)v18 + 1) = 13;
  v18[16] = 2;
  v7();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C18B8()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v0;
          goto LABEL_11;
        case 2:
          sub_1BA2D9A08();
          break;
        case 3:
          OUTLINED_FUNCTION_38(v0 + 24);
          break;
        case 4:
          uint64_t v4 = v0 + 40;
          goto LABEL_11;
        case 5:
          uint64_t v4 = v0 + 56;
          goto LABEL_11;
        case 6:
          uint64_t v4 = v0 + 72;
LABEL_11:
          OUTLINED_FUNCTION_39(v4);
          break;
        case 7:
          OUTLINED_FUNCTION_2();
          sub_1BA2C19C4();
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C19C4()
{
  return sub_1BA2D99A8();
}

uint64_t sub_1BA2C1A38()
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_8();
  if (!v3 || (result = OUTLINED_FUNCTION_18(), (uint64_t v2 = v1) == 0))
  {
    if (!*(void *)(v0 + 16) || (v1 = v2, OUTLINED_FUNCTION_26(), uint64_t result = sub_1BA2D9AC8(), !v2))
    {
      if (OUTLINED_FUNCTION_36() || (v1 = v2, uint64_t result = sub_1BA2D9AA8(), !v2))
      {
        OUTLINED_FUNCTION_8();
        if (!v5 || (result = OUTLINED_FUNCTION_18(), (uint64_t v2 = v1) == 0))
        {
          OUTLINED_FUNCTION_8();
          if (!v6 || (result = OUTLINED_FUNCTION_18(), (uint64_t v2 = v1) == 0))
          {
            OUTLINED_FUNCTION_8();
            if (!v7 || (result = OUTLINED_FUNCTION_18(), (uint64_t v2 = v1) == 0))
            {
              if (!*(void *)(*(void *)(v0 + 88) + 16) || (sub_1BA2D9938(), uint64_t result = sub_1BA2D9A88(), !v2))
              {
                type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
                return sub_1BA2D9948();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_1BA2C1BB4()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20();
  BOOL v7 = *v1 == *v0 && v1[1] == v0[1];
  if (v7 || (sub_1BA2D9DB8())
    && v1[2] == v0[2]
    && (MEMORY[0x1BA9E7FB0](v1[3], v1[4], v0[3], v0[4]) & 1) != 0)
  {
    BOOL v8 = v1[5] == v0[5] && v1[6] == v0[6];
    if (v8 || (sub_1BA2D9DB8() & 1) != 0)
    {
      BOOL v9 = v1[7] == v0[7] && v1[8] == v0[8];
      if (v9 || (sub_1BA2D9DB8() & 1) != 0)
      {
        BOOL v10 = v1[9] == v0[9] && v1[10] == v0[10];
        if (v10 || (sub_1BA2D9DB8()) && (sub_1BA2C7CA4(v1[11], v0[11]))
        {
          type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
          uint64_t v11 = OUTLINED_FUNCTION_6();
          ((void (*)(uint64_t))v2)(v11);
          OUTLINED_FUNCTION_7();
          v2();
          sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
          OUTLINED_FUNCTION_12();
          uint64_t v12 = *(void (**)(void))(v4 + 8);
          OUTLINED_FUNCTION_9();
          v12();
          OUTLINED_FUNCTION_9();
          v12();
        }
      }
    }
  }
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_37();
}

unint64_t sub_1BA2C1D84()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_1BA2C1DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 44);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1BA2C1E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 44);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_1BA2C1E80())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C1EA4()
{
  return sub_1BA2C18B8();
}

uint64_t sub_1BA2C1EBC()
{
  return sub_1BA2C1A38();
}

uint64_t sub_1BA2C1ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F414F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C1F50(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41268, (uint64_t)qword_1E9F417B0);
}

uint64_t sub_1BA2C1F74(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F41468, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C1FE0()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, &qword_1E9F41470, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1BA2C203C()
{
  sub_1BA2C4FB8(&qword_1E9F41468, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C20BC()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F417C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F417C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE2D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "payload_type";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FD0];
  uint64_t v8 = sub_1BA2D9B08();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "schema_name";
  *(void *)(v10 + 8) = 11;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "schema_fingerprint";
  *((void *)v12 + 1) = 18;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "body";
  *((void *)v14 + 1) = 4;
  v14[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C22F4()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          OUTLINED_FUNCTION_2();
          sub_1BA2C23BC();
          break;
        case 2:
          OUTLINED_FUNCTION_39(v0 + 16);
          break;
        case 3:
          uint64_t v4 = v0 + 32;
          goto LABEL_9;
        case 4:
          uint64_t v4 = v0 + 48;
LABEL_9:
          OUTLINED_FUNCTION_38(v4);
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C23BC()
{
  return sub_1BA2D99D8();
}

uint64_t sub_1BA2C2424()
{
  OUTLINED_FUNCTION_27();
  if (!*v0 || (sub_1BA2C83F0(), uint64_t result = sub_1BA2D9A98(), !v1))
  {
    OUTLINED_FUNCTION_8();
    if (!v3 || (uint64_t result = sub_1BA2D9AD8(), !v1))
    {
      if (OUTLINED_FUNCTION_36() || (uint64_t result = OUTLINED_FUNCTION_33(), !v1))
      {
        if (OUTLINED_FUNCTION_36() || (uint64_t result = OUTLINED_FUNCTION_33(), !v1))
        {
          type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
          return OUTLINED_FUNCTION_19();
        }
      }
    }
  }
  return result;
}

void sub_1BA2C2534()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_21();
  if (v9)
  {
    if (v8)
    {
      if (v8 == 1)
      {
        if (v7 != 1) {
          goto LABEL_20;
        }
      }
      else if (v7 != 2)
      {
        goto LABEL_20;
      }
    }
    else if (v7)
    {
      goto LABEL_20;
    }
  }
  else if (v7 != v8)
  {
    goto LABEL_20;
  }
  BOOL v9 = v1[2] == v0[2] && v1[3] == v0[3];
  if (v9 || (sub_1BA2D9DB8())
    && (MEMORY[0x1BA9E7FB0](v1[4], v1[5], v0[4], v0[5]) & 1) != 0
    && (MEMORY[0x1BA9E7FB0](v1[6], v1[7], v0[6], v0[7]) & 1) != 0)
  {
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
    uint64_t v10 = OUTLINED_FUNCTION_6();
    ((void (*)(uint64_t))v2)(v10);
    OUTLINED_FUNCTION_7();
    v2();
    sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
    OUTLINED_FUNCTION_12();
    uint64_t v11 = *(void (**)(void))(v4 + 8);
    OUTLINED_FUNCTION_9();
    v11();
    OUTLINED_FUNCTION_9();
    v11();
  }
LABEL_20:
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_37();
}

unint64_t sub_1BA2C26C0()
{
  return 0xD000000000000030;
}

uint64_t (*sub_1BA2C26E4())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C2708()
{
  return sub_1BA2C22F4();
}

uint64_t sub_1BA2C2720()
{
  return sub_1BA2C2424();
}

uint64_t sub_1BA2C2738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F414F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C27B4(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41270, (uint64_t)qword_1E9F417C8);
}

uint64_t sub_1BA2C27D8(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F41448, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C2844()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, &qword_1E9F41450, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t sub_1BA2C28A0()
{
  sub_1BA2C4FB8(&qword_1E9F41448, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C2920()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F417E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F417E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE2D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "index";
  *(void *)(v6 + 8) = 5;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "request_id";
  *(void *)(v10 + 8) = 10;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "code";
  *((void *)v12 + 1) = 4;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "message";
  *((void *)v14 + 1) = 7;
  v14[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C2B58()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_1BA2D99F8();
          break;
        case 2:
          OUTLINED_FUNCTION_38(v0 + 8);
          break;
        case 3:
          OUTLINED_FUNCTION_2();
          sub_1BA2C2C24();
          break;
        case 4:
          OUTLINED_FUNCTION_39(v0 + 40);
          break;
        default:
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C2C24()
{
  return sub_1BA2D99D8();
}

uint64_t sub_1BA2C2C88()
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_27();
  if (!*(_DWORD *)v0 || (OUTLINED_FUNCTION_26(), uint64_t result = sub_1BA2D9AB8(), !v1))
  {
    if (OUTLINED_FUNCTION_36() || (result = OUTLINED_FUNCTION_33(), (uint64_t v2 = v1) == 0))
    {
      if (!*(void *)(v0 + 24) || (sub_1BA2C843C(), uint64_t result = sub_1BA2D9A98(), !v2))
      {
        OUTLINED_FUNCTION_8();
        if (!v4 || (uint64_t result = sub_1BA2D9AD8(), !v2))
        {
          type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
          return OUTLINED_FUNCTION_19();
        }
      }
    }
  }
  return result;
}

void sub_1BA2C2D94()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)v1 == *(_DWORD *)v0
    && (MEMORY[0x1BA9E7FB0](*(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v0 + 8), *(void *)(v0 + 16)) & 1) != 0
    && sub_1BA2BF124(*(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v0 + 24)))
  {
    BOOL v7 = *(void *)(v1 + 40) == *(void *)(v0 + 40) && *(void *)(v1 + 48) == *(void *)(v0 + 48);
    if (v7 || (sub_1BA2D9DB8() & 1) != 0)
    {
      type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
      uint64_t v8 = OUTLINED_FUNCTION_6();
      ((void (*)(uint64_t))v2)(v8);
      OUTLINED_FUNCTION_7();
      v2();
      sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
      OUTLINED_FUNCTION_12();
      BOOL v9 = *(void (**)(void))(v4 + 8);
      OUTLINED_FUNCTION_9();
      v9();
      OUTLINED_FUNCTION_9();
      v9();
    }
  }
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_37();
}

unint64_t sub_1BA2C2F00()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_1BA2C2F1C()
{
  sub_1BA2D9968();
  OUTLINED_FUNCTION_0_0();
  uint64_t v0 = OUTLINED_FUNCTION_34();
  return v1(v0);
}

uint64_t sub_1BA2C2F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 32);
  sub_1BA2D9968();
  OUTLINED_FUNCTION_0_0();
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  return v7(v4, a1, v5);
}

uint64_t sub_1BA2C2FE4()
{
  return sub_1BA2C2B58();
}

uint64_t sub_1BA2C2FFC()
{
  return sub_1BA2C2C88();
}

uint64_t sub_1BA2C3014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F41508, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C3090(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41278, (uint64_t)qword_1E9F417E0);
}

uint64_t sub_1BA2C30B4(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F41428, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C3120()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, &qword_1E9F41430, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t sub_1BA2C317C()
{
  sub_1BA2C4FB8(&qword_1E9F41428, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C31FC()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F417F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F417F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE220;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "events";
  *(void *)(v6 + 8) = 6;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "request_id";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C33BC()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      if (result == 2)
      {
        OUTLINED_FUNCTION_38(v0 + 8);
      }
      else if (result == 1)
      {
        uint64_t v4 = OUTLINED_FUNCTION_2();
        sub_1BA2C3478(v4, v5, v6, v7, v8, (unint64_t *)&qword_1E9F41358, v9);
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C3478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  return sub_1BA2D9A28();
}

uint64_t sub_1BA2C3514()
{
  OUTLINED_FUNCTION_29();
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0),
        sub_1BA2C4FB8((unint64_t *)&qword_1E9F41358, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage), uint64_t result = OUTLINED_FUNCTION_35(), !v1))
  {
    if (OUTLINED_FUNCTION_36() || (OUTLINED_FUNCTION_32(), uint64_t result = sub_1BA2D9AA8(), !v1))
    {
      type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(0);
      return OUTLINED_FUNCTION_28();
    }
  }
  return result;
}

void sub_1BA2C35EC()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20();
  if (sub_1BA2C6C24(*v1, *v0) & 1) != 0 && (MEMORY[0x1BA9E7FB0](v1[1], v1[2], v0[1], v0[2]))
  {
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(0);
    uint64_t v7 = OUTLINED_FUNCTION_6();
    ((void (*)(uint64_t))v2)(v7);
    OUTLINED_FUNCTION_7();
    v2();
    sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
    OUTLINED_FUNCTION_12();
    uint64_t v8 = *(void (**)(void))(v4 + 8);
    OUTLINED_FUNCTION_9();
    v8();
    OUTLINED_FUNCTION_9();
    v8();
  }
  OUTLINED_FUNCTION_37();
}

unint64_t sub_1BA2C3720()
{
  return 0xD000000000000031;
}

uint64_t sub_1BA2C373C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1BA2C37AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_1BA2C381C())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C3840()
{
  return sub_1BA2C33BC();
}

uint64_t sub_1BA2C3858()
{
  return sub_1BA2C3514();
}

uint64_t sub_1BA2C3870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F41518, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C38EC(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41280, (uint64_t)qword_1E9F417F8);
}

uint64_t sub_1BA2C3910(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F41408, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C397C()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, &qword_1E9F41410, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t sub_1BA2C39D8()
{
  sub_1BA2C4FB8(&qword_1E9F41408, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C3A58()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41810);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41810);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BA2DE210;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "status";
  *(void *)(v6 + 8) = 6;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FB8];
  uint64_t v8 = sub_1BA2D9B08();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "message";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "errors";
  *((void *)v12 + 1) = 6;
  v12[16] = 2;
  v9();
  return sub_1BA2D9B18();
}

uint64_t sub_1BA2C3C50(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1BA2D9B28();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1BA2C3CA4()
{
  uint64_t result = OUTLINED_FUNCTION_4();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          OUTLINED_FUNCTION_2();
          sub_1BA2C3D98();
          break;
        case 2:
          OUTLINED_FUNCTION_39(v0 + 16);
          break;
        case 1:
          OUTLINED_FUNCTION_2();
          sub_1BA2C3D30();
          break;
      }
      uint64_t result = OUTLINED_FUNCTION_24();
    }
  }
  return result;
}

uint64_t sub_1BA2C3D30()
{
  return sub_1BA2D99D8();
}

uint64_t sub_1BA2C3D98()
{
  return sub_1BA2D9A28();
}

uint64_t sub_1BA2C3E34()
{
  OUTLINED_FUNCTION_29();
  if (!*v1 || (sub_1BA2C84D8(), uint64_t v2 = v0, result = sub_1BA2D9A98(), !v0))
  {
    OUTLINED_FUNCTION_8();
    if (!v5 || (OUTLINED_FUNCTION_32(), uint64_t result = sub_1BA2D9AD8(), !v2))
    {
      if (!*(void *)(*(void *)(v3 + 32) + 16)
        || (type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0),
            sub_1BA2C4FB8(&qword_1E9F41428, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError), uint64_t result = OUTLINED_FUNCTION_35(), !v2))
      {
        type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
        return OUTLINED_FUNCTION_28();
      }
    }
  }
  return result;
}

void sub_1BA2C3F54()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_21();
  if (v9)
  {
    if (v8)
    {
      if (v8 == 1)
      {
        if (v7 != 1) {
          goto LABEL_19;
        }
      }
      else if (v7 != 2)
      {
        goto LABEL_19;
      }
    }
    else if (v7)
    {
      goto LABEL_19;
    }
  }
  else if (v7 != v8)
  {
    goto LABEL_19;
  }
  BOOL v9 = v1[2] == v0[2] && v1[3] == v0[3];
  if (v9 || (sub_1BA2D9DB8()) && (sub_1BA2C62C0(v1[4], v0[4]))
  {
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
    uint64_t v10 = OUTLINED_FUNCTION_6();
    ((void (*)(uint64_t))v2)(v10);
    OUTLINED_FUNCTION_7();
    v2();
    sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
    OUTLINED_FUNCTION_12();
    uint64_t v11 = *(void (**)(void))(v4 + 8);
    OUTLINED_FUNCTION_9();
    v11();
    OUTLINED_FUNCTION_9();
    v11();
  }
LABEL_19:
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_37();
}

unint64_t sub_1BA2C40D0()
{
  return 0xD000000000000032;
}

uint64_t sub_1BA2C40EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1BA2C415C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_1BA2C41CC())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C41F0()
{
  return sub_1BA2C3CA4();
}

uint64_t sub_1BA2C4208()
{
  return sub_1BA2C3E34();
}

uint64_t sub_1BA2C4220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F41520, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C429C(uint64_t a1, uint64_t a2)
{
  return sub_1BA2BFF98(a1, a2, &qword_1E9F41288, (uint64_t)qword_1E9F41810);
}

uint64_t sub_1BA2C42C0(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F413E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C432C()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, &qword_1E9F413F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t sub_1BA2C4388()
{
  sub_1BA2C4FB8(&qword_1E9F413E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
  return sub_1BA2D9A78();
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  int v4 = *(unsigned __int8 *)(v1 + *(int *)(result + 20));
  if (v4 == 5) {
    LOBYTE(v4) = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F413D0);
}

uint64_t sub_1BA2C4464(char *a1)
{
  char v2 = *a1;
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.setter(&v2);
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t (*Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20);
  *(_DWORD *)(a1 + 8) = v3;
  int v4 = *(unsigned __int8 *)(v1 + v3);
  if (v4 == 5) {
    LOBYTE(v4) = 0;
  }
  *(unsigned char *)(a1 + 12) = v4;
  return sub_1BA2C452C;
}

uint64_t sub_1BA2C452C(uint64_t result)
{
  *(unsigned char *)(*(void *)result + *(int *)(result + 8)) = *(unsigned char *)(result + 12);
  return result;
}

BOOL Com_Apple_Ve_Common_Headers_IngestEnvironment.hasBuildVariant.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) != 5;
}

Swift::Void __swiftcall Com_Apple_Ve_Common_Headers_IngestEnvironment.clearBuildVariant()()
{
  *(unsigned char *)(v0 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) = 5;
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.getter()
{
  sub_1BA2D9968();
  OUTLINED_FUNCTION_0_0();
  uint64_t v0 = OUTLINED_FUNCTION_34();
  return v1(v0);
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.setter(uint64_t a1)
{
  sub_1BA2D9968();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.modify())(void, void)
{
  return nullsub_1;
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.init()@<X0>(uint64_t a1@<X8>)
{
  sub_1BA2D9958();
  uint64_t result = type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  *(unsigned char *)(a1 + *(int *)(result + 20)) = 5;
  return result;
}

unint64_t static Com_Apple_Ve_Common_Headers_IngestEnvironment.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_1BA2C46C0()
{
  uint64_t v0 = sub_1BA2D9B28();
  __swift_allocate_value_buffer(v0, qword_1E9F41368);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9F41368);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414C8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9F414D0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BA2DE200;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "buildVariant";
  *(void *)(v4 + 8) = 12;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x1E4F70FB8];
  uint64_t v6 = sub_1BA2D9B08();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_1BA2D9B18();
}

uint64_t static Com_Apple_Ve_Common_Headers_IngestEnvironment._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9F41290 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1BA2D9B28();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9F41368);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_1BA2D99B8();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1)
    {
      OUTLINED_FUNCTION_2();
      sub_1BA2C492C();
    }
  }
  return result;
}

uint64_t sub_1BA2C492C()
{
  return sub_1BA2D99C8();
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_26();
  uint64_t result = sub_1BA2C49F8(v1);
  if (!v0) {
    return sub_1BA2D9948();
  }
  return result;
}

uint64_t sub_1BA2C49F8(uint64_t a1)
{
  uint64_t result = type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 20)) != 5)
  {
    sub_1BA2C8580();
    return sub_1BA2D9A98();
  }
  return result;
}

void static Com_Apple_Ve_Common_Headers_IngestEnvironment.== infix(_:_:)()
{
  OUTLINED_FUNCTION_44();
  uint64_t v4 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_20();
  uint64_t v9 = *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20);
  int v10 = *(unsigned __int8 *)(v3 + v9);
  int v11 = *(unsigned __int8 *)(v2 + v9);
  if (v10 == 5)
  {
    if (v11 == 5)
    {
LABEL_3:
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      v12(v1, v3, v4);
      v12(v0, v2, v4);
      sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
      OUTLINED_FUNCTION_12();
      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v13(v0, v4);
      v13(v1, v4);
    }
  }
  else if (v11 != 5 && v10 == v11)
  {
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_37();
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.hashValue.getter()
{
  return sub_1BA2C4C28((void (*)(void))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, &qword_1E9F41388, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

uint64_t sub_1BA2C4C28(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_1BA2D9DD8();
}

unint64_t sub_1BA2C4CB4()
{
  return 0xD00000000000002DLL;
}

uint64_t (*sub_1BA2C4CDC())(void, void)
{
  return nullsub_1;
}

uint64_t sub_1BA2C4CFC()
{
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.decodeMessage<A>(decoder:)();
}

uint64_t sub_1BA2C4D14()
{
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.traverse<A>(visitor:)();
}

uint64_t sub_1BA2C4D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BA2C4FB8(&qword_1E9F41538, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1BA2C4DAC(uint64_t a1)
{
  uint64_t v2 = sub_1BA2C4FB8(&qword_1E9F41398, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1BA2C4E1C()
{
  sub_1BA2C4FB8(&qword_1E9F41398, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return sub_1BA2D9A78();
}

uint64_t sub_1BA2C4E98()
{
  return sub_1BA2D9DD8();
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant __swiftcall Com_Apple_Ve_Common_BuildVariant.init()()
{
  *uint64_t v0 = 0;
  return result;
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional __swiftcall Com_Apple_Ve_Common_BuildVariant.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 5;
  if ((unint64_t)rawValue < 5) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional)rawValue;
}

uint64_t Com_Apple_Ve_Common_BuildVariant.rawValue.getter()
{
  return *v0;
}

BOOL sub_1BA2C4F14(char *a1, char *a2)
{
  return sub_1BA2BF130(*a1, *a2);
}

uint64_t sub_1BA2C4F20()
{
  return sub_1BA2BF198();
}

uint64_t sub_1BA2C4F28(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BA2C8580();
  return MEMORY[0x1F4127160](a1, a2, v4);
}

uint64_t sub_1BA2C4F74()
{
  return sub_1BA2BF1F0();
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional sub_1BA2C4F88(Swift::Int *a1)
{
  return Com_Apple_Ve_Common_BuildVariant.init(rawValue:)(*a1);
}

uint64_t sub_1BA2C4F90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Com_Apple_Ve_Common_BuildVariant.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BA2C4FB8(unint64_t *a1, void (*a2)(uint64_t))
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

void *static Com_Apple_Ve_Common_BuildVariant.allCases.getter()
{
  return &unk_1F13B8FF0;
}

uint64_t sub_1BA2C500C()
{
  return sub_1BA2C4FB8(&qword_1E9F41390, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

uint64_t sub_1BA2C5054()
{
  return sub_1BA2C4FB8(&qword_1E9F41398, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

uint64_t sub_1BA2C509C()
{
  return sub_1BA2C4FB8(&qword_1E9F41388, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

uint64_t sub_1BA2C50E4()
{
  return sub_1BA2C4FB8(&qword_1E9F413A0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

unint64_t sub_1BA2C5130()
{
  unint64_t result = qword_1E9F413A8;
  if (!qword_1E9F413A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F413A8);
  }
  return result;
}

unint64_t sub_1BA2C5180()
{
  unint64_t result = qword_1E9F413B0;
  if (!qword_1E9F413B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F413B0);
  }
  return result;
}

unint64_t sub_1BA2C51D0()
{
  unint64_t result = qword_1E9F413B8;
  if (!qword_1E9F413B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F413B8);
  }
  return result;
}

uint64_t sub_1BA2C521C()
{
  return sub_1BA2C616C(&qword_1E9F413C0, &qword_1E9F413C8);
}

void sub_1BA2C5244(void *a1@<X8>)
{
  *a1 = &unk_1F13B8FF0;
}

uint64_t sub_1BA2C5254@<X0>(unsigned char *a1@<X8>)
{
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.getter(a1);
}

void *initializeBufferWithCopyOfBuffer for Com_Apple_Ve_Common_Headers_IngestEnvironment(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BA2D9968();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1)
{
  uint64_t v2 = sub_1BA2D9968();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2C55B0);
}

uint64_t sub_1BA2C55B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BA2D9968();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) <= 5u) {
      int v9 = 5;
    }
    else {
      int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    }
    unsigned int v10 = v9 - 5;
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) >= 5u) {
      return v10;
    }
    else {
      return 0;
    }
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2C5680);
}

void sub_1BA2C5680(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  OUTLINED_FUNCTION_47();
  sub_1BA2D9968();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(v4, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(v4 + *(int *)(a4 + 20)) = a2 + 5;
  }
}

uint64_t sub_1BA2C5704()
{
  uint64_t result = sub_1BA2D9968();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Ve_Common_BuildVariant(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Com_Apple_Ve_Common_BuildVariant(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1BA2C58FCLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1BA2C5924(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BA2C592C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for Com_Apple_Ve_Common_BuildVariant()
{
}

uint64_t sub_1BA2C5940()
{
  return sub_1BA2C4FB8(&qword_1E9F413E0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F415A0);
}

uint64_t sub_1BA2C59A8()
{
  return sub_1BA2C4FB8(&qword_1E9F413E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t sub_1BA2C59F0()
{
  return sub_1BA2C4FB8(&qword_1E9F413F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t sub_1BA2C5A38()
{
  return sub_1BA2C4FB8(&qword_1E9F413F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t sub_1BA2C5A80()
{
  return sub_1BA2C4FB8(&qword_1E9F41400, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F41590);
}

uint64_t sub_1BA2C5AE8()
{
  return sub_1BA2C4FB8(&qword_1E9F41408, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t sub_1BA2C5B30()
{
  return sub_1BA2C4FB8(&qword_1E9F41410, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t sub_1BA2C5B78()
{
  return sub_1BA2C4FB8(&qword_1E9F41418, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t sub_1BA2C5BC0()
{
  return sub_1BA2C4FB8(&qword_1E9F41420, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F41580);
}

uint64_t sub_1BA2C5C28()
{
  return sub_1BA2C4FB8(&qword_1E9F41428, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t sub_1BA2C5C70()
{
  return sub_1BA2C4FB8(&qword_1E9F41430, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t sub_1BA2C5CB8()
{
  return sub_1BA2C4FB8(&qword_1E9F41438, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t sub_1BA2C5D00()
{
  return sub_1BA2C4FB8(&qword_1E9F41440, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F41570);
}

uint64_t sub_1BA2C5D68()
{
  return sub_1BA2C4FB8(&qword_1E9F41448, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t sub_1BA2C5DB0()
{
  return sub_1BA2C4FB8(&qword_1E9F41450, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t sub_1BA2C5DF8()
{
  return sub_1BA2C4FB8(&qword_1E9F41458, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t sub_1BA2C5E40()
{
  return sub_1BA2C4FB8(&qword_1E9F41460, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F41560);
}

uint64_t sub_1BA2C5EA8()
{
  return sub_1BA2C4FB8(&qword_1E9F41468, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1BA2C5EF0()
{
  return sub_1BA2C4FB8(&qword_1E9F41470, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1BA2C5F38()
{
  return sub_1BA2C4FB8(&qword_1E9F41478, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1BA2C5F80()
{
  return sub_1BA2C4FB8(&qword_1E9F41480, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(uint64_t a1)
{
  return sub_1BA2C5FE8(a1, (uint64_t *)&unk_1E9F41540);
}

uint64_t sub_1BA2C5FE8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BA2C601C()
{
  return sub_1BA2C4FB8((unint64_t *)&qword_1E9F41358, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t sub_1BA2C6064()
{
  return sub_1BA2C4FB8(&qword_1E9F41488, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t sub_1BA2C60AC()
{
  return sub_1BA2C4FB8(&qword_1E9F41490, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t sub_1BA2C60F4()
{
  return sub_1BA2C616C(&qword_1E9F41498, &qword_1E9F414A0);
}

uint64_t sub_1BA2C611C()
{
  return sub_1BA2C616C(&qword_1E9F414A8, &qword_1E9F414B0);
}

uint64_t sub_1BA2C6144()
{
  return sub_1BA2C616C(&qword_1E9F414B8, &qword_1E9F414C0);
}

uint64_t sub_1BA2C616C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1BA2C61BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = OUTLINED_FUNCTION_45();
  v5(v4);
  return a2;
}

uint64_t sub_1BA2C620C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_47();
  v5(v4);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a2, v2);
  return a2;
}

uint64_t sub_1BA2C6268(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1BA2C62C0(uint64_t a1, uint64_t a2)
{
  __s1[3] = *MEMORY[0x1E4F143B8];
  uint64_t v62 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
  uint64_t v4 = MEMORY[0x1F4188790](v62);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v9 = (char *)&v56 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v10 && a1 != a2)
  {
    uint64_t v58 = 0;
    uint64_t v59 = a2;
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v60 = *(void *)(v7 + 72);
    uint64_t v61 = a1;
    while (1)
    {
      uint64_t v63 = v10;
      sub_1BA2C8488(a1 + v11, (uint64_t)v9);
      sub_1BA2C8488(a2 + v11, (uint64_t)v6);
      if (*(_DWORD *)v9 != *(_DWORD *)v6) {
        break;
      }
      uint64_t v13 = *((void *)v9 + 1);
      unint64_t v12 = *((void *)v9 + 2);
      uint64_t v15 = *((void *)v6 + 1);
      unint64_t v14 = *((void *)v6 + 2);
      uint64_t v16 = 0;
      switch(v12 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v13), v13))
          {
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
          }
          uint64_t v16 = HIDWORD(v13) - (int)v13;
LABEL_11:
          unint64_t v19 = v14 >> 62;
          switch(v14 >> 62)
          {
            case 1uLL:
              LODWORD(v20) = HIDWORD(v15) - v15;
              if (__OFSUB__(HIDWORD(v15), v15)) {
                goto LABEL_107;
              }
              uint64_t v20 = (int)v20;
LABEL_20:
              if (v16 != v20) {
                goto LABEL_101;
              }
              if (v16 < 1) {
                goto LABEL_77;
              }
              break;
            case 2uLL:
              uint64_t v22 = *(void *)(v15 + 16);
              uint64_t v21 = *(void *)(v15 + 24);
              BOOL v23 = __OFSUB__(v21, v22);
              uint64_t v20 = v21 - v22;
              if (!v23) {
                goto LABEL_20;
              }
              goto LABEL_106;
            case 3uLL:
              if (v16) {
                goto LABEL_101;
              }
              goto LABEL_77;
            default:
              uint64_t v20 = BYTE6(v14);
              goto LABEL_20;
          }
          uint64_t v24 = v15 >> 32;
          switch(v12 >> 62)
          {
            case 1uLL:
              if (v13 >> 32 < (int)v13) {
                goto LABEL_108;
              }
              uint64_t v57 = v13 >> 32;
              sub_1BA2BD1B4(v15, v14);
              sub_1BA2BD1B4(v15, v14);
              sub_1BA2BD1B4(v15, v14);
              sub_1BA2BD1B4(v13, v12);
              uint64_t v34 = sub_1BA2D9898();
              if (!v34) {
                goto LABEL_50;
              }
              uint64_t v35 = sub_1BA2D98B8();
              if (__OFSUB__((int)v13, v35)) {
                goto LABEL_111;
              }
              v34 += (int)v13 - v35;
LABEL_50:
              sub_1BA2D98A8();
              uint64_t v36 = v58;
              sub_1BA2C8128(v34, v15, v14, (BOOL *)__s1);
              sub_1BA2BD220(v15, v14);
              uint64_t v58 = v36;
              if (v36) {
                goto LABEL_125;
              }
              sub_1BA2BD220(v13, v12);
              sub_1BA2BD220(v15, v14);
              char v37 = __s1[0];
              goto LABEL_58;
            case 2uLL:
              uint64_t v27 = *(void *)(v13 + 16);
              uint64_t v57 = *(void *)(v13 + 24);
              sub_1BA2BD1B4(v15, v14);
              sub_1BA2BD1B4(v15, v14);
              sub_1BA2BD1B4(v15, v14);
              swift_retain();
              swift_retain();
              uint64_t v28 = sub_1BA2D9898();
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = sub_1BA2D98B8();
                if (__OFSUB__(v27, v30)) {
                  goto LABEL_110;
                }
                unint64_t v12 = v29 + v27 - v30;
              }
              else
              {
                unint64_t v12 = 0;
              }
              if (__OFSUB__(v57, v27)) {
                goto LABEL_109;
              }
              sub_1BA2D98A8();
              uint64_t v39 = v58;
              sub_1BA2C8128(v12, v15, v14, (BOOL *)__s1);
              sub_1BA2BD220(v15, v14);
              uint64_t v58 = v39;
              if (v39) {
                goto LABEL_124;
              }
              swift_release();
              swift_release();
              char v37 = __s1[0];
              sub_1BA2BD220(v15, v14);
LABEL_58:
              sub_1BA2BD220(v15, v14);
              a2 = v59;
              if ((v37 & 1) == 0) {
                goto LABEL_101;
              }
              goto LABEL_77;
            case 3uLL:
              memset(__s1, 0, 14);
              if (!v19) {
                goto LABEL_52;
              }
              if (v19 == 1)
              {
                if (v24 < (int)v15) {
                  goto LABEL_113;
                }
                sub_1BA2BD1B4(v15, v14);
                unint64_t v12 = sub_1BA2D9898();
                if (v12)
                {
                  uint64_t v31 = sub_1BA2D98B8();
                  if (__OFSUB__((int)v15, v31)) {
                    goto LABEL_119;
                  }
                  v12 += (int)v15 - v31;
                }
                uint64_t v26 = sub_1BA2D98A8();
                if (!v12) {
                  goto LABEL_121;
                }
LABEL_41:
                if (v26 >= v24 - (int)v15) {
                  size_t v32 = v24 - (int)v15;
                }
                else {
                  size_t v32 = v26;
                }
                int v33 = memcmp(__s1, (const void *)v12, v32);
                sub_1BA2BD220(v15, v14);
                a2 = v59;
                if (v33) {
                  goto LABEL_101;
                }
              }
              else
              {
                uint64_t v44 = *(void *)(v15 + 16);
                uint64_t v13 = *(void *)(v15 + 24);
                sub_1BA2BD1B4(v15, v14);
                swift_retain();
                swift_retain();
                uint64_t v45 = sub_1BA2D9898();
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = sub_1BA2D98B8();
                  if (__OFSUB__(v44, v47)) {
                    goto LABEL_117;
                  }
                  unint64_t v12 = v46 + v44 - v47;
                }
                else
                {
                  unint64_t v12 = 0;
                }
                int64_t v48 = v13 - v44;
                if (__OFSUB__(v13, v44)) {
                  goto LABEL_114;
                }
                uint64_t v49 = sub_1BA2D98A8();
                a2 = v59;
                if (!v12)
                {
                  __break(1u);
LABEL_121:
                  __break(1u);
LABEL_122:
                  __break(1u);
LABEL_123:
                  __break(1u);
LABEL_124:
                  sub_1BA2BD220(v15, v14);
                  sub_1BA2BD220(v15, v14);
                  swift_release();
                  swift_release();
                  __break(1u);
LABEL_125:
                  sub_1BA2BD220(v15, v14);
                  sub_1BA2BD220(v15, v14);
                  sub_1BA2BD220(v13, v12);
                  __break(1u);
                  JUMPOUT(0x1BA2C6BD8);
                }
LABEL_73:
                if (v49 >= v48) {
                  size_t v50 = v48;
                }
                else {
                  size_t v50 = v49;
                }
                int v51 = memcmp(__s1, (const void *)v12, v50);
                swift_release();
                swift_release();
                sub_1BA2BD220(v15, v14);
                if (v51) {
                  goto LABEL_101;
                }
              }
LABEL_77:
              uint64_t v52 = *((void *)v9 + 3);
              uint64_t v53 = *((void *)v6 + 3);
              if (v6[32] == 1)
              {
                switch(v53)
                {
                  case 1:
                    if (v52 != 1) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  case 2:
                    if (v52 != 2) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  case 3:
                    if (v52 != 3) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  case 4:
                    if (v52 != 4) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  case 5:
                    if (v52 != 5) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  case 6:
                    if (v52 != 6) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                  default:
                    if (v52) {
                      goto LABEL_101;
                    }
                    goto LABEL_82;
                }
              }
              if (v52 != v53) {
                goto LABEL_101;
              }
LABEL_82:
              BOOL v54 = *((void *)v9 + 5) == *((void *)v6 + 5) && *((void *)v9 + 6) == *((void *)v6 + 6);
              if (!v54 && (sub_1BA2D9DB8() & 1) == 0) {
                goto LABEL_101;
              }
              sub_1BA2D9968();
              sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
              if ((sub_1BA2D9BF8() & 1) == 0) {
                goto LABEL_101;
              }
              sub_1BA2C6268((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
              sub_1BA2C6268((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
              a1 = v61;
              v11 += v60;
              uint64_t v10 = v63 - 1;
              if (v63 == 1) {
                return 1;
              }
              break;
            default:
              LOWORD(__s1[0]) = *((void *)v9 + 1);
              BYTE2(__s1[0]) = BYTE2(v13);
              BYTE3(__s1[0]) = BYTE3(v13);
              BYTE4(__s1[0]) = BYTE4(v13);
              BYTE5(__s1[0]) = BYTE5(v13);
              BYTE6(__s1[0]) = BYTE6(v13);
              HIBYTE(__s1[0]) = HIBYTE(v13);
              LOWORD(__s1[1]) = v12;
              BYTE2(__s1[1]) = BYTE2(v12);
              BYTE3(__s1[1]) = BYTE3(v12);
              BYTE4(__s1[1]) = BYTE4(v12);
              BYTE5(__s1[1]) = BYTE5(v12);
              if (!v19)
              {
LABEL_52:
                uint64_t __s2 = v15;
                __int16 v65 = v14;
                char v66 = BYTE2(v14);
                char v67 = BYTE3(v14);
                char v68 = BYTE4(v14);
                char v69 = BYTE5(v14);
                int v38 = memcmp(__s1, &__s2, BYTE6(v14));
                a2 = v59;
                if (v38) {
                  goto LABEL_101;
                }
                goto LABEL_77;
              }
              if (v19 == 1)
              {
                if (v24 < (int)v15) {
                  goto LABEL_112;
                }
                sub_1BA2BD1B4(v15, v14);
                unint64_t v12 = sub_1BA2D9898();
                if (v12)
                {
                  uint64_t v25 = sub_1BA2D98B8();
                  if (__OFSUB__((int)v15, v25)) {
                    goto LABEL_118;
                  }
                  v12 += (int)v15 - v25;
                }
                uint64_t v26 = sub_1BA2D98A8();
                if (!v12) {
                  goto LABEL_122;
                }
                goto LABEL_41;
              }
              uint64_t v40 = *(void *)(v15 + 16);
              uint64_t v13 = *(void *)(v15 + 24);
              sub_1BA2BD1B4(v15, v14);
              swift_retain();
              swift_retain();
              uint64_t v41 = sub_1BA2D9898();
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = sub_1BA2D98B8();
                if (__OFSUB__(v40, v43)) {
                  goto LABEL_116;
                }
                unint64_t v12 = v42 + v40 - v43;
              }
              else
              {
                unint64_t v12 = 0;
              }
              int64_t v48 = v13 - v40;
              if (__OFSUB__(v13, v40)) {
                goto LABEL_115;
              }
              uint64_t v49 = sub_1BA2D98A8();
              a2 = v59;
              if (!v12) {
                goto LABEL_123;
              }
              goto LABEL_73;
          }
          break;
        case 2uLL:
          uint64_t v18 = *(void *)(v13 + 16);
          uint64_t v17 = *(void *)(v13 + 24);
          uint64_t v16 = v17 - v18;
          if (!__OFSUB__(v17, v18)) {
            goto LABEL_11;
          }
          goto LABEL_105;
        case 3uLL:
          goto LABEL_11;
        default:
          uint64_t v16 = BYTE6(v12);
          goto LABEL_11;
      }
    }
LABEL_101:
    sub_1BA2C6268((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    sub_1BA2C6268((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    return 0;
  }
  return 1;
}

uint64_t sub_1BA2C6C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0) - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v5);
  uint64_t v10 = (uint64_t *)((char *)&v19 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_1BA2C8488(a1 + v12, (uint64_t)v10);
        sub_1BA2C8488(a2 + v12, (uint64_t)v7);
        char v15 = sub_1BA2C0B58(v10, v7);
        sub_1BA2C6268((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        sub_1BA2C6268((uint64_t)v10, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1BA2C6DC4(uint64_t a1, uint64_t a2)
{
  __s1[3] = *MEMORY[0x1E4F143B8];
  uint64_t v100 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  uint64_t v4 = MEMORY[0x1F4188790](v100);
  uint64_t v6 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v9 = (uint64_t *)((char *)&v94 - v8);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 != *(void *)(a2 + 16))
  {
LABEL_165:
    char v92 = 0;
    return v92 & 1;
  }
  if (v10 && a1 != a2)
  {
    uint64_t v96 = 0;
    uint64_t v97 = a2;
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v98 = *(void *)(v7 + 72);
    uint64_t v99 = a1;
    uint64_t v12 = v10 - 1;
    while (1)
    {
      sub_1BA2C8488(a1 + v11, (uint64_t)v9);
      sub_1BA2C8488(a2 + v11, (uint64_t)v6);
      uint64_t v13 = *v9;
      uint64_t v14 = *(void *)v6;
      int v15 = v6[8];
      uint64_t v101 = v12;
      if (v15 == 1)
      {
        if (v14)
        {
          if (v14 == 1)
          {
            if (v13 != 1) {
              break;
            }
          }
          else if (v13 != 2)
          {
            break;
          }
        }
        else if (v13)
        {
          break;
        }
      }
      else if (v13 != v14)
      {
        break;
      }
      BOOL v16 = v9[2] == *((void *)v6 + 2) && v9[3] == *((void *)v6 + 3);
      if (!v16 && (sub_1BA2D9DB8() & 1) == 0) {
        break;
      }
      uint64_t v18 = v9[4];
      unint64_t v17 = v9[5];
      uint64_t v20 = *((void *)v6 + 4);
      unint64_t v19 = *((void *)v6 + 5);
      uint64_t v21 = 0;
      switch(v17 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v18), v18)) {
            goto LABEL_168;
          }
          uint64_t v21 = HIDWORD(v18) - (int)v18;
LABEL_25:
          unint64_t v24 = v19 >> 62;
          switch(v19 >> 62)
          {
            case 1uLL:
              LODWORD(v25) = HIDWORD(v20) - v20;
              if (__OFSUB__(HIDWORD(v20), v20)) {
                goto LABEL_169;
              }
              uint64_t v25 = (int)v25;
LABEL_34:
              if (v21 != v25) {
                goto LABEL_164;
              }
              if (v21 < 1) {
                goto LABEL_91;
              }
              break;
            case 2uLL:
              uint64_t v27 = *(void *)(v20 + 16);
              uint64_t v26 = *(void *)(v20 + 24);
              BOOL v28 = __OFSUB__(v26, v27);
              uint64_t v25 = v26 - v27;
              if (!v28) {
                goto LABEL_34;
              }
              goto LABEL_170;
            case 3uLL:
              if (v21) {
                goto LABEL_164;
              }
              goto LABEL_91;
            default:
              uint64_t v25 = BYTE6(v19);
              goto LABEL_34;
          }
          break;
        case 2uLL:
          uint64_t v23 = *(void *)(v18 + 16);
          uint64_t v22 = *(void *)(v18 + 24);
          uint64_t v21 = v22 - v23;
          if (!__OFSUB__(v22, v23)) {
            goto LABEL_25;
          }
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
          goto LABEL_176;
        case 3uLL:
          goto LABEL_25;
        default:
          uint64_t v21 = BYTE6(v17);
          goto LABEL_25;
      }
      uint64_t v29 = v20 >> 32;
      switch(v17 >> 62)
      {
        case 1uLL:
          if (v18 >> 32 < (int)v18) {
            goto LABEL_175;
          }
          unint64_t v95 = v11;
          sub_1BA2BD1B4(v20, v19);
          sub_1BA2BD1B4(v20, v19);
          sub_1BA2BD1B4(v20, v19);
          sub_1BA2BD1B4(v18, v17);
          uint64_t v40 = sub_1BA2D9898();
          if (!v40) {
            goto LABEL_64;
          }
          uint64_t v41 = sub_1BA2D98B8();
          if (__OFSUB__((int)v18, v41)) {
            goto LABEL_180;
          }
          v40 += (int)v18 - v41;
LABEL_64:
          sub_1BA2D98A8();
          uint64_t v42 = v96;
          sub_1BA2C8128(v40, v20, v19, (BOOL *)__s1);
          sub_1BA2BD220(v20, v19);
          uint64_t v96 = v42;
          if (v42) {
            goto LABEL_207;
          }
          sub_1BA2BD220(v18, v17);
          sub_1BA2BD220(v20, v19);
          char v43 = __s1[0];
          sub_1BA2BD220(v20, v19);
          a2 = v97;
          unint64_t v11 = v95;
          if ((v43 & 1) == 0) {
            goto LABEL_164;
          }
          goto LABEL_91;
        case 2uLL:
          uint64_t v32 = *(void *)(v18 + 16);
          unint64_t v95 = *(void *)(v18 + 24);
          sub_1BA2BD1B4(v20, v19);
          sub_1BA2BD1B4(v20, v19);
          sub_1BA2BD1B4(v20, v19);
          swift_retain();
          swift_retain();
          uint64_t v33 = sub_1BA2D9898();
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = sub_1BA2D98B8();
            if (__OFSUB__(v32, v35)) {
              goto LABEL_179;
            }
            uint64_t v36 = v34 + v32 - v35;
          }
          else
          {
            uint64_t v36 = 0;
          }
          if (__OFSUB__(v95, v32))
          {
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
LABEL_184:
            __break(1u);
LABEL_185:
            __break(1u);
LABEL_186:
            __break(1u);
LABEL_187:
            __break(1u);
LABEL_188:
            __break(1u);
LABEL_189:
            __break(1u);
LABEL_190:
            __break(1u);
LABEL_191:
            __break(1u);
LABEL_192:
            __break(1u);
LABEL_193:
            __break(1u);
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
          }
          sub_1BA2D98A8();
          uint64_t v45 = v96;
          sub_1BA2C8128(v36, v20, v19, (BOOL *)__s1);
          sub_1BA2BD220(v20, v19);
          uint64_t v96 = v45;
          if (v45) {
            goto LABEL_208;
          }
          swift_release();
          swift_release();
          char v46 = __s1[0];
          sub_1BA2BD220(v20, v19);
          sub_1BA2BD220(v20, v19);
          a2 = v97;
          if ((v46 & 1) == 0) {
            goto LABEL_164;
          }
LABEL_91:
          uint64_t v18 = v9[6];
          unint64_t v17 = v9[7];
          uint64_t v20 = *((void *)v6 + 6);
          unint64_t v19 = *((void *)v6 + 7);
          uint64_t v59 = 0;
          switch(v17 >> 62)
          {
            case 1uLL:
              if (__OFSUB__(HIDWORD(v18), v18)) {
                goto LABEL_171;
              }
              uint64_t v59 = HIDWORD(v18) - (int)v18;
LABEL_96:
              unint64_t v62 = v19 >> 62;
              switch(v19 >> 62)
              {
                case 1uLL:
                  LODWORD(v63) = HIDWORD(v20) - v20;
                  if (__OFSUB__(HIDWORD(v20), v20)) {
                    goto LABEL_174;
                  }
                  uint64_t v63 = (int)v63;
LABEL_105:
                  if (v59 != v63) {
                    goto LABEL_164;
                  }
                  if (v59 < 1) {
                    goto LABEL_160;
                  }
                  break;
                case 2uLL:
                  uint64_t v65 = *(void *)(v20 + 16);
                  uint64_t v64 = *(void *)(v20 + 24);
                  BOOL v28 = __OFSUB__(v64, v65);
                  uint64_t v63 = v64 - v65;
                  if (!v28) {
                    goto LABEL_105;
                  }
                  goto LABEL_173;
                case 3uLL:
                  if (v59) {
                    goto LABEL_164;
                  }
                  goto LABEL_160;
                default:
                  uint64_t v63 = BYTE6(v19);
                  goto LABEL_105;
              }
              break;
            case 2uLL:
              uint64_t v61 = *(void *)(v18 + 16);
              uint64_t v60 = *(void *)(v18 + 24);
              uint64_t v59 = v60 - v61;
              if (!__OFSUB__(v60, v61)) {
                goto LABEL_96;
              }
              goto LABEL_172;
            case 3uLL:
              goto LABEL_96;
            default:
              uint64_t v59 = BYTE6(v17);
              goto LABEL_96;
          }
          uint64_t v66 = v20 >> 32;
          switch(v17 >> 62)
          {
            case 1uLL:
              if (v18 >> 32 < (int)v18) {
                goto LABEL_177;
              }
              unint64_t v95 = v11;
              sub_1BA2BD1B4(v20, v19);
              sub_1BA2BD1B4(v20, v19);
              sub_1BA2BD1B4(v20, v19);
              sub_1BA2BD1B4(v18, v17);
              uint64_t v77 = sub_1BA2D9898();
              if (!v77) {
                goto LABEL_134;
              }
              uint64_t v78 = sub_1BA2D98B8();
              if (__OFSUB__((int)v18, v78)) {
                goto LABEL_182;
              }
              v77 += (int)v18 - v78;
LABEL_134:
              sub_1BA2D98A8();
              uint64_t v79 = v96;
              sub_1BA2C8128(v77, v20, v19, (BOOL *)__s1);
              sub_1BA2BD220(v20, v19);
              uint64_t v96 = v79;
              if (v79) {
                goto LABEL_207;
              }
              sub_1BA2BD220(v18, v17);
              sub_1BA2BD220(v20, v19);
              char v80 = __s1[0];
              sub_1BA2BD220(v20, v19);
              a2 = v97;
              unint64_t v11 = v95;
              if ((v80 & 1) == 0) {
                goto LABEL_164;
              }
              goto LABEL_160;
            case 2uLL:
              uint64_t v69 = *(void *)(v18 + 16);
              unint64_t v95 = *(void *)(v18 + 24);
              sub_1BA2BD1B4(v20, v19);
              sub_1BA2BD1B4(v20, v19);
              sub_1BA2BD1B4(v20, v19);
              swift_retain();
              swift_retain();
              uint64_t v70 = sub_1BA2D9898();
              if (v70)
              {
                uint64_t v71 = v70;
                uint64_t v72 = sub_1BA2D98B8();
                if (__OFSUB__(v69, v72)) {
                  goto LABEL_181;
                }
                uint64_t v73 = v71 + v69 - v72;
              }
              else
              {
                uint64_t v73 = 0;
              }
              if (__OFSUB__(v95, v69)) {
                goto LABEL_178;
              }
              sub_1BA2D98A8();
              uint64_t v82 = v96;
              sub_1BA2C8128(v73, v20, v19, (BOOL *)__s1);
              sub_1BA2BD220(v20, v19);
              uint64_t v96 = v82;
              if (v82) {
                goto LABEL_208;
              }
              swift_release();
              swift_release();
              char v83 = __s1[0];
              sub_1BA2BD220(v20, v19);
              sub_1BA2BD220(v20, v19);
              a2 = v97;
              if ((v83 & 1) == 0) {
                goto LABEL_164;
              }
              goto LABEL_160;
            case 3uLL:
              memset(__s1, 0, 14);
              if (!v62) {
                goto LABEL_137;
              }
              if (v62 == 1)
              {
                if (v66 < (int)v20) {
                  goto LABEL_187;
                }
                sub_1BA2BD1B4(v20, v19);
                unint64_t v17 = sub_1BA2D9898();
                if (v17)
                {
                  uint64_t v74 = sub_1BA2D98B8();
                  if (__OFSUB__((int)v20, v74)) {
                    goto LABEL_197;
                  }
                  v17 += (int)v20 - v74;
                }
                uint64_t v68 = sub_1BA2D98A8();
                if (!v17) {
                  goto LABEL_205;
                }
LABEL_126:
                if (v68 >= v66 - (int)v20) {
                  size_t v75 = v66 - (int)v20;
                }
                else {
                  size_t v75 = v68;
                }
                int v76 = memcmp(__s1, (const void *)v17, v75);
              }
              else
              {
                uint64_t v89 = *(void *)(v20 + 16);
                unint64_t v17 = *(void *)(v20 + 24);
                sub_1BA2BD1B4(v20, v19);
                swift_retain();
                swift_retain();
                v85 = (char *)sub_1BA2D9898();
                if (v85)
                {
                  uint64_t v90 = sub_1BA2D98B8();
                  if (__OFSUB__(v89, v90)) {
                    goto LABEL_195;
                  }
                  v85 += v89 - v90;
                }
                BOOL v28 = __OFSUB__(v17, v89);
                int64_t v87 = v17 - v89;
                if (v28) {
                  goto LABEL_189;
                }
                uint64_t v88 = sub_1BA2D98A8();
                if (!v85) {
                  goto LABEL_206;
                }
LABEL_155:
                if (v88 >= v87) {
                  size_t v91 = v87;
                }
                else {
                  size_t v91 = v88;
                }
                int v76 = memcmp(__s1, v85, v91);
                swift_release();
                swift_release();
              }
              sub_1BA2BD220(v20, v19);
              a2 = v97;
              if (v76) {
                goto LABEL_164;
              }
LABEL_160:
              sub_1BA2D9968();
              sub_1BA2C4FB8(&qword_1E9F41380, MEMORY[0x1E4F70E60]);
              char v92 = sub_1BA2D9BF8();
              sub_1BA2C6268((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
              sub_1BA2C6268((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
              uint64_t v12 = v101 - 1;
              if ((v92 & 1) == 0) {
                return v92 & 1;
              }
              a1 = v99;
              v11 += v98;
              if (!v101) {
                return v92 & 1;
              }
              break;
            default:
              LOWORD(__s1[0]) = v9[6];
              BYTE2(__s1[0]) = BYTE2(v18);
              BYTE3(__s1[0]) = BYTE3(v18);
              BYTE4(__s1[0]) = BYTE4(v18);
              BYTE5(__s1[0]) = BYTE5(v18);
              BYTE6(__s1[0]) = BYTE6(v18);
              HIBYTE(__s1[0]) = HIBYTE(v18);
              LOWORD(__s1[1]) = v17;
              BYTE2(__s1[1]) = BYTE2(v17);
              BYTE3(__s1[1]) = BYTE3(v17);
              BYTE4(__s1[1]) = BYTE4(v17);
              BYTE5(__s1[1]) = BYTE5(v17);
              if (!v62)
              {
LABEL_137:
                uint64_t __s2 = v20;
                __int16 v103 = v19;
                char v104 = BYTE2(v19);
                char v105 = BYTE3(v19);
                char v106 = BYTE4(v19);
                char v107 = BYTE5(v19);
                int v81 = memcmp(__s1, &__s2, BYTE6(v19));
                a2 = v97;
                if (v81) {
                  goto LABEL_164;
                }
                goto LABEL_160;
              }
              if (v62 == 1)
              {
                if (v66 < (int)v20) {
                  goto LABEL_188;
                }
                sub_1BA2BD1B4(v20, v19);
                unint64_t v17 = sub_1BA2D9898();
                if (v17)
                {
                  uint64_t v67 = sub_1BA2D98B8();
                  if (__OFSUB__((int)v20, v67)) {
                    goto LABEL_198;
                  }
                  v17 += (int)v20 - v67;
                }
                uint64_t v68 = sub_1BA2D98A8();
                if (!v17) {
                  goto LABEL_204;
                }
                goto LABEL_126;
              }
              uint64_t v84 = *(void *)(v20 + 16);
              unint64_t v17 = *(void *)(v20 + 24);
              sub_1BA2BD1B4(v20, v19);
              swift_retain();
              swift_retain();
              v85 = (char *)sub_1BA2D9898();
              if (v85)
              {
                uint64_t v86 = sub_1BA2D98B8();
                if (__OFSUB__(v84, v86)) {
                  goto LABEL_196;
                }
                v85 += v84 - v86;
              }
              BOOL v28 = __OFSUB__(v17, v84);
              int64_t v87 = v17 - v84;
              if (v28) {
                goto LABEL_190;
              }
              uint64_t v88 = sub_1BA2D98A8();
              if (!v85) {
                goto LABEL_203;
              }
              goto LABEL_155;
          }
          break;
        case 3uLL:
          memset(__s1, 0, 14);
          if (!v24) {
            goto LABEL_67;
          }
          if (v24 == 1)
          {
            if (v29 < (int)v20) {
              goto LABEL_184;
            }
            sub_1BA2BD1B4(v20, v19);
            unint64_t v17 = sub_1BA2D9898();
            if (v17)
            {
              uint64_t v37 = sub_1BA2D98B8();
              if (__OFSUB__((int)v20, v37)) {
                goto LABEL_193;
              }
              v17 += (int)v20 - v37;
            }
            uint64_t v31 = sub_1BA2D98A8();
            if (!v17)
            {
              __break(1u);
LABEL_200:
              __break(1u);
LABEL_201:
              __break(1u);
LABEL_202:
              __break(1u);
LABEL_203:
              __break(1u);
LABEL_204:
              __break(1u);
LABEL_205:
              __break(1u);
LABEL_206:
              __break(1u);
LABEL_207:
              sub_1BA2BD220(v20, v19);
              sub_1BA2BD220(v20, v19);
              sub_1BA2BD220(v18, v17);
              __break(1u);
LABEL_208:
              sub_1BA2BD220(v20, v19);
              sub_1BA2BD220(v20, v19);
              swift_release();
              swift_release();
              __break(1u);
              JUMPOUT(0x1BA2C7C44);
            }
LABEL_55:
            if (v31 >= v29 - (int)v20) {
              size_t v38 = v29 - (int)v20;
            }
            else {
              size_t v38 = v31;
            }
            int v39 = memcmp(__s1, (const void *)v17, v38);
            sub_1BA2BD220(v20, v19);
            a2 = v97;
            if (v39) {
              goto LABEL_164;
            }
          }
          else
          {
            uint64_t v47 = *(void *)(v20 + 16);
            uint64_t v18 = *(void *)(v20 + 24);
            sub_1BA2BD1B4(v20, v19);
            swift_retain();
            swift_retain();
            uint64_t v48 = sub_1BA2D9898();
            if (v48)
            {
              uint64_t v49 = v48;
              uint64_t v50 = sub_1BA2D98B8();
              if (__OFSUB__(v47, v50)) {
                goto LABEL_191;
              }
              unint64_t v17 = v49 + v47 - v50;
            }
            else
            {
              unint64_t v17 = 0;
            }
            int64_t v55 = v18 - v47;
            if (__OFSUB__(v18, v47)) {
              goto LABEL_186;
            }
            uint64_t v56 = sub_1BA2D98A8();
            a2 = v97;
            if (!v17) {
              goto LABEL_200;
            }
LABEL_87:
            if (v56 >= v55) {
              size_t v57 = v55;
            }
            else {
              size_t v57 = v56;
            }
            int v58 = memcmp(__s1, (const void *)v17, v57);
            swift_release();
            swift_release();
            sub_1BA2BD220(v20, v19);
            if (v58) {
              goto LABEL_164;
            }
          }
          goto LABEL_91;
        default:
          LOWORD(__s1[0]) = v9[4];
          BYTE2(__s1[0]) = BYTE2(v18);
          BYTE3(__s1[0]) = BYTE3(v18);
          BYTE4(__s1[0]) = BYTE4(v18);
          BYTE5(__s1[0]) = BYTE5(v18);
          BYTE6(__s1[0]) = BYTE6(v18);
          HIBYTE(__s1[0]) = HIBYTE(v18);
          LOWORD(__s1[1]) = v17;
          BYTE2(__s1[1]) = BYTE2(v17);
          BYTE3(__s1[1]) = BYTE3(v17);
          BYTE4(__s1[1]) = BYTE4(v17);
          BYTE5(__s1[1]) = BYTE5(v17);
          if (!v24)
          {
LABEL_67:
            uint64_t __s2 = v20;
            __int16 v103 = v19;
            char v104 = BYTE2(v19);
            char v105 = BYTE3(v19);
            char v106 = BYTE4(v19);
            char v107 = BYTE5(v19);
            int v44 = memcmp(__s1, &__s2, BYTE6(v19));
            a2 = v97;
            if (v44) {
              goto LABEL_164;
            }
            goto LABEL_91;
          }
          if (v24 == 1)
          {
            if (v29 < (int)v20) {
              goto LABEL_183;
            }
            sub_1BA2BD1B4(v20, v19);
            unint64_t v17 = sub_1BA2D9898();
            if (v17)
            {
              uint64_t v30 = sub_1BA2D98B8();
              if (__OFSUB__((int)v20, v30)) {
                goto LABEL_194;
              }
              v17 += (int)v20 - v30;
            }
            uint64_t v31 = sub_1BA2D98A8();
            if (!v17) {
              goto LABEL_201;
            }
            goto LABEL_55;
          }
          uint64_t v51 = *(void *)(v20 + 16);
          uint64_t v18 = *(void *)(v20 + 24);
          sub_1BA2BD1B4(v20, v19);
          swift_retain();
          swift_retain();
          uint64_t v52 = sub_1BA2D9898();
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = sub_1BA2D98B8();
            if (__OFSUB__(v51, v54)) {
              goto LABEL_192;
            }
            unint64_t v17 = v53 + v51 - v54;
          }
          else
          {
            unint64_t v17 = 0;
          }
          int64_t v55 = v18 - v51;
          if (__OFSUB__(v18, v51)) {
            goto LABEL_185;
          }
          uint64_t v56 = sub_1BA2D98A8();
          a2 = v97;
          if (!v17) {
            goto LABEL_202;
          }
          goto LABEL_87;
      }
    }
LABEL_164:
    sub_1BA2C6268((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1BA2C6268((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    goto LABEL_165;
  }
  char v92 = 1;
  return v92 & 1;
}

uint64_t sub_1BA2C7CA4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v26 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v26) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v26) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v26) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v26) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_24:
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    unint64_t v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v10);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_1BA2C7EC0(v15, v16);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v23 = (void *)(*(void *)(a2 + 56) + 16 * v20);
    if (*v23 == v19 && v23[1] == v18)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_1BA2D9DB8();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v26) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v26) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1BA2C7EC0(uint64_t a1, uint64_t a2)
{
  sub_1BA2D9DC8();
  sub_1BA2D9C38();
  uint64_t v4 = sub_1BA2D9DD8();
  return sub_1BA2C7F7C(a1, a2, v4);
}

unint64_t sub_1BA2C7F38(uint64_t a1)
{
  uint64_t v2 = sub_1BA2D9D48();
  return sub_1BA2C8060(a1, v2);
}

unint64_t sub_1BA2C7F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BA2D9DB8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1BA2D9DB8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BA2C8060(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1BA2C8524(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1BA9E8430](v9, a1);
      sub_1BA2BE240((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1BA2C8128@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, BOOL *a4@<X8>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = v4;
  uint64_t v7 = a3;
  uint64_t v9 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (a2 >> 32 < (int)a2) {
        __break(1u);
      }
      swift_retain();
      char v14 = sub_1BA2C8350((int)a2, a2 >> 32, v7 & 0x3FFFFFFFFFFFFFFFLL, v9);
      if (v6) {
        goto LABEL_16;
      }
      BOOL v10 = v14;
      __s1 = sub_1BA2BD220(a2, v7);
      break;
    case 2uLL:
      uint64_t v7 = a3 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a2 + 16);
      uint64_t v12 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      char v13 = sub_1BA2C8350(v11, v12, v7, v9);
      if (v6) {
        goto LABEL_15;
      }
      BOOL v10 = v13;
      swift_release();
      __s1 = swift_release();
      break;
    case 3uLL:
      if (!__s1) {
        goto LABEL_14;
      }
      BOOL v10 = 1;
      break;
    default:
      uint64_t __s2 = a2;
      __int16 v16 = a3;
      char v17 = BYTE2(a3);
      char v18 = BYTE3(a3);
      char v19 = BYTE4(a3);
      char v20 = BYTE5(a3);
      if (!__s1)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        swift_release();
        swift_release();
        __break(1u);
LABEL_16:
        sub_1BA2BD220(a2, v7);
        __break(1u);
        JUMPOUT(0x1BA2C8340);
      }
      __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
      BOOL v10 = __s1 == 0;
      break;
  }
  *a4 = v10;
  return __s1;
}

uint64_t sub_1BA2C8350(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t result = sub_1BA2D9898();
  unint64_t v8 = (char *)result;
  if (result)
  {
    uint64_t result = sub_1BA2D98B8();
    if (__OFSUB__(a1, result))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    v8 += a1 - result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  int64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t result = sub_1BA2D98A8();
  if (!a4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (result >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = result;
  }
  return memcmp(a4, v8, v11) == 0;
}

unint64_t sub_1BA2C83F0()
{
  unint64_t result = qword_1E9F41500;
  if (!qword_1E9F41500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41500);
  }
  return result;
}

unint64_t sub_1BA2C843C()
{
  unint64_t result = qword_1E9F41510;
  if (!qword_1E9F41510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41510);
  }
  return result;
}

uint64_t sub_1BA2C8488(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_47();
  v4(v3);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = OUTLINED_FUNCTION_45();
  v6(v5);
  return a2;
}

unint64_t sub_1BA2C84D8()
{
  unint64_t result = qword_1E9F41528;
  if (!qword_1E9F41528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41528);
  }
  return result;
}

uint64_t sub_1BA2C8524(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1BA2C8580()
{
  unint64_t result = qword_1E9F41530;
  if (!qword_1E9F41530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F41530);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t sub_1BA2C85E0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BA2C8600(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1BA2C8630(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1BA2C864C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_PayloadType()
{
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventErrorCode()
{
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_PublishStatus()
{
}

uint64_t *sub_1BA2C8690(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    BOOL v9 = (char *)a1 + v8;
    int64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1BA2D9968();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    char v14 = (uint64_t *)((char *)v7 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      *char v14 = *v15;
      *((unsigned char *)v14 + 8) = *((unsigned char *)v15 + 8);
      uint64_t v18 = v15[3];
      v14[2] = v15[2];
      v14[3] = v18;
      uint64_t v19 = v15[4];
      unint64_t v20 = v15[5];
      swift_bridgeObjectRetain();
      sub_1BA2BD1B4(v19, v20);
      v14[4] = v19;
      v14[5] = v20;
      uint64_t v21 = v15[6];
      unint64_t v22 = v15[7];
      sub_1BA2BD1B4(v21, v22);
      v14[6] = v21;
      v14[7] = v22;
      v12((char *)v14 + *(int *)(v16 + 32), (char *)v15 + *(int *)(v16 + 32), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
    uint64_t v23 = a3[7];
    unint64_t v24 = (uint64_t *)((char *)v7 + v23);
    char v25 = (uint64_t *)((char *)a2 + v23);
    uint64_t v26 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      uint64_t v28 = v25[1];
      void *v24 = *v25;
      v24[1] = v28;
      uint64_t v29 = v25[3];
      v24[2] = v25[2];
      unint64_t v30 = v25[4];
      swift_bridgeObjectRetain();
      sub_1BA2BD1B4(v29, v30);
      v24[3] = v29;
      v24[4] = v30;
      uint64_t v31 = v25[6];
      v24[5] = v25[5];
      v24[6] = v31;
      uint64_t v32 = v25[8];
      v24[7] = v25[7];
      v24[8] = v32;
      uint64_t v33 = v25[10];
      v24[9] = v25[9];
      v24[10] = v33;
      v24[11] = v25[11];
      uint64_t v34 = *(int *)(v26 + 44);
      uint64_t v35 = (char *)v24 + v34;
      uint64_t v36 = (char *)v25 + v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v35, v36, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
  }
  return v7;
}

uint64_t sub_1BA2C8968(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v12(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    sub_1BA2BD220(*(void *)(v6 + 32), *(void *)(v6 + 40));
    sub_1BA2BD220(*(void *)(v6 + 48), *(void *)(v6 + 56));
    v12(v6 + *(int *)(v7 + 32), v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v8, 1, v9);
  if (!result)
  {
    swift_bridgeObjectRelease();
    sub_1BA2BD220(*(void *)(v8 + 24), *(void *)(v8 + 32));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = v8 + *(int *)(v9 + 44);
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v5);
  }
  return result;
}

void *sub_1BA2C8AE8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BA2D9968();
  int64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    *((unsigned char *)v12 + 8) = *((unsigned char *)v13 + 8);
    uint64_t v16 = v13[3];
    v12[2] = v13[2];
    void v12[3] = v16;
    uint64_t v17 = v13[4];
    unint64_t v18 = v13[5];
    swift_bridgeObjectRetain();
    sub_1BA2BD1B4(v17, v18);
    v12[4] = v17;
    v12[5] = v18;
    uint64_t v19 = v13[6];
    unint64_t v20 = v13[7];
    sub_1BA2BD1B4(v19, v20);
    v12[6] = v19;
    v12[7] = v20;
    v10((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v21 = a3[7];
  unint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
    memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    uint64_t v26 = v23[1];
    *unint64_t v22 = *v23;
    v22[1] = v26;
    uint64_t v27 = v23[3];
    v22[2] = v23[2];
    unint64_t v28 = v23[4];
    swift_bridgeObjectRetain();
    sub_1BA2BD1B4(v27, v28);
    v22[3] = v27;
    v22[4] = v28;
    uint64_t v29 = v23[6];
    v22[5] = v23[5];
    v22[6] = v29;
    uint64_t v30 = v23[8];
    v22[7] = v23[7];
    v22[8] = v30;
    uint64_t v31 = v23[10];
    v22[9] = v23[9];
    v22[10] = v31;
    v22[11] = v23[11];
    uint64_t v32 = *(int *)(v24 + 44);
    uint64_t v33 = (char *)v22 + v32;
    uint64_t v34 = (char *)v23 + v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v33, v34, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
  }
  return a1;
}

void *sub_1BA2C8D74(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BA2D9968();
  uint64_t v55 = *(void *)(v9 - 8);
  int64_t v10 = *(void (**)(char *, char *, uint64_t))(v55 + 24);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t)a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v12, 1, v14);
  int v16 = __swift_getEnumTagSinglePayload(v13, 1, v14);
  if (EnumTagSinglePayload)
  {
    if (!v16)
    {
      uint64_t v17 = *(void *)v13;
      *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
      *(void *)uint64_t v12 = v17;
      *(void *)(v12 + 16) = *(void *)(v13 + 16);
      *(void *)(v12 + 24) = *(void *)(v13 + 24);
      uint64_t v52 = v10;
      uint64_t v18 = v9;
      uint64_t v19 = *(void *)(v13 + 32);
      unint64_t v20 = *(void *)(v13 + 40);
      swift_bridgeObjectRetain();
      sub_1BA2BD1B4(v19, v20);
      *(void *)(v12 + 32) = v19;
      *(void *)(v12 + 40) = v20;
      uint64_t v21 = *(void *)(v13 + 48);
      unint64_t v22 = *(void *)(v13 + 56);
      sub_1BA2BD1B4(v21, v22);
      *(void *)(v12 + 48) = v21;
      *(void *)(v12 + 56) = v22;
      uint64_t v9 = v18;
      int64_t v10 = v52;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v12 + *(int *)(v14 + 32), v13 + *(int *)(v14 + 32), v9);
      __swift_storeEnumTagSinglePayload(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_1BA2C6268(v12, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
    memcpy((void *)v12, (const void *)v13, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v38 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = v38;
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  *(void *)(v12 + 24) = *(void *)(v13 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = v10;
  uint64_t v39 = v9;
  uint64_t v40 = *(void *)(v13 + 32);
  unint64_t v41 = *(void *)(v13 + 40);
  sub_1BA2BD1B4(v40, v41);
  uint64_t v42 = *(void *)(v12 + 32);
  unint64_t v43 = *(void *)(v12 + 40);
  *(void *)(v12 + 32) = v40;
  *(void *)(v12 + 40) = v41;
  sub_1BA2BD220(v42, v43);
  uint64_t v44 = *(void *)(v13 + 48);
  unint64_t v45 = *(void *)(v13 + 56);
  sub_1BA2BD1B4(v44, v45);
  uint64_t v46 = *(void *)(v12 + 48);
  unint64_t v47 = *(void *)(v12 + 56);
  *(void *)(v12 + 48) = v44;
  *(void *)(v12 + 56) = v45;
  uint64_t v9 = v39;
  int64_t v10 = v54;
  sub_1BA2BD220(v46, v47);
  v54((char *)(v12 + *(int *)(v14 + 32)), (char *)(v13 + *(int *)(v14 + 32)), v9);
LABEL_7:
  uint64_t v24 = a3[7];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  uint64_t v27 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  int v28 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27);
  int v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27);
  if (!v28)
  {
    if (!v29)
    {
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = *((void *)v26 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v25 + 2) = *((void *)v26 + 2);
      uint64_t v48 = *((void *)v26 + 3);
      unint64_t v49 = *((void *)v26 + 4);
      sub_1BA2BD1B4(v48, v49);
      uint64_t v50 = *((void *)v25 + 3);
      unint64_t v51 = *((void *)v25 + 4);
      *((void *)v25 + 3) = v48;
      *((void *)v25 + 4) = v49;
      sub_1BA2BD220(v50, v51);
      *((void *)v25 + 5) = *((void *)v26 + 5);
      *((void *)v25 + 6) = *((void *)v26 + 6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v25 + 7) = *((void *)v26 + 7);
      *((void *)v25 + 8) = *((void *)v26 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v25 + 9) = *((void *)v26 + 9);
      *((void *)v25 + 10) = *((void *)v26 + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v25 + 11) = *((void *)v26 + 11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v10(&v25[*(int *)(v27 + 44)], &v26[*(int *)(v27 + 44)], v9);
      return a1;
    }
    sub_1BA2C6268((uint64_t)v25, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
    memcpy(v25, v26, *(void *)(*(void *)(v36 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  *((void *)v25 + 2) = *((void *)v26 + 2);
  uint64_t v30 = *((void *)v26 + 3);
  unint64_t v31 = *((void *)v26 + 4);
  swift_bridgeObjectRetain();
  sub_1BA2BD1B4(v30, v31);
  *((void *)v25 + 3) = v30;
  *((void *)v25 + 4) = v31;
  *((void *)v25 + 5) = *((void *)v26 + 5);
  *((void *)v25 + 6) = *((void *)v26 + 6);
  *((void *)v25 + 7) = *((void *)v26 + 7);
  *((void *)v25 + 8) = *((void *)v26 + 8);
  *((void *)v25 + 9) = *((void *)v26 + 9);
  *((void *)v25 + 10) = *((void *)v26 + 10);
  *((void *)v25 + 11) = *((void *)v26 + 11);
  uint64_t v32 = *(int *)(v27 + 44);
  uint64_t v53 = v9;
  uint64_t v33 = &v25[v32];
  uint64_t v34 = &v26[v32];
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v35(v33, v34, v53);
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
  return a1;
}

void *sub_1BA2C9238(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BA2D9968();
  int64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    *((unsigned char *)v12 + 8) = *((unsigned char *)v13 + 8);
    long long v16 = *((_OWORD *)v13 + 2);
    *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
    *((_OWORD *)v12 + 2) = v16;
    *((_OWORD *)v12 + 3) = *((_OWORD *)v13 + 3);
    v10((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (_OWORD *)((char *)a1 + v17);
  uint64_t v19 = (_OWORD *)((char *)a2 + v17);
  uint64_t v20 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    *uint64_t v18 = *v19;
    *((void *)v18 + 2) = *((void *)v19 + 2);
    *(_OWORD *)((char *)v18 + 24) = *(_OWORD *)((char *)v19 + 24);
    *(_OWORD *)((char *)v18 + 40) = *(_OWORD *)((char *)v19 + 40);
    *(_OWORD *)((char *)v18 + 56) = *(_OWORD *)((char *)v19 + 56);
    *(_OWORD *)((char *)v18 + 72) = *(_OWORD *)((char *)v19 + 72);
    *((void *)v18 + 11) = *((void *)v19 + 11);
    v10((char *)v18 + *(int *)(v20 + 44), (char *)v19 + *(int *)(v20 + 44), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  return a1;
}

void *sub_1BA2C9448(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BA2D9968();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v39(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t)a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v12, 1, v14);
  int v16 = __swift_getEnumTagSinglePayload(v13, 1, v14);
  if (EnumTagSinglePayload)
  {
    if (!v16)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
      long long v17 = *(_OWORD *)(v13 + 32);
      *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v12 + 32) = v17;
      *(_OWORD *)(v12 + 48) = *(_OWORD *)(v13 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12 + *(int *)(v14 + 32), v13 + *(int *)(v14 + 32), v9);
      __swift_storeEnumTagSinglePayload(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_1BA2C6268(v12, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
    memcpy((void *)v12, (const void *)v13, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v27 = *(void *)(v13 + 24);
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  *(void *)(v12 + 24) = v27;
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void *)(v12 + 32);
  unint64_t v29 = *(void *)(v12 + 40);
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(v13 + 32);
  sub_1BA2BD220(v28, v29);
  uint64_t v30 = *(void *)(v12 + 48);
  unint64_t v31 = *(void *)(v12 + 56);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v13 + 48);
  sub_1BA2BD220(v30, v31);
  v39((char *)(v12 + *(int *)(v14 + 32)), (char *)(v13 + *(int *)(v14 + 32)), v9);
LABEL_7:
  uint64_t v19 = a3[7];
  uint64_t v20 = (uint64_t)a1 + v19;
  uint64_t v21 = (uint64_t)a2 + v19;
  uint64_t v22 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  int v23 = __swift_getEnumTagSinglePayload(v20, 1, v22);
  int v24 = __swift_getEnumTagSinglePayload(v21, 1, v22);
  if (!v23)
  {
    if (!v24)
    {
      uint64_t v32 = *(void *)(v21 + 8);
      *(void *)uint64_t v20 = *(void *)v21;
      *(void *)(v20 + 8) = v32;
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void *)(v21 + 32);
      uint64_t v34 = *(void *)(v20 + 24);
      unint64_t v35 = *(void *)(v20 + 32);
      *(_OWORD *)(v20 + 16) = *(_OWORD *)(v21 + 16);
      *(void *)(v20 + 32) = v33;
      sub_1BA2BD220(v34, v35);
      uint64_t v36 = *(void *)(v21 + 48);
      *(void *)(v20 + 40) = *(void *)(v21 + 40);
      *(void *)(v20 + 48) = v36;
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void *)(v21 + 64);
      *(void *)(v20 + 56) = *(void *)(v21 + 56);
      *(void *)(v20 + 64) = v37;
      swift_bridgeObjectRelease();
      uint64_t v38 = *(void *)(v21 + 80);
      *(void *)(v20 + 72) = *(void *)(v21 + 72);
      *(void *)(v20 + 80) = v38;
      swift_bridgeObjectRelease();
      *(void *)(v20 + 88) = *(void *)(v21 + 88);
      swift_bridgeObjectRelease();
      v39((char *)(v20 + *(int *)(v22 + 44)), (char *)(v21 + *(int *)(v22 + 44)), v9);
      return a1;
    }
    sub_1BA2C6268(v20, (void (*)(void))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
    memcpy((void *)v20, (const void *)v21, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(void *)(v20 + 16) = *(void *)(v21 + 16);
  *(_OWORD *)(v20 + 24) = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v20 + 40) = *(_OWORD *)(v21 + 40);
  *(_OWORD *)(v20 + 56) = *(_OWORD *)(v21 + 56);
  *(_OWORD *)(v20 + 72) = *(_OWORD *)(v21 + 72);
  *(void *)(v20 + 88) = *(void *)(v21 + 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v20 + *(int *)(v22 + 44), v21 + *(int *)(v22 + 44), v9);
  __swift_storeEnumTagSinglePayload(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_1BA2C97F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2C9804);
}

uint64_t sub_1BA2C9804()
{
  OUTLINED_FUNCTION_16();
  if (v3) {
    return OUTLINED_FUNCTION_10(*v1);
  }
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = v2[5];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v7 + 84) == v0)
    {
      uint64_t v6 = v2[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
      uint64_t v6 = v2[7];
    }
  }
  uint64_t v8 = OUTLINED_FUNCTION_22(v6);
  return __swift_getEnumTagSinglePayload(v8, v9, v10);
}

uint64_t sub_1BA2C98B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2C98CC);
}

void sub_1BA2C98CC()
{
  OUTLINED_FUNCTION_11();
  if (v4)
  {
    void *v1 = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    sub_1BA2D9968();
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = v5[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41348);
      OUTLINED_FUNCTION_1_1();
      if (*(_DWORD *)(v9 + 84) == v6)
      {
        uint64_t v8 = v5[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F41350);
        uint64_t v8 = v5[7];
      }
    }
    uint64_t v10 = OUTLINED_FUNCTION_14(v8);
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
  }
}

void sub_1BA2C998C()
{
  sub_1BA2D9968();
  if (v0 <= 0x3F)
  {
    sub_1BA2C9AD8(319, &qword_1E9F41550, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    if (v1 <= 0x3F)
    {
      sub_1BA2C9AD8(319, &qword_1E9F41558, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1BA2C9AD8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BA2D9CF8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_1BA2C9B2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    unint64_t v9 = a2[4];
    swift_bridgeObjectRetain();
    sub_1BA2BD1B4(v8, v9);
    a1[3] = v8;
    a1[4] = v9;
    uint64_t v10 = a2[6];
    a1[5] = a2[5];
    a1[6] = v10;
    uint64_t v11 = a2[8];
    a1[7] = a2[7];
    a1[8] = v11;
    uint64_t v12 = a2[10];
    a1[9] = a2[9];
    a1[10] = v12;
    uint64_t v13 = a2[11];
    uint64_t v14 = *(int *)(a3 + 44);
    uint64_t v15 = (char *)a1 + v14;
    int v16 = (char *)a2 + v14;
    a1[11] = v13;
    uint64_t v17 = sub_1BA2D9968();
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_1BA2C9C7C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_1BA2BD220(*(void *)(a1 + 24), *(void *)(a1 + 32));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_1BA2D9968();
  int v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_1BA2C9D1C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  unint64_t v8 = a2[4];
  swift_bridgeObjectRetain();
  sub_1BA2BD1B4(v7, v8);
  a1[3] = v7;
  a1[4] = v8;
  uint64_t v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  uint64_t v10 = a2[8];
  a1[7] = a2[7];
  a1[8] = v10;
  uint64_t v11 = a2[10];
  a1[9] = a2[9];
  a1[10] = v11;
  uint64_t v12 = a2[11];
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  a1[11] = v12;
  uint64_t v16 = sub_1BA2D9968();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v14, v15, v16);
  return a1;
}

void *sub_1BA2C9E1C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  unint64_t v7 = a2[4];
  sub_1BA2BD1B4(v6, v7);
  uint64_t v8 = a1[3];
  unint64_t v9 = a1[4];
  a1[3] = v6;
  a1[4] = v7;
  sub_1BA2BD220(v8, v9);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1BA2D9968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_1BA2C9F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v4 = *(int *)(a3 + 44);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, v5, v7);
  return a1;
}

uint64_t sub_1BA2CA008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 24);
  unint64_t v9 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v7;
  sub_1BA2BD220(v8, v9);
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v12;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_1BA2CA0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2CA100);
}

uint64_t sub_1BA2CA100()
{
  OUTLINED_FUNCTION_16();
  if (v2) {
    return OUTLINED_FUNCTION_10(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_13();
  uint64_t v4 = OUTLINED_FUNCTION_22(*(int *)(v1 + 44));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1BA2CA164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2CA178);
}

void sub_1BA2CA178()
{
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_31();
    uint64_t v4 = OUTLINED_FUNCTION_14(*(int *)(v2 + 44));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_1BA2CA1DC()
{
  uint64_t result = sub_1BA2D9968();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1BA2CA2A0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = a2[3];
    v4[2] = a2[2];
    v4[3] = v7;
    uint64_t v8 = a2[4];
    unint64_t v9 = a2[5];
    swift_bridgeObjectRetain();
    sub_1BA2BD1B4(v8, v9);
    v4[4] = v8;
    v4[5] = v9;
    uint64_t v10 = a2[6];
    unint64_t v11 = a2[7];
    sub_1BA2BD1B4(v10, v11);
    v4[6] = v10;
    v4[7] = v11;
    uint64_t v12 = *(int *)(a3 + 32);
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_1BA2D9968();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return v4;
}

uint64_t sub_1BA2CA3B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_1BA2BD220(*(void *)(a1 + 32), *(void *)(a1 + 40));
  sub_1BA2BD220(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_1BA2CA440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_1BA2BD1B4(v7, v8);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  unint64_t v10 = *(void *)(a2 + 56);
  sub_1BA2BD1B4(v9, v10);
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_1BA2CA508(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  sub_1BA2BD1B4(v7, v8);
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  sub_1BA2BD220(v9, v10);
  uint64_t v11 = a2[6];
  unint64_t v12 = a2[7];
  sub_1BA2BD1B4(v11, v12);
  uint64_t v13 = *(void *)(a1 + 48);
  unint64_t v14 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  sub_1BA2BD220(v13, v14);
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t)a2 + v15;
  uint64_t v18 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_1BA2CA5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_1BA2CA688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_1BA2BD220(v7, v8);
  uint64_t v9 = *(void *)(a1 + 48);
  unint64_t v10 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_1BA2BD220(v9, v10);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1BA2CA744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2CA758);
}

uint64_t sub_1BA2CA758()
{
  OUTLINED_FUNCTION_16();
  if (v2) {
    return OUTLINED_FUNCTION_10(*(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_13();
  uint64_t v4 = OUTLINED_FUNCTION_22(*(int *)(v1 + 32));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1BA2CA7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2CA7D0);
}

void sub_1BA2CA7D0()
{
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(void *)(v1 + 24) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_31();
    uint64_t v4 = OUTLINED_FUNCTION_14(*(int *)(v2 + 32));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_1BA2CA834()
{
  return sub_1BA2CAE04();
}

_DWORD *sub_1BA2CA854(_DWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (_DWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_1BA2BD1B4(v7, v8);
    *((void *)v4 + 1) = v7;
    *((void *)v4 + 2) = v8;
    *((void *)v4 + 3) = a2[3];
    *((unsigned char *)v4 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v9 = a2[5];
    uint64_t v10 = a2[6];
    uint64_t v11 = *(int *)(a3 + 32);
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (uint64_t)a2 + v11;
    *((void *)v4 + 5) = v9;
    *((void *)v4 + 6) = v10;
    uint64_t v14 = sub_1BA2D9968();
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
  }
  return v4;
}

uint64_t sub_1BA2CA970(uint64_t a1, uint64_t a2)
{
  sub_1BA2BD220(*(void *)(a1 + 8), *(void *)(a1 + 16));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_1BA2CA9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_1BA2BD1B4(v6, v7);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  uint64_t v13 = sub_1BA2D9968();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  v14(v11, v12, v13);
  return a1;
}

uint64_t sub_1BA2CAAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_1BA2BD1B4(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_1BA2BD220(v8, v9);
  uint64_t v10 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_1BA2CAB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1BA2CAC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1BA2BD220(v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_1BA2CACEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2CAD00);
}

uint64_t sub_1BA2CAD00()
{
  OUTLINED_FUNCTION_16();
  if (v2) {
    return OUTLINED_FUNCTION_10(*(void *)(v0 + 48));
  }
  OUTLINED_FUNCTION_13();
  uint64_t v4 = OUTLINED_FUNCTION_22(*(int *)(v1 + 32));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1BA2CAD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2CAD78);
}

void sub_1BA2CAD78()
{
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(void *)(v1 + 48) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_31();
    uint64_t v4 = OUTLINED_FUNCTION_14(*(int *)(v2 + 32));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_1BA2CADDC()
{
  return sub_1BA2CAE04();
}

uint64_t sub_1BA2CAE04()
{
  uint64_t result = sub_1BA2D9968();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BA2CAE98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    unint64_t v9 = a2[2];
    swift_bridgeObjectRetain();
    sub_1BA2BD1B4(v8, v9);
    a1[1] = v8;
    a1[2] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_1BA2D9968();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_1BA2CAF84(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_1BA2BD220(*(void *)(a1 + 8), *(void *)(a1 + 16));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_1BA2CB004(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  unint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  sub_1BA2BD1B4(v6, v7);
  a1[1] = v6;
  a1[2] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1BA2D9968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

void *sub_1BA2CB0A8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  unint64_t v7 = a2[2];
  sub_1BA2BD1B4(v6, v7);
  uint64_t v8 = a1[1];
  unint64_t v9 = a1[2];
  a1[1] = v6;
  a1[2] = v7;
  sub_1BA2BD220(v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1BA2D9968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_1BA2CB160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1BA2CB1E4(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_1BA2BD220(v6, v7);
  uint64_t v8 = *(int *)(a3 + 24);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1BA2D9968();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1BA2CB280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2CB294);
}

uint64_t sub_1BA2CB294()
{
  OUTLINED_FUNCTION_16();
  if (v2) {
    return OUTLINED_FUNCTION_10(*v0);
  }
  OUTLINED_FUNCTION_13();
  uint64_t v4 = OUTLINED_FUNCTION_22(*(int *)(v1 + 24));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1BA2CB2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2CB30C);
}

void sub_1BA2CB30C()
{
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    void *v1 = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_31();
    uint64_t v4 = OUTLINED_FUNCTION_14(*(int *)(v2 + 24));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_1BA2CB370()
{
  uint64_t result = sub_1BA2D9968();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1BA2CB414(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *char v3 = *a2;
    char v3 = (void *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v5 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    *(void *)(a1 + 32) = a2[4];
    uint64_t v9 = sub_1BA2D9968();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1BA2CB51C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1BA2D9968();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_1BA2CB59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_1BA2D9968();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t sub_1BA2CB654(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BA2CB718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1BA2CB7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1BA2D9968();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1BA2CB858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BA2CB86C);
}

uint64_t sub_1BA2CB86C()
{
  OUTLINED_FUNCTION_16();
  if (v2) {
    return OUTLINED_FUNCTION_10(*(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_13();
  uint64_t v4 = OUTLINED_FUNCTION_22(*(int *)(v1 + 28));
  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1BA2CB8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BA2CB8E4);
}

void sub_1BA2CB8E4()
{
  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(void *)(v1 + 24) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_31();
    uint64_t v4 = OUTLINED_FUNCTION_14(*(int *)(v2 + 28));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t sub_1BA2CB948()
{
  uint64_t result = sub_1BA2D9968();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1BA2CB9FC()
{
  unint64_t result = qword_1E9F415B0;
  if (!qword_1E9F415B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415B0);
  }
  return result;
}

unint64_t sub_1BA2CBA4C()
{
  unint64_t result = qword_1E9F415B8;
  if (!qword_1E9F415B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415B8);
  }
  return result;
}

unint64_t sub_1BA2CBA9C()
{
  unint64_t result = qword_1E9F415C0;
  if (!qword_1E9F415C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415C0);
  }
  return result;
}

unint64_t sub_1BA2CBAEC()
{
  unint64_t result = qword_1E9F415C8;
  if (!qword_1E9F415C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415C8);
  }
  return result;
}

unint64_t sub_1BA2CBB3C()
{
  unint64_t result = qword_1E9F415D0;
  if (!qword_1E9F415D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415D0);
  }
  return result;
}

unint64_t sub_1BA2CBB8C()
{
  unint64_t result = qword_1E9F415D8;
  if (!qword_1E9F415D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415D8);
  }
  return result;
}

unint64_t sub_1BA2CBBDC()
{
  unint64_t result = qword_1E9F415E0;
  if (!qword_1E9F415E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415E0);
  }
  return result;
}

unint64_t sub_1BA2CBC2C()
{
  unint64_t result = qword_1E9F415E8;
  if (!qword_1E9F415E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415E8);
  }
  return result;
}

unint64_t sub_1BA2CBC7C()
{
  unint64_t result = qword_1E9F415F0;
  if (!qword_1E9F415F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F415F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_1BA2D99B8();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_1BA2D9BF8();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_1BA2D9968();
}

uint64_t OUTLINED_FUNCTION_14@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_1BA2D9968();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_1BA2D9AD8();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_1BA2D9948();
}

uint64_t OUTLINED_FUNCTION_22@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_1BA2D99B8();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1BA2D9948();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1BA2D9968();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_1BA2D9AA8();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1BA2D9AE8();
}

BOOL OUTLINED_FUNCTION_36()
{
  return sub_1BA2C0928(v0, v1);
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1)
{
  return MEMORY[0x1F4127200](a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1)
{
  return MEMORY[0x1F4127290](a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t result, __int16 a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2;
  *(unsigned char *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_1BA2D9BE8();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0 & 1;
}

void sub_1BA2CC4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA2CD74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA2CD994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BA2CDC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2CDE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2CE718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2CF554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1BA2CF76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA2D0574(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA2D3D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void sub_1BA2D5EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA2D7590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__413(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__414(uint64_t a1)
{
}

unsigned __int8 *tryGetTextProperty(sqlite3_stmt *a1, int a2)
{
  uint64_t v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2) {
    uint64_t v2 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v2];
  }
  return v2;
}

id tryGetDateProperty(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(a1, a2));
  }
  return v4;
}

id tryGetDataProperty(sqlite3 *a1, void *a2, sqlite3_stmt *a3, int a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = sqlite3_column_blob(a3, a4);
  if (sqlite3_errcode(a1) == 7)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, "SQLite payload blob iteration OOM", v12, 2u);
    }
  }
  else
  {
    int v9 = sqlite3_column_bytes(a3, a4);
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v9];
      goto LABEL_7;
    }
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

os_log_t flLogForObject(void *a1)
{
  ClassName = object_getClassName(a1);
  os_log_t v2 = os_log_create("com.apple.feedbacklogger", ClassName);
  return v2;
}

void FLSignpostLoggingInit()
{
  if (FLSignpostLoggingInit_onceToken != -1) {
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_640);
  }
}

uint64_t __FLSignpostLoggingInit_block_invoke()
{
  FL_LOG_SIGNPOSTS = (uint64_t)os_log_create("com.apple.feedbacklogger", "Signposts");
  return MEMORY[0x1F41817F8]();
}

void sub_1BA2D8C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id FLGetBootSessionUUID()
{
  if (FLGetBootSessionUUID_onceToken != -1) {
    dispatch_once(&FLGetBootSessionUUID_onceToken, &__block_literal_global_824);
  }
  char v0 = (void *)FLGetBootSessionUUID_bootSessionUUID;
  return v0;
}

void __FLGetBootSessionUUID_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  size_t v4 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0))
  {
    char v0 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v1 = [v0 UUIDString];
    os_log_t v2 = (void *)FLGetBootSessionUUID_bootSessionUUID;
    FLGetBootSessionUUID_bootSessionUUID = v1;
  }
  else
  {
    uint64_t v3 = [[NSString alloc] initWithUTF8String:v5];
    char v0 = (void *)FLGetBootSessionUUID_bootSessionUUID;
    FLGetBootSessionUUID_bootSessionUUID = v3;
  }
}

uint64_t sub_1BA2D9898()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1BA2D98A8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1BA2D98B8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1BA2D98C8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BA2D98D8()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1BA2D98E8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BA2D98F8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1BA2D9908()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1BA2D9918()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BA2D9928()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BA2D9938()
{
  return MEMORY[0x1F4127048]();
}

uint64_t sub_1BA2D9948()
{
  return MEMORY[0x1F4127060]();
}

uint64_t sub_1BA2D9958()
{
  return MEMORY[0x1F4127078]();
}

uint64_t sub_1BA2D9968()
{
  return MEMORY[0x1F4127088]();
}

uint64_t sub_1BA2D9978()
{
  return MEMORY[0x1F4127138]();
}

uint64_t sub_1BA2D99A8()
{
  return MEMORY[0x1F4127178]();
}

uint64_t sub_1BA2D99B8()
{
  return MEMORY[0x1F4127180]();
}

uint64_t sub_1BA2D99C8()
{
  return MEMORY[0x1F41271B0]();
}

uint64_t sub_1BA2D99D8()
{
  return MEMORY[0x1F41271C0]();
}

uint64_t sub_1BA2D99F8()
{
  return MEMORY[0x1F4127220]();
}

uint64_t sub_1BA2D9A08()
{
  return MEMORY[0x1F4127230]();
}

uint64_t sub_1BA2D9A28()
{
  return MEMORY[0x1F41272C8]();
}

uint64_t sub_1BA2D9A38()
{
  return MEMORY[0x1F41272E0]();
}

uint64_t sub_1BA2D9A48()
{
  return MEMORY[0x1F4127330]();
}

uint64_t sub_1BA2D9A58()
{
  return MEMORY[0x1F4127348]();
}

uint64_t sub_1BA2D9A78()
{
  return MEMORY[0x1F4127398]();
}

uint64_t sub_1BA2D9A88()
{
  return MEMORY[0x1F41273C8]();
}

uint64_t sub_1BA2D9A98()
{
  return MEMORY[0x1F4127418]();
}

uint64_t sub_1BA2D9AA8()
{
  return MEMORY[0x1F4127458]();
}

uint64_t sub_1BA2D9AB8()
{
  return MEMORY[0x1F4127468]();
}

uint64_t sub_1BA2D9AC8()
{
  return MEMORY[0x1F4127470]();
}

uint64_t sub_1BA2D9AD8()
{
  return MEMORY[0x1F41274A8]();
}

uint64_t sub_1BA2D9AE8()
{
  return MEMORY[0x1F41274D0]();
}

uint64_t sub_1BA2D9AF8()
{
  return MEMORY[0x1F41274E8]();
}

uint64_t sub_1BA2D9B08()
{
  return MEMORY[0x1F4127660]();
}

uint64_t sub_1BA2D9B18()
{
  return MEMORY[0x1F4127678]();
}

uint64_t sub_1BA2D9B28()
{
  return MEMORY[0x1F4127690]();
}

uint64_t sub_1BA2D9B38()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BA2D9B48()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BA2D9B58()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BA2D9B68()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BA2D9B78()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1BA2D9B88()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BA2D9B98()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BA2D9BA8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BA2D9BB8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1BA2D9BC8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BA2D9BD8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BA2D9BE8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BA2D9BF8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BA2D9C08()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BA2D9C18()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BA2D9C28()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BA2D9C38()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BA2D9C48()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1BA2D9C58()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BA2D9C68()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BA2D9C78()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1BA2D9C88()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BA2D9C98()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BA2D9CA8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BA2D9CB8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BA2D9CC8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BA2D9CD8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BA2D9CE8()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1BA2D9CF8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BA2D9D08()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BA2D9D18()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BA2D9D28()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1BA2D9D38()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BA2D9D48()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BA2D9D58()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1BA2D9D68()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1BA2D9D78()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BA2D9D88()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BA2D9D98()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BA2D9DA8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BA2D9DB8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BA2D9DC8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BA2D9DD8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1F4181F40]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
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

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}