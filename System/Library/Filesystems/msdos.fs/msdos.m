uint64_t sub_10000367C(uint64_t a1, int *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  int v17;
  char *v18;
  __n128 v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  const char *v32;
  unsigned int v33;
  uint64_t v34;
  char **v35;
  uint64_t v37;
  uint8x8_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unsigned int v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unint64_t v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unint64_t v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v74;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
  unint64_t v84;
  unint64_t v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  long long *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unsigned int v130;
  int v131;
  BOOL v132;
  BOOL v134;
  int v136;
  BOOL v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __int16 v145;
  __int16 v146;
  __int16 v147;
  __int16 v148;
  __int16 v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  int v153;
  char *v154;
  char *v155;
  uint64_t i;
  int v157;
  char v158;
  uint64_t v159;
  const char *v160;
  int v161;
  char v162;
  uint64_t v163;
  long long v164;
  long long v165;
  long long v166;
  long long v167;
  uint64_t v168;
  unsigned int v169;
  unsigned char *v170;
  int v171;
  unsigned int v172;
  unint64_t v173;
  uint64_t v174;
  uint64x2_t v175;
  int32x2_t v176;
  char v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int *v182;
  char *v183;
  int *v184;
  char *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  unsigned int v189;
  uint64_t v190;
  unsigned int v191;
  void *__dst;
  tm *v193;
  int v194;
  int v195;
  uint64_t v196;
  unsigned char *__src;
  int v198;
  uint64_t v199;
  unsigned int v200;
  int v201;
  uint64_t v202;
  unsigned int v203;
  unsigned int v204;
  long long v205;
  uint64_t v206;
  time_t tv_sec;
  unsigned int v208;
  size_t size[2];
  long long v210;
  long long v211;
  long long v212;
  int v213;
  timeval v214;
  int v215;
  char __str[16];
  long long v217;
  long long v218;
  long long v219;
  long long v220;
  long long v221;
  long long v222;
  long long v223;
  long long v224;
  long long v225;
  long long v226;
  long long v227;
  long long v228;

  v11 = a3 && *a3 && a3[1] && a3[2] != 0;
  v12 = *((void *)a2 + 1);
  v13 = *((void *)a2 + 6);
  v215 = 0;
  v14 = *a2;
  v15 = *((_WORD *)a2 + 34);
  v16 = *((void *)a2 + 20);
  v214.tv_sec = 0;
  *(void *)&v214.tv_usec = 0;
  v213 = 0;
  v211 = 0u;
  v212 = 0u;
  *(_OWORD *)size = 0u;
  v210 = 0u;
  v208 = 0;
  tv_sec = 0;
  if (v11) {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a3[1])("Format device: Checking parameters", 10, 10, &v215, *a3);
  }
  v17 = v15 & 0xF000;
  if (v17 != 0x2000)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 6, (uint64_t)"warning: %s is not a character device\n", a4, a5, a6, a7, a8, v12);
  }
  v213 = 0;
  v211 = 0u;
  v212 = 0u;
  *(_OWORD *)size = 0u;
  v210 = 0u;
  v18 = *(char **)(a1 + 24);
  if (v18)
  {
    v19 = sub_100004FB0(v18, (uint64_t)size);
    if (v20)
    {
LABEL_39:
      v33 = 0;
      goto LABEL_40;
    }
    HIDWORD(v211) = DWORD1(v210);
    LODWORD(v212) = HIDWORD(v210);
    DWORD1(v210) = 0;
    HIDWORD(v210) = 0;
  }
  v21 = *(_DWORD *)(a1 + 60);
  if (v21) {
    DWORD1(v211) = *(_DWORD *)(a1 + 60);
  }
  v22 = *(_DWORD *)(a1 + 92);
  if (v22) {
    LODWORD(v211) = *(_DWORD *)(a1 + 92);
  }
  if (v11) {
    ++v215;
  }
  v23 = *(_DWORD *)(a1 + 40);
  if (v23) {
    LODWORD(size[0]) = *(_DWORD *)(a1 + 40);
  }
  v24 = *(_DWORD *)(a1 + 88);
  if (v24) {
    HIDWORD(v211) = *(_DWORD *)(a1 + 88);
  }
  v25 = *(_DWORD *)(a1 + 112);
  if (v25) {
    DWORD2(v211) = *(_DWORD *)(a1 + 80);
  }
  if (!*(void *)(a1 + 24) && (!v21 || !v22 || !v23 || !v24 || !v25))
  {
    v26 = *((_OWORD *)a2 + 11);
    v226 = *((_OWORD *)a2 + 10);
    v227 = v26;
    v228 = *((_OWORD *)a2 + 12);
    v27 = *((_OWORD *)a2 + 7);
    v222 = *((_OWORD *)a2 + 6);
    v223 = v27;
    v28 = *((_OWORD *)a2 + 9);
    v224 = *((_OWORD *)a2 + 8);
    v225 = v28;
    v29 = *((_OWORD *)a2 + 3);
    v218 = *((_OWORD *)a2 + 2);
    v219 = v29;
    v30 = *((_OWORD *)a2 + 5);
    v220 = *((_OWORD *)a2 + 4);
    v221 = v30;
    v31 = *((_OWORD *)a2 + 1);
    *(_OWORD *)__str = *(_OWORD *)a2;
    v217 = v31;
    if (sub_10000506C((uint64_t)__str, v25, (unsigned int *)size)) {
      goto LABEL_39;
    }
  }
  if (v11) {
    ++v215;
  }
  if ((size[0] & (LODWORD(size[0]) - 1)) != 0)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    v187 = LODWORD(size[0]);
    v32 = "bytes/sector (%u) is not a power of 2";
LABEL_38:
    sub_100005A0C((uint64_t)__str, 3, (uint64_t)v32, a4, a5, a6, a7, a8, v187);
    goto LABEL_39;
  }
  if (LODWORD(size[0]) <= 0x7F)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 3, (uint64_t)"bytes/sector (%u) is too small; minimum is %u",
      a4,
      a5,
      a6,
      a7,
      a8,
      LODWORD(size[0]));
    goto LABEL_39;
  }
  if (LODWORD(size[0]) > 0x1000)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 3, (uint64_t)"bytes/sector (%u) is too large; maximum is %u",
      a4,
      a5,
      a6,
      a7,
      a8,
      LODWORD(size[0]));
    goto LABEL_39;
  }
  v37 = *(unsigned int *)(a1 + 96);
  if (v37)
  {
    v38 = (uint8x8_t)vcnt_s8((int8x8_t)v37);
    v38.i16[0] = vaddlv_u8(v38);
    if (v38.i32[0] >= 2u)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"physical bytes/sector (%u) is not a power of 2", a4, a5, a6, a7, a8, v37);
      goto LABEL_39;
    }
  }
  if (v11) {
    ++v215;
  }
  if (v37)
  {
    if (v37 < LODWORD(size[0]))
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"physical bytes/sector (%u) is less than logical bytes/sector (%u)", a4, a5, a6, a7, a8, v37);
      goto LABEL_39;
    }
  }
  else
  {
    v39 = a2[4];
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    if (v39 == -1)
    {
      sub_100005A0C((uint64_t)__str, 6, (uint64_t)"Physical block size wasn't initialized, because of ioctl(DKIOCGETPHYSICALBLOCKSIZE) not being supported\n", a4, a5, a6, a7, a8, v187);
      LODWORD(v39) = size[0];
    }
    else
    {
      sub_100005A0C((uint64_t)__str, 6, (uint64_t)"%u bytes per physical sector\n", a4, a5, a6, a7, a8, v39);
    }
    *(_DWORD *)(a1 + 96) = v39;
  }
  if (v11) {
    ++v215;
  }
  v40 = *(_DWORD *)(a1 + 32);
  v208 = v40;
  if (v40 == 32)
  {
    if (*(_DWORD *)(a1 + 56))
    {
      v41 = 101;
LABEL_71:
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"-%c is not a legal FAT%s option", a4, a5, a6, a7, a8, v41);
      goto LABEL_39;
    }
    goto LABEL_75;
  }
  if (!v40)
  {
    if (*(void *)(a1 + 24))
    {
      v208 = 12;
      goto LABEL_67;
    }
    if (*(_DWORD *)(a1 + 56) || !*(_DWORD *)(a1 + 64) && !*(_DWORD *)(a1 + 68)) {
      goto LABEL_67;
    }
    v208 = 32;
LABEL_75:
    if (*(void *)(a1 + 24)) {
      LODWORD(v210) = 0;
    }
    goto LABEL_77;
  }
LABEL_67:
  if (*(_DWORD *)(a1 + 64))
  {
    v41 = 105;
    goto LABEL_71;
  }
  if (*(_DWORD *)(a1 + 68))
  {
    v41 = 107;
    goto LABEL_71;
  }
LABEL_77:
  v42 = *(unsigned int *)(a1 + 48);
  if (v42)
  {
    if ((v42 & (v42 - 1)) != 0)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"block size (%u) is not a power of 2", a4, a5, a6, a7, a8, v42);
      goto LABEL_39;
    }
    if (v42 < LODWORD(size[0]))
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"block size (%u) is too small; minimum is %u",
        a4,
        a5,
        a6,
        a7,
        a8,
        v42);
      goto LABEL_39;
    }
    if (v42 > LODWORD(size[0]) << 7)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"block size (%u) is too large; maximum is %u",
        a4,
        a5,
        a6,
        a7,
        a8,
        v42);
      goto LABEL_39;
    }
    HIDWORD(size[0]) = v42 / LODWORD(size[0]);
  }
  v43 = *(unsigned int *)(a1 + 52);
  if (v43)
  {
    if ((v43 & (v43 - 1)) != 0)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"sectors/cluster (%u) is not a power of 2", a4, a5, a6, a7, a8, v43);
      goto LABEL_39;
    }
    HIDWORD(size[0]) = *(_DWORD *)(a1 + 52);
  }
  if (*(_DWORD *)(a1 + 84)) {
    LODWORD(size[1]) = *(_DWORD *)(a1 + 84);
  }
  if (v11) {
    ++v215;
  }
  v44 = *(unsigned int *)(a1 + 76);
  if (v44)
  {
    if (v44 >= 0x11)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"number of FATs (%u) is too large; maximum is %u",
        a4,
        a5,
        a6,
        a7,
        a8,
        v44);
      LODWORD(v44) = *(_DWORD *)(a1 + 76);
    }
    HIDWORD(size[1]) = v44;
  }
  if (*(_DWORD *)(a1 + 56)) {
    LODWORD(v210) = *(_DWORD *)(a1 + 56);
  }
  if (*(_DWORD *)(a1 + 108))
  {
    v45 = *(unsigned int *)(a1 + 72);
    if (v45 <= 0xEF)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"illegal media descriptor (%#x)", a4, a5, a6, a7, a8, v45);
      goto LABEL_39;
    }
    DWORD2(v210) = *(_DWORD *)(a1 + 72);
  }
  if (*(_DWORD *)(a1 + 44)) {
    LODWORD(v212) = *(_DWORD *)(a1 + 44);
  }
  if (*(_DWORD *)(a1 + 64)) {
    DWORD2(v212) = *(_DWORD *)(a1 + 64);
  }
  if (*(_DWORD *)(a1 + 68)) {
    HIDWORD(v212) = *(_DWORD *)(a1 + 68);
  }
  v46 = *(void *)a1;
  if (*(void *)a1)
  {
    if (v17 != 0x8000
      || v16 % LODWORD(size[0])
      || v16 < LODWORD(size[0])
      || v16 > (0xFFFF * LODWORD(size[0])))
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: inappropriate file type or format", a4, a5, a6, a7, a8, v46);
      goto LABEL_39;
    }
    v47 = v16 / (unint64_t)LODWORD(size[0]);
  }
  else
  {
    LODWORD(v47) = 1;
    v46 = v13;
  }
  if (!HIDWORD(size[1])) {
    HIDWORD(size[1]) = 2;
  }
  if (v11)
  {
    ++v215;
    sub_100005310(v12, &v208, size);
    ++v215;
  }
  else
  {
    sub_100005310(v12, &v208, size);
  }
  v48 = HIDWORD(size[0]);
  if (!HIDWORD(size[0]))
  {
    v53 = HIDWORD(v211) * (unint64_t)LODWORD(size[0]);
    v54 = v53 >> 10;
    switch((__PAIR64__(v208, v208) >> 2))
    {
      case 0u:
        if (LODWORD(size[0]) == 512 && HIDWORD(v211) <= 0x20D0)
        {
          v208 = 12;
LABEL_150:
          if (LODWORD(size[1])) {
            v56 = size[1];
          }
          else {
            v56 = v47;
          }
          v57 = v210;
          if (!v210) {
            v57 = 512;
          }
          if (v57 % (LODWORD(size[0]) >> 5)) {
            v58 = v57 / (LODWORD(size[0]) >> 5) + 1;
          }
          else {
            v58 = v57 / (LODWORD(size[0]) >> 5);
          }
          v59 = HIDWORD(size[1]) + HIDWORD(size[1]) * (0x2FE5u / (2 * LODWORD(size[0]))) + v58;
          v60 = size[0];
          do
          {
            v48 = v60 / LODWORD(size[0]);
            v49 = 12;
            if (v56 + 4085 * (v60 / LODWORD(size[0])) + v59 >= HIDWORD(v211)) {
              break;
            }
            v134 = v60 > 0x4000;
            v60 *= 2;
          }
          while (!v134);
LABEL_180:
          HIDWORD(size[0]) = v48;
          if (v48) {
            goto LABEL_181;
          }
          goto LABEL_199;
        }
        if (LODWORD(size[0]) != 512 && HIDWORD(v211) <= 0x1068)
        {
          v208 = 12;
LABEL_149:
          if (LODWORD(size[0]) > 0x8000)
          {
            v49 = 12;
LABEL_199:
            *(_OWORD *)__str = xmmword_10000C490;
            *(void *)&v217 = qword_10000C4A0;
            sub_100005A0C((uint64_t)__str, 3, (uint64_t)"FAT%d is impossible with %u sectors", a4, a5, a6, a7, a8, v49);
            goto LABEL_39;
          }
          goto LABEL_150;
        }
        if (v53 > 0x200003FF)
        {
          v208 = 32;
LABEL_172:
          v66 = 0;
          do
          {
            v67 = v66;
            v68 = *((void *)&unk_10000C080 + 2 * v66++);
          }
          while (v54 > v68);
          v64 = *((_DWORD *)&unk_10000C080 + 4 * v67 + 2);
          if (v64)
          {
            v49 = 32;
            goto LABEL_176;
          }
          *(_OWORD *)__str = xmmword_10000C490;
          *(void *)&v217 = qword_10000C4A0;
          v65 = 32;
        }
        else
        {
          v208 = 16;
LABEL_166:
          v61 = 0;
          do
          {
            v62 = v61;
            v63 = *((void *)&unk_10000C000 + 2 * v61++);
          }
          while (v54 > v63);
          v64 = *((_DWORD *)&unk_10000C000 + 4 * v62 + 2);
          if (v64)
          {
            v49 = 16;
LABEL_176:
            if (v64 <= LODWORD(size[0])) {
              v69 = size[0];
            }
            else {
              v69 = v64;
            }
            v48 = v69 / LODWORD(size[0]);
            goto LABEL_180;
          }
          *(_OWORD *)__str = xmmword_10000C490;
          *(void *)&v217 = qword_10000C4A0;
          v65 = 16;
        }
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"FAT%d is impossible for disk size of %lluKiB", a4, a5, a6, a7, a8, v65);
        goto LABEL_39;
      case 3u:
        goto LABEL_149;
      case 4u:
        goto LABEL_166;
      case 8u:
        goto LABEL_172;
      default:
        *(_OWORD *)__str = xmmword_10000C490;
        *(void *)&v217 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"Invalid FAT type: %d", a4, a5, a6, a7, a8, v208);
        goto LABEL_39;
    }
  }
  LODWORD(v49) = v208;
  if (!v208)
  {
    v50 = size[1];
    if (!LODWORD(size[1])) {
      v50 = v47;
    }
    if (v210) {
      v51 = v210;
    }
    else {
      v51 = 512;
    }
    if (v51 % (LODWORD(size[0]) >> 5)) {
      v52 = v51 / (LODWORD(size[0]) >> 5) + 1;
    }
    else {
      v52 = v51 / (LODWORD(size[0]) >> 5);
    }
    if (HIDWORD(size[1])
       + HIDWORD(size[1]) * (0x2FE5u / (4 * LODWORD(size[0])))
       + v50
       + (unint64_t)(4085 * HIDWORD(size[0]))
       + v52 <= HIDWORD(v211))
    {
      if (0x1FFECu / LODWORD(size[0]) * LODWORD(size[0]) == 131052) {
        v55 = 0x1FFECu / LODWORD(size[0]);
      }
      else {
        v55 = 0x1FFECu / LODWORD(size[0]) + 1;
      }
      if (v50 + v55 * HIDWORD(size[1]) + (unint64_t)(65525 * HIDWORD(size[0])) + v52 <= HIDWORD(v211)) {
        LODWORD(v49) = 32;
      }
      else {
        LODWORD(v49) = 16;
      }
    }
    else
    {
      LODWORD(v49) = 12;
    }
    v208 = v49;
  }
LABEL_181:
  if (v11) {
    v215 += 3;
  }
  v70 = v47;
  if (v49 == 32)
  {
    v71 = DWORD2(v212);
    if (DWORD2(v212))
    {
      v72 = HIDWORD(v212);
    }
    else
    {
      if (v47 == 0xFFFF || (v72 = HIDWORD(v212), v47 == HIDWORD(v212)))
      {
        *(_OWORD *)__str = xmmword_10000C490;
        *(void *)&v217 = qword_10000C4A0;
        v32 = "no room for info sector";
        goto LABEL_38;
      }
      DWORD2(v212) = v47;
      v71 = v47;
    }
    if (v47 > v71 || v71 == 0xFFFF) {
      v74 = v47;
    }
    else {
      v74 = v71 + 1;
    }
    if (v72 != 0xFFFF)
    {
      if (v72)
      {
        if (v72 == v71)
        {
          *(_OWORD *)__str = xmmword_10000C490;
          *(void *)&v217 = qword_10000C4A0;
          v32 = "backup sector would overwrite info sector";
          goto LABEL_38;
        }
      }
      else
      {
        if (v74 == 0xFFFF)
        {
          *(_OWORD *)__str = xmmword_10000C490;
          *(void *)&v217 = qword_10000C4A0;
          v32 = "no room for backup sector";
          goto LABEL_38;
        }
        if (v74 <= 6) {
          v72 = 6;
        }
        else {
          v72 = v74;
        }
        HIDWORD(v212) = v72;
      }
    }
    if (v74 > v72 || v72 == 0xFFFF) {
      v70 = v74;
    }
    else {
      v70 = v72 + 1;
    }
  }
  v76 = size[1];
  if (LODWORD(size[1]))
  {
    if (LODWORD(size[1]) < v70)
    {
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      v32 = "too few reserved sectors";
      goto LABEL_38;
    }
  }
  else
  {
    if (v70 <= 0x20) {
      v76 = 32;
    }
    else {
      v76 = v70;
    }
    if (v49 != 32) {
      v76 = v70;
    }
    LODWORD(size[1]) = v76;
  }
  v77 = v210;
  if (v49 != 32 && !v210)
  {
    v77 = 512;
    LODWORD(v210) = 512;
  }
  v78 = v212;
  if (v77 % (LODWORD(size[0]) >> 5)) {
    v79 = v77 / (LODWORD(size[0]) >> 5) + 1;
  }
  else {
    v79 = v77 / (LODWORD(size[0]) >> 5);
  }
  if (v49 != 32 && v212 >= 0x10000)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    v32 = "too many sectors/FAT for FAT12/16";
    goto LABEL_38;
  }
  v80 = (v76 + v79);
  if (v212 <= 1) {
    v81 = 1;
  }
  else {
    v81 = v212;
  }
  if (v80 + HIDWORD(size[1]) * (unint64_t)v81 > HIDWORD(v211))
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    v32 = "meta data exceeds file system size";
    goto LABEL_38;
  }
  v198 = v79;
  v200 = v47;
  v201 = v80 + HIDWORD(size[1]) * v81;
  v82 = (HIDWORD(v211) - v201);
  v83 = 2 * LODWORD(size[0]);
  v84 = v49 >> 2;
  v85 = 2 * (unint64_t)LODWORD(size[0]) * v82 / (HIDWORD(size[1]) * v84 + 2 * LODWORD(size[0]) * v48);
  if (v49 == 16) {
    v86 = 65524;
  }
  else {
    v86 = 268435445;
  }
  if (v49 == 12) {
    v87 = 4084;
  }
  else {
    v87 = v86;
  }
  v203 = v87;
  if (v87 <= v85)
  {
    v90 = v86 | 2;
    if (v49 == 12) {
      v90 = 4086;
    }
    v91 = v90 * (int)v84 % v83;
    v88 = (v87 | 2) * v84;
    if (v91) {
      goto LABEL_244;
    }
LABEL_248:
    v89 = v88 / v83;
    goto LABEL_249;
  }
  v88 = (v85 + 2) * v84;
  if (!(v88 % v83)) {
    goto LABEL_248;
  }
LABEL_244:
  v89 = v88 / v83 + 1;
LABEL_249:
  if (!v212)
  {
    LODWORD(v212) = v89;
    v92 = *(_DWORD *)(a1 + 96);
    v78 = v89;
    if (v92 > LODWORD(size[0]))
    {
      v78 = v89;
      if (v89 % (v92 / LODWORD(size[0])))
      {
        v78 = v92 / LODWORD(size[0]) + v89 - v89 % (v92 / LODWORD(size[0]));
        LODWORD(v212) = v78;
      }
    }
    v201 += (v78 - 1) * HIDWORD(size[1]);
    LODWORD(v82) = HIDWORD(v211) - v201;
  }
  v93 = (2 * LODWORD(size[0]) * (unint64_t)v78 / v84) - 2;
  v94 = v82 / v48;
  if (v94 > v93)
  {
    v95 = v80 + v78 * HIDWORD(size[1]) + v93 * v48;
    HIDWORD(v211) = v95;
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 6, (uint64_t)"warning: sectors/FAT limits sectors to %u, clusters to %u\n", a4, a5, a6, a7, a8, v95);
    v78 = v212;
    v94 = v93;
  }
  if (v78 < v89)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 6, (uint64_t)"warning: sectors/FAT limits file system to %u clusters\n", a4, a5, a6, a7, a8, v94);
  }
  if (v49 == 16) {
    v96 = 4085;
  }
  else {
    v96 = 65525;
  }
  if (v49 == 12) {
    v96 = 1;
  }
  if (v94 < v96)
  {
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%u clusters too few clusters for FAT%u, need %u", a4, a5, a6, a7, a8, v94);
    goto LABEL_39;
  }
  if (v94 > v203)
  {
    LODWORD(v94) = v203;
    HIDWORD(v211) = v201 + HIDWORD(size[0]) + HIDWORD(size[0]) * v203 - 1;
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 6, (uint64_t)"warning: FAT type limits file system to %u sectors\n", a4, a5, a6, a7, a8, HIDWORD(v211));
  }
  v195 = v94 - 1;
  *(_OWORD *)__str = xmmword_10000C490;
  *(void *)&v217 = qword_10000C4A0;
  sub_100005A0C((uint64_t)__str, 6, (uint64_t)"%s: %u sector%s in %u FAT%u cluster%s (%u bytes/cluster)\n", a4, a5, a6, a7, a8, v12);
  if (!DWORD2(v210))
  {
    if (DWORD2(v211)) {
      v104 = 248;
    }
    else {
      v104 = 240;
    }
    DWORD2(v210) = v104;
  }
  if (v49 == 32)
  {
    DWORD1(v212) = 2;
    if (HIDWORD(v211) < 0x10000) {
      DWORD1(v210) = HIDWORD(v211);
    }
    HIDWORD(v210) = 0;
    v105 = (long long *)((char *)&v210 + 4);
  }
  else
  {
    v105 = &v212;
    if (!HIWORD(HIDWORD(v211)))
    {
      DWORD1(v210) = HIDWORD(v211);
      HIDWORD(v211) = 0;
    }
    HIDWORD(v210) = v212;
  }
  *(_DWORD *)v105 = 0;
  if (v11)
  {
    v215 = 10;
    ((void (*)(const char *, void))a3[2])("Format device: Checking parameters", *a3);
    sub_10000540C((unsigned int *)size, v106, v107, v108, v109, v110, v111, v112);
    if (*(_DWORD *)(a1 + 100))
    {
      v34 = 0;
      v35 = &off_1000081C0;
      v33 = 1;
      goto LABEL_42;
    }
    v215 = 0;
    v33 = 1;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a3[1])("Format device: Wiping file system", 10, 1, &v215, *a3);
  }
  else
  {
    sub_10000540C((unsigned int *)size, v97, v98, v99, v100, v101, v102, v103);
    v33 = 0;
    v34 = 0;
    if (*(_DWORD *)(a1 + 100)) {
      return v34;
    }
  }
  gettimeofday(&v214, 0);
  tv_sec = v214.tv_sec;
  v193 = localtime(&tv_sec);
  __src = malloc_type_malloc(0x20000uLL, 0xA21504EBuLL);
  if (!__src || (__dst = malloc_type_malloc(LODWORD(size[0]), 0xC3DF8074uLL)) == 0)
  {
    v122 = __error();
    v123 = strerror(*v122);
    *(_OWORD *)__str = xmmword_10000C490;
    *(void *)&v217 = qword_10000C4A0;
    sub_100005A0C((uint64_t)__str, 3, (uint64_t)v123, v124, v125, v126, v127, v128, 0);
    goto LABEL_40;
  }
  v113 = v212;
  if (HIDWORD(v210)) {
    v113 = HIDWORD(v210);
  }
  v114 = LODWORD(size[1]) + v113 * HIDWORD(size[1]);
  v115 = v198;
  if (v49 == 32) {
    v115 = HIDWORD(size[0]);
  }
  v191 = v114;
  v194 = v114 + v115;
  if (*((void *)&xmmword_10000C490 + 1))
  {
    *(_DWORD *)__str = v14;
    *(_DWORD *)&__str[4] = 0;
    *(void *)&__str[8] = LODWORD(size[0]);
    LODWORD(v217) = 0;
    DWORD1(v217) = v114 + v115;
    v116 = (*((uint64_t (**)(uint64_t, char *))&xmmword_10000C490 + 1))(qword_10000C4A0, __str);
    if (v116)
    {
      v34 = v116;
      *(_OWORD *)__str = xmmword_10000C490;
      *(void *)&v217 = qword_10000C4A0;
      sub_100005A0C((uint64_t)__str, 3, (uint64_t)"Encountered errors trying to wipe resource", v117, v118, v119, v120, v121, v188);
      if (v11) {
        goto LABEL_41;
      }
      return v34;
    }
  }
  if (v11)
  {
    v215 = 1;
    ((void (*)(char *, void))a3[2])((&off_1000081C0)[v33], *a3);
    v215 = 0;
    ((void (*)(char *, uint64_t, void, int *, void))a3[1])((&off_1000081C0)[++v33], 80, (v194 + 2), &v215, *a3);
  }
  if (!v194)
  {
LABEL_400:
    ++v215;
    v181 = ((uint64_t (*)(void, void *, void, void))a3[5])(a3[3], __dst, LODWORD(size[0]), 0);
    if (v181 == -1)
    {
      v182 = __error();
      v183 = strerror(*v182);
      v205 = xmmword_10000C490;
      v206 = qword_10000C4A0;
      v190 = (uint64_t)v183;
      v186 = "%s: write: %s";
      goto LABEL_410;
    }
    if (v181 != LODWORD(size[0]))
    {
      v205 = xmmword_10000C490;
      v206 = qword_10000C4A0;
      v190 = v12;
      v186 = "%s: can't write boot sector";
      goto LABEL_410;
    }
    v34 = 0;
    ++v215;
    if (!v11) {
      return v34;
    }
    v35 = &off_1000081C0;
LABEL_42:
    ((void (*)(char *, void, __n128))a3[2])(v35[v33], *a3, v19);
    return v34;
  }
  v202 = 0;
  v204 = 0;
  v199 = 0;
  v129 = (uint64_t)__src;
  while (1)
  {
    v130 = v208;
    v131 = HIDWORD(v212);
    if (*(void *)a1) {
      v132 = v208 == 32;
    }
    else {
      v132 = 0;
    }
    v134 = !v132 || HIDWORD(v212) == 0xFFFF || v200 > HIDWORD(v212);
    v136 = v134 || v204 < HIDWORD(v212);
    v137 = v136 == 0;
    if (v136) {
      v131 = 0;
    }
    v138 = v202;
    if (v137) {
      v138 = 0;
    }
    v202 = v138;
    if (*(void *)a1 && v204 - v131 < v200)
    {
      v139 = ((uint64_t (*)(void, uint64_t, void, uint64_t))a3[4])(a3[3], v129, LODWORD(size[0]), v138);
      if (v139 == -1) {
        goto LABEL_408;
      }
      v145 = size[0];
      if (v139 != LODWORD(size[0]))
      {
        v205 = xmmword_10000C490;
        v206 = qword_10000C4A0;
        v190 = v46;
        v186 = "%s: can't read sector %u";
        goto LABEL_410;
      }
    }
    else
    {
      v146 = size[0];
      bzero((void *)v129, LODWORD(size[0]));
      v145 = v146;
    }
    if (!v204 || v130 == 32 && HIDWORD(v212) != 0xFFFF && v204 == HIDWORD(v212))
    {
      *(_WORD *)(v129 + 11) = v145;
      v147 = size[1];
      *(unsigned char *)(v129 + 13) = BYTE4(size[0]);
      *(_WORD *)(v129 + 14) = v147;
      v148 = v210;
      *(unsigned char *)(v129 + 16) = BYTE4(size[1]);
      *(_WORD *)(v129 + 17) = v148;
      *(_WORD *)(v129 + 19) = WORD2(v210);
      *(unsigned char *)(v129 + 21) = BYTE8(v210);
      *(_WORD *)(v129 + 22) = WORD6(v210);
      *(_WORD *)(v129 + 24) = v211;
      *(_WORD *)(v129 + 26) = WORD2(v211);
      *(void *)(v129 + 28) = *((void *)&v211 + 1);
      if (v130 == 32)
      {
        v149 = WORD1(v212);
        *(_WORD *)(v129 + 36) = v212;
        *(_WORD *)(v129 + 38) = v149;
        *(_DWORD *)(v129 + 40) = 0;
        *(_DWORD *)(v129 + 44) = DWORD1(v212);
        *(_WORD *)(v129 + 48) = WORD4(v212);
        *(_WORD *)(v129 + 50) = WORD6(v212);
        v150 = 64;
      }
      else
      {
        v150 = 36;
      }
      v196 = v150;
      v151 = v129 + v150;
      *(unsigned char *)v151 = v213;
      *(unsigned char *)(v151 + 2) = 41;
      if (*(_DWORD *)(a1 + 104)) {
        v152 = *(_DWORD *)(a1 + 36);
      }
      else {
        v152 = (v193->tm_year + (v193->tm_min | (v193->tm_hour << 8)) + 1900) | ((((v214.tv_usec / 10) | (v193->tm_sec << 8))
      }
                                                                                + (((v193->tm_mon << 8) + 256) | v193->tm_mday)) << 16);
      *(_DWORD *)(v151 + 3) = v152;
      if (*(void *)(a1 + 8)) {
        v154 = *(char **)(a1 + 8);
      }
      else {
        v154 = "NO NAME";
      }
      sub_1000056B0(v151 + 7, v154);
      v189 = v130;
      v155 = __str;
      snprintf(__str, 0x400uLL, "FAT%u", v189);
      for (i = 0; i != 8; ++i)
      {
        v157 = *v155;
        if (*v155) {
          ++v155;
        }
        if (v157) {
          v158 = v157;
        }
        else {
          v158 = 32;
        }
        *(unsigned char *)(v151 + 18 + i) = v158;
      }
      v159 = *(void *)a1;
      if (!*(void *)a1)
      {
        __src[v199] = -21;
        *(unsigned char *)(v129 + 1) = v196 | 0x18;
        *(unsigned char *)(v129 + 2) = -112;
        v160 = *(const char **)(a1 + 16);
        if (!v160) {
          v160 = "BSD  4.4";
        }
        do
        {
          v161 = *(unsigned __int8 *)v160;
          if (*v160) {
            ++v160;
          }
          if (v161) {
            v162 = v161;
          }
          else {
            v162 = 32;
          }
          *(unsigned char *)(v129 + 3 + v159++) = v162;
        }
        while (v159 != 8);
        v163 = v129 + (v196 | 0x1A);
        v164 = unk_10000C420;
        *(_OWORD *)v163 = xmmword_10000C410;
        *(_OWORD *)(v163 + 16) = v164;
        v165 = xmmword_10000C430;
        v166 = unk_10000C440;
        v167 = xmmword_10000C450;
        *(_DWORD *)(v163 + 80) = dword_10000C460;
        *(_OWORD *)(v163 + 48) = v166;
        *(_OWORD *)(v163 + 64) = v167;
        *(_OWORD *)(v163 + 32) = v165;
        *(_WORD *)(v129 + 510) = -21931;
      }
      goto LABEL_364;
    }
    if (v130 == 32
      && DWORD2(v212) != 0xFFFF
      && (v204 == DWORD2(v212) || HIDWORD(v212) != 0xFFFF && v204 == DWORD2(v212) + HIDWORD(v212)))
    {
      *(_DWORD *)&__src[v199] = 1096897106;
      *(_DWORD *)(v129 + 484) = 1631679090;
      *(_DWORD *)(v129 + 488) = v195;
      v153 = DWORD1(v212) + 1;
      *(_WORD *)(v129 + 492) = WORD2(v212) + 1;
      *(unsigned char *)(v129 + 494) = BYTE2(v153);
      *(unsigned char *)(v129 + 495) = HIBYTE(v153);
      *(_WORD *)(v129 + 510) = -21931;
LABEL_392:
      v168 = LODWORD(size[0]);
      goto LABEL_393;
    }
    if (v204 < LODWORD(size[1]) || v204 >= v191) {
      goto LABEL_413;
    }
    v169 = HIDWORD(v210);
    if (!HIDWORD(v210)) {
      v169 = v212;
    }
    if ((v204 - LODWORD(size[1])) % v169)
    {
LABEL_413:
      if (v204 == v191)
      {
        v170 = *(unsigned char **)(a1 + 8);
        if (v170)
        {
          if (*v170)
          {
            sub_1000056B0(v129, v170);
            *(unsigned char *)(v129 + 11) = 40;
            *(_WORD *)(v129 + 22) = (32 * LOWORD(v193->tm_min)) | (LOWORD(v193->tm_hour) << 11) | (v193->tm_sec >> 1);
            *(_WORD *)(v129 + 24) = v193->tm_mday | ((LOWORD(v193->tm_year) << 9) + 24576) | (32 * LOWORD(v193->tm_mon)
                                                                                            + 32);
          }
        }
      }
      goto LABEL_392;
    }
    __src[v199] = BYTE8(v210);
    if (v130 == 32) {
      v171 = 3;
    }
    else {
      v171 = 2;
    }
    v172 = v171 * v130;
    if (v171 * v130 <= 0xF) {
      goto LABEL_392;
    }
    v173 = 0;
    v174 = v172 >> 3;
    v175 = (uint64x2_t)vdupq_n_s64(v174 - 2);
    do
    {
      v176 = vmovn_s64((int64x2_t)vcgeq_u64(v175, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v173), (int8x16_t)xmmword_100006FA0)));
      if (v176.i8[0])
      {
        if ((~((_BYTE)v173 + 1) & 3) == 0 && v130 == 32) {
          v178 = 15;
        }
        else {
          v178 = -1;
        }
        *(unsigned char *)(v129 + v173 + 1) = v178;
      }
      if (v176.i8[4]) {
        *(unsigned char *)(v129 + v173 + 2) = -1;
      }
      v173 += 2;
    }
    while ((v174 & 0x1FFFFFFE) != v173);
LABEL_364:
    v168 = LODWORD(size[0]);
    if (!v204)
    {
      memcpy(__dst, __src, LODWORD(size[0]));
      __memset_chk();
    }
LABEL_393:
    v199 += v168;
    if (v199 >= 0x20000) {
      break;
    }
LABEL_396:
    ++v215;
    v129 = (uint64_t)&__src[v199];
    if (++v204 == v194)
    {
      if (!v199) {
        goto LABEL_400;
      }
      v180 = ((uint64_t (*)(void, unsigned char *, uint64_t, uint64_t))a3[5])(a3[3], __src, v199, v202);
      if (v180 != -1 && v180 == v199) {
        goto LABEL_400;
      }
LABEL_408:
      v184 = __error();
      v185 = strerror(*v184);
      v205 = xmmword_10000C490;
      v206 = qword_10000C4A0;
      v190 = (uint64_t)v185;
      v186 = "%s: %s";
      goto LABEL_410;
    }
  }
  v179 = ((uint64_t (*)(void, unsigned char *, uint64_t, uint64_t))a3[5])(a3[3], __src, 0x20000, v202);
  if (v179 == 0x20000)
  {
    v199 = 0;
    v202 += 0x20000;
    goto LABEL_396;
  }
  if (v179 == -1) {
    goto LABEL_408;
  }
  v205 = xmmword_10000C490;
  v206 = qword_10000C4A0;
  v190 = v12;
  v186 = "%s: can't write sector %u";
LABEL_410:
  sub_100005A0C((uint64_t)&v205, 3, (uint64_t)v186, v140, v141, v142, v143, v144, v190);
LABEL_40:
  v34 = 1;
  if (v11)
  {
LABEL_41:
    v35 = &off_1000081A8;
    goto LABEL_42;
  }
  return v34;
}

__n128 sub_100004FB0(char *__s1, uint64_t a2)
{
  uint64_t v4 = 0;
  while (strcmp(__s1, (&off_10000C0F0)[v4]))
  {
    v4 += 10;
    if (v4 == 100)
    {
      long long v13 = xmmword_10000C490;
      uint64_t v14 = qword_10000C4A0;
      sub_100005A0C((uint64_t)&v13, 3, (uint64_t)"%s: unknown standard format", v5, v6, v7, v8, v9, (uint64_t)__s1);
      return result;
    }
  }
  *(_OWORD *)a2 = *(_OWORD *)&(&off_10000C0F0)[v4 + 1];
  __n128 result = *(__n128 *)&(&off_10000C0F0)[v4 + 3];
  long long v11 = *(_OWORD *)&(&off_10000C0F0)[v4 + 5];
  long long v12 = *(_OWORD *)&(&off_10000C0F0)[v4 + 7];
  *(_DWORD *)(a2 + 64) = (&off_10000C0F0)[v4 + 9];
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v12;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_10000506C(uint64_t a1, int a2, unsigned int *a3)
{
  unint64_t v6 = *(void *)(a1 + 24);
  unint64_t v5 = *(void *)(a1 + 32);
  unsigned int v7 = *(_DWORD *)(a1 + 40);
  if (v6 == -1)
  {
    uint64_t v8 = __error();
    uint64_t v9 = strerror(*v8);
    long long v41 = xmmword_10000C490;
    uint64_t v42 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v41, 6, (uint64_t)"%s: %s: Partition offset wasn't initialized, setting to default value (%llu)", v10, v11, v12, v13, v14, (uint64_t)v9);
    unint64_t v6 = 0;
  }
  if (!a3[11])
  {
    if (v5 != -1) {
      goto LABEL_10;
    }
LABEL_9:
    v16 = __error();
    v17 = strerror(*v16);
    long long v41 = xmmword_10000C490;
    uint64_t v42 = qword_10000C4A0;
    unint64_t v5 = 0x2000;
    sub_100005A0C((uint64_t)&v41, 6, (uint64_t)"%s: %s: Block count wasn't initialized, setting to default value (%llu)", v18, v19, v20, v21, v22, (uint64_t)v17);
    goto LABEL_10;
  }
  if (a3[9]) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v5 == -1;
  }
  if (v15) {
    goto LABEL_9;
  }
LABEL_10:
  unsigned int v23 = *a3;
  if (!*a3)
  {
    if (v7 != -1)
    {
      unsigned int v23 = 0;
      LODWORD(v24) = a3[11];
      goto LABEL_22;
    }
LABEL_18:
    v25 = __error();
    v26 = strerror(*v25);
    long long v41 = xmmword_10000C490;
    uint64_t v42 = qword_10000C4A0;
    unsigned int v7 = 512;
    sub_100005A0C((uint64_t)&v41, 6, (uint64_t)"%s: %s: Block size wasn't initialized, setting to default value (%u)", v27, v28, v29, v30, v31, (uint64_t)v26);
    unsigned int v23 = *a3;
    LODWORD(v24) = a3[11];
    if (!*a3) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  LODWORD(v24) = a3[11];
  if (!v24 && v7 == -1) {
    goto LABEL_18;
  }
LABEL_19:
  if (v24) {
    goto LABEL_24;
  }
  unint64_t v24 = v5 * v7 / v23;
  if (HIDWORD(v24)) {
    goto LABEL_33;
  }
  a3[11] = v24;
LABEL_22:
  if (v24)
  {
    if (v23) {
      goto LABEL_24;
    }
LABEL_37:
    *a3 = v7;
    unsigned int v23 = v7;
    if (a2) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (HIDWORD(v5))
  {
LABEL_33:
    v34 = __error();
    v35 = strerror(*v34);
    long long v41 = xmmword_10000C490;
    uint64_t v42 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v41, 3, (uint64_t)"%s: %s: Drive is too large, the number of blocks is larger than any FAT FS can support", v36, v37, v38, v39, v40, (uint64_t)v35);
    return 1;
  }
  a3[11] = v5;
  if (!v23) {
    goto LABEL_37;
  }
LABEL_24:
  if (!a2) {
LABEL_25:
  }
    a3[10] = v6 / v23;
LABEL_26:
  a3[16] = (v6 != 0) << 7;
  if (!a3[8]) {
    a3[8] = 32;
  }
  if (a3[9]) {
    return 0;
  }
  uint64_t result = 0;
  if (v5 >> 18)
  {
    if (v5 >> 19)
    {
      if (v5 >> 20)
      {
        if (v5 >> 21) {
          int v33 = 255;
        }
        else {
          int v33 = 128;
        }
      }
      else
      {
        int v33 = 54;
      }
    }
    else
    {
      int v33 = 32;
    }
  }
  else
  {
    int v33 = 16;
  }
  a3[9] = v33;
  return result;
}

uint64_t sub_100005310(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  if (!*a2 && !a3[1] && *a3 == 512)
  {
    uint64_t v5 = result;
    uint64_t result = sub_100005744(result);
    switch(result)
    {
      case 3:
        long long v13 = xmmword_10000C490;
        uint64_t v14 = qword_10000C4A0;
        return sub_100005A0C((uint64_t)&v13, 6, (uint64_t)"%s: newfs_exfat should be used for SDXC media", v6, v7, v8, v9, v10, v5);
      case 2:
        *a2 = 32;
        break;
      case 1:
        unsigned int v11 = a3[11];
        if (!(v11 >> 14))
        {
          *a2 = 12;
          int v12 = 16;
LABEL_16:
          a3[1] = v12;
          return result;
        }
        if (!(v11 >> 17))
        {
          *a2 = 12;
LABEL_15:
          int v12 = 32;
          goto LABEL_16;
        }
        *a2 = 16;
        if (!(v11 >> 21)) {
          goto LABEL_15;
        }
        break;
      default:
        return result;
    }
    int v12 = 64;
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_10000540C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  long long v60 = xmmword_10000C490;
  uint64_t v61 = qword_10000C4A0;
  sub_100005A0C((uint64_t)&v60, 6, (uint64_t)"bps=%u spc=%u res=%u nft=%u", a4, a5, a6, a7, a8, v9);
  uint64_t v15 = a1[4];
  if (v15)
  {
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" rde=%u", v10, v11, v12, v13, v14, v15);
  }
  uint64_t v16 = a1[5];
  if (v16)
  {
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" sec=%u", v10, v11, v12, v13, v14, v16);
  }
  uint64_t v17 = a1[6];
  long long v60 = xmmword_10000C490;
  uint64_t v61 = qword_10000C4A0;
  sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" mid=%#x", v10, v11, v12, v13, v14, v17);
  uint64_t v23 = a1[7];
  if (v23)
  {
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" spf=%u", v18, v19, v20, v21, v22, v23);
  }
  uint64_t v24 = a1[8];
  long long v60 = xmmword_10000C490;
  uint64_t v61 = qword_10000C4A0;
  sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" spt=%u hds=%u hid=%u drv=0x%02X", v18, v19, v20, v21, v22, v24);
  uint64_t v30 = a1[11];
  if (v30)
  {
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" bsec=%u", v25, v26, v27, v28, v29, v30);
  }
  if (!a1[7])
  {
    uint64_t v31 = a1[12];
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" bspf=%u rdcl=%u", v25, v26, v27, v28, v29, v31);
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" infs=", v32, v33, v34, v35, v36, v58);
    uint64_t v42 = a1[14];
    if (v42 == 0xFFFF) {
      v43 = "%#x";
    }
    else {
      v43 = "%u";
    }
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)v43, v37, v38, v39, v40, v41, v42);
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)" bkbs=", v44, v45, v46, v47, v48, v59);
    uint64_t v54 = a1[15];
    if (v54 == 0xFFFF) {
      v55 = "%#x";
    }
    else {
      v55 = "%u";
    }
    long long v60 = xmmword_10000C490;
    uint64_t v61 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v60, 6, (uint64_t)v55, v49, v50, v51, v52, v53, v54);
  }
  long long v60 = xmmword_10000C490;
  uint64_t v61 = qword_10000C4A0;
  return sub_100005A0C((uint64_t)&v60, 6, (uint64_t)"\n", v25, v26, v27, v28, v29, v57);
}

uint64_t sub_1000056B0(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = 0;
  do
  {
    __darwin_ct_rune_t v5 = (char)*a2;
    if (*a2)
    {
      ++a2;
      uint64_t result = __toupper(v5);
    }
    else
    {
      uint64_t result = 32;
    }
    if (result == -27 && v4 == 0) {
      char v8 = 5;
    }
    else {
      char v8 = result;
    }
    *(unsigned char *)(a1 + v4++) = v8;
  }
  while (v4 != 11);
  return result;
}

char *sub_100005718(char *result, unsigned char *a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    int v3 = *a2;
    if (*a2) {
      ++a2;
    }
    if (v3) {
      char v4 = v3;
    }
    else {
      char v4 = 32;
    }
    *result++ = v4;
  }
  return result;
}

uint64_t sub_100005744(uint64_t a1)
{
  if (!strncmp((const char *)a1, "/dev/", 5uLL))
  {
    int v4 = *(unsigned __int8 *)(a1 + 5);
    uint64_t v3 = a1 + 5;
    __darwin_ct_rune_t v5 = (const char *)(v4 == 114 ? v3 + 1 : v3);
    CFDictionaryRef v6 = IOBSDNameMatching(kIOMainPortDefault, 0, v5);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      io_object_t v8 = MatchingService;
      CFDictionaryRef v9 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"Card Characteristics", kCFAllocatorDefault, 3u);
      if (!v9)
      {
        uint64_t v2 = 0;
        goto LABEL_16;
      }
      CFDictionaryRef v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFDictionaryGetTypeID())
      {
        Value = CFDictionaryGetValue(v10, @"Card Type");
        uint64_t v2 = (uint64_t)Value;
        if (!Value)
        {
LABEL_14:
          CFRelease(v10);
LABEL_16:
          IOObjectRelease(v8);
          return v2;
        }
        CFTypeID v13 = CFGetTypeID(Value);
        if (v13 == CFStringGetTypeID())
        {
          if (CFEqual((CFTypeRef)v2, @"SDSC"))
          {
            uint64_t v2 = 1;
          }
          else if (CFEqual((CFTypeRef)v2, @"SDHC"))
          {
            uint64_t v2 = 2;
          }
          else if (CFEqual((CFTypeRef)v2, @"SDXC"))
          {
            uint64_t v2 = 3;
          }
          else
          {
            uint64_t v2 = 0;
          }
          goto LABEL_14;
        }
      }
      uint64_t v2 = 0;
      goto LABEL_14;
    }
  }
  return 0;
}

uint64_t sub_1000058A8(const char *a1, unsigned int a2, unsigned int a3)
{
  __endptr = 0;
  *__error() = 0;
  unint64_t v6 = strtoul(a1, &__endptr, 0);
  if (*__error() || !*a1 || (!*__endptr ? (BOOL v13 = v6 >= a2) : (BOOL v13 = 0), v13 ? (v14 = v6 > a3) : (v14 = 1), v14))
  {
    long long v15 = xmmword_10000C490;
    uint64_t v16 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v15, 3, (uint64_t)"%s: bad %s", v7, v8, v9, v10, v11, (uint64_t)a1);
    return 0xFFFFFFFFLL;
  }
  return v6;
}

BOOL sub_10000597C(uint64_t a1)
{
  uint64_t v2 = 0;
  do
  {
    unsigned int v3 = *(unsigned __int8 *)(a1 + v2);
    if (v2) {
      unsigned int v4 = 32;
    }
    else {
      unsigned int v4 = 33;
    }
    if (v4 > v3) {
      break;
    }
    BOOL v5 = memchr("\"*+,./:;<=>?[\\]|", *(unsigned __int8 *)(a1 + v2), 0x11uLL) || v2 == 11;
    ++v2;
  }
  while (!v5);
  return v3 == 0;
}

uint64_t sub_1000059F8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)&xmmword_10000C490 = result;
  *((void *)&xmmword_10000C490 + 1) = a2;
  qword_10000C4A0 = a3;
  return result;
}

uint64_t sub_100005A0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))result)(*(void *)(result + 16), a2, a3, &a9);
  }
  return result;
}

uint64_t sub_100005A48()
{
  return *((void *)&xmmword_10000C490 + 1);
}

uint64_t sub_100005A54(uint64_t result)
{
  *((void *)&xmmword_10000C490 + 1) = result;
  return result;
}

uint64_t sub_100005A60()
{
  return xmmword_10000C490;
}

uint64_t sub_100005A6C(uint64_t result)
{
  *(void *)&xmmword_10000C490 = result;
  return result;
}

uint64_t sub_100005A78()
{
  return qword_10000C4A0;
}

uint64_t sub_100005A84(uint64_t result)
{
  qword_10000C4A0 = result;
  return result;
}

uint64_t start(int a1, char *const *a2)
{
  sub_1000059F8((uint64_t)sub_1000068A8, (uint64_t)sub_1000068F0, 0);
  v165 = 0;
  v166 = 0;
  uint64_t v163 = 0;
  v164 = 0;
  uint64_t v160 = 0;
  v161 = 0;
  int v4 = 0;
  int v5 = 0;
  int v6 = 0;
  uint64_t v155 = 0;
  uint64_t v156 = 0;
  int v7 = 0;
  int v8 = 0;
  uint64_t v157 = 0;
  uint64_t v158 = 0;
  uint64_t v159 = 0;
  uint64_t v9 = 0;
  int v162 = 0;
  memset(&v212, 0, sizeof(v212));
  while (2)
  {
    uint64_t v10 = v9;
    int v11 = getopt(a1, a2, aNbFIOSPABCEFHI);
    uint64_t v9 = 1;
    switch(v11)
    {
      case 'B':
        v166 = optarg;
        uint64_t v9 = v10;
        continue;
      case 'C':
      case 'D':
      case 'E':
      case 'G':
      case 'H':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'Q':
      case 'R':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'd':
      case 'g':
      case 'j':
      case 'l':
      case 'p':
      case 'q':
      case 't':
        goto LABEL_91;
      case 'F':
        uint64_t v48 = optarg;
        if (strcmp(optarg, "12") && strcmp(v48, "16"))
        {
          if (strcmp(v48, "32")) {
            errx(1, "%s: bad FAT type");
          }
        }
        int v4 = atoi(v48);
        uint64_t v9 = v10;
        continue;
      case 'I':
        int v5 = sub_1000058A8(optarg, 0, 0xFFFFFFFF);
        LODWORD(v159) = 1;
        uint64_t v9 = v10;
        if (v5 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid volumeID", v80, v81, v82, v83, v84, (uint64_t)optarg);
        goto LABEL_59;
      case 'N':
        continue;
      case 'O':
        v165 = optarg;
        size_t v49 = strlen(optarg);
        uint64_t v9 = v10;
        if (v49 >= 9) {
          errx(1, "%s: bad OEM string");
        }
        continue;
      case 'P':
        int v85 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        HIDWORD(v163) = v85;
        if (v85 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid physical bytes", v86, v87, v88, v89, v90, (uint64_t)optarg);
        goto LABEL_59;
      case 'S':
        int v6 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        if (v6 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid sector size", v91, v92, v93, v94, v95, (uint64_t)optarg);
        goto LABEL_59;
      case 'a':
        int v25 = sub_1000058A8(optarg, 1u, 0xFFFFFFFF);
        uint64_t v9 = v10;
        LODWORD(v155) = v25;
        if (v25 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid sectors per FAT", v26, v27, v28, v29, v30, (uint64_t)optarg);
        goto LABEL_59;
      case 'b':
        int v7 = sub_1000058A8(optarg, 1u, 0xFFFFFFFF);
        int v8 = 0;
        uint64_t v9 = v10;
        continue;
      case 'c':
        int v8 = sub_1000058A8(optarg, 1u, 0xFFu);
        int v7 = 0;
        uint64_t v9 = v10;
        if (v8 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid cluster size", v31, v32, v33, v34, v35, (uint64_t)optarg);
        goto LABEL_59;
      case 'e':
        int v12 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        HIDWORD(v155) = v12;
        if (v12 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid directory entries", v13, v14, v15, v16, v17, (uint64_t)optarg);
        goto LABEL_59;
      case 'f':
        v161 = optarg;
        uint64_t v9 = v10;
        continue;
      case 'h':
        int v18 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        LODWORD(v156) = v18;
        if (v18 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid drive heads", v19, v20, v21, v22, v23, (uint64_t)optarg);
        goto LABEL_59;
      case 'i':
        int v36 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        HIDWORD(v156) = v36;
        if (v36 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid info sector", v37, v38, v39, v40, v41, (uint64_t)optarg);
        goto LABEL_59;
      case 'k':
        int v50 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        HIDWORD(v157) = v50;
        if (v50 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid backup sector", v51, v52, v53, v54, v55, (uint64_t)optarg);
        goto LABEL_59;
      case 'm':
        int v56 = sub_1000058A8(optarg, 0, 0xFFu);
        HIDWORD(v160) = 1;
        uint64_t v9 = v10;
        LODWORD(v157) = v56;
        if (v56 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid media descriptor", v57, v58, v59, v60, v61, (uint64_t)optarg);
        goto LABEL_59;
      case 'n':
        int v62 = sub_1000058A8(optarg, 1u, 0xFFu);
        uint64_t v9 = v10;
        HIDWORD(v158) = v62;
        if (v62 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid number of FATs", v63, v64, v65, v66, v67, (uint64_t)optarg);
        goto LABEL_59;
      case 'o':
        int v68 = sub_1000058A8(optarg, 0, 0xFFFFFFFF);
        int v162 = 1;
        uint64_t v9 = v10;
        LODWORD(v158) = v68;
        if (v68 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid hidden sectors", v69, v70, v71, v72, v73, (uint64_t)optarg);
        goto LABEL_59;
      case 'r':
        int v74 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        HIDWORD(v159) = v74;
        if (v74 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid reserved sectors", v75, v76, v77, v78, v79, (uint64_t)optarg);
        goto LABEL_59;
      case 's':
        int v96 = sub_1000058A8(optarg, 1u, 0xFFFFFFFF);
        uint64_t v9 = v10;
        LODWORD(v160) = v96;
        if (v96 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid file system size (in sectors)", v97, v98, v99, v100, v101, (uint64_t)optarg);
        goto LABEL_59;
      case 'u':
        int v42 = sub_1000058A8(optarg, 1u, 0xFFFFu);
        uint64_t v9 = v10;
        LODWORD(v163) = v42;
        if (v42 != -1) {
          continue;
        }
        *(_OWORD *)__str = xmmword_10000C490;
        uint64_t v215 = qword_10000C4A0;
        sub_100005A0C((uint64_t)__str, 3, (uint64_t)"%s: Invalid sectors per track", v43, v44, v45, v46, v47, (uint64_t)optarg);
LABEL_59:
        uint64_t result = 1;
        break;
      case 'v':
        BOOL v24 = sub_10000597C((uint64_t)optarg);
        v164 = optarg;
        uint64_t v9 = v10;
        if (!v24) {
          errx(1, "%s: bad volume name");
        }
        continue;
      default:
        if (v11 != -1 || a1 == optind || (a1 - optind - 3) < 0xFFFFFFFD) {
LABEL_91:
        }
          sub_100006A0C();
        v102 = a2[optind];
        v103 = v166;
        int v154 = v4;
        if (!strchr(v102, 47))
        {
          snprintf(__str, 0x400uLL, "%sr%s", "/dev/", v102);
          if (stat(__str, &v212)) {
            snprintf(__str, 0x400uLL, "%s%s", "/dev/", v102);
          }
          v102 = strdup(__str);
          if (!v102) {
            sub_100006C7C();
          }
        }
        int v104 = open(v102, 2 * (v10 == 0));
        int v211 = v104;
        if (v104 == -1 || fstat(v104, &v212)) {
          err(1, "%s", v102);
        }
        if (v166)
        {
          v105 = v166;
          if (!strchr(v166, 47))
          {
            snprintf(__str, 0x400uLL, "/boot/%s", v166);
            v105 = strdup(__str);
            if (!v105) {
              sub_100006C7C();
            }
          }
          int v106 = open(v105, 0);
          if (v106 == -1 || (int v107 = v106, fstat(v106, &v212))) {
            err(1, "%s", v105);
          }
        }
        else
        {
          v105 = 0;
          int v107 = -1;
        }
        int v153 = v107;
        if (!v10)
        {
          v151 = v105;
          mode_t st_mode = v212.st_mode;
          v167[0] = 0;
          int v110 = getmntinfo(v167, 2);
          if (!v110) {
            sub_100006C94();
          }
          int v111 = v110;
          int v112 = strncmp(v102, "/dev/", 5uLL);
          if (v112) {
            uint64_t v113 = 0;
          }
          else {
            uint64_t v113 = 5;
          }
          v114 = &v102[v113];
          BOOL v115 = 1;
          v152 = v102;
          if ((st_mode & 0xF000) == 0x2000 && !v112) {
            BOOL v115 = *v114 != 114;
          }
          f_mntfromname = v167[0]->f_mntfromname;
          do
          {
            int v117 = strncmp(f_mntfromname, "/dev/", 5uLL);
            if (v117) {
              v118 = f_mntfromname;
            }
            else {
              v118 = f_mntfromname + 5;
            }
            if (v117) {
              char v119 = 1;
            }
            else {
              char v119 = v115;
            }
            if ((v119 & 1) == 0 && !strcmp(v114 + 1, v118) || !strcmp(v114, v118)) {
              errx(1, "%s is mounted on %s");
            }
            v167[0] = (statfs *)(f_mntfromname + 1056);
            f_mntfromname += 2168;
            --v111;
          }
          while (v111);
          v103 = v166;
          v105 = v151;
          v102 = v152;
        }
        memset(v213, 0, 148);
        uint64_t v210 = -1;
        uint64_t v209 = -1;
        int v208 = -1;
        unsigned int v207 = -1;
        unsigned int v120 = v211;
        if (ioctl(v211, 0x40086449uLL, &v210) == -1)
        {
          v121 = __error();
          v122 = strerror(*v121);
          *(_OWORD *)v167 = xmmword_10000C490;
          uint64_t v168 = qword_10000C4A0;
          v148 = v102;
          sub_100005A0C((uint64_t)v167, 3, (uint64_t)"%s: %s: Cannot get partition offset", v123, v124, v125, v126, v127, (uint64_t)v122);
        }
        if (ioctl(v120, 0x40086419uLL, &v209, v148) == -1)
        {
          v128 = __error();
          v129 = strerror(*v128);
          *(_OWORD *)v167 = xmmword_10000C490;
          uint64_t v168 = qword_10000C4A0;
          v149 = v102;
          sub_100005A0C((uint64_t)v167, 3, (uint64_t)"%s: %s: Cannot get block count", v130, v131, v132, v133, v134, (uint64_t)v129);
        }
        if (ioctl(v120, 0x40046418uLL, &v208, v149) == -1)
        {
          v135 = __error();
          v136 = strerror(*v135);
          *(_OWORD *)v167 = xmmword_10000C490;
          uint64_t v168 = qword_10000C4A0;
          v150 = v102;
          sub_100005A0C((uint64_t)v167, 3, (uint64_t)"%s: %s: Cannot get block size", v137, v138, v139, v140, v141, (uint64_t)v136);
        }
        if (ioctl(v120, 0x4004644DuLL, &v207, v150) == -1)
        {
          *(_OWORD *)v167 = xmmword_10000C490;
          uint64_t v168 = qword_10000C4A0;
          sub_100005A0C((uint64_t)v167, 6, (uint64_t)"ioctl(DKIOCGETPHYSICALBLOCKSIZE) not supported\n", v142, v143, v144, v145, v146, v147);
        }
        *(stat *)((char *)v213 + 4) = v212;
        v206[3] = &v211;
        memset(v206, 0, 24);
        v206[4] = sub_100006C6C;
        v206[5] = sub_100006C74;
        v185[0] = v103;
        v185[1] = v164;
        v185[2] = v165;
        v185[3] = v161;
        int v186 = v154;
        int v187 = v5;
        int v188 = v6;
        int v189 = v155;
        int v190 = v7;
        int v191 = v8;
        int v192 = HIDWORD(v155);
        uint64_t v193 = v156;
        int v194 = HIDWORD(v157);
        int v195 = v157;
        int v196 = HIDWORD(v158);
        int v197 = v158;
        int v198 = HIDWORD(v159);
        int v199 = v160;
        uint64_t v200 = v163;
        int v201 = v10;
        int v202 = v159;
        int v203 = HIDWORD(v160);
        int v204 = v162;
        v167[0] = (statfs *)v120;
        v167[1] = (statfs *)v102;
        uint64_t v168 = v207;
        uint64_t v169 = v210;
        uint64_t v170 = v209;
        int v171 = v208;
        v173 = v105;
        int v174 = v153;
        int v184 = HIDWORD(v212.st_qspare[1]);
        long long v181 = v213[6];
        long long v182 = v213[7];
        long long v183 = v213[8];
        long long v180 = v213[5];
        long long v177 = *(_OWORD *)(&v212.st_rdev + 1);
        long long v178 = v213[3];
        long long v179 = v213[4];
        long long v175 = v213[0];
        int v205 = 0;
        int v172 = 0;
        long long v176 = *(_OWORD *)((char *)&v212.st_ino + 4);
        uint64_t result = sub_10000367C((uint64_t)v185, (int *)v167, v206, v142, v143, v144, v145, v146);
        break;
    }
    return result;
  }
}

void sub_1000068A8(int a1, int a2, char *a3, va_list a4)
{
  if (a2 == 6)
  {
    vprintf(a3, a4);
  }
  else if (a2 == 3)
  {
    verrx(1, a3, a4);
  }
}

uint64_t sub_1000068F0(uint64_t a1, unsigned int *a2)
{
  uint64_t v28 = 0;
  uint64_t v3 = wipefs_alloc();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *a2;
    strerror(v3);
    long long v26 = xmmword_10000C490;
    uint64_t v27 = qword_10000C4A0;
    sub_100005A0C((uint64_t)&v26, 3, (uint64_t)"wipefs_alloc(): fd(%d) %s", v6, v7, v8, v9, v10, v5);
  }
  else
  {
    uint64_t v11 = wipefs_except_blocks();
    if (v11)
    {
      uint64_t v4 = v11;
      uint64_t v12 = *a2;
      strerror(v11);
      long long v26 = xmmword_10000C490;
      uint64_t v27 = qword_10000C4A0;
      sub_100005A0C((uint64_t)&v26, 3, (uint64_t)"wipefs_except_blocks(): fd(%d) %s", v13, v14, v15, v16, v17, v12);
    }
    else
    {
      uint64_t v18 = wipefs_wipe();
      uint64_t v4 = v18;
      if (v18)
      {
        uint64_t v19 = *a2;
        strerror(v18);
        long long v26 = xmmword_10000C490;
        uint64_t v27 = qword_10000C4A0;
        sub_100005A0C((uint64_t)&v26, 3, (uint64_t)"wipefs_wipe(): fd(%d) %s", v20, v21, v22, v23, v24, v19);
      }
    }
    wipefs_free();
  }
  return v4;
}

void sub_100006A0C()
{
}

ssize_t sub_100006C6C(int *a1, void *a2, size_t a3, off_t a4)
{
  return pread(*a1, a2, a3, a4);
}

ssize_t sub_100006C74(int *a1, const void *a2, size_t a3, off_t a4)
{
  return pwrite(*a1, a2, a3, a4);
}

void sub_100006C7C()
{
}

void sub_100006C94()
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

int *__error(void)
{
  return ___error();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

uint64_t wipefs_alloc()
{
  return _wipefs_alloc();
}

uint64_t wipefs_except_blocks()
{
  return _wipefs_except_blocks();
}

uint64_t wipefs_free()
{
  return _wipefs_free();
}

uint64_t wipefs_wipe()
{
  return _wipefs_wipe();
}