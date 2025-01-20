uint64_t sub_1DAD1C59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  _DWORD *v31;
  _DWORD *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  _DWORD *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;

  v9 = sub_1DAD22008();
  MEMORY[0x1F4188790](v9 - 8);
  v45 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DAD26908();
  v40 = *(void *)(v11 - 8);
  v41 = v11;
  MEMORY[0x1F4188790](v11);
  v42 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DAD22088();
  v38 = *(void *)(v13 - 8);
  v39 = v13;
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F0788);
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1DAD265B8();
  v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(void *)(v4 + 96) + 16));
  v43 = a1;
  v44 = a2;
  sub_1DAD265A8();
  sub_1DAD26958();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_1DA9DD290((uint64_t)v18, &qword_1EA8F0788);
LABEL_3:
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v15, v43, v39);
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v42, v44, v41);
    sub_1DAD21FA8();
    sub_1DAD26588();
    return sub_1DAD26988();
  }
  v37 = a4;
  v24 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v24(v22, v18, v19);
  v25 = sub_1DAD26578();
  sub_1DAD1F798(&qword_1EA8F0790, MEMORY[0x1E4F586F0]);
  if (v25 != a3)
  {
    v26 = sub_1DAD267C8();
    if (qword_1EBE4C050 != -1) {
      goto LABEL_12;
    }
    while (1)
    {
      v27 = sub_1DAD23828();
      __swift_project_value_buffer(v27, (uint64_t)qword_1EBE560E0);
      v28 = sub_1DAD237F8();
      v29 = sub_1DAD27DB8();
      v30 = v29;
      if (os_log_type_enabled(v28, v29))
      {
        v31 = (_DWORD *)swift_slowAlloc();
        v36 = v30;
        v32 = v31;
        *v31 = 134218240;
        v35 = v31 + 1;
        swift_beginAccess();
        v33 = sub_1DAD26578();
        swift_endAccess();
        v46 = v33;
        sub_1DAD282B8();
        *((_WORD *)v32 + 6) = 2048;
        v46 = a3;
        sub_1DAD282B8();
        _os_log_impl(&dword_1DA9D9000, v28, (os_log_type_t)v36, "maximumBudgetPerWindow has changed from %ld to %ld, removing and recreating budget", (uint8_t *)v32, 0x16u);
        MEMORY[0x1E0180C50](v32, -1, -1);
      }

      swift_beginAccess();
      sub_1DAD26968();
      v34 = *(void (**)(char *, uint64_t))(v20 + 8);
      v20 += 8;
      v34(v22, v19);
      if (!__OFSUB__(a3, v26)) {
        break;
      }
      __break(1u);
LABEL_12:
      swift_once();
    }
    goto LABEL_3;
  }
  sub_1DAD267D8();
  sub_1DAD26988();
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v24)(v37, v22, v19);
}

uint64_t sub_1DAD1CB14(uint64_t a1, int a2)
{
  int v217 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F0788);
  MEMORY[0x1F4188790](v4 - 8);
  v199 = (char *)&v197 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v220 = sub_1DAD263E8();
  uint64_t v222 = *(void *)(v220 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v220);
  v221 = (char *)&v197 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v214 = (char *)&v197 - v8;
  uint64_t v238 = sub_1DAD22088();
  v9 = *(NSObject **)(v238 - 8);
  MEMORY[0x1F4188790](v238 - 8);
  v11 = (char *)&v197 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1DAD265B8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  v197 = (char *)&v197 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v235 = (char *)&v197 - v17;
  MEMORY[0x1F4188790](v16);
  v234 = (char *)&v197 - v18;
  uint64_t v19 = sub_1DAD26908();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v208 = (char *)&v197 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  v241 = (char **)((char *)&v197 - v23);
  uint64_t v24 = sub_1DAD26488();
  uint64_t v223 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v24);
  v198 = (char *)&v197 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v207 = (char *)&v197 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v204 = (char *)&v197 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v216 = (char *)&v197 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  v215 = (char *)&v197 - v34;
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  v211 = (char *)&v197 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  v210 = (char *)&v197 - v38;
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  v205 = (char *)&v197 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  v203 = (char *)&v197 - v42;
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  v206 = (char *)&v197 - v44;
  uint64_t v45 = MEMORY[0x1F4188790](v43);
  v202 = (char *)&v197 - v46;
  MEMORY[0x1F4188790](v45);
  v219 = (char *)&v197 - v47;
  uint64_t v218 = *(void *)(v2 + 96);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v218 + 16));
  v48 = a1;
  uint64_t v236 = v2;
  uint64_t v49 = sub_1DAD1B540(a1);
  uint64_t v50 = sub_1DAD268F8();
  uint64_t v51 = *(void *)(v50 + 16);
  v213 = v9;
  v237 = v11;
  os_log_t v239 = v48;
  uint64_t v201 = v13;
  uint64_t v200 = v20;
  if (v51)
  {
    uint64_t v212 = v24;
    v53 = *(void (**)(uint64_t, void, uint64_t))(v20 + 104);
    uint64_t v52 = v20 + 104;
    v232 = v53;
    unint64_t v54 = (*(unsigned __int8 *)(v52 - 24) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 - 24);
    uint64_t v209 = v50;
    uint64_t v55 = v50 + v54;
    uint64_t v231 = *(void *)(v52 - 32);
    LODWORD(v230) = *MEMORY[0x1E4F58770];
    os_log_t v228 = v9 + 1;
    uint64_t v229 = v52 - 96;
    uint64_t v233 = v52;
    v226 = (void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v227 = (void (**)(uint64_t, uint64_t, uint64_t))(v52 - 88);
    v225 = (void (**)(uint64_t, uint64_t))(v13 + 8);
    uint64_t v56 = MEMORY[0x1E4FBC868];
    uint64_t v224 = v49;
    uint64_t v57 = (uint64_t)v241;
    v58 = (void (**)(char **, uint64_t))(v52 - 96);
    uint64_t v59 = (uint64_t)v234;
    do
    {
      v232(v57, v230, v19);
      char v60 = sub_1DAD268E8();
      v240 = *v58;
      v240(v241, v19);
      uint64_t v61 = v19;
      uint64_t v62 = v56;
      uint64_t v63 = v12;
      uint64_t v64 = v224 << (v60 & 1);
      uint64_t v65 = (uint64_t)v237;
      sub_1DAD26448();
      uint64_t v66 = v64;
      uint64_t v12 = v63;
      sub_1DAD1C59C(v65, v55, v66, v59);
      ((void (*)(uint64_t, uint64_t))v228->isa)(v65, v238);
      (*v227)((uint64_t)v241, v55, v61);
      uint64_t v67 = (uint64_t)v235;
      (*v226)(v235, v59, v63);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v243 = (void (*)(void, void, void))v62;
      uint64_t v19 = v61;
      sub_1DAA36324(v67, (uint64_t)v241, isUniquelyReferenced_nonNull_native);
      uint64_t v57 = (uint64_t)v241;
      uint64_t v56 = (uint64_t)v243;
      swift_bridgeObjectRelease();
      v240((char **)v57, v61);
      (*v225)(v59, v12);
      v55 += v231;
      --v51;
    }
    while (v51);
    swift_bridgeObjectRelease();
    uint64_t v24 = v212;
    v48 = v239;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v56 = MEMORY[0x1E4FBC868];
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v218 + 16));
  uint64_t v69 = v223;
  v70 = v219;
  if (qword_1EBE4C050 != -1) {
    swift_once();
  }
  uint64_t v71 = sub_1DAD23828();
  uint64_t v72 = __swift_project_value_buffer(v71, (uint64_t)qword_1EBE560E0);
  v73 = *(char **)(v69 + 16);
  v240 = (void (*)(char **, uint64_t))(v69 + 16);
  v235 = v73;
  ((void (*)(char *, NSObject *, uint64_t))v73)(v70, v48, v24);
  swift_bridgeObjectRetain_n();
  v241 = (char **)v72;
  v74 = sub_1DAD237F8();
  os_log_type_t v75 = sub_1DAD27D88();
  int v76 = v75;
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v77 = swift_slowAlloc();
    v234 = (char *)v19;
    uint64_t v78 = v77;
    v232 = (void (*)(uint64_t, void, uint64_t))swift_slowAlloc();
    v243 = v232;
    *(_DWORD *)uint64_t v78 = 136315650;
    uint64_t v233 = v12;
    LODWORD(v231) = v76;
    v79 = v70;
    sub_1DAD26438();
    uint64_t v80 = v220;
    uint64_t v81 = sub_1DAD27978();
    uint64_t v242 = sub_1DA9DD8F4(v81, v82, (uint64_t *)&v243);
    v230 = (uint64_t *)&v243;
    sub_1DAD282B8();
    swift_bridgeObjectRelease();
    v83 = *(void (**)(char *, uint64_t))(v69 + 8);
    v83(v79, v24);
    *(_WORD *)(v78 + 12) = 1024;
    LODWORD(v242) = v217 & 1;
    sub_1DAD282B8();
    *(_WORD *)(v78 + 18) = 2080;
    sub_1DAD1F798(&qword_1EA8EE068, MEMORY[0x1E4F58778]);
    swift_bridgeObjectRetain();
    uint64_t v84 = sub_1DAD277C8();
    uint64_t v85 = v24;
    unint64_t v87 = v86;
    swift_bridgeObjectRelease();
    uint64_t v88 = v84;
    v89 = v83;
    uint64_t v242 = sub_1DA9DD8F4(v88, v87, (uint64_t *)&v243);
    uint64_t v12 = v233;
    sub_1DAD282B8();
    swift_bridgeObjectRelease_n();
    uint64_t v24 = v85;
    v48 = v239;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA9D9000, v74, (os_log_type_t)v231, "Checking subscription type %s, alerting %{BOOL}d, budgets %s", (uint8_t *)v78, 0x1Cu);
    v90 = (void (*)(void, void))v232;
    swift_arrayDestroy();
    MEMORY[0x1E0180C50](v90, -1, -1);
    uint64_t v91 = v78;
    uint64_t v19 = (uint64_t)v234;
    MEMORY[0x1E0180C50](v91, -1, -1);
  }
  else
  {
    v89 = *(void (**)(char *, uint64_t))(v69 + 8);
    v89(v70, v24);

    swift_bridgeObjectRelease_n();
    uint64_t v80 = v220;
  }
  v92 = v221;
  sub_1DAD26438();
  int v93 = (*(uint64_t (**)(char *, uint64_t))(v222 + 88))(v92, v80);
  if (v93 != *MEMORY[0x1E4F58698])
  {
    if (v93 == *MEMORY[0x1E4F58688])
    {
      swift_bridgeObjectRelease();
      v94 = v210;
      v110 = v235;
      ((void (*)(char *, NSObject *, uint64_t))v235)(v210, v48, v24);
      v96 = v211;
      ((void (*)(char *, NSObject *, uint64_t))v110)(v211, v48, v24);
      v97 = sub_1DAD237F8();
      os_log_type_t v111 = sub_1DAD27D98();
      int v112 = v111;
      if (os_log_type_enabled(v97, v111))
      {
        uint64_t v100 = swift_slowAlloc();
        v241 = (char **)swift_slowAlloc();
        v243 = (void (*)(void, void, void))v241;
        *(_DWORD *)uint64_t v100 = 136446466;
        LODWORD(v240) = v112;
        uint64_t v113 = sub_1DAD263F8();
        uint64_t v242 = sub_1DA9DD8F4(v113, v114, (uint64_t *)&v243);
        sub_1DAD282B8();
        swift_bridgeObjectRelease();
        v89(v94, v24);
        *(_WORD *)(v100 + 12) = 2082;
        os_log_t v239 = (os_log_t)(v100 + 14);
        v115 = v237;
        sub_1DAD26448();
        sub_1DAD1F798(&qword_1EBE44E00, MEMORY[0x1E4F27990]);
        v232 = (void (*)(uint64_t, void, uint64_t))v89;
        uint64_t v116 = v238;
        uint64_t v117 = sub_1DAD288B8();
        uint64_t v118 = v24;
        unint64_t v120 = v119;
        ((void (*)(char *, uint64_t))v213[1].isa)(v115, v116);
        uint64_t v242 = sub_1DA9DD8F4(v117, v120, (uint64_t *)&v243);
        sub_1DAD282B8();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v232)(v96, v118);
        v109 = "stateChanges subscription: not sending updated archive immediately: %{public}s.%{public}s";
        goto LABEL_17;
      }
LABEL_18:
      v89(v94, v24);
      v89(v96, v24);
      goto LABEL_19;
    }
    if (v93 == *MEMORY[0x1E4F586A0])
    {
      if ((v217 & 1) == 0)
      {
        v146 = v203;
        v147 = v235;
        ((void (*)(char *, NSObject *, uint64_t))v235)(v203, v48, v24);
        v148 = v205;
        ((void (*)(char *, NSObject *, uint64_t))v147)(v205, v48, v24);
        v97 = sub_1DAD237F8();
        os_log_type_t v149 = sub_1DAD27D88();
        int v150 = v149;
        if (os_log_type_enabled(v97, v149))
        {
          uint64_t v151 = swift_slowAlloc();
          v241 = (char **)swift_slowAlloc();
          v243 = (void (*)(void, void, void))v241;
          *(_DWORD *)uint64_t v151 = 136446466;
          LODWORD(v240) = v150;
          uint64_t v152 = sub_1DAD263F8();
          uint64_t v242 = sub_1DA9DD8F4(v152, v153, (uint64_t *)&v243);
          os_log_t v239 = v97;
          sub_1DAD282B8();
          swift_bridgeObjectRelease();
          v230 = (uint64_t *)v56;
          v89(v146, v24);
          *(_WORD *)(v151 + 12) = 2082;
          uint64_t v236 = v151 + 14;
          v154 = v237;
          sub_1DAD26448();
          sub_1DAD1F798(&qword_1EBE44E00, MEMORY[0x1E4F27990]);
          v155 = v89;
          uint64_t v156 = v238;
          uint64_t v157 = sub_1DAD288B8();
          unint64_t v159 = v158;
          ((void (*)(char *, uint64_t))v213[1].isa)(v154, v156);
          uint64_t v242 = sub_1DA9DD8F4(v157, v159, (uint64_t *)&v243);
          sub_1DAD282B8();
          swift_bridgeObjectRelease();
          v155(v148, v24);
          v97 = v239;
          _os_log_impl(&dword_1DA9D9000, v239, (os_log_type_t)v240, "alerting subscription: not sending updated non-alerting archive immediately: %{public}s.%{public}s", (uint8_t *)v151, 0x16u);
          uint64_t v160 = (uint64_t)v241;
          swift_arrayDestroy();
          MEMORY[0x1E0180C50](v160, -1, -1);
          MEMORY[0x1E0180C50](v151, -1, -1);
        }
        else
        {
          v89(v146, v24);
          v89(v148, v24);
        }
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      v234 = (char *)v19;
      LODWORD(v231) = sub_1DAD1EFD0(v56, 1);
      v124 = v202;
      v125 = v235;
      ((void (*)(char *, NSObject *, uint64_t))v235)(v202, v48, v24);
      v126 = v206;
      ((void (*)(char *, NSObject *, uint64_t))v125)(v206, v48, v24);
      v127 = sub_1DAD237F8();
      os_log_type_t v128 = sub_1DAD27D88();
      if (os_log_type_enabled(v127, v128))
      {
        uint64_t v129 = swift_slowAlloc();
        uint64_t v229 = swift_slowAlloc();
        v243 = (void (*)(void, void, void))v229;
        *(_DWORD *)uint64_t v129 = 136446466;
        uint64_t v233 = v12;
        os_log_t v228 = v127;
        uint64_t v130 = sub_1DAD263F8();
        uint64_t v242 = sub_1DA9DD8F4(v130, v131, (uint64_t *)&v243);
        v232 = (void (*)(uint64_t, void, uint64_t))v89;
        sub_1DAD282B8();
        swift_bridgeObjectRelease();
        v230 = (uint64_t *)v56;
        ((void (*)(char *, uint64_t))v232)(v124, v24);
        *(_WORD *)(v129 + 12) = 2082;
        v227 = (void (**)(uint64_t, uint64_t, uint64_t))(v129 + 14);
        os_log_type_t v132 = v128;
        v133 = v237;
        v134 = v206;
        sub_1DAD26448();
        sub_1DAD1F798(&qword_1EBE44E00, MEMORY[0x1E4F27990]);
        uint64_t v135 = v238;
        uint64_t v136 = sub_1DAD288B8();
        uint64_t v137 = v24;
        unint64_t v139 = v138;
        uint64_t v140 = v135;
        uint64_t v12 = v233;
        ((void (*)(char *, uint64_t))v213[1].isa)(v133, v140);
        uint64_t v242 = sub_1DA9DD8F4(v136, v139, (uint64_t *)&v243);
        v89 = (void (*)(char *, uint64_t))v232;
        sub_1DAD282B8();
        uint64_t v24 = v137;
        swift_bridgeObjectRelease();
        v89(v134, v137);
        uint64_t v56 = (uint64_t)v230;
        v48 = v239;
        os_log_t v141 = v228;
        _os_log_impl(&dword_1DA9D9000, v228, v132, "alerting subscription: Sending updated alerting archive immediately: %{public}s.%{public}s", (uint8_t *)v129, 0x16u);
        uint64_t v142 = v229;
        swift_arrayDestroy();
        MEMORY[0x1E0180C50](v142, -1, -1);
        MEMORY[0x1E0180C50](v129, -1, -1);
      }
      else
      {
        v89(v124, v24);
        v89(v126, v24);
      }
      uint64_t v19 = (uint64_t)v234;
      uint64_t v143 = (uint64_t)v208;
      if (v231)
      {
LABEL_36:
        uint64_t v178 = v200;
        (*(void (**)(uint64_t, void, uint64_t))(v200 + 104))(v143, *MEMORY[0x1E4F58768], v19);
        if (*(void *)(v56 + 16))
        {
          unint64_t v179 = sub_1DAA19E10(v143);
          if (v180)
          {
            uint64_t v181 = (uint64_t)v199;
            (*(void (**)(char *, unint64_t, uint64_t))(v201 + 16))(v199, *(void *)(v56 + 56) + *(void *)(v201 + 72) * v179, v12);
            uint64_t v182 = 0;
          }
          else
          {
            uint64_t v182 = 1;
            uint64_t v181 = (uint64_t)v199;
          }
        }
        else
        {
          uint64_t v182 = 1;
          uint64_t v181 = (uint64_t)v199;
        }
        uint64_t v183 = v201;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v201 + 56))(v181, v182, 1, v12);
        (*(void (**)(char *, uint64_t))(v178 + 8))(v208, v19);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v183 + 48))(v181, 1, v12) == 1)
        {
          sub_1DA9DD290(v181, &qword_1EA8F0788);
          v184 = v198;
          ((void (*)(char *, NSObject *, uint64_t))v235)(v198, v48, v24);
          swift_bridgeObjectRetain();
          v185 = sub_1DAD237F8();
          os_log_type_t v186 = sub_1DAD27D98();
          int v187 = v186;
          if (os_log_type_enabled(v185, v186))
          {
            uint64_t v188 = swift_slowAlloc();
            v234 = (char *)v19;
            uint64_t v189 = v188;
            v241 = (char **)swift_slowAlloc();
            v243 = (void (*)(void, void, void))v241;
            *(_DWORD *)uint64_t v189 = 136446722;
            sub_1DAD1F798(&qword_1EA8EEE38, MEMORY[0x1E4F586A8]);
            LODWORD(v240) = v187;
            uint64_t v190 = sub_1DAD288B8();
            uint64_t v242 = sub_1DA9DD8F4(v190, v191, (uint64_t *)&v243);
            uint64_t v233 = v12;
            sub_1DAD282B8();
            swift_bridgeObjectRelease();
            v89(v184, v24);
            *(_WORD *)(v189 + 12) = 1026;
            char v122 = 1;
            LODWORD(v242) = 1;
            sub_1DAD282B8();
            *(_WORD *)(v189 + 18) = 2082;
            sub_1DAD1F798(&qword_1EA8EE068, MEMORY[0x1E4F58778]);
            swift_bridgeObjectRetain();
            uint64_t v192 = sub_1DAD277C8();
            unint64_t v194 = v193;
            swift_bridgeObjectRelease();
            uint64_t v242 = sub_1DA9DD8F4(v192, v194, (uint64_t *)&v243);
            sub_1DAD282B8();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1DA9D9000, v185, (os_log_type_t)v240, "No budget for %{public}s, alerting %{BOOL,public}d, budgets %{public}s", (uint8_t *)v189, 0x1Cu);
            uint64_t v195 = (uint64_t)v241;
            swift_arrayDestroy();
            MEMORY[0x1E0180C50](v195, -1, -1);
            MEMORY[0x1E0180C50](v189, -1, -1);

            return v122 & 1;
          }
          v89(v184, v24);

          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
          v196 = v197;
          (*(void (**)(char *, uint64_t, uint64_t))(v183 + 32))(v197, v181, v12);
          sub_1DAD1F798(&qword_1EA8F0790, MEMORY[0x1E4F586F0]);
          sub_1DAD267E8();
          sub_1DAD26988();
          (*(void (**)(char *, uint64_t))(v183 + 8))(v196, v12);
        }
        char v122 = 1;
        return v122 & 1;
      }
    }
    else
    {
      uint64_t v143 = (uint64_t)v208;
      if (v93 != *MEMORY[0x1E4F58690])
      {
        swift_bridgeObjectRelease();
        v161 = v204;
        v162 = v235;
        ((void (*)(char *, NSObject *, uint64_t))v235)(v204, v48, v24);
        v163 = v207;
        ((void (*)(char *, NSObject *, uint64_t))v162)(v207, v48, v24);
        v164 = sub_1DAD237F8();
        os_log_type_t v165 = sub_1DAD27D98();
        int v166 = v165;
        if (os_log_type_enabled(v164, v165))
        {
          uint64_t v167 = swift_slowAlloc();
          v241 = (char **)swift_slowAlloc();
          v243 = (void (*)(void, void, void))v241;
          *(_DWORD *)uint64_t v167 = 136446466;
          LODWORD(v240) = v166;
          uint64_t v168 = sub_1DAD263F8();
          uint64_t v242 = sub_1DA9DD8F4(v168, v169, (uint64_t *)&v243);
          sub_1DAD282B8();
          swift_bridgeObjectRelease();
          v89(v161, v24);
          *(_WORD *)(v167 + 12) = 2082;
          os_log_t v239 = (os_log_t)(v167 + 14);
          v170 = v237;
          sub_1DAD26448();
          sub_1DAD1F798(&qword_1EBE44E00, MEMORY[0x1E4F27990]);
          v171 = v89;
          uint64_t v172 = v238;
          uint64_t v173 = sub_1DAD288B8();
          uint64_t v174 = v24;
          unint64_t v176 = v175;
          ((void (*)(char *, uint64_t))v213[1].isa)(v170, v172);
          uint64_t v242 = sub_1DA9DD8F4(v173, v176, (uint64_t *)&v243);
          sub_1DAD282B8();
          swift_bridgeObjectRelease();
          v171(v207, v174);
          uint64_t v80 = v220;
          _os_log_impl(&dword_1DA9D9000, v164, (os_log_type_t)v240, "unknown subscription: not sending updated archive immediately: %{public}s.%{public}s", (uint8_t *)v167, 0x16u);
          uint64_t v177 = (uint64_t)v241;
          swift_arrayDestroy();
          MEMORY[0x1E0180C50](v177, -1, -1);
          MEMORY[0x1E0180C50](v167, -1, -1);
        }
        else
        {
          v89(v161, v24);
          v89(v163, v24);
        }

        (*(void (**)(char *, uint64_t))(v222 + 8))(v221, v80);
        goto LABEL_20;
      }
      char v144 = v217;
      char v145 = sub_1DAD1E768(v56, v217 & 1);
      char v122 = v145;
      if ((v144 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        return v122 & 1;
      }
      if (v145) {
        goto LABEL_36;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  v94 = v215;
  v95 = v235;
  ((void (*)(char *, NSObject *, uint64_t))v235)(v215, v48, v24);
  v96 = v216;
  ((void (*)(char *, NSObject *, uint64_t))v95)(v216, v48, v24);
  v97 = sub_1DAD237F8();
  os_log_type_t v98 = sub_1DAD27D98();
  int v99 = v98;
  if (!os_log_type_enabled(v97, v98)) {
    goto LABEL_18;
  }
  uint64_t v100 = swift_slowAlloc();
  v241 = (char **)swift_slowAlloc();
  v243 = (void (*)(void, void, void))v241;
  *(_DWORD *)uint64_t v100 = 136446466;
  LODWORD(v240) = v99;
  uint64_t v101 = sub_1DAD263F8();
  uint64_t v242 = sub_1DA9DD8F4(v101, v102, (uint64_t *)&v243);
  sub_1DAD282B8();
  swift_bridgeObjectRelease();
  v89(v94, v24);
  *(_WORD *)(v100 + 12) = 2082;
  os_log_t v239 = (os_log_t)(v100 + 14);
  v103 = v237;
  sub_1DAD26448();
  sub_1DAD1F798(&qword_1EBE44E00, MEMORY[0x1E4F27990]);
  v232 = (void (*)(uint64_t, void, uint64_t))v89;
  uint64_t v104 = v238;
  uint64_t v105 = sub_1DAD288B8();
  uint64_t v106 = v24;
  unint64_t v108 = v107;
  ((void (*)(char *, uint64_t))v213[1].isa)(v103, v104);
  uint64_t v242 = sub_1DA9DD8F4(v105, v108, (uint64_t *)&v243);
  sub_1DAD282B8();
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v232)(v96, v106);
  v109 = "none subscription: not sending updated archive immediately: %{public}s.%{public}s";
LABEL_17:
  _os_log_impl(&dword_1DA9D9000, v97, (os_log_type_t)v240, v109, (uint8_t *)v100, 0x16u);
  uint64_t v121 = (uint64_t)v241;
  swift_arrayDestroy();
  MEMORY[0x1E0180C50](v121, -1, -1);
  MEMORY[0x1E0180C50](v100, -1, -1);
LABEL_19:

LABEL_20:
  char v122 = 0;
  return v122 & 1;
}

uint64_t sub_1DAD1E768(uint64_t a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F0788);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DAD26908();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1DAD265B8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (unsigned int *)MEMORY[0x1E4F58770];
  if ((a2 & 1) == 0) {
    uint64_t v15 = (unsigned int *)MEMORY[0x1E4F58768];
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *v15, v7);
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_1DAA19E10((uint64_t)v10), (v17 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v6, *(void *)(a1 + 56) + *(void *)(v12 + 72) * v16, v11);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, v18, 1, v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_1DA9DD290((uint64_t)v6, &qword_1EA8F0788);
    if (qword_1EBE4C050 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1DAD23828();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EBE560E0);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_1DAD237F8();
    os_log_type_t v21 = sub_1DAD27D98();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v45[0] = v23;
      *(_DWORD *)uint64_t v22 = 67240450;
      LODWORD(v46) = a2 & 1;
      sub_1DAD282B8();
      *(_WORD *)(v22 + 8) = 2082;
      sub_1DAD1F798(&qword_1EA8EE068, MEMORY[0x1E4F58778]);
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_1DAD277C8();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_1DA9DD8F4(v24, v26, v45);
      sub_1DAD282B8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA9D9000, v20, v21, "full subscription: no budget, alerting %{BOOL,public}d, budgets %{public}s", (uint8_t *)v22, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x1E0180C50](v23, -1, -1);
      MEMORY[0x1E0180C50](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v6, v11);
  sub_1DAD1F798(&qword_1EA8F0790, MEMORY[0x1E4F586F0]);
  if (sub_1DAD267B8())
  {
    if (qword_1EBE4C050 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1DAD23828();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBE560E0);
    uint64_t v28 = sub_1DAD237F8();
    os_log_type_t v29 = sub_1DAD27DB8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v46 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      swift_beginAccess();
      sub_1DAD1F798(&qword_1EA8F0798, MEMORY[0x1E4F586F0]);
      uint64_t v32 = sub_1DAD288B8();
      uint64_t v44 = sub_1DA9DD8F4(v32, v33, &v46);
      sub_1DAD282B8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA9D9000, v28, v29, "full subscription: budget is exhausted, not sending updated archive immediately: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E0180C50](v31, -1, -1);
      MEMORY[0x1E0180C50](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  sub_1DAD267E8();
  sub_1DAD26988();
  if (qword_1EBE4C050 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_1DAD23828();
  __swift_project_value_buffer(v36, (uint64_t)qword_1EBE560E0);
  uint64_t v37 = sub_1DAD237F8();
  os_log_type_t v38 = sub_1DAD27DB8();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v46 = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    swift_beginAccess();
    sub_1DAD1F798(&qword_1EA8F0798, MEMORY[0x1E4F586F0]);
    uint64_t v41 = sub_1DAD288B8();
    uint64_t v44 = sub_1DA9DD8F4(v41, v42, &v46);
    sub_1DAD282B8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA9D9000, v37, v38, "full subscription: budget allows sending update immediately: %s", v39, 0xCu);
    uint64_t v34 = 1;
    swift_arrayDestroy();
    MEMORY[0x1E0180C50](v40, -1, -1);
    MEMORY[0x1E0180C50](v39, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 1;
  }
  return v34;
}

uint64_t sub_1DAD1EFD0(uint64_t a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F0788);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DAD26908();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1DAD265B8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0) {
    return 0;
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F58770], v7);
  if (*(void *)(a1 + 16) && (unint64_t v15 = sub_1DAA19E10((uint64_t)v10), (v16 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v6, *(void *)(a1 + 56) + *(void *)(v12 + 72) * v15, v11);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, v17, 1, v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_1DA9DD290((uint64_t)v6, &qword_1EA8F0788);
    if (qword_1EBE4C050 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1DAD23828();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBE560E0);
    uint64_t v19 = sub_1DAD237F8();
    os_log_type_t v20 = sub_1DAD27D98();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v21 = 67240192;
      int v40 = 1;
      sub_1DAD282B8();
      _os_log_impl(&dword_1DA9D9000, v19, v20, "full subscription: no budget, alerting %{BOOL,public}d", v21, 8u);
      MEMORY[0x1E0180C50](v21, -1, -1);
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v6, v11);
  sub_1DAD1F798(&qword_1EA8F0790, MEMORY[0x1E4F586F0]);
  if (sub_1DAD267B8())
  {
    if (qword_1EBE4C050 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1DAD23828();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBE560E0);
    uint64_t v23 = sub_1DAD237F8();
    os_log_type_t v24 = sub_1DAD27DB8();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v41 = v26;
      *(_DWORD *)unint64_t v25 = 136315138;
      swift_beginAccess();
      sub_1DAD1F798(&qword_1EA8F0798, MEMORY[0x1E4F586F0]);
      uint64_t v27 = sub_1DAD288B8();
      uint64_t v39 = sub_1DA9DD8F4(v27, v28, &v41);
      sub_1DAD282B8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA9D9000, v23, v24, "alerts subscription: budget is exhausted, not sending updated immediately:  %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E0180C50](v26, -1, -1);
      MEMORY[0x1E0180C50](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  sub_1DAD267E8();
  sub_1DAD26988();
  if (qword_1EBE4C050 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_1DAD23828();
  __swift_project_value_buffer(v31, (uint64_t)qword_1EBE560E0);
  uint64_t v32 = sub_1DAD237F8();
  os_log_type_t v33 = sub_1DAD27DB8();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v41 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    swift_beginAccess();
    sub_1DAD1F798(&qword_1EA8F0798, MEMORY[0x1E4F586F0]);
    uint64_t v36 = sub_1DAD288B8();
    uint64_t v39 = sub_1DA9DD8F4(v36, v37, &v41);
    sub_1DAD282B8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA9D9000, v32, v33, "alerts subscription: budget allows sending update archive immediately: %s", v34, 0xCu);
    uint64_t v29 = 1;
    swift_arrayDestroy();
    MEMORY[0x1E0180C50](v35, -1, -1);
    MEMORY[0x1E0180C50](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 1;
  }
  return v29;
}

uint64_t sub_1DAD1F724()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RemoteActivityArchiveBudgetScheduler()
{
  return self;
}

uint64_t sub_1DAD1F798(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DAD1F7E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = type metadata accessor for MobileActivityService();
  uint64_t v11 = &off_1F34F42A0;
  *(void *)&long long v9 = a2;
  *(void *)(a3 + 64) = objc_msgSend(objc_allocWithZone((Class)sub_1DAD22288()), sel_init);
  *(_OWORD *)(a3 + 72) = xmmword_1DAD38560;
  *(void *)(a3 + 88) = 0x40AC200000000000;
  type metadata accessor for UnfairLock();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  *(void *)(v6 + 16) = v7;
  *(void *)(a3 + 96) = v6;
  *(void *)(a3 + 16) = a1;
  sub_1DA9FA898(&v9, a3 + 24);
  return a3;
}

uint64_t sub_1DAD1F8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  type metadata accessor for RemoteActivityArchiveBudgetScheduler();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (uint64_t *)((char *)&v17[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = sub_1DAD1F7E0(a1, *v12, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v14;
}

uint64_t sub_1DAD1F9E8(unint64_t a1)
{
  uint64_t v1 = 1702195828;
  if ((a1 & 1) == 0) {
    uint64_t v1 = 0x65736C6166;
  }
  unint64_t v2 = HIDWORD(a1);
  uint64_t v4 = v1;
  swift_bridgeObjectRetain();
  sub_1DAD27A18();
  swift_bridgeObjectRelease();
  sub_1DAD21030(v2);
  swift_bridgeObjectRetain();
  sub_1DAD27A18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DAD1FAA8()
{
  return sub_1DAD1F9E8(*v0 | ((unint64_t)*((unsigned int *)v0 + 1) << 32));
}

BOOL sub_1DAD1FAB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_DWORD *)a1 + 1) == *((_DWORD *)a2 + 1);
}

id sub_1DAD1FAE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
  sub_1DAD22598();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_unknownObjectRetain();
  id v7 = a4;
  uint64_t v8 = (void *)sub_1DAD278E8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v8, a2, v7);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_1DAD1FBB8()
{
  unsigned int v1 = objc_msgSend(v0, sel_isAuthorizedForWidgetUpdates);
  return v1 | ((void)objc_msgSend(v0, sel_authorizationStatus) << 32);
}

uint64_t sub_1DAD1FC00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1DAD1FC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

unint64_t sub_1DAD1FC28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))() & 0xFFFFFFFF00000001;
}

uint64_t sub_1DAD1FC64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_1DAD1FC78()
{
  if (*(void *)&v0[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager])
  {
    __break(1u);
  }
  else
  {
    v1.receiver = v0;
    v1.super_class = (Class)swift_getObjectType();
    objc_msgSendSuper2(&v1, sel_dealloc);
  }
}

uint64_t sub_1DAD1FDC8()
{
  return type metadata accessor for _LocationAuthorizationMonitorImpl();
}

uint64_t type metadata accessor for _LocationAuthorizationMonitorImpl()
{
  uint64_t result = qword_1EBE4B8A0;
  if (!qword_1EBE4B8A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DAD1FE1C(char *a1)
{
  objc_super v1 = &a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager];
  if (*(void *)&a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager])
  {
    v3 = &a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler];
    uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler];
    *(void *)v3 = 0;
    *((void *)v3 + 1) = 0;
    sub_1DA9F5534(v4);
    if (*(void *)v1)
    {
      uint64_t v5 = *((void *)v1 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v5 + 24))(ObjectType, v5);
    }
    *(void *)objc_super v1 = 0;
    *((void *)v1 + 1) = 0;
    swift_unknownObjectRelease();
    if (qword_1EBE44070 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1DAD23828();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EBE55FD0);
    uint64_t v8 = a1;
    id v9 = sub_1DAD237F8();
    os_log_type_t v10 = sub_1DAD27D88();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136446210;
      uint64_t v15 = v12;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
      sub_1DAD211B0();
      uint64_t v13 = sub_1DAD288B8();
      sub_1DA9DD8F4(v13, v14, &v15);
      sub_1DAD282B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA9D9000, v9, v10, "[mon:%{public}s] invalidated", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E0180C50](v12, -1, -1);
      MEMORY[0x1E0180C50](v11, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_1DAD20064()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_lock];
  unint64_t v2 = *(os_unfair_lock_s **)(v1 + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_1DAD20138(v0, &v6);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 16));
  uint64_t result = swift_release();
  uint64_t v4 = v6;
  if (v6)
  {
    uint64_t v5 = &v0[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_containerIdentifier];
    swift_retain();
    v4(v5);
    sub_1DA9F5534((uint64_t)v4);
    return sub_1DA9F5534((uint64_t)v4);
  }
  return result;
}

void sub_1DAD20138(char *a1@<X0>, void *a2@<X8>)
{
  if (!*(void *)&a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager]) {
    goto LABEL_49;
  }
  v3 = a1;
  uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager + 8];
  uint64_t ObjectType = swift_getObjectType();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  swift_unknownObjectRetain();
  unint64_t v7 = v6(ObjectType, v4);
  unint64_t v8 = v7;
  unint64_t v9 = HIDWORD(v7);
  uint64_t v10 = OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_status;
  uint64_t v11 = *(void *)&v3[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_status];
  if (v11 == 2)
  {
    unint64_t v62 = HIDWORD(v7);
    uint64_t v70 = OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_status;
    if (qword_1EBE44070 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1DAD23828();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EBE55FD0);
    uint64_t v67 = v3;
    uint64_t v13 = v3;
    unint64_t v14 = sub_1DAD237F8();
    os_log_type_t v15 = sub_1DAD27DB8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v81 = v61;
      *(_DWORD *)uint64_t v16 = 136446466;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
      sub_1DAD211B0();
      uint64_t v17 = sub_1DAD288B8();
      sub_1DA9DD8F4(v17, v18, &v81);
      sub_1DAD282B8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      uint64_t v19 = 1702195828;
      if (v8)
      {
        unint64_t v20 = 0xE400000000000000;
      }
      else
      {
        uint64_t v19 = 0x65736C6166;
        unint64_t v20 = 0xE500000000000000;
      }
      uint64_t v74 = v19;
      swift_bridgeObjectRetain();
      sub_1DAD27A18();
      swift_bridgeObjectRelease();
      sub_1DAD21030(v62);
      swift_bridgeObjectRetain();
      sub_1DAD27A18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1DA9DD8F4(v74, v20, &v81);
      sub_1DAD282B8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA9D9000, v14, v15, "[mon:%{public}s] auth initialized to %{public}s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E0180C50](v61, -1, -1);
      MEMORY[0x1E0180C50](v16, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    v3 = v67;
    uint64_t v10 = v70;
LABEL_48:
    *(void *)&v3[v10] = v8 & 0xFFFFFFFF00000001;
LABEL_49:
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  if (((v7 ^ v11) & 1) == 0)
  {
    if (HIDWORD(v11) == HIDWORD(v7))
    {
      unint64_t v32 = HIDWORD(v7);
      uint64_t v72 = OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_status;
      if (qword_1EBE44070 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1DAD23828();
      __swift_project_value_buffer(v33, (uint64_t)qword_1EBE55FD0);
      uint64_t v34 = v3;
      uint64_t v35 = sub_1DAD237F8();
      os_log_type_t v36 = sub_1DAD27DA8();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        uint64_t v81 = v63;
        *(_DWORD *)uint64_t v37 = 136446466;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
        uint64_t v69 = v3;
        sub_1DAD211B0();
        uint64_t v38 = sub_1DAD288B8();
        sub_1DA9DD8F4(v38, v39, &v81);
        sub_1DAD282B8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2082;
        uint64_t v40 = 1702195828;
        if (v8)
        {
          unint64_t v41 = 0xE400000000000000;
        }
        else
        {
          uint64_t v40 = 0x65736C6166;
          unint64_t v41 = 0xE500000000000000;
        }
        uint64_t v77 = v40;
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        swift_bridgeObjectRelease();
        sub_1DAD21030(v32);
        unint64_t v80 = v41;
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        v3 = v69;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DA9DD8F4(v77, v80, &v81);
        sub_1DAD282B8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DA9D9000, v35, v36, "[mon:%{public}s] auth reported to change when it actually didn't : %{public}s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1E0180C50](v63, -1, -1);
        MEMORY[0x1E0180C50](v37, -1, -1);
        swift_unknownObjectRelease();

        uint64_t v10 = v72;
      }
      else
      {

        swift_unknownObjectRelease();
        uint64_t v10 = v72;
      }
    }
    else
    {
      unint64_t v64 = HIDWORD(v7);
      if (qword_1EBE44070 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_1DAD23828();
      __swift_project_value_buffer(v46, (uint64_t)qword_1EBE55FD0);
      uint64_t v47 = v3;
      v48 = sub_1DAD237F8();
      os_log_type_t v49 = sub_1DAD27DB8();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v66 = a2;
        uint64_t v50 = swift_slowAlloc();
        uint64_t typea = swift_slowAlloc();
        uint64_t v81 = typea;
        *(_DWORD *)uint64_t v50 = 136446722;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
        uint64_t v73 = v10;
        sub_1DAD211B0();
        uint64_t v51 = sub_1DAD288B8();
        sub_1DA9DD8F4(v51, v52, &v81);
        sub_1DAD282B8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 12) = 2082;
        uint64_t v53 = 1702195828;
        if (v11)
        {
          unint64_t v54 = 0xE400000000000000;
        }
        else
        {
          uint64_t v53 = 0x65736C6166;
          unint64_t v54 = 0xE500000000000000;
        }
        uint64_t v78 = v53;
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        swift_bridgeObjectRelease();
        sub_1DAD21030(SHIDWORD(v11));
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DA9DD8F4(v78, v54, &v81);
        sub_1DAD282B8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 22) = 2082;
        uint64_t v55 = 0x65736C6166;
        if (v8)
        {
          uint64_t v55 = 1702195828;
          unint64_t v56 = 0xE400000000000000;
        }
        else
        {
          unint64_t v56 = 0xE500000000000000;
        }
        uint64_t v79 = v55;
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        swift_bridgeObjectRelease();
        sub_1DAD21030(v64);
        swift_bridgeObjectRetain();
        sub_1DAD27A18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DA9DD8F4(v79, v56, &v81);
        sub_1DAD282B8();
        uint64_t v10 = v73;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DA9D9000, v48, v49, "[mon:%{public}s] auth changed from %{public}s to %{public}s", (uint8_t *)v50, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1E0180C50](typea, -1, -1);
        uint64_t v57 = v50;
        a2 = v66;
        MEMORY[0x1E0180C50](v57, -1, -1);
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    goto LABEL_48;
  }
  uint64_t v65 = (uint64_t (**)())a2;
  if (qword_1EBE44070 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1DAD23828();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBE55FD0);
  uint64_t v22 = v3;
  uint64_t v23 = sub_1DAD237F8();
  os_log_type_t type = sub_1DAD27DB8();
  if (os_log_type_enabled(v23, type))
  {
    uint64_t v71 = v10;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v81 = v58;
    *(_DWORD *)uint64_t v24 = 136446722;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
    v68 = v3;
    sub_1DAD211B0();
    uint64_t v25 = sub_1DAD288B8();
    sub_1DA9DD8F4(v25, v26, &v81);
    sub_1DAD282B8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    uint64_t v27 = 1702195828;
    if (v11)
    {
      unint64_t v28 = 0xE400000000000000;
    }
    else
    {
      uint64_t v27 = 0x65736C6166;
      unint64_t v28 = 0xE500000000000000;
    }
    uint64_t v75 = v27;
    swift_bridgeObjectRetain();
    sub_1DAD27A18();
    swift_bridgeObjectRelease();
    sub_1DAD21030(SHIDWORD(v11));
    swift_bridgeObjectRetain();
    sub_1DAD27A18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1DA9DD8F4(v75, v28, &v81);
    sub_1DAD282B8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2082;
    uint64_t v29 = 0x65736C6166;
    if (v8)
    {
      uint64_t v29 = 1702195828;
      unint64_t v30 = 0xE400000000000000;
    }
    else
    {
      unint64_t v30 = 0xE500000000000000;
    }
    uint64_t v76 = v29;
    swift_bridgeObjectRetain();
    sub_1DAD27A18();
    swift_bridgeObjectRelease();
    sub_1DAD21030(v9);
    swift_bridgeObjectRetain();
    sub_1DAD27A18();
    swift_bridgeObjectRelease();
    v3 = v68;
    swift_bridgeObjectRelease();
    sub_1DA9DD8F4(v76, v30, &v81);
    sub_1DAD282B8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA9D9000, v23, type, "[mon:%{public}s] auth changed from %{public}s to %{public}s", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1E0180C50](v58, -1, -1);
    uint64_t v31 = v24;
    uint64_t v10 = v71;
    MEMORY[0x1E0180C50](v31, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  *(void *)&v3[v10] = v8 & 0xFFFFFFFF00000001;
  uint64_t v42 = *(void *)&v22[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler];
  uint64_t v43 = *(void *)&v22[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler + 8];
  if (v42)
  {
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v42;
    *(void *)(v44 + 24) = v43;
    uint64_t v45 = sub_1DAC00EDC;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v44 = 0;
  }
  *uint64_t v65 = v45;
  v65[1] = (uint64_t (*)())v44;
  sub_1DAA0A310(v42);
}

void sub_1DAD20EC0()
{
  sub_1DABB9904();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocationAuthorizationMonitorStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[8]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LocationAuthorizationMonitorStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationAuthorizationMonitorStatus()
{
  return &type metadata for LocationAuthorizationMonitorStatus;
}

unint64_t sub_1DAD21030(int a1)
{
  unint64_t result = 0x7265746544746F6ELL;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x7463697274736572;
      break;
    case 2:
      unint64_t result = 0x6465696E6564;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      sub_1DAD288B8();
      sub_1DAD27A18();
      swift_bridgeObjectRelease();
      sub_1DAD27A18();
      unint64_t result = 40;
      break;
  }
  return result;
}

uint64_t sub_1DAD21178()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1DAD211B0()
{
  unint64_t result = qword_1EBE4BF50;
  if (!qword_1EBE4BF50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EBE4BF60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBE4BF50);
  }
  return result;
}

char *sub_1DAD2120C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v13 = (uint64_t *)&v7[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler];
  *uint64_t v13 = 0;
  v13[1] = 0;
  *(void *)&v7[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_status] = 2;
  unint64_t v14 = &v7[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager];
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_lock;
  type metadata accessor for UnfairLock();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v7;
  unint64_t v18 = (_DWORD *)swift_slowAlloc();
  *unint64_t v18 = 0;
  *(void *)(v16 + 16) = v18;
  *(void *)&v7[v15] = v16;
  *(void *)&v17[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__assertionCount] = 1;
  uint64_t v19 = &v17[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_containerIdentifier];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
  uint64_t v51 = *(void *)(v20 - 8);
  uint64_t v52 = v20;
  (*(void (**)(char *, uint64_t))(v51 + 16))(v19, a1);
  uint64_t v21 = *v13;
  *uint64_t v13 = a5;
  v13[1] = a6;
  swift_retain();
  sub_1DA9F5534(v21);

  v56.receiver = v17;
  v56.super_class = ObjectType;
  uint64_t v22 = (char *)objc_msgSendSuper2(&v56, sel_init);
  uint64_t v23 = OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_lock;
  uint64_t v24 = *(os_unfair_lock_s **)(*(void *)&v22[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_lock]
                             + 16);
  uint64_t v25 = v22;
  os_unfair_lock_lock(v24);
  unint64_t v26 = *(uint64_t (**)(uint64_t, char *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(a3 + 8);
  uint64_t v27 = v25;
  uint64_t v54 = a1;
  uint64_t v28 = v26(a1, v27, &off_1F34FC4B8, a4, a2, a3);
  uint64_t v30 = v29;

  uint64_t v31 = (uint64_t *)&v27[OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager];
  *uint64_t v31 = v28;
  v31[1] = v30;
  swift_unknownObjectRelease();
  if (!*v31)
  {
    if (qword_1EBE44070 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_1DAD23828();
    __swift_project_value_buffer(v42, (uint64_t)qword_1EBE55FD0);
    uint64_t v33 = v27;
    uint64_t v34 = sub_1DAD237F8();
    os_log_type_t v35 = sub_1DAD27D98();
    uint64_t v36 = v52;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v50 = v22;
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = v23;
      uint64_t v38 = swift_slowAlloc();
      uint64_t v55 = v38;
      *(_DWORD *)uint64_t v37 = 136446210;
      sub_1DAD211B0();
      uint64_t v43 = sub_1DAD288B8();
      sub_1DA9DD8F4(v43, v44, &v55);
      sub_1DAD282B8();

      swift_bridgeObjectRelease();
      unint64_t v41 = "[mon:%{public}s] failed to create";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (qword_1EBE44070 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_1DAD23828();
  __swift_project_value_buffer(v32, (uint64_t)qword_1EBE55FD0);
  uint64_t v33 = v27;
  uint64_t v34 = sub_1DAD237F8();
  os_log_type_t v35 = sub_1DAD27D88();
  uint64_t v36 = v52;
  if (!os_log_type_enabled(v34, v35)) {
    goto LABEL_11;
  }
  uint64_t v50 = v22;
  uint64_t v37 = (uint8_t *)swift_slowAlloc();
  uint64_t v48 = v23;
  uint64_t v38 = swift_slowAlloc();
  uint64_t v55 = v38;
  *(_DWORD *)uint64_t v37 = 136446210;
  sub_1DAD211B0();
  uint64_t v39 = sub_1DAD288B8();
  sub_1DA9DD8F4(v39, v40, &v55);
  sub_1DAD282B8();

  swift_bridgeObjectRelease();
  unint64_t v41 = "[mon:%{public}s] created";
LABEL_10:
  _os_log_impl(&dword_1DA9D9000, v34, v35, v41, v37, 0xCu);
  swift_arrayDestroy();
  uint64_t v45 = v38;
  uint64_t v23 = v48;
  MEMORY[0x1E0180C50](v45, -1, -1);
  uint64_t v46 = v37;
  uint64_t v22 = v50;
  MEMORY[0x1E0180C50](v46, -1, -1);

LABEL_12:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(*(void *)&v22[v23] + 16));

  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v54, v36);
  return v27;
}

void CHDRegisterForTemporaryFolder_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1DA9D9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error clearing temporary directory contents on startup: %@", (uint8_t *)&v1, 0xCu);
}

void CHDJetsamSetElevatedInactivePriority_cold_1(int a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = strerror(a1);
  _os_log_error_impl(&dword_1DA9D9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error raising Jetsam Inactive Priority: %s", (uint8_t *)&v1, 0xCu);
}

void ProactiveSuggestionClientModelLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ProactiveSuggestionClientModelLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TemporaryProactive.m", 15, @"%s", *a1);

  __break(1u);
}

void __getATXInfoTimelineEntryRelevanceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getATXInfoTimelineEntryRelevanceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TemporaryProactive.m", 18, @"Unable to find class %s", "ATXInfoTimelineEntryRelevance");

  __break(1u);
}

void __getATXInfoTimelineEntryClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getATXInfoTimelineEntryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TemporaryProactive.m", 17, @"Unable to find class %s", "ATXInfoTimelineEntry");

  __break(1u);
}

void __getATXInfoTimelineDonationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getATXInfoTimelineDonationClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TemporaryProactive.m", 16, @"Unable to find class %s", "ATXInfoTimelineDonationClient");

  __break(1u);
  sub_1DAD219E8();
}

uint64_t sub_1DAD219E8()
{
  return MEMORY[0x1F40E2D68]();
}

uint64_t sub_1DAD219F8()
{
  return MEMORY[0x1F40E2D70]();
}

uint64_t sub_1DAD21A08()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1DAD21A18()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1DAD21A28()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1DAD21A38()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1DAD21A48()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1DAD21A58()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1DAD21A68()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1DAD21A78()
{
  return MEMORY[0x1F40E3190]();
}

uint64_t sub_1DAD21A88()
{
  return MEMORY[0x1F40E31C8]();
}

uint64_t sub_1DAD21A98()
{
  return MEMORY[0x1F40E31D0]();
}

uint64_t sub_1DAD21AA8()
{
  return MEMORY[0x1F40E3250]();
}

uint64_t sub_1DAD21AB8()
{
  return MEMORY[0x1F40E3280]();
}

uint64_t sub_1DAD21AC8()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1DAD21AD8()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1DAD21AE8()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1DAD21AF8()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1DAD21B08()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1DAD21B18()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1DAD21B28()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1DAD21B38()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1DAD21B48()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_1DAD21B58()
{
  return MEMORY[0x1F40E3620]();
}

uint64_t sub_1DAD21B68()
{
  return MEMORY[0x1F40E3628]();
}

uint64_t sub_1DAD21B78()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1DAD21B88()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1DAD21B98()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1DAD21BA8()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1DAD21BB8()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1DAD21BC8()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1DAD21BD8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1DAD21BE8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1DAD21BF8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1DAD21C08()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1DAD21C18()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1DAD21C28()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_1DAD21C38()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1DAD21C48()
{
  return MEMORY[0x1F40E3F78]();
}

uint64_t sub_1DAD21C58()
{
  return MEMORY[0x1F40E3FF0]();
}

uint64_t sub_1DAD21C68()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1DAD21C78()
{
  return MEMORY[0x1F40E4138]();
}

uint64_t sub_1DAD21C88()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1DAD21C98()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1DAD21CA8()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1DAD21CB8()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1DAD21CC8()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1DAD21CD8()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1DAD21CE8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DAD21CF8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1DAD21D08()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1DAD21D18()
{
  return MEMORY[0x1F40E4878]();
}

uint64_t sub_1DAD21D28()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t sub_1DAD21D38()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1DAD21D48()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1DAD21D58()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1DAD21D68()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1DAD21D78()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1DAD21D88()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1DAD21D98()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1DAD21DA8()
{
  return MEMORY[0x1F40E4A10]();
}

uint64_t sub_1DAD21DB8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1DAD21DC8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1DAD21DD8()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1DAD21DE8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1DAD21DF8()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1DAD21E08()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DAD21E18()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1DAD21E28()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1DAD21E38()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DAD21E48()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1DAD21E58()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DAD21E68()
{
  return MEMORY[0x1F40E4E98]();
}

uint64_t sub_1DAD21E78()
{
  return MEMORY[0x1F40E4F08]();
}

uint64_t sub_1DAD21E88()
{
  return MEMORY[0x1F40E4F18]();
}

uint64_t sub_1DAD21E98()
{
  return MEMORY[0x1F40E4F28]();
}

uint64_t sub_1DAD21EA8()
{
  return MEMORY[0x1F40E4F38]();
}

uint64_t sub_1DAD21EB8()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1DAD21EC8()
{
  return MEMORY[0x1F40E5098]();
}

uint64_t sub_1DAD21ED8()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1DAD21EE8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1DAD21EF8()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1DAD21F08()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DAD21F18()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1DAD21F28()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1DAD21F38()
{
  return MEMORY[0x1F40E51C0]();
}

uint64_t sub_1DAD21F48()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1DAD21F58()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1DAD21F68()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1DAD21F78()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1DAD21F88()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1DAD21F98()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1DAD21FA8()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1DAD21FB8()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_1DAD21FC8()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1DAD21FD8()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1DAD21FE8()
{
  return MEMORY[0x1F40E5348]();
}

uint64_t sub_1DAD21FF8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1DAD22008()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DAD22018()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1DAD22028()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1DAD22038()
{
  return MEMORY[0x1F40E53B8]();
}

uint64_t sub_1DAD22048()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1DAD22058()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1DAD22068()
{
  return MEMORY[0x1F40E5430]();
}

uint64_t sub_1DAD22078()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1DAD22088()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DAD22098()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1DAD220A8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1DAD220B8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DAD220C8()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1DAD220D8()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1DAD220E8()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1DAD220F8()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1DAD22108()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1DAD22118()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1DAD22128()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1DAD22138()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1DAD22148()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1DAD22158()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1DAD22168()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_1DAD22178()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1DAD22188()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1DAD22198()
{
  return MEMORY[0x1F40D3228]();
}

uint64_t sub_1DAD221A8()
{
  return MEMORY[0x1F40D3238]();
}

uint64_t sub_1DAD221B8()
{
  return MEMORY[0x1F40D3240]();
}

uint64_t sub_1DAD221C8()
{
  return MEMORY[0x1F40D3248]();
}

uint64_t sub_1DAD221D8()
{
  return MEMORY[0x1F40D3268]();
}

uint64_t sub_1DAD221E8()
{
  return MEMORY[0x1F40D3270]();
}

uint64_t sub_1DAD221F8()
{
  return MEMORY[0x1F40D3278]();
}

uint64_t sub_1DAD22208()
{
  return MEMORY[0x1F40D3298]();
}

uint64_t sub_1DAD22218()
{
  return MEMORY[0x1F40D32E8]();
}

uint64_t sub_1DAD22228()
{
  return MEMORY[0x1F40D32F8]();
}

uint64_t sub_1DAD22238()
{
  return MEMORY[0x1F40D3300]();
}

uint64_t sub_1DAD22248()
{
  return MEMORY[0x1F40D3310]();
}

uint64_t sub_1DAD22258()
{
  return MEMORY[0x1F40D3338]();
}

uint64_t sub_1DAD22268()
{
  return MEMORY[0x1F40D3340]();
}

uint64_t sub_1DAD22278()
{
  return MEMORY[0x1F40D3398]();
}

uint64_t sub_1DAD22288()
{
  return MEMORY[0x1F40D33A0]();
}

uint64_t sub_1DAD22298()
{
  return MEMORY[0x1F40D33A8]();
}

uint64_t sub_1DAD222A8()
{
  return MEMORY[0x1F40D33F8]();
}

uint64_t sub_1DAD222B8()
{
  return MEMORY[0x1F40D3428]();
}

uint64_t sub_1DAD222C8()
{
  return MEMORY[0x1F40D3440]();
}

uint64_t sub_1DAD222D8()
{
  return MEMORY[0x1F40D3448]();
}

uint64_t sub_1DAD222E8()
{
  return MEMORY[0x1F40D3450]();
}

uint64_t sub_1DAD222F8()
{
  return MEMORY[0x1F40D3458]();
}

uint64_t sub_1DAD22308()
{
  return MEMORY[0x1F40D3608]();
}

uint64_t sub_1DAD22318()
{
  return MEMORY[0x1F40D3610]();
}

uint64_t sub_1DAD22328()
{
  return MEMORY[0x1F40D3680]();
}

uint64_t sub_1DAD22338()
{
  return MEMORY[0x1F40D3690]();
}

uint64_t sub_1DAD22348()
{
  return MEMORY[0x1F40D3698]();
}

uint64_t sub_1DAD22358()
{
  return MEMORY[0x1F40D36D0]();
}

uint64_t sub_1DAD22368()
{
  return MEMORY[0x1F40D36D8]();
}

uint64_t sub_1DAD22378()
{
  return MEMORY[0x1F40D3798]();
}

uint64_t sub_1DAD22388()
{
  return MEMORY[0x1F40D37A0]();
}

uint64_t sub_1DAD22398()
{
  return MEMORY[0x1F40D37F0]();
}

uint64_t sub_1DAD223A8()
{
  return MEMORY[0x1F40D3808]();
}

uint64_t sub_1DAD223B8()
{
  return MEMORY[0x1F40D3858]();
}

uint64_t sub_1DAD223C8()
{
  return MEMORY[0x1F40D3860]();
}

uint64_t sub_1DAD223D8()
{
  return MEMORY[0x1F40D38A8]();
}

uint64_t sub_1DAD223E8()
{
  return MEMORY[0x1F40D3900]();
}

uint64_t sub_1DAD223F8()
{
  return MEMORY[0x1F40D3920]();
}

uint64_t sub_1DAD22408()
{
  return MEMORY[0x1F40D3948]();
}

uint64_t sub_1DAD22418()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1DAD22428()
{
  return MEMORY[0x1F4111248]();
}

uint64_t sub_1DAD22438()
{
  return MEMORY[0x1F4111250]();
}

uint64_t sub_1DAD22448()
{
  return MEMORY[0x1F4111258]();
}

uint64_t sub_1DAD22458()
{
  return MEMORY[0x1F4111260]();
}

uint64_t sub_1DAD22468()
{
  return MEMORY[0x1F4111268]();
}

uint64_t sub_1DAD22478()
{
  return MEMORY[0x1F4111270]();
}

uint64_t sub_1DAD22488()
{
  return MEMORY[0x1F41112B8]();
}

uint64_t sub_1DAD22498()
{
  return MEMORY[0x1F41112C0]();
}

uint64_t sub_1DAD224A8()
{
  return MEMORY[0x1F41112C8]();
}

uint64_t sub_1DAD224B8()
{
  return MEMORY[0x1F41112D0]();
}

uint64_t sub_1DAD224C8()
{
  return MEMORY[0x1F41112D8]();
}

uint64_t sub_1DAD224D8()
{
  return MEMORY[0x1F4111330]();
}

uint64_t sub_1DAD224E8()
{
  return MEMORY[0x1F4111338]();
}

uint64_t sub_1DAD224F8()
{
  return MEMORY[0x1F4111340]();
}

uint64_t sub_1DAD22508()
{
  return MEMORY[0x1F4111348]();
}

uint64_t sub_1DAD22518()
{
  return MEMORY[0x1F4111350]();
}

uint64_t sub_1DAD22528()
{
  return MEMORY[0x1F4111388]();
}

uint64_t sub_1DAD22538()
{
  return MEMORY[0x1F4111398]();
}

uint64_t sub_1DAD22548()
{
  return MEMORY[0x1F41113A0]();
}

uint64_t sub_1DAD22558()
{
  return MEMORY[0x1F41113A8]();
}

uint64_t sub_1DAD22568()
{
  return MEMORY[0x1F41113B0]();
}

uint64_t sub_1DAD22578()
{
  return MEMORY[0x1F41113B8]();
}

uint64_t sub_1DAD22588()
{
  return MEMORY[0x1F41113C0]();
}

uint64_t sub_1DAD22598()
{
  return MEMORY[0x1F41113C8]();
}

uint64_t sub_1DAD225A8()
{
  return MEMORY[0x1F41113D0]();
}

uint64_t sub_1DAD225B8()
{
  return MEMORY[0x1F41113E0]();
}

uint64_t sub_1DAD225C8()
{
  return MEMORY[0x1F41113E8]();
}

uint64_t sub_1DAD225D8()
{
  return MEMORY[0x1F41113F8]();
}

uint64_t sub_1DAD225E8()
{
  return MEMORY[0x1F4111400]();
}

uint64_t sub_1DAD225F8()
{
  return MEMORY[0x1F4111408]();
}

uint64_t sub_1DAD22608()
{
  return MEMORY[0x1F4111418]();
}

uint64_t sub_1DAD22618()
{
  return MEMORY[0x1F4111420]();
}

uint64_t sub_1DAD22628()
{
  return MEMORY[0x1F4111428]();
}

uint64_t sub_1DAD22638()
{
  return MEMORY[0x1F4111430]();
}

uint64_t sub_1DAD22648()
{
  return MEMORY[0x1F4111440]();
}

uint64_t sub_1DAD22658()
{
  return MEMORY[0x1F4111448]();
}

uint64_t sub_1DAD22668()
{
  return MEMORY[0x1F4111450]();
}

uint64_t sub_1DAD22678()
{
  return MEMORY[0x1F4111458]();
}

uint64_t sub_1DAD22688()
{
  return MEMORY[0x1F4111460]();
}

uint64_t sub_1DAD22698()
{
  return MEMORY[0x1F4111468]();
}

uint64_t sub_1DAD226A8()
{
  return MEMORY[0x1F4111470]();
}

uint64_t sub_1DAD226B8()
{
  return MEMORY[0x1F4111478]();
}

uint64_t sub_1DAD226C8()
{
  return MEMORY[0x1F4111480]();
}

uint64_t sub_1DAD226D8()
{
  return MEMORY[0x1F4111488]();
}

uint64_t sub_1DAD226E8()
{
  return MEMORY[0x1F4111490]();
}

uint64_t sub_1DAD226F8()
{
  return MEMORY[0x1F4111498]();
}

uint64_t sub_1DAD22708()
{
  return MEMORY[0x1F41114A0]();
}

uint64_t sub_1DAD22718()
{
  return MEMORY[0x1F41114B8]();
}

uint64_t sub_1DAD22728()
{
  return MEMORY[0x1F41114C8]();
}

uint64_t sub_1DAD22738()
{
  return MEMORY[0x1F41114D0]();
}

uint64_t sub_1DAD22748()
{
  return MEMORY[0x1F41114D8]();
}

uint64_t sub_1DAD22758()
{
  return MEMORY[0x1F41114E0]();
}

uint64_t sub_1DAD22768()
{
  return MEMORY[0x1F41114E8]();
}

uint64_t sub_1DAD22778()
{
  return MEMORY[0x1F41114F0]();
}

uint64_t sub_1DAD22788()
{
  return MEMORY[0x1F41114F8]();
}

uint64_t sub_1DAD22798()
{
  return MEMORY[0x1F4111500]();
}

uint64_t sub_1DAD227A8()
{
  return MEMORY[0x1F4111508]();
}

uint64_t sub_1DAD227B8()
{
  return MEMORY[0x1F4111510]();
}

uint64_t sub_1DAD227C8()
{
  return MEMORY[0x1F4111518]();
}

uint64_t sub_1DAD227D8()
{
  return MEMORY[0x1F4111528]();
}

uint64_t sub_1DAD227E8()
{
  return MEMORY[0x1F4111540]();
}

uint64_t sub_1DAD227F8()
{
  return MEMORY[0x1F4111548]();
}

uint64_t sub_1DAD22808()
{
  return MEMORY[0x1F4111550]();
}

uint64_t sub_1DAD22818()
{
  return MEMORY[0x1F4111558]();
}

uint64_t sub_1DAD22828()
{
  return MEMORY[0x1F4111560]();
}

uint64_t sub_1DAD22838()
{
  return MEMORY[0x1F4111568]();
}

uint64_t sub_1DAD22848()
{
  return MEMORY[0x1F4111570]();
}

uint64_t sub_1DAD22858()
{
  return MEMORY[0x1F4111578]();
}

uint64_t sub_1DAD22868()
{
  return MEMORY[0x1F4111588]();
}

uint64_t sub_1DAD22878()
{
  return MEMORY[0x1F4111598]();
}

uint64_t sub_1DAD22888()
{
  return MEMORY[0x1F41115A0]();
}

uint64_t sub_1DAD22898()
{
  return MEMORY[0x1F41115A8]();
}

uint64_t sub_1DAD228A8()
{
  return MEMORY[0x1F41115B0]();
}

uint64_t sub_1DAD228B8()
{
  return MEMORY[0x1F41115B8]();
}

uint64_t sub_1DAD228C8()
{
  return MEMORY[0x1F41115C0]();
}

uint64_t sub_1DAD228D8()
{
  return MEMORY[0x1F41115D8]();
}

uint64_t sub_1DAD228E8()
{
  return MEMORY[0x1F41115E0]();
}

uint64_t sub_1DAD228F8()
{
  return MEMORY[0x1F41115E8]();
}

uint64_t sub_1DAD22908()
{
  return MEMORY[0x1F41115F0]();
}

uint64_t sub_1DAD22918()
{
  return MEMORY[0x1F41115F8]();
}

uint64_t sub_1DAD22928()
{
  return MEMORY[0x1F4111600]();
}

uint64_t sub_1DAD22938()
{
  return MEMORY[0x1F4111608]();
}

uint64_t sub_1DAD22948()
{
  return MEMORY[0x1F4111610]();
}

uint64_t sub_1DAD22958()
{
  return MEMORY[0x1F4111620]();
}

uint64_t sub_1DAD22968()
{
  return MEMORY[0x1F4111628]();
}

uint64_t sub_1DAD22978()
{
  return MEMORY[0x1F4111630]();
}

uint64_t sub_1DAD22988()
{
  return MEMORY[0x1F4111638]();
}

uint64_t sub_1DAD22998()
{
  return MEMORY[0x1F4111640]();
}

uint64_t sub_1DAD229A8()
{
  return MEMORY[0x1F4111648]();
}

uint64_t sub_1DAD229B8()
{
  return MEMORY[0x1F4111650]();
}

uint64_t sub_1DAD229C8()
{
  return MEMORY[0x1F4111668]();
}

uint64_t sub_1DAD229D8()
{
  return MEMORY[0x1F4111670]();
}

uint64_t sub_1DAD229E8()
{
  return MEMORY[0x1F4111678]();
}

uint64_t sub_1DAD229F8()
{
  return MEMORY[0x1F4111680]();
}

uint64_t sub_1DAD22A08()
{
  return MEMORY[0x1F4111688]();
}

uint64_t sub_1DAD22A18()
{
  return MEMORY[0x1F4111690]();
}

uint64_t sub_1DAD22A28()
{
  return MEMORY[0x1F4111698]();
}

uint64_t sub_1DAD22A38()
{
  return MEMORY[0x1F41116A0]();
}

uint64_t sub_1DAD22A48()
{
  return MEMORY[0x1F41116A8]();
}

uint64_t sub_1DAD22A58()
{
  return MEMORY[0x1F41116B0]();
}

uint64_t sub_1DAD22A68()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1DAD22A78()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1DAD22A88()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1DAD22A98()
{
  return MEMORY[0x1F4176BE8]();
}

uint64_t sub_1DAD22AA8()
{
  return MEMORY[0x1F4176BF0]();
}

uint64_t sub_1DAD22AB8()
{
  return MEMORY[0x1F4176BF8]();
}

uint64_t sub_1DAD22AC8()
{
  return MEMORY[0x1F4176C00]();
}

uint64_t sub_1DAD22AD8()
{
  return MEMORY[0x1F4176C08]();
}

uint64_t sub_1DAD22AE8()
{
  return MEMORY[0x1F4176C10]();
}

uint64_t sub_1DAD22AF8()
{
  return MEMORY[0x1F4176C18]();
}

uint64_t sub_1DAD22B08()
{
  return MEMORY[0x1F4176C20]();
}

uint64_t sub_1DAD22B18()
{
  return MEMORY[0x1F4176C28]();
}

uint64_t sub_1DAD22B28()
{
  return MEMORY[0x1F4176C30]();
}

uint64_t sub_1DAD22B38()
{
  return MEMORY[0x1F4176C38]();
}

uint64_t sub_1DAD22B48()
{
  return MEMORY[0x1F4176C40]();
}

uint64_t sub_1DAD22B58()
{
  return MEMORY[0x1F4176C48]();
}

uint64_t sub_1DAD22B68()
{
  return MEMORY[0x1F4176C50]();
}

uint64_t sub_1DAD22B78()
{
  return MEMORY[0x1F410C800]();
}

uint64_t sub_1DAD22B88()
{
  return MEMORY[0x1F410C808]();
}

uint64_t sub_1DAD22B98()
{
  return MEMORY[0x1F4111800]();
}

uint64_t sub_1DAD22BA8()
{
  return MEMORY[0x1F4111808]();
}

uint64_t sub_1DAD22BB8()
{
  return MEMORY[0x1F4111810]();
}

uint64_t sub_1DAD22BC8()
{
  return MEMORY[0x1F4111818]();
}

uint64_t sub_1DAD22BD8()
{
  return MEMORY[0x1F4111820]();
}

uint64_t sub_1DAD22BE8()
{
  return MEMORY[0x1F4111828]();
}

uint64_t sub_1DAD22BF8()
{
  return MEMORY[0x1F4111830]();
}

uint64_t sub_1DAD22C08()
{
  return MEMORY[0x1F4111838]();
}

uint64_t sub_1DAD22C18()
{
  return MEMORY[0x1F41498B8]();
}

uint64_t sub_1DAD22C28()
{
  return MEMORY[0x1F41498C0]();
}

uint64_t sub_1DAD22C38()
{
  return MEMORY[0x1F41498C8]();
}

uint64_t sub_1DAD22C48()
{
  return MEMORY[0x1F41498D0]();
}

uint64_t sub_1DAD22C58()
{
  return MEMORY[0x1F4149900]();
}

uint64_t sub_1DAD22C68()
{
  return MEMORY[0x1F4149920]();
}

uint64_t sub_1DAD22C78()
{
  return MEMORY[0x1F4149928]();
}

uint64_t sub_1DAD22C88()
{
  return MEMORY[0x1F4149930]();
}

uint64_t sub_1DAD22C98()
{
  return MEMORY[0x1F4149940]();
}

uint64_t sub_1DAD22CA8()
{
  return MEMORY[0x1F4149948]();
}

uint64_t sub_1DAD22CB8()
{
  return MEMORY[0x1F4149958]();
}

uint64_t sub_1DAD22CC8()
{
  return MEMORY[0x1F4149960]();
}

uint64_t sub_1DAD22CD8()
{
  return MEMORY[0x1F4149968]();
}

uint64_t sub_1DAD22CE8()
{
  return MEMORY[0x1F4149970]();
}

uint64_t sub_1DAD22CF8()
{
  return MEMORY[0x1F4149978]();
}

uint64_t sub_1DAD22D08()
{
  return MEMORY[0x1F414A850]();
}

uint64_t sub_1DAD22D18()
{
  return MEMORY[0x1F414A858]();
}

uint64_t sub_1DAD22D28()
{
  return MEMORY[0x1F414A860]();
}

uint64_t sub_1DAD22D38()
{
  return MEMORY[0x1F4106868]();
}

uint64_t sub_1DAD22D48()
{
  return MEMORY[0x1F4106870]();
}

uint64_t sub_1DAD22D58()
{
  return MEMORY[0x1F4106878]();
}

uint64_t sub_1DAD22D68()
{
  return MEMORY[0x1F4106880]();
}

uint64_t sub_1DAD22D78()
{
  return MEMORY[0x1F4106888]();
}

uint64_t sub_1DAD22D88()
{
  return MEMORY[0x1F4106890]();
}

uint64_t sub_1DAD22D98()
{
  return MEMORY[0x1F4106898]();
}

uint64_t sub_1DAD22DA8()
{
  return MEMORY[0x1F41068A0]();
}

uint64_t sub_1DAD22DB8()
{
  return MEMORY[0x1F41068A8]();
}

uint64_t sub_1DAD22DC8()
{
  return MEMORY[0x1F41068B0]();
}

uint64_t sub_1DAD22DD8()
{
  return MEMORY[0x1F41068B8]();
}

uint64_t sub_1DAD22DE8()
{
  return MEMORY[0x1F41068C0]();
}

uint64_t sub_1DAD22DF8()
{
  return MEMORY[0x1F41068C8]();
}

uint64_t sub_1DAD22E08()
{
  return MEMORY[0x1F41068D0]();
}

uint64_t sub_1DAD22E18()
{
  return MEMORY[0x1F41068D8]();
}

uint64_t sub_1DAD22E28()
{
  return MEMORY[0x1F41068E0]();
}

uint64_t sub_1DAD22E38()
{
  return MEMORY[0x1F41068E8]();
}

uint64_t sub_1DAD22E48()
{
  return MEMORY[0x1F41068F0]();
}

uint64_t sub_1DAD22E58()
{
  return MEMORY[0x1F41068F8]();
}

uint64_t sub_1DAD22E68()
{
  return MEMORY[0x1F4106900]();
}

uint64_t sub_1DAD22E78()
{
  return MEMORY[0x1F4106908]();
}

uint64_t sub_1DAD22E88()
{
  return MEMORY[0x1F4106910]();
}

uint64_t sub_1DAD22E98()
{
  return MEMORY[0x1F4106918]();
}

uint64_t sub_1DAD22EA8()
{
  return MEMORY[0x1F4106920]();
}

uint64_t sub_1DAD22EB8()
{
  return MEMORY[0x1F4106928]();
}

uint64_t sub_1DAD22EC8()
{
  return MEMORY[0x1F4106930]();
}

uint64_t sub_1DAD22ED8()
{
  return MEMORY[0x1F4106938]();
}

uint64_t sub_1DAD22EE8()
{
  return MEMORY[0x1F4106940]();
}

uint64_t sub_1DAD22EF8()
{
  return MEMORY[0x1F4106948]();
}

uint64_t sub_1DAD22F08()
{
  return MEMORY[0x1F4106950]();
}

uint64_t sub_1DAD22F18()
{
  return MEMORY[0x1F4106958]();
}

uint64_t sub_1DAD22F28()
{
  return MEMORY[0x1F4106960]();
}

uint64_t sub_1DAD22F38()
{
  return MEMORY[0x1F4106968]();
}

uint64_t sub_1DAD22F48()
{
  return MEMORY[0x1F4106970]();
}

uint64_t sub_1DAD22F58()
{
  return MEMORY[0x1F4106978]();
}

uint64_t sub_1DAD22F68()
{
  return MEMORY[0x1F4106980]();
}

uint64_t sub_1DAD22F78()
{
  return MEMORY[0x1F4106988]();
}

uint64_t sub_1DAD22F88()
{
  return MEMORY[0x1F4106990]();
}

uint64_t sub_1DAD22F98()
{
  return MEMORY[0x1F4106998]();
}

uint64_t sub_1DAD22FA8()
{
  return MEMORY[0x1F41069A0]();
}

uint64_t sub_1DAD22FB8()
{
  return MEMORY[0x1F41069A8]();
}

uint64_t sub_1DAD22FC8()
{
  return MEMORY[0x1F41069B0]();
}

uint64_t sub_1DAD22FD8()
{
  return MEMORY[0x1F41069B8]();
}

uint64_t sub_1DAD22FE8()
{
  return MEMORY[0x1F41069C0]();
}

uint64_t sub_1DAD22FF8()
{
  return MEMORY[0x1F41069C8]();
}

uint64_t sub_1DAD23008()
{
  return MEMORY[0x1F41069D0]();
}

uint64_t sub_1DAD23018()
{
  return MEMORY[0x1F41069D8]();
}

uint64_t sub_1DAD23028()
{
  return MEMORY[0x1F41069E0]();
}

uint64_t sub_1DAD23038()
{
  return MEMORY[0x1F41069E8]();
}

uint64_t sub_1DAD23048()
{
  return MEMORY[0x1F41069F0]();
}

uint64_t sub_1DAD23058()
{
  return MEMORY[0x1F41069F8]();
}

uint64_t sub_1DAD23068()
{
  return MEMORY[0x1F4106A00]();
}

uint64_t sub_1DAD23078()
{
  return MEMORY[0x1F4149980]();
}

uint64_t sub_1DAD23088()
{
  return MEMORY[0x1F4149988]();
}

uint64_t sub_1DAD23098()
{
  return MEMORY[0x1F4149990]();
}

uint64_t sub_1DAD230A8()
{
  return MEMORY[0x1F4149998]();
}

uint64_t sub_1DAD230B8()
{
  return MEMORY[0x1F41499A0]();
}

uint64_t sub_1DAD230C8()
{
  return MEMORY[0x1F41499A8]();
}

uint64_t sub_1DAD230D8()
{
  return MEMORY[0x1F41499B0]();
}

uint64_t sub_1DAD230E8()
{
  return MEMORY[0x1F41499B8]();
}

uint64_t sub_1DAD230F8()
{
  return MEMORY[0x1F41499C0]();
}

uint64_t sub_1DAD23108()
{
  return MEMORY[0x1F41499C8]();
}

uint64_t sub_1DAD23118()
{
  return MEMORY[0x1F41499D0]();
}

uint64_t sub_1DAD23128()
{
  return MEMORY[0x1F41499D8]();
}

uint64_t sub_1DAD23138()
{
  return MEMORY[0x1F41499E0]();
}

uint64_t sub_1DAD23148()
{
  return MEMORY[0x1F41499E8]();
}

uint64_t sub_1DAD23158()
{
  return MEMORY[0x1F41499F0]();
}

uint64_t sub_1DAD23168()
{
  return MEMORY[0x1F41499F8]();
}

uint64_t sub_1DAD23178()
{
  return MEMORY[0x1F4149A00]();
}

uint64_t sub_1DAD23188()
{
  return MEMORY[0x1F4149A08]();
}

uint64_t sub_1DAD23198()
{
  return MEMORY[0x1F4149A10]();
}

uint64_t sub_1DAD231A8()
{
  return MEMORY[0x1F4149A18]();
}

uint64_t sub_1DAD231B8()
{
  return MEMORY[0x1F4149A20]();
}

uint64_t sub_1DAD231C8()
{
  return MEMORY[0x1F4149A28]();
}

uint64_t sub_1DAD231D8()
{
  return MEMORY[0x1F4149A30]();
}

uint64_t sub_1DAD231E8()
{
  return MEMORY[0x1F4149A38]();
}

uint64_t sub_1DAD231F8()
{
  return MEMORY[0x1F4149A40]();
}

uint64_t sub_1DAD23208()
{
  return MEMORY[0x1F4149A48]();
}

uint64_t sub_1DAD23218()
{
  return MEMORY[0x1F4149A50]();
}

uint64_t sub_1DAD23228()
{
  return MEMORY[0x1F4149A58]();
}

uint64_t sub_1DAD23238()
{
  return MEMORY[0x1F4149A60]();
}

uint64_t sub_1DAD23248()
{
  return MEMORY[0x1F4149A68]();
}

uint64_t sub_1DAD23258()
{
  return MEMORY[0x1F4149A70]();
}

uint64_t sub_1DAD23268()
{
  return MEMORY[0x1F4149A78]();
}

uint64_t sub_1DAD23278()
{
  return MEMORY[0x1F4149A80]();
}

uint64_t sub_1DAD23288()
{
  return MEMORY[0x1F4149A88]();
}

uint64_t sub_1DAD23298()
{
  return MEMORY[0x1F4149A90]();
}

uint64_t sub_1DAD232A8()
{
  return MEMORY[0x1F4149A98]();
}

uint64_t sub_1DAD232B8()
{
  return MEMORY[0x1F4149AA0]();
}

uint64_t sub_1DAD232C8()
{
  return MEMORY[0x1F4149AA8]();
}

uint64_t sub_1DAD232D8()
{
  return MEMORY[0x1F4149AB0]();
}

uint64_t sub_1DAD232E8()
{
  return MEMORY[0x1F4149AB8]();
}

uint64_t sub_1DAD232F8()
{
  return MEMORY[0x1F4149AC0]();
}

uint64_t sub_1DAD23308()
{
  return MEMORY[0x1F4149AC8]();
}

uint64_t sub_1DAD23318()
{
  return MEMORY[0x1F4149AD0]();
}

uint64_t sub_1DAD23328()
{
  return MEMORY[0x1F4149AD8]();
}

uint64_t sub_1DAD23338()
{
  return MEMORY[0x1F4149AE0]();
}

uint64_t sub_1DAD23348()
{
  return MEMORY[0x1F4149AE8]();
}

uint64_t sub_1DAD23358()
{
  return MEMORY[0x1F4149AF0]();
}

uint64_t sub_1DAD23368()
{
  return MEMORY[0x1F4149AF8]();
}

uint64_t sub_1DAD23378()
{
  return MEMORY[0x1F4149B00]();
}

uint64_t sub_1DAD23388()
{
  return MEMORY[0x1F4149B08]();
}

uint64_t sub_1DAD23398()
{
  return MEMORY[0x1F4149B10]();
}

uint64_t sub_1DAD233A8()
{
  return MEMORY[0x1F4149B18]();
}

uint64_t sub_1DAD233B8()
{
  return MEMORY[0x1F4149B20]();
}

uint64_t sub_1DAD233C8()
{
  return MEMORY[0x1F4149B28]();
}

uint64_t sub_1DAD233D8()
{
  return MEMORY[0x1F4149B30]();
}

uint64_t sub_1DAD233E8()
{
  return MEMORY[0x1F4149B40]();
}

uint64_t sub_1DAD233F8()
{
  return MEMORY[0x1F4149B48]();
}

uint64_t sub_1DAD23408()
{
  return MEMORY[0x1F4149B58]();
}

uint64_t sub_1DAD23418()
{
  return MEMORY[0x1F4149B60]();
}

uint64_t sub_1DAD23428()
{
  return MEMORY[0x1F4149B68]();
}

uint64_t sub_1DAD23438()
{
  return MEMORY[0x1F4149B70]();
}

uint64_t sub_1DAD23448()
{
  return MEMORY[0x1F4149B80]();
}

uint64_t sub_1DAD23458()
{
  return MEMORY[0x1F4149B88]();
}

uint64_t sub_1DAD23468()
{
  return MEMORY[0x1F4149B90]();
}

uint64_t sub_1DAD23478()
{
  return MEMORY[0x1F4149B98]();
}

uint64_t sub_1DAD23488()
{
  return MEMORY[0x1F4149BA0]();
}

uint64_t sub_1DAD23498()
{
  return MEMORY[0x1F4149BA8]();
}

uint64_t sub_1DAD234A8()
{
  return MEMORY[0x1F4149BB0]();
}

uint64_t sub_1DAD234B8()
{
  return MEMORY[0x1F4149BB8]();
}

uint64_t sub_1DAD234C8()
{
  return MEMORY[0x1F4149BC0]();
}

uint64_t sub_1DAD234D8()
{
  return MEMORY[0x1F4149BC8]();
}

uint64_t sub_1DAD234E8()
{
  return MEMORY[0x1F4149BD0]();
}

uint64_t sub_1DAD234F8()
{
  return MEMORY[0x1F4149BD8]();
}

uint64_t sub_1DAD23508()
{
  return MEMORY[0x1F4149BE0]();
}

uint64_t sub_1DAD23518()
{
  return MEMORY[0x1F4149BE8]();
}

uint64_t sub_1DAD23528()
{
  return MEMORY[0x1F4149BF0]();
}

uint64_t sub_1DAD23538()
{
  return MEMORY[0x1F4149BF8]();
}

uint64_t sub_1DAD23548()
{
  return MEMORY[0x1F4149C00]();
}

uint64_t sub_1DAD23558()
{
  return MEMORY[0x1F4149C08]();
}

uint64_t sub_1DAD23568()
{
  return MEMORY[0x1F4149C10]();
}

uint64_t sub_1DAD23578()
{
  return MEMORY[0x1F4149C18]();
}

uint64_t sub_1DAD23588()
{
  return MEMORY[0x1F4149C20]();
}

uint64_t sub_1DAD23598()
{
  return MEMORY[0x1F4149C28]();
}

uint64_t sub_1DAD235A8()
{
  return MEMORY[0x1F4149C30]();
}

uint64_t sub_1DAD235B8()
{
  return MEMORY[0x1F4149C38]();
}

uint64_t sub_1DAD235C8()
{
  return MEMORY[0x1F4149C40]();
}

uint64_t sub_1DAD235D8()
{
  return MEMORY[0x1F4149C48]();
}

uint64_t sub_1DAD235E8()
{
  return MEMORY[0x1F4149C50]();
}

uint64_t sub_1DAD235F8()
{
  return MEMORY[0x1F4149C58]();
}

uint64_t sub_1DAD23608()
{
  return MEMORY[0x1F4149C60]();
}

uint64_t sub_1DAD23618()
{
  return MEMORY[0x1F4149C68]();
}

uint64_t sub_1DAD23628()
{
  return MEMORY[0x1F4149C70]();
}

uint64_t sub_1DAD23638()
{
  return MEMORY[0x1F4149C78]();
}

uint64_t sub_1DAD23648()
{
  return MEMORY[0x1F4149C80]();
}

uint64_t sub_1DAD23658()
{
  return MEMORY[0x1F4149C88]();
}

uint64_t sub_1DAD23668()
{
  return MEMORY[0x1F4149C90]();
}

uint64_t sub_1DAD23678()
{
  return MEMORY[0x1F4149C98]();
}

uint64_t sub_1DAD23688()
{
  return MEMORY[0x1F4149CA0]();
}

uint64_t sub_1DAD23698()
{
  return MEMORY[0x1F4149CA8]();
}

uint64_t sub_1DAD236A8()
{
  return MEMORY[0x1F4149CB0]();
}

uint64_t sub_1DAD236B8()
{
  return MEMORY[0x1F4149CB8]();
}

uint64_t sub_1DAD236C8()
{
  return MEMORY[0x1F4149CC0]();
}

uint64_t sub_1DAD236D8()
{
  return MEMORY[0x1F4149CC8]();
}

uint64_t sub_1DAD236E8()
{
  return MEMORY[0x1F4149CD0]();
}

uint64_t sub_1DAD236F8()
{
  return MEMORY[0x1F4149CD8]();
}

uint64_t sub_1DAD23708()
{
  return MEMORY[0x1F4149CE0]();
}

uint64_t sub_1DAD23718()
{
  return MEMORY[0x1F4149CE8]();
}

uint64_t sub_1DAD23728()
{
  return MEMORY[0x1F4149CF0]();
}

uint64_t sub_1DAD23738()
{
  return MEMORY[0x1F4149CF8]();
}

uint64_t sub_1DAD23748()
{
  return MEMORY[0x1F4149D00]();
}

uint64_t sub_1DAD23758()
{
  return MEMORY[0x1F4149D08]();
}

uint64_t sub_1DAD23768()
{
  return MEMORY[0x1F4149D10]();
}

uint64_t sub_1DAD23778()
{
  return MEMORY[0x1F4149D18]();
}

uint64_t sub_1DAD23788()
{
  return MEMORY[0x1F4149D20]();
}

uint64_t sub_1DAD23798()
{
  return MEMORY[0x1F4149D28]();
}

uint64_t sub_1DAD237A8()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1DAD237B8()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1DAD237C8()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1DAD237D8()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1DAD237E8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1DAD237F8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DAD23808()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DAD23818()
{
  return MEMORY[0x1F4188690]();
}

uint64_t sub_1DAD23828()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DAD23838()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1DAD23848()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1DAD23858()
{
  return MEMORY[0x1F41884D0]();
}

uint64_t sub_1DAD23868()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1DAD23878()
{
  return MEMORY[0x1F40D6780]();
}

uint64_t sub_1DAD23888()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1DAD23898()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1DAD238A8()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1DAD238B8()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1DAD238C8()
{
  return MEMORY[0x1F40D68B8]();
}

uint64_t sub_1DAD238D8()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1DAD238E8()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1DAD238F8()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t sub_1DAD23908()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1DAD23918()
{
  return MEMORY[0x1F40D6948]();
}

uint64_t sub_1DAD23928()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1DAD23938()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1DAD23948()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1DAD23958()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t sub_1DAD23968()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1DAD23978()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1DAD23988()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1DAD23998()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1DAD239A8()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1DAD239B8()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1DAD239C8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1DAD239D8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1DAD239E8()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1DAD239F8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1DAD23A08()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1DAD23A18()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1DAD23A28()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t sub_1DAD23A38()
{
  return MEMORY[0x1F40D6BF8]();
}

uint64_t sub_1DAD23A48()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1DAD23A58()
{
  return MEMORY[0x1F40D6C90]();
}

uint64_t sub_1DAD23A68()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1DAD23A78()
{
  return MEMORY[0x1F40D6CB0]();
}

uint64_t sub_1DAD23A88()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1DAD23A98()
{
  return MEMORY[0x1F40D6CC8]();
}

uint64_t sub_1DAD23AA8()
{
  return MEMORY[0x1F40D6CD0]();
}

uint64_t sub_1DAD23AB8()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1DAD23AC8()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1DAD23AD8()
{
  return MEMORY[0x1F40D6D88]();
}

uint64_t sub_1DAD23AE8()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1DAD23AF8()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1DAD23B08()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1DAD23B18()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1DAD23B28()
{
  return MEMORY[0x1F40F2398]();
}

uint64_t sub_1DAD23B38()
{
  return MEMORY[0x1F40F23A0]();
}

uint64_t sub_1DAD23B48()
{
  return MEMORY[0x1F40F23A8]();
}

uint64_t sub_1DAD23B58()
{
  return MEMORY[0x1F40F23C0]();
}

uint64_t sub_1DAD23B68()
{
  return MEMORY[0x1F40F23C8]();
}

uint64_t sub_1DAD23B78()
{
  return MEMORY[0x1F40F26F8]();
}

uint64_t sub_1DAD23B88()
{
  return MEMORY[0x1F40F2700]();
}

uint64_t sub_1DAD23B98()
{
  return MEMORY[0x1F40F2708]();
}

uint64_t sub_1DAD23BA8()
{
  return MEMORY[0x1F40F8040]();
}

uint64_t sub_1DAD23BB8()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1DAD23BC8()
{
  return MEMORY[0x1F40F8180]();
}

uint64_t sub_1DAD23BD8()
{
  return MEMORY[0x1F40F8288]();
}

uint64_t sub_1DAD23BE8()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1DAD23BF8()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1DAD23C08()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1DAD23C18()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1DAD23C28()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1DAD23C38()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1DAD23C48()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1DAD23C58()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1DAD23C68()
{
  return MEMORY[0x1F40F8E38]();
}

uint64_t sub_1DAD23C78()
{
  return MEMORY[0x1F40F8E50]();
}

uint64_t sub_1DAD23C88()
{
  return MEMORY[0x1F40F8E70]();
}

uint64_t sub_1DAD23C98()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1DAD23CA8()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1DAD23CB8()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_1DAD23CC8()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1DAD23CD8()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1DAD23CE8()
{
  return MEMORY[0x1F40F92F8]();
}

uint64_t sub_1DAD23CF8()
{
  return MEMORY[0x1F40F9300]();
}

uint64_t sub_1DAD23D08()
{
  return MEMORY[0x1F40F9320]();
}

uint64_t sub_1DAD23D18()
{
  return MEMORY[0x1F40F9328]();
}

uint64_t sub_1DAD23D28()
{
  return MEMORY[0x1F40F9398]();
}

uint64_t sub_1DAD23D38()
{
  return MEMORY[0x1F40F93A0]();
}

uint64_t sub_1DAD23D48()
{
  return MEMORY[0x1F40F9418]();
}

uint64_t sub_1DAD23D58()
{
  return MEMORY[0x1F40F94D0]();
}

uint64_t sub_1DAD23D68()
{
  return MEMORY[0x1F40F94D8]();
}

uint64_t sub_1DAD23D78()
{
  return MEMORY[0x1F40F94E0]();
}

uint64_t sub_1DAD23D88()
{
  return MEMORY[0x1F40F94E8]();
}

uint64_t sub_1DAD23D98()
{
  return MEMORY[0x1F40F9518]();
}

uint64_t sub_1DAD23DA8()
{
  return MEMORY[0x1F40F9520]();
}

uint64_t sub_1DAD23DB8()
{
  return MEMORY[0x1F40F9528]();
}

uint64_t sub_1DAD23DC8()
{
  return MEMORY[0x1F40F9530]();
}

uint64_t sub_1DAD23DD8()
{
  return MEMORY[0x1F40F9540]();
}

uint64_t sub_1DAD23DE8()
{
  return MEMORY[0x1F40F9548]();
}

uint64_t sub_1DAD23DF8()
{
  return MEMORY[0x1F4103F00]();
}

uint64_t sub_1DAD23E08()
{
  return MEMORY[0x1F4103F08]();
}

uint64_t sub_1DAD23E18()
{
  return MEMORY[0x1F4103F38]();
}

uint64_t sub_1DAD23E28()
{
  return MEMORY[0x1F4103F40]();
}

uint64_t sub_1DAD23E38()
{
  return MEMORY[0x1F4103F48]();
}

uint64_t sub_1DAD23E48()
{
  return MEMORY[0x1F4103F50]();
}

uint64_t sub_1DAD23E58()
{
  return MEMORY[0x1F4103F58]();
}

uint64_t sub_1DAD23E68()
{
  return MEMORY[0x1F4103F60]();
}

uint64_t sub_1DAD23E78()
{
  return MEMORY[0x1F4103F68]();
}

uint64_t sub_1DAD23E88()
{
  return MEMORY[0x1F4103F80]();
}

uint64_t sub_1DAD23E98()
{
  return MEMORY[0x1F4103F88]();
}

uint64_t sub_1DAD23EA8()
{
  return MEMORY[0x1F4103F90]();
}

uint64_t sub_1DAD23EB8()
{
  return MEMORY[0x1F4103FF0]();
}

uint64_t sub_1DAD23EC8()
{
  return MEMORY[0x1F4103FF8]();
}

uint64_t sub_1DAD23ED8()
{
  return MEMORY[0x1F4104000]();
}

uint64_t sub_1DAD23EE8()
{
  return MEMORY[0x1F4104008]();
}

uint64_t sub_1DAD23EF8()
{
  return MEMORY[0x1F4104010]();
}

uint64_t sub_1DAD23F08()
{
  return MEMORY[0x1F4104018]();
}

uint64_t sub_1DAD23F18()
{
  return MEMORY[0x1F4104040]();
}

uint64_t sub_1DAD23F28()
{
  return MEMORY[0x1F4104048]();
}

uint64_t sub_1DAD23F38()
{
  return MEMORY[0x1F4104060]();
}

uint64_t sub_1DAD23F48()
{
  return MEMORY[0x1F4104068]();
}

uint64_t sub_1DAD23F58()
{
  return MEMORY[0x1F4104080]();
}

uint64_t sub_1DAD23F68()
{
  return MEMORY[0x1F4104088]();
}

uint64_t sub_1DAD23F78()
{
  return MEMORY[0x1F40F9688]();
}

uint64_t sub_1DAD23F88()
{
  return MEMORY[0x1F40F9690]();
}

uint64_t sub_1DAD23F98()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1DAD23FA8()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1DAD23FB8()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1DAD23FC8()
{
  return MEMORY[0x1F410FBB8]();
}

uint64_t sub_1DAD23FD8()
{
  return MEMORY[0x1F410FBC0]();
}

uint64_t sub_1DAD23FE8()
{
  return MEMORY[0x1F410FBC8]();
}

uint64_t sub_1DAD23FF8()
{
  return MEMORY[0x1F410FBD0]();
}

uint64_t sub_1DAD24008()
{
  return MEMORY[0x1F410FBD8]();
}

uint64_t sub_1DAD24018()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1DAD24028()
{
  return MEMORY[0x1F40F9E30]();
}

uint64_t sub_1DAD24038()
{
  return MEMORY[0x1F40F9F08]();
}

uint64_t sub_1DAD24048()
{
  return MEMORY[0x1F40F9F18]();
}

uint64_t sub_1DAD24058()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1DAD24068()
{
  return MEMORY[0x1F40FAA20]();
}

uint64_t sub_1DAD24078()
{
  return MEMORY[0x1F40FAA58]();
}

uint64_t sub_1DAD24088()
{
  return MEMORY[0x1F40FAA60]();
}

uint64_t sub_1DAD24098()
{
  return MEMORY[0x1F40FAA68]();
}

uint64_t sub_1DAD240A8()
{
  return MEMORY[0x1F40FAA70]();
}

uint64_t sub_1DAD240B8()
{
  return MEMORY[0x1F40FAA78]();
}

uint64_t sub_1DAD240C8()
{
  return MEMORY[0x1F410FBE0]();
}

uint64_t sub_1DAD240D8()
{
  return MEMORY[0x1F410FBE8]();
}

uint64_t sub_1DAD240E8()
{
  return MEMORY[0x1F410FBF0]();
}

uint64_t sub_1DAD240F8()
{
  return MEMORY[0x1F410FBF8]();
}

uint64_t sub_1DAD24108()
{
  return MEMORY[0x1F410FC00]();
}

uint64_t sub_1DAD24118()
{
  return MEMORY[0x1F410FC08]();
}

uint64_t sub_1DAD24128()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1DAD24138()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1DAD24148()
{
  return MEMORY[0x1F40FB8F8]();
}

uint64_t sub_1DAD24158()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1DAD24168()
{
  return MEMORY[0x1F40FBF48]();
}

uint64_t sub_1DAD24178()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1DAD24188()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1DAD24198()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1DAD241A8()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1DAD241B8()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1DAD241C8()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1DAD241D8()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1DAD241E8()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1DAD241F8()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1DAD24208()
{
  return MEMORY[0x1F40FCD10]();
}

uint64_t sub_1DAD24218()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1DAD24228()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DAD24238()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1DAD24248()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1DAD24258()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DAD24268()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1DAD24278()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1DAD24288()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1DAD24298()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1DAD242A8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DAD242B8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1DAD242C8()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1DAD242D8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1DAD242E8()
{
  return MEMORY[0x1F4186E78]();
}

uint64_t sub_1DAD242F8()
{
  return MEMORY[0x1F4186E80]();
}

uint64_t sub_1DAD24308()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1DAD24318()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1DAD24328()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1DAD24338()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1DAD24348()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1DAD24358()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1DAD24368()
{
  return MEMORY[0x1F410FC10]();
}

uint64_t sub_1DAD24378()
{
  return MEMORY[0x1F410FC18]();
}

uint64_t sub_1DAD24388()
{
  return MEMORY[0x1F410FC20]();
}

uint64_t sub_1DAD24398()
{
  return MEMORY[0x1F410FC28]();
}

uint64_t sub_1DAD243A8()
{
  return MEMORY[0x1F410FC30]();
}

uint64_t sub_1DAD243B8()
{
  return MEMORY[0x1F410FC38]();
}

uint64_t sub_1DAD243C8()
{
  return MEMORY[0x1F410FC40]();
}

uint64_t sub_1DAD243D8()
{
  return MEMORY[0x1F410FC48]();
}

uint64_t sub_1DAD243E8()
{
  return MEMORY[0x1F410FC50]();
}

uint64_t sub_1DAD243F8()
{
  return MEMORY[0x1F410FC58]();
}

uint64_t sub_1DAD24408()
{
  return MEMORY[0x1F410FC60]();
}

uint64_t sub_1DAD24418()
{
  return MEMORY[0x1F410FC68]();
}

uint64_t sub_1DAD24428()
{
  return MEMORY[0x1F410FC70]();
}

uint64_t sub_1DAD24438()
{
  return MEMORY[0x1F410FC78]();
}

uint64_t sub_1DAD24448()
{
  return MEMORY[0x1F410FC80]();
}

uint64_t sub_1DAD24458()
{
  return MEMORY[0x1F410FC88]();
}

uint64_t sub_1DAD24468()
{
  return MEMORY[0x1F410FC90]();
}

uint64_t sub_1DAD24478()
{
  return MEMORY[0x1F410FC98]();
}

uint64_t sub_1DAD24488()
{
  return MEMORY[0x1F410FCA0]();
}

uint64_t sub_1DAD24498()
{
  return MEMORY[0x1F410FCA8]();
}

uint64_t sub_1DAD244A8()
{
  return MEMORY[0x1F410FCB0]();
}

uint64_t sub_1DAD244B8()
{
  return MEMORY[0x1F410FCB8]();
}

uint64_t sub_1DAD244C8()
{
  return MEMORY[0x1F410FCC0]();
}

uint64_t sub_1DAD244D8()
{
  return MEMORY[0x1F410FCC8]();
}

uint64_t sub_1DAD244E8()
{
  return MEMORY[0x1F410FCD0]();
}

uint64_t sub_1DAD244F8()
{
  return MEMORY[0x1F410FCD8]();
}

uint64_t sub_1DAD24508()
{
  return MEMORY[0x1F410FCE0]();
}

uint64_t sub_1DAD24518()
{
  return MEMORY[0x1F410FCE8]();
}

uint64_t sub_1DAD24528()
{
  return MEMORY[0x1F410FCF0]();
}

uint64_t sub_1DAD24538()
{
  return MEMORY[0x1F410FCF8]();
}

uint64_t sub_1DAD24548()
{
  return MEMORY[0x1F410FD00]();
}

uint64_t sub_1DAD24558()
{
  return MEMORY[0x1F410FD08]();
}

uint64_t sub_1DAD24568()
{
  return MEMORY[0x1F410FD10]();
}

uint64_t sub_1DAD24578()
{
  return MEMORY[0x1F410FD18]();
}

uint64_t sub_1DAD24588()
{
  return MEMORY[0x1F410FD20]();
}

uint64_t sub_1DAD24598()
{
  return MEMORY[0x1F410FD28]();
}

uint64_t sub_1DAD245A8()
{
  return MEMORY[0x1F410FD30]();
}

uint64_t sub_1DAD245B8()
{
  return MEMORY[0x1F410FD38]();
}

uint64_t sub_1DAD245C8()
{
  return MEMORY[0x1F410FD40]();
}

uint64_t sub_1DAD245D8()
{
  return MEMORY[0x1F410FD48]();
}

uint64_t sub_1DAD245E8()
{
  return MEMORY[0x1F410FD50]();
}

uint64_t sub_1DAD245F8()
{
  return MEMORY[0x1F410FD58]();
}

uint64_t sub_1DAD24608()
{
  return MEMORY[0x1F410FD60]();
}

uint64_t sub_1DAD24618()
{
  return MEMORY[0x1F410FD68]();
}

uint64_t sub_1DAD24628()
{
  return MEMORY[0x1F410FD70]();
}

uint64_t sub_1DAD24638()
{
  return MEMORY[0x1F410FD78]();
}

uint64_t sub_1DAD24648()
{
  return MEMORY[0x1F410FD80]();
}

uint64_t sub_1DAD24658()
{
  return MEMORY[0x1F410FD88]();
}

uint64_t sub_1DAD24668()
{
  return MEMORY[0x1F410FD90]();
}

uint64_t sub_1DAD24678()
{
  return MEMORY[0x1F410FD98]();
}

uint64_t sub_1DAD24688()
{
  return MEMORY[0x1F410FDA0]();
}

uint64_t sub_1DAD24698()
{
  return MEMORY[0x1F410FDA8]();
}

uint64_t sub_1DAD246A8()
{
  return MEMORY[0x1F410FDB0]();
}

uint64_t sub_1DAD246B8()
{
  return MEMORY[0x1F410FDB8]();
}

uint64_t sub_1DAD246C8()
{
  return MEMORY[0x1F410FDC0]();
}

uint64_t sub_1DAD246D8()
{
  return MEMORY[0x1F410FDC8]();
}

uint64_t sub_1DAD246E8()
{
  return MEMORY[0x1F410FDD0]();
}

uint64_t sub_1DAD246F8()
{
  return MEMORY[0x1F410FDD8]();
}

uint64_t sub_1DAD24708()
{
  return MEMORY[0x1F410FDE0]();
}

uint64_t sub_1DAD24718()
{
  return MEMORY[0x1F410FDE8]();
}

uint64_t sub_1DAD24728()
{
  return MEMORY[0x1F410FDF0]();
}

uint64_t sub_1DAD24738()
{
  return MEMORY[0x1F410FDF8]();
}

uint64_t sub_1DAD24748()
{
  return MEMORY[0x1F410FE00]();
}

uint64_t sub_1DAD24758()
{
  return MEMORY[0x1F410FE08]();
}

uint64_t sub_1DAD24768()
{
  return MEMORY[0x1F410FE10]();
}

uint64_t sub_1DAD24778()
{
  return MEMORY[0x1F410FE18]();
}

uint64_t sub_1DAD24788()
{
  return MEMORY[0x1F410FE20]();
}

uint64_t sub_1DAD24798()
{
  return MEMORY[0x1F410FE28]();
}

uint64_t sub_1DAD247A8()
{
  return MEMORY[0x1F410FE30]();
}

uint64_t sub_1DAD247B8()
{
  return MEMORY[0x1F410FE38]();
}

uint64_t sub_1DAD247C8()
{
  return MEMORY[0x1F410FE40]();
}

uint64_t sub_1DAD247D8()
{
  return MEMORY[0x1F410FE48]();
}

uint64_t sub_1DAD247E8()
{
  return MEMORY[0x1F410FE50]();
}

uint64_t sub_1DAD247F8()
{
  return MEMORY[0x1F410FE58]();
}

uint64_t sub_1DAD24808()
{
  return MEMORY[0x1F410FE60]();
}

uint64_t sub_1DAD24818()
{
  return MEMORY[0x1F410FE68]();
}

uint64_t sub_1DAD24828()
{
  return MEMORY[0x1F410FE70]();
}

uint64_t sub_1DAD24838()
{
  return MEMORY[0x1F410FE78]();
}

uint64_t sub_1DAD24848()
{
  return MEMORY[0x1F410FE80]();
}

uint64_t sub_1DAD24858()
{
  return MEMORY[0x1F410FE88]();
}

uint64_t sub_1DAD24868()
{
  return MEMORY[0x1F410FE90]();
}

uint64_t sub_1DAD24878()
{
  return MEMORY[0x1F410FE98]();
}

uint64_t sub_1DAD24888()
{
  return MEMORY[0x1F410FEA0]();
}

uint64_t sub_1DAD24898()
{
  return MEMORY[0x1F410FEA8]();
}

uint64_t sub_1DAD248A8()
{
  return MEMORY[0x1F410FEB0]();
}

uint64_t sub_1DAD248B8()
{
  return MEMORY[0x1F410FEB8]();
}

uint64_t sub_1DAD248C8()
{
  return MEMORY[0x1F410FEC0]();
}

uint64_t sub_1DAD248D8()
{
  return MEMORY[0x1F410FEC8]();
}

uint64_t sub_1DAD248E8()
{
  return MEMORY[0x1F410FED0]();
}

uint64_t sub_1DAD248F8()
{
  return MEMORY[0x1F410FED8]();
}

uint64_t sub_1DAD24908()
{
  return MEMORY[0x1F410FEE0]();
}

uint64_t sub_1DAD24918()
{
  return MEMORY[0x1F410FEE8]();
}

uint64_t sub_1DAD24928()
{
  return MEMORY[0x1F410FEF0]();
}

uint64_t sub_1DAD24938()
{
  return MEMORY[0x1F410FEF8]();
}

uint64_t sub_1DAD24948()
{
  return MEMORY[0x1F410FF00]();
}

uint64_t sub_1DAD24958()
{
  return MEMORY[0x1F410FF08]();
}

uint64_t sub_1DAD24968()
{
  return MEMORY[0x1F410FF10]();
}

uint64_t sub_1DAD24978()
{
  return MEMORY[0x1F410FF18]();
}

uint64_t sub_1DAD24988()
{
  return MEMORY[0x1F410FF20]();
}

uint64_t sub_1DAD24998()
{
  return MEMORY[0x1F410FF28]();
}

uint64_t sub_1DAD249A8()
{
  return MEMORY[0x1F410FF30]();
}

uint64_t sub_1DAD249B8()
{
  return MEMORY[0x1F410FF38]();
}

uint64_t sub_1DAD249C8()
{
  return MEMORY[0x1F410FF40]();
}

uint64_t sub_1DAD249D8()
{
  return MEMORY[0x1F410FF48]();
}

uint64_t sub_1DAD249E8()
{
  return MEMORY[0x1F410FF50]();
}

uint64_t sub_1DAD249F8()
{
  return MEMORY[0x1F410FF58]();
}

uint64_t sub_1DAD24A08()
{
  return MEMORY[0x1F410FF60]();
}

uint64_t sub_1DAD24A18()
{
  return MEMORY[0x1F410FF68]();
}

uint64_t sub_1DAD24A28()
{
  return MEMORY[0x1F410FF70]();
}

uint64_t sub_1DAD24A38()
{
  return MEMORY[0x1F410FF78]();
}

uint64_t sub_1DAD24A48()
{
  return MEMORY[0x1F410FF80]();
}

uint64_t sub_1DAD24A58()
{
  return MEMORY[0x1F410FF88]();
}

uint64_t sub_1DAD24A68()
{
  return MEMORY[0x1F410FF90]();
}

uint64_t sub_1DAD24A78()
{
  return MEMORY[0x1F410FF98]();
}

uint64_t sub_1DAD24A88()
{
  return MEMORY[0x1F410FFA0]();
}

uint64_t sub_1DAD24A98()
{
  return MEMORY[0x1F410FFA8]();
}

uint64_t sub_1DAD24AA8()
{
  return MEMORY[0x1F410FFB0]();
}

uint64_t sub_1DAD24AB8()
{
  return MEMORY[0x1F410FFB8]();
}

uint64_t sub_1DAD24AC8()
{
  return MEMORY[0x1F410FFC0]();
}

uint64_t sub_1DAD24AD8()
{
  return MEMORY[0x1F410FFD0]();
}

uint64_t sub_1DAD24AE8()
{
  return MEMORY[0x1F410FFD8]();
}

uint64_t sub_1DAD24AF8()
{
  return MEMORY[0x1F410FFE0]();
}

uint64_t sub_1DAD24B08()
{
  return MEMORY[0x1F410FFE8]();
}

uint64_t sub_1DAD24B18()
{
  return MEMORY[0x1F410FFF0]();
}

uint64_t sub_1DAD24B28()
{
  return MEMORY[0x1F4110000]();
}

uint64_t sub_1DAD24B38()
{
  return MEMORY[0x1F4110010]();
}

uint64_t sub_1DAD24B48()
{
  return MEMORY[0x1F4110018]();
}

uint64_t sub_1DAD24B58()
{
  return MEMORY[0x1F4110020]();
}

uint64_t sub_1DAD24B68()
{
  return MEMORY[0x1F4110028]();
}

uint64_t sub_1DAD24B78()
{
  return MEMORY[0x1F4110030]();
}

uint64_t sub_1DAD24B88()
{
  return MEMORY[0x1F4110038]();
}

uint64_t sub_1DAD24B98()
{
  return MEMORY[0x1F4110040]();
}

uint64_t sub_1DAD24BA8()
{
  return MEMORY[0x1F4110048]();
}

uint64_t sub_1DAD24BB8()
{
  return MEMORY[0x1F4110050]();
}

uint64_t sub_1DAD24BC8()
{
  return MEMORY[0x1F4110058]();
}

uint64_t sub_1DAD24BD8()
{
  return MEMORY[0x1F4110060]();
}

uint64_t sub_1DAD24BE8()
{
  return MEMORY[0x1F4110068]();
}

uint64_t sub_1DAD24BF8()
{
  return MEMORY[0x1F4110070]();
}

uint64_t sub_1DAD24C08()
{
  return MEMORY[0x1F4110078]();
}

uint64_t sub_1DAD24C18()
{
  return MEMORY[0x1F4110080]();
}

uint64_t sub_1DAD24C28()
{
  return MEMORY[0x1F4110088]();
}

uint64_t sub_1DAD24C38()
{
  return MEMORY[0x1F4110090]();
}

uint64_t sub_1DAD24C48()
{
  return MEMORY[0x1F4110098]();
}

uint64_t sub_1DAD24C58()
{
  return MEMORY[0x1F41100A0]();
}

uint64_t sub_1DAD24C68()
{
  return MEMORY[0x1F41100A8]();
}

uint64_t sub_1DAD24C78()
{
  return MEMORY[0x1F41100B0]();
}

uint64_t sub_1DAD24C88()
{
  return MEMORY[0x1F41100B8]();
}

uint64_t sub_1DAD24C98()
{
  return MEMORY[0x1F41100C0]();
}

uint64_t sub_1DAD24CA8()
{
  return MEMORY[0x1F41100C8]();
}

uint64_t sub_1DAD24CB8()
{
  return MEMORY[0x1F41100D0]();
}

uint64_t sub_1DAD24CC8()
{
  return MEMORY[0x1F41100D8]();
}

uint64_t sub_1DAD24CD8()
{
  return MEMORY[0x1F41100E0]();
}

uint64_t sub_1DAD24CE8()
{
  return MEMORY[0x1F41100E8]();
}

uint64_t sub_1DAD24CF8()
{
  return MEMORY[0x1F41100F0]();
}

uint64_t sub_1DAD24D08()
{
  return MEMORY[0x1F41100F8]();
}

uint64_t sub_1DAD24D18()
{
  return MEMORY[0x1F4110100]();
}

uint64_t sub_1DAD24D28()
{
  return MEMORY[0x1F4110108]();
}

uint64_t sub_1DAD24D38()
{
  return MEMORY[0x1F4110110]();
}

uint64_t sub_1DAD24D48()
{
  return MEMORY[0x1F4110118]();
}

uint64_t sub_1DAD24D58()
{
  return MEMORY[0x1F4110120]();
}

uint64_t sub_1DAD24D68()
{
  return MEMORY[0x1F4110128]();
}

uint64_t sub_1DAD24D78()
{
  return MEMORY[0x1F4110130]();
}

uint64_t sub_1DAD24D88()
{
  return MEMORY[0x1F4110138]();
}

uint64_t sub_1DAD24D98()
{
  return MEMORY[0x1F4110140]();
}

uint64_t sub_1DAD24DA8()
{
  return MEMORY[0x1F4110148]();
}

uint64_t sub_1DAD24DB8()
{
  return MEMORY[0x1F4110150]();
}

uint64_t sub_1DAD24DC8()
{
  return MEMORY[0x1F4110160]();
}

uint64_t sub_1DAD24DD8()
{
  return MEMORY[0x1F4110168]();
}

uint64_t sub_1DAD24DE8()
{
  return MEMORY[0x1F4110170]();
}

uint64_t sub_1DAD24DF8()
{
  return MEMORY[0x1F4110178]();
}

uint64_t sub_1DAD24E08()
{
  return MEMORY[0x1F4110180]();
}

uint64_t sub_1DAD24E18()
{
  return MEMORY[0x1F4110188]();
}

uint64_t sub_1DAD24E28()
{
  return MEMORY[0x1F4110190]();
}

uint64_t sub_1DAD24E38()
{
  return MEMORY[0x1F4110198]();
}

uint64_t sub_1DAD24E48()
{
  return MEMORY[0x1F41101A0]();
}

uint64_t sub_1DAD24E58()
{
  return MEMORY[0x1F41101A8]();
}

uint64_t sub_1DAD24E68()
{
  return MEMORY[0x1F41101B0]();
}

uint64_t sub_1DAD24E78()
{
  return MEMORY[0x1F41101B8]();
}

uint64_t sub_1DAD24E88()
{
  return MEMORY[0x1F41101C0]();
}

uint64_t sub_1DAD24E98()
{
  return MEMORY[0x1F41101C8]();
}

uint64_t sub_1DAD24EA8()
{
  return MEMORY[0x1F41101D0]();
}

uint64_t sub_1DAD24EB8()
{
  return MEMORY[0x1F41101D8]();
}

uint64_t sub_1DAD24EC8()
{
  return MEMORY[0x1F41101E0]();
}

uint64_t sub_1DAD24ED8()
{
  return MEMORY[0x1F41101E8]();
}

uint64_t sub_1DAD24EE8()
{
  return MEMORY[0x1F41101F8]();
}

uint64_t sub_1DAD24EF8()
{
  return MEMORY[0x1F4110200]();
}

uint64_t sub_1DAD24F08()
{
  return MEMORY[0x1F4110208]();
}

uint64_t sub_1DAD24F18()
{
  return MEMORY[0x1F4110210]();
}

uint64_t sub_1DAD24F28()
{
  return MEMORY[0x1F4110218]();
}

uint64_t sub_1DAD24F38()
{
  return MEMORY[0x1F4110220]();
}

uint64_t sub_1DAD24F48()
{
  return MEMORY[0x1F4110228]();
}

uint64_t sub_1DAD24F58()
{
  return MEMORY[0x1F4110230]();
}

uint64_t sub_1DAD24F68()
{
  return MEMORY[0x1F4110238]();
}

uint64_t sub_1DAD24F78()
{
  return MEMORY[0x1F4110240]();
}

uint64_t sub_1DAD24F88()
{
  return MEMORY[0x1F4110248]();
}

uint64_t sub_1DAD24F98()
{
  return MEMORY[0x1F4110250]();
}

uint64_t sub_1DAD24FA8()
{
  return MEMORY[0x1F4110258]();
}

uint64_t sub_1DAD24FB8()
{
  return MEMORY[0x1F4110260]();
}

uint64_t sub_1DAD24FC8()
{
  return MEMORY[0x1F4110268]();
}

uint64_t sub_1DAD24FD8()
{
  return MEMORY[0x1F4110270]();
}

uint64_t sub_1DAD24FE8()
{
  return MEMORY[0x1F4110278]();
}

uint64_t sub_1DAD24FF8()
{
  return MEMORY[0x1F4110280]();
}

uint64_t sub_1DAD25008()
{
  return MEMORY[0x1F4110288]();
}

uint64_t sub_1DAD25018()
{
  return MEMORY[0x1F4110290]();
}

uint64_t sub_1DAD25028()
{
  return MEMORY[0x1F4110298]();
}

uint64_t sub_1DAD25038()
{
  return MEMORY[0x1F41102A0]();
}

uint64_t sub_1DAD25048()
{
  return MEMORY[0x1F41102A8]();
}

uint64_t sub_1DAD25058()
{
  return MEMORY[0x1F41102B0]();
}

uint64_t sub_1DAD25068()
{
  return MEMORY[0x1F41102B8]();
}

uint64_t sub_1DAD25078()
{
  return MEMORY[0x1F41102C0]();
}

uint64_t sub_1DAD25088()
{
  return MEMORY[0x1F41102C8]();
}

uint64_t sub_1DAD25098()
{
  return MEMORY[0x1F41102D0]();
}

uint64_t sub_1DAD250A8()
{
  return MEMORY[0x1F41102D8]();
}

uint64_t sub_1DAD250B8()
{
  return MEMORY[0x1F41102E0]();
}

uint64_t sub_1DAD250C8()
{
  return MEMORY[0x1F41102E8]();
}

uint64_t sub_1DAD250D8()
{
  return MEMORY[0x1F41102F0]();
}

uint64_t sub_1DAD250E8()
{
  return MEMORY[0x1F41102F8]();
}

uint64_t sub_1DAD250F8()
{
  return MEMORY[0x1F4110300]();
}

uint64_t sub_1DAD25108()
{
  return MEMORY[0x1F4110308]();
}

uint64_t sub_1DAD25118()
{
  return MEMORY[0x1F4110310]();
}

uint64_t sub_1DAD25128()
{
  return MEMORY[0x1F4110318]();
}

uint64_t sub_1DAD25138()
{
  return MEMORY[0x1F4110320]();
}

uint64_t sub_1DAD25148()
{
  return MEMORY[0x1F4110328]();
}

uint64_t sub_1DAD25158()
{
  return MEMORY[0x1F4110330]();
}

uint64_t sub_1DAD25168()
{
  return MEMORY[0x1F4110338]();
}

uint64_t sub_1DAD25178()
{
  return MEMORY[0x1F4110340]();
}

uint64_t sub_1DAD25188()
{
  return MEMORY[0x1F4110348]();
}

uint64_t sub_1DAD25198()
{
  return MEMORY[0x1F4110350]();
}

uint64_t sub_1DAD251A8()
{
  return MEMORY[0x1F4110358]();
}

uint64_t sub_1DAD251B8()
{
  return MEMORY[0x1F4110360]();
}

uint64_t sub_1DAD251C8()
{
  return MEMORY[0x1F4110368]();
}

uint64_t sub_1DAD251D8()
{
  return MEMORY[0x1F4110370]();
}

uint64_t sub_1DAD251E8()
{
  return MEMORY[0x1F4110378]();
}

uint64_t sub_1DAD251F8()
{
  return MEMORY[0x1F4110380]();
}

uint64_t sub_1DAD25208()
{
  return MEMORY[0x1F4110388]();
}

uint64_t sub_1DAD25218()
{
  return MEMORY[0x1F4110390]();
}

uint64_t sub_1DAD25228()
{
  return MEMORY[0x1F4110398]();
}

uint64_t sub_1DAD25238()
{
  return MEMORY[0x1F41103A0]();
}

uint64_t sub_1DAD25248()
{
  return MEMORY[0x1F41103A8]();
}

uint64_t sub_1DAD25258()
{
  return MEMORY[0x1F41103B0]();
}

uint64_t sub_1DAD25268()
{
  return MEMORY[0x1F41103B8]();
}

uint64_t sub_1DAD25278()
{
  return MEMORY[0x1F41103C0]();
}

uint64_t sub_1DAD25288()
{
  return MEMORY[0x1F41103C8]();
}

uint64_t sub_1DAD25298()
{
  return MEMORY[0x1F41103D0]();
}

uint64_t sub_1DAD252A8()
{
  return MEMORY[0x1F41103D8]();
}

uint64_t sub_1DAD252B8()
{
  return MEMORY[0x1F41103E0]();
}

uint64_t sub_1DAD252C8()
{
  return MEMORY[0x1F41103E8]();
}

uint64_t sub_1DAD252D8()
{
  return MEMORY[0x1F41103F0]();
}

uint64_t sub_1DAD252E8()
{
  return MEMORY[0x1F41103F8]();
}

uint64_t sub_1DAD252F8()
{
  return MEMORY[0x1F4110400]();
}

uint64_t sub_1DAD25308()
{
  return MEMORY[0x1F4110408]();
}

uint64_t sub_1DAD25318()
{
  return MEMORY[0x1F4110410]();
}

uint64_t sub_1DAD25328()
{
  return MEMORY[0x1F4110418]();
}

uint64_t sub_1DAD25338()
{
  return MEMORY[0x1F4110420]();
}

uint64_t sub_1DAD25348()
{
  return MEMORY[0x1F4110428]();
}

uint64_t sub_1DAD25358()
{
  return MEMORY[0x1F4110430]();
}

uint64_t sub_1DAD25368()
{
  return MEMORY[0x1F4110438]();
}

uint64_t sub_1DAD25378()
{
  return MEMORY[0x1F4110440]();
}

uint64_t sub_1DAD25388()
{
  return MEMORY[0x1F4110448]();
}

uint64_t sub_1DAD25398()
{
  return MEMORY[0x1F4110450]();
}

uint64_t sub_1DAD253A8()
{
  return MEMORY[0x1F4110458]();
}

uint64_t sub_1DAD253B8()
{
  return MEMORY[0x1F4110460]();
}

uint64_t sub_1DAD253C8()
{
  return MEMORY[0x1F4110468]();
}

uint64_t sub_1DAD253D8()
{
  return MEMORY[0x1F4110470]();
}

uint64_t sub_1DAD253E8()
{
  return MEMORY[0x1F4110478]();
}

uint64_t sub_1DAD253F8()
{
  return MEMORY[0x1F4110480]();
}

uint64_t sub_1DAD25408()
{
  return MEMORY[0x1F4110488]();
}

uint64_t sub_1DAD25418()
{
  return MEMORY[0x1F4110490]();
}

uint64_t sub_1DAD25428()
{
  return MEMORY[0x1F4110498]();
}

uint64_t sub_1DAD25438()
{
  return MEMORY[0x1F41104A0]();
}

uint64_t sub_1DAD25448()
{
  return MEMORY[0x1F41104A8]();
}

uint64_t sub_1DAD25458()
{
  return MEMORY[0x1F41104B0]();
}

uint64_t sub_1DAD25468()
{
  return MEMORY[0x1F41104B8]();
}

uint64_t sub_1DAD25478()
{
  return MEMORY[0x1F41104C0]();
}

uint64_t sub_1DAD25488()
{
  return MEMORY[0x1F41104C8]();
}

uint64_t sub_1DAD25498()
{
  return MEMORY[0x1F41104D0]();
}

uint64_t sub_1DAD254A8()
{
  return MEMORY[0x1F41104D8]();
}

uint64_t sub_1DAD254B8()
{
  return MEMORY[0x1F41104E0]();
}

uint64_t sub_1DAD254C8()
{
  return MEMORY[0x1F41104E8]();
}

uint64_t sub_1DAD254D8()
{
  return MEMORY[0x1F41104F0]();
}

uint64_t sub_1DAD254E8()
{
  return MEMORY[0x1F41104F8]();
}

uint64_t sub_1DAD254F8()
{
  return MEMORY[0x1F4110500]();
}

uint64_t sub_1DAD25508()
{
  return MEMORY[0x1F4110508]();
}

uint64_t sub_1DAD25518()
{
  return MEMORY[0x1F4110510]();
}

uint64_t sub_1DAD25528()
{
  return MEMORY[0x1F4110518]();
}

uint64_t sub_1DAD25538()
{
  return MEMORY[0x1F4110520]();
}

uint64_t sub_1DAD25548()
{
  return MEMORY[0x1F4110528]();
}

uint64_t sub_1DAD25558()
{
  return MEMORY[0x1F4110530]();
}

uint64_t sub_1DAD25568()
{
  return MEMORY[0x1F4110548]();
}

uint64_t sub_1DAD25578()
{
  return MEMORY[0x1F4110550]();
}

uint64_t sub_1DAD25588()
{
  return MEMORY[0x1F4110558]();
}

uint64_t sub_1DAD25598()
{
  return MEMORY[0x1F4110560]();
}

uint64_t sub_1DAD255A8()
{
  return MEMORY[0x1F4110568]();
}

uint64_t sub_1DAD255B8()
{
  return MEMORY[0x1F4110570]();
}

uint64_t sub_1DAD255C8()
{
  return MEMORY[0x1F4110578]();
}

uint64_t sub_1DAD255D8()
{
  return MEMORY[0x1F4110580]();
}

uint64_t sub_1DAD255E8()
{
  return MEMORY[0x1F4110588]();
}

uint64_t sub_1DAD255F8()
{
  return MEMORY[0x1F4110590]();
}

uint64_t sub_1DAD25608()
{
  return MEMORY[0x1F4110598]();
}

uint64_t sub_1DAD25618()
{
  return MEMORY[0x1F41105A0]();
}

uint64_t sub_1DAD25628()
{
  return MEMORY[0x1F41105B8]();
}

uint64_t sub_1DAD25638()
{
  return MEMORY[0x1F41105C0]();
}

uint64_t sub_1DAD25648()
{
  return MEMORY[0x1F41105C8]();
}

uint64_t sub_1DAD25658()
{
  return MEMORY[0x1F41105D0]();
}

uint64_t sub_1DAD25668()
{
  return MEMORY[0x1F41105D8]();
}

uint64_t sub_1DAD25678()
{
  return MEMORY[0x1F41105E0]();
}

uint64_t sub_1DAD25688()
{
  return MEMORY[0x1F41105E8]();
}

uint64_t sub_1DAD25698()
{
  return MEMORY[0x1F41105F0]();
}

uint64_t sub_1DAD256A8()
{
  return MEMORY[0x1F41105F8]();
}

uint64_t sub_1DAD256B8()
{
  return MEMORY[0x1F4110600]();
}

uint64_t sub_1DAD256C8()
{
  return MEMORY[0x1F4110608]();
}

uint64_t sub_1DAD256D8()
{
  return MEMORY[0x1F4110610]();
}

uint64_t sub_1DAD256E8()
{
  return MEMORY[0x1F4110618]();
}

uint64_t sub_1DAD256F8()
{
  return MEMORY[0x1F4110620]();
}

uint64_t sub_1DAD25708()
{
  return MEMORY[0x1F4110628]();
}

uint64_t sub_1DAD25718()
{
  return MEMORY[0x1F4110630]();
}

uint64_t sub_1DAD25728()
{
  return MEMORY[0x1F4110638]();
}

uint64_t sub_1DAD25738()
{
  return MEMORY[0x1F4110640]();
}

uint64_t sub_1DAD25748()
{
  return MEMORY[0x1F4110648]();
}

uint64_t sub_1DAD25758()
{
  return MEMORY[0x1F4110650]();
}

uint64_t sub_1DAD25768()
{
  return MEMORY[0x1F4110658]();
}

uint64_t sub_1DAD25778()
{
  return MEMORY[0x1F4110660]();
}

uint64_t sub_1DAD25788()
{
  return MEMORY[0x1F4110668]();
}

uint64_t sub_1DAD25798()
{
  return MEMORY[0x1F4110670]();
}

uint64_t sub_1DAD257A8()
{
  return MEMORY[0x1F4110678]();
}

uint64_t sub_1DAD257B8()
{
  return MEMORY[0x1F4110680]();
}

uint64_t sub_1DAD257C8()
{
  return MEMORY[0x1F4110688]();
}

uint64_t sub_1DAD257D8()
{
  return MEMORY[0x1F4110690]();
}

uint64_t sub_1DAD257E8()
{
  return MEMORY[0x1F4110698]();
}

uint64_t sub_1DAD257F8()
{
  return MEMORY[0x1F41106A0]();
}

uint64_t sub_1DAD25808()
{
  return MEMORY[0x1F41106A8]();
}

uint64_t sub_1DAD25818()
{
  return MEMORY[0x1F41106B0]();
}

uint64_t sub_1DAD25828()
{
  return MEMORY[0x1F41106B8]();
}

uint64_t sub_1DAD25838()
{
  return MEMORY[0x1F41106C0]();
}

uint64_t sub_1DAD25848()
{
  return MEMORY[0x1F41106C8]();
}

uint64_t sub_1DAD25858()
{
  return MEMORY[0x1F41106D0]();
}

uint64_t sub_1DAD25868()
{
  return MEMORY[0x1F41106D8]();
}

uint64_t sub_1DAD25878()
{
  return MEMORY[0x1F41106E0]();
}

uint64_t sub_1DAD25888()
{
  return MEMORY[0x1F41106E8]();
}

uint64_t sub_1DAD25898()
{
  return MEMORY[0x1F41106F0]();
}

uint64_t sub_1DAD258A8()
{
  return MEMORY[0x1F41106F8]();
}

uint64_t sub_1DAD258B8()
{
  return MEMORY[0x1F4110700]();
}

uint64_t sub_1DAD258C8()
{
  return MEMORY[0x1F4110708]();
}

uint64_t sub_1DAD258D8()
{
  return MEMORY[0x1F4110710]();
}

uint64_t sub_1DAD258E8()
{
  return MEMORY[0x1F4110718]();
}

uint64_t sub_1DAD258F8()
{
  return MEMORY[0x1F4110720]();
}

uint64_t sub_1DAD25908()
{
  return MEMORY[0x1F4110728]();
}

uint64_t sub_1DAD25918()
{
  return MEMORY[0x1F4110730]();
}

uint64_t sub_1DAD25928()
{
  return MEMORY[0x1F4110738]();
}

uint64_t sub_1DAD25938()
{
  return MEMORY[0x1F4110740]();
}

uint64_t sub_1DAD25948()
{
  return MEMORY[0x1F4110748]();
}

uint64_t sub_1DAD25958()
{
  return MEMORY[0x1F4110750]();
}

uint64_t sub_1DAD25968()
{
  return MEMORY[0x1F4110758]();
}

uint64_t sub_1DAD25978()
{
  return MEMORY[0x1F4110760]();
}

uint64_t sub_1DAD25988()
{
  return MEMORY[0x1F4110768]();
}

uint64_t sub_1DAD25998()
{
  return MEMORY[0x1F4110770]();
}

uint64_t sub_1DAD259A8()
{
  return MEMORY[0x1F4110778]();
}

uint64_t sub_1DAD259B8()
{
  return MEMORY[0x1F4110780]();
}

uint64_t sub_1DAD259C8()
{
  return MEMORY[0x1F4110788]();
}

uint64_t sub_1DAD259D8()
{
  return MEMORY[0x1F4110790]();
}

uint64_t sub_1DAD259E8()
{
  return MEMORY[0x1F4110798]();
}

uint64_t sub_1DAD259F8()
{
  return MEMORY[0x1F41107A0]();
}

uint64_t sub_1DAD25A08()
{
  return MEMORY[0x1F41107A8]();
}

uint64_t sub_1DAD25A18()
{
  return MEMORY[0x1F41107B0]();
}

uint64_t sub_1DAD25A28()
{
  return MEMORY[0x1F41107B8]();
}

uint64_t sub_1DAD25A38()
{
  return MEMORY[0x1F41107C0]();
}

uint64_t sub_1DAD25A48()
{
  return MEMORY[0x1F41107C8]();
}

uint64_t sub_1DAD25A58()
{
  return MEMORY[0x1F41107D0]();
}

uint64_t sub_1DAD25A68()
{
  return MEMORY[0x1F41107D8]();
}

uint64_t sub_1DAD25A78()
{
  return MEMORY[0x1F41107E0]();
}

uint64_t sub_1DAD25A88()
{
  return MEMORY[0x1F41107E8]();
}

uint64_t sub_1DAD25A98()
{
  return MEMORY[0x1F41107F0]();
}

uint64_t sub_1DAD25AA8()
{
  return MEMORY[0x1F41107F8]();
}

uint64_t sub_1DAD25AB8()
{
  return MEMORY[0x1F4110800]();
}

uint64_t sub_1DAD25AC8()
{
  return MEMORY[0x1F4110808]();
}

uint64_t sub_1DAD25AD8()
{
  return MEMORY[0x1F4110810]();
}

uint64_t sub_1DAD25AE8()
{
  return MEMORY[0x1F4110818]();
}

uint64_t sub_1DAD25AF8()
{
  return MEMORY[0x1F4110820]();
}

uint64_t sub_1DAD25B08()
{
  return MEMORY[0x1F4110828]();
}

uint64_t sub_1DAD25B18()
{
  return MEMORY[0x1F4110830]();
}

uint64_t sub_1DAD25B28()
{
  return MEMORY[0x1F4110838]();
}

uint64_t sub_1DAD25B38()
{
  return MEMORY[0x1F4110840]();
}

uint64_t sub_1DAD25B48()
{
  return MEMORY[0x1F4110848]();
}

uint64_t sub_1DAD25B58()
{
  return MEMORY[0x1F4110850]();
}

uint64_t sub_1DAD25B68()
{
  return MEMORY[0x1F4110858]();
}

uint64_t sub_1DAD25B78()
{
  return MEMORY[0x1F4110860]();
}

uint64_t sub_1DAD25B88()
{
  return MEMORY[0x1F4110868]();
}

uint64_t sub_1DAD25B98()
{
  return MEMORY[0x1F4110870]();
}

uint64_t sub_1DAD25BA8()
{
  return MEMORY[0x1F4110878]();
}

uint64_t sub_1DAD25BB8()
{
  return MEMORY[0x1F4110880]();
}

uint64_t sub_1DAD25BC8()
{
  return MEMORY[0x1F4110888]();
}

uint64_t sub_1DAD25BD8()
{
  return MEMORY[0x1F4110890]();
}

uint64_t sub_1DAD25BE8()
{
  return MEMORY[0x1F4110898]();
}

uint64_t sub_1DAD25BF8()
{
  return MEMORY[0x1F41108A0]();
}

uint64_t sub_1DAD25C08()
{
  return MEMORY[0x1F41108A8]();
}

uint64_t sub_1DAD25C18()
{
  return MEMORY[0x1F41108B0]();
}

uint64_t sub_1DAD25C28()
{
  return MEMORY[0x1F41108B8]();
}

uint64_t sub_1DAD25C38()
{
  return MEMORY[0x1F41108C0]();
}

uint64_t sub_1DAD25C48()
{
  return MEMORY[0x1F41108C8]();
}

uint64_t sub_1DAD25C58()
{
  return MEMORY[0x1F41108D0]();
}

uint64_t sub_1DAD25C68()
{
  return MEMORY[0x1F41108D8]();
}

uint64_t sub_1DAD25C78()
{
  return MEMORY[0x1F41108E0]();
}

uint64_t sub_1DAD25C88()
{
  return MEMORY[0x1F41108E8]();
}

uint64_t sub_1DAD25C98()
{
  return MEMORY[0x1F41108F0]();
}

uint64_t sub_1DAD25CA8()
{
  return MEMORY[0x1F41108F8]();
}

uint64_t sub_1DAD25CB8()
{
  return MEMORY[0x1F4110900]();
}

uint64_t sub_1DAD25CC8()
{
  return MEMORY[0x1F4110908]();
}

uint64_t sub_1DAD25CD8()
{
  return MEMORY[0x1F4110910]();
}

uint64_t sub_1DAD25CE8()
{
  return MEMORY[0x1F4110918]();
}

uint64_t sub_1DAD25CF8()
{
  return MEMORY[0x1F4110920]();
}

uint64_t sub_1DAD25D08()
{
  return MEMORY[0x1F4110928]();
}

uint64_t sub_1DAD25D18()
{
  return MEMORY[0x1F4110930]();
}

uint64_t sub_1DAD25D28()
{
  return MEMORY[0x1F4110938]();
}

uint64_t sub_1DAD25D38()
{
  return MEMORY[0x1F4110940]();
}

uint64_t sub_1DAD25D48()
{
  return MEMORY[0x1F4110948]();
}

uint64_t sub_1DAD25D58()
{
  return MEMORY[0x1F4110950]();
}

uint64_t sub_1DAD25D68()
{
  return MEMORY[0x1F4110958]();
}

uint64_t sub_1DAD25D78()
{
  return MEMORY[0x1F4110960]();
}

uint64_t sub_1DAD25D88()
{
  return MEMORY[0x1F4110968]();
}

uint64_t sub_1DAD25D98()
{
  return MEMORY[0x1F4110970]();
}

uint64_t sub_1DAD25DA8()
{
  return MEMORY[0x1F4110978]();
}

uint64_t sub_1DAD25DB8()
{
  return MEMORY[0x1F4110980]();
}

uint64_t sub_1DAD25DC8()
{
  return MEMORY[0x1F4110988]();
}

uint64_t sub_1DAD25DD8()
{
  return MEMORY[0x1F4110990]();
}

uint64_t sub_1DAD25DE8()
{
  return MEMORY[0x1F4110998]();
}

uint64_t sub_1DAD25DF8()
{
  return MEMORY[0x1F41109A0]();
}

uint64_t sub_1DAD25E08()
{
  return MEMORY[0x1F41109A8]();
}

uint64_t sub_1DAD25E18()
{
  return MEMORY[0x1F41109B0]();
}

uint64_t sub_1DAD25E28()
{
  return MEMORY[0x1F41109B8]();
}

uint64_t sub_1DAD25E38()
{
  return MEMORY[0x1F41109C0]();
}

uint64_t sub_1DAD25E48()
{
  return MEMORY[0x1F41109C8]();
}

uint64_t sub_1DAD25E58()
{
  return MEMORY[0x1F41109D0]();
}

uint64_t sub_1DAD25E68()
{
  return MEMORY[0x1F41109D8]();
}

uint64_t sub_1DAD25E78()
{
  return MEMORY[0x1F41109E0]();
}

uint64_t sub_1DAD25E88()
{
  return MEMORY[0x1F41109E8]();
}

uint64_t sub_1DAD25E98()
{
  return MEMORY[0x1F41109F0]();
}

uint64_t sub_1DAD25EA8()
{
  return MEMORY[0x1F41109F8]();
}

uint64_t sub_1DAD25EB8()
{
  return MEMORY[0x1F4110A00]();
}

uint64_t sub_1DAD25EC8()
{
  return MEMORY[0x1F4110A08]();
}

uint64_t sub_1DAD25ED8()
{
  return MEMORY[0x1F4110A10]();
}

uint64_t sub_1DAD25EE8()
{
  return MEMORY[0x1F4110A18]();
}

uint64_t sub_1DAD25EF8()
{
  return MEMORY[0x1F4110A20]();
}

uint64_t sub_1DAD25F08()
{
  return MEMORY[0x1F4110A28]();
}

uint64_t sub_1DAD25F18()
{
  return MEMORY[0x1F4110A30]();
}

uint64_t sub_1DAD25F28()
{
  return MEMORY[0x1F4110A38]();
}

uint64_t sub_1DAD25F38()
{
  return MEMORY[0x1F4110A40]();
}

uint64_t sub_1DAD25F48()
{
  return MEMORY[0x1F4110A48]();
}

uint64_t sub_1DAD25F58()
{
  return MEMORY[0x1F4110A50]();
}

uint64_t sub_1DAD25F68()
{
  return MEMORY[0x1F4110A58]();
}

uint64_t sub_1DAD25F78()
{
  return MEMORY[0x1F4110A60]();
}

uint64_t sub_1DAD25F88()
{
  return MEMORY[0x1F4110A68]();
}

uint64_t sub_1DAD25F98()
{
  return MEMORY[0x1F4110A70]();
}

uint64_t sub_1DAD25FA8()
{
  return MEMORY[0x1F4110A78]();
}

uint64_t sub_1DAD25FB8()
{
  return MEMORY[0x1F4110A80]();
}

uint64_t sub_1DAD25FC8()
{
  return MEMORY[0x1F4110A88]();
}

uint64_t sub_1DAD25FD8()
{
  return MEMORY[0x1F4110A90]();
}

uint64_t sub_1DAD25FE8()
{
  return MEMORY[0x1F4110A98]();
}

uint64_t sub_1DAD25FF8()
{
  return MEMORY[0x1F4110AA0]();
}

uint64_t sub_1DAD26008()
{
  return MEMORY[0x1F4110AA8]();
}

uint64_t sub_1DAD26018()
{
  return MEMORY[0x1F4110AB0]();
}

uint64_t sub_1DAD26028()
{
  return MEMORY[0x1F4110AB8]();
}

uint64_t sub_1DAD26038()
{
  return MEMORY[0x1F4110AC0]();
}

uint64_t sub_1DAD26048()
{
  return MEMORY[0x1F4110AC8]();
}

uint64_t sub_1DAD26058()
{
  return MEMORY[0x1F4110AD0]();
}

uint64_t sub_1DAD26068()
{
  return MEMORY[0x1F4110AD8]();
}

uint64_t sub_1DAD26078()
{
  return MEMORY[0x1F4110AE0]();
}

uint64_t sub_1DAD26088()
{
  return MEMORY[0x1F4110AE8]();
}

uint64_t sub_1DAD26098()
{
  return MEMORY[0x1F4110AF0]();
}

uint64_t sub_1DAD260A8()
{
  return MEMORY[0x1F4110AF8]();
}

uint64_t sub_1DAD260B8()
{
  return MEMORY[0x1F4110B00]();
}

uint64_t sub_1DAD260C8()
{
  return MEMORY[0x1F4110B08]();
}

uint64_t sub_1DAD260D8()
{
  return MEMORY[0x1F4110B10]();
}

uint64_t sub_1DAD260E8()
{
  return MEMORY[0x1F4110B18]();
}

uint64_t sub_1DAD260F8()
{
  return MEMORY[0x1F4110B20]();
}

uint64_t sub_1DAD26108()
{
  return MEMORY[0x1F4110B28]();
}

uint64_t sub_1DAD26118()
{
  return MEMORY[0x1F4110B30]();
}

uint64_t sub_1DAD26128()
{
  return MEMORY[0x1F4110B38]();
}

uint64_t sub_1DAD26138()
{
  return MEMORY[0x1F4110B40]();
}

uint64_t sub_1DAD26148()
{
  return MEMORY[0x1F4110B48]();
}

uint64_t sub_1DAD26158()
{
  return MEMORY[0x1F4110B50]();
}

uint64_t sub_1DAD26168()
{
  return MEMORY[0x1F4110B58]();
}

uint64_t sub_1DAD26178()
{
  return MEMORY[0x1F4110B60]();
}

uint64_t sub_1DAD26188()
{
  return MEMORY[0x1F4110B68]();
}

uint64_t sub_1DAD26198()
{
  return MEMORY[0x1F4110B70]();
}

uint64_t sub_1DAD261A8()
{
  return MEMORY[0x1F4110B78]();
}

uint64_t sub_1DAD261B8()
{
  return MEMORY[0x1F4110B80]();
}

uint64_t sub_1DAD261C8()
{
  return MEMORY[0x1F4110B88]();
}

uint64_t sub_1DAD261D8()
{
  return MEMORY[0x1F4110B90]();
}

uint64_t sub_1DAD261E8()
{
  return MEMORY[0x1F4110B98]();
}

uint64_t sub_1DAD261F8()
{
  return MEMORY[0x1F4110BA0]();
}

uint64_t sub_1DAD26208()
{
  return MEMORY[0x1F4110BA8]();
}

uint64_t sub_1DAD26218()
{
  return MEMORY[0x1F4110BB0]();
}

uint64_t sub_1DAD26228()
{
  return MEMORY[0x1F4110BB8]();
}

uint64_t sub_1DAD26238()
{
  return MEMORY[0x1F4110BC0]();
}

uint64_t sub_1DAD26248()
{
  return MEMORY[0x1F4110BC8]();
}

uint64_t sub_1DAD26258()
{
  return MEMORY[0x1F4110BD0]();
}

uint64_t sub_1DAD26268()
{
  return MEMORY[0x1F4110BD8]();
}

uint64_t sub_1DAD26278()
{
  return MEMORY[0x1F4110BE0]();
}

uint64_t sub_1DAD26288()
{
  return MEMORY[0x1F4110BE8]();
}

uint64_t sub_1DAD26298()
{
  return MEMORY[0x1F4110BF0]();
}

uint64_t sub_1DAD262A8()
{
  return MEMORY[0x1F4110BF8]();
}

uint64_t sub_1DAD262B8()
{
  return MEMORY[0x1F4110C00]();
}

uint64_t sub_1DAD262C8()
{
  return MEMORY[0x1F4110C08]();
}

uint64_t sub_1DAD262D8()
{
  return MEMORY[0x1F4110C10]();
}

uint64_t sub_1DAD262E8()
{
  return MEMORY[0x1F4110C18]();
}

uint64_t sub_1DAD262F8()
{
  return MEMORY[0x1F4110C20]();
}

uint64_t sub_1DAD26308()
{
  return MEMORY[0x1F4110C28]();
}

uint64_t sub_1DAD26318()
{
  return MEMORY[0x1F4110C30]();
}

uint64_t sub_1DAD26328()
{
  return MEMORY[0x1F4110C38]();
}

uint64_t sub_1DAD26338()
{
  return MEMORY[0x1F4110C40]();
}

uint64_t sub_1DAD26348()
{
  return MEMORY[0x1F4110C48]();
}

uint64_t sub_1DAD26358()
{
  return MEMORY[0x1F4110C50]();
}

uint64_t sub_1DAD26368()
{
  return MEMORY[0x1F4110C58]();
}

uint64_t sub_1DAD26378()
{
  return MEMORY[0x1F4110C60]();
}

uint64_t sub_1DAD26388()
{
  return MEMORY[0x1F4110C68]();
}

uint64_t sub_1DAD26398()
{
  return MEMORY[0x1F4110C70]();
}

uint64_t sub_1DAD263A8()
{
  return MEMORY[0x1F4110C78]();
}

uint64_t sub_1DAD263B8()
{
  return MEMORY[0x1F4110C80]();
}

uint64_t sub_1DAD263C8()
{
  return MEMORY[0x1F4110C88]();
}

uint64_t sub_1DAD263D8()
{
  return MEMORY[0x1F4110C90]();
}

uint64_t sub_1DAD263E8()
{
  return MEMORY[0x1F4110C98]();
}

uint64_t sub_1DAD263F8()
{
  return MEMORY[0x1F4110CA0]();
}

uint64_t sub_1DAD26408()
{
  return MEMORY[0x1F4110CA8]();
}

uint64_t sub_1DAD26418()
{
  return MEMORY[0x1F4110CB0]();
}

uint64_t sub_1DAD26428()
{
  return MEMORY[0x1F4110CB8]();
}

uint64_t sub_1DAD26438()
{
  return MEMORY[0x1F4110CC0]();
}

uint64_t sub_1DAD26448()
{
  return MEMORY[0x1F4110CC8]();
}

uint64_t sub_1DAD26458()
{
  return MEMORY[0x1F4110CD0]();
}

uint64_t sub_1DAD26468()
{
  return MEMORY[0x1F4110CD8]();
}

uint64_t sub_1DAD26478()
{
  return MEMORY[0x1F4110CE0]();
}

uint64_t sub_1DAD26488()
{
  return MEMORY[0x1F4110CE8]();
}

uint64_t sub_1DAD26498()
{
  return MEMORY[0x1F4110CF0]();
}

uint64_t sub_1DAD264A8()
{
  return MEMORY[0x1F4110CF8]();
}

uint64_t sub_1DAD264B8()
{
  return MEMORY[0x1F4110D00]();
}

uint64_t sub_1DAD264C8()
{
  return MEMORY[0x1F4110D08]();
}

uint64_t sub_1DAD264D8()
{
  return MEMORY[0x1F4110D10]();
}

uint64_t sub_1DAD264E8()
{
  return MEMORY[0x1F4110D18]();
}

uint64_t sub_1DAD264F8()
{
  return MEMORY[0x1F4110D20]();
}

uint64_t sub_1DAD26508()
{
  return MEMORY[0x1F4110D28]();
}

uint64_t sub_1DAD26518()
{
  return MEMORY[0x1F4110D30]();
}

uint64_t sub_1DAD26528()
{
  return MEMORY[0x1F4110D38]();
}

uint64_t sub_1DAD26538()
{
  return MEMORY[0x1F4110D40]();
}

uint64_t sub_1DAD26548()
{
  return MEMORY[0x1F4110D48]();
}

uint64_t sub_1DAD26558()
{
  return MEMORY[0x1F4110D50]();
}

uint64_t sub_1DAD26568()
{
  return MEMORY[0x1F4110D58]();
}

uint64_t sub_1DAD26578()
{
  return MEMORY[0x1F4110D60]();
}

uint64_t sub_1DAD26588()
{
  return MEMORY[0x1F4110D68]();
}

uint64_t sub_1DAD26598()
{
  return MEMORY[0x1F4110D70]();
}

uint64_t sub_1DAD265A8()
{
  return MEMORY[0x1F4110D78]();
}

uint64_t sub_1DAD265B8()
{
  return MEMORY[0x1F4110D80]();
}

uint64_t sub_1DAD265C8()
{
  return MEMORY[0x1F4110D88]();
}

uint64_t sub_1DAD265D8()
{
  return MEMORY[0x1F4110D90]();
}

uint64_t sub_1DAD265E8()
{
  return MEMORY[0x1F4110D98]();
}

uint64_t sub_1DAD265F8()
{
  return MEMORY[0x1F4110DA0]();
}

uint64_t sub_1DAD26608()
{
  return MEMORY[0x1F4110DA8]();
}

uint64_t sub_1DAD26618()
{
  return MEMORY[0x1F4110DB0]();
}

uint64_t sub_1DAD26628()
{
  return MEMORY[0x1F4110DB8]();
}

uint64_t sub_1DAD26638()
{
  return MEMORY[0x1F4110DC8]();
}

uint64_t sub_1DAD26648()
{
  return MEMORY[0x1F4110DD0]();
}

uint64_t sub_1DAD26658()
{
  return MEMORY[0x1F4110DD8]();
}

uint64_t sub_1DAD26668()
{
  return MEMORY[0x1F4110DE0]();
}

uint64_t sub_1DAD26678()
{
  return MEMORY[0x1F4110DE8]();
}

uint64_t sub_1DAD26688()
{
  return MEMORY[0x1F4110DF0]();
}

uint64_t sub_1DAD26698()
{
  return MEMORY[0x1F4110DF8]();
}

uint64_t sub_1DAD266A8()
{
  return MEMORY[0x1F4110E00]();
}

uint64_t sub_1DAD266B8()
{
  return MEMORY[0x1F4110E08]();
}

uint64_t sub_1DAD266C8()
{
  return MEMORY[0x1F4110E10]();
}

uint64_t sub_1DAD266D8()
{
  return MEMORY[0x1F4110E18]();
}

uint64_t sub_1DAD266E8()
{
  return MEMORY[0x1F4110E20]();
}

uint64_t sub_1DAD266F8()
{
  return MEMORY[0x1F4110E28]();
}

uint64_t sub_1DAD26708()
{
  return MEMORY[0x1F4110E30]();
}

uint64_t sub_1DAD26718()
{
  return MEMORY[0x1F4110E38]();
}

uint64_t sub_1DAD26728()
{
  return MEMORY[0x1F4110E40]();
}

uint64_t sub_1DAD26738()
{
  return MEMORY[0x1F4110E48]();
}

uint64_t sub_1DAD26748()
{
  return MEMORY[0x1F4110E50]();
}

uint64_t sub_1DAD26758()
{
  return MEMORY[0x1F4110E58]();
}

uint64_t sub_1DAD26768()
{
  return MEMORY[0x1F4110E60]();
}

uint64_t sub_1DAD26778()
{
  return MEMORY[0x1F4110E68]();
}

uint64_t sub_1DAD26788()
{
  return MEMORY[0x1F4110E70]();
}

uint64_t sub_1DAD26798()
{
  return MEMORY[0x1F4110E78]();
}

uint64_t sub_1DAD267A8()
{
  return MEMORY[0x1F4110E80]();
}

uint64_t sub_1DAD267B8()
{
  return MEMORY[0x1F4110E88]();
}

uint64_t sub_1DAD267C8()
{
  return MEMORY[0x1F4110E90]();
}

uint64_t sub_1DAD267D8()
{
  return MEMORY[0x1F4110E98]();
}

uint64_t sub_1DAD267E8()
{
  return MEMORY[0x1F4110EA0]();
}

uint64_t sub_1DAD267F8()
{
  return MEMORY[0x1F4110EA8]();
}

uint64_t sub_1DAD26808()
{
  return MEMORY[0x1F4110EB0]();
}

uint64_t sub_1DAD26818()
{
  return MEMORY[0x1F4110EB8]();
}

uint64_t sub_1DAD26828()
{
  return MEMORY[0x1F4110EC0]();
}

uint64_t sub_1DAD26838()
{
  return MEMORY[0x1F4110EC8]();
}

uint64_t sub_1DAD26848()
{
  return MEMORY[0x1F4110ED0]();
}

uint64_t sub_1DAD26858()
{
  return MEMORY[0x1F4110ED8]();
}

uint64_t sub_1DAD26868()
{
  return MEMORY[0x1F4110EE0]();
}

uint64_t sub_1DAD26878()
{
  return MEMORY[0x1F4110EE8]();
}

uint64_t sub_1DAD26888()
{
  return MEMORY[0x1F4110EF0]();
}

uint64_t sub_1DAD26898()
{
  return MEMORY[0x1F4110EF8]();
}

uint64_t sub_1DAD268A8()
{
  return MEMORY[0x1F4110F00]();
}

uint64_t sub_1DAD268B8()
{
  return MEMORY[0x1F4110F08]();
}

uint64_t sub_1DAD268C8()
{
  return MEMORY[0x1F4110F10]();
}

uint64_t sub_1DAD268D8()
{
  return MEMORY[0x1F4110F18]();
}

uint64_t sub_1DAD268E8()
{
  return MEMORY[0x1F4110F20]();
}

uint64_t sub_1DAD268F8()
{
  return MEMORY[0x1F4110F28]();
}

uint64_t sub_1DAD26908()
{
  return MEMORY[0x1F4110F30]();
}

uint64_t sub_1DAD26918()
{
  return MEMORY[0x1F4110F38]();
}

uint64_t sub_1DAD26928()
{
  return MEMORY[0x1F4110F40]();
}

uint64_t sub_1DAD26938()
{
  return MEMORY[0x1F4110F48]();
}

uint64_t sub_1DAD26948()
{
  return MEMORY[0x1F4110F50]();
}

uint64_t sub_1DAD26958()
{
  return MEMORY[0x1F4110F58]();
}

uint64_t sub_1DAD26968()
{
  return MEMORY[0x1F4110F60]();
}

uint64_t sub_1DAD26978()
{
  return MEMORY[0x1F4110F68]();
}

uint64_t sub_1DAD26988()
{
  return MEMORY[0x1F4110F70]();
}

uint64_t sub_1DAD26998()
{
  return MEMORY[0x1F4110F78]();
}

uint64_t sub_1DAD269A8()
{
  return MEMORY[0x1F4110F90]();
}

uint64_t sub_1DAD269B8()
{
  return MEMORY[0x1F4110F98]();
}

uint64_t sub_1DAD269C8()
{
  return MEMORY[0x1F4110FA0]();
}

uint64_t sub_1DAD269D8()
{
  return MEMORY[0x1F4110FA8]();
}

uint64_t sub_1DAD269E8()
{
  return MEMORY[0x1F4110FB0]();
}

uint64_t sub_1DAD269F8()
{
  return MEMORY[0x1F4110FB8]();
}

uint64_t sub_1DAD26A08()
{
  return MEMORY[0x1F4110FC0]();
}

uint64_t sub_1DAD26A18()
{
  return MEMORY[0x1F4110FC8]();
}

uint64_t sub_1DAD26A28()
{
  return MEMORY[0x1F4110FD0]();
}

uint64_t sub_1DAD26A38()
{
  return MEMORY[0x1F4110FD8]();
}

uint64_t sub_1DAD26A48()
{
  return MEMORY[0x1F4110FE0]();
}

uint64_t sub_1DAD26A58()
{
  return MEMORY[0x1F4110FE8]();
}

uint64_t sub_1DAD26A68()
{
  return MEMORY[0x1F4110FF0]();
}

uint64_t sub_1DAD26A78()
{
  return MEMORY[0x1F4111008]();
}

uint64_t sub_1DAD26A88()
{
  return MEMORY[0x1F4111010]();
}

uint64_t sub_1DAD26A98()
{
  return MEMORY[0x1F4111018]();
}

uint64_t sub_1DAD26AA8()
{
  return MEMORY[0x1F4111020]();
}

uint64_t sub_1DAD26AB8()
{
  return MEMORY[0x1F4111028]();
}

uint64_t sub_1DAD26AC8()
{
  return MEMORY[0x1F4111030]();
}

uint64_t sub_1DAD26AD8()
{
  return MEMORY[0x1F4111038]();
}

uint64_t sub_1DAD26AE8()
{
  return MEMORY[0x1F4111040]();
}

uint64_t sub_1DAD26AF8()
{
  return MEMORY[0x1F4111048]();
}

uint64_t sub_1DAD26B08()
{
  return MEMORY[0x1F4111050]();
}

uint64_t sub_1DAD26B18()
{
  return MEMORY[0x1F4111058]();
}

uint64_t sub_1DAD26B28()
{
  return MEMORY[0x1F4111060]();
}

uint64_t sub_1DAD26B38()
{
  return MEMORY[0x1F4111068]();
}

uint64_t sub_1DAD26B48()
{
  return MEMORY[0x1F4111070]();
}

uint64_t sub_1DAD26B58()
{
  return MEMORY[0x1F4111078]();
}

uint64_t sub_1DAD26B68()
{
  return MEMORY[0x1F4111080]();
}

uint64_t sub_1DAD26B78()
{
  return MEMORY[0x1F4111088]();
}

uint64_t sub_1DAD26B88()
{
  return MEMORY[0x1F4111090]();
}

uint64_t sub_1DAD26B98()
{
  return MEMORY[0x1F4111098]();
}

uint64_t sub_1DAD26BA8()
{
  return MEMORY[0x1F41110A0]();
}

uint64_t sub_1DAD26BB8()
{
  return MEMORY[0x1F41110A8]();
}

uint64_t sub_1DAD26BC8()
{
  return MEMORY[0x1F41110B0]();
}

uint64_t sub_1DAD26BD8()
{
  return MEMORY[0x1F41110B8]();
}

uint64_t sub_1DAD26BE8()
{
  return MEMORY[0x1F41110C0]();
}

uint64_t sub_1DAD26BF8()
{
  return MEMORY[0x1F41110C8]();
}

uint64_t sub_1DAD26C08()
{
  return MEMORY[0x1F41110D0]();
}

uint64_t sub_1DAD26C18()
{
  return MEMORY[0x1F41110D8]();
}

uint64_t sub_1DAD26C28()
{
  return MEMORY[0x1F41110E0]();
}

uint64_t sub_1DAD26C38()
{
  return MEMORY[0x1F41110E8]();
}

uint64_t sub_1DAD26C48()
{
  return MEMORY[0x1F41110F0]();
}

uint64_t sub_1DAD26C58()
{
  return MEMORY[0x1F41110F8]();
}

uint64_t sub_1DAD26C68()
{
  return MEMORY[0x1F4111100]();
}

uint64_t sub_1DAD26C78()
{
  return MEMORY[0x1F4111108]();
}

uint64_t sub_1DAD26C88()
{
  return MEMORY[0x1F4111110]();
}

uint64_t sub_1DAD26C98()
{
  return MEMORY[0x1F4111118]();
}

uint64_t sub_1DAD26CA8()
{
  return MEMORY[0x1F4111120]();
}

uint64_t sub_1DAD26CB8()
{
  return MEMORY[0x1F4111128]();
}

uint64_t sub_1DAD26CC8()
{
  return MEMORY[0x1F4111130]();
}

uint64_t sub_1DAD26CD8()
{
  return MEMORY[0x1F4111138]();
}

uint64_t sub_1DAD26CE8()
{
  return MEMORY[0x1F4111140]();
}

uint64_t sub_1DAD26CF8()
{
  return MEMORY[0x1F4111148]();
}

uint64_t sub_1DAD26D08()
{
  return MEMORY[0x1F4111150]();
}

uint64_t sub_1DAD26D18()
{
  return MEMORY[0x1F4111158]();
}

uint64_t sub_1DAD26D28()
{
  return MEMORY[0x1F4111160]();
}

uint64_t sub_1DAD26D38()
{
  return MEMORY[0x1F4111168]();
}

uint64_t sub_1DAD26D48()
{
  return MEMORY[0x1F4111170]();
}

uint64_t sub_1DAD26D58()
{
  return MEMORY[0x1F4111178]();
}

uint64_t sub_1DAD26D68()
{
  return MEMORY[0x1F4111180]();
}

uint64_t sub_1DAD26D78()
{
  return MEMORY[0x1F4111188]();
}

uint64_t sub_1DAD26D88()
{
  return MEMORY[0x1F4111190]();
}

uint64_t sub_1DAD26D98()
{
  return MEMORY[0x1F4111198]();
}

uint64_t sub_1DAD26DA8()
{
  return MEMORY[0x1F41111A0]();
}

uint64_t sub_1DAD26DB8()
{
  return MEMORY[0x1F41111A8]();
}

uint64_t sub_1DAD26DC8()
{
  return MEMORY[0x1F4104110]();
}

uint64_t sub_1DAD26DD8()
{
  return MEMORY[0x1F4104118]();
}

uint64_t sub_1DAD26DE8()
{
  return MEMORY[0x1F4104120]();
}

uint64_t sub_1DAD26DF8()
{
  return MEMORY[0x1F4104128]();
}

uint64_t sub_1DAD26E08()
{
  return MEMORY[0x1F4104130]();
}

uint64_t sub_1DAD26E18()
{
  return MEMORY[0x1F4104168]();
}

uint64_t sub_1DAD26E28()
{
  return MEMORY[0x1F4104170]();
}

uint64_t sub_1DAD26E38()
{
  return MEMORY[0x1F4104178]();
}

uint64_t sub_1DAD26E48()
{
  return MEMORY[0x1F4104180]();
}

uint64_t sub_1DAD26E58()
{
  return MEMORY[0x1F4104188]();
}

uint64_t sub_1DAD26E68()
{
  return MEMORY[0x1F4104190]();
}

uint64_t sub_1DAD26E78()
{
  return MEMORY[0x1F4104198]();
}

uint64_t sub_1DAD26E88()
{
  return MEMORY[0x1F41041B0]();
}

uint64_t sub_1DAD26E98()
{
  return MEMORY[0x1F41041C0]();
}

uint64_t sub_1DAD26EA8()
{
  return MEMORY[0x1F41041D0]();
}

uint64_t sub_1DAD26EB8()
{
  return MEMORY[0x1F41041D8]();
}

uint64_t sub_1DAD26EC8()
{
  return MEMORY[0x1F41041E0]();
}

uint64_t sub_1DAD26ED8()
{
  return MEMORY[0x1F41041E8]();
}

uint64_t sub_1DAD26EE8()
{
  return MEMORY[0x1F41041F0]();
}

uint64_t sub_1DAD26EF8()
{
  return MEMORY[0x1F4104208]();
}

uint64_t sub_1DAD26F08()
{
  return MEMORY[0x1F4104210]();
}

uint64_t sub_1DAD26F18()
{
  return MEMORY[0x1F4104218]();
}

uint64_t sub_1DAD26F28()
{
  return MEMORY[0x1F4104220]();
}

uint64_t sub_1DAD26F38()
{
  return MEMORY[0x1F4104228]();
}

uint64_t sub_1DAD26F48()
{
  return MEMORY[0x1F4104280]();
}

uint64_t sub_1DAD26F58()
{
  return MEMORY[0x1F4104298]();
}

uint64_t sub_1DAD26F68()
{
  return MEMORY[0x1F41042A0]();
}

uint64_t sub_1DAD26F78()
{
  return MEMORY[0x1F41042B0]();
}

uint64_t sub_1DAD26F88()
{
  return MEMORY[0x1F41042D8]();
}

uint64_t sub_1DAD26F98()
{
  return MEMORY[0x1F41042E0]();
}

uint64_t sub_1DAD26FA8()
{
  return MEMORY[0x1F4104340]();
}

uint64_t sub_1DAD26FB8()
{
  return MEMORY[0x1F4104348]();
}

uint64_t sub_1DAD26FC8()
{
  return MEMORY[0x1F4104358]();
}

uint64_t sub_1DAD26FD8()
{
  return MEMORY[0x1F4104370]();
}

uint64_t sub_1DAD26FE8()
{
  return MEMORY[0x1F4104388]();
}

uint64_t sub_1DAD26FF8()
{
  return MEMORY[0x1F41043A8]();
}

uint64_t sub_1DAD27008()
{
  return MEMORY[0x1F41043C0]();
}

uint64_t sub_1DAD27018()
{
  return MEMORY[0x1F41111B0]();
}

uint64_t sub_1DAD27028()
{
  return MEMORY[0x1F41043F0]();
}

uint64_t sub_1DAD27038()
{
  return MEMORY[0x1F41043F8]();
}

uint64_t sub_1DAD27048()
{
  return MEMORY[0x1F4104408]();
}

uint64_t sub_1DAD27058()
{
  return MEMORY[0x1F4104410]();
}

uint64_t sub_1DAD27068()
{
  return MEMORY[0x1F4104430]();
}

uint64_t sub_1DAD27078()
{
  return MEMORY[0x1F4104438]();
}

uint64_t sub_1DAD27088()
{
  return MEMORY[0x1F4104440]();
}

uint64_t sub_1DAD27098()
{
  return MEMORY[0x1F4104448]();
}

uint64_t sub_1DAD270A8()
{
  return MEMORY[0x1F4104450]();
}

uint64_t sub_1DAD270B8()
{
  return MEMORY[0x1F4104458]();
}

uint64_t sub_1DAD270C8()
{
  return MEMORY[0x1F4104460]();
}

uint64_t sub_1DAD270D8()
{
  return MEMORY[0x1F4104480]();
}

uint64_t sub_1DAD270E8()
{
  return MEMORY[0x1F4104488]();
}

uint64_t sub_1DAD270F8()
{
  return MEMORY[0x1F4104498]();
}

uint64_t sub_1DAD27108()
{
  return MEMORY[0x1F41044B8]();
}

uint64_t sub_1DAD27118()
{
  return MEMORY[0x1F41044C0]();
}

uint64_t sub_1DAD27128()
{
  return MEMORY[0x1F41044D0]();
}

uint64_t sub_1DAD27138()
{
  return MEMORY[0x1F41044E0]();
}

uint64_t sub_1DAD27148()
{
  return MEMORY[0x1F41044E8]();
}

uint64_t sub_1DAD27158()
{
  return MEMORY[0x1F41044F0]();
}

uint64_t sub_1DAD27168()
{
  return MEMORY[0x1F4104500]();
}

uint64_t sub_1DAD27178()
{
  return MEMORY[0x1F4104510]();
}

uint64_t sub_1DAD27188()
{
  return MEMORY[0x1F4104528]();
}

uint64_t sub_1DAD27198()
{
  return MEMORY[0x1F4104530]();
}

uint64_t sub_1DAD271A8()
{
  return MEMORY[0x1F4104538]();
}

uint64_t sub_1DAD271B8()
{
  return MEMORY[0x1F4104540]();
}

uint64_t sub_1DAD271C8()
{
  return MEMORY[0x1F4104548]();
}

uint64_t sub_1DAD271D8()
{
  return MEMORY[0x1F4104550]();
}

uint64_t sub_1DAD271E8()
{
  return MEMORY[0x1F4104558]();
}

uint64_t sub_1DAD271F8()
{
  return MEMORY[0x1F4104560]();
}

uint64_t sub_1DAD27208()
{
  return MEMORY[0x1F4104568]();
}

uint64_t sub_1DAD27218()
{
  return MEMORY[0x1F4104578]();
}

uint64_t sub_1DAD27228()
{
  return MEMORY[0x1F4104588]();
}

uint64_t sub_1DAD27238()
{
  return MEMORY[0x1F4104590]();
}

uint64_t sub_1DAD27248()
{
  return MEMORY[0x1F4104598]();
}

uint64_t sub_1DAD27258()
{
  return MEMORY[0x1F41045A0]();
}

uint64_t sub_1DAD27268()
{
  return MEMORY[0x1F41045C0]();
}

uint64_t sub_1DAD27278()
{
  return MEMORY[0x1F41045C8]();
}

uint64_t sub_1DAD27288()
{
  return MEMORY[0x1F41045D0]();
}

uint64_t sub_1DAD27298()
{
  return MEMORY[0x1F41045D8]();
}

uint64_t sub_1DAD272A8()
{
  return MEMORY[0x1F41045E0]();
}

uint64_t sub_1DAD272B8()
{
  return MEMORY[0x1F41045F0]();
}

uint64_t sub_1DAD272C8()
{
  return MEMORY[0x1F41045F8]();
}

uint64_t sub_1DAD272D8()
{
  return MEMORY[0x1F4104600]();
}

uint64_t sub_1DAD272E8()
{
  return MEMORY[0x1F4104608]();
}

uint64_t sub_1DAD272F8()
{
  return MEMORY[0x1F4104628]();
}

uint64_t sub_1DAD27308()
{
  return MEMORY[0x1F4104640]();
}

uint64_t sub_1DAD27318()
{
  return MEMORY[0x1F4104658]();
}

uint64_t sub_1DAD27328()
{
  return MEMORY[0x1F41046B0]();
}

uint64_t sub_1DAD27338()
{
  return MEMORY[0x1F41046F8]();
}

uint64_t sub_1DAD27348()
{
  return MEMORY[0x1F4104758]();
}

uint64_t sub_1DAD27358()
{
  return MEMORY[0x1F4104780]();
}

uint64_t sub_1DAD27368()
{
  return MEMORY[0x1F41047D8]();
}

uint64_t sub_1DAD27378()
{
  return MEMORY[0x1F4104808]();
}

uint64_t sub_1DAD27388()
{
  return MEMORY[0x1F4104860]();
}

uint64_t sub_1DAD27398()
{
  return MEMORY[0x1F4104870]();
}

uint64_t sub_1DAD273A8()
{
  return MEMORY[0x1F4104878]();
}

uint64_t sub_1DAD273B8()
{
  return MEMORY[0x1F4104880]();
}

uint64_t sub_1DAD273C8()
{
  return MEMORY[0x1F4104888]();
}

uint64_t sub_1DAD273D8()
{
  return MEMORY[0x1F4104890]();
}

uint64_t sub_1DAD273E8()
{
  return MEMORY[0x1F41048D0]();
}

uint64_t sub_1DAD273F8()
{
  return MEMORY[0x1F41048D8]();
}

uint64_t sub_1DAD27408()
{
  return MEMORY[0x1F41048E0]();
}

uint64_t sub_1DAD27418()
{
  return MEMORY[0x1F41048E8]();
}

uint64_t sub_1DAD27428()
{
  return MEMORY[0x1F4104908]();
}

uint64_t sub_1DAD27438()
{
  return MEMORY[0x1F4104910]();
}

uint64_t sub_1DAD27448()
{
  return MEMORY[0x1F4104918]();
}

uint64_t sub_1DAD27458()
{
  return MEMORY[0x1F4104920]();
}

uint64_t sub_1DAD27468()
{
  return MEMORY[0x1F4104928]();
}

uint64_t sub_1DAD27478()
{
  return MEMORY[0x1F4104930]();
}

uint64_t sub_1DAD27488()
{
  return MEMORY[0x1F4104938]();
}

uint64_t sub_1DAD27498()
{
  return MEMORY[0x1F4104940]();
}

uint64_t sub_1DAD274A8()
{
  return MEMORY[0x1F4104958]();
}

uint64_t sub_1DAD274B8()
{
  return MEMORY[0x1F4104968]();
}

uint64_t sub_1DAD274C8()
{
  return MEMORY[0x1F4104980]();
}

uint64_t sub_1DAD274D8()
{
  return MEMORY[0x1F4104990]();
}

uint64_t sub_1DAD274E8()
{
  return MEMORY[0x1F4104998]();
}

uint64_t sub_1DAD274F8()
{
  return MEMORY[0x1F41049A0]();
}

uint64_t sub_1DAD27508()
{
  return MEMORY[0x1F41049B8]();
}

uint64_t sub_1DAD27518()
{
  return MEMORY[0x1F41049C0]();
}

uint64_t sub_1DAD27528()
{
  return MEMORY[0x1F41049C8]();
}

uint64_t sub_1DAD27538()
{
  return MEMORY[0x1F41049D0]();
}

uint64_t sub_1DAD27548()
{
  return MEMORY[0x1F4104A08]();
}

uint64_t sub_1DAD27558()
{
  return MEMORY[0x1F4104A10]();
}

uint64_t sub_1DAD27568()
{
  return MEMORY[0x1F4104A18]();
}

uint64_t sub_1DAD27578()
{
  return MEMORY[0x1F4104A20]();
}

uint64_t sub_1DAD27588()
{
  return MEMORY[0x1F4104A30]();
}

uint64_t sub_1DAD27598()
{
  return MEMORY[0x1F4104A38]();
}

uint64_t sub_1DAD275A8()
{
  return MEMORY[0x1F4104A40]();
}

uint64_t sub_1DAD275B8()
{
  return MEMORY[0x1F4104A50]();
}

uint64_t sub_1DAD275C8()
{
  return MEMORY[0x1F4104A58]();
}

uint64_t sub_1DAD275D8()
{
  return MEMORY[0x1F4104A60]();
}

uint64_t sub_1DAD275E8()
{
  return MEMORY[0x1F4104A68]();
}

uint64_t sub_1DAD275F8()
{
  return MEMORY[0x1F4104A70]();
}

uint64_t sub_1DAD27608()
{
  return MEMORY[0x1F4104A78]();
}

uint64_t sub_1DAD27618()
{
  return MEMORY[0x1F4104A80]();
}

uint64_t sub_1DAD27628()
{
  return MEMORY[0x1F4104A88]();
}

uint64_t sub_1DAD27638()
{
  return MEMORY[0x1F4104A90]();
}

uint64_t sub_1DAD27648()
{
  return MEMORY[0x1F4104A98]();
}

uint64_t sub_1DAD27658()
{
  return MEMORY[0x1F4104AA0]();
}

uint64_t sub_1DAD27668()
{
  return MEMORY[0x1F4104AB8]();
}

uint64_t sub_1DAD27678()
{
  return MEMORY[0x1F4104AC0]();
}

uint64_t sub_1DAD27688()
{
  return MEMORY[0x1F4104AC8]();
}

uint64_t sub_1DAD27698()
{
  return MEMORY[0x1F4104AD0]();
}

uint64_t sub_1DAD276A8()
{
  return MEMORY[0x1F4104AD8]();
}

uint64_t sub_1DAD276B8()
{
  return MEMORY[0x1F4104AF0]();
}

uint64_t sub_1DAD276C8()
{
  return MEMORY[0x1F4104AF8]();
}

uint64_t sub_1DAD276D8()
{
  return MEMORY[0x1F4104B08]();
}

uint64_t sub_1DAD276E8()
{
  return MEMORY[0x1F4104B10]();
}

uint64_t sub_1DAD276F8()
{
  return MEMORY[0x1F4104B30]();
}

uint64_t sub_1DAD27708()
{
  return MEMORY[0x1F4104B38]();
}

uint64_t sub_1DAD27718()
{
  return MEMORY[0x1F4104B40]();
}

uint64_t sub_1DAD27728()
{
  return MEMORY[0x1F4104B50]();
}

uint64_t sub_1DAD27738()
{
  return MEMORY[0x1F4104B58]();
}

uint64_t sub_1DAD27748()
{
  return MEMORY[0x1F4104B60]();
}

uint64_t sub_1DAD27758()
{
  return MEMORY[0x1F4104BB8]();
}

uint64_t sub_1DAD27768()
{
  return MEMORY[0x1F4104BC0]();
}

uint64_t sub_1DAD27778()
{
  return MEMORY[0x1F4104BC8]();
}

uint64_t sub_1DAD27788()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1DAD27798()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DAD277A8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1DAD277B8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DAD277C8()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1DAD277D8()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1DAD277E8()
{
  return MEMORY[0x1F4183350]();
}

uint64_t sub_1DAD277F8()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1DAD27808()
{
  return MEMORY[0x1F41833C0]();
}

uint64_t sub_1DAD27818()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1DAD27828()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1DAD27838()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1DAD27848()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1DAD27858()
{
  return MEMORY[0x1F41116B8]();
}

uint64_t sub_1DAD27868()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1DAD27878()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DAD27888()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1DAD27898()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DAD278A8()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1DAD278B8()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1DAD278C8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DAD278D8()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_1DAD278E8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DAD278F8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DAD27908()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DAD27918()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DAD27928()
{
  return MEMORY[0x1F40E6260]();
}

uint64_t sub_1DAD27938()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1DAD27948()
{
  return MEMORY[0x1F40E6278]();
}

uint64_t sub_1DAD27958()
{
  return MEMORY[0x1F40E6290]();
}

uint64_t sub_1DAD27968()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1DAD27978()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DAD27988()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1DAD27998()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1DAD279A8()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1DAD279B8()
{
  return MEMORY[0x1F41838C8]();
}

uint64_t sub_1DAD279C8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1DAD279D8()
{
  return MEMORY[0x1F4183988]();
}

uint64_t sub_1DAD279E8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DAD279F8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DAD27A08()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1DAD27A18()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DAD27A28()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1DAD27A38()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1DAD27A48()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DAD27A58()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1DAD27A68()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1DAD27A78()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1DAD27A88()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1DAD27AA8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1DAD27AB8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1DAD27AC8()
{
  return MEMORY[0x1F4104BD8]();
}

uint64_t sub_1DAD27AD8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1DAD27AE8()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1DAD27AF8()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1DAD27B08()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1DAD27B18()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DAD27B28()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DAD27B38()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DAD27B48()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DAD27B58()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DAD27B68()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1DAD27B78()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DAD27B88()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1DAD27B98()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DAD27BA8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1DAD27BB8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DAD27BC8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1DAD27BD8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1DAD27BE8()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1DAD27BF8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DAD27C08()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1DAD27C18()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1DAD27C28()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DAD27C38()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DAD27C48()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1DAD27C58()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1DAD27C68()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1DAD27C88()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1DAD27C98()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1DAD27CA8()
{
  return MEMORY[0x1F41116C0]();
}

uint64_t sub_1DAD27CB8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1DAD27CC8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1DAD27CD8()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1DAD27CE8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DAD27CF8()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1DAD27D08()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1DAD27D18()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1DAD27D28()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1DAD27D38()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1DAD27D48()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1DAD27D58()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1DAD27D68()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1DAD27D78()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DAD27D88()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DAD27D98()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DAD27DA8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1DAD27DB8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DAD27DC8()
{
  return MEMORY[0x1F4104BF0]();
}

uint64_t sub_1DAD27DD8()
{
  return MEMORY[0x1F41111B8]();
}

uint64_t sub_1DAD27DE8()
{
  return MEMORY[0x1F41111C0]();
}

uint64_t sub_1DAD27DF8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1DAD27E08()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1DAD27E18()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1DAD27E28()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DAD27E38()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1DAD27E48()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1DAD27E58()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1DAD27E68()
{
  return MEMORY[0x1F4187048]();
}

uint64_t sub_1DAD27E78()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1DAD27E88()
{
  return MEMORY[0x1F4187060]();
}

uint64_t sub_1DAD27E98()
{
  return MEMORY[0x1F4187078]();
}

uint64_t sub_1DAD27EA8()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1DAD27EB8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DAD27EC8()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DAD27ED8()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1DAD27EE8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1DAD27EF8()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1DAD27F08()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DAD27F18()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1DAD27F28()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1DAD27F38()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1DAD27F48()
{
  return MEMORY[0x1F4187178]();
}

uint64_t sub_1DAD27F58()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1DAD27F68()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1DAD27F78()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1DAD27F88()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1DAD27F98()
{
  return MEMORY[0x1F4106A08]();
}

uint64_t sub_1DAD27FA8()
{
  return MEMORY[0x1F4106A10]();
}

uint64_t sub_1DAD27FB8()
{
  return MEMORY[0x1F4106A18]();
}

uint64_t sub_1DAD27FC8()
{
  return MEMORY[0x1F4106A20]();
}

uint64_t sub_1DAD27FD8()
{
  return MEMORY[0x1F4106A28]();
}

uint64_t sub_1DAD27FE8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1DAD27FF8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1DAD28008()
{
  return MEMORY[0x1F4104BF8]();
}

uint64_t sub_1DAD28018()
{
  return MEMORY[0x1F41116E0]();
}

uint64_t sub_1DAD28028()
{
  return MEMORY[0x1F41116E8]();
}

uint64_t sub_1DAD28038()
{
  return MEMORY[0x1F41116F0]();
}

uint64_t sub_1DAD28048()
{
  return MEMORY[0x1F41116F8]();
}

uint64_t sub_1DAD28058()
{
  return MEMORY[0x1F4111708]();
}

uint64_t sub_1DAD28068()
{
  return MEMORY[0x1F4111710]();
}

uint64_t sub_1DAD28078()
{
  return MEMORY[0x1F4111720]();
}

uint64_t sub_1DAD28088()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1DAD28098()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1DAD280A8()
{
  return MEMORY[0x1F4111728]();
}

uint64_t sub_1DAD280B8()
{
  return MEMORY[0x1F4111730]();
}

uint64_t sub_1DAD280C8()
{
  return MEMORY[0x1F41872B8]();
}

uint64_t sub_1DAD280D8()
{
  return MEMORY[0x1F41111C8]();
}

uint64_t sub_1DAD280E8()
{
  return MEMORY[0x1F41111D0]();
}

uint64_t sub_1DAD280F8()
{
  return MEMORY[0x1F4111738]();
}

uint64_t sub_1DAD28108()
{
  return MEMORY[0x1F41111D8]();
}

uint64_t sub_1DAD28118()
{
  return MEMORY[0x1F4111740]();
}

uint64_t sub_1DAD28128()
{
  return MEMORY[0x1F40D9728]();
}

uint64_t sub_1DAD28138()
{
  return MEMORY[0x1F40D9730]();
}

uint64_t sub_1DAD28148()
{
  return MEMORY[0x1F41111E0]();
}

uint64_t sub_1DAD28158()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1DAD28168()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_1DAD28178()
{
  return MEMORY[0x1F4104C00]();
}

uint64_t sub_1DAD28188()
{
  return MEMORY[0x1F4104C08]();
}

uint64_t sub_1DAD28198()
{
  return MEMORY[0x1F41111E8]();
}

uint64_t sub_1DAD281A8()
{
  return MEMORY[0x1F4104C10]();
}

uint64_t sub_1DAD281B8()
{
  return MEMORY[0x1F41111F0]();
}

uint64_t sub_1DAD281C8()
{
  return MEMORY[0x1F41111F8]();
}

uint64_t sub_1DAD281D8()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1DAD281E8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1DAD281F8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DAD28208()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1DAD28218()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1DAD28228()
{
  return MEMORY[0x1F40E6AB0]();
}

uint64_t sub_1DAD28238()
{
  return MEMORY[0x1F40E6AD8]();
}

uint64_t sub_1DAD28248()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1DAD28258()
{
  return MEMORY[0x1F4111200]();
}

uint64_t sub_1DAD28268()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1DAD28278()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1DAD28288()
{
  return MEMORY[0x1F4111208]();
}

uint64_t sub_1DAD28298()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DAD282A8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1DAD282B8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DAD282C8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DAD282D8()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1DAD282E8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DAD282F8()
{
  return MEMORY[0x1F41849B0]();
}

uint64_t sub_1DAD28308()
{
  return MEMORY[0x1F4184A80]();
}

uint64_t sub_1DAD28318()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1DAD28338()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DAD28348()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DAD28358()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1DAD28368()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1DAD28378()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1DAD28388()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1DAD28398()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1DAD283A8()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1DAD283B8()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1DAD283C8()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1DAD283D8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1DAD283E8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1DAD283F8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1DAD28408()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1DAD28418()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1DAD28428()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1DAD28438()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1DAD28448()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1DAD28458()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1DAD28468()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1DAD28478()
{
  return MEMORY[0x1F4184C78]();
}

uint64_t sub_1DAD28488()
{
  return MEMORY[0x1F4184C80]();
}

uint64_t sub_1DAD28498()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DAD284A8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DAD284B8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1DAD284C8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1DAD284D8()
{
  return MEMORY[0x1F4184CC8]();
}

uint64_t sub_1DAD284E8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DAD284F8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DAD28508()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1DAD28518()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DAD28528()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DAD28538()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1DAD28548()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1DAD28558()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DAD28568()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1DAD28578()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DAD28588()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DAD28598()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1DAD285A8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DAD285B8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DAD285C8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DAD285D8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1DAD285E8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1DAD285F8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1DAD28608()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DAD28618()
{
  return MEMORY[0x1F41851F0]();
}

uint64_t sub_1DAD28628()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1DAD28638()
{
  return MEMORY[0x1F4185208]();
}

uint64_t sub_1DAD28648()
{
  return MEMORY[0x1F4185210]();
}

uint64_t sub_1DAD28658()
{
  return MEMORY[0x1F4185220]();
}

uint64_t sub_1DAD28668()
{
  return MEMORY[0x1F4185228]();
}

uint64_t sub_1DAD28678()
{
  return MEMORY[0x1F4185230]();
}

uint64_t sub_1DAD28688()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1DAD28698()
{
  return MEMORY[0x1F4185240]();
}

uint64_t sub_1DAD286A8()
{
  return MEMORY[0x1F4185250]();
}

uint64_t sub_1DAD286B8()
{
  return MEMORY[0x1F4185258]();
}

uint64_t sub_1DAD286C8()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1DAD286D8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1DAD286E8()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1DAD286F8()
{
  return MEMORY[0x1F4185288]();
}

uint64_t sub_1DAD28708()
{
  return MEMORY[0x1F4185290]();
}

uint64_t sub_1DAD28718()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DAD28728()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DAD28738()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1DAD28748()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DAD28758()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DAD28768()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DAD28778()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1DAD28788()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DAD28798()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DAD287B8()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1DAD287C8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DAD287D8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1DAD287E8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1DAD287F8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1DAD28808()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1DAD28818()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1DAD28828()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1DAD28838()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1DAD28848()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1DAD28858()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1DAD28868()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1DAD28878()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1DAD28888()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1DAD28898()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1DAD288A8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1DAD288B8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DAD288C8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1DAD288D8()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1DAD288E8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1DAD288F8()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1DAD28908()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DAD28918()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1DAD28938()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DAD28948()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DAD28988()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DAD28998()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DAD289A8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DAD289B8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DAD289C8()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1DAD289D8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DAD289E8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DAD289F8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DAD28A08()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DAD28A18()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1DAD28A28()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1DAD28A38()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1DAD28A48()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1DAD28A58()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1DAD28A68()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1DAD28A98()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1DAD28AA8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BSAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x1F410C168]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1F410C1B0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSIsBeingDebugged()
{
  return MEMORY[0x1F410C410]();
}

uint64_t BSPIDIsBeingDebugged()
{
  return MEMORY[0x1F410C4B8]();
}

uint64_t BSPthreadSetFixedPriority()
{
  return MEMORY[0x1F410C510]();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return MEMORY[0x1F410C5D0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CHSWidgetFamilyDescription()
{
  return MEMORY[0x1F4111788]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

uint64_t CHSWidgetFamilyMaskEnumerateFamilies()
{
  return MEMORY[0x1F41117B8]();
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1F41117C0]();
}

uint64_t NSStringFromCHSControlContentType()
{
  return MEMORY[0x1F41117D8]();
}

uint64_t NSStringFromCHSWidgetContentType()
{
  return MEMORY[0x1F41117E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromWRWidgetReloadReason()
{
  return MEMORY[0x1F4176C58]();
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DD0]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x1F4166B78](*(void *)&argc, argv, principalClassName, delegateClassName);
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

uint64_t _CHSUniqueWidgetRateLimitConfigurationName()
{
  return MEMORY[0x1F41117F8]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1F40DF020]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1F40DF1D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1F40CA130]();
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

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1F40CA660](__count, __size);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
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

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_events_subscribe()
{
  return MEMORY[0x1F415CCD8]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}