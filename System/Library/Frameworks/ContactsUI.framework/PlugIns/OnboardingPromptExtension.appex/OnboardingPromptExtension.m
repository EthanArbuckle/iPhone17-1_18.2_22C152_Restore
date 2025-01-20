void sub_100002504()
{
  uint64_t v0;
  double v1;
  id v2;
  id v3;
  NSString v4;
  id v5;
  id v6;
  id v7;

  v1 = *(double *)(v0 + *(int *)(type metadata accessor for OnboardingContactContentView() + 60));
  v2 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", v1, v1, 1.0);
  v3 = objc_allocWithZone((Class)ISIcon);
  v4 = sub_1000062B0();
  v5 = [v3 initWithBundleIdentifier:v4];

  v6 = [v5 prepareImageForDescriptor:v2];
  if (v6)
  {
    v7 = [v6 CGImage];

    if (v7)
    {

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100002610@<X0>(void *a1@<X8>)
{
  v2 = (void *)v1;
  v22 = a1;
  uint64_t v3 = sub_100004840(&qword_10000CB60) - 8;
  __chkstk_darwin();
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006010() - 8;
  __chkstk_darwin();
  v8 = (void *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_100006080();
  sub_1000028F0(v1, v27);
  v28[456] = 0;
  memcpy(&v28[7], v27, 0x1C1uLL);
  sub_100004840(&qword_10000CB68);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100006A60;
  *(void *)(v9 + 32) = *v2;
  swift_retain();
  *(void *)(v9 + 40) = sub_100006210();
  v29[0] = v9;
  sub_1000062D0();
  sub_100006290();
  sub_1000062A0();
  sub_100006270();
  sub_100006000();
  uint64_t v10 = v23;
  long long v20 = v24;
  uint64_t v11 = v25;
  uint64_t v12 = v26;
  LOBYTE(v9) = sub_1000060E0();
  v29[0] = v21;
  v29[1] = 0x4014000000000000;
  LOBYTE(v29[2]) = 0;
  memcpy((char *)&v29[2] + 1, v28, 0x1C8uLL);
  v29[60] = v10;
  *(_OWORD *)&v29[61] = v20;
  v29[63] = v11;
  v29[64] = v12;
  LOBYTE(v29[65]) = v9;
  uint64_t v13 = *(void *)((char *)v2 + *(int *)(type metadata accessor for OnboardingContactContentView() + 40));
  v14 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v15 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v16 = sub_1000060A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  void *v8 = v13;
  v8[1] = v13;
  sub_100004A44((uint64_t)v8, (uint64_t)v5);
  *(_WORD *)&v5[*(int *)(v3 + 44)] = 256;
  uint64_t v17 = sub_100004840(&qword_10000CB48);
  v18 = v22;
  sub_100004AA8((uint64_t)v5, (uint64_t)v22 + *(int *)(v17 + 36), &qword_10000CB60);
  memcpy(v18, v29, 0x209uLL);
  sub_100004B0C((uint64_t)v29);
  sub_100004BC8((uint64_t)v5, &qword_10000CB60);
  sub_100004C24((uint64_t)v8);
  return sub_100004C80((uint64_t)v29);
}

void sub_1000028F0(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100006240();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + *(int *)(type metadata accessor for OnboardingContactContentView() + 64) + 8) >> 60;
  v85 = a2;
  if (v8 != 15)
  {
    CFDataRef isa = sub_100005FB0().super.isa;
    CGImageSourceRef v10 = CGImageSourceCreateWithData(isa, 0);

    if (v10)
    {
      if (CGImageSourceCreateImageAtIndex(v10, 0, 0))
      {

        goto LABEL_6;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_100002504();
LABEL_6:
  sub_100006090();
  sub_1000061C0();
  sub_100006260();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
  uint64_t v110 = sub_100006250();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100006280();
  sub_100005FF0();
  uint64_t v88 = v209;
  unsigned __int8 v11 = v210;
  unsigned __int8 v12 = v212;
  uint64_t v95 = v213;
  uint64_t v98 = v211;
  uint64_t v99 = v214;
  int v109 = sub_100006100();
  sub_100005FE0();
  uint64_t v106 = v14;
  uint64_t v107 = v13;
  uint64_t v104 = v16;
  uint64_t v105 = v15;
  int v108 = sub_100006110();
  sub_100005FE0();
  uint64_t v102 = v18;
  uint64_t v103 = v17;
  uint64_t v100 = v20;
  uint64_t v101 = v19;
  unsigned __int8 v208 = v11;
  unsigned __int8 v206 = v12;
  unsigned __int8 v201 = 0;
  unsigned __int8 v198 = 0;
  uint64_t v84 = sub_1000060C0();
  sub_100003270((uint64_t)v137);
  uint64_t v82 = *(void *)&v137[8];
  uint64_t v83 = *(void *)v137;
  int v21 = v137[16];
  uint64_t v81 = *(void *)&v137[24];
  uint64_t v96 = *(void *)&v137[40];
  uint64_t v97 = *(void *)&v137[32];
  int v92 = v137[48];
  uint64_t v93 = *(void *)&v137[64];
  uint64_t v94 = *(void *)&v137[56];
  int v22 = v137[72];
  uint64_t v90 = *(void *)&v137[88];
  uint64_t v91 = *(void *)&v137[80];
  uint64_t v89 = *(void *)&v137[96];
  int v23 = v137[104];
  unsigned __int8 v24 = sub_100006110();
  int v25 = sub_100006120();
  sub_100006120();
  if (sub_100006120() != v24) {
    int v25 = sub_100006120();
  }
  int v87 = v25;
  sub_100005FE0();
  uint64_t v79 = v27;
  uint64_t v80 = v26;
  uint64_t v77 = v29;
  uint64_t v78 = v28;
  unsigned __int8 v30 = sub_100006130();
  int v31 = sub_100006120();
  sub_100006120();
  if (sub_100006120() != v30) {
    int v31 = sub_100006120();
  }
  int v86 = v31;
  sub_100005FE0();
  uint64_t v75 = v33;
  uint64_t v76 = v32;
  uint64_t v73 = v35;
  uint64_t v74 = v34;
  unsigned __int8 v36 = sub_1000060F0();
  unsigned __int8 v37 = sub_100006100();
  int v38 = sub_100006120();
  sub_100006120();
  if (sub_100006120() != v36) {
    int v38 = sub_100006120();
  }
  sub_100006120();
  if (sub_100006120() == v37) {
    int v72 = v38;
  }
  else {
    int v72 = sub_100006120();
  }
  char v122 = 1;
  char v121 = v21;
  char v120 = v92;
  char v119 = v22;
  int v61 = v22;
  int v62 = v23;
  char v118 = v23;
  char v123 = 0;
  unsigned __int8 v124 = 0;
  sub_100005FE0();
  uint64_t v64 = v39;
  uint64_t v65 = v40;
  uint64_t v66 = v41;
  uint64_t v67 = v42;
  int v63 = v124;
  char v125 = 0;
  v117[0] = *(_DWORD *)v207;
  *(_DWORD *)((char *)v117 + 3) = *(_DWORD *)&v207[3];
  int v70 = v208;
  int v71 = v206;
  v116[0] = *(_DWORD *)v205;
  *(_DWORD *)((char *)v116 + 3) = *(_DWORD *)&v205[3];
  __int16 v115 = v204;
  int v114 = v203;
  *(_DWORD *)((char *)v113 + 3) = *(_DWORD *)&v202[3];
  v113[0] = *(_DWORD *)v202;
  *(_DWORD *)((char *)v112 + 3) = *(_DWORD *)&v200[3];
  v112[0] = *(_DWORD *)v200;
  *(_DWORD *)((char *)v111 + 3) = *(_DWORD *)&v199[3];
  v111[0] = *(_DWORD *)v199;
  int v68 = v201;
  int v69 = v198;
  int v60 = 0;
  *(void *)&long long v126 = v110;
  *((void *)&v126 + 1) = v88;
  LOBYTE(v127) = v208;
  DWORD1(v127) = *(_DWORD *)&v207[3];
  *(_DWORD *)((char *)&v127 + 1) = *(_DWORD *)v207;
  *((void *)&v127 + 1) = v98;
  LOBYTE(v128) = v206;
  DWORD1(v128) = *(_DWORD *)&v205[3];
  *(_DWORD *)((char *)&v128 + 1) = *(_DWORD *)v205;
  *((void *)&v128 + 1) = v95;
  *(void *)&long long v129 = v99;
  HIWORD(v129) = v204;
  *(_DWORD *)((char *)&v129 + 10) = v203;
  DWORD1(v130) = *(_DWORD *)&v202[3];
  *(_DWORD *)((char *)&v130 + 1) = *(_DWORD *)v202;
  HIDWORD(v132) = *(_DWORD *)&v200[3];
  *(_DWORD *)((char *)&v132 + 9) = *(_DWORD *)v200;
  DWORD1(v133) = *(_DWORD *)&v199[3];
  *(_DWORD *)((char *)&v133 + 1) = *(_DWORD *)v199;
  WORD4(v129) = 256;
  LOBYTE(v130) = v109;
  *((void *)&v130 + 1) = v107;
  *(void *)&long long v131 = v106;
  *((void *)&v131 + 1) = v105;
  *(void *)&long long v132 = v104;
  BYTE8(v132) = v201;
  HIDWORD(v59) = v21;
  LOBYTE(v133) = v108;
  *((void *)&v133 + 1) = v103;
  *(void *)&v134[0] = v102;
  *((void *)&v134[0] + 1) = v101;
  *(void *)&v134[1] = v100;
  BYTE8(v134[1]) = v198;
  uint64_t v44 = v83;
  uint64_t v43 = v84;
  v135[0] = v84;
  v135[1] = 0;
  LOBYTE(v135[2]) = 1;
  v135[3] = v83;
  uint64_t v45 = v81;
  uint64_t v46 = v82;
  v135[4] = v82;
  LOBYTE(v135[5]) = v21;
  v135[6] = v81;
  v135[7] = v97;
  v135[8] = v96;
  char v47 = v92;
  LOBYTE(v135[9]) = v92;
  v135[10] = v94;
  v135[11] = v93;
  LOBYTE(v135[12]) = v22;
  v135[13] = v91;
  v135[14] = v90;
  v135[15] = v89;
  LOBYTE(v135[16]) = v23;
  LOBYTE(v135[17]) = v87;
  uint64_t v48 = v79;
  uint64_t v49 = v80;
  v135[18] = v80;
  v135[19] = v79;
  uint64_t v50 = v77;
  uint64_t v51 = v78;
  v135[20] = v78;
  v135[21] = v77;
  LOBYTE(v135[22]) = 0;
  LOBYTE(v135[23]) = v86;
  uint64_t v52 = v75;
  uint64_t v53 = v76;
  v135[24] = v76;
  v135[25] = v75;
  uint64_t v54 = v73;
  uint64_t v55 = v74;
  v135[26] = v74;
  v135[27] = v73;
  LOBYTE(v135[28]) = v124;
  char v56 = v72;
  LOBYTE(v135[29]) = v72;
  v135[30] = v39;
  v135[31] = v40;
  v135[32] = v41;
  v135[33] = v42;
  LOBYTE(v135[34]) = 0;
  *(_OWORD *)&v137[112] = v133;
  *(_OWORD *)&v137[128] = v134[0];
  *(_OWORD *)&v137[137] = *(_OWORD *)((char *)v134 + 9);
  *(_OWORD *)&v137[32] = v128;
  *(_OWORD *)&v137[48] = v129;
  *(_OWORD *)&v137[64] = v130;
  *(_OWORD *)&v137[80] = v131;
  *(_OWORD *)&v137[96] = v132;
  *(_OWORD *)v137 = v126;
  *(_OWORD *)&v137[16] = v127;
  memcpy(&v137[160], v135, 0x111uLL);
  char v136 = 1;
  v57 = v85;
  memcpy(v85, v137, 0x1B8uLL);
  char v58 = v136;
  v57[55] = 0;
  *((unsigned char *)v57 + 448) = v58;
  v138[0] = v43;
  v138[1] = 0;
  char v139 = 1;
  uint64_t v140 = v44;
  uint64_t v141 = v46;
  char v142 = BYTE4(v59);
  uint64_t v143 = v45;
  uint64_t v144 = v97;
  uint64_t v145 = v96;
  char v146 = v47;
  uint64_t v147 = v94;
  uint64_t v148 = v93;
  char v149 = v61;
  uint64_t v150 = v91;
  uint64_t v151 = v90;
  uint64_t v152 = v89;
  char v153 = v62;
  char v154 = v87;
  uint64_t v155 = v49;
  uint64_t v156 = v48;
  uint64_t v157 = v51;
  uint64_t v158 = v50;
  char v159 = 0;
  char v160 = v86;
  uint64_t v161 = v53;
  uint64_t v162 = v52;
  uint64_t v163 = v55;
  uint64_t v164 = v54;
  char v165 = v63;
  char v166 = v56;
  uint64_t v167 = v64;
  uint64_t v168 = v65;
  uint64_t v169 = v66;
  uint64_t v170 = v67;
  char v171 = v60;
  sub_100004D40((uint64_t)&v126);
  sub_100004D6C((uint64_t)v135);
  sub_100004DF8((uint64_t)v138);
  v172[0] = v110;
  v172[1] = v88;
  char v173 = v70;
  *(_DWORD *)v174 = v117[0];
  *(_DWORD *)&v174[3] = *(_DWORD *)((char *)v117 + 3);
  uint64_t v175 = v98;
  char v176 = v71;
  *(_DWORD *)v177 = v116[0];
  *(_DWORD *)&v177[3] = *(_DWORD *)((char *)v116 + 3);
  uint64_t v178 = v95;
  uint64_t v179 = v99;
  __int16 v180 = 256;
  __int16 v182 = v115;
  int v181 = v114;
  char v183 = v109;
  *(_DWORD *)&v184[3] = *(_DWORD *)((char *)v113 + 3);
  *(_DWORD *)v184 = v113[0];
  uint64_t v185 = v107;
  uint64_t v186 = v106;
  uint64_t v187 = v105;
  uint64_t v188 = v104;
  char v189 = v68;
  *(_DWORD *)&v190[3] = *(_DWORD *)((char *)v112 + 3);
  *(_DWORD *)v190 = v112[0];
  char v191 = v108;
  *(_DWORD *)&v192[3] = *(_DWORD *)((char *)v111 + 3);
  *(_DWORD *)v192 = v111[0];
  uint64_t v193 = v103;
  uint64_t v194 = v102;
  uint64_t v195 = v101;
  uint64_t v196 = v100;
  char v197 = v69;
  sub_100004E84((uint64_t)v172);
}

uint64_t sub_100003270@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for OnboardingContactContentView();
  sub_1000048C4();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000061D0();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100006140();
  sub_100006150();
  swift_release();
  uint64_t v7 = sub_1000061B0();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100004918(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_100006220();
  uint64_t v12 = sub_1000061A0();
  uint64_t v37 = v13;
  uint64_t v38 = v12;
  uint64_t v39 = v14;
  char v36 = v15 & 1;
  sub_100004918(v7, v9, v11 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1000061D0();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_100006180();
  uint64_t v21 = sub_1000061B0();
  uint64_t v23 = v22;
  char v25 = v24;
  swift_release();
  sub_100004918(v16, v18, v20);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v26 = sub_1000061A0();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_100004918(v21, v23, v25 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v33 = swift_getKeyPath();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v26;
  *(void *)(a1 + 64) = v28;
  *(unsigned char *)(a1 + 72) = v32;
  *(void *)(a1 + 80) = v30;
  *(void *)(a1 + 88) = v33;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  sub_100004A34(v38, v37, v36);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100004A34(v26, v28, v32);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100004918(v26, v28, v32);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100004918(v38, v37, v36);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000035B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v56 = a2;
  sub_100004840(&qword_10000CB48);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v58 = (uint64_t)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v55 = (uint64_t)v51 - v5;
  sub_100002610((char *)v51 - v5);
  uint64_t v6 = type metadata accessor for OnboardingContactContentView();
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(v6 + 52));
  uint64_t v8 = v7[1];
  uint64_t v59 = *v7;
  uint64_t v60 = v8;
  v51[1] = sub_1000048C4();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1000061D0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_100006170();
  uint64_t v14 = sub_1000061B0();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  sub_100004918(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_100006160();
  uint64_t v53 = sub_100006190();
  uint64_t v54 = v19;
  uint64_t v57 = v20;
  char v22 = v21 & 1;
  sub_100004918(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  uint64_t v23 = (uint64_t *)(v52 + *(int *)(v6 + 56));
  uint64_t v24 = v23[1];
  uint64_t v59 = *v23;
  uint64_t v60 = v24;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_1000061D0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  sub_100006170();
  uint64_t v30 = sub_1000061B0();
  uint64_t v32 = v31;
  char v34 = v33;
  uint64_t v52 = v35;
  swift_release();
  LOBYTE(v6) = v34 & 1;
  sub_100004918(v25, v27, v29);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = swift_getKeyPath();
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = v55;
  uint64_t v40 = v58;
  sub_100004AA8(v55, v58, &qword_10000CB48);
  LOBYTE(v59) = v22;
  uint64_t v41 = v40;
  uint64_t v42 = v56;
  sub_100004AA8(v41, v56, &qword_10000CB48);
  uint64_t v43 = sub_100004840(&qword_10000CB58);
  uint64_t v44 = v42;
  uint64_t v45 = v42 + *(int *)(v43 + 48);
  uint64_t v46 = v53;
  uint64_t v47 = v54;
  uint64_t v48 = v57;
  *(void *)uint64_t v45 = v53;
  *(void *)(v45 + 8) = v48;
  *(unsigned char *)(v45 + 16) = v22;
  *(void *)(v45 + 24) = v47;
  uint64_t v49 = v44 + *(int *)(v43 + 64);
  *(void *)uint64_t v49 = v30;
  *(void *)(v49 + 8) = v32;
  *(unsigned char *)(v49 + 16) = v6;
  *(void *)(v49 + 24) = v52;
  *(void *)(v49 + 32) = KeyPath;
  *(unsigned char *)(v49 + 40) = 1;
  *(void *)(v49 + 48) = v37;
  *(void *)(v49 + 56) = 0x3FF0000000000000;
  *(void *)(v49 + 64) = v38;
  *(void *)(v49 + 72) = 0;
  *(unsigned char *)(v49 + 80) = 1;
  sub_100004A34(v46, v48, v22);
  swift_bridgeObjectRetain();
  sub_100004A34(v30, v32, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100004BC8(v39, &qword_10000CB48);
  sub_100004918(v30, v32, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100004918(v46, v57, v59);
  swift_bridgeObjectRelease();
  return sub_100004BC8(v58, &qword_10000CB48);
}

void sub_10000395C()
{
  sub_100004884();
  id v0 = (id)sub_1000062F0();
  sub_1000062E0();
  sub_100005FD0();
}

uint64_t sub_1000039E0()
{
  return sub_100006200();
}

uint64_t sub_1000039FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004840(&qword_10000CB28);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_1000060B0();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_100004840(&qword_10000CB30);
  sub_1000035B4(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  sub_100004AA8((uint64_t)v5, a1, &qword_10000CB28);
  uint64_t v7 = (void (**)())(a1 + *(int *)(sub_100004840(&qword_10000CB38) + 36));
  *uint64_t v7 = sub_10000395C;
  v7[1] = 0;
  v7[2] = 0;
  v7[3] = 0;
  return sub_100004BC8((uint64_t)v5, &qword_10000CB28);
}

uint64_t variable initialization expression of OnboardingContactHostViewController.imageData()
{
  return 0;
}

uint64_t *sub_100003AF4(uint64_t *a1, uint64_t *a2, int *a3)
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
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
    uint64_t v11 = *(int *)(sub_100006010() + 20);
    char v12 = &v9[v11];
    char v13 = &v10[v11];
    uint64_t v14 = sub_1000060A0();
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_retain();
    swift_retain();
    v15(v12, v13, v14);
    uint64_t v16 = a3[8];
    *(uint64_t *)((char *)v7 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v7 + v16) = *(uint64_t *)((char *)a2 + v16);
    uint64_t v17 = a3[10];
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v7 + v17) = *(uint64_t *)((char *)a2 + v17);
    uint64_t v18 = a3[11];
    uint64_t v19 = a3[12];
    uint64_t v20 = (uint64_t *)((char *)v7 + v18);
    char v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = (uint64_t *)((char *)v7 + v19);
    uint64_t v24 = (uint64_t *)((char *)a2 + v19);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = a3[13];
    uint64_t v27 = a3[14];
    char v28 = (uint64_t *)((char *)v7 + v26);
    char v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    *char v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = (uint64_t *)((char *)v7 + v27);
    uint64_t v32 = (uint64_t *)((char *)a2 + v27);
    uint64_t v33 = *v32;
    uint64_t v34 = v32[1];
    uint64_t v35 = a3[15];
    uint64_t v36 = a3[16];
    uint64_t v37 = *(uint64_t *)((char *)a2 + v35);
    *uint64_t v31 = v33;
    v31[1] = v34;
    *(uint64_t *)((char *)v7 + v35) = v37;
    uint64_t v38 = (char *)v7 + v36;
    uint64_t v39 = (_OWORD *)((char *)a2 + v36);
    unint64_t v40 = *(uint64_t *)((char *)a2 + v36 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v40 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v38 = *v39;
    }
    else
    {
      uint64_t v41 = *(void *)v39;
      sub_100003CE4(v41, v40);
      *(void *)uint64_t v38 = v41;
      *((void *)v38 + 1) = v40;
    }
  }
  return v7;
}

uint64_t sub_100003CE4(uint64_t a1, unint64_t a2)
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

uint64_t sub_100003D3C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = v4 + *(int *)(sub_100006010() + 20);
  uint64_t v6 = sub_1000060A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(a2 + 64));
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *v8;
    return sub_100003E44(v10, v9);
  }
  return result;
}

uint64_t sub_100003E44(uint64_t a1, unint64_t a2)
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

void *sub_100003E9C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  uint64_t v10 = *(int *)(sub_100006010() + 20);
  uint64_t v11 = &v8[v10];
  char v12 = &v9[v10];
  uint64_t v13 = sub_1000060A0();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_retain();
  swift_retain();
  v14(v11, v12, v13);
  uint64_t v15 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  uint64_t v16 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v17 = a3[11];
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)((char *)a1 + v18);
  uint64_t v23 = (void *)((char *)a2 + v18);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[13];
  uint64_t v26 = a3[14];
  uint64_t v27 = (void *)((char *)a1 + v25);
  char v28 = (void *)((char *)a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = (void *)((char *)a1 + v26);
  uint64_t v31 = (void *)((char *)a2 + v26);
  uint64_t v32 = *v31;
  uint64_t v33 = v31[1];
  uint64_t v34 = a3[15];
  uint64_t v35 = a3[16];
  uint64_t v36 = *(void *)((char *)a2 + v34);
  *uint64_t v30 = v32;
  v30[1] = v33;
  *(void *)((char *)a1 + v34) = v36;
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (_OWORD *)((char *)a2 + v35);
  unint64_t v39 = *(void *)((char *)a2 + v35 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v39 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v37 = *v38;
  }
  else
  {
    uint64_t v40 = *(void *)v38;
    sub_100003CE4(v40, v39);
    *(void *)uint64_t v37 = v40;
    *((void *)v37 + 1) = v39;
  }
  return a1;
}

void *sub_100004038(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = *(void *)((char *)a2 + v6 + 8);
  uint64_t v9 = *(int *)(sub_100006010() + 20);
  uint64_t v10 = (char *)v7 + v9;
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_1000060A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[12];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[13];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[14];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  uint64_t v25 = a3[16];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  unint64_t v28 = *(void *)((char *)a2 + v25 + 8);
  if (*(void *)((char *)a1 + v25 + 8) >> 60 != 15)
  {
    if (v28 >> 60 != 15)
    {
      uint64_t v30 = *v27;
      sub_100003CE4(v30, v28);
      uint64_t v31 = *v26;
      unint64_t v32 = v26[1];
      *uint64_t v26 = v30;
      v26[1] = v28;
      sub_100003E44(v31, v32);
      return a1;
    }
    sub_10000427C((uint64_t)v26);
    goto LABEL_6;
  }
  if (v28 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    return a1;
  }
  uint64_t v29 = *v27;
  sub_100003CE4(v29, v28);
  *uint64_t v26 = v29;
  v26[1] = v28;
  return a1;
}

uint64_t sub_10000427C(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1000042D0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_OWORD *)((char *)a1 + v6) = *(_OWORD *)((char *)a2 + v6);
  uint64_t v9 = *(int *)(sub_100006010() + 20);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_1000060A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v15) = *(_OWORD *)((char *)a2 + v15);
  uint64_t v16 = a3[14];
  *(_OWORD *)((char *)a1 + a3[13]) = *(_OWORD *)((char *)a2 + a3[13]);
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  uint64_t v17 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  return a1;
}

void *sub_1000043DC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_OWORD *)((char *)a1 + v6) = *(_OWORD *)((char *)a2 + v6);
  uint64_t v9 = *(int *)(sub_100006010() + 20);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_1000060A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[11];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[12];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[14];
  uint64_t v31 = (void *)((char *)a1 + v30);
  unint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  unint64_t v38 = *(void *)((char *)a1 + v35 + 8);
  if (v38 >> 60 != 15)
  {
    unint64_t v39 = v37[1];
    if (v39 >> 60 != 15)
    {
      uint64_t v40 = *v36;
      *uint64_t v36 = *v37;
      v36[1] = v39;
      sub_100003E44(v40, v38);
      return a1;
    }
    sub_10000427C((uint64_t)v36);
  }
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
  return a1;
}

uint64_t sub_10000458C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000045A0);
}

uint64_t sub_1000045A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100006010();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100004650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004664);
}

void *sub_100004664(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100006010();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for OnboardingContactContentView()
{
  uint64_t result = qword_10000CAC0;
  if (!qword_10000CAC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100004758()
{
  uint64_t result = sub_100006010();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100004824(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10000770C, 1);
}

uint64_t sub_100004840(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004884()
{
  unint64_t result = qword_10000CB40;
  if (!qword_10000CB40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CB40);
  }
  return result;
}

unint64_t sub_1000048C4()
{
  unint64_t result = qword_10000CB50;
  if (!qword_10000CB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CB50);
  }
  return result;
}

uint64_t sub_100004918(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100004928@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100006060();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000495C()
{
  return sub_100006070();
}

uint64_t sub_10000498C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006040();
  *a1 = result;
  return result;
}

uint64_t sub_1000049B8()
{
  return sub_100006050();
}

uint64_t sub_1000049E0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100006020();
  *a1 = v3;
  return result;
}

uint64_t sub_100004A0C()
{
  return sub_100006030();
}

uint64_t sub_100004A34(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100004A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004AA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004840(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100004B0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 208);
  uint64_t v3 = *(void *)(a1 + 216);
  char v4 = *(unsigned char *)(a1 + 224);
  uint64_t v5 = *(void *)(a1 + 264);
  uint64_t v6 = *(void *)(a1 + 272);
  char v7 = *(unsigned char *)(a1 + 280);
  swift_retain();
  sub_100004A34(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100004A34(v5, v6, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100004BC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004840(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004C24(uint64_t a1)
{
  uint64_t v2 = sub_100006010();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004C80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 208);
  uint64_t v3 = *(void *)(a1 + 216);
  char v4 = *(unsigned char *)(a1 + 224);
  uint64_t v5 = *(void *)(a1 + 264);
  uint64_t v6 = *(void *)(a1 + 272);
  char v7 = *(unsigned char *)(a1 + 280);
  swift_release();
  sub_100004918(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100004918(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100004D40(uint64_t a1)
{
  return a1;
}

uint64_t sub_100004D6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_100004A34(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100004A34(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_100004DF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_100004918(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_100004918(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100004E84(uint64_t a1)
{
  return a1;
}

unint64_t sub_100004EB4()
{
  unint64_t result = qword_10000CB70;
  if (!qword_10000CB70)
  {
    sub_100004F30(&qword_10000CB38);
    sub_100004F78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CB70);
  }
  return result;
}

uint64_t sub_100004F30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004F78()
{
  unint64_t result = qword_10000CB78;
  if (!qword_10000CB78)
  {
    sub_100004F30(&qword_10000CB28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CB78);
  }
  return result;
}

id static OnboardingContactHostViewController.makeHostingController(name:bottomField:contactCountText:bottomText:avatarWidth:trailPadding:imageData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  return sub_100005C90(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

id OnboardingContactHostViewController.__allocating_init(name:bottomField:contactCountText:bottomText:imageData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v17 = (char *)objc_allocWithZone(v10);
  uint64_t v18 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData];
  *(_OWORD *)uint64_t v18 = xmmword_100006BD0;
  uint64_t v19 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_name];
  *(void *)uint64_t v19 = a1;
  *((void *)v19 + 1) = a2;
  uint64_t v20 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomField];
  *(void *)uint64_t v20 = a3;
  *((void *)v20 + 1) = a4;
  uint64_t v21 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_contactCountText];
  *(void *)uint64_t v21 = a5;
  *((void *)v21 + 1) = a6;
  uint64_t v22 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomText];
  *(void *)uint64_t v22 = a7;
  *((void *)v22 + 1) = a8;
  uint64_t v23 = *(void *)v18;
  unint64_t v24 = *((void *)v18 + 1);
  *(void *)uint64_t v18 = a9;
  *((void *)v18 + 1) = a10;
  sub_100005DDC(a9, a10);
  sub_100005DF0(v23, v24);
  v29.receiver = v17;
  v29.super_class = v10;
  id v25 = objc_msgSendSuper2(&v29, "initWithNibName:bundle:", 0, 0);
  sub_100005DF0(a9, a10);
  return v25;
}

id OnboardingContactHostViewController.init(name:bottomField:contactCountText:bottomText:imageData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  id v10 = sub_100005E04(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  sub_100005DF0(a9, a10);
  return v10;
}

Swift::Void __swiftcall OnboardingContactHostViewController.viewDidLoad()()
{
  uint64_t v1 = type metadata accessor for OnboardingContactContentView();
  uint64_t v2 = (int *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v74 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v71 - v5);
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_name];
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_name + 8];
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomField + 8];
  uint64_t v77 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomField];
  uint64_t v78 = v7;
  uint64_t v72 = v9;
  uint64_t v73 = v8;
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_contactCountText];
  uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_contactCountText
                     + 8];
  uint64_t v12 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomText + 8];
  uint64_t v75 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomText];
  uint64_t v76 = v10;
  uint64_t v14 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData];
  unint64_t v13 = *(void *)&v0[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData + 8];
  id v15 = objc_allocWithZone((Class)UIColor);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v16 = v13;
  sub_100005DDC(v14, v13);
  [v15 initWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
  *uint64_t v6 = sub_100006230();
  [objc_allocWithZone((Class)UIColor) initWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];
  v6[1] = sub_100006230();
  uint64_t v17 = (_OWORD *)((char *)v6 + v2[8]);
  uint64_t v18 = (char *)v17 + *(int *)(sub_100006010() + 20);
  uint64_t v19 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v20 = sub_1000060A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v17 = _Q0;
  *(uint64_t *)((char *)v6 + v2[9]) = 0x4004000000000000;
  *(uint64_t *)((char *)v6 + v2[10]) = 0x4020000000000000;
  *(uint64_t *)((char *)v6 + v2[11]) = 0x402C000000000000;
  *(uint64_t *)((char *)v6 + v2[12]) = 0x402A000000000000;
  *(uint64_t *)((char *)v6 + v2[17]) = 0x4049000000000000;
  uint64_t v26 = (uint64_t *)((char *)v6 + v2[18]);
  uint64_t v27 = (uint64_t *)((char *)v6 + v2[13]);
  uint64_t v28 = v73;
  *uint64_t v27 = v78;
  v27[1] = v28;
  objc_super v29 = (uint64_t *)((char *)v6 + v2[14]);
  uint64_t v30 = v72;
  *objc_super v29 = v77;
  v29[1] = v30;
  uint64_t v31 = (uint64_t *)((char *)v6 + v2[15]);
  *uint64_t v31 = v76;
  v31[1] = v11;
  unint64_t v32 = (uint64_t *)((char *)v6 + v2[16]);
  uint64_t v33 = (uint64_t)v74;
  *unint64_t v32 = v75;
  v32[1] = v12;
  *uint64_t v26 = v14;
  v26[1] = v16;
  uint64_t v34 = v0;
  sub_100005ECC((uint64_t)v6, v33);
  id v35 = objc_allocWithZone((Class)sub_100004840(&qword_10000CBA8));
  uint64_t v36 = (void *)sub_1000060D0();
  [v34 addChildViewController:v36];
  id v37 = [v34 view];
  if (!v37)
  {
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v38 = v37;
  id v39 = [v36 view];
  if (!v39)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v40 = v39;
  [v38 addSubview:v39];

  id v41 = [v36 view];
  if (!v41)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v42 = v41;
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v43 = [v36 view];
  if (!v43)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v44 = v43;
  id v45 = [v43 topAnchor];

  id v46 = [v34 view];
  if (!v46)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v47 = v46;
  id v48 = [v46 topAnchor];

  id v49 = [v45 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  id v50 = [v36 view];
  if (!v50)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v51 = v50;
  id v52 = [v50 bottomAnchor];

  id v53 = [v34 view];
  if (!v53)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v54 = v53;
  id v55 = [v53 bottomAnchor];

  id v56 = [v52 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  id v57 = [v36 view];
  if (!v57)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v58 = v57;
  id v59 = [v57 rightAnchor];

  id v60 = [v34 view];
  if (!v60)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int v61 = v60;
  id v62 = [v60 rightAnchor];

  id v63 = [v59 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  id v64 = [v36 view];
  if (!v64)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v65 = v64;
  id v66 = [v64 leftAnchor];

  id v67 = [v34 view];
  if (v67)
  {
    int v68 = v67;
    id v69 = [v67 leftAnchor];

    id v70 = [v66 constraintEqualToAnchor:v69];
    [v70 setActive:1];

    [v36 didMoveToParentViewController:v34];
    sub_100005F30((uint64_t)v6);
    return;
  }
LABEL_23:
  __break(1u);
}

id OnboardingContactHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1000062B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void OnboardingContactHostViewController.init(nibName:bundle:)()
{
}

id OnboardingContactHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingContactHostViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100005C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  unint64_t v16 = (objc_class *)type metadata accessor for OnboardingContactHostViewController();
  uint64_t v17 = (char *)objc_allocWithZone(v16);
  uint64_t v18 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData];
  *(_OWORD *)uint64_t v18 = xmmword_100006BD0;
  uint64_t v19 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_name];
  *(void *)uint64_t v19 = a1;
  *((void *)v19 + 1) = a2;
  uint64_t v20 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomField];
  *(void *)uint64_t v20 = a3;
  *((void *)v20 + 1) = a4;
  uint64_t v21 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_contactCountText];
  *(void *)uint64_t v21 = a5;
  *((void *)v21 + 1) = a6;
  uint64_t v22 = &v17[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomText];
  *(void *)uint64_t v22 = a7;
  *((void *)v22 + 1) = a8;
  uint64_t v23 = *(void *)v18;
  unint64_t v24 = *((void *)v18 + 1);
  *(void *)uint64_t v18 = a9;
  *((void *)v18 + 1) = a10;
  sub_100005DDC(a9, a10);
  sub_100005DDC(a9, a10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005DF0(v23, v24);
  v29.receiver = v17;
  v29.super_class = v16;
  id v25 = objc_msgSendSuper2(&v29, "initWithNibName:bundle:", 0, 0);
  sub_100005DF0(a9, a10);
  return v25;
}

uint64_t sub_100005DDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100003CE4(a1, a2);
  }
  return a1;
}

uint64_t sub_100005DF0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100003E44(a1, a2);
  }
  return a1;
}

id sub_100005E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v11 = &v10[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData];
  *(_OWORD *)uint64_t v11 = xmmword_100006BD0;
  uint64_t v12 = &v10[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_name];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  unint64_t v13 = &v10[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomField];
  *(void *)unint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  uint64_t v14 = &v10[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_contactCountText];
  *(void *)uint64_t v14 = a5;
  *((void *)v14 + 1) = a6;
  id v15 = &v10[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_bottomText];
  *(void *)id v15 = a7;
  *((void *)v15 + 1) = a8;
  uint64_t v16 = *(void *)v11;
  unint64_t v17 = *((void *)v11 + 1);
  *(void *)uint64_t v11 = a9;
  *((void *)v11 + 1) = a10;
  sub_100005DDC(a9, a10);
  sub_100005DF0(v16, v17);
  v19.receiver = v10;
  v19.super_class = (Class)type metadata accessor for OnboardingContactHostViewController();
  return objc_msgSendSuper2(&v19, "initWithNibName:bundle:", 0, 0);
}

uint64_t sub_100005ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnboardingContactContentView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005F30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OnboardingContactContentView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for OnboardingContactHostViewController()
{
  return self;
}

NSData sub_100005FB0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100005FC0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005FD0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100005FE0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100005FF0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100006000()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_100006010()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100006020()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100006030()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100006040()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100006050()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100006060()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100006070()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100006080()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100006090()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000060A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000060B0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000060C0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000060D0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000060E0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000060F0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100006100()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100006110()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100006120()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_100006130()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100006140()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100006150()
{
  return Font.bold()();
}

uint64_t sub_100006160()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_100006170()
{
  return static Font.caption.getter();
}

uint64_t sub_100006180()
{
  return static Font.footnote.getter();
}

uint64_t sub_100006190()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000061A0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_1000061B0()
{
  return Text.font(_:)();
}

uint64_t sub_1000061C0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000061D0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000061E0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000061F0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100006200()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006210()
{
  return static Color.gray.getter();
}

uint64_t sub_100006220()
{
  return static Color.white.getter();
}

uint64_t sub_100006230()
{
  return Color.init(_:)();
}

uint64_t sub_100006240()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100006250()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100006260()
{
  return Image.init(_:scale:orientation:label:)();
}

uint64_t sub_100006270()
{
  return Gradient.init(colors:)();
}

uint64_t sub_100006280()
{
  return static Alignment.center.getter();
}

uint64_t sub_100006290()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_1000062A0()
{
  return static UnitPoint.bottom.getter();
}

NSString sub_1000062B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000062C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000062D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000062E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000062F0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100006300()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_avatarTrailingSpace(void *a1, const char *a2, ...)
{
  return _[a1 avatarTrailingSpace];
}

id objc_msgSend_avatarWidth(void *a1, const char *a2, ...)
{
  return _[a1 avatarWidth];
}

id objc_msgSend_bottomCaption(void *a1, const char *a2, ...)
{
  return _[a1 bottomCaption];
}

id objc_msgSend_contactBottomDetail(void *a1, const char *a2, ...)
{
  return _[a1 contactBottomDetail];
}

id objc_msgSend_contactCountString(void *a1, const char *a2, ...)
{
  return _[a1 contactCountString];
}

id objc_msgSend_contactName(void *a1, const char *a2, ...)
{
  return _[a1 contactName];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return _[a1 inputItems];
}

id objc_msgSend_makeHostingControllerWithName_bottomField_contactCountText_bottomText_avatarWidth_trailPadding_imageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeHostingControllerWithName:bottomField:contactCountText:bottomText:avatarWidth:trailPadding:imageData:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_setAvatarTrailingSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvatarTrailingSpace:");
}

id objc_msgSend_setAvatarWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvatarWidth:");
}

id objc_msgSend_setBottomCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomCaption:");
}

id objc_msgSend_setContactBottomDetail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactBottomDetail:");
}

id objc_msgSend_setContactCountString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactCountString:");
}

id objc_msgSend_setContactName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactName:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}