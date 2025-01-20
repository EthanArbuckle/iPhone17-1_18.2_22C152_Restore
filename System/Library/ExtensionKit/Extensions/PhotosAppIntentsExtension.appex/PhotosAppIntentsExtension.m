uint64_t sub_100003370()
{
  uint64_t v0;
  unsigned char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned char v9[16];

  sub_10000362C(&qword_100010010);
  __chkstk_darwin();
  v1 = &v9[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = sub_100009FF0();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000A030();
  __chkstk_darwin();
  sub_10000A060();
  __chkstk_darwin();
  v6 = sub_10000A000();
  v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  sub_10000A050();
  sub_10000A020();
  (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000A010();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v1, 1, 1, v6);
  return sub_100009FE0();
}

uint64_t sub_10000362C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003670()
{
  sub_10000362C(&qword_100010140);
  ((void (*)(void))__chkstk_darwin)();
  v103 = (char *)&v87 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000362C(&qword_100010010);
  ((void (*)(void))__chkstk_darwin)();
  v113 = (char *)&v87 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009FF0();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A030();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000A060();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v112 = sub_10000A000();
  uint64_t v114 = *(void *)(v112 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v111 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v99 = (char *)&v87 - v8;
  sub_10000362C(&qword_100010148);
  uint64_t v9 = sub_10000362C(&qword_100010150);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v102 = *(void *)(v10 + 72);
  uint64_t v11 = v9 - 8;
  v108 = (unsigned char *)(v9 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  uint64_t v90 = v13;
  *(_OWORD *)(v13 + 16) = xmmword_10000A230;
  unint64_t v104 = v13 + v12;
  unint64_t v101 = v13 + v12 + *(int *)(v11 + 56);
  *(unsigned char *)(v13 + v12) = 0;
  sub_10000A050();
  sub_10000A020();
  uint64_t v14 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v15(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v16 = v14;
  uint64_t v91 = v2;
  v15(v5, v14, v2);
  uint64_t v17 = v3 + 104;
  v18 = v113;
  sub_10000A010();
  v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v114 + 56);
  v114 += 56;
  v109 = v19;
  v19(v18, 0, 1, v112);
  unint64_t v106 = 0x800000010000B070;
  v20 = v103;
  sub_100009EE0();
  uint64_t v105 = sub_100009EF0();
  uint64_t v21 = *(void *)(v105 - 8);
  v107 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
  uint64_t v110 = v21 + 56;
  v107(v20, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  uint64_t v22 = v17;
  v15(v5, v16, v2);
  sub_10000A010();
  v23 = v113;
  sub_100009F00();
  unint64_t v97 = v104 + v102 + *((int *)v108 + 14);
  *(unsigned char *)(v104 + v102) = 1;
  unint64_t v95 = 0xD000000000000023;
  sub_10000A050();
  sub_10000A020();
  uint64_t v24 = v91;
  v15(v5, v16, v91);
  sub_10000A010();
  unint64_t v100 = 0x800000010000B0E0;
  unint64_t v101 = 0xD000000000000018;
  sub_10000A050();
  sub_10000A020();
  v15(v5, v16, v24);
  v98 = v15;
  sub_10000A010();
  v109(v23, 0, 1, v112);
  v25 = v103;
  sub_100009EE0();
  v107(v25, 0, 1, v105);
  uint64_t v94 = 0xD000000000000029;
  sub_10000A050();
  sub_10000A020();
  v15(v5, v16, v24);
  sub_10000A010();
  v26 = v113;
  sub_100009F00();
  uint64_t v93 = 2 * v102;
  v27 = (unsigned char *)(v104 + 2 * v102);
  unint64_t v89 = (unint64_t)&v27[*((int *)v108 + 14)];
  unsigned char *v27 = 2;
  unint64_t v97 = 0xD000000000000024;
  sub_10000A050();
  sub_10000A020();
  uint64_t v28 = v16;
  v29 = v98;
  v98(v5, v28, v24);
  uint64_t v30 = v22;
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  unsigned int v96 = v28;
  v29(v5, v28, v24);
  v31 = v29;
  sub_10000A010();
  v109(v26, 0, 1, v112);
  v32 = v103;
  sub_100009EE0();
  v107(v32, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v29(v5, v28, v24);
  sub_10000A010();
  sub_100009F00();
  v33 = (unsigned char *)(v104 + v93 + v102);
  uint64_t v93 = (uint64_t)&v33[*((int *)v108 + 14)];
  unsigned char *v33 = 3;
  sub_10000A050();
  sub_10000A020();
  uint64_t v34 = v96;
  v29(v5, v96, v24);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v35 = v24;
  uint64_t v36 = v30;
  v31(v5, v34, v24);
  v37 = v113;
  sub_10000A010();
  v109(v37, 0, 1, v112);
  v38 = v103;
  sub_100009EE0();
  v107(v38, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v31(v5, v34, v24);
  uint64_t v39 = v36;
  sub_10000A010();
  sub_100009F00();
  uint64_t v94 = 4 * v102;
  v40 = (unsigned char *)(v104 + 4 * v102);
  uint64_t v93 = (uint64_t)&v40[*((int *)v108 + 14)];
  unsigned char *v40 = 4;
  sub_10000A050();
  sub_10000A020();
  uint64_t v41 = v96;
  v42 = v31;
  v31(v5, v96, v35);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v43 = v41;
  v42(v5, v41, v35);
  uint64_t v44 = v39;
  v45 = v113;
  sub_10000A010();
  v109(v45, 0, 1, v112);
  v46 = v103;
  sub_100009EE0();
  v107(v46, 0, 1, v105);
  unint64_t v89 = 0xD00000000000002BLL;
  sub_10000A050();
  sub_10000A020();
  v42(v5, v43, v35);
  uint64_t v47 = v44;
  sub_10000A010();
  sub_100009F00();
  v48 = (unsigned char *)(v104 + v94 + v102);
  v88 = &v48[*((int *)v108 + 14)];
  unsigned char *v48 = 5;
  uint64_t v94 = 0xD000000000000027;
  sub_10000A050();
  sub_10000A020();
  v49 = v98;
  v98(v5, v43, v35);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v50 = v35;
  v49(v5, v43, v35);
  v51 = v49;
  v52 = v113;
  sub_10000A010();
  v109(v52, 0, 1, v112);
  v53 = v103;
  sub_100009EE0();
  v107(v53, 0, 1, v105);
  uint64_t v93 = 0xD00000000000002DLL;
  sub_10000A050();
  sub_10000A020();
  v51(v5, v43, v50);
  sub_10000A010();
  sub_100009F00();
  v54 = (unsigned char *)(v104 + 6 * v102);
  v88 = &v54[*((int *)v108 + 14)];
  unsigned char *v54 = 6;
  sub_10000A050();
  sub_10000A020();
  uint64_t v55 = v47;
  v56 = v98;
  v98(v5, v43, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v57 = v43;
  v56(v5, v43, v50);
  v58 = v113;
  sub_10000A010();
  v109(v58, 0, 1, v112);
  v59 = v103;
  sub_100009EE0();
  v107(v59, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v56(v5, v57, v50);
  sub_10000A010();
  sub_100009F00();
  uint64_t v93 = 8 * v102;
  v60 = (unsigned char *)(v104 + 7 * v102);
  v88 = &v60[*((int *)v108 + 14)];
  unsigned char *v60 = 7;
  uint64_t v94 = 0xD00000000000001ELL;
  sub_10000A050();
  sub_10000A020();
  uint64_t v61 = v57;
  v62 = v98;
  v98(v5, v57, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  v62(v5, v57, v50);
  uint64_t v92 = v55;
  v63 = v113;
  sub_10000A010();
  v109(v63, 0, 1, v112);
  v64 = v103;
  sub_100009EE0();
  v107(v64, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v65 = v98;
  v98(v5, v57, v50);
  sub_10000A010();
  sub_100009F00();
  v88 = (unsigned char *)(v104 + v93 + *((int *)v108 + 14));
  *(unsigned char *)(v104 + v93) = 8;
  sub_10000A050();
  sub_10000A020();
  v65(v5, v57, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  v65(v5, v57, v50);
  v66 = v113;
  sub_10000A010();
  v109(v66, 0, 1, v112);
  v67 = v103;
  sub_100009EE0();
  v107(v67, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v65(v5, v61, v50);
  sub_10000A010();
  sub_100009F00();
  v68 = (unsigned char *)(v104 + v93 + v102);
  uint64_t v93 = (uint64_t)&v68[*((int *)v108 + 14)];
  unsigned char *v68 = 9;
  sub_10000A050();
  sub_10000A020();
  uint64_t v69 = v61;
  v70 = v98;
  v98(v5, v61, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v71 = v50;
  v70(v5, v61, v50);
  v72 = v113;
  sub_10000A010();
  v109(v72, 0, 1, v112);
  v73 = v103;
  sub_100009EE0();
  v107(v73, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v70(v5, v69, v50);
  sub_10000A010();
  v74 = v73;
  sub_100009F00();
  v75 = (unsigned char *)(v104 + 10 * v102);
  uint64_t v93 = (uint64_t)&v75[*((int *)v108 + 14)];
  unsigned char *v75 = 10;
  sub_10000A050();
  sub_10000A020();
  uint64_t v76 = v96;
  v70(v5, v96, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  v70(v5, v76, v50);
  v77 = v113;
  sub_10000A010();
  v109(v77, 0, 1, v112);
  sub_100009EE0();
  v107(v74, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v70(v5, v76, v50);
  sub_10000A010();
  sub_100009F00();
  v78 = (unsigned char *)(v104 + 11 * v102);
  uint64_t v93 = (uint64_t)&v78[*((int *)v108 + 14)];
  unsigned char *v78 = 11;
  sub_10000A050();
  sub_10000A020();
  v70(v5, v76, v50);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  uint64_t v79 = v76;
  v70(v5, v76, v71);
  v80 = v113;
  sub_10000A010();
  v109(v80, 0, 1, v112);
  v81 = v103;
  sub_100009EE0();
  v107(v81, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v82 = v98;
  v98(v5, v79, v71);
  sub_10000A010();
  sub_100009F00();
  v83 = (unsigned char *)(v104 + 12 * v102);
  v108 = &v83[*((int *)v108 + 14)];
  unsigned char *v83 = 12;
  sub_10000A050();
  sub_10000A020();
  uint64_t v84 = v91;
  v82(v5, v79, v91);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  v82(v5, v79, v84);
  sub_10000A010();
  v109(v80, 0, 1, v112);
  v85 = v103;
  sub_100009EE0();
  v107(v85, 0, 1, v105);
  sub_10000A050();
  sub_10000A020();
  v82(v5, v79, v84);
  sub_10000A010();
  sub_100009F00();
  unint64_t result = sub_10000568C(v90);
  qword_100010DE0 = result;
  return result;
}

unint64_t sub_10000568C(uint64_t a1)
{
  uint64_t v2 = sub_10000362C(&qword_100010150);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000362C(&qword_100010158);
  uint64_t v6 = sub_10000A090();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100008FD4(v12, (uint64_t)v5, &qword_100010150);
    char v14 = *v5;
    unint64_t result = sub_10000802C(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100009F10();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_100005884(uint64_t a1)
{
  uint64_t v2 = sub_10000362C(&qword_100010128);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000362C(&qword_100010130);
  uint64_t v6 = sub_10000A090();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100008FD4(v12, (uint64_t)v5, &qword_100010128);
    char v14 = *v5;
    unint64_t result = sub_10000802C(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10000362C(&qword_100010138);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t *sub_100005A84()
{
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  return &qword_100010DE0;
}

uint64_t sub_100005AD0()
{
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_100005B48(uint64_t a1)
{
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_100010DE0 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_100005BC8())()
{
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_100005C50()
{
  uint64_t v0 = sub_10000362C(&qword_100010020);
  sub_100008F70(v0, qword_100010DE8);
  sub_100006204(v0, (uint64_t)qword_100010DE8);
  sub_10000362C(&qword_100010120);
  uint64_t v1 = *(void *)(sub_10000362C(&qword_100010128) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000A230;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100006148();
  sub_100009F20();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100009F20();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100009F20();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_100009F20();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_100009F20();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_100009F20();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_100009F20();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_100009F20();
  *(unsigned char *)(v5 + 8 * v2) = 8;
  sub_100009F20();
  *(unsigned char *)(v5 + 9 * v2) = 9;
  sub_100009F20();
  *(unsigned char *)(v5 + 10 * v2) = 10;
  sub_100009F20();
  *(unsigned char *)(v5 + 11 * v2) = 11;
  sub_100009F20();
  *(unsigned char *)(v5 + 12 * v2) = 12;
  sub_100009F20();
  sub_100005884(v4);
  return sub_100009F30();
}

unint64_t sub_10000604C()
{
  return 0xD000000000000047;
}

uint64_t sub_100006068()
{
  return 0;
}

uint64_t sub_100006070(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    v5._countAndFlagsBits = 47;
  }
  else {
    v5._countAndFlagsBits = 35;
  }
  v5._object = (void *)0xE100000000000000;
  sub_10000A080(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  sub_10000A080(v8);
  swift_bridgeObjectRelease();
  sub_100006148();

  return sub_100009F20();
}

unint64_t sub_100006148()
{
  unint64_t result = qword_100010018;
  if (!qword_100010018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010018);
  }
  return result;
}

uint64_t sub_10000619C()
{
  if (qword_1000101A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000362C(&qword_100010020);

  return sub_100006204(v0, (uint64_t)qword_100010DE8);
}

uint64_t sub_100006204(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000623C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000101A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000362C(&qword_100010020);
  uint64_t v3 = sub_100006204(v2, (uint64_t)qword_100010DE8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100006300(uint64_t a1)
{
  if (qword_1000101A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000362C(&qword_100010020);
  uint64_t v3 = sub_100006204(v2, (uint64_t)qword_100010DE8);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_1000063FC())()
{
  if (qword_1000101A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000362C(&qword_100010020);
  sub_100006204(v0, (uint64_t)qword_100010DE8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

_UNKNOWN **sub_100006498()
{
  return &off_10000C858;
}

unint64_t sub_1000064A4(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x79616C506F747561;
      break;
    case 8:
      unint64_t result = 0x6374697753726468;
      break;
    case 9:
      unint64_t result = 0x736569726F6D656DLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000015;
      break;
    case 11:
      unint64_t result = 0x726566736E617274;
      break;
    case 12:
      unint64_t result = 0x79636176697270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100006638(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1000064A4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000064A4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10000A0B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_1000066C4()
{
  char v1 = *v0;
  sub_10000A0C0();
  sub_1000064A4(v1);
  sub_10000A070();
  swift_bridgeObjectRelease();
  return sub_10000A0D0();
}

uint64_t sub_100006728()
{
  sub_1000064A4(*v0);
  sub_10000A070();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000677C()
{
  char v1 = *v0;
  sub_10000A0C0();
  sub_1000064A4(v1);
  sub_10000A070();
  swift_bridgeObjectRelease();
  return sub_10000A0D0();
}

uint64_t sub_1000067DC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000084F8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000680C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000064A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006838()
{
  sub_100008F08();
  uint64_t v2 = sub_100009ED0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008F5C(v3, v0, v2, v1);
}

uint64_t sub_1000068D4(uint64_t a1)
{
  unint64_t v2 = sub_100006148();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100006920(uint64_t a1)
{
  unint64_t v2 = sub_10000886C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_10000696C(void *a1@<X8>)
{
  *a1 = &off_10000C858;
}

uint64_t sub_10000697C()
{
  uint64_t v0 = sub_100009FF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A030();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000A060();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10000A000();
  sub_100008F70(v6, qword_100010E00);
  sub_100006204(v6, (uint64_t)qword_100010E00);
  sub_10000A050();
  sub_10000A020();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10000A010();
}

uint64_t sub_100006B68()
{
  return sub_100006FC8(&qword_1000101B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010E00);
}

uint64_t sub_100006BA0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000705C(&qword_1000101B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010E00, a1);
}

uint64_t sub_100006BD8(uint64_t a1)
{
  return sub_100007144(a1, &qword_1000101B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010E00);
}

uint64_t (*sub_100006C10())()
{
  if (qword_1000101B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000A000();
  sub_100006204(v0, (uint64_t)qword_100010E00);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_100006CA4()
{
  uint64_t v0 = sub_10000362C(&qword_100010010);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_100009FF0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000A030();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000A060();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000A000();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100009EB0();
  sub_100008F70(v10, qword_100010E18);
  sub_100006204(v10, (uint64_t)qword_100010E18);
  sub_10000A050();
  sub_10000A020();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10000A010();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100009EC0();
}

uint64_t sub_100006F90()
{
  return sub_100006FC8(qword_1000101B8, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_100010E18);
}

uint64_t sub_100006FC8(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_100006204(v5, a3);
}

uint64_t sub_100007024@<X0>(uint64_t a1@<X8>)
{
  return sub_10000705C(qword_1000101B8, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_100010E18, a1);
}

uint64_t sub_10000705C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006204(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_10000710C(uint64_t a1)
{
  return sub_100007144(a1, qword_1000101B8, (uint64_t (*)(void))&type metadata accessor for IntentDescription, (uint64_t)qword_100010E18);
}

uint64_t sub_100007144(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v7 = a3(0);
  uint64_t v8 = sub_100006204(v7, a4);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*sub_100007230())()
{
  if (qword_1000101B8[0] != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009EB0();
  sub_100006204(v0, (uint64_t)qword_100010E18);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1000072C8()
{
  uint64_t v0 = sub_10000362C(&qword_100010028);
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_10000362C(&qword_100010030);
  __chkstk_darwin(v1);
  sub_100008544();
  sub_100009F70();
  v3._object = (void *)0x800000010000AA60;
  v3._countAndFlagsBits = 0xD00000000000002FLL;
  sub_100009F60(v3);
  swift_getKeyPath();
  sub_10000362C(&qword_100010040);
  sub_100009F50();
  swift_release();
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_100009F60(v4);
  sub_100009F80();
  return sub_100009F40();
}

uint64_t sub_100007468()
{
  return sub_100009D80();
}

uint64_t sub_10000748C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009D80();
  *a1 = result;
  return result;
}

void *sub_1000074B8()
{
  return &unk_10000A240;
}

uint64_t sub_1000074C4()
{
  sub_100009D60();
  return v1;
}

uint64_t sub_1000074F8()
{
  return sub_100009D70();
}

uint64_t (*sub_10000752C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009D50();
  return sub_100007588;
}

uint64_t *sub_100007590()
{
  return &qword_100010000;
}

uint64_t sub_10000759C()
{
  swift_beginAccess();
  uint64_t v0 = qword_100010000;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000075F0(uint64_t a1, char *a2)
{
  qword_100010000 = a1;
  off_100010008 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000764C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000076A4()
{
  uint64_t v0 = sub_100009FB0();
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  __chkstk_darwin(v0);
  v26 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000362C(&qword_100010048);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v25 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v24 = (char *)&v22 - v5;
  uint64_t v6 = sub_10000362C(&qword_100010010);
  __chkstk_darwin(v6 - 8);
  v23 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009FF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000A030();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10000A060();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10000A000();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v22 = sub_10000362C(&qword_100010050);
  sub_10000A050();
  sub_10000A020();
  uint64_t v16 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v17(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
  sub_10000A010();
  sub_10000A050();
  sub_10000A020();
  v17(v11, v16, v8);
  uint64_t v18 = v23;
  sub_10000A010();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
  char v29 = 13;
  uint64_t v19 = sub_100009D40();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v24, 1, 1, v19);
  v20(v25, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, enum case for InputConnectionBehavior.default(_:), v28);
  sub_100006148();
  return sub_100009D90();
}

uint64_t sub_100007B98@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009D60();
  *a1 = v3;
  return result;
}

uint64_t sub_100007BD4()
{
  return sub_100009D70();
}

uint64_t (*sub_100007C0C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009D50();
  return sub_100007588;
}

void sub_100007C68(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100007CB4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008E60();
  unint64_t v5 = sub_100008F08();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100007D24@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000101B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000A000();
  uint64_t v3 = sub_100006204(v2, (uint64_t)qword_100010E00);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100007DF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100008E60();
  unint64_t v6 = sub_100008EB4();
  unint64_t v7 = sub_100008F08();
  *unint64_t v4 = v2;
  v4[1] = sub_100007EC0;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007EC0()
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

uint64_t sub_100007FC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000076A4();
  *a1 = result;
  return result;
}

uint64_t sub_100007FF0(uint64_t a1)
{
  unint64_t v2 = sub_100008544();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000802C(char a1)
{
  sub_10000A0C0();
  sub_1000064A4(a1);
  sub_10000A070();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10000A0D0();

  return sub_1000080B4(a1, v2);
}

unint64_t sub_1000080B4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      unint64_t v8 = 1953460082;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v9 = "com.apple.Preferences";
          goto LABEL_7;
        case 2:
          uint64_t v9 = "iCloudPhotosSwitch";
          goto LABEL_7;
        case 3:
          uint64_t v9 = "sharedLibraryGroup";
LABEL_7:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v8 = 0xD000000000000012;
          break;
        case 4:
          unint64_t v8 = 0xD000000000000014;
          unint64_t v7 = 0x800000010000A940;
          break;
        case 5:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x800000010000A960;
          break;
        case 6:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x800000010000A980;
          break;
        case 7:
          unint64_t v8 = 0x79616C506F747561;
          unint64_t v7 = 0xEE00686374697753;
          break;
        case 8:
          unint64_t v8 = 0x6374697753726468;
          unint64_t v7 = 0xE900000000000068;
          break;
        case 9:
          unint64_t v8 = 0x736569726F6D656DLL;
          goto LABEL_16;
        case 0xA:
          unint64_t v8 = 0xD000000000000015;
          unint64_t v7 = 0x800000010000A9C0;
          break;
        case 0xB:
          unint64_t v8 = 0x726566736E617274;
LABEL_16:
          unint64_t v7 = 0xED000070756F7247;
          break;
        case 0xC:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x79636176697270;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xE400000000000000;
      switch(v6)
      {
        case 1:
          uint64_t v12 = "com.apple.Preferences";
          goto LABEL_27;
        case 2:
          uint64_t v12 = "iCloudPhotosSwitch";
          goto LABEL_27;
        case 3:
          uint64_t v12 = "sharedLibraryGroup";
LABEL_27:
          unint64_t v10 = (unint64_t)v12 | 0x8000000000000000;
          if (v8 != 0xD000000000000012) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 4:
          unint64_t v13 = 0xD000000000000014;
          uint64_t v14 = "sharedAlbumsSwitch";
          goto LABEL_32;
        case 5:
          unint64_t v13 = 0xD000000000000011;
          uint64_t v14 = "contentPrivacySwitch";
          goto LABEL_32;
        case 6:
          unint64_t v13 = 0xD000000000000011;
          uint64_t v14 = "hiddenAlbumSwitch";
LABEL_32:
          unint64_t v10 = (unint64_t)v14 | 0x8000000000000000;
          if (v8 != v13) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 7:
          unint64_t v10 = 0xEE00686374697753;
          if (v8 != 0x79616C506F747561) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 8:
          unint64_t v10 = 0xE900000000000068;
          if (v8 != 0x6374697753726468) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 9:
          unint64_t v10 = 0xED000070756F7247;
          if (v8 != 0x736569726F6D656DLL) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 10:
          unint64_t v10 = 0x800000010000A9C0;
          if (v8 != 0xD000000000000015) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 11:
          unint64_t v10 = 0xED000070756F7247;
          if (v8 != 0x726566736E617274) {
            goto LABEL_21;
          }
          goto LABEL_20;
        case 12:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x79636176697270) {
            goto LABEL_21;
          }
          goto LABEL_20;
        default:
          if (v8 != 1953460082) {
            goto LABEL_21;
          }
LABEL_20:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_21:
          char v11 = sub_10000A0B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_1000084F8(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C700;
  v6._object = a2;
  unint64_t v4 = sub_10000A0A0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xD) {
    return 13;
  }
  else {
    return v4;
  }
}

unint64_t sub_100008544()
{
  unint64_t result = qword_100010038;
  if (!qword_100010038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010038);
  }
  return result;
}

unint64_t sub_10000859C()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

unint64_t sub_1000085F8()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

unint64_t sub_100008650()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

unint64_t sub_1000086A8()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

unint64_t sub_100008700()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

void *sub_100008754()
{
  return &protocol witness table for String;
}

unint64_t sub_100008764()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

unint64_t sub_1000087BC()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

unint64_t sub_100008814()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

unint64_t sub_10000886C()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

uint64_t sub_1000088C0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008914()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

unint64_t sub_10000896C()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_1000089C4()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

uint64_t sub_100008A18()
{
  return sub_100008E1C(&qword_1000100C0, &qword_1000100C8);
}

uint64_t sub_100008A54(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008AA0()
{
  unint64_t result = qword_1000100D0;
  if (!qword_1000100D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D0);
  }
  return result;
}

unint64_t sub_100008AFC()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

unint64_t sub_100008B54()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_100008BAC()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

uint64_t sub_100008C00()
{
  return swift_getOpaqueTypeConformance2();
}

unsigned char *initializeBufferWithCopyOfBuffer for PhotosDeepLink(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosDeepLink(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PhotosDeepLink(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x100008D88);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t sub_100008DB0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008DB8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PhotosDeepLink()
{
  return &type metadata for PhotosDeepLink;
}

ValueMetadata *type metadata accessor for OpenPhotosDeepLinks()
{
  return &type metadata for OpenPhotosDeepLinks;
}

uint64_t sub_100008DE0()
{
  return sub_100008E1C(&qword_1000100F8, &qword_100010100);
}

uint64_t sub_100008E1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008A54(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008E60()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

unint64_t sub_100008EB4()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

unint64_t sub_100008F08()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

uint64_t sub_100008F5C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t *sub_100008F70(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008FD4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000362C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000903C()
{
  uint64_t v0 = sub_100009E90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_10000758C();
  sub_100008544();
  sub_100009EA0();
  uint64_t v4 = sub_100009E80();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_10000362C(&qword_100010160);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A770;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009E70();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100009198(uint64_t a1)
{
  uint64_t v20 = sub_10000362C(&qword_100010178);
  uint64_t v22 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000362C(&qword_100010180);
  __chkstk_darwin(v4);
  sub_100008544();
  sub_100009E50();
  v23._object = (void *)0x800000010000B580;
  v23._countAndFlagsBits = 0xD000000000000012;
  sub_100009E40(v23);
  swift_getKeyPath();
  unint64_t v15 = sub_100008814();
  uint64_t v21 = a1;
  sub_100009DA0();
  swift_release();
  sub_100009E30();
  swift_release();
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_100009E40(v24);
  sub_100009E60();
  uint64_t v5 = sub_100009DC0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v18 = v5;
  uint64_t v19 = v6;
  v22 += 8;
  uint64_t v7 = v20;
  v6(v3, v20);
  sub_100009E50();
  v25._countAndFlagsBits = 0x6568742077656956;
  v25._object = (void *)0xE900000000000020;
  sub_100009E40(v25);
  swift_getKeyPath();
  sub_100009DA0();
  swift_release();
  sub_100009E30();
  swift_release();
  v26._countAndFlagsBits = 0x68637469777320;
  v26._object = (void *)0xE700000000000000;
  sub_100009E40(v26);
  sub_100009E60();
  uint64_t v17 = sub_100009DC0();
  int v8 = v19;
  v19(v3, v7);
  sub_100009E50();
  v27._countAndFlagsBits = 0xD000000000000015;
  v27._object = (void *)0x800000010000B5A0;
  sub_100009E40(v27);
  swift_getKeyPath();
  sub_100009DA0();
  swift_release();
  sub_100009E30();
  swift_release();
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_100009E40(v28);
  sub_100009E60();
  uint64_t v16 = sub_100009DC0();
  uint64_t v9 = v20;
  v8(v3, v20);
  sub_100009E50();
  v29._countAndFlagsBits = 0x20656D20656B6154;
  v29._object = (void *)0xEF20656874206F74;
  sub_100009E40(v29);
  swift_getKeyPath();
  sub_100009DA0();
  swift_release();
  sub_100009E30();
  swift_release();
  v30._object = (void *)0xE900000000000073;
  v30._countAndFlagsBits = 0x676E697474657320;
  sub_100009E40(v30);
  sub_100009E60();
  uint64_t v10 = sub_100009DC0();
  v19(v3, v9);
  sub_10000362C(&qword_100010188);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10000A780;
  uint64_t v12 = v17;
  *(void *)(v11 + 32) = v18;
  *(void *)(v11 + 40) = v12;
  *(void *)(v11 + 48) = v16;
  *(void *)(v11 + 56) = v10;
  uint64_t v13 = sub_100009DB0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000096BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000074C4();
  *a1 = result;
  return result;
}

uint64_t sub_1000096E8()
{
  return sub_1000074F8();
}

uint64_t sub_1000096F4()
{
  uint64_t v0 = sub_100009E20();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008814();
  sub_100009DA0();
  swift_release();
  sub_100008544();
  sub_100009E10();
  uint64_t v4 = sub_100009E00();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_10000362C(&qword_100010168);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A770;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009DF0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000985C()
{
  uint64_t v14 = sub_100009DE0();
  uint64_t v13 = sub_100009DE0();
  uint64_t v12 = sub_100009DE0();
  uint64_t v0 = sub_100009DE0();
  uint64_t v1 = sub_100009DE0();
  uint64_t v2 = sub_100009DE0();
  uint64_t v3 = sub_100009DE0();
  uint64_t v4 = sub_100009DE0();
  uint64_t v5 = sub_100009DE0();
  uint64_t v6 = sub_100009DE0();
  uint64_t v7 = sub_100009DE0();
  uint64_t v8 = sub_100009DE0();
  sub_10000362C(&qword_100010170);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10000A790;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v13;
  *(void *)(v9 + 48) = v12;
  *(void *)(v9 + 56) = v0;
  *(void *)(v9 + 64) = v1;
  *(void *)(v9 + 72) = v2;
  *(void *)(v9 + 80) = v3;
  *(void *)(v9 + 88) = v4;
  *(void *)(v9 + 96) = v5;
  *(void *)(v9 + 104) = v6;
  *(void *)(v9 + 112) = v7;
  *(void *)(v9 + 120) = v8;
  uint64_t v10 = sub_100009DD0();
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100009AA0()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for PXAssistantIntentsProvider()
{
  return &type metadata for PXAssistantIntentsProvider;
}

uint64_t sub_100009AC0()
{
  return sub_10000A040();
}

unint64_t sub_100009AFC()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

uint64_t sub_100009B50(uint64_t a1)
{
  unint64_t v2 = sub_100009C4C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_100009BFC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009C4C()
{
  unint64_t result = qword_100010198;
  if (!qword_100010198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010198);
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosAppIntentsExtension()
{
  return &type metadata for PhotosAppIntentsExtension;
}

uint64_t sub_100009CB0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100009CC0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009CD0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009CF0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009D00()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100009D10()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009D40()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009D50()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009D60()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009D70()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009D80()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100009D90()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100009DA0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100009DB0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100009DC0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100009DD0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009DE0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009DF0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100009E00()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100009E10()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100009E20()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100009E30()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009E40(Swift::String a1)
{
}

uint64_t sub_100009E50()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009E60()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100009E70()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100009E80()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100009E90()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100009EA0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100009EB0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100009EC0()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_100009ED0()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100009EE0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100009EF0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009F00()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009F10()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100009F20()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100009F30()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100009F40()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_100009F50()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_100009F60(Swift::String a1)
{
}

uint64_t sub_100009F70()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009F80()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t sub_100009FB0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009FD0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009FE0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009FF0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000A000()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000A010()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000A020()
{
  return static Locale.current.getter();
}

uint64_t sub_10000A030()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000A040()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A050()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000A060()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_10000A070()
{
  return String.hash(into:)();
}

void sub_10000A080(Swift::String a1)
{
}

uint64_t sub_10000A090()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10000A0A0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A0B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A0C0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A0D0()
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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