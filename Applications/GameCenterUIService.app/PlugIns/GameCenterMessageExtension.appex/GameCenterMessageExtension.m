__n128 sub_100002E9C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_100002EC0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002EE0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for GKProfilePrivacyVisibility(uint64_t a1)
{
}

uint64_t sub_100002F30@<X0>(uint64_t a1@<X8>)
{
  v2 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v22._countAndFlagsBits = 0xE000000000000000;
  v23._object = (void *)0x8000000100049530;
  v23._countAndFlagsBits = 0xD000000000000027;
  v24.value._countAndFlagsBits = 0;
  v24.value._object = 0;
  v3.super.isa = v2;
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  sub_100047498(v23, v24, v3, v25, v22);

  sub_1000036BC();
  uint64_t v4 = sub_100047BA8();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_100047AD8();
  uint64_t v9 = sub_100047B88();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_100003710(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_100047A68();
  uint64_t v14 = sub_100047B78();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  sub_100003710(v9, v11, v13 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v16;
  *(unsigned char *)(a1 + 16) = v18 & 1;
  *(void *)(a1 + 24) = v20;
  *(_WORD *)(a1 + 32) = 256;
  return result;
}

uint64_t sub_1000030C4()
{
  return sub_100047BF8();
}

_DWORD *sub_1000030E4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_1000030F4(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100003100@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100003110(uint64_t a1, uint64_t a2)
{
  return sub_10000327C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003128(uint64_t a1, id *a2)
{
  uint64_t result = sub_100047E48();
  *a2 = 0;
  return result;
}

uint64_t sub_1000031A0(uint64_t a1, id *a2)
{
  char v3 = sub_100047E58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003220@<X0>(void *a1@<X8>)
{
  sub_100047E68();
  NSString v2 = sub_100047E38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003264(uint64_t a1, uint64_t a2)
{
  return sub_10000327C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000327C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100047E68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000032C0()
{
  sub_100047E68();
  sub_100047EA8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003314()
{
  sub_100047E68();
  sub_100048368();
  sub_100047EA8();
  Swift::Int v0 = sub_100048388();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_100003388(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000339C()
{
  uint64_t v0 = sub_100047E68();
  uint64_t v2 = v1;
  if (v0 == sub_100047E68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100048328();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_100003428(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for MSMessagesAppPresentationStyle(uint64_t a1)
{
}

void sub_10000345C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000034A4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100047E38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000034EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100047E68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003518(uint64_t a1)
{
  uint64_t v2 = sub_100003618(&qword_100060818);
  uint64_t v3 = sub_100003618(&qword_100060820);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000035B0()
{
  return sub_100003618(&qword_100060800);
}

uint64_t sub_1000035E4()
{
  return sub_100003618(&qword_100060808);
}

uint64_t sub_100003618(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000365C()
{
  return sub_100003618(&qword_100060810);
}

ValueMetadata *type metadata accessor for FriendInviteExpirationText()
{
  return &type metadata for FriendInviteExpirationText;
}

uint64_t sub_1000036A0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000036BC()
{
  unint64_t result = qword_100060828;
  if (!qword_100060828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060828);
  }
  return result;
}

uint64_t sub_100003710(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100003724()
{
  unint64_t result = qword_100060830;
  if (!qword_100060830)
  {
    sub_100003798(&qword_100060838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060830);
  }
  return result;
}

uint64_t sub_100003798(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for FriendInviteActionStatusText(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FriendInviteActionStatusText(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FriendInviteActionStatusText(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100003968);
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

ValueMetadata *type metadata accessor for FriendInviteActionStatusText()
{
  return &type metadata for FriendInviteActionStatusText;
}

uint64_t sub_1000039A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000039BC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v95 = a2;
  uint64_t v93 = sub_100004714(&qword_1000609C0);
  __chkstk_darwin();
  uint64_t v94 = (uint64_t)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100047988();
  uint64_t v90 = *(void *)(v4 - 8);
  uint64_t v91 = v4;
  __chkstk_darwin();
  v87 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100047888();
  __chkstk_darwin();
  v92 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100047628();
  uint64_t v83 = *(void *)(v7 - 8);
  uint64_t v84 = v7;
  __chkstk_darwin();
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100004714(&qword_1000609C8);
  __chkstk_darwin();
  v82 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100004714(&qword_1000609D0);
  __chkstk_darwin();
  uint64_t v88 = (uint64_t)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  if (a1)
  {
    v75._countAndFlagsBits = 0xE000000000000000;
    v13._object = (void *)0x8000000100049590;
    v13._countAndFlagsBits = 0xD00000000000001ELL;
  }
  else
  {
    v13._countAndFlagsBits = 0xD000000000000022;
    v75._countAndFlagsBits = 0xE000000000000000;
    v13._object = (void *)0x8000000100049560;
  }
  v162.value._countAndFlagsBits = 0;
  v162.value._object = 0;
  v14.super.isa = v12;
  v163._countAndFlagsBits = 0;
  v163._object = (void *)0xE000000000000000;
  uint64_t v15 = sub_100047498(v13, v162, v14, v163, v75);
  uint64_t v17 = v16;

  *(void *)&long long v129 = v15;
  *((void *)&v129 + 1) = v17;
  sub_1000036BC();
  uint64_t v18 = sub_100047BA8();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_100047AD8();
  sub_100047AF8();
  swift_release();
  uint64_t v23 = sub_100047B88();
  uint64_t v79 = v24;
  uint64_t v80 = v23;
  LOBYTE(v15) = v25;
  uint64_t v81 = v26;
  swift_release();
  int v78 = v15 & 1;
  sub_100003710(v18, v20, v22);
  swift_bridgeObjectRelease();
  int v77 = sub_100047AC8();
  uint64_t v27 = enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:);
  uint64_t v29 = v83;
  uint64_t v28 = v84;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 104);
  v30(v9, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v84);
  sub_100047618();
  v31 = *(void (**)(char *, uint64_t))(v29 + 8);
  v31(v9, v28);
  sub_100047808();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  LODWORD(v83) = sub_100047A88();
  v30(v9, v27, v28);
  sub_100047618();
  v31(v9, v28);
  sub_100047808();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  v30(v9, v27, v28);
  LOBYTE(v27) = sub_100047618();
  v31(v9, v28);
  char v48 = v27 & 1;
  char v49 = v78;
  char v98 = v78;
  if (v27) {
    double v50 = 0.0;
  }
  else {
    double v50 = INFINITY;
  }
  char v97 = 0;
  char v96 = 0;
  uint64_t v52 = v79;
  uint64_t v51 = v80;
  uint64_t v146 = v80;
  uint64_t v147 = v79;
  char v148 = v78;
  uint64_t v149 = v81;
  char v150 = v77;
  uint64_t v151 = v33;
  uint64_t v152 = v35;
  uint64_t v153 = v37;
  uint64_t v154 = v39;
  char v155 = 0;
  char v156 = v83;
  uint64_t v157 = v41;
  uint64_t v158 = v43;
  uint64_t v159 = v45;
  uint64_t v160 = v47;
  char v161 = 0;
  sub_100047D08();
  sub_1000041B4(0.0, 1, 0.0, 1, v50, v48, 0.0, 1, v145, 0.0, 1, 0.0, 1);
  sub_100003710(v51, v52, v49);
  swift_bridgeObjectRelease();
  long long v110 = v145[11];
  long long v111 = v145[12];
  long long v112 = v145[13];
  long long v113 = v145[14];
  long long v106 = v145[7];
  long long v107 = v145[8];
  long long v108 = v145[9];
  long long v109 = v145[10];
  long long v103 = v145[4];
  long long v104 = v145[5];
  long long v105 = v145[6];
  long long v99 = v145[0];
  long long v100 = v145[1];
  long long v101 = v145[2];
  long long v102 = v145[3];
  char v53 = sub_100047A98();
  long long v126 = v111;
  long long v127 = v112;
  long long v128 = v113;
  long long v122 = v107;
  long long v123 = v108;
  long long v124 = v109;
  long long v125 = v110;
  long long v118 = v103;
  long long v119 = v104;
  long long v120 = v105;
  long long v121 = v106;
  long long v114 = v99;
  long long v115 = v100;
  long long v116 = v101;
  long long v117 = v102;
  int v54 = sub_100047A48();
  long long v141 = v126;
  long long v142 = v127;
  long long v143 = v128;
  long long v137 = v122;
  long long v138 = v123;
  long long v139 = v124;
  long long v140 = v125;
  long long v133 = v118;
  long long v134 = v119;
  long long v135 = v120;
  long long v136 = v121;
  long long v129 = v114;
  long long v130 = v115;
  long long v131 = v116;
  long long v132 = v117;
  LOBYTE(v144) = v53;
  HIDWORD(v144) = v54;
  uint64_t v56 = v90;
  uint64_t v55 = v91;
  v57 = v87;
  (*(void (**)(char *, void, uint64_t))(v90 + 104))(v87, enum case for RoundedCornerStyle.continuous(_:), v91);
  v58 = v92;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(&v92[*(int *)(v86 + 20)], v57, v55);
  __asm { FMOV            V0.2D, #9.0 }
  _OWORD *v58 = _Q0;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v55);
  uint64_t v64 = v94;
  sub_100004758((uint64_t)v58, v94);
  *(_WORD *)(v64 + *(int *)(v93 + 36)) = 256;
  uint64_t v65 = (uint64_t)v82;
  sub_1000049DC(v64, (uint64_t)&v82[*(int *)(v85 + 36)], &qword_1000609C0);
  long long v66 = v142;
  *(_OWORD *)(v65 + 192) = v141;
  *(_OWORD *)(v65 + 208) = v66;
  *(_OWORD *)(v65 + 224) = v143;
  *(void *)(v65 + 240) = v144;
  long long v67 = v138;
  *(_OWORD *)(v65 + 128) = v137;
  *(_OWORD *)(v65 + 144) = v67;
  long long v68 = v140;
  *(_OWORD *)(v65 + 160) = v139;
  *(_OWORD *)(v65 + 176) = v68;
  long long v69 = v134;
  *(_OWORD *)(v65 + 64) = v133;
  *(_OWORD *)(v65 + 80) = v69;
  long long v70 = v136;
  *(_OWORD *)(v65 + 96) = v135;
  *(_OWORD *)(v65 + 112) = v70;
  long long v71 = v130;
  *(_OWORD *)uint64_t v65 = v129;
  *(_OWORD *)(v65 + 16) = v71;
  long long v72 = v132;
  *(_OWORD *)(v65 + 32) = v131;
  *(_OWORD *)(v65 + 48) = v72;
  sub_10000492C((uint64_t)&v129);
  sub_100004868(v64, &qword_1000609C0);
  sub_1000047CC((uint64_t)v58);
  sub_100004828((uint64_t)&v99);
  uint64_t v73 = v88;
  sub_1000049DC(v65, v88, &qword_1000609C8);
  *(_WORD *)(v73 + *(int *)(v89 + 36)) = 256;
  sub_100004868(v65, &qword_1000609C8);
  return sub_1000048C4(v73, v95);
}

uint64_t sub_1000041B4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100048038();
    uint64_t v23 = (void *)sub_100047A78();
    sub_100047748();
  }
  sub_100047898();
  long long v24 = v13[5];
  a9[4] = v13[4];
  a9[5] = v24;
  a9[6] = v13[6];
  *(_OWORD *)((char *)a9 + 105) = *(_OWORD *)((char *)v13 + 105);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  long long v26 = v13[3];
  a9[2] = v13[2];
  a9[3] = v26;
  a9[8] = v28;
  a9[9] = v29;
  a9[13] = v33;
  a9[14] = v34;
  a9[11] = v31;
  a9[12] = v32;
  a9[10] = v30;
  return sub_10000492C((uint64_t)v13);
}

__n128 sub_100004378@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100048038();
    uint64_t v23 = (void *)sub_100047A78();
    sub_100047748();
  }
  sub_100047898();
  sub_1000049DC(v13, a9, &qword_1000609D8);
  long long v24 = (_OWORD *)(a9 + *(int *)(sub_100004714(&qword_1000609E0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *long long v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100004538@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100048038();
    uint64_t v23 = (void *)sub_100047A78();
    sub_100047748();
  }
  sub_100047898();
  long long v24 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v24;
  *(void *)(a9 + 96) = *(void *)(v13 + 96);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  long long v26 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v26;
  *(_OWORD *)(a9 + 104) = v28;
  *(_OWORD *)(a9 + 120) = v29;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 200) = v34;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 152) = v31;

  return sub_10000496C(v13);
}

uint64_t sub_10000470C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000039BC(*v1, a1);
}

uint64_t sub_100004714(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100047888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000047BC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000047CC(uint64_t a1)
{
  uint64_t v2 = sub_100047888();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004828(uint64_t a1)
{
  return a1;
}

uint64_t sub_100004868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004714(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000048C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_1000609D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000492C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000496C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000049DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004714(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100004A40()
{
  return sub_100004C90(&qword_1000609E8, &qword_1000609D0, (void (*)(void))sub_100004A84);
}

unint64_t sub_100004A84()
{
  unint64_t result = qword_1000609F0;
  if (!qword_1000609F0)
  {
    sub_100003798(&qword_1000609C8);
    sub_100004B24();
    sub_100004DB0(&qword_100060A68, &qword_1000609C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000609F0);
  }
  return result;
}

unint64_t sub_100004B24()
{
  unint64_t result = qword_1000609F8;
  if (!qword_1000609F8)
  {
    sub_100003798(&qword_100060A00);
    sub_100004BC4();
    sub_100004DB0(&qword_100060A58, &qword_100060A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000609F8);
  }
  return result;
}

unint64_t sub_100004BC4()
{
  unint64_t result = qword_100060A08;
  if (!qword_100060A08)
  {
    sub_100003798(&qword_100060A10);
    sub_100004C90(&qword_100060A18, &qword_100060A20, (void (*)(void))sub_100004D0C);
    sub_100004DB0(&qword_100060A48, &qword_100060A50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060A08);
  }
  return result;
}

uint64_t sub_100004C90(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004D0C()
{
  return sub_100004C90(&qword_100060A28, &qword_100060A30, (void (*)(void))sub_100004D3C);
}

unint64_t sub_100004D3C()
{
  unint64_t result = qword_100060A38;
  if (!qword_100060A38)
  {
    sub_100003798(&qword_100060A40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060A38);
  }
  return result;
}

uint64_t sub_100004DB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100004DF4(void *a1, uint64_t a2, char *a3)
{
  uint64_t v4 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer];
  *(void *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer] = a1;
  id v5 = a1;

  id v6 = [a3 collectionView];
  [v6 reloadData];
}

uint64_t sub_100004F80(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void))
{
  NSString v8 = sub_100047E38();
  a4(0);
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v9 = sub_100047E38();
  swift_bridgeObjectRelease();
  Class isa = sub_1000475D8().super.isa;
  id v11 = [v4 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v9 forIndexPath:isa];

  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {

    sub_1000481E8(68);
    v13._countAndFlagsBits = 0xD00000000000002ELL;
    v13._object = (void *)0x8000000100049760;
    sub_100047EB8(v13);
    v14._countAndFlagsBits = a1;
    v14._object = a2;
    sub_100047EB8(v14);
    v15._object = (void *)0x8000000100049790;
    v15._countAndFlagsBits = 0xD000000000000012;
    sub_100047EB8(v15);
    v16._countAndFlagsBits = sub_100047E88();
    sub_100047EB8(v16);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

uint64_t sub_100005280()
{
  type metadata accessor for SenderCell();
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v1 = sub_100047E38();
  swift_bridgeObjectRelease();
  Class isa = sub_1000475D8().super.isa;
  id v3 = [v0 dequeueReusableCellWithReuseIdentifier:v1 forIndexPath:isa];

  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {

    sub_1000481E8(42);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = sub_100047E88();
    sub_100047EB8(v5);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

id sub_100005890()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageActionsViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MessageActionsViewController()
{
  return self;
}

uint64_t sub_100005934(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (sub_100047E68() == a2 && v7 == a3) {
    goto LABEL_12;
  }
  char v9 = sub_100048328();
  swift_bridgeObjectRelease();
  if (v9) {
    return sub_100004F80(a2, a3, (uint64_t)a4, (void (*)(void))type metadata accessor for HeaderView);
  }
  if (sub_100047E68() == a2 && v10 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_100048328();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      sub_1000481E8(22);
      swift_bridgeObjectRelease();
      v17[0] = 0xD000000000000014;
      v17[1] = 0x8000000100049740;
      a4 = v17;
      v18._countAndFlagsBits = a2;
      v18._object = a3;
      sub_100047EB8(v18);
      sub_100048298();
      __break(1u);
LABEL_12:
      swift_bridgeObjectRelease();
      return sub_100004F80(a2, a3, (uint64_t)a4, (void (*)(void))type metadata accessor for HeaderView);
    }
  }
  Swift::String v14 = (void *)sub_100004F80(a2, a3, (uint64_t)a4, (void (*)(void))type metadata accessor for LoadingStatusView);
  Swift::String v13 = v14;
  if (byte_100060770 == 2)
  {
    [v14 setAlpha:0.0];
    [v13 setHidden:1];
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [Strong stopAnimating];
  }
  else
  {
    [v14 setAlpha:1.0];
    [v13 setHidden:0];
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [Strong startAnimating];
  }

  return (uint64_t)v13;
}

id sub_100005B8C()
{
  uint64_t v0 = (void *)sub_100005280();
  [v0 setClipsToBounds:1];
  id v1 = [v0 layer];
  [v1 setCornerRadius:15.0];

  id v2 = [self local];
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = result;
  id v5 = [v2 displayNameWithOptions:0];
  [v4 setText:v5];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v6 = result;
  id result = [self sharedTheme];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v7 = result;
  id v8 = [result eventIconImage];

  [v6 setImage:v8];
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    char v9 = result;
    [result setPlayer:v2];

    return v0;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100005D48()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005D80(void *a1, uint64_t a2)
{
  sub_100004DF4(a1, a2, *(char **)(v2 + 16));
}

UIFontTextStyle sub_100005D88()
{
  qword_100064210 = (uint64_t)UIFontTextStyleBody;
  return UIFontTextStyleBody;
}

UIFontTextStyle sub_100005DA0()
{
  qword_100064218 = (uint64_t)UIFontTextStyleFootnote;
  return UIFontTextStyleFootnote;
}

unint64_t sub_100006648(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0x6465766965636572;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x726F727265;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      unint64_t result = 0x7265646E6573;
      break;
  }
  return result;
}

unint64_t sub_10000675C(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0x6465766965636572;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x726F727265;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      unint64_t result = 0x7265646E6573;
      break;
  }
  return result;
}

unint64_t sub_100006870(char a1)
{
  sub_1000481E8(20);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0xD000000000000014;
  id v3 = (void *)0x8000000100049460;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      v2._countAndFlagsBits = 0xD000000000000019;
      uint64_t v4 = "senderGroupInviteAccepted";
      goto LABEL_11;
    case 3:
      id v3 = (void *)0xEE00657469766E49;
      v2._countAndFlagsBits = 0x6465766965636572;
      break;
    case 4:
      v2._countAndFlagsBits = 0xD00000000000001FLL;
      uint64_t v4 = "receivedInviteButAlreadyFriends";
      goto LABEL_11;
    case 5:
      id v5 = "receiverAccepted";
      goto LABEL_8;
    case 6:
      id v5 = "receiverRejected";
LABEL_8:
      id v3 = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
      v2._countAndFlagsBits = 0xD000000000000010;
      break;
    case 7:
      id v3 = (void *)0xE500000000000000;
      v2._countAndFlagsBits = 0x726F727265;
      break;
    case 8:
      v2._countAndFlagsBits = 0xD000000000000018;
      uint64_t v4 = "friendCodeInvalidExpired";
LABEL_11:
      id v3 = (void *)((unint64_t)(v4 - 32) | 0x8000000000000000);
      break;
    default:
      id v3 = (void *)0xE600000000000000;
      v2._countAndFlagsBits = 0x7265646E6573;
      break;
  }
  v2._object = v3;
  sub_100047EB8(v2);
  swift_bridgeObjectRelease();
  return 0xD000000000000012;
}

uint64_t sub_1000069F8(char *a1, char *a2)
{
  return sub_100006A04(*a1, *a2);
}

uint64_t sub_100006A04(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000014;
  unint64_t v4 = 0x8000000100049460;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xD000000000000019;
      id v5 = "senderGroupInviteAccepted";
      goto LABEL_11;
    case 3:
      unint64_t v3 = 0x6465766965636572;
      unint64_t v4 = 0xEE00657469766E49;
      break;
    case 4:
      unint64_t v3 = 0xD00000000000001FLL;
      id v5 = "receivedInviteButAlreadyFriends";
      goto LABEL_11;
    case 5:
      id v6 = "receiverAccepted";
      goto LABEL_8;
    case 6:
      id v6 = "receiverRejected";
LABEL_8:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 7:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v3 = 0x726F727265;
      break;
    case 8:
      unint64_t v3 = 0xD000000000000018;
      id v5 = "friendCodeInvalidExpired";
LABEL_11:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v3 = 0x7265646E6573;
      break;
  }
  unint64_t v7 = 0xD000000000000014;
  unint64_t v8 = 0x8000000100049460;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v7 = 0xD000000000000019;
      char v9 = "senderGroupInviteAccepted";
      goto LABEL_22;
    case 3:
      unint64_t v7 = 0x6465766965636572;
      unint64_t v8 = 0xEE00657469766E49;
      break;
    case 4:
      unint64_t v7 = 0xD00000000000001FLL;
      char v9 = "receivedInviteButAlreadyFriends";
      goto LABEL_22;
    case 5:
      uint64_t v10 = "receiverAccepted";
      goto LABEL_19;
    case 6:
      uint64_t v10 = "receiverRejected";
LABEL_19:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD000000000000010;
      break;
    case 7:
      unint64_t v8 = 0xE500000000000000;
      unint64_t v7 = 0x726F727265;
      break;
    case 8:
      unint64_t v7 = 0xD000000000000018;
      char v9 = "friendCodeInvalidExpired";
LABEL_22:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v8 = 0xE600000000000000;
      unint64_t v7 = 0x7265646E6573;
      break;
  }
  if (v3 == v7 && v4 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = sub_100048328();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int sub_100006C74()
{
  return sub_100048388();
}

uint64_t sub_100006CBC()
{
  return sub_100006CC4();
}

uint64_t sub_100006CC4()
{
  sub_100047EA8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100006E0C()
{
  return sub_100048388();
}

uint64_t sub_100006E50@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100010380(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100006E80@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000675C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100006EAC()
{
  return sub_100006648(*v0);
}

unint64_t sub_100006EB4()
{
  return sub_100006870(*v0);
}

BOOL sub_100006EBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100006ED4()
{
  Swift::UInt v1 = *v0;
  sub_100048368();
  sub_100048378(v1);
  return sub_100048388();
}

void sub_100006F1C()
{
  sub_100048378(*v0);
}

Swift::Int sub_100006F48()
{
  Swift::UInt v1 = *v0;
  sub_100048368();
  sub_100048378(v1);
  return sub_100048388();
}

id sub_100006F8C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FriendRequestCardViewController();
  return [super dealloc];
}

id sub_1000072C8()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v85 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v79 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  v82 = (char *)&v79 - v9;
  __chkstk_darwin(v8);
  char v11 = (char *)&v79 - v10;
  sub_100047738();
  char v12 = v0;
  Swift::String v13 = sub_100047758();
  os_log_type_t v14 = sub_100048008();
  if (os_log_type_enabled(v13, v14))
  {
    Swift::String v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = (void (*)(char *, uint64_t))swift_slowAlloc();
    uint64_t v79 = v7;
    uint64_t v86 = v15;
    *(_DWORD *)Swift::String v15 = 138412290;
    uint64_t v88 = v12;
    Swift::String v16 = v12;
    unint64_t v7 = v79;
    sub_100048168();
    *(void *)uint64_t v83 = v12;

    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ updatePlayerUI", v86, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    Swift::String v13 = v12;
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v86 = (uint8_t *)(v2 + 8);
  v17(v11, v1);
  id v81 = [self local];
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v19 = result;
  id result = [self sharedTheme];
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v20 = result;
  id v21 = [result eventIconImage];

  [v19 setImage:v21];
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  char v22 = result;
  [result setHidden:1];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v23 = result;
  [result setHidden:1];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  long long v24 = result;
  [result setHidden:1];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  long long v25 = result;
  [result setHidden:1];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  long long v26 = result;
  [result setHidden:1];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  long long v27 = result;
  uint64_t v84 = v1;
  [result setTextAlignment:4];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  long long v28 = result;
  [result setTextAlignment:4];

  id v29 = [v12 traitCollection];
  id v30 = [v29 preferredContentSizeCategory];

  LODWORD(v29) = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  long long v31 = result;
  if (v29)
  {
    if (!result)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    [result setAxis:1];

    id result = (id)swift_unknownObjectWeakLoadStrong();
    if (!result)
    {
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    long long v32 = result;
    id result = (id)swift_unknownObjectWeakLoadStrong();
    if (!result)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    long long v33 = result;
    [v32 insertArrangedSubview:result atIndex:1];
  }
  else
  {
    if (!result)
    {
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    [result setAxis:0];

    id result = (id)swift_unknownObjectWeakLoadStrong();
    if (!result)
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    long long v32 = result;
    id result = (id)swift_unknownObjectWeakLoadStrong();
    if (!result)
    {
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    long long v33 = result;
    [v32 insertArrangedSubview:result atIndex:0];
  }

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result) {
    goto LABEL_52;
  }
  long long v34 = result;
  [result setNeedsLayout];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v35 = result;
  [result layoutIfNeeded];

  id v36 = [v12 traitCollection];
  id v37 = [v36 userInterfaceStyle];

  id result = (id)swift_unknownObjectWeakLoadStrong();
  uint64_t v38 = result;
  if (v37 != (id)2)
  {
    if (result)
    {
      uint64_t v39 = &selRef_systemGray6Color;
      goto LABEL_29;
    }
LABEL_61:
    __break(1u);
    return result;
  }
  if (!result)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v39 = &selRef_tertiarySystemGroupedBackgroundColor;
LABEL_29:
  id v40 = [self *v39];
  [v38 setBackgroundColor:v40];

  uint64_t v41 = *(Class *)((char *)&v12->isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
  uint64_t v83 = v17;
  uint64_t v80 = v12;
  if (v41)
  {
    id v42 = v41;
    sub_100047738();
    uint64_t v43 = v12;
    id v44 = v42;
    uint64_t v45 = v43;
    uint64_t v46 = v44;
    uint64_t v47 = sub_100047758();
    os_log_type_t v48 = sub_100048008();
    int v49 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 138412546;
      LODWORD(v79) = v49;
      uint64_t v88 = v45;
      uint64_t v52 = v45;
      sub_100048168();
      *uint64_t v51 = v45;

      *(_WORD *)(v50 + 12) = 2112;
      uint64_t v88 = v46;
      char v53 = v46;
      sub_100048168();
      v51[1] = v41;

      _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v79, "%@ Updating friend card UI , player model is non nil: %@", (uint8_t *)v50, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v17 = v83;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v47 = v45;
    }
    uint64_t v60 = v84;
    v61 = v85;

    v17(v82, v60);
    uint64_t v62 = swift_allocObject();
    *(void *)(v62 + 16) = v45;
    *(void *)(v62 + 24) = v46;
    v63 = v45;
    uint64_t v64 = v46;
    sub_100014200((uint64_t)sub_100010AF4, v62);

    swift_release();
    uint64_t v65 = v80;
  }
  else
  {
    sub_100047728();
    int v54 = v12;
    uint64_t v55 = sub_100047758();
    os_log_type_t v56 = sub_100048028();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v79 = v7;
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = (void *)swift_slowAlloc();
      *(_DWORD *)v57 = 138412290;
      uint64_t v88 = v54;
      v59 = v54;
      unint64_t v7 = v79;
      sub_100048168();
      void *v58 = v54;

      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%@ expected a playerModel", v57, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v55 = v54;
    }
    uint64_t v60 = v84;
    v61 = v85;

    v17(v7, v60);
    *((unsigned char *)&v54->isa + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
    sub_10000C728();
    uint64_t v66 = sub_10003F89C();
    uint64_t v65 = v80;
    if (v66)
    {
      long long v67 = (void *)v66;
      sub_10002DB48();
    }
  }
  sub_100047738();
  long long v68 = v65;
  long long v69 = sub_100047758();
  os_log_type_t v70 = sub_100048008();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = swift_slowAlloc();
    long long v72 = (void *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    uint64_t v87 = (uint64_t)v68;
    uint64_t v88 = v73;
    *(_DWORD *)uint64_t v71 = 138412546;
    v74 = v68;
    sub_100048168();
    *long long v72 = v68;

    *(_WORD *)(v71 + 12) = 2080;
    unint64_t v75 = sub_100006870(*((unsigned char *)&v74->isa
                        + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState));
    uint64_t v87 = sub_100046724(v75, v76, (uint64_t *)&v88);
    sub_100048168();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v69, v70, "%@ inviteCardState is set to : %s", (uint8_t *)v71, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v78 = v84;
    int v77 = v85;
  }
  else
  {

    int v77 = v61;
    uint64_t v78 = v60;
  }
  return (id)((uint64_t (*)(char *, uint64_t))v83)(v77, v78);
}

void sub_100007EC0(void *a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  unint64_t v7 = (void *)sub_100047768();
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_4;
  }
  char v11 = self;
  id v12 = a1;
  id v13 = [v11 unknownPlayer];
  sub_100010B0C(0, (unint64_t *)&qword_100060CE8);
  char v14 = sub_1000480F8();

  if ((v14 & 1) == 0)
  {
    id v28 = [v12 internal];
    unsigned int v29 = [v28 friendsVisibility];

    *(_DWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = v29;
    id v30 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender];
    *(void *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = a1;
    id v89 = v12;

    sub_10000C560();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      long long v32 = Strong;
      [Strong setDelegate:a3];

      long long v33 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v33)
      {
        long long v34 = v33;
        [v33 setPlayer:v89];

        id v35 = [v89 internal];
        unsigned int v36 = [v35 friendsVisibility];

        a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = v36 == 0;
        id v37 = [v89 internal];
        unsigned int v38 = [v37 friendsVisibility];

        if (!v38) {
          sub_10000F19C(v89);
        }
        switch(a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState])
        {
          case 1:
            uint64_t v39 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState;
            char v40 = 6;
            goto LABEL_19;
          case 2:
            if ((a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8] & 1) != 0
              || *(uint64_t *)&a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount] < 1)
            {
              a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 0;
LABEL_20:
              sub_10000C728();
              uint64_t v41 = v89;

              return;
            }
            id v42 = (void *)sub_10003F89C();
            if (!v42) {
              goto LABEL_55;
            }
            uint64_t v43 = v42;
            id v44 = [v42 activeConversation];

            if (!v44) {
              goto LABEL_55;
            }
            id v45 = [v44 recipientAddresses];
            uint64_t v46 = sub_100047F58();

            uint64_t v47 = *(void *)(v46 + 16);
            swift_bridgeObjectRelease();
            if (v47 == 1)
            {
              os_log_type_t v48 = (void *)swift_unknownObjectWeakLoadStrong();
              if (v48)
              {
                int v49 = v48;
                [v48 setDelegate:a3];

                uint64_t v50 = (void *)swift_unknownObjectWeakLoadStrong();
                if (v50)
                {
                  uint64_t v51 = v50;
                  [v50 setHidden:0];

                  id v52 = [self local];
                  uint64_t v53 = swift_allocObject();
                  *(void *)(v53 + 16) = a4;
                  *(void *)(v53 + 24) = a3;
                  uint64_t v94 = sub_100010B04;
                  uint64_t v95 = v53;
                  aBlock = _NSConcreteStackBlock;
                  uint64_t v91 = 1107296256;
                  v92 = sub_100040234;
                  uint64_t v93 = &unk_100059F50;
                  int v54 = _Block_copy(&aBlock);
                  uint64_t v55 = a4;
                  os_log_type_t v56 = a3;
                  swift_release();
                  [v52 loadFriendsAsPlayersWithCompletionHandler:v54];
                  _Block_release(v54);
LABEL_59:

                  sub_10000DCE0((uint64_t)a4);
                  goto LABEL_60;
                }
LABEL_67:
                __break(1u);
                JUMPOUT(0x1000088D8);
              }
LABEL_66:
              __break(1u);
              goto LABEL_67;
            }

LABEL_55:
            v82 = (void *)swift_unknownObjectWeakLoadStrong();
            if (!v82) {
              goto LABEL_63;
            }
            uint64_t v83 = v82;
            [v82 setDelegate:a3];

            uint64_t v84 = (void *)swift_unknownObjectWeakLoadStrong();
            if (!v84) {
              goto LABEL_64;
            }
            uint64_t v85 = v84;
            [v84 setHidden:0];

            uint64_t v86 = swift_unknownObjectWeakLoadStrong();
            if (v86)
            {
              id v44 = (id)v86;
              id v52 = [v11 unknownPlayer];
              [v44 setPlayer:v52];
              goto LABEL_59;
            }
            goto LABEL_65;
          case 3:
            v57 = (uint64_t *)&a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
            swift_beginAccess();
            uint64_t v58 = *v57;
            if (!v58) {
              goto LABEL_53;
            }
            uint64_t v59 = *(void *)(v58 + 16);
            if (!v59)
            {
              uint64_t v62 = (void **)&_swiftEmptyArrayStorage;
LABEL_51:
              int v77 = v62[2];
              swift_release();
              if (!v77)
              {
LABEL_53:
                id v27 = [self local];
                uint64_t v78 = swift_allocObject();
                *(void *)(v78 + 16) = v89;
                *(void *)(v78 + 24) = a3;
                uint64_t v94 = sub_100010AFC;
                uint64_t v95 = v78;
                aBlock = _NSConcreteStackBlock;
                uint64_t v91 = 1107296256;
                v92 = sub_100040234;
                uint64_t v93 = &unk_100059F00;
                uint64_t v79 = _Block_copy(&aBlock);
                id v80 = v89;
                id v81 = a3;
                swift_release();
                [v27 loadFriendsAsPlayersWithCompletionHandler:v79];

                _Block_release(v79);
                goto LABEL_9;
              }
              a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 5;
              sub_10000C728();
LABEL_60:

              return;
            }
            uint64_t v60 = self;
            swift_bridgeObjectRetain();
            uint64_t v88 = v58;
            v61 = (void **)(v58 + 40);
            uint64_t v62 = (void **)&_swiftEmptyArrayStorage;
            break;
          case 4:
          case 5:
            uint64_t v39 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState;
            char v40 = 8;
            goto LABEL_19;
          default:
            uint64_t v39 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState;
            char v40 = 5;
LABEL_19:
            a3[v39] = v40;
            goto LABEL_20;
        }
        while (1)
        {
          uint64_t v64 = *(v61 - 1);
          v63 = *v61;
          swift_bridgeObjectRetain();
          id v65 = [v60 local];
          id v66 = [v65 internal];

          id v67 = [v66 playerID];
          uint64_t v68 = sub_100047E68();
          os_log_type_t v70 = v69;

          if (v64 == (void *)v68 && v63 == v70) {
            break;
          }
          char v72 = sub_100048328();
          swift_bridgeObjectRelease();
          if (v72) {
            goto LABEL_43;
          }
          swift_bridgeObjectRelease();
LABEL_35:
          v61 += 2;
          if (!--v59)
          {
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
        }
        swift_bridgeObjectRelease();
LABEL_43:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock = v62;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100046DF8(0, (int64_t)v62[2] + 1, 1);
          uint64_t v62 = aBlock;
        }
        unint64_t v75 = (unint64_t)v62[2];
        unint64_t v74 = (unint64_t)v62[3];
        if (v75 >= v74 >> 1)
        {
          sub_100046DF8(v74 > 1, v75 + 1, 1);
          uint64_t v62 = aBlock;
        }
        v62[2] = (void *)(v75 + 1);
        unint64_t v76 = &v62[2 * v75];
        v76[4] = v64;
        v76[5] = v63;
        goto LABEL_35;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }

LABEL_4:
  sub_100047738();
  Swift::String v15 = a4;
  Swift::String v16 = a3;
  uint64_t v17 = v15;
  Swift::String v18 = v16;
  uint64_t v19 = sub_100047758();
  os_log_type_t v20 = sub_100048008();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v87 = v10;
    uint64_t v22 = v21;
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 138412546;
    uint64_t v88 = v8;
    id v89 = v7;
    aBlock = (void **)&v18->isa;
    long long v24 = v18;
    sub_100048168();
    *uint64_t v23 = v18;

    *(_WORD *)(v22 + 12) = 2112;
    aBlock = v17;
    long long v25 = v17;
    unint64_t v7 = v89;
    sub_100048168();
    v23[1] = v17;

    uint64_t v8 = v88;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Could not find a valid player using playerModel: %@", (uint8_t *)v22, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v10 = v87;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v19 = v18;
  }

  (*(void (**)(char *, void *))(v8 + 8))(v10, v7);
  *((unsigned char *)&v18->isa + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
  sub_10000C728();
  uint64_t v26 = sub_10003F89C();
  if (v26)
  {
    id v27 = (id)v26;
    sub_10002DB48();
LABEL_9:
  }
}

void sub_1000088F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = swift_bridgeObjectRetain();
  unint64_t v5 = (unint64_t)sub_100010590(v4, (uint64_t)v3);
  swift_bridgeObjectRelease();

  if (!(v5 >> 62))
  {
    if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void **)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    id v14 = (id)Strong;
    if (!v10)
    {
      if (Strong)
      {
        sub_100047E68();
        NSString v12 = sub_100047E38();
        swift_bridgeObjectRelease();
        id v13 = [self playerFromPlayerID:v12];

        [v14 setPlayer:v13];
        id v7 = v14;
        id v15 = v13;
        goto LABEL_18;
      }
LABEL_27:
      __break(1u);
      return;
    }
    if (Strong)
    {
      id v7 = v10;
      goto LABEL_17;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1000482A8();
  swift_bridgeObjectRelease();
  if (v9 < 1) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v6 = swift_unknownObjectWeakLoadStrong();
  if (!v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v14 = (id)v6;
  if (!(v5 >> 62))
  {
    id v7 = *(id *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  id v7 = (id)sub_1000482A8();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_8:
    if ((v5 & 0xC000000000000001) != 0)
    {
      id v8 = (id)sub_100048208();
      goto LABEL_11;
    }
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v8 = *(id *)(v5 + 32);
LABEL_11:
      id v7 = v8;
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_25;
  }
LABEL_12:
  swift_bridgeObjectRelease();
LABEL_17:
  [v14 setPlayer:v7];
LABEL_18:
}

void sub_100008B18(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5 = a3;
  unint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = (unint64_t)sub_1000107D8(v6, v5);
  swift_bridgeObjectRelease();

  if (v7 >> 62) {
    uint64_t v8 = sub_1000482A8();
  }
  else {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 <= 0) {
    char v9 = 3;
  }
  else {
    char v9 = 4;
  }
  *(unsigned char *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = v9;
  sub_10000C728();
}

uint64_t sub_100008C30()
{
  uint64_t v1 = (void *)0xEA00000000006C61;
  uint64_t v2 = 0x7564697669646E69;
  int v3 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer);
  unint64_t v4 = (void *)sub_10003F89C();
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 activeConversation];

    if (v6)
    {
      id v7 = [v6 recipientAddresses];
      uint64_t v8 = sub_100047F58();

      unint64_t v9 = *(void *)(v8 + 16);
      swift_bridgeObjectRelease();

      if (v9 > 1)
      {
        uint64_t v2 = 0x70756F7267;
        uint64_t v1 = (void *)0xE500000000000000;
      }
    }
  }
  uint64_t v10 = 0x7265646E6573;
  if (v3) {
    uint64_t v10 = 0x6E65697069636572;
  }
  uint64_t v12 = v10;
  v13._countAndFlagsBits = 95;
  v13._object = (void *)0xE100000000000000;
  sub_100047EB8(v13);
  v14._countAndFlagsBits = v2;
  v14._object = v1;
  sub_100047EB8(v14);
  swift_bridgeObjectRelease();
  return v12;
}

void sub_100008D74()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (objc_class *)type metadata accessor for FriendRequestCardViewController();
  v81.receiver = v0;
  v81.super_class = v5;
  [super viewDidLoad];
  sub_100047738();
  id v6 = v0;
  id v7 = sub_100047758();
  os_log_type_t v8 = sub_100048008();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v79 = v1;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v78 = v2;
    uint64_t v10 = (uint8_t *)v9;
    char v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v80 = v6;
    uint64_t v12 = v6;
    sub_100048168();
    *char v11 = v6;

    uint64_t v1 = v79;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ viewDidLoad", v10, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v78;
    swift_slowDealloc();
  }
  else
  {

    id v7 = v6;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v13 = [self defaultCenter];
  NSString v14 = sub_100047E38();
  [v13 addObserver:v6 selector:"updateCard:" name:v14 object:0];

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_42;
  }
  Swift::String v16 = Strong;
  id v17 = [Strong layer];

  [v17 setCornerRadius:9.0];
  Swift::String v18 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v19 = v18;
  id v20 = [v18 layer];

  [v20 setMasksToBounds:1];
  uint64_t v21 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v21)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v22 = v21;
  id v23 = [v21 titleLabel];

  if (v23)
  {
    id v24 = [self _preferredFontForTextStyle:UIFontTextStyleSubheadline variant:1024];
    [v23 setFont:v24];
  }
  long long v25 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v25) {
    goto LABEL_44;
  }
  uint64_t v26 = v25;
  id v27 = [v25 titleLabel];

  [v27 setAdjustsFontSizeToFitWidth:1];
  id v28 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v28)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  unsigned int v29 = v28;
  id v30 = [v28 titleLabel];

  if (v30)
  {
    [v30 setMinimumScaleFactor:0.5];
  }
  long long v31 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v31) {
    goto LABEL_46;
  }
  long long v32 = v31;
  id v33 = [v31 layer];

  [v33 setCornerRadius:9.0];
  long long v34 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v34)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  id v35 = v34;
  id v36 = [v34 layer];

  [v36 setMasksToBounds:1];
  id v37 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v37)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  unsigned int v38 = v37;
  id v39 = [v37 titleLabel];

  if (v39)
  {
    id v40 = [self _preferredFontForTextStyle:UIFontTextStyleSubheadline variant:1024];
    [v39 setFont:v40];
  }
  uint64_t v41 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v41) {
    goto LABEL_49;
  }
  id v42 = v41;
  id v43 = [v41 titleLabel];

  if (v43)
  {
    id v44 = [self whiteColor];
    [v43 setTextColor:v44];
  }
  id v45 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v45) {
    goto LABEL_50;
  }
  uint64_t v46 = v45;
  id v47 = [v45 layer];

  [v47 setCornerRadius:9.0];
  os_log_type_t v48 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v48)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  int v49 = v48;
  id v50 = [v48 layer];

  [v50 setMasksToBounds:1];
  uint64_t v51 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v51)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  id v52 = v51;
  id v53 = [v51 titleLabel];

  if (v53)
  {
    id v54 = [self _preferredFontForTextStyle:UIFontTextStyleSubheadline variant:1024];
    [v53 setFont:v54];
  }
  uint64_t v55 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v55) {
    goto LABEL_53;
  }
  os_log_type_t v56 = v55;
  id v57 = [v55 titleLabel];

  [v57 setAdjustsFontSizeToFitWidth:1];
  uint64_t v58 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v58)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v59 = v58;
  id v60 = [v58 titleLabel];

  if (v60)
  {
    [v60 setMinimumScaleFactor:0.5];
  }
  v61 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v61) {
    goto LABEL_55;
  }
  uint64_t v62 = v61;
  [v61 setUserInteractionEnabled:1];

  id v63 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v6 action:"avatarPressed:"];
  uint64_t v64 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v64)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  id v65 = v64;
  [v64 addGestureRecognizer:v63];

  id v66 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v66)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  id v67 = v66;
  [v66 setUserInteractionEnabled:1];

  id v68 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v6 action:"friendAvatarPressed:"];
  long long v69 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v69)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  os_log_type_t v70 = v69;
  [v69 addGestureRecognizer:v68];

  uint64_t v71 = *(uint64_t *)((char *)&v6->isa
                   + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
  if (!v71)
  {
LABEL_59:
    __break(1u);
    return;
  }
  if (*(void *)(v71 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8)) {
    sub_1000072C8();
  }
  else {
    sub_1000097A4();
  }
  if (*((unsigned char *)&v6->isa
       + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer) == 1)
  {
    id v72 = [objc_allocWithZone((Class)GKReporter) init];
    [v72 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKFriendInviteViewedByReceiver];
  }
  id v73 = [objc_allocWithZone((Class)GKAPIReporter) init];
  sub_100008C30();
  NSString v74 = sub_100047E38();
  swift_bridgeObjectRelease();
  NSString v75 = sub_100047E38();
  NSString v76 = sub_100047E38();
  [v73 recordPageWithID:v74 pageContext:v75 pageType:v76];
}

void sub_1000097A4()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
  if (v5)
  {
    id v6 = v5;
    sub_100047738();
    id v7 = v0;
    os_log_type_t v8 = sub_100047758();
    os_log_type_t v9 = sub_100048008();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v28 = v1;
      uint64_t v10 = swift_slowAlloc();
      id v29 = v6;
      char v11 = (uint8_t *)v10;
      uint64_t v12 = (void *)swift_slowAlloc();
      uint64_t v27 = v2;
      *(_DWORD *)char v11 = 138412290;
      id v30 = v7;
      id v13 = v7;
      uint64_t v2 = v27;
      uint64_t v1 = v28;
      sub_100048168();
      *uint64_t v12 = v7;

      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ creating friend request", v11, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v6 = v29;
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v8 = v7;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v14 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    id v15 = [v7 traitCollection];
    id v16 = [v15 userInterfaceStyle];

    id v17 = self;
    Swift::String v18 = &selRef_tertiarySystemGroupedBackgroundColor;
    if (v16 != (id)2) {
      Swift::String v18 = &selRef_systemGray6Color;
    }
    id v19 = [v17 *v18];
    [v14 setBackgroundColor:v19];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 startAnimating];
    id v20 = [v7 view];
    if (v20)
    {
      uint64_t v21 = v20;
      [v20 addSubview:v14];

      uint64_t v22 = self;
      id v23 = v14;
      id v24 = [v7 view];
      [v22 _gkInstallEdgeConstraintsForView:v23 containedWithinParentView:v24];

      long long v25 = (unsigned __int8 *)v6;
      uint64_t v26 = v7;
      sub_10001BB04(v25, v23, v25, v26);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100009B4C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_100047768();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  uint64_t v44 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)v40 - v12;
  uint64_t v14 = sub_100004714(&qword_100060CE0);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100047518();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (char *)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a2 removeFromSuperview];
  if (a1)
  {
LABEL_4:
    sub_100047738();
    id v21 = a4;
    swift_errorRetain();
    id v22 = v21;
    swift_errorRetain();
    id v23 = sub_100047758();
    os_log_type_t v24 = sub_100048008();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v41 = v11;
      uint64_t v27 = (void *)v26;
      id v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = (uint64_t)v22;
      uint64_t v46 = v42;
      *(_DWORD *)uint64_t v25 = 138412546;
      id v28 = v22;
      sub_100048168();
      *uint64_t v27 = v22;

      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v45 = a1;
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v29 = sub_100048158();
      uint64_t v45 = sub_100046724(v29, v30, (uint64_t *)&v46);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ failed to create friend request with %s", (uint8_t *)v25, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(void *, uint64_t))(v44 + 8))(v41, v43);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v43);
    }
    *((unsigned char *)v22 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
    sub_10000C728();
    uint64_t v31 = sub_10003F89C();
    if (v31)
    {
      long long v32 = (void *)v31;
      sub_10002DB48();
    }
    return;
  }
  sub_1000147E0(1, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_100010A84((uint64_t)v16);
    goto LABEL_4;
  }
  uint64_t v33 = v18;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
  sub_100047738();
  long long v34 = a4;
  id v35 = sub_100047758();
  os_log_type_t v36 = sub_100048008();
  if (os_log_type_enabled(v35, v36))
  {
    id v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    id v42 = v37;
    *(_DWORD *)id v37 = 138412290;
    v40[1] = v37 + 4;
    uint64_t v46 = v34;
    unsigned int v38 = v34;
    sub_100048168();
    *uint64_t v41 = v34;

    uint64_t v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ friend request created", v42, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v35 = v34;
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v13, v43);
  id v39 = *(void (**)(char *))&v34[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl];
  if (v39)
  {
    swift_retain();
    v39(v20);
    sub_100010AE4((uint64_t)v39);
  }
  sub_1000072C8();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v17);
}

void sub_10000A13C()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (void *)sub_10003F89C();
  if (v5)
  {
    id v71 = v5;
    if (([self _gkIsOnline] & 1) == 0)
    {
      unint64_t v30 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v76._countAndFlagsBits = 0xD000000000000016;
      v66._countAndFlagsBits = 0xE000000000000000;
      v76._object = (void *)0x800000010004A320;
      v81.value._countAndFlagsBits = 0;
      v81.value._object = 0;
      v31.super.Class isa = v30;
      v86._countAndFlagsBits = 0;
      v86._object = (void *)0xE000000000000000;
      sub_100047498(v76, v81, v31, v86, v66);

      NSString v32 = sub_100047E38();
      swift_bridgeObjectRelease();
      uint64_t v33 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v77._countAndFlagsBits = 0xD000000000000018;
      v68._countAndFlagsBits = 0xE000000000000000;
      v77._object = (void *)0x800000010004A120;
      v82.value._countAndFlagsBits = 0;
      v82.value._object = 0;
      v34.super.Class isa = v33;
      v87._countAndFlagsBits = 0;
      v87._object = (void *)0xE000000000000000;
      sub_100047498(v77, v82, v34, v87, v68);

      NSString v35 = sub_100047E38();
      swift_bridgeObjectRelease();
      os_log_type_t v36 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v69._countAndFlagsBits = 0xE000000000000000;
      v78._countAndFlagsBits = 0x4F545455425F4B4FLL;
      v78._object = (void *)0xE90000000000004ELL;
      v83.value._countAndFlagsBits = 0;
      v83.value._object = 0;
      v37.super.Class isa = v36;
      v88._countAndFlagsBits = 0;
      v88._object = (void *)0xE000000000000000;
      sub_100047498(v78, v83, v37, v88, v69);

      NSString v38 = sub_100047E38();
      swift_bridgeObjectRelease();
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001479C;
      aBlock[3] = &unk_100059DC0;
      id v39 = _Block_copy(aBlock);
      [v71 _presentAlertWithTitle:v32 message:v35 buttonTitle:v38 completion:v39];
      _Block_release(v39);

      id v40 = [objc_allocWithZone((Class)GKAPIReporter) init];
      NSString v41 = sub_100047E38();
      NSString v42 = sub_100047E38();
      NSString v43 = sub_100047E38();
      sub_100008C30();
      NSString v44 = sub_100047E38();
      swift_bridgeObjectRelease();
      NSString v45 = sub_100047E38();
      [v40 recordClickWithAction:v41 targetId:v42 targetType:v43 pageId:v44 pageType:v45];

      return;
    }
    id v6 = [self shared];
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned __int8 v8 = [v6 isAddingFriendsRestricted];

      if (v8)
      {
        id v9 = [objc_allocWithZone((Class)GKReporter) init];
        [v9 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestRestrictedError];

        id v10 = [objc_allocWithZone((Class)GKAPIReporter) init];
        NSString v11 = sub_100047E38();
        NSString v12 = sub_100047E38();
        NSString v13 = sub_100047E38();
        sub_100008C30();
        NSString v14 = sub_100047E38();
        swift_bridgeObjectRelease();
        NSString v15 = sub_100047E38();
        [v10 recordClickWithAction:v11 targetId:v12 targetType:v13 pageId:v14 pageType:v15];

        id v16 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v66._countAndFlagsBits = 0xE000000000000000;
        v74._countAndFlagsBits = 0x525F444E45495246;
        v74._object = (void *)0xEE00545345555145;
        v79.value._countAndFlagsBits = 0;
        v79.value._object = 0;
        v17.super.Class isa = v16;
        v84._countAndFlagsBits = 0;
        v84._object = (void *)0xE000000000000000;
        uint64_t v18 = sub_100047498(v74, v79, v17, v84, v66);
        uint64_t v20 = v19;

        id v21 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v75._countAndFlagsBits = 0xD000000000000027;
        v67._countAndFlagsBits = 0xE000000000000000;
        v75._object = (void *)0x800000010004A360;
        v80.value._countAndFlagsBits = 0;
        v80.value._object = 0;
        v22.super.Class isa = v21;
        v85._countAndFlagsBits = 0;
        v85._object = (void *)0xE000000000000000;
        uint64_t v23 = sub_100047498(v75, v80, v22, v85, v67);
        uint64_t v25 = v24;

        sub_100034E98(v18, v20, v23, v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v26 = v71;

        return;
      }
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (!Strong) {
        goto LABEL_27;
      }
      id v47 = Strong;
      [Strong setEnabled:0];

      uint64_t v48 = swift_unknownObjectWeakLoadStrong();
      if (!v48)
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      int v49 = (void *)v48;
      id v50 = [self systemGray2Color];
      [v49 setBackgroundColor:v50];

      id v51 = [v71 activeConversation];
      id v52 = v51;
      if (v51)
      {
        id v53 = [v51 recipientAddresses];
        uint64_t v54 = sub_100047F58();

        uint64_t v55 = *(void *)(v54 + 16);
        swift_bridgeObjectRelease();
        if (v55)
        {
          id v56 = [v52 recipientAddresses];
          id v57 = (void *)sub_100047F58();

          if (v57[2])
          {
            uint64_t v58 = v57[4];
            uint64_t v55 = v57[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            id v59 = [v52 recipientAddresses];
            uint64_t v60 = sub_100047F58();

            id v52 = *(void **)(v60 + 16);
            swift_bridgeObjectRelease();
            LODWORD(v52) = (unint64_t)v52 > 1;
            goto LABEL_21;
          }
          __break(1u);
          goto LABEL_26;
        }

        uint64_t v58 = 0;
        LODWORD(v52) = 0;
      }
      else
      {
        uint64_t v58 = 0;
        uint64_t v55 = 0;
      }
LABEL_21:
      v61 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
      if (v61)
      {
        uint64_t v62 = swift_allocObject();
        *(void *)(v62 + 16) = v0;
        *(void *)(v62 + 24) = v71;
        id v63 = v61;
        uint64_t v64 = v0;
        id v65 = v71;
        sub_100014B5C(v58, v55, (int)v52, sub_1000104DC, v62);

        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
LABEL_29:
      swift_bridgeObjectRelease();
      __break(1u);
      return;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  sub_100047728();
  uint64_t v27 = sub_100047758();
  os_log_type_t v28 = sub_100048028();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "acceptButtonPressed - expected a messagesViewController", v29, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_10000AA50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  NSString v12 = (char *)&v64 - v11;
  if (a1)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      NSString v14 = Strong;
      [Strong setEnabled:1];

      uint64_t v15 = swift_unknownObjectWeakLoadStrong();
      if (v15)
      {
        id v16 = (void *)v15;
        NSBundle v17 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v17)
        {
          uint64_t v18 = v17;
          id v19 = [v17 tintColor];

          [v16 setBackgroundColor:v19];
          id v20 = [objc_allocWithZone((Class)GKReporter) init];
          [v20 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestExpiredError];

          id v21 = [objc_allocWithZone((Class)GKAPIReporter) init];
          NSString v22 = sub_100047E38();
          NSString v23 = sub_100047E38();
          NSString v24 = sub_100047E38();
          sub_100008C30();
          NSString v25 = sub_100047E38();
          swift_bridgeObjectRelease();
          NSString v26 = sub_100047E38();
          [v21 recordClickWithAction:v22 targetId:v23 targetType:v24 pageId:v25 pageType:v26];

          sub_100047728();
          swift_errorRetain();
          swift_errorRetain();
          uint64_t v27 = sub_100047758();
          os_log_type_t v28 = sub_100048028();
          if (os_log_type_enabled(v27, v28))
          {
            uint64_t v29 = (uint8_t *)swift_slowAlloc();
            uint64_t v30 = swift_slowAlloc();
            uint64_t v67 = a1;
            aBlock[0] = v30;
            *(_DWORD *)uint64_t v29 = 136315138;
            swift_errorRetain();
            sub_100004714((uint64_t *)&unk_1000611C0);
            uint64_t v31 = sub_100047E88();
            uint64_t v66 = v6;
            uint64_t v67 = sub_100046724(v31, v32, aBlock);
            sub_100048168();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "acceptButtonPressed - acceptFriendRequest error: %s", v29, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v66);
          }
          else
          {
            swift_errorRelease();
            swift_errorRelease();

            (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
          }
          uint64_t v46 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
          v62._countAndFlagsBits = 0xE000000000000000;
          v69._countAndFlagsBits = 0x525F444E45495246;
          v69._object = (void *)0xEE00545345555145;
          v71.value._countAndFlagsBits = 0;
          v71.value._object = 0;
          v47.super.Class isa = v46;
          v73._countAndFlagsBits = 0;
          v73._object = (void *)0xE000000000000000;
          uint64_t v48 = sub_100047498(v69, v71, v47, v73, v62);
          uint64_t v50 = v49;

          id v51 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
          v70._countAndFlagsBits = 0xD000000000000024;
          v63._countAndFlagsBits = 0xE000000000000000;
          v70._object = (void *)0x800000010004A170;
          v72.value._countAndFlagsBits = 0;
          v72.value._object = 0;
          v52.super.Class isa = v51;
          v74._countAndFlagsBits = 0;
          v74._object = (void *)0xE000000000000000;
          uint64_t v53 = sub_100047498(v70, v72, v52, v74, v63);
          uint64_t v55 = v54;

          sub_100034E98(v48, v50, v53, v55);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return;
        }
LABEL_16:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v64 = a3;
  uint64_t v65 = v7;
  uint64_t v66 = v6;
  id v33 = [objc_allocWithZone((Class)GKReporter) init];
  [v33 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestAccepted];

  id v34 = [objc_allocWithZone((Class)GKAPIReporter) init];
  NSString v35 = sub_100047E38();
  NSString v36 = sub_100047E38();
  NSString v37 = sub_100047E38();
  sub_100008C30();
  NSString v38 = sub_100047E38();
  swift_bridgeObjectRelease();
  NSString v39 = sub_100047E38();
  [v34 recordClickWithAction:v35 targetId:v36 targetType:v37 pageId:v38 pageType:v39];

  sub_100047738();
  id v40 = a2;
  NSString v41 = sub_100047758();
  os_log_type_t v42 = sub_100048008();
  if (os_log_type_enabled(v41, v42))
  {
    NSString v43 = (uint8_t *)swift_slowAlloc();
    NSString v44 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v43 = 138412290;
    aBlock[0] = (uint64_t)v40;
    NSString v45 = v40;
    sub_100048168();
    *NSString v44 = v40;

    _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ acceptButtonPressed - acceptFriendRequest succeed", v43, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    NSString v41 = v40;
  }

  (*(void (**)(char *, uint64_t))(v65 + 8))(v12, v66);
  id v56 = [self local];
  uint64_t v57 = swift_allocObject();
  uint64_t v58 = v64;
  *(void *)(v57 + 16) = v64;
  *(void *)(v57 + 24) = v40;
  aBlock[4] = (uint64_t)sub_1000104E4;
  aBlock[5] = v57;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100040234;
  aBlock[3] = (uint64_t)&unk_100059E38;
  id v59 = _Block_copy(aBlock);
  uint64_t v60 = v40;
  id v61 = v58;
  swift_release();
  [v56 loadFriendsAsPlayersWithCompletionHandler:v59];
  _Block_release(v59);
}

void sub_10000B278(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = sub_100047D48();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100047D68();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  NSString v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [a3 activeConversation];
  if (!v14) {
    goto LABEL_7;
  }
  id v24 = v14;
  id v15 = [v14 recipientAddresses];
  uint64_t v16 = sub_100047F58();

  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  if (v17 != 1)
  {

LABEL_7:
    sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
    id v19 = (void *)sub_100048098();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a4;
    aBlock[4] = sub_100011450;
    aBlock[5] = v20;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001479C;
    aBlock[3] = &unk_100059E88;
    id v21 = _Block_copy(aBlock);
    id v22 = a4;
    swift_release();
    sub_100047D58();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000104EC((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004714((uint64_t *)&unk_100060CD0);
    sub_100010534();
    sub_1000481A8();
    sub_1000480A8();
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return;
  }
  sub_10002DD54();
  id v18 = v24;
}

void sub_10000B620()
{
  if ([self _gkIsOnline])
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v2 = Strong;
    [Strong setEnabled:0];

    uint64_t v3 = swift_unknownObjectWeakLoadStrong();
    if (!v3)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    unint64_t v4 = (void *)v3;
    id v5 = [self systemGray2Color];
    [v4 setBackgroundColor:v5];

    uint64_t v6 = (void *)sub_10003F89C();
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 activeConversation];

      if (!v8)
      {
        uint64_t v13 = 0;
        uint64_t v7 = 0;
        goto LABEL_15;
      }
      id v9 = [v8 recipientAddresses];
      uint64_t v10 = sub_100047F58();

      uint64_t v7 = *(void **)(v10 + 16);
      swift_bridgeObjectRelease();
      if (v7)
      {
        id v11 = [v8 recipientAddresses];
        uint64_t v12 = (void *)sub_100047F58();

        if (v12[2])
        {
          uint64_t v13 = v12[4];
          uint64_t v7 = (void *)v12[5];
          swift_bridgeObjectRetain();

          swift_bridgeObjectRelease();
          goto LABEL_15;
        }
        __break(1u);
        goto LABEL_20;
      }
    }
    uint64_t v13 = 0;
LABEL_15:
    unint64_t v32 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
    if (v32)
    {
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = v0;
      id v34 = v32;
      NSString v35 = v0;
      sub_1000151CC(v13, (uint64_t)v7, (void (*)(void))sub_100010494, v33);

      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    __break(1u);
    return;
  }
  uint64_t v14 = sub_10003F89C();
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v41._countAndFlagsBits = 0xD000000000000016;
    v36._countAndFlagsBits = 0xE000000000000000;
    v41._object = (void *)0x800000010004A320;
    v44.value._countAndFlagsBits = 0;
    v44.value._object = 0;
    v17.super.Class isa = v16;
    v47._countAndFlagsBits = 0;
    v47._object = (void *)0xE000000000000000;
    sub_100047498(v41, v44, v17, v47, v36);

    NSString v18 = sub_100047E38();
    swift_bridgeObjectRelease();
    id v19 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v42._countAndFlagsBits = 0xD000000000000018;
    v37._countAndFlagsBits = 0xE000000000000000;
    v42._object = (void *)0x800000010004A120;
    v45.value._countAndFlagsBits = 0;
    v45.value._object = 0;
    v20.super.Class isa = v19;
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    sub_100047498(v42, v45, v20, v48, v37);

    NSString v21 = sub_100047E38();
    swift_bridgeObjectRelease();
    id v22 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v38._countAndFlagsBits = 0xE000000000000000;
    v43._countAndFlagsBits = 0x4F545455425F4B4FLL;
    v43._object = (void *)0xE90000000000004ELL;
    v46.value._countAndFlagsBits = 0;
    v46.value._object = 0;
    v23.super.Class isa = v22;
    v49._countAndFlagsBits = 0;
    v49._object = (void *)0xE000000000000000;
    sub_100047498(v43, v46, v23, v49, v38);

    NSString v24 = sub_100047E38();
    swift_bridgeObjectRelease();
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001479C;
    aBlock[3] = &unk_100059D70;
    NSString v25 = _Block_copy(aBlock);
    [v15 _presentAlertWithTitle:v18 message:v21 buttonTitle:v24 completion:v25];
    _Block_release(v25);

    id v26 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v27 = sub_100047E38();
    NSString v28 = sub_100047E38();
    NSString v29 = sub_100047E38();
    sub_100008C30();
    NSString v30 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v31 = sub_100047E38();
    [v26 recordClickWithAction:v27 targetId:v28 targetType:v29 pageId:v30 pageType:v31];
  }
}

void *sub_10000BB50(uint64_t a1, void *a2)
{
  uint64_t v58 = sub_100047768();
  uint64_t v4 = *(void *)(v58 - 8);
  uint64_t v5 = __chkstk_darwin(v58);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v56 - v8;
  uint64_t v59 = v4;
  if (a1)
  {
    id result = (void *)swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      id v11 = result;
      [result setEnabled:1];

      id result = (void *)swift_unknownObjectWeakLoadStrong();
      if (result)
      {
        uint64_t v12 = result;
        id result = (void *)swift_unknownObjectWeakLoadStrong();
        if (result)
        {
          uint64_t v13 = result;
          id v14 = [result tintColor];

          [v12 setBackgroundColor:v14];
          id v15 = [objc_allocWithZone((Class)GKReporter) init];
          [v15 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestExpiredError];

          id v16 = [objc_allocWithZone((Class)GKAPIReporter) init];
          NSString v17 = sub_100047E38();
          NSString v18 = sub_100047E38();
          NSString v19 = sub_100047E38();
          sub_100008C30();
          NSString v20 = sub_100047E38();
          swift_bridgeObjectRelease();
          NSString v21 = sub_100047E38();
          [v16 recordClickWithAction:v17 targetId:v18 targetType:v19 pageId:v20 pageType:v21];

          sub_100047728();
          id v22 = a2;
          swift_errorRetain();
          id v23 = v22;
          swift_errorRetain();
          NSString v24 = sub_100047758();
          os_log_type_t v25 = sub_100048028();
          if (os_log_type_enabled(v24, v25))
          {
            uint64_t v26 = swift_slowAlloc();
            NSString v27 = (void *)swift_slowAlloc();
            uint64_t v56 = swift_slowAlloc();
            uint64_t v60 = (uint64_t)v23;
            id v61 = v56;
            *(_DWORD *)uint64_t v26 = 138412546;
            uint64_t v57 = v7;
            id v28 = v23;
            sub_100048168();
            *NSString v27 = v23;

            *(_WORD *)(v26 + 12) = 2080;
            uint64_t v60 = a1;
            swift_errorRetain();
            sub_100004714((uint64_t *)&unk_1000611C0);
            uint64_t v29 = sub_100047E88();
            uint64_t v60 = sub_100046724(v29, v30, (uint64_t *)&v61);
            sub_100048168();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ ignoreButtonPressed - ignoreFriendRequest error: %s", (uint8_t *)v26, 0x16u);
            sub_100004714((uint64_t *)&unk_100060CB0);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v59 + 8))(v57, v58);
          }
          else
          {

            swift_errorRelease();
            swift_errorRelease();

            (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v58);
          }
          Swift::String_optional v44 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
          v54._countAndFlagsBits = 0xE000000000000000;
          v62._countAndFlagsBits = 0x525F444E45495246;
          v62._object = (void *)0xEE00545345555145;
          v64.value._countAndFlagsBits = 0;
          v64.value._object = 0;
          v45.super.Class isa = v44;
          v66._countAndFlagsBits = 0;
          v66._object = (void *)0xE000000000000000;
          uint64_t v46 = sub_100047498(v62, v64, v45, v66, v54);
          uint64_t v48 = v47;

          Swift::String v49 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
          v63._countAndFlagsBits = 0xD000000000000024;
          v55._countAndFlagsBits = 0xE000000000000000;
          v63._object = (void *)0x800000010004A170;
          v65.value._countAndFlagsBits = 0;
          v65.value._object = 0;
          v50.super.Class isa = v49;
          v67._countAndFlagsBits = 0;
          v67._object = (void *)0xE000000000000000;
          uint64_t v51 = sub_100047498(v63, v65, v50, v67, v55);
          uint64_t v53 = v52;

          sub_100034E98(v46, v48, v51, v53);
          swift_bridgeObjectRelease();
          return (void *)swift_bridgeObjectRelease();
        }
LABEL_16:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  id v31 = [objc_allocWithZone((Class)GKReporter) init];
  [v31 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestAccepted];

  id v32 = [objc_allocWithZone((Class)GKAPIReporter) init];
  NSString v33 = sub_100047E38();
  NSString v34 = sub_100047E38();
  NSString v35 = sub_100047E38();
  sub_100008C30();
  NSString v36 = sub_100047E38();
  swift_bridgeObjectRelease();
  NSString v37 = sub_100047E38();
  [v32 recordClickWithAction:v33 targetId:v34 targetType:v35 pageId:v36 pageType:v37];

  sub_100047738();
  Swift::String v38 = a2;
  NSString v39 = sub_100047758();
  os_log_type_t v40 = sub_100048008();
  if (os_log_type_enabled(v39, v40))
  {
    Swift::String v41 = (uint8_t *)swift_slowAlloc();
    Swift::String v42 = (void *)swift_slowAlloc();
    *(_DWORD *)Swift::String v41 = 138412290;
    id v61 = v38;
    Swift::String v43 = v38;
    sub_100048168();
    *Swift::String v42 = v38;

    _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ ignoreButtonPressed - ignoreFriendRequest succeed", v41, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    NSString v39 = v38;
  }

  return (void *)(*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v9, v58);
}

void sub_10000C560()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v1 = (void *)Strong;
  uint64_t v2 = self;
  if (qword_100060730 != -1) {
    swift_once();
  }
  id v3 = [v2 _gkPreferredFontForTextStyle:qword_100064210 symbolicTraits:2];
  [v1 setFont:v3];

  uint64_t v4 = swift_unknownObjectWeakLoadStrong();
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)v4;
  if (qword_100060738 != -1) {
    swift_once();
  }
  id v6 = [v2 _gkPreferredFontForTextStyle:qword_100064218 symbolicTraits:2];
  [v5 setFont:v6];

  uint64_t v7 = swift_unknownObjectWeakLoadStrong();
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [v2 _gkPreferredFontForTextStyle:qword_100064218 symbolicTraits:2];
  [v8 setFont:v9];
}

void sub_10000C728()
{
  sub_10000D744();
  sub_10000CF74();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender);
  if (v1 && (id v2 = [v1 displayNameWithOptions:0]) != 0)
  {
    id v3 = v2;
    uint64_t v4 = sub_100047E68();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  sub_10000E740(v4, v6);
  swift_bridgeObjectRelease();
  sub_10000DAB8();
  char v7 = *(unsigned char *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState);
  char v8 = 1;
  if (((1 << v7) & 0x78) == 0)
  {
    if (((1 << v7) & 7) == 0) {
      goto LABEL_9;
    }
    char v8 = 0;
  }
  *(unsigned char *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer) = v8;
LABEL_9:

  sub_10000C800();
}

void sub_10000C800()
{
  uint64_t v1 = v0;
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_58;
  }
  id v3 = v2;
  [v2 setNeedsLayout];

  id v4 = [v1 view];
  if (!v4)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v5 = v4;
  [v4 layoutIfNeeded];

  uint64_t v6 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant;
  char v7 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant];
  if (!v7)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  [v7 constant];
  double v9 = v8;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  id v11 = Strong;
  [Strong frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v115.origin.x = v13;
  v115.origin.y = v15;
  v115.size.width = v17;
  v115.size.height = v19;
  double Height = CGRectGetHeight(v115);
  uint64_t v21 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView;
  id v22 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView];
  if (!v22)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  double v23 = Height;
  [v22 spacing];
  double v25 = v24;
  uint64_t v26 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v26)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  NSString v27 = v26;
  double v28 = v9 + 0.0 + v23 + v25;
  unsigned __int8 v29 = [v26 isHidden];

  if ((v29 & 1) == 0)
  {
    uint64_t v30 = swift_unknownObjectWeakLoadStrong();
    if (!v30)
    {
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    id v31 = (void *)v30;
    double v32 = UILabel.requiredHeight.getter();

    double v28 = v28 + v32;
  }
  NSString v33 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v33) {
    goto LABEL_63;
  }
  NSString v34 = v33;
  unsigned __int8 v35 = [v33 isHidden];

  if ((v35 & 1) == 0)
  {
    uint64_t v36 = swift_unknownObjectWeakLoadStrong();
    if (!v36)
    {
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    NSString v37 = (void *)v36;
    double v38 = UILabel.requiredHeight.getter();

    double v28 = v28 + v38;
  }
  NSString v39 = *(void **)&v1[v21];
  if (!v39) {
    goto LABEL_64;
  }
  [v39 spacing];
  double v41 = v40;
  Swift::String v42 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v42)
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  Swift::String v43 = v42;
  double v44 = v28 + v41;
  unsigned __int8 v45 = [v42 isHidden];

  if ((v45 & 1) == 0)
  {
    uint64_t v46 = swift_unknownObjectWeakLoadStrong();
    if (!v46)
    {
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    uint64_t v47 = (void *)v46;
    double v48 = UILabel.requiredHeight.getter();

    double v44 = v44 + v48;
  }
  Swift::String v49 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v49) {
    goto LABEL_66;
  }
  NSBundle v50 = v49;
  unsigned __int8 v51 = [v49 isHidden];

  if ((v51 & 1) == 0)
  {
    uint64_t v52 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v52)
    {
LABEL_79:
      __break(1u);
      goto LABEL_80;
    }
    uint64_t v53 = v52;
    [v52 frame];
    double v55 = v54;

    double v44 = v44 + v55;
  }
  uint64_t v56 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v56) {
    goto LABEL_67;
  }
  uint64_t v57 = v56;
  unsigned __int8 v58 = [v56 isHidden];

  if ((v58 & 1) == 0)
  {
    uint64_t v59 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v59)
    {
LABEL_80:
      __break(1u);
      goto LABEL_81;
    }
    uint64_t v60 = v59;
    [v59 frame];
    double v62 = v61;

    double v44 = v44 + v62;
  }
  Swift::String v63 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v63) {
    goto LABEL_68;
  }
  Swift::String_optional v64 = v63;
  unsigned __int8 v65 = [v63 isHidden];

  if ((v65 & 1) == 0)
  {
    Swift::String v66 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v66)
    {
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    Swift::String v67 = v66;
    [v66 frame];
    double v69 = v68;

    double v44 = v44 + v69;
  }
  Swift::String v70 = *(void **)&v1[v21];
  if (!v70) {
    goto LABEL_69;
  }
  [v70 spacing];
  double v72 = v71;
  Swift::String v73 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v73)
  {
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  Swift::String v74 = v73;
  double v75 = v44 + v72;
  unsigned __int8 v76 = [v73 isHidden];

  if ((v76 & 1) == 0)
  {
    Swift::String v77 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v77)
    {
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    Swift::String v78 = v77;
    [v77 frame];
    double v80 = v79;

    double v75 = v75 + v80;
  }
  Swift::String_optional v81 = *(void **)&v1[v21];
  if (!v81) {
    goto LABEL_71;
  }
  [v81 spacing];
  double v83 = v82;
  Swift::String v84 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v84)
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  Swift::String v85 = v84;
  double v86 = v75 + v83;
  unsigned __int8 v87 = [v84 isHidden];

  if ((v87 & 1) == 0)
  {
    Swift::String v88 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v88)
    {
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    id v89 = v88;
    [v88 frame];
    double v91 = v90;

    double v86 = v86 + v91;
  }
  v92 = *(void **)&v1[v6];
  if (!v92) {
    goto LABEL_73;
  }
  [v92 constant];
  double v94 = v93;
  uint64_t v95 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v95)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  char v96 = v95;
  double v97 = v86 + v94;
  unsigned __int8 v98 = [v95 isHidden];

  if ((v98 & 1) == 0)
  {
    uint64_t v99 = swift_unknownObjectWeakLoadStrong();
    if (!v99)
    {
LABEL_84:
      __break(1u);
      goto LABEL_85;
    }
    long long v100 = (void *)v99;
    double v101 = UILabel.requiredHeight.getter();

    double v97 = v97 + v101;
  }
  long long v102 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v102) {
    goto LABEL_75;
  }
  long long v103 = v102;
  unsigned __int8 v104 = [v102 isHidden];

  if (v104) {
    goto LABEL_50;
  }
  uint64_t v105 = swift_unknownObjectWeakLoadStrong();
  if (!v105)
  {
LABEL_85:
    __break(1u);
    return;
  }
  long long v106 = (void *)v105;
  double v107 = UILabel.requiredHeight.getter();

  double v97 = v97 + v107;
LABEL_50:
  uint64_t v108 = sub_10003F89C();
  if (v108)
  {
    double v109 = fmax(v97, 220.0);
    long long v113 = (char *)v108;
    sub_10002E19C();
    long long v110 = v113;
    long long v111 = (double *)&v113[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
    *long long v111 = v109;
    *((unsigned char *)v111 + 8) = 0;
    if (v112 != v109)
    {
      [v113 requestResize];
      long long v110 = v113;
    }
  }
}

double UILabel.requiredHeight.getter()
{
  [v0 frame];
  id v1 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, CGRectGetWidth(v7), 1.79769313e308];
  [v1 setNumberOfLines:[v0 numberOfLines]];
  [v1 setLineBreakMode:0];
  id v2 = [v0 font];
  [v1 setFont:v2];

  id v3 = [v0 text];
  [v1 setText:v3];

  id v4 = [v0 attributedText];
  [v1 setAttributedText:v4];

  [v1 sizeToFit];
  [v1 frame];
  double Height = CGRectGetHeight(v8);

  return Height;
}

void sub_10000CF74()
{
  if ((v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] & 1) == 0)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

    if (Strong)
    {
      id v2 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v2)
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        __break(1u);
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
        JUMPOUT(0x10000D720);
      }
      id v3 = v2;
      [v2 setHidden:1];
    }
  }
  id v4 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v4)
  {
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v5 = v4;
  [v4 setHidden:0];

  switch(v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState])
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_14;
    case 3:
      goto LABEL_18;
    case 4:
      double v28 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v28) {
        goto LABEL_64;
      }
      unsigned __int8 v29 = v28;
      [v28 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8) {
        goto LABEL_53;
      }
      __break(1u);
LABEL_28:
      uint64_t v30 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v30) {
        goto LABEL_65;
      }
      id v31 = v30;
      [v30 setHidden:1];

      double v32 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v32) {
        goto LABEL_73;
      }
      NSString v33 = v32;
      [v32 setHidden:1];

      NSString v34 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v34) {
        goto LABEL_74;
      }
      unsigned __int8 v35 = v34;
      [v34 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8) {
        goto LABEL_53;
      }
      __break(1u);
LABEL_33:
      id v36 = [v0 traitCollection];
      id v37 = [v36 preferredContentSizeCategory];

      LOBYTE(v36) = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();
      if (v36) {
        goto LABEL_36;
      }
      double v38 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v38) {
        goto LABEL_89;
      }
      NSString v39 = v38;
      [v38 setHidden:0];

LABEL_36:
      double v40 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v40) {
        goto LABEL_75;
      }
      double v41 = v40;
      [v40 setHidden:0];

      Swift::String v42 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v42) {
        goto LABEL_76;
      }
      Swift::String v43 = v42;
      [v42 setHidden:1];

      double v44 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v44) {
        goto LABEL_77;
      }
      unsigned __int8 v45 = v44;
      [v44 setHidden:1];

      uint64_t v46 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v46) {
        goto LABEL_78;
      }
      uint64_t v47 = v46;
      [v46 setHidden:0];

      double v48 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v48) {
        goto LABEL_79;
      }
      Swift::String v49 = v48;
      [v48 setEnabled:0];

      uint64_t v50 = swift_unknownObjectWeakLoadStrong();
      if (!v50) {
        goto LABEL_80;
      }
      unsigned __int8 v51 = (void *)v50;
      id v52 = [self quaternaryLabelColor];
      [v51 setBackgroundColor:v52];

      uint64_t v53 = swift_unknownObjectWeakLoadStrong();
      if (!v53) {
        goto LABEL_81;
      }
      double v54 = (void *)v53;
      double v55 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v70._countAndFlagsBits = 0xE000000000000000;
      v56._object = (void *)0x8000000100049590;
      v56._countAndFlagsBits = 0xD00000000000001ELL;
LABEL_50:
      v73.value._countAndFlagsBits = 0;
      v73.value._object = 0;
      v67.super.Class isa = v55;
      v74._countAndFlagsBits = 0;
      v74._object = (void *)0xE000000000000000;
      sub_100047498(v56, v73, v67, v74, v70);

      NSString v71 = sub_100047E38();
      swift_bridgeObjectRelease();
      [v54 setTitle:v71 forState:2];

      goto LABEL_55;
    case 5:
      goto LABEL_33;
    case 6:
      uint64_t v57 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v57) {
        goto LABEL_82;
      }
      unsigned __int8 v58 = v57;
      [v57 setHidden:1];

      uint64_t v59 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v59) {
        goto LABEL_83;
      }
      uint64_t v60 = v59;
      [v59 setHidden:0];

      double v61 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v61) {
        goto LABEL_84;
      }
      double v62 = v61;
      [v61 setEnabled:0];

      uint64_t v63 = swift_unknownObjectWeakLoadStrong();
      if (!v63) {
        goto LABEL_85;
      }
      Swift::String_optional v64 = (void *)v63;
      id v65 = [self quaternaryLabelColor];
      [v64 setBackgroundColor:v65];

      uint64_t v66 = swift_unknownObjectWeakLoadStrong();
      if (!v66) {
        goto LABEL_86;
      }
      double v54 = (void *)v66;
      double v55 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v56._countAndFlagsBits = 0xD000000000000022;
      v70._countAndFlagsBits = 0xE000000000000000;
      v56._object = (void *)0x8000000100049560;
      goto LABEL_50;
    case 7:
      goto LABEL_28;
    case 8:
      double v68 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v68) {
        goto LABEL_87;
      }
      double v69 = v68;
      [v68 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8) {
        goto LABEL_53;
      }
      goto LABEL_88;
    default:
      uint64_t v6 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v6) {
        goto LABEL_60;
      }
      CGRect v7 = v6;
      [v6 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8) {
        goto LABEL_53;
      }
      __break(1u);
LABEL_10:
      double v9 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v9) {
        goto LABEL_61;
      }
      uint64_t v10 = v9;
      [v9 setHidden:0];

      id v11 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v11) {
        goto LABEL_66;
      }
      double v12 = v11;
      [v11 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8) {
        goto LABEL_53;
      }
      __break(1u);
LABEL_14:
      CGFloat v13 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v13) {
        goto LABEL_62;
      }
      double v14 = v13;
      [v13 setHidden:0];

      CGFloat v15 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v15) {
        goto LABEL_67;
      }
      double v16 = v15;
      [v15 setHidden:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v8)
      {
LABEL_53:
        NSString v27 = "setHidden:";
        goto LABEL_54;
      }
      __break(1u);
LABEL_18:
      CGFloat v17 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v17) {
        goto LABEL_63;
      }
      double v18 = v17;
      [v17 setHidden:0];

      CGFloat v19 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v19) {
        goto LABEL_68;
      }
      NSString v20 = v19;
      [v19 setHidden:1];

      uint64_t v21 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v21) {
        goto LABEL_69;
      }
      id v22 = v21;
      [v21 setHidden:0];

      double v23 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v23) {
        goto LABEL_70;
      }
      double v24 = v23;
      [v23 setHidden:0];

      double v25 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v25) {
        goto LABEL_71;
      }
      uint64_t v26 = v25;
      [v25 setEnabled:1];

      CGRect v8 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v8) {
        goto LABEL_72;
      }
      NSString v27 = "setEnabled:";
LABEL_54:
      NSString v71 = v8;
      [v8 v27:1];
LABEL_55:

      return;
  }
}

void sub_10000D744()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_27;
  }
  id v2 = Strong;
  [Strong setHidden:1];

  id v3 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v3)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v4 = v3;
  [v3 setHidden:1];

  uint64_t v5 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v5)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v6 = v5;
  [v5 setHidden:1];

  CGRect v7 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v7) {
    goto LABEL_29;
  }
  CGRect v8 = v7;
  [v7 setHidden:1];

  switch(*(unsigned char *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState))
  {
    case 1:
    case 2:
      uint64_t v10 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v10) {
        goto LABEL_31;
      }
      id v11 = v10;
      [v10 setHidden:0];

      double v12 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v12) {
        goto LABEL_32;
      }
      CGFloat v13 = v12;
      [v12 setHidden:1];

      double v14 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v14) {
        goto LABEL_33;
      }
      NSString v28 = v14;
      [v14 setHidden:0];
      goto LABEL_12;
    case 3:
    case 4:
    case 5:
    case 6:
      double v9 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v9) {
        goto LABEL_7;
      }
      goto LABEL_30;
    case 7:
      CGFloat v15 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v15) {
        goto LABEL_34;
      }
      double v16 = v15;
      [v15 setHidden:1];

      CGFloat v17 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v17) {
        goto LABEL_35;
      }
      double v18 = v17;
      [v17 setHidden:1];

      CGFloat v19 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v19) {
        goto LABEL_38;
      }
      NSString v20 = v19;
      [v19 setHidden:0];

      sub_10000EE14();
      return;
    case 8:
      goto LABEL_23;
    default:
      double v9 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v9)
      {
        __break(1u);
LABEL_23:
        uint64_t v21 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v21)
        {
          id v22 = v21;
          [v21 setHidden:0];

          uint64_t v23 = swift_unknownObjectWeakLoadStrong();
          if (v23)
          {
            double v24 = (void *)v23;
            double v25 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
            v27._countAndFlagsBits = 0xE000000000000000;
            v30._object = (void *)0x8000000100049530;
            v30._countAndFlagsBits = 0xD000000000000027;
            v31.value._countAndFlagsBits = 0;
            v31.value._object = 0;
            v26.super.Class isa = v25;
            v32._countAndFlagsBits = 0;
            v32._object = (void *)0xE000000000000000;
            sub_100047498(v30, v31, v26, v32, v27);

            NSString v28 = sub_100047E38();
            swift_bridgeObjectRelease();
            [v24 setText:v28];

            goto LABEL_12;
          }
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          JUMPOUT(0x10000DA94);
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_7:
      NSString v28 = v9;
      [v9 setHidden:1];
LABEL_12:

      return;
  }
}

void sub_10000DAB8()
{
  switch(*(unsigned char *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState))
  {
    case 3:
    case 6:
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (!Strong) {
        goto LABEL_16;
      }
      id v2 = (void *)Strong;
      id v3 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v4._countAndFlagsBits = 0xD00000000000001CLL;
      v11._countAndFlagsBits = 0xE000000000000000;
      uint64_t v5 = "FRIEND_REQUEST_CARD_SUBTITLE";
      goto LABEL_6;
    case 4:
      uint64_t v7 = swift_unknownObjectWeakLoadStrong();
      if (!v7) {
        goto LABEL_17;
      }
      id v2 = (void *)v7;
      id v3 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v11._countAndFlagsBits = 0xE000000000000000;
      CGRect v8 = "FRIEND_REQUEST_CARD_SUBTITLE_WHEN_ALREADY_FRIENDS";
      goto LABEL_11;
    case 5:
      uint64_t v9 = swift_unknownObjectWeakLoadStrong();
      if (!v9) {
        goto LABEL_18;
      }
      id v2 = (void *)v9;
      id v3 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v11._countAndFlagsBits = 0xE000000000000000;
      CGRect v8 = "FRIEND_REQUEST_CARD_SUBTITLE_WHEN_INVITE_ACCEPTED";
LABEL_11:
      v4._object = (void *)((unint64_t)(v8 - 32) | 0x8000000000000000);
      v4._countAndFlagsBits = 0xD000000000000031;
      break;
    case 7:
    case 8:
      return;
    default:
      uint64_t v1 = swift_unknownObjectWeakLoadStrong();
      if (!v1)
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
        JUMPOUT(0x10000DCBCLL);
      }
      id v2 = (void *)v1;
      id v3 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v4._countAndFlagsBits = 0xD000000000000023;
      v11._countAndFlagsBits = 0xE000000000000000;
      uint64_t v5 = "FRIEND_REQUEST_CARD_SENDER_SUBTITLE";
LABEL_6:
      v4._object = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
      break;
  }
  v14.value._countAndFlagsBits = 0;
  v14.value._object = 0;
  v10.super.Class isa = v3;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_100047498(v4, v14, v10, v15, v11);

  NSString v12 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v2 setText:v12];
}

void sub_10000DCE0(uint64_t a1)
{
  id v2 = v1;
  Swift::String v4 = (void *)sub_10003F89C();
  if (!v4
    || (uint64_t v5 = v4, v6 = [v4 activeConversation], v5, !v6))
  {
LABEL_16:
    Swift::String v32 = *(void **)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer);
    if (v32 && (id v33 = [v32 displayNameWithOptions:0]) != 0)
    {
      NSString v34 = v33;
      id v76 = v2;
      sub_100047E68();
    }
    else
    {
      if (!*(void *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname + 8))
      {
LABEL_28:
        *((unsigned char *)v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 1;
        sub_10000C728();
        return;
      }
      id v76 = v2;
      swift_bridgeObjectRetain();
    }
    id v35 = objc_allocWithZone((Class)NSMutableAttributedString);
    NSString v36 = sub_100047E38();
    swift_bridgeObjectRelease();
    id v37 = [v35 initWithString:v36];

    sub_100004714(&qword_100060C78);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004BE20;
    *(void *)(inited + 32) = NSFontAttributeName;
    Swift::String v74 = self;
    id v39 = v37;
    double v40 = NSFontAttributeName;
    id v41 = [v74 _gkPreferredFontForTextStyle:UIFontTextStyleFootnote symbolicTraits:2];
    uint64_t v42 = sub_100010B0C(0, (unint64_t *)&unk_100060C80);
    *(void *)(inited + 64) = v42;
    *(void *)(inited + 40) = v41;
    sub_10000E624(inited);
    type metadata accessor for Key(0);
    sub_1000104EC(&qword_100060818, type metadata accessor for Key);
    Class isa = sub_100047DA8().super.isa;
    swift_bridgeObjectRelease();
    [v39 addAttributes:isa range:0 length:[v39 length]];

    double v44 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v80._countAndFlagsBits = 0xD000000000000020;
    v71._countAndFlagsBits = 0xE000000000000000;
    v80._object = (void *)0x800000010004A1C0;
    v84.value._countAndFlagsBits = 0;
    v84.value._object = 0;
    v45.super.Class isa = v44;
    v88._countAndFlagsBits = 0;
    v88._object = (void *)0xE000000000000000;
    sub_100047498(v80, v84, v45, v88, v71);

    id v46 = objc_allocWithZone((Class)NSMutableAttributedString);
    NSString v47 = sub_100047E38();
    swift_bridgeObjectRelease();
    id v48 = [v46 initWithString:v47];

    uint64_t v49 = swift_initStackObject();
    *(_OWORD *)(v49 + 16) = xmmword_10004BE20;
    *(void *)(v49 + 32) = v40;
    uint64_t v50 = v40;
    id v51 = [v74 preferredFontForTextStyle:UIFontTextStyleFootnote];
    *(void *)(v49 + 64) = v42;
    id v52 = v39;
    *(void *)(v49 + 40) = v51;
    sub_10000E624(v49);
    Class v53 = sub_100047DA8().super.isa;
    swift_bridgeObjectRelease();
    [v48 addAttributes:v53 range:NSMakeRange(0, [v48 length])];

    [v39 appendAttributedString:v48];
    id v2 = v76;
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      double v55 = Strong;
      [Strong setAttributedText:v39];

      uint64_t v56 = swift_unknownObjectWeakLoadStrong();
      if (v56)
      {
        uint64_t v57 = (void *)v56;
        unsigned __int8 v58 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v81._countAndFlagsBits = 0xD00000000000001DLL;
        v73._countAndFlagsBits = 0xE000000000000000;
        v81._object = (void *)0x800000010004A1F0;
        v85.value._countAndFlagsBits = 0;
        v85.value._object = 0;
        v59.super.Class isa = v58;
        v89._countAndFlagsBits = 0;
        v89._object = (void *)0xE000000000000000;
        sub_100047498(v81, v85, v59, v89, v73);

        NSString v60 = sub_100047E38();
        swift_bridgeObjectRelease();
        [v57 setText:v60];

        double v61 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v61)
        {
          double v62 = v61;
          [v61 setUserInteractionEnabled:1];

          id v63 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v76 action:"friendAvatarPressed:"];
          id v64 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v76 action:"friendAvatarPressed:"];
          id v65 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v65)
          {
            uint64_t v66 = v65;
            [v65 addGestureRecognizer:v63];

            NSBundle v67 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v67)
            {
              double v68 = v67;
              [v67 setUserInteractionEnabled:1];

              double v69 = (void *)swift_unknownObjectWeakLoadStrong();
              if (v69)
              {
                Swift::String v70 = v69;
                [v69 addGestureRecognizer:v64];

                goto LABEL_28;
              }
LABEL_34:
              __break(1u);
              goto LABEL_35;
            }
LABEL_33:
            __break(1u);
            goto LABEL_34;
          }
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  id v7 = [v6 recipientAddresses];
  uint64_t v8 = sub_100047F58();

  unint64_t v9 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  if (v9 < 2
    || (NSBundle v10 = (uint64_t *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount),
        (*(unsigned char *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8) & 1) != 0)
    || (uint64_t v11 = *v10, *v10 < 1))
  {

    goto LABEL_16;
  }
  *((unsigned char *)v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 2;
  sub_10000C728();
  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  if (!v12)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  CGFloat v13 = (void *)v12;
  Swift::String_optional v14 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v71._countAndFlagsBits = 0xE000000000000000;
  v78._object = (void *)0x800000010004A210;
  v78._countAndFlagsBits = 0xD00000000000001ALL;
  v82.value._countAndFlagsBits = 0;
  v82.value._object = 0;
  v15.super.Class isa = v14;
  v86._countAndFlagsBits = 0;
  v86._object = (void *)0xE000000000000000;
  sub_100047498(v78, v82, v15, v86, v71);

  sub_100004714(&qword_100060C70);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10004BE20;
  *(void *)(v16 + 56) = &type metadata for Int;
  *(void *)(v16 + 64) = &protocol witness table for Int;
  *(void *)(v16 + 32) = v11;
  sub_100047E78();
  swift_bridgeObjectRelease();
  NSString v17 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v13 setText:v17];

  uint64_t v18 = swift_unknownObjectWeakLoadStrong();
  if (!v18)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  CGFloat v19 = (void *)v18;
  NSString v20 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v79._countAndFlagsBits = 0xD00000000000001CLL;
  v72._countAndFlagsBits = 0xE000000000000000;
  v79._object = (void *)0x800000010004A230;
  v83.value._countAndFlagsBits = 0;
  v83.value._object = 0;
  v21.super.Class isa = v20;
  v87._countAndFlagsBits = 0;
  v87._object = (void *)0xE000000000000000;
  sub_100047498(v79, v83, v21, v87, v72);

  NSString v22 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v19 setText:v22];

  uint64_t v23 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v23)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  double v24 = v23;
  [v23 setUserInteractionEnabled:1];

  id v25 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v2 action:"viewGameCenterFriendsTapped:"];
  id v26 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v2 action:"viewGameCenterFriendsTapped:"];
  Swift::String v27 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v27)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  NSString v28 = v27;
  [v27 addGestureRecognizer:v25];

  unsigned __int8 v29 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v29)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  Swift::String v30 = v29;
  [v29 setUserInteractionEnabled:1];

  Swift::String_optional v31 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v31)
  {
LABEL_40:
    __break(1u);
    return;
  }
  id v75 = v31;
  [v31 addGestureRecognizer:v26];
}

unint64_t sub_10000E624(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004714(&qword_100060CA0);
  uint64_t v2 = sub_1000482D8();
  id v3 = (void *)v2;
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
    sub_1000103CC(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_10003457C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100010434(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

void sub_10000E740(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a2)
  {
    NSString v4 = sub_100047E38();
    id v5 = [self systemImageNamed:v4];

    if (v5)
    {
      id v6 = [self configurationWithScale:1];
      id v7 = [v5 imageWithConfiguration:v6];

      if (v7)
      {
        id v41 = v7;
        id v8 = objc_allocWithZone((Class)NSMutableAttributedString);
        swift_bridgeObjectRetain();
        NSString v9 = sub_100047E38();
        swift_bridgeObjectRelease();
        id v10 = [v8 initWithString:v9];

        sub_100004714(&qword_100060C78);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10004BE20;
        *(void *)(inited + 32) = NSFontAttributeName;
        uint64_t v12 = self;
        uint64_t v13 = qword_100060730;
        id v14 = v10;
        NSBundle v15 = NSFontAttributeName;
        if (v13 != -1) {
          swift_once();
        }
        id v16 = [v12 _gkPreferredFontForTextStyle:qword_100064210 symbolicTraits:2];
        *(void *)(inited + 64) = sub_100010B0C(0, (unint64_t *)&unk_100060C80);
        *(void *)(inited + 40) = v16;
        sub_10000E624(inited);
        int v17 = 1 << *(unsigned char *)(v2
                            + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState);
        if ((v17 & 0x178) == 0)
        {
          if ((v17 & 7) != 0)
          {
            type metadata accessor for Key(0);
            sub_1000104EC(&qword_100060818, type metadata accessor for Key);
            Class isa = sub_100047DA8().super.isa;
            swift_bridgeObjectRelease();
            [v14 addAttributes:isa range:0 length:[v14 length]];

            uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
            if (!Strong)
            {
LABEL_24:
              __break(1u);
              return;
            }
            double v40 = Strong;
            [Strong setAttributedText:v14];
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          return;
        }

        swift_bridgeObjectRetain();
        v44._countAndFlagsBits = 32;
        v44._object = (void *)0xE100000000000000;
        sub_100047EB8(v44);
        id v18 = objc_allocWithZone((Class)NSMutableAttributedString);
        NSString v19 = sub_100047E38();
        swift_bridgeObjectRelease();
        id v20 = [v18 initWithString:v19];

        type metadata accessor for Key(0);
        sub_1000104EC(&qword_100060818, type metadata accessor for Key);
        id v21 = v20;
        Class v22 = sub_100047DA8().super.isa;
        swift_bridgeObjectRelease();
        [v21 addAttributes:v22 range:NSMakeRange(0, [v21 length])];

        id v23 = [self textAttachmentWithImage:v41];
        sub_100010B0C(0, &qword_100060C90);
        id v24 = [(id)swift_getObjCClassFromMetadata() attributedStringWithAttachment:v23];
        uint64_t v25 = swift_initStackObject();
        *(_OWORD *)(v25 + 16) = xmmword_10004BE20;
        *(void *)(v25 + 32) = NSForegroundColorAttributeName;
        id v26 = self;
        Swift::String v27 = NSForegroundColorAttributeName;
        id v28 = [v26 tertiaryLabelColor];
        *(void *)(v25 + 64) = sub_100010B0C(0, &qword_100060C98);
        *(void *)(v25 + 40) = v28;
        sub_10000E624(v25);
        Class v29 = sub_100047DA8().super.isa;
        swift_bridgeObjectRelease();
        [v24 addAttributes:v29 range:0, [v24 length]];

        [v21 appendAttributedString:v24];
        Swift::String v30 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v30)
        {
          Swift::String_optional v31 = v30;
          [v30 setAttributedText:v21];

          Swift::String v32 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v32)
          {
            id v33 = v32;
            [v32 setUserInteractionEnabled:1];

            id v34 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v3 action:"friendAvatarPressed:"];
            id v35 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v35)
            {
              NSString v36 = v35;
              [v35 addGestureRecognizer:v34];

              return;
            }
            goto LABEL_23;
          }
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
  }
  id v37 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v37)
  {
    __break(1u);
    goto LABEL_21;
  }
  id v42 = v37;
  [v37 setHidden:1];
}

void sub_10000EE14()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
  if (v1)
  {
    switch(*(unsigned char *)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType))
    {
      case 1:
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (!Strong) {
          goto LABEL_25;
        }
        uint64_t v3 = (void *)Strong;
        NSString v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v5._countAndFlagsBits = 0xD000000000000019;
        v13._countAndFlagsBits = 0xE000000000000000;
        id v6 = "FRIEND_REQUEST_CARD_ERROR";
        goto LABEL_7;
      case 2:
        uint64_t v7 = swift_unknownObjectWeakLoadStrong();
        if (!v7) {
          goto LABEL_22;
        }
        uint64_t v3 = (void *)v7;
        NSString v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v13._countAndFlagsBits = 0xE000000000000000;
        id v8 = "FRIEND_REQUEST_ALERT_MESSAGE_EXPIRED";
        goto LABEL_12;
      case 3:
        uint64_t v9 = swift_unknownObjectWeakLoadStrong();
        if (!v9) {
          goto LABEL_23;
        }
        uint64_t v3 = (void *)v9;
        NSString v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v13._countAndFlagsBits = 0xE000000000000000;
        id v8 = "FRIEND_REQUEST_ALERT_MESSAGE_INVALID";
LABEL_12:
        v5._object = (void *)((unint64_t)(v8 - 32) | 0x8000000000000000);
        v5._countAndFlagsBits = 0xD000000000000024;
        goto LABEL_13;
      case 4:
        uint64_t v11 = swift_unknownObjectWeakLoadStrong();
        if (!v11) {
          goto LABEL_24;
        }
        uint64_t v3 = (void *)v11;
        NSString v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v5._countAndFlagsBits = 0xD000000000000018;
        v13._countAndFlagsBits = 0xE000000000000000;
        id v6 = "NO_NETWORK_ALERT_MESSAGE";
        goto LABEL_7;
      default:
        sub_10000F0AC();
        uint64_t v2 = swift_unknownObjectWeakLoadStrong();
        if (v2) {
          goto LABEL_6;
        }
        goto LABEL_21;
    }
  }
  sub_10000F0AC();
  uint64_t v2 = swift_unknownObjectWeakLoadStrong();
  if (!v2)
  {
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    JUMPOUT(0x10000F098);
  }
LABEL_6:
  uint64_t v3 = (void *)v2;
  NSString v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v5._countAndFlagsBits = 0xD00000000000002ELL;
  v13._countAndFlagsBits = 0xE000000000000000;
  id v6 = "FRIEND_REQUEST_CARD_SERVER_COMMUNICATION_ERROR";
LABEL_7:
  v5._object = (void *)((unint64_t)(v6 - 32) | 0x8000000000000000);
LABEL_13:
  v16.value._countAndFlagsBits = 0;
  v16.value._object = 0;
  v10.super.Class isa = v4;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_100047498(v5, v16, v10, v17, v13);

  NSString v14 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v3 setText:v14];
}

void sub_10000F0AC()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = Strong;
  [Strong setHidden:0];

  uint64_t v3 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  NSString v4 = v3;
  [v3 setUserInteractionEnabled:1];

  id v5 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v0 action:"tryAgainPressed:"];
  id v6 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v6)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v7 = v6;
  [v6 addGestureRecognizer:v5];
}

void sub_10000F19C(void *a1)
{
  id v3 = [v1 traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  LODWORD(v3) = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();
  if (!v3)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v7 = (void *)Strong;
      id v8 = self;
      id v9 = [v8 _preferredFontForTextStyle:UIFontTextStyleHeadline design:UIFontDescriptorSystemDesignRounded weight:UIFontWeightRegular];
      [v7 setFont:v9];

      uint64_t v10 = swift_unknownObjectWeakLoadStrong();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        [a1 stats];
        sub_100048318();
        NSString v12 = sub_100047E38();
        swift_bridgeObjectRelease();
        [v11 setText:v12];

        uint64_t v13 = swift_unknownObjectWeakLoadStrong();
        if (v13)
        {
          NSString v14 = (void *)v13;
          id v15 = [v8 _preferredFontForTextStyle:UIFontTextStyleHeadline design:UIFontDescriptorSystemDesignRounded weight:UIFontWeightRegular];
          [v14 setFont:v15];

          uint64_t v16 = swift_unknownObjectWeakLoadStrong();
          if (v16)
          {
            Swift::String v17 = (void *)v16;
            [a1 stats];
            sub_100048318();
            NSString v18 = sub_100047E38();
            swift_bridgeObjectRelease();
            [v17 setText:v18];

            uint64_t v19 = swift_unknownObjectWeakLoadStrong();
            if (v19)
            {
              id v20 = (void *)v19;
              id v21 = [v8 _preferredFontForTextStyle:UIFontTextStyleHeadline design:UIFontDescriptorSystemDesignRounded weight:UIFontWeightRegular];
              [v20 setFont:v21];

              uint64_t v22 = swift_unknownObjectWeakLoadStrong();
              if (v22)
              {
                id v23 = (void *)v22;
                [a1 stats];
                sub_100048318();
                NSString v24 = sub_100047E38();
                swift_bridgeObjectRelease();
                [v23 setText:v24];

                uint64_t v25 = swift_unknownObjectWeakLoadStrong();
                if (v25)
                {
                  id v26 = (void *)v25;
                  Swift::String v27 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
                  v52._countAndFlagsBits = 0xD00000000000001CLL;
                  v45._countAndFlagsBits = 0xE000000000000000;
                  v52._object = (void *)0x800000010004A090;
                  v55.value._countAndFlagsBits = 0;
                  v55.value._object = 0;
                  v28.super.Class isa = v27;
                  v58._countAndFlagsBits = 0;
                  v58._object = (void *)0xE000000000000000;
                  sub_100047498(v52, v55, v28, v58, v45);

                  sub_100004714(&qword_100060C70);
                  uint64_t v29 = swift_allocObject();
                  *(_OWORD *)(v29 + 16) = xmmword_10004BE20;
                  [a1 stats];
                  *(void *)(v29 + 56) = &type metadata for Int;
                  *(void *)(v29 + 64) = &protocol witness table for Int;
                  *(void *)(v29 + 32) = v49;
                  sub_100047E78();
                  swift_bridgeObjectRelease();
                  NSString v30 = sub_100047E38();
                  swift_bridgeObjectRelease();
                  [v26 setText:v30];

                  uint64_t v31 = swift_unknownObjectWeakLoadStrong();
                  if (v31)
                  {
                    Swift::String v32 = (void *)v31;
                    id v33 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
                    v53._countAndFlagsBits = 0xD000000000000018;
                    v46._countAndFlagsBits = 0xE000000000000000;
                    v53._object = (void *)0x800000010004A0B0;
                    v56.value._countAndFlagsBits = 0;
                    v56.value._object = 0;
                    v34.super.Class isa = v33;
                    v59._countAndFlagsBits = 0;
                    v59._object = (void *)0xE000000000000000;
                    sub_100047498(v53, v56, v34, v59, v46);

                    uint64_t v35 = swift_allocObject();
                    *(_OWORD *)(v35 + 16) = xmmword_10004BE20;
                    [a1 stats];
                    *(void *)(v35 + 56) = &type metadata for Int;
                    *(void *)(v35 + 64) = &protocol witness table for Int;
                    *(void *)(v35 + 32) = v50;
                    sub_100047E78();
                    swift_bridgeObjectRelease();
                    NSString v36 = sub_100047E38();
                    swift_bridgeObjectRelease();
                    [v32 setText:v36];

                    uint64_t v37 = swift_unknownObjectWeakLoadStrong();
                    if (v37)
                    {
                      double v38 = (void *)v37;
                      id v39 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
                      v47._countAndFlagsBits = 0xE000000000000000;
                      v54._object = (void *)0x800000010004A0D0;
                      v54._countAndFlagsBits = 0xD000000000000011;
                      v57.value._countAndFlagsBits = 0;
                      v57.value._object = 0;
                      v40.super.Class isa = v39;
                      v60._countAndFlagsBits = 0;
                      v60._object = (void *)0xE000000000000000;
                      sub_100047498(v54, v57, v40, v60, v47);

                      uint64_t v41 = swift_allocObject();
                      *(_OWORD *)(v41 + 16) = xmmword_10004BE20;
                      [a1 stats];
                      *(void *)(v41 + 56) = &type metadata for Int;
                      *(void *)(v41 + 64) = &protocol witness table for Int;
                      *(void *)(v41 + 32) = v49;
                      sub_100047E78();
                      swift_bridgeObjectRelease();
                      NSString v42 = sub_100047E38();
                      swift_bridgeObjectRelease();
                      [v38 setText:v42];

                      Swift::String v43 = (void *)swift_unknownObjectWeakLoadStrong();
                      if (v43)
                      {
                        Swift::String v44 = v43;
                        [v43 setHidden:0];

                        return;
                      }
                      goto LABEL_27;
                    }
LABEL_26:
                    __break(1u);
LABEL_27:
                    __break(1u);
                    return;
                  }
LABEL_25:
                  __break(1u);
                  goto LABEL_26;
                }
LABEL_24:
                __break(1u);
                goto LABEL_25;
              }
LABEL_23:
              __break(1u);
              goto LABEL_24;
            }
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v5 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v5)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v48 = v5;
  [v5 setHidden:1];
}

id sub_10000F8B4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant] = 0;
  *(void *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel] = 0;
  *(_DWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = 2;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 0;
  *(void *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = 0;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = 2;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer] = 0;
  id v6 = &v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl];
  *id v6 = 0;
  v6[1] = 0;
  if (a2)
  {
    NSString v7 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for FriendRequestCardViewController();
  [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_10000FC44(void *a1)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant] = 0;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel] = 0;
  *(_DWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = 2;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 0;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = 0;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = 2;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer] = 0;
  id v3 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl];
  id v4 = (objc_class *)type metadata accessor for FriendRequestCardViewController();
  *id v3 = 0;
  v3[1] = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  [super initWithCoder:a1];

  return v5;
}

uint64_t type metadata accessor for FriendRequestCardViewController()
{
  return self;
}

uint64_t getEnumTagSinglePayload for FriendRequestCardViewController.InviteCardViewer(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FriendRequestCardViewController.InviteCardViewer(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000100E8);
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

uint64_t sub_100010110(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100010118(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FriendRequestCardViewController.InviteCardViewer()
{
  return &type metadata for FriendRequestCardViewController.InviteCardViewer;
}

uint64_t getEnumTagSinglePayload for FriendRequestCardViewController.InviteCardUIType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FriendRequestCardViewController.InviteCardUIType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x100010290);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

unsigned char *sub_1000102B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendRequestCardViewController.InviteCardUIType()
{
  return &type metadata for FriendRequestCardViewController.InviteCardUIType;
}

unint64_t sub_1000102D4()
{
  unint64_t result = qword_100060C60;
  if (!qword_100060C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060C60);
  }
  return result;
}

unint64_t sub_10001032C()
{
  unint64_t result = qword_100060C68;
  if (!qword_100060C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100060C68);
  }
  return result;
}

uint64_t sub_100010380(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100059928;
  v6._object = a2;
  unint64_t v4 = sub_100048308(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000103CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_100060CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100010434(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100010444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010454()
{
  return swift_release();
}

uint64_t sub_10001045C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void *sub_100010494(uint64_t a1)
{
  return sub_10000BB50(a1, *(void **)(v1 + 16));
}

uint64_t sub_10001049C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000104DC(uint64_t a1)
{
  sub_10000AA50(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

void sub_1000104E4(uint64_t a1, uint64_t a2)
{
  sub_10000B278(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1000104EC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100010534()
{
  unint64_t result = qword_100061E20;
  if (!qword_100061E20)
  {
    sub_100003798((uint64_t *)&unk_100060CD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061E20);
  }
  return result;
}

void *sub_100010590(unint64_t a1, uint64_t a2)
{
  uint64_t v19 = &_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      Swift::String v6 = (void *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname);
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)sub_100048208();
LABEL_10:
        int v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_22;
        }
        objc_super v10 = v6;
        sub_100010B0C(0, (unint64_t *)&unk_100060CF0);
        id v11 = [v8 friendBiDirectional];
        Class isa = sub_1000480E8(1).super.super.isa;
        a2 = sub_1000480F8();

        if (a2)
        {
          id v13 = [v8 alias];
          uint64_t v14 = sub_100047E68();
          a2 = v15;

          Swift::String v6 = v10;
          uint64_t v16 = v10[1];
          if (!v16)
          {

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
          if (v14 == *v10 && v16 == a2)
          {
            swift_bridgeObjectRelease();
LABEL_18:
            sub_100048238();
            sub_100048258();
            sub_100048268();
            a2 = (uint64_t)&v19;
            sub_100048248();
            goto LABEL_5;
          }
          char v17 = sub_100048328();
          swift_bridgeObjectRelease();
          if (v17) {
            goto LABEL_18;
          }
        }

LABEL_5:
        Swift::String v6 = v10;
LABEL_6:
        ++v5;
        if (v9 == v4) {
          return v19;
        }
      }
      if (v5 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      uint64_t v4 = sub_1000482A8();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v7 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_10;
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_1000107D8(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      unint64_t v5 = v2 & 0xC000000000000001;
      uint64_t v28 = v2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v26 = v2;
      unint64_t v25 = v2 & 0xC000000000000001;
      while (v5)
      {
        id v6 = (id)sub_100048208();
LABEL_9:
        id v7 = v6;
        unint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_20;
        }
        sub_100010B0C(0, (unint64_t *)&unk_100060CF0);
        id v9 = [v7 friendBiDirectional];
        Class isa = sub_1000480E8(1).super.super.isa;
        char v11 = sub_1000480F8();

        if (v11)
        {
          uint64_t v12 = v3;
          id v13 = [v7 internal];
          id v14 = [v13 playerID];

          uint64_t v15 = sub_100047E68();
          uint64_t v17 = v16;

          id v18 = [a2 internal];
          id v19 = [v18 playerID];

          uint64_t v20 = sub_100047E68();
          uint64_t v22 = v21;

          if (v15 == v20 && v17 == v22)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v3 = v12;
            unint64_t v5 = v25;
          }
          else
          {
            char v23 = sub_100048328();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v3 = v12;
            unint64_t v5 = v25;
            if ((v23 & 1) == 0)
            {

              unint64_t v2 = v26;
              goto LABEL_5;
            }
          }
          sub_100048238();
          sub_100048258();
          sub_100048268();
          sub_100048248();
          unint64_t v2 = v26;
        }
        else
        {
        }
LABEL_5:
        ++v4;
        if (v8 == v3) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)(v28 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v3 = sub_1000482A8();
      if (!v3) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v6 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100010A84(uint64_t a1)
{
  uint64_t v2 = sub_100004714(&qword_100060CE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010AE4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_100010AF4(void *a1, uint64_t a2)
{
  sub_100007EC0(a1, a2, *(unsigned char **)(v2 + 16), *(unsigned char **)(v2 + 24));
}

void sub_100010AFC(uint64_t a1, uint64_t a2)
{
  sub_100008B18(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

void sub_100010B04(uint64_t a1, uint64_t a2)
{
  sub_1000088F0(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100010B0C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100010B48()
{
  uint64_t v1 = sub_100047D48();
  uint64_t v22 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100047D68();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  __chkstk_darwin(v4);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100047D88();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v19 - v12;
  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  id v14 = (void *)sub_100048098();
  sub_100047D78();
  sub_100047D98();
  id v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v0;
  aBlock[4] = sub_100011424;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_100059FA0;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v0;
  swift_release();
  sub_100047D58();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000104EC((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_100010534();
  sub_1000481A8();
  sub_100048068();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v21);
  return ((uint64_t (*)(char *, uint64_t))v19)(v13, v7);
}

void sub_100010EEC()
{
  uint64_t v1 = sub_10003F89C();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    int v3 = *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer);
    id v4 = [objc_allocWithZone((Class)GKReporter) init];
    uint64_t v5 = v4;
    id v6 = &GKSenderTappedViewPlayerProfileButton;
    if (v3) {
      id v6 = &GKReceiverTappedViewPlayerProfileButton;
    }
    [v4 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:*v6];

    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    if (v7)
    {
      uint64_t v8 = *(void **)(v7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
      if (v8)
      {
        id v9 = [v8 internal];
        id v10 = [v9 playerID];

        uint64_t v11 = sub_100047E68();
        uint64_t v13 = v12;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v13 = 0;
      }
      qword_100064230 = v11;
      qword_100064238 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      byte_100061C60 = 0;
      [v2 requestPresentationStyle:3];

      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10001105C()
{
  uint64_t v1 = sub_10003F89C();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = [objc_allocWithZone((Class)GKReporter) init];
    [v3 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKViewFriendProfileButtonTapped];

    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong
      && (uint64_t v5 = Strong, v6 = [Strong player], v5, v6))
    {
      id v7 = [v6 internal];

      id v8 = [v7 playerID];
      uint64_t v9 = sub_100047E68();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = sub_100047E68();
      uint64_t v11 = v12;
    }
    if (v9 == sub_100047E68() && v11 == v13)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = sub_100048328();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
LABEL_19:
        qword_100064230 = v9;
        qword_100064238 = v11;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        byte_100061C60 = 0;
        [v2 requestPresentationStyle:3];
        swift_bridgeObjectRelease();

        return;
      }
    }
    uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    if (!v16)
    {
      __break(1u);
      return;
    }
    id v17 = (void *)(v16 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
    swift_beginAccess();
    id v18 = (void *)*v17;
    if (*v17 && v18[2])
    {
      uint64_t v9 = v18[4];
      uint64_t v19 = v18[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v11 = v19;
    }
    else
    {
      uint64_t v20 = *(void **)(v16 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
      if (v20)
      {
        id v21 = v20;
        swift_bridgeObjectRelease();
        id v22 = [v21 internal];

        id v23 = [v22 playerID];
        uint64_t v9 = sub_100047E68();
        uint64_t v11 = v24;
      }
    }
    goto LABEL_19;
  }
}

id sub_100011308()
{
  id v0 = [objc_allocWithZone((Class)GKAPIReporter) init];
  NSString v1 = sub_100047E38();
  NSString v2 = sub_100047E38();
  NSString v3 = sub_100047E38();
  sub_100008C30();
  NSString v4 = sub_100047E38();
  swift_bridgeObjectRelease();
  NSString v5 = sub_100047E38();
  [v0 recordClickWithAction:v1 targetId:v2 targetType:v3 pageId:v4 pageType:v5];

  return sub_1000072C8();
}

id sub_100011424()
{
  return sub_1000072C8();
}

id sub_1000115BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeaderView();
  return [super dealloc];
}

uint64_t type metadata accessor for HeaderView()
{
  return self;
}

uint64_t sub_100011628(void **a1, void **a2)
{
  return _sSo12GKGameRecordC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(*a1, *a2);
}

void sub_100011640(uint64_t a1, uint64_t a2)
{
  NSString v3 = *(void **)&v2[qword_100061998];
  if (v3)
  {
    if (*(void *)(*(void *)&v2[qword_1000619A0] + 16))
    {
      id v6 = self;
      id v7 = v3;
      swift_bridgeObjectRetain();
      v8.super.Class isa = sub_100047F48().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v9 = (void *)swift_allocObject();
      v9[2] = v2;
      v9[3] = a1;
      v9[4] = a2;
      uint64_t v19 = sub_1000123BC;
      uint64_t v20 = v9;
      aBlock = _NSConcreteStackBlock;
      uint64_t v16 = 1107296256;
      id v17 = sub_100011A64;
      id v18 = &unk_10005A060;
      uint64_t v10 = _Block_copy(&aBlock);
      uint64_t v11 = v2;
      swift_retain();
      swift_release();
      [v6 loadGameRecordsForPlayer:v7 bundleIDs:v8.super.isa withCompletionHandler:v10];
      _Block_release(v10);
    }
    else
    {
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = v2;
      v12[3] = a1;
      v12[4] = a2;
      uint64_t v19 = sub_100012354;
      uint64_t v20 = v12;
      aBlock = _NSConcreteStackBlock;
      uint64_t v16 = 1107296256;
      id v17 = sub_100011D00;
      id v18 = &unk_10005A010;
      uint64_t v13 = _Block_copy(&aBlock);
      v8.super.Class isa = (Class)v3;
      id v14 = v2;
      swift_retain();
      swift_release();
      [(objc_class *)v8.super.isa loadGamesPlayedDetailsWithCompletionHandler:v13];
      _Block_release(v13);
    }
  }
  else
  {
    sub_100048298();
    __break(1u);
  }
}

uint64_t sub_1000118B8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  if (!(a1 >> 62))
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    *(void *)(a3 + qword_1000619A8) = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    return a4(a2);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000482A8();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v17 = a2;
    uint64_t v18 = a5;
    uint64_t v19 = a4;
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v13 = (id)sub_100048208();
      }
      else {
        id v13 = *(id *)(a1 + 8 * i + 32);
      }
      id v14 = v13;
      id v15 = [v13 internal:v17, v18, v19];
      unsigned int v16 = [v15 canBeIndexed];

      if (v16)
      {
        sub_100048238();
        sub_100048258();
        sub_100048268();
        sub_100048248();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    a4 = v19;
    a2 = v17;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_100011A64(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_10001220C();
  uint64_t v5 = sub_100047F58();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_100011B04(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000482A8();
    uint64_t v12 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v12) {
    goto LABEL_14;
  }
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v22 = a4;
  uint64_t v23 = a7;
  uint64_t v24 = a6;
  for (uint64_t i = 0; i != v12; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v15 = (id)sub_100048208();
    }
    else {
      id v15 = *(id *)(a1 + 8 * i + 32);
    }
    unsigned int v16 = v15;
    id v17 = [v15 internal:v22, v23, v24];
    unsigned int v18 = [v17 canBeIndexed];

    if (v18)
    {
      sub_100048238();
      sub_100048258();
      sub_100048268();
      sub_100048248();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  a6 = v24;
  a4 = v22;
LABEL_15:
  uint64_t v19 = qword_1000619A8;
  *(void *)(a5 + qword_1000619A8) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  unint64_t v20 = *(void *)(a5 + v19);
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000482A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(a5 + qword_1000619B0) = v21;
  return a6(a4);
}

void sub_100011D00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  sub_10001220C();
  uint64_t v6 = sub_100047F58();
  uint64_t v7 = sub_100047E68();
  uint64_t v9 = v8;
  swift_retain();
  id v10 = a4;
  v5(v6, v7, v9, a4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_100011DC4(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for GamesModel();
  return [super init];
}

id sub_100011E08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamesModel();
  return [super dealloc];
}

uint64_t _sSo12GKGameRecordC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_100004714(&qword_100060F40);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_100047598();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  id v17 = (char *)&v31 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v31 - v18;
  unint64_t v20 = (SEL *)&unk_10005E000;
  id v21 = [a1 lastPlayedDate];
  if (!v21)
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v24(v9, 1, 1, v10);
    goto LABEL_5;
  }
  uint64_t v22 = v21;
  Swift::String v32 = a2;
  sub_100047588();

  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v23(v9, v17, v10);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v24(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    a2 = v32;
    unint64_t v20 = (SEL *)&unk_10005E000;
LABEL_5:
    sub_100047568();
    sub_1000123C8((uint64_t)v9);
    goto LABEL_7;
  }
  v23(v19, v9, v10);
  a2 = v32;
  unint64_t v20 = (SEL *)&unk_10005E000;
LABEL_7:
  id v25 = [a2 v20[458]];
  if (!v25)
  {
    v24(v7, 1, 1, v10);
    goto LABEL_11;
  }
  unint64_t v26 = v25;
  sub_100047588();

  Swift::String v27 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v27(v7, v17, v10);
  v24(v7, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
LABEL_11:
    sub_100047568();
    sub_1000123C8((uint64_t)v7);
    goto LABEL_12;
  }
  v27(v14, v7, v10);
LABEL_12:
  char v28 = sub_100047578();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v11 + 8);
  v29(v14, v10);
  v29(v19, v10);
  return v28 & 1;
}

uint64_t sub_1000121C8(uint64_t a1)
{
  uint64_t result = sub_100012280(&qword_100060D30);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001220C()
{
  unint64_t result = qword_100060D38;
  if (!qword_100060D38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100060D38);
  }
  return result;
}

uint64_t sub_10001224C()
{
  return sub_100012280(&qword_100060D40);
}

uint64_t sub_100012280(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001220C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for GamesModel()
{
  uint64_t result = qword_100060D70;
  if (!qword_100060D70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012310()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100012348()
{
  return type metadata accessor for GamesModel();
}

uint64_t sub_100012354(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100011B04(a1, a2, a3, a4, *(void *)(v4 + 16), *(uint64_t (**)(void))(v4 + 24), *(void *)(v4 + 32));
}

uint64_t sub_100012360(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012370()
{
  return swift_release();
}

uint64_t sub_10001237C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000123BC(unint64_t a1, uint64_t a2)
{
  return sub_1000118B8(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_1000123C8(uint64_t a1)
{
  uint64_t v2 = sub_100004714(&qword_100060F40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100012638()
{
  return sub_100012A00(type metadata accessor for ActionCell);
}

uint64_t type metadata accessor for ActionCell()
{
  return self;
}

id sub_10001290C(void *a1)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SenderCell();
  [super initWithCoder:a1];

  return v3;
}

id sub_1000129E8()
{
  return sub_100012A00(type metadata accessor for SenderCell);
}

id sub_100012A00(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for SenderCell()
{
  return self;
}

uint64_t UICollectionView.dequeueSupplementaryView<A>(ofKind:for:)(uint64_t a1, void *a2)
{
  NSString v5 = sub_100047E38();
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v6 = sub_100047E38();
  swift_bridgeObjectRelease();
  Class isa = sub_1000475D8().super.isa;
  id v8 = [v2 dequeueReusableSupplementaryViewOfKind:v5 withReuseIdentifier:v6 forIndexPath:isa];

  uint64_t result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    sub_1000481E8(68);
    v10._countAndFlagsBits = 0xD00000000000002ELL;
    v10._object = (void *)0x8000000100049760;
    sub_100047EB8(v10);
    v11._countAndFlagsBits = a1;
    v11._object = a2;
    sub_100047EB8(v11);
    v12._object = (void *)0x8000000100049790;
    v12._countAndFlagsBits = 0xD000000000000012;
    sub_100047EB8(v12);
    v13._countAndFlagsBits = sub_100047E88();
    sub_100047EB8(v13);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

uint64_t UICollectionView.dequeueCell<A>(for:)()
{
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v1 = sub_100047E38();
  swift_bridgeObjectRelease();
  Class isa = sub_1000475D8().super.isa;
  id v3 = [v0 dequeueReusableCellWithReuseIdentifier:v1 forIndexPath:isa];

  uint64_t result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    sub_1000481E8(42);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = sub_100047E88();
    sub_100047EB8(v5);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

uint64_t static ReusableView<>.defaultReuseIdentifier.getter()
{
  return sub_100047E88();
}

uint64_t static UICollectionReusableView.defaultReuseIdentifier.getter()
{
  return sub_100047E88();
}

uint64_t static NIBLoadableView<>.nibName.getter()
{
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  NSString v1 = NSStringFromClass(ObjCClassFromMetadata);
  sub_100047E68();

  sub_1000036BC();
  uint64_t v2 = sub_100048188();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 16 * v3 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

void UICollectionView.register<A>(_:)()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v2 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v0 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v2];
}

void UICollectionView.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = [self bundleForClass:ObjCClassFromMetadata];
  (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  id v9 = v8;
  NSString v10 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v11 = [self nibWithNibName:v10 bundle:v9];

  id v12 = v11;
  sub_100004714(&qword_100060AA8);
  sub_100047E88();
  NSString v13 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v4 registerNib:v12 forCellWithReuseIdentifier:v13];
}

id += infix(_:_:)(id *a1, uint64_t a2)
{
  return [*a1 appendAttributedString:a2];
}

id + infix(_:_:)(uint64_t a1, uint64_t a2)
{
  id v3 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:a2];
  [v3 appendAttributedString:a2];
  return v3;
}

id + infix(_:_:)(uint64_t a1)
{
  id v1 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:a1];
  id v2 = objc_allocWithZone((Class)NSAttributedString);
  swift_bridgeObjectRetain();
  NSString v3 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithString:v3];

  [v1 appendAttributedString:v4];
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteCardErrorView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FriendInviteCardErrorView()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteCardErrorView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteCardErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteCardErrorView()
{
  return &type metadata for FriendInviteCardErrorView;
}

uint64_t sub_100013428()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100013444@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  Swift::String v58 = a2;
  uint64_t v3 = sub_100047A38();
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  __chkstk_darwin(v3);
  id v51 = &v45[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100004714(&qword_100060FE0);
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  __chkstk_darwin(v5);
  id v48 = &v45[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100004714(&qword_100060FE8);
  uint64_t v55 = *(void *)(v7 - 8);
  uint64_t v56 = v7;
  __chkstk_darwin(v7);
  Swift::String v47 = &v45[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100004714(&qword_100060FF0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  Swift::String_optional v57 = &v45[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  Swift::String v54 = &v45[-v12];
  uint64_t v13 = a1[1];
  uint64_t v59 = *a1;
  uint64_t v60 = v13;
  sub_1000036BC();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100047BA8();
  uint64_t v27 = v15;
  char v17 = v16 & 1;
  sub_100047AD8();
  uint64_t v18 = sub_100047B88();
  uint64_t v20 = v19;
  char v22 = v21;
  swift_release();
  sub_100003710(v14, v27, v17);
  swift_bridgeObjectRelease();
  LODWORD(v59) = sub_100047A68();
  uint64_t v23 = sub_100047B78();
  uint64_t v25 = v24;
  LODWORD(v27) = v26;
  uint64_t v29 = v28;
  sub_100003710(v18, v20, v22 & 1);
  swift_bridgeObjectRelease();
  if (a1[2])
  {
    swift_retain();
    NSBundle v34 = v48;
    sub_100047CA8();
    uint64_t v35 = v51;
    sub_100047A28();
    sub_100004DB0(&qword_100061000, &qword_100060FE0);
    sub_100013B4C();
    int v46 = v27;
    uint64_t v27 = (uint64_t)v47;
    uint64_t v36 = v50;
    uint64_t v37 = v53;
    sub_100047BD8();
    (*(void (**)(unsigned char *, uint64_t))(v52 + 8))(v35, v37);
    (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v34, v36);
    uint64_t v33 = (uint64_t)v54;
    uint64_t v38 = v55;
    uint64_t v39 = v27;
    LOBYTE(v27) = v46;
    uint64_t v40 = v56;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v55 + 32))(v54, v39, v56);
    uint64_t v30 = 0;
    uint64_t v31 = v40;
    uint64_t v32 = v38;
  }
  else
  {
    uint64_t v30 = 1;
    uint64_t v32 = v55;
    uint64_t v31 = v56;
    uint64_t v33 = (uint64_t)v54;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v33, v30, 1, v31);
  uint64_t v41 = v57;
  sub_100013A84(v33, (uint64_t)v57);
  NSString v42 = v58;
  uint64_t *v58 = v23;
  v42[1] = v25;
  *((unsigned char *)v42 + 16) = v27 & 1;
  v42[3] = v29;
  uint64_t v43 = sub_100004714(&qword_100060FF8);
  sub_100013A84((uint64_t)v41, (uint64_t)v42 + *(int *)(v43 + 48));
  sub_1000047BC(v23, v25, v27 & 1);
  swift_bridgeObjectRetain();
  sub_100013AEC(v33);
  sub_100013AEC((uint64_t)v41);
  sub_100003710(v23, v25, v27 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013928@<X0>(uint64_t a1@<X8>)
{
  sub_100047708();
  sub_1000476F8();
  sub_1000036BC();
  uint64_t v2 = sub_100047BA8();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100047C48();
  uint64_t v7 = sub_100047B78();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_100003710(v2, v4, v6);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_100013A20@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  uint64_t v7 = *(void *)(v1 + 32);
  *(void *)a1 = sub_1000479D8();
  *(void *)(a1 + 8) = 0x4020000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_100004714(&qword_100060FD8);
  return sub_100013444((uint64_t *)v6, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_100013A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_100060FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013AEC(uint64_t a1)
{
  uint64_t v2 = sub_100004714(&qword_100060FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100013B4C()
{
  unint64_t result = qword_100061008;
  if (!qword_100061008)
  {
    sub_100047A38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061008);
  }
  return result;
}

uint64_t sub_100013BA4()
{
  return sub_100004DB0(&qword_100061010, &qword_100061018);
}

BOOL sub_100013BE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100013BF4()
{
  uint64_t v1 = *v0;
  sub_100048368();
  sub_100048378(v1 + 1);
  return sub_100048388();
}

void sub_100013C3C()
{
  sub_100048378(*v0 + 1);
}

Swift::Int sub_100013C6C()
{
  uint64_t v1 = *v0;
  sub_100048368();
  sub_100048378(v1 + 1);
  return sub_100048388();
}

uint64_t sub_100013CB0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000140E0(*a1);
  *a2 = result;
  return result;
}

void sub_100013CDC(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

void sub_100013CEC(void (*a1)(id, void))
{
  long long v3 = self;
  id v4 = [v3 currentLocalPlayer];
  if (v4)
  {
    id v11 = v4;
    if ([v4 isAuthenticated]) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)(v1 + 16) = v5;
    if (a1)
    {
      id v10 = v11;
      a1(v11, 0);

      char v6 = v10;
    }
    else
    {
      char v6 = v11;
    }

    return;
  }
  id v7 = [v3 authenticatedLocalPlayers];
  uint64_t v8 = sub_100047F58();

  if (*(void *)(v8 + 16))
  {
    sub_100014104(v8 + 32, (uint64_t)&v13);
    swift_bridgeObjectRelease();
    if (*((void *)&v14 + 1))
    {
      sub_1000141C0();
      if (swift_dynamicCast())
      {
        *(unsigned char *)(v1 + 16) = 3;
        if (a1)
        {
          id v9 = v12;
          a1(v12, 0);
        }
        else
        {
        }
        return;
      }
      goto LABEL_18;
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    swift_bridgeObjectRelease();
  }
  sub_100014160((uint64_t)&v13);
LABEL_18:
  *(unsigned char *)(v1 + 16) = 0;
  if (a1) {
    a1(0, 0);
  }
}

uint64_t sub_100013EC0()
{
  return _swift_deallocClassInstance(v0, 17, 7);
}

uint64_t type metadata accessor for LocalPlayerAuthenticator()
{
  return self;
}

uint64_t getEnumTagSinglePayload for LoadableModel.LoadingState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LocalPlayerAuthenticator.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100014050);
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

ValueMetadata *type metadata accessor for LocalPlayerAuthenticator.State()
{
  return &type metadata for LocalPlayerAuthenticator.State;
}

unint64_t sub_10001408C()
{
  unint64_t result = qword_1000610F0;
  if (!qword_1000610F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000610F0);
  }
  return result;
}

uint64_t sub_1000140E0(unint64_t a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x302010004uLL >> (8 * a1));
  }
}

uint64_t sub_100014104(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100014160(uint64_t a1)
{
  uint64_t v2 = sub_100004714((uint64_t *)&unk_100061D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000141C0()
{
  unint64_t result = qword_1000610F8;
  if (!qword_1000610F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000610F8);
  }
  return result;
}

void sub_100014200(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a1;
  uint64_t v48 = sub_100047768();
  uint64_t v4 = *(void *)(v48 - 8);
  uint64_t v5 = __chkstk_darwin(v48);
  BOOL v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v41 - v8;
  sub_100047738();
  id v10 = v2;
  id v11 = sub_100047758();
  os_log_type_t v12 = sub_100048008();
  BOOL v13 = os_log_type_enabled(v11, v12);
  int v46 = v7;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v47 = v4;
    uint64_t v15 = v14;
    char v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412546;
    aBlock = (void **)&v10->isa;
    uint64_t v44 = a2;
    char v17 = v10;
    sub_100048168();
    *char v16 = v10;

    *(_WORD *)(v15 + 12) = 2112;
    aBlock = (void **)&v17->isa;
    uint64_t v18 = v17;
    a2 = v44;
    sub_100048168();
    v16[1] = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ fetching player information using the playerModel: %@", (uint8_t *)v15, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v47;
    swift_slowDealloc();
  }
  else
  {

    id v11 = v10;
  }

  char v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v20 = v4 + 8;
  uint64_t v19 = v21;
  v21(v9, v48);
  type metadata accessor for LocalPlayerAuthenticator();
  uint64_t inited = swift_initStaticObject();
  uint64_t v23 = "nt me or called super which it should not do";
  if (*(unsigned char *)(inited + 16) != 2
    || !*(Class *)((char *)&v10->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player))
  {
    uint64_t v43 = v19;
    uint64_t v47 = v20;
    sub_100047738();
    uint64_t v24 = v10;
    uint64_t v25 = sub_100047758();
    os_log_type_t v26 = sub_100048008();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v44 = a2;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      uint64_t v41 = v27;
      uint64_t v42 = inited;
      *(_DWORD *)uint64_t v27 = 138412290;
      aBlock = (void **)&v24->isa;
      uint64_t v29 = v24;
      a2 = v44;
      uint64_t inited = v42;
      sub_100048168();
      *uint64_t v28 = v24;

      uint64_t v23 = " did not implement me or called super which it should not do" + 16;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ Player was not authenticated or player was nil", v41, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v25 = v24;
    }

    v43(v46, v48);
    id v30 = *(id *)((char *)&v24->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
    [v30 setError:0];
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = inited;
    v31[3] = v24;
    v31[4] = v30;
    uint64_t v53 = sub_10001C808;
    Swift::String v54 = v31;
    aBlock = _NSConcreteStackBlock;
    uint64_t v50 = *((void *)v23 + 449);
    id v51 = sub_100019674;
    uint64_t v52 = &unk_10005A408;
    uint64_t v32 = _Block_copy(&aBlock);
    uint64_t v33 = v24;
    id v34 = v30;
    swift_release();
    [v34 perform:v32];
    _Block_release(v32);
  }
  uint64_t v35 = *(Class *)((char *)&v10->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
  uint64_t v36 = (void *)swift_allocObject();
  uint64_t v37 = v45;
  v36[2] = v10;
  v36[3] = v37;
  v36[4] = a2;
  uint64_t v53 = sub_10001C818;
  Swift::String v54 = v36;
  aBlock = _NSConcreteStackBlock;
  uint64_t v50 = *((void *)v23 + 449);
  id v51 = sub_10001479C;
  uint64_t v52 = &unk_10005A458;
  uint64_t v38 = _Block_copy(&aBlock);
  uint64_t v39 = v10;
  id v40 = v35;
  swift_retain();
  swift_release();
  [v40 notifyOnMainQueueWithBlock:v38];
  _Block_release(v38);
}

uint64_t sub_10001479C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000147E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100004714(&qword_100060CE0);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8);
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode) & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)GKFriendRequestURLModel);
    swift_bridgeObjectRetain();
    id v10 = [v9 init];
    swift_bridgeObjectRetain();
    NSString v14 = sub_100047E38();
    swift_bridgeObjectRelease();
    [v10 setFriendSupportPageURL:v14];

    NSString v15 = sub_100047E38();
    swift_bridgeObjectRelease();
    [v10 setFriendCode:v15];

    uint64_t v24 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState);
    sub_100048318();
    NSString v16 = sub_100047E38();
    swift_bridgeObjectRelease();
    [v10 setFriendRequestState:v16];

    id v17 = [self local];
    [v10 setInitiator:v17];

    uint64_t v24 = a1;
    sub_100048318();
    NSString v18 = sub_100047E38();
    swift_bridgeObjectRelease();
    [v10 setFriendRequestVersion:v18];

    id v19 = [self _gkGenerateFriendRequestURL:v10];
    if (v19)
    {
      uint64_t v20 = v19;
      sub_100047508();

      uint64_t v21 = sub_100047518();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 0, 1, v21);
    }
    else
    {

      uint64_t v22 = sub_100047518();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
    }
    return sub_10001C758((uint64_t)v6, a2);
  }
  else
  {
LABEL_6:
    uint64_t v11 = sub_100047518();
    os_log_type_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a2, 1, 1, v11);
  }
}

void sub_100014B5C(uint64_t a1, uint64_t a2, int a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = sub_100047768();
  uint64_t v71 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  NSString v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v16 = *(void **)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v72 = ObjectType;
  int v73 = a3;
  uint64_t v74 = a1;
  uint64_t v75 = a2;
  id v76 = a4;
  id v17 = self;
  id v18 = v16;
  id v77 = [v17 local];
  if (![v77 isAuthenticated])
  {
LABEL_17:
    sub_100048298();
    __break(1u);
    return;
  }
  id v19 = [v77 internal];
  id v20 = [v19 playerID];

  uint64_t v21 = sub_100047E68();
  uint64_t v23 = v22;

  id v24 = [v18 internal];
  id v25 = [v24 playerID];

  uint64_t v26 = sub_100047E68();
  uint64_t v28 = v27;

  if (v21 == v26 && v23 == v28)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v30 = sub_100048328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      uint64_t v31 = *(void *)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
      if (v31)
      {
        uint64_t v32 = *(void *)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
        swift_bridgeObjectRetain();
        sub_100047738();
        uint64_t v33 = v6;
        id v34 = sub_100047758();
        os_log_type_t v35 = sub_100048008();
        int v36 = v35;
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v37 = (uint8_t *)swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          uint64_t v67 = v31;
          uint64_t v39 = (void *)v38;
          uint64_t v64 = v38;
          uint64_t v68 = swift_slowAlloc();
          uint64_t v78 = (uint64_t)v33;
          aBlock[0] = v68;
          double v61 = v37;
          *(_DWORD *)uint64_t v37 = 138412546;
          int v66 = v36;
          os_log_t v65 = v34;
          id v63 = aBlock;
          id v40 = v33;
          uint64_t v69 = v32;
          uint64_t v41 = v40;
          sub_100048168();
          *uint64_t v39 = v33;

          uint64_t v42 = v61;
          *((_WORD *)v61 + 6) = 2080;
          double v62 = v42 + 14;
          uint64_t v43 = v41;
          id v44 = [v43 description];
          uint64_t v45 = sub_100047E68();
          Swift::String v70 = v33;
          unint64_t v47 = v46;

          uint64_t v78 = sub_100046724(v45, v47, aBlock);
          sub_100048168();

          uint64_t v33 = v70;
          swift_bridgeObjectRelease();
          os_log_t v48 = v65;
          _os_log_impl((void *)&_mh_execute_header, v65, (os_log_type_t)v66, "%@ ACCEPT friend request for playerModel: %s", v42, 0x16u);
          sub_100004714((uint64_t *)&unk_100060CB0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v71 + 8))(v15, v13);
        char v50 = v73;
        uint64_t v51 = v72;
        NSString v52 = sub_100047E38();
        swift_bridgeObjectRelease();
        uint64_t v53 = swift_allocObject();
        uint64_t v54 = v50 & 1;
        *(unsigned char *)(v53 + 16) = v54;
        uint64_t v55 = v74;
        uint64_t v56 = v75;
        *(void *)(v53 + 24) = v33;
        *(void *)(v53 + 32) = v55;
        Swift::String_optional v57 = v76;
        *(void *)(v53 + 40) = v56;
        *(void *)(v53 + 48) = v57;
        *(void *)(v53 + 56) = a5;
        *(void *)(v53 + 64) = v51;
        aBlock[4] = (uint64_t)sub_10001FAF0;
        aBlock[5] = v53;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_10001728C;
        aBlock[3] = (uint64_t)&unk_10005A750;
        Swift::String v58 = _Block_copy(aBlock);
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v59 = v33;
        swift_release();
        [v77 acceptFriendRequestWithIdentifier:v52 sendPush:v54 handler:v58];

        _Block_release(v58);
        return;
      }
    }
  }
  v76(0);

  id v49 = v77;
}

void sub_1000151CC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = sub_100047768();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v67 = (char *)v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v15 = *(void **)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  if (!v15
    || (uint64_t v64 = v13,
        uint64_t v65 = v12,
        uint64_t v66 = ObjectType,
        NSString v16 = self,
        id v17 = v15,
        id v68 = [v16 local],
        ![v68 isAuthenticated]))
  {
    sub_100048298();
    __break(1u);
    return;
  }
  if (v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] > 3u) {
    goto LABEL_11;
  }
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  id v63 = a3;
  id v18 = [v68 internal];
  id v19 = [v18 playerID];

  uint64_t v20 = sub_100047E68();
  uint64_t v22 = v21;

  id v23 = [v17 internal];
  id v24 = [v23 playerID];

  uint64_t v25 = sub_100047E68();
  uint64_t v27 = v26;

  if (v20 == v25 && v22 == v27)
  {
    swift_bridgeObjectRelease_n();
    v63(0);
LABEL_12:

    id v48 = v68;

    return;
  }
  char v28 = sub_100048328();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v29 = v62;
  a3 = v63;
  if ((v28 & 1) != 0 || !*(void *)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
  {
LABEL_11:
    a3(0);
    goto LABEL_12;
  }
  uint64_t v30 = *(void *)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  swift_bridgeObjectRetain();
  uint64_t v31 = v67;
  sub_100047738();
  uint64_t v32 = v5;
  uint64_t v33 = sub_100047758();
  os_log_type_t v34 = sub_100048008();
  int v35 = v34;
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v36 = swift_slowAlloc();
    int v57 = v35;
    uint64_t v37 = v36;
    uint64_t v38 = (void *)swift_slowAlloc();
    v55[2] = v38;
    uint64_t v58 = swift_slowAlloc();
    uint64_t v69 = (uint64_t)v32;
    aBlock[0] = v58;
    *(_DWORD *)uint64_t v37 = 138412546;
    uint64_t v59 = v30;
    os_log_t v56 = v33;
    v55[1] = aBlock;
    uint64_t v39 = v32;
    uint64_t v60 = v32;
    id v40 = v39;
    sub_100048168();
    *uint64_t v38 = v60;

    *(_WORD *)(v37 + 12) = 2080;
    uint64_t v41 = v40;
    id v42 = [v41 description];
    uint64_t v43 = sub_100047E68();
    unint64_t v45 = v44;

    uint64_t v32 = v60;
    uint64_t v46 = v43;
    a3 = v63;
    uint64_t v69 = sub_100046724(v46, v45, aBlock);
    sub_100048168();

    swift_bridgeObjectRelease();
    os_log_t v47 = v56;
    _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v57, "%@ Reject friend request for playerModel: %s", (uint8_t *)v37, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v64 + 8))(v67, v65);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v64 + 8))(v31, v65);
  }
  NSString v49 = sub_100047E38();
  swift_bridgeObjectRelease();
  char v50 = (void *)swift_allocObject();
  uint64_t v51 = v61;
  v50[2] = v32;
  v50[3] = v51;
  v50[4] = v29;
  v50[5] = a3;
  uint64_t v52 = v66;
  v50[6] = a4;
  v50[7] = v52;
  aBlock[4] = (uint64_t)sub_10001FA44;
  aBlock[5] = (uint64_t)v50;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001728C;
  aBlock[3] = (uint64_t)&unk_10005A6D8;
  uint64_t v53 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v54 = v32;
  swift_release();
  [v68 rejectFriendRequestWithIdentifier:v49 handler:v53];

  _Block_release(v53);
}

unint64_t sub_100015860@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001C6C8(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_10001588C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001C6D8(*a1);
  *a2 = result;
  return result;
}

void sub_1000158B8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000158C4(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v2._countAndFlagsBits = 0xD000000000000019;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "FRIEND_REQUEST_CARD_ERROR";
      goto LABEL_8;
    case 2:
      uint64_t v1 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v4 = "FRIEND_REQUEST_ALERT_MESSAGE_EXPIRED";
      goto LABEL_6;
    case 3:
      uint64_t v1 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v4 = "FRIEND_REQUEST_ALERT_MESSAGE_INVALID";
LABEL_6:
      v2._object = (void *)((unint64_t)(v4 - 32) | 0x8000000000000000);
      v2._countAndFlagsBits = 0xD000000000000024;
      goto LABEL_9;
    case 4:
      uint64_t v1 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v2._countAndFlagsBits = 0xD000000000000018;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "NO_NETWORK_ALERT_MESSAGE";
      goto LABEL_8;
    default:
      uint64_t v1 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v2._countAndFlagsBits = 0xD00000000000002ELL;
      v8._countAndFlagsBits = 0xE000000000000000;
      uint64_t v3 = "FRIEND_REQUEST_CARD_SERVER_COMMUNICATION_ERROR";
LABEL_8:
      v2._object = (void *)((unint64_t)(v3 - 32) | 0x8000000000000000);
LABEL_9:
      v9.value._countAndFlagsBits = 0;
      v9.value._object = 0;
      v5.super.Class isa = v1;
      v10._countAndFlagsBits = 0;
      v10._object = (void *)0xE000000000000000;
      uint64_t v6 = sub_100047498(v2, v9, v5, v10, v8);

      return v6;
  }
}

uint64_t sub_100015AB0()
{
  sub_1000481E8(148);
  v1._countAndFlagsBits = 0x6F43646E65697266;
  v1._object = (void *)0xEC000000203A6564;
  sub_100047EB8(v1);
  sub_100004714(&qword_1000611D8);
  sub_100048278();
  v2._countAndFlagsBits = 0xD00000000000001ALL;
  v2._object = (void *)0x800000010004AB20;
  sub_100047EB8(v2);
  sub_100048278();
  v3._countAndFlagsBits = 0xD000000000000014;
  v3._object = (void *)0x800000010004AB40;
  sub_100047EB8(v3);
  sub_100048278();
  v4._countAndFlagsBits = 0xD000000000000019;
  v4._object = (void *)0x800000010004AB60;
  sub_100047EB8(v4);
  sub_100004714(&qword_100061270);
  sub_100048278();
  v5._countAndFlagsBits = 0xD000000000000015;
  v5._object = (void *)0x800000010004AB80;
  sub_100047EB8(v5);
  swift_beginAccess();
  sub_100004714(&qword_100061278);
  sub_100048278();
  v6._object = (void *)0xEC000000203A7265;
  v6._countAndFlagsBits = 0x79616C70200A202CLL;
  sub_100047EB8(v6);
  sub_100004714(&qword_100061280);
  sub_100048278();
  v7._object = (void *)0x800000010004ABA0;
  v7._countAndFlagsBits = 0xD000000000000012;
  sub_100047EB8(v7);
  sub_100048278();
  return 0;
}

uint64_t sub_100015D78(char a1)
{
  return qword_10004C6D0[a1];
}

uint64_t *sub_100015D98@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

id sub_100015DB0(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1000475C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::String_optional v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v10 = (uint64_t *)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  uint64_t v11 = v2;
  sub_1000475B8();
  uint64_t v12 = sub_1000475A8();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *Swift::String v10 = v12;
  v10[1] = v14;
  NSString v15 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *(void *)NSString v15 = 0;
  *((void *)v15 + 1) = 0;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  NSString v16 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(void *)NSString v16 = 0;
  *((void *)v16 + 1) = 0;
  id v17 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(void *)id v17 = 0;
  *((void *)v17 + 1) = 0;
  id v18 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(void *)id v18 = 0;
  *((void *)v18 + 1) = 0;
  id v19 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(void *)id v19 = 0;
  v19[8] = 1;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  uint64_t v20 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  id v21 = objc_allocWithZone((Class)GKDispatchGroup);
  NSString v22 = sub_100047E38();
  id v23 = [v21 initWithName:v22];

  *(void *)&v11[v20] = v23;
  *(void *)NSString v16 = a1;
  *((void *)v16 + 1) = a2;

  swift_bridgeObjectRelease();
  v25.receiver = v11;
  v25.super_class = ObjectType;
  return [super init];
}

id sub_100015FF0(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1000475C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::String_optional v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v10 = (uint64_t *)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  uint64_t v11 = v2;
  sub_1000475B8();
  uint64_t v12 = sub_1000475A8();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *Swift::String v10 = v12;
  v10[1] = v14;
  NSString v15 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *(void *)NSString v15 = 0;
  *((void *)v15 + 1) = 0;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  NSString v16 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(void *)NSString v16 = 0;
  *((void *)v16 + 1) = 0;
  id v17 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(void *)id v17 = 0;
  *((void *)v17 + 1) = 0;
  id v18 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(void *)id v18 = 0;
  *((void *)v18 + 1) = 0;
  id v19 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(void *)id v19 = 0;
  v19[8] = 1;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(void *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  uint64_t v20 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  id v21 = objc_allocWithZone((Class)GKDispatchGroup);
  NSString v22 = sub_100047E38();
  id v23 = [v21 initWithName:v22];

  *(void *)&v11[v20] = v23;
  *(void *)NSString v15 = a1;
  *((void *)v15 + 1) = a2;

  swift_bridgeObjectRelease();
  v25.receiver = v11;
  v25.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100016230(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_100048228();
      }
      uint64_t v7 = (uint64_t)sub_10001A668(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        NSString v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        id v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_10001A580(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_100016480(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  if (!a6)
  {
    uint64_t v14 = (void *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    *uint64_t v14 = a1;
    v14[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    NSString v15 = (void *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
    swift_beginAccess();
    *NSString v15 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (a4)
    {
      id v16 = [a4 integerValue];
      uint64_t v17 = a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount;
      *(void *)uint64_t v17 = v16;
      *(unsigned char *)(v17 + 8) = 0;
    }
    id v18 = [a5 integerValue];
    if ((unint64_t)v18 >= 6) {
      char v19 = 5;
    }
    else {
      char v19 = (char)v18;
    }
    *(unsigned char *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = v19;
  }
  return a8(a6);
}

uint64_t sub_100016598(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v9 = a3;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, void *, id, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v11 = sub_100047E68();
    uint64_t v13 = v12;
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
  if (a3) {
LABEL_3:
  }
    uint64_t v9 = sub_100047F58();
LABEL_4:
  swift_retain();
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v10(v11, v13, v9, a4, v15, a6);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100016698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t))
{
  if (a5)
  {
    char v10 = 3;
    uint64_t v11 = &OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
LABEL_5:
    *(unsigned char *)(a6 + *v11) = v10;
    return a7(a5);
  }
  if (a2)
  {
    id v14 = (void *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode);
    *id v14 = a1;
    v14[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v15 = (void *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL);
    *id v15 = a3;
    v15[1] = a4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    char v10 = 1;
    uint64_t v11 = &OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
    goto LABEL_5;
  }
  return a7(a5);
}

uint64_t sub_100016764(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_100047E68();
    uint64_t v9 = v8;
    if (v5)
    {
LABEL_3:
      uint64_t v10 = sub_100047E68();
      uint64_t v5 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  swift_retain();
  id v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100016834(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  if (!a1)
  {
    if (a2)
    {
      id v11 = [self local];
      id v12 = [v11 internal];

      id v13 = [v12 playerID];
      uint64_t v14 = sub_100047E68();
      uint64_t v16 = v15;

      uint64_t v17 = (char **)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
      swift_beginAccess();
      id v18 = *v17;
      if (*v17)
      {
        uint64_t v25 = v16;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v17 = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          id v18 = sub_10001A3B8(0, *((void *)v18 + 2) + 1, 1, v18);
          *uint64_t v17 = v18;
        }
        unint64_t v21 = *((void *)v18 + 2);
        unint64_t v20 = *((void *)v18 + 3);
        if (v21 >= v20 >> 1)
        {
          id v18 = sub_10001A3B8((char *)(v20 > 1), v21 + 1, 1, v18);
          *uint64_t v17 = v18;
        }
        *((void *)v18 + 2) = v21 + 1;
        char v22 = &v18[16 * v21];
        *((void *)v22 + 4) = v14;
        *((void *)v22 + 5) = v25;
        swift_endAccess();
      }
      else
      {
        swift_endAccess();
        sub_100004714(&qword_1000611B0);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_10004BE20;
        *(void *)(v23 + 32) = v14;
        *(void *)(v23 + 40) = v16;
        *uint64_t v17 = (char *)v23;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      *(unsigned char *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 2;
      *(unsigned char *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = 0;
    }
    sub_100016A48(a4, a5);
  }
  return a6(a1);
}

void sub_100016A48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100047768();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v47 - v8;
  if (!a2) {
    return;
  }
  uint64_t v10 = self;
  NSString v11 = sub_100047E38();
  id v12 = [v10 predicateWithPhoneNumberOrEmail:v11];

  if (!v12) {
    return;
  }
  id v13 = [objc_allocWithZone((Class)CNContactStore) init];
  if (qword_100060740 != -1) {
    swift_once();
  }
  sub_100004714(&qword_1000611F0);
  Class isa = sub_100047F48().super.isa;
  aBlock[0] = 0;
  id v15 = [v13 unifiedContactsMatchingPredicate:v12 keysToFetch:isa error:aBlock];

  id v16 = aBlock[0];
  if (!v15)
  {
    uint64_t v31 = v13;
    id v32 = aBlock[0];
    sub_1000474E8();

    swift_willThrow();
    sub_100047738();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v33 = sub_100047758();
    os_log_type_t v34 = sub_100048008();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v49 = v4;
      uint64_t v37 = (void *)v36;
      id v52 = (id)swift_slowAlloc();
      aBlock[0] = v52;
      *(_DWORD *)uint64_t v35 = 136315650;
      uint64_t v38 = sub_100048398();
      uint64_t v53 = sub_100046724(v38, v39, (uint64_t *)aBlock);
      id v50 = v12;
      sub_100048168();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      uint64_t v53 = sub_100046724(0xD000000000000019, 0x800000010004AA30, (uint64_t *)aBlock);
      sub_100048168();
      *(_WORD *)(v35 + 22) = 2112;
      swift_errorRetain();
      uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v53 = v40;
      sub_100048168();
      *uint64_t v37 = v40;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s %s - Error fetching contacts: %@", (uint8_t *)v35, 0x20u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v3);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    return;
  }
  sub_100010B0C(0, &qword_1000611F8);
  unint64_t v17 = sub_100047F58();
  id v18 = v16;

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_1000482A8();
    swift_bridgeObjectRelease();
    if (v46 >= 1) {
      goto LABEL_8;
    }
LABEL_21:
    swift_bridgeObjectRelease();

    return;
  }
  if (*(uint64_t *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1) {
    goto LABEL_21;
  }
LABEL_8:
  if ((v17 & 0xC000000000000001) != 0)
  {
    id v19 = (id)sub_100048208();
  }
  else
  {
    if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v19 = *(id *)(v17 + 32);
  }
  unint64_t v20 = v19;
  id v51 = v13;
  swift_bridgeObjectRelease();
  sub_100047718();
  id v52 = v20;
  unint64_t v21 = sub_100047758();
  os_log_type_t v22 = sub_100048008();
  uint64_t v23 = (SEL *)&unk_10005E000;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v24 = swift_slowAlloc();
    id v48 = (void *)swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v49 = v4;
    uint64_t v53 = sub_100046724(0xD000000000000019, 0x800000010004AA30, (uint64_t *)aBlock);
    id v50 = v12;
    sub_100048168();
    *(_WORD *)(v24 + 12) = 2080;
    v47[1] = v24 + 14;
    id v25 = v52;
    id v26 = [v52 identifier];
    uint64_t v27 = sub_100047E68();
    unint64_t v29 = v28;

    uint64_t v30 = v27;
    uint64_t v23 = (SEL *)&unk_10005E000;
    uint64_t v53 = sub_100046724(v30, v29, (uint64_t *)aBlock);
    id v12 = v50;
    sub_100048168();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s - Adding %s to the deny list.", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v3);
  }
  else
  {

    id v41 = v52;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  id v42 = [self proxyForLocalPlayer];
  id v43 = [v42 utilityServicePrivate];

  NSString v44 = [v52 v23[492]];
  if (!v44)
  {
    sub_100047E68();
    NSString v44 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10001728C;
  aBlock[3] = &unk_10005A700;
  unint64_t v45 = _Block_copy(aBlock);
  [v43 denyContact:v44 handler:v45];

  _Block_release(v45);
  swift_unknownObjectRelease();
}

void sub_10001728C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000172F8()
{
  sub_100004714(&qword_100061200);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10004C390;
  *(void *)(v0 + 32) = [self descriptorForRequiredKeysForStyle:0];
  sub_100047E68();
  id v1 = objc_allocWithZone((Class)NSString);
  NSString v2 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithString:v2];

  *(void *)(v0 + 40) = v3;
  sub_100047E68();
  id v4 = objc_allocWithZone((Class)NSString);
  NSString v5 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithString:v5];

  *(void *)(v0 + 48) = v6;
  sub_100047E68();
  id v7 = objc_allocWithZone((Class)NSString);
  NSString v8 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithString:v8];

  *(void *)(v0 + 56) = v9;
  sub_100047E68();
  id v10 = objc_allocWithZone((Class)NSString);
  NSString v11 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithString:v11];

  *(void *)(v0 + 64) = v12;
  sub_100047E68();
  id v13 = objc_allocWithZone((Class)NSString);
  NSString v14 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithString:v14];

  *(void *)(v0 + 72) = v15;
  uint64_t result = sub_100047F78();
  qword_100064228 = v0;
  return result;
}

uint64_t sub_100017554(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a1;
  v9[5] = a2;
  id v10 = a4;
  id v11 = a5;
  swift_retain();
  sub_100013CEC((void (*)(id, void))sub_10001C870);

  return swift_release();
}

void sub_1000175F8(NSObject *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void), NSObject *a6)
{
  id v120 = a4;
  uint64_t v11 = sub_100047768();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  long long v114 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  long long v113 = (char *)&v106 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  double v112 = (char *)&v106 - v18;
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)&v106 - v19;
  sub_100047738();
  id v21 = a3;
  os_log_type_t v22 = a1;
  swift_errorRetain();
  uint64_t v23 = (char *)v21;
  long long v121 = v22;
  swift_errorRetain();
  uint64_t v24 = sub_100047758();
  os_log_type_t v25 = sub_100048008();
  int v118 = v25;
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v119 = v12;
  os_log_t v115 = a1;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v116 = v11;
    uint64_t v28 = v27;
    uint64_t v29 = swift_slowAlloc();
    long long v117 = a5;
    uint64_t v30 = (void *)v29;
    uint64_t v108 = v29;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v110 = v31;
    *(_DWORD *)uint64_t v28 = 138412802;
    os_log_t v109 = v24;
    uint64_t v122 = (uint64_t)v23;
    aBlock[0] = v31;
    id v32 = v23;
    long long v111 = a6;
    uint64_t v33 = v32;
    sub_100048168();
    *uint64_t v30 = v23;

    *(_WORD *)(v28 + 12) = 2080;
    uint64_t v122 = (uint64_t)a1;
    sub_100004714(&qword_1000611B8);
    uint64_t v34 = sub_100048158();
    uint64_t v122 = sub_100046724(v34, v35, aBlock);
    sub_100048168();
    uint64_t v36 = v121;

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2080;
    uint64_t v122 = a2;
    sub_100004714((uint64_t *)&unk_1000611C0);
    uint64_t v37 = sub_100048158();
    uint64_t v122 = sub_100046724(v37, v38, aBlock);
    a6 = v111;
    sub_100048168();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    os_log_t v39 = v109;
    _os_log_impl((void *)&_mh_execute_header, v109, (os_log_type_t)v118, "%@ authCompleted: %s error: %s)", (uint8_t *)v28, 0x20u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    a5 = v117;
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v11 = v116;
    swift_slowDealloc();

    uint64_t v40 = v119;
  }
  else
  {
    id v41 = v121;

    swift_errorRelease();
    swift_errorRelease();

    uint64_t v40 = v12;
  }
  id v42 = *(void (**)(char *, uint64_t))(v40 + 8);
  v42(v20, v11);
  id v43 = v120;
  if (a2)
  {
    NSString v44 = (void *)sub_1000474D8();
    [v43 setError:v44];

LABEL_7:
    a5();
    return;
  }
  [v120 setError:0];
  uint64_t v45 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  if (*(void *)&v23[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player]) {
    goto LABEL_7;
  }
  uint64_t v46 = (uint64_t *)&v23[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  uint64_t v47 = *(void *)&v23[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8];
  os_log_t v48 = v115;
  uint64_t v116 = v11;
  long long v117 = a5;
  double v107 = v23;
  if (!v115)
  {
    swift_bridgeObjectRetain();
    if (!v47) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
  uint64_t v49 = *v46;
  swift_bridgeObjectRetain();
  id v50 = [v121 internal];
  id v51 = [v50 playerID];

  uint64_t v52 = sub_100047E68();
  uint64_t v54 = v53;

  if (!v47)
  {
    os_log_t v48 = v115;
    if (!v54) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
  if (!v54)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (v49 == v52 && v47 == v54)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    os_log_t v48 = v115;
LABEL_30:
    id v77 = v107;
    uint64_t v78 = *(void **)&v107[v45];
    *(void *)&v107[v45] = v48;
    Swift::String v79 = v121;

    Swift::String v80 = *(void **)&v77[v45];
    if (v80)
    {
      id v81 = [v80 internal];
      id v82 = [v81 playerID];

      uint64_t v83 = sub_100047E68();
      uint64_t v85 = v84;
    }
    else
    {
      uint64_t v83 = 0;
      uint64_t v85 = 0;
    }
    *uint64_t v46 = v83;
    v46[1] = v85;

    uint64_t v86 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v117)(v86);
    return;
  }
  char v76 = sub_100048328();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_t v48 = v115;
  if (v76) {
    goto LABEL_30;
  }
LABEL_18:
  unint64_t v55 = v46[1];
  if (!v55 || (uint64_t v56 = *v46, *v46 == 0x496E776F6E6B6E55) && v55 == 0xE900000000000044 || (sub_100048328() & 1) != 0)
  {
    id v57 = v107;
    if (*(void *)&v107[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
    {
      uint64_t v58 = v114;
      sub_100047738();
      uint64_t v59 = v57;
      uint64_t v60 = sub_100047758();
      os_log_type_t v61 = sub_100048008();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = (uint8_t *)swift_slowAlloc();
        long long v121 = swift_slowAlloc();
        *(_DWORD *)uint64_t v62 = 138412290;
        aBlock[0] = (uint64_t)v59;
        id v63 = a6;
        uint64_t v64 = v59;
        uint64_t v58 = v114;
        sub_100048168();
        v121->Class isa = (Class)v59;

        a6 = v63;
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "%@ We have a non nil friend code, fetching sender playerID", v62, 0xCu);
        sub_100004714((uint64_t *)&unk_100060CB0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v60 = v59;
      }
      uint64_t v72 = v116;
      uint64_t v71 = v117;
      id v73 = v120;

      v42(v58, v72);
      uint64_t v74 = v59;
      id v75 = v73;
      swift_retain();
      sub_10001F074(v74, v75, v74, (uint64_t (*)(void))v71, a6);
    }
    else
    {
      sub_100047738();
      uint64_t v65 = v57;
      uint64_t v66 = sub_100047758();
      os_log_type_t v67 = sub_100048008();
      if (os_log_type_enabled(v66, v67))
      {
        id v68 = (uint8_t *)swift_slowAlloc();
        long long v121 = swift_slowAlloc();
        *(_DWORD *)id v68 = 138412290;
        aBlock[0] = (uint64_t)v65;
        uint64_t v69 = a6;
        Swift::String v70 = v65;
        sub_100048168();
        v121->Class isa = (Class)v65;

        a6 = v69;
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "%@ Creating a new friend request", v68, 0xCu);
        sub_100004714((uint64_t *)&unk_100060CB0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v66 = v65;
      }
      uint64_t v87 = (uint64_t)v117;

      v42(v113, v116);
      uint64_t v74 = v65;
      swift_retain();
      sub_10001C168((unsigned __int8 *)v74, v74, v87, (uint64_t)a6);
    }

    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    Swift::String v88 = v112;
    sub_100047738();
    Swift::String v89 = v107;
    swift_bridgeObjectRetain_n();
    double v90 = v89;
    double v91 = sub_100047758();
    os_log_type_t v92 = sub_100048008();
    int v93 = v92;
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v94 = swift_slowAlloc();
      long long v114 = (char *)swift_slowAlloc();
      long long v121 = swift_slowAlloc();
      uint64_t v122 = (uint64_t)v90;
      aBlock[0] = (uint64_t)v121;
      *(_DWORD *)uint64_t v94 = 138412546;
      os_log_t v115 = v91;
      int v118 = v93;
      uint64_t v95 = v90;
      sub_100048168();
      *(void *)long long v114 = v90;

      *(_WORD *)(v94 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_100046724(v56, v55, aBlock);
      sub_100048168();
      swift_bridgeObjectRelease_n();
      os_log_t v96 = v115;
      _os_log_impl((void *)&_mh_execute_header, v115, (os_log_type_t)v118, "%@ loading playerID: %s", (uint8_t *)v94, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      double v97 = v112;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      double v97 = v88;
    }
    v42(v97, v116);
    id v98 = v120;
    uint64_t v99 = self;
    sub_100004714(&qword_1000611B0);
    uint64_t v100 = swift_allocObject();
    *(_OWORD *)(v100 + 16) = xmmword_10004BE20;
    *(void *)(v100 + 32) = v56;
    *(void *)(v100 + 40) = v55;
    Class isa = sub_100047F48().super.isa;
    swift_bridgeObjectRelease();
    long long v102 = (void *)swift_allocObject();
    v102[2] = v90;
    v102[3] = v98;
    v102[4] = v117;
    v102[5] = a6;
    aBlock[4] = (uint64_t)sub_10001F7A8;
    aBlock[5] = (uint64_t)v102;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100018744;
    aBlock[3] = (uint64_t)&unk_10005A4F8;
    long long v103 = _Block_copy(aBlock);
    unsigned __int8 v104 = v90;
    id v105 = v98;
    swift_retain();
    swift_release();
    [v99 loadPlayersForIdentifiers:isa withCompletionHandler:v103];
    _Block_release(v103);
  }
}

void sub_100018298(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(void))
{
  uint64_t v10 = sub_100047768();
  uint64_t v49 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  id v13 = a3;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v14 = (char *)v13;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v15 = sub_100047758();
  os_log_type_t v16 = sub_100048008();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    os_log_t v43 = v15;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    NSString v44 = v12;
    id v21 = (void *)v20;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v50 = (uint64_t)v14;
    uint64_t v51 = v45;
    *(_DWORD *)uint64_t v19 = 138412802;
    HIDWORD(v42) = v17;
    uint64_t v47 = a4;
    os_log_t v48 = a5;
    os_log_type_t v22 = v14;
    uint64_t v46 = v10;
    uint64_t v23 = v22;
    sub_100048168();
    *id v21 = v14;

    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v50 = a1;
    sub_100004714(&qword_1000611D0);
    uint64_t v24 = sub_100048158();
    uint64_t v50 = sub_100046724(v24, v25, &v51);
    sub_100048168();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    uint64_t v50 = a2;
    sub_100004714((uint64_t *)&unk_1000611C0);
    uint64_t v26 = sub_100048158();
    uint64_t v50 = sub_100046724(v26, v27, &v51);
    a4 = v47;
    a5 = v48;
    sub_100048168();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    os_log_t v28 = v43;
    _os_log_impl((void *)&_mh_execute_header, v43, BYTE4(v42), "%@ players: %s error:%s", (uint8_t *)v19, 0x20u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v44, v46);
    if (a2)
    {
LABEL_3:
      uint64_t v29 = (void *)sub_1000474D8();
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v10);
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v29 = 0;
LABEL_6:
  [a4 setError:v29];

  if (a1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v30 = (id)sub_100048208();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v30 = *(id *)(a1 + 32);
    }
  }
  else
  {
    id v30 = [self unknownPlayer];
  }
  uint64_t v31 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  id v32 = *(void **)&v14[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  *(void *)&v14[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = v30;
  id v33 = v30;

  uint64_t v34 = *(void **)&v14[v31];
  if (v34)
  {
    id v35 = [v34 internal];
    id v36 = [v35 playerID];

    uint64_t v37 = sub_100047E68();
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  uint64_t v40 = (uint64_t *)&v14[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *uint64_t v40 = v37;
  v40[1] = v39;

  uint64_t v41 = swift_bridgeObjectRelease();
  a5(v41);
}

uint64_t sub_100018744(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  NSString v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100010B0C(0, (unint64_t *)&qword_100060CE8);
    uint64_t v4 = sub_100047F58();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000187E8(void *a1, void *a2, char *a3, uint64_t (*a4)(void), uint64_t a5)
{
  uint64_t v10 = sub_100047768();
  uint64_t v11 = __chkstk_darwin(v10);
  Swift::String v79 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v74 - v14;
  __chkstk_darwin(v13);
  int v17 = (char *)&v74 - v16;
  Swift::String v80 = v18;
  if (a1) {
    uint64_t v19 = (void *)sub_1000474D8();
  }
  else {
    uint64_t v19 = 0;
  }
  [a2 setError:v19];

  uint64_t v20 = (uint64_t *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  uint64_t v21 = *(void *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8];
  if (!v21)
  {
    Swift::String v79 = a3;
    id v77 = a4;
    sub_100047728();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v27 = sub_100047758();
    os_log_type_t v28 = sub_100048028();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v78 = a5;
    if (v29)
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)id v30 = 136315138;
      uint64_t v75 = v10;
      id v82 = a1;
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v31 = sub_100048158();
      id v82 = (void *)sub_100046724(v31, v32, aBlock);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "getPlayerIDFromFriendCode error:%s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v80[1](v17, v75);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v80[1](v17, v10);
    }
    a4 = v77;
    unint64_t v55 = v79;
    id v56 = [self unknownPlayer];
    uint64_t v57 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    uint64_t v58 = *(void **)&v55[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
    *(void *)&v55[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = v56;
    id v59 = v56;

    uint64_t v60 = *(void **)&v55[v57];
    if (v60)
    {
      id v61 = [v60 internal];
      id v62 = [v61 playerID];

      uint64_t v63 = sub_100047E68();
      uint64_t v65 = v64;
    }
    else
    {
      uint64_t v63 = 0;
      uint64_t v65 = 0;
    }
    *uint64_t v20 = v63;
    v20[1] = v65;

    uint64_t v70 = swift_bridgeObjectRelease();
    uint64_t v71 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
    v55[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 2;
    if (a1)
    {
      aBlock[0] = (uint64_t)a1;
      swift_errorRetain();
      sub_100004714(&qword_1000611E0);
      sub_100010B0C(0, &qword_1000611E8);
      uint64_t v70 = swift_dynamicCast();
      if (v70)
      {
        uint64_t v72 = v82;
        char v73 = sub_10001C080(v82);

        if (v73) {
          v55[v71] = 4;
        }
      }
    }
    return a4(v70);
  }
  uint64_t v22 = *v20;
  if (v22 == sub_100047E68() && v21 == v23)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  unint64_t v25 = a3;
  char v26 = sub_100048328();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    uint64_t v66 = (void *)swift_allocObject();
    v66[2] = v22;
    v66[3] = v21;
    v66[4] = v25;
    v66[5] = a2;
    aBlock[4] = (uint64_t)sub_10001F884;
    aBlock[5] = (uint64_t)v66;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100019674;
    aBlock[3] = (uint64_t)&unk_10005A5C0;
    os_log_type_t v67 = _Block_copy(aBlock);
    id v68 = v25;
    id v69 = a2;
    swift_release();
    [v69 perform:v67];
    _Block_release(v67);
    return a4(v70);
  }
  swift_bridgeObjectRelease();
  a3 = v25;
LABEL_14:
  sub_100047738();
  id v33 = a3;
  uint64_t v34 = sub_100047758();
  os_log_type_t v35 = sub_100048008();
  BOOL v36 = os_log_type_enabled(v34, v35);
  char v76 = v33;
  id v77 = a4;
  uint64_t v78 = a5;
  if (v36)
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 138412290;
    aBlock[0] = (uint64_t)v76;
    uint64_t v39 = v76;
    id v33 = v76;
    sub_100048168();
    *uint64_t v38 = v33;

    _os_log_impl((void *)&_mh_execute_header, v34, v35, "%@ We have a non nil friend code, but playerID was unknown.", v37, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v34 = v33;
  }
  uint64_t v40 = v79;
  uint64_t v41 = v80;

  uint64_t v42 = (void (**)(char *, uint64_t))v41[1];
  ((void (*)(char *, uint64_t))v42)(v15, v10);
  uint64_t v43 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
  *((unsigned char *)&v33->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 0;
  sub_100047738();
  NSString v44 = v33;
  uint64_t v45 = sub_100047758();
  os_log_type_t v46 = sub_100048008();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    os_log_t v48 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 138412546;
    Swift::String v80 = v42;
    aBlock[0] = (uint64_t)v44;
    uint64_t v75 = v10;
    uint64_t v49 = v44;
    uint64_t v74 = v43;
    uint64_t v50 = v49;
    sub_100048168();
    *os_log_t v48 = v44;

    *(_WORD *)(v47 + 12) = 2048;
    uint64_t v51 = *((unsigned __int8 *)&v76->isa + v74);

    aBlock[0] = v51;
    uint64_t v10 = v75;
    uint64_t v40 = v79;
    uint64_t v42 = v80;
    sub_100048168();

    _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@ PlayerID was unknown, friendRequestErrorType set to %ld.", (uint8_t *)v47, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v45 = v44;
  }
  uint64_t v52 = v77;

  uint64_t v53 = ((uint64_t (*)(char *, uint64_t))v42)(v40, v10);
  return v52(v53);
}

void sub_100019018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, void *a6)
{
  sub_100004714(&qword_1000611B0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10004BE20;
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  uint64_t v13 = &a5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
  swift_beginAccess();
  uint64_t v14 = *(void **)v13;
  if (*(void *)v13 && v14[2])
  {
    uint64_t v16 = v14[4];
    unint64_t v15 = v14[5];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    int v17 = sub_10001A3B8((char *)1, 2, 1, (char *)v12);
    *((void *)v17 + 2) = 2;
    *((void *)v17 + 6) = v16;
    *((void *)v17 + 7) = v15;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  uint64_t v18 = self;
  Class isa = sub_100047F48().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a6;
  v20[3] = a5;
  v20[4] = v16;
  v20[5] = v15;
  v20[6] = a1;
  v20[7] = a2;
  aBlock[4] = sub_10001F8E0;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100018744;
  aBlock[3] = &unk_10005A610;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = a6;
  uint64_t v23 = a5;
  swift_retain();
  swift_release();
  [v18 loadPlayersForIdentifiers:isa withCompletionHandler:v21];
  _Block_release(v21);
}

uint64_t sub_100019210(unint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  if (a2) {
    uint64_t v11 = (void *)sub_1000474D8();
  }
  else {
    uint64_t v11 = 0;
  }
  [a3 setError:v11];

  uint64_t v12 = (void *)&unk_100061000;
  if (!a1) {
    goto LABEL_33;
  }
  id v61 = a7;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000482A8();
    uint64_t v13 = result;
    if (result) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
  uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    a7 = v61;
    uint64_t v12 = &unk_100061000;
LABEL_33:
    uint64_t v38 = v12[34];
    uint64_t v39 = *(void **)(a4 + v38);
    if (v39)
    {
      uint64_t v40 = *(void **)(a4 + v38);
      id v41 = v40;
    }
    else
    {
      id v41 = [self unknownPlayer];
      uint64_t v40 = 0;
      uint64_t v39 = *(void **)(a4 + v38);
    }
    *(void *)(a4 + v38) = v41;
    id v42 = v41;
    id v43 = v40;

    NSString v44 = *(void **)(a4 + v38);
    if (v44)
    {
      id v45 = [v44 internal];
      id v46 = [v45 playerID];

      uint64_t v47 = sub_100047E68();
      uint64_t v49 = v48;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v49 = 0;
    }
    uint64_t v50 = (uint64_t *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    *uint64_t v50 = v47;
    v50[1] = v49;

    uint64_t v51 = swift_bridgeObjectRelease();
    uint64_t v52 = *(void **)(a4 + v38);
    if (!v52) {
      return a7(v51);
    }
    id v53 = v52;
    id v54 = [v53 internal];
    id v55 = [v54 playerID];

    uint64_t v56 = sub_100047E68();
    uint64_t v58 = v57;

    if (!v58) {
      return a7(v51);
    }
    if (v56 == 0x496E776F6E6B6E55 && v58 == 0xE900000000000044)
    {
      uint64_t v51 = swift_bridgeObjectRelease();
    }
    else
    {
      char v60 = sub_100048328();
      uint64_t v51 = swift_bridgeObjectRelease();
      if ((v60 & 1) == 0) {
        return a7(v51);
      }
    }
    *(unsigned char *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 0;
    return a7(v51);
  }
LABEL_7:
  if (v13 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = (uint64_t *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    uint64_t v62 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer;
    uint64_t v17 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v26 = (id)sub_100048208();
      }
      else {
        id v26 = *(id *)(a1 + 8 * v15 + 32);
      }
      unint64_t v27 = v26;
      id v28 = [v26 internal];
      id v29 = [v28 playerID];

      uint64_t v30 = sub_100047E68();
      uint64_t v32 = v31;

      uint64_t v33 = v16[1];
      if (v33)
      {
        BOOL v34 = *v16 == v30 && v33 == v32;
        if (v34 || (sub_100048328() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = *(void **)(a4 + v17);
          *(void *)(a4 + v17) = v27;
          id v19 = v27;

          uint64_t v20 = *(void **)(a4 + v17);
          if (v20)
          {
            id v21 = [v20 internal];
            id v22 = [v21 playerID];

            uint64_t v23 = sub_100047E68();
            uint64_t v25 = v24;
          }
          else
          {
            uint64_t v23 = 0;
            uint64_t v25 = 0;
          }
          *uint64_t v16 = v23;
          v16[1] = v25;

          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      if (v30 == a5 && v32 == a6) {
        break;
      }
      char v36 = sub_100048328();
      swift_bridgeObjectRelease();
      if (v36) {
        goto LABEL_29;
      }

LABEL_12:
      if (v13 == ++v15) {
        goto LABEL_32;
      }
    }
    swift_bridgeObjectRelease();
LABEL_29:
    uint64_t v37 = *(void **)(a4 + v62);
    *(void *)(a4 + v62) = v27;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100019674(uint64_t a1, void *aBlock)
{
  NSString v2 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  id v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_10001C85C, v4);
  swift_release();

  return swift_release();
}

uint64_t sub_100019708(uint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  if (result)
  {
    id v5 = [self unknownPlayer];
    uint64_t v6 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    id v7 = *(void **)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
    *(void *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player) = v5;
    id v8 = v5;

    id v9 = *(void **)(a2 + v6);
    if (v9)
    {
      id v10 = [v9 internal];
      id v11 = [v10 playerID];

      uint64_t v12 = sub_100047E68();
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v14 = 0;
    }
    uint64_t v15 = (uint64_t *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    *uint64_t v15 = v12;
    v15[1] = v14;

    swift_bridgeObjectRelease();
    uint64_t v16 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
    *(unsigned char *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 2;
    swift_errorRetain();
    sub_100004714(&qword_1000611E0);
    sub_100010B0C(0, &qword_1000611E8);
    if (swift_dynamicCast())
    {
      char v17 = sub_10001C080(v18);

      if (v17) {
        *(unsigned char *)(a2 + v16) = 4;
      }
    }
    return a3();
  }
  return result;
}

void sub_10001989C(uint64_t a1, void (*a2)(void *, id))
{
  uint64_t v4 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  id v5 = *(void **)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
  if (v5)
  {
    id v6 = v5;
    if ([v6 isFriend])
    {
      id v7 = [v6 friendBiDirectional];
      sub_100010B0C(0, (unint64_t *)&unk_100060CF0);
      Class isa = sub_1000480E8(1).super.super.isa;
      unsigned __int8 v9 = [v7 isEqualToNumber:isa];

      if (v9) {
        *(unsigned char *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 2;
      }
    }
    else
    {
    }
  }
  id v10 = *(void **)(a1 + v4);
  id v11 = *(void **)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
  id v12 = v10;
  id v13 = [v11 error];
  a2(v10, v13);
}

void sub_1000199F0(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  sub_100010B0C(0, &qword_100061288);
  id v6 = (void *)sub_100048048();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  *(void *)(v7 + 24) = v6;
  uint64_t v18 = sub_10002024C;
  id v19 = (void *)v7;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_100019674;
  char v17 = &unk_10005A818;
  id v8 = _Block_copy(&v14);
  id v9 = v3;
  id v10 = v6;
  swift_release();
  [v10 perform:v8];
  _Block_release(v8);
  id v11 = (void *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = v10;
  uint64_t v18 = sub_100020294;
  id v19 = v11;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_10001479C;
  char v17 = &unk_10005A868;
  id v12 = _Block_copy(&v14);
  id v13 = v10;
  swift_retain();
  swift_release();
  [v13 notifyOnMainQueueWithBlock:v12];
  _Block_release(v12);
}

uint64_t sub_100019BF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a4;
  v7[3] = a1;
  v7[4] = a2;
  id v8 = a4;
  swift_retain();
  sub_100014200((uint64_t)sub_100020304, (uint64_t)v7);

  return swift_release();
}

uint64_t sub_100019C88(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  if (a2) {
    id v6 = (void *)sub_1000474D8();
  }
  else {
    id v6 = 0;
  }
  [a3 setError:v6];

  return a4();
}

void sub_100019D20()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v1 = *(void **)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
}

id sub_100019DE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for PlayerModel()
{
  return self;
}

ValueMetadata *type metadata accessor for PlayerModel.FriendRequestErrorType()
{
  return &type metadata for PlayerModel.FriendRequestErrorType;
}

uint64_t _s26GameCenterMessageExtension11PlayerModelC18FriendRequestStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s26GameCenterMessageExtension11PlayerModelC18FriendRequestStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A084);
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

ValueMetadata *type metadata accessor for PlayerModel.FriendRequestState()
{
  return &type metadata for PlayerModel.FriendRequestState;
}

uint64_t getEnumTagSinglePayload for PlayerModel.FriendCodeState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PlayerModel.FriendCodeState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A218);
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

ValueMetadata *type metadata accessor for PlayerModel.FriendCodeState()
{
  return &type metadata for PlayerModel.FriendCodeState;
}

unint64_t sub_10001A254()
{
  unint64_t result = qword_100061190;
  if (!qword_100061190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061190);
  }
  return result;
}

unint64_t sub_10001A2AC()
{
  unint64_t result = qword_100061198;
  if (!qword_100061198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061198);
  }
  return result;
}

unint64_t sub_10001A304()
{
  unint64_t result = qword_1000611A0;
  if (!qword_1000611A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000611A0);
  }
  return result;
}

uint64_t sub_10001A358(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10001A390(uint64_t (*a1)(void))
{
  return a1();
}

char *sub_10001A3B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004714(&qword_1000611B0);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      id v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001F8F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_10001A4C8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100048168();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unsigned __int8 *sub_10001A580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100047F28();
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
  uint64_t v5 = sub_10001A8E4();
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
    uint64_t v7 = (unsigned __int8 *)sub_100048228();
  }
LABEL_7:
  int64_t v11 = sub_10001A668(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10001A668(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  uint64_t v18 = result + 1;
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

uint64_t sub_10001A8E4()
{
  unint64_t v0 = sub_100047F38();
  uint64_t v4 = sub_10001A964(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10001A964(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10001AABC(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100046BC4(v9, 0),
          unint64_t v12 = sub_10001ABBC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100047E98();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100047E98();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100048228();
LABEL_4:

  return sub_100047E98();
}

uint64_t sub_10001AABC(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_100046C2C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100046C2C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10001ABBC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_100046C2C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_100047F08();
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
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_100048228();
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
    unint64_t result = sub_100046C2C(v12, a6, a7);
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
    unint64_t v12 = sub_100047ED8();
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

void sub_10001ADD0(unsigned __int8 *a1, void *a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  uint64_t v9 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release();
LABEL_13:
    sub_100048298();
    __break(1u);
    return;
  }
  unint64_t v10 = self;
  id v11 = a2;
  id v38 = [v10 local];
  if (![v38 isAuthenticated])
  {

    swift_release();
    goto LABEL_13;
  }
  if (a1[v9])
  {
    sub_1000339C8(0, v11);
    swift_release();
    id v12 = v38;
  }
  else
  {
    sub_100047738();
    uint64_t v13 = a1;
    uint64_t v14 = sub_100047758();
    os_log_type_t v15 = sub_100048008();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      int v35 = v16;
      uint64_t v18 = v17;
      char v19 = (void *)swift_slowAlloc();
      BOOL v34 = v19;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v39 = (uint64_t)v13;
      aBlock[0] = v36;
      *(_DWORD *)uint64_t v18 = 138412546;
      os_log_t v33 = v14;
      char v20 = v13;
      uint64_t v37 = v5;
      uint64_t v21 = v20;
      sub_100048168();
      *char v19 = v13;

      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v32 = v18 + 14;
      uint64_t v22 = v21;
      id v23 = [v22 description];
      uint64_t v24 = sub_100047E68();
      unint64_t v26 = v25;

      uint64_t v39 = sub_100046724(v24, v26, aBlock);
      sub_100048168();

      swift_bridgeObjectRelease();
      os_log_t v27 = v33;
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v35, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v18, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    NSString v28 = sub_100047E38();
    id v29 = (void *)swift_allocObject();
    v29[2] = v13;
    v29[3] = sub_100020368;
    v29[4] = v8;
    aBlock[4] = (uint64_t)sub_1000205F4;
    aBlock[5] = (uint64_t)v29;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016764;
    aBlock[3] = (uint64_t)&unk_10005A980;
    uint64_t v30 = _Block_copy(aBlock);
    uint64_t v31 = v13;
    swift_retain();
    swift_release();
    [v38 createFriendRequestWithIdentifier:v28 handler:v30];

    _Block_release(v30);
    swift_release();
  }
}

void sub_10001B320(unsigned __int8 *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  uint64_t v11 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release();
LABEL_13:
    sub_100048298();
    __break(1u);
    return;
  }
  id v12 = self;
  id v13 = a2;
  swift_retain();
  id v39 = [v12 local];
  if (![v39 isAuthenticated])
  {
    swift_release();

    swift_release();
    goto LABEL_13;
  }
  if (a1[v11])
  {
    sub_100045810(0, (uint8_t *)v13, a3);
    swift_release();
    id v14 = v39;
  }
  else
  {
    sub_100047738();
    os_log_type_t v15 = a1;
    int v16 = sub_100047758();
    os_log_type_t v17 = sub_100048008();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v19 = swift_slowAlloc();
      int v36 = v18;
      uint64_t v20 = v19;
      uint64_t v21 = (void *)swift_slowAlloc();
      int v35 = v21;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v40 = (uint64_t)v15;
      aBlock[0] = v37;
      *(_DWORD *)uint64_t v20 = 138412546;
      uint64_t v38 = v7;
      os_log_t v34 = v16;
      uint64_t v22 = v15;
      sub_100048168();
      *uint64_t v21 = v15;

      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v33 = v20 + 14;
      id v23 = v22;
      id v24 = [v23 description];
      uint64_t v25 = sub_100047E68();
      unint64_t v27 = v26;

      uint64_t v40 = sub_100046724(v25, v27, aBlock);
      sub_100048168();

      swift_bridgeObjectRelease();
      os_log_t v28 = v34;
      _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v36, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v20, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v6);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    NSString v29 = sub_100047E38();
    uint64_t v30 = (void *)swift_allocObject();
    v30[2] = v15;
    v30[3] = sub_10001C728;
    v30[4] = v10;
    aBlock[4] = (uint64_t)sub_10001C734;
    aBlock[5] = (uint64_t)v30;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016764;
    aBlock[3] = (uint64_t)&unk_10005A3B8;
    uint64_t v31 = _Block_copy(aBlock);
    uint64_t v32 = v15;
    swift_retain();
    swift_release();
    [v39 createFriendRequestWithIdentifier:v29 handler:v31];

    _Block_release(v31);
    swift_release();
  }
}

char *sub_10001B888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a2;
  uint64_t v31 = sub_100047408();
  uint64_t v6 = *(void *)(v31 - 8);
  uint64_t v7 = __chkstk_darwin(v31);
  NSString v29 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v23 - v9;
  unint64_t result = (char *)&_swiftEmptyArrayStorage;
  uint64_t v32 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    id v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v15 = *(void *)(v13 + 56);
    unint64_t v25 = (*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64);
    uint64_t v26 = a3;
    uint64_t v16 = a1 + v25;
    v23[1] = v3;
    id v24 = (void (**)(char *, uint64_t))(v13 - 8);
    unint64_t v27 = v14;
    os_log_t v28 = (void (**)(char *, char *, uint64_t))(v13 + 16);
    v14(v10, a1 + v25, v31);
    while (1)
    {
      if (sub_1000473E8() == v30 && v17 == a3)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v18 = sub_100048328();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          (*v24)(v10, v31);
          goto LABEL_4;
        }
      }
      uint64_t v19 = *v28;
      (*v28)(v29, v10, v31);
      uint64_t v20 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100046E18(0, *((void *)v20 + 2) + 1, 1);
        uint64_t v20 = v32;
      }
      unint64_t v22 = *((void *)v20 + 2);
      unint64_t v21 = *((void *)v20 + 3);
      if (v22 >= v21 >> 1)
      {
        sub_100046E18(v21 > 1, v22 + 1, 1);
        uint64_t v20 = v32;
      }
      *((void *)v20 + 2) = v22 + 1;
      v19(&v20[v25 + v22 * v15], v29, v31);
      uint64_t v32 = v20;
      a3 = v26;
LABEL_4:
      v16 += v15;
      if (!--v12) {
        return v32;
      }
      v27(v10, v16, v31);
    }
  }
  return result;
}

void sub_10001BB04(unsigned __int8 *a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = sub_100047768();
  uint64_t v42 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  uint64_t v12 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release();
LABEL_13:
    sub_100048298();
    __break(1u);
    return;
  }
  uint64_t v13 = self;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v43 = [v13 local];
  if (![v43 isAuthenticated])
  {

    swift_release();
    goto LABEL_13;
  }
  if (a1[v12])
  {
    sub_100009B4C(0, v14, (uint64_t)v15, v16);
    swift_release();
    id v17 = v43;
  }
  else
  {
    sub_100047738();
    char v18 = a1;
    uint64_t v19 = sub_100047758();
    os_log_type_t v20 = sub_100048008();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      int v39 = v21;
      uint64_t v23 = v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v40 = v8;
      unint64_t v25 = (void *)v24;
      v38[3] = v24;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v44 = (uint64_t)v18;
      aBlock[0] = v41;
      *(_DWORD *)uint64_t v23 = 138412546;
      v38[2] = aBlock;
      uint64_t v26 = v18;
      sub_100048168();
      *unint64_t v25 = v18;

      *(_WORD *)(v23 + 12) = 2080;
      v38[1] = v23 + 14;
      unint64_t v27 = v26;
      id v28 = [v27 description];
      uint64_t v29 = sub_100047E68();
      uint64_t v30 = v19;
      uint64_t v31 = v42;
      unint64_t v33 = v32;

      uint64_t v44 = sub_100046724(v29, v33, aBlock);
      sub_100048168();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v39, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v23, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v40);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v8);
    }
    NSString v34 = sub_100047E38();
    int v35 = (void *)swift_allocObject();
    v35[2] = v18;
    v35[3] = sub_100020358;
    v35[4] = v11;
    aBlock[4] = (uint64_t)sub_1000205F4;
    aBlock[5] = (uint64_t)v35;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016764;
    aBlock[3] = (uint64_t)&unk_10005A908;
    int v36 = _Block_copy(aBlock);
    uint64_t v37 = v18;
    swift_retain();
    swift_release();
    [v43 createFriendRequestWithIdentifier:v34 handler:v36];

    _Block_release(v36);
    swift_release();
  }
}

uint64_t sub_10001C080(void *a1)
{
  if ([a1 gkIsNotConnectedToInternetError])
  {
    char v2 = 1;
  }
  else if ([a1 code] == (id)3)
  {
    id v3 = [a1 domain];
    uint64_t v4 = sub_100047E68();
    uint64_t v6 = v5;

    if (v4 == sub_100047E68() && v6 == v7) {
      char v2 = 1;
    }
    else {
      char v2 = sub_100048328();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

void sub_10001C168(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100047768();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a4;
  uint64_t v13 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release();
LABEL_13:
    sub_100048298();
    __break(1u);
    return;
  }
  id v14 = self;
  id v15 = a2;
  swift_retain();
  id v41 = [v14 local];
  if (![v41 isAuthenticated])
  {
    swift_release();

    swift_release();
    goto LABEL_13;
  }
  if (a1[v13])
  {
    swift_release();
    id v16 = v41;
  }
  else
  {
    sub_100047738();
    id v17 = a1;
    char v18 = sub_100047758();
    os_log_type_t v19 = sub_100048008();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      int v38 = v20;
      uint64_t v22 = v21;
      uint64_t v23 = (void *)swift_slowAlloc();
      uint64_t v37 = v23;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v42 = (uint64_t)v17;
      aBlock[0] = v39;
      *(_DWORD *)uint64_t v22 = 138412546;
      uint64_t v40 = v9;
      os_log_t v36 = v18;
      uint64_t v24 = v17;
      sub_100048168();
      *uint64_t v23 = v17;

      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v35 = v22 + 14;
      unint64_t v25 = v24;
      id v26 = [v25 description];
      uint64_t v27 = sub_100047E68();
      unint64_t v29 = v28;

      uint64_t v42 = sub_100046724(v27, v29, aBlock);
      sub_100048168();

      swift_bridgeObjectRelease();
      os_log_t v30 = v36;
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v38, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v22, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    NSString v31 = sub_100047E38();
    unint64_t v32 = (void *)swift_allocObject();
    v32[2] = v17;
    v32[3] = sub_10001F9EC;
    v32[4] = v12;
    aBlock[4] = (uint64_t)sub_1000205F4;
    aBlock[5] = (uint64_t)v32;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016764;
    aBlock[3] = (uint64_t)&unk_10005A688;
    unint64_t v33 = _Block_copy(aBlock);
    NSString v34 = v17;
    swift_retain();
    swift_release();
    [v41 createFriendRequestWithIdentifier:v31 handler:v33];

    _Block_release(v33);
    swift_release();
  }
}

unint64_t sub_10001C6C8(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

unint64_t sub_10001C6D8(unint64_t result)
{
  if (result >= 6) {
    return 6;
  }
  return result;
}

uint64_t sub_10001C6E8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001C728(uint64_t a1)
{
  sub_100045810(a1, *(uint8_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001C734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100016698(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(uint64_t (**)(uint64_t))(v5 + 24));
}

uint64_t sub_10001C740(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001C750()
{
  return swift_release();
}

uint64_t sub_10001C758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_100060CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C7C0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001C808(uint64_t a1, uint64_t a2)
{
  return sub_100017554(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

void sub_10001C818()
{
  sub_10001989C(*(void *)(v0 + 16), *(void (**)(void *, id))(v0 + 24));
}

uint64_t sub_10001C824()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C85C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_10001C870(NSObject *a1, uint64_t a2)
{
  sub_1000175F8(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void))(v2 + 32), *(NSObject **)(v2 + 40));
}

id sub_10001C87C(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_1000475C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  uint64_t v9 = v1;
  sub_1000475B8();
  uint64_t v10 = sub_1000475A8();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *uint64_t v8 = v10;
  v8[1] = v12;
  uint64_t v13 = (uint64_t *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *uint64_t v13 = 0;
  v13[1] = 0;
  uint64_t v14 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  *(void *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  id v15 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(void *)id v15 = 0;
  *((void *)v15 + 1) = 0;
  id v16 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(void *)id v16 = 0;
  *((void *)v16 + 1) = 0;
  id v17 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(void *)id v17 = 0;
  *((void *)v17 + 1) = 0;
  char v18 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(void *)char v18 = 0;
  v18[8] = 1;
  *(void *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(void *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  uint64_t v19 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  id v20 = objc_allocWithZone((Class)GKDispatchGroup);
  NSString v21 = sub_100047E38();
  id v22 = [v20 initWithName:v21];

  *(void *)&v9[v19] = v22;
  uint64_t v23 = *(void **)&v9[v14];
  *(void *)&v9[v14] = a1;
  id v24 = a1;

  id v25 = [v24 internal];
  id v26 = [v25 playerID];

  uint64_t v27 = sub_100047E68();
  uint64_t v29 = v28;

  *uint64_t v13 = v27;
  v13[1] = v29;

  swift_bridgeObjectRelease();
  v31.receiver = v9;
  v31.super_class = ObjectType;
  return [super init];
}

unsigned char *sub_10001CB18(uint64_t a1)
{
  uint64_t v2 = sub_100047768();
  uint64_t v202 = *(void *)(v2 - 8);
  uint64_t v203 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v200 = (char *)&v189 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v189 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  v195 = (char *)&v189 - v9;
  __chkstk_darwin(v8);
  v197 = (char *)&v189 - v10;
  uint64_t v11 = sub_100004714(&qword_100061218);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v189 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  v194 = (char *)&v189 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v193 = (char *)&v189 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  NSString v21 = (char *)&v189 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v189 - v22;
  v204 = (void *)sub_100047408();
  uint64_t v24 = *(v204 - 1);
  uint64_t v25 = __chkstk_darwin(v204);
  uint64_t v27 = (char *)&v189 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v25);
  v192 = (char *)&v189 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v191 = (char *)&v189 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v196 = (char *)&v189 - v33;
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v189 - v34;
  uint64_t v198 = sub_100047418();
  if (!v198)
  {
LABEL_109:
    int v188 = 0;
    uint64_t i = 164;
    goto LABEL_113;
  }
  v199 = v7;
  uint64_t v201 = a1;
  uint64_t v36 = sub_100047418();
  if (!v36)
  {
    id v43 = *(char **)(v24 + 56);
    ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v23, 1, 1, v204);
    goto LABEL_9;
  }
  uint64_t v37 = v14;
  int v38 = sub_10001B888(v36, 28278, 0xE200000000000000);
  swift_bridgeObjectRelease();
  if (*((void *)v38 + 2))
  {
    uint64_t v39 = v204;
    (*(void (**)(char *, char *, void *))(v24 + 16))(v23, &v38[(*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)], v204);
    uint64_t v40 = *(char **)(v24 + 56);
    id v41 = v23;
    uint64_t v42 = 0;
  }
  else
  {
    uint64_t v40 = *(char **)(v24 + 56);
    id v41 = v23;
    uint64_t v42 = 1;
    uint64_t v39 = v204;
  }
  uint64_t v44 = v40;
  ((void (*)(char *, uint64_t, uint64_t, void *))v40)(v41, v42, 1, v39);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v24 + 48))(v23, 1, v39) == 1)
  {
    id v43 = v44;
    uint64_t v14 = v37;
LABEL_9:
    sub_100004868((uint64_t)v23, &qword_100061218);
    uint64_t v45 = sub_100016230(48, 0xE100000000000000);
    if (v46) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, void *))(v24 + 32))(v35, v23, v39);
  uint64_t v47 = sub_1000473F8();
  unint64_t v49 = v48;
  (*(void (**)(char *, void *))(v24 + 8))(v35, v39);
  if (v49) {
    uint64_t v50 = v47;
  }
  else {
    uint64_t v50 = 48;
  }
  if (v49) {
    unint64_t v51 = v49;
  }
  else {
    unint64_t v51 = 0xE100000000000000;
  }
  id v43 = v44;
  uint64_t v14 = v37;
  uint64_t v45 = sub_100016230(v50, v51);
  if (v52)
  {
LABEL_22:
    uint64_t v55 = sub_100047418();
    uint64_t v56 = v204;
    if (!v55)
    {
      ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v21, 1, 1, v204);
LABEL_28:
      sub_100004868((uint64_t)v21, &qword_100061218);
LABEL_29:
      char v60 = v197;
      sub_100047728();
      swift_bridgeObjectRetain_n();
      id v61 = sub_100047758();
      os_log_type_t v62 = sub_100048028();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(void *)&v208[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v63 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_100047F68();
        unint64_t v66 = v65;
        swift_bridgeObjectRelease();
        *(void *)&long long v206 = sub_100046724(v64, v66, (uint64_t *)v208);
        sub_100048168();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Couldn't find playerID in queryItems: %s", v63, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v202 + 8))(v60, v203);
      os_log_type_t v67 = v199;
      id v68 = [self unknownPlayer];
      id v69 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
      uint64_t v70 = sub_10001C87C(v68);

      LODWORD(v197) = 0;
      v70[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 3;
      goto LABEL_85;
    }
    uint64_t v57 = sub_10001B888(v55, 6580592, 0xE300000000000000);
    swift_bridgeObjectRelease();
    if (*((void *)v57 + 2))
    {
      (*(void (**)(char *, char *, void *))(v24 + 16))(v21, &v57[(*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)], v56);
      uint64_t v58 = 0;
    }
    else
    {
      uint64_t v58 = 1;
    }
    ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v21, v58, 1, v56);
    swift_bridgeObjectRelease();
    id v59 = *(unsigned int (**)(char *, uint64_t, void *))(v24 + 48);
    if (v59(v21, 1, v56) == 1) {
      goto LABEL_28;
    }
    uint64_t v71 = *(void (**)(char *, uint64_t, void *))(v24 + 32);
    uint64_t v72 = v196;
    v195 = (char *)(v24 + 32);
    v190 = v71;
    v71(v196, (uint64_t)v21, v56);
    uint64_t v73 = sub_1000473F8();
    uint64_t v75 = v74;
    char v76 = *(void (**)(char *, void *))(v24 + 8);
    v196 = (char *)(v24 + 8);
    v189 = v76;
    v76(v72, v56);
    if (!v75) {
      goto LABEL_29;
    }
    id v77 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
    uint64_t v70 = sub_100015FF0(v73, v75);
    uint64_t v78 = sub_100047418();
    if (v78)
    {
      v197 = v43;
      Swift::String v79 = sub_10001B888(v78, 25446, 0xE200000000000000);
      swift_bridgeObjectRelease();
      uint64_t v80 = (uint64_t)v194;
      if (*((void *)v79 + 2))
      {
        uint64_t v81 = (uint64_t)v193;
        id v82 = v204;
        (*(void (**)(char *, char *, void *))(v24 + 16))(v193, &v79[(*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)], v204);
        uint64_t v83 = 0;
      }
      else
      {
        uint64_t v83 = 1;
        id v82 = v204;
        uint64_t v81 = (uint64_t)v193;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, void *))v197)(v81, v83, 1, v82);
      swift_bridgeObjectRelease();
      if (v59((char *)v81, 1, v82) != 1)
      {
        long long v134 = v191;
        v190(v191, v81, v82);
        v193 = (char *)sub_1000473F8();
        long long v136 = v135;
        v189(v134, v82);
        if (v136)
        {
          long long v137 = (char **)&v70[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
          *long long v137 = v193;
          v137[1] = v136;
          swift_bridgeObjectRelease();
        }
        id v43 = v197;
LABEL_70:
        uint64_t v138 = sub_100047418();
        if (v138)
        {
          long long v139 = sub_10001B888(v138, 7565682, 0xE300000000000000);
          swift_bridgeObjectRelease();
          if (*((void *)v139 + 2))
          {
            long long v140 = v204;
            (*(void (**)(uint64_t, char *, void *))(v24 + 16))(v80, &v139[(*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)], v204);
            uint64_t v141 = 0;
            os_log_type_t v67 = v199;
          }
          else
          {
            uint64_t v141 = 1;
            os_log_type_t v67 = v199;
            long long v140 = v204;
          }
          ((void (*)(uint64_t, uint64_t, uint64_t, void *))v43)(v80, v141, 1, v140);
          swift_bridgeObjectRelease();
          if (v59((char *)v80, 1, v140) != 1)
          {
            long long v142 = v192;
            long long v143 = v204;
            v190(v192, v80, v204);
            uint64_t v144 = sub_1000473F8();
            unint64_t v146 = v145;
            v189(v142, v143);
            if (v146)
            {
              unint64_t v147 = sub_100016230(v144, v146);
              if ((v148 & 1) == 0 && v147 < 5) {
                v70[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = v147;
              }
            }
            goto LABEL_77;
          }
        }
        else
        {
          ((void (*)(uint64_t, uint64_t, uint64_t, void *))v43)(v80, 1, 1, v204);
          os_log_type_t v67 = v199;
        }
        sub_100004868(v80, &qword_100061218);
LABEL_77:

        LODWORD(v197) = 0;
        goto LABEL_85;
      }
      id v43 = v197;
    }
    else
    {
      uint64_t v81 = (uint64_t)v193;
      ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v193, 1, 1, v204);
      uint64_t v80 = (uint64_t)v194;
    }
    sub_100004868(v81, &qword_100061218);
    goto LABEL_70;
  }
LABEL_18:
  if (!v45) {
    goto LABEL_22;
  }
  id v53 = v204;
  if (v45 == 1)
  {
    int v54 = 1;
LABEL_38:
    uint64_t v84 = sub_100047418();
    if (v84)
    {
      uint64_t v85 = sub_10001B888(v84, 25722, 0xE200000000000000);
      swift_bridgeObjectRelease();
      if (*((void *)v85 + 2))
      {
        (*(void (**)(char *, char *, void *))(v24 + 16))(v14, &v85[(*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)], v53);
        uint64_t v86 = 0;
      }
      else
      {
        uint64_t v86 = 1;
      }
      ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v14, v86, 1, v53);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, void *))(v24 + 48))(v14, 1, v53) != 1)
      {
        (*(void (**)(char *, char *, void *))(v24 + 32))(v27, v14, v53);
        sub_1000473F8();
        uint64_t v100 = v99;
        (*(void (**)(char *, void *))(v24 + 8))(v27, v53);
        if (v100)
        {
          uint64_t v101 = sub_100047528();
          unint64_t v103 = v102;
          uint64_t v104 = swift_bridgeObjectRelease();
          if (v103 >> 60 == 15) {
            goto LABEL_114;
          }
          __chkstk_darwin(v104);
          *((unsigned char *)&v189 - 32) = 0;
          *(&v189 - 3) = (void (*)(char *, void *))v101;
          uint64_t i = v103;
          sub_100004714(&qword_100061228);
          sub_100047548();
          unint64_t v105 = *((void *)&v208[0] + 1);
          if (*((void *)&v208[0] + 1) >> 60 == 15)
          {
            __break(1u);
          }
          else
          {
            LODWORD(v197) = v54;
            uint64_t v106 = *(void *)&v208[0];
            sub_100004714(&qword_100061230);
            uint64_t v107 = swift_allocObject();
            *(_OWORD *)(v107 + 16) = xmmword_10004C3A0;
            uint64_t v108 = sub_100010B0C(0, &qword_100061238);
            *(void *)(v107 + 56) = sub_100004714(&qword_100061240);
            *(void *)(v107 + 32) = v108;
            uint64_t v109 = sub_100010B0C(0, &qword_100061248);
            *(void *)(v107 + 88) = sub_100004714(&qword_100061250);
            *(void *)(v107 + 64) = v109;
            id v110 = objc_allocWithZone((Class)NSSet);
            Class isa = sub_100047F48().super.isa;
            swift_bridgeObjectRelease();
            id v112 = [v110 initWithArray:isa];

            *(void *)&v208[0] = 0;
            sub_100047FF8();
            if (*(void *)&v208[0])
            {

              long long v113 = self;
              Class v114 = sub_100047FE8().super.isa;
              swift_bridgeObjectRelease();
              Class v115 = sub_100047558().super.isa;
              *(void *)&v208[0] = 0;
              id v116 = [v113 _strictlyUnarchivedObjectOfClasses:v114 fromData:v115 error:v208];

              if (v116)
              {
                id v117 = *(id *)&v208[0];
                sub_100048198();
                swift_unknownObjectRelease();
                sub_100004714(&qword_100061258);
                if (swift_dynamicCast())
                {
                  uint64_t v118 = v206;
                  if (*(void *)(v206 + 16))
                  {
                    swift_bridgeObjectRetain();
                    unint64_t v119 = sub_100034610(25446, 0xE200000000000000);
                    if (v120)
                    {
                      long long v121 = (uint64_t *)(*(void *)(v118 + 56) + 16 * v119);
                      uint64_t v122 = *v121;
                      uint64_t v123 = v121[1];
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRelease();
                      id v124 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
                      long long v125 = sub_100015DB0(v122, v123);
                      uint64_t v70 = v125;
                      if (*(void *)(v118 + 16))
                      {
                        swift_bridgeObjectRetain();
                        v196 = v70;
                        unint64_t v126 = sub_100034610(7565682, 0xE300000000000000);
                        if (v127)
                        {
                          long long v128 = (uint64_t *)(*(void *)(v118 + 56) + 16 * v126);
                          uint64_t v129 = *v128;
                          unint64_t v130 = v128[1];
                          swift_bridgeObjectRetain();
                          swift_bridgeObjectRelease();
                          unint64_t v131 = sub_100016230(v129, v130);
                          if ((v132 & 1) == 0 && v131 <= 4) {
                            v196[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = v131;
                          }
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                        if (*(void *)(v118 + 16))
                        {
                          swift_bridgeObjectRetain();
                          unint64_t v176 = sub_100034610(28272, 0xE200000000000000);
                          if (v177)
                          {
                            v178 = (uint64_t *)(*(void *)(v118 + 56) + 16 * v176);
                            uint64_t v180 = *v178;
                            uint64_t v179 = v178[1];
                            swift_bridgeObjectRetain();
                            swift_bridgeObjectRelease();
                            v181 = &v196[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
                            *(void *)v181 = v180;
                            *((void *)v181 + 1) = v179;
                          }
                          swift_bridgeObjectRelease();
                        }
                      }
                      else
                      {
                        v175 = v125;
                      }
                      *(void *)&v208[0] = v118;
                      sub_100004714((uint64_t *)&unk_100061260);
                      if (swift_dynamicCast())
                      {
                        uint64_t v182 = v206;
                        if (*(void *)(v206 + 16)
                          && (unint64_t v183 = sub_100034610(1684631666, 0xE400000000000000), (v184 & 1) != 0))
                        {
                          sub_100014104(*(void *)(v182 + 56) + 32 * v183, (uint64_t)&v206);
                        }
                        else
                        {
                          long long v206 = 0u;
                          long long v207 = 0u;
                        }
                        swift_bridgeObjectRelease();
                        if (*((void *)&v207 + 1))
                        {
                          sub_100010434(&v206, v208);
                          sub_100004714(&qword_1000611B0);
                          uint64_t v185 = swift_allocObject();
                          *(_OWORD *)(v185 + 16) = xmmword_10004BE20;
                          sub_100014104((uint64_t)v208, (uint64_t)&v206);
                          swift_dynamicCast();
                          sub_10001FB7C(v106, v105);
                          sub_10001FB7C(v101, v103);
                          sub_10001FBE8((uint64_t)v208);
                          v186 = (uint64_t *)&v70[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
                          swift_beginAccess();
                          uint64_t *v186 = v185;

                          swift_bridgeObjectRelease();
                        }
                        else
                        {
                          sub_10001FB7C(v106, v105);
                          sub_10001FB7C(v101, v103);

                          sub_100004868((uint64_t)&v206, (uint64_t *)&unk_100061D40);
                        }
                      }
                      else
                      {
                        sub_10001FB7C(v106, v105);
                        sub_10001FB7C(v101, v103);
                      }
                      goto LABEL_84;
                    }
                    swift_bridgeObjectRelease_n();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                  }
                }
              }
              else
              {
                id v133 = *(id *)&v208[0];
                sub_1000474E8();

                swift_willThrow();
                swift_errorRelease();
              }
              id v149 = [self local];
              id v150 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
              uint64_t v70 = sub_10001C87C(v149);

              sub_10001FB7C(v106, v105);
              sub_10001FB7C(v101, v103);
LABEL_84:
              os_log_type_t v67 = v199;
              goto LABEL_85;
            }
          }
          __break(1u);
          goto LABEL_109;
        }
LABEL_112:
        int v188 = 0;
        for (uint64_t i = 197; ; uint64_t i = 198)
        {
LABEL_113:
          sub_100048298();
          __break(1u);
LABEL_114:
          int v188 = 0;
        }
      }
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t, void *))v43)(v14, 1, 1, v53);
    }
    sub_100004868((uint64_t)v14, &qword_100061218);
    goto LABEL_112;
  }
  if (v45 == 2)
  {
    int v54 = 2;
    goto LABEL_38;
  }
  id v87 = [self unknownPlayer];
  id v88 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
  id v89 = sub_10001C87C(v87);

  id v90 = v89;
  double v91 = v195;
  sub_100047738();
  uint64_t v70 = v90;
  os_log_type_t v92 = sub_100047758();
  os_log_type_t v93 = sub_100048008();
  if (os_log_type_enabled(v92, v93))
  {
    uint64_t v94 = swift_slowAlloc();
    uint64_t v95 = (void *)swift_slowAlloc();
    *(void *)&v208[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v94 = 138412546;
    *(void *)&long long v206 = v70;
    os_log_t v96 = v70;
    sub_100048168();
    *uint64_t v95 = v70;

    *(_WORD *)(v94 + 12) = 2080;
    LOBYTE(v206) = 3;
    sub_100004714(&qword_100061220);
    uint64_t v97 = sub_100048158();
    *(void *)&long long v206 = sub_100046724(v97, v98, (uint64_t *)v208);
    sub_100048168();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "%@ Couldn't handle this verion of friend request: %s", (uint8_t *)v94, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v202 + 8))(v195, v203);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v202 + 8))(v91, v203);
  }
  os_log_type_t v67 = v199;
  v70[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 1;

  LODWORD(v197) = 3;
LABEL_85:
  sub_100047738();
  uint64_t v151 = v70;
  swift_bridgeObjectRetain();
  uint64_t v152 = v151;
  uint64_t v153 = sub_100047758();
  os_log_type_t v154 = sub_100048008();
  if (os_log_type_enabled(v153, v154))
  {
    uint64_t v155 = swift_slowAlloc();
    char v156 = (void *)swift_slowAlloc();
    uint64_t v198 = swift_slowAlloc();
    *(void *)&v208[0] = v198;
    *(_DWORD *)uint64_t v155 = 138412546;
    uint64_t v205 = (uint64_t)v152;
    uint64_t v157 = v152;
    sub_100048168();
    *char v156 = v152;

    *(_WORD *)(v155 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v158 = sub_100047F68();
    unint64_t v160 = v159;
    swift_bridgeObjectRelease();
    uint64_t v205 = sub_100046724(v158, v160, (uint64_t *)v208);
    sub_100048168();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v153, v154, "%@ queryItems: %s", (uint8_t *)v155, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    char v161 = *(void (**)(char *, uint64_t))(v202 + 8);
    v161(v199, v203);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    char v161 = *(void (**)(char *, uint64_t))(v202 + 8);
    v161(v67, v203);
  }
  Swift::String_optional v162 = v200;
  sub_100047738();
  Swift::String v163 = v152;
  v164 = sub_100047758();
  os_log_type_t v165 = sub_100048008();
  if (os_log_type_enabled(v164, v165))
  {
    uint64_t v166 = swift_slowAlloc();
    v204 = v161;
    uint64_t v167 = v166;
    v168 = (void *)swift_slowAlloc();
    *(void *)&v208[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v167 = 138412546;
    uint64_t v205 = (uint64_t)v163;
    v169 = v163;
    sub_100048168();
    void *v168 = v163;

    *(_WORD *)(v167 + 12) = 2080;
    LOBYTE(v205) = (_BYTE)v197;
    sub_100004714(&qword_100061220);
    uint64_t v170 = sub_100048158();
    uint64_t v205 = sub_100046724(v170, v171, (uint64_t *)v208);
    sub_100048168();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v164, v165, "%@ Version in queryItems: %s", (uint8_t *)v167, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v172 = sub_100047438();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v172 - 8) + 8))(v201, v172);
    ((void (*)(char *, uint64_t))v204)(v200, v203);
  }
  else
  {

    uint64_t v173 = sub_100047438();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v173 - 8) + 8))(v201, v173);
    v161(v162, v203);
  }
  return v163;
}

id sub_10001E520(void *a1)
{
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v75 = v2;
  uint64_t v76 = v3;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v74 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v63 - v6;
  uint64_t v8 = sub_100004714(&qword_100061208);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100047438();
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v72 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v70 = (char *)&v63 - v15;
  uint64_t v16 = sub_100004714(&qword_100060CE0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100047518();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  id v69 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v63 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v63 - v26;
  id v73 = a1;
  id v28 = [a1 selectedMessage];
  if (!v28) {
    goto LABEL_9;
  }
  uint64_t v29 = v28;
  id v30 = [v28 URL];
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
    goto LABEL_7;
  }
  uint64_t v31 = v30;
  id v68 = v7;
  sub_100047508();

  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v32(v18, v25, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
LABEL_7:

    uint64_t v37 = &qword_100060CE0;
    uint64_t v38 = (uint64_t)v18;
    goto LABEL_8;
  }
  uint64_t v33 = v18;
  uint64_t v34 = v27;
  v32(v27, v33, v19);
  sub_100047428();
  uint64_t v36 = v71;
  uint64_t v35 = v72;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v10, 1, v72) == 1)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v27, v19);

    uint64_t v37 = &qword_100061208;
    uint64_t v38 = (uint64_t)v10;
LABEL_8:
    sub_100004868(v38, v37);
LABEL_9:
    id v39 = [self local];
    id v40 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
    id v41 = sub_10001C87C(v39);

    uint64_t v42 = v75;
    goto LABEL_10;
  }
  unint64_t v51 = v70;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v70, v10, v35);
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v14, v51, v35);
  id v41 = sub_10001CB18((uint64_t)v14);
  char v52 = v68;
  sub_100047738();
  id v53 = v69;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v69, v34, v19);
  uint64_t v54 = sub_100047758();
  os_log_type_t v67 = v34;
  uint64_t v55 = v54;
  os_log_type_t v56 = sub_100048008();
  int v57 = v56;
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v58 = swift_slowAlloc();
    int v65 = v57;
    id v59 = (uint8_t *)v58;
    uint64_t v66 = swift_slowAlloc();
    uint64_t v78 = v66;
    uint64_t v64 = v59;
    *(_DWORD *)id v59 = 136315138;
    sub_10001FB04();
    uint64_t v60 = sub_100048318();
    uint64_t v77 = sub_100046724(v60, v61, &v78);
    sub_100048168();
    swift_bridgeObjectRelease();
    os_log_type_t v62 = *(void (**)(char *, uint64_t))(v20 + 8);
    v62(v53, v19);
    _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v65, "PlayerModel.init url: %s", v64, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v42 = v75;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v75);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v72);
  }
  else
  {

    os_log_type_t v62 = *(void (**)(char *, uint64_t))(v20 + 8);
    v62(v53, v19);
    uint64_t v42 = v75;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v75);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v70, v35);
  }
  v62(v67, v19);
LABEL_10:
  id v43 = v74;
  sub_100047738();
  id v44 = v41;
  uint64_t v45 = sub_100047758();
  os_log_type_t v46 = sub_100048008();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v48 = sub_100015AB0();
    uint64_t v77 = sub_100046724(v48, v49, &v78);
    sub_100048168();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "PlayerModel.init playerModel: %s", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v76 + 8))(v43, v42);
  return v44;
}

uint64_t sub_10001ED50(uint64_t a1)
{
  uint64_t v2 = sub_100047518();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004714(&qword_100061208);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100047438();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v18 - v14;
  sub_100047428();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100004868((uint64_t)v8, &qword_100061208);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    unint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
    sub_1000481E8(39);
    swift_bridgeObjectRelease();
    unint64_t v18 = 0xD000000000000025;
    unint64_t v19 = 0x800000010004AA50;
    sub_10001FB04();
    v20._countAndFlagsBits = sub_100048318();
    sub_100047EB8(v20);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100048298();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    uint64_t v16 = sub_10001CB18((uint64_t)v13);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    return (uint64_t)v16;
  }
  return result;
}

void sub_10001F074(char *a1, void *a2, void *a3, uint64_t (*a4)(void), NSObject *a5)
{
  uint64_t v10 = sub_100047768();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v52 - v15;
  uint64_t v17 = (void *)swift_allocObject();
  void v17[2] = a2;
  v17[3] = a3;
  uint64_t v60 = a4;
  v17[4] = a4;
  v17[5] = a5;
  unint64_t v18 = self;
  id v59 = a2;
  uint64_t v58 = a3;
  swift_retain();
  id v19 = [v18 local];
  if ([v19 isAuthenticated]
    && *(void *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
  {
    uint64_t v56 = v10;
    uint64_t v60 = *(uint64_t (**)(void))&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
    swift_bridgeObjectRetain();
    sub_100047738();
    Swift::String v20 = a1;
    uint64_t v21 = sub_100047758();
    os_log_type_t v22 = sub_100048008();
    int v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc();
      LODWORD(v58) = v23;
      uint64_t v25 = (uint8_t *)v24;
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v55 = v26;
      id v59 = (id)swift_slowAlloc();
      *(void *)&long long aBlock = v59;
      char v52 = v25;
      *(_DWORD *)uint64_t v25 = 138412546;
      os_log_t v57 = v21;
      os_log_type_t v67 = v20;
      uint64_t v54 = &v68;
      uint64_t v27 = v20;
      uint64_t v61 = v11;
      id v28 = v27;
      sub_100048168();
      *uint64_t v26 = v20;

      uint64_t v29 = v52;
      *((_WORD *)v52 + 6) = 2080;
      id v53 = v29 + 14;
      id v30 = v28;
      id v31 = [v30 description];
      uint64_t v32 = sub_100047E68();
      unint64_t v34 = v33;

      os_log_type_t v67 = (void *)sub_100046724(v32, v34, (uint64_t *)&aBlock);
      sub_100048168();

      swift_bridgeObjectRelease();
      os_log_t v35 = v57;
      _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v58, " %@ View friend code details for playerModel: %s", v29, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v56);
    }
    NSString v39 = sub_100047E38();
    swift_bridgeObjectRelease();
    unint64_t v49 = (void *)swift_allocObject();
    v49[2] = v20;
    v49[3] = sub_10001F800;
    v49[4] = v17;
    int v65 = sub_10001F810;
    uint64_t v66 = v49;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v63 = sub_100016598;
    uint64_t v64 = &unk_10005A570;
    uint64_t v50 = _Block_copy(&aBlock);
    unint64_t v51 = v20;
    swift_retain();
    swift_release();
    [v19 getPlayerIDFromFriendCode:v39 handler:v50];

    _Block_release(v50);
  }
  else
  {
    os_log_t v57 = a5;
    uint64_t v61 = v11;
    sub_100047738();
    uint64_t v36 = a1;
    id v37 = v19;
    uint64_t v38 = v36;
    NSString v39 = v37;
    id v40 = sub_100047758();
    os_log_type_t v41 = sub_100048008();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      id v44 = (void *)swift_slowAlloc();
      uint64_t v54 = (uint64_t *)swift_slowAlloc();
      os_log_type_t v67 = v54;
      *(_DWORD *)uint64_t v43 = 138412802;
      LODWORD(v53) = v42;
      uint64_t v55 = v17;
      uint64_t v56 = v10;
      *(void *)&long long aBlock = v38;
      uint64_t v45 = v38;
      sub_100048168();
      *id v44 = v38;

      *(_WORD *)(v43 + 12) = 2080;
      long long aBlock = *(_OWORD *)&v45[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      sub_100004714(&qword_1000611D8);
      uint64_t v46 = sub_100048158();
      *(void *)&long long aBlock = sub_100046724(v46, v47, (uint64_t *)&v67);
      sub_100048168();

      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 1024;
      unsigned int v48 = [v39 isAuthenticated];

      LODWORD(aBlock) = v48;
      sub_100048168();

      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v53, "%@ Could not fetch playerID using friend code %s, local player authentication status: %{BOOL}d", (uint8_t *)v43, 0x1Cu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v10);
    }
    sub_1000187E8(0, v59, v58, v60, (uint64_t)v57);
  }
  swift_release();
}

void sub_10001F7A8(uint64_t a1, uint64_t a2)
{
  sub_100018298(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void))(v2 + 32));
}

uint64_t sub_10001F7B8()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001F800(void *a1)
{
  return sub_1000187E8(a1, *(void **)(v1 + 16), *(char **)(v1 + 24), *(uint64_t (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10001F810(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  return sub_100016480(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16), *(uint64_t (**)(uint64_t))(v6 + 24));
}

uint64_t sub_10001F83C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001F884(uint64_t a1, uint64_t a2)
{
  sub_100019018(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(char **)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_10001F890()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001F8E0(unint64_t a1, uint64_t a2)
{
  return sub_100019210(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(uint64_t (**)(void))(v2 + 48));
}

uint64_t sub_10001F8F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000482E8();
  __break(1u);
  return result;
}

uint64_t sub_10001F9EC(uint64_t a1)
{
  return sub_100019708(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t sub_10001F9FC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001FA44(uint64_t a1)
{
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  unint64_t v5 = (uint64_t (*)(uint64_t))v1[5];
  if (!a1) {
    *(unsigned char *)(v1[2] + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = 1;
  }
  sub_100016A48(v3, v4);
  return v5(a1);
}

uint64_t sub_10001FAA8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001FAF0(uint64_t a1)
{
  return sub_100016834(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(uint64_t (**)(uint64_t))(v1 + 48));
}

unint64_t sub_10001FB04()
{
  unint64_t result = qword_100061210;
  if (!qword_100061210)
  {
    sub_100047518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061210);
  }
  return result;
}

uint64_t sub_10001FB5C@<X0>(const uint8_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003E864(a1, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_10001FB7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001FB90(a1, a2);
  }
  return a1;
}

uint64_t sub_10001FB90(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001FBE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_10001FC38(char *a1, void *a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  uint64_t v9 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] == 1)
  {
    uint64_t v10 = self;
    id v11 = a2;
    id v41 = [v10 local];
    if (a1[v9] == 1 && *(void *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
    {
      uint64_t v12 = *(void *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      swift_bridgeObjectRetain();
      sub_100047738();
      uint64_t v13 = a1;
      uint64_t v14 = sub_100047758();
      os_log_type_t v15 = sub_100048008();
      int v16 = v15;
      id v40 = v14;
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v17 = swift_slowAlloc();
        int v35 = v16;
        uint64_t v18 = v17;
        uint64_t v19 = swift_slowAlloc();
        uint64_t v36 = v4;
        Swift::String v20 = (void *)v19;
        v34[3] = v19;
        uint64_t v37 = swift_slowAlloc();
        uint64_t v42 = (uint64_t)v13;
        aBlock[0] = v37;
        *(_DWORD *)uint64_t v18 = 138412546;
        uint64_t v39 = v12;
        v34[2] = aBlock;
        uint64_t v21 = v13;
        uint64_t v38 = v5;
        os_log_type_t v22 = v21;
        sub_100048168();
        *Swift::String v20 = v13;

        *(_WORD *)(v18 + 12) = 2080;
        v34[1] = v18 + 14;
        int v23 = v22;
        id v24 = [v23 description];
        uint64_t v25 = sub_100047E68();
        uint64_t v26 = v40;
        unint64_t v28 = v27;

        uint64_t v42 = sub_100046724(v25, v28, aBlock);
        sub_100048168();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v35, "%@ CANCEL friend request for playerModel: %s", (uint8_t *)v18, 0x16u);
        sub_100004714((uint64_t *)&unk_100060CB0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v36);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      NSString v30 = sub_100047E38();
      swift_bridgeObjectRelease();
      id v31 = (void *)swift_allocObject();
      v31[2] = v13;
      v31[3] = sub_100020198;
      v31[4] = v8;
      aBlock[4] = (uint64_t)sub_1000201A4;
      aBlock[5] = (uint64_t)v31;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10001728C;
      aBlock[3] = (uint64_t)&unk_10005A7C8;
      uint64_t v32 = _Block_copy(aBlock);
      unint64_t v33 = v13;
      swift_retain();
      swift_release();
      [v41 cancelFriendRequestWithIdentifier:v30 handler:v32];

      _Block_release(v32);
      swift_release();
    }
    else
    {
      sub_1000309C8(0, v11);
      swift_release();
      id v29 = v41;
    }
  }
  else
  {
    swift_release();
    sub_100048298();
    __break(1u);
  }
}

uint64_t sub_100020160()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020198(uint64_t a1)
{
  return sub_1000309C8(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000201A4(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  if (!a1)
  {
    uint64_t v4 = *(void *)(v1 + 16);
    *(unsigned char *)(v4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 0;
    uint64_t v5 = (void *)(v4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode);
    *uint64_t v5 = 0;
    v5[1] = 0;
    swift_bridgeObjectRelease();
  }
  return v3(a1);
}

uint64_t sub_10002020C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002024C(uint64_t a1, uint64_t a2)
{
  return sub_100019BF0(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100020254()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100020294()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  id v2 = [*(id *)(v0 + 32) error];
  v1();
}

uint64_t sub_100020304(uint64_t a1, uint64_t a2)
{
  return sub_100019C88(a1, a2, *(void **)(v2 + 16), *(uint64_t (**)(void))(v2 + 24));
}

uint64_t sub_100020310()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100020358(uint64_t a1)
{
  sub_100009B4C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

void sub_100020368(uint64_t a1)
{
  sub_1000339C8(a1, *(void **)(v1 + 16));
}

uint64_t getEnumTagSinglePayload for PlayerModel.URLPropertiesVersion(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlayerModel.URLPropertiesVersion(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000204D0);
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

ValueMetadata *type metadata accessor for PlayerModel.URLPropertiesVersion()
{
  return &type metadata for PlayerModel.URLPropertiesVersion;
}

unint64_t sub_10002050C()
{
  unint64_t result = qword_100061290;
  if (!qword_100061290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061290);
  }
  return result;
}

uint64_t sub_100020600(void **a1, void **a2)
{
  return _sSo8GKPlayerC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(*a1, *a2);
}

void sub_10002060C(void (*a1)(void), uint64_t a2)
{
  if (*(void *)(*(void *)&v2[qword_1000619A0] + 16))
  {
    uint64_t v5 = self;
    swift_bridgeObjectRetain();
    Class isa = sub_100047F48().super.isa;
    swift_bridgeObjectRelease();
    BOOL v7 = (void *)swift_allocObject();
    v7[2] = v2;
    v7[3] = a1;
    v7[4] = a2;
    int v23 = sub_100020F78;
    id v24 = v7;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_100018744;
    os_log_type_t v22 = &unk_10005AAD0;
    int v8 = _Block_copy(&aBlock);
    uint64_t v9 = v2;
    swift_retain();
    swift_release();
    [v5 loadPlayersForIdentifiers:isa withCompletionHandler:v8];
    _Block_release(v8);
  }
  else
  {
    uint64_t v10 = *(void **)&v2[qword_100061998];
    if (v10)
    {
      self;
      uint64_t v11 = swift_dynamicCastObjCClass();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = (void *)swift_allocObject();
        v13[2] = v2;
        v13[3] = a1;
        v13[4] = a2;
        int v23 = sub_100020F50;
        id v24 = v13;
        long long aBlock = _NSConcreteStackBlock;
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_100018744;
        os_log_type_t v22 = &unk_10005AA80;
        uint64_t v14 = _Block_copy(&aBlock);
        id v15 = v10;
        int v16 = v2;
        swift_retain();
        id v17 = v15;
        swift_release();
        [v12 loadRecentPlayersWithCompletionHandler:v14];

        _Block_release(v14);
      }
      else
      {
        id v18 = v10;
        a1(0);
      }
    }
    else
    {
      sub_100048298();
      __break(1u);
    }
  }
}

uint64_t sub_1000208E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (a1)
  {
    *(void *)(a3 + qword_1000619A8) = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a4(a2);
}

uint64_t sub_100020940(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (a1)
  {
    *(void *)(a3 + qword_1000619A8) = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1000482A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    *(void *)(a3 + qword_1000619B0) = v8;
  }
  return a4(a2);
}

id sub_1000209F8(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for FriendsModel();
  return [super init];
}

id sub_100020A3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendsModel();
  return [super dealloc];
}

uint64_t _sSo8GKPlayerC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_100004714(&qword_100060F40);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  BOOL v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_100047598();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  id v17 = (char *)&v31 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = (SEL *)&unk_10005E000;
  id v21 = [a1 lastPlayedDate];
  if (!v21)
  {
    id v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v24(v9, 1, 1, v10);
    goto LABEL_5;
  }
  os_log_type_t v22 = v21;
  uint64_t v32 = a2;
  sub_100047588();

  int v23 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v23(v9, v17, v10);
  id v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v24(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    a2 = v32;
    uint64_t v20 = (SEL *)&unk_10005E000;
LABEL_5:
    sub_100047568();
    sub_1000123C8((uint64_t)v9);
    goto LABEL_7;
  }
  v23(v19, v9, v10);
  a2 = v32;
  uint64_t v20 = (SEL *)&unk_10005E000;
LABEL_7:
  id v25 = [a2 v20[458]];
  if (!v25)
  {
    v24(v7, 1, 1, v10);
    goto LABEL_11;
  }
  uint64_t v26 = v25;
  sub_100047588();

  unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v27(v7, v17, v10);
  v24(v7, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
LABEL_11:
    sub_100047568();
    sub_1000123C8((uint64_t)v7);
    goto LABEL_12;
  }
  v27(v14, v7, v10);
LABEL_12:
  char v28 = sub_100047578();
  id v29 = *(void (**)(char *, uint64_t))(v11 + 8);
  v29(v14, v10);
  v29(v19, v10);
  return v28 & 1;
}

uint64_t sub_100020DFC(uint64_t a1)
{
  uint64_t result = sub_100020EB4(&qword_1000612A0);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100020E40()
{
  unint64_t result = qword_100060CE8;
  if (!qword_100060CE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100060CE8);
  }
  return result;
}

uint64_t sub_100020E80()
{
  return sub_100020EB4(&qword_1000612A8);
}

uint64_t sub_100020EB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100020E40();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FriendsModel()
{
  uint64_t result = qword_1000612D8;
  if (!qword_1000612D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100020F44()
{
  return type metadata accessor for FriendsModel();
}

uint64_t sub_100020F50(unint64_t a1, uint64_t a2)
{
  return sub_100020940(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24));
}

uint64_t sub_100020F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100020F6C()
{
  return swift_release();
}

uint64_t sub_100020F78(uint64_t a1, uint64_t a2)
{
  return sub_1000208E0(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24));
}

uint64_t destroy for FriendInviteGroupAcceptedStatusView()
{
  return swift_release();
}

void *_s26GameCenterMessageExtension35FriendInviteGroupAcceptedStatusViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for FriendInviteGroupAcceptedStatusView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for FriendInviteGroupAcceptedStatusView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FriendInviteGroupAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteGroupAcceptedStatusView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteGroupAcceptedStatusView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteGroupAcceptedStatusView()
{
  return &type metadata for FriendInviteGroupAcceptedStatusView;
}

uint64_t sub_1000210FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v37 = a2;
  uint64_t v42 = a4;
  uint64_t v41 = sub_100004714(&qword_1000614B0);
  uint64_t v45 = *(void *)(v41 - 8);
  uint64_t v5 = __chkstk_darwin(v41);
  id v40 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v39 = sub_100047CE8();
  uint64_t v44 = *(void *)(v39 - 8);
  uint64_t v9 = __chkstk_darwin(v39);
  uint64_t v38 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v43 = (char *)&v34 - v11;
  sub_100047CD8();
  uint64_t v12 = sub_1000479D8();
  sub_1000214A8(a1, (uint64_t)&v46);
  uint64_t v13 = v46;
  uint64_t v14 = v47;
  char v15 = v48;
  uint64_t v16 = v49;
  char v17 = v50;
  char v18 = BYTE1(v50);
  uint64_t v20 = v51;
  uint64_t v19 = v52;
  LOBYTE(a1) = v53;
  uint64_t v35 = v55;
  char v21 = v56;
  char v22 = BYTE1(v56);
  uint64_t v46 = v12;
  uint64_t v47 = 0x4010000000000000;
  char v48 = 0;
  uint64_t v49 = v13;
  uint64_t v50 = v14;
  LOBYTE(v51) = v15;
  uint64_t v52 = v16;
  char v53 = v17;
  char v54 = v18;
  uint64_t v55 = v20;
  uint64_t v56 = v19;
  char v57 = a1;
  uint64_t v58 = v35;
  char v59 = v21;
  char v60 = v22;
  sub_100004714(&qword_1000614B8);
  sub_100021890(&qword_1000614C0, &qword_1000614B8);
  sub_100047BE8();
  sub_100003710(v13, v14, v15);
  swift_bridgeObjectRelease();
  sub_100003710(v20, v19, a1);
  swift_bridgeObjectRelease();
  int v23 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  id v24 = v38;
  uint64_t v25 = v39;
  v23(v38, v43, v39);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  char v28 = v40;
  uint64_t v27 = v41;
  v26(v40, v8, v41);
  id v29 = v42;
  v23(v42, v24, v25);
  uint64_t v30 = sub_100004714(&qword_1000614C8);
  v26(&v29[*(int *)(v30 + 48)], v28, v27);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v45 + 8);
  v31(v8, v27);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v44 + 8);
  v32(v43, v25);
  v31(v28, v27);
  return ((uint64_t (*)(char *, uint64_t))v32)(v24, v25);
}

uint64_t sub_1000214A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v35._countAndFlagsBits = 0xE000000000000000;
  v41._object = (void *)0x800000010004A210;
  v41._countAndFlagsBits = 0xD00000000000001ALL;
  v43.value._countAndFlagsBits = 0;
  v43.value._object = 0;
  v5.super.Class isa = v4;
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  sub_100047498(v41, v43, v5, v45, v35);

  sub_100004714(&qword_100060C70);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004BE20;
  *(void *)(v6 + 56) = &type metadata for Int;
  *(void *)(v6 + 64) = &protocol witness table for Int;
  *(void *)(v6 + 32) = a1;
  sub_100047E78();
  swift_bridgeObjectRelease();
  sub_1000036BC();
  uint64_t v7 = sub_100047BA8();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_100047B48();
  uint64_t v12 = sub_100047B88();
  uint64_t v38 = v13;
  uint64_t v39 = v12;
  LOBYTE(a1) = v14;
  uint64_t v40 = v15;
  swift_release();
  HIDWORD(v36._object) = a1 & 1;
  sub_100003710(v7, v9, v11);
  swift_bridgeObjectRelease();
  uint64_t v16 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v42._countAndFlagsBits = 0xD00000000000001CLL;
  v36._countAndFlagsBits = 0xE000000000000000;
  v42._object = (void *)0x800000010004A230;
  v44.value._countAndFlagsBits = 0;
  v44.value._object = 0;
  v17.super.Class isa = v16;
  v46._countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  sub_100047498(v42, v44, v17, v46, v36);

  uint64_t v18 = sub_100047BA8();
  uint64_t v20 = v19;
  LOBYTE(v7) = v21 & 1;
  sub_100047B48();
  sub_100047AF8();
  swift_release();
  uint64_t v22 = sub_100047B88();
  uint64_t v24 = v23;
  char v26 = v25;
  swift_release();
  sub_100003710(v18, v20, v7);
  swift_bridgeObjectRelease();
  sub_100047C48();
  uint64_t v27 = sub_100047B78();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_100003710(v22, v24, v26 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)a2 = v39;
  *(void *)(a2 + 8) = v38;
  *(unsigned char *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v40;
  *(_WORD *)(a2 + 32) = 256;
  *(void *)(a2 + 40) = v27;
  *(void *)(a2 + 48) = v29;
  *(unsigned char *)(a2 + 56) = v33;
  *(void *)(a2 + 64) = v31;
  *(_WORD *)(a2 + 72) = 256;
  sub_1000047BC(v39, v38, v37);
  swift_bridgeObjectRetain();
  sub_1000047BC(v27, v29, v33);
  swift_bridgeObjectRetain();
  sub_100003710(v27, v29, v33);
  swift_bridgeObjectRelease();
  sub_100003710(v39, v38, v37);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021804@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  *(void *)a1 = sub_1000479D8();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v6 = sub_100004714(&qword_1000614A8);
  return sub_100021118(v3, v4, v5, (char *)(a1 + *(int *)(v6 + 44)));
}

uint64_t sub_100021868()
{
  return sub_100021890(&qword_1000614D0, &qword_1000614D8);
}

uint64_t sub_100021890(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for FriendInviteInfoCardViewModel(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  uint64_t v5 = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteInfoCardViewModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteInfoCardViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteInfoCardViewModel()
{
  return &type metadata for FriendInviteInfoCardViewModel;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FriendInviteInfoCardViewModel.PlayerStatMetadata()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for FriendInviteInfoCardViewModel.PlayerStatMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteInfoCardViewModel.PlayerStatMetadata()
{
  return &type metadata for FriendInviteInfoCardViewModel.PlayerStatMetadata;
}

uint64_t sub_100021D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100021D84()
{
  sub_100022800();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_100021E28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    long long v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000479C8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *long long v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = *(int *)(a3 + 40);
    char v11 = (char *)v4 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *(void **)v12;
    *(void *)char v11 = *(void *)v12;
    *((_WORD *)v11 + 4) = *((_WORD *)v12 + 4);
    uint64_t v14 = *((void *)v12 + 3);
    *((void *)v11 + 2) = *((void *)v12 + 2);
    *((void *)v11 + 3) = v14;
    long long v21 = *((_OWORD *)v12 + 3);
    *((_OWORD *)v11 + 2) = *((_OWORD *)v12 + 2);
    *((_OWORD *)v11 + 3) = v21;
    uint64_t v15 = *((void *)v12 + 10);
    *((_OWORD *)v11 + 4) = *((_OWORD *)v12 + 4);
    *((void *)v11 + 10) = v15;
    uint64_t v16 = (uint64_t *)((char *)v4 + v10);
    NSBundle v17 = (uint64_t *)((char *)a2 + v10);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    id v19 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100021FD0(uint64_t a1, uint64_t a2)
{
  sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000479C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1000220B4(void *a1, void *a2, uint64_t a3)
{
  sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000479C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  char v11 = *(void **)v10;
  *(void *)uint64_t v9 = *(void *)v10;
  *((_WORD *)v9 + 4) = *((_WORD *)v10 + 4);
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  long long v19 = *((_OWORD *)v10 + 3);
  *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
  *((_OWORD *)v9 + 3) = v19;
  uint64_t v13 = *((void *)v10 + 10);
  *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
  *((void *)v9 + 10) = v13;
  uint64_t v14 = (void *)((char *)a1 + v8);
  uint64_t v15 = (void *)((char *)a2 + v8);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  id v17 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100022210(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_1000614E0);
    sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000479C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)((char *)a2 + v7);
  char v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  id v12 = v10;

  v8[8] = v9[8];
  v8[9] = v9[9];
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v8 + 4) = *((void *)v9 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = *((void *)v9 + 6);
  *((void *)v8 + 5) = *((void *)v9 + 5);
  *((void *)v8 + 6) = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = *((void *)v9 + 8);
  *((void *)v8 + 7) = *((void *)v9 + 7);
  *((void *)v8 + 8) = v14;
  swift_retain();
  swift_release();
  uint64_t v15 = *((void *)v9 + 10);
  *((void *)v8 + 9) = *((void *)v9 + 9);
  *((void *)v8 + 10) = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = *(int *)(a3 + 40);
  id v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  *id v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000223C4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000479C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  long long v12 = *((_OWORD *)v11 + 3);
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  *((_OWORD *)v10 + 3) = v12;
  *((_OWORD *)v10 + 4) = *((_OWORD *)v11 + 4);
  *((void *)v10 + 10) = *((void *)v11 + 10);
  long long v13 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v13;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_1000224C0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_1000614E0);
    uint64_t v6 = sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000479C8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  v9[8] = v10[8];
  v9[9] = v10[9];
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  swift_bridgeObjectRelease();
  *((void *)v9 + 4) = *((void *)v10 + 4);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v10 + 40);
  swift_release();
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
  swift_release();
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
  swift_release();
  *(_OWORD *)&a1[*(int *)(a3 + 40)] = *(_OWORD *)&a2[*(int *)(a3 + 40)];
  swift_release();
  return a1;
}

uint64_t sub_10002263C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100022650);
}

uint64_t sub_100022650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004714(qword_1000614E8);
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

uint64_t sub_100022714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100022728);
}

uint64_t sub_100022728(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004714(qword_1000614E8);
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

uint64_t type metadata accessor for FriendInviteInfoCardView()
{
  return sub_100025E74();
}

void sub_100022800()
{
  if (!qword_100061570)
  {
    sub_1000479C8();
    unint64_t v0 = sub_100047838();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100061570);
    }
  }
}

uint64_t sub_100022858()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002289C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  int v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v10 = (long long *)(v5 + 2);
      char v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *char v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        id v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    long long v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_100047D38();
}

uint64_t sub_100022A60()
{
  uint64_t v1 = sub_1000474B8();
  __chkstk_darwin(v1 - 8);
  id v2 = *v0;
  id v3 = [*v0 displayNameWithOptions:0];
  if (!v3) {
    id v3 = [v2 displayName];
  }
  sub_100047E68();

  sub_1000474A8();
  sub_100047488();
  uint64_t KeyPath = swift_getKeyPath();
  v7[-2] = __chkstk_darwin(KeyPath);
  swift_getKeyPath();
  sub_100047AE8();
  uint64_t v5 = sub_100047AF8();
  swift_release();
  v7[1] = v5;
  sub_100025D80();
  return sub_100047458();
}

uint64_t sub_100022BCC()
{
  return sub_100047E28() & 1;
}

uint64_t sub_100022C28()
{
  return sub_100047DE8();
}

void sub_100022C70()
{
}

void sub_100022C98()
{
}

BOOL sub_100022CB8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000479C8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003D368((uint64_t)v10);
  char v11 = sub_1000479B8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  BOOL v12 = (v11 & 1) == 0 && *(void *)(*(void *)&v6[*(int *)(a1 + 36) + 32] + 16) != 0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  return v12;
}

uint64_t sub_100022E68@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v22 = sub_100003798(&qword_100061578);
  uint64_t v23 = sub_100003798(&qword_100061580);
  uint64_t v5 = sub_100003798(&qword_100061588);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v24 = v5;
  uint64_t v25 = v6;
  swift_getTupleTypeMetadata();
  sub_100047D28();
  swift_getWitnessTable();
  uint64_t v7 = sub_100047CC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  long long v13 = &v18[-v12];
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v19 = v6;
  uint64_t v20 = v14;
  uint64_t v21 = v2;
  sub_1000479D8();
  sub_100047CB8();
  swift_getWitnessTable();
  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
  v15(v13, v11, v7);
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v15(a2, v13, v7);
  return ((uint64_t (*)(unsigned char *, uint64_t))v16)(v13, v7);
}

uint64_t sub_100023090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v124 = a3;
  uint64_t v114 = a4;
  uint64_t v120 = a2;
  uint64_t v96 = *(void *)(a2 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v95 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v113 = (char *)&v90 - v7;
  uint64_t v94 = sub_100004714(&qword_100061590);
  __chkstk_darwin(v94);
  double v91 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100004714(&qword_100061598);
  __chkstk_darwin(v92);
  os_log_type_t v93 = (uint64_t *)((char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v107 = sub_100047628();
  uint64_t v106 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  unint64_t v105 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_100004714(&qword_100061588);
  uint64_t v11 = __chkstk_darwin(v110);
  uint64_t v112 = (uint64_t)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v116 = (uint64_t)&v90 - v13;
  uint64_t v109 = sub_100004714(&qword_100061580);
  uint64_t v14 = __chkstk_darwin(v109);
  uint64_t v111 = (uint64_t)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v123 = (uint64_t)&v90 - v16;
  uint64_t v17 = type metadata accessor for FriendInviteInfoCardView();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v90 - v20;
  uint64_t v108 = sub_100047658();
  uint64_t v104 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  unint64_t v103 = (char *)&v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_100004714(&qword_1000615A0);
  __chkstk_darwin(v117);
  uint64_t v24 = (char *)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100004714(&qword_100061578);
  uint64_t v118 = *(void *)(v119 - 8);
  uint64_t v25 = __chkstk_darwin(v119);
  uint64_t v122 = (char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  long long v121 = (char *)&v90 - v27;
  uint64_t v28 = *(int *)(v17 + 36);
  uint64_t v101 = a1;
  uint64_t v90 = a1 + v28;
  id v29 = [*(id *)(a1 + v28) internal];
  unint64_t v102 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v30 = v17;
  Class v115 = (void (*)(char *, uint64_t))v17;
  v102(v21, a1, v17);
  uint64_t v31 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v99 = ((v31 + 32) & ~v31) + v19;
  uint64_t v32 = (v31 + 32) & ~v31;
  uint64_t v100 = v32;
  uint64_t v98 = v31 | 7;
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = v120;
  uint64_t v35 = v124;
  *(void *)(v33 + 16) = v120;
  *(void *)(v33 + 24) = v35;
  uint64_t v97 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 32);
  v97(v33 + v32, v21, v30);
  Swift::String v36 = v103;
  uint64_t v37 = v34;
  sub_100047648();
  sub_100047D08();
  sub_100047858();
  uint64_t v38 = v104;
  uint64_t v39 = v108;
  (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v24, v36, v108);
  uint64_t v40 = &v24[*(int *)(v117 + 36)];
  long long v41 = v135;
  *(_OWORD *)uint64_t v40 = v134;
  *((_OWORD *)v40 + 1) = v41;
  *((_OWORD *)v40 + 2) = v136;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v39);
  Swift::String v42 = v21;
  uint64_t v43 = v101;
  uint64_t v44 = (uint64_t)v115;
  v102(v21, v101, (uint64_t)v115);
  uint64_t v45 = v124;
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = v37;
  *(void *)(v46 + 24) = v45;
  uint64_t v47 = v44;
  v97(v46 + v100, v42, v44);
  uint64_t v48 = sub_100025578(&qword_1000615A8, &qword_1000615A0, (void (*)(void))sub_100025340);
  uint64_t v49 = v122;
  sub_100047BE8();
  swift_release();
  sub_100004868((uint64_t)v24, &qword_1000615A0);
  (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v121, v49, v119);
  sub_100023F24(v44, v123);
  uint64_t v50 = v106;
  uint64_t v51 = v105;
  uint64_t v52 = v107;
  (*(void (**)(char *, void, uint64_t))(v106 + 104))(v105, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v107);
  LOBYTE(v39) = sub_100047618();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  uint64_t v108 = v48;
  if (v39)
  {
    if (*(unsigned char *)(v90 + 9) == 1)
    {
      id v53 = *(id *)v90;
      id v54 = [*(id *)v90 displayNameWithOptions:0];
      uint64_t v55 = v116;
      if (!v54) {
        id v54 = [v53 displayName];
      }
      sub_100047E68();

      sub_100047708();
      uint64_t v56 = sub_1000476B8();
      uint64_t v58 = v57;
      swift_bridgeObjectRelease();
      uint64_t v130 = v56;
      uint64_t v131 = v58;
      sub_1000036BC();
      uint64_t v59 = sub_100047BA8();
      uint64_t v61 = v60;
      uint64_t v63 = v62;
      uint64_t v65 = v64 & 1;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v67 = sub_100047A68();
      uint64_t v68 = sub_100047B28();
      uint64_t v69 = swift_getKeyPath();
      uint64_t v70 = (v67 << 32) | 0x10001;
    }
    else
    {
      uint64_t v59 = 0;
      uint64_t v61 = 0;
      uint64_t v65 = 0;
      uint64_t v63 = 0;
      uint64_t KeyPath = 0;
      uint64_t v70 = 0;
      uint64_t v69 = 0;
      uint64_t v68 = 0;
      uint64_t v55 = v116;
    }
    id v73 = v93;
    *os_log_type_t v93 = v59;
    v73[1] = v61;
    v73[2] = v65;
    v73[3] = v63;
    v73[4] = KeyPath;
    v73[5] = v70;
    v73[6] = v69;
    v73[7] = v68;
    swift_storeEnumTagMultiPayload();
    sub_100004714(&qword_1000615C0);
    sub_100025398();
    sub_100025694();
    uint64_t v74 = sub_100047A18();
    uint64_t v75 = v96;
    uint64_t v76 = v95;
    uint64_t v47 = (uint64_t)v115;
  }
  else
  {
    uint64_t v71 = (uint64_t)v91;
    if (sub_100022CB8(v47))
    {
      sub_100024060(v47, v71);
      uint64_t v72 = sub_100004714(&qword_1000615B8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v71, 0, 1, v72);
    }
    else
    {
      uint64_t v77 = sub_100004714(&qword_1000615B8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v71, 1, 1, v77);
    }
    uint64_t v75 = v96;
    uint64_t v76 = v95;
    uint64_t v55 = v116;
    sub_1000049DC(v71, (uint64_t)v93, &qword_100061590);
    swift_storeEnumTagMultiPayload();
    sub_100004714(&qword_1000615C0);
    sub_100025398();
    sub_100025694();
    sub_100047A18();
    uint64_t v74 = sub_100004868(v71, &qword_100061590);
  }
  (*(void (**)(uint64_t))(v43 + *(int *)(v47 + 40)))(v74);
  uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  Swift::String v79 = v113;
  uint64_t v80 = v120;
  v78(v113, v76, v120);
  Class v115 = *(void (**)(char *, uint64_t))(v75 + 8);
  v115(v76, v80);
  uint64_t v81 = v118;
  id v82 = v122;
  uint64_t v83 = v119;
  (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v122, v121, v119);
  uint64_t v130 = (uint64_t)v82;
  uint64_t v84 = v111;
  sub_1000049DC(v123, v111, &qword_100061580);
  uint64_t v131 = v84;
  uint64_t v85 = v55;
  uint64_t v86 = v112;
  sub_1000049DC(v85, v112, &qword_100061588);
  uint64_t v132 = v86;
  v78(v76, v79, v80);
  id v133 = v76;
  v129[0] = v83;
  v129[1] = v109;
  v129[2] = v110;
  v129[3] = v80;
  uint64_t OpaqueTypeConformance2 = v117;
  uint64_t v126 = v108;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v126 = sub_100004DB0(&qword_100061650, &qword_100061580);
  unint64_t v127 = sub_10002572C();
  uint64_t v128 = v124;
  sub_10002289C((uint64_t)&v130, 4uLL, (uint64_t)v129);
  id v87 = v115;
  v115(v79, v80);
  sub_100004868(v116, &qword_100061588);
  sub_100004868(v123, &qword_100061580);
  id v88 = *(void (**)(char *, uint64_t))(v81 + 8);
  v88(v121, v83);
  v87(v76, v80);
  sub_100004868(v86, &qword_100061588);
  sub_100004868(v84, &qword_100061580);
  return ((uint64_t (*)(char *, uint64_t))v88)(v122, v83);
}

uint64_t sub_100023E70(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for FriendInviteInfoCardView() + 36);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v1 + 56);
  id v3 = [*(id *)v1 internal];
  id v4 = [v3 playerID];

  uint64_t v5 = sub_100047E68();
  uint64_t v7 = v6;

  v2(v5, v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100023F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100047628();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v6);
  char v10 = sub_100047618();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v10) {
    unint64_t v11 = 0x4000000000000000;
  }
  else {
    unint64_t v11 = 0xC000000000000000;
  }
  *(void *)a2 = sub_1000479D8();
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v12 = sub_100004714(&qword_100061690);
  return sub_1000240BC(v3, *(void *)(a1 + 16), *(void *)(a1 + 24), (char *)(a2 + *(int *)(v12 + 44)));
}

uint64_t sub_100024060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_100047968();
  *(void *)(a2 + 8) = 0x4028000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  sub_100004714(&qword_100061660);
  return sub_100024E30(v2, *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1000240BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v76 = type metadata accessor for FriendInviteInfoCardView();
  uint64_t v7 = *(void *)(v76 - 8);
  uint64_t v63 = *(void *)(v7 + 64);
  __chkstk_darwin(v76);
  char v64 = (char *)&v61 - v8;
  uint64_t v9 = sub_100047628();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004714(&qword_100061698);
  uint64_t v79 = *(void *)(v13 - 8);
  uint64_t v80 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v77 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v75 = (char *)&v61 - v17;
  __chkstk_darwin(v16);
  uint64_t v81 = (char *)&v61 - v18;
  uint64_t v19 = sub_100047978();
  uint64_t v20 = a1;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  sub_100024794(v21, (uint64_t)&v82);
  uint64_t v24 = v82;
  uint64_t v62 = v83;
  int v72 = v84;
  long long v73 = v85;
  int v71 = v86;
  int v70 = v87;
  int v69 = v88;
  uint64_t v67 = *((void *)&v89 + 1);
  uint64_t v68 = v89;
  uint64_t v66 = v90;
  uint64_t v65 = v91;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v9);
  LOBYTE(a2) = sub_100047618();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (a2) {
    uint64_t v25 = sub_100047B58();
  }
  else {
    uint64_t v25 = sub_100047AE8();
  }
  uint64_t v26 = v25;
  uint64_t v27 = v64;
  uint64_t v28 = v62;
  uint64_t v74 = v20;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v82 = v19;
  uint64_t v83 = 0x4000000000000000;
  unsigned __int8 v84 = 0;
  *(void *)&long long v85 = v24;
  *((void *)&v85 + 1) = v28;
  unsigned __int8 v86 = v72;
  long long v89 = v73;
  LOBYTE(v90) = v71;
  BYTE1(v90) = v70;
  BYTE2(v90) = v69;
  uint64_t v91 = v68;
  uint64_t v92 = v67;
  uint64_t v93 = v66;
  uint64_t v94 = v65;
  uint64_t v95 = KeyPath;
  uint64_t v96 = v26;
  uint64_t v30 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v27, v20, v76);
  unint64_t v31 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v22;
  *(void *)(v32 + 24) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v32 + v31, v27, v30);
  sub_100004714(&qword_1000616A0);
  sub_100025B60();
  uint64_t v33 = v75;
  sub_100047BE8();
  swift_release();
  uint64_t v34 = v91;
  sub_100003710(v85, *((uint64_t *)&v85 + 1), v86);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100025C24(v34);
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v81, v33, v80);
  uint64_t v35 = v74 + *(int *)(v30 + 36);
  uint64_t v36 = *(void *)(v35 + 24);
  if (v36)
  {
    uint64_t v82 = *(void *)(v35 + 16);
    uint64_t v83 = v36;
    sub_1000036BC();
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100047BA8();
    uint64_t v39 = v38;
    char v41 = v40 & 1;
    sub_100047AE8();
    uint64_t v76 = sub_100047B88();
    uint64_t v75 = v42;
    char v44 = v43;
    uint64_t v74 = v45;
    swift_release();
    uint64_t v46 = v44 & 1;
    sub_100003710(v37, v39, v41);
    swift_bridgeObjectRelease();
    *(void *)&long long v73 = swift_getKeyPath();
    int v47 = 65537;
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v75 = 0;
    uint64_t v46 = 0;
    uint64_t v74 = 0;
    *(void *)&long long v73 = 0;
    int v47 = 0;
  }
  uint64_t v48 = v79;
  uint64_t v49 = v80;
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  uint64_t v51 = v77;
  v50(v77, v81, v80);
  uint64_t v52 = v78;
  v50(v78, v51, v49);
  id v53 = &v52[*(int *)(sub_100004714(&qword_1000616C0) + 48)];
  uint64_t v54 = v76;
  uint64_t v55 = (uint64_t)v75;
  *(void *)id v53 = v76;
  *((void *)v53 + 1) = v55;
  *((void *)v53 + 2) = v46;
  char v56 = v46;
  uint64_t v57 = v74;
  uint64_t v58 = v73;
  *((void *)v53 + 3) = v74;
  *((void *)v53 + 4) = v58;
  v53[42] = BYTE2(v47);
  *((_WORD *)v53 + 20) = v47;
  sub_100025C70(v54, v55, v56, v57);
  uint64_t v59 = *(void (**)(char *, uint64_t))(v48 + 8);
  v59(v81, v49);
  sub_100025CC0(v54, v55, v56, v57);
  return ((uint64_t (*)(char *, uint64_t))v59)(v51, v49);
}

uint64_t sub_100024794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100047478();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = a1 + *(int *)(type metadata accessor for FriendInviteInfoCardView() + 36);
  sub_100022A60();
  uint64_t v6 = sub_100047B98();
  uint64_t v8 = v7;
  char v19 = v9;
  uint64_t v11 = v10;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (*(unsigned char *)(v5 + 8) == 1)
  {
    uint64_t v13 = sub_100047C78();
    unsigned int v17 = sub_100047A58();
    uint64_t v16 = sub_100047AD8();
    uint64_t v15 = swift_getKeyPath();
    uint64_t v14 = v17;
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v19 & 1;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = KeyPath;
  *(_WORD *)(a2 + 40) = 1;
  *(unsigned char *)(a2 + 42) = 1;
  *(void *)(a2 + 48) = v13;
  *(void *)(a2 + 56) = v14;
  *(void *)(a2 + 64) = v15;
  *(void *)(a2 + 72) = v16;
  sub_1000047BC(v6, v8, v19 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100025D10(v13);
  sub_100025C24(v13);
  sub_100003710(v6, v8, v19 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002496C(uint64_t a1)
{
  uint64_t result = type metadata accessor for FriendInviteInfoCardView();
  uint64_t v3 = a1 + *(int *)(result + 36);
  if (*(unsigned char *)(v3 + 8) == 1)
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 72);
    id v5 = [*(id *)v3 internal];
    id v6 = [v5 playerID];

    uint64_t v7 = sub_100047E68();
    uint64_t v9 = v8;

    v4(v7, v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100024A40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v6 = sub_100004714(&qword_100061688);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100047B68();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = a1;
  uint64_t v56 = sub_100048318();
  uint64_t v57 = v13;
  unint64_t v53 = sub_1000036BC();
  uint64_t v14 = sub_100047BA8();
  v48[0] = v15;
  v48[1] = v16;
  char v18 = v17 & 1;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.headline(_:), v9);
  uint64_t v19 = enum case for Font.Design.rounded(_:);
  uint64_t v20 = sub_100047B08();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 104))(v8, v19, v20);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v8, 0, 1, v20);
  sub_100047B18();
  sub_100004868(v8, &qword_100061688);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = v48[0];
  uint64_t v23 = sub_100047B88();
  uint64_t v50 = v24;
  uint64_t v51 = v23;
  LOBYTE(v9) = v25;
  uint64_t v52 = v26;
  swift_release();
  int v49 = v9 & 1;
  sub_100003710(v14, v22, v18);
  swift_bridgeObjectRelease();
  uint64_t v56 = v54;
  uint64_t v57 = v55;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_100047BA8();
  uint64_t v29 = v28;
  char v31 = v30 & 1;
  sub_100047B38();
  uint64_t v32 = sub_100047B88();
  uint64_t v34 = v33;
  LOBYTE(v8) = v35;
  swift_release();
  sub_100003710(v27, v29, v31);
  swift_bridgeObjectRelease();
  LODWORD(v56) = sub_100047A68();
  uint64_t v36 = sub_100047B78();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  char v42 = v41 & 1;
  sub_100003710(v32, v34, v8 & 1);
  swift_bridgeObjectRelease();
  char v43 = v49;
  LOBYTE(v56) = v49;
  uint64_t v45 = v50;
  uint64_t v44 = v51;
  *(void *)a4 = v51;
  *(void *)(a4 + 8) = v45;
  *(unsigned char *)(a4 + 16) = v43;
  *(void *)(a4 + 24) = v52;
  *(void *)(a4 + 32) = v36;
  *(void *)(a4 + 40) = v38;
  *(unsigned char *)(a4 + 48) = v42;
  *(void *)(a4 + 56) = v40;
  uint64_t v46 = v44;
  sub_1000047BC(v44, v45, v43);
  swift_bridgeObjectRetain();
  sub_1000047BC(v36, v38, v42);
  swift_bridgeObjectRetain();
  sub_100003710(v36, v38, v42);
  swift_bridgeObjectRelease();
  sub_100003710(v46, v45, v56);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100024E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for FriendInviteInfoCardView();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
  sub_100004714(&qword_100061668);
  sub_100004DB0(&qword_100061670, &qword_100061668);
  return sub_100047CF8();
}

uint64_t sub_100024FD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004714(&qword_100061678);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t result = type metadata accessor for FriendInviteInfoCardView();
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v13 = *(void *)(a2 + *(int *)(result + 36) + 32);
  if (*(void *)(v13 + 16) <= (unint64_t)a1)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  char v35 = v9;
  uint64_t v14 = (void *)(v13 + 24 * a1);
  uint64_t v15 = v14[4];
  uint64_t v16 = v14[5];
  uint64_t v17 = v14[6];
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_1000479D8();
  sub_100024A40(v15, v16, v17, (uint64_t)v36);
  uint64_t v18 = v36[0];
  int v32 = v37;
  uint64_t v20 = v38;
  uint64_t v19 = v39;
  uint64_t v21 = v40;
  char v22 = v41;
  uint64_t v33 = v36[1];
  uint64_t v34 = v42;
  swift_bridgeObjectRelease();
  if (*(void *)(v13 + 16) - 1 <= a1)
  {
    uint64_t v24 = sub_100047CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
  }
  else
  {
    sub_100047CD8();
    uint64_t v23 = sub_100047CE8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
  }
  char v30 = v11;
  uint64_t v25 = (uint64_t)v35;
  sub_1000049DC((uint64_t)v11, (uint64_t)v35, &qword_100061678);
  *(void *)a3 = v31;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  *(void *)(a3 + 24) = v18;
  *(void *)(a3 + 32) = v26;
  char v28 = v32;
  *(unsigned char *)(a3 + 40) = v32;
  *(void *)(a3 + 48) = v20;
  *(void *)(a3 + 56) = v19;
  *(void *)(a3 + 64) = v21;
  *(unsigned char *)(a3 + 72) = v22;
  *(void *)(a3 + 80) = v27;
  uint64_t v29 = sub_100004714(&qword_100061680);
  sub_1000049DC(v25, a3 + *(int *)(v29 + 48), &qword_100061678);
  sub_1000047BC(v18, v26, v28);
  swift_bridgeObjectRetain();
  sub_1000047BC(v19, v21, v22);
  swift_bridgeObjectRetain();
  sub_100004868((uint64_t)v30, &qword_100061678);
  sub_100004868(v25, &qword_100061678);
  sub_100003710(v18, v26, v28);
  swift_bridgeObjectRelease();
  sub_100003710(v19, v21, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000252A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100023090(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_1000252B4()
{
  uint64_t v1 = type metadata accessor for FriendInviteInfoCardView();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 36)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
                              + 40))();
}

uint64_t sub_100025328()
{
  return sub_100025AC8((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100023E70);
}

unint64_t sub_100025340()
{
  unint64_t result = qword_1000615B0;
  if (!qword_1000615B0)
  {
    sub_100047658();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000615B0);
  }
  return result;
}

unint64_t sub_100025398()
{
  unint64_t result = qword_1000615C8;
  if (!qword_1000615C8)
  {
    sub_100003798(&qword_1000615C0);
    sub_10002540C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000615C8);
  }
  return result;
}

unint64_t sub_10002540C()
{
  unint64_t result = qword_1000615D0;
  if (!qword_1000615D0)
  {
    sub_100003798(&qword_1000615D8);
    sub_1000254AC();
    sub_100004DB0(&qword_100061630, &qword_100061638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000615D0);
  }
  return result;
}

unint64_t sub_1000254AC()
{
  unint64_t result = qword_1000615E0;
  if (!qword_1000615E0)
  {
    sub_100003798(&qword_1000615E8);
    sub_100025578(&qword_1000615F0, &qword_1000615F8, (void (*)(void))sub_1000255F4);
    sub_100004DB0(&qword_100061620, &qword_100061628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000615E0);
  }
  return result;
}

uint64_t sub_100025578(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000255F4()
{
  unint64_t result = qword_100061600;
  if (!qword_100061600)
  {
    sub_100003798(&qword_100061608);
    sub_100004DB0(&qword_100061610, &qword_100061618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061600);
  }
  return result;
}

unint64_t sub_100025694()
{
  unint64_t result = qword_100061640;
  if (!qword_100061640)
  {
    sub_100003798(&qword_100061590);
    sub_100004DB0(&qword_100061648, &qword_1000615B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061640);
  }
  return result;
}

unint64_t sub_10002572C()
{
  unint64_t result = qword_100061658;
  if (!qword_100061658)
  {
    sub_100003798(&qword_100061588);
    sub_100025398();
    sub_100025694();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061658);
  }
  return result;
}

uint64_t sub_1000257A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000478E8();
  *a1 = result;
  return result;
}

uint64_t sub_1000257D4()
{
  return sub_1000478F8();
}

uint64_t sub_1000257FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100047908();
  *a1 = result;
  return result;
}

uint64_t sub_100025828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100047908();
  *a1 = result;
  return result;
}

uint64_t sub_100025854()
{
  return sub_100047918();
}

uint64_t sub_100025880()
{
  return sub_100047918();
}

uint64_t sub_1000258B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for FriendInviteInfoCardView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100024FD4(a1, v6, a2);
}

uint64_t sub_100025950()
{
  uint64_t v1 = type metadata accessor for FriendInviteInfoCardView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000479C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100025AB0()
{
  return sub_100025AC8((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10002496C);
}

uint64_t sub_100025AC8(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for FriendInviteInfoCardView() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a1(v5, v2, v3);
}

unint64_t sub_100025B60()
{
  unint64_t result = qword_1000616A8;
  if (!qword_1000616A8)
  {
    sub_100003798(&qword_1000616A0);
    sub_100004DB0(&qword_1000616B0, &qword_1000616B8);
    sub_100004DB0(&qword_100061630, &qword_100061638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000616A8);
  }
  return result;
}

uint64_t sub_100025C24(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100025C70(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000047BC(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100025CC0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100003710(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100025D10(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_100025D60()
{
}

unint64_t sub_100025D80()
{
  unint64_t result = qword_1000616C8;
  if (!qword_1000616C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000616C8);
  }
  return result;
}

void sub_100025DD4()
{
}

uint64_t sub_100025DFC()
{
  return 8;
}

uint64_t sub_100025E08()
{
  return swift_release();
}

uint64_t sub_100025E10(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100025E20()
{
  return sub_100047DE8();
}

void *sub_100025E68(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100025E74()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100025EA4()
{
  return swift_getWitnessTable();
}

id sub_100026098()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoadingStatusView();
  [super dealloc];
}

uint64_t type metadata accessor for LoadingStatusView()
{
  return self;
}

uint64_t sub_100026100()
{
  return _swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for SectionInfo()
{
  return self;
}

id sub_100026134()
{
  *(void *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection] = 2;
  *(void *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo] = &_swiftEmptyDictionarySingleton;
  uint64_t v1 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes] = &_swiftEmptyDictionarySingleton;
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for WideFlowLayout();
  [super init];
  [v2 setScrollDirection:1];
  [v2 setHeaderReferenceSize:0.0, 36.0];
  [v2 setEstimatedItemSize:42.0, 42.0];
  [v2 setSectionInset:0.0, 16.0, 0.0, 16.0];

  return v2;
}

id sub_100026258(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection] = 2;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo] = &_swiftEmptyDictionarySingleton;
  uint64_t v3 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes] = &_swiftEmptyDictionarySingleton;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes] = &_swiftEmptyDictionarySingleton;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for WideFlowLayout();
  id v4 = [super initWithCoder:a1];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    [v6 setScrollDirection:1];
    [v6 setHeaderReferenceSize:0.0, 36.0];
    [v6 setEstimatedItemSize:42.0, 42.0];
    [v6 setSectionInset:0.0, 16.0, 0.0, 16.0];
  }
  return v5;
}

void sub_1000263B8()
{
  uint64_t v1 = v0;
  id v2 = [v0 collectionView];
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  unint64_t v4 = (unint64_t)[v2 numberOfSections];
  id v5 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo];
  swift_beginAccess();
  uint64_t v62 = v5;
  *(void *)id v5 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_50;
  }
  if (!v4)
  {
    uint64_t v6 = 0;
LABEL_27:
    [v1 sectionInset:v60];
    uint64_t v40 = v39;
    [v1 sectionInset];
    double v42 = v41;
    if (v4)
    {
      uint64_t v43 = 0;
      double v44 = 0.0;
      while (1)
      {
        uint64_t v45 = *(void *)v62;
        if (!*(void *)(*(void *)v62 + 16)) {
          goto LABEL_44;
        }
        unint64_t v46 = sub_100034688(v43);
        if ((v47 & 1) == 0) {
          goto LABEL_45;
        }
        uint64_t v48 = *(void *)(*(void *)(v45 + 56) + 8 * v46);
        uint64_t v49 = *(void *)(v48 + 16);
        if (v49 >= 1)
        {
          *(void *)(v48 + 72) = v40;
          *(double *)(v48 + 80) = v42;
          if (!v6) {
            goto LABEL_46;
          }
          uint64_t v50 = v49 / v6;
          BOOL v14 = __OFADD__(v50, 1);
          uint64_t v51 = v50 + 1;
          if (v14) {
            goto LABEL_47;
          }
          *(void *)(v48 + 24) = v6;
          *(void *)(v48 + 32) = v51;
          double v52 = (double)v51;
          swift_retain();
          [v1 headerReferenceSize];
          double v54 = v53;
          [v1 estimatedItemSize];
          double v56 = v54 + (v55 + *(double *)(v48 + 112)) * v52;
          [v1 estimatedItemSize];
          double v58 = (v57 + *(double *)(v48 + 104)) * (double)v6 - *(double *)(v48 + 104);
          *(double *)(v48 + 88) = v58;
          *(double *)(v48 + 96) = v56;
          swift_release();
          if (v58 > v44) {
            double v44 = v58;
          }
          double v42 = v42 + v56;
        }
        if (v4 == ++v43) {
          goto LABEL_39;
        }
      }
    }
    double v44 = 0.0;
LABEL_39:

    uint64_t v59 = (double *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
    double *v59 = v44;
    v59[1] = v42 + -50.0;
    return;
  }
  uint64_t v61 = OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection;
  uint64_t v60 = type metadata accessor for SectionInfo();
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)(v9 + 64) = 0u;
    *(_OWORD *)(v9 + 80) = 0u;
    *(_OWORD *)(v9 + 96) = 0u;
    *(void *)(v9 + 112) = 0;
    uint64_t v10 = (uint64_t)[v3 numberOfItemsInSection:v7];
    *(void *)(v9 + 16) = v10;
    uint64_t v11 = *(void *)&v1[v61];
    *(void *)(v9 + 32) = v11;
    if (!v11) {
      break;
    }
    if (v10 == 0x8000000000000000 && v11 == -1) {
      goto LABEL_48;
    }
    uint64_t v13 = v10 / v11;
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_42;
    }
    id v16 = (id)v4;
    uint64_t v17 = v3;
    *(void *)(v9 + 24) = v15;
    [v1 headerReferenceSize];
    *(void *)(v9 + 40) = v18;
    *(void *)(v9 + 48) = v19;
    [v1 estimatedItemSize];
    *(void *)(v9 + 56) = v20;
    *(void *)(v9 + 64) = v21;
    [v1 minimumInteritemSpacing];
    uint64_t v23 = v22;
    uint64_t v24 = v1;
    [v1 minimumLineSpacing];
    *(void *)(v9 + 104) = v23;
    *(void *)(v9 + 112) = v25;
    if (*(void *)(v9 + 24) > v6) {
      uint64_t v6 = *(void *)(v9 + 24);
    }
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *(void **)v62;
    *(void *)uint64_t v62 = 0x8000000000000000;
    unint64_t v29 = sub_100034688(v7);
    uint64_t v30 = v27[2];
    BOOL v31 = (v28 & 1) == 0;
    uint64_t v32 = v30 + v31;
    if (__OFADD__(v30, v31)) {
      goto LABEL_43;
    }
    char v33 = v28;
    if (v27[3] >= v32)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v28) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_100028268();
        if (v33) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_10002795C(v32, isUniquelyReferenced_nonNull_native);
      unint64_t v34 = sub_100034688(v7);
      if ((v33 & 1) != (v35 & 1)) {
        goto LABEL_51;
      }
      unint64_t v29 = v34;
      if (v33)
      {
LABEL_5:
        uint64_t v8 = v27[7];
        swift_release();
        *(void *)(v8 + 8 * v29) = v9;
        goto LABEL_6;
      }
    }
    v27[(v29 >> 6) + 8] |= 1 << v29;
    uint64_t v36 = 8 * v29;
    *(void *)(v27[6] + v36) = v7;
    *(void *)(v27[7] + v36) = v9;
    uint64_t v37 = v27[2];
    BOOL v14 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v14) {
      goto LABEL_49;
    }
    v27[2] = v38;
LABEL_6:
    ++v7;
    *(void *)uint64_t v62 = v27;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    unint64_t v4 = (unint64_t)v16;
    uint64_t v3 = v17;
    uint64_t v1 = v24;
    if (v16 == (id)v7) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  sub_100048348();
  __break(1u);
}

void sub_100026838()
{
  uint64_t v1 = sub_100047608();
  uint64_t v68 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v77 = (char *)v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  long long v73 = (char *)v64 - v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v64 - v6;
  uint64_t v8 = (objc_class *)type metadata accessor for WideFlowLayout();
  v80.receiver = v0;
  v80.super_class = v8;
  [super prepareLayout];
  id v9 = [v0 collectionView];
  if (!v9) {
    return;
  }
  v64[0] = v9;
  [v9 bounds];
  if (v10 <= 0.0
    || (double v11 = v10,
        sub_1000263B8(),
        uint64_t v12 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo],
        swift_beginAccess(),
        uint64_t v66 = v12,
        (uint64_t v65 = *(void *)(*(void *)v12 + 16)) == 0))
  {
LABEL_44:

    return;
  }
  uint64_t v78 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes];
  uint64_t v67 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes];
  swift_beginAccess();
  uint64_t v75 = 0;
  uint64_t v74 = (void (**)(char *, char *, uint64_t))(v68 + 16);
  v64[1] = UICollectionElementKindSectionHeader;
  uint64_t v13 = (void (**)(uint64_t, uint64_t))(v68 + 8);
  int v72 = (void (**)(char *, char *, uint64_t))(v68 + 32);
  int v69 = (void (**)(uint64_t, uint64_t))(v68 + 8);
  while (1)
  {
    uint64_t v14 = *(void *)v66;
    if (!*(void *)(*(void *)v66 + 16)) {
      goto LABEL_50;
    }
    unint64_t v15 = sub_100034688(v75);
    if ((v16 & 1) == 0) {
      break;
    }
    uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
    if (*(uint64_t *)(v17 + 16) < 1) {
      goto LABEL_6;
    }
    swift_retain();
    sub_1000475F8();
    uint64_t v18 = *(void *)v67;
    if (*(void *)(*(void *)v67 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_1000346CC((uint64_t)v7);
      if (v20)
      {
        id v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
        swift_bridgeObjectRelease();
LABEL_15:
        id v24 = v21;
        uint64_t v25 = v24;
        double v26 = *(double *)(v17 + 40);
        if (v26 == 0.0) {
          double v26 = v11;
        }
        [v24 setFrame:*(double *)(v17 + 72), *(double *)(v17 + 80), v26, *(double *)(v17 + 48)];
        uint64_t v27 = (uint64_t)v73;
        (*v74)(v73, v7, v1);
        char v28 = v67;
        swift_beginAccess();
        id v29 = v25;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v79 = *(void **)v28;
        *(void *)char v28 = 0x8000000000000000;
        sub_100028008((uint64_t)v29, v27, isUniquelyReferenced_nonNull_native);
        *(void *)char v28 = v79;
        swift_bridgeObjectRelease();
        (*v13)(v27, v1);
        swift_endAccess();

        uint64_t v31 = *(void *)(v17 + 16);
        if (v31 < 0) {
          goto LABEL_52;
        }
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
    sub_100047E68();
    NSString v22 = sub_100047E38();
    swift_bridgeObjectRelease();
    Class isa = sub_1000475D8().super.isa;
    id v21 = [self layoutAttributesForSupplementaryViewOfKind:v22 withIndexPath:isa];

    if (v21) {
      goto LABEL_15;
    }
    uint64_t v25 = 0;
    uint64_t v31 = *(void *)(v17 + 16);
    if (v31 < 0) {
      goto LABEL_52;
    }
LABEL_20:
    if (v31)
    {
      swift_beginAccess();
      uint64_t v32 = 0;
      uint64_t v71 = v17;
      uint64_t v70 = v31;
      do
      {
        if (v31 == v32)
        {
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        unint64_t v34 = v73;
        sub_1000475F8();
        char v35 = *v13;
        (*v13)((uint64_t)v7, v1);
        (*v72)(v7, v34, v1);
        uint64_t v36 = *(void *)v78;
        if (*(void *)(*(void *)v78 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v37 = sub_1000346CC((uint64_t)v7);
          if (v38)
          {
            id v39 = *(id *)(*(void *)(v36 + 56) + 8 * v37);
            swift_bridgeObjectRelease();

            goto LABEL_31;
          }
          swift_bridgeObjectRelease();
        }

        Class v40 = sub_1000475D8().super.isa;
        id v39 = [self layoutAttributesForCellWithIndexPath:v40];

        if (!v39)
        {
          uint64_t v25 = 0;
          goto LABEL_24;
        }
LABEL_31:
        id v41 = v39;
        if (!*(void *)(v17 + 24)) {
          goto LABEL_47;
        }
        double v42 = v41;
        uint64_t v76 = v35;
        sub_100047638();
        [v42 setFrame:];
        uint64_t v43 = *v74;
        uint64_t v44 = (uint64_t)v77;
        uint64_t v45 = v7;
        unint64_t v46 = v7;
        uint64_t v47 = v1;
        (*v74)(v77, v46, v1);
        uint64_t v48 = v78;
        swift_beginAccess();
        uint64_t v25 = v42;
        id v49 = v42;
        int v50 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v79 = *(void **)v48;
        uint64_t v51 = v79;
        *(void *)uint64_t v48 = 0x8000000000000000;
        unint64_t v53 = sub_1000346CC(v44);
        uint64_t v54 = v51[2];
        BOOL v55 = (v52 & 1) == 0;
        uint64_t v56 = v54 + v55;
        if (__OFADD__(v54, v55)) {
          goto LABEL_48;
        }
        char v57 = v52;
        if (v51[3] >= v56)
        {
          if (v50)
          {
            uint64_t v60 = v79;
            if ((v52 & 1) == 0) {
              goto LABEL_39;
            }
          }
          else
          {
            sub_10002844C();
            uint64_t v60 = v79;
            if ((v57 & 1) == 0) {
              goto LABEL_39;
            }
          }
        }
        else
        {
          sub_100027C14(v56, v50);
          unint64_t v58 = sub_1000346CC((uint64_t)v77);
          if ((v57 & 1) != (v59 & 1)) {
            goto LABEL_53;
          }
          unint64_t v53 = v58;
          uint64_t v60 = v79;
          if ((v57 & 1) == 0)
          {
LABEL_39:
            v60[(v53 >> 6) + 8] |= 1 << v53;
            uint64_t v1 = v47;
            v43((char *)(v60[6] + *(void *)(v68 + 72) * v53), v77, v47);
            *(void *)(v60[7] + 8 * v53) = v49;
            uint64_t v61 = v60[2];
            BOOL v62 = __OFADD__(v61, 1);
            uint64_t v63 = v61 + 1;
            if (v62) {
              goto LABEL_49;
            }
            v60[2] = v63;
            goto LABEL_23;
          }
        }
        uint64_t v33 = v60[7];

        *(void *)(v33 + 8 * v53) = v49;
        uint64_t v1 = v47;
LABEL_23:
        *(void *)uint64_t v78 = v60;
        swift_bridgeObjectRelease();
        uint64_t v13 = v69;
        v76((uint64_t)v77, v1);
        swift_endAccess();

        uint64_t v7 = v45;
        uint64_t v17 = v71;
        uint64_t v31 = v70;
LABEL_24:
        ++v32;
      }
      while (v31 != v32);
    }
    swift_release();

    (*v13)((uint64_t)v7, v1);
LABEL_6:
    if (++v75 == v65) {
      goto LABEL_44;
    }
  }
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  sub_100048348();
  __break(1u);
}

id sub_100027054(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_100027188(v9, a1, a2, a3, a4);
  uint64_t v11 = v10;
  id result = [v4 collectionView];
  if (result)
  {
    uint64_t v13 = result;
    [result contentOffset];
    double v15 = v14;

    [v4 sectionInset];
    double v17 = v15 + v16;
    swift_beginAccess();
    uint64_t v18 = swift_bridgeObjectRetain();
    sub_100027394(v18, v17, a1, a2, a3, a4);
    sub_1000286E4(v19);
    return (id)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100027188(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  int64_t v10 = 0;
  uint64_t v12 = a1 + 64;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v13 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v11;
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  if ((v14 & v11) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v19 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v19 < v16)
    {
      unint64_t v20 = *(void *)(v12 + 8 * v19);
      ++v10;
      if (v20) {
        goto LABEL_22;
      }
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v16) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v12 + 8 * v10);
      if (v20) {
        goto LABEL_22;
      }
      int64_t v10 = v19 + 2;
      if (v19 + 2 >= v16) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v12 + 8 * v10);
      if (v20) {
        goto LABEL_22;
      }
      int64_t v10 = v19 + 3;
      if (v19 + 3 >= v16) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v12 + 8 * v10);
      if (v20)
      {
LABEL_22:
        unint64_t v15 = (v20 - 1) & v20;
        for (unint64_t i = __clz(__rbit64(v20)) + (v10 << 6); ; unint64_t i = v17 | (v10 << 6))
        {
          id v22 = *(id *)(*(void *)(a1 + 56) + 8 * i);
          [v22 frame];
          v28.origin.x = v23;
          v28.origin.y = v24;
          v28.size.width = v25;
          v28.size.height = v26;
          v27.origin.x = a2;
          v27.origin.y = a3;
          v27.size.width = a4;
          v27.size.height = a5;
          if (CGRectIntersectsRect(v27, v28))
          {
            sub_100048238();
            sub_100048258();
            sub_100048268();
            sub_100048248();
            if (!v15) {
              goto LABEL_7;
            }
          }
          else
          {

            if (!v15) {
              goto LABEL_7;
            }
          }
LABEL_6:
          unint64_t v17 = __clz(__rbit64(v15));
          v15 &= v15 - 1;
        }
      }
      int64_t v21 = v19 + 4;
      if (v21 < v16)
      {
        unint64_t v20 = *(void *)(v12 + 8 * v21);
        if (v20)
        {
          int64_t v10 = v21;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v10 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_28;
          }
          if (v10 >= v16) {
            break;
          }
          unint64_t v20 = *(void *)(v12 + 8 * v10);
          ++v21;
          if (v20) {
            goto LABEL_22;
          }
        }
      }
    }
LABEL_26:
    swift_release();
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_100027394(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  int64_t v12 = 0;
  uint64_t v13 = a1 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(a1 + 64);
  int64_t v23 = (unint64_t)(v14 + 63) >> 6;
  if (v16) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v19 = v12 + 1;
  if (!__OFADD__(v12, 1))
  {
    if (v19 < v23)
    {
      unint64_t v20 = *(void *)(v13 + 8 * v19);
      ++v12;
      if (v20) {
        goto LABEL_22;
      }
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v23) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v13 + 8 * v12);
      if (v20) {
        goto LABEL_22;
      }
      int64_t v12 = v19 + 2;
      if (v19 + 2 >= v23) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v13 + 8 * v12);
      if (v20) {
        goto LABEL_22;
      }
      int64_t v12 = v19 + 3;
      if (v19 + 3 >= v23) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v13 + 8 * v12);
      if (v20)
      {
LABEL_22:
        unint64_t v16 = (v20 - 1) & v20;
        for (unint64_t i = __clz(__rbit64(v20)) + (v12 << 6); ; unint64_t i = v17 | (v12 << 6))
        {
          id v22 = *(id *)(*(void *)(a1 + 56) + 8 * i);
          [v22 frame];
          [v22 setFrame:a2];
          [v22 frame];
          v25.origin.x = a3;
          v25.origin.y = a4;
          v25.size.width = a5;
          v25.size.height = a6;
          if (CGRectIntersectsRect(v24, v25))
          {
            sub_100048238();
            sub_100048258();
            sub_100048268();
            sub_100048248();
            if (!v16) {
              goto LABEL_7;
            }
          }
          else
          {

            if (!v16) {
              goto LABEL_7;
            }
          }
LABEL_6:
          unint64_t v17 = __clz(__rbit64(v16));
          v16 &= v16 - 1;
        }
      }
      int64_t v21 = v19 + 4;
      if (v21 < v23)
      {
        unint64_t v20 = *(void *)(v13 + 8 * v21);
        if (v20)
        {
          int64_t v12 = v21;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v12 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_28;
          }
          if (v12 >= v23) {
            break;
          }
          unint64_t v20 = *(void *)(v13 + 8 * v12);
          ++v21;
          if (v20) {
            goto LABEL_22;
          }
        }
      }
    }
LABEL_26:
    swift_release();
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

void *sub_10002767C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (sub_100047E68() == a1 && v6 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_100048328();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (!*(void *)(v10 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1000346CC(a3);
  if (v12)
  {
    uint64_t v13 = *(void **)(*(void *)(v10 + 56) + 8 * v11);
    id v14 = v13;
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_bridgeObjectRelease();
  return v13;
}

id sub_1000278A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WideFlowLayout();
  return [super dealloc];
}

uint64_t type metadata accessor for WideFlowLayout()
{
  return self;
}

uint64_t sub_10002795C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004714(&qword_100061900);
  uint64_t result = sub_1000482C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_100048358();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100027C14(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100047608();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100004714(&qword_100061920);
  int v45 = a2;
  uint64_t v10 = sub_1000482C8();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  id v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  id v39 = v2;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  double v42 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v44 = v6;
  unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v17 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    char v24 = v41;
    unint64_t v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v25 = v41[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            unint64_t v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v44 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v45)
    {
      (*v16)(v8, v28, v5);
      id v29 = *(id *)(*(void *)(v9 + 56) + 8 * v22);
    }
    else
    {
      (*v42)(v8, v28, v5);
      id v29 = *(id *)(*(void *)(v9 + 56) + 8 * v22);
    }
    sub_100028C48();
    uint64_t result = sub_100047DD8();
    uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 48) + v27 * v20, v8, v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v20) = v29;
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  char v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

void sub_100028008(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_100047608();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_1000346CC(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10002844C();
    goto LABEL_7;
  }
  sub_100027C14(v17, a3 & 1);
  unint64_t v22 = sub_1000346CC(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_100048348();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1000281B0(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1000281B0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_100047608();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_100028268()
{
  uint64_t v1 = v0;
  sub_100004714(&qword_100061900);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000482B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_10002840C()
{
  unint64_t result = qword_100061908;
  if (!qword_100061908)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100061908);
  }
  return result;
}

id sub_10002844C()
{
  uint64_t v1 = sub_100047608();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004714(&qword_100061920);
  char v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1000482B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *char v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    int64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000286E4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000482A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1000482A8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
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
    uint64_t v9 = sub_100048218();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000289E8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000482A8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100047F78();
}

void (*sub_1000288B0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100028960(v6, a2, a3);
  return sub_100028918;
}

void sub_100028918(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100028960(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100048208();
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
    return sub_1000289E0;
  }
  __break(1u);
  return result;
}

void sub_1000289E0(id *a1)
{
}

uint64_t sub_1000289E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000482A8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
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
    uint64_t v10 = sub_1000482A8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100028BEC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100004714(&qword_100061910);
          uint64_t v12 = sub_1000288B0(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10002840C();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000482E8();
  __break(1u);
  return result;
}

unint64_t sub_100028BEC()
{
  unint64_t result = qword_100061918;
  if (!qword_100061918)
  {
    sub_100003798(&qword_100061910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061918);
  }
  return result;
}

unint64_t sub_100028C48()
{
  unint64_t result = qword_100061928;
  if (!qword_100061928)
  {
    sub_100047608();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061928);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteAcceptedStatusView(uint64_t a1, long long *a2)
{
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = v3;
  id v5 = (id)v4;
  swift_retain();
  return a1;
}

uint64_t destroy for FriendInviteAcceptedStatusView(id *a1)
{
  return swift_release();
}

uint64_t assignWithCopy for FriendInviteAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FriendInviteAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteAcceptedStatusView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FriendInviteAcceptedStatusView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FriendInviteAcceptedStatusView()
{
  return &type metadata for FriendInviteAcceptedStatusView;
}

uint64_t sub_100028E5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100028E78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v3 = sub_1000474B8();
  __chkstk_darwin(v3 - 8);
  uint64_t v21 = sub_100047478();
  uint64_t v4 = *(void *)(v21 - 8);
  uint64_t v5 = __chkstk_darwin(v21);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  id v10 = [a1 displayNameWithOptions:0];
  if (!v10) {
    id v10 = [a1 displayName];
  }
  sub_100047E68();

  sub_1000474A8();
  sub_100047488();
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  swift_getKeyPath();
  sub_100047B48();
  uint64_t v12 = sub_100047AF8();
  swift_release();
  uint64_t v23 = v12;
  sub_100025D80();
  sub_100047458();
  BOOL v13 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v19._countAndFlagsBits = 0xE000000000000000;
  v24._object = (void *)0x800000010004A1C0;
  v24._countAndFlagsBits = 0xD000000000000020;
  v25.value._countAndFlagsBits = 0;
  v25.value._object = 0;
  v14.super.Class isa = v13;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_100047498(v24, v25, v14, v26, v19);

  sub_1000474A8();
  sub_100047488();
  uint64_t v15 = swift_getKeyPath();
  __chkstk_darwin(v15);
  swift_getKeyPath();
  uint64_t v23 = sub_100047B48();
  sub_100047458();
  sub_100047468();
  unint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v17 = v21;
  v16(v7, v21);
  return ((uint64_t (*)(char *, uint64_t))v16)(v9, v17);
}

uint64_t sub_1000291AC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v43 = a4;
  uint64_t v7 = sub_100004714(&qword_1000609D8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100004714(&qword_1000609E0);
  __chkstk_darwin(v42);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100004714(&qword_100061938);
  uint64_t v45 = *(void *)(v41 - 8);
  uint64_t v12 = __chkstk_darwin(v41);
  NSBundle v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v38 - v15;
  uint64_t v17 = sub_100047CE8();
  uint64_t v39 = *(void *)(v17 - 8);
  uint64_t v18 = v39;
  uint64_t v40 = v17;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v44 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v38 - v21;
  uint64_t v38 = (char *)&v38 - v21;
  sub_100047CD8();
  *(void *)uint64_t v9 = sub_100047978();
  *((void *)v9 + 1) = 0x4024000000000000;
  v9[16] = 0;
  uint64_t v23 = sub_100004714(&qword_100061940);
  sub_1000295FC(a1, a2, a3, (uint64_t)&v9[*(int *)(v23 + 44)]);
  sub_100047D18();
  sub_100004378(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, 0.0, 1);
  sub_100004868((uint64_t)v9, &qword_1000609D8);
  Swift::String v24 = (void *)swift_allocObject();
  v24[2] = a1;
  v24[3] = a2;
  v24[4] = a3;
  sub_100029E84();
  id v25 = a1;
  swift_retain();
  sub_100047BE8();
  swift_release();
  sub_100004868((uint64_t)v11, &qword_1000609E0);
  uint64_t v26 = v45;
  uint64_t v27 = v41;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v16, v14, v41);
  unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  id v29 = v44;
  uint64_t v30 = v40;
  v28(v44, v22, v40);
  unint64_t v31 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v32 = v27;
  v31(v14, v16, v27);
  char v33 = v43;
  v28(v43, v29, v30);
  uint64_t v34 = sub_100004714(&qword_100061958);
  v31(&v33[*(int *)(v34 + 48)], v14, v32);
  BOOL v35 = *(void (**)(char *, uint64_t))(v45 + 8);
  v35(v16, v32);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v39 + 8);
  v36(v38, v30);
  v35(v14, v32);
  return ((uint64_t (*)(char *, uint64_t))v36)(v44, v30);
}

uint64_t sub_1000295FC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v29[1] = a2;
  v29[2] = a3;
  uint64_t v30 = a4;
  uint64_t v5 = sub_100004714(&qword_100061960);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = sub_100047658();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  NSBundle v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004714(&qword_1000615A0);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)v29 - v20;
  id v22 = [a1 internal];
  sub_100047648();
  sub_100047D08();
  sub_100047858();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v19, v14, v11);
  uint64_t v23 = &v19[*(int *)(v16 + 44)];
  long long v24 = v32;
  *(_OWORD *)uint64_t v23 = v31;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v33;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_100029F24((uint64_t)v19, (uint64_t)v21, &qword_1000615A0);
  *(void *)uint64_t v10 = sub_1000479E8();
  *((void *)v10 + 1) = 0x4010000000000000;
  v10[16] = 0;
  uint64_t v25 = sub_100004714(&qword_100061968);
  sub_100029904(a1, (uint64_t *)&v10[*(int *)(v25 + 44)]);
  sub_1000049DC((uint64_t)v21, (uint64_t)v19, &qword_1000615A0);
  sub_1000049DC((uint64_t)v10, (uint64_t)v8, &qword_100061960);
  uint64_t v26 = v30;
  sub_1000049DC((uint64_t)v19, v30, &qword_1000615A0);
  uint64_t v27 = sub_100004714(&qword_100061970);
  sub_1000049DC((uint64_t)v8, v26 + *(int *)(v27 + 48), &qword_100061960);
  sub_100004868((uint64_t)v10, &qword_100061960);
  sub_100004868((uint64_t)v21, &qword_1000615A0);
  sub_100004868((uint64_t)v8, &qword_100061960);
  return sub_100004868((uint64_t)v19, &qword_1000615A0);
}

uint64_t sub_100029904@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  BOOL v55 = a2;
  uint64_t v3 = sub_1000479A8();
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  uint64_t v51 = &v46[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100004714(&qword_100061978);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v46[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  char v52 = &v46[-v9];
  uint64_t v10 = sub_100047478();
  __chkstk_darwin(v10 - 8);
  sub_100028E78(a1, (uint64_t)&v46[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  uint64_t v12 = sub_100047B98();
  uint64_t v49 = v13;
  uint64_t v50 = v12;
  uint64_t v48 = v14;
  int v47 = v15 & 1;
  uint64_t v16 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v45._countAndFlagsBits = 0xE000000000000000;
  v61._object = (void *)0x800000010004A1F0;
  v61._countAndFlagsBits = 0xD00000000000001DLL;
  v62.value._countAndFlagsBits = 0;
  v62.value._object = 0;
  v17.super.Class isa = v16;
  v63._countAndFlagsBits = 0;
  v63._object = (void *)0xE000000000000000;
  uint64_t v18 = sub_100047498(v61, v62, v17, v63, v45);
  uint64_t v20 = v19;

  uint64_t v56 = v18;
  uint64_t v57 = v20;
  sub_1000036BC();
  uint64_t v21 = sub_100047BA8();
  uint64_t v23 = v22;
  LOBYTE(a1) = v24 & 1;
  sub_100047B48();
  sub_100047AF8();
  swift_release();
  uint64_t v25 = sub_100047B88();
  uint64_t v27 = v26;
  char v29 = v28;
  swift_release();
  sub_100003710(v21, v23, (char)a1);
  swift_bridgeObjectRelease();
  uint64_t v56 = sub_100047C48();
  uint64_t v30 = sub_100047B78();
  uint64_t v32 = v31;
  LOBYTE(a1) = v33;
  uint64_t v35 = v34;
  sub_100003710(v25, v27, v29 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v56 = v30;
  uint64_t v57 = v32;
  char v58 = a1 & 1;
  uint64_t v59 = v35;
  __int16 v60 = 256;
  uint64_t v36 = v51;
  sub_100047998();
  sub_100004714(&qword_100060838);
  sub_100003724();
  sub_100047C18();
  (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v36, v54);
  sub_100003710(v56, v57, v58);
  swift_bridgeObjectRelease();
  uint64_t v37 = v52;
  sub_100029F24((uint64_t)v8, (uint64_t)v52, &qword_100061978);
  sub_1000049DC((uint64_t)v37, (uint64_t)v8, &qword_100061978);
  uint64_t v38 = v55;
  uint64_t v39 = v49;
  uint64_t v40 = v50;
  uint64_t v41 = v48;
  *BOOL v55 = v50;
  v38[1] = v41;
  LOBYTE(v25) = v47;
  *((unsigned char *)v38 + 16) = v47;
  v38[3] = v39;
  *((_WORD *)v38 + 16) = 256;
  uint64_t v42 = v38;
  uint64_t v43 = sub_100004714(&qword_100061980);
  sub_1000049DC((uint64_t)v8, (uint64_t)v42 + *(int *)(v43 + 48), &qword_100061978);
  sub_1000047BC(v40, v41, v25);
  swift_bridgeObjectRetain();
  sub_100004868((uint64_t)v37, &qword_100061978);
  sub_100004868((uint64_t)v8, &qword_100061978);
  sub_100003710(v40, v41, v25);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100029D34(void *a1, void (*a2)(uint64_t, uint64_t))
{
  id v3 = [a1 internal];
  id v4 = [v3 playerID];

  uint64_t v5 = sub_100047E68();
  uint64_t v7 = v6;

  a2(v5, v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100029DD4@<X0>(uint64_t a1@<X8>)
{
  id v3 = *(void **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  *(void *)a1 = sub_1000479D8();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v6 = sub_100004714(&qword_100061930);
  return sub_1000291AC(v3, v4, v5, (char *)(a1 + *(int *)(v6 + 44)));
}

uint64_t sub_100029E38()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100029E78()
{
  return sub_100029D34(*(void **)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24));
}

unint64_t sub_100029E84()
{
  unint64_t result = qword_100061948;
  if (!qword_100061948)
  {
    sub_100003798(&qword_1000609E0);
    sub_100004DB0(&qword_100061950, &qword_1000609D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061948);
  }
  return result;
}

uint64_t sub_100029F24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004714(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100029F94()
{
  return 8;
}

uint64_t sub_100029FA0()
{
  return swift_release();
}

uint64_t sub_100029FA8(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_100029FBC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100029FC8()
{
  return sub_100004DB0(&qword_100061988, &qword_100061990);
}

uint64_t sub_10002A00C()
{
  return swift_initClassMetadata2();
}

id sub_10002A070()
{
  *(void *)&v0[qword_100061998] = 0;
  *(void *)&v0[qword_1000619A0] = &_swiftEmptyArrayStorage;
  uint64_t v1 = qword_1000619A8;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_100047F88();
  *(void *)&v2[qword_1000619B0] = 0;
  *(void *)&v2[qword_1000619B8] = 100;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PlayerItemsModel();
  return [super init];
}

id sub_10002A160()
{
  return sub_10002A070();
}

uint64_t sub_10002A184()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_10002A1D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayerItemsModel();
  return [super dealloc];
}

uint64_t sub_10002A248(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for PlayerItemsModel()
{
  return sub_100025E74();
}

void *sub_10002A2BC(void *a1, void *a2, int *a3)
{
  objc_super v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    objc_super v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000479C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *objc_super v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)((char *)v4 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (void *)((char *)v4 + v10);
    char v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10002A404(uint64_t a1)
{
  sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1000479C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

void *sub_10002A4B8(void *a1, void *a2, int *a3)
{
  sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000479C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_10002A5B4(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_1000614E0);
    sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000479C8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

char *sub_10002A6E0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004714(&qword_1000614E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000479C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_10002A7C8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_1000614E0);
    uint64_t v6 = sub_100004714(&qword_1000614E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000479C8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  swift_release();
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  swift_release();
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_10002A8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A8F8);
}

uint64_t sub_10002A8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004714(qword_1000614E8);
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

uint64_t sub_10002A9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A9D0);
}

uint64_t sub_10002A9D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004714(qword_1000614E8);
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

uint64_t type metadata accessor for FriendInviteButtonStackView()
{
  uint64_t result = qword_100061A98;
  if (!qword_100061A98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002AADC()
{
  sub_100022800();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10002AB80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002AB9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v20 = sub_100004714(&qword_100061AD8);
  __chkstk_darwin(v20);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004714(&qword_100061AE0);
  __chkstk_darwin(v3);
  int v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004714(&qword_100061AE8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000479C8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003D368((uint64_t)v12);
  char v13 = sub_1000479B8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v13)
  {
    *(void *)uint64_t v8 = sub_1000479D8();
    *((void *)v8 + 1) = 0x4024000000000000;
    v8[16] = 0;
    uint64_t v14 = sub_100004714(&qword_100061B08);
    sub_10002B9A4((uint64_t (*)(uint64_t))sub_10002AF5C, (void (*)(uint64_t))sub_10002B480, &v8[*(int *)(v14 + 44)]);
    char v15 = &qword_100061AE8;
    sub_1000049DC((uint64_t)v8, (uint64_t)v5, &qword_100061AE8);
    swift_storeEnumTagMultiPayload();
    sub_100004DB0(&qword_100061AF8, &qword_100061AE8);
    sub_100004DB0(&qword_100061B00, &qword_100061AD8);
    sub_100047A18();
    uint64_t v16 = (uint64_t)v8;
  }
  else
  {
    *(void *)uint64_t v2 = sub_100047978();
    *((void *)v2 + 1) = 0x4024000000000000;
    v2[16] = 0;
    uint64_t v17 = sub_100004714(&qword_100061AF0);
    sub_10002B9A4((uint64_t (*)(uint64_t))sub_10002B480, (void (*)(uint64_t))sub_10002AF5C, &v2[*(int *)(v17 + 44)]);
    char v15 = &qword_100061AD8;
    sub_1000049DC((uint64_t)v2, (uint64_t)v5, &qword_100061AD8);
    swift_storeEnumTagMultiPayload();
    sub_100004DB0(&qword_100061AF8, &qword_100061AE8);
    sub_100004DB0(&qword_100061B00, &qword_100061AD8);
    sub_100047A18();
    uint64_t v16 = (uint64_t)v2;
  }
  return sub_100004868(v16, v15);
}

uint64_t sub_10002AF5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v2 = sub_100047A38();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  __chkstk_darwin(v2);
  uint64_t v53 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100047888() - 8;
  __chkstk_darwin(v48);
  int v47 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100004714(&qword_100061B20);
  __chkstk_darwin(v51);
  uint64_t v49 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004714(&qword_100061B28);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004714(&qword_100061B30);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  char v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100004714(&qword_100061B38);
  __chkstk_darwin(v50);
  char v52 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for FriendInviteButtonStackView();
  swift_retain();
  sub_100004714(&qword_100061B40);
  sub_10002C210();
  sub_100047CA8();
  uint64_t v16 = *(int *)(v15 + 28);
  char v17 = *(unsigned char *)(v1 + v16);
  uint64_t v18 = v1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = v17;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  uint64_t v21 = *(int *)(v11 + 44);
  uint64_t v22 = (uint64_t)v13;
  uint64_t v23 = (uint64_t *)&v13[v21];
  *uint64_t v23 = KeyPath;
  v23[1] = (uint64_t)sub_10002C690;
  void v23[2] = v20;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v24 = v47;
  uint64_t v25 = &v47[*(int *)(v48 + 28)];
  uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v27 = sub_100047988();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #9.0 }
  *char v24 = _Q0;
  if (*(unsigned char *)(v18 + v16) == 1)
  {
    id v33 = [self systemGray2Color];
    uint64_t v34 = sub_100047C28();
  }
  else
  {
    uint64_t v34 = sub_100047C48();
  }
  uint64_t v35 = v34;
  uint64_t v36 = v49;
  sub_100004758((uint64_t)v24, v49);
  uint64_t v37 = v51;
  *(void *)(v36 + *(int *)(v51 + 52)) = v35;
  *(_WORD *)(v36 + *(int *)(v37 + 56)) = 256;
  sub_1000047CC((uint64_t)v24);
  uint64_t v38 = sub_100047D08();
  uint64_t v40 = v39;
  uint64_t v41 = (uint64_t)v52;
  uint64_t v42 = (uint64_t)&v52[*(int *)(v50 + 36)];
  sub_1000049DC(v36, v42, &qword_100061B20);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(sub_100004714(&qword_100061B80) + 36));
  *uint64_t v43 = v38;
  v43[1] = v40;
  sub_1000049DC(v22, v41, &qword_100061B30);
  sub_100004868(v36, &qword_100061B20);
  sub_100004868(v22, &qword_100061B30);
  uint64_t v44 = v53;
  sub_100047A28();
  sub_10002C44C();
  sub_100013B4C();
  uint64_t v45 = v56;
  sub_100047BD8();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v44, v45);
  return sub_100004868(v41, &qword_100061B38);
}

uint64_t sub_10002B480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v2 = sub_100047A38();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  __chkstk_darwin(v2);
  uint64_t v53 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100047888() - 8;
  __chkstk_darwin(v48);
  int v47 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100004714(&qword_100061B20);
  __chkstk_darwin(v51);
  uint64_t v49 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004714(&qword_100061B28);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004714(&qword_100061B30);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  char v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100004714(&qword_100061B38);
  __chkstk_darwin(v50);
  char v52 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for FriendInviteButtonStackView();
  swift_retain();
  sub_100004714(&qword_100061B40);
  sub_10002C210();
  sub_100047CA8();
  uint64_t v16 = *(int *)(v15 + 28);
  char v17 = *(unsigned char *)(v1 + v16);
  uint64_t v18 = v1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = v17;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  uint64_t v21 = *(int *)(v11 + 44);
  uint64_t v22 = (uint64_t)v13;
  uint64_t v23 = (uint64_t *)&v13[v21];
  *uint64_t v23 = KeyPath;
  v23[1] = (uint64_t)sub_10002C434;
  void v23[2] = v20;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v24 = v47;
  uint64_t v25 = &v47[*(int *)(v48 + 28)];
  uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v27 = sub_100047988();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #9.0 }
  *char v24 = _Q0;
  if (*(unsigned char *)(v18 + v16) == 1)
  {
    id v33 = [self systemGray2Color];
    uint64_t v34 = sub_100047C28();
  }
  else
  {
    uint64_t v34 = sub_100047C58();
  }
  uint64_t v35 = v34;
  uint64_t v36 = v49;
  sub_100004758((uint64_t)v24, v49);
  uint64_t v37 = v51;
  *(void *)(v36 + *(int *)(v51 + 52)) = v35;
  *(_WORD *)(v36 + *(int *)(v37 + 56)) = 256;
  sub_1000047CC((uint64_t)v24);
  uint64_t v38 = sub_100047D08();
  uint64_t v40 = v39;
  uint64_t v41 = (uint64_t)v52;
  uint64_t v42 = (uint64_t)&v52[*(int *)(v50 + 36)];
  sub_1000049DC(v36, v42, &qword_100061B20);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(sub_100004714(&qword_100061B80) + 36));
  *uint64_t v43 = v38;
  v43[1] = v40;
  sub_1000049DC(v22, v41, &qword_100061B30);
  sub_100004868(v36, &qword_100061B20);
  sub_100004868(v22, &qword_100061B30);
  uint64_t v44 = v53;
  sub_100047A28();
  sub_10002C44C();
  sub_100013B4C();
  uint64_t v45 = v56;
  sub_100047BD8();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v44, v45);
  return sub_100004868(v41, &qword_100061B38);
}

uint64_t sub_10002B9A4@<X0>(uint64_t (*a1)(uint64_t)@<X1>, void (*a2)(uint64_t)@<X2>, char *a3@<X8>)
{
  uint64_t v6 = sub_100004714(&qword_100061B10);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v25 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v25 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v25 - v18;
  uint64_t v20 = a1(v17);
  a2(v20);
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v21(v13, v19, v6);
  v21(v10, v16, v6);
  v21(a3, v13, v6);
  uint64_t v22 = sub_100004714(&qword_100061B18);
  v21(&a3[*(int *)(v22 + 48)], v10, v6);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  v23(v16, v6);
  v23(v19, v6);
  v23(v10, v6);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v6);
}

double sub_10002BBB4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100047628();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v39._countAndFlagsBits = 0xE000000000000000;
  v61._countAndFlagsBits = 0x45524F4E4749;
  v61._object = (void *)0xE600000000000000;
  v62.value._countAndFlagsBits = 0;
  v62.value._object = 0;
  v7.super.Class isa = v6;
  v63._countAndFlagsBits = 0;
  v63._object = (void *)0xE000000000000000;
  uint64_t v8 = sub_100047498(v61, v62, v7, v63, v39);
  uint64_t v10 = v9;

  *(void *)&v46[0] = v8;
  *((void *)&v46[0] + 1) = v10;
  sub_1000036BC();
  uint64_t v11 = sub_100047BA8();
  uint64_t v43 = v12;
  uint64_t v44 = v11;
  int v42 = v13;
  uint64_t v45 = v14;
  int v41 = sub_100047AC8();
  uint64_t v15 = enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:);
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v16 = v2;
  v40(v5, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  sub_100047618();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v5, v2);
  sub_100047808();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  sub_100047AD8();
  uint64_t v26 = sub_100047AF8();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  v40(v5, v15, v16);
  LOBYTE(v15) = sub_100047618();
  v17(v5, v16);
  if (v15) {
    uint64_t v28 = sub_100047C48();
  }
  else {
    uint64_t v28 = sub_100047C38();
  }
  char v29 = v42 & 1;
  uint64_t v31 = v43;
  uint64_t v30 = v44;
  uint64_t v48 = v44;
  uint64_t v49 = v43;
  char v50 = v42 & 1;
  uint64_t v51 = v45;
  char v52 = v41;
  uint64_t v53 = v19;
  uint64_t v54 = v21;
  uint64_t v55 = v23;
  uint64_t v56 = v25;
  char v57 = 0;
  uint64_t v58 = KeyPath;
  uint64_t v59 = v26;
  uint64_t v60 = v28;
  sub_100047D08();
  sub_100004538(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v46, 0.0, 1, 0.0, 1);
  sub_100003710(v30, v31, v29);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v32 = v46[11];
  *(_OWORD *)(a1 + 160) = v46[10];
  *(_OWORD *)(a1 + 176) = v32;
  *(_OWORD *)(a1 + 192) = v46[12];
  *(void *)(a1 + 208) = v47;
  long long v33 = v46[7];
  *(_OWORD *)(a1 + 96) = v46[6];
  *(_OWORD *)(a1 + 112) = v33;
  long long v34 = v46[9];
  *(_OWORD *)(a1 + 128) = v46[8];
  *(_OWORD *)(a1 + 144) = v34;
  long long v35 = v46[3];
  *(_OWORD *)(a1 + 32) = v46[2];
  *(_OWORD *)(a1 + 48) = v35;
  long long v36 = v46[5];
  *(_OWORD *)(a1 + 64) = v46[4];
  *(_OWORD *)(a1 + 80) = v36;
  double result = *(double *)v46;
  long long v38 = v46[1];
  *(_OWORD *)a1 = v46[0];
  *(_OWORD *)(a1 + 16) = v38;
  return result;
}

double sub_10002BF08@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100047628();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v35._countAndFlagsBits = 0xE000000000000000;
  v54._countAndFlagsBits = 0x545045434341;
  v54._object = (void *)0xE600000000000000;
  v55.value._countAndFlagsBits = 0;
  v55.value._object = 0;
  v7.super.Class isa = v6;
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  uint64_t v8 = sub_100047498(v54, v55, v7, v56, v35);
  uint64_t v10 = v9;

  *(void *)&v39[0] = v8;
  *((void *)&v39[0] + 1) = v10;
  sub_1000036BC();
  uint64_t v11 = sub_100047BA8();
  uint64_t v13 = v12;
  uint64_t v38 = v14;
  char v16 = v15 & 1;
  int v37 = sub_100047AC8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  sub_100047618();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100047808();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_100047AD8();
  uint64_t v25 = sub_100047AF8();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = sub_100047C58();
  uint64_t v41 = v11;
  uint64_t v42 = v13;
  char v43 = v16;
  uint64_t v44 = v38;
  char v45 = v37;
  uint64_t v46 = v18;
  uint64_t v47 = v20;
  uint64_t v48 = v22;
  uint64_t v49 = v24;
  char v50 = 0;
  uint64_t v51 = KeyPath;
  uint64_t v52 = v25;
  uint64_t v53 = v27;
  sub_100047D08();
  sub_100004538(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v39, 0.0, 1, 0.0, 1);
  sub_100003710(v11, v13, v16);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v28 = v39[11];
  *(_OWORD *)(a1 + 160) = v39[10];
  *(_OWORD *)(a1 + 176) = v28;
  *(_OWORD *)(a1 + 192) = v39[12];
  *(void *)(a1 + 208) = v40;
  long long v29 = v39[7];
  *(_OWORD *)(a1 + 96) = v39[6];
  *(_OWORD *)(a1 + 112) = v29;
  long long v30 = v39[9];
  *(_OWORD *)(a1 + 128) = v39[8];
  *(_OWORD *)(a1 + 144) = v30;
  long long v31 = v39[3];
  *(_OWORD *)(a1 + 32) = v39[2];
  *(_OWORD *)(a1 + 48) = v31;
  long long v32 = v39[5];
  *(_OWORD *)(a1 + 64) = v39[4];
  *(_OWORD *)(a1 + 80) = v32;
  double result = *(double *)v39;
  long long v34 = v39[1];
  *(_OWORD *)a1 = v39[0];
  *(_OWORD *)(a1 + 16) = v34;
  return result;
}

unint64_t sub_10002C210()
{
  unint64_t result = qword_100061B48;
  if (!qword_100061B48)
  {
    sub_100003798(&qword_100061B40);
    sub_10002C28C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B48);
  }
  return result;
}

unint64_t sub_10002C28C()
{
  unint64_t result = qword_100061B50;
  if (!qword_100061B50)
  {
    sub_100003798(&qword_100061B58);
    sub_10002C32C();
    sub_100004DB0(&qword_100061B70, &qword_100061B78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B50);
  }
  return result;
}

unint64_t sub_10002C32C()
{
  unint64_t result = qword_100061B60;
  if (!qword_100061B60)
  {
    sub_100003798(&qword_100061B68);
    sub_100004D3C();
    sub_100004DB0(&qword_100061630, &qword_100061638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B60);
  }
  return result;
}

uint64_t sub_10002C3CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100047928();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10002C3FC()
{
  return sub_100047938();
}

uint64_t sub_10002C424()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10002C434(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_10002C44C()
{
  unint64_t result = qword_100061B88;
  if (!qword_100061B88)
  {
    sub_100003798(&qword_100061B38);
    sub_10002C4EC();
    sub_100004DB0(&qword_100061BB0, &qword_100061B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B88);
  }
  return result;
}

unint64_t sub_10002C4EC()
{
  unint64_t result = qword_100061B90;
  if (!qword_100061B90)
  {
    sub_100003798(&qword_100061B30);
    sub_100004DB0(&qword_100061B98, &qword_100061B28);
    sub_100004DB0(&qword_100061BA0, &qword_100061BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061B90);
  }
  return result;
}

uint64_t sub_10002C5B8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10002C5CC()
{
  unint64_t result = qword_100061BB8;
  if (!qword_100061BB8)
  {
    sub_100003798(&qword_100061BC0);
    sub_100004DB0(&qword_100061AF8, &qword_100061AE8);
    sub_100004DB0(&qword_100061B00, &qword_100061AD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061BB8);
  }
  return result;
}

uint64_t sub_10002C694(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100047D48();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = sub_100047D68();
  uint64_t v9 = *(void *)(v18[0] - 8);
  __chkstk_darwin(v18[0]);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue];
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_10002D8D0;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B030;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v12;
  char v16 = v2;
  swift_retain();
  sub_100047D58();
  v18[1] = &_swiftEmptyArrayStorage;
  sub_10002D8F4((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_10002D93C((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v18[0]);
  return swift_release();
}

void sub_10002C95C()
{
  sub_1000481E8(62);
  swift_getObjectType();
  sub_100004714(&qword_100061C10);
  v0._countAndFlagsBits = sub_100047E88();
  sub_100047EB8(v0);
  swift_bridgeObjectRelease();
  v1._object = (void *)0x800000010004AFD0;
  v1._countAndFlagsBits = 0xD00000000000003CLL;
  sub_100047EB8(v1);
  sub_100048298();
  __break(1u);
}

void sub_10002CA20(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] - 1 >= 2)
  {
    a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] = 1;
    uint64_t v10 = *(void **)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup];
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = a1;
    v11[3] = a2;
    v11[4] = a3;
    uint64_t v17 = sub_10002D9F4;
    uint64_t v18 = v11;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 1107296256;
    id v15 = sub_100019674;
    char v16 = &unk_10005B0D0;
    uint64_t v8 = _Block_copy(&v13);
    id v9 = v10;
    uint64_t v12 = a1;
    swift_retain();
    swift_release();
    [v9 perform:v8];
  }
  else
  {
    uint64_t v6 = *(void **)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup];
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    *(void *)(v7 + 24) = a3;
    uint64_t v17 = sub_10002D9C4;
    uint64_t v18 = (void *)v7;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 1107296256;
    id v15 = sub_10001479C;
    char v16 = &unk_10005B080;
    uint64_t v8 = _Block_copy(&v13);
    swift_retain();
    id v9 = v6;
    swift_release();
    [v9 notifyOnMainQueueWithBlock:v8];
  }
  _Block_release(v8);
}

uint64_t sub_10002CBFC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a1;
  v10[6] = a2;
  uint64_t v11 = *(void (**)(uint64_t (*)(uint64_t), void *))((swift_isaMask & *a3) + 0xB8);
  uint64_t v12 = a3;
  swift_retain();
  swift_retain();
  v11(sub_10002DA48, v10);

  return swift_release();
}

uint64_t sub_10002CCE0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a5;
  uint64_t v11 = sub_100047D48();
  uint64_t v25 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100047D68();
  uint64_t v14 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  char v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void **)&a2[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue];
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = a2;
  v18[3] = a1;
  v18[4] = a3;
  v18[5] = a4;
  v18[6] = v23;
  v18[7] = a6;
  aBlock[4] = sub_10002DAA8;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B148;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v17;
  uint64_t v21 = a2;
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_100047D58();
  uint64_t v26 = &_swiftEmptyArrayStorage;
  sub_10002D8F4((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_10002D93C((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v24);
  return swift_release();
}

uint64_t sub_10002CFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v25 = a6;
  uint64_t v26 = a5;
  uint64_t v10 = sub_100047D48();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100047D68();
  uint64_t v14 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  char v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    char v17 = 3;
  }
  else {
    char v17 = 2;
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState) = v17;
  sub_10002D88C();
  uint64_t v18 = (void *)sub_100048098();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a2;
  aBlock[4] = sub_10002DAF8;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B198;
  id v20 = _Block_copy(aBlock);
  swift_retain();
  swift_errorRetain();
  swift_release();
  sub_100047D58();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10002D8F4((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_10002D93C((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v24);
  return v26(v21);
}

id sub_10002D2D4()
{
  uint64_t v1 = sub_100048088();
  uint64_t v16 = *(void *)(v1 - 8);
  uint64_t v17 = v1;
  __chkstk_darwin(v1);
  uint64_t v15 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100048058();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_100047D68();
  __chkstk_darwin(v4 - 8);
  v0[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] = 0;
  uint64_t v20 = 0x7565755164616F6CLL;
  unint64_t v21 = 0xEB000000003C2065;
  uint64_t v14 = sub_100004714(&qword_100061C18);
  uint64_t v19 = v14;
  uint64_t v5 = v0;
  sub_100004714(&qword_100061C20);
  v22._countAndFlagsBits = sub_100047E88();
  sub_100047EB8(v22);
  swift_bridgeObjectRelease();
  uint64_t v13 = OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue;
  v12[1] = sub_10002D88C();
  v23._countAndFlagsBits = 62;
  v23._object = (void *)0xE100000000000000;
  sub_100047EB8(v23);
  sub_100047D58();
  uint64_t v20 = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10002D8F4(&qword_100061C28, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004714(&qword_100061C30);
  sub_10002D93C(&qword_100061C38, &qword_100061C30);
  sub_1000481A8();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v15, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v17);
  *(void *)&v5[v13] = sub_1000480B8();
  uint64_t v20 = 0x756F724764616F6CLL;
  unint64_t v21 = 0xEB000000003C2070;
  uint64_t v19 = v14;
  v24._countAndFlagsBits = sub_100047E88();
  sub_100047EB8(v24);
  swift_bridgeObjectRelease();
  uint64_t v6 = OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup;
  v25._countAndFlagsBits = 62;
  v25._object = (void *)0xE100000000000000;
  sub_100047EB8(v25);
  id v7 = objc_allocWithZone((Class)GKDispatchGroup);
  NSString v8 = sub_100047E38();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithName:v8];

  *(void *)&v5[v6] = v9;
  uint64_t v10 = (objc_class *)type metadata accessor for LoadableModel();
  v18.receiver = v5;
  v18.super_class = v10;
  return [super init];
}

id sub_10002D68C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoadableModel();
  return [super dealloc];
}

uint64_t type metadata accessor for LoadableModel()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for LoadableModel.LoadingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10002D7FCLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadableModel.LoadingState()
{
  return &type metadata for LoadableModel.LoadingState;
}

unint64_t sub_10002D838()
{
  unint64_t result = qword_100061C08;
  if (!qword_100061C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061C08);
  }
  return result;
}

unint64_t sub_10002D88C()
{
  unint64_t result = qword_100060CC0;
  if (!qword_100060CC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100060CC0);
  }
  return result;
}

void sub_10002D8D0()
{
  sub_10002CA20(*(unsigned char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10002D8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002D8EC()
{
  return swift_release();
}

uint64_t sub_10002D8F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002D93C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002D98C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002D9C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_10002D9F4(uint64_t a1, uint64_t a2)
{
  return sub_10002CBFC(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10002DA00()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002DA48(uint64_t a1)
{
  return sub_10002CCE0(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_10002DA58()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002DAA8()
{
  return sub_10002CFD4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(uint64_t (**)(uint64_t))(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_10002DAB8()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002DAF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

id sub_10002DB48()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  uint64_t v5 = v0;
  unsigned int v6 = sub_100047758();
  os_log_type_t v7 = sub_100048008();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v15 = v1;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v2;
    id v9 = (uint8_t *)v8;
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138412290;
    uint64_t v16 = v5;
    uint64_t v11 = v5;
    sub_100048168();
    *uint64_t v10 = v5;

    uint64_t v1 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ user interface is ready for display", v9, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v14;
    swift_slowDealloc();
  }
  else
  {

    unsigned int v6 = v5;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return [v5 setReadyForDisplay];
}

uint64_t sub_10002DD54()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [v1 activeConversation];
  if (v6)
  {
    os_log_type_t v7 = v6;
    uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v8)
    {
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v1;
      *(void *)(v9 + 24) = v7;
      id v10 = v8;
      uint64_t v11 = v1;
      id v12 = v7;
      sub_10002C694((uint64_t)sub_100038B88, v9);

      return swift_release();
    }
  }
  sub_100047728();
  uint64_t v14 = v1;
  uint64_t v15 = sub_100047758();
  os_log_type_t v16 = sub_100048028();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v23 = v2;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v22 = v3;
    uint64_t v19 = (void *)v18;
    *(_DWORD *)uint64_t v17 = 138412290;
    Swift::String v24 = v14;
    uint64_t v20 = v14;
    sub_100048168();
    *uint64_t v19 = v14;

    uint64_t v2 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Expected a conversation and a playerModel", v17, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    uint64_t v3 = v22;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v15 = v14;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_10002E00C()
{
  id v1 = [self local];
  id v2 = [v1 internal];
  id v3 = [v2 playerID];

  uint64_t v4 = sub_100047E68();
  uint64_t v6 = v5;

  qword_100064230 = v4;
  qword_100064238 = v6;
  swift_bridgeObjectRelease();
  if (*(void *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel])
  {
    swift_beginAccess();
    uint64_t v7 = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v7 = 0;
  }
  qword_100064240 = v7;
  swift_bridgeObjectRelease();
  byte_100061C60 = 1;
  return [v0 requestPresentationStyle:3];
}

void sub_10002E19C()
{
  id v1 = (double *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  if (v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight + 8])
  {
    id v2 = [self local];
    id v3 = [v0 view];
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 frame];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      v14.origin.x = v6;
      v14.origin.y = v8;
      v14.size.width = v10;
      v14.size.height = v12;
      CGRectGetWidth(v14);
      double v13 = sub_100035574(v2, 0, 0);

      double *v1 = v13;
      *((unsigned char *)v1 + 8) = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10002E28C()
{
  qword_100061C40 = 0x4072C00000000000;
}

uint64_t sub_10002E2A0()
{
  uint64_t v0 = sub_100004714(&qword_100060CE0);
  sub_10003887C(v0, qword_100061C48);
  uint64_t v1 = sub_100038774(v0, (uint64_t)qword_100061C48);
  uint64_t v2 = sub_100047518();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

id sub_10002E338(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = 0;
  CGFloat v8 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  *(void *)CGFloat v8 = 0;
  v8[8] = 1;
  double v9 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  CGFloat v10 = self;
  double v11 = v4;
  *(void *)double v9 = [v10 local];
  *((void *)v9 + 1) = 0;
  v9[16] = 0;

  if (a2)
  {
    NSString v12 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v17.receiver = v11;
  v17.super_class = ObjectType;
  id v13 = [super initWithNibName:v12 bundle:a3];

  CGRect v14 = self;
  id v15 = v13;
  [v14 setForCurrentProcess];

  return v15;
}

id sub_10002E4E4(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  *(void *)uint64_t v4 = 0;
  v4[8] = 1;
  double v5 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  CGFloat v6 = self;
  double v7 = v1;
  *(void *)double v5 = [v6 local];
  *((void *)v5 + 1) = 0;
  v5[16] = 0;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  id v8 = [super initWithCoder:a1];
  if (v8)
  {
    double v9 = self;
    id v10 = v8;
    [v9 setForCurrentProcess];
  }
  return v8;
}

void sub_10002E61C(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)swift_getObjectType();
  [super willBecomeActiveWithConversation:a1];
  id v3 = [self defaultCenter];
  [v3 addObserver:v1 selector:"updateCard:" name:GKPlayerAuthenticationDidChangeNotificationName object:0];

  uint64_t v4 = self;
  NSString v5 = sub_100047E38();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v1;
  *(void *)(v6 + 24) = a1;
  v10[4] = sub_100038C20;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10001479C;
  v10[3] = &unk_10005B590;
  double v7 = _Block_copy(v10);
  id v8 = v1;
  id v9 = a1;
  swift_release();
  [v4 named:v5 execute:v7];
  _Block_release(v7);
}

uint64_t sub_10002E7A8(void *a1, void *a2)
{
  type metadata accessor for LocalPlayerAuthenticator();
  uint64_t inited = swift_initStaticObject();
  NSString v5 = (void *)swift_allocObject();
  v5[2] = a1;
  v5[3] = inited;
  v5[4] = a2;
  id v6 = a1;
  id v7 = a2;
  sub_100013CEC((void (*)(id, void))sub_100038C70);

  return swift_release();
}

void sub_10002E848(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, void *a5)
{
  uint64_t v9 = sub_100047768();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v38 - v14;
  if (!a2)
  {
    if (*(unsigned char *)(a4 + 16) == 2)
    {
      sub_100047738();
      long long v28 = a3;
      long long v29 = sub_100047758();
      os_log_type_t v30 = sub_100048008();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v41 = v9;
        long long v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        char v43 = a5;
        uint64_t v40 = v32;
        uint64_t v42 = a3;
        *(_DWORD *)long long v31 = 138412290;
        char v45 = v28;
        uint64_t v33 = v10;
        long long v34 = v28;
        uint64_t v9 = v41;
        a3 = v42;
        sub_100048168();
        *(void *)uint64_t v40 = v28;

        uint64_t v10 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ willBecomeActive - authentication succeed.", v31, 0xCu);
        sub_100004714((uint64_t *)&unk_100060CB0);
        swift_arrayDestroy();
        a5 = v43;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        long long v29 = v28;
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      int v37 = (objc_class *)sub_10001E520(a5);
      uint64_t v36 = *(Class *)((char *)&v28->isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
      *(Class *)((char *)&v28->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel) = v37;
    }
    else
    {
      if (byte_100060770 != 3) {
        goto LABEL_13;
      }
      id v35 = sub_10001E520(a5);
      uint64_t v36 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
      *(void *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = v35;
    }

    goto LABEL_13;
  }
  sub_100047728();
  os_log_type_t v16 = a3;
  swift_errorRetain();
  objc_super v17 = v16;
  swift_errorRetain();
  uint64_t v18 = sub_100047758();
  os_log_type_t v19 = sub_100048028();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    os_log_t v38 = v18;
    uint64_t v22 = (void *)v21;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v44 = (uint64_t)v17;
    char v45 = v39;
    *(_DWORD *)uint64_t v20 = 138412546;
    uint64_t v42 = a3;
    char v43 = a5;
    uint64_t v41 = v9;
    uint64_t v23 = v17;
    uint64_t v40 = v10;
    Swift::String v24 = v23;
    sub_100048168();
    *uint64_t v22 = v17;

    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v44 = a2;
    swift_errorRetain();
    sub_100004714((uint64_t *)&unk_1000611C0);
    uint64_t v25 = sub_100047E88();
    uint64_t v44 = sub_100046724(v25, v26, (uint64_t *)&v45);
    a3 = v42;
    sub_100048168();
    a5 = v43;
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    os_log_t v27 = v38;
    _os_log_impl((void *)&_mh_execute_header, v38, v19, "%@ willBecomeActive - authentication failed with error: %s", (uint8_t *)v20, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v41);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
LABEL_13:
  sub_10002ED2C(a5, (uint64_t)[a3 presentationStyle]);
}

void sub_10002ED2C(void *a1, uint64_t a2)
{
  id v3 = v2;
  long long v73 = a1;
  uint64_t v5 = sub_100047628();
  uint64_t v74 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100047768();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  uint64_t v76 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  id v15 = (char *)&v71 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v71 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v71 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v71 - v22;
  sub_100031754();
  if (v24) {
    sub_1000300DC();
  }
  id v77 = v2;
  if (byte_100060770 != 2)
  {
    sub_100047738();
    long long v31 = v2;
    uint64_t v32 = sub_100047758();
    os_log_type_t v33 = sub_100048008();
    if (os_log_type_enabled(v32, v33))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      *(_DWORD *)id v35 = 138412290;
      uint64_t v78 = v31;
      int v37 = v31;
      sub_100048168();
      *uint64_t v36 = v31;

      id v3 = v77;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ local player was not authenticated instantiating actions VC.", v35, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v32 = v31;
    }

    (*(void (**)(char *, uint64_t))(v76 + 8))(v23, v75);
    uint64_t v38 = sub_100036170();
LABEL_32:
    uint64_t v48 = (void *)v38;
    goto LABEL_33;
  }
  if (a2 == 3)
  {
    if (byte_100061C60 != 2)
    {
      if (byte_100061C60)
      {
        sub_100047738();
        Swift::String_optional v55 = v2;
        Swift::String v56 = sub_100047758();
        os_log_type_t v57 = sub_100048008();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v58 = 138412290;
          uint64_t v78 = v55;
          uint64_t v60 = v55;
          sub_100048168();
          void *v59 = v55;

          _os_log_impl((void *)&_mh_execute_header, v56, v57, "%@ FriendsList was tapped on, instantiating FriendsListViewController.", v58, 0xCu);
          sub_100004714((uint64_t *)&unk_100060CB0);
          swift_arrayDestroy();
          id v3 = v77;
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          Swift::String v56 = v55;
        }

        (*(void (**)(char *, uint64_t))(v76 + 8))(v15, v75);
        uint64_t v38 = sub_100036644(3);
      }
      else
      {
        sub_100047738();
        uint64_t v49 = v2;
        char v50 = sub_100047758();
        os_log_type_t v51 = sub_100048008();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          uint64_t v53 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v52 = 138412290;
          uint64_t v78 = v49;
          Swift::String v54 = v49;
          sub_100048168();
          *uint64_t v53 = v49;

          _os_log_impl((void *)&_mh_execute_header, v50, v51, "%@ Player profile was tapped on, instantiating PlayerProfileViewController.", v52, 0xCu);
          sub_100004714((uint64_t *)&unk_100060CB0);
          swift_arrayDestroy();
          id v3 = v77;
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          char v50 = v49;
        }

        (*(void (**)(char *, uint64_t))(v76 + 8))(v18, v75);
        uint64_t v38 = (uint64_t)sub_10003649C(3);
      }
      goto LABEL_32;
    }
  }
  else if (!a2)
  {
    sub_100047738();
    uint64_t v25 = v2;
    unint64_t v26 = sub_100047758();
    os_log_type_t v27 = sub_100048008();
    if (os_log_type_enabled(v26, v27))
    {
      long long v28 = (uint8_t *)swift_slowAlloc();
      long long v29 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v28 = 138412290;
      uint64_t v78 = v25;
      os_log_type_t v30 = v25;
      sub_100048168();
      *long long v29 = v25;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ local player was authenticated presentation style was compact so instantiating MessageActionsViewController.", v28, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      id v3 = v77;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v26 = v25;
    }

    (*(void (**)(char *, uint64_t))(v76 + 8))(v21, v75);
    uint64_t v38 = sub_1000362EC();
    goto LABEL_32;
  }
  sub_100047738();
  uint64_t v39 = v2;
  uint64_t v40 = sub_100047758();
  os_log_type_t v41 = sub_100048008();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = (void *)swift_slowAlloc();
    int v72 = v42;
    *(_DWORD *)uint64_t v42 = 138412290;
    uint64_t v78 = v39;
    char v43 = v39;
    sub_100048168();
    *uint64_t v71 = v39;

    _os_log_impl((void *)&_mh_execute_header, v40, v41, "%@ local player was authenticated instantiating FriendRequestCardViewController.", v72, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v40 = v39;
  }
  uint64_t v45 = v75;
  uint64_t v44 = v76;
  uint64_t v46 = v74;

  (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v45);
  (*(void (**)(char *, void, uint64_t))(v46 + 104))(v7, enum case for GKFeatureFlags.FriendInviteCardRewrite(_:), v5);
  LOBYTE(v44) = sub_100047618();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v5);
  if (v44) {
    uint64_t v47 = sub_100031898(v73);
  }
  else {
    uint64_t v47 = sub_10003693C();
  }
  uint64_t v48 = (void *)v47;
  id v3 = v77;
LABEL_33:
  [v3 addChildViewController:v48];
  id v61 = [v48 view];
  if (!v61)
  {
    __break(1u);
    goto LABEL_38;
  }
  Swift::String_optional v62 = v61;
  [v61 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v63 = [v3 view];
  if (!v63)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  char v64 = v63;
  id v65 = [v48 view];
  if (v65)
  {
    uint64_t v66 = v65;
    [v64 addSubview:v65];

    uint64_t v67 = self;
    id v68 = [v48 view];
    id v69 = v77;
    id v70 = [v77 view];
    [v67 _gkInstallEdgeConstraintsForView:v68 containedWithinParentView:v70];

    [v48 didMoveToParentViewController:v69];
    return;
  }
LABEL_39:
  __break(1u);
}

void sub_10002F780(void *a1, void *a2)
{
  uint64_t v4 = (CGContext *)[a1 CGContext];
  id v5 = [a1 format];
  CGContextSetAlpha(v4, 0.6);
  CGContextSetBlendMode(v4, kCGBlendModeNormal);
  if ([a2 presentationStyle] == (id)2)
  {
    id v6 = [a2 view];
    if (!v6)
    {
LABEL_9:
      __break(1u);
      return;
    }
    id v7 = v6;
    id v8 = [v6 layer];

    [v8 renderInContext:v4];
  }
  id v9 = [self currentTraitCollection];
  [v9 userInterfaceStyle];

  id v10 = [self _dimmingViewColor];
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v12 = v10;
  uint64_t v11 = (CGColor *)[v10 CGColor];
  CGContextSetFillColorWithColor(v4, v11);

  CGContextSetAlpha(v4, 1.0);
  [v5 bounds];
  [a1 fillRect:0];
}

void sub_10002F954(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_10002FA0C(void *a1)
{
  type metadata accessor for LocalPlayerAuthenticator();
  uint64_t inited = swift_initStaticObject();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = inited;
  id v4 = a1;
  sub_100013CEC((void (*)(id, void))sub_100038BD8);

  return swift_release();
}

void sub_10002FA9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = (uint8_t *)sub_100047768();
  uint64_t v8 = *((void *)v7 - 1);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = (SEL *)&unk_10005E000;
  if (a2)
  {
    sub_100047728();
    id v15 = a3;
    swift_errorRetain();
    id v16 = v15;
    swift_errorRetain();
    uint64_t v17 = sub_100047758();
    os_log_type_t v18 = sub_100048028();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      os_log_t v40 = v17;
      uint64_t v21 = (void *)v20;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v45 = (uint64_t)v16;
      uint64_t v46 = v41;
      *(_DWORD *)uint64_t v19 = 138412546;
      char v43 = a3;
      uint64_t v44 = v8;
      id v22 = v16;
      uint64_t v42 = v7;
      id v23 = v22;
      sub_100048168();
      *uint64_t v21 = v16;

      *(_WORD *)(v19 + 12) = 2080;
      uint64_t v45 = a2;
      swift_errorRetain();
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v24 = sub_100047E88();
      uint64_t v45 = sub_100046724(v24, v25, (uint64_t *)&v46);
      a3 = v43;
      sub_100048168();
      uint64_t v14 = (SEL *)&unk_10005E000;
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v26 = v40;
      _os_log_impl((void *)&_mh_execute_header, v40, v18, "%@ updating the card authentication failed with error: %s", (uint8_t *)v19, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint8_t *))(v44 + 8))(v13, v42);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint8_t *))(v8 + 8))(v13, v7);
    }
  }
  else if (*(unsigned char *)(a4 + 16) == 2)
  {
    uint64_t v44 = v8;
    sub_100047738();
    os_log_type_t v27 = a3;
    long long v28 = sub_100047758();
    os_log_type_t v29 = sub_100048008();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      char v43 = a3;
      uint64_t v32 = (void *)v31;
      uint64_t v42 = v30;
      *(_DWORD *)os_log_type_t v30 = 138412290;
      uint64_t v46 = v27;
      os_log_type_t v33 = v27;
      uint64_t v14 = (SEL *)&unk_10005E000;
      sub_100048168();
      *uint64_t v32 = v27;

      _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ updating the card authentication succeed.", v42, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      a3 = v43;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      long long v28 = v27;
    }

    (*(void (**)(char *, uint8_t *))(v44 + 8))(v11, v7);
    id v34 = [v27 v14[396]];
    if (!v34)
    {
      __break(1u);
      return;
    }
    id v35 = (objc_class *)sub_10001E520(v34);
    uint64_t v36 = *(Class *)((char *)&v27->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
    *(Class *)((char *)&v27->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel) = v35;
  }
  id v37 = [a3 v14[396]];
  if (v37)
  {
    uint64_t v38 = v37;
    sub_10002ED2C(v37, (uint64_t)[a3 presentationStyle]);
  }
}

id sub_1000300DC()
{
  id v1 = [v0 childViewControllers];
  sub_100010B0C(0, &qword_100061DA8);
  unint64_t v2 = sub_100047F58();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    return (id)swift_bridgeObjectRelease();
  }
LABEL_14:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1000482A8();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_100048208();
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4);
    }
    id v6 = v5;
    uint64_t v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_14;
    }
    [v5 willMoveToParentViewController:0];
    id result = [v6 view];
    if (!result) {
      break;
    }
    uint64_t v9 = result;
    [result removeFromSuperview];

    [v6 removeFromParentViewController];
    ++v4;
    if (v7 == v3) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

void sub_1000302BC(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_100047768();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20.receiver = v2;
  v20.super_class = ObjectType;
  [super didTransitionToPresentationStyle:a1];
  id v9 = [v2 activeConversation];
  if (v9)
  {
    uint64_t v10 = v9;
    sub_10002ED2C(v9, a1);
  }
  else
  {
    sub_100047728();
    uint64_t v11 = v2;
    uint64_t v12 = sub_100047758();
    os_log_type_t v13 = sub_100048028();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v18 = v6;
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      uint64_t v19 = v11;
      id v15 = v11;
      sub_100048168();
      *uint64_t v17 = v11;

      uint64_t v6 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ didTransition: Expected an active conversation", v14, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v12 = v11;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

double sub_1000306C4(double a1)
{
  uint64_t v21 = sub_100047768();
  uint64_t v3 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100060748 != -1) {
    swift_once();
  }
  if (*(double *)&qword_100061C40 < a1) {
    a1 = *(double *)&qword_100061C40;
  }
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState + 8];
  unsigned __int8 v8 = v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState + 16];
  sub_100035814(v6, v7, v8);
  double v9 = sub_100035574(v6, v7, v8);
  sub_100038920(v6, v7, v8);
  sub_100047738();
  uint64_t v10 = v1;
  uint64_t v11 = sub_100047758();
  os_log_type_t v12 = sub_100048008();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412546;
    double v22 = *(double *)&v10;
    id v15 = v10;
    objc_super v20 = v5;
    uint64_t v16 = v3;
    uint64_t v17 = v15;
    sub_100048168();
    *uint64_t v14 = v10;

    uint64_t v3 = v16;
    uint64_t v5 = v20;
    *(_WORD *)(v13 + 12) = 2048;
    double v22 = v9;
    sub_100048168();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Provide an inviteCardHeight size for our MSMessages Live Bubble View, %f", (uint8_t *)v13, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  return a1;
}

uint64_t sub_1000309C8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unsigned __int8 v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31 - v9;
  if (a1)
  {
    sub_100047728();
    id v11 = a2;
    swift_errorRetain();
    id v12 = v11;
    swift_errorRetain();
    uint64_t v13 = sub_100047758();
    os_log_type_t v14 = sub_100048028();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      os_log_t v31 = v13;
      uint64_t v17 = (void *)v16;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v35 = (uint64_t)v12;
      uint64_t v36 = v32;
      *(_DWORD *)uint64_t v15 = 138412546;
      uint64_t v34 = v4;
      id v18 = v12;
      uint64_t v33 = v5;
      id v19 = v18;
      sub_100048168();
      *uint64_t v17 = v12;

      *(_WORD *)(v15 + 12) = 2080;
      uint64_t v35 = a1;
      swift_errorRetain();
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v20 = sub_100047E88();
      uint64_t v35 = sub_100046724(v20, v21, (uint64_t *)&v36);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v22 = v31;
      _os_log_impl((void *)&_mh_execute_header, v31, v14, "%@ didCancelSending - cancelFriendRequest error: %s", (uint8_t *)v15, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v8, v34);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    id v24 = [objc_allocWithZone((Class)GKReporter) init];
    [v24 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestCancelled];

    sub_100047738();
    unint64_t v25 = a2;
    os_log_t v26 = sub_100047758();
    os_log_type_t v27 = sub_100048008();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v34 = v4;
      long long v28 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v29 = (void *)swift_slowAlloc();
      uint64_t v33 = v5;
      *(_DWORD *)long long v28 = 138412290;
      uint64_t v36 = v25;
      os_log_type_t v30 = v25;
      uint64_t v5 = v33;
      sub_100048168();
      *os_log_type_t v29 = v25;

      uint64_t v4 = v34;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ didCancelSending - cancelFriendRequest succeed", v28, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_t v26 = v25;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

uint64_t sub_100030EB8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_100047728();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    id v11 = sub_100047758();
    os_log_type_t v12 = sub_100048028();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v17 = a2;
      uint64_t v14 = v13;
      id v18 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v14 = 136315650;
      uint64_t v20 = sub_100046724(0xD000000000000020, 0x800000010004B270, &v21);
      sub_100048168();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_100046724(v17, a3, &v21);
      sub_100048168();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 22) = 2112;
      swift_errorRetain();
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v20 = v15;
      sub_100048168();
      *id v18 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s - Error adding %s to the deny list. Error: %@", (uint8_t *)v14, 0x20u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_1000313E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  sub_100047FB8();
  v5[7] = sub_100047FA8();
  uint64_t v7 = sub_100047F98();
  return _swift_task_switch(sub_100031480, v7, v6);
}

uint64_t sub_100031480()
{
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = *(const void **)(v0 + 40);
  swift_release();
  *(void *)(v0 + 64) = _Block_copy(v2);
  if (v1) {
    sub_100047E68();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 72) = v3;
  uint64_t v4 = *(void **)(v0 + 48);
  uint64_t v5 = *(void **)(v0 + 24);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100061DA0 + dword_100061DA0);
  id v6 = *(id *)(v0 + 16);
  id v7 = v5;
  id v8 = v4;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10003157C;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v10 = *(void *)(v0 + 24);
  return v13(v11, v10);
}

uint64_t sub_10003157C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  id v7 = *(void **)(*v3 + 48);
  id v8 = *(void **)(*v3 + 24);
  uint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  if (a3)
  {
    swift_bridgeObjectRetain();
    NSString v11 = sub_100047E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  os_log_type_t v12 = *(void (***)(void, void, void))(v6 + 64);
  ((void (**)(void, void, NSString))v12)[2](v12, a1 & 1, v11);

  _Block_release(v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(uint64_t (**)(void))(v10 + 8);
  return v13();
}

void sub_100031754()
{
  id v1 = [v0 childViewControllers];
  sub_100010B0C(0, &qword_100061DA8);
  unint64_t v2 = sub_100047F58();

  if (!(v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1000482A8();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v3 = (id)sub_100048208();
LABEL_6:
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    id v5 = [v4 presentedViewController];

    if (v5)
    {
      self;
      uint64_t v6 = (void *)swift_dynamicCastObjCClass();
      if (v6)
      {
LABEL_12:

        return;
      }
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v3 = *(id *)(v2 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_100031898(void *a1)
{
  uint64_t v3 = sub_100004714(&qword_100061DB8);
  __chkstk_darwin(v3 - 8);
  uint64_t v33 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004714(&qword_100061DC0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  uint64_t v35 = v6;
  __chkstk_darwin(v5);
  os_log_t v31 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004714(&qword_100061DC8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  uint64_t v37 = v9;
  __chkstk_darwin(v8);
  uint64_t v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v11 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100038994;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v1;
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  type metadata accessor for FriendInviteCardViewModel();
  swift_allocObject();
  id v18 = v11;
  id v19 = a1;
  uint64_t v20 = v1;
  uint64_t v21 = sub_100040690(v11, v19, (uint64_t)sub_1000389FC, v13, (uint64_t)sub_100038A24, v14, (uint64_t)sub_100038A48, v15, (uint64_t)sub_100038AA4, v16, (uint64_t)sub_100034D28, 0, sub_100038AAC, v17);
  swift_beginAccess();
  sub_100004714((uint64_t *)&unk_100061DD0);
  os_log_t v22 = v31;
  sub_100047798();
  swift_endAccess();
  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  id v38 = (id)sub_100048098();
  uint64_t v23 = sub_100048078();
  uint64_t v24 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v33, 1, 1, v23);
  sub_100004DB0(&qword_100061DE0, &qword_100061DC0);
  sub_100038AD0();
  unint64_t v25 = v32;
  uint64_t v26 = v34;
  sub_1000477E8();
  sub_100004868(v24, &qword_100061DB8);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v26);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100004DB0(&qword_100061DF0, &qword_100061DC8);
  uint64_t v27 = v36;
  uint64_t v28 = sub_1000477F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v25, v27);
  *(void *)&v20[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = v28;
  swift_release();
  id v38 = sub_100038B40;
  uint64_t v39 = v21;
  id v29 = objc_allocWithZone((Class)sub_100004714(&qword_100061DF8));
  return sub_100047A08();
}

void sub_100031DE4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    NSString v2 = sub_100047E38();
    NSString v3 = sub_100047E38();
    uint64_t v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v8._countAndFlagsBits = 0xE000000000000000;
    v14._countAndFlagsBits = 0x4F545455425F4B4FLL;
    v14._object = (void *)0xE90000000000004ELL;
    v15.value._countAndFlagsBits = 0;
    v15.value._object = 0;
    v5.super.Class isa = v4;
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_100047498(v14, v15, v5, v16, v8);

    NSString v6 = sub_100047E38();
    swift_bridgeObjectRelease();
    uint64_t v12 = nullsub_1;
    uint64_t v13 = 0;
    v8._object = _NSConcreteStackBlock;
    uint64_t v9 = 1107296256;
    uint64_t v10 = sub_10001479C;
    NSString v11 = &unk_10005B400;
    uint64_t v7 = _Block_copy(&v8._object);
    [v1 _presentAlertWithTitle:v2 message:v3 buttonTitle:v6 completion:v7];
    _Block_release(v7);
  }
}

void sub_100031F7C(uint64_t a1)
{
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSBundle v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  int v8 = *(unsigned __int8 *)(a1 + 16);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (void *)Strong;
    if (v8 != 9 || (v6 & 0xFFFFFFFFFFFFFFFELL | v7) != 0)
    {
      uint64_t v29 = v3;
      sub_100047738();
      uint64_t v12 = v10;
      uint64_t v13 = sub_100047758();
      os_log_type_t v14 = sub_100048008();
      int v15 = v14;
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v16 = swift_slowAlloc();
        int v26 = v15;
        uint64_t v17 = (uint8_t *)v16;
        id v18 = (void *)swift_slowAlloc();
        v24[2] = v18;
        uint64_t v27 = v2;
        uint64_t v28 = v10;
        unint64_t v25 = v17;
        *(_DWORD *)uint64_t v17 = 138412290;
        v24[1] = v17 + 4;
        os_log_type_t v30 = v12;
        id v19 = v12;
        uint64_t v2 = v27;
        uint64_t v10 = v28;
        sub_100048168();
        *id v18 = v10;

        _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v26, "%@ FriendInviteCardViewModel state updated, updating card height.", v25, 0xCu);
        sub_100004714((uint64_t *)&unk_100060CB0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v13 = v12;
      }

      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
      uint64_t v20 = (char *)v12 + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState;
      uint64_t v21 = *(Class *)((char *)&v12->isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState);
      os_log_t v22 = *(Class *)((char *)&v12[1].isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState);
      *(void *)uint64_t v20 = v6;
      *((void *)v20 + 1) = v7;
      unsigned __int8 v23 = v20[16];
      v20[16] = v8;
      sub_100035814((id)v6, (void *)v7, v8);
      sub_100035814((id)v6, (void *)v7, v8);
      sub_100038920(v21, v22, v23);
      [v12 requestResize];
      sub_100038920((void *)v6, (void *)v7, v8);
      [v12 requestResize];
    }
  }
}

uint64_t sub_100032254@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100004714(&qword_100061D20);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for FriendInviteCardView() + 20));
  type metadata accessor for FriendInviteCardViewModel();
  sub_100038C8C(&qword_100061D28, (void (*)(uint64_t))type metadata accessor for FriendInviteCardViewModel);
  swift_retain();
  uint64_t result = sub_100047868();
  uint64_t *v2 = result;
  v2[1] = v4;
  return result;
}

id sub_100032324()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v2 = [self defaultCenter];
  [v2 removeObserver:v0];

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return [super dealloc];
}

void sub_1000324A0()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  objc_super v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [v0 activeConversation];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = (void *)sub_1000327A0(0);
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v0;
      aBlock[4] = sub_10003593C;
      aBlock[5] = v10;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001728C;
      aBlock[3] = &unk_10005B1F8;
      NSString v11 = _Block_copy(aBlock);
      uint64_t v12 = v0;
      swift_release();
      [v6 insertMessage:v9 completionHandler:v11];
      _Block_release(v11);

      return;
    }
  }
  sub_100047728();
  uint64_t v13 = v0;
  os_log_type_t v14 = sub_100047758();
  os_log_type_t v15 = sub_100048028();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v21 = v1;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v20 = v2;
    id v18 = (void *)v17;
    *(_DWORD *)uint64_t v16 = 138412290;
    aBlock[0] = v13;
    id v19 = v13;
    sub_100048168();
    *id v18 = v13;

    uint64_t v1 = v21;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Expected a conversation and a playerModel", v16, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    uint64_t v2 = v20;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v14 = v13;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1000327A0(char a1)
{
  sub_100004714(&qword_100060CE0);
  __chkstk_darwin();
  objc_super v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100047768();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  uint64_t v9 = v1;
  uint64_t v10 = sub_100047758();
  os_log_type_t v11 = sub_100048008();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v30 = v4;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = v6;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    os_log_t v31 = v9;
    os_log_type_t v14 = v9;
    uint64_t v29 = v5;
    os_log_type_t v15 = v14;
    objc_super v4 = v30;
    sub_100048168();
    *uint64_t v27 = v9;

    uint64_t v5 = v29;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ creating a message for GC friend invite", v13, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v28;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v16 = [v9 activeConversation];
  if (!v16
    || (uint64_t v17 = v16,
        id v18 = [v16 selectedMessage],
        v17,
        !v18)
    || (id v19 = [v18 session], v18, !v19))
  {
    id v19 = [objc_allocWithZone((Class)MSSession) init];
  }
  uint64_t v20 = *(Class *)((char *)&v9->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
  if (v20)
  {
    id v21 = v20;
    sub_1000147E0(1, (uint64_t)v4);
  }
  else
  {
    uint64_t v22 = sub_100047518();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v4, 1, 1, v22);
  }
  sub_100010B0C(0, &qword_100061D50);
  if (a1) {
    uint64_t v23 = sub_100048118();
  }
  else {
    uint64_t v23 = sub_100048108();
  }
  uint64_t v24 = v23;

  sub_100004868((uint64_t)v4, &qword_100060CE0);
  return v24;
}

uint64_t sub_100032B38(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin();
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_100047728();
    swift_errorRetain();
    id v9 = a2;
    swift_errorRetain();
    id v10 = v9;
    os_log_type_t v11 = sub_100047758();
    os_log_type_t v12 = sub_100048028();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = v5;
      uint64_t v14 = v13;
      os_log_type_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412546;
      uint64_t v22 = v4;
      uint64_t v23 = (uint64_t)v10;
      id v16 = v10;
      os_log_t v20 = v11;
      id v17 = v16;
      sub_100048168();
      *os_log_type_t v15 = v10;

      *(_WORD *)(v14 + 12) = 2112;
      swift_errorRetain();
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v23 = v18;
      uint64_t v4 = v22;
      sub_100048168();
      v15[1] = v18;
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v19 = v20;
      _os_log_impl((void *)&_mh_execute_header, v20, v12, "%@ composeMessage - insert message error : %@", (uint8_t *)v14, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v5 = v21;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void sub_100032DC4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100047768();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  id v9 = a2;
  id v10 = sub_100047758();
  os_log_type_t v11 = sub_100048008();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v5;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v6;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    aBlock[0] = v9;
    uint64_t v14 = v9;
    uint64_t v5 = v20;
    sub_100048168();
    *uint64_t v18 = v9;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ acceptMessage", v13, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v19;
    swift_slowDealloc();
  }
  else
  {

    id v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  os_log_type_t v15 = (void *)sub_1000327A0(1);
  aBlock[4] = sub_100033060;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001728C;
  aBlock[3] = &unk_10005B450;
  id v16 = _Block_copy(aBlock);
  [a3 sendMessage:v15 completionHandler:v16];
  _Block_release(v16);
}

uint64_t sub_100033060(uint64_t a1)
{
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_100047728();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = sub_100047758();
    os_log_type_t v8 = sub_100048028();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      v13[0] = v2;
      id v10 = (uint8_t *)v9;
      os_log_type_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138412290;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      v13[1] = v12;
      sub_100048168();
      *os_log_type_t v11 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "acceptMessage - send message error : %@", v10, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v13[0];
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_10003328C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v53 = a3;
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  id v10 = v3;
  swift_bridgeObjectRetain_n();
  Swift::String v54 = (char *)v10;
  os_log_type_t v11 = sub_100047758();
  os_log_type_t v12 = sub_100048008();
  int v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    os_log_type_t v15 = (void *)swift_slowAlloc();
    v47[1] = v15;
    uint64_t v49 = swift_slowAlloc();
    v57[0] = v49;
    *(_DWORD *)uint64_t v14 = 138412546;
    int v48 = v13;
    uint64_t v51 = v7;
    uint64_t v52 = a2;
    id v16 = v54;
    *(void *)&long long v58 = v54;
    uint64_t v17 = v54;
    uint64_t v50 = v6;
    uint64_t v18 = v17;
    sub_100048168();
    *os_log_type_t v15 = v16;

    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_100047DC8();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    *(void *)&long long v58 = sub_100046724(v19, v21, v57);
    sub_100048168();
    swift_bridgeObjectRelease_n();
    a2 = v52;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v48, "%@ Received text input payload to send a friend request: %s", (uint8_t *)v14, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v51 + 8))(v9, v50);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    id v22 = v54;

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (a2 == 0xD00000000000002CLL && v53 == 0x800000010004B220
    || (v23 = sub_100048328(), uint64_t result = 0, (v23 & 1) != 0))
  {
    uint64_t v25 = OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel;
    uint64_t v26 = *(void **)&v54[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v26)
    {
      *(void *)&long long v58 = 0x6F43646E65697266;
      *((void *)&v58 + 1) = 0xEA00000000006564;
      uint64_t v27 = v26;
      sub_1000481D8();
      if (*(void *)(a1 + 16) && (unint64_t v28 = sub_100034764((uint64_t)v57), (v29 & 1) != 0))
      {
        sub_100014104(*(void *)(a1 + 56) + 32 * v28, (uint64_t)&v58);
      }
      else
      {
        long long v58 = 0u;
        long long v59 = 0u;
      }
      sub_1000358B0((uint64_t)v57);
      if (*((void *)&v59 + 1))
      {
        int v30 = swift_dynamicCast();
        uint64_t v31 = v55;
        uint64_t v32 = v56;
        if (!v30)
        {
          uint64_t v31 = 0;
          uint64_t v32 = 0;
        }
      }
      else
      {
        sub_100004868((uint64_t)&v58, (uint64_t *)&unk_100061D40);
        uint64_t v31 = 0;
        uint64_t v32 = 0;
      }
      uint64_t v33 = &v27[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      *(void *)uint64_t v33 = v31;
      *((void *)v33 + 1) = v32;

      swift_bridgeObjectRelease();
      uint64_t v34 = *(void **)&v54[v25];
      if (v34)
      {
        *(void *)&long long v58 = 0x7255646E65697266;
        *((void *)&v58 + 1) = 0xE90000000000006CLL;
        uint64_t v35 = v34;
        sub_1000481D8();
        if (*(void *)(a1 + 16) && (unint64_t v36 = sub_100034764((uint64_t)v57), (v37 & 1) != 0))
        {
          sub_100014104(*(void *)(a1 + 56) + 32 * v36, (uint64_t)&v58);
        }
        else
        {
          long long v58 = 0u;
          long long v59 = 0u;
        }
        sub_1000358B0((uint64_t)v57);
        if (*((void *)&v59 + 1))
        {
          int v38 = swift_dynamicCast();
          uint64_t v39 = v55;
          uint64_t v40 = v56;
          if (!v38)
          {
            uint64_t v39 = 0;
            uint64_t v40 = 0;
          }
        }
        else
        {
          sub_100004868((uint64_t)&v58, (uint64_t *)&unk_100061D40);
          uint64_t v39 = 0;
          uint64_t v40 = 0;
        }
        uint64_t v41 = &v35[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
        *(void *)uint64_t v41 = v39;
        *((void *)v41 + 1) = v40;

        swift_bridgeObjectRelease();
      }
    }
    *(void *)&long long v58 = 0xD00000000000001ALL;
    *((void *)&v58 + 1) = 0x800000010004B250;
    sub_1000481D8();
    if (*(void *)(a1 + 16) && (unint64_t v42 = sub_100034764((uint64_t)v57), (v43 & 1) != 0))
    {
      sub_100014104(*(void *)(a1 + 56) + 32 * v42, (uint64_t)&v58);
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
    }
    sub_1000358B0((uint64_t)v57);
    if (*((void *)&v59 + 1))
    {
      int v44 = swift_dynamicCast();
      uint64_t v45 = v55;
      uint64_t v46 = v56;
      if (!v44)
      {
        uint64_t v45 = 0;
        uint64_t v46 = 0;
      }
    }
    else
    {
      sub_100004868((uint64_t)&v58, (uint64_t *)&unk_100061D40);
      uint64_t v45 = 0;
      uint64_t v46 = 0;
    }
    qword_100061C68 = v45;
    qword_100061C70 = v46;
    swift_bridgeObjectRelease();
    sub_1000324A0();
    return 1;
  }
  return result;
}

uint64_t type metadata accessor for MessagesViewController()
{
  return self;
}

void sub_1000339C8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)&v30 - v9;
  if (a1)
  {
    sub_100047728();
    id v11 = a2;
    swift_errorRetain();
    id v12 = v11;
    swift_errorRetain();
    int v13 = sub_100047758();
    os_log_type_t v14 = sub_100048028();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      os_log_t v30 = v13;
      uint64_t v17 = (void *)v16;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v34 = (uint64_t)v12;
      uint64_t v35 = v31;
      *(_DWORD *)uint64_t v15 = 138412546;
      uint64_t v33 = v4;
      id v18 = v12;
      uint64_t v32 = v5;
      id v19 = v18;
      sub_100048168();
      *uint64_t v17 = v12;

      *(_WORD *)(v15 + 12) = 2080;
      uint64_t v34 = a1;
      swift_errorRetain();
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v20 = sub_100047E88();
      uint64_t v34 = sub_100046724(v20, v21, (uint64_t *)&v35);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v22 = v30;
      _os_log_impl((void *)&_mh_execute_header, v30, v14, "%@ messageActionsViewController - createFriendRequest error: %s", (uint8_t *)v15, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v33);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    id v23 = [objc_allocWithZone((Class)GKReporter) init];
    [v23 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestCreated];

    sub_100047738();
    uint64_t v24 = a2;
    uint64_t v25 = sub_100047758();
    os_log_type_t v26 = sub_100048008();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v33 = v4;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      unint64_t v28 = (void *)swift_slowAlloc();
      uint64_t v32 = v5;
      *(_DWORD *)uint64_t v27 = 138412290;
      uint64_t v35 = v24;
      char v29 = v24;
      uint64_t v5 = v32;
      sub_100048168();
      *unint64_t v28 = v24;

      uint64_t v4 = v33;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ messageActionsViewController - createFriendRequest succeed.", v27, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v25 = v24;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_1000324A0();
  }
}

void sub_100033E60(CFTimeInterval a1)
{
  CFOptionFlags v8 = 0;
  uint64_t v2 = (__CFString *)sub_100047E38();
  uint64_t v3 = (__CFString *)sub_100047E38();
  uint64_t v4 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  otherButtonTitle._countAndFlagsBits = 0xE000000000000000;
  v9._countAndFlagsBits = 0x4F545455425F4B4FLL;
  v9._object = (void *)0xE90000000000004ELL;
  v10.value._countAndFlagsBits = 0;
  v10.value._object = 0;
  v5.super.Class isa = v4;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_100047498(v9, v10, v5, v11, otherButtonTitle);

  uint64_t v6 = (__CFString *)sub_100047E38();
  swift_bridgeObjectRelease();
  CFUserNotificationDisplayAlert(a1, 0, 0, 0, 0, v2, v3, v6, 0, 0, &v8);
}

uint64_t sub_100033F9C(uint64_t a1)
{
  uint64_t v2 = sub_100047828();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000478B8();
}

uint64_t sub_100034064(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100038D88;
  return v6();
}

uint64_t sub_100034130(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  NSBundle v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *NSBundle v5 = v4;
  v5[1] = sub_100038D88;
  return v7();
}

uint64_t sub_1000341FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100047FD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100047FC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004868(a1, &qword_100061D58);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100047F98();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000343A8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100034484;
  return v6(a1);
}

uint64_t sub_100034484()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10003457C(uint64_t a1)
{
  sub_100047E68();
  sub_100048368();
  sub_100047EA8();
  Swift::Int v2 = sub_100048388();
  swift_bridgeObjectRelease();

  return sub_1000347A8(a1, v2);
}

unint64_t sub_100034610(uint64_t a1, uint64_t a2)
{
  sub_100048368();
  sub_100047EA8();
  Swift::Int v4 = sub_100048388();

  return sub_100034920(a1, a2, v4);
}

unint64_t sub_100034688(uint64_t a1)
{
  uint64_t v2 = sub_100048358();

  return sub_100034A04(a1, v2);
}

unint64_t sub_1000346CC(uint64_t a1)
{
  sub_100047608();
  sub_100038C8C((unint64_t *)&qword_100061928, (void (*)(uint64_t))&type metadata accessor for IndexPath);
  uint64_t v2 = sub_100047DD8();

  return sub_100034AA0(a1, v2);
}

unint64_t sub_100034764(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000481B8(*(void *)(v2 + 40));

  return sub_100034C60(a1, v4);
}

unint64_t sub_1000347A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100047E68();
    uint64_t v8 = v7;
    if (v6 == sub_100047E68() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100048328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100047E68();
          uint64_t v15 = v14;
          if (v13 == sub_100047E68() && v15 == v16) {
            break;
          }
          char v18 = sub_100048328();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100034920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    Swift::String_optional v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100048328() & 1) == 0)
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
      while (!v14 && (sub_100048328() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100034A04(uint64_t a1, uint64_t a2)
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

unint64_t sub_100034AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100047608();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100038C8C((unint64_t *)&unk_100061E30, (void (*)(uint64_t))&type metadata accessor for IndexPath);
      char v15 = sub_100047E28();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_100034C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10003595C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1000481C8();
      sub_1000358B0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100034D2C(uint64_t a1)
{
  uint64_t v2 = sub_100004714(&qword_100060CE0);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100060750 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100038774(v2, (uint64_t)qword_100061C48);
  uint64_t v6 = sub_100047518();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v4, a1, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  swift_beginAccess();
  sub_100038814((uint64_t)v4, v5);
  return swift_endAccess();
}

uint64_t sub_100034E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a3;
  uint64_t v7 = sub_100047D48();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100047D68();
  uint64_t v11 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  uint64_t v14 = (void *)sub_100048098();
  char v15 = (void *)swift_allocObject();
  v15[2] = 0x403E000000000000;
  v15[3] = a1;
  uint64_t v16 = v19;
  v15[4] = a2;
  v15[5] = v16;
  v15[6] = a4;
  aBlock[4] = sub_100038D14;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B658;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_100047D58();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100038C8C((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_100004DB0((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v20);
}

void sub_1000351A0()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v31 = v5;
    id v7 = [v6 shared];
    if (v7)
    {
      uint64_t v8 = v7;
      unsigned __int8 v9 = [v7 isAddingFriendsRestricted];

      if (v9)
      {
        id v10 = [objc_allocWithZone((Class)GKReporter) init];
        [v10 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestRestrictedError];

        uint64_t v11 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v27._countAndFlagsBits = 0xE000000000000000;
        v34._countAndFlagsBits = 0x525F444E45495246;
        v34._object = (void *)0xEE00545345555145;
        v36.value._countAndFlagsBits = 0;
        v36.value._object = 0;
        v12.super.Class isa = v11;
        v38._countAndFlagsBits = 0;
        v38._object = (void *)0xE000000000000000;
        uint64_t v13 = sub_100047498(v34, v36, v12, v38, v27);
        uint64_t v15 = v14;

        uint64_t v16 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v28._countAndFlagsBits = 0xE000000000000000;
        v35._object = (void *)0x800000010004A360;
        v35._countAndFlagsBits = 0xD000000000000027;
        v37.value._countAndFlagsBits = 0;
        v37.value._object = 0;
        v17.super.Class isa = v16;
        v39._countAndFlagsBits = 0;
        v39._object = (void *)0xE000000000000000;
        uint64_t v18 = sub_100047498(v35, v37, v17, v39, v28);
        uint64_t v20 = v19;

        sub_100034E98(v13, v15, v18, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v21 = v31;
      }
      else
      {
        os_log_t v30 = v0;
        sub_10001ADD0(v31, v30);

        unint64_t v21 = (unsigned __int8 *)v30;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_100047728();
    os_log_t v22 = v0;
    id v23 = sub_100047758();
    os_log_type_t v24 = sub_100048028();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (unsigned __int8 *)swift_slowAlloc();
      os_log_t v30 = (char *)swift_slowAlloc();
      uint64_t v31 = v25;
      uint64_t v32 = v22;
      *(_DWORD *)uint64_t v25 = 138412290;
      os_log_type_t v26 = v22;
      sub_100048168();
      *(void *)os_log_t v30 = v22;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ messageActionsViewController - Expected a playerModel", v31, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v23 = v22;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

double sub_100035574(void *a1, void *a2, unsigned __int8 a3)
{
  uint64_t v6 = type metadata accessor for FriendInviteCardView();
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  unsigned __int8 v9 = (void *)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v10 = [objc_allocWithZone((Class)MSConversation) init];
  type metadata accessor for FriendInviteCardViewModel();
  swift_allocObject();
  *(unsigned char *)(sub_100040690(0, v10, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, nullsub_1, 0)+ OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent) = 1;
  swift_getKeyPath();
  swift_getKeyPath();
  v18[1] = a1;
  void v18[2] = a2;
  unsigned __int8 v19 = a3;
  sub_100035814(a1, a2, a3);
  swift_retain();
  sub_1000477B8();
  sub_100043F20();
  *unsigned __int8 v9 = swift_getKeyPath();
  sub_100004714(&qword_100061D20);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (uint64_t *)((char *)v9 + *(int *)(v7 + 28));
  sub_100038C8C(&qword_100061D28, (void (*)(uint64_t))type metadata accessor for FriendInviteCardViewModel);
  *uint64_t v11 = sub_100047868();
  v11[1] = v12;
  id v13 = objc_allocWithZone((Class)sub_100004714((uint64_t *)&unk_100061D30));
  uint64_t v14 = (void *)sub_100047A08();
  sub_1000479F8();
  double v16 = v15;

  return v16;
}

id sub_100035814(id result, void *a2, unsigned __int8 a3)
{
  if (a3 <= 8u)
  {
    if (((1 << a3) & 0x17D) != 0)
    {
      return result;
    }
    if (a3 == 1)
    {
      id v4 = result;
      unint64_t result = a2;
      return result;
    }
  }
  return result;
}

uint64_t sub_100035888()
{
  return sub_1000478A8();
}

uint64_t sub_1000358B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100035904()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003593C(uint64_t a1)
{
  return sub_100032B38(a1, *(void **)(v1 + 16));
}

uint64_t sub_100035944(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100035954()
{
  return swift_release();
}

uint64_t sub_10003595C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000359B8()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100035A10()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100035AD8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100061D60 + dword_100061D60);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_100035AD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100035BD0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100038D88;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100061D70 + dword_100061D70);
  return v6(v2, v3, v4);
}

uint64_t sub_100035C94()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100035CD4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100038D88;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100061D80 + dword_100061D80);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100035DA0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100035DD8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100035AD8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100061D90 + dword_100061D90);
  return v6(a1, v4);
}

uint64_t sub_100035E90()
{
  uint64_t v1 = sub_100047D48();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100047D68();
  uint64_t v5 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  uint64_t v8 = (void *)sub_100048098();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_100038C7C;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B608;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v0;
  swift_release();
  sub_100047D58();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100038C8C((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_100004DB0((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

uint64_t sub_100036170()
{
  type metadata accessor for ActionViewController();
  sub_100004714(&qword_100061E08);
  uint64_t v0 = sub_100047E88();
  uint64_t v2 = v1;
  NSString v3 = sub_100047E38();
  id v4 = [self storyboardWithName:v3 bundle:0];

  NSString v5 = sub_100047E38();
  id v6 = [v4 instantiateViewControllerWithIdentifier:v5];

  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {

    v10._countAndFlagsBits = v0;
    v10._object = v2;
    sub_100047EB8(v10);
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000362EC()
{
  type metadata accessor for MessageActionsViewController();
  sub_100004714(&qword_100061DB0);
  uint64_t v1 = sub_100047E88();
  NSString v3 = v2;
  NSString v4 = sub_100047E38();
  id v5 = [self storyboardWithName:v4 bundle:0];

  NSString v6 = sub_100047E38();
  id v7 = [v5 instantiateViewControllerWithIdentifier:v6];

  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = v8;
    swift_bridgeObjectRelease();
    Swift::String v10 = (void *)(v9 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *Swift::String v10 = v0;
    v10[1] = &off_10005B1C0;
    id v11 = v0;
    swift_unknownObjectRelease();
    return v9;
  }
  else
  {

    v13._countAndFlagsBits = v1;
    v13._object = v3;
    sub_100047EB8(v13);
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

id sub_10003649C(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100047698();
  swift_bridgeObjectRetain();
  NSString v4 = (void *)sub_100047688();
  id v5 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v4];
  id v6 = [v5 navigationBar];
  [v6 setBarStyle:0];

  id v7 = [v5 navigationBar];
  id v8 = [self systemBlueColor];
  [v7 setTintColor:v8];

  id v9 = [v4 navigationItem];
  id v10 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"didDismissFullScreen"];
  [v9 setRightBarButtonItem:v10];

  [v2 requestPresentationStyle:a1];
  return v5;
}

uint64_t sub_100036644(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_100064238) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v4)
  {
    id v5 = *(void **)(v4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
    if (v5)
    {
      id v6 = [v5 internal];
      id v7 = [v6 playerID];

      sub_100047E68();
LABEL_5:
      sub_100047678();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v8 = (void *)sub_100047668();
      id v9 = objc_allocWithZone((Class)UINavigationController);
      id v10 = v8;
      id v11 = [v9 initWithRootViewController:v10];
      id v12 = [v11 navigationBar];
      [v12 setBarStyle:0];

      id v13 = [v11 navigationBar];
      id v14 = [self systemBlueColor];
      [v13 setTintColor:v14];

      id v15 = [v10 navigationItem];
      id v16 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"didDismissFullScreen"];
      [v15 setRightBarButtonItem:v16];

      [v2 requestPresentationStyle:a1];
      return (uint64_t)v11;
    }
  }
  sub_1000481E8(50);
  id v18 = [v1 description];
  sub_100047E68();
  swift_bridgeObjectRelease();

  v19._object = (void *)0x800000010004B310;
  v19._countAndFlagsBits = 0xD000000000000030;
  sub_100047EB8(v19);
  uint64_t result = sub_100048298();
  __break(1u);
  return result;
}

uint64_t sub_10003693C()
{
  type metadata accessor for FriendRequestCardViewController();
  sub_100004714(&qword_100061E00);
  uint64_t v1 = sub_100047E88();
  NSString v3 = v2;
  NSString v4 = sub_100047E38();
  id v5 = [self storyboardWithName:v4 bundle:0];

  NSString v6 = sub_100047E38();
  id v7 = [v5 instantiateViewControllerWithIdentifier:v6];

  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = v8;
    swift_bridgeObjectRelease();
    id v10 = *(void **)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
    id v11 = *(void **)(v9 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    *(void *)(v9 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel) = v10;
    id v12 = v10;

    id v13 = (void *)(v9 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
    uint64_t v14 = *(void *)(v9 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
    *id v13 = sub_100034D28;
    v13[1] = 0;
    sub_100010AE4(v14);

    return v9;
  }
  else
  {

    v16._countAndFlagsBits = v1;
    v16._object = v3;
    sub_100047EB8(v16);
    uint64_t result = sub_100048298();
    __break(1u);
  }
  return result;
}

void sub_100036B34(void *a1, void (**a2)(void, void))
{
  id v4 = [a1 view];
  if (v4)
  {
    id v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;

    id v10 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:v7];
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a1;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_100038BE0;
    *(void *)(v12 + 24) = v11;
    v16[4] = sub_100038BF8;
    v16[5] = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_10002F954;
    v16[3] = &unk_10005B540;
    id v13 = _Block_copy(v16);
    id v14 = a1;
    swift_retain();
    swift_release();
    id v15 = [v10 imageWithActions:v13];
    _Block_release(v13);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v13 & 1) == 0)
    {
      ((void (**)(void, id))a2)[2](a2, v15);
      swift_release();

      return;
    }
    __break(1u);
  }
  _Block_release(a2);
  __break(1u);
}

void sub_100036D28()
{
  uint64_t v1 = sub_100047768();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004714(&qword_100060CE0);
  __chkstk_darwin(v5);
  double v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [objc_allocWithZone((Class)GKReporter) init];
  [v8 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestCancelSending];

  if (qword_100060750 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100038774(v5, (uint64_t)qword_100061C48);
  uint64_t v10 = sub_100047518();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  swift_beginAccess();
  sub_100038814((uint64_t)v7, v9);
  swift_endAccess();
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v11 && *((unsigned char *)v11 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) == 1)
  {
    uint64_t v12 = v0;
    id v13 = v11;
    sub_10001FC38(v13, v12);
  }
  else
  {
    sub_100047728();
    id v14 = v0;
    id v15 = sub_100047758();
    os_log_type_t v16 = sub_100048028();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v23 = v1;
      NSBundle v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v22 = v2;
      Swift::String v19 = (void *)v18;
      *(_DWORD *)NSBundle v17 = 138412290;
      os_log_type_t v24 = v14;
      uint64_t v20 = v14;
      sub_100048168();
      *Swift::String v19 = v14;

      uint64_t v1 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ didCancelSending - Expected a playerModel", v17, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      uint64_t v2 = v22;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v15 = v14;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_1000370B0(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)CNContactStore) init];
  if (qword_100060740 != -1) {
    swift_once();
  }
  sub_100004714(&qword_1000611F0);
  Class isa = sub_100047F48().super.isa;
  id v15 = 0;
  id v4 = [v2 unifiedContactsMatchingPredicate:a1 keysToFetch:isa error:&v15];

  id v5 = v15;
  if (!v4)
  {
    id v12 = v15;
    sub_1000474E8();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  sub_100010B0C(0, &qword_1000611F8);
  unint64_t v6 = sub_100047F58();
  id v7 = v5;

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000482A8();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_6;
    }
LABEL_12:

    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v8 = (id)sub_100048208();
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v8 = *(id *)(v6 + 32);
  }
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  id v10 = [v9 givenName];

  uint64_t v11 = sub_100047E68();
  return v11;
}

void sub_1000372EC(void *a1)
{
  uint64_t v3 = sub_100047768();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v74 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v76 = (char *)&v71 - v8;
  __chkstk_darwin(v7);
  id v10 = (char *)&v71 - v9;
  sub_100047738();
  id v11 = v1;
  id v12 = sub_100047758();
  os_log_type_t v13 = sub_100048008();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v75 = a1;
  uint64_t v77 = v4;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    int v72 = (void *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    aBlock[0] = v73;
    *(_DWORD *)uint64_t v15 = 138412546;
    uint64_t v79 = (uint64_t)v11;
    id v16 = v11;
    sub_100048168();
    *int v72 = v11;

    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v79 = sub_100046724(0xD000000000000020, 0x800000010004B270, aBlock);
    a1 = v75;
    sub_100048168();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ %s didStartSending the friend invite.", (uint8_t *)v15, 0x16u);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    NSBundle v17 = *(void (**)(char *, uint64_t))(v77 + 8);
  }
  else
  {

    NSBundle v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  }
  v17(v10, v3);
  id v18 = [objc_allocWithZone((Class)GKReporter) init];
  [v18 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestSent];

  unint64_t v19 = qword_100061C70;
  uint64_t v20 = (SEL *)&unk_10005E000;
  uint64_t v21 = v76;
  if (qword_100061C70)
  {
    uint64_t v22 = qword_100061C68;
    swift_bridgeObjectRetain();
    sub_100047738();
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_100047758();
    os_log_type_t v24 = sub_100048008();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v74 = (char *)v3;
      uint64_t v79 = sub_100046724(0xD000000000000020, 0x800000010004B270, aBlock);
      sub_100048168();
      *(_WORD *)(v25 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_100046724(v22, v19, aBlock);
      sub_100048168();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s - recipientContactIdentifier was provided. Adding %s to the deny list.", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v20 = (SEL *)&unk_10005E000;
      swift_slowDealloc();

      os_log_type_t v26 = v21;
      Swift::String v27 = v74;
      a1 = v75;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      os_log_type_t v26 = v21;
      Swift::String v27 = (char *)v3;
    }
    v17(v26, (uint64_t)v27);
    id v40 = [self v20[490]];
    id v41 = [v40 utilityServicePrivate];

    NSString v42 = sub_100047E38();
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v22;
    *(void *)(v43 + 24) = v19;
    aBlock[4] = (uint64_t)sub_100038918;
    aBlock[5] = v43;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10001728C;
    aBlock[3] = (uint64_t)&unk_10005B2E8;
    int v44 = _Block_copy(aBlock);
    swift_release();
    [v41 denyContact:v42 handler:v44];
    _Block_release(v44);
    swift_unknownObjectRelease();
  }
  else
  {
    id v28 = [a1 recipientAddresses];
    uint64_t v29 = sub_100047F58();

    uint64_t v30 = *(void *)(v29 + 16);
    swift_bridgeObjectRelease();
    if (v30 == 1)
    {
      id v31 = [a1 recipientAddresses];
      uint64_t v32 = (void *)sub_100047F58();

      if (v32[2])
      {
        uint64_t v34 = v32[4];
        uint64_t v33 = v32[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        Swift::String v35 = v74;
        sub_100047738();
        Swift::String_optional v36 = sub_100047758();
        os_log_type_t v37 = sub_100048008();
        if (os_log_type_enabled(v36, v37))
        {
          Swift::String v38 = (uint8_t *)swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)Swift::String v38 = 136315138;
          uint64_t v79 = sub_100046724(0xD000000000000020, 0x800000010004B270, aBlock);
          uint64_t v20 = (SEL *)&unk_10005E000;
          sub_100048168();
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s - The recipient was manually provided by the user. Looking up the contacts from its handle.", v38, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          Swift::String v39 = v74;
        }
        else
        {

          Swift::String v39 = v35;
        }
        v17(v39, v3);
        type metadata accessor for PlayerModel();
        sub_100016A48(v34, v33);
        swift_bridgeObjectRelease();
        a1 = v75;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  uint64_t v45 = qword_100061C70;
  if (!qword_100061C70) {
    goto LABEL_16;
  }
  uint64_t v46 = qword_100061C68;
  uint64_t v47 = self;
  sub_100004714(&qword_1000611B0);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10004BE20;
  *(void *)(v48 + 32) = v46;
  *(void *)(v48 + 40) = v45;
  swift_bridgeObjectRetain();
  Class isa = sub_100047F48().super.isa;
  swift_bridgeObjectRelease();
  id v50 = [v47 predicateForContactsWithIdentifiers:isa];

  sub_1000370B0((uint64_t)v50);
  uint64_t v52 = v51;

  if (v52)
  {
    uint64_t v53 = 0;
  }
  else
  {
LABEL_16:
    id v54 = [a1 recipientAddresses];
    uint64_t v55 = sub_100047F58();

    uint64_t v56 = *(void *)(v55 + 16);
    swift_bridgeObjectRelease();
    if (v56 != 1) {
      return;
    }
    id v57 = [a1 recipientAddresses];
    long long v58 = (void *)sub_100047F58();

    if (!v58[2])
    {
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v60 = v58[4];
    uint64_t v59 = v58[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v61 = self;
    sub_100004714(&qword_1000611B0);
    uint64_t v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_10004BE20;
    *(void *)(v62 + 32) = v60;
    *(void *)(v62 + 40) = v59;
    Class v63 = sub_100047F48().super.isa;
    swift_bridgeObjectRelease();
    id v64 = [v61 predicateForContactsMatchingHandleStrings:v63];

    sub_1000370B0((uint64_t)v64);
    if (v65)
    {

      uint64_t v53 = 0;
    }
    else
    {
      id v66 = [a1 recipientAddresses];
      uint64_t v67 = sub_100047F58();

      if (!*(void *)(v67 + 16))
      {
        swift_bridgeObjectRelease();

        return;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();

      uint64_t v53 = 1;
    }
  }
  id v68 = [self v20[490]];
  id v69 = [v68 friendServicePrivate];

  NSString v70 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v69 notifyMessageBasedFriendRequestSentTo:v70 nameKind:v53];
  swift_unknownObjectRelease();
}

uint64_t sub_100037DA0(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  uint64_t v4 = sub_100047518();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = sub_100004714(&qword_100060CE0);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  uint64_t v5 = sub_100047768();
  v3[24] = v5;
  v3[25] = *(void *)(v5 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  sub_100047FB8();
  v3[28] = sub_100047FA8();
  uint64_t v7 = sub_100047F98();
  return _swift_task_switch(sub_100037F88, v7, v6);
}

uint64_t sub_100037F88()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  sub_100047738();
  id v2 = v1;
  uint64_t v3 = sub_100047758();
  os_log_type_t v4 = sub_100048008();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 96);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v73 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v0 + 72) = v5;
    id v7 = v5;
    sub_100048168();
    *uint64_t v73 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Validating the message for sending GC invite.", v6, 0xCu);
    sub_100004714((uint64_t *)&unk_100060CB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v8 = *(void **)(v0 + 96);
  }
  uint64_t v9 = *(void **)(v0 + 80);
  id v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 200) + 8);
  v10(*(void *)(v0 + 216), *(void *)(v0 + 192));
  id v11 = [v9 URL];
  uint64_t v12 = *(void *)(v0 + 184);
  if (v11)
  {
    os_log_type_t v13 = v11;
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v15 = *(void *)(v0 + 104);
    id v16 = *(void **)(v0 + 112);
    sub_100047508();

    NSBundle v17 = (void (*)(uint64_t, uint64_t, uint64_t))v16[4];
    v17(v12, v14, v15);
    uint64_t v74 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16[7];
    v74(v12, 0, 1, v15);
    id v18 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v16[6];
    if (v18(v12, 1, v15) != 1)
    {
      uint64_t v71 = v17;
      sub_100004868(*(void *)(v0 + 184), &qword_100060CE0);
      unint64_t v19 = v74;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 112) + 56);
    v74(*(void *)(v0 + 184), 1, 1, *(void *)(v0 + 104));
  }
  sub_100004868(*(void *)(v0 + 184), &qword_100060CE0);
  if (qword_100060750 != -1) {
    swift_once();
  }
  uint64_t v20 = *(void *)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 104);
  uint64_t v22 = *(void *)(v0 + 112);
  uint64_t v23 = sub_100038774(*(void *)(v0 + 144), (uint64_t)qword_100061C48);
  swift_beginAccess();
  sub_1000387AC(v23, v20);
  id v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  if (v18(v20, 1, v21) == 1)
  {
    os_log_type_t v24 = *(void **)(v0 + 96);
    sub_100004868(*(void *)(v0 + 176), &qword_100060CE0);
    sub_100047738();
    id v25 = v24;
    os_log_type_t v26 = sub_100047758();
    os_log_type_t v27 = sub_100048008();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v29 = *(void **)(v0 + 96);
    if (v28)
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      id v69 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412290;
      *(void *)(v0 + 64) = v29;
      id v31 = v29;
      sub_100048168();
      *id v69 = v29;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ No message URL for sending GC invite", v30, 0xCu);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v26 = *(NSObject **)(v0 + 96);
    }
    uint64_t v56 = *(void *)(v0 + 208);
    uint64_t v57 = *(void *)(v0 + 192);

    v10(v56, v57);
    sub_100047708();
    uint64_t v58 = sub_1000476E8();
    uint64_t v72 = v59;
    uint64_t v75 = v58;
    unsigned int v70 = 0;
    goto LABEL_26;
  }
  uint64_t v32 = *(void *)(v0 + 168);
  uint64_t v33 = *(void *)(v0 + 128);
  uint64_t v34 = *(void *)(v0 + 104);
  uint64_t v35 = *(void *)(v0 + 112);
  Swift::String_optional v36 = *(void **)(v0 + 80);
  uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32);
  v71(v33, *(void *)(v0 + 176), v34);
  sub_1000474F8(v37);
  Swift::String v39 = v38;
  [v36 setURL:v38];

  unint64_t v19 = v74;
  v74(v32, 1, 1, v34);
  swift_beginAccess();
  sub_100038814(v32, v23);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
LABEL_14:
  id v40 = [*(id *)(v0 + 88) recipientIdentifiers];
  sub_1000475C8();
  uint64_t v41 = sub_100047F58();

  unint64_t v42 = *(void *)(v41 + 16);
  swift_bridgeObjectRelease();
  if (v42 >= 2)
  {
    id v43 = [*(id *)(v0 + 80) URL];
    uint64_t v44 = *(void *)(v0 + 160);
    if (v43)
    {
      uint64_t v45 = v43;
      uint64_t v46 = *(void *)(v0 + 136);
      uint64_t v47 = *(void *)(v0 + 104);
      sub_100047508();

      v71(v44, v46, v47);
      v19(v44, 0, 1, v47);
      if (v18(v44, 1, v47) != 1)
      {
        uint64_t v48 = *(void *)(v0 + 152);
        uint64_t v49 = *(void *)(v0 + 136);
        uint64_t v51 = *(void *)(v0 + 112);
        uint64_t v50 = *(void *)(v0 + 120);
        uint64_t v52 = *(void *)(v0 + 104);
        v71(v50, *(void *)(v0 + 160), v52);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v49, v50, v52);
        uint64_t v53 = (void *)sub_10001ED50(v49);
        sub_1000147E0(2, v48);
        if (v18(v48, 1, v52) == 1)
        {
          uint64_t v55 = 0;
        }
        else
        {
          uint64_t v60 = *(void *)(v0 + 152);
          uint64_t v61 = *(void *)(v0 + 104);
          uint64_t v62 = *(void *)(v0 + 112);
          sub_1000474F8(v54);
          uint64_t v55 = v63;
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
        }
        uint64_t v65 = *(void *)(v0 + 112);
        uint64_t v64 = *(void *)(v0 + 120);
        uint64_t v66 = *(void *)(v0 + 104);
        [*(id *)(v0 + 80) setURL:v55];

        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
        goto LABEL_25;
      }
    }
    else
    {
      v19(*(void *)(v0 + 160), 1, 1, *(void *)(v0 + 104));
    }
    sub_100004868(*(void *)(v0 + 160), &qword_100060CE0);
  }
LABEL_25:
  uint64_t v72 = 0;
  uint64_t v75 = 0;
  unsigned int v70 = 1;
LABEL_26:
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
  uint64_t v67 = *(uint64_t (**)(void, uint64_t, uint64_t))(v0 + 8);
  return v67(v70, v75, v72);
}

uint64_t sub_100038774(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000387AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_100060CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004714(&qword_100060CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10003887C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000388E0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100038918(uint64_t a1)
{
  return sub_100030EB8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_100038920(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 <= 8u)
  {
    if (((1 << a3) & 0x17D) != 0)
    {
LABEL_5:

      return;
    }
    if (a3 == 1)
    {

      a1 = a2;
      goto LABEL_5;
    }
  }
}

id sub_100038994(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + 16);
  qword_100064230 = a1;
  qword_100064238 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  byte_100061C60 = 0;

  return [v3 requestPresentationStyle:3];
}

uint64_t sub_1000389FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_100038A24()
{
  return sub_10002E00C();
}

uint64_t sub_100038A48()
{
  return sub_10002DD54();
}

uint64_t sub_100038A6C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100038AA4()
{
}

id sub_100038AAC()
{
  return sub_10002DB48();
}

unint64_t sub_100038AD0()
{
  unint64_t result = qword_100061DE8;
  if (!qword_100061DE8)
  {
    sub_100010B0C(255, (unint64_t *)&qword_100060CC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061DE8);
  }
  return result;
}

void sub_100038B38(uint64_t a1)
{
}

uint64_t sub_100038B40@<X0>(uint64_t *a1@<X8>)
{
  return sub_100032254(a1);
}

uint64_t sub_100038B48()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100038B88(uint64_t a1)
{
  sub_100032DC4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100038B90()
{
  return sub_10002FA0C(*(void **)(v0 + 16));
}

uint64_t sub_100038B98()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100038BD8(uint64_t a1, uint64_t a2)
{
  sub_10002FA9C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

void sub_100038BE0(void *a1)
{
  sub_10002F780(a1, *(void **)(v1 + 16));
}

uint64_t sub_100038BE8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100038BF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100038C20()
{
  return sub_10002E7A8(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100038C28()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100038C70(uint64_t a1, uint64_t a2)
{
  sub_10002E848(a1, a2, *(char **)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

id sub_100038C7C()
{
  return [*(id *)(v0 + 16) dismiss];
}

uint64_t sub_100038C8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100038CD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100038D14()
{
  sub_100033E60(*(CFTimeInterval *)(v0 + 16));
}

uint64_t *sub_100038D8C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100004714(&qword_100061D20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100047828();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (uint64_t *)((char *)a1 + v9);
    id v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *id v10 = *v11;
    v10[1] = v12;
  }
  swift_retain();
  return a1;
}

uint64_t sub_100038EB0(uint64_t a1)
{
  sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100047828();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_100038F54(void *a1, void *a2, uint64_t a3)
{
  sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100047828();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

void *sub_10003902C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_100061D20);
    sub_100004714(&qword_100061D20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100047828();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_100039130(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100047828();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_100039204(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100004868((uint64_t)a1, &qword_100061D20);
    uint64_t v6 = sub_100004714(&qword_100061D20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100047828();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_release();
  return a1;
}

uint64_t sub_100039300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100039314);
}

uint64_t sub_100039314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004714(&qword_100061E40);
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
    return (v10 + 1);
  }
}

uint64_t sub_1000393DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000393F0);
}

uint64_t sub_1000393F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004714(&qword_100061E40);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for FriendInviteCardView()
{
  uint64_t result = qword_100061EA0;
  if (!qword_100061EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100039500()
{
  sub_100039594();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100039594()
{
  if (!qword_100061EB0)
  {
    sub_100047828();
    unint64_t v0 = sub_100047838();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100061EB0);
    }
  }
}

uint64_t sub_1000395EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100039608@<X0>(uint64_t a1@<X8>)
{
  uint64_t v80 = a1;
  uint64_t v79 = sub_100004714(&qword_100061EE0);
  __chkstk_darwin(v79);
  uint64_t v83 = (char *)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100047828();
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v87 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  long long v85 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v84 = (uint64_t)&v76 - v6;
  uint64_t v7 = sub_100004714(&qword_100061EE8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004714(&qword_100061EF0);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  os_log_type_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004714(&qword_100061EF8);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  NSBundle v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004714(&qword_100061F00);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100004714(&qword_100061F08);
  __chkstk_darwin(v82);
  uint64_t v81 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100004714(&qword_100061F10);
  uint64_t v77 = *(void *)(v23 - 8);
  uint64_t v78 = v23;
  __chkstk_darwin(v23);
  uint64_t v76 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = v1;
  sub_10003C8F4((void (*)(void))sub_10003D360, (uint64_t)v88, (uint64_t)v9);
  char v25 = sub_100047AA8();
  sub_100047808();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_1000049DC((uint64_t)v9, (uint64_t)v13, &qword_100061EE8);
  uint64_t v34 = &v13[*(int *)(v11 + 44)];
  *uint64_t v34 = v25;
  *((void *)v34 + 1) = v27;
  *((void *)v34 + 2) = v29;
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = v33;
  v34[40] = 0;
  uint64_t v35 = (uint64_t)v9;
  uint64_t v36 = (uint64_t)v83;
  sub_100004868(v35, &qword_100061EE8);
  char v37 = sub_100047AB8();
  sub_100047808();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  sub_1000049DC((uint64_t)v13, (uint64_t)v17, &qword_100061EF0);
  uint64_t v46 = &v17[*(int *)(v15 + 44)];
  *uint64_t v46 = v37;
  *((void *)v46 + 1) = v39;
  *((void *)v46 + 2) = v41;
  *((void *)v46 + 3) = v43;
  *((void *)v46 + 4) = v45;
  v46[40] = 0;
  sub_100004868((uint64_t)v13, &qword_100061EF0);
  char v47 = sub_100047AC8();
  sub_100047808();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  sub_1000049DC((uint64_t)v17, (uint64_t)v21, &qword_100061EF8);
  uint64_t v56 = &v21[*(int *)(v19 + 44)];
  *uint64_t v56 = v47;
  *((void *)v56 + 1) = v49;
  *((void *)v56 + 2) = v51;
  *((void *)v56 + 3) = v53;
  *((void *)v56 + 4) = v55;
  v56[40] = 0;
  uint64_t v57 = (uint64_t)v17;
  uint64_t v58 = (uint64_t)v81;
  uint64_t v59 = v82;
  sub_100004868(v57, &qword_100061EF8);
  uint64_t v60 = v84;
  sub_10003D3A0(&qword_100061D20, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v84);
  uint64_t v61 = v85;
  uint64_t v62 = v86;
  uint64_t v63 = v87;
  (*(void (**)(char *, void, uint64_t))(v86 + 104))(v85, enum case for ColorScheme.dark(_:), v87);
  uint64_t v64 = v61;
  LOBYTE(v61) = sub_100047818();
  uint64_t v65 = *(void (**)(char *, uint64_t))(v62 + 8);
  v65(v64, v63);
  v65((char *)v60, v63);
  uint64_t v66 = self;
  uint64_t v67 = &selRef_tertiarySystemGroupedBackgroundColor;
  if ((v61 & 1) == 0) {
    uint64_t v67 = &selRef_systemGray6Color;
  }
  id v68 = [v66 *v67];
  uint64_t v69 = sub_100047C28();
  char v70 = sub_100047A98();
  sub_1000049DC((uint64_t)v21, v58, &qword_100061F00);
  uint64_t v71 = v58 + *(int *)(v59 + 36);
  *(void *)uint64_t v71 = v69;
  *(unsigned char *)(v71 + 8) = v70;
  sub_100004868((uint64_t)v21, &qword_100061F00);
  uint64_t v72 = enum case for DynamicTypeSize.accessibility2(_:);
  uint64_t v73 = sub_100047878();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 104))(v36, v72, v73);
  sub_10003D658();
  uint64_t result = sub_100047E28();
  if (result)
  {
    sub_10003D6B0();
    sub_100004DB0(&qword_100061F78, &qword_100061EE0);
    uint64_t v75 = v76;
    sub_100047C08();
    sub_100004868(v36, &qword_100061EE0);
    sub_100004868(v58, &qword_100061F08);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v77 + 32))(v80, v75, v78);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100039CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v276 = a2;
  uint64_t v245 = sub_100004714(&qword_100061F98);
  __chkstk_darwin(v245);
  v228 = (uint64_t *)((char *)&v225 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v237 = sub_100004714(&qword_100061FA0);
  __chkstk_darwin(v237);
  v241 = (uint64_t *)((char *)&v225 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v282 = sub_100004714(&qword_100061FA8);
  __chkstk_darwin(v282);
  v249 = (char *)&v225 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = sub_100004714(&qword_100061FB0);
  __chkstk_darwin(v243);
  uint64_t v246 = (uint64_t)&v225 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v265 = sub_100004714(&qword_100061FB8);
  __chkstk_darwin(v265);
  v250 = (char *)&v225 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v244 = sub_100004714(&qword_100061FC0);
  __chkstk_darwin(v244);
  v251 = (uint64_t *)((char *)&v225 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v262 = sub_100004714(&qword_100061FC8);
  __chkstk_darwin(v262);
  uint64_t v264 = (uint64_t)&v225 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v236 = sub_100004714(&qword_100061FD0);
  __chkstk_darwin(v236);
  uint64_t v242 = (uint64_t)&v225 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v263 = sub_100004714(&qword_100061FD8);
  __chkstk_darwin(v263);
  v248 = (char *)&v225 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v271 = sub_100004714(&qword_100061FE0);
  __chkstk_darwin(v271);
  v266 = (char *)&v225 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v238 = sub_100004714(&qword_100061FE8);
  __chkstk_darwin(v238);
  v227 = (uint64_t *)((char *)&v225 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v239 = sub_100004714(&qword_100061FF0);
  __chkstk_darwin(v239);
  v226 = (uint64_t *)((char *)&v225 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v233 = sub_100004714(&qword_100061FF8);
  __chkstk_darwin(v233);
  uint64_t v235 = (uint64_t)&v225 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v261 = sub_100004714(&qword_100062000);
  __chkstk_darwin(v261);
  v240 = (char *)&v225 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for FriendInviteCardView();
  uint64_t v18 = v17 - 8;
  uint64_t v253 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v252 = v19;
  uint64_t v254 = (uint64_t)&v225 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = sub_100004714(&qword_100062008);
  __chkstk_darwin(v234);
  v225 = (uint64_t *)((char *)&v225 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v256 = sub_100004714(&qword_100062010);
  __chkstk_darwin(v256);
  v247 = (uint64_t *)((char *)&v225 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v278 = sub_100004714(&qword_100062018);
  __chkstk_darwin(v278);
  uint64_t v280 = (uint64_t)&v225 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v268 = sub_100004714(&qword_100062020);
  __chkstk_darwin(v268);
  uint64_t v270 = (uint64_t)&v225 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v258 = sub_100004714(&qword_100062028);
  __chkstk_darwin(v258);
  uint64_t v259 = (uint64_t)&v225 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v229 = sub_100004714(&qword_100062030);
  __chkstk_darwin(v229);
  uint64_t v231 = (uint64_t)&v225 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v230 = sub_100004714(&qword_100062038);
  __chkstk_darwin(v230);
  uint64_t v27 = (char *)&v225 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v257 = sub_100004714(&qword_100062040);
  __chkstk_darwin(v257);
  v232 = (char *)&v225 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v269 = sub_100004714(&qword_100062048);
  __chkstk_darwin(v269);
  v260 = (char *)&v225 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v279 = sub_100004714(&qword_100062050);
  __chkstk_darwin(v279);
  v272 = (char *)&v225 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100004714(&qword_100062058);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v225 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  char v37 = (char *)&v225 - v36;
  uint64_t v38 = sub_100004714(&qword_100062060);
  uint64_t v39 = __chkstk_darwin(v38 - 8);
  uint64_t v274 = (uint64_t)&v225 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  v281 = (char *)&v225 - v41;
  uint64_t v275 = sub_1000479D8();
  sub_10003CC88((uint64_t)v298);
  *(_OWORD *)&v300[39] = v298[2];
  *(_OWORD *)&v300[23] = v298[1];
  *(_OWORD *)&v300[103] = v298[6];
  *(_OWORD *)&v300[87] = v298[5];
  *(_OWORD *)&v300[119] = v299[0];
  *(_OWORD *)&v300[129] = *(_OWORD *)((char *)v299 + 10);
  *(_OWORD *)&v300[55] = v298[3];
  char v301 = 1;
  *(_OWORD *)&v300[71] = v298[4];
  *(_OWORD *)&v300[7] = v298[0];
  int v273 = 1;
  long long v306 = *(_OWORD *)&v300[64];
  long long v307 = *(_OWORD *)&v300[80];
  long long v304 = *(_OWORD *)&v300[32];
  long long v305 = *(_OWORD *)&v300[48];
  char v311 = BYTE9(v299[1]);
  long long v309 = *(_OWORD *)&v300[112];
  long long v310 = *(_OWORD *)&v300[128];
  long long v308 = *(_OWORD *)&v300[96];
  long long v302 = *(_OWORD *)v300;
  long long v303 = *(_OWORD *)&v300[16];
  uint64_t v42 = *(int *)(v18 + 28);
  uint64_t v255 = a1;
  uint64_t v43 = a1 + v42;
  uint64_t v44 = *(void *)(v43 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000477A8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v45 = v285;
  v277 = v286;
  switch(v287)
  {
    case 1:
      swift_retain();
      v266 = (char *)sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v67 = v45;
      v267 = v67;
      sub_1000477A8();
      swift_release();
      swift_release();
      id v68 = v285;
      uint64_t v69 = v286;
      unsigned __int8 v70 = v287;
      uint64_t v265 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v72 = v71;
      sub_100038920(v68, v69, v70);
      uint64_t v73 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v74 = *(void *)(v44
                      + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                      + 8);
      uint64_t v75 = v254;
      sub_10003E01C(v255, v254);
      unint64_t v76 = (*(unsigned __int8 *)(v253 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
      uint64_t v77 = swift_allocObject();
      *(void *)(v77 + 16) = v277;
      sub_10003E1A4(v75, v77 + v76);
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v79 = (uint64_t)v225;
      uint64_t *v225 = KeyPath;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v80 = v234;
      uint64_t v81 = v79 + *(int *)(v234 + 36);
      *(void *)uint64_t v81 = v67;
      *(_WORD *)(v81 + 8) = 0;
      *(void *)(v81 + 16) = v265;
      *(void *)(v81 + 24) = v72;
      *(void *)(v81 + 32) = v266;
      *(void *)(v81 + 40) = v73;
      *(void *)(v81 + 48) = v74;
      *(void *)(v81 + 56) = sub_10003D9D8;
      *(void *)(v81 + 64) = v44;
      *(void *)(v81 + 72) = sub_10003D9E0;
      *(void *)(v81 + 80) = v44;
      uint64_t v82 = (void *)(v79 + *(int *)(v80 + 40));
      void *v82 = sub_10003E55C;
      v82[1] = v77;
      sub_1000049DC(v79, v235, &qword_100062008);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620A8, &qword_100062008);
      sub_100004DB0(&qword_1000620B0, &qword_100061FF0);
      swift_retain();
      swift_retain();
      uint64_t v83 = v277;
      uint64_t v84 = (uint64_t)v240;
      sub_100047A18();
      sub_1000049DC(v84, v259, &qword_100062000);
      swift_storeEnumTagMultiPayload();
      sub_10003DB28();
      sub_10003DBEC();
      uint64_t v85 = (uint64_t)v260;
      sub_100047A18();
      sub_100004868(v84, &qword_100062000);
      sub_1000049DC(v85, v270, &qword_100062048);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v86 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v85, &qword_100062048);
      sub_1000049DC(v86, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();

      sub_100004868(v86, &qword_100062050);
      uint64_t v66 = v79;
      uint64_t v87 = &qword_100062008;
      goto LABEL_14;
    case 2:
      swift_retain();
      v266 = (char *)sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v88 = v45;
      v267 = v45;
      uint64_t v265 = (uint64_t)v88;
      sub_1000477A8();
      swift_release();
      swift_release();
      uint64_t v89 = v285;
      uint64_t v90 = v286;
      unsigned __int8 v91 = v287;
      uint64_t v92 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v94 = v93;
      sub_100038920(v89, v90, v91);
      uint64_t v96 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v95 = *(void *)(v44
                      + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                      + 8);
      uint64_t v97 = v254;
      sub_10003E01C(v255, v254);
      unint64_t v98 = (*(unsigned __int8 *)(v253 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
      uint64_t v99 = swift_allocObject();
      *(void *)(v99 + 16) = v277;
      sub_10003E1A4(v97, v99 + v98);
      uint64_t v100 = swift_getKeyPath();
      uint64_t v101 = (uint64_t)v226;
      uint64_t *v226 = v100;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v102 = v239;
      uint64_t v103 = v101 + *(int *)(v239 + 36);
      *(void *)uint64_t v103 = v265;
      *(_WORD *)(v103 + 8) = 0;
      *(void *)(v103 + 16) = v92;
      *(void *)(v103 + 24) = v94;
      *(void *)(v103 + 32) = v266;
      *(void *)(v103 + 40) = v96;
      *(void *)(v103 + 48) = v95;
      *(void *)(v103 + 56) = sub_10003D9D8;
      *(void *)(v103 + 64) = v44;
      *(void *)(v103 + 72) = sub_10003D9E0;
      *(void *)(v103 + 80) = v44;
      uint64_t v104 = (void *)(v101 + *(int *)(v102 + 40));
      *uint64_t v104 = sub_10003E39C;
      v104[1] = v99;
      unint64_t v105 = &qword_100061FF0;
      sub_1000049DC(v101, v235, &qword_100061FF0);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620A8, &qword_100062008);
      sub_100004DB0(&qword_1000620B0, &qword_100061FF0);
      swift_retain();
      swift_retain();
      uint64_t v106 = (uint64_t)v240;
      sub_100047A18();
      sub_1000049DC(v106, v259, &qword_100062000);
      swift_storeEnumTagMultiPayload();
      sub_10003DB28();
      sub_10003DBEC();
      uint64_t v107 = (uint64_t)v260;
      sub_100047A18();
      sub_100004868(v106, &qword_100062000);
      sub_1000049DC(v107, v270, &qword_100062048);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v108 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v107, &qword_100062048);
      sub_1000049DC(v108, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      uint64_t v109 = v267;
      uint64_t v110 = v277;
      unsigned __int8 v111 = 2;
      goto LABEL_6;
    case 3:
      swift_retain();
      uint64_t v261 = (uint64_t)sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v112 = v45;
      v267 = v45;
      v260 = v112;
      sub_1000477A8();
      swift_release();
      swift_release();
      long long v113 = v285;
      uint64_t v114 = v286;
      unsigned __int8 v115 = v287;
      uint64_t v116 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v118 = v117;
      sub_100038920(v113, v114, v115);
      uint64_t v120 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v119 = *(void *)(v44
                       + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                       + 8);
      uint64_t v121 = v254;
      sub_10003E01C(v255, v254);
      unint64_t v122 = (*(unsigned __int8 *)(v253 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
      uint64_t v123 = swift_allocObject();
      sub_10003E1A4(v121, v123 + v122);
      uint64_t v124 = swift_getKeyPath();
      uint64_t v101 = (uint64_t)v227;
      uint64_t *v227 = v124;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v125 = v238;
      uint64_t v126 = v101 + *(int *)(v238 + 36);
      *(void *)uint64_t v126 = v260;
      *(_WORD *)(v126 + 8) = 257;
      *(void *)(v126 + 16) = v116;
      *(void *)(v126 + 24) = v118;
      *(void *)(v126 + 32) = v261;
      *(void *)(v126 + 40) = v120;
      *(void *)(v126 + 48) = v119;
      *(void *)(v126 + 56) = sub_10003D9D8;
      *(void *)(v126 + 64) = v44;
      *(void *)(v126 + 72) = sub_10003D9E0;
      *(void *)(v126 + 80) = v44;
      unint64_t v127 = (int *(**)@<X0>(uint64_t *@<X8>))(v101 + *(int *)(v125 + 40));
      *unint64_t v127 = sub_10003E208;
      v127[1] = (int *(*)@<X0>(uint64_t *@<X8>))v123;
      unint64_t v105 = &qword_100061FE8;
      sub_1000049DC(v101, v242, &qword_100061FE8);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620C8, &qword_100061FE8);
      sub_100004DB0(&qword_100062098, &qword_100062010);
      swift_retain();
      swift_retain();
      uint64_t v128 = (uint64_t)v248;
      sub_100047A18();
      sub_1000049DC(v128, v264, &qword_100061FD8);
      swift_storeEnumTagMultiPayload();
      sub_10003DCE8();
      sub_10003DDA8();
      uint64_t v129 = (uint64_t)v266;
      sub_100047A18();
      sub_100004868(v128, &qword_100061FD8);
      sub_1000049DC(v129, v270, &qword_100061FE0);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v108 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v129, &qword_100061FE0);
      sub_1000049DC(v108, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      uint64_t v109 = v267;
      uint64_t v110 = v277;
      unsigned __int8 v111 = 3;
LABEL_6:
      sub_100038920(v109, v110, v111);
      sub_100004868(v108, &qword_100062050);
      uint64_t v66 = v101;
      uint64_t v87 = v105;
      goto LABEL_14;
    case 4:
      swift_retain();
      uint64_t v130 = sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v131 = v45;
      v267 = v45;
      id v132 = v131;
      sub_1000477A8();
      swift_release();
      swift_release();
      id v133 = v285;
      long long v134 = v286;
      unsigned __int8 v135 = v287;
      uint64_t v136 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v138 = v137;
      sub_100038920(v133, v134, v135);
      uint64_t v140 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v139 = *(void *)(v44
                       + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                       + 8);
      uint64_t v141 = swift_getKeyPath();
      uint64_t v142 = (uint64_t)v247;
      uint64_t *v247 = v141;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v143 = v256;
      uint64_t v144 = v142 + *(int *)(v256 + 36);
      *(void *)uint64_t v144 = v132;
      *(_WORD *)(v144 + 8) = 257;
      *(void *)(v144 + 16) = v136;
      *(void *)(v144 + 24) = v138;
      *(void *)(v144 + 32) = v130;
      *(void *)(v144 + 40) = v140;
      *(void *)(v144 + 48) = v139;
      *(void *)(v144 + 56) = sub_10003D9D8;
      *(void *)(v144 + 64) = v44;
      *(void *)(v144 + 72) = sub_10003D9E0;
      *(void *)(v144 + 80) = v44;
      unint64_t v145 = (void *)(v142 + *(int *)(v143 + 40));
      *unint64_t v145 = nullsub_1;
      v145[1] = 0;
      uint64_t v61 = &qword_100062010;
      sub_1000049DC(v142, v242, &qword_100062010);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620C8, &qword_100061FE8);
      sub_100004DB0(&qword_100062098, &qword_100062010);
      swift_retain();
      swift_retain();
      uint64_t v146 = (uint64_t)v248;
      sub_100047A18();
      sub_1000049DC(v146, v264, &qword_100061FD8);
      swift_storeEnumTagMultiPayload();
      sub_10003DCE8();
      sub_10003DDA8();
      uint64_t v147 = (uint64_t)v266;
      sub_100047A18();
      sub_100004868(v146, &qword_100061FD8);
      sub_1000049DC(v147, v270, &qword_100061FE0);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v148 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v147, &qword_100061FE0);
      id v149 = &qword_100062050;
      sub_1000049DC(v148, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      id v150 = v267;
      uint64_t v151 = v277;
      unsigned __int8 v152 = 4;
      goto LABEL_12;
    case 5:
      swift_retain();
      uint64_t v153 = sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v154 = v45;
      v267 = v45;
      id v155 = v154;
      sub_1000477A8();
      swift_release();
      swift_release();
      char v156 = v285;
      uint64_t v157 = v286;
      unsigned __int8 v158 = v287;
      uint64_t v159 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v161 = v160;
      sub_100038920(v156, v157, v158);
      uint64_t v163 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v162 = *(void *)(v44
                       + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                       + 8);
      uint64_t v164 = swift_getKeyPath();
      uint64_t v142 = (uint64_t)v251;
      uint64_t *v251 = v164;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v165 = v244;
      uint64_t v166 = v142 + *(int *)(v244 + 36);
      *(void *)uint64_t v166 = v155;
      *(_WORD *)(v166 + 8) = 257;
      *(void *)(v166 + 16) = v159;
      *(void *)(v166 + 24) = v161;
      *(void *)(v166 + 32) = v153;
      *(void *)(v166 + 40) = v163;
      *(void *)(v166 + 48) = v162;
      *(void *)(v166 + 56) = sub_10003D9D8;
      *(void *)(v166 + 64) = v44;
      *(void *)(v166 + 72) = sub_10003D9E0;
      *(void *)(v166 + 80) = v44;
      uint64_t v167 = (void *)(v142 + *(int *)(v165 + 40));
      *uint64_t v167 = sub_10003C8E0;
      v167[1] = 0;
      uint64_t v61 = &qword_100061FC0;
      sub_1000049DC(v142, v246, &qword_100061FC0);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620D8, &qword_100061FC0);
      swift_retain();
      swift_retain();
      uint64_t v168 = (uint64_t)v250;
      sub_100047A18();
      sub_1000049DC(v168, v264, &qword_100061FB8);
      swift_storeEnumTagMultiPayload();
      sub_10003DCE8();
      sub_10003DDA8();
      uint64_t v169 = (uint64_t)v266;
      sub_100047A18();
      sub_100004868(v168, &qword_100061FB8);
      sub_1000049DC(v169, v270, &qword_100061FE0);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v148 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v169, &qword_100061FE0);
      id v149 = &qword_100062050;
      sub_1000049DC(v148, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      id v150 = v267;
      uint64_t v151 = v277;
      unsigned __int8 v152 = 5;
      goto LABEL_12;
    case 6:
      swift_retain();
      uint64_t v170 = sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v171 = v45;
      v267 = v45;
      id v172 = v171;
      sub_1000477A8();
      swift_release();
      swift_release();
      uint64_t v173 = v285;
      v174 = v286;
      unsigned __int8 v175 = v287;
      uint64_t v176 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v178 = v177;
      sub_100038920(v173, v174, v175);
      uint64_t v180 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v179 = *(void *)(v44
                       + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                       + 8);
      uint64_t v181 = swift_getKeyPath();
      uint64_t v142 = (uint64_t)v251;
      uint64_t *v251 = v181;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v182 = v244;
      uint64_t v183 = v142 + *(int *)(v244 + 36);
      *(void *)uint64_t v183 = v172;
      *(_WORD *)(v183 + 8) = 257;
      *(void *)(v183 + 16) = v176;
      *(void *)(v183 + 24) = v178;
      *(void *)(v183 + 32) = v170;
      *(void *)(v183 + 40) = v180;
      *(void *)(v183 + 48) = v179;
      *(void *)(v183 + 56) = sub_10003D9D8;
      *(void *)(v183 + 64) = v44;
      *(void *)(v183 + 72) = sub_10003D9E0;
      *(void *)(v183 + 80) = v44;
      char v184 = (void *)(v142 + *(int *)(v182 + 40));
      *char v184 = sub_10003C8EC;
      v184[1] = 0;
      uint64_t v61 = &qword_100061FC0;
      sub_1000049DC(v142, v246, &qword_100061FC0);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_1000620D8, &qword_100061FC0);
      swift_retain();
      swift_retain();
      uint64_t v185 = (uint64_t)v250;
      sub_100047A18();
      sub_1000049DC(v185, v264, &qword_100061FB8);
      swift_storeEnumTagMultiPayload();
      sub_10003DCE8();
      sub_10003DDA8();
      uint64_t v186 = (uint64_t)v266;
      sub_100047A18();
      sub_100004868(v185, &qword_100061FB8);
      sub_1000049DC(v186, v270, &qword_100061FE0);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v148 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v186, &qword_100061FE0);
      id v149 = &qword_100062050;
      sub_1000049DC(v148, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      id v150 = v267;
      uint64_t v151 = v277;
      unsigned __int8 v152 = 6;
      goto LABEL_12;
    case 7:
      uint64_t v187 = sub_1000158C4((char)v285);
      uint64_t v188 = *(void *)(v43 + 8);
      v189 = v241;
      uint64_t *v241 = v187;
      v189[1] = v190;
      *((unsigned char *)v189 + 16) = v45 == 0;
      v189[3] = (uint64_t)sub_10003E018;
      v189[4] = v188;
      swift_storeEnumTagMultiPayload();
      sub_10003DA10();
      sub_100004DB0(&qword_100062070, &qword_100061F98);
      swift_retain_n();
      swift_bridgeObjectRetain();
      uint64_t v191 = (uint64_t)v249;
      sub_100047A18();
      sub_1000049DC(v191, v280, &qword_100061FA8);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      sub_100004868(v191, &qword_100061FA8);
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    case 8:
      swift_retain();
      v192 = sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      id v193 = v45;
      v267 = v45;
      id v194 = v193;
      sub_1000477A8();
      swift_release();
      swift_release();
      v195 = v285;
      v196 = v286;
      unsigned __int8 v197 = v287;
      uint64_t v198 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v200 = v199;
      sub_100038920(v195, v196, v197);
      uint64_t v202 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v201 = *(void *)(v44
                       + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                       + 8);
      uint64_t v203 = swift_getKeyPath();
      uint64_t v142 = (uint64_t)v228;
      uint64_t *v228 = v203;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v204 = v245;
      uint64_t v205 = v142 + *(int *)(v245 + 36);
      *(void *)uint64_t v205 = v194;
      *(_WORD *)(v205 + 8) = 1;
      *(void *)(v205 + 16) = v198;
      *(void *)(v205 + 24) = v200;
      *(void *)(v205 + 32) = v192;
      *(void *)(v205 + 40) = v202;
      *(void *)(v205 + 48) = v201;
      *(void *)(v205 + 56) = sub_10003D9D8;
      *(void *)(v205 + 64) = v44;
      *(void *)(v205 + 72) = sub_10003D9E0;
      *(void *)(v205 + 80) = v44;
      long long v206 = (void *)(v142 + *(int *)(v204 + 40));
      *long long v206 = nullsub_1;
      v206[1] = 0;
      uint64_t v61 = &qword_100061F98;
      sub_1000049DC(v142, (uint64_t)v241, &qword_100061F98);
      swift_storeEnumTagMultiPayload();
      sub_10003DA10();
      sub_100004DB0(&qword_100062070, &qword_100061F98);
      swift_retain();
      swift_retain();
      uint64_t v148 = (uint64_t)v249;
      sub_100047A18();
      id v149 = &qword_100061FA8;
      sub_1000049DC(v148, v280, &qword_100061FA8);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      id v150 = v267;
      uint64_t v151 = v277;
      unsigned __int8 v152 = 8;
LABEL_12:
      sub_100038920(v150, v151, v152);
      sub_100004868(v148, v149);
      uint64_t v66 = v142;
      goto LABEL_13;
    case 9:
      sub_100047848();
      v218 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
      v218(v35, v37, v31);
      *(void *)uint64_t v27 = 0;
      v27[8] = 1;
      uint64_t v219 = sub_100004714(&qword_1000620F0);
      v218(&v27[*(int *)(v219 + 48)], v35, v31);
      v220 = &v27[*(int *)(v219 + 64)];
      *(void *)v220 = 0;
      v220[8] = 1;
      v221 = *(void (**)(char *, uint64_t))(v32 + 8);
      v221(v35, v31);
      sub_1000049DC((uint64_t)v27, v231, &qword_100062038);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_100062090, &qword_100062038);
      sub_100004DB0(&qword_100062098, &qword_100062010);
      uint64_t v222 = (uint64_t)v232;
      sub_100047A18();
      sub_100004868((uint64_t)v27, &qword_100062038);
      sub_1000049DC(v222, v259, &qword_100062040);
      swift_storeEnumTagMultiPayload();
      sub_10003DB28();
      sub_10003DBEC();
      uint64_t v223 = (uint64_t)v260;
      sub_100047A18();
      sub_100004868(v222, &qword_100062040);
      sub_1000049DC(v223, v270, &qword_100062048);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v224 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v223, &qword_100062048);
      sub_1000049DC(v224, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      sub_100004868(v224, &qword_100062050);
      v221(v37, v31);
      goto LABEL_15;
    default:
      swift_retain();
      uint64_t v46 = sub_1000439C8(v45);
      swift_getKeyPath();
      swift_getKeyPath();
      v267 = v45;
      id v47 = v45;
      sub_1000477A8();
      swift_release();
      swift_release();
      uint64_t v48 = v285;
      uint64_t v49 = v286;
      unsigned __int8 v50 = v287;
      uint64_t v51 = sub_1000402E4((uint64_t)v285, (uint64_t)v286, v287);
      uint64_t v53 = v52;
      sub_100038920(v48, v49, v50);
      uint64_t v55 = *(void *)(v44 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
      uint64_t v54 = *(void *)(v44
                      + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                      + 8);
      uint64_t v56 = swift_getKeyPath();
      uint64_t v57 = (uint64_t)v247;
      uint64_t *v247 = v56;
      sub_100004714(&qword_1000614E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v58 = v256;
      uint64_t v59 = v57 + *(int *)(v256 + 36);
      *(void *)uint64_t v59 = v47;
      *(_WORD *)(v59 + 8) = 0;
      *(void *)(v59 + 16) = v51;
      *(void *)(v59 + 24) = v53;
      *(void *)(v59 + 32) = v46;
      *(void *)(v59 + 40) = v55;
      *(void *)(v59 + 48) = v54;
      *(void *)(v59 + 56) = sub_10003D9D8;
      *(void *)(v59 + 64) = v44;
      *(void *)(v59 + 72) = sub_10003D9E0;
      *(void *)(v59 + 80) = v44;
      uint64_t v60 = (void *)(v57 + *(int *)(v58 + 40));
      *uint64_t v60 = nullsub_1;
      v60[1] = 0;
      uint64_t v61 = &qword_100062010;
      sub_1000049DC(v57, v231, &qword_100062010);
      swift_storeEnumTagMultiPayload();
      sub_100004DB0(&qword_100062090, &qword_100062038);
      sub_100004DB0(&qword_100062098, &qword_100062010);
      swift_retain();
      swift_retain();
      uint64_t v62 = (uint64_t)v232;
      sub_100047A18();
      sub_1000049DC(v62, v259, &qword_100062040);
      swift_storeEnumTagMultiPayload();
      sub_10003DB28();
      sub_10003DBEC();
      uint64_t v63 = (uint64_t)v260;
      sub_100047A18();
      sub_100004868(v62, &qword_100062040);
      sub_1000049DC(v63, v270, &qword_100062048);
      swift_storeEnumTagMultiPayload();
      sub_10003DA64();
      sub_10003DCAC();
      uint64_t v64 = (uint64_t)v272;
      sub_100047A18();
      sub_100004868(v63, &qword_100062048);
      sub_1000049DC(v64, v280, &qword_100062050);
      swift_storeEnumTagMultiPayload();
      sub_10003DAA0(&qword_100062078, &qword_100062050, (void (*)(void))sub_10003DA64, (void (*)(void))sub_10003DCAC);
      sub_10003DE40();
      uint64_t v65 = (uint64_t)v281;
      sub_100047A18();
      sub_100038920(v267, v277, 0);
      sub_100004868(v64, &qword_100062050);
      uint64_t v66 = v57;
LABEL_13:
      uint64_t v87 = v61;
LABEL_14:
      sub_100004868(v66, v87);
LABEL_15:
      uint64_t v207 = v274;
      sub_1000049DC(v65, v274, &qword_100062060);
      uint64_t v208 = v275;
      long long v283 = (unint64_t)v275;
      char v209 = v273;
      v284[0] = v273;
      *(_OWORD *)&v284[113] = v309;
      *(_OWORD *)&v284[97] = v308;
      *(_OWORD *)&v284[129] = v310;
      v284[145] = v311;
      *(_OWORD *)&v284[33] = v304;
      *(_OWORD *)&v284[49] = v305;
      *(_OWORD *)&v284[65] = v306;
      *(_OWORD *)&v284[81] = v307;
      *(_OWORD *)&v284[1] = v302;
      *(_OWORD *)&v284[17] = v303;
      long long v210 = *(_OWORD *)&v284[128];
      uint64_t v211 = v276;
      *(_OWORD *)(v276 + 128) = *(_OWORD *)&v284[112];
      *(_OWORD *)(v211 + 144) = v210;
      *(_WORD *)(v211 + 160) = *(_WORD *)&v284[144];
      long long v212 = *(_OWORD *)&v284[64];
      *(_OWORD *)(v211 + 64) = *(_OWORD *)&v284[48];
      *(_OWORD *)(v211 + 80) = v212;
      long long v213 = *(_OWORD *)&v284[96];
      *(_OWORD *)(v211 + 96) = *(_OWORD *)&v284[80];
      *(_OWORD *)(v211 + 112) = v213;
      long long v214 = *(_OWORD *)v284;
      *(_OWORD *)uint64_t v211 = v283;
      *(_OWORD *)(v211 + 16) = v214;
      long long v215 = *(_OWORD *)&v284[32];
      *(_OWORD *)(v211 + 32) = *(_OWORD *)&v284[16];
      *(_OWORD *)(v211 + 48) = v215;
      uint64_t v216 = sub_100004714(&qword_1000620E8);
      sub_1000049DC(v207, v211 + *(int *)(v216 + 48), &qword_100062060);
      sub_10003DEE0(&v283);
      sub_100004868(v65, &qword_100062060);
      sub_100004868(v207, &qword_100062060);
      long long v294 = v308;
      long long v295 = v309;
      long long v296 = v310;
      long long v290 = v304;
      long long v291 = v305;
      long long v292 = v306;
      long long v293 = v307;
      long long v288 = v302;
      v285 = (void *)v208;
      v286 = 0;
      char v287 = v209;
      char v297 = v311;
      long long v289 = v303;
      return sub_10003DF7C(&v285);
  }
}

uint64_t sub_10003C758@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 + *(int *)(type metadata accessor for FriendInviteCardView() + 20) + 8);
  *a3 = a1;
  a3[1] = sub_10003E5D0;
  a3[2] = v5;
  id v6 = a1;

  return swift_retain();
}

int *sub_10003C7CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for FriendInviteCardView() + 20) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_1000477A8();
  swift_release();
  swift_release();
  swift_release();
  *a2 = swift_getKeyPath();
  sub_100004714(&qword_1000614E0);
  swift_storeEnumTagMultiPayload();
  uint64_t result = (int *)type metadata accessor for FriendInviteButtonStackView();
  uint64_t v5 = (uint64_t *)((char *)a2 + result[5]);
  *uint64_t v5 = sub_10003E5D8;
  v5[1] = v3;
  id v6 = (uint64_t *)((char *)a2 + result[6]);
  *id v6 = sub_10003E5DC;
  v6[1] = v3;
  *((unsigned char *)a2 + result[7]) = v7;
  return result;
}

void sub_10003C8E0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void sub_10003C8EC(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10003C8F4@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v21[1] = a2;
  uint64_t v22 = a1;
  uint64_t v23 = a3;
  uint64_t v3 = sub_100004714(&qword_100061F60);
  __chkstk_darwin(v3);
  uint64_t v5 = (void *)((char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100004714(&qword_100061F80);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004714(&qword_100061F50);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100047628();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v12);
  char v16 = sub_100047618();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    *(void *)uint64_t v11 = sub_1000479D8();
    *((void *)v11 + 1) = 0x4010000000000000;
    v11[16] = 0;
    sub_100004714(&qword_100061F90);
    v22();
    uint64_t v17 = &qword_100061F50;
    sub_1000049DC((uint64_t)v11, (uint64_t)v8, &qword_100061F50);
    swift_storeEnumTagMultiPayload();
    sub_100004DB0(&qword_100061F48, &qword_100061F50);
    sub_100004DB0(&qword_100061F58, &qword_100061F60);
    sub_100047A18();
    uint64_t v18 = (uint64_t)v11;
  }
  else
  {
    *uint64_t v5 = sub_100047D08();
    v5[1] = v19;
    sub_100004714(&qword_100061F88);
    v22();
    uint64_t v17 = &qword_100061F60;
    sub_1000049DC((uint64_t)v5, (uint64_t)v8, &qword_100061F60);
    swift_storeEnumTagMultiPayload();
    sub_100004DB0(&qword_100061F48, &qword_100061F50);
    sub_100004DB0(&qword_100061F58, &qword_100061F60);
    sub_100047A18();
    uint64_t v18 = (uint64_t)v5;
  }
  return sub_100004868(v18, v17);
}

void *sub_10003CC88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100047628();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100047978();
  sub_10003CF34((uint64_t)&v47);
  uint64_t v28 = v48;
  uint64_t v29 = v47;
  char v6 = v49;
  char v7 = v52;
  uint64_t v37 = v54;
  uint64_t v38 = v53;
  uint64_t v35 = v56;
  uint64_t v36 = v55;
  uint64_t v33 = v58;
  uint64_t v34 = v57;
  uint64_t v31 = v51;
  uint64_t v32 = v59;
  char v8 = v60;
  char v67 = 1;
  char v66 = v49;
  char v65 = v52;
  char v64 = v60;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  char v9 = sub_100047618();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_DWORD *)unsigned __int8 v50 = v70[0];
  *(_DWORD *)&v50[3] = *(_DWORD *)((char *)v70 + 3);
  *(_DWORD *)((char *)&v53 + 1) = *(_DWORD *)v69;
  HIDWORD(v53) = *(_DWORD *)&v69[3];
  *(_DWORD *)((char *)&v55 + 1) = *(_DWORD *)v68;
  HIDWORD(v55) = *(_DWORD *)&v68[3];
  uint64_t v10 = v30;
  uint64_t v11 = v31;
  v39[0] = v30;
  v39[1] = 0;
  LOBYTE(v40) = 1;
  *(_DWORD *)((char *)&v40 + 1) = v70[0];
  DWORD1(v40) = *(_DWORD *)((char *)v70 + 3);
  uint64_t v13 = v28;
  uint64_t v12 = v29;
  *((void *)&v40 + 1) = v29;
  *(void *)&long long v41 = v28;
  BYTE8(v41) = v6;
  *(_DWORD *)((char *)&v41 + 9) = *(_DWORD *)v69;
  HIDWORD(v41) = *(_DWORD *)&v69[3];
  *(void *)&long long v42 = v31;
  BYTE8(v42) = v7;
  *(_DWORD *)((char *)&v42 + 9) = *(_DWORD *)v68;
  HIDWORD(v42) = *(_DWORD *)&v68[3];
  uint64_t v15 = v37;
  uint64_t v14 = v38;
  *(void *)&long long v43 = v38;
  *((void *)&v43 + 1) = v37;
  uint64_t v17 = v35;
  uint64_t v16 = v36;
  *(void *)&long long v44 = v36;
  *((void *)&v44 + 1) = v35;
  uint64_t v19 = v33;
  uint64_t v18 = v34;
  *(void *)uint64_t v45 = v34;
  *(void *)&v45[8] = v33;
  uint64_t v20 = v32;
  *(void *)&v45[16] = v32;
  v45[24] = v8;
  long long v21 = (unint64_t)v30;
  long long v22 = v40;
  long long v23 = v42;
  *(_OWORD *)(a1 + 32) = v41;
  *(_OWORD *)(a1 + 48) = v23;
  *(_OWORD *)a1 = v21;
  *(_OWORD *)(a1 + 16) = v22;
  long long v24 = v43;
  long long v25 = v44;
  long long v26 = *(_OWORD *)v45;
  *(_OWORD *)(a1 + 105) = *(_OWORD *)&v45[9];
  *(_OWORD *)(a1 + 80) = v25;
  *(_OWORD *)(a1 + 96) = v26;
  *(_OWORD *)(a1 + 64) = v24;
  char v46 = v9 & 1;
  *(void *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 136) = (v9 & 1) == 0;
  *(unsigned char *)(a1 + 137) = v9 & 1;
  uint64_t v47 = v10;
  uint64_t v48 = 0;
  char v49 = 1;
  uint64_t v51 = v12;
  uint64_t v52 = v13;
  LOBYTE(v53) = v6;
  uint64_t v54 = v11;
  LOBYTE(v55) = v7;
  uint64_t v56 = v14;
  uint64_t v57 = v15;
  uint64_t v58 = v16;
  uint64_t v59 = v17;
  uint64_t v60 = v18;
  uint64_t v61 = v19;
  uint64_t v62 = v20;
  char v63 = v8;
  sub_10003E5E8(v39);
  return sub_10003E640(&v47);
}

void sub_10003CF34(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100047628();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100047C88();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [self sharedTheme];
  if (!v10)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v11 = v10;
  id v12 = [v10 eventIconImage];

  if (!v12)
  {
LABEL_8:
    __break(1u);
    return;
  }
  sub_100047C68();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v13 = sub_100047C98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100047D08();
  sub_100047858();
  uint64_t v14 = v51;
  int v45 = v52;
  uint64_t v15 = v53;
  int v48 = v54;
  uint64_t v46 = v56;
  uint64_t v47 = v55;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  char v16 = sub_100047618();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v16)
  {
    sub_100047708();
    uint64_t v49 = sub_1000476A8();
    uint64_t v50 = v17;
    sub_1000036BC();
    uint64_t v18 = sub_100047BA8();
    uint64_t v20 = v19;
    char v22 = v21 & 1;
    LODWORD(v49) = sub_100047A68();
    uint64_t v23 = sub_100047B78();
    uint64_t v43 = v15;
    uint64_t v44 = v14;
    v41[0] = v23;
    v41[1] = v24;
    uint64_t v42 = v25;
    char v27 = v26 & 1;
    sub_100003710(v18, v20, v22);
    swift_bridgeObjectRelease();
    sub_100047B48();
    sub_100047AF8();
    swift_release();
    uint64_t v28 = v42;
    char v29 = v27;
    uint64_t v30 = sub_100047B88();
    uint64_t v32 = v31;
    uint64_t v33 = v13;
    char v35 = v34;
    uint64_t v37 = v36;
    swift_release();
    uint64_t v38 = v35 & 1;
    uint64_t v13 = v33;
    uint64_t v39 = v28;
    uint64_t v15 = v43;
    uint64_t v14 = v44;
    sub_100003710(v41[0], v39, v29);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v32 = 0;
    uint64_t v38 = 0;
    uint64_t v37 = 0;
  }
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v45;
  *(void *)(a1 + 24) = v15;
  *(unsigned char *)(a1 + 32) = v48;
  uint64_t v40 = v46;
  *(void *)(a1 + 40) = v47;
  *(void *)(a1 + 48) = v40;
  *(void *)(a1 + 56) = v30;
  *(void *)(a1 + 64) = v32;
  *(void *)(a1 + 72) = v38;
  *(void *)(a1 + 80) = v37;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 1;
  swift_retain();
  sub_10003DF38(v30, v32, v38, v37);
  sub_10003DFD4(v30, v32, v38, v37);
  swift_release();
}

void *sub_10003D360@<X0>(uint64_t a1@<X8>)
{
  return sub_100039CB0(*(void *)(v1 + 16), a1);
}

uint64_t sub_10003D368@<X0>(uint64_t a1@<X8>)
{
  return sub_10003D3A0(&qword_1000614E0, (uint64_t (*)(void))&type metadata accessor for ContentSizeCategory, 0xD000000000000013, 0x800000010004B3B0, a1);
}

uint64_t sub_10003D3A0@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_100047958();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004714(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000049DC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_100048038();
    char v21 = sub_100047A78();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_100046724(v27, v25, &v29);
      sub_100048168();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100047948();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

unint64_t sub_10003D658()
{
  unint64_t result = qword_100061F18;
  if (!qword_100061F18)
  {
    sub_100047878();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061F18);
  }
  return result;
}

unint64_t sub_10003D6B0()
{
  unint64_t result = qword_100061F20;
  if (!qword_100061F20)
  {
    sub_100003798(&qword_100061F08);
    sub_10003D7C4(&qword_100061F28, &qword_100061F00, (void (*)(void))sub_10003D774);
    sub_100004DB0(&qword_100061F68, &qword_100061F70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061F20);
  }
  return result;
}

uint64_t sub_10003D774()
{
  return sub_10003D7C4(&qword_100061F30, &qword_100061EF8, (void (*)(void))sub_10003D79C);
}

uint64_t sub_10003D79C()
{
  return sub_10003D7C4(&qword_100061F38, &qword_100061EF0, (void (*)(void))sub_10003D844);
}

uint64_t sub_10003D7C4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003D844()
{
  unint64_t result = qword_100061F40;
  if (!qword_100061F40)
  {
    sub_100003798(&qword_100061EE8);
    sub_100004DB0(&qword_100061F48, &qword_100061F50);
    sub_100004DB0(&qword_100061F58, &qword_100061F60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100061F40);
  }
  return result;
}

uint64_t sub_10003D908(uint64_t a1)
{
  uint64_t v2 = sub_1000479C8();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000478D8();
}

uint64_t sub_10003D9D8(uint64_t a1, uint64_t a2)
{
  return sub_100043D18(a1, a2);
}

uint64_t sub_10003D9E0(uint64_t a1, uint64_t a2)
{
  return sub_100043D3C(a1, a2);
}

uint64_t sub_10003D9E8()
{
  return sub_1000478C8();
}

unint64_t sub_10003DA10()
{
  unint64_t result = qword_100062068;
  if (!qword_100062068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062068);
  }
  return result;
}

uint64_t sub_10003DA64()
{
  return sub_10003DAA0(&qword_100062080, &qword_100062048, (void (*)(void))sub_10003DB28, (void (*)(void))sub_10003DBEC);
}

uint64_t sub_10003DAA0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003798(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003DB28()
{
  unint64_t result = qword_100062088;
  if (!qword_100062088)
  {
    sub_100003798(&qword_100062040);
    sub_100004DB0(&qword_100062090, &qword_100062038);
    sub_100004DB0(&qword_100062098, &qword_100062010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062088);
  }
  return result;
}

unint64_t sub_10003DBEC()
{
  unint64_t result = qword_1000620A0;
  if (!qword_1000620A0)
  {
    sub_100003798(&qword_100062000);
    sub_100004DB0(&qword_1000620A8, &qword_100062008);
    sub_100004DB0(&qword_1000620B0, &qword_100061FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620A0);
  }
  return result;
}

uint64_t sub_10003DCAC()
{
  return sub_10003DAA0(&qword_1000620B8, &qword_100061FE0, (void (*)(void))sub_10003DCE8, (void (*)(void))sub_10003DDA8);
}

unint64_t sub_10003DCE8()
{
  unint64_t result = qword_1000620C0;
  if (!qword_1000620C0)
  {
    sub_100003798(&qword_100061FD8);
    sub_100004DB0(&qword_1000620C8, &qword_100061FE8);
    sub_100004DB0(&qword_100062098, &qword_100062010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620C0);
  }
  return result;
}

unint64_t sub_10003DDA8()
{
  unint64_t result = qword_1000620D0;
  if (!qword_1000620D0)
  {
    sub_100003798(&qword_100061FB8);
    sub_100004DB0(&qword_1000620D8, &qword_100061FC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620D0);
  }
  return result;
}

unint64_t sub_10003DE40()
{
  unint64_t result = qword_1000620E0;
  if (!qword_1000620E0)
  {
    sub_100003798(&qword_100061FA8);
    sub_10003DA10();
    sub_100004DB0(&qword_100062070, &qword_100061F98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620E0);
  }
  return result;
}

void *sub_10003DEE0(void *a1)
{
  uint64_t v2 = a1[13];
  uint64_t v3 = a1[14];
  uint64_t v4 = a1[15];
  uint64_t v5 = a1[16];
  swift_retain();
  sub_10003DF38(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_10003DF38(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000047BC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_10003DF7C(void *a1)
{
  uint64_t v2 = a1[13];
  uint64_t v3 = a1[14];
  uint64_t v4 = a1[15];
  uint64_t v5 = a1[16];
  swift_release();
  sub_10003DFD4(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_10003DFD4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100003710(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10003E01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FriendInviteCardView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003E080()
{
  uint64_t v1 = *(void *)(type metadata accessor for FriendInviteCardView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100047828();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003E1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FriendInviteCardView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

int *sub_10003E208@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for FriendInviteCardView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003C7CC(v4, a1);
}

uint64_t sub_10003E278()
{
  uint64_t v1 = *(void *)(type metadata accessor for FriendInviteCardView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100047828();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003E39C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for FriendInviteCardView();
  uint64_t v4 = *(void *)(v1
                 + *(int *)(v3 + 20)
                 + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80))
                 + 8);
  *a1 = *(void *)(v1 + 16);
  a1[1] = sub_10003E5D4;
  a1[2] = v4;

  return swift_retain();
}

uint64_t sub_10003E430()
{
  uint64_t v1 = *(void *)(type metadata accessor for FriendInviteCardView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  sub_100004714(&qword_100061D20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100047828();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003E55C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for FriendInviteCardView() - 8);
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003C758(v4, v5, a1);
}

void *sub_10003E5E8(void *a1)
{
  uint64_t v2 = a1[10];
  uint64_t v3 = a1[11];
  uint64_t v4 = a1[12];
  uint64_t v5 = a1[13];
  swift_retain();
  sub_10003DF38(v2, v3, v4, v5);
  return a1;
}

void *sub_10003E640(void *a1)
{
  uint64_t v2 = a1[10];
  uint64_t v3 = a1[11];
  uint64_t v4 = a1[12];
  uint64_t v5 = a1[13];
  swift_release();
  sub_10003DFD4(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_10003E698()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t Data.decompress(withAlgorithm:)()
{
  sub_100004714(&qword_100061228);
  sub_100047548();
  return v1;
}

uint64_t Data.deflate()()
{
  return sub_10003E7F0();
}

uint64_t Data.inflate()()
{
  return sub_10003E7F0();
}

uint64_t sub_10003E7F0()
{
  sub_100004714(&qword_100061228);
  sub_100047548();
  return v1;
}

uint64_t sub_10003E864@<X0>(const uint8_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  unsigned __int8 v5 = BYTE6(a4);
  compression_algorithm v7 = dword_10004D1A0[a2];
  unint64_t v8 = a4 >> 62;
  int64_t v9 = 0;
  switch(v8)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a3), a3))
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x10003E914);
      }
      int64_t v9 = HIDWORD(a3) - (int)a3;
LABEL_6:
      uint64_t result = sub_10003E924(COMPRESSION_STREAM_DECODE, v7, a1, v9, 0, 0xC000000000000000);
      *a5 = result;
      a5[1] = v13;
      return result;
    case 2uLL:
      uint64_t v11 = *(void *)(a3 + 16);
      uint64_t v10 = *(void *)(a3 + 24);
      int64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      int64_t v9 = v5;
      goto LABEL_6;
  }
}

uint64_t sub_10003E924(compression_stream_operation a1, compression_algorithm a2, const uint8_t *a3, int64_t a4, uint64_t a5, unint64_t a6)
{
  if (a1 == COMPRESSION_STREAM_ENCODE || a4 >= 1)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = *(const uint8_t **)(v13 + 16);
    *(_OWORD *)&stream.dst_ptr = *(_OWORD *)v13;
    stream.src_ptr = v14;
    *(_OWORD *)&stream.src_size = *(_OWORD *)(v13 + 24);
    if (compression_stream_init(&stream, a1, a2) == COMPRESSION_STATUS_ERROR)
    {
LABEL_25:
      uint64_t v12 = 0;
LABEL_26:
      swift_slowDealloc();
      return v12;
    }
    uint64_t v15 = 0x10000;
    if (a4 < 0x10000) {
      uint64_t v15 = a4;
    }
    if (v15 <= 64) {
      size_t v16 = 64;
    }
    else {
      size_t v16 = v15;
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    stream.dst_ptr = v17;
    stream.dst_size = v16;
    stream.src_ptr = a3;
    stream.src_size = a4;
    sub_10003EE94(a5, a6);
    compression_status v18 = compression_stream_process(&stream, 1);
    if (v18 == COMPRESSION_STATUS_OK)
    {
      if (stream.dst_size)
      {
LABEL_23:
        uint64_t v19 = a5;
        unint64_t v20 = a6;
LABEL_24:
        sub_10001FB90(v19, v20);
        swift_slowDealloc();
        compression_stream_destroy(&stream);
        goto LABEL_25;
      }
      while (1)
      {
        if (stream.dst_ptr != v17) {
          sub_100047538();
        }
        stream.dst_ptr = v17;
        stream.dst_size = v16;
        compression_status v18 = compression_stream_process(&stream, 1);
        if (v18) {
          break;
        }
        if (stream.dst_size) {
          goto LABEL_23;
        }
      }
    }
    if (v18 == COMPRESSION_STATUS_END)
    {
      if (stream.dst_ptr != v17) {
        sub_100047538();
      }
      uint64_t v12 = a5;
      swift_slowDealloc();
      compression_stream_destroy(&stream);
      goto LABEL_26;
    }
    uint64_t v19 = a5;
    unint64_t v20 = a6;
    goto LABEL_24;
  }
  return 0;
}

BOOL static Data.CompressionAlgorithm.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void Data.CompressionAlgorithm.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int Data.CompressionAlgorithm.hashValue.getter(unsigned __int8 a1)
{
  return sub_100048388();
}

uint64_t sub_10003EBA0@<X0>(const uint8_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int64_t v5 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x10003EC40);
      }
      int64_t v5 = HIDWORD(a2) - (int)a2;
LABEL_6:
      uint64_t result = sub_10003E924(COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB, a1, v5, 0, 0xC000000000000000);
      *a4 = result;
      a4[1] = v9;
      return result;
    case 2uLL:
      uint64_t v7 = *(void *)(a2 + 16);
      uint64_t v6 = *(void *)(a2 + 24);
      int64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      int64_t v5 = BYTE6(a3);
      goto LABEL_6;
  }
}

uint64_t sub_10003EC50@<X0>(const uint8_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003EBA0(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_10003EC6C@<X0>(const uint8_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int64_t v5 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x10003ED0CLL);
      }
      int64_t v5 = HIDWORD(a2) - (int)a2;
LABEL_6:
      uint64_t result = sub_10003E924(COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB, a1, v5, 0, 0xC000000000000000);
      *a4 = result;
      a4[1] = v9;
      return result;
    case 2uLL:
      uint64_t v7 = *(void *)(a2 + 16);
      uint64_t v6 = *(void *)(a2 + 24);
      int64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      int64_t v5 = BYTE6(a3);
      goto LABEL_6;
  }
}

uint64_t sub_10003ED1C@<X0>(const uint8_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003EC6C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_10003ED3C()
{
  unint64_t result = qword_1000620F8;
  if (!qword_1000620F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000620F8);
  }
  return result;
}

unsigned char *_s20CompressionAlgorithmOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10003EE5CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Data.CompressionAlgorithm()
{
  return &type metadata for Data.CompressionAlgorithm;
}

uint64_t sub_10003EE94(uint64_t a1, unint64_t a2)
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

uint64_t sub_10003EEEC()
{
  return swift_initClassMetadata2();
}

id sub_10003EF34()
{
  uint64_t v0 = (void *)sub_10003F83C();

  return v0;
}

void sub_10003EF68(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_10003EFC4((uint64_t)a3);
}

uint64_t sub_10003EFC4(uint64_t a1)
{
  *(void *)(v1 + qword_100062100) = a1;
  return _objc_release_x1();
}

id sub_10003EFD8()
{
  uint64_t v0 = (void *)sub_10003F84C();

  return v0;
}

void sub_10003F00C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_10003F068((uint64_t)a3);
}

uint64_t sub_10003F068(uint64_t a1)
{
  *(void *)(v1 + qword_100062108) = a1;
  return _objc_release_x1();
}

id sub_10003F07C()
{
  uint64_t v0 = (void *)sub_10003F85C();

  return v0;
}

void sub_10003F0B0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_10003F10C((uint64_t)a3);
}

uint64_t sub_10003F10C(uint64_t a1)
{
  *(void *)(v1 + qword_100062110) = a1;
  return _objc_release_x1();
}

uint64_t sub_10003F120(uint64_t a1)
{
  *(void *)(v1 + qword_100062118) = a1;
  return _objc_release_x1();
}

void sub_10003F134()
{
  uint64_t v1 = *(void **)(v0 + qword_100062118);
  *(void *)(v0 + qword_100062118) = 0;
}

void sub_10003F148(void *a1)
{
  id v1 = a1;
  sub_10003F134();
}

id sub_10003F190(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[qword_100062100] = 0;
  *(void *)&v4[qword_100062108] = 0;
  *(void *)&v4[qword_100062110] = 0;
  *(void *)&v4[qword_100062118] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ImageCell();
  return [super initWithFrame:a1, a2, a3, a4];
}

id sub_10003F264(double a1, double a2, double a3, double a4)
{
  return sub_10003F190(a1, a2, a3, a4);
}

id sub_10003F288(void *a1)
{
  *(void *)&v1[qword_100062100] = 0;
  *(void *)&v1[qword_100062108] = 0;
  *(void *)&v1[qword_100062110] = 0;
  *(void *)&v1[qword_100062118] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ImageCell();
  [super initWithCoder:a1];

  return v3;
}

id sub_10003F348(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_10003F288(a3);
}

id sub_10003F370()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageCell();
  return [super dealloc];
}

void sub_10003F3E4(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + qword_100062118);
}

uint64_t type metadata accessor for ImageCell()
{
  return sub_100025E74();
}

id sub_10003F468(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_10003F5FC(a1, a3, a4, a5, a6, a2, type metadata accessor for FriendCell);
}

id sub_10003F480(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F68C(a1, a2, a3, type metadata accessor for FriendCell);
}

id sub_10003F498()
{
  return sub_10003F6F4(type metadata accessor for FriendCell);
}

uint64_t type metadata accessor for FriendCell(uint64_t a1)
{
  return sub_10003F7C4(a1, qword_1000621C8);
}

uint64_t sub_10003F4D4()
{
  return type metadata accessor for FriendCell(0);
}

id sub_10003F4DC(uint64_t a1)
{
  return *(id *)(a1 + qword_100062100);
}

void sub_10003F4EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_100062100);
  *(void *)(a1 + qword_100062100) = a3;
  id v3 = a3;
}

id sub_10003F534(uint64_t a1)
{
  return *(id *)(a1 + qword_100062108);
}

void sub_10003F544(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_100062108);
  *(void *)(a1 + qword_100062108) = a3;
  id v3 = a3;
}

id sub_10003F58C(uint64_t a1)
{
  return *(id *)(a1 + qword_100062110);
}

void sub_10003F59C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_100062110);
  *(void *)(a1 + qword_100062110) = a3;
  id v3 = a3;
}

id sub_10003F5E4(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_10003F5FC(a1, a3, a4, a5, a6, a2, type metadata accessor for GameCell);
}

id sub_10003F5FC(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t (*a7)(void))
{
  v12.receiver = a1;
  v12.super_class = (Class)a7(0);
  return [super initWithFrame:a2, a3, a4, a5];
}

id sub_10003F674(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F68C(a1, a2, a3, type metadata accessor for GameCell);
}

id sub_10003F68C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4(0);
  return [super initWithCoder:a3];
}

id sub_10003F6DC()
{
  return sub_10003F6F4(type metadata accessor for GameCell);
}

id sub_10003F6F4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return [super dealloc];
}

uint64_t type metadata accessor for GameCell(uint64_t a1)
{
  return sub_10003F7C4(a1, qword_100062318);
}

uint64_t sub_10003F754()
{
  return type metadata accessor for GameCell(0);
}

id sub_10003F75C(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_10003F5FC(a1, a3, a4, a5, a6, a2, type metadata accessor for PointsCell);
}

id sub_10003F774(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F68C(a1, a2, a3, type metadata accessor for PointsCell);
}

id sub_10003F78C()
{
  return sub_10003F6F4(type metadata accessor for PointsCell);
}

uint64_t type metadata accessor for PointsCell(uint64_t a1)
{
  return sub_10003F7C4(a1, qword_100062468);
}

uint64_t sub_10003F7C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003F7FC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10003F834()
{
  return type metadata accessor for PointsCell(0);
}

uint64_t sub_10003F83C()
{
  return *(void *)(v0 + qword_100062100);
}

uint64_t sub_10003F84C()
{
  return *(void *)(v0 + qword_100062108);
}

uint64_t sub_10003F85C()
{
  return *(void *)(v0 + qword_100062110);
}

uint64_t sub_10003F89C()
{
  type metadata accessor for MessagesViewController();
  uint64_t v1 = swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = v0;
  }
  else
  {
    id v4 = [v0 parentViewController];
    if (v4)
    {
      objc_super v5 = v4;
      uint64_t v2 = sub_10003F89C();
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_10003F9A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  objc_super v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v6 = (objc_class *)type metadata accessor for ActionViewController();
  v50.receiver = v1;
  v50.super_class = v6;
  [super viewDidLoad];
  sub_100047728();
  uint64_t v7 = sub_100047758();
  os_log_type_t v8 = sub_100048018();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Friend Request Card - Local player not authenticated view loaded", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v11 = Strong;
  id v12 = [Strong layer];

  [v12 setCornerRadius:9.0];
  uint64_t v13 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v13)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v14 = v13;
  id v15 = [v13 layer];

  [v15 setMasksToBounds:1];
  if (byte_100060770 == 3)
  {
    uint64_t v16 = swift_unknownObjectWeakLoadStrong();
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      compression_status v18 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v48._countAndFlagsBits = 0xE000000000000000;
      v51._object = (void *)0x800000010004B620;
      v51._countAndFlagsBits = 0xD000000000000013;
      v53.value._countAndFlagsBits = 0;
      v53.value._object = 0;
      v19.super.Class isa = v18;
      v56._countAndFlagsBits = 0;
      v56._object = (void *)0xE000000000000000;
      sub_100047498(v51, v53, v19, v56, v48);

      NSString v20 = sub_100047E38();
      swift_bridgeObjectRelease();
      [v17 setText:v20];

      char v21 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v21)
      {
        uint64_t v22 = v21;
        [v21 setHidden:1];

        uint64_t v23 = sub_10003F89C();
        if (v23)
        {
          uint64_t v24 = (char *)v23;
          sub_10002E19C();
          uint64_t v26 = (double *)&v24[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
          double v27 = 240.0;
LABEL_20:
          *uint64_t v26 = v27;
          *((unsigned char *)v26 + 8) = 0;
          if (v25 != v27) {
            [v24 requestResize];
          }

          goto LABEL_23;
        }
        goto LABEL_23;
      }
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  id v28 = [self shared];
  if (!v28)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v29 = v28;
  unsigned int v30 = [v28 lockedDown];

  uint64_t v31 = swift_unknownObjectWeakLoadStrong();
  uint64_t v32 = (void *)v31;
  if (v30)
  {
    if (!v31)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    uint64_t v33 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v34._countAndFlagsBits = 0xD00000000000001BLL;
    v48._countAndFlagsBits = 0xE000000000000000;
    char v35 = "ALERT_MESSAGE_LOCKDOWN_MODE";
  }
  else
  {
    if (!v31)
    {
LABEL_34:
      __break(1u);
      return;
    }
    uint64_t v33 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v34._countAndFlagsBits = 0xD000000000000024;
    v48._countAndFlagsBits = 0xE000000000000000;
    char v35 = "FRIEND_REQUEST_OPEN_SETTINGS_MESSAGE";
  }
  v34._object = (void *)((unint64_t)(v35 - 32) | 0x8000000000000000);
  v54.value._countAndFlagsBits = 0;
  v54.value._object = 0;
  v36.super.Class isa = v33;
  v57._countAndFlagsBits = 0;
  v57._object = (void *)0xE000000000000000;
  sub_100047498(v34, v54, v36, v57, v48);

  NSString v37 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v32 setText:v37];

  uint64_t v38 = swift_unknownObjectWeakLoadStrong();
  if (!v38) {
    goto LABEL_31;
  }
  uint64_t v39 = (void *)v38;
  uint64_t v40 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v49._countAndFlagsBits = 0xE000000000000000;
  v52._countAndFlagsBits = 0x53474E4954544553;
  v52._object = (void *)0xEF4E4F545455425FLL;
  v55.value._countAndFlagsBits = 0;
  v55.value._object = 0;
  v41.super.Class isa = v40;
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  sub_100047498(v52, v55, v41, v58, v49);

  NSString v42 = sub_100047E38();
  swift_bridgeObjectRelease();
  [v39 setTitle:v42 forState:0];

  uint64_t v43 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v43)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v44 = v43;
  [v43 addTarget:v1 action:"openSettings" forControlEvents:64];

  uint64_t v45 = sub_10003F89C();
  if (v45)
  {
    uint64_t v24 = (char *)v45;
    sub_10002E19C();
    uint64_t v26 = (double *)&v24[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
    double v27 = 280.0;
    goto LABEL_20;
  }
LABEL_23:
  uint64_t v46 = sub_10003F89C();
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    sub_10002DB48();
  }
}

id sub_100040190()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionViewController();
  [super dealloc];
}

uint64_t type metadata accessor for ActionViewController()
{
  return self;
}

void sub_100040234(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_100010B0C(0, (unint64_t *)&qword_100060CE8);
  uint64_t v5 = sub_100047F58();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000402E4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = sub_100047628();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  switch(a3)
  {
    case 3:
    case 6:
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v4);
      char v11 = sub_100047618();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if (v11)
      {
        sub_100047708();
        return sub_1000476C8();
      }
      id v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v13._countAndFlagsBits = 0xD00000000000001CLL;
      v18._countAndFlagsBits = 0xE000000000000000;
      uint64_t v14 = "FRIEND_REQUEST_CARD_SUBTITLE";
      goto LABEL_12;
    case 4:
      id v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v18._countAndFlagsBits = 0xE000000000000000;
      id v15 = "FRIEND_REQUEST_CARD_SUBTITLE_WHEN_ALREADY_FRIENDS";
      goto LABEL_10;
    case 5:
      id v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
      v18._countAndFlagsBits = 0xE000000000000000;
      id v15 = "FRIEND_REQUEST_CARD_SUBTITLE_WHEN_INVITE_ACCEPTED";
LABEL_10:
      v13._object = (void *)((unint64_t)(v15 - 32) | 0x8000000000000000);
      v13._countAndFlagsBits = 0xD000000000000031;
      goto LABEL_13;
    case 7:
    case 8:
    case 9:
      return v8;
    default:
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v4);
      char v9 = sub_100047618();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if (v9)
      {
        sub_100047708();
        return sub_1000476D8();
      }
      else
      {
        id v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v13._countAndFlagsBits = 0xD000000000000023;
        v18._countAndFlagsBits = 0xE000000000000000;
        uint64_t v14 = "FRIEND_REQUEST_CARD_SENDER_SUBTITLE";
LABEL_12:
        v13._object = (void *)((unint64_t)(v14 - 32) | 0x8000000000000000);
LABEL_13:
        v20.value._countAndFlagsBits = 0;
        v20.value._object = 0;
        v16.super.Class isa = v12;
        v21._countAndFlagsBits = 0;
        v21._object = (void *)0xE000000000000000;
        uint64_t v8 = sub_100047498(v13, v20, v16, v21, v18);
      }
      return v8;
  }
}

uint64_t sub_1000405A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10004061C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100040690(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  uint64_t v15 = v14;
  uint64_t v96 = a8;
  uint64_t v78 = a7;
  uint64_t v94 = a6;
  uint64_t v76 = a5;
  uint64_t v92 = a4;
  uint64_t v74 = a3;
  uint64_t v73 = a2;
  id v82 = a1;
  uint64_t v97 = a14;
  id v79 = a13;
  uint64_t v95 = a12;
  uint64_t v77 = a11;
  uint64_t v93 = a10;
  uint64_t v75 = a9;
  uint64_t v16 = sub_100004714(&qword_100062848);
  __chkstk_darwin(v16 - 8);
  uint64_t v90 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004714(&qword_100062850);
  __chkstk_darwin(v18 - 8);
  uint64_t v86 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100048148();
  uint64_t v99 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v83 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100004714(&qword_100061DB8);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1000480C8();
  uint64_t v81 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  double v25 = (char *)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100004714(&qword_100062858);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v87 = v26;
  uint64_t v88 = v27;
  __chkstk_darwin(v26);
  unint64_t v98 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100004714(&qword_100062860);
  uint64_t v91 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v84 = (char *)&v72 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100004714(&qword_100062840);
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100004714((uint64_t *)&unk_100061DD0);
  uint64_t v35 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  NSString v37 = (char *)&v72 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__state;
  id v100 = 0;
  uint64_t v101 = 0;
  char v102 = 9;
  sub_100047788();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v38, v37, v34);
  uint64_t v39 = v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__isProcessingAction;
  LOBYTE(v100) = 0;
  sub_100047788();
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v39, v33, v30);
  uint64_t v40 = OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel;
  *(void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel) = 0;
  *(unsigned char *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent) = 0;
  *(void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver) = 0;
  NSBundle v41 = *(void **)(v15 + v40);
  id v42 = v82;
  *(void *)(v15 + v40) = v82;
  id v82 = v42;

  uint64_t v43 = v73;
  *(void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation) = v73;
  uint64_t v44 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile);
  uint64_t v45 = v92;
  *uint64_t v44 = v74;
  v44[1] = v45;
  uint64_t v46 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentFriendsList);
  uint64_t v48 = v93;
  uint64_t v47 = v94;
  *uint64_t v46 = v76;
  v46[1] = v47;
  Swift::String v49 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onAcceptInvite);
  uint64_t v51 = v95;
  uint64_t v50 = v96;
  *Swift::String v49 = v78;
  v49[1] = v50;
  Swift::String v52 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
  *Swift::String v52 = v75;
  v52[1] = v48;
  Swift::String_optional v53 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onMessageUrlCreated);
  *Swift::String_optional v53 = v77;
  v53[1] = v51;
  Swift::String_optional v54 = (void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
  uint64_t v55 = v97;
  *Swift::String_optional v54 = v79;
  v54[1] = v55;
  id v79 = v43;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000443E4();
  id v56 = [self defaultCenter];
  NSString v57 = sub_100047E38();
  sub_1000480D8();

  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  id v100 = (id)sub_100048098();
  uint64_t v58 = sub_100048078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v23, 1, 1, v58);
  sub_1000472D0(&qword_100062868, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  sub_100047318((unint64_t *)&qword_100061DE8, (unint64_t *)&qword_100060CC0);
  uint64_t v59 = v80;
  sub_1000477E8();
  sub_100004868((uint64_t)v23, &qword_100061DB8);

  (*(void (**)(char *, uint64_t))(v81 + 8))(v25, v59);
  uint64_t v60 = v83;
  sub_100048138();
  uint64_t v61 = v85;
  uint64_t v62 = v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v86, 1, 1, v85);
  id v100 = [self mainRunLoop];
  uint64_t v63 = sub_100048128();
  uint64_t v64 = (uint64_t)v90;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v90, 1, 1, v63);
  sub_100010B0C(0, &qword_100062870);
  sub_100004DB0(&qword_100062878, &qword_100062858);
  sub_100047318(&qword_100062880, &qword_100062870);
  char v65 = v84;
  uint64_t v66 = (uint64_t)v62;
  uint64_t v67 = v87;
  id v68 = v98;
  sub_1000477D8();
  sub_100004868(v64, &qword_100062848);

  sub_100004868(v66, &qword_100062850);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v60, v61);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v68, v67);
  swift_allocObject();
  swift_weakInit();
  sub_100004DB0(&qword_100062888, &qword_100062860);
  uint64_t v69 = v89;
  uint64_t v70 = sub_1000477F8();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v65, v69);
  *(void *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver) = v70;
  swift_release();
  return v15;
}

uint64_t sub_100041104()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000443E4();
    return swift_release();
  }
  return result;
}

void sub_10004115C()
{
  uint64_t v1 = v0;
  if ([self _gkIsOnline])
  {
    id v2 = [self shared];
    if (v2)
    {
      uint64_t v3 = v2;
      unsigned __int8 v4 = [v2 isAddingFriendsRestricted];

      if (v4)
      {
        id v5 = [objc_allocWithZone((Class)GKReporter) init];
        [v5 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestRestrictedError];

        id v6 = [objc_allocWithZone((Class)GKAPIReporter) init];
        NSString v7 = sub_100047E38();
        NSString v8 = sub_100047E38();
        NSString v9 = sub_100047E38();
        sub_100043D60();
        NSString v10 = sub_100047E38();
        swift_bridgeObjectRelease();
        NSString v11 = sub_100047E38();
        [v6 recordClickWithAction:v7 targetId:v8 targetType:v9 pageId:v10 pageType:v11];

        id v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                        + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
        Swift::String v13 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v50._countAndFlagsBits = 0xE000000000000000;
        v55._countAndFlagsBits = 0x525F444E45495246;
        v55._object = (void *)0xEE00545345555145;
        v59.value._countAndFlagsBits = 0;
        v59.value._object = 0;
        v14.super.Class isa = v13;
        v63._countAndFlagsBits = 0;
        v63._object = (void *)0xE000000000000000;
        uint64_t v15 = sub_100047498(v55, v59, v14, v63, v50);
        uint64_t v17 = v16;

        uint64_t v18 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
        v56._countAndFlagsBits = 0xD000000000000027;
        v51._countAndFlagsBits = 0xE000000000000000;
        v56._object = (void *)0x800000010004A360;
        v60.value._countAndFlagsBits = 0;
        v60.value._object = 0;
        v19.super.Class isa = v18;
        v64._countAndFlagsBits = 0;
        v64._object = (void *)0xE000000000000000;
        uint64_t v20 = sub_100047498(v56, v60, v19, v64, v51);
        uint64_t v22 = v21;

        v12(v15, v17, v20, v22);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_1000477B8();
        uint64_t v39 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation);
        id v40 = [v39 recipientAddresses];
        NSBundle v41 = (void *)sub_100047F58();

        if (v41[2])
        {
          uint64_t v42 = v41[4];
          uint64_t v43 = v41[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          id v44 = [v39 recipientAddresses];
          uint64_t v45 = sub_100047F58();

          unint64_t v46 = *(void *)(v45 + 16);
          swift_bridgeObjectRelease();
          BOOL v47 = v46 > 1;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          BOOL v47 = 0;
        }
        uint64_t v48 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
        if (v48)
        {
          swift_retain();
          id v49 = v48;
          sub_100014B5C(v42, v43, v47, sub_1000472BC, v1);

          swift_release();
        }
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0
                                                                    + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    uint64_t v24 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v57._countAndFlagsBits = 0xD000000000000016;
    v50._countAndFlagsBits = 0xE000000000000000;
    v57._object = (void *)0x800000010004A320;
    v61.value._countAndFlagsBits = 0;
    v61.value._object = 0;
    v25.super.Class isa = v24;
    v65._countAndFlagsBits = 0;
    v65._object = (void *)0xE000000000000000;
    uint64_t v26 = sub_100047498(v57, v61, v25, v65, v50);
    uint64_t v28 = v27;

    uint64_t v29 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v58._countAndFlagsBits = 0xD000000000000018;
    v52._countAndFlagsBits = 0xE000000000000000;
    v58._object = (void *)0x800000010004A120;
    v62.value._countAndFlagsBits = 0;
    v62.value._object = 0;
    v30.super.Class isa = v29;
    v66._countAndFlagsBits = 0;
    v66._object = (void *)0xE000000000000000;
    uint64_t v31 = sub_100047498(v58, v62, v30, v66, v52);
    uint64_t v33 = v32;

    v23(v26, v28, v31, v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v34 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v35 = sub_100047E38();
    NSString v36 = sub_100047E38();
    NSString v37 = sub_100047E38();
    sub_100043D60();
    NSString v38 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v53 = sub_100047E38();
    [v34 recordClickWithAction:v35 targetId:v36 targetType:v37 pageId:v38 pageType:v53];
  }
}

void sub_10004177C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100047768();
  uint64_t v5 = __chkstk_darwin(v4);
  NSString v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  NSString v9 = (char *)&v52 - v8;
  uint64_t v54 = v10;
  if (a1)
  {
    uint64_t v53 = v4;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock[0]) = 0;
    swift_retain();
    sub_1000477B8();
    id v11 = [objc_allocWithZone((Class)GKReporter) init];
    [v11 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestExpiredError];

    id v12 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v13 = sub_100047E38();
    NSString v14 = sub_100047E38();
    NSString v15 = sub_100047E38();
    sub_100043D60();
    NSString v16 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v17 = sub_100047E38();
    [v12 recordClickWithAction:v13 targetId:v14 targetType:v15 pageId:v16 pageType:v17];

    sub_100047728();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v18 = sub_100047758();
    os_log_type_t v19 = sub_100048028();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v55 = a1;
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_errorRetain();
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v22 = sub_100047E88();
      uint64_t v55 = sub_100046724(v22, v23, aBlock);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "acceptButtonPressed - acceptFriendRequest error: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v7, v53);
    NSString v37 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2
                                                                    + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    NSString v38 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v50._countAndFlagsBits = 0xE000000000000000;
    v57._countAndFlagsBits = 0x525F444E45495246;
    v57._object = (void *)0xEE00545345555145;
    v59.value._countAndFlagsBits = 0;
    v59.value._object = 0;
    v39.super.Class isa = v38;
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    uint64_t v40 = sub_100047498(v57, v59, v39, v61, v50);
    uint64_t v42 = v41;

    uint64_t v43 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v58._countAndFlagsBits = 0xD000000000000024;
    v51._countAndFlagsBits = 0xE000000000000000;
    v58._object = (void *)0x800000010004A170;
    v60.value._countAndFlagsBits = 0;
    v60.value._object = 0;
    v44.super.Class isa = v43;
    v62._countAndFlagsBits = 0;
    v62._object = (void *)0xE000000000000000;
    uint64_t v45 = sub_100047498(v58, v60, v44, v62, v51);
    uint64_t v47 = v46;

    v37(v40, v42, v45, v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v24 = [objc_allocWithZone((Class)GKReporter) init];
    [v24 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestAccepted];

    id v25 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v26 = sub_100047E38();
    NSString v27 = sub_100047E38();
    NSString v28 = sub_100047E38();
    sub_100043D60();
    NSString v29 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v30 = sub_100047E38();
    [v25 recordClickWithAction:v26 targetId:v27 targetType:v28 pageId:v29 pageType:v30];

    sub_100047738();
    swift_retain_n();
    uint64_t v31 = sub_100047758();
    os_log_type_t v32 = sub_100048008();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v55 = a2;
      aBlock[0] = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      type metadata accessor for FriendInviteCardViewModel();
      uint64_t v53 = v4;
      swift_retain();
      uint64_t v35 = sub_100047E88();
      uint64_t v55 = sub_100046724(v35, v36, aBlock);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s acceptButtonPressed - acceptFriendRequest succeed", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v54 + 8))(v9, v53);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v9, v4);
    }
    id v48 = [self local];
    aBlock[4] = (uint64_t)sub_1000472C4;
    aBlock[5] = a2;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100040234;
    aBlock[3] = (uint64_t)&unk_10005B998;
    id v49 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v48 loadFriendsAsPlayersWithCompletionHandler:v49];
    _Block_release(v49);
  }
}

uint64_t sub_100041F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_100047D48();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSString v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100047D68();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [*(id *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation) recipientAddresses];
  uint64_t v13 = sub_100047F58();

  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = swift_bridgeObjectRelease();
  if (v14 == 1) {
    return (*(uint64_t (**)(uint64_t))(a3
  }
                                              + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onAcceptInvite))(v15);
  sub_100010B0C(0, (unint64_t *)&qword_100060CC0);
  NSString v17 = (void *)sub_100048098();
  aBlock[4] = sub_1000472CC;
  aBlock[5] = a3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001479C;
  aBlock[3] = &unk_10005B9C0;
  uint64_t v18 = _Block_copy(aBlock);
  uint64_t v21 = v8;
  os_log_type_t v19 = v18;
  swift_retain();
  swift_release();
  sub_100047D58();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000472D0((unint64_t *)&unk_100061E10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004714((uint64_t *)&unk_100060CD0);
  sub_100004DB0((unint64_t *)&qword_100061E20, (uint64_t *)&unk_100060CD0);
  sub_1000481A8();
  sub_1000480A8();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v21);
}

void sub_1000422B0()
{
  uint64_t v1 = v0;
  if ([self _gkIsOnline])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1000477B8();
    id v2 = [*(id *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation) recipientAddresses];
    uint64_t v3 = (void *)sub_100047F58();

    if (v3[2])
    {
      uint64_t v4 = v3[4];
      uint64_t v5 = v3[5];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
    if (v22)
    {
      swift_retain();
      id v23 = v22;
      sub_1000151CC(v4, v5, (void (*)(void))sub_1000472B4, v1);

      swift_release();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0
                                                                   + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    NSString v7 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v28._countAndFlagsBits = 0xD000000000000016;
    v24._countAndFlagsBits = 0xE000000000000000;
    v28._object = (void *)0x800000010004A320;
    v30.value._countAndFlagsBits = 0;
    v30.value._object = 0;
    v8.super.Class isa = v7;
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    uint64_t v9 = sub_100047498(v28, v30, v8, v32, v24);
    uint64_t v11 = v10;

    id v12 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v29._countAndFlagsBits = 0xD000000000000018;
    v25._countAndFlagsBits = 0xE000000000000000;
    v29._object = (void *)0x800000010004A120;
    v31.value._countAndFlagsBits = 0;
    v31.value._object = 0;
    v13.super.Class isa = v12;
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    uint64_t v14 = sub_100047498(v29, v31, v13, v33, v25);
    uint64_t v16 = v15;

    v6(v9, v11, v14, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v17 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v18 = sub_100047E38();
    NSString v19 = sub_100047E38();
    NSString v20 = sub_100047E38();
    sub_100043D60();
    NSString v21 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v26 = sub_100047E38();
    [v17 recordClickWithAction:v18 targetId:v19 targetType:v20 pageId:v21 pageType:v26];
  }
}

uint64_t sub_100042600(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = sub_100047768();
  uint64_t v4 = *(void *)(v53 - 8);
  uint64_t v5 = __chkstk_darwin(v53);
  NSString v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v52 - v8;
  id v10 = [objc_allocWithZone((Class)GKReporter) init];
  uint64_t v11 = v10;
  if (a1)
  {
    uint64_t v52 = v4;
    [v10 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestExpiredError];

    id v12 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v13 = sub_100047E38();
    NSString v14 = sub_100047E38();
    NSString v15 = sub_100047E38();
    sub_100043D60();
    NSString v16 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v17 = sub_100047E38();
    [v12 recordClickWithAction:v13 targetId:v14 targetType:v15 pageId:v16 pageType:v17];

    sub_100047728();
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    NSString v18 = sub_100047758();
    os_log_type_t v19 = sub_100048028();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v54 = a2;
      uint64_t v55 = v21;
      *(_DWORD *)uint64_t v20 = 136315394;
      type metadata accessor for FriendInviteCardViewModel();
      swift_retain();
      uint64_t v22 = sub_100047E88();
      uint64_t v54 = sub_100046724(v22, v23, &v55);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v54 = a1;
      swift_errorRetain();
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v24 = sub_100047E88();
      uint64_t v54 = sub_100046724(v24, v25, &v55);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s ignoreAction - ignoreFriendRequest error: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v53);
    NSString v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2
                                                                    + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    NSBundle v39 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v50._countAndFlagsBits = 0xE000000000000000;
    v56._countAndFlagsBits = 0x525F444E45495246;
    v56._object = (void *)0xEE00545345555145;
    v58.value._countAndFlagsBits = 0;
    v58.value._object = 0;
    v40.super.Class isa = v39;
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    uint64_t v41 = sub_100047498(v56, v58, v40, v60, v50);
    uint64_t v43 = v42;

    NSBundle v44 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
    v57._countAndFlagsBits = 0xD000000000000024;
    v51._countAndFlagsBits = 0xE000000000000000;
    v57._object = (void *)0x800000010004A170;
    v59.value._countAndFlagsBits = 0;
    v59.value._object = 0;
    v45.super.Class isa = v44;
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    uint64_t v46 = sub_100047498(v57, v59, v45, v61, v51);
    uint64_t v48 = v47;

    v38(v41, v43, v46, v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v55) = 0;
    swift_retain();
    return sub_1000477B8();
  }
  else
  {
    [v10 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestAccepted];

    id v26 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v27 = sub_100047E38();
    NSString v28 = sub_100047E38();
    NSString v29 = sub_100047E38();
    sub_100043D60();
    NSString v30 = sub_100047E38();
    swift_bridgeObjectRelease();
    NSString v31 = sub_100047E38();
    [v26 recordClickWithAction:v27 targetId:v28 targetType:v29 pageId:v30 pageType:v31];

    sub_100047738();
    swift_retain_n();
    Swift::String v32 = sub_100047758();
    os_log_type_t v33 = sub_100048008();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v54 = a2;
      uint64_t v55 = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      type metadata accessor for FriendInviteCardViewModel();
      swift_retain();
      uint64_t v36 = sub_100047E88();
      uint64_t v54 = sub_100046724(v36, v37, &v55);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s ignoreAction - ignoreFriendRequest succeed", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v53);
  }
}

void sub_100042D84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  uint64_t v6 = sub_100047758();
  os_log_type_t v7 = sub_100048008();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v1;
    uint64_t v22 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    swift_retain();
    uint64_t v11 = sub_100047E88();
    uint64_t v21 = sub_100046724(v11, v12, &v22);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s retry", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  id v13 = [objc_allocWithZone((Class)GKAPIReporter) init];
  NSString v14 = sub_100047E38();
  NSString v15 = sub_100047E38();
  NSString v16 = sub_100047E38();
  sub_100043D60();
  NSString v17 = sub_100047E38();
  swift_bridgeObjectRelease();
  NSString v18 = sub_100047E38();
  [v13 recordClickWithAction:v14 targetId:v15 targetType:v16 pageId:v17 pageType:v18];

  sub_1000443E4();
}

uint64_t sub_100043090(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v24 = a2;
  uint64_t v5 = sub_100047768();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  uint64_t v9 = sub_100047758();
  os_log_type_t v10 = sub_100048008();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = v5;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    unint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v25 = v3;
    id v26 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    uint64_t v23 = a1;
    swift_retain();
    uint64_t v13 = sub_100047E88();
    uint64_t v25 = sub_100046724(v13, v14, (uint64_t *)&v26);
    sub_100048168();
    swift_release_n();
    a1 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s present profile", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  if (((1 << v28) & 0x178) != 0)
  {
    sub_100038920(v26, v27, v28);
  }
  else if (((1 << v28) & 7) != 0)
  {
    sub_100038920(v26, v27, v28);
    id v15 = [objc_allocWithZone((Class)GKReporter) init];
    NSString v16 = v15;
    uint64_t v17 = GKReporterDomainImprovedFriendingUIInteractions;
    NSString v18 = &GKSenderTappedViewPlayerProfileButton;
LABEL_10:
    [v15 reportEvent:v17 type:*v18];

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3
                                                                + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, v24, v19);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  uint64_t v19 = v28;
  switch(v28)
  {
    case 1u:
      sub_100038920(v26, v27, 1u);
      break;
    case 2u:
      sub_100038920(v26, v27, 2u);
      break;
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      sub_100038920(v26, v27, v28);
      id v15 = [objc_allocWithZone((Class)GKReporter) init];
      NSString v16 = v15;
      uint64_t v17 = GKReporterDomainImprovedFriendingUIInteractions;
      NSString v18 = &GKReceiverTappedViewPlayerProfileButton;
      goto LABEL_10;
    case 7u:
    case 9u:
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3
                                                                  + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, v24, v19);
    case 8u:
      sub_100038920(v26, v27, 8u);
      break;
    default:
      sub_100038920(v26, v27, 0);
      break;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3
                                                              + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, v24, v19);
}

uint64_t sub_1000434A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  os_log_type_t v10 = sub_100047758();
  os_log_type_t v11 = sub_100048008();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = v3;
    uint64_t v24 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    uint64_t v22 = a2;
    swift_retain();
    uint64_t v15 = sub_100047E88();
    uint64_t v23 = sub_100046724(v15, v16, &v24);
    sub_100048168();
    swift_release_n();
    a2 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s present friend profile", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v21;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v17 = [objc_allocWithZone((Class)GKReporter) init];
  [v17 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKViewFriendProfileButtonTapped];

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3
                                                     + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, a2);
}

uint64_t sub_100043744()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  uint64_t v6 = sub_100047758();
  os_log_type_t v7 = sub_100048008();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v1;
    uint64_t v18 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    swift_retain();
    uint64_t v11 = sub_100047E88();
    uint64_t v17 = sub_100046724(v11, v12, &v18);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s present friend list", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  id v13 = [objc_allocWithZone((Class)GKReporter) init];
  [v13 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKViewFriendListButtonTapped];

  return (*(uint64_t (**)(void))(v1
                              + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentFriendsList))();
}

void *sub_1000439C8(void *a1)
{
  id v2 = [a1 internal];
  unsigned int v3 = [v2 friendsVisibility];

  if (v3) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004714(&qword_100062898);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10004D280;
  [a1 stats];
  uint64_t v5 = v33;
  uint64_t v6 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v36._countAndFlagsBits = 0xD00000000000001CLL;
  v30._countAndFlagsBits = 0xE000000000000000;
  v36._object = (void *)0x800000010004A090;
  v39.value._countAndFlagsBits = 0;
  v39.value._object = 0;
  v7.super.Class isa = v6;
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_100047498(v36, v39, v7, v42, v30);

  sub_100004714(&qword_100060C70);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10004BE20;
  [a1 stats];
  uint64_t v9 = v33;
  *(void *)(v8 + 56) = &type metadata for Int;
  *(void *)(v8 + 64) = &protocol witness table for Int;
  *(void *)(v8 + 32) = v9;
  uint64_t v10 = sub_100047E78();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v10;
  *(void *)(v4 + 48) = v12;
  [a1 stats];
  uint64_t v13 = v35;
  uint64_t v14 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v37._countAndFlagsBits = 0xD000000000000018;
  v31._countAndFlagsBits = 0xE000000000000000;
  v37._object = (void *)0x800000010004A0B0;
  v40.value._countAndFlagsBits = 0;
  v40.value._object = 0;
  v15.super.Class isa = v14;
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  sub_100047498(v37, v40, v15, v43, v31);

  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10004BE20;
  [a1 stats];
  uint64_t v17 = v35;
  *(void *)(v16 + 56) = &type metadata for Int;
  *(void *)(v16 + 64) = &protocol witness table for Int;
  *(void *)(v16 + 32) = v17;
  uint64_t v18 = sub_100047E78();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  *(void *)(v4 + 56) = v13;
  *(void *)(v4 + 64) = v18;
  *(void *)(v4 + 72) = v20;
  [a1 stats];
  uint64_t v21 = v34;
  uint64_t v22 = (objc_class *)(id)GKGameCenterUIFrameworkBundle();
  v32._countAndFlagsBits = 0xE000000000000000;
  v38._object = (void *)0x800000010004A0D0;
  v38._countAndFlagsBits = 0xD000000000000011;
  v41.value._countAndFlagsBits = 0;
  v41.value._object = 0;
  v23.super.Class isa = v22;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_100047498(v38, v41, v23, v44, v32);

  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_10004BE20;
  [a1 stats];
  uint64_t v25 = v34;
  *(void *)(v24 + 56) = &type metadata for Int;
  *(void *)(v24 + 64) = &protocol witness table for Int;
  *(void *)(v24 + 32) = v25;
  uint64_t v26 = sub_100047E78();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  *(void *)(v4 + 80) = v21;
  *(void *)(v4 + 88) = v26;
  *(void *)(v4 + 96) = v28;
  return (void *)v4;
}

uint64_t sub_100043D18(uint64_t a1, uint64_t a2)
{
  return sub_100043090(a1, a2);
}

uint64_t sub_100043D3C(uint64_t a1, uint64_t a2)
{
  return sub_1000434A0(a1, a2);
}

uint64_t sub_100043D60()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  uint64_t v1 = 0x6E65697069636572;
  uint64_t v2 = 0x7265646E6573;
  uint64_t v3 = v13;
  switch(v13)
  {
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 8u:
      uint64_t v2 = 0x6E65697069636572;
      goto LABEL_3;
    case 7u:
    case 9u:
      break;
    default:
LABEL_3:
      sub_100038920(v11, v12, v13);
      uint64_t v1 = v2;
      break;
  }
  id v4 = [*(id *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation) recipientAddresses:v3];
  uint64_t v5 = sub_100047F58();

  unint64_t v6 = *(void *)(v5 + 16);
  swift_bridgeObjectRelease();
  BOOL v7 = v6 > 1;
  if (v6 <= 1) {
    uint64_t v8 = 0x7564697669646E69;
  }
  else {
    uint64_t v8 = 0x70756F7267;
  }
  if (v7) {
    uint64_t v9 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v9 = (void *)0xEA00000000006C61;
  }
  v14._countAndFlagsBits = 95;
  v14._object = (void *)0xE100000000000000;
  sub_100047EB8(v14);
  v15._countAndFlagsBits = v8;
  v15._object = v9;
  sub_100047EB8(v15);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_100043F20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  unint64_t v6 = sub_100047758();
  os_log_type_t v7 = sub_100048008();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v2;
    uint64_t v9 = v8;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v1;
    *(_DWORD *)uint64_t v9 = 136315394;
    type metadata accessor for FriendInviteCardViewModel();
    swift_retain();
    uint64_t v10 = sub_100047E88();
    uint64_t v22 = (void *)sub_100046724(v10, v11, &v21);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1000477A8();
    swift_release();
    swift_release();
    uint64_t v12 = sub_100047E88();
    uint64_t v22 = (void *)sub_100046724(v12, v13, &v21);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s state is set to %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v14 = OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent;
  if ((v1[OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent] & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1000477A8();
    swift_release();
    swift_release();
    switch(v24)
    {
      case 3u:
      case 4u:
      case 5u:
      case 6u:
        sub_100038920(v22, v23, v24);

        id v15 = [objc_allocWithZone((Class)GKReporter) init];
        [v15 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKFriendInviteViewedByReceiver];
        goto LABEL_8;
      case 7u:
      case 9u:
        return;
      case 8u:
        sub_100038920(v22, v23, 8u);
        break;
      default:
        sub_100038920(v22, v23, v24);
        id v15 = [*(id *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation] recipientAddresses];
LABEL_8:

        id v16 = [objc_allocWithZone((Class)GKAPIReporter) init];
        sub_100043D60();
        NSString v17 = sub_100047E38();
        swift_bridgeObjectRelease();
        NSString v18 = sub_100047E38();
        NSString v19 = sub_100047E38();
        [v16 recordPageWithID:v17 pageContext:v18 pageType:v19];

        v1[v14] = 1;
        break;
    }
  }
}

void sub_1000443E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100047768();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - v7;
  sub_100047738();
  swift_retain_n();
  uint64_t v9 = sub_100047758();
  os_log_type_t v10 = sub_100048008();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v34 = v3;
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v35 = v1;
    v36[0] = v12;
    *(_DWORD *)unint64_t v11 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    uint64_t v33 = v6;
    swift_retain();
    uint64_t v13 = sub_100047E88();
    uint64_t v35 = sub_100046724(v13, v14, v36);
    uint64_t v3 = v34;
    sub_100048168();
    swift_release_n();
    unint64_t v6 = v33;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s loadState", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  id v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v8, v2);
  id v16 = *(char **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
  if (v16)
  {
    unint64_t v17 = *(void *)&v16[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
    if (v17
      && ((v17 & 0x2000000000000000) != 0
        ? (uint64_t v18 = HIBYTE(v17) & 0xF)
        : (uint64_t v18 = *(void *)&v16[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode] & 0xFFFFFFFFFFFFLL),
          v18))
    {
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = v1;
      *(void *)(v19 + 24) = v16;
      uint64_t v20 = v16;
      swift_retain();
      uint64_t v21 = v20;
      sub_100014200((uint64_t)sub_100047224, v19);

      swift_release();
    }
    else
    {
      uint64_t v22 = v16;
      sub_100045544(v22);
    }
  }
  else
  {
    sub_100047738();
    swift_retain_n();
    NSBundle v23 = sub_100047758();
    os_log_type_t v24 = sub_100048008();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v32 = v2;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v35 = v1;
      v36[0] = v26;
      uint64_t v33 = v6;
      uint64_t v34 = v3;
      *(_DWORD *)uint64_t v25 = 136315138;
      type metadata accessor for FriendInviteCardViewModel();
      swift_retain();
      uint64_t v27 = sub_100047E88();
      uint64_t v35 = sub_100046724(v27, v28, v36);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s expected a playerModel", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      NSString v29 = v33;
      uint64_t v30 = v32;
    }
    else
    {

      swift_release_n();
      NSString v29 = v6;
      uint64_t v30 = v2;
    }
    v15(v29, v30);
    swift_getKeyPath();
    swift_getKeyPath();
    v36[0] = 0;
    v36[1] = 0;
    char v37 = 7;
    swift_retain();
    sub_1000477B8();
    sub_100043F20();
    (*(void (**)(void))(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))();
  }
}

void sub_1000448C0(void **a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v7 = (void *)sub_100047768();
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
LABEL_4:
    sub_100047738();
    swift_retain_n();
    id v15 = a4;
    id v16 = sub_100047758();
    os_log_type_t v17 = sub_100048008();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      id v68 = (void **)swift_slowAlloc();
      long long aBlock = v68;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v77 = a3;
      type metadata accessor for FriendInviteCardViewModel();
      id v70 = v7;
      swift_retain();
      uint64_t v69 = v8;
      uint64_t v19 = sub_100047E88();
      uint64_t v77 = sub_100046724(v19, v20, (uint64_t *)&aBlock);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2112;
      uint64_t v77 = (uint64_t)v15;
      uint64_t v21 = v15;
      sub_100048168();
      *uint64_t v67 = v15;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s Could not find a valid player using playerModel: %@", (uint8_t *)v18, 0x16u);
      sub_100004714((uint64_t *)&unk_100060CB0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, id))(v69 + 8))(v10, v70);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, void *))(v8 + 8))(v10, v7);
    }
    uint64_t v22 = (void **)v15[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType];
    swift_getKeyPath();
    swift_getKeyPath();
    long long aBlock = v22;
    uint64_t v72 = 0;
    LOBYTE(v73) = 7;
    swift_retain();
    sub_1000477B8();
    sub_100043F20();
    (*(void (**)(void))(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))();
    return;
  }
  unint64_t v11 = self;
  uint64_t v12 = a1;
  id v13 = [v11 unknownPlayer];
  sub_100010B0C(0, (unint64_t *)&qword_100060CE8);
  char v14 = sub_1000480F8();

  if (v14)
  {

    goto LABEL_4;
  }
  switch(a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState])
  {
    case 1:
      swift_getKeyPath();
      swift_getKeyPath();
      long long aBlock = a1;
      uint64_t v72 = 0;
      char v23 = 6;
      goto LABEL_12;
    case 2:
      uint64_t v26 = (uint64_t *)&a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
      if ((a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8] & 1) != 0
        || (uint64_t v27 = *v26, *v26 < 1))
      {
        swift_getKeyPath();
        swift_getKeyPath();
        long long aBlock = a1;
        uint64_t v72 = 0;
        LOBYTE(v73) = 0;
LABEL_13:
        os_log_type_t v24 = v12;
        goto LABEL_14;
      }
      uint64_t v28 = a3;
      NSString v29 = *(void **)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation);
      uint64_t v30 = v12;
      id v31 = [v29 recipientAddresses];
      uint64_t v32 = sub_100047F58();

      unint64_t v33 = *(void *)(v32 + 16);
      swift_bridgeObjectRelease();
      if (v33 >= 2)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        long long aBlock = a1;
        uint64_t v72 = v27;
        LOBYTE(v73) = 2;
        uint64_t v34 = v30;
        swift_retain();
        sub_1000477B8();
        sub_100043F20();

        return;
      }
      uint64_t v25 = (void **)[self local];
      Swift::String v56 = (void *)swift_allocObject();
      v56[2] = a4;
      v56[3] = v28;
      v56[4] = v30;
      uint64_t v75 = sub_1000472A0;
      uint64_t v76 = v56;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v72 = 1107296256;
      uint64_t v73 = sub_100040234;
      uint64_t v74 = &unk_10005B970;
      Swift::String v57 = _Block_copy(&aBlock);
      Swift::String_optional v58 = v30;
      swift_retain();
      Swift::String_optional v59 = a4;
      swift_release();
      [v25 loadFriendsAsPlayersWithCompletionHandler:v57];

      _Block_release(v57);
      goto LABEL_15;
    case 3:
      uint64_t v35 = &a4[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
      swift_beginAccess();
      uint64_t v36 = *(void *)v35;
      if (!v36)
      {
        uint64_t v55 = v12;
        goto LABEL_44;
      }
      uint64_t v37 = *(void *)(v36 + 16);
      if (v37)
      {
        uint64_t v69 = a3;
        id v70 = self;
        Swift::String v38 = v12;
        swift_bridgeObjectRetain();
        id v68 = (void **)v36;
        Swift::String_optional v39 = (void **)(v36 + 40);
        Swift::String_optional v40 = (void **)&_swiftEmptyArrayStorage;
        while (1)
        {
          Swift::String v42 = *(v39 - 1);
          Swift::String_optional v41 = *v39;
          swift_bridgeObjectRetain();
          id v43 = [v70 local];
          id v44 = [v43 internal];

          id v45 = [v44 playerID];
          uint64_t v46 = sub_100047E68();
          uint64_t v48 = v47;

          if (v42 == (void *)v46 && v41 == v48) {
            break;
          }
          char v50 = sub_100048328();
          swift_bridgeObjectRelease();
          if (v50) {
            goto LABEL_32;
          }
          swift_bridgeObjectRelease();
LABEL_24:
          v39 += 2;
          if (!--v37)
          {
            swift_bridgeObjectRelease();
            a3 = v69;
            goto LABEL_42;
          }
        }
        swift_bridgeObjectRelease();
LABEL_32:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        long long aBlock = v40;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100046DF8(0, (int64_t)v40[2] + 1, 1);
          Swift::String_optional v40 = aBlock;
        }
        unint64_t v53 = (unint64_t)v40[2];
        unint64_t v52 = (unint64_t)v40[3];
        if (v53 >= v52 >> 1)
        {
          sub_100046DF8(v52 > 1, v53 + 1, 1);
          Swift::String_optional v40 = aBlock;
        }
        void v40[2] = (void *)(v53 + 1);
        uint64_t v54 = &v40[2 * v53];
        v54[4] = v42;
        v54[5] = v41;
        goto LABEL_24;
      }
      Swift::String v60 = v12;
      Swift::String_optional v40 = (void **)&_swiftEmptyArrayStorage;
LABEL_42:
      Swift::String v61 = v40[2];
      swift_release();
      if (!v61)
      {
LABEL_44:
        id v62 = [self local];
        Swift::String v63 = (void *)swift_allocObject();
        v63[2] = v12;
        v63[3] = a3;
        v63[4] = v12;
        uint64_t v75 = sub_100047230;
        uint64_t v76 = v63;
        long long aBlock = _NSConcreteStackBlock;
        uint64_t v72 = 1107296256;
        uint64_t v73 = sub_100040234;
        uint64_t v74 = &unk_10005B920;
        Swift::String v64 = _Block_copy(&aBlock);
        Swift::String v65 = v12;
        swift_retain();
        swift_release();
        [v62 loadFriendsAsPlayersWithCompletionHandler:v64];

        _Block_release(v64);
        return;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      long long aBlock = a1;
      uint64_t v72 = 0;
      LOBYTE(v73) = 5;
      os_log_type_t v24 = v12;
LABEL_14:
      uint64_t v25 = v24;
      swift_retain();
      sub_1000477B8();
      sub_100043F20();

LABEL_15:
      return;
    case 4:
    case 5:
      swift_getKeyPath();
      swift_getKeyPath();
      long long aBlock = a1;
      uint64_t v72 = 0;
      char v23 = 8;
      goto LABEL_12;
    default:
      swift_getKeyPath();
      swift_getKeyPath();
      long long aBlock = a1;
      uint64_t v72 = 0;
      char v23 = 5;
LABEL_12:
      LOBYTE(v73) = v23;
      goto LABEL_13;
  }
}

void sub_10004529C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  unint64_t v6 = a3;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t)sub_100010590(v7, (uint64_t)v6);
  swift_bridgeObjectRelease();

  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    unint64_t v11 = *(void **)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer];
    if (v11)
    {
      id v10 = v11;
    }
    else
    {
      sub_100047E68();
      NSString v12 = sub_100047E38();
      swift_bridgeObjectRelease();
      id v10 = [self playerFromPlayerID:v12];
    }
    goto LABEL_11;
  }
  if (!sub_1000482A8()) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v9 = (id)sub_100048208();
    goto LABEL_6;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v9 = *(id *)(v8 + 32);
LABEL_6:
    id v10 = v9;
    swift_bridgeObjectRelease();
LABEL_11:
    swift_getKeyPath();
    swift_getKeyPath();
    id v13 = a5;
    id v14 = v10;
    swift_retain();
    sub_1000477B8();
    sub_100043F20();

    return;
  }
  __break(1u);
}

void sub_100045444(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6 = a3;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t)sub_1000107D8(v7, v6);
  swift_bridgeObjectRelease();

  if (v8 >> 62) {
    sub_1000482A8();
  }
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = a5;
  swift_retain();
  sub_1000477B8();
  sub_100043F20();
}

uint64_t sub_100045544(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100047768();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100047738();
  swift_retain_n();
  unint64_t v8 = sub_100047758();
  os_log_type_t v9 = sub_100048008();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v18 = v4;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = a1;
    unint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v2;
    *(void *)&long long v21 = v12;
    *(_DWORD *)unint64_t v11 = 136315138;
    type metadata accessor for FriendInviteCardViewModel();
    swift_retain();
    uint64_t v13 = sub_100047E88();
    uint64_t v20 = sub_100046724(v13, v14, (uint64_t *)&v21);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s creating friend request", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v19;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  long long v21 = xmmword_10004D290;
  char v22 = 9;
  swift_retain();
  sub_1000477B8();
  sub_100043F20();
  (*(void (**)(void))(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))();
  swift_retain();
  id v15 = a1;
  sub_10001B320(v15, v15, v2);

  return swift_release();
}

void sub_100045810(uint64_t a1, uint8_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_100047768();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v37 - v11;
  uint64_t v13 = sub_100004714(&qword_100060CE0);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100047518();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 || !*(void *)&a2[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
  {
LABEL_2:
    Swift::String v38 = a2;
    sub_100047738();
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    uint64_t v20 = sub_100047758();
    os_log_type_t v21 = sub_100048008();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v41 = a3;
      v42[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      type metadata accessor for FriendInviteCardViewModel();
      swift_retain();
      uint64_t v24 = sub_100047E88();
      uint64_t v41 = sub_100046724(v24, v25, v42);
      sub_100048168();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v41 = a1;
      sub_100004714((uint64_t *)&unk_1000611C0);
      uint64_t v26 = sub_100048158();
      uint64_t v41 = sub_100046724(v26, v27, v42);
      sub_100048168();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s failed to create friend request with %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v39);
    uint64_t v28 = v38[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType];
    swift_getKeyPath();
    swift_getKeyPath();
    v42[0] = v28;
    v42[1] = 0;
    char v43 = 7;
    swift_retain();
    sub_1000477B8();
    sub_100043F20();
    return;
  }
  sub_1000147E0(1, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_100004868((uint64_t)v15, &qword_100060CE0);
    goto LABEL_2;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  id v29 = [objc_allocWithZone((Class)GKReporter) init];
  [v29 reportEvent:GKReporterDomainManualFriending type:GKFriendRequestCreated];

  sub_100047738();
  swift_retain_n();
  uint64_t v30 = sub_100047758();
  os_log_type_t v31 = sub_100048008();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v41 = a3;
    v42[0] = v33;
    Swift::String v38 = v32;
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v37 = v32 + 4;
    type metadata accessor for FriendInviteCardViewModel();
    swift_retain();
    uint64_t v34 = sub_100047E88();
    uint64_t v41 = sub_100046724(v34, v35, v42);
    sub_100048168();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s friend request created", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v39);
  uint64_t v36 = (*(uint64_t (**)(char *))(a3
                                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onMessageUrlCreated))(v19);
  sub_1000443E4(v36);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_100045E6C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__state;
  uint64_t v2 = sub_100004714((uint64_t *)&unk_100061DD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__isProcessingAction;
  uint64_t v4 = sub_100004714(&qword_100062840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_100045FC4()
{
  sub_100045E6C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10004601C()
{
  return type metadata accessor for FriendInviteCardViewModel();
}

uint64_t type metadata accessor for FriendInviteCardViewModel()
{
  uint64_t result = qword_100062648;
  if (!qword_100062648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100046070()
{
  sub_100046194(319, &qword_100062658);
  if (v0 <= 0x3F)
  {
    sub_100046194(319, (unint64_t *)&unk_100062660);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100046194(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1000477C8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void destroy for FriendInviteCardViewModel.State(uint64_t a1)
{
}

uint64_t _s26GameCenterMessageExtension25FriendInviteCardViewModelC5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100035814(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FriendInviteCardViewModel.State(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100035814(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100038920(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FriendInviteCardViewModel.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FriendInviteCardViewModel.State(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  unsigned __int8 v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100038920(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteCardViewModel.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF7 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 247);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 9) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteCardViewModel.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF6)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 247;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF7) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF7) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10004637C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 8u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 9);
  }
}

uint64_t sub_100046394(uint64_t result, unsigned int a2)
{
  if (a2 >= 9)
  {
    *(void *)__n128 result = a2 - 9;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 9;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteCardViewModel.State()
{
  return &type metadata for FriendInviteCardViewModel.State;
}

void *sub_1000463BC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000463C8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FriendInviteCardViewModel();
  uint64_t result = sub_100047778();
  *a1 = result;
  return result;
}

double sub_100046408@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

void sub_100046494(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(a1 + 8);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100035814(v1, v2, v3);
  swift_retain();
  sub_1000477B8();
  sub_100043F20();
}

uint64_t sub_100046534@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000477A8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000465B4()
{
  return sub_1000477B8();
}

uint64_t sub_100046628(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100046638(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_100046674(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100046684(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000466AC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100046724(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100048168();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100046724(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000467F8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014104((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100014104((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001FBE8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000467F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100048178();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000469B4(a5, a6);
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
  uint64_t v8 = sub_100048228();
  if (!v8)
  {
    sub_100048288();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000482E8();
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

uint64_t sub_1000469B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100046A4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100046CA8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100046CA8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100046A4C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100046BC4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000481F8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100048288();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100047EC8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000482E8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100048288();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100046BC4(uint64_t a1, uint64_t a2)
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
  sub_100004714(&qword_100062838);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100046C2C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100047F18();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_100047EE8();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100046CA8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004714(&qword_100062838);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1000482E8();
  __break(1u);
  return result;
}

uint64_t sub_100046DF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100046E38(a1, a2, a3, *v3);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_100046E18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100046FA4(a1, a2, a3, (void *)*v3);
  *char v3 = result;
  return result;
}

uint64_t sub_100046E38(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004714(&qword_1000611B0);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_1000482E8();
  __break(1u);
  return result;
}

uint64_t sub_100046FA4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004714(&qword_100062890);
  uint64_t v10 = *(void *)(sub_100047408() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100047408() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  os_log_type_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1000482E8();
  __break(1u);
  return result;
}

uint64_t sub_1000471E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100047224(void **a1, uint64_t a2)
{
  sub_1000448C0(a1, a2, *(void *)(v2 + 16), *(char **)(v2 + 24));
}

void sub_100047230(uint64_t a1, uint64_t a2)
{
  sub_100045444(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_10004723C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004724C()
{
  return swift_release();
}

uint64_t sub_100047258()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000472A0(uint64_t a1, uint64_t a2)
{
  sub_10004529C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_1000472B4(uint64_t a1)
{
  return sub_100042600(a1, v1);
}

void sub_1000472BC(uint64_t a1)
{
  sub_10004177C(a1, v1);
}

uint64_t sub_1000472C4(uint64_t a1, uint64_t a2)
{
  return sub_100041F78(a1, a2, v2);
}

uint64_t sub_1000472D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100047318(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100010B0C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004735C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100047394()
{
  return sub_100041104();
}

uint64_t sub_1000473B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000473E8()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_1000473F8()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_100047408()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100047418()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_100047428()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100047438()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100047448()
{
  return AttributeScopes.SwiftUIAttributes.font.getter();
}

uint64_t sub_100047458()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_100047468()
{
  return static AttributedString.+ infix(_:_:)();
}

uint64_t sub_100047478()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_100047488()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_100047498(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000474A8()
{
  return AttributeContainer.init()();
}

uint64_t sub_1000474B8()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_1000474C8()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_1000474D8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000474E8()
{
  return _convertNSErrorToError(_:)();
}

void sub_1000474F8(NSURL *retstr@<X8>)
{
}

uint64_t sub_100047508()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100047518()
{
  return type metadata accessor for URL();
}

uint64_t sub_100047528()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_100047538()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t sub_100047548()
{
  return Data.withUnsafeBytes<A, B>(_:)();
}

NSData sub_100047558()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100047568()
{
  return static Date.distantPast.getter();
}

uint64_t sub_100047578()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_100047588()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100047598()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000475A8()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000475B8()
{
  return UUID.init()();
}

uint64_t sub_1000475C8()
{
  return type metadata accessor for UUID();
}

NSIndexPath sub_1000475D8()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_1000475E8()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000475F8()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_100047608()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_100047618()
{
  return GKFeatureFlags.isEnabled.getter();
}

uint64_t sub_100047628()
{
  return type metadata accessor for GKFeatureFlags();
}

uint64_t sub_100047638()
{
  return + infix(_:_:)();
}

uint64_t sub_100047648()
{
  return DashboardPlayerPhotoView.init(playerInternal:onContentReady:)();
}

uint64_t sub_100047658()
{
  return type metadata accessor for DashboardPlayerPhotoView();
}

uint64_t sub_100047668()
{
  return FriendsListViewController.__allocating_init(playerId:newFriendPlayerIds:showAddFriendButton:objectGraph:)();
}

uint64_t sub_100047678()
{
  return type metadata accessor for FriendsListViewController();
}

uint64_t sub_100047688()
{
  return PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
}

uint64_t sub_100047698()
{
  return type metadata accessor for PlayerProfileViewController();
}

uint64_t sub_1000476A8()
{
  return static GCUILocalizedStrings.GAME_CENTER.getter();
}

uint64_t sub_1000476B8()
{
  return static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_UPSELL(playerName:)();
}

uint64_t sub_1000476C8()
{
  return static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SUBTITLE.getter();
}

uint64_t sub_1000476D8()
{
  return static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SENDER_SUBTITLE.getter();
}

uint64_t sub_1000476E8()
{
  return static GCUILocalizedStrings.FRIEND_INVITE_CODE_FETCH_IN_PROGRESS_ERROR.getter();
}

uint64_t sub_1000476F8()
{
  return static GCUILocalizedStrings.RETRY.getter();
}

uint64_t sub_100047708()
{
  return type metadata accessor for GCUILocalizedStrings();
}

uint64_t sub_100047718()
{
  return static GKLog.trace.getter();
}

uint64_t sub_100047728()
{
  return static GKLog.general.getter();
}

uint64_t sub_100047738()
{
  return static GKLog.friending.getter();
}

uint64_t sub_100047748()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100047758()
{
  return Logger.logObject.getter();
}

uint64_t sub_100047768()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100047778()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100047788()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100047798()
{
  return Published.projectedValue.getter();
}

uint64_t sub_1000477A8()
{
  return static Published.subscript.getter();
}

uint64_t sub_1000477B8()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000477C8()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000477D8()
{
  return Publisher.delay<A>(for:tolerance:scheduler:options:)();
}

uint64_t sub_1000477E8()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1000477F8()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100047808()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100047818()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100047828()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100047838()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100047848()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100047858()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100047868()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100047878()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100047888()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100047898()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000478A8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000478B8()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_1000478C8()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000478D8()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000478E8()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000478F8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100047908()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100047918()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100047928()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100047938()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100047948()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100047958()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100047968()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100047978()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100047988()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100047998()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_1000479A8()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000479B8()
{
  return ContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_1000479C8()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_1000479D8()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000479E8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000479F8()
{
  return dispatch thunk of UIHostingController.sizeThatFits(in:)();
}

uint64_t sub_100047A08()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100047A18()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100047A28()
{
  return BorderlessButtonStyle.init()();
}

uint64_t sub_100047A38()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t sub_100047A48()
{
  return static HierarchicalShapeStyle.quaternary.getter();
}

uint64_t sub_100047A58()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_100047A68()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100047A78()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100047A88()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_100047A98()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100047AA8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100047AB8()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100047AC8()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100047AD8()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100047AE8()
{
  return static Font.body.getter();
}

uint64_t sub_100047AF8()
{
  return Font.bold()();
}

uint64_t sub_100047B08()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100047B18()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_100047B28()
{
  return static Font.caption.getter();
}

uint64_t sub_100047B38()
{
  return static Font.caption2.getter();
}

uint64_t sub_100047B48()
{
  return static Font.footnote.getter();
}

uint64_t sub_100047B58()
{
  return static Font.headline.getter();
}

uint64_t sub_100047B68()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_100047B78()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100047B88()
{
  return Text.font(_:)();
}

uint64_t sub_100047B98()
{
  return Text.init(_:)();
}

uint64_t sub_100047BA8()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100047BB8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100047BC8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100047BD8()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100047BE8()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_100047BF8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100047C08()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_100047C18()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_100047C28()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100047C38()
{
  return static Color.red.getter();
}

uint64_t sub_100047C48()
{
  return static Color.blue.getter();
}

uint64_t sub_100047C58()
{
  return static Color.white.getter();
}

uint64_t sub_100047C68()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100047C78()
{
  return Image.init(systemName:)();
}

uint64_t sub_100047C88()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100047C98()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100047CA8()
{
  return Button.init(action:label:)();
}

uint64_t sub_100047CB8()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_100047CC8()
{
  return type metadata accessor for VStack();
}

uint64_t sub_100047CD8()
{
  return Divider.init()();
}

uint64_t sub_100047CE8()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100047CF8()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100047D08()
{
  return static Alignment.center.getter();
}

uint64_t sub_100047D18()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100047D28()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_100047D38()
{
  return TupleView.init(_:)();
}

uint64_t sub_100047D48()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100047D58()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100047D68()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100047D78()
{
  return static DispatchTime.now()();
}

uint64_t sub_100047D88()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100047D98()
{
  return + infix(_:_:)();
}

NSDictionary sub_100047DA8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100047DB8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100047DC8()
{
  return Dictionary.description.getter();
}

uint64_t sub_100047DD8()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100047DE8()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_100047DF8()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t sub_100047E08()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t sub_100047E18()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t sub_100047E28()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100047E38()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100047E48()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100047E58()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100047E68()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100047E78()
{
  return String.init(format:_:)();
}

uint64_t sub_100047E88()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100047E98()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100047EA8()
{
  return String.hash(into:)();
}

void sub_100047EB8(Swift::String a1)
{
}

Swift::Int sub_100047EC8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100047ED8()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100047EE8()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100047F08()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100047F18()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100047F28()
{
  return String.init<A>(_:)();
}

uint64_t sub_100047F38()
{
  return String.subscript.getter();
}

NSArray sub_100047F48()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100047F58()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100047F68()
{
  return Array.description.getter();
}

uint64_t sub_100047F78()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100047F88()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_100047F98()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100047FA8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100047FB8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100047FC8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100047FD8()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100047FE8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100047FF8()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100048008()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100048018()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100048028()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100048038()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100048048()
{
  return static GKDispatchGroup.namedGroup(with:line:function:)();
}

uint64_t sub_100048058()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100048068()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100048078()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_100048088()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100048098()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000480A8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000480B8()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000480C8()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_1000480D8()
{
  return NSNotificationCenter.publisher(for:object:)();
}

NSNumber sub_1000480E8(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_1000480F8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100048108()
{
  return static MSMessage.friendInviteMessage(withUrl:session:)();
}

uint64_t sub_100048118()
{
  return static MSMessage.acceptedFriendInviteMessage(withUrl:session:)();
}

uint64_t sub_100048128()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_100048138()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t sub_100048148()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t sub_100048158()
{
  return Optional.nonNilDescription.getter();
}

uint64_t sub_100048168()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100048178()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100048188()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100048198()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000481A8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1000481B8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000481C8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000481D8()
{
  return AnyHashable.init<A>(_:)();
}

void sub_1000481E8(Swift::Int a1)
{
}

uint64_t sub_1000481F8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100048208()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100048218()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100048228()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100048238()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100048248()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100048258()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100048268()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100048278()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100048288()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100048298()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000482A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000482B8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000482C8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000482D8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000482E8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100048308(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100048318()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100048328()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100048338()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_100048348()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100048358()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100048368()
{
  return Hasher.init(_seed:)();
}

void sub_100048378(Swift::UInt a1)
{
}

Swift::Int sub_100048388()
{
  return Hasher._finalize()();
}

uint64_t sub_100048398()
{
  return _typeName(_:qualified:)();
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

uint64_t GKGameCenterUIFrameworkBundle()
{
  return _GKGameCenterUIFrameworkBundle();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return __UIContentSizeCategoryIsAccessibilityContentSizeCategory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}