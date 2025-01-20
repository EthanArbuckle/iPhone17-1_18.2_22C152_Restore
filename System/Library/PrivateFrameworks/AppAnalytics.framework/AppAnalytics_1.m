ValueMetadata *type metadata accessor for HeartbeatEventService.Metadata.CodingKeys()
{
  return &type metadata for HeartbeatEventService.Metadata.CodingKeys;
}

unint64_t sub_1A9128754()
{
  unint64_t result = qword_1E97B1930;
  if (!qword_1E97B1930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1930);
  }
  return result;
}

unint64_t sub_1A91287AC()
{
  unint64_t result = qword_1EB686C08;
  if (!qword_1EB686C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686C08);
  }
  return result;
}

unint64_t sub_1A9128804()
{
  unint64_t result = qword_1EB686C00;
  if (!qword_1EB686C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686C00);
  }
  return result;
}

uint64_t sub_1A9128858(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7461446873756C66 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void sub_1A91289C8(void *a1, void *a2)
{
  id v154 = a2;
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1A916A790();
  uint64_t v157 = *(void *)(v3 - 8);
  id v158 = (id)v3;
  MEMORY[0x1F4188790](v3);
  v5 = (char *)&v133 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v146 = (char *)&v133 - v7;
  sub_1A9129DA0(0, qword_1EB686938, MEMORY[0x1E4F27DE0]);
  MEMORY[0x1F4188790](v8 - 8);
  v152 = (char *)&v133 - v9;
  uint64_t v153 = sub_1A916AD20();
  uint64_t v155 = *(void *)(v153 - 8);
  MEMORY[0x1F4188790](v153);
  v148 = (char *)&v133 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9129DA0(0, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v11 - 8);
  v149 = (char *)&v133 - v12;
  uint64_t v13 = sub_1A916A9D0();
  uint64_t v150 = *(void *)(v13 - 8);
  v151 = (void (*)(void, void))v13;
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_1A916AAD0();
  uint64_t v16 = *(void *)(v156 - 8);
  MEMORY[0x1F4188790](v156);
  v18 = (char *)&v133 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  v21 = (char *)&v133 - v20;
  sub_1A9129DA0(0, &qword_1EB686928, MEMORY[0x1E4F26C48]);
  MEMORY[0x1F4188790](v22 - 8);
  v147 = (char *)&v133 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  v26 = (char *)&v133 - v25;
  MEMORY[0x1F4188790](v27);
  v29 = (char *)&v133 - v28;
  v30 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  uint64_t v31 = sub_1A916B190();

  if (*(void *)(v31 + 16))
  {
    v143 = v5;
    uint64_t v145 = *(void *)(v31 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v144 = a1;
    id v32 = objc_msgSend(a1, sel_originalRequest);
    if (v32)
    {
      v33 = v32;
      sub_1A916A740();

      uint64_t v34 = v157;
      v35 = *(void (**)(char *, uint64_t, uint64_t, id))(v157 + 56);
      v36 = v26;
      uint64_t v37 = 0;
    }
    else
    {
      uint64_t v34 = v157;
      v35 = *(void (**)(char *, uint64_t, uint64_t, id))(v157 + 56);
      v36 = v26;
      uint64_t v37 = 1;
    }
    id v39 = v158;
    v35(v36, v37, 1, v158);
    sub_1A9129DF4((uint64_t)v26, (uint64_t)v29);
    v142 = *(unsigned int (**)(char *, uint64_t, id))(v34 + 48);
    if (v142(v29, 1, v39) == 1)
    {
      swift_bridgeObjectRelease();
      sub_1A9129E74((uint64_t)v29, &qword_1EB686928, MEMORY[0x1E4F26C48]);
LABEL_17:
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      id v62 = (id)qword_1EB689AA0;
      sub_1A916B3B0();
      sub_1A916AD30();

      return;
    }
    v138 = v18;
    uint64_t v136 = v34 + 48;
    v137 = v35;
    uint64_t v40 = sub_1A916A770();
    uint64_t v42 = v41;
    v45 = *(void (**)(char *, id))(v34 + 8);
    uint64_t v43 = v34 + 8;
    v44 = v45;
    v45(v29, v39);
    uint64_t v139 = v42;
    if (!v42)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v134 = v44;
    uint64_t v135 = v43;
    uint64_t v46 = *MEMORY[0x1E4F276A8];
    uint64_t v140 = v40;
    uint64_t v47 = v150;
    v141 = v21;
    v48 = *(void (**)(char *, uint64_t, void (*)(void, void)))(v150 + 104);
    v49 = v151;
    v48(v15, v46, v151);
    uint64_t v50 = v156;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v149, 1, 1, v156);
    v51 = v138;
    sub_1A916AAA0();
    uint64_t v52 = v140;
    uint64_t v53 = v139;
    *(void *)&long long v160 = v140;
    *((void *)&v160 + 1) = v139;
    v48(v15, *MEMORY[0x1E4F276B8], v49);
    sub_1A90A6814();
    sub_1A916AAC0();
    (*(void (**)(char *, void))(v47 + 8))(v15, v49);
    uint64_t v55 = v16 + 8;
    v54 = *(void (**)(char *, uint64_t))(v16 + 8);
    v54(v51, v50);
    id v56 = v154;
    uint64_t v150 = v55;
    v151 = (void (*)(void, void))v54;
    if (!v154)
    {
      uint64_t v63 = (uint64_t)v152;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v155 + 56))(v152, 1, 1, v153);
      sub_1A9129E74(v63, qword_1EB686938, MEMORY[0x1E4F27DE0]);
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      v64 = (void *)qword_1EB689AA0;
      sub_1A90CA164();
      uint64_t v65 = swift_allocObject();
      *(_OWORD *)(v65 + 16) = xmmword_1A916EF60;
      *(void *)(v65 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v65 + 64) = sub_1A90A67C0();
      *(void *)(v65 + 32) = v52;
      *(void *)(v65 + 40) = v53;
      id v66 = v64;
      sub_1A916B3D0();
      sub_1A916AD30();

      swift_bridgeObjectRelease();
      goto LABEL_44;
    }
    *(void *)&long long v160 = v154;
    id v57 = v154;
    sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
    uint64_t v58 = (uint64_t)v152;
    uint64_t v59 = v153;
    int v60 = swift_dynamicCast();
    uint64_t v61 = v155;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v155 + 56))(v58, v60 ^ 1u, 1, v59);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v58, 1, v59) == 1)
    {
      sub_1A9129E74(v58, qword_1EB686938, MEMORY[0x1E4F27DE0]);
LABEL_41:
      id v96 = v56;
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      id v97 = (id)qword_1EB689AA0;
      sub_1A916B3B0();
      sub_1A90CA164();
      uint64_t v98 = swift_allocObject();
      *(_OWORD *)(v98 + 16) = xmmword_1A916E200;
      uint64_t v99 = MEMORY[0x1E4FBB1A0];
      *(void *)(v98 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v100 = sub_1A90A67C0();
      *(void *)(v98 + 64) = v100;
      *(void *)(v98 + 32) = v140;
      *(void *)(v98 + 40) = v53;
      *(void *)&long long v160 = 0;
      *((void *)&v160 + 1) = 0xE000000000000000;
      id v159 = v56;
      sub_1A916B780();
      long long v101 = v160;
      *(void *)(v98 + 96) = v99;
      *(void *)(v98 + 104) = v100;
      *(_OWORD *)(v98 + 72) = v101;
      sub_1A916AD30();

      swift_bridgeObjectRelease();
LABEL_44:
      uint64_t v102 = v156;
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      v103 = (void *)qword_1EB689AA0;
      sub_1A90CA164();
      uint64_t v104 = swift_allocObject();
      *(_OWORD *)(v104 + 16) = xmmword_1A916EF60;
      sub_1A908B1A4(&qword_1EB686930, MEMORY[0x1E4F276F0]);
      id v105 = v103;
      v106 = v141;
      uint64_t v107 = sub_1A916B990();
      uint64_t v109 = v108;
      uint64_t v110 = MEMORY[0x1E4FBB1A0];
      *(void *)(v104 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v111 = sub_1A90A67C0();
      *(void *)(v104 + 64) = v111;
      *(void *)(v104 + 32) = v107;
      *(void *)(v104 + 40) = v109;
      sub_1A916B3D0();
      sub_1A916AD30();

      swift_bridgeObjectRelease();
      id v112 = objc_msgSend(self, sel_defaultManager);
      v113 = (void *)sub_1A916AA40();
      *(void *)&long long v160 = 0;
      LODWORD(v105) = objc_msgSend(v112, sel_removeItemAtURL_error_, v113, &v160);

      if (v105)
      {
        id v114 = (id)v160;
      }
      else
      {
        id v115 = (id)v160;
        v116 = (void *)sub_1A916A990();

        swift_willThrow();
        id v117 = (id)qword_1EB689AA0;
        sub_1A916B3B0();
        uint64_t v118 = swift_allocObject();
        *(_OWORD *)(v118 + 16) = xmmword_1A916E200;
        uint64_t v119 = sub_1A916B990();
        *(void *)(v118 + 56) = v110;
        *(void *)(v118 + 64) = v111;
        *(void *)(v118 + 32) = v119;
        *(void *)(v118 + 40) = v120;
        *(void *)&long long v160 = 0;
        *((void *)&v160 + 1) = 0xE000000000000000;
        id v159 = v116;
        sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
        sub_1A916B780();
        long long v121 = v160;
        *(void *)(v118 + 96) = v110;
        *(void *)(v118 + 104) = v111;
        *(_OWORD *)(v118 + 72) = v121;
        sub_1A916AD30();

        swift_bridgeObjectRelease();
      }
      v122 = v106;
      uint64_t v123 = v102;
LABEL_50:
      v151(v122, v123);
      return;
    }
    v67 = v148;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v148, v58, v59);
    sub_1A908B1A4((unint64_t *)&unk_1E97B1940, MEMORY[0x1E4F27DE0]);
    uint64_t v68 = sub_1A916A970();
    uint64_t v69 = sub_1A916AF90();
    if (*(void *)(v68 + 16))
    {
      unint64_t v71 = sub_1A90A1D98(v69, v70);
      v72 = v144;
      if (v73)
      {
        sub_1A90A24B0(*(void *)(v68 + 56) + 32 * v71, (uint64_t)&v160);
      }
      else
      {
        long long v160 = 0u;
        long long v161 = 0u;
      }
    }
    else
    {
      long long v160 = 0u;
      long long v161 = 0u;
      v72 = v144;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v161 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0 && !v159)
      {
        id v74 = objc_msgSend(self, sel_defaultManager);
        sub_1A916AA80();
        v75 = (void *)sub_1A916AF60();
        swift_bridgeObjectRelease();
        unsigned int v76 = objc_msgSend(v74, sel_fileExistsAtPath_, v75);

        if (!v76)
        {
          if (qword_1EB68ACE8 != -1) {
            swift_once();
          }
          id v124 = (id)qword_1EB689AA0;
          sub_1A916B3B0();
          sub_1A90CA164();
          uint64_t v125 = swift_allocObject();
          *(_OWORD *)(v125 + 16) = xmmword_1A916E200;
          uint64_t v126 = MEMORY[0x1E4FBB1A0];
          *(void *)(v125 + 56) = MEMORY[0x1E4FBB1A0];
          unint64_t v127 = sub_1A90A67C0();
          *(void *)(v125 + 64) = v127;
          *(void *)(v125 + 32) = v140;
          *(void *)(v125 + 40) = v53;
          v128 = v141;
          uint64_t v129 = sub_1A916AA80();
          *(void *)(v125 + 96) = v126;
          *(void *)(v125 + 104) = v127;
          *(void *)(v125 + 72) = v129;
          *(void *)(v125 + 80) = v130;
          sub_1A916AD30();

          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v155 + 8))(v148, v59);
          v122 = v128;
          uint64_t v123 = v156;
          goto LABEL_50;
        }
        id v77 = objc_msgSend(v72, sel_originalRequest);
        if (v77)
        {
          v78 = v77;
          v79 = v143;
          sub_1A916A740();

          v80 = *(void (**)(char *, char *, id))(v157 + 32);
          uint64_t v81 = (uint64_t)v147;
          v82 = v79;
          id v83 = v158;
          v80(v147, v82, v158);
          v137((char *)v81, 0, 1, v83);
          uint64_t v84 = v53;
          if (v142((char *)v81, 1, v83) != 1)
          {
            uint64_t v85 = v81;
            v86 = v146;
            v80(v146, (char *)v85, v83);
            if (qword_1EB68ACE8 != -1) {
              swift_once();
            }
            v87 = (void *)qword_1EB689AA0;
            sub_1A90CA164();
            uint64_t v88 = swift_allocObject();
            *(_OWORD *)(v88 + 16) = xmmword_1A916EF60;
            *(void *)(v88 + 56) = MEMORY[0x1E4FBB1A0];
            *(void *)(v88 + 64) = sub_1A90A67C0();
            *(void *)(v88 + 32) = v140;
            *(void *)(v88 + 40) = v53;
            id v89 = v87;
            sub_1A916B3D0();
            sub_1A916AD30();

            swift_bridgeObjectRelease();
            uint64_t v90 = v156;
            if (qword_1EB686BD8 != -1) {
              swift_once();
            }
            v91 = (void *)qword_1EB686BD0;
            v92 = (void *)sub_1A916A720();
            v93 = v141;
            v94 = (void *)sub_1A916AA40();
            id v95 = objc_msgSend(v91, sel_uploadTaskWithRequest_fromFile_, v92, v94);

            objc_msgSend(v95, sel_resume);
            v134(v86, v158);
            (*(void (**)(char *, uint64_t))(v155 + 8))(v67, v59);
            v151(v93, v90);
            return;
          }
        }
        else
        {
          uint64_t v81 = (uint64_t)v147;
          v137(v147, 1, 1, v158);
          uint64_t v84 = v53;
        }
        sub_1A9129E74(v81, &qword_1EB686928, MEMORY[0x1E4F26C48]);
        if (qword_1EB68ACE8 != -1) {
          swift_once();
        }
        id v131 = (id)qword_1EB689AA0;
        sub_1A916B3B0();
        sub_1A90CA164();
        uint64_t v132 = swift_allocObject();
        *(_OWORD *)(v132 + 16) = xmmword_1A916EF60;
        *(void *)(v132 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v132 + 64) = sub_1A90A67C0();
        *(void *)(v132 + 32) = v140;
        *(void *)(v132 + 40) = v84;
        sub_1A916AD30();

        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v155 + 8))(v67, v59);
        goto LABEL_44;
      }
    }
    else
    {
      sub_1A909B5DC((uint64_t)&v160);
    }
    (*(void (**)(char *, uint64_t))(v155 + 8))(v67, v59);
    id v56 = v154;
    goto LABEL_41;
  }
  swift_bridgeObjectRelease();
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  id v158 = (id)qword_1EB689AA0;
  sub_1A916B3B0();
  sub_1A916AD30();
  v38 = v158;
}

void sub_1A9129DA0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A916B540();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A9129DF4(uint64_t a1, uint64_t a2)
{
  sub_1A9129DA0(0, &qword_1EB686928, MEMORY[0x1E4F26C48]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9129E74(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1A9129DA0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t type metadata accessor for RequestData()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for RequestData.EventData.Event()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A9129F00()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A9129FA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  unint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(v5 + 64);
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || v7 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
  }
  return a1;
}

uint64_t sub_1A912A0A4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_1A912A118(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  swift_bridgeObjectRetain();
  v5(v7, v8, v4);
  return a1;
}

void *sub_1A912A1A8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

void *sub_1A912A238(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_1A912A2A8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1A912A330(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 8) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 8) & ~v6);
      }
      uint64_t v15 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_1A912A4D0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 8) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1A912A72CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v9 + 8] & ~v9;
          uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(v19);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = a2 - 1;
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t sub_1A912A754()
{
  uint64_t result = type metadata accessor for HeartbeatEventService.Metadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A912A7EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A916AC90();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for HeartbeatEventService.Metadata();
    uint64_t v9 = *(int *)(v8 + 20);
    size_t v10 = (uint64_t *)((char *)a1 + v9);
    BOOL v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    *size_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = *(int *)(v8 + 24);
    int v15 = (uint64_t *)((char *)a1 + v14);
    unsigned int v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A912A900(uint64_t a1)
{
  uint64_t v2 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for HeartbeatEventService.Metadata();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A912A9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for HeartbeatEventService.Metadata();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  size_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = *(int *)(v7 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  int v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A912AA6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for HeartbeatEventService.Metadata();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  size_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(v7 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A912AB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for HeartbeatEventService.Metadata();
  *(_OWORD *)(a1 + *(int *)(v7 + 20)) = *(_OWORD *)(a2 + *(int *)(v7 + 20));
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_1A912AC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for HeartbeatEventService.Metadata();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  size_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(v7 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  int v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A912ACC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A912ACDC);
}

uint64_t sub_1A912ACDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for HeartbeatEventService.Metadata();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1A912AD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A912ADB0);
}

uint64_t sub_1A912ADB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for HeartbeatEventService.Metadata();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for RequestData.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for RequestData.EventData()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for RequestData.EventData.Event.CodingKeys()
{
  return swift_getGenericMetadata();
}

unint64_t sub_1A912AEB4()
{
  unint64_t result = qword_1EB686C20;
  if (!qword_1EB686C20)
  {
    sub_1A90CE2D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686C20);
  }
  return result;
}

unsigned char *sub_1A912AF24(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A912AFF0);
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

uint64_t sub_1A912B018()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B034()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B050()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B06C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B088()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B0A4()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for RequestData.EventData.CodingKeys()
{
  return swift_getGenericMetadata();
}

unsigned char *sub_1A912B0D8(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A912B174);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A912B19C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B1B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912B1D4()
{
  return swift_getWitnessTable();
}

AppAnalytics::SummarizedEventTrackingKind_optional __swiftcall SummarizedEventTrackingKind.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A916B870();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t SummarizedEventTrackingKind.rawValue.getter()
{
  if (*v0) {
    return 0x7265746E756F63;
  }
  else {
    return 0x6E61656C6F6F62;
  }
}

uint64_t sub_1A912B290(char *a1, char *a2)
{
  return sub_1A9103D08(*a1, *a2);
}

unint64_t sub_1A912B2A0()
{
  unint64_t result = qword_1E97B19C0;
  if (!qword_1E97B19C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B19C0);
  }
  return result;
}

uint64_t sub_1A912B2F4()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A912B36C()
{
  sub_1A916B030();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A912B3C8()
{
  return sub_1A916BAD0();
}

AppAnalytics::SummarizedEventTrackingKind_optional sub_1A912B43C(Swift::String *a1)
{
  return SummarizedEventTrackingKind.init(rawValue:)(*a1);
}

void sub_1A912B448(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6E61656C6F6F62;
  if (*v1) {
    uint64_t v2 = 0x7265746E756F63;
  }
  *a1 = v2;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_1A912B480()
{
  return sub_1A916B160();
}

uint64_t sub_1A912B4E0()
{
  return sub_1A916B120();
}

unsigned char *storeEnumTagSinglePayload for SummarizedEventTrackingKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A912B5FCLL);
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

ValueMetadata *type metadata accessor for SummarizedEventTrackingKind()
{
  return &type metadata for SummarizedEventTrackingKind;
}

unint64_t sub_1A912B634()
{
  unint64_t result = qword_1E97B19C8;
  if (!qword_1E97B19C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B19C8);
  }
  return result;
}

id static OS_os_log.analytics.getter()
{
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  v0 = (void *)qword_1EB689AA0;

  return v0;
}

id static OS_os_log.analytics(_:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1A90A5FA0();
    swift_bridgeObjectRetain();
    return (id)sub_1A916B520();
  }
  else
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    int v3 = (void *)qword_1EB689AA0;
    return v3;
  }
}

uint64_t Group.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AAGroup_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___AAGroup_startDate;
  uint64_t v4 = sub_1A916AC90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Group.contentType.getter()
{
  return *(void *)(v0 + OBJC_IVAR___AAGroup_contentType);
}

id Group.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void Group.init()()
{
}

id Group.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Group();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Group()
{
  uint64_t result = qword_1EB687260;
  if (!qword_1EB687260) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A912BAA8()
{
  return type metadata accessor for Group();
}

uint64_t sub_1A912BAB0()
{
  uint64_t result = sub_1A916AC90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for Group(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Group);
}

uint64_t sub_1A912BB7C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = a2[5];
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    *(void *)(a1 + 64) = a2[8];
    uint64_t v27 = (int *)type metadata accessor for Batch();
    uint64_t v9 = v27[10];
    __dst = (void *)(v6 + v9);
    unint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_1A916AC90();
    uint64_t v28 = *(void *)(v11 - 8);
    uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v10, 1, v11))
    {
      sub_1A912BE40();
      memcpy(__dst, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v14 = v27[11];
    int v15 = (void *)(v6 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    *(unsigned char *)(v6 + v27[12]) = *((unsigned char *)a2 + v27[12]);
    uint64_t v18 = v27[13];
    unint64_t v19 = (void *)(v6 + v18);
    uint64_t v20 = (char *)a2 + v18;
    swift_bridgeObjectRetain();
    if (v12(v20, 1, v11))
    {
      sub_1A912BE40();
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 16))(v19, v20, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v19, 0, 1, v11);
    }
    uint64_t v22 = *(int *)(a3 + 20);
    uint64_t v23 = (void *)(v6 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
  }
  swift_retain();
  return v6;
}

void sub_1A912BE40()
{
  if (!qword_1EB68ACF0)
  {
    sub_1A916AC90();
    unint64_t v0 = sub_1A916B540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB68ACF0);
    }
  }
}

uint64_t sub_1A912BE98(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for Batch();
  uint64_t v3 = a1 + *(int *)(v2 + 40);
  uint64_t v4 = sub_1A916AC90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(v2 + 52);
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }

  return swift_release();
}

uint64_t sub_1A912BFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  v26 = (int *)type metadata accessor for Batch();
  uint64_t v8 = v26[10];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = sub_1A916AC90();
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v9, 1, v10))
  {
    sub_1A912BE40();
    memcpy(__dst, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v13 = v26[11];
  uint64_t v14 = (void *)(a1 + v13);
  int v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v26[12]) = *(unsigned char *)(a2 + v26[12]);
  uint64_t v17 = v26[13];
  uint64_t v18 = (void *)(a1 + v17);
  unint64_t v19 = (const void *)(a2 + v17);
  swift_bridgeObjectRetain();
  if (v11(v19, 1, v10))
  {
    sub_1A912BE40();
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v18, v19, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v18, 0, 1, v10);
  }
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  return a1;
}

void *sub_1A912C264(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for Batch();
  uint64_t v6 = v5[10];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A916AC90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_1A912BE40();
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = v5[11];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + v5[12]) = *((unsigned char *)a2 + v5[12]);
  uint64_t v18 = v5[13];
  unint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  int v21 = v11((char *)a1 + v18, 1, v9);
  int v22 = v11(v20, 1, v9);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v19, v20, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    sub_1A912BE40();
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v19, v20, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
LABEL_13:
  uint64_t v24 = *(int *)(a3 + 20);
  uint64_t v25 = (void *)((char *)a1 + v24);
  v26 = (void *)((char *)a2 + v24);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A912C5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v7 = (int *)type metadata accessor for Batch();
  uint64_t v8 = v7[10];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    sub_1A912BE40();
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + v7[11]) = *(_OWORD *)(a2 + v7[11]);
  *(unsigned char *)(a1 + v7[12]) = *(unsigned char *)(a2 + v7[12]);
  uint64_t v15 = v7[13];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  if (v13((const void *)(a2 + v15), 1, v11))
  {
    sub_1A912BE40();
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v16, v17, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1A912C7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v7 = (int *)type metadata accessor for Batch();
  uint64_t v8 = v7[10];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    sub_1A912BE40();
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = v7[11];
  uint64_t v18 = (void *)(a1 + v17);
  unint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v7[12]) = *(unsigned char *)(a2 + v7[12]);
  uint64_t v22 = v7[13];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  int v25 = v13((void *)(a1 + v22), 1, v11);
  int v26 = v13(v24, 1, v11);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v23, v24, v11);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v23, v11);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    sub_1A912BE40();
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v23, v24, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v23, 0, 1, v11);
LABEL_13:
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_1A912CB10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A912CB24);
}

uint64_t sub_1A912CB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Batch();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1A912CBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A912CBF8);
}

uint64_t sub_1A912CBF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Batch();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for BatchRepair()
{
  uint64_t result = qword_1EB687D50;
  if (!qword_1EB687D50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A912CD00()
{
  uint64_t result = type metadata accessor for Batch();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of SnapshotType.submit<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1A912CDAC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v26 - v10;
  MEMORY[0x1F4188790](v12);
  int v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_1A916B2F0();
  if (!v18) {
    return sub_1A916B1E0();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_1A916AEA0();
  uint64_t v32 = sub_1A916B760();
  sub_1A916B700();
  uint64_t v36 = v8;
  uint64_t result = sub_1A916B2E0();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_1A916B330();
      uint64_t v22 = v11;
      uint64_t v23 = v11;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_1A916B740();
      sub_1A916B300();
      --v19;
      uint64_t v11 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_1A912D1AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  int v14 = &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16[8] = *(unsigned char *)v5;
  long long v17 = *(_OWORD *)(v5 + 8);
  sub_1A916AC80();
  sub_1A912D2CC(a1, (uint64_t)v14, a2, a3, a4, a5);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1A912D2CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v110 = a2;
  uint64_t v109 = sub_1A916AC90();
  uint64_t v132 = *(void **)(v109 - 8);
  MEMORY[0x1F4188790](v109);
  uint64_t v108 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  id v117 = (char *)&v100 - v14;
  uint64_t v127 = type metadata accessor for TimedData();
  MEMORY[0x1F4188790](v127);
  id v115 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v113 = (uint64_t)&v100 - v17;
  uint64_t v130 = a3;
  uint64_t v18 = type metadata accessor for SnapshotLevel();
  uint64_t v116 = sub_1A916B540();
  uint64_t v19 = *(void *)(v116 - 8);
  MEMORY[0x1F4188790](v116);
  uint64_t v123 = (char *)&v100 - v20;
  sub_1A912E630(0);
  MEMORY[0x1F4188790](v21 - 8);
  uint64_t v122 = (uint64_t)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for Tracker.Timer(0);
  uint64_t v23 = *(void *)(v124 - 8);
  MEMORY[0x1F4188790](v124);
  uint64_t v114 = (uint64_t)&v100 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v125 = *v6;
  uint64_t v25 = *((void *)v6 + 1);
  uint64_t v26 = *((void *)v6 + 2);
  uint64_t v131 = v25;
  uint64_t v121 = a4;
  uint64_t v126 = type metadata accessor for SnapshotEvent.MissingData();
  uint64_t v27 = sub_1A916AEA0();
  uint64_t v154 = v27;
  uint64_t v129 = v26;
  uint64_t v28 = sub_1A909AEEC(a1, a5);
  uint64_t v29 = v28[2];
  if (!v29)
  {
    swift_bridgeObjectRelease();
    uint64_t v99 = MEMORY[0x1E4FBC860];
    return sub_1A90CA834(v99, v27, a6);
  }
  uint64_t v104 = a6;
  uint64_t v105 = a5;
  uint64_t v133 = &v153;
  uint64_t v30 = v18;
  uint64_t v31 = (uint64_t)(v28 + 4);
  v128 = v142;
  uint64_t v119 = v30 - 8;
  uint64_t v120 = v30;
  uint64_t v118 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  v106 = (uint64_t (**)(char *, uint64_t))(v132 + 1);
  uint64_t v107 = (void (**)(char *, uint64_t, uint64_t))(v132 + 2);
  uint64_t v102 = (uint64_t *)&v144;
  v103 = v28;
  unint64_t v111 = (void (**)(char *, uint64_t))(v19 + 8);
  id v112 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  uint64_t v100 = v23;
  unint64_t v101 = 0x80000001A9178FB0;
  uint64_t v132 = (void *)MEMORY[0x1E4FBC860];
  char v32 = v125;
  while (1)
  {
    sub_1A909553C(v31, (uint64_t)v152);
    uint64_t v33 = v152[0];
    uint64_t v34 = v152[1];
    sub_1A90A0DC8((uint64_t)v133, (uint64_t)v149);
    swift_bridgeObjectRetain();
    sub_1A90954AC((uint64_t)v152);
    uint64_t v35 = v150;
    uint64_t v36 = v151;
    __swift_project_boxed_opaque_existential_1(v149, v150);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v36 + 16))(v35, v36))
    {
      LOBYTE(v134) = v32;
      *((void *)&v134 + 1) = v131;
      *(void *)&long long v135 = v129;
      uint64_t v45 = v150;
      uint64_t v46 = v151;
      __swift_project_boxed_opaque_existential_1(v149, v150);
      uint64_t v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v45, v46);
      sub_1A912DEAC(v47, v48, &v141);
      swift_bridgeObjectRelease();
      if (*((void *)&v141 + 1)) {
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
      sub_1A912E664((uint64_t)&v141);
      uint64_t v49 = v150;
      uint64_t v50 = v151;
      __swift_project_boxed_opaque_existential_1(v149, v150);
      *(void *)&long long v141 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 32))(v49, v50) | 0x8000000000000000;
      goto LABEL_26;
    }
    uint64_t v37 = v150;
    uint64_t v38 = v151;
    __swift_project_boxed_opaque_existential_1(v149, v150);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v38 + 24))(v37, v38))
    {
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    uint64_t v39 = v150;
    uint64_t v40 = v151;
    __swift_project_boxed_opaque_existential_1(v149, v150);
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 40))(v127, v127, v39, v40) & 1) == 0) {
      goto LABEL_19;
    }
    *(void *)&long long v141 = v131;
    uint64_t v41 = v120;
    sub_1A916B230();
    swift_getWitnessTable();
    uint64_t v42 = v123;
    sub_1A916B310();
    uint64_t v43 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v42, 1, v41) == 1)
    {
      (*v111)(v42, v116);
      uint64_t v44 = v122;
      (*v118)(v122, 1, 1, v124);
LABEL_18:
      sub_1A912E78C(v44, (uint64_t (*)(void))sub_1A912E630);
      char v32 = v125;
LABEL_19:
      LOBYTE(v134) = v32;
      *((void *)&v134 + 1) = v131;
      *(void *)&long long v135 = v129;
      uint64_t v59 = v150;
      uint64_t v60 = v151;
      __swift_project_boxed_opaque_existential_1(v149, v150);
      uint64_t v61 = (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v59, v60);
      sub_1A912DEAC(v61, v62, &v141);
      swift_bridgeObjectRelease();
      if (*((void *)&v141 + 1))
      {
LABEL_20:
        long long v145 = v142[1];
        long long v146 = v142[2];
        long long v147 = v142[3];
        long long v148 = v142[4];
        long long v143 = v141;
        long long v144 = v142[0];
        sub_1A9106268((uint64_t)&v143, (uint64_t)v128);
        *(void *)&long long v141 = v33;
        *((void *)&v141 + 1) = v34;
        sub_1A912E6DC((uint64_t)&v141, (uint64_t)&v134);
        uint64_t v63 = v132;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v63 = sub_1A90C3A78(0, v63[2] + 1, 1, v63);
        }
        unint64_t v65 = v63[2];
        unint64_t v64 = v63[3];
        if (v65 >= v64 >> 1) {
          uint64_t v63 = sub_1A90C3A78((void *)(v64 > 1), v65 + 1, 1, v63);
        }
        v63[2] = v65 + 1;
        uint64_t v132 = v63;
        id v66 = &v63[14 * v65];
        long long v67 = v134;
        long long v68 = v136;
        v66[3] = v135;
        v66[4] = v68;
        v66[2] = v67;
        long long v69 = v137;
        long long v70 = v138;
        long long v71 = v140;
        v66[7] = v139;
        v66[8] = v71;
        v66[5] = v69;
        v66[6] = v70;
        sub_1A912E738((uint64_t)&v141);
        sub_1A90A0EAC((uint64_t)&v143);
        goto LABEL_4;
      }
      swift_bridgeObjectRelease();
      sub_1A912E664((uint64_t)&v141);
      uint64_t v72 = v150;
      uint64_t v73 = v151;
      __swift_project_boxed_opaque_existential_1(v149, v150);
      *(void *)&long long v141 = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 32))(v72, v73);
LABEL_26:
      sub_1A916B230();
      sub_1A916B210();
      goto LABEL_4;
    }
    uint64_t v51 = *(void *)&v42[*(int *)(v41 + 32)];
    uint64_t v52 = *(void (**)(char *, uint64_t))(v43 + 8);
    swift_bridgeObjectRetain();
    v52(v42, v41);
    uint64_t v53 = sub_1A90A33F0();
    if (*(void *)(v51 + 16))
    {
      unint64_t v55 = sub_1A90A1D98(v53, v54);
      uint64_t v44 = v122;
      if (v56)
      {
        sub_1A912E844(*(void *)(v51 + 56) + *(void *)(v100 + 72) * v55, v122, type metadata accessor for Tracker.Timer);
        uint64_t v57 = 0;
      }
      else
      {
        uint64_t v57 = 1;
      }
    }
    else
    {
      uint64_t v57 = 1;
      uint64_t v44 = v122;
    }
    uint64_t v58 = v124;
    (*v118)(v44, v57, 1, v124);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*v112)(v44, 1, v58) == 1) {
      goto LABEL_18;
    }
    uint64_t v74 = v114;
    sub_1A9096F5C(v44, v114, type metadata accessor for Tracker.Timer);
    v75 = *v107;
    uint64_t v76 = v74;
    uint64_t v77 = v109;
    (*v107)(v117, v76, v109);
    v78 = v108;
    v75(v108, v110, v77);
    v79 = v115;
    v75(v115, (uint64_t)v117, v77);
    v75(&v79[*(int *)(v127 + 20)], (uint64_t)v78, v77);
    v80 = v117;
    sub_1A916ABF0();
    double v82 = v81;
    id v83 = *v106;
    (*v106)(v78, v77);
    uint64_t result = v83(v80, v77);
    double v85 = v82 * 1000.0;
    if ((~COERCE__INT64(v82 * 1000.0) & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v85 <= -9.22337204e18) {
      goto LABEL_39;
    }
    if (v85 >= 9.22337204e18) {
      goto LABEL_40;
    }
    uint64_t v86 = v127;
    uint64_t v87 = (uint64_t)v115;
    *(void *)&v115[*(int *)(v127 + 24)] = (uint64_t)v85;
    uint64_t v88 = v113;
    sub_1A9096F5C(v87, v113, (uint64_t (*)(void))type metadata accessor for TimedData);
    *((void *)&v145 + 1) = v86;
    *(void *)&long long v146 = sub_1A912E7EC();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v102);
    sub_1A912E844(v88, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for TimedData);
    *(void *)&long long v143 = v33;
    *((void *)&v143 + 1) = v34;
    *((void *)&v146 + 1) = MEMORY[0x1E4FBC860];
    LOBYTE(v147) = 0;
    *((void *)&v147 + 1) = 0xD000000000000057;
    *(void *)&long long v148 = v101;
    *((void *)&v148 + 1) = 81;
    sub_1A9106268((uint64_t)&v143, (uint64_t)v128);
    *(void *)&long long v141 = v33;
    *((void *)&v141 + 1) = v34;
    sub_1A912E6DC((uint64_t)&v141, (uint64_t)&v134);
    swift_bridgeObjectRetain();
    uint64_t v90 = v132;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v90 = sub_1A90C3A78(0, v90[2] + 1, 1, v90);
    }
    char v32 = v125;
    unint64_t v92 = v90[2];
    unint64_t v91 = v90[3];
    if (v92 >= v91 >> 1) {
      uint64_t v90 = sub_1A90C3A78((void *)(v91 > 1), v92 + 1, 1, v90);
    }
    v90[2] = v92 + 1;
    uint64_t v132 = v90;
    v93 = &v90[14 * v92];
    long long v94 = v134;
    long long v95 = v136;
    v93[3] = v135;
    v93[4] = v95;
    v93[2] = v94;
    long long v96 = v137;
    long long v97 = v138;
    long long v98 = v140;
    v93[7] = v139;
    v93[8] = v98;
    v93[5] = v96;
    v93[6] = v97;
    sub_1A912E738((uint64_t)&v141);
    sub_1A90A0EAC((uint64_t)&v143);
    sub_1A912E78C(v113, (uint64_t (*)(void))type metadata accessor for TimedData);
    sub_1A912E78C(v114, type metadata accessor for Tracker.Timer);
LABEL_4:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v149);
    v31 += 56;
    if (!--v29)
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = v154;
      a6 = v104;
      uint64_t v99 = (uint64_t)v132;
      return sub_1A90CA834(v99, v27, a6);
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1A912DEAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  char v7 = *v3;
  uint64_t v8 = *((void *)v3 + 1);
  if ((v7 & 1) == 0)
  {
    *(void *)&v70[0] = v8;
    MEMORY[0x1F4188790](a1);
    uint64_t v67 = *(void *)(v36 + 16);
    type metadata accessor for SnapshotLevel();
    uint64_t v37 = sub_1A916B230();
    sub_1A912E8E0(0, qword_1E97B19E0, (uint64_t (*)(uint64_t))sub_1A912E9C8, MEMORY[0x1E4FBB718]);
    uint64_t v39 = v38;
    swift_bridgeObjectRetain();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v42 = sub_1A912CDAC((void (*)(char *, char *))sub_1A912E994, (uint64_t)v66, v37, v39, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v41);
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void *)(v42 + 16);
    uint64_t v44 = MEMORY[0x1E4FBC860];
    if (v43)
    {
      uint64_t v45 = a3;
      swift_bridgeObjectRetain();
      uint64_t v46 = (uint64_t *)(v42 + 48);
      uint64_t v47 = (void *)MEMORY[0x1E4FBC860];
      do
      {
        if (*(v46 - 1))
        {
          uint64_t v48 = *v46;
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v47 = sub_1A90C3950(0, v47[2] + 1, 1, v47);
          }
          unint64_t v50 = v47[2];
          unint64_t v49 = v47[3];
          if (v50 >= v49 >> 1) {
            uint64_t v47 = sub_1A90C3950((void *)(v49 > 1), v50 + 1, 1, v47);
          }
          v47[2] = v50 + 1;
          v47[v50 + 4] = v48;
        }
        v46 += 4;
        --v43;
      }
      while (v43);
      swift_bridgeObjectRelease();
      a3 = v45;
      uint64_t v44 = MEMORY[0x1E4FBC860];
    }
    else
    {
      uint64_t v47 = (void *)MEMORY[0x1E4FBC860];
    }
    swift_bridgeObjectRelease();
    *(void *)&v70[0] = v44;
    uint64_t v57 = v47[2];
    if (v57)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v57; ++i)
      {
        uint64_t v59 = swift_bridgeObjectRetain();
        sub_1A91135C0(v59);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v60 = *(void *)(*(void *)&v70[0] + 16);
    if (v60)
    {
      uint64_t v61 = *(void *)&v70[0] + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_1A9106268(v61, (uint64_t)v70);
        BOOL v62 = *(void *)&v70[0] == a1 && *((void *)&v70[0] + 1) == a2;
        if (v62 || (sub_1A916B9E0() & 1) != 0) {
          goto LABEL_69;
        }
        sub_1A90A0EAC((uint64_t)v70);
        v61 += 96;
        --v60;
      }
      while (v60);
LABEL_67:
      swift_bridgeObjectRelease();
    }
    goto LABEL_68;
  }
  *(void *)&v70[0] = v8;
  MEMORY[0x1F4188790](a1);
  uint64_t v67 = *(void *)(v9 + 16);
  type metadata accessor for SnapshotLevel();
  uint64_t v10 = sub_1A916B230();
  sub_1A912E8E0(0, &qword_1E97B19D8, (uint64_t (*)(uint64_t))sub_1A90C57F4, MEMORY[0x1E4FBB718]);
  uint64_t v12 = v11;
  swift_bridgeObjectRetain();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v15 = sub_1A912CDAC((void (*)(char *, char *))sub_1A912E8AC, (uint64_t)v66, v10, v12, MEMORY[0x1E4FBC248], v13, MEMORY[0x1E4FBC278], v14);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)MEMORY[0x1E4FBC860];
LABEL_41:
    *(void *)&v70[0] = MEMORY[0x1E4FBC860];
    uint64_t v51 = v20[2];
    if (v51)
    {
      swift_bridgeObjectRetain();
      for (uint64_t j = 0; j != v51; ++j)
      {
        uint64_t v53 = swift_bridgeObjectRetain();
        sub_1A91135C0(v53);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v54 = *(void *)(*(void *)&v70[0] + 16);
    if (v54)
    {
      uint64_t v55 = *(void *)&v70[0] + 32;
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_1A9106268(v55, (uint64_t)v70);
        BOOL v56 = *(void *)&v70[0] == a1 && *((void *)&v70[0] + 1) == a2;
        if (v56 || (sub_1A916B9E0() & 1) != 0) {
          break;
        }
        sub_1A90A0EAC((uint64_t)v70);
        v55 += 96;
        if (!--v54) {
          goto LABEL_67;
        }
      }
LABEL_69:
      swift_bridgeObjectRelease();
      long long v63 = v70[3];
      a3[2] = v70[2];
      a3[3] = v63;
      long long v64 = v70[5];
      a3[4] = v70[4];
      a3[5] = v64;
      long long v65 = v70[1];
      *a3 = v70[0];
      a3[1] = v65;
      return swift_bridgeObjectRelease();
    }
LABEL_68:
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
    return swift_bridgeObjectRelease();
  }
  uint64_t v68 = v15;
  long long v69 = a3;
  uint64_t v17 = v15 + 32;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = (void *)MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v21 = v17 + 32 * v19;
    if (*(void *)(v21 + 8))
    {
      uint64_t v22 = *(void *)(v21 + 16);
      unint64_t v23 = *(void *)(v22 + 64);
      char v24 = *(unsigned char *)(v22 + 32);
      uint64_t v25 = 1 << v24;
      if (v23)
      {
        uint64_t v26 = 0;
      }
      else
      {
        unsigned int v32 = v24 & 0x3F;
        if (v32 < 7) {
          goto LABEL_5;
        }
        unint64_t v23 = *(void *)(v22 + 72);
        if (v23)
        {
          uint64_t v26 = 1;
        }
        else
        {
          if (v32 < 8) {
            goto LABEL_5;
          }
          unint64_t v23 = *(void *)(v22 + 80);
          if (!v23)
          {
            uint64_t v33 = 0;
            unint64_t v34 = (unint64_t)(v25 + 63) >> 6;
            if (v34 <= 3) {
              unint64_t v34 = 3;
            }
            unint64_t v35 = v34 - 3;
            while (v35 != v33)
            {
              unint64_t v23 = *(void *)(v22 + 88 + 8 * v33++);
              if (v23)
              {
                uint64_t v26 = v33 + 2;
                goto LABEL_9;
              }
            }
            goto LABEL_5;
          }
          uint64_t v26 = 2;
        }
      }
LABEL_9:
      unint64_t v27 = __clz(__rbit64(v23));
      uint64_t v28 = v27 + (v26 << 6);
      if (v28 != v25) {
        break;
      }
    }
LABEL_5:
    if (++v19 == v16)
    {
      swift_bridgeObjectRelease_n();
      a3 = v69;
      goto LABEL_41;
    }
  }
  if ((v28 & 0x8000000000000000) == 0 && v28 < v25)
  {
    if (((*(void *)(v22 + 64 + (((unint64_t)v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
      goto LABEL_72;
    }
    uint64_t v29 = *(void *)(*(void *)(v22 + 56) + 8 * v28);
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1A90C3950(0, v20[2] + 1, 1, v20);
      uint64_t v20 = (void *)result;
    }
    unint64_t v31 = v20[2];
    unint64_t v30 = v20[3];
    if (v31 >= v30 >> 1)
    {
      uint64_t result = (uint64_t)sub_1A90C3950((void *)(v30 > 1), v31 + 1, 1, v20);
      uint64_t v20 = (void *)result;
    }
    v20[2] = v31 + 1;
    v20[v31 + 4] = v29;
    goto LABEL_5;
  }
  __break(1u);
LABEL_72:
  __break(1u);
  return result;
}

double sub_1A912E518@<D0>(uint64_t a1@<X0>, void (*a2)(void)@<X3>, _OWORD *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SnapshotLevel();
  double v7 = MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))((char *)&v11 - v8, a1, v6, v7);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1A912E61C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_1A912D1AC(a1, a4, a2, a3, a5);
}

void sub_1A912E630(uint64_t a1)
{
}

uint64_t sub_1A912E664(uint64_t a1)
{
  sub_1A912E944(0, &qword_1EB689380, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A912E6DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A912E738(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A912E78C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1A912E7EC()
{
  unint64_t result = qword_1EB6893C8[0];
  if (!qword_1EB6893C8[0])
  {
    type metadata accessor for TimedData();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB6893C8);
  }
  return result;
}

uint64_t sub_1A912E844(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_1A912E8AC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1A912E518(a1, sub_1A90C57F4, a2);
}

void sub_1A912E8E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1A912E944(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for AnyDataEventEntry);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

double sub_1A912E994@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1A912E518(a1, (void (*)(void))sub_1A912E9C8, a2);
}

void sub_1A912E9C8()
{
  if (!qword_1E97B1310)
  {
    sub_1A912E944(255, &qword_1E97B12D0, MEMORY[0x1E4FBB320]);
    unint64_t v0 = type metadata accessor for SnapshotLevel();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E97B1310);
    }
  }
}

uint64_t sub_1A912EA40()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1A912EA7C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1A912EABC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A912EB24(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t type metadata accessor for Snapshot()
{
  return __swift_instantiateGenericMetadata();
}

BOOL static EventProperty.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EventProperty.hash(into:)()
{
  return sub_1A916BAC0();
}

uint64_t EventProperty.hashValue.getter()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A912EC1C()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A912EC58()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A912EC74(void *a1)
{
  return nullsub_1(a1[2], a1[3], a1[4]);
}

uint64_t sub_1A912EC84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A912EC98(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))() & 1;
}

uint64_t sub_1A912ECCC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() & 1;
}

uint64_t sub_1A912ED00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A912ED14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

unsigned char *sub_1A912ED28(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A912EDF4);
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

uint64_t sub_1A912EE1C(uint64_t a1, unint64_t a2)
{
  int v2 = 1;
  unsigned __int8 v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)a1;
      if ((int)a1 != a1 >> 32) {
        goto LABEL_15;
      }
      unsigned __int8 v3 = 0;
      return v3 | (v2 << 8);
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      if (v4 != v5)
      {
        if (a2 >> 62 == 2)
        {
          if (v4 >= v5) {
            goto LABEL_23;
          }
          uint64_t v6 = sub_1A916A870();
          if (!v6) {
            goto LABEL_25;
          }
          uint64_t v7 = v6;
          a1 = sub_1A916A8A0();
          uint64_t v8 = v4 - a1;
          if (!__OFSUB__(v4, a1)) {
            goto LABEL_19;
          }
          __break(1u);
        }
LABEL_15:
        if (v4 < (int)a1 || v4 >= a1 >> 32)
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
        }
        uint64_t v9 = sub_1A916A870();
        if (v9)
        {
          uint64_t v7 = v9;
          uint64_t v10 = sub_1A916A8A0();
          uint64_t v8 = v4 - v10;
          if (!__OFSUB__(v4, v10))
          {
LABEL_19:
            int v2 = 0;
            unsigned __int8 v3 = *(unsigned char *)(v7 + v8);
            return v3 | (v2 << 8);
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_25:
        __break(1u);
        JUMPOUT(0x1A912EF64);
      }
      unsigned __int8 v3 = 0;
      int v2 = 1;
      return v3 | (v2 << 8);
    case 3uLL:
      return v3 | (v2 << 8);
    default:
      int v2 = (a2 & 0xFF000000000000) == 0;
      if ((a2 & 0xFF000000000000) != 0) {
        unsigned __int8 v3 = a1;
      }
      else {
        unsigned __int8 v3 = 0;
      }
      return v3 | (v2 << 8);
  }
}

uint64_t sub_1A912EF74(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  sub_1A908E870(0, &qword_1EB687518);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    sub_1A908EC8C(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_1A916A8D0();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_1A91399F8((uint64_t)v38, &qword_1EB687520, &qword_1EB687518, MEMORY[0x1E4F27218]);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_1A916B6D0();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_1A91361D0(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_1A916B070();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_1A9136234(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x1F4188790](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_1A9134454((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1A9139458);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_1A916AB20();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_1A90DD494(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_1A916B0B0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_1A916B6D0();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_1A90DD494(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_1A916B080();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_1A916AB40();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_1A916AB40();
    sub_1A90B07D4(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1A90B07D4((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_1A912F4C8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v37 = a1;
  *((void *)&v37 + 1) = a2;
  unint64_t v38 = a3;
  unint64_t v39 = a4;
  sub_1A908E870(0, &qword_1EB687518);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    sub_1A908EC8C(v35, (uint64_t)&v30);
    __swift_project_boxed_opaque_existential_1(&v30, v32);
    sub_1A916A8D0();
    swift_bridgeObjectRelease();
    v35[0] = v37;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v30);
    return *(void *)&v35[0];
  }
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  sub_1A91399F8((uint64_t)v35, &qword_1EB687520, &qword_1EB687518, MEMORY[0x1E4F27218]);
  sub_1A9135674(a1, a2, a3, a4, &v30);
  unint64_t v4 = *((void *)&v30 + 1);
  uint64_t v5 = v30;
  if (*((void *)&v30 + 1) >> 60 != 15)
  {
    swift_bridgeObjectRelease();
    v35[0] = __PAIR128__(v4, v5);
    return *(void *)&v35[0];
  }
  unint64_t v6 = sub_1A9133DA4(a1, a2, a3, a4);
  *(void *)&v35[0] = sub_1A9136234(v6);
  *((void *)&v35[0] + 1) = v7;
  MEMORY[0x1F4188790](*(void *)&v35[0]);
  sub_1A9134758((void *(*)(long long *__return_ptr, char *, char *))sub_1A9139B1C, (uint64_t)&v30);
  unint64_t v8 = *((void *)&v30 + 1);
  uint64_t v10 = v31;
  uint64_t v9 = v32;
  unint64_t v11 = v33;
  uint64_t v12 = *((void *)&v35[0] + 1) >> 62;
  switch(*((void *)&v35[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v13) = DWORD1(v35[0]) - LODWORD(v35[0]);
      if (__OFSUB__(DWORD1(v35[0]), v35[0])) {
        goto LABEL_44;
      }
      uint64_t v13 = (int)v13;
LABEL_10:
      if (v34 == v13)
      {
LABEL_16:
        uint64_t v18 = *((void *)&v30 + 1) >> 14;
        *(void *)((char *)&v30 + 7) = 0;
        *(void *)&long long v30 = 0;
        if (v8 >> 14 == v33 >> 14) {
          goto LABEL_37;
        }
        unint64_t v24 = v4;
        LOBYTE(v4) = 0;
        uint64_t v19 = (v31 >> 59) & 1;
        if ((v32 & 0x1000000000000000) == 0) {
          LOBYTE(v19) = 1;
        }
        uint64_t v20 = 4 << v19;
        unint64_t v21 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          unint64_t v21 = v31 & 0xFFFFFFFFFFFFLL;
        }
        unint64_t v25 = v21;
        while (1)
        {
          char v22 = sub_1A916B580();
          if ((v11 & 0xC) == v20)
          {
            unint64_t v11 = sub_1A90DD494(v11, v10, v9);
            if ((v9 & 0x1000000000000000) != 0)
            {
LABEL_27:
              if (v25 <= v11 >> 16) {
                goto LABEL_42;
              }
              unint64_t v11 = sub_1A916B080();
              goto LABEL_29;
            }
          }
          else if ((v9 & 0x1000000000000000) != 0)
          {
            goto LABEL_27;
          }
          unint64_t v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_29:
          *((unsigned char *)&v30 + v4) = v22;
          LOWORD(v4) = v4 + 1;
          if ((v4 & 0x100) != 0)
          {
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
          }
          if (v4 == 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            sub_1A916AB40();
            LOBYTE(v4) = 0;
            if (v18 == v11 >> 14)
            {
              swift_bridgeObjectRelease();
              sub_1A90B07D4(v5, v24);
              goto LABEL_38;
            }
          }
          else if (v18 == v11 >> 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            sub_1A916AB40();
            sub_1A90B07D4(v5, v24);
            goto LABEL_37;
          }
        }
      }
      if (v12)
      {
        if (v12 == 1) {
          uint64_t v17 = *(uint64_t *)&v35[0] >> 32;
        }
        else {
          uint64_t v17 = *(void *)(*(void *)&v35[0] + 24);
        }
      }
      else
      {
        uint64_t v17 = BYTE14(v35[0]);
      }
LABEL_35:
      if (v17 < v34) {
        goto LABEL_43;
      }
      sub_1A916AB20();
LABEL_37:
      swift_bridgeObjectRelease();
LABEL_38:
      swift_bridgeObjectRelease();
      return *(void *)&v35[0];
    case 2:
      uint64_t v15 = *(void *)(*(void *)&v35[0] + 16);
      uint64_t v14 = *(void *)(*(void *)&v35[0] + 24);
      BOOL v16 = __OFSUB__(v14, v15);
      uint64_t v13 = v14 - v15;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_45;
    case 3:
      if (!v34) {
        goto LABEL_16;
      }
      uint64_t v17 = 0;
      goto LABEL_35;
    default:
      uint64_t v13 = BYTE14(v35[0]);
      goto LABEL_10;
  }
}

BOOL sub_1A912F968()
{
  unint64_t v0 = sub_1A9147004(0xD00000000000003CLL, 0x80000001A91781F0, 512);
  unint64_t v2 = v1;
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v3 = (uint64_t)v0;
  __int16 v4 = sub_1A912EE1C((uint64_t)v0, v1);
  sub_1A90B07D4(v3, v2);
  return (v4 & 0x100) == 0 && v4 == 1;
}

uint64_t UploadDropboxFile.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_url;
  uint64_t v2 = sub_1A916AAD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9136060(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionStartDate, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928]);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UploadDropboxFile.__deallocating_deinit()
{
  UploadDropboxFile.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t UploadDropboxFile.description.getter()
{
  sub_1A9135FFC(0, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v25 - v2;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  sub_1A90A5670(0, &qword_1EB689858, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A9171E90;
  uint64_t v6 = *(void *)(v0 + 24);
  *(void *)(v5 + 32) = *(void *)(v0 + 16);
  *(void *)(v5 + 40) = v6;
  swift_bridgeObjectRetain();
  *(void *)(v5 + 48) = sub_1A916A9E0();
  *(void *)(v5 + 56) = v7;
  uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_eventCount);
  uint64_t v28 = sub_1A916B990();
  uint64_t v29 = v8;
  sub_1A916B050();
  uint64_t v9 = v29;
  *(void *)(v5 + 64) = v28;
  *(void *)(v5 + 72) = v9;
  uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_byteSize);
  uint64_t v28 = sub_1A916B990();
  uint64_t v29 = v10;
  sub_1A916B050();
  uint64_t v11 = v29;
  *(void *)(v5 + 80) = v28;
  *(void *)(v5 + 88) = v11;
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_userAgent + 8);
  uint64_t v28 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_userAgent);
  uint64_t v29 = v12;
  uint64_t v13 = (uint64_t (*)(void, uint64_t))MEMORY[0x1E4FBB718];
  sub_1A90A5670(0, &qword_1EB687300, v4, MEMORY[0x1E4FBB718]);
  swift_bridgeObjectRetain();
  *(void *)(v5 + 96) = sub_1A916AFE0();
  *(void *)(v5 + 104) = v14;
  char v15 = *(unsigned char *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_contentType + 8);
  uint64_t v28 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_contentType);
  LOBYTE(v29) = v15;
  sub_1A90A5670(0, &qword_1EB687528, (uint64_t)&type metadata for ContentType, v13);
  *(void *)(v5 + 112) = sub_1A916AFE0();
  *(void *)(v5 + 120) = v16;
  uint64_t v17 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_groupName + 8);
  uint64_t v28 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_groupName);
  uint64_t v29 = v17;
  swift_bridgeObjectRetain();
  *(void *)(v5 + 128) = sub_1A916AFE0();
  *(void *)(v5 + 136) = v18;
  uint64_t v19 = v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionStartDate;
  swift_beginAccess();
  sub_1A90B1164(v19, (uint64_t)v3);
  *(void *)(v5 + 144) = sub_1A916AFE0();
  *(void *)(v5 + 152) = v20;
  uint64_t v21 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionID + 8);
  uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionID);
  uint64_t v27 = v21;
  swift_bridgeObjectRetain();
  *(void *)(v5 + 160) = sub_1A916AFE0();
  *(void *)(v5 + 168) = v22;
  uint64_t v26 = v5;
  sub_1A90A5670(0, (unint64_t *)&qword_1EB688C10, v4, MEMORY[0x1E4FBB320]);
  sub_1A9139620((unint64_t *)&qword_1EB689480, (unint64_t *)&qword_1EB688C10, v4);
  uint64_t v23 = sub_1A916AF40();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_1A912FEE0()
{
  return UploadDropboxFile.description.getter();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.append(data:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.read(file:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.close(file:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.fileState(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.setState(of:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.remove(file:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.create(file:session:client:contentType:groupName:timestampConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 56))(a1);
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.userAgent(of:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.contentType(of:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.groupName(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.sessionStartDate(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.sessionID(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.timestampConfiguration(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.removeDirectory(at:onlyIfEmpty:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 112))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.createDirectory(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.listFileNames(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of UploadDropboxFileManagerType.listURLs(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

ValueMetadata *type metadata accessor for UploadDropboxFileState()
{
  return &type metadata for UploadDropboxFileState;
}

uint64_t sub_1A9130140()
{
  return type metadata accessor for UploadDropboxFile();
}

uint64_t type metadata accessor for UploadDropboxFile()
{
  uint64_t result = qword_1EB688808;
  if (!qword_1EB688808) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1A9130194()
{
  sub_1A916AAD0();
  if (v0 <= 0x3F)
  {
    sub_1A9135FFC(319, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for UploadDropboxFile(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UploadDropboxFile);
}

uint64_t dispatch thunk of UploadDropboxFile.isFileWrittenTo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

void sub_1A9130330(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_state);
  if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_state + 9) & 1) == 0)
  {
    uint64_t v7 = *v6;
    unsigned __int8 v8 = v6[1] & 1;
    goto LABEL_5;
  }
  sub_1A913085C((uint64_t)&v9);
  if (!v2)
  {
    uint64_t v7 = v9;
    unsigned __int8 v8 = v10;
    *uint64_t v6 = v9;
    *((_WORD *)v6 + 4) = v8;
LABEL_5:
    *(void *)a2 = v7;
    *(unsigned char *)(a2 + 8) = v8;
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a1 + v5) + 16));
}

void sub_1A91303F0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  sub_1A9130650(a1, a2);
  uint64_t v5 = *(os_unfair_lock_s **)(*(void *)(a1 + v4) + 16);

  os_unfair_lock_unlock(v5);
}

void sub_1A9130458(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = (void *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_timestampConfiguration);
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_timestampConfiguration);
  if (v6 == 5)
  {
    sub_1A9132D34(&v9);
    uint64_t v7 = *((void *)&v9 + 1);
    uint64_t v6 = v9;
    void *v5 = v9;
    v5[1] = v7;
  }
  else
  {
    uint64_t v7 = v5[1];
  }
  *a2 = v6;
  a2[1] = v7;
  unsigned __int8 v8 = *(os_unfair_lock_s **)(*(void *)(a1 + v4) + 16);

  os_unfair_lock_unlock(v8);
}

id sub_1A91304F8(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)sub_1A916AA40();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForUpdatingURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_1A916AAD0();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_1A916A990();

    swift_willThrow();
    uint64_t v9 = sub_1A916AAD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_1A9130650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A9135FFC(0, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = &v14[-v8];
  uint64_t v10 = a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionStartDate;
  swift_beginAccess();
  sub_1A90B1164(v10, (uint64_t)v9);
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) == 1)
  {
    sub_1A9136060((uint64_t)v9, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928]);
    sub_1A9132108(a2);
    sub_1A90B1164(a2, (uint64_t)v6);
    swift_beginAccess();
    sub_1A9139920((uint64_t)v6, v10);
    return swift_endAccess();
  }
  else
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a2, v9, v11);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
  }
}

void sub_1A913085C(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1A9147004(0xD00000000000003ELL, 0x80000001A9179BE0, 8);
  if (!v1)
  {
    unint64_t v14 = v5;
    if (v5 >> 60 == 15)
    {
      *(void *)a1 = 1;
      *(unsigned char *)(a1 + 8) = 1;
      return;
    }
    uint64_t v15 = (uint64_t)v4;
    sub_1A916AFC0();
    uint64_t v16 = sub_1A916AFA0();
    if (!v17)
    {
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      id v27 = (id)qword_1EB689AA0;
      sub_1A916B3B0();
      sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_1A916E200;
      uint64_t v29 = sub_1A916AA90();
      uint64_t v31 = v30;
      *(void *)(v28 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v32 = sub_1A90A67C0();
      *(void *)(v28 + 64) = v32;
      *(void *)(v28 + 32) = v29;
      *(void *)(v28 + 40) = v31;
      unint64_t v33 = (void *)sub_1A916AB60();
      id v34 = objc_msgSend(v33, sel_description);

      uint64_t v35 = sub_1A916AF90();
      uint64_t v37 = v36;

      *(void *)(v28 + 96) = MEMORY[0x1E4FBB1A0];
      *(void *)(v28 + 104) = v32;
      *(void *)(v28 + 72) = v35;
      *(void *)(v28 + 80) = v37;
      sub_1A916AD30();
      sub_1A90B07D4(v15, v14);

      goto LABEL_71;
    }
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    uint64_t v20 = HIBYTE(v17) & 0xF;
    uint64_t v21 = v16 & 0xFFFFFFFFFFFFLL;
    if ((v19 & 0x2000000000000000) != 0) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v16 & 0xFFFFFFFFFFFFLL;
    }
    if (v22)
    {
      if ((v19 & 0x1000000000000000) == 0)
      {
        if ((v19 & 0x2000000000000000) == 0)
        {
          if ((v16 & 0x1000000000000000) != 0) {
            uint64_t v23 = (unsigned __int8 *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            uint64_t v23 = (unsigned __int8 *)sub_1A916B6D0();
          }
          unint64_t v24 = sub_1A9134FF0(v23, v21, 10);
          if ((v25 & 1) == 0)
          {
            uint64_t v26 = (uint64_t)v24;
LABEL_50:
            sub_1A90B07D4(v15, v14);
            swift_bridgeObjectRelease();
            *(void *)a1 = v26;
            *(unsigned char *)(a1 + 8) = 0;
            return;
          }
          goto LABEL_68;
        }
        v61[0] = v16;
        v61[1] = v19 & 0xFFFFFFFFFFFFFFLL;
        if (v16 == 43)
        {
          if (!v20) {
            goto LABEL_75;
          }
          if (v20 == 1) {
            goto LABEL_73;
          }
          if ((BYTE1(v16) - 48) > 9u) {
            goto LABEL_46;
          }
          uint64_t v26 = (BYTE1(v16) - 48);
          if (v20 != 2)
          {
            if ((BYTE2(v16) - 48) > 9u) {
              goto LABEL_46;
            }
            uint64_t v26 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
            uint64_t v38 = v20 - 3;
            if (v20 != 3)
            {
              unint64_t v39 = (unsigned __int8 *)v61 + 3;
              while (1)
              {
                unsigned int v40 = *v39 - 48;
                if (v40 > 9) {
                  goto LABEL_46;
                }
                uint64_t v41 = 10 * v26;
                if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                  goto LABEL_46;
                }
                uint64_t v26 = v41 + v40;
                if (__OFADD__(v41, v40)) {
                  goto LABEL_46;
                }
                LOBYTE(v20) = 0;
                ++v39;
                if (!--v38) {
                  goto LABEL_49;
                }
              }
            }
          }
        }
        else
        {
          if (v16 == 45)
          {
            if (v20)
            {
              if (v20 != 1)
              {
                if ((BYTE1(v16) - 48) > 9u) {
                  goto LABEL_46;
                }
                if (v20 == 2)
                {
                  LOBYTE(v20) = 0;
                  uint64_t v26 = -(uint64_t)(BYTE1(v16) - 48);
                  goto LABEL_49;
                }
                if ((BYTE2(v16) - 48) > 9u) {
                  goto LABEL_46;
                }
                uint64_t v26 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
                uint64_t v46 = v20 - 3;
                if (v20 != 3)
                {
                  uint64_t v47 = (unsigned __int8 *)v61 + 3;
                  while (1)
                  {
                    unsigned int v48 = *v47 - 48;
                    if (v48 > 9) {
                      goto LABEL_46;
                    }
                    uint64_t v49 = 10 * v26;
                    if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                      goto LABEL_46;
                    }
                    uint64_t v26 = v49 - v48;
                    if (__OFSUB__(v49, v48)) {
                      goto LABEL_46;
                    }
                    LOBYTE(v20) = 0;
                    ++v47;
                    if (!--v46) {
                      goto LABEL_49;
                    }
                  }
                }
                goto LABEL_48;
              }
LABEL_73:
              uint64_t v26 = 0;
LABEL_49:
              if ((v20 & 1) == 0) {
                goto LABEL_50;
              }
              goto LABEL_68;
            }
            __break(1u);
LABEL_75:
            __break(1u);
            return;
          }
          if (!v20 || (v16 - 48) > 9u)
          {
LABEL_46:
            uint64_t v26 = 0;
            LOBYTE(v20) = 1;
            goto LABEL_49;
          }
          uint64_t v26 = (v16 - 48);
          if (v20 != 1)
          {
            if ((BYTE1(v16) - 48) > 9u) {
              goto LABEL_46;
            }
            uint64_t v26 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
            uint64_t v42 = v20 - 2;
            if (v20 != 2)
            {
              uint64_t v43 = (unsigned __int8 *)v61 + 2;
              while (1)
              {
                unsigned int v44 = *v43 - 48;
                if (v44 > 9) {
                  goto LABEL_46;
                }
                uint64_t v45 = 10 * v26;
                if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                  goto LABEL_46;
                }
                uint64_t v26 = v45 + v44;
                if (__OFADD__(v45, v44)) {
                  goto LABEL_46;
                }
                LOBYTE(v20) = 0;
                ++v43;
                if (!--v42) {
                  goto LABEL_49;
                }
              }
            }
          }
        }
LABEL_48:
        LOBYTE(v20) = 0;
        goto LABEL_49;
      }
      swift_bridgeObjectRetain();
      uint64_t v26 = (uint64_t)sub_1A9134F08(v18, v19, 10);
      char v51 = v50;
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0) {
        goto LABEL_50;
      }
    }
LABEL_68:
    uint64_t v59 = v18;
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v52 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_1A916E200;
    uint64_t v54 = sub_1A916AA90();
    uint64_t v56 = v55;
    uint64_t v57 = MEMORY[0x1E4FBB1A0];
    *(void *)(v53 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v58 = sub_1A90A67C0();
    *(void *)(v53 + 32) = v54;
    *(void *)(v53 + 40) = v56;
    *(void *)(v53 + 96) = v57;
    *(void *)(v53 + 104) = v58;
    *(void *)(v53 + 64) = v58;
    *(void *)(v53 + 72) = v59;
    *(void *)(v53 + 80) = v19;
    sub_1A916AD30();
    sub_1A90B07D4(v15, v14);

LABEL_71:
    swift_bridgeObjectRelease();
    *(void *)a1 = 1;
    *(unsigned char *)(a1 + 8) = 1;
    return;
  }
  BOOL v62 = v1;
  id v6 = v1;
  sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
  if (swift_dynamicCast())
  {
    if (!v61[2])
    {

      *(void *)a1 = 0;
      *(unsigned char *)(a1 + 8) = 1;
      return;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v60 = a1;
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  id v7 = (id)qword_1EB689AA0;
  sub_1A916B3B0();
  sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1A916E200;
  uint64_t v9 = sub_1A916AA90();
  uint64_t v11 = v10;
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = sub_1A90A67C0();
  *(void *)(v8 + 64) = v13;
  *(void *)(v8 + 32) = v9;
  *(void *)(v8 + 40) = v11;
  v61[0] = 0;
  BOOL v62 = v1;
  sub_1A916B780();
  *(void *)(v8 + 96) = v12;
  *(void *)(v8 + 104) = v13;
  *(void *)(v8 + 72) = LOBYTE(v61[0]);
  *(void *)(v8 + 80) = 0xE000000000000000;
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  *(void *)uint64_t v60 = 1;
  *(unsigned char *)(v60 + 8) = 1;
}

uint64_t sub_1A9131078()
{
  uint64_t v0 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v1 = sub_1A9131484();
  uint64_t v2 = sub_1A9147004(0xD00000000000003ELL, 0x80000001A9179520, v1);
  unint64_t v4 = v3;
  if (v3 >> 60 == 15) {
    return sub_1A90CF398();
  }
  uint64_t v6 = (uint64_t)v2;
  sub_1A916AFC0();
  uint64_t v7 = sub_1A916AFA0();
  if (!v8)
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A916E200;
    uint64_t v11 = sub_1A916AA90();
    uint64_t v13 = v12;
    uint64_t v14 = MEMORY[0x1E4FBB1A0];
    *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v15 = sub_1A90A67C0();
    *(void *)(v10 + 64) = v15;
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    uint64_t v16 = (void *)sub_1A916AB60();
    id v17 = objc_msgSend(v16, sel_description);

    uint64_t v18 = sub_1A916AF90();
    uint64_t v20 = v19;

    *(void *)(v10 + 96) = v14;
    *(void *)(v10 + 104) = v15;
    *(void *)(v10 + 72) = v18;
    *(void *)(v10 + 80) = v20;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    uint64_t v7 = sub_1A90CF398();
  }
  uint64_t v5 = v7;
  sub_1A90B07D4(v6, v4);
  return v5;
}

uint64_t sub_1A9131484()
{
  unint64_t v0 = sub_1A90CF398();
  unint64_t v2 = sub_1A912EF74(v0, v1);
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  switch(v3 >> 62)
  {
    case 1uLL:
      unint64_t v7 = HIDWORD(v2);
      sub_1A90A2FD4(v2, v3);
      LODWORD(v6) = v7 - v4;
      if (__OFSUB__(v7, v4))
      {
        __break(1u);
LABEL_11:
        __break(1u);
        JUMPOUT(0x1A9131558);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_8:
        sub_1A90A2FD4(v4, v5);
        uint64_t v6 = 0;
      }
      return 2 * v6;
    case 2uLL:
      uint64_t v9 = *(void *)(v2 + 16);
      uint64_t v8 = *(void *)(v2 + 24);
      sub_1A90A2FD4(v2, v3);
      uint64_t v6 = v8 - v9;
      if (!__OFSUB__(v8, v9)) {
        goto LABEL_6;
      }
      goto LABEL_11;
    case 3uLL:
      goto LABEL_8;
    default:
      sub_1A90A2FD4(v2, v3);
      uint64_t v6 = BYTE6(v5);
      goto LABEL_6;
  }
}

uint64_t sub_1A9131568(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1A9147004(0xD000000000000039, 0x80000001A91793A0, 8);
  unint64_t v6 = v5;
  if (v5 >> 60 == 15) {
    return a2;
  }
  uint64_t v7 = (uint64_t)v4;
  sub_1A916AFC0();
  uint64_t result = sub_1A916AFA0();
  if (!v9)
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v18 = (id)qword_1EB689AA0;
    LODWORD(v59) = sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1A916E200;
    uint64_t v20 = sub_1A916AA90();
    uint64_t v22 = v21;
    uint64_t v23 = MEMORY[0x1E4FBB1A0];
    *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v24 = sub_1A90A67C0();
    *(void *)(v19 + 64) = v24;
    *(void *)(v19 + 32) = v20;
    *(void *)(v19 + 40) = v22;
    char v25 = (void *)sub_1A916AB60();
    id v26 = objc_msgSend(v25, sel_description, v59);

    uint64_t v27 = sub_1A916AF90();
    uint64_t v29 = v28;

    *(void *)(v19 + 96) = v23;
    *(void *)(v19 + 104) = v24;
    *(void *)(v19 + 72) = v27;
    *(void *)(v19 + 80) = v29;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    uint64_t v30 = v7;
    goto LABEL_64;
  }
  uint64_t v10 = result;
  uint64_t v11 = v9;
  uint64_t v12 = HIBYTE(v9) & 0xF;
  uint64_t v13 = result & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x2000000000000000) != 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v14) {
    goto LABEL_61;
  }
  if ((v11 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_1A9134F08(v10, v11, 10);
    char v48 = v47;
    swift_bridgeObjectRelease();
    if ((v48 & 1) == 0)
    {
      unint64_t v35 = sub_1A90D1B58((unint64_t)v46);
      if ((v49 & 1) == 0) {
        goto LABEL_42;
      }
    }
    goto LABEL_61;
  }
  if ((v11 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      unint64_t v15 = (unsigned __int8 *)((v11 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unint64_t v15 = (unsigned __int8 *)sub_1A916B6D0();
    }
    int64_t v16 = (int64_t)sub_1A9134FF0(v15, v13, 10);
    if ((v17 & 1) == 0)
    {
LABEL_41:
      unint64_t v35 = sub_1A90D1B58(v16);
      if ((v36 & 1) == 0)
      {
LABEL_42:
        unint64_t v37 = v35;
        swift_bridgeObjectRelease();
        sub_1A90B07D4(v7, v6);
        return v37;
      }
    }
LABEL_61:
    uint64_t v60 = v7;
    uint64_t v50 = v11;
    uint64_t v51 = v10;
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v52 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_1A916E200;
    uint64_t v54 = sub_1A916AA90();
    uint64_t v56 = v55;
    uint64_t v57 = MEMORY[0x1E4FBB1A0];
    *(void *)(v53 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v58 = sub_1A90A67C0();
    *(void *)(v53 + 32) = v54;
    *(void *)(v53 + 40) = v56;
    *(void *)(v53 + 96) = v57;
    *(void *)(v53 + 104) = v58;
    *(void *)(v53 + 64) = v58;
    *(void *)(v53 + 72) = v51;
    *(void *)(v53 + 80) = v50;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    uint64_t v30 = v60;
LABEL_64:
    sub_1A90B07D4(v30, v6);
    return a2;
  }
  v61[0] = result;
  v61[1] = v11 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v12) {
      goto LABEL_69;
    }
    if (v12 == 1) {
      goto LABEL_67;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      int64_t v16 = (BYTE1(result) - 48);
      if (v12 == 2) {
        goto LABEL_39;
      }
      if ((BYTE2(v10) - 48) <= 9u)
      {
        int64_t v16 = 10 * v16 + (BYTE2(v10) - 48);
        uint64_t v31 = v12 - 3;
        if (v12 != 3)
        {
          unint64_t v32 = (unsigned __int8 *)v61 + 3;
          while (1)
          {
            unsigned int v33 = *v32 - 48;
            if (v33 > 9) {
              goto LABEL_37;
            }
            uint64_t v34 = 10 * v16;
            if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
              goto LABEL_37;
            }
            int64_t v16 = v34 + v33;
            if (__OFADD__(v34, v33)) {
              goto LABEL_37;
            }
            LOBYTE(v12) = 0;
            ++v32;
            if (!--v31) {
              goto LABEL_40;
            }
          }
        }
        goto LABEL_39;
      }
    }
LABEL_37:
    int64_t v16 = 0;
    LOBYTE(v12) = 1;
    goto LABEL_40;
  }
  if (result != 45)
  {
    if (!v12 || (result - 48) > 9u) {
      goto LABEL_37;
    }
    int64_t v16 = (result - 48);
    if (v12 == 1)
    {
LABEL_39:
      LOBYTE(v12) = 0;
      goto LABEL_40;
    }
    if ((BYTE1(v10) - 48) <= 9u)
    {
      int64_t v16 = 10 * v16 + (BYTE1(v10) - 48);
      uint64_t v38 = v12 - 2;
      if (v12 != 2)
      {
        unint64_t v39 = (unsigned __int8 *)v61 + 2;
        while (1)
        {
          unsigned int v40 = *v39 - 48;
          if (v40 > 9) {
            goto LABEL_37;
          }
          uint64_t v41 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
            goto LABEL_37;
          }
          int64_t v16 = v41 + v40;
          if (__OFADD__(v41, v40)) {
            goto LABEL_37;
          }
          LOBYTE(v12) = 0;
          ++v39;
          if (!--v38) {
            goto LABEL_40;
          }
        }
      }
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  if (v12)
  {
    if (v12 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_37;
      }
      if (v12 == 2)
      {
        LOBYTE(v12) = 0;
        int64_t v16 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_40;
      }
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_37;
      }
      int64_t v16 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
      uint64_t v42 = v12 - 3;
      if (v12 != 3)
      {
        uint64_t v43 = (unsigned __int8 *)v61 + 3;
        while (1)
        {
          unsigned int v44 = *v43 - 48;
          if (v44 > 9) {
            goto LABEL_37;
          }
          uint64_t v45 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
            goto LABEL_37;
          }
          int64_t v16 = v45 - v44;
          if (__OFSUB__(v45, v44)) {
            goto LABEL_37;
          }
          LOBYTE(v12) = 0;
          ++v43;
          if (!--v42) {
            goto LABEL_40;
          }
        }
      }
      goto LABEL_39;
    }
LABEL_67:
    int64_t v16 = 0;
LABEL_40:
    if ((v12 & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_61;
  }
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t sub_1A9131D14()
{
  uint64_t v0 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v0 - 8);
  unint64_t v1 = sub_1A9147004(0xD000000000000037, 0x80000001A91792A0, 512);
  unint64_t v3 = v2;
  if (v2 >> 60 == 15) {
    return 0;
  }
  uint64_t v5 = (uint64_t)v1;
  sub_1A916AFC0();
  uint64_t v4 = sub_1A916AFA0();
  if (v6)
  {
    sub_1A90B07D4(v5, v3);
  }
  else
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v7 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1A916E200;
    uint64_t v9 = sub_1A916AA90();
    uint64_t v11 = v10;
    uint64_t v12 = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v13 = sub_1A90A67C0();
    *(void *)(v8 + 64) = v13;
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    uint64_t v14 = (void *)sub_1A916AB60();
    id v15 = objc_msgSend(v14, sel_description);

    uint64_t v16 = sub_1A916AF90();
    uint64_t v18 = v17;

    *(void *)(v8 + 96) = v12;
    *(void *)(v8 + 104) = v13;
    *(void *)(v8 + 72) = v16;
    *(void *)(v8 + 80) = v18;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    sub_1A90B07D4(v5, v3);
  }
  return v4;
}

uint64_t sub_1A9132108@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1A916AC90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AC80();
  sub_1A916AC50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1A916B290();
  swift_bridgeObjectRelease();
  id v7 = sub_1A9147004(0xD00000000000003FLL, 0x80000001A91796E0, 16);
  unint64_t v9 = v8;
  if (v8 >> 60 == 15)
  {
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v22 = a1;
    uint64_t v23 = 1;
    goto LABEL_11;
  }
  uint64_t v10 = (uint64_t)v7;
  sub_1A916AFC0();
  uint64_t v11 = sub_1A916AFA0();
  if (!v12)
  {
    uint64_t v51 = v3;
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v25 = (id)qword_1EB689AA0;
    LODWORD(v50) = sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1A916E200;
    uint64_t v27 = sub_1A916AA90();
    uint64_t v29 = v28;
    *(void *)(v26 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v30 = sub_1A90A67C0();
    *(void *)(v26 + 64) = v30;
    *(void *)(v26 + 32) = v27;
    *(void *)(v26 + 40) = v29;
    uint64_t v31 = (void *)sub_1A916AB60();
    id v32 = objc_msgSend(v31, sel_description);

    uint64_t v33 = sub_1A916AF90();
    uint64_t v35 = v34;

    *(void *)(v26 + 96) = MEMORY[0x1E4FBB1A0];
    *(void *)(v26 + 104) = v30;
    *(void *)(v26 + 72) = v33;
    *(void *)(v26 + 80) = v35;
    sub_1A916AD30();
    sub_1A90B07D4(v10, v9);

    goto LABEL_22;
  }
  uint64_t v13 = v12;
  uint64_t v55 = 0;
  MEMORY[0x1F4188790](v11);
  *(&v48 - 2) = (uint64_t)&v55;
  uint64_t v50 = v14;
  if ((v13 & 0x1000000000000000) != 0 || !(v13 & 0x2000000000000000 | v14 & 0x1000000000000000))
  {
    uint64_t v51 = v15;
    swift_bridgeObjectRetain();
    sub_1A916B670();
    swift_bridgeObjectRelease();
    if ((v52 & 1) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    *(&v48 - 2) = (uint64_t)sub_1A91399B4;
    *(&v48 - 1) = (uint64_t)(&v48 - 4);
    if ((v13 & 0x2000000000000000) == 0)
    {
      uint64_t v51 = v17;
      uint64_t v49 = v18;
      if ((v16 & 0x1000000000000000) != 0)
      {
        uint64_t v48 = (v13 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v19 = v16 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v48 = sub_1A916B6D0();
        uint64_t v19 = v47;
      }
      swift_bridgeObjectRetain();
      char v20 = sub_1A91353AC(v48, v19, (void (*)(uint64_t *__return_ptr))sub_1A91399CC);
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
    uint64_t v53 = v16;
    uint64_t v54 = v13 & 0xFFFFFFFFFFFFFFLL;
    if (v16 <= 0x20u && ((1 << v16) & 0x100003E01) != 0)
    {
      swift_bridgeObjectRetain();
LABEL_18:
      swift_bridgeObjectRelease();
LABEL_19:
      uint64_t v51 = v3;
      if (qword_1EB68ACE8 != -1) {
        swift_once();
      }
      id v36 = (id)qword_1EB689AA0;
      LODWORD(v49) = sub_1A916B3B0();
      sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_1A916E200;
      uint64_t v38 = sub_1A916AA90();
      uint64_t v40 = v39;
      uint64_t v41 = MEMORY[0x1E4FBB1A0];
      *(void *)(v37 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v42 = sub_1A90A67C0();
      *(void *)(v37 + 32) = v38;
      *(void *)(v37 + 40) = v40;
      *(void *)(v37 + 96) = v41;
      *(void *)(v37 + 104) = v42;
      uint64_t v43 = v50;
      *(void *)(v37 + 64) = v42;
      *(void *)(v37 + 72) = v43;
      *(void *)(v37 + 80) = v13;
      sub_1A916AD30();
      sub_1A90B07D4(v10, v9);

LABEL_22:
      swift_bridgeObjectRelease();
      uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
      uint64_t v22 = a1;
      uint64_t v23 = 1;
      uint64_t v24 = v51;
      return v21(v22, v23, 1, v24);
    }
    swift_bridgeObjectRetain();
    uint64_t v45 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
    if (!v45) {
      goto LABEL_18;
    }
    int v46 = *v45;
    swift_bridgeObjectRelease();
    if (v46) {
      goto LABEL_19;
    }
  }
LABEL_9:
  swift_bridgeObjectRelease();
  sub_1A916AC40();
  sub_1A90B07D4(v10, v9);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v22 = a1;
  uint64_t v23 = 0;
LABEL_11:
  uint64_t v24 = v3;
  return v21(v22, v23, 1, v24);
}

uint64_t sub_1A9132940()
{
  uint64_t v0 = sub_1A916AFD0();
  MEMORY[0x1F4188790](v0 - 8);
  unint64_t v1 = sub_1A9147004(0xD00000000000003FLL, 0x80000001A91791A0, 512);
  unint64_t v3 = v2;
  if (v2 >> 60 == 15) {
    return 0;
  }
  uint64_t v5 = (uint64_t)v1;
  sub_1A916AFC0();
  uint64_t v4 = sub_1A916AFA0();
  if (v6)
  {
    sub_1A90B07D4(v5, v3);
  }
  else
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v7 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1A916E200;
    uint64_t v9 = sub_1A916AA90();
    uint64_t v11 = v10;
    uint64_t v12 = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v13 = sub_1A90A67C0();
    *(void *)(v8 + 64) = v13;
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    uint64_t v14 = (void *)sub_1A916AB60();
    id v15 = objc_msgSend(v14, sel_description);

    uint64_t v16 = sub_1A916AF90();
    uint64_t v18 = v17;

    *(void *)(v8 + 96) = v12;
    *(void *)(v8 + 104) = v13;
    *(void *)(v8 + 72) = v16;
    *(void *)(v8 + 80) = v18;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    sub_1A90B07D4(v5, v3);
  }
  return v4;
}

uint64_t sub_1A9132D34@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t result = (uint64_t)sub_1A9147004(0xD00000000000003DLL, 0x80000001A91797E0, 512);
  unint64_t v5 = v4;
  if (v4 >> 60 == 15)
  {
    *a1 = xmmword_1A9170040;
    return result;
  }
  uint64_t v6 = result;
  uint64_t v59 = a1;
  switch(v4 >> 62)
  {
    case 1uLL:
      unint64_t v9 = result >> 32;
      if (result >> 32 < (int)result)
      {
        __break(1u);
LABEL_61:
        swift_once();
        goto LABEL_56;
      }
      sub_1A90D1784(result, v4);
      swift_retain();
      uint64_t v10 = sub_1A91340B8((int)v6, v6 >> 32, v5 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1A913563C);
      uint64_t v12 = v11;
      sub_1A90B07D4(v6, v5);
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_9;
    case 2uLL:
      uint64_t v13 = *(void *)(result + 16);
      uint64_t v14 = *(void *)(result + 24);
      sub_1A91399E4(result, v4);
      swift_retain();
      swift_retain();
      uint64_t v10 = sub_1A91340B8(v13, v14, v5 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1A913563C);
      uint64_t v12 = v15;
      swift_release();
      swift_release();
      if (v12) {
        goto LABEL_17;
      }
LABEL_9:
      uint64_t v64 = v6;
      unint64_t v65 = v5;
      sub_1A90D1784(v6, v5);
      sub_1A908E870(0, &qword_1E97B1A68);
      if (swift_dynamicCast())
      {
        sub_1A908EC8C(&v61, (uint64_t)&v66);
        __swift_project_boxed_opaque_existential_1(&v66, v68);
        if (sub_1A916B850())
        {
          __swift_project_boxed_opaque_existential_1(&v66, v68);
          sub_1A916B840();
          sub_1A90B07D4(v6, v5);
          uint64_t v12 = *((void *)&v61 + 1);
          uint64_t v10 = v61;
          uint64_t v16 = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
          goto LABEL_18;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
      }
      else
      {
        uint64_t v63 = 0;
        long long v61 = 0u;
        long long v62 = 0u;
        sub_1A91399F8((uint64_t)&v61, &qword_1E97B1A70, &qword_1E97B1A68, MEMORY[0x1E4FBBD70]);
      }
      uint64_t v7 = sub_1A913526C(v6, v5);
LABEL_16:
      uint64_t v10 = v7;
      uint64_t v12 = v8;
LABEL_17:
      uint64_t v16 = sub_1A90B07D4(v6, v5);
LABEL_18:
      *(void *)&long long v61 = 0;
      MEMORY[0x1F4188790](v16);
      if ((v12 & 0x1000000000000000) != 0 || !(v12 & 0x2000000000000000 | v10 & 0x1000000000000000))
      {
        sub_1A916B670();
LABEL_24:
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      MEMORY[0x1F4188790](v17);
      if ((v12 & 0x2000000000000000) == 0)
      {
        if ((v10 & 0x1000000000000000) != 0)
        {
          uint64_t v18 = (v12 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v19 = v10 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v18 = sub_1A916B6D0();
        }
        LOBYTE(v64) = sub_1A91353AC(v18, v19, (void (*)(uint64_t *__return_ptr))sub_1A91399CC) & 1;
        goto LABEL_24;
      }
      uint64_t v66 = v10;
      uint64_t v67 = v12 & 0xFFFFFFFFFFFFFFLL;
      BOOL v21 = (v10 > 0x20u || ((0x100003E01uLL >> v10) & 1) == 0)
         && (char v20 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v20 == 0;
      LOBYTE(v64) = v21;
      swift_bridgeObjectRelease();
LABEL_31:
      if ((v64 & 1) == 0)
      {
        if (qword_1EB68ACE8 != -1) {
          swift_once();
        }
        id v25 = (id)qword_1EB689AA0;
        sub_1A916B3B0();
        sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
        uint64_t v26 = swift_allocObject();
        *(_OWORD *)(v26 + 16) = xmmword_1A916E200;
        uint64_t v27 = sub_1A916AA90();
        uint64_t v29 = v28;
        uint64_t v30 = MEMORY[0x1E4FBB1A0];
        *(void *)(v26 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v31 = sub_1A90A67C0();
        *(void *)(v26 + 64) = v31;
        *(void *)(v26 + 32) = v27;
        *(void *)(v26 + 40) = v29;
        id v32 = (void *)sub_1A916AB60();
        id v33 = objc_msgSend(v32, sel_description);

        uint64_t v34 = sub_1A916AF90();
        uint64_t v36 = v35;

        *(void *)(v26 + 96) = v30;
        *(void *)(v26 + 104) = v31;
        *(void *)(v26 + 72) = v34;
        *(void *)(v26 + 80) = v36;
        sub_1A916AD30();
        sub_1A90B07D4(v6, v5);

LABEL_36:
        uint64_t result = swift_bridgeObjectRelease();
        *uint64_t v59 = xmmword_1A9170040;
        return result;
      }
      uint64_t v22 = v61;
      uint64_t v23 = (uint64_t)sub_1A9147004(0xD000000000000042, 0x80000001A9179880, 512);
      unint64_t v9 = v24;
      uint64_t v37 = v59;
      if (v24 >> 60 != 15)
      {
        uint64_t v1 = v23;
        switch(v24 >> 62)
        {
          case 1uLL:
            uint64_t v58 = v22;
            if (v23 >> 32 < (int)v23) {
              __break(1u);
            }
            sub_1A90D1784(v23, v24);
            swift_retain();
            uint64_t v40 = sub_1A91340B8((int)v1, v1 >> 32, v9 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1A913563C);
            unint64_t v42 = v41;
            sub_1A90B07D4(v1, v9);
            goto LABEL_44;
          case 2uLL:
            uint64_t v58 = v22;
            uint64_t v43 = *(void *)(v23 + 16);
            uint64_t v44 = *(void *)(v23 + 24);
            sub_1A91399E4(v23, v24);
            swift_retain();
            swift_retain();
            uint64_t v40 = sub_1A91340B8(v43, v44, v9 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1A913563C);
            unint64_t v42 = v45;
            swift_release();
            swift_release();
LABEL_44:
            uint64_t v22 = v58;
            uint64_t v37 = v59;
            if (v42) {
              goto LABEL_53;
            }
            uint64_t v64 = v1;
            unint64_t v65 = v9;
            sub_1A90D1784(v1, v9);
            sub_1A908E870(0, &qword_1E97B1A68);
            if (swift_dynamicCast())
            {
              sub_1A908EC8C(&v61, (uint64_t)&v66);
              __swift_project_boxed_opaque_existential_1(&v66, v68);
              if (sub_1A916B850())
              {
                __swift_project_boxed_opaque_existential_1(&v66, v68);
                sub_1A916B840();
                sub_1A90B07D4(v1, v9);
                unint64_t v42 = (void *)*((void *)&v61 + 1);
                uint64_t v40 = v61;
                __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
                uint64_t v37 = v59;
                goto LABEL_54;
              }
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
              uint64_t v37 = v59;
            }
            else
            {
              uint64_t v63 = 0;
              long long v61 = 0u;
              long long v62 = 0u;
              sub_1A91399F8((uint64_t)&v61, &qword_1E97B1A70, &qword_1E97B1A68, MEMORY[0x1E4FBBD70]);
            }
            uint64_t v38 = sub_1A913526C(v1, v9);
LABEL_52:
            uint64_t v40 = v38;
            unint64_t v42 = v39;
LABEL_53:
            sub_1A90B07D4(v1, v9);
LABEL_54:
            v46._countAndFlagsBits = v40;
            v46._object = v42;
            TimestampGranularity.init(rawValue:)(v46);
            if (v60 != 5)
            {
              sub_1A90B07D4(v6, v5);
              uint64_t result = sub_1A90B07D4(v1, v9);
              *uint64_t v37 = v60;
              v37[1] = v22;
              return result;
            }
            if (qword_1EB68ACE8 != -1) {
              goto LABEL_61;
            }
            break;
          case 3uLL:
            *(void *)((char *)&v61 + 6) = 0;
            *(void *)&long long v61 = 0;
            sub_1A913563C(&v66);
            sub_1A90B07D4(v1, v9);
            uint64_t v40 = v66;
            unint64_t v42 = (void *)v67;
            goto LABEL_54;
          default:
            uint64_t v66 = v23;
            LOWORD(v67) = v24;
            BYTE2(v67) = BYTE2(v24);
            BYTE3(v67) = BYTE3(v24);
            BYTE4(v67) = BYTE4(v24);
            BYTE5(v67) = BYTE5(v24);
            uint64_t v38 = sub_1A916B010();
            goto LABEL_52;
        }
LABEL_56:
        id v47 = (id)qword_1EB689AA0;
        LODWORD(v58) = sub_1A916B3B0();
        sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
        uint64_t v48 = swift_allocObject();
        *(_OWORD *)(v48 + 16) = xmmword_1A916E200;
        uint64_t v49 = sub_1A916AA90();
        uint64_t v51 = v50;
        *(void *)(v48 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v52 = sub_1A90A67C0();
        *(void *)(v48 + 64) = v52;
        *(void *)(v48 + 32) = v49;
        *(void *)(v48 + 40) = v51;
        uint64_t v53 = (void *)sub_1A916AB60();
        id v54 = objc_msgSend(v53, sel_description, v58);

        uint64_t v55 = sub_1A916AF90();
        uint64_t v57 = v56;

        *(void *)(v48 + 96) = MEMORY[0x1E4FBB1A0];
        *(void *)(v48 + 104) = v52;
        *(void *)(v48 + 72) = v55;
        *(void *)(v48 + 80) = v57;
        sub_1A916AD30();
        sub_1A90B07D4(v6, v5);
        sub_1A90B07D4(v1, v9);

        goto LABEL_36;
      }
      uint64_t result = sub_1A90B07D4(v6, v5);
      *uint64_t v59 = xmmword_1A9170040;
      return result;
    case 3uLL:
      *(void *)((char *)&v61 + 6) = 0;
      *(void *)&long long v61 = 0;
      sub_1A913563C(&v66);
      uint64_t v16 = sub_1A90B07D4(v6, v5);
      uint64_t v10 = v66;
      uint64_t v12 = v67;
      goto LABEL_18;
    default:
      uint64_t v66 = result;
      LOWORD(v67) = v4;
      BYTE2(v67) = BYTE2(v4);
      BYTE3(v67) = BYTE3(v4);
      BYTE4(v67) = BYTE4(v4);
      BYTE5(v67) = BYTE5(v4);
      uint64_t v7 = sub_1A916B010();
      goto LABEL_16;
  }
}

void sub_1A9133A5C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

char *sub_1A9133A74(uint64_t a1)
{
  return sub_1A9138228(a1);
}

void sub_1A9133A8C(uint64_t a1)
{
}

void sub_1A9133AA4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1A9133AC0(uint64_t a1)
{
}

void sub_1A9133AD8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, unsigned __int8 *a7)
{
}

uint64_t sub_1A9133AF8(uint64_t a1)
{
  return sub_1A91385B4(a1, &OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_groupName, (uint64_t (*)(uint64_t))sub_1A9131D14);
}

void sub_1A9133B2C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1A9133B50(uint64_t a1)
{
  return sub_1A91385B4(a1, OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_sessionID, (uint64_t (*)(uint64_t))sub_1A9132940);
}

void sub_1A9133B84(uint64_t a1@<X0>, void *a2@<X8>)
{
}

id sub_1A9133B9C(uint64_t a1, char a2)
{
  return sub_1A91389CC(a1, a2);
}

char *sub_1A9133BB4()
{
  return sub_1A91359DC();
}

uint64_t sub_1A9133BCC()
{
  unint64_t v0 = sub_1A916B100();
  uint64_t v4 = sub_1A9133C4C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1A9133C4C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_1A9133DA4(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_1A90DD40C(v9, 0);
      unint64_t v12 = sub_1A9133EA4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1A916B6D0();
LABEL_4:
        JUMPOUT(0x1AD0ED870);
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1AD0ED870](v11 + 4, v11[2]);
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
    return MEMORY[0x1AD0ED870]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1A9133DA4(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_1A90DD494(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_1A90DD494(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return sub_1A916B0A0();
}

unint64_t sub_1A9133EA4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    *uint64_t v9 = a4;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1A90DD494(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1A916B0B0();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1A916B6D0();
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
    uint64_t result = sub_1A90DD494(v12, a6, a7);
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
    unint64_t v12 = sub_1A916B080();
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

uint64_t sub_1A91340B8(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_1A916A870();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_1A916A8A0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_1A916A890();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_1A913540C(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

char *sub_1A9134168(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  unint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_1A9171EA0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
      if (v11 < (int)v4) {
        goto LABEL_18;
      }
      if (sub_1A916A870() && __OFSUB__((int)v4, sub_1A916A8A0())) {
        goto LABEL_19;
      }
      sub_1A916A8C0();
      swift_allocObject();
      uint64_t v13 = sub_1A916A850();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_14:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
      }
      uint64_t result = sub_1A9134A88((int)v4, v11, a1);
      uint64_t *v5 = v4;
      v5[1] = v9 | 0x4000000000000000;
      return result;
    case 2uLL:
      *(void *)&long long v15 = *v1;
      *((void *)&v15 + 1) = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1A916AAE0();
      uint64_t v12 = *((void *)&v15 + 1);
      uint64_t result = sub_1A9134A88(*(void *)(v15 + 16), *(void *)(v15 + 24), a1);
      uint64_t *v5 = v15;
      v5[1] = v12 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&v15 + 7) = 0;
      *(void *)&long long v15 = 0;
      uint64_t result = (char *)a1((uint64_t *)&v14, (char *)&v15, (char *)&v15);
      if (!v2) {
        return v14;
      }
      return result;
    default:
      *(void *)&long long v15 = *v1;
      WORD4(v15) = v3;
      BYTE10(v15) = BYTE2(v3);
      BYTE11(v15) = BYTE3(v3);
      BYTE12(v15) = BYTE4(v3);
      BYTE13(v15) = BYTE5(v3);
      BYTE14(v15) = BYTE6(v3);
      uint64_t result = (char *)a1((uint64_t *)&v14, (char *)&v15, (char *)&v15 + BYTE6(v3));
      if (!v2) {
        uint64_t result = v14;
      }
      unint64_t v8 = DWORD2(v15) | ((unint64_t)BYTE12(v15) << 32) | ((unint64_t)BYTE13(v15) << 40) | ((unint64_t)BYTE14(v15) << 48);
      *unint64_t v1 = v15;
      v1[1] = v8;
      return result;
  }
}

char *sub_1A9134454(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  unint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_1A9171EA0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1A916A870() && __OFSUB__((int)v4, sub_1A916A8A0())) {
        goto LABEL_24;
      }
      sub_1A916A8C0();
      swift_allocObject();
      uint64_t v13 = sub_1A916A850();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_1A9134B38((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1A916AAE0();
      uint64_t result = sub_1A9134B38(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *unint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *unint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *unint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

char *sub_1A9134758@<X0>(void *(*a1)(long long *__return_ptr, char *, char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *v2;
  unint64_t v5 = v2[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v20 = a2;
      uint64_t v10 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v2 = xmmword_1A9171EA0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_15;
      }
      if (v12 < (int)v6) {
        goto LABEL_20;
      }
      if (sub_1A916A870() && __OFSUB__((int)v6, sub_1A916A8A0())) {
        goto LABEL_21;
      }
      sub_1A916A8C0();
      swift_allocObject();
      uint64_t v19 = sub_1A916A850();
      swift_release();
      uint64_t v10 = v19;
      uint64_t v12 = v6 >> 32;
LABEL_15:
      if (v12 < (int)v6)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
      uint64_t result = sub_1A9134BEC((int)v6, v12, a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v6;
      v2[1] = v10 | 0x4000000000000000;
      a2 = v20;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 2uLL:
      *(void *)&long long v25 = *v2;
      *((void *)&v25 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1A916AAE0();
      long long v13 = v25;
      uint64_t result = sub_1A9134BEC(*(void *)(v25 + 16), *(void *)(v25 + 24), a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v13;
      v2[1] = *((void *)&v13 + 1) | 0x8000000000000000;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 3uLL:
      *(void *)((char *)&v25 + 7) = 0;
      *(void *)&long long v25 = 0;
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25);
      if (v3) {
        return result;
      }
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      goto LABEL_17;
    default:
      *(void *)&long long v25 = *v2;
      WORD4(v25) = v5;
      BYTE10(v25) = BYTE2(v5);
      BYTE11(v25) = BYTE3(v5);
      BYTE12(v25) = BYTE4(v5);
      BYTE13(v25) = BYTE5(v5);
      BYTE14(v25) = BYTE6(v5);
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25 + BYTE6(v5));
      if (v3)
      {
        unint64_t v9 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v9;
      }
      else
      {
        long long v14 = v21;
        uint64_t v15 = v22;
        uint64_t v16 = v23;
        long long v17 = v24;
        unint64_t v18 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v18;
LABEL_17:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        *(void *)(a2 + 24) = v16;
        *(_OWORD *)(a2 + 32) = v17;
      }
      return result;
  }
}

char *sub_1A9134A88(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_1A916A870();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  uint64_t result = (char *)sub_1A916A8A0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_1A916A890();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

char *sub_1A9134B38(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_1A916A870();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  uint64_t result = (char *)sub_1A916A8A0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_1A916A890();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

char *sub_1A9134BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *(*a3)(long long *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = (char *)sub_1A916A870();
  if (!result) {
    goto LABEL_12;
  }
  BOOL v10 = result;
  uint64_t result = (char *)sub_1A916A8A0();
  uint64_t v11 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v14 = sub_1A916A890();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    long long v18 = v22;
    *(_OWORD *)a4 = v19;
    *(void *)(a4 + 16) = v16;
    *(void *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

uint64_t sub_1A9134CB8@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (!__src) {
    goto LABEL_7;
  }
  if (!a2)
  {
    __src = 0;
LABEL_7:
    unint64_t v6 = 0xC000000000000000;
    goto LABEL_10;
  }
  if (a2 <= 14)
  {
    __src = sub_1A90D0A38((unsigned char *)__src, (unsigned char *)(__src + a2));
    unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    sub_1A916A8C0();
    swift_allocObject();
    uint64_t v5 = sub_1A916A860();
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      sub_1A916AB10();
      __src = swift_allocObject();
      *(void *)(__src + 16) = 0;
      *(void *)(__src + 24) = a2;
      unint64_t v6 = v5 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      unint64_t v6 = v5 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v6;
  return __src;
}

unsigned char *sub_1A9134D84@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1A90D0A38(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1A91360D0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1A913614C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1A9134DFC(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

double sub_1A9134E6C@<D0>(void (*a1)(long long *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4) {
      return result;
    }
LABEL_5:
    uint64_t v7 = v11;
    uint64_t v8 = v12;
    double result = *(double *)&v10;
    long long v9 = v13;
    *(_OWORD *)a4 = v10;
    *(void *)(a4 + 16) = v7;
    *(void *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4) {
    goto LABEL_5;
  }
  return result;
}

unsigned __int8 *sub_1A9134EF0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A9134FF0(a1, a2, a3);
}

unsigned __int8 *sub_1A9134F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A916B0F0();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1A9133BCC();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_1A916B6D0();
  }
LABEL_7:
  uint64_t v11 = sub_1A9134FF0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1A9134FF0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  long long v18 = result + 1;
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

uint64_t sub_1A913526C(uint64_t a1, unint64_t a2)
{
  sub_1A90D1784(a1, a2);
  sub_1A9135460(a1, a2);
  sub_1A90A2FD4(a1, a2);
  uint64_t v4 = sub_1A916B010();
  swift_release();
  return v4;
}

uint64_t sub_1A91352E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A916B010();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A9135320@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1A916B690();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A91353AC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
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

void *sub_1A913540C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

void *sub_1A9135460(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A916ABB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unsigned __int8 v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v8 = (void *)MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          sub_1A90A5670(0, &qword_1EB688C50, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBBE00]);
          unsigned __int8 v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_1A90D1784(a1, a2);
        uint64_t v13 = sub_1A916AB00();
        sub_1A90A2FD4(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x1A913562CLL);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1A913563C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A916B010();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A9135674@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_1A9171EB0;
  }
  else
  {
    unint64_t v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v10 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v10 = (void *)sub_1A916B6D0();
    }
    return sub_1A9135730((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_1A9135730@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, void *a6@<X8>)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  unint64_t v15 = a2;
  if (v14 == 4 << v12)
  {
    uint64_t result = sub_1A90DD494(a2, a4, a5);
    unint64_t v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v17 = HIBYTE(a5) & 0xF;
  }
  if (v17 < v15 >> 16) {
    goto LABEL_31;
  }
  uint64_t result = sub_1A916B0A0();
  int64_t v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    uint64_t result = sub_1A90DD494(v9, a4, a5);
    unint64_t v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    uint64_t result = sub_1A90DD494(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    uint64_t result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  unint64_t v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v18 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v18 < v9 >> 16) {
    goto LABEL_29;
  }
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  uint64_t result = sub_1A916B0A0();
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10) {
    uint64_t v20 = v10 + v16;
  }
  else {
    uint64_t v20 = 0;
  }
  return sub_1A9134CB8(v20, v19, a6);
}

double sub_1A91358E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *((void *)a3 + 2);
  uint64_t v6 = *((void *)a3 + 3);
  long long v15 = *a3;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_1A9134E6C((void (*)(long long *__return_ptr, uint64_t, uint64_t))sub_1A9139B38, a1, a2, (uint64_t)&v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  double result = *(double *)&v11;
  long long v10 = v14;
  *(_OWORD *)a4 = v11;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_1A913596C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = sub_1A9133EA4((unint64_t)v9, a1, a2, *a3, a3[1], a3[2], a3[3]);
  uint64_t v6 = v10;
  long long v7 = v9[1];
  *(_OWORD *)a4 = v9[0];
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 32) = v6;
  *(void *)(a4 + 40) = v5;
  return swift_bridgeObjectRetain();
}

char *sub_1A91359DC()
{
  unint64_t v1 = v0;
  sub_1A9135FFC(0, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v47 - v3;
  uint64_t v5 = sub_1A916AAD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  long long v11 = (char *)v47 - v10;
  MEMORY[0x1F4188790](v12);
  long long v14 = (char *)v47 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)v47 - v16;
  double result = (char *)sub_1A90A92C8();
  if (v0) {
    return v1;
  }
  uint64_t v58 = v4;
  long long v61 = v8;
  v47[2] = 0;
  uint64_t v63 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v56 = *((void *)result + 2);
  uint64_t v57 = result;
  if (!v56)
  {
    uint64_t v20 = (uint64_t)v58;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v58, 1, 1, v5);
LABEL_20:
    swift_bridgeObjectRelease();
    sub_1A9136060(v20, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0]);
    id v33 = v63;
    int64_t v34 = *((void *)v63 + 2);
    if (v34)
    {
      uint64_t v63 = (char *)MEMORY[0x1E4FBC860];
      sub_1A90B2820(0, v34, 0);
      uint64_t v36 = *(char ***)(v6 + 16);
      uint64_t v35 = v6 + 16;
      uint64_t v37 = *(unsigned __int8 *)(v35 + 64);
      uint64_t v58 = v33;
      uint64_t v38 = &v33[(v37 + 32) & ~v37];
      uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 56);
      unsigned __int8 v60 = v36;
      uint64_t v62 = v35;
      uint64_t v39 = (void (**)(char *, uint64_t))(v35 - 8);
      do
      {
        uint64_t v40 = v61;
        ((void (*)(char *, char *, uint64_t))v60)(v61, v38, v5);
        uint64_t v41 = sub_1A916AA30();
        uint64_t v43 = v42;
        (*v39)(v40, v5);
        unint64_t v1 = v63;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A90B2820(0, *((void *)v1 + 2) + 1, 1);
          unint64_t v1 = v63;
        }
        unint64_t v45 = *((void *)v1 + 2);
        unint64_t v44 = *((void *)v1 + 3);
        if (v45 >= v44 >> 1)
        {
          sub_1A90B2820(v44 > 1, v45 + 1, 1);
          unint64_t v1 = v63;
        }
        *((void *)v1 + 2) = v45 + 1;
        Swift::String v46 = &v1[16 * v45];
        *((void *)v46 + 4) = v41;
        *((void *)v46 + 5) = v43;
        uint64_t v38 = (char *)v59 + (void)v38;
        --v34;
      }
      while (v34);
      swift_release();
    }
    else
    {
      swift_release();
      return (char *)MEMORY[0x1E4FBC860];
    }
    return v1;
  }
  uint64_t v53 = v14;
  unint64_t v19 = 0;
  uint64_t v54 = v6 + 48;
  uint64_t v55 = v6 + 56;
  unsigned __int8 v60 = (char **)(v6 + 32);
  v47[1] = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  uint64_t v51 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v52 = v6 + 16;
  uint64_t v48 = v11;
  uint64_t v49 = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v20 = (uint64_t)v58;
  uint64_t v62 = v6;
  while (v19 < *((void *)result + 2))
  {
    unint64_t v21 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v22 = *(void *)(v6 + 72);
    unsigned __int8 v23 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 16);
    v23(v20, &result[v21 + v22 * v19], v5);
    uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v50(v20, 0, 1, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v20, 1, v5) == 1) {
      goto LABEL_20;
    }
    uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))*v60;
    v59(v17, v20, v5);
    char v24 = sub_1A916AA20();
    uint64_t v25 = v17;
    unsigned int v26 = v53;
    char v27 = v25;
    ((void (*)(char *))v23)(v53);
    if (v24) {
      goto LABEL_9;
    }
    sub_1A916A9E0();
    if (sub_1A916B0D0())
    {
      swift_bridgeObjectRelease();
LABEL_9:
      uint64_t v28 = *v51;
      (*v51)(v26, v5);
      goto LABEL_10;
    }
    char v29 = sub_1A916B0D0();
    swift_bridgeObjectRelease();
    uint64_t v28 = *v51;
    (*v51)(v26, v5);
    if ((v29 & 1) == 0)
    {
      uint64_t v17 = v27;
      v59(v48, (uint64_t)v27, v5);
      uint64_t v30 = v63;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A90B2840(0, *((void *)v30 + 2) + 1, 1);
        uint64_t v30 = v63;
      }
      unint64_t v32 = *((void *)v30 + 2);
      unint64_t v31 = *((void *)v30 + 3);
      if (v32 >= v31 >> 1)
      {
        sub_1A90B2840(v31 > 1, v32 + 1, 1);
        uint64_t v30 = v63;
      }
      *((void *)v30 + 2) = v32 + 1;
      v59(&v30[v21 + v32 * v22], (uint64_t)v48, v5);
      uint64_t v63 = v30;
      uint64_t v6 = v62;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v17 = v27;
    v28(v27, v5);
LABEL_11:
    ++v19;
    double result = v57;
    uint64_t v20 = (uint64_t)v58;
    if (v56 == v19)
    {
      v50((uint64_t)v58, 1, 1, v5);
      goto LABEL_20;
    }
  }
  __break(1u);
  return result;
}

void sub_1A9135FFC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1A9136060(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1A9135FFC(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1A91360D0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1A916A8C0();
  swift_allocObject();
  uint64_t result = sub_1A916A860();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1A916AB10();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1A913614C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1A916A8C0();
  swift_allocObject();
  uint64_t result = sub_1A916A860();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_1A91361D0(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_1A90D0A38(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_1A91360D0((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1A913614C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1A9136234(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1A916A8C0();
      swift_allocObject();
      sub_1A916A880();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1A916AB10();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_1A91362D4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unsigned __int8 v3 = *((unsigned char *)a2 + 8);
  uint64_t v4 = result + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_state;
  *(void *)uint64_t v4 = *a2;
  *(_WORD *)(v4 + 8) = v3;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = result;
    sub_1A91394E4();
    uint64_t v6 = MEMORY[0x1E4FBB550];
    unint64_t v7 = sub_1A916B5E0();
    uint64_t v9 = sub_1A912EF74(v7, v8);
    unint64_t v11 = v10;
    sub_1A914723C(v9, v10, 0xD00000000000003ELL, 0x80000001A9179BE0);
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v12 = (id)qword_1EB689AA0;
    sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1A916E200;
    uint64_t v14 = MEMORY[0x1E4FBB5C8];
    *(void *)(v13 + 56) = v6;
    *(void *)(v13 + 64) = v14;
    *(void *)(v13 + 32) = v2;
    uint64_t v16 = *(void *)(v5 + 16);
    uint64_t v15 = *(void *)(v5 + 24);
    *(void *)(v13 + 96) = MEMORY[0x1E4FBB1A0];
    *(void *)(v13 + 104) = sub_1A90A67C0();
    *(void *)(v13 + 72) = v16;
    *(void *)(v13 + 80) = v15;
    swift_bridgeObjectRetain();
    sub_1A916AD30();
    sub_1A90A2FD4(v9, v11);

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1A9136600(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle;
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle);
  if (v5)
  {
    uint64_t v18 = 0;
    id v6 = v5;
    unsigned int v7 = objc_msgSend(v6, sel_synchronizeAndReturnError_, &v18);
    unint64_t v8 = (void *)v18;
    if (!v7
      || (uint64_t v18 = 0,
          id v9 = v8,
          unsigned int v10 = objc_msgSend(v6, sel_closeAndReturnError_, &v18),
          unint64_t v8 = (void *)v18,
          !v10))
    {
      id v16 = v8;
      sub_1A916A990();

      swift_willThrow();
      goto LABEL_15;
    }
    unint64_t v11 = *(void **)(a1 + v4);
    *(void *)(a1 + v4) = 0;
    id v12 = v8;
  }
  uint64_t v13 = a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_state;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_state + 9))
  {
    sub_1A913085C((uint64_t)&v18);
    if (v1) {
      goto LABEL_15;
    }
    uint64_t v14 = v18;
    int v15 = v19;
    *(void *)uint64_t v13 = v18;
    *(_WORD *)(v13 + 8) = v15;
  }
  else
  {
    uint64_t v14 = *(void *)v13;
    int v15 = *(unsigned char *)(v13 + 8) & 1;
  }
  if (v15) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    uint64_t v18 = 1;
    unsigned __int8 v19 = 0;
    sub_1A91362D4(a1, &v18);
  }
LABEL_15:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a1 + v3) + 16));
}

void sub_1A91367A0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, unsigned __int8 *a7)
{
  uint64_t v103 = *a7;
  uint64_t v100 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  id v10 = objc_msgSend(self, sel_defaultManager);
  uint64_t v106 = a1;
  sub_1A916AA90();
  unint64_t v11 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_createFileAtPath_contents_attributes_, v11, 0, 0);

  unint64_t v12 = sub_1A90CF398();
  unint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v98 = sub_1A912EF74(v12, v14);
  unint64_t v99 = v15;
  sub_1A914723C(v98, v15, 0xD00000000000003ELL, 0x80000001A9179520);
  id v16 = &unk_1EB68A000;
  if (v7)
  {
    uint64_t v96 = a4;
    swift_bridgeObjectRelease();
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v17 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1A916E200;
    uint64_t v19 = sub_1A916AA90();
    uint64_t v21 = v20;
    uint64_t v22 = MEMORY[0x1E4FBB1A0];
    *(void *)(v18 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v23 = sub_1A90A67C0();
    *(void *)(v18 + 64) = v23;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v21;
    sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
    sub_1A916B780();
    *(void *)(v18 + 96) = v22;
    *(void *)(v18 + 104) = v23;
    *(void *)(v18 + 72) = 0;
    *(void *)(v18 + 80) = 0xE000000000000000;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    id v16 = (void *)&unk_1EB68A000;
    a4 = v96;
  }
  else
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v24 = (id)qword_1EB689AA0;
    sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1A916E200;
    uint64_t v26 = MEMORY[0x1E4FBB1A0];
    *(void *)(v25 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v27 = sub_1A90A67C0();
    *(void *)(v25 + 32) = v12;
    *(void *)(v25 + 40) = v14;
    uint64_t v29 = *(void *)(v106 + 16);
    uint64_t v28 = *(void *)(v106 + 24);
    *(void *)(v25 + 96) = v26;
    *(void *)(v25 + 104) = v27;
    *(void *)(v25 + 64) = v27;
    *(void *)(v25 + 72) = v29;
    *(void *)(v25 + 80) = v28;
    swift_bridgeObjectRetain();
    sub_1A916AD30();

    swift_bridgeObjectRelease();
  }
  sub_1A91394E4();
  unint64_t v30 = sub_1A916B5E0();
  uint64_t v95 = sub_1A912EF74(v30, v31);
  unint64_t v97 = v32;
  sub_1A914723C(v95, v32, 0xD000000000000039, 0x80000001A91793A0);
  if (v16[413] != -1) {
    swift_once();
  }
  id v33 = (id)qword_1EB689AA0;
  sub_1A916B3A0();
  sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1A916E200;
  unint64_t v35 = ContentType.description.getter(a4);
  uint64_t v37 = v36;
  uint64_t v38 = MEMORY[0x1E4FBB1A0];
  *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v39 = sub_1A90A67C0();
  *(void *)(v34 + 32) = v35;
  *(void *)(v34 + 40) = v37;
  uint64_t v41 = *(void *)(v106 + 16);
  uint64_t v40 = *(void *)(v106 + 24);
  *(void *)(v34 + 96) = v38;
  *(void *)(v34 + 104) = v39;
  *(void *)(v34 + 64) = v39;
  *(void *)(v34 + 72) = v41;
  *(void *)(v34 + 80) = v40;
  swift_bridgeObjectRetain();
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  if (a6)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_1A912EF74(a5, a6);
    unint64_t v44 = v43;
    sub_1A914723C(v42, v43, 0xD000000000000037, 0x80000001A91792A0);
    if (v16[413] != -1) {
      swift_once();
    }
    id v45 = (id)qword_1EB689AA0;
    sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_1A916E200;
    uint64_t v47 = MEMORY[0x1E4FBB1A0];
    *(void *)(v46 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v48 = sub_1A90A67C0();
    *(void *)(v46 + 32) = a5;
    *(void *)(v46 + 40) = a6;
    uint64_t v50 = *(void *)(v106 + 16);
    uint64_t v49 = *(void *)(v106 + 24);
    *(void *)(v46 + 96) = v47;
    *(void *)(v46 + 104) = v48;
    *(void *)(v46 + 64) = v48;
    *(void *)(v46 + 72) = v50;
    *(void *)(v46 + 80) = v49;
    swift_bridgeObjectRetain();
    sub_1A916AD30();
    sub_1A90A2FD4(v42, v44);

    swift_bridgeObjectRelease();
  }
  type metadata accessor for Session();
  sub_1A916AC50();
  unint64_t v51 = sub_1A916B290();
  uint64_t v94 = sub_1A912EF74(v51, v52);
  unint64_t v102 = v53;
  sub_1A914723C(v94, v53, 0xD00000000000003FLL, 0x80000001A91796E0);
  if (v16[413] != -1) {
    swift_once();
  }
  id v54 = (id)qword_1EB689AA0;
  sub_1A916B3A0();
  sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_1A916EF60;
  uint64_t v57 = *(void *)(v106 + 16);
  uint64_t v56 = *(void *)(v106 + 24);
  *(void *)(v55 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v55 + 64) = sub_1A90A67C0();
  *(void *)(v55 + 32) = v57;
  *(void *)(v55 + 40) = v56;
  swift_bridgeObjectRetain();
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  unint64_t v58 = *a2;
  unint64_t v59 = a2[1];
  swift_bridgeObjectRetain();
  unint64_t v91 = v58;
  uint64_t v92 = sub_1A912EF74(v58, v59);
  unint64_t v105 = v60;
  sub_1A914723C(v92, v60, 0xD00000000000003FLL, 0x80000001A91791A0);
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  id v61 = (id)qword_1EB689AA0;
  sub_1A916B3A0();
  sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_1A916E200;
  uint64_t v63 = MEMORY[0x1E4FBB1A0];
  *(void *)(v62 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v64 = sub_1A90A67C0();
  *(void *)(v62 + 32) = 0;
  *(void *)(v62 + 40) = v59;
  uint64_t v65 = *(void *)(v106 + 16);
  uint64_t v66 = *(void *)(v106 + 24);
  *(void *)(v62 + 96) = v63;
  *(void *)(v62 + 104) = v64;
  *(void *)(v62 + 64) = v64;
  *(void *)(v62 + 72) = v65;
  *(void *)(v62 + 80) = v66;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  if (v103 == 5)
  {
    sub_1A90A2FD4(v92, v105);
    sub_1A90A2FD4(v94, v102);
    sub_1A90A2FD4(v95, v97);
    uint64_t v67 = v98;
    unint64_t v68 = v99;
  }
  else
  {
    unint64_t v69 = sub_1A916B290();
    uint64_t v71 = sub_1A912EF74(v69, v70);
    unint64_t v73 = v72;
    sub_1A914723C(v71, v72, 0xD00000000000003DLL, 0x80000001A91797E0);
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v74 = (id)qword_1EB689AA0;
    sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = xmmword_1A916E200;
    uint64_t v76 = MEMORY[0x1E4FBB1A0];
    *(void *)(v75 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v77 = sub_1A90A67C0();
    *(void *)(v75 + 32) = v91;
    *(void *)(v75 + 40) = v59;
    uint64_t v78 = *(void *)(v106 + 16);
    uint64_t v79 = *(void *)(v106 + 24);
    *(void *)(v75 + 96) = v76;
    *(void *)(v75 + 104) = v77;
    *(void *)(v75 + 64) = v77;
    *(void *)(v75 + 72) = v78;
    *(void *)(v75 + 80) = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    sub_1A90A2FD4(v71, v73);
    unint64_t v80 = 0xE700000000000000;
    unint64_t v81 = 0x65736963657270;
    switch((int)v103)
    {
      case 1:
        unint64_t v80 = 0xE300000000000000;
        unint64_t v81 = 7954788;
        break;
      case 2:
        unint64_t v80 = 0xE400000000000000;
        unint64_t v81 = 1920298856;
        break;
      case 3:
        unint64_t v80 = 0xE600000000000000;
        unint64_t v81 = 0x6574756E696DLL;
        break;
      case 4:
        unint64_t v80 = 0xE600000000000000;
        unint64_t v81 = 0x72657474696ALL;
        break;
      default:
        break;
    }
    uint64_t v82 = sub_1A912EF74(v81, v80);
    unint64_t v84 = v83;
    sub_1A914723C(v82, v83, 0xD000000000000042, 0x80000001A9179880);
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v85 = (id)qword_1EB689AA0;
    sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v86 = swift_allocObject();
    *(_OWORD *)(v86 + 16) = xmmword_1A916E200;
    uint64_t v87 = MEMORY[0x1E4FBB1A0];
    *(void *)(v86 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v88 = sub_1A90A67C0();
    *(void *)(v86 + 32) = v91;
    *(void *)(v86 + 40) = v59;
    uint64_t v89 = *(void *)(v106 + 16);
    uint64_t v90 = *(void *)(v106 + 24);
    *(void *)(v86 + 96) = v87;
    *(void *)(v86 + 104) = v88;
    *(void *)(v86 + 64) = v88;
    *(void *)(v86 + 72) = v89;
    *(void *)(v86 + 80) = v90;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A916AD30();
    sub_1A90A2FD4(v92, v105);
    sub_1A90A2FD4(v94, v102);
    sub_1A90A2FD4(v95, v97);
    sub_1A90A2FD4(v98, v99);

    swift_bridgeObjectRelease();
    uint64_t v67 = v82;
    unint64_t v68 = v84;
  }
  sub_1A90A2FD4(v67, v68);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(v106 + v100) + 16));
}

uint64_t sub_1A9137CCC(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBC358];
  sub_1A90A5670(0, qword_1EB687308, MEMORY[0x1E4FBC358], MEMORY[0x1E4FBB320]);
  uint64_t v4 = v3;
  v11[3] = v3;
  v11[4] = sub_1A9139620(qword_1EB687E10, qword_1EB687308, v2);
  v11[0] = a1;
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v11, v4);
  id v6 = (unsigned char *)(*v5 + 32);
  unsigned int v7 = &v6[*(void *)(*v5 + 16)];
  swift_bridgeObjectRetain();
  sub_1A9134D84(v6, v7, &v10);
  uint64_t v8 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v8;
}

void sub_1A9137DB4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1A916AAD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v12 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle;
  unint64_t v13 = *(void **)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle);
  if (v13)
  {
    id v14 = *(id *)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle);
  }
  else
  {
    uint64_t v37 = a2;
    sub_1A9139538();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_url, v7);
    id v16 = sub_1A91304F8((uint64_t)v10);
    if (v3) {
      goto LABEL_8;
    }
    id v17 = *(void **)(a3 + v12);
    *(void *)(a3 + v12) = v16;
    id v14 = v16;

    unint64_t v13 = 0;
    a2 = v37;
  }
  id v15 = v13;
  sub_1A916B380();
  if (!v3)
  {
    uint64_t v35 = a1;
    unint64_t v36 = a2;
    sub_1A91395CC();
    sub_1A916B360();
    uint64_t v37 = a1;
    uint64_t v18 = sub_1A9137CCC((uint64_t)&unk_1EFF9C6D8);
    unint64_t v20 = v19;
    sub_1A914723C(v18, v19, 0xD00000000000003CLL, 0x80000001A91781F0);
    sub_1A90A2FD4(v18, v20);
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v21 = (id)qword_1EB689AA0;
    v34[3] = sub_1A916B3A0();
    sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1A916EF60;
    uint64_t v23 = UploadDropboxFile.description.getter();
    uint64_t v25 = v24;
    *(void *)(v22 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v22 + 64) = sub_1A90A67C0();
    *(void *)(v22 + 32) = v23;
    *(void *)(v22 + 40) = v25;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
    uint64_t v26 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        LODWORD(v26) = HIDWORD(v37) - v37;
        if (__OFSUB__(HIDWORD(v37), v37)) {
          goto LABEL_21;
        }
        uint64_t v26 = (int)v26;
LABEL_16:
        uint64_t v30 = *(void *)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_byteSize);
        BOOL v29 = __OFADD__(v30, v26);
        uint64_t v31 = v30 + v26;
        if (v29)
        {
          __break(1u);
        }
        else
        {
          *(void *)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_byteSize) = v31;
          uint64_t v32 = *(void *)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_eventCount);
          BOOL v29 = __OFADD__(v32, 1);
          uint64_t v33 = v32 + 1;
          if (!v29)
          {
            *(void *)(a3 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_eventCount) = v33;
            break;
          }
        }
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
        JUMPOUT(0x1A913819CLL);
      case 2uLL:
        uint64_t v28 = *(void *)(v37 + 16);
        uint64_t v27 = *(void *)(v37 + 24);
        BOOL v29 = __OFSUB__(v27, v28);
        uint64_t v26 = v27 - v28;
        if (!v29) {
          goto LABEL_16;
        }
        goto LABEL_22;
      case 3uLL:
        goto LABEL_16;
      default:
        uint64_t v26 = BYTE6(a2);
        goto LABEL_16;
    }
  }

LABEL_8:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a3 + v11) + 16));
}

void sub_1A91381AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  uint64_t v5 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v7 = v3;
  char v8 = v4;
  sub_1A91362D4(a1, &v7);
  id v6 = *(os_unfair_lock_s **)(*(void *)(a1 + v5) + 16);

  os_unfair_lock_unlock(v6);
}

char *sub_1A9138228(uint64_t a1)
{
  v21[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1A916AAD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle;
  uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle);
  if (v9)
  {
    id v10 = *(id *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_fileHandle);
  }
  else
  {
    sub_1A9139538();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_url, v3);
    id v18 = sub_1A91304F8((uint64_t)v6);
    if (v1) {
      goto LABEL_11;
    }
    unint64_t v20 = *(void **)(a1 + v8);
    *(void *)(a1 + v8) = v18;
    id v10 = v18;

    uint64_t v9 = 0;
  }
  v21[0] = 0;
  id v11 = v9;
  unsigned __int8 v12 = objc_msgSend(v10, sel_seekToOffset_error_, 0, v21);
  id v6 = (char *)v21[0];
  if ((v12 & 1) == 0)
  {
    id v17 = v21[0];
    sub_1A916A990();

LABEL_8:
    swift_willThrow();
    goto LABEL_9;
  }
  id v13 = v21[0];
  uint64_t v14 = sub_1A916B370();
  if (!v1)
  {
    if (v15 >> 60 != 15)
    {
      id v6 = (char *)v14;

      os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a1 + v7) + 16));
      return v6;
    }
    sub_1A9139578();
    swift_allocError();
    *id v16 = 1;
    goto LABEL_8;
  }
LABEL_9:

LABEL_11:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a1 + v7) + 16));
  return v6;
}

uint64_t sub_1A9138470(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_userAgent);
  if (*(void *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_userAgent + 8))
  {
    uint64_t v4 = *v3;
  }
  else
  {
    uint64_t v4 = sub_1A9131078();
    *uint64_t v3 = v4;
    v3[1] = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  id v6 = *(os_unfair_lock_s **)(*(void *)(a1 + v2) + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v6);
  return v4;
}

uint64_t sub_1A9138528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_contentType;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_contentType + 8) == 1)
  {
    uint64_t v6 = sub_1A9131568(a1, a2);
    *(void *)uint64_t v5 = v6;
    *(unsigned char *)(v5 + 8) = 0;
  }
  else
  {
    uint64_t v6 = *(void *)v5;
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(a1 + v4) + 16));
  return v6;
}

uint64_t sub_1A91385B4(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v7 = (uint64_t *)(a1 + *a2);
  if (v7[1])
  {
    uint64_t v8 = *v7;
  }
  else
  {
    uint64_t v8 = a3(a1);
    *uint64_t v7 = v8;
    v7[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  id v10 = *(os_unfair_lock_s **)(*(void *)(a1 + v6) + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v10);
  return v8;
}

void sub_1A9138674(uint64_t a1)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = OBJC_IVAR____TtC12AppAnalytics17UploadDropboxFile_lock;
  os_unfair_lock_lock_with_options();
  id v3 = objc_msgSend(self, sel_defaultManager);
  uint64_t v4 = (void *)sub_1A916AA40();
  v10[0] = 0;
  unsigned __int8 v5 = objc_msgSend(v3, sel_removeItemAtURL_error_, v4, v10);

  if (v5)
  {
    uint64_t v6 = *(os_unfair_lock_s **)(*(void *)(a1 + v2) + 16);
    id v7 = v10[0];
    uint64_t v8 = v6;
  }
  else
  {
    id v9 = v10[0];
    sub_1A916A990();

    swift_willThrow();
    uint64_t v8 = *(os_unfair_lock_s **)(*(void *)(a1 + v2) + 16);
  }
  os_unfair_lock_unlock(v8);
}

uint64_t sub_1A91387A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1A913939C();
    uint64_t v3 = sub_1A916B650();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_1A916AF90();
      sub_1A916BAB0();
      id v7 = v6;
      sub_1A916B030();
      uint64_t v8 = sub_1A916BAD0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_1A916AF90();
        uint64_t v17 = v16;
        if (v15 == sub_1A916AF90() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_1A916B9E0();
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
          uint64_t v22 = sub_1A916AF90();
          uint64_t v24 = v23;
          if (v22 == sub_1A916AF90() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_1A916B9E0();
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
  return MEMORY[0x1E4FBC870];
}

id sub_1A91389CC(uint64_t a1, char a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1A916A930();
  *(void *)&long long v72 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v69 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9135FFC(0, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v54 - v8;
  uint64_t v10 = sub_1A916AAD0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v71 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A916A9B0();
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &off_1E5D7A000;
  if ((a2 & 1) == 0)
  {
LABEL_24:
    id v43 = [self (SEL)v18[320]];
    unint64_t v44 = (void *)sub_1A916AA40();
    v76[0] = 0;
    unsigned int v45 = objc_msgSend(v43, sel_removeItemAtURL_error_, v44, v76);

    if (v45) {
      return v76[0];
    }
    id v47 = v76[0];
    sub_1A916A990();

    return (id)swift_willThrow();
  }
  id v70 = v2;
  uint64_t v67 = v15;
  uint64_t v68 = v14;
  uint64_t v64 = v5;
  id v19 = objc_msgSend(self, sel_defaultManager);
  sub_1A9135FFC(0, &qword_1EB687D48, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, MEMORY[0x1E4FBBE00]);
  uint64_t v21 = v20;
  uint64_t v22 = swift_allocObject();
  long long v66 = xmmword_1A916EF60;
  *(_OWORD *)(v22 + 16) = xmmword_1A916EF60;
  uint64_t v23 = (void *)*MEMORY[0x1E4F1C670];
  *(void *)(v22 + 32) = *MEMORY[0x1E4F1C670];
  id v65 = v23;
  uint64_t v24 = (void *)sub_1A916B390();

  swift_bridgeObjectRelease();
  if (!v24)
  {
LABEL_23:
    uint64_t v18 = &off_1E5D7A000;
    goto LABEL_24;
  }
  sub_1A916B350();
  sub_1A916A9A0();
  if (!v77)
  {
    (*(void (**)(char *, uint64_t))(v67 + 8))(v17, v68);

    goto LABEL_23;
  }
  id v62 = v24;
  uint64_t v59 = v21;
  uint64_t v63 = a1;
  id v61 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  unint64_t v60 = (void (**)(char *, uint64_t))(v11 + 8);
  unint64_t v58 = (void (**)(char *, uint64_t))(v72 + 8);
  BOOL v25 = 1;
  long long v72 = xmmword_1A916E200;
  do
  {
    int v26 = swift_dynamicCast();
    char v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    if (!v26)
    {
      v27(v9, 1, 1, v10);
LABEL_13:
      sub_1A9136060((uint64_t)v9, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0]);
      goto LABEL_14;
    }
    v27(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
      goto LABEL_13;
    }
    uint64_t v28 = v71;
    (*v61)(v71, v9, v10);
    if (v25)
    {
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v66;
      uint64_t v30 = v65;
      *(void *)(inited + 32) = v65;
      id v31 = v30;
      id v57 = (id)sub_1A91387A0(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0);
      swift_arrayDestroy();
      uint64_t v32 = v69;
      id v33 = v70;
      sub_1A916A9F0();
      id v70 = v33;
      if (v33)
      {
        swift_bridgeObjectRelease();
        if (qword_1EB68ACE8 != -1) {
          swift_once();
        }
        id v57 = (id)qword_1EB689AA0;
        int v56 = sub_1A916B3B0();
        sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = v72;
        uint64_t v35 = sub_1A916A9E0();
        uint64_t v54 = v36;
        *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v55 = sub_1A90A67C0();
        *(void *)(v34 + 64) = v55;
        uint64_t v37 = v54;
        *(void *)(v34 + 32) = v35;
        *(void *)(v34 + 40) = v37;
        uint64_t v74 = 0;
        unint64_t v75 = 0xE000000000000000;
        id v73 = v70;
        sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
        sub_1A916B780();
        uint64_t v38 = v74;
        unint64_t v39 = v75;
        unint64_t v40 = v55;
        *(void *)(v34 + 96) = MEMORY[0x1E4FBB1A0];
        *(void *)(v34 + 104) = v40;
        *(void *)(v34 + 72) = v38;
        *(void *)(v34 + 80) = v39;
        uint64_t v41 = v57;
        sub_1A916AD30();

        swift_bridgeObjectRelease();
        (*v60)(v71, v10);
        id v70 = 0;
        BOOL v25 = 1;
      }
      else
      {
        swift_bridgeObjectRelease();
        char v42 = sub_1A916A920();
        (*v58)(v32, v64);
        (*v60)(v71, v10);
        BOOL v25 = v42 == 2 || (v42 & 1) == 0;
      }
    }
    else
    {
      (*v60)(v28, v10);
      BOOL v25 = 0;
    }
LABEL_14:
    sub_1A916A9A0();
  }
  while (v77);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v17, v68);

  uint64_t v18 = &off_1E5D7A000;
  if (v25) {
    goto LABEL_24;
  }
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  unint64_t v48 = (void *)qword_1EB689AA0;
  sub_1A9139334(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = v66;
  id v50 = v48;
  uint64_t v51 = sub_1A916A9E0();
  uint64_t v53 = v52;
  *(void *)(v49 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v49 + 64) = sub_1A90A67C0();
  *(void *)(v49 + 32) = v51;
  *(void *)(v49 + 40) = v53;
  sub_1A916B3D0();
  sub_1A916AD30();

  return (id)swift_bridgeObjectRelease();
}

void sub_1A9139334(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1A908E870(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1A913939C()
{
  if (!qword_1EB6872D0)
  {
    type metadata accessor for URLResourceKey(255);
    sub_1A9139400();
    unint64_t v0 = sub_1A916B660();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB6872D0);
    }
  }
}

unint64_t sub_1A9139400()
{
  unint64_t result = qword_1EB6872C8;
  if (!qword_1EB6872C8)
  {
    type metadata accessor for URLResourceKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6872C8);
  }
  return result;
}

void *sub_1A9139458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_1A9134DFC((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1A91394C4, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1A91394C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1A9135320(a1, a2);
}

unint64_t sub_1A91394E4()
{
  unint64_t result = qword_1EB689458;
  if (!qword_1EB689458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB689458);
  }
  return result;
}

unint64_t sub_1A9139538()
{
  unint64_t result = qword_1EB689488;
  if (!qword_1EB689488)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB689488);
  }
  return result;
}

unint64_t sub_1A9139578()
{
  unint64_t result = qword_1EB6872D8;
  if (!qword_1EB6872D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6872D8);
  }
  return result;
}

unint64_t sub_1A91395CC()
{
  unint64_t result = qword_1EB687F68;
  if (!qword_1EB687F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687F68);
  }
  return result;
}

uint64_t sub_1A9139620(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A90A5670(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A9139678(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1A90B833C();
    uint64_t v3 = sub_1A916B650();
    uint64_t v4 = 0;
    uint64_t v36 = v3 + 56;
    uint64_t v33 = v1;
    uint64_t v34 = a1 + 32;
    uint64_t v32 = v3;
    while (1)
    {
      uint64_t v5 = (uint64_t *)(v34 + 48 * v4);
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      uint64_t v9 = v5[2];
      uint64_t v8 = v5[3];
      uint64_t v11 = v5[4];
      uint64_t v10 = v5[5];
      sub_1A916BAB0();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1A916B030();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v38 = v9;
      sub_1A916B030();
      uint64_t v39 = v8;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v37 = v11;
      sub_1A916B030();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1A916BAD0();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v36 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        uint64_t v35 = v4;
        uint64_t v18 = ~v13;
        uint64_t v19 = *(void *)(v3 + 48);
        do
        {
          uint64_t v20 = (void *)(v19 + 48 * v14);
          uint64_t v21 = v20[2];
          uint64_t v22 = v20[3];
          uint64_t v23 = v20[4];
          uint64_t v24 = v20[5];
          BOOL v25 = *v20 == v7 && v20[1] == v6;
          if (v25 || (uint64_t result = sub_1A916B9E0(), (result & 1) != 0))
          {
            BOOL v26 = v21 == v38 && v22 == v39;
            if (v26 || (uint64_t result = sub_1A916B9E0(), (result & 1) != 0))
            {
              BOOL v27 = v23 == v37 && v24 == v10;
              if (v27 || (uint64_t result = sub_1A916B9E0(), (result & 1) != 0))
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v3 = v32;
                uint64_t v1 = v33;
                uint64_t v4 = v35;
                goto LABEL_4;
              }
            }
          }
          unint64_t v14 = (v14 + 1) & v18;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v36 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
        }
        while ((v16 & (1 << v14)) != 0);
        uint64_t v3 = v32;
        uint64_t v1 = v33;
        uint64_t v4 = v35;
      }
      *(void *)(v36 + 8 * v15) = v17 | v16;
      uint64_t v28 = (void *)(*(void *)(v3 + 48) + 48 * v14);
      *uint64_t v28 = v7;
      v28[1] = v6;
      void v28[2] = v38;
      v28[3] = v39;
      v28[4] = v37;
      v28[5] = v10;
      uint64_t v29 = *(void *)(v3 + 16);
      BOOL v30 = __OFADD__(v29, 1);
      uint64_t v31 = v29 + 1;
      if (v30) {
        break;
      }
      *(void *)(v3 + 16) = v31;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC870];
  }
  return result;
}

uint64_t sub_1A9139920(uint64_t a1, uint64_t a2)
{
  sub_1A9135FFC(0, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unsigned char *sub_1A91399B4@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_1A9139A68(a1, a2);
}

void *sub_1A91399CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1A9139AD8(a1);
}

uint64_t sub_1A91399E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1A90D1784(a1, a2);
  }
  return a1;
}

uint64_t sub_1A91399F8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_1A9139334(0, a2, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

unsigned char *sub_1A9139A68@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_1A9139AD8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

double sub_1A9139B1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A91358E4(a1, a2, *(long long **)(v3 + 16), a3);
}

uint64_t sub_1A9139B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A913596C(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

unsigned char *storeEnumTagSinglePayload for UploadDropboxFileManager.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9139C24);
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

ValueMetadata *type metadata accessor for UploadDropboxFileManager.Errors()
{
  return &type metadata for UploadDropboxFileManager.Errors;
}

unint64_t sub_1A9139C60()
{
  unint64_t result = qword_1E97B1A78;
  if (!qword_1E97B1A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1A78);
  }
  return result;
}

BOOL static SnapshotPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SnapshotPolicy.hash(into:)()
{
  return sub_1A916BAC0();
}

uint64_t SnapshotPolicy.hashValue.getter()
{
  return sub_1A916BAD0();
}

unint64_t sub_1A9139D44()
{
  unint64_t result = qword_1E97B1A80;
  if (!qword_1E97B1A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1A80);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SnapshotPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9139E64);
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

ValueMetadata *type metadata accessor for SnapshotPolicy()
{
  return &type metadata for SnapshotPolicy;
}

uint64_t sub_1A9139E9C()
{
  uint64_t v0 = sub_1A916A9D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A913BDC0(0, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  unsigned int v6 = &v14[-v5];
  uint64_t v7 = sub_1A916AAD0();
  __swift_allocate_value_buffer(v7, qword_1EB6883C8);
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB6883C8);
  id v8 = objc_msgSend(self, sel_defaultManager);
  id v9 = objc_msgSend(v8, sel_URLsForDirectory_inDomains_, 14, 1);

  uint64_t v10 = sub_1A916B190();
  uint64_t v11 = *(void *)(v7 - 8);
  uint64_t v12 = v11;
  if (*(void *)(v10 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v6, v10 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v6, 0, 1, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v6, 1, 1, v7);
  }
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    strcpy(v14, "summary-events");
    v14[15] = -18;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F276C0], v0);
    sub_1A90A6814();
    sub_1A916AAC0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v7);
  }
  return result;
}

void *sub_1A913A1B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  uint64_t v24 = a1;
  uint64_t v25 = v3;
  uint64_t v4 = type metadata accessor for SummaryEventDatabaseManager.StorageLocation(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1A916B430();
  uint64_t v21 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A916B420();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1A916AE10();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = (char *)v1 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lastFlush;
  uint64_t v11 = sub_1A916AC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lock;
  sub_1A913BC3C();
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = 0;
  *(void *)((char *)v1 + v12) = v13;
  uint64_t v20 = OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_diskIOQueue;
  sub_1A90A601C();
  sub_1A916ADE0();
  uint64_t v26 = MEMORY[0x1E4FBC860];
  sub_1A90A6868((unint64_t *)&qword_1EB68A900, MEMORY[0x1E4FBCC10]);
  unint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1A913BDC0(0, (unint64_t *)&qword_1EB68A8F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  uint64_t v15 = v24;
  sub_1A913BA90((unint64_t *)&qword_1EB68A8F8, (unint64_t *)&qword_1EB68A8F0, v14);
  uint64_t v16 = (uint64_t)v22;
  sub_1A916B610();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v7, *MEMORY[0x1E4FBCC58], v23);
  *(void *)((char *)v1 + v20) = sub_1A916B480();
  unint64_t v17 = (unint64_t)sub_1A913A5B8(v16, v15);
  sub_1A913BCA0(v16, (uint64_t)v2 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_storageLocation, type metadata accessor for SummaryEventDatabaseManager.StorageLocation);
  if (!v17) {
    unint64_t v17 = sub_1A90B255C(MEMORY[0x1E4FBC860]);
  }
  sub_1A913BBDC(v15, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  sub_1A913BBDC(v16, type metadata accessor for SummaryEventDatabaseManager.StorageLocation);
  v2[2] = v17;
  return v2;
}

id sub_1A913A5B8(uint64_t a1, uint64_t a2)
{
  v54[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v52 = sub_1A916A9D0();
  uint64_t v4 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A916AAD0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v53 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v13 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v48 - v17;
  uint64_t v19 = type metadata accessor for SummaryEventDatabaseManager.StorageOptions(0);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A913BCA0(a2, (uint64_t)v21, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  sub_1A909CF9C();
  uint64_t v23 = v22;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v21, 1, v22) == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, 1, 1, v7);
    return 0;
  }
  uint64_t v49 = *(void *)&v21[*(int *)(v23 + 48)];
  sub_1A913BD08((uint64_t)v21, (uint64_t)v18);
  sub_1A913BCA0((uint64_t)v18, (uint64_t)v16, type metadata accessor for SummaryEventConfiguration.StorageURLOptions);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7);
  id v50 = v18;
  uint64_t v51 = a1;
  if (v24 == 1)
  {
    if (qword_1EB688F90 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v7, (uint64_t)qword_1EB6883C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, v25, v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v16, v7);
  }
  uint64_t v26 = self;
  id v27 = objc_msgSend(v26, sel_defaultManager);
  uint64_t v28 = (void *)sub_1A916AA40();
  v54[0] = 0;
  unsigned int v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v54);

  if (v29)
  {
    id v30 = v54[0];
  }
  else
  {
    id v31 = v54[0];
    uint64_t v32 = (void *)sub_1A916A990();

    swift_willThrow();
  }
  v54[0] = (id)ContentType.description.getter(v49);
  v54[1] = v33;
  uint64_t v34 = v52;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4F276C0], v52);
  sub_1A90A6814();
  uint64_t v35 = v53;
  sub_1A916AAC0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v34);
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v26, sel_defaultManager);
  sub_1A916A9E0();
  uint64_t v38 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();
  id v39 = objc_msgSend(v37, sel_contentsAtPath_, v38);

  uint64_t v40 = v51;
  if (!v39)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    sub_1A913BBDC((uint64_t)v50, type metadata accessor for SummaryEventConfiguration.StorageURLOptions);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v40, v36, v7);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v40, 0, 1, v7);
    return 0;
  }
  uint64_t v41 = sub_1A916AB80();
  unint64_t v43 = v42;

  sub_1A916A7C0();
  swift_allocObject();
  sub_1A916A7B0();
  sub_1A913BD6C();
  sub_1A916A7A0();
  swift_release();
  sub_1A90A2FD4(v41, v43);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v45 = v8 + 8;
  v46(v12, v7);
  sub_1A913BBDC((uint64_t)v50, type metadata accessor for SummaryEventConfiguration.StorageURLOptions);
  id v47 = v54[0];
  (*(void (**)(uint64_t, char *, uint64_t))(v45 + 24))(v40, v53, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 48))(v40, 0, 1, v7);
  return v47;
}

uint64_t sub_1A913ACCC()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lock) + 16);
  os_unfair_lock_lock(v1);
  sub_1A913BBC0(v2);
  os_unfair_lock_unlock(v1);
  return sub_1A913AF28();
}

uint64_t sub_1A913AD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_1A90F9D54();
  if (!*(void *)(v8 + 16) || (unint64_t v11 = sub_1A90A1D98(v9, v10), (v12 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_1A90F9D54();
    uint64_t v24 = v23;
    uint64_t v25 = sub_1A90F9D54();
    uint64_t v27 = v26;
    uint64_t v28 = sub_1A90F9D18(a2, a3, a4);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1A90C4480(v25, v27, 1, v28, v22, v24, isUniquelyReferenced_nonNull_native);
    goto LABEL_7;
  }
  uint64_t v13 = (uint64_t *)(*(void *)(v8 + 56) + 32 * v11);
  uint64_t v14 = v13[1];
  uint64_t v30 = *v13;
  uint64_t v15 = v13[2];
  uint64_t v16 = v13[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A90F9CDC(a2, a3, a4);
  if ((v31 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t result = sub_1A90F9D54();
  if (!__OFADD__(v15, 1))
  {
    uint64_t v19 = result;
    uint64_t v20 = v18;
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_1A90C4480(v30, v14, v15 + 1, v16, v19, v20, v21);
LABEL_7:
    swift_bridgeObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = v8;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A913AF28()
{
  uint64_t v1 = sub_1A916ADB0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v33 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A916AE10();
  uint64_t v32 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v31 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A916AAD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  char v12 = (char *)&v27 - v11;
  uint64_t v13 = type metadata accessor for SummaryEventDatabaseManager.StorageLocation(0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A913BCA0(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_storageLocation, (uint64_t)v15, type metadata accessor for SummaryEventDatabaseManager.StorageLocation);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6);
  if (result != 1)
  {
    uint64_t v28 = v1;
    uint64_t v30 = v4;
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v17(v12, v15, v6);
    uint64_t v18 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lock) + 16);
    os_unfair_lock_lock(v18);
    uint64_t v29 = v2;
    uint64_t v19 = *(void *)(v0 + 16);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v18);
    uint64_t v27 = *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_diskIOQueue);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
    unint64_t v20 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v19;
    v17((char *)(v21 + v20), v9, v6);
    aBlock[4] = sub_1A913BA2C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A908CD10;
    aBlock[3] = &block_descriptor_9;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = v31;
    sub_1A916ADE0();
    uint64_t v34 = MEMORY[0x1E4FBC860];
    sub_1A90A6868((unint64_t *)&qword_1EB68A8D0, MEMORY[0x1E4FBCB00]);
    uint64_t v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1A913BDC0(0, (unint64_t *)&unk_1EB689800, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1A913BA90((unint64_t *)&qword_1EB689810, (unint64_t *)&unk_1EB689800, v24);
    uint64_t v25 = v33;
    uint64_t v26 = v28;
    sub_1A916B610();
    MEMORY[0x1AD0EDCB0](0, v23, v25, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v25, v26);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v30);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A913B404(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_1A90B255C(MEMORY[0x1E4FBC860]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A913B448()
{
  sub_1A916A820();
  swift_allocObject();
  sub_1A916A810();
  sub_1A913BAF4();
  uint64_t v0 = sub_1A916A7F0();
  unint64_t v2 = v1;
  swift_release();
  sub_1A916AB90();
  return sub_1A90A2FD4(v0, v2);
}

uint64_t sub_1A913B6C0()
{
  swift_bridgeObjectRelease();
  sub_1A90B4F84(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_lastFlush);
  swift_release();
  sub_1A913BBDC(v0 + OBJC_IVAR____TtC12AppAnalytics27SummaryEventDatabaseManager_storageLocation, type metadata accessor for SummaryEventDatabaseManager.StorageLocation);

  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A913B770()
{
  return type metadata accessor for SummaryEventDatabaseManager(0);
}

uint64_t type metadata accessor for SummaryEventDatabaseManager(uint64_t a1)
{
  return sub_1A9098ED8(a1, (uint64_t *)&unk_1EB6886D0);
}

void sub_1A913B798()
{
  sub_1A913BDC0(319, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for SummaryEventDatabaseManager.StorageLocation(319);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for SummaryEventDatabaseManager.StorageLocation(uint64_t a1)
{
  return sub_1A9098ED8(a1, qword_1EB688718);
}

uint64_t sub_1A913B8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A913B8EC);
}

uint64_t sub_1A913B8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1A913B904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A913B918);
}

uint64_t sub_1A913B918(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1A913B930(uint64_t a1, uint64_t a2)
{
  return sub_1A913CC1C(a1, a2, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1A913B948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A913CCA0(a1, a2, a3, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1A913B960()
{
  uint64_t v1 = sub_1A916AAD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1A913BA2C()
{
  sub_1A916AAD0();

  return sub_1A913B448();
}

uint64_t sub_1A913BA90(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A913BDC0(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1A913BAF4()
{
  unint64_t result = qword_1E97B1A88;
  if (!qword_1E97B1A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1A88);
  }
  return result;
}

unint64_t sub_1A913BB48()
{
  unint64_t result = qword_1EB689860;
  if (!qword_1EB689860)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB689860);
  }
  return result;
}

uint64_t sub_1A913BBA0()
{
  return sub_1A913AD50(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_1A913BBC0(uint64_t a1)
{
  return sub_1A9143BB8(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1A913BBDC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1A913BC3C()
{
  if (!qword_1EB6886E0)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_1A916B6C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB6886E0);
    }
  }
}

uint64_t sub_1A913BCA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A913BD08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A913BD6C()
{
  unint64_t result = qword_1E97B1A90;
  if (!qword_1E97B1A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1A90);
  }
  return result;
}

void sub_1A913BDC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t *sub_1A913BE24(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    sub_1A909CF9C();
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v11 = sub_1A916AAD0();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
        uint64_t v13 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v12 + 16))(a1, a2, v11);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
      *(uint64_t *)((char *)a1 + *(int *)(v8 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 48));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
  }
  return a1;
}

char *sub_1A913C038(char *a1, char *a2, uint64_t a3)
{
  sub_1A909CF9C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_1A916AAD0();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
    {
      uint64_t v11 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
      memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(a1, a2, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

char *sub_1A913C210(char *a1, char *a2, uint64_t a3)
{
  sub_1A909CF9C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1, v6);
  int v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (v11)
    {
      sub_1A913BBDC((uint64_t)a1, (uint64_t (*)(void))sub_1A909CF9C);
      goto LABEL_7;
    }
    uint64_t v15 = sub_1A916AAD0();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
    int v18 = v17(a1, 1, v15);
    int v19 = v17(a2, 1, v15);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(a1, a2, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
LABEL_16:
        *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
        return a1;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 24))(a1, a2, v15);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(a1, v15);
    }
    uint64_t v20 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v12 = sub_1A916AAD0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(a2, 1, v12))
  {
    uint64_t v14 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(a1, a2, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(a1, 0, 1, v12);
  }
  *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

char *sub_1A913C578(char *a1, char *a2, uint64_t a3)
{
  sub_1A909CF9C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_1A916AAD0();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
    {
      uint64_t v11 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
      memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a1, a2, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

char *sub_1A913C750(char *a1, char *a2, uint64_t a3)
{
  sub_1A909CF9C();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1, v6);
  int v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (v11)
    {
      sub_1A913BBDC((uint64_t)a1, (uint64_t (*)(void))sub_1A909CF9C);
      goto LABEL_7;
    }
    uint64_t v15 = sub_1A916AAD0();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
    int v18 = v17(a1, 1, v15);
    int v19 = v17(a2, 1, v15);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(a1, a2, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
LABEL_16:
        *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
        return a1;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 40))(a1, a2, v15);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(a1, v15);
    }
    uint64_t v20 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v12 = sub_1A916AAD0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(a2, 1, v12))
  {
    uint64_t v14 = type metadata accessor for SummaryEventConfiguration.StorageURLOptions(0);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(a1, a2, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(a1, 0, 1, v12);
  }
  *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

uint64_t sub_1A913CAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A913CACC);
}

uint64_t sub_1A913CACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(void))sub_1A909CF9C);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  unsigned int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(a1, a2, v6);
  if (v7 >= 2) {
    return v7 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1A913CB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A913CB68);
}

uint64_t sub_1A913CB68(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(void))sub_1A909CF9C);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  if (a2) {
    uint64_t v7 = (a2 + 1);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = a5(0);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);

  return v9(a1, v7, a3, v8);
}

uint64_t sub_1A913CC04(uint64_t a1, uint64_t a2)
{
  return sub_1A913CC1C(a1, a2, (uint64_t (*)(void))sub_1A909CF9C);
}

uint64_t sub_1A913CC1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, 1, v4);
}

uint64_t sub_1A913CC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A913CCA0(a1, a2, a3, (uint64_t (*)(void))sub_1A909CF9C);
}

uint64_t sub_1A913CCA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, a2, 1, v6);
}

uint64_t BatchEvent.metadata.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void BatchEvent.privateMetadata.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 24);
  *(void *)a1 = *(void *)(v1 + 16);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t BatchEvent.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for BatchEvent(0);
  return sub_1A913D9C0(v1 + *(int *)(v3 + 24), a1, type metadata accessor for BatchEvent.Event);
}

uint64_t type metadata accessor for BatchEvent(uint64_t a1)
{
  return sub_1A9098ED8(a1, qword_1EB686E38);
}

uint64_t type metadata accessor for BatchEvent.Event(uint64_t a1)
{
  return sub_1A9098ED8(a1, (uint64_t *)&unk_1EB686D98);
}

uint64_t BatchEvent.Metadata.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A913CDF8()
{
  return 1701667182;
}

uint64_t sub_1A913CE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1A916B9E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A913CE90(uint64_t a1)
{
  unint64_t v2 = sub_1A913D070();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A913CECC(uint64_t a1)
{
  unint64_t v2 = sub_1A913D070();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t BatchEvent.Metadata.encode(to:)(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1A98, (uint64_t (*)(void))sub_1A913D070, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D070();
  sub_1A916BB50();
  sub_1A916B930();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A913D070()
{
  unint64_t result = qword_1EB686E18;
  if (!qword_1EB686E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E18);
  }
  return result;
}

uint64_t BatchEvent.Metadata.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v15 = a2;
  sub_1A913EAEC(0, &qword_1EB686EE8, (uint64_t (*)(void))sub_1A913D070, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v14 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D070();
  sub_1A916BB20();
  if (!v2)
  {
    uint64_t v9 = v15;
    uint64_t v10 = sub_1A916B8A0();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *uint64_t v9 = v10;
    v9[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A913D26C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return BatchEvent.Metadata.init(from:)(a1, a2);
}

uint64_t sub_1A913D284(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1A98, (uint64_t (*)(void))sub_1A913D070, (uint64_t)&type metadata for BatchEvent.Metadata.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D070();
  sub_1A916BB50();
  sub_1A916B930();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t BatchEvent.PrivateMetadata.nonJitteredEventTimestamp.getter()
{
  return *(void *)v0;
}

unint64_t sub_1A913D3F4()
{
  return 0xD000000000000019;
}

uint64_t sub_1A913D410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9140E14(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A913D43C(uint64_t a1)
{
  unint64_t v2 = sub_1A913D618();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A913D478(uint64_t a1)
{
  unint64_t v2 = sub_1A913D618();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t BatchEvent.PrivateMetadata.encode(to:)(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1AA0, (uint64_t (*)(void))sub_1A913D618, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D618();
  sub_1A916BB50();
  sub_1A916B970();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A913D618()
{
  unint64_t result = qword_1EB686CD0;
  if (!qword_1EB686CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686CD0);
  }
  return result;
}

uint64_t BatchEvent.PrivateMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v13 = a2;
  sub_1A913EAEC(0, &qword_1EB686CE8, (uint64_t (*)(void))sub_1A913D618, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v12 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D618();
  sub_1A916BB20();
  if (!v2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = sub_1A916B8F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *uint64_t v9 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A913D810@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return BatchEvent.PrivateMetadata.init(from:)(a1, a2);
}

uint64_t sub_1A913D828(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1AA0, (uint64_t (*)(void))sub_1A913D618, (uint64_t)&type metadata for BatchEvent.PrivateMetadata.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913D618();
  sub_1A916BB50();
  sub_1A916B970();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t BatchEvent.Event.eventData.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A913D9C0(v1, a1, (uint64_t (*)(void))sub_1A913DA28);
}

uint64_t sub_1A913D9C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1A913DA28()
{
  if (!qword_1EB686ED0)
  {
    type metadata accessor for EventData();
    unint64_t v0 = sub_1A916B540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB686ED0);
    }
  }
}

uint64_t sub_1A913DA80()
{
  return 0x746144746E657665;
}

uint64_t sub_1A913DA9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x746144746E657665 && a2 == 0xE900000000000061)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1A916B9E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A913DB40(uint64_t a1)
{
  unint64_t v2 = sub_1A913DD64();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A913DB7C(uint64_t a1)
{
  unint64_t v2 = sub_1A913DD64();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t BatchEvent.Event.encode(to:)(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1AA8, (uint64_t (*)(void))sub_1A913DD64, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913DD64();
  sub_1A916BB50();
  type metadata accessor for EventData();
  sub_1A913E074(&qword_1EB688B40, (void (*)(uint64_t))type metadata accessor for EventData);
  sub_1A916B920();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1A913DD64()
{
  unint64_t result = qword_1EB686D78;
  if (!qword_1EB686D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686D78);
  }
  return result;
}

uint64_t BatchEvent.Event.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  sub_1A913DA28();
  MEMORY[0x1F4188790](v4 - 8);
  int v19 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A913EAEC(0, &qword_1EB686ED8, (uint64_t (*)(void))sub_1A913DD64, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v7 = v6;
  uint64_t v17 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = type metadata accessor for BatchEvent.Event(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913DD64();
  sub_1A916BB20();
  if (!v2)
  {
    uint64_t v14 = v17;
    uint64_t v13 = v18;
    type metadata accessor for EventData();
    sub_1A913E074(&qword_1EB688B48, (void (*)(uint64_t))type metadata accessor for EventData);
    uint64_t v15 = (uint64_t)v19;
    sub_1A916B890();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v7);
    sub_1A913E0BC(v15, (uint64_t)v12, (uint64_t (*)(void))sub_1A913DA28);
    sub_1A913E0BC((uint64_t)v12, v13, type metadata accessor for BatchEvent.Event);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A913E074(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A913E0BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A913E124@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BatchEvent.Event.init(from:)(a1, a2);
}

uint64_t sub_1A913E13C(void *a1)
{
  sub_1A913EAEC(0, &qword_1E97B1AA8, (uint64_t (*)(void))sub_1A913DD64, (uint64_t)&type metadata for BatchEvent.Event.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913DD64();
  sub_1A916BB50();
  type metadata accessor for EventData();
  sub_1A913E074(&qword_1EB688B40, (void (*)(uint64_t))type metadata accessor for EventData);
  sub_1A916B920();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1A913E2E8()
{
  uint64_t v1 = 0x4D65746176697270;
  if (*v0 != 1) {
    uint64_t v1 = 1635017060;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x617461646174656DLL;
  }
}

uint64_t sub_1A913E348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9140E9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A913E370(uint64_t a1)
{
  unint64_t v2 = sub_1A913E638();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A913E3AC(uint64_t a1)
{
  unint64_t v2 = sub_1A913E638();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t BatchEvent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_1A913EAEC(0, &qword_1E97B1AB0, (uint64_t (*)(void))sub_1A913E638, (uint64_t)&type metadata for BatchEvent.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913E638();
  sub_1A916BB50();
  uint64_t v10 = v3[1];
  uint64_t v13 = *v3;
  uint64_t v14 = v10;
  char v15 = 0;
  sub_1A913E68C();
  sub_1A916B960();
  if (!v2)
  {
    char v11 = *((unsigned char *)v3 + 24);
    uint64_t v13 = v3[2];
    LOBYTE(v14) = v11;
    char v15 = 1;
    sub_1A913E6E0();
    sub_1A916B920();
    type metadata accessor for BatchEvent(0);
    LOBYTE(v13) = 2;
    type metadata accessor for BatchEvent.Event(0);
    sub_1A913E074(&qword_1E97B1AC8, (void (*)(uint64_t))type metadata accessor for BatchEvent.Event);
    sub_1A916B960();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1A913E638()
{
  unint64_t result = qword_1EB686E00;
  if (!qword_1EB686E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E00);
  }
  return result;
}

unint64_t sub_1A913E68C()
{
  unint64_t result = qword_1E97B1AB8;
  if (!qword_1E97B1AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AB8);
  }
  return result;
}

unint64_t sub_1A913E6E0()
{
  unint64_t result = qword_1E97B1AC0;
  if (!qword_1E97B1AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AC0);
  }
  return result;
}

uint64_t BatchEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v19 = type metadata accessor for BatchEvent.Event(0);
  MEMORY[0x1F4188790](v19);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A913EAEC(0, &qword_1EB686EE0, (uint64_t (*)(void))sub_1A913E638, (uint64_t)&type metadata for BatchEvent.CodingKeys, MEMORY[0x1E4FBBDC0]);
  uint64_t v20 = *(void *)(v5 - 8);
  uint64_t v21 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for BatchEvent(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A913E638();
  uint64_t v22 = v7;
  uint64_t v11 = v23;
  sub_1A916BB20();
  if (v11) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v12 = v20;
  uint64_t v13 = (uint64_t)v10;
  char v26 = 0;
  sub_1A913EB54();
  uint64_t v14 = v21;
  sub_1A916B8E0();
  uint64_t v15 = v25;
  *(void *)uint64_t v13 = v24;
  *(void *)(v13 + 8) = v15;
  char v26 = 1;
  sub_1A913EBA8();
  sub_1A916B890();
  char v16 = v25;
  *(void *)(v13 + 16) = v24;
  *(unsigned char *)(v13 + 24) = v16;
  LOBYTE(v24) = 2;
  sub_1A913E074(&qword_1EB686D90, (void (*)(uint64_t))type metadata accessor for BatchEvent.Event);
  sub_1A916B8E0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v14);
  sub_1A913E0BC((uint64_t)v4, v13 + *(int *)(v8 + 24), type metadata accessor for BatchEvent.Event);
  sub_1A913D9C0(v13, v18, type metadata accessor for BatchEvent);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A913F468(v13, type metadata accessor for BatchEvent);
}

void sub_1A913EAEC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

unint64_t sub_1A913EB54()
{
  unint64_t result = qword_1EB686E30;
  if (!qword_1EB686E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E30);
  }
  return result;
}

unint64_t sub_1A913EBA8()
{
  unint64_t result = qword_1EB686888;
  if (!qword_1EB686888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686888);
  }
  return result;
}

uint64_t sub_1A913EBFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BatchEvent.init(from:)(a1, a2);
}

uint64_t sub_1A913EC14(void *a1)
{
  return BatchEvent.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for BatchEvent(uint64_t a1, uint64_t *a2, uint64_t a3)
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
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    uint64_t v9 = (int *)type metadata accessor for EventData();
    uint64_t v10 = *((void *)v9 - 1);
    uint64_t v11 = *(unsigned int (**)(void *, uint64_t, int *))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      sub_1A913DA28();
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v14 = v8[1];
      *uint64_t v7 = *v8;
      v7[1] = v14;
      uint64_t v15 = v9[5];
      uint64_t v33 = (char *)v7 + v15;
      char v16 = (char *)v8 + v15;
      uint64_t v17 = sub_1A916AC90();
      uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
      swift_bridgeObjectRetain();
      v18(v33, v16, v17);
      uint64_t v19 = v9[6];
      uint64_t v20 = (void *)((char *)v7 + v19);
      uint64_t v21 = (void *)((char *)v8 + v19);
      uint64_t v22 = v21[1];
      *uint64_t v20 = *v21;
      v20[1] = v22;
      uint64_t v23 = v9[7];
      uint64_t v24 = (void *)((char *)v7 + v23);
      uint64_t v25 = (void *)((char *)v8 + v23);
      uint64_t v26 = v25[1];
      *uint64_t v24 = *v25;
      v24[1] = v26;
      uint64_t v27 = v9[8];
      uint64_t v28 = (void *)((char *)v7 + v27);
      uint64_t v29 = (void *)((char *)v8 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      char v31 = *(void (**)(void *, void, uint64_t, int *))(v10 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v31(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for BatchEvent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for EventData();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v4 + *(int *)(v5 + 20);
    uint64_t v8 = sub_1A916AC90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = (int *)type metadata accessor for EventData();
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = *(unsigned int (**)(void *, uint64_t, int *))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    sub_1A913DA28();
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v12;
    uint64_t v13 = v8[5];
    char v31 = (char *)v6 + v13;
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = sub_1A916AC90();
    char v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v31, v14, v15);
    uint64_t v17 = v8[6];
    uint64_t v18 = (void *)((char *)v6 + v17);
    uint64_t v19 = (void *)((char *)v7 + v17);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v8[7];
    uint64_t v22 = (void *)((char *)v6 + v21);
    uint64_t v23 = (void *)((char *)v7 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v8[8];
    uint64_t v26 = (void *)((char *)v6 + v25);
    uint64_t v27 = (void *)((char *)v7 + v25);
    uint64_t v28 = v27[1];
    void *v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = *(void (**)(void *, void, uint64_t, int *))(v9 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for EventData();
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *uint64_t v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v31 = v10[5];
      uint64_t v32 = (char *)v8 + v31;
      uint64_t v33 = (char *)v9 + v31;
      uint64_t v34 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
      uint64_t v35 = v10[6];
      uint64_t v36 = (void *)((char *)v8 + v35);
      id v37 = (void *)((char *)v9 + v35);
      void *v36 = *v37;
      v36[1] = v37[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v38 = v10[7];
      id v39 = (void *)((char *)v8 + v38);
      uint64_t v40 = (void *)((char *)v9 + v38);
      *id v39 = *v40;
      v39[1] = v40[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v41 = v10[8];
      unint64_t v42 = (void *)((char *)v8 + v41);
      unint64_t v43 = (void *)((char *)v9 + v41);
      *unint64_t v42 = *v43;
      v42[1] = v43[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A913F468((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1A913DA28();
    memcpy(v8, v9, *(void *)(*(void *)(v29 - 8) + 64));
    return a1;
  }
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  uint64_t v15 = v10[5];
  unint64_t v44 = (char *)v8 + v15;
  char v16 = (char *)v9 + v15;
  uint64_t v17 = sub_1A916AC90();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
  swift_bridgeObjectRetain();
  v18(v44, v16, v17);
  uint64_t v19 = v10[6];
  uint64_t v20 = (void *)((char *)v8 + v19);
  uint64_t v21 = (void *)((char *)v9 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  uint64_t v22 = v10[7];
  uint64_t v23 = (void *)((char *)v8 + v22);
  uint64_t v24 = (void *)((char *)v9 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  uint64_t v25 = v10[8];
  uint64_t v26 = (void *)((char *)v8 + v25);
  uint64_t v27 = (void *)((char *)v9 + v25);
  void *v26 = *v27;
  v26[1] = v27[1];
  uint64_t v28 = *(void (**)(void *, void, uint64_t, int *))(v11 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1A913F468(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (_OWORD *)(a1 + v4);
  uint64_t v6 = (_OWORD *)(a2 + v4);
  uint64_t v7 = (int *)type metadata accessor for EventData();
  uint64_t v8 = *((void *)v7 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v8 + 48))(v6, 1, v7))
  {
    sub_1A913DA28();
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    _OWORD *v5 = *v6;
    uint64_t v10 = v7[5];
    uint64_t v11 = (char *)v5 + v10;
    uint64_t v12 = (char *)v6 + v10;
    uint64_t v13 = sub_1A916AC90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    *(_OWORD *)((char *)v5 + v7[6]) = *(_OWORD *)((char *)v6 + v7[6]);
    *(_OWORD *)((char *)v5 + v7[7]) = *(_OWORD *)((char *)v6 + v7[7]);
    *(_OWORD *)((char *)v5 + v7[8]) = *(_OWORD *)((char *)v6 + v7[8]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for EventData();
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      uint64_t v21 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v21;
      swift_bridgeObjectRelease();
      uint64_t v22 = v10[5];
      uint64_t v23 = (char *)v8 + v22;
      uint64_t v24 = (char *)v9 + v22;
      uint64_t v25 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
      uint64_t v26 = v10[6];
      uint64_t v27 = (void *)((char *)v8 + v26);
      uint64_t v28 = (void *)((char *)v9 + v26);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      *uint64_t v27 = v30;
      v27[1] = v29;
      swift_bridgeObjectRelease();
      uint64_t v31 = v10[7];
      uint64_t v32 = (void *)((char *)v8 + v31);
      uint64_t v33 = (void *)((char *)v9 + v31);
      uint64_t v35 = *v33;
      uint64_t v34 = v33[1];
      *uint64_t v32 = v35;
      v32[1] = v34;
      swift_bridgeObjectRelease();
      uint64_t v36 = v10[8];
      id v37 = (void *)((char *)v8 + v36);
      uint64_t v38 = (void *)((char *)v9 + v36);
      uint64_t v40 = *v38;
      uint64_t v39 = v38[1];
      *id v37 = v40;
      v37[1] = v39;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A913F468((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1A913DA28();
    memcpy(v8, v9, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  uint64_t v15 = v10[5];
  char v16 = (char *)v8 + v15;
  uint64_t v17 = (char *)v9 + v15;
  uint64_t v18 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  *(_OWORD *)((char *)v8 + v10[6]) = *(_OWORD *)((char *)v9 + v10[6]);
  *(_OWORD *)((char *)v8 + v10[7]) = *(_OWORD *)((char *)v9 + v10[7]);
  *(_OWORD *)((char *)v8 + v10[8]) = *(_OWORD *)((char *)v9 + v10[8]);
  (*(void (**)(void *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A913F8D4);
}

uint64_t sub_1A913F8D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for BatchEvent.Event(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for BatchEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A913F998);
}

uint64_t sub_1A913F998(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for BatchEvent.Event(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1A913FA40()
{
  sub_1A913DA28();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for BatchEvent.Metadata()
{
  return &type metadata for BatchEvent.Metadata;
}

ValueMetadata *type metadata accessor for BatchEvent.PrivateMetadata()
{
  return &type metadata for BatchEvent.PrivateMetadata;
}

uint64_t *initializeBufferWithCopyOfBuffer for BatchEvent.Event(uint64_t *a1, uint64_t *a2)
{
  sub_1A913DA28();
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
    uint64_t v7 = (int *)type metadata accessor for EventData();
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = v7[5];
      uint64_t v12 = (char *)a1 + v11;
      int v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1A916AC90();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      uint64_t v16 = v7[6];
      uint64_t v17 = (uint64_t *)((char *)a1 + v16);
      uint64_t v18 = (uint64_t *)((char *)a2 + v16);
      uint64_t v19 = v18[1];
      *uint64_t v17 = *v18;
      v17[1] = v19;
      uint64_t v20 = v7[7];
      uint64_t v21 = (uint64_t *)((char *)a1 + v20);
      uint64_t v22 = (uint64_t *)((char *)a2 + v20);
      uint64_t v23 = v22[1];
      void *v21 = *v22;
      v21[1] = v23;
      uint64_t v24 = v7[8];
      uint64_t v25 = (uint64_t *)((char *)a1 + v24);
      uint64_t v26 = (uint64_t *)((char *)a2 + v24);
      uint64_t v27 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v27;
      uint64_t v28 = *(void (**)(uint64_t *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for BatchEvent.Event(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventData();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 20);
    uint64_t v5 = sub_1A916AC90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for BatchEvent.Event(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for EventData();
  uint64_t v5 = *((void *)v4 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v5 + 48))(a2, 1, v4))
  {
    sub_1A913DA28();
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = v4[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A916AC90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = v4[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v4[7];
    uint64_t v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v4[8];
    uint64_t v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = *(void (**)(void *, void, uint64_t, int *))(v5 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for BatchEvent.Event(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for EventData();
  uint64_t v5 = *((void *)v4 - 1);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, int *))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v26 = v4[5];
      uint64_t v27 = (char *)a1 + v26;
      uint64_t v28 = (char *)a2 + v26;
      uint64_t v29 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24))(v27, v28, v29);
      uint64_t v30 = v4[6];
      uint64_t v31 = (void *)((char *)a1 + v30);
      uint64_t v32 = (void *)((char *)a2 + v30);
      *uint64_t v31 = *v32;
      v31[1] = v32[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v33 = v4[7];
      uint64_t v34 = (void *)((char *)a1 + v33);
      uint64_t v35 = (void *)((char *)a2 + v33);
      *uint64_t v34 = *v35;
      v34[1] = v35[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v36 = v4[8];
      id v37 = (void *)((char *)a1 + v36);
      uint64_t v38 = (void *)((char *)a2 + v36);
      *id v37 = *v38;
      v37[1] = v38[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A913F468((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1A913DA28();
    memcpy(a1, a2, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v9 = v4[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1A916AC90();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  uint64_t v14 = v4[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = v4[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  uint64_t v20 = v4[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  uint64_t v23 = *(void (**)(void *, void, uint64_t, int *))(v5 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(a1, 0, 1, v4);
  return a1;
}

_OWORD *initializeWithTake for BatchEvent.Event(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4 = (int *)type metadata accessor for EventData();
  uint64_t v5 = *((void *)v4 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v5 + 48))(a2, 1, v4))
  {
    sub_1A913DA28();
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = v4[5];
    int v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1A916AC90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
    *(_OWORD *)((char *)a1 + v4[7]) = *(_OWORD *)((char *)a2 + v4[7]);
    *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for BatchEvent.Event(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for EventData();
  uint64_t v5 = *((void *)v4 - 1);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, int *))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRelease();
      uint64_t v16 = v4[5];
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
      uint64_t v20 = v4[6];
      uint64_t v21 = (void *)((char *)a1 + v20);
      uint64_t v22 = (void *)((char *)a2 + v20);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      void *v21 = v24;
      v21[1] = v23;
      swift_bridgeObjectRelease();
      uint64_t v25 = v4[7];
      uint64_t v26 = (void *)((char *)a1 + v25);
      uint64_t v27 = (void *)((char *)a2 + v25);
      uint64_t v29 = *v27;
      uint64_t v28 = v27[1];
      void *v26 = v29;
      v26[1] = v28;
      swift_bridgeObjectRelease();
      uint64_t v30 = v4[8];
      uint64_t v31 = (void *)((char *)a1 + v30);
      uint64_t v32 = (void *)((char *)a2 + v30);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      *uint64_t v31 = v34;
      v31[1] = v33;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1A913F468((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for EventData);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    sub_1A913DA28();
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v9 = v4[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  *(_OWORD *)((char *)a1 + v4[7]) = *(_OWORD *)((char *)a2 + v4[7]);
  *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
  (*(void (**)(void *, void, uint64_t, int *))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchEvent.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A914067C);
}

uint64_t sub_1A914067C(uint64_t a1, uint64_t a2)
{
  sub_1A913DA28();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BatchEvent.Event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A91406FC);
}

uint64_t sub_1A91406FC(uint64_t a1, uint64_t a2)
{
  sub_1A913DA28();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1A914076C()
{
  sub_1A913DA28();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for BatchEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A91408C4);
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

ValueMetadata *type metadata accessor for BatchEvent.CodingKeys()
{
  return &type metadata for BatchEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for BatchEvent.Event.CodingKeys()
{
  return &type metadata for BatchEvent.Event.CodingKeys;
}

ValueMetadata *type metadata accessor for BatchEvent.PrivateMetadata.CodingKeys()
{
  return &type metadata for BatchEvent.PrivateMetadata.CodingKeys;
}

unsigned char *_s12AppAnalytics10BatchEventV5EventV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A91409BCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BatchEvent.Metadata.CodingKeys()
{
  return &type metadata for BatchEvent.Metadata.CodingKeys;
}

unint64_t sub_1A91409F8()
{
  unint64_t result = qword_1E97B1AD0;
  if (!qword_1E97B1AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AD0);
  }
  return result;
}

unint64_t sub_1A9140A50()
{
  unint64_t result = qword_1E97B1AD8;
  if (!qword_1E97B1AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AD8);
  }
  return result;
}

unint64_t sub_1A9140AA8()
{
  unint64_t result = qword_1E97B1AE0;
  if (!qword_1E97B1AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AE0);
  }
  return result;
}

unint64_t sub_1A9140B00()
{
  unint64_t result = qword_1E97B1AE8;
  if (!qword_1E97B1AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1AE8);
  }
  return result;
}

unint64_t sub_1A9140B58()
{
  unint64_t result = qword_1EB686E10;
  if (!qword_1EB686E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E10);
  }
  return result;
}

unint64_t sub_1A9140BB0()
{
  unint64_t result = qword_1EB686E08;
  if (!qword_1EB686E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E08);
  }
  return result;
}

unint64_t sub_1A9140C08()
{
  unint64_t result = qword_1EB686D88;
  if (!qword_1EB686D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686D88);
  }
  return result;
}

unint64_t sub_1A9140C60()
{
  unint64_t result = qword_1EB686D80;
  if (!qword_1EB686D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686D80);
  }
  return result;
}

unint64_t sub_1A9140CB8()
{
  unint64_t result = qword_1EB686CE0;
  if (!qword_1EB686CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686CE0);
  }
  return result;
}

unint64_t sub_1A9140D10()
{
  unint64_t result = qword_1EB686CD8;
  if (!qword_1EB686CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686CD8);
  }
  return result;
}

unint64_t sub_1A9140D68()
{
  unint64_t result = qword_1EB686E28;
  if (!qword_1EB686E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E28);
  }
  return result;
}

unint64_t sub_1A9140DC0()
{
  unint64_t result = qword_1EB686E20;
  if (!qword_1EB686E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686E20);
  }
  return result;
}

uint64_t sub_1A9140E14(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x80000001A917A170)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1A9140E9C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4D65746176697270 && a2 == 0xEF61746164617465 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *assignWithCopy for EventMirrorProperty(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EventMirrorProperty(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for EventMirrorProperty()
{
  return &type metadata for EventMirrorProperty;
}

uint64_t EventProcessorType.resumeBackgroundProcessing(forIdentifier:completion:)()
{
  return 0;
}

uint64_t dispatch thunk of EventProcessorType.process<A>(processEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of EventProcessorType.didEnterGroup(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EventProcessorType.didLeaveGroup(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of EventProcessorType.didStartSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of EventProcessorType.didUpdateSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of EventProcessorType.didUpdateSession(_:submitEventQueues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of EventProcessorType.didEndSession(_:endDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of EventProcessorType.resumeBackgroundProcessing(forIdentifier:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t TrackerError.MissingData.key.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrackerError.MissingData.type.getter()
{
  return *(void *)(v0 + 16);
}

BOOL static TrackerError.MissingData.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_1A916B9E0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

BOOL sub_1A9141238(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_1A916B9E0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t TrackerError.FoundData.key.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrackerError.FoundData.data.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A90A24B0(v1 + 16, a1);
}

uint64_t static TrackerError.FoundData.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1A916B9E0();
  }
}

uint64_t sub_1A9141300(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1A916B9E0();
  }
}

uint64_t static TrackerError.== infix(_:_:)(uint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = *a2;
  switch(v4)
  {
    case 0:
      return !v5;
    case 1:
      return v5 == 1;
    case 2:
      return v5 == 2;
  }
  if (v5 < 3) {
    return 0;
  }
  uint64_t v7 = a2[1];
  uint64_t v8 = a1[1];
  if ((sub_1A91132A0(v4, v5) & 1) == 0) {
    return 0;
  }

  return sub_1A9113354(v8, v7);
}

uint64_t sub_1A91413D4(uint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = *a2;
  switch(v4)
  {
    case 0:
      return v5 == 0;
    case 1:
      return v5 == 1;
    case 2:
      return v5 == 2;
  }
  if (v5 < 3) {
    return 0;
  }
  uint64_t v8 = a2[1];
  uint64_t v9 = a1[1];
  if ((sub_1A91132A0(v4, v5) & 1) == 0) {
    return 0;
  }

  return sub_1A9113354(v9, v8);
}

unint64_t destroy for TrackerError(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s12AppAnalytics12TrackerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t *assignWithCopy for TrackerError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = v5;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TrackerError(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  a1[1] = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrackerError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for TrackerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
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
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

void *sub_1A91416FC(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for TrackerError()
{
  return &type metadata for TrackerError;
}

uint64_t initializeBufferWithCopyOfBuffer for TrackerError.MissingData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TrackerError.MissingData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for TrackerError.MissingData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for TrackerError.MissingData()
{
  return &type metadata for TrackerError.MissingData;
}

void *initializeWithCopy for TrackerError.FoundData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unsigned int v4 = a2 + 2;
  uint64_t v5 = a2[5];
  a1[5] = v5;
  char v6 = **(void (***)(void *, void *, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v6(a1 + 2, v4, v5);
  return a1;
}

void *assignWithCopy for TrackerError.FoundData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_0(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for TrackerError.FoundData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

ValueMetadata *type metadata accessor for TrackerError.FoundData()
{
  return &type metadata for TrackerError.FoundData;
}

uint64_t sub_1A9141B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1A9141B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void sub_1A9141B9C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1;
    uint64_t v31 = MEMORY[0x1E4FBC860];
    sub_1A90B29D0(0, v1, 0);
    uint64_t v4 = sub_1A9143D68(v2);
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 64;
    uint64_t v25 = v2 + 80;
    int64_t v26 = v1;
    int v27 = v3;
    uint64_t v28 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(v2 + 32))
    {
      unint64_t v9 = (unint64_t)v4 >> 6;
      if ((*(void *)(v6 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_23;
      }
      if (*(_DWORD *)(v2 + 36) != v3) {
        goto LABEL_24;
      }
      uint64_t v29 = v5;
      uint64_t v10 = (uint64_t *)(*(void *)(v2 + 56) + 32 * v4);
      uint64_t v11 = v10[1];
      uint64_t v30 = *v10;
      uint64_t v12 = v10[2];
      uint64_t v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_1A91658A0(v13, v12);
      uint64_t v15 = v14;
      uint64_t v16 = v2;
      unint64_t v18 = *(void *)(v31 + 16);
      unint64_t v17 = *(void *)(v31 + 24);
      if (v18 >= v17 >> 1) {
        sub_1A90B29D0(v17 > 1, v18 + 1, 1);
      }
      *(void *)(v31 + 16) = v18 + 1;
      uint64_t v19 = (void *)(v31 + 24 * v18);
      v19[4] = v30;
      v19[5] = v11;
      v19[6] = v15;
      int64_t v7 = 1 << *(unsigned char *)(v16 + 32);
      if (v4 >= v7) {
        goto LABEL_25;
      }
      uint64_t v6 = v28;
      uint64_t v20 = *(void *)(v28 + 8 * v9);
      if ((v20 & (1 << v4)) == 0) {
        goto LABEL_26;
      }
      uint64_t v2 = v16;
      int v3 = v27;
      if (*(_DWORD *)(v16 + 36) != v27) {
        goto LABEL_27;
      }
      unint64_t v21 = v20 & (-2 << (v4 & 0x3F));
      if (v21)
      {
        int64_t v7 = __clz(__rbit64(v21)) | v4 & 0xFFFFFFFFFFFFFFC0;
        int64_t v8 = v26;
      }
      else
      {
        unint64_t v22 = v9 + 1;
        unint64_t v23 = (unint64_t)(v7 + 63) >> 6;
        int64_t v8 = v26;
        if (v9 + 1 < v23)
        {
          unint64_t v24 = *(void *)(v28 + 8 * v22);
          if (v24)
          {
LABEL_20:
            int64_t v7 = __clz(__rbit64(v24)) + (v22 << 6);
          }
          else
          {
            while (v23 - 2 != v9)
            {
              unint64_t v24 = *(void *)(v25 + 8 * v9++);
              if (v24)
              {
                unint64_t v22 = v9 + 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
      uint64_t v5 = v29 + 1;
      uint64_t v4 = v7;
      if (v29 + 1 == v8) {
        return;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
}

uint64_t sub_1A9141DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A9144238(0, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v6 - 8);
  int64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = sub_1A916AC90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v36 = (char *)&v35 - v14;
  uint64_t v15 = type metadata accessor for SummaryEventDatabaseManager.StorageOptions(0);
  MEMORY[0x1F4188790](v15 - 8);
  unint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lock;
  sub_1A913BC3C();
  uint64_t v19 = swift_allocObject();
  *(_DWORD *)(v19 + 16) = 0;
  *(void *)(a3 + v18) = v19;
  uint64_t v37 = a2;
  sub_1A909708C(a2, (uint64_t)v17, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  type metadata accessor for SummaryEventDatabaseManager(0);
  swift_allocObject();
  *(void *)(a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_databaseManager) = sub_1A913A1B8((uint64_t)v17);
  char v20 = *(unsigned char *)(a1 + 8);
  uint64_t v21 = a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_flushCadence;
  *(void *)uint64_t v21 = *(void *)a1;
  *(unsigned char *)(v21 + 8) = v20;
  uint64_t v38 = a1;
  sub_1A909708C(a1, a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_configuration, type metadata accessor for SummaryEventConfiguration);
  unint64_t v22 = (uint64_t (**)())(a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_dateGenerator);
  *unint64_t v22 = sub_1A910ADD0;
  v22[1] = 0;
  unint64_t v23 = self;
  id v24 = objc_msgSend(v23, sel_standardUserDefaults);
  uint64_t v25 = (void *)sub_1A916AF60();
  id v26 = objc_msgSend(v24, sel_objectForKey_, v25);

  if (v26)
  {
    sub_1A916B5F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v39, 0, sizeof(v39));
  }
  sub_1A909374C((uint64_t)v39, (uint64_t)v40);
  if (!v41)
  {
    sub_1A909B5DC((uint64_t)v40);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_8;
  }
  int v27 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, v27 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_8:
    sub_1A914428C((uint64_t)v8, (unint64_t *)&qword_1EB68ACF0, MEMORY[0x1E4F27928]);
    sub_1A916AC80();
    uint64_t v30 = a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate, v13, v9);
    id v31 = objc_msgSend(v23, sel_standardUserDefaults);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v30, v9);
    uint64_t v32 = (void *)sub_1A916AC10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v33 = (void *)sub_1A916AF60();
    objc_msgSend(v31, sel_setObject_forKey_, v32, v33);

    sub_1A9143C88(v37, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
    sub_1A9143C88(v38, type metadata accessor for SummaryEventConfiguration);
    return a3;
  }
  sub_1A9143C88(v37, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  sub_1A9143C88(v38, type metadata accessor for SummaryEventConfiguration);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v29 = v36;
  v28(v36, v8, v9);
  v28((char *)(a3 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate), v29, v9);
  return a3;
}

uint64_t sub_1A914233C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_1A9143DF0(a1, a2, a3, a4);
  if (result)
  {
    sub_1A914250C(a2);
    if (qword_1EB688700 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1A916AD50();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EB68D970);
    uint64_t v7 = sub_1A916AD40();
    os_log_type_t v8 = sub_1A916B3D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v11 = sub_1A916BBB0();
      sub_1A90DCF6C(v11, v12, &v13);
      sub_1A916B5A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9088000, v7, v8, "Recording event: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0EECA0](v10, -1, -1);
      MEMORY[0x1AD0EECA0](v9, -1, -1);
    }

    return sub_1A913ACCC();
  }
  return result;
}

uint64_t sub_1A914250C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v94 = a1;
  sub_1A9143B24();
  uint64_t v87 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v88 = (uint64_t)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A916AE70();
  uint64_t v90 = *(void *)(v5 - 8);
  uint64_t v91 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v89 = (void (**)(char *, uint64_t, uint64_t))((char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v95 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v95 - 8);
  MEMORY[0x1F4188790](v95);
  v93 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v80 - v10;
  sub_1A9144238(0, &qword_1E97B1AF8, (void (*)(uint64_t))type metadata accessor for SummaryEventData);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v80 - v13;
  uint64_t v15 = type metadata accessor for SummaryEventData();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v92 = (uint8_t *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB688700 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1A916AD50();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1EB68D970);
  char v20 = sub_1A916AD40();
  os_log_type_t v21 = sub_1A916B3D0();
  if (os_log_type_enabled(v20, v21))
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v22 = 0;
    _os_log_impl(&dword_1A9088000, v20, v21, "Checking for possibility of saving summary events now...", v22, 2u);
    MEMORY[0x1AD0EECA0](v22, -1, -1);
  }

  if (sub_1A9143080() & 1) == 0 || (uint64_t v23 = sub_1A91435A8(), (v24))
  {
    uint64_t v39 = sub_1A916AD40();
    os_log_type_t v40 = sub_1A916B3D0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_1A9088000, v39, v40, "It's not yet time to persist summary events ... skipping.", v41, 2u);
      MEMORY[0x1AD0EECA0](v41, -1, -1);
    }

    return 0;
  }
  uint64_t v84 = v16;
  uint64_t v25 = v23;
  uint64_t v85 = v19;
  id v26 = sub_1A916AD40();
  os_log_type_t v27 = sub_1A916B3D0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = v2;
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_1A9088000, v26, v27, "Time threshold reached, generating summary event data ...", v29, 2u);
    uint64_t v30 = v29;
    uint64_t v2 = v28;
    MEMORY[0x1AD0EECA0](v30, -1, -1);
  }

  uint64_t v31 = v2 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
  swift_beginAccess();
  uint64_t v86 = v7;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v81 = v31;
  uint64_t v33 = v95;
  v32(v11, v31, v95);
  uint64_t v83 = v2;
  uint64_t v82 = *(void (**)(char *, uint64_t, uint64_t))(v2
                                                        + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_databaseManager);
  uint64_t v34 = swift_bridgeObjectRetain();
  sub_1A9141B9C(v34);
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void *)(v36 + 16);
  unint64_t v80 = v32;
  if (v37)
  {
    v32(v14, (uint64_t)v11, v33);
    type metadata accessor for SummaryEventMetaData();
    sub_1A916AC00();
    *(void *)&v14[*(int *)(v15 + 20)] = v36;
    *(void *)&v14[*(int *)(v15 + 24)] = v25;
    uint64_t v38 = v84;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v38 = v84;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v14, 1, 1, v15);
    swift_bridgeObjectRelease();
  }
  unint64_t v43 = *(void (**)(char *, uint64_t))(v86 + 8);
  uint64_t v44 = v86 + 8;
  v43(v11, v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v14, 1, v15) == 1)
  {
    uint64_t v86 = v44;
    sub_1A914428C((uint64_t)v14, &qword_1E97B1AF8, (void (*)(uint64_t))type metadata accessor for SummaryEventData);
    swift_retain_n();
    uint64_t v45 = sub_1A916AD40();
    os_log_type_t v46 = sub_1A916B3D0();
    if (os_log_type_enabled(v45, v46))
    {
      id v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      *(void *)&v96[0] = v94;
      *(_DWORD *)id v47 = 136315138;
      uint64_t v92 = v47 + 4;
      uint64_t v48 = v93;
      uint64_t v49 = v95;
      v80(v93, v81, v95);
      sub_1A9097688((unint64_t *)&qword_1EB689710, MEMORY[0x1E4F27928]);
      uint64_t v50 = sub_1A916B990();
      unint64_t v52 = v51;
      v43(v48, v49);
      uint64_t v97 = sub_1A90DCF6C(v50, v52, (uint64_t *)v96);
      sub_1A916B5A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9088000, v45, v46, "No summarized events, skipping upload, and reseting last submitted date: %s to now...", v47, 0xCu);
      uint64_t v53 = v94;
      swift_arrayDestroy();
      MEMORY[0x1AD0EECA0](v53, -1, -1);
      MEMORY[0x1AD0EECA0](v47, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    sub_1A91436DC();
    return 0;
  }
  uint64_t v54 = (uint64_t)v92;
  sub_1A9143BE0((uint64_t)v14, (uint64_t)v92);
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v56 = v95;
  if (Strong)
  {
    uint64_t v57 = v95;
    uint64_t v58 = v54;
    uint64_t v86 = 0;
    uint64_t v59 = *(void **)(*(void *)(Strong + 80) + OBJC_IVAR___AAAccessQueue_queue);
    unint64_t v60 = v89;
    uint64_t v61 = v90;
    *uint64_t v89 = v59;
    uint64_t v62 = v91;
    (*(void (**)(void *, void, uint64_t))(v61 + 104))(v60, *MEMORY[0x1E4FBCBF0], v91);
    id v63 = v59;
    LOBYTE(v59) = sub_1A916AE90();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v61 + 8))(v60, v62);
    if ((v59 & 1) == 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v54 = v58;
    uint64_t v64 = v88;
    sub_1A909708C(v58, v88, (uint64_t (*)(void))type metadata accessor for SummaryEventData);
    uint64_t v65 = v87;
    long long v66 = (void *)(v64 + *(int *)(v87 + 36));
    *long long v66 = 0xD000000000000010;
    v66[1] = 0x80000001A917A290;
    *(unsigned char *)(v64 + *(int *)(v65 + 40)) = 0;
    sub_1A90EF9BC(v64, MEMORY[0x1E4FBC860], 0xD000000000000066, 0x80000001A917A220, 134);
    swift_release();
    sub_1A9143C88(v64, (uint64_t (*)(void))sub_1A9143B24);
    uint64_t v56 = v57;
  }
  memset(v96, 0, sizeof(v96));
  uint64_t v67 = swift_weakLoadStrong();
  if (v67)
  {
    uint64_t v68 = *(void *)(v67 + 96);
    swift_retain();
    uint64_t v69 = (uint64_t)v93;
    sub_1A916AC80();
    sub_1A90E0E04((uint64_t)&type metadata for SummaryEvent, v68, 0, v69, (uint64_t)v96, 0, 0);
    swift_release();
    swift_release();
    v43((char *)v69, v56);
  }
  sub_1A909B5DC((uint64_t)v96);
  id v70 = sub_1A916AD40();
  os_log_type_t v71 = sub_1A916B3D0();
  if (os_log_type_enabled(v70, v71))
  {
    long long v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v72 = 0;
    _os_log_impl(&dword_1A9088000, v70, v71, "Writing summary events to disk...", v72, 2u);
    MEMORY[0x1AD0EECA0](v72, -1, -1);
  }

  id v73 = v82;
  MEMORY[0x1F4188790](v74);
  *(&v80 - 2) = (void (*)(char *, uint64_t, uint64_t))sub_1A9143C44;
  *(&v80 - 1) = v73;
  uint64_t v76 = v75 + 4;
  os_unfair_lock_lock(v75 + 4);
  sub_1A9143C60();
  os_unfair_lock_unlock(v76);
  sub_1A913AF28();
  sub_1A91436DC();
  uint64_t v77 = sub_1A916AD40();
  os_log_type_t v78 = sub_1A916B3D0();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v79 = 0;
    _os_log_impl(&dword_1A9088000, v77, v78, "Successfully wrote summary events!", v79, 2u);
    MEMORY[0x1AD0EECA0](v79, -1, -1);
  }

  sub_1A9143C88(v54, (uint64_t (*)(void))type metadata accessor for SummaryEventData);
  return 1;
}

uint64_t sub_1A9143080()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v45 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v45 - v5;
  if (qword_1EB688700 != -1) {
    swift_once();
  }
  uint64_t v46 = v0;
  uint64_t v7 = sub_1A916AD50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB68D970);
  uint64_t v8 = sub_1A916AD40();
  os_log_type_t v9 = sub_1A916B3D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A9088000, v8, v9, "About to determine if it's time to submit our summary events...", v10, 2u);
    MEMORY[0x1AD0EECA0](v10, -1, -1);
  }

  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_standardUserDefaults);
  uint64_t v13 = (void *)sub_1A916AF60();
  unsigned __int8 v14 = objc_msgSend(v12, sel_BOOLForKey_, v13);

  if (v14)
  {
    id v15 = objc_msgSend(v11, sel_standardUserDefaults);
    uint64_t v16 = (void *)sub_1A916AF60();
    objc_msgSend(v15, sel_removeObjectForKey_, v16);

    uint64_t v17 = sub_1A916AD40();
    os_log_type_t v18 = sub_1A916B3D0();
    if (!os_log_type_enabled(v17, v18))
    {
LABEL_9:

      return 1;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    char v20 = "We have an override; force returning true for time to submit.";
    os_log_type_t v21 = v17;
    os_log_type_t v22 = v18;
    uint64_t v23 = v19;
    uint32_t v24 = 2;
LABEL_8:
    _os_log_impl(&dword_1A9088000, v21, v22, v20, v23, v24);
    MEMORY[0x1AD0EECA0](v19, -1, -1);
    goto LABEL_9;
  }
  uint64_t v26 = v46;
  *(double *)&uint64_t v27 = COERCE_DOUBLE(sub_1A91435A8());
  if (v28)
  {
    uint64_t v17 = sub_1A916AD40();
    os_log_type_t v44 = sub_1A916B3D0();
    if (os_log_type_enabled(v17, v44))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      os_log_type_t v40 = "Undetermined summary event time interval, feature likely has a .disabled configuration";
      uint64_t v41 = v17;
      os_log_type_t v39 = v44;
      unint64_t v42 = v38;
      uint32_t v43 = 2;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v29 = v27;
    double v30 = *(double *)&v27;
    (*(void (**)(void))(v26 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_dateGenerator))();
    uint64_t v31 = v26 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
    swift_beginAccess();
    uint64_t v32 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v3, v31, v1);
    sub_1A916ABF0();
    double v34 = v33;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v3, v1);
    v35(v6, v1);
    uint64_t v17 = sub_1A916AD40();
    os_log_type_t v36 = sub_1A916B3D0();
    BOOL v37 = os_log_type_enabled(v17, v36);
    if (v34 >= v30)
    {
      if (!v37) {
        goto LABEL_9;
      }
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134218240;
      double v47 = v34;
      sub_1A916B5A0();
      *((_WORD *)v19 + 6) = 2048;
      double v47 = *(double *)&v29;
      sub_1A916B5A0();
      os_log_type_t v22 = v36;
      char v20 = "Enough time has elapsed. It's time to submit. timeIntervalSinceLastFlush=%f, timeIntervalBetweenFlushes=%f";
      os_log_type_t v21 = v17;
      uint64_t v23 = v19;
      uint32_t v24 = 22;
      goto LABEL_8;
    }
    if (v37)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134218240;
      double v47 = v34;
      sub_1A916B5A0();
      *((_WORD *)v38 + 6) = 2048;
      double v47 = *(double *)&v29;
      sub_1A916B5A0();
      os_log_type_t v39 = v36;
      os_log_type_t v40 = "It's not yet time to submit. timeIntervalSinceLastFlush=%f, timeIntervalBetweenFlushes=%f";
      uint64_t v41 = v17;
      unint64_t v42 = v38;
      uint32_t v43 = 22;
LABEL_16:
      _os_log_impl(&dword_1A9088000, v41, v39, v40, v42, v43);
      MEMORY[0x1AD0EECA0](v38, -1, -1);
    }
  }

  return 0;
}

uint64_t sub_1A91435A8()
{
  id v1 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v2 = (void *)sub_1A916AF60();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1A916B5F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1A909374C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_1A909B5DC((uint64_t)v7);
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_flushCadence + 8)) {
    return 0;
  }
  else {
    return *(void *)(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_flushCadence);
  }
}

void sub_1A91436DC()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(double))(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_dateGenerator))(v3);
  uint64_t v6 = v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 40))(v6, v5, v1);
  swift_endAccess();
  id v7 = objc_msgSend(self, sel_standardUserDefaults);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  uint64_t v8 = (void *)sub_1A916AC10();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  os_log_type_t v9 = (void *)sub_1A916AF60();
  objc_msgSend(v7, sel_setObject_forKey_, v8, v9);
}

uint64_t sub_1A914389C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_lastSubmittedDate;
  uint64_t v2 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  sub_1A9143C88(v0 + OBJC_IVAR____TtC12AppAnalytics19SummaryEventManager_configuration, type metadata accessor for SummaryEventConfiguration);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1A9143994()
{
  return type metadata accessor for SummaryEventManager();
}

uint64_t type metadata accessor for SummaryEventManager()
{
  uint64_t result = qword_1EB688628;
  if (!qword_1EB688628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A91439E8()
{
  uint64_t result = sub_1A916AC90();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SummaryEventConfiguration(319);
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

uint64_t sub_1A9143AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A914233C(a1, a2, a3, a4);
}

uint64_t sub_1A9143AFC(uint64_t a1)
{
  return sub_1A914250C(a1) & 1;
}

void sub_1A9143B24()
{
  if (!qword_1E97B1648)
  {
    type metadata accessor for SummaryEventData();
    sub_1A9097688(&qword_1EB687730, (void (*)(uint64_t))type metadata accessor for SummaryEventData);
    unint64_t v0 = type metadata accessor for PushEvent();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E97B1648);
    }
  }
}

uint64_t sub_1A9143BB8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1A9143BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9143C44()
{
  return sub_1A913B404(v0);
}

uint64_t sub_1A9143C60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A9143C88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A9143CE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1A9143D10(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_1A916B5A0();
  *a1 = v5;
  return result;
}

uint64_t sub_1A9143D68(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  os_log_type_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1A9143DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4) & 1) != 0
    && ((sub_1A9095B68((char *)&v29), v29 == 2) || (v29 & 1) != 0))
  {
    if (qword_1EB688798 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A916AD50();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB68D9C0);
    id v15 = sub_1A916AD40();
    os_log_type_t v16 = sub_1A916B3D0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v29 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v19 = sub_1A916BBB0();
      uint64_t v28 = sub_1A90DCF6C(v19, v20, &v29);
      sub_1A916B5A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9088000, v15, v16, "Discarding D&U-only summary event: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0EECA0](v18, -1, -1);
      MEMORY[0x1AD0EECA0](v17, -1, -1);
    }
  }
  else
  {
    sub_1A91140D0(&v29);
    if (v29) {
      uint64_t v5 = v29;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4FBC870];
    }
    type metadata accessor for DenylistDescriptorMatcher();
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 16) = v5;
    uint64_t v28 = a1;
    swift_getMetatypeMetadata();
    uint64_t v7 = sub_1A916AFE0();
    uint64_t v9 = v8;
    sub_1A909B7D8(0, (unint64_t *)&qword_1EB686760, (uint64_t)&type metadata for DenylistDescriptor, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A916E200;
    *(void *)(v10 + 32) = 42;
    *(void *)(v10 + 40) = 0xE100000000000000;
    *(void *)(v10 + 48) = 42;
    *(void *)(v10 + 56) = 0xE100000000000000;
    *(void *)(v10 + 64) = 42;
    *(void *)(v10 + 72) = 0xE100000000000000;
    *(void *)(v10 + 80) = v7;
    *(void *)(v10 + 88) = v9;
    *(void *)(v10 + 96) = 42;
    *(void *)(v10 + 104) = 0xE100000000000000;
    *(void *)(v10 + 112) = 42;
    *(void *)(v10 + 120) = 0xE100000000000000;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1A9139678(v10);
    swift_setDeallocating();
    swift_arrayDestroy();
    char v12 = sub_1A910A860(v11, *(void *)(inited + 16));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (qword_1EB688798 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1A916AD50();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EB68D9C0);
    os_log_type_t v22 = sub_1A916AD40();
    os_log_type_t v23 = sub_1A916B3D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint32_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v28 = v25;
      *(_DWORD *)uint32_t v24 = 136315138;
      uint64_t v26 = sub_1A916BBB0();
      sub_1A90DCF6C(v26, v27, &v28);
      sub_1A916B5A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9088000, v22, v23, "Failed privacy validation for summary event: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0EECA0](v25, -1, -1);
      MEMORY[0x1AD0EECA0](v24, -1, -1);
    }

    swift_release();
  }
  return 0;
}

void sub_1A9144238(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A916B540();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A914428C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1A9144238(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1A91442E8()
{
  uint64_t v41 = type metadata accessor for SessionManager.SessionState(0);
  MEMORY[0x1F4188790](v41);
  uint64_t v46 = (void *)((char *)v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = sub_1A916AE70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (void *)((char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v45 = v0;
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = OBJC_IVAR___AAAccessQueue_queue;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR___AAAccessQueue_queue);
  void *v5 = v8;
  uint64_t v9 = *MEMORY[0x1E4FBCBF0];
  uint64_t v10 = v3 + 104;
  uint64_t v11 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v11(v5, v9, v2);
  id v12 = v8;
  LOBYTE(v8) = sub_1A916AE90();
  id v15 = *(void (**)(void *, uint64_t))(v3 + 8);
  uint64_t v14 = v3 + 8;
  unint64_t v13 = (unint64_t)v15;
  v15(v5, v2);
  if ((v8 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  os_log_type_t v16 = *(void **)(v6 + v7);
  void *v5 = v16;
  v11(v5, v9, v2);
  id v17 = v16;
  LOBYTE(v16) = sub_1A916AE90();
  unint64_t v42 = v5;
  uint32_t v43 = (void (*)(unint64_t, uint64_t))v13;
  ((void (*)(void *, uint64_t))v13)(v5, v2);
  if ((v16 & 1) == 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_1A916B7E0();
    uint64_t v18 = result;
    if (result) {
      goto LABEL_5;
    }
LABEL_28:
    os_log_type_t v44 = (void *)MEMORY[0x1E4FBC860];
LABEL_29:
    swift_bridgeObjectRelease_n();
    uint64_t v38 = sub_1A90B83F8((uint64_t)v44);
    swift_bridgeObjectRelease();
    return v38;
  }
  unint64_t v13 = *(void *)(v45 + 56);
  if (v13 >> 62) {
    goto LABEL_27;
  }
  uint64_t v18 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v18) {
    goto LABEL_28;
  }
LABEL_5:
  if (v18 >= 1)
  {
    v39[1] = v10;
    uint64_t v40 = v2;
    uint64_t v10 = 0;
    unint64_t v45 = v13 & 0xC000000000000001;
    os_log_type_t v44 = (void *)MEMORY[0x1E4FBC860];
    v39[0] = v18;
    while (1)
    {
      if (v45) {
        MEMORY[0x1AD0EDEF0](v10, v13);
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      if (Strong)
      {
        uint64_t v21 = Strong;
        os_log_type_t v22 = (void (*)(void, void))v13;
        os_log_type_t v23 = *(void **)(*(void *)(Strong + 48) + OBJC_IVAR___AAAccessQueue_queue);
        uint32_t v24 = v42;
        *unint64_t v42 = v23;
        uint64_t v2 = v9;
        uint64_t v25 = v9;
        uint64_t v9 = v14;
        uint64_t v26 = v40;
        v11(v24, v25, v40);
        id v27 = v23;
        unint64_t v13 = (unint64_t)v24;
        LOBYTE(v24) = sub_1A916AE90();
        uint64_t v28 = v26;
        uint64_t v14 = v9;
        v43(v13, v28);
        if ((v24 & 1) == 0)
        {
          __break(1u);
          goto LABEL_25;
        }
        uint64_t v29 = v21 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_state;
        swift_beginAccess();
        sub_1A9098E08(v29, (uint64_t)v46, type metadata accessor for SessionManager.SessionState);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload)
        {
          uint64_t v9 = v2;
          if (EnumCaseMultiPayload == 1) {
            sub_1A9146560((uint64_t)v46, type metadata accessor for SessionManager.SessionState);
          }
          swift_release();
          swift_release();
        }
        else
        {
          uint64_t v31 = *v46;
          swift_release();
          uint64_t v33 = *(void *)(v31 + 16);
          uint64_t v32 = *(void *)(v31 + 24);
          swift_bridgeObjectRetain();
          swift_release();
          swift_release();
          uint64_t v9 = v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            os_log_type_t v44 = sub_1A9093AE4(0, v44[2] + 1, 1, v44);
          }
          unint64_t v35 = v44[2];
          unint64_t v34 = v44[3];
          if (v35 >= v34 >> 1) {
            os_log_type_t v44 = sub_1A9093AE4((void *)(v34 > 1), v35 + 1, 1, v44);
          }
          os_log_type_t v36 = v44;
          v44[2] = v35 + 1;
          BOOL v37 = &v36[2 * v35];
          v37[4] = v33;
          v37[5] = v32;
        }
        unint64_t v13 = (unint64_t)v22;
        uint64_t v18 = v39[0];
      }
      else
      {
        swift_release();
      }
      if (v18 == ++v10) {
        goto LABEL_29;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t AppSessionManager.wasPriorSessionCrashDetected.getter()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  __swift_project_boxed_opaque_existential_1(v0 + 8, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2) & 1;
}

void *AppSessionManager.__allocating_init(accessQueue:)(void *a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  v2[5] = 0;
  v2[6] = 0;
  v2[7] = MEMORY[0x1E4FBC860];
  v2[2] = 0;
  v2[3] = a1;
  id v3 = a1;
  v2[4] = dispatch_group_create();
  if (qword_1EB688FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = qword_1EB688F98;
  v2[11] = type metadata accessor for CrashDetector();
  v2[12] = &protocol witness table for CrashDetector;
  v2[8] = v4;
  uint64_t v5 = qword_1EB6887D0;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for SummaryEventConfiguration(0);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB688098);
  sub_1A9098E08(v7, (uint64_t)v2 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);

  return v2;
}

void *AppSessionManager.init(accessQueue:)(void *a1)
{
  v1[5] = 0;
  v1[6] = 0;
  v1[7] = MEMORY[0x1E4FBC860];
  v1[2] = 0;
  v1[3] = a1;
  id v2 = a1;
  v1[4] = dispatch_group_create();
  if (qword_1EB688FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = qword_1EB688F98;
  v1[11] = type metadata accessor for CrashDetector();
  v1[12] = &protocol witness table for CrashDetector;
  v1[8] = v3;
  uint64_t v4 = qword_1EB6887D0;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for SummaryEventConfiguration(0);
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EB688098);
  sub_1A9098E08(v6, (uint64_t)v1 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);

  return v1;
}

void *AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:)(void *a1, void *a2, uint64_t a3)
{
  swift_allocObject();
  uint64_t v6 = sub_1A90ACBB8(a1, (uint64_t)a2, a3);

  return v6;
}

void *AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = *(void *)(a3 + 32);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  double v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v15 + 16))(v14, v12);
  os_log_type_t v16 = sub_1A9146130(a1, (uint64_t)a2, (uint64_t)v14, a4, v8, v9, v10);

  __swift_destroy_boxed_opaque_existential_0(a3);
  return v16;
}

void *AppSessionManager.init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = *(void *)(a3 + 32);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  double v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v15 + 16))(v14, v12);
  os_log_type_t v16 = sub_1A9146130(a1, (uint64_t)a2, (uint64_t)v14, a4, v4, v9, v10);

  __swift_destroy_boxed_opaque_existential_0(a3);
  return v16;
}

Swift::Void __swiftcall AppSessionManager.startAppSession(shouldCorrelateSceneSessions:)(Swift::Bool shouldCorrelateSceneSessions)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = shouldCorrelateSceneSessions;
  *(void *)(v4 + 24) = v1;
  swift_retain();
  sub_1A908CAA8(v3, (uint64_t)sub_1A91465C0, v4);

  swift_release();
}

uint64_t AppSessionManager.forEachSessionManager(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = (void *)swift_allocObject();
  _OWORD v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v5, (uint64_t)sub_1A91462C0, (uint64_t)v6);

  return swift_release();
}

uint64_t sub_1A9144E20(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v19 = a2;
  unint64_t v5 = sub_1A916AE70();
  uint64_t v6 = *(void *)(v5 - 8);
  double v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (void (**)(uint64_t, uint64_t))((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(char **)(a1 + 24);
  uint64_t v11 = *(void **)&v10[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v9 = v11;
  (*(void (**)(void *, void, unint64_t, double))(v6 + 104))(v9, *MEMORY[0x1E4FBCBF0], v5, v7);
  id v12 = v11;
  LOBYTE(v11) = sub_1A916AE90();
  (*(void (**)(void *, unint64_t))(v6 + 8))(v9, v5);
  if (v11)
  {
    unint64_t v5 = *(void *)(a1 + 56);
    if (!(v5 >> 62))
    {
      uint64_t v13 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain_n();
      if (v13) {
        goto LABEL_4;
      }
      return swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1A916B7E0();
  uint64_t v13 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_4:
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](i, v5);
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      if (Strong)
      {
        uint64_t v17 = Strong;
        uint64_t v18 = *(void *)(Strong + 16) + OBJC_IVAR____TtC12AppAnalytics7Tracker_diagnosticsConsentProvider;
        swift_retain();
        swift_retain();
        sub_1A9161F50(v10, v18, v19, a3, v17);
        swift_release();
      }
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t AppSessionManager.endAppSession(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v20 = a1;
  uint64_t v5 = sub_1A916AC90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v19 - v10;
  sub_1A916AC80();
  uint64_t v13 = v2 + 24;
  uint64_t v12 = *(void *)(v2 + 24);
  uint64_t v19 = *(void *)(v13 + 8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  unint64_t v14 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v14, v8, v5);
  uint64_t v17 = (void *)(v16 + v15);
  *uint64_t v17 = v20;
  v17[1] = a2;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v12, (uint64_t)sub_1A91463B8, v16);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_1A914522C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v71 = a3;
  uint64_t v72 = a4;
  uint64_t v82 = a2;
  uint64_t v5 = sub_1A916AE70();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (uint64_t *)((char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1EB689AA0;
  sub_1A90A6204(0, (unint64_t *)&qword_1EB68ACD8, (uint64_t (*)(uint64_t))sub_1A90A557C, MEMORY[0x1E4FBBE00]);
  uint64_t v70 = v10;
  uint64_t v11 = swift_allocObject();
  long long v69 = xmmword_1A916EF60;
  *(_OWORD *)(v11 + 16) = xmmword_1A916EF60;
  uint64_t v12 = a1[3];
  uint64_t v13 = OBJC_IVAR___AAAccessQueue_queue;
  uint64_t v81 = a1;
  uint64_t v79 = v12;
  unint64_t v14 = *(void **)(v12 + OBJC_IVAR___AAAccessQueue_queue);
  *uint64_t v8 = v14;
  unint64_t v16 = v6 + 104;
  unint64_t v15 = *(void (**)(void *))(v6 + 104);
  unsigned int v78 = *MEMORY[0x1E4FBCBF0];
  v15(v8);
  uint64_t v76 = (char *)(id)v9;
  id v17 = v14;
  LOBYTE(v9) = sub_1A916AE90();
  uint64_t v20 = *(void (**)(void *, uint64_t))(v6 + 8);
  uint64_t v18 = v6 + 8;
  uint64_t v19 = v20;
  v20(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v21 = v81[5];
  uint64_t v67 = v81 + 5;
  unint64_t v22 = v81[6];
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v68 = sub_1A90A67C0();
  *(void *)(v11 + 64) = v68;
  uint64_t v23 = 7104878;
  if (v22) {
    uint64_t v23 = v21;
  }
  unint64_t v24 = 0xE300000000000000;
  if (v22) {
    unint64_t v24 = v22;
  }
  *(void *)(v11 + 32) = v23;
  *(void *)(v11 + 40) = v24;
  swift_bridgeObjectRetain();
  sub_1A916B3D0();
  uint64_t v25 = v76;
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  uint64_t v76 = (char *)v13;
  uint64_t v26 = *(void **)(v79 + v13);
  *uint64_t v8 = v26;
  uint64_t v11 = v78;
  unint64_t v80 = (void (*)(void *, void *, uint64_t))v15;
  ((void (*)(void *, void, uint64_t))v15)(v8, v78, v5);
  id v27 = v26;
  LOBYTE(v26) = sub_1A916AE90();
  uint64_t v74 = v8;
  v19(v8, v5);
  if ((v26 & 1) == 0) {
    goto LABEL_36;
  }
  uint64_t v8 = (void *)v11;
  uint64_t v11 = (uint64_t)v19;
  unint64_t v75 = v16;
  uint64_t v77 = v18;
  unint64_t v16 = v81[7];
  uint64_t v83 = MEMORY[0x1E4FBC860];
  if (!(v16 >> 62))
  {
    uint64_t v28 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    goto LABEL_11;
  }
LABEL_37:
  swift_bridgeObjectRetain();
  uint64_t result = sub_1A916B7E0();
  uint64_t v28 = result;
LABEL_11:
  double v30 = v80;
  id v73 = (void (*)(void *, uint64_t))v11;
  if (v28)
  {
    if (v28 < 1)
    {
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    uint64_t v31 = v5;
    for (uint64_t i = 0; i != v28; ++i)
    {
      if ((v16 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](i, v16);
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      swift_release();
      if (Strong)
      {
        sub_1A916B6E0();
        sub_1A916B720();
        sub_1A916B730();
        sub_1A916B6F0();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    dispatch_group_t v34 = v83;
  }
  else
  {
    uint64_t v31 = v5;
    swift_bridgeObjectRelease();
    dispatch_group_t v34 = (dispatch_group_t)MEMORY[0x1E4FBC860];
  }
  uint64_t v35 = v79;
  os_log_type_t v36 = v76;
  BOOL v37 = *(void **)&v76[v79];
  uint64_t v38 = v74;
  *uint64_t v74 = v37;
  uint64_t v39 = v31;
  v30(v38, v8, v31);
  id v40 = v37;
  LOBYTE(v37) = sub_1A916AE90();
  unint64_t v41 = (unint64_t)v73;
  v73(v38, v31);
  if ((v37 & 1) == 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  unint64_t v42 = v81;
  v81[7] = v34;
  swift_bridgeObjectRelease();
  dispatch_group_t v34 = dispatch_group_create();
  uint32_t v43 = *(void **)&v36[v35];
  void *v38 = v43;
  v80(v38, v8, v39);
  id v44 = v43;
  LOBYTE(v43) = sub_1A916AE90();
  ((void (*)(void *, uint64_t))v41)(v38, v39);
  if ((v43 & 1) == 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v66 = v39;
  unint64_t v41 = v42[7];
  if (!(v41 >> 62))
  {
    uint64_t v45 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    uint64_t v46 = v74;
    if (v45) {
      goto LABEL_27;
    }
LABEL_41:
    swift_bridgeObjectRelease_n();
    uint64_t v50 = v79;
    sub_1A908CAA8(v79, v71, v72);
    uint64_t v51 = qword_1EB689AA0;
    uint64_t v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = v69;
    uint64_t v53 = *(void **)&v76[v50];
    *uint64_t v46 = v53;
    uint64_t v54 = v66;
    v80(v46, (void *)v78, v66);
    id v55 = (id)v51;
    id v56 = v53;
    LOBYTE(v51) = sub_1A916AE90();
    uint64_t v57 = (uint64_t (*)(void *, uint64_t))v73;
    uint64_t result = ((uint64_t (*)(void *, uint64_t))v73)(v46, v54);
    if (v51)
    {
      uint64_t v59 = v81[5];
      unint64_t v58 = v81[6];
      unint64_t v60 = v68;
      *(void *)(v52 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v52 + 64) = v60;
      if (!v58) {
        uint64_t v59 = 7104878;
      }
      unint64_t v61 = 0xE300000000000000;
      if (v58) {
        unint64_t v61 = v58;
      }
      *(void *)(v52 + 32) = v59;
      *(void *)(v52 + 40) = v61;
      swift_bridgeObjectRetain();
      sub_1A916B3D0();
      sub_1A916AD30();

      swift_bridgeObjectRelease();
      uint64_t v62 = *(void **)&v76[v50];
      *uint64_t v46 = v62;
      v80(v46, (void *)v78, v54);
      id v63 = v62;
      LOBYTE(v62) = sub_1A916AE90();
      uint64_t result = v57(v46, v54);
      if (v62)
      {
        uint64_t v64 = v67;
        void *v67 = 0;
        v64[1] = 0;

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_50;
  }
LABEL_40:
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_1A916B7E0();
  uint64_t v45 = result;
  uint64_t v46 = v74;
  if (!result) {
    goto LABEL_41;
  }
LABEL_27:
  if (v45 >= 1)
  {
    for (uint64_t j = 0; j != v45; ++j)
    {
      if ((v41 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](j, v41);
      }
      else {
        swift_retain();
      }
      dispatch_group_enter(v34);
      if (swift_weakLoadStrong())
      {
        uint64_t v48 = swift_allocObject();
        *(void *)(v48 + 16) = v34;
        uint64_t v49 = v34;
        sub_1A90D2F20(v82, (uint64_t (*)(uint64_t))sub_1A90AFEC8, v48);
        swift_release();
        swift_release();
      }
      swift_release();
    }
    goto LABEL_41;
  }
LABEL_51:
  __break(1u);
  return result;
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate()()
{
  uint64_t v0 = sub_1A916AE10();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A90F82A4();
  sub_1A90A6204(0, (unint64_t *)&qword_1EB686CF0, (uint64_t (*)(uint64_t))type metadata accessor for WeakSessionManager, MEMORY[0x1E4FBB320]);
  sub_1A916B450();
  unint64_t v3 = v7;
  if (!(v7 >> 62))
  {
    uint64_t v4 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1A916ADD0();
    sub_1A90F844C((uint64_t)v2);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1A916B7E0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_12;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](i, v3);
      }
      else {
        swift_retain();
      }
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(1.0);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_12;
  }
  __break(1u);
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate(timeout:)(Swift::Double timeout)
{
  uint64_t v2 = sub_1A916AE10();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A90F82A4();
  sub_1A90A6204(0, (unint64_t *)&qword_1EB686CF0, (uint64_t (*)(uint64_t))type metadata accessor for WeakSessionManager, MEMORY[0x1E4FBB320]);
  sub_1A916B450();
  unint64_t v5 = v9;
  if (!(v9 >> 62))
  {
    uint64_t v6 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    sub_1A916ADD0();
    sub_1A90F844C((uint64_t)v4);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1A916B7E0();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_13;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](i, v5);
      }
      else {
        swift_retain();
      }
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(timeout);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t sub_1A9145D54@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_1A916AE70();
  uint64_t v4 = *(void *)(v3 - 8);
  double v5 = MEMORY[0x1F4188790](v3);
  unint64_t v7 = (uint64_t *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = a1[3];
  uint64_t v20 = OBJC_IVAR___AAAccessQueue_queue;
  uint64_t v8 = *(void **)(v21 + OBJC_IVAR___AAAccessQueue_queue);
  *unint64_t v7 = v8;
  uint64_t v9 = *MEMORY[0x1E4FBCBF0];
  uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t, double))(v4 + 104);
  v10(v7, v9, v3, v5);
  id v11 = v8;
  char v12 = sub_1A916AE90();
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t))(v4 + 8);
  uint64_t result = v13(v7, v3);
  if (v12)
  {
    a1[5] = 0;
    a1[6] = 0;
    swift_bridgeObjectRelease();
    unint64_t v15 = *(void **)(v21 + v20);
    *unint64_t v7 = v15;
    ((void (*)(void *, uint64_t, uint64_t))v10)(v7, v9, v3);
    id v16 = v15;
    char v17 = sub_1A916AE90();
    uint64_t result = v13(v7, v3);
    if (v17)
    {
      *uint64_t v19 = a1[7];
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t AppSessionManager.hasTrackingConsent.getter()
{
  uint64_t v0 = sub_1A916AE40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AE30();
  sub_1A916B3E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_1A916AD90() & 1;
}

uint64_t AppSessionManager.deinit()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  sub_1A9146560(v0 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);
  return v0;
}

uint64_t AppSessionManager.__deallocating_deinit()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 8));
  sub_1A9146560((uint64_t)v0 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration, type metadata accessor for SummaryEventConfiguration);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A91460F8()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

void *sub_1A9146130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v18 = a6;
  uint64_t v19 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v17);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a3, a6);
  a5[5] = 0;
  a5[6] = 0;
  a5[7] = MEMORY[0x1E4FBC860];
  a5[2] = 0;
  a5[3] = a1;
  unint64_t v14 = *(void **)(a2 + OBJC_IVAR___AATrackingConsent_accessGroup);
  a5[4] = v14;
  sub_1A908EC8C(&v17, (uint64_t)(a5 + 8));
  sub_1A90A86B4(a4, (uint64_t)a5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);
  id v15 = v14;
  return a5;
}

uint64_t sub_1A9146208()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A9146248()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A9146280()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A91462C0()
{
  return sub_1A9144E20(*(void *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1A91462CC()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1A91463B8()
{
  uint64_t v1 = *(void *)(sub_1A916AC90() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = (uint64_t *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];

  return sub_1A914522C(v3, v4, v6, v7);
}

uint64_t sub_1A914644C@<X0>(void *a1@<X8>)
{
  return sub_1A9145D54(v1, a1);
}

uint64_t sub_1A9146468(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A914647C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1A9146490(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1A91464A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A91464B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1A91464CC()
{
  return type metadata accessor for AppSessionManager();
}

uint64_t method lookup function for AppSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppSessionManager);
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AppSessionManager.__allocating_init(accessQueue:trackingConsent:crashDetector:summaryEventConfiguration:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1A9146528()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A9146560(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithCopy for SummaryEventDatabaseEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SummaryEventDatabaseEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for SummaryEventDatabaseEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for SummaryEventDatabaseEntity()
{
  return &type metadata for SummaryEventDatabaseEntity;
}

uint64_t sub_1A91466B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[0] = a5;
  v13[1] = a4;
  sub_1A9146D94(0, &qword_1E97B1B10, MEMORY[0x1E4FBBDE0]);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v11 = (char *)v13 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9146D40();
  sub_1A916BB50();
  char v16 = 0;
  sub_1A916B930();
  if (!v5)
  {
    char v15 = 1;
    sub_1A916B950();
    char v14 = 2;
    sub_1A916B950();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1A9146860()
{
  uint64_t v1 = 0x746E756F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x66664F646E756F72;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1A91468BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A91469AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A91468E4(uint64_t a1)
{
  unint64_t v2 = sub_1A9146D40();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9146920(uint64_t a1)
{
  unint64_t v2 = sub_1A9146D40();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A914695C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A9146B10(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1A914698C(void *a1)
{
  return sub_1A91466B0(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_1A91469AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x66664F646E756F72 && a2 == 0xEF73657275676946)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A9146B10(void *a1)
{
  sub_1A9146D94(0, &qword_1E97B1B00, MEMORY[0x1E4FBBDC0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9146D40();
  sub_1A916BB20();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v13 = 0;
    uint64_t v8 = sub_1A916B8A0();
    char v12 = 1;
    swift_bridgeObjectRetain();
    sub_1A916B8D0();
    char v11 = 2;
    sub_1A916B8D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_1A9146D40()
{
  unint64_t result = qword_1E97B1B08;
  if (!qword_1E97B1B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B08);
  }
  return result;
}

void sub_1A9146D94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A9146D40();
    unint64_t v7 = a3(a1, &type metadata for SummaryEventDatabaseEntity.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SummaryEventDatabaseEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9146EC4);
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

ValueMetadata *type metadata accessor for SummaryEventDatabaseEntity.CodingKeys()
{
  return &type metadata for SummaryEventDatabaseEntity.CodingKeys;
}

unint64_t sub_1A9146F00()
{
  unint64_t result = qword_1E97B1B18;
  if (!qword_1E97B1B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B18);
  }
  return result;
}

unint64_t sub_1A9146F58()
{
  unint64_t result = qword_1E97B1B20;
  if (!qword_1E97B1B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B20);
  }
  return result;
}

unint64_t sub_1A9146FB0()
{
  unint64_t result = qword_1E97B1B28;
  if (!qword_1E97B1B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B28);
  }
  return result;
}

char *sub_1A9147004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v27 = sub_1A9136234(a3);
  unint64_t v28 = v8;
  uint64_t v9 = &v27;
  if (((unint64_t)sub_1A9134168((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1A9147A7C) & 0x8000000000000000) == 0)
  {
    uint64_t v10 = v27;
    unint64_t v11 = v28;
    uint64_t v9 = (uint64_t *)sub_1A916AB50();
    sub_1A90A2FD4(v10, v11);
    return (char *)v9;
  }
  int v12 = MEMORY[0x1AD0ED5C0]();
  switch(v12)
  {
    case 93:
      sub_1A90A2FD4(v27, v28);
      return 0;
    case 34:
      sub_1A916AA90();
      uint64_t v14 = sub_1A916B000();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_1A916B000();
      ssize_t v16 = getxattr((const char *)(v14 + 32), (const char *)(v15 + 32), 0, 0, 0, 0);
      swift_release();
      uint64_t v17 = swift_release();
      if ((v16 & 0x8000000000000000) == 0)
      {
        ssize_t v18 = v16;
        uint64_t v9 = v5;
        uint64_t v19 = sub_1A9147004(a1, a2, v18);
        if (!v4)
        {
          uint64_t v9 = (uint64_t *)v19;
          sub_1A90A2FD4(v27, v28);
          return (char *)v9;
        }
LABEL_16:
        sub_1A90A2FD4(v27, v28);
        return (char *)v9;
      }
      break;
    case 2:
      sub_1A9147A9C();
      swift_allocError();
      v13[1] = 0;
      void v13[2] = 0;
      *char v13 = 0;
LABEL_15:
      swift_willThrow();
      goto LABEL_16;
    default:
      unsigned int v20 = MEMORY[0x1AD0ED5C0]();
      int v21 = MEMORY[0x1AD0ED5C0]();
      uint64_t v17 = (uint64_t)strerror(v21);
      if (v17)
      {
LABEL_14:
        uint64_t v9 = (uint64_t *)sub_1A916B060();
        uint64_t v25 = v24;
        sub_1A9147A9C();
        swift_allocError();
        void *v26 = v20;
        v26[1] = v9;
        v26[2] = v25;
        goto LABEL_15;
      }
      __break(1u);
      break;
  }
  unsigned int v20 = MEMORY[0x1AD0ED5C0](v17);
  int v22 = MEMORY[0x1AD0ED5C0]();
  unint64_t result = strerror(v22);
  if (result) {
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A914723C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v40[19] = *MEMORY[0x1E4F143B8];
  v40[5] = a3;
  v40[6] = a4;
  v40[7] = a1;
  v40[8] = a2;
  uint64_t v5 = v4;
  uint64_t v8 = a2;
  uint64_t v9 = a1;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      unsigned int v20 = sub_1A9147978((int)v9, v9 >> 32, (void *(*)(uint64_t *__return_ptr, void *, char *))sub_1A9147954);
      if (v4) {
        goto LABEL_20;
      }
      unsigned int v21 = v20;
      uint64_t result = sub_1A90A2FD4(v9, v8);
      if ((v21 & 0x80000000) != 0) {
        goto LABEL_12;
      }
      return result;
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      unsigned int v15 = sub_1A9147978(v14, v8, (void *(*)(uint64_t *__return_ptr, void *, char *))sub_1A9147954);
      if (v5) {
        goto LABEL_19;
      }
      unsigned int v16 = v15;
      swift_release();
      uint64_t result = swift_release();
      if ((v16 & 0x80000000) != 0) {
        goto LABEL_12;
      }
      return result;
    case 3uLL:
      memset(v40, 0, 14);
      sub_1A916AA90();
      uint64_t v18 = sub_1A916B000();
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_1A916B000();
      int v13 = setxattr((const char *)(v18 + 32), (const char *)(v19 + 32), v40, 0, 0, 0);
      swift_release();
      goto LABEL_7;
    default:
      v40[0] = a1;
      LOWORD(v40[1]) = a2;
      BYTE2(v40[1]) = BYTE2(a2);
      BYTE3(v40[1]) = BYTE3(a2);
      BYTE4(v40[1]) = BYTE4(a2);
      BYTE5(v40[1]) = BYTE5(a2);
      sub_1A916AA90();
      size_t v10 = BYTE6(v8);
      uint64_t v11 = sub_1A916B000();
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1A916B000();
      int v13 = setxattr((const char *)(v11 + 32), (const char *)(v12 + 32), v40, v10, 0, 0);
      swift_release();
LABEL_7:
      uint64_t result = swift_release();
      if (v13 < 0)
      {
LABEL_12:
        if (qword_1EB68ACE8 != -1) {
          swift_once();
        }
        id v22 = (id)qword_1EB689AA0;
        uint64_t v9 = sub_1A916B3B0();
        sub_1A9147A28(0, (unint64_t *)&qword_1EB68ACD8, (void (*)(uint64_t))sub_1A90A557C);
        uint64_t v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_1A916E210;
        uint64_t v23 = sub_1A916AA90();
        uint64_t v25 = v24;
        uint64_t v26 = MEMORY[0x1E4FBB1A0];
        *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v27 = sub_1A90A67C0();
        *(void *)(v8 + 32) = v23;
        *(void *)(v8 + 40) = v25;
        *(void *)(v8 + 96) = v26;
        *(void *)(v8 + 104) = v27;
        *(void *)(v8 + 64) = v27;
        *(void *)(v8 + 72) = a3;
        *(void *)(v8 + 80) = a4;
        uint64_t v28 = swift_bridgeObjectRetain();
        LODWORD(v40[0]) = MEMORY[0x1AD0ED5C0](v28);
        uint64_t v29 = sub_1A916B990();
        *(void *)(v8 + 136) = v26;
        *(void *)(v8 + 144) = v27;
        *(void *)(v8 + 112) = v29;
        *(void *)(v8 + 120) = v30;
        sub_1A916AD30();

        swift_bridgeObjectRelease();
        sub_1A916AF90();
        int v31 = MEMORY[0x1AD0ED5C0]();
        sub_1A9147A28(0, &qword_1EB6894C0, (void (*)(uint64_t))sub_1A90B2774);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1A916EF60;
        *(void *)(inited + 32) = sub_1A916AF90();
        *(void *)(inited + 40) = v33;
        int v34 = MEMORY[0x1AD0ED5C0]();
        if (!strerror(v34))
        {
          __break(1u);
LABEL_19:
          swift_release();
          swift_release();
          __break(1u);
LABEL_20:
          sub_1A90A2FD4(v9, v8);
          __break(1u);
          JUMPOUT(0x1A9147764);
        }
        uint64_t v35 = sub_1A916B060();
        *(void *)(inited + 72) = v26;
        *(void *)(inited + 48) = v35;
        *(void *)(inited + 56) = v36;
        sub_1A90B2180(inited);
        id v37 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        uint64_t v38 = (void *)sub_1A916AF60();
        swift_bridgeObjectRelease();
        uint64_t v39 = (void *)sub_1A916AEB0();
        swift_bridgeObjectRelease();
        objc_msgSend(v37, sel_initWithDomain_code_userInfo_, v38, v31, v39);

        return swift_willThrow();
      }
      return result;
  }
}

uint64_t sub_1A9147774@<X0>(void *a1@<X0>, size_t a2@<X5>, ssize_t *a3@<X8>)
{
  sub_1A916AA90();
  uint64_t v6 = sub_1A916B000();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1A916B000();
  ssize_t v8 = getxattr((const char *)(v6 + 32), (const char *)(v7 + 32), a1, a2, 0, 0);
  swift_release();
  uint64_t result = swift_release();
  *a3 = v8;
  return result;
}

uint64_t sub_1A9147828@<X0>(const void *a1@<X0>, uint64_t a2@<X5>, unint64_t a3@<X6>, int *a4@<X8>)
{
  sub_1A916AA90();
  size_t v8 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x1A9147944);
      }
      size_t v8 = HIDWORD(a2) - (int)a2;
LABEL_6:
      uint64_t v11 = sub_1A916B000();
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1A916B000();
      int v13 = setxattr((const char *)(v11 + 32), (const char *)(v12 + 32), a1, v8, 0, 0);
      swift_release();
      uint64_t result = swift_release();
      *a4 = v13;
      return result;
    case 2uLL:
      uint64_t v10 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      size_t v8 = v9 - v10;
      if (!__OFSUB__(v9, v10)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      size_t v8 = BYTE6(a3);
      goto LABEL_6;
  }
}

uint64_t sub_1A9147954@<X0>(const void *a1@<X0>, int *a2@<X8>)
{
  return sub_1A9147828(a1, *(void *)(v2 + 40), *(void *)(v2 + 48), a2);
}

void *sub_1A9147978(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, void *, char *))
{
  uint64_t result = (void *)sub_1A916A870();
  size_t v8 = result;
  if (result)
  {
    uint64_t result = (void *)sub_1A916A8A0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    size_t v8 = (void *)((char *)v8 + a1 - (void)result);
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v11 = sub_1A916A890();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = (char *)v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t result = a3(&v15, v8, v14);
  if (!v3) {
    return (void *)v15;
  }
  return result;
}

void sub_1A9147A28(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A916B9A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A9147A7C@<X0>(void *a1@<X0>, ssize_t *a2@<X8>)
{
  return sub_1A9147774(a1, *(void *)(v2 + 40), a2);
}

unint64_t sub_1A9147A9C()
{
  unint64_t result = qword_1EB689110;
  if (!qword_1EB689110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB689110);
  }
  return result;
}

uint64_t _s22ExtendedAttributeErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22ExtendedAttributeErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwca(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwta(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
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

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

uint64_t sub_1A9147C64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1A9147C7C(void *result, int a2)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *unint64_t result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    result[2] = (a2 - 1);
  }
  return result;
}

ValueMetadata *_s22ExtendedAttributeErrorOMa()
{
  return &_s22ExtendedAttributeErrorON;
}

char *sub_1A9147CB0(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    size_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = &v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = *a2;
      uint64_t v7 = v6;
      *(void *)a1 = v6;
    }
    else
    {
      BOOL v9 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v9;
      uint64_t v11 = a2[2];
      uint64_t v10 = a2[3];
      *((void *)a1 + 2) = v11;
      *((void *)a1 + 3) = v10;
      *((void *)a1 + 4) = a2[4];
      uint64_t v12 = (int *)type metadata accessor for ProcessEvent();
      uint64_t v13 = v12[11];
      uint64_t v30 = (char *)a2 + v13;
      int v31 = &a1[v13];
      uint64_t v14 = sub_1A916AC90();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      unsigned int v16 = v11;
      swift_bridgeObjectRetain();
      v15(v31, v30, v14);
      uint64_t v17 = v12[12];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = (char **)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      *(void *)uint64_t v18 = *v19;
      *((void *)v18 + 1) = v20;
      uint64_t v21 = v12[13];
      id v22 = &a1[v21];
      uint64_t v23 = (char *)a2 + v21;
      *(void *)id v22 = *(void *)v23;
      v22[8] = v23[8];
      uint64_t v24 = v12[14];
      uint64_t v25 = &a1[v24];
      uint64_t v26 = (_OWORD *)((char *)a2 + v24);
      uint64_t v27 = *(uint64_t *)((char *)a2 + v24 + 24);
      swift_bridgeObjectRetain();
      if (v27)
      {
        *((void *)v25 + 3) = v27;
        (**(void (***)(char *, _OWORD *, uint64_t))(v27 - 8))(v25, v26, v27);
      }
      else
      {
        long long v28 = v26[1];
        *(_OWORD *)uint64_t v25 = *v26;
        *((_OWORD *)v25 + 1) = v28;
      }
      *(_OWORD *)&a1[v12[15]] = *(_OWORD *)((char *)a2 + v12[15]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1A9147EB8(void **a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = *a1;
  }
  else
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v3 = type metadata accessor for ProcessEvent();
    unint64_t v4 = (char *)a1 + *(int *)(v3 + 44);
    uint64_t v5 = sub_1A916AC90();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();
    uint64_t v6 = (uint64_t)a1 + *(int *)(v3 + 56);
    if (*(void *)(v6 + 24))
    {
      __swift_destroy_boxed_opaque_existential_0(v6);
    }
  }
}

void *sub_1A9147FBC(void *a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    unint64_t v4 = *(void **)a2;
    id v5 = v4;
    *a1 = v4;
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 8);
    *a1 = *(void *)a2;
    a1[1] = v6;
    size_t v8 = *(void **)(a2 + 16);
    uint64_t v7 = *(void *)(a2 + 24);
    a1[2] = v8;
    a1[3] = v7;
    a1[4] = *(void *)(a2 + 32);
    BOOL v9 = (int *)type metadata accessor for ProcessEvent();
    uint64_t v10 = v9[11];
    uint64_t v27 = a2 + v10;
    long long v28 = (char *)a1 + v10;
    uint64_t v11 = sub_1A916AC90();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    id v13 = v8;
    swift_bridgeObjectRetain();
    v12(v28, v27, v11);
    uint64_t v14 = v9[12];
    uint64_t v15 = (void *)((char *)a1 + v14);
    unsigned int v16 = (void *)(a2 + v14);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = v9[13];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = a2 + v18;
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = *(unsigned char *)(v20 + 8);
    uint64_t v21 = v9[14];
    id v22 = (char *)a1 + v21;
    uint64_t v23 = (_OWORD *)(a2 + v21);
    uint64_t v24 = *(void *)(a2 + v21 + 24);
    swift_bridgeObjectRetain();
    if (v24)
    {
      *((void *)v22 + 3) = v24;
      (**(void (***)(char *, _OWORD *, uint64_t))(v24 - 8))(v22, v23, v24);
    }
    else
    {
      long long v25 = v23[1];
      *(_OWORD *)id v22 = *v23;
      *((_OWORD *)v22 + 1) = v25;
    }
    *(_OWORD *)((char *)a1 + v9[15]) = *(_OWORD *)(a2 + v9[15]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_1A9148174(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    (*(void (**)(void **, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v5 = *a2;
      id v6 = v5;
      *a1 = v5;
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v7 = a2[2];
      a1[2] = v7;
      a1[3] = a2[3];
      a1[4] = a2[4];
      size_t v8 = (int *)type metadata accessor for ProcessEvent();
      uint64_t v9 = v8[11];
      uint64_t v26 = (char *)a2 + v9;
      uint64_t v27 = (char *)a1 + v9;
      uint64_t v10 = sub_1A916AC90();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
      swift_bridgeObjectRetain();
      id v12 = v7;
      swift_bridgeObjectRetain();
      v11(v27, v26, v10);
      uint64_t v13 = v8[12];
      uint64_t v14 = (void **)((char *)a1 + v13);
      uint64_t v15 = (void **)((char *)a2 + v13);
      *uint64_t v14 = *v15;
      v14[1] = v15[1];
      uint64_t v16 = v8[13];
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      char v19 = v18[8];
      *(void *)uint64_t v17 = *(void *)v18;
      v17[8] = v19;
      uint64_t v20 = v8[14];
      uint64_t v21 = (char *)a1 + v20;
      id v22 = (_OWORD *)((char *)a2 + v20);
      uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
      swift_bridgeObjectRetain();
      if (v23)
      {
        *((void *)v21 + 3) = v23;
        (**(void (***)(char *, _OWORD *, uint64_t))(v23 - 8))(v21, v22, v23);
      }
      else
      {
        long long v24 = v22[1];
        *(_OWORD *)uint64_t v21 = *v22;
        *((_OWORD *)v21 + 1) = v24;
      }
      *(_OWORD *)((char *)a1 + v8[15]) = *(_OWORD *)((char *)a2 + v8[15]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A9148374(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
    id v6 = (int *)type metadata accessor for ProcessEvent();
    uint64_t v7 = v6[11];
    size_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1A916AC90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + v6[12]) = *(_OWORD *)((char *)a2 + v6[12]);
    uint64_t v11 = v6[13];
    id v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    *(void *)id v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = v6[14];
    uint64_t v15 = (_OWORD *)((char *)a1 + v14);
    uint64_t v16 = (_OWORD *)((char *)a2 + v14);
    long long v17 = v16[1];
    _OWORD *v15 = *v16;
    v15[1] = v17;
    *(_OWORD *)((char *)a1 + v6[15]) = *(_OWORD *)((char *)a2 + v6[15]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A91484AC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(_OWORD *, uint64_t))(v5 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      *a1 = *a2;
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
      id v6 = (int *)type metadata accessor for ProcessEvent();
      uint64_t v7 = v6[11];
      size_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      *(_OWORD *)((char *)a1 + v6[12]) = *(_OWORD *)((char *)a2 + v6[12]);
      uint64_t v11 = v6[13];
      id v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      *(void *)id v12 = *(void *)v13;
      v12[8] = v13[8];
      uint64_t v14 = v6[14];
      uint64_t v15 = (_OWORD *)((char *)a1 + v14);
      uint64_t v16 = (_OWORD *)((char *)a2 + v14);
      long long v17 = v16[1];
      _OWORD *v15 = *v16;
      v15[1] = v17;
      *(_OWORD *)((char *)a1 + v6[15]) = *(_OWORD *)((char *)a2 + v6[15]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A914865C(uint64_t a1)
{
  return *(void *)(a1 + 8) >> 62;
}

uint64_t sub_1A9148668(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_1A9148678(void *result, uint64_t a2)
{
  uint64_t v2 = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  *result &= 0xFFFFFFFFFFFFFF8uLL;
  result[1] = v2;
  return result;
}

uint64_t type metadata accessor for EventSubmit()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t *sub_1A91486A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A916AC90();
    size_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for SummaryEventMetaData();
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    uint64_t v10 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A91487B0(uint64_t a1)
{
  uint64_t v2 = sub_1A916AC90();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(a1, v2);
  uint64_t v4 = type metadata accessor for SummaryEventMetaData();
  v3(a1 + *(int *)(v4 + 20), v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A9148858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A9148910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1A91489D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  return a1;
}

uint64_t sub_1A9148A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for SummaryEventMetaData();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1A9148B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9148B60);
}

uint64_t sub_1A9148B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SummaryEventMetaData();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1A9148C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9148C34);
}

uint64_t sub_1A9148C34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SummaryEventMetaData();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SummaryEventData()
{
  uint64_t result = qword_1EB687738;
  if (!qword_1EB687738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A9148D3C()
{
  uint64_t result = type metadata accessor for SummaryEventMetaData();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A9148DE4(void *a1)
{
  uint64_t v3 = v1;
  sub_1A91497D0(0, &qword_1E97B1B60, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A91495A8();
  sub_1A916BB50();
  char v13 = 0;
  type metadata accessor for SummaryEventMetaData();
  sub_1A9149834(&qword_1E97B1778, (void (*)(uint64_t))type metadata accessor for SummaryEventMetaData);
  sub_1A916B960();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + *(int *)(type metadata accessor for SummaryEventData() + 20));
    v11[15] = 1;
    sub_1A9149660();
    sub_1A914987C(&qword_1E97B1B68, (void (*)(void))sub_1A9109408);
    sub_1A916B960();
    v11[14] = 2;
    sub_1A916B940();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A914902C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v4 = type metadata accessor for SummaryEventMetaData();
  MEMORY[0x1F4188790](v4);
  uint64_t v22 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A91497D0(0, &qword_1E97B1B30, MEMORY[0x1E4FBBDC0]);
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = type metadata accessor for SummaryEventData();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A91495A8();
  sub_1A916BB20();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v12 = v20;
  uint64_t v13 = (uint64_t)v11;
  char v26 = 0;
  sub_1A9149834(&qword_1E97B1B40, (void (*)(uint64_t))type metadata accessor for SummaryEventMetaData);
  uint64_t v14 = v21;
  sub_1A916B8E0();
  sub_1A91495FC(v22, v13);
  sub_1A9149660();
  char v24 = 1;
  sub_1A914987C(&qword_1E97B1B50, (void (*)(void))sub_1A91496B8);
  sub_1A916B8E0();
  *(void *)(v13 + *(int *)(v9 + 20)) = v25;
  char v23 = 2;
  sub_1A916B8C0();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v14);
  *(void *)(v13 + *(int *)(v9 + 24)) = v16;
  sub_1A914970C(v13, v19);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A9149770(v13, (uint64_t (*)(void))type metadata accessor for SummaryEventData);
}

uint64_t sub_1A91493F8()
{
  unint64_t v1 = 0x736D657469;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001ALL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x617461646174656DLL;
  }
}

uint64_t sub_1A9149454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9149AF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A914947C(uint64_t a1)
{
  unint64_t v2 = sub_1A91495A8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A91494B8(uint64_t a1)
{
  unint64_t v2 = sub_1A91495A8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A91494F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A914902C(a1, a2);
}

uint64_t sub_1A914950C(void *a1)
{
  return sub_1A9148DE4(a1);
}

uint64_t sub_1A9149524(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A9149834(&qword_1EB687728, (void (*)(uint64_t))type metadata accessor for SummaryEventData);
  uint64_t result = sub_1A9149834(&qword_1EB687720, (void (*)(uint64_t))type metadata accessor for SummaryEventData);
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A91495A8()
{
  unint64_t result = qword_1E97B1B38;
  if (!qword_1E97B1B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B38);
  }
  return result;
}

uint64_t sub_1A91495FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A9149660()
{
  if (!qword_1E97B1B48)
  {
    unint64_t v0 = sub_1A916B230();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E97B1B48);
    }
  }
}

unint64_t sub_1A91496B8()
{
  unint64_t result = qword_1E97B1B58;
  if (!qword_1E97B1B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B58);
  }
  return result;
}

uint64_t sub_1A914970C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9149770(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1A91497D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A91495A8();
    unint64_t v7 = a3(a1, &type metadata for SummaryEventData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1A9149834(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A914987C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A9149660();
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SummaryEventData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A91499B4);
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

ValueMetadata *type metadata accessor for SummaryEventData.CodingKeys()
{
  return &type metadata for SummaryEventData.CodingKeys;
}

unint64_t sub_1A91499F0()
{
  unint64_t result = qword_1E97B1B70;
  if (!qword_1E97B1B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B70);
  }
  return result;
}

unint64_t sub_1A9149A48()
{
  unint64_t result = qword_1E97B1B78;
  if (!qword_1E97B1B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B78);
  }
  return result;
}

unint64_t sub_1A9149AA0()
{
  unint64_t result = qword_1E97B1B80;
  if (!qword_1E97B1B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B80);
  }
  return result;
}

uint64_t sub_1A9149AF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001A917A560)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SummaryEvent(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9149D0CLL);
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

ValueMetadata *type metadata accessor for SummaryEvent()
{
  return &type metadata for SummaryEvent;
}

uint64_t DisabledPrivacyValidationProvider.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

id BridgedPrivacyValidationProvider.bridgedPrivacyValidation.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  BOOL v2 = *v1;

  return v2;
}

id BridgedPrivacyValidationProvider.__allocating_init(bridgedPrivacyValidation:)(uint64_t a1)
{
  int v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BridgedPrivacyValidationProvider.init(bridgedPrivacyValidation:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t BridgedPrivacyValidationProvider.privacyValidation.getter@<X0>(uint64_t *a1@<X8>)
{
  int v3 = (void *)(v1 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  uint64_t result = swift_beginAccess();
  if (*(unsigned char *)(*v3 + OBJC_IVAR___AAPrivacyValidation_enabled) == 1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    return sub_1A90B62F8(v5, a1);
  }
  else
  {
    *a1 = 0;
  }
  return result;
}

id BridgedPrivacyValidationProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedPrivacyValidationProvider.init()()
{
}

id BridgedPrivacyValidationProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A914A0CC@<X0>(uint64_t *a1@<X8>)
{
  int v3 = (void *)(v1 + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  uint64_t result = swift_beginAccess();
  if (*(unsigned char *)(*v3 + OBJC_IVAR___AAPrivacyValidation_enabled) == 1)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    return sub_1A90B62F8(v5, a1);
  }
  else
  {
    *a1 = 0;
  }
  return result;
}

uint64_t DisabledPrivacyValidationProvider.privacyValidation.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t DisabledPrivacyValidationProvider.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DisabledPrivacyValidationProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for BridgedPrivacyValidationProvider()
{
  return self;
}

uint64_t method lookup function for BridgedPrivacyValidationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedPrivacyValidationProvider);
}

uint64_t dispatch thunk of BridgedPrivacyValidationProvider.__allocating_init(bridgedPrivacyValidation:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for DisabledPrivacyValidationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DisabledPrivacyValidationProvider);
}

uint64_t dispatch thunk of DisabledPrivacyValidationProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void *sub_1A914A24C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for SummaryEventDataItem(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for SummaryEventDataItem()
{
  return &type metadata for SummaryEventDataItem;
}

uint64_t sub_1A914A2D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = a4;
  sub_1A914A920(0, &qword_1E97B1BA0, MEMORY[0x1E4FBBDE0]);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v12 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A914A8CC();
  sub_1A916BB50();
  char v14 = 0;
  sub_1A916B930();
  if (!v4)
  {
    char v13 = 1;
    sub_1A916B950();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1A914A45C()
{
  if (*v0) {
    return 0x756F43746E657665;
  }
  else {
    return 0x6D614E746E657665;
  }
}

uint64_t sub_1A914A4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A914A5C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A914A4C8(uint64_t a1)
{
  unint64_t v2 = sub_1A914A8CC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A914A504(uint64_t a1)
{
  unint64_t v2 = sub_1A914A8CC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A914A540@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A914A6CC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A914A570(void *a1)
{
  return sub_1A914A2D4(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_1A914A590(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A91496B8();
  unint64_t result = sub_1A9109408();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A914A5C0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D614E746E657665 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F43746E657665 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A914A6CC(void *a1)
{
  sub_1A914A920(0, &qword_1E97B1B90, MEMORY[0x1E4FBBDC0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v10[-v6];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A914A8CC();
  sub_1A916BB20();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v10[15] = 0;
    uint64_t v8 = sub_1A916B8A0();
    v10[14] = 1;
    swift_bridgeObjectRetain();
    sub_1A916B8D0();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_1A914A8CC()
{
  unint64_t result = qword_1E97B1B98;
  if (!qword_1E97B1B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1B98);
  }
  return result;
}

void sub_1A914A920(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A914A8CC();
    unint64_t v7 = a3(a1, &type metadata for SummaryEventDataItem.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SummaryEventDataItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A914AA50);
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

ValueMetadata *type metadata accessor for SummaryEventDataItem.CodingKeys()
{
  return &type metadata for SummaryEventDataItem.CodingKeys;
}

unint64_t sub_1A914AA8C()
{
  unint64_t result = qword_1E97B1BA8;
  if (!qword_1E97B1BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BA8);
  }
  return result;
}

unint64_t sub_1A914AAE4()
{
  unint64_t result = qword_1E97B1BB0;
  if (!qword_1E97B1BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BB0);
  }
  return result;
}

unint64_t sub_1A914AB3C()
{
  unint64_t result = qword_1E97B1BB8;
  if (!qword_1E97B1BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BB8);
  }
  return result;
}

uint64_t sub_1A914AB90(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t static UploadBatchEventProcessor.Errors.== infix(_:_:)()
{
  return 1;
}

uint64_t UploadBatchEventProcessor.Errors.hash(into:)()
{
  return sub_1A916BAC0();
}

uint64_t UploadBatchEventProcessor.Errors.hashValue.getter()
{
  return sub_1A916BAD0();
}

uint64_t UploadBatchEventProcessor.deinit()
{
  swift_unknownObjectRelease();
  sub_1A914E844(v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  return v0;
}

uint64_t UploadBatchEventProcessor.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  sub_1A914E844(v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

void UploadBatchEventProcessor.process<A>(processEvent:)(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68ACC8, (uint64_t (*)(uint64_t))type metadata accessor for Session, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  unsigned int v6 = (char *)v24 - v5;
  uint64_t v7 = type metadata accessor for Session();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (void *)((char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = v2 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  swift_beginAccess();
  sub_1A9120310(v11, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1A914E844((uint64_t)v6);
    sub_1A914E8D0();
    uint64_t v12 = (void *)swift_allocError();
    swift_willThrow();
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v21 = (id)qword_1EB689AA0;
    sub_1A916B3C0();
    sub_1A914E924(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1A916EF60;
    v25[0] = 0;
    v25[1] = 0xE000000000000000;
    v24[1] = v12;
    sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
    sub_1A916B780();
    long long v23 = *(_OWORD *)v25;
    *(void *)(v22 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v22 + 64) = sub_1A90A67C0();
    *(_OWORD *)(v22 + 32) = v23;
    sub_1A916AD30();

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1A914EB98((uint64_t)v6, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Session);
    char v13 = (int *)type metadata accessor for ProcessEvent();
    unint64_t v14 = ProcessEventType.payload()((uint64_t)v13, (uint64_t)&protocol witness table for ProcessEvent<A>);
    uint64_t v15 = v13[13];
    uint64_t v16 = (uint64_t *)(a1 + v13[12]);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = *(void (**)(char *, uint64_t))(a1 + v15);
    char v20 = *(unsigned char *)(a1 + v15 + 8);
    *(_OWORD *)uint64_t v25 = *(_OWORD *)(a1 + v13[15]);
    sub_1A9120E7C(v14, v10, v17, v18, v19, v20, v25);
    sub_1A914E98C((uint64_t)v10);
    swift_bridgeObjectRelease();
  }
}

uint64_t UploadBatchEventProcessor.didLeaveGroup(_:)(uint64_t a1)
{
  int v3 = (void *)(v1 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for Session();
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    if (qword_1EB68ACE8 != -1) {
      swift_once();
    }
    id v5 = (id)qword_1EB689AA0;
    sub_1A916B3B0();
    sub_1A914E924(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1A916EF60;
    uint64_t v8 = *(void *)(a1 + OBJC_IVAR___AAGroup_name);
    uint64_t v7 = *(void *)(a1 + OBJC_IVAR___AAGroup_name + 8);
    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 64) = sub_1A90A67C0();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v7;
    swift_bridgeObjectRetain();
    sub_1A916AD30();

    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = v3[1];
    uint64_t v12 = *(void *)(a1 + OBJC_IVAR___AAGroup_name);
    uint64_t v11 = *(void *)(a1 + OBJC_IVAR___AAGroup_name + 8);
    v13[0] = *v3;
    v13[1] = v10;
    void v13[2] = v12;
    v13[3] = v11;
    char v14 = 1;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1A91213A8((uint64_t)v13);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease_n();
  }
}

uint64_t UploadBatchEventProcessor.didStartSession(_:)(uint64_t a1)
{
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68ACC8, (uint64_t (*)(uint64_t))type metadata accessor for Session, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)v49 - v4;
  uint64_t v6 = sub_1A916AAD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(v10 + 4, v10[7]);
  uint64_t v56 = a1;
  uint64_t v11 = a1;
  uint64_t v12 = 0;
  sub_1A9119958(v11);
  uint64_t v60 = v7;
  uint64_t v51 = v1;
  os_unfair_lock_lock_with_options();
  swift_beginAccess();
  v10[10] = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v10[11] + 16));
  char v13 = __swift_project_boxed_opaque_existential_1(v10 + 4, v10[7]);
  uint64_t v14 = *v13;
  uint64_t v15 = (void *)(*v13 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_fileManager);
  uint64_t v16 = v15[3];
  uint64_t v17 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v16);
  sub_1A9119550();
  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 128))(v9, v16, v17);
  uint64_t v54 = v15;
  uint64_t v55 = v14;
  uint64_t v50 = v5;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v9, v6);
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v23 = v55;
    char v24 = (uint64_t *)(v55 + 40);
    v49[1] = v21;
    uint64_t v25 = (uint64_t *)(v21 + 40);
    long long v52 = xmmword_1A916E200;
    char v26 = v54;
    uint64_t v53 = (uint64_t *)(v55 + 40);
    uint64_t v57 = OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_lock;
    do
    {
      uint64_t v28 = *(v25 - 1);
      uint64_t v27 = *v25;
      swift_bridgeObjectRetain();
      os_unfair_lock_lock_with_options();
      uint64_t v59 = v28;
      uint64_t v60 = v27;
      uint64_t v29 = sub_1A911A9E4(v28, v27);
      uint64_t v30 = v26[3];
      uint64_t v31 = v26[4];
      __swift_project_boxed_opaque_existential_1(v26, v30);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 24))(v29, v30, v31);
      if (v12)
      {
        if (qword_1EB68ACE8 != -1) {
          swift_once();
        }
        id v32 = (id)qword_1EB689AA0;
        LODWORD(v58) = sub_1A916B3B0();
        sub_1A914E924(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = v52;
        uint64_t v34 = UploadDropboxFile.description.getter();
        uint64_t v36 = v35;
        uint64_t v37 = MEMORY[0x1E4FBB1A0];
        *(void *)(v33 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v38 = sub_1A90A67C0();
        *(void *)(v33 + 64) = v38;
        *(void *)(v33 + 32) = v34;
        *(void *)(v33 + 40) = v36;
        uint64_t v61 = 0;
        unint64_t v62 = 0xE000000000000000;
        uint64_t v63 = (uint64_t)v12;
        sub_1A908E870(0, (unint64_t *)&qword_1EB689860);
        sub_1A916B780();
        uint64_t v39 = v61;
        unint64_t v40 = v62;
        *(void *)(v33 + 96) = v37;
        *(void *)(v33 + 104) = v38;
        *(void *)(v33 + 72) = v39;
        *(void *)(v33 + 80) = v40;
        sub_1A916AD30();

        swift_bridgeObjectRelease();
        swift_release();

        unint64_t v58 = 0;
        char v26 = v54;
        uint64_t v41 = v55;
        char v24 = v53;
      }
      else
      {
        unint64_t v58 = 0;
        uint64_t v41 = v23;
        swift_release();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v42 = sub_1A90A1D98(v59, v60);
      char v44 = v43;
      swift_bridgeObjectRelease();
      if (v44)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v24;
        uint64_t v63 = *v24;
        *char v24 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1A90BF68C();
          uint64_t v46 = v63;
        }
        swift_bridgeObjectRelease();
        sub_1A914D038(v42, v46);
        *char v24 = v46;
        swift_bridgeObjectRelease();
      }
      v25 += 2;
      swift_endAccess();
      swift_release();
      uint64_t v23 = v41;
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(v41 + v57) + 16));
      swift_bridgeObjectRelease();
      --v22;
      uint64_t v12 = v58;
    }
    while (v22);
  }
  swift_bridgeObjectRelease();
  uint64_t v48 = (uint64_t)v50;
  uint64_t v47 = v51;
  sub_1A914E9E8(v56, (uint64_t)v50);
  uint64_t v18 = type metadata accessor for Session();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v48, 0, 1, v18);
  uint64_t v19 = v47 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  swift_beginAccess();
  sub_1A91204D4(v48, v19);
  return swift_endAccess();
}

uint64_t UploadBatchEventProcessor.didUpdateSession(_:)(uint64_t *a1)
{
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68ACC8, (uint64_t (*)(uint64_t))type metadata accessor for Session, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = &v20[-v7];
  uint64_t v9 = type metadata accessor for Session();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = v1 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  swift_beginAccess();
  sub_1A9120310(v13, (uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1A914E844((uint64_t)v8);
LABEL_9:
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v1 + 16) + 32), *(void *)(*(void *)(v1 + 16) + 56));
    sub_1A911C1B8(*(uint64_t *)((char *)a1 + *(int *)(v9 + 32)));
    sub_1A914E9E8((uint64_t)a1, (uint64_t)v5);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
    swift_beginAccess();
    sub_1A91204D4((uint64_t)v5, v13);
    return swift_endAccess();
  }
  sub_1A914EB98((uint64_t)v8, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for Session);
  uint64_t v15 = *a1;
  uint64_t v14 = a1[1];
  BOOL v16 = *v12 == *a1 && v12[1] == v14;
  if (v16 || (sub_1A916B9E0() & 1) != 0)
  {
    sub_1A914E98C((uint64_t)v12);
    goto LABEL_9;
  }
  if (qword_1EB68ACE8 != -1) {
    swift_once();
  }
  id v18 = (id)qword_1EB689AA0;
  sub_1A916B3C0();
  sub_1A914E924(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1A916EF60;
  *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v19 + 64) = sub_1A90A67C0();
  *(void *)(v19 + 32) = v15;
  *(void *)(v19 + 40) = v14;
  swift_bridgeObjectRetain();
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  return sub_1A914E98C((uint64_t)v12);
}

uint64_t UploadBatchEventProcessor.didEndSession(_:endDate:)()
{
  uint64_t v1 = sub_1A916AAD0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68ACC8, (uint64_t (*)(uint64_t))type metadata accessor for Session, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v33 - v6;
  uint64_t v8 = type metadata accessor for Session();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  swift_beginAccess();
  sub_1A91204D4((uint64_t)v7, v9);
  swift_endAccess();
  uint64_t v10 = *(void **)(v0 + 16);
  os_unfair_lock_lock_with_options();
  swift_beginAccess();
  v10[10] = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v10[11] + 16));
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v10 + 4, v10[7]);
  uint64_t v12 = *v11;
  uint64_t v13 = (void *)(*v11 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_fileManager);
  uint64_t v14 = v13[3];
  uint64_t v15 = v13[4];
  __swift_project_boxed_opaque_existential_1(v13, v14);
  sub_1A9119550();
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 128))(v4, v14, v15);
  uint64_t v35 = v13;
  uint64_t v36 = v12;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v19 = v35;
    uint64_t v18 = v36;
    v33[1] = v16;
    char v20 = (uint64_t *)(v16 + 40);
    long long v34 = xmmword_1A916E200;
    uint64_t v37 = OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_lock;
    unint64_t v38 = (uint64_t *)(v36 + 40);
    do
    {
      uint64_t v40 = v17;
      uint64_t v21 = *(v20 - 1);
      uint64_t v22 = *v20;
      swift_bridgeObjectRetain();
      os_unfair_lock_lock_with_options();
      uint64_t v39 = v22;
      uint64_t v23 = sub_1A911A9E4(v21, v22);
      uint64_t v24 = v19[3];
      uint64_t v25 = v19[4];
      __swift_project_boxed_opaque_existential_1(v19, v24);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 24))(v23, v24, v25);
      swift_release();
      char v26 = v38;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_1A90A1D98(v21, v39);
      char v29 = v28;
      swift_bridgeObjectRelease();
      if (v29)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v31 = *v26;
        uint64_t v41 = *v26;
        uint64_t *v26 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1A90BF68C();
          uint64_t v31 = v41;
        }
        swift_bridgeObjectRelease();
        sub_1A914D038(v27, v31);
        uint64_t *v26 = v31;
        swift_bridgeObjectRelease();
      }
      v20 += 2;
      swift_endAccess();
      swift_release();
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)(v18 + v37) + 16));
      swift_bridgeObjectRelease();
      uint64_t v17 = v40 - 1;
    }
    while (v40 != 1);
  }
  return swift_bridgeObjectRelease();
}

void UploadBatchEventProcessor.flush(callbackQueue:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(v3 + 16);
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 1107296256;
    v7[2] = sub_1A908CD10;
    v7[3] = &block_descriptor_10;
    uint64_t v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v5, sel_flushWithCallbackQueue_completion_, a1, v6);
  _Block_release(v6);
}

uint64_t sub_1A914C858(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1A90A1D98(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A90BF68C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1A914D038(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A914C928(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1A90BD8BC(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v11 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A90BFA2C();
    uint64_t v7 = v11;
  }
  uint64_t v8 = *(void *)(v7 + 48) + 40 * v4;
  sub_1A90C14CC(*(void *)v8, *(void *)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 24), *(unsigned char *)(v8 + 32));
  uint64_t v9 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_1A914D210(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v9;
}

double sub_1A914CA10@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1A90A28B4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1A90BFC20();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_1A916B7A0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_1A90A1A68((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1A914D484(v6, v9);
    *uint64_t v3 = v9;
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

double sub_1A914CB3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A914CB94(a1, a2, (void (*)(unint64_t, uint64_t))sub_1A908EC8C, (void (*)(void))sub_1A90C00D4, a3);
}

double sub_1A914CB68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A914CB94(a1, a2, (void (*)(unint64_t, uint64_t))sub_1A908EC8C, (void (*)(void))sub_1A90C0104, a3);
}

double sub_1A914CB94@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(unint64_t, uint64_t)@<X2>, void (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = v5;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_1A90A1D98(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v8;
    uint64_t v17 = *v8;
    *uint64_t v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      a4();
      uint64_t v15 = v17;
    }
    swift_bridgeObjectRelease();
    a3(*(void *)(v15 + 56) + 40 * v12, a5);
    sub_1A914D740(v12, v15);
    *uint64_t v8 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a5 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1A914CCBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A90A1D98(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1A90C0334();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for Tracker.Timer(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1A914EB98(v12 + *(void *)(v20 + 72) * v8, a3, type metadata accessor for Tracker.Timer);
    sub_1A914D92C(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for Tracker.Timer(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

unint64_t sub_1A914CE60(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1A916B620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A916BAB0();
        swift_bridgeObjectRetain();
        sub_1A916B030();
        uint64_t v10 = sub_1A916BAD0();
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
  uint64_t *v18 = v20 & v19;
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

unint64_t sub_1A914D038(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1A916B620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A916BAB0();
        swift_bridgeObjectRetain();
        sub_1A916B030();
        uint64_t v9 = sub_1A916BAD0();
        double result = swift_bridgeObjectRelease();
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

unint64_t sub_1A914D210(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1A916B620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      uint64_t v32 = v2;
      uint64_t v33 = v4;
      unint64_t v31 = (result + 1) & v7;
      do
      {
        uint64_t v8 = 40 * v6;
        uint64_t v9 = *(void *)(v2 + 48) + 40 * v6;
        uint64_t v11 = *(void *)v9;
        uint64_t v10 = *(void *)(v9 + 8);
        uint64_t v13 = *(void *)(v9 + 16);
        uint64_t v12 = *(void *)(v9 + 24);
        char v14 = *(unsigned char *)(v9 + 32);
        sub_1A916BAB0();
        sub_1A916BAC0();
        swift_bridgeObjectRetain();
        if (v14)
        {
          swift_bridgeObjectRetain();
          sub_1A916B030();
        }
        sub_1A916B030();
        uint64_t v15 = sub_1A916BAD0();
        double result = sub_1A90C14CC(v11, v10, v13, v12, v14);
        unint64_t v16 = v15 & v7;
        if (v3 >= (uint64_t)v31)
        {
          uint64_t v2 = v32;
          uint64_t v4 = v33;
          if (v16 < v31) {
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t v2 = v32;
          uint64_t v4 = v33;
          if (v16 >= v31) {
            goto LABEL_13;
          }
        }
        if (v3 >= (uint64_t)v16)
        {
LABEL_13:
          uint64_t v17 = *(void *)(v2 + 48);
          unint64_t v18 = v17 + 40 * v3;
          uint64_t v19 = (long long *)(v17 + v8);
          if (40 * v3 < v8 || v18 >= (unint64_t)v19 + 40 || v3 != v6)
          {
            long long v20 = *v19;
            long long v21 = v19[1];
            *(void *)(v18 + 32) = *((void *)v19 + 4);
            *(_OWORD *)unint64_t v18 = v20;
            *(_OWORD *)(v18 + 16) = v21;
          }
          uint64_t v22 = *(void *)(v2 + 56);
          uint64_t v23 = (_OWORD *)(v22 + 16 * v3);
          uint64_t v24 = (_OWORD *)(v22 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v23 >= v24 + 1))
          {
            *uint64_t v23 = *v24;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << result) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(v2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = v30;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_1A914D484(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916B7A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v38 = a2 + 64;
    unint64_t result = sub_1A916B620();
    uint64_t v12 = v38;
    if ((*(void *)(v38 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v36 = (result + 1) & v11;
      char v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v35 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v37 = v13;
      unint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v35(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        uint64_t v18 = sub_1A916AF00();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_17:
            uint64_t v22 = *(void *)(a2 + 48);
            unint64_t result = v22 + v15 * a1;
            unint64_t v23 = v22 + v17 + v15;
            if (v15 * a1 < v17 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v17)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v25 = *(void *)(a2 + 56);
            uint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            uint64_t v27 = (_OWORD *)(v25 + 32 * v10);
            uint64_t v12 = v38;
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              long long v28 = v27[1];
              _OWORD *v26 = *v27;
              v26[1] = v28;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_17;
        }
        uint64_t v12 = v38;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    BOOL v29 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v29 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  uint64_t *v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1A914D740(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1A916B620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A916BAB0();
        swift_bridgeObjectRetain();
        sub_1A916B030();
        uint64_t v11 = sub_1A916BAD0();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          char v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *char v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1A914D92C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1A916B620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_1A916BAB0();
        swift_bridgeObjectRetain();
        sub_1A916B030();
        uint64_t v9 = sub_1A916BAD0();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *unint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for Tracker.Timer(0) - 8) + 72);
        int64_t v16 = v15 * v3;
        unint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
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

void *sub_1A914DB3C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v32[3] = type metadata accessor for DocumentDirectoryUploadDropboxPathProvider(0);
  v32[4] = &off_1EFFA2578;
  v32[0] = a3;
  v31[3] = type metadata accessor for UploadDropboxFileManager();
  v31[4] = &off_1EFFA1230;
  v31[0] = a4;
  a7[5] = MEMORY[0x1E4FBC868];
  uint64_t v14 = (char *)a7 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_currentSession;
  uint64_t v15 = type metadata accessor for Session();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_lock;
  type metadata accessor for UnfairLock();
  uint64_t v17 = swift_allocObject();
  unint64_t v18 = (_DWORD *)swift_slowAlloc();
  *(void *)(v17 + 16) = v18;
  _DWORD *v18 = 0;
  *(void *)((char *)a7 + v16) = v17;
  *(_DWORD *)(v17 + 24) = 0x10000;
  a7[2] = a1;
  a7[3] = a2;
  sub_1A90A0DC8((uint64_t)v32, (uint64_t)a7 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_pathProvider);
  sub_1A90A0DC8((uint64_t)v31, (uint64_t)a7 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_fileManager);
  *(void *)((char *)a7 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_contentType) = a5;
  *(void *)((char *)a7 + OBJC_IVAR____TtC12AppAnalytics13UploadDropbox_transparencyLogging) = a6;
  sub_1A90A0DC8((uint64_t)v32, (uint64_t)v30);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  sub_1A908EC8C(v30, v19 + 24);
  sub_1A90A6D60(0, &qword_1EB68A7F8, type metadata accessor for UploadDropbox.Debugging, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Lazy);
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v21 = (char *)v20 + *(void *)(*v20 + 96);
  uint64_t v22 = type metadata accessor for UploadDropbox.Debugging(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = *(void *)(*v20 + 104);
  uint64_t v24 = swift_allocObject();
  id v25 = a2;
  id v26 = a1;
  id v27 = a6;
  long long v28 = (_DWORD *)swift_slowAlloc();
  *(void *)(v24 + 16) = v28;
  *long long v28 = 0;
  *(_DWORD *)(v24 + 24) = 0x10000;
  *(void *)((char *)v20 + v23) = v24;
  v20[2] = sub_1A9120304;
  v20[3] = v19;
  *(void *)((char *)v20 + *(void *)(*v20 + 112)) = 1;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  a7[4] = v20;
  return a7;
}

uint64_t sub_1A914DE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_currentSession;
  uint64_t v7 = type metadata accessor for Session();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = &off_1EFFA0B50;
  *(unsigned char *)(a3 + OBJC_IVAR____TtC12AppAnalytics25UploadBatchEventProcessor_isEnabled) = 1;
  uint64_t v8 = qword_1EB68ACE8;
  swift_unknownObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_1EB689AA0;
  sub_1A914E924(0, (unint64_t *)&qword_1EB68ACD8, (unint64_t *)&qword_1EB68A920, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1A916E200;
  uint64_t v11 = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v12 = sub_1A90A67C0();
  *(void *)(v10 + 64) = v12;
  *(void *)(v10 + 32) = 1702195828;
  *(void *)(v10 + 40) = 0xE400000000000000;
  id v13 = v9;
  unint64_t v14 = ContentType.description.getter(a2);
  *(void *)(v10 + 96) = v11;
  *(void *)(v10 + 104) = v12;
  *(void *)(v10 + 72) = v14;
  *(void *)(v10 + 80) = v15;
  sub_1A916B3D0();
  sub_1A916AD30();

  swift_bridgeObjectRelease();
  swift_release();
  return a3;
}

uint64_t _s12AppAnalytics25UploadBatchEventProcessorC6client8endpoint11contentType6configAcA6ClientC_AA08EndpointJ0_pAA07ContentJ0OAA0cdE6ConfigCtcfC_0(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v60 = a4;
  uint64_t v67 = a3;
  id v59 = a1;
  uint64_t v66 = sub_1A916B430();
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x1F4188790](v66);
  uint64_t v65 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1A916B420();
  MEMORY[0x1F4188790](v62);
  uint64_t v63 = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A916AE10();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v61 = (char *)v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A916AAD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UploadDropboxFileManager();
  uint64_t v13 = swift_allocObject();
  type metadata accessor for MescalSigner();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = type metadata accessor for SHA1Base64SigningService();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = &off_1EFF9D600;
  uint64_t v17 = type metadata accessor for URLSessionUploadClientFactory();
  uint64_t v18 = swift_allocObject();
  sub_1A90C9C38();
  uint64_t v19 = swift_allocObject();
  uint64_t v74 = v17;
  unint64_t v75 = &protocol witness table for URLSessionUploadClientFactory;
  v73[0] = v18;
  uint64_t v71 = v15;
  uint64_t v72 = &off_1EFF9DA20;
  *(void *)&long long v70 = v16;
  uint64_t v20 = qword_1EB688710;
  if (qword_1EB688798 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1A916AD50();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EB68D9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19 + v20, v22, v21);
  type metadata accessor for UploadEndpoint();
  uint64_t v23 = swift_allocObject();
  long long v69 = &unk_1EFFAEEB0;
  uint64_t v24 = swift_dynamicCastObjCProtocolConditional();
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = (uint64_t)a2;
  }
  *(void *)(v23 + 16) = v25;
  *(unsigned char *)(v23 + 24) = v24 != 0;
  *(void *)(v19 + 16) = v23;
  sub_1A90A0DC8((uint64_t)&v70, v19 + 40);
  *(void *)(v19 + 24) = 1885960807;
  *(void *)(v19 + 32) = 0xE400000000000000;
  sub_1A90A0DC8((uint64_t)v73, v19 + 80);
  *(unsigned char *)(v19 + 120) = 0;
  sub_1A90A0DC8((uint64_t)v73, (uint64_t)v68);
  uint64_t v26 = swift_allocObject();
  sub_1A908EC8C(v68, v26 + 16);
  sub_1A914E924(0, &qword_1EB68A7F0, &qword_1EB689A98, (uint64_t)&protocol descriptor for UploadClient, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Lazy);
  uint64_t v27 = swift_allocObject();
  type metadata accessor for UnfairLock();
  *(_OWORD *)(v27 + 32) = 0u;
  *(_OWORD *)(v27 + 48) = 0u;
  *(void *)(v27 + 64) = 0;
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectRetain();
  BOOL v29 = (_DWORD *)swift_slowAlloc();
  *(void *)(v28 + 16) = v29;
  _DWORD *v29 = 0;
  *(_DWORD *)(v28 + 24) = 0x10000;
  *(void *)(v27 + 16) = sub_1A914EC70;
  *(void *)(v27 + 24) = v26;
  *(void *)(v27 + 72) = v28;
  *(void *)(v27 + 80) = 1;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v73);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v70);
  *(void *)(v19 + 128) = v27;
  uint64_t v30 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, (uint64_t)v60 + OBJC_IVAR___AAUploadBatchEventConfig_directory, v9);
  id v31 = v59;
  uint64_t v32 = v30;
  id v33 = objc_msgSend(a2, sel_name);
  uint64_t v34 = sub_1A916AF90();
  uint64_t v36 = v35;

  type metadata accessor for DocumentDirectoryUploadDropboxPathProvider(0);
  uint64_t v37 = swift_allocObject();
  swift_retain();
  uint64_t v38 = sub_1A908B338((uint64_t)v12, v34, v36, v13, v37);
  LOBYTE(v37) = v32[OBJC_IVAR___AAUploadBatchEventConfig_transparencyLoggingEnabled];
  id v39 = objc_allocWithZone((Class)type metadata accessor for TransparencyLogging());
  swift_retain();
  id v40 = sub_1A90A9FD4(v37);
  uint64_t v41 = type metadata accessor for UploadDropbox(0);
  unint64_t v42 = (void *)swift_allocObject();
  id v59 = v31;
  uint64_t v43 = v13;
  uint64_t v60 = (void *)v13;
  uint64_t v44 = v67;
  uint64_t v45 = sub_1A914DB3C(v31, v32, v38, v43, v67, v40, v42);

  v58[1] = a2;
  uint64_t v74 = v41;
  unint64_t v75 = &off_1EFFA0998;
  v73[0] = v45;
  type metadata accessor for UploadManager();
  uint64_t v46 = (void *)swift_allocObject();
  uint64_t v47 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v73, v41);
  v58[0] = v58;
  MEMORY[0x1F4188790](v47);
  uint64_t v49 = (void *)((char *)v58 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v50 + 16))(v49);
  uint64_t v51 = *v49;
  uint64_t v71 = v41;
  uint64_t v72 = &off_1EFFA0998;
  *(void *)&long long v70 = v51;
  v46[10] = MEMORY[0x1E4FBC868];
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = v32;
  uint64_t v54 = (_DWORD *)swift_slowAlloc();
  *(void *)(v52 + 16) = v54;
  *uint64_t v54 = 0;
  *(_DWORD *)(v52 + 24) = 0x10000;
  v46[11] = v52;
  sub_1A90A601C();
  sub_1A916AE00();
  *(void *)&v68[0] = MEMORY[0x1E4FBC860];
  sub_1A90A605C();
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68A8F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  sub_1A90A60B4();
  sub_1A916B610();
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v65, *MEMORY[0x1E4FBCC68], v66);
  v46[12] = sub_1A916B480();
  v46[2] = v19;
  v46[3] = &off_1EFF9E098;
  sub_1A908EC8C(&v70, (uint64_t)(v46 + 4));
  v46[9] = v53;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v73);
  type metadata accessor for UploadBatchEventProcessor();
  uint64_t v55 = swift_allocObject();
  uint64_t v56 = sub_1A914DE1C((uint64_t)v46, v44, v55);
  swift_release();

  swift_unknownObjectRelease();
  return v56;
}

uint64_t sub_1A914E844(uint64_t a1)
{
  sub_1A90A6D60(0, (unint64_t *)&qword_1EB68ACC8, (uint64_t (*)(uint64_t))type metadata accessor for Session, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1A914E8D0()
{
  unint64_t result = qword_1E97B1BC0;
  if (!qword_1E97B1BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BC0);
  }
  return result;
}

void sub_1A914E924(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1A908E870(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1A914E98C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Session();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A914E9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Session();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A914EA50()
{
  unint64_t result = qword_1E97B1BC8;
  if (!qword_1E97B1BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BC8);
  }
  return result;
}

uint64_t sub_1A914EAA4()
{
  return type metadata accessor for UploadBatchEventProcessor();
}

uint64_t method lookup function for UploadBatchEventProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UploadBatchEventProcessor);
}

unsigned char *storeEnumTagSinglePayload for UploadBatchEventProcessor.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A914EB60);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UploadBatchEventProcessor.Errors()
{
  return &type metadata for UploadBatchEventProcessor.Errors;
}

uint64_t sub_1A914EB98(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A914EC00()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A914EC38()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A914EC70()
{
  return sub_1A90D8C50((void *)(v0 + 16));
}

uint64_t sub_1A914EC78()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1A914ECB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A91518F4(v1, a1);
}

uint64_t sub_1A914ECC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = unk_1EFF9CAA8;
  if ((unk_1EFF9CAA8 & ~qword_1EFF9CAA0) == 0) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = qword_1EFF9CAB0;
  if ((qword_1EFF9CAB0 & ~(v2 | qword_1EFF9CAA0)) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | v2 | qword_1EFF9CAA0;
  type metadata accessor for FlushProcessor();
  uint64_t v5 = (void *)swift_allocObject();
  swift_weakInit();
  v5[4] = v4;
  v5[5] = 0x404E000000000000;
  v5[6] = 0;
  v5[3] = dispatch_group_create();
  *(void *)(a1 + 40) = &type metadata for TimestampJitter;
  *(void *)(a1 + 48) = &protocol witness table for TimestampJitter;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  type metadata accessor for DisabledPrivacyValidationProvider();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  uint64_t v7 = type metadata accessor for SessionManagerConfiguration();
  uint64_t v8 = a1 + *(int *)(v7 + 32);
  sub_1A916ACB0();
  uint64_t result = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v10 = (void *)(v8 + *(int *)(result + 20));
  *uint64_t v10 = sub_1A90A80E4;
  v10[1] = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = &protocol witness table for DisabledPrivacyValidationProvider;
  *(_WORD *)(a1 + *(int *)(v7 + 36)) = 0;
  return result;
}

id BridgedAppSessionManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id BridgedAppSessionManager.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = qword_1EB689590;
  uint64_t v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1EB689580;
  type metadata accessor for AppSessionManager();
  uint64_t v5 = (void *)swift_allocObject();
  v5[5] = 0;
  v5[6] = 0;
  v5[7] = MEMORY[0x1E4FBC860];
  v5[2] = 0;
  v5[3] = v4;
  id v6 = v4;
  v5[4] = dispatch_group_create();
  if (qword_1EB688FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v7 = qword_1EB688F98;
  v5[11] = type metadata accessor for CrashDetector();
  v5[12] = &protocol witness table for CrashDetector;
  v5[8] = v7;
  uint64_t v8 = qword_1EB6887D0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for SummaryEventConfiguration(0);
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EB688098);
  sub_1A914FB10(v10, (uint64_t)v5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);

  *(void *)&v3[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v5;
  v12.receiver = v3;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

id BridgedAppSessionManager.__allocating_init(trackingConsent:)(void *a1)
{
  uint64_t v3 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone(v1);
  uint64_t v7 = qword_1EB6887D0;
  uint64_t v8 = (char *)v6;
  id v9 = a1;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v3, (uint64_t)qword_1EB688098);
  sub_1A914FB10(v10, (uint64_t)v5);
  if (qword_1EB689590 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_1EB688FA8;
  id v12 = (id)qword_1EB689580;
  if (v11 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v13 = qword_1EB688F98;
  type metadata accessor for AppSessionManager();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = sub_1A914FB74((uint64_t)v12, (uint64_t)v9, v13, (uint64_t)v5, v14);
  swift_retain();

  *(void *)&v8[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v15;
  v19.receiver = v8;
  v19.super_class = v1;
  id v16 = objc_msgSendSuper2(&v19, sel_init);

  return v16;
}

id BridgedAppSessionManager.init(trackingConsent:)(void *a1)
{
  id v2 = sub_1A914FC24(a1);

  return v2;
}

id BridgedAppSessionManager.createBridgedSessionManager()()
{
  uint64_t v0 = type metadata accessor for SessionManagerConfiguration();
  MEMORY[0x1F4188790](v0 - 8);
  id v2 = (uint64_t *)((char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A914ECC0((uint64_t)v2);
  uint64_t v3 = AppSessionManager.createSessionManager(with:)(v2);
  sub_1A914FDFC((uint64_t)v2);
  id v4 = objc_allocWithZone((Class)type metadata accessor for BridgedSessionManager());
  return sub_1A9156088((uint64_t)v3);
}

Swift::Void __swiftcall BridgedAppSessionManager.startAppSession()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 1;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_1A908CAA8(v2, (uint64_t)sub_1A90ACDD0, v3);

  swift_release();
}

Swift::Void __swiftcall BridgedAppSessionManager.startAppSession(shouldCorrelateSceneSessions:)(Swift::Bool shouldCorrelateSceneSessions)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = shouldCorrelateSceneSessions;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  sub_1A908CAA8(v4, (uint64_t)sub_1A91465C0, v5);

  swift_release();
}

uint64_t BridgedAppSessionManager.endAppSession(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A916AC90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  swift_retain();
  sub_1A916AC80();
  uint64_t v14 = *(void *)(v12 + 24);
  v20[1] = *(void *)(v12 + 32);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v8, v5);
  uint64_t v18 = (uint64_t (**)())(v17 + v16);
  _DWORD *v18 = sub_1A90CB324;
  v18[1] = (uint64_t (*)())v13;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v14, (uint64_t)sub_1A91463B8, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

Swift::Void __swiftcall BridgedAppSessionManager.appSessionDidTerminate()()
{
  uint64_t v0 = sub_1A916AE10();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A90F82A4();
  sub_1A914FF7C();
  sub_1A916B450();
  unint64_t v3 = v7;
  if (!(v7 >> 62))
  {
    uint64_t v4 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1A916ADD0();
    sub_1A90F844C((uint64_t)v2);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1A916B7E0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_12;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        MEMORY[0x1AD0EDEF0](i, v3);
      }
      else {
        swift_retain();
      }
      if (swift_weakLoadStrong())
      {
        SessionManager.endSync(timeout:)(1.0);
        swift_release();
      }
      swift_release();
    }
    goto LABEL_12;
  }
  __break(1u);
}

id BridgedAppSessionManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A914FB10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_1A914FB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v14 = type metadata accessor for CrashDetector();
  unint64_t v15 = &protocol witness table for CrashDetector;
  *(void *)&long long v13 = a3;
  a5[5] = 0;
  a5[6] = 0;
  a5[7] = MEMORY[0x1E4FBC860];
  a5[2] = 0;
  a5[3] = a1;
  uint64_t v10 = *(void **)(a2 + OBJC_IVAR___AATrackingConsent_accessGroup);
  a5[4] = v10;
  sub_1A908EC8C(&v13, (uint64_t)(a5 + 8));
  sub_1A90A86B4(a4, (uint64_t)a5 + OBJC_IVAR____TtC12AppAnalytics17AppSessionManager_summaryEventConfiguration);
  id v11 = v10;
  return a5;
}

id sub_1A914FC24(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = qword_1EB6887D0;
  uint64_t v8 = v1;
  id v9 = a1;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_1EB688098);
  sub_1A914FB10(v10, (uint64_t)v6);
  if (qword_1EB689590 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_1EB688FA8;
  id v12 = (id)qword_1EB689580;
  if (v11 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v13 = qword_1EB688F98;
  type metadata accessor for AppSessionManager();
  uint64_t v14 = (void *)swift_allocObject();
  unint64_t v15 = sub_1A914FB74((uint64_t)v12, (uint64_t)v9, v13, (uint64_t)v6, v14);
  swift_retain();

  *(void *)&v8[OBJC_IVAR___AAAppSessionManager_appSessionManager] = v15;
  v18.receiver = v8;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t sub_1A914FDFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SessionManagerConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A914FE58()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A914FE90()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

void sub_1A914FF7C()
{
  if (!qword_1EB686CF0)
  {
    type metadata accessor for WeakSessionManager();
    unint64_t v0 = sub_1A916B230();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB686CF0);
    }
  }
}

uint64_t type metadata accessor for BridgedAppSessionManager()
{
  return self;
}

uint64_t method lookup function for BridgedAppSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedAppSessionManager);
}

uint64_t dispatch thunk of BridgedAppSessionManager.__allocating_init(trackingConsent:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1A9150024()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t FlushProcessor.__allocating_init(flushEvents:flushInterval:)(uint64_t *a1, double a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = *a1;
  swift_weakInit();
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 32) = v5;
  *(double *)(v4 + 40) = a2;
  *(void *)(v4 + 24) = dispatch_group_create();
  return v4;
}

AppAnalytics::FlushEvents __swiftcall FlushEvents.init(rawValue:)(AppAnalytics::FlushEvents rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static FlushEvents.didUpdateSession.getter(void *a1@<X8>)
{
  *a1 = 2;
}

uint64_t FlushEvents.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t sub_1A91500F0()
{
  return swift_weakLoadStrong();
}

uint64_t sub_1A9150134()
{
  return swift_release();
}

void (*sub_1A9150188(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1A9150204;
}

void sub_1A9150204(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_weakAssign();
  if (a2)
  {
    swift_release();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_release();
  }

  free(v3);
}

id FlushProcessor.sessionEndFlushGroup.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t FlushProcessor.deinit()
{
  if (*(void *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A916B4D0();
    *(void *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_weakDestroy();

  swift_unknownObjectRelease();
  return v0;
}

uint64_t FlushProcessor.__deallocating_deinit()
{
  if (*(void *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A916B4D0();
    *(void *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  swift_weakDestroy();

  swift_unknownObjectRelease();

  return MEMORY[0x1F4186488](v0, 56, 7);
}

void sub_1A91503A4()
{
  sub_1A909E728(0, &qword_1EB6883A0, MEMORY[0x1E4FBCB58], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v15 - v2;
  if (*(void *)(v0 + 48))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A916B4D0();
    *(void *)(v0 + 48) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  if ((*(unsigned char *)(v0 + 32) & 4) != 0)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v5 = Strong;
      unint64_t v6 = *(NSObject **)(v0 + 24);
      dispatch_group_enter(v6);
      uint64_t v7 = sub_1A916ADC0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
      id v8 = _s12AppAnalytics11AccessQueueC6globalyAC8Dispatch0F3QoSV0G6SClassOSgFZ_0((uint64_t)v3);
      sub_1A90F93B4((uint64_t)v3);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v6;
      uint64_t v10 = *(void *)(v5 + 48);
      uint64_t v11 = swift_allocObject();
      swift_weakInit();
      id v12 = (void *)swift_allocObject();
      void v12[2] = v11;
      v12[3] = v8;
      void v12[4] = sub_1A90AFEC8;
      v12[5] = v9;
      uint64_t v13 = v6;
      swift_retain();
      id v14 = v8;
      swift_retain();
      sub_1A908CAA8(v10, (uint64_t)sub_1A9090C14, (uint64_t)v12);
      swift_release();

      swift_release();
      swift_release();
      swift_release();
    }
  }
}

void sub_1A91505F4()
{
  if ((*(unsigned char *)(v0 + 32) & 8) != 0)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v2 = (void *)Strong;
      if (qword_1EB688398 != -1) {
        swift_once();
      }
      objc_msgSend(v2, sel_flushWithCallbackQueue_completion_, qword_1EB687E08, 0);
      swift_release();
    }
  }
}

void sub_1A915069C(void *a1)
{
  if (qword_1EB688798 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A916AD50();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB68D9C0);
  uint64_t v3 = sub_1A916AD40();
  os_log_type_t v4 = sub_1A916B3A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    sub_1A916B5A0();
    _os_log_impl(&dword_1A9088000, v3, v4, "Flushing analytics data based on %g-second flush interval", v5, 0xCu);
    MEMORY[0x1AD0EECA0](v5, -1, -1);
  }

  if (a1)
  {
    if (qword_1EB688398 != -1) {
      swift_once();
    }
    objc_msgSend(a1, sel_flushWithCallbackQueue_completion_, qword_1EB687E08, 0);
  }
}

uint64_t sub_1A9150810()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A9150848()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A9150880()
{
  swift_release();

  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 48, 7);
}

unint64_t sub_1A91508D4()
{
  unint64_t result = qword_1E97B1BD8;
  if (!qword_1E97B1BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BD8);
  }
  return result;
}

unint64_t sub_1A915092C()
{
  unint64_t result = qword_1E97B1BE0;
  if (!qword_1E97B1BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BE0);
  }
  return result;
}

uint64_t sub_1A9150980@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_1A91509D0()
{
  return swift_weakAssign();
}

uint64_t method lookup function for FlushProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FlushProcessor);
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FlushProcessor.sessionManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of FlushProcessor.__allocating_init(flushEvents:flushInterval:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of FlushProcessor.didStartSession(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of FlushProcessor.didUpdateSession(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of FlushProcessor.didEndSession(_:endDate:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of FlushProcessor.didLeaveGroup(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of FlushProcessor.process<A>(processEvent:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_1A9150B6C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1A9150BA4()
{
  sub_1A915069C(*(void **)(v0 + 24));
}

unint64_t SessionChange.init(rawValue:)(unint64_t a1)
{
  return sub_1A90B0E88(a1);
}

unint64_t sub_1A9150BD4()
{
  unint64_t result = qword_1E97B1BE8;
  if (!qword_1E97B1BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionChange()
{
  return &type metadata for SessionChange;
}

uint64_t sub_1A9150C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A9150F48();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = *(void **)(v2 + 16);
  char v9 = *(unsigned char *)(v2 + 24);
  swift_unknownObjectRetain();
  if (v9)
  {
    id v10 = objc_msgSend(v8, sel_endpointURLWithContentType_, a1);
    if (v10)
    {
      uint64_t v11 = v10;
      sub_1A916AA70();
      swift_unknownObjectRelease();

      uint64_t v12 = sub_1A916AAD0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
    }
    else
    {
      swift_unknownObjectRelease();
      uint64_t v17 = sub_1A916AAD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
    }
    return sub_1A9150FA0((uint64_t)v7, a2);
  }
  else
  {
    id v13 = objc_msgSend(v8, sel_url);
    sub_1A916AA70();
    swift_unknownObjectRelease();

    uint64_t v14 = sub_1A916AAD0();
    uint64_t v15 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    return v15(a2, 0, 1, v14);
  }
}

uint64_t sub_1A9150E1C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186488](v0, 25, 7);
}

uint64_t type metadata accessor for UploadEndpoint()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for UploadEndpoint.Wrapper()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for UploadEndpoint.Wrapper(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UploadEndpoint.Wrapper()
{
  return &type metadata for UploadEndpoint.Wrapper;
}

void sub_1A9150F48()
{
  if (!qword_1EB6899A0)
  {
    sub_1A916AAD0();
    unint64_t v0 = sub_1A916B540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB6899A0);
    }
  }
}

uint64_t sub_1A9150FA0(uint64_t a1, uint64_t a2)
{
  sub_1A9150F48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9151008()
{
  return swift_unknownObjectWeakAssign();
}

id BridgedSessionObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedSessionObserver.init()()
{
}

id BridgedSessionObserver.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedSessionObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedSessionObserver()
{
  return self;
}

uint64_t method lookup function for BridgedSessionObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedSessionObserver);
}

uint64_t dispatch thunk of BridgedSessionObserver.dispose(on:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t sub_1A9151180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a1, a2, a3, ObjectType, v7);
}

uint64_t sub_1A91511F0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for ProxyEventProcessor()
{
  return self;
}

uint64_t sub_1A9151258(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_1A91512B0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 24))(a1, ObjectType, v3);
}

uint64_t sub_1A9151308(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
}

uint64_t sub_1A9151360(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(a1, ObjectType, v3);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 48))(a1, 0, ObjectType, v3);
}

uint64_t sub_1A91513E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, a2, ObjectType, v5);
}

uint64_t sub_1A9151450()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1A915147C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  void aBlock[6] = &unk_1EFFAB778;
  uint64_t result = swift_dynamicCastObjCProtocolConditional();
  if (result)
  {
    uint64_t v7 = (void *)result;
    if (a2)
    {
      aBlock[4] = a2;
      aBlock[5] = a3;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1A908CD10;
      aBlock[3] = &block_descriptor_12;
      id v8 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      sub_1A90A0418((uint64_t)a2);
      swift_release();
    }
    else
    {
      swift_unknownObjectRetain();
      id v8 = 0;
    }
    objc_msgSend(v7, sel_flushWithCallbackQueue_completion_, a1, v8);
    _Block_release(v8);
    return swift_unknownObjectRelease();
  }
  else if (a2)
  {
    return a2();
  }
  return result;
}

uint64_t sub_1A9151668()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A91516A0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A91516B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1A91516C8@<X0>(uint64_t a1@<X8>)
{
  sub_1A90A3B7C(0, (unint64_t *)&qword_1EB6899A0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  id v8 = &v15[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider____lazy_storage___debugBaseURL;
  swift_beginAccess();
  sub_1A90A39C8(v9, (uint64_t)v8);
  uint64_t v10 = sub_1A916AAD0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_1A90A3A5C((uint64_t)v8);
  uint64_t v12 = *(void *)(v1
                  + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_staticPathProvider
                  + 24);
  uint64_t v13 = *(void *)(v1
                  + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_staticPathProvider
                  + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_staticPathProvider), v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v5, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_1A90A3AE8((uint64_t)v5, v9);
  return swift_endAccess();
}

uint64_t sub_1A91518F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A90A7994(a1, &OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_debugBaseURL, a2);
}

uint64_t sub_1A9151900()
{
  sub_1A90A3A5C(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider____lazy_storage___baseURL);
  sub_1A90A3A5C(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider____lazy_storage___debugBaseURL);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_fileManager);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC12AppAnalytics42DocumentDirectoryUploadDropboxPathProvider_staticPathProvider);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A91519A8()
{
  return type metadata accessor for DocumentDirectoryUploadDropboxPathProvider(0);
}

uint64_t sub_1A91519B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1A91516C8(a1);
}

uint64_t sub_1A91519D4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_baseURL;
  uint64_t v2 = sub_1A916AAD0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_debugBaseURL, v2);
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v4, v5);
}

uint64_t sub_1A9151AA4()
{
  return type metadata accessor for BaseDocumentDirectoryUploadDropboxPathProvider(0);
}

uint64_t sub_1A9151AAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9151AC4(&OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_baseURL, a1);
}

uint64_t sub_1A9151AB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9151AC4(&OBJC_IVAR____TtC12AppAnalytics46BaseDocumentDirectoryUploadDropboxPathProvider_debugBaseURL, a1);
}

uint64_t sub_1A9151AC4@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2 + *a1;
  uint64_t v5 = sub_1A916AAD0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_1A9151B38@<X0>(uint64_t a1@<X8>)
{
  return sub_1A90A7AA0(&OBJC_IVAR____TtC12AppAnalytics31StaticUploadDropboxPathProvider____lazy_storage___debugBaseURL, &OBJC_IVAR____TtC12AppAnalytics31StaticUploadDropboxPathProvider_debugURLProvider, a1);
}

uint64_t sub_1A9151B58()
{
  sub_1A90A3A5C(v0 + OBJC_IVAR____TtC12AppAnalytics31StaticUploadDropboxPathProvider____lazy_storage___baseURL);
  sub_1A90A3A5C(v0 + OBJC_IVAR____TtC12AppAnalytics31StaticUploadDropboxPathProvider____lazy_storage___debugBaseURL);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC12AppAnalytics31StaticUploadDropboxPathProvider_fileManager);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A9151C04()
{
  return type metadata accessor for StaticUploadDropboxPathProvider(0);
}

uint64_t sub_1A9151C0C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9151B38(a1);
}

uint64_t sub_1A9151C30()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t DataEventTrait.hash(into:)()
{
  return sub_1A916BAC0();
}

BOOL static DataEventTrait.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataEventTrait.hashValue.getter()
{
  return sub_1A916BAD0();
}

unint64_t sub_1A9151CFC()
{
  unint64_t result = qword_1E97B1BF8;
  if (!qword_1E97B1BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1BF8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DataEventTrait(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9151E1CLL);
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

id BridgedSessionData.__allocating_init(key:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  id v8 = &v7[OBJC_IVAR___AASessionData_key];
  *(void *)id v8 = a1;
  *((void *)v8 + 1) = a2;
  *(void *)&v7[OBJC_IVAR___AASessionData_data] = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id BridgedSessionData.init(key:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v8 = &v3[OBJC_IVAR___AASessionData_key];
  *(void *)id v8 = a1;
  *((void *)v8 + 1) = a2;
  *(void *)&v3[OBJC_IVAR___AASessionData_data] = a3;
  v10.receiver = v3;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id BridgedSessionData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedSessionData.init()()
{
}

id BridgedSessionData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedSessionData()
{
  return self;
}

uint64_t method lookup function for BridgedSessionData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedSessionData);
}

uint64_t dispatch thunk of BridgedSessionData.__allocating_init(key:data:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id BridgedEventProperty.__allocating_init(dataType:requirement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___AAEventProperty_dataType] = a1;
  *(void *)&v5[OBJC_IVAR___AAEventProperty_requirement] = a2;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v7 = v5;
  id v8 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  uint64_t v9 = sub_1A916AF90();
  uint64_t v11 = v10;

  uint64_t v12 = (uint64_t *)&v7[OBJC_IVAR___AAEventProperty_dataKey];
  *uint64_t v12 = v9;
  v12[1] = v11;

  v14.receiver = v7;
  v14.super_class = v2;
  return objc_msgSendSuper2(&v14, sel_init);
}

id BridgedEventProperty.init(dataType:requirement:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR___AAEventProperty_dataType] = a1;
  *(void *)&v2[OBJC_IVAR___AAEventProperty_requirement] = a2;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  unsigned int v4 = v2;
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;

  uint64_t v9 = (uint64_t *)&v4[OBJC_IVAR___AAEventProperty_dataKey];
  *uint64_t v9 = v6;
  v9[1] = v8;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for BridgedEventProperty()
{
  return self;
}

id BridgedEventProperty.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedEventProperty.init()()
{
}

id BridgedEventProperty.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BridgedEventProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedEventProperty);
}

uint64_t dispatch thunk of BridgedEventProperty.__allocating_init(dataType:requirement:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A9152470()
{
  uint64_t v29 = type metadata accessor for SequenceEntry.Kind(0);
  MEMORY[0x1F4188790](v29);
  objc_super v2 = (long long *)((char *)v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = type metadata accessor for SequenceEntry(0);
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  id v5 = (void *)((char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(v0 + *(int *)(type metadata accessor for Sequence(0) + 28));
  int64_t v7 = *(void *)(v6 + 16);
  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (v7)
  {
    uint64_t v36 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1A90B29B0(0, v7, 0);
    uint64_t v9 = *(unsigned __int8 *)(v3 + 80);
    v27[1] = v6;
    uint64_t v10 = v6 + ((v9 + 32) & ~v9);
    uint64_t v11 = *(void *)(v3 + 72);
    while (1)
    {
      sub_1A9097EF4(v10, (uint64_t)v5, type metadata accessor for SequenceEntry);
      uint64_t v13 = *v5;
      uint64_t v12 = v5[1];
      sub_1A9097EF4((uint64_t)v5 + *(int *)(v28 + 20), (uint64_t)v2, type metadata accessor for SequenceEntry.Kind);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload != 1)
        {
          sub_1A908EC8C(v2, (uint64_t)v30);
          goto LABEL_9;
        }
        uint64_t v31 = type metadata accessor for EventData();
        uint64_t v15 = type metadata accessor for EventData;
        unint64_t v16 = (unint64_t *)&unk_1EB688B50;
      }
      else
      {
        uint64_t v31 = type metadata accessor for TimedData();
        uint64_t v15 = type metadata accessor for TimedData;
        unint64_t v16 = (unint64_t *)&qword_1EB6893C8;
      }
      uint64_t v32 = sub_1A909A710(v16, (void (*)(uint64_t))v15);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
      sub_1A909A6A8((uint64_t)v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))v15);
LABEL_9:
      uint64_t v18 = v31;
      objc_super v19 = __swift_project_boxed_opaque_existential_1(v30, v31);
      *((void *)&v35 + 1) = v18;
      uint64_t v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v34);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v20, v19, v18);
      *(void *)&long long v33 = v13;
      *((void *)&v33 + 1) = v12;
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
      sub_1A9099E04((uint64_t)v5, type metadata accessor for SequenceEntry);
      uint64_t v8 = v36;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A90B29B0(0, *(void *)(v8 + 16) + 1, 1);
        uint64_t v8 = v36;
      }
      unint64_t v22 = *(void *)(v8 + 16);
      unint64_t v21 = *(void *)(v8 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_1A90B29B0(v21 > 1, v22 + 1, 1);
        uint64_t v8 = v36;
      }
      *(void *)(v8 + 16) = v22 + 1;
      uint64_t v23 = (_OWORD *)(v8 + 48 * v22);
      long long v24 = v33;
      long long v25 = v35;
      v23[3] = v34;
      v23[4] = v25;
      v23[2] = v24;
      v10 += v11;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
    }
  }
  return v8;
}

uint64_t sub_1A9152804@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for SequenceEntry.Kind(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SequenceEntry(0);
  sub_1A9097EF4((uint64_t)a1 + *(int *)(v11 + 20), (uint64_t)v10, type metadata accessor for SequenceEntry.Kind);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = *a1;
      uint64_t v13 = a1[1];
      sub_1A9097EF4(a2, (uint64_t)a4 + *(int *)(v11 + 20), (uint64_t (*)(void))type metadata accessor for EventData);
      *a4 = v14;
      a4[1] = v13;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_1A9097EF4((uint64_t)a1, (uint64_t)a4, type metadata accessor for SequenceEntry);
    }
  }
  else
  {
    uint64_t v16 = *a1;
    uint64_t v15 = a1[1];
    sub_1A9097EF4(a3, (uint64_t)a4 + *(int *)(v11 + 20), (uint64_t (*)(void))type metadata accessor for TimedData);
    *a4 = v16;
    a4[1] = v15;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
  }
  return sub_1A9099E04((uint64_t)v10, type metadata accessor for SequenceEntry.Kind);
}

uint64_t *sub_1A91529C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v28 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    int64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    type metadata accessor for SequenceEntry.Kind(0);
    swift_bridgeObjectRetain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v29 = *(_OWORD *)(v8 + 24);
      *(_OWORD *)(v7 + 24) = v29;
      (**(void (***)(char *, char *))(v29 - 8))(v7, v8);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = *((void *)v8 + 1);
      *(void *)int64_t v7 = *(void *)v8;
      *((void *)v7 + 1) = v10;
      uint64_t v11 = (int *)type metadata accessor for EventData();
      uint64_t v12 = v11[5];
      long long v34 = &v7[v12];
      uint64_t v13 = &v8[v12];
      uint64_t v14 = sub_1A916AC90();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v34, v13, v14);
      uint64_t v16 = v11[6];
      uint64_t v17 = &v7[v16];
      uint64_t v18 = &v8[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = v11[7];
      unint64_t v21 = &v7[v20];
      unint64_t v22 = &v8[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)unint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = v11[8];
      long long v25 = &v7[v24];
      uint64_t v26 = &v8[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)long long v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v30 = sub_1A916AC90();
      uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
      v31(v7, v8, v30);
      uint64_t v32 = type metadata accessor for TimedData();
      v31(&v7[*(int *)(v32 + 20)], &v8[*(int *)(v32 + 20)], v30);
      *(void *)&v7[*(int *)(v32 + 24)] = *(void *)&v8[*(int *)(v32 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

void *sub_1A9152C40(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    int64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_1A9099E04((uint64_t)a1 + v6, type metadata accessor for SequenceEntry.Kind);
    type metadata accessor for SequenceEntry.Kind(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v23 = v8[3];
      v7[3] = v23;
      v7[4] = v8[4];
      (**(void (***)(void *, void *))(v23 - 8))(v7, v8);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *int64_t v7 = *v8;
      v7[1] = v8[1];
      uint64_t v10 = (int *)type metadata accessor for EventData();
      uint64_t v11 = v10[5];
      uint64_t v28 = (char *)v8 + v11;
      long long v29 = (char *)v7 + v11;
      uint64_t v12 = sub_1A916AC90();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v29, v28, v12);
      uint64_t v14 = v10[6];
      uint64_t v15 = (void *)((char *)v7 + v14);
      uint64_t v16 = (void *)((char *)v8 + v14);
      void *v15 = *v16;
      v15[1] = v16[1];
      uint64_t v17 = v10[7];
      uint64_t v18 = (void *)((char *)v7 + v17);
      uint64_t v19 = (void *)((char *)v8 + v17);
      void *v18 = *v19;
      v18[1] = v19[1];
      uint64_t v20 = v10[8];
      unint64_t v21 = (void *)((char *)v7 + v20);
      unint64_t v22 = (void *)((char *)v8 + v20);
      void *v21 = *v22;
      v21[1] = v22[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v24 = sub_1A916AC90();
      long long v25 = *(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16);
      v25(v7, v8, v24);
      uint64_t v26 = type metadata accessor for TimedData();
      v25((void *)((char *)v7 + *(int *)(v26 + 20)), (void *)((char *)v8 + *(int *)(v26 + 20)), v24);
      *(void *)((char *)v7 + *(int *)(v26 + 24)) = *(void *)((char *)v8 + *(int *)(v26 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A9152EB4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (_OWORD *)((char *)a1 + v4);
  uint64_t v6 = (_OWORD *)((char *)a2 + v4);
  uint64_t v7 = type metadata accessor for SequenceEntry.Kind(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    _OWORD *v5 = *v6;
    uint64_t v12 = (int *)type metadata accessor for EventData();
    uint64_t v13 = v12[5];
    uint64_t v14 = (char *)v5 + v13;
    uint64_t v15 = (char *)v6 + v13;
    uint64_t v16 = sub_1A916AC90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    *(_OWORD *)((char *)v5 + v12[6]) = *(_OWORD *)((char *)v6 + v12[6]);
    *(_OWORD *)((char *)v5 + v12[7]) = *(_OWORD *)((char *)v6 + v12[7]);
    *(_OWORD *)((char *)v5 + v12[8]) = *(_OWORD *)((char *)v6 + v12[8]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_1A916AC90();
    uint64_t v10 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v9 - 8) + 32);
    v10(v5, v6, v9);
    uint64_t v11 = type metadata accessor for TimedData();
    v10((_OWORD *)((char *)v5 + *(int *)(v11 + 20)), (_OWORD *)((char *)v6 + *(int *)(v11 + 20)), v9);
    *(void *)((char *)v5 + *(int *)(v11 + 24)) = *(void *)((char *)v6 + *(int *)(v11 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1A9153064(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (_OWORD *)((char *)a1 + v7);
    uint64_t v9 = (_OWORD *)((char *)a2 + v7);
    sub_1A9099E04((uint64_t)a1 + v7, type metadata accessor for SequenceEntry.Kind);
    uint64_t v10 = type metadata accessor for SequenceEntry.Kind(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *uint64_t v8 = *v9;
      uint64_t v15 = (int *)type metadata accessor for EventData();
      uint64_t v16 = v15[5];
      uint64_t v17 = (char *)v8 + v16;
      uint64_t v18 = (char *)v9 + v16;
      uint64_t v19 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      *(_OWORD *)((char *)v8 + v15[6]) = *(_OWORD *)((char *)v9 + v15[6]);
      *(_OWORD *)((char *)v8 + v15[7]) = *(_OWORD *)((char *)v9 + v15[7]);
      *(_OWORD *)((char *)v8 + v15[8]) = *(_OWORD *)((char *)v9 + v15[8]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_1A916AC90();
      uint64_t v13 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v12 - 8) + 32);
      v13(v8, v9, v12);
      uint64_t v14 = type metadata accessor for TimedData();
      v13((_OWORD *)((char *)v8 + *(int *)(v14 + 20)), (_OWORD *)((char *)v9 + *(int *)(v14 + 20)), v12);
      *(void *)((char *)v8 + *(int *)(v14 + 24)) = *(void *)((char *)v9 + *(int *)(v14 + 24));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1A9153248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A915325C);
}

uint64_t sub_1A915325C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, type metadata accessor for SequenceEntry.Kind);
}

uint64_t sub_1A9153274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9153288);
}

uint64_t sub_1A9153288(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, type metadata accessor for SequenceEntry.Kind);
}

uint64_t sub_1A91532A0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *(void *)a1 = *a2;
    a1 = v26 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v27 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v27;
      (**(void (***)(uint64_t, uint64_t *))(v27 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = a2[1];
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v7;
      uint64_t v8 = (int *)type metadata accessor for EventData();
      uint64_t v9 = v8[5];
      uint64_t v10 = a1 + v9;
      uint64_t v11 = (uint64_t)a2 + v9;
      uint64_t v12 = sub_1A916AC90();
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      uint64_t v14 = v8[6];
      uint64_t v15 = (void *)(a1 + v14);
      uint64_t v16 = (uint64_t *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      void *v15 = *v16;
      v15[1] = v17;
      uint64_t v18 = v8[7];
      uint64_t v19 = (void *)(a1 + v18);
      uint64_t v20 = (uint64_t *)((char *)a2 + v18);
      uint64_t v21 = v20[1];
      *uint64_t v19 = *v20;
      v19[1] = v21;
      uint64_t v22 = v8[8];
      uint64_t v23 = (void *)(a1 + v22);
      uint64_t v24 = (uint64_t *)((char *)a2 + v22);
      uint64_t v25 = v24[1];
      *uint64_t v23 = *v24;
      v23[1] = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v28 = sub_1A916AC90();
      long long v29 = *(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16);
      v29(a1, a2, v28);
      uint64_t v30 = type metadata accessor for TimedData();
      v29(a1 + *(int *)(v30 + 20), (uint64_t *)((char *)a2 + *(int *)(v30 + 20)), v28);
      *(void *)(a1 + *(int *)(v30 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v30 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1A91534F0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch(result)
  {
    case 2:
      return __swift_destroy_boxed_opaque_existential_0(a1);
    case 1:
      swift_bridgeObjectRelease();
      uint64_t v5 = a1 + *(int *)(type metadata accessor for EventData() + 20);
      uint64_t v6 = sub_1A916AC90();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      uint64_t v3 = sub_1A916AC90();
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v3 - 8), a1, v3);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for TimedData() + 20);
      return v7(v4, v3);
  }
  return result;
}

void *sub_1A915366C(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1A9099E04((uint64_t)a1, type metadata accessor for SequenceEntry.Kind);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v20 = a2[3];
      a1[3] = v20;
      a1[4] = a2[4];
      (**(void (***)(void *, void *))(v20 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v5 = (int *)type metadata accessor for EventData();
      uint64_t v6 = v5[5];
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_1A916AC90();
      uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
      swift_bridgeObjectRetain();
      v10(v7, v8, v9);
      uint64_t v11 = v5[6];
      uint64_t v12 = (void *)((char *)a1 + v11);
      uint64_t v13 = (void *)((char *)a2 + v11);
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      uint64_t v14 = v5[7];
      uint64_t v15 = (void *)((char *)a1 + v14);
      uint64_t v16 = (void *)((char *)a2 + v14);
      void *v15 = *v16;
      v15[1] = v16[1];
      uint64_t v17 = v5[8];
      uint64_t v18 = (void *)((char *)a1 + v17);
      uint64_t v19 = (void *)((char *)a2 + v17);
      void *v18 = *v19;
      v18[1] = v19[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v21 = sub_1A916AC90();
      uint64_t v22 = *(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16);
      v22(a1, a2, v21);
      uint64_t v23 = type metadata accessor for TimedData();
      v22((void *)((char *)a1 + *(int *)(v23 + 20)), (void *)((char *)a2 + *(int *)(v23 + 20)), v21);
      *(void *)((char *)a1 + *(int *)(v23 + 24)) = *(void *)((char *)a2 + *(int *)(v23 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A91538B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    uint64_t v10 = (int *)type metadata accessor for EventData();
    uint64_t v11 = v10[5];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1A916AC90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    *(_OWORD *)((char *)a1 + v10[6]) = *(_OWORD *)((char *)a2 + v10[6]);
    *(_OWORD *)((char *)a1 + v10[7]) = *(_OWORD *)((char *)a2 + v10[7]);
    *(_OWORD *)((char *)a1 + v10[8]) = *(_OWORD *)((char *)a2 + v10[8]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1A916AC90();
    uint64_t v8 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for TimedData();
    v8((_OWORD *)((char *)a1 + *(int *)(v9 + 20)), (_OWORD *)((char *)a2 + *(int *)(v9 + 20)), v7);
    *(void *)((char *)a1 + *(int *)(v9 + 24)) = *(void *)((char *)a2 + *(int *)(v9 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1A9153A4C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A9099E04((uint64_t)a1, type metadata accessor for SequenceEntry.Kind);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      uint64_t v10 = (int *)type metadata accessor for EventData();
      uint64_t v11 = v10[5];
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1A916AC90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      *(_OWORD *)((char *)a1 + v10[6]) = *(_OWORD *)((char *)a2 + v10[6]);
      *(_OWORD *)((char *)a1 + v10[7]) = *(_OWORD *)((char *)a2 + v10[7]);
      *(_OWORD *)((char *)a1 + v10[8]) = *(_OWORD *)((char *)a2 + v10[8]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_1A916AC90();
      uint64_t v8 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      uint64_t v9 = type metadata accessor for TimedData();
      v8((_OWORD *)((char *)a1 + *(int *)(v9 + 20)), (_OWORD *)((char *)a2 + *(int *)(v9 + 20)), v7);
      *(void *)((char *)a1 + *(int *)(v9 + 24)) = *(void *)((char *)a2 + *(int *)(v9 + 24));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t *sub_1A9153C08(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = sub_1A916AC90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v4 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    *((_WORD *)v15 + 8) = *((_WORD *)v16 + 8);
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    swift_bridgeObjectRetain();
  }
  return v4;
}

void *sub_1A9153D28(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A916AC90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_WORD *)v14 + 8) = *((_WORD *)v15 + 8);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A9153DF8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *uint64_t v11 = *v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  unsigned char v11[16] = v12[16];
  v11[17] = v12[17];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A9153EE4(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_WORD *)v12 + 8) = *((_WORD *)v13 + 8);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

void *sub_1A9153F94(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *uint64_t v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  v13[16] = v14[16];
  v13[17] = v14[17];
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A9154064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9154078);
}

uint64_t sub_1A9154078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, MEMORY[0x1E4F27928]);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = a4(0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_1A9154144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9154158);
}

uint64_t sub_1A9154158(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, MEMORY[0x1E4F27928]);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = a5(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = v8;
    uint64_t v11 = v6 + *(int *)(a4 + 20);
    return v9(v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_1A915421C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v59 = a5;
  uint64_t v60 = a4;
  uint64_t v58 = a3;
  uint64_t v61 = a2;
  uint64_t v8 = type metadata accessor for Session();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SessionManager.SessionState(0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)sub_1A916AE70();
  uint64_t v15 = *(v14 - 1);
  double v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (uint64_t *)((char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = *(void **)(*(void *)(v6 + 48) + OBJC_IVAR___AAAccessQueue_queue);
  void *v18 = v19;
  (*(void (**)(void *, void, void *, double))(v15 + 104))(v18, *MEMORY[0x1E4FBCBF0], v14, v16);
  id v20 = v19;
  LOBYTE(v19) = sub_1A916AE90();
  (*(void (**)(void *, void *))(v15 + 8))(v18, v14);
  if (v19)
  {
    uint64_t v55 = v11;
    uint64_t v56 = v13;
    uint64_t v21 = *(void *)(a1 + 24);
    uint64_t v13 = *(char **)(a1 + 32);
    uint64_t v22 = v6 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_dataStacks;
    swift_beginAccess();
    uint64_t v23 = *(void *)v22;
    if (*(void *)(*(void *)v22 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_1A90A1D98(v21, (uint64_t)v13);
      if (v25)
      {
        sub_1A90A0DC8(*(void *)(v23 + 56) + 40 * v24, (uint64_t)&v65);
      }
      else
      {
        uint64_t v67 = 0;
        long long v65 = 0u;
        long long v66 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v67 = 0;
      long long v65 = 0u;
      long long v66 = 0u;
    }
    swift_endAccess();
    uint64_t v51 = v8;
    uint64_t v52 = v10;
    uint64_t v57 = v6;
    if (*((void *)&v66 + 1))
    {
      sub_1A910363C();
      sub_1A9159E6C();
      if (swift_dynamicCast())
      {
        uint64_t v14 = v62;
        uint64_t v53 = v64;
        uint64_t v54 = v63;
        goto LABEL_13;
      }
    }
    else
    {
      sub_1A908ED50((uint64_t)&v65);
    }
    swift_bridgeObjectRetain();
    sub_1A9159E20(a1);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v53 = v13;
    uint64_t v54 = v21;
LABEL_13:
    LOBYTE(v8) = *(unsigned char *)(a1 + 40);
    uint64_t v10 = *(char **)a1;
    uint64_t v18 = *(void **)(a1 + 8);
    a1 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v6 = v21;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_23:
  uint64_t v14 = sub_1A90C3BC4(0, v14[2] + 1, 1, v14);
LABEL_14:
  unint64_t v27 = v14[2];
  unint64_t v26 = v14[3];
  if (v27 >= v26 >> 1) {
    uint64_t v14 = sub_1A90C3BC4((void *)(v26 > 1), v27 + 1, 1, v14);
  }
  v14[2] = v27 + 1;
  uint64_t v28 = &v14[8 * v27];
  v28[4] = v10;
  v28[5] = v18;
  uint64_t v29 = v60;
  uint64_t v30 = v61;
  v28[6] = a1;
  v28[7] = v30;
  *((unsigned char *)v28 + 64) = v8;
  v28[9] = v58;
  v28[10] = v29;
  v28[11] = v59;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9159E6C();
  *((void *)&v66 + 1) = v31;
  uint64_t v67 = &off_1EFF9E8F0;
  *(void *)&long long v65 = v14;
  *((void *)&v65 + 1) = v54;
  *(void *)&long long v66 = v53;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1A908D668((uint64_t)&v65, v6, (uint64_t)v13);
  swift_endAccess();
  uint64_t v32 = v57;
  uint64_t v33 = v57 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_state;
  swift_beginAccess();
  uint64_t v34 = v33;
  uint64_t v35 = (uint64_t)v56;
  sub_1A9098E70(v34, (uint64_t)v56, type metadata accessor for SessionManager.SessionState);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v37 = type metadata accessor for SessionManager.SessionState;
    uint64_t v38 = v35;
  }
  else
  {
    uint64_t v39 = *(void *)v35;
    uint64_t v40 = *(void *)(v32 + 24);
    uint64_t v41 = *(void *)(*(void *)v35 + 24);
    uint64_t v60 = *(void *)(*(void *)v35 + 16);
    uint64_t v61 = v40;
    uint64_t v42 = *(void *)(v39 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_appSessionIdentifier + 8);
    uint64_t v59 = *(void *)(v39 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_appSessionIdentifier);
    uint64_t v43 = *(void *)(v39 + 32);
    unint64_t v44 = *(void *)(v39 + 40);
    uint64_t v45 = v39 + OBJC_IVAR____TtC12AppAnalytics13ActiveSession_startDate;
    uint64_t v47 = v51;
    uint64_t v46 = v52;
    uint64_t v48 = (char *)v52 + *(int *)(v51 + 28);
    uint64_t v49 = sub_1A916AC90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16))(v48, v45, v49);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1A908ED3C(v43, v44);
    uint64_t v50 = sub_1A908F034(v39);
    *uint64_t v46 = v60;
    v46[1] = v41;
    v46[2] = v59;
    v46[3] = v42;
    v46[4] = v43;
    v46[5] = v44;
    *(void *)((char *)v46 + *(int *)(v47 + 32)) = v50;
    sub_1A908F35C((uint64_t)v46);
    swift_release();
    uint64_t v37 = (uint64_t (*)(void))type metadata accessor for Session;
    uint64_t v38 = (uint64_t)v46;
  }
  return sub_1A90A1BE4(v38, v37);
}

id BridgedSessionManager.tracker.getter()
{
  return *(id *)(v0 + OBJC_IVAR___AASessionManager_tracker);
}

id BridgedSessionManager.processorManager.getter()
{
  return *(id *)(v0 + OBJC_IVAR___AASessionManager_processorManager);
}

id BridgedSessionManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id BridgedSessionManager.init()()
{
  uint64_t v1 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = qword_1EB689590;
  uint64_t v5 = v0;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_1EB689580;
  type metadata accessor for SessionGroupManager();
  uint64_t v7 = (void *)swift_allocObject();
  id v8 = v6;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  v7[3] = sub_1A908C190(MEMORY[0x1E4FBC860]);
  v7[4] = sub_1A908C190(v9);
  v7[2] = v8;
  if (qword_1EB686F50 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_1EB686F80;
  uint64_t v11 = (objc_class *)type metadata accessor for BridgedPrivacyValidationProvider();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = v10;
  v36.receiver = v12;
  v36.super_class = v11;
  id v13 = v10;
  id v14 = objc_msgSendSuper2(&v36, sel_init);
  uint64_t v15 = unk_1EFF9CAE0;
  if ((unk_1EFF9CAE0 & ~qword_1EFF9CAD8) == 0) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = qword_1EFF9CAE8;
  if ((qword_1EFF9CAE8 & ~(v15 | qword_1EFF9CAD8)) == 0) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v16 | v15 | qword_1EFF9CAD8;
  type metadata accessor for FlushProcessor();
  uint64_t v18 = (void *)swift_allocObject();
  swift_weakInit();
  v18[4] = v17;
  v18[5] = 0x404E000000000000;
  v18[6] = 0;
  v18[3] = dispatch_group_create();
  dispatch_group_t v19 = dispatch_group_create();
  if (qword_1EB6887D0 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v1, (uint64_t)qword_1EB688098);
  sub_1A9098E70(v20, (uint64_t)v3, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  uint64_t v21 = (void *)swift_allocObject();
  uint64_t v22 = sub_1A91591E4(v8, v19, (uint64_t)v7, 0, (uint64_t)v18, 0, 0, 1, v14, (uint64_t)v3, v21);

  swift_release();
  swift_release();

  *(void *)&v5[OBJC_IVAR___AASessionManager_sessionManager] = v22;
  swift_retain();
  uint64_t v23 = swift_retain();
  id v24 = sub_1A91034A4(v23);
  *(void *)&v5[OBJC_IVAR___AASessionManager_tracker] = v24;
  uint64_t v25 = v22[3];
  unint64_t v26 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  unint64_t v27 = (char *)objc_allocWithZone(v26);
  *(void *)&v27[OBJC_IVAR___AAProcessorManager_processorManager] = v25;
  v35.receiver = v27;
  v35.super_class = v26;
  id v28 = v24;
  swift_retain();
  id v29 = objc_msgSendSuper2(&v35, sel_init);
  *(void *)&v5[OBJC_IVAR___AASessionManager_processorManager] = v29;
  id v30 = v29;

  uint64_t v31 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v34.receiver = v5;
  v34.super_class = v31;
  id v32 = objc_msgSendSuper2(&v34, sel_init);
  swift_release();

  return v32;
}

id BridgedSessionManager.__allocating_init(privacyValidationProvider:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return BridgedSessionManager.init(privacyValidationProvider:)(a1);
}

id BridgedSessionManager.init(privacyValidationProvider:)(void *a1)
{
  uint64_t v3 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = qword_1EB689590;
  uint64_t v7 = v1;
  if (v6 != -1) {
    swift_once();
  }
  id v8 = (void *)qword_1EB689580;
  type metadata accessor for SessionGroupManager();
  uint64_t v9 = (void *)swift_allocObject();
  id v10 = v8;
  uint64_t v11 = MEMORY[0x1E4FBC860];
  v9[3] = sub_1A908C190(MEMORY[0x1E4FBC860]);
  v9[4] = sub_1A908C190(v11);
  _OWORD v9[2] = v10;
  uint64_t v12 = unk_1EFF9CB18;
  if ((unk_1EFF9CB18 & ~qword_1EFF9CB10) == 0) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = qword_1EFF9CB20;
  if ((qword_1EFF9CB20 & ~(v12 | qword_1EFF9CB10)) == 0) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13 | v12 | qword_1EFF9CB10;
  type metadata accessor for FlushProcessor();
  uint64_t v15 = (void *)swift_allocObject();
  swift_weakInit();
  v15[4] = v14;
  v15[5] = 0x404E000000000000;
  v15[6] = 0;
  id v16 = a1;
  v15[3] = dispatch_group_create();
  dispatch_group_t v17 = dispatch_group_create();
  if (qword_1EB6887D0 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v3, (uint64_t)qword_1EB688098);
  sub_1A9098E70(v18, (uint64_t)v5, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  dispatch_group_t v19 = (void *)swift_allocObject();
  uint64_t v20 = sub_1A91591E4(v10, v17, (uint64_t)v9, 0, (uint64_t)v15, 0, 0, 1, v16, (uint64_t)v5, v19);

  swift_release();
  swift_release();

  *(void *)&v7[OBJC_IVAR___AASessionManager_sessionManager] = v20;
  swift_retain();
  uint64_t v21 = swift_retain();
  id v22 = sub_1A91034A4(v21);
  *(void *)&v7[OBJC_IVAR___AASessionManager_tracker] = v22;
  uint64_t v23 = v20[3];
  id v24 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  uint64_t v25 = (char *)objc_allocWithZone(v24);
  *(void *)&v25[OBJC_IVAR___AAProcessorManager_processorManager] = v23;
  v33.receiver = v25;
  v33.super_class = v24;
  id v26 = v22;
  swift_retain();
  id v27 = objc_msgSendSuper2(&v33, sel_init);
  *(void *)&v7[OBJC_IVAR___AASessionManager_processorManager] = v27;
  id v28 = v27;

  id v29 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v32.receiver = v7;
  v32.super_class = v29;
  id v30 = objc_msgSendSuper2(&v32, sel_init);
  swift_release();

  return v30;
}

id BridgedSessionManager.__allocating_init(accessQueue:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return BridgedSessionManager.init(accessQueue:)(a1);
}

id BridgedSessionManager.init(accessQueue:)(void *a1)
{
  uint64_t v48 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v48);
  uint64_t v49 = (uint64_t)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A916AE10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v48 - v9;
  uint64_t v11 = (objc_class *)type metadata accessor for AccessQueue();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR___AAAccessQueue_queue] = a1;
  id v50 = a1;
  uint64_t v13 = v1;
  uint64_t v14 = v12;
  sub_1A916ADD0();
  uint64_t v15 = &v14[OBJC_IVAR___AAAccessQueue__qos];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  sub_1A90A4FF8(0, &qword_1EB689598, MEMORY[0x1E4FBCB80], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Atomic);
  id v16 = (char *)swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = (_DWORD *)swift_slowAlloc();
  *(void *)(v17 + 16) = v18;
  _DWORD *v18 = 0;
  *(_DWORD *)(v17 + 24) = 0x10000;
  *((void *)v16 + 2) = v17;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v16[*(void *)(*(void *)v16 + 96)], v7, v4);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)uint64_t v15 = v16;
  swift_endAccess();

  v54.receiver = v14;
  v54.super_class = v11;
  id v19 = objc_msgSendSuper2(&v54, sel_init);
  type metadata accessor for SessionGroupManager();
  uint64_t v20 = (void *)swift_allocObject();
  id v21 = v19;
  uint64_t v22 = MEMORY[0x1E4FBC860];
  v20[3] = sub_1A908C190(MEMORY[0x1E4FBC860]);
  unsigned char v20[4] = sub_1A908C190(v22);
  void v20[2] = v21;
  if (qword_1EB686F50 != -1) {
    swift_once();
  }
  uint64_t v23 = (void *)qword_1EB686F80;
  id v24 = (objc_class *)type metadata accessor for BridgedPrivacyValidationProvider();
  uint64_t v25 = (char *)objc_allocWithZone(v24);
  *(void *)&v25[OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation] = v23;
  v53.receiver = v25;
  v53.super_class = v24;
  id v26 = v23;
  id v27 = objc_msgSendSuper2(&v53, sel_init);
  uint64_t v28 = unk_1EFF9CB50;
  if ((unk_1EFF9CB50 & ~qword_1EFF9CB48) == 0) {
    uint64_t v28 = 0;
  }
  uint64_t v29 = qword_1EFF9CB58;
  if ((qword_1EFF9CB58 & ~(v28 | qword_1EFF9CB48)) == 0) {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v29 | v28 | qword_1EFF9CB48;
  type metadata accessor for FlushProcessor();
  uint64_t v31 = (void *)swift_allocObject();
  swift_weakInit();
  v31[4] = v30;
  void v31[5] = 0x404E000000000000;
  v31[6] = 0;
  v31[3] = dispatch_group_create();
  dispatch_group_t v32 = dispatch_group_create();
  if (qword_1EB6887D0 != -1) {
    swift_once();
  }
  uint64_t v33 = __swift_project_value_buffer(v48, (uint64_t)qword_1EB688098);
  uint64_t v34 = v49;
  sub_1A9098E70(v33, v49, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  objc_super v35 = (void *)swift_allocObject();
  objc_super v36 = sub_1A91591E4(v21, v32, (uint64_t)v20, 0, (uint64_t)v31, 0, 0, 1, v27, v34, v35);

  swift_release();
  swift_release();

  *(void *)&v13[OBJC_IVAR___AASessionManager_sessionManager] = v36;
  swift_retain();
  uint64_t v37 = swift_retain();
  id v38 = sub_1A91034A4(v37);
  *(void *)&v13[OBJC_IVAR___AASessionManager_tracker] = v38;
  uint64_t v39 = v36[3];
  uint64_t v40 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  uint64_t v41 = (char *)objc_allocWithZone(v40);
  *(void *)&v41[OBJC_IVAR___AAProcessorManager_processorManager] = v39;
  v52.receiver = v41;
  v52.super_class = v40;
  id v42 = v38;
  swift_retain();
  id v43 = objc_msgSendSuper2(&v52, sel_init);
  *(void *)&v13[OBJC_IVAR___AASessionManager_processorManager] = v43;
  id v44 = v43;

  uint64_t v45 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v51.receiver = v13;
  v51.super_class = v45;
  id v46 = objc_msgSendSuper2(&v51, sel_init);
  swift_release();

  return v46;
}

id BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(a1, a2);
}

id BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(void *a1, void *a2)
{
  id v46 = a2;
  uint64_t v47 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v47);
  uint64_t v48 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A916AE10();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = (objc_class *)type metadata accessor for AccessQueue();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR___AAAccessQueue_queue] = a1;
  id v49 = a1;
  uint64_t v14 = v2;
  uint64_t v15 = v13;
  sub_1A916ADD0();
  id v16 = &v15[OBJC_IVAR___AAAccessQueue__qos];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  sub_1A90A4FF8(0, &qword_1EB689598, MEMORY[0x1E4FBCB80], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Atomic);
  uint64_t v17 = (char *)swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v18 = swift_allocObject();
  id v19 = (_DWORD *)swift_slowAlloc();
  *(void *)(v18 + 16) = v19;
  *id v19 = 0;
  *(_DWORD *)(v18 + 24) = 0x10000;
  *((void *)v17 + 2) = v18;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v17[*(void *)(*(void *)v17 + 96)], v8, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  *(void *)id v16 = v17;
  swift_endAccess();

  v52.receiver = v15;
  v52.super_class = v12;
  id v20 = objc_msgSendSuper2(&v52, sel_init);
  type metadata accessor for SessionGroupManager();
  id v21 = (void *)swift_allocObject();
  id v22 = v20;
  uint64_t v23 = MEMORY[0x1E4FBC860];
  v21[3] = sub_1A908C190(MEMORY[0x1E4FBC860]);
  v21[4] = sub_1A908C190(v23);
  id v21[2] = v22;
  uint64_t v24 = unk_1EFF9CB88;
  if ((unk_1EFF9CB88 & ~qword_1EFF9CB80) == 0) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = qword_1EFF9CB90;
  if ((qword_1EFF9CB90 & ~(v24 | qword_1EFF9CB80)) == 0) {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v25 | v24 | qword_1EFF9CB80;
  type metadata accessor for FlushProcessor();
  id v27 = (void *)swift_allocObject();
  swift_weakInit();
  v27[4] = v26;
  v27[5] = 0x404E000000000000;
  v27[6] = 0;
  id v28 = v46;
  v27[3] = dispatch_group_create();
  dispatch_group_t v29 = dispatch_group_create();
  if (qword_1EB6887D0 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v47, (uint64_t)qword_1EB688098);
  uint64_t v31 = v48;
  sub_1A9098E70(v30, v48, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  dispatch_group_t v32 = (void *)swift_allocObject();
  uint64_t v33 = sub_1A91591E4(v22, v29, (uint64_t)v21, 0, (uint64_t)v27, 0, 0, 1, v28, v31, v32);

  swift_release();
  swift_release();

  *(void *)&v14[OBJC_IVAR___AASessionManager_sessionManager] = v33;
  swift_retain();
  uint64_t v34 = swift_retain();
  id v35 = sub_1A91034A4(v34);
  *(void *)&v14[OBJC_IVAR___AASessionManager_tracker] = v35;
  uint64_t v36 = v33[3];
  uint64_t v37 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  id v38 = (char *)objc_allocWithZone(v37);
  *(void *)&v38[OBJC_IVAR___AAProcessorManager_processorManager] = v36;
  v51.receiver = v38;
  v51.super_class = v37;
  id v39 = v35;
  swift_retain();
  id v40 = objc_msgSendSuper2(&v51, sel_init);
  *(void *)&v14[OBJC_IVAR___AASessionManager_processorManager] = v40;
  id v41 = v40;

  id v42 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v50.receiver = v14;
  v50.super_class = v42;
  id v43 = objc_msgSendSuper2(&v50, sel_init);
  swift_release();

  return v43;
}

id BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:diagnosticsConsentProvider:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return BridgedSessionManager.init(accessQueue:privacyValidationProvider:diagnosticsConsentProvider:)(a1, a2, a3);
}

id BridgedSessionManager.init(accessQueue:privacyValidationProvider:diagnosticsConsentProvider:)(void *a1, void *a2, void *a3)
{
  objc_super v51 = a3;
  id v52 = a2;
  uint64_t v53 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v53);
  uint64_t v55 = (uint64_t)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A916AE10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v50 - v14;
  id v16 = (objc_class *)type metadata accessor for AccessQueue();
  uint64_t v17 = (char *)objc_allocWithZone(v16);
  *(void *)&v17[OBJC_IVAR___AAAccessQueue_queue] = a1;
  id v56 = a1;
  objc_super v54 = v3;
  uint64_t v18 = v17;
  sub_1A916ADD0();
  id v19 = &v18[OBJC_IVAR___AAAccessQueue__qos];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  sub_1A90A4FF8(0, &qword_1EB689598, MEMORY[0x1E4FBCB80], (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Atomic);
  id v20 = (char *)swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v21 = swift_allocObject();
  id v22 = (_DWORD *)swift_slowAlloc();
  *(void *)(v21 + 16) = v22;
  *id v22 = 0;
  *(_DWORD *)(v21 + 24) = 0x10000;
  *((void *)v20 + 2) = v21;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v20[*(void *)(*(void *)v20 + 96)], v12, v9);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  *(void *)id v19 = v20;
  swift_endAccess();

  v59.receiver = v18;
  v59.super_class = v16;
  id v23 = objc_msgSendSuper2(&v59, sel_init);
  type metadata accessor for SessionGroupManager();
  uint64_t v24 = (void *)swift_allocObject();
  id v25 = v23;
  uint64_t v26 = MEMORY[0x1E4FBC860];
  v24[3] = sub_1A908C190(MEMORY[0x1E4FBC860]);
  v24[4] = sub_1A908C190(v26);
  void v24[2] = v25;
  id v27 = v51;
  sub_1A9098E70((uint64_t)v51 + OBJC_IVAR___AADiagnosticsConsentProvider_provider, (uint64_t)v8, type metadata accessor for DiagnosticsConsentProvider);
  id v28 = v52;
  dispatch_group_t v29 = dispatch_group_create();
  uint64_t v30 = unk_1EFF9CBC0;
  if ((unk_1EFF9CBC0 & ~qword_1EFF9CBB8) == 0) {
    uint64_t v30 = 0;
  }
  uint64_t v31 = qword_1EFF9CBC8;
  if ((qword_1EFF9CBC8 & ~(v30 | qword_1EFF9CBB8)) == 0) {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v31 | v30 | qword_1EFF9CBB8;
  type metadata accessor for FlushProcessor();
  uint64_t v33 = (void *)swift_allocObject();
  swift_weakInit();
  v33[4] = v32;
  v33[5] = 0x404E000000000000;
  v33[6] = 0;
  v33[3] = dispatch_group_create();
  if (qword_1EB6887D0 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v53, (uint64_t)qword_1EB688098);
  uint64_t v35 = v55;
  sub_1A9098E70(v34, v55, type metadata accessor for SummaryEventConfiguration);
  type metadata accessor for SessionManager(0);
  uint64_t v36 = (void *)swift_allocObject();
  uint64_t v37 = sub_1A91595D0(v25, v29, (uint64_t)v24, 0, (uint64_t)v33, 0, 0, 1, v28, (uint64_t)v8, v35, v36);

  swift_release();
  swift_release();

  id v38 = v54;
  *(void *)&v54[OBJC_IVAR___AASessionManager_sessionManager] = v37;
  swift_retain();
  uint64_t v39 = swift_retain();
  id v40 = sub_1A91034A4(v39);
  *(void *)&v38[OBJC_IVAR___AASessionManager_tracker] = v40;
  uint64_t v41 = v37[3];
  id v42 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  id v43 = (char *)objc_allocWithZone(v42);
  *(void *)&v43[OBJC_IVAR___AAProcessorManager_processorManager] = v41;
  v58.receiver = v43;
  v58.super_class = v42;
  id v44 = v40;
  swift_retain();
  id v45 = objc_msgSendSuper2(&v58, sel_init);
  *(void *)&v38[OBJC_IVAR___AASessionManager_processorManager] = v45;
  id v46 = v45;

  uint64_t v47 = (objc_class *)type metadata accessor for BridgedSessionManager();
  v57.receiver = v38;
  v57.super_class = v47;
  id v48 = objc_msgSendSuper2(&v57, sel_init);
  swift_release();

  return v48;
}

id sub_1A9156088(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___AASessionManager_sessionManager] = a1;
  uint64_t v3 = v1;
  swift_retain();
  uint64_t v4 = swift_retain();
  id v5 = sub_1A91034A4(v4);
  *(void *)&v3[OBJC_IVAR___AASessionManager_tracker] = v5;
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = (objc_class *)type metadata accessor for BridgedProcessorManager();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR___AAProcessorManager_processorManager] = v6;
  v15.receiver = v8;
  v15.super_class = v7;
  id v9 = v5;
  swift_retain();
  id v10 = objc_msgSendSuper2(&v15, sel_init);
  *(void *)&v3[OBJC_IVAR___AASessionManager_processorManager] = v10;
  id v11 = v10;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for BridgedSessionManager();
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  swift_release();
  return v12;
}

id BridgedSessionManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BridgedSessionManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void BridgedSessionManager.push(_:)(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  objc_msgSend(v1, sel_pushSessionData_traits_, a1, v3);
}

uint64_t BridgedSessionManager.push(_:traits:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___AASessionData_key);
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR___AASessionData_key + 8);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR___AASessionData_data);
  swift_getObjectType();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v5 = sub_1A9108854();
  uint64_t v7 = v6;
  char v9 = v8;
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___AASessionManager_sessionManager);
  id v11 = sub_1A90BB20C();
  uint64_t v12 = *(void *)(v10 + 48);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  *(void *)(v13 + 24) = v3;
  *(void *)(v13 + 32) = v2;
  *(void *)(v13 + 40) = v4;
  *(void *)(v13 + 48) = v5;
  *(void *)(v13 + 56) = v7;
  *(unsigned char *)(v13 + 64) = v9 & 1;
  *(void *)(v13 + 72) = v11;
  *(void *)(v13 + 80) = 0xD00000000000006ALL;
  *(void *)(v13 + 88) = 0x80000001A917AE50;
  *(void *)(v13 + 96) = 177;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1A908CAA8(v12, (uint64_t)sub_1A9159A00, v13);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void BridgedSessionManager.push(_:submitEventQueues:)(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  objc_msgSend(v1, sel_pushSessionData_traits_, a1, v3);
}

id BridgedSessionManager.push(_:traits:submitEventQueues:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, sel_pushSessionData_traits_, a1, a2);
}

uint64_t BridgedSessionManager.transaction(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___AASessionManager_sessionManager);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = *(void *)(v5 + 48);
  char v8 = (void *)swift_allocObject();
  v8[2] = v5;
  v8[3] = sub_1A9159A50;
  v8[4] = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v7, (uint64_t)sub_1A909BE44, (uint64_t)v8);
  swift_release();

  return swift_release();
}

void sub_1A9156748(uint64_t a1, void (*a2)(id, uint64_t))
{
  uint64_t v4 = (objc_class *)type metadata accessor for BridgedAccessSessionManager();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___AAAccessSessionManager_accessSessionManager] = a1;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  a2(v6, v7);
}

void BridgedSessionManager.start(for:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1A916AC90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  objc_super v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A916ACC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    uint64_t v13 = (void *)sub_1A916AF60();
  }
  else {
    uint64_t v13 = 0;
  }
  sub_1A916ACB0();
  sub_1A916ACA0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  objc_super v14 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();
  sub_1A916AC80();
  objc_super v15 = (void *)sub_1A916AC10();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(v16[1], sel_startSessionForKind_withName_identifier_startDate_, a1, v13, v14, v15);
}

void BridgedSessionManager.start(for:name:identifier:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_1A916AC90();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (void *)sub_1A916AF60();
  }
  uint64_t v11 = (void *)sub_1A916AF60();
  sub_1A916AC80();
  uint64_t v12 = (void *)sub_1A916AC10();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v4, sel_startSessionForKind_withName_identifier_startDate_, a1, a3, v11, v12);
}

void BridgedSessionManager.start(for:name:startDate:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_1A916ACC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (void *)sub_1A916AF60();
  }
  sub_1A916ACB0();
  sub_1A916ACA0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v11 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_1A916AC10();
  objc_msgSend(v4, sel_startSessionForKind_withName_identifier_startDate_, a1, a3, v11, v12);
}

void BridgedSessionManager.start(for:name:identifier:startDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = (void *)sub_1A916AF60();
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)sub_1A916AF60();
  id v7 = (id)sub_1A916AC10();
  if (qword_1EB686FB8 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_startSessionForKind_withName_identifier_startDate_timestampJitter_, a1, v5, v6);
}

void BridgedSessionManager.start(for:name:identifier:startDate:timestampJitter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3) {
    uint64_t v10 = (void *)sub_1A916AF60();
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (void *)sub_1A916AF60();
  id v12 = (id)sub_1A916AC10();
  objc_msgSend(v7, sel_startSessionForKind_withName_identifier_startDate_timestampJitter_timeDurationGranularity_, a1, v10, v11, v12, a7, 0);
}

uint64_t BridgedSessionManager.start(for:name:identifier:startDate:timestampJitter:timeDurationGranularity:)(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v31 = a8;
  uint64_t v32 = a7;
  uint64_t v29 = a6;
  uint64_t v30 = a4;
  uint64_t v13 = sub_1A916AC90();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  v16.n128_f64[0] = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = a5;
  uint64_t v18 = a1;
  switch(a1)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 2uLL:
      uint64_t v18 = 0;
      break;
    case 3uLL:
      if (a3) {
        uint64_t v18 = a2;
      }
      else {
        uint64_t v18 = 0;
      }
      if (a3) {
        a1 = a3;
      }
      else {
        a1 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      break;
    default:
      unint64_t v34 = a1;
      sub_1A916BA20();
      __break(1u);
      JUMPOUT(0x1A9157864);
  }
  uint64_t v19 = *(void *)(v8 + OBJC_IVAR___AASessionManager_sessionManager);
  uint64_t v20 = *(void *)(v19 + 56);
  v28[0] = *(void *)(v19 + 48);
  v28[1] = v20;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v14 + 16))((char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v13, v16);
  unint64_t v21 = (*(unsigned __int8 *)(v14 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v31;
  uint64_t v24 = v32;
  *(void *)(v22 + 16) = v19;
  *(void *)(v22 + 24) = v24;
  *(void *)(v22 + 32) = v23;
  *(unsigned char *)(v22 + 40) = 0;
  uint64_t v25 = v33;
  *(void *)(v22 + 48) = v30;
  *(void *)(v22 + 56) = v25;
  *(void *)(v22 + 64) = v18;
  *(void *)(v22 + 72) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v22 + v21, v17, v13);
  swift_retain();
  id v26 = v24;
  swift_bridgeObjectRetain();
  sub_1A908ED3C(v18, a1);
  sub_1A908CAA8(v28[0], (uint64_t)sub_1A908FF84, v22);
  swift_release();
  return sub_1A90D7D84(v18, a1);
}

Swift::Void __swiftcall BridgedSessionManager.end()()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  id v7 = (char *)&v14 - v6;
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR___AASessionManager_sessionManager);
  sub_1A916AC80();
  uint64_t v9 = *(void *)(v8 + 48);
  sub_1A90F82A4();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
  unint64_t v10 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v11 = (v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v12 + v10, v4, v1);
  uint64_t v13 = (void *)(v12 + v11);
  *uint64_t v13 = 0;
  v13[1] = 0;
  swift_retain();
  sub_1A908CAA8(v9, (uint64_t)sub_1A9159B4C, v12);
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

Swift::Void __swiftcall BridgedSessionManager.endSync()()
{
}

uint64_t BridgedSessionManager.end(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v3 = sub_1A916AC90();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR___AASessionManager_sessionManager);
  sub_1A916AC80();
  uint64_t v11 = *(void *)(v10 + 48);
  sub_1A90F82A4();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v13 = (v5 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v14 + v12, v6, v3);
  uint64_t v15 = (void *)(v14 + v13);
  uint64_t v16 = v19;
  void *v15 = v18;
  v15[1] = v16;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v11, (uint64_t)sub_1A9159B4C, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t BridgedSessionManager.end(endDate:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a2;
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR___AASessionManager_sessionManager);
  uint64_t v10 = *(void *)(v9 + 48);
  sub_1A90F82A4();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  unint64_t v13 = (void *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  *unint64_t v13 = v16;
  v13[1] = a3;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v10, (uint64_t)sub_1A9159B4C, v12);
  return swift_release();
}

uint64_t BridgedSessionManager.flush(callbackQueue:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*(void *)(v3 + OBJC_IVAR___AASessionManager_sessionManager) + 48);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v9 = (void *)swift_allocObject();
  _OWORD v9[2] = v8;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = a3;
  swift_retain();
  id v10 = a1;
  sub_1A90A0418(a2);
  sub_1A908CAA8(v7, (uint64_t)sub_1A9090C14, (uint64_t)v9);
  swift_release();

  return swift_release();
}

uint64_t BridgedAccessSessionManager.isActive.getter()
{
  uint64_t v1 = type metadata accessor for SessionManager.SessionState(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A916AE70();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void *)(*(void *)(v0 + OBJC_IVAR___AAAccessSessionManager_accessSessionManager) + 16);
  id v10 = *(void **)(*(void *)(v9 + 48) + OBJC_IVAR___AAAccessQueue_queue);
  *uint64_t v8 = v10;
  (*(void (**)(void *, void, uint64_t, double))(v5 + 104))(v8, *MEMORY[0x1E4FBCBF0], v4, v6);
  id v11 = v10;
  LOBYTE(v10) = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v8, v4);
  if (v10)
  {
    uint64_t v13 = v9 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_state;
    swift_beginAccess();
    sub_1A9098E70(v13, (uint64_t)v3, type metadata accessor for SessionManager.SessionState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1) {
        sub_1A90A1BE4((uint64_t)v3, type metadata accessor for SessionManager.SessionState);
      }
      return 0;
    }
    else
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void BridgedAccessSessionManager.push(_:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  BridgedAccessSessionManager.push(_:traits:)(a1);
}

uint64_t BridgedAccessSessionManager.push(_:traits:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR___AASessionData_key);
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR___AASessionData_key + 8);
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___AASessionData_data);
  swift_getObjectType();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v8[0] = v2;
  v8[1] = v1;
  v8[2] = v3;
  v8[3] = sub_1A9108854();
  v8[4] = v4;
  char v9 = v5 & 1;
  double v6 = sub_1A90BB20C();
  sub_1A915421C((uint64_t)v8, (uint64_t)v6, 0xD00000000000006ALL, 0x80000001A917AE50, 390);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void BridgedAccessSessionManager.push(_:submitEventQueues:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits()), sel_init);
  BridgedAccessSessionManager.push(_:traits:)(a1);
}

BOOL BridgedAccessSessionManager.isDiagnosticSubmissionAllowed.getter()
{
  sub_1A9095B68(&v2);
  return (v2 & 1) == 0 && v2 != 2;
}

void BridgedAccessSessionManager.init()()
{
}

id BridgedAccessSessionManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A9158BA8(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, void *a6, uint64_t a7, uint64_t a8)
{
  int v37 = a5;
  id v38 = a3;
  uint64_t v39 = a4;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v11 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SummaryEventDatabaseManager.StorageOptions(0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v20 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EventMirrorStore();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = MEMORY[0x1E4FBC868];
  sub_1A9098E70(a7, (uint64_t)v22, type metadata accessor for DiagnosticsConsentProvider);
  sub_1A909CF9C();
  uint64_t v25 = v24;
  uint64_t v26 = *(int *)(v24 + 48);
  uint64_t v27 = sub_1A916AAD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v19, 1, 1, v27);
  *(void *)&v19[v26] = 0;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v19, 0, 1, v25);
  if (*(unsigned char *)(a8 + 8))
  {
    uint64_t v28 = type metadata accessor for DisabledSummaryEventManager();
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = &off_1EFFA2620;
  }
  else
  {
    sub_1A9098E70(a8, (uint64_t)v13, type metadata accessor for SummaryEventConfiguration);
    sub_1A9098E70((uint64_t)v19, (uint64_t)v16, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
    uint64_t v28 = type metadata accessor for SummaryEventManager();
    uint64_t v31 = swift_allocObject();
    uint64_t v29 = sub_1A9141DD4((uint64_t)v13, (uint64_t)v16, v31);
    uint64_t v30 = &off_1EFFA1968;
  }
  v40[3] = v28;
  v40[4] = v30;
  v40[0] = v29;
  sub_1A90A1BE4((uint64_t)v19, type metadata accessor for SummaryEventDatabaseManager.StorageOptions);
  type metadata accessor for Tracker(0);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = sub_1A9158F10(v35, v36, v38, v39, v37 & 1, v23, 0, 0, 0, 0, 0, 0, a6, (uint64_t)v22, (uint64_t)v40, v32);
  sub_1A90A1BE4(a8, type metadata accessor for SummaryEventConfiguration);
  sub_1A90A1BE4(a7, type metadata accessor for DiagnosticsConsentProvider);
  return v33;
}

uint64_t sub_1A9158F10(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(a16 + 72) = 0;
  *(void *)(a16 + 48) = 0;
  *(void *)(a16 + 56) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v22 = MEMORY[0x1E4FBC868];
  *(void *)(a16 + 104) = MEMORY[0x1E4FBC868];
  *(void *)(a16 + 112) = v22;
  uint64_t v23 = MEMORY[0x1E4FBC860];
  *(void *)(a16 + 120) = v22;
  *(void *)(a16 + 128) = v22;
  *(void *)(a16 + 144) = v23;
  *(void *)(a16 + 152) = v23;
  *(void *)(a16 + 168) = v23;
  uint64_t v24 = OBJC_IVAR____TtC12AppAnalytics7Tracker_actionsLock;
  type metadata accessor for UnfairLock();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = (_DWORD *)swift_slowAlloc();
  *(void *)(v25 + 16) = v26;
  _DWORD *v26 = 0;
  *(_DWORD *)(v25 + 24) = 0x10000;
  *(void *)(a16 + v24) = v25;
  *(void *)(a16 + 16) = a1;
  *(void *)(a16 + 24) = a2;
  *(void *)(a16 + 80) = a3;
  *(void *)(a16 + 88) = a4;
  *(unsigned char *)(a16 + 176) = a5;
  *(void *)(a16 + 96) = a6;
  *(void *)(a16 + 136) = a7;
  if (a7)
  {
    MEMORY[0x1AD0EEDF0](a7 + 64);
    uint64_t v27 = *(void *)(a7 + 72);
  }
  else
  {
    uint64_t v27 = 0;
  }
  *(void *)(a16 + 72) = v27;
  swift_unknownObjectWeakAssign();
  id v28 = a3;
  id v29 = a4;
  swift_retain();
  swift_retain();
  swift_unknownObjectRelease();
  uint64_t v30 = a8;
  if (!a8) {
    uint64_t v30 = MEMORY[0x1E4FBC860];
  }
  *(void *)(a16 + 160) = v30;
  *(void *)(a16 + 32) = a9;
  *(void *)(a16 + 40) = a10;
  *(void *)(a16 + 48) = a11;
  *(void *)(a16 + 56) = a12;
  swift_bridgeObjectRelease();
  *(void *)(a16 + 184) = a13;
  *(void *)(a16 + 192) = &protocol witness table for BridgedPrivacyValidationProvider;
  sub_1A9098E70(a14, a16 + OBJC_IVAR____TtC12AppAnalytics7Tracker_diagnosticsConsentProvider, type metadata accessor for DiagnosticsConsentProvider);
  sub_1A90A0DC8(a15, a16 + OBJC_IVAR____TtC12AppAnalytics7Tracker_summaryEventManager);
  swift_unknownObjectRetain();
  sub_1A909D2D0();
  uint64_t v31 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  Tracker.onSessionChange(block:)((uint64_t)sub_1A909A840, v31);

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a15);
  sub_1A90A1BE4(a14, type metadata accessor for DiagnosticsConsentProvider);
  swift_release();
  return a16;
}

void *sub_1A91591E4(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, void *a9, uint64_t a10, void *a11)
{
  unint64_t v44 = a4;
  id v46 = a9;
  uint64_t v47 = a10;
  uint64_t v18 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v45 = (uint64_t)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v21 = v20 - 8;
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = &type metadata for TimestampJitter;
  objc_super v51 = &protocol witness table for TimestampJitter;
  v48[0] = a6;
  v48[1] = a7;
  char v49 = a8 & 1;
  a11[5] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for SessionManager.SessionState(0);
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_dataStacks) = MEMORY[0x1E4FBC868];
  uint64_t v24 = MEMORY[0x1E4FBC860];
  *(void *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_observers) = MEMORY[0x1E4FBC860];
  a11[6] = a1;
  a11[7] = a2;
  a11[8] = a3;
  type metadata accessor for ProcessorManager();
  uint64_t v25 = (void *)swift_allocObject();
  uint64_t v25[3] = 0;
  swift_unknownObjectWeakInit();
  v25[5] = a2;
  v25[6] = v24;
  v25[4] = a1;
  unint64_t v26 = v44;
  uint64_t v43 = (v44 >> 1) & 1;
  a11[3] = v25;
  id v27 = a1;
  id v28 = a2;
  id v29 = v27;
  id v30 = v28;
  id v31 = v29;
  id v32 = v30;
  swift_retain();
  id v33 = v46;
  sub_1A916ACB0();
  unint64_t v34 = &v23[*(int *)(v21 + 28)];
  *(void *)unint64_t v34 = sub_1A90A80E4;
  *((void *)v34 + 1) = 0;
  uint64_t v35 = v47;
  uint64_t v36 = v45;
  sub_1A9098E70(v47, v45, type metadata accessor for SummaryEventConfiguration);
  a11[2] = sub_1A9158BA8(1953460082, 0xE400000000000000, v31, v32, v43, v33, (uint64_t)v23, v36);
  *(void *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_options) = v26;
  *(void *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_flushProcessor) = a5;
  sub_1A90A0DC8((uint64_t)v48, (uint64_t)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_timestampConfigurationProvider);
  *(_WORD *)((char *)a11 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_timeDurationGranularity) = 0;
  swift_beginAccess();
  swift_weakAssign();
  swift_retain();
  swift_retain();
  uint64_t v37 = swift_retain();
  sub_1A909CA74(v37, (uint64_t)&off_1EFF9DB78);
  swift_release();
  swift_release();
  uint64_t v38 = a11[3];
  *(void *)(v38 + 24) = &off_1EFF9DBD8;
  swift_unknownObjectWeakAssign();
  uint64_t v39 = *(void *)(v38 + 32);
  id v40 = (void *)swift_allocObject();
  v40[2] = v38;
  v40[3] = a5;
  v40[4] = &protocol witness table for FlushProcessor;
  swift_retain_n();
  swift_retain();
  sub_1A908CAA8(v39, (uint64_t)sub_1A90D6440, (uint64_t)v40);
  swift_release();
  swift_release();
  sub_1A90A1BE4(v35, type metadata accessor for SummaryEventConfiguration);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
  return a11;
}

uint64_t type metadata accessor for BridgedSessionManager()
{
  return self;
}

void *sub_1A91595D0(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, void *a9, uint64_t a10, uint64_t a11, void *a12)
{
  v39[1] = a3;
  unint64_t v40 = a4;
  id v41 = a9;
  uint64_t v42 = a10;
  uint64_t v43 = a11;
  uint64_t v19 = type metadata accessor for SummaryEventConfiguration(0);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v21 = (char *)v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v46 = &type metadata for TimestampJitter;
  uint64_t v47 = &protocol witness table for TimestampJitter;
  v44[0] = a6;
  v44[1] = a7;
  char v45 = a8 & 1;
  a12[5] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for SessionManager.SessionState(0);
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_dataStacks) = MEMORY[0x1E4FBC868];
  uint64_t v25 = MEMORY[0x1E4FBC860];
  *(void *)((char *)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_observers) = MEMORY[0x1E4FBC860];
  a12[6] = a1;
  a12[7] = a2;
  a12[8] = a3;
  type metadata accessor for ProcessorManager();
  unint64_t v26 = (void *)swift_allocObject();
  v26[3] = 0;
  swift_unknownObjectWeakInit();
  v26[5] = a2;
  v26[6] = v25;
  v26[4] = a1;
  unint64_t v27 = v40;
  a12[3] = v26;
  sub_1A9098E70(v42, (uint64_t)v24, type metadata accessor for DiagnosticsConsentProvider);
  sub_1A9098E70(v43, (uint64_t)v21, type metadata accessor for SummaryEventConfiguration);
  id v28 = a1;
  id v29 = a2;
  id v30 = v28;
  id v31 = v29;
  id v32 = v30;
  id v33 = v31;
  swift_retain();
  a12[2] = sub_1A9158BA8(1953460082, 0xE400000000000000, v32, v33, (v27 >> 1) & 1, v41, (uint64_t)v24, (uint64_t)v21);
  *(void *)((char *)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_options) = v27;
  *(void *)((char *)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_flushProcessor) = a5;
  sub_1A90A0DC8((uint64_t)v44, (uint64_t)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_timestampConfigurationProvider);
  *(_WORD *)((char *)a12 + OBJC_IVAR____TtC12AppAnalytics14SessionManager_timeDurationGranularity) = 0;
  swift_beginAccess();
  swift_weakAssign();
  swift_retain();
  swift_retain();
  uint64_t v34 = swift_retain();
  sub_1A909CA74(v34, (uint64_t)&off_1EFF9DB78);
  swift_release();
  swift_release();
  uint64_t v35 = a12[3];
  *(void *)(v35 + 24) = &off_1EFF9DBD8;
  swift_unknownObjectWeakAssign();
  uint64_t v36 = *(void *)(v35 + 32);
  uint64_t v37 = (void *)swift_allocObject();
  v37[2] = v35;
  v37[3] = a5;
  v37[4] = &protocol witness table for FlushProcessor;
  swift_retain_n();
  swift_retain();
  sub_1A908CAA8(v36, (uint64_t)sub_1A908F7D4, (uint64_t)v37);
  swift_release();
  swift_release();
  sub_1A90A1BE4(v43, type metadata accessor for SummaryEventConfiguration);
  sub_1A90A1BE4(v42, type metadata accessor for DiagnosticsConsentProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  return a12;
}

uint64_t sub_1A91599A0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1A9159A00()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  long long v5 = *(_OWORD *)(v0 + 40);
  long long v7 = *(_OWORD *)(v0 + 24);
  v8[0] = v5;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)(v0 + 49);
  return sub_1A915421C((uint64_t)&v7, v1, v2, v3, v4);
}

void sub_1A9159A50(uint64_t a1)
{
  sub_1A9156748(a1, *(void (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_1A9159A5C()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_release();

  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72) >= 3uLL) {
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = v3 | 7;
  uint64_t v6 = (v3 + 80) & ~v3;
  uint64_t v7 = v6 + v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v6, v1);

  return MEMORY[0x1F4186498](v0, v7, v5);
}

uint64_t sub_1A9159B58()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A9159B90()
{
  swift_release();

  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t method lookup function for BridgedSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedSessionManager);
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(privacyValidationProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(accessQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of BridgedSessionManager.__allocating_init(accessQueue:privacyValidationProvider:diagnosticsConsentProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t type metadata accessor for BridgedAccessSessionManager()
{
  return self;
}

uint64_t method lookup function for BridgedAccessSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedAccessSessionManager);
}

uint64_t sub_1A9159C84()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v1 = sub_1A916AC90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  if (*(void *)(v0 + v5)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, v5 + 16, v3 | 7);
}

uint64_t sub_1A9159DA4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t objectdestroy_9Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A9159E20(uint64_t a1)
{
  return a1;
}

void sub_1A9159E6C()
{
  if (!qword_1EB687AF0)
  {
    sub_1A9159ED0();
    sub_1A90C56C0();
    unint64_t v0 = type metadata accessor for DataEventStack();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB687AF0);
    }
  }
}

void sub_1A9159ED0()
{
  if (!qword_1EB687AE0)
  {
    sub_1A90C566C();
    unint64_t v0 = type metadata accessor for SessionData();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB687AE0);
    }
  }
}

uint64_t Action.hash(into:)()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 3:
      uint64_t result = sub_1A916BAC0();
      break;
    default:
      sub_1A916BAC0();
      uint64_t result = sub_1A916B030();
      break;
  }
  return result;
}

uint64_t Action.hashValue.getter()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A916BAB0();
  switch(v1)
  {
    case 3:
      sub_1A916BAC0();
      break;
    default:
      sub_1A916BAC0();
      sub_1A916B030();
      break;
  }
  return sub_1A916BAD0();
}

uint64_t sub_1A915A120()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 3:
      uint64_t result = sub_1A916BAC0();
      break;
    default:
      sub_1A916BAC0();
      uint64_t result = sub_1A916B030();
      break;
  }
  return result;
}

uint64_t sub_1A915A1F8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A916BAB0();
  switch(v1)
  {
    case 3:
      sub_1A916BAC0();
      break;
    default:
      sub_1A916BAC0();
      sub_1A916B030();
      break;
  }
  return sub_1A916BAD0();
}

BOOL ActionSequence.isEmpty.getter()
{
  return *(void *)(*(void *)v0 + 16) == 0;
}

Swift::Bool __swiftcall ActionSequence.match(lastActions:)(Swift::OpaquePointer lastActions)
{
  rawValue = lastActions._rawValue;
  unint64_t v3 = *((void *)lastActions._rawValue + 2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *v1;
  if (*(void *)(v4 + 16) < v3) {
    return 0;
  }
  Swift::Bool result = sub_1A9113274(v3, v4);
  int64_t v9 = v8 >> 1;
  uint64_t v10 = (v8 >> 1) - v7;
  if (__OFSUB__(v8 >> 1, v7)) {
    goto LABEL_19;
  }
  if (v10)
  {
    uint64_t v11 = v6;
    uint64_t v12 = v7;
    uint64_t v24 = rawValue;
    uint64_t v25 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    Swift::Bool result = sub_1A90B2A10(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    uint64_t v13 = v25;
    if (v12 <= v9) {
      uint64_t v14 = v9;
    }
    else {
      uint64_t v14 = v12;
    }
    uint64_t v15 = v14 - v12;
    uint64_t v16 = (unsigned __int8 *)(v11 + 40 * v12 + 16);
    while (v15)
    {
      uint64_t v17 = *((void *)v16 - 2);
      uint64_t v18 = *((void *)v16 - 1);
      unsigned __int8 v19 = *v16;
      Swift::Bool result = sub_1A90CE08C(v17, v18, *v16);
      unint64_t v21 = *(void *)(v25 + 16);
      unint64_t v20 = *(void *)(v25 + 24);
      if (v21 >= v20 >> 1) {
        Swift::Bool result = sub_1A90B2A10(v20 > 1, v21 + 1, 1);
      }
      *(void *)(v25 + 16) = v21 + 1;
      unint64_t v22 = v25 + 24 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v18;
      *(unsigned char *)(v22 + 48) = v19;
      --v15;
      v16 += 40;
      if (!--v10)
      {
        swift_unknownObjectRelease();
        rawValue = v24;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v13 = MEMORY[0x1E4FBC860];
LABEL_17:
  char v23 = sub_1A915A498(v13, (uint64_t)rawValue);
  swift_bridgeObjectRelease();
  return v23 & 1;
}

uint64_t sub_1A915A498(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v34 = a2 + 32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = 0;
  uint64_t v6 = (unsigned __int8 *)(a1 + 48);
  BOOL v7 = v3 == 0;
  if (v3) {
    goto LABEL_4;
  }
  while (2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    int v12 = 255;
    unint64_t v5 = v3;
    if (!v4) {
      goto LABEL_79;
    }
LABEL_7:
    int v14 = *v6;
    uint64_t v11 = *((void *)v6 - 2);
    uint64_t v10 = *((void *)v6 - 1);
    sub_1A90CE08C(v11, v10, *v6);
    if (v12 == 255)
    {
      int v12 = v14;
LABEL_79:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12 != 255)
      {
        uint64_t v28 = v11;
        uint64_t v29 = v10;
        goto LABEL_84;
      }
      return 1;
    }
    if (v14 == 255) {
      goto LABEL_83;
    }
    switch(v12)
    {
      case 1:
        if (v14 == 1)
        {
          if (v9 == v11 && v8 == v10)
          {
            uint64_t v17 = v9;
            uint64_t v18 = v8;
LABEL_34:
            sub_1A915AF84(v17, v18, 1u);
            uint64_t v22 = v9;
            uint64_t v23 = v8;
LABEL_35:
            unsigned __int8 v24 = 1;
            goto LABEL_44;
          }
          if (sub_1A916B9E0()) {
            goto LABEL_33;
          }
          if (v9 == 42 && v8 == 0xE100000000000000)
          {
            sub_1A915AF84(v11, v10, 1u);
            uint64_t v22 = 42;
            uint64_t v23 = 0xE100000000000000;
            goto LABEL_35;
          }
          if (sub_1A916B9E0())
          {
LABEL_33:
            uint64_t v17 = v11;
            uint64_t v18 = v10;
            goto LABEL_34;
          }
          if (v11 == 42 && v10 == 0xE100000000000000)
          {
            uint64_t v17 = 42;
            uint64_t v18 = 0xE100000000000000;
            goto LABEL_34;
          }
          char v26 = sub_1A916B9E0();
          sub_1A915AF84(v11, v10, 1u);
          sub_1A915AF84(v9, v8, 1u);
          if ((v26 & 1) == 0) {
            goto LABEL_90;
          }
          goto LABEL_45;
        }
        sub_1A915AF84(v11, v10, v14);
        uint64_t v31 = v9;
        uint64_t v32 = v8;
        unsigned __int8 v33 = 1;
        goto LABEL_89;
      case 2:
        if (v14 == 2)
        {
          if (v9 == v11 && v8 == v10)
          {
            uint64_t v19 = v9;
            uint64_t v20 = v8;
LABEL_38:
            sub_1A915AF84(v19, v20, 2u);
            uint64_t v22 = v9;
            uint64_t v23 = v8;
            goto LABEL_39;
          }
          if (sub_1A916B9E0()) {
            goto LABEL_37;
          }
          if (v9 == 42 && v8 == 0xE100000000000000)
          {
            sub_1A915AF84(v11, v10, 2u);
            uint64_t v22 = 42;
            uint64_t v23 = 0xE100000000000000;
LABEL_39:
            unsigned __int8 v24 = 2;
LABEL_44:
            sub_1A915AF84(v22, v23, v24);
            goto LABEL_45;
          }
          if (sub_1A916B9E0())
          {
LABEL_37:
            uint64_t v19 = v11;
            uint64_t v20 = v10;
            goto LABEL_38;
          }
          if (v11 == 42 && v10 == 0xE100000000000000)
          {
            uint64_t v19 = 42;
            uint64_t v20 = 0xE100000000000000;
            goto LABEL_38;
          }
          char v27 = sub_1A916B9E0();
          sub_1A915AF84(v11, v10, 2u);
          sub_1A915AF84(v9, v8, 2u);
          if ((v27 & 1) == 0) {
            goto LABEL_90;
          }
          goto LABEL_45;
        }
        sub_1A915AF84(v11, v10, v14);
        uint64_t v31 = v9;
        uint64_t v32 = v8;
        unsigned __int8 v33 = 2;
        goto LABEL_89;
      case 3:
        if (v9 | v8)
        {
          if (v9 ^ 1 | v8)
          {
            if (v14 != 3 || v10 || v11 != 2) {
              goto LABEL_85;
            }
            goto LABEL_45;
          }
          if (v14 != 3 || v10 || v11 != 1) {
            goto LABEL_85;
          }
          uint64_t v21 = 1;
LABEL_43:
          sub_1A915AF84(v21, 0, 3u);
          uint64_t v22 = v9;
          uint64_t v23 = v8;
          unsigned __int8 v24 = 3;
          goto LABEL_44;
        }
        if (v14 == 3 && !(v11 | v10))
        {
          uint64_t v21 = 0;
          goto LABEL_43;
        }
LABEL_85:
        sub_1A915AF84(v11, v10, v14);
        uint64_t v31 = v9;
        uint64_t v32 = v8;
        unsigned __int8 v33 = 3;
        goto LABEL_89;
      default:
        if (v14)
        {
          sub_1A915AF84(v11, v10, v14);
          uint64_t v31 = v9;
          uint64_t v32 = v8;
          unsigned __int8 v33 = 0;
LABEL_89:
          sub_1A915AF84(v31, v32, v33);
LABEL_90:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
        if (v9 == v11 && v8 == v10)
        {
          uint64_t v15 = v9;
          uint64_t v16 = v8;
LABEL_30:
          sub_1A915AF84(v15, v16, 0);
          uint64_t v22 = v9;
          uint64_t v23 = v8;
LABEL_31:
          unsigned __int8 v24 = 0;
          goto LABEL_44;
        }
        if (sub_1A916B9E0()) {
          goto LABEL_29;
        }
        if (v9 == 42 && v8 == 0xE100000000000000)
        {
          sub_1A915AF84(v11, v10, 0);
          uint64_t v22 = 42;
          uint64_t v23 = 0xE100000000000000;
          goto LABEL_31;
        }
        if (sub_1A916B9E0())
        {
LABEL_29:
          uint64_t v15 = v11;
          uint64_t v16 = v10;
          goto LABEL_30;
        }
        if (v11 == 42 && v10 == 0xE100000000000000)
        {
          uint64_t v15 = 42;
          uint64_t v16 = 0xE100000000000000;
          goto LABEL_30;
        }
        char v25 = sub_1A916B9E0();
        sub_1A915AF84(v11, v10, 0);
        sub_1A915AF84(v9, v8, 0);
        if ((v25 & 1) == 0) {
          goto LABEL_90;
        }
LABEL_45:
        --v4;
        v6 += 24;
        BOOL v7 = v5 >= v3;
        if (v5 == v3) {
          continue;
        }
LABEL_4:
        if (v7)
        {
          __break(1u);
          JUMPOUT(0x1A915AA70);
        }
        uint64_t v13 = v34 + 24 * v5;
        int v12 = *(unsigned __int8 *)(v13 + 16);
        uint64_t v9 = *(void *)v13;
        uint64_t v8 = *(void *)(v13 + 8);
        sub_1A90CE08C(*(void *)v13, v8, *(unsigned char *)(v13 + 16));
        if (v4)
        {
          ++v5;
          goto LABEL_7;
        }
        if (v12 == 255)
        {
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          goto LABEL_79;
        }
LABEL_83:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v28 = v9;
        uint64_t v29 = v8;
LABEL_84:
        sub_1A915AF84(v28, v29, v12);
        return 0;
    }
  }
}

uint64_t _s12AppAnalytics6ActionO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = *a2;
  uint64_t v4 = a2[1];
  int v6 = *((unsigned __int8 *)a2 + 16);
  switch(*((unsigned char *)a1 + 16))
  {
    case 1:
      if (v6 == 1) {
        goto LABEL_7;
      }
      return 0;
    case 2:
      if (v6 == 2) {
        goto LABEL_7;
      }
      return 0;
    case 3:
      if (!(v3 | v2)) {
        return v6 == 3 && (v4 | v5) == 0;
      }
      if (v3 ^ 1 | v2) {
        return v6 == 3 && v5 == 2 && v4 == 0;
      }
      return v6 == 3 && v5 == 1 && v4 == 0;
    default:
      if (*((unsigned char *)a2 + 16)) {
        return 0;
      }
LABEL_7:
      BOOL v7 = v3 == v5 && v2 == v4;
      if (v7
        || (sub_1A916B9E0() & 1) != 0
        || v3 == 42 && v2 == 0xE100000000000000
        || (sub_1A916B9E0() & 1) != 0
        || v5 == 42 && v4 == 0xE100000000000000)
      {
        return 1;
      }
      return sub_1A916B9E0();
  }
}

unint64_t sub_1A915ABF4()
{
  unint64_t result = qword_1E97B1C48;
  if (!qword_1E97B1C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1C48);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Action(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A915ACD4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1A915ACEC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Action()
{
  return &type metadata for Action;
}

ValueMetadata *type metadata accessor for ActionSequence()
{
  return &type metadata for ActionSequence;
}

uint64_t destroy for Action.Entry(uint64_t a1)
{
  sub_1A90CE0B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Action.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1A90CE08C(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Action.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1A90CE08C(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  sub_1A90CE0B4(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Action.Entry(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  sub_1A90CE0B4(v5, v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Action.Entry(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Action.Entry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Action.Entry()
{
  return &type metadata for Action.Entry;
}

uint64_t sub_1A915AF84(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_1A90CE0B4(a1, a2, a3);
  }
  return a1;
}

Swift::tuple_granularity_AppAnalytics_TimestampGranularity_jitter_Double __swiftcall TimestampJitter.makeTimestampConfiguration()()
{
  uint64_t v2 = (unsigned char *)v0;
  if (*(unsigned char *)(v1 + 16))
  {
    char v3 = 0;
    double v4 = 0.0;
  }
  else
  {
    double v4 = *(double *)v1;
    double v5 = *(double *)(v1 + 8);
    if (*(double *)v1 > v5)
    {
      __break(1u);
      goto LABEL_7;
    }
    LOBYTE(v0) = sub_1A9090B64(v0, v4, v5);
    char v3 = 4;
  }
  *uint64_t v2 = v3;
LABEL_7:
  result.jitter = v4;
  result.granularity = v0;
  return result;
}

BOOL TimestampJitter.isEnabled.getter()
{
  return (*(unsigned char *)(v0 + 16) & 1) == 0;
}

double TimestampJitter.lowerBound.getter()
{
  double result = 0.0;
  if ((v0[16] & 1) == 0) {
    return *(double *)v0;
  }
  return result;
}

double TimestampJitter.upperBound.getter()
{
  double result = 0.0;
  if ((*(unsigned char *)(v0 + 16) & 1) == 0) {
    return *(double *)(v0 + 8);
  }
  return result;
}

uint64_t sub_1A915B020(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

unint64_t BridgedTimeDurationGranularity.init(rawValue:)(unint64_t a1)
{
  return sub_1A90B0E88(a1);
}

id sub_1A915B05C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BridgedTimeDurationGranularityFactory()), sel_init);
  qword_1E97B1C50 = (uint64_t)result;
  return result;
}

id BridgedTimeDurationGranularityFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static BridgedTimeDurationGranularityFactory.sharedInstance.getter()
{
  if (qword_1E97B1018 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E97B1C50;

  return v0;
}

id BridgedTimeDurationGranularityFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id BridgedTimeDurationGranularityFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s12AppAnalytics37BridgedTimeDurationGranularityFactoryC04makedeF0yAA0cdeF0OSSF_0()
{
  uint64_t v1 = sub_1A916AFF0();
  uint64_t v2 = v0;
  if (v1 == 0x6473646E6F636573 && v0 == 0xEB000000006E776FLL || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (v1 == 0x7573646E6F636573 && v2 == 0xE900000000000070 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (v1 == 0x73646E6F636573 && v2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v4 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v4) {
      return 3;
    }
    else {
      return 0;
    }
  }
}

unint64_t sub_1A915B420()
{
  unint64_t result = qword_1E97B1C58;
  if (!qword_1E97B1C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1C58);
  }
  return result;
}

ValueMetadata *type metadata accessor for BridgedTimeDurationGranularity()
{
  return &type metadata for BridgedTimeDurationGranularity;
}

uint64_t type metadata accessor for BridgedTimeDurationGranularityFactory()
{
  return self;
}

uint64_t DiagnosticsConsentRequired.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1A916B540();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t DiagnosticsConsentRequired.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_1A916B540();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*DiagnosticsConsentRequired.wrappedValue.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t DiagnosticsConsentRequired.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2);
  uint64_t v5 = sub_1A916B540();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(a3, a1, v5);
}

uint64_t sub_1A915B654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A9095B68(&v9);
  if (v9 == 2 || (v9 & 1) != 0)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 56);
    return v8(a2, 1, 1);
  }
  else
  {
    uint64_t v5 = sub_1A916B540();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
    return v6(a2, v2, v5);
  }
}

BOOL static DiagnosticsConsentRequired<A>.== infix(_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v37[1] = a4;
  uint64_t v43 = a2;
  id v41 = a1;
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  v37[0] = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A916B540();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v38 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v10 = (char *)v37 - v9;
  uint64_t v11 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v42 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v37 - v15;
  double v18 = MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)v37 - v19;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t, double))(v11 + 16);
  v21((char *)v37 - v19, v41, v7, v18);
  ((void (*)(char *, uint64_t, uint64_t))v21)(v16, v43, v7);
  uint64_t v39 = TupleTypeMetadata2;
  uint64_t v22 = &v10[*(int *)(TupleTypeMetadata2 + 48)];
  ((void (*)(char *, char *, uint64_t))v21)(v10, v20, v7);
  id v41 = v22;
  ((void (*)(char *, char *, uint64_t))v21)(v22, v16, v7);
  uint64_t v40 = v5;
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v43 = a3;
  if (v23(v10, 1, a3) == 1)
  {
    unsigned __int8 v24 = *(void (**)(char *, uint64_t))(v11 + 8);
    v24(v16, v7);
    v24(v20, v7);
    if (v23(v41, 1, v43) == 1)
    {
      v24(v10, v7);
      return 1;
    }
    goto LABEL_6;
  }
  ((void (*)(char *, char *, uint64_t))v21)(v42, v10, v7);
  char v25 = v41;
  uint64_t v26 = v43;
  unsigned int v27 = v23(v41, 1, v43);
  uint64_t v28 = v40;
  uint64_t v29 = (void (**)(char *, uint64_t))(v40 + 8);
  if (v27 == 1)
  {
    id v30 = *(void (**)(char *, uint64_t))(v11 + 8);
    v30(v16, v7);
    v30(v20, v7);
    (*v29)(v42, v26);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
    return 0;
  }
  uint64_t v31 = *(void (**)(void, char *, uint64_t))(v40 + 32);
  v40 += 8;
  uint64_t v32 = v37[0];
  v31(v37[0], v25, v26);
  unsigned __int8 v33 = v42;
  LODWORD(v41) = sub_1A916AF50();
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  v34(v32, v26);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v11 + 8);
  v35(v16, v7);
  v35(v20, v7);
  v34((uint64_t)v33, v26);
  v35(v10, v7);
  return (v41 & 1) != 0;
}

BOOL sub_1A915BBC4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static DiagnosticsConsentRequired<A>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a4 - 8));
}

uint64_t DiagnosticsConsentRequired<A>.hash(into:)()
{
  sub_1A916B540();

  return sub_1A916B560();
}

uint64_t DiagnosticsConsentRequired<A>.hashValue.getter()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A915BC88()
{
  return DiagnosticsConsentRequired<A>.hashValue.getter();
}

uint64_t sub_1A915BC90()
{
  return DiagnosticsConsentRequired<A>.hash(into:)();
}

uint64_t sub_1A915BC98()
{
  return sub_1A916BAD0();
}

uint64_t DiagnosticsConsentRequired<A>.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_1A916B540();
  uint64_t v8 = *(void *)(v7 - 8);
  double v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = &v15[-v10 - 8];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, double))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2, v9);
  sub_1A90A0DC8(a1, (uint64_t)v15);
  sub_1A916B570();
  __swift_destroy_boxed_opaque_existential_0(a1);
  if (!v3) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 40))(a3, v11, v7);
  }
  uint64_t v12 = type metadata accessor for DiagnosticsConsentRequired();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a3, v12);
}

uint64_t sub_1A915BE80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DiagnosticsConsentRequired<A>.init(from:)(a1, *(void *)(a2 + 16), a3);
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_1A916B540();
  uint64_t v18 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v20;
  uint64_t result = sub_1A916B890();
  if (!v13)
  {
    uint64_t v16 = v18;
    uint64_t v15 = v19;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, a1) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v3);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, a1);
      return DiagnosticsConsentRequired.init(wrappedValue:)((uint64_t)v5, a1, v15);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v8, a1);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v12, a1);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, a1);
      DiagnosticsConsentRequired.init(wrappedValue:)((uint64_t)v5, a1, v15);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a1);
    }
  }
  return result;
}

uint64_t DiagnosticsConsentRequired<A>.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1A916B540();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v8 - v5;
  sub_1A915B654(a2, (uint64_t)&v8 - v5);
  sub_1A916B550();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1A915C23C(uint64_t a1, uint64_t a2)
{
  return DiagnosticsConsentRequired<A>.encode(to:)(a1, a2);
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  uint64_t v0 = sub_1A916B540();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - v2;
  uint64_t v4 = type metadata accessor for DiagnosticsConsentRequired();
  sub_1A915B654(v4, (uint64_t)v3);
  sub_1A916B920();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id BridgedDiagnosticsConsentRequired.data.getter()
{
  return *(id *)(v0 + OBJC_IVAR___AADiagnosticsConsentRequired_data);
}

id BridgedDiagnosticsConsentRequired.__allocating_init(data:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___AADiagnosticsConsentRequired_data] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BridgedDiagnosticsConsentRequired.init(data:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___AADiagnosticsConsentRequired_data] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

void sub_1A915C488(_OWORD *a1@<X8>)
{
  v18[3] = *(id *)MEMORY[0x1E4F143B8];
  sub_1A9095B68((char *)v18);
  if (LOBYTE(v18[0]) == 2 || ((uint64_t)v18[0] & 1) != 0)
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
  else
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR___AADiagnosticsConsentRequired_data);
    v18[2] = &unk_1EFFAB340;
    uint64_t v4 = swift_dynamicCastObjCProtocolConditional();
    if (v4)
    {
      objc_super v5 = (void *)v4;
      id v6 = v3;
      id v7 = objc_msgSend(v5, sel_toDict);
      v18[0] = 0;
      id v8 = objc_msgSend(v7, sel_toJsonValueAndReturnError_, v18);
      id v9 = v18[0];
      if (v8)
      {
        sub_1A916B5F0();

        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v15 = v9;
        sub_1A916A990();

        swift_willThrow();
      }
    }
    else
    {
      v18[1] = &unk_1EFFAD480;
      uint64_t v10 = swift_dynamicCastObjCProtocolConditional();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        v18[0] = 0;
        id v12 = v3;
        id v13 = objc_msgSend(v11, sel_toJsonValueAndReturnError_, v18);
        id v14 = v18[0];
        if (v13)
        {
          sub_1A916B5F0();

          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v17 = v14;
          sub_1A916A990();

          swift_willThrow();
        }
      }
      else
      {
        sub_1A90C3D34();
        swift_allocError();
        *uint64_t v16 = 2;
        swift_willThrow();
      }
    }
  }
}

id BridgedDiagnosticsConsentRequired.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedDiagnosticsConsentRequired.init()()
{
}

id BridgedDiagnosticsConsentRequired.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void BridgedDiagnosticsConsentRequired.toJsonValue()(uint64_t a1@<X8>)
{
  sub_1A915C488(&v4);
  if (!v1)
  {
    if (v5)
    {
      sub_1A90A1A68(&v4, (_OWORD *)a1);
    }
    else
    {
      id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
      *(void *)(a1 + 24) = sub_1A90B27E0();
      *(void *)a1 = v3;
      sub_1A909B5DC((uint64_t)&v4);
    }
  }
}

uint64_t type metadata accessor for DiagnosticsConsentRequired()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A915C938()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A915C980()
{
  uint64_t result = sub_1A916B540();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A915CA10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1A915CB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_1A915CC10(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A915CD08(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    id v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_1A915CE74(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A915CF6C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    id v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_1A915D0D8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_1A915D278(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x1A915D4B4);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for BridgedDiagnosticsConsentRequired()
{
  return self;
}

uint64_t method lookup function for BridgedDiagnosticsConsentRequired(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedDiagnosticsConsentRequired);
}

uint64_t dispatch thunk of BridgedDiagnosticsConsentRequired.__allocating_init(data:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t *sub_1A915D52C()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  return v0;
}

uint64_t sub_1A915D5AC()
{
  sub_1A915D52C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1A915D604()
{
  uint64_t result = sub_1A915D628();
  qword_1EB687F58 = result;
  qword_1EB687F60 = v1;
  return result;
}

uint64_t sub_1A915D628()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  uint64_t v1 = (void *)sub_1A916AF60();
  id v2 = objc_msgSend(v0, sel_objectForInfoDictionaryKey_, v1);

  if (v2)
  {
    sub_1A916B5F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1A909374C((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1A909B5DC((uint64_t)v6);
    return 0;
  }
}

uint64_t sub_1A915D740()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A915D7E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    unsigned int v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    *(void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A915D920(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_bridgeObjectRelease();
}

void *sub_1A915D9B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  *(void *)((*(void *)(v7 + 48) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 48) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A915DA6C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  *(void *)((*(void *)(v7 + 40) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 40) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A915DB3C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A915DBDC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  *(void *)((*(void *)(v8 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v8 + 24) + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A915DC94(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 16) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *(unsigned __int8 *)(a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)(a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A915DDECLL);
      case 4:
        int v14 = *(_DWORD *)(a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *(_DWORD *)a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 16) & ~v6);
  }
  unint64_t v17 = *(void *)(a1 + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1A915DE00(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
              uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
              v19(v18);
            }
            else if ((a2 & 0x80000000) != 0)
            {
              *(void *)a1 = a2 ^ 0x80000000;
              *((void *)a1 + 1) = 0;
            }
            else
            {
              *((void *)a1 + 1) = a2 - 1;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1A915DFF4);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for SnapshotLevel()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TimedData.init(startTimestamp:endTimestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a3, a1, v6);
  uint64_t v9 = type metadata accessor for TimedData();
  v8(a3 + *(int *)(v9 + 20), a2, v6);
  sub_1A916ABF0();
  double v11 = v10;
  unsigned int v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12(a2, v6);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v12)(a1, v6);
  double v14 = v11 * 1000.0;
  if ((~COERCE__INT64(v11 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v14 < 9.22337204e18)
  {
    *(void *)(a3 + *(int *)(v9 + 24)) = (uint64_t)v14;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t TimedData.startTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1A916AC90();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t TimedData.endTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimedData() + 20);
  uint64_t v4 = sub_1A916AC90();
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t TimedData.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TimedData() + 24));
}

uint64_t sub_1A915E2A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A9103BCC(*a1, *a2);
}

uint64_t sub_1A915E2B4()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A915E36C()
{
  sub_1A916B030();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A915E410()
{
  return sub_1A916BAD0();
}

uint64_t sub_1A915E4C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A915F6D4();
  *a1 = result;
  return result;
}

void sub_1A915E4F4(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEE00706D61747365;
  unint64_t v4 = 0xEC000000706D6174;
  uint64_t v5 = 0x73656D6954646E65;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6E6F697461727564;
    unint64_t v4 = 0xE800000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6D69547472617473;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1A915E568()
{
  uint64_t v1 = 0x73656D6954646E65;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E6F697461727564;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6D69547472617473;
  }
}

uint64_t sub_1A915E5D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A915F6D4();
  *a1 = result;
  return result;
}

uint64_t sub_1A915E600(uint64_t a1)
{
  unint64_t v2 = sub_1A915E89C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A915E63C(uint64_t a1)
{
  unint64_t v2 = sub_1A915E89C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TimedData.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_1A915ED88(0, &qword_1EB687AC8, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A915E89C();
  sub_1A916BB50();
  char v15 = 0;
  sub_1A916AC90();
  sub_1A908B1EC(qword_1EB689120, MEMORY[0x1E4F27928]);
  sub_1A916B960();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for TimedData();
    char v14 = 1;
    sub_1A916B960();
    v12[1] = *(void *)(v3 + *(int *)(v10 + 24));
    char v13 = 2;
    sub_1A915E8F0();
    sub_1A916B960();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1A915E89C()
{
  unint64_t result = qword_1EB687A88;
  if (!qword_1EB687A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687A88);
  }
  return result;
}

unint64_t sub_1A915E8F0()
{
  unint64_t result = qword_1EB687878;
  if (!qword_1EB687878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687878);
  }
  return result;
}

uint64_t TimedData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_1A916AC90();
  uint64_t v24 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v26 = (char *)&v21 - v7;
  sub_1A915ED88(0, &qword_1EB686D30, MEMORY[0x1E4FBBDC0]);
  uint64_t v27 = v8;
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = type metadata accessor for TimedData();
  MEMORY[0x1F4188790](v11);
  char v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A915E89C();
  uint64_t v28 = v10;
  char v14 = v29;
  sub_1A916BB20();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v22 = v11;
  uint64_t v29 = v13;
  char v33 = 0;
  sub_1A908B1EC(&qword_1EB686D38, MEMORY[0x1E4F27928]);
  char v15 = v26;
  sub_1A916B8E0();
  uint64_t v26 = *(char **)(v24 + 32);
  ((void (*)(char *, char *, uint64_t))v26)(v29, v15, v3);
  char v32 = 1;
  int v16 = v5;
  sub_1A916B8E0();
  uint64_t v17 = v22;
  uint64_t v18 = (uint64_t)v29;
  ((void (*)(char *, char *, uint64_t))v26)(&v29[*(int *)(v22 + 20)], v16, v3);
  char v31 = 2;
  sub_1A915EDEC();
  uint64_t v19 = v28;
  sub_1A916B8E0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v27);
  *(void *)(v18 + *(int *)(v17 + 24)) = v30;
  sub_1A915EE40(v18, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A915EEA4(v18);
}

void sub_1A915ED88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A915E89C();
    unint64_t v7 = a3(a1, &type metadata for TimedData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1A915EDEC()
{
  unint64_t result = qword_1EB686D28;
  if (!qword_1EB686D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB686D28);
  }
  return result;
}

uint64_t sub_1A915EE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimedData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A915EEA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimedData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A915EF00(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A908B1EC(&qword_1EB688BF0, (void (*)(uint64_t))type metadata accessor for TimedData);
  uint64_t result = sub_1A908B1EC(&qword_1EB688BE8, (void (*)(uint64_t))type metadata accessor for TimedData);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A915EF84@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TimedData.init(from:)(a1, a2);
}

uint64_t sub_1A915EF9C(void *a1)
{
  return TimedData.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for TimedData(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1A916AC90();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TimedData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916AC90();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t initializeWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A915F3EC);
}

uint64_t sub_1A915F3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916AC90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1A915F458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916AC90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

unsigned char *storeEnumTagSinglePayload for TimedData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A915F594);
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

ValueMetadata *type metadata accessor for TimedData.CodingKeys()
{
  return &type metadata for TimedData.CodingKeys;
}

unint64_t sub_1A915F5D0()
{
  unint64_t result = qword_1E97B1CE8;
  if (!qword_1E97B1CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1CE8);
  }
  return result;
}

unint64_t sub_1A915F628()
{
  unint64_t result = qword_1EB687868;
  if (!qword_1EB687868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687868);
  }
  return result;
}

unint64_t sub_1A915F680()
{
  unint64_t result = qword_1EB687A90;
  if (!qword_1EB687A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687A90);
  }
  return result;
}

uint64_t sub_1A915F6D4()
{
  unint64_t v0 = sub_1A916B870();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t static DiagnosticsConsentProvider.custom(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_retain();
  sub_1A916ACB0();
  uint64_t result = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v7 = (void *)(a3 + *(int *)(result + 20));
  *uint64_t v7 = a1;
  v7[1] = a2;
  return result;
}

void sub_1A915F774(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v82 = a6;
  uint64_t v91 = a3;
  uint64_t v92 = a2;
  unint64_t v80 = a1;
  uint64_t v10 = type metadata accessor for BatchRepair();
  uint64_t v76 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  char v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  char v15 = (char *)&v74 - v14;
  uint64_t v16 = sub_1A916AE70();
  uint64_t v78 = *(void *)(v16 - 8);
  uint64_t v79 = (char *)v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v77 = (uint64_t *)((char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1A916ACC0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  unint64_t v75 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v84 = v24;
  MEMORY[0x1F4188790](v24);
  uint64_t v90 = (uint64_t)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  uint64_t v81 = (char *)&v74 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v88 = (char *)&v74 - v30;
  MEMORY[0x1F4188790](v29);
  char v32 = (char *)&v74 - v31;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  uint64_t v85 = a5;
  uint64_t v86 = v20;
  uint64_t v87 = a4;
  sub_1A916BBA0();
  uint64_t v83 = v94;
  uint64_t v89 = v22;
  v93 = v32;
  if (v94)
  {
    char v33 = v32;
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
    v34(v33, v94 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v21);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    uint64_t v36 = v21;
    v35(v33, 0, 1, v21);
  }
  else
  {
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    uint64_t v37 = v22;
    uint64_t v36 = v21;
    v35(v32, 1, 1, v21);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  }
  uint64_t v38 = (uint64_t)v88;
  v34(v88, v92, v36);
  v35((char *)v38, 0, 1, v36);
  uint64_t v39 = v90;
  uint64_t v40 = v90 + *(int *)(v84 + 48);
  sub_1A9098CD0((uint64_t)v93, v90, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v41 = v39;
  sub_1A9098CD0(v38, v40, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 48);
  if (v42(v39, 1, v36) == 1)
  {
    sub_1A9098B50(v38, (uint64_t (*)(void))sub_1A9098C34);
    uint64_t v41 = v90;
    sub_1A9098B50((uint64_t)v93, (uint64_t (*)(void))sub_1A9098C34);
    int v43 = v42(v40, 1, v36);
    uint64_t v44 = v87;
    if (v43 == 1)
    {
      sub_1A9098B50(v41, (uint64_t (*)(void))sub_1A9098C34);
      char v45 = v85;
LABEL_13:
      uint64_t v52 = *(void *)(v91 + 16);
      if (v52)
      {
        uint64_t v53 = v91 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80));
        uint64_t v54 = *(void *)(v76 + 72);
        swift_bridgeObjectRetain();
        uint64_t v55 = v82;
        while (1)
        {
          uint64_t v56 = sub_1A9098CD0(v53, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for BatchRepair);
          objc_super v57 = (char *)MEMORY[0x1AD0EE490](v56);
          sub_1A90C789C(v44, (uint64_t)v13, v45, v55);
          if (v7) {
            goto LABEL_29;
          }
          uint64_t v7 = 0;
          sub_1A9098B50((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for BatchRepair);
          v53 += v54;
          if (!--v52)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_25;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_25:
      swift_release();
      swift_release();
      swift_release();
      return;
    }
    goto LABEL_11;
  }
  uint64_t v46 = (uint64_t)v81;
  sub_1A9098CD0(v39, (uint64_t)v81, (uint64_t (*)(void))sub_1A9098C34);
  if (v42(v40, 1, v36) == 1)
  {
    sub_1A9098B50((uint64_t)v88, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v93, (uint64_t (*)(void))sub_1A9098C34);
    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v46, v36);
LABEL_11:
    sub_1A9098B50(v41, (uint64_t (*)(void))sub_1A9098F30);
    char v45 = v85;
    uint64_t v47 = (uint64_t)v86;
    goto LABEL_18;
  }
  uint64_t v48 = v89;
  char v49 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v89 + 32))(v75, v40, v36);
  sub_1A90AD134();
  char v50 = sub_1A916AF50();
  objc_super v51 = *(void (**)(char *, uint64_t))(v48 + 8);
  v51(v49, v36);
  sub_1A9098B50((uint64_t)v88, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v93, (uint64_t (*)(void))sub_1A9098C34);
  v51(v81, v36);
  sub_1A9098B50(v39, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v47 = (uint64_t)v86;
  uint64_t v44 = v87;
  char v45 = v85;
  if (v50) {
    goto LABEL_13;
  }
LABEL_18:
  uint64_t v90 = qword_1EB687A10;
  sub_1A9098CD0(v92, v47, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  v93 = (char *)swift_allocObject();
  v93[OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status] = 2;
  objc_super v57 = v79;
  objc_super v58 = v80;
  objc_super v59 = *(void **)&v80[OBJC_IVAR___AAAccessQueue_queue];
  uint64_t v60 = v77;
  uint64_t v61 = v78;
  *uint64_t v77 = v59;
  (*(void (**)(void *, void, char *))(v61 + 104))(v60, *MEMORY[0x1E4FBCBF0], v57);
  id v62 = v58;
  id v63 = v59;
  char v64 = sub_1A916AE90();
  long long v66 = *(void (**)(void *, char *))(v61 + 8);
  long long v65 = (void *)(v61 + 8);
  v66(v60, v57);
  if (v64)
  {
    id v67 = v62;
    uint64_t v68 = (uint64_t)v93;
    sub_1A9099290((uint64_t)v86, (uint64_t)&v93[OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider]);
    *(void *)(v68 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v67;
    uint64_t v94 = v68;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    uint64_t v69 = *(void *)(v91 + 16);
    if (!v69)
    {
LABEL_24:
      swift_task_localValuePop();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_25;
    }
    objc_super v57 = (char *)(v91 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80)));
    uint64_t v70 = *(void *)(v76 + 72);
    swift_bridgeObjectRetain();
    uint64_t v71 = v87;
    uint64_t v72 = v82;
    while (1)
    {
      uint64_t v73 = sub_1A9098CD0((uint64_t)v57, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BatchRepair);
      long long v65 = (void *)MEMORY[0x1AD0EE490](v73);
      sub_1A90C789C(v71, (uint64_t)v15, v45, v72);
      if (v7) {
        break;
      }
      uint64_t v7 = 0;
      sub_1A9098B50((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BatchRepair);
      v57 += v70;
      if (!--v69)
      {
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_29:
  __break(1u);
}

uint64_t sub_1A91600D8(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  return sub_1A91610B4(a1, a2, a3, a4, a5);
}

uint64_t sub_1A91600F0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7)
{
  uint64_t v63 = a3;
  uint64_t v61 = a4;
  id v62 = a6;
  uint64_t v66 = a5;
  uint64_t v67 = a2;
  objc_super v57 = a1;
  uint64_t v8 = sub_1A916AE70();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v56 = (char **)((char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v55 = (uint64_t)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1A916ACC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v53 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v64 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v53 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v53 - v25;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  uint64_t v54 = v20;
  uint64_t v65 = a7;
  sub_1A916BBA0();
  uint64_t v60 = v68;
  if (v68)
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v27(v26, v68 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v12);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v28(v26, 0, 1, v12);
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v28(v26, 1, 1, v12);
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  }
  v27(v23, v67, v12);
  v28(v23, 0, 1, v12);
  uint64_t v29 = v64;
  uint64_t v30 = v64 + *(int *)(v16 + 48);
  sub_1A9098CD0((uint64_t)v26, v64, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v31 = v29;
  sub_1A9098CD0((uint64_t)v23, v30, (uint64_t (*)(void))sub_1A9098C34);
  char v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v32(v29, 1, v12) == 1)
  {
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
    if (v32(v30, 1, v12) == 1)
    {
      sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
LABEL_15:
      type metadata accessor for AccessTracker();
      uint64_t v51 = swift_allocObject();
      swift_weakInit();
      swift_weakAssign();
      uint64_t v52 = v66;
      *(void *)(v51 + 24) = v61;
      *(void *)(v51 + 32) = v52;
      swift_bridgeObjectRetain();
      v62(v51);
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v33 = v29;
  uint64_t v34 = (uint64_t)v54;
  sub_1A9098CD0(v33, (uint64_t)v54, (uint64_t (*)(void))sub_1A9098C34);
  if (v32(v30, 1, v12) == 1)
  {
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v34, v12);
LABEL_11:
    sub_1A9098B50(v31, (uint64_t (*)(void))sub_1A9098F30);
    goto LABEL_12;
  }
  uint64_t v47 = v34;
  uint64_t v48 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v53, v30, v12);
  sub_1A90AD134();
  char v49 = sub_1A916AF50();
  char v50 = *(void (**)(char *, uint64_t))(v13 + 8);
  v50(v48, v12);
  sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
  v50((char *)v47, v12);
  sub_1A9098B50(v31, (uint64_t (*)(void))sub_1A9098C34);
  if (v49) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v35 = v55;
  sub_1A9098CD0(v67, v55, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36
           + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status) = 2;
  uint64_t v38 = v56;
  uint64_t v37 = v57;
  uint64_t v39 = *(void **)&v57[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v56 = v39;
  uint64_t v41 = v58;
  uint64_t v40 = v59;
  (*(void (**)(void *, void, uint64_t))(v58 + 104))(v38, *MEMORY[0x1E4FBCBF0], v59);
  id v42 = v37;
  id v43 = v39;
  LOBYTE(v39) = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v41 + 8))(v38, v40);
  uint64_t v45 = v66;
  if (v39)
  {
    sub_1A9099290(v35, v36 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider);
    *(void *)(v36 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v42;
    uint64_t v68 = v36;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    type metadata accessor for AccessTracker();
    uint64_t v46 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v46 + 24) = v61;
    *(void *)(v46 + 32) = v45;
    swift_bridgeObjectRetain();
    v62(v46);
    swift_release();
    swift_task_localValuePop();
LABEL_16:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A91608A4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t), uint64_t a6)
{
  uint64_t v62 = a4;
  uint64_t v64 = a6;
  uint64_t v65 = a2;
  uint64_t v60 = a5;
  uint64_t v61 = a3;
  uint64_t v54 = a1;
  uint64_t v6 = sub_1A916AE70();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v53 = (uint64_t *)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A916ACC0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v52 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v51 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v51 - v25;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  objc_super v57 = v20;
  uint64_t v58 = v10;
  uint64_t v63 = v17;
  sub_1A916BBA0();
  uint64_t v59 = v66;
  if (v66)
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v27(v26, v66 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v11);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v28(v26, 0, 1, v11);
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v28(v26, 1, 1, v11);
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  }
  v27(v23, v65, v11);
  v28(v23, 0, 1, v11);
  uint64_t v29 = (uint64_t)v63;
  uint64_t v30 = (uint64_t)&v63[*(int *)(v15 + 48)];
  sub_1A9098CD0((uint64_t)v26, (uint64_t)v63, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098CD0((uint64_t)v23, v30, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v31(v29, 1, v11) == 1)
  {
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
    if (v31(v30, 1, v11) == 1)
    {
      sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
LABEL_15:
      type metadata accessor for AccessTracker();
      uint64_t v49 = swift_allocObject();
      swift_weakInit();
      swift_weakAssign();
      *(void *)(v49 + 24) = 0;
      *(void *)(v49 + 32) = 0;
      uint64_t v50 = swift_allocObject();
      swift_weakInit();
      swift_weakAssign();
      *(void *)(v50 + 24) = 0;
      *(void *)(v50 + 32) = 0;
      v60(v49, v50);
      swift_release();
      swift_release();
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v32 = (uint64_t)v57;
  sub_1A9098CD0(v29, (uint64_t)v57, (uint64_t (*)(void))sub_1A9098C34);
  if (v31(v30, 1, v11) == 1)
  {
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v32, v11);
LABEL_11:
    sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098F30);
    uint64_t v33 = (uint64_t)v58;
    goto LABEL_12;
  }
  uint64_t v46 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v52, v30, v11);
  sub_1A90AD134();
  char v47 = sub_1A916AF50();
  uint64_t v48 = *(void (**)(char *, uint64_t))(v12 + 8);
  v48(v46, v11);
  sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v26, (uint64_t (*)(void))sub_1A9098C34);
  v48(v57, v11);
  sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v33 = (uint64_t)v58;
  if (v47) {
    goto LABEL_15;
  }
LABEL_12:
  sub_1A9098CD0(v65, v33, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  uint64_t v34 = swift_allocObject();
  *(unsigned char *)(v34
           + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status) = 2;
  uint64_t v36 = v53;
  uint64_t v35 = v54;
  uint64_t v37 = *(void **)&v54[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v53 = v37;
  uint64_t v39 = v55;
  uint64_t v38 = v56;
  (*(void (**)(void *, void, uint64_t))(v55 + 104))(v36, *MEMORY[0x1E4FBCBF0], v56);
  id v40 = v35;
  id v41 = v37;
  char v42 = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v39 + 8))(v36, v38);
  if (v42)
  {
    sub_1A9099290(v33, v34 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider);
    *(void *)(v34 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v40;
    uint64_t v66 = v34;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    type metadata accessor for AccessTracker();
    uint64_t v44 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v44 + 24) = 0;
    *(void *)(v44 + 32) = 0;
    uint64_t v45 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v45 + 24) = 0;
    *(void *)(v45 + 32) = 0;
    v60(v44, v45);
    swift_release();
    swift_release();
    swift_task_localValuePop();
    swift_release();
LABEL_16:
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A91610B4(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v61 = a3;
  uint64_t v60 = a4;
  uint64_t v67 = a2;
  uint64_t v56 = a1;
  uint64_t v6 = sub_1A916AE70();
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v55 = (char **)((char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A916ACC0();
  uint64_t v12 = *(void **)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v53 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v62 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v63 = (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v53 - v20;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v53 - v23;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  uint64_t v65 = a5;
  uint64_t v66 = v21;
  uint64_t v54 = v18;
  uint64_t v64 = v10;
  sub_1A916BBA0();
  uint64_t v59 = v68;
  if (v68)
  {
    uint64_t v25 = (void (*)(char *, uint64_t, uint64_t))v12[2];
    uint64_t v26 = v11;
    v25(v24, v68 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v11);
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
    v27(v24, 0, 1, v11);
  }
  else
  {
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
    v27(v24, 1, 1, v11);
    uint64_t v26 = v11;
    uint64_t v25 = (void (*)(char *, uint64_t, uint64_t))v12[2];
  }
  uint64_t v28 = (uint64_t)v66;
  v25(v66, v67, v26);
  v27((char *)v28, 0, 1, v26);
  uint64_t v29 = v63;
  uint64_t v30 = v63 + *(int *)(v62 + 48);
  sub_1A9098CD0((uint64_t)v24, v63, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098CD0(v28, v30, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12[6];
  if (v31(v29, 1, v26) == 1)
  {
    sub_1A9098B50(v28, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
    int v32 = v31(v30, 1, v26);
    uint64_t v33 = (uint64_t)v64;
    if (v32 == 1)
    {
      sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
LABEL_15:
      type metadata accessor for AccessTracker();
      uint64_t v52 = swift_allocObject();
      swift_weakInit();
      swift_weakAssign();
      *(void *)(v52 + 24) = 0;
      *(void *)(v52 + 32) = 0;
      v60(v52);
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v34 = v12;
  uint64_t v35 = (uint64_t)v54;
  sub_1A9098CD0(v29, (uint64_t)v54, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v36 = v26;
  if (v31(v30, 1, v26) == 1)
  {
    sub_1A9098B50((uint64_t)v66, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
    ((void (*)(uint64_t, uint64_t))v34[1])(v35, v26);
    uint64_t v33 = (uint64_t)v64;
LABEL_11:
    sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098F30);
    goto LABEL_12;
  }
  char v47 = v34;
  uint64_t v48 = (void (*)(char *, uint64_t, uint64_t))v34[4];
  uint64_t v49 = v53;
  v48(v53, v30, v26);
  sub_1A90AD134();
  char v50 = sub_1A916AF50();
  uint64_t v51 = (void (*)(char *, uint64_t))v47[1];
  v51(v49, v36);
  sub_1A9098B50((uint64_t)v66, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
  v51((char *)v35, v36);
  sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v33 = (uint64_t)v64;
  if (v50) {
    goto LABEL_15;
  }
LABEL_12:
  sub_1A9098CD0(v67, v33, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37
           + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status) = 2;
  uint64_t v39 = v55;
  uint64_t v38 = v56;
  id v40 = *(void **)&v56[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v55 = v40;
  uint64_t v42 = v57;
  uint64_t v41 = v58;
  (*(void (**)(void *, void, uint64_t))(v57 + 104))(v39, *MEMORY[0x1E4FBCBF0], v58);
  id v43 = v38;
  id v44 = v40;
  LOBYTE(v40) = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v42 + 8))(v39, v41);
  if (v40)
  {
    sub_1A9099290(v33, v37 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider);
    *(void *)(v37 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v43;
    uint64_t v68 = v37;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    type metadata accessor for AccessTracker();
    uint64_t v46 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v46 + 24) = 0;
    *(void *)(v46 + 32) = 0;
    v60(v46);
    swift_release();
    swift_task_localValuePop();
LABEL_16:
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A9161848(char *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v54 = a4;
  uint64_t v56 = a5;
  uint64_t v57 = a2;
  uint64_t v53 = a3;
  uint64_t v49 = a1;
  uint64_t v5 = sub_1A916AE70();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v48 = (char **)((char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v47 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A916ACC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v45 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v46 = (uint64_t)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v45 - v19;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v45 - v22;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  uint64_t v55 = v15;
  sub_1A916BBA0();
  uint64_t v52 = v58;
  if (v58)
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v24(v23, v58 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v9);
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v25(v23, 0, 1, v9);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v25(v23, 1, 1, v9);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  }
  v24(v20, v57, v9);
  v25(v20, 0, 1, v9);
  uint64_t v26 = (uint64_t)v55;
  uint64_t v27 = (uint64_t)&v55[*(int *)(v13 + 48)];
  sub_1A9098CD0((uint64_t)v23, (uint64_t)v55, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098CD0((uint64_t)v20, v27, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v28(v26, 1, v9) == 1)
  {
    sub_1A9098B50((uint64_t)v20, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    int v29 = v28(v27, 1, v9);
    uint64_t v30 = v56;
    if (v29 == 1)
    {
      sub_1A9098B50(v26, (uint64_t (*)(void))sub_1A9098C34);
LABEL_15:
      v53(v30);
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v31 = v46;
  sub_1A9098CD0(v26, v46, (uint64_t (*)(void))sub_1A9098C34);
  if (v28(v27, 1, v9) == 1)
  {
    sub_1A9098B50((uint64_t)v20, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v31, v9);
    uint64_t v30 = v56;
LABEL_11:
    sub_1A9098B50(v26, (uint64_t (*)(void))sub_1A9098F30);
    goto LABEL_12;
  }
  uint64_t v42 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v45, v27, v9);
  sub_1A90AD134();
  char v43 = sub_1A916AF50();
  id v44 = *(void (**)(char *, uint64_t))(v10 + 8);
  v44(v42, v9);
  sub_1A9098B50((uint64_t)v20, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v23, (uint64_t (*)(void))sub_1A9098C34);
  v44((char *)v31, v9);
  sub_1A9098B50(v26, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v30 = v56;
  if (v43) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v32 = v47;
  sub_1A9098CD0(v57, v47, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33
           + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status) = 2;
  uint64_t v35 = v48;
  uint64_t v34 = v49;
  uint64_t v36 = *(void **)&v49[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v48 = v36;
  uint64_t v38 = v50;
  uint64_t v37 = v51;
  (*(void (**)(void *, void, uint64_t))(v50 + 104))(v35, *MEMORY[0x1E4FBCBF0], v51);
  id v39 = v34;
  id v40 = v36;
  LOBYTE(v36) = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v38 + 8))(v35, v37);
  if (v36)
  {
    sub_1A9099290(v32, v33 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider);
    *(void *)(v33 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v39;
    uint64_t v58 = v33;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    v53(v30);
    swift_task_localValuePop();
    swift_release();
LABEL_16:
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A9161F50(char *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v64 = a4;
  uint64_t v63 = a3;
  uint64_t v70 = a2;
  uint64_t v59 = a1;
  uint64_t v6 = sub_1A916AE70();
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v58 = (char **)((char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for DiagnosticsConsentProvider(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A916ACC0();
  uint64_t v12 = *(void **)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v56 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098F30();
  uint64_t v65 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v66 = (uint64_t)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9098C34(0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v56 - v20;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v56 - v23;
  if (qword_1EB687A08 != -1) {
    swift_once();
  }
  uint64_t v68 = a5;
  uint64_t v69 = v21;
  uint64_t v57 = v18;
  uint64_t v67 = v10;
  sub_1A916BBA0();
  uint64_t v62 = v71;
  if (v71)
  {
    uint64_t v25 = (void (*)(char *, uint64_t, uint64_t))v12[2];
    uint64_t v26 = v11;
    v25(v24, v71 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider, v11);
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
    v27(v24, 0, 1, v11);
  }
  else
  {
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12[7];
    v27(v24, 1, 1, v11);
    uint64_t v26 = v11;
    uint64_t v25 = (void (*)(char *, uint64_t, uint64_t))v12[2];
  }
  uint64_t v28 = (uint64_t)v69;
  v25(v69, v70, v26);
  v27((char *)v28, 0, 1, v26);
  uint64_t v29 = v66;
  uint64_t v30 = v66 + *(int *)(v65 + 48);
  sub_1A9098CD0((uint64_t)v24, v66, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098CD0(v28, v30, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12[6];
  if (v31(v29, 1, v26) == 1)
  {
    sub_1A9098B50(v28, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
    int v32 = v31(v30, 1, v26);
    uint64_t v34 = (uint64_t)v67;
    uint64_t v33 = v68;
    if (v32 == 1)
    {
      sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
LABEL_15:
      type metadata accessor for AccessSessionManager();
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = v33;
      type metadata accessor for AccessTracker();
      uint64_t v55 = swift_allocObject();
      swift_weakInit();
      swift_weakAssign();
      *(void *)(v55 + 24) = 0;
      *(void *)(v55 + 32) = 0;
      swift_retain();
      v63(v54, v55);
      swift_release();
      swift_release();
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v35 = v12;
  uint64_t v36 = (uint64_t)v57;
  sub_1A9098CD0(v29, (uint64_t)v57, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v37 = v26;
  if (v31(v30, 1, v26) == 1)
  {
    sub_1A9098B50((uint64_t)v69, (uint64_t (*)(void))sub_1A9098C34);
    sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
    ((void (*)(uint64_t, uint64_t))v35[1])(v36, v26);
    uint64_t v34 = (uint64_t)v67;
    uint64_t v33 = v68;
LABEL_11:
    sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098F30);
    goto LABEL_12;
  }
  uint64_t v49 = v35;
  uint64_t v50 = (void (*)(char *, uint64_t, uint64_t))v35[4];
  uint64_t v51 = v56;
  v50(v56, v30, v26);
  sub_1A90AD134();
  char v52 = sub_1A916AF50();
  uint64_t v53 = (void (*)(char *, uint64_t))v49[1];
  v53(v51, v37);
  sub_1A9098B50((uint64_t)v69, (uint64_t (*)(void))sub_1A9098C34);
  sub_1A9098B50((uint64_t)v24, (uint64_t (*)(void))sub_1A9098C34);
  v53((char *)v36, v37);
  sub_1A9098B50(v29, (uint64_t (*)(void))sub_1A9098C34);
  uint64_t v34 = (uint64_t)v67;
  uint64_t v33 = v68;
  if (v52) {
    goto LABEL_15;
  }
LABEL_12:
  sub_1A9098CD0(v70, v34, type metadata accessor for DiagnosticsConsentProvider);
  type metadata accessor for LazyDiagnosticStatus(0);
  uint64_t v38 = swift_allocObject();
  *(unsigned char *)(v38
           + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus____lazy_storage____status) = 2;
  id v40 = v58;
  id v39 = v59;
  uint64_t v41 = *(void **)&v59[OBJC_IVAR___AAAccessQueue_queue];
  *uint64_t v58 = v41;
  uint64_t v43 = v60;
  uint64_t v42 = v61;
  (*(void (**)(void *, void, uint64_t))(v60 + 104))(v40, *MEMORY[0x1E4FBCBF0], v61);
  id v44 = v39;
  id v45 = v41;
  LOBYTE(v41) = sub_1A916AE90();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v43 + 8))(v40, v42);
  if (v41)
  {
    sub_1A9099290(v34, v38 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_provider);
    *(void *)(v38 + OBJC_IVAR____TtC12AppAnalyticsP33_C30334460221130696DFAC9959A2A23920LazyDiagnosticStatus_queue) = v44;
    uint64_t v71 = v38;
    sub_1A90992F4(0);
    swift_retain();
    swift_task_localValuePush();
    type metadata accessor for AccessSessionManager();
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = v33;
    type metadata accessor for AccessTracker();
    uint64_t v48 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v48 + 24) = 0;
    *(void *)(v48 + 32) = 0;
    swift_retain();
    v63(v47, v48);
    swift_release();
    swift_release();
    swift_task_localValuePop();
    swift_release();
LABEL_16:
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t static DiagnosticsConsentProvider.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9162840((uint64_t)sub_1A90A80E4, a1);
}

BOOL static DiagnosticsConsentStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DiagnosticsConsentStatus.hash(into:)()
{
  return sub_1A916BAC0();
}

uint64_t DiagnosticsConsentStatus.hashValue.getter()
{
  return sub_1A916BAD0();
}

uint64_t DiagnosticsConsentProvider.status.getter()
{
  uint64_t v1 = type metadata accessor for DiagnosticsConsentProvider(0);
  return (*(uint64_t (**)(void))(v0 + *(int *)(v1 + 20)))();
}

uint64_t static DiagnosticsConsentProvider.allowed.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9162840((uint64_t)sub_1A90B96C4, a1);
}

uint64_t sub_1A9162840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A916ACB0();
  uint64_t result = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v5 = (void *)(a2 + *(int *)(result + 20));
  void *v5 = a1;
  v5[1] = 0;
  return result;
}

uint64_t static DiagnosticsConsentProvider.disallowed.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9162840((uint64_t)sub_1A90D6904, a1);
}

id static BridgedDiagnosticsConsentProvider.default.getter()
{
  return sub_1A9162A34((uint64_t)sub_1A90A80E4);
}

id sub_1A91628DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v5 = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916ACB0();
  uint64_t v9 = &v8[*(int *)(v6 + 28)];
  *(void *)uint64_t v9 = a3;
  *((void *)v9 + 1) = 0;
  id v10 = objc_allocWithZone(ObjCClassMetadata);
  sub_1A9098CD0((uint64_t)v8, (uint64_t)v10 + OBJC_IVAR___AADiagnosticsConsentProvider_provider, type metadata accessor for DiagnosticsConsentProvider);
  v13.receiver = v10;
  v13.super_class = ObjCClassMetadata;
  id v11 = objc_msgSendSuper2(&v13, sel_init);
  sub_1A9098B50((uint64_t)v8, type metadata accessor for DiagnosticsConsentProvider);

  return v11;
}

id static BridgedDiagnosticsConsentProvider.allowed.getter()
{
  return sub_1A9162A34((uint64_t)sub_1A90B96C4);
}

id static BridgedDiagnosticsConsentProvider.disallowed.getter()
{
  return sub_1A9162A34((uint64_t)sub_1A90D6904);
}

id sub_1A9162A34(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916ACB0();
  uint64_t v7 = &v6[*(int *)(v4 + 28)];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = 0;
  id v8 = objc_allocWithZone(v1);
  sub_1A9098CD0((uint64_t)v6, (uint64_t)v8 + OBJC_IVAR___AADiagnosticsConsentProvider_provider, type metadata accessor for DiagnosticsConsentProvider);
  v11.receiver = v8;
  v11.super_class = v1;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  sub_1A9098B50((uint64_t)v6, type metadata accessor for DiagnosticsConsentProvider);
  return v9;
}

id static BridgedDiagnosticsConsentProvider.custom(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  swift_retain();
  sub_1A916ACB0();
  id v10 = (uint64_t (**)@<X0>(BOOL *@<X8>))&v8[*(int *)(v6 + 28)];
  *id v10 = sub_1A9162F2C;
  v10[1] = (uint64_t (*)@<X0>(BOOL *@<X8>))v9;
  id v11 = objc_allocWithZone(v2);
  sub_1A9098CD0((uint64_t)v8, (uint64_t)v11 + OBJC_IVAR___AADiagnosticsConsentProvider_provider, type metadata accessor for DiagnosticsConsentProvider);
  v14.receiver = v11;
  v14.super_class = v2;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  sub_1A9098B50((uint64_t)v8, type metadata accessor for DiagnosticsConsentProvider);
  return v12;
}

id BridgedDiagnosticsConsentProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedDiagnosticsConsentProvider.init()()
{
}

id BridgedDiagnosticsConsentProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A9162EF4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1A9162F34()
{
  unint64_t result = qword_1E97B1CF0;
  if (!qword_1E97B1CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1CF0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DiagnosticsConsentStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9163054);
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

ValueMetadata *type metadata accessor for DiagnosticsConsentStatus()
{
  return &type metadata for DiagnosticsConsentStatus;
}

uint64_t *initializeBufferWithCopyOfBuffer for DiagnosticsConsentProvider(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1A916ACC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    id v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DiagnosticsConsentProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916ACC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DiagnosticsConsentProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916ACC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DiagnosticsConsentProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916ACC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiagnosticsConsentProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A916330C);
}

uint64_t sub_1A916330C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916ACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DiagnosticsConsentProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A91633E0);
}

uint64_t sub_1A91633E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A916ACC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1A916349C()
{
  return type metadata accessor for LazyDiagnosticStatus(0);
}

uint64_t sub_1A91634A4()
{
  return type metadata accessor for BridgedDiagnosticsConsentProvider(0);
}

uint64_t type metadata accessor for BridgedDiagnosticsConsentProvider(uint64_t a1)
{
  return sub_1A9098ED8(a1, (uint64_t *)&unk_1E97B1CF8);
}

uint64_t sub_1A91634CC()
{
  uint64_t result = type metadata accessor for DiagnosticsConsentProvider(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for BridgedDiagnosticsConsentProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedDiagnosticsConsentProvider);
}

uint64_t sub_1A9163574()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A91635AC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1A91635D0@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = (result & 1) == 0;
  return result;
}

uint64_t sub_1A9163608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9163900(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A9163634(uint64_t a1)
{
  unint64_t v2 = sub_1A90A90F8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9163670(uint64_t a1)
{
  unint64_t v2 = sub_1A90A90F8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A91636AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1A916B9E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A916373C(uint64_t a1)
{
  unint64_t v2 = sub_1A90A8C04();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9163778(uint64_t a1)
{
  unint64_t v2 = sub_1A90A8C04();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A91637B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7463697274736572 && a2 == 0xEE006C6F6F426465)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1A916B9E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1A9163870(uint64_t a1)
{
  unint64_t v2 = sub_1A90A9220();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A91638AC(uint64_t a1)
{
  unint64_t v2 = sub_1A90A9220();

  return MEMORY[0x1F41862B0](a1, v2);
}

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile()
{
  return &type metadata for EffectiveUserSettingsFile;
}

uint64_t sub_1A9163900(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x80000001A917B2A0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile.CodingKeys()
{
  return &type metadata for EffectiveUserSettingsFile.CodingKeys;
}

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile.RestrictedBools()
{
  return &type metadata for EffectiveUserSettingsFile.RestrictedBools;
}

unint64_t sub_1A91639AC()
{
  unint64_t result = qword_1E97B1D08;
  if (!qword_1E97B1D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D08);
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile.RestrictedBools.CodingKeys()
{
  return &type metadata for EffectiveUserSettingsFile.RestrictedBools.CodingKeys;
}

uint64_t _s12AppAnalytics25EffectiveUserSettingsFileV8ValueBoxVwet_0(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s12AppAnalytics25EffectiveUserSettingsFileV8ValueBoxVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9163B7CLL);
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

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile.ValueBox()
{
  return &type metadata for EffectiveUserSettingsFile.ValueBox;
}

unint64_t sub_1A9163BB8()
{
  unint64_t result = qword_1E97B1D10;
  if (!qword_1E97B1D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D10);
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectiveUserSettingsFile.ValueBox.CodingKeys()
{
  return &type metadata for EffectiveUserSettingsFile.ValueBox.CodingKeys;
}

unint64_t sub_1A9163C48()
{
  unint64_t result = qword_1E97B1D18;
  if (!qword_1E97B1D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D18);
  }
  return result;
}

ValueMetadata *type metadata accessor for BridgedDataEvent()
{
  return &type metadata for BridgedDataEvent;
}

void *sub_1A9163CB0(int a1, id a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(a2, sel_toDict);
  uint64_t v3 = sub_1A916AED0();

  uint64_t v38 = v3 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v3 + 64);
  int64_t v39 = (unint64_t)(v4 + 63) >> 6;
  int64_t v40 = 0;
  BOOL v7 = (void *)MEMORY[0x1E4FBC868];
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v40 << 6);
LABEL_8:
      uint64_t v11 = *(void *)(v3 + 56);
      uint64_t v12 = (void *)(*(void *)(v3 + 48) + 16 * v10);
      uint64_t v13 = v12[1];
      *(void *)&long long v42 = *v12;
      *((void *)&v42 + 1) = v13;
      sub_1A90A24B0(v11 + 32 * v10, (uint64_t)v43);
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    int64_t v14 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      goto LABEL_47;
    }
    if (v14 < v39)
    {
      unint64_t v15 = *(void *)(v38 + 8 * v14);
      if (v15) {
        goto LABEL_12;
      }
      int64_t v16 = v40 + 2;
      ++v40;
      if (v14 + 1 < v39)
      {
        unint64_t v15 = *(void *)(v38 + 8 * v16);
        if (v15) {
          goto LABEL_15;
        }
        int64_t v40 = v14 + 1;
        if (v14 + 2 < v39)
        {
          unint64_t v15 = *(void *)(v38 + 8 * (v14 + 2));
          if (v15)
          {
            v14 += 2;
            goto LABEL_12;
          }
          int64_t v16 = v14 + 3;
          int64_t v40 = v14 + 2;
          if (v14 + 3 < v39)
          {
            unint64_t v15 = *(void *)(v38 + 8 * v16);
            if (v15)
            {
LABEL_15:
              int64_t v14 = v16;
LABEL_12:
              unint64_t v6 = (v15 - 1) & v15;
              unint64_t v10 = __clz(__rbit64(v15)) + (v14 << 6);
              int64_t v40 = v14;
              goto LABEL_8;
            }
            while (1)
            {
              int64_t v14 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_48;
              }
              if (v14 >= v39) {
                break;
              }
              unint64_t v15 = *(void *)(v38 + 8 * v14);
              ++v16;
              if (v15) {
                goto LABEL_12;
              }
            }
            int64_t v40 = v39 - 1;
          }
        }
      }
    }
    unint64_t v6 = 0;
    memset(v43, 0, sizeof(v43));
    long long v42 = 0u;
LABEL_27:
    sub_1A9164328((uint64_t)&v42, (uint64_t)&v44);
    uint64_t v17 = v45;
    if (!v45)
    {
      swift_release();
      return v7;
    }
    uint64_t v18 = v44;
    sub_1A90A1A68(&v46, &v42);
    sub_1A916438C();
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1A90C3D34();
      swift_allocError();
      void *v35 = 2;
      swift_willThrow();
      swift_release();
      return v7;
    }
    id v19 = v41[0];
    v41[0] = 0;
    id v20 = objc_msgSend(v19, sel_toJsonValueAndReturnError_, v41);
    id v21 = v41[0];
    if (!v20)
    {
      uint64_t v36 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1A916A990();

      swift_willThrow();
      swift_release();
      swift_unknownObjectRelease();
      return v7;
    }
    sub_1A916B5F0();
    swift_unknownObjectRelease();
    sub_1A90A1A68(&v42, v41);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = sub_1A90A1D98(v18, v17);
    uint64_t v25 = v7[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
    }
    char v28 = v23;
    if (v7[3] < v27) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v23) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_1A90BF480();
      if (v28)
      {
LABEL_4:
        int v8 = (_OWORD *)(v7[7] + 32 * v24);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
        sub_1A90A1A68(v41, v8);
        goto LABEL_5;
      }
    }
LABEL_37:
    v7[(v24 >> 6) + 8] |= 1 << v24;
    uint64_t v31 = (uint64_t *)(v7[6] + 16 * v24);
    *uint64_t v31 = v18;
    v31[1] = v17;
    sub_1A90A1A68(v41, (_OWORD *)(v7[7] + 32 * v24));
    uint64_t v32 = v7[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_46;
    }
    v7[2] = v34;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1A90A1740(v27, isUniquelyReferenced_nonNull_native);
  unint64_t v29 = sub_1A90A1D98(v18, v17);
  if ((v28 & 1) == (v30 & 1))
  {
    unint64_t v24 = v29;
    if (v28) {
      goto LABEL_4;
    }
    goto LABEL_37;
  }
  unint64_t result = (void *)sub_1A916BA50();
  __break(1u);
  return result;
}

void *sub_1A9164188(int a1)
{
  return sub_1A9163CB0(a1, *v1);
}

uint64_t sub_1A91641A4(uint64_t a1)
{
  sub_1A90C3D34();
  swift_allocError();
  *id v2 = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_1A9164200()
{
  sub_1A90C3D34();
  swift_allocError();
  void *v0 = 1;
  return swift_willThrow();
}

unint64_t sub_1A9164250(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A9164280();
  unint64_t result = sub_1A91642D4();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A9164280()
{
  unint64_t result = qword_1EB687B00;
  if (!qword_1EB687B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687B00);
  }
  return result;
}

unint64_t sub_1A91642D4()
{
  unint64_t result = qword_1EB687AF8;
  if (!qword_1EB687AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB687AF8);
  }
  return result;
}

uint64_t sub_1A9164328(uint64_t a1, uint64_t a2)
{
  sub_1A90C0CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A916438C()
{
  unint64_t result = qword_1EB6880C8[0];
  if (!qword_1EB6880C8[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EB6880C8);
  }
  return result;
}

id sub_1A91643E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 16))();
  uint64_t v6 = v5;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  uint64_t v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  uint64_t v13 = v12;
  int64_t v14 = (objc_class *)type metadata accessor for BridgedProcessEvent();
  unint64_t v15 = (char *)objc_allocWithZone(v14);
  int64_t v16 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_name];
  *int64_t v16 = v4;
  v16[1] = v6;
  uint64_t v17 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_version];
  *uint64_t v17 = v7;
  v17[1] = v9;
  *(void *)&v15[OBJC_IVAR___AAProcessEvent_json] = v10;
  uint64_t v18 = (uint64_t *)&v15[OBJC_IVAR___AAProcessEvent_groupName];
  uint64_t *v18 = v11;
  v18[1] = v13;
  v20.receiver = v15;
  v20.super_class = v14;
  return objc_msgSendSuper2(&v20, sel_init);
}

double ProcessEvent.init(name:json:nonJitteredEventTimestamp:groupName:groupContentType:userInfo:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = a1;
  a9[1] = a2;
  a9[3] = 0x302E312E30;
  a9[4] = 0xE500000000000000;
  a9[2] = a3;
  int64_t v16 = (int *)type metadata accessor for ProcessEvent();
  uint64_t v17 = (char *)a9 + v16[11];
  uint64_t v18 = sub_1A916AC90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v17, a4, v18);
  id v19 = (void *)((char *)a9 + v16[12]);
  *id v19 = a5;
  v19[1] = a6;
  objc_super v20 = (char *)a9 + v16[13];
  *(void *)objc_super v20 = a7;
  v20[8] = a8 & 1;
  sub_1A909374C(a10, (uint64_t)a9 + v16[14]);
  *(void *)&double result = 5;
  *(_OWORD *)((char *)a9 + v16[15]) = xmmword_1A9170040;
  return result;
}

unint64_t ProcessEventType.payload()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A916AC90();
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  MEMORY[0x1F4188790](v5);
  char v28 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9164A30(0, &qword_1EB6894C0, (unint64_t *)&qword_1EB688C08);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 1635017060;
  *(_OWORD *)(inited + 16) = xmmword_1A916E210;
  *(void *)(inited + 40) = 0xE400000000000000;
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 32);
  uint64_t v29 = a1;
  uint64_t v9 = (void *)v8(a1, a2);
  uint64_t v10 = JSON.payload()();
  uint64_t v32 = v2;
  if (v2)
  {

    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_1A9164A88(0, (unint64_t *)&qword_1EB688C08);
    return swift_arrayDestroy();
  }
  uint64_t v12 = v10;

  sub_1A90A1B30(0, (unint64_t *)&qword_1EB6897D0);
  *(void *)(inited + 48) = v12;
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 80) = 0x617461646174656DLL;
  *(void *)(inited + 88) = 0xE800000000000000;
  sub_1A9164A30(0, &qword_1EB688C48, &qword_1EB688C00);
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_1A916E200;
  *(void *)(v14 + 32) = 1701667182;
  *(void *)(v14 + 40) = 0xE400000000000000;
  uint64_t v15 = v29;
  *(void *)(v14 + 48) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(v29, a2);
  *(void *)(v14 + 56) = v16;
  *(void *)(v14 + 64) = 0x6E6F6973726576;
  *(void *)(v14 + 72) = 0xE700000000000000;
  *(void *)(v14 + 80) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(v15, a2);
  *(void *)(v14 + 88) = v17;
  unint64_t v18 = sub_1A90B22E4(v14);
  sub_1A90A1B30(0, (unint64_t *)&qword_1EB689460);
  *(void *)(inited + 96) = v18;
  *(void *)(inited + 120) = v19;
  *(void *)(inited + 128) = 0x4D65746176697270;
  *(void *)(inited + 136) = 0xEF61746164617465;
  sub_1A9164A30(0, &qword_1EB687710, &qword_1EB687700);
  uint64_t v20 = swift_initStackObject();
  *(_OWORD *)(v20 + 16) = xmmword_1A916EF60;
  *(void *)(v20 + 32) = 0xD000000000000019;
  *(void *)(v20 + 40) = 0x80000001A917A170;
  id v21 = v28;
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(v15, a2);
  sub_1A916AC50();
  double v23 = v22;
  unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v21, v31);
  double v24 = v23 * 1000.0;
  if ((~COERCE__INT64(v23 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v24 < 9.22337204e18)
  {
    *(void *)(v20 + 48) = (uint64_t)v24;
    unint64_t v25 = sub_1A90B2428(v20);
    sub_1A90A1B30(0, &qword_1EB6876F8);
    *(void *)(inited + 168) = v26;
    *(void *)(inited + 144) = v25;
    return sub_1A90B2180(inited);
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_1A9164A30(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1A9164A88(255, a3);
    unint64_t v4 = sub_1A916B9A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1A9164A88(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t ProcessEvent.name.getter()
{
  uint64_t v0 = sub_1A9164F9C();
  swift_bridgeObjectRetain();
  return v0;
}

id ProcessEvent.json.getter()
{
  uint64_t v0 = (void *)sub_1A9164FAC();

  return v0;
}

uint64_t ProcessEvent.version.getter()
{
  uint64_t v0 = sub_1A9164FA4();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ProcessEvent.nonJitteredEventTimestamp.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 44);
  uint64_t v5 = sub_1A916AC90();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t ProcessEvent.groupName.getter(uint64_t a1)
{
  uint64_t v1 = sub_1A9164FB4(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProcessEvent.groupContentType.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 52));
}

uint64_t ProcessEvent.userInfo.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A909F130(v2 + *(int *)(a1 + 56), a2);
}

__n128 ProcessEvent.timestampConfiguration.getter@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *(__n128 *)(v2 + *(int *)(a1 + 60));
  *a2 = result;
  return result;
}

double ProcessEvent.init(name:json:groupName:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[3] = 0x302E312E30;
  a6[4] = 0xE500000000000000;
  a6[2] = a3;
  uint64_t v9 = (int *)type metadata accessor for ProcessEvent();
  sub_1A916AC80();
  uint64_t v10 = (void *)((char *)a6 + v9[12]);
  *uint64_t v10 = a4;
  v10[1] = a5;
  uint64_t v11 = (char *)a6 + v9[13];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (_OWORD *)((char *)a6 + v9[14]);
  *uint64_t v12 = 0u;
  v12[1] = 0u;
  *(void *)&double result = 5;
  *(_OWORD *)((char *)a6 + v9[15]) = xmmword_1A9170040;
  return result;
}

double ProcessEvent.init(name:json:groupName:groupContentType:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[3] = 0x302E312E30;
  a8[4] = 0xE500000000000000;
  a8[2] = a3;
  uint64_t v13 = (int *)type metadata accessor for ProcessEvent();
  sub_1A916AC80();
  uint64_t v14 = (void *)((char *)a8 + v13[12]);
  *uint64_t v14 = a4;
  v14[1] = a5;
  uint64_t v15 = (char *)a8 + v13[13];
  *(void *)uint64_t v15 = a6;
  v15[8] = a7 & 1;
  uint64_t v16 = (_OWORD *)((char *)a8 + v13[14]);
  *uint64_t v16 = 0u;
  v16[1] = 0u;
  *(void *)&double result = 5;
  *(_OWORD *)((char *)a8 + v13[15]) = xmmword_1A9170040;
  return result;
}

double ProcessEvent.init(name:json:groupName:groupContentType:userInfo:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = a1;
  a9[1] = a2;
  a9[3] = 0x302E312E30;
  a9[4] = 0xE500000000000000;
  a9[2] = a3;
  uint64_t v15 = (int *)type metadata accessor for ProcessEvent();
  sub_1A916AC80();
  uint64_t v16 = (void *)((char *)a9 + v15[12]);
  *uint64_t v16 = a4;
  v16[1] = a5;
  uint64_t v17 = (char *)a9 + v15[13];
  *(void *)uint64_t v17 = a6;
  v17[8] = a7 & 1;
  sub_1A909374C(a8, (uint64_t)a9 + v15[14]);
  *(void *)&double result = 5;
  *(_OWORD *)((char *)a9 + v15[15]) = xmmword_1A9170040;
  return result;
}

uint64_t sub_1A9164E88()
{
  uint64_t v0 = sub_1A9164F9C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1A9164EC0()
{
  uint64_t v0 = sub_1A9164FA4();
  swift_bridgeObjectRetain();
  return v0;
}

id sub_1A9164EF8()
{
  uint64_t v0 = (void *)sub_1A9164FAC();

  return v0;
}

uint64_t sub_1A9164F24(uint64_t a1)
{
  uint64_t v1 = sub_1A9164FB4(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A9164F5C(uint64_t a1)
{
  return ProcessEvent.groupContentType.getter(a1);
}

unint64_t sub_1A9164F7C(uint64_t a1)
{
  return ProcessEventType.payload()(a1, (uint64_t)&protocol witness table for ProcessEvent<A>);
}

uint64_t sub_1A9164F9C()
{
  return *(void *)v0;
}

uint64_t sub_1A9164FA4()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_1A9164FAC()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1A9164FB4(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 48));
}

uint64_t dispatch thunk of ProcessEventType.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ProcessEventType.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ProcessEventType.json.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ProcessEventType.nonJitteredEventTimestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ProcessEventType.groupName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ProcessEventType.groupContentType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ProcessEventType.timestampConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t *sub_1A9165070(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v9 = (void *)a2[2];
    uint64_t v8 = a2[3];
    a1[2] = (uint64_t)v9;
    a1[3] = v8;
    uint64_t v10 = a3[11];
    uint64_t v29 = (char *)a1 + v10;
    uint64_t v11 = (char *)a2 + v10;
    a1[4] = a2[4];
    uint64_t v12 = sub_1A916AC90();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    id v14 = v9;
    swift_bridgeObjectRetain();
    v13(v29, v11, v12);
    uint64_t v15 = a3[12];
    uint64_t v16 = a3[13];
    uint64_t v17 = (uint64_t *)((char *)v4 + v15);
    unint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)v4 + v16;
    id v21 = (char *)a2 + v16;
    v20[8] = v21[8];
    *(void *)uint64_t v20 = *(void *)v21;
    uint64_t v22 = a3[14];
    double v23 = (char *)v4 + v22;
    double v24 = (_OWORD *)((char *)a2 + v22);
    uint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 24);
    swift_bridgeObjectRetain();
    if (v25)
    {
      *((void *)v23 + 3) = v25;
      (**(void (***)(char *, _OWORD *, uint64_t))(v25 - 8))(v23, v24, v25);
    }
    else
    {
      long long v27 = v24[1];
      *(_OWORD *)double v23 = *v24;
      *((_OWORD *)v23 + 1) = v27;
    }
    *(_OWORD *)((char *)v4 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  }
  return v4;
}

void *sub_1A9165224(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v8 = (void *)a2[2];
  uint64_t v7 = a2[3];
  a1[2] = v8;
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v9 = a3[11];
  long long v27 = (char *)a1 + v9;
  uint64_t v10 = (char *)a2 + v9;
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  id v13 = v8;
  swift_bridgeObjectRetain();
  v12(v27, v10, v11);
  uint64_t v14 = a3[12];
  uint64_t v15 = a3[13];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (char *)a1 + v15;
  uint64_t v20 = (char *)a2 + v15;
  v19[8] = v20[8];
  *(void *)uint64_t v19 = *(void *)v20;
  uint64_t v21 = a3[14];
  uint64_t v22 = (char *)a1 + v21;
  double v23 = (_OWORD *)((char *)a2 + v21);
  uint64_t v24 = *(void *)((char *)a2 + v21 + 24);
  swift_bridgeObjectRetain();
  if (v24)
  {
    *((void *)v22 + 3) = v24;
    (**(void (***)(char *, _OWORD *, uint64_t))(v24 - 8))(v22, v23, v24);
  }
  else
  {
    long long v25 = v23[1];
    *(_OWORD *)uint64_t v22 = *v23;
    *((_OWORD *)v22 + 1) = v25;
  }
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

void *sub_1A9165388(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[11];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[12];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[13];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)v18;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = v19;
  uint64_t v20 = a3[14];
  uint64_t v21 = (uint64_t)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)((char *)a2 + v20 + 24);
  if (!*(void *)((char *)a1 + v20 + 24))
  {
    if (v23)
    {
      *(void *)(v21 + 24) = v23;
      (**(void (***)(uint64_t, char *))(v23 - 8))(v21, v22);
      goto LABEL_8;
    }
LABEL_7:
    long long v24 = *((_OWORD *)v22 + 1);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    *(_OWORD *)(v21 + 16) = v24;
    goto LABEL_8;
  }
  if (!v23)
  {
    __swift_destroy_boxed_opaque_existential_0(v21);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)v21, (uint64_t *)v22);
LABEL_8:
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t sub_1A916552C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[11];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1A916AC90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v11 = *(void *)v12;
  uint64_t v13 = a3[14];
  uint64_t v14 = a3[15];
  uint64_t v15 = (_OWORD *)(a1 + v13);
  uint64_t v16 = (_OWORD *)(a2 + v13);
  long long v17 = v16[1];
  _OWORD *v15 = *v16;
  v15[1] = v17;
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  return a1;
}

void *sub_1A9165608(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v8 = a2[4];
  a1[3] = a2[3];
  a1[4] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[11];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1A916AC90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[12];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[13];
  uint64_t v19 = a3[14];
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)a2 + v18;
  v20[8] = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  uint64_t v22 = (_OWORD *)((char *)a1 + v19);
  if (*(void *)((char *)a1 + v19 + 24)) {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + v19);
  }
  long long v23 = *(_OWORD *)((char *)a2 + v19 + 16);
  *uint64_t v22 = *(_OWORD *)((char *)a2 + v19);
  v22[1] = v23;
  *(_OWORD *)((char *)a1 + a3[15]) = *(_OWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t sub_1A9165720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9165734);
}

uint64_t sub_1A9165734(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1A916AC90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1A91657E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A91657F8);
}

uint64_t sub_1A91657F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1A916AC90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1A91658A0(uint64_t a1, uint64_t a2)
{
  if (a1 >= 1)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C28]), sel_initWithInteger_, a2);
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
    objc_msgSend(v4, sel_setNumberStyle_, 1);
    objc_msgSend(v4, sel_setUsesSignificantDigits_, 1);
    objc_msgSend(v4, sel_setMaximumSignificantDigits_, a1);
    id v5 = objc_msgSend(v4, sel_stringFromNumber_, v3);
    if (!v5)
    {

      return;
    }
    uint64_t v6 = v5;
    uint64_t v7 = sub_1A916AF90();
    unint64_t v9 = v8;

    uint64_t v10 = HIBYTE(v9) & 0xF;
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
    if ((v9 & 0x2000000000000000) != 0) {
      uint64_t v12 = HIBYTE(v9) & 0xF;
    }
    else {
      uint64_t v12 = v7 & 0xFFFFFFFFFFFFLL;
    }
    if (!v12)
    {

      swift_bridgeObjectRelease();
      return;
    }
    if ((v9 & 0x1000000000000000) != 0)
    {
      sub_1A9134F08(v7, v9, 10);
    }
    else
    {
      if ((v9 & 0x2000000000000000) != 0)
      {
        v29[0] = v7;
        v29[1] = v9 & 0xFFFFFFFFFFFFFFLL;
        if (v7 == 43)
        {
          if (v10)
          {
            if (v10 != 1
              && (BYTE1(v7) - 48) <= 9u
              && v10 != 2
              && (BYTE2(v7) - 48) <= 9u)
            {
              uint64_t v14 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
              uint64_t v15 = v10 - 3;
              if (v15)
              {
                uint64_t v16 = (unsigned __int8 *)v29 + 3;
                do
                {
                  unsigned int v17 = *v16 - 48;
                  if (v17 > 9) {
                    break;
                  }
                  uint64_t v18 = 10 * v14;
                  if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
                    break;
                  }
                  uint64_t v14 = v18 + v17;
                  if (__OFADD__(v18, v17)) {
                    break;
                  }
                  ++v16;
                  --v15;
                }
                while (v15);
              }
            }
            goto LABEL_46;
          }
        }
        else
        {
          if (v7 != 45)
          {
            if (v10)
            {
              if ((v7 - 48) <= 9u && v10 != 1 && (BYTE1(v7) - 48) <= 9u)
              {
                uint64_t v19 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
                uint64_t v20 = v10 - 2;
                if (v20)
                {
                  uint64_t v21 = (unsigned __int8 *)v29 + 2;
                  do
                  {
                    unsigned int v22 = *v21 - 48;
                    if (v22 > 9) {
                      break;
                    }
                    uint64_t v23 = 10 * v19;
                    if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
                      break;
                    }
                    uint64_t v19 = v23 + v22;
                    if (__OFADD__(v23, v22)) {
                      break;
                    }
                    ++v21;
                    --v20;
                  }
                  while (v20);
                }
              }
            }
            goto LABEL_46;
          }
          if (v10)
          {
            if (v10 != 1
              && (BYTE1(v7) - 48) <= 9u
              && v10 != 2
              && (BYTE2(v7) - 48) <= 9u)
            {
              uint64_t v24 = -10 * (BYTE1(v7) - 48) - (BYTE2(v7) - 48);
              uint64_t v25 = v10 - 3;
              if (v25)
              {
                uint64_t v26 = (unsigned __int8 *)v29 + 3;
                do
                {
                  unsigned int v27 = *v26 - 48;
                  if (v27 > 9) {
                    break;
                  }
                  uint64_t v28 = 10 * v24;
                  if ((unsigned __int128)(v24 * (__int128)10) >> 64 != (10 * v24) >> 63) {
                    break;
                  }
                  uint64_t v24 = v28 - v27;
                  if (__OFSUB__(v28, v27)) {
                    break;
                  }
                  ++v26;
                  --v25;
                }
                while (v25);
              }
            }
            goto LABEL_46;
          }
          __break(1u);
        }
        __break(1u);
        return;
      }
      if ((v7 & 0x1000000000000000) != 0) {
        uint64_t v13 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v13 = (unsigned __int8 *)sub_1A916B6D0();
      }
      sub_1A9134EF0(v13, v11, 10);
    }
LABEL_46:

    swift_bridgeObjectRelease();
  }
}

id sub_1A9165C48()
{
  uint64_t v0 = (objc_class *)type metadata accessor for BridgedPrivacyValidation();
  uint64_t v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___AAPrivacyValidation_enabled] = 0;
  *(void *)&v1[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = MEMORY[0x1E4FBC870];
  v3.receiver = v1;
  v3.super_class = v0;
  id result = objc_msgSendSuper2(&v3, sel_init);
  qword_1EB686F80 = (uint64_t)result;
  return result;
}

id BridgedPrivacyValidation.__allocating_init(enabled:denylistDescriptors:)(char a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(void *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id static BridgedPrivacyValidation.default.getter()
{
  if (qword_1EB686F50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB686F80;

  return v0;
}

uint64_t BridgedPrivacyValidation.enabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___AAPrivacyValidation_enabled);
}

uint64_t BridgedPrivacyValidation.denylistDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

id BridgedPrivacyValidation.init(enabled:denylistDescriptors:)(char a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v2[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(void *)&v2[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.with(enabled:)(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___AAPrivacyValidation_denylistDescriptors);
  id v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = a1;
  *(void *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v4;
  v7.receiver = v5;
  v7.super_class = ObjectType;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.with(denylistDescriptors:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR___AAPrivacyValidation_enabled);
  id v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___AAPrivacyValidation_enabled] = v4;
  *(void *)&v5[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = a1;
  v7.receiver = v5;
  v7.super_class = ObjectType;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v7, sel_init);
}

id BridgedPrivacyValidation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BridgedPrivacyValidation.init()()
{
}

id BridgedPrivacyValidation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BridgedPrivacyValidation()
{
  return self;
}

uint64_t method lookup function for BridgedPrivacyValidation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedPrivacyValidation);
}

uint64_t dispatch thunk of BridgedPrivacyValidation.__allocating_init(enabled:denylistDescriptors:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_1A9166230(unsigned char *a1@<X8>)
{
}

void static SummarizedEventType.trackingKind.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1A9166250()
{
  return 0;
}

uint64_t static SummarizedEventType.roundOffFigures.getter()
{
  return 0;
}

uint64_t static SummarizedEventType.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t dispatch thunk of static SummarizedEventType.trackingKind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SummarizedEventType.roundOffFigures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static SummarizedEventType.requiresDiagnosticsConsent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t *sub_1A91662A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1A916AC90();
    unint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_1A916638C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A9166424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A91664BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A9166554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_1A91665EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9166600);
}

uint64_t sub_1A9166600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916AC90();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1A916666C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9166680);
}

uint64_t sub_1A9166680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A916AC90();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SummaryEventMetaData()
{
  uint64_t result = qword_1EB6877D0;
  if (!qword_1EB6877D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A916673C()
{
  uint64_t result = sub_1A916AC90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A91667C8(void *a1)
{
  sub_1A9166FE8(0, &qword_1E97B1D40, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9166ED4();
  sub_1A916BB50();
  v9[15] = 0;
  sub_1A916AC90();
  sub_1A916704C(qword_1EB689120, MEMORY[0x1E4F27928]);
  sub_1A916B960();
  if (!v1)
  {
    type metadata accessor for SummaryEventMetaData();
    v9[14] = 1;
    sub_1A916B960();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1A916699C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = sub_1A916AC90();
  uint64_t v26 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  unsigned int v27 = (char *)&v21 - v7;
  sub_1A9166FE8(0, &qword_1E97B1D30, MEMORY[0x1E4FBBDC0]);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  uint64_t v29 = v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = type metadata accessor for SummaryEventMetaData();
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9166ED4();
  sub_1A916BB20();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v22 = v12;
  uint64_t v23 = v5;
  uint64_t v24 = v14;
  uint64_t v15 = v26;
  char v32 = 0;
  sub_1A916704C(&qword_1EB686D38, MEMORY[0x1E4F27928]);
  uint64_t v16 = v27;
  uint64_t v17 = v28;
  sub_1A916B8E0();
  unsigned int v27 = *(char **)(v15 + 32);
  ((void (*)(char *, char *, uint64_t))v27)(v24, v16, v30);
  char v31 = 1;
  uint64_t v18 = v23;
  sub_1A916B8E0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v27)(&v24[*(int *)(v22 + 20)], v18, v30);
  sub_1A9166F28(v19, v25);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1A9166F8C(v19);
}

uint64_t sub_1A9166D48()
{
  if (*v0) {
    return 0x6465646E65;
  }
  else {
    return 0x64657472617473;
  }
}

uint64_t sub_1A9166D80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A91672A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9166DA8(uint64_t a1)
{
  unint64_t v2 = sub_1A9166ED4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9166DE4(uint64_t a1)
{
  unint64_t v2 = sub_1A9166ED4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9166E20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A916699C(a1, a2);
}

uint64_t sub_1A9166E38(void *a1)
{
  return sub_1A91667C8(a1);
}

uint64_t sub_1A9166E50(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A916704C(&qword_1E97B1B40, (void (*)(uint64_t))type metadata accessor for SummaryEventMetaData);
  uint64_t result = sub_1A916704C(&qword_1E97B1778, (void (*)(uint64_t))type metadata accessor for SummaryEventMetaData);
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A9166ED4()
{
  unint64_t result = qword_1E97B1D38;
  if (!qword_1E97B1D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D38);
  }
  return result;
}

uint64_t sub_1A9166F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9166F8C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SummaryEventMetaData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A9166FE8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A9166ED4();
    unint64_t v7 = a3(a1, &type metadata for SummaryEventMetaData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1A916704C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for SummaryEventMetaData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9167160);
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

ValueMetadata *type metadata accessor for SummaryEventMetaData.CodingKeys()
{
  return &type metadata for SummaryEventMetaData.CodingKeys;
}

unint64_t sub_1A916719C()
{
  unint64_t result = qword_1E97B1D48;
  if (!qword_1E97B1D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D48);
  }
  return result;
}

unint64_t sub_1A91671F4()
{
  unint64_t result = qword_1E97B1D50;
  if (!qword_1E97B1D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D50);
  }
  return result;
}

unint64_t sub_1A916724C()
{
  unint64_t result = qword_1E97B1D58;
  if (!qword_1E97B1D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97B1D58);
  }
  return result;
}

uint64_t sub_1A91672A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64657472617473 && a2 == 0xE700000000000000;
  if (v2 || (sub_1A916B9E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646E65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A916B9E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DataEventFormatter(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DataEventFormatter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataEventFormatter()
{
  return &type metadata for DataEventFormatter;
}

uint64_t sub_1A9167438(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1A9167444()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 32);
  swift_retain();
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(void *)(v0 + 40);
  BOOL v4 = *(os_unfair_lock_s **)(v2 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  swift_release();
  if (!v3)
  {
    if (objc_msgSend(self, sel_isMainThread))
    {
      uint64_t v5 = (*(uint64_t (**)(void))(v1 + 16))();
    }
    else
    {
      sub_1A90A601C();
      char v6 = (void *)sub_1A916B440();
      MEMORY[0x1F4188790](v6);
      sub_1A90F5758();
      sub_1A916B450();

      uint64_t v5 = v9;
    }
    swift_retain();
    os_unfair_lock_lock_with_options();
    if (*(void *)(v1 + 40))
    {
      uint64_t v3 = *(void *)(v1 + 40);
    }
    else
    {
      *(void *)(v1 + 40) = v5;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      uint64_t v3 = v5;
    }
    unint64_t v7 = *(os_unfair_lock_s **)(v2 + 16);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v7);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v3;
}

void *LazyEventProcessor.__allocating_init(underlyingProcessorProvider:)(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (void *)swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  char v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *char v6 = 0;
  *(_DWORD *)(v5 + 24) = 0x10000;
  v4[4] = v5;
  v4[5] = 0;
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

void *LazyEventProcessor.init(underlyingProcessorProvider:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  char v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *char v6 = 0;
  *(_DWORD *)(v5 + 24) = 0x10000;
  v2[4] = v5;
  v2[5] = 0;
  v2[2] = a1;
  v2[3] = a2;
  return v2;
}

Swift::Void __swiftcall LazyEventProcessor.resolve()()
{
  sub_1A9167444();

  swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LazyEventProcessor.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t LazyEventProcessor.process<A>(processEvent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A9167444();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = (uint64_t *)(v6 + 40);
    do
    {
      uint64_t v9 = *v8;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, ObjectType, v9);
      v8 += 2;
      --v7;
    }
    while (v7);
  }

  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didEnterGroup(_:)(uint64_t a1)
{
  uint64_t v2 = sub_1A9167444();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    BOOL v4 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *v4;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didLeaveGroup(_:)(uint64_t a1)
{
  uint64_t v2 = sub_1A9167444();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    BOOL v4 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *v4;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didStartSession(_:)(uint64_t a1)
{
  uint64_t v2 = sub_1A9167444();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    BOOL v4 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *v4;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didUpdateSession(_:)(uint64_t a1)
{
  uint64_t v2 = sub_1A9167444();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    BOOL v4 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *v4;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
      swift_unknownObjectRetain();
      v7(a1, ObjectType, v5);
      swift_unknownObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t LazyEventProcessor.didEndSession(_:endDate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A9167444();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = (uint64_t *)(v4 + 40);
    do
    {
      uint64_t v7 = *v6;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      swift_unknownObjectRetain();
      v9(a1, a2, ObjectType, v7);
      swift_unknownObjectRelease();
      v6 += 2;
      --v5;
    }
    while (v5);
  }

  return swift_bridgeObjectRelease();
}

void LazyEventProcessor.flush(callbackQueue:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = dispatch_group_create();
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(sub_1A9167444() + 16);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    if (!v5) {
      return;
    }
    goto LABEL_15;
  }
  uint64_t v17 = a3;
  swift_bridgeObjectRetain();
  uint64_t v7 = 32;
  uint64_t v8 = 1;
  while (1)
  {
    void aBlock[6] = &unk_1EFFAB778;
    uint64_t v9 = swift_dynamicCastObjCProtocolConditional();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      swift_unknownObjectRetain_n();
      if (v5) {
        dispatch_group_enter(v5);
      }
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v5;
      aBlock[4] = sub_1A9167E58;
      aBlock[5] = v11;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1A908CD10;
      aBlock[3] = &block_descriptor_13;
      uint64_t v12 = _Block_copy(aBlock);
      uint64_t v13 = v5;
      swift_release();
      objc_msgSend(v10, sel_flushWithCallbackQueue_completion_, a1, v12);
      _Block_release(v12);
      swift_unknownObjectRelease_n();
    }
    if (v6 == v8) {
      break;
    }
    v7 += 16;
    if (__OFADD__(v8++, 1))
    {
      __break(1u);
      break;
    }
  }
  swift_bridgeObjectRelease_n();
  a3 = v17;
  if (v5)
  {
LABEL_15:
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = a3;
    uint64_t v16 = v5;
    sub_1A90A0418(a2);
    sub_1A908CAA8(a1, (uint64_t)sub_1A90D61E8, v15);
    swift_release();
  }
}

uint64_t sub_1A9167DE0()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A9167E20()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1A9167E58()
{
  uint64_t v1 = *(NSObject **)(v0 + 16);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

uint64_t method lookup function for LazyEventProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LazyEventProcessor);
}

uint64_t dispatch thunk of LazyEventProcessor.__allocating_init(underlyingProcessorProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A9167F4C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A9167F84()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1A9167F94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t static CrashDetector.shared.setter(uint64_t a1)
{
  if (qword_1EB688FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EB688F98 = a1;
  return swift_release();
}

uint64_t (*static CrashDetector.shared.modify())()
{
  if (qword_1EB688FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CrashDetector.crashDetected.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t CrashDetector.deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  return v0;
}

uint64_t CrashDetector.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  return MEMORY[0x1F4186488](v0, 25, 7);
}

uint64_t sub_1A91682A8()
{
  return *(unsigned __int8 *)(*(void *)v0 + 24);
}

uint64_t dispatch thunk of CrashDetectorType.crashDetected.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for CrashDetector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CrashDetector);
}

uint64_t sub_1A91682E0(uint64_t a1, unint64_t a2)
{
  if (!(a2 >> 62))
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1A916B7E0();
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = MEMORY[0x1AD0EDEF0](0, a2);
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 32);
    swift_retain();
  }
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  if (*(void *)(v5 + 16) == v6 && *(void *)(v5 + 24) == v7)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return 1;
  }
  char v9 = sub_1A916B9E0();
  uint64_t result = swift_release();
  if (v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v4 == 1) {
    goto LABEL_11;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v10 = 1;
    while (1)
    {
      uint64_t result = MEMORY[0x1AD0EDEF0](v10, a2);
      uint64_t v11 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        break;
      }
      if (*(void *)(result + 16) == v6 && *(void *)(result + 24) == v7)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 1;
      }
      char v13 = sub_1A916B9E0();
      swift_unknownObjectRelease();
      if (v13) {
        goto LABEL_9;
      }
      ++v10;
      if (v11 == v4) {
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v14 = 5;
    while (1)
    {
      uint64_t v15 = v14 - 3;
      if (__OFADD__(v14 - 4, 1)) {
        break;
      }
      uint64_t v16 = *(void *)(a2 + 8 * v14);
      if (*(void *)(v16 + 16) == v6 && *(void *)(v16 + 24) == v7) {
        goto LABEL_9;
      }
      uint64_t result = sub_1A916B9E0();
      if (result) {
        goto LABEL_9;
      }
      ++v14;
      if (v15 == v4) {
        goto LABEL_11;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t ViewingSession.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AAViewingSession_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ViewingSession.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ViewingSession.init()()
{
}

id ViewingSessionManagerType.viewingSession(for:object:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_1A916AF60();
  id v6 = objc_msgSend(v3, sel_viewingSessionForContentIdentifier_object_onEnd_, v5, a3, 0);

  return v6;
}

void *sub_1A9168670(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1A916ACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916ACB0();
  uint64_t v10 = sub_1A916ACA0();
  uint64_t v12 = v11;
  char v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v9, v6);
  v3[2] = v10;
  v3[3] = v12;
  id v14 = objc_msgSend(self, sel_hashTableWithOptions_, 5);
  uint64_t v15 = MEMORY[0x1E4FBC860];
  v3[6] = v14;
  v3[7] = v15;
  sub_1A916ACB0();
  uint64_t v16 = sub_1A916ACA0();
  uint64_t v18 = v17;
  v13(v9, v6);
  uint64_t v19 = (objc_class *)type metadata accessor for ViewingSession();
  uint64_t v20 = (char *)objc_allocWithZone(v19);
  uint64_t v21 = (uint64_t *)&v20[OBJC_IVAR___AAViewingSession_identifier];
  uint64_t *v21 = v16;
  v21[1] = v18;
  v23.receiver = v20;
  v23.super_class = v19;
  v3[8] = objc_msgSendSuper2(&v23, sel_init);
  v3[4] = a1;
  v3[5] = a2;
  return v3;
}

uint64_t sub_1A91687FC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 72, 7);
}

uint64_t sub_1A9168854(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) == *(void *)(*(void *)a2 + 16)
    && *(void *)(*(void *)a1 + 24) == *(void *)(*(void *)a2 + 24))
  {
    return 1;
  }
  else
  {
    return sub_1A916B9E0();
  }
}

id ViewingSessionManager.viewingSession(for:object:onEnd:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)sub_1A9169964(a1, a2, a3, a4, a5);

  return v5;
}

void *sub_1A91688AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a3;
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if ((unint64_t)*v7 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain();
    uint64_t v9 = sub_1A916B7E0();
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v12 = *(void *)(a1 + OBJC_IVAR___AAViewingSessionManager_activeSession);
    uint64_t v15 = a4;
    uint64_t v16 = v23;
    if (v12)
    {
      if (*(void *)(v12 + 32) == v23 && *(void *)(v12 + 40) == v15) {
        goto LABEL_18;
      }
      if (sub_1A916B9E0())
      {
        if ((sub_1A916B9E0() & 1) == 0)
        {
          swift_retain();
LABEL_37:
          uint64_t v22 = sub_1A9168BAC(v16, v15, a2);
          swift_release();
          return v22;
        }
LABEL_18:
        uint64_t v18 = *(void **)(v12 + 48);
        swift_retain();
        objc_msgSend(v18, sel_addObject_, a2);
        return (void *)v12;
      }
    }
    return sub_1A9168BAC(v16, v15, a2);
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain();
  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v10 = 4;
  while (1)
  {
    uint64_t v11 = v10 - 4;
    if ((v8 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = MEMORY[0x1AD0EDEF0](v10 - 4, v8);
      BOOL v13 = __OFADD__(v11, 1);
      uint64_t v14 = v10 - 3;
      if (v13) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      swift_retain();
      BOOL v13 = __OFADD__(v11, 1);
      uint64_t v14 = v10 - 3;
      if (v13)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    if (objc_msgSend(*(id *)(v12 + 48), sel_containsObject_, a2, v23)) {
      break;
    }
    swift_release();
    ++v10;
    if (v14 == v9) {
      goto LABEL_11;
    }
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v19 = *(void *)(a1 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  uint64_t v15 = a4;
  uint64_t v16 = v23;
  if (v19)
  {
    BOOL v20 = *(void *)(v12 + 16) == *(void *)(v19 + 16) && *(void *)(v12 + 24) == *(void *)(v19 + 24);
    if (v20 || (sub_1A916B9E0())
      && (*(void *)(v12 + 32) == v23 && *(void *)(v12 + 40) == v15 || (sub_1A916B9E0() & 1) != 0))
    {
      swift_retain();
      swift_release();
      return (void *)v19;
    }
  }
  if ((*(void *)(v12 + 32) != v23 || *(void *)(v12 + 40) != v15) && (sub_1A916B9E0() & 1) == 0)
  {
    if ((sub_1A916B9E0() & 1) == 0) {
      goto LABEL_37;
    }
    swift_release();
    return sub_1A9168BAC(v16, v15, a2);
  }
  return (void *)v12;
}

void *sub_1A9168BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for ViewingSessionManager.Session();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1A9168670(a1, a2);
  objc_msgSend((id)v8[6], sel_addObject_, a3);
  uint64_t v9 = (void *)(v4 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v10 = swift_retain();
  MEMORY[0x1AD0ED9C0](v10);
  if (*(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1A916B1D0();
  }
  sub_1A916B200();
  sub_1A916B1B0();
  swift_endAccess();
  return v8;
}

uint64_t ViewingSessionManager.remove(object:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if ((unint64_t)*v7 >> 62) {
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (v9)
  {
    while (1)
    {
      uint64_t v10 = 4;
      uint64_t v11 = 0;
      if ((v8 & 0xC000000000000001) == 0) {
        break;
      }
      while (1)
      {
        uint64_t v12 = MEMORY[0x1AD0EDEF0](v11, v8);
        BOOL v13 = __OFADD__(v11, 1);
        uint64_t v14 = v11 + 1;
        if (v13) {
          break;
        }
LABEL_8:
        BOOL v15 = *(void *)(v12 + 32) == a2 && *(void *)(v12 + 40) == a3;
        if (v15 || (sub_1A916B9E0() & 1) != 0) {
          objc_msgSend(*(id *)(v12 + 48), sel_removeObject_, a1);
        }
        swift_release();
        if (v14 == v9) {
          return swift_bridgeObjectRelease_n();
        }
        uint64_t v11 = ++v10 - 4;
        if ((v8 & 0xC000000000000001) == 0) {
          goto LABEL_7;
        }
      }
LABEL_17:
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain_n();
      uint64_t v9 = sub_1A916B7E0();
      if (!v9) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_7:
    uint64_t v12 = *(void *)(v8 + 8 * v10);
    swift_retain();
    BOOL v13 = __OFADD__(v11, 1);
    uint64_t v14 = v11 + 1;
    if (v13) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  return swift_bridgeObjectRelease_n();
}

Swift::Void __swiftcall ViewingSessionManager.endSession(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = (unint64_t *)(v1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A9169FB0(v4, countAndFlagsBits, (uint64_t)object);
  swift_bridgeObjectRelease();
  if (*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1A916B7E0();
    swift_bridgeObjectRelease();
    if (v6 >= v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6 >= v5)
    {
LABEL_3:
      sub_1A916A30C(v5, v6);
      swift_endAccess();
      return;
    }
  }
  __break(1u);
}

Swift::Void __swiftcall ViewingSessionManager.endActiveViewingSession()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1A916ACC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___AAViewingSessionManager_activeSession;
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  if (v7)
  {
    swift_beginAccess();
    uint64_t v8 = *(void *)(v7 + 56);
    uint64_t v9 = *(void *)(v8 + 16);
    if (v9)
    {
      v22[1] = v7 + 56;
      uint64_t v23 = v2;
      uint64_t v24 = v0;
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v10 = v8 + 40;
      do
      {
        uint64_t v11 = *(void (**)(void **))(v10 - 8);
        uint64_t v26 = *(void **)(v7 + 64);
        uint64_t v12 = v26;
        swift_retain();
        id v13 = v12;
        v11(&v26);
        swift_release();

        v10 += 16;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      uint64_t v2 = v23;
      uint64_t v1 = v24;
    }
    else
    {
      swift_retain();
    }
    *(void *)(v7 + 56) = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    sub_1A916ACB0();
    uint64_t v14 = sub_1A916ACA0();
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v17 = (objc_class *)type metadata accessor for ViewingSession();
    uint64_t v18 = (char *)objc_allocWithZone(v17);
    uint64_t v19 = (uint64_t *)&v18[OBJC_IVAR___AAViewingSession_identifier];
    *uint64_t v19 = v14;
    v19[1] = v16;
    v25.receiver = v18;
    v25.super_class = v17;
    id v20 = objc_msgSendSuper2(&v25, sel_init);
    uint64_t v21 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v20;
    swift_release();
  }
  *(void *)(v1 + v6) = 0;
  swift_release();
}

Swift::Void __swiftcall ViewingSessionManager.endAllViewingSessions()()
{
  uint64_t v1 = v0;
  uint64_t v47 = sub_1A916ACC0();
  uint64_t v2 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  long long v46 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = OBJC_IVAR___AAViewingSessionManager_activeSession;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  if (v5)
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(v5 + 56);
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      uint64_t v45 = v2;
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v8 = v6 + 40;
      do
      {
        uint64_t v9 = *(void (**)(void **))(v8 - 8);
        uint64_t v50 = *(void **)(v5 + 64);
        uint64_t v10 = v50;
        swift_retain();
        id v11 = v10;
        v9(&v50);
        swift_release();

        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      uint64_t v2 = v45;
    }
    else
    {
      swift_retain();
    }
    *(void *)(v5 + 56) = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    uint64_t v12 = v46;
    sub_1A916ACB0();
    uint64_t v13 = sub_1A916ACA0();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v12, v47);
    uint64_t v16 = (objc_class *)type metadata accessor for ViewingSession();
    uint64_t v17 = (char *)objc_allocWithZone(v16);
    uint64_t v18 = (uint64_t *)&v17[OBJC_IVAR___AAViewingSession_identifier];
    uint64_t *v18 = v13;
    v18[1] = v15;
    v51.receiver = v17;
    v51.super_class = v16;
    id v19 = objc_msgSendSuper2(&v51, sel_init);
    id v20 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v19;
    swift_release();
  }
  *(void *)(v1 + v4) = 0;
  swift_release();
  uint64_t v21 = (uint64_t *)(v1 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v22 = *v21;
  if ((unint64_t)*v21 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain_n();
    uint64_t v45 = sub_1A916B7E0();
    if (v45) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    uint64_t v45 = v23;
    if (v23)
    {
LABEL_11:
      uint64_t v24 = 0;
      uint64_t v42 = v22 + 32;
      uint64_t v43 = (void (**)(char *, uint64_t))(v2 + 8);
      unint64_t v44 = v22 & 0xC000000000000001;
      do
      {
        if (v44)
        {
          uint64_t v2 = MEMORY[0x1AD0EDEF0](v24, v22);
          BOOL v34 = __OFADD__(v24++, 1);
          if (v34) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v2 = *(void *)(v42 + 8 * v24);
          swift_retain();
          BOOL v34 = __OFADD__(v24++, 1);
          if (v34)
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        swift_beginAccess();
        uint64_t v35 = *(void *)(v2 + 56);
        uint64_t v36 = *(void *)(v35 + 16);
        if (v36)
        {
          swift_bridgeObjectRetain();
          uint64_t v37 = v35 + 40;
          do
          {
            uint64_t v38 = *(void (**)(void **))(v37 - 8);
            uint64_t v49 = *(void **)(v2 + 64);
            int64_t v39 = v49;
            swift_retain();
            id v40 = v39;
            v38(&v49);
            swift_release();

            v37 += 16;
            --v36;
          }
          while (v36);
          swift_bridgeObjectRelease();
        }
        *(void *)(v2 + 56) = MEMORY[0x1E4FBC860];
        swift_bridgeObjectRelease();
        objc_super v25 = v46;
        sub_1A916ACB0();
        uint64_t v26 = sub_1A916ACA0();
        uint64_t v28 = v27;
        (*v43)(v25, v47);
        uint64_t v29 = (objc_class *)type metadata accessor for ViewingSession();
        uint64_t v30 = (char *)objc_allocWithZone(v29);
        char v31 = (uint64_t *)&v30[OBJC_IVAR___AAViewingSession_identifier];
        *char v31 = v26;
        v31[1] = v28;
        v48.receiver = v30;
        v48.super_class = v29;
        id v32 = objc_msgSendSuper2(&v48, sel_init);
        BOOL v33 = *(void **)(v2 + 64);
        *(void *)(v2 + 64) = v32;
        swift_release();
      }
      while (v24 != v45);
    }
  }
  swift_bridgeObjectRelease_n();
}

id ViewingSessionManager.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR___AAViewingSessionManager_sessions] = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR___AAViewingSessionManager_activeSession] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

void *sub_1A91698BC(void *a1)
{
  return sub_1A9093AE4(0, a1[2], 0, a1);
}

void *sub_1A91698D0(void *a1)
{
  return sub_1A90C3170(0, a1[2], 0, a1);
}

void sub_1A91698E8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1A916B7E0();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1AD0EDF00);
}

uint64_t sub_1A9169964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v5;
  uint64_t v51 = a5;
  uint64_t v52 = a1;
  uint64_t v54 = a2;
  uint64_t v55 = a4;
  uint64_t v53 = a3;
  uint64_t v8 = sub_1A916ACC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (void **)((char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (uint64_t *)(v5 + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v58 = MEMORY[0x1E4FBC860];
  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0) {
      uint64_t v5 = v13;
    }
    else {
      uint64_t v5 = v13 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1A916B7E0();
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v48 = v9;
  uint64_t v49 = v8;
  uint64_t v47 = v11;
  if (v14)
  {
    if (v14 < 1)
    {
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v50 = v7;
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        uint64_t v16 = MEMORY[0x1AD0EDEF0](i, v13);
      }
      else
      {
        uint64_t v16 = *(void *)(v13 + 8 * i + 32);
        swift_retain();
      }
      id v17 = objc_msgSend(*(id *)(v16 + 48), sel_allObjects, v47);
      unint64_t v18 = sub_1A916B190();

      if (v18 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_1A916B7E0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v19)
      {
        sub_1A916B6E0();
        sub_1A916B720();
        sub_1A916B730();
        sub_1A916B6F0();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v58;
    uint64_t v7 = v50;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x1E4FBC860];
  }
  *uint64_t v12 = v20;
  swift_bridgeObjectRelease();
  uint64_t v6 = OBJC_IVAR___AAViewingSessionManager_activeSession;
  uint64_t v21 = *(void *)(v7 + OBJC_IVAR___AAViewingSessionManager_activeSession);
  uint64_t v22 = v55;
  if (v21)
  {
    unint64_t v23 = *v12;
    swift_retain();
    swift_bridgeObjectRetain();
    char v24 = sub_1A91682E0(v21, v23);
    swift_release();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      *(void *)(v7 + v6) = 0;
      swift_release();
    }
  }
  id v11 = sub_1A91688AC(v7, v53, v52, v54);
  if (v22)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v22;
    *(void *)(v5 + 24) = v51;
    uint64_t v13 = (uint64_t)(v11 + 7);
    swift_beginAccess();
    uint64_t v14 = v11[7];
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11[7] = v14;
    if (isUniquelyReferenced_nonNull_native)
    {
LABEL_23:
      unint64_t v27 = *(void *)(v14 + 16);
      unint64_t v26 = *(void *)(v14 + 24);
      if (v27 >= v26 >> 1)
      {
        uint64_t v14 = (uint64_t)sub_1A90C3D00((void *)(v26 > 1), v27 + 1, 1, (void *)v14);
        *(void *)uint64_t v13 = v14;
      }
      *(void *)(v14 + 16) = v27 + 1;
      uint64_t v28 = v14 + 16 * v27;
      *(void *)(v28 + 32) = sub_1A916A6E0;
      *(void *)(v28 + 40) = v5;
      swift_endAccess();
      goto LABEL_26;
    }
LABEL_44:
    uint64_t v14 = (uint64_t)sub_1A90C3D00(0, *(void *)(v14 + 16) + 1, 1, (void *)v14);
    *(void *)uint64_t v13 = v14;
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v29 = *(void **)(v7 + v6);
  if (v29)
  {
    BOOL v30 = v11[2] == v29[2] && v11[3] == v29[3];
    if (!v30 && (sub_1A916B9E0() & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v31 = v29[7];
      uint64_t v32 = *(void *)(v31 + 16);
      if (v32)
      {
        uint64_t v50 = v7;
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v33 = v31 + 40;
        do
        {
          BOOL v34 = *(void (**)(void **))(v33 - 8);
          uint64_t v57 = (void *)v29[8];
          uint64_t v35 = v57;
          swift_retain();
          id v36 = v35;
          v34(&v57);
          swift_release();

          v33 += 16;
          --v32;
        }
        while (v32);
        swift_bridgeObjectRelease();
        uint64_t v7 = v50;
      }
      else
      {
        swift_retain();
      }
      v29[7] = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRelease();
      uint64_t v37 = v47;
      sub_1A916ACB0();
      uint64_t v38 = sub_1A916ACA0();
      uint64_t v40 = v39;
      (*(void (**)(void *, uint64_t))(v48 + 8))(v37, v49);
      uint64_t v41 = (objc_class *)type metadata accessor for ViewingSession();
      uint64_t v42 = (char *)objc_allocWithZone(v41);
      uint64_t v43 = (uint64_t *)&v42[OBJC_IVAR___AAViewingSession_identifier];
      *uint64_t v43 = v38;
      v43[1] = v40;
      v56.receiver = v42;
      v56.super_class = v41;
      id v44 = objc_msgSendSuper2(&v56, sel_init);
      uint64_t v45 = (void *)v29[8];
      v29[8] = v44;
      swift_release();
    }
  }
  *(void *)(v7 + v6) = v11;
  swift_release();
  return v11[8];
}

uint64_t sub_1A9169E7C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x1AD0EDEF0](v7, a1);
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      if (*(void *)(v8 + 32) == a2 && *(void *)(v8 + 40) == a3) {
        break;
      }
      char v10 = sub_1A916B9E0();
      swift_release();
      if (v10) {
        return v7;
      }
      uint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_17:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_1A916B7E0();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v11 == v6) {
          return 0;
        }
      }
    }
    swift_release();
  }
  return v7;
}

uint64_t sub_1A9169FB0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A9169E7C(v7, a2, a3);
  char v10 = v9;
  uint64_t v11 = v3;
  swift_bridgeObjectRelease();
  if (v3) {
    return v8;
  }
  if ((v10 & 1) == 0)
  {
    unint64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_61;
    }
    if (*a1 >> 62)
    {
LABEL_62:
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_1A916B7E0();
      swift_bridgeObjectRelease();
      if (v12 != v31) {
        goto LABEL_6;
      }
    }
    else if (v12 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      unint64_t v12 = v8 + 5;
      uint64_t v33 = v11;
      while (1)
      {
        unint64_t v13 = v12 - 4;
        unint64_t v14 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          uint64_t v15 = MEMORY[0x1AD0EDEF0](v12 - 4);
        }
        else
        {
          if ((v13 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          if (v13 >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_52;
          }
          uint64_t v15 = *(void *)(v14 + 8 * v12);
          swift_retain();
        }
        if (*(void *)(v15 + 32) == a2 && *(void *)(v15 + 40) == a3)
        {
          swift_release();
          goto LABEL_39;
        }
        char v17 = sub_1A916B9E0();
        swift_release();
        if (v17) {
          goto LABEL_39;
        }
        if (v13 != v8) {
          break;
        }
LABEL_35:
        if (__OFADD__(v8++, 1)) {
          goto LABEL_54;
        }
LABEL_39:
        unint64_t v27 = v12 - 3;
        if (__OFADD__(v13, 1)) {
          goto LABEL_53;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v28 = sub_1A916B7E0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v28 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v12;
        if (v27 == v28) {
          return v8;
        }
      }
      unint64_t v18 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v19 = MEMORY[0x1AD0EDEF0](v8, *a1);
        unint64_t v18 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v13 & 0x8000000000000000) != 0) {
            goto LABEL_57;
          }
          if (v13 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_58;
          }
          uint64_t v20 = *(void *)(v18 + 8 * v12);
          swift_retain();
          goto LABEL_24;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0) {
          goto LABEL_55;
        }
        if (v8 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_56;
        }
        uint64_t v19 = *(void *)(v18 + 8 * v8 + 32);
        swift_retain();
        if ((v18 & 0xC000000000000001) == 0) {
          goto LABEL_21;
        }
      }
      uint64_t v20 = MEMORY[0x1AD0EDEF0](v12 - 4, v18);
      unint64_t v18 = *a1;
LABEL_24:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v18;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v18 & 0x8000000000000000) != 0
        || (v18 & 0x4000000000000000) != 0)
      {
        sub_1A91698E8(v18);
        unint64_t v18 = v22;
        *a1 = v22;
      }
      *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v20;
      swift_release();
      sub_1A916B1B0();
      unint64_t v23 = *a1;
      int v24 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v23;
      if (!v24 || (v23 & 0x8000000000000000) != 0 || (v23 & 0x4000000000000000) != 0)
      {
        sub_1A91698E8(v23);
        unint64_t v23 = v25;
        *a1 = v25;
      }
      uint64_t v11 = v33;
      if ((v13 & 0x8000000000000000) != 0) {
        goto LABEL_59;
      }
      if (v13 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_60;
      }
      *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v12) = v19;
      swift_release();
      sub_1A916B1B0();
      goto LABEL_35;
    }
    return v8;
  }
  unint64_t v29 = *a1;
  if (!(v29 >> 62)) {
    return *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1A916B7E0();
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t sub_1A916A30C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    unint64_t v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1A916B7E0();
  swift_bridgeObjectRelease();
  if (v19 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v6 = v4 - v2;
  if (__OFSUB__(0, v7))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1A916B7E0();
    swift_bridgeObjectRelease();
    uint64_t v9 = v8 + v6;
    if (!__OFADD__(v8, v6)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1A916B7E0();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v5 = *v3;
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v9 = v8 - v7;
  if (__OFADD__(v8, v6)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v5 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v5;
  uint64_t v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v8 = 1;
  }
  if (v5 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9) {
    uint64_t v12 = v9;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = MEMORY[0x1AD0EDF00](v8, v12, 1, v5);
  swift_bridgeObjectRelease();
  *uint64_t v3 = v5;
  uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  type metadata accessor for ViewingSessionManager.Session();
  swift_arrayDestroy();
  if (v6)
  {
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_1A916B7E0();
      swift_bridgeObjectRelease();
      uint64_t v14 = v20 - v2;
      if (!__OFSUB__(v20, v2))
      {
LABEL_21:
        if (v14 < 0)
        {
LABEL_46:
          uint64_t result = sub_1A916B830();
          __break(1u);
          return result;
        }
        uint64_t v15 = (const void *)(v11 + 32 + 8 * v2);
        if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v15 + 8 * v14) {
          memmove((void *)(v11 + 32 + 8 * v4), v15, 8 * v14);
        }
        if (!(v5 >> 62))
        {
          uint64_t v16 = *(void *)(v11 + 16);
          uint64_t v17 = v16 + v6;
          if (!__OFADD__(v16, v6))
          {
LABEL_27:
            *(void *)(v11 + 16) = v17;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_1A916B7E0();
        swift_bridgeObjectRelease();
        uint64_t v17 = v21 + v6;
        if (!__OFADD__(v21, v6)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v11 + 16);
      uint64_t v14 = v13 - v2;
      if (!__OFSUB__(v13, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:

  return sub_1A916B1B0();
}

uint64_t type metadata accessor for ViewingSession()
{
  return self;
}

uint64_t method lookup function for ViewingSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ViewingSession);
}

uint64_t type metadata accessor for ViewingSessionManager()
{
  return self;
}

uint64_t type metadata accessor for ViewingSessionManager.Session()
{
  return self;
}

uint64_t sub_1A916A670()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A916A6A8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A916A6E0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1A916A710()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_1A916A720()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1A916A730()
{
  return MEMORY[0x1F40E2EB8]();
}

uint64_t sub_1A916A740()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1A916A750()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1A916A760()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1A916A770()
{
  return MEMORY[0x1F40E2F10]();
}

uint64_t sub_1A916A780()
{
  return MEMORY[0x1F40E2F50]();
}

uint64_t sub_1A916A790()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1A916A7A0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A916A7B0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A916A7C0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A916A7D0()
{
  return MEMORY[0x1F40E30F0]();
}

uint64_t sub_1A916A7E0()
{
  return MEMORY[0x1F40E3108]();
}

uint64_t sub_1A916A7F0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1A916A800()
{
  return MEMORY[0x1F40E3130]();
}

uint64_t sub_1A916A810()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1A916A820()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1A916A830()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1A916A840()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1A916A850()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1A916A860()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A916A870()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A916A880()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1A916A890()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A916A8A0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A916A8B0()
{
  return MEMORY[0x1F40E3820]();
}

uint64_t sub_1A916A8C0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A916A8D0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1A916A920()
{
  return MEMORY[0x1F40E3F80]();
}

uint64_t sub_1A916A930()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1A916A940()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1A916A950()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1A916A960()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1A916A970()
{
  return MEMORY[0x1F40E44A8]();
}

uint64_t sub_1A916A980()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A916A990()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A916A9A0()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1A916A9B0()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1A916A9C0()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1A916A9D0()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1A916A9E0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1A916A9F0()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1A916AA00()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1A916AA10()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A916AA20()
{
  return MEMORY[0x1F40E4958]();
}

uint64_t sub_1A916AA30()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1A916AA40()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A916AA50()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1A916AA60()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1A916AA70()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A916AA80()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1A916AA90()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1A916AAA0()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1A916AAB0()
{
  return MEMORY[0x1F40E4B48]();
}

uint64_t sub_1A916AAC0()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1A916AAD0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A916AAE0()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1A916AAF0()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1A916AB00()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t sub_1A916AB10()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A916AB20()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1A916AB30()
{
  return MEMORY[0x1F40E4CD0]();
}

uint64_t sub_1A916AB40()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1A916AB50()
{
  return MEMORY[0x1F40E4CF8]();
}

uint64_t sub_1A916AB60()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A916AB70()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1A916AB80()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A916AB90()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1A916ABA0()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1A916ABB0()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1A916ABC0()
{
  return MEMORY[0x1F40E4E70]();
}

uint64_t sub_1A916ABD0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A916ABE0()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1A916ABF0()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A916AC00()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A916AC10()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A916AC20()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1A916AC30()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A916AC40()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1A916AC50()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1A916AC60()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A916AC70()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A916AC80()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A916AC90()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A916ACA0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A916ACB0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A916ACC0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A916ACD0()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1A916ACE0()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1A916ACF0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1A916AD00()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1A916AD10()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1A916AD20()
{
  return MEMORY[0x1F40E5E48]();
}

uint64_t sub_1A916AD30()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1A916AD40()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A916AD50()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A916AD60()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1A916AD70()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1A916AD80()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1A916AD90()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1A916ADA0()
{
  return MEMORY[0x1F4186C80]();
}

uint64_t sub_1A916ADB0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A916ADC0()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1A916ADD0()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1A916ADE0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A916ADF0()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1A916AE00()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1A916AE10()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A916AE20()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1A916AE30()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1A916AE40()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1A916AE50()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_1A916AE60()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1A916AE70()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1A916AE80()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1A916AE90()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1A916AEA0()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A916AEB0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A916AEC0()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1A916AED0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A916AEE0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1A916AEF0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1A916AF00()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A916AF10()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A916AF20()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1A916AF30()
{
  return MEMORY[0x1F4183710]();
}

uint64_t sub_1A916AF40()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A916AF50()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A916AF60()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A916AF70()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A916AF80()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A916AF90()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A916AFA0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1A916AFB0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A916AFC0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1A916AFD0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1A916AFE0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A916AFF0()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A916B000()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A916B010()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1A916B020()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A916B030()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A916B040()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A916B050()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A916B060()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A916B070()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A916B080()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1A916B090()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A916B0A0()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1A916B0B0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1A916B0C0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A916B0D0()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1A916B0E0()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A916B0F0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A916B100()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A916B110()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1A916B120()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A916B160()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A916B170()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A916B180()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A916B190()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A916B1A0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A916B1B0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A916B1C0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1A916B1D0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A916B1E0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A916B1F0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A916B200()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A916B210()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A916B230()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A916B240()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A916B250()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A916B260()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1A916B270()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A916B280()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A916B290()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1A916B2A0()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A916B2B0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1A916B2C0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A916B2D0()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1A916B2E0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A916B2F0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A916B300()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A916B310()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A916B320()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A916B330()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A916B340()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1A916B350()
{
  return MEMORY[0x1F40E6560]();
}

uint64_t sub_1A916B360()
{
  return MEMORY[0x1F40E6598]();
}

uint64_t sub_1A916B370()
{
  return MEMORY[0x1F40E65A8]();
}

uint64_t sub_1A916B380()
{
  return MEMORY[0x1F40E65B8]();
}

uint64_t sub_1A916B390()
{
  return MEMORY[0x1F40E6628]();
}

uint64_t sub_1A916B3A0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A916B3B0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A916B3C0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A916B3D0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A916B3E0()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1A916B3F0()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1A916B400()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1A916B410()
{
  return MEMORY[0x1F4186FB8]();
}

uint64_t sub_1A916B420()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A916B430()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A916B440()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1A916B450()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1A916B460()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A916B470()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1A916B480()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A916B490()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1A916B4A0()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1A916B4B0()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1A916B4C0()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1A916B4D0()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1A916B4E0()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1A916B4F0()
{
  return MEMORY[0x1F41872D8]();
}

uint64_t sub_1A916B500()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1A916B520()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A916B530()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1A916B540()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A916B550()
{
  return MEMORY[0x1F4184648]();
}

uint64_t sub_1A916B560()
{
  return MEMORY[0x1F4184650]();
}

uint64_t sub_1A916B570()
{
  return MEMORY[0x1F4184660]();
}

uint64_t sub_1A916B580()
{
  return MEMORY[0x1F4184768]();
}

uint64_t sub_1A916B590()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A916B5A0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A916B5B0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A916B5C0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1A916B5D0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1A916B5E0()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1A916B5F0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A916B610()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A916B620()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A916B630()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A916B640()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A916B650()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A916B660()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1A916B670()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1A916B680()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A916B690()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A916B6A0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A916B6B0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A916B6C0()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1A916B6D0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A916B6E0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A916B6F0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A916B700()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A916B710()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A916B720()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A916B730()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A916B740()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A916B750()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A916B760()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A916B770()
{
  return MEMORY[0x1F4185008]();
}

uint64_t sub_1A916B780()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A916B790()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t sub_1A916B7A0()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1A916B7B0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A916B7C0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A916B7D0()
{
  return MEMORY[0x1F4185340]();
}

uint64_t sub_1A916B7E0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A916B7F0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A916B800()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A916B810()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A916B820()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1A916B830()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A916B840()
{
  return MEMORY[0x1F41853B0]();
}

uint64_t sub_1A916B850()
{
  return MEMORY[0x1F41853B8]();
}

uint64_t sub_1A916B870()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A916B880()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A916B890()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A916B8A0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A916B8B0()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A916B8C0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1A916B8D0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A916B8E0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A916B8F0()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1A916B900()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A916B910()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A916B920()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A916B930()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A916B940()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1A916B950()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A916B960()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A916B970()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1A916B980()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A916B990()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A916B9A0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1A916B9C0()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A916B9D0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A916B9E0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A916B9F0()
{
  return MEMORY[0x1F4185AA0]();
}

uint64_t sub_1A916BA00()
{
  return MEMORY[0x1F4185B40]();
}

uint64_t sub_1A916BA20()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1A916BA30()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1A916BA40()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A916BA50()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A916BA60()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1A916BA70()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A916BA80()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A916BA90()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A916BAA0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A916BAB0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A916BAC0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A916BAD0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A916BAE0()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A916BAF0()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1A916BB00()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A916BB10()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1A916BB20()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A916BB30()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1A916BB40()
{
  return MEMORY[0x1F4185FE8]();
}

uint64_t sub_1A916BB50()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A916BB60()
{
  return MEMORY[0x1F4186130]();
}

uint64_t sub_1A916BB90()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1A916BBA0()
{
  return MEMORY[0x1F41881A8]();
}

uint64_t sub_1A916BBB0()
{
  return MEMORY[0x1F4186318]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void bzero(void *a1, size_t a2)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
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

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x1F4188280]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x1F4188288]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}