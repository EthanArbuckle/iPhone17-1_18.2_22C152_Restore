uint64_t sub_10000279C(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000028E4();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002844()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

uint64_t sub_100002894()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000028E4()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

ValueMetadata *type metadata accessor for GameCenterSettingsExtensionExtension()
{
  return &type metadata for GameCenterSettingsExtensionExtension;
}

uint64_t sub_100002940()
{
  uint64_t v0 = sub_100005EA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100002F50();
  sub_100002EC0();
  sub_100005EB0();
  uint64_t v4 = sub_100005E90();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002F0C(&qword_10000C028);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007430;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100005E80();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002A9C()
{
  uint64_t v0 = sub_100002F0C(&qword_10000C030);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002EC0();
  sub_100005E70();
  uint64_t v19 = sub_100005E50();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100005E70();
  uint64_t v18 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v17 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v16 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v15 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v5 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v6 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v7 = sub_100005E50();
  v4(v3, v0);
  sub_100005E70();
  uint64_t v8 = sub_100005E50();
  v4(v3, v0);
  sub_100002F0C(&qword_10000C038);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007440;
  uint64_t v10 = v18;
  *(void *)(v9 + 32) = v19;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v16;
  *(void *)(v9 + 48) = v17;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v15;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v12 = sub_100005E40();
  swift_bridgeObjectRelease();
  return v12;
}

void *sub_100002E9C()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for GameCenterAssistantIntents()
{
  return &type metadata for GameCenterAssistantIntents;
}

unint64_t sub_100002EC0()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100002F0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002F50()
{
  uint64_t v1 = sub_100005F30();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_100005CBC();
  uint64_t v3 = sub_100002F0C(&qword_10000C0F8);
  uint64_t v4 = sub_100005D28(v3);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = sub_100002F0C(&qword_10000C100);
  uint64_t v11 = sub_100005D28(v10);
  __chkstk_darwin(v11);
  sub_100005CAC();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_100005FB0();
  __chkstk_darwin(v15);
  sub_100005CAC();
  sub_100002F0C(&qword_10000C108);
  sub_100005C10();
  sub_100005FA0();
  sub_100005CD4(v14);
  v17[15] = 9;
  sub_100005DF0();
  sub_100005CD4((uint64_t)v9);
  sub_100005CD4((uint64_t)v7);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v0, enum case for InputConnectionBehavior.default(_:), v1);
  sub_1000049D4();
  return sub_100005E30();
}

uint64_t sub_100003188()
{
  sub_100002F0C(&qword_10000C148);
  uint64_t v0 = *(void *)(sub_100002F0C(&qword_10000C150) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100007440;
  unint64_t v4 = v3 + v2;
  *(unsigned char *)(v3 + v2) = 0;
  unint64_t v5 = sub_1000049D4();
  sub_100005F10();
  sub_100005C20();
  *uint64_t v6 = 1;
  sub_100005C74();
  sub_100005C20();
  *uint64_t v7 = 2;
  sub_100005BC4();
  sub_100005C20();
  *uint64_t v8 = 3;
  sub_100005C74();
  sub_100005C20();
  *uint64_t v9 = 4;
  sub_100005BC4();
  sub_100005C20();
  *uint64_t v10 = 5;
  sub_100005BC4();
  *(unsigned char *)(v4 + 6 * v1) = 6;
  sub_100005BC4();
  sub_100005C20();
  *uint64_t v11 = 7;
  sub_100005BC4();
  sub_100005C20();
  *uint64_t v12 = 8;
  sub_100005BC4();
  sub_100002F0C(&qword_10000C158);
  sub_100004F08();
  uint64_t v13 = sub_100005FD0();

  return _EnumURLRepresentation.init(_:)(v13, &type metadata for GameCenterSettingsDeepLinks, v5);
}

uint64_t sub_1000033F4()
{
  uint64_t v0 = sub_100002F0C(&qword_10000C100);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FB0();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_100005F90();
  sub_100005B00(v4, qword_10000CD60);
  sub_100005AC8(v4, (uint64_t)qword_10000CD60);
  sub_100005FA0();
  sub_1000059BC((uint64_t)v2, 1, 1, v3);
  return sub_100005F80();
}

uint64_t sub_100003528()
{
  return sub_100005140(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CD60);
}

uint64_t sub_100003560()
{
  uint64_t v1 = sub_100002F0C(&qword_10000C128);
  uint64_t v2 = sub_100005D28(v1);
  __chkstk_darwin(v2);
  sub_100005CAC();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_100002F0C(&qword_10000C100);
  uint64_t v7 = sub_100005D28(v6);
  __chkstk_darwin(v7);
  sub_100005CBC();
  uint64_t v8 = sub_100005FB0();
  uint64_t v93 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v102 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v76 - v12;
  sub_100002F0C(&qword_10000C130);
  uint64_t v14 = sub_100002F0C(&qword_10000C138);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v98 = *(void *)(v15 + 72);
  uint64_t v95 = v14 - 8;
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v85 = v17;
  *(_OWORD *)(v17 + 16) = xmmword_100007440;
  *(unsigned char *)(v17 + v16) = 0;
  unint64_t v18 = v17 + v16;
  v101 = (unsigned char *)(v17 + v16);
  sub_100005D54();
  uint64_t v82 = v19 - 11;
  sub_100005FA0();
  sub_1000059BC(v0, 1, 1, v8);
  sub_100005B78();
  uint64_t v100 = sub_100005ED0();
  uint64_t v20 = sub_100005BF4();
  sub_1000059BC(v20, v21, v22, v23);
  uint64_t v24 = sub_100002F0C(&qword_10000C140);
  uint64_t v87 = *(void *)(v9 + 72);
  uint64_t v25 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v26 = (v25 + 32) & ~v25;
  uint64_t v96 = v25 | 7;
  uint64_t v97 = v24;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007430;
  unint64_t v91 = 0xD00000000000002BLL;
  sub_100005FA0();
  unint64_t v83 = 0xD000000000000032;
  sub_100005C04();
  sub_100005FA0();
  v94 = v13;
  sub_100005EE0();
  uint64_t v27 = v98;
  uint64_t v28 = v95;
  unint64_t v81 = v18 + v98 + *(int *)(v95 + 56);
  *(unsigned char *)(v18 + v98) = 1;
  sub_100005FA0();
  unint64_t v89 = 0xD000000000000022;
  sub_100005C04();
  uint64_t v86 = v0;
  sub_100005FA0();
  uint64_t v29 = sub_100005C48();
  uint64_t v30 = v93;
  sub_1000059BC(v29, v31, v32, v93);
  sub_100005B78();
  uint64_t v33 = sub_100005BF4();
  sub_1000059BC(v33, v34, v35, v100);
  uint64_t v99 = v26;
  *(void *)&long long v92 = v26 + 2 * v87;
  uint64_t v36 = swift_allocObject();
  long long v90 = xmmword_1000074E0;
  *(_OWORD *)(v36 + 16) = xmmword_1000074E0;
  sub_100005C9C();
  unint64_t v88 = 0xD000000000000027;
  sub_100005FA0();
  sub_100005FA0();
  unint64_t v84 = 0xD00000000000002ELL;
  sub_100005C04();
  sub_100005FA0();
  uint64_t v37 = v86;
  sub_100005EE0();
  v38 = &v101[2 * v27];
  v80 = &v38[*(int *)(v28 + 56)];
  unsigned char *v38 = 2;
  sub_100005C9C();
  sub_100005FA0();
  sub_100005C04();
  sub_100005FA0();
  sub_1000059BC(v37, 0, 1, v30);
  sub_100005B78();
  uint64_t v39 = v5;
  sub_100005C2C(v5);
  *(_OWORD *)(swift_allocObject() + 16) = v90;
  sub_100005C10();
  sub_100005FA0();
  uint64_t v40 = v87;
  sub_100005C58();
  unint64_t v81 = 0xD00000000000002FLL;
  sub_100005FA0();
  sub_100005EE0();
  uint64_t v41 = v95;
  v101[3 * v98] = 3;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005FA0();
  uint64_t v42 = sub_100005C48();
  uint64_t v43 = v93;
  sub_1000059BC(v42, v44, v45, v93);
  uint64_t v77 = v39;
  sub_100005B78();
  sub_100005C2C(v39);
  *(void *)&long long v90 = 3 * v40;
  v80 = (unsigned char *)(v99 + 3 * v40);
  uint64_t v46 = swift_allocObject();
  long long v92 = xmmword_1000074F0;
  *(_OWORD *)(v46 + 16) = xmmword_1000074F0;
  sub_100005C10();
  sub_100005FA0();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005D54();
  uint64_t v79 = v47 + 7;
  sub_100005C04();
  sub_100005FA0();
  uint64_t v48 = v86;
  uint64_t v49 = v77;
  sub_100005EE0();
  v50 = &v101[4 * v98];
  v78 = &v50[*(int *)(v41 + 56)];
  unsigned char *v50 = 4;
  sub_100005FA0();
  sub_100005C10();
  sub_100005FA0();
  sub_1000059BC(v48, 0, 1, v43);
  sub_100005B78();
  uint64_t v51 = v49;
  sub_1000059BC(v49, 0, 1, v100);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007500;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005BA4();
  sub_100005D14();
  sub_100005FA0();
  sub_100005EE0();
  uint64_t v52 = v98;
  v53 = v101;
  v54 = &v101[5 * v98];
  uint64_t v55 = v95;
  unint64_t v88 = (unint64_t)&v54[*(int *)(v95 + 56)];
  unsigned char *v54 = 5;
  unint64_t v89 = 0xD000000000000026;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005FA0();
  uint64_t v56 = sub_100005BF4();
  sub_1000059BC(v56, v57, v58, v43);
  sub_100005B78();
  sub_100005D34();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007510;
  sub_100005C04();
  sub_100005FA0();
  sub_100005C58();
  sub_100005C58();
  sub_100005C58();
  sub_100005C04();
  sub_100005FA0();
  sub_100005EE0();
  v59 = &v53[6 * v52];
  *(void *)&long long v90 = &v59[*(int *)(v55 + 56)];
  unsigned char *v59 = 6;
  sub_100005FA0();
  sub_100005FA0();
  uint64_t v60 = sub_100005BF4();
  uint64_t v61 = v93;
  sub_1000059BC(v60, v62, v63, v93);
  sub_100005B78();
  sub_100005C2C(v51);
  *(_OWORD *)(swift_allocObject() + 16) = v92;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005FA0();
  sub_100005FA0();
  sub_100005C04();
  sub_100005FA0();
  sub_100005EE0();
  v64 = &v101[7 * v98];
  unint64_t v91 = (unint64_t)&v64[*(int *)(v95 + 56)];
  unsigned char *v64 = 7;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005FA0();
  uint64_t v65 = sub_100005BF4();
  sub_1000059BC(v65, v66, v67, v61);
  sub_100005B78();
  uint64_t v68 = sub_100005C48();
  sub_1000059BC(v68, v69, v70, v100);
  *(_OWORD *)(swift_allocObject() + 16) = v92;
  sub_100005BE4();
  sub_100005FA0();
  sub_100005FA0();
  sub_100005FA0();
  sub_100005D54();
  sub_100005D14();
  sub_100005FA0();
  sub_100005CF0();
  v71 = &v101[8 * v98];
  v101 = &v71[*(int *)(v95 + 56)];
  unsigned char *v71 = 8;
  sub_100005C9C();
  sub_100005FA0();
  sub_100005FA0();
  uint64_t v72 = sub_100005BF4();
  sub_1000059BC(v72, v73, v74, v93);
  sub_100005B78();
  sub_100005D34();
  *(_OWORD *)(swift_allocObject() + 16) = v92;
  sub_100005FA0();
  sub_100005FA0();
  sub_100005FA0();
  sub_100005D54();
  sub_100005FA0();
  sub_100005CF0();
  sub_100005EF0();
  sub_100004F08();
  return sub_100005FD0();
}

uint64_t sub_10000427C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000086B8;
  v6._object = a2;
  unint64_t v4 = sub_100005FF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

_UNKNOWN **sub_1000042C8()
{
  return &off_100008688;
}

uint64_t sub_1000042D4(char a1)
{
  uint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E496E676973;
      break;
    case 2:
      uint64_t result = 0x74754F6E676973;
      break;
    case 3:
      unsigned int v3 = 2003134838;
      goto LABEL_6;
    case 4:
      unsigned int v3 = 1953064037;
LABEL_6:
      uint64_t result = v3 | 0x666F725000000000;
      break;
    case 5:
      uint64_t result = 0x7974697669746361;
      break;
    case 6:
      uint64_t result = 0x6E656972466C6C61;
      break;
    case 7:
      uint64_t result = 0x6552646E65697266;
      break;
    case 8:
      uint64_t result = 0x7246657469766E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000440C(unsigned __int8 *a1, char *a2)
{
  return sub_100004468(*a1, *a2);
}

unint64_t sub_10000441C()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100004468(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6E496E676973;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x74754F6E676973;
      break;
    case 3:
      unsigned int v6 = 2003134838;
      goto LABEL_6;
    case 4:
      unsigned int v6 = 1953064037;
LABEL_6:
      uint64_t v5 = v6 | 0x666F725000000000;
      unint64_t v3 = 0xEB00000000656C69;
      break;
    case 5:
      uint64_t v5 = 0x7974697669746361;
      unint64_t v3 = 0xEF676E6972616853;
      break;
    case 6:
      uint64_t v5 = 0x6E656972466C6C61;
      unint64_t v3 = 0xEA00000000007364;
      break;
    case 7:
      uint64_t v5 = 0x6552646E65697266;
      unint64_t v3 = 0xEE00737473657571;
      break;
    case 8:
      uint64_t v5 = 0x7246657469766E69;
      unint64_t v3 = 0xED000073646E6569;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v2 = 0x6E496E676973;
      break;
    case 2:
      unint64_t v7 = 0xE700000000000000;
      uint64_t v2 = 0x74754F6E676973;
      break;
    case 3:
      unsigned int v8 = 2003134838;
      goto LABEL_16;
    case 4:
      unsigned int v8 = 1953064037;
LABEL_16:
      uint64_t v2 = v8 | 0x666F725000000000;
      unint64_t v7 = 0xEB00000000656C69;
      break;
    case 5:
      uint64_t v2 = 0x7974697669746361;
      unint64_t v7 = 0xEF676E6972616853;
      break;
    case 6:
      uint64_t v2 = 0x6E656972466C6C61;
      unint64_t v7 = 0xEA00000000007364;
      break;
    case 7:
      uint64_t v2 = 0x6552646E65697266;
      unint64_t v7 = 0xEE00737473657571;
      break;
    case 8:
      uint64_t v2 = 0x7246657469766E69;
      unint64_t v7 = 0xED000073646E6569;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_100006000();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

Swift::Int sub_10000472C()
{
  return sub_100004734(*v0);
}

Swift::Int sub_100004734(char a1)
{
  return sub_100006020();
}

uint64_t sub_100004798()
{
  return sub_1000047A0();
}

uint64_t sub_1000047A0()
{
  sub_100005FE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000490C(uint64_t a1)
{
  return sub_100004914(a1, *v1);
}

Swift::Int sub_100004914(uint64_t a1, char a2)
{
  return sub_100006020();
}

uint64_t sub_100004974@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000427C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000049A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000042D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000049D4()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100004A24()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100004A78()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100004AC8()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100004B18()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

void *sub_100004B64()
{
  return &protocol witness table for String;
}

uint64_t sub_100004B70()
{
  sub_100005A7C();
  uint64_t v2 = sub_100005F00();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005B64(v3, v0, v2, v1);
}

unint64_t sub_100004C08()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100004C58()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100004CA8()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100004CF8()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100004D48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005140(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CD60);
  uint64_t v3 = sub_100005F90();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100004DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000054B8(a1, a2, a3, (void (*)(void))sub_1000049D4);
}

uint64_t sub_100004E18(uint64_t a1)
{
  unint64_t v2 = sub_1000049D4();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004E68()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_100004EB8()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_100004F08()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100004F58(uint64_t a1)
{
  unint64_t v2 = sub_100004CF8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004FA8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    sub_100004FFC(&qword_10000C0C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_100004FFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005044(void *a1@<X8>)
{
  *a1 = &off_100008688;
}

unint64_t sub_100005058()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_1000050A4()
{
  uint64_t v0 = sub_100005FB0();
  sub_100005B00(v0, qword_10000CD78);
  sub_100005AC8(v0, (uint64_t)qword_10000CD78);
  return sub_100005FA0();
}

uint64_t sub_100005108()
{
  return sub_100005140(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD78);
}

uint64_t sub_100005140(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_100005AC8(v5, a3);
}

uint64_t *sub_10000519C()
{
  return &qword_10000C040;
}

uint64_t sub_1000051A8()
{
  sub_100005E10();
  return v1;
}

uint64_t sub_1000051DC()
{
  return sub_100005E20();
}

uint64_t sub_100005210@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000051A8();
  *a1 = result;
  return result;
}

uint64_t sub_10000523C()
{
  return sub_1000051DC();
}

void (*sub_100005248(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100005E00();
  return sub_1000052A4;
}

void sub_1000052A4(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000052F8()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_100005344(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000059E4();
  unint64_t v5 = sub_100005A7C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000053B0()
{
  uint64_t v0 = qword_10000C040;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000053F0()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100005440()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_10000548C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000054B8(a1, a2, a3, (void (*)(void))sub_100002EC0);
}

uint64_t sub_1000054B8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005140(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD78);
  uint64_t v3 = sub_100005FB0();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_1000055A4()
{
  return 0;
}

uint64_t sub_1000055B0()
{
  return 1;
}

uint64_t sub_1000055C0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000059E4();
  unint64_t v7 = sub_100005A30();
  unint64_t v8 = sub_100005A7C();
  *unint64_t v5 = v2;
  v5[1] = sub_100005694;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005694()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_10000579C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100002F50();
  *a1 = result;
  return result;
}

uint64_t sub_1000057C4(uint64_t a1)
{
  unint64_t v2 = sub_100002EC0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenGameCenterSettingsDeepLinks()
{
  return &type metadata for OpenGameCenterSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for GameCenterSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameCenterSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for GameCenterSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100005974);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_10000599C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000059A4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GameCenterSettingsDeepLinks()
{
  return &type metadata for GameCenterSettingsDeepLinks;
}

uint64_t sub_1000059BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_1000059E4()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100005A30()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100005A7C()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100005AC8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005B00(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005B64(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005B78()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)(0x746E6563656D6167, 0xEA00000000007265, 2);
}

uint64_t sub_100005BA4()
{
  return sub_100005FA0();
}

uint64_t sub_100005BC4()
{
  return sub_100005F10();
}

uint64_t sub_100005BF4()
{
  return v0;
}

uint64_t sub_100005C2C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 - 112);
  return sub_1000059BC(a1, 0, 1, v3);
}

uint64_t sub_100005C48()
{
  return v0;
}

uint64_t sub_100005C58()
{
  return sub_100005FA0();
}

uint64_t sub_100005C74()
{
  return sub_100005F10();
}

uint64_t sub_100005CD4(uint64_t a1)
{
  return sub_1000059BC(a1, 1, 1, v1);
}

uint64_t sub_100005CF0()
{
  return sub_100005EE0();
}

uint64_t sub_100005D28(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100005D34()
{
  return sub_1000059BC(v0, 0, 1, v1);
}

uint64_t sub_100005D60()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100005D70()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100005D80()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100005DA0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100005DB0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005DC0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005DF0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100005E00()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100005E10()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100005E20()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100005E30()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100005E40()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100005E50()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100005E60()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_100005E70()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100005E80()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100005E90()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100005EA0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100005EB0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100005ED0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100005EE0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100005EF0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100005F00()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100005F10()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100005F30()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100005F70()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100005F80()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100005F90()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100005FA0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100005FB0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100005FC0()
{
  return static AppExtension.main()();
}

uint64_t sub_100005FD0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100005FE0()
{
  return String.hash(into:)();
}

Swift::Int sub_100005FF0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006000()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006010()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006020()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}