uint64_t sub_24C765938()
{
  uint64_t v0;
  uint64_t vars8;

  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24C765970@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_24C76D148();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_24C76D168();
  swift_allocObject();
  uint64_t v9 = sub_24C76D158();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t sub_24C765AA0(char *a1)
{
  v197 = a1;
  uint64_t v1 = sub_24C76D138();
  v198 = *(char **)(v1 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v186 = (char *)&v170 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697ED820);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v191 = (char *)&v170 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v190 = (char *)&v170 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v184 = (char *)&v170 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v183 = (char *)&v170 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v182 = (char *)&v170 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v177 = (char *)&v170 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v181 = (char *)&v170 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v180 = (char *)&v170 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v185 = (char *)&v170 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v23 = (char *)&v170 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v26 = (char *)&v170 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  v29 = (char *)&v170 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  v172 = (char *)&v170 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v179 = (char *)&v170 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v36 = (char *)&v170 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  v178 = (char *)&v170 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v176 = (char *)&v170 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v43 = (char *)&v170 - v42;
  uint64_t v44 = MEMORY[0x270FA5388](v41);
  v175 = (char *)&v170 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v174 = (char *)&v170 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v50 = (char *)&v170 - v49;
  uint64_t v51 = MEMORY[0x270FA5388](v48);
  v173 = (char *)&v170 - v52;
  uint64_t v53 = MEMORY[0x270FA5388](v51);
  v171 = (char *)&v170 - v54;
  MEMORY[0x270FA5388](v53);
  v56 = (char *)&v170 - v55;
  uint64_t v57 = sub_24C76D0C8();
  MEMORY[0x270FA5388](v57);
  v59 = (char *)&v170 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = v60;
  v61 = *(void (**)(char *, char *))(v60 + 16);
  uint64_t v192 = v62;
  v61(v59, v197);
  v63 = (void (*)(char *, void, uint64_t, uint64_t))*((void *)v198 + 7);
  v196 = v56;
  uint64_t v189 = v1;
  v187 = v63;
  v188 = v198 + 56;
  v63(v56, 1, 1, v1);
  v197 = v59;
  uint64_t v64 = sub_24C76D0A8();
  unint64_t v65 = v64;
  if (v64 <= (uint64_t)0xF92368B0DC2BDCC5)
  {
    v185 = v50;
    v72 = v43;
    v73 = v36;
    uint64_t v70 = (uint64_t)v190;
    v74 = v191;
    if (v64 <= (uint64_t)0xAA9E7E89658C60C6)
    {
      uint64_t v85 = v195;
      v86 = v197;
      if (v64 > (uint64_t)0x92C89C79D4633700)
      {
        if (v64 == 0x92C89C79D4633701)
        {
          sub_24C768B6C((uint64_t)(v194 + 3), (uint64_t)v199);
          uint64_t v70 = v200;
          uint64_t v102 = v201;
          v194 = __swift_project_boxed_opaque_existential_1(v199, v200);
          unint64_t v103 = sub_24C76D0A8();
          uint64_t v104 = v85;
          unint64_t v105 = sub_24C768828(0, v103);
          unsigned int v106 = sub_24C76D098();
          uint64_t v107 = sub_24C76D098();
          uint64_t v108 = sub_24C76D0A8();
          if (v108 == 0x5FE91FEE7BE681E1)
          {
            uint64_t v109 = v102;
            uint64_t v110 = 1;
          }
          else
          {
            v29 = (char *)v108;
            if (v108 != 0xB4634D822B7084E5) {
              goto LABEL_241;
            }
            uint64_t v109 = v102;
            uint64_t v110 = 0;
          }
          v66 = v197;
          if (!v104)
          {
            (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v109 + 112))(v105, v106 | (unint64_t)(v107 << 32), v110, v70);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
            sub_24C76D0B8();
            uint64_t v79 = v189;
            v187(v23, 0, 1, v189);
            uint64_t v154 = (uint64_t)v23;
            goto LABEL_88;
          }
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
          goto LABEL_122;
        }
        if (v64 == 0x9A31449AF781DAA1)
        {
          uint64_t v87 = v194[6];
          uint64_t v88 = v194[7];
          __swift_project_boxed_opaque_existential_1(v194 + 3, v87);
          uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v88 + 184))(v87, v88);
          v66 = v86;
          sub_24C76D0B8();
          v29 = v198;
          if (v85) {
            goto LABEL_121;
          }
          uint64_t v79 = v189;
          v187(v74, 0, 1, v189);
          uint64_t v89 = (uint64_t)v74;
          uint64_t v80 = (uint64_t)v196;
          goto LABEL_139;
        }
        if (v64 != 0x9A8ED7C9F66DB4DCLL) {
          goto LABEL_239;
        }
        v66 = v197;
        uint64_t v133 = v194[6];
        uint64_t v134 = v194[7];
        __swift_project_boxed_opaque_existential_1(v194 + 3, v133);
        (*(void (**)(uint64_t, uint64_t))(v134 + 168))(v133, v134);
        uint64_t v70 = (uint64_t)v184;
        uint64_t v135 = v85;
LABEL_120:
        sub_24C76D0B8();
        if (v135) {
          goto LABEL_121;
        }
        goto LABEL_123;
      }
      if (v64 == 0x8459910482DE32B0)
      {
        uint64_t v100 = v194[6];
        uint64_t v101 = v194[7];
        __swift_project_boxed_opaque_existential_1(v194 + 3, v100);
        (*(void (**)(uint64_t, uint64_t))(v101 + 96))(v100, v101);
        uint64_t v70 = (uint64_t)v29;
        v66 = v86;
        sub_24C76D0B8();
        v29 = v198;
        if (v85) {
          goto LABEL_121;
        }
        uint64_t v79 = v189;
        v187((char *)v70, 0, 1, v189);
        uint64_t v95 = v70;
        goto LABEL_40;
      }
      if (v64 != 0x8BBD137760ACEDA0)
      {
LABEL_239:
        v199[0] = 0;
        v199[1] = 0xE000000000000000;
        sub_24C76D188();
        sub_24C76D178();
        unint64_t v205 = v65;
        sub_24C76D1A8();
        sub_24C76D178();
        swift_bridgeObjectRelease();
        goto LABEL_240;
      }
      uint64_t v136 = v194[6];
      uint64_t v137 = v194[7];
      __swift_project_boxed_opaque_existential_1(v194 + 3, v136);
      (*(void (**)(uint64_t, uint64_t))(v137 + 48))(v136, v137);
      uint64_t v70 = (uint64_t)v72;
      sub_24C76D0B8();
      v66 = v86;
      if (v85) {
        goto LABEL_121;
      }
    }
    else
    {
      uint64_t v75 = v195;
      v66 = v197;
      if (v64 > (uint64_t)0xE9AA53E884DC53ECLL)
      {
        if (v64 == 0xE9AA53E884DC53EDLL)
        {
          uint64_t v113 = v194[6];
          uint64_t v114 = v194[7];
          __swift_project_boxed_opaque_existential_1(v194 + 3, v113);
          char v115 = sub_24C76D078();
          uint64_t v70 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v114 + 128))(v115 & 1, v113, v114);
          uint64_t v116 = (uint64_t)v180;
          sub_24C76D0B8();
          if (!v75)
          {
            uint64_t v79 = v189;
            v187((char *)v116, 0, 1, v189);
            uint64_t v80 = (uint64_t)v196;
            sub_24C768B04(v116, (uint64_t)v196);
            v29 = v198;
            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
              goto LABEL_235;
            }
            goto LABEL_233;
          }
          goto LABEL_121;
        }
        if (v64 != 0xED1379E084BB7E44)
        {
          if (v64 == 0xEF371B9ADE485750)
          {
            uint64_t v140 = v194[6];
            uint64_t v141 = v194[7];
            __swift_project_boxed_opaque_existential_1(v194 + 3, v140);
            uint64_t v142 = sub_24C76D0A8();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 24))(v142, v140, v141);
            uint64_t v70 = (uint64_t)v185;
            sub_24C76D0B8();
            if (!v75)
            {
              uint64_t v79 = v189;
              v187((char *)v70, 0, 1, v189);
              uint64_t v80 = (uint64_t)v196;
              sub_24C768B04(v70, (uint64_t)v196);
              v29 = v198;
              if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
                goto LABEL_235;
              }
              sub_24C76D108();
              goto LABEL_80;
            }
            goto LABEL_121;
          }
          goto LABEL_239;
        }
        uint64_t v91 = v194[6];
        uint64_t v90 = v194[7];
        __swift_project_boxed_opaque_existential_1(v194 + 3, v91);
        (*(void (**)(uint64_t, uint64_t))(v90 + 176))(v91, v90);
      }
      else
      {
        if (v64 != 0xAA9E7E89658C60C7)
        {
          if (v64 == 0xB0FDC6F7A36AD198)
          {
            uint64_t v77 = v194[6];
            uint64_t v76 = v194[7];
            __swift_project_boxed_opaque_existential_1(v194 + 3, v77);
            (*(void (**)(uint64_t, uint64_t))(v76 + 144))(v77, v76);
            uint64_t v78 = (uint64_t)v177;
            sub_24C76D0B8();
            if (!v75)
            {
              uint64_t v79 = v189;
              v187((char *)v78, 0, 1, v189);
              uint64_t v80 = (uint64_t)v196;
              sub_24C768B04(v78, (uint64_t)v196);
              v29 = v198;
              if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
                goto LABEL_235;
              }
              goto LABEL_233;
            }
            goto LABEL_121;
          }
          if (v64 == 0xE4883D286D903511)
          {
            uint64_t v70 = v194[6];
            uint64_t v138 = v194[7];
            __swift_project_boxed_opaque_existential_1(v194 + 3, v70);
            char v139 = sub_24C76D078();
            (*(void (**)(long long *__return_ptr, void, uint64_t, uint64_t))(v138 + 104))(&v202, v139 & 1, v70, v138);
            uint64_t v80 = (uint64_t)v196;
            sub_24C76D0B8();
            if (v75)
            {
              (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
              goto LABEL_238;
            }
            uint64_t v79 = v189;
            v187(v26, 0, 1, v189);
            sub_24C768B04((uint64_t)v26, v80);
            v29 = v198;
            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
              goto LABEL_235;
            }
            sub_24C768C20(&v202, (uint64_t)&v203);
            if (v204 != 1)
            {
              sub_24C76D118();
              sub_24C76D118();
              sub_24C76D0E8();
              sub_24C76D108();
              sub_24C76D0F8();
              sub_24C76D0F8();
              sub_24C76D0F8();
              sub_24C76D118();
              uint64_t v80 = (uint64_t)v196;
            }
            goto LABEL_233;
          }
          goto LABEL_239;
        }
        uint64_t v111 = v194[6];
        uint64_t v112 = v194[7];
        __swift_project_boxed_opaque_existential_1(v194 + 3, v111);
        (*(void (**)(uint64_t, uint64_t))(v112 + 72))(v111, v112);
        uint64_t v70 = (uint64_t)v73;
      }
      sub_24C76D0B8();
      if (v75) {
        goto LABEL_121;
      }
    }
LABEL_123:
    uint64_t v79 = v189;
    v187((char *)v70, 0, 1, v189);
    uint64_t v80 = (uint64_t)v196;
    sub_24C768B04(v70, (uint64_t)v196);
    v29 = v198;
    goto LABEL_235;
  }
  if (v64 > 0x31BF4070DB2F13F5)
  {
    uint64_t v81 = v195;
    if (v64 <= 0x5AB466FC8E211106)
    {
      v29 = v198;
      if (v64 == 0x31BF4070DB2F13F6)
      {
        uint64_t v121 = v194[6];
        uint64_t v122 = v194[7];
        __swift_project_boxed_opaque_existential_1(v194 + 3, v121);
        uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v122 + 152))(v121, v122);
        uint64_t v123 = (uint64_t)v182;
        v66 = v197;
        sub_24C76D0B8();
        if (!v81)
        {
          uint64_t v79 = v189;
          v187((char *)v123, 0, 1, v189);
          uint64_t v80 = (uint64_t)v196;
          sub_24C768B04(v123, (uint64_t)v196);
          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v29 + 6))(v80, 1, v79)) {
            goto LABEL_235;
          }
          goto LABEL_233;
        }
        goto LABEL_121;
      }
      if (v64 != 0x3B97179C438E7D3FLL)
      {
        v66 = v197;
        if (v64 == 0x4AEFB38382AAD867)
        {
          uint64_t v148 = v194[6];
          uint64_t v149 = v194[7];
          __swift_project_boxed_opaque_existential_1(v194 + 3, v148);
          uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v149 + 136))(v148, v149);
          uint64_t v150 = (uint64_t)v181;
          sub_24C76D0B8();
          if (!v81)
          {
            uint64_t v79 = v189;
            v187((char *)v150, 0, 1, v189);
            uint64_t v80 = (uint64_t)v196;
            sub_24C768B04(v150, (uint64_t)v196);
            v29 = v198;
            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
              goto LABEL_235;
            }
            goto LABEL_233;
          }
          goto LABEL_121;
        }
        goto LABEL_239;
      }
      uint64_t v83 = v194[6];
      uint64_t v82 = v194[7];
      __swift_project_boxed_opaque_existential_1(v194 + 3, v83);
      (*(void (**)(uint64_t, uint64_t))(v82 + 16))(v83, v82);
      uint64_t v70 = (uint64_t)v173;
      v84 = v197;
      sub_24C76D0B8();
      if (!v81)
      {
        uint64_t v79 = v189;
        v187((char *)v70, 0, 1, v189);
        uint64_t v80 = (uint64_t)v196;
        sub_24C768B04(v70, (uint64_t)v196);
        if (!(*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v29 + 6))(v80, 1, v79))
        {
          sub_24C76D0D8();
          uint64_t v79 = v189;
        }
        v66 = v197;
        goto LABEL_235;
      }
      (*(void (**)(char *, uint64_t))(v193 + 8))(v84, v192);
LABEL_122:
      uint64_t v80 = (uint64_t)v196;
      goto LABEL_238;
    }
    v29 = v198;
    if (v64 != 0x5AB466FC8E211107)
    {
      v66 = v197;
      if (v64 != 0x60019795105E77C2)
      {
        if (v64 == 0x6235F79F0F251BA0)
        {
          uint64_t v155 = v194[6];
          uint64_t v156 = v194[7];
          __swift_project_boxed_opaque_existential_1(v194 + 3, v155);
          uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v156 + 40))(v155, v156);
          uint64_t v157 = (uint64_t)v175;
          sub_24C76D0B8();
          if (!v81)
          {
            uint64_t v79 = v189;
            v187((char *)v157, 0, 1, v189);
            uint64_t v80 = (uint64_t)v196;
            sub_24C768B04(v157, (uint64_t)v196);
            v29 = v198;
            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
              goto LABEL_235;
            }
            goto LABEL_233;
          }
          goto LABEL_121;
        }
        goto LABEL_239;
      }
      sub_24C768B6C((uint64_t)(v194 + 3), (uint64_t)v199);
      uint64_t v70 = v200;
      uint64_t v96 = v201;
      __swift_project_boxed_opaque_existential_1(v199, v200);
      uint64_t v97 = sub_24C76D0A8();
      uint64_t v98 = v97;
      if (v97 > 0x1BE64C0ED6CCA263)
      {
        if (v97 == 0x676FBAD1519B8185)
        {
          uint64_t v99 = 0;
          goto LABEL_136;
        }
        if (v97 == 0x1BE64C0ED6CCA264)
        {
          uint64_t v99 = 1;
          goto LABEL_136;
        }
      }
      else
      {
        if (v97 == 0xD6613FF83D8E2F88)
        {
          uint64_t v99 = 3;
LABEL_136:
          uint64_t v80 = (uint64_t)v196;
          if (v81)
          {
            (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
            goto LABEL_229;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 8))(v99, v70, v96);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
          v165 = v171;
          sub_24C76D0B8();
          uint64_t v79 = v189;
          v187(v165, 0, 1, v189);
          uint64_t v89 = (uint64_t)v165;
LABEL_139:
          sub_24C768B04(v89, v80);
          goto LABEL_140;
        }
        if (v97 == 0x1469D4460360BC17)
        {
          uint64_t v99 = 2;
          goto LABEL_136;
        }
      }
LABEL_242:
      unint64_t v205 = 0;
      unint64_t v206 = 0xE000000000000000;
      sub_24C76D188();
      swift_bridgeObjectRelease();
      unint64_t v205 = 0xD00000000000001ALL;
      unint64_t v206 = 0x800000024C76D7D0;
      v207 = (char *)v98;
      sub_24C76D1A8();
      sub_24C76D178();
      swift_bridgeObjectRelease();
      goto LABEL_240;
    }
    sub_24C768B6C((uint64_t)(v194 + 3), (uint64_t)v199);
    uint64_t v70 = v200;
    uint64_t v129 = v201;
    __swift_project_boxed_opaque_existential_1(v199, v200);
    v130 = v197;
    uint64_t v131 = sub_24C76D0A8();
    if (v131 == 0x371451BC23D3ED89)
    {
      uint64_t v132 = 1;
    }
    else
    {
      uint64_t v98 = v131;
      if (v131 != 0xE943957390EDD167) {
        goto LABEL_242;
      }
      uint64_t v132 = 0;
    }
    uint64_t v80 = (uint64_t)v196;
    if (v81)
    {
      (*(void (**)(char *, uint64_t))(v193 + 8))(v130, v192);
      goto LABEL_229;
    }
    char v158 = sub_24C76D078();
    char v159 = sub_24C76D078();
    uint64_t v160 = sub_24C76D098();
    BOOL v161 = (v159 & 1) == 0;
    v66 = v130;
    uint64_t v162 = 0x10000;
    if (v161) {
      uint64_t v162 = 0;
    }
    uint64_t v163 = v162 | (v160 << 32);
    uint64_t v164 = 256;
    if ((v158 & 1) == 0) {
      uint64_t v164 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 88))(v163 | v164 | v132, v70, v129);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
    uint64_t v70 = (uint64_t)v172;
    uint64_t v135 = 0;
    goto LABEL_120;
  }
  if (v64 <= 0x2D198AE7D7D567D7)
  {
    v66 = v197;
    if (v64 == 0xF92368B0DC2BDCC6)
    {
      uint64_t v117 = v194[6];
      uint64_t v118 = v194[7];
      __swift_project_boxed_opaque_existential_1(v194 + 3, v117);
      uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v118 + 160))(v117, v118);
      uint64_t v119 = (uint64_t)v183;
      uint64_t v120 = v195;
      sub_24C76D0B8();
      if (!v120)
      {
        uint64_t v79 = v189;
        v187((char *)v119, 0, 1, v189);
        uint64_t v80 = (uint64_t)v196;
        sub_24C768B04(v119, (uint64_t)v196);
        v29 = v198;
        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
          goto LABEL_235;
        }
        goto LABEL_233;
      }
      goto LABEL_121;
    }
    uint64_t v67 = v195;
    if (v64 == 0x31EB8B1F9F153B4)
    {
      uint64_t v68 = v194[6];
      uint64_t v69 = v194[7];
      __swift_project_boxed_opaque_existential_1(v194 + 3, v68);
      uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v69 + 32))(v68, v69);
      v71 = v174;
      sub_24C76D0B8();
      if (!v67) {
        goto LABEL_87;
      }
      goto LABEL_121;
    }
    if (v64 == 0x27639B712DF9D8DELL)
    {
      uint64_t v143 = v194[6];
      uint64_t v144 = v194[7];
      __swift_project_boxed_opaque_existential_1(v194 + 3, v143);
      (*(void (**)(uint64_t, uint64_t))(v144 + 64))(v143, v144);
      uint64_t v70 = v145;
      v146 = v178;
      sub_24C76D0B8();
      if (!v67)
      {
        uint64_t v79 = v189;
        v187(v146, 0, 1, v189);
        uint64_t v147 = (uint64_t)v146;
        uint64_t v80 = (uint64_t)v196;
        sub_24C768B04(v147, (uint64_t)v196);
        v29 = v198;
        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v198 + 6))(v80, 1, v79)) {
          goto LABEL_235;
        }
        if ((v70 & 0x100000000) == 0)
        {
          sub_24C76D118();
          sub_24C76D118();
LABEL_80:
          sub_24C76D108();
          goto LABEL_234;
        }
LABEL_233:
        sub_24C76D118();
        goto LABEL_234;
      }
LABEL_121:
      (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
      goto LABEL_122;
    }
    goto LABEL_239;
  }
  v66 = v197;
  if (v64 == 0x2D198AE7D7D567D8)
  {
    sub_24C768B6C((uint64_t)(v194 + 3), (uint64_t)v199);
    uint64_t v124 = v200;
    uint64_t v125 = v201;
    __swift_project_boxed_opaque_existential_1(v199, v200);
    v29 = v66;
    uint64_t v126 = sub_24C76D0A8();
    uint64_t v127 = v126;
    v128 = v198;
    v194 = (void *)v124;
    if (v126 <= (uint64_t)0xEBD1015A2B9EB77BLL)
    {
      uint64_t v80 = (uint64_t)v196;
      if (v126 <= (uint64_t)0xB76BD80C1D29A5DCLL)
      {
        if (v126 > (uint64_t)0x9D4B7954B05BFDBDLL)
        {
          if (v126 <= (uint64_t)0xA123AEFB86EACA52)
          {
            if (v126 == 0x9D4B7954B05BFDBELL)
            {
              uint64_t v70 = 20;
              goto LABEL_227;
            }
            if (v126 == 0x9FB4FE7B8C107ED7)
            {
              uint64_t v70 = 23;
              goto LABEL_227;
            }
          }
          else
          {
            switch(v126)
            {
              case 0xA123AEFB86EACA53:
                uint64_t v70 = 39;
                goto LABEL_227;
              case 0xA13AE2AABE773446:
                uint64_t v70 = 31;
                goto LABEL_227;
              case 0xAACEDDC4B24F04BBLL:
                uint64_t v70 = 19;
                goto LABEL_227;
            }
          }
        }
        else if (v126 <= (uint64_t)0x8E9889B77234E946)
        {
          if (v126 == 0x84035BF99132125ELL)
          {
            uint64_t v70 = 9;
            goto LABEL_227;
          }
          if (v126 == 0x88394872043826BDLL)
          {
            uint64_t v70 = 6;
            goto LABEL_227;
          }
        }
        else
        {
          switch(v126)
          {
            case 0x8E9889B77234E947:
              uint64_t v70 = 4;
              goto LABEL_227;
            case 0x8F1538728B7CDEA4:
              uint64_t v70 = 27;
              goto LABEL_227;
            case 0x91EC7732FD261E2ELL:
              uint64_t v70 = 41;
              goto LABEL_227;
          }
        }
      }
      else if (v126 <= (uint64_t)0xD53D863AB432198ALL)
      {
        if (v126 <= (uint64_t)0xCC92900C433FE06CLL)
        {
          if (v126 == 0xB76BD80C1D29A5DDLL)
          {
            uint64_t v70 = 13;
            goto LABEL_227;
          }
          if (v126 == 0xC89696D3BDD2FCF0)
          {
            uint64_t v70 = 5;
            goto LABEL_227;
          }
        }
        else
        {
          switch(v126)
          {
            case 0xCC92900C433FE06DLL:
              uint64_t v70 = 18;
              goto LABEL_227;
            case 0xD124D0A81190947FLL:
              uint64_t v70 = 29;
              goto LABEL_227;
            case 0xD1729F554A45BDECLL:
              uint64_t v70 = 26;
              goto LABEL_227;
          }
        }
      }
      else if (v126 > (uint64_t)0xDCCBE59234188422)
      {
        switch(v126)
        {
          case 0xDCCBE59234188423:
            uint64_t v70 = 42;
            goto LABEL_227;
          case 0xE1B29391201EDA1DLL:
            uint64_t v70 = 35;
            goto LABEL_227;
          case 0xE5ABCB70FB0576BALL:
            uint64_t v70 = 32;
            goto LABEL_227;
        }
      }
      else
      {
        switch(v126)
        {
          case 0xD53D863AB432198BLL:
            uint64_t v70 = 11;
            goto LABEL_227;
          case 0xD76D6E510A1C7BE3:
            uint64_t v70 = 21;
            goto LABEL_227;
          case 0xDA26D915BB129394:
            uint64_t v70 = 14;
            goto LABEL_227;
        }
      }
    }
    else
    {
      uint64_t v80 = (uint64_t)v196;
      if (v126 > 0x1BF81CE64F07AF5ELL)
      {
        if (v126 <= 0x5DEB4BD3591B78E3)
        {
          if (v126 <= 0x2F2B502739B04598)
          {
            if (v126 == 0x1BF81CE64F07AF5FLL)
            {
              uint64_t v70 = 15;
              goto LABEL_227;
            }
            if (v126 == 0x2AC83335E2A52E86)
            {
              uint64_t v70 = 10;
              goto LABEL_227;
            }
          }
          else
          {
            switch(v126)
            {
              case 0x2F2B502739B04599:
                uint64_t v70 = 8;
                goto LABEL_227;
              case 0x418732BF980FEFD2:
                uint64_t v70 = 36;
                goto LABEL_227;
              case 0x42841AE7412F624ELL:
                uint64_t v70 = 37;
                goto LABEL_227;
            }
          }
        }
        else if (v126 > 0x78DF870862C02B91)
        {
          switch(v126)
          {
            case 0x78DF870862C02B92:
              uint64_t v70 = 25;
              goto LABEL_227;
            case 0x7AB3544148B1E1B7:
              uint64_t v70 = 7;
              goto LABEL_227;
            case 0x7F5D3A1A2CB8F720:
              uint64_t v70 = 3;
              goto LABEL_227;
          }
        }
        else
        {
          switch(v126)
          {
            case 0x5DEB4BD3591B78E4:
              uint64_t v70 = 28;
              goto LABEL_227;
            case 0x656AA29B2034004ELL:
              uint64_t v70 = 40;
              goto LABEL_227;
            case 0x714EE36D8BEDD13ELL:
              uint64_t v70 = 2;
              goto LABEL_227;
          }
        }
      }
      else if (v126 <= 0x6B4AA5139D1C4ALL)
      {
        if (v126 <= (uint64_t)0xF939AE07D1B76442)
        {
          if (v126 == 0xEBD1015A2B9EB77CLL)
          {
            uint64_t v70 = 12;
            goto LABEL_227;
          }
          if (v126 == 0xF7A18E1D22D08A91)
          {
            uint64_t v70 = 0;
            goto LABEL_227;
          }
        }
        else
        {
          switch(v126)
          {
            case 0xF939AE07D1B76443:
              uint64_t v70 = 17;
              goto LABEL_227;
            case 0xFBAF50BAF192177FLL:
              uint64_t v70 = 22;
              goto LABEL_227;
            case 0xFC78C82705D56FD3:
              uint64_t v70 = 30;
              goto LABEL_227;
          }
        }
      }
      else if (v126 > 0x113C060897761B62)
      {
        switch(v126)
        {
          case 0x113C060897761B63:
            uint64_t v70 = 38;
            goto LABEL_227;
          case 0x19DBCC66CD1226D8:
            uint64_t v70 = 16;
            goto LABEL_227;
          case 0x1AC4EDF324CC3F83:
            uint64_t v70 = 1;
            goto LABEL_227;
        }
      }
      else
      {
        switch(v126)
        {
          case 0x6B4AA5139D1C4BLL:
            uint64_t v70 = 33;
            goto LABEL_227;
          case 0x3D3D863DC239E3ELL:
            uint64_t v70 = 34;
LABEL_227:
            uint64_t v166 = (uint64_t)v185;
            if (!v195)
            {
              char v167 = sub_24C76D078();
              v66 = v29;
              (*(void (**)(uint64_t, void, void *, uint64_t))(v125 + 120))(v70, v167 & 1, v194, v125);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
              sub_24C76D0B8();
              uint64_t v79 = v189;
              v187((char *)v166, 0, 1, v189);
              sub_24C768B04(v166, v80);
              v29 = v128;
              if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v128 + 6))(v80, 1, v79)) {
                goto LABEL_235;
              }
              goto LABEL_233;
            }
            (*(void (**)(char *, uint64_t))(v193 + 8))(v29, v192);
LABEL_229:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
            goto LABEL_238;
          case 0xE1551273F2C8F91:
            uint64_t v70 = 24;
            goto LABEL_227;
        }
      }
    }
    unint64_t v205 = 0;
    unint64_t v206 = 0xE000000000000000;
    sub_24C76D188();
    swift_bridgeObjectRelease();
    unint64_t v205 = 0xD00000000000001ALL;
    unint64_t v206 = 0x800000024C76D7D0;
    v207 = (char *)v127;
    sub_24C76D1A8();
    sub_24C76D178();
    swift_bridgeObjectRelease();
    while (1)
    {
LABEL_240:
      sub_24C76D198();
      __break(1u);
LABEL_241:
      unint64_t v205 = 0;
      unint64_t v206 = 0xE000000000000000;
      sub_24C76D188();
      swift_bridgeObjectRelease();
      unint64_t v205 = 0xD00000000000001ALL;
      unint64_t v206 = 0x800000024C76D7D0;
      v207 = v29;
      sub_24C76D1A8();
      sub_24C76D178();
      swift_bridgeObjectRelease();
    }
  }
  if (v64 == 0x2FCE95A5051B2A83)
  {
    uint64_t v70 = v194[6];
    uint64_t v92 = v194[7];
    __swift_project_boxed_opaque_existential_1(v194 + 3, v70);
    (*(void (**)(uint64_t, uint64_t))(v92 + 56))(v70, v92);
    v93 = v176;
    uint64_t v94 = v195;
    sub_24C76D0B8();
    v29 = v198;
    if (v94) {
      goto LABEL_121;
    }
    uint64_t v79 = v189;
    v187(v93, 0, 1, v189);
    uint64_t v95 = (uint64_t)v93;
LABEL_40:
    uint64_t v80 = (uint64_t)v196;
    sub_24C768B04(v95, (uint64_t)v196);
    goto LABEL_235;
  }
  uint64_t v151 = v195;
  if (v64 != 0x2FECE9015A139163) {
    goto LABEL_239;
  }
  uint64_t v152 = v194[6];
  uint64_t v153 = v194[7];
  __swift_project_boxed_opaque_existential_1(v194 + 3, v152);
  uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v153 + 80))(v152, v153);
  v71 = v179;
  sub_24C76D0B8();
  if (v151) {
    goto LABEL_121;
  }
LABEL_87:
  uint64_t v79 = v189;
  v187(v71, 0, 1, v189);
  uint64_t v154 = (uint64_t)v71;
LABEL_88:
  uint64_t v80 = (uint64_t)v196;
  sub_24C768B04(v154, (uint64_t)v196);
  v29 = v198;
LABEL_140:
  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v29 + 6))(v80, 1, v79)) {
    goto LABEL_235;
  }
  sub_24C76D0D8();
LABEL_234:
  uint64_t v79 = v189;
LABEL_235:
  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v29 + 6))(v80, 1, v79))
  {
    (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
    uint64_t v70 = 0;
  }
  else
  {
    v168 = v186;
    (*((void (**)(char *, uint64_t, uint64_t))v29 + 2))(v186, v80, v79);
    uint64_t v70 = sub_24C76D128();
    (*((void (**)(char *, uint64_t))v29 + 1))(v168, v79);
    (*(void (**)(char *, uint64_t))(v193 + 8))(v66, v192);
  }
LABEL_238:
  sub_24C768AA4(v80);
  return v70;
}

uint64_t sub_24C7686AC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_24C7686EC(char *a1)
{
  return sub_24C765AA0(a1);
}

uint64_t sub_24C768710()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SiriVoiceTriggerService()
{
  return self;
}

uint64_t type metadata accessor for SiriVoiceTriggerService.Service()
{
  return self;
}

uint64_t type metadata accessor for SiriVoiceTriggerService.Server()
{
  return self;
}

unint64_t sub_24C768790()
{
  unint64_t result = qword_2697ED818;
  if (!qword_2697ED818)
  {
    type metadata accessor for SiriVoiceTriggerService.Server();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697ED818);
  }
  return result;
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

unint64_t sub_24C768828(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return v5;
    }
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t result = (unint64_t)sub_24C768944(0, v4 & ~(v4 >> 63), 0);
    BOOL v6 = a2 >= v3;
    uint64_t v7 = a2 - v3;
    if (v6 && (v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = v12;
      while (1)
      {
        uint64_t result = sub_24C76D088();
        int v9 = v8;
        unint64_t v11 = *(void *)(v12 + 16);
        unint64_t v10 = *(void *)(v12 + 24);
        if (v11 >= v10 >> 1) {
          uint64_t result = (unint64_t)sub_24C768944((char *)(v10 > 1), v11 + 1, 1);
        }
        *(void *)(v12 + 16) = v11 + 1;
        *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
        if (!v7) {
          break;
        }
        --v7;
        if (!--v4) {
          return v5;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_17;
  }
  if ((uint64_t)(a2 - result) >= 0) {
    goto LABEL_5;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_24C768944(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C768964(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_24C768964(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697ED828);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24C768AA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697ED820);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C768B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697ED820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C768B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24C768C20(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(unsigned char *)(a2 + 48) = *((unsigned char *)a1 + 48);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceTriggerSecondPassResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceTriggerSecondPassResult(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for VoiceTriggerSecondPassResult(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 49) = v3;
  return result;
}

uint64_t sub_24C768CF0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24C768D10(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 48) = 1;
  }
  else
  {
    *(unsigned char *)(result + 48) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceTriggerSecondPassResult()
{
  return &type metadata for VoiceTriggerSecondPassResult;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceTriggerSecondPassResultTriggered(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for VoiceTriggerSecondPassResultTriggered(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for VoiceTriggerSecondPassResultTriggered()
{
  return &type metadata for VoiceTriggerSecondPassResultTriggered;
}

void sub_24C76B310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_24C76B6B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_24C76BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24C76BE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24C76C7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *f32__v_visit(unsigned __int8 *result, uint64_t a2)
{
  char v3 = result;
  int v4 = *result;
  if (v4 != 1)
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        if (*((void *)result + 2))
        {
          unint64_t v5 = 0;
          do
          {
            __n128 result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, float))(a2 + 16))(a2, v5, *(float *)(v3[1] + 4 * v5));
            ++v5;
          }
          while (v5 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/CoreSpeech_Common/install/TempContent/Objects/CoreSpeech.build/CoreSpeechExclave.build/DerivedSources/CoreSpeechExclave_C.c", 1509);
      _os_crash();
      __break(1u);
LABEL_16:
      __n128 result = (unsigned __int8 *)_os_crash();
      __break(1u);
      return result;
    }
    __n128 result = (unsigned __int8 *)tb_message_subrange();
    if (!result) {
      return result;
    }
    _os_crash();
    __break(1u);
  }
  tb_transport_message_buffer_wrap_buffer();
  if (tb_message_construct()) {
    goto LABEL_16;
  }
  __n128 result = (unsigned __int8 *)tb_message_configure_received();
  if (v3[3])
  {
    unint64_t v6 = 0;
    do
    {
      tb_message_decode_f32();
      __n128 result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, float))(a2 + 16))(a2, v6++, 0.0);
    }
    while (v6 < v3[3]);
  }
  return result;
}

uint64_t __f32__v_visit_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 32))
  {
    unint64_t v2 = 0;
    do
    {
      tb_message_decode_f32();
      (*(void (**)(float))(*(void *)(a1 + 32) + 16))(0.0);
      ++v2;
    }
    while (v2 < *(void *)(*(void *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t __f32__v_sizeof_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __f32__v_encode_block_invoke(uint64_t result)
{
  return result;
}

uint64_t __f32__v_encode_block_invoke_2(uint64_t a1)
{
  return MEMORY[0x270F7E1E8](*(void *)(a1 + 32));
}

uint64_t corespeechexclave_sirivoicetriggerservice_bargeinprocess()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  long long v2 = 0u;
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = tb_client_connection_message_construct();
  if (!result)
  {
    tb_message_encode_u64();
    tb_message_complete();
    uint64_t v1 = 0;
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t sub_24C76D078()
{
  return MEMORY[0x270F7DF58]();
}

uint64_t sub_24C76D088()
{
  return MEMORY[0x270F7DF68]();
}

uint64_t sub_24C76D098()
{
  return MEMORY[0x270F7DFA0]();
}

uint64_t sub_24C76D0A8()
{
  return MEMORY[0x270F7DFB0]();
}

uint64_t sub_24C76D0B8()
{
  return MEMORY[0x270F7DFC0]();
}

uint64_t sub_24C76D0C8()
{
  return MEMORY[0x270F7DFD0]();
}

uint64_t sub_24C76D0D8()
{
  return MEMORY[0x270F7DFE0]();
}

uint64_t sub_24C76D0E8()
{
  return MEMORY[0x270F7DFE8]();
}

uint64_t sub_24C76D0F8()
{
  return MEMORY[0x270F7DFF0]();
}

uint64_t sub_24C76D108()
{
  return MEMORY[0x270F7E010]();
}

uint64_t sub_24C76D118()
{
  return MEMORY[0x270F7E018]();
}

uint64_t sub_24C76D128()
{
  return MEMORY[0x270F7E028]();
}

uint64_t sub_24C76D138()
{
  return MEMORY[0x270F7E038]();
}

uint64_t sub_24C76D148()
{
  return MEMORY[0x270F7E058]();
}

uint64_t sub_24C76D158()
{
  return MEMORY[0x270F7E070]();
}

uint64_t sub_24C76D168()
{
  return MEMORY[0x270F7E088]();
}

uint64_t sub_24C76D178()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C76D188()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C76D198()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C76D1A8()
{
  return MEMORY[0x270F9F4E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x270EDAB50]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x270F7E0B8]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x270F7E0C0]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x270F7E0E0]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x270F7E0F8]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x270F7E108]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x270F7E118]();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return MEMORY[0x270F7E130]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x270F7E138]();
}

uint64_t tb_message_configure_received()
{
  return MEMORY[0x270F7E148]();
}

uint64_t tb_message_construct()
{
  return MEMORY[0x270F7E150]();
}

uint64_t tb_message_decode_BOOL()
{
  return MEMORY[0x270F7E160]();
}

uint64_t tb_message_decode_f32()
{
  return MEMORY[0x270F7E168]();
}

uint64_t tb_message_decode_f64()
{
  return MEMORY[0x270F7E180]();
}

uint64_t tb_message_decode_u32()
{
  return MEMORY[0x270F7E1B0]();
}

uint64_t tb_message_decode_u64()
{
  return MEMORY[0x270F7E1C0]();
}

uint64_t tb_message_encode_BOOL()
{
  return MEMORY[0x270F7E1D0]();
}

uint64_t tb_message_encode_u32()
{
  return MEMORY[0x270F7E218]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x270F7E228]();
}

uint64_t tb_message_subrange()
{
  return MEMORY[0x270F7E240]();
}

uint64_t tb_transport_message_buffer_wrap_buffer()
{
  return MEMORY[0x270F7E268]();
}