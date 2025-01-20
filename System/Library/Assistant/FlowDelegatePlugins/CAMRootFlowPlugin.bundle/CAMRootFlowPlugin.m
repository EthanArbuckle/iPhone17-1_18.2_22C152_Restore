unint64_t sub_3C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  long long *v7;
  unint64_t v8;
  void v10[5];
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Swift::String v15;
  Swift::String v16;

  v1 = v0;
  v2 = sub_607D0();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
  __chkstk_darwin();
  v7 = (long long *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_6FAC(v1, (uint64_t)v7, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, long long *, uint64_t))(v3 + 32))(v5, v7, v2);
    v13 = 0;
    v14 = 0xE000000000000000;
    sub_61A70(32);
    swift_bridgeObjectRelease();
    v13 = 0xD00000000000001ELL;
    v14 = 0x8000000000063FE0;
    sub_7BBC((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
    v15._countAndFlagsBits = sub_61C90();
    sub_61820(v15);
    swift_bridgeObjectRelease();
    v8 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_6D78(v7, (uint64_t)&v13);
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    sub_61A70(31);
    swift_bridgeObjectRelease();
    v11 = 0xD00000000000001DLL;
    v12 = 0x8000000000064000;
    sub_83F0((uint64_t)&v13, (uint64_t)v10);
    sub_6D90(&qword_75FE0);
    v16._countAndFlagsBits = sub_61800();
    sub_61820(v16);
    swift_bridgeObjectRelease();
    v8 = v11;
    sub_63E8((uint64_t)&v13);
  }
  return v8;
}

uint64_t sub_3EA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_6D90(&qword_75FE8);
  __chkstk_darwin(v2 - 8, v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
  uint64_t v7 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  v8((uint64_t)v5, 1, 1, v7);
  swift_beginAccess();
  sub_6DD4((uint64_t)v5, v6);
  swift_endAccess();
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_616D0();
  sub_6D40(v9, (uint64_t)qword_7A9C8);
  v10 = sub_616C0();
  os_log_type_t v11 = sub_61960();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "ActionDisambiguationEntryFlow: new instance initialised", v12, 2u);
    swift_slowDealloc();
  }

  return v1;
}

uint64_t sub_4070(uint64_t a1)
{
  v2[26] = a1;
  v2[27] = v1;
  uint64_t v3 = sub_60A90();
  v2[28] = v3;
  v2[29] = *(void *)(v3 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  uint64_t v4 = sub_60AF0();
  v2[32] = v4;
  v2[33] = *(void *)(v4 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = sub_6D90(&qword_75FE8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = type metadata accessor for ActionDisambiguationStrategy();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  uint64_t v5 = sub_607D0();
  v2[43] = v5;
  v2[44] = *(void *)(v5 - 8);
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  sub_6D90(&qword_75FF0);
  v2[52] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for CAMDirectInvocation();
  v2[53] = v6;
  v2[54] = *(void *)(v6 - 8);
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  uint64_t v7 = sub_60D10();
  v2[57] = v7;
  v2[58] = *(void *)(v7 - 8);
  v2[59] = swift_task_alloc();
  uint64_t v8 = sub_60CF0();
  v2[60] = v8;
  v2[61] = *(void *)(v8 - 8);
  v2[62] = swift_task_alloc();
  uint64_t v9 = sub_60C90();
  v2[63] = v9;
  v2[64] = *(void *)(v9 - 8);
  v2[65] = swift_task_alloc();
  v2[66] = swift_task_alloc();
  return _swift_task_switch(sub_44A4, 0, 0);
}

uint64_t sub_44A4()
{
  v57 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[66];
  uint64_t v3 = v0[63];
  uint64_t v4 = v0[64];
  uint64_t v5 = sub_616D0();
  v0[67] = sub_6D40(v5, (uint64_t)qword_7A9C8);
  v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v55(v2, v1, v3);
  uint64_t v6 = sub_616C0();
  os_log_type_t v7 = sub_61960();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[66];
  uint64_t v10 = v0[63];
  uint64_t v11 = v0[64];
  if (v8)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    sub_7BBC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v13 = sub_61C90();
    v0[25] = sub_316A4(v13, v14, &v56);
    sub_619C0();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
    _os_log_impl(&dword_0, v6, v7, "ActionDisambiguationEntryFlow: on called with %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v0[66], v0[63]);
  }

  uint64_t v17 = v0[58];
  uint64_t v16 = v0[59];
  uint64_t v18 = v0[57];
  sub_60C80();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 88))(v16, v18) != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
LABEL_13:
    v55(v0[65], v0[26], v0[63]);
    v34 = sub_616C0();
    os_log_type_t v35 = sub_61970();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = v0[65];
    uint64_t v38 = v0[63];
    if (v36)
    {
      v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      *(_DWORD *)v39 = 136315138;
      sub_7BBC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v40 = sub_61C90();
      v0[22] = sub_316A4(v40, v41, &v56);
      sub_619C0();
      swift_bridgeObjectRelease();
      v15(v37, v38);
      _os_log_impl(&dword_0, v34, v35, "ActionDisambiguationEntryFlow called with unexpected input %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v15(v0[65], v0[63]);
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
    v42 = (uint64_t (*)(void))v0[1];
    return v42(0);
  }
  v19 = v15;
  uint64_t v21 = v0[61];
  uint64_t v20 = v0[62];
  uint64_t v23 = v0[59];
  uint64_t v22 = v0[60];
  uint64_t v24 = v0[53];
  uint64_t v25 = v0[54];
  v26 = (uint64_t *)v0[52];
  (*(void (**)(uint64_t, void))(v0[58] + 96))(v23, v0[57]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v20, v23, v22);
  sub_3B0A8(v26);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v25 + 48))(v26, 1, v24) == 1)
  {
    uint64_t v27 = v0[52];
    (*(void (**)(void, void))(v0[61] + 8))(v0[62], v0[60]);
    sub_6EE8(v27, &qword_75FF0);
LABEL_12:
    v15 = v19;
    goto LABEL_13;
  }
  uint64_t v28 = v0[55];
  uint64_t v29 = v0[56];
  sub_6F44(v0[52], v29, (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
  sub_6FAC(v29, v28, (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v31 = v0[61];
    uint64_t v30 = v0[62];
    uint64_t v32 = v0[60];
    uint64_t v33 = v0[55];
    sub_7014(v0[56], (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    sub_7014(v33, (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
    goto LABEL_12;
  }
  uint64_t v44 = v0[55];
  uint64_t v46 = v0[50];
  uint64_t v45 = v0[51];
  uint64_t v47 = v0[43];
  uint64_t v48 = v0[44];
  uint64_t v49 = v44 + *(int *)(sub_6D90(&qword_76000) + 48);
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
  v0[68] = v50;
  v0[69] = (v48 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v50(v45, v44, v47);
  v50(v46, v49, v47);
  if (qword_75D60 != -1) {
    swift_once();
  }
  v51 = (void *)swift_task_alloc();
  v0[70] = v51;
  void *v51 = v0;
  v51[1] = sub_4C98;
  uint64_t v53 = v0[50];
  uint64_t v52 = v0[51];
  uint64_t v54 = v0[42];
  return sub_8454(v54, v52, v53, (uint64_t)qword_7A880);
}

uint64_t sub_4C98()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_4D94, 0, 0);
}

uint64_t sub_4D94()
{
  v108 = v0;
  uint64_t v94 = (uint64_t)(v0 + 2);
  sub_6FAC(v0[42], v0[41], (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61960();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[41];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    v107[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = sub_A6DC();
    v0[24] = sub_316A4(v5, v6, v107);
    sub_619C0();
    swift_bridgeObjectRelease();
    sub_7014(v3, (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
    _os_log_impl(&dword_0, v1, v2, "ActionDisambiguationEntryFlow: disambiguations strategy is %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_7014(v0[41], (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
  }

  sub_6FAC(v0[42], v0[40], (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v23 = (void (*)(uint64_t, uint64_t, uint64_t))v0[68];
      uint64_t v24 = v0[48];
      uint64_t v77 = v0[46];
      uint64_t v102 = v0[44];
      uint64_t v91 = v0[43];
      uint64_t v95 = v0[47];
      uint64_t v25 = v0[40];
      uint64_t v90 = v0[37];
      uint64_t v26 = v0[35];
      uint64_t v78 = v0[45];
      uint64_t v79 = v0[34];
      uint64_t v27 = v0[32];
      uint64_t v28 = v0[33];
      uint64_t v80 = v0[31];
      uint64_t v81 = v0[29];
      uint64_t v82 = v0[30];
      uint64_t v83 = v0[28];
      v86 = (char **)v0[38];
      uint64_t v88 = v0[27];
      uint64_t v29 = sub_6D90(&qword_76010);
      uint64_t v30 = v25 + *(int *)(v29 + 48);
      uint64_t v31 = v25 + *(int *)(v29 + 64);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v26, v25, v27);
      v23(v24, v30, v91);
      v23(v95, v31, v91);
      uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v102 + 16);
      v32(v77, v24, v91);
      v32(v78, v95, v91);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v79, v26, v27);
      sub_60D20();
      type metadata accessor for DefaultCatExecutor();
      uint64_t v33 = swift_allocObject();
      sub_60600();
      sub_60A80();
      type metadata accessor for CoreServicesProvider();
      uint64_t v34 = swift_allocObject();
      sub_60B80();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16))(v82, v80, v83);
      os_log_type_t v35 = sub_78F0(v77, v78, v79, (uint64_t)v105, v33, (uint64_t)v106, v82, v34, (uint64_t)v107);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v80, v83);
      v86[3] = (char *)type metadata accessor for AppShortcutEnablementFlow(0);
      v86[4] = (char *)sub_7BBC(&qword_76018, (void (*)(uint64_t))type metadata accessor for AppShortcutEnablementFlow);
      *v86 = v35;
      BOOL v36 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
      v36(v95, v91);
      v36(v24, v91);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
      uint64_t v37 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char **, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v86, 0, 1, v37);
      uint64_t v38 = v90;
      sub_7074((uint64_t)v86, v90);
      uint64_t v39 = v88 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
      goto LABEL_9;
    case 3u:
      uint64_t v44 = v0[51];
      uint64_t v45 = v0[47];
      uint64_t v46 = v0[48];
      uint64_t v47 = v0[45];
      uint64_t v48 = v0[46];
      uint64_t v84 = v0[50];
      uint64_t v85 = v47;
      uint64_t v50 = v0[43];
      uint64_t v49 = v0[44];
      uint64_t v92 = v49;
      v51 = (uint64_t *)v0[38];
      uint64_t v100 = v0[37];
      uint64_t v103 = v0[27];
      ((void (*)(uint64_t, void, uint64_t))v0[68])(v46, v0[40], v50);
      uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
      v52(v45, v44, v50);
      v52(v48, v84, v50);
      v52(v47, v46, v50);
      sub_60600();
      sub_60B80();
      v0[5] = &type metadata for SNLGTemplatingSectionGenerator;
      v0[6] = &off_72708;
      uint64_t v53 = type metadata accessor for VerbEntityDisambiguationFlow(0);
      uint64_t v54 = swift_allocObject();
      sub_70DC(v94, (uint64_t)&type metadata for SNLGTemplatingSectionGenerator);
      swift_task_alloc();
      value witness table for ()[2]();
      uint64_t v55 = sub_7428(v45, v48, v85, (uint64_t)v106, (uint64_t)v107, v54);
      sub_63E8(v94);
      swift_task_dealloc();
      v51[3] = v53;
      v51[4] = sub_7BBC(&qword_76008, (void (*)(uint64_t))type metadata accessor for VerbEntityDisambiguationFlow);
      uint64_t *v51 = v55;
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v46, v50);
      uint64_t v56 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v51, 0, 1, v56);
      uint64_t v38 = v100;
      sub_7074((uint64_t)v51, v100);
      uint64_t v39 = v103 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
LABEL_9:
      swift_beginAccess();
      uint64_t v21 = v38;
      goto LABEL_10;
    case 4u:
      uint64_t v40 = v0[37];
      uint64_t v41 = v0[38];
      uint64_t v42 = v0[27];
      ((void (*)(uint64_t, void, void))v0[68])(v41, v0[40], v0[43]);
      uint64_t v43 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v41, 0, 1, v43);
      sub_7074(v41, v40);
      uint64_t v39 = v42 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
      swift_beginAccess();
      uint64_t v21 = v40;
LABEL_10:
      uint64_t v22 = v39;
      break;
    default:
      uint64_t v8 = v0[50];
      uint64_t v7 = v0[51];
      uint64_t v10 = v0[48];
      uint64_t v9 = v0[49];
      uint64_t v11 = v0[47];
      uint64_t v13 = v0[43];
      uint64_t v12 = v0[44];
      unint64_t v14 = (uint64_t *)v0[38];
      uint64_t v97 = v0[37];
      uint64_t v99 = v0[27];
      ((void (*)(uint64_t, void, uint64_t))v0[68])(v9, v0[40], v13);
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
      v15(v10, v7, v13);
      v15(v11, v8, v13);
      sub_60D20();
      type metadata accessor for DefaultCatExecutor();
      uint64_t v16 = swift_allocObject();
      sub_60B80();
      sub_60600();
      type metadata accessor for CoreServicesProvider();
      uint64_t v17 = swift_allocObject();
      uint64_t v18 = sub_76D0(v10, v11, v9, (uint64_t)v105, v16, (uint64_t)v106, (uint64_t)v107, v17);
      v14[3] = type metadata accessor for AppNameDisambiguationFlow(0);
      v14[4] = sub_7BBC(&qword_76020, (void (*)(uint64_t))type metadata accessor for AppNameDisambiguationFlow);
      *unint64_t v14 = v18;
      uint64_t v19 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 0, 1, v19);
      sub_7074((uint64_t)v14, v97);
      uint64_t v20 = v99 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
      swift_beginAccess();
      uint64_t v21 = v97;
      uint64_t v22 = v20;
      break;
  }
  sub_6DD4(v21, v22);
  swift_endAccess();
  swift_retain_n();
  v57 = sub_616C0();
  os_log_type_t v58 = sub_61960();
  BOOL v59 = os_log_type_enabled(v57, v58);
  uint64_t v61 = v0[61];
  uint64_t v60 = v0[62];
  uint64_t v62 = v0[60];
  uint64_t v63 = v0[56];
  uint64_t v64 = v0[51];
  uint64_t v65 = v0[44];
  uint64_t v101 = v0[50];
  uint64_t v104 = v0[43];
  uint64_t v98 = v0[42];
  if (v59)
  {
    uint64_t v93 = v0[56];
    uint64_t v96 = v0[62];
    uint64_t v66 = v0[38];
    uint64_t v87 = v0[61];
    uint64_t v67 = v0[27];
    uint64_t v89 = v0[51];
    v68 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(_DWORD *)v68 = 136315138;
    v107[0] = v69;
    uint64_t v70 = v67 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
    swift_beginAccess();
    sub_6E3C(v70, v66);
    uint64_t v71 = sub_61800();
    v0[23] = sub_316A4(v71, v72, v107);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_0, v57, v58, "ActionDisambiguationEntryFlow: execution decision is %s", v68, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    sub_7014(v98, (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
    v73 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
    v73(v101, v104);
    v73(v89, v104);
    sub_7014(v93, (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v96, v62);
  }
  else
  {

    swift_release_n();
    sub_7014(v98, (uint64_t (*)(void))type metadata accessor for ActionDisambiguationStrategy);
    v74 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
    v74(v101, v104);
    v74(v64, v104);
    sub_7014(v63, (uint64_t (*)(void))type metadata accessor for CAMDirectInvocation);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
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
  v75 = (uint64_t (*)(uint64_t))v0[1];
  return v75(1);
}

uint64_t sub_5B8C(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  uint64_t v3 = sub_607D0();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  sub_6D90(&qword_75FE8);
  v2[15] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(0);
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return _swift_task_switch(sub_5CE8, 0, 0);
}

uint64_t sub_5CE8()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  os_log_type_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "ActionDisambiguationEntryFlow: execution called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 88);

  uint64_t v9 = v8 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision;
  swift_beginAccess();
  sub_6E3C(v9, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5) == 1)
  {
    sub_6EE8(*(void *)(v0 + 120), &qword_75FE8);
    uint64_t v10 = sub_616C0();
    os_log_type_t v11 = sub_61970();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "ActionDisambiguationEntryFlow: calling execute with nill execution decision", v12, 2u);
      swift_slowDealloc();
    }

    sub_608F0();
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 152);
    sub_6F44(*(void *)(v0 + 120), v14, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
    sub_6FAC(v14, v13, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v16 = *(void *)(v0 + 152);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v18 = *(void *)(v0 + 104);
      uint64_t v17 = *(void *)(v0 + 112);
      uint64_t v19 = *(void *)(v0 + 96);
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v17, *(void *)(v0 + 144), v19);
      sub_60900();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      sub_7014(v16, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
    }
    else
    {
      sub_6D78(*(long long **)(v0 + 144), v0 + 16);
      sub_6EA4((void *)(v0 + 16), *(void *)(v0 + 40));
      sub_60540();
      sub_608E0();
      swift_release();
      sub_7014(v16, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
      sub_63E8(v0 + 16);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_6054()
{
  sub_6EE8(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin29ActionDisambiguationEntryFlow_executionDecision, &qword_75FE8);

  return swift_deallocClassInstance();
}

uint64_t sub_60C0()
{
  return type metadata accessor for ActionDisambiguationEntryFlow(0);
}

uint64_t type metadata accessor for ActionDisambiguationEntryFlow(uint64_t a1)
{
  return sub_61F0(a1, (uint64_t *)&unk_75E48);
}

void sub_60E8()
{
  sub_6178();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_6178()
{
  if (!qword_75E68)
  {
    type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(255);
    unint64_t v0 = sub_619B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_75E68);
    }
  }
}

uint64_t type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision(uint64_t a1)
{
  return sub_61F0(a1, qword_75F90);
}

uint64_t sub_61F0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6228(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *(void *)a1 = *a2;
    a1 = v7 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_607D0();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      long long v8 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v8;
      (**(void (***)(uint64_t, uint64_t *))(v8 - 8))(a1, a2);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_6358(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_607D0();
    os_log_type_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return sub_63E8(a1);
  }
}

uint64_t sub_63E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6438(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_607D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_6510(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_7014(a1, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_607D0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_6610(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_607D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_66C8(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_7014((uint64_t)a1, type metadata accessor for ActionDisambiguationEntryFlow.ExecutionDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_607D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_67A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_67CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_67FC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_680C()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_68A0()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_616D0();
  sub_6D40(v0, (uint64_t)qword_7A9C8);
  unint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61970();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "ActionDisambiguationEntryFlow: the synchronous version of on was unexpectedly called.", v3, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_697C(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_6A14;
  return sub_4070(a1);
}

uint64_t sub_6A14(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  os_log_type_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_6B10()
{
  return sub_60550();
}

uint64_t sub_6B70(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_5B8C(a1);
}

uint64_t sub_6C0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_6D00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for ActionDisambiguationEntryFlow(0);

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_6D40(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_6D78(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_6D90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_75FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_6E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_75FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_6EA4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_6EE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6D90(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6F44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_6FAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_7014(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_7074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_75FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_70DC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_712C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v30[3] = type metadata accessor for DefaultCatExecutor();
  v30[4] = &off_72130;
  v30[0] = a5;
  v29[3] = type metadata accessor for CoreServicesProvider();
  v29[4] = &off_721C8;
  v29[0] = a8;
  uint64_t v15 = a9 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction;
  uint64_t v16 = sub_607D0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v18(v15, a1, v16);
  v18(a9 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction, a2, v16);
  v18(a9 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_fallBackAction, a3, v16);
  sub_83F0(a4, a9 + 16);
  sub_83F0((uint64_t)v30, a9 + 56);
  sub_83F0(a6, a9 + 96);
  sub_83F0(a7, a9 + 136);
  sub_83F0((uint64_t)v29, a9 + 176);
  uint64_t v19 = a9 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state;
  uint64_t v20 = sub_6D90(&qword_76028);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 3, v20);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_616D0();
  sub_6D40(v21, (uint64_t)qword_7A9C8);
  uint64_t v22 = sub_616C0();
  os_log_type_t v23 = sub_61960();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_0, v22, v23, "AppNameDisambiguationFlow: new instance initialised", v24, 2u);
    swift_slowDealloc();
  }

  sub_63E8((uint64_t)v29);
  sub_63E8(a7);
  sub_63E8(a6);
  sub_63E8((uint64_t)v30);
  sub_63E8(a4);
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v25(a3, v16);
  v25(a2, v16);
  v25(a1, v16);
  return a9;
}

uint64_t sub_7428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = &type metadata for SNLGTemplatingSectionGenerator;
  uint64_t v26 = &off_72708;
  uint64_t v12 = a6 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_firstAction;
  uint64_t v13 = sub_607D0();
  uint64_t v23 = *(void *)(v13 - 8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v14(v12, a1, v13);
  v14(a6 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_secondAction, a2, v13);
  v14(a6 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_fallBackAction, a3, v13);
  sub_83F0((uint64_t)v24, a6 + 16);
  sub_83F0(a4, a6 + 56);
  sub_83F0(a5, a6 + 96);
  uint64_t v15 = a6 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_state;
  uint64_t v16 = sub_6D90((uint64_t *)&unk_76030);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 2, v16);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_616D0();
  sub_6D40(v17, (uint64_t)qword_7A9C8);
  uint64_t v18 = sub_616C0();
  os_log_type_t v19 = sub_61960();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "VerbEntityDisambiguationFlow: new instance initialised", v20, 2u);
    swift_slowDealloc();
  }

  sub_63E8(a5);
  sub_63E8(a4);
  sub_63E8((uint64_t)v24);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v21(a3, v13);
  v21(a2, v13);
  v21(a1, v13);
  return a6;
}

uint64_t sub_76D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v31 = type metadata accessor for DefaultCatExecutor();
  uint64_t v32 = &off_72130;
  v30[0] = a5;
  uint64_t v28 = type metadata accessor for CoreServicesProvider();
  uint64_t v29 = &off_721C8;
  v27[0] = a8;
  type metadata accessor for AppNameDisambiguationFlow(0);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = sub_70DC((uint64_t)v30, v31);
  __chkstk_darwin(v17, v17);
  os_log_type_t v19 = (void *)((char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = sub_70DC((uint64_t)v27, v28);
  __chkstk_darwin(v21, v21);
  uint64_t v23 = (void *)((char *)v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = sub_712C(a1, a2, a3, a4, *v19, a6, a7, *v23, v16);
  sub_63E8((uint64_t)v27);
  sub_63E8((uint64_t)v30);
  return v25;
}

char *sub_78F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a4;
  uint64_t v35 = a6;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v13 = sub_60A90();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DefaultCatExecutor();
  v39[3] = v18;
  v39[4] = &off_72130;
  v39[0] = a5;
  uint64_t v37 = type metadata accessor for CoreServicesProvider();
  uint64_t v38 = &off_721C8;
  v36[0] = a8;
  type metadata accessor for AppShortcutEnablementFlow(0);
  os_log_type_t v19 = (char *)swift_allocObject();
  uint64_t v20 = sub_70DC((uint64_t)v39, v18);
  __chkstk_darwin(v20, v20);
  uint64_t v22 = (uint64_t *)((char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = sub_70DC((uint64_t)v36, v37);
  __chkstk_darwin(v24, v24);
  uint64_t v26 = (uint64_t *)((char *)&v32 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  uint64_t v28 = *v22;
  uint64_t v29 = *v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a7, v13);
  uint64_t v30 = sub_7C04(a1, v32, v33, v34, v28, v35, (uint64_t)v17, v29, a9, v19);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a7, v13);
  sub_63E8((uint64_t)v36);
  sub_63E8((uint64_t)v39);
  return v30;
}

uint64_t sub_7BBC(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_7C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10)
{
  uint64_t v67 = a6;
  uint64_t v58 = a9;
  uint64_t v17 = sub_60A90();
  v75[3] = v17;
  v75[4] = (uint64_t)&protocol witness table for AppShortcutProvider;
  uint64_t v18 = sub_838C(v75);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v18, a7, v17);
  uint64_t v19 = type metadata accessor for DefaultCatExecutor();
  v74[3] = v19;
  v74[4] = &off_72130;
  v74[0] = a5;
  v73[3] = type metadata accessor for CoreServicesProvider();
  v73[4] = &off_721C8;
  v73[0] = a8;
  *((void *)a10 + 2) = 3;
  uint64_t v20 = &a10[OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutAction];
  uint64_t v21 = sub_607D0();
  uint64_t v61 = *(void *)(v21 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 16);
  uint64_t v66 = a1;
  v22(v20, a1, v21);
  uint64_t v65 = a2;
  uint64_t v62 = v21;
  v22(&a10[OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_otherAction], a2, v21);
  uint64_t v23 = &a10[OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutInvocation];
  uint64_t v24 = sub_60AF0();
  uint64_t v59 = *(void *)(v24 - 8);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v59 + 16);
  uint64_t v64 = a3;
  uint64_t v60 = v24;
  v25(v23, a3);
  uint64_t v63 = a4;
  sub_83F0(a4, (uint64_t)(a10 + 24));
  sub_83F0((uint64_t)v74, (uint64_t)(a10 + 64));
  sub_83F0(v67, (uint64_t)(a10 + 104));
  sub_83F0((uint64_t)v75, (uint64_t)(a10 + 144));
  sub_83F0((uint64_t)v73, (uint64_t)(a10 + 184));
  sub_83F0((uint64_t)(a10 + 64), (uint64_t)v71);
  uint64_t v26 = sub_70DC((uint64_t)v71, v72);
  __chkstk_darwin(v26, v26);
  uint64_t v28 = (uint64_t *)((char *)&v58 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  uint64_t v30 = *v28;
  uint64_t v70 = &off_72130;
  uint64_t v69 = v19;
  v68[0] = v30;
  type metadata accessor for CAMDisambiguateCATs();
  uint64_t v31 = (void *)swift_allocObject();
  uint64_t v32 = sub_70DC((uint64_t)v68, v19);
  uint64_t v33 = *(void *)(v19 - 8);
  uint64_t v34 = *(void *)(v33 + 64);
  __chkstk_darwin(v32, v32);
  unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v36 = *(void (**)(char *))(v33 + 16);
  v36((char *)&v58 - v35);
  uint64_t v37 = *(uint64_t *)((char *)&v58 - v35);
  v31[5] = v19;
  v31[6] = &off_72130;
  v31[2] = v37;
  sub_63E8((uint64_t)v68);
  sub_63E8((uint64_t)v71);
  *((void *)a10 + 33) = v31;
  sub_83F0((uint64_t)(a10 + 64), (uint64_t)v71);
  uint64_t v38 = sub_70DC((uint64_t)v71, v72);
  __chkstk_darwin(v38, v38);
  uint64_t v40 = (uint64_t *)((char *)&v58 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v41 + 16))(v40);
  uint64_t v42 = *v40;
  uint64_t v70 = &off_72130;
  uint64_t v69 = v19;
  v68[0] = v42;
  uint64_t v43 = type metadata accessor for CAMDisambiguateCATPatternsExecutor();
  uint64_t v44 = (void *)swift_allocObject();
  uint64_t v45 = sub_70DC((uint64_t)v68, v19);
  __chkstk_darwin(v45, v45);
  uint64_t v46 = (uint64_t *)((char *)&v58 - v35);
  uint64_t v47 = v58;
  v36((char *)v46);
  uint64_t v48 = *v46;
  v44[5] = v19;
  v44[6] = &off_72130;
  v44[2] = v48;
  sub_63E8((uint64_t)v68);
  sub_63E8((uint64_t)v71);
  *((void *)a10 + 37) = v43;
  *((void *)a10 + 38) = &off_72120;
  *((void *)a10 + 34) = v44;
  sub_83F0(v47, (uint64_t)(a10 + 224));
  uint64_t v49 = &a10[OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_state];
  uint64_t v50 = sub_6D90((uint64_t *)&unk_76030);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 1, 2, v50);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_616D0();
  sub_6D40(v51, (uint64_t)qword_7A9C8);
  uint64_t v52 = sub_616C0();
  os_log_type_t v53 = sub_61960();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    v71[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315138;
    v68[0] = sub_316A4(0xD00000000000008FLL, 0x8000000000064020, v71);
    sub_619C0();
    _os_log_impl(&dword_0, v52, v53, "%s new instance", v54, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_63E8(v47);
  sub_63E8((uint64_t)v73);
  sub_63E8((uint64_t)v75);
  sub_63E8(v67);
  sub_63E8((uint64_t)v74);
  sub_63E8(v63);
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v64, v60);
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  uint64_t v56 = v62;
  v55(v65, v62);
  v55(v66, v56);
  return a10;
}

uint64_t *sub_838C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_83F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_6D90((uint64_t *)&unk_78250);
  v4[6] = swift_task_alloc();
  sub_6D90(&qword_763A8);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_609A0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_607D0();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  return _swift_task_switch(sub_85F4, 0, 0);
}

uint64_t sub_85F4()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[3];
  sub_6D90(&qword_768B0);
  uint64_t v5 = *(void *)(v3 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_62540;
  uint64_t v8 = *(void (**)(void))(v3 + 16);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v7 + v6, v4, v2);
  uint64_t v74 = v7 + v6 + v5;
  uint64_t v75 = v5;
  v8();
  swift_bridgeObjectRetain();
  unint64_t v77 = v7 + v6;
  uint64_t v78 = v8;
  ((void (*)(uint64_t, unint64_t, uint64_t))v8)(v1, v7 + v6, v2);
  uint64_t v9 = sub_470D8();
  uint64_t v11 = v10;
  v76 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v76(v1, v2);
  uint64_t v12 = _swiftEmptyArrayStorage;
  if (v11)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_5DB24(0, _swiftEmptyArrayStorage[2] + 1, 1, _swiftEmptyArrayStorage);
    }
    unint64_t v14 = v12[2];
    unint64_t v13 = v12[3];
    if (v14 >= v13 >> 1) {
      uint64_t v12 = sub_5DB24((void *)(v13 > 1), v14 + 1, 1, v12);
    }
    v12[2] = v14 + 1;
    uint64_t v15 = &v12[2 * v14];
    v15[4] = v9;
    v15[5] = v11;
  }
  uint64_t v16 = v0[15];
  uint64_t v17 = v0[12];
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v16, v74, v17);
  uint64_t v18 = sub_470D8();
  uint64_t v20 = v19;
  v76(v16, v17);
  if (v20)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_5DB24(0, v12[2] + 1, 1, v12);
    }
    unint64_t v22 = v12[2];
    unint64_t v21 = v12[3];
    if (v22 >= v21 >> 1) {
      uint64_t v12 = sub_5DB24((void *)(v21 > 1), v22 + 1, 1, v12);
    }
    v12[2] = v22 + 1;
    uint64_t v23 = &v12[2 * v22];
    v23[4] = v18;
    v23[5] = v20;
  }
  uint64_t v24 = v0[9];
  swift_bridgeObjectRelease();
  uint64_t v73 = sub_C724((uint64_t)v12);
  swift_bridgeObjectRelease();
  uint64_t v25 = (void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32);
  swift_bridgeObjectRetain();
  char v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = _swiftEmptyArrayStorage;
  do
  {
    char v29 = v26;
    uint64_t v30 = v0[6];
    ((void (*)(void, unint64_t, void))v78)(v0[14], v77 + v27 * v75, v0[12]);
    sub_60790();
    uint64_t v31 = sub_609D0();
    uint64_t v32 = *(void *)(v31 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
    {
      uint64_t v34 = v0[7];
      uint64_t v33 = v0[8];
      sub_6EE8(v0[6], (uint64_t *)&unk_78250);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v34, 1, 1, v33);
    }
    else
    {
      uint64_t v35 = v0[6];
      sub_609B0();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v35, v31);
    }
    uint64_t v37 = v0[7];
    uint64_t v36 = v0[8];
    v76(v0[14], v0[12]);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v37, 1, v36) == 1)
    {
      sub_6EE8(v0[7], &qword_763A8);
    }
    else
    {
      uint64_t v39 = v0[10];
      uint64_t v38 = v0[11];
      uint64_t v40 = v0[8];
      uint64_t v41 = *v25;
      (*v25)(v38, v0[7], v40);
      v41(v39, v38, v40);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v28 = (void *)sub_5D870(0, v28[2] + 1, 1, (unint64_t)v28);
      }
      unint64_t v43 = v28[2];
      unint64_t v42 = v28[3];
      if (v43 >= v42 >> 1) {
        uint64_t v28 = (void *)sub_5D870(v42 > 1, v43 + 1, 1, (unint64_t)v28);
      }
      uint64_t v44 = v0[10];
      uint64_t v45 = v0[8];
      v28[2] = v43 + 1;
      v41((uint64_t)v28+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v43, v44, v45);
    }
    char v26 = 1;
    uint64_t v27 = 1;
  }
  while ((v29 & 1) == 0);
  swift_bridgeObjectRelease();
  uint64_t v46 = sub_C7BC((uint64_t)v28);
  swift_bridgeObjectRelease();
  uint64_t v47 = *(void *)(v46 + 16);
  swift_bridgeObjectRelease();
  uint64_t v48 = *(void *)(v7 + 16);
  if (v47 == v48)
  {
    uint64_t v49 = v0[12];
    uint64_t v51 = v0[2];
    uint64_t v50 = v0[3];
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t, uint64_t))v78)(v51, v50, v49);
    type metadata accessor for ActionDisambiguationStrategy();
LABEL_42:
    swift_storeEnumTagMultiPayload();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v72 = (uint64_t (*)(void))v0[1];
    return v72();
  }
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_616D0();
  sub_6D40(v52, (uint64_t)qword_7A9C8);
  os_log_type_t v53 = sub_616C0();
  os_log_type_t v54 = sub_61960();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl(&dword_0, v53, v54, "ActionDisambiguationStrategy: no two distinct verb entity paraphrases", v55, 2u);
    swift_slowDealloc();
  }

  uint64_t v56 = *(void *)(v73 + 16);
  swift_bridgeObjectRelease();
  if (v56 != v48)
  {
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v64 = sub_616C0();
    os_log_type_t v65 = sub_61960();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl(&dword_0, v64, v65, "ActionDisambiguationStrategy: no two distinct app bundle ids", v66, 2u);
      swift_slowDealloc();
    }
    goto LABEL_41;
  }
  char v57 = sub_2F698(v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  if ((v57 & 1) == 0)
  {
    uint64_t v64 = sub_616C0();
    os_log_type_t v67 = sub_61960();
    if (os_log_type_enabled(v64, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_0, v64, v67, "ActionDisambiguationStrategy: no app shortcut detected", v68, 2u);
      swift_slowDealloc();
    }
LABEL_41:
    uint64_t v69 = v0[12];
    uint64_t v71 = v0[2];
    uint64_t v70 = v0[3];

    ((void (*)(uint64_t, uint64_t, uint64_t))v78)(v71, v70, v69);
    type metadata accessor for ActionDisambiguationStrategy();
    goto LABEL_42;
  }
  uint64_t v58 = (void *)swift_task_alloc();
  v0[16] = v58;
  *uint64_t v58 = v0;
  v58[1] = sub_8EAC;
  uint64_t v59 = v0[4];
  uint64_t v60 = v0[5];
  uint64_t v61 = v0[2];
  uint64_t v62 = v0[3];
  return sub_9098(v61, v62, v59, v60);
}

uint64_t sub_8EAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_9058()
{
  qword_7A898 = sub_60A90();
  unk_7A8A0 = &protocol witness table for AppShortcutProvider;
  sub_838C(qword_7A880);
  return sub_60A80();
}

uint64_t sub_9098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  sub_6D90(&qword_768F0);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_60AF0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  uint64_t v6 = sub_616D0();
  v4[11] = v6;
  v4[12] = *(void *)(v6 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v7 = sub_607D0();
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v8 = sub_60D10();
  v4[18] = v8;
  v4[19] = *(void *)(v8 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  uint64_t v9 = sub_60C90();
  v4[24] = v9;
  v4[25] = *(void *)(v9 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  uint64_t v10 = sub_60DA0();
  v4[30] = v10;
  v4[31] = *(void *)(v10 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  return _swift_task_switch(sub_93E0, 0, 0);
}

uint64_t sub_93E0()
{
  uint64_t v106 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 288) = sub_6D40(*(void *)(v0 + 88), (uint64_t)qword_7A9C8);
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61960();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "ActionDisambiguationStrategy: computing strategy for app shortcut collision", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 184);
  uint64_t v9 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 152);

  sub_607B0();
  sub_60C80();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v0 + 296) = v11;
  *(void *)(v0 + 304) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v101 = v11;
  v11(v5, v7);
  uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t))(v10 + 88);
  *(void *)(v0 + 312) = v12;
  *(void *)(v0 + 320) = (v10 + 88) & 0xFFFFFFFFFFFFLL | 0xA3B5000000000000;
  uint64_t v98 = v12;
  unsigned int v13 = v12(v8, v9);
  int v14 = enum case for Parse.uso(_:);
  *(_DWORD *)(v0 + 352) = enum case for Parse.uso(_:);
  int v97 = v14;
  if (v13 == v14)
  {
    uint64_t v15 = *(void *)(v0 + 280);
    uint64_t v16 = *(void *)(v0 + 240);
    uint64_t v17 = *(void *)(v0 + 248);
    uint64_t v18 = *(void *)(v0 + 184);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 96))(v18, *(void *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v15, v18, v16);
    BOOL v19 = sub_60D60();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 144));
    BOOL v19 = 0;
  }
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v21 = *(void *)(v0 + 192);
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v23 = *(void *)(v0 + 144);
  sub_607B0();
  sub_60C80();
  v101(v20, v21);
  if (v98(v22, v23) == v97)
  {
    uint64_t v24 = *(void *)(v0 + 272);
    uint64_t v25 = *(void *)(v0 + 240);
    uint64_t v26 = *(void *)(v0 + 248);
    uint64_t v27 = *(void *)(v0 + 176);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 96))(v27, *(void *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v24, v27, v25);
    BOOL v28 = sub_60D60();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 144));
    BOOL v28 = 0;
  }
  char v29 = sub_616C0();
  os_log_type_t v30 = sub_61960();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 67109376;
    *(_DWORD *)(v0 + 344) = v19;
    sub_619C0();
    *(_WORD *)(v31 + 8) = 1024;
    *(_DWORD *)(v0 + 348) = v28;
    uint64_t v4 = (void *)(v0 + 32);
    sub_619C0();
    _os_log_impl(&dword_0, v29, v30, "ActionDisambiguationStrategy: firstActionIsForAppShortcut=%{BOOL}d, secondActionIsForAppShortcut=%{BOOL}d ", (uint8_t *)v31, 0xEu);
    swift_slowDealloc();
  }

  if (v19)
  {
    if (v28)
    {
      uint64_t v32 = sub_616C0();
      os_log_type_t v33 = sub_61960();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_0, v32, v33, "Disambiguating for App Shortcut vs App Shortcut", v34, 2u);
        swift_slowDealloc();
      }
      uint64_t v35 = *(void *)(v0 + 120);

      uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
      uint64_t v37 = *(void *)(v0 + 24);
      goto LABEL_34;
    }
    uint64_t v39 = *(void *)(v0 + 128);
    uint64_t v38 = *(void *)(v0 + 136);
    uint64_t v40 = *(void *)(v0 + 112);
    uint64_t v41 = *(void *)(v0 + 120);
    uint64_t v42 = *(void *)(v0 + 32);
    uint64_t v43 = *(void *)(v0 + 40);
  }
  else
  {
    uint64_t v39 = *(void *)(v0 + 128);
    uint64_t v38 = *(void *)(v0 + 136);
    uint64_t v40 = *(void *)(v0 + 112);
    uint64_t v41 = *(void *)(v0 + 120);
    uint64_t v43 = *(void *)(v0 + 32);
    uint64_t v42 = *(void *)(v0 + 40);
  }
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
  v44(v38, v42, v40);
  v44(v39, v43, v40);
  *(void *)(v0 + 328) = v44;
  uint64_t v45 = *(void *)(v0 + 216);
  uint64_t v46 = *(void *)(v0 + 192);
  uint64_t v47 = *(void *)(v0 + 168);
  uint64_t v48 = *(void *)(v0 + 144);
  sub_607B0();
  sub_60C80();
  v101(v45, v46);
  if (v98(v47, v48) != v97)
  {
    uint64_t v99 = v4;
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 144));
    (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 288), *(void *)(v0 + 88));
    uint64_t v55 = sub_616C0();
    os_log_type_t v56 = sub_61960();
    BOOL v57 = os_log_type_enabled(v55, v56);
    uint64_t v58 = *(void *)(v0 + 96);
    uint64_t v59 = *(void *)(v0 + 104);
    uint64_t v60 = *(void *)(v0 + 88);
    if (v57)
    {
      uint64_t v102 = *(void *)(v0 + 104);
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v105 = swift_slowAlloc();
      *(_DWORD *)uint64_t v61 = 136315138;
      *(void *)(v0 + 16) = sub_316A4(0x64656C6261736964, 0xE800000000000000, &v105);
      sub_619C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v55, v56, "App Shortcut (%s) vs NLV4/POMMES", v61, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v102, v60);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v59, v60);
    }
    int v103 = *(_DWORD *)(v0 + 352);
    uint64_t v62 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v64 = *(void *)(v0 + 208);
    uint64_t v65 = *(void *)(v0 + 192);
    uint64_t v66 = *(void *)(v0 + 160);
    uint64_t v67 = *(void *)(v0 + 144);
    sub_607B0();
    sub_60C80();
    v63(v64, v65);
    if (v62(v66, v67) == v103)
    {
      uint64_t v69 = *(void *)(v0 + 248);
      uint64_t v68 = *(void *)(v0 + 256);
      uint64_t v70 = *(void *)(v0 + 240);
      uint64_t v71 = *(void *)(v0 + 160);
      uint64_t v72 = *(void *)(v0 + 64);
      uint64_t v73 = *(void *)(v0 + 72);
      uint64_t v74 = *(void *)(v0 + 56);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 96))(v71, *(void *)(v0 + 144));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v68, v71, v70);
      sub_60D70();
      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      uint64_t v4 = v99;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v74, 1, v72) != 1)
      {
        uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 72) + 32);
        v75(*(void *)(v0 + 80), *(void *)(v0 + 56), *(void *)(v0 + 64));
        v76 = sub_616C0();
        os_log_type_t v77 = sub_61960();
        if (os_log_type_enabled(v76, v77))
        {
          uint64_t v78 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v78 = 0;
          _os_log_impl(&dword_0, v76, v77, "Returning appShortcutCollisionWithEnablement as the disambiguation strategy", v78, 2u);
          swift_slowDealloc();
        }
        uint64_t v79 = *(void *)(v0 + 120);
        uint64_t v100 = *(void *)(v0 + 112);
        uint64_t v104 = *(void *)(v0 + 136);
        uint64_t v80 = *(void *)(v0 + 80);
        uint64_t v81 = *(void *)(v0 + 64);
        uint64_t v82 = *(void *)(v0 + 24);

        uint64_t v83 = sub_6D90(&qword_76010);
        uint64_t v84 = v82 + *(int *)(v83 + 48);
        uint64_t v85 = v82 + *(int *)(v83 + 64);
        v75(v82, v80, v81);
        v86 = *(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 32);
        v86(v84, v104, v100);
        uint64_t v87 = v85;
        uint64_t v36 = v86;
        uint64_t v4 = (void *)(v0 + 128);
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v88 = *(void *)(v0 + 64);
      uint64_t v89 = *(void *)(v0 + 72);
      uint64_t v90 = *(void *)(v0 + 56);
      (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v89 + 56))(v90, 1, 1, v88);
      uint64_t v4 = v99;
    }
    uint64_t v91 = *(void *)(v0 + 136);
    uint64_t v92 = *(void *)(v0 + 112);
    uint64_t v93 = *(void *)(v0 + 56);
    uint64_t v94 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 120) + 8);
    v94(*(void *)(v0 + 128), v92);
    v94(v91, v92);
    sub_6EE8(v93, &qword_768F0);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
    uint64_t v37 = *(void *)(v0 + 24);
LABEL_34:
    uint64_t v87 = v37;
LABEL_35:
    v36(v87, *v4, *(void *)(v0 + 112));
    type metadata accessor for ActionDisambiguationStrategy();
    swift_storeEnumTagMultiPayload();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v95 = *(uint64_t (**)(void))(v0 + 8);
    return v95();
  }
  uint64_t v49 = *(void *)(v0 + 264);
  uint64_t v50 = *(void *)(v0 + 240);
  uint64_t v51 = *(void *)(v0 + 248);
  uint64_t v52 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 96))(v52, *(void *)(v0 + 144));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v49, v52, v50);
  os_log_type_t v53 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v53;
  *os_log_type_t v53 = v0;
  v53[1] = sub_9F18;
  uint64_t v54 = *(void *)(v0 + 48);
  return USOParse.isEnabledAppShortcutInvocation(provider:)(v54);
}

uint64_t sub_9F18(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 264);
  uint64_t v3 = *(void *)(*(void *)v1 + 248);
  uint64_t v4 = *(void *)(*(void *)v1 + 240);
  *(unsigned char *)(*(void *)v1 + 356) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_A078, 0, 0);
}

uint64_t sub_A078()
{
  uint64_t v62 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 356);
  (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 288), *(void *)(v0 + 88));
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (!os_log_type_enabled(v2, v3))
  {
    uint64_t v38 = *(void *)(v0 + 96);
    uint64_t v37 = *(void *)(v0 + 104);
    uint64_t v39 = *(void *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
    if (!v1) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v40 = sub_616C0();
    os_log_type_t v41 = sub_61960();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "Disambiguating between App Shortcut and NLv4/POMMES", v42, 2u);
      swift_slowDealloc();
    }
    uint64_t v43 = *(void *)(v0 + 136);
    uint64_t v45 = *(void *)(v0 + 112);
    uint64_t v44 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32);
    uint64_t v36 = (uint64_t *)(v0 + 128);
    uint64_t v46 = *(void *)(v0 + 24);
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v56 = *(void *)(v0 + 88);
  uint64_t v58 = *(void *)(v0 + 104);
  uint64_t v5 = (uint8_t *)swift_slowAlloc();
  uint64_t v6 = swift_slowAlloc();
  *(_DWORD *)uint64_t v5 = 136315138;
  uint64_t v61 = v6;
  if (v1) {
    uint64_t v7 = 0x64656C62616E65;
  }
  else {
    uint64_t v7 = 0x64656C6261736964;
  }
  if (v1) {
    unint64_t v8 = 0xE700000000000000;
  }
  else {
    unint64_t v8 = 0xE800000000000000;
  }
  *(void *)(v0 + 16) = sub_316A4(v7, v8, &v61);
  sub_619C0();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v2, v3, "App Shortcut (%s) vs NLV4/POMMES", v5, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v58, v56);
  if (v1) {
    goto LABEL_15;
  }
LABEL_9:
  int v59 = *(_DWORD *)(v0 + 352);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
  uint64_t v11 = *(void *)(v0 + 208);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 160);
  uint64_t v14 = *(void *)(v0 + 144);
  sub_607B0();
  sub_60C80();
  v10(v11, v12);
  if (v9(v13, v14) != v59)
  {
    uint64_t v47 = *(void *)(v0 + 64);
    uint64_t v48 = *(void *)(v0 + 72);
    uint64_t v49 = *(void *)(v0 + 56);
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v49, 1, 1, v47);
    goto LABEL_19;
  }
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v15 = *(void *)(v0 + 256);
  uint64_t v17 = *(void *)(v0 + 240);
  uint64_t v18 = *(void *)(v0 + 160);
  uint64_t v19 = *(void *)(v0 + 64);
  uint64_t v20 = *(void *)(v0 + 72);
  uint64_t v21 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 96))(v18, *(void *)(v0 + 144));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v15, v18, v17);
  sub_60D70();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v21, 1, v19) == 1)
  {
LABEL_19:
    uint64_t v50 = *(void *)(v0 + 136);
    uint64_t v51 = *(void *)(v0 + 112);
    uint64_t v52 = *(void *)(v0 + 56);
    os_log_type_t v53 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 120) + 8);
    v53(*(void *)(v0 + 128), v51);
    v53(v50, v51);
    sub_6EE8(v52, &qword_768F0);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
    uint64_t v36 = (uint64_t *)(v0 + 32);
    uint64_t v46 = *(void *)(v0 + 24);
LABEL_20:
    uint64_t v34 = v46;
    goto LABEL_21;
  }
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 72) + 32);
  v60(*(void *)(v0 + 80), *(void *)(v0 + 56), *(void *)(v0 + 64));
  uint64_t v22 = sub_616C0();
  os_log_type_t v23 = sub_61960();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_0, v22, v23, "Returning appShortcutCollisionWithEnablement as the disambiguation strategy", v24, 2u);
    swift_slowDealloc();
  }
  uint64_t v57 = *(void *)(v0 + 136);
  uint64_t v25 = *(void *)(v0 + 112);
  uint64_t v26 = *(void *)(v0 + 120);
  uint64_t v27 = *(void *)(v0 + 80);
  uint64_t v28 = *(void *)(v0 + 64);
  uint64_t v29 = *(void *)(v0 + 24);

  uint64_t v30 = sub_6D90(&qword_76010);
  uint64_t v31 = v29 + *(int *)(v30 + 48);
  uint64_t v32 = v29 + *(int *)(v30 + 64);
  v60(v29, v27, v28);
  os_log_type_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32);
  v33(v31, v57, v25);
  uint64_t v34 = v32;
  uint64_t v35 = v33;
  uint64_t v36 = (uint64_t *)(v0 + 128);
LABEL_21:
  v35(v34, *v36, *(void *)(v0 + 112));
  type metadata accessor for ActionDisambiguationStrategy();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
  return v54();
}

uint64_t sub_A6DC()
{
  uint64_t v1 = sub_60AF0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_607D0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)v27 - v13;
  uint64_t v15 = type metadata accessor for ActionDisambiguationStrategy();
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AC18(v0, (uint64_t)v18);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v21 = sub_6D90(&qword_76010);
      uint64_t v22 = &v18[*(int *)(v21 + 48)];
      os_log_type_t v23 = &v18[*(int *)(v21 + 64)];
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v18, v1);
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_61A70(45);
      swift_bridgeObjectRelease();
      v27[0] = 0xD00000000000002BLL;
      v27[1] = 0x8000000000064100;
      v28._countAndFlagsBits = sub_60AE0();
      sub_61820(v28);
      swift_bridgeObjectRelease();
      uint64_t v24 = v27[0];
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      uint64_t v25 = *(void (**)(char *, uint64_t))(v7 + 8);
      v25(v23, v6);
      v25(v22, v6);
      return v24;
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v18, v6);
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_61A70(28);
      swift_bridgeObjectRelease();
      unint64_t v19 = 0xD00000000000001ALL;
      uint64_t v20 = "appNames with fallback to ";
      goto LABEL_6;
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v18, v6);
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_61A70(40);
      swift_bridgeObjectRelease();
      unint64_t v19 = 0xD000000000000026;
      uint64_t v20 = "verbEntityParaphrase with fallback to ";
      goto LABEL_6;
    case 4u:
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v18, v6);
      strcpy((char *)v27, "redirect to ");
      BYTE5(v27[1]) = 0;
      HIWORD(v27[1]) = -5120;
      sub_C958((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      v30._countAndFlagsBits = sub_61C90();
      sub_61820(v30);
      swift_bridgeObjectRelease();
      uint64_t v24 = v27[0];
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      return v24;
    default:
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v18, v6);
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_61A70(40);
      swift_bridgeObjectRelease();
      unint64_t v19 = 0xD000000000000026;
      uint64_t v20 = "appShortcutCollision with fallback to ";
LABEL_6:
      v27[0] = v19;
      v27[1] = (unint64_t)(v20 - 32) | 0x8000000000000000;
      sub_C958((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      v29._countAndFlagsBits = sub_61C90();
      sub_61820(v29);
      swift_bridgeObjectRelease();
      uint64_t v24 = v27[0];
      (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
      return v24;
  }
}

uint64_t type metadata accessor for ActionDisambiguationStrategy()
{
  uint64_t result = qword_76448;
  if (!qword_76448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_AC18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionDisambiguationStrategy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_AC80(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_609A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_C958(&qword_763B8, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v12 = sub_617C0();
  uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v14 = v12 & ~v13;
  uint64_t v33 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    Swift::String v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v13;
    uint64_t v28 = v7;
    uint64_t v17 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v16 = v7 + 16;
    uint64_t v15 = v17;
    uint64_t v32 = *(void *)(v16 + 56);
    uint64_t v18 = (void (**)(char *, uint64_t))(v16 - 8);
    v27[1] = v16 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v19 = v11;
      unint64_t v20 = v32 * v14;
      uint64_t v21 = v15;
      v15(v10, *(void *)(v11 + 48) + v32 * v14, v6);
      sub_C958(&qword_763C0, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
      char v22 = sub_617D0();
      os_log_type_t v23 = *v18;
      (*v18)(v10, v6);
      if (v22) {
        break;
      }
      unint64_t v14 = (v14 + 1) & v31;
      uint64_t v11 = v19;
      uint64_t v15 = v21;
      if (((*(void *)(v33 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v20, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = v34;
    v15(v10, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_B830((uint64_t)v10, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_AFA4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_61D40();
  swift_bridgeObjectRetain();
  sub_61810();
  Swift::Int v8 = sub_61D60();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_61CA0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
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
      if (v19 || (sub_61CA0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_BAD0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_B154()
{
  uint64_t v1 = v0;
  uint64_t v43 = sub_609A0();
  uint64_t v2 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v3);
  uint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_6D90(&qword_763C8);
  uint64_t v6 = sub_61A60();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v38 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v40 = v2;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    uint64_t v39 = v7;
    Swift::Int v15 = v42;
    uint64_t v16 = v43;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v41 = v14;
        unint64_t v19 = v18 | (v14 << 6);
      }
      else
      {
        int64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v37) {
          goto LABEL_33;
        }
        unint64_t v21 = v38[v20];
        int64_t v22 = v14 + 1;
        if (!v21)
        {
          int64_t v22 = v14 + 2;
          if (v14 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v21 = v38[v22];
          if (!v21)
          {
            int64_t v22 = v14 + 3;
            if (v14 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v21 = v38[v22];
            if (!v21)
            {
              uint64_t v23 = v14 + 4;
              if (v14 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v36;
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 > 63) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v21 = v38[v23];
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_39;
                  }
                  if (v22 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = v38[v22];
                  ++v23;
                  if (v21) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v22 = v14 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v21 - 1) & v21;
        int64_t v41 = v22;
        unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 48);
      uint64_t v26 = *(void *)(v40 + 72);
      uint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
      v27(v15, v25 + v26 * v19, v16);
      uint64_t v7 = v39;
      sub_C958(&qword_763B8, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
      uint64_t result = sub_617C0();
      uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(void *)(v7 + 48) + v17 * v26, v42, v43);
      ++*(void *)(v7 + 16);
      uint64_t v5 = v24;
      int64_t v14 = v41;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_B550()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_6D90(&qword_763D0);
  uint64_t v3 = sub_61A60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_61D40();
      sub_61810();
      uint64_t result = sub_61D60();
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

uint64_t sub_B830(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v32 = a1;
  uint64_t v6 = sub_609A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
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
    sub_B154();
  }
  else
  {
    if (v12 > v11)
    {
      sub_BC6C();
      goto LABEL_12;
    }
    sub_C0C4();
  }
  uint64_t v13 = *v3;
  sub_C958(&qword_763B8, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
  uint64_t v14 = sub_617C0();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v14 & ~v15;
  uint64_t v31 = v13;
  uint64_t v16 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v15;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v7 + 16;
    int64_t v18 = v20;
    uint64_t v21 = *(void *)(v19 + 56);
    do
    {
      v18(v10, *(void *)(v31 + 48) + v21 * a2, v6);
      sub_C958(&qword_763C0, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
      char v22 = sub_617D0();
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
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v23 + 32))(*(void *)(v24 + 48) + *(void *)(v23 + 72) * a2, v32, v6);
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
  uint64_t result = sub_61CC0();
  __break(1u);
  return result;
}

Swift::Int sub_BAD0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_B550();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_BF10();
      goto LABEL_22;
    }
    sub_C474();
  }
  uint64_t v11 = *v4;
  sub_61D40();
  sub_61810();
  uint64_t result = sub_61D60();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_61CA0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_61CC0();
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
          uint64_t result = sub_61CA0();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
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

void *sub_BC6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_609A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6D90(&qword_763C8);
  uint64_t v7 = *v0;
  uint64_t v8 = sub_61A50();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v9;
    return result;
  }
  BOOL v23 = v1;
  uint64_t result = (void *)(v8 + 56);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 56), 8 * v11);
  }
  uint64_t v24 = v7 + 56;
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v19 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_25;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_25;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v18, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v18, v6, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_BF10()
{
  uint64_t v1 = v0;
  sub_6D90(&qword_763D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_61A50();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
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

uint64_t sub_C0C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_609A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v0;
  sub_6D90(&qword_763C8);
  uint64_t v8 = sub_61A60();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v9;
    return result;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 56);
  uint64_t v35 = v0;
  uint64_t v36 = v7 + 56;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v3 + 16;
  uint64_t v14 = v8 + 56;
  uint64_t v39 = v3;
  unint64_t v15 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v36 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v37) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v36 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    uint64_t v24 = v7;
    uint64_t v25 = *(void *)(v7 + 48);
    uint64_t v26 = *(void *)(v39 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v6, v25 + v26 * v20, v2);
    sub_C958(&qword_763B8, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
    uint64_t result = sub_617C0();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = (*v15)(*(void *)(v9 + 48) + v18 * v26, v6, v2);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v24;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v35;
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_C474()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_6D90(&qword_763D0);
  uint64_t v3 = sub_61A60();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_61D40();
    swift_bridgeObjectRetain();
    sub_61810();
    uint64_t result = sub_61D60();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_C724(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_61930();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_AFA4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_C7BC(uint64_t a1)
{
  uint64_t v2 = sub_609A0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  Swift::Int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  sub_C958(&qword_763B8, (void (*)(uint64_t))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
  uint64_t result = sub_61930();
  uint64_t v19 = result;
  if (v11)
  {
    unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v13 = v3 + 16;
    unint64_t v14 = v15;
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v17 = *(void *)(v13 + 56);
    do
    {
      v14(v7, v16, v2);
      sub_AC80((uint64_t)v10, v7);
      (*(void (**)(char *, uint64_t))(v13 - 8))(v10, v2);
      v16 += v17;
      --v11;
    }
    while (v11);
    return v19;
  }
  return result;
}

uint64_t sub_C958(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_C9A0(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = sub_60AF0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = sub_6D90(&qword_76010);
        uint64_t v9 = *(int *)(v8 + 48);
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        uint64_t v12 = sub_607D0();
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        v13(v10, v11, v12);
        v13(&a1[*(int *)(v8 + 64)], &a2[*(int *)(v8 + 64)], v12);
        break;
      default:
        uint64_t v14 = sub_607D0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_CC74(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 2:
    case 3:
    case 4:
      uint64_t v3 = sub_607D0();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t v5 = v3;
      uint64_t v6 = a1;
      goto LABEL_4;
    case 1:
      uint64_t v7 = sub_60AF0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      uint64_t v8 = sub_6D90(&qword_76010);
      uint64_t v9 = a1 + *(int *)(v8 + 48);
      uint64_t v10 = sub_607D0();
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v11)((void *)(v10 - 8), v9, v10);
      uint64_t v6 = a1 + *(int *)(v8 + 64);
      uint64_t v5 = v10;
      uint64_t v4 = v11;
LABEL_4:
      uint64_t result = v4(v6, v5);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_CDE8(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_60AF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    uint64_t v6 = sub_6D90(&qword_76010);
    uint64_t v7 = *(int *)(v6 + 48);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    uint64_t v10 = sub_607D0();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v11(a1 + *(int *)(v6 + 64), a2 + *(int *)(v6 + 64), v10);
  }
  else
  {
    uint64_t v4 = sub_607D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_CF80(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_D128(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_60AF0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = sub_6D90(&qword_76010);
      uint64_t v7 = *(int *)(v6 + 48);
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      uint64_t v10 = sub_607D0();
      uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
      v11(v8, v9, v10);
      v11(a1 + *(int *)(v6 + 64), a2 + *(int *)(v6 + 64), v10);
    }
    else
    {
      uint64_t v4 = sub_607D0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_D128(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActionDisambiguationStrategy();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_D184(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_60AF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    uint64_t v6 = sub_6D90(&qword_76010);
    uint64_t v7 = *(int *)(v6 + 48);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    uint64_t v10 = sub_607D0();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
    v11(v8, v9, v10);
    v11(a1 + *(int *)(v6 + 64), a2 + *(int *)(v6 + 64), v10);
  }
  else
  {
    uint64_t v4 = sub_607D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_D31C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_D128(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_60AF0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = sub_6D90(&qword_76010);
      uint64_t v7 = *(int *)(v6 + 48);
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      uint64_t v10 = sub_607D0();
      uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
      v11(v8, v9, v10);
      v11(a1 + *(int *)(v6 + 64), a2 + *(int *)(v6 + 64), v10);
    }
    else
    {
      uint64_t v4 = sub_607D0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_D4C4()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    uint64_t v5 = v2;
    uint64_t result = sub_60AF0();
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout3();
      uint64_t v6 = &v4;
      uint64_t v7 = v2;
      uint64_t v8 = v2;
      uint64_t v9 = v2;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_D5A8(uint64_t a1)
{
  v2[37] = a1;
  v2[38] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[39] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[43] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[44] = v4;
  v2[45] = *(void *)(v4 - 8);
  v2[46] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[47] = v5;
  v2[48] = *(void *)(v5 - 8);
  v2[49] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[50] = v6;
  v2[51] = *(void *)(v6 - 8);
  v2[52] = swift_task_alloc();
  return _swift_task_switch(sub_D7DC, 0, 0);
}

uint64_t sub_D7DC()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AirplaneModeFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }

  sub_614C0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = [self bundleForClass:ObjCClassFromMetadata];
  v0[54] = v6;
  unint64_t v7 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[55] = v7;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v9 = sub_3C438(inited);
  v0[56] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_77348 + dword_77348);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[57] = v10;
  void *v10 = v0;
  v10[1] = sub_E068;
  return v12((uint64_t)v6, 0xD000000000000022, 0x8000000000064190, v7, v9);
}

uint64_t sub_DA10()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v21 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v20 = *(void *)(v0 + 352);
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v19 = *(void **)(v0 + 304);
  id v5 = *(id *)(v0 + 464);
  id v6 = [v5 speak];
  sub_61870();

  id v7 = [v5 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  id v8 = [v5 print];
  uint64_t v9 = sub_61870();

  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  sub_45D64(0, 0xE000000000000000, v10);
  id v11 = [v5 meta];

  sub_617A0();
  sub_609E0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 136), *(void *)(v0 + 160));
  sub_606D0();
  uint64_t v12 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  *(void *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_608A0();
  sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  uint64_t v13 = v19[10];
  uint64_t v14 = v19[11];
  sub_6EA4(v19 + 7, v13);
  *(void *)(v0 + 240) = v20;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  unint64_t v15 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 16))(v15, v18, v20);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_DD8C;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v13, v14);
}

uint64_t sub_DD8C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_E3A4;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_E1A0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_DEAC()
{
  id v6 = v0;
  uint64_t v1 = (void *)v0[54];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_61A70(46);
  swift_bridgeObjectRelease();
  v5[0] = 0xD00000000000002CLL;
  v5[1] = 0x80000000000641C0;
  swift_getErrorValue();
  v8._countAndFlagsBits = sub_61CE0();
  sub_61820(v8);
  swift_bridgeObjectRelease();
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  v0[35] = sub_352DC(0xD00000000000002CLL, 0x80000000000641C0, (uint64_t)v4, (uint64_t)v5);
  sub_E91C();
  sub_608D0();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_E068(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 464) = a1;
  *(void *)(v3 + 472) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_DEAC;
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_DA10;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E1A0()
{
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  id v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.completed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_E3A4()
{
  sub_63E8((uint64_t)(v0 + 27));
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  id v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.completed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_E5B0()
{
  return sub_60670();
}

uint64_t sub_E5F4()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AirplaneModeFlow()
{
  return self;
}

uint64_t sub_E660()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_616D0();
  sub_6D40(v0, (uint64_t)qword_7A9C8);
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61960();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "AirplaneModeFlow input accepted", v3, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_E73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_6A14;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_E7EC()
{
  return sub_60550();
}

uint64_t sub_E848(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_D5A8(a1);
}

uint64_t sub_E8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AirplaneModeFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

unint64_t sub_E91C()
{
  unint64_t result = qword_78370;
  if (!qword_78370)
  {
    type metadata accessor for CamErrorFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_78370);
  }
  return result;
}

void sub_E974()
{
  qword_7A8A8 = 0x54746E6572727543;
  unk_7A8B0 = 0xEB000000006B7361;
}

uint64_t sub_E9A0()
{
  uint64_t v0 = type metadata accessor for UserHistoryHelper();
  uint64_t result = swift_allocObject();
  qword_7A8D0 = v0;
  unk_7A8D8 = &off_727A8;
  qword_7A8B8 = result;
  return result;
}

uint64_t sub_E9EC()
{
  qword_7A8F8 = sub_60A90();
  unk_7A900 = &protocol witness table for AppShortcutProvider;
  sub_838C(qword_7A8E0);
  return sub_60A80();
}

uint64_t sub_EA2C(uint64_t a1)
{
  uint64_t v2 = sub_612F0();
  uint64_t v184 = *(void *)(v2 - 8);
  uint64_t v185 = v2;
  __chkstk_darwin(v2, v3);
  v183 = (char *)&v154 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppNameDisambiguationFlow.State(0);
  uint64_t v7 = __chkstk_darwin(v5 - 8, v6);
  uint64_t v173 = (uint64_t)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v162 = (uint64_t)&v154 - v11;
  __chkstk_darwin(v10, v12);
  v175 = (char *)&v154 - v13;
  uint64_t v189 = sub_607D0();
  uint64_t v14 = *(void *)(v189 - 8);
  uint64_t v16 = __chkstk_darwin(v189, v15);
  uint64_t v18 = (char *)&v154 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v16, v19);
  v157 = (char *)&v154 - v21;
  uint64_t v23 = __chkstk_darwin(v20, v22);
  v156 = (char *)&v154 - v24;
  __chkstk_darwin(v23, v25);
  v159 = (char *)&v154 - v26;
  uint64_t v167 = sub_60DA0();
  uint64_t v166 = *(void *)(v167 - 8);
  __chkstk_darwin(v167, v27);
  v165 = (char *)&v154 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = sub_60CF0();
  uint64_t v169 = *(void *)(v170 - 8);
  __chkstk_darwin(v170, v29);
  v168 = (char *)&v154 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = (void *)sub_60D10();
  uint64_t v182 = *(v186 - 1);
  uint64_t v32 = __chkstk_darwin(v186, v31);
  v158 = (char *)&v154 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v32, v34);
  v161 = (char *)&v154 - v36;
  __chkstk_darwin(v35, v37);
  v181 = (char *)&v154 - v38;
  uint64_t v39 = sub_6D90((uint64_t *)&unk_76940);
  uint64_t v41 = __chkstk_darwin(v39 - 8, v40);
  v179 = (char *)&v154 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __chkstk_darwin(v41, v43);
  uint64_t v171 = (uint64_t)&v154 - v45;
  uint64_t v47 = __chkstk_darwin(v44, v46);
  uint64_t v160 = (uint64_t)&v154 - v48;
  uint64_t v50 = __chkstk_darwin(v47, v49);
  v164 = (char *)&v154 - v51;
  __chkstk_darwin(v50, v52);
  v188 = (char *)&v154 - v53;
  uint64_t v54 = sub_60C90();
  uint64_t v55 = *(void *)(v54 - 8);
  uint64_t v57 = __chkstk_darwin(v54, v56);
  int v59 = (char *)&v154 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __chkstk_darwin(v57, v60);
  v163 = (char *)&v154 - v62;
  __chkstk_darwin(v61, v63);
  uint64_t v65 = (char *)&v154 - v64;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  v174 = v18;
  uint64_t v66 = sub_616D0();
  uint64_t v67 = sub_6D40(v66, (uint64_t)qword_7A9C8);
  v176 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
  uint64_t v177 = v55 + 16;
  v176(v65, a1, v54);
  uint64_t v180 = v67;
  uint64_t v68 = sub_616C0();
  os_log_type_t v69 = sub_61960();
  BOOL v70 = os_log_type_enabled(v68, v69);
  uint64_t v178 = v55;
  v172 = v59;
  if (v70)
  {
    uint64_t v71 = swift_slowAlloc();
    uint64_t v155 = a1;
    uint64_t v72 = (uint8_t *)v71;
    v191[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v72 = 136315138;
    uint64_t v154 = v14;
    sub_1D660((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v73 = sub_61C90();
    uint64_t v190 = sub_316A4(v73, v74, v191);
    uint64_t v14 = v154;
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v75 = *(void (**)(char *, uint64_t))(v55 + 8);
    v75(v65, v54);
    _os_log_impl(&dword_0, v68, v69, "AppNameDisambiguationFlow: on called with input %s", v72, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v155;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v75 = *(void (**)(char *, uint64_t))(v55 + 8);
    v75(v65, v54);
  }

  v76 = v181;
  sub_60C80();
  uint64_t v77 = v182;
  uint64_t v78 = v186;
  int v79 = (*(uint64_t (**)(char *, void *))(v182 + 88))(v76, v186);
  if (v79 != enum case for Parse.NLv3IntentOnly(_:))
  {
    int v88 = v79;
    uint64_t v84 = v14;
    if (v79 == enum case for Parse.directInvocation(_:))
    {
      (*(void (**)(char *, void *))(v77 + 96))(v76, v78);
      uint64_t v89 = v169;
      uint64_t v90 = v168;
      uint64_t v91 = v170;
      (*(void (**)(char *, char *, uint64_t))(v169 + 32))(v168, v76, v170);
      sub_3E334(v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction, v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction, (uint64_t)v188);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v91);
LABEL_13:
      uint64_t v92 = (uint64_t)v179;
      goto LABEL_26;
    }
    if (v79 != enum case for Parse.uso(_:))
    {
      int v129 = enum case for Parse.empty(_:);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v188, 1, 1, v189);
      if (v88 == v129)
      {
        uint64_t v130 = v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state;
        swift_beginAccess();
        uint64_t v131 = v130;
        uint64_t v132 = v162;
        sub_1E924(v131, v162, type metadata accessor for AppNameDisambiguationFlow.State);
        uint64_t v133 = sub_6D90(&qword_76028);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v133 - 8) + 48))(v132, 3, v133) == 1)
        {
          sub_6EE8((uint64_t)v188, (uint64_t *)&unk_76940);
          sub_1E3E0(v132, type metadata accessor for AppNameDisambiguationFlow.State);
          return 1;
        }
        sub_1E3E0(v132, type metadata accessor for AppNameDisambiguationFlow.State);
      }
      else
      {
        (*(void (**)(char *, void *))(v77 + 8))(v76, v78);
      }
      goto LABEL_13;
    }
    (*(void (**)(char *, void *))(v77 + 96))(v76, v78);
    uint64_t v93 = v165;
    (*(void (**)(char *, char *, uint64_t))(v166 + 32))(v165, v76, v167);
    uint64_t v94 = v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction;
    uint64_t v95 = v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction;
    uint64_t v96 = sub_457B0();
    if ((v97 & 1) == 0)
    {
      if (v96 != 1)
      {
        if (v96)
        {
          if (v96 != -1) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v95 = v94;
        }
      }
      v149 = v164;
      uint64_t v150 = v189;
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v164, v95, v189);
      v186 = *(void **)(v84 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t))v186)(v149, 0, 1, v150);
      (*(void (**)(char *, uint64_t))(v166 + 8))(v165, v167);
      v151 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
      v152 = v159;
      v151(v159, v149, v150);
      uint64_t v153 = (uint64_t)v188;
      v151(v188, v152, v150);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v186)(v153, 0, 1, v150);
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v98 = (uint64_t)v164;
    uint64_t v184 = *(void *)(v84 + 56);
    uint64_t v185 = v84 + 56;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v184)(v164, 1, 1, v189);
    sub_6EE8(v98, (uint64_t *)&unk_76940);
    uint64_t v99 = sub_12530();
    if (v100)
    {
      uint64_t v101 = v94;
      uint64_t v102 = v160;
      sub_11FE8(v99, v100, v101, v95, v160);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v102, 1, v189) != 1)
      {
        v139 = *(void (**)(char *, uint64_t, uint64_t))(v84 + 32);
        v140 = v157;
        uint64_t v141 = v102;
        v142 = v93;
        uint64_t v143 = v189;
        v139(v157, v141, v189);
        (*(void (**)(char *, uint64_t))(v166 + 8))(v142, v167);
        v144 = v156;
        v139(v156, (uint64_t)v140, v143);
        uint64_t v145 = (uint64_t)v188;
        v139(v188, (uint64_t)v144, v143);
        uint64_t v146 = v145;
        uint64_t v147 = 0;
        uint64_t v148 = v143;
        goto LABEL_47;
      }
      sub_6EE8(v102, (uint64_t *)&unk_76940);
    }
    int v103 = v161;
    sub_60C80();
    char v104 = sub_60CA0();
    uint64_t v105 = *(void (**)(char *, void *))(v77 + 8);
    uint64_t v106 = v186;
    v105(v103, v186);
    uint64_t v107 = v163;
    v176(v163, a1, v54);
    if (v104)
    {
      v75(v107, v54);
      (*(void (**)(char *, uint64_t))(v166 + 8))(v93, v167);
LABEL_42:
      uint64_t v136 = sub_6D90(&qword_76028);
      uint64_t v137 = (uint64_t)v175;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v136 - 8) + 56))(v175, 3, 3, v136);
      uint64_t v138 = v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state;
      swift_beginAccess();
      sub_1DC44(v137, v138);
      swift_endAccess();
      return 1;
    }
    v134 = v158;
    sub_60C80();
    char v135 = sub_60CC0();
    v105(v134, v106);
    v75(v163, v54);
    (*(void (**)(char *, uint64_t))(v166 + 8))(v93, v167);
    if (v135) {
      goto LABEL_42;
    }
    uint64_t v146 = (uint64_t)v188;
    uint64_t v148 = v189;
    uint64_t v147 = 1;
LABEL_47:
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v184)(v146, v147, 1, v148);
    goto LABEL_13;
  }
  (*(void (**)(char *, void *))(v77 + 96))(v76, v78);
  (*(void (**)(char *, char *, uint64_t))(v184 + 32))(v183, v76, v185);
  uint64_t v80 = OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction;
  uint64_t v81 = OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction;
  uint64_t v82 = sub_1AF24();
  uint64_t v84 = v14;
  if (v83)
  {
    uint64_t v85 = v187 + v80;
    uint64_t v86 = v171;
    sub_11FE8(v82, v83, v85, v187 + v81, v171);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v86, 1, v189) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(v188, v86, v189);
      uint64_t v87 = 0;
      goto LABEL_25;
    }
    sub_6EE8(v86, (uint64_t *)&unk_76940);
  }
  uint64_t v87 = 1;
LABEL_25:
  uint64_t v92 = (uint64_t)v179;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v188, v87, 1, v189);
  (*(void (**)(char *, uint64_t))(v184 + 8))(v183, v185);
LABEL_26:
  sub_1DB7C((uint64_t)v188, v92, (uint64_t *)&unk_76940);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v92, 1, v189) == 1)
  {
    sub_6EE8(v92, (uint64_t *)&unk_76940);
    v108 = v172;
    v176(v172, a1, v54);
    uint64_t v109 = sub_616C0();
    os_log_type_t v110 = sub_61970();
    if (os_log_type_enabled(v109, v110))
    {
      v111 = (uint8_t *)swift_slowAlloc();
      v191[0] = swift_slowAlloc();
      *(_DWORD *)v111 = 136315138;
      sub_1D660((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v112 = sub_61C90();
      v191[3] = sub_316A4(v112, v113, v191);
      sub_619C0();
      swift_bridgeObjectRelease();
      v75(v108, v54);
      _os_log_impl(&dword_0, v109, v110, "AppNameDisambiguationFlow: could not resolve action from %s", v111, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v75(v108, v54);
    }

    sub_60B70();
    sub_60B60();
    sub_60B30();
    swift_release();
    sub_6EA4((void *)(v187 + 136), *(void *)(v187 + 160));
    sub_606A0();
    if (qword_75D68 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    LOBYTE(v191[0]) = 0;
    sub_60690();
    sub_60610();
    swift_release();
    sub_6EE8((uint64_t)v188, (uint64_t *)&unk_76940);
    return 0;
  }
  else
  {
    v114 = v174;
    uint64_t v115 = v189;
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v174, v92, v189);
    uint64_t v116 = sub_6D90(&qword_76028);
    uint64_t v117 = (uint64_t)v175;
    v118 = &v175[*(int *)(v116 + 48)];
    v119 = &v175[*(int *)(v116 + 64)];
    uint64_t v120 = v84;
    v121 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
    v121(v175, v114, v115);
    uint64_t v122 = v187;
    v121(v118, (char *)(v187 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction), v115);
    v121(v119, (char *)(v122 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction), v115);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56))(v117, 0, 3, v116);
    uint64_t v123 = v173;
    sub_1DBE0(v117, v173);
    uint64_t v124 = v122 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state;
    swift_beginAccess();
    sub_1DC44(v123, v124);
    swift_endAccess();
    v125 = sub_616C0();
    os_log_type_t v126 = sub_61960();
    if (os_log_type_enabled(v125, v126))
    {
      v127 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v127 = 0;
      _os_log_impl(&dword_0, v125, v126, "AppShorcutCollisionFlow: input accepted", v127, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v120 + 8))(v114, v189);
    sub_6EE8((uint64_t)v188, (uint64_t *)&unk_76940);
    return 1;
  }
}

uint64_t sub_FEB4(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  v2[9] = *v1;
  sub_6D90((uint64_t *)&unk_76920);
  v2[10] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_78360);
  v2[11] = swift_task_alloc();
  uint64_t v3 = sub_602F0();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v4 = sub_607D0();
  v2[15] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[16] = v5;
  v2[17] = *(void *)(v5 + 64);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  type metadata accessor for AppNameDisambiguationFlow.State(0);
  v2[25] = swift_task_alloc();
  return _swift_task_switch(sub_100D8, 0, 0);
}

uint64_t sub_100D8()
{
  uint64_t v77 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppNameDisambiguationFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[25];
  uint64_t v6 = v0[8];

  uint64_t v7 = v6 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state;
  swift_beginAccess();
  sub_1E924(v7, v5, type metadata accessor for AppNameDisambiguationFlow.State);
  uint64_t v8 = sub_6D90(&qword_76028);
  switch((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 3, v8))
  {
    case 1u:
      uint64_t v20 = (void *)swift_task_alloc();
      v0[26] = v20;
      *uint64_t v20 = v0;
      v20[1] = sub_10AE4;
      uint64_t v21 = v0[7];
      uint64_t result = sub_11294(v21);
      break;
    case 2u:
      uint64_t v23 = sub_616C0();
      os_log_type_t v24 = sub_61970();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_0, v23, v24, "AppNameDisambiguationFlow: invalid respose", v25, 2u);
        swift_slowDealloc();
      }

      sub_60B80();
      sub_60600();
      type metadata accessor for CamErrorFlow();
      swift_allocObject();
      v0[5] = sub_352DC(0xD000000000000010, 0x80000000000643C0, (uint64_t)v75, (uint64_t)v76);
      sub_1D660((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
      sub_60540();
      swift_release();
      sub_608E0();
      swift_release();
      goto LABEL_24;
    case 3u:
      id v26 = [objc_allocWithZone((Class)SAUICloseAssistant) init];
      v0[27] = v26;
      sub_6D90((uint64_t *)&unk_76820);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_62660;
      *(void *)(v27 + 32) = v26;
      v76[0] = v27;
      sub_61880();
      uint64_t v28 = v76[0];
      v0[28] = v76[0];
      id v29 = v26;
      uint64_t v30 = (void *)swift_task_alloc();
      v0[29] = v30;
      *uint64_t v30 = v0;
      v30[1] = sub_10CC8;
      uint64_t v31 = v0[7];
      uint64_t result = sub_17ED8(v31, 0xD000000000000019, 0x80000000000643A0, v28);
      break;
    default:
      uint64_t v9 = v0[25];
      uint64_t v10 = v0[23];
      uint64_t v74 = v0[22];
      uint64_t v11 = v0[15];
      uint64_t v12 = v0[13];
      uint64_t v71 = v0[12];
      uint64_t v13 = v0[11];
      uint64_t v14 = v9 + *(int *)(v8 + 48);
      uint64_t v15 = v9 + *(int *)(v8 + 64);
      uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[16] + 32);
      ((void (*)(void))v16)(v0[24]);
      v16(v10, v14, v11);
      v16(v74, v15, v11);
      sub_607C0();
      uint64_t v73 = v16;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v71) == 1)
      {
        sub_6EE8(v0[11], (uint64_t *)&unk_78360);
        uint64_t v17 = sub_616C0();
        os_log_type_t v18 = sub_61970();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_0, v17, v18, "AppShorcutCollisionFlow: could not extract loggingId from input", v19, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        uint64_t v33 = v0[13];
        uint64_t v32 = v0[14];
        uint64_t v34 = v0[12];
        (*(void (**)(uint64_t, void, uint64_t))(v33 + 32))(v32, v0[11], v34);
        sub_60B70();
        sub_60B60();
        sub_60B50();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
      }
      uint64_t v35 = v0[23];
      uint64_t v36 = v0[24];
      uint64_t v37 = v0[21];
      uint64_t v66 = v37;
      uint64_t v67 = v0[22];
      uint64_t v38 = v0[19];
      uint64_t v39 = v0[20];
      uint64_t v68 = v39;
      uint64_t v69 = v36;
      uint64_t v40 = v0[17];
      uint64_t v42 = v0[15];
      uint64_t v41 = v0[16];
      uint64_t v43 = v0[10];
      uint64_t v70 = v0[9];
      uint64_t v72 = v0[18];
      sub_618F0();
      uint64_t v44 = sub_61910();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 0, 1, v44);
      uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
      v45(v37, v35, v42);
      v45(v39, v67, v42);
      v45(v38, v36, v42);
      uint64_t v46 = *(unsigned __int8 *)(v41 + 80);
      uint64_t v47 = (v46 + 32) & ~v46;
      uint64_t v48 = (v47 + v40 + v46) & ~v46;
      uint64_t v49 = (v48 + v40 + v46) & ~v46;
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = 0;
      *(void *)(v50 + 24) = 0;
      v73(v50 + v47, v66, v42);
      v73(v50 + v48, v68, v42);
      v73(v50 + v49, v38, v42);
      *(void *)(v50 + ((v40 + v49 + 7) & 0xFFFFFFFFFFFFFFF8)) = v70;
      sub_110C4(v43, (uint64_t)&unk_76938, v50);
      swift_release();
      sub_6EE8(v43, (uint64_t *)&unk_76920);
      v45(v72, v69, v42);
      uint64_t v51 = sub_616C0();
      os_log_type_t v52 = sub_61970();
      BOOL v53 = os_log_type_enabled(v51, v52);
      uint64_t v54 = v0[18];
      uint64_t v55 = v0[15];
      uint64_t v56 = v0[16];
      if (v53)
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        v76[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = 136315138;
        sub_1D660((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
        uint64_t v58 = sub_61C90();
        v0[6] = sub_316A4(v58, v59, v76);
        sub_619C0();
        swift_bridgeObjectRelease();
        uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
        v60(v54, v55);
        _os_log_impl(&dword_0, v51, v52, "AppShorcutCollisionFlow: redirecting to resolved action %s", v57, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
        v60(v0[18], v0[15]);
      }

      uint64_t v61 = v0[23];
      uint64_t v62 = v0[24];
      uint64_t v63 = v0[22];
      uint64_t v64 = v0[15];
      sub_60900();
      v60(v63, v64);
      v60(v61, v64);
      v60(v62, v64);
LABEL_24:
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
      uint64_t v65 = (uint64_t (*)(void))v0[1];
      uint64_t result = v65();
      break;
  }
  return result;
}

uint64_t sub_10AE4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10BE0, 0, 0);
}

uint64_t sub_10BE0()
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

uint64_t sub_10CC8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10DE0, 0, 0);
}

uint64_t sub_10DE0()
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

uint64_t sub_10ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return _swift_task_switch(sub_10EF4, 0, 0);
}

uint64_t sub_10EF4()
{
  if (qword_75D70 != -1) {
    swift_once();
  }
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_78030 + dword_78030);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10FD0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  return v6(v4, v2, v3);
}

uint64_t sub_10FD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_110C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_6D90((uint64_t *)&unk_76920);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB7C(a1, (uint64_t)v8, (uint64_t *)&unk_76920);
  uint64_t v9 = sub_61910();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_6EE8((uint64_t)v8, (uint64_t *)&unk_76920);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_61900();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v11 = sub_618C0();
  uint64_t v13 = v12;
  swift_unknownObjectRelease();
  if (v13 | v11)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v11;
    v15[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_11294(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[15] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_60BD0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_78360);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v5 = sub_602F0();
  v2[24] = v5;
  v2[25] = *(void *)(v5 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return _swift_task_switch(sub_1148C, 0, 0);
}

uint64_t sub_1148C()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  *(void *)(v0 + 224) = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppNameDisambiguationFlow: rendering disambiguation", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v5;
  void *v5 = v0;
  v5[1] = sub_115E8;
  return sub_13A30(v0 + 56);
}

uint64_t sub_115E8()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_11DDC;
  }
  else {
    uint64_t v2 = sub_116FC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_116FC()
{
  uint64_t v2 = (uint64_t *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = v0 + 16;
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 200);
  sub_6D78((long long *)(v0 + 56), v0 + 16);
  sub_607C0();
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v6(v1, 1, v4) != 1)
  {
    uint64_t v2 = (uint64_t *)(v0 + 176);
    uint64_t v7 = *(void *)(v0 + 176);
    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v9 = *(void (**)(void))(*(void *)(v0 + 200) + 32);
    ((void (*)(void, void, uint64_t))v9)(*(void *)(v0 + 216), *(void *)(v0 + 184), v8);
    sub_607C0();
    if (v6(v7, 1, v8) != 1)
    {
      uint64_t v13 = *(void *)(v0 + 200);
      uint64_t v29 = *(void *)(v0 + 208);
      uint64_t v14 = *(void *)(v0 + 192);
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v30 = *(void *)(v0 + 152);
      uint64_t v31 = *(void *)(v0 + 168);
      uint64_t v16 = *(void *)(v0 + 216);
      v9();
      sub_60B70();
      sub_60B60();
      sub_6D90(&qword_76918);
      uint64_t v17 = *(void *)(v13 + 72);
      unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_62540;
      unint64_t v20 = v19 + v18;
      uint64_t v21 = *(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 16);
      v21(v20, v16, v14);
      v21(v20 + v17, v29, v14);
      (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v31, enum case for CAMDisambiguationDialogType.appName(_:), v30);
      sub_60B40();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v31, v30);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v22(v29, v14);
      uint64_t v23 = v16;
      uint64_t v3 = v0 + 16;
      v22(v23, v14);
      goto LABEL_8;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 192));
  }
  sub_6EE8(*v2, (uint64_t *)&unk_78360);
  uint64_t v10 = sub_616C0();
  os_log_type_t v11 = sub_61960();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "AppNameDisambiguationFlow: could not extract loggingIds for actions. SELF message was not emitted as a result.", v12, 2u);
    swift_slowDealloc();
  }

LABEL_8:
  os_log_type_t v24 = *(void **)(v0 + 112);
  uint64_t v25 = v24[15];
  uint64_t v26 = v24[16];
  sub_6EA4(v24 + 12, v25);
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_11A78;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v3, v25, v26);
}

uint64_t sub_11A78()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_1E990;
  }
  else
  {
    uint64_t v1 = sub_11B90;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_11B90()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  sub_6EA4((void *)(v0[14] + 136), *(void *)(v0[14] + 160));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.disambiguation(_:), v3);
  if (qword_75D68 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[15];
  uint64_t v5 = enum case for SiriKitReliabilityCodes.disambiguationShortcutVsOther(_:);
  uint64_t v6 = sub_60620();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(v4, v5, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608C0();
  sub_63E8((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_11DDC()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 96) = v5;
    sub_619C0();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "AppNameDisambiguationFlow: Cannot create output for disambiguation, will redirect to fall back action. Error: %@", v3, 0xCu);
    sub_6D90(&qword_76910);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_60900();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_11FE8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v41 = a1;
  unint64_t v42 = a2;
  uint64_t v40 = a5;
  uint64_t v7 = sub_607D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  os_log_type_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_75DE8 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v12 = sub_616D0();
    v38[1] = sub_6D40(v12, (uint64_t)qword_7A9C8);
    uint64_t v13 = sub_616C0();
    os_log_type_t v14 = sub_61960();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v39 = a3;
      uint64_t v16 = a4;
      uint64_t v17 = (uint8_t *)v15;
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v43 = sub_316A4(0xD000000000000027, 0x8000000000064370, &v44);
      sub_619C0();
      _os_log_impl(&dword_0, v13, v14, "AppNameDisambiguationFlow: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a4 = v16;
      a3 = v39;
      swift_slowDealloc();
    }

    sub_6D90(&qword_768B0);
    uint64_t v18 = *(void *)(v8 + 72);
    unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_62540;
    unint64_t v21 = v20 + v19;
    uint64_t v39 = v8;
    uint64_t v22 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16);
    v22(v21, a3, v7);
    a3 = v21 + v18;
    v22(v21 + v18, a4, v7);
    if (*(void *)(v20 + 16))
    {
      v22((unint64_t)v11, v21, v7);
      uint64_t v23 = sub_470D8();
      if (v24)
      {
        if (v23 == v41 && v24 == v42) {
          goto LABEL_15;
        }
        char v26 = sub_61CA0();
        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_16;
        }
      }
      a4 = v8 + 8;
      uint64_t v8 = *(void *)(v8 + 8);
      ((void (*)(char *, uint64_t))v8)(v11, v7);
      if (*(void *)(v20 + 16) >= 2uLL) {
        break;
      }
    }
    __break(1u);
LABEL_24:
    swift_once();
  }
  v22((unint64_t)v11, a3, v7);
  uint64_t v27 = sub_470D8();
  if (v28)
  {
    if (v27 == v41 && v28 == v42)
    {
LABEL_15:
      swift_bridgeObjectRelease();
LABEL_16:
      swift_bridgeObjectRelease();
      uint64_t v30 = v39;
      uint64_t v29 = v40;
      (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v11, v7);
      uint64_t v31 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v29, v31, 1, v7);
    }
    char v32 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_16;
    }
  }
  ((void (*)(char *, uint64_t))v8)(v11, v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  unint64_t v33 = v42;
  swift_bridgeObjectRetain_n();
  uint64_t v34 = sub_616C0();
  os_log_type_t v35 = sub_61960();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_316A4(v41, v33, &v44);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v34, v35, "AppNameDisambiguationFlow: No match found for appBundleId %s", v36, 0xCu);
    uint64_t v31 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v31 = 1;
  }
  uint64_t v30 = v39;
  uint64_t v29 = v40;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v29, v31, 1, v7);
}

uint64_t sub_12530()
{
  uint64_t v1 = v0;
  os_log_type_t v2 = (void *)sub_607D0();
  unint64_t v3 = *(v2 - 1);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v131 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = (char *)sub_61090();
  unint64_t v7 = *((void *)v151 - 1);
  uint64_t v9 = __chkstk_darwin(v151, v8);
  uint64_t v148 = (char *)v131 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  v149 = (char *)v131 - v13;
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v150 = (char *)v131 - v16;
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)v131 - v19;
  __chkstk_darwin(v18, v21);
  uint64_t v23 = (char *)v131 - v22;
  uint64_t v24 = sub_6D90(&qword_768F8);
  uint64_t v26 = __chkstk_darwin(v24 - 8, v25);
  uint64_t v28 = (char *)v131 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26, v29);
  uint64_t v147 = (char *)v131 - v30;
  unint64_t v31 = sub_55EFC();
  if (!v31) {
    goto LABEL_27;
  }
  unint64_t v32 = v31;
  uint64_t v146 = v28;
  uint64_t v33 = sub_612D0();
  if (!*(void *)(v33 + 16)) {
    goto LABEL_25;
  }
  unint64_t v34 = sub_3C8A4(0x636E657265666572, 0xE900000000000065);
  if ((v35 & 1) == 0) {
    goto LABEL_25;
  }
  unint64_t v36 = *(void *)(*(void *)(v33 + 56) + 8 * v34);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v36 >> 62) {
    goto LABEL_126;
  }
  if (!*(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_25:
    swift_release();
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
LABEL_6:
  uint64_t v145 = (char *)v7;
  unint64_t v138 = v3;
  v139 = v1;
  if ((v36 & 0xC000000000000001) == 0)
  {
    if (*(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8)))
    {
      unint64_t v7 = *(void *)(v36 + 32);
      swift_retain();
      goto LABEL_9;
    }
    __break(1u);
LABEL_131:
    swift_bridgeObjectRetain();
    uint64_t v128 = sub_61B60();
    swift_bridgeObjectRelease();
    if (v128) {
      goto LABEL_14;
    }
LABEL_34:
    swift_bridgeObjectRelease();
LABEL_35:
    if (sub_61320())
    {
      uint64_t v51 = sub_61330();
      swift_release();
      if (!*(void *)(v51 + 16) || (unint64_t v52 = sub_3C8A4(1701667182, 0xE400000000000000), (v53 & 1) == 0))
      {
        swift_release();
        goto LABEL_25;
      }
      unint64_t v44 = *(void *)(*(void *)(v51 + 56) + 8 * v52);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v44 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v129 = sub_61B60();
        swift_bridgeObjectRelease();
        if (v129)
        {
LABEL_40:
          if ((v44 & 0xC000000000000001) != 0) {
            goto LABEL_135;
          }
          if (*(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8)))
          {
LABEL_42:
            unint64_t v36 = *(void *)(v44 + 32);
            swift_retain();
            goto LABEL_43;
          }
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
      }
      else if (*(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8)))
      {
        goto LABEL_40;
      }
      swift_release();
      swift_release();
      goto LABEL_26;
    }
    swift_release();
    swift_release();
LABEL_27:
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_616D0();
    sub_6D40(v45, (uint64_t)qword_7A9C8);
    uint64_t v46 = sub_616C0();
    os_log_type_t v47 = sub_61960();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      v154[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 136315138;
      uint64_t v152 = sub_316A4(0xD000000000000016, 0x8000000000064330, v154);
      sub_619C0();
      _os_log_impl(&dword_0, v46, v47, "%s: Cannot find node in USO tree that contains app name identifiers", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return 0;
  }
LABEL_129:
  unint64_t v7 = sub_61A90();
LABEL_9:
  swift_bridgeObjectRelease();
  if (!sub_61320()) {
    goto LABEL_35;
  }
  uint64_t v37 = sub_61330();
  swift_release();
  if (!*(void *)(v37 + 16)) {
    goto LABEL_34;
  }
  unint64_t v38 = sub_3C8A4(0xD000000000000010, 0x8000000000064350);
  if ((v39 & 1) == 0) {
    goto LABEL_34;
  }
  unint64_t v36 = *(void *)(*(void *)(v37 + 56) + 8 * v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v36 >> 62) {
    goto LABEL_131;
  }
  if (!*(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_34;
  }
LABEL_14:
  if ((v36 & 0xC000000000000001) != 0)
  {
    sub_61A90();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_138;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_61320();
  swift_release();
  if (!v40) {
    goto LABEL_35;
  }
  uint64_t v41 = sub_61330();
  swift_release();
  if (!*(void *)(v41 + 16)) {
    goto LABEL_34;
  }
  unint64_t v42 = sub_3C8A4(1701667182, 0xE400000000000000);
  if ((v43 & 1) == 0) {
    goto LABEL_34;
  }
  unint64_t v44 = *(void *)(*(void *)(v41 + 56) + 8 * v42);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v130 = sub_61B60();
    swift_bridgeObjectRelease();
    if (!v130) {
      goto LABEL_34;
    }
  }
  else if (!*(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_34;
  }
  if ((v44 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_25;
    }
    goto LABEL_42;
  }
LABEL_135:
  unint64_t v36 = sub_61A90();
LABEL_43:
  swift_bridgeObjectRelease();
  unint64_t v136 = v36;
  uint64_t v54 = sub_61310();
  v154[0] = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v55 = *(char **)(v54 + 16);
  uint64_t v133 = v2;
  v134 = v6;
  unint64_t v141 = v32;
  if (v55)
  {
    uint64_t v6 = v55;
    unint64_t v135 = v7;
    unint64_t v7 = 0;
    uint64_t v143 = (void (**)(char *, char *, char *))(v145 + 32);
    uint64_t v144 = (uint64_t)(v145 + 16);
    v142 = (void (**)(char *, char *))(v145 + 8);
    uint64_t v1 = v151;
    uint64_t v140 = (uint64_t)v55;
    while (1)
    {
      if (v7 >= *(void *)(v54 + 16))
      {
        __break(1u);
LABEL_126:
        swift_bridgeObjectRetain();
        uint64_t v127 = sub_61B60();
        swift_bridgeObjectRelease();
        if (!v127) {
          goto LABEL_25;
        }
        goto LABEL_6;
      }
      os_log_type_t v2 = (void *)((v145[80] + 32) & ~(unint64_t)v145[80]);
      uint64_t v56 = v1;
      uint64_t v57 = *((void *)v145 + 9);
      (*((void (**)(char *, char *, char *))v145 + 2))(v23, (char *)v2 + v54 + v57 * v7, v56);
      unint64_t v36 = (unint64_t)v23;
      uint64_t v58 = sub_61080();
      if (v59)
      {
        unint64_t v36 = v59;
        if (v58 == 0x64695F6D657469 && v59 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_53:
          uint64_t v60 = *v143;
          (*v143)(v20, v23, v151);
          unint64_t v36 = v154[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_3CD14(0, *(void *)(v36 + 16) + 1, 1);
            unint64_t v36 = v154[0];
          }
          unint64_t v62 = *(void *)(v36 + 16);
          unint64_t v61 = *(void *)(v36 + 24);
          unint64_t v3 = v62 + 1;
          if (v62 >= v61 >> 1)
          {
            sub_3CD14(v61 > 1, v62 + 1, 1);
            unint64_t v36 = v154[0];
          }
          *(void *)(v36 + 16) = v3;
          uint64_t v63 = (char *)v2 + v36 + v62 * v57;
          uint64_t v1 = v151;
          v60(v63, v20, v151);
          v154[0] = v36;
          uint64_t v6 = (char *)v140;
          unint64_t v32 = v141;
          goto LABEL_46;
        }
        unint64_t v3 = sub_61CA0();
        swift_bridgeObjectRelease();
        if (v3) {
          goto LABEL_53;
        }
      }
      uint64_t v1 = v151;
      (*v142)(v23, v151);
LABEL_46:
      if (v6 == (char *)++v7)
      {
        uint64_t v64 = (void *)v154[0];
        unint64_t v7 = v135;
        goto LABEL_62;
      }
    }
  }
  uint64_t v64 = _swiftEmptyArrayStorage;
  uint64_t v1 = v151;
LABEL_62:
  swift_bridgeObjectRelease();
  uint64_t v23 = v145;
  if (v64[2])
  {
    uint64_t v65 = (uint64_t)v147;
    (*((void (**)(char *, unint64_t, char *))v145 + 2))(v147, (unint64_t)v64 + ((v145[80] + 32) & ~(unint64_t)v145[80]), v1);
    os_log_type_t v2 = (void *)*((void *)v23 + 7);
    ((void (*)(uint64_t, void, uint64_t, char *))v2)(v65, 0, 1, v1);
  }
  else
  {
    os_log_type_t v2 = (void *)*((void *)v145 + 7);
    uint64_t v65 = (uint64_t)v147;
    ((void (*)(char *, uint64_t, uint64_t, char *))v2)(v147, 1, 1, v1);
  }
  uint64_t v66 = (uint64_t)v146;
  swift_release();
  uint64_t v20 = v23 + 48;
  uint64_t v6 = (char *)*((void *)v23 + 6);
  if (((unsigned int (*)(uint64_t, uint64_t, char *))v6)(v65, 1, v1) != 1)
  {
    uint64_t v80 = sub_61070();
    uint64_t v66 = v65;
LABEL_102:
    uint64_t v49 = v80;
    swift_release();
    swift_release();
    swift_release();
    (*((void (**)(uint64_t, char *))v23 + 1))(v66, v1);
    return v49;
  }
  sub_6EE8(v65, &qword_768F8);
  uint64_t v67 = sub_61310();
  uint64_t v68 = _swiftEmptyArrayStorage;
  uint64_t v155 = _swiftEmptyArrayStorage;
  uint64_t v147 = *(char **)(v67 + 16);
  if (!v147) {
    goto LABEL_86;
  }
  v131[0] = v6;
  v131[1] = v23 + 48;
  uint64_t v132 = v2;
  unint64_t v3 = 0;
  uint64_t v137 = (void (**)(char *, char *, char *))(v145 + 32);
  v142 = (void (**)(char *, char *))(v145 + 8);
  uint64_t v143 = (void (**)(char *, char *, char *))(v145 + 16);
  uint64_t v140 = (unint64_t)(v145 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v69 = v150;
  uint64_t v144 = v67;
  do
  {
    if (v3 >= *(void *)(v67 + 16))
    {
      __break(1u);
      goto LABEL_129;
    }
    uint64_t v23 = (char *)((v145[80] + 32) & ~(unint64_t)v145[80]);
    uint64_t v20 = (char *)*((void *)v145 + 9);
    os_log_type_t v2 = (void *)*((void *)v145 + 2);
    ((void (*)(char *, char *, char *))v2)(v69, &v23[v67 + (void)v20 * v3], v1);
    uint64_t v71 = sub_61080();
    if (!v72)
    {
      uint64_t v6 = v149;
      ((void (*)(char *, char *, char *))v2)(v149, v69, v1);
LABEL_69:
      uint64_t v70 = *v142;
      (*v142)(v6, v1);
LABEL_70:
      uint64_t v69 = v150;
      v70(v150, v1);
      goto LABEL_71;
    }
    if (v71 == 0x656D614E707061 && v72 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = v149;
      ((void (*)(char *, char *, char *))v2)(v149, v150, v1);
    }
    else
    {
      char v73 = sub_61CA0();
      swift_bridgeObjectRelease();
      uint64_t v6 = v149;
      ((void (*)(char *, char *, char *))v2)(v149, v150, v1);
      if ((v73 & 1) == 0) {
        goto LABEL_69;
      }
    }
    v154[0] = sub_61070();
    v154[1] = v74;
    uint64_t v152 = 46;
    unint64_t v153 = 0xE100000000000000;
    sub_1D8E8();
    char v75 = sub_619F0();
    swift_bridgeObjectRelease();
    uint64_t v70 = *v142;
    (*v142)(v6, v1);
    if ((v75 & 1) == 0) {
      goto LABEL_70;
    }
    os_log_type_t v2 = *v137;
    (*v137)(v148, v150, v1);
    v76 = v155;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_3CD14(0, v76[2] + 1, 1);
      v76 = v155;
    }
    unint64_t v78 = v76[2];
    unint64_t v77 = v76[3];
    if (v78 >= v77 >> 1)
    {
      sub_3CD14(v77 > 1, v78 + 1, 1);
      v76 = v155;
    }
    v76[2] = v78 + 1;
    int v79 = &v23[(void)v76 + v78 * (void)v20];
    uint64_t v1 = v151;
    ((void (*)(char *, char *, char *))v2)(v79, v148, v151);
    uint64_t v155 = v76;
    uint64_t v69 = v150;
LABEL_71:
    ++v3;
    uint64_t v66 = (uint64_t)v146;
    uint64_t v67 = v144;
  }
  while (v147 != (char *)v3);
  uint64_t v68 = v155;
  os_log_type_t v2 = v132;
  uint64_t v6 = (char *)v131[0];
LABEL_86:
  swift_bridgeObjectRelease();
  if (v68[2])
  {
    uint64_t v23 = v145;
    (*((void (**)(uint64_t, unint64_t, char *))v145 + 2))(v66, (unint64_t)v68 + ((v145[80] + 32) & ~(unint64_t)v145[80]), v1);
    uint64_t v81 = 0;
  }
  else
  {
    uint64_t v81 = 1;
    uint64_t v23 = v145;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, char *))v2)(v66, v81, 1, v1);
  swift_release();
  if (((unsigned int (*)(uint64_t, uint64_t, char *))v6)(v66, 1, v1) != 1)
  {
    uint64_t v80 = sub_61070();
    goto LABEL_102;
  }
  sub_6EE8(v66, &qword_768F8);
  if (qword_75DE8 != -1) {
    goto LABEL_140;
  }
  while (1)
  {
    uint64_t v82 = sub_616D0();
    uint64_t v83 = sub_6D40(v82, (uint64_t)qword_7A9C8);
    uint64_t v84 = sub_616C0();
    os_log_type_t v85 = sub_61960();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      v154[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 136315138;
      uint64_t v152 = sub_316A4(0xD000000000000016, 0x8000000000064330, v154);
      sub_619C0();
      _os_log_impl(&dword_0, v84, v85, "%s: No value can be derived for appBundleId", v86, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v87 = sub_616C0();
    os_log_type_t v88 = sub_61960();
    BOOL v89 = os_log_type_enabled(v87, v88);
    unint64_t v135 = v7;
    v149 = (char *)v83;
    if (v89)
    {
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      v154[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v90 = 136315138;
      uint64_t v152 = sub_316A4(0xD000000000000016, 0x8000000000064330, v154);
      sub_619C0();
      _os_log_impl(&dword_0, v87, v88, "%s: Attempting string match", v90, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v91 = v133;
    sub_6D90(&qword_768B0);
    unint64_t v92 = v138;
    uint64_t v93 = *(void *)(v138 + 72);
    unint64_t v94 = (*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80);
    uint64_t v95 = swift_allocObject();
    *(_OWORD *)(v95 + 16) = xmmword_62540;
    unint64_t v96 = v95 + v94;
    char v97 = v139;
    uint64_t v99 = *(void (**)(void))(v92 + 16);
    unint64_t v98 = v92 + 16;
    unint64_t v7 = (unint64_t)v99;
    ((void (*)(unint64_t, char *, void *))v99)(v96, &v139[OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction], v91);
    uint64_t v150 = (char *)(v96 + v93);
    v99();
    if (*(void *)(v95 + 16))
    {
      unint64_t v100 = v97 + 176;
      uint64_t v101 = (char *)(v98 - 8);
      uint64_t v102 = v134;
      ((void (*)(char *, unint64_t, void *))v7)(v134, v96, v91);
      int v103 = v97;
      char v104 = sub_6EA4((void *)v97 + 22, *((void *)v97 + 25));
      uint64_t v105 = sub_1A8A4(*v104);
      v151 = v101;
      if (v106)
      {
        uint64_t v107 = v105;
        unint64_t v108 = v106;
        uint64_t v109 = sub_61300();
        if (v110)
        {
          if (v107 == v109 && v108 == v110) {
            goto LABEL_115;
          }
          char v115 = sub_61CA0();
          swift_bridgeObjectRelease();
          if (v115)
          {
            uint64_t v102 = v134;
            goto LABEL_116;
          }
          unint64_t v113 = *(void (**)(void, void))v151;
          v114 = v134;
        }
        else
        {
          v114 = v102;
          unint64_t v113 = *(void (**)(void, void))v151;
        }
        v111 = v133;
        v113(v114, v133);
        swift_bridgeObjectRelease();
      }
      else
      {
        v111 = v91;
        uint64_t v112 = v102;
        unint64_t v113 = *(void (**)(void, void))v101;
        (*(void (**)(char *, void *))v101)(v112, v91);
      }
      if (*(void *)(v95 + 16) >= 2uLL) {
        break;
      }
    }
LABEL_139:
    __break(1u);
LABEL_140:
    swift_once();
  }
  uint64_t v116 = v103;
  uint64_t v117 = v134;
  ((void (*)(char *, char *, void *))v7)(v134, v150, v111);
  v118 = sub_6EA4(v100, *((void *)v116 + 25));
  uint64_t v119 = sub_1A8A4(*v118);
  if (!v120)
  {
    v113(v117, v111);
LABEL_124:
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v107 = v119;
  unint64_t v108 = v120;
  uint64_t v121 = sub_61300();
  if (!v122)
  {
LABEL_123:
    v113(v134, v133);
    swift_bridgeObjectRelease();
    goto LABEL_124;
  }
  if (v107 != v121 || v108 != v122)
  {
    char v126 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v126)
    {
      uint64_t v102 = v134;
      goto LABEL_116;
    }
    goto LABEL_123;
  }
  uint64_t v102 = v134;
LABEL_115:
  swift_bridgeObjectRelease();
LABEL_116:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v123 = sub_616C0();
  os_log_type_t v124 = sub_61960();
  if (os_log_type_enabled(v123, v124))
  {
    uint64_t v125 = swift_slowAlloc();
    v154[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v125 = 136315394;
    uint64_t v152 = sub_316A4(0xD000000000000016, 0x8000000000064330, v154);
    sub_619C0();
    *(_WORD *)(v125 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v152 = sub_316A4(v107, v108, v154);
    uint64_t v102 = v134;
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v123, v124, "%s: Matched exact name %s", (uint8_t *)v125, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v49 = sub_470D8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, void *))v151)(v102, v133);
  return v49;
}

uint64_t sub_13A30(uint64_t a1)
{
  v2[35] = a1;
  v2[36] = v1;
  v2[37] = *v1;
  sub_6D90((uint64_t *)&unk_76560);
  v2[38] = swift_task_alloc();
  uint64_t v3 = sub_60940();
  v2[39] = v3;
  v2[40] = *(void *)(v3 - 8);
  v2[41] = swift_task_alloc();
  uint64_t v4 = sub_60F40();
  v2[42] = v4;
  v2[43] = *(void *)(v4 - 8);
  v2[44] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[45] = v5;
  v2[46] = *(void *)(v5 - 8);
  v2[47] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[48] = v6;
  v2[49] = *(void *)(v6 - 8);
  v2[50] = swift_task_alloc();
  return _swift_task_switch(sub_13C5C, 0, 0);
}

uint64_t sub_13C5C()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  os_log_type_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppNameDisambiguationFlow: building output", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v6 = *(void *)(v0 + 296);

  sub_6D90(&qword_768B0);
  uint64_t v7 = sub_607D0();
  *(void *)(v0 + 408) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  int v10 = *(_DWORD *)(v8 + 80);
  *(_DWORD *)(v0 + 528) = v10;
  unint64_t v11 = (v10 + 32) & ~(unint64_t)v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 416) = v12;
  *(_OWORD *)(v12 + 16) = xmmword_62540;
  uint64_t v13 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16);
  v13(v12 + v11, v5 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction, v7);
  v13(v12 + v11 + v9, v5 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction, v7);
  sub_61B10();
  sub_3DA40(0);
  sub_61AF0();
  sub_61B20();
  sub_61B30();
  sub_61B00();
  sub_3DA40(1);
  sub_61AF0();
  sub_61B20();
  sub_61B30();
  sub_61B00();
  *(void *)(v0 + 424) = _swiftEmptyArrayStorage;
  uint64_t v14 = swift_allocObject();
  *(void *)(v0 + 432) = v14;
  *(void *)(v14 + 16) = v5;
  *(void *)(v14 + 24) = v6;
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_783A8 + dword_783A8);
  swift_retain();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_13FA0;
  return v17((uint64_t)&unk_768C0, v14, v12);
}

uint64_t sub_13FA0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 448) = a1;
  *(void *)(v3 + 456) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    swift_release();
    uint64_t v4 = sub_14C58;
  }
  else
  {
    uint64_t v4 = sub_140F0;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_140F0()
{
  uint64_t v1 = v0[56];
  sub_6EA4((void *)(v0[36] + 56), *(void *)(v0[36] + 80));
  sub_6D90(&qword_768C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  v0[30] = 0x73656D614E707061;
  v0[31] = 0xE800000000000000;
  sub_61A40();
  uint64_t v3 = sub_14EB4(v1);
  *(void *)(inited + 96) = sub_6D90(&qword_768D0);
  *(void *)(inited + 72) = v3;
  unint64_t v4 = sub_3C570(inited);
  v0[58] = v4;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_625B0;
  strcpy((char *)(v5 + 32), "responseMode");
  *(unsigned char *)(v5 + 45) = 0;
  *(_WORD *)(v5 + 46) = -5120;
  *(void *)(v5 + 72) = &type metadata for String;
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0xE000000000000000;
  unint64_t v6 = sub_3C438(v5);
  v0[59] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[60] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_142C8;
  return sub_38544(0xD000000000000025, 0x8000000000064300, v4, v6);
}

uint64_t sub_142C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v3 + 488) = a1;
  *(void *)(v3 + 496) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return _swift_task_switch(sub_144F8, 0, 0);
  }
}

uint64_t sub_144F8()
{
  uint64_t v1 = (void *)v0[61];
  uint64_t v3 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v17 = v0[45];
  id v4 = [v1 print];
  uint64_t v5 = sub_61870();

  id v6 = [v1 speak];
  uint64_t v7 = sub_61870();

  id v8 = [v1 spokenOnly];
  sub_1D8A4(0, (unint64_t *)&qword_768D8);
  unint64_t v9 = sub_61870();

  int v10 = sub_15CB8(v5, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_task_alloc();
  *(void *)(v11 + 16) = 0xD000000000000025;
  *(void *)(v11 + 24) = 0x8000000000064300;
  sub_1C98C((uint64_t)v10, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))sub_1D8E0, v11);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for BehaviorAfterSpeaking.listen(_:), v17);
  sub_60A00();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[63] = v12;
  void *v12 = v0;
  v12[1] = sub_14768;
  uint64_t v13 = v0[56];
  uint64_t v14 = v0[53];
  uint64_t v15 = v0[36];
  v12[5] = v0[50];
  v12[6] = v15;
  v12[3] = v13;
  v12[4] = v14;
  return _swift_task_switch(sub_173CC, 0, 0);
}

uint64_t sub_14768(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 512) = a1;
  *(void *)(v3 + 520) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    id v4 = sub_14D38;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    id v4 = sub_148E8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_148E8()
{
  uint64_t v1 = *(void *)(v0 + 520);
  sub_16344(*(NSObject **)(v0 + 352));
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 488);
    (*(void (**)(void, void))(*(void *)(v0 + 392) + 8))(*(void *)(v0 + 400), *(void *)(v0 + 384));

    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
  }
  else
  {
    uint64_t v17 = *(void **)(v0 + 488);
    uint64_t v18 = *(void *)(v0 + 392);
    uint64_t v19 = *(void *)(v0 + 384);
    uint64_t v4 = *(void *)(v0 + 344);
    uint64_t v5 = *(void *)(v0 + 352);
    uint64_t v7 = *(void *)(v0 + 328);
    uint64_t v6 = *(void *)(v0 + 336);
    uint64_t v16 = *(void *)(v0 + 400);
    uint64_t v8 = *(void *)(v0 + 320);
    uint64_t v20 = *(void *)(v0 + 312);
    uint64_t v15 = *(void *)(v0 + 304);
    int v10 = *(uint64_t **)(v0 + 280);
    uint64_t v9 = *(void *)(v0 + 288);
    swift_bridgeObjectRelease();
    sub_60930();
    sub_6D90(&qword_768E0);
    unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_625B0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v12 + v11, v5, v6);
    sub_60910();
    sub_6EA4((void *)(v9 + 16), *(void *)(v9 + 40));
    sub_606D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v15, v7, v20);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v20);
    uint64_t v13 = sub_60DC0();
    *(_OWORD *)(v0 + 216) = 0u;
    *(void *)(v0 + 232) = 0;
    *(_OWORD *)(v0 + 200) = 0u;
    v10[3] = v13;
    v10[4] = (uint64_t)&protocol witness table for AceOutput;
    sub_838C(v10);
    sub_608A0();

    swift_bridgeObjectRelease();
    sub_6EE8(v0 + 200, (uint64_t *)&unk_78310);
    sub_6EE8(v15, (uint64_t *)&unk_76560);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v20);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_14C58()
{
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_14D38()
{
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 384);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void *sub_14E04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_61B10();
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4;
      v4 += 3;
      id v6 = v5;
      sub_61AF0();
      sub_61B20();
      sub_61B30();
      sub_61B00();
      --v2;
    }
    while (v2);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_14EB4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_3CE48(0, v1, 0);
    uint64_t v3 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1) {
        sub_3CE48(v6 > 1, v7 + 1, 1);
      }
      v3 += 4;
      _swiftEmptyArrayStorage[2] = v7 + 1;
      uint64_t v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_14F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  uint64_t v4 = sub_60320();
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  uint64_t v5 = sub_60D10();
  v3[12] = v5;
  v3[13] = *(void *)(v5 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  uint64_t v6 = sub_60C90();
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v7 = sub_60DA0();
  v3[20] = v7;
  v3[21] = *(void *)(v7 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  sub_6D90(&qword_768F0);
  v3[24] = swift_task_alloc();
  uint64_t v8 = sub_60AF0();
  v3[25] = v8;
  v3[26] = *(void *)(v8 - 8);
  v3[27] = swift_task_alloc();
  return _swift_task_switch(sub_15220, 0, 0);
}

uint64_t sub_15220()
{
  v0[2] = sub_470D8();
  v0[3] = v1;
  v0[28] = v1;
  if (!v1) {
    goto LABEL_7;
  }
  uint64_t v2 = sub_6EA4((void *)(v0[8] + 176), *(void *)(v0[8] + 200));
  v0[4] = sub_1A8A4(*v2);
  v0[5] = v3;
  v0[29] = v3;
  if (!v3)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_616D0();
    sub_6D40(v22, (uint64_t)qword_7A9C8);
    uint64_t v23 = sub_616C0();
    os_log_type_t v24 = sub_61970();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "AppNameDisambiguationFlow: cannot map action to AppDisambiguationDisplayInfo", v25, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = v0[7];

    type metadata accessor for AppNameDisambiguationError(0);
    sub_1D660((unint64_t *)&unk_76880, (void (*)(uint64_t))type metadata accessor for AppNameDisambiguationError);
    swift_allocError();
    uint64_t v28 = v27;
    uint64_t v29 = sub_607D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v28, v26, v29);
    swift_storeEnumTagMultiPayload();
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
    uint64_t v30 = (uint64_t (*)(void))v0[1];
    goto LABEL_16;
  }
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[13];
  sub_607B0();
  sub_60C80();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v4, v5);
  unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 88);
  int v12 = v11(v7, v8);
  if (v12 != enum case for Parse.uso(_:))
  {
    uint64_t v31 = v0[25];
    uint64_t v32 = v0[26];
    uint64_t v33 = v0[24];
    (*(void (**)(void, void))(v0[13] + 8))(v0[15], v0[12]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v33, 1, 1, v31);
LABEL_15:
    sub_6EE8(v0[24], &qword_768F0);
    uint64_t v41 = v0[28];
    uint64_t v40 = v0[29];
    uint64_t v42 = v0[2];
    char v43 = (void *)v0[6];
    *char v43 = v0[4];
    v43[1] = v40;
    v43[2] = v42;
    v43[3] = v41;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = (uint64_t (*)(void))v0[1];
LABEL_16:
    return v30();
  }
  int v13 = v12;
  uint64_t v14 = v0[21];
  uint64_t v54 = v0[20];
  uint64_t v55 = v0[23];
  uint64_t v15 = v0[18];
  uint64_t v16 = v0[15];
  uint64_t v57 = v0[14];
  uint64_t v58 = v0[12];
  uint64_t v59 = v0[16];
  char v53 = *(void (**)(uint64_t))(v0[13] + 96);
  v53(v16);
  uint64_t v17 = v55;
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
  v56(v17, v16, v54);
  sub_607B0();
  sub_60C80();
  v10(v15, v59);
  if (v11(v57, v58) == v13)
  {
    uint64_t v19 = v0[21];
    uint64_t v18 = v0[22];
    uint64_t v20 = v0[20];
    uint64_t v21 = v0[14];
    ((void (*)(uint64_t, void))v53)(v21, v0[12]);
    v56(v18, v21, v20);
    sub_60D30();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  else
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  }
  uint64_t v34 = v0[25];
  uint64_t v35 = v0[26];
  uint64_t v36 = v0[23];
  uint64_t v37 = v0[24];
  uint64_t v38 = v0[20];
  uint64_t v39 = v0[21];
  sub_60D70();
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v36, v38);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v37, 1, v34) == 1) {
    goto LABEL_15;
  }
  uint64_t v46 = v0[10];
  uint64_t v45 = v0[11];
  uint64_t v47 = v0[8];
  uint64_t v48 = v0[9];
  (*(void (**)(void, void, void))(v0[26] + 32))(v0[27], v0[24], v0[25]);
  sub_6EA4((void *)(v47 + 16), *(void *)(v47 + 40));
  sub_606C0();
  uint64_t v49 = sub_60300();
  uint64_t v51 = v50;
  v0[30] = v50;
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v48);
  if (qword_75D78 != -1) {
    swift_once();
  }
  unint64_t v52 = (void *)swift_task_alloc();
  v0[31] = v52;
  *unint64_t v52 = v0;
  v52[1] = sub_158A4;
  return AppShortcutInvocation.exists(siriLanguage:provider:)(v49, v51, qword_7A8E0);
}

uint64_t sub_158A4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 256) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_159C4, 0, 0);
}

uint64_t sub_159C4()
{
  if (*(unsigned char *)(v0 + 256) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    uint64_t v2 = *(void *)(v0 + 224);
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v4 = *(void **)(v0 + 48);
    *uint64_t v4 = *(void *)(v0 + 32);
    v4[1] = v1;
    v4[2] = v3;
    v4[3] = v2;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_616D0();
    sub_6D40(v6, (uint64_t)qword_7A9C8);
    uint64_t v7 = sub_616C0();
    os_log_type_t v8 = sub_61970();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "AppNameDisambiguationFlow: appShortcut invocation does not exist", v9, 2u);
      swift_slowDealloc();
    }
    uint64_t v11 = *(void *)(v0 + 208);
    uint64_t v10 = *(void *)(v0 + 216);
    uint64_t v12 = *(void *)(v0 + 200);

    type metadata accessor for AppNameDisambiguationError(0);
    sub_1D660((unint64_t *)&unk_76880, (void (*)(uint64_t))type metadata accessor for AppNameDisambiguationError);
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v13, v10, v12);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v5();
}

void *sub_15CB8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a1;
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v35 = *(void *)(a2 + 16);
  unint64_t v44 = a3 >> 62;
  if (a3 >> 62) {
    goto LABEL_49;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t v7 = (void *)v35;
    if (v6 < v35) {
      uint64_t v7 = (void *)v6;
    }
    uint64_t v8 = (uint64_t)((uint64_t)v7 >= (uint64_t)v5 ? v5 : v7);
    sub_3CE28(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    unint64_t v9 = v8;
    uint64_t v5 = _swiftEmptyArrayStorage;
    uint64_t v43 = v4;
    uint64_t v36 = v3;
    if (v8)
    {
      uint64_t v45 = v3 & 0xFFFFFFFFFFFFFF8;
      uint64_t v37 = (void *)(v3 + 32);
      unint64_t v38 = v3 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      uint64_t v40 = v8;
      while (v9 != v11)
      {
        uint64_t v13 = *(void *)(v4 + v10 + 32);
        uint64_t v12 = *(void *)(v4 + v10 + 40);
        uint64_t v14 = *(void *)(a2 + v10 + 32);
        uint64_t v15 = *(void *)(a2 + v10 + 40);
        if (v44)
        {
          uint64_t v3 = v36;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v4 = sub_61B60();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v4 = *(void *)(v45 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        if (v11 == v4) {
          goto LABEL_51;
        }
        uint64_t v47 = v15;
        if (v38)
        {
          uint64_t v16 = v14;
          uint64_t v17 = v13;
          id v18 = (id)sub_61A90();
        }
        else
        {
          if (v11 >= *(void *)(v45 + 16)) {
            goto LABEL_45;
          }
          uint64_t v16 = v14;
          uint64_t v17 = v13;
          id v18 = (id)v37[v11];
        }
        id v19 = v18;
        uint64_t v3 = _swiftEmptyArrayStorage[2];
        unint64_t v20 = _swiftEmptyArrayStorage[3];
        unint64_t v9 = v40;
        if (v3 >= v20 >> 1)
        {
          sub_3CE28(v20 > 1, v3 + 1, 1);
          unint64_t v9 = v40;
        }
        ++v11;
        _swiftEmptyArrayStorage[2] = v3 + 1;
        uint64_t v21 = &_swiftEmptyArrayStorage[5 * v3];
        v21[4] = v17;
        v21[5] = v12;
        v21[6] = v16;
        v21[7] = v47;
        v21[8] = v19;
        v10 += 16;
        uint64_t v4 = v43;
        if (v9 == v11) {
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_45:
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_25:
      unint64_t v22 = *(void *)(v4 + 16);
      if (v9 == v22)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return _swiftEmptyArrayStorage;
      }
      uint64_t v23 = v36 + 32;
      uint64_t v24 = 16 * v9 + 40;
      uint64_t v3 = v4 + v24;
      uint64_t v25 = (uint64_t *)(a2 + v24);
      while (v9 < v22)
      {
        if (v35 == v9) {
          goto LABEL_43;
        }
        uint64_t v39 = *(v25 - 1);
        uint64_t v41 = *(void *)(v3 - 8);
        uint64_t v46 = *v25;
        uint64_t v48 = *(void *)v3;
        if (v44)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_61B60();
          swift_bridgeObjectRelease();
          uint64_t v23 = v36 + 32;
          if (v9 == v27)
          {
LABEL_42:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_43;
          }
        }
        else
        {
          uint64_t v26 = *(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v9 == v26) {
            goto LABEL_42;
          }
        }
        if ((v36 & 0xC000000000000001) != 0)
        {
          uint64_t v4 = v9;
          id v28 = (id)sub_61A90();
        }
        else
        {
          if (v9 >= *(void *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_47;
          }
          uint64_t v4 = v9;
          id v28 = *(id *)(v23 + 8 * v9);
        }
        id v29 = v28;
        uint64_t v30 = v48;
        if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_48;
        }
        unint64_t v32 = _swiftEmptyArrayStorage[2];
        unint64_t v31 = _swiftEmptyArrayStorage[3];
        if (v32 >= v31 >> 1)
        {
          sub_3CE28(v31 > 1, v32 + 1, 1);
          uint64_t v30 = v48;
          uint64_t v23 = v36 + 32;
        }
        unint64_t v9 = v4 + 1;
        _swiftEmptyArrayStorage[2] = v32 + 1;
        uint64_t v33 = &_swiftEmptyArrayStorage[5 * v32];
        v33[4] = v41;
        v33[5] = v30;
        v33[6] = v39;
        v33[7] = v46;
        v33[8] = v29;
        uint64_t v4 = v43;
        unint64_t v22 = *(void *)(v43 + 16);
        v3 += 16;
        v25 += 2;
        if (v9 == v22) {
          goto LABEL_43;
        }
      }
    }
    __break(1u);
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_61B60();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_51:
  swift_bridgeObjectRelease();
  uint64_t result = (void *)swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_1615C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, void *a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v17 = a2;
  id v18 = a3;
  uint64_t v19 = a6;
  uint64_t v9 = sub_6D90(&qword_768E8);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_60870();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  swift_bridgeObjectRetain();
  v23._countAndFlagsBits = 35;
  v23._object = (void *)0xE100000000000000;
  sub_61820(v23);
  uint64_t v20 = a1;
  v24._countAndFlagsBits = sub_61C90();
  sub_61820(v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_60850();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  objc_msgSend(v18, "BOOLValue", v17);
  return sub_60A50();
}

uint64_t sub_16344@<X0>(NSObject *a1@<X8>)
{
  os_log_t v42 = a1;
  uint64_t v3 = sub_60F40();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_60F70();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (uint8_t *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = (uint8_t *)sub_1D028(v13, (void (*)(void, char *))sub_1D5C8, v1);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    unint64_t v38 = v7;
    uint64_t v41 = v9;
    __chkstk_darwin(result, v16);
    *(&v34 - 2) = v14;
    sub_1D660((unint64_t *)&unk_76860, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemGaveOptions);
    uint64_t v40 = v8;
    sub_615E0();
    uint64_t v17 = swift_bridgeObjectRelease();
    __chkstk_darwin(v17, v18);
    uint64_t v39 = (char *)v12;
    *(&v34 - 2) = v12;
    uint64_t v19 = sub_1D660((unint64_t *)&unk_78340, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
    os_log_t v20 = v42;
    sub_615E0();
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_616D0();
    sub_6D40(v21, (uint64_t)qword_7A9C8);
    uint64_t v22 = *(void (**)(char *, os_log_t, uint64_t))(v4 + 16);
    Swift::String v23 = v38;
    v22(v38, v20, v3);
    Swift::String v24 = sub_616C0();
    os_log_type_t v25 = sub_61960();
    int v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      os_log_t v42 = v24;
      uint64_t v27 = swift_slowAlloc();
      int v36 = v26;
      id v28 = (uint8_t *)v27;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v44 = v37;
      uint64_t v35 = v28;
      *(_DWORD *)id v28 = 136315138;
      uint64_t v34 = v28 + 4;
      sub_60FF0();
      v43[3] = v3;
      v43[4] = v19;
      id v29 = sub_838C(v43);
      v22((char *)v29, (os_log_t)v23, v3);
      uint64_t v30 = sub_60FE0();
      unint64_t v32 = v31;
      sub_63E8((uint64_t)v43);
      v43[0] = sub_316A4(v30, v32, &v44);
      sub_619C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
      os_log_t v33 = v42;
      _os_log_impl(&dword_0, v42, (os_log_type_t)v36, "AppNameDisambiguationFlow: systemDialogAct: %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v39, v40);
  }
  return result;
}

uint64_t sub_1681C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v64 = sub_607D0();
  uint64_t v5 = *(void *)(v64 - 8);
  __chkstk_darwin(v64, v6);
  uint64_t v8 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_60F00();
  uint64_t v59 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_60DE0();
  uint64_t v56 = *(void *)(v13 - 8);
  uint64_t v57 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_6D90(&qword_76878);
  __chkstk_darwin(v17 - 8, v18);
  os_log_t v20 = (char *)v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_61090();
  uint64_t v61 = *(void *)(v21 - 8);
  uint64_t v62 = v21;
  __chkstk_darwin(v21, v22);
  uint64_t v63 = (char *)v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = a1;
  sub_470D8();
  if (v24)
  {
    uint64_t v55 = v5;
    os_log_type_t v25 = sub_6EA4((void *)(a2 + 176), *(void *)(a2 + 200));
    sub_1A8A4(*v25);
    if (v26)
    {
      sub_61060();
      sub_611A0();
      swift_allocObject();
      sub_61190();
      sub_61180();
      swift_bridgeObjectRelease();
      if (sub_61170())
      {
        sub_61050();
        swift_release();
      }
      sub_61220();
      swift_allocObject();
      uint64_t v27 = sub_61210();
      sub_61240();
      sub_6D90((uint64_t *)&unk_76820);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_62660;
      *(void *)(v28 + 32) = v27;
      uint64_t v67 = v28;
      sub_61880();
      uint64_t v29 = sub_610F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v20, 1, 1, v29);
      swift_retain();
      uint64_t v30 = sub_610D0();
      swift_bridgeObjectRelease();
      sub_6EE8((uint64_t)v20, &qword_76878);
      uint64_t v31 = v60;
      uint64_t v32 = sub_61020();
      v54[0] = v30;
      v54[1] = v27;
      if (v31)
      {
        if (qword_75DE8 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_616D0();
        sub_6D40(v34, (uint64_t)qword_7A9C8);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v35 = sub_616C0();
        os_log_type_t v36 = sub_61970();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = (uint8_t *)swift_slowAlloc();
          uint64_t v67 = swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 136315138;
          uint64_t v66 = v31;
          swift_errorRetain();
          sub_6D90((uint64_t *)&unk_76890);
          uint64_t v38 = sub_61800();
          uint64_t v66 = sub_316A4(v38, v39, &v67);
          sub_619C0();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v35, v36, "AppNameDisambiguationFlow: error building system dialog act for disambiguation: %s", v37, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }

        uint64_t v51 = v64;
        uint64_t v52 = v55;
        type metadata accessor for AppNameDisambiguationError(0);
        sub_1D660((unint64_t *)&unk_76880, (void (*)(uint64_t))type metadata accessor for AppNameDisambiguationError);
        swift_allocError();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v53, v65, v51);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        swift_release();
        swift_release();
        swift_errorRelease();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v63, v62);
      }
      else
      {
        __chkstk_darwin(v32, v33);
        v54[-2] = v16;
        sub_1D660((unint64_t *)&unk_78350, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserStatedTask);
        sub_615E0();
        uint64_t v49 = sub_60EC0();
        __chkstk_darwin(v49, v50);
        v54[-2] = v12;
        sub_1D660(&qword_768A0, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
        sub_615E0();
        swift_release();
        swift_release();
        swift_release();
        (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v62);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v12, v9);
        return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v16, v57);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v5 = v55;
  }
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_616D0();
  sub_6D40(v40, (uint64_t)qword_7A9C8);
  uint64_t v41 = v64;
  uint64_t v63 = *(char **)(v5 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v63)(v8, v65, v64);
  os_log_t v42 = sub_616C0();
  os_log_type_t v43 = sub_61970();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    uint64_t v67 = v62;
    *(_DWORD *)uint64_t v44 = 136315138;
    sub_1D660((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
    uint64_t v45 = sub_61C90();
    uint64_t v66 = sub_316A4(v45, v46, &v67);
    uint64_t v41 = v64;
    sub_619C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v41);
    _os_log_impl(&dword_0, v42, v43, "AppNameDisambiguationFlow: failed to create SDA option for plugin action %s", v44, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v41);
  }

  type metadata accessor for AppNameDisambiguationError(0);
  sub_1D660((unint64_t *)&unk_76880, (void (*)(uint64_t))type metadata accessor for AppNameDisambiguationError);
  swift_allocError();
  ((void (*)(uint64_t, uint64_t, uint64_t))v63)(v47, v65, v41);
  swift_storeEnumTagMultiPayload();
  return swift_willThrow();
}

uint64_t sub_172C4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(char *))
{
  a3(0);
  __chkstk_darwin();
  uint64_t v7 = (char *)v10 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - v6, a2);
  return a4(v7);
}

uint64_t sub_173A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return _swift_task_switch(sub_173CC, 0, 0);
}

uint64_t sub_173CC()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppNameDisambiguationFlow: Creating disambiguation views for non watchOS", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[4];

  v0[7] = sub_1CB98();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = swift_allocObject();
  v0[8] = v8;
  *(void *)(v8 + 16) = &unk_76808;
  *(void *)(v8 + 24) = v7;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_78388 + dword_78388);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[9] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_175C8;
  uint64_t v10 = v0[3];
  return v12((uint64_t)&unk_76818, v8, v10);
}

uint64_t sub_175C8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_1794C;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_17730;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_17730()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = (void *)v0[7];
  uint64_t v3 = v0[4];
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_62660;
  *(void *)(v4 + 32) = v2;
  sub_61880();
  id v5 = v2;
  uint64_t v6 = sub_14E04(v1);
  swift_bridgeObjectRelease();
  sub_1A38C((unint64_t)v6);
  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_6D90((uint64_t *)&unk_78300);
    sub_61B50();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_61CB0();
  }
  sub_1D8A4(0, &qword_76830);
  uint64_t v7 = (void *)sub_61940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v8 = v7;
  sub_61850();
  if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_61890();
  }
  uint64_t v9 = (void *)v0[7];
  sub_618B0();
  sub_61880();

  uint64_t v10 = (uint64_t (*)(void *))v0[1];
  return v10(_swiftEmptyArrayStorage);
}

uint64_t sub_1794C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_179B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a5;
  v7[7] = a7;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  v7[3] = a2;
  return _swift_task_switch(sub_179D8, 0, 0);
}

uint64_t sub_179D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 56);
  id v5 = *(uint64_t (**)())(v3 + 16);
  if ((v4 & 0xC000000000000001) == 0)
  {
    if (((unint64_t)v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)) > (unint64_t)v5)
    {
      id v6 = *(id *)(v4 + 8 * (void)v5 + 32);
      goto LABEL_5;
    }
    __break(1u);
    return _swift_task_switch(v5, v4, a3);
  }
  id v6 = (id)sub_61A90();
LABEL_5:
  id v7 = v6;
  *(void *)(v3 + 64) = v6;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v3 + 72) = v8;
  *(void *)uint64_t v8 = v3;
  *(void *)(v8 + 8) = sub_17AD8;
  uint64_t v9 = *(void *)(v3 + 40);
  long long v10 = *(_OWORD *)(v3 + 24);
  *(void *)(v8 + 40) = *(void *)(v3 + 48);
  *(void *)(v8 + 48) = v7;
  *(void *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 16) = v10;
  id v5 = sub_1D3CC;
  uint64_t v4 = 0;
  a3 = 0;
  return _swift_task_switch(v5, v4, a3);
}

uint64_t sub_17AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  *(void *)(*v4 + 80) = v3;
  swift_task_dealloc();
  if (v3)
  {
    return _swift_task_switch(sub_17C4C, 0, 0);
  }
  else
  {

    long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
    return v10(a1, a2, a3);
  }
}

uint64_t sub_17C4C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_17CB0(uint64_t a1, uint64_t *a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_17DB4;
  return v11(v4, v5, v6, v7, v8);
}

uint64_t sub_17DB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    long long v10 = *(void **)(v8 + 16);
    void *v10 = a1;
    v10[1] = a2;
    void v10[2] = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

uint64_t sub_17ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[41] = a4;
  v5[42] = v4;
  v5[39] = a2;
  v5[40] = a3;
  v5[38] = a1;
  sub_6D90((uint64_t *)&unk_767E0);
  v5[43] = swift_task_alloc();
  uint64_t v6 = sub_60760();
  v5[44] = v6;
  v5[45] = *(void *)(v6 - 8);
  v5[46] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v5[47] = swift_task_alloc();
  uint64_t v7 = sub_60DC0();
  v5[48] = v7;
  v5[49] = *(void *)(v7 - 8);
  v5[50] = swift_task_alloc();
  uint64_t v8 = sub_60B00();
  v5[51] = v8;
  v5[52] = *(void *)(v8 - 8);
  v5[53] = swift_task_alloc();
  uint64_t v9 = sub_60A40();
  v5[54] = v9;
  v5[55] = *(void *)(v9 - 8);
  v5[56] = swift_task_alloc();
  return _swift_task_switch(sub_18114, 0, 0);
}

uint64_t sub_18114()
{
  sub_6EA4((void *)(v0[42] + 56), *(void *)(v0[42] + 80));
  unint64_t v1 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[57] = v1;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v3 = sub_3C438(inited);
  v0[58] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[59] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_18248;
  uint64_t v6 = v0[39];
  uint64_t v5 = v0[40];
  return sub_38544(v6, v5, v1, v3);
}

uint64_t sub_18248(uint64_t a1)
{
  *(void *)(*(void *)v2 + 480) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_errorRelease();
    unint64_t v3 = sub_187B0;
  }
  else
  {
    unint64_t v3 = sub_183A8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_183A8()
{
  uint64_t v1 = *(void **)(v0 + 480);
  uint64_t v3 = *(void *)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 424);
  uint64_t v13 = *(void *)(v0 + 408);
  uint64_t v17 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v15 = *(void **)(v0 + 336);
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v14 = *(void *)(v0 + 400);
  swift_bridgeObjectRetain();
  id v5 = [v1 speak];
  sub_61870();

  id v6 = [v1 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v13);
  sub_609F0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 176), *(void *)(v0 + 200));
  sub_606D0();
  uint64_t v7 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  sub_60880();
  sub_6EE8(v0 + 96, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 136);
  sub_63E8(v0 + 176);
  uint64_t v8 = v15[15];
  uint64_t v9 = v15[16];
  sub_6EA4(v15 + 12, v8);
  *(void *)(v0 + 240) = v16;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  long long v10 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 16))(v10, v14, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 488) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_18694;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v8, v9);
}

uint64_t sub_18694()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_18C04;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_189E0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_187B0()
{
  uint64_t v11 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[40];
  if (v4)
  {
    uint64_t v6 = v0[39];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[35] = sub_316A4(v6, v5, &v10);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v2, v3, "Couldn't create a dialog for %s.", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_608F0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_189E0()
{
  uint64_t v2 = v0[45];
  uint64_t v1 = v0[46];
  uint64_t v3 = v0[44];
  sub_6EA4((void *)(v0[42] + 136), *(void *)(v0[42] + 160));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for ActivityType.canceled(_:), v3);
  if (qword_75D68 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[43];
  uint64_t v5 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  uint64_t v6 = (void *)v0[60];
  uint64_t v8 = v0[55];
  uint64_t v7 = v0[56];
  uint64_t v9 = v0[54];
  uint64_t v11 = v0[49];
  uint64_t v10 = v0[50];
  uint64_t v12 = v0[48];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_18C04()
{
  uint64_t v17 = v0;
  sub_63E8((uint64_t)(v0 + 27));
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_61CE0();
    v0[37] = sub_316A4(v5, v6, &v16);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error publishing output %s.", v4, 0xCu);
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
  uint64_t v7 = (void *)v0[60];
  uint64_t v9 = v0[55];
  uint64_t v8 = v0[56];
  uint64_t v10 = v0[54];
  uint64_t v12 = v0[49];
  uint64_t v11 = v0[50];
  uint64_t v13 = v0[48];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_18EC4()
{
  return sub_60670();
}

uint64_t sub_18F00()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  sub_63E8(v0 + 176);
  uint64_t v1 = v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_firstAction;
  uint64_t v2 = sub_607D0();
  os_log_type_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_secondAction, v2);
  v3(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_fallBackAction, v2);
  sub_1E3E0(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppNameDisambiguationFlow_state, type metadata accessor for AppNameDisambiguationFlow.State);

  return swift_deallocClassInstance();
}

uint64_t sub_19038()
{
  return type metadata accessor for AppNameDisambiguationFlow(0);
}

uint64_t type metadata accessor for AppNameDisambiguationFlow(uint64_t a1)
{
  return sub_61F0(a1, (uint64_t *)&unk_765B8);
}

uint64_t sub_19060()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AppNameDisambiguationFlow.State(319);
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

uint64_t type metadata accessor for AppNameDisambiguationFlow.State(uint64_t a1)
{
  return sub_61F0(a1, qword_767C0);
}

uint64_t *sub_19164(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_6D90(&qword_76028);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_607D0();
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16);
      v11(a1, a2, v10);
      v11((uint64_t *)((char *)a1 + *(int *)(v7 + 48)), (uint64_t *)((char *)a2 + *(int *)(v7 + 48)), v10);
      v11((uint64_t *)((char *)a1 + *(int *)(v7 + 64)), (uint64_t *)((char *)a2 + *(int *)(v7 + 64)), v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_19314(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76028);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = sub_607D0();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v4 - 8), a1, v4);
    v6(a1 + *(int *)(v2 + 48), v4);
    uint64_t v5 = a1 + *(int *)(v2 + 64);
    return ((uint64_t (*)(uint64_t, uint64_t))v6)(v5, v4);
  }
  return result;
}

char *sub_19428(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90(&qword_76028);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_607D0();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v9(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v8);
    v9(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *sub_1959C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90(&qword_76028);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_607D0();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24);
      v15(a1, a2, v14);
      v15(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v14);
      v15(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v14);
      return a1;
    }
    sub_6EE8((uint64_t)a1, &qword_76028);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_607D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(a1, a2, v11);
  v12(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v11);
  v12(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

char *sub_197C0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90(&qword_76028);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_607D0();
    int v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    v9(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v8);
    v9(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *sub_19934(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90(&qword_76028);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_607D0();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40);
      v15(a1, a2, v14);
      v15(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v14);
      v15(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v14);
      return a1;
    }
    sub_6EE8((uint64_t)a1, &qword_76028);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_607D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(a1, a2, v11);
  v12(&a1[*(int *)(v6 + 48)], &a2[*(int *)(v6 + 48)], v11);
  v12(&a1[*(int *)(v6 + 64)], &a2[*(int *)(v6 + 64)], v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t sub_19B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_19B6C);
}

uint64_t sub_19B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_76028);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_19BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_19BF0);
}

uint64_t sub_19BF0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_6D90(&qword_76028);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_19C78(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76028);
  os_log_type_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 3, v2);
}

uint64_t sub_19CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_76028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 3, v4);
}

uint64_t sub_19D58()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_19DEC(uint64_t a1)
{
  return sub_EA2C(a1) & 1;
}

uint64_t sub_19E14()
{
  return sub_60550();
}

uint64_t sub_19E74(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_FEB4(a1);
}

uint64_t sub_19F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AppNameDisambiguationFlow(0);

  return Flow<>.exitValue.getter(v3, a2);
}

unint64_t sub_19F4C()
{
  uint64_t v1 = sub_60AF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = __chkstk_darwin(v1, v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  int v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_607D0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for AppNameDisambiguationError(0);
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (uint64_t *)((char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1E924(v0, (uint64_t)v18, type metadata accessor for AppNameDisambiguationError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, uint64_t *, uint64_t))(v2 + 32))(v9, v18, v1);
      unint64_t v25 = 0;
      unint64_t v26 = 0xE000000000000000;
      sub_61A70(27);
      swift_bridgeObjectRelease();
      unint64_t v25 = 0xD000000000000019;
      unint64_t v26 = 0x8000000000064400;
      (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v9, v1);
      v29._countAndFlagsBits = sub_61800();
      sub_61820(v29);
      swift_bridgeObjectRelease();
      unint64_t v19 = v25;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v1);
      break;
    case 2u:
      uint64_t v20 = *v18;
      uint64_t v21 = (void *)v18[1];
      unint64_t v25 = 0;
      unint64_t v26 = 0xE000000000000000;
      sub_61A70(22);
      swift_bridgeObjectRelease();
      unint64_t v22 = 0xD000000000000014;
      unint64_t v23 = 0x80000000000643E0;
      goto LABEL_5;
    case 3u:
      uint64_t v20 = *v18;
      uint64_t v21 = (void *)v18[1];
      unint64_t v25 = 0;
      unint64_t v26 = 0xE000000000000000;
      sub_61A70(17);
      swift_bridgeObjectRelease();
      unint64_t v22 = 0x20676E6973726150;
      unint64_t v23 = 0xEF203A726F727265;
LABEL_5:
      unint64_t v25 = v22;
      unint64_t v26 = v23;
      v28._countAndFlagsBits = v20;
      v28._object = v21;
      sub_61820(v28);
      swift_bridgeObjectRelease();
      unint64_t v19 = v25;
      break;
    default:
      (*(void (**)(char *, uint64_t *, uint64_t))(v11 + 32))(v14, v18, v10);
      unint64_t v25 = 0;
      unint64_t v26 = 0xE000000000000000;
      sub_61A70(36);
      swift_bridgeObjectRelease();
      unint64_t v25 = 0xD000000000000022;
      unint64_t v26 = 0x8000000000064420;
      sub_1D660((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      v27._countAndFlagsBits = sub_61C90();
      sub_61820(v27);
      swift_bridgeObjectRelease();
      unint64_t v19 = v25;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      break;
  }
  return v19;
}

uint64_t sub_1A38C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_61B60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_61B60();
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
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
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
    uint64_t v9 = sub_61AA0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1A558(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_61B60();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_61880();
}

uint64_t sub_1A558(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_61B60();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
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
    uint64_t v10 = sub_61B60();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1CF84();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_6D90(&qword_76840);
          uint64_t v12 = sub_1A76C(v16, i, a3);
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
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1D8A4(0, &qword_76838);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

void (*sub_1A76C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1A81C(v6, a2, a3);
  return sub_1A7D4;
}

void sub_1A7D4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1A81C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_61A90();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1A89C;
  }
  __break(1u);
  return result;
}

void sub_1A89C(id *a1)
{
}

uint64_t sub_1A8A4(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_768A8);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v45 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_60350();
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v44 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_60D10();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (void **)((char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_60C90();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v18 = sub_470D8();
  if (!v19)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_616D0();
    sub_6D40(v28, (uint64_t)qword_7A9C8);
    Swift::String v29 = sub_616C0();
    os_log_type_t v30 = sub_61970();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_0, v29, v30, "PluginAction: cannot convert to app name if it cannot be mapped to a appBundleId", v31, 2u);
      swift_slowDealloc();
    }
    swift_release();

    return 0;
  }
  uint64_t v20 = v18;
  unint64_t v21 = v19;
  uint64_t v48 = a1;
  uint64_t v22 = sub_3AC70(v18, v19);
  if (!v23)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_616D0();
    sub_6D40(v32, (uint64_t)qword_7A9C8);
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_616C0();
    os_log_type_t v34 = sub_61970();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_316A4(v20, v21, &v50);
      sub_619C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v33, v34, "PluginAction: cannot get app bundle record for appBundleId %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {
      swift_release();

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  uint64_t v43 = v22;
  swift_bridgeObjectRelease();
  sub_607B0();
  sub_60C80();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((*(unsigned int (**)(void **, uint64_t))(v9 + 88))(v12, v8) != enum case for Parse.pommesResponse(_:))
  {
    (*(void (**)(void **, uint64_t))(v9 + 8))(v12, v8);
    goto LABEL_16;
  }
  (*(void (**)(void **, uint64_t))(v9 + 96))(v12, v8);
  uint64_t v24 = *v12;
  uint64_t v25 = v45;
  sub_48D54(v45);
  uint64_t v27 = v46;
  uint64_t v26 = v47;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v25, 1, v47) == 1)
  {

    sub_6EE8(v25, &qword_768A8);
LABEL_16:
    swift_release();
    return v43;
  }
  swift_bridgeObjectRelease();
  uint64_t v37 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v44, v25, v26);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_616D0();
  sub_6D40(v38, (uint64_t)qword_7A9C8);
  unint64_t v39 = sub_616C0();
  os_log_type_t v40 = sub_61960();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_0, v39, v40, "PluginAction: overriding to pommes sash instead of app name", v41, 2u);
    swift_slowDealloc();
  }

  uint64_t v42 = sub_60340();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v37, v26);
  swift_release();
  return v42;
}

uint64_t sub_1AF24()
{
  uint64_t v0 = sub_6D90(&qword_76950);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)&v162 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_6D90(&qword_76958);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v162 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_610A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v13 = (char *)&v162 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  v172 = (char *)&v162 - v15;
  uint64_t v16 = sub_6D90(&qword_76960);
  __chkstk_darwin(v16 - 8, v17);
  v174 = (char *)&v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_61110();
  uint64_t v175 = *(void *)(v176 - 8);
  __chkstk_darwin(v176, v19);
  uint64_t v173 = (char *)&v162 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_6D90(&qword_76968);
  uint64_t v23 = __chkstk_darwin(v21 - 8, v22);
  uint64_t v178 = (char *)&v162 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v23, v25);
  uint64_t v180 = (char *)&v162 - v27;
  uint64_t v29 = __chkstk_darwin(v26, v28);
  uint64_t v182 = (char *)&v162 - v30;
  uint64_t v32 = __chkstk_darwin(v29, v31);
  uint64_t v185 = (char *)&v162 - v33;
  uint64_t v35 = __chkstk_darwin(v32, v34);
  uint64_t v190 = (char *)&v162 - v36;
  __chkstk_darwin(v35, v37);
  unint64_t v39 = (char *)&v162 - v38;
  uint64_t v40 = sub_61140();
  unint64_t v41 = *(void *)(v40 - 8);
  uint64_t v43 = __chkstk_darwin(v40, v42);
  uint64_t v177 = (char *)&v162 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __chkstk_darwin(v43, v45);
  v179 = (char *)&v162 - v47;
  uint64_t v49 = __chkstk_darwin(v46, v48);
  v181 = (char *)&v162 - v50;
  uint64_t v52 = __chkstk_darwin(v49, v51);
  v183 = (char *)&v162 - v53;
  uint64_t v55 = __chkstk_darwin(v52, v54);
  uint64_t v189 = (char *)&v162 - v56;
  __chkstk_darwin(v55, v57);
  uint64_t v59 = (char *)&v162 - v58;
  sub_612E0();
  uint64_t v60 = sub_6D90(&qword_76970);
  char v61 = swift_dynamicCast();
  uint64_t v62 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  if ((v61 & 1) == 0)
  {
    v62(v39, 1, 1, v40);
    v76 = &qword_76968;
    uint64_t v77 = (uint64_t)v39;
    goto LABEL_128;
  }
  uint64_t v171 = v60;
  v163 = v13;
  v164 = v3;
  v165 = v7;
  uint64_t v166 = v9;
  uint64_t v167 = v8;
  v186 = v62;
  unint64_t v187 = v41 + 56;
  v62(v39, 0, 1, v40);
  unint64_t v184 = v41;
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v188 = v40;
  unint64_t v169 = v41 + 32;
  v168 = v63;
  v63(v59, v39, v40);
  uint64_t v64 = sub_61130();
  uint64_t v65 = v64;
  uint64_t v66 = _swiftEmptyArrayStorage;
  v195 = _swiftEmptyArrayStorage;
  uint64_t v67 = *(void *)(v64 + 16);
  uint64_t v170 = v59;
  if (v67)
  {
    unint64_t v68 = 0;
    uint64_t v69 = v64 + 32;
    while (1)
    {
      if (v68 >= *(void *)(v65 + 16))
      {
        __break(1u);
LABEL_131:
        unint64_t v136 = v195;
        unint64_t v81 = v184;
        uint64_t v59 = v170;
        uint64_t v66 = _swiftEmptyArrayStorage;
LABEL_133:
        swift_bridgeObjectRelease();
        uint64_t v102 = v167;
        if (v136[2])
        {
          sub_83F0((uint64_t)(v136 + 4), (uint64_t)&v196);
        }
        else
        {
          uint64_t v198 = 0;
          long long v196 = 0u;
          long long v197 = 0u;
        }
        uint64_t v98 = v188;
        uint64_t v80 = v178;
        swift_release();
        if (*((void *)&v197 + 1))
        {
          int v137 = swift_dynamicCast();
          v186(v80, v137 ^ 1u, 1, v98);
          if (v162(v80, 1, v98) != 1)
          {
            v168(v177, v80, v98);
            uint64_t result = sub_61130();
            uint64_t v138 = result;
            v195 = _swiftEmptyArrayStorage;
            uint64_t v139 = *(void *)(result + 16);
            if (!v139) {
              goto LABEL_159;
            }
            unint64_t v140 = 0;
            uint64_t v141 = result + 32;
            while (2)
            {
              if (v140 >= *(void *)(v138 + 16)) {
                goto LABEL_179;
              }
              sub_83F0(v141, (uint64_t)&v192);
              sub_6EA4(&v192, v193);
              if (sub_61040() != 0x746163696C707061 || v142 != 0xED000064496E6F69)
              {
                char v144 = sub_61CA0();
                swift_bridgeObjectRelease();
                if (v144)
                {
LABEL_150:
                  sub_6D78(&v192, (uint64_t)&v191);
                  uint64_t v145 = v195;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  {
                    sub_3CD50(0, v145[2] + 1, 1);
                    uint64_t v145 = v195;
                  }
                  unint64_t v147 = v145[2];
                  unint64_t v146 = v145[3];
                  if (v147 >= v146 >> 1)
                  {
                    sub_3CD50(v146 > 1, v147 + 1, 1);
                    uint64_t v145 = v195;
                  }
                  v145[2] = v147 + 1;
                  uint64_t result = sub_6D78(&v191, (uint64_t)&v145[5 * v147 + 4]);
                }
                else
                {
                  uint64_t result = sub_63E8((uint64_t)&v192);
                }
                ++v140;
                v141 += 40;
                if (v139 == v140) {
                  goto LABEL_158;
                }
                continue;
              }
              break;
            }
            swift_bridgeObjectRelease();
            goto LABEL_150;
          }
        }
        else
        {
          sub_6EE8((uint64_t)&v196, &qword_76978);
          v186(v80, 1, 1, v98);
        }
        uint64_t v148 = *(void (**)(char *, uint64_t))(v81 + 8);
        v148(v179, v98);
        v148(v181, v98);
        v148(v183, v98);
        v148(v189, v98);
        v148(v59, v98);
LABEL_46:
        v76 = &qword_76968;
        goto LABEL_47;
      }
      sub_83F0(v69, (uint64_t)&v192);
      sub_6EA4(&v192, v193);
      if (sub_61040() == 0x6E6F69746361 && v70 == 0xE600000000000000) {
        break;
      }
      char v72 = sub_61CA0();
      swift_bridgeObjectRelease();
      if (v72) {
        goto LABEL_14;
      }
      sub_63E8((uint64_t)&v192);
LABEL_5:
      ++v68;
      v69 += 40;
      if (v67 == v68)
      {
        unint64_t v78 = v195;
        uint64_t v59 = v170;
        uint64_t v66 = _swiftEmptyArrayStorage;
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
LABEL_14:
    sub_6D78(&v192, (uint64_t)&v191);
    char v73 = v195;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_3CD50(0, v73[2] + 1, 1);
      char v73 = v195;
    }
    unint64_t v75 = v73[2];
    unint64_t v74 = v73[3];
    if (v75 >= v74 >> 1)
    {
      sub_3CD50(v74 > 1, v75 + 1, 1);
      char v73 = v195;
    }
    v73[2] = v75 + 1;
    sub_6D78(&v191, (uint64_t)&v73[5 * v75 + 4]);
    goto LABEL_5;
  }
  unint64_t v78 = _swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease();
  uint64_t v79 = v188;
  uint64_t v80 = v190;
  if (v78[2])
  {
    sub_83F0((uint64_t)(v78 + 4), (uint64_t)&v196);
  }
  else
  {
    uint64_t v198 = 0;
    long long v196 = 0u;
    long long v197 = 0u;
  }
  unint64_t v81 = v184;
  swift_release();
  if (!*((void *)&v197 + 1))
  {
    sub_6EE8((uint64_t)&v196, &qword_76978);
    v186(v80, 1, 1, v79);
    goto LABEL_45;
  }
  int v82 = swift_dynamicCast();
  v186(v80, v82 ^ 1u, 1, v79);
  uint64_t v84 = (char *)(v81 + 48);
  uint64_t v83 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48);
  if (v83(v80, 1, v79) == 1)
  {
LABEL_45:
    (*(void (**)(char *, uint64_t))(v81 + 8))(v59, v79);
    goto LABEL_46;
  }
  uint64_t v162 = v83;
  v168(v189, v80, v79);
  uint64_t v85 = sub_61130();
  uint64_t v86 = v85;
  v195 = _swiftEmptyArrayStorage;
  uint64_t v87 = *(void *)(v85 + 16);
  if (v87)
  {
    uint64_t v190 = (char *)(v81 + 48);
    unint64_t v88 = 0;
    uint64_t v89 = v85 + 32;
    while (1)
    {
      if (v88 >= *(void *)(v86 + 16))
      {
        __break(1u);
LABEL_158:
        uint64_t v66 = v195;
        uint64_t v98 = v188;
        unint64_t v81 = v184;
        uint64_t v102 = v167;
        uint64_t v59 = v170;
LABEL_159:
        swift_bridgeObjectRelease();
        if (v66[2])
        {
          sub_83F0((uint64_t)(v66 + 4), (uint64_t)&v196);
        }
        else
        {
          uint64_t v198 = 0;
          long long v196 = 0u;
          long long v197 = 0u;
        }
        uint64_t v149 = v176;
        uint64_t v150 = v175;
        uint64_t v80 = v174;
        swift_release();
        if (*((void *)&v197 + 1))
        {
          int v151 = swift_dynamicCast();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v150 + 56))(v80, v151 ^ 1u, 1, v149);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v150 + 48))(v80, 1, v149) != 1)
          {
            (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v173, v80, v149);
            uint64_t v152 = sub_61100();
            uint64_t v153 = *(void *)(v152 + 16);
            uint64_t v101 = sub_610C0();
            uint64_t v104 = *(void *)(v101 - 8);
            if (!v153) {
              goto LABEL_169;
            }
            uint64_t v154 = (uint64_t)v164;
            (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v101 - 8) + 16))(v164, v152+ ((*(unsigned __int8 *)(*(void *)(v101 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v101 - 8) + 80)), v101);
            uint64_t v155 = 0;
LABEL_170:
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v154, v155, 1, v101);
            swift_bridgeObjectRelease();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v104 + 48))(v154, 1, v101) == 1)
            {
              (*(void (**)(char *, uint64_t))(v175 + 8))(v173, v176);
              v157 = *(void (**)(char *, uint64_t))(v81 + 8);
              v157(v177, v98);
              v157(v179, v98);
              v157(v181, v98);
              v157(v183, v98);
              v157(v189, v98);
              v157(v59, v98);
              sub_6EE8(v154, &qword_76950);
              uint64_t v116 = (uint64_t)v165;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v166 + 56))(v165, 1, 1, v102);
            }
            else
            {
              uint64_t v116 = (uint64_t)v165;
              sub_610B0();
              (*(void (**)(char *, uint64_t))(v175 + 8))(v173, v176);
              v158 = *(void (**)(char *, uint64_t))(v81 + 8);
              v158(v177, v98);
              v158(v179, v98);
              v158(v181, v98);
              v158(v183, v98);
              v158(v189, v98);
              v158(v59, v98);
              (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v154, v101);
              uint64_t v114 = v166;
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v166 + 48))(v116, 1, v102) != 1) {
                goto LABEL_175;
              }
            }
            v76 = &qword_76958;
            uint64_t v77 = v116;
LABEL_128:
            sub_6EE8(v77, v76);
            return 0;
          }
        }
        else
        {
          sub_6EE8((uint64_t)&v196, &qword_76978);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v150 + 56))(v80, 1, 1, v149);
        }
        v156 = *(void (**)(char *, uint64_t))(v81 + 8);
        v156(v177, v98);
        v156(v179, v98);
        v156(v181, v98);
        v156(v183, v98);
        v156(v189, v98);
        v156(v59, v98);
        v76 = &qword_76960;
LABEL_47:
        uint64_t v77 = (uint64_t)v80;
        goto LABEL_128;
      }
      sub_83F0(v89, (uint64_t)&v192);
      sub_6EA4(&v192, v193);
      if (sub_61040() == 0x646E616D6D6F63 && v90 == 0xE700000000000000) {
        break;
      }
      char v92 = sub_61CA0();
      swift_bridgeObjectRelease();
      if (v92) {
        goto LABEL_39;
      }
      sub_63E8((uint64_t)&v192);
LABEL_30:
      ++v88;
      v89 += 40;
      if (v87 == v88)
      {
        unint64_t v96 = v195;
        unint64_t v81 = v184;
        uint64_t v59 = v170;
        uint64_t v66 = _swiftEmptyArrayStorage;
        uint64_t v84 = v190;
        goto LABEL_50;
      }
    }
    swift_bridgeObjectRelease();
LABEL_39:
    sub_6D78(&v192, (uint64_t)&v191);
    uint64_t v93 = v195;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_3CD50(0, v93[2] + 1, 1);
      uint64_t v93 = v195;
    }
    unint64_t v95 = v93[2];
    unint64_t v94 = v93[3];
    if (v95 >= v94 >> 1)
    {
      sub_3CD50(v94 > 1, v95 + 1, 1);
      uint64_t v93 = v195;
    }
    v93[2] = v95 + 1;
    sub_6D78(&v191, (uint64_t)&v93[5 * v95 + 4]);
    goto LABEL_30;
  }
  unint64_t v96 = _swiftEmptyArrayStorage;
LABEL_50:
  swift_bridgeObjectRelease();
  uint64_t v97 = v188;
  if (v96[2])
  {
    sub_83F0((uint64_t)(v96 + 4), (uint64_t)&v196);
  }
  else
  {
    uint64_t v198 = 0;
    long long v196 = 0u;
    long long v197 = 0u;
  }
  uint64_t v98 = (uint64_t)v185;
  swift_release();
  if (!*((void *)&v197 + 1))
  {
    sub_6EE8((uint64_t)&v196, &qword_76978);
    v186((char *)v98, 1, 1, v97);
    goto LABEL_73;
  }
  int v99 = swift_dynamicCast();
  v186((char *)v98, v99 ^ 1u, 1, v97);
  if (v162((char *)v98, 1, v97) == 1)
  {
LABEL_73:
    uint64_t v110 = *(void (**)(char *, uint64_t))(v81 + 8);
    v110(v189, v97);
LABEL_127:
    v110(v59, v97);
    v76 = &qword_76968;
    uint64_t v77 = v98;
    goto LABEL_128;
  }
  v168(v183, (char *)v98, v97);
  uint64_t v100 = sub_61130();
  uint64_t v101 = v100;
  v195 = _swiftEmptyArrayStorage;
  uint64_t v102 = *(void *)(v100 + 16);
  if (v102)
  {
    uint64_t v190 = v84;
    unint64_t v103 = 0;
    uint64_t v104 = 0x7463656A627573;
    uint64_t v105 = v100 + 32;
    uint64_t v59 = (unsigned char *)(&stru_20 + 8);
    while (1)
    {
      if (v103 >= *(void *)(v101 + 16))
      {
        __break(1u);
LABEL_169:
        uint64_t v155 = 1;
        uint64_t v154 = (uint64_t)v164;
        goto LABEL_170;
      }
      sub_83F0(v105, (uint64_t)&v192);
      unint64_t v81 = v194;
      sub_6EA4(&v192, v193);
      if (sub_61040() == 0x7463656A627573 && v106 == 0xE700000000000000) {
        break;
      }
      uint64_t v98 = sub_61CA0();
      swift_bridgeObjectRelease();
      if (v98) {
        goto LABEL_67;
      }
      sub_63E8((uint64_t)&v192);
LABEL_58:
      ++v103;
      v105 += 40;
      if (v102 == v103)
      {
        v111 = v195;
        unint64_t v81 = v184;
        uint64_t v59 = v170;
        uint64_t v66 = _swiftEmptyArrayStorage;
        uint64_t v84 = v190;
        goto LABEL_76;
      }
    }
    swift_bridgeObjectRelease();
LABEL_67:
    sub_6D78(&v192, (uint64_t)&v191);
    unint64_t v108 = v195;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_3CD50(0, v108[2] + 1, 1);
      unint64_t v108 = v195;
    }
    unint64_t v81 = v108[2];
    unint64_t v109 = v108[3];
    uint64_t v98 = v81 + 1;
    if (v81 >= v109 >> 1)
    {
      sub_3CD50(v109 > 1, v81 + 1, 1);
      unint64_t v108 = v195;
    }
    v108[2] = v98;
    sub_6D78(&v191, (uint64_t)&v108[5 * v81 + 4]);
    goto LABEL_58;
  }
  v111 = _swiftEmptyArrayStorage;
LABEL_76:
  swift_bridgeObjectRelease();
  uint64_t v98 = (uint64_t)v182;
  if (v111[2])
  {
    sub_83F0((uint64_t)(v111 + 4), (uint64_t)&v196);
  }
  else
  {
    uint64_t v198 = 0;
    long long v196 = 0u;
    long long v197 = 0u;
  }
  uint64_t v97 = v188;
  swift_release();
  if (!*((void *)&v197 + 1))
  {
    sub_6EE8((uint64_t)&v196, &qword_76978);
    v186((char *)v98, 1, 1, v97);
    goto LABEL_99;
  }
  int v112 = swift_dynamicCast();
  v186((char *)v98, v112 ^ 1u, 1, v97);
  if (v162((char *)v98, 1, v97) == 1)
  {
LABEL_99:
    uint64_t v110 = *(void (**)(char *, uint64_t))(v81 + 8);
    v110(v183, v97);
LABEL_126:
    v110(v189, v97);
    goto LABEL_127;
  }
  v168(v181, (char *)v98, v97);
  uint64_t v113 = sub_61130();
  uint64_t v114 = v113;
  v195 = _swiftEmptyArrayStorage;
  uint64_t v102 = *(void *)(v113 + 16);
  if (v102)
  {
    uint64_t v190 = v84;
    unint64_t v115 = 0;
    uint64_t v116 = v113 + 32;
    while (1)
    {
      if (v115 >= *(void *)(v114 + 16))
      {
        __break(1u);
LABEL_175:
        v159 = *(void (**)(char *, uint64_t, uint64_t))(v114 + 32);
        uint64_t v160 = v172;
        v159(v172, v116, v102);
        v161 = v163;
        v159(v163, (uint64_t)v160, v102);
        if ((*(unsigned int (**)(char *, uint64_t))(v114 + 88))(v161, v102) == enum case for TerminalElement.Value.string(_:))
        {
          (*(void (**)(char *, uint64_t))(v114 + 96))(v161, v102);
          return *(void *)v161;
        }
        (*(void (**)(char *, uint64_t))(v114 + 8))(v161, v102);
        return 0;
      }
      sub_83F0(v116, (uint64_t)&v192);
      sub_6EA4(&v192, v193);
      if (sub_61040() == 0x636E75614C707061 && v117 == 0xE900000000000068) {
        break;
      }
      char v119 = sub_61CA0();
      swift_bridgeObjectRelease();
      if (v119) {
        goto LABEL_93;
      }
      sub_63E8((uint64_t)&v192);
LABEL_84:
      ++v115;
      v116 += 40;
      if (v102 == v115)
      {
        uint64_t v123 = v195;
        unint64_t v81 = v184;
        uint64_t v59 = v170;
        uint64_t v66 = _swiftEmptyArrayStorage;
        uint64_t v84 = v190;
        goto LABEL_102;
      }
    }
    swift_bridgeObjectRelease();
LABEL_93:
    sub_6D78(&v192, (uint64_t)&v191);
    unint64_t v120 = v195;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_3CD50(0, v120[2] + 1, 1);
      unint64_t v120 = v195;
    }
    unint64_t v122 = v120[2];
    unint64_t v121 = v120[3];
    if (v122 >= v121 >> 1)
    {
      sub_3CD50(v121 > 1, v122 + 1, 1);
      unint64_t v120 = v195;
    }
    v120[2] = v122 + 1;
    sub_6D78(&v191, (uint64_t)&v120[5 * v122 + 4]);
    goto LABEL_84;
  }
  uint64_t v123 = _swiftEmptyArrayStorage;
LABEL_102:
  swift_bridgeObjectRelease();
  uint64_t v98 = (uint64_t)v180;
  if (v123[2])
  {
    sub_83F0((uint64_t)(v123 + 4), (uint64_t)&v196);
  }
  else
  {
    uint64_t v198 = 0;
    long long v196 = 0u;
    long long v197 = 0u;
  }
  uint64_t v97 = v188;
  swift_release();
  if (!*((void *)&v197 + 1))
  {
    sub_6EE8((uint64_t)&v196, &qword_76978);
    v186((char *)v98, 1, 1, v97);
    goto LABEL_125;
  }
  int v124 = swift_dynamicCast();
  v186((char *)v98, v124 ^ 1u, 1, v97);
  if (v162((char *)v98, 1, v97) == 1)
  {
LABEL_125:
    uint64_t v110 = *(void (**)(char *, uint64_t))(v81 + 8);
    v110(v181, v97);
    v110(v183, v97);
    goto LABEL_126;
  }
  v168(v179, (char *)v98, v97);
  uint64_t result = sub_61130();
  uint64_t v126 = result;
  v195 = _swiftEmptyArrayStorage;
  uint64_t v127 = *(void *)(result + 16);
  if (!v127)
  {
    unint64_t v136 = _swiftEmptyArrayStorage;
    goto LABEL_133;
  }
  uint64_t v190 = v84;
  unint64_t v128 = 0;
  uint64_t v129 = result + 32;
  while (v128 < *(void *)(v126 + 16))
  {
    sub_83F0(v129, (uint64_t)&v192);
    sub_6EA4(&v192, v193);
    if (sub_61040() == 7368801 && v130 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_119:
      sub_6D78(&v192, (uint64_t)&v191);
      uint64_t v133 = v195;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3CD50(0, v133[2] + 1, 1);
        uint64_t v133 = v195;
      }
      unint64_t v135 = v133[2];
      unint64_t v134 = v133[3];
      if (v135 >= v134 >> 1)
      {
        sub_3CD50(v134 > 1, v135 + 1, 1);
        uint64_t v133 = v195;
      }
      v133[2] = v135 + 1;
      uint64_t result = sub_6D78(&v191, (uint64_t)&v133[5 * v135 + 4]);
      goto LABEL_110;
    }
    char v132 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v132) {
      goto LABEL_119;
    }
    uint64_t result = sub_63E8((uint64_t)&v192);
LABEL_110:
    ++v128;
    v129 += 40;
    if (v127 == v128) {
      goto LABEL_131;
    }
  }
  __break(1u);
LABEL_179:
  __break(1u);
  return result;
}

void *sub_1C98C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id), uint64_t a3)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v24 = sub_60A70();
  uint64_t v4 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = _swiftEmptyArrayStorage;
  sub_3CDEC(0, 0, 0);
  uint64_t v8 = v27;
  uint64_t v9 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v23 = v9;
  v21[0] = a1;
  if (v9)
  {
    uint64_t v10 = 0;
    v21[2] = v4 + 32;
    uint64_t v22 = v4;
    uint64_t v11 = (void **)(a1 + 64);
    do
    {
      uint64_t v13 = (uint64_t)*(v11 - 1);
      uint64_t v12 = *v11;
      uint64_t v15 = (uint64_t)*(v11 - 3);
      uint64_t v14 = (uint64_t)*(v11 - 2);
      uint64_t v16 = (uint64_t)*(v11 - 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v17 = v12;
      v25(v10, v16, v15, v14, v13, v17);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = v8;
      unint64_t v19 = v8[2];
      unint64_t v18 = v8[3];
      if (v19 >= v18 >> 1)
      {
        sub_3CDEC(v18 > 1, v19 + 1, 1);
        uint64_t v8 = v27;
      }
      ++v10;
      v11 += 5;
      v8[2] = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(void *)(v22 + 72) * v19, v7, v24);
    }
    while (v23 != v10);
  }
  swift_bridgeObjectRelease();
  return v8;
}

id sub_1CB98()
{
  id v0 = [objc_allocWithZone((Class)SFTitleCardSection) init];
  if (*(void *)(sub_60A20() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    NSString v1 = sub_617E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    NSString v1 = 0;
  }
  [v0 setTitle:v1];

  [v0 setSeparatorStyle:5];
  return v0;
}

uint64_t sub_1CC58()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1CC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *(void *)(v5 + 24);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[6] = a5;
  v13[7] = v12;
  v13[4] = a3;
  v13[5] = a4;
  v13[2] = a1;
  v13[3] = a2;
  v13[1] = sub_1CD70;
  return _swift_task_switch(sub_179D8, 0, 0);
}

uint64_t sub_1CD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
  return v7(a1, a2, a3);
}

uint64_t sub_1CE84()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1CEBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1E98C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_76810 + dword_76810);
  return v8(a1, a2, v6);
}

unint64_t sub_1CF84()
{
  unint64_t result = qword_76848;
  if (!qword_76848)
  {
    sub_1CFE0(&qword_76840);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_76848);
  }
  return result;
}

uint64_t sub_1CFE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1D028(uint64_t a1, void (*a2)(void, char *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v41 = sub_60EC0();
  uint64_t v6 = *(void *)(v41 - 8);
  __chkstk_darwin(v41, v7);
  uint64_t v48 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_6D90(&qword_76870);
  uint64_t v10 = __chkstk_darwin(v45, v9);
  uint64_t v44 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v43 = (char *)v33 - v14;
  __chkstk_darwin(v13, v15);
  uint64_t v42 = (char *)v33 - v16;
  uint64_t v49 = _swiftEmptyArrayStorage;
  sub_3CDB0(0, 0, 0);
  id v17 = v49;
  uint64_t v18 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v40 = v18;
  v33[1] = a1;
  if (v18)
  {
    uint64_t v19 = 0;
    uint64_t v39 = sub_607D0();
    uint64_t v20 = *(void *)(v39 - 8);
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    uint64_t v37 = v20 + 16;
    uint64_t v38 = v21;
    uint64_t v22 = a1 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    uint64_t v23 = *(void *)(v20 + 72);
    uint64_t v35 = v6;
    uint64_t v36 = (void (**)(char *, char *, uint64_t))(v20 + 32);
    v33[2] = v6 + 32;
    uint64_t v34 = v23;
    uint64_t v24 = v43;
    while (1)
    {
      uint64_t v25 = v45;
      uint64_t v26 = &v44[*(int *)(v45 + 48)];
      uint64_t v27 = v39;
      v38(v26, v22, v39);
      uint64_t v28 = (char *)v24 + *(int *)(v25 + 48);
      *uint64_t v24 = v19;
      (*v36)(v28, v26, v27);
      uint64_t v29 = v42;
      sub_1D6A8((uint64_t)v24, (uint64_t)v42);
      v46(*(void *)v29, &v29[*(int *)(v25 + 48)]);
      sub_6EE8((uint64_t)v29, &qword_76870);
      if (v4) {
        break;
      }
      id v17 = v49;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3CDB0(0, v17[2] + 1, 1);
        id v17 = v49;
      }
      unint64_t v31 = v17[2];
      unint64_t v30 = v17[3];
      if (v31 >= v30 >> 1)
      {
        sub_3CDB0(v30 > 1, v31 + 1, 1);
        id v17 = v49;
      }
      ++v19;
      v17[2] = v31 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))((unint64_t)v17+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v31, v48, v41);
      uint64_t v49 = v17;
      v22 += v34;
      if (v40 == v19) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
  }
  return v17;
}

uint64_t sub_1D3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return _swift_task_switch(sub_1D3CC, 0, 0);
}

uint64_t sub_1D3CC()
{
  id v1 = [objc_allocWithZone((Class)SFRowCardSection) init];
  uint64_t v2 = (void *)sub_60810();
  [v1 setLeadingText:v2];

  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_62660;
  id v4 = v1;
  *(void *)(v3 + 32) = sub_60820();
  sub_61880();
  sub_1D8A4(0, &qword_76858);
  Class isa = sub_61860().super.isa;
  swift_bridgeObjectRelease();
  [v4 setCommands:isa];

  id v6 = [objc_allocWithZone((Class)SFAppIconImage) init];
  NSString v7 = sub_617E0();
  [v6 setBundleIdentifier:v7];

  [v4 setImage:v6];
  id v8 = v4;
  [v8 setSeparatorStyle:2];

  uint64_t v12 = (uint64_t (*)(id, uint64_t, uint64_t))v0[1];
  swift_bridgeObjectRetain();
  uint64_t v9 = v0[2];
  uint64_t v10 = v0[3];
  return v12(v8, v9, v10);
}

uint64_t sub_1D5C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_1681C(a1, v2, a2);
}

uint64_t sub_1D5E4()
{
  return sub_60F50();
}

uint64_t sub_1D61C(uint64_t a1)
{
  return sub_172C4(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_SystemGaveOptions, (uint64_t (*)(char *))&Siri_Nlu_External_SystemDialogAct.gaveOptions.setter);
}

uint64_t sub_1D660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1D6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_76870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AppNameDisambiguationError(uint64_t a1)
{
  return sub_61F0(a1, qword_769F0);
}

uint64_t sub_1D730(uint64_t a1)
{
  return sub_172C4(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_UsoGraph, (uint64_t (*)(char *))&Siri_Nlu_External_UserStatedTask.task.setter);
}

uint64_t sub_1D774(uint64_t a1)
{
  return sub_172C4(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_UserStatedTask, (uint64_t (*)(char *))&Siri_Nlu_External_UserDialogAct.userStatedTask.setter);
}

uint64_t sub_1D7B8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1D7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  NSString v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *NSString v7 = v3;
  v7[1] = sub_6C0C;
  return sub_14F8C(a1, a2, v6);
}

uint64_t sub_1D8A4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D8E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, void *a3@<X5>, uint64_t a4@<X8>)
{
  return sub_1615C(a1, a2, a3, *(void *)(v4 + 16), *(void *)(v4 + 24), a4);
}

unint64_t sub_1D8E8()
{
  unint64_t result = qword_76900;
  if (!qword_76900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76900);
  }
  return result;
}

uint64_t sub_1D93C()
{
  uint64_t v1 = sub_607D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = (v5 + v3 + v7) & ~v3;
  unint64_t v9 = ((v5 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  uint64_t v10 = v0 + v4;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v11(v10, v1);
  v11(v0 + v7, v1);
  v11(v0 + v8, v1);

  return _swift_deallocObject(v0, v9, v6);
}

uint64_t sub_1DA58()
{
  uint64_t v2 = *(void *)(sub_607D0() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64) + v3;
  uint64_t v6 = (v4 + v5) & ~v3;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = v0 + ((v6 + v5) & ~v3);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  void *v10 = v1;
  v10[3] = v8;
  v10[4] = v9;
  v10[1] = sub_1E98C;
  void v10[2] = v7;
  return _swift_task_switch(sub_10EF4, 0, 0);
}

uint64_t sub_1DB7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6D90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppNameDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DC44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppNameDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo()
{
  return &type metadata for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo;
}

uint64_t *sub_1DEB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = sub_60AF0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      case 2u:
      case 3u:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = sub_607D0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1E048(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_607D0();
      goto LABEL_7;
    case 1:
      uint64_t v3 = sub_60AF0();
LABEL_7:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 2:
    case 3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *sub_1E124(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = sub_60AF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      break;
    case 2u:
    case 3u:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = sub_607D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1E268(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1E3E0((uint64_t)a1, type metadata accessor for AppNameDisambiguationError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v5 = sub_60AF0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        break;
      case 2u:
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = sub_607D0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1E3E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1E440(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_60AF0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_607D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1E54C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E3E0((uint64_t)a1, type metadata accessor for AppNameDisambiguationError);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_60AF0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_607D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1E67C()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_60AF0();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t destroy for AppNameDisambiguationFlow.Card(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s17CAMRootFlowPlugin25AppNameDisambiguationFlowC4CardVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppNameDisambiguationFlow.Card(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppNameDisambiguationFlow.Card(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppNameDisambiguationFlow.Card(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppNameDisambiguationFlow.Card(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppNameDisambiguationFlow.Card(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppNameDisambiguationFlow.Card()
{
  return &type metadata for AppNameDisambiguationFlow.Card;
}

uint64_t sub_1E924(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_1E994(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_3CE48(0, v1, 0);
    uint64_t v3 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1) {
        sub_3CE48(v6 > 1, v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      uint64_t v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 3;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void sub_1EA6C()
{
  qword_7A908 = 0x54746E6572727543;
  unk_7A910 = 0xEB000000006B7361;
}

BOOL sub_1EA98(uint64_t a1)
{
  uint64_t v141 = a1;
  uint64_t v1 = sub_616D0();
  uint64_t v128 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v2);
  unint64_t v134 = (char *)&v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppShortcutEnablementFlow.State(0);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v124 = (uint64_t)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v8);
  uint64_t v123 = (char *)&v109 - v9;
  uint64_t v10 = sub_6D90((uint64_t *)&unk_78360);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v133 = (char *)&v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_602F0();
  uint64_t v121 = *(void *)(v122 - 8);
  __chkstk_darwin(v122, v13);
  v118 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_607D0();
  uint64_t v136 = *(void *)(v15 - 8);
  uint64_t v137 = v15;
  __chkstk_darwin(v15, v16);
  unint64_t v135 = (char *)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_60DA0();
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113, v18);
  v111 = (char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_60CF0();
  uint64_t v115 = *(void *)(v116 - 8);
  __chkstk_darwin(v116, v20);
  uint64_t v114 = (char *)&v109 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_60D10();
  uint64_t v131 = *(void *)(v22 - 8);
  __chkstk_darwin(v22, v23);
  unint64_t v140 = (char *)&v109 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_6D90((uint64_t *)&unk_76940);
  uint64_t v27 = __chkstk_darwin(v25 - 8, v26);
  uint64_t v132 = (uint64_t)&v109 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v27, v29);
  uint64_t v119 = (uint64_t)&v109 - v31;
  __chkstk_darwin(v30, v32);
  uint64_t v34 = (char *)&v109 - v33;
  uint64_t v35 = sub_60C90();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v38 = __chkstk_darwin(v35, v37);
  unint64_t v120 = (char *)&v109 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __chkstk_darwin(v38, v40);
  uint64_t v117 = (char *)&v109 - v42;
  __chkstk_darwin(v41, v43);
  uint64_t v45 = (char *)&v109 - v44;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v129 = v1;
  uint64_t v46 = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v125 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  uint64_t v126 = v36 + 16;
  v125(v45, v141, v35);
  uint64_t v139 = v46;
  uint64_t v47 = sub_616C0();
  os_log_type_t v48 = sub_61960();
  BOOL v49 = os_log_type_enabled(v47, v48);
  uint64_t v138 = v36;
  if (v49)
  {
    uint64_t v50 = swift_slowAlloc();
    uint64_t v110 = v34;
    uint64_t v51 = (uint8_t *)v50;
    uint64_t v52 = swift_slowAlloc();
    uint64_t v109 = v22;
    uint64_t v142 = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    sub_2D1B8((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v53 = sub_61C90();
    uint64_t v143 = sub_316A4(v53, v54, &v142);
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v127 = *(void (**)(char *, uint64_t))(v138 + 8);
    v127(v45, v35);
    _os_log_impl(&dword_0, v47, v48, "AppShortcutEnablementFlow received input %s", v51, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v109;
    swift_slowDealloc();
    uint64_t v34 = v110;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v127 = *(void (**)(char *, uint64_t))(v36 + 8);
    v127(v45, v35);
  }

  uint64_t v56 = v136;
  uint64_t v55 = v137;
  uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v136 + 56);
  v57(v34, 1, 1, v137);
  uint64_t v58 = v140;
  sub_60C80();
  uint64_t v59 = v131;
  int v60 = (*(uint64_t (**)(char *, uint64_t))(v131 + 88))(v58, v22);
  if (v60 == enum case for Parse.NLv3IntentOnly(_:))
  {
    sub_6EE8((uint64_t)v34, (uint64_t *)&unk_76940);
    v57(v34, 1, 1, v55);
    char v61 = sub_616C0();
    os_log_type_t v62 = sub_61970();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      _os_log_impl(&dword_0, v61, v62, "AppShortcutEnablementFlow received unsupported NLv3IntentOnly parse", v63, 2u);
      swift_slowDealloc();
    }

    goto LABEL_16;
  }
  if (v60 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v64 = v140;
    (*(void (**)(char *, uint64_t))(v59 + 96))(v140, v22);
    uint64_t v65 = v115;
    uint64_t v66 = (uint64_t)v114;
    uint64_t v67 = v64;
    uint64_t v68 = v116;
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v114, v67, v116);
    uint64_t v69 = v119;
    sub_2920C(v66, v130 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutAction, v130 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_otherAction, v119);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v68);
    sub_6EE8((uint64_t)v34, (uint64_t *)&unk_76940);
    uint64_t v70 = v69;
LABEL_14:
    sub_2D2C8(v70, (uint64_t)v34, (uint64_t *)&unk_76940);
    goto LABEL_17;
  }
  if (v60 == enum case for Parse.uso(_:))
  {
    uint64_t v71 = v140;
    (*(void (**)(char *, uint64_t))(v59 + 96))(v140, v22);
    uint64_t v72 = v112;
    uint64_t v73 = (uint64_t)v111;
    unint64_t v74 = v71;
    uint64_t v75 = v113;
    (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v111, v74, v113);
    uint64_t v76 = v119;
    sub_29708(v73, v130 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutAction, v130 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_otherAction, v119);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v73, v75);
    sub_6EE8((uint64_t)v34, (uint64_t *)&unk_76940);
    uint64_t v70 = v76;
    goto LABEL_14;
  }
  sub_6EE8((uint64_t)v34, (uint64_t *)&unk_76940);
  v57(v34, 1, 1, v55);
LABEL_16:
  (*(void (**)(char *, uint64_t))(v59 + 8))(v140, v22);
LABEL_17:
  uint64_t v77 = v132;
  sub_1DB7C((uint64_t)v34, v132, (uint64_t *)&unk_76940);
  int v78 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v77, 1, v55);
  uint64_t v79 = v135;
  uint64_t v80 = (uint64_t)v133;
  if (v78 == 1)
  {
    sub_6EE8(v77, (uint64_t *)&unk_76940);
    uint64_t v90 = v128;
    uint64_t v91 = v129;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v134, v139, v129);
    char v92 = v120;
    v125(v120, v141, v35);
    uint64_t v93 = v35;
    unint64_t v94 = sub_616C0();
    os_log_type_t v95 = sub_61970();
    if (os_log_type_enabled(v94, v95))
    {
      uint64_t v96 = swift_slowAlloc();
      uint64_t v142 = swift_slowAlloc();
      *(_DWORD *)uint64_t v96 = 136315394;
      uint64_t v143 = sub_316A4(0x7475706E69286E6FLL, 0xEA0000000000293ALL, &v142);
      LODWORD(v140) = 1;
      sub_619C0();
      *(_WORD *)(v96 + 12) = 2080;
      sub_2D1B8((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v97 = sub_61C90();
      uint64_t v143 = sub_316A4(v97, v98, &v142);
      int v78 = (int)v140;
      sub_619C0();
      swift_bridgeObjectRelease();
      v127(v92, v93);
      _os_log_impl(&dword_0, v94, v95, "%s could not resolve action from %s", (uint8_t *)v96, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v128 + 8))(v134, v129);
    }
    else
    {
      v127(v92, v93);

      (*(void (**)(char *, uint64_t))(v90 + 8))(v134, v91);
    }
    sub_60B70();
    sub_60B60();
    sub_60B30();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v135, v77, v55);
    sub_607C0();
    uint64_t v81 = v121;
    uint64_t v82 = v122;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48))(v80, 1, v122) == 1)
    {
      LODWORD(v140) = v78;
      sub_6EE8(v80, (uint64_t *)&unk_78360);
      uint64_t v83 = v117;
      v125(v117, v141, v35);
      uint64_t v84 = v35;
      uint64_t v85 = sub_616C0();
      os_log_type_t v86 = sub_61970();
      if (os_log_type_enabled(v85, v86))
      {
        uint64_t v87 = (uint8_t *)swift_slowAlloc();
        uint64_t v142 = swift_slowAlloc();
        *(_DWORD *)uint64_t v87 = 136315138;
        sub_2D1B8((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
        uint64_t v88 = sub_61C90();
        uint64_t v143 = sub_316A4(v88, v89, &v142);
        uint64_t v56 = v136;
        uint64_t v55 = v137;
        sub_619C0();
        swift_bridgeObjectRelease();
        v127(v83, v84);
        _os_log_impl(&dword_0, v85, v86, "AppShortcutEnablementFlow could not extract loggingId from %s", v87, 0xCu);
        swift_arrayDestroy();
        uint64_t v79 = v135;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v127(v83, v84);
      }

      int v78 = (int)v140;
    }
    else
    {
      uint64_t v99 = v80;
      uint64_t v100 = v118;
      (*(void (**)(char *, uint64_t, uint64_t))(v81 + 32))(v118, v99, v82);
      sub_60B70();
      sub_60B60();
      sub_60B50();
      swift_release();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v100, v82);
    }
    uint64_t v101 = (uint64_t)v123;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v123, v79, v55);
    uint64_t v102 = sub_6D90((uint64_t *)&unk_76030);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v101, 0, 2, v102);
    uint64_t v103 = v124;
    sub_2D200(v101, v124);
    uint64_t v104 = v130 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_state;
    swift_beginAccess();
    sub_2D264(v103, v104);
    swift_endAccess();
    uint64_t v105 = sub_616C0();
    os_log_type_t v106 = sub_61960();
    if (os_log_type_enabled(v105, v106))
    {
      uint64_t v107 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v107 = 0;
      _os_log_impl(&dword_0, v105, v106, "AppShortcutEnablementFlow input accepted", v107, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v79, v55);
  }
  sub_6EE8((uint64_t)v34, (uint64_t *)&unk_76940);
  return v78 != 1;
}

uint64_t sub_1FBAC(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_60D10();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_60C90();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v5 = sub_60DA0();
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  sub_6D90(&qword_768F0);
  v2[19] = swift_task_alloc();
  uint64_t v6 = sub_60AF0();
  v2[20] = v6;
  v2[21] = *(void *)(v6 - 8);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v7 = sub_607D0();
  v2[24] = v7;
  v2[25] = *(void *)(v7 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  type metadata accessor for AppShortcutEnablementFlow.State(0);
  v2[28] = swift_task_alloc();
  return _swift_task_switch(sub_1FE58, 0, 0);
}

uint64_t sub_1FE58()
{
  uint64_t v66 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  v0[29] = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppShortcutEnablementFlow called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[9];

  uint64_t v7 = v6 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_state;
  swift_beginAccess();
  sub_2D154(v7, v5);
  uint64_t v8 = sub_6D90((uint64_t *)&unk_76030);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 2, v8);
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v10 = (void *)swift_task_alloc();
      v0[30] = v10;
      void *v10 = v0;
      v10[1] = sub_207D4;
      uint64_t v11 = v0[8];
      return sub_20D3C(v11);
    }
    uint64_t v42 = sub_616C0();
    os_log_type_t v43 = sub_61970();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_0, v42, v43, "AppShortcutEnablementFlow got invalid respose", v44, 2u);
      swift_slowDealloc();
    }

    sub_60B80();
    sub_60600();
    type metadata accessor for CamErrorFlow();
    swift_allocObject();
    v0[5] = sub_352DC(0xD000000000000010, 0x80000000000643C0, (uint64_t)v64, (uint64_t)v65);
    sub_2D1B8((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
    sub_60540();
    swift_release();
    sub_608E0();
    swift_release();
    goto LABEL_24;
  }
  uint64_t v13 = v0[14];
  uint64_t v14 = v0[15];
  uint64_t v16 = v0[12];
  uint64_t v15 = v0[13];
  uint64_t v17 = v0[10];
  uint64_t v18 = v0[11];
  (*(void (**)(void, void, void))(v0[25] + 32))(v0[27], v0[28], v0[24]);
  sub_60AE0();
  sub_61730();
  swift_bridgeObjectRelease();
  sub_607B0();
  sub_60C80();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 88))(v16, v17);
  uint64_t v21 = v0[20];
  uint64_t v20 = v0[21];
  uint64_t v22 = v0[19];
  if (v19 != enum case for Parse.uso(_:))
  {
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v22, 1, 1, v21);
    goto LABEL_18;
  }
  uint64_t v24 = v0[17];
  uint64_t v23 = v0[18];
  uint64_t v25 = v0[16];
  uint64_t v26 = v0[12];
  (*(void (**)(uint64_t, void))(v0[11] + 96))(v26, v0[10]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v23, v26, v25);
  LOBYTE(v65[0]) = 1;
  sub_60D70();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1, v21) == 1)
  {
LABEL_18:
    sub_6EE8(v0[19], &qword_768F0);
    uint64_t v45 = sub_616C0();
    os_log_type_t v46 = sub_61960();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_0, v45, v46, "App Shortcuts declined by user after ambiguous first run prompt", v47, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void, void, void))(v0[25] + 16))(v0[26], v0[27], v0[24]);
    os_log_type_t v48 = sub_616C0();
    os_log_type_t v49 = sub_61970();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v51 = v0[25];
    uint64_t v52 = v0[26];
    uint64_t v53 = v0[24];
    if (v50)
    {
      unint64_t v54 = (uint8_t *)swift_slowAlloc();
      v65[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v54 = 136315138;
      sub_2D1B8((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      uint64_t v55 = sub_61C90();
      v0[6] = sub_316A4(v55, v56, v65);
      sub_619C0();
      swift_bridgeObjectRelease();
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      v57(v52, v53);
      _os_log_impl(&dword_0, v48, v49, "AppShortcutEnablementFlow redirecting to resolved action %s", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      v57(v0[26], v0[24]);
    }

    uint64_t v58 = v0[27];
    uint64_t v59 = v0[24];
    sub_60900();
    v57(v58, v59);
LABEL_24:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v60 = (uint64_t (*)(void))v0[1];
    return v60();
  }
  uint64_t v28 = v0[22];
  uint64_t v27 = v0[23];
  uint64_t v30 = v0[20];
  uint64_t v29 = v0[21];
  (*(void (**)(uint64_t, void, uint64_t))(v29 + 32))(v27, v0[19], v30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v28, v27, v30);
  uint64_t v31 = sub_616C0();
  os_log_type_t v32 = sub_61960();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v35 = v0[21];
  uint64_t v34 = v0[22];
  if (v33)
  {
    uint64_t v63 = v0[20];
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    v65[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315138;
    uint64_t v37 = sub_60AE0();
    v0[7] = sub_316A4(v37, v38, v65);
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void (**)(void, void))(v35 + 8);
    uint64_t v40 = v35 + 8;
    uint64_t v39 = v41;
    v41(v34, v63);
    _os_log_impl(&dword_0, v31, v32, "App Shortcuts for %s enabled after ambiguous first run prompt", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    char v61 = *(void (**)(void, void))(v35 + 8);
    uint64_t v40 = v35 + 8;
    uint64_t v39 = v61;
    v61(v0[22], v0[20]);
  }

  v0[31] = v40;
  v0[32] = v39;
  os_log_type_t v62 = (void *)swift_task_alloc();
  v0[33] = v62;
  *os_log_type_t v62 = v0;
  v62[1] = sub_2099C;
  return AppShortcutInvocation.enableAppShortcuts()();
}

uint64_t sub_207D4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_208D0, 0, 0);
}

uint64_t sub_208D0()
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2099C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_20A98, 0, 0);
}

uint64_t sub_20A98()
{
  uint64_t v15 = v0;
  (*(void (**)(void, void))(v0 + 256))(*(void *)(v0 + 184), *(void *)(v0 + 160));
  (*(void (**)(void, void, void))(*(void *)(v0 + 200) + 16))(*(void *)(v0 + 208), *(void *)(v0 + 216), *(void *)(v0 + 192));
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = *(void *)(v0 + 200);
    uint64_t v3 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 192);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_2D1B8((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
    uint64_t v6 = sub_61C90();
    *(void *)(v0 + 48) = sub_316A4(v6, v7, &v14);
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v8(v3, v13);
    _os_log_impl(&dword_0, v1, v2, "AppShortcutEnablementFlow redirecting to resolved action %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 200) + 8);
    v8(*(void *)(v0 + 208), *(void *)(v0 + 192));
  }

  uint64_t v9 = *(void *)(v0 + 216);
  uint64_t v10 = *(void *)(v0 + 192);
  sub_60900();
  v8(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_20D3C(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[19] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[20] = v3;
  v2[21] = *(void *)(v3 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v4 = sub_60BD0();
  v2[23] = v4;
  v2[24] = *(void *)(v4 - 8);
  v2[25] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_78360);
  v2[26] = swift_task_alloc();
  uint64_t v5 = sub_602F0();
  v2[27] = v5;
  v2[28] = *(void *)(v5 - 8);
  v2[29] = swift_task_alloc();
  return _swift_task_switch(sub_20F14, 0, 0);
}

uint64_t sub_20F14()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  *(void *)(v0 + 240) = sub_6D40(v1, (uint64_t)qword_7A9C8);
  os_log_type_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AppShortcutEnablementFlow attempting to render confirmation", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v5;
  void *v5 = v0;
  v5[1] = sub_21070;
  return sub_219F8(v0 + 56);
}

uint64_t sub_21070()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_2179C;
  }
  else {
    os_log_type_t v2 = sub_21184;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_21184()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 208);
  sub_6D78((long long *)(v0 + 56), v0 + 16);
  sub_607C0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    sub_6EE8(*(void *)(v0 + 208), (uint64_t *)&unk_78360);
    uint64_t v5 = sub_616C0();
    os_log_type_t v6 = sub_61960();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v5, v6, "AppShortcutEnablementFlow could not extract loggingIds for action. SELF message was not emitted as a result.", v7, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 224);
    uint64_t v8 = *(void *)(v0 + 232);
    uint64_t v10 = *(void *)(v0 + 216);
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 184);
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v8, *(void *)(v0 + 208), v10);
    sub_60B70();
    sub_60B60();
    sub_6D90(&qword_76918);
    unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_625B0;
    unint64_t v15 = v14 + v13;
    uint64_t v1 = v0 + 16;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v15, v8, v10);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for CAMDisambiguationDialogType.shortcutEnablement(_:), v21);
    sub_60B40();
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v21);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v16 = *(void **)(v0 + 144);
  uint64_t v17 = v16[31];
  uint64_t v18 = v16[32];
  sub_6EA4(v16 + 28, v17);
  int v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v19;
  *int v19 = v0;
  v19[1] = sub_2144C;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v1, v17, v18);
}

uint64_t sub_2144C()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_2D544;
  }
  else
  {
    uint64_t v1 = sub_21564;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_21564()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  sub_6EA4((void *)(v0[18] + 104), *(void *)(v0[18] + 128));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.disambiguation(_:), v3);
  if (qword_75D80 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[19];
  uint64_t v5 = enum case for SiriKitReliabilityCodes.disambiguationShortcutVsOther(_:);
  uint64_t v6 = sub_60620();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(v4, v5, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608C0();
  sub_63E8((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2179C()
{
  uint64_t v9 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_61CE0();
    *(void *)(v0 + 128) = sub_316A4(v4, v5, &v8);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "AppShortcutEnablementFlow will redirect to fall back action. Error: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_60900();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_219BC()
{
  return sub_60670();
}

uint64_t sub_219F8(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_60320();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_21AB8, 0, 0);
}

uint64_t sub_21AB8()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  v0[9] = OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutInvocation;
  sub_6EA4((void *)(v4 + 24), *(void *)(v4 + 48));
  sub_606C0();
  uint64_t v5 = sub_60300();
  uint64_t v7 = v6;
  v0[10] = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[11] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_21BDC;
  return AppShortcutInvocation.getAppShortcuts(siriLanguage:provider:)(v5, v7, v4 + 144);
}

uint64_t sub_21BDC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_21CFC, 0, 0);
}

uint64_t sub_21CFC()
{
  if (qword_75DE8 != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v2 = sub_616D0();
  sub_6D40(v2, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_616C0();
  os_log_type_t v4 = sub_61960();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = v0[12];
  if (!v5)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_7;
  }
  uint64_t v1 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v1 = 134217984;
  if (v6 >> 62) {
    goto LABEL_41;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    swift_bridgeObjectRelease();
    v0[3] = v7;
    sub_619C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v3, v4, "auto shortcuts count: %ld", v1, 0xCu);
    swift_slowDealloc();

LABEL_7:
    if (v0[12] >> 62) {
      break;
    }
    uint64_t v3 = *(NSObject **)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_32;
    }
LABEL_9:
    if ((uint64_t)v3 >= 1)
    {
      uint64_t v8 = 0;
      unint64_t v9 = v6 & 0xC000000000000001;
      uint64_t v40 = v0[12] + 32;
      uint64_t v10 = _swiftEmptyArrayStorage;
      while (1)
      {
        if (v9) {
          uint64_t v11 = (uint8_t *)sub_61A90();
        }
        else {
          uint64_t v11 = (uint8_t *)*(id *)(v40 + 8 * v8);
        }
        uint64_t v1 = v11;
        id v12 = [(uint8_t *)v11 orderedPhrases];
        sub_2CDF4();
        unint64_t v13 = sub_61870();

        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = sub_61B60();
          swift_bridgeObjectRelease();
          if (!v23)
          {
LABEL_11:

            swift_bridgeObjectRelease();
            goto LABEL_12;
          }
        }
        else if (!*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)))
        {
          goto LABEL_11;
        }
        if ((v13 & 0xC000000000000001) != 0)
        {
          id v14 = (id)sub_61A90();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            goto LABEL_30;
          }
          id v14 = *(id *)(v13 + 32);
        }
        unint64_t v15 = v14;
        swift_bridgeObjectRelease();
        id v16 = [v15 localizedPhrase];

        uint64_t v17 = sub_617F0();
        uint64_t v19 = v18;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v10 = sub_5DB24(0, v10[2] + 1, 1, v10);
        }
        unint64_t v21 = v10[2];
        unint64_t v20 = v10[3];
        if (v21 >= v20 >> 1) {
          uint64_t v10 = sub_5DB24((void *)(v20 > 1), v21 + 1, 1, v10);
        }
        void v10[2] = v21 + 1;
        uint64_t v22 = &v10[2 * v21];
        v22[4] = v17;
        v22[5] = v19;
LABEL_12:
        if (v3 == ++v8) {
          goto LABEL_33;
        }
      }
    }
    __break(1u);
LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_61B60();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_61B60();
  if (v3) {
    goto LABEL_9;
  }
LABEL_32:
  uint64_t v10 = _swiftEmptyArrayStorage;
LABEL_33:
  v0[13] = v10;
  swift_bridgeObjectRelease_n();
  uint64_t v24 = sub_60AE0();
  uint64_t v26 = sub_3AC70(v24, v25);
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  v0[14] = v26;
  v0[15] = v28;
  uint64_t v29 = v0[5];
  if (v28)
  {
    uint64_t v30 = sub_6D90(&qword_76D28);
    uint64_t v31 = swift_task_alloc();
    v0[16] = v31;
    *(void *)(v31 + 16) = v10;
    *(void *)(v31 + 24) = v29;
    uint64_t v32 = sub_6D90(&qword_768D0);
    BOOL v33 = (void *)swift_task_alloc();
    v0[17] = v33;
    *BOOL v33 = v0;
    v33[1] = sub_22254;
    return withTaskGroup<A, B>(of:returning:isolation:body:)(v0 + 2, v30, v32, 0, 0, &unk_76D38, v31, v30);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = sub_60AE0();
    uint64_t v36 = v35;
    sub_2CE34();
    swift_allocError();
    *uint64_t v37 = v34;
    v37[1] = v36;
    swift_willThrow();
    swift_task_dealloc();
    unint64_t v38 = (uint64_t (*)(void))v0[1];
    return v38();
  }
}

uint64_t sub_22254()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_2236C, 0, 0);
}

uint64_t sub_2236C()
{
  uint64_t v1 = v0[5];
  swift_bridgeObjectRelease();
  uint64_t v2 = v0[2];
  v0[18] = v2;
  sub_6EA4((void *)(v1 + 24), *(void *)(v1 + 48));
  if (sub_606F0())
  {
    uint64_t v3 = v0[15];
    os_log_type_t v4 = (void *)swift_task_alloc();
    v0[19] = v4;
    *os_log_type_t v4 = v0;
    v4[1] = sub_22574;
    uint64_t v5 = v0[14];
    uint64_t v6 = v0[4];
    return sub_22958(v6, v5, v3, v2);
  }
  else
  {
    sub_6EA4((void *)(v0[5] + 24), *(void *)(v0[5] + 48));
    char v8 = sub_606E0();
    uint64_t v9 = v0[15];
    if (v8)
    {
      uint64_t v10 = (void *)swift_task_alloc();
      v0[20] = v10;
      void *v10 = v0;
      v10[1] = sub_226C0;
      uint64_t v11 = v0[14];
      uint64_t v12 = v0[4];
      return sub_22FF4(v12, v11, v9, v2);
    }
    else
    {
      unint64_t v13 = (void *)swift_task_alloc();
      v0[21] = v13;
      *unint64_t v13 = v0;
      v13[1] = sub_2280C;
      uint64_t v14 = v0[14];
      uint64_t v15 = v0[4];
      return sub_2431C(v15, v14, v9, v2);
    }
  }
}

uint64_t sub_22574()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_226C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2280C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  sub_6D90((uint64_t *)&unk_76560);
  v5[12] = swift_task_alloc();
  uint64_t v6 = sub_60940();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v7 = sub_60A40();
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return _swift_task_switch(sub_22AAC, 0, 0);
}

uint64_t sub_22AAC()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[2];
  if (v2)
  {
    uint64_t v4 = v1[4];
    uint64_t v3 = v1[5];
    swift_bridgeObjectRetain();
    if (v2 == 1)
    {
      uint64_t v2 = 0;
      uint64_t v5 = 0xE000000000000000;
    }
    else
    {
      uint64_t v2 = v1[6];
      uint64_t v5 = v1[7];
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0xE000000000000000;
    uint64_t v5 = 0xE000000000000000;
  }
  v0[19] = v3;
  v0[20] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[21] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_22BB8;
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[9];
  return sub_344F8(v7, v8, v9, v4, v3, v2, v5);
}

uint64_t sub_22BB8()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22CDC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_22D74;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_22CDC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22D74()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 136);
  uint64_t v14 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = *(uint64_t **)(v0 + 56);
  sub_60930();
  sub_6D90(&qword_768E0);
  uint64_t v7 = *(void *)(sub_60F40() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_625B0;
  sub_27B70(v9 + v8);
  sub_60910();
  sub_6EA4((void *)(v5 + 24), *(void *)(v5 + 48));
  sub_606D0();
  sub_60A10(1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v2, v15);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v15);
  uint64_t v10 = sub_60DC0();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v6[3] = v10;
  v6[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_838C(v6);
  sub_60890();
  sub_6EE8(v0 + 16, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_22FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[16] = a4;
  v5[17] = v4;
  v5[14] = a2;
  v5[15] = a3;
  v5[13] = a1;
  sub_6D90((uint64_t *)&unk_76560);
  v5[18] = swift_task_alloc();
  sub_60750();
  v5[19] = swift_task_alloc();
  uint64_t v6 = sub_60BC0();
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v7 = sub_60500();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v8 = sub_60870();
  v5[26] = v8;
  v5[27] = *(void *)(v8 - 8);
  v5[28] = swift_task_alloc();
  sub_6D90(&qword_76D00);
  v5[29] = swift_task_alloc();
  uint64_t v9 = sub_60940();
  v5[30] = v9;
  v5[31] = *(void *)(v9 - 8);
  v5[32] = swift_task_alloc();
  uint64_t v10 = sub_60A40();
  v5[33] = v10;
  v5[34] = *(void *)(v10 - 8);
  v5[35] = swift_task_alloc();
  return _swift_task_switch(sub_232B8, 0, 0);
}

uint64_t sub_232B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[36] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23358;
  uint64_t v2 = v0[35];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  return sub_33D00(v2, v3, v4);
}

uint64_t sub_23358()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_2D53C, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 304) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_234C4;
    return sub_25DC4();
  }
}

uint64_t sub_234C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[39] = a1;
  v6[40] = a2;
  v6[41] = a3;
  v6[42] = a4;
  v6[43] = v4;
  swift_task_dealloc();
  if (v4) {
    uint64_t v7 = sub_2D534;
  }
  else {
    uint64_t v7 = sub_235E0;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_235E0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 128) + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2367C;
  return sub_263B8(v1);
}

uint64_t sub_2367C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[45] = a1;
  v4[46] = a2;
  v4[47] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_2D538;
  }
  else
  {
    uint64_t v5 = sub_237A8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_237A8()
{
  uint64_t v1 = v0[17];
  v0[48] = sub_60AE0();
  v0[49] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_60930();
  sub_6D90(&qword_768E0);
  uint64_t v3 = *(void *)(sub_60F40() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_625B0;
  sub_28608(v5 + v4);
  sub_60910();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *sub_6EA4((void *)(v1 + 272), *(void *)(v1 + 296));
  uint64_t v11 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t))((char *)&dword_76FA0 + dword_76FA0);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[50] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_23990;
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[15];
  return v11(0, v6, v8, v9);
}

uint64_t sub_23990(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 408) = a1;
  *(void *)(v3 + 416) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    unint64_t v4 = sub_2D550;
  }
  else {
    unint64_t v4 = sub_23ACC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_23ACC()
{
  uint64_t v1 = sub_60A30();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_60A70();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(*(void *)(v0 + 232), v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v8 = *(void *)(v0 + 232);
  if (v7 == 1)
  {
    sub_6EE8(*(void *)(v0 + 232), &qword_76D00);
    uint64_t v9 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 216);
    uint64_t v11 = *(void *)(v0 + 224);
    uint64_t v13 = *(void *)(v0 + 208);
    sub_60A60();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
    uint64_t v9 = sub_60860();
    unint64_t v10 = v14;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  *(void *)(v0 + 424) = v10;
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v15 = *(void *)(v0 + 392);
  long long v17 = *(_OWORD *)(v0 + 312);
  *(void *)(v0 + 16) = *(void *)(v0 + 128);
  uint64_t v19 = *(void *)(v0 + 328);
  uint64_t v18 = *(void *)(v0 + 336);
  *(_OWORD *)(v0 + 24) = v17;
  *(void *)(v0 + 40) = v19;
  *(void *)(v0 + 48) = v18;
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 360);
  *(void *)(v0 + 72) = v9;
  *(void *)(v0 + 80) = v10;
  *(void *)(v0 + 88) = v16;
  *(void *)(v0 + 96) = v15;
  swift_bridgeObjectRetain();
  unint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v20;
  *unint64_t v20 = v0;
  v20[1] = sub_23CFC;
  uint64_t v21 = *(void *)(v0 + 200);
  return sub_2E61C(v21);
}

uint64_t sub_23CFC()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2D530;
  }
  else {
    uint64_t v2 = sub_23E10;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_23E10()
{
  uint64_t v1 = *(void *)(v0 + 440);
  sub_2D1B8(&qword_76D08, (void (*)(uint64_t))&type metadata accessor for Response);
  uint64_t v2 = sub_60470();
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v0 + 272);
    uint64_t v4 = *(void *)(v0 + 280);
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v8 = *(void *)(v0 + 240);
    uint64_t v9 = *(void *)(v0 + 248);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    uint64_t v12 = v2;
    unint64_t v13 = v3;
    id v21 = *(id *)(v0 + 408);
    uint64_t v14 = *(void *)(v0 + 248);
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v22 = *(void *)(v0 + 240);
    uint64_t v15 = *(void *)(v0 + 144);
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class isa = sub_602C0().super.isa;
    sub_2CD8C(v12, v13);
    [v21 setVisual:isa];

    sub_60720();
    sub_60B90();
    sub_60A10(1);
    sub_60BB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v23, v22);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v22);
    sub_60BA0();
    sub_60960();
    swift_allocObject();
    *(void *)(v0 + 448) = sub_60950();
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)
                                                            + async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(patternExecutionResult:outputGenerationManifest:));
    long long v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 456) = v17;
    *long long v17 = v0;
    v17[1] = sub_241E8;
    uint64_t v18 = *(void *)(v0 + 408);
    uint64_t v19 = *(void *)(v0 + 176);
    uint64_t v20 = *(void *)(v0 + 104);
    return v24(v20, v18, v19);
  }
}

uint64_t sub_241E8()
{
  *(void *)(*(void *)v1 + 464) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_2D540;
  }
  else {
    uint64_t v2 = sub_2D548;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2431C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[16] = a4;
  v5[17] = v4;
  v5[14] = a2;
  v5[15] = a3;
  v5[13] = a1;
  sub_6D90((uint64_t *)&unk_76560);
  v5[18] = swift_task_alloc();
  sub_60750();
  v5[19] = swift_task_alloc();
  uint64_t v6 = sub_60BC0();
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v7 = sub_60500();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v8 = sub_60870();
  v5[26] = v8;
  v5[27] = *(void *)(v8 - 8);
  v5[28] = swift_task_alloc();
  sub_6D90(&qword_76D00);
  v5[29] = swift_task_alloc();
  uint64_t v9 = sub_60940();
  v5[30] = v9;
  v5[31] = *(void *)(v9 - 8);
  v5[32] = swift_task_alloc();
  uint64_t v10 = sub_60A40();
  v5[33] = v10;
  v5[34] = *(void *)(v10 - 8);
  v5[35] = swift_task_alloc();
  return _swift_task_switch(sub_245E0, 0, 0);
}

uint64_t sub_245E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[36] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24680;
  uint64_t v2 = v0[35];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  return sub_33D00(v2, v3, v4);
}

uint64_t sub_24680()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_24908, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 304) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_247EC;
    return sub_25DC4();
  }
}

uint64_t sub_247EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[39] = a1;
  v6[40] = a2;
  v6[41] = a3;
  v6[42] = a4;
  v6[43] = v4;
  swift_task_dealloc();
  if (v4) {
    uint64_t v7 = sub_25AD0;
  }
  else {
    uint64_t v7 = sub_249D0;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_24908()
{
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

uint64_t sub_249D0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 128) + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24A6C;
  return sub_263B8(v1);
}

uint64_t sub_24A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[45] = a1;
  v4[46] = a2;
  v4[47] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_25BB0;
  }
  else
  {
    uint64_t v5 = sub_24B98;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_24B98()
{
  uint64_t v1 = v0[17];
  v0[48] = sub_60AE0();
  v0[49] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_60930();
  sub_6D90(&qword_768E0);
  uint64_t v3 = *(void *)(sub_60F40() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_625B0;
  sub_28608(v5 + v4);
  sub_60910();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *sub_6EA4((void *)(v1 + 272), *(void *)(v1 + 296));
  uint64_t v11 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t))((char *)&dword_76FA0 + dword_76FA0);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[50] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24D80;
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[15];
  return v11(0, v6, v8, v9);
}

uint64_t sub_24D80(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 408) = a1;
  *(void *)(v3 + 416) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    unint64_t v4 = sub_250EC;
  }
  else {
    unint64_t v4 = sub_24EBC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_24EBC()
{
  uint64_t v1 = sub_60A30();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_60A70();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(*(void *)(v0 + 232), v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v8 = *(void *)(v0 + 232);
  if (v7 == 1)
  {
    sub_6EE8(*(void *)(v0 + 232), &qword_76D00);
    uint64_t v9 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 216);
    uint64_t v11 = *(void *)(v0 + 224);
    uint64_t v13 = *(void *)(v0 + 208);
    sub_60A60();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
    uint64_t v9 = sub_60860();
    unint64_t v10 = v14;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  *(void *)(v0 + 424) = v10;
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v15 = *(void *)(v0 + 392);
  long long v17 = *(_OWORD *)(v0 + 312);
  *(void *)(v0 + 16) = *(void *)(v0 + 128);
  uint64_t v19 = *(void *)(v0 + 328);
  uint64_t v18 = *(void *)(v0 + 336);
  *(_OWORD *)(v0 + 24) = v17;
  *(void *)(v0 + 40) = v19;
  *(void *)(v0 + 48) = v18;
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 360);
  *(void *)(v0 + 72) = v9;
  *(void *)(v0 + 80) = v10;
  *(void *)(v0 + 88) = v16;
  *(void *)(v0 + 96) = v15;
  swift_bridgeObjectRetain();
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_25224;
  uint64_t v21 = *(void *)(v0 + 200);
  return sub_2D554(v21);
}

uint64_t sub_250EC()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v4 = v0[32];
  uint64_t v3 = v0[33];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[31];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25224()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25710;
  }
  else {
    uint64_t v2 = sub_25338;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_25338()
{
  uint64_t v1 = *(void *)(v0 + 440);
  sub_2D1B8(&qword_76D08, (void (*)(uint64_t))&type metadata accessor for Response);
  uint64_t v2 = sub_60470();
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v0 + 272);
    uint64_t v4 = *(void *)(v0 + 280);
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v8 = *(void *)(v0 + 240);
    uint64_t v9 = *(void *)(v0 + 248);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    uint64_t v12 = v2;
    unint64_t v13 = v3;
    id v21 = *(id *)(v0 + 408);
    uint64_t v14 = *(void *)(v0 + 248);
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v22 = *(void *)(v0 + 240);
    uint64_t v15 = *(void *)(v0 + 144);
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class isa = sub_602C0().super.isa;
    sub_2CD8C(v12, v13);
    [v21 setVisual:isa];

    sub_60720();
    sub_60B90();
    sub_60A10(1);
    sub_60BB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v23, v22);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v22);
    sub_60BA0();
    sub_60960();
    swift_allocObject();
    *(void *)(v0 + 448) = sub_60950();
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)
                                                            + async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(patternExecutionResult:outputGenerationManifest:));
    long long v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 456) = v17;
    *long long v17 = v0;
    v17[1] = sub_25860;
    uint64_t v18 = *(void *)(v0 + 408);
    uint64_t v19 = *(void *)(v0 + 176);
    uint64_t v20 = *(void *)(v0 + 104);
    return v24(v20, v18, v19);
  }
}

uint64_t sub_25710()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_25860()
{
  *(void *)(*(void *)v1 + 464) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_25C90;
  }
  else {
    uint64_t v2 = sub_25994;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_25994()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v8 = *(void *)(v0 + 176);
  uint64_t v9 = *(void *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_25AD0()
{
  (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25BB0()
{
  (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25C90()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v8 = *(void *)(v0 + 168);
  uint64_t v7 = *(void *)(v0 + 176);
  uint64_t v9 = *(void *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_25DC4()
{
  v1[2] = v0;
  uint64_t v2 = sub_60870();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_60A70();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v4 = sub_60A40();
  v1[9] = v4;
  v1[10] = *(void *)(v4 - 8);
  v1[11] = swift_task_alloc();
  return _swift_task_switch(sub_25F3C, 0, 0);
}

uint64_t sub_25F3C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25FD8;
  uint64_t v2 = *(void *)(v0 + 88);
  return sub_340F8(v2);
}

uint64_t sub_25FD8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2633C;
  }
  else {
    uint64_t v2 = sub_260EC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_260EC()
{
  uint64_t v1 = *(void *)(sub_60A30() + 16);
  swift_bridgeObjectRelease();
  if (v1 != 2)
  {
    uint64_t v20 = 0;
    uint64_t v16 = 0;
    unint64_t v21 = 0xE000000000000000;
    unint64_t v18 = 0xE000000000000000;
    goto LABEL_6;
  }
  uint64_t result = sub_60A30();
  if (!*(void *)(result + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v6 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v7 = v0[3];
  uint64_t v8 = v0[4];
  unint64_t v24 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
  v26(v3, result + v24, v5);
  swift_bridgeObjectRelease();
  sub_60A60();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v25(v3, v5);
  uint64_t v9 = sub_60860();
  unint64_t v27 = v10;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v6, v7);
  uint64_t result = sub_60A30();
  if (*(void *)(result + 16) < 2uLL)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v12 = v0[8];
  uint64_t v14 = v0[5];
  uint64_t v13 = v0[6];
  uint64_t v23 = v9;
  uint64_t v15 = v0[3];
  v26(v12, result + v24 + *(void *)(v0[7] + 72), v13);
  swift_bridgeObjectRelease();
  sub_60A60();
  v25(v12, v13);
  uint64_t v16 = sub_60860();
  unint64_t v18 = v17;
  uint64_t v19 = v15;
  uint64_t v20 = v23;
  v11(v14, v19);
  unint64_t v21 = v27;
LABEL_6:
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))v0[1];
  return v22(v20, v21, v16, v18);
}

uint64_t sub_2633C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_263B8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_60870();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_6D90(&qword_76D00);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_60A40();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return _swift_task_switch(sub_26504, 0, 0);
}

uint64_t sub_26504()
{
  uint64_t v1 = v0[2];
  if (v1 < 4)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void, void))v0[1];
    return v6(0, 0);
  }
  else
  {
    double v2 = (double)(v1 - 3);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[11] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2661C;
    uint64_t v4 = v0[10];
    return sub_349D0(v4, v2);
  }
}

uint64_t sub_2661C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    double v2 = sub_2694C;
  }
  else {
    double v2 = sub_26730;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_26730()
{
  uint64_t v1 = sub_60A30();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_60A70();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v0[7], v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[7];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v9 = v0[9];
  uint64_t v8 = v0[10];
  uint64_t v10 = v0[7];
  uint64_t v11 = v0[8];
  if (v7 == 1)
  {
    (*(void (**)(void, void))(v9 + 8))(v0[10], v0[8]);
    sub_6EE8(v10, &qword_76D00);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v15 = v0[5];
    uint64_t v14 = v0[6];
    uint64_t v16 = v0[4];
    sub_60A60();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v10, v3);
    uint64_t v12 = sub_60860();
    uint64_t v13 = v17;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v18(v12, v13);
}

uint64_t sub_2694C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_269C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = &type metadata for String;
  v4[0] = a2;
  v4[1] = a3;
  swift_bridgeObjectRetain();
  return sub_26A18((uint64_t)v4, 7368801, 0xE300000000000000);
}

uint64_t sub_26A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_2CDE4((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2BBF4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_6EE8(a1, &qword_76D10);
    sub_2B918(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_6EE8((uint64_t)v9, &qword_76D10);
  }
}

uint64_t sub_26AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a3;
  v4[14] = a4;
  v4[11] = a1;
  v4[12] = a2;
  uint64_t v5 = sub_60870();
  v4[15] = v5;
  v4[16] = *(void *)(v5 - 8);
  v4[17] = swift_task_alloc();
  sub_6D90(&qword_76D00);
  v4[18] = swift_task_alloc();
  uint64_t v6 = sub_6D90(&qword_76D28);
  v4[19] = v6;
  v4[20] = *(void *)(v6 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v7 = sub_60A40();
  v4[22] = v7;
  v4[23] = *(void *)(v7 - 8);
  v4[24] = swift_task_alloc();
  sub_6D90(&qword_76D40);
  v4[25] = swift_task_alloc();
  uint64_t v8 = sub_6D90(&qword_76D48);
  v4[26] = v8;
  v4[27] = *(void *)(v8 - 8);
  v4[28] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76920);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  return _swift_task_switch(sub_26D70, 0, 0);
}

uint64_t sub_26D70()
{
  uint64_t v1 = v0[13];
  uint64_t v35 = *(void *)(v1 + 16);
  if (v35)
  {
    uint64_t v30 = v0 + 2;
    uint64_t v34 = sub_61910();
    uint64_t v2 = *(void *)(v34 - 8);
    BOOL v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
    uint64_t v32 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
    uint64_t v29 = (void (**)(uint64_t, uint64_t))(v2 + 8);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = (void *)(v1 + 40);
    uint64_t v5 = (uint64_t *)&unk_76920;
    uint64_t v31 = v0;
    while (1)
    {
      uint64_t v8 = v0[29];
      uint64_t v7 = v0[30];
      uint64_t v9 = v0[14];
      uint64_t v10 = v5;
      uint64_t v11 = v3;
      uint64_t v36 = v4;
      uint64_t v13 = *(v4 - 1);
      uint64_t v12 = *v4;
      v33(v7, 1, 1, v34);
      uint64_t v14 = (void *)swift_allocObject();
      v14[2] = 0;
      uint64_t v15 = v14 + 2;
      v14[3] = 0;
      v14[4] = v9;
      v14[5] = v13;
      v14[6] = v12;
      uint64_t v16 = v11;
      uint64_t v5 = v10;
      uint64_t v0 = v31;
      v14[7] = v16;
      sub_1DB7C(v7, v8, v5);
      LODWORD(v8) = (*v32)(v8, 1, v34);
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v17 = v31[29];
      if (v8 == 1)
      {
        sub_6EE8(v31[29], v5);
        if (!*v15) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_61900();
        (*v29)(v17, v34);
        if (!*v15)
        {
LABEL_8:
          uint64_t v18 = 0;
          uint64_t v20 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v18 = sub_618C0();
      uint64_t v20 = v19;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v21 = *(void *)v31[12];
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = &unk_76D60;
      *(void *)(v22 + 24) = v14;
      uint64_t v23 = (void *)(v20 | v18);
      if (v20 | v18)
      {
        uint64_t v23 = v30;
        *uint64_t v30 = 0;
        v30[1] = 0;
        v31[4] = v18;
        v31[5] = v20;
      }
      uint64_t v3 = v16 + 1;
      uint64_t v6 = v31[30];
      v31[6] = 1;
      v31[7] = v23;
      v31[8] = v21;
      swift_task_create();
      swift_release();
      sub_6EE8(v6, v5);
      uint64_t v4 = v36 + 2;
      if (v35 == v3)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  unint64_t v24 = sub_3D930(_swiftEmptyArrayStorage);
  sub_618D0();
  v0[31] = v24;
  uint64_t v25 = (void *)swift_task_alloc();
  v0[32] = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_270E0;
  uint64_t v26 = v0[25];
  uint64_t v27 = v0[26];
  return TaskGroup.Iterator.next(isolation:)(v26, 0, 0, v27);
}

uint64_t sub_270E0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_271DC, 0, 0);
}

uint64_t sub_271DC()
{
  os_log_type_t v43 = v0;
  uint64_t v1 = v0[25];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[20] + 48))(v1, 1, v0[19]) == 1)
  {
    uint64_t v2 = v0[31];
    (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_2B820(v2);
    swift_bridgeObjectRelease();
    uint64_t v42 = v3;
    sub_2BDB4(&v42);
    uint64_t v13 = (void *)v0[11];
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_1E994((uint64_t)v42);
    swift_release();
    swift_bridgeObjectRelease();
    *uint64_t v13 = v14;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  uint64_t v4 = v0[21];
  sub_2D2C8(v1, v4, &qword_76D28);
  uint64_t v5 = sub_6D90(&qword_76D70);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1)
  {
    sub_6EE8(v0[21], &qword_76D28);
    goto LABEL_28;
  }
  uint64_t v6 = (uint64_t *)v0[21];
  uint64_t v7 = *v6;
  (*(void (**)(void, char *, void))(v0[23] + 32))(v0[24], (char *)v6 + *(int *)(v5 + 48), v0[22]);
  uint64_t v8 = sub_60A30();
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = sub_60A70();
  uint64_t v11 = *(void *)(v10 - 8);
  if (v9)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v0[18], v8+ ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80)), v10);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v17 = v0[18];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v17, v12, 1, v10);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v17, 1, v10) == 1)
  {
    sub_6EE8(v0[18], &qword_76D00);
    uint64_t v18 = (void *)v0[31];
LABEL_27:
    (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
    v0[31] = v18;
LABEL_28:
    uint64_t v41 = (void *)swift_task_alloc();
    v0[32] = v41;
    *uint64_t v41 = v0;
    v41[1] = sub_270E0;
    unint64_t v28 = v0[25];
    uint64_t v31 = v0[26];
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    return TaskGroup.Iterator.next(isolation:)(v28, v29, v30, v31);
  }
  uint64_t v19 = (void *)v0[31];
  uint64_t v21 = v0[17];
  uint64_t v20 = v0[18];
  uint64_t v22 = v0[15];
  uint64_t v23 = v0[16];
  sub_60A60();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v20, v10);
  uint64_t v24 = sub_60860();
  uint64_t v26 = v25;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v0[10] = v19;
  unint64_t v28 = sub_3C960(v7);
  uint64_t v32 = v19[2];
  BOOL v33 = (v29 & 1) == 0;
  BOOL v34 = __OFADD__(v32, v33);
  uint64_t v35 = v32 + v33;
  if (v34)
  {
    __break(1u);
    goto LABEL_23;
  }
  LOBYTE(v21) = v29;
  uint64_t v19 = v0 + 10;
  if (*(void *)(v0[31] + 24) >= v35)
  {
    if (isUniquelyReferenced_nonNull_native)
    {
LABEL_20:
      uint64_t v18 = (void *)*v19;
      if (v21)
      {
LABEL_21:
        uint64_t v36 = (uint64_t *)(v18[7] + 16 * v28);
        swift_bridgeObjectRelease();
        *uint64_t v36 = v24;
        v36[1] = v26;
LABEL_26:
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
LABEL_24:
      v18[(v28 >> 6) + 8] |= 1 << v28;
      *(void *)(v18[6] + 8 * v28) = v7;
      unint64_t v38 = (uint64_t *)(v18[7] + 16 * v28);
      *unint64_t v38 = v24;
      v38[1] = v26;
      uint64_t v39 = v18[2];
      BOOL v34 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v34)
      {
        __break(1u);
        return TaskGroup.Iterator.next(isolation:)(v28, v29, v30, v31);
      }
      v18[2] = v40;
      goto LABEL_26;
    }
LABEL_23:
    unint64_t v37 = v28;
    sub_39F18();
    unint64_t v28 = v37;
    uint64_t v18 = (void *)*v19;
    if (v21) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
  sub_39A78(v35, isUniquelyReferenced_nonNull_native);
  unint64_t v28 = sub_3C960(v7);
  if ((v21 & 1) == (v29 & 1)) {
    goto LABEL_20;
  }
  return sub_61CD0();
}

uint64_t sub_2775C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  uint64_t v8 = sub_60A40();
  v7[7] = v8;
  v7[8] = *(void *)(v8 - 8);
  v7[9] = swift_task_alloc();
  return _swift_task_switch(sub_27824, 0, 0);
}

uint64_t sub_27824()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_278C4;
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  return sub_34E28(v2, v3, v4);
}

uint64_t sub_278C4()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_27AC0;
  }
  else {
    uint64_t v2 = sub_279D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_279D8()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = (void *)v0[2];
  uint64_t v6 = sub_6D90(&qword_76D70);
  uint64_t v7 = (char *)v5 + *(int *)(v6 + 48);
  void *v5 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v7, v1, v3);
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_27AC0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRelease();
  uint64_t v2 = sub_6D90(&qword_76D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_27B70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v68 = sub_60DE0();
  uint64_t v67 = *(void *)(v68 - 8);
  uint64_t v2 = __chkstk_darwin(v68, v1);
  uint64_t v65 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v60 - v5;
  uint64_t v7 = sub_60E40();
  uint64_t v72 = *(void *)(v7 - 8);
  uint64_t v73 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v66 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v60 - v12;
  uint64_t v77 = sub_60EC0();
  uint64_t v71 = *(void *)(v77 - 8);
  uint64_t v15 = __chkstk_darwin(v77, v14);
  uint64_t v64 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v60 - v18;
  uint64_t v76 = sub_60FA0();
  uint64_t v70 = *(void *)(v76 - 8);
  uint64_t v21 = __chkstk_darwin(v76, v20);
  uint64_t v63 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v23);
  uint64_t v25 = (char *)&v60 - v24;
  uint64_t v26 = sub_6D90(&qword_76878);
  __chkstk_darwin(v26 - 8, v27);
  uint64_t v29 = (char *)&v60 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_60F40();
  uint64_t v74 = *(void *)(v30 - 8);
  uint64_t v75 = v30;
  __chkstk_darwin(v30, v31);
  BOOL v33 = (char *)&v60 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_60F30();
  sub_612A0();
  swift_allocObject();
  uint64_t v34 = sub_61290();
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_62660;
  *(void *)(v35 + 32) = v34;
  v79[0] = v35;
  sub_61880();
  swift_retain();
  sub_610E0();
  uint64_t v36 = sub_610F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v29, 0, 1, v36);
  sub_610D0();
  swift_bridgeObjectRelease();
  sub_6EE8((uint64_t)v29, &qword_76878);
  unint64_t v37 = v25;
  sub_60F90();
  unint64_t v38 = v19;
  sub_60EB0();
  uint64_t v39 = v13;
  sub_60E30();
  sub_61020();
  int v78 = v33;
  uint64_t v40 = v67;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  char v61 = v6;
  v41(v65, v6, v68);
  os_log_type_t v62 = v37;
  sub_60F80();
  uint64_t v42 = v70;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v63, v37, v76);
  os_log_type_t v43 = v38;
  int v60 = v38;
  sub_60E90();
  uint64_t v44 = v71;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v64, v43, v77);
  sub_60E20();
  uint64_t v46 = v72;
  uint64_t v45 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v66, v39, v73);
  sub_60F20();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v61, v68);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v45);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v60, v77);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v62, v76);
  uint64_t v48 = v74;
  uint64_t v47 = v75;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_616D0();
  sub_6D40(v49, (uint64_t)qword_7A9C8);
  BOOL v50 = sub_616C0();
  os_log_type_t v51 = sub_61960();
  BOOL v52 = os_log_type_enabled(v50, v51);
  uint64_t v53 = v78;
  if (v52)
  {
    uint64_t v54 = swift_slowAlloc();
    v80[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315394;
    v79[0] = sub_316A4(0xD000000000000029, 0x80000000000645D0, v80);
    sub_619C0();
    *(_WORD *)(v54 + 12) = 2080;
    sub_60FF0();
    swift_beginAccess();
    v79[3] = v47;
    v79[4] = sub_2D1B8((unint64_t *)&unk_78340, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
    uint64_t v55 = sub_838C(v79);
    (*(void (**)(uint64_t *, char *, uint64_t))(v48 + 16))(v55, v53, v47);
    uint64_t v56 = sub_60FE0();
    unint64_t v58 = v57;
    sub_63E8((uint64_t)v79);
    v79[0] = sub_316A4(v56, v58, v80);
    sub_619C0();
    uint64_t v53 = v78;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v50, v51, "%s paraphrase systemDialogAct: %s", (uint8_t *)v54, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v69, v53, v47);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v53, v47);
}

uint64_t sub_28608@<X0>(uint64_t a1@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v1 = sub_60F70();
  uint64_t v65 = *(void *)(v1 - 8);
  uint64_t v66 = v1;
  uint64_t v3 = __chkstk_darwin(v1, v2);
  uint64_t v64 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v5);
  uint64_t v67 = (char *)&v61 - v6;
  uint64_t v7 = sub_60EC0();
  uint64_t v68 = *(void *)(v7 - 8);
  uint64_t v69 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v70 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  uint64_t v73 = (char *)&v61 - v12;
  uint64_t v13 = sub_60F00();
  uint64_t v72 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13, v14);
  uint64_t v71 = (uint64_t)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)&v61 - v19;
  __chkstk_darwin(v18, v21);
  uint64_t v23 = (char *)&v61 - v22;
  uint64_t v75 = sub_60F40();
  uint64_t v24 = *(void *)(v75 - 8);
  __chkstk_darwin(v75, v25);
  uint64_t v27 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_60F30();
  if (qword_75D88 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_2CBF4();
  if (qword_75D90 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_2CBF4();
  sub_29010(v28, (uint64_t)v23);
  uint64_t v63 = v24;
  sub_60EB0();
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
  v30(v20, v23, v13);
  sub_60E80();
  uint64_t v31 = v23;
  uint64_t v32 = v71;
  sub_29010(v29, v71);
  os_log_type_t v62 = v31;
  sub_60EB0();
  v30(v20, (char *)v32, v13);
  sub_60E80();
  sub_60F60();
  sub_6D90(&qword_76CF8);
  uint64_t v61 = v13;
  uint64_t v33 = v68;
  uint64_t v34 = *(void *)(v68 + 72);
  unint64_t v35 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_62540;
  unint64_t v37 = v36 + v35;
  unint64_t v38 = *(void (**)(unint64_t, char *, uint64_t))(v33 + 16);
  uint64_t v39 = v69;
  v38(v37, v73, v69);
  v38(v37 + v34, v70, v39);
  uint64_t v40 = v67;
  sub_60F50();
  uint64_t v42 = v65;
  uint64_t v41 = v66;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v64, v40, v66);
  sub_60F10();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  os_log_type_t v43 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v44 = v39;
  v43(v70, v39);
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
  uint64_t v46 = v61;
  v45(v71, v61);
  v43(v73, v44);
  v45((uint64_t)v62, v46);
  uint64_t v47 = v75;
  uint64_t v48 = v63;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_616D0();
  sub_6D40(v49, (uint64_t)qword_7A9C8);
  BOOL v50 = sub_616C0();
  os_log_type_t v51 = sub_61960();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = swift_slowAlloc();
    v77[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 136315394;
    v76[0] = sub_316A4(0xD00000000000003ELL, 0x8000000000064570, v77);
    sub_619C0();
    *(_WORD *)(v52 + 12) = 2080;
    sub_60FF0();
    swift_beginAccess();
    v76[3] = v47;
    v76[4] = sub_2D1B8((unint64_t *)&unk_78340, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
    uint64_t v53 = sub_838C(v76);
    (*(void (**)(uint64_t *, char *, uint64_t))(v48 + 16))(v53, v27, v47);
    uint64_t v54 = sub_60FE0();
    uint64_t v55 = v27;
    uint64_t v56 = v48;
    unint64_t v58 = v57;
    sub_63E8((uint64_t)v76);
    v76[0] = sub_316A4(v54, v58, v77);
    sub_619C0();
    uint64_t v48 = v56;
    uint64_t v27 = v55;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v50, v51, "%s paraphrase systemDialogAct: %s", (uint8_t *)v52, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v59 = v74;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v59, v27, v47);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v27, v47);
}

uint64_t sub_29010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_60DE0();
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v7 = sub_6D90(&qword_76878);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_62660;
  *(void *)(v11 + 32) = a1;
  v15[1] = v11;
  sub_61880();
  swift_retain();
  sub_610E0();
  uint64_t v12 = sub_610F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  sub_610D0();
  swift_bridgeObjectRelease();
  sub_6EE8((uint64_t)v10, &qword_76878);
  sub_60EF0();
  sub_61020();
  if (v2)
  {
    uint64_t v13 = sub_60F00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
  }
  else
  {
    sub_60EE0();
  }
  return swift_release();
}

uint64_t sub_2920C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v48 = a1;
  uint64_t v49 = a4;
  uint64_t v5 = sub_60D10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_60C90();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_60DA0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = a2;
  sub_607B0();
  sub_60C80();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v9, v5) == enum case for Parse.uso(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v9, v5);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v9, v15);
    BOOL v20 = sub_60D60();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    BOOL v20 = 0;
  }
  uint64_t v21 = sub_60CD0();
  uint64_t v23 = v22;
  uint64_t v24 = (void *)sub_60660();
  id v25 = [v24 identifier];

  uint64_t v26 = sub_617F0();
  uint64_t v28 = v27;

  if (v21 == v26 && v23 == v28)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  char v29 = sub_61CA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_8:
    uint64_t v30 = sub_607D0();
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
    if (v20) {
      uint64_t v33 = v46;
    }
    else {
      uint64_t v33 = v47;
    }
    goto LABEL_11;
  }
  uint64_t v36 = sub_60CD0();
  uint64_t v38 = v37;
  uint64_t v39 = (void *)sub_60650();
  id v40 = [v39 identifier];

  uint64_t v41 = sub_617F0();
  uint64_t v43 = v42;

  if (v36 == v41 && v38 == v43)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v44 = sub_61CA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v44 & 1) == 0)
    {
      uint64_t v45 = sub_607D0();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v49, 1, 1, v45);
    }
  }
  uint64_t v30 = sub_607D0();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  if (v20) {
    uint64_t v33 = v47;
  }
  else {
    uint64_t v33 = v46;
  }
LABEL_11:
  uint64_t v34 = v49;
  v32(v49, v33, v30);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v34, 0, 1, v30);
}

uint64_t sub_29708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v120 = a3;
  uint64_t v125 = a2;
  uint64_t v127 = a4;
  uint64_t v119 = sub_615D0();
  uint64_t v102 = *(void *)(v119 - 8);
  __chkstk_darwin(v119, v5);
  v118 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_60FD0();
  uint64_t v103 = *(void *)(v126 - 8);
  __chkstk_darwin(v126, v7);
  uint64_t v128 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_60DE0();
  uint64_t v108 = *(void *)(v109 - 8);
  __chkstk_darwin(v109, v9);
  uint64_t v107 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_60F00();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106, v11);
  uint64_t v104 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_60D10();
  unint64_t v123 = *(void *)(v13 - 8);
  uint64_t v124 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_60C90();
  uint64_t v121 = *(void *)(v17 - 8);
  uint64_t v122 = (char *)v17;
  __chkstk_darwin(v17, v18);
  BOOL v20 = (char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_60DA0();
  uint64_t v116 = *(void *)(v21 - 8);
  uint64_t v117 = (void (*)(void, void))v21;
  __chkstk_darwin(v21, v22);
  uint64_t v115 = (char *)&v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_6D90(&qword_76CF0);
  uint64_t v26 = __chkstk_darwin(v24 - 8, v25);
  uint64_t v112 = (char *)&v100 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26, v28);
  uint64_t v30 = (char *)&v100 - v29;
  uint64_t v31 = sub_60E10();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v34 = __chkstk_darwin(v31, v33);
  v111 = (char *)&v100 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34, v36);
  uint64_t v38 = (char *)&v100 - v37;
  uint64_t v39 = sub_60EC0();
  uint64_t v40 = *(void *)(v39 - 8);
  __chkstk_darwin(v39, v41);
  uint64_t v43 = (char *)&v100 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = a1;
  sub_60D90();
  sub_60DF0();
  uint64_t v44 = v40;
  uint64_t v110 = *(void (**)(char *, uint64_t))(v32 + 8);
  v110(v38, v31);
  uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
  if (v45(v30, 1, v39) == 1)
  {
    sub_6EE8((uint64_t)v30, &qword_76CF0);
LABEL_3:
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_616D0();
    sub_6D40(v46, (uint64_t)qword_7A9C8);
    uint64_t v47 = sub_616C0();
    os_log_type_t v48 = sub_61970();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v130 = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 136315138;
      uint64_t v129 = sub_316A4(0xD000000000000028, 0x8000000000064520, &v130);
      sub_619C0();
      _os_log_impl(&dword_0, v47, v48, "%s could not resolve App Shortcut Ambiguous First Run response from USO parse", v49, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v50 = v127;
    uint64_t v51 = sub_607D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 1, 1, v51);
  }
  uint64_t v101 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v45;
  uint64_t v114 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v30, v39);
  uint64_t v53 = v125;
  sub_607B0();
  sub_60C80();
  (*(void (**)(char *, char *))(v121 + 8))(v20, v122);
  unint64_t v55 = v123;
  uint64_t v54 = v124;
  uint64_t v56 = v53;
  if ((*(unsigned int (**)(char *, uint64_t))(v123 + 88))(v16, v124) == enum case for Parse.uso(_:))
  {
    (*(void (**)(char *, uint64_t))(v55 + 96))(v16, v54);
    unint64_t v57 = v115;
    uint64_t v58 = v116;
    uint64_t v59 = v117;
    (*(void (**)(char *, char *, void (*)(void, void)))(v116 + 32))(v115, v16, v117);
    BOOL v60 = sub_60D60();
    (*(void (**)(char *, void))(v58 + 8))(v57, v59);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v54);
    BOOL v60 = 0;
  }
  if (sub_60E50())
  {
    (*(void (**)(char *, uint64_t))(v114 + 8))(v43, v39);
    uint64_t v61 = sub_607D0();
    uint64_t v62 = *(void *)(v61 - 8);
    uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
    if (v60) {
      uint64_t v64 = v56;
    }
    else {
      uint64_t v64 = v120;
    }
    goto LABEL_19;
  }
  if (sub_60E60())
  {
    (*(void (**)(char *, uint64_t))(v114 + 8))(v43, v39);
    uint64_t v61 = sub_607D0();
    uint64_t v62 = *(void *)(v61 - 8);
    uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
    if (v60) {
      uint64_t v64 = v120;
    }
    else {
      uint64_t v64 = v56;
    }
    goto LABEL_19;
  }
  uint64_t v122 = v43;
  uint64_t v66 = v111;
  sub_60D90();
  uint64_t v67 = sub_60E00();
  v110(v66, v31);
  if (*(void *)(v67 + 16))
  {
    uint64_t v68 = v114;
    uint64_t v69 = (uint64_t)v112;
    (*(void (**)(char *, unint64_t, uint64_t))(v114 + 16))(v112, v67 + ((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80)), v39);
    uint64_t v70 = 0;
  }
  else
  {
    uint64_t v70 = 1;
    uint64_t v68 = v114;
    uint64_t v69 = (uint64_t)v112;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v69, v70, 1, v39);
  swift_bridgeObjectRelease();
  if (v101(v69, 1, v39) == 1)
  {
    sub_6EE8(v69, &qword_76CF0);
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_616D0();
    sub_6D40(v71, (uint64_t)qword_7A9C8);
    uint64_t v72 = sub_616C0();
    os_log_type_t v73 = sub_61960();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v74 = 0;
      _os_log_impl(&dword_0, v72, v73, ".appShortcutCollisionWithEnablement confirmation uso parse does not have identifiers", v74, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v114 + 8))(v122, v39);
    uint64_t v75 = sub_607D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v127, 1, 1, v75);
  }
  uint64_t v76 = v104;
  sub_60E70();
  uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
  uint64_t v114 = v68 + 8;
  v77(v69, v39);
  int v78 = v107;
  sub_60ED0();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v76, v106);
  uint64_t v79 = sub_60DD0();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v78, v109);
  uint64_t v80 = *(void *)(v79 + 16);
  if (!v80)
  {
    swift_bridgeObjectRelease();
LABEL_51:
    v77((uint64_t)v122, v39);
    goto LABEL_3;
  }
  uint64_t v117 = v77;
  LODWORD(v115) = v60;
  uint64_t v121 = v39;
  uint64_t v81 = *(void (**)(char *, unint64_t, uint64_t))(v103 + 16);
  unint64_t v82 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
  uint64_t v116 = v79;
  unint64_t v83 = v79 + v82;
  uint64_t v84 = (void (**)(char *, uint64_t))(v102 + 8);
  uint64_t v85 = (void (**)(char *, uint64_t))(v103 + 8);
  uint64_t v86 = *(void *)(v103 + 72);
  unint64_t v123 = 0x8000000000064550;
  uint64_t v124 = v86;
  uint64_t v87 = v118;
  v81(v128, v79 + v82, v126);
  while (1)
  {
    sub_60FC0();
    uint64_t v89 = sub_615C0();
    uint64_t v91 = v90;
    (*v84)(v87, v119);
    if (v89 == 0xD000000000000018 && v91 == v123)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v92 = sub_61CA0();
      swift_bridgeObjectRelease();
      if ((v92 & 1) == 0)
      {
        (*v85)(v128, v126);
        goto LABEL_32;
      }
    }
    uint64_t v93 = sub_60FB0();
    uint64_t v95 = v94;
    if (qword_75D88 != -1) {
      swift_once();
    }
    if (v93 == qword_7A918 && v95 == unk_7A920) {
      break;
    }
    char v96 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v96) {
      goto LABEL_53;
    }
    uint64_t v97 = sub_60FB0();
    uint64_t v99 = v98;
    if (qword_75D90 != -1) {
      swift_once();
    }
    if (v97 == qword_7A928 && v99 == unk_7A930)
    {
      swift_bridgeObjectRelease();
      (*v85)(v128, v126);
LABEL_56:
      swift_bridgeObjectRelease();
      v117(v122, v121);
      uint64_t v61 = sub_607D0();
      uint64_t v62 = *(void *)(v61 - 8);
      uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
      if (v115) {
        uint64_t v64 = v120;
      }
      else {
        uint64_t v64 = v125;
      }
      goto LABEL_19;
    }
    char v88 = sub_61CA0();
    swift_bridgeObjectRelease();
    (*v85)(v128, v126);
    if (v88) {
      goto LABEL_56;
    }
LABEL_32:
    v83 += v124;
    if (!--v80)
    {
      swift_bridgeObjectRelease();
      uint64_t v39 = v121;
      uint64_t v77 = v117;
      goto LABEL_51;
    }
    v81(v128, v83, v126);
  }
  swift_bridgeObjectRelease();
LABEL_53:
  (*v85)(v128, v126);
  swift_bridgeObjectRelease();
  v117(v122, v121);
  uint64_t v61 = sub_607D0();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
  if (v115) {
    uint64_t v64 = v125;
  }
  else {
    uint64_t v64 = v120;
  }
LABEL_19:
  uint64_t v65 = v127;
  v63(v127, v64, v61);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56))(v65, 0, 1, v61);
}

uint64_t sub_2A6B8()
{
  sub_63E8(v0 + 24);
  sub_63E8(v0 + 64);
  sub_63E8(v0 + 104);
  sub_63E8(v0 + 144);
  sub_63E8(v0 + 184);
  sub_63E8(v0 + 224);
  swift_release();
  sub_63E8(v0 + 272);
  uint64_t v1 = v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutAction;
  uint64_t v2 = sub_607D0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_otherAction, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_appShortcutInvocation;
  uint64_t v5 = sub_60AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_2D32C(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin25AppShortcutEnablementFlow_state);
  return v0;
}

uint64_t sub_2A7E0()
{
  sub_2A6B8();

  return swift_deallocClassInstance();
}

uint64_t sub_2A838()
{
  return type metadata accessor for AppShortcutEnablementFlow(0);
}

uint64_t type metadata accessor for AppShortcutEnablementFlow(uint64_t a1)
{
  return sub_61F0(a1, (uint64_t *)&unk_76A78);
}

uint64_t sub_2A860()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_60AF0();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for AppShortcutEnablementFlow.State(319);
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for AppShortcutEnablementFlow.State(uint64_t a1)
{
  return sub_61F0(a1, qword_76CD0);
}

uint64_t *sub_2A9B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_6D90((uint64_t *)&unk_76030);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_607D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_2AB24(uint64_t a1)
{
  uint64_t v2 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_607D0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *sub_2ABD8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_607D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_2AD08(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_607D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_6EE8((uint64_t)a1, (uint64_t *)&unk_76030);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_607D0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *sub_2AEB4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_607D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_2AFE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_607D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_6EE8((uint64_t)a1, (uint64_t *)&unk_76030);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_607D0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_2B190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_2B1A4);
}

uint64_t sub_2B1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90((uint64_t *)&unk_76030);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_2B214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2B228);
}

uint64_t sub_2B228(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_2B2B0(uint64_t a1)
{
  uint64_t v2 = sub_6D90((uint64_t *)&unk_76030);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_2B31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

uint64_t sub_2B390()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

BOOL sub_2B408(uint64_t a1)
{
  return sub_1EA98(a1);
}

uint64_t sub_2B430()
{
  return sub_60550();
}

uint64_t sub_2B490(uint64_t a1)
{
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_1E98C;
  return sub_1FBAC(a1);
}

uint64_t sub_2B52C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AppShortcutEnablementFlow(0);

  return Flow<>.exitValue.getter(v3, a2);
}

unint64_t sub_2B568(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0xD000000000000025;
  }
  sub_61A70(22);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  sub_61820(v5);
  return 0xD000000000000014;
}

unint64_t sub_2B604()
{
  return sub_2B568(*(void *)v0, *(void **)(v0 + 8));
}

void sub_2B60C()
{
  qword_7A918 = 0x747065636361;
  unk_7A920 = 0xE600000000000000;
}

void sub_2B62C()
{
  qword_7A928 = 0x7463656A6572;
  unk_7A930 = 0xE600000000000000;
}

uint64_t sub_2B64C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2B728;
  return v6(a1);
}

uint64_t sub_2B728()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_2B820(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_6D90(&qword_76D78);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_2C9D8((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2D148();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

double sub_2B918@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  size_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_3C8A4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *size_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_39D30();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_2CDE4((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_2BA1C(v8, v11);
    *size_t v4 = v11;
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

unint64_t sub_2BA1C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_61A10();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_61D40();
        swift_bridgeObjectRetain();
        sub_61810();
        Swift::Int v10 = sub_61D60();
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
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
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

_OWORD *sub_2BBF4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_3C8A4(a2, a3);
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
      sub_39D30();
      goto LABEL_7;
    }
    sub_39778(v15, a4 & 1);
    unint64_t v21 = sub_3C8A4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    double result = (_OWORD *)sub_61CD0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_63E8((uint64_t)v19);
    return sub_2CDE4(a1, v19);
  }
LABEL_13:
  sub_2BD48(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_2BD48(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_2CDE4(a4, (_OWORD *)(a5[7] + 32 * a1));
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

Swift::Int sub_2BDB4(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_2CBE0(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_2BE20(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_2BE20(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_61C80(v3);
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
        uint64_t v91 = *(void *)(v89 + 24 * i);
        uint64_t v92 = v88;
        do
        {
          uint64_t v93 = v89 + v92;
          if (v91 >= *(void *)(v89 + v92)) {
            break;
          }
          if (!v89) {
            goto LABEL_140;
          }
          uint64_t v94 = (void *)(v89 + v92);
          uint64_t v95 = *(void *)(v89 + v92 + 32);
          uint64_t v96 = *(void *)(v89 + v92 + 40);
          *(_OWORD *)(v89 + v92 + 24) = *(_OWORD *)v93;
          *(void *)(v89 + v92 + 40) = *(void *)(v93 + 16);
          *uint64_t v94 = v91;
          v94[1] = v95;
          v94[2] = v96;
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
  Swift::Int v6 = result;
  uint64_t v106 = a1;
  if (v3 < 2)
  {
    BOOL v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      uint64_t v97 = v12;
      uint64_t v108 = v9;
      if (v13 >= 2)
      {
        uint64_t v98 = *v106;
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
          sub_2C540((char *)(v98 + 24 * v101), (char *)(v98 + 24 * *(void *)&v97[16 * v13 + 16]), v98 + 24 * v102, __dst);
          if (v1) {
            break;
          }
          if (v102 < v101) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v100 = sub_2C9C4((uint64_t)v100);
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
          uint64_t v97 = v100;
          *((void *)v100 + 2) = v104 - 1;
          unint64_t v13 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v108[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v108 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_6D90(&qword_76D80);
    uint64_t v8 = sub_618A0();
    *(void *)(v8 + 16) = v7;
    uint64_t v108 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 + 48;
  uint64_t v105 = *a1 - 24;
  unint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v109 = v6;
  Swift::Int v110 = v3;
  uint64_t v111 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 24 * v10);
      uint64_t v16 = *(void *)(v11 + 24 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (uint64_t *)(v107 + 24 * v14);
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
            Swift::Int v10 = v3;
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
          Swift::Int v23 = v10;
          Swift::Int v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = v11 + v21;
              uint64_t v27 = *(void *)(v11 + v22 + 16);
              long long v28 = *(_OWORD *)(v11 + v22);
              uint64_t v29 = *(void *)(v11 + v21 - 8);
              *(_OWORD *)uint64_t v25 = *(_OWORD *)(v11 + v21 - 24);
              *(void *)(v25 + 16) = v29;
              *(_OWORD *)(v26 - 24) = v28;
              *(void *)(v26 - 8) = v27;
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
    Swift::Int v30 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v30 >= v3) {
      Swift::Int v30 = v3;
    }
    if (v30 < v14) {
      break;
    }
    if (v10 != v30)
    {
      uint64_t v31 = v105 + 24 * v10;
      do
      {
        uint64_t v32 = *(void *)(v11 + 24 * v10);
        Swift::Int v33 = v14;
        uint64_t v34 = v31;
        do
        {
          if (v32 >= *(void *)v34) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v35 = *(void *)(v34 + 32);
          uint64_t v36 = *(void *)(v34 + 40);
          *(_OWORD *)(v34 + 24) = *(_OWORD *)v34;
          *(void *)(v34 + 40) = *(void *)(v34 + 16);
          *(void *)uint64_t v34 = v32;
          *(void *)(v34 + 8) = v35;
          *(void *)(v34 + 16) = v36;
          v34 -= 24;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 24;
      }
      while (v10 != v30);
      Swift::Int v10 = v30;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_2C7F8(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v38 = *((void *)v12 + 2);
    unint64_t v37 = *((void *)v12 + 3);
    unint64_t v13 = v38 + 1;
    uint64_t v11 = v111;
    if (v38 >= v37 >> 1)
    {
      uint64_t v87 = sub_2C7F8((char *)(v37 > 1), v38 + 1, 1, v12);
      uint64_t v11 = v111;
      unint64_t v12 = v87;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v39 = v12 + 32;
    uint64_t v40 = &v12[16 * v38 + 32];
    *(void *)uint64_t v40 = v14;
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
        uint64_t v65 = &v39[16 * v41];
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
        unint64_t v82 = &v39[16 * v80];
        uint64_t v83 = *(void *)v82;
        uint64_t v84 = &v39[16 * v41];
        uint64_t v85 = *((void *)v84 + 1);
        sub_2C540((char *)(v11 + 24 * *(void *)v82), (char *)(v11 + 24 * *(void *)v84), v11 + 24 * v85, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v85 < v83) {
          goto LABEL_116;
        }
        if (v41 > *((void *)v81 + 2)) {
          goto LABEL_117;
        }
        *(void *)unint64_t v82 = v83;
        *(void *)&v39[16 * v80 + 8] = v85;
        unint64_t v86 = *((void *)v81 + 2);
        if (v41 >= v86) {
          goto LABEL_118;
        }
        unint64_t v12 = v81;
        unint64_t v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((void *)v81 + 2) = v86 - 1;
        uint64_t v11 = v111;
        if (v86 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v109;
    Swift::Int v3 = v110;
    if (v10 >= v110)
    {
      BOOL v9 = v108;
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
  Swift::Int result = sub_61B40();
  __break(1u);
  return result;
}

uint64_t sub_2C540(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
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
      uint64_t v16 = &v4[24 * v11];
      Swift::Int v24 = v16;
      uint64_t v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v17 = a3 - 24;
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = (char *)(v17 + 24);
          uint64_t v20 = *((void *)v18 - 3);
          v18 -= 24;
          if (*((void *)v16 - 3) >= v20)
          {
            Swift::Int v24 = v16 - 24;
            if (v19 < v16 || v17 >= (unint64_t)v16 || v19 != v16)
            {
              long long v22 = *(_OWORD *)(v16 - 24);
              *(void *)(v17 + 16) = *((void *)v16 - 1);
              *(_OWORD *)unint64_t v17 = v22;
            }
            uint64_t v18 = v6;
            v16 -= 24;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= (unint64_t)v6)
            {
              long long v21 = *(_OWORD *)v18;
              *(void *)(v17 + 16) = *((void *)v18 + 2);
              *(_OWORD *)unint64_t v17 = v21;
            }
            uint64_t v26 = v18;
            if (v18 <= v7) {
              goto LABEL_38;
            }
          }
          v17 -= 24;
          Swift::Int v6 = v18;
          if (v16 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    unint64_t v12 = &v4[24 * v9];
    Swift::Int v24 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4)
          {
            long long v15 = *(_OWORD *)v4;
            *((void *)v7 + 2) = *((void *)v4 + 2);
            *(_OWORD *)uint64_t v7 = v15;
          }
          v4 += 24;
          uint64_t v25 = v4;
          unint64_t v13 = v6;
        }
        else
        {
          unint64_t v13 = v6 + 24;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
          {
            long long v14 = *(_OWORD *)v6;
            *((void *)v7 + 2) = *((void *)v6 + 2);
            *(_OWORD *)uint64_t v7 = v14;
          }
        }
        v7 += 24;
        if (v4 >= v12) {
          break;
        }
        Swift::Int v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      uint64_t v26 = v7;
    }
LABEL_38:
    sub_2C8F4((void **)&v26, (const void **)&v25, &v24);
    return 1;
  }
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

char *sub_2C7F8(char *result, int64_t a2, char a3, char *a4)
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
    sub_6D90(&qword_76D88);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
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

char *sub_2C8F4(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_61BA0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_2C9C4(uint64_t a1)
{
  return sub_2C7F8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2C9D8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
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
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    uint64_t v20 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    long long v21 = (uint64_t *)(*(void *)(a4 + 56) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    *int64_t v11 = v20;
    v11[1] = v23;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2CBE0(void *a1)
{
  return sub_3D5F8(0, a1[2], 0, a1);
}

uint64_t sub_2CBF4()
{
  uint64_t v0 = sub_61090();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_61280();
  swift_allocObject();
  sub_61270();
  sub_61260();
  swift_bridgeObjectRetain();
  sub_61060();
  sub_61050();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  sub_612A0();
  swift_allocObject();
  uint64_t v5 = sub_61290();
  sub_612B0();
  swift_release();
  return v5;
}

uint64_t sub_2CD8C(uint64_t a1, unint64_t a2)
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

_OWORD *sub_2CDE4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2CDF4()
{
  unint64_t result = qword_76D18;
  if (!qword_76D18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_76D18);
  }
  return result;
}

unint64_t sub_2CE34()
{
  unint64_t result = qword_76D20;
  if (!qword_76D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76D20);
  }
  return result;
}

uint64_t sub_2CE88(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_1E98C;
  return sub_26AF0(a1, a2, v7, v6);
}

uint64_t sub_2CF3C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_2CF84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_6C0C;
  return sub_2775C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_2D058()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2D090(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_6C0C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_76D58 + dword_76D58);
  return v6(a1, v4);
}

uint64_t sub_2D148()
{
  return swift_release();
}

uint64_t sub_2D154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppShortcutEnablementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2D1B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2D200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppShortcutEnablementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2D264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppShortcutEnablementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2D2C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6D90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2D32C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppShortcutEnablementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for AppShortcutEnablementError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppShortcutEnablementError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppShortcutEnablementError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppShortcutEnablementError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppShortcutEnablementError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShortcutEnablementError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppShortcutEnablementError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_2D4E8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2D500(void *result, int a2)
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

ValueMetadata *type metadata accessor for AppShortcutEnablementError()
{
  return &type metadata for AppShortcutEnablementError;
}

uint64_t sub_2D554(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  sub_603D0();
  v2[30] = swift_task_alloc();
  uint64_t v3 = sub_60480();
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v4 = sub_603F0();
  v2[34] = v4;
  v2[35] = *(void *)(v4 - 8);
  v2[36] = swift_task_alloc();
  uint64_t v5 = sub_604B0();
  v2[37] = v5;
  v2[38] = *(void *)(v5 - 8);
  v2[39] = swift_task_alloc();
  uint64_t v6 = sub_60450();
  v2[40] = v6;
  v2[41] = *(void *)(v6 - 8);
  v2[42] = swift_task_alloc();
  uint64_t v7 = sub_603B0();
  v2[43] = v7;
  v2[44] = *(void *)(v7 - 8);
  v2[45] = swift_task_alloc();
  uint64_t v8 = sub_604D0();
  v2[46] = v8;
  v2[47] = *(void *)(v8 - 8);
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  uint64_t v9 = sub_604F0();
  v2[52] = v9;
  v2[53] = *(void *)(v9 - 8);
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  uint64_t v10 = sub_60410();
  v2[56] = v10;
  v2[57] = *(void *)(v10 - 8);
  v2[58] = swift_task_alloc();
  sub_6D90(&qword_76D98);
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  sub_6D90(&qword_76DA0);
  v2[61] = swift_task_alloc();
  uint64_t v11 = sub_60420();
  v2[62] = v11;
  v2[63] = *(void *)(v11 - 8);
  v2[64] = swift_task_alloc();
  uint64_t v12 = sub_60440();
  v2[65] = v12;
  v2[66] = *(void *)(v12 - 8);
  v2[67] = swift_task_alloc();
  return _swift_task_switch(sub_2DA24, 0, 0);
}

uint64_t sub_2DA24()
{
  uint64_t v1 = *(void *)(v0 + 504);
  uint64_t v2 = *(void **)(v0 + 512);
  uint64_t v4 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 496);
  uint64_t v6 = *(void *)(v0 + 472);
  uint64_t v5 = *(void *)(v0 + 480);
  uint64_t v7 = *(uint64_t **)(v0 + 232);
  *uint64_t v2 = 0xD000000000000013;
  v2[1] = 0x80000000000646E0;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v2, enum case for SashStandard.Title.applicationBundleIdentifier(_:), v3);
  uint64_t v8 = sub_60460();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  uint64_t v9 = sub_604A0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v5, 1, 1, v9);
  v10(v6, 1, 1, v9);
  sub_60430();
  uint64_t v11 = *v7;
  uint64_t v12 = v7[9];
  uint64_t v13 = v7[10];
  uint64_t v14 = v7[7];
  uint64_t v15 = v7[8];
  uint64_t v16 = v7[5];
  uint64_t v17 = v7[6];
  uint64_t v18 = qword_75E00;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = v11;
  *(void *)(v0 + 24) = 3;
  *(void *)(v0 + 32) = v12;
  *(void *)(v0 + 40) = v13;
  *(void *)(v0 + 48) = v14;
  *(void *)(v0 + 56) = v15;
  *(void *)(v0 + 64) = v16;
  *(void *)(v0 + 72) = v17;
  sub_2E5C8();
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 0;
  *(unsigned char *)(v0 + 96) = 0;
  sub_60280();
  uint64_t v62 = *(void *)(v0 + 536);
  uint64_t v64 = *(void *)(v0 + 528);
  uint64_t v60 = *(void *)(v0 + 520);
  uint64_t v47 = *(void *)(v0 + 464);
  uint64_t v63 = *(void *)(v0 + 456);
  uint64_t v19 = *(void *)(v0 + 440);
  uint64_t v61 = *(void *)(v0 + 448);
  uint64_t v20 = *(void *)(v0 + 424);
  uint64_t v52 = *(void *)(v0 + 432);
  uint64_t v69 = *(void *)(v0 + 416);
  uint64_t v50 = *(void *)(v0 + 408);
  uint64_t v72 = *(void *)(v0 + 400);
  uint64_t v57 = *(void *)(v0 + 392);
  uint64_t v58 = *(void *)(v0 + 384);
  uint64_t v65 = *(void *)(v0 + 376);
  uint64_t v56 = *(void *)(v0 + 368);
  uint64_t v51 = *(void *)(v0 + 360);
  uint64_t v66 = *(void *)(v0 + 352);
  uint64_t v54 = *(void *)(v0 + 344);
  uint64_t v70 = *(void *)(v0 + 336);
  uint64_t v67 = *(void *)(v0 + 328);
  uint64_t v53 = *(void *)(v0 + 320);
  uint64_t v71 = *(void *)(v0 + 312);
  uint64_t v68 = *(void *)(v0 + 304);
  uint64_t v44 = *(void *)(v0 + 296);
  uint64_t v55 = *(void *)(v0 + 288);
  uint64_t v45 = *(void *)(v0 + 272);
  uint64_t v46 = *(void *)(v0 + 280);
  uint64_t v48 = *(void *)(v0 + 248);
  uint64_t v49 = *(void *)(v0 + 256);
  uint64_t v59 = *(void *)(v0 + 264);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BYTE2(v37) = 0;
  LOWORD(v37) = 0;
  sub_60400();
  long long v21 = (void *)sub_60660();
  id v22 = objc_msgSend(v21, "identifier", v37);

  sub_617F0();
  sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  sub_604E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v69;
  *(void *)(v0 + 136) = &protocol witness table for Command;
  uint64_t v23 = sub_838C((uint64_t *)(v0 + 104));
  uint64_t v42 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 16);
  v42(v23, v19, v69);
  uint64_t v43 = *(void (**)(uint64_t, void, uint64_t))(v66 + 104);
  v43(v51, enum case for ButtonRole.preferred(_:), v54);
  unsigned int v40 = enum case for _ProtoButton.FormAction.none(_:);
  unint64_t v41 = *(void (**)(uint64_t))(v67 + 104);
  v41(v70);
  unsigned int v39 = enum case for Button.LabelStyle.automatic(_:);
  unint64_t v38 = *(void (**)(uint64_t))(v68 + 104);
  v38(v71);
  swift_bridgeObjectRetain();
  sub_604C0();
  Swift::Int v24 = (void *)sub_60650();
  id v25 = objc_msgSend(v24, "identifier", 0, 0);

  sub_617F0();
  sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  sub_604E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 168) = v69;
  *(void *)(v0 + 176) = &protocol witness table for Command;
  uint64_t v26 = sub_838C((uint64_t *)(v0 + 144));
  v42(v26, v52, v69);
  ((void (*)(uint64_t, void, uint64_t))v41)(v70, v40, v53);
  ((void (*)(uint64_t, void, uint64_t))v38)(v71, v39, v44);
  v43(v51, enum case for ButtonRole.standard(_:), v54);
  swift_bridgeObjectRetain();
  sub_604C0();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
  v27(v57, v50, v56);
  v27(v58, v72, v56);
  sub_603E0();
  *(void *)(v0 + 208) = v45;
  *(void *)(v0 + 216) = &protocol witness table for BinaryButton;
  long long v28 = sub_838C((uint64_t *)(v0 + 184));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v46 + 16))(v28, v55, v45);
  sub_603C0();
  sub_60490();
  sub_6D90(&qword_76DB0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_62990;
  *(void *)(v29 + 56) = v60;
  *(void *)(v29 + 64) = &protocol witness table for SashStandard;
  Swift::Int v30 = sub_838C((uint64_t *)(v29 + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 16))(v30, v62, v60);
  *(void *)(v29 + 96) = v61;
  *(void *)(v29 + 104) = &protocol witness table for CustomCanvas;
  uint64_t v31 = sub_838C((uint64_t *)(v29 + 72));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v63 + 16))(v31, v47, v61);
  *(void *)(v29 + 136) = v48;
  *(void *)(v29 + 144) = &protocol witness table for ComponentWrapper;
  uint64_t v32 = sub_838C((uint64_t *)(v29 + 112));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v49 + 16))(v32, v59, v48);
  sub_60510();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v59, v48);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v55, v45);
  Swift::Int v33 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
  v33(v72, v56);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v34(v52, v69);
  v33(v50, v56);
  v34(v19, v69);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v47, v61);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v60);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

unint64_t sub_2E5C8()
{
  unint64_t result = qword_76DA8;
  if (!qword_76DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76DA8);
  }
  return result;
}

uint64_t sub_2E61C(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  sub_603D0();
  v2[30] = swift_task_alloc();
  uint64_t v3 = sub_60480();
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v4 = sub_603F0();
  v2[34] = v4;
  v2[35] = *(void *)(v4 - 8);
  v2[36] = swift_task_alloc();
  uint64_t v5 = sub_604B0();
  v2[37] = v5;
  v2[38] = *(void *)(v5 - 8);
  v2[39] = swift_task_alloc();
  uint64_t v6 = sub_60450();
  v2[40] = v6;
  v2[41] = *(void *)(v6 - 8);
  v2[42] = swift_task_alloc();
  uint64_t v7 = sub_603B0();
  v2[43] = v7;
  v2[44] = *(void *)(v7 - 8);
  v2[45] = swift_task_alloc();
  uint64_t v8 = sub_604D0();
  v2[46] = v8;
  v2[47] = *(void *)(v8 - 8);
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  uint64_t v9 = sub_604F0();
  v2[52] = v9;
  v2[53] = *(void *)(v9 - 8);
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  uint64_t v10 = sub_60410();
  v2[56] = v10;
  v2[57] = *(void *)(v10 - 8);
  v2[58] = swift_task_alloc();
  sub_6D90(&qword_76D98);
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  sub_6D90(&qword_76DA0);
  v2[61] = swift_task_alloc();
  uint64_t v11 = sub_60420();
  v2[62] = v11;
  v2[63] = *(void *)(v11 - 8);
  v2[64] = swift_task_alloc();
  uint64_t v12 = sub_60440();
  v2[65] = v12;
  v2[66] = *(void *)(v12 - 8);
  v2[67] = swift_task_alloc();
  return _swift_task_switch(sub_2EAEC, 0, 0);
}

uint64_t sub_2EAEC()
{
  uint64_t v1 = *(void *)(v0 + 504);
  uint64_t v2 = *(void **)(v0 + 512);
  uint64_t v4 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 496);
  uint64_t v6 = *(void *)(v0 + 472);
  uint64_t v5 = *(void *)(v0 + 480);
  uint64_t v7 = *(uint64_t **)(v0 + 232);
  *uint64_t v2 = 0xD000000000000019;
  v2[1] = 0x8000000000064740;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v2, enum case for SashStandard.Title.applicationBundleIdentifier(_:), v3);
  uint64_t v8 = sub_60460();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  uint64_t v9 = sub_604A0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v5, 1, 1, v9);
  v10(v6, 1, 1, v9);
  sub_60430();
  uint64_t v11 = *v7;
  uint64_t v12 = v7[9];
  uint64_t v13 = v7[10];
  uint64_t v14 = v7[7];
  uint64_t v15 = v7[8];
  uint64_t v16 = v7[5];
  uint64_t v17 = v7[6];
  uint64_t v18 = qword_75E00;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = v11;
  *(void *)(v0 + 24) = 3;
  *(void *)(v0 + 32) = v12;
  *(void *)(v0 + 40) = v13;
  *(void *)(v0 + 48) = v14;
  *(void *)(v0 + 56) = v15;
  *(void *)(v0 + 64) = v16;
  *(void *)(v0 + 72) = v17;
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 0;
  *(unsigned char *)(v0 + 96) = 1;
  sub_2E5C8();
  sub_60280();
  uint64_t v62 = *(void *)(v0 + 536);
  uint64_t v64 = *(void *)(v0 + 528);
  uint64_t v60 = *(void *)(v0 + 520);
  uint64_t v47 = *(void *)(v0 + 464);
  uint64_t v63 = *(void *)(v0 + 456);
  uint64_t v19 = *(void *)(v0 + 440);
  uint64_t v61 = *(void *)(v0 + 448);
  uint64_t v20 = *(void *)(v0 + 424);
  uint64_t v52 = *(void *)(v0 + 432);
  uint64_t v69 = *(void *)(v0 + 416);
  uint64_t v50 = *(void *)(v0 + 408);
  uint64_t v72 = *(void *)(v0 + 400);
  uint64_t v57 = *(void *)(v0 + 392);
  uint64_t v58 = *(void *)(v0 + 384);
  uint64_t v65 = *(void *)(v0 + 376);
  uint64_t v56 = *(void *)(v0 + 368);
  uint64_t v51 = *(void *)(v0 + 360);
  uint64_t v66 = *(void *)(v0 + 352);
  uint64_t v54 = *(void *)(v0 + 344);
  uint64_t v70 = *(void *)(v0 + 336);
  uint64_t v67 = *(void *)(v0 + 328);
  uint64_t v53 = *(void *)(v0 + 320);
  uint64_t v71 = *(void *)(v0 + 312);
  uint64_t v68 = *(void *)(v0 + 304);
  uint64_t v44 = *(void *)(v0 + 296);
  uint64_t v55 = *(void *)(v0 + 288);
  uint64_t v45 = *(void *)(v0 + 272);
  uint64_t v46 = *(void *)(v0 + 280);
  uint64_t v48 = *(void *)(v0 + 248);
  uint64_t v49 = *(void *)(v0 + 256);
  uint64_t v59 = *(void *)(v0 + 264);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BYTE2(v37) = 0;
  LOWORD(v37) = 0;
  sub_60400();
  long long v21 = (void *)sub_60660();
  id v22 = objc_msgSend(v21, "identifier", v37);

  sub_617F0();
  sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  sub_604E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v69;
  *(void *)(v0 + 136) = &protocol witness table for Command;
  uint64_t v23 = sub_838C((uint64_t *)(v0 + 104));
  uint64_t v42 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 16);
  v42(v23, v19, v69);
  uint64_t v43 = *(void (**)(uint64_t, void, uint64_t))(v66 + 104);
  v43(v51, enum case for ButtonRole.preferred(_:), v54);
  unsigned int v40 = enum case for _ProtoButton.FormAction.none(_:);
  unint64_t v41 = *(void (**)(uint64_t))(v67 + 104);
  v41(v70);
  unsigned int v39 = enum case for Button.LabelStyle.automatic(_:);
  unint64_t v38 = *(void (**)(uint64_t))(v68 + 104);
  v38(v71);
  swift_bridgeObjectRetain();
  sub_604C0();
  Swift::Int v24 = (void *)sub_60650();
  id v25 = objc_msgSend(v24, "identifier", 0, 0);

  sub_617F0();
  sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  sub_604E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 168) = v69;
  *(void *)(v0 + 176) = &protocol witness table for Command;
  uint64_t v26 = sub_838C((uint64_t *)(v0 + 144));
  v42(v26, v52, v69);
  ((void (*)(uint64_t, void, uint64_t))v41)(v70, v40, v53);
  ((void (*)(uint64_t, void, uint64_t))v38)(v71, v39, v44);
  v43(v51, enum case for ButtonRole.standard(_:), v54);
  swift_bridgeObjectRetain();
  sub_604C0();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
  v27(v57, v50, v56);
  v27(v58, v72, v56);
  sub_603E0();
  *(void *)(v0 + 208) = v45;
  *(void *)(v0 + 216) = &protocol witness table for BinaryButton;
  long long v28 = sub_838C((uint64_t *)(v0 + 184));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v46 + 16))(v28, v55, v45);
  sub_603C0();
  sub_60490();
  sub_6D90(&qword_76DB0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_62990;
  *(void *)(v29 + 56) = v60;
  *(void *)(v29 + 64) = &protocol witness table for SashStandard;
  Swift::Int v30 = sub_838C((uint64_t *)(v29 + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 16))(v30, v62, v60);
  *(void *)(v29 + 96) = v61;
  *(void *)(v29 + 104) = &protocol witness table for CustomCanvas;
  uint64_t v31 = sub_838C((uint64_t *)(v29 + 72));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v63 + 16))(v31, v47, v61);
  *(void *)(v29 + 136) = v48;
  *(void *)(v29 + 144) = &protocol witness table for ComponentWrapper;
  uint64_t v32 = sub_838C((uint64_t *)(v29 + 112));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v49 + 16))(v32, v59, v48);
  sub_60510();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v59, v48);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v55, v45);
  Swift::Int v33 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
  v33(v72, v56);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v34(v52, v69);
  v33(v50, v56);
  v34(v19, v69);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v47, v61);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v60);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_2F698(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76DC0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v84 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_60DA0();
  uint64_t v5 = *(void *)(v95 - 8);
  uint64_t v7 = __chkstk_darwin(v95, v6);
  uint64_t v9 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v94 = (char *)&v80 - v12;
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v83 = (char *)&v80 - v15;
  __chkstk_darwin(v14, v16);
  unint64_t v82 = (char *)&v80 - v17;
  uint64_t v93 = (void (*)(char *, char *, uint64_t))sub_60C90();
  uint64_t v96 = *((void *)v93 - 1);
  __chkstk_darwin(v93, v18);
  uint64_t v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_607D0();
  uint64_t v21 = *(void *)(v92 - 8);
  __chkstk_darwin(v92, v22);
  Swift::Int v24 = (char *)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_60D10();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v28 = __chkstk_darwin(v25, v27);
  uint64_t v98 = (char *)&v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v28, v30);
  unint64_t v99 = (char *)&v80 - v32;
  __chkstk_darwin(v31, v33);
  uint64_t v97 = (char *)&v80 - v34;
  int64_t v35 = *(void *)(a1 + 16);
  uint64_t v36 = _swiftEmptyArrayStorage;
  uint64_t v85 = v5;
  unint64_t v80 = v9;
  if (v35)
  {
    uint64_t v100 = _swiftEmptyArrayStorage;
    sub_3CCD8(0, v35, 0);
    unint64_t v38 = *(void (***)(char *, uint64_t))(v21 + 16);
    uint64_t v37 = v21 + 16;
    uint64_t v39 = a1 + ((*(unsigned __int8 *)(v37 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 64));
    uint64_t v89 = *(void *)(v37 + 56);
    uint64_t v90 = v38;
    unsigned int v40 = (void (**)(char *, void (*)(char *, char *, uint64_t)))(v96 + 8);
    uint64_t v41 = v26;
    uint64_t v91 = (uint64_t (**)(char *, uint64_t))v37;
    uint64_t v42 = (void (**)(char *, uint64_t))(v37 - 8);
    uint64_t v96 = v41;
    uint64_t v88 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 32);
    do
    {
      uint64_t v43 = v92;
      ((void (*)(char *, uint64_t, uint64_t))v90)(v24, v39, v92);
      sub_607B0();
      sub_60C80();
      (*v40)(v20, v93);
      (*v42)(v24, v43);
      uint64_t v36 = v100;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3CCD8(0, v36[2] + 1, 1);
        uint64_t v36 = v100;
      }
      unint64_t v45 = v36[2];
      unint64_t v44 = v36[3];
      if (v45 >= v44 >> 1)
      {
        sub_3CCD8(v44 > 1, v45 + 1, 1);
        uint64_t v36 = v100;
      }
      v36[2] = v45 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v96 + 32))((unint64_t)v36+ ((*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80))+ *(void *)(v96 + 72) * v45, v97, v25);
      uint64_t v100 = v36;
      v39 += v89;
      --v35;
    }
    while (v35);
    uint64_t v5 = v85;
    uint64_t v9 = v80;
    uint64_t v26 = v96;
  }
  uint64_t v46 = v36[2];
  uint64_t v47 = v95;
  if (v46)
  {
    uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    uint64_t v48 = v26 + 16;
    uint64_t v50 = (char *)v36 + ((*(unsigned __int8 *)(v48 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 64));
    uint64_t v92 = *(void *)(v48 + 56);
    uint64_t v93 = v49;
    uint64_t v91 = (uint64_t (**)(char *, uint64_t))(v48 + 72);
    LODWORD(v89) = enum case for Parse.uso(_:);
    uint64_t v81 = (void (**)(char *, uint64_t))(v48 + 80);
    uint64_t v96 = v5 + 32;
    uint64_t v87 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v88 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain();
    uint64_t v97 = (char *)_swiftEmptyArrayStorage;
    uint64_t v90 = (void (**)(char *, uint64_t))(v48 - 8);
    uint64_t v86 = (v48 - 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v51 = (uint64_t)v84;
    uint64_t v52 = v98;
    do
    {
      uint64_t v53 = v99;
      uint64_t v54 = v25;
      uint64_t v55 = v25;
      uint64_t v56 = v93;
      v93(v99, v50, v54);
      uint64_t v57 = v53;
      uint64_t v58 = v48;
      v56(v52, v57, v55);
      uint64_t v25 = v55;
      int v59 = (*v91)(v52, v55);
      if (v59 == v89)
      {
        (*v81)(v52, v55);
        uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))v96;
        uint64_t v61 = v83;
        (*(void (**)(char *, char *, uint64_t))v96)(v83, v98, v47);
        uint64_t v62 = v61;
        uint64_t v52 = v98;
        v60((char *)v51, (uint64_t)v62, v47);
        (*v88)(v51, 0, 1, v47);
        (*v90)(v99, v55);
      }
      else
      {
        uint64_t v63 = *v90;
        (*v90)(v52, v55);
        (*v88)(v51, 1, 1, v47);
        v63(v99, v55);
      }
      if ((*v87)(v51, 1, v47) == 1)
      {
        sub_2FF24(v51);
      }
      else
      {
        uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))v96;
        uint64_t v65 = v82;
        (*(void (**)(char *, uint64_t, uint64_t))v96)(v82, v51, v47);
        v64(v94, (uint64_t)v65, v47);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          unint64_t v66 = (unint64_t)v97;
        }
        else {
          unint64_t v66 = sub_5D83C(0, *((void *)v97 + 2) + 1, 1, (unint64_t)v97);
        }
        unint64_t v68 = *(void *)(v66 + 16);
        unint64_t v67 = *(void *)(v66 + 24);
        uint64_t v52 = v98;
        if (v68 >= v67 >> 1) {
          unint64_t v66 = sub_5D83C(v67 > 1, v68 + 1, 1, v66);
        }
        *(void *)(v66 + 16) = v68 + 1;
        unint64_t v69 = (*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
        uint64_t v97 = (char *)v66;
        uint64_t v47 = v95;
        v64((char *)(v66 + v69 + *(void *)(v85 + 72) * v68), (uint64_t)v94, v95);
        uint64_t v51 = (uint64_t)v84;
      }
      v50 += v92;
      --v46;
      uint64_t v48 = v58;
    }
    while (v46);
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v85;
    uint64_t v9 = v80;
    uint64_t v70 = v97;
    uint64_t v71 = *((void *)v97 + 2);
    if (v71)
    {
LABEL_24:
      uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      uint64_t v73 = v5 + 16;
      uint64_t v72 = v74;
      uint64_t v75 = &v70[(*(unsigned __int8 *)(v73 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 64)];
      uint64_t v76 = *(void *)(v73 + 56);
      swift_bridgeObjectRetain();
      uint64_t v77 = v95;
      while (1)
      {
        v72(v9, v75, v77);
        BOOL v78 = sub_60D60();
        (*(void (**)(char *, uint64_t))(v73 - 8))(v9, v77);
        if (v78) {
          break;
        }
        v75 += v76;
        if (!--v71)
        {
          swift_bridgeObjectRelease_n();
          return 0;
        }
      }
      swift_bridgeObjectRelease_n();
      return 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v70 = (char *)_swiftEmptyArrayStorage;
    uint64_t v71 = _swiftEmptyArrayStorage[2];
    if (v71) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2FF24(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76DC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2FF84()
{
  qword_7A938 = 0x54746E6572727543;
  unk_7A940 = 0xEB000000006B7361;
}

uint64_t sub_2FFB0(uint64_t a1)
{
  v2[38] = a1;
  v2[39] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[40] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[41] = v3;
  v2[42] = *(void *)(v3 - 8);
  v2[43] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[44] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[45] = v4;
  v2[46] = *(void *)(v4 - 8);
  v2[47] = swift_task_alloc();
  uint64_t v5 = sub_60940();
  v2[48] = v5;
  v2[49] = *(void *)(v5 - 8);
  v2[50] = swift_task_alloc();
  uint64_t v6 = sub_60B00();
  v2[51] = v6;
  v2[52] = *(void *)(v6 - 8);
  v2[53] = swift_task_alloc();
  uint64_t v7 = sub_60A40();
  v2[54] = v7;
  v2[55] = *(void *)(v7 - 8);
  v2[56] = swift_task_alloc();
  sub_6D90(&qword_76EB0);
  v2[57] = swift_task_alloc();
  uint64_t v8 = sub_60F40();
  v2[58] = v8;
  v2[59] = *(void *)(v8 - 8);
  v2[60] = swift_task_alloc();
  return _swift_task_switch(sub_302CC, 0, 0);
}

uint64_t sub_302CC()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AskRepeatFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[39];

  sub_6EA4((void *)(v5 + 16), *(void *)(v5 + 40));
  unint64_t v6 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[61] = v6;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v8 = sub_3C438(inited);
  v0[62] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[63] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_304C4;
  return sub_38544(0xD000000000000015, 0x8000000000064970, v6, v8);
}

uint64_t sub_304C4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 512) = a1;
  *(void *)(v3 + 520) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_30BFC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_305EC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_305EC()
{
  uint64_t v39 = v0;
  id v1 = *(id *)(v0 + 512);
  uint64_t v2 = sub_60B10();
  uint64_t v3 = *(void *)(v0 + 464);
  uint64_t v4 = *(void *)(v0 + 472);
  uint64_t v5 = *(void *)(v0 + 456);
  if (v2)
  {
    swift_getObjectType();
    sub_61990();
    swift_unknownObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) != 1)
    {
      uint64_t v6 = *(void **)(v0 + 512);
      uint64_t v7 = *(void *)(v0 + 472);
      uint64_t v29 = *(void *)(v0 + 464);
      uint64_t v30 = *(void *)(v0 + 480);
      uint64_t v8 = *(void *)(v0 + 416);
      uint64_t v9 = *(void *)(v0 + 424);
      uint64_t v10 = *(void *)(v0 + 408);
      uint64_t v27 = *(void *)(v0 + 392);
      uint64_t v28 = *(void *)(v0 + 400);
      uint64_t v32 = *(void *)(v0 + 384);
      uint64_t v33 = *(void *)(v0 + 376);
      uint64_t v35 = *(void *)(v0 + 360);
      uint64_t v36 = *(void *)(v0 + 368);
      uint64_t v31 = *(void *)(v0 + 352);
      uint64_t v34 = *(void **)(v0 + 312);
      (*(void (**)(void))(v7 + 32))();
      id v11 = [v6 speak];
      sub_61870();

      id v12 = [v6 print];
      sub_61870();

      (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v9, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v10);
      id v13 = [v6 print];
      uint64_t v14 = sub_61870();

      uint64_t v15 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease();
      sub_45D64(0, 0xE000000000000000, v15);
      id v16 = [v6 meta];

      sub_617A0();
      sub_609E0();
      sub_60930();
      sub_6D90(&qword_768E0);
      unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_625B0;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16))(v18 + v17, v30, v29);
      sub_60910();
      sub_60D20();
      sub_60D20();
      sub_6EA4((void *)(v0 + 216), *(void *)(v0 + 240));
      sub_606D0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v31, v28, v32);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v32);
      *(void *)(v0 + 208) = 0;
      *(_OWORD *)(v0 + 192) = 0u;
      *(_OWORD *)(v0 + 176) = 0u;
      sub_608A0();
      sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
      sub_6EE8(v31, (uint64_t *)&unk_76560);
      sub_63E8(v0 + 136);
      sub_63E8(v0 + 216);
      uint64_t v19 = v34[10];
      uint64_t v20 = v34[11];
      sub_6EA4(v34 + 7, v19);
      *(void *)(v0 + 120) = v35;
      *(void *)(v0 + 128) = &protocol witness table for AceOutput;
      uint64_t v21 = sub_838C((uint64_t *)(v0 + 96));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v36 + 16))(v21, v33, v35);
      uint64_t v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 528) = v22;
      *uint64_t v22 = v0;
      v22[1] = sub_30E08;
      return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 96, v19, v20);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v4 + 56))(*(void *)(v0 + 456), 1, 1, *(void *)(v0 + 464));
  }
  uint64_t v23 = *(void **)(v0 + 512);
  uint64_t v24 = *(void *)(v0 + 456);

  sub_6EE8(v24, &qword_76EB0);
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  *(void *)(v0 + 296) = sub_352DC(0xD00000000000002FLL, 0x80000000000649C0, (uint64_t)v37, (uint64_t)&v38);
  sub_326CC((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
  sub_608D0();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_30BFC()
{
  uint64_t v5 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_61A70(43);
  swift_bridgeObjectRelease();
  v4[0] = 0xD000000000000029;
  v4[1] = 0x8000000000064990;
  swift_getErrorValue();
  v7._countAndFlagsBits = sub_61CE0();
  sub_61820(v7);
  swift_bridgeObjectRelease();
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  *(void *)(v0 + 288) = sub_352DC(0xD000000000000029, 0x8000000000064990, (uint64_t)&v3, (uint64_t)v4);
  sub_326CC((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
  sub_608D0();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_30E08()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_31214;
  }
  else
  {
    sub_63E8(v2 + 96);
    uint64_t v3 = sub_30F28;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_30F28()
{
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[41];
  sub_6EA4((void *)(v0[39] + 96), *(void *)(v0[39] + 120));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.askRepeat(_:), v3);
  if (qword_75D98 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)v0[64];
  uint64_t v22 = v0[60];
  uint64_t v20 = v0[59];
  uint64_t v21 = v0[58];
  uint64_t v4 = v0[55];
  uint64_t v18 = v0[54];
  uint64_t v19 = v0[56];
  uint64_t v5 = v0[49];
  uint64_t v16 = v0[48];
  uint64_t v17 = v0[50];
  uint64_t v6 = v0[46];
  uint64_t v13 = v0[45];
  uint64_t v14 = v0[47];
  uint64_t v7 = v0[40];
  uint64_t v8 = enum case for SiriKitReliabilityCodes.normal(_:);
  uint64_t v9 = sub_60620();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v19, v18);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_31214()
{
  sub_63E8((uint64_t)(v0 + 12));
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[41];
  sub_6EA4((void *)(v0[39] + 96), *(void *)(v0[39] + 120));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.askRepeat(_:), v3);
  if (qword_75D98 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)v0[64];
  uint64_t v22 = v0[60];
  uint64_t v20 = v0[59];
  uint64_t v21 = v0[58];
  uint64_t v4 = v0[55];
  uint64_t v18 = v0[54];
  uint64_t v19 = v0[56];
  uint64_t v5 = v0[49];
  uint64_t v16 = v0[48];
  uint64_t v17 = v0[50];
  uint64_t v6 = v0[46];
  uint64_t v13 = v0[45];
  uint64_t v14 = v0[47];
  uint64_t v7 = v0[40];
  uint64_t v8 = enum case for SiriKitReliabilityCodes.normal(_:);
  uint64_t v9 = sub_60620();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v19, v18);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_31508()
{
  return sub_60670();
}

uint64_t type metadata accessor for AskRepeatFlow()
{
  return self;
}

uint64_t sub_31574()
{
  return sub_60550();
}

uint64_t sub_315D0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_2FFB0(a1);
}

uint64_t sub_3166C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AskRepeatFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_316A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_31778(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_32670((uint64_t)v12, *a3);
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
      sub_32670((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_63E8((uint64_t)v12);
  return v7;
}

uint64_t sub_31778(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_619D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_31934(a5, a6);
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
  uint64_t v8 = sub_61AD0();
  if (!v8)
  {
    sub_61B40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_61BA0();
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

uint64_t sub_31934(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_319CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_31BAC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_31BAC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_319CC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_31B44(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_61A80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_61B40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_61830();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_61BA0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_61B40();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_31B44(uint64_t a1, uint64_t a2)
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
  sub_6D90(&qword_76EA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_31BAC(char a1, int64_t a2, char a3, char *a4)
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
    sub_6D90(&qword_76EA8);
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
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_31CFC(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_75FF0);
  __chkstk_darwin(v2 - 8, v3);
  unint64_t v69 = (uint64_t *)((char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for CAMDirectInvocation();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v58 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  size_t v11 = (char *)&v54 - v10;
  uint64_t v12 = sub_60D10();
  uint64_t v66 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_60CF0();
  uint64_t v70 = *(void *)(v62 - 8);
  __chkstk_darwin(v62, v16);
  uint64_t v61 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_60C90();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)&v54 - v25;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_616D0();
  uint64_t v28 = sub_6D40(v27, (uint64_t)qword_7A9C8);
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v65 = v19 + 16;
  v64(v26, a1, v18);
  uint64_t v68 = v28;
  uint64_t v29 = sub_616C0();
  os_log_type_t v30 = sub_61960();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v55 = v23;
    uint64_t v32 = (uint8_t *)v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v57 = a1;
    v72[0] = v33;
    uint64_t v54 = v11;
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v56 = v19;
    sub_326CC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v34 = sub_61C90();
    uint64_t v71 = sub_316A4(v34, v35, v72);
    uint64_t v36 = v56;
    size_t v11 = v54;
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v63 = *(void (**)(char *, uint64_t))(v36 + 8);
    v63(v26, v18);
    _os_log_impl(&dword_0, v29, v30, "AskRepeatFlow: on called with %s", v32, 0xCu);
    swift_arrayDestroy();
    a1 = v57;
    swift_slowDealloc();
    uint64_t v23 = v55;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v63 = *(void (**)(char *, uint64_t))(v19 + 8);
    v63(v26, v18);
  }

  sub_60C80();
  uint64_t v38 = v66;
  uint64_t v37 = v67;
  int v39 = (*(uint64_t (**)(char *, uint64_t))(v66 + 88))(v15, v67);
  uint64_t v40 = v69;
  uint64_t v41 = v70;
  if (v39 != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v37);
    goto LABEL_15;
  }
  (*(void (**)(char *, uint64_t))(v38 + 96))(v15, v37);
  uint64_t v42 = v62;
  uint64_t v43 = v61;
  (*(void (**)(void))(v41 + 32))();
  sub_3B0A8(v40);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v59 + 48))(v40, 1, v60) == 1)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
    sub_6EE8((uint64_t)v40, &qword_75FF0);
LABEL_15:
    v64(v23, a1, v18);
    uint64_t v49 = sub_616C0();
    os_log_type_t v50 = sub_61970();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      v72[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315138;
      sub_326CC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v52 = sub_61C90();
      uint64_t v71 = sub_316A4(v52, v53, v72);
      sub_619C0();
      swift_bridgeObjectRelease();
      v63(v23, v18);
      _os_log_impl(&dword_0, v49, v50, "AskRepeatFlow called with unexpected input %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v63(v23, v18);
    }

    return 0;
  }
  sub_3254C((uint64_t)v40, (uint64_t)v11);
  uint64_t v44 = v58;
  sub_325B0((uint64_t)v11, v58);
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    sub_32614((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
    sub_32614(v44);
    goto LABEL_15;
  }
  sub_32614(v44);
  unint64_t v45 = sub_616C0();
  os_log_type_t v46 = sub_61960();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_0, v45, v46, "AskRepeatFlow: input accepted", v47, 2u);
    swift_slowDealloc();
  }

  sub_32614((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
  return 1;
}

uint64_t sub_3254C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CAMDirectInvocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_325B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CAMDirectInvocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_32614(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CAMDirectInvocation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_32670(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_326CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for AutoShortcutAppPhrasesViewModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoShortcutAppPhrasesViewModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AutoShortcutAppPhrasesViewModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AutoShortcutAppPhrasesViewModel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AutoShortcutAppPhrasesViewModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoShortcutAppPhrasesViewModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoShortcutAppPhrasesViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoShortcutAppPhrasesViewModel()
{
  return &type metadata for AutoShortcutAppPhrasesViewModel;
}

unint64_t sub_32A08(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x736172685078616DLL;
      break;
    case 2:
      unint64_t result = 0x6449656C646E7562;
      break;
    case 3:
      unint64_t result = 0x74706D6F7270;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x65746F6E746F6F66;
      break;
    default:
      unint64_t result = 0x74756374726F6873;
      break;
  }
  return result;
}

BOOL sub_32AF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_32B04()
{
  Swift::UInt v1 = *v0;
  sub_61D40();
  sub_61D50(v1);
  return sub_61D60();
}

void sub_32B4C()
{
  sub_61D50(*v0);
}

Swift::Int sub_32B78()
{
  Swift::UInt v1 = *v0;
  sub_61D40();
  sub_61D50(v1);
  return sub_61D60();
}

unint64_t sub_32BBC()
{
  return sub_32A08(*v0);
}

uint64_t sub_32BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_32F7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_32BEC()
{
  return 0;
}

void sub_32BF8(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_32C04(uint64_t a1)
{
  unint64_t v2 = sub_32F28();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_32C40(uint64_t a1)
{
  unint64_t v2 = sub_32F28();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_32C7C(void *a1)
{
  long long v3 = v1;
  uint64_t v5 = sub_6D90(&qword_76EB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6EA4(a1, a1[3]);
  sub_32F28();
  sub_61D80();
  uint64_t v12 = *v3;
  v11[7] = 0;
  sub_6D90(&qword_768D0);
  sub_3364C(&qword_76EC8);
  sub_61C70();
  if (!v2)
  {
    v11[6] = 1;
    sub_61C60();
    v11[5] = 2;
    sub_61C50();
    v11[4] = 3;
    sub_61C50();
    v11[3] = 4;
    sub_61C40();
    v11[2] = 5;
    sub_61C40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

__n128 sub_32EC4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_33208(a1, v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_32F10(void *a1)
{
  return sub_32C7C(a1);
}

unint64_t sub_32F28()
{
  unint64_t result = qword_76EC0;
  if (!qword_76EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76EC0);
  }
  return result;
}

uint64_t sub_32F7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74756374726F6873 && a2 == 0xEF73657361726850;
  if (v3 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736172685078616DLL && a2 == 0xEA00000000007365 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000000064A20 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65746F6E746F6F66 && a2 == 0xED00006C6562614CLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_33208@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_6D90(&qword_76ED0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA4(a1, a1[3]);
  sub_32F28();
  sub_61D70();
  if (v2) {
    return sub_63E8((uint64_t)a1);
  }
  sub_6D90(&qword_768D0);
  char v36 = 0;
  sub_3364C(&qword_76ED8);
  sub_61C10();
  uint64_t v10 = v37;
  char v35 = 1;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_61C00();
  char v34 = 2;
  uint64_t v28 = sub_61BF0();
  char v33 = 3;
  uint64_t v30 = v12;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_61BF0();
  uint64_t v29 = v14;
  uint64_t v26 = v13;
  char v32 = 4;
  swift_bridgeObjectRetain();
  uint64_t v27 = 0;
  uint64_t v24 = sub_61BE0();
  uint64_t v25 = v15;
  char v31 = 5;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_61BE0();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v27 = v16;
  v19(v9, v5);
  swift_bridgeObjectRetain();
  sub_63E8((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v20 = v25;
  swift_bridgeObjectRelease();
  uint64_t v21 = v29;
  swift_bridgeObjectRelease();
  uint64_t v22 = v30;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v10;
  a2[1] = v11;
  a2[2] = v28;
  a2[3] = v22;
  a2[4] = v26;
  a2[5] = v21;
  a2[6] = v24;
  a2[7] = v20;
  a2[8] = v27;
  a2[9] = v18;
  return result;
}

uint64_t sub_3364C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1CFE0(&qword_768D0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AutoShortcutAppPhrasesViewModel.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AutoShortcutAppPhrasesViewModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AutoShortcutAppPhrasesViewModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x3381CLL);
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

uint64_t sub_33844(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_3384C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AutoShortcutAppPhrasesViewModel.CodingKeys()
{
  return &type metadata for AutoShortcutAppPhrasesViewModel.CodingKeys;
}

unint64_t sub_33868()
{
  unint64_t result = qword_76EE0;
  if (!qword_76EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76EE0);
  }
  return result;
}

unint64_t sub_338C0()
{
  unint64_t result = qword_76EE8;
  if (!qword_76EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76EE8);
  }
  return result;
}

unint64_t sub_33918()
{
  unint64_t result = qword_76EF0;
  if (!qword_76EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_76EF0);
  }
  return result;
}

uint64_t sub_3396C()
{
  sub_63E8(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CAMDisambiguateCATPatternsExecutor()
{
  return self;
}

uint64_t sub_339C8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 112) = a3;
  *(void *)(v4 + 120) = a4;
  *(void *)(v4 + 104) = a2;
  *(unsigned char *)(v4 + 160) = a1;
  return _swift_task_switch(sub_339F0, 0, 0);
}

uint64_t sub_339F0()
{
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  char v4 = *(unsigned char *)(v0 + 160);
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  *(void *)(inited + 32) = 0xD000000000000017;
  *(void *)(inited + 40) = 0x8000000000064A80;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = v4;
  *(void *)(v0 + 96) = sub_3C438(inited);
  sub_269C4(v0 + 96, v2, v1);
  sub_6EA4((void *)(v3 + 16), *(void *)(v3 + 40));
  uint64_t v6 = sub_380EC(*(void *)(v0 + 96));
  *(void *)(v0 + 128) = v6;
  swift_bridgeObjectRelease();
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v7;
  *BOOL v7 = v0;
  v7[1] = sub_33B50;
  return sub_390CC(0xD00000000000002CLL, 0x8000000000064AA0, v6);
}

uint64_t sub_33B50(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_33C9C;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 152) = a1;
    uint64_t v5 = sub_33C80;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_33C80()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 152));
}

uint64_t sub_33C9C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_33D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = sub_60B00();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  return _swift_task_switch(sub_33DC4, 0, 0);
}

uint64_t sub_33DC4()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[13];
  uint64_t v4 = v0[14];
  sub_6EA4((void *)(v0[15] + 16), *(void *)(v0[15] + 40));
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  *(void *)(inited + 32) = 7368801;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v4;
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_3C438(inited);
  v0[19] = v7;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.listen(_:), v3);
  int v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  *int v8 = v0;
  v8[1] = sub_33F34;
  uint64_t v9 = v0[12];
  return sub_389B4(v9, 0xD00000000000002CLL, 0x8000000000064AA0, v7);
}

uint64_t sub_33F34()
{
  uint64_t v2 = *(void *)(*v1 + 144);
  uint64_t v3 = *(void *)(*v1 + 136);
  uint64_t v4 = *(void *)(*v1 + 128);
  uint64_t v5 = *v1;
  *(void *)(v5 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0)
  {
    return _swift_task_switch(sub_352AC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_340F8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_60B00();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return _swift_task_switch(sub_341B8, 0, 0);
}

uint64_t sub_341B8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_6EA4((void *)(v0[3] + 16), *(void *)(v0[3] + 40));
  unint64_t v4 = sub_3C438((uint64_t)_swiftEmptyArrayStorage);
  v0[7] = v4;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  void *v5 = v0;
  v5[1] = sub_342D0;
  uint64_t v6 = v0[2];
  return sub_389B4(v6, 0xD00000000000002ALL, 0x8000000000064BA0, v4);
}

uint64_t sub_342D0()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *v1;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0)
  {
    return _swift_task_switch(sub_34494, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_34494()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_344F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[30] = a7;
  v8[31] = v7;
  v8[28] = a5;
  v8[29] = a6;
  v8[26] = a3;
  v8[27] = a4;
  v8[24] = a1;
  v8[25] = a2;
  uint64_t v9 = sub_60B00();
  v8[32] = v9;
  v8[33] = *(void *)(v9 - 8);
  v8[34] = swift_task_alloc();
  return _swift_task_switch(sub_345C4, 0, 0);
}

uint64_t sub_345C4()
{
  uint64_t v1 = v0[33];
  uint64_t v13 = v0[32];
  uint64_t v14 = v0[34];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[29];
  uint64_t v6 = v0[26];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[25];
  sub_6EA4((void *)(v0[31] + 16), *(void *)(v0[31] + 40));
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 7368801;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(_OWORD *)(inited + 16) = xmmword_62990;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v6;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x7268507473726966;
  *(void *)(inited + 88) = 0xEB00000000657361;
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 104) = v3;
  *(void *)(inited + 120) = &type metadata for String;
  strcpy((char *)(inited + 128), "secondPhrase");
  *(void *)(inited + 168) = &type metadata for String;
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = v4;
  *(void *)(inited + 152) = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_3C438(inited);
  v0[35] = v9;
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v14, enum case for BehaviorAfterSpeaking.listen(_:), v13);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[36] = v10;
  void *v10 = v0;
  v10[1] = sub_347A8;
  uint64_t v11 = v0[24];
  return sub_389B4(v11, 0xD000000000000033, 0x8000000000064B60, v9);
}

uint64_t sub_347A8()
{
  uint64_t v2 = *(void *)(*v1 + 272);
  uint64_t v3 = *(void *)(*v1 + 264);
  uint64_t v4 = *(void *)(*v1 + 256);
  uint64_t v5 = *v1;
  *(void *)(v5 + 296) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0)
  {
    return _swift_task_switch(sub_3496C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_3496C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_349D0(uint64_t a1, double a2)
{
  *(void *)(v3 + 112) = v2;
  *(double *)(v3 + 104) = a2;
  *(void *)(v3 + 96) = a1;
  uint64_t v4 = sub_60B00();
  *(void *)(v3 + 120) = v4;
  *(void *)(v3 + 128) = *(void *)(v4 - 8);
  *(void *)(v3 + 136) = swift_task_alloc();
  return _swift_task_switch(sub_34A98, 0, 0);
}

uint64_t sub_34A98()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[13];
  sub_6EA4((void *)(v0[14] + 16), *(void *)(v0[14] + 40));
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000000064B40;
  *(void *)(inited + 72) = &type metadata for Double;
  *(void *)(inited + 48) = v4;
  unint64_t v6 = sub_3C438(inited);
  v0[18] = v6;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[19] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_34C00;
  uint64_t v8 = v0[12];
  return sub_389B4(v8, 0xD00000000000001DLL, 0x8000000000064B20, v6);
}

uint64_t sub_34C00()
{
  uint64_t v2 = *(void *)(*v1 + 136);
  uint64_t v3 = *(void *)(*v1 + 128);
  uint64_t v4 = *(void *)(*v1 + 120);
  uint64_t v5 = *v1;
  *(void *)(v5 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0)
  {
    return _swift_task_switch(sub_34DC4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_34DC4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_34E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = sub_60B00();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  return _swift_task_switch(sub_34EEC, 0, 0);
}

uint64_t sub_34EEC()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[13];
  uint64_t v4 = v0[14];
  sub_6EA4((void *)(v0[15] + 16), *(void *)(v0[15] + 40));
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  *(void *)(inited + 32) = 0x657361726870;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v4;
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_3C438(inited);
  v0[19] = v7;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_35060;
  uint64_t v9 = v0[12];
  return sub_389B4(v9, 0xD00000000000001FLL, 0x8000000000064B00, v7);
}

uint64_t sub_35060()
{
  uint64_t v2 = *(void *)(*v1 + 144);
  uint64_t v3 = *(void *)(*v1 + 136);
  uint64_t v4 = *(void *)(*v1 + 128);
  uint64_t v5 = *v1;
  *(void *)(v5 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0)
  {
    return _swift_task_switch(sub_35224, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_35224()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CAMDisambiguateCATs()
{
  return self;
}

void sub_352B0()
{
  qword_7A948 = 0x54746E6572727543;
  unk_7A950 = 0xEB000000006B7361;
}

uint64_t sub_352DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_83F0(a3, v5 + 16);
  sub_83F0(a4, v5 + 56);
  *(void *)(v5 + 96) = a1;
  *(void *)(v5 + 104) = a2;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_616D0();
  sub_6D40(v10, (uint64_t)qword_7A9C8);
  uint64_t v11 = sub_616C0();
  os_log_type_t v12 = sub_61960();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "CamErrorFlow: new instance initialised", v13, 2u);
    swift_slowDealloc();
  }

  sub_63E8(a4);
  sub_63E8(a3);
  return v5;
}

uint64_t sub_35400(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[24] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[28] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[29] = v4;
  v2[30] = *(void *)(v4 - 8);
  v2[31] = swift_task_alloc();
  sub_6D90(&qword_77178);
  v2[32] = swift_task_alloc();
  uint64_t v5 = sub_60A40();
  v2[33] = v5;
  v2[34] = *(void *)(v5 - 8);
  v2[35] = swift_task_alloc();
  return _swift_task_switch(sub_35608, 0, 0);
}

uint64_t sub_35608()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  v0[36] = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "CamErrorFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  v0[37] = v5;
  void *v5 = v0;
  v5[1] = sub_35760;
  uint64_t v6 = v0[32];
  return static ErrorTemplates.genericError()(v6);
}

uint64_t sub_35760()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_35E24;
  }
  else
  {
    uint64_t v1 = sub_35878;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_35878()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v14 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v7 = *(void **)(v0 + 184);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v4, v3);
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 56), *(void *)(v0 + 80));
  sub_606D0();
  uint64_t v8 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  sub_608B0();
  sub_6EE8(v0 + 96, (uint64_t *)&unk_78310);
  sub_6EE8(v6, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  uint64_t v9 = v7[5];
  uint64_t v10 = v7[6];
  sub_6EA4(v7 + 2, v9);
  *(void *)(v0 + 160) = v15;
  *(void *)(v0 + 168) = &protocol witness table for AceOutput;
  uint64_t v11 = sub_838C((uint64_t *)(v0 + 136));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(v11, v14, v15);
  os_log_type_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v12;
  void *v12 = v0;
  v12[1] = sub_35ACC;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 136, v9, v10);
}

uint64_t sub_35ACC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_35F78;
  }
  else
  {
    sub_63E8(v2 + 136);
    uint64_t v3 = sub_35BEC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_35BEC()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  sub_6EA4((void *)(v0[23] + 56), *(void *)(v0[23] + 80));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.failed(_:), v3);
  if (qword_75DA0 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[34];
  uint64_t v13 = v0[35];
  uint64_t v5 = v0[30];
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[33];
  uint64_t v10 = v0[29];
  uint64_t v6 = v0[24];
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v13, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_35E24()
{
  uint64_t v1 = v0[32];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[34] + 56))(v1, 1, 1, v0[33]);
  sub_6EE8(v1, &qword_77178);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Failure producing error dialog to present to user.", v4, 2u);
    swift_slowDealloc();
  }

  sub_608F0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_35F78()
{
  sub_63E8((uint64_t)(v0 + 17));
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  sub_6EA4((void *)(v0[23] + 56), *(void *)(v0[23] + 80));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.failed(_:), v3);
  if (qword_75DA0 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[34];
  uint64_t v13 = v0[35];
  uint64_t v5 = v0[30];
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[33];
  uint64_t v10 = v0[29];
  uint64_t v6 = v0[24];
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v13, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_361B8()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CamErrorFlow()
{
  return self;
}

uint64_t sub_36228()
{
  return sub_60550();
}

uint64_t sub_36284(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_35400(a1);
}

uint64_t sub_36320(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CamErrorFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_36358(uint64_t a1)
{
  uint64_t v2 = sub_60C90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_616D0();
  sub_6D40(v7, (uint64_t)qword_7A9C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  uint64_t v8 = sub_616C0();
  os_log_type_t v9 = sub_61960();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    sub_365BC();
    uint64_t v11 = sub_61C90();
    uint64_t v14 = sub_316A4(v11, v12, &v15);
    sub_619C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    _os_log_impl(&dword_0, v8, v9, "CamErrorFlow: on called with %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

  return 0;
}

unint64_t sub_365BC()
{
  unint64_t result = qword_75FF8;
  if (!qword_75FF8)
  {
    sub_60C90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_75FF8);
  }
  return result;
}

uint64_t sub_36614()
{
  return sub_60670();
}

uint64_t sub_36658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v100 = a2;
  uint64_t v3 = sub_6D90(&qword_75FF0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v94 = (uint64_t *)((char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v93 = type metadata accessor for CAMDirectInvocation();
  uint64_t v92 = *(void *)(v93 - 8);
  uint64_t v7 = __chkstk_darwin(v93, v6);
  uint64_t v91 = (uint64_t)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v88 - v10;
  uint64_t v12 = sub_60CF0();
  uint64_t v97 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v13);
  uint64_t v95 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_60D10();
  uint64_t v15 = *(void *)(v99 - 8);
  uint64_t v17 = __chkstk_darwin(v99, v16);
  uint64_t v98 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v88 - v20;
  uint64_t v22 = sub_6D90(&qword_77228);
  __chkstk_darwin(v22 - 8, v23);
  uint64_t v25 = (char *)&v88 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_616D0();
  uint64_t v96 = sub_6D40(v26, (uint64_t)qword_7A9C8);
  uint64_t v27 = sub_616C0();
  os_log_type_t v28 = sub_61960();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v90 = v11;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v89 = v12;
    char v31 = (uint8_t *)v30;
    *(void *)&v106[0] = swift_slowAlloc();
    *(_DWORD *)char v31 = 136315138;
    *(void *)&v104[0] = sub_316A4(0xD000000000000014, 0x8000000000064C30, (uint64_t *)v106);
    sub_619C0();
    _os_log_impl(&dword_0, v27, v28, "%s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v12 = v89;
    swift_slowDealloc();
  }

  sub_60630();
  uint64_t v32 = sub_60640();
  int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v25, 1, v32);
  sub_6EE8((uint64_t)v25, &qword_77228);
  if (v33 != 1)
  {
    sub_60530();
    uint64_t v107 = 0;
    memset(v106, 0, sizeof(v106));
    uint64_t v105 = 0;
    memset(v104, 0, sizeof(v104));
    *(void *)&v106[0] = sub_60520();
LABEL_13:
    sub_60540();
    swift_release();
    sub_605A0();
    return swift_release();
  }
  uint64_t v34 = v15;
  char v35 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v36 = v99;
  v35(v21, a1, v99);
  uint64_t v37 = a1;
  int v38 = sub_4EE54((uint64_t)v21);
  int v39 = *(void (**)(char *, uint64_t))(v34 + 8);
  v39(v21, v36);
  if (v38 != 3)
  {
    sub_606B0();
    sub_60B80();
    uint64_t v43 = type metadata accessor for DefaultCatExecutor();
    uint64_t v44 = swift_allocObject();
    uint64_t v102 = v43;
    uint64_t v103 = &off_72130;
    *(void *)&long long v101 = v44;
    type metadata accessor for RepeatRecentDialogFlow();
    unint64_t v45 = (void *)swift_allocObject();
    uint64_t v46 = sub_70DC((uint64_t)&v101, v43);
    __chkstk_darwin(v46, v46);
    uint64_t v48 = (uint64_t *)((char *)&v88 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v49 + 16))(v48);
    uint64_t v50 = *v48;
    v45[15] = v43;
    v45[16] = &off_72130;
    v45[12] = v50;
    v45[17] = 4;
    sub_6D78(v106, (uint64_t)(v45 + 2));
    sub_6D78(v104, (uint64_t)(v45 + 7));
    v45[18] = sub_4A538;
    v45[19] = 0;
    sub_63E8((uint64_t)&v101);
    *(void *)&v106[0] = v45;
    sub_379CC(&qword_77258, 255, (void (*)(uint64_t))type metadata accessor for RepeatRecentDialogFlow);
    goto LABEL_13;
  }
  if (sub_54E9C(v37) != 3)
  {
    sub_606B0();
    sub_60B80();
    type metadata accessor for DefaultCatExecutor();
    uint64_t v52 = swift_allocObject();
    sub_60600();
    *(void *)&v106[0] = sub_3782C(v106, v104, v52, &v101);
    type metadata accessor for UniversalActionTaskInterruptionFlow();
    sub_379CC(&qword_77250, 255, (void (*)(uint64_t))type metadata accessor for UniversalActionTaskInterruptionFlow);
    sub_60540();
    swift_release();
    sub_605A0();
    return swift_release();
  }
  uint64_t v40 = v98;
  v35(v98, v37, v36);
  if ((*(unsigned int (**)(char *, uint64_t))(v34 + 88))(v40, v36) != enum case for Parse.directInvocation(_:))
  {
    v39(v40, v36);
    goto LABEL_18;
  }
  (*(void (**)(char *, uint64_t))(v34 + 96))(v40, v36);
  uint64_t v41 = v95;
  (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v95, v40, v12);
  uint64_t v42 = v94;
  sub_3B0A8(v94);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v92 + 48))(v42, 1, v93) == 1)
  {
    (*(void (**)(char *, uint64_t))(v97 + 8))(v41, v12);
    sub_6EE8((uint64_t)v42, &qword_75FF0);
LABEL_18:
    unint64_t v53 = sub_616C0();
    os_log_type_t v54 = sub_61970();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      *(void *)&v106[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 136315138;
      *(void *)&v104[0] = sub_316A4(0xD000000000000014, 0x8000000000064C30, (uint64_t *)v106);
      sub_619C0();
      _os_log_impl(&dword_0, v53, v54, "%s: could not find any flow for this parse", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return sub_60590();
  }
  uint64_t v56 = (uint64_t)v90;
  sub_3254C((uint64_t)v42, (uint64_t)v90);
  sub_325B0(v56, v91);
  uint64_t v57 = v12;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v63 = sub_616C0();
      os_log_type_t v64 = sub_61970();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v65 = 0;
        _os_log_impl(&dword_0, v63, v64, "CAMRootFlowPlugin does not offer new flows for .disambiguationResponse DI", v65, 2u);
        swift_slowDealloc();
      }

      sub_60590();
      goto LABEL_28;
    case 2u:
      uint64_t v66 = type metadata accessor for DefaultCatExecutor();
      uint64_t v67 = swift_allocObject();
      sub_60B80();
      sub_60600();
      uint64_t v102 = v66;
      uint64_t v103 = &off_72130;
      *(void *)&long long v101 = v67;
      type metadata accessor for AskRepeatFlow();
      uint64_t v68 = swift_allocObject();
      uint64_t v69 = sub_70DC((uint64_t)&v101, v66);
      __chkstk_darwin(v69, v69);
      uint64_t v71 = v41;
      uint64_t v72 = (uint64_t *)((char *)&v88 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v73 + 16))(v72);
      uint64_t v74 = *v72;
      swift_retain();
      uint64_t v75 = sub_376D4(v74, (uint64_t)v106, (uint64_t)v104, v68, "AskRepeatFlow: new instance initialised");
      sub_63E8((uint64_t)&v101);
      swift_release();
      *(void *)&v106[0] = v75;
      uint64_t v76 = (unint64_t *)&unk_77248;
      uint64_t v77 = type metadata accessor for AskRepeatFlow;
      goto LABEL_30;
    case 3u:
      type metadata accessor for FallbackEntryFlow();
      uint64_t v78 = swift_allocObject();
      *(void *)(v78 + 56) = 0;
      *(_OWORD *)(v78 + 16) = 0u;
      *(_OWORD *)(v78 + 32) = 0u;
      *(_WORD *)(v78 + 48) = 0;
      *(unsigned char *)(v78 + 64) = 7;
      *(void *)&v106[0] = v78;
      sub_379CC(&qword_77238, 255, (void (*)(uint64_t))type metadata accessor for FallbackEntryFlow);
      sub_60540();
      swift_release();
      sub_605A0();
      swift_release();
LABEL_28:
      sub_32614(v56);
      return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v41, v57);
    case 4u:
      uint64_t v79 = type metadata accessor for DefaultCatExecutor();
      uint64_t v80 = swift_allocObject();
      sub_60B80();
      sub_60600();
      uint64_t v102 = v79;
      uint64_t v103 = &off_72130;
      *(void *)&long long v101 = v80;
      type metadata accessor for GiveUpRepeatFlow();
      uint64_t v81 = swift_allocObject();
      uint64_t v82 = sub_70DC((uint64_t)&v101, v79);
      __chkstk_darwin(v82, v82);
      uint64_t v71 = v41;
      uint64_t v84 = (uint64_t *)((char *)&v88 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v85 + 16))(v84);
      uint64_t v86 = *v84;
      swift_retain();
      uint64_t v87 = sub_376D4(v86, (uint64_t)v106, (uint64_t)v104, v81, "GiveUpRepeatFlow new instance initialised");
      sub_63E8((uint64_t)&v101);
      swift_release();
      *(void *)&v106[0] = v87;
      uint64_t v76 = (unint64_t *)&unk_77240;
      uint64_t v77 = type metadata accessor for GiveUpRepeatFlow;
LABEL_30:
      sub_379CC(v76, 255, (void (*)(uint64_t))v77);
      sub_60540();
      swift_release();
      sub_605A0();
      swift_release();
      sub_32614(v56);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v71, v12);
      break;
    default:
      uint64_t v58 = sub_6D90(&qword_76000);
      uint64_t v59 = v91;
      uint64_t v60 = v91 + *(int *)(v58 + 48);
      type metadata accessor for ActionDisambiguationEntryFlow(0);
      swift_allocObject();
      *(void *)&v106[0] = sub_3EA4();
      sub_379CC(&qword_77230, 255, (void (*)(uint64_t))type metadata accessor for ActionDisambiguationEntryFlow);
      sub_60540();
      swift_release();
      sub_605A0();
      swift_release();
      sub_32614(v56);
      (*(void (**)(char *, uint64_t))(v97 + 8))(v41, v57);
      uint64_t v61 = sub_607D0();
      uint64_t v62 = *(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 8);
      v62(v60, v61);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v62)(v59, v61);
      break;
  }
  return result;
}

uint64_t sub_375F8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CAMRootFlowPlugin()
{
  return self;
}

uint64_t sub_3762C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_36658(a1, a2);
}

uint64_t sub_37644@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CAMRootFlowPlugin();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_3768C(uint64_t a1, uint64_t a2)
{
  return sub_379CC(&qword_77220, a2, (void (*)(uint64_t))type metadata accessor for CAMRootFlowPlugin);
}

uint64_t sub_376D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  v15[3] = type metadata accessor for DefaultCatExecutor();
  void v15[4] = &off_72130;
  v15[0] = a1;
  sub_83F0((uint64_t)v15, a4 + 16);
  sub_83F0(a2, a4 + 56);
  sub_83F0(a3, a4 + 96);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_616D0();
  sub_6D40(v10, (uint64_t)qword_7A9C8);
  uint64_t v11 = sub_616C0();
  os_log_type_t v12 = sub_61960();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, a5, v13, 2u);
    swift_slowDealloc();
  }

  sub_63E8(a3);
  sub_63E8(a2);
  sub_63E8((uint64_t)v15);
  return a4;
}

uint64_t sub_3782C(long long *a1, long long *a2, uint64_t a3, long long *a4)
{
  uint64_t v8 = type metadata accessor for DefaultCatExecutor();
  v19[3] = v8;
  v19[4] = &off_72130;
  v19[0] = a3;
  type metadata accessor for UniversalActionTaskInterruptionFlow();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = sub_70DC((uint64_t)v19, v8);
  __chkstk_darwin(v10, v10);
  os_log_type_t v12 = (uint64_t *)((char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = *v12;
  uint64_t v17 = v8;
  uint64_t v18 = &off_72130;
  *(void *)&long long v16 = v14;
  swift_getKeyPath();
  sub_6D90(&qword_77260);
  swift_allocObject();
  *(void *)(v9 + 184) = sub_613C0();
  sub_6D78(a1, v9 + 16);
  sub_6D78(a2, v9 + 56);
  sub_6D78(&v16, v9 + 96);
  *(unsigned char *)(v9 + 176) = 2;
  sub_6D78(a4, v9 + 136);
  sub_63E8((uint64_t)v19);
  return v9;
}

uint64_t sub_379CC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_37A14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_61340();
  *a1 = result;
  return result;
}

uint64_t sub_37A40()
{
  return sub_61350();
}

void *sub_37A6C(uint64_t a1)
{
  uint64_t v3 = sub_6D90(&qword_768E8);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v27 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_60870();
  uint64_t v6 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v7);
  uint64_t v25 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_60A70();
  uint64_t v9 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v10);
  os_log_type_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = _swiftEmptyArrayStorage;
  if (v13)
  {
    v21[1] = v1;
    BOOL v29 = _swiftEmptyArrayStorage;
    sub_3CDEC(0, v13, 0);
    uint64_t v14 = v29;
    v21[2] = v9 + 32;
    uint64_t v22 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    uint64_t v15 = (void **)(a1 + 64);
    uint64_t v23 = v9;
    do
    {
      int64_t v28 = v13;
      long long v16 = *v15;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v17 = v16;
      sub_60850();
      (*v22)(v27, 1, 1, v26);
      [v17 BOOLValue];
      sub_60A50();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v29 = v14;
      unint64_t v19 = v14[2];
      unint64_t v18 = v14[3];
      if (v19 >= v18 >> 1)
      {
        sub_3CDEC(v18 > 1, v19 + 1, 1);
        uint64_t v14 = v29;
      }
      v14[2] = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))((unint64_t)v14+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(void *)(v23 + 72) * v19, v12, v24);
      v15 += 5;
      int64_t v13 = v28 - 1;
    }
    while (v28 != 1);
  }
  return v14;
}

unint64_t sub_37D80(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_6D90(&qword_77350);
    uint64_t v2 = (void *)sub_61B90();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for String;
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
          sub_2D148();
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
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2CDE4(v6, v7);
    sub_2CDE4(v7, v40);
    sub_2CDE4(v40, &v38);
    unint64_t result = sub_3C8A4(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      os_log_type_t v12 = v7;
      int64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      long long v16 = v10;
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
      unint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_63E8((uint64_t)v18);
      unint64_t result = (unint64_t)sub_2CDE4(&v38, v18);
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
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_2CDE4(&v38, (_OWORD *)(v2[7] + 32 * result));
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

uint64_t sub_380EC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_6D90(&qword_77370);
    uint64_t v2 = (void *)sub_61B90();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
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
    sub_32670(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2CDE4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2CDE4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2CDE4(v36, v37);
    sub_2CDE4(v37, &v33);
    uint64_t result = sub_61A20(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_2CDE4(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2D148();
    return (uint64_t)v2;
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

uint64_t sub_384B8(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_3A11C(a1, (uint64_t)sub_3A0C8, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_38544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *v4;
  v5[19] = a4;
  v5[20] = v6;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  return _swift_task_switch(sub_38590, 0, 0);
}

uint64_t sub_38590()
{
  id v10 = self;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = [self bundleForClass:ObjCClassFromMetadata];
  v0[21] = v2;
  NSString v3 = sub_617E0();
  v0[22] = v3;
  Class isa = sub_61790().super.isa;
  v0[23] = isa;
  uint64_t v5 = sub_60770();
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_384B8(v6, v5);
  Class v7 = sub_61790().super.isa;
  v0[24] = v7;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_38794;
  uint64_t v8 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_384B4;
  v0[13] = &unk_721B0;
  v0[14] = v8;
  [v10 execute:v2 catId:v3 parameters:isa globals:v7 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_38794()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    id v2 = sub_38928;
  }
  else {
    id v2 = sub_388A4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_388A4()
{
  uint64_t v1 = *(void **)(v0 + 184);
  NSString v3 = *(void **)(v0 + 168);
  id v2 = *(void **)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 120);

  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v4);
}

uint64_t sub_38928()
{
  uint64_t v1 = (void *)v0[24];
  NSString v3 = (void *)v0[22];
  id v2 = (void *)v0[23];
  uint64_t v4 = (void *)v0[21];
  swift_willThrow();

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_389B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *v4;
  v5[29] = a4;
  v5[30] = v6;
  v5[27] = a2;
  v5[28] = a3;
  v5[26] = a1;
  uint64_t v7 = sub_60B00();
  v5[31] = v7;
  v5[32] = *(void *)(v7 - 8);
  v5[33] = swift_task_alloc();
  return _swift_task_switch(sub_38AA0, 0, 0);
}

uint64_t sub_38AA0()
{
  uint64_t v1 = v0[29];
  sub_6D90(&qword_77368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v3 = sub_3C6B4(inited);
  uint64_t v4 = sub_60770();
  unint64_t v5 = sub_37D80(v3);
  swift_bridgeObjectRelease();
  sub_384B8(v5, v4);
  v0[34] = 0;
  uint64_t v6 = self;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = [self bundleForClass:ObjCClassFromMetadata];
  v0[35] = v8;
  NSString v9 = sub_617E0();
  v0[36] = v9;
  sub_380EC(v1);
  Class isa = sub_61790().super.isa;
  v0[37] = isa;
  swift_bridgeObjectRelease();
  Class v11 = sub_61790().super.isa;
  v0[38] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = CATDefaultMode;
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_38D34;
  uint64_t v13 = swift_continuation_init();
  v0[18] = _NSConcreteStackBlock;
  v0[19] = 0x40000000;
  v0[20] = sub_384B4;
  v0[21] = &unk_72198;
  v0[22] = v13;
  [v6 execute:v8 catId:v9 parameters:isa globals:v11 callback:0 options:v12 completion:v0 + 18];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_38D34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 312) = v1;
  if (v1) {
    id v2 = sub_3902C;
  }
  else {
    id v2 = sub_38E44;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_38E44()
{
  uint64_t v1 = *(void **)(v0 + 296);
  unint64_t v3 = *(void **)(v0 + 280);
  id v2 = *(void **)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 256);
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v6 = *(void **)(v0 + 184);

  id v7 = [v6 print];
  uint64_t v8 = sub_61870();

  id v9 = [v6 speak];
  uint64_t v10 = sub_61870();

  id v11 = [v6 spokenOnly];
  sub_3AB24();
  unint64_t v12 = sub_61870();

  uint64_t v13 = sub_15CB8(v8, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_37A6C((uint64_t)v13);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for BehaviorAfterSpeaking.listen(_:), v16);
  swift_bridgeObjectRetain();
  sub_60A00();

  swift_task_dealloc();
  unint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_3902C()
{
  uint64_t v1 = (void *)v0[38];
  unint64_t v3 = (void *)v0[36];
  id v2 = (void *)v0[37];
  uint64_t v4 = (void *)v0[35];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_390CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  v4[18] = a3;
  v4[19] = v5;
  v4[16] = a1;
  v4[17] = a2;
  return _swift_task_switch(sub_39114, 0, 0);
}

uint64_t sub_39114()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0;
  id v2 = v0 + 10;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_616D0();
  sub_6D40(v3, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_616C0();
  os_log_type_t v5 = sub_61960();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = v1[17];
  if (v6)
  {
    uint64_t v8 = v1[16];
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    v1[10] = sub_316A4(v8, v7, &v19);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v4, v5, "Executing pattern %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = self;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = [self bundleForClass:ObjCClassFromMetadata];
  v1[20] = v12;
  NSString v13 = sub_617E0();
  v1[21] = v13;
  Class isa = sub_61790().super.isa;
  v1[22] = isa;
  sub_60770();
  Class v15 = sub_61790().super.isa;
  v1[23] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = CATDefaultMode;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_3947C;
  uint64_t v17 = swift_continuation_init();
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 0x40000000;
  v1[12] = sub_384B4;
  v1[13] = &unk_72180;
  v1[14] = v17;
  [v10 execute:v12 patternId:v13 parameters:isa globals:v15 callback:0 options:v16 completion:v2];
  return _swift_continuation_await(v1 + 2);
}

uint64_t sub_3947C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    id v2 = sub_39610;
  }
  else {
    id v2 = sub_3958C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3958C()
{
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v3 = *(void **)(v0 + 160);
  id v2 = *(void **)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 120);

  os_log_type_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v4);
}

uint64_t sub_39610()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v3 = (void *)v0[21];
  id v2 = (void *)v0[22];
  uint64_t v4 = (void *)v0[20];
  swift_willThrow();

  os_log_type_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_3969C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_6D90((uint64_t *)&unk_76890);
    uint64_t v5 = swift_allocError();
    *BOOL v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    id v8 = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t type metadata accessor for DefaultCatExecutor()
{
  return self;
}

uint64_t sub_39778(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_6D90(&qword_77350);
  uint64_t v6 = sub_61B80();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
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
                  void *v34 = -1 << v32;
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
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_2CDE4(v24, v35);
      }
      else
      {
        sub_32670((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_61D40();
      sub_61810();
      uint64_t result = sub_61D60();
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
      Class v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *Class v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_2CDE4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_39A78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_6D90(&qword_77378);
  uint64_t result = sub_61B80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    long long v34 = (uint64_t *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v9;
    uint64_t v32 = v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero(v34, 8 * v33);
                }
                else {
                  uint64_t *v34 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      char v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_61D30();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *unint64_t v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_39D30()
{
  uint64_t v1 = v0;
  sub_6D90(&qword_77350);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_61B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_32670(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_2CDE4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

void *sub_39F18()
{
  uint64_t v1 = v0;
  sub_6D90(&qword_77378);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_61B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    int64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *int64_t v22 = v21;
    v22[1] = v20;
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

uint64_t sub_3A0C8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_32670((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;

  return swift_bridgeObjectRetain();
}

uint64_t sub_3A11C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
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
  sub_3A474(&v48);
  uint64_t v12 = *((void *)&v48 + 1);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v48;
  sub_2CDE4(v49, v47);
  unint64_t v14 = *(void **)a5;
  unint64_t v16 = sub_3C8A4(v13, v12);
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
      sub_39D30();
      if (v20) {
        goto LABEL_12;
      }
    }
LABEL_14:
    unint64_t v24 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    int64_t v25 = (uint64_t *)(v24[6] + 16 * v16);
    *int64_t v25 = v13;
    v25[1] = v12;
    sub_2CDE4(v47, (_OWORD *)(v24[7] + 32 * v16));
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
    sub_3A474(&v48);
    for (uint64_t i = *((void *)&v48 + 1); *((void *)&v48 + 1); uint64_t i = *((void *)&v48 + 1))
    {
      uint64_t v31 = v48;
      sub_2CDE4(v49, v47);
      uint64_t v32 = *(void **)a5;
      unint64_t v34 = sub_3C8A4(v31, i);
      uint64_t v35 = v32[2];
      BOOL v36 = (v33 & 1) == 0;
      uint64_t v37 = v35 + v36;
      if (__OFADD__(v35, v36)) {
        goto LABEL_28;
      }
      char v38 = v33;
      if (v32[3] < v37)
      {
        sub_39778(v37, 1);
        unint64_t v39 = sub_3C8A4(v31, i);
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_30;
        }
        unint64_t v34 = v39;
      }
      if (v38)
      {
        sub_32670((uint64_t)v47, (uint64_t)v46);
        sub_63E8((uint64_t)v47);
        swift_bridgeObjectRelease();
        uint64_t v30 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v34);
        sub_63E8((uint64_t)v30);
        sub_2CDE4(v46, v30);
      }
      else
      {
        uint64_t v41 = *(void **)a5;
        *(void *)(*(void *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        uint64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
        *uint64_t v42 = v31;
        v42[1] = i;
        sub_2CDE4(v47, (_OWORD *)(v41[7] + 32 * v34));
        uint64_t v43 = v41[2];
        BOOL v27 = __OFADD__(v43, 1);
        uint64_t v44 = v43 + 1;
        if (v27) {
          goto LABEL_29;
        }
        v41[2] = v44;
      }
      sub_3A474(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2D148();
    return swift_release();
  }
  sub_39778(v19, a4 & 1);
  unint64_t v21 = sub_3C8A4(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    sub_32670((uint64_t)v47, (uint64_t)v46);
    sub_63E8((uint64_t)v47);
    swift_bridgeObjectRelease();
    int64_t v23 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v16);
    sub_63E8((uint64_t)v23);
    sub_2CDE4(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_61CD0();
  __break(1u);
  return result;
}

uint64_t sub_3A474@<X0>(_OWORD *a1@<X8>)
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
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_32670(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
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
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_3AA5C((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_3AAC4((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_3A650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  return _swift_task_switch(sub_3A678, 0, 0);
}

uint64_t sub_3A678()
{
  uint64_t v9 = v0[16];
  uint64_t v1 = self;
  NSString v2 = sub_617E0();
  v0[21] = v2;
  Class isa = sub_61790().super.isa;
  v0[22] = isa;
  uint64_t v4 = sub_60770();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_384B8(v5, v4);
  Class v6 = sub_61790().super.isa;
  v0[23] = v6;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_3A848;
  uint64_t v7 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_384B4;
  v0[13] = &unk_72168;
  v0[14] = v7;
  [v1 execute:v9 catId:v2 parameters:isa globals:v6 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_3A848()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    NSString v2 = sub_3A9D8;
  }
  else {
    NSString v2 = sub_3A958;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3A958()
{
  uint64_t v1 = *(void **)(v0 + 176);
  NSString v2 = *(void **)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 120);

  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_3A9D8()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v3 = (void *)v0[21];
  NSString v2 = (void *)v0[22];
  swift_willThrow();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3AA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_3AAC4(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_77360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_3AB24()
{
  unint64_t result = qword_768D8;
  if (!qword_768D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_768D8);
  }
  return result;
}

id sub_3AB64(uint64_t a1, uint64_t a2, char a3)
{
  NSString v4 = sub_617E0();
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = [(id)swift_getObjCClassFromMetadata() bundleRecordWithBundleIdentifier:v4 allowPlaceholder:a3 & 1 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    sub_602B0();

    swift_willThrow();
  }
  return v5;
}

uint64_t type metadata accessor for CoreServicesProvider()
{
  return self;
}

uint64_t sub_3AC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_60320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_613A0();
  sub_61390();
  sub_61360();
  swift_release();
  uint64_t v9 = sub_61440();
  uint64_t v11 = v10;
  swift_release();
  if (!v11)
  {
    sub_60310();
    uint64_t v9 = sub_60300();
    uint64_t v11 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  sub_3B068();
  swift_bridgeObjectRetain();
  id v13 = sub_3AB64(a1, a2, 0);
  sub_6D90(&qword_78380);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_625B0;
  *(void *)(v14 + 32) = v9;
  *(void *)(v14 + 40) = v11;
  Class isa = sub_61860().super.isa;
  swift_bridgeObjectRelease();
  id v16 = [v13 localizedNameWithPreferredLocalizations:isa];

  uint64_t v17 = sub_617F0();
  return v17;
}

unint64_t sub_3B068()
{
  unint64_t result = qword_77420;
  if (!qword_77420)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_77420);
  }
  return result;
}

uint64_t sub_3B0A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  unint64_t v135 = a1;
  uint64_t v3 = sub_60CF0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v133 = v3;
  uint64_t v134 = v4;
  uint64_t v6 = __chkstk_darwin(v3, v5);
  unint64_t v8 = (char *)v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v12 = (char *)v126 - v11;
  uint64_t v14 = __chkstk_darwin(v10, v13);
  id v16 = (char *)v126 - v15;
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)v126 - v18;
  uint64_t v20 = sub_607D0();
  uint64_t v132 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20, v21);
  uint64_t v131 = (char *)v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v24);
  uint64_t v26 = (char *)v126 - v25;
  uint64_t v27 = sub_60CD0();
  uint64_t v29 = v28;
  if (sub_60C20() == v27 && v30 == v29) {
    goto LABEL_13;
  }
  uint64_t v130 = v20;
  char v31 = sub_61CA0();
  swift_bridgeObjectRelease();
  if ((v31 & 1) == 0)
  {
    if (sub_60C30() == v27 && v36 == v29) {
      goto LABEL_13;
    }
    char v37 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v37) {
      goto LABEL_5;
    }
    if (sub_60C00() == v27 && v38 == v29)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    char v39 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_5;
    }
    if (sub_60C10() == v27 && v40 == v29)
    {
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    char v41 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v41)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_60CE0();
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = v134;
        if (*(void *)(v42 + 16) && (unint64_t v45 = sub_3C8A4(1936750952, 0xE400000000000000), (v46 & 1) != 0))
        {
          sub_32670(*(void *)(v43 + 56) + 32 * v45, (uint64_t)&v136);
          swift_bridgeObjectRelease();
          if (*((void *)&v137 + 1))
          {
            sub_6D90(&qword_77438);
            if (swift_dynamicCast())
            {
              uint64_t v47 = (void *)v138;
              if (*(void *)(v138 + 16) == 2)
              {
                *(void *)&long long v136 = _swiftEmptyArrayStorage;
                sub_3CBEC(0, 2, 0);
                uint64_t v48 = v136;
                uint64_t v49 = v47[4];
                unint64_t v50 = v47[5];
                sub_3CC28(v49, v50);
                sub_3CC28(v49, v50);
                sub_607A0();
                uint64_t v51 = v132;
                sub_2CD8C(v49, v50);
                unint64_t v53 = *(void *)(v48 + 16);
                unint64_t v52 = *(void *)(v48 + 24);
                if (v53 >= v52 >> 1)
                {
                  sub_3CBEC(v52 > 1, v53 + 1, 1);
                  uint64_t v48 = v136;
                }
                *(void *)(v48 + 16) = v53 + 1;
                uint64_t v54 = v51;
                unint64_t v55 = (*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
                uint64_t v134 = *(void *)(v54 + 72);
                unint64_t v56 = v48 + v55 + v134 * v53;
                uint64_t v57 = *(void (**)(unint64_t, char *, uint64_t))(v54 + 32);
                v57(v56, v26, v130);
                uint64_t v58 = v47[6];
                unint64_t v59 = v47[7];
                sub_3CC28(v58, v59);
                sub_3CC28(v58, v59);
                sub_607A0();
                sub_2CD8C(v58, v59);
                *(void *)&long long v136 = v48;
                unint64_t v92 = *(void *)(v48 + 16);
                unint64_t v91 = *(void *)(v48 + 24);
                if (v92 >= v91 >> 1)
                {
                  sub_3CBEC(v91 > 1, v92 + 1, 1);
                  uint64_t v48 = v136;
                }
                *(void *)(v48 + 16) = v92 + 1;
                uint64_t v133 = v48 + v55;
                v57(v48 + v55 + v134 * v92, v26, v130);
                swift_bridgeObjectRelease();
                if (qword_75DE8 != -1) {
                  swift_once();
                }
                uint64_t v93 = sub_616D0();
                uint64_t v129 = sub_6D40(v93, (uint64_t)qword_7A9C8);
                uint64_t v94 = sub_616C0();
                os_log_type_t v95 = sub_61960();
                if (os_log_type_enabled(v94, v95))
                {
                  uint64_t v96 = (uint8_t *)swift_slowAlloc();
                  *(void *)&long long v136 = swift_slowAlloc();
                  *(_DWORD *)uint64_t v96 = 136315138;
                  uint64_t v138 = sub_316A4(0xD000000000000017, 0x8000000000064D30, (uint64_t *)&v136);
                  sub_619C0();
                  _os_log_impl(&dword_0, v94, v95, "%s: CAM outputs DisambiguateTopTwo with hyps:", v96, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }

                swift_bridgeObjectRetain_n();
                uint64_t v97 = sub_616C0();
                LODWORD(v128) = sub_61960();
                if (os_log_type_enabled(v97, (os_log_type_t)v128))
                {
                  uint64_t v98 = swift_slowAlloc();
                  uint64_t v127 = swift_slowAlloc();
                  *(void *)&long long v136 = v127;
                  *(_DWORD *)uint64_t v98 = 136315394;
                  uint64_t v138 = sub_316A4(0xD000000000000017, 0x8000000000064D30, (uint64_t *)&v136);
                  uint64_t result = sub_619C0();
                  *(_WORD *)(v98 + 12) = 2080;
                  if (!*(void *)(v48 + 16)) {
                    goto LABEL_91;
                  }
                  v126[1] = v98 + 14;
                  uint64_t v100 = v131;
                  uint64_t v99 = v132;
                  uint64_t v101 = v130;
                  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))(v131, v133, v130);
                  sub_3CC80();
                  uint64_t v102 = sub_61C90();
                  unint64_t v104 = v103;
                  (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v101);
                  uint64_t v138 = sub_316A4(v102, v104, (uint64_t *)&v136);
                  sub_619C0();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_0, v97, (os_log_type_t)v128, "%s: CAM outputs DisambiguateTopTwo with hyp 1: %s", (uint8_t *)v98, 0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                }
                swift_bridgeObjectRetain_n();
                uint64_t v105 = sub_616C0();
                LODWORD(v129) = sub_61960();
                if (os_log_type_enabled(v105, (os_log_type_t)v129))
                {
                  uint64_t v106 = swift_slowAlloc();
                  uint64_t v128 = swift_slowAlloc();
                  *(void *)&long long v136 = v128;
                  *(_DWORD *)uint64_t v106 = 136315394;
                  uint64_t v138 = sub_316A4(0xD000000000000017, 0x8000000000064D30, (uint64_t *)&v136);
                  uint64_t result = sub_619C0();
                  *(_WORD *)(v106 + 12) = 2080;
                  if (*(void *)(v48 + 16) < 2uLL)
                  {
LABEL_92:
                    __break(1u);
                    return result;
                  }
                  uint64_t v127 = v106 + 14;
                  uint64_t v107 = v131;
                  uint64_t v108 = v132;
                  uint64_t v109 = v130;
                  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))(v131, v133 + v134, v130);
                  sub_3CC80();
                  uint64_t v110 = sub_61C90();
                  unint64_t v112 = v111;
                  (*(void (**)(char *, uint64_t))(v108 + 8))(v107, v109);
                  uint64_t v138 = sub_316A4(v110, v112, (uint64_t *)&v136);
                  sub_619C0();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_0, v105, (os_log_type_t)v129, "%s: CAM outputs DisambiguateTopTwo with hyp 2: %s", (uint8_t *)v106, 0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                }
                uint64_t result = sub_6D90(&qword_76000);
                uint64_t v113 = *(void *)(v48 + 16);
                if (v113)
                {
                  uint64_t v114 = *(int *)(result + 48);
                  uint64_t v115 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v132 + 16);
                  uint64_t result = v115(v135, v133, v130);
                  if (v113 != 1)
                  {
                    uint64_t v116 = v135;
                    v115((uint64_t *)((char *)v135 + v114), v133 + v134, v130);
                    swift_bridgeObjectRelease();
                    uint64_t v80 = type metadata accessor for CAMDirectInvocation();
                    swift_storeEnumTagMultiPayload();
                    uint64_t v69 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56);
                    uint64_t v70 = v116;
                    goto LABEL_79;
                  }
                }
                else
                {
                  __break(1u);
                }
                __break(1u);
LABEL_91:
                __break(1u);
                goto LABEL_92;
              }
              swift_bridgeObjectRelease();
            }
            goto LABEL_31;
          }
        }
        else
        {
          long long v136 = 0u;
          long long v137 = 0u;
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        long long v136 = 0u;
        long long v137 = 0u;
        uint64_t v44 = v134;
      }
      sub_3C844((uint64_t)&v136);
LABEL_31:
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_616D0();
      sub_6D40(v60, (uint64_t)qword_7A9C8);
      uint64_t v61 = v133;
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v19, v2, v133);
      uint64_t v62 = sub_616C0();
      os_log_type_t v63 = sub_61970();
      if (!os_log_type_enabled(v62, v63))
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v61);
        goto LABEL_39;
      }
      os_log_type_t v64 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v136 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v64 = 136315138;
      if (!sub_60CE0()) {
        sub_3C438((uint64_t)_swiftEmptyArrayStorage);
      }
      uint64_t v65 = sub_617B0();
      unint64_t v67 = v66;
      swift_bridgeObjectRelease();
      uint64_t v138 = sub_316A4(v65, v67, (uint64_t *)&v136);
      sub_619C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v134 + 8))(v19, v133);
      swift_arrayDestroy();
      swift_slowDealloc();
LABEL_37:
      swift_slowDealloc();
LABEL_39:

LABEL_40:
      uint64_t v68 = type metadata accessor for CAMDirectInvocation();
      uint64_t v69 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56);
      uint64_t v70 = v135;
      uint64_t v71 = 1;
      return v69(v70, v71, 1, v68);
    }
    if (v27 == 0xD000000000000024 && v29 == 0x8000000000064D00)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v72 = sub_61CA0();
      swift_bridgeObjectRelease();
      if ((v72 & 1) == 0)
      {
        if (qword_75DE8 != -1) {
          swift_once();
        }
        uint64_t v81 = sub_616D0();
        sub_6D40(v81, (uint64_t)qword_7A9C8);
        uint64_t v82 = v134;
        uint64_t v83 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 16);
        uint64_t v84 = v2;
        uint64_t v85 = v133;
        v83(v8, v84, v133);
        uint64_t v86 = sub_616C0();
        os_log_type_t v87 = sub_61970();
        if (os_log_type_enabled(v86, v87))
        {
          uint64_t v88 = (uint8_t *)swift_slowAlloc();
          uint64_t v132 = swift_slowAlloc();
          *(void *)&long long v136 = v132;
          *(_DWORD *)uint64_t v88 = 136315138;
          uint64_t v131 = (char *)(v88 + 4);
          v83(v12, (uint64_t)v8, v85);
          uint64_t v89 = sub_61800();
          uint64_t v138 = sub_316A4(v89, v90, (uint64_t *)&v136);
          sub_619C0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v82 + 8))(v8, v85);
          _os_log_impl(&dword_0, v86, v87, "Couldn't parse direct invocation %s as CAMDirectInvocation", v88, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v82 + 8))(v8, v85);
        }

        goto LABEL_40;
      }
    }
    uint64_t v73 = sub_60CE0();
    if (!v73)
    {
      long long v136 = 0u;
      long long v137 = 0u;
      goto LABEL_83;
    }
    uint64_t v74 = v73;
    if (qword_75DA8 == -1)
    {
      if (*(void *)(v73 + 16))
      {
LABEL_49:
        uint64_t v75 = qword_77430;
        uint64_t v76 = qword_77428;
        swift_bridgeObjectRetain();
        unint64_t v77 = sub_3C8A4(v76, v75);
        if (v78)
        {
          sub_32670(*(void *)(v74 + 56) + 32 * v77, (uint64_t)&v136);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*((void *)&v137 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v79 = v135;
              *unint64_t v135 = v138;
              uint64_t v80 = type metadata accessor for CAMDirectInvocation();
              swift_storeEnumTagMultiPayload();
              uint64_t v69 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56);
              uint64_t v70 = v79;
LABEL_79:
              uint64_t v71 = 0;
              uint64_t v68 = v80;
              return v69(v70, v71, 1, v68);
            }
            goto LABEL_84;
          }
LABEL_83:
          sub_3C844((uint64_t)&v136);
LABEL_84:
          if (qword_75DE8 != -1) {
            swift_once();
          }
          uint64_t v117 = sub_616D0();
          sub_6D40(v117, (uint64_t)qword_7A9C8);
          uint64_t v118 = v134;
          uint64_t v119 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 16);
          uint64_t v120 = v2;
          uint64_t v121 = v133;
          v119(v16, v120, v133);
          uint64_t v62 = sub_616C0();
          os_log_type_t v122 = sub_61970();
          if (!os_log_type_enabled(v62, v122))
          {
            (*(void (**)(char *, uint64_t))(v118 + 8))(v16, v121);
            goto LABEL_39;
          }
          unint64_t v123 = (uint8_t *)swift_slowAlloc();
          uint64_t v132 = swift_slowAlloc();
          *(void *)&long long v136 = v132;
          *(_DWORD *)unint64_t v123 = 136315138;
          uint64_t v131 = (char *)(v123 + 4);
          v119(v12, (uint64_t)v16, v121);
          uint64_t v124 = sub_61800();
          uint64_t v138 = sub_316A4(v124, v125, (uint64_t *)&v136);
          sub_619C0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v118 + 8))(v16, v121);
          _os_log_impl(&dword_0, v62, v122, "Couldn't parse direct invocation %s as CAMDirectInvocation", v123, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          goto LABEL_37;
        }
        long long v136 = 0u;
        long long v137 = 0u;
        swift_bridgeObjectRelease();
LABEL_82:
        swift_bridgeObjectRelease();
        goto LABEL_83;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v74 + 16)) {
        goto LABEL_49;
      }
    }
    long long v136 = 0u;
    long long v137 = 0u;
    goto LABEL_82;
  }
LABEL_5:
  swift_bridgeObjectRelease();
  uint64_t v32 = type metadata accessor for CAMDirectInvocation();
  char v33 = v135;
  swift_storeEnumTagMultiPayload();
  unint64_t v34 = *(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);

  return v34(v33, 0, 1, v32);
}

unint64_t sub_3C438(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6D90(&qword_77350);
  uint64_t v2 = sub_61B90();
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
    sub_1DB7C(v6, (uint64_t)&v15, &qword_77440);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_3C8A4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2CDE4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_3C570(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6D90(&qword_77370);
  uint64_t v2 = sub_61B90();
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
    sub_1DB7C(v6, (uint64_t)v15, &qword_77458);
    unint64_t result = sub_3C91C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_2CDE4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_3C6B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6D90(&qword_77478);
  uint64_t v2 = (void *)sub_61B90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_3C8A4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

void sub_3C7D8()
{
  qword_77428 = 0x7865646E69;
  qword_77430 = 0xE500000000000000;
}

uint64_t type metadata accessor for CAMDirectInvocation()
{
  uint64_t result = qword_77538;
  if (!qword_77538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3C844(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76D10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_3C8A4(uint64_t a1, uint64_t a2)
{
  sub_61D40();
  sub_61810();
  Swift::Int v4 = sub_61D60();

  return sub_3C9A4(a1, a2, v4);
}

unint64_t sub_3C91C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_61A20(*(void *)(v2 + 40));

  return sub_3CA88(a1, v4);
}

unint64_t sub_3C960(uint64_t a1)
{
  uint64_t v2 = sub_61D30();

  return sub_3CB50(a1, v2);
}

unint64_t sub_3C9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_61CA0() & 1) == 0)
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
      while (!v14 && (sub_61CA0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_3CA88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_3DC3C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_61A30();
      sub_3DC98((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_3CB50(uint64_t a1, uint64_t a2)
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

uint64_t sub_3CBEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3CEF8(a1, a2, a3, (void *)*v3, &qword_768B0, (uint64_t (*)(void))&type metadata accessor for PluginAction);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CC28(uint64_t a1, unint64_t a2)
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

unint64_t sub_3CC80()
{
  unint64_t result = qword_75FD8;
  if (!qword_75FD8)
  {
    sub_607D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_75FD8);
  }
  return result;
}

uint64_t sub_3CCD8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3CEF8(a1, a2, a3, (void *)*v3, &qword_774C0, (uint64_t (*)(void))&type metadata accessor for Parse);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CD14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3CEF8(a1, a2, a3, (void *)*v3, &qword_774A0, (uint64_t (*)(void))&type metadata accessor for UsoIdentifier);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CD50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D450(a1, a2, a3, (void *)*v3, &qword_774B8, &qword_76970);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CD80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D7A0(a1, a2, a3, (void *)*v3, &qword_77480, &qword_77488);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CDB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3CEF8(a1, a2, a3, (void *)*v3, &qword_76CF8, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CDEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3CEF8(a1, a2, a3, (void *)*v3, &qword_77460, (uint64_t (*)(void))&type metadata accessor for TemplatingSection);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CE28(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D140(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CE48(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D2E4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_3CE68(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D7A0(a1, a2, a3, (void *)*v3, &qword_77490, &qword_77498);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CE98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D450(a1, a2, a3, (void *)*v3, &qword_774A8, &qword_774B0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CEC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3D7A0(a1, a2, a3, (void *)*v3, &qword_77448, &qword_77450);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3CEF8(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_6D90(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_3D140(char a1, int64_t a2, char a3, void *a4)
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
    sub_6D90(&qword_77468);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_6D90(&qword_77470);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_3D2E4(char a1, int64_t a2, char a3, char *a4)
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
    sub_6D90(&qword_78380);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_3D450(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_6D90(a5);
    unint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_6D90(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_3D5F8(char a1, int64_t a2, char a3, void *a4)
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
    sub_6D90(&qword_76D78);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    sub_6D90(&qword_76D80);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_3D7A0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_6D90(a5);
    unint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = j__malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    sub_6D90(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

unint64_t sub_3D930(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_6D90(&qword_77378);
  uint64_t v3 = (void *)sub_61B90();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_3C960(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    int64_t v10 = (void *)(v3[7] + 16 * result);
    void *v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_3C960(v4);
    unint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

id sub_3DA40(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)SKIDirectInvocationPayload);
  NSString v3 = sub_617E0();
  id v4 = [v2 initWithIdentifier:v3];

  sub_6D90(&qword_768C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  if (qword_75DA8 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_77428;
  uint64_t v13 = qword_77430;
  swift_bridgeObjectRetain();
  sub_61A40();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = a1;
  sub_3C570(inited);
  Class isa = sub_61790().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v4, "setUserData:", isa, v12, v13);

  sub_60D20();
  sub_6EA4(&v12, v14);
  int64_t v7 = (void *)sub_60700();
  sub_63E8((uint64_t)&v12);
  char v8 = self;
  id v9 = [v8 runSiriKitExecutorCommandWithContext:v7 payload:v4];
  id v10 = [v8 wrapCommandInStartLocalRequest:v9];

  return v10;
}

uint64_t sub_3DC3C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_3DC98(uint64_t a1)
{
  return a1;
}

uint64_t *sub_3DCEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_607D0();
      id v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = sub_6D90(&qword_76000);
      v9((uint64_t *)((char *)a1 + *(int *)(v10 + 48)), (uint64_t *)((char *)a2 + *(int *)(v10 + 48)), v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_3DE18(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (!result)
  {
    uint64_t v3 = sub_607D0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v5)((void *)(v3 - 8), a1, v3);
    uint64_t v4 = a1 + *(int *)(sub_6D90(&qword_76000) + 48);
    return v5(v4, v3);
  }
  return result;
}

char *sub_3DED0(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_607D0();
    uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
    v7(a1, a2, v6);
    uint64_t v8 = sub_6D90(&qword_76000);
    v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_3DFB8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_32614((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_607D0();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = sub_6D90(&qword_76000);
      v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *sub_3E0B0(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_607D0();
    uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
    v7(a1, a2, v6);
    uint64_t v8 = sub_6D90(&qword_76000);
    v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_3E198(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_32614((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_607D0();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2, v6);
      uint64_t v8 = sub_6D90(&qword_76000);
      v7(&a1[*(int *)(v8 + 48)], &a2[*(int *)(v8 + 48)], v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_3E290()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[4] = v2;
    v2[5] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_3E334@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_6D90(&qword_75FF0);
  __chkstk_darwin(v6 - 8, v7);
  id v9 = (uint64_t *)((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for CAMDirectInvocation();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (uint64_t *)((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v25 - v17;
  sub_3B0A8(v9);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_3E640((uint64_t)v9);
  }
  else
  {
    sub_3254C((uint64_t)v9, (uint64_t)v18);
    sub_3254C((uint64_t)v18, (uint64_t)v15);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (*v15 == 1)
      {
        uint64_t v23 = sub_607D0();
        uint64_t v24 = *(void *)(v23 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(a3, a2, v23);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(a3, 0, 1, v23);
      }
      if (!*v15)
      {
        uint64_t v19 = sub_607D0();
        uint64_t v20 = *(void *)(v19 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(a3, a1, v19);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(a3, 0, 1, v19);
      }
    }
    else
    {
      sub_32614((uint64_t)v15);
    }
  }
  uint64_t v22 = sub_607D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a3, 1, 1, v22);
}

uint64_t sub_3E640(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_75FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3E6A0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x8000000000063EA0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000014;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "gibberishResponse";
      goto LABEL_8;
    case 2:
      unint64_t v5 = 0xD000000000000010;
      uint64_t v6 = "mitigateSilently";
      goto LABEL_8;
    case 3:
      uint64_t v6 = "networkErrorResponse";
      goto LABEL_8;
    case 4:
      uint64_t v6 = "unknownErrorResponse";
      goto LABEL_8;
    case 5:
      unint64_t v5 = 0xD000000000000013;
      uint64_t v6 = "notUndoableResponse";
      goto LABEL_8;
    case 6:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v6 = "pommesTimeoutResponse";
LABEL_8:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000000063EA0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000011;
      uint64_t v8 = "gibberishResponse";
      goto LABEL_16;
    case 2:
      unint64_t v2 = 0xD000000000000010;
      uint64_t v8 = "mitigateSilently";
      goto LABEL_16;
    case 3:
      uint64_t v8 = "networkErrorResponse";
      goto LABEL_16;
    case 4:
      uint64_t v8 = "unknownErrorResponse";
      goto LABEL_16;
    case 5:
      unint64_t v2 = 0xD000000000000013;
      uint64_t v8 = "notUndoableResponse";
      goto LABEL_16;
    case 6:
      unint64_t v2 = 0xD000000000000015;
      uint64_t v8 = "pommesTimeoutResponse";
LABEL_16:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_61CA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_3E864()
{
  sub_61810();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_3E954()
{
  return sub_61D60();
}

void sub_3EA60()
{
  qword_7A958 = 0x724573656D6D6F70;
  qword_7A960 = 0xEB00000000726F72;
}

void sub_3EA8C()
{
  BYTE5(qword_7A970) = 0;
  HIWORD(qword_7A970) = -5120;
}

void sub_3EAB8()
{
  HIBYTE(qword_7A980) = -18;
}

void sub_3EAE8()
{
  qword_7A988 = 0x74636E756A6E6F63;
  qword_7A990 = 0xEF6F666E496E6F69;
}

void sub_3EB18()
{
  qword_7A998 = 0x746C757365526F6ELL;
  unk_7A9A0 = 0xE900000000000073;
}

void sub_3EB40()
{
  qword_7A9A8 = 0x616D6F446F666E69;
  unk_7A9B0 = 0xEF65737261506E69;
}

unint64_t sub_3EB70(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_3EC2C(unsigned __int8 *a1, char *a2)
{
  return sub_3E6A0(*a1, *a2);
}

Swift::Int sub_3EC38()
{
  return sub_3E954();
}

uint64_t sub_3EC44()
{
  return sub_3E864();
}

Swift::Int sub_3EC4C()
{
  return sub_3E954();
}

uint64_t sub_3EC54@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_423A8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_3EC84@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_3EB70(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_3ECB0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_6D90(&qword_75FF0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v114 = (uint64_t *)((char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for CAMDirectInvocation();
  uint64_t v103 = *(void *)(v7 - 8);
  uint64_t v104 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v101 = (uint64_t)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  uint64_t v102 = (uint64_t)&v97 - v12;
  uint64_t v13 = sub_60D10();
  uint64_t v112 = *(void *)(v13 - 8);
  uint64_t v113 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_60CF0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v105 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_60C90();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v24 = __chkstk_darwin(v21, v23);
  uint64_t v110 = (char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24, v26);
  uint64_t v28 = (char *)&v97 - v27;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_616D0();
  uint64_t v30 = sub_6D40(v29, (uint64_t)qword_7A9C8);
  char v31 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v115 = a1;
  uint64_t v108 = v31;
  uint64_t v109 = v22 + 16;
  v31(v28, a1, v21);
  uint64_t v111 = v30;
  uint64_t v32 = sub_616C0();
  os_log_type_t v33 = sub_61960();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v107 = v22;
  if (v34)
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v99 = v2;
    uint64_t v36 = (uint8_t *)v35;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v98 = v18;
    *(void *)&long long v118 = v37;
    uint64_t v100 = v17;
    *(_DWORD *)uint64_t v36 = 136315138;
    uint64_t v106 = (void (*)(char *, uint64_t))(v36 + 4);
    sub_4245C((unint64_t *)&qword_75FF8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v38 = sub_61C90();
    uint64_t v116 = sub_316A4(v38, v39, (uint64_t *)&v118);
    uint64_t v17 = v100;
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v106 = *(void (**)(char *, uint64_t))(v22 + 8);
    v106(v28, v21);
    _os_log_impl(&dword_0, v32, v33, "FallbackEntryFlow: on called with %s", v36, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v98;
    swift_slowDealloc();
    uint64_t v2 = v99;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v106 = *(void (**)(char *, uint64_t))(v22 + 8);
    v106(v28, v21);
  }

  uint64_t v40 = v21;
  uint64_t v41 = v115;
  sub_60C80();
  uint64_t v43 = v112;
  uint64_t v42 = v113;
  int v44 = (*(uint64_t (**)(char *, uint64_t))(v112 + 88))(v16, v113);
  unint64_t v45 = v114;
  if (v44 != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v42);
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v43 + 96))(v16, v42);
  char v46 = v105;
  (*(void (**)(void))(v18 + 32))();
  sub_3B0A8(v45);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v103 + 48))(v45, 1, v104) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v46, v17);
    sub_6EE8((uint64_t)v45, &qword_75FF0);
LABEL_10:
    uint64_t v47 = v110;
    v108(v110, v41, v40);
    uint64_t v48 = sub_616C0();
    os_log_type_t v49 = sub_61970();
    if (os_log_type_enabled(v48, v49))
    {
      unint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v118 = swift_slowAlloc();
      *(_DWORD *)unint64_t v50 = 136315138;
      sub_4245C((unint64_t *)&qword_75FF8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v51 = sub_61C90();
      uint64_t v116 = sub_316A4(v51, v52, (uint64_t *)&v118);
      sub_619C0();
      swift_bridgeObjectRelease();
      v106(v47, v40);
      _os_log_impl(&dword_0, v48, v49, "FallbackEntryFlow called with unexpected input %s", v50, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v106(v47, v40);
    }

    return 0;
  }
  uint64_t v54 = v102;
  sub_3254C((uint64_t)v45, v102);
  uint64_t v55 = v54;
  uint64_t v56 = v101;
  sub_325B0(v55, v101);
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    sub_32614(v102);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v46, v17);
    sub_32614(v56);
    goto LABEL_10;
  }
  sub_32614(v56);
  uint64_t v57 = sub_60CE0();
  if (v57)
  {
    uint64_t v58 = v57;
    if (qword_75DB0 == -1)
    {
      if (*(void *)(v57 + 16)) {
        goto LABEL_18;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v58 + 16))
      {
LABEL_18:
        uint64_t v59 = v18;
        uint64_t v60 = qword_7A960;
        uint64_t v61 = qword_7A958;
        swift_bridgeObjectRetain();
        unint64_t v62 = sub_3C8A4(v61, v60);
        if (v63)
        {
          sub_32670(*(void *)(v58 + 56) + 32 * v62, (uint64_t)&v118);
        }
        else
        {
          long long v118 = 0u;
          long long v119 = 0u;
        }
        swift_bridgeObjectRelease();
        uint64_t v18 = v59;
        if (*((void *)&v119 + 1))
        {
          int v64 = swift_dynamicCast();
          uint64_t v65 = v116;
          unint64_t v66 = v117;
          if (!v64)
          {
            uint64_t v65 = 0;
            unint64_t v66 = 0;
          }
LABEL_28:
          *(void *)(v2 + 16) = v65;
          *(void *)(v2 + 24) = v66;
          swift_bridgeObjectRelease();
          uint64_t v67 = *(void *)(v58 + 16);
          if (v67)
          {
            unint64_t v68 = sub_3C8A4(0xD000000000000012, 0x8000000000064D90);
            if (v69)
            {
              sub_32670(*(void *)(v58 + 56) + 32 * v68, (uint64_t)&v118);
              int v70 = swift_dynamicCast();
              uint64_t v67 = v116;
              unint64_t v71 = v117;
              if (!v70)
              {
                uint64_t v67 = 0;
                unint64_t v71 = 0;
              }
LABEL_34:
              *(void *)(v2 + 32) = v67;
              *(void *)(v2 + 40) = v71;
              swift_bridgeObjectRelease();
              if (qword_75DB8 == -1)
              {
                if (*(void *)(v58 + 16)) {
                  goto LABEL_36;
                }
              }
              else
              {
                swift_once();
                if (*(void *)(v58 + 16))
                {
LABEL_36:
                  uint64_t v72 = v18;
                  uint64_t v73 = qword_7A970;
                  uint64_t v74 = qword_7A968;
                  swift_bridgeObjectRetain();
                  unint64_t v75 = sub_3C8A4(v74, v73);
                  if (v76)
                  {
                    sub_32670(*(void *)(v58 + 56) + 32 * v75, (uint64_t)&v118);
                  }
                  else
                  {
                    long long v118 = 0u;
                    long long v119 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v18 = v72;
                  if (*((void *)&v119 + 1))
                  {
                    if (swift_dynamicCast())
                    {
                      char v77 = v116;
                      goto LABEL_46;
                    }
LABEL_45:
                    char v77 = 0;
LABEL_46:
                    *(unsigned char *)(v2 + 48) = v77;
                    if (qword_75DC0 == -1)
                    {
                      if (*(void *)(v58 + 16)) {
                        goto LABEL_48;
                      }
                    }
                    else
                    {
                      swift_once();
                      if (*(void *)(v58 + 16))
                      {
LABEL_48:
                        uint64_t v78 = v18;
                        uint64_t v79 = qword_7A980;
                        uint64_t v80 = qword_7A978;
                        swift_bridgeObjectRetain();
                        unint64_t v81 = sub_3C8A4(v80, v79);
                        if (v82)
                        {
                          sub_32670(*(void *)(v58 + 56) + 32 * v81, (uint64_t)&v118);
                        }
                        else
                        {
                          long long v118 = 0u;
                          long long v119 = 0u;
                        }
                        swift_bridgeObjectRelease();
                        uint64_t v18 = v78;
                        if (*((void *)&v119 + 1))
                        {
                          if (swift_dynamicCast())
                          {
                            char v83 = v116;
                            goto LABEL_58;
                          }
LABEL_57:
                          char v83 = 0;
LABEL_58:
                          *(unsigned char *)(v2 + 49) = v83;
                          if (qword_75DC8 == -1)
                          {
                            if (*(void *)(v58 + 16))
                            {
LABEL_60:
                              uint64_t v84 = v18;
                              uint64_t v85 = qword_7A990;
                              uint64_t v86 = qword_7A988;
                              swift_bridgeObjectRetain();
                              unint64_t v87 = sub_3C8A4(v86, v85);
                              if (v88)
                              {
                                sub_32670(*(void *)(v58 + 56) + 32 * v87, (uint64_t)&v118);
                              }
                              else
                              {
                                long long v118 = 0u;
                                long long v119 = 0u;
                              }
                              swift_bridgeObjectRelease();
                              uint64_t v18 = v84;
LABEL_66:
                              swift_bridgeObjectRelease();
                              if (*((void *)&v119 + 1))
                              {
                                if (swift_dynamicCast())
                                {
                                  uint64_t v89 = v18;
                                  uint64_t v90 = v116;
                                  unint64_t v91 = v117;
                                  sub_60270();
                                  swift_allocObject();
                                  sub_60260();
                                  sub_61550();
                                  sub_4245C(&qword_77788, 255, (void (*)(uint64_t))&type metadata accessor for RequestConjunctionInfo);
                                  sub_60250();
                                  sub_2CD8C(v90, v91);
                                  swift_release();
                                  unint64_t v92 = *(void **)(v2 + 56);
                                  *(void *)(v2 + 56) = v118;

                                  uint64_t v18 = v89;
                                }
                              }
                              else
                              {
                                sub_6EE8((uint64_t)&v118, &qword_76D10);
                              }
                              goto LABEL_70;
                            }
                          }
                          else
                          {
                            swift_once();
                            if (*(void *)(v58 + 16)) {
                              goto LABEL_60;
                            }
                          }
                          long long v118 = 0u;
                          long long v119 = 0u;
                          goto LABEL_66;
                        }
LABEL_56:
                        sub_6EE8((uint64_t)&v118, &qword_76D10);
                        goto LABEL_57;
                      }
                    }
                    long long v118 = 0u;
                    long long v119 = 0u;
                    goto LABEL_56;
                  }
LABEL_44:
                  sub_6EE8((uint64_t)&v118, &qword_76D10);
                  goto LABEL_45;
                }
              }
              long long v118 = 0u;
              long long v119 = 0u;
              goto LABEL_44;
            }
            uint64_t v67 = 0;
          }
          unint64_t v71 = 0;
          goto LABEL_34;
        }
LABEL_27:
        sub_6EE8((uint64_t)&v118, &qword_76D10);
        uint64_t v65 = 0;
        unint64_t v66 = 0;
        goto LABEL_28;
      }
    }
    long long v118 = 0u;
    long long v119 = 0u;
    goto LABEL_27;
  }
LABEL_70:
  uint64_t v93 = v18;
  *(unsigned char *)(v2 + 64) = sub_3FA70();
  uint64_t v94 = sub_616C0();
  os_log_type_t v95 = sub_61960();
  if (os_log_type_enabled(v94, v95))
  {
    uint64_t v96 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v96 = 0;
    _os_log_impl(&dword_0, v94, v95, "FallbackEntryFlow: input accepted", v96, 2u);
    swift_slowDealloc();
  }

  sub_32614(v102);
  (*(void (**)(char *, uint64_t))(v93 + 8))(v46, v17);
  return 1;
}

uint64_t sub_3FA70()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_61400();
  uint64_t v95 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  uint64_t v89 = (char *)v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_6D90(&qword_77760);
  __chkstk_darwin(v92, v5);
  uint64_t v7 = (char *)v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6D90(&qword_77768);
  uint64_t v10 = __chkstk_darwin(v8 - 8, v9);
  uint64_t v90 = (uint64_t)v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v96 = (uint64_t)v85 - v14;
  __chkstk_darwin(v13, v15);
  uint64_t v94 = (char *)v85 - v16;
  uint64_t v17 = sub_61460();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_616D0();
  uint64_t v23 = sub_6D40(v22, (uint64_t)qword_7A9C8);
  uint64_t v24 = sub_616C0();
  os_log_type_t v25 = sub_61960();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_0, v24, v25, "FallbackEntryFlow: evalExecutionDecision", v26, 2u);
    swift_slowDealloc();
  }

  if (*(unsigned char *)(v1 + 48) == 1)
  {
    uint64_t v27 = sub_616C0();
    os_log_type_t v28 = sub_61960();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = 2;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_0, v27, v28, "FallbackEntryFlow: emptyNLInput == true", v30, 2u);
      swift_slowDealloc();

      return v29;
    }

    return 2;
  }
  uint64_t v86 = v7;
  uint64_t v91 = v1;
  uint64_t v87 = sub_613A0();
  sub_61390();
  uint64_t v31 = sub_61380();
  swift_release();
  uint64_t v93 = v31;
  swift_retain_n();
  uint64_t v32 = sub_616C0();
  os_log_type_t v33 = sub_61960();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v88 = v2;
  if (v34)
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v85[1] = v23;
    uint64_t v97 = v36;
    *(_DWORD *)uint64_t v35 = 67109378;
    LOBYTE(v99) = sub_61450() & 1;
    LODWORD(v99) = v99;
    sub_619C0();
    *(_WORD *)(v35 + 8) = 2080;
    v85[0] = v35 + 10;
    sub_61470();
    sub_4245C(&qword_77780, 255, (void (*)(uint64_t))&type metadata accessor for NetworkAvailability.Status);
    uint64_t v37 = sub_61C90();
    unint64_t v39 = v38;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    uint64_t v99 = sub_316A4(v37, v39, &v97);
    sub_619C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v32, v33, "FallbackEntryFlow network states: isInAirplaneMode: %{BOOL}d networkAvailabilityProvider.status: %s", (uint8_t *)v35, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v40 = v91;
  swift_retain_n();
  uint64_t v41 = sub_616C0();
  os_log_type_t v42 = sub_61960();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315394;
    uint64_t v44 = *(void *)(v40 + 40);
    uint64_t v97 = *(void *)(v40 + 32);
    uint64_t v98 = v44;
    swift_bridgeObjectRetain();
    sub_6D90(&qword_77778);
    uint64_t v45 = sub_61800();
    uint64_t v97 = sub_316A4(v45, v46, &v99);
    sub_619C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    uint64_t v47 = *(void *)(v40 + 24);
    uint64_t v97 = *(void *)(v40 + 16);
    uint64_t v98 = v47;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_61800();
    uint64_t v97 = sub_316A4(v48, v49, &v99);
    sub_619C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v41, v42, "FallbackEntryFlow: pommesSearchReason = %s pommesError = %s", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v50 = v88;
  uint64_t v52 = (uint64_t)v94;
  uint64_t v51 = v95;
  uint64_t v53 = v96;
  uint64_t v54 = sub_61370();
  swift_release();
  if (!v54)
  {
    uint64_t v55 = sub_616C0();
    os_log_type_t v56 = sub_61960();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_0, v55, v56, "SiriEnvironment.forCurrentTask is nil", v57, 2u);
      swift_slowDealloc();
    }
  }
  if (*(unsigned char *)(v40 + 49) != 1)
  {
    if (sub_61370())
    {
      sub_61340();
      swift_release();
      sub_61560();
      swift_release();
      uint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56);
      v65(v52, 0, 1, v50);
    }
    else
    {
      uint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56);
      v65(v52, 1, 1, v50);
    }
    (*(void (**)(uint64_t, void, uint64_t))(v51 + 104))(v53, enum case for InputOrigin.magusFollowup(_:), v50);
    v65(v53, 0, 1, v50);
    uint64_t v66 = (uint64_t)v86;
    uint64_t v67 = (uint64_t)&v86[*(int *)(v92 + 48)];
    sub_423F4(v52, (uint64_t)v86);
    sub_423F4(v53, v67);
    unint64_t v68 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
    if (v68(v66, 1, v50) == 1)
    {
      sub_6EE8(v53, &qword_77768);
      sub_6EE8(v52, &qword_77768);
      if (v68(v67, 1, v50) == 1)
      {
        sub_6EE8((uint64_t)v86, &qword_77768);
LABEL_46:
        char v82 = sub_616C0();
        os_log_type_t v83 = sub_61960();
        if (os_log_type_enabled(v82, v83))
        {
          uint64_t v84 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v84 = 0;
          _os_log_impl(&dword_0, v82, v83, "FallbackEntryFlow: inputOrigin == magusFollowup", v84, 2u);
          swift_slowDealloc();
        }

        uint64_t v73 = sub_409C0(v93);
LABEL_49:
        uint64_t v29 = v73;
        swift_release();
        return v29;
      }
    }
    else
    {
      uint64_t v69 = v90;
      sub_423F4(v66, v90);
      if (v68(v67, 1, v50) != 1)
      {
        uint64_t v80 = v89;
        (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v89, v67, v50);
        sub_4245C(&qword_77770, 255, (void (*)(uint64_t))&type metadata accessor for InputOrigin);
        LODWORD(v95) = sub_617D0();
        unint64_t v81 = *(void (**)(char *, uint64_t))(v51 + 8);
        v81(v80, v50);
        sub_6EE8(v96, &qword_77768);
        sub_6EE8(v52, &qword_77768);
        v81((char *)v69, v50);
        sub_6EE8(v66, &qword_77768);
        if (v95) {
          goto LABEL_46;
        }
LABEL_35:
        int v70 = sub_616C0();
        os_log_type_t v71 = sub_61960();
        if (os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v72 = 0;
          _os_log_impl(&dword_0, v70, v71, "FallbackEntryFlow: inputOrigin != magusFollowup", v72, 2u);
          swift_slowDealloc();
        }

        uint64_t v73 = sub_407C4(v93);
        goto LABEL_49;
      }
      sub_6EE8(v96, &qword_77768);
      sub_6EE8(v52, &qword_77768);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v69, v50);
    }
    sub_6EE8((uint64_t)v86, &qword_77760);
    goto LABEL_35;
  }
  uint64_t v58 = *(void **)(v40 + 56);
  if (!v58) {
    goto LABEL_39;
  }
  id v59 = v58;
  unint64_t v60 = sub_61540();
  uint64_t result = sub_61530();
  if (result)
  {
    if (v60 < result - 1)
    {
      unint64_t v62 = sub_616C0();
      os_log_type_t v63 = sub_61960();
      if (os_log_type_enabled(v62, v63))
      {
        int v64 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v64 = 0;
        _os_log_impl(&dword_0, v62, v63, "FallbackEntryFlow: unhandled undo not final request, mitigating silently", v64, 2u);
        swift_slowDealloc();
        swift_release();

        return 2;
      }

      swift_release();
      return 2;
    }

LABEL_39:
    uint64_t v74 = sub_616C0();
    os_log_type_t v75 = sub_61960();
    if (os_log_type_enabled(v74, v75))
    {
      char v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v76 = 0;
      _os_log_impl(&dword_0, v74, v75, "FallbackEntryFlow: missing conjunctionInfo", v76, 2u);
      swift_slowDealloc();
    }

    char v77 = sub_616C0();
    os_log_type_t v78 = sub_61960();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v79 = 0;
      _os_log_impl(&dword_0, v77, v78, "FallbackEntryFlow: unhandled undo request", v79, 2u);
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release();
    }
    return 5;
  }
  __break(1u);
  return result;
}

uint64_t sub_407C4(uint64_t a1)
{
  uint64_t v2 = v1[5];
  if (!(v1[3] | v2))
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_616D0();
    sub_6D40(v3, (uint64_t)qword_7A9C8);
    uint64_t v4 = sub_616C0();
    os_log_type_t v5 = sub_61960();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "FallbackEntryFlow: No pommes signals, returning gibberishResponse", v6, 2u);
      swift_slowDealloc();
    }

    return 1;
  }
  uint64_t v9 = v1[4];
  uint64_t v10 = qword_75DD8;
  swift_bridgeObjectRetain();
  if (v10 == -1)
  {
    if (v2) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v13 = v1[5];
    if (!v13 || (v1[4] != 0xD000000000000016 || v13 != 0x8000000000064E30) && (sub_61CA0() & 1) == 0) {
      return 1;
    }
    goto LABEL_21;
  }
  swift_once();
  if (!v2) {
    goto LABEL_15;
  }
LABEL_10:
  if (v9 == qword_7A9A8 && v2 == unk_7A9B0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  char v12 = sub_61CA0();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_21:

  return sub_40BA8(a1, 0);
}

uint64_t sub_409C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v5 = qword_75DD8;
  swift_bridgeObjectRetain();
  if (v5 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v8 = *(void *)(v1 + 40);
    if (!v8 || (*(void *)(v1 + 32) != 0xD000000000000016 || v8 != 0x8000000000064E30) && (sub_61CA0() & 1) == 0)
    {
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_616D0();
      sub_6D40(v9, (uint64_t)qword_7A9C8);
      uint64_t v10 = sub_616C0();
      os_log_type_t v11 = sub_61960();
      if (os_log_type_enabled(v10, v11))
      {
        char v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v12 = 0;
        _os_log_impl(&dword_0, v10, v11, "FallbackEntryFlow: mitigateSilently", v12, 2u);
        swift_slowDealloc();
      }

      return 2;
    }
    goto LABEL_18;
  }
  swift_once();
  if (!v3) {
    goto LABEL_8;
  }
LABEL_3:
  if (v4 == qword_7A9A8 && v3 == unk_7A9B0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v7 = sub_61CA0();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_18:

  return sub_40BA8(a1, 1);
}

uint64_t sub_40BA8(uint64_t a1, int a2)
{
  int v41 = a2;
  uint64_t v2 = sub_61510();
  uint64_t v43 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  os_log_type_t v42 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_61460();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v39 - v12;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_616D0();
  sub_6D40(v14, (uint64_t)qword_7A9C8);
  uint64_t v15 = sub_616C0();
  os_log_type_t v16 = sub_61960();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = v10;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, v16, "FallbackEntryFlow: explicit pegasus call", v17, 2u);
    uint64_t v10 = v40;
    swift_slowDealloc();
  }

  if (sub_61450()) {
    return 0;
  }
  sub_61470();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v10, enum case for NetworkAvailability.Status.available(_:), v5);
  sub_4245C(&qword_77758, 255, (void (*)(uint64_t))&type metadata accessor for NetworkAvailability.Status);
  char v19 = sub_617D0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v10, v5);
  v20(v13, v5);
  if ((v19 & 1) == 0) {
    return 3;
  }
  uint64_t v22 = *(void *)(v44 + 16);
  uint64_t v21 = *(void *)(v44 + 24);
  uint64_t v23 = qword_75DD0;
  swift_bridgeObjectRetain();
  if (v23 == -1)
  {
    if (!v21) {
      goto LABEL_23;
    }
  }
  else
  {
    swift_once();
    if (!v21) {
      goto LABEL_23;
    }
  }
  if (v22 == qword_7A998 && v21 == unk_7A9A0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v24 = sub_61CA0();
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
  {
LABEL_23:
    uint64_t v30 = v43;
    uint64_t v32 = *(void *)(v44 + 16);
    uint64_t v31 = *(void *)(v44 + 24);
    os_log_type_t v33 = v42;
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v42, enum case for PommesError.timedOut(_:), v2);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_61500();
    uint64_t v36 = v35;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v2);
    if (v31)
    {
      if (v32 == v34 && v31 == v36)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 6;
      }
      char v37 = sub_61CA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v37) {
        return 6;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return 4;
  }
LABEL_15:
  os_log_type_t v25 = sub_616C0();
  os_log_type_t v26 = sub_61960();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v41)
  {
    if (v27)
    {
      uint64_t v18 = 2;
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v28 = 0;
      _os_log_impl(&dword_0, v25, v26, "no pommes results on FF so mitigate silently", v28, 2u);
      swift_slowDealloc();
    }
    else
    {

      return 2;
    }
  }
  else
  {
    if (v27)
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_0, v25, v26, "no pommes results on initial input so render gibberish", v29, 2u);
      swift_slowDealloc();
    }

    return 1;
  }
  return v18;
}

uint64_t sub_410FC(uint64_t a1)
{
  v2[24] = a1;
  v2[25] = v1;
  uint64_t v3 = sub_61510();
  v2[26] = v3;
  v2[27] = *(void *)(v3 - 8);
  v2[28] = swift_task_alloc();
  return _swift_task_switch(sub_411BC, 0, 0);
}

uint64_t sub_411BC()
{
  uint64_t v58 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v52 = v0 + 96;
  uint64_t v53 = v0 + 56;
  uint64_t v54 = v0 + 16;
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_retain_n();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 200);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    *(unsigned char *)(v0 + 232) = *(unsigned char *)(v5 + 64);
    sub_6D90(&qword_77750);
    uint64_t v7 = sub_61800();
    *(void *)(v0 + 184) = sub_316A4(v7, v8, &v56);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_0, v2, v3, "FallbackEntryFlow: execute called with decision %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v9 = *(void *)(v0 + 200);
  switch(*(unsigned char *)(v9 + 64))
  {
    case 1:
      uint64_t v18 = type metadata accessor for DefaultCatExecutor();
      uint64_t v19 = swift_allocObject();
      sub_60B80();
      sub_60600();
      sub_614F0();
      swift_allocObject();
      uint64_t v20 = sub_614E0();
      *(void *)(v0 + 40) = v18;
      *(void *)(v0 + 48) = &off_72130;
      *(void *)(v0 + 16) = v19;
      type metadata accessor for GibberishFlow();
      uint64_t v21 = swift_allocObject();
      uint64_t v22 = sub_70DC(v54, v18);
      uint64_t v23 = *(void *)(v18 - 8);
      char v24 = (uint64_t *)swift_task_alloc();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v23 + 16))(v24, v22, v18);
      uint64_t v25 = *v24;
      swift_retain();
      uint64_t v26 = sub_42238(v25, (uint64_t)v55, (uint64_t)&v56, v20, v21);
      sub_63E8(v54);
      swift_release();
      swift_task_dealloc();
      *(void *)(v0 + 160) = v26;
      sub_4245C(&qword_77740, 255, (void (*)(uint64_t))type metadata accessor for GibberishFlow);
      goto LABEL_20;
    case 2:
    case 5:
      sub_608F0();
      goto LABEL_22;
    case 3:
      uint64_t v27 = type metadata accessor for DefaultCatExecutor();
      uint64_t v28 = swift_allocObject();
      sub_60B80();
      sub_60600();
      *(void *)(v0 + 120) = v27;
      *(void *)(v0 + 128) = &off_72130;
      *(void *)(v0 + 96) = v28;
      type metadata accessor for NetworkUnavailableFlow();
      uint64_t v29 = swift_allocObject();
      uint64_t v30 = sub_70DC(v52, v27);
      uint64_t v31 = *(void *)(v27 - 8);
      uint64_t v32 = (uint64_t *)swift_task_alloc();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v31 + 16))(v32, v30, v27);
      uint64_t v33 = *v32;
      swift_retain();
      uint64_t v34 = sub_376D4(v33, (uint64_t)v55, (uint64_t)&v56, v29, "NetworkUnavailableFlow new instance initialised");
      sub_63E8(v52);
      swift_release();
      swift_task_dealloc();
      *(void *)(v0 + 144) = v34;
      sub_4245C(&qword_77738, 255, (void (*)(uint64_t))type metadata accessor for NetworkUnavailableFlow);
      sub_608D0();
      goto LABEL_21;
    case 4:
      uint64_t v35 = *(void **)(v9 + 24);
      if (v35)
      {
        uint64_t v36 = *(void *)(v9 + 16);
        uint64_t v56 = 0;
        unint64_t v57 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_61A70(27);
        swift_bridgeObjectRelease();
        uint64_t v56 = 0xD000000000000019;
        unint64_t v57 = 0x8000000000064E10;
        v60._countAndFlagsBits = v36;
        v60._object = v35;
        sub_61820(v60);
        swift_bridgeObjectRelease();
        uint64_t v38 = v56;
        uint64_t v37 = v57;
      }
      else
      {
        uint64_t v38 = 0xD000000000000015;
        uint64_t v37 = 0x8000000000064DF0;
      }
      sub_60B80();
      sub_60600();
      type metadata accessor for CamErrorFlow();
      swift_allocObject();
      *(void *)(v0 + 168) = sub_352DC(v38, v37, (uint64_t)v55, (uint64_t)&v56);
      sub_4245C((unint64_t *)&qword_78370, 255, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
      goto LABEL_20;
    case 6:
      uint64_t v40 = *(void *)(v0 + 216);
      uint64_t v39 = *(void *)(v0 + 224);
      uint64_t v41 = *(void *)(v0 + 208);
      uint64_t v56 = 0;
      unint64_t v57 = 0xE000000000000000;
      sub_61A70(27);
      swift_bridgeObjectRelease();
      uint64_t v56 = 0xD000000000000019;
      unint64_t v57 = 0x8000000000064E10;
      (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v39, enum case for PommesError.timedOut(_:), v41);
      uint64_t v42 = sub_61500();
      uint64_t v44 = v43;
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      v61._countAndFlagsBits = v42;
      v61._object = v44;
      sub_61820(v61);
      swift_bridgeObjectRelease();
      uint64_t v45 = v56;
      uint64_t v46 = v57;
      sub_60B80();
      sub_60600();
      type metadata accessor for PommesTimeoutFlow();
      swift_allocObject();
      *(void *)(v0 + 136) = sub_493F4(v45, v46, (uint64_t)v55, (uint64_t)&v56);
      sub_4245C(&qword_77730, 255, (void (*)(uint64_t))type metadata accessor for PommesTimeoutFlow);
      goto LABEL_20;
    case 7:
      uint64_t v47 = sub_616C0();
      os_log_type_t v48 = sub_61960();
      if (os_log_type_enabled(v47, v48))
      {
        unint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v49 = 0;
        _os_log_impl(&dword_0, v47, v48, "no decision found, should not typically happen", v49, 2u);
        swift_slowDealloc();
      }

      sub_60B80();
      sub_60600();
      type metadata accessor for CamErrorFlow();
      swift_allocObject();
      *(void *)(v0 + 152) = sub_352DC(0xD000000000000010, 0x8000000000064DD0, (uint64_t)v55, (uint64_t)&v56);
      sub_4245C((unint64_t *)&qword_78370, 255, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
      goto LABEL_20;
    default:
      uint64_t v10 = type metadata accessor for DefaultCatExecutor();
      uint64_t v11 = swift_allocObject();
      sub_60B80();
      sub_60600();
      *(void *)(v0 + 80) = v10;
      *(void *)(v0 + 88) = &off_72130;
      *(void *)(v0 + 56) = v11;
      type metadata accessor for AirplaneModeFlow();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = sub_70DC(v53, v10);
      uint64_t v14 = *(void *)(v10 - 8);
      uint64_t v15 = (uint64_t *)swift_task_alloc();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(v15, v13, v10);
      uint64_t v16 = *v15;
      swift_retain();
      uint64_t v17 = sub_376D4(v16, (uint64_t)v55, (uint64_t)&v56, v12, "AirplaneModeFlow new instance initialised");
      sub_63E8(v53);
      swift_release();
      swift_task_dealloc();
      *(void *)(v0 + 176) = v17;
      sub_4245C(&qword_77748, 255, (void (*)(uint64_t))type metadata accessor for AirplaneModeFlow);
LABEL_20:
      sub_608D0();
LABEL_21:
      swift_release();
LABEL_22:
      swift_task_dealloc();
      uint64_t v50 = *(uint64_t (**)(void))(v0 + 8);
      return v50();
  }
}

uint64_t sub_41C8C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FallbackEntryFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for FallbackEntryFlow.ExecutionDecision(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FallbackEntryFlow.ExecutionDecision(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x41E54);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FallbackEntryFlow.ExecutionDecision()
{
  return &type metadata for FallbackEntryFlow.ExecutionDecision;
}

unint64_t sub_41E90()
{
  unint64_t result = qword_77710[0];
  if (!qword_77710[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_77710);
  }
  return result;
}

uint64_t sub_41EE4()
{
  return sub_613E0();
}

uint64_t sub_41F08()
{
  return sub_613F0();
}

void (*sub_41F2C(void *a1))(void *a1)
{
  int v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_613D0();
  return sub_41FA0;
}

void sub_41FA0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_41FE8(uint64_t a1)
{
  return sub_3ECB0(a1) & 1;
}

uint64_t sub_42010()
{
  return sub_60550();
}

uint64_t sub_4206C(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_6C0C;
  return sub_410FC(a1);
}

uint64_t sub_42108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for FallbackEntryFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_42140(uint64_t a1, uint64_t a2)
{
  return sub_4245C(&qword_77238, a2, (void (*)(uint64_t))type metadata accessor for FallbackEntryFlow);
}

uint64_t sub_42188(uint64_t a1, uint64_t a2)
{
  return sub_4245C(&qword_77728, a2, (void (*)(uint64_t))type metadata accessor for FallbackEntryFlow);
}

uint64_t sub_421D0(uint64_t a1)
{
  objc_msgSend(objc_msgSend(self, "sharedStream"), "emitMessage:", a1);

  return swift_unknownObjectRelease();
}

uint64_t sub_42238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[3] = type metadata accessor for DefaultCatExecutor();
  v16[4] = &off_72130;
  v16[0] = a1;
  sub_83F0((uint64_t)v16, a5 + 16);
  sub_83F0(a2, a5 + 56);
  sub_83F0(a3, a5 + 96);
  *(void *)(a5 + 136) = a4;
  uint64_t v10 = qword_75DE8;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_616D0();
  sub_6D40(v11, (uint64_t)qword_7A9C8);
  uint64_t v12 = sub_616C0();
  os_log_type_t v13 = sub_61960();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "GibberishFlow new instance initialised", v14, 2u);
    swift_slowDealloc();
  }

  swift_release();
  sub_63E8(a3);
  sub_63E8(a2);
  sub_63E8((uint64_t)v16);
  return a5;
}

uint64_t sub_423A8(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_71C78;
  v6._object = a2;
  unint64_t v4 = sub_61BB0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_423F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4245C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_424A4(uint64_t a1)
{
  v2[37] = a1;
  v2[38] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[39] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[43] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[44] = v4;
  v2[45] = *(void *)(v4 - 8);
  v2[46] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[47] = v5;
  v2[48] = *(void *)(v5 - 8);
  v2[49] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[50] = v6;
  v2[51] = *(void *)(v6 - 8);
  v2[52] = swift_task_alloc();
  sub_6D90(&qword_77878);
  v2[53] = swift_task_alloc();
  sub_6D90(&qword_77880);
  v2[54] = swift_task_alloc();
  return _swift_task_switch(sub_42738, 0, 0);
}

uint64_t sub_42738()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  int v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "GibberishFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[38];

  sub_6EA4((void *)(v5 + 16), *(void *)(v5 + 40));
  unint64_t v6 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[55] = v6;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v8 = sub_3C438(inited);
  v0[56] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[57] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_42930;
  return sub_38544(0xD000000000000016, 0x8000000000064EA0, v6, v8);
}

uint64_t sub_42930(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 464) = a1;
  *(void *)(v3 + 472) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_42EF0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_42A54;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_42A54()
{
  uint64_t v1 = *(void **)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v4 = sub_60E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  uint64_t v5 = sub_61520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  id v6 = v1;
  char v7 = sub_614D0();
  sub_6EE8(v3, &qword_77878);
  sub_6EE8(v2, &qword_77880);
  if (v7)
  {
    sub_614B0();
    sub_61490();
    sub_61480();
    sub_614A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v8 = *(void **)(v0 + 464);
  uint64_t v10 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v0 + 392);
  uint64_t v11 = *(void *)(v0 + 376);
  uint64_t v28 = *(void *)(v0 + 360);
  uint64_t v12 = *(void *)(v0 + 344);
  uint64_t v27 = *(void *)(v0 + 352);
  uint64_t v25 = *(void *)(v0 + 368);
  uint64_t v26 = *(void **)(v0 + 304);
  id v13 = [v8 speak];
  sub_61870();

  id v14 = [v8 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v11);
  id v15 = [v8 print];
  uint64_t v16 = sub_61870();

  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  sub_45D64(0, 0xE000000000000000, v17);
  id v18 = [v8 meta];

  sub_617A0();
  sub_609E0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 136), *(void *)(v0 + 160));
  sub_606D0();
  uint64_t v19 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
  *(void *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_608A0();
  sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
  sub_6EE8(v12, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  uint64_t v20 = v26[10];
  uint64_t v21 = v26[11];
  sub_6EA4(v26 + 7, v20);
  *(void *)(v0 + 240) = v27;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  uint64_t v22 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v28 + 16))(v22, v25, v27);
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 480) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_430B8;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v20, v21);
}

uint64_t sub_42EF0()
{
  uint64_t v5 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_61A70(43);
  swift_bridgeObjectRelease();
  v4[0] = 0xD000000000000029;
  v4[1] = 0x8000000000064EC0;
  swift_getErrorValue();
  v7._countAndFlagsBits = sub_61CE0();
  sub_61820(v7);
  swift_bridgeObjectRelease();
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  *(void *)(v0 + 280) = sub_352DC(0xD000000000000029, 0x8000000000064EC0, (uint64_t)v3, (uint64_t)v4);
  sub_E91C();
  sub_608D0();
  swift_errorRelease();
  swift_release();
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

uint64_t sub_430B8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_433F0;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_431D8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_431D8()
{
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  uint64_t v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.failed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_433F0()
{
  sub_63E8((uint64_t)(v0 + 27));
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  uint64_t v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.failed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_43610()
{
  return sub_60670();
}

uint64_t sub_4364C()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GibberishFlow()
{
  return self;
}

uint64_t sub_436C0()
{
  return 1;
}

uint64_t sub_436C8()
{
  return sub_60550();
}

uint64_t sub_43724(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_424A4(a1);
}

uint64_t sub_437C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for GibberishFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

void sub_437F8()
{
  qword_7A9B8 = 0x54746E6572727543;
  unk_7A9C0 = 0xEB000000006B7361;
}

uint64_t sub_43824(uint64_t a1)
{
  v2[37] = a1;
  v2[38] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[39] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[43] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[44] = v4;
  v2[45] = *(void *)(v4 - 8);
  v2[46] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[47] = v5;
  v2[48] = *(void *)(v5 - 8);
  v2[49] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[50] = v6;
  v2[51] = *(void *)(v6 - 8);
  v2[52] = swift_task_alloc();
  return _swift_task_switch(sub_43A58, 0, 0);
}

uint64_t sub_43A58()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "GiveUpRepeatFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[38];

  sub_6EA4((void *)(v5 + 16), *(void *)(v5 + 40));
  unint64_t v6 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[53] = v6;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v8 = sub_3C438(inited);
  v0[54] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[55] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_43C50;
  return sub_38544(0xD000000000000016, 0x8000000000064F20, v6, v8);
}

uint64_t sub_43C50(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 448) = a1;
  *(void *)(v3 + 456) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_44210;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_43D74;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_43D74()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v21 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v20 = *(void *)(v0 + 352);
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v19 = *(void **)(v0 + 304);
  id v5 = *(id *)(v0 + 448);
  id v6 = [v5 speak];
  sub_61870();

  id v7 = [v5 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  id v8 = [v5 print];
  uint64_t v9 = sub_61870();

  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  sub_45D64(0, 0xE000000000000000, v10);
  id v11 = [v5 meta];

  sub_617A0();
  sub_609E0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 136), *(void *)(v0 + 160));
  sub_606D0();
  uint64_t v12 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  *(void *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_608A0();
  sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  uint64_t v13 = v19[10];
  uint64_t v14 = v19[11];
  sub_6EA4(v19 + 7, v13);
  *(void *)(v0 + 240) = v20;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  uint64_t v15 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 16))(v15, v18, v20);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_440F0;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v13, v14);
}

uint64_t sub_440F0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_44674;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_443F4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_44210()
{
  uint64_t v5 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_61A70(46);
  swift_bridgeObjectRelease();
  v4[0] = 0xD00000000000002CLL;
  v4[1] = 0x8000000000064F40;
  swift_getErrorValue();
  v7._countAndFlagsBits = sub_61CE0();
  sub_61820(v7);
  swift_bridgeObjectRelease();
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  *(void *)(v0 + 280) = sub_352DC(0xD00000000000002CLL, 0x8000000000064F40, (uint64_t)&v3, (uint64_t)v4);
  sub_326CC((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
  sub_608D0();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_443F4()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[40];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.giveUpAskRepeat(_:), v3);
  if (qword_75DE0 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[51];
  uint64_t v15 = v0[50];
  uint64_t v16 = v0[52];
  uint64_t v5 = v0[45];
  uint64_t v13 = (void *)v0[56];
  uint64_t v14 = v0[46];
  uint64_t v6 = v0[39];
  uint64_t v12 = v0[44];
  uint64_t v7 = enum case for SiriKitReliabilityCodes.promptFailure(_:);
  uint64_t v8 = sub_60620();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v12);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_44674()
{
  sub_63E8((uint64_t)(v0 + 27));
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[40];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.giveUpAskRepeat(_:), v3);
  if (qword_75DE0 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[51];
  uint64_t v15 = v0[50];
  uint64_t v16 = v0[52];
  uint64_t v5 = v0[45];
  uint64_t v13 = (void *)v0[56];
  uint64_t v14 = v0[46];
  uint64_t v6 = v0[39];
  uint64_t v12 = v0[44];
  uint64_t v7 = enum case for SiriKitReliabilityCodes.promptFailure(_:);
  uint64_t v8 = sub_60620();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v12);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t type metadata accessor for GiveUpRepeatFlow()
{
  return self;
}

uint64_t sub_44924()
{
  return sub_60550();
}

uint64_t sub_44980(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_43824(a1);
}

uint64_t sub_44A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for GiveUpRepeatFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_44A54(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_75FF0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v69 = (uint64_t *)((char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for CAMDirectInvocation();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v58 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  id v11 = (char *)&v54 - v10;
  uint64_t v12 = sub_60D10();
  uint64_t v66 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_60CF0();
  uint64_t v70 = *(void *)(v62 - 8);
  __chkstk_darwin(v62, v16);
  Swift::String v61 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_60C90();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)&v54 - v25;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_616D0();
  uint64_t v28 = sub_6D40(v27, (uint64_t)qword_7A9C8);
  int v64 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v65 = v19 + 16;
  v64(v26, a1, v18);
  uint64_t v68 = v28;
  uint64_t v29 = sub_616C0();
  os_log_type_t v30 = sub_61960();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v55 = v23;
    uint64_t v32 = (uint8_t *)v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v57 = a1;
    v72[0] = v33;
    uint64_t v54 = v11;
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v56 = v19;
    sub_326CC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v34 = sub_61C90();
    uint64_t v71 = sub_316A4(v34, v35, v72);
    uint64_t v36 = v56;
    id v11 = v54;
    sub_619C0();
    swift_bridgeObjectRelease();
    os_log_type_t v63 = *(void (**)(char *, uint64_t))(v36 + 8);
    v63(v26, v18);
    _os_log_impl(&dword_0, v29, v30, "GiveUpRepeatFlow: on called with %s", v32, 0xCu);
    swift_arrayDestroy();
    a1 = v57;
    swift_slowDealloc();
    uint64_t v23 = v55;
    swift_slowDealloc();
  }
  else
  {
    os_log_type_t v63 = *(void (**)(char *, uint64_t))(v19 + 8);
    v63(v26, v18);
  }

  sub_60C80();
  uint64_t v38 = v66;
  uint64_t v37 = v67;
  int v39 = (*(uint64_t (**)(char *, uint64_t))(v66 + 88))(v15, v67);
  uint64_t v40 = v69;
  uint64_t v41 = v70;
  if (v39 != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v37);
    goto LABEL_15;
  }
  (*(void (**)(char *, uint64_t))(v38 + 96))(v15, v37);
  uint64_t v42 = v62;
  uint64_t v43 = v61;
  (*(void (**)(void))(v41 + 32))();
  sub_3B0A8(v40);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v59 + 48))(v40, 1, v60) == 1)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
    sub_6EE8((uint64_t)v40, &qword_75FF0);
LABEL_15:
    v64(v23, a1, v18);
    unint64_t v49 = sub_616C0();
    os_log_type_t v50 = sub_61970();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      v72[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315138;
      sub_326CC((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v52 = sub_61C90();
      uint64_t v71 = sub_316A4(v52, v53, v72);
      sub_619C0();
      swift_bridgeObjectRelease();
      v63(v23, v18);
      _os_log_impl(&dword_0, v49, v50, "GiveUpRepeatFlow called with unexpected input %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v63(v23, v18);
    }

    return 0;
  }
  sub_3254C((uint64_t)v40, (uint64_t)v11);
  uint64_t v44 = v58;
  sub_325B0((uint64_t)v11, v58);
  if (swift_getEnumCaseMultiPayload() != 4)
  {
    sub_32614((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
    sub_32614(v44);
    goto LABEL_15;
  }
  sub_32614(v44);
  uint64_t v45 = sub_616C0();
  os_log_type_t v46 = sub_61960();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_0, v45, v46, "GiveUpRepeatFlow: input accepted", v47, 2u);
    swift_slowDealloc();
  }

  sub_32614((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
  return 1;
}

uint64_t sub_452A4(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_77968);
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  uint64_t v9 = (char *)&v15 - v8;
  sub_45B74(a1, (uint64_t)&v15 - v8);
  uint64_t v10 = sub_611F0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    sub_45B74((uint64_t)v9, (uint64_t)v6);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v6, v10);
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourth(_:))
    {
      uint64_t v12 = 3;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Second(_:))
    {
      uint64_t v12 = 1;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Beginning(_:)) {
      goto LABEL_8;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFourth(_:))
    {
      uint64_t v12 = 23;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventeenth(_:))
    {
      uint64_t v12 = 16;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighth(_:))
    {
      uint64_t v12 = 7;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_ThirdToLast(_:))
    {
      uint64_t v12 = -3;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixth(_:))
    {
      uint64_t v12 = 5;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Nineteenth(_:))
    {
      uint64_t v12 = 18;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFifth(_:))
    {
      uint64_t v12 = 24;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Ninth(_:))
    {
      uint64_t v12 = 8;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eleventh(_:))
    {
      uint64_t v12 = 10;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_End(_:)) {
      goto LABEL_28;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourteenth(_:))
    {
      uint64_t v12 = 13;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_SecondToLast(_:))
    {
      uint64_t v12 = -2;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFirst(_:))
    {
      uint64_t v12 = 20;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Thirteenth(_:))
    {
      uint64_t v12 = 12;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Last(_:))
    {
LABEL_28:
      uint64_t v12 = -1;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentySecond(_:))
    {
      uint64_t v12 = 21;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifteenth(_:))
    {
      uint64_t v12 = 14;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twentieth(_:))
    {
      uint64_t v12 = 19;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifth(_:))
    {
      uint64_t v12 = 4;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixteenth(_:))
    {
      uint64_t v12 = 15;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_First(_:))
    {
LABEL_8:
      uint64_t v12 = 0;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventh(_:))
    {
      uint64_t v12 = 6;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighteenth(_:))
    {
      uint64_t v12 = 17;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyThird(_:))
    {
      uint64_t v12 = 22;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twelfth(_:))
    {
      uint64_t v12 = 11;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Third(_:))
    {
      uint64_t v12 = 2;
      goto LABEL_61;
    }
    if (v13 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Tenth(_:))
    {
      uint64_t v12 = 9;
      goto LABEL_61;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  uint64_t v12 = 0;
LABEL_61:
  sub_45B14((uint64_t)v9);
  return v12;
}

uint64_t sub_457B0()
{
  uint64_t v0 = sub_6D90(&qword_77968);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_55EFC()) {
    return 0;
  }
  uint64_t v4 = sub_612D0();
  if (!*(void *)(v4 + 16)) {
    goto LABEL_21;
  }
  unint64_t v5 = sub_3C8A4(0x797469746E65, 0xE600000000000000);
  if ((v6 & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!(v7 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_6;
    }
LABEL_21:
    swift_release();
LABEL_22:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_61B60();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_21;
  }
LABEL_6:
  if ((v7 & 0xC000000000000001) != 0)
  {
    sub_61A90();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_33;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_61320();
  swift_release();
  if (!v8)
  {
LABEL_27:
    swift_release();
    return 0;
  }
  uint64_t v9 = sub_61330();
  if (!*(void *)(v9 + 16) || (unint64_t v10 = sub_3C8A4(0x507473694C6F7375, 0xEF6E6F697469736FLL), (v11 & 1) == 0))
  {
    swift_release();
    swift_release();
    goto LABEL_22;
  }
  unint64_t v7 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (!(v7 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_61B60();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v18)
  {
LABEL_34:
    swift_release();
    goto LABEL_21;
  }
LABEL_14:
  if ((v7 & 0xC000000000000001) != 0)
  {
    sub_61A90();
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_61320();
    swift_release();
    if (v13)
    {
      sub_61200();
      swift_retain();
      sub_61160();
      swift_release();
      if (v19[1])
      {
        sub_611E0();
        uint64_t v14 = sub_452A4((uint64_t)v3);
        char v16 = v15;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        sub_45B14((uint64_t)v3);
        if ((v16 & 1) == 0) {
          return v14;
        }
        return 0;
      }
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
    }
    goto LABEL_27;
  }
  if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)))
  {
    swift_retain();
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_45B14(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_77968);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_45B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_45BDC()
{
  uint64_t v0 = sub_616D0();
  sub_45C68(v0, qword_7A9C8);
  sub_6D40(v0, (uint64_t)qword_7A9C8);
  if (qword_75DF0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_7A9E0;
  return sub_616E0();
}

uint64_t *sub_45C68(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_45CCC()
{
  sub_45D24();
  uint64_t result = sub_619A0();
  qword_7A9E0 = result;
  return result;
}

unint64_t sub_45D24()
{
  unint64_t result = qword_77970;
  if (!qword_77970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_77970);
  }
  return result;
}

void *sub_45D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    unint64_t result = (void *)sub_61B40();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      char v6 = (void *)sub_618A0();
      unint64_t v7 = v6;
      v6[2] = a3;
      v6[4] = a1;
      _OWORD v6[5] = a2;
      if (a3 != 1)
      {
        v6[6] = a1;
        v6[7] = a2;
        uint64_t v8 = a3 - 2;
        if (v8)
        {
          uint64_t v9 = v6 + 9;
          do
          {
            *(v9 - 1) = a1;
            *uint64_t v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
    return v7;
  }
  return result;
}

uint64_t sub_45E60(uint64_t a1)
{
  v2[37] = a1;
  v2[38] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[39] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[43] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[44] = v4;
  v2[45] = *(void *)(v4 - 8);
  v2[46] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[47] = v5;
  v2[48] = *(void *)(v5 - 8);
  v2[49] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[50] = v6;
  v2[51] = *(void *)(v6 - 8);
  v2[52] = swift_task_alloc();
  return _swift_task_switch(sub_46094, 0, 0);
}

uint64_t sub_46094()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "NetworkUnavailableFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }

  sub_614C0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = [self bundleForClass:ObjCClassFromMetadata];
  v0[54] = v6;
  unint64_t v7 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[55] = v7;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v9 = sub_3C438(inited);
  v0[56] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_77348 + dword_77348);
  unint64_t v10 = (void *)swift_task_alloc();
  v0[57] = v10;
  void *v10 = v0;
  v10[1] = sub_46924;
  return v12((uint64_t)v6, 0xD000000000000022, 0x80000000000649F0, v7, v9);
}

uint64_t sub_462C8()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v21 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v20 = *(void *)(v0 + 352);
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v19 = *(void **)(v0 + 304);
  id v5 = *(id *)(v0 + 464);
  id v6 = [v5 speak];
  sub_61870();

  id v7 = [v5 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v3);
  id v8 = [v5 print];
  uint64_t v9 = sub_61870();

  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  sub_45D64(0, 0xE000000000000000, v10);
  id v11 = [v5 meta];

  sub_617A0();
  sub_609E0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 136), *(void *)(v0 + 160));
  sub_606D0();
  uint64_t v12 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  *(void *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_608A0();
  sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  uint64_t v13 = v19[10];
  uint64_t v14 = v19[11];
  sub_6EA4(v19 + 7, v13);
  *(void *)(v0 + 240) = v20;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  char v15 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 16))(v15, v18, v20);
  char v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v16;
  *char v16 = v0;
  v16[1] = sub_46644;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v13, v14);
}

uint64_t sub_46644()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_46C60;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_46A5C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_46764()
{
  id v6 = v0;
  uint64_t v1 = (void *)v0[54];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5[0] = 0;
  v5[1] = 0xE000000000000000;
  sub_61A70(52);
  v8._object = (void *)0x8000000000064FC0;
  v8._countAndFlagsBits = 0xD000000000000032;
  sub_61820(v8);
  swift_getErrorValue();
  v9._countAndFlagsBits = sub_61CE0();
  sub_61820(v9);
  swift_bridgeObjectRelease();
  sub_60B80();
  sub_60600();
  type metadata accessor for CamErrorFlow();
  swift_allocObject();
  v0[35] = sub_352DC(0, 0xE000000000000000, (uint64_t)v4, (uint64_t)v5);
  sub_E91C();
  sub_608D0();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_46924(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 464) = a1;
  *(void *)(v3 + 472) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_46764;
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_462C8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_46A5C()
{
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  id v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.completed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_46C60()
{
  sub_63E8((uint64_t)(v0 + 27));
  uint64_t v1 = v0[51];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[52];
  uint64_t v2 = v0[45];
  id v11 = (void *)v0[58];
  uint64_t v12 = v0[46];
  uint64_t v4 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v10 = v0[44];
  sub_6EA4((void *)(v0[38] + 96), *(void *)(v0[38] + 120));
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for ActivityType.completed(_:), v6);
  sub_606A0();
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v10);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_46E6C()
{
  return sub_60670();
}

uint64_t type metadata accessor for NetworkUnavailableFlow()
{
  return self;
}

uint64_t sub_46ECC()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_616D0();
  sub_6D40(v0, (uint64_t)qword_7A9C8);
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61960();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "NetworkUnavailableFlow input accepted", v3, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_46FA8()
{
  return sub_60550();
}

uint64_t sub_47004(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_45E60(a1);
}

uint64_t sub_470A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NetworkUnavailableFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_470D8()
{
  uint64_t v1 = sub_6D90(&qword_77A58);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v154 = (char *)&v143 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_60C70();
  uint64_t v4 = *(void *)(v163 - 8);
  uint64_t v6 = __chkstk_darwin(v163, v5);
  Swift::String v8 = (char *)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  int v151 = (char *)&v143 - v10;
  uint64_t v11 = sub_6D90(&qword_768A8);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v160 = (char *)&v143 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_60350();
  uint64_t v146 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14, v15);
  uint64_t v18 = (char *)&v143 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v145 = (char *)&v143 - v20;
  uint64_t v21 = sub_6D90(&qword_768F0);
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v167 = (char *)&v143 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_60D10();
  uint64_t v170 = *(void *)(v164 - 8);
  uint64_t v25 = __chkstk_darwin(v164, v24);
  v158 = (void **)((char *)&v143 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v25, v27);
  uint64_t v162 = (char *)&v143 - v28;
  uint64_t v169 = sub_60C90();
  uint64_t v172 = *(void *)(v169 - 8);
  uint64_t v30 = __chkstk_darwin(v169, v29);
  v157 = (char *)&v143 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30, v32);
  v161 = (char *)&v143 - v33;
  uint64_t v171 = sub_60DA0();
  uint64_t v168 = *(void *)(v171 - 8);
  __chkstk_darwin(v171, v34);
  uint64_t v155 = (char *)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_6D90((uint64_t *)&unk_78250);
  __chkstk_darwin(v36 - 8, v37);
  uint64_t v166 = (void (*)(char *, uint64_t))((char *)&v143 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = sub_607D0();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v42 = __chkstk_darwin(v39, v41);
  char v144 = (char *)&v143 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __chkstk_darwin(v42, v44);
  uint64_t v153 = (char *)&v143 - v46;
  __chkstk_darwin(v45, v47);
  unint64_t v49 = (char *)&v143 - v48;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_616D0();
  uint64_t v51 = sub_6D40(v50, (uint64_t)qword_7A9C8);
  uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  uint64_t v173 = v0;
  uint64_t v149 = v40 + 16;
  uint64_t v148 = v52;
  v52(v49, v0, v39);
  uint64_t v165 = v51;
  unint64_t v53 = sub_616C0();
  os_log_type_t v54 = sub_61960();
  BOOL v55 = os_log_type_enabled(v53, v54);
  uint64_t v152 = v14;
  uint64_t v159 = v4;
  uint64_t v143 = v8;
  uint64_t v150 = v39;
  uint64_t v147 = v40;
  if (v55)
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v156 = v18;
    uint64_t v175 = v57;
    *(_DWORD *)uint64_t v56 = 136315138;
    uint64_t v58 = sub_60780();
    uint64_t v174 = sub_316A4(v58, v59, &v175);
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v60 = *(void (**)(char *, uint64_t))(v40 + 8);
    v60(v49, v39);
    _os_log_impl(&dword_0, v53, v54, "Finding app bundle id for %s action", v56, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v156;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v60 = *(void (**)(char *, uint64_t))(v40 + 8);
    v60(v49, v39);
  }

  uint64_t v61 = (uint64_t)v166;
  sub_60790();
  uint64_t v62 = sub_609D0();
  uint64_t v63 = *(void *)(v62 - 8);
  int v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v61, 1, v62);
  uint64_t v65 = v167;
  uint64_t v66 = v168;
  if (v64 == 1)
  {
    sub_6EE8(v61, (uint64_t *)&unk_78250);
    uint64_t v67 = v171;
  }
  else
  {
    uint64_t v68 = sub_609C0();
    uint64_t v69 = v61;
    uint64_t v70 = v68;
    unint64_t v72 = v71;
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v69, v62);
    uint64_t v67 = v171;
    if (v72)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v73 = sub_616C0();
      os_log_type_t v74 = sub_61960();
      if (os_log_type_enabled(v73, v74))
      {
        os_log_type_t v75 = (uint8_t *)swift_slowAlloc();
        uint64_t v175 = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v75 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v174 = sub_316A4(v70, v72, &v175);
        sub_619C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v73, v74, "Value %s found in action paraphrase", v75, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return v70;
    }
  }
  uint64_t v166 = v60;
  char v76 = v161;
  sub_607B0();
  char v77 = v162;
  sub_60C80();
  os_log_type_t v78 = *(void (**)(char *, uint64_t))(v172 + 8);
  v172 += 8;
  v78(v76, v169);
  uint64_t v79 = v170;
  uint64_t v80 = *(unsigned int (**)(char *, uint64_t))(v170 + 88);
  uint64_t v81 = v164;
  if (v80(v77, v164) == enum case for Parse.uso(_:))
  {
    v156 = v18;
    (*(void (**)(char *, uint64_t))(v79 + 96))(v77, v81);
    char v82 = v155;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v155, v77, v67);
    LOBYTE(v175) = 1;
    sub_60D70();
    uint64_t v83 = sub_60AF0();
    uint64_t v84 = *(void *)(v83 - 8);
    int v85 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v65, 1, v83);
    uint64_t v86 = (uint64_t)v65;
    uint64_t v87 = v163;
    uint64_t v88 = (uint64_t)v160;
    if (v85 != 1)
    {
      uint64_t v70 = sub_60AE0();
      unint64_t v121 = v120;
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v86, v83);
      swift_bridgeObjectRetain_n();
      os_log_type_t v122 = sub_616C0();
      os_log_type_t v123 = sub_61960();
      if (os_log_type_enabled(v122, v123))
      {
        uint64_t v124 = (uint8_t *)swift_slowAlloc();
        uint64_t v175 = swift_slowAlloc();
        *(_DWORD *)uint64_t v124 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v174 = sub_316A4(v70, v121, &v175);
        sub_619C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v122, v123, "Value %s found in app shortcut invocation", v124, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v168 + 8))(v155, v171);
      return v70;
    }
    sub_6EE8(v86, &qword_768F0);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v82, v171);
    uint64_t v18 = v156;
    uint64_t v81 = v164;
    uint64_t v89 = v87;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v79 + 8))(v77, v81);
    uint64_t v89 = v163;
    uint64_t v88 = (uint64_t)v160;
  }
  uint64_t v90 = v157;
  sub_607B0();
  uint64_t v91 = v158;
  sub_60C80();
  v78(v90, v169);
  if (v80((char *)v91, v81) == enum case for Parse.pommesResponse(_:))
  {
    (*(void (**)(void **, uint64_t))(v170 + 96))(v91, v81);
    uint64_t v92 = *v91;
    sub_48D54(v88);
    uint64_t v93 = v146;
    uint64_t v94 = v152;
    int v95 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v146 + 48))(v88, 1, v152);
    uint64_t v96 = v159;
    if (v95 != 1)
    {
      unint64_t v125 = v145;
      (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v145, v88, v94);
      (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v18, v125, v94);
      uint64_t v126 = sub_616C0();
      os_log_type_t v127 = sub_61960();
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v128 = (uint8_t *)swift_slowAlloc();
        uint64_t v175 = swift_slowAlloc();
        *(_DWORD *)uint64_t v128 = 136315138;
        uint64_t v129 = sub_60330();
        uint64_t v174 = sub_316A4(v129, v130, &v175);
        sub_619C0();
        swift_bridgeObjectRelease();
        uint64_t v131 = *(void (**)(char *, uint64_t))(v93 + 8);
        v131(v18, v152);
        _os_log_impl(&dword_0, v126, v127, "Using %s from PommesResponse sash", v128, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v94 = v152;
        swift_slowDealloc();
      }
      else
      {
        uint64_t v131 = *(void (**)(char *, uint64_t))(v93 + 8);
        v131(v18, v94);
      }

      unint64_t v140 = v145;
      uint64_t v70 = sub_60330();

      v131(v140, v94);
      return v70;
    }

    sub_6EE8(v88, &qword_768A8);
  }
  else
  {
    (*(void (**)(void **, uint64_t))(v170 + 8))(v91, v81);
    uint64_t v96 = v159;
  }
  uint64_t v97 = v173;
  sub_60780();
  uint64_t v98 = (uint64_t)v154;
  sub_60C40();
  swift_bridgeObjectRelease();
  int v99 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v96 + 48))(v98, 1, v89);
  uint64_t v100 = v153;
  if (v99 == 1)
  {
    sub_6EE8(v98, &qword_77A58);
    uint64_t v101 = v144;
    uint64_t v102 = v150;
    v148(v144, v97, v150);
    uint64_t v103 = sub_616C0();
    os_log_type_t v104 = sub_61970();
    if (os_log_type_enabled(v103, v104))
    {
      uint64_t v105 = (uint8_t *)swift_slowAlloc();
      uint64_t v175 = swift_slowAlloc();
      *(_DWORD *)uint64_t v105 = 136315138;
      uint64_t v106 = sub_60780();
      uint64_t v174 = sub_316A4(v106, v107, &v175);
      sub_619C0();
      swift_bridgeObjectRelease();
      v166(v101, v102);
      _os_log_impl(&dword_0, v103, v104, "%s was not found in plugin manifest", v105, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v166(v101, v102);
    }

    return 0;
  }
  uint64_t v108 = v151;
  (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v151, v98, v89);
  uint64_t v109 = sub_60C60();
  if (!v110)
  {
    uint64_t v132 = v143;
    (*(void (**)(char *, char *, uint64_t))(v96 + 16))(v143, v108, v89);
    uint64_t v133 = v108;
    uint64_t v134 = sub_616C0();
    os_log_type_t v135 = sub_61970();
    if (os_log_type_enabled(v134, v135))
    {
      long long v136 = (uint8_t *)swift_slowAlloc();
      uint64_t v175 = swift_slowAlloc();
      *(_DWORD *)long long v136 = 136315138;
      uint64_t v137 = sub_60C50();
      uint64_t v174 = sub_316A4(v137, v138, &v175);
      sub_619C0();
      swift_bridgeObjectRelease();
      uint64_t v139 = *(void (**)(char *, uint64_t))(v96 + 8);
      v139(v132, v89);
      _os_log_impl(&dword_0, v134, v135, "No app is associated with %s in plugin manifest", v136, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v139(v151, v89);
    }
    else
    {

      uint64_t v142 = *(void (**)(char *, uint64_t))(v96 + 8);
      v142(v132, v89);
      v142(v133, v89);
    }
    return 0;
  }
  unint64_t v111 = v110;
  uint64_t v112 = v109;
  uint64_t v113 = v150;
  v148(v100, v173, v150);
  swift_bridgeObjectRetain_n();
  uint64_t v114 = sub_616C0();
  os_log_type_t v115 = sub_61960();
  if (os_log_type_enabled(v114, v115))
  {
    uint64_t v116 = swift_slowAlloc();
    uint64_t v173 = swift_slowAlloc();
    uint64_t v175 = v173;
    *(_DWORD *)uint64_t v116 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v174 = sub_316A4(v112, v111, &v175);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v116 + 12) = 2080;
    uint64_t v117 = sub_60780();
    uint64_t v174 = sub_316A4(v117, v118, &v175);
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v119 = v113;
    uint64_t v70 = v112;
    v166(v100, v119);
    _os_log_impl(&dword_0, v114, v115, "Using %s from being associated with %s", (uint8_t *)v116, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v159 + 8))(v151, v163);
  }
  else
  {

    v166(v100, v113);
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v151, v163);
    return v112;
  }
  return v70;
}

uint64_t sub_48578@<X0>(uint64_t a1@<X8>)
{
  uint64_t v80 = a1;
  uint64_t v2 = sub_6D90((uint64_t *)&unk_78360);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v79 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_602F0();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v77 = v5;
  __chkstk_darwin(v5, v6);
  os_log_type_t v78 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6D90(&qword_77A60);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v70 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_60E10();
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v69 = (void (**)(char *, uint64_t))((char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_60D10();
  uint64_t v15 = *(void (***)(char *, uint64_t))(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  unint64_t v71 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v64 - v20;
  uint64_t v22 = sub_60C90();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v25 = __chkstk_darwin(v22, v24);
  uint64_t v65 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25, v27);
  uint64_t v29 = (char *)&v64 - v28;
  uint64_t v30 = sub_60DA0();
  uint64_t v67 = *(void *)(v30 - 8);
  uint64_t v68 = (void (*)(char *, uint64_t))v30;
  __chkstk_darwin(v30, v31);
  uint64_t v33 = (char *)&v64 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_616F0();
  uint64_t v73 = *(void *)(v34 - 8);
  uint64_t v74 = v34;
  uint64_t v36 = __chkstk_darwin(v34, v35);
  unint64_t v72 = (char *)&v64 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __chkstk_darwin(v36, v38);
  int v64 = (char *)&v64 - v40;
  __chkstk_darwin(v39, v41);
  uint64_t v43 = (char *)&v64 - v42;
  uint64_t v75 = v1;
  sub_607B0();
  sub_60C80();
  uint64_t v44 = v15;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v66 = v22;
  v45(v29, v22);
  uint64_t v46 = v15[11];
  uint64_t v81 = v14;
  if (((unsigned int (*)(char *, uint64_t))v46)(v21, v14) == enum case for Parse.uso(_:))
  {
    v44[12](v21, v81);
    uint64_t v48 = v67;
    uint64_t v47 = v68;
    (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v67 + 32))(v33, v21, v68);
    sub_60D90();
    sub_60D50();
    sub_60D40();
    sub_60D30();
    unint64_t v49 = v64;
    sub_61700();
    (*(void (**)(char *, void))(v48 + 8))(v33, v47);
    uint64_t v51 = v73;
    uint64_t v50 = v74;
    (*(void (**)(char *, void, uint64_t))(v73 + 104))(v49, enum case for CamParse.uso(_:), v74);
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v43, v49, v50);
    uint64_t v52 = (uint64_t)v79;
    uint64_t v53 = v77;
    os_log_type_t v54 = v72;
    BOOL v55 = v43;
  }
  else
  {
    uint64_t v69 = v44;
    uint64_t v70 = v43;
    uint64_t v56 = v81;
    uint64_t v68 = v44[1];
    v68(v21, v81);
    uint64_t v57 = v65;
    sub_607B0();
    uint64_t v58 = v71;
    sub_60C80();
    v45(v57, v66);
    if (((unsigned int (*)(char *, uint64_t))v46)(v58, v56) == enum case for Parse.pommesResponse(_:))
    {
      unint64_t v59 = v71;
      v69[12](v71, v81);
      BOOL v55 = v70;
      *(void *)uint64_t v70 = *(void *)v59;
      uint64_t v60 = enum case for CamParse.pommesResponse(_:);
      uint64_t v51 = v73;
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 104);
    }
    else
    {
      v68(v71, v81);
      uint64_t v60 = enum case for CamParse.empty(_:);
      uint64_t v51 = v73;
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 104);
      BOOL v55 = v70;
    }
    uint64_t v50 = v74;
    v61(v55, v60, v74);
    uint64_t v52 = (uint64_t)v79;
    uint64_t v53 = v77;
    os_log_type_t v54 = v72;
  }
  sub_60780();
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v54, v55, v50);
  sub_607C0();
  uint64_t v62 = v76;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v52, 1, v53) == 1)
  {
    sub_602E0();
    sub_48CF4(v52);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v78, v52, v53);
  }
  sub_61710();
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v55, v50);
}

uint64_t sub_48CF4(uint64_t a1)
{
  uint64_t v2 = sub_6D90((uint64_t *)&unk_78360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_48D54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v59 = sub_603A0();
  uint64_t v4 = *(void *)(v59 - 8);
  __chkstk_darwin(v59, v5);
  uint64_t v58 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6D90(&qword_77A68);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_60370();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)&v49 - v18;
  unint64_t v20 = sub_615F0();
  unint64_t v21 = v20;
  if (v20 >> 62)
  {
    uint64_t result = sub_61B60();
    if (result) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t result = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
  if (!result) {
    goto LABEL_19;
  }
LABEL_3:
  if ((v21 & 0xC000000000000001) != 0)
  {
    id v23 = (id)sub_61A90();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return result;
    }
    id v23 = *(id *)(v21 + 32);
  }
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  sub_61610();
  if (swift_dynamicCastClass())
  {
    id v55 = v24;
    uint64_t v56 = v19;
    uint64_t v25 = sub_61600();
    uint64_t v26 = *(void *)(v25 + 16);
    if (v26)
    {
      uint64_t v50 = v10;
      uint64_t v51 = v12;
      uint64_t v53 = v2;
      uint64_t v54 = a1;
      uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
      uint64_t v27 = v12 + 16;
      uint64_t v57 = v28;
      uint64_t v29 = *(unsigned __int8 *)(v27 + 64);
      uint64_t v49 = v25;
      uint64_t v30 = v25 + ((v29 + 32) & ~v29);
      uint64_t v52 = v4;
      uint64_t v31 = *(void *)(v27 + 56);
      uint64_t v32 = v11;
      uint64_t v33 = v58;
      while (1)
      {
        v57(v16, v30, v32);
        uint64_t v34 = v32;
        sub_60360();
        char v35 = sub_60390();
        (*(void (**)(char *, uint64_t))(v4 + 8))(v33, v59);
        if (v35) {
          break;
        }
        (*(void (**)(char *, uint64_t))(v27 - 8))(v16, v34);
        v30 += v31;
        --v26;
        uint64_t v32 = v34;
        if (!v26)
        {
          uint64_t v36 = 1;
          uint64_t v2 = v53;
          a1 = v54;
          uint64_t v12 = v51;
          uint64_t v4 = v52;
          uint64_t v10 = v50;
          goto LABEL_15;
        }
      }
      uint64_t v10 = v50;
      uint64_t v12 = v51;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v50, v16, v34);
      uint64_t v36 = 0;
      uint64_t v2 = v53;
      a1 = v54;
      uint64_t v4 = v52;
      uint64_t v32 = v34;
    }
    else
    {
      uint64_t v36 = 1;
      uint64_t v32 = v11;
    }
LABEL_15:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v36, 1, v32);
    swift_bridgeObjectRelease();
    int v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v32);
    uint64_t v38 = v56;
    if (v37 != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v56, v10, v32);
      uint64_t v39 = v58;
      sub_60360();
      sub_60380();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v39, v59);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v38, v32);
      uint64_t v40 = sub_60350();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(a1, 0, 1, v40);
    }

    sub_49368((uint64_t)v10);
  }
  else
  {
  }
LABEL_20:
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_616D0();
  sub_6D40(v41, (uint64_t)qword_7A9C8);
  uint64_t v42 = v2;
  uint64_t v43 = sub_616C0();
  os_log_type_t v44 = sub_61970();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 138412290;
    uint64_t v60 = v42;
    uint64_t v47 = v42;
    sub_619C0();
    *uint64_t v46 = v42;

    _os_log_impl(&dword_0, v43, v44, "No sash found in pommes response: %@", v45, 0xCu);
    sub_6D90(&qword_76910);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v43 = v42;
  }

  uint64_t v48 = sub_60350();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(a1, 1, 1, v48);
}

uint64_t sub_49368(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_77A68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_493C8()
{
  qword_7A9E8 = 0x54746E6572727543;
  unk_7A9F0 = 0xEB000000006B7361;
}

uint64_t sub_493F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_83F0(a3, v5 + 16);
  sub_83F0(a4, v5 + 56);
  *(void *)(v5 + 96) = a1;
  *(void *)(v5 + 104) = a2;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_616D0();
  sub_6D40(v10, (uint64_t)qword_7A9C8);
  uint64_t v11 = sub_616C0();
  os_log_type_t v12 = sub_61960();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "PommesTimeoutFlow: new instance initialised", v13, 2u);
    swift_slowDealloc();
  }

  sub_63E8(a4);
  sub_63E8(a3);
  return v5;
}

uint64_t sub_49518(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[24] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_76560);
  v2[28] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v2[29] = v4;
  v2[30] = *(void *)(v4 - 8);
  v2[31] = swift_task_alloc();
  sub_6D90(&qword_77178);
  v2[32] = swift_task_alloc();
  uint64_t v5 = sub_60A40();
  v2[33] = v5;
  v2[34] = *(void *)(v5 - 8);
  v2[35] = swift_task_alloc();
  return _swift_task_switch(sub_49720, 0, 0);
}

uint64_t sub_49720()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  v0[36] = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "PommesTimeoutFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  v0[37] = v5;
  void *v5 = v0;
  v5[1] = sub_49878;
  uint64_t v6 = v0[32];
  return static ErrorTemplates.pommesTimeout()(v6);
}

uint64_t sub_49878()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_35E24;
  }
  else
  {
    uint64_t v1 = sub_49990;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_49990()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v14 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v7 = *(void **)(v0 + 184);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v4, v3);
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 56), *(void *)(v0 + 80));
  sub_606D0();
  uint64_t v8 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  sub_608B0();
  sub_6EE8(v0 + 96, (uint64_t *)&unk_78310);
  sub_6EE8(v6, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  uint64_t v9 = v7[5];
  uint64_t v10 = v7[6];
  sub_6EA4(v7 + 2, v9);
  *(void *)(v0 + 160) = v15;
  *(void *)(v0 + 168) = &protocol witness table for AceOutput;
  uint64_t v11 = sub_838C((uint64_t *)(v0 + 136));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(v11, v14, v15);
  os_log_type_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v12;
  void *v12 = v0;
  v12[1] = sub_49BE4;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 136, v9, v10);
}

uint64_t sub_49BE4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = sub_49F3C;
  }
  else
  {
    sub_63E8(v2 + 136);
    uint64_t v3 = sub_49D04;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_49D04()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  sub_6EA4((void *)(v0[23] + 56), *(void *)(v0[23] + 80));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.failed(_:), v3);
  if (qword_75DF8 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[34];
  uint64_t v13 = v0[35];
  uint64_t v5 = v0[30];
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[33];
  uint64_t v10 = v0[29];
  uint64_t v6 = v0[24];
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v13, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_49F3C()
{
  sub_63E8((uint64_t)(v0 + 17));
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  sub_6EA4((void *)(v0[23] + 56), *(void *)(v0[23] + 80));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.failed(_:), v3);
  if (qword_75DF8 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[34];
  uint64_t v13 = v0[35];
  uint64_t v5 = v0[30];
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[33];
  uint64_t v10 = v0[29];
  uint64_t v6 = v0[24];
  uint64_t v7 = sub_60620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v13, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t type metadata accessor for PommesTimeoutFlow()
{
  return self;
}

uint64_t sub_4A1A4()
{
  return sub_60550();
}

uint64_t sub_4A200(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_49518(a1);
}

uint64_t sub_4A29C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PommesTimeoutFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_4A2D4(uint64_t a1)
{
  uint64_t v2 = sub_60C90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_616D0();
  sub_6D40(v7, (uint64_t)qword_7A9C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  uint64_t v8 = sub_616C0();
  os_log_type_t v9 = sub_61960();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    sub_365BC();
    uint64_t v11 = sub_61C90();
    uint64_t v14 = sub_316A4(v11, v12, &v15);
    sub_619C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    _os_log_impl(&dword_0, v8, v9, "PommesTimeoutFlow: on called with %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

  return 0;
}

uint64_t sub_4A538@<X0>(uint64_t a1@<X8>)
{
  sub_613A0();
  if (sub_61370())
  {
    sub_61340();
    swift_release();
    sub_61570();
    swift_release();
    uint64_t v2 = sub_61430();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
    uint64_t v4 = v2;
    uint64_t v5 = a1;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = sub_61430();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v4 = v7;
    uint64_t v5 = a1;
    uint64_t v6 = 1;
  }

  return v3(v5, v6, 1, v4);
}

uint64_t sub_4A618(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_60D10();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  void v2[6] = swift_task_alloc();
  return _swift_task_switch(sub_4A6D8, 0, 0);
}

uint64_t sub_4A6D8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = 4;
  sub_4EE30(v5);
  sub_60C80();
  char v6 = sub_4EE54(v1);
  *(unsigned char *)(v0 + 104) = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  switch(v6)
  {
    case 1:
      if (sub_4C974())
      {
        uint64_t v10 = (void *)swift_task_alloc();
        *(void *)(v0 + 72) = v10;
        void *v10 = v0;
        uint64_t v11 = sub_4AC80;
        goto LABEL_7;
      }
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_616D0();
      sub_6D40(v13, (uint64_t)qword_7A9C8);
      uint64_t v14 = sub_616C0();
      os_log_type_t v15 = sub_61950();
      uint64_t v16 = 2;
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_20;
      }
      uint64_t v17 = "'Go back' not supported in current response mode.";
      goto LABEL_19;
    case 2:
      if (sub_4C974())
      {
        uint64_t v10 = (void *)swift_task_alloc();
        *(void *)(v0 + 88) = v10;
        void *v10 = v0;
        uint64_t v11 = sub_4AEC4;
LABEL_7:
        v10[1] = v11;
        uint64_t v8 = 1;
        char v9 = 1;
LABEL_8:
        return sub_4B108(v8, v9);
      }
      else
      {
        if (qword_75DE8 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_616D0();
        sub_6D40(v18, (uint64_t)qword_7A9C8);
        uint64_t v14 = sub_616C0();
        os_log_type_t v15 = sub_61950();
        uint64_t v16 = 0;
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v17 = "Indirect dismissal silently dismissing Siri in current response mode.";
LABEL_19:
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_0, v14, v15, v17, v19, 2u);
          swift_slowDealloc();
        }
LABEL_20:

        uint64_t v20 = *(void *)(v0 + 24);
        unint64_t v21 = *(void **)(v20 + 136);
        *(void *)(v20 + 136) = v16;
        sub_4EE30(v21);
LABEL_21:
        swift_task_dealloc();
        uint64_t v22 = *(uint64_t (**)(BOOL))(v0 + 8);
        BOOL v23 = *(unsigned __int8 *)(v0 + 104) != 3;
        return v22(v23);
      }
    case 3:
      goto LABEL_21;
    default:
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 56) = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_4AA3C;
      uint64_t v8 = 0;
      char v9 = 0;
      goto LABEL_8;
  }
}

uint64_t sub_4AA3C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_4AB3C, 0, 0);
}

uint64_t sub_4AB3C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  if (!v1)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_616D0();
    sub_6D40(v2, (uint64_t)qword_7A9C8);
    uint64_t v3 = sub_616C0();
    os_log_type_t v4 = sub_61950();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "No repeatable last dialog.", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v1 = 3;
  }
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v1;
  sub_4EE30(v7);
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v9 = *(unsigned __int8 *)(v0 + 104) != 3;
  return v8(v9);
}

uint64_t sub_4AC80(uint64_t a1)
{
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_4AD80, 0, 0);
}

uint64_t sub_4AD80()
{
  uint64_t v1 = *(void *)(v0 + 80);
  if (!v1)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_616D0();
    sub_6D40(v2, (uint64_t)qword_7A9C8);
    uint64_t v3 = sub_616C0();
    os_log_type_t v4 = sub_61950();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "No repeatable dialog before last when asked to go back.", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v1 = 2;
  }
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v1;
  sub_4EE30(v7);
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v9 = *(unsigned __int8 *)(v0 + 104) != 3;
  return v8(v9);
}

uint64_t sub_4AEC4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_4AFC4, 0, 0);
}

uint64_t sub_4AFC4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  if (!v1)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_616D0();
    sub_6D40(v2, (uint64_t)qword_7A9C8);
    uint64_t v3 = sub_616C0();
    os_log_type_t v4 = sub_61950();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "No repeatable dialog before last during indirect dismissal.", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v1 = 1;
  }
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v1;
  sub_4EE30(v7);
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v9 = *(unsigned __int8 *)(v0 + 104) != 3;
  return v8(v9);
}

uint64_t sub_4B108(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 136) = a2;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = v2;
  uint64_t v4 = sub_60750();
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = *(void *)(v4 - 8);
  *(void *)(v3 + 104) = swift_task_alloc();
  *(void *)(v3 + 112) = swift_task_alloc();
  return _swift_task_switch(sub_4B1DC, 0, 0);
}

uint64_t sub_4B1DC()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  sub_6EA4(v1 + 2, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_4B294;
  return dispatch thunk of AceServiceInvokerAsync.recentDialogs()(v2, v3);
}

uint64_t sub_4B294(uint64_t a1)
{
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_4B394, 0, 0);
}

id sub_4B394()
{
  unint64_t v1 = *(void *)(v0 + 128);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_61B60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void **)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = *(void *)(v0 + 72);
  if ((uint64_t)v2 <= v3)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_616D0();
    sub_6D40(v11, (uint64_t)qword_7A9C8);
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_616C0();
    os_log_type_t v13 = sub_61950();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = *(void *)(v0 + 72);
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 134218240;
      *(void *)(v0 + 48) = v14;
      sub_619C0();
      *(_WORD *)(v15 + 12) = 2048;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 56) = v2;
      sub_619C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v12, v13, "No recent dialog found. numStepsBack was %ld, but had %ld recent dialogs stored.", (uint8_t *)v15, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    goto LABEL_54;
  }
  if ((v1 & 0xC000000000000001) == 0)
  {
    if (v3 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)) > (unint64_t)v3)
    {
      id v4 = *(id *)(*(void *)(v0 + 128) + 8 * v3 + 32);
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_68;
  }
  id v4 = (id)sub_61A90();
LABEL_8:
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_607F0();
  id v6 = [v5 dialogPhase];

  id v7 = v4;
  if (v6)
  {
    uint64_t v8 = sub_617F0();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v17 = *(void *)(v0 + 88);
  uint64_t v18 = *(void *)(v0 + 96);
  sub_60730();
  uint64_t v19 = sub_60740();
  uint64_t v21 = v20;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v22(v16, v17);
  if (v10)
  {
    if (v19 == v8 && v10 == v21)
    {
      swift_bridgeObjectRelease();
LABEL_22:
      swift_bridgeObjectRelease();
      uint64_t v2 = v7;
      uint64_t v24 = (void **)(v0 + 64);
      goto LABEL_29;
    }
    char v23 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_22;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v25 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 88);
  sub_60710();
  uint64_t v27 = sub_60740();
  uint64_t v29 = v28;
  v22(v25, v26);
  if (!v10)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = v7;
    goto LABEL_44;
  }
  uint64_t v2 = v7;
  if (v27 == v8 && v10 == v29)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = (void **)(v0 + 64);
    goto LABEL_29;
  }
  char v30 = sub_61CA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = (void **)(v0 + 64);
  if ((v30 & 1) == 0)
  {
LABEL_44:
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_616D0();
    sub_6D40(v46, (uint64_t)qword_7A9C8);
    unint64_t v12 = sub_616C0();
    os_log_type_t v47 = sub_61960();
    if (!os_log_type_enabled(v12, v47)) {
      goto LABEL_53;
    }
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    uint64_t v49 = "The recent dialog is in a non-repeatable phase, won't repeat it.";
    goto LABEL_52;
  }
LABEL_29:
  if (*(unsigned char *)(v0 + 136) != 1)
  {
    if (qword_75DE8 == -1)
    {
LABEL_41:
      uint64_t v42 = sub_616D0();
      sub_6D40(v42, (uint64_t)qword_7A9C8);
      uint64_t v43 = sub_616C0();
      os_log_type_t v44 = sub_61950();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_0, v43, v44, "Returning a recent dialog for replaying.", v45, 2u);
        swift_slowDealloc();
      }

      uint64_t v41 = (uint64_t)v2;
      goto LABEL_56;
    }
LABEL_68:
    swift_once();
    goto LABEL_41;
  }
  uint64_t v31 = (void *)sub_607F0();
  [v31 copy];

  sub_61A00();
  swift_unknownObjectRelease();
  sub_1D8A4(0, &qword_77CD8);
  if (!swift_dynamicCast())
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_616D0();
    sub_6D40(v50, (uint64_t)qword_7A9C8);
    unint64_t v12 = sub_616C0();
    os_log_type_t v47 = sub_61970();
    if (!os_log_type_enabled(v12, v47)) {
      goto LABEL_53;
    }
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    uint64_t v49 = "Failed cloning SAUIAddViews for filtering.";
LABEL_52:
    _os_log_impl(&dword_0, v12, v47, v49, v48, 2u);
    swift_slowDealloc();
LABEL_53:

LABEL_54:
    goto LABEL_55;
  }
  uint64_t v32 = *v24;
  sub_4BC40();
  id result = [v32 views];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v34 = result;
  sub_1D8A4(0, &qword_77CE0);
  unint64_t v35 = sub_61870();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_61B60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8));
  }
  swift_bridgeObjectRelease();
  if (v36)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_616D0();
    sub_6D40(v37, (uint64_t)qword_7A9C8);
    uint64_t v38 = sub_616C0();
    os_log_type_t v39 = sub_61950();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_0, v38, v39, "Returning a recent dialog for replaying filtered down to visuals only.", v40, 2u);
      swift_slowDealloc();
    }

    uint64_t v41 = sub_607E0();
    goto LABEL_56;
  }
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_616D0();
  sub_6D40(v52, (uint64_t)qword_7A9C8);
  uint64_t v53 = sub_616C0();
  os_log_type_t v54 = sub_61960();
  if (os_log_type_enabled(v53, v54))
  {
    id v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v55 = 0;
    _os_log_impl(&dword_0, v53, v54, "The recent dialog contained no visuals.", v55, 2u);
    swift_slowDealloc();
  }

LABEL_55:
  uint64_t v41 = 0;
LABEL_56:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v51 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return (id)v51(v41);
}

void sub_4BC40()
{
  unint64_t v1 = v0;
  p_weak_ivar_lyt = &CoreServicesProvider.weak_ivar_lyt;
  id v3 = [v0 views];
  if (!v3) {
    goto LABEL_47;
  }
  id v4 = v3;
  uint64_t v5 = sub_1D8A4(0, &qword_77CE0);
  unint64_t v6 = sub_61870();

  id v7 = _swiftEmptyArrayStorage;
  uint64_t v36 = _swiftEmptyArrayStorage;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_61B60();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
    if (v8)
    {
LABEL_4:
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        while (1)
        {
          id v10 = (v6 & 0xC000000000000001) != 0 ? (id)sub_61A90() : *(id *)(v6 + 8 * v9 + 32);
          uint64_t v11 = v10;
          self;
          uint64_t v12 = swift_dynamicCastObjCClass();
          if (v12) {
            break;
          }

LABEL_7:
          if (v8 == ++v9)
          {
            swift_bridgeObjectRelease();
            id v7 = _swiftEmptyArrayStorage;
            p_weak_ivar_lyt = (void **)(&CoreServicesProvider + 56);
            goto LABEL_28;
          }
        }
        os_log_type_t v13 = (void *)v12;
        id v14 = v11;
        id v15 = [v13 itemType];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = sub_617F0();
          uint64_t v19 = v18;

          uint64_t v20 = sub_617F0();
          if (v19)
          {
            if (v17 == v20 && v19 == v21)
            {
              swift_bridgeObjectRelease_n();

LABEL_24:
              goto LABEL_7;
            }
            char v23 = sub_61CA0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            if (v23) {
              goto LABEL_24;
            }
            goto LABEL_22;
          }
        }
        else
        {
          sub_617F0();
        }
        swift_bridgeObjectRelease();

LABEL_22:
        sub_61AF0();
        sub_61B20();
        sub_61B30();
        sub_61B00();
        goto LABEL_7;
      }
      __break(1u);
      goto LABEL_46;
    }
  }
  swift_bridgeObjectRelease();
LABEL_28:
  Class isa = sub_61860().super.isa;
  swift_release();
  uint64_t v25 = &CoreServicesProvider.weak_ivar_lyt;
  [v1 setViews:isa];

  id v26 = objc_msgSend(v1, (SEL)p_weak_ivar_lyt[371]);
  if (!v26) {
    goto LABEL_48;
  }
  uint64_t v27 = v26;
  unint64_t v28 = sub_61870();

  if (v28 >> 62) {
    goto LABEL_40;
  }
  uint64_t v29 = *(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFFF8));
  if (v29)
  {
    while (1)
    {
      uint64_t v36 = v7;
      sub_61B10();
      if (v29 < 0) {
        break;
      }
      id v7 = (void *)v5;
      char v30 = v1;
      uint64_t v5 = 0;
      unint64_t v1 = (void *)(v28 & 0xC000000000000001);
      while (v29 != v5)
      {
        if (v1) {
          id v31 = (id)sub_61A90();
        }
        else {
          id v31 = *(id *)(v28 + 8 * v5 + 32);
        }
        uint64_t v32 = v31;
        uint64_t v34 = v31;
        sub_4EA6C(&v34, &v35);

        ++v5;
        uint64_t v25 = v35;
        sub_61AF0();
        sub_61B20();
        sub_61B30();
        sub_61B00();
        if (v29 == v5)
        {
          swift_bridgeObjectRelease();
          unint64_t v1 = v30;
          uint64_t v25 = (void **)(&CoreServicesProvider + 56);
          goto LABEL_42;
        }
      }
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_61B60();
      swift_bridgeObjectRelease();
      if (!v29) {
        goto LABEL_41;
      }
    }
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    swift_release();
    __break(1u);
    return;
  }
LABEL_41:
  swift_bridgeObjectRelease();
LABEL_42:
  Class v33 = sub_61860().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, (SEL)v25[372], v33);
}

uint64_t sub_4C094(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_4C0B4, 0, 0);
}

uint64_t sub_4C0B4()
{
  uint64_t v1 = *(void **)(v0[3] + 136);
  v0[4] = v1;
  switch((unint64_t)v1)
  {
    case 0uLL:
      uint64_t v2 = (void *)swift_task_alloc();
      v0[6] = v2;
      *uint64_t v2 = v0;
      v2[1] = sub_4C5A4;
      uint64_t v3 = v0[2];
      id v4 = "RepeatRecentDialog#silentDismissal";
      goto LABEL_10;
    case 1uLL:
      uint64_t v8 = (void *)swift_task_alloc();
      v0[7] = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_4C698;
      uint64_t v3 = v0[2];
      uint64_t v9 = 0xD000000000000027;
      id v10 = "RepeatRecentDialog#acknowledgeDismissal";
      goto LABEL_8;
    case 2uLL:
      uint64_t v11 = (void *)swift_task_alloc();
      v0[9] = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_4C880;
      uint64_t v3 = v0[2];
      uint64_t v9 = 0xD000000000000020;
      id v10 = "RepeatRecentDialog#couldntGoBack";
LABEL_8:
      unint64_t v12 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      goto LABEL_11;
    case 3uLL:
      os_log_type_t v13 = (void *)swift_task_alloc();
      v0[8] = v13;
      *os_log_type_t v13 = v0;
      v13[1] = sub_4C78C;
      uint64_t v3 = v0[2];
      id v4 = "RepeatRecentDialog#nothingToRepeat";
LABEL_10:
      unint64_t v12 = (unint64_t)(v4 - 32) | 0x8000000000000000;
      uint64_t v9 = 0xD000000000000022;
LABEL_11:
      uint64_t result = sub_4D658(v3, v9, v12);
      break;
    case 4uLL:
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_616D0();
      sub_6D40(v14, (uint64_t)qword_7A9C8);
      id v15 = sub_616C0();
      os_log_type_t v16 = sub_61970();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        swift_slowDealloc();
      }

      sub_608F0();
      uint64_t v18 = (uint64_t (*)(void))v0[1];
      uint64_t result = v18();
      break;
    default:
      sub_4EE20(v1);
      uint64_t v5 = (void *)swift_task_alloc();
      v0[5] = v5;
      void *v5 = v0;
      v5[1] = sub_4C448;
      uint64_t v6 = v0[2];
      uint64_t result = sub_4CFAC(v6, (uint64_t)v1);
      break;
  }
  return result;
}

uint64_t sub_4C448()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_4C544, 0, 0);
}

uint64_t sub_4C544()
{
  sub_4EE30(*(id *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_4C5A4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_4C698()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_4C78C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_4C880()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

BOOL sub_4C974()
{
  uint64_t v1 = sub_61430();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v50 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6D90(&qword_77CC0);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v54 = (uint64_t)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = sub_6D90(&qword_77CC8);
  uint64_t v14 = __chkstk_darwin(v12 - 8, v13);
  uint64_t v49 = (uint64_t)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  uint64_t v53 = (char *)&v46 - v18;
  uint64_t v20 = __chkstk_darwin(v17, v19);
  uint64_t v22 = (char *)&v46 - v21;
  uint64_t v24 = __chkstk_darwin(v20, v23);
  id v26 = (char *)&v46 - v25;
  __chkstk_darwin(v24, v27);
  uint64_t v29 = (char *)&v46 - v28;
  char v30 = *(void (**)(uint64_t))(v0 + 144);
  uint64_t v31 = swift_retain();
  v30(v31);
  swift_release();
  sub_61410();
  uint64_t v51 = *(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56);
  v51(v26, 0, 1, v1);
  uint64_t v52 = v5;
  uint64_t v32 = (uint64_t)&v11[*(int *)(v5 + 48)];
  sub_4ED08((uint64_t)v26, (uint64_t)v11);
  sub_4ED08((uint64_t)v29, v32);
  uint64_t v55 = v2;
  Class v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v33((uint64_t)v11, 1, v1) == 1)
  {
    sub_6EE8((uint64_t)v26, &qword_77CC8);
    if (v33(v32, 1, v1) == 1)
    {
      sub_6EE8((uint64_t)v11, &qword_77CC8);
LABEL_14:
      uint64_t v37 = (uint64_t)v29;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  sub_4ED08((uint64_t)v11, (uint64_t)v22);
  if (v33(v32, 1, v1) == 1)
  {
    sub_6EE8((uint64_t)v26, &qword_77CC8);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v22, v1);
LABEL_6:
    sub_6EE8((uint64_t)v11, &qword_77CC0);
    goto LABEL_7;
  }
  os_log_type_t v39 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v50, v32, v1);
  sub_4EDD8(&qword_77CD0, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  int v48 = sub_617D0();
  os_log_type_t v47 = v22;
  uint64_t v40 = *(void (**)(char *, uint64_t))(v55 + 8);
  v40(v39, v1);
  sub_6EE8((uint64_t)v26, &qword_77CC8);
  v40(v47, v1);
  sub_6EE8((uint64_t)v11, &qword_77CC8);
  if (v48) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v34 = (uint64_t)v53;
  sub_61420();
  v51((char *)v34, 0, 1, v1);
  uint64_t v35 = v54;
  uint64_t v36 = v54 + *(int *)(v52 + 48);
  sub_4ED08(v34, v54);
  sub_4ED70((uint64_t)v29, v36);
  if (v33(v35, 1, v1) == 1)
  {
    sub_6EE8(v34, &qword_77CC8);
    if (v33(v36, 1, v1) == 1)
    {
      uint64_t v37 = v35;
LABEL_15:
      sub_6EE8(v37, &qword_77CC8);
      return 0;
    }
    goto LABEL_12;
  }
  uint64_t v38 = v49;
  sub_4ED08(v35, v49);
  if (v33(v36, 1, v1) == 1)
  {
    sub_6EE8(v34, &qword_77CC8);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v38, v1);
LABEL_12:
    sub_6EE8(v35, &qword_77CC0);
    return 1;
  }
  uint64_t v42 = v55;
  uint64_t v43 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v50, v36, v1);
  sub_4EDD8(&qword_77CD0, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v44 = sub_617D0();
  uint64_t v45 = *(void (**)(char *, uint64_t))(v42 + 8);
  v45(v43, v1);
  sub_6EE8(v34, &qword_77CC8);
  v45((char *)v38, v1);
  sub_6EE8(v35, &qword_77CC8);
  return (v44 & 1) == 0;
}

uint64_t sub_4CFAC(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  sub_6D90((uint64_t *)&unk_76560);
  v3[10] = swift_task_alloc();
  uint64_t v4 = sub_60DC0();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v5 = sub_60940();
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  return _swift_task_switch(sub_4D0FC, 0, 0);
}

uint64_t sub_4D0FC()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61950();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Re-rendering a recent dialog", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[16];
  uint64_t v7 = v0[14];
  uint64_t v17 = v0[13];
  uint64_t v8 = v0[12];
  uint64_t v18 = v0[11];
  uint64_t v9 = (void *)v0[9];
  uint64_t v10 = v0[10];

  sub_60930();
  sub_60800();
  sub_60920();
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_62660;
  *(void *)(v11 + 32) = sub_607F0();
  sub_61880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v10, v6, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v7);
  sub_60DB0();
  uint64_t v12 = v9[10];
  uint64_t v13 = v9[11];
  sub_6EA4(v9 + 7, v12);
  v0[5] = v18;
  v0[6] = (uint64_t)&protocol witness table for AceOutput;
  uint64_t v14 = sub_838C(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(v14, v17, v18);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v15;
  *uint64_t v15 = v0;
  v15[1] = sub_4D390;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 2, v12, v13);
}

uint64_t sub_4D390()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    os_log_type_t v3 = sub_4D580;
  }
  else
  {
    sub_63E8(v2 + 16);
    os_log_type_t v3 = sub_4D4B0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_4D4B0()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[12];
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_4D580()
{
  sub_63E8((uint64_t)(v0 + 2));
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[12];
  sub_608F0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_4D658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[36] = a3;
  v4[37] = v3;
  v4[34] = a1;
  v4[35] = a2;
  sub_6D90((uint64_t *)&unk_76560);
  v4[38] = swift_task_alloc();
  uint64_t v5 = sub_60DC0();
  v4[39] = v5;
  unsigned char v4[40] = *(void *)(v5 - 8);
  v4[41] = swift_task_alloc();
  uint64_t v6 = sub_60B00();
  v4[42] = v6;
  v4[43] = *(void *)(v6 - 8);
  v4[44] = swift_task_alloc();
  uint64_t v7 = sub_60A40();
  v4[45] = v7;
  v4[46] = *(void *)(v7 - 8);
  v4[47] = swift_task_alloc();
  return _swift_task_switch(sub_4D804, 0, 0);
}

uint64_t sub_4D804()
{
  sub_6EA4((void *)(v0[37] + 96), *(void *)(v0[37] + 120));
  unint64_t v1 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[48] = v1;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v3 = sub_3C438(inited);
  v0[49] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[50] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_4D938;
  uint64_t v6 = v0[35];
  uint64_t v5 = v0[36];
  return sub_38544(v6, v5, v1, v3);
}

uint64_t sub_4D938(uint64_t a1)
{
  *(void *)(*(void *)v2 + 408) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_errorRelease();
    unint64_t v3 = sub_4DF58;
  }
  else
  {
    unint64_t v3 = sub_4DA98;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_4DA98()
{
  uint64_t v27 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61950();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 288);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 280);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 264) = sub_316A4(v6, v5, &v26);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v2, v3, "Executing dialog %s and dismissing Siri", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = *(void **)(v0 + 408);
  uint64_t v10 = *(void *)(v0 + 344);
  uint64_t v9 = *(void *)(v0 + 352);
  uint64_t v11 = *(void *)(v0 + 336);
  uint64_t v25 = *(void *)(v0 + 320);
  uint64_t v21 = *(void *)(v0 + 304);
  uint64_t v22 = *(void *)(v0 + 328);
  uint64_t v23 = *(void **)(v0 + 296);
  uint64_t v24 = *(void *)(v0 + 312);
  swift_bridgeObjectRetain();
  id v12 = [v8 speak];
  sub_61870();

  id v13 = [v8 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v11);
  sub_609F0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_606D0();
  uint64_t v14 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v21, 1, 1, v14);
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_62660;
  *(void *)(v15 + 32) = [objc_allocWithZone((Class)SAUICloseAssistant) init];
  uint64_t v26 = v15;
  sub_61880();
  *(void *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_60880();
  swift_bridgeObjectRelease();
  sub_6EE8(v0 + 176, (uint64_t *)&unk_78310);
  sub_6EE8(v21, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 136);
  sub_63E8(v0 + 96);
  uint64_t v16 = v23[10];
  uint64_t v17 = v23[11];
  sub_6EA4(v23 + 7, v16);
  *(void *)(v0 + 240) = v24;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  uint64_t v18 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(v18, v22, v24);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_4E174;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v16, v17);
}

uint64_t sub_4DF58()
{
  uint64_t v11 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[36];
  if (v4)
  {
    uint64_t v6 = v0[35];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[32] = sub_316A4(v6, v5, &v10);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v2, v3, "Couldn't create a dialog %s.", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_608F0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_4E174()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    os_log_type_t v3 = sub_4E380;
  }
  else
  {
    sub_63E8(v2 + 216);
    os_log_type_t v3 = sub_4E294;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_4E294()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v3 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = v0[45];
  uint64_t v6 = v0[40];
  uint64_t v5 = v0[41];
  uint64_t v7 = v0[39];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_4E380()
{
  sub_63E8((uint64_t)(v0 + 27));
  uint64_t v1 = (void *)v0[51];
  uint64_t v3 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = v0[45];
  uint64_t v6 = v0[40];
  uint64_t v5 = v0[41];
  uint64_t v7 = v0[39];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_4E474()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);
  sub_4EE30(*(id *)(v0 + 136));
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RepeatRecentDialogFlow()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for RepeatRecentDialogFlow.Action(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for RepeatRecentDialogFlow.Action(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for RepeatRecentDialogFlow.Action(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for RepeatRecentDialogFlow.Action(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for RepeatRecentDialogFlow.Action(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for RepeatRecentDialogFlow.Action(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RepeatRecentDialogFlow.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_4E6DC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_4E6F4(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for RepeatRecentDialogFlow.Action()
{
  return &type metadata for RepeatRecentDialogFlow.Action;
}

uint64_t sub_4E724()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_616D0();
  sub_6D40(v0, (uint64_t)qword_7A9C8);
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61980();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Non-async on(input:) is not supported in RepeatRecentDialogFlow.", v3, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_4E800(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6A14;
  return sub_4A618(a1);
}

uint64_t sub_4E898()
{
  return sub_60550();
}

uint64_t sub_4E8F4(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  uint64_t v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_6C0C;
  return _swift_task_switch(sub_4C0B4, 0, 0);
}

uint64_t sub_4E9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for RepeatRecentDialogFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_4E9DC(uint64_t a1, uint64_t a2)
{
  return sub_4EDD8(&qword_77258, a2, (void (*)(uint64_t))type metadata accessor for RepeatRecentDialogFlow);
}

uint64_t sub_4EA24(uint64_t a1, uint64_t a2)
{
  return sub_4EDD8(&qword_77CB8, a2, (void (*)(uint64_t))type metadata accessor for RepeatRecentDialogFlow);
}

void sub_4EA6C(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = v3;
    id v7 = [v5 dialog];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 content];
      if (v9)
      {
        uint64_t v10 = v9;
        [v5 copy];
        sub_61A00();
        swift_unknownObjectRelease();
        sub_1D8A4(0, &qword_77CE8);
        if (swift_dynamicCast())
        {
          [v8 copy];
          sub_61A00();
          swift_unknownObjectRelease();
          sub_1D8A4(0, &qword_77CF0);
          if (swift_dynamicCast())
          {
            [v10 copy];
            sub_61A00();
            swift_unknownObjectRelease();
            sub_1D8A4(0, &qword_77CF8);
            if (swift_dynamicCast())
            {
              NSString v11 = sub_617E0();
              [v14 setSpeakableTextOverride:v11];

              [v14 setContent:v14];
              id v12 = v14;
              [v12 setDialog:v14];

              *a2 = v12;
              return;
            }
          }
          else
          {
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
    *a2 = v5;
  }
  else
  {
    *a2 = v3;
    id v13 = v3;
  }
}

uint64_t sub_4ED08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4ED70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_4EDD8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

id sub_4EE20(id result)
{
  if ((unint64_t)result >= 4) {
    return result;
  }
  return result;
}

void sub_4EE30(id a1)
{
  if (a1 != &dword_4) {
    sub_4EE40(a1);
  }
}

void sub_4EE40(id a1)
{
  if ((unint64_t)a1 >= 4) {
}
  }

unint64_t sub_4EE54(uint64_t a1)
{
  uint64_t v66 = sub_611D0();
  uint64_t v69 = *(void *)(v66 - 8);
  __chkstk_darwin(v66, v2);
  int v64 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_6D90(&qword_77D00);
  __chkstk_darwin(v67, v4);
  uint64_t v71 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6D90(&qword_77D08);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v65 = (uint64_t)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v70 = (uint64_t)&v62 - v12;
  __chkstk_darwin(v11, v13);
  uint64_t v68 = (uint64_t)&v62 - v14;
  uint64_t v15 = sub_6D90(&qword_76CF0);
  __chkstk_darwin(v15 - 8, v16);
  unint64_t v72 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_60EC0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v73 = v18;
  uint64_t v74 = v19;
  __chkstk_darwin(v18, v20);
  uint64_t v75 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_60E10();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22, v24);
  uint64_t v26 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_60D10();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v29);
  uint64_t v31 = (char *)&v62 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_60DA0();
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32, v34);
  uint64_t v36 = (char *)&v62 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v31, a1, v27);
  if ((*(unsigned int (**)(char *, uint64_t))(v28 + 88))(v31, v27) != enum case for Parse.uso(_:))
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
    return 3;
  }
  (*(void (**)(char *, uint64_t))(v28 + 96))(v31, v27);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v36, v31, v32);
  sub_60D90();
  uint64_t v37 = sub_60E00();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  uint64_t v38 = v32;
  if (*(void *)(v37 + 16))
  {
    uint64_t v40 = v73;
    uint64_t v39 = v74;
    uint64_t v41 = (uint64_t)v72;
    (*(void (**)(char *, unint64_t, uint64_t))(v74 + 16))(v72, v37 + ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80)), v73);
    uint64_t v42 = 0;
    uint64_t v43 = v75;
  }
  else
  {
    uint64_t v42 = 1;
    uint64_t v40 = v73;
    uint64_t v39 = v74;
    uint64_t v43 = v75;
    uint64_t v41 = (uint64_t)v72;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v41, v42, 1, v40);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v41, 1, v40) == 1)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
    sub_6EE8(v41, &qword_76CF0);
    return 3;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v43, v41, v40);
  if (sub_60EA0())
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
    return 0;
  }
  unint64_t result = sub_61000();
  unint64_t v45 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_61B60();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v61)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      sub_61150();
      swift_release();
      if (!v79)
      {
        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
        sub_6EE8((uint64_t)&v78, &qword_76D10);
        return 3;
      }
      sub_2CDE4(&v78, v80);
      sub_32670((uint64_t)v80, (uint64_t)&v78);
      sub_611B0();
      if (swift_dynamicCast())
      {
        sub_63E8((uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
        swift_release();
        sub_63E8((uint64_t)&v78);
        return 0;
      }
      sub_61230();
      if (swift_dynamicCast())
      {
        sub_63E8((uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
        swift_release();
        sub_63E8((uint64_t)&v78);
        return 1;
      }
      sub_61250();
      if (swift_dynamicCast()
        && (swift_release(), sub_32670((uint64_t)v80, (uint64_t)v77), swift_dynamicCast()))
      {
        uint64_t v46 = v76;
        swift_retain();
        sub_61030();
        uint64_t v74 = v46;
        swift_release();
        uint64_t v63 = v38;
        uint64_t v62 = v36;
        if (v77[0])
        {
          uint64_t v47 = v68;
          sub_611C0();
          swift_release();
          uint64_t v48 = v66;
          uint64_t v49 = v71;
          uint64_t v50 = v69;
        }
        else
        {
          uint64_t v50 = v69;
          uint64_t v47 = v68;
          uint64_t v48 = v66;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v68, 1, 1, v66);
          uint64_t v49 = v71;
        }
        uint64_t v51 = v70;
        (*(void (**)(uint64_t, void, uint64_t))(v50 + 104))(v70, enum case for UsoEntity_common_Interjection.DefinedValues.common_Interjection_IndirectDismissal(_:), v48);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v51, 0, 1, v48);
        uint64_t v52 = v50;
        uint64_t v53 = v49 + *(int *)(v67 + 48);
        sub_4FB10(v47, v49);
        uint64_t v73 = v53;
        sub_4FB10(v51, v53);
        uint64_t v54 = v47;
        uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48);
        if (v55(v49, 1, v48) == 1)
        {
          swift_release();
          sub_6EE8(v51, &qword_77D08);
          sub_6EE8(v54, &qword_77D08);
          sub_63E8((uint64_t)v80);
          (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
          (*(void (**)(char *, uint64_t))(v33 + 8))(v62, v63);
          if (v55(v73, 1, v48) == 1)
          {
            sub_6EE8(v71, &qword_77D08);
LABEL_37:
            sub_63E8((uint64_t)&v78);
            return 2;
          }
          goto LABEL_35;
        }
        uint64_t v56 = v65;
        sub_4FB10(v49, v65);
        uint64_t v57 = v73;
        if (v55(v73, 1, v48) == 1)
        {
          swift_release();
          sub_6EE8(v70, &qword_77D08);
          sub_6EE8(v68, &qword_77D08);
          sub_63E8((uint64_t)v80);
          (*(void (**)(char *, uint64_t))(v39 + 8))(v75, v40);
          (*(void (**)(char *, uint64_t))(v33 + 8))(v62, v63);
          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v56, v48);
LABEL_35:
          sub_6EE8(v71, &qword_77D00);
          goto LABEL_28;
        }
        uint64_t v58 = v69;
        uint64_t v59 = v64;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v64, v57, v48);
        sub_4FB78();
        LODWORD(v73) = sub_617D0();
        swift_release();
        uint64_t v60 = *(void (**)(char *, uint64_t))(v58 + 8);
        v60(v59, v48);
        sub_6EE8(v70, &qword_77D08);
        sub_6EE8(v68, &qword_77D08);
        sub_63E8((uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v75, v40);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v62, v63);
        v60((char *)v56, v48);
        sub_6EE8(v49, &qword_77D08);
        if (v73) {
          goto LABEL_37;
        }
      }
      else
      {
        sub_63E8((uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v38);
      }
LABEL_28:
      sub_63E8((uint64_t)&v78);
      return 3;
    }
  }
  else if (!*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_17;
  }
  if ((v45 & 0xC000000000000001) != 0)
  {
    sub_61A90();
    goto LABEL_17;
  }
  if (*(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8)))
  {
    swift_retain();
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_4FB10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_77D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_4FB78()
{
  unint64_t result = qword_77D10;
  if (!qword_77D10)
  {
    sub_611D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D10);
  }
  return result;
}

uint64_t sub_4FBD0()
{
  sub_602A0();
  swift_allocObject();
  uint64_t result = sub_60290();
  qword_7A9F8 = result;
  return result;
}

uint64_t sub_4FC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 >= 4u)
  {
    if (a11 != 4) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t destroy for SiriLinkViewModel(uint64_t a1)
{
  return sub_4FCE4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80));
}

uint64_t sub_4FCE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 >= 4u)
  {
    if (a11 != 4) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriLinkViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  unsigned __int8 v14 = *(unsigned char *)(a2 + 80);
  sub_4FC10(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for SiriLinkViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  unsigned __int8 v25 = *(unsigned char *)(a2 + 80);
  sub_4FC10(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  unsigned __int8 v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  sub_4FCE4(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 initializeWithTake for SiriLinkViewModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SiriLinkViewModel(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  unsigned __int8 v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  sub_4FCE4(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriLinkViewModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriLinkViewModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_50044(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_5004C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel()
{
  return &type metadata for SiriLinkViewModel;
}

unint64_t sub_50064(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0x654874706D6F7270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_50110(void *a1)
{
  uint64_t v48 = sub_6D90(&qword_77D18);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48, v2);
  char v44 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_6D90(&qword_77D20);
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47, v4);
  uint64_t v43 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6D90(&qword_77D28);
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6D90(&qword_77D30);
  uint64_t v39 = *(void *)(v10 - 8);
  uint64_t v40 = v10;
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_6D90(&qword_77D38);
  uint64_t v38 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_6D90(&qword_77D40);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v50 = v18;
  uint64_t v51 = v19;
  __chkstk_darwin(v18, v20);
  unsigned __int8 v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA4(a1, a1[3]);
  sub_50D10();
  uint64_t v49 = v22;
  sub_61D80();
  sub_50CE8(v83, (uint64_t)&v57);
  switch(v62)
  {
    case 1:
      long long v70 = v59;
      long long v71 = v60;
      long long v72 = v61;
      long long v68 = v57;
      long long v69 = v58;
      LOBYTE(v52) = 1;
      sub_50EB4();
      uint64_t v27 = v49;
      uint64_t v26 = v50;
      sub_61C30();
      long long v54 = v70;
      long long v55 = v71;
      long long v56 = v72;
      long long v52 = v68;
      long long v53 = v69;
      sub_50E0C();
      uint64_t v28 = v40;
      sub_61C70();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v28);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v27, v26);
      break;
    case 2:
      long long v75 = v59;
      long long v76 = v60;
      long long v77 = v61;
      long long v73 = v57;
      long long v74 = v58;
      LOBYTE(v52) = 2;
      sub_50E60();
      uint64_t v30 = v49;
      uint64_t v29 = v50;
      sub_61C30();
      long long v54 = v75;
      long long v55 = v76;
      long long v56 = v77;
      long long v52 = v73;
      long long v53 = v74;
      sub_50E0C();
      uint64_t v31 = v42;
      sub_61C70();
      uint64_t v32 = v41;
      goto LABEL_6;
    case 3:
      long long v80 = v59;
      long long v81 = v60;
      long long v82 = v61;
      long long v78 = v57;
      long long v79 = v58;
      LOBYTE(v52) = 3;
      sub_50DB8();
      uint64_t v9 = v43;
      uint64_t v30 = v49;
      uint64_t v29 = v50;
      sub_61C30();
      long long v54 = v80;
      long long v55 = v81;
      long long v56 = v82;
      long long v52 = v78;
      long long v53 = v79;
      sub_50E0C();
      uint64_t v31 = v47;
      sub_61C70();
      uint64_t v32 = v45;
LABEL_6:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v31);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v30, v29);
      break;
    case 4:
      LOBYTE(v52) = 4;
      sub_50D64();
      uint64_t v33 = v44;
      uint64_t v35 = v49;
      uint64_t v34 = v50;
      sub_61C30();
      uint64_t v36 = v48;
      sub_61C50();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v36);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v35, v34);
      break;
    default:
      long long v65 = v59;
      long long v66 = v60;
      long long v67 = v61;
      long long v63 = v57;
      long long v64 = v58;
      LOBYTE(v52) = 0;
      sub_50F08();
      uint64_t v24 = v49;
      uint64_t v23 = v50;
      sub_61C30();
      long long v54 = v65;
      long long v55 = v66;
      long long v56 = v67;
      long long v52 = v63;
      long long v53 = v64;
      sub_50E0C();
      sub_61C70();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v14);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v24, v23);
      break;
  }
  return result;
}

void sub_50860(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_5086C(uint64_t a1)
{
  unint64_t v2 = sub_50E60();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_508A8(uint64_t a1)
{
  unint64_t v2 = sub_50E60();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_508E4(uint64_t a1)
{
  unint64_t v2 = sub_50DB8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_50920(uint64_t a1)
{
  unint64_t v2 = sub_50DB8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_5095C(uint64_t a1)
{
  unint64_t v2 = sub_50F08();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_50998(uint64_t a1)
{
  unint64_t v2 = sub_50F08();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_509D4(uint64_t a1)
{
  unint64_t v2 = sub_50EB4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_50A10(uint64_t a1)
{
  unint64_t v2 = sub_50EB4();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_50A4C()
{
  return sub_50064(*v0);
}

uint64_t sub_50A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_50F5C(a1, a2);
  *a3 = result;
  return result;
}

void sub_50A7C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_50A88(uint64_t a1)
{
  unint64_t v2 = sub_50D10();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_50AC4(uint64_t a1)
{
  unint64_t v2 = sub_50D10();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_50B00()
{
  return sub_61D60();
}

void sub_50B44()
{
}

Swift::Int sub_50B6C()
{
  return sub_61D60();
}

uint64_t sub_50BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_5116C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_50BD8(uint64_t a1)
{
  unint64_t v2 = sub_50D64();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_50C14(uint64_t a1)
{
  unint64_t v2 = sub_50D64();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_50C50(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_511E8(a1, (uint64_t)v4);
  if (!v2) {
    sub_50CE8((uint64_t)v4, a2);
  }
}

uint64_t sub_50C98(void *a1)
{
  sub_50CE8(v1, (uint64_t)v4);
  return sub_50110(a1);
}

uint64_t sub_50CE8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(unsigned char *)(a2 + 80) = *(unsigned char *)(a1 + 80);
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 64) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  return a2;
}

unint64_t sub_50D10()
{
  unint64_t result = qword_77D48;
  if (!qword_77D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D48);
  }
  return result;
}

unint64_t sub_50D64()
{
  unint64_t result = qword_77D50;
  if (!qword_77D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D50);
  }
  return result;
}

unint64_t sub_50DB8()
{
  unint64_t result = qword_77D58;
  if (!qword_77D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D58);
  }
  return result;
}

unint64_t sub_50E0C()
{
  unint64_t result = qword_77D60;
  if (!qword_77D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D60);
  }
  return result;
}

unint64_t sub_50E60()
{
  unint64_t result = qword_77D68;
  if (!qword_77D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D68);
  }
  return result;
}

unint64_t sub_50EB4()
{
  unint64_t result = qword_77D70;
  if (!qword_77D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D70);
  }
  return result;
}

unint64_t sub_50F08()
{
  unint64_t result = qword_77D78;
  if (!qword_77D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77D78);
  }
  return result;
}

uint64_t sub_50F5C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000000000651C0 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000000000651E0 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000000065200 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000000065220 || (sub_61CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x654874706D6F7270 && a2 == 0xEC00000072656461)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_61CA0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_5116C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_61CA0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_511DC()
{
  return 12383;
}

__n128 sub_511E8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v59 = sub_6D90(&qword_77D80);
  uint64_t v64 = *(void *)(v59 - 8);
  __chkstk_darwin(v59, v3);
  *(void *)&long long v69 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_6D90(&qword_77D88);
  uint64_t v65 = *(void *)(v63 - 8);
  __chkstk_darwin(v63, v5);
  v68.n128_u64[0] = (unint64_t)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_6D90(&qword_77D90);
  uint64_t v62 = *(void *)(v61 - 8);
  __chkstk_darwin(v61, v7);
  long long v67 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_6D90(&qword_77D98);
  uint64_t v57 = *(void *)(v60 - 8);
  __chkstk_darwin(v60, v9);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_6D90(&qword_77DA0);
  uint64_t v58 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_6D90(&qword_77DA8);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1[3];
  long long v78 = a1;
  sub_6EA4(a1, v21);
  sub_50D10();
  uint64_t v22 = v70;
  sub_61D70();
  if (v22) {
    goto LABEL_10;
  }
  uint64_t v55 = v12;
  long long v56 = v11;
  uint64_t v23 = v67;
  unint64_t v24 = v68.n128_u64[0];
  uint64_t v25 = v69;
  *(void *)&long long v70 = v17;
  uint64_t v26 = sub_61C20();
  if (*(void *)(v26 + 16) != 1)
  {
    uint64_t v29 = v16;
    uint64_t v30 = sub_61AC0();
    swift_allocError();
    uint64_t v31 = v20;
    uint64_t v33 = v32;
    sub_6D90(&qword_77DB0);
    *uint64_t v33 = &type metadata for SiriLinkViewModel;
    sub_61BD0();
    sub_61AB0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v33, enum case for DecodingError.typeMismatch(_:), v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v31, v29);
LABEL_10:
    sub_63E8((uint64_t)v78);
    return result;
  }
  uint64_t v27 = *(unsigned __int8 *)(v26 + 32);
  switch(*(unsigned char *)(v26 + 32))
  {
    case 1:
      LOBYTE(v71) = 1;
      sub_50EB4();
      uint64_t v34 = v56;
      sub_61BC0();
      sub_51BF0();
      uint64_t v35 = v60;
      sub_61C10();
      uint64_t v58 = v27;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v34, v35);
      swift_bridgeObjectRelease();
      uint64_t v52 = v70;
      goto LABEL_12;
    case 2:
      LOBYTE(v71) = 2;
      sub_50E60();
      sub_61BC0();
      sub_51BF0();
      uint64_t v38 = v61;
      sub_61C10();
      uint64_t v39 = v23;
      uint64_t v52 = v70;
      uint64_t v58 = v27;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v38);
      goto LABEL_11;
    case 3:
      long long v67 = (char *)v26;
      LOBYTE(v71) = 3;
      sub_50DB8();
      sub_61BC0();
      sub_51BF0();
      uint64_t v36 = v63;
      sub_61C10();
      uint64_t v52 = v70;
      uint64_t v58 = v27;
      (*(void (**)(unint64_t, uint64_t))(v65 + 8))(v24, v36);
LABEL_11:
      swift_bridgeObjectRelease();
LABEL_12:
      (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v16);
      goto LABEL_13;
    case 4:
      long long v67 = (char *)v26;
      LOBYTE(v71) = 4;
      sub_50D64();
      sub_61BC0();
      uint64_t v58 = v27;
      uint64_t v40 = v20;
      uint64_t v41 = v16;
      uint64_t v42 = v59;
      uint64_t v43 = sub_61BF0();
      uint64_t v44 = v70;
      uint64_t v45 = v43;
      unint64_t v47 = v46;
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v25, v42);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v41);
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      long long v69 = 0u;
      long long v70 = v47;
      __n128 v51 = 0uLL;
      goto LABEL_14;
    default:
      long long v67 = (char *)v26;
      LOBYTE(v71) = 0;
      sub_50F08();
      sub_61BC0();
      sub_51BF0();
      uint64_t v28 = v55;
      sub_61C10();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v15, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v20, v16);
      uint64_t v58 = v27;
LABEL_13:
      uint64_t v45 = v71;
      uint64_t v48 = v73;
      uint64_t v49 = v74;
      uint64_t v50 = v75;
      long long v69 = v76;
      long long v70 = v72;
      __n128 v51 = v77;
LABEL_14:
      __n128 v68 = v51;
      uint64_t v53 = v66;
      sub_63E8((uint64_t)v78);
      *(void *)uint64_t v53 = v45;
      *(_OWORD *)(v53 + 8) = v70;
      *(void *)(v53 + 24) = v48;
      *(void *)(v53 + 32) = v49;
      *(void *)(v53 + 40) = v50;
      __n128 result = v68;
      *(_OWORD *)(v53 + 48) = v69;
      *(__n128 *)(v53 + 64) = result;
      *(unsigned char *)(v53 + 80) = v58;
      break;
  }
  return result;
}

unint64_t sub_51BF0()
{
  unint64_t result = qword_77DB8;
  if (!qword_77DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DB8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriLinkViewModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriLinkViewModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x51DA0);
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

ValueMetadata *type metadata accessor for SiriLinkViewModel.CodingKeys()
{
  return &type metadata for SiriLinkViewModel.CodingKeys;
}

uint64_t sub_51DE4()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel.AutoShortcutFirstRunCodingKeys()
{
  return &type metadata for SiriLinkViewModel.AutoShortcutFirstRunCodingKeys;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel.AutoShortcutFirstRunWatchCodingKeys()
{
  return &type metadata for SiriLinkViewModel.AutoShortcutFirstRunWatchCodingKeys;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel.AutoShortcutAppEnabledCodingKeys()
{
  return &type metadata for SiriLinkViewModel.AutoShortcutAppEnabledCodingKeys;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel.AutoShortcutAppEnabledWatchCodingKeys()
{
  return &type metadata for SiriLinkViewModel.AutoShortcutAppEnabledWatchCodingKeys;
}

uint64_t getEnumTagSinglePayload for AlternativeQuestionError(unsigned int *a1, int a2)
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

unsigned char *_s17CAMRootFlowPlugin17SiriLinkViewModelO30AutoShortcutFirstRunCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x51F18);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriLinkViewModel.PromptHeaderCodingKeys()
{
  return &type metadata for SiriLinkViewModel.PromptHeaderCodingKeys;
}

unint64_t sub_51F54()
{
  unint64_t result = qword_77DC0;
  if (!qword_77DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DC0);
  }
  return result;
}

unint64_t sub_51FAC()
{
  unint64_t result = qword_77DC8;
  if (!qword_77DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DC8);
  }
  return result;
}

unint64_t sub_52004()
{
  unint64_t result = qword_77DD0;
  if (!qword_77DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DD0);
  }
  return result;
}

unint64_t sub_5205C()
{
  unint64_t result = qword_77DD8;
  if (!qword_77DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DD8);
  }
  return result;
}

unint64_t sub_520B4()
{
  unint64_t result = qword_77DE0;
  if (!qword_77DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DE0);
  }
  return result;
}

unint64_t sub_5210C()
{
  unint64_t result = qword_77DE8;
  if (!qword_77DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DE8);
  }
  return result;
}

unint64_t sub_52164()
{
  unint64_t result = qword_77DF0;
  if (!qword_77DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DF0);
  }
  return result;
}

unint64_t sub_521BC()
{
  unint64_t result = qword_77DF8;
  if (!qword_77DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77DF8);
  }
  return result;
}

unint64_t sub_52214()
{
  unint64_t result = qword_77E00;
  if (!qword_77E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E00);
  }
  return result;
}

unint64_t sub_5226C()
{
  unint64_t result = qword_77E08;
  if (!qword_77E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E08);
  }
  return result;
}

unint64_t sub_522C4()
{
  unint64_t result = qword_77E10;
  if (!qword_77E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E10);
  }
  return result;
}

unint64_t sub_5231C()
{
  unint64_t result = qword_77E18;
  if (!qword_77E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E18);
  }
  return result;
}

unint64_t sub_52374()
{
  unint64_t result = qword_77E20;
  if (!qword_77E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E20);
  }
  return result;
}

unint64_t sub_523CC()
{
  unint64_t result = qword_77E28;
  if (!qword_77E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E28);
  }
  return result;
}

unint64_t sub_52424()
{
  unint64_t result = qword_77E30;
  if (!qword_77E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E30);
  }
  return result;
}

unint64_t sub_5247C()
{
  unint64_t result = qword_77E38;
  if (!qword_77E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E38);
  }
  return result;
}

unint64_t sub_524D4()
{
  unint64_t result = qword_77E40;
  if (!qword_77E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E40);
  }
  return result;
}

unint64_t sub_5252C()
{
  unint64_t result = qword_77E48;
  if (!qword_77E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_77E48);
  }
  return result;
}

uint64_t sub_52588@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v28 = a3;
  uint64_t v29 = a1;
  uint64_t v3 = sub_6D90(&qword_768E8);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v27 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_60870();
  uint64_t v25 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v6);
  unint64_t v24 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_61630();
  uint64_t v8 = *(void *)(v35 - 8);
  uint64_t v10 = __chkstk_darwin(v35, v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v24 - v14;
  sub_61670();
  swift_allocObject();
  sub_61660();
  sub_61640();
  swift_release();
  sub_61650();
  swift_release();
  sub_61620();
  swift_allocObject();
  sub_61660();
  sub_61640();
  swift_release();
  sub_61650();
  swift_release();
  sub_61620();
  sub_616A0();
  sub_6EA4(v34, v34[3]);
  uint64_t v16 = v31;
  sub_61690();
  if (v16)
  {
    uint64_t v17 = *(void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v18 = v12;
    uint64_t v19 = v35;
    v17(v18, v35);
    v17(v15, v19);
  }
  else
  {
    sub_6EA4(v33, v33[3]);
    swift_bridgeObjectRetain();
    sub_616B0();
    sub_6EA4(v32, v32[3]);
    sub_61680();
    sub_60850();
    sub_63E8((uint64_t)v32);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v27, 1, 1, v26);
    sub_60A50();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v21 = v12;
    uint64_t v22 = v35;
    v20(v21, v35);
    v20(v15, v22);
    sub_63E8((uint64_t)v33);
  }
  return sub_63E8((uint64_t)v34);
}

ValueMetadata *type metadata accessor for SNLGTemplatingSectionGenerator()
{
  return &type metadata for SNLGTemplatingSectionGenerator;
}

void sub_52974()
{
  qword_7AA00 = 0x54746E6572727543;
  *(void *)algn_7AA08 = 0xEB000000006B7361;
}

uint64_t sub_529A0()
{
  sub_6D90(&qword_77260);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_613B0();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_52A3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_615A0();
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2, v3);
  uint64_t v34 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v33 - v7;
  uint64_t v9 = sub_60BF0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_60D10();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + 176) = 2;
  sub_60C80();
  char v19 = sub_54E9C((uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  char v20 = 4;
  uint64_t result = 0;
  switch(v19)
  {
    case 1:
      char v20 = 1;
      goto LABEL_13;
    case 2:
      goto LABEL_13;
    case 3:
      return result;
    default:
      (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, enum case for UniversalActionFeatureFlags.cancelDefaultBehavior(_:), v9);
      char v22 = sub_60BE0();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      if ((v22 & 1) == 0) {
        return 0;
      }
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_616D0();
      sub_6D40(v23, (uint64_t)qword_7A9C8);
      swift_retain_n();
      unint64_t v24 = sub_616C0();
      os_log_type_t v25 = sub_61960();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 134217984;
        v33[1] = v26 + 4;
        sub_6D90(&qword_77260);
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v36 = v1;
        swift_retain();
        sub_613B0();
        swift_release();
        swift_release();
        swift_release();
        sub_61580();
        swift_release();
        uint64_t v27 = sub_61590();
        uint64_t v28 = v35;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v2);
        swift_release();
        uint64_t v37 = v27;
        sub_619C0();
        swift_release();
        _os_log_impl(&dword_0, v24, v25, "UniversalAction currentRequest.positionInSession: %ld", v26, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
        uint64_t v28 = v35;
      }
      sub_6D90(&qword_77260);
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v36 = v1;
      swift_retain();
      sub_613B0();
      swift_release();
      swift_release();
      swift_release();
      sub_61580();
      swift_release();
      uint64_t v29 = v34;
      (*(void (**)(char *, void, uint64_t))(v28 + 104))(v34, enum case for RequestPositionInSession.first(_:), v2);
      sub_54E50(&qword_77F88, 255, (void (*)(uint64_t))&type metadata accessor for RequestPositionInSession);
      sub_61840();
      sub_61840();
      uint64_t v31 = v36;
      uint64_t v30 = v37;
      uint64_t v32 = *(void (**)(char *, uint64_t))(v28 + 8);
      v32(v29, v2);
      v32(v8, v2);
      if (v30 == v31) {
        char v20 = 0;
      }
      else {
        char v20 = 3;
      }
LABEL_13:
      *(unsigned char *)(v1 + 176) = v20;
      return 1;
  }
}

uint64_t sub_52FF8(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_53018, 0, 0);
}

uint64_t sub_53018()
{
  uint64_t v1 = v0[3];
  int v2 = *(unsigned __int8 *)(v1 + 176);
  if (v2 == 2)
  {
    if (qword_75DE8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_616D0();
    sub_6D40(v11, (uint64_t)qword_7A9C8);
    uint64_t v12 = sub_616C0();
    os_log_type_t v13 = sub_61970();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      swift_slowDealloc();
    }

    sub_608F0();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  else
  {
    if (v2 == 3)
    {
      sub_6EA4((void *)(v1 + 136), *(void *)(v1 + 160));
      sub_606A0();
      if (qword_75E08 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      sub_60690();
      sub_60610();
      swift_release();
      sub_6D90((uint64_t *)&unk_76820);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_62660;
      *(void *)(v17 + 32) = [objc_allocWithZone((Class)SAUIClearScreen) init];
      sub_61880();
      v0[12] = v17;
      uint64_t v18 = (void *)swift_task_alloc();
      v0[13] = v18;
      *uint64_t v18 = v0;
      v18[1] = sub_53A14;
      uint64_t v8 = v0[2];
      unint64_t v19 = 0x80000000000652B0;
      uint64_t v9 = 0xD00000000000001CLL;
      uint64_t v20 = v17;
    }
    else
    {
      if (v2 == 4)
      {
        id v3 = [objc_allocWithZone((Class)SAUICloseAssistant) init];
        v0[5] = v3;
        sub_6D90((uint64_t *)&unk_76820);
        uint64_t v4 = swift_allocObject();
        *(_OWORD *)(v4 + 16) = xmmword_62660;
        *(void *)(v4 + 32) = v3;
        uint64_t v28 = v4;
        sub_61880();
        uint64_t v5 = v28;
        v0[6] = v28;
        id v6 = v3;
        uint64_t v7 = (void *)swift_task_alloc();
        v0[7] = v7;
        *uint64_t v7 = v0;
        v7[1] = sub_5360C;
        uint64_t v8 = v0[2];
        uint64_t v9 = 0xD00000000000001ELL;
        uint64_t v10 = "UniversalActionDialog#thankYou";
      }
      else
      {
        id v21 = [objc_allocWithZone((Class)SAUICloseAssistant) init];
        v0[4] = v21;
        if (v2)
        {
          sub_6D90((uint64_t *)&unk_76820);
          uint64_t v25 = swift_allocObject();
          *(_OWORD *)(v25 + 16) = xmmword_62660;
          *(void *)(v25 + 32) = v21;
          uint64_t v30 = v25;
          sub_61880();
          uint64_t v5 = v30;
          v0[8] = v30;
          id v26 = v21;
          uint64_t v27 = (void *)swift_task_alloc();
          v0[9] = v27;
          *uint64_t v27 = v0;
          v27[1] = sub_53784;
          uint64_t v8 = v0[2];
          uint64_t v9 = 0xD000000000000025;
          uint64_t v10 = "UniversalActionDialog#directDismissal";
        }
        else
        {
          sub_6EA4((void *)(v0[3] + 136), *(void *)(v0[3] + 160));
          sub_606A0();
          if (qword_75E08 != -1) {
            swift_once();
          }
          swift_bridgeObjectRetain();
          sub_60690();
          sub_60610();
          swift_release();
          sub_6D90((uint64_t *)&unk_76820);
          uint64_t v22 = swift_allocObject();
          *(_OWORD *)(v22 + 16) = xmmword_62660;
          *(void *)(v22 + 32) = v21;
          uint64_t v29 = v22;
          sub_61880();
          uint64_t v5 = v29;
          v0[10] = v29;
          id v23 = v21;
          unint64_t v24 = (void *)swift_task_alloc();
          v0[11] = v24;
          *unint64_t v24 = v0;
          v24[1] = sub_538FC;
          uint64_t v8 = v0[2];
          uint64_t v9 = 0xD00000000000001DLL;
          uint64_t v10 = "UniversalActionDialog#dismiss";
        }
      }
      unint64_t v19 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      uint64_t v20 = v5;
    }
    return sub_53B24(v8, v9, v19, v20);
  }
}

uint64_t sub_5360C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_53724, 0, 0);
}

uint64_t sub_53724()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_53784()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_5389C, 0, 0);
}

uint64_t sub_5389C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_538FC()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_54E98, 0, 0);
}

uint64_t sub_53A14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_53B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[41] = a4;
  v5[42] = v4;
  v5[39] = a2;
  v5[40] = a3;
  v5[38] = a1;
  sub_6D90((uint64_t *)&unk_76560);
  v5[43] = swift_task_alloc();
  uint64_t v6 = sub_60DC0();
  v5[44] = v6;
  v5[45] = *(void *)(v6 - 8);
  v5[46] = swift_task_alloc();
  uint64_t v7 = sub_60B00();
  v5[47] = v7;
  v5[48] = *(void *)(v7 - 8);
  v5[49] = swift_task_alloc();
  uint64_t v8 = sub_60A40();
  v5[50] = v8;
  v5[51] = *(void *)(v8 - 8);
  v5[52] = swift_task_alloc();
  return _swift_task_switch(sub_53CD4, 0, 0);
}

uint64_t sub_53CD4()
{
  sub_6EA4((void *)(v0[42] + 96), *(void *)(v0[42] + 120));
  unint64_t v1 = sub_3C570((uint64_t)_swiftEmptyArrayStorage);
  v0[53] = v1;
  sub_6D90((uint64_t *)&unk_767F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_625B0;
  strcpy((char *)(inited + 32), "responseMode");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0xE000000000000000;
  unint64_t v3 = sub_3C438(inited);
  v0[54] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[55] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_53E08;
  uint64_t v6 = v0[39];
  uint64_t v5 = v0[40];
  return sub_38544(v6, v5, v1, v3);
}

uint64_t sub_53E08(uint64_t a1)
{
  *(void *)(*(void *)v2 + 448) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_errorRelease();
    unint64_t v3 = sub_54370;
  }
  else
  {
    unint64_t v3 = sub_53F68;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_53F68()
{
  uint64_t v1 = *(void **)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v13 = *(void *)(v0 + 376);
  uint64_t v17 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v15 = *(void **)(v0 + 336);
  uint64_t v16 = *(void *)(v0 + 352);
  uint64_t v14 = *(void *)(v0 + 368);
  swift_bridgeObjectRetain();
  id v5 = [v1 speak];
  sub_61870();

  id v6 = [v1 print];
  sub_61870();

  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v13);
  sub_609F0();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 176), *(void *)(v0 + 200));
  sub_606D0();
  uint64_t v7 = sub_60940();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  sub_60880();
  sub_6EE8(v0 + 96, (uint64_t *)&unk_78310);
  sub_6EE8(v4, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 136);
  sub_63E8(v0 + 176);
  uint64_t v8 = v15[10];
  uint64_t v9 = v15[11];
  sub_6EA4(v15 + 7, v8);
  *(void *)(v0 + 240) = v16;
  *(void *)(v0 + 248) = &protocol witness table for AceOutput;
  uint64_t v10 = sub_838C((uint64_t *)(v0 + 216));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 16))(v10, v14, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_54254;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 216, v8, v9);
}

uint64_t sub_54254()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_54678;
  }
  else
  {
    sub_63E8(v2 + 216);
    uint64_t v3 = sub_5458C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_54370()
{
  uint64_t v11 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[40];
  if (v4)
  {
    uint64_t v6 = v0[39];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[35] = sub_316A4(v6, v5, &v10);
    sub_619C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v2, v3, "Couldn't create a dialog for %s.", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_608F0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_5458C()
{
  uint64_t v1 = (void *)v0[56];
  uint64_t v3 = v0[51];
  uint64_t v2 = v0[52];
  uint64_t v4 = v0[50];
  uint64_t v6 = v0[45];
  uint64_t v5 = v0[46];
  uint64_t v7 = v0[44];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_54678()
{
  uint64_t v17 = v0;
  sub_63E8((uint64_t)(v0 + 27));
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_61CE0();
    v0[37] = sub_316A4(v5, v6, &v16);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error publishing output %s.", v4, 0xCu);
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
  uint64_t v7 = (void *)v0[56];
  uint64_t v9 = v0[51];
  uint64_t v8 = v0[52];
  uint64_t v10 = v0[50];
  uint64_t v12 = v0[45];
  uint64_t v11 = v0[46];
  uint64_t v13 = v0[44];
  sub_608F0();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_54924()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);
  sub_63E8(v0 + 136);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UniversalActionTaskInterruptionFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for UniversalActionTaskInterruptionFlow.Action(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC)
  {
    unsigned int v2 = a2 + 4;
    if (a2 + 4 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 4;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x54A50);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 2;
  if (v8 <= 2) {
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UniversalActionTaskInterruptionFlow.Action(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 4;
  if (a3 + 4 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFC) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v7 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x54B38);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_54B60(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_54B7C(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for UniversalActionTaskInterruptionFlow.Action()
{
  return &type metadata for UniversalActionTaskInterruptionFlow.Action;
}

uint64_t sub_54BA4()
{
  return sub_52A3C() & 1;
}

uint64_t sub_54BCC()
{
  return sub_60550();
}

uint64_t sub_54C28(uint64_t a1)
{
  uint64_t v4 = *v1;
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  uint64_t v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_6C0C;
  return _swift_task_switch(sub_53018, 0, 0);
}

uint64_t sub_54CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for UniversalActionTaskInterruptionFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_54D10(uint64_t a1, uint64_t a2)
{
  return sub_54E50(&qword_77250, a2, (void (*)(uint64_t))type metadata accessor for UniversalActionTaskInterruptionFlow);
}

uint64_t sub_54D58(uint64_t a1, uint64_t a2)
{
  return sub_54E50(&qword_77F80, a2, (void (*)(uint64_t))type metadata accessor for UniversalActionTaskInterruptionFlow);
}

uint64_t sub_54DA0@<X0>(void *a1@<X8>)
{
  sub_6D90(&qword_77260);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_613B0();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_54E50(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_54E9C(uint64_t a1)
{
  uint64_t v2 = sub_60D10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = sub_60CC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  if (v7)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  else
  {
    char v9 = sub_60CA0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    if (v9)
    {
      return 0;
    }
    else if (sub_60D00())
    {
      return 1;
    }
    else if (sub_60CB0())
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
}

void *sub_54FF0(uint64_t a1)
{
  uint64_t v2 = sub_61720();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  unsigned int v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    id v23 = _swiftEmptyArrayStorage;
    sub_3CE98(0, v7, 0);
    unsigned int v8 = v23;
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v9 = v3 + 16;
    uint64_t v10 = v11;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v19 = *(void *)(v9 + 56);
    do
    {
      v10(v6, v12, v2);
      id v23 = v8;
      unint64_t v14 = v8[2];
      unint64_t v13 = v8[3];
      if (v14 >= v13 >> 1) {
        sub_3CE98(v13 > 1, v14 + 1, 1);
      }
      uint64_t v21 = v2;
      uint64_t v22 = &protocol witness table for ActionCandidate;
      uint64_t v15 = sub_838C((uint64_t *)&v20);
      v10((char *)v15, (uint64_t)v6, v2);
      uint64_t v16 = v23;
      v23[2] = v14 + 1;
      sub_6D78(&v20, (uint64_t)&v16[5 * v14 + 4]);
      (*(void (**)(char *, uint64_t))(v9 - 8))(v6, v2);
      unsigned int v8 = v23;
      v12 += v19;
      --v7;
    }
    while (v7);
  }
  return v8;
}

void *sub_551C0(uint64_t a1, void *a2, char *a3)
{
  uint64_t v50 = a3;
  __n128 v51 = a2;
  uint64_t v3 = sub_602F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  uint64_t v49 = v4;
  __chkstk_darwin(v3, v5);
  int64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v8 = (void *)sub_61780();
  uint64_t v9 = *(v8 - 1);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6D90(&qword_78038);
  uint64_t v13 = sub_61720();
  uint64_t v14 = *(void *)(*(void *)(v13 - 8) + 72);
  unint64_t v15 = (*(unsigned __int8 *)(*(void *)(v13 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_62540;
  uint64_t v17 = v16 + v15;
  sub_48578(v17);
  uint64_t v18 = v17 + v14;
  uint64_t v19 = v12;
  sub_48578(v18);
  sub_54FF0(v16);
  swift_bridgeObjectRelease();
  sub_61770();
  uint64_t v20 = v53;
  uint64_t v21 = sub_61750();
  if (!v20)
  {
    if (v22)
    {
      uint64_t v53 = v21;
      uint64_t v23 = sub_61760();
      __n128 v51 = v8;
      if (v24)
      {
        v47[1] = v23;
        _OWORD v47[2] = v24;
        v52[3] = v13;
        v52[4] = (uint64_t)&protocol witness table for ActionCandidate;
        uint64_t v32 = sub_838C(v52);
        sub_48578((uint64_t)v32);
        uint64_t v33 = sub_61740();
        char v35 = v34;
        sub_63E8((uint64_t)v52);
        if ((v35 & 1) == 0)
        {
          id v36 = [objc_allocWithZone((Class)sub_615B0()) init];
          uint64_t v37 = v33;
          sub_602E0();
          sub_602D0();
          uint64_t v50 = v12;
          (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v48);
          NSString v38 = sub_617E0();
          uint64_t v19 = v50;
          swift_bridgeObjectRelease();
          [v36 setIdentifier:v38];

          unsigned int v8 = v36;
          NSString v39 = sub_617E0();
          [v8 _setLaunchId:v39];

          NSString v40 = sub_617E0();
          swift_bridgeObjectRelease();
          [v8 setCandidateBundles:v40];

          NSString v41 = sub_617E0();
          swift_bridgeObjectRelease();
          [v8 setCandidateActions:v41];

          v52[0] = v37;
          sub_61C90();
          NSString v42 = sub_617E0();
          swift_bridgeObjectRelease();
          [v8 setSelectedCandidateIndex:v42];

          uint64_t v28 = v51;
          goto LABEL_11;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_75DE8 != -1) {
          swift_once();
        }
        uint64_t v45 = sub_616D0();
        sub_6D40(v45, (uint64_t)qword_7A9C8);
        id v26 = sub_616C0();
        os_log_type_t v27 = sub_61960();
        BOOL v46 = os_log_type_enabled(v26, v27);
        uint64_t v28 = v51;
        if (!v46)
        {
LABEL_10:

          unsigned int v8 = 0;
LABEL_11:
          (*(void (**)(char *, void *))(v9 + 8))(v19, v28);
          return v8;
        }
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        uint64_t v30 = "[DisambiguateActionsIntent] Could not serialise selected index.";
      }
      else
      {
        swift_bridgeObjectRelease();
        if (qword_75DE8 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_616D0();
        sub_6D40(v43, (uint64_t)qword_7A9C8);
        id v26 = sub_616C0();
        os_log_type_t v27 = sub_61960();
        BOOL v44 = os_log_type_enabled(v26, v27);
        uint64_t v28 = v51;
        if (!v44) {
          goto LABEL_10;
        }
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        uint64_t v30 = "[DisambiguateActionsIntent] Could not serialise action representations.";
      }
    }
    else
    {
      if (qword_75DE8 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_616D0();
      sub_6D40(v25, (uint64_t)qword_7A9C8);
      id v26 = sub_616C0();
      os_log_type_t v27 = sub_61960();
      uint64_t v28 = v8;
      if (!os_log_type_enabled(v26, v27)) {
        goto LABEL_10;
      }
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      uint64_t v30 = "[DisambiguateActionsIntent] Could not serialise action bundles.";
    }
    _os_log_impl(&dword_0, v26, v27, v30, v29, 2u);
    swift_slowDealloc();
    goto LABEL_10;
  }
  (*(void (**)(char *, void *))(v9 + 8))(v12, v8);
  return v8;
}

uint64_t sub_55828(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_6D90((uint64_t *)&unk_76890);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t type metadata accessor for UserHistoryHelper()
{
  return self;
}

uint64_t sub_558E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  return _swift_task_switch(sub_55908, 0, 0);
}

uint64_t sub_55908()
{
  unsigned int v1 = sub_551C0(*(void *)(v0 + 120), *(void **)(v0 + 128), *(char **)(v0 + 136));
  *(void *)(v0 + 144) = v1;
  if (v1)
  {
    id v3 = [objc_allocWithZone((Class)INInteraction) initWithIntent:v1 response:0];
    *(void *)(v0 + 152) = v3;
    [v3 _setDonatedBySiri:1];
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_55AA4;
    uint64_t v4 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_55828;
    *(void *)(v0 + 104) = &unk_727B8;
    *(void *)(v0 + 112) = v4;
    [v3 donateInteractionWithCompletion:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_55AA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_55CE0;
  }
  else {
    uint64_t v2 = sub_55BB4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_55BB4()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = (void *)v0[18];
  uint64_t v6 = (void *)v0[19];
  if (v4)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v2, v3, "[DisambiguateActionsIntent] Donation success.", v7, 2u);
    swift_slowDealloc();
  }

  unsigned int v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_55CE0()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_willThrow();

  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_616D0();
  sub_6D40(v2, (uint64_t)qword_7A9C8);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v3 = sub_616C0();
  os_log_type_t v4 = sub_61970();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v10 = *(NSObject **)(v0 + 144);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v7;
    sub_619C0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "[DisambiguateActionsIntent] Donation failed: %@", v5, 0xCu);
    sub_6D90(&qword_76910);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_type_t v3 = v10;
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();

  unsigned int v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

unint64_t sub_55EFC()
{
  uint64_t v0 = sub_6D90(&qword_76CF0);
  __chkstk_darwin(v0 - 8, v1);
  os_log_type_t v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_60E10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unsigned int v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_60EC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_60D90();
  uint64_t v14 = sub_60E00();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  if (*(void *)(v14 + 16))
  {
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(v10 + 16))(v3, v14 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v3, v15, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9) == 1)
  {
    sub_56238((uint64_t)v3);
    return 0;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v13, v3, v9);
  unint64_t result = sub_61000();
  unint64_t v18 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_61B60();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v16) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (!v16)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, v9);
      return v16;
    }
  }
  if ((v18 & 0xC000000000000001) != 0)
  {
    uint64_t v16 = sub_61A90();
    goto LABEL_11;
  }
  if (*(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8)))
  {
    uint64_t v16 = *(void *)(v18 + 32);
    swift_retain();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_56238(uint64_t a1)
{
  uint64_t v2 = sub_6D90(&qword_76CF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_56298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_562BC, 0, 0);
}

uint64_t sub_562BC()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_retain();
  uint64_t v4 = sub_5EE14(v1, v3, v2);
  v0[9] = v4;
  swift_release();
  uint64_t v5 = v4[2];
  v0[10] = v5;
  if (v5)
  {
    v0[11] = 0;
    v0[12] = _swiftEmptyArrayStorage;
    uint64_t v6 = *(void *)(v0[9] + 32);
    v0[13] = v6;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[14] = v7;
    uint64_t v8 = sub_6D90((uint64_t *)&unk_76890);
    *uint64_t v7 = v0;
    v7[1] = sub_5644C;
    return Task.value.getter(v0 + 2, v6, &type metadata for AppNameDisambiguationFlow.Card, v8, &protocol self-conformance witness table for Error);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = (uint64_t (*)(void *))v0[1];
    return v9(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_5644C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_56754;
  }
  else
  {
    *(_OWORD *)(v2 + 128) = *(_OWORD *)(v2 + 16);
    *(void *)(v2 + 144) = *(void *)(v2 + 32);
    uint64_t v3 = sub_56578;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_56578()
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = *(void **)(v0 + 96);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v2 = sub_5DC34(0, v2[2] + 1, 1, *(void **)(v0 + 96));
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5DC34((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  uint64_t v5 = *(void *)(v0 + 144);
  long long v6 = *(_OWORD *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88) + 1;
  v2[2] = v4 + 1;
  uint64_t v9 = &v2[3 * v4];
  *((_OWORD *)v9 + 2) = v6;
  v9[6] = v5;
  swift_release();
  if (v8 == v7)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(uint64_t (**)(void *))(v0 + 8);
    return v10(v2);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 88) + 1;
    *(void *)(v0 + 88) = v12;
    *(void *)(v0 + 96) = v2;
    uint64_t v13 = *(void *)(*(void *)(v0 + 72) + 8 * v12 + 32);
    *(void *)(v0 + 104) = v13;
    swift_retain();
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = sub_6D90((uint64_t *)&unk_76890);
    *uint64_t v14 = v0;
    v14[1] = sub_5644C;
    return Task.value.getter(v0 + 16, v13, &type metadata for AppNameDisambiguationFlow.Card, v15, &protocol self-conformance witness table for Error);
  }
}

uint64_t sub_56754()
{
  swift_release();
  swift_bridgeObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_567C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  return _swift_task_switch(sub_567EC, 0, 0);
}

uint64_t sub_567EC()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  swift_retain();
  unint64_t v4 = sub_5E930(v1, v3, v2);
  v0[10] = v4;
  swift_release();
  uint64_t v5 = v4[2];
  v0[11] = v5;
  if (v5)
  {
    v0[12] = 0;
    v0[13] = _swiftEmptyArrayStorage;
    uint64_t v6 = *(void *)(v0[10] + 32);
    v0[14] = v6;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[15] = v7;
    uint64_t v8 = sub_6D90((uint64_t *)&unk_76890);
    *uint64_t v7 = v0;
    v7[1] = sub_5697C;
    return Task.value.getter(v0 + 2, v6, &type metadata for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo, v8, &protocol self-conformance witness table for Error);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = (uint64_t (*)(void *))v0[1];
    return v9(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_5697C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_56C88;
  }
  else
  {
    *(void *)(v2 + 136) = *(void *)(v2 + 16);
    *(_OWORD *)(v2 + 144) = *(_OWORD *)(v2 + 24);
    *(void *)(v2 + 160) = *(void *)(v2 + 40);
    uint64_t v3 = sub_56AB0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_56AB0()
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = *(void **)(v0 + 104);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v2 = sub_5DD5C(0, v2[2] + 1, 1, *(void **)(v0 + 104));
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5DD5C((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 160);
  long long v7 = *(_OWORD *)(v0 + 136);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 96) + 1;
  v2[2] = v4 + 1;
  uint64_t v10 = &v2[4 * v4];
  *((_OWORD *)v10 + 2) = v7;
  v10[6] = v6;
  v10[7] = v5;
  swift_release();
  if (v9 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(uint64_t (**)(void *))(v0 + 8);
    return v11(v2);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 96) + 1;
    *(void *)(v0 + 96) = v13;
    *(void *)(v0 + 104) = v2;
    uint64_t v14 = *(void *)(*(void *)(v0 + 80) + 8 * v13 + 32);
    *(void *)(v0 + 112) = v14;
    swift_retain();
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v15;
    uint64_t v16 = sub_6D90((uint64_t *)&unk_76890);
    *uint64_t v15 = v0;
    v15[1] = sub_5697C;
    return Task.value.getter(v0 + 16, v14, &type metadata for AppNameDisambiguationFlow.AppDisambiguationDisplayInfo, v16, &protocol self-conformance witness table for Error);
  }
}

uint64_t sub_56C88()
{
  swift_release();
  swift_bridgeObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_56CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  return _swift_task_switch(sub_56D20, 0, 0);
}

uint64_t sub_56D20()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  swift_retain();
  unint64_t v4 = sub_5F228(v1, v3, v2);
  v0[8] = v4;
  swift_release();
  v0[3] = _swiftEmptyArrayStorage;
  uint64_t v5 = v4[2];
  v0[9] = v5;
  if (v5)
  {
    v0[10] = 0;
    uint64_t v6 = *(void *)(v0[8] + 32);
    v0[11] = v6;
    swift_bridgeObjectRetain();
    swift_retain();
    long long v7 = (void *)swift_task_alloc();
    v0[12] = v7;
    uint64_t v8 = sub_1D8A4(0, &qword_76838);
    uint64_t v9 = sub_6D90((uint64_t *)&unk_76890);
    *long long v7 = v0;
    v7[1] = sub_56ED0;
    return Task.value.getter(v0 + 4, v6, v8, v9, &protocol self-conformance witness table for Error);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t (*)(void *))v0[1];
    return v10(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_56ED0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_571B8;
  }
  else
  {
    *(void *)(v2 + 112) = *(void *)(v2 + 32);
    uint64_t v3 = sub_56FF4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_56FF4()
{
  sub_61850();
  if (*(void *)((char *)&dword_10 + (v0[3] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v0[3] & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_61890();
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10] + 1;
  sub_618B0();
  sub_61880();
  swift_release();
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[3];
    swift_bridgeObjectRelease();
    unint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
    return v4(v3);
  }
  else
  {
    uint64_t v6 = v0[10] + 1;
    v0[10] = v6;
    uint64_t v7 = *(void *)(v0[8] + 8 * v6 + 32);
    v0[11] = v7;
    swift_retain();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[12] = v8;
    uint64_t v9 = sub_1D8A4(0, &qword_76838);
    uint64_t v10 = sub_6D90((uint64_t *)&unk_76890);
    *uint64_t v8 = v0;
    v8[1] = sub_56ED0;
    return Task.value.getter(v0 + 4, v7, v9, v10, &protocol self-conformance witness table for Error);
  }
}

uint64_t sub_571B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_57230()
{
  qword_7AA10 = 0x54746E6572727543;
  *(void *)algn_7AA18 = 0xEB000000006B7361;
}

BOOL sub_5725C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  uint64_t v158 = (uint64_t)&v138 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  v157 = (char *)&v138 - v7;
  uint64_t v8 = sub_6D90((uint64_t *)&unk_78360);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v154 = (char *)&v138 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_602F0();
  uint64_t v155 = *(void *)(v156 - 8);
  __chkstk_darwin(v156, v11);
  uint64_t v13 = (char *)&v138 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_607D0();
  uint64_t v14 = *(void *)(v171 - 8);
  uint64_t v16 = __chkstk_darwin(v171, v15);
  uint64_t v153 = (char *)&v138 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v166 = (char *)&v138 - v20;
  uint64_t v22 = __chkstk_darwin(v19, v21);
  uint64_t v139 = (char *)&v138 - v23;
  __chkstk_darwin(v22, v24);
  unint64_t v140 = (char *)&v138 - v25;
  uint64_t v151 = sub_60DA0();
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151, v26);
  uint64_t v149 = (uint64_t)&v138 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_60CF0();
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148, v28);
  uint64_t v146 = (char *)&v138 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_60D10();
  uint64_t v162 = *(void *)(v164 - 8);
  __chkstk_darwin(v164, v30);
  uint64_t v163 = (char *)&v138 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_6D90((uint64_t *)&unk_76940);
  uint64_t v34 = __chkstk_darwin(v32 - 8, v33);
  id v36 = (char *)&v138 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __chkstk_darwin(v34, v37);
  uint64_t v141 = (uint64_t)&v138 - v39;
  uint64_t v41 = __chkstk_darwin(v38, v40);
  uint64_t v142 = (char *)&v138 - v42;
  __chkstk_darwin(v41, v43);
  uint64_t v45 = (char *)&v138 - v44;
  uint64_t v46 = sub_60C90();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v49 = __chkstk_darwin(v46, v48);
  uint64_t v152 = (char *)&v138 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __chkstk_darwin(v49, v51);
  uint64_t v143 = (char *)&v138 - v53;
  __chkstk_darwin(v52, v54);
  long long v56 = (char *)&v138 - v55;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  char v144 = v13;
  uint64_t v57 = sub_616D0();
  uint64_t v58 = sub_6D40(v57, (uint64_t)qword_7A9C8);
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
  uint64_t v167 = a1;
  uint64_t v159 = v59;
  uint64_t v160 = v47 + 16;
  v59(v56, a1, v46);
  uint64_t v170 = v58;
  uint64_t v60 = sub_616C0();
  os_log_type_t v61 = sub_61960();
  BOOL v62 = os_log_type_enabled(v60, v61);
  uint64_t v168 = v14;
  uint64_t v169 = v45;
  uint64_t v161 = v47;
  if (v62)
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v173 = swift_slowAlloc();
    *(_DWORD *)uint64_t v63 = 136315138;
    uint64_t v145 = v36;
    sub_5FCA0((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v64 = sub_61C90();
    uint64_t v174 = sub_316A4(v64, v65, &v173);
    id v36 = v145;
    sub_619C0();
    swift_bridgeObjectRelease();
    uint64_t v66 = *(void (**)(char *, uint64_t))(v47 + 8);
    v66(v56, v46);
    _os_log_impl(&dword_0, v60, v61, "VerbEntityDisambiguationFlow: on called with input %s", v63, 0xCu);
    swift_arrayDestroy();
    uint64_t v45 = v169;
    swift_slowDealloc();
    uint64_t v14 = v168;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v66 = *(void (**)(char *, uint64_t))(v47 + 8);
    v66(v56, v46);
  }

  uint64_t v67 = v46;
  __n128 v68 = v163;
  uint64_t v69 = v167;
  sub_60C80();
  uint64_t v70 = v162;
  uint64_t v71 = v164;
  int v72 = (*(uint64_t (**)(char *, uint64_t))(v162 + 88))(v68, v164);
  uint64_t v165 = v66;
  if (v72 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v70 + 96))(v68, v71);
    uint64_t v73 = v147;
    uint64_t v74 = v146;
    uint64_t v75 = v68;
    uint64_t v76 = v148;
    (*(void (**)(char *, char *, uint64_t))(v147 + 32))(v146, v75, v148);
    sub_3E334(v172 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_firstAction, v172 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_secondAction, (uint64_t)v45);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v76);
    uint64_t v77 = v171;
    goto LABEL_21;
  }
  if (v72 != enum case for Parse.uso(_:))
  {
    uint64_t v89 = v67;
    uint64_t v90 = v68;
    uint64_t v91 = v171;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v45, 1, 1, v171);
    uint64_t v92 = v90;
    uint64_t v67 = v89;
    (*(void (**)(char *, uint64_t))(v70 + 8))(v92, v71);
    uint64_t v77 = v91;
    goto LABEL_21;
  }
  uint64_t v148 = v67;
  (*(void (**)(char *, uint64_t))(v70 + 96))(v68, v71);
  (*(void (**)(uint64_t, char *, uint64_t))(v150 + 32))(v149, v68, v151);
  uint64_t v78 = v172 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_firstAction;
  unint64_t v79 = v172 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_secondAction;
  uint64_t v80 = sub_457B0();
  uint64_t v77 = v171;
  uint64_t v145 = v36;
  if (v81) {
    goto LABEL_13;
  }
  if (v80 != 1)
  {
    if (v80)
    {
      if (v80 != -1)
      {
LABEL_13:
        long long v82 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
        uint64_t v83 = (uint64_t)v142;
        v82(v142, 1, 1, v171);
        sub_6EE8(v83, (uint64_t *)&unk_76940);
        uint64_t v84 = v149;
        unint64_t v85 = v79;
        uint64_t v86 = v141;
        sub_59CE4(v149, v78, v85, v141);
        (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v84, v151);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v86, 1, v77) == 1)
        {
          sub_6EE8(v86, (uint64_t *)&unk_76940);
          uint64_t v87 = v45;
          uint64_t v88 = 1;
        }
        else
        {
          uint64_t v93 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 32);
          uint64_t v94 = v139;
          v93(v139, v86, v77);
          v93(v45, (uint64_t)v94, v77);
          uint64_t v87 = v45;
          uint64_t v88 = 0;
        }
        v82(v87, v88, 1, v77);
        uint64_t v69 = v167;
        uint64_t v67 = v148;
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v79 = v78;
    }
  }
  uint64_t v67 = v148;
  int v95 = v142;
  (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v142, v79, v171);
  uint64_t v96 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  v96(v95, 0, 1, v77);
  (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v149, v151);
  uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v168 + 32);
  uint64_t v98 = v140;
  v97(v140, v95, v77);
  v97(v45, v98, v77);
  uint64_t v14 = v168;
  v96(v45, 0, 1, v77);
LABEL_20:
  id v36 = v145;
LABEL_21:
  sub_1DB7C((uint64_t)v45, (uint64_t)v36, (uint64_t *)&unk_76940);
  int v99 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v36, 1, v77);
  int v100 = v99;
  if (v99 == 1)
  {
    sub_6EE8((uint64_t)v36, (uint64_t *)&unk_76940);
    uint64_t v110 = v67;
    unint64_t v111 = v152;
    v159(v152, v69, v110);
    uint64_t v112 = sub_616C0();
    os_log_type_t v113 = sub_61970();
    if (os_log_type_enabled(v112, v113))
    {
      uint64_t v114 = (uint8_t *)swift_slowAlloc();
      uint64_t v173 = swift_slowAlloc();
      *(_DWORD *)uint64_t v114 = 136315138;
      sub_5FCA0((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v115 = sub_61C90();
      uint64_t v174 = sub_316A4(v115, v116, &v173);
      sub_619C0();
      swift_bridgeObjectRelease();
      v165(v111, v110);
      _os_log_impl(&dword_0, v112, v113, "VerbEntityDisambiguationFlow: could not resolve action from %s", v114, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v165(v111, v110);
    }

    sub_60B70();
    sub_60B60();
    sub_60B30();
    swift_release();
    sub_6EA4((void *)(v172 + 56), *(void *)(v172 + 80));
    sub_606A0();
    if (qword_75E10 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    LOBYTE(v173) = 0;
    sub_60690();
    sub_60610();
    swift_release();
    uint64_t v128 = (uint64_t)v169;
  }
  else
  {
    LODWORD(v164) = v99;
    uint64_t v101 = v166;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v166, v36, v77);
    uint64_t v102 = *(char **)(v14 + 16);
    uint64_t v103 = v153;
    uint64_t v162 = v14 + 16;
    uint64_t v152 = v102;
    ((void (*)(char *, char *, uint64_t))v102)(v153, v101, v77);
    os_log_type_t v104 = sub_616C0();
    os_log_type_t v105 = sub_61970();
    if (os_log_type_enabled(v104, v105))
    {
      uint64_t v106 = v14;
      unint64_t v107 = (uint8_t *)swift_slowAlloc();
      uint64_t v173 = swift_slowAlloc();
      *(_DWORD *)unint64_t v107 = 136315138;
      sub_5FCA0((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      uint64_t v108 = sub_61C90();
      uint64_t v174 = sub_316A4(v108, v109, &v173);
      uint64_t v77 = v171;
      sub_619C0();
      swift_bridgeObjectRelease();
      uint64_t v163 = *(char **)(v106 + 8);
      ((void (*)(char *, uint64_t))v163)(v103, v77);
      _os_log_impl(&dword_0, v104, v105, "VerbEntityDisambiguationFlow: resolved action to %s", v107, 0xCu);
      swift_arrayDestroy();
      uint64_t v101 = v166;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v163 = *(char **)(v14 + 8);
      ((void (*)(char *, uint64_t))v163)(v103, v77);
    }

    uint64_t v117 = v156;
    uint64_t v118 = (uint64_t)v154;
    sub_607C0();
    uint64_t v119 = v155;
    int v120 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v155 + 48))(v118, 1, v117);
    unint64_t v121 = v165;
    if (v120 == 1)
    {
      sub_6EE8(v118, (uint64_t *)&unk_78360);
      os_log_type_t v122 = v143;
      v159(v143, v167, v67);
      os_log_type_t v123 = sub_616C0();
      os_log_type_t v124 = sub_61970();
      if (os_log_type_enabled(v123, v124))
      {
        unint64_t v125 = (uint8_t *)swift_slowAlloc();
        uint64_t v173 = swift_slowAlloc();
        *(_DWORD *)unint64_t v125 = 136315138;
        sub_5FCA0((unint64_t *)&qword_75FF8, (void (*)(uint64_t))&type metadata accessor for Input);
        uint64_t v126 = sub_61C90();
        uint64_t v174 = sub_316A4(v126, v127, &v173);
        uint64_t v77 = v171;
        sub_619C0();
        swift_bridgeObjectRelease();
        v121(v122, v67);
        _os_log_impl(&dword_0, v123, v124, "VerbEntityDisambiguationFlow: could not extract loggingId from %s", v125, 0xCu);
        swift_arrayDestroy();
        uint64_t v101 = v166;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v121(v122, v67);
      }

      uint64_t v128 = (uint64_t)v169;
    }
    else
    {
      uint64_t v129 = v144;
      (*(void (**)(char *, uint64_t, uint64_t))(v119 + 32))(v144, v118, v117);
      sub_60B70();
      sub_60B60();
      sub_60B50();
      swift_release();
      sub_6EA4((void *)(v172 + 56), *(void *)(v172 + 80));
      sub_606A0();
      if (qword_75E10 != -1) {
        swift_once();
      }
      swift_bridgeObjectRetain();
      LOBYTE(v173) = 0;
      sub_60690();
      sub_60610();
      swift_release();
      (*(void (**)(char *, uint64_t))(v119 + 8))(v129, v117);
      uint64_t v128 = (uint64_t)v169;
      uint64_t v77 = v171;
      uint64_t v101 = v166;
    }
    int v100 = v164;
    uint64_t v130 = (uint64_t)v157;
    ((void (*)(char *, char *, uint64_t))v152)(v157, v101, v77);
    uint64_t v131 = sub_6D90((uint64_t *)&unk_76030);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56))(v130, 0, 2, v131);
    uint64_t v132 = v158;
    sub_5FCE8(v130, v158);
    uint64_t v133 = v172 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_state;
    swift_beginAccess();
    sub_5FD4C(v132, v133);
    swift_endAccess();
    uint64_t v134 = sub_616C0();
    os_log_type_t v135 = sub_61960();
    if (os_log_type_enabled(v134, v135))
    {
      long long v136 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v136 = 0;
      _os_log_impl(&dword_0, v134, v135, "VerbEntityDisambiguationFlow: input accepted", v136, 2u);
      swift_slowDealloc();
    }

    ((void (*)(char *, uint64_t))v163)(v101, v77);
  }
  sub_6EE8(v128, (uint64_t *)&unk_76940);
  return v100 != 1;
}

uint64_t sub_58734(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_607D0();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_58830, 0, 0);
}

uint64_t sub_58830()
{
  uint64_t v38 = v0;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "VerbEntityDisambiguationFlow: execute called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[8];

  uint64_t v7 = v6 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_state;
  swift_beginAccess();
  sub_5FC3C(v7, v5);
  uint64_t v8 = sub_6D90((uint64_t *)&unk_76030);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 2, v8);
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v10 = sub_616C0();
      os_log_type_t v11 = sub_61960();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_0, v10, v11, "VerbEntityDisambiguationFlow: rendering disambiguation", v12, 2u);
        swift_slowDealloc();
      }

      uint64_t v13 = (void *)swift_task_alloc();
      v0[14] = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_58DF8;
      uint64_t v14 = v0[7];
      return sub_58F68(v14);
    }
    uint64_t v30 = sub_616C0();
    os_log_type_t v31 = sub_61970();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "Invalid respose", v32, 2u);
      swift_slowDealloc();
    }

    sub_60B80();
    sub_60600();
    type metadata accessor for CamErrorFlow();
    swift_allocObject();
    v0[5] = sub_352DC(0xD000000000000010, 0x80000000000643C0, (uint64_t)v36, (uint64_t)v37);
    sub_5FCA0((unint64_t *)&qword_78370, (void (*)(uint64_t))type metadata accessor for CamErrorFlow);
    sub_60540();
    swift_release();
    sub_608E0();
    swift_release();
  }
  else
  {
    uint64_t v16 = v0[12];
    uint64_t v18 = v0[10];
    uint64_t v17 = v0[11];
    uint64_t v19 = v0[9];
    (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v16, v0[13], v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v16, v19);
    uint64_t v20 = sub_616C0();
    os_log_type_t v21 = sub_61960();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v24 = v0[10];
    uint64_t v23 = v0[11];
    uint64_t v25 = v0[9];
    if (v22)
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      v37[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      sub_5FCA0((unint64_t *)&qword_75FD8, (void (*)(uint64_t))&type metadata accessor for PluginAction);
      uint64_t v27 = sub_61C90();
      v0[6] = sub_316A4(v27, v28, v37);
      sub_619C0();
      swift_bridgeObjectRelease();
      uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v29(v23, v25);
      _os_log_impl(&dword_0, v20, v21, "VerbEntityDisambiguationFlow: redirecting to %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v29(v0[11], v0[9]);
    }

    uint64_t v33 = v0[12];
    uint64_t v34 = v0[9];
    sub_60900();
    v29(v33, v34);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t sub_58DF8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_58EF4, 0, 0);
}

uint64_t sub_58EF4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_58F68(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  sub_6D90((uint64_t *)&unk_767E0);
  v2[19] = swift_task_alloc();
  uint64_t v3 = sub_60760();
  v2[20] = v3;
  v2[21] = *(void *)(v3 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v4 = sub_60BD0();
  v2[23] = v4;
  v2[24] = *(void *)(v4 - 8);
  v2[25] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_78360);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  uint64_t v5 = sub_602F0();
  v2[28] = v5;
  v2[29] = *(void *)(v5 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  return _swift_task_switch(sub_59160, 0, 0);
}

uint64_t sub_59160()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  *(void *)(v0 + 256) = sub_6D40(v1, (uint64_t)qword_7A9C8);
  uint64_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "VerbEntityDisambiguationFlow: executeRenderDisambiguation called", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v5;
  void *v5 = v0;
  v5[1] = sub_592BC;
  return sub_5BDA8(v0 + 56);
}

uint64_t sub_592BC()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_59AB0;
  }
  else {
    uint64_t v2 = sub_593D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_593D0()
{
  uint64_t v2 = (uint64_t *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = v0 + 16;
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 232);
  sub_6D78((long long *)(v0 + 56), v0 + 16);
  sub_607C0();
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v6(v1, 1, v4) != 1)
  {
    uint64_t v2 = (uint64_t *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 208);
    uint64_t v8 = *(void *)(v0 + 224);
    int v9 = *(void (**)(void))(*(void *)(v0 + 232) + 32);
    ((void (*)(void, void, uint64_t))v9)(*(void *)(v0 + 248), *(void *)(v0 + 216), v8);
    sub_607C0();
    if (v6(v7, 1, v8) != 1)
    {
      uint64_t v13 = *(void *)(v0 + 232);
      uint64_t v29 = *(void *)(v0 + 240);
      uint64_t v14 = *(void *)(v0 + 224);
      uint64_t v15 = *(void *)(v0 + 192);
      uint64_t v30 = *(void *)(v0 + 184);
      uint64_t v31 = *(void *)(v0 + 200);
      uint64_t v16 = *(void *)(v0 + 248);
      v9();
      sub_60B70();
      sub_60B60();
      sub_6D90(&qword_76918);
      uint64_t v17 = *(void *)(v13 + 72);
      unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_62540;
      unint64_t v20 = v19 + v18;
      os_log_type_t v21 = *(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 16);
      v21(v20, v16, v14);
      v21(v20 + v17, v29, v14);
      (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v31, enum case for CAMDisambiguationDialogType.verbEntity(_:), v30);
      sub_60B40();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v31, v30);
      BOOL v22 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v22(v29, v14);
      uint64_t v23 = v16;
      uint64_t v3 = v0 + 16;
      v22(v23, v14);
      goto LABEL_8;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 248), *(void *)(v0 + 224));
  }
  sub_6EE8(*v2, (uint64_t *)&unk_78360);
  uint64_t v10 = sub_616C0();
  os_log_type_t v11 = sub_61970();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "VerbEntityDisambiguationFlow: could not extract loggingIds for actions. SELF DisambiguationDialogGenerated message was not emitted as a result.", v12, 2u);
    swift_slowDealloc();
  }

LABEL_8:
  uint64_t v24 = *(void **)(v0 + 144);
  uint64_t v25 = v24[15];
  uint64_t v26 = v24[16];
  sub_6EA4(v24 + 12, v25);
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_5974C;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v3, v25, v26);
}

uint64_t sub_5974C()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_6024C;
  }
  else
  {
    uint64_t v1 = sub_59864;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_59864()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  sub_6EA4((void *)(v0[18] + 56), *(void *)(v0[18] + 80));
  sub_606A0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, enum case for ActivityType.disambiguation(_:), v3);
  if (qword_75E10 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[19];
  uint64_t v5 = enum case for SiriKitReliabilityCodes.disambiguationActionRouting(_:);
  uint64_t v6 = sub_60620();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(v4, v5, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  sub_60680();
  sub_60610();
  swift_release();
  sub_608C0();
  sub_63E8((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_59AB0()
{
  uint64_t v9 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_616C0();
  os_log_type_t v2 = sub_61970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_61CE0();
    *(void *)(v0 + 128) = sub_316A4(v4, v5, &v8);
    sub_619C0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "VerbEntityDisambiguationFlow: cannot create output for disambiguation, will redirect to fallback action. Error: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_60900();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_59CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v174 = a3;
  uint64_t v172 = a2;
  uint64_t v144 = a4;
  uint64_t v162 = sub_60DE0();
  uint64_t v173 = *(uint8_t **)(v162 - 8);
  __chkstk_darwin(v162, v5);
  uint64_t v164 = (char *)&v138 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6D90((uint64_t *)&unk_78250);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v166 = (char *)&v138 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6D90(&qword_763A8);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v165 = (uint8_t *)&v138 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = sub_60F00();
  uint64_t v171 = *(void *)(v168 - 8);
  uint64_t v14 = __chkstk_darwin(v168, v13);
  uint64_t v156 = (char *)&v138 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  uint64_t v163 = (char *)&v138 - v18;
  __chkstk_darwin(v17, v19);
  uint64_t v177 = (char *)&v138 - v20;
  uint64_t v21 = sub_607D0();
  uint64_t v148 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v22);
  uint64_t v169 = (uint8_t *)&v138 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (uint8_t *)sub_60DA0();
  uint64_t v25 = *((void *)v24 - 1);
  uint64_t v27 = __chkstk_darwin(v24, v26);
  uint64_t v29 = (char *)&v138 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27, v30);
  uint64_t v32 = (char *)&v138 - v31;
  if (qword_75DE8 != -1) {
LABEL_122:
  }
    swift_once();
  uint64_t v33 = sub_616D0();
  uint64_t v34 = sub_6D40(v33, (uint64_t)qword_7A9C8);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint8_t *))(v25 + 16);
  uint64_t v176 = a1;
  v35(v32, a1, v24);
  uint64_t v170 = v34;
  id v36 = sub_616C0();
  os_log_type_t v37 = sub_61970();
  uint64_t v175 = v36;
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v149 = v21;
  if (v38)
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v178 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v167 = v39 + 4;
    v35(v29, (uint64_t)v32, v24);
    uint64_t v40 = sub_61800();
    uint64_t v180 = sub_316A4(v40, v41, (uint64_t *)&v178);
    uint64_t v42 = v149;
    sub_619C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint8_t *))(v25 + 8))(v32, v24);
    uint64_t v43 = v175;
    _os_log_impl(&dword_0, v175, v37, "VerbEntityDisambiguationFlow: resolveResponseToVerbEntityParaphraseDisambiguation with usoParse %s", v39, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = v168;
  }
  else
  {
    uint64_t v44 = v21;
    (*(void (**)(char *, uint8_t *))(v25 + 8))(v32, v24);

    uint64_t v21 = v168;
    uint64_t v42 = v44;
  }
  unint64_t v45 = sub_55EFC();
  uint64_t v24 = v169;
  if (!v45)
  {
    uint64_t v117 = sub_616C0();
    os_log_type_t v118 = sub_61960();
    if (os_log_type_enabled(v117, v118))
    {
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v119 = 0;
      _os_log_impl(&dword_0, v117, v118, "VerbEntityDisambiguationFlow: User response cannot be interpreted as a UsoTask", v119, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v148 + 56))(v144, 1, 1, v42);
  }
  unint64_t v143 = v45;
  uint64_t v25 = sub_612C0();
  unint64_t v47 = v46;
  sub_6D90(&qword_768B0);
  uint64_t v48 = v148;
  uint64_t v49 = v42;
  uint64_t v50 = *(void *)(v148 + 72);
  unint64_t v51 = (*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_62540;
  uint64_t v167 = (uint8_t *)v52;
  unint64_t v53 = v52 + v51;
  uint64_t v54 = *(void (**)(unint64_t, uint64_t, uint64_t))(v48 + 16);
  v54(v53, v172, v49);
  uint64_t v161 = v50;
  unint64_t v160 = v53;
  unint64_t v55 = v53 + v50;
  uint64_t v42 = v49;
  long long v56 = v24;
  uint64_t v57 = v48 + 16;
  uint64_t v158 = (void (*)(uint8_t *, unint64_t, uint64_t))v54;
  v54(v55, v174, v42);
  int v59 = 0;
  unint64_t v60 = 0;
  a1 = 0;
  uint64_t v155 = (void (**)(char *, char *, uint64_t))(v171 + 32);
  uint64_t v154 = (void (**)(uint64_t, uint64_t))(v173 + 8);
  uint64_t v29 = (char *)(v171 + 16);
  uint64_t v175 = (v171 + 8);
  uint64_t v147 = v179;
  uint64_t v159 = v57;
  v157 = (void (**)(uint8_t *, uint64_t))(v57 - 8);
  uint64_t v141 = &v181;
  uint64_t v153 = v25;
  unint64_t v174 = v47;
  BOOL v62 = v25 == 0x627265566F6ELL && v47 == 0xE600000000000000;
  BOOL v152 = v62;
  *(void *)&long long v58 = 136315138;
  long long v146 = v58;
  uint64_t v145 = (char *)&type metadata for Any + 8;
  *(void *)&long long v58 = 136315394;
  long long v142 = v58;
  uint64_t v32 = v166;
  uint64_t v151 = (char *)(v171 + 16);
  while (1)
  {
    if (v60 >= *((void *)v167 + 2))
    {
      __break(1u);
LABEL_121:
      __break(1u);
      goto LABEL_122;
    }
    LODWORD(v173) = v59;
    v158(v56, v160 + v60 * v161, v42);
    sub_60790();
    uint64_t v63 = sub_609D0();
    uint64_t v64 = *(void *)(v63 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v32, 1, v63) == 1)
    {
      int v120 = (uint64_t *)&unk_78250;
      uint64_t v121 = (uint64_t)v32;
LABEL_109:
      sub_6EE8(v121, v120);
      swift_bridgeObjectRelease();
      goto LABEL_113;
    }
    uint64_t v24 = v165;
    sub_609B0();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v32, v63);
    uint64_t v65 = sub_609A0();
    uint64_t v66 = *(void *)(v65 - 8);
    if ((*(unsigned int (**)(uint8_t *, uint64_t, uint64_t))(v66 + 48))(v24, 1, v65) == 1)
    {
      int v120 = &qword_763A8;
      uint64_t v121 = (uint64_t)v24;
      goto LABEL_109;
    }
    uint64_t v67 = v163;
    sub_60970();
    (*(void (**)(uint8_t *, uint64_t))(v66 + 8))(v24, v65);
    (*v155)(v177, v67, v21);
    uint64_t v25 = (uint64_t)v164;
    sub_60ED0();
    uint64_t v68 = sub_61010();
    if (a1) {
      break;
    }
    uint64_t v69 = v68;
    (*v154)(v25, v162);
    uint64_t v70 = sub_61120();
    uint64_t v71 = v70;
    if ((unint64_t)v70 >> 62)
    {
      if (v70 < 0) {
        uint64_t v25 = v70;
      }
      else {
        uint64_t v25 = v70 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v32 = (char *)sub_61B60();
      swift_bridgeObjectRelease();
      if (!v32)
      {
LABEL_111:
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_112;
      }
    }
    else
    {
      uint64_t v32 = *(char **)((char *)&dword_10 + (v70 & 0xFFFFFFFFFFFFFF8));
      if (!v32) {
        goto LABEL_111;
      }
    }
    uint64_t v172 = v69;
    if ((v71 & 0xC000000000000001) != 0)
    {
      uint64_t v176 = sub_61A90();
      int v72 = v156;
    }
    else
    {
      int v72 = v156;
      if (!*(void *)((char *)&dword_10 + (v71 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_121;
      }
      uint64_t v176 = *(void *)(v71 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v73 = *(void (**)(uint64_t *, char *, uint64_t))v29;
    (*(void (**)(char *, char *, uint64_t))v29)(v72, v177, v21);
    uint64_t v74 = sub_616C0();
    uint64_t v75 = v21;
    os_log_type_t v76 = sub_61960();
    BOOL v77 = os_log_type_enabled(v74, v76);
    uint64_t v171 = 0;
    if (v77)
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v180 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = v146;
      uint64_t v150 = v24 + 4;
      sub_60FF0();
      v179[2] = v75;
      v179[3] = sub_5FCA0((unint64_t *)&unk_78350, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserStatedTask);
      uint64_t v78 = sub_838C((uint64_t *)&v178);
      v73(v78, v72, v75);
      uint64_t v79 = sub_60FE0();
      unint64_t v81 = v80;
      sub_63E8((uint64_t)&v178);
      uint64_t v178 = (uint8_t *)sub_316A4(v79, v81, &v180);
      sub_619C0();
      swift_bridgeObjectRelease();
      Class isa = (void (*)(char *))v175->isa;
      ((void (*)(char *, uint64_t))v175->isa)(v72, v75);
      _os_log_impl(&dword_0, v74, v76, "VerbEntityDisambiguationFlow: comparing to offered userStatedTask %s", v24, 0xCu);
      swift_arrayDestroy();
      uint64_t v42 = v149;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      Class isa = (void (*)(char *))v175->isa;
      ((void (*)(char *, uint64_t))v175->isa)(v72, v75);
    }

    uint64_t v83 = sub_612C0();
    unint64_t v85 = v84;
    unint64_t v86 = v153;
    if (v152)
    {
      long long v56 = v169;
    }
    else
    {
      uint64_t v87 = v83;
      char v88 = sub_61CA0();
      long long v56 = v169;
      if ((v88 & 1) == 0 && (v86 != v87 || v174 != v85))
      {
        unint64_t v89 = v174;
        if ((sub_61CA0() & 1) == 0)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          uint64_t v24 = (uint8_t *)sub_616C0();
          os_log_type_t v113 = sub_61960();
          if (os_log_type_enabled((os_log_t)v24, v113))
          {
            uint64_t v114 = swift_slowAlloc();
            uint64_t v150 = (uint8_t *)swift_slowAlloc();
            uint64_t v178 = v150;
            *(_DWORD *)uint64_t v114 = v142;
            swift_bridgeObjectRetain();
            uint64_t v180 = sub_316A4(v153, v89, (uint64_t *)&v178);
            sub_619C0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v114 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v180 = sub_316A4(v87, v85, (uint64_t *)&v178);
            sub_619C0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_0, (os_log_t)v24, v113, "VerbEntityDisambiguationFlow: response verb %s does not match offered verb %s", (uint8_t *)v114, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }

          swift_release();
          swift_release();
          uint64_t v21 = v168;
          isa(v177);
          uint64_t v42 = v149;
          (*v157)(v56, v149);
          uint64_t v32 = v166;
          a1 = v171;
          uint64_t v29 = v151;
          uint64_t v25 = v173;
          goto LABEL_101;
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v90 = sub_612D0();
    if (*(void *)(v90 + 16))
    {
      unint64_t v91 = sub_3C8A4(0x636E657265666572, 0xE900000000000065);
      a1 = v171;
      uint64_t v29 = v151;
      if ((v92 & 1) == 0) {
        goto LABEL_98;
      }
      unint64_t v93 = *(void *)(*(void *)(v90 + 56) + 8 * v91);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (!(v93 >> 62))
      {
        if (*(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8))) {
          goto LABEL_35;
        }
LABEL_98:
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
LABEL_99:
        uint64_t v32 = v166;
        uint64_t v25 = v173;
        uint64_t v112 = v168;
        goto LABEL_100;
      }
      swift_bridgeObjectRetain();
      unint64_t v86 = sub_61B60();
      swift_bridgeObjectRelease();
      if (!v86) {
        goto LABEL_98;
      }
LABEL_35:
      if ((v93 & 0xC000000000000001) != 0)
      {
        sub_61A90();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          uint64_t v130 = v90;
          uint64_t v173 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v131 = sub_616C0();
          os_log_type_t v132 = sub_61960();
          if (os_log_type_enabled(v131, v132))
          {
            uint64_t v133 = swift_slowAlloc();
            uint64_t v178 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v133 = v142;
            unint64_t v134 = v139;
            swift_bridgeObjectRetain();
            uint64_t v180 = sub_316A4((uint64_t)v150, v134, (uint64_t *)&v178);
            sub_619C0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v133 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v180 = sub_316A4(v130, v86, (uint64_t *)&v178);
            sub_619C0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_0, v131, v132, "VerbEntityDisambiguationFlow: Offered entity name %s mathces response entity name %s", (uint8_t *)v133, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          ((void (*)(char *, uint64_t))isa)(v177, v168);
          uint64_t v135 = v148;
          uint64_t v136 = v144;
          uint64_t v137 = v149;
          (*(void (**)(uint64_t, uint8_t *, uint64_t))(v148 + 32))(v144, v169, v149);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v135 + 56))(v136, 0, 1, v137);
        }
        swift_retain();
      }
      swift_bridgeObjectRelease();
      uint64_t v24 = (uint8_t *)sub_61320();
      swift_release();
      if (v24)
      {
        uint64_t v90 = sub_61330();
        if (!*(void *)(v90 + 16)) {
          goto LABEL_69;
        }
        unint64_t v94 = sub_3C8A4(1701667182, 0xE400000000000000);
        if ((v95 & 1) == 0) {
          goto LABEL_69;
        }
        unint64_t v96 = *(void *)(*(void *)(v90 + 56) + 8 * v94);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (!(v96 >> 62))
        {
          if (*(void *)((char *)&dword_10 + (v96 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_43;
          }
LABEL_69:
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
LABEL_70:
          swift_release();
          goto LABEL_99;
        }
        swift_bridgeObjectRetain();
        unint64_t v86 = sub_61B60();
        swift_bridgeObjectRelease();
        if (!v86) {
          goto LABEL_69;
        }
LABEL_43:
        if ((v96 & 0xC000000000000001) != 0)
        {
          sub_61A90();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v96 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_124;
          }
          swift_retain();
        }
        swift_bridgeObjectRelease();
        uint64_t v97 = sub_61300();
        unint64_t v99 = v98;
        swift_release();
        if (!v99)
        {
          swift_release();
          swift_release();
          goto LABEL_70;
        }
        uint64_t v100 = sub_612D0();
        if (!*(void *)(v100 + 16) || (unint64_t v101 = sub_3C8A4(0x636E657265666572, 0xE900000000000065), (v102 & 1) == 0))
        {
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_76;
        }
        uint64_t v150 = (uint8_t *)v97;
        unint64_t v103 = *(void *)(*(void *)(v100 + 56) + 8 * v101);
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRelease();
        if (!(v103 >> 62))
        {
          if (*(void *)((char *)&dword_10 + (v103 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_51;
          }
LABEL_97:
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_98;
        }
        swift_bridgeObjectRetain();
        uint64_t v115 = sub_61B60();
        uint64_t result = swift_bridgeObjectRelease();
        if (!v115) {
          goto LABEL_97;
        }
LABEL_51:
        if ((v103 & 0xC000000000000001) != 0)
        {
          sub_61A90();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v103 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
LABEL_130:
            __break(1u);
            return result;
          }
          swift_retain();
        }
        swift_bridgeObjectRelease();
        uint64_t v105 = sub_61320();
        swift_release();
        if (v105)
        {
          uint64_t v106 = sub_61330();
          if (*(void *)(v106 + 16))
          {
            unint64_t v107 = sub_3C8A4(1701667182, 0xE400000000000000);
            if (v108)
            {
              uint64_t v140 = v105;
              unint64_t v109 = *(void *)(*(void *)(v106 + 56) + 8 * v107);
              swift_bridgeObjectRetain();
              uint64_t result = swift_bridgeObjectRelease();
              if (v109 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v116 = sub_61B60();
                uint64_t result = swift_bridgeObjectRelease();
                if (v116) {
                  goto LABEL_59;
                }
              }
              else if (*(void *)((char *)&dword_10 + (v109 & 0xFFFFFFFFFFFFFF8)))
              {
LABEL_59:
                unint64_t v139 = v99;
                if ((v109 & 0xC000000000000001) != 0)
                {
                  sub_61A90();
                }
                else
                {
                  if (!*(void *)((char *)&dword_10 + (v109 & 0xFFFFFFFFFFFFFF8))) {
                    goto LABEL_130;
                  }
                  swift_retain();
                }
                swift_bridgeObjectRelease();
                uint64_t v90 = sub_61300();
                unint64_t v111 = v110;
                swift_release();
                if (v111)
                {
                  uint64_t v178 = v150;
                  v179[0] = v139;
                  uint64_t v180 = v90;
                  unint64_t v181 = v111;
                  unint64_t v86 = v111;
                  sub_1D8E8();
                  if (!sub_619E0()) {
                    goto LABEL_125;
                  }
                  swift_bridgeObjectRelease();
                  swift_release();
                }
                else
                {
                  swift_release();
                }
                goto LABEL_65;
              }
              swift_release();
              goto LABEL_97;
            }
          }
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
LABEL_76:
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_70;
        }
LABEL_65:
        swift_bridgeObjectRelease();
        swift_release();
      }
      swift_release();
      goto LABEL_70;
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v112 = v168;
    uint64_t v32 = v166;
    a1 = v171;
    uint64_t v29 = v151;
    uint64_t v25 = v173;
LABEL_100:
    uint64_t v21 = v112;
    isa(v177);
    (*v157)(v56, v42);
LABEL_101:
    int v59 = 1;
    unint64_t v60 = 1;
    if (v25)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v126 = sub_616C0();
      os_log_type_t v127 = sub_61960();
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v129 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v129 = 0;
        _os_log_impl(&dword_0, v126, v127, "VerbEntityDisambiguationFlow: resolveResponseToVerbEntityParaphraseDisambiguation no match found", v129, 2u);
        swift_slowDealloc();
      }

      swift_release();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v148 + 56))(v144, 1, 1, v42);
    }
  }
  swift_bridgeObjectRelease();
  swift_errorRelease();
  (*v154)(v25, v162);
LABEL_112:
  ((void (*)(char *, uint64_t))v175->isa)(v177, v21);
LABEL_113:
  swift_bridgeObjectRelease();
  os_log_type_t v122 = sub_616C0();
  os_log_type_t v123 = sub_61960();
  if (os_log_type_enabled(v122, v123))
  {
    os_log_type_t v124 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v124 = 0;
    _os_log_impl(&dword_0, v122, v123, "VerbEntityDisambiguationFlow: pluginAction has no userStatedTask paraphrase that can be interpreted as a UsoTask", v124, 2u);
    swift_slowDealloc();
  }

  swift_release();
  uint64_t v125 = v148;
  (*(void (**)(uint8_t *, uint64_t))(v148 + 8))(v56, v42);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v125 + 56))(v144, 1, 1, v42);
}

uint64_t sub_5B558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = sub_60F70();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3, v4);
  unint64_t v53 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  uint64_t v57 = (char *)v51 - v8;
  uint64_t v56 = sub_60F40();
  uint64_t v9 = *(void *)(v56 - 8);
  __chkstk_darwin(v56, v10);
  int v59 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_60EC0();
  uint64_t v12 = *(void *)(v52 - 8);
  uint64_t v14 = __chkstk_darwin(v52, v13);
  uint64_t v70 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)v51 - v17;
  uint64_t v19 = sub_60F00();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v22 = __chkstk_darwin(v19, v21);
  uint64_t v68 = (char *)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v24);
  uint64_t v69 = (char *)v51 - v25;
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v71 = v9;
  uint64_t v55 = v3;
  if (v26)
  {
    uint64_t v27 = *(void *)(sub_609A0() - 8);
    uint64_t v28 = a1 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
    uint64_t v65 = (void (**)(char *, char *, uint64_t))(v20 + 16);
    uint64_t v64 = *(void *)(v27 + 72);
    uint64_t v62 = v12 + 32;
    uint64_t v63 = (void (**)(char *, char *, uint64_t))(v12 + 16);
    unint64_t v60 = (void (**)(char *, uint64_t))(v20 + 8);
    uint64_t v61 = v12 + 8;
    v51[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v29 = _swiftEmptyArrayStorage;
    uint64_t v30 = v69;
    uint64_t v31 = v70;
    uint64_t v32 = v52;
    uint64_t v66 = v12;
    uint64_t v67 = v19;
    do
    {
      sub_60970();
      sub_60EB0();
      (*v65)(v68, v30, v19);
      sub_60E80();
      (*v63)(v31, v18, v32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v29 = (void *)sub_5D8A4(0, v29[2] + 1, 1, (unint64_t)v29, &qword_76CF8, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
      }
      unint64_t v34 = v29[2];
      unint64_t v33 = v29[3];
      uint64_t v35 = v66;
      if (v34 >= v33 >> 1) {
        uint64_t v29 = (void *)sub_5D8A4(v33 > 1, v34 + 1, 1, (unint64_t)v29, &qword_76CF8, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
      }
      v29[2] = v34 + 1;
      unint64_t v36 = (unint64_t)v29
          + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
          + *(void *)(v35 + 72) * v34;
      uint64_t v31 = v70;
      (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v36, v70, v32);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v32);
      uint64_t v30 = v69;
      uint64_t v19 = v67;
      (*v60)(v69, v67);
      v28 += v64;
      --v26;
    }
    while (v26);
    uint64_t v37 = v71;
    swift_bridgeObjectRelease();
    uint64_t v3 = v55;
  }
  else
  {
    uint64_t v37 = v9;
  }
  BOOL v38 = v59;
  sub_60F30();
  uint64_t v39 = v57;
  sub_60F60();
  sub_60F50();
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v53, v39, v3);
  sub_60F10();
  uint64_t v40 = v56;
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_616D0();
  sub_6D40(v41, (uint64_t)qword_7A9C8);
  uint64_t v42 = sub_616C0();
  os_log_type_t v43 = sub_61960();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136315138;
    sub_60FF0();
    swift_beginAccess();
    v72[3] = v40;
    v72[4] = sub_5FCA0((unint64_t *)&unk_78340, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
    unint64_t v45 = sub_838C(v72);
    (*(void (**)(uint64_t *, char *, uint64_t))(v71 + 16))(v45, v59, v40);
    uint64_t v46 = sub_60FE0();
    unint64_t v48 = v47;
    sub_63E8((uint64_t)v72);
    v72[0] = sub_316A4(v46, v48, &v73);
    uint64_t v49 = v71;
    sub_619C0();
    uint64_t v40 = v56;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v42, v43, "VerbEntityDisambiguationFlow: NLUSystemDialogAct: %s", v44, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    BOOL v38 = v59;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v55);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v3);
    uint64_t v49 = v37;
  }
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v49 + 16))(v54, v38, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v38, v40);
}

uint64_t sub_5BDA8(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  sub_6D90((uint64_t *)&unk_76560);
  v2[22] = swift_task_alloc();
  uint64_t v3 = sub_60940();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v4 = sub_60F40();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v5 = sub_60B00();
  v2[29] = v5;
  v2[30] = *(void *)(v5 - 8);
  v2[31] = swift_task_alloc();
  uint64_t v6 = sub_60A40();
  v2[32] = v6;
  v2[33] = *(void *)(v6 - 8);
  v2[34] = swift_task_alloc();
  uint64_t v7 = sub_60A70();
  v2[35] = v7;
  v2[36] = *(void *)(v7 - 8);
  v2[37] = swift_task_alloc();
  sub_6D90((uint64_t *)&unk_78250);
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  sub_6D90(&qword_763A8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  uint64_t v8 = sub_609A0();
  v2[42] = v8;
  v2[43] = *(void *)(v8 - 8);
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  return _swift_task_switch(sub_5C0F4, 0, 0);
}

uint64_t sub_5C0F4()
{
  if (qword_75DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_616D0();
  sub_6D40(v1, (uint64_t)qword_7A9C8);
  os_log_type_t v2 = sub_616C0();
  os_log_type_t v3 = sub_61960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "VerbEntityDisambiguationFlow: generating output", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 312);

  sub_60790();
  uint64_t v6 = sub_609D0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(v5, 1, v6);
  uint64_t v10 = *(void *)(v0 + 336);
  uint64_t v11 = *(void *)(v0 + 344);
  uint64_t v12 = (uint64_t *)(v0 + 328);
  uint64_t v13 = *(void *)(v0 + 328);
  uint64_t v14 = *(void *)(v0 + 312);
  if (v9 == 1)
  {
    sub_6EE8(*(void *)(v0 + 312), (uint64_t *)&unk_78250);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v13, 1, 1, v10);
LABEL_12:
    sub_6EE8(*v12, &qword_763A8);
    sub_5D7E8();
    swift_allocError();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  sub_609B0();
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v55(v14, v6);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v15(v13, 1, v10) == 1) {
    goto LABEL_12;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(v0 + 304);
  unint64_t v53 = *(void (**)(void, void, void))(*(void *)(v0 + 344) + 32);
  v53(*(void *)(v0 + 360), *(void *)(v0 + 328), *(void *)(v0 + 336));
  sub_60790();
  if (v8(v17, 1, v6) == 1)
  {
    uint64_t v18 = *(void *)(v0 + 336);
    uint64_t v19 = *(void *)(v0 + 344);
    uint64_t v20 = *(void *)(v0 + 320);
    sub_6EE8(*(void *)(v0 + 304), (uint64_t *)&unk_78250);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v20, 1, 1, v18);
LABEL_11:
    (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
    uint64_t v12 = (uint64_t *)(v0 + 320);
    goto LABEL_12;
  }
  uint64_t v21 = *(void *)(v0 + 336);
  uint64_t v22 = *(void *)(v0 + 320);
  uint64_t v23 = *(void *)(v0 + 304);
  sub_609B0();
  v55(v23, v6);
  if (v16(v22, 1, v21) == 1) {
    goto LABEL_11;
  }
  uint64_t v26 = *(void *)(v0 + 296);
  uint64_t v27 = *(void *)(v0 + 168);
  v53(*(void *)(v0 + 352), *(void *)(v0 + 320), *(void *)(v0 + 336));
  sub_6EA4((void *)(v27 + 16), *(void *)(v27 + 40));
  sub_60990();
  sub_60990();
  sub_52588(0xD000000000000029, 0x8000000000065460, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void *)(v0 + 352);
  uint64_t v29 = *(void *)(v0 + 360);
  uint64_t v30 = *(void *)(v0 + 336);
  uint64_t v31 = *(void *)(v0 + 344);
  uint64_t v32 = *(void *)(v0 + 288);
  uint64_t v51 = *(void *)(v0 + 280);
  uint64_t v52 = *(void *)(v0 + 296);
  uint64_t v33 = *(void *)(v0 + 240);
  uint64_t v34 = *(void *)(v0 + 248);
  uint64_t v54 = *(void *)(v0 + 232);
  sub_6D90(&qword_77460);
  uint64_t v35 = v29;
  unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_625B0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v32 + 16))(v37 + v36, v52, v51);
  (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v34, enum case for BehaviorAfterSpeaking.listen(_:), v54);
  sub_60A00();
  sub_6D90(&qword_78270);
  uint64_t v38 = *(void *)(v31 + 72);
  int v39 = *(_DWORD *)(v31 + 80);
  *(_DWORD *)(v0 + 408) = v39;
  unint64_t v40 = (v39 + 32) & ~(unint64_t)v39;
  uint64_t v41 = swift_allocObject();
  *(void *)(v0 + 368) = v41;
  *(_OWORD *)(v41 + 16) = xmmword_62540;
  unint64_t v42 = v41 + v40;
  os_log_type_t v43 = *(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 16);
  v43(v42, v35, v30);
  v43(v42 + v38, v28, v30);
  uint64_t v44 = *(void *)(v41 + 16);
  if (v44)
  {
    sub_61B10();
    uint64_t v45 = 0;
    do
    {
      uint64_t v46 = v45 + 1;
      sub_3DA40(v45);
      sub_61AF0();
      sub_61B20();
      sub_61B30();
      sub_61B00();
      uint64_t v45 = v46;
    }
    while (v44 != v46);
  }
  *(void *)(v0 + 376) = _swiftEmptyArrayStorage;
  uint64_t v47 = *(void *)(v0 + 168);
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = v47;
  *(void *)(v48 + 24) = _swiftEmptyArrayStorage;
  uint64_t v49 = swift_allocObject();
  *(void *)(v0 + 384) = v49;
  *(void *)(v49 + 16) = &unk_78280;
  *(void *)(v49 + 24) = v48;
  uint64_t v56 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_78298 + dword_78298);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v50;
  *uint64_t v50 = v0;
  v50[1] = sub_5C870;
  return v56((uint64_t)&unk_78290, v49, v41);
}

uint64_t sub_5C870(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  v3[17] = v2;
  v3[18] = a1;
  v3[19] = v1;
  v3[50] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v4 = sub_5CEB4;
  }
  else
  {
    uint64_t v4 = sub_5C9F4;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_5C9F4()
{
  if (*(void *)(v0 + 376) >> 62)
  {
    swift_bridgeObjectRetain();
    sub_6D90((uint64_t *)&unk_78300);
    sub_61B50();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_61CB0();
  }
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v27 = *(void *)(v0 + 352);
  uint64_t v28 = *(void *)(v0 + 360);
  uint64_t v25 = *(void *)(v0 + 344);
  uint64_t v26 = *(void *)(v0 + 336);
  uint64_t v23 = *(void *)(v0 + 280);
  uint64_t v24 = *(void *)(v0 + 296);
  uint64_t v19 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 264);
  uint64_t v21 = *(void *)(v0 + 256);
  uint64_t v22 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 184);
  uint64_t v29 = *(void *)(v0 + 176);
  uint64_t v18 = *(uint64_t **)(v0 + 160);
  swift_bridgeObjectRelease();
  sub_1D8A4(0, &qword_76830);
  uint64_t v16 = (void *)sub_61940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_5B558(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v15 = v5;
  sub_60930();
  sub_6D90(&qword_768E0);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_625B0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16))(v8 + v7, v2, v4);
  sub_60910();
  sub_60D20();
  sub_60D20();
  sub_6EA4((void *)(v0 + 56), *(void *)(v0 + 80));
  sub_606D0();
  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_62660;
  *(void *)(v9 + 32) = v16;
  sub_61880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v29, v5, v17);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v29, 0, 1, v17);
  uint64_t v10 = sub_60DC0();
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  v18[3] = v10;
  v18[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_838C(v18);
  id v11 = v16;
  sub_608A0();
  swift_bridgeObjectRelease();

  sub_6EE8(v0 + 96, (uint64_t *)&unk_78310);
  sub_6EE8(v29, (uint64_t *)&unk_76560);
  sub_63E8(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  v12(v27, v26);
  v12(v28, v26);
  sub_63E8(v0 + 56);
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
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_5CEB4()
{
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[42];
  uint64_t v4 = v0[43];
  uint64_t v6 = v0[36];
  uint64_t v5 = v0[37];
  uint64_t v7 = v0[35];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v8(v1, v3);
  v8(v2, v3);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_5D024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a2;
  void v4[4] = a4;
  v4[2] = a1;
  return _swift_task_switch(sub_5D048, 0, 0);
}

unint64_t sub_5D048()
{
  uint64_t v1 = v0[4];
  unint64_t result = v0[2];
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)sub_61A90();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)) <= result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v3 = *(id *)(v1 + 8 * result + 32);
LABEL_5:
  uint64_t v4 = v3;
  id v5 = sub_5FB0C();

  uint64_t v6 = (uint64_t (*)(id))v0[1];
  return v6(v5);
}

uint64_t sub_5D118(uint64_t a1, uint64_t *a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = *a2;
  uint64_t v7 = sub_6D90(&qword_78320);
  uint64_t v8 = a3;
  uint64_t v9 = (char *)a2 + *(int *)(v7 + 48);
  uint64_t v12 = (uint64_t (*)(uint64_t, char *))((char *)v8 + *v8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v10;
  void *v10 = v3;
  v10[1] = sub_5D21C;
  return v12(v6, v9);
}

uint64_t sub_5D21C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_5D32C()
{
  sub_63E8(v0 + 16);
  sub_63E8(v0 + 56);
  sub_63E8(v0 + 96);
  uint64_t v1 = v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_firstAction;
  uint64_t v2 = sub_607D0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_secondAction, v2);
  v3(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_fallBackAction, v2);
  sub_5FDB0(v0 + OBJC_IVAR____TtC17CAMRootFlowPlugin28VerbEntityDisambiguationFlow_state);

  return swift_deallocClassInstance();
}

uint64_t sub_5D440()
{
  return type metadata accessor for VerbEntityDisambiguationFlow(0);
}

uint64_t type metadata accessor for VerbEntityDisambiguationFlow(uint64_t a1)
{
  return sub_61F0(a1, (uint64_t *)&unk_78088);
}

uint64_t sub_5D468()
{
  uint64_t result = sub_607D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for VerbEntityDisambiguationFlow.State(319);
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

uint64_t type metadata accessor for VerbEntityDisambiguationFlow.State(uint64_t a1)
{
  return sub_61F0(a1, qword_78228);
}

uint64_t sub_5D568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5D57C);
}

uint64_t sub_5D57C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90((uint64_t *)&unk_76030);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_5D5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5D600);
}

uint64_t sub_5D600(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_6D90((uint64_t *)&unk_76030);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

BOOL sub_5D688(uint64_t a1)
{
  return sub_5725C(a1);
}

uint64_t sub_5D6B0()
{
  return sub_60550();
}

uint64_t sub_5D710(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_6C0C;
  return sub_58734(a1);
}

uint64_t sub_5D7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for VerbEntityDisambiguationFlow(0);

  return Flow<>.exitValue.getter(v3, a2);
}

unint64_t sub_5D7E8()
{
  unint64_t result = qword_78260;
  if (!qword_78260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_78260);
  }
  return result;
}

uint64_t sub_5D83C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_5D8A4(a1, a2, a3, a4, &qword_783C8, (uint64_t (*)(void))&type metadata accessor for USOParse, (uint64_t (*)(void))&type metadata accessor for USOParse);
}

uint64_t sub_5D870(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_5D8A4(a1, a2, a3, a4, &qword_78270, (uint64_t (*)(void))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase, (uint64_t (*)(void))&type metadata accessor for ActionParaphrase.VerbEntityParaphrase);
}

uint64_t sub_5D8A4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_6D90(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_61B40();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5F9B0(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_5DB24(void *result, int64_t a2, char a3, void *a4)
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
      sub_6D90(&qword_78380);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_5E544(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_5DC34(void *result, int64_t a2, char a3, void *a4)
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
      sub_6D90(&qword_78390);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_5F130(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_5DD5C(void *result, int64_t a2, char a3, void *a4)
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
      sub_6D90(&qword_783B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_5ED20(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_5DE6C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 80) = a1;
  long long v7 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a6;
  uint64_t v8 = *(void *)(a6 + 32);
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 48) = v8;
  int64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v6 + 88) = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_5DF6C;
  return v11(v6 + 56, v6 + 16);
}

uint64_t sub_5DF6C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_5E0A8;
  }
  else {
    unint64_t v2 = sub_5E080;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_5E080()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E0A8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E0C0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 48) = a1;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 56) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_5E1B0;
  return v10(v6 + 16, a6);
}

uint64_t sub_5E1B0()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_5E2F0;
  }
  else {
    uint64_t v2 = sub_5E2C4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_5E2C4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E2F0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E308(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a1;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_5E3F8;
  return v10(v6 + 16, a6);
}

uint64_t sub_5E3F8()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_5E52C;
  }
  else {
    uint64_t v2 = sub_5E50C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_5E50C()
{
  **(void **)(v0 + 24) = *(void *)(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E52C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5E544(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

uint64_t sub_5E638()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5E678(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 24);
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *long long v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_5E734;
  v7[2] = a1;
  return _swift_task_switch(sub_5D048, 0, 0);
}

uint64_t sub_5E734(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_5E830()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5E868(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *long long v7 = v3;
  v7[1] = sub_1E98C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_78288 + dword_78288);
  return v8(a1, a2, v6);
}

void *sub_5E930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v44 = sub_607D0();
  uint64_t v4 = *(void *)(v44 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v44, v6);
  os_log_type_t v43 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6D90((uint64_t *)&unk_76920);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  uint64_t v51 = _swiftEmptyArrayStorage;
  sub_3CE68(0, v11, 0);
  v32[1] = a1;
  if (v11)
  {
    uint64_t v12 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v13 = a1 + ((v12 + 32) & ~v12);
    uint64_t v42 = *(void *)(v4 + 72);
    uint64_t v14 = sub_61910();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    uint64_t v40 = v15 + 56;
    uint64_t v41 = v16;
    uint64_t v38 = (v12 + 48) & ~v12;
    int v39 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v37 = v38 + v5;
    uint64_t v35 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v36 = v12 | 7;
    uint64_t v33 = (void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    while (1)
    {
      v41(v10, 1, 1, v14);
      uint64_t v18 = v43;
      uint64_t v17 = v44;
      (*v39)(v43, v13, v44);
      size_t v19 = (void *)swift_allocObject();
      void v19[2] = 0;
      BOOL v20 = v19 + 2;
      uint64_t v21 = v45;
      uint64_t v22 = v46;
      v19[3] = 0;
      v19[4] = v21;
      void v19[5] = v22;
      (*v35)((char *)v19 + v38, v18, v17);
      int v23 = (*v34)(v10, 1, v14);
      swift_retain();
      if (v23 == 1)
      {
        sub_6EE8((uint64_t)v10, (uint64_t *)&unk_76920);
        if (*v20) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_61900();
        (*v33)(v10, v14);
        if (*v20)
        {
LABEL_5:
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v24 = sub_618C0();
          uint64_t v26 = v25;
          swift_unknownObjectRelease();
          if (v26 | v24)
          {
            uint64_t v47 = 0;
            uint64_t v48 = 0;
            uint64_t v49 = v24;
            uint64_t v50 = v26;
          }
        }
      }
      uint64_t v27 = swift_task_create();
      uint64_t v28 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3CE68(0, v28[2] + 1, 1);
        uint64_t v28 = v51;
      }
      unint64_t v30 = v28[2];
      unint64_t v29 = v28[3];
      if (v30 >= v29 >> 1)
      {
        sub_3CE68(v29 > 1, v30 + 1, 1);
        uint64_t v28 = v51;
      }
      v28[2] = v30 + 1;
      v28[v30 + 4] = v27;
      v13 += v42;
      if (!--v11) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v28 = v51;
  swift_bridgeObjectRetain();
LABEL_15:
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_5ED20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

void *sub_5EE14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v4 = sub_6D90((uint64_t *)&unk_76920);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = _swiftEmptyArrayStorage;
  sub_3CD80(0, 0, 0);
  uint64_t v8 = v46;
  uint64_t v9 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v35 = v9;
  v30[1] = a1;
  if (v9)
  {
    uint64_t v10 = sub_61910();
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)(v10 - 8);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    uint64_t v33 = v12 + 56;
    uint64_t v34 = v13;
    uint64_t v31 = (void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v32 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v14 = (uint64_t *)(a1 + 56);
    uint64_t v15 = v37;
    do
    {
      uint64_t v41 = v8;
      uint64_t v16 = *(v14 - 1);
      uint64_t v17 = *v14;
      uint64_t v18 = *(v14 - 2);
      uint64_t v38 = *(v14 - 3);
      uint64_t v39 = v16;
      v34(v7, 1, 1, v10);
      size_t v19 = (void *)swift_allocObject();
      void v19[2] = 0;
      BOOL v20 = v19 + 2;
      uint64_t v21 = v36;
      v19[3] = 0;
      v19[4] = v21;
      void v19[5] = v15;
      v19[6] = v11;
      uint64_t v40 = v11;
      v19[7] = v38;
      v19[8] = v18;
      v19[9] = v39;
      v19[10] = v17;
      int v22 = (*v32)(v7, 1, v10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (v22 == 1)
      {
        sub_6EE8((uint64_t)v7, (uint64_t *)&unk_76920);
        if (*v20) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_61900();
        (*v31)(v7, v10);
        if (*v20)
        {
LABEL_5:
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v23 = sub_618C0();
          uint64_t v25 = v24;
          swift_unknownObjectRelease();
          if (v25 | v23)
          {
            uint64_t v42 = 0;
            uint64_t v43 = 0;
            uint64_t v44 = v23;
            uint64_t v45 = v25;
          }
        }
      }
      uint64_t v26 = swift_task_create();
      uint64_t v8 = v41;
      uint64_t v46 = v41;
      unint64_t v28 = v41[2];
      unint64_t v27 = v41[3];
      if (v28 >= v27 >> 1)
      {
        sub_3CD80(v27 > 1, v28 + 1, 1);
        uint64_t v8 = v46;
      }
      uint64_t v11 = v40 + 1;
      v14 += 4;
      v8[2] = v28 + 1;
      v8[v28 + 4] = v26;
    }
    while (v35 != v11);
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_5F130(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

void *sub_5F228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v66 = a2;
  uint64_t v67 = a3;
  uint64_t v4 = sub_6D90((uint64_t *)&unk_76920);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6D90(&qword_78320);
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  uint64_t v10 = __chkstk_darwin(v8, v9);
  uint64_t v62 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v61 = (char *)v52 - v14;
  uint64_t v16 = __chkstk_darwin(v13, v15);
  unint64_t v60 = (void *)((char *)v52 - v17);
  uint64_t v63 = v18;
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)v52 - v20;
  uint64_t v73 = _swiftEmptyArrayStorage;
  sub_3CEC8(0, 0, 0);
  int v22 = v73;
  uint64_t v23 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v59 = v23;
  v52[1] = a1;
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v58 = sub_609A0();
    uint64_t v25 = *(void *)(v58 - 8);
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
    uint64_t v56 = v25 + 16;
    uint64_t v57 = v26;
    uint64_t v27 = a1 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
    uint64_t v54 = *(void *)(v25 + 72);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v25 + 32);
    unint64_t v53 = v21;
    uint64_t v28 = (uint64_t)v62;
    do
    {
      uint64_t v29 = v65;
      unint64_t v30 = &v61[*(int *)(v65 + 48)];
      uint64_t v68 = v27;
      uint64_t v31 = v27;
      uint64_t v32 = v58;
      v57(v30, v31, v58);
      uint64_t v33 = *(int *)(v29 + 48);
      uint64_t v34 = (uint64_t)v60;
      uint64_t v35 = (char *)v60 + v33;
      *unint64_t v60 = v24;
      (*v55)(v35, v30, v32);
      sub_5F730(v34, (uint64_t)v21);
      uint64_t v36 = sub_61910();
      uint64_t v37 = *(void *)(v36 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v7, 1, 1, v36);
      sub_1DB7C((uint64_t)v21, v28, &qword_78320);
      unint64_t v38 = (*(unsigned __int8 *)(v64 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      uint64_t v39 = (void *)swift_allocObject();
      v39[2] = 0;
      uint64_t v40 = v39 + 2;
      uint64_t v41 = v66;
      uint64_t v42 = v67;
      v39[3] = 0;
      v39[4] = v41;
      void v39[5] = v42;
      sub_5F730(v28, (uint64_t)v39 + v38);
      int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v7, 1, v36);
      swift_retain();
      if (v43 == 1)
      {
        sub_6EE8((uint64_t)v7, (uint64_t *)&unk_76920);
        if (!*v40) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_61900();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v36);
        if (!*v40)
        {
LABEL_7:
          uint64_t v44 = 0;
          uint64_t v46 = 0;
          goto LABEL_8;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v44 = sub_618C0();
      uint64_t v46 = v45;
      swift_unknownObjectRelease();
LABEL_8:
      uint64_t v21 = v53;
      sub_1D8A4(0, &qword_76838);
      if (v46 | v44)
      {
        uint64_t v69 = 0;
        uint64_t v70 = 0;
        uint64_t v71 = v44;
        uint64_t v72 = v46;
      }
      uint64_t v47 = swift_task_create();
      sub_6EE8((uint64_t)v21, &qword_78320);
      int v22 = v73;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3CEC8(0, v22[2] + 1, 1);
        int v22 = v73;
      }
      uint64_t v48 = v68;
      unint64_t v50 = v22[2];
      unint64_t v49 = v22[3];
      if (v50 >= v49 >> 1)
      {
        sub_3CEC8(v49 > 1, v50 + 1, 1);
        int v22 = v73;
      }
      ++v24;
      v22[2] = v50 + 1;
      v22[v50 + 4] = v47;
      uint64_t v27 = v48 + v54;
    }
    while (v59 != v24);
  }
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_5F730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6D90(&qword_78320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5F798()
{
  uint64_t v1 = (int *)(sub_6D90(&qword_78320) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v1[14] + v3;
  uint64_t v7 = sub_609A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_5F898(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_6D90(&qword_78320) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (int *)v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_1E98C;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_78328 + dword_78328);
  return v11(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_5F9B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_61BA0();
  __break(1u);
  return result;
}

id sub_5FB0C()
{
  id v0 = [objc_allocWithZone((Class)SFRowCardSection) init];
  sub_60980();
  uint64_t v1 = (void *)sub_60810();
  swift_bridgeObjectRelease();
  [v0 setLeadingText:v1];

  sub_6D90((uint64_t *)&unk_76820);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_62660;
  id v3 = v0;
  *(void *)(v2 + 32) = sub_60820();
  sub_61880();
  sub_1D8A4(0, &qword_76858);
  Class isa = sub_61860().super.isa;
  swift_bridgeObjectRelease();
  [v3 setCommands:isa];

  return v3;
}

uint64_t sub_5FC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5FCA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_5FCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5FD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_5FDB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VerbEntityDisambiguationFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_5FE0C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_5FE5C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1E98C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_78398 + dword_78398);
  return v9(a1, v4, v5, v6, v7, (uint64_t)(v1 + 6));
}

uint64_t sub_5FF38()
{
  uint64_t v1 = sub_607D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_6000C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_607D0() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (int *)v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_6C0C;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_783B8 + dword_783B8);
  return v11(a1, v5, v6, v7, v8, v9);
}

unsigned char *storeEnumTagSinglePayload for AlternativeQuestionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x601BCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlternativeQuestionError()
{
  return &type metadata for AlternativeQuestionError;
}

unint64_t sub_601F8()
{
  unint64_t result = qword_783D0;
  if (!qword_783D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_783D0);
  }
  return result;
}

uint64_t sub_60250()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_60260()
{
  return JSONDecoder.init()();
}

uint64_t sub_60270()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_60280()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_60290()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_602A0()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_602B0()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_602C0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_602D0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_602E0()
{
  return UUID.init()();
}

uint64_t sub_602F0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_60300()
{
  return Locale.identifier.getter();
}

uint64_t sub_60310()
{
  return static Locale.current.getter();
}

uint64_t sub_60320()
{
  return type metadata accessor for Locale();
}

uint64_t sub_60330()
{
  return Apple_Parsec_Siri_V2alpha_Sash.appID.getter();
}

uint64_t sub_60340()
{
  return Apple_Parsec_Siri_V2alpha_Sash.appName.getter();
}

uint64_t sub_60350()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_Sash();
}

uint64_t sub_60360()
{
  return Apple_Parsec_Siri_V2alpha_ExperienceComponent.layoutExperience.getter();
}

uint64_t sub_60370()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
}

uint64_t sub_60380()
{
  return Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.sash.getter();
}

uint64_t sub_60390()
{
  return Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.hasSash.getter();
}

uint64_t sub_603A0()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent();
}

uint64_t sub_603B0()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_603C0()
{
  return static Separators.none.getter();
}

uint64_t sub_603D0()
{
  return type metadata accessor for Separators();
}

uint64_t sub_603E0()
{
  return BinaryButton.init(primaryButton:secondaryButton:componentName:linkIdentifier:)();
}

uint64_t sub_603F0()
{
  return type metadata accessor for BinaryButton();
}

uint64_t sub_60400()
{
  return CustomCanvas.init(bundleName:viewId:viewData:componentName:safeForLogging:requestsKeyWindow:hideConversationKeyline:)();
}

uint64_t sub_60410()
{
  return type metadata accessor for CustomCanvas();
}

uint64_t sub_60420()
{
  return type metadata accessor for SashStandard.Title();
}

uint64_t sub_60430()
{
  return SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)();
}

uint64_t sub_60440()
{
  return type metadata accessor for SashStandard();
}

uint64_t sub_60450()
{
  return type metadata accessor for _ProtoButton.FormAction();
}

uint64_t sub_60460()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_60470()
{
  return ProtobufBuilder.serializedData()();
}

uint64_t sub_60480()
{
  return type metadata accessor for ComponentWrapper();
}

uint64_t sub_60490()
{
  return ComponentWrapper.init(_:separators:)();
}

uint64_t sub_604A0()
{
  return type metadata accessor for Color();
}

uint64_t sub_604B0()
{
  return type metadata accessor for Button.LabelStyle();
}

uint64_t sub_604C0()
{
  return Button.init(action:label:thumbnail:formAction:labelStyle:buttonRole:componentName:linkIdentifier:)();
}

uint64_t sub_604D0()
{
  return type metadata accessor for Button();
}

uint64_t sub_604E0()
{
  return static Command.directInvocation(identifier:payload:isNavigation:)();
}

uint64_t sub_604F0()
{
  return type metadata accessor for Command();
}

uint64_t sub_60500()
{
  return type metadata accessor for Response();
}

uint64_t sub_60510()
{
  return Response.init(_:backgrounds:ornaments:hideRedactedElements:)();
}

uint64_t sub_60520()
{
  return PlatformErrorFlow.__allocating_init(outputPublisher:deviceState:)();
}

uint64_t sub_60530()
{
  return type metadata accessor for PlatformErrorFlow();
}

uint64_t sub_60540()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_60550()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_60560()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_60590()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_605A0()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_605B0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_605C0()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_605D0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_605E0(Swift::String refId)
{
}

void sub_605F0()
{
}

uint64_t sub_60600()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_60610()
{
  return dispatch thunk of SiriKitEventSending.send(_:)();
}

uint64_t sub_60620()
{
  return type metadata accessor for SiriKitReliabilityCodes();
}

uint64_t sub_60630()
{
  return static SiriKitPlatformErrorCase.fromParse(_:)();
}

uint64_t sub_60640()
{
  return type metadata accessor for SiriKitPlatformErrorCase();
}

uint64_t sub_60650()
{
  return static SiriKitDirectInvocationPayloads.reject.getter();
}

uint64_t sub_60660()
{
  return static SiriKitDirectInvocationPayloads.confirm.getter();
}

uint64_t sub_60670()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.statusReasonDescription.setter();
}

uint64_t sub_60680()
{
  return SiriKitEvent.__allocating_init(activityType:taskType:statusReason:_:)();
}

uint64_t sub_60690()
{
  return SiriKitEvent.__allocating_init(stateType:taskType:statusReason:_:)();
}

uint64_t sub_606A0()
{
  return type metadata accessor for SiriKitEvent();
}

uint64_t sub_606B0()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_606C0()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t sub_606D0()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_606E0()
{
  return dispatch thunk of DeviceState.isWatch.getter();
}

uint64_t sub_606F0()
{
  return dispatch thunk of DeviceState.isHomePod.getter();
}

uint64_t sub_60700()
{
  return DeviceState.asInvocationContext.getter();
}

uint64_t sub_60710()
{
  return static DialogPhase.completion.getter();
}

uint64_t sub_60720()
{
  return static DialogPhase.confirmation.getter();
}

uint64_t sub_60730()
{
  return static DialogPhase.summary.getter();
}

uint64_t sub_60740()
{
  return DialogPhase.aceValue.getter();
}

uint64_t sub_60750()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_60760()
{
  return type metadata accessor for ActivityType();
}

uint64_t sub_60770()
{
  return static DialogHelper.globals.getter();
}

uint64_t sub_60780()
{
  return PluginAction.flowHandlerId.getter();
}

uint64_t sub_60790()
{
  return PluginAction.actionParaphrase.getter();
}

uint64_t sub_607A0()
{
  return PluginAction.init(data:)();
}

uint64_t sub_607B0()
{
  return PluginAction.input.getter();
}

uint64_t sub_607C0()
{
  return PluginAction.loggingId.getter();
}

uint64_t sub_607D0()
{
  return type metadata accessor for PluginAction();
}

uint64_t sub_607E0()
{
  return RecentDialog.copy(withAddViews:)();
}

uint64_t sub_607F0()
{
  return RecentDialog.addViews.getter();
}

uint64_t sub_60800()
{
  return RecentDialog.requestId.getter();
}

uint64_t sub_60810()
{
  return static CasinoFactory.makeRichText(text:bold:maxLines:textColor:)();
}

uint64_t sub_60820()
{
  return static CasinoFactory.makeReferentialAbstractCommand(originalCommand:)();
}

uint64_t sub_60850()
{
  return TemplatingText.init(text:speakableTextOverride:)();
}

uint64_t sub_60860()
{
  return TemplatingText.text.getter();
}

uint64_t sub_60870()
{
  return type metadata accessor for TemplatingText();
}

uint64_t sub_60880()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_60890()
{
  return static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_608A0()
{
  return static AceOutputHelper.makeClarificationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_608B0()
{
  return static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_608C0()
{
  return static ExecuteResponse.ongoing(requireInput:)();
}

uint64_t sub_608D0()
{
  return static ExecuteResponse.complete<A>(next:)();
}

uint64_t sub_608E0()
{
  return static ExecuteResponse.complete(next:)();
}

uint64_t sub_608F0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_60900()
{
  return static ExecuteResponse.redirect(nextPluginAction:)();
}

uint64_t sub_60910()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_60920()
{
  return NLContextUpdate.restoreSessionForRequestId.setter();
}

uint64_t sub_60930()
{
  return NLContextUpdate.init()();
}

uint64_t sub_60940()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_60950()
{
  return ResponseFactory.init()();
}

uint64_t sub_60960()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_60970()
{
  return ActionParaphrase.VerbEntityParaphrase.userStatedTask.getter();
}

uint64_t sub_60980()
{
  return ActionParaphrase.VerbEntityParaphrase.label.getter();
}

uint64_t sub_60990()
{
  return ActionParaphrase.VerbEntityParaphrase.dialog.getter();
}

uint64_t sub_609A0()
{
  return type metadata accessor for ActionParaphrase.VerbEntityParaphrase();
}

uint64_t sub_609B0()
{
  return ActionParaphrase.verbEntityParaphrase.getter();
}

uint64_t sub_609C0()
{
  return ActionParaphrase.appBundleId.getter();
}

uint64_t sub_609D0()
{
  return type metadata accessor for ActionParaphrase();
}

uint64_t sub_609E0()
{
  return TemplatingResult.init(templateIdentifier:speak:print:behaviorAfterSpeaking:dialogIdentifier:meta:)();
}

uint64_t sub_609F0()
{
  return TemplatingResult.init(templateIdentifier:speak:print:behaviorAfterSpeaking:)();
}

uint64_t sub_60A00()
{
  return TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)();
}

BOOL sub_60A10(Swift::Bool defaultBehavior)
{
  return TemplatingResult.shouldListenAfterSpeaking(defaultBehavior:)(defaultBehavior);
}

uint64_t sub_60A20()
{
  return TemplatingResult.print.getter();
}

uint64_t sub_60A30()
{
  return TemplatingResult.sections.getter();
}

uint64_t sub_60A40()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_60A50()
{
  return TemplatingSection.init(id:content:caption:spokenOnly:)();
}

uint64_t sub_60A60()
{
  return TemplatingSection.content.getter();
}

uint64_t sub_60A70()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t sub_60A80()
{
  return AppShortcutProvider.init()();
}

uint64_t sub_60A90()
{
  return type metadata accessor for AppShortcutProvider();
}

uint64_t sub_60AE0()
{
  return AppShortcutInvocation.bundleId.getter();
}

uint64_t sub_60AF0()
{
  return type metadata accessor for AppShortcutInvocation();
}

uint64_t sub_60B00()
{
  return type metadata accessor for BehaviorAfterSpeaking();
}

uint64_t sub_60B10()
{
  return static SystemDialogActHelper.systemAskedUserToRepeat()();
}

uint64_t sub_60B30()
{
  return dispatch thunk of ConversationSELFHelper.emitDisambiguationFailed(errorCode:)();
}

uint64_t sub_60B40()
{
  return dispatch thunk of ConversationSELFHelper.emitDisambiguationDialogGenerated(actionIds:dialogType:)();
}

uint64_t sub_60B50()
{
  return dispatch thunk of ConversationSELFHelper.emitDisambiguationFollowupHandled(actionId:)();
}

uint64_t sub_60B60()
{
  return static ConversationSELFHelper.shared.getter();
}

uint64_t sub_60B70()
{
  return type metadata accessor for ConversationSELFHelper();
}

uint64_t sub_60B80()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_60B90()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t sub_60BA0()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t sub_60BB0()
{
  return OutputGenerationManifest.listenAfterSpeaking.setter();
}

uint64_t sub_60BC0()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_60BD0()
{
  return type metadata accessor for CAMDisambiguationDialogType();
}

uint64_t sub_60BE0()
{
  return UniversalActionFeatureFlags.isEnabled.getter();
}

uint64_t sub_60BF0()
{
  return type metadata accessor for UniversalActionFeatureFlags();
}

uint64_t sub_60C00()
{
  return static CamDirectInvocationIdentifiers.giveUpRepeat.getter();
}

uint64_t sub_60C10()
{
  return static CamDirectInvocationIdentifiers.disambiguateTopTwo.getter();
}

uint64_t sub_60C20()
{
  return static CamDirectInvocationIdentifiers.fallback.getter();
}

uint64_t sub_60C30()
{
  return static CamDirectInvocationIdentifiers.askRepeat.getter();
}

uint64_t sub_60C40()
{
  return static HandcraftedPluginManifestEntry.fromPluginBundleId(_:)();
}

uint64_t sub_60C50()
{
  return HandcraftedPluginManifestEntry.pluginBundleId.getter();
}

uint64_t sub_60C60()
{
  return HandcraftedPluginManifestEntry.associatedAppBundleId.getter();
}

uint64_t sub_60C70()
{
  return type metadata accessor for HandcraftedPluginManifestEntry();
}

uint64_t sub_60C80()
{
  return Input.parse.getter();
}

uint64_t sub_60C90()
{
  return type metadata accessor for Input();
}

uint64_t sub_60CA0()
{
  return Parse.hasRejected.getter();
}

uint64_t sub_60CB0()
{
  return Parse.hasThankYou.getter();
}

uint64_t sub_60CC0()
{
  return Parse.hasCancelled.getter();
}

uint64_t sub_60CD0()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_60CE0()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_60CF0()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_60D00()
{
  return Parse.hasDirectDismissal.getter();
}

uint64_t sub_60D10()
{
  return type metadata accessor for Parse();
}

uint64_t sub_60D20()
{
  return static Device.current.getter();
}

uint64_t sub_60D30()
{
  return USOParse.groupIndex.getter();
}

uint64_t sub_60D40()
{
  return USOParse.appBundleId.getter();
}

uint64_t sub_60D50()
{
  return USOParse.parserIdentifier.getter();
}

BOOL sub_60D60()
{
  return USOParse.isAppShortcutInvocation()();
}

uint64_t sub_60D70()
{
  return USOParse.extractAppShortcutInvocation(groupIndex:)();
}

uint64_t sub_60D90()
{
  return USOParse.userParse.getter();
}

uint64_t sub_60DA0()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_60DB0()
{
  return AceOutput.init(commands:flowActivity:nlContextUpdate:)();
}

uint64_t sub_60DC0()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_60DD0()
{
  return Siri_Nlu_External_UsoGraph.identifiers.getter();
}

uint64_t sub_60DE0()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_60DF0()
{
  return Siri_Nlu_External_UserParse.preferredUserDialogAct.getter();
}

uint64_t sub_60E00()
{
  return Siri_Nlu_External_UserParse.userDialogActs.getter();
}

uint64_t sub_60E10()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_60E20()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_60E30()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t sub_60E40()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_60E50()
{
  return Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
}

uint64_t sub_60E60()
{
  return Siri_Nlu_External_UserDialogAct.hasRejected.getter();
}

uint64_t sub_60E70()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
}

uint64_t sub_60E80()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
}

uint64_t sub_60E90()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t sub_60EA0()
{
  return Siri_Nlu_External_UserDialogAct.hasWantedToRepeat.getter();
}

uint64_t sub_60EB0()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_60EC0()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_60ED0()
{
  return Siri_Nlu_External_UserStatedTask.task.getter();
}

uint64_t sub_60EE0()
{
  return Siri_Nlu_External_UserStatedTask.task.setter();
}

uint64_t sub_60EF0()
{
  return Siri_Nlu_External_UserStatedTask.init()();
}

uint64_t sub_60F00()
{
  return type metadata accessor for Siri_Nlu_External_UserStatedTask();
}

uint64_t sub_60F10()
{
  return Siri_Nlu_External_SystemDialogAct.gaveOptions.setter();
}

uint64_t sub_60F20()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_60F30()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_60F40()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_60F50()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t sub_60F60()
{
  return Siri_Nlu_External_SystemGaveOptions.init()();
}

uint64_t sub_60F70()
{
  return type metadata accessor for Siri_Nlu_External_SystemGaveOptions();
}

uint64_t sub_60F80()
{
  return Siri_Nlu_External_UserWantedToProceed.reference.setter();
}

uint64_t sub_60F90()
{
  return Siri_Nlu_External_UserWantedToProceed.init()();
}

uint64_t sub_60FA0()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t sub_60FB0()
{
  return Siri_Nlu_External_UsoEntityIdentifier.value.getter();
}

uint64_t sub_60FC0()
{
  return Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
}

uint64_t sub_60FD0()
{
  return type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
}

uint64_t sub_60FE0()
{
  return static SiriNLUTypesPrintUtils.printableProtoObject(object:)();
}

uint64_t sub_60FF0()
{
  return type metadata accessor for SiriNLUTypesPrintUtils();
}

uint64_t sub_61000()
{
  return static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t sub_61010()
{
  return static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
}

uint64_t sub_61020()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t sub_61030()
{
  return dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter();
}

uint64_t sub_61040()
{
  return dispatch thunk of IntentNode.ontologyNodeName.getter();
}

uint64_t sub_61050()
{
  return dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)();
}

uint64_t sub_61060()
{
  return UsoIdentifier.init(value:appBundleId:namespace:)();
}

uint64_t sub_61070()
{
  return UsoIdentifier.value.getter();
}

uint64_t sub_61080()
{
  return UsoIdentifier.namespace.getter();
}

uint64_t sub_61090()
{
  return type metadata accessor for UsoIdentifier();
}

uint64_t sub_610A0()
{
  return type metadata accessor for TerminalElement.Value();
}

uint64_t sub_610B0()
{
  return TerminalElement.value.getter();
}

uint64_t sub_610C0()
{
  return type metadata accessor for TerminalElement();
}

uint64_t sub_610D0()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t sub_610E0()
{
  return UsoBuilderOptions.init(longhandDefinedValues:)();
}

uint64_t sub_610F0()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t sub_61100()
{
  return TerminalIntentNode.elements.getter();
}

uint64_t sub_61110()
{
  return type metadata accessor for TerminalIntentNode();
}

uint64_t sub_61120()
{
  return static UsoConversionUtils.convertGraphToTasks(graph:)();
}

uint64_t sub_61130()
{
  return NonTerminalIntentNode.childNodes.getter();
}

uint64_t sub_61140()
{
  return type metadata accessor for NonTerminalIntentNode();
}

uint64_t sub_61150()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_61160()
{
  return static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)();
}

uint64_t sub_61170()
{
  return dispatch thunk of UsoEntityBuilder_common_App.name.getter();
}

uint64_t sub_61180()
{
  return dispatch thunk of UsoEntityBuilder_common_App.setName(value:)();
}

uint64_t sub_61190()
{
  return UsoEntityBuilder_common_App.init()();
}

uint64_t sub_611A0()
{
  return type metadata accessor for UsoEntityBuilder_common_App();
}

uint64_t sub_611B0()
{
  return type metadata accessor for UsoTask_repeat_uso_NoEntity();
}

uint64_t sub_611C0()
{
  return dispatch thunk of UsoEntity_common_Interjection.definedValue.getter();
}

uint64_t sub_611D0()
{
  return type metadata accessor for UsoEntity_common_Interjection.DefinedValues();
}

uint64_t sub_611E0()
{
  return dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter();
}

uint64_t sub_611F0()
{
  return type metadata accessor for UsoEntity_common_ListPosition.DefinedValues();
}

uint64_t sub_61200()
{
  return type metadata accessor for UsoEntity_common_ListPosition();
}

uint64_t sub_61210()
{
  return UsoTaskBuilder_open_common_App.init()();
}

uint64_t sub_61220()
{
  return type metadata accessor for UsoTaskBuilder_open_common_App();
}

uint64_t sub_61230()
{
  return type metadata accessor for UsoTask_skipBackward_uso_NoEntity();
}

uint64_t sub_61240()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Reference.setReference(value:)();
}

uint64_t sub_61250()
{
  return type metadata accessor for UsoTask_noVerb_common_Interjection();
}

uint64_t sub_61260()
{
  return dispatch thunk of UsoEntityBuilder_common_VoiceCommand.setName(value:)();
}

uint64_t sub_61270()
{
  return UsoEntityBuilder_common_VoiceCommand.init()();
}

uint64_t sub_61280()
{
  return type metadata accessor for UsoEntityBuilder_common_VoiceCommand();
}

uint64_t sub_61290()
{
  return UsoTaskBuilder_execute_common_VoiceCommand.init()();
}

uint64_t sub_612A0()
{
  return type metadata accessor for UsoTaskBuilder_execute_common_VoiceCommand();
}

uint64_t sub_612B0()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceVoiceCommandPayload.setReference(value:)();
}

uint64_t sub_612C0()
{
  return UsoTask.verbString.getter();
}

uint64_t sub_612D0()
{
  return UsoTask.arguments.getter();
}

uint64_t sub_612E0()
{
  return NLIntent.rootNode.getter();
}

uint64_t sub_612F0()
{
  return type metadata accessor for NLIntent();
}

uint64_t sub_61300()
{
  return dispatch thunk of UsoValue.getAsPrimitiveValueString()();
}

uint64_t sub_61310()
{
  return dispatch thunk of UsoValue.getUsoIdentifiers()();
}

uint64_t sub_61320()
{
  return dispatch thunk of UsoValue.getAsEntity()();
}

uint64_t sub_61330()
{
  return UsoEntity.attributes.getter();
}

uint64_t sub_61340()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_61350()
{
  return SiriEnvironment.currentRequest.setter();
}

uint64_t sub_61360()
{
  return SiriEnvironment.currentDevice.getter();
}

uint64_t sub_61370()
{
  return static SiriEnvironment.forCurrentTask.getter();
}

uint64_t sub_61380()
{
  return SiriEnvironment.networkAvailability.getter();
}

uint64_t sub_61390()
{
  return static SiriEnvironment.default.getter();
}

uint64_t sub_613A0()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_613B0()
{
  return static SiriEnvironmentValue.subscript.getter();
}

uint64_t sub_613C0()
{
  return SiriEnvironmentValue.init(_:)();
}

uint64_t sub_613D0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t sub_613E0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_613F0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t sub_61400()
{
  return type metadata accessor for InputOrigin();
}

uint64_t sub_61410()
{
  return static ResponseMode.voiceForward.getter();
}

uint64_t sub_61420()
{
  return static ResponseMode.voiceOnly.getter();
}

uint64_t sub_61430()
{
  return type metadata accessor for ResponseMode();
}

uint64_t sub_61440()
{
  return dispatch thunk of CurrentDevice.preferencesLanguageCode.getter();
}

uint64_t sub_61450()
{
  return dispatch thunk of NetworkAvailability.isInAirplaneMode.getter();
}

uint64_t sub_61460()
{
  return type metadata accessor for NetworkAvailability.Status();
}

uint64_t sub_61470()
{
  return dispatch thunk of NetworkAvailability.status.getter();
}

uint64_t sub_61480()
{
  return static AutoBugCapture.ErrorContext.camGibberish.getter();
}

uint64_t sub_61490()
{
  return static AutoBugCapture.ErrorSubType.nl.getter();
}

uint64_t sub_614A0()
{
  return static AutoBugCapture.generateSnapshot(type:subType:context:)();
}

uint64_t sub_614B0()
{
  return static AutoBugCapture.ErrorType.sirikitRuntime.getter();
}

uint64_t sub_614C0()
{
  return type metadata accessor for ConversationService();
}

uint64_t sub_614D0()
{
  return ServerFallbackDisablingUtils.shouldDisableServerFallbackWithABDecision(isDomainDirected:topNlParse:serverFallbackReason:)();
}

uint64_t sub_614E0()
{
  return ServerFallbackDisablingUtils.init(selfEmitter:)();
}

uint64_t sub_614F0()
{
  return type metadata accessor for ServerFallbackDisablingUtils();
}

uint64_t sub_61500()
{
  return PommesError.rawValue.getter();
}

uint64_t sub_61510()
{
  return type metadata accessor for PommesError();
}

uint64_t sub_61520()
{
  return type metadata accessor for ServerFallbackReason();
}

uint64_t sub_61530()
{
  return RequestConjunctionInfo.requestCount.getter();
}

uint64_t sub_61540()
{
  return RequestConjunctionInfo.requestIndex.getter();
}

uint64_t sub_61550()
{
  return type metadata accessor for RequestConjunctionInfo();
}

uint64_t sub_61560()
{
  return CurrentRequest.inputOrigin.getter();
}

uint64_t sub_61570()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t sub_61580()
{
  return CurrentRequest.positionInSession.getter();
}

uint64_t sub_61590()
{
  return RequestPositionInSession.rawValue.getter();
}

uint64_t sub_615A0()
{
  return type metadata accessor for RequestPositionInSession();
}

uint64_t sub_615B0()
{
  return type metadata accessor for DisambiguateActionsIntent();
}

uint64_t sub_615C0()
{
  return Google_Protobuf_StringValue.value.getter();
}

uint64_t sub_615D0()
{
  return type metadata accessor for Google_Protobuf_StringValue();
}

uint64_t sub_615E0()
{
  return static Message.with(_:)();
}

uint64_t sub_615F0()
{
  return dispatch thunk of PommesResponse.experiences.getter();
}

uint64_t sub_61600()
{
  return GenericExperience.components.getter();
}

uint64_t sub_61610()
{
  return type metadata accessor for GenericExperience();
}

uint64_t sub_61620()
{
  return NLGVerbPhrase.init(dialog:)();
}

uint64_t sub_61630()
{
  return type metadata accessor for NLGVerbPhrase();
}

uint64_t sub_61640()
{
  return dispatch thunk of NLGDialogBuilder.text(_:)();
}

uint64_t sub_61650()
{
  return dispatch thunk of NLGDialogBuilder.build()();
}

uint64_t sub_61660()
{
  return NLGDialogBuilder.init()();
}

uint64_t sub_61670()
{
  return type metadata accessor for NLGDialogBuilder();
}

uint64_t sub_61680()
{
  return dispatch thunk of NLGDialogContent.text.getter();
}

uint64_t sub_61690()
{
  return dispatch thunk of NLGDialogGenerator.generate()();
}

uint64_t sub_616A0()
{
  return static NLGDialogGenerators.alternativeQuestion(between:and:)();
}

uint64_t sub_616B0()
{
  return dispatch thunk of NLGDialog.content.getter();
}

uint64_t sub_616C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_616D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_616E0()
{
  return Logger.init(_:)();
}

uint64_t sub_616F0()
{
  return type metadata accessor for CamParse();
}

uint64_t sub_61700()
{
  return CamUSOParse.init(userParse:parserIdentifier:appBundleId:groupIndex:)();
}

uint64_t sub_61710()
{
  return ActionCandidate.init(flowHandlerId:parse:affinityScore:loggingId:userData:)();
}

uint64_t sub_61720()
{
  return type metadata accessor for ActionCandidate();
}

uint64_t sub_61730()
{
  return static AmbiguousFirstRunHelper.recordAmbiguousFirstRunShown(bundleId:)();
}

uint64_t sub_61740()
{
  return DisambiguationSerialiser.indexOfSelectedAction(selected:)();
}

uint64_t sub_61750()
{
  return DisambiguationSerialiser.serialiseActionBundles()().value._countAndFlagsBits;
}

uint64_t sub_61760()
{
  return DisambiguationSerialiser.serialiseActionRepresentations()().value._countAndFlagsBits;
}

uint64_t sub_61770()
{
  return DisambiguationSerialiser.init(actions:)();
}

uint64_t sub_61780()
{
  return type metadata accessor for DisambiguationSerialiser();
}

NSDictionary sub_61790()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_617A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_617B0()
{
  return Dictionary.description.getter();
}

uint64_t sub_617C0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_617D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_617E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_617F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_61800()
{
  return String.init<A>(describing:)();
}

uint64_t sub_61810()
{
  return String.hash(into:)();
}

void sub_61820(Swift::String a1)
{
}

Swift::Int sub_61830()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_61840()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_61850()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_61860()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_61870()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_61880()
{
  return specialized Array._endMutation()();
}

uint64_t sub_61890()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_618A0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_618B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_618C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_618D0()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t sub_618F0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_61900()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_61910()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_61930()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_61940()
{
  return static SACardSnippet.makeFromCardSections(cardSections:shouldGenerateAceId:sashBundleId:referencedCommands:)();
}

uint64_t sub_61950()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_61960()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_61970()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_61980()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_61990()
{
  return SIRINLUSystemDialogAct.toNluSystemDialogAct()();
}

uint64_t sub_619A0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_619B0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_619C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_619D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_619E0()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_619F0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_61A00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_61A10()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_61A20(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_61A30()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_61A40()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_61A50()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_61A60()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_61A70(Swift::Int a1)
{
}

uint64_t sub_61A80()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_61A90()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_61AA0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_61AB0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_61AC0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_61AD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_61AF0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_61B00()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_61B10()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_61B20()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_61B30()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_61B40()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_61B50()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_61B60()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_61B70()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_61B80()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_61B90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_61BA0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_61BB0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_61BC0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_61BD0()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_61BE0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_61BF0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_61C00()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_61C10()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_61C20()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_61C30()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_61C40()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_61C50()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_61C60()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_61C70()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_61C80(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_61C90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_61CA0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_61CB0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_61CC0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_61CD0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_61CE0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_61CF0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_61D00()
{
  return Error._code.getter();
}

uint64_t sub_61D10()
{
  return Error._domain.getter();
}

uint64_t sub_61D20()
{
  return Error._userInfo.getter();
}

uint64_t sub_61D30()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_61D40()
{
  return Hasher.init(_seed:)();
}

void sub_61D50(Swift::UInt a1)
{
}

Swift::Int sub_61D60()
{
  return Hasher._finalize()();
}

uint64_t sub_61D70()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_61D80()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}