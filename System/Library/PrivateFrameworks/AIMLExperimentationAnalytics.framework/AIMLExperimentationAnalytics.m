uint64_t sub_2287AF8E0()
{
  uint64_t v0;
  uint64_t vars8;

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for Instrumentation()
{
  return self;
}

uint64_t sub_2287AF93C()
{
  uint64_t v0 = sub_2287BBD48();
  __swift_allocate_value_buffer(v0, qword_268264CC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268264CC0);
  return sub_2287BBD18();
}

uint64_t sub_2287AF98C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 112) = a4;
  *(void *)(v5 + 120) = v4;
  *(void *)(v5 + 96) = a2;
  *(void *)(v5 + 104) = a3;
  *(_DWORD *)(v5 + 128) = a1;
  return MEMORY[0x270FA2498](sub_2287AFA24, 0, 0);
}

uint64_t sub_2287AFA24()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = (void *)v0[12];
  uint64_t v3 = v0[13];
  unsigned int v22 = *((_DWORD *)v0 + 32);
  v0[11] = MEMORY[0x263F8EE78];
  id v21 = *(id *)(v2 + 16);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = v4;
  v5[4] = v3;
  v5[5] = v1;
  v20 = v0 + 11;
  v5[6] = v0 + 11;
  uint64_t v6 = swift_allocObject();
  v0[3] = 1107296256;
  *(void *)(v6 + 16) = sub_2287B1EBC;
  *(void *)(v6 + 24) = v5;
  v0[6] = sub_2287B1EDC;
  v0[7] = v6;
  v0[2] = MEMORY[0x263EF8330];
  v0[4] = sub_2287B0A58;
  v0[5] = &block_descriptor_6;
  uint64_t v7 = _Block_copy(v0 + 2);
  swift_retain();
  id v8 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  v0[2] = 0;
  unsigned int v9 = objc_msgSend(v21, sel_enumerateActiveExperimentsForEnvironment_error_block_, v22, v0 + 2, v7);
  _Block_release(v7);
  id v10 = (id)v0[2];
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v7)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v9)
  {
    if (qword_26ADC7B60 == -1)
    {
LABEL_4:
      uint64_t v11 = sub_2287BBD98();
      __swift_project_value_buffer(v11, (uint64_t)qword_26ADC7C40);
      v12 = sub_2287BBD88();
      os_log_type_t v13 = sub_2287BBF68();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)OUTLINED_FUNCTION_5();
        *(_DWORD *)v14 = 134217984;
        swift_beginAccess();
        if (*v20 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_2287BC098();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v15 = *(void *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        v0[2] = v15;
        sub_2287BBFF8();
        _os_log_impl(&dword_2287AE000, v12, v13, "%ld experiment/s with factor", v14, 0xCu);
        OUTLINED_FUNCTION_0();
      }

      swift_beginAccess();
      uint64_t v16 = v0[11];
      swift_release();
      v17 = (uint64_t (*)(uint64_t))v0[1];
      return v17(v16);
    }
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  sub_2287BBCE8();

  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_release();
  v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

void sub_2287AFE14(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, unint64_t a6, void *a7)
{
  sub_2287AFE8C(a1, a4, a5, a6);
  if (v9)
  {
    id v10 = a1;
    MEMORY[0x22A69CAD0]();
    sub_2287B1C98(*(void *)((*a7 & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_2287BBF28();
    sub_2287BBF08();
  }
}

void sub_2287AFE8C(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v112 = a3;
  uint64_t v113 = sub_2287BBD98();
  OUTLINED_FUNCTION_1();
  uint64_t v111 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v12 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v108 - v13;
  id v15 = objc_msgSend(a1, sel_namespaces);
  sub_2287B1D84();
  unint64_t v16 = sub_2287BBEF8();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_2287BC098();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_33;
  }
  id v18 = objc_msgSend(a1, sel_namespaces);
  unint64_t v19 = sub_2287BBEF8();

  if (!(v19 >> 62))
  {
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v100 = sub_2287BC098();
  swift_bridgeObjectRelease();
  if (!v100)
  {
LABEL_32:
    swift_bridgeObjectRelease();
LABEL_33:
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v113, (uint64_t)qword_26ADC7C40);
    id v101 = a1;
    v62 = sub_2287BBD88();
    os_log_type_t v102 = sub_2287BBF68();
    if (!os_log_type_enabled(v62, v102))
    {

      return;
    }
    v103 = (uint8_t *)OUTLINED_FUNCTION_5();
    v116[0] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v103 = 136315138;
    id v104 = objc_msgSend(v101, sel_experimentId);
    uint64_t v105 = sub_2287BBE68();
    unint64_t v107 = v106;

    uint64_t v114 = sub_2287B78E4(v105, v107, v116);
    sub_2287BBFF8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287AE000, v62, v102, "No namespaces for experiment %s", v103, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
LABEL_37:

    return;
  }
LABEL_6:
  sub_2287BBAD8(0, (v19 & 0xC000000000000001) == 0, v19);
  if ((v19 & 0xC000000000000001) != 0) {
    id v20 = (id)MEMORY[0x22A69CC40](0, v19);
  }
  else {
    id v20 = *(id *)(v19 + 32);
  }
  id v21 = v20;
  swift_bridgeObjectRelease();
  unsigned int v22 = *(void **)(v4 + 24);
  uint64_t v23 = (void *)sub_2287BBE58();
  id v24 = objc_msgSend(v21, sel_name);
  if (!v24)
  {
    sub_2287BBE68();
    id v24 = (id)sub_2287BBE58();
    swift_bridgeObjectRelease();
  }
  id v25 = objc_msgSend(v22, sel_levelForFactor_withNamespaceName_, v23, v24);

  if (!v25)
  {
    v58 = v21;
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v113, (uint64_t)qword_26ADC7C40);
    id v59 = a1;
    id v60 = v58;
    swift_bridgeObjectRetain_n();
    id v61 = v59;
    v62 = v60;
    v63 = sub_2287BBD88();
    os_log_type_t v64 = sub_2287BBF68();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = OUTLINED_FUNCTION_4();
      uint64_t v113 = swift_slowAlloc();
      v116[0] = v113;
      *(_DWORD *)uint64_t v65 = 136315650;
      id v66 = objc_msgSend(v61, sel_experimentId);
      uint64_t v67 = sub_2287BBE68();
      unint64_t v69 = v68;

      uint64_t v114 = sub_2287B78E4(v67, v69, v116);
      sub_2287BBFF8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2080;
      id v70 = [v62 name];
      uint64_t v71 = sub_2287BBE68();
      unint64_t v73 = v72;

      uint64_t v74 = sub_2287B78E4(v71, v73, v116);
      OUTLINED_FUNCTION_10(v74);

      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_2287B78E4((uint64_t)v112, a4, v116);
      OUTLINED_FUNCTION_10(v75);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2287AE000, v63, v64, "No TRILevel in experiment %s with namespace %s, for factor %s", (uint8_t *)v65, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      return;
    }

    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  sub_2287B1CC4(v25);
  if (v26)
  {
    id v112 = v21;
    uint64_t v27 = sub_2287BBE88();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    v116[0] = v27;
    v116[1] = v29;
    id v30 = objc_msgSend(a2, sel_UUIDString);
    sub_2287BBE68();

    uint64_t v31 = sub_2287BBE88();
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v114 = v31;
    uint64_t v115 = v33;
    sub_2287B1E28();
    LOBYTE(v31) = sub_2287BC018();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      uint64_t v76 = v113;
      uint64_t v77 = v111;
      if (qword_26ADC7B60 != -1) {
        swift_once();
      }
      uint64_t v78 = __swift_project_value_buffer(v76, (uint64_t)qword_26ADC7C40);
      (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v12, v78, v76);
      id v79 = a2;
      id v80 = a1;
      id v81 = v25;
      id v82 = v79;
      id v83 = v80;
      v14 = (char *)v81;
      sub_2287BBD88();
      os_log_type_t v84 = sub_2287BBF68();
      if (!OUTLINED_FUNCTION_9(v84))
      {

        (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v76);
        return;
      }
      int v109 = (int)v80;
      uint64_t v85 = OUTLINED_FUNCTION_4();
      uint64_t v108 = swift_slowAlloc();
      v116[0] = v108;
      *(_DWORD *)uint64_t v85 = 136315650;
      id v86 = objc_msgSend(v82, sel_UUIDString, v108);
      uint64_t v87 = sub_2287BBE68();
      unint64_t v89 = v88;

      uint64_t v90 = sub_2287B78E4(v87, v89, v116);
      OUTLINED_FUNCTION_3(v90);

      swift_bridgeObjectRelease();
      *(_WORD *)(v85 + 12) = 2080;
      id v91 = objc_msgSend(v83, sel_experimentId);
      uint64_t v92 = sub_2287BBE68();
      unint64_t v94 = v93;

      uint64_t v95 = sub_2287B78E4(v92, v94, v116);
      OUTLINED_FUNCTION_2(v95);

      swift_bridgeObjectRelease();
      *(_WORD *)(v85 + 22) = 2080;
      uint64_t v96 = sub_2287B1CC4(v14);
      if (v97)
      {
        uint64_t v98 = sub_2287B78E4(v96, v97, v116);
        OUTLINED_FUNCTION_2(v98);

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_8(&dword_2287AE000, v99, (os_log_type_t)v109, "No codePathID \"%s\" in experiment %s. TRILevel stringValue \"%s\"");
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();

        (*(void (**)(char *, uint64_t))(v111 + 8))(v12, v113);
        return;
      }
      goto LABEL_42;
    }
    uint64_t v34 = v113;
    uint64_t v35 = v111;
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v36 = __swift_project_value_buffer(v34, (uint64_t)qword_26ADC7C40);
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v14, v36, v34);
    id v37 = a2;
    id v38 = a1;
    id v39 = v25;
    id v40 = v37;
    id v41 = v38;
    v12 = (char *)v39;
    sub_2287BBD88();
    os_log_type_t v42 = sub_2287BBF68();
    if (!OUTLINED_FUNCTION_9(v42))
    {

      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v34);
      return;
    }
    int v109 = (int)v38;
    uint64_t v43 = OUTLINED_FUNCTION_4();
    uint64_t v108 = swift_slowAlloc();
    v116[0] = v108;
    *(_DWORD *)uint64_t v43 = 136315650;
    id v44 = objc_msgSend(v40, sel_UUIDString, v108);
    uint64_t v45 = sub_2287BBE68();
    unint64_t v47 = v46;

    uint64_t v48 = sub_2287B78E4(v45, v47, v116);
    OUTLINED_FUNCTION_3(v48);

    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    id v49 = objc_msgSend(v41, sel_experimentId);
    uint64_t v50 = sub_2287BBE68();
    unint64_t v52 = v51;

    uint64_t v53 = sub_2287B78E4(v50, v52, v116);
    OUTLINED_FUNCTION_2(v53);

    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 22) = 2080;
    uint64_t v54 = sub_2287B1CC4(v12);
    if (v55)
    {
      uint64_t v56 = sub_2287B78E4(v54, v55, v116);
      OUTLINED_FUNCTION_2(v56);

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_8(&dword_2287AE000, v57, (os_log_type_t)v109, "CodePathID \"%s\" in experiment %s. TRILevel stringValue \"%s\"");
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      (*(void (**)(char *, uint64_t))(v111 + 8))(v14, v113);
      return;
    }
  }
  else
  {
    __break(1u);
  }

  __break(1u);
LABEL_42:

  __break(1u);
}

void sub_2287B0A58(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_2287B0AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[14] = a5;
  v6[15] = v5;
  v6[12] = a3;
  v6[13] = a4;
  v6[11] = a2;
  uint64_t v7 = sub_2287BBD48();
  v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2287B0B7C, 0, 0);
}

uint64_t sub_2287B0B7C()
{
  v0[9] = MEMORY[0x263F8EE78];
  uint64_t v1 = v0 + 9;
  uint64_t v2 = *(void *)(v0[12] + 16);
  if (v2)
  {
    id v3 = *(void **)(v0[15] + 24);
    os_log_type_t v42 = (void (**)(uint64_t, uint64_t, uint64_t))(v0[17] + 16);
    uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    unint64_t v5 = 0x264849000uLL;
    uint64_t v48 = v3;
    while (1)
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      uint64_t v8 = (void *)sub_2287BBE58();
      uint64_t v9 = (void *)sub_2287BBE58();
      id v10 = objc_msgSend(v3, *(SEL *)(v5 + 1232), v8, v9);

      if (v10)
      {
        if (objc_msgSend(v10, sel_levelOneOfCase) == 11)
        {
          uint64_t result = sub_2287B1CC4(v10);
          if (!v12)
          {
            __break(1u);
            return result;
          }
          uint64_t v13 = (void *)v0[11];
          uint64_t v14 = sub_2287BBE88();
          uint64_t v16 = v15;
          swift_bridgeObjectRelease();
          v0[5] = v14;
          v0[6] = v16;
          id v17 = objc_msgSend(v13, sel_UUIDString);
          sub_2287BBE68();

          uint64_t v18 = sub_2287BBE88();
          uint64_t v20 = v19;
          swift_bridgeObjectRelease();
          v0[7] = v18;
          v0[8] = v20;
          sub_2287B1E28();
          LOBYTE(v18) = sub_2287BC018();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v18)
          {
            id v21 = (void *)sub_2287BBE58();
            id v3 = v48;
            id v22 = objc_msgSend(v48, sel_experimentIdentifiersWithNamespaceName_, v21);

            if (v22)
            {
              uint64_t v23 = (void *)sub_2287BBE58();
              unsigned int v47 = objc_msgSend(v48, sel_compatibilityVersionWithNamespaceName_, v23);

              if (qword_268264B30 != -1) {
                swift_once();
              }
              uint64_t v24 = v0[18];
              uint64_t v46 = v24;
              uint64_t v25 = v0[16];
              uint64_t v26 = __swift_project_value_buffer(v25, (uint64_t)qword_268264CC0);
              (*v42)(v24, v26, v25);
              id v27 = objc_msgSend(v22, sel_experimentId);
              uint64_t v28 = sub_2287BBE68();
              uint64_t v44 = v29;
              uint64_t v45 = v28;

              unsigned int v43 = objc_msgSend(v22, sel_deploymentId);
              id v30 = objc_msgSend(v22, sel_treatmentId);
              sub_2287BBE68();

              __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79C0);
              uint64_t v31 = swift_allocObject();
              *(_OWORD *)(v31 + 16) = xmmword_2287BC7A0;
              sub_2287B1D84();
              *(void *)(v31 + 32) = sub_2287B1150(v7, v6, v47);
              sub_2287BBF08();
              id v32 = objc_allocWithZone(MEMORY[0x263F80E38]);
              id v33 = sub_2287B1B68(2u, v46, v45, v44, v43);
              MEMORY[0x22A69CAD0]();
              if (*(void *)((v0[9] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[9] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2287BBF18();
              }
              sub_2287BBF28();
              sub_2287BBF08();

LABEL_16:
              id v3 = v48;
            }
            else
            {

              swift_bridgeObjectRelease();
            }
            unint64_t v5 = 0x264849000;
            goto LABEL_18;
          }

          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
LABEL_18:
      v4 += 2;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v0 + 9;
        break;
      }
    }
  }
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_2287BBD98();
  __swift_project_value_buffer(v34, (uint64_t)qword_26ADC7C40);
  unint64_t v35 = *v1;
  swift_bridgeObjectRetain_n();
  uint64_t v36 = sub_2287BBD88();
  os_log_type_t v37 = sub_2287BBF68();
  if (os_log_type_enabled(v36, v37))
  {
    id v38 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_DWORD *)id v38 = 134217984;
    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_2287BC098();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v39 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[10] = v39;
    sub_2287BBFF8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287AE000, v36, v37, "%ld experiment/s with factor", v38, 0xCu);
    OUTLINED_FUNCTION_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_beginAccess();
  uint64_t v40 = v0[9];
  swift_task_dealloc();
  id v41 = (uint64_t (*)(uint64_t))v0[1];
  return v41(v40);
}

id sub_2287B1150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v5 = (void *)sub_2287BBE58();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithName_compatibilityVersion_, v5, a3);

  return v6;
}

id sub_2287B11CC()
{
  uint64_t v1 = sub_2287BBD48();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + 24);
  OUTLINED_FUNCTION_7();
  uint64_t v8 = (void *)sub_2287BBE58();
  id v9 = objc_msgSend(v7, sel_experimentIdentifiersWithNamespaceName_, v8);

  if (v9)
  {
    uint64_t v10 = OUTLINED_FUNCTION_7();
    unint64_t v12 = sub_2287B1648(v10, v11);
    if ((v12 & 0x100000000) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC7A00);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2287BC7B0;
      *(void *)(inited + 32) = sub_2287BBE68();
      *(void *)(inited + 40) = v33;
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = 0xD000000000000023;
      *(void *)(inited + 56) = 0x80000002287BC970;
      uint64_t v34 = sub_2287BBE38();
      id v23 = objc_allocWithZone(MEMORY[0x263F087E8]);
      sub_2287B702C(0xD000000000000027, 0x80000002287BC940, -1, v34);
      swift_willThrow();
    }
    else
    {
      uint64_t v13 = v12;
      if (qword_268264B30 != -1) {
        swift_once();
      }
      uint64_t v14 = __swift_project_value_buffer(v1, (uint64_t)qword_268264CC0);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v1);
      id v15 = objc_msgSend(v9, sel_experimentId);
      uint64_t v16 = sub_2287BBE68();
      uint64_t v37 = v17;
      uint64_t v38 = v16;

      HIDWORD(v36) = objc_msgSend(v9, sel_deploymentId);
      id v18 = objc_msgSend(v9, sel_treatmentId);
      sub_2287BBE68();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79C0);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_2287BC7A0;
      sub_2287B1D84();
      swift_bridgeObjectRetain();
      uint64_t v20 = OUTLINED_FUNCTION_7();
      *(void *)(v19 + 32) = sub_2287B1150(v20, v21, v13);
      uint64_t v40 = v19;
      sub_2287BBF08();
      id v22 = objc_allocWithZone(MEMORY[0x263F80E38]);
      id v23 = sub_2287B1B68(2u, (uint64_t)v6, v38, v37, HIDWORD(v36));
    }
  }
  else
  {
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_2287BBD98();
    __swift_project_value_buffer(v24, (uint64_t)qword_26ADC7C40);
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_2287BBD88();
    os_log_type_t v26 = sub_2287BBF68();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v40 = v28;
      *(_DWORD *)id v27 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v29 = OUTLINED_FUNCTION_7();
      uint64_t v39 = sub_2287B78E4(v29, v30, v31);
      sub_2287BBFF8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2287AE000, v25, v26, "No active experiment for namespace %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69D140](v28, -1, -1);
      MEMORY[0x22A69D140](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v23;
}

unint64_t sub_2287B1648(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 24);
  id v6 = (void *)sub_2287BBE58();
  unsigned int v7 = objc_msgSend(v5, sel_compatibilityVersionWithNamespaceName_, v6);

  if (!v7)
  {
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2287BBD98();
    __swift_project_value_buffer(v8, (uint64_t)qword_26ADC7C40);
    swift_bridgeObjectRetain_n();
    id v9 = sub_2287BBD88();
    os_log_type_t v10 = sub_2287BBF78();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_5();
      uint64_t v13 = OUTLINED_FUNCTION_4();
      *(_DWORD *)unint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_2287B78E4(a1, a2, &v13);
      OUTLINED_FUNCTION_11();
      sub_2287BBFF8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2287AE000, v9, v10, "%s doesn't exist on the device.", v11, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v7 | ((unint64_t)(v7 == 0) << 32);
}

id sub_2287B1810(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 24);
  id v6 = (void *)sub_2287BBE58();
  id v7 = objc_msgSend(v5, sel_rolloutIdentifiersWithNamespaceName_, v6);

  if (v7)
  {
    sub_2287BBAFC(v7);
    uint64_t v9 = v8;
    swift_bridgeObjectRelease();
    if (v9) {
      return v7;
    }
  }
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2287BBD98();
  __swift_project_value_buffer(v10, (uint64_t)qword_26ADC7C40);
  swift_bridgeObjectRetain_n();
  unint64_t v11 = sub_2287BBD88();
  os_log_type_t v12 = sub_2287BBF78();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_5();
    uint64_t v15 = OUTLINED_FUNCTION_4();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_2287B78E4(a1, a2, &v15);
    OUTLINED_FUNCTION_11();
    sub_2287BBFF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2287AE000, v11, v12, "No active rollout exists for %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

id sub_2287B19E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void **)(v5 + 24);
  uint64_t v10 = (void *)sub_2287BBE58();
  v14[4] = a4;
  v14[5] = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2287B1AD0;
  v14[3] = &block_descriptor;
  unint64_t v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v9, sel_addUpdateHandlerForNamespaceName_queue_usingBlock_, v10, a3, v11);
  _Block_release(v11);

  return v12;
}

uint64_t sub_2287B1AD0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_2287B1B68(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v10 = (void *)sub_2287BBD08();
  unint64_t v11 = (void *)sub_2287BBE58();
  swift_bridgeObjectRelease();
  id v12 = (void *)sub_2287BBE58();
  swift_bridgeObjectRelease();
  sub_2287B1D84();
  uint64_t v13 = (void *)sub_2287BBEE8();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v6, sel_initWithType_date_experimentId_deploymentId_treatmentId_namespaces_, a1, v10, v11, a5, v12, v13);

  uint64_t v15 = sub_2287BBD48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a2, v15);
  return v14;
}

uint64_t sub_2287B1C98(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_2287BBF18();
  }
  return result;
}

uint64_t sub_2287B1CC4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_stringValue);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2287BBE68();

  return v3;
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

unint64_t sub_2287B1D84()
{
  unint64_t result = qword_268264CD8;
  if (!qword_268264CD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268264CD8);
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

unint64_t sub_2287B1E28()
{
  unint64_t result = qword_26ADC7A10;
  if (!qword_26ADC7A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ADC7A10);
  }
  return result;
}

uint64_t sub_2287B1E74()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_2287B1EBC(void *a1, uint64_t a2)
{
  sub_2287AFE14(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40), *(void **)(v2 + 48));
}

uint64_t sub_2287B1ECC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287B1EDC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x22A69D140);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_2287BBFF8();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_2287BBFF8();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  id v7 = *(NSObject **)(v5 - 144);
  _os_log_impl(a1, v7, a3, a4, v4, 0x20u);
}

BOOL OUTLINED_FUNCTION_9(os_log_type_t a1)
{
  *(void *)(v2 - 144) = v1;
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_2287BBFF8();
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTrigger(for:requestID:)()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B27D0;
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.cacheTrialExperiments(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v6 = swift_task_alloc();
  id v7 = (void *)OUTLINED_FUNCTION_2_0(v6);
  *id v7 = v8;
  v7[1] = sub_2287B27D0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTriggerFromCache(for:requestID:)()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B27D0;
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.cacheTrialExperimentIdentifiers(for:namespaces:)()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B27D0;
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.startRolloutUpdateTracking(for:)()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B27D0;
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.endRolloutUpdateTracking(for:)()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B27D0;
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTrigger(for:namespace:requestID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 56)
                                                                                     + **(int **)(a6 + 56));
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_2_0(v12);
  *uint64_t v13 = v14;
  v13[1] = sub_2287B26DC;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2287B26DC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void sub_2287B2820()
{
  qword_26ADC7C30 = 0x6874617065646F63;
  *(void *)algn_26ADC7C38 = 0xEB00000000736469;
}

id ExperimentationAnalyticsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ExperimentationAnalyticsManager.init()()
{
  sub_2287BBFA8();
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v2;
  uint64_t v15 = v1;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_19();
  uint64_t v5 = v4 - v3;
  sub_2287BBF98();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_19();
  sub_2287BBDC8();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_19();
  uint64_t v6 = MEMORY[0x263F8EE80];
  *(void *)&v0[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentsForCodePathID] = MEMORY[0x263F8EE80];
  *(void *)&v0[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace] = v6;
  uint64_t v7 = OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock;
  id v8 = objc_allocWithZone(MEMORY[0x263F08958]);
  uint64_t v9 = v0;
  *(void *)&v0[v7] = objc_msgSend(v8, sel_init);
  uint64_t v10 = OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock;
  *(void *)&v9[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  type metadata accessor for Instrumentation();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = objc_msgSend(self, sel_sharedStream);
  *(void *)&v9[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_instrumentation] = v11;
  type metadata accessor for Experimentation();
  swift_allocObject();
  *(void *)&v9[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation] = sub_2287B9F5C();
  id v12 = objc_msgSend(self, sel_standardUserDefaults);
  *(void *)&v9[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults] = v12;
  sub_2287B9CC0(0, (unint64_t *)&unk_26ADC7B78);
  sub_2287BBDB8();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_2287B92C8((unint64_t *)&unk_26ADC7BA0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC7B88);
  sub_2287B9310((unint64_t *)&unk_26ADC7B90, &qword_26ADC7B88);
  sub_2287BC028();
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v5, *MEMORY[0x263F8F130], v15);
  *(void *)&v9[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_queue] = sub_2287BBFB8();

  v16.receiver = v9;
  v16.super_class = (Class)type metadata accessor for ExperimentationAnalyticsManager();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_2287B2BF0()
{
  OUTLINED_FUNCTION_14();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[4] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2287B2C80;
  uint64_t v4 = OUTLINED_FUNCTION_31();
  return sub_2287B4404(v4);
}

uint64_t sub_2287B2C80()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *id v8 = v7;
  *(void *)(v5 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 48) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B2D8C()
{
  OUTLINED_FUNCTION_9_0();
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(char **)(v0 + 24);
  uint64_t v3 = *(void **)&v1[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock];
  uint64_t v4 = v1;
  id v5 = v2;
  swift_bridgeObjectRetain();
  sub_2287B2E34(v3, v4, v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12();
  return v6();
}

void sub_2287B2E34(void *a1, void *a2, void *a3)
{
  objc_msgSend(a1, sel_lock);
  swift_beginAccess();
  id v6 = a3;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_2287B8D28(v7, v6);
  swift_endAccess();

  objc_msgSend(a1, sel_unlock);
  swift_bridgeObjectRelease();
}

void sub_2287B2EFC(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend(a1, sel_lock);
  uint64_t v11 = (uint64_t *)&a2[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace];
  swift_beginAccess();
  uint64_t v12 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2287B3C3C(a3, a4, v12);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_2287B19E4(a3, a4, *(void *)&a2[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_queue], a5, a6);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v17 = swift_unknownObjectRetain();
    sub_2287B8DA8(v17, 1, a3, a4);
    swift_endAccess();
    goto LABEL_5;
  }
  if (!__OFADD__(v15, 1))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v16 = swift_unknownObjectRetain();
    sub_2287B8DA8(v16, v15 + 1, a3, a4);
    swift_endAccess();
LABEL_5:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_unlock);
    swift_release();
    swift_bridgeObjectRelease();

    return;
  }
  __break(1u);
}

void sub_2287B30BC(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
}

void *sub_2287B3148(void *a1, void *a2, void *a3)
{
  objc_msgSend(a1, sel_lock);
  sub_2287B3AC4((uint64_t)a2, a3, &v8);
  objc_msgSend(a1, sel_unlock);
  if (v3)
  {
  }
  else
  {

    a2 = v8;
  }
  return a2;
}

uint64_t sub_2287B3270(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2287B3334;
  return sub_2287B2BF0();
}

uint64_t sub_2287B3334()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_1();
  *id v5 = v4;
  id v6 = *(void **)(v1 + 24);
  uint64_t v7 = *(void **)(v1 + 16);
  *id v5 = *v2;
  swift_task_dealloc();

  if (v0)
  {
    uint64_t v8 = (void *)sub_2287BBCD8();

    uint64_t v9 = OUTLINED_FUNCTION_17();
    v10(v9);
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_16();
    v12(v11);
  }
  _Block_release(*(const void **)(v4 + 32));
  OUTLINED_FUNCTION_24();
  return v13();
}

uint64_t sub_2287B347C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268264E50);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2287BBF58();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_268264E60;
  v8[5] = v7;
  sub_2287B72C0((uint64_t)v5, (uint64_t)&unk_268264E70, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_2287B3580()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_15();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[4] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2287B361C;
  uint64_t v4 = OUTLINED_FUNCTION_20();
  return sub_2287B4684(v4, v5);
}

uint64_t sub_2287B361C()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v8 = v7;
  *(void *)(v5 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 48) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B37C0(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_2287BBEF8();
  id v7 = a1;
  a4;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[6] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2287B38A4;
  return sub_2287B3580();
}

uint64_t sub_2287B38A4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v5 = v4;
  uint64_t v6 = *(void **)(v1 + 24);
  id v7 = *(void **)(v1 + 16);
  *uint64_t v5 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v8 = (void *)sub_2287BBCD8();

    uint64_t v9 = OUTLINED_FUNCTION_17();
    v10(v9);
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_16();
    v12(v11);
  }
  _Block_release(*(const void **)(v4 + 32));
  OUTLINED_FUNCTION_24();
  return v13();
}

uint64_t sub_2287B3A10(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B3A28);
}

uint64_t sub_2287B3A28()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = sub_2287B3148(*(void **)(*(void *)(v0 + 24) + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock), *(id *)(v0 + 24), *(id *)(v0 + 16));
  uint64_t v2 = *(uint64_t (**)(void *))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2287B3AC4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentsForCodePathID);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16))
  {
    id v7 = a2;
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_2287B8958((uint64_t)v7);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(v6 + 56) + 8 * v8);
      swift_bridgeObjectRetain();

      uint64_t result = swift_bridgeObjectRelease();
      *a3 = v10;
      return result;
    }

    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC7A00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287BC7B0;
  *(void *)(inited + 32) = sub_2287BBE68();
  *(void *)(inited + 40) = v13;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD00000000000001CLL;
  *(void *)(inited + 56) = 0x80000002287BCF20;
  uint64_t v14 = sub_2287BBE38();
  id v15 = objc_allocWithZone(MEMORY[0x263F087E8]);
  sub_2287B702C(0xD000000000000027, 0x80000002287BC940, -1, v14);
  return swift_willThrow();
}

uint64_t sub_2287B3C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_2287B899C(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_2287B3C8C()
{
  OUTLINED_FUNCTION_14();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v1[5] = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2287B3D20;
  uint64_t v5 = OUTLINED_FUNCTION_31();
  return sub_2287B4404(v5);
}

uint64_t sub_2287B3D20()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *unint64_t v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 48) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B3E28()
{
  OUTLINED_FUNCTION_14();
  sub_2287B4908(*(void *)(v0 + 16), *(void *)(v0 + 48), *(void **)(v0 + 24));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12();
  return v1();
}

uint64_t sub_2287B3EB4(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_2287B3F88;
  return sub_2287B3C8C();
}

uint64_t sub_2287B3F88()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v5 = v4;
  uint64_t v6 = (void *)v1[4];
  uint64_t v7 = (void *)v1[3];
  id v8 = (void *)v1[2];
  *uint64_t v5 = *v2;
  swift_task_dealloc();

  if (v0)
  {
    id v9 = (void *)sub_2287BBCD8();

    uint64_t v10 = OUTLINED_FUNCTION_17();
    v11(v10);
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_16();
    v13(v12);
  }
  _Block_release(*(const void **)(v4 + 40));
  OUTLINED_FUNCTION_24();
  return v14();
}

uint64_t sub_2287B40F0()
{
  OUTLINED_FUNCTION_14();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v1[5] = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2287B4184;
  uint64_t v5 = OUTLINED_FUNCTION_31();
  return sub_2287B3A10(v5);
}

uint64_t sub_2287B4184()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *id v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 48) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B42AC(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_26();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = a1;
  id v13 = a3;
  id v14 = a4;
  id v15 = a1;
  return sub_2287B347C(a7, (uint64_t)v12);
}

uint64_t sub_2287B4330(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_2287B9CFC;
  return sub_2287B40F0();
}

uint64_t sub_2287B4404(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B441C);
}

uint64_t sub_2287B441C()
{
  OUTLINED_FUNCTION_10_0();
  if (qword_26ADC7A08 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26ADC7C30;
  uint64_t v2 = *(void *)algn_26ADC7C38;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2287B4508;
  uint64_t v4 = *(void *)(v0 + 16);
  return sub_2287AF98C(0, v4, v1, v2);
}

uint64_t sub_2287B4508()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *id v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 40) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B4610()
{
  OUTLINED_FUNCTION_14();
  unint64_t v1 = *(void *)(v0 + 40);
  type metadata accessor for Experimentation();
  sub_2287BAFBC(v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_27();
  return v3(v2);
}

uint64_t sub_2287B4684(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B46A0);
}

uint64_t sub_2287B46A0()
{
  OUTLINED_FUNCTION_10_0();
  if (qword_26ADC7A08 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26ADC7C30;
  uint64_t v2 = *(void *)algn_26ADC7C38;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2287B478C;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  return sub_2287B0AB4(0, v4, v5, v1, v2);
}

uint64_t sub_2287B478C()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_1();
  *id v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_8_0();
    return v9();
  }
  else
  {
    *(void *)(v5 + 48) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2287B4894()
{
  OUTLINED_FUNCTION_14();
  unint64_t v1 = *(void *)(v0 + 48);
  type metadata accessor for Experimentation();
  sub_2287BAFBC(v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_27();
  return v3(v2);
}

void sub_2287B4908(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v8 = a3;
    unint64_t v3 = OUTLINED_FUNCTION_20();
    sub_2287BA534(v3, v4, v5);
  }
  else
  {
    unint64_t v6 = OUTLINED_FUNCTION_20();
    sub_2287BA114(v6, v7);
  }
}

uint64_t sub_2287B4998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B49B8);
}

uint64_t sub_2287B49B8()
{
  id v1 = sub_2287B11CC();
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 80);
    uint64_t v3 = *(void *)(v0 + 56);
    type metadata accessor for Experimentation();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2287BC7A0;
    *(void *)(inited + 32) = v1;
    unint64_t v9 = inited;
    sub_2287BBF08();
    id v5 = v1;
    uint64_t v6 = sub_2287BAFBC(v9);
    swift_bridgeObjectRelease();
    sub_2287B4908(v3, v6, v2);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_12();
  return v7();
}

uint64_t sub_2287B4B8C(void *a1, int a2, void *a3, void *aBlock, void *a5)
{
  v5[3] = a3;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  uint64_t v9 = sub_2287BBE68();
  uint64_t v11 = v10;
  v5[6] = v10;
  id v12 = a1;
  id v13 = a3;
  a5;
  uint64_t v14 = (void *)swift_task_alloc();
  v5[7] = v14;
  void *v14 = v5;
  v14[1] = sub_2287B4C8C;
  return sub_2287B4998((uint64_t)v12, v9, v11, (uint64_t)a3);
}

uint64_t sub_2287B4C8C()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = v0;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = (void *)*v1;
  OUTLINED_FUNCTION_2_1();
  *id v5 = v4;
  uint64_t v6 = (void *)v3[4];
  uint64_t v7 = (void *)v3[3];
  id v8 = (void *)v3[2];
  *id v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = v3[5];
  if (v2)
  {
    uint64_t v10 = (void *)sub_2287BBCD8();

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(v3[5], 0);
  }
  _Block_release((const void *)v4[5]);
  OUTLINED_FUNCTION_8_0();
  return v11();
}

uint64_t sub_2287B4E50(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B4E6C);
}

uint64_t sub_2287B4E6C()
{
  uint64_t v14 = v0;
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2287BBD98();
  __swift_project_value_buffer(v1, (uint64_t)qword_26ADC7C40);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_2287BBD88();
  os_log_type_t v3 = sub_2287BBF68();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v0[3];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_2287B78E4(v6, v5, &v13);
    sub_2287BBFF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2287AE000, v2, v3, "Rollout update tracking for namespace: %s", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_2287B55C0(v0[3], v0[4]);
  sub_2287B50E8();
  id v8 = sub_2287BBD88();
  os_log_type_t v9 = sub_2287BBF68();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2287AE000, v8, v9, "Finished starting tracking for namespace", v10, 2u);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_12();
  return v11();
}

uint64_t sub_2287B50E8()
{
  OUTLINED_FUNCTION_15();
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v1 = OUTLINED_FUNCTION_20();
  sub_2287B5538(v1, v2, v3, v0);
  return swift_release();
}

void sub_2287B5168(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A69D1E0](v3);
  if (v4)
  {
    unint64_t v5 = v4;
    id v6 = objc_msgSend(a1, sel_namespaceName);
    uint64_t v7 = sub_2287BBE68();
    unint64_t v9 = v8;

    sub_2287B55C0(v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2287BBD98();
    __swift_project_value_buffer(v10, (uint64_t)qword_26ADC7C40);
    unint64_t v5 = sub_2287BBD88();
    os_log_type_t v11 = sub_2287BBF78();
    if (os_log_type_enabled(v5, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2287AE000, v5, v11, "ExperimentationAnalyticsManager object is not retained in memory of the process", v12, 2u);
      MEMORY[0x22A69D140](v12, -1, -1);
    }
  }
}

void sub_2287B5538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = *(void **)&v4[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock];
  uint64_t v10 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2287B2EFC(v9, v10, a1, a2, a3, a4);
}

void sub_2287B55C0(uint64_t a1, unint64_t a2)
{
  objc_msgSend(*(id *)(*(void *)(v2 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation) + 24), sel_refresh);
  uint64_t v6 = sub_2287B58F0(a1, a2);
  if (!v3)
  {
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      sub_2287B5B70(a1, a2, v6);
      if (v8)
      {
        sub_2287B5C34(a1, a2, v7);

        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_26ADC7B60 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_2287BBD98();
        OUTLINED_FUNCTION_23(v14, (uint64_t)qword_26ADC7C40);
        uint64_t v15 = sub_2287BBD88();
        os_log_type_t v16 = sub_2287BBF78();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          uint64_t v18 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315138;
          swift_bridgeObjectRetain();
          sub_2287B78E4(a1, a2, &v18);
          OUTLINED_FUNCTION_29();
          sub_2287BBFF8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2287AE000, v15, v16, "No update to %s", v17, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_0();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
    }
    else
    {
      if (qword_26ADC7B60 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_2287BBD98();
      OUTLINED_FUNCTION_23(v9, (uint64_t)qword_26ADC7C40);
      uint64_t v10 = sub_2287BBD88();
      os_log_type_t v11 = sub_2287BBF88();
      if (os_log_type_enabled(v10, v11))
      {
        swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        OUTLINED_FUNCTION_34(4.8149e-34);
        sub_2287B78E4(a1, a2, &v18);
        OUTLINED_FUNCTION_21();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_28(&dword_2287AE000, v12, v13, "No active rollout exists for %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
}

uint64_t sub_2287B58F0(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = sub_2287B1648(a1, a2);
  if ((v4 & 0x100000000) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC7A00);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2287BC7B0;
    *(void *)(inited + 32) = sub_2287BBE68();
    *(void *)(inited + 40) = v11;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD000000000000023;
    *(void *)(inited + 56) = 0x80000002287BC970;
    uint64_t v12 = sub_2287BBE38();
    id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
    sub_2287B702C(0xD000000000000027, 0x80000002287BC940, -1, v12);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = v4;
    id v6 = sub_2287B1810(a1, a2);
    if (v6)
    {
      uint64_t v7 = v6;
      type metadata accessor for Experimentation();
      uint64_t v8 = sub_2287BB124(a1, a2, v7, v5);

      return v8;
    }
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_2287BBD98();
    OUTLINED_FUNCTION_23(v14, (uint64_t)qword_26ADC7C40);
    uint64_t v15 = sub_2287BBD88();
    os_log_type_t v16 = sub_2287BBF88();
    if (os_log_type_enabled(v15, v16))
    {
      swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      OUTLINED_FUNCTION_34(4.8149e-34);
      sub_2287B78E4(a1, a2, &v19);
      OUTLINED_FUNCTION_21();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_28(&dword_2287AE000, v17, v18, "Couldn't find active rollout for namespace: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

uint64_t sub_2287B5B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2287B5FA4(a3);
  if (!v3)
  {
    uint64_t v4 = v5;
    uint64_t v7 = v6;
    uint64_t v8 = sub_2287B5D0C();
    if (v9)
    {
      if (v4 == v8 && v9 == v7)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        swift_bridgeObjectRelease();
        return 0;
      }
      char v11 = sub_2287BC0B8();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_10;
      }
    }
  }
  return v4;
}

void sub_2287B5C34(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79C0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2287BC7A0;
  *(void *)(v4 + 32) = a3;
  unint64_t v6 = v4;
  sub_2287BBF08();
  id v5 = a3;
  sub_2287BAAA8(v6);
  swift_bridgeObjectRelease();
  sub_2287B5F0C();
}

uint64_t sub_2287B5D0C()
{
  sub_2287B6578();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults);
  uint64_t v2 = (void *)sub_2287BBE58();
  id v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (v3)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_2287BBE68();
  }
  else
  {
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2287BBD98();
    __swift_project_value_buffer(v5, (uint64_t)qword_26ADC7C40);
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_2287BBD88();
    os_log_type_t v7 = sub_2287BBF78();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v9 = OUTLINED_FUNCTION_20();
      sub_2287B78E4(v9, v10, v11);
      sub_2287BBFF8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2287AE000, v6, v7, "Couldn't find %s key in UserDefaults", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v4;
}

void sub_2287B5F0C()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults);
  uint64_t v2 = (void *)sub_2287BBE58();
  OUTLINED_FUNCTION_20();
  sub_2287B6578();
  id v3 = (id)sub_2287BBE58();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setObject_forKey_, v2, v3);
}

uint64_t sub_2287B5FA4(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_2287BBE18();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_2287BBE08();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  os_log_type_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v54 = (char *)&v47 - v17;
  uint64_t v18 = self;
  uint64_t v56 = 0;
  id v19 = objc_msgSend(v18, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 0, &v56);
  uint64_t v20 = v56;
  if (v19)
  {
    uint64_t v51 = v1;
    *(void *)&long long v55 = v5;
    uint64_t v53 = sub_2287BBCF8();
    unint64_t v22 = v21;

    sub_2287B92C8(&qword_26ADC79A0, MEMORY[0x263F047F8]);
    sub_2287BBDF8();
    uint64_t v52 = v12;
    unint64_t v50 = v22;
    switch(v22 >> 62)
    {
      case 1uLL:
        uint64_t v31 = v53;
        if (v31 >> 32 < (int)v31) {
          goto LABEL_28;
        }
        uint64_t v48 = (int)v53;
        sub_2287B9218(v53, v22);
        uint64_t v32 = v51;
        sub_2287B9138(v48, v31 >> 32);
        uint64_t v51 = v32;
        sub_2287B9270(v31, v22);
        uint64_t v12 = v52;
        break;
      case 2uLL:
        uint64_t v27 = v53;
        uint64_t v28 = *(void *)(v53 + 16);
        uint64_t v47 = *(void *)(v53 + 24);
        uint64_t v48 = v28;
        sub_2287B9218(v53, v22);
        swift_retain();
        swift_retain();
        uint64_t v29 = v51;
        sub_2287B9138(v48, v47);
        uint64_t v51 = v29;
        if (v29)
        {
          swift_release();
          swift_release();
          __break(1u);
          JUMPOUT(0x2287B6568);
        }
        swift_release();
        swift_release();
        sub_2287B9270(v27, v22);
        break;
      case 3uLL:
        uint64_t v30 = v51;
        sub_2287B9354();
        uint64_t v51 = v30;
        uint64_t v25 = v53;
        goto LABEL_8;
      default:
        uint64_t v23 = v53;
        uint64_t v24 = v51;
        sub_2287B9354();
        uint64_t v51 = v24;
        uint64_t v25 = v23;
LABEL_8:
        sub_2287B9270(v25, v22);
        break;
    }
    uint64_t v33 = v54;
    sub_2287BBDE8();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v9, v3);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v33, v10);
    sub_2287B92C8((unint64_t *)&unk_26ADC79D8, MEMORY[0x263F045C0]);
    sub_2287BBEC8();
    unint64_t v35 = v56;
    unint64_t v34 = v57;
    uint64_t v36 = *((void *)v56 + 2);
    uint64_t v49 = v10;
    if (v57 != v36)
    {
      if (v57 < v36)
      {
        uint64_t v37 = (char *)MEMORY[0x263F8EE78];
        long long v55 = xmmword_2287BC7B0;
        while ((v34 & 0x8000000000000000) == 0)
        {
          if (v34 >= *((void *)v35 + 2)) {
            goto LABEL_26;
          }
          char v39 = v35[v34 + 32];
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC79B0);
          uint64_t v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = v55;
          *(void *)(v40 + 56) = MEMORY[0x263F8E778];
          *(void *)(v40 + 64) = MEMORY[0x263F8E7C0];
          *(unsigned char *)(v40 + 32) = v39;
          uint64_t v41 = sub_2287BBE78();
          uint64_t v43 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v37 = sub_2287B75C4(0, *((void *)v37 + 2) + 1, 1, (uint64_t)v37);
          }
          unint64_t v45 = *((void *)v37 + 2);
          unint64_t v44 = *((void *)v37 + 3);
          if (v45 >= v44 >> 1) {
            uint64_t v37 = sub_2287B75C4((char *)(v44 > 1), v45 + 1, 1, (uint64_t)v37);
          }
          ++v34;
          *((void *)v37 + 2) = v45 + 1;
          uint64_t v46 = &v37[16 * v45];
          *((void *)v46 + 4) = v41;
          *((void *)v46 + 5) = v43;
          if (v36 == v34) {
            goto LABEL_13;
          }
        }
        __break(1u);
LABEL_26:
        __break(1u);
      }
      __break(1u);
LABEL_28:
      __break(1u);
    }
    uint64_t v37 = (char *)MEMORY[0x263F8EE78];
LABEL_13:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v49);
    uint64_t v56 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79E8);
    sub_2287B9310(&qword_26ADC79F0, &qword_26ADC79E8);
    uint64_t v5 = sub_2287BBE48();
    sub_2287B9270(v53, v50);
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v26 = v20;
    sub_2287BBCE8();

    swift_willThrow();
  }
  return v5;
}

unint64_t sub_2287B6578()
{
  return 0xD000000000000029;
}

uint64_t sub_2287B65C4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2287B65E0);
}

uint64_t sub_2287B65E0()
{
  OUTLINED_FUNCTION_14();
  sub_2287B663C();
  OUTLINED_FUNCTION_12();
  return v0();
}

void sub_2287B663C()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = *(void **)&v1[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock];
  uint64_t v4 = v1;
  swift_bridgeObjectRetain();
  sub_2287B30BC(v3, v4, v2, v0);
}

void sub_2287B66A0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2287B3C3C(a2, a3, v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    BOOL v11 = __OFSUB__(v10, 1);
    uint64_t v12 = v10 - 1;
    if (!v11)
    {
      if (v12)
      {
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v13 = swift_unknownObjectRetain();
        sub_2287B8DA8(v13, v12, a2, a3);
        swift_endAccess();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        objc_msgSend(*(id *)(*(void *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation) + 24), sel_removeUpdateHandlerForToken_, v8);
        swift_beginAccess();
        sub_2287B8C14(a2, a3);
        swift_endAccess();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      return;
    }
    __break(1u);
  }
  else if (qword_26ADC7B60 == -1)
  {
    goto LABEL_6;
  }
  swift_once();
LABEL_6:
  uint64_t v14 = sub_2287BBD98();
  __swift_project_value_buffer(v14, (uint64_t)qword_26ADC7C40);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_2287BBD88();
  os_log_type_t v16 = sub_2287BBF78();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v19[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    v19[7] = sub_2287B78E4(a2, a3, v19);
    sub_2287BBFF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2287AE000, v15, v16, "%s is not being tracked", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69D140](v18, -1, -1);
    MEMORY[0x22A69D140](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id ExperimentationAnalyticsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperimentationAnalyticsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2287B6A5C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2287B9D08;
  return sub_2287B3C8C();
}

uint64_t sub_2287B6B04()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2287B9D08;
  return sub_2287B2BF0();
}

uint64_t sub_2287B6B9C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2287B9D08;
  return sub_2287B40F0();
}

uint64_t sub_2287B6C44()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2287B9D08;
  return sub_2287B3580();
}

uint64_t sub_2287B6CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2287B9D08;
  return sub_2287B4E50(a1, a2);
}

uint64_t sub_2287B6D94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2287B9D08;
  return sub_2287B65C4(a1, a2);
}

uint64_t sub_2287B6E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2287B6EFC;
  return sub_2287B4998(a1, a2, a3, a4);
}

uint64_t sub_2287B6EFC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
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

uint64_t type metadata accessor for ExperimentationAnalyticsManager()
{
  return self;
}

id sub_2287B702C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_2287BBE58();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_2287BBE28();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_2287B70DC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2287B70EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2287B7128(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2287B9D08;
  return v6();
}

uint64_t sub_2287B71F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2287B9D08;
  return v7();
}

uint64_t sub_2287B72C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287BBF58();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2287B9770(a1);
  }
  else
  {
    sub_2287BBF48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2287BBF38();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2287B7428(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2287B7504;
  return v6(a1);
}

uint64_t sub_2287B7504()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12();
  return v3();
}

char *sub_2287B75C4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_2287B77AC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2287B76B4(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_2287B76B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2287BC0A8();
  __break(1u);
  return result;
}

char *sub_2287B77AC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2287BC0A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

unsigned char **sub_2287B7840(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_2287B7850(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2287B7878(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2287B78E4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  OUTLINED_FUNCTION_29();
  sub_2287BBFF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2287B78E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2287B8274(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2287B9C24((uint64_t)v12, *a3);
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
      sub_2287B9C24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t method lookup function for ExperimentationAnalyticsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExperimentationAnalyticsManager);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.cacheTrialExperiments(for:)()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_18();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 200) + **(int **)(v0 + 200));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_2_0(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_2287B9D08;
  uint64_t v4 = OUTLINED_FUNCTION_31();
  return v6(v4);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.cacheTrialExperimentIdentifiers(for:namespaces:)()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_11_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTrigger(for:requestID:)()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_11_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTriggerFromCache(for:requestID:)()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_11_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTrigger(for:namespace:requestID:)()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_18();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 264) + **(int **)(v8 + 264));
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_2_0(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_2287B6EFC;
  return v13(v7, v5, v3, v1);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.startRolloutUpdateTracking(for:)()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_11_0();
  return v4(v3);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.endRolloutUpdateTracking(for:)()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_11_0();
  return v4(v3);
}

void *initializeBufferWithCopyOfBuffer for RolloutTrackingInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for RolloutTrackingInfo()
{
  return swift_unknownObjectRelease();
}

void *assignWithCopy for RolloutTrackingInfo(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RolloutTrackingInfo(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for RolloutTrackingInfo(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RolloutTrackingInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RolloutTrackingInfo()
{
  return &type metadata for RolloutTrackingInfo;
}

uint64_t sub_2287B8274(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2287B83CC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2287BC008();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2287B84A4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_2287BC058();
    if (!v8)
    {
      uint64_t result = sub_2287BC088();
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

void *sub_2287B83CC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2287BC0A8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2287B84A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2287B853C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2287B8718(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2287B8718((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2287B853C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_2287BBEB8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_2287B86B0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_2287BC038();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_2287BC0A8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2287BC088();
  __break(1u);
  return result;
}

void *sub_2287B86B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268264EC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2287B8718(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268264EC8);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2287B88C8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2287B87F0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2287B87F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2287BC0A8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2287B88C8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2287BC0A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_2287B8958(uint64_t a1)
{
  uint64_t v2 = sub_2287BBFC8();
  return sub_2287B8A14(a1, v2);
}

unint64_t sub_2287B899C(uint64_t a1, uint64_t a2)
{
  sub_2287BC0D8();
  sub_2287BBE98();
  uint64_t v4 = sub_2287BC0E8();
  return sub_2287B8B30(a1, a2, v4);
}

unint64_t sub_2287B8A14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_2287B9CC0(0, qword_26ADC7A38);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2287BBFD8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2287BBFD8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_2287B8B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2287BC0B8() & 1) == 0)
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
      while (!v14 && (sub_2287BC0B8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2287B8C14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2287B899C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC79C8);
  sub_2287BC068();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 16 * v6);
  sub_2287BC078();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2287B8D28(uint64_t a1, void *a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_2287B8E40(a1, a2);
  *uint64_t v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287B8DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_2287B8F68(a1, a2, a3, a4);
  *uint64_t v4 = v10;
  return swift_bridgeObjectRelease();
}

id sub_2287B8E40(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v5 = (void *)*v2;
  unint64_t v6 = sub_2287B8958((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v8 = v6;
  char v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_26ADC7A20);
  if ((sub_2287BC068() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v10 = sub_2287B8958((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_11:
    sub_2287B9CC0(0, qword_26ADC7A38);
    id result = (id)sub_2287BC0C8();
    __break(1u);
    return result;
  }
  unint64_t v8 = v10;
LABEL_5:
  uint64_t v12 = *v3;
  if (v9)
  {
    uint64_t v13 = v12[7];
    id result = (id)swift_bridgeObjectRelease();
    *(void *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_2287B90A8(v8, (uint64_t)a2, a1, v12);
    return a2;
  }
  return result;
}

uint64_t sub_2287B8F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_2287B899C(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC79C8);
  if ((sub_2287BC068() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_2287B899C(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_2287BC0C8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = (uint64_t *)(v17[7] + 16 * v13);
    uint64_t result = swift_unknownObjectRelease();
    *uint64_t v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_2287B90EC(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2287B90A8(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_2287B90EC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  char v7 = (void *)(a6[7] + 16 * result);
  *char v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_2287B9138(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2287BBCA8();
  if (!result || (uint64_t result = sub_2287BBCC8(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2287BBCB8();
      sub_2287BBE18();
      sub_2287B92C8(&qword_26ADC79A0, MEMORY[0x263F047F8]);
      return sub_2287BBDD8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2287B9218(uint64_t a1, unint64_t a2)
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

uint64_t sub_2287B9270(uint64_t a1, unint64_t a2)
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

uint64_t sub_2287B92C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2287B9310(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2287B9354()
{
  return sub_2287BBDD8();
}

uint64_t sub_2287B9480()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2287B94D8()
{
  OUTLINED_FUNCTION_9_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B6EFC;
  OUTLINED_FUNCTION_32();
  return v3();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2287B95B8()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_30();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return v4(v3);
}

uint64_t objectdestroy_30Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_26();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_2287B9690()
{
  OUTLINED_FUNCTION_9_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  OUTLINED_FUNCTION_32();
  return v3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_2287B9770(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268264E50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287B97D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287B9808()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2287B9D08;
  char v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268264E78 + dword_268264E78);
  return v7(v2, v3);
}

uint64_t sub_2287B98BC()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_30();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return v4(v3);
}

uint64_t sub_2287B995C()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_30();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return v4(v3);
}

uint64_t objectdestroy_46Tm()
{
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v1 = OUTLINED_FUNCTION_26();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_2287B9A44()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_30();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2287B9D08;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return v4(v3);
}

uint64_t sub_2287B9AE0()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2287B9B28()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2287B9D08;
  char v7 = (uint64_t (*)(void *, void *, void *))((char *)&dword_268264EB8 + dword_268264EB8);
  return v7(v1, v2, v3);
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

uint64_t sub_2287B9C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2287B9C80()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2287B9CB8(void *a1)
{
  sub_2287B5168(a1, v1);
}

uint64_t sub_2287B9CC0(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_2287BBFF8();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2287B9F5C()
{
  *(void *)(v0 + 16) = objc_msgSend(self, sel_defaultProvider);
  *(void *)(v0 + 24) = objc_msgSend(self, sel_clientWithIdentifier_, 0);
  return v0;
}

uint64_t sub_2287B9FC0()
{
  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_2287B9FE8()
{
  sub_2287B9FC0();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for Experimentation()
{
  return self;
}

uint64_t sub_2287BA040()
{
  uint64_t v0 = sub_2287BBD98();
  __swift_allocate_value_buffer(v0, qword_26ADC7C40);
  __swift_project_value_buffer(v0, (uint64_t)qword_26ADC7C40);
  sub_2287BA0D4();
  sub_2287BBFE8();
  return sub_2287BBDA8();
}

unint64_t sub_2287BA0D4()
{
  unint64_t result = qword_26ADC7B68;
  if (!qword_26ADC7B68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ADC7B68);
  }
  return result;
}

void sub_2287BA114(unint64_t a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC7B50);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287BBD78();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v38 - v15;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2287BC098();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBD8]), sel_init);
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = v17;
      sub_2287BADD4(a1, v19, &qword_268264EE8, 0x263F6DBC0, (SEL *)&selRef_setAllocations_);
    }
    id v20 = objc_msgSend(a2, sel_UUIDString);
    sub_2287BBE68();

    sub_2287BBD58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_1((uint64_t)v7);
    if (v21)
    {
      sub_2287BAE50((uint64_t)v7);
    }
    else
    {
      OUTLINED_FUNCTION_6_1();
      v22();
      if (v18)
      {
        sub_2287B9CC0(0, &qword_268264EE0);
        OUTLINED_FUNCTION_7_0();
        v23();
        id v24 = v18;
        id v25 = sub_2287BB324(v13);
        objc_msgSend(v24, sel_setCodepathId_, v25);
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v2);
    }
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF0]), sel_init);
    objc_msgSend(v26, sel_setExperimentTriggered_, v18);
    sub_2287BACE4((uint64_t)v26);
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2287BBD98();
    uint64_t v28 = OUTLINED_FUNCTION_5_1(v27, (uint64_t)qword_26ADC7C40);
    os_log_type_t v29 = sub_2287BBF68();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_2287AE000, v28, v29, "experimentTriggered event emitted", v30, 2u);
      MEMORY[0x22A69D140](v30, -1, -1);
    }
    else
    {
    }
    OUTLINED_FUNCTION_8_1();
    return;
  }
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_2287BBD98();
  char v39 = OUTLINED_FUNCTION_5_1(v32, (uint64_t)qword_26ADC7C40);
  os_log_type_t v33 = sub_2287BBF68();
  if (os_log_type_enabled(v39, v33))
  {
    unint64_t v34 = (_WORD *)OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_10_1(v34);
    OUTLINED_FUNCTION_3_2(&dword_2287AE000, v39, v35, "experimentTriggered event no emitted. Trial experiments empty.");
    OUTLINED_FUNCTION_1_2();
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_2287BA534(unint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v57 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC7B50);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v10 = v8 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v54 - v12;
  sub_2287BBD78();
  OUTLINED_FUNCTION_0_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_4_0();
  uint64_t v19 = v17 - v18;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  MEMORY[0x270FA5388](v21);
  id v24 = (char *)&v54 - v23;
  if (a1 >> 62)
  {
    uint64_t v55 = v22;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2287BC098();
    swift_bridgeObjectRelease();
    uint64_t v22 = v55;
    if (v47) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v54 = v19;
    uint64_t v55 = v22;
    uint64_t v56 = v3;
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBE0]), sel_init);
    id v26 = v25;
    if (v25)
    {
      id v27 = v25;
      sub_2287BADD4(a1, v27, &qword_268264EE8, 0x263F6DBC0, (SEL *)&selRef_setAllocations_);
    }
    id v28 = objc_msgSend(a2, sel_UUIDString);
    sub_2287BBE68();

    sub_2287BBD58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_1((uint64_t)v13);
    if (v29)
    {
      sub_2287BAE50((uint64_t)v13);
    }
    else
    {
      OUTLINED_FUNCTION_6_1();
      v30();
      if (v26)
      {
        sub_2287B9CC0(0, &qword_268264EE0);
        uint64_t v31 = v55;
        OUTLINED_FUNCTION_7_0();
        v32();
        id v33 = v26;
        id v34 = sub_2287BB324(v31);
        objc_msgSend(v33, sel_setCodepathId_, v34);
      }
      (*(void (**)(char *, uint64_t))(v15 + 8))(v24, v4);
    }
    id v35 = [v57 UUIDString];
    sub_2287BBE68();

    sub_2287BBD58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_1(v10);
    if (v29)
    {
      sub_2287BAE50(v10);
    }
    else
    {
      uint64_t v36 = v54;
      OUTLINED_FUNCTION_6_1();
      v37();
      if (v26)
      {
        sub_2287B9CC0(0, &qword_268264EE0);
        uint64_t v38 = v55;
        OUTLINED_FUNCTION_7_0();
        v39();
        id v40 = v26;
        id v41 = sub_2287BB324(v38);
        objc_msgSend(v40, sel_setRequestId_, v41);
      }
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v36, v4);
    }
    id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF0]), sel_init);
    objc_msgSend(v42, sel_setSiriRequestExperimentTriggered_, v26);
    sub_2287BACE4((uint64_t)v42);
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_2287BBD98();
    unint64_t v44 = OUTLINED_FUNCTION_5_1(v43, (uint64_t)qword_26ADC7C40);
    os_log_type_t v45 = sub_2287BBF68();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_2287AE000, v44, v45, "SiriRequestExperimentTriggered event emitted.", v46, 2u);
      MEMORY[0x22A69D140](v46, -1, -1);
    }
    else
    {
    }
    OUTLINED_FUNCTION_8_1();
    return;
  }
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v48 = sub_2287BBD98();
  uint64_t v57 = OUTLINED_FUNCTION_5_1(v48, (uint64_t)qword_26ADC7C40);
  os_log_type_t v49 = sub_2287BBF68();
  if (os_log_type_enabled(v57, v49))
  {
    unint64_t v50 = (_WORD *)OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_10_1(v50);
    OUTLINED_FUNCTION_3_2(&dword_2287AE000, v57, v51, "SiriRequestExperimentTriggered event no emitted. Trial experiments empty.");
    OUTLINED_FUNCTION_1_2();
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_2287BAAA8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2287BC098();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_11:
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2287BBD98();
    oslog = OUTLINED_FUNCTION_5_1(v9, (uint64_t)qword_26ADC7C40);
    os_log_type_t v10 = sub_2287BBF68();
    if (os_log_type_enabled(oslog, v10))
    {
      uint64_t v11 = (_WORD *)OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_10_1(v11);
      OUTLINED_FUNCTION_3_2(&dword_2287AE000, oslog, v12, "RolloutChangeSnapshot event not emitted. Trial rollouts empty.");
      OUTLINED_FUNCTION_1_2();
    }
    goto LABEL_15;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBE8]), sel_init);
  if (v2) {
    sub_2287BADD4(a1, v2, &qword_268264ED8, 0x263F6DBC8, (SEL *)&selRef_setRollouts_);
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF0]), sel_init);
  objc_msgSend(v3, sel_setRolloutChangeSnapshot_, v2);
  sub_2287BACE4((uint64_t)v3);
  if (qword_26ADC7B60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2287BBD98();
  oslog = OUTLINED_FUNCTION_5_1(v4, (uint64_t)qword_26ADC7C40);
  os_log_type_t v5 = sub_2287BBF68();
  if (!os_log_type_enabled(oslog, v5))
  {

    uint64_t v7 = v2;
    goto LABEL_16;
  }
  uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_2_2();
  *(_WORD *)uint64_t v6 = 0;
  _os_log_impl(&dword_2287AE000, oslog, v5, "RolloutChangeSnapshot event emitted", v6, 2u);
  MEMORY[0x22A69D140](v6, -1, -1);

LABEL_15:
  uint64_t v7 = oslog;
LABEL_16:
}

void sub_2287BACE4(uint64_t a1)
{
  if (a1)
  {
    id v3 = *(void **)(v1 + 16);
    objc_msgSend(v3, sel_emitMessage_, a1);
  }
  else
  {
    if (qword_26ADC7B60 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2287BBD98();
    oslog = OUTLINED_FUNCTION_5_1(v4, (uint64_t)qword_26ADC7C40);
    os_log_type_t v5 = sub_2287BBF88();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_10_1(v6);
      OUTLINED_FUNCTION_3_2(&dword_2287AE000, oslog, v7, "EXPSiriSchemaEXPSiriClientEvent nil");
      OUTLINED_FUNCTION_1_2();
    }
  }
}

void sub_2287BADD4(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_2287B9CC0(0, a3);
  id v7 = (id)sub_2287BBEE8();
  objc_msgSend(a2, *a5, v7);
}

uint64_t sub_2287BAE50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC7B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x22A69D140);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2287BBD88();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

_WORD *OUTLINED_FUNCTION_10_1(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_2287BAFBC(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2287BC098();
  if (!v2) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t result = type metadata accessor for Experimentation();
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x22A69CC40](i, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      sub_2287BB3C0(v5);
      if (v7)
      {
        id v8 = v7;
        MEMORY[0x22A69CAD0]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2287BBF18();
        }
        sub_2287BBF28();
        sub_2287BBF08();

        uint64_t v6 = v8;
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t sub_2287BB124(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBC8]), sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    id v11 = objc_msgSend(a3, sel_rolloutId);
    uint64_t v12 = sub_2287BBE68();
    uint64_t v14 = v13;

    sub_2287BBC3C(v12, v14, v10, (SEL *)&selRef_setRolloutId_);
    id v15 = v10;
    sub_2287BBAFC(a3);
    if (v16)
    {
      uint64_t v17 = (void *)sub_2287BBE58();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = 0;
    }
    objc_msgSend(v15, sel_setRampId_, v17);

    id v18 = v15;
    id v19 = objc_msgSend(a3, sel_deploymentId);
    if ((v19 & 0x80000000) != 0)
    {
      uint64_t result = sub_2287BC088();
      __break(1u);
      return result;
    }
    objc_msgSend(v18, sel_setDeploymentId_, v19);
  }
  type metadata accessor for Experimentation();
  id v20 = sub_2287BBA04(a1, a2, a3, a4);
  if (v20)
  {
    id v21 = v20;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ADC79C0);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_2287BC7A0;
      *(void *)(v22 + 32) = v21;
      uint64_t v24 = v22;
      sub_2287BBF08();
      sub_2287BBBB8(v24, v9);
    }
    else
    {
    }
  }
  return (uint64_t)v9;
}

id sub_2287BB324(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_2287BBD68();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_2287BBD78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_2287BB3C0(id a1)
{
  uint64_t v2 = sub_2287BBD48();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v60 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADC7B50);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2287BBD78();
  OUTLINED_FUNCTION_1();
  uint64_t v59 = v9;
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v58 - v13;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBC0]), sel_init);
  uint64_t v16 = v15;
  id v61 = a1;
  if (v15)
  {
    id v58 = v15;
    uint64_t v17 = v7;
    uint64_t v18 = v8;
    id v19 = v12;
    id v20 = v14;
    uint64_t v21 = v4;
    uint64_t v22 = v2;
    id v23 = objc_msgSend(v61, sel_experimentId);
    uint64_t v24 = sub_2287BBE68();
    uint64_t v26 = v25;

    uint64_t v2 = v22;
    uint64_t v4 = v21;
    uint64_t v14 = v20;
    uint64_t v12 = v19;
    uint64_t v8 = v18;
    id v7 = v17;
    uint64_t v27 = v24;
    id v28 = v58;
    sub_2287BBC3C(v27, v26, v58, (SEL *)&selRef_setExperimentId_);

    a1 = v61;
  }
  id v29 = objc_msgSend(a1, sel_treatmentId);
  sub_2287BBE68();

  sub_2287BBD58();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_2287BAE50((uint64_t)v7);
    id v30 = v61;
    uint64_t v31 = v16;
    if (!v16) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  uint64_t v32 = v59;
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v14, v7, v8);
  uint64_t v31 = v16;
  if (v16)
  {
    sub_2287B9CC0(0, &qword_268264EE0);
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v12, v14, v8);
    id v33 = v16;
    id v34 = sub_2287BB324((uint64_t)v12);
    objc_msgSend(v33, sel_setTreatmentId_, v34);
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v8);
  id v30 = v61;
  if (v16)
  {
LABEL_9:
    id v35 = v31;
    objc_msgSend(v35, sel_setDeploymentId_, (int)objc_msgSend(v30, sel_deploymentId));

    id v36 = v35;
    unsigned int v37 = objc_msgSend(v30, sel_type);
    if (v37 - 1 < 3) {
      uint64_t v38 = (v37 - 1) + 1;
    }
    else {
      uint64_t v38 = 0;
    }
    objc_msgSend(v36, sel_setAllocationStatus_, v38);
  }
LABEL_13:
  id v39 = objc_msgSend(v30, sel_namespaces);
  sub_2287B9CC0(0, &qword_268264CD8);
  unint64_t v40 = sub_2287BBEF8();

  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2287BC098();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v41 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v41)
  {
    id v42 = objc_msgSend(v30, sel_namespaces);
    unint64_t v43 = sub_2287BBEF8();

    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2287BC098();
      swift_bridgeObjectRelease();
      if (v52) {
        goto LABEL_18;
      }
    }
    else if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_18:
      if ((v43 & 0xC000000000000001) != 0) {
        goto LABEL_36;
      }
      if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      for (id i = *(id *)(v43 + 32); ; id i = (id)MEMORY[0x22A69CC40](0, v43))
      {
        id v45 = i;
        swift_bridgeObjectRelease();
        if (!v31)
        {
LABEL_31:

          return;
        }
        id v46 = v31;
        id v47 = objc_msgSend(v45, sel_name);
        uint64_t v48 = sub_2287BBE68();
        uint64_t v50 = v49;

        sub_2287BBC3C(v48, v50, v46, (SEL *)&selRef_setExperimentNamespace_);
        id v51 = v46;
        objc_msgSend(v51, sel_setCompatibilityVersion_, objc_msgSend(v45, sel_compatibilityVersion));

LABEL_27:
        id v45 = v31;
        id v53 = objc_msgSend(v30, sel_date);
        unint64_t v43 = (unint64_t)v60;
        sub_2287BBD38();

        sub_2287BBD28();
        double v55 = v54;
        uint64_t v56 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
        v4 += 8;
        v56(v43, v2);
        double v57 = v55 * 1000.0;
        if ((~COERCE__INT64(v55 * 1000.0) & 0x7FF0000000000000) == 0) {
          break;
        }
        if (v57 <= -1.0) {
          goto LABEL_34;
        }
        if (v57 < 1.84467441e19)
        {
          objc_msgSend(v45, sel_setLastUpdatedAtInMs_, (unint64_t)v57);
          goto LABEL_31;
        }
LABEL_35:
        __break(1u);
LABEL_36:
        ;
      }
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
  }
  if (v31) {
    goto LABEL_27;
  }
}

uint64_t sub_2287BB9F0(char a1)
{
  unsigned int v1 = (a1 - 1);
  if (v1 < 3) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

id sub_2287BBA04(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBD0]), sel_init);
  if (v8)
  {
    sub_2287BBB60(a1, a2, v8);
    id v9 = v8;
    id v10 = objc_msgSend(a3, sel_factorPackId);
    uint64_t v11 = sub_2287BBE68();
    uint64_t v13 = v12;

    sub_2287BBC3C(v11, v13, v9, (SEL *)&selRef_setFactorPackId_);
  }
  objc_msgSend(v8, sel_setCompatibilityVersion_, a4);
  return v8;
}

unint64_t sub_2287BBAD8(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2287BBAFC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_rampId);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2287BBE68();

  return v3;
}

void sub_2287BBB60(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2287BBE58();
  objc_msgSend(a3, sel_setName_, v4);
}

void sub_2287BBBB8(uint64_t a1, void *a2)
{
  sub_2287B9CC0(0, &qword_26ADC79F8);
  id v3 = (id)sub_2287BBEE8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setNamespaces_, v3);
}

void sub_2287BBC3C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_2287BBE58();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_2287BBCA8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2287BBCB8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2287BBCC8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2287BBCD8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2287BBCE8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2287BBCF8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2287BBD08()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2287BBD18()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_2287BBD28()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2287BBD38()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2287BBD48()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2287BBD58()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2287BBD68()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2287BBD78()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2287BBD88()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2287BBD98()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2287BBDA8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2287BBDB8()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_2287BBDC8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2287BBDD8()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_2287BBDE8()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2287BBDF8()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2287BBE08()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2287BBE18()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2287BBE28()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2287BBE38()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2287BBE48()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2287BBE58()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2287BBE68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2287BBE78()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2287BBE88()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2287BBE98()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2287BBEA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2287BBEB8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2287BBEC8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2287BBED8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2287BBEE8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2287BBEF8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2287BBF08()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2287BBF18()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2287BBF28()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2287BBF38()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2287BBF48()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2287BBF58()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2287BBF68()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2287BBF78()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2287BBF88()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2287BBF98()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2287BBFA8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2287BBFB8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2287BBFC8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2287BBFD8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2287BBFE8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2287BBFF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2287BC008()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2287BC018()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2287BC028()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2287BC038()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2287BC048()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2287BC058()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2287BC068()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2287BC078()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2287BC088()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2287BC098()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2287BC0A8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2287BC0B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2287BC0C8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2287BC0D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2287BC0E8()
{
  return MEMORY[0x270F9FC90]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}