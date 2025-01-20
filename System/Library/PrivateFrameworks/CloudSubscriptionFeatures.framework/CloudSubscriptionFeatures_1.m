uint64_t dispatch thunk of FollowUp.hasSentCFU.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of FollowUp.hasSentCFU.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of FollowUp.hasSentADMCFU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of FollowUp.hasSentADMCFU.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of FollowUp.hasSentADMCFU.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of FollowUp.allData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:)(uint64_t a1, uint64_t a2)
{
  v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 360) + **(int **)(*(void *)v2 + 360));
  v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1A8D32838;
  return v8(a1, a2);
}

uint64_t sub_1A8D30DD0()
{
  if (MEMORY[0x1E4FBC8F0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E98E8);
  }
  else {
    return MEMORY[0x1E4FBC848] + 8;
  }
}

unsigned char *storeEnumTagSinglePayload for FollowUp.IneligibilityReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 6;
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
        JUMPOUT(0x1A8D30EC4);
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
          *result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FollowUp.IneligibilityReason()
{
  return &type metadata for FollowUp.IneligibilityReason;
}

unsigned char *storeEnumTagSinglePayload for FollowUp.Feature(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 1;
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
        JUMPOUT(0x1A8D30FC8);
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
          *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FollowUp.Feature()
{
  return &type metadata for FollowUp.Feature;
}

uint64_t sub_1A8D31000(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FollowUpConfig();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1A8D3105C()
{
  unint64_t result = qword_1EB5E98A0;
  if (!qword_1EB5E98A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E98A0);
  }
  return result;
}

uint64_t sub_1A8D310B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A8D310F8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1E979F750 + dword_1E979F750);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *int v3 = v1;
  v3[1] = sub_1A8D311A4;
  return v5(a1);
}

uint64_t sub_1A8D311A4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A8D312A4, 0, 0);
}

uint64_t sub_1A8D312A4()
{
  v19 = v0;
  uint64_t v1 = *(void *)(v0[4] + 16);
  if (v1)
  {
    if (qword_1EB5E97F0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1A8D59A80();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EB5E97D0);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1A8D59A60();
    os_log_type_t v4 = sub_1A8D59EE0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = v1;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v6 = v18;
      *(_DWORD *)uint64_t v5 = 136315138;
      sub_1A8D3105C();
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1A8D59E80();
      unint64_t v9 = v8;
      swift_bridgeObjectRelease();
      v0[2] = sub_1A8C90120(v7, v9, &v18);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v3, v4, "User is ineligible for GM CFU with reasons: %s", v5, 0xCu);
      swift_arrayDestroy();
      uint64_t v10 = v6;
      uint64_t v1 = v17;
      MEMORY[0x1AD0E6EB0](v10, -1, -1);
      v11 = v5;
LABEL_10:
      MEMORY[0x1AD0E6EB0](v11, -1, -1);
      goto LABEL_12;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_1EB5E97F0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1A8D59A80();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EB5E97D0);
    uint64_t v3 = sub_1A8D59A60();
    os_log_type_t v13 = sub_1A8D59F00();
    if (os_log_type_enabled(v3, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A8C7F000, v3, v13, "User is eligible for CFU.", v14, 2u);
      v11 = v14;
      goto LABEL_10;
    }
  }
LABEL_12:

  v15 = (uint64_t (*)(BOOL))v0[1];
  return v15(v1 == 0);
}

uint64_t sub_1A8D31580(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1A8D31594()
{
  if (MEMORY[0x1E4F63D48]) {
    BOOL v0 = MEMORY[0x1E4F63D58] == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || MEMORY[0x1E4F63D50] == 0)
  {
    if (qword_1EB5E97F0 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_1A8D59A80();
    __swift_project_value_buffer(v44, (uint64_t)qword_1EB5E97D0);
    v45 = sub_1A8D59A60();
    os_log_type_t v46 = sub_1A8D59EE0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      uint64_t v128 = v48;
      *(_DWORD *)v47 = 136315138;
      uint64_t v127 = sub_1A8C90120(0xD00000000000001FLL, 0x80000001A8D66E40, &v128);
      sub_1A8D59FE0();
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v48, -1, -1);
      MEMORY[0x1AD0E6EB0](v47, -1, -1);
    }

    return 0;
  }
  if (qword_1EB5E97F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A8D59A80();
  uint64_t v122 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB5E97D0);
  uint64_t v3 = sub_1A8D59A60();
  os_log_type_t v4 = sub_1A8D59F00();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A8C7F000, v3, v4, "Determining if Siri assets are finished downloading.", v5, 2u);
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
  }

  uint64_t v6 = sub_1A8D59880();
  v123 = &v110;
  uint64_t v126 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v126 + 64);
  MEMORY[0x1F4188790](v6, v8);
  unint64_t v125 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v9 = (char *)&v110 - v125;
  uint64_t v10 = sub_1A8D598D0();
  v124 = (char *)&v110;
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  v14 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1A8D598A0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15, v17);
  v19 = (char *)&v110 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D59890();
  sub_1A8D598C0();
  uint64_t v20 = v19;
  v21 = v9;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  uint64_t v22 = v126;
  sub_1A8D598B0();
  uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  MEMORY[0x1F4188790](v23, v24);
  v25 = (char *)&v110 - v125;
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))((char *)&v110 - v125, v9, v6);
  int v26 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v25, v6);
  if (MEMORY[0x1E4F63C38] && v26 == *MEMORY[0x1E4F63C38])
  {
    v121 = &v110;
    v124 = v9;
    unint64_t v125 = v6;
    (*(void (**)(char *, uint64_t))(v22 + 96))(v25, v6);
    uint64_t v27 = sub_1A8D59840();
    v120 = &v110;
    uint64_t v28 = *(void *)(v27 - 8);
    MEMORY[0x1F4188790](v27, v29);
    v31 = (char *)&v110 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v31, v25, v27);
    uint64_t v32 = sub_1A8D59830();
    uint64_t v33 = sub_1A8D59820();
    uint64_t v34 = *(void *)(v33 - 8);
    MEMORY[0x1F4188790](v33, v35);
    v37 = (char *)&v110 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v34 + 104))(v37, *MEMORY[0x1E4F63C58], v33);
    char v38 = sub_1A8CB88E0((uint64_t)v37, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
    if (v38)
    {
      uint64_t v39 = v28;
      v40 = sub_1A8D59A60();
      os_log_type_t v41 = sub_1A8D59F00();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_1A8C7F000, v40, v41, "GenerativeModels are restricted and Siri assets are not finished downloading. Returning false.", v42, 2u);
        MEMORY[0x1AD0E6EB0](v42, -1, -1);
      }

      v43 = *(void (**)(char *, uint64_t))(v39 + 8);
      v43(v31, v27);
      (*(void (**)(char *, unint64_t))(v126 + 8))(v124, v125);
      v43(v25, v27);
      return 0;
    }
    v78 = *(void (**)(char *, uint64_t))(v28 + 8);
    v78(v31, v27);
    v79 = sub_1A8D59A60();
    os_log_type_t v80 = sub_1A8D59F00();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v81 = 0;
      _os_log_impl(&dword_1A8C7F000, v79, v80, "GenerativeModels are restricted but Siri assets are finished downloading. Returning true.", v81, 2u);
      MEMORY[0x1AD0E6EB0](v81, -1, -1);
    }

    (*(void (**)(char *, unint64_t))(v126 + 8))(v124, v125);
    v78(v25, v27);
  }
  else if (MEMORY[0x1E4F63C50] && v26 == *MEMORY[0x1E4F63C50])
  {
    v121 = &v110;
    v124 = v9;
    unint64_t v125 = v6;
    (*(void (**)(char *, uint64_t))(v22 + 96))(v25, v6);
    uint64_t v49 = sub_1A8D59870();
    v117 = (void (*)(char *, uint64_t))&v110;
    uint64_t v50 = *(void *)(v49 - 8);
    MEMORY[0x1F4188790](v49, v51);
    unint64_t v114 = (v52 + 15) & 0xFFFFFFFFFFFFFFF0;
    v53 = (char *)&v110 - v114;
    uint64_t v119 = v54;
    v120 = (void (**)(char *, uint64_t))v50;
    v115 = *(void (**)(char *, char *))(v50 + 16);
    uint64_t v116 = v52;
    v115((char *)&v110 - v114, v25);
    uint64_t v55 = sub_1A8D59860();
    uint64_t v56 = sub_1A8D59850();
    v118 = &v110;
    uint64_t v57 = *(void *)(v56 - 8);
    MEMORY[0x1F4188790](v56, v58);
    uint64_t v113 = v59;
    unint64_t v111 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
    v60 = (char *)&v110 - v111;
    uint64_t v61 = *MEMORY[0x1E4F63CC8];
    v112 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 104);
    v112((char *)&v110 - v111, v61, v56);
    char v62 = sub_1A8CB8AA8((uint64_t)v60, v55);
    swift_bridgeObjectRelease();
    v63 = *(void (**)(char *, uint64_t))(v57 + 8);
    v63(v60, v56);
    if (v62)
    {
      v64 = v53;
      uint64_t v66 = v119;
      v65 = v120;
      v67 = sub_1A8D59A60();
      os_log_type_t v68 = sub_1A8D59F00();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_1A8C7F000, v67, v68, "GenerativeModels are unavailable and Siri assets are not finished downloading. Returning false.", v69, 2u);
        MEMORY[0x1AD0E6EB0](v69, -1, -1);
      }

      v70 = v65[1];
      v70(v64, v66);
      (*(void (**)(char *, unint64_t))(v22 + 8))(v124, v125);
      v70(v25, v66);
      return 0;
    }
    v82 = v120[1];
    v83 = v53;
    uint64_t v84 = v119;
    ++v120;
    v110 = v82;
    uint64_t v85 = ((uint64_t (*)(char *, uint64_t))v82)(v83, v119);
    v118 = &v110;
    MEMORY[0x1F4188790](v85, v86);
    v117 = v63;
    v87 = (char *)&v110 - v114;
    ((void (*)(char *, char *, uint64_t))v115)((char *)&v110 - v114, v25, v84);
    uint64_t v88 = sub_1A8D59860();
    MEMORY[0x1F4188790](v88, v89);
    v90 = (char *)&v110 - v111;
    v112((char *)&v110 - v111, *MEMORY[0x1E4F63CE8], v56);
    char v91 = sub_1A8CB8AA8((uint64_t)v90, v88);
    swift_bridgeObjectRelease();
    v117(v90, v56);
    if (v91)
    {
      v92 = v87;
      v93 = v110;
      uint64_t v94 = v119;
      v95 = sub_1A8D59A60();
      os_log_type_t v96 = sub_1A8D59F00();
      BOOL v97 = os_log_type_enabled(v95, v96);
      v99 = v124;
      unint64_t v98 = v125;
      if (v97)
      {
        v100 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1A8C7F000, v95, v96, "GenerativeModels are unavailable and Siri asset status is unknown. Returning false.", v100, 2u);
        MEMORY[0x1AD0E6EB0](v100, -1, -1);
      }

      v93(v92, v94);
      (*(void (**)(char *, unint64_t))(v22 + 8))(v99, v98);
      v93(v25, v94);
      return 0;
    }
    uint64_t v102 = v119;
    v103 = v110;
    v110(v87, v119);
    v104 = sub_1A8D59A60();
    os_log_type_t v105 = sub_1A8D59F00();
    BOOL v106 = os_log_type_enabled(v104, v105);
    v108 = v124;
    unint64_t v107 = v125;
    if (v106)
    {
      v109 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v109 = 0;
      _os_log_impl(&dword_1A8C7F000, v104, v105, "GenerativeModels are unavailable but Siri assets are finished downloading. Returning true.", v109, 2u);
      MEMORY[0x1AD0E6EB0](v109, -1, -1);
    }

    (*(void (**)(char *, unint64_t))(v22 + 8))(v108, v107);
    v103(v25, v102);
  }
  else
  {
    if (!MEMORY[0x1E4F63D30] || v26 != *MEMORY[0x1E4F63D30])
    {
      v74 = sub_1A8D59A60();
      os_log_type_t v75 = sub_1A8D59EE0();
      if (os_log_type_enabled(v74, v75))
      {
        v76 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_1A8C7F000, v74, v75, "Unknown availabilty case when determining if Siri assets are downloaded.", v76, 2u);
        MEMORY[0x1AD0E6EB0](v76, -1, -1);
      }

      v77 = *(void (**)(char *, uint64_t))(v22 + 8);
      v77(v21, v6);
      v77(v25, v6);
      return 0;
    }
    v71 = sub_1A8D59A60();
    os_log_type_t v72 = sub_1A8D59F00();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_1A8C7F000, v71, v72, "GenerativeModels are full available, Siri assets are finished downloading. Returning true", v73, 2u);
      MEMORY[0x1AD0E6EB0](v73, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v6);
  }
  return 1;
}

uint64_t sub_1A8D32458()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A8D59E10();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1A8C8DE74((uint64_t)v3, &qword_1EB5EAEA0);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    sub_1A8D59E00();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (*(void *)(v6 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v7 = sub_1A8D59DC0();
      uint64_t v8 = v9;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &unk_1E979F7E0;
  *(void *)(v10 + 24) = v6;
  if (v8 | v7)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v7;
    v12[3] = v8;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1A8D32684()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A8D326BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A8C81994;
  return MEMORY[0x1F4188298](sub_1A8D2BBC4, 0, 0);
}

uint64_t sub_1A8D32760()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A8D32798()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A8D327D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAD60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1A8D3283C()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1EB5E9270 = (uint64_t)v2;
}

uint64_t sub_1A8D328AC()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    sub_1A8D59BF0();
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F88]), sel_init);
  id v5 = objc_msgSend(v4, sel_processName);

  uint64_t v6 = sub_1A8D59BF0();
  uint64_t v8 = v7;

  if (v3)
  {
    sub_1A8D59C50();
    swift_bridgeObjectRelease();
  }
  char has_internal_ui = os_variant_has_internal_ui();
  swift_unknownObjectRelease();
  if ((has_internal_ui & 1) == 0 || v6 == 0x747365746378 && v8 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v10 = 0;
  }
  else
  {
    char v11 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    char v10 = v11 ^ 1;
  }
  return v10 & 1;
}

id sub_1A8D32A34()
{
  if ((sub_1A8D328AC() & 1) == 0) {
    return 0;
  }
  if (qword_1EB5E9280 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1EB5E9270;
  if (!qword_1EB5E9270) {
    return 0;
  }
  id v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_dictionaryForKey_, v1);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1A8D59B30();

  if (!*(void *)(v3 + 16)
    || (unint64_t v4 = sub_1A8C90B9C(0x737574617473, 0xE600000000000000), (v5 & 1) == 0)
    || (sub_1A8C901F4(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v19), (swift_dynamicCast() & 1) == 0)
    || (id v6 = objc_allocWithZone((Class)type metadata accessor for TicketStatus()),
        (id v7 = TicketStatus.init(rawValue:)(v17, v18)) == 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v8 = v7;
  if (*(void *)(v3 + 16) && (unint64_t v9 = sub_1A8C90B9C(0x4965727574616566, 0xEA00000000007344), (v10 & 1) != 0))
  {
    sub_1A8C901F4(*(void *)(v3 + 56) + 32 * v9, (uint64_t)&v19);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v20 + 1))
  {

    sub_1A8C8DE74((uint64_t)&v19, (uint64_t *)&unk_1EB5EA170);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9DB0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  uint64_t v12 = v17;
  uint64_t v13 = (objc_class *)type metadata accessor for WaitlistResult();
  v14 = (char *)objc_allocWithZone(v13);
  uint64_t v15 = &v14[OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_ticket];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  *(void *)&v14[OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_status] = v8;
  *(void *)&v14[OBJC_IVAR____TtC25CloudSubscriptionFeatures14WaitlistResult_featureIDs] = v12;
  v16.receiver = v14;
  v16.super_class = v13;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_1A8D32CAC(uint64_t a1, uint64_t a2)
{
  if (qword_1EB5E9280 != -1) {
    swift_once();
  }
  unint64_t v4 = (void *)qword_1EB5E9270;
  if (!qword_1EB5E9270
    || (char v5 = (void *)sub_1A8D59BC0(),
        id v6 = objc_msgSend(v4, sel_dictionaryForKey_, v5),
        v5,
        !v6))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    goto LABEL_18;
  }
  uint64_t v7 = sub_1A8D59B30();

  if (!*(void *)(v7 + 16))
  {
    long long v18 = 0u;
    long long v19 = 0u;
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A8C90B9C(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  sub_1A8C901F4(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1)) {
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F7F8);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (!*(void *)(rawValue + 16)
    || (unint64_t v10 = sub_1A8C90B9C(0xD000000000000012, 0x80000001A8D66E60), (v11 & 1) == 0)
    || (sub_1A8C901F4(*(void *)(rawValue + 56) + 32 * v10, (uint64_t)&v18), (swift_dynamicCast() & 1) == 0))
  {
    if (*(void *)(rawValue + 16) && (unint64_t v14 = sub_1A8C90B9C(0xD000000000000013, 0x80000001A8D66E80), (v15 & 1) != 0))
    {
      sub_1A8C901F4(*(void *)(rawValue + 56) + 32 * v14, (uint64_t)&v18);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v19 + 1))
    {
      if (swift_dynamicCast())
      {
        ServerError.init(rawValue:)(rawValue);
        char v12 = v18;
        if (v18 != 7)
        {
          sub_1A8CB25F8();
          goto LABEL_28;
        }
      }
      return 0;
    }
LABEL_18:
    sub_1A8C8DE74((uint64_t)&v18, (uint64_t *)&unk_1EB5EA170);
    return 0;
  }
  swift_bridgeObjectRelease();
  LocalError.init(rawValue:)(rawValue);
  char v12 = v18;
  if (v18 == 17) {
    return 0;
  }
  sub_1A8C8C7B0();
LABEL_28:
  uint64_t result = swift_allocError();
  *objc_super v16 = v12;
  return result;
}

uint64_t sub_1A8D32F98(uint64_t a1, uint64_t a2)
{
  if (qword_1EB5E9280 != -1) {
    swift_once();
  }
  unint64_t v4 = (void *)qword_1EB5E9270;
  if (!qword_1EB5E9270
    || (char v5 = (void *)sub_1A8D59BC0(),
        id v6 = objc_msgSend(v4, sel_dictionaryForKey_, v5),
        v5,
        !v6))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    goto LABEL_15;
  }
  uint64_t v7 = sub_1A8D59B30();

  if (!*(void *)(v7 + 16))
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A8C90B9C(a1, a2);
  if ((v9 & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_1A8C901F4(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_15:
    sub_1A8C8DE74((uint64_t)&v12, (uint64_t *)&unk_1EB5EA170);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F7F8);
  if (swift_dynamicCast()) {
    return v11;
  }
  else {
    return 0;
  }
}

id sub_1A8D33150(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A8D32F98(a1, a2);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (qword_1E979E468 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A8D59A80();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1E979F048);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v8 = sub_1A8D59A60();
  os_log_type_t v9 = sub_1A8D59F00();
  uint64_t v68 = a1;
  unint64_t v69 = a2;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v64 = v7;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(void *)&long long v72 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    swift_bridgeObjectRetain();
    sub_1A8C90120(a1, a2, (uint64_t *)&v72);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1A8D59B40();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    uint64_t v70 = sub_1A8C90120(v12, v14, (uint64_t *)&v72);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A8C7F000, v8, v9, "Found mocked feature response for %{public}s: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v11, -1, -1);
    uint64_t v15 = v10;
    uint64_t v7 = v64;
    MEMORY[0x1AD0E6EB0](v15, -1, -1);

    if (!*(void *)(v5 + 16))
    {
LABEL_12:
      uint64_t v19 = 0;
      int v18 = 1;
      if (*(void *)(v5 + 16)) {
        goto LABEL_13;
      }
LABEL_16:
      uint64_t v61 = 0;
      uint64_t v62 = v19;
      int v63 = v18;
      uint64_t v65 = 0;
      goto LABEL_17;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (!*(void *)(v5 + 16)) {
      goto LABEL_12;
    }
  }
  unint64_t v16 = sub_1A8C90B9C(0x65756C6176, 0xE500000000000000);
  if ((v17 & 1) == 0) {
    goto LABEL_12;
  }
  sub_1A8C901F4(*(void *)(v5 + 56) + 32 * v16, (uint64_t)&v72);
  if (!swift_dynamicCast())
  {
LABEL_34:
    swift_bridgeObjectRelease();
    return 0;
  }
  int v18 = 0;
  uint64_t v19 = v70;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_16;
  }
LABEL_13:
  unint64_t v20 = sub_1A8C90B9C(0x6F54737365636361, 0xEB000000006E656BLL);
  if ((v21 & 1) == 0) {
    goto LABEL_16;
  }
  sub_1A8C901F4(*(void *)(v5 + 56) + 32 * v20, (uint64_t)&v72);
  if (!swift_dynamicCast()) {
    goto LABEL_34;
  }
  int v63 = v18;
  uint64_t v61 = v70;
  uint64_t v62 = v19;
  uint64_t v65 = v71;
LABEL_17:
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v66 = &v58;
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x1F4188790](v22, v25);
  unint64_t v26 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v67 = (uint64_t)&v58 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E98E0);
  uint64_t v29 = MEMORY[0x1F4188790](v27 - 8, v28);
  v31 = (char *)&v58 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29, v32);
  uint64_t v33 = (char *)&v58 - v26;
  if (!*(void *)(v5 + 16) || (v60 = &v58, unint64_t v34 = sub_1A8C90B9C(7107700, 0xE300000000000000), (v35 & 1) == 0))
  {
    uint64_t v41 = sub_1A8D596F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v31, 1, 1, v41);
    goto LABEL_23;
  }
  uint64_t v64 = v7;
  sub_1A8C901F4(*(void *)(v5 + 56) + 32 * v34, (uint64_t)&v72);
  uint64_t v36 = sub_1A8D596F0();
  int v37 = swift_dynamicCast();
  uint64_t v38 = *(void *)(v36 - 8);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
  if (!v37)
  {
    v39((char *)&v58 - v26, 1, 1, v36);
    goto LABEL_42;
  }
  uint64_t v40 = *(void *)(v36 - 8);
  uint64_t v59 = *(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56);
  v39(v33, 0, 1, v36);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v33, 1, v36) == 1)
  {
LABEL_42:
    sub_1A8C8DE74((uint64_t)v33, &qword_1EB5EACF0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v31, 1, 1, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A8C8DE74((uint64_t)v31, &qword_1EB5E98E0);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v31, v33, v36);
  v59(v31, 0, 1, v36);
LABEL_23:
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v31, 0, 1, v22);
  uint64_t v42 = v67;
  sub_1A8C921A0((uint64_t)v31, v67);
  if (!*(void *)(v5 + 16)
    || (unint64_t v43 = sub_1A8C90B9C(0x6573556E6163, 0xE600000000000000), (v44 & 1) == 0)
    || (sub_1A8C901F4(*(void *)(v5 + 56) + 32 * v43, (uint64_t)&v72), (swift_dynamicCast() & 1) == 0))
  {
    if (*(void *)(v5 + 16) && (unint64_t v48 = sub_1A8C90B9C(0x737574617473, 0xE600000000000000), (v49 & 1) != 0))
    {
      sub_1A8C901F4(*(void *)(v5 + 56) + 32 * v48, (uint64_t)&v72);
    }
    else
    {
      long long v72 = 0u;
      long long v73 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v73 + 1))
    {
      uint64_t v45 = swift_dynamicCast();
      if (v45)
      {
        char v47 = v70 != 2;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v45 = sub_1A8C8DE74((uint64_t)&v72, (uint64_t *)&unk_1EB5EA170);
    }
    char v47 = 0;
    goto LABEL_37;
  }
  uint64_t v45 = swift_bridgeObjectRelease();
  char v47 = v70;
LABEL_37:
  MEMORY[0x1F4188790](v45, v46);
  sub_1A8C8D028(v42, (uint64_t)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_allocWithZone((Class)type metadata accessor for CloudFeature());
  uint64_t v50 = v69;
  swift_bridgeObjectRetain();
  id v51 = sub_1A8CB79B4(v68, v50, v47, v62, v63, v61, v65, (uint64_t)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v52 = sub_1A8D59A60();
  os_log_type_t v53 = sub_1A8D59F00();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 138543362;
    *(void *)&long long v72 = v51;
    id v56 = v51;
    uint64_t v42 = v67;
    sub_1A8D59FE0();
    *uint64_t v55 = v51;

    _os_log_impl(&dword_1A8C7F000, v52, v53, "Found mocked feature: %{public}@", v54, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAED0);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v55, -1, -1);
    MEMORY[0x1AD0E6EB0](v54, -1, -1);
  }
  else
  {
  }
  sub_1A8C8DE74(v42, &qword_1EB5EACF0);
  return v51;
}

uint64_t sub_1A8D33AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[32] = a4;
  v5[33] = v4;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  v5[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D33B3C, v4, 0);
}

uint64_t sub_1A8D33B3C()
{
  uint64_t v60 = v0;
  id v1 = (_OWORD *)(v0 + 96);
  uint64_t v57 = *(void *)(v0 + 264) + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v57;
  if (!*(void *)(*(void *)v57 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *id v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_1A8C8DE74(v0 + 96, &qword_1EB5EAD10);
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1A8C90B9C(v3, v4);
  if (v6)
  {
    sub_1A8C91CA8(*(void *)(v2 + 56) + 40 * v5, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *id v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_1A8C91C90((long long *)(v0 + 96), v0 + 56);
  sub_1A8C91CA8(v0 + 56, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EA280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9658);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *(void *)(v0 + 216);
    *(void *)(v0 + 280) = v7;
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    swift_bridgeObjectRetain_n();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v56 = *(void *)(v0 + 232);
      uint64_t v58 = v7;
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v59[0] = v14;
      *(_DWORD *)unint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 224) = sub_1A8C90120(v56, v12, v59);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v9, v10, "TaskLimiter: reusing existing task for identifier %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
      uint64_t v15 = v13;
      uint64_t v7 = v58;
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v54;
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9630);
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
    *uint64_t v54 = v0;
    v54[1] = sub_1A8D34424;
    uint64_t v51 = MEMORY[0x1E4FBC0F0];
    uint64_t v52 = v0 + 208;
    uint64_t v53 = v7;
    goto LABEL_26;
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
LABEL_14:
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1A8D59A80();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
  swift_bridgeObjectRetain_n();
  char v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59ED0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v19)
  {
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v59[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_1A8C90120(v21, v20, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v23, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v27 = sub_1A8D59E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v26;
  v28[5] = v25;
  swift_retain();
  uint64_t v29 = sub_1A8D4BB14(v24, (uint64_t)&unk_1E979F8F0, (uint64_t)v28);
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1A8D59A60();
  os_log_type_t v31 = sub_1A8D59ED0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = *(void *)(v0 + 240);
  if (v32)
  {
    uint64_t v34 = *(void *)(v0 + 232);
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v59[0] = v36;
    *(_DWORD *)char v35 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_1A8C90120(v34, v33, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v30, v31, "TaskLimiter: storing task for identifier %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = *(void *)(v0 + 232);
  uint64_t v37 = *(void *)(v0 + 240);
  v59[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9658);
  v59[4] = (uint64_t)&off_1EFF55138;
  v59[0] = v29;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A8C916F8((uint64_t)v59, v38, v37);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A8D59A60();
  os_log_type_t v40 = sub_1A8D59ED0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 240);
  if (v41)
  {
    uint64_t v43 = v29;
    uint64_t v44 = *(void *)(v0 + 232);
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v59[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v29 = v43;
    *(void *)(v0 + 184) = sub_1A8C90120(v47, v42, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v39, v40, "TaskLimiter: performing task operation for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v46, -1, -1);
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v48;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9630);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  *unint64_t v48 = v0;
  v48[1] = sub_1A8D34550;
  uint64_t v51 = MEMORY[0x1E4FBC0F0];
  uint64_t v52 = v0 + 208;
  uint64_t v53 = v29;
LABEL_26:
  return MEMORY[0x1F4187D90](v52, v53, v49, v50, v51);
}

uint64_t sub_1A8D34424()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v4 = sub_1A8D3FD48;
  }
  else {
    uint64_t v4 = sub_1A8D3FD4C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D34550()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v4 = sub_1A8D3FD3C;
  }
  else {
    uint64_t v4 = sub_1A8D3FD54;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D3467C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 288) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  if (v0) {
    uint64_t v4 = sub_1A8D34828;
  }
  else {
    uint64_t v4 = sub_1A8D347A8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D347A8()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  uint64_t v1 = *(unsigned __int8 *)(v0 + 320);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1A8D34828()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1A8D348A4()
{
  uint64_t v2 = *(void *)(v0 + 224);
  unint64_t v1 = *(void *)(v0 + 232);
  swift_release();
  sub_1A8C91500(v2, v1);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 320);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_1A8D34938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[32] = a4;
  v5[33] = v4;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  v5[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D349D4, v4, 0);
}

uint64_t sub_1A8D349D4()
{
  uint64_t v60 = v0;
  unint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v57 = *(void *)(v0 + 264) + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v57;
  if (!*(void *)(*(void *)v57 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_1A8C8DE74(v0 + 96, &qword_1EB5EAD10);
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1A8C90B9C(v3, v4);
  if (v6)
  {
    sub_1A8C91CA8(*(void *)(v2 + 56) + 40 * v5, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_1A8C91C90((long long *)(v0 + 96), v0 + 56);
  sub_1A8C91CA8(v0 + 56, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EA280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F9A0);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *(void *)(v0 + 216);
    *(void *)(v0 + 280) = v7;
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    swift_bridgeObjectRetain_n();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v56 = *(void *)(v0 + 232);
      uint64_t v58 = v7;
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v59[0] = v14;
      *(_DWORD *)unint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 224) = sub_1A8C90120(v56, v12, v59);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v9, v10, "TaskLimiter: reusing existing task for identifier %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
      uint64_t v15 = v13;
      uint64_t v7 = v58;
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v54;
    uint64_t v49 = type metadata accessor for GeoClassificationInfo();
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
    *uint64_t v54 = v0;
    v54[1] = sub_1A8D34424;
    uint64_t v51 = MEMORY[0x1E4FBC0F0];
    uint64_t v52 = v0 + 208;
    uint64_t v53 = v7;
    goto LABEL_26;
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
LABEL_14:
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1A8D59A80();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
  swift_bridgeObjectRetain_n();
  char v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59ED0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v19)
  {
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v59[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_1A8C90120(v21, v20, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v23, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v27 = sub_1A8D59E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v26;
  v28[5] = v25;
  swift_retain();
  uint64_t v29 = sub_1A8D4BCB0(v24, (uint64_t)&unk_1E979F998, (uint64_t)v28);
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1A8D59A60();
  os_log_type_t v31 = sub_1A8D59ED0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = *(void *)(v0 + 240);
  if (v32)
  {
    uint64_t v34 = *(void *)(v0 + 232);
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v59[0] = v36;
    *(_DWORD *)char v35 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_1A8C90120(v34, v33, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v30, v31, "TaskLimiter: storing task for identifier %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = *(void *)(v0 + 232);
  uint64_t v37 = *(void *)(v0 + 240);
  v59[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F9A0);
  v59[4] = (uint64_t)&off_1EFF55138;
  v59[0] = v29;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A8C916F8((uint64_t)v59, v38, v37);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A8D59A60();
  os_log_type_t v40 = sub_1A8D59ED0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 240);
  if (v41)
  {
    uint64_t v43 = v29;
    uint64_t v44 = *(void *)(v0 + 232);
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v59[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v29 = v43;
    *(void *)(v0 + 184) = sub_1A8C90120(v47, v42, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v39, v40, "TaskLimiter: performing task operation for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v46, -1, -1);
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v48;
  uint64_t v49 = type metadata accessor for GeoClassificationInfo();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  *unint64_t v48 = v0;
  v48[1] = sub_1A8D34550;
  uint64_t v51 = MEMORY[0x1E4FBC0F0];
  uint64_t v52 = v0 + 208;
  uint64_t v53 = v29;
LABEL_26:
  return MEMORY[0x1F4187D90](v52, v53, v49, v50, v51);
}

uint64_t sub_1A8D352B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[32] = a4;
  v5[33] = v4;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  v5[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D35350, v4, 0);
}

uint64_t sub_1A8D35350()
{
  uint64_t v60 = v0;
  unint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v57 = *(void *)(v0 + 264) + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v57;
  if (!*(void *)(*(void *)v57 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_1A8C8DE74(v0 + 96, &qword_1EB5EAD10);
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1A8C90B9C(v3, v4);
  if (v6)
  {
    sub_1A8C91CA8(*(void *)(v2 + 56) + 40 * v5, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_1A8C91C90((long long *)(v0 + 96), v0 + 56);
  sub_1A8C91CA8(v0 + 56, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EA280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F980);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *(void *)(v0 + 216);
    *(void *)(v0 + 280) = v7;
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    swift_bridgeObjectRetain_n();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v56 = *(void *)(v0 + 232);
      uint64_t v58 = v7;
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v59[0] = v14;
      *(_DWORD *)unint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 224) = sub_1A8C90120(v56, v12, v59);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v9, v10, "TaskLimiter: reusing existing task for identifier %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
      uint64_t v15 = v13;
      uint64_t v7 = v58;
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v54;
    uint64_t v49 = type metadata accessor for Ticket();
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
    *uint64_t v54 = v0;
    v54[1] = sub_1A8D34424;
    uint64_t v51 = MEMORY[0x1E4FBC0F0];
    uint64_t v52 = v0 + 208;
    uint64_t v53 = v7;
    goto LABEL_26;
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
LABEL_14:
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1A8D59A80();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
  swift_bridgeObjectRetain_n();
  char v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59ED0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v19)
  {
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v59[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_1A8C90120(v21, v20, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v23, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v27 = sub_1A8D59E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v26;
  v28[5] = v25;
  swift_retain();
  uint64_t v29 = sub_1A8D4BCC8(v24, (uint64_t)&unk_1E979F978, (uint64_t)v28);
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1A8D59A60();
  os_log_type_t v31 = sub_1A8D59ED0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = *(void *)(v0 + 240);
  if (v32)
  {
    uint64_t v34 = *(void *)(v0 + 232);
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v59[0] = v36;
    *(_DWORD *)char v35 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_1A8C90120(v34, v33, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v30, v31, "TaskLimiter: storing task for identifier %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = *(void *)(v0 + 232);
  uint64_t v37 = *(void *)(v0 + 240);
  v59[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F980);
  v59[4] = (uint64_t)&off_1EFF55138;
  v59[0] = v29;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A8C916F8((uint64_t)v59, v38, v37);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A8D59A60();
  os_log_type_t v40 = sub_1A8D59ED0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 240);
  if (v41)
  {
    uint64_t v43 = v29;
    uint64_t v44 = *(void *)(v0 + 232);
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v59[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v29 = v43;
    *(void *)(v0 + 184) = sub_1A8C90120(v47, v42, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v39, v40, "TaskLimiter: performing task operation for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v46, -1, -1);
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v48;
  uint64_t v49 = type metadata accessor for Ticket();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  *unint64_t v48 = v0;
  v48[1] = sub_1A8D34550;
  uint64_t v51 = MEMORY[0x1E4FBC0F0];
  uint64_t v52 = v0 + 208;
  uint64_t v53 = v29;
LABEL_26:
  return MEMORY[0x1F4187D90](v52, v53, v49, v50, v51);
}

uint64_t sub_1A8D35C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[32] = a4;
  v5[33] = v4;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  v5[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D35CCC, v4, 0);
}

uint64_t sub_1A8D35CCC()
{
  uint64_t v60 = v0;
  unint64_t v1 = (_OWORD *)(v0 + 96);
  uint64_t v57 = *(void *)(v0 + 264) + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v57;
  if (!*(void *)(*(void *)v57 + 16))
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
LABEL_12:
    sub_1A8C8DE74(v0 + 96, &qword_1EB5EAD10);
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1A8C90B9C(v3, v4);
  if (v6)
  {
    sub_1A8C91CA8(*(void *)(v2 + 56) + 40 * v5, v0 + 96);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 120)) {
    goto LABEL_12;
  }
  sub_1A8C91C90((long long *)(v0 + 96), v0 + 56);
  sub_1A8C91CA8(v0 + 56, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EA280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F960);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *(void *)(v0 + 216);
    *(void *)(v0 + 280) = v7;
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    swift_bridgeObjectRetain_n();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v56 = *(void *)(v0 + 232);
      uint64_t v58 = v7;
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v59[0] = v14;
      *(_DWORD *)unint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 224) = sub_1A8C90120(v56, v12, v59);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v9, v10, "TaskLimiter: reusing existing task for identifier %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
      uint64_t v15 = v13;
      uint64_t v7 = v58;
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v54;
    uint64_t v49 = type metadata accessor for WaitlistResult();
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
    *uint64_t v54 = v0;
    v54[1] = sub_1A8D34424;
    uint64_t v51 = MEMORY[0x1E4FBC0F0];
    uint64_t v52 = v0 + 208;
    uint64_t v53 = v7;
    goto LABEL_26;
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
LABEL_14:
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1A8D59A80();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
  swift_bridgeObjectRetain_n();
  char v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59ED0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v19)
  {
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v59[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_1A8C90120(v21, v20, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v23, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v27 = sub_1A8D59E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v26;
  v28[5] = v25;
  swift_retain();
  uint64_t v29 = sub_1A8D4BCE0(v24, (uint64_t)&unk_1E979F958, (uint64_t)v28);
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1A8D59A60();
  os_log_type_t v31 = sub_1A8D59ED0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = *(void *)(v0 + 240);
  if (v32)
  {
    uint64_t v34 = *(void *)(v0 + 232);
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v59[0] = v36;
    *(_DWORD *)char v35 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_1A8C90120(v34, v33, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v30, v31, "TaskLimiter: storing task for identifier %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = *(void *)(v0 + 232);
  uint64_t v37 = *(void *)(v0 + 240);
  v59[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979F960);
  v59[4] = (uint64_t)&off_1EFF55138;
  v59[0] = v29;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A8C916F8((uint64_t)v59, v38, v37);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A8D59A60();
  os_log_type_t v40 = sub_1A8D59ED0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 240);
  if (v41)
  {
    uint64_t v43 = v29;
    uint64_t v44 = *(void *)(v0 + 232);
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v59[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = v44;
    uint64_t v29 = v43;
    *(void *)(v0 + 184) = sub_1A8C90120(v47, v42, v59);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v39, v40, "TaskLimiter: performing task operation for identifier %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v46, -1, -1);
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v48;
  uint64_t v49 = type metadata accessor for WaitlistResult();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  *unint64_t v48 = v0;
  v48[1] = sub_1A8D34550;
  uint64_t v51 = MEMORY[0x1E4FBC0F0];
  uint64_t v52 = v0 + 208;
  uint64_t v53 = v29;
LABEL_26:
  return MEMORY[0x1F4187D90](v52, v53, v49, v50, v51);
}

uint64_t sub_1A8D365AC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v4 = sub_1A8D36758;
  }
  else {
    uint64_t v4 = sub_1A8D366D8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D366D8()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 208);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1A8D36758()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D367D0()
{
  uint64_t v2 = v0[29];
  unint64_t v1 = v0[30];
  swift_release();
  sub_1A8C91500(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1A8D3685C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[32] = a5;
  v6[33] = v5;
  v6[30] = a3;
  v6[31] = a4;
  v6[28] = a1;
  v6[29] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  v6[34] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D368F8, v5, 0);
}

uint64_t sub_1A8D368F8()
{
  uint64_t v56 = v0;
  unint64_t v1 = (_OWORD *)(v0 + 56);
  uint64_t v54 = *(void *)(v0 + 264) + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v54;
  if (!*(void *)(*(void *)v54 + 16))
  {
    *(void *)(v0 + 88) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_12:
    sub_1A8C8DE74(v0 + 56, &qword_1EB5EAD10);
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1A8C90B9C(v4, v3);
  if (v6)
  {
    sub_1A8C91CA8(*(void *)(v2 + 56) + 40 * v5, v0 + 56);
  }
  else
  {
    *(void *)(v0 + 88) = 0;
    *unint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 80)) {
    goto LABEL_12;
  }
  sub_1A8C91C90((long long *)(v0 + 56), v0 + 16);
  sub_1A8C91CA8(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EA280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9670);
  if (swift_dynamicCast())
  {
    uint64_t v7 = *(void *)(v0 + 208);
    *(void *)(v0 + 280) = v7;
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    swift_bridgeObjectRetain_n();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = *(void *)(v0 + 240);
    if (v11)
    {
      uint64_t v13 = *(void *)(v0 + 232);
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v55[0] = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 216) = sub_1A8C90120(v13, v12, v55);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v9, v10, "TaskLimiter: reusing existing task for identifier %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v52 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v52;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
    *uint64_t v52 = v0;
    v52[1] = sub_1A8D371D4;
    uint64_t v48 = *(void *)(v0 + 224);
    uint64_t v49 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v50 = MEMORY[0x1E4FBC0F0];
    uint64_t v51 = v7;
    goto LABEL_26;
  }
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
LABEL_14:
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1A8D59A80();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
  swift_bridgeObjectRetain_n();
  char v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59ED0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v19)
  {
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v55[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_1A8C90120(v21, v20, v55);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "TaskLimiter: creating new task for identifier %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v23, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v27 = sub_1A8D59E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v26;
  v28[5] = v25;
  swift_retain();
  uint64_t v29 = sub_1A8D4BC94(v24, (uint64_t)&unk_1E979F938, (uint64_t)v28);
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_1A8D59A60();
  os_log_type_t v31 = sub_1A8D59ED0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  unint64_t v33 = *(void *)(v0 + 240);
  if (v32)
  {
    uint64_t v34 = *(void *)(v0 + 232);
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v55[0] = v36;
    *(_DWORD *)char v35 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 184) = sub_1A8C90120(v34, v33, v55);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v30, v31, "TaskLimiter: storing task for identifier %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = *(void *)(v0 + 232);
  uint64_t v37 = *(void *)(v0 + 240);
  v55[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9670);
  v55[4] = (uint64_t)&off_1EFF55138;
  v55[0] = v29;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A8C916F8((uint64_t)v55, v38, v37);
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A8D59A60();
  os_log_type_t v40 = sub_1A8D59ED0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v42 = *(void *)(v0 + 240);
  if (v41)
  {
    uint64_t v43 = *(void *)(v0 + 232);
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v55[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_1A8C90120(v43, v42, v55);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v39, v40, "TaskLimiter: performing task operation for identifier %s", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
    MEMORY[0x1AD0E6EB0](v44, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v46 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v46;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  *uint64_t v46 = v0;
  v46[1] = sub_1A8D373F0;
  uint64_t v48 = *(void *)(v0 + 224);
  uint64_t v49 = MEMORY[0x1E4FBC848] + 8;
  uint64_t v50 = MEMORY[0x1E4FBC0F0];
  uint64_t v51 = v29;
LABEL_26:
  return MEMORY[0x1F4187D90](v48, v51, v49, v47, v50);
}

uint64_t sub_1A8D371D4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v4 = sub_1A8D37378;
  }
  else {
    uint64_t v4 = sub_1A8D37300;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D37300()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D37378()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D373F0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0) {
    uint64_t v4 = sub_1A8D367D0;
  }
  else {
    uint64_t v4 = sub_1A8D3751C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1A8D3751C()
{
  uint64_t v2 = v0[29];
  unint64_t v1 = v0[30];
  swift_release();
  sub_1A8C91500(v2, v1);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1A8D375A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  void *v6 = v4;
  v6[1] = sub_1A8C81994;
  return v8(a1);
}

id DaemonController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DaemonController.init()()
{
  id v0 = objc_msgSend(self, sel_sharedSessionWithNoUrlCache);
  id v1 = objc_msgSend(v0, sel_urlSession);

  id v2 = objc_allocWithZone((Class)type metadata accessor for DaemonController());
  id v3 = DaemonController.init(session:)(v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id DaemonController.__allocating_init(session:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DaemonController.init(session:)(a1);
}

uint64_t type metadata accessor for DaemonController()
{
  return self;
}

id DaemonController.init(session:)(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F14208];
  *(void *)&v2[OBJC_IVAR___DaemonController_minimumActivityInterval] = *MEMORY[0x1E4F14208];
  uint64_t v8 = 90 * *MEMORY[0x1E4F141E0];
  if ((unsigned __int128)((uint64_t)*MEMORY[0x1E4F141E0] * (__int128)90) >> 64 == v8 >> 63)
  {
    *(void *)&v2[OBJC_IVAR___DaemonController_maximumActivityInterval] = v8;
    *(void *)&v2[OBJC_IVAR___DaemonController_failureActivityInterval] = v7;
    id v10 = objc_allocWithZone(MEMORY[0x1E4F29298]);
    id v1 = v2;
    BOOL v11 = (void *)sub_1A8D59BC0();
    id v12 = objc_msgSend(v10, sel_initWithMachServiceName_, v11);

    *(void *)&v1[OBJC_IVAR___DaemonController_listener] = v12;
    id v13 = sub_1A8C8E338();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9560);
    uint64_t v14 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v14 + 112) = v13;
    *(void *)&v1[OBJC_IVAR___DaemonController_accountStore] = v14;
    id v15 = objc_msgSend(self, sel_sharedServerWithNoUrlCache);
    uint64_t v37 = sub_1A8C8EB1C(0, (unint64_t *)&qword_1EB5E9DC0);
    uint64_t v38 = &off_1EFF551A0;
    *(void *)&long long v36 = v15;
    uint64_t v16 = sub_1A8C8E488();
    type metadata accessor for Config();
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 72) = 0u;
    *(_OWORD *)(v17 + 88) = 0u;
    *(void *)(v17 + 104) = 0;
    sub_1A8C91C90(&v36, v17 + 32);
    *(void *)(v17 + 16) = v16;
    *(void *)(v17 + 24) = &off_1EFF54220;
    os_log_type_t v18 = (uint64_t *)&v1[OBJC_IVAR___DaemonController_configStore];
    *os_log_type_t v18 = v17;
    v18[1] = (uint64_t)&off_1EFF550C8;
    type metadata accessor for TaskLimiters();
    uint64_t v19 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v19 + 112) = MEMORY[0x1E4FBC868];
    uint64_t v20 = OBJC_IVAR___DaemonController_taskLimiters;
    *(void *)&v1[OBJC_IVAR___DaemonController_taskLimiters] = v19;
    *(void *)&v1[OBJC_IVAR___DaemonController_urlSession] = a1;
    id v21 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
    id v3 = a1;
    uint64_t v22 = (void *)sub_1A8D59BC0();
    id v23 = objc_msgSend(v21, sel_initWithSuiteName_, v22);

    id v24 = sub_1A8CEA284(v23);
    *(void *)&v1[OBJC_IVAR___DaemonController_geoCache] = v24;
    id v2 = *(char **)&v1[v20];
    swift_retain();
    id v4 = v24;
    id v5 = sub_1A8C8E338();
    id v25 = objc_msgSend(self, sel_sharedSessionWithNoUrlCache);
    id v6 = objc_msgSend(v25, sel_urlSession);

    if (qword_1EB5EA450 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v26 = qword_1EB5ECD08;
  swift_retain();
  *(void *)&v1[OBJC_IVAR___DaemonController_requestHandler] = sub_1A8D3E6B4((uint64_t)v2, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, v26);

  v35.receiver = v1;
  v35.super_class = (Class)type metadata accessor for DaemonController();
  id v27 = objc_msgSendSuper2(&v35, sel_init);
  uint64_t v28 = qword_1EB5EAD00;
  id v29 = v27;
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1A8D59A80();
  __swift_project_value_buffer(v30, (uint64_t)qword_1EB5EAC50);
  os_log_type_t v31 = sub_1A8D59A60();
  os_log_type_t v32 = sub_1A8D59F00();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v33 = 0;
    _os_log_impl(&dword_1A8C7F000, v31, v32, "Daemon controller has been initialized!", v33, 2u);
    MEMORY[0x1AD0E6EB0](v33, -1, -1);
  }

  return v29;
}

void sub_1A8D37C7C()
{
  uint64_t v1 = v0;
  type metadata accessor for DefaultsMigrator();
  static DefaultsMigrator.migrate()();
  id v2 = *(void **)(v0 + OBJC_IVAR___DaemonController_listener);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR___DaemonController_listener), sel_setDelegate_, v1);
  objc_msgSend(v2, sel_resume);
  sub_1A8D38C60();
  sub_1A8D3E890();
  sub_1A8D3ECE4();
  sub_1A8D39E64();
  sub_1A8D32458();
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1A8D59A80();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EB5EAC50);
  oslog = sub_1A8D59A60();
  os_log_type_t v4 = sub_1A8D59F00();
  if (os_log_type_enabled(oslog, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A8C7F000, oslog, v4, "Daemon controller did start", v5, 2u);
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
  }
}

uint64_t sub_1A8D37E08()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v1 - 8, v2);
  os_log_type_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A8D59E10();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v0;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  id v9 = v0;
  if (v8 == 1)
  {
    sub_1A8C8DE74((uint64_t)v4, &qword_1EB5EAEA0);
  }
  else
  {
    sub_1A8D59E00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_1A8D59DC0();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      if (v12 | v10)
      {
        v14[0] = 0;
        v14[1] = 0;
        v14[2] = v10;
        v14[3] = v12;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1A8D3802C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x1F4188298](sub_1A8D3804C, 0, 0);
}

uint64_t sub_1A8D3804C()
{
  uint64_t v1 = (void *)(v0[2] + OBJC_IVAR___DaemonController_configStore);
  v0[3] = *v1;
  uint64_t v2 = v1[1];
  v0[4] = v2;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 72))(1, ObjectType, v2);
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A8D59A80();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB5EAC50);
  uint64_t v5 = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59F00();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A8C7F000, v5, v6, "Start Fetching Subscriber status", v7, 2u);
    MEMORY[0x1AD0E6EB0](v7, -1, -1);
  }
  uint64_t v8 = v0[2];

  uint64_t v9 = *(void *)(v8 + OBJC_IVAR___DaemonController_taskLimiters);
  v0[5] = v9;
  return MEMORY[0x1F4188298](sub_1A8D381C0, v9, 0);
}

uint64_t sub_1A8D381C0()
{
  *(void *)(v0 + 48) = sub_1A8C83E20(0xD000000000000012, 0x80000001A8D66C30);
  return MEMORY[0x1F4188298](sub_1A8D38244, 0, 0);
}

uint64_t sub_1A8D38244()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR___DaemonController_accountStore);
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 56) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 32) = v1;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E979F928 + dword_1E979F928);
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1A8D3836C;
  return v5((uint64_t)v5, 0xD000000000000012, 0x80000001A8D66C30, (uint64_t)&unk_1E979F920, v2);
}

uint64_t sub_1A8D3836C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A8D384A8;
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v2 = sub_1A8D38490;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D38490()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A8D384A8()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D38514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a3;
  v4[12] = a4;
  v4[10] = a2;
  uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_1E979E750 + dword_1E979E750);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[13] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1A8D385BC;
  return v7();
}

uint64_t sub_1A8D385BC(char a1)
{
  uint64_t v3 = *v2;
  *(unsigned char *)(v3 + 124) = a1;
  *(void *)(v3 + 112) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_1A8D38968;
  }
  else {
    uint64_t v4 = sub_1A8D386D4;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1A8D386D4()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 124);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, ObjectType, v3);
  return MEMORY[0x1F4188298](sub_1A8D38774, v2, 0);
}

uint64_t sub_1A8D38774()
{
  int v1 = *(unsigned __int8 *)(v0 + 124);
  swift_beginAccess();
  sub_1A8C983B0(v1);
  swift_endAccess();
  return MEMORY[0x1F4188298](sub_1A8D38810, 0, 0);
}

uint64_t sub_1A8D38810()
{
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A8D59A80();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EB5EAC50);
  uint64_t v2 = sub_1A8D59A60();
  os_log_type_t v3 = sub_1A8D59F00();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(v0 + 124);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67240192;
    *(_DWORD *)(v0 + 120) = v4;
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v2, v3, "Subscriber status fetched: %{BOOL,public}d", v5, 8u);
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
  }

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1A8D38968()
{
  uint64_t v16 = v0;
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = sub_1A8D59A80();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB5EAC50);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59F00();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[14];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_getErrorValue();
    uint64_t v11 = sub_1A8D5A440();
    v0[9] = sub_1A8C90120(v11, v12, &v15);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A8C7F000, v5, v6, "Subscriber status fetch failed with error: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v10, -1, -1);
    MEMORY[0x1AD0E6EB0](v9, -1, -1);
  }
  else
  {
  }
  id v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

id sub_1A8D38B94(void *a1)
{
  type metadata accessor for Assets();
  sub_1A8CF7E54(0xD00000000000002BLL, 0x80000001A8D670B0);
  return objc_msgSend(a1, sel_setTaskCompleted);
}

void sub_1A8D38BF8(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1A8D38C60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v0 - 8, v1);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A8D59A80();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB5EAC50);
  uint64_t v5 = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59F00();
  if (os_log_type_enabled(v5, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_1A8C7F000, v5, v6, "Registering for asset notifications.", v7, 2u);
    MEMORY[0x1AD0E6EB0](v7, -1, -1);
  }

  sub_1A8D59DF0();
  uint64_t v8 = sub_1A8D59E10();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  sub_1A8D399D8((uint64_t)v3, (uint64_t)&unk_1E979F9D8, (uint64_t)v10);
  swift_release();
  return sub_1A8C8DE74((uint64_t)v3, &qword_1EB5EAEA0);
}

uint64_t sub_1A8D38E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E98B8);
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E98C0);
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  v4[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A8D38F70, 0, 0);
}

uint64_t sub_1A8D38F70()
{
  sub_1A8D597D0();
  sub_1A8D59E20();
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A8D3906C;
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x1F4187D58](v0 + 176, 0, 0, v2);
}

uint64_t sub_1A8D3906C()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A8D39168, 0, 0);
}

uint64_t sub_1A8D39168()
{
  if (*(unsigned char *)(v0 + 176) == 2)
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v1 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 112);
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1A8D59A80();
    *(void *)(v0 + 144) = v6;
    __swift_project_value_buffer(v6, (uint64_t)qword_1EB5EAC50);
    BOOL v7 = sub_1A8D59A60();
    os_log_type_t v8 = sub_1A8D59F00();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A8C7F000, v7, v8, "Received new value in stream for asset notification.", v9, 2u);
      MEMORY[0x1AD0E6EB0](v9, -1, -1);
    }
    uint64_t v10 = *(void *)(v0 + 80);

    uint64_t v11 = MEMORY[0x1AD0E6FA0](v10 + 16);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = *(id *)(v11 + OBJC_IVAR___DaemonController_requestHandler);

      sub_1A8C91CA8((uint64_t)v13 + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_availabilityClient, v0 + 16);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v14;
      void *v14 = v0;
      v14[1] = sub_1A8D39548;
      return sub_1A8CE5C58();
    }
    else
    {
      uint64_t v15 = _s25CloudSubscriptionFeatures8FollowUpCACSgycfC_0();
      *(void *)(v0 + 160) = v15;
      if (v15)
      {
        uint64_t v16 = (void *)swift_task_alloc();
        *(void *)(v0 + 168) = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_1A8D39828;
        return sub_1A8D28C58();
      }
      else
      {
        if (qword_1EB5E97F0 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_1EB5E97D0);
        uint64_t v17 = sub_1A8D59A60();
        os_log_type_t v18 = sub_1A8D59EE0();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_1A8C7F000, v17, v18, "Attempted to check for deferred notification eligibility and post but could not create FollowUp object.", v19, 2u);
          MEMORY[0x1AD0E6EB0](v19, -1, -1);
        }

        uint64_t v20 = (void *)swift_task_alloc();
        *(void *)(v0 + 136) = v20;
        *uint64_t v20 = v0;
        v20[1] = sub_1A8D3906C;
        uint64_t v21 = *(void *)(v0 + 88);
        return MEMORY[0x1F4187D58](v0 + 176, 0, 0, v21);
      }
    }
  }
}

uint64_t sub_1A8D39548()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A8D39644, 0, 0);
}

uint64_t sub_1A8D39644()
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  uint64_t v1 = _s25CloudSubscriptionFeatures8FollowUpCACSgycfC_0();
  v0[20] = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[21] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1A8D39828;
    return sub_1A8D28C58();
  }
  else
  {
    if (qword_1EB5E97F0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0[18], (uint64_t)qword_1EB5E97D0);
    uint64_t v4 = sub_1A8D59A60();
    os_log_type_t v5 = sub_1A8D59EE0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A8C7F000, v4, v5, "Attempted to check for deferred notification eligibility and post but could not create FollowUp object.", v6, 2u);
      MEMORY[0x1AD0E6EB0](v6, -1, -1);
    }

    BOOL v7 = (void *)swift_task_alloc();
    v0[17] = v7;
    *BOOL v7 = v0;
    v7[1] = sub_1A8D3906C;
    uint64_t v8 = v0[11];
    return MEMORY[0x1F4187D58](v0 + 22, 0, 0, v8);
  }
}

uint64_t sub_1A8D39828()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A8D39924, 0, 0);
}

uint64_t sub_1A8D39924()
{
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A8D3906C;
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x1F4187D58](v0 + 176, 0, 0, v2);
}

uint64_t sub_1A8D399D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8CB249C(a1, (uint64_t)v9, &qword_1EB5EAEA0);
  uint64_t v10 = sub_1A8D59E10();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1A8C8DE74((uint64_t)v9, &qword_1EB5EAEA0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_1A8D59DC0();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_1A8D59E00();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

uint64_t sub_1A8D39BCC()
{
  return MEMORY[0x1F4188298](sub_1A8D39BE8, 0, 0);
}

uint64_t sub_1A8D39BE8()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[3] = sub_1A8D39CE8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1A8CE5BC0;
  v0[13] = &block_descriptor_96;
  v0[14] = v2;
  objc_msgSend(v1, sel_revalidateCFUWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1A8D39CE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 120) = v1;
  if (v1) {
    uint64_t v2 = sub_1A8D39DF8;
  }
  else {
    uint64_t v2 = sub_1A8D38490;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D39DF8()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1A8D39E64()
{
  uint64_t v6 = &type metadata for FeatureFlag;
  unint64_t v7 = sub_1A8C937E4();
  v5[0] = 0;
  char v0 = sub_1A8D597C0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  if (v0)
  {
    sub_1A8D39F7C();
  }
  else
  {
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1A8D59A80();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EB5EAC50);
    uint64_t v2 = sub_1A8D59A60();
    os_log_type_t v3 = sub_1A8D59ED0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A8C7F000, v2, v3, "caching disabled", v4, 2u);
      MEMORY[0x1AD0E6EB0](v4, -1, -1);
    }
  }
}

void sub_1A8D39F7C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1A8D59A80();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EB5EAC50);
  uint64_t v4 = sub_1A8D59A60();
  os_log_type_t v5 = sub_1A8D59F00();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A8C7F000, v4, v5, "preparing for check-in", v6, 2u);
    MEMORY[0x1AD0E6EB0](v6, -1, -1);
  }

  unint64_t v7 = (void *)*MEMORY[0x1E4F14150];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  *(void *)(v8 + 24) = ObjectType;
  v11[4] = sub_1A8D3F3C0;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1A8D3A6B4;
  v11[3] = &block_descriptor_13;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v1;
  swift_release();
  xpc_activity_register("com.apple.ind.cloudfeatures.reload", v7, v9);
  _Block_release(v9);
}

void sub_1A8D3A128(_xpc_activity_s *a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state == 5)
  {
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    os_log_t oslog = (os_log_t)sub_1A8D59A60();
    os_log_type_t v9 = sub_1A8D59F00();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v25 = v11;
      *(_DWORD *)uint64_t v10 = 136446210;
      sub_1A8C90120(0xD000000000000022, 0x80000001A8D66F80, &v25);
      sub_1A8D59FE0();
      uint64_t v12 = "new state: activity %{public}s -> done";
      uint64_t v13 = oslog;
      os_log_type_t v14 = v9;
      uint64_t v15 = (uint8_t *)v10;
      uint32_t v16 = 12;
LABEL_22:
      _os_log_impl(&dword_1A8C7F000, v13, v14, v12, v15, v16);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v11, -1, -1);
      MEMORY[0x1AD0E6EB0](v10, -1, -1);

      return;
    }
    goto LABEL_23;
  }
  if (state != 2)
  {
    if (!state)
    {
      if (qword_1EB5EAD00 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_1A8D59A80();
      __swift_project_value_buffer(v3, (uint64_t)qword_1EB5EAC50);
      uint64_t v4 = sub_1A8D59A60();
      os_log_type_t v5 = sub_1A8D59F00();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v25 = v7;
        *(_DWORD *)uint64_t v6 = 136446210;
        sub_1A8C90120(0xD000000000000022, 0x80000001A8D66F80, &v25);
        sub_1A8D59FE0();
        _os_log_impl(&dword_1A8C7F000, v4, v5, "new state: activity %{public}s -> check-in", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v7, -1, -1);
        MEMORY[0x1AD0E6EB0](v6, -1, -1);
      }

      sub_1A8D3A714(a1);
      return;
    }
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1A8D59A80();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EB5EAC50);
    os_log_t oslog = (os_log_t)sub_1A8D59A60();
    os_log_type_t v23 = sub_1A8D59F00();
    if (os_log_type_enabled(oslog, v23))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v25 = v11;
      *(_DWORD *)uint64_t v10 = 136446466;
      sub_1A8C90120(0xD000000000000022, 0x80000001A8D66F80, &v25);
      sub_1A8D59FE0();
      *(_WORD *)(v10 + 12) = 2050;
      sub_1A8D59FE0();
      uint64_t v12 = "new state: activity %{public}s -> %{public}ld [unhandled]";
      uint64_t v13 = oslog;
      os_log_type_t v14 = v23;
      uint64_t v15 = (uint8_t *)v10;
      uint32_t v16 = 22;
      goto LABEL_22;
    }
LABEL_23:

    return;
  }
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1A8D59A80();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EB5EAC50);
  os_log_type_t v18 = sub_1A8D59A60();
  os_log_type_t v19 = sub_1A8D59F00();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v21;
    *(_DWORD *)uint64_t v20 = 136446210;
    sub_1A8C90120(0xD000000000000022, 0x80000001A8D66F80, &v25);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v18, v19, "new state: activity %{public}s -> run", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v21, -1, -1);
    MEMORY[0x1AD0E6EB0](v20, -1, -1);
  }

  sub_1A8D3AA34(a1);
}

uint64_t sub_1A8D3A6B4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1A8D3A714(_xpc_activity_s *a1)
{
  uint64_t v2 = v1;
  xpc_object_t v4 = xpc_activity_copy_criteria(a1);
  if (v4)
  {
    xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E4F14178]);
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1A8D59A80();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EB5EAC50);
    uint64_t v6 = sub_1A8D59A60();
    os_log_type_t v7 = sub_1A8D59F00();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134349056;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v6, v7, "current activity delay: %{public}lld", v8, 0xCu);
      MEMORY[0x1AD0E6EB0](v8, -1, -1);
    }

    swift_unknownObjectRelease();
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A8C7F000, v9, v10, "check-in complete", v11, 2u);
      MEMORY[0x1AD0E6EB0](v11, -1, -1);
    }
  }
  else
  {
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1A8D59A80();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EB5EAC50);
    uint64_t v13 = sub_1A8D59A60();
    os_log_type_t v14 = sub_1A8D59F00();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1A8C7F000, v13, v14, "scheduling activity for initial run", v15, 2u);
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }

    sub_1A8D3B96C(a1, *(void *)(v2 + OBJC_IVAR___DaemonController_minimumActivityInterval));
    os_log_t oslog = sub_1A8D59A60();
    os_log_type_t v16 = sub_1A8D59F00();
    if (os_log_type_enabled(oslog, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A8C7F000, oslog, v16, "check-in complete", v17, 2u);
      MEMORY[0x1AD0E6EB0](v17, -1, -1);
    }
  }
}

void sub_1A8D3AA34(_xpc_activity_s *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_activity_should_defer(a1))
  {
    BOOL v7 = xpc_activity_set_state(a1, 3);
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    uint64_t v15 = sub_1A8D59A60();
    os_log_type_t v9 = sub_1A8D59F00();
    if (os_log_type_enabled(v15, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v10 = 67240192;
      BOOL v16 = v7;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v15, v9, "run deferred, result: %{BOOL,public}d", v10, 8u);
      MEMORY[0x1AD0E6EB0](v10, -1, -1);
    }
    else
    {
      os_log_type_t v14 = v15;
    }
  }
  else
  {
    uint64_t v11 = sub_1A8D59E10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    void v12[4] = v1;
    v12[5] = a1;
    id v13 = v1;
    swift_unknownObjectRetain();
    sub_1A8C84960((uint64_t)v6, (uint64_t)&unk_1E979F900, (uint64_t)v12);
    swift_release();
  }
}

uint64_t sub_1A8D3AC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 64) = a4;
  *(void *)(v5 + 72) = a5;
  return MEMORY[0x1F4188298](sub_1A8D3AC84, 0, 0);
}

uint64_t sub_1A8D3AC84()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 64) + OBJC_IVAR___DaemonController_configStore + 8);
  uint64_t ObjectType = swift_getObjectType();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1)) {
    sub_1A8D37E08();
  }
  uint64_t v3 = *(_xpc_activity_s **)(v0 + 72);
  uint64_t v4 = sub_1A8D596F0();
  *(void *)(v0 + 80) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v0 + 88) = v5;
  uint64_t v6 = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  BOOL v7 = (char *)swift_task_alloc();
  sub_1A8D3D710(v3, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4) == 1)
  {
    sub_1A8C8DE74((uint64_t)v7, &qword_1EB5EACF0);
    swift_task_dealloc();
    swift_task_dealloc();
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A8D59A80();
    *(void *)(v0 + 96) = __swift_project_value_buffer(v8, (uint64_t)qword_1EB5EAC50);
    os_log_type_t v9 = sub_1A8D59A60();
    os_log_type_t v10 = sub_1A8D59F00();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A8C7F000, v9, v10, "rebuilding cache, fetching all features from service", v11, 2u);
      MEMORY[0x1AD0E6EB0](v11, -1, -1);
    }

    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 104) = v12;
    id v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v13;
    *id v13 = v0;
    v13[1] = sub_1A8D3B278;
    uint64_t v14 = *(void *)(v0 + 64);
    v13[5] = v12;
    v13[6] = v14;
    uint64_t v15 = (uint64_t)sub_1A8D3C108;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    return MEMORY[0x1F4188298](v15, v16, v17);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v6, v7, v4);
  swift_task_dealloc();
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1A8D59A80();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EB5EAC50);
  uint64_t v19 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v19, v6, v4);
  uint64_t v20 = sub_1A8D59A60();
  os_log_type_t v21 = sub_1A8D59F00();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = v32;
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_1A8D3F9D0((unint64_t *)&qword_1EB5E92D0, MEMORY[0x1F418BA08]);
    uint64_t v23 = sub_1A8D5A360();
    *(void *)(v0 + 24) = sub_1A8C90120(v23, v24, &v33);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v25(v19, v4);
    _os_log_impl(&dword_1A8C7F000, v20, v21, "rebuilding cache deferred to %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v32, -1, -1);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }
  else
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v25(v19, v4);
  }

  swift_task_dealloc();
  uint64_t v15 = sub_1A8D59690();
  if ((~*(void *)&v26 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v26 >= 9.22337204e18)
  {
LABEL_26:
    __break(1u);
    return MEMORY[0x1F4188298](v15, v16, v17);
  }
  sub_1A8D3B96C(*(_xpc_activity_s **)(v0 + 72), (uint64_t)v26);
  v25(v6, v4);
  swift_task_dealloc();
  id v27 = sub_1A8D59A60();
  os_log_type_t v28 = sub_1A8D59F00();
  if (os_log_type_enabled(v27, v28))
  {
    id v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v29 = 0;
    _os_log_impl(&dword_1A8C7F000, v27, v28, "run complete", v29, 2u);
    MEMORY[0x1AD0E6EB0](v29, -1, -1);
  }

  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_1A8D3B278()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A8D3B5C0;
  }
  else {
    uint64_t v2 = sub_1A8D3B38C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D3B38C()
{
  uint64_t result = sub_1A8D59690();
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v3 = *(void **)(v0 + 64);
  sub_1A8D3B96C(*(_xpc_activity_s **)(v0 + 72), (uint64_t)v2);
  id v4 = v3;
  uint64_t v5 = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59ED0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(NSObject **)(v0 + 64);
  if (v7)
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 134217984;
    *(v0 + 56) = *((char *)v8 + OBJC_IVAR___DaemonController_minimumActivityInterval);
    sub_1A8D59FE0();

    _os_log_impl(&dword_1A8C7F000, v5, v6, "Resetting backoff time to %lld", v9, 0xCu);
    MEMORY[0x1AD0E6EB0](v9, -1, -1);
  }
  else
  {

    uint64_t v5 = v8;
  }

  uint64_t v10 = *(void *)(v0 + 64);
  (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 80));
  *(void *)(v10 + OBJC_IVAR___DaemonController_failureActivityInterval) = *(void *)(v10
                                                                                      + OBJC_IVAR___DaemonController_minimumActivityInterval);
  swift_task_dealloc();
  uint64_t v11 = sub_1A8D59A60();
  os_log_type_t v12 = sub_1A8D59F00();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1A8C7F000, v11, v12, "run complete", v13, 2u);
    MEMORY[0x1AD0E6EB0](v13, -1, -1);
  }

  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_1A8D3B5C0()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_task_dealloc();
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEC0);
  if (swift_dynamicCast())
  {

    if (*(unsigned char *)(v0 + 128) == 1)
    {
      if (qword_1EB5EAB78 != -1) {
        swift_once();
      }
      uint64_t v3 = *(_xpc_activity_s **)(v0 + 72);
      sub_1A8CECFB4();
      uint64_t v4 = sub_1A8D3BCB0();
      sub_1A8D3B96C(v3, v4);
      uint64_t v5 = sub_1A8D59A60();
      os_log_type_t v6 = sub_1A8D59F00();
      if (!os_log_type_enabled(v5, v6)) {
        goto LABEL_13;
      }
      BOOL v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v7 = 134349056;
      *(void *)(v0 + 48) = v4;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v5, v6, "empty response, rescheduling with interval %{public}lld", v7, 0xCu);
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v16 = *(_xpc_activity_s **)(v0 + 72);
      uint64_t v17 = sub_1A8D3BCB0();
      sub_1A8D3B96C(v16, v17);
      uint64_t v5 = sub_1A8D59A60();
      os_log_type_t v18 = sub_1A8D59EE0();
      if (!os_log_type_enabled(v5, v18))
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134349056;
      *(void *)(v0 + 40) = v17;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v5, v18, "invalid new expiration after successful fetch, rescheduling with interval %{public}lld", v19, 0xCu);
      uint64_t v8 = v19;
    }
    MEMORY[0x1AD0E6EB0](v8, -1, -1);
    goto LABEL_13;
  }
  os_log_type_t v9 = *(_xpc_activity_s **)(v0 + 72);

  uint64_t v10 = sub_1A8D3BCB0();
  sub_1A8D3B96C(v9, v10);
  uint64_t v11 = sub_1A8D59A60();
  os_log_type_t v12 = sub_1A8D59EE0();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v14 = *(void **)(v0 + 120);
  if (v13)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 134349056;
    *(void *)(v0 + 32) = v10;
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v11, v12, "failed, rescheduling with interval %{public}lld", v15, 0xCu);
    MEMORY[0x1AD0E6EB0](v15, -1, -1);
  }

LABEL_14:
  uint64_t v20 = sub_1A8D59A60();
  os_log_type_t v21 = sub_1A8D59F00();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_1A8C7F000, v20, v21, "run complete", v22, 2u);
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
  }

  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

void sub_1A8D3B96C(_xpc_activity_s *a1, uint64_t a2)
{
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1A8D59A80();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB5EAC50);
  os_log_type_t v6 = sub_1A8D59A60();
  os_log_type_t v7 = sub_1A8D59F00();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = a2;
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v8 = 134349314;
    v21[3] = &v25;
    sub_1A8D59FE0();
    *(_WORD *)(v8 + 12) = 2082;
    v21[2] = v8 + 14;
    uint64_t v23 = v2;
    uint64_t v9 = sub_1A8D596F0();
    v21[1] = v21;
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v9, v11);
    BOOL v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1A8D59680();
    sub_1A8D3F9D0((unint64_t *)&qword_1EB5E92D0, MEMORY[0x1F418BA08]);
    uint64_t v14 = sub_1A8D5A360();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v24 = sub_1A8C90120(v14, v16, &v25);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A8C7F000, v6, v7, "scheduling cache reload in before %{public}llds (%{public}s)", (uint8_t *)v8, 0x16u);
    uint64_t v17 = v22;
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v17, -1, -1);
    MEMORY[0x1AD0E6EB0](v8, -1, -1);
  }

  xpc_object_t empty = xpc_activity_copy_criteria(a1);
  if (empty) {
    goto LABEL_8;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C0], (const char *)*MEMORY[0x1E4F142E8]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14140], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14300], 0);
  if (*MEMORY[0x1E4F14338])
  {
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
LABEL_8:
    int64_t v19 = sub_1A8D3C02C(a2);
    sub_1A8D3EEF4(empty, v19, v20);
    xpc_activity_set_criteria(a1, empty);
    swift_unknownObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_1A8D3BCB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1A8D596F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  os_log_type_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&v0[OBJC_IVAR___DaemonController_configStore + 8];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v7 + 8))(0x726665527478656ELL, 0xEF65746144687365, ObjectType, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
  {
    sub_1A8C8DE74((uint64_t)v12, &qword_1EB5EACF0);
    uint64_t v13 = OBJC_IVAR___DaemonController_failureActivityInterval;
    uint64_t v14 = *(void *)&v0[OBJC_IVAR___DaemonController_failureActivityInterval];
    if (v14 + 0x4000000000000000 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v15 = 2 * v14;
      if (*(void *)&v0[OBJC_IVAR___DaemonController_maximumActivityInterval] < 2 * v14) {
        uint64_t v15 = *(void *)&v0[OBJC_IVAR___DaemonController_maximumActivityInterval];
      }
      *(void *)&v0[OBJC_IVAR___DaemonController_failureActivityInterval] = v15;
      if (qword_1EB5EAD00 == -1) {
        goto LABEL_6;
      }
    }
    swift_once();
LABEL_6:
    uint64_t v16 = sub_1A8D59A80();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB5EAC50);
    uint64_t v17 = v0;
    os_log_type_t v18 = sub_1A8D59A60();
    os_log_type_t v19 = sub_1A8D59ED0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134218240;
      uint64_t v25 = v14;
      sub_1A8D59FE0();
      *(_WORD *)(v20 + 12) = 2048;
      uint64_t v25 = *(void *)&v1[v13];
      sub_1A8D59FE0();

      _os_log_impl(&dword_1A8C7F000, v18, v19, "Backoff time increased. Current backoff: %lld. Next backoff: %lld", (uint8_t *)v20, 0x16u);
      MEMORY[0x1AD0E6EB0](v20, -1, -1);
    }
    else
    {
    }
    return v14;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
  sub_1A8D59690();
  double v22 = v21;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v22 < 9.22337204e18) {
    return (uint64_t)v22;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1A8D3C02C(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___DaemonController_minimumActivityInterval);
  if (v2 <= result) {
    uint64_t v2 = result;
  }
  if (v2 >= *(void *)(v1 + OBJC_IVAR___DaemonController_maximumActivityInterval)) {
    uint64_t v2 = *(void *)(v1 + OBJC_IVAR___DaemonController_maximumActivityInterval);
  }
  if ((*MEMORY[0x1E4F141F0] & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v2 < 0 || v2 >= *MEMORY[0x1E4F141F0])
  {
    double v4 = (double)v2 * 0.2;
    if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (v4 <= -9.22337204e18)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (v4 >= 9.22337204e18)
    {
LABEL_21:
      __break(1u);
      return result;
    }
    if ((uint64_t)v4 <= 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = (uint64_t)v4;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t result = v2 - v3;
  if (__OFSUB__(v2, v3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_1A8D3C0E8(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x1F4188298](sub_1A8D3C108, 0, 0);
}

uint64_t sub_1A8D3C108()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 48) + OBJC_IVAR___DaemonController_accountStore);
  *(void *)(v0 + 56) = v1;
  return MEMORY[0x1F4188298](sub_1A8D3C134, v1, 0);
}

uint64_t sub_1A8D3C134()
{
  uint64_t v1 = v0[7];
  swift_beginAccess();
  id v2 = *(id *)(v1 + 112);
  id v3 = objc_msgSend(v2, sel_aa_primaryAppleAccount);
  double v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, sel_aa_altDSID);

    if (v5)
    {
      double v4 = (void *)sub_1A8D59BF0();
      uint64_t v7 = v6;

      goto LABEL_7;
    }

    double v4 = 0;
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_7:
  v0[8] = v4;
  v0[9] = v7;
  return MEMORY[0x1F4188298](sub_1A8D3C234, 0, 0);
}

uint64_t sub_1A8D3C234()
{
  if (qword_1EB5EAB78 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v0 + 80) = FeatureCache.allFeatures(forDSID:ignoreTTL:)(*(uint64_t **)(v0 + 64), *(void *)(v0 + 72), 1);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___DaemonController_taskLimiters);
  *(void *)(v0 + 88) = v2;
  return MEMORY[0x1F4188298](sub_1A8D3C300, v2, 0);
}

uint64_t sub_1A8D3C300()
{
  *(void *)(v0 + 96) = sub_1A8C83E20(0x75746165466C6C61, 0xEB00000000736572);
  id v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E979F8D8 + dword_1E979F8D8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A8D3C400;
  return v3(0x75746165466C6C61, 0xEB00000000736572, (uint64_t)&unk_1E979F8D0, 0);
}

uint64_t sub_1A8D3C400(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1A8D3CFD0;
  }
  else
  {
    uint64_t v4 = sub_1A8D3C51C;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1A8D3C51C()
{
  BOOL v41 = v0;
  unint64_t v1 = v0[14];
  if (v1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v3 = v0[14];
  if (v2)
  {
    while (1)
    {
      uint64_t v38 = v2;
      sub_1A8CECFB4();
      uint64_t v4 = sub_1A8D596F0();
      v0[16] = v4;
      uint64_t v5 = *(void *)(v4 - 8);
      uint64_t v6 = v5;
      v0[17] = v5;
      v0[18] = *(void *)(v5 + 64);
      uint64_t v34 = swift_task_alloc();
      v0[19] = v34;
      uint64_t v7 = swift_task_alloc();
      sub_1A8D59610();
      uint64_t v8 = (char *)swift_task_alloc();
      uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v9 = v6 + 16;
      v0[20] = v10;
      v0[21] = v9 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v10(v8, v7, v4);
      unint64_t v11 = v1 & 0xC000000000000001;
      uint64_t v39 = (void (**)(char *, uint64_t))(v9 - 8);
      uint64_t v12 = v0[15];
      swift_bridgeObjectRetain();
      unint64_t v37 = v11;
      if (v11) {
        uint64_t v13 = (char *)MEMORY[0x1AD0E6030](0, v0[14]);
      }
      else {
        uint64_t v13 = (char *)*(id *)(v3 + 32);
      }
      uint64_t v14 = v13;
      v40[0] = v13;
      uint64_t v15 = swift_task_alloc();
      sub_1A8D3D248(v8, v40, v15);
      if (v12)
      {

        swift_bridgeObjectRelease();
        (*v39)(v8, v4);
        swift_task_dealloc();
        return swift_task_dealloc();
      }
      uint64_t v33 = v7;
      uint64_t v35 = v3;
      uint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v9 + 16);

      os_log_type_t v18 = *v39;
      v0[25] = *v39;
      v0[26] = (unint64_t)v39 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v18(v8, v4);
      os_log_type_t v19 = *v17;
      v0[27] = *v17;
      v0[28] = (unint64_t)v17 & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      uint64_t v36 = (unint64_t)v17 & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
      v19(v8, v15, v4);
      swift_task_dealloc();
      if (v38 == 1) {
        break;
      }
      uint64_t v20 = 5;
      while (1)
      {
        unint64_t v1 = v20 - 4;
        double v21 = v37 ? (char *)MEMORY[0x1AD0E6030](v20 - 4, v0[14]) : (char *)*(id *)(v35 + 8 * v20);
        double v22 = v21;
        uint64_t v23 = v20 - 3;
        if (__OFADD__(v1, 1)) {
          break;
        }
        v40[0] = v21;
        uint64_t v24 = swift_task_alloc();
        sub_1A8D3D248(v8, v40, v24);

        v0[25] = v18;
        v0[26] = (unint64_t)v39 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v18(v8, v4);
        v0[27] = v19;
        v0[28] = v36;
        v19(v8, v24, v4);
        swift_task_dealloc();
        ++v20;
        if (v23 == v38) {
          goto LABEL_17;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_1A8D5A1C0();
      swift_bridgeObjectRelease();
      uint64_t v3 = v0[14];
      if (!v2) {
        goto LABEL_22;
      }
    }
LABEL_17:
    uint64_t v26 = v0[6];
    uint64_t v25 = v0[7];
    swift_bridgeObjectRelease();
    v19((char *)v34, (uint64_t)v8, v4);
    swift_task_dealloc();
    v18((char *)v33, v4);
    swift_task_dealloc();
    sub_1A8CEA9EC();
    type metadata accessor for Assets();
    sub_1A8CF7E54(0xD000000000000016, 0x80000001A8D66F60);
    v0[22] = *(void *)(v26 + OBJC_IVAR___DaemonController_requestHandler);
    return MEMORY[0x1F4188298](sub_1A8D3CA94, v25, 0);
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1A8D59A80();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EB5EAC50);
    os_log_type_t v28 = sub_1A8D59A60();
    os_log_type_t v29 = sub_1A8D59EE0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1A8C7F000, v28, v29, "no feature availability in response", v30, 2u);
      MEMORY[0x1AD0E6EB0](v30, -1, -1);
    }

    sub_1A8D3F170();
    swift_allocError();
    unsigned char *v31 = 1;
    swift_willThrow();
    swift_release();
    uint64_t v32 = (uint64_t (*)(void))v0[1];
    return v32();
  }
}

uint64_t sub_1A8D3CA94()
{
  unint64_t v1 = *(void **)(*(void *)(v0 + 56) + 112);
  *(void *)(v0 + 184) = v1;
  id v2 = v1;
  return MEMORY[0x1F4188298](sub_1A8D3CB08, 0, 0);
}

uint64_t sub_1A8D3CB08()
{
  unint64_t v1 = (void *)v0[23];
  unint64_t v2 = v0[14];
  unint64_t v3 = v0[10];
  id v4 = objc_msgSend(v1, sel_aa_primaryAppleAccount);

  sub_1A8CEEB94((uint64_t)v4, v3, v2);
  swift_bridgeObjectRelease();

  uint64_t v5 = (void *)swift_task_alloc();
  v0[24] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1A8D3CBF0;
  uint64_t v6 = v0[14];
  return sub_1A8CC11A8(v6);
}

uint64_t sub_1A8D3CBF0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4188298](sub_1A8D3CD08, 0, 0);
}

uint64_t sub_1A8D3CD08()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR___DaemonController_configStore + 8);
  uint64_t ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v7 = swift_task_alloc();
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v5 + 8))(0x726665527478656ELL, 0xEF65746144687365, ObjectType, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v7, 1, v2) == 1)
  {
    sub_1A8D59600();
    sub_1A8C8DE74(v7, &qword_1EB5EACF0);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 216))(v4, v7, *(void *)(v0 + 128));
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 152);
  uint64_t v11 = *(void *)(v0 + 128);
  uint64_t v12 = *(void *)(v0 + 40);
  swift_task_dealloc();
  sub_1A8D3F9D0((unint64_t *)&unk_1EB5E92C0, MEMORY[0x1F418BA08]);
  if (sub_1A8D59B90()) {
    uint64_t v13 = v4;
  }
  else {
    uint64_t v13 = v10;
  }
  v9(v12, v13, v11);
  v8(v4, v11);
  swift_task_dealloc();
  uint64_t v14 = swift_task_alloc();
  sub_1A8D59610();
  char v15 = sub_1A8D59660();
  v8(v14, v11);
  swift_task_dealloc();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v18 = *(void *)(v0 + 128);
  if (v15)
  {
    v16(*(void *)(v0 + 152), *(void *)(v0 + 128));
    swift_release();
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 40);
    sub_1A8D3F170();
    swift_allocError();
    unsigned char *v21 = 0;
    swift_willThrow();
    swift_release();
    v16(v20, v18);
    v16(v17, v18);
  }
  swift_task_dealloc();
  os_log_type_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_1A8D3CFD0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D3D034(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1E979E6E0 + dword_1E979E6E0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1A8D3D0D8;
  return v4();
}

uint64_t sub_1A8D3D0D8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](sub_1A8D3D224, 0, 0);
  }
}

uint64_t sub_1A8D3D224()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A8D3D248@<X0>(char *a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a2;
  if (qword_1EB5EAB78 != -1) {
    swift_once();
  }
  id v6 = sub_1A8C8E338();
  id v7 = objc_msgSend(v6, sel_aa_primaryAppleAccount);
  uint64_t v8 = v7;
  os_log_type_t v40 = a1;
  uint64_t v39 = a3;
  if (v7)
  {
    id v9 = objc_msgSend(v7, sel_aa_altDSID);

    if (v9)
    {
      uint64_t v10 = sub_1A8D59BF0();
      uint64_t v8 = v11;
    }
    else
    {

      uint64_t v10 = 0;
      uint64_t v8 = 0;
    }
  }
  else
  {

    uint64_t v10 = 0;
  }
  sub_1A8D59530();
  swift_allocObject();
  uint64_t v12 = sub_1A8D59520();
  sub_1A8CECA2C(v5, v12, v10, (uint64_t)v8);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1A8D596F0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t)&v5[OBJC_IVAR___CloudFeature_ttl];
  swift_beginAccess();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  MEMORY[0x1F4188790](v19 - 8, v20);
  double v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8CB249C(v18, (uint64_t)v22, &qword_1EB5EACF0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v22, 1, v13) == 1)
  {
    sub_1A8C8DE74((uint64_t)v22, &qword_1EB5EACF0);
    if (qword_1EB5EAD00 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1A8D59A80();
    __swift_project_value_buffer(v23, (uint64_t)qword_1EB5EAC50);
    uint64_t v24 = v5;
    uint64_t v25 = sub_1A8D59A60();
    os_log_type_t v26 = sub_1A8D59EE0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      unint64_t v37 = (void *)swift_slowAlloc();
      uint64_t v38 = v27;
      *(_DWORD *)uint64_t v27 = 138543362;
      BOOL v41 = v24;
      os_log_type_t v28 = v24;
      sub_1A8D59FE0();
      os_log_type_t v29 = v37;
      void *v37 = v24;

      uint64_t v30 = v38;
      _os_log_impl(&dword_1A8C7F000, v25, v26, "feature fetched without TTL: %{public}@", v38, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAED0);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v29, -1, -1);
      MEMORY[0x1AD0E6EB0](v30, -1, -1);
    }
    else
    {

      uint64_t v25 = v24;
    }
    uint64_t v35 = v39;
    uint64_t v34 = v40;

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 16))(v35, v34, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v22, v13);
    sub_1A8D3F9D0((unint64_t *)&unk_1EB5E92C0, MEMORY[0x1F418BA08]);
    os_log_type_t v31 = v40;
    if (sub_1A8D59B80())
    {
      uint64_t v32 = v39;
      uint64_t v33 = v17;
    }
    else
    {
      uint64_t v32 = v39;
      uint64_t v33 = v31;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v32, v33, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
}

void sub_1A8D3D710(_xpc_activity_s *a1@<X0>, char *a2@<X8>)
{
  xpc_activity_t v87 = a1;
  uint64_t v88 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v4 = *(void *)(*(v88 - 1) + 64);
  MEMORY[0x1F4188790](v88, v5);
  unint64_t v6 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v7 = (char *)&v82 - v6;
  if (qword_1EB5EAB78 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1A8CED1BC((uint64_t)&v82 - v6);
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v10 = (char *)&v82 - v6;
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR___DaemonController_configStore + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v11 + 8))(0x726665527478656ELL, 0xEF65746144687365, ObjectType, v11);
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1A8D59A80();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EB5EAC50);
  v95 = (char *)&v82;
  MEMORY[0x1F4188790](v14, v15);
  unint64_t v16 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = sub_1A8CB249C((uint64_t)v7, (uint64_t)&v82 - v16, &qword_1EB5EACF0);
  v93 = &v82;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v94 = v10;
  sub_1A8CB249C((uint64_t)v10, (uint64_t)&v82 - v16, &qword_1EB5EACF0);
  uint64_t v86 = (void (*)(char *, uint64_t, uint64_t))v14;
  uint64_t v19 = sub_1A8D59A60();
  os_log_type_t v20 = sub_1A8D59F00();
  int v21 = v20;
  char v91 = v19;
  BOOL v22 = os_log_type_enabled(v19, v20);
  uint64_t v89 = &v82;
  v90 = a2;
  v92 = v7;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v85 = v24;
    BOOL v97 = (void *)v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    MEMORY[0x1F4188790](v24, v25);
    sub_1A8CB249C((uint64_t)&v82 - v16, (uint64_t)&v82 - v16, &qword_1EB5EACF0);
    LODWORD(v84) = v21;
    uint64_t v26 = sub_1A8D59C40();
    uint64_t v96 = sub_1A8C90120(v26, v27, (uint64_t *)&v97);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_1A8C8DE74((uint64_t)&v82 - v16, &qword_1EB5EACF0);
    *(_WORD *)(v23 + 12) = 2080;
    MEMORY[0x1F4188790](v28, v29);
    sub_1A8CB249C((uint64_t)&v82 - v16, (uint64_t)&v82 - v16, &qword_1EB5EACF0);
    uint64_t v30 = sub_1A8D59C40();
    uint64_t v96 = sub_1A8C90120(v30, v31, (uint64_t *)&v97);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    sub_1A8C8DE74((uint64_t)&v82 - v16, &qword_1EB5EACF0);
    uint64_t v32 = v91;
    _os_log_impl(&dword_1A8C7F000, v91, (os_log_type_t)v84, "existing cache first feature expiry: %s next alllowed retry: %s", (uint8_t *)v23, 0x16u);
    uint64_t v33 = v85;
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v33, -1, -1);
    uint64_t v34 = v23;
    id v7 = v92;
    MEMORY[0x1AD0E6EB0](v34, -1, -1);
  }
  else
  {
    sub_1A8C8DE74((uint64_t)&v82 - v16, &qword_1EB5EACF0);
    sub_1A8C8DE74((uint64_t)&v82 - v16, &qword_1EB5EACF0);
  }
  uint64_t v35 = sub_1A8D596F0();
  char v91 = &v82;
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35, v37);
  v93 = v38;
  v95 = (char *)&v82 - (((unint64_t)v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9488);
  uint64_t v41 = MEMORY[0x1F4188790](v39 - 8, v40);
  uint64_t v43 = (char *)&v82 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = (uint64_t)&v43[*(int *)(v41 + 56)];
  sub_1A8CB249C((uint64_t)v7, (uint64_t)v43, &qword_1EB5EACF0);
  sub_1A8CB249C((uint64_t)v94, v44, &qword_1EB5EACF0);
  uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  int v46 = v45(v43, 1, v35);
  uint64_t v47 = v45((char *)v44, 1, v35);
  if (v46 == 1)
  {
    if (v47 == 1)
    {
      sub_1A8C8DE74((uint64_t)v94, &qword_1EB5EACF0);
      sub_1A8C8DE74((uint64_t)v7, &qword_1EB5EACF0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v90, 1, 1, v35);
      return;
    }
    uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 32);
    v49(v95, v44, v35);
  }
  else if (v47 == 1)
  {
    uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 32);
    v49(v95, (uint64_t)v43, v35);
  }
  else
  {
    uint64_t v84 = &v82;
    uint64_t v50 = v93;
    MEMORY[0x1F4188790](v47, v48);
    uint64_t v51 = (char *)&v82 - (((unint64_t)v50 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v88 = &v82;
    uint64_t v52 = *(uint64_t (**)(char *, char *, uint64_t))(v36 + 32);
    uint64_t v53 = v52(v51, v43, v35);
    v83 = &v82;
    uint64_t v49 = (void (*)(char *, uint64_t, uint64_t))v52;
    MEMORY[0x1F4188790](v53, v54);
    v52(v51, (char *)v44, v35);
    sub_1A8D3F9D0((unint64_t *)&unk_1EB5E92C0, MEMORY[0x1F418BA08]);
    if (sub_1A8D59B90()) {
      uint64_t v55 = v51;
    }
    else {
      uint64_t v55 = v51;
    }
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v95, v55, v35);
    uint64_t v56 = *(void (**)(char *, uint64_t))(v36 + 8);
    v56(v51, v35);
    v56(v51, v35);
  }
  xpc_object_t empty = xpc_activity_copy_criteria(v87);
  if (!empty)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E4F142C0], (const char *)*MEMORY[0x1E4F142E8]);
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14140], 1);
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14300], 0);
    if (!*MEMORY[0x1E4F14338])
    {
LABEL_29:
      __break(1u);
      return;
    }
    xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E4F14338], 1);
  }
  int64_t int64 = xpc_dictionary_get_int64(empty, (const char *)*MEMORY[0x1E4F14178]);
  int64_t v59 = xpc_dictionary_get_int64(empty, (const char *)*MEMORY[0x1E4F141B0]);
  if (__OFADD__(int64, v59))
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v88 = &v82;
  uint64_t v61 = v93;
  MEMORY[0x1F4188790](v59, v60);
  uint64_t v62 = (char *)&v82 - (((unint64_t)v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1A8D59670();
  xpc_activity_t v87 = (xpc_activity_t)&v82;
  MEMORY[0x1F4188790](v63, v64);
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v62, v62, v35);
  uint64_t v65 = sub_1A8D59A60();
  os_log_type_t v66 = sub_1A8D59F00();
  BOOL v67 = os_log_type_enabled(v65, v66);
  uint64_t v85 = v36;
  if (v67)
  {
    uint64_t v68 = swift_slowAlloc();
    uint64_t v86 = v49;
    unint64_t v69 = (uint8_t *)v68;
    uint64_t v84 = (uint64_t *)swift_slowAlloc();
    BOOL v97 = v84;
    *(_DWORD *)unint64_t v69 = 136315138;
    v83 = (uint64_t *)(v69 + 4);
    sub_1A8D3F9D0((unint64_t *)&qword_1EB5E92D0, MEMORY[0x1F418BA08]);
    uint64_t v70 = sub_1A8D5A360();
    uint64_t v96 = sub_1A8C90120(v70, v71, (uint64_t *)&v97);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    long long v72 = *(void (**)(char *, uint64_t))(v36 + 8);
    v72(v62, v35);
    _os_log_impl(&dword_1A8C7F000, v65, v66, "earliest allowed time to rebuild cache: %s", v69, 0xCu);
    long long v73 = v84;
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v73, -1, -1);
    v74 = v69;
    uint64_t v49 = v86;
    MEMORY[0x1AD0E6EB0](v74, -1, -1);
  }
  else
  {
    long long v72 = *(void (**)(char *, uint64_t))(v36 + 8);
    v72(v62, v35);
  }

  MEMORY[0x1F4188790](v75, v76);
  v78 = (char *)&v82 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D596D0();
  char v79 = sub_1A8D59650();
  swift_unknownObjectRelease();
  v72(v78, v35);
  v72(v62, v35);
  sub_1A8C8DE74((uint64_t)v94, &qword_1EB5EACF0);
  sub_1A8C8DE74((uint64_t)v92, &qword_1EB5EACF0);
  if (v79)
  {
    uint64_t v80 = v85;
    v81 = v90;
    v49(v90, (uint64_t)v95, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(v81, 0, 1, v35);
  }
  else
  {
    v72(v95, v35);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56))(v90, 1, 1, v35);
  }
}

id DaemonController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DaemonController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A8D3E32C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1A8C90B9C(a2, a3);
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
    sub_1A8CF27D8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1A8CF1ED0(v15, a4 & 1);
  unint64_t v21 = sub_1A8C90B9C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1A8D5A400();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
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

void (*sub_1A8D3E49C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1A8D3E54C(v6, a2, a3);
  return sub_1A8D3E504;
}

void sub_1A8D3E504(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1A8D3E54C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1AD0E6030](a2, a3);
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
    return sub_1A8D3E5CC;
  }
  __break(1u);
  return result;
}

void sub_1A8D3E5CC(id *a1)
{
}

uint64_t sub_1A8D3E5D4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 24) = a1;
  id v7 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 32) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1A8D3FD50;
  return v7(v4 + 16);
}

id sub_1A8D3E6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v24[3] = sub_1A8C8EB1C(0, &qword_1EB5E9390);
  v24[4] = &off_1EFF551B0;
  v24[0] = a3;
  uint64_t v10 = type metadata accessor for AvailabilityClient();
  v23[3] = v10;
  v23[4] = &off_1EFF56BB8;
  v23[0] = a5;
  char v11 = (objc_class *)type metadata accessor for FeatureRequestHandler();
  unint64_t v12 = (char *)objc_allocWithZone(v11);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v10);
  MEMORY[0x1F4188790](v13, v13);
  uint64_t v15 = (uint64_t *)((char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = *v15;
  v22[3] = v10;
  v22[4] = &off_1EFF56BB8;
  v22[0] = v17;
  *(void *)&v12[OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_taskLimiters] = a1;
  *(void *)&v12[OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_geoCache] = a2;
  sub_1A8C91CA8((uint64_t)v24, (uint64_t)&v12[OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_accountStore]);
  *(void *)&v12[OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_urlSession] = a4;
  sub_1A8C91CA8((uint64_t)v22, (uint64_t)&v12[OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_availabilityClient]);
  v21.receiver = v12;
  v21.super_class = v11;
  id v18 = objc_msgSendSuper2(&v21, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  return v18;
}

void sub_1A8D3E890()
{
  if (qword_1EB5E97C8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A8D59A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5E97A8);
  uint64_t v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59F00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    aBlock[0] = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    v18[1] = sub_1A8C90120(0xD000000000000014, 0x80000001A8D67050, aBlock);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v1, v2, "Registering for background task %s.", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v4, -1, -1);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }

  sub_1A8C8EB1C(0, (unint64_t *)&qword_1EB5E93A0);
  uint64_t v5 = sub_1A8D59B10();
  MEMORY[0x1F4188790](v5 - 8, v6);
  sub_1A8D59B00();
  uint64_t v7 = sub_1A8D59F10();
  MEMORY[0x1F4188790](v7, v8);
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1A8D3F9D0(&qword_1EB5E9398, MEMORY[0x1F41AB078]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9380);
  sub_1A8D3FA18();
  sub_1A8D5A030();
  uint64_t v9 = sub_1A8D59F20();
  MEMORY[0x1F4188790](v9, v10);
  (*(void (**)(char *, void))(v12 + 104))((char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FBCC50]);
  uint64_t v13 = (void *)sub_1A8D59F40();
  id v14 = objc_msgSend(self, sel_sharedScheduler);
  uint64_t v15 = (void *)sub_1A8D59BC0();
  aBlock[4] = (uint64_t)sub_1A8D38B94;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A8D38BF8;
  aBlock[3] = (uint64_t)&block_descriptor_100;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v13;
  objc_msgSend(v14, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v15, v17, v16);
  _Block_release(v16);
}

uint64_t sub_1A8D3ECE4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A8D59E10();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1A8C8DE74((uint64_t)v3, &qword_1EB5EAEA0);
  }
  else
  {
    sub_1A8D59E00();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (*(void *)(v6 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v7 = sub_1A8D59DC0();
      uint64_t v9 = v8;
      swift_unknownObjectRelease();
      if (v9 | v7)
      {
        v11[0] = 0;
        v11[1] = 0;
        v11[2] = v7;
        v11[3] = v9;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

void sub_1A8D3EEF4(void *a1, int64_t a2, int64_t a3)
{
  xpc_dictionary_set_int64(a1, (const char *)*MEMORY[0x1E4F141B0], a3);
  xpc_dictionary_set_int64(a1, (const char *)*MEMORY[0x1E4F14178], a2);
  if (qword_1EB5EAD00 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1A8D59A80();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB5EAC50);
  os_log_t oslog = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59F00();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315650;
    sub_1A8C90120(0xD000000000000022, 0x80000001A8D66F80, &v10);
    sub_1A8D59FE0();
    *(_WORD *)(v7 + 12) = 2050;
    sub_1A8D59FE0();
    *(_WORD *)(v7 + 22) = 2050;
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, oslog, v6, "activity %s, delay: %{public}lld, grace: %{public}lld", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v8, -1, -1);
    MEMORY[0x1AD0E6EB0](v7, -1, -1);
  }
  else
  {
  }
}

uint64_t method lookup function for DaemonController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DaemonController);
}

uint64_t dispatch thunk of DaemonController.__allocating_init(session:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of DaemonController.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

unint64_t sub_1A8D3F170()
{
  unint64_t result = qword_1E979F8E0;
  if (!qword_1E979F8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979F8E0);
  }
  return result;
}

uint64_t sub_1A8D3F1C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E979F8E8 + dword_1E979F8E8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1A8D3F294()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1A8D3F2DC()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1A8C81994;
  *(_OWORD *)(v2 + 64) = v3;
  return MEMORY[0x1F4188298](sub_1A8D3AC84, 0, 0);
}

uint64_t sub_1A8D3F388()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1A8D3F3C0(_xpc_activity_s *a1)
{
}

uint64_t sub_1A8D3F3C8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A8D3F408()
{
  uint64_t v2 = *(void *)(v0 + 32);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_1A8C81A88;
  v3[2] = v2;
  return MEMORY[0x1F4188298](sub_1A8D3804C, 0, 0);
}

uint64_t sub_1A8D3F4B4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1A8C81A88;
  *(void *)(v3 + 96) = v2;
  *(_OWORD *)(v3 + 80) = v4;
  uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_1E979E750 + dword_1E979E750);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 104) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1A8D385BC;
  return v7();
}

uint64_t sub_1A8D3F5B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E979F930 + dword_1E979F930);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1A8D3F684(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E979F950 + dword_1E979F950);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1A8D3F754(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E979F970 + dword_1E979F970);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1A8D3F824(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E979F990 + dword_1E979F990);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1A8D3F8F4()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A8D3F92C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A8C81994;
  return MEMORY[0x1F4188298](sub_1A8D39BE8, 0, 0);
}

uint64_t sub_1A8D3F9D0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A8D3FA18()
{
  unint64_t result = qword_1EB5E9388;
  if (!qword_1EB5E9388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB5E9380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9388);
  }
  return result;
}

uint64_t sub_1A8D3FA74()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t objectdestroy_41Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A8D3FAF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1A8C81A88;
  return sub_1A8D38E4C(a1, v4, v5, v6);
}

uint64_t sub_1A8D3FBA4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unsigned char *storeEnumTagSinglePayload for PreemptiveCaching(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D3FCACLL);
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

ValueMetadata *type metadata accessor for PreemptiveCaching()
{
  return &type metadata for PreemptiveCaching;
}

unint64_t sub_1A8D3FCE8()
{
  unint64_t result = qword_1E979FA10;
  if (!qword_1E979FA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA10);
  }
  return result;
}

uint64_t sub_1A8D3FD58(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (a2 && (a1 == a4 && a5 == a2 || (sub_1A8D5A390() & 1) != 0)) {
    return 1;
  }
  if (qword_1EB5EAB38 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1A8D59A80();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EB5EAB48);
  swift_bridgeObjectRetain_n();
  id v12 = a3;
  swift_bridgeObjectRetain_n();
  id v13 = v12;
  id v14 = sub_1A8D59A60();
  os_log_type_t v15 = sub_1A8D59F00();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v20 = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    swift_bridgeObjectRetain();
    sub_1A8C90120(a4, a5, &v20);
    sub_1A8D59FE0();

    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    if (a2) {
      uint64_t v18 = a1;
    }
    else {
      uint64_t v18 = 7104878;
    }
    if (a2) {
      unint64_t v19 = a2;
    }
    else {
      unint64_t v19 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1A8C90120(v18, v19, &v20);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A8C7F000, v14, v15, "invalid geoclassification cache, altDSID changed. Cache altDSID: %s, currentAltDSID: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v17, -1, -1);
    MEMORY[0x1AD0E6EB0](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

void sub_1A8D3FFF0(uint64_t *a1, void *a2, char *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = &a3[OBJC_IVAR____TtC25CloudSubscriptionFeatures21GeoClassificationInfo_cacheTill];
  uint64_t v11 = sub_1A8D596F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  os_log_type_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D596E0();
  char v16 = sub_1A8D59650();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  if (v16)
  {
    sub_1A8D59420();
    swift_allocObject();
    sub_1A8D59410();
    uint64_t v17 = sub_1A8D593E0();
    MEMORY[0x1F4188790](v17, v18);
    (*(void (**)(char *, void))(v20 + 104))((char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F26D18]);
    sub_1A8D593F0();
    uint64_t v57 = a3;
    uint64_t v58 = a4;
    unint64_t v59 = a5;
    sub_1A8D40B6C();
    uint64_t v21 = sub_1A8D59400();
    uint64_t v31 = a4;
    uint64_t v32 = v21;
    unint64_t v34 = v33;
    uint64_t v52 = v31;
    uint64_t v53 = v10;
    swift_release();
    uint64_t v55 = v32;
    unint64_t v56 = v34;
    uint64_t v35 = (void *)sub_1A8D595B0();
    uint64_t v36 = a1[1];
    uint64_t v57 = (char *)*a1;
    uint64_t v58 = v36;
    swift_bridgeObjectRetain();
    sub_1A8D59CA0();
    swift_bridgeObjectRetain();
    sub_1A8D59CA0();
    swift_bridgeObjectRelease();
    sub_1A8D59CA0();
    swift_bridgeObjectRetain();
    sub_1A8D59CA0();
    swift_bridgeObjectRelease();
    uint64_t v37 = (void *)sub_1A8D59BC0();
    swift_bridgeObjectRelease();
    objc_msgSend(a2, sel_setObject_forKey_, v35, v37);

    if (qword_1EB5EAB38 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_1A8D59A80();
    __swift_project_value_buffer(v38, (uint64_t)qword_1EB5EAB48);
    uint64_t v39 = a3;
    swift_bridgeObjectRetain_n();
    uint64_t v40 = v39;
    uint64_t v41 = sub_1A8D59A60();
    os_log_type_t v42 = sub_1A8D59F00();
    uint64_t v54 = v41;
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v57 = (char *)v51;
      *(_DWORD *)uint64_t v43 = 138412802;
      uint64_t v60 = (uint64_t)v40;
      uint64_t v45 = v40;
      sub_1A8D59FE0();
      *uint64_t v44 = v40;

      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_1A8C90120(v52, a5, (uint64_t *)&v57);
      sub_1A8D59FE0();

      swift_bridgeObjectRelease_n();
      *(_WORD *)(v43 + 22) = 2082;
      sub_1A8D12710();
      uint64_t v46 = sub_1A8D5A360();
      uint64_t v60 = sub_1A8C90120(v46, v47, (uint64_t *)&v57);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      uint64_t v48 = v54;
      _os_log_impl(&dword_1A8C7F000, v54, v42, "updating geoclassification cache with info: %@, altDSID: %s, ttl:%{public}s", (uint8_t *)v43, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAED0);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v44, -1, -1);
      uint64_t v49 = v51;
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v49, -1, -1);
      MEMORY[0x1AD0E6EB0](v43, -1, -1);
      sub_1A8C93C98(v55, v56);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      sub_1A8C93C98(v55, v56);
    }
  }
  else
  {
    if (qword_1EB5EAB38 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1A8D59A80();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EB5EAB48);
    uint64_t v23 = a3;
    swift_bridgeObjectRetain_n();
    uint64_t v24 = v23;
    BOOL v25 = sub_1A8D59A60();
    os_log_type_t v26 = sub_1A8D59EE0();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v57 = (char *)v28;
      *(_DWORD *)unint64_t v27 = 136315138;
      sub_1A8D12710();
      uint64_t v29 = sub_1A8D5A360();
      uint64_t v60 = sub_1A8C90120(v29, v30, (uint64_t *)&v57);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v25, v26, "cacheTill value is in the past: %s, will not cache this geoclassification", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v28, -1, -1);
      MEMORY[0x1AD0E6EB0](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1A8D4089C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FA30);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D41030();
  sub_1A8D5A510();
  uint64_t v16 = a2;
  char v15 = 0;
  type metadata accessor for GeoClassificationInfo();
  sub_1A8CF5BB0(&qword_1E979F128);
  sub_1A8D5A340();
  if (!v4)
  {
    char v14 = 1;
    sub_1A8D5A320();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1A8D40A48()
{
  if (*v0) {
    return 0x44495344746C61;
  }
  else {
    return 0x6F666E496F6567;
  }
}

uint64_t sub_1A8D40A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D41084(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D40AA4(uint64_t a1)
{
  unint64_t v2 = sub_1A8D41030();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D40AE0(uint64_t a1)
{
  unint64_t v2 = sub_1A8D41030();
  return MEMORY[0x1F41862B0](a1, v2);
}

id sub_1A8D40B1C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = sub_1A8D41178(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A8D40B4C(void *a1)
{
  return sub_1A8D4089C(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_1A8D40B6C()
{
  unint64_t result = qword_1E979FA20;
  if (!qword_1E979FA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA20);
  }
  return result;
}

uint64_t sub_1A8D40BC0(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v16 = v4;
  uint64_t v17 = v3;
  swift_bridgeObjectRetain();
  sub_1A8D59CA0();
  swift_bridgeObjectRetain();
  sub_1A8D59CA0();
  swift_bridgeObjectRelease();
  sub_1A8D59CA0();
  swift_bridgeObjectRetain();
  sub_1A8D59CA0();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(a2, sel_dataForKey_, v5);

  if (!v6) {
    return 0;
  }
  uint64_t v7 = sub_1A8D595D0();
  unint64_t v9 = v8;

  sub_1A8D593A0();
  swift_allocObject();
  sub_1A8CA17BC(v7, v9);
  sub_1A8D59390();
  uint64_t v10 = sub_1A8D59360();
  MEMORY[0x1F4188790](v10, v11);
  (*(void (**)(char *, void))(v13 + 104))((char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F26CA0]);
  sub_1A8D59370();
  sub_1A8D40E18();
  sub_1A8D59380();
  sub_1A8C93C98(v7, v9);
  swift_release();
  sub_1A8C93C98(v7, v9);
  return v16;
}

unint64_t sub_1A8D40E18()
{
  unint64_t result = qword_1E979FA28;
  if (!qword_1E979FA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA28);
  }
  return result;
}

uint64_t destroy for GeoCacheBox(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s25CloudSubscriptionFeatures11GeoCacheBoxVwCP_0(void *a1, uint64_t a2)
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

uint64_t assignWithCopy for GeoCacheBox(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for GeoCacheBox(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoCacheBox(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GeoCacheBox(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoCacheBox()
{
  return &type metadata for GeoCacheBox;
}

unint64_t sub_1A8D41030()
{
  unint64_t result = qword_1E979FA38;
  if (!qword_1E979FA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA38);
  }
  return result;
}

uint64_t sub_1A8D41084(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F666E496F6567 && a2 == 0xE700000000000000;
  if (v2 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44495344746C61 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id sub_1A8D41178(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FA40);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v8 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v8);
  sub_1A8D41030();
  sub_1A8D5A4F0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    type metadata accessor for GeoClassificationInfo();
    v10[7] = 0;
    sub_1A8CF5BB0(&qword_1E979F0F0);
    sub_1A8D5A2B0();
    v10[6] = 1;
    id v8 = v11;
    sub_1A8D5A290();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v8;
}

unsigned char *storeEnumTagSinglePayload for GeoCacheBox.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D41470);
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

ValueMetadata *type metadata accessor for GeoCacheBox.CodingKeys()
{
  return &type metadata for GeoCacheBox.CodingKeys;
}

unint64_t sub_1A8D414AC()
{
  unint64_t result = qword_1E979FA48;
  if (!qword_1E979FA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA48);
  }
  return result;
}

unint64_t sub_1A8D41504()
{
  unint64_t result = qword_1E979FA50;
  if (!qword_1E979FA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA50);
  }
  return result;
}

unint64_t sub_1A8D4155C()
{
  unint64_t result = qword_1E979FA58;
  if (!qword_1E979FA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA58);
  }
  return result;
}

id static GMEligibilityBypass.bypass.getter()
{
  if ((sub_1A8D419C0() & 1) == 0) {
    return 0;
  }
  if (qword_1EB5E9FA8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB5E9F98;
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_1A8D41654()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2) {
    id v2 = objc_msgSend(self, sel_standardUserDefaults);
  }
  qword_1EB5E9F98 = (uint64_t)v2;
}

void static GMEligibilityBypass.bypass.setter(char a1)
{
  if (sub_1A8D419C0())
  {
    if (qword_1EB5E9FA8 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_1EB5E9F98;
    id v3 = (id)sub_1A8D59BC0();
    objc_msgSend(v2, sel_setBool_forKey_, a1 & 1, v3);
  }
}

void (*static GMEligibilityBypass.bypass.modify(unsigned __int8 *a1))(unsigned __int8 *a1)
{
  if (sub_1A8D419C0())
  {
    if (qword_1EB5E9FA8 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_1EB5E9F98;
    id v3 = (void *)sub_1A8D59BC0();
    unsigned __int8 v4 = objc_msgSend(v2, sel_BOOLForKey_, v3);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  *a1 = v4;
  return sub_1A8D41880;
}

void sub_1A8D41880(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  if (sub_1A8D419C0())
  {
    if (qword_1EB5E9FA8 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_1EB5E9F98;
    id v3 = (id)sub_1A8D59BC0();
    objc_msgSend(v2, sel_setBool_forKey_, v1);
  }
}

id GMEligibilityBypass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMEligibilityBypass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A8D419C0()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    sub_1A8D59BF0();

    sub_1A8D59C50();
    swift_bridgeObjectRelease();
  }
  uint64_t has_internal_ui = os_variant_has_internal_ui();
  swift_unknownObjectRelease();
  return has_internal_ui;
}

uint64_t type metadata accessor for GMEligibilityBypass()
{
  return self;
}

uint64_t sub_1A8D41A98(unint64_t a1)
{
  uint64_t v50 = (void *)MEMORY[0x1E4FBC868];
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_1A8D5A1C0())
  {
    uint64_t v47 = v2;
    uint64_t v3 = 0;
    unsigned __int8 v4 = (void *)MEMORY[0x1E4FBC868];
    __n128 v5 = (__n128)xmmword_1A8D5F770;
    if ((a1 & 0xC000000000000001) != 0)
    {
      while (1)
      {
        uint64_t v8 = MEMORY[0x1AD0E6030](v3, a1, v5);
        uint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          break;
        }
        uint64_t v10 = v8;
        uint64_t v12 = *(void *)(v8 + OBJC_IVAR___CloudFeature_featureID);
        uint64_t v11 = *(void *)(v8 + OBJC_IVAR___CloudFeature_featureID + 8);
        swift_bridgeObjectRetain();
        unint64_t v14 = sub_1A8C90B9C(v12, v11);
        uint64_t v15 = v4[2];
        BOOL v16 = (v13 & 1) == 0;
        uint64_t v17 = v15 + v16;
        if (__OFADD__(v15, v16)) {
          goto LABEL_32;
        }
        char v18 = v13;
        if (v4[3] < v17)
        {
          sub_1A8CF18A8(v17, 1);
          unsigned __int8 v4 = v50;
          unint64_t v19 = sub_1A8C90B9C(v12, v11);
          if ((v18 & 1) != (v20 & 1)) {
            goto LABEL_40;
          }
          unint64_t v14 = v19;
        }
        if (v18)
        {
          uint64_t v6 = swift_bridgeObjectRelease();
          uint64_t v7 = (void *)(v4[7] + 8 * v14);
          MEMORY[0x1AD0E5C70](v6);
          if (*(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1A8D59D80();
          }
          sub_1A8D59DA0();
          sub_1A8D59D70();
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EA118);
          uint64_t v21 = swift_allocObject();
          *(_OWORD *)(v21 + 16) = xmmword_1A8D5F770;
          *(void *)(v21 + 32) = v10;
          uint64_t v48 = v21;
          sub_1A8D59D70();
          v4[(v14 >> 6) + 8] |= 1 << v14;
          uint64_t v22 = (uint64_t *)(v4[6] + 16 * v14);
          *uint64_t v22 = v12;
          v22[1] = v11;
          *(void *)(v4[7] + 8 * v14) = v48;
          uint64_t v23 = v4[2];
          BOOL v24 = __OFADD__(v23, 1);
          uint64_t v25 = v23 + 1;
          if (v24) {
            goto LABEL_35;
          }
          v4[2] = v25;
        }
        ++v3;
        if (v9 == v47) {
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_32:
      __break(1u);
    }
    else
    {
      while (1)
      {
        uint64_t v28 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          break;
        }
        uint64_t v29 = *(char **)(a1 + 8 * v3 + 32);
        uint64_t v31 = *(void *)&v29[OBJC_IVAR___CloudFeature_featureID];
        uint64_t v30 = *(void *)&v29[OBJC_IVAR___CloudFeature_featureID + 8];
        uint64_t v32 = v29;
        swift_bridgeObjectRetain();
        unint64_t v34 = sub_1A8C90B9C(v31, v30);
        uint64_t v35 = v4[2];
        BOOL v36 = (v33 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36)) {
          goto LABEL_34;
        }
        char v38 = v33;
        if (v4[3] < v37)
        {
          sub_1A8CF18A8(v37, 1);
          unsigned __int8 v4 = v50;
          unint64_t v39 = sub_1A8C90B9C(v31, v30);
          if ((v38 & 1) != (v40 & 1))
          {
LABEL_40:
            uint64_t result = sub_1A8D5A400();
            __break(1u);
            return result;
          }
          unint64_t v34 = v39;
        }
        if (v38)
        {
          uint64_t v26 = swift_bridgeObjectRelease();
          unint64_t v27 = (void *)(v4[7] + 8 * v34);
          MEMORY[0x1AD0E5C70](v26);
          if (*(void *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1A8D59D80();
          }
          sub_1A8D59DA0();
          sub_1A8D59D70();
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EA118);
          uint64_t v41 = swift_allocObject();
          *(_OWORD *)(v41 + 16) = xmmword_1A8D5F770;
          *(void *)(v41 + 32) = v32;
          uint64_t v49 = v41;
          sub_1A8D59D70();
          v4[(v34 >> 6) + 8] |= 1 << v34;
          os_log_type_t v42 = (uint64_t *)(v4[6] + 16 * v34);
          uint64_t *v42 = v31;
          v42[1] = v30;
          *(void *)(v4[7] + 8 * v34) = v49;
          uint64_t v43 = v4[2];
          BOOL v24 = __OFADD__(v43, 1);
          uint64_t v44 = v43 + 1;
          if (v24) {
            goto LABEL_36;
          }
          v4[2] = v44;
        }
        ++v3;
        if (v28 == v47)
        {
LABEL_30:
          swift_bridgeObjectRelease();
          goto LABEL_39;
        }
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  unsigned __int8 v4 = (void *)MEMORY[0x1E4FBC868];
LABEL_39:
  uint64_t v45 = sub_1A8D41EB4((uint64_t)v4);
  swift_release();
  return v45;
}

uint64_t sub_1A8D41EB4(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v36 = MEMORY[0x1E4FBC868];
  uint64_t v37 = MEMORY[0x1E4FBC868];
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  int64_t v34 = v6;
  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v11 >= v6) {
    goto LABEL_46;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v6) {
      goto LABEL_46;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v6) {
        goto LABEL_46;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v6) {
          goto LABEL_46;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v6)
          {
            unint64_t v12 = *(void *)(v2 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_23;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_49;
              }
              if (v13 >= v6) {
                break;
              }
              unint64_t v12 = *(void *)(v2 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_23;
              }
            }
          }
LABEL_46:
          sub_1A8C9A664();
          return v36;
        }
      }
    }
  }
LABEL_23:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    unint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t result = sub_1A8D5A1C0();
      if (!result)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        if (!v5) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      uint64_t result = swift_bridgeObjectRetain();
      if (!v19) {
        goto LABEL_6;
      }
    }
    if ((v18 & 0xC000000000000001) != 0)
    {
      char v20 = (char *)MEMORY[0x1AD0E6030](0, v18);
    }
    else
    {
      if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_50;
      }
      char v20 = (char *)*(id *)(v18 + 32);
    }
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v22 = &v21[OBJC_IVAR___CloudFeature_canUse];
    swift_beginAccess();
    char v35 = *v22;

    unint64_t v23 = *(void *)(v36 + 16);
    if (*(void *)(v36 + 24) <= v23) {
      sub_1A8CF159C(v23 + 1, 1);
    }
    sub_1A8D5A4A0();
    sub_1A8D59C80();
    uint64_t result = sub_1A8D5A4D0();
    uint64_t v24 = v37 + 64;
    uint64_t v36 = v37;
    uint64_t v25 = -1 << *(unsigned char *)(v37 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v37 + 64 + 8 * (v26 >> 6))) == 0) {
      break;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v37 + 64 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    int64_t v6 = v34;
LABEL_41:
    *(void *)(v24 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    char v33 = (void *)(*(void *)(v37 + 48) + 16 * v28);
    *char v33 = v17;
    v33[1] = v16;
    *(unsigned char *)(*(void *)(v37 + 56) + v28) = v35;
    ++*(void *)(v37 + 16);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  char v29 = 0;
  unint64_t v30 = (unint64_t)(63 - v25) >> 6;
  int64_t v6 = v34;
  while (++v27 != v30 || (v29 & 1) == 0)
  {
    BOOL v31 = v27 == v30;
    if (v27 == v30) {
      unint64_t v27 = 0;
    }
    v29 |= v31;
    uint64_t v32 = *(void *)(v24 + 8 * v27);
    if (v32 != -1)
    {
      unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
      goto LABEL_41;
    }
  }
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

id static GMAssetsBypass.gmAssetsBypass()()
{
  if ((sub_1A8D419C0() & 1) == 0) {
    return 0;
  }
  if (qword_1EB5E9F80 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1EB5E9F70;
  id v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_1A8D42318()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  id v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2) {
    id v2 = objc_msgSend(self, sel_standardUserDefaults);
  }
  qword_1EB5E9F70 = (uint64_t)v2;
}

void static GMAssetsBypass.setGMEligibilityBypass(_:)(char a1)
{
  if (sub_1A8D419C0())
  {
    if (qword_1EB5E9F80 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_1EB5E9F70;
    id v3 = (id)sub_1A8D59BC0();
    objc_msgSend(v2, sel_setBool_forKey_, a1 & 1, v3);
  }
}

id GMAssetsBypass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMAssetsBypass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GMAssetsBypass()
{
  return self;
}

uint64_t Eligibility.regionEligible.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CSFEligibility_regionEligible);
}

uint64_t Eligibility.languageEligible.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CSFEligibility_languageEligible);
}

uint64_t Eligibility.siriLanguageEligible.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CSFEligibility_siriLanguageEligible);
}

uint64_t Eligibility.locationEligible.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CSFEligibility_locationEligible);
}

uint64_t Eligibility.deviceEligibile.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CSFEligibility_deviceEligibile);
}

unint64_t sub_1A8D42784()
{
  return 0xD000000000000015;
}

BOOL sub_1A8D428F4()
{
  id v1 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v24 = (void *)MEMORY[0x1E4FBC860];
  if ((*(unsigned char *)(v0 + OBJC_IVAR___CSFEligibility_languageEligible) & 1) == 0)
  {
    id v1 = sub_1A8C9D544(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v3 = v1[2];
    unint64_t v2 = v1[3];
    if (v3 >= v2 >> 1) {
      id v1 = sub_1A8C9D544((void *)(v2 > 1), v3 + 1, 1, v1);
    }
    v1[2] = v3 + 1;
    uint64_t v4 = &v1[2 * v3];
    v4[4] = 0x65676175676E616CLL;
    v4[5] = 0xE800000000000000;
    uint64_t v24 = v1;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___CSFEligibility_regionEligible))
  {
    if (!v1[2])
    {
      if (qword_1EB5E9F68 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_1A8D59A80();
      __swift_project_value_buffer(v5, (uint64_t)qword_1EB5E9DF8);
      int64_t v6 = sub_1A8D59A60();
      os_log_type_t v7 = sub_1A8D59F00();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1A8C7F000, v6, v7, "Device is eligible for GM SPIs.", v8, 2u);
        unint64_t v9 = v8;
LABEL_20:
        MEMORY[0x1AD0E6EB0](v9, -1, -1);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v1 = sub_1A8C9D544(0, v1[2] + 1, 1, v1);
    }
    unint64_t v11 = v1[2];
    unint64_t v10 = v1[3];
    if (v11 >= v10 >> 1) {
      id v1 = sub_1A8C9D544((void *)(v10 > 1), v11 + 1, 1, v1);
    }
    v1[2] = v11 + 1;
    unint64_t v12 = &v1[2 * v11];
    void v12[4] = 0x6E6F69676572;
    v12[5] = 0xE600000000000000;
    uint64_t v24 = v1;
  }
  if (qword_1EB5E9F68 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1A8D59A80();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB5E9DF8);
  int64_t v6 = sub_1A8D59A60();
  os_log_type_t v14 = sub_1A8D59EE0();
  if (os_log_type_enabled(v6, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_beginAccess();
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x1AD0E5CA0](v17, MEMORY[0x1E4FBB1A0]);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    sub_1A8C90120(v18, v20, v23);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A8C7F000, v6, v14, "Device is not eligible for GM SPIs or UI: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v16, -1, -1);
    unint64_t v9 = v15;
    goto LABEL_20;
  }
LABEL_21:

  swift_beginAccess();
  uint64_t v21 = v24[2];
  swift_bridgeObjectRelease();
  return v21 == 0;
}

uint64_t sub_1A8D42C9C(uint64_t a1)
{
  sub_1A8CDEFB8(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for Eligibility();
    if (swift_dynamicCast())
    {
      if (v5[OBJC_IVAR___CSFEligibility_regionEligible] == *(unsigned char *)(v1 + OBJC_IVAR___CSFEligibility_regionEligible)
        && v5[OBJC_IVAR___CSFEligibility_languageEligible] == *(unsigned char *)(v1 + OBJC_IVAR___CSFEligibility_languageEligible)
        && v5[OBJC_IVAR___CSFEligibility_siriLanguageEligible] == *(unsigned char *)(v1
                                                                           + OBJC_IVAR___CSFEligibility_siriLanguageEligible)
        && v5[OBJC_IVAR___CSFEligibility_locationEligible] == *(unsigned char *)(v1 + OBJC_IVAR___CSFEligibility_locationEligible))
      {
        char v4 = v5[OBJC_IVAR___CSFEligibility_deviceEligibile];

        char v2 = v4 ^ *(unsigned char *)(v1 + OBJC_IVAR___CSFEligibility_deviceEligibile) ^ 1;
        return v2 & 1;
      }
    }
  }
  else
  {
    sub_1A8CA2800((uint64_t)v6);
  }
  char v2 = 0;
  return v2 & 1;
}

uint64_t type metadata accessor for Eligibility()
{
  return self;
}

id Eligibility.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Eligibility.init()()
{
}

id Eligibility.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Eligibility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for Eligibility(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Eligibility);
}

uint64_t sub_1A8D42F24(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1A8D42F38(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A8D42F4C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1A8D42F60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_1A8D42F74(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_1A8D42F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

void sub_1A8D42F9C(char *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_domain);
  uint64_t v4 = sub_1A8D59BF0();
  uint64_t v6 = v5;

  if (v4 == sub_1A8D59BF0() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    char v10 = 3;
  }
  else
  {
    char v9 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9)
    {
      char v10 = 3;
    }
    else
    {
      if (qword_1EB5EAEF8 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1A8D59A80();
      __swift_project_value_buffer(v11, (uint64_t)qword_1EB5EAEE0);
      id v12 = v1;
      uint64_t v13 = sub_1A8D59A60();
      os_log_type_t v14 = sub_1A8D59EE0();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v16 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 138412290;
        id v17 = v12;
        sub_1A8D59FE0();
        *uint64_t v16 = v12;

        _os_log_impl(&dword_1A8C7F000, v13, v14, "Unhandled NSError to TicketManagerError: %@", v15, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAED0);
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v16, -1, -1);
        MEMORY[0x1AD0E6EB0](v15, -1, -1);
      }
      else
      {
      }
      char v10 = 0;
    }
  }
  *a1 = v10;
}

uint64_t sub_1A8D431DC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x1E4FBC860];
    sub_1A8CB6294(0, v1, 0);
    uint64_t v2 = v14;
    uint64_t v4 = *(void *)(type metadata accessor for DefaultsMigrator.Migration() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      unint64_t v7 = sub_1A8D437F4();
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_1A8CB6294(v10 > 1, v11 + 1, 1);
      }
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void static DefaultsMigrator.migrate()()
{
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A8D59A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5E9728);
  int64_t v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59F00();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A8C7F000, v1, v2, "Starting migration checks.", v3, 2u);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }

  sub_1A8D44A64();
  static DefaultsMigrator.migrateCFUEngagement()();
  static DefaultsMigrator.migrateOptIn()();
  os_log_t oslog = sub_1A8D59A60();
  os_log_type_t v4 = sub_1A8D59F00();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A8C7F000, oslog, v4, "Finished migration checks.", v5, 2u);
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
  }
}

uint64_t sub_1A8D43494(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A8CF738C(*a1, *a2);
}

uint64_t sub_1A8D434A0()
{
  return sub_1A8D5A4D0();
}

uint64_t sub_1A8D43550()
{
  sub_1A8D59C80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8D435EC()
{
  return sub_1A8D5A4D0();
}

uint64_t sub_1A8D43698@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A8D47FF4();
  *a1 = result;
  return result;
}

void sub_1A8D436C8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA0000000000746ELL;
  unint64_t v4 = 0xED0000746E656D65;
  uint64_t v5 = 0x6761676E45756663;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6E4974706FLL;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6553736148756663;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1A8D43734()
{
  return sub_1A8D59D10();
}

uint64_t sub_1A8D43794()
{
  return sub_1A8D59CF0();
}

void sub_1A8D437E4(void *a1@<X8>)
{
  *a1 = &unk_1EFF53598;
}

unint64_t sub_1A8D437F4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C08]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 4);
  objc_msgSend(v0, sel_setTimeStyle_, 4);
  sub_1A8D5A0C0();
  swift_bridgeObjectRelease();
  sub_1A8D59CA0();
  swift_bridgeObjectRelease();
  sub_1A8D59CA0();
  type metadata accessor for DefaultsMigrator.Migration();
  int64_t v1 = (void *)sub_1A8D59640();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  sub_1A8D59BF0();
  sub_1A8D59CA0();
  swift_bridgeObjectRelease();
  sub_1A8D59CA0();

  return 0xD000000000000012;
}

uint64_t sub_1A8D439B8(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FA88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D47AEC();
  sub_1A8D5A510();
  v11[15] = *v3;
  v11[14] = 0;
  sub_1A8D47B94();
  sub_1A8D5A340();
  if (!v2)
  {
    type metadata accessor for DefaultsMigrator.Migration();
    v11[13] = 1;
    sub_1A8D596F0();
    sub_1A8C93C40((unint64_t *)&unk_1EB5E92B0);
    sub_1A8D5A340();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_1A8D43B68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E98D0);
  uint64_t v4 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25, v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DefaultsMigrator.Migration();
  MEMORY[0x1F4188790](v8, v9);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D47AEC();
  sub_1A8D5A4F0();
  if (!v2)
  {
    uint64_t v23 = v8;
    uint64_t v12 = v4;
    char v27 = 0;
    sub_1A8D47B40();
    uint64_t v13 = v25;
    sub_1A8D5A2B0();
    uint64_t v14 = (uint64_t)v11;
    unsigned char *v11 = v28;
    uint64_t v15 = sub_1A8D596F0();
    uint64_t v22 = &v20;
    uint64_t v21 = *(void *)(v15 - 8);
    MEMORY[0x1F4188790](v15, v16);
    uint64_t v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v26 = 1;
    sub_1A8C93C40(&qword_1EB5EA168);
    sub_1A8D5A2B0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v14 + *(int *)(v23 + 20), v18, v15);
    sub_1A8D46D90(v14, v24);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A8D43E64()
{
  if (*v0) {
    return 1702125924;
  }
  else {
    return 0x646C656966;
  }
}

uint64_t sub_1A8D43E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D48040(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D43EBC(uint64_t a1)
{
  unint64_t v2 = sub_1A8D47AEC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D43EF8(uint64_t a1)
{
  unint64_t v2 = sub_1A8D47AEC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A8D43F34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A8D43B68(a1, a2);
}

uint64_t sub_1A8D43F4C(void *a1)
{
  return sub_1A8D439B8(a1);
}

id sub_1A8D43F68()
{
  id result = sub_1A8D43F88();
  qword_1EB5E9830 = (uint64_t)result;
  return result;
}

id sub_1A8D43F88()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  int64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2) {
    return v2;
  }
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A8D59A80();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB5E9728);
  uint64_t v5 = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59EE0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_1A8C90120(0xD00000000000002ELL, 0x80000001A8D673D0, &v10);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v5, v6, "Unable to create defaults for key %s. Will use .standard.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v8, -1, -1);
    MEMORY[0x1AD0E6EB0](v7, -1, -1);
  }

  id v9 = objc_msgSend(self, sel_standardUserDefaults);
  return v9;
}

uint64_t static DefaultsMigrator.diagnostics()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v0 - 8, v1);
  unint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v7, v10);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = 0;
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v21 = v11;
  do
  {
    sub_1A8D443EC(byte_1EFF533C0[v14 + 32], (uint64_t)v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_1A8C8DE74((uint64_t)v3, &qword_1EB5E9880);
    }
    else
    {
      sub_1A8D46D90((uint64_t)v3, (uint64_t)v13);
      sub_1A8D46D90((uint64_t)v13, (uint64_t)v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v15 = sub_1A8C9DA4C(0, *(void *)(v15 + 16) + 1, 1, v15);
      }
      unint64_t v17 = *(void *)(v15 + 16);
      unint64_t v16 = *(void *)(v15 + 24);
      if (v17 >= v16 >> 1) {
        uint64_t v15 = sub_1A8C9DA4C(v16 > 1, v17 + 1, 1, v15);
      }
      *(void *)(v15 + 16) = v17 + 1;
      sub_1A8D46D90((uint64_t)v9, v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v17);
      uint64_t v4 = v21;
    }
    ++v14;
  }
  while (v14 != 3);
  uint64_t v18 = sub_1A8D431DC(v15);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1A8D443EC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB5E9838 != -1) {
    swift_once();
  }
  unint64_t v9 = 0xEA0000000000746ELL;
  uint64_t v10 = (void *)qword_1EB5E9830;
  uint64_t v11 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_dataForKey_, v11);

  if (v12)
  {
    uint64_t v13 = sub_1A8D595D0();
    unint64_t v15 = v14;

    sub_1A8D59500();
    swift_allocObject();
    sub_1A8D594F0();
    sub_1A8D47BE8(&qword_1EB5E9868);
    uint64_t v16 = 0;
    sub_1A8D594E0();
    sub_1A8C93C98(v13, v15);
    swift_release();
    sub_1A8D46D90((uint64_t)v8, a2);
  }
  else
  {
    if (qword_1EB5E9810 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A8D59A80();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB5E9728);
    uint64_t v18 = sub_1A8D59A60();
    os_log_type_t v19 = sub_1A8D59F00();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v25 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v22 = 0x6761676E45756663;
        }
        else {
          uint64_t v22 = 0x6E4974706FLL;
        }
        if (a1 == 1) {
          unint64_t v9 = 0xED0000746E656D65;
        }
        else {
          unint64_t v9 = 0xE500000000000000;
        }
      }
      else
      {
        uint64_t v22 = 0x6553736148756663;
      }
      v24[6] = sub_1A8C90120(v22, v9, &v25);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v18, v19, "Attempted to get existing migration but there is no value for key %s.", v20, 0xCu);
      uint64_t v16 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v21, -1, -1);
      MEMORY[0x1AD0E6EB0](v20, -1, -1);
    }
    else
    {

      uint64_t v16 = 1;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v16, 1, v4);
}

void sub_1A8D44A64()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6, v8);
  uint64_t v63 = (uint64_t)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v13 = (char *)&v61 - v12;
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1A8D59A80();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EB5E9728);
  unint64_t v15 = sub_1A8D59A60();
  os_log_type_t v16 = sub_1A8D59F00();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v61 = v1;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v62 = v13;
    uint64_t v20 = v19;
    v69[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v15, v16, "%s checking if existing migration exists.", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v62;
    MEMORY[0x1AD0E6EB0](v20, -1, -1);
    MEMORY[0x1AD0E6EB0](v18, -1, -1);
  }

  sub_1A8D443EC(0, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1A8C8DE74((uint64_t)v5, &qword_1EB5E9880);
    uint64_t v21 = sub_1A8D59A60();
    os_log_type_t v22 = sub_1A8D59F00();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v69[0] = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v21, v22, "%s Starting migration.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v24, -1, -1);
      MEMORY[0x1AD0E6EB0](v23, -1, -1);
    }

    uint64_t v25 = _s25CloudSubscriptionFeatures8FollowUpCACSgycfC_0();
    if (!v25)
    {
      unint64_t v39 = sub_1A8D59A60();
      os_log_type_t v40 = sub_1A8D59F00();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        v69[0] = v42;
        *(_DWORD *)uint64_t v41 = 136315138;
        v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
        sub_1A8D59FE0();
        _os_log_impl(&dword_1A8C7F000, v39, v40, "%s Unable to get FollowUp object. Will not migrate.", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v42, -1, -1);
        MEMORY[0x1AD0E6EB0](v41, -1, -1);
      }

      goto LABEL_31;
    }
    uint64_t v26 = v25;
    uint64_t v27 = v25 + 96;
    swift_beginAccess();
    sub_1A8CBE710(v27, (uint64_t)v69);
    if (v69[3])
    {
      sub_1A8C91CA8((uint64_t)v69, (uint64_t)v66);
      sub_1A8C8DE74((uint64_t)v69, &qword_1EB5EAD60);
      uint64_t v28 = v67;
      uint64_t v29 = v68;
      __swift_project_boxed_opaque_existential_1(v66, v67);
      if (*(void *)(v26 + 32))
      {
        unint64_t v64 = 0xD000000000000020;
        unint64_t v65 = 0x80000001A8D66CA0;
        sub_1A8D59CA0();
        unint64_t v30 = v64;
        unint64_t v31 = v65;
      }
      else
      {
        unint64_t v30 = 0xD00000000000001FLL;
        unint64_t v31 = 0x80000001A8D66C80;
      }
      char v48 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v29 + 40))(v30, v31, v28, v29);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
      uint64_t v49 = sub_1A8D59A60();
      os_log_type_t v50 = sub_1A8D59F00();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        v69[0] = v52;
        *(_DWORD *)uint64_t v51 = 136315394;
        v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
        sub_1A8D59FE0();
        *(_WORD *)(v51 + 12) = 1024;
        LODWORD(v66[0]) = v48 & 1;
        sub_1A8D59FE0();
        _os_log_impl(&dword_1A8C7F000, v49, v50, "%s Updating value to %{BOOL}d", (uint8_t *)v51, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v52, -1, -1);
        MEMORY[0x1AD0E6EB0](v51, -1, -1);
      }

      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
      MEMORY[0x1F4188790](v53 - 8, v54);
      unint64_t v56 = (char *)&v61 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v48)
      {
        sub_1A8D596E0();
        uint64_t v57 = sub_1A8D596F0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
      }
      else
      {
        uint64_t v58 = sub_1A8D596F0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v56, 1, 1, v58);
      }
      sub_1A8D26A08((uint64_t)v56);
      uint64_t v43 = sub_1A8D59A60();
      os_log_type_t v59 = sub_1A8D59F00();
      if (!os_log_type_enabled(v43, v59)) {
        goto LABEL_30;
      }
      uint64_t v45 = swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v69[0] = v60;
      *(_DWORD *)uint64_t v45 = 136315394;
      v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
      sub_1A8D59FE0();
      *(_WORD *)(v45 + 12) = 1024;
      LODWORD(v66[0]) = v48 & 1;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v43, v59, "%s Updated value to %{BOOL}d", (uint8_t *)v45, 0x12u);
      swift_arrayDestroy();
      uint64_t v47 = v60;
    }
    else
    {
      sub_1A8C8DE74((uint64_t)v69, &qword_1EB5EAD60);
      uint64_t v43 = sub_1A8D59A60();
      os_log_type_t v44 = sub_1A8D59F00();
      if (!os_log_type_enabled(v43, v44))
      {
LABEL_30:

        swift_release();
LABEL_31:
        sub_1A8D473D4(0, 0xD000000000000013, 0x80000001A8D67420);
        return;
      }
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v69[0] = v46;
      *(_DWORD *)uint64_t v45 = 136315138;
      v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v43, v44, "%s Unable to get old value. Will not migrate.", (uint8_t *)v45, 0xCu);
      swift_arrayDestroy();
      uint64_t v47 = v46;
    }
    MEMORY[0x1AD0E6EB0](v47, -1, -1);
    MEMORY[0x1AD0E6EB0](v45, -1, -1);
    goto LABEL_30;
  }
  sub_1A8D46D90((uint64_t)v5, (uint64_t)v13);
  uint64_t v32 = v63;
  sub_1A8D47314((uint64_t)v13, v63);
  char v33 = sub_1A8D59A60();
  os_log_type_t v34 = sub_1A8D59F00();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v69[0] = v36;
    *(_DWORD *)uint64_t v35 = 136315394;
    v66[0] = sub_1A8C90120(0xD000000000000013, 0x80000001A8D67420, v69);
    sub_1A8D59FE0();
    *(_WORD *)(v35 + 12) = 2080;
    unint64_t v37 = sub_1A8D437F4();
    v66[0] = sub_1A8C90120(v37, v38, v69);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    sub_1A8D47378(v32);
    _os_log_impl(&dword_1A8C7F000, v33, v34, "%s Skipping migration, existing migration occurred: %s.", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v36, -1, -1);
    MEMORY[0x1AD0E6EB0](v35, -1, -1);
  }
  else
  {

    sub_1A8D47378(v32);
  }
  sub_1A8D47378((uint64_t)v13);
}

void static DefaultsMigrator.migrateCFUEngagement()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6, v8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v12);
  uint64_t v14 = (char *)&v46 - v13;
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1A8D59A80();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1EB5E9728);
  uint64_t v17 = sub_1A8D59A60();
  os_log_type_t v18 = sub_1A8D59F00();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v47 = v6;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v48 = v1;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v49 = v16;
    os_log_type_t v22 = v14;
    uint64_t v23 = v21;
    uint64_t v51 = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v50 = sub_1A8C90120(0xD000000000000016, 0x80000001A8D67370, &v51);
    uint64_t v6 = v47;
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v17, v18, "%s checking if existing migration exists.", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v23;
    uint64_t v14 = v22;
    MEMORY[0x1AD0E6EB0](v24, -1, -1);
    MEMORY[0x1AD0E6EB0](v20, -1, -1);
  }

  sub_1A8D443EC(1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1A8C8DE74((uint64_t)v5, &qword_1EB5E9880);
    uint64_t v25 = sub_1A8D59A60();
    os_log_type_t v26 = sub_1A8D59F00();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v51 = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v50 = sub_1A8C90120(0xD000000000000016, 0x80000001A8D67370, &v51);
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v25, v26, "%s Starting migration.", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v28, -1, -1);
      MEMORY[0x1AD0E6EB0](v27, -1, -1);
    }

    uint64_t v29 = self;
    id v30 = objc_msgSend(v29, sel_hasEngagedWithCFUGlobalDomain);
    if (v30)
    {
      unint64_t v31 = v30;
      id v32 = objc_msgSend(v30, sel_BOOLValue);

      objc_msgSend(v29, sel_setHasEngagedWithCFU_, v32);
      char v33 = sub_1A8D59A60();
      os_log_type_t v34 = sub_1A8D59F00();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v51 = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v50 = sub_1A8C90120(0xD000000000000016, 0x80000001A8D67370, &v51);
        sub_1A8D59FE0();
        *(_WORD *)(v35 + 12) = 1024;
        LODWORD(v50) = v32;
        sub_1A8D59FE0();
        _os_log_impl(&dword_1A8C7F000, v33, v34, "%s Updated new value to %{BOOL}d", (uint8_t *)v35, 0x12u);
        swift_arrayDestroy();
        uint64_t v37 = v36;
LABEL_17:
        MEMORY[0x1AD0E6EB0](v37, -1, -1);
        MEMORY[0x1AD0E6EB0](v35, -1, -1);
      }
    }
    else
    {
      char v33 = sub_1A8D59A60();
      os_log_type_t v44 = sub_1A8D59F00();
      if (os_log_type_enabled(v33, v44))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        uint64_t v51 = v45;
        *(_DWORD *)uint64_t v35 = 136315138;
        uint64_t v50 = sub_1A8C90120(0xD000000000000016, 0x80000001A8D67370, &v51);
        sub_1A8D59FE0();
        _os_log_impl(&dword_1A8C7F000, v33, v44, "%s Will not migrate value as old one does not exist.", (uint8_t *)v35, 0xCu);
        swift_arrayDestroy();
        uint64_t v37 = v45;
        goto LABEL_17;
      }
    }

    sub_1A8D473D4(1, 0xD000000000000016, 0x80000001A8D67370);
    return;
  }
  sub_1A8D46D90((uint64_t)v5, (uint64_t)v14);
  sub_1A8D47314((uint64_t)v14, (uint64_t)v11);
  unint64_t v38 = sub_1A8D59A60();
  os_log_type_t v39 = sub_1A8D59F00();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v51 = v41;
    *(_DWORD *)uint64_t v40 = 136315394;
    uint64_t v50 = sub_1A8C90120(0xD000000000000016, 0x80000001A8D67370, &v51);
    sub_1A8D59FE0();
    *(_WORD *)(v40 + 12) = 2080;
    unint64_t v42 = sub_1A8D437F4();
    uint64_t v50 = sub_1A8C90120(v42, v43, &v51);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    sub_1A8D47378((uint64_t)v11);
    _os_log_impl(&dword_1A8C7F000, v38, v39, "%s Skipping migration, existing migration occurred: %s.", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v41, -1, -1);
    MEMORY[0x1AD0E6EB0](v40, -1, -1);
  }
  else
  {

    sub_1A8D47378((uint64_t)v11);
  }
  sub_1A8D47378((uint64_t)v14);
}

void static DefaultsMigrator.migrateOptIn()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6, v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v12);
  uint64_t v14 = (char *)&v41 - v13;
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1A8D59A80();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EB5E9728);
  uint64_t v16 = sub_1A8D59A60();
  os_log_type_t v17 = sub_1A8D59F00();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v42 = v6;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v43 = v1;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    os_log_type_t v44 = v14;
    uint64_t v21 = v20;
    uint64_t v46 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v45 = sub_1A8C90120(0x4F6574617267696DLL, 0xEE0029286E497470, &v46);
    uint64_t v6 = v42;
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v16, v17, "%s checking if existing migration exists.", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v21;
    uint64_t v14 = v44;
    MEMORY[0x1AD0E6EB0](v22, -1, -1);
    MEMORY[0x1AD0E6EB0](v19, -1, -1);
  }

  sub_1A8D443EC(2, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1A8C8DE74((uint64_t)v5, &qword_1EB5E9880);
    uint64_t v23 = sub_1A8D59A60();
    os_log_type_t v24 = sub_1A8D59F00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v46 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v45 = sub_1A8C90120(0x4F6574617267696DLL, 0xEE0029286E497470, &v46);
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v23, v24, "%s Starting migration.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v26, -1, -1);
      MEMORY[0x1AD0E6EB0](v25, -1, -1);
    }

    id v27 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
    unsigned __int8 v28 = sub_1A8CB9C0C();

    uint64_t v29 = sub_1A8D59A60();
    os_log_type_t v30 = sub_1A8D59F00();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 67109376;
      id v32 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
      char v33 = sub_1A8CB9D9C();

      LODWORD(v46) = v33 & 1;
      sub_1A8D59FE0();
      *(_WORD *)(v31 + 8) = 1024;
      LODWORD(v46) = v28 & 1;
      sub_1A8D59FE0();
      _os_log_impl(&dword_1A8C7F000, v29, v30, "Updating optedIn (currently %{BOOL}d) to value from global domain: %{BOOL}d.", (uint8_t *)v31, 0xEu);
      MEMORY[0x1AD0E6EB0](v31, -1, -1);
    }

    id v34 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
    sub_1A8CBA100(v28 & 1);

    sub_1A8D473D4(2, 0x4F6574617267696DLL, 0xEE0029286E497470);
  }
  else
  {
    sub_1A8D46D90((uint64_t)v5, (uint64_t)v14);
    sub_1A8D47314((uint64_t)v14, (uint64_t)v11);
    uint64_t v35 = sub_1A8D59A60();
    os_log_type_t v36 = sub_1A8D59F00();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v46 = v38;
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v45 = sub_1A8C90120(0x4F6574617267696DLL, 0xEE0029286E497470, &v46);
      sub_1A8D59FE0();
      *(_WORD *)(v37 + 12) = 2080;
      unint64_t v39 = sub_1A8D437F4();
      uint64_t v45 = sub_1A8C90120(v39, v40, &v46);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      sub_1A8D47378((uint64_t)v11);
      _os_log_impl(&dword_1A8C7F000, v35, v36, "%s Skipping migration, existing migration occurred: %s.", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v38, -1, -1);
      MEMORY[0x1AD0E6EB0](v37, -1, -1);
    }
    else
    {

      sub_1A8D47378((uint64_t)v11);
    }
    sub_1A8D47378((uint64_t)v14);
  }
}

uint64_t static DefaultsMigrator.resetMigrations()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v7, v10);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = 0;
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v21 = v11;
  do
  {
    sub_1A8D46654(byte_1EFF533E8[v14 + 32], (uint64_t)v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_1A8C8DE74((uint64_t)v3, &qword_1EB5E9880);
    }
    else
    {
      sub_1A8D46D90((uint64_t)v3, (uint64_t)v13);
      sub_1A8D46D90((uint64_t)v13, (uint64_t)v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v15 = sub_1A8C9DA4C(0, *(void *)(v15 + 16) + 1, 1, v15);
      }
      unint64_t v17 = *(void *)(v15 + 16);
      unint64_t v16 = *(void *)(v15 + 24);
      if (v17 >= v16 >> 1) {
        uint64_t v15 = sub_1A8C9DA4C(v16 > 1, v17 + 1, 1, v15);
      }
      *(void *)(v15 + 16) = v17 + 1;
      sub_1A8D46D90((uint64_t)v9, v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v17);
      uint64_t v4 = v21;
    }
    ++v14;
  }
  while (v14 != 3);
  uint64_t v18 = sub_1A8D431DC(v15);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1A8D46654@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9880);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D443EC(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1A8C8DE74((uint64_t)v7, &qword_1EB5E9880);
    if (qword_1EB5E9810 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A8D59A80();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB5E9728);
    uint64_t v14 = sub_1A8D59A60();
    os_log_type_t v15 = sub_1A8D59F00();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v41 = v17;
      *(_DWORD *)unint64_t v16 = 136315138;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v18 = 0x6761676E45756663;
        }
        else {
          uint64_t v18 = 0x6E4974706FLL;
        }
        if (a1 == 1) {
          unint64_t v19 = 0xED0000746E656D65;
        }
        else {
          unint64_t v19 = 0xE500000000000000;
        }
      }
      else
      {
        uint64_t v18 = 0x6553736148756663;
        unint64_t v19 = 0xEA0000000000746ELL;
      }
      uint64_t v40 = sub_1A8C90120(v18, v19, &v41);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v14, v15, "No migration to delete for %s", v16, 0xCu);
      uint64_t v28 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v17, -1, -1);
      MEMORY[0x1AD0E6EB0](v16, -1, -1);
    }
    else
    {

      uint64_t v28 = 1;
    }
  }
  else
  {
    uint64_t v39 = a2;
    sub_1A8D46D90((uint64_t)v7, (uint64_t)v12);
    if (qword_1EB5E9810 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1A8D59A80();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB5E9728);
    uint64_t v21 = sub_1A8D59A60();
    os_log_type_t v22 = sub_1A8D59F00();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v38 = v8;
    if (v23)
    {
      os_log_type_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v41 = v25;
      *(_DWORD *)os_log_type_t v24 = 136315138;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v26 = 0x6761676E45756663;
        }
        else {
          uint64_t v26 = 0x6E4974706FLL;
        }
        if (a1 == 1) {
          unint64_t v27 = 0xED0000746E656D65;
        }
        else {
          unint64_t v27 = 0xE500000000000000;
        }
      }
      else
      {
        uint64_t v26 = 0x6553736148756663;
        unint64_t v27 = 0xEA0000000000746ELL;
      }
      uint64_t v40 = sub_1A8C90120(v26, v27, &v41);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v21, v22, "Deleting migration: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v25, -1, -1);
      MEMORY[0x1AD0E6EB0](v24, -1, -1);
    }

    a2 = v39;
    if (qword_1EB5E9838 != -1) {
      swift_once();
    }
    uint64_t v29 = (void *)qword_1EB5E9830;
    os_log_type_t v30 = (void *)sub_1A8D59BC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_removeObjectForKey_, v30);

    uint64_t v31 = sub_1A8D59A60();
    os_log_type_t v32 = sub_1A8D59F00();
    if (os_log_type_enabled(v31, v32))
    {
      char v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v41 = v34;
      *(_DWORD *)char v33 = 136315138;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v35 = 0x6761676E45756663;
        }
        else {
          uint64_t v35 = 0x6E4974706FLL;
        }
        if (a1 == 1) {
          unint64_t v36 = 0xED0000746E656D65;
        }
        else {
          unint64_t v36 = 0xE500000000000000;
        }
      }
      else
      {
        unint64_t v36 = 0xEA0000000000746ELL;
        uint64_t v35 = 0x6553736148756663;
      }
      uint64_t v40 = sub_1A8C90120(v35, v36, &v41);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v31, v32, "Deleted migration: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v34, -1, -1);
      MEMORY[0x1AD0E6EB0](v33, -1, -1);
    }

    sub_1A8D46D90((uint64_t)v12, a2);
    uint64_t v28 = 0;
    uint64_t v8 = v38;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, v28, 1, v8);
}

uint64_t DefaultsMigrator.deinit()
{
  return v0;
}

uint64_t DefaultsMigrator.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for DefaultsMigrator.Migration()
{
  uint64_t result = qword_1EB5E9870;
  if (!qword_1EB5E9870) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A8D46D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultsMigrator.Migration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A8D46DF4(int a1)
{
  uint64_t v2 = type metadata accessor for DefaultsMigrator.Migration();
  uint64_t v4 = MEMORY[0x1F4188790](v2, v3);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4, v7);
  uint64_t v9 = (char *)v25 - v8;
  sub_1A8D596E0();
  *uint64_t v9 = a1;
  sub_1A8D59530();
  swift_allocObject();
  sub_1A8D59520();
  sub_1A8D47BE8(&qword_1E979FA98);
  uint64_t v10 = sub_1A8D59510();
  unint64_t v12 = v11;
  swift_release();
  sub_1A8CA17BC(v10, v12);
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1A8D59A80();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB5E9728);
  sub_1A8D47314((uint64_t)v9, (uint64_t)v6);
  uint64_t v14 = sub_1A8D59A60();
  os_log_type_t v15 = sub_1A8D59F00();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    int v26 = a1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v28 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    v25[1] = v17 + 4;
    unint64_t v19 = sub_1A8D437F4();
    uint64_t v27 = sub_1A8C90120(v19, v20, &v28);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    sub_1A8D47378((uint64_t)v6);
    _os_log_impl(&dword_1A8C7F000, v14, v15, "Setting migration into user defaults: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v18, -1, -1);
    MEMORY[0x1AD0E6EB0](v17, -1, -1);
  }
  else
  {
    sub_1A8D47378((uint64_t)v6);
  }

  if (qword_1EB5E9838 != -1) {
    swift_once();
  }
  uint64_t v21 = (void *)qword_1EB5E9830;
  os_log_type_t v22 = (void *)sub_1A8D595B0();
  sub_1A8C93C98(v10, v12);
  BOOL v23 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setObject_forKey_, v22, v23);

  sub_1A8C93C98(v10, v12);
  return sub_1A8D47378((uint64_t)v9);
}

uint64_t sub_1A8D47314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultsMigrator.Migration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A8D47378(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DefaultsMigrator.Migration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A8D473D4(int a1, uint64_t a2, unint64_t a3)
{
  sub_1A8D46DF4(a1);
  if (qword_1EB5E9810 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1A8D59A80();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB5E9728);
  os_log_t oslog = sub_1A8D59A60();
  os_log_type_t v6 = sub_1A8D59F00();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_1A8C90120(a2, a3, &v10);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, oslog, v6, "%s Finished migration.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v8, -1, -1);
    MEMORY[0x1AD0E6EB0](v7, -1, -1);
  }
  else
  {
  }
}

uint64_t type metadata accessor for DefaultsMigrator()
{
  return self;
}

uint64_t method lookup function for DefaultsMigrator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DefaultsMigrator);
}

uint64_t *sub_1A8D475BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    os_log_type_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1A8D596F0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1A8D47688(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1A8D596F0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

unsigned char *sub_1A8D476F0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  os_log_type_t v6 = &a2[v4];
  uint64_t v7 = sub_1A8D596F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1A8D4776C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  os_log_type_t v6 = &a2[v4];
  uint64_t v7 = sub_1A8D596F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1A8D477E8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  os_log_type_t v6 = &a2[v4];
  uint64_t v7 = sub_1A8D596F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1A8D47864(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  os_log_type_t v6 = &a2[v4];
  uint64_t v7 = sub_1A8D596F0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1A8D478E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8D478F4);
}

uint64_t sub_1A8D478F4(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 3) {
      return v4 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_1A8D596F0();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    unint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1A8D4799C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8D479B0);
}

unsigned char *sub_1A8D479B0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 253)
  {
    *uint64_t result = a2 + 2;
  }
  else
  {
    uint64_t v7 = sub_1A8D596F0();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1A8D47A54()
{
  uint64_t result = sub_1A8D596F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1A8D47AEC()
{
  unint64_t result = qword_1EB5E9840;
  if (!qword_1EB5E9840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9840);
  }
  return result;
}

unint64_t sub_1A8D47B40()
{
  unint64_t result = qword_1EB5E9860;
  if (!qword_1EB5E9860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9860);
  }
  return result;
}

unint64_t sub_1A8D47B94()
{
  unint64_t result = qword_1E979FA90;
  if (!qword_1E979FA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FA90);
  }
  return result;
}

uint64_t sub_1A8D47BE8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DefaultsMigrator.Migration();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DefaultsMigrator.Migration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D47CF8);
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

ValueMetadata *type metadata accessor for DefaultsMigrator.Migration.CodingKeys()
{
  return &type metadata for DefaultsMigrator.Migration.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DefaultsMigrator.Migration.Field(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1A8D47DFCLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultsMigrator.Migration.Field()
{
  return &type metadata for DefaultsMigrator.Migration.Field;
}

unint64_t sub_1A8D47E38()
{
  unint64_t result = qword_1E979FAA0;
  if (!qword_1E979FAA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E979FAA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAA0);
  }
  return result;
}

unint64_t sub_1A8D47E98()
{
  unint64_t result = qword_1E979FAB0;
  if (!qword_1E979FAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAB0);
  }
  return result;
}

unint64_t sub_1A8D47EF0()
{
  unint64_t result = qword_1E979FAB8;
  if (!qword_1E979FAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAB8);
  }
  return result;
}

unint64_t sub_1A8D47F48()
{
  unint64_t result = qword_1EB5E9850;
  if (!qword_1EB5E9850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9850);
  }
  return result;
}

unint64_t sub_1A8D47FA0()
{
  unint64_t result = qword_1EB5E9848;
  if (!qword_1EB5E9848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9848);
  }
  return result;
}

uint64_t sub_1A8D47FF4()
{
  unint64_t v0 = sub_1A8D5A220();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A8D48040(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x646C656966 && a2 == 0xE500000000000000;
  if (v2 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_1A8D4811C()
{
  unint64_t result = qword_1EB5E9858;
  if (!qword_1EB5E9858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5E9858);
  }
  return result;
}

id sub_1A8D48170()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28D48]), sel_init);
  qword_1E97A8B30 = (uint64_t)result;
  return result;
}

id sub_1A8D481A4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C08]), sel_init);
  id v1 = objc_msgSend(self, sel_currentLocale);
  uint64_t v2 = sub_1A8D59760();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  char v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D59750();

  uint64_t v7 = (void *)sub_1A8D59740();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(v0, sel_setLocale_, v7);

  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E979FAC0);
  MEMORY[0x1F4188790](v8 - 8, v9);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D59780();
  uint64_t v12 = sub_1A8D597B0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
  {
    uint64_t v14 = (void *)sub_1A8D59790();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
  }
  objc_msgSend(v0, sel_setTimeZone_, v14);

  os_log_type_t v15 = (void *)sub_1A8D59BC0();
  objc_msgSend(v0, sel_setDateFormat_, v15);

  return v0;
}

uint64_t sub_1A8D48404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_1A8C81994;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_1A8D48524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1A8D48538(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A8D4854C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  char v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3) {
    uint64_t v7 = sub_1A8D59D50();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8D48600(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return MEMORY[0x1F4188298](sub_1A8D48624, 0, 0);
}

uint64_t sub_1A8D48624()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E92A0);
  uint64_t v1 = swift_task_alloc();
  sub_1A8D59300();
  uint64_t v2 = sub_1A8D595A0();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_1A8C8DE74(v1, (uint64_t *)&unk_1EB5E92A0);
    swift_task_dealloc();
    if (qword_1EB5E9310 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1A8D59A80();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EB5E92F8);
    uint64_t v5 = sub_1A8D59A60();
    os_log_type_t v6 = sub_1A8D59EE0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A8C7F000, v5, v6, "Attempted to BAA sign request with no path", v7, 2u);
      MEMORY[0x1AD0E6EB0](v7, -1, -1);
    }

    sub_1A8D48E10();
    swift_allocError();
    *id v8 = 0;
    swift_willThrow();
    id v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v12 = v0[8];
    uint64_t v11 = v0[9];
    uint64_t v13 = sub_1A8D59580();
    uint64_t v15 = v14;
    v0[11] = v14;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    swift_task_dealloc();
    uint64_t v16 = sub_1A8D59350();
    v0[12] = v16;
    uint64_t v17 = *(void *)(v16 - 8);
    v0[13] = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v12, v11, v16);
    if (qword_1EB5E9310 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A8D59A80();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB5E92F8);
    unint64_t v19 = sub_1A8D59A60();
    os_log_type_t v20 = sub_1A8D59ED0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A8C7F000, v19, v20, "Fetching BAA signing credentials", v21, 2u);
      MEMORY[0x1AD0E6EB0](v21, -1, -1);
    }
    uint64_t v22 = v0[10];

    uint64_t v23 = v22 + *(int *)(type metadata accessor for BAARequestSigner() + 20);
    os_log_type_t v24 = (void *)swift_task_alloc();
    v0[14] = v24;
    v24[2] = v23;
    v24[3] = v22;
    v24[4] = v13;
    void v24[5] = v15;
    uint64_t v25 = (void *)swift_task_alloc();
    v0[15] = v25;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9478);
    void *v25 = v0;
    v25[1] = sub_1A8D48A6C;
    return MEMORY[0x1F4188160](v0 + 2, 0, 0, 0xD00000000000002ELL, 0x80000001A8D67460, sub_1A8D4A3FC, v24, v26);
  }
}

uint64_t sub_1A8D48A6C()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A8D48D7C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1A8D48B88;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D48B88()
{
  swift_bridgeObjectRelease();
  unint64_t v15 = v0[3];
  uint64_t v16 = v0[2];
  unint64_t v13 = v0[5];
  uint64_t v14 = v0[4];
  uint64_t v1 = (__SecCertificate *)v0[6];
  uint64_t v2 = (__SecCertificate *)v0[7];
  sub_1A8D595C0();
  sub_1A8D59320();
  swift_bridgeObjectRelease();
  sub_1A8D595C0();
  sub_1A8D59320();
  swift_bridgeObjectRelease();
  CFDataRef v3 = SecCertificateCopyData(v1);
  uint64_t v4 = sub_1A8D595D0();
  unint64_t v6 = v5;

  uint64_t v17 = v4;
  unint64_t v18 = v6;
  CFDataRef v7 = SecCertificateCopyData(v2);
  uint64_t v8 = sub_1A8D595D0();
  unint64_t v10 = v9;

  sub_1A8D595E0();
  sub_1A8CA17BC(v17, v18);
  sub_1A8D595C0();
  sub_1A8C93C98(v17, v18);
  sub_1A8D59320();
  swift_bridgeObjectRelease();
  sub_1A8C93C98(v8, v10);

  sub_1A8C93C98(v14, v13);
  sub_1A8C93C98(v16, v15);
  sub_1A8C93C98(v17, v18);
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1A8D48D7C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[8];
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

unint64_t sub_1A8D48E10()
{
  unint64_t result = qword_1EB5E9928[0];
  if (!qword_1EB5E9928[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB5E9928);
  }
  return result;
}

void sub_1A8D48E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = a4;
  uint64_t v36 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E96E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A8D5F520;
  sub_1A8D59BF0();
  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  sub_1A8D5A070();
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 72) = 4608835;
  *(void *)(inited + 80) = 0xE300000000000000;
  sub_1A8D59BF0();
  sub_1A8D5A070();
  *(void *)(inited + 168) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 144) = 129600;
  uint64_t v37 = sub_1A8D59BF0();
  uint64_t v38 = v9;
  sub_1A8D5A070();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5EAEB0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1A8D5BE30;
  *(void *)(v10 + 32) = sub_1A8D59BF0();
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = sub_1A8D59BF0();
  *(void *)(v10 + 56) = v12;
  *(void *)(inited + 240) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9DB0);
  *(void *)(inited + 216) = v10;
  v34[1] = sub_1A8CB9834(inited);
  sub_1A8CD158C();
  uint64_t v13 = sub_1A8D59AF0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v17, *MEMORY[0x1E4FBCB40], v13);
  v34[0] = sub_1A8D59F50();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x1F4188790](v18, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v18);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x1F4188790](v22 - 8, v25);
  sub_1A8C8D028(a3, (uint64_t)v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v26 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v27 = (v20 + *(unsigned __int8 *)(v23 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v28 + v26, (char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  sub_1A8C921A0((uint64_t)v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
  uint64_t v29 = (void *)(v28 + ((v24 + v27 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v30 = v36;
  *uint64_t v29 = v35;
  v29[1] = v30;
  swift_bridgeObjectRetain();
  uint64_t v31 = (void *)sub_1A8D59B20();
  uint64_t v41 = sub_1A8D4A5C8;
  uint64_t v42 = v28;
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_1A8D4854C;
  uint64_t v40 = &block_descriptor_14;
  os_log_type_t v32 = _Block_copy(&v37);
  swift_retain();
  swift_release();
  char v33 = (void *)v34[0];
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v32);
  swift_release();

  swift_bridgeObjectRelease();
}

void sub_1A8D4934C(void *a1, uint64_t a2, id a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  error[1] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a3)
    {
      id v9 = a1;
      id v10 = a3;
      if (qword_1EB5E9310 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1A8D59A80();
      __swift_project_value_buffer(v11, (uint64_t)qword_1EB5E92F8);
      id v12 = a3;
      id v13 = a3;
      uint64_t v14 = sub_1A8D59A60();
      os_log_type_t v15 = sub_1A8D59EE0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v126 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_getErrorValue();
        uint64_t v18 = sub_1A8D5A440();
        error[0] = (CFErrorRef)sub_1A8C90120(v18, v19, &v126);
        sub_1A8D59FE0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1A8C7F000, v14, v15, "Unable to get BAA certificates. Error: %s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v17, -1, -1);
        MEMORY[0x1AD0E6EB0](v16, -1, -1);
      }
      else
      {
      }
      sub_1A8D48E10();
      uint64_t v37 = swift_allocError();
      *uint64_t v38 = 1;
      uint64_t v126 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
      sub_1A8D59DD0();

      goto LABEL_32;
    }
    if (!a2)
    {
      id v47 = a1;
      goto LABEL_27;
    }
    char v33 = a1;
    unint64_t v34 = sub_1A8D4A224(a2);
    if (!v34)
    {
LABEL_27:
      if (qword_1EB5E9310 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_1A8D59A80();
      __swift_project_value_buffer(v48, (uint64_t)qword_1EB5E92F8);
      uint64_t v49 = sub_1A8D59A60();
      os_log_type_t v50 = sub_1A8D59EE0();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v51 = 0;
        _os_log_impl(&dword_1A8C7F000, v49, v50, "Unable to get BAA certificates. Unknown error.", v51, 2u);
        MEMORY[0x1AD0E6EB0](v51, -1, -1);
      }

      sub_1A8D48E10();
      uint64_t v52 = swift_allocError();
      unsigned char *v53 = 1;
      uint64_t v126 = v52;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
      sub_1A8D59DD0();
      goto LABEL_32;
    }
    unint64_t v35 = v34;
    uint64_t v36 = v34 & 0xFFFFFFFFFFFFFF8;
    if (v34 >> 62)
    {
      if (sub_1A8D5A1C0() < 2) {
        goto LABEL_16;
      }
    }
    else if (*(uint64_t *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    uint64_t v123 = v36;
    SecKeyRef v124 = v33;
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    uint64_t v55 = &v121;
    MEMORY[0x1F4188790](v54 - 8, v56);
    uint64_t v58 = (char *)&v121 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1A8C8D028(a5, (uint64_t)v58);
    uint64_t v59 = sub_1A8D596F0();
    uint64_t v60 = *(void *)(v59 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v58, 1, v59) == 1)
    {
      uint64_t v61 = sub_1A8C8DE74((uint64_t)v58, &qword_1EB5EACF0);
      uint64_t v55 = &v121;
      MEMORY[0x1F4188790](v61, v62);
      unint64_t v64 = (char *)&v121 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1A8D596D0();
      sub_1A8D596A0();
      double v66 = v65;
      uint64_t v68 = *(void (**)(char *, uint64_t))(v60 + 8);
      CFDataRef Signature = (CFDataRef)(v60 + 8);
      v68(v64, v59);
    }
    else
    {
      sub_1A8D596A0();
      double v66 = v69;
      uint64_t v70 = *(void (**)(char *, uint64_t))(v60 + 8);
      CFDataRef Signature = (CFDataRef)(v60 + 8);
      v70(v58, v59);
    }
    double v71 = v66 * 1000.0;
    if ((~COERCE__INT64(v66 * 1000.0) & 0x7FF0000000000000) != 0)
    {
      if (v71 > -1.0)
      {
        if (v71 < 1.84467441e19)
        {
          uint64_t v126 = (unint64_t)v71;
          uint64_t v126 = sub_1A8D5A360();
          unint64_t v127 = v72;
          swift_bridgeObjectRetain();
          sub_1A8D59CA0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1A8D59CA0();
          swift_bridgeObjectRelease();
          uint64_t v73 = sub_1A8D59C30();
          uint64_t v74 = *(void *)(v73 - 8);
          MEMORY[0x1F4188790](v73, v75);
          uint64_t v77 = (char *)&v121 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_1A8D59C20();
          uint64_t v78 = sub_1A8D59C00();
          unint64_t v80 = (unint64_t)v79;
          swift_bridgeObjectRelease();
          v81 = v77;
          uint64_t v55 = (uint8_t **)v80;
          (*(void (**)(char *, uint64_t))(v74 + 8))(v81, v73);
          if (v80 >> 60 == 15)
          {
            swift_bridgeObjectRelease();
            sub_1A8D48E10();
            uint64_t v82 = swift_allocError();
            unsigned char *v83 = 4;
            uint64_t v126 = v82;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
            sub_1A8D59DD0();
            SecKeyRef v84 = v124;

            return;
          }
          error[0] = 0;
          CFStringRef v85 = (const __CFString *)*MEMORY[0x1E4F3BA78];
          CFDataRef v86 = (const __CFData *)sub_1A8D595B0();
          CFDataRef Signature = SecKeyCreateSignature(v124, v85, v86, error);

          a7 = v78;
          if (!Signature)
          {
            swift_bridgeObjectRelease();
            unint64_t v35 = (unint64_t)error[0];
            if (!error[0])
            {
              if (qword_1EB5E9310 != -1) {
                swift_once();
              }
              uint64_t v113 = sub_1A8D59A80();
              __swift_project_value_buffer(v113, (uint64_t)qword_1EB5E92F8);
              unint64_t v114 = sub_1A8D59A60();
              os_log_type_t v115 = sub_1A8D59EE0();
              if (os_log_type_enabled(v114, v115))
              {
                uint64_t v116 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v116 = 0;
                _os_log_impl(&dword_1A8C7F000, v114, v115, "BAA signature was empty", v116, 2u);
                MEMORY[0x1AD0E6EB0](v116, -1, -1);
              }

              sub_1A8D48E10();
              uint64_t v117 = swift_allocError();
              unsigned char *v118 = 3;
              uint64_t v126 = v117;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
              sub_1A8D59DD0();
              sub_1A8C93C84(v78, (unint64_t)v55);
              goto LABEL_32;
            }
            if (qword_1EB5E9310 == -1) {
              goto LABEL_53;
            }
            goto LABEL_69;
          }
          if (qword_1EB5E9310 == -1)
          {
LABEL_44:
            uint64_t v87 = sub_1A8D59A80();
            __swift_project_value_buffer(v87, (uint64_t)qword_1EB5E92F8);
            uint64_t v88 = sub_1A8D59A60();
            os_log_type_t v89 = sub_1A8D59ED0();
            if (os_log_type_enabled(v88, v89))
            {
              v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v90 = 0;
              _os_log_impl(&dword_1A8C7F000, v88, v89, "Successfully fetched BAA signing credentials", v90, 2u);
              MEMORY[0x1AD0E6EB0](v90, -1, -1);
            }

            sub_1A8CB279C(a7, (unint64_t)v55);
            CFDataRef v91 = Signature;
            uint64_t v92 = sub_1A8D595D0();
            uint64_t v94 = v93;

            SecKeyRef v124 = v91;
            if ((v35 & 0xC000000000000001) != 0)
            {
              uint64_t v96 = v94;
              unint64_t v97 = (unint64_t)v55;
              uint64_t v98 = a7;
              id v100 = (id)MEMORY[0x1AD0E6030](0, v35);
              id v101 = (id)MEMORY[0x1AD0E6030](1, v35);
              goto LABEL_50;
            }
            uint64_t v95 = *(void *)(v123 + 16);
            if (v95)
            {
              if (v95 != 1)
              {
                uint64_t v96 = v94;
                unint64_t v97 = (unint64_t)v55;
                uint64_t v98 = a7;
                v99 = *(void **)(v35 + 40);
                id v100 = *(id *)(v35 + 32);
                id v101 = v99;
LABEL_50:
                id v102 = v101;
                swift_bridgeObjectRelease();
                uint64_t v126 = v98;
                unint64_t v127 = v97;
                uint64_t v128 = v92;
                uint64_t v129 = v96;
                id v130 = v100;
                id v131 = v102;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
                sub_1A8D59DE0();
                sub_1A8C93C84(v98, v97);

LABEL_32:
                return;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
LABEL_69:
            swift_once();
LABEL_53:
            uint64_t v103 = sub_1A8D59A80();
            __swift_project_value_buffer(v103, (uint64_t)qword_1EB5E92F8);
            v104 = (__CFError *)(id)v35;
            os_log_type_t v105 = sub_1A8D59A60();
            os_log_type_t v106 = sub_1A8D59EE0();
            int v107 = v106;
            if (os_log_type_enabled(v105, v106))
            {
              LODWORD(v124) = v107;
              v108 = (uint8_t *)swift_slowAlloc();
              uint64_t v123 = swift_slowAlloc();
              uint64_t v126 = v123;
              uint64_t v122 = v108;
              *(_DWORD *)v108 = 136315138;
              v121 = v108 + 4;
              uint64_t v125 = (uint64_t)v104;
              type metadata accessor for CFError(0);
              sub_1A8D4A6EC();
              uint64_t v109 = sub_1A8D5A440();
              uint64_t v125 = sub_1A8C90120(v109, v110, &v126);
              sub_1A8D59FE0();

              swift_bridgeObjectRelease();
              unint64_t v111 = v122;
              _os_log_impl(&dword_1A8C7F000, v105, (os_log_type_t)v124, "Unable to create BAA signature: %s", v122, 0xCu);
              uint64_t v112 = v123;
              swift_arrayDestroy();
              MEMORY[0x1AD0E6EB0](v112, -1, -1);
              MEMORY[0x1AD0E6EB0](v111, -1, -1);
            }
            else
            {
            }
            sub_1A8D48E10();
            uint64_t v119 = swift_allocError();
            unsigned char *v120 = 5;
            uint64_t v126 = v119;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
            sub_1A8D59DD0();
            sub_1A8C93C84(a7, (unint64_t)v55);

            goto LABEL_32;
          }
LABEL_65:
          swift_once();
          goto LABEL_44;
        }
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_64;
  }
  if (a3)
  {
    id v20 = a3;
    if (qword_1EB5E9310 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1A8D59A80();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EB5E92F8);
    id v22 = a3;
    id v23 = a3;
    uint64_t v24 = sub_1A8D59A60();
    os_log_type_t v25 = sub_1A8D59EE0();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v126 = v27;
      *(_DWORD *)unint64_t v26 = 136315138;
      swift_getErrorValue();
      uint64_t v28 = sub_1A8D5A440();
      error[0] = (CFErrorRef)sub_1A8C90120(v28, v29, &v126);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1A8C7F000, v24, v25, "Unable to get BAA signing keys. Error: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v27, -1, -1);
      MEMORY[0x1AD0E6EB0](v26, -1, -1);
    }
    else
    {
    }
    sub_1A8D48E10();
    uint64_t v45 = swift_allocError();
    *uint64_t v46 = 2;
    uint64_t v126 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
    sub_1A8D59DD0();
  }
  else
  {
    if (qword_1EB5E9310 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_1A8D59A80();
    __swift_project_value_buffer(v39, (uint64_t)qword_1EB5E92F8);
    uint64_t v40 = sub_1A8D59A60();
    os_log_type_t v41 = sub_1A8D59EE0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1A8C7F000, v40, v41, "Unable to get BAA signing keys. Unknown error.", v42, 2u);
      MEMORY[0x1AD0E6EB0](v42, -1, -1);
    }

    sub_1A8D48E10();
    uint64_t v43 = swift_allocError();
    *os_log_type_t v44 = 2;
    uint64_t v126 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
    sub_1A8D59DD0();
  }
}

uint64_t sub_1A8D4A224(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4FBC860];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1A8D5A160();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_1A8C901F4(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_1A8D5A140();
    sub_1A8D5A170();
    sub_1A8D5A180();
    sub_1A8D5A150();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

unint64_t sub_1A8D4A320@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1A8D4B400(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1A8D4A34C()
{
  return sub_1A8D59470();
}

unint64_t sub_1A8D4A364()
{
  return sub_1A8D026C4(*v0);
}

void sub_1A8D4A36C(void *a1@<X8>)
{
  *a1 = &unk_1EFF53690;
}

uint64_t sub_1A8D4A37C()
{
  return sub_1A8D5A430();
}

uint64_t sub_1A8D4A3AC()
{
  return sub_1A8D5A410();
}

void sub_1A8D4A3FC(uint64_t a1)
{
  sub_1A8D48E64(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1A8D4A408()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v10 = sub_1A8D596F0();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, ((v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | v7 | 7);
}

void sub_1A8D4A5C8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9650) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0) - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v3 + v11;
  id v13 = (uint64_t *)(v3 + ((*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  sub_1A8D4934C(a1, a2, a3, v3 + v8, v12, v14, v15);
}

unint64_t sub_1A8D4A6EC()
{
  unint64_t result = qword_1E979FAD8;
  if (!qword_1E979FAD8)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAD8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RequestSigningError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1A8D4A804);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestSigningError()
{
  return &type metadata for RequestSigningError;
}

ValueMetadata *type metadata accessor for BAASigningEnvironment()
{
  return &type metadata for BAASigningEnvironment;
}

ValueMetadata *type metadata accessor for DeviceIdentityCertificateFetcher()
{
  return &type metadata for DeviceIdentityCertificateFetcher;
}

uint64_t *sub_1A8D4A85C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A8D596F0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    long long v12 = *(_OWORD *)((char *)a2 + v11 + 24);
    *(_OWORD *)((char *)a1 + v11 + 24) = v12;
    (**(void (***)(void))(v12 - 8))();
  }
  return a1;
}

char *sub_1A8D4AA08(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  long long v10 = *(_OWORD *)&a2[v9 + 24];
  *(_OWORD *)&a1[v9 + 24] = v10;
  (**(void (***)(void))(v10 - 8))();
  return a1;
}

char *sub_1A8D4AB64(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[*(int *)(a3 + 20)], (uint64_t *)&a2[*(int *)(a3 + 20)]);
  return a1;
}

char *sub_1A8D4ACF4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)int v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *((void *)v10 + 4) = *((void *)v11 + 4);
  return a1;
}

char *sub_1A8D4AE2C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  id v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&a1[v12]);
  long long v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)id v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  *((void *)v13 + 4) = *((void *)v14 + 4);
  return a1;
}

uint64_t sub_1A8D4AFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8D4AFE4);
}

uint64_t sub_1A8D4AFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1A8D4B0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8D4B0C0);
}

uint64_t sub_1A8D4B0C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

void sub_1A8D4B184()
{
  sub_1A8C82EE4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1A8D4B21C()
{
  unint64_t result = qword_1E979FAE0;
  if (!qword_1E979FAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E979FAE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAE0);
  }
  return result;
}

unint64_t sub_1A8D4B27C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A8D4B2AC();
  unint64_t result = sub_1A8D4B300();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A8D4B2AC()
{
  unint64_t result = qword_1E979FAF0;
  if (!qword_1E979FAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAF0);
  }
  return result;
}

unint64_t sub_1A8D4B300()
{
  unint64_t result = qword_1E979FAF8;
  if (!qword_1E979FAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FAF8);
  }
  return result;
}

unint64_t sub_1A8D4B358()
{
  unint64_t result = qword_1E979FB00;
  if (!qword_1E979FB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB00);
  }
  return result;
}

unint64_t sub_1A8D4B3AC()
{
  unint64_t result = qword_1E979FB08;
  if (!qword_1E979FB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E979FB08);
  }
  return result;
}

unint64_t sub_1A8D4B400(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

uint64_t sub_1A8D4B410(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))(a1 & 1);
}

uint64_t sub_1A8D4B428(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))(a1 & 1);
}

uint64_t sub_1A8D4B440(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t SiriAssistantLocale.current.getter()
{
  if (qword_1EB5E9720 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A8D59A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5E97F8);
  uint64_t v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59F00();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_1A8C7F000, v1, v2, "Attempting to get locale from CFPreferences.", v3, 2u);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }

  unsigned int v4 = (__CFString *)sub_1A8D59BC0();
  CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x1E4F1D3F8], (CFStringRef)*MEMORY[0x1E4F1D3E8]);

  int v5 = (__CFString *)sub_1A8D59BC0();
  uint64_t v6 = (__CFString *)sub_1A8D59BC0();
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(v5, v6);

  if (!v7)
  {
    uint64_t v16 = sub_1A8D59A60();
    os_log_type_t v17 = sub_1A8D59EE0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A8C7F000, v16, v17, "SiriAssistantLocale.current - Unable to get locale from CFPreferences", v18, 2u);
      MEMORY[0x1AD0E6EB0](v18, -1, -1);
    }

    return 0;
  }
  uint64_t v8 = (const void *)swift_unknownObjectRetain();
  CFTypeID v9 = CFGetTypeID(v8);
  if (v9 != CFStringGetTypeID())
  {
    swift_unknownObjectRetain_n();
    unint64_t v19 = sub_1A8D59A60();
    os_log_type_t v20 = sub_1A8D59EE0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v33[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_getObjectType();
      uint64_t v23 = sub_1A8D5A540();
      uint64_t v34 = sub_1A8C90120(v23, v24, v33);
      sub_1A8D59FE0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v34 = (uint64_t)v7;
      swift_unknownObjectRetain();
      uint64_t v25 = sub_1A8D59C40();
      uint64_t v34 = sub_1A8C90120(v25, v26, v33);
      sub_1A8D59FE0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v27 = "SiriAssistantLocale.current - Value from preferences is not expected type CFString. Type is: %s - %s";
LABEL_17:
      _os_log_impl(&dword_1A8C7F000, v19, v20, v27, (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v22, -1, -1);
      MEMORY[0x1AD0E6EB0](v21, -1, -1);
      swift_unknownObjectRelease_n();

      return 0;
    }
LABEL_18:

    swift_unknownObjectRelease_n();
    return 0;
  }
  uint64_t v34 = (uint64_t)v7;
  swift_unknownObjectRetain();
  if (!swift_dynamicCast())
  {
    swift_unknownObjectRetain_n();
    unint64_t v19 = sub_1A8D59A60();
    os_log_type_t v20 = sub_1A8D59EE0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v33[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_getObjectType();
      uint64_t v28 = sub_1A8D5A540();
      uint64_t v34 = sub_1A8C90120(v28, v29, v33);
      sub_1A8D59FE0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v34 = (uint64_t)v7;
      swift_unknownObjectRetain();
      uint64_t v30 = sub_1A8D59C40();
      uint64_t v34 = sub_1A8C90120(v30, v31, v33);
      sub_1A8D59FE0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v27 = "SiriAssistantLocale.current - Unable to downcast to String: %s - %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v10 = v33[0];
  unint64_t v11 = v33[1];
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_1A8D59A60();
  os_log_type_t v13 = sub_1A8D59F00();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v33[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1A8C90120(v10, v11, v33);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v12, v13, "SiriAssistantLocale.current - Resolved, returning locale: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v15, -1, -1);
    MEMORY[0x1AD0E6EB0](v14, -1, -1);
    swift_unknownObjectRelease_n();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease_n();
  }
  return v10;
}

uint64_t sub_1A8D4BAA8()
{
  return SiriAssistantLocale.current.getter();
}

uint64_t dispatch thunk of UserLocaleProtocol.current.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for SiriAssistantLocale()
{
  return &type metadata for SiriAssistantLocale;
}

id static GMBypass.gmEligibilityBypass()()
{
  return sub_1A8CD9E3C();
}

id static GMBypass.admBypassState()()
{
  return sub_1A8CD9E3C();
}

uint64_t sub_1A8D4BB14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1A8D59E10();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1A8D59E00();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1A8D4F134(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A8D59DC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5E9630);
  return swift_task_create();
}

uint64_t sub_1A8D4BC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C82C08(a1, a2, a3);
}

uint64_t sub_1A8D4BCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C82C08(a1, a2, a3);
}

uint64_t sub_1A8D4BCB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C8396C(a1, a2, a3, (void (*)(void))type metadata accessor for GeoClassificationInfo);
}

uint64_t sub_1A8D4BCC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C8396C(a1, a2, a3, (void (*)(void))type metadata accessor for Ticket);
}

uint64_t sub_1A8D4BCE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C8396C(a1, a2, a3, (void (*)(void))type metadata accessor for WaitlistResult);
}

uint64_t sub_1A8D4BCF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A8C8396C(a1, a2, a3, (void (*)(void))type metadata accessor for CloudFeature);
}

void sub_1A8D4BD10()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2) {
    id v2 = objc_msgSend(self, sel_standardUserDefaults);
  }
  qword_1EB5EA2D0 = (uint64_t)v2;
}

uint64_t sub_1A8D4BDC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 352) = a4;
  return MEMORY[0x1F4188298](sub_1A8D4BDE4, 0, 0);
}

uint64_t sub_1A8D4BDE4()
{
  int v1 = *(unsigned __int8 *)(v0 + 352);
  sub_1A8D599A0();
  swift_allocObject();
  *(void *)(v0 + 136) = sub_1A8D59990();
  if (v1 == 1)
  {
    uint64_t v2 = sub_1A8D59920();
    *(void *)(v0 + 144) = v2;
    *(void *)(v0 + 152) = *(void *)(v2 - 8);
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 160) = v3;
    uint64_t v4 = *(void *)(sub_1A8D59900() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v4 + 104))();
    sub_1A8D59910();
    swift_task_dealloc();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1A8D4C08C;
    return MEMORY[0x1F411BFB0](v3);
  }
  else
  {
    uint64_t v6 = self;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_1A8D4C6EC;
    uint64_t v7 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_1A8CD9998;
    *(void *)(v0 + 104) = &block_descriptor_7;
    *(void *)(v0 + 112) = v7;
    objc_msgSend(v6, sel_currentAvailabilityWithCompletionHandler_, v0 + 80);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
}

uint64_t sub_1A8D4C08C()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[19];
  uint64_t v5 = v2[18];
  if (v0)
  {
    (*(void (**)(void, uint64_t))(v4 + 8))(v2[20], v5);
    return MEMORY[0x1F4188298](sub_1A8D4D188, 0, 0);
  }
  else
  {
    (*(void (**)(void, uint64_t))(v4 + 8))(v2[20], v5);
    swift_task_dealloc();
    uint64_t v6 = (void *)swift_task_alloc();
    v2[23] = v6;
    void *v6 = v3;
    v6[1] = sub_1A8D4C28C;
    uint64_t v7 = MEMORY[0x1E4FBC870];
    return MEMORY[0x1F411BFB8](v7);
  }
}

uint64_t sub_1A8D4C28C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1A8D4D1F8, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 200) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_1A8D4C400;
    return MEMORY[0x1F411BFC0](1);
  }
}

uint64_t sub_1A8D4C400()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1A8D4D25C, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 216) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_1A8D4C574;
    return MEMORY[0x1F411BFC0](1);
  }
}

uint64_t sub_1A8D4C574()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A8D4D2C0;
  }
  else {
    uint64_t v2 = sub_1A8D4C688;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4C688()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4C6EC()
{
  return MEMORY[0x1F4188298](sub_1A8D4C7CC, 0, 0);
}

uint64_t sub_1A8D4C7CC()
{
  v0[29] = v0[15];
  uint64_t v1 = sub_1A8D59920();
  v0[30] = v1;
  v0[31] = *(void *)(v1 - 8);
  uint64_t v2 = swift_task_alloc();
  v0[32] = v2;
  sub_1A8CE331C();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[33] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1A8D4C8D4;
  return MEMORY[0x1F411BFB0](v2);
}

uint64_t sub_1A8D4C8D4()
{
  uint64_t v2 = (void *)*v1;
  v2[34] = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[31] + 8))(v2[32], v2[30]);
    return MEMORY[0x1F4188298](sub_1A8D4D324, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(v2[31] + 8))(v2[32], v2[30]);
    swift_task_dealloc();
    type metadata accessor for AvailabilityManager();
    swift_initStaticObject();
    uint64_t v3 = (void *)swift_task_alloc();
    v2[35] = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_1A8D4CAAC;
    return sub_1A8CDBE18((uint64_t)(v2 + 16));
  }
}

uint64_t sub_1A8D4CAAC()
{
  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A8D4D3A0;
  }
  else {
    uint64_t v2 = sub_1A8D4CBC0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4CBC0(__n128 a1)
{
  uint64_t v2 = sub_1A8CE6A68(a1);
  *(void *)(v1 + 296) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 304) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1A8D4CC78;
  return MEMORY[0x1F411BFB8](v2);
}

uint64_t sub_1A8D4CC78()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A8D4D410;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_1A8D4CD94;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4CD94()
{
  id v1 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
  char v2 = sub_1A8CB9D9C();

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1A8D4CE44;
  return MEMORY[0x1F411BFC0](v2 & 1);
}

uint64_t sub_1A8D4CE44()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0) {
    char v2 = sub_1A8D4D48C;
  }
  else {
    char v2 = sub_1A8D4CF58;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4CF58()
{
  BOOL v1 = objc_msgSend(*(id *)(v0 + 232), sel_status) == 0;
  char v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v2;
  *char v2 = v0;
  v2[1] = sub_1A8D4D008;
  return MEMORY[0x1F411BFC0](v1);
}

uint64_t sub_1A8D4D008()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    char v2 = sub_1A8D4D4FC;
  }
  else {
    char v2 = sub_1A8D4D11C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4D11C()
{
  uint64_t v1 = *(void **)(v0 + 232);
  swift_release();

  char v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1A8D4D188()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D1F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D25C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D2C0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D324()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D3A0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D410()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D48C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4D4FC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_1A8D4D590()
{
  if ((sub_1A8D419C0() & 1) == 0) {
    return 0;
  }
  if (qword_1EB5EA2D8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB5EA2D0;
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

uint64_t static GMBypass.setADMBypass(_:)(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1A8D419C0();
  if (result)
  {
    if (qword_1EB5EA2D8 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_1EB5EA2D0;
    uint64_t v9 = (void *)sub_1A8D59BC0();
    uint64_t v10 = a1 & 1;
    objc_msgSend(v8, sel_setBool_forKey_, v10, v9);

    uint64_t v11 = sub_1A8D59E10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = v1;
    *(unsigned char *)(v12 + 40) = v10;
    sub_1A8C82C08((uint64_t)v6, (uint64_t)&unk_1E979FB18, v12);
    return swift_release();
  }
  return result;
}

{
  uint64_t v1;

  *(unsigned char *)(v1 + 24) = a1;
  return MEMORY[0x1F4188298](sub_1A8D4DA24, 0, 0);
}

uint64_t sub_1A8D4D7C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v7 = swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *(void *)uint64_t v7 = v5;
  *(void *)(v7 + 8) = sub_1A8C81994;
  *(unsigned char *)(v7 + 152) = a5;
  return MEMORY[0x1F4188298](sub_1A8D4E00C, 0, 0);
}

uint64_t sub_1A8D4DA24()
{
  if (sub_1A8D419C0())
  {
    if (qword_1EB5EA2D8 != -1) {
      swift_once();
    }
    uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
    id v2 = (void *)qword_1EB5EA2D0;
    uint64_t v3 = (void *)sub_1A8D59BC0();
    objc_msgSend(v2, sel_setBool_forKey_, v1, v3);

    uint64_t v4 = swift_task_alloc();
    *(void *)(v0 + 16) = v4;
    *(void *)uint64_t v4 = v0;
    *(void *)(v4 + 8) = sub_1A8C81994;
    *(unsigned char *)(v4 + 152) = *(unsigned char *)(v0 + 24);
    return MEMORY[0x1F4188298](sub_1A8D4E00C, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

id GMBypass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMBypass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A8D4DC08(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      unint64_t v10 = *v8;
      uint64_t v11 = qword_1EB5EAB78;
      swift_bridgeObjectRetain();
      if (v11 != -1) {
        swift_once();
      }
      id v12 = FeatureCache.cachedFeature(identifier:altDSID:allowAnySession:ignoreTTL:)(v9, v10, a2, a3, 0, 0);
      uint64_t v13 = swift_bridgeObjectRelease();
      if (v12)
      {
        MEMORY[0x1AD0E5C70](v13);
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1A8D59D80();
        }
        sub_1A8D59DA0();
        sub_1A8D59D70();
      }
      v8 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return v14;
  }
  return result;
}

uint64_t _s25CloudSubscriptionFeatures8GMBypassC22setGMEligibilityBypassyySbFZ_0(char a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1A8D419C0();
  if (result)
  {
    if (qword_1EB5EA2D8 != -1) {
      swift_once();
    }
    uint64_t v7 = (void *)qword_1EB5EA2D0;
    uint64_t v8 = (void *)sub_1A8D59DB0();
    uint64_t v9 = (void *)sub_1A8D59BC0();
    objc_msgSend(v7, sel_setValue_forKey_, v8, v9);

    uint64_t v10 = sub_1A8D59E10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = 0;
    *(void *)(v11 + 24) = 0;
    *(unsigned char *)(v11 + 32) = a1 & 1;
    sub_1A8C82C08((uint64_t)v5, (uint64_t)&unk_1E979FB40, v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A8D4DEF0()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 41, 7);
}

uint64_t sub_1A8D4DF28(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1A8C81A88;
  return sub_1A8D4D7C0(a1, v4, v5, v6, v7);
}

uint64_t sub_1A8D4DFEC(char a1)
{
  *(unsigned char *)(v1 + 152) = a1;
  return MEMORY[0x1F4188298](sub_1A8D4E00C, 0, 0);
}

uint64_t sub_1A8D4E00C()
{
  uint64_t v70 = v0;
  if (qword_1EB5EAEF8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A8D59A80();
  *(void *)(v0 + 88) = __swift_project_value_buffer(v1, (uint64_t)qword_1EB5EAEE0);
  uint64_t v2 = sub_1A8D59A60();
  os_log_type_t v3 = sub_1A8D59EC0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v69[0] = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 80) = sub_1A8C90120(0xD00000000000001ELL, 0x80000001A8D67570, v69);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v2, v3, "%s Updating availability.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
    MEMORY[0x1AD0E6EB0](v4, -1, -1);
  }

  int v6 = *(unsigned __int8 *)(v0 + 152);
  sub_1A8D599A0();
  swift_allocObject();
  *(void *)(v0 + 96) = sub_1A8D59990();
  double v65 = (uint64_t *)(v0 + 64);
  if (v6 == 1)
  {
    if (qword_1E979E438 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_1E97A8B28;
    int64_t v8 = *(void *)(qword_1E97A8B28 + 16);
    uint64_t v9 = MEMORY[0x1E4FBC860];
    if (v8)
    {
      uint64_t v66 = v0;
      v69[0] = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      sub_1A8CB65DC(0, v8, 0);
      uint64_t v9 = v69[0];
      unint64_t v10 = *(void *)(v69[0] + 16);
      uint64_t v11 = 24 * v10 + 48;
      uint64_t v12 = (uint64_t *)(v7 + 40);
      do
      {
        uint64_t v13 = *(v12 - 1);
        uint64_t v14 = *v12;
        v69[0] = v9;
        int64_t v15 = v10 + 1;
        unint64_t v16 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        if (v10 >= v16 >> 1)
        {
          sub_1A8CB65DC(v16 > 1, v15, 1);
          uint64_t v9 = v69[0];
        }
        *(void *)(v9 + 16) = v15;
        os_log_type_t v17 = (unsigned char *)(v9 + v11);
        *((void *)v17 - 2) = v13;
        *((void *)v17 - 1) = v14;
        *os_log_type_t v17 = 1;
        v11 += 24;
        v12 += 2;
        ++v10;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
      uint64_t v0 = v66;
    }
    if (*(void *)(v9 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9900);
      uint64_t v25 = sub_1A8D5A1F0();
    }
    else
    {
      uint64_t v25 = MEMORY[0x1E4FBC868];
    }
    v69[0] = v25;
    uint64_t v44 = swift_bridgeObjectRetain();
    sub_1A8CDD738(v44, 1, v69);
    swift_bridgeObjectRelease();
    uint64_t v45 = v69[0];
    *(void *)(v0 + 104) = v69[0];
    swift_retain_n();
    uint64_t v46 = sub_1A8D59A60();
    os_log_type_t v47 = sub_1A8D59EC0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      v69[0] = v49;
      *(_DWORD *)uint64_t v48 = 136315394;
      *double v65 = sub_1A8C90120(0xD00000000000001ELL, 0x80000001A8D67570, v69);
      sub_1A8D59FE0();
      *(_WORD *)(v48 + 12) = 2080;
      swift_retain();
      uint64_t v50 = sub_1A8D59B40();
      unint64_t v52 = v51;
      swift_release();
      *(void *)(v0 + 72) = sub_1A8C90120(v50, v52, v69);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1A8C7F000, v46, v47, "%s Updating access cache with bypassed features: %s", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v49, -1, -1);
      MEMORY[0x1AD0E6EB0](v48, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v53;
    void *v53 = v0;
    v53[1] = sub_1A8D4EA30;
    uint64_t v29 = v45;
    goto LABEL_46;
  }
  id v18 = sub_1A8C8E338();
  id v19 = objc_msgSend(v18, sel_aa_primaryAppleAccount);
  if (v19
    && (os_log_type_t v20 = v19, v21 = objc_msgSend(v19, sel_aa_altDSID), v20, v21))
  {
    uint64_t v22 = (uint64_t *)sub_1A8D59BF0();
    unint64_t v24 = v23;
  }
  else
  {

    uint64_t v22 = 0;
    unint64_t v24 = 0;
  }
  if (qword_1E979E438 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = swift_bridgeObjectRetain();
  unint64_t v27 = sub_1A8D4DC08(v26, v22, v24);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1A8D5A1C0();
    swift_bridgeObjectRelease();
    if (v28)
    {
LABEL_24:
      v69[0] = MEMORY[0x1E4FBC860];
      uint64_t v29 = sub_1A8CB65DC(0, v28 & ~(v28 >> 63), 0);
      if (v28 < 0)
      {
        __break(1u);
        return MEMORY[0x1F411BFD0](v29);
      }
      uint64_t v67 = v0;
      uint64_t v30 = 0;
      uint64_t v31 = v69[0];
      unint64_t v68 = v27 & 0xC000000000000001;
      unint64_t v32 = v27;
      uint64_t v33 = v28;
      do
      {
        if (v68) {
          uint64_t v34 = (char *)MEMORY[0x1AD0E6030](v30, v27);
        }
        else {
          uint64_t v34 = (char *)*(id *)(v27 + 8 * v30 + 32);
        }
        unint64_t v35 = v34;
        uint64_t v37 = *(void *)&v34[OBJC_IVAR___CloudFeature_featureID];
        uint64_t v36 = *(void *)&v34[OBJC_IVAR___CloudFeature_featureID + 8];
        uint64_t v38 = &v34[OBJC_IVAR___CloudFeature_canUse];
        swift_beginAccess();
        char v39 = *v38;
        swift_bridgeObjectRetain();

        v69[0] = v31;
        unint64_t v41 = *(void *)(v31 + 16);
        unint64_t v40 = *(void *)(v31 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_1A8CB65DC(v40 > 1, v41 + 1, 1);
          uint64_t v31 = v69[0];
        }
        ++v30;
        *(void *)(v31 + 16) = v41 + 1;
        uint64_t v42 = v31 + 24 * v41;
        *(void *)(v42 + 32) = v37;
        *(void *)(v42 + 40) = v36;
        *(unsigned char *)(v42 + 48) = v39;
        unint64_t v27 = v32;
      }
      while (v33 != v30);
      swift_bridgeObjectRelease();
      uint64_t v0 = v67;
      if (*(void *)(v31 + 16)) {
        goto LABEL_33;
      }
LABEL_41:
      uint64_t v43 = MEMORY[0x1E4FBC868];
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v28) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(MEMORY[0x1E4FBC860] + 16)) {
    goto LABEL_41;
  }
LABEL_33:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5E9900);
  uint64_t v43 = sub_1A8D5A1F0();
LABEL_42:
  v69[0] = v43;
  uint64_t v54 = swift_bridgeObjectRetain();
  sub_1A8CDD738(v54, 1, v69);
  swift_bridgeObjectRelease();
  uint64_t v55 = v69[0];
  *(void *)(v0 + 128) = v69[0];
  swift_retain_n();
  uint64_t v56 = sub_1A8D59A60();
  os_log_type_t v57 = sub_1A8D59EC0();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    v69[0] = v59;
    *(_DWORD *)uint64_t v58 = 136315394;
    *(void *)(v0 + 48) = sub_1A8C90120(0xD00000000000001ELL, 0x80000001A8D67570, v69);
    sub_1A8D59FE0();
    *(_WORD *)(v58 + 12) = 2080;
    swift_retain();
    uint64_t v60 = sub_1A8D59B40();
    unint64_t v62 = v61;
    swift_release();
    *(void *)(v0 + 56) = sub_1A8C90120(v60, v62, v69);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1A8C7F000, v56, v57, "%s Updating access cache with cached features: %s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v59, -1, -1);
    MEMORY[0x1AD0E6EB0](v58, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v63 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v63;
  *uint64_t v63 = v0;
  v63[1] = sub_1A8D4ECD0;
  uint64_t v29 = v55;
LABEL_46:
  return MEMORY[0x1F411BFD0](v29);
}

uint64_t sub_1A8D4EA30()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1A8D4EF70;
  }
  else {
    uint64_t v2 = sub_1A8D4EB44;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4EB44()
{
  uint64_t v8 = v0;
  swift_release();
  uint64_t v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59EC0();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)os_log_type_t v3 = 136315138;
    *(void *)(v0 + 40) = sub_1A8C90120(0xD00000000000001ELL, 0x80000001A8D67570, &v7);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v1, v2, "%s Finished updating availability.", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v4, -1, -1);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }
  swift_release();

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1A8D4ECD0()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_1A8D4EFDC;
  }
  else {
    os_log_type_t v2 = sub_1A8D4EDE4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A8D4EDE4()
{
  uint64_t v8 = v0;
  swift_release();
  uint64_t v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59EC0();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)os_log_type_t v3 = 136315138;
    *(void *)(v0 + 40) = sub_1A8C90120(0xD00000000000001ELL, 0x80000001A8D67570, &v7);
    sub_1A8D59FE0();
    _os_log_impl(&dword_1A8C7F000, v1, v2, "%s Finished updating availability.", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v4, -1, -1);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }
  swift_release();

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1A8D4EF70()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A8D4EFDC()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for GMBypass()
{
  return self;
}

uint64_t sub_1A8D4F070(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1A8C81994;
  return sub_1A8D4D7C0(a1, v4, v5, v6, v7);
}

uint64_t sub_1A8D4F134(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A8D4F194()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 33, 7);
}

uint64_t sub_1A8D4F1CC()
{
  char v2 = *(unsigned char *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1A8C81A88;
  *(unsigned char *)(v3 + 352) = v2;
  return MEMORY[0x1F4188298](sub_1A8D4BDE4, 0, 0);
}

uint64_t sub_1A8D4F27C()
{
  return 91;
}

uint64_t initializeWithCopy for NetworkRequestDiagnostic(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NetworkRequestDiagnostic(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NetworkRequestDiagnostic(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkRequestDiagnostic(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkRequestDiagnostic(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkRequestDiagnostic()
{
  return &type metadata for NetworkRequestDiagnostic;
}

uint64_t sub_1A8D4F510(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[0] = a4;
  v13[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FB88);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D502E0();
  sub_1A8D5A510();
  char v15 = 0;
  sub_1A8D5A320();
  if (!v5)
  {
    char v14 = 1;
    sub_1A8D5A320();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1A8D4F684(void *a1)
{
  long long v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FB48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D4FA68();
  sub_1A8D5A510();
  long long v10 = v3[1];
  long long v13 = *v3;
  long long v14 = v10;
  v12[15] = 0;
  sub_1A8D4FABC();
  sub_1A8D5A340();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_1A8D5A300();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_1A8D4F800()
{
  return 0xD000000000000018;
}

uint64_t sub_1A8D4F830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D4FB10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D4F858(uint64_t a1)
{
  unint64_t v2 = sub_1A8D502E0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D4F894(uint64_t a1)
{
  unint64_t v2 = sub_1A8D502E0();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A8D4F8D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A8D4FBFC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1A8D4F900(void *a1)
{
  return sub_1A8D4F510(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_1A8D4F920()
{
  if (*v0) {
    return 0x7461745370747468;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_1A8D4F96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D4FE04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D4F994(uint64_t a1)
{
  unint64_t v2 = sub_1A8D4FA68();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D4F9D0(uint64_t a1)
{
  unint64_t v2 = sub_1A8D4FA68();
  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1A8D4FA0C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1A8D4FF18(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_1A8D4FA50(void *a1)
{
  return sub_1A8D4F684(a1);
}

unint64_t sub_1A8D4FA68()
{
  unint64_t result = qword_1E979FB50;
  if (!qword_1E979FB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB50);
  }
  return result;
}

unint64_t sub_1A8D4FABC()
{
  unint64_t result = qword_1E979FB58;
  if (!qword_1E979FB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB58);
  }
  return result;
}

uint64_t sub_1A8D4FB10(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000018 && a2 == 0x80000001A8D675E0 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001A8D67600)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8D4FBFC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FB98);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D502E0();
  sub_1A8D5A4F0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    uint64_t v8 = sub_1A8D5A290();
    char v11 = 1;
    swift_bridgeObjectRetain();
    sub_1A8D5A290();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_1A8D4FE04(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000001A8D675C0 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461745370747468 && a2 == 0xEE0065646F437375)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8D4FF18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FB60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D4FA68();
  sub_1A8D5A4F0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v23 = 0;
  sub_1A8D50160();
  sub_1A8D5A2B0();
  uint64_t v10 = v20;
  uint64_t v11 = v22;
  uint64_t v17 = v21;
  uint64_t v18 = v19;
  LOBYTE(v19) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1A8D5A270();
  long long v13 = v9;
  char v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v15 & 1;
  return result;
}

unint64_t sub_1A8D50160()
{
  unint64_t result = qword_1E979FB68;
  if (!qword_1E979FB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB68);
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkRequestDiagnostic.CodingKeys()
{
  return &type metadata for NetworkRequestDiagnostic.CodingKeys;
}

ValueMetadata *type metadata accessor for NetworkRequestDiagnostic.CapabilityHeaders()
{
  return &type metadata for NetworkRequestDiagnostic.CapabilityHeaders;
}

unint64_t sub_1A8D501DC()
{
  unint64_t result = qword_1E979FB70;
  if (!qword_1E979FB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB70);
  }
  return result;
}

unint64_t sub_1A8D50234()
{
  unint64_t result = qword_1E979FB78;
  if (!qword_1E979FB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB78);
  }
  return result;
}

unint64_t sub_1A8D5028C()
{
  unint64_t result = qword_1E979FB80;
  if (!qword_1E979FB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB80);
  }
  return result;
}

unint64_t sub_1A8D502E0()
{
  unint64_t result = qword_1E979FB90;
  if (!qword_1E979FB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FB90);
  }
  return result;
}

unsigned char *_s25CloudSubscriptionFeatures24NetworkRequestDiagnosticV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D50400);
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

ValueMetadata *type metadata accessor for NetworkRequestDiagnostic.CapabilityHeaders.CodingKeys()
{
  return &type metadata for NetworkRequestDiagnostic.CapabilityHeaders.CodingKeys;
}

unint64_t sub_1A8D5043C()
{
  unint64_t result = qword_1E979FBA0;
  if (!qword_1E979FBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBA0);
  }
  return result;
}

unint64_t sub_1A8D50494()
{
  unint64_t result = qword_1E979FBA8;
  if (!qword_1E979FBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBA8);
  }
  return result;
}

unint64_t sub_1A8D504EC()
{
  unint64_t result = qword_1E979FBB0;
  if (!qword_1E979FBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBB0);
  }
  return result;
}

CloudSubscriptionFeatures::FrameworkDiagnostics::DiagnosticKey_optional __swiftcall FrameworkDiagnostics.DiagnosticKey.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1A8D5A220();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t FrameworkDiagnostics.DiagnosticKey.rawValue.getter()
{
  uint64_t v1 = 0x74657373416D6661;
  if (*v0 != 1) {
    uint64_t v1 = 0x74657373416D6461;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x5265727574616566;
  }
}

uint64_t sub_1A8D50610(char *a1, unsigned __int8 *a2)
{
  return sub_1A8CF7290(*a1, *a2);
}

uint64_t sub_1A8D5061C()
{
  return sub_1A8D5A4D0();
}

uint64_t sub_1A8D506D8()
{
  sub_1A8D59C80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8D50780()
{
  return sub_1A8D5A4D0();
}

CloudSubscriptionFeatures::FrameworkDiagnostics::DiagnosticKey_optional sub_1A8D50838(Swift::String *a1)
{
  return FrameworkDiagnostics.DiagnosticKey.init(rawValue:)(*a1);
}

void sub_1A8D50844(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEE00747365757165;
  uint64_t v4 = 0x74657373416D6661;
  if (v2 != 1) {
    uint64_t v4 = 0x74657373416D6461;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0x5265727574616566;
  }
  if (!v5) {
    unint64_t v3 = 0xE900000000000073;
  }
  *a1 = v6;
  a1[1] = v3;
}

void static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1A8D59BC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    unint64_t v3 = (void *)sub_1A8D59BC0();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v2, sel_dataForKey_, v3);

    if (v4)
    {
      uint64_t v19 = sub_1A8D595D0();
      unint64_t v6 = v5;

      sub_1A8D593A0();
      swift_allocObject();
      sub_1A8D59390();
      uint64_t v7 = sub_1A8D59360();
      MEMORY[0x1F4188790](v7, v8);
      (*(void (**)(char *, void))(v10 + 104))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F26CA0]);
      sub_1A8D59370();
      uint64_t v11 = v19;
      sub_1A8D59380();
      swift_release();
      sub_1A8C93C98(v11, v6);
    }
    else
    {
      sub_1A8D50C48();
      swift_allocError();
      *uint64_t v17 = 1;
      swift_willThrow();
    }
  }
  else
  {
    if (qword_1E979E460 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1A8D59A80();
    __swift_project_value_buffer(v12, (uint64_t)qword_1E979F030);
    long long v13 = sub_1A8D59A60();
    os_log_type_t v14 = sub_1A8D59EF0();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_1A8C7F000, v13, v14, "Failed to initialize diagnostics default. Diagnostics can not be saved.", v15, 2u);
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }

    sub_1A8D50C48();
    swift_allocError();
    *unint64_t v16 = 0;
    swift_willThrow();
  }
}

unint64_t sub_1A8D50C48()
{
  unint64_t result = qword_1E979FBB8;
  if (!qword_1E979FBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBB8);
  }
  return result;
}

unint64_t sub_1A8D50CA0()
{
  unint64_t result = qword_1E979FBC0;
  if (!qword_1E979FBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FrameworkDiagnostics()
{
  return &type metadata for FrameworkDiagnostics;
}

unsigned char *storeEnumTagSinglePayload for FrameworkDiagnostics.DiagnosticKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D50DD0);
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

ValueMetadata *type metadata accessor for FrameworkDiagnostics.DiagnosticKey()
{
  return &type metadata for FrameworkDiagnostics.DiagnosticKey;
}

unsigned char *storeEnumTagSinglePayload for FrameworkDiagnostics.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D50ED4);
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

ValueMetadata *type metadata accessor for FrameworkDiagnostics.Error()
{
  return &type metadata for FrameworkDiagnostics.Error;
}

unint64_t sub_1A8D50F10()
{
  unint64_t result = qword_1E979FBC8;
  if (!qword_1E979FBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBC8);
  }
  return result;
}

uint64_t sub_1A8D50F64(unsigned __int8 *a1, void *a2)
{
  unint64_t v3 = v2;
  int v5 = *a1;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v7 = (void *)sub_1A8D59BC0();
  id v8 = objc_msgSend(v6, sel_initWithSuiteName_, v7);

  if (v8)
  {
    if (qword_1E979E460 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A8D59A80();
    uint64_t v44 = __swift_project_value_buffer(v9, (uint64_t)qword_1E979F030);
    uint64_t v10 = sub_1A8D59A60();
    os_log_type_t v11 = sub_1A8D59F00();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v43 = v2;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v46 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v14 = 0x74657373416D6661;
      if (v5 != 1) {
        uint64_t v14 = 0x74657373416D6461;
      }
      int v15 = v5;
      if (v5) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = 0x5265727574616566;
      }
      if (v5) {
        unint64_t v17 = 0xE900000000000073;
      }
      else {
        unint64_t v17 = 0xEE00747365757165;
      }
      uint64_t v45 = sub_1A8C90120(v16, v17, &v46);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A8C7F000, v10, v11, "Attempting to save diagnostics for %s to user defaults.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v13, -1, -1);
      MEMORY[0x1AD0E6EB0](v12, -1, -1);

      int v5 = v15;
      unint64_t v3 = v43;
    }
    else
    {
    }
    sub_1A8D59420();
    swift_allocObject();
    sub_1A8D59410();
    uint64_t v24 = sub_1A8D593C0();
    MEMORY[0x1F4188790](v24 - 8, v25);
    sub_1A8D593B0();
    sub_1A8D593D0();
    uint64_t v26 = sub_1A8D593E0();
    MEMORY[0x1F4188790](v26, v27);
    (*(void (**)(char *, void))(v29 + 104))((char *)&v42 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F26D18]);
    sub_1A8D593F0();
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    uint64_t v30 = sub_1A8D59400();
    if (!v3)
    {
      uint64_t v32 = v30;
      unint64_t v43 = v31;
      uint64_t v33 = (void *)sub_1A8D595B0();
      uint64_t v34 = (void *)sub_1A8D59BC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setObject_forKey_, v33, v34);

      unint64_t v35 = sub_1A8D59A60();
      os_log_type_t v36 = sub_1A8D59F00();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        uint64_t v46 = v44;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v38 = 0x74657373416D6661;
        if (v5 != 1) {
          uint64_t v38 = 0x74657373416D6461;
        }
        if (v5) {
          uint64_t v39 = v38;
        }
        else {
          uint64_t v39 = 0x5265727574616566;
        }
        if (v5) {
          unint64_t v40 = 0xE900000000000073;
        }
        else {
          unint64_t v40 = 0xEE00747365757165;
        }
        uint64_t v45 = sub_1A8C90120(v39, v40, &v46);
        sub_1A8D59FE0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A8C7F000, v35, v36, "Saved diagnostics for %s to user defaults.", v37, 0xCu);
        uint64_t v41 = v44;
        swift_arrayDestroy();
        MEMORY[0x1AD0E6EB0](v41, -1, -1);
        MEMORY[0x1AD0E6EB0](v37, -1, -1);
      }
      sub_1A8C93C98(v32, v43);
    }
    return swift_release();
  }
  else
  {
    if (qword_1E979E460 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A8D59A80();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E979F030);
    uint64_t v19 = sub_1A8D59A60();
    os_log_type_t v20 = sub_1A8D59EF0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A8C7F000, v19, v20, "Failed to initialize diagnostics defaults. Diagnostics can not be saved.", v21, 2u);
      MEMORY[0x1AD0E6EB0](v21, -1, -1);
    }

    sub_1A8D50C48();
    swift_allocError();
    *uint64_t v22 = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1A8D51608(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FC58);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D54004();
  sub_1A8D5A510();
  v9[15] = 0;
  sub_1A8D5A320();
  if (!v1)
  {
    v9[14] = 1;
    sub_1A8D5A330();
    type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic(0);
    v9[13] = 2;
    sub_1A8D596F0();
    sub_1A8C93C40((unint64_t *)&unk_1EB5E92B0);
    sub_1A8D5A310();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1A8D517C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FC68);
  uint64_t v4 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24, v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic(0);
  MEMORY[0x1F4188790](v8, v9);
  os_log_type_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D54004();
  sub_1A8D5A4F0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v12 = v4;
  uint64_t v13 = v23;
  char v27 = 0;
  uint64_t v14 = (uint64_t)v11;
  *(void *)os_log_type_t v11 = sub_1A8D5A290();
  *((void *)v11 + 1) = v15;
  char v26 = 1;
  unsigned char v11[16] = sub_1A8D5A2A0() & 1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
  v22[1] = (uint64_t)v22;
  MEMORY[0x1F4188790](v16 - 8, v17);
  uint64_t v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D596F0();
  char v25 = 2;
  sub_1A8C93C40(&qword_1EB5EA168);
  v22[0] = (uint64_t)v19;
  uint64_t v20 = v24;
  sub_1A8D5A280();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v20);
  sub_1A8C921A0(v22[0], v14 + *(int *)(v8 + 24));
  sub_1A8D54058(v14, v13, type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A8D540C0(v14, type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic);
}

uint64_t sub_1A8D51AF0()
{
  uint64_t v1 = 0x6573556E6163;
  if (*v0 != 1) {
    uint64_t v1 = 7107700;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4965727574616566;
  }
}

uint64_t sub_1A8D51B44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D53CC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D51B6C(uint64_t a1)
{
  unint64_t v2 = sub_1A8D54004();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D51BA8(uint64_t a1)
{
  unint64_t v2 = sub_1A8D54004();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A8D51BE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A8D517C8(a1, a2);
}

uint64_t sub_1A8D51BFC(void *a1)
{
  return sub_1A8D51608(a1);
}

uint64_t sub_1A8D51C14()
{
  uint64_t result = 0x4472656767697274;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x74736575716572;
      break;
    case 2:
      uint64_t result = 0x7365727574616566;
      break;
    case 3:
      uint64_t result = 0x6974656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A8D51CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D53E0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D51CE0(uint64_t a1)
{
  unint64_t v2 = sub_1A8D51FE4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D51D1C(uint64_t a1)
{
  unint64_t v2 = sub_1A8D51FE4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t FeatureRequestDiagnostic.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FBD0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D51FE4();
  sub_1A8D5A510();
  LOBYTE(v16[0]) = 0;
  sub_1A8D596F0();
  sub_1A8C93C40((unint64_t *)&unk_1EB5E92B0);
  sub_1A8D5A340();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for FeatureRequestDiagnostic(0);
    uint64_t v11 = v3 + *(int *)(v10 + 20);
    uint64_t v12 = *(void *)(v11 + 32);
    char v13 = *(unsigned char *)(v11 + 40);
    long long v14 = *(_OWORD *)(v11 + 16);
    v16[0] = *(_OWORD *)v11;
    v16[1] = v14;
    uint64_t v17 = v12;
    char v18 = v13;
    char v19 = 1;
    sub_1A8D52058();
    sub_1A8D5A310();
    *(void *)&v16[0] = *(void *)(v3 + *(int *)(v10 + 24));
    char v19 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FBE8);
    sub_1A8D52690(&qword_1E979FBF0, &qword_1E979FBF8);
    sub_1A8D5A310();
    LOBYTE(v16[0]) = 3;
    sub_1A8D5A340();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_1A8D51FE4()
{
  unint64_t result = qword_1E979FBD8;
  if (!qword_1E979FBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBD8);
  }
  return result;
}

uint64_t type metadata accessor for FeatureRequestDiagnostic(uint64_t a1)
{
  return sub_1A8D520CC(a1, (uint64_t *)&unk_1E979FC20);
}

unint64_t sub_1A8D52058()
{
  unint64_t result = qword_1E979FBE0;
  if (!qword_1E979FBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FBE0);
  }
  return result;
}

uint64_t type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic(uint64_t a1)
{
  return sub_1A8D520CC(a1, (uint64_t *)&unk_1E979FC30);
}

uint64_t sub_1A8D520CC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FeatureRequestDiagnostic.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FC00);
  uint64_t v4 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40, v5);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FeatureRequestDiagnostic(0);
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D51FE4();
  uint64_t v39 = v7;
  sub_1A8D5A4F0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  unint64_t v35 = v11;
  os_log_type_t v36 = a1;
  uint64_t v37 = v4;
  uint64_t v34 = v8;
  uint64_t v12 = sub_1A8D596F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12, v15);
  LOBYTE(v41) = 0;
  uint64_t v16 = sub_1A8C93C40(&qword_1EB5EA168);
  uint64_t v17 = v39;
  uint64_t v18 = v40;
  sub_1A8D5A2B0();
  uint64_t v33 = v16;
  char v19 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v19(v35, (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  char v45 = 1;
  sub_1A8D5263C();
  sub_1A8D5A280();
  uint64_t v30 = (void (*)(uint64_t, char *, uint64_t))v19;
  uint64_t v31 = v13 + 32;
  uint64_t v32 = v13;
  uint64_t v20 = v43;
  char v21 = v44;
  uint64_t v23 = v34;
  uint64_t v22 = (uint64_t)v35;
  uint64_t v24 = &v35[*(int *)(v34 + 20)];
  long long v25 = v42;
  *(_OWORD *)uint64_t v24 = v41;
  *((_OWORD *)v24 + 1) = v25;
  *((void *)v24 + 4) = v20;
  v24[40] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FBE8);
  char v45 = 2;
  sub_1A8D52690(&qword_1E979FC10, &qword_1E979FC18);
  uint64_t v26 = sub_1A8D5A280();
  uint64_t v29 = (uint64_t)&v29;
  *(void *)(v22 + *(int *)(v23 + 24)) = v41;
  MEMORY[0x1F4188790](v26, v27);
  LOBYTE(v41) = 3;
  sub_1A8D5A2B0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v18);
  v30(v22 + *(int *)(v23 + 28), (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  sub_1A8D54058(v22, v38, type metadata accessor for FeatureRequestDiagnostic);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  return sub_1A8D540C0(v22, type metadata accessor for FeatureRequestDiagnostic);
}

unint64_t sub_1A8D5263C()
{
  unint64_t result = qword_1E979FC08;
  if (!qword_1E979FC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC08);
  }
  return result;
}

uint64_t sub_1A8D52690(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E979FBE8);
    sub_1A8D52710(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8D52710(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A8D52754@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FeatureRequestDiagnostic.init(from:)(a1, a2);
}

uint64_t sub_1A8D5276C(void *a1)
{
  return FeatureRequestDiagnostic.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for FeatureRequestDiagnostic(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A8D596F0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *((void *)v11 + 1);
    if (v12)
    {
      *(void *)uint64_t v10 = *(void *)v11;
      *((void *)v10 + 1) = v12;
      uint64_t v13 = *((void *)v11 + 3);
      *((void *)v10 + 2) = *((void *)v11 + 2);
      *((void *)v10 + 3) = v13;
      *((void *)v10 + 4) = *((void *)v11 + 4);
      v10[40] = v11[40];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v15 = *((_OWORD *)v11 + 1);
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
      *((_OWORD *)v10 + 1) = v15;
      *(_OWORD *)(v10 + 25) = *(_OWORD *)(v11 + 25);
    }
    uint64_t v16 = a3[7];
    *(void *)&a1[a3[6]] = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v17 = &a1[v16];
    uint64_t v18 = (char *)a2 + v16;
    swift_bridgeObjectRetain();
    v8(v17, v18, v7);
  }
  return a1;
}

uint64_t destroy for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A8D596F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v7(a1, v4);
  if (*(void *)(a1 + *(int *)(a2 + 20) + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
}

uint64_t initializeWithCopy for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void *)(v10 + 8);
  if (v11)
  {
    *(void *)uint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = v11;
    uint64_t v12 = *(void *)(v10 + 24);
    *(void *)(v9 + 16) = *(void *)(v10 + 16);
    *(void *)(v9 + 24) = v12;
    *(void *)(v9 + 32) = *(void *)(v10 + 32);
    *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    *(_OWORD *)(v9 + 16) = v13;
    *(_OWORD *)(v9 + 25) = *(_OWORD *)(v10 + 25);
  }
  uint64_t v14 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  swift_bridgeObjectRetain();
  v7(v15, v16, v6);
  return a1;
}

uint64_t assignWithCopy for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (long long *)(a2 + v8);
  uint64_t v11 = *(void *)(a1 + v8 + 8);
  uint64_t v12 = *(void *)(a2 + v8 + 8);
  if (v11)
  {
    if (v12)
    {
      *(void *)uint64_t v9 = *(void *)v10;
      *(void *)(v9 + 8) = *((void *)v10 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v9 + 16) = *((void *)v10 + 2);
      *(void *)(v9 + 24) = *((void *)v10 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v13 = *((void *)v10 + 4);
      *(unsigned char *)(v9 + 40) = *((unsigned char *)v10 + 40);
      *(void *)(v9 + 32) = v13;
    }
    else
    {
      sub_1A8D52C48(v9);
      long long v15 = *(long long *)((char *)v10 + 25);
      long long v16 = v10[1];
      *(_OWORD *)uint64_t v9 = *v10;
      *(_OWORD *)(v9 + 16) = v16;
      *(_OWORD *)(v9 + 25) = v15;
    }
  }
  else if (v12)
  {
    *(void *)uint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = *((void *)v10 + 1);
    *(void *)(v9 + 16) = *((void *)v10 + 2);
    *(void *)(v9 + 24) = *((void *)v10 + 3);
    uint64_t v14 = *((void *)v10 + 4);
    *(unsigned char *)(v9 + 40) = *((unsigned char *)v10 + 40);
    *(void *)(v9 + 32) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *v10;
    long long v18 = v10[1];
    *(_OWORD *)(v9 + 25) = *(long long *)((char *)v10 + 25);
    *(_OWORD *)uint64_t v9 = v17;
    *(_OWORD *)(v9 + 16) = v18;
  }
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_1A8D52C48(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (_OWORD *)(a1 + v8);
  uint64_t v11 = (_OWORD *)(a2 + v8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  long long v13 = *(_OWORD *)((char *)v11 + 25);
  uint64_t v14 = *(void *)(a2 + v9);
  *(_OWORD *)((char *)v10 + 25) = v13;
  *(void *)(a1 + v9) = v14;
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t assignWithTake for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  if (!*(void *)(a1 + v8 + 8)) {
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(v10 + 8);
  if (!v11)
  {
    sub_1A8D52C48(v9);
LABEL_5:
    long long v13 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    *(_OWORD *)(v9 + 16) = v13;
    *(_OWORD *)(v9 + 25) = *(_OWORD *)(v10 + 25);
    goto LABEL_6;
  }
  *(void *)uint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v10 + 24);
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(void *)(v9 + 24) = v12;
  swift_bridgeObjectRelease();
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
LABEL_6:
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8D52E84);
}

uint64_t sub_1A8D52E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for FeatureRequestDiagnostic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8D52F68);
}

uint64_t sub_1A8D52F68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A8D596F0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_1A8D53028()
{
  uint64_t result = sub_1A8D596F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1A8D530C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1A8D596F0();
    uint64_t v10 = *(void *)(v9 - 8);
    int v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1A8D53244(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1A8D596F0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_1A8D53314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_1A8D596F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_1A8D53440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_1A8D596F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_1A8D535E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_1A8D596F0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_1A8D536FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_1A8D596F0();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1A8D5388C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8D538A0);
}

uint64_t sub_1A8D538A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1A8D53954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8D53968);
}

uint64_t sub_1A8D53968(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EACF0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1A8D53A14()
{
  sub_1A8C82EE4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for FeatureRequestDiagnostic.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D53B80);
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

ValueMetadata *type metadata accessor for FeatureRequestDiagnostic.CodingKeys()
{
  return &type metadata for FeatureRequestDiagnostic.CodingKeys;
}

unint64_t sub_1A8D53BBC()
{
  unint64_t result = qword_1E979FC40;
  if (!qword_1E979FC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC40);
  }
  return result;
}

unint64_t sub_1A8D53C14()
{
  unint64_t result = qword_1E979FC48;
  if (!qword_1E979FC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC48);
  }
  return result;
}

unint64_t sub_1A8D53C6C()
{
  unint64_t result = qword_1E979FC50;
  if (!qword_1E979FC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC50);
  }
  return result;
}

uint64_t sub_1A8D53CC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4965727574616566 && a2 == 0xE900000000000044;
  if (v2 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6573556E6163 && a2 == 0xE600000000000000 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7107700 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A8D53E0C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4472656767697274 && a2 == 0xEB00000000657461;
  if (v2 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7365727574616566 && a2 == 0xE800000000000000 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6974656C706D6F63 && a2 == 0xEE00657461446E6FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_1A8D54004()
{
  unint64_t result = qword_1E979FC60;
  if (!qword_1E979FC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC60);
  }
  return result;
}

uint64_t sub_1A8D54058(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A8D540C0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for FeatureRequestDiagnostic.FeatureDiagnostic.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D541ECLL);
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

ValueMetadata *type metadata accessor for FeatureRequestDiagnostic.FeatureDiagnostic.CodingKeys()
{
  return &type metadata for FeatureRequestDiagnostic.FeatureDiagnostic.CodingKeys;
}

unint64_t sub_1A8D54228()
{
  unint64_t result = qword_1E979FC70;
  if (!qword_1E979FC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC70);
  }
  return result;
}

unint64_t sub_1A8D54280()
{
  unint64_t result = qword_1E979FC78;
  if (!qword_1E979FC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC78);
  }
  return result;
}

unint64_t sub_1A8D542D8()
{
  unint64_t result = qword_1E979FC80;
  if (!qword_1E979FC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC80);
  }
  return result;
}

uint64_t sub_1A8D5432C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[0] = a4;
  v13[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FCE8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D563E8();
  sub_1A8D5A510();
  char v15 = 0;
  sub_1A8D5A320();
  if (!v5)
  {
    char v14 = 1;
    sub_1A8D5A320();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1A8D544A0()
{
  if (*v0) {
    return 0x707954726F727265;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_1A8D544E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D55D90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A8D5450C(uint64_t a1)
{
  unint64_t v2 = sub_1A8D563E8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D54548(uint64_t a1)
{
  unint64_t v2 = sub_1A8D563E8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A8D54584@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A8D55E8C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1A8D545B4(void *a1)
{
  return sub_1A8D5432C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_1A8D545D4()
{
  uint64_t result = 0x72656767697274;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1702125924;
      break;
    case 2:
      uint64_t result = 0x636F725074736F68;
      break;
    case 3:
      uint64_t result = 0x6E45737361707962;
      break;
    case 4:
      uint64_t result = 0x52657361656C6572;
      break;
    case 5:
      uint64_t result = 0x64616F6C6E776F64;
      break;
    case 6:
      uint64_t result = 0x726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A8D546D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A8D56094(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A8D54700(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1A8D5470C(uint64_t a1)
{
  unint64_t v2 = sub_1A8D54A38();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A8D54748(uint64_t a1)
{
  unint64_t v2 = sub_1A8D54A38();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssetDiagnostics.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FC88);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D54A38();
  sub_1A8D5A510();
  LOBYTE(v14[0]) = 0;
  sub_1A8D5A2F0();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for AssetDiagnostics();
    LOBYTE(v14[0]) = 1;
    sub_1A8D596F0();
    sub_1A8C93C40((unint64_t *)&unk_1EB5E92B0);
    sub_1A8D5A340();
    LOBYTE(v14[0]) = 2;
    sub_1A8D5A320();
    LOBYTE(v14[0]) = 3;
    sub_1A8D5A330();
    LOBYTE(v14[0]) = 4;
    sub_1A8D5A2F0();
    LOBYTE(v14[0]) = *(unsigned char *)(v3 + *(int *)(v10 + 36));
    char v15 = 5;
    sub_1A8D54AD8();
    sub_1A8D5A340();
    uint64_t v11 = (_OWORD *)(v3 + *(int *)(v10 + 40));
    long long v12 = v11[1];
    v14[0] = *v11;
    v14[1] = v12;
    char v15 = 6;
    sub_1A8D54B2C();
    sub_1A8D5A310();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_1A8D54A38()
{
  unint64_t result = qword_1E979FC90;
  if (!qword_1E979FC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC90);
  }
  return result;
}

uint64_t type metadata accessor for AssetDiagnostics()
{
  uint64_t result = qword_1E979FCC0;
  if (!qword_1E979FCC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1A8D54AD8()
{
  unint64_t result = qword_1E979FC98;
  if (!qword_1E979FC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FC98);
  }
  return result;
}

unint64_t sub_1A8D54B2C()
{
  unint64_t result = qword_1E979FCA0;
  if (!qword_1E979FCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCA0);
  }
  return result;
}

uint64_t AssetDiagnostics.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FCA8);
  uint64_t v5 = *(void *)(v34 - 8);
  MEMORY[0x1F4188790](v34, v6);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for AssetDiagnostics();
  MEMORY[0x1F4188790](v9, v10);
  long long v12 = (void *)((char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  unint64_t v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1A8D54A38();
  sub_1A8D5A4F0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  }
  uint64_t v32 = a2;
  uint64_t v33 = v5;
  LOBYTE(v36) = 0;
  uint64_t v14 = (uint64_t)v12;
  *long long v12 = sub_1A8D5A250();
  v12[1] = v15;
  uint64_t v16 = sub_1A8D596F0();
  v31[1] = v31;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16, v18);
  uint64_t v20 = (char *)v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v36) = 1;
  sub_1A8C93C40(&qword_1EB5EA168);
  sub_1A8D5A2B0();
  uint64_t v21 = v14 + v9[5];
  v31[0] = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v21, v20, v16);
  LOBYTE(v36) = 2;
  uint64_t v22 = sub_1A8D5A290();
  uint64_t v23 = (uint64_t *)(v14 + v9[6]);
  *uint64_t v23 = v22;
  v23[1] = v24;
  LOBYTE(v36) = 3;
  *(unsigned char *)(v14 + v9[7]) = sub_1A8D5A2A0() & 1;
  LOBYTE(v36) = 4;
  uint64_t v25 = sub_1A8D5A250();
  uint64_t v26 = (uint64_t *)(v14 + v9[8]);
  *uint64_t v26 = v25;
  v26[1] = v27;
  char v38 = 5;
  sub_1A8D550D0();
  sub_1A8D5A2B0();
  *(unsigned char *)(v14 + v9[9]) = v36;
  char v38 = 6;
  sub_1A8D55124();
  sub_1A8D5A280();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v34);
  uint64_t v28 = (_OWORD *)(v14 + v9[10]);
  long long v29 = v37;
  *uint64_t v28 = v36;
  v28[1] = v29;
  sub_1A8D01270(v14, v32);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  return sub_1A8D012D4(v14);
}

unint64_t sub_1A8D550D0()
{
  unint64_t result = qword_1E979FCB0;
  if (!qword_1E979FCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCB0);
  }
  return result;
}

unint64_t sub_1A8D55124()
{
  unint64_t result = qword_1E979FCB8;
  if (!qword_1E979FCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCB8);
  }
  return result;
}

uint64_t sub_1A8D55178@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AssetDiagnostics.init(from:)(a1, a2);
}

uint64_t sub_1A8D55190(void *a1)
{
  return AssetDiagnostics.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for AssetDiagnostics(void *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A8D596F0();
    long long v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    uint64_t v20 = (void *)((char *)v4 + v18);
    uint64_t v21 = (void *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    *((unsigned char *)v4 + v19) = *((unsigned char *)a2 + v19);
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)((char *)v4 + v23);
    uint64_t v25 = (void *)((char *)a2 + v23);
    uint64_t v26 = *(void *)((char *)a2 + v23 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v26)
    {
      *uint64_t v24 = *v25;
      v24[1] = v26;
      uint64_t v27 = v25[2];
      uint64_t v28 = v25[3];
      v24[2] = v27;
      v24[3] = v28;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v30 = *((_OWORD *)v25 + 1);
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
      *((_OWORD *)v24 + 1) = v30;
    }
  }
  return v4;
}

uint64_t destroy for AssetDiagnostics(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1A8D596F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + *(int *)(a2 + 40) + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for AssetDiagnostics(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A8D596F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v25 = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v25)
  {
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = v24[2];
    uint64_t v27 = v24[3];
    v23[2] = v26;
    uint64_t v23[3] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v28 = *((_OWORD *)v24 + 1);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    *((_OWORD *)v23 + 1) = v28;
  }
  return a1;
}

void *assignWithCopy for AssetDiagnostics(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A8D596F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = *(void *)((char *)a1 + v16 + 8);
  uint64_t v20 = v18[1];
  if (v19)
  {
    if (v20)
    {
      *uint64_t v17 = *v18;
      v17[1] = v18[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v17[2] = v18[2];
      v17[3] = v18[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1A8D556DC((uint64_t)v17);
      long long v21 = *((_OWORD *)v18 + 1);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *((_OWORD *)v17 + 1) = v21;
    }
  }
  else if (v20)
  {
    *uint64_t v17 = *v18;
    v17[1] = v18[1];
    v17[2] = v18[2];
    v17[3] = v18[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v22 = *((_OWORD *)v18 + 1);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v22;
  }
  return a1;
}

uint64_t sub_1A8D556DC(uint64_t a1)
{
  return a1;
}

_OWORD *initializeWithTake for AssetDiagnostics(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A8D596F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = (_OWORD *)((char *)a1 + v12);
  uint64_t v14 = (_OWORD *)((char *)a2 + v12);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  return a1;
}

void *assignWithTake for AssetDiagnostics(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A8D596F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  long long v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  if (!*(void *)((char *)a1 + v21 + 8)) {
    goto LABEL_5;
  }
  uint64_t v24 = *((void *)v23 + 1);
  if (!v24)
  {
    sub_1A8D556DC((uint64_t)a1 + v21);
LABEL_5:
    long long v26 = *((_OWORD *)v23 + 1);
    *(_OWORD *)long long v22 = *(_OWORD *)v23;
    *((_OWORD *)v22 + 1) = v26;
    return a1;
  }
  *(void *)long long v22 = *(void *)v23;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *((void *)v23 + 3);
  *((void *)v22 + 2) = *((void *)v23 + 2);
  *((void *)v22 + 3) = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetDiagnostics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A8D55914);
}

uint64_t sub_1A8D55914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A8D596F0();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AssetDiagnostics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A8D559F0);
}

uint64_t sub_1A8D559F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A8D596F0();
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
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1A8D55AB4()
{
  uint64_t result = sub_1A8D596F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetDiagnostics.CodableError()
{
  return &type metadata for AssetDiagnostics.CodableError;
}

unsigned char *storeEnumTagSinglePayload for AssetDiagnostics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D55C50);
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

ValueMetadata *type metadata accessor for AssetDiagnostics.CodingKeys()
{
  return &type metadata for AssetDiagnostics.CodingKeys;
}

unint64_t sub_1A8D55C8C()
{
  unint64_t result = qword_1E979FCD0;
  if (!qword_1E979FCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCD0);
  }
  return result;
}

unint64_t sub_1A8D55CE4()
{
  unint64_t result = qword_1E979FCD8;
  if (!qword_1E979FCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCD8);
  }
  return result;
}

unint64_t sub_1A8D55D3C()
{
  unint64_t result = qword_1E979FCE0;
  if (!qword_1E979FCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCE0);
  }
  return result;
}

uint64_t sub_1A8D55D90(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001A8D67650 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x707954726F727265 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A8D55E8C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E979FCF8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D563E8();
  sub_1A8D5A4F0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    uint64_t v8 = sub_1A8D5A290();
    char v11 = 1;
    swift_bridgeObjectRetain();
    sub_1A8D5A290();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_1A8D56094(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72656767697274 && a2 == 0xE700000000000000;
  if (v2 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x636F725074736F68 && a2 == 0xEB00000000737365 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E45737361707962 && a2 == 0xED000064656C6261 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x52657361656C6572 && a2 == 0xED00006E6F736165 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x64616F6C6E776F64 && a2 == 0xEE006E6F69746341 || (sub_1A8D5A390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1A8D5A390();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

unint64_t sub_1A8D563E8()
{
  unint64_t result = qword_1E979FCF0;
  if (!qword_1E979FCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FCF0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AssetDiagnostics.CodableError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A8D56508);
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

ValueMetadata *type metadata accessor for AssetDiagnostics.CodableError.CodingKeys()
{
  return &type metadata for AssetDiagnostics.CodableError.CodingKeys;
}

unint64_t sub_1A8D56544()
{
  unint64_t result = qword_1E979FD00;
  if (!qword_1E979FD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FD00);
  }
  return result;
}

unint64_t sub_1A8D5659C()
{
  unint64_t result = qword_1E979FD08;
  if (!qword_1E979FD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FD08);
  }
  return result;
}

unint64_t sub_1A8D565F4()
{
  unint64_t result = qword_1E979FD10;
  if (!qword_1E979FD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E979FD10);
  }
  return result;
}

id NotificationObservation.addTicketObserver(change:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v13[4] = sub_1A8D57004;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  void v13[2] = sub_1A8D56C10;
  v13[3] = &block_descriptor_6;
  uint64_t v8 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v9 = objc_msgSend(v5, sel_addObserverForName_object_queue_usingBlock_, v6, 0, 0, v8);
  _Block_release(v8);

  if ((*(unsigned char *)(v2 + 33) & 1) == 0)
  {
    uint64_t v10 = sub_1A8D59BF0();
    sub_1A8C866E4(v10, v11);
    swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + 33) = 1;
  }
  return v9;
}

uint64_t sub_1A8D567AC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    uint64_t v8 = (void *)result;
    swift_unknownObjectRetain();
    id v9 = v8;
    id v10 = a3;
    id v11 = a5;
    swift_getObjectType();
    if (swift_conformsToProtocol2()) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v12)
    {
      if (v10)
      {
        uint64_t v13 = sub_1A8D59BF0();
        unint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        unint64_t v15 = 0;
      }
      sub_1A8D5707C(v13, v15);

      swift_unknownObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {

      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void sub_1A8D568CC(uint64_t a1, unint64_t a2)
{
  int v3 = v2;
  if (qword_1EB5EAB40 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A8D59A80();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB5EAB60);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1A8D59A60();
  os_log_type_t v8 = sub_1A8D59F00();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1A8C90120(a1, a2, &v13);
    sub_1A8D59FE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A8C7F000, v7, v8, "deregistering darwin observer for name: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v10, -1, -1);
    MEMORY[0x1AD0E6EB0](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v11 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v12 = (__CFString *)sub_1A8D59BC0();
  CFNotificationCenterRemoveObserver(v11, v3, v12, 0);
}

uint64_t NotificationObservation.deinit()
{
  uint64_t v1 = sub_1A8D59BF0();
  sub_1A8D568CC(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_1A8D59BF0();
  sub_1A8D568CC(v3, v4);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t NotificationObservation.__deallocating_deinit()
{
  uint64_t v1 = sub_1A8D59BF0();
  sub_1A8D568CC(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_1A8D59BF0();
  sub_1A8D568CC(v3, v4);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 34, 7);
}

uint64_t sub_1A8D56BB4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A8D56BEC(uint64_t a1)
{
  return sub_1A8D56D00(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24), "Notifying registered clients of features change.");
}

uint64_t sub_1A8D56C10(uint64_t a1)
{
  uint64_t v1 = *(void (**)(char *))(a1 + 32);
  uint64_t v2 = sub_1A8D59440();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A8D59430();
  swift_retain();
  v1(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1A8D56D00(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, const char *a4)
{
  if (qword_1EB5EAB40 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A8D59A80();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB5EAB60);
  uint64_t v7 = sub_1A8D59A60();
  os_log_type_t v8 = sub_1A8D59F00();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A8C7F000, v7, v8, a4, v9, 2u);
    MEMORY[0x1AD0E6EB0](v9, -1, -1);
  }

  return a2();
}

void _s25CloudSubscriptionFeatures23NotificationObservationC14removeObserver5tokenySo8NSObject_p_tF_0(void *a1)
{
  if (qword_1EB5EAB40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A8D59A80();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB5EAB60);
  swift_unknownObjectRetain_n();
  uint64_t v3 = sub_1A8D59A60();
  os_log_type_t v4 = sub_1A8D59F00();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    id v7 = objc_msgSend(a1, sel_description);
    uint64_t v8 = sub_1A8D59BF0();
    unint64_t v10 = v9;

    sub_1A8C90120(v8, v10, &v12);
    sub_1A8D59FE0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A8C7F000, v3, v4, "removing observer for token: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0E6EB0](v6, -1, -1);
    MEMORY[0x1AD0E6EB0](v5, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v11 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v11, sel_removeObserver_, a1);
}

uint64_t sub_1A8D57004(uint64_t a1)
{
  return sub_1A8D56D00(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24), "Notifying registered clients of tickets change.");
}

uint64_t sub_1A8D57028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1A8D5703C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_1A8D57050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t method lookup function for NotificationObservation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NotificationObservation);
}

void sub_1A8D5707C(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return;
  }
  uint64_t v3 = v2;
  if (sub_1A8D59BF0() == a1 && v6 == a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v8 = sub_1A8D5A390();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_16:
    if (qword_1EB5EAB40 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1A8D59A80();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EB5EAB60);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1A8D59A60();
    os_log_type_t v14 = sub_1A8D59F00();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v26 = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_1A8C90120(a1, a2, &v26);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v13, v14, "Received Feature darwin notification %s, posting new local notification.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v16, -1, -1);
      MEMORY[0x1AD0E6EB0](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v17 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v3 + 16);
    goto LABEL_29;
  }
  if (sub_1A8D59BF0() == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  char v11 = sub_1A8D5A390();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_23:
    if (qword_1EB5EAB40 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1A8D59A80();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB5EAB60);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1A8D59A60();
    os_log_type_t v22 = sub_1A8D59F00();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_1A8C90120(a1, a2, &v26);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v21, v22, "Receieved Ticket darwin notification %s, posting new local notification.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v24, -1, -1);
      MEMORY[0x1AD0E6EB0](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v17 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v3 + 24);
LABEL_29:
    objc_msgSend(v17, sel_postNotificationName_object_, v19, 0, v25, v26);

    return;
  }
  swift_bridgeObjectRelease();
}

id static TicketStatus.active.getter()
{
  return sub_1A8D57534(0x657669746361, 0xE600000000000000);
}

id static TicketStatus.enqueued.getter()
{
  return sub_1A8D57534(0x6465756575716E65, 0xE800000000000000);
}

id static TicketStatus.notYetQueued.getter()
{
  return sub_1A8D57534(0x7551746559746F6ELL, 0xEC00000064657565);
}

id sub_1A8D57534(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for TicketStatus());
  id result = TicketStatus.init(rawValue:)(a1, a2);
  if (!result) {
    __break(1u);
  }
  return result;
}

id TicketStatus.__allocating_init(rawValue:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return TicketStatus.init(rawValue:)(a1, a2);
}

uint64_t type metadata accessor for TicketStatus()
{
  return self;
}

uint64_t static TicketStatus.supportsSecureCoding.getter()
{
  return 1;
}

id sub_1A8D57640(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v6 = objc_allocWithZone((Class)type metadata accessor for TicketStatus());
  id result = TicketStatus.init(rawValue:)(a3, a4);
  if (result)
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A8D57714()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1A8D577D8(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A8D57838(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  id v4 = (void *)(*a2 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  *id v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A8D578A4())()
{
  return j__swift_endAccess;
}

uint64_t sub_1A8D579D4()
{
  strcpy((char *)v1, "TicketStatus.");
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1A8D59CA0();
  swift_bridgeObjectRelease();
  return v1[0];
}

id TicketStatus.init(rawValue:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_allowedValues;
  id v6 = v2;
  uint64_t v7 = sub_1A8D589E0((uint64_t)&unk_1EFF53090);
  swift_arrayDestroy();
  *(void *)&v2[v5] = v7;
  if (sub_1A8CB871C(a1, a2, v7))
  {
    char v8 = (uint64_t *)&v6[OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue];
    *char v8 = a1;
    v8[1] = a2;

    v15.receiver = v6;
    v15.super_class = (Class)type metadata accessor for TicketStatus();
    return objc_msgSendSuper2(&v15, sel_init);
  }
  else
  {
    if (qword_1EB5EAB38 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1A8D59A80();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EB5EAB48);
    swift_bridgeObjectRetain();
    char v11 = sub_1A8D59A60();
    os_log_type_t v12 = sub_1A8D59EE0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v17 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_1A8C90120(a1, a2, &v17);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v11, v12, "Decoded ticket with non-allowed value: %s. Will return nil.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
      MEMORY[0x1AD0E6EB0](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRelease();
    type metadata accessor for TicketStatus();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

char *TicketStatus.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TicketStatus.init(from:)(a1);
}

char *TicketStatus.init(from:)(void *a1)
{
  uint64_t v4 = OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_allowedValues;
  uint64_t v5 = v1;
  uint64_t v6 = sub_1A8D589E0((uint64_t)&unk_1EFF52FF0);
  swift_arrayDestroy();
  *(void *)&v1[v4] = v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D5A4E0();
  if (v2)
  {
LABEL_10:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    swift_bridgeObjectRelease();
    type metadata accessor for TicketStatus();
    swift_deallocPartialClassInstance();
    return v5;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  uint64_t v7 = sub_1A8D5A3A0();
  unint64_t v9 = v8;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  if ((sub_1A8CB871C(v7, v9, *(void *)&v1[v4]) & 1) == 0)
  {
    if (qword_1EB5EAB38 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1A8D59A80();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EB5EAB48);
    swift_bridgeObjectRetain();
    os_log_type_t v12 = sub_1A8D59A60();
    os_log_type_t v13 = sub_1A8D59EE0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[0] = v17;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      v19[6] = sub_1A8C90120(v7, v9, v19);
      sub_1A8D59FE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A8C7F000, v12, v13, "Decoded ticket with non-allowed value: %s. Will return nil.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0E6EB0](v17, -1, -1);
      MEMORY[0x1AD0E6EB0](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1A8C8C7B0();
    swift_allocError();
    *objc_super v15 = 4;
    swift_willThrow();
    goto LABEL_10;
  }
  uint64_t v10 = (uint64_t *)&v5[OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue];
  *uint64_t v10 = v7;
  v10[1] = v9;

  v18.receiver = v5;
  v18.super_class = (Class)type metadata accessor for TicketStatus();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v18, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v5;
}

uint64_t TicketStatus.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return TicketStatus.init(coder:)(a1);
}

uint64_t TicketStatus.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_allowedValues;
  uint64_t v4 = v1;
  uint64_t v5 = sub_1A8D589E0((uint64_t)&unk_1EFF53040);
  swift_arrayDestroy();
  *(void *)&v1[v3] = v5;
  sub_1A8CB585C();
  uint64_t v6 = sub_1A8D59F80();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    sub_1A8D59BE0();
  }
  swift_bridgeObjectRelease();
  type metadata accessor for TicketStatus();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_1A8D58354(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D5A500();
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  sub_1A8D5A3B0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

void sub_1A8D58420(void *a1)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1A8D59BC0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_1A8D59BC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);
}

uint64_t sub_1A8D58594(uint64_t a1)
{
  sub_1A8CDEFB8(a1, (uint64_t)v10);
  if (!v11)
  {
    sub_1A8CA2800((uint64_t)v10);
    goto LABEL_9;
  }
  type metadata accessor for TicketStatus();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v7 = 0;
    return v7 & 1;
  }
  uint64_t v2 = &v9[OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *((void *)v2 + 1);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  if (v3 == *v5 && v4 == v5[1])
  {

    char v7 = 1;
  }
  else
  {
    char v7 = sub_1A8D5A390();
  }
  return v7 & 1;
}

id TicketStatus.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TicketStatus.init()()
{
}

id TicketStatus.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TicketStatus();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1A8D5881C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  id v5 = objc_allocWithZone((Class)type metadata accessor for TicketStatus());
  id result = TicketStatus.init(rawValue:)(v3, v4);
  *a2 = result;
  return result;
}

uint64_t sub_1A8D58868@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(*v1 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

char *sub_1A8D588C0@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for TicketStatus());
  id result = TicketStatus.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A8D58914(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A8D5A500();
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  sub_1A8D5A3B0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_1A8D589E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB5EAC70);
    uint64_t v3 = sub_1A8D5A0A0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1A8D5A4A0();
      swift_bridgeObjectRetain();
      sub_1A8D59C80();
      uint64_t result = sub_1A8D5A4D0();
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
        if (v17 || (uint64_t result = sub_1A8D5A390(), (result & 1) != 0))
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
            uint64_t result = sub_1A8D5A390();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
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

uint64_t sub_1A8D58B84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for TicketStatus(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TicketStatus);
}

uint64_t dispatch thunk of TicketStatus.rawValue.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TicketStatus.rawValue.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TicketStatus.rawValue.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TicketStatus.__allocating_init(rawValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TicketStatus.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of TicketStatus.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of TicketStatus.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TicketStatus.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

void __getINDaemonConnectionClass_block_invoke_cold_1()
{
}

uint64_t sub_1A8D592D0()
{
  return MEMORY[0x1F40E2E60]();
}

uint64_t sub_1A8D592E0()
{
  return MEMORY[0x1F40E2EB0]();
}

uint64_t sub_1A8D592F0()
{
  return MEMORY[0x1F40E2EE0]();
}

uint64_t sub_1A8D59300()
{
  return MEMORY[0x1F40E2EF8]();
}

uint64_t sub_1A8D59310()
{
  return MEMORY[0x1F40E2F18]();
}

uint64_t sub_1A8D59320()
{
  return MEMORY[0x1F40E2F20]();
}

uint64_t sub_1A8D59330()
{
  return MEMORY[0x1F40E2F38]();
}

uint64_t sub_1A8D59340()
{
  return MEMORY[0x1F40E2F48]();
}

uint64_t sub_1A8D59350()
{
  return MEMORY[0x1F40E2F58]();
}

uint64_t sub_1A8D59360()
{
  return MEMORY[0x1F40E3010]();
}

uint64_t sub_1A8D59370()
{
  return MEMORY[0x1F40E3028]();
}

uint64_t sub_1A8D59380()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t sub_1A8D59390()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t sub_1A8D593A0()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t sub_1A8D593B0()
{
  return MEMORY[0x1F40E3090]();
}

uint64_t sub_1A8D593C0()
{
  return MEMORY[0x1F40E30B0]();
}

uint64_t sub_1A8D593D0()
{
  return MEMORY[0x1F40E30C8]();
}

uint64_t sub_1A8D593E0()
{
  return MEMORY[0x1F40E30E8]();
}

uint64_t sub_1A8D593F0()
{
  return MEMORY[0x1F40E3100]();
}

uint64_t sub_1A8D59400()
{
  return MEMORY[0x1F40E3120]();
}

uint64_t sub_1A8D59410()
{
  return MEMORY[0x1F40E3148]();
}

uint64_t sub_1A8D59420()
{
  return MEMORY[0x1F40E3158]();
}

uint64_t sub_1A8D59430()
{
  return MEMORY[0x1F40E3548]();
}

uint64_t sub_1A8D59440()
{
  return MEMORY[0x1F40E35A0]();
}

uint64_t sub_1A8D59450()
{
  return MEMORY[0x1F40E35B8]();
}

uint64_t sub_1A8D59460()
{
  return MEMORY[0x1F40E35E0]();
}

uint64_t sub_1A8D59470()
{
  return MEMORY[0x1F40E3608]();
}

uint64_t sub_1A8D59480()
{
  return MEMORY[0x1F40E3610]();
}

uint64_t sub_1A8D59490()
{
  return MEMORY[0x1F40E3678]();
}

uint64_t sub_1A8D594A0()
{
  return MEMORY[0x1F40E36D0]();
}

uint64_t sub_1A8D594B0()
{
  return MEMORY[0x1F40E36E0]();
}

uint64_t sub_1A8D594C0()
{
  return MEMORY[0x1F40E37B0]();
}

uint64_t sub_1A8D594D0()
{
  return MEMORY[0x1F40E3F50]();
}

uint64_t sub_1A8D594E0()
{
  return MEMORY[0x1F40E41D8]();
}

uint64_t sub_1A8D594F0()
{
  return MEMORY[0x1F40E4208]();
}

uint64_t sub_1A8D59500()
{
  return MEMORY[0x1F40E4218]();
}

uint64_t sub_1A8D59510()
{
  return MEMORY[0x1F40E4238]();
}

uint64_t sub_1A8D59520()
{
  return MEMORY[0x1F40E4268]();
}

uint64_t sub_1A8D59530()
{
  return MEMORY[0x1F40E4278]();
}

uint64_t sub_1A8D59540()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1A8D59550()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1A8D59560()
{
  return MEMORY[0x1F40E48F0]();
}

uint64_t sub_1A8D59570()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1A8D59580()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t sub_1A8D59590()
{
  return MEMORY[0x1F40E4B18]();
}

uint64_t sub_1A8D595A0()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1A8D595B0()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1A8D595C0()
{
  return MEMORY[0x1F40E4D60]();
}

uint64_t sub_1A8D595D0()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1A8D595E0()
{
  return MEMORY[0x1F40E4E28]();
}

uint64_t sub_1A8D595F0()
{
  return MEMORY[0x1F40E4EE8]();
}

uint64_t sub_1A8D59600()
{
  return MEMORY[0x1F40E5080]();
}

uint64_t sub_1A8D59610()
{
  return MEMORY[0x1F40E50B0]();
}

uint64_t sub_1A8D59620()
{
  return MEMORY[0x1F40E50D8]();
}

uint64_t sub_1A8D59630()
{
  return MEMORY[0x1F40E5150]();
}

uint64_t sub_1A8D59640()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_1A8D59650()
{
  return MEMORY[0x1F40E51A0]();
}

uint64_t sub_1A8D59660()
{
  return MEMORY[0x1F40E51B0]();
}

uint64_t sub_1A8D59670()
{
  return MEMORY[0x1F40E51C8]();
}

uint64_t sub_1A8D59680()
{
  return MEMORY[0x1F40E51E0]();
}

uint64_t sub_1A8D59690()
{
  return MEMORY[0x1F40E51E8]();
}

uint64_t sub_1A8D596A0()
{
  return MEMORY[0x1F40E52B8]();
}

uint64_t sub_1A8D596B0()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t sub_1A8D596C0()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t sub_1A8D596D0()
{
  return MEMORY[0x1F40E52F8]();
}

uint64_t sub_1A8D596E0()
{
  return MEMORY[0x1F40E5370]();
}

uint64_t sub_1A8D596F0()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1A8D59700()
{
  return MEMORY[0x1F40E53A8]();
}

uint64_t sub_1A8D59710()
{
  return MEMORY[0x1F40E5440]();
}

uint64_t sub_1A8D59720()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t sub_1A8D59730()
{
  return MEMORY[0x1F40E5630]();
}

uint64_t sub_1A8D59740()
{
  return MEMORY[0x1F40E5640]();
}

uint64_t sub_1A8D59750()
{
  return MEMORY[0x1F40E56A0]();
}

uint64_t sub_1A8D59760()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_1A8D59770()
{
  return MEMORY[0x1F40E5CF0]();
}

uint64_t sub_1A8D59780()
{
  return MEMORY[0x1F40E5D18]();
}

uint64_t sub_1A8D59790()
{
  return MEMORY[0x1F40E5D30]();
}

uint64_t sub_1A8D597A0()
{
  return MEMORY[0x1F40E5D58]();
}

uint64_t sub_1A8D597B0()
{
  return MEMORY[0x1F40E5D78]();
}

uint64_t sub_1A8D597C0()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1A8D597D0()
{
  return MEMORY[0x1F4130138]();
}

uint64_t sub_1A8D597E0()
{
  return MEMORY[0x1F41301A8]();
}

uint64_t sub_1A8D597F0()
{
  return MEMORY[0x1F41301B0]();
}

uint64_t sub_1A8D59800()
{
  return MEMORY[0x1F4130238]();
}

uint64_t sub_1A8D59810()
{
  return MEMORY[0x1F4130240]();
}

uint64_t sub_1A8D59820()
{
  return MEMORY[0x1F411BCC8]();
}

uint64_t sub_1A8D59830()
{
  return MEMORY[0x1F411BCD0]();
}

uint64_t sub_1A8D59840()
{
  return MEMORY[0x1F411BCD8]();
}

uint64_t sub_1A8D59850()
{
  return MEMORY[0x1F411BCE0]();
}

uint64_t sub_1A8D59860()
{
  return MEMORY[0x1F411BCF0]();
}

uint64_t sub_1A8D59870()
{
  return MEMORY[0x1F411BD00]();
}

uint64_t sub_1A8D59880()
{
  return MEMORY[0x1F411BD20]();
}

uint64_t sub_1A8D59890()
{
  return MEMORY[0x1F411BD48]();
}

uint64_t sub_1A8D598A0()
{
  return MEMORY[0x1F411BD50]();
}

uint64_t sub_1A8D598B0()
{
  return MEMORY[0x1F411BD68]();
}

uint64_t sub_1A8D598C0()
{
  return MEMORY[0x1F411BD80]();
}

uint64_t sub_1A8D598D0()
{
  return MEMORY[0x1F411BDA0]();
}

uint64_t sub_1A8D598E0()
{
  return MEMORY[0x1F411BF88]();
}

uint64_t sub_1A8D598F0()
{
  return MEMORY[0x1F411BF90]();
}

uint64_t sub_1A8D59900()
{
  return MEMORY[0x1F411BF98]();
}

uint64_t sub_1A8D59910()
{
  return MEMORY[0x1F411BFA0]();
}

uint64_t sub_1A8D59920()
{
  return MEMORY[0x1F411BFA8]();
}

uint64_t sub_1A8D59960()
{
  return MEMORY[0x1F411BFC8]();
}

uint64_t sub_1A8D59980()
{
  return MEMORY[0x1F411BFD8]();
}

uint64_t sub_1A8D59990()
{
  return MEMORY[0x1F411BFE0]();
}

uint64_t sub_1A8D599A0()
{
  return MEMORY[0x1F411BFE8]();
}

uint64_t sub_1A8D599B0()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1A8D599C0()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1A8D599D0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1A8D599E0()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1A8D599F0()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1A8D59A00()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1A8D59A10()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1A8D59A20()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1A8D59A30()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1A8D59A40()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1A8D59A50()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1A8D59A60()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A8D59A70()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A8D59A80()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A8D59A90()
{
  return MEMORY[0x1F4187AB0]();
}

uint64_t sub_1A8D59AA0()
{
  return MEMORY[0x1F4187B78]();
}

uint64_t sub_1A8D59AB0()
{
  return MEMORY[0x1F4187B80]();
}

uint64_t sub_1A8D59AC0()
{
  return MEMORY[0x1F4187B88]();
}

uint64_t sub_1A8D59AD0()
{
  return MEMORY[0x1F4187B90]();
}

uint64_t sub_1A8D59AE0()
{
  return MEMORY[0x1F41884B0]();
}

uint64_t sub_1A8D59AF0()
{
  return MEMORY[0x1F4186CD8]();
}

uint64_t sub_1A8D59B00()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1A8D59B10()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1A8D59B20()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_1A8D59B30()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1A8D59B40()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1A8D59B50()
{
  return MEMORY[0x1F4183370]();
}

uint64_t sub_1A8D59B60()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A8D59B70()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A8D59B80()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A8D59B90()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A8D59BA0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A8D59BB0()
{
  return MEMORY[0x1F40E6070]();
}

uint64_t sub_1A8D59BC0()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1A8D59BD0()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_1A8D59BE0()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_1A8D59BF0()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1A8D59C00()
{
  return MEMORY[0x1F40E61E0]();
}

uint64_t sub_1A8D59C10()
{
  return MEMORY[0x1F40E61F0]();
}

uint64_t sub_1A8D59C20()
{
  return MEMORY[0x1F40E6270]();
}

uint64_t sub_1A8D59C30()
{
  return MEMORY[0x1F40E62A8]();
}

uint64_t sub_1A8D59C40()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A8D59C50()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A8D59C60()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A8D59C80()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A8D59C90()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A8D59CA0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A8D59CB0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A8D59CC0()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A8D59CD0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A8D59CF0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A8D59D00()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1A8D59D10()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A8D59D20()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1A8D59D30()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A8D59D40()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1A8D59D50()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1A8D59D60()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A8D59D70()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A8D59D80()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A8D59D90()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A8D59DA0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A8D59DB0()
{
  return MEMORY[0x1F40E6390]();
}

uint64_t sub_1A8D59DC0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A8D59DD0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A8D59DE0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A8D59DF0()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1A8D59E00()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A8D59E10()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A8D59E20()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A8D59E50()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1A8D59E60()
{
  return MEMORY[0x1F40E6438]();
}

uint64_t sub_1A8D59E70()
{
  return MEMORY[0x1F40E6450]();
}

uint64_t sub_1A8D59E80()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1A8D59E90()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A8D59EA0()
{
  return MEMORY[0x1F40E6498]();
}

uint64_t sub_1A8D59EC0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1A8D59ED0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A8D59EE0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A8D59EF0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A8D59F00()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A8D59F10()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_1A8D59F20()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1A8D59F30()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_1A8D59F40()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_1A8D59F50()
{
  return MEMORY[0x1F4187118]();
}

uint64_t sub_1A8D59F60()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1A8D59F70()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1A8D59F80()
{
  return MEMORY[0x1F40E6850]();
}

uint64_t sub_1A8D59F90()
{
  return MEMORY[0x1F40E6878]();
}

uint64_t sub_1A8D59FA0()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1A8D59FB0()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1A8D59FC0()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1A8D59FD0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A8D59FE0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A8D59FF0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A8D5A000()
{
  return MEMORY[0x1F40E6C88]();
}

uint64_t sub_1A8D5A010()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A8D5A030()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A8D5A040()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A8D5A050()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A8D5A060()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A8D5A070()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A8D5A080()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A8D5A090()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A8D5A0A0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A8D5A0B0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1A8D5A0C0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A8D5A0D0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A8D5A0E0()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1A8D5A0F0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A8D5A100()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A8D5A110()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A8D5A120()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A8D5A130()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A8D5A140()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A8D5A150()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A8D5A160()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A8D5A170()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A8D5A180()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A8D5A190()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A8D5A1A0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A8D5A1B0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A8D5A1C0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A8D5A1D0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A8D5A1E0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A8D5A1F0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A8D5A200()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A8D5A220()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A8D5A230()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A8D5A240()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A8D5A250()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A8D5A260()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1A8D5A270()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1A8D5A280()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A8D5A290()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A8D5A2A0()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A8D5A2B0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A8D5A2C0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A8D5A2D0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A8D5A2E0()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A8D5A2F0()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A8D5A300()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1A8D5A310()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A8D5A320()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A8D5A330()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A8D5A340()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A8D5A350()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A8D5A360()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A8D5A370()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1A8D5A380()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A8D5A390()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A8D5A3A0()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1A8D5A3B0()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1A8D5A3E0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1A8D5A3F0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A8D5A400()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A8D5A410()
{
  return MEMORY[0x1F40E6E00]();
}

uint64_t sub_1A8D5A420()
{
  return MEMORY[0x1F40E6E08]();
}

uint64_t sub_1A8D5A430()
{
  return MEMORY[0x1F40E6E18]();
}

uint64_t sub_1A8D5A440()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t sub_1A8D5A450()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A8D5A460()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A8D5A470()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A8D5A480()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A8D5A4A0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A8D5A4B0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A8D5A4C0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A8D5A4D0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A8D5A4E0()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1A8D5A4F0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A8D5A500()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1A8D5A510()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A8D5A540()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B78](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D10]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA8](key, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F08](applicationID, userName, hostName);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85E8]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x1F4117548]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_deviceSupportsGenerativeModelSystems()
{
  return MEMORY[0x1F417CEB8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD8](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF0](key, algorithm, dataToSign, error);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3C0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE180](*(void *)&__errnum);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3C8](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE970](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE988](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9C8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E0](activity);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE38]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF140](object);
}