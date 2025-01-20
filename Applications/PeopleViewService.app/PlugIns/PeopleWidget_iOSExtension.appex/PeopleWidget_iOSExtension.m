uint64_t sub_1000036A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  void v17[2];

  v1 = v0;
  v2 = type metadata accessor for MultipleContactsRowView();
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100053BA0();
  v6 = *(void *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)v17 - v10;
  sub_1000246C8((uint64_t)v17 - v10);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemMedium(_:), v5);
  sub_100006B0C(&qword_100064700, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100053DF0();
  sub_100053DF0();
  v13 = v17[0];
  v12 = v17[1];
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
  sub_100006A40(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  if (v12 == v13)
  {
    v15 = *(void *)(*(void *)&v4[*(int *)(v2 + 24)] + 16);
    sub_100006B54((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
    if (v15 == 4) {
      return sub_100053510();
    }
  }
  else
  {
    sub_100006B54((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  }
  return sub_100053520();
}

BOOL sub_10000390C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MultipleContactsRowView();
  __chkstk_darwin(v2);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100053BA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)v17 - v10;
  sub_1000246C8((uint64_t)v17 - v10);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemMedium(_:), v5);
  sub_100006B0C(&qword_100064700, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100053DF0();
  sub_100053DF0();
  uint64_t v13 = v17[0];
  uint64_t v12 = v17[1];
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
  sub_100006A40(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  BOOL v15 = v12 == v13 && *(void *)(*(void *)&v4[*(int *)(v2 + 24)] + 16) == 4;
  sub_100006B54((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  return v15;
}

uint64_t sub_100003B5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v66 = a3;
  uint64_t v67 = a1;
  uint64_t v4 = sub_1000539F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  uint64_t v60 = v5;
  __chkstk_darwin(v4);
  v55 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PersonEntryType(0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v65 = (uint64_t)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v56 = (char *)&v55 - v13;
  uint64_t v14 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000533F0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000053FC(&qword_1000646B0);
  __chkstk_darwin(v21);
  v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000053FC(&qword_1000646B8);
  uint64_t v57 = *(void *)(v24 - 8);
  uint64_t v58 = v24;
  __chkstk_darwin(v24);
  v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1000053FC(&qword_100064688);
  uint64_t v27 = __chkstk_darwin(v62);
  v61 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v64 = (char *)&v55 - v29;
  uint64_t v30 = sub_1000053FC(&qword_100064668);
  __chkstk_darwin(v30 - 8);
  uint64_t v63 = (uint64_t)&v55 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v23 = sub_100053340();
  *((void *)v23 + 1) = 0x4020000000000000;
  v23[16] = 0;
  uint64_t v32 = (uint64_t)&v23[*(int *)(sub_1000053FC(&qword_1000646C0) + 44)];
  uint64_t v33 = a2;
  uint64_t v34 = v67;
  sub_10000427C(v33, v67, v32);
  sub_1000533E0();
  sub_100006BF0(&qword_1000646C8, &qword_1000646B0);
  uint64_t v35 = v59;
  sub_1000536C0();
  uint64_t v36 = v17;
  uint64_t v37 = v60;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v36);
  uint64_t v38 = (uint64_t)v23;
  uint64_t v39 = (uint64_t)v56;
  sub_100006918(v38, &qword_1000646B0);
  sub_100006A40(v34, v39, type metadata accessor for PersonEntryType);
  v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  if (v40(v39, 2, v35))
  {
    uint64_t v41 = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v16, v39, v35);
    uint64_t v41 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v16, v41, 1, v35);
  sub_100053990();
  uint64_t v42 = sub_100052680();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v9, 0, 1, v42);
  uint64_t v43 = sub_10004CEA8((uint64_t)v9);
  sub_100006918((uint64_t)v9, &qword_1000646A0);
  sub_100006918((uint64_t)v16, &qword_1000646A8);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v26, v58);
  uint64_t v70 = v43;
  uint64_t v44 = v65;
  sub_100006A40(v67, v65, type metadata accessor for PersonEntryType);
  if (v40(v44, 2, v35))
  {
    uint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
  }
  else
  {
    v47 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v55, v44, v35);
    uint64_t v45 = sub_1000539B0();
    unint64_t v46 = v48;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v47, v35);
  }
  uint64_t v68 = v45;
  unint64_t v69 = v46;
  sub_1000068C4();
  uint64_t v49 = (uint64_t)v61;
  sub_100053690();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000529C0();
  uint64_t v50 = (uint64_t)v64;
  sub_100053090();
  swift_bridgeObjectRelease();
  sub_100006918(v49, &qword_100064688);
  uint64_t v51 = sub_1000538E0();
  uint64_t v52 = v63;
  sub_10004C630(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v63, 0.0, 1, 0.0, 1, v51, v53);
  sub_100006918(v50, &qword_100064688);
  return sub_100006AA8(v52, v66, &qword_100064668);
}

uint64_t sub_10000427C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v135 = a1;
  uint64_t v130 = a3;
  uint64_t v4 = sub_1000053FC(&qword_1000646D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v129 = (uint64_t)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100052C50();
  uint64_t v123 = *(void *)(v6 - 8);
  uint64_t v124 = v6;
  __chkstk_darwin(v6);
  v125 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for StatusAndNameView();
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v128 = (uint64_t)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v126 = (void **)((char *)&v108 - v12);
  __chkstk_darwin(v11);
  uint64_t v127 = (uint64_t)&v108 - v13;
  uint64_t v119 = sub_100052710();
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v15 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v16 - 8);
  v131 = (char *)&v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100052FB0();
  uint64_t v113 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  v112 = (char *)&v108 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000539F0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  v23 = (char *)&v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  v109 = (char *)&v108 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v108 = (char *)&v108 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v111 = (uint64_t)&v108 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v108 - v30;
  uint64_t v32 = sub_1000053FC(&qword_1000646E8);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  v120 = (char *)&v108 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v133 = (uint64_t)&v108 - v35;
  uint64_t v36 = type metadata accessor for AvatarView();
  uint64_t v37 = __chkstk_darwin(v36 - 8);
  uint64_t v122 = (uint64_t)&v108 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __chkstk_darwin(v37);
  v116 = (char *)&v108 - v40;
  __chkstk_darwin(v39);
  uint64_t v121 = (uint64_t)&v108 - v41;
  uint64_t v42 = type metadata accessor for PersonEntryType(0);
  uint64_t v43 = __chkstk_darwin(v42 - 8);
  uint64_t v117 = (uint64_t)&v108 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v115 = (uint64_t)&v108 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  uint64_t v49 = (char *)&v108 - v48;
  uint64_t v50 = __chkstk_darwin(v47);
  uint64_t v52 = (char *)&v108 - v51;
  uint64_t v53 = __chkstk_darwin(v50);
  v55 = (char *)&v108 - v54;
  __chkstk_darwin(v53);
  uint64_t v57 = (char *)&v108 - v56;
  uint64_t v134 = a2;
  sub_100006A40(a2, (uint64_t)&v108 - v56, type metadata accessor for PersonEntryType);
  uint64_t v132 = v20;
  uint64_t v58 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v59 = v58(v57, 2, v19);
  if (v59)
  {
    if (v59 != 1)
    {
      uint64_t v60 = sub_1000053FC(&qword_1000646F0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v130, 1, 1, v60);
    }
  }
  else
  {
    sub_100006B54((uint64_t)v57, type metadata accessor for PersonEntryType);
  }
  uint64_t v62 = v134;
  sub_100006A40(v134, (uint64_t)v55, type metadata accessor for PersonEntryType);
  if (v58(v55, 2, v19))
  {
    uint64_t v63 = sub_100053AF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v133, 1, 1, v63);
  }
  else
  {
    v110 = v15;
    v64 = v23;
    uint64_t v65 = v132;
    (*(void (**)(char *, char *, uint64_t))(v132 + 32))(v31, v55, v19);
    uint64_t v66 = v133;
    sub_1000539C0();
    uint64_t v67 = v65;
    v23 = v64;
    uint64_t v15 = v110;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v31, v19);
    uint64_t v68 = sub_100053AF0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v66, 0, 1, v68);
  }
  sub_100006A40(v62, (uint64_t)v52, type metadata accessor for PersonEntryType);
  if (v58(v52, 2, v19))
  {
    uint64_t v111 = 0;
  }
  else
  {
    uint64_t v69 = v132;
    uint64_t v70 = v111;
    (*(void (**)(uint64_t, char *, uint64_t))(v132 + 32))(v111, v52, v19);
    v71 = v15;
    v72 = v112;
    sub_1000539D0();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v70, v19);
    uint64_t v111 = sub_100052F90();
    v73 = v72;
    uint64_t v15 = v71;
    (*(void (**)(char *, uint64_t))(v113 + 8))(v73, v114);
  }
  uint64_t v74 = (uint64_t)v131;
  uint64_t v75 = type metadata accessor for MultipleContactsRowView();
  v76 = (char **)(v135 + *(int *)(v75 + 32));
  v110 = *v76;
  int v77 = *((unsigned __int8 *)v76 + 8);
  sub_100006A40(v134, (uint64_t)v49, type metadata accessor for PersonEntryType);
  if (v58(v49, 2, v19))
  {
    uint64_t v78 = sub_100053AB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v74, 1, 1, v78);
  }
  else
  {
    v79 = v15;
    v80 = v23;
    uint64_t v81 = v132;
    v82 = v108;
    (*(void (**)(char *, char *, uint64_t))(v132 + 32))(v108, v49, v19);
    sub_1000539A0();
    uint64_t v83 = v81;
    v23 = v80;
    uint64_t v15 = v79;
    uint64_t v74 = (uint64_t)v131;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v19);
  }
  uint64_t v84 = v135;
  BOOL v85 = sub_10000390C();
  (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v15, v84 + *(int *)(v75 + 40), v119);
  sub_100052BE0();
  uint64_t v86 = sub_100052BD0();
  v87 = v116;
  sub_100045DFC(v133, v111, (uint64_t)v110, v77, v74, v86, v85, 0, v116, (uint64_t)v15);
  uint64_t v88 = v121;
  sub_1000069D8((uint64_t)v87, v121, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v89 = v134;
  uint64_t v90 = v115;
  sub_100006A40(v134, v115, type metadata accessor for PersonEntryType);
  v91 = 0;
  if (!v58((char *)v90, 2, v19))
  {
    uint64_t v92 = v132;
    v93 = v109;
    (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v109, v90, v19);
    v94 = v112;
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v19);
    v91 = (void *)sub_100052F90();
    (*(void (**)(char *, uint64_t))(v113 + 8))(v94, v114);
  }
  uint64_t v95 = v117;
  sub_100006A40(v89, v117, type metadata accessor for PersonEntryType);
  if (v58((char *)v95, 2, v19))
  {
    uint64_t v96 = sub_100053AF0();
    uint64_t v97 = (uint64_t)v120;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v120, 1, 1, v96);
  }
  else
  {
    uint64_t v98 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v23, v95, v19);
    uint64_t v97 = (uint64_t)v120;
    sub_1000539C0();
    (*(void (**)(char *, uint64_t))(v98 + 8))(v23, v19);
    uint64_t v99 = sub_100053AF0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v97, 0, 1, v99);
  }
  v100 = (void *)sub_1000036A0();
  (*(void (**)(char *, void, uint64_t))(v123 + 104))(v125, enum case for ContactFormatter.Style.shortName(_:), v124);
  sub_100053D80();
  uint64_t v137 = sub_100052C70();
  v138 = &protocol witness table for ContactFormatter;
  sub_100006974((uint64_t *)&v136);
  sub_100052C60();
  v101 = v126;
  sub_10002A8CC(v91, v97, v100, &v136, (void *)2, (void *)1, v126, 3.0, INFINITY);
  uint64_t v102 = v127;
  sub_1000069D8((uint64_t)v101, v127, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v103 = v122;
  sub_100006A40(v88, v122, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v104 = v128;
  sub_100006A40(v102, v128, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v105 = v129;
  sub_100006A40(v103, v129, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v106 = sub_1000053FC(&qword_1000646F8);
  sub_100006A40(v104, v105 + *(int *)(v106 + 48), (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  sub_100006B54(v102, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  sub_100006B54(v88, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100006B54(v104, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  sub_100006B54(v103, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v107 = sub_1000053FC(&qword_1000646F0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v105, 0, 1, v107);
  return sub_100006AA8(v105, v130, &qword_1000646D8);
}

uint64_t sub_1000050D4()
{
  return sub_100053670();
}

uint64_t sub_1000050F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a2 = sub_1000532E0();
  *(void *)(a2 + 8) = 0x4030000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  sub_1000053FC(&qword_100064658);
  uint64_t v7 = swift_bridgeObjectRetain();
  size_t v8 = sub_100014534(v7);
  swift_bridgeObjectRelease();
  v13[1] = v8;
  swift_getKeyPath();
  sub_100006A40(v2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  sub_1000069D8((uint64_t)v6, v10 + v9, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_10000667C;
  *(void *)(v11 + 24) = v10;
  sub_1000053FC(&qword_100064660);
  sub_1000053FC(&qword_100064668);
  sub_100006BF0(&qword_100064670, &qword_100064660);
  sub_10000679C();
  return sub_100053870();
}

uint64_t sub_10000531C(long long *a1)
{
  long long v2 = *a1;
  if (sub_100052044(2, 17, 0, 0)) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_100005390(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_100052044(2, 17, 0, 0)) {
    return swift_getOpaqueTypeConformance2();
  }
  return v1;
}

uint64_t sub_1000053FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005440(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 sub_100005488(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005498(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000054B8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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

uint64_t initializeBufferWithCopyOfBuffer for MultipleContactsProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100005528(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005534(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005554(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

uint64_t *sub_100005594(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100053BA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100053530();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[8];
    uint64_t v15 = a3[9];
    uint64_t v16 = (char *)a1 + v14;
    uint64_t v17 = (char *)a2 + v14;
    *(void *)uint64_t v16 = *(void *)v17;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15);
    v16[8] = v17[8];
    *(uint64_t *)((char *)a1 + v15) = v18;
    uint64_t v19 = a3[10];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = sub_100052710();
    v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
  }
  return a1;
}

uint64_t sub_100005788(uint64_t a1, uint64_t a2)
{
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100053530();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 40);
  uint64_t v8 = sub_100052710();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

void *sub_1000058B0(void *a1, void *a2, int *a3)
{
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100053BA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053530();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  uint64_t v16 = *(void *)((char *)a2 + v13);
  v14[8] = v15[8];
  *(void *)((char *)a1 + v13) = v16;
  uint64_t v17 = a3[10];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_100052710();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  return a1;
}

void *sub_100005A54(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064590);
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100053BA0();
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
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053530();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  char v14 = v13[8];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v14;
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v15 = a3[10];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

char *sub_100005C14(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100053BA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100053530();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = *(void *)&a2[v14];
  v15[8] = v16[8];
  *(void *)&a1[v14] = v17;
  uint64_t v18 = a3[10];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

char *sub_100005DAC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064590);
    uint64_t v6 = sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100053BA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100053530();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t sub_100005F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005F78);
}

uint64_t sub_100005F78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000053FC(&qword_100064598);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100053530();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_100052710();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006110);
}

uint64_t sub_100006110(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1000053FC(&qword_100064598);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100053530();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = sub_100052710();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[10];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t type metadata accessor for MultipleContactsRowView()
{
  uint64_t result = qword_1000645F8;
  if (!qword_1000645F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000062E0()
{
  sub_10000640C();
  if (v0 <= 0x3F)
  {
    sub_100053530();
    if (v1 <= 0x3F)
    {
      sub_100052710();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10000640C()
{
  if (!qword_100064608)
  {
    sub_100053BA0();
    unint64_t v0 = sub_100052FF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100064608);
    }
  }
}

void type metadata accessor for CTFont(uint64_t a1)
{
}

void sub_100006478(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000064C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000064DC()
{
  uint64_t v1 = type metadata accessor for MultipleContactsRowView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  uint64_t v8 = v5 + *(int *)(v1 + 20);
  uint64_t v9 = sub_100053530();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + *(int *)(v1 + 40);
  uint64_t v11 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_10000667C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MultipleContactsRowView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100003B5C(a1, v6, a2);
}

uint64_t sub_100006704()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000673C(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_1000053FC(&qword_100064698);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

unint64_t sub_10000679C()
{
  unint64_t result = qword_100064678;
  if (!qword_100064678)
  {
    sub_100005440(&qword_100064668);
    sub_100006818();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064678);
  }
  return result;
}

unint64_t sub_100006818()
{
  unint64_t result = qword_100064680;
  if (!qword_100064680)
  {
    sub_100005440(&qword_100064688);
    sub_100006B0C(&qword_100064690, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064680);
  }
  return result;
}

unint64_t sub_1000068C4()
{
  unint64_t result = qword_1000646D0;
  if (!qword_1000646D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000646D0);
  }
  return result;
}

uint64_t sub_100006918(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000053FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100006974(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000069D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006A40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006AA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000053FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006B0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006B54(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006BB4()
{
  return sub_100006BF0(&qword_100064708, &qword_100064710);
}

uint64_t sub_100006BF0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006C34(unint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v103 = a4;
  uint64_t v102 = a3;
  unint64_t v108 = a1;
  uint64_t v96 = sub_100052770();
  uint64_t v95 = *(uint8_t **)(v96 - 8);
  uint64_t v5 = __chkstk_darwin(v96);
  v93 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v94 = (char *)&v92 - v7;
  uint64_t v8 = type metadata accessor for MultipleContactsEntry(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100053BA0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_1000527D0();
  uint64_t v100 = *(void *)(v101 - 8);
  uint64_t v15 = __chkstk_darwin(v101);
  uint64_t v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v99 = (char *)&v92 - v19;
  __chkstk_darwin(v18);
  uint64_t v106 = sub_1000527A0();
  uint64_t v105 = *(void *)(v106 - 8);
  uint64_t v20 = __chkstk_darwin(v106);
  uint64_t v98 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = v21;
  __chkstk_darwin(v20);
  v23 = (char *)&v92 - v22;
  sub_100052910();
  uint64_t v104 = v23;
  sub_100052780();
  sub_100053C80();
  uint64_t v107 = v4;
  unint64_t v24 = (unint64_t)sub_100007940();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  unint64_t v108 = v24;
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100054040();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v26)
  {
    *(void *)&v109[0] = &_swiftEmptyArrayStorage;
    if (v26 < 1)
    {
      __break(1u);
    }
    else
    {
      unint64_t v27 = v108;
      unint64_t v28 = v108 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (v28) {
          sub_100054000();
        }
        else {
          id v30 = *(id *)(v27 + 8 * i + 32);
        }
        sub_100053E00();
        if (*(void *)((*(void *)&v109[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)&v109[0] & 0xFFFFFFFFFFFFFF8)
                                                                                          + 0x18) >> 1)
          sub_100053E40();
        sub_100053E60();
        sub_100053E30();
      }
      swift_bridgeObjectRelease();
      unint64_t v31 = *(void *)&v109[0];
      unint64_t v32 = sub_100034078((uint64_t)&_swiftEmptyArrayStorage);
      uint64_t v33 = (void *)__chkstk_darwin(v32);
      *(&v92 - 2) = v107;
      uint64_t v96 = (uint64_t)sub_10000C794(v33, (void (*)(void **, id *))sub_1000175DC, (uint64_t)(&v92 - 4), v31);
      swift_bridgeObjectRelease();
      uint64_t v34 = v99;
      sub_100052910();
      swift_bridgeObjectRetain_n();
      uint64_t v35 = sub_1000527C0();
      int v36 = sub_100053F30();
      if (os_log_type_enabled(v35, (os_log_type_t)v36))
      {
        LODWORD(v94) = v36;
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        v93 = (char *)swift_slowAlloc();
        *(void *)&v109[0] = v93;
        uint64_t v95 = v37;
        *(_DWORD *)uint64_t v37 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v38 = 0;
        uint64_t v39 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if (v28) {
            id v40 = (id)sub_100054000();
          }
          else {
            id v40 = *(id *)(v27 + 8 * v38 + 32);
          }
          uint64_t v41 = v40;
          id v42 = [v40 identifier];
          uint64_t v43 = sub_100053D30();
          uint64_t v45 = v44;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v39 = sub_1000132F4(0, *((void *)v39 + 2) + 1, 1, v39);
          }
          unint64_t v47 = *((void *)v39 + 2);
          unint64_t v46 = *((void *)v39 + 3);
          if (v47 >= v46 >> 1) {
            uint64_t v39 = sub_1000132F4((char *)(v46 > 1), v47 + 1, 1, v39);
          }
          ++v38;
          *((void *)v39 + 2) = v47 + 1;
          uint64_t v48 = &v39[16 * v47];
          *((void *)v48 + 4) = v43;
          *((void *)v48 + 5) = v45;
          unint64_t v27 = v108;
        }
        while (v26 != v38);
        swift_bridgeObjectRelease();
        v64 = v95;
        uint64_t v65 = sub_100053E20();
        unint64_t v67 = v66;
        swift_bridgeObjectRelease();
        v110[0] = sub_10002586C(v65, v67, (uint64_t *)v109);
        sub_100053F70();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v94, "get snapshot for multiple contacts widget with Ids %s", v64, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v101);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v100 + 8))(v34, v101);
      }
      swift_bridgeObjectRetain();
      uint64_t v68 = 0;
      uint64_t v69 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        if (v28) {
          id v70 = (id)sub_100054000();
        }
        else {
          id v70 = *(id *)(v27 + 8 * v68 + 32);
        }
        v71 = v70;
        id v72 = [v70 identifier];
        uint64_t v73 = sub_100053D30();
        uint64_t v75 = v74;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v69 = sub_1000132F4(0, *((void *)v69 + 2) + 1, 1, v69);
        }
        unint64_t v77 = *((void *)v69 + 2);
        unint64_t v76 = *((void *)v69 + 3);
        if (v77 >= v76 >> 1) {
          uint64_t v69 = sub_1000132F4((char *)(v76 > 1), v77 + 1, 1, v69);
        }
        ++v68;
        *((void *)v69 + 2) = v77 + 1;
        uint64_t v78 = &v69[16 * v77];
        *((void *)v78 + 4) = v73;
        *((void *)v78 + 5) = v75;
      }
      while (v26 != v68);
      swift_bridgeObjectRelease();
      uint64_t v79 = v107;
      sub_100016744(v107 + 80, (uint64_t)v110);
      unint64_t v108 = v110[4];
      sub_1000162D8(v110, v110[3]);
      sub_100016338(v79, (uint64_t)v109);
      uint64_t v80 = v105;
      uint64_t v81 = v98;
      unint64_t v82 = v27;
      uint64_t v83 = v104;
      uint64_t v84 = v106;
      (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v98, v104, v106);
      unint64_t v85 = (*(unsigned __int8 *)(v80 + 80) + 184) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
      uint64_t v86 = swift_allocObject();
      *(void *)(v86 + 16) = v69;
      *(void *)(v86 + 24) = v82;
      long long v87 = v109[5];
      *(_OWORD *)(v86 + 96) = v109[4];
      *(_OWORD *)(v86 + 112) = v87;
      long long v88 = v109[7];
      *(_OWORD *)(v86 + 128) = v109[6];
      *(_OWORD *)(v86 + 144) = v88;
      long long v89 = v109[1];
      *(_OWORD *)(v86 + 32) = v109[0];
      *(_OWORD *)(v86 + 48) = v89;
      long long v90 = v109[3];
      *(_OWORD *)(v86 + 64) = v109[2];
      *(_OWORD *)(v86 + 80) = v90;
      v91 = v102;
      *(void *)(v86 + 160) = v96;
      *(void *)(v86 + 168) = v91;
      *(void *)(v86 + 176) = v103;
      (*(void (**)(unint64_t, char *, uint64_t))(v80 + 32))(v86 + v85, v81, v84);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_100052F00();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v83, v84);
      return sub_100010614((uint64_t)v110);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100052910();
    uint64_t v49 = sub_1000527C0();
    os_log_type_t v50 = sub_100053F30();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Could not get any contacts for Mutiple contacts widget", v51, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v17, v101);
    sub_1000526D0();
    uint64_t v52 = (char *)v10 + *(int *)(v8 + 32);
    uint64_t v53 = sub_100053C70();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 1, 1, v53);
    *uint64_t v10 = &_swiftEmptyArrayStorage;
    *((unsigned char *)v10 + *(int *)(v8 + 24)) = 0;
    sub_100052700();
    v102(v10);
    sub_100015C90((uint64_t)v10, type metadata accessor for MultipleContactsEntry);
    uint64_t v54 = v94;
    sub_100052760();
    v55 = v104;
    uint64_t v56 = sub_100052790();
    os_signpost_type_t v57 = sub_100053F40();
    if (sub_100053F50())
    {
      uint64_t v58 = v95;
      int v59 = v93;
      uint64_t v60 = v96;
      (*((void (**)(char *, char *, uint64_t))v95 + 2))(v93, v54, v96);
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      os_signpost_id_t v62 = sub_100052750();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, v57, v62, "getSnapshot", "no contacts", v61, 2u);
      swift_slowDealloc();

      uint64_t v63 = (void (*)(char *, uint64_t))*((void *)v58 + 1);
      v63(v54, v60);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v55, v106);
      return ((uint64_t (*)(char *, uint64_t))v63)(v59, v60);
    }
    else
    {

      (*((void (**)(char *, uint64_t))v95 + 1))(v54, v96);
      return (*(uint64_t (**)(char *, uint64_t))(v105 + 8))(v55, v106);
    }
  }
  return result;
}

void *sub_100007940()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000527D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100053B80();
  unint64_t v6 = sub_1000527E0();
  sub_100052910();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1000527C0();
  os_log_type_t v8 = sub_100053F30();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v19 = v1;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v17 = v9 + 4;
    sub_100052A40();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100053E20();
    uint64_t v18 = v2;
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    uint64_t v13 = v10;
    uint64_t v1 = v19;
    uint64_t v20 = sub_10002586C(v13, v12, &v21);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Configuration returned contacts: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  __chkstk_darwin(v14);
  *(&v17 - 2) = v1;
  uint64_t v15 = sub_100007BFC((void (*)(uint64_t *__return_ptr, id *))sub_10001686C, (uint64_t)(&v17 - 4), v6);
  swift_bridgeObjectRelease();
  return v15;
}

void *sub_100007BFC(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  unint64_t v14 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a3 >> 62) {
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_100054040())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)sub_100054000() : *(id *)(a3 + 8 * i);
      os_log_type_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v7;
      a1(&v12, &v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return (void *)swift_bridgeObjectRelease();
      }

      if (v12)
      {
        sub_100053E00();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100053E40();
        }
        sub_100053E60();
        sub_100053E30();
      }
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return (void *)v14;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100007D9C(uint64_t a1, char a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void *), uint64_t a8)
{
  uint64_t v112 = a8;
  uint64_t v113 = a7;
  uint64_t v134 = a5;
  id v138 = a3;
  uint64_t v116 = sub_100052770();
  uint64_t v115 = *(void *)(v116 - 8);
  uint64_t v12 = __chkstk_darwin(v116);
  unint64_t v108 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v114 = (char *)&v107 - v14;
  uint64_t v110 = type metadata accessor for MultipleContactsEntry(0);
  __chkstk_darwin(v110);
  uint64_t v111 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v16 - 8);
  uint64_t v133 = (char *)&v107 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100052C50();
  uint64_t v18 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  v131 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100052FB0();
  __chkstk_darwin(v20 - 8);
  v140 = (char *)&v107 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1000539F0();
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  v139 = (char *)&v107 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_1000526E0();
  v125 = *(void (***)(char *, uint64_t))(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v129 = (char *)&v107 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000527D0();
  uint64_t v25 = *(uint64_t **)(v24 - 8);
  uint64_t v26 = __chkstk_darwin(v24);
  unint64_t v28 = (char *)&v107 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v26);
  unint64_t v31 = (unint64_t)&v107 - v30;
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v34 = (char *)&v107 - v33;
  v146 = &_swiftEmptyArrayStorage;
  uint64_t v117 = v32;
  uint64_t v118 = (char *)v31;
  if (a2)
  {
    v145[0] = a1;
    swift_errorRetain();
    sub_1000053FC(&qword_100064A28);
    swift_willThrowTypedImpl();
    sub_100052910();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v44 = sub_1000527C0();
    os_log_type_t v45 = sub_100053F30();
    if (os_log_type_enabled(v44, v45))
    {
      unint64_t v46 = (uint8_t *)swift_slowAlloc();
      v145[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v46 = 136315138;
      swift_getErrorValue();
      uint64_t v47 = sub_1000540F0();
      *(void *)&long long v144 = sub_10002586C(v47, v48, v145);
      sub_100053F70();
      swift_bridgeObjectRelease();
      sub_100016618(a1, 1);
      sub_100016618(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "got failure fetching statuses for contactID's: %s", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_100016618(a1, 1);
      uint64_t v49 = (void (*)(char *, uint64_t))v25[1];
      v49(v28, v117);
    }
    else
    {
      sub_100016618(a1, 1);
      sub_100016618(a1, 1);
      swift_errorRelease();

      uint64_t v49 = (void (*)(char *, uint64_t))v25[1];
      v49(v28, v24);
    }
    unint64_t v31 = (unint64_t)v118;
  }
  else
  {
    uint64_t v135 = a1;
    swift_bridgeObjectRetain();
    sub_100052910();
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1000527C0();
    os_log_type_t v36 = sub_100053F30();
    BOOL v37 = os_log_type_enabled(v35, v36);
    unint64_t v121 = a4;
    uint64_t v128 = a6;
    if (v37)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v126 = swift_slowAlloc();
      v145[0] = v126;
      unint64_t v127 = v18;
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v124 = v38 + 4;
      swift_bridgeObjectRetain();
      uint64_t v39 = v25;
      uint64_t v40 = sub_100053E20();
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      uint64_t v43 = v40;
      uint64_t v25 = v39;
      a4 = v121;
      *(void *)&long long v144 = sub_10002586C(v43, v42, v145);
      uint64_t v18 = v127;
      sub_100053F70();
      swift_bridgeObjectRelease_n();
      unint64_t v31 = (unint64_t)v118;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "got statuses for contactIDs %s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v109 = (void (*)(char *, uint64_t))v25[1];
    v109(v34, v24);
    uint64_t v50 = v135;
    if (a4 >> 62) {
      goto LABEL_48;
    }
    uint64_t v51 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v51; uint64_t v51 = sub_100054040())
    {
      uint64_t v107 = v25;
      unint64_t v31 = 0;
      unint64_t v127 = a4 & 0xC000000000000001;
      uint64_t v120 = a4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v119 = a4 + 32;
      ++v125;
      LODWORD(v124) = enum case for ContactFormatter.Style.shortName(_:);
      uint64_t v123 = (void (**)(char *, void, uint64_t))(v18 + 104);
      uint64_t v122 = v136 + 32;
      uint64_t v25 = &qword_100064A48;
      uint64_t v126 = v51;
      while (v127)
      {
        id v52 = (id)sub_100054000();
        BOOL v53 = __OFADD__(v31++, 1);
        if (v53) {
          goto LABEL_46;
        }
LABEL_16:
        id v138 = v52;
        id v54 = [v52 identifier:v107];
        uint64_t v55 = sub_100053D30();
        uint64_t v57 = v56;

        if (*(void *)(v50 + 16))
        {
          uint64_t v58 = sub_100035CD4(v55, v57);
          int v59 = &_swiftEmptyArrayStorage;
          if (v60)
          {
            int v59 = *(void **)(*(void *)(v50 + 56) + 8 * v58);
            swift_bridgeObjectRetain();
          }
        }
        else
        {
          int v59 = &_swiftEmptyArrayStorage;
        }
        swift_bridgeObjectRelease();
        uint64_t v18 = (uint64_t)sub_10000902C((uint64_t)v59, (void (*)(BOOL, uint64_t, uint64_t))sub_1000303D4);
        swift_bridgeObjectRelease();
        v61 = v129;
        sub_1000526D0();
        uint64_t v62 = sub_100052D50();
        swift_bridgeObjectRelease();
        (*v125)(v61, v130);
        uint64_t v63 = *(void *)(v62 + 16);
        if (v63)
        {
          uint64_t v64 = v62 + 32;
          swift_bridgeObjectRetain();
          uint64_t v65 = (char *)&_swiftEmptyArrayStorage;
          do
          {
            sub_100016744(v64, (uint64_t)v145);
            sub_100016744((uint64_t)v145, (uint64_t)&v144);
            uint64_t v18 = sub_1000053FC(&qword_100064A40);
            sub_1000053FC(&qword_100064A48);
            if ((swift_dynamicCast() & 1) == 0)
            {
              uint64_t v143 = 0;
              long long v141 = 0u;
              long long v142 = 0u;
            }
            sub_100010614((uint64_t)v145);
            if (*((void *)&v142 + 1))
            {
              sub_10001672C(&v141, (uint64_t)&v144);
              sub_10001672C(&v144, (uint64_t)&v141);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v65 = sub_10001366C(0, *((void *)v65 + 2) + 1, 1, v65);
              }
              unint64_t v67 = *((void *)v65 + 2);
              unint64_t v66 = *((void *)v65 + 3);
              uint64_t v18 = v67 + 1;
              if (v67 >= v66 >> 1) {
                uint64_t v65 = sub_10001366C((char *)(v66 > 1), v67 + 1, 1, v65);
              }
              *((void *)v65 + 2) = v18;
              sub_10001672C(&v141, (uint64_t)&v65[40 * v67 + 32]);
            }
            else
            {
              sub_100006918((uint64_t)&v141, &qword_100064A50);
            }
            v64 += 40;
            --v63;
          }
          while (v63);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        (*v123)(v131, v124, v132);
        sub_100053D80();
        v145[3] = sub_100052C70();
        v145[4] = (uint64_t)&protocol witness table for ContactFormatter;
        sub_100006974(v145);
        sub_100052C60();
        id v68 = v138;
        sub_100052F80();
        id v69 = [v68 identifier];
        uint64_t v70 = sub_100053D30();
        uint64_t v72 = v71;

        uint64_t v73 = v128;
        if (*(void *)(v128 + 16) && (uint64_t v74 = sub_100035CD4(v70, v72), (v75 & 1) != 0))
        {
          uint64_t v76 = v74;
          uint64_t v77 = *(void *)(v73 + 56);
          uint64_t v78 = sub_100053AB0();
          uint64_t v79 = *(void *)(v78 - 8);
          uint64_t v80 = v133;
          (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v133, v77 + *(void *)(v79 + 72) * v76, v78);
          uint64_t v81 = *(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56);
          uint64_t v18 = v79 + 56;
          v81(v80, 0, 1, v78);
        }
        else
        {
          uint64_t v82 = sub_100053AB0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v133, 1, 1, v82);
        }
        swift_bridgeObjectRelease();
        sub_1000539E0();
        unint64_t v83 = (unint64_t)v146;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v83 = sub_100013404(0, *(void *)(v83 + 16) + 1, 1, v83);
        }
        unint64_t v85 = *(void *)(v83 + 16);
        unint64_t v84 = *(void *)(v83 + 24);
        if (v85 >= v84 >> 1) {
          unint64_t v83 = sub_100013404(v84 > 1, v85 + 1, 1, v83);
        }
        *(void *)(v83 + 16) = v85 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v136 + 32))(v83+ ((*(unsigned __int8 *)(v136 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80))+ *(void *)(v136 + 72) * v85, v139, v137);

        v146 = (void *)v83;
        uint64_t v50 = v135;
        if (v31 == v126)
        {
          swift_bridgeObjectRelease();
          sub_100016618(v50, 0);
          unint64_t v31 = (unint64_t)v118;
          goto LABEL_50;
        }
      }
      if (v31 >= *(void *)(v120 + 16)) {
        goto LABEL_47;
      }
      id v52 = *(id *)(v119 + 8 * v31);
      BOOL v53 = __OFADD__(v31++, 1);
      if (!v53) {
        goto LABEL_16;
      }
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      swift_bridgeObjectRetain();
      a4 = v121;
    }
    swift_bridgeObjectRelease();
    sub_100016618(v50, 0);
LABEL_50:
    uint64_t v49 = v109;
  }
  sub_100052910();
  swift_bridgeObjectRetain_n();
  uint64_t v86 = sub_1000527C0();
  os_log_type_t v87 = sub_100053F30();
  if (os_log_type_enabled(v86, v87))
  {
    uint64_t v88 = swift_slowAlloc();
    v109 = v49;
    long long v89 = (uint8_t *)v88;
    v145[0] = swift_slowAlloc();
    *(_DWORD *)long long v89 = 136315138;
    uint64_t v90 = sub_100053E50();
    *(void *)&long long v144 = sub_10002586C(v90, v91, v145);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v86, v87, "snapshot created for multiple widget %s", v89, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v109(v118, v117);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v49((char *)v31, v117);
  }
  uint64_t v92 = v114;
  swift_beginAccess();
  v93 = v146;
  uint64_t v94 = v110;
  uint64_t v95 = v111;
  sub_1000526D0();
  uint64_t v96 = (char *)v95 + *(int *)(v94 + 32);
  uint64_t v97 = sub_100053C70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v96, 1, 1, v97);
  *uint64_t v95 = v93;
  *((unsigned char *)v95 + *(int *)(v94 + 24)) = 0;
  sub_100052700();
  v113(v95);
  sub_100015C90((uint64_t)v95, type metadata accessor for MultipleContactsEntry);
  sub_100052760();
  uint64_t v98 = sub_100052790();
  os_signpost_type_t v99 = sub_100053F40();
  if (sub_100053F50())
  {
    uint64_t v100 = v115;
    uint64_t v101 = v108;
    uint64_t v102 = v116;
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v108, v92, v116);
    uint64_t v103 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v103 = 0;
    os_signpost_id_t v104 = sub_100052750();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, v99, v104, "getSnapshot", "completed", v103, 2u);
    swift_slowDealloc();

    uint64_t v105 = *(void (**)(char *, uint64_t))(v100 + 8);
    v105(v92, v102);
    return ((uint64_t (*)(char *, uint64_t))v105)(v101, v102);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v115 + 8))(v92, v116);
  }
}

void *sub_100009014(uint64_t a1)
{
  return sub_10000902C(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_1000303D4);
}

void *sub_10000902C(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t v12 = &_swiftEmptyArrayStorage;
    a2(0, v2, 0);
    uint64_t v6 = a1 + 32;
    uint64_t v3 = &_swiftEmptyArrayStorage;
    do
    {
      sub_100016744(v6, (uint64_t)v10);
      sub_1000053FC(&qword_100064A48);
      sub_1000053FC(&qword_100064A40);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a2(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        a2(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v12;
      }
      v3[2] = v8 + 1;
      sub_10001672C(&v11, (uint64_t)&v3[5 * v8 + 4]);
      v6 += 40;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_100009180(uint8_t *a1, uint64_t a2, void (*a3)(char *), void (*a4)(char *))
{
  uint64_t v135 = a4;
  uint64_t v134 = a3;
  uint64_t v142 = a2;
  id v138 = a1;
  uint64_t v118 = sub_100052770();
  uint64_t v117 = *(void *)(v118 - 8);
  uint64_t v4 = __chkstk_darwin(v118);
  uint64_t v116 = (char *)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  os_log_t v126 = (os_log_t)((char *)&v115 - v6);
  uint64_t v7 = sub_100053C10();
  __chkstk_darwin(v7 - 8);
  v125 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000053FC(&qword_100064778);
  __chkstk_darwin(v9 - 8);
  unint64_t v121 = (char *)&v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_1000053FC(&qword_1000649E0);
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v122 = (char *)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_100053C90();
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v128 = v12;
  uint64_t v129 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000053FC(&qword_1000649E8);
  __chkstk_darwin(v13 - 8);
  uint64_t v132 = (char *)&v115 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100053BA0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v115 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000526E0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v115 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1000527D0();
  uint64_t v136 = *(void **)(v137 - 8);
  uint64_t v23 = __chkstk_darwin(v137);
  uint64_t v25 = (char *)&v115 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v23);
  unint64_t v28 = (char *)&v115 - v27;
  __chkstk_darwin(v26);
  uint64_t v140 = sub_1000527A0();
  uint64_t v133 = *(void *)(v140 - 8);
  uint64_t v29 = __chkstk_darwin(v140);
  v139 = (char *)&v115 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = v30;
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)&v115 - v31;
  sub_100052910();
  long long v141 = v32;
  sub_100052780();
  sub_1000526D0();
  sub_1000526B0();
  uint64_t v34 = v33;
  uint64_t v119 = v20;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v120 = v19;
  v35(v22, v19);
  sub_100053C80();
  unint64_t v36 = (unint64_t)sub_100007940();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100054040();
    swift_bridgeObjectRelease();
    if (v37)
    {
LABEL_3:
      sub_100052910();
      swift_bridgeObjectRetain_n();
      uint64_t v38 = sub_1000527C0();
      int v39 = sub_100053F30();
      if (os_log_type_enabled(v38, (os_log_type_t)v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t result = swift_slowAlloc();
        *(void *)&v144[0] = result;
        id v138 = v40;
        *(_DWORD *)uint64_t v40 = 136315138;
        if (v37 < 1) {
          goto LABEL_41;
        }
        uint64_t v124 = result;
        LODWORD(v125) = v39;
        os_log_t v126 = v38;
        swift_bridgeObjectRetain();
        uint64_t v42 = 0;
        uint64_t v43 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((v36 & 0xC000000000000001) != 0) {
            id v44 = (id)sub_100054000();
          }
          else {
            id v44 = *(id *)(v36 + 8 * v42 + 32);
          }
          os_log_type_t v45 = v44;
          id v46 = [v44 identifier];
          uint64_t v47 = sub_100053D30();
          uint64_t v49 = v48;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v43 = sub_1000132F4(0, *((void *)v43 + 2) + 1, 1, v43);
          }
          unint64_t v51 = *((void *)v43 + 2);
          unint64_t v50 = *((void *)v43 + 3);
          if (v51 >= v50 >> 1) {
            uint64_t v43 = sub_1000132F4((char *)(v50 > 1), v51 + 1, 1, v43);
          }
          ++v42;
          *((void *)v43 + 2) = v51 + 1;
          id v52 = &v43[16 * v51];
          *((void *)v52 + 4) = v47;
          *((void *)v52 + 5) = v49;
        }
        while (v37 != v42);
        swift_bridgeObjectRelease();
        BOOL v53 = v138;
        uint64_t v54 = sub_100053E20();
        unint64_t v56 = v55;
        swift_bridgeObjectRelease();
        uint64_t v145 = sub_10002586C(v54, v56, (uint64_t *)v144);
        sub_100053F70();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        os_log_t v57 = v126;
        _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v125, "get timeline for multiple contacts widget with Ids %s", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      ((void (*)(char *, uint64_t))v136[1])(v28, v137);
      uint64_t v58 = sub_100053EC0();
      uint64_t v59 = (uint64_t)v132;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v132, 1, 1, v58);
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = 0;
      *(void *)(v60 + 24) = 0;
      sub_100033ECC(v59, (uint64_t)&unk_1000649F8, v60);
      uint64_t result = swift_release();
      if (v37 >= 1)
      {
        unint64_t v61 = v36 & 0xC000000000000001;
        swift_bridgeObjectRetain();
        uint64_t v62 = 0;
        uint64_t v63 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if (v61) {
            id v64 = (id)sub_100054000();
          }
          else {
            id v64 = *(id *)(v36 + 8 * v62 + 32);
          }
          uint64_t v65 = v64;
          id v66 = [v64 identifier];
          uint64_t v67 = sub_100053D30();
          uint64_t v69 = v68;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v63 = sub_1000132F4(0, *((void *)v63 + 2) + 1, 1, v63);
          }
          unint64_t v71 = *((void *)v63 + 2);
          unint64_t v70 = *((void *)v63 + 3);
          if (v71 >= v70 >> 1) {
            uint64_t v63 = sub_1000132F4((char *)(v70 > 1), v71 + 1, 1, v63);
          }
          ++v62;
          *((void *)v63 + 2) = v71 + 1;
          uint64_t v72 = &v63[16 * v71];
          *((void *)v72 + 4) = v67;
          *((void *)v72 + 5) = v69;
        }
        while (v37 != v62);
        swift_bridgeObjectRelease();
        sub_1000162D8(v143, v143[3]);
        sub_100052EA0();
        *(void *)&v144[0] = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (v61) {
            sub_100054000();
          }
          else {
            id v74 = *(id *)(v36 + 8 * i + 32);
          }
          sub_100053E00();
          if (*(void *)((*(void *)&v144[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)&v144[0] & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
            sub_100053E40();
          sub_100053E60();
          sub_100053E30();
        }
        swift_bridgeObjectRelease();
        unint64_t v75 = *(void *)&v144[0];
        unint64_t v76 = sub_100034078((uint64_t)&_swiftEmptyArrayStorage);
        uint64_t v77 = (void *)__chkstk_darwin(v76);
        uint64_t v78 = v143;
        *(&v115 - 2) = (uint64_t)v143;
        uint64_t v132 = (char *)sub_10000C794(v77, (void (*)(void **, id *))sub_10001631C, (uint64_t)(&v115 - 4), v75);
        swift_bridgeObjectRelease();
        sub_100016744((uint64_t)(v78 + 10), (uint64_t)&v145);
        uint64_t v137 = v146;
        id v138 = v147;
        uint64_t v136 = sub_1000162D8(&v145, v146);
        sub_100016338((uint64_t)v78, (uint64_t)v144);
        uint64_t v79 = v130;
        uint64_t v80 = v129;
        uint64_t v81 = v131;
        (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v129, v142, v131);
        uint64_t v82 = v133;
        (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v139, v141, v140);
        unint64_t v83 = (*(unsigned __int8 *)(v79 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
        unint64_t v84 = (v128 + v83 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v85 = (*(unsigned __int8 *)(v82 + 80) + v84 + 16) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
        uint64_t v86 = swift_allocObject();
        long long v87 = v144[5];
        *(_OWORD *)(v86 + 88) = v144[4];
        *(_OWORD *)(v86 + 104) = v87;
        long long v88 = v144[7];
        *(_OWORD *)(v86 + 120) = v144[6];
        *(_OWORD *)(v86 + 136) = v88;
        long long v89 = v144[1];
        *(_OWORD *)(v86 + 24) = v144[0];
        *(_OWORD *)(v86 + 40) = v89;
        long long v90 = v144[3];
        *(_OWORD *)(v86 + 56) = v144[2];
        *(void *)(v86 + 16) = v63;
        *(_OWORD *)(v86 + 72) = v90;
        unint64_t v91 = v132;
        *(void *)(v86 + 152) = v36;
        *(void *)(v86 + 160) = v91;
        *(void *)(v86 + 168) = v34;
        (*(void (**)(unint64_t, char *, uint64_t))(v79 + 32))(v86 + v83, v80, v81);
        uint64_t v92 = (void (**)(char *))(v86 + v84);
        v93 = v135;
        *uint64_t v92 = v134;
        v92[1] = v93;
        uint64_t v94 = v140;
        (*(void (**)(unint64_t, char *, uint64_t))(v82 + 32))(v86 + v85, v139, v140);
        swift_bridgeObjectRetain();
        swift_retain();
        sub_100052F00();
        swift_bridgeObjectRelease();
        swift_release();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v141, v94);
        return sub_100010614((uint64_t)&v145);
      }
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v37) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  sub_100052910();
  uint64_t v95 = sub_1000527C0();
  os_log_type_t v96 = sub_100053F30();
  if (os_log_type_enabled(v95, v96))
  {
    uint64_t v97 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v97 = 0;
    _os_log_impl((void *)&_mh_execute_header, v95, v96, "Could not get any contacts for Mutiple contacts widget", v97, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v136[1])(v25, v137);
  sub_1000053FC(&qword_100064A00);
  uint64_t v98 = (int *)type metadata accessor for MultipleContactsEntry(0);
  unint64_t v99 = (*(unsigned __int8 *)(*((void *)v98 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v98 - 1) + 80);
  uint64_t v100 = swift_allocObject();
  *(_OWORD *)(v100 + 16) = xmmword_100054930;
  uint64_t v101 = (char *)(v100 + v99);
  sub_1000526D0();
  uint64_t v102 = sub_100053C70();
  uint64_t v103 = (uint64_t)v121;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v121, 1, 1, v102);
  *(void *)uint64_t v101 = &_swiftEmptyArrayStorage;
  (*(void (**)(char *, char *, uint64_t))(v119 + 32))(&v101[v98[5]], v22, v120);
  v101[v98[6]] = 0;
  sub_100052700();
  sub_100006AA8(v103, (uint64_t)&v101[v98[8]], &qword_100064778);
  sub_100053C00();
  sub_100012B64(qword_1000648E8, (void (*)(uint64_t))type metadata accessor for MultipleContactsEntry);
  os_signpost_id_t v104 = v122;
  sub_100053CD0();
  v134(v104);
  (*(void (**)(char *, uint64_t))(v123 + 8))(v104, v124);
  os_log_t v105 = v126;
  sub_100052760();
  uint64_t v106 = v141;
  uint64_t v107 = sub_100052790();
  os_signpost_type_t v108 = sub_100053F40();
  if (sub_100053F50())
  {
    uint64_t v109 = v117;
    uint64_t v110 = v116;
    uint64_t v111 = v118;
    (*(void (**)(char *, os_log_t, uint64_t))(v117 + 16))(v116, v105, v118);
    uint64_t v112 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v112 = 0;
    os_signpost_id_t v113 = sub_100052750();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v107, v108, v113, "getTimeline", "no contacts", v112, 2u);
    swift_slowDealloc();

    uint64_t v114 = *(void (**)(os_log_t, uint64_t))(v109 + 8);
    v114(v105, v111);
    (*(void (**)(char *, uint64_t))(v133 + 8))(v106, v140);
    return ((uint64_t (*)(char *, uint64_t))v114)(v110, v111);
  }
  else
  {

    (*(void (**)(os_log_t, uint64_t))(v117 + 8))(v105, v118);
    return (*(uint64_t (**)(char *, uint64_t))(v133 + 8))(v106, v140);
  }
}

uint64_t sub_10000A370()
{
  return _swift_task_switch(sub_10000A38C, 0, 0);
}

uint64_t sub_10000A38C()
{
  v0[2] = sub_100052A10();
  v0[3] = v1;
  sub_100053EA0();
  v0[4] = sub_100053E90();
  uint64_t v3 = sub_100053E70();
  return _swift_task_switch(sub_10000A428, v3, v2);
}

uint64_t sub_10000A428()
{
  swift_release();
  sub_100052C10();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A4A0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(char *), double a9, uint64_t a10, uint64_t a11)
{
  v149 = a8;
  uint64_t v147 = a7;
  uint64_t v139 = a6;
  uint64_t v122 = a4;
  LODWORD(v132) = a2;
  uint64_t v150 = a11;
  uint64_t v15 = sub_1000053FC(&qword_100064778);
  __chkstk_darwin(v15 - 8);
  v125 = (void (*)(char *, uint64_t))((char *)&v117 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v151 = sub_100052770();
  uint64_t v152 = *(void *)(v151 - 8);
  uint64_t v17 = __chkstk_darwin(v151);
  uint64_t v129 = (char *)&v117 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v161 = (char *)&v117 - v19;
  uint64_t v20 = sub_100052920();
  uint64_t v146 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v145 = (char *)&v117 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_100053BA0();
  uint64_t v143 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  uint64_t v142 = (char *)&v117 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100052930();
  uint64_t v159 = *(void *)(v23 - 8);
  uint64_t v160 = v23;
  __chkstk_darwin(v23);
  v158 = (char *)&v117 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000053FC(&qword_100064A08);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v123 = (uint64_t)&v117 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v133 = (uint64_t)&v117 - v28;
  uint64_t v29 = sub_1000053FC(&qword_100064A10);
  __chkstk_darwin(v29 - 8);
  uint64_t v124 = (char *)&v117 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100053C10();
  uint64_t v138 = *(void *)(v127 - 8);
  uint64_t v31 = __chkstk_darwin(v127);
  uint64_t v140 = (char *)&v117 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v137 = (char *)&v117 - v33;
  uint64_t v121 = sub_1000053FC(&qword_100064A18);
  uint64_t v120 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  uint64_t v119 = (char *)&v117 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_1000053FC(&qword_100064A20);
  uint64_t v126 = *(void *)(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v135 = (char *)&v117 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000527D0();
  uint64_t v153 = *(void *)(v36 - 8);
  uint64_t v37 = __chkstk_darwin(v36);
  int v39 = (char *)&v117 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v37);
  uint64_t v134 = (char *)&v117 - v41;
  __chkstk_darwin(v40);
  uint64_t v43 = (char *)&v117 - v42;
  uint64_t v44 = sub_1000526E0();
  uint64_t v162 = *(void *)(v44 - 8);
  uint64_t v45 = __chkstk_darwin(v44);
  uint64_t v130 = (char *)&v117 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v117 - v47;
  uint64_t v157 = sub_1000053FC(&qword_1000649E0);
  uint64_t v141 = *(void *)(v157 - 8);
  __chkstk_darwin(v157);
  v155 = (char *)&v117 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = v48;
  sub_1000526D0();
  uint64_t v154 = v44;
  uint64_t v148 = a10;
  if (v132)
  {
    unint64_t v132 = a5;
    double v164 = *(double *)&a1;
    swift_errorRetain();
    sub_1000053FC(&qword_100064A28);
    swift_willThrowTypedImpl();
    sub_100052910();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v62 = sub_1000527C0();
    os_log_type_t v63 = sub_100053F30();
    if (os_log_type_enabled(v62, v63))
    {
      id v64 = (uint8_t *)swift_slowAlloc();
      *(double *)&uint64_t v65 = COERCE_DOUBLE(swift_slowAlloc());
      uint64_t v131 = v36;
      double v164 = *(double *)&v65;
      uint64_t v128 = a3;
      *(_DWORD *)id v64 = 136315138;
      swift_getErrorValue();
      uint64_t v66 = sub_1000540F0();
      uint64_t v163 = sub_10002586C(v66, v67, (uint64_t *)&v164);
      uint64_t v44 = v154;
      a3 = v128;
      sub_100053F70();
      swift_bridgeObjectRelease();
      sub_100016618(a1, 1);
      sub_100016618(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "got failure fetching statuses for contactID's: %s", v64, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v153 + 8))(v39, v131);
    }
    else
    {
      sub_100016618(a1, 1);
      sub_100016618(a1, 1);

      (*(void (**)(char *, uint64_t))(v153 + 8))(v39, v36);
    }
    uint64_t v86 = a1;
    sub_1000053FC(&qword_100064A00);
    long long v87 = (int *)type metadata accessor for MultipleContactsEntry(0);
    unint64_t v88 = (*(unsigned __int8 *)(*((void *)v87 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v87 - 1) + 80);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_100054930;
    long long v90 = (uint64_t *)(v89 + v88);
    uint64_t v91 = v139;
    swift_bridgeObjectRetain();
    a5 = v132;
    uint64_t v92 = sub_10001576C(v132, v91);
    swift_bridgeObjectRelease();
    uint64_t v93 = (uint64_t)v125;
    sub_100053970();
    uint64_t v94 = sub_100053C70();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v93, 0, 1, v94);
    *long long v90 = v92;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))((char *)v90 + v87[5], v156, v44);
    *((unsigned char *)v90 + v87[6]) = 0;
    sub_100052700();
    sub_100006AA8(v93, (uint64_t)v90 + v87[8], &qword_100064778);
    sub_100053C00();
    sub_100012B64(qword_1000648E8, (void (*)(uint64_t))type metadata accessor for MultipleContactsEntry);
    sub_100053CD0();
    sub_100016618(v86, 1);
    uint64_t v95 = v149;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100052910();
    swift_bridgeObjectRetain_n();
    unint64_t v50 = sub_1000527C0();
    os_log_type_t v51 = sub_100053F30();
    BOOL v52 = os_log_type_enabled(v50, v51);
    uint64_t v128 = a3;
    uint64_t v118 = v20;
    uint64_t v131 = v36;
    if (v52)
    {
      unint64_t v132 = a5;
      BOOL v53 = (uint8_t *)swift_slowAlloc();
      double v164 = COERCE_DOUBLE(swift_slowAlloc());
      *(_DWORD *)BOOL v53 = 136315138;
      v125 = (void (*)(char *, uint64_t))(v53 + 4);
      swift_bridgeObjectRetain();
      uint64_t v54 = a1;
      uint64_t v55 = sub_100053E20();
      unint64_t v57 = v56;
      swift_bridgeObjectRelease();
      uint64_t v58 = v55;
      a1 = v54;
      a5 = v132;
      uint64_t v163 = sub_10002586C(v58, v57, (uint64_t *)&v164);
      sub_100053F70();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "got statuses for contactID's: %s", v53, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v59 = *(void (**)(char *, uint64_t))(v153 + 8);
      uint64_t v60 = v43;
      uint64_t v61 = v131;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v59 = *(void (**)(char *, uint64_t))(v153 + 8);
      uint64_t v60 = v43;
      uint64_t v61 = v36;
    }
    v125 = v59;
    v59(v60, v61);
    uint64_t v68 = v119;
    sub_100052990();
    uint64_t v69 = swift_allocObject();
    *(double *)(v69 + 16) = *(double *)&a1;
    uint64_t v70 = __chkstk_darwin(v69);
    *(&v117 - 2) = (uint64_t)sub_10001665C;
    *(&v117 - 1) = v70;
    __chkstk_darwin(v70);
    *(&v117 - 2) = (uint64_t)sub_100016664;
    *(&v117 - 1) = v71;
    sub_1000166E4();
    sub_100052D80();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v68, v121);
    swift_release();
    uint64_t v72 = sub_100052D70();
    uint64_t v73 = v139;
    swift_bridgeObjectRetain();
    id v74 = (double *)sub_100015448(v72, v73);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v75 = v133;
    sub_100052D60();
    uint64_t v76 = v123;
    sub_100016A1C(v75, v123, &qword_100064A08);
    uint64_t v77 = 1;
    uint64_t v78 = v154;
    int v79 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v162 + 48))(v76, 1, v154);
    uint64_t v80 = (uint64_t)v124;
    if (v79 != 1)
    {
      uint64_t v81 = v162;
      uint64_t v82 = v130;
      (*(void (**)(char *, uint64_t, uint64_t))(v162 + 32))(v130, v76, v78);
      sub_100053BE0();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v78);
      uint64_t v77 = 0;
    }
    uint64_t v83 = v138;
    uint64_t v84 = v127;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v138 + 56))(v80, v77, 1, v127);
    sub_100006918(v133, &qword_100064A08);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48))(v80, 1, v84) == 1)
    {
      unint64_t v85 = v137;
      sub_100053BF0();
      sub_100006918(v80, &qword_100064A10);
    }
    else
    {
      unint64_t v85 = v137;
      (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v137, v80, v84);
    }
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v140, v85, v84);
    type metadata accessor for MultipleContactsEntry(0);
    sub_100012B64(qword_1000648E8, (void (*)(uint64_t))type metadata accessor for MultipleContactsEntry);
    swift_bridgeObjectRetain();
    sub_100053CD0();
    os_log_type_t v96 = v130;
    sub_1000526D0();
    sub_1000526B0();
    double v98 = v97;
    (*(void (**)(char *, uint64_t))(v162 + 8))(v96, v78);
    sub_100052910();
    swift_bridgeObjectRetain();
    unint64_t v99 = sub_1000527C0();
    os_log_type_t v100 = sub_100053F30();
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = swift_slowAlloc();
      *(_DWORD *)uint64_t v101 = 134349312;
      double v102 = v74[2];
      swift_bridgeObjectRelease();
      double v164 = v102;
      sub_100053F70();
      swift_bridgeObjectRelease();
      *(_WORD *)(v101 + 12) = 2048;
      double v164 = v98 - a9;
      sub_100053F70();
      _os_log_impl((void *)&_mh_execute_header, v99, v100, "timeline created with %{public}ld entries elapsed %f", (uint8_t *)v101, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v95 = v149;
    uint64_t v20 = v118;
    v125(v134, v131);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v137, v84);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v135, v136);
    a3 = v128;
  }
  (*(void (**)(char *, void, uint64_t))(v159 + 104))(v158, enum case for PeopleAnalytics.WidgetType.multiple(_:), v160);
  sub_100053CE0();
  swift_bridgeObjectRelease();
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100054040();
    swift_bridgeObjectRelease();
  }
  sub_100052980();
  uint64_t v103 = v142;
  sub_100053C80();
  os_signpost_id_t v104 = v145;
  sub_100053B90();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v103, v144);
  os_log_t v105 = v158;
  sub_100052940();
  (*(void (**)(char *, uint64_t))(v146 + 8))(v104, v20);
  (*(void (**)(char *, uint64_t))(v159 + 8))(v105, v160);
  uint64_t v106 = v155;
  v95(v155);
  swift_bridgeObjectRetain();
  sub_100052760();
  uint64_t v107 = sub_100052790();
  os_signpost_type_t v108 = sub_100053F40();
  if (sub_100053F50())
  {
    uint64_t v109 = v152;
    uint64_t v110 = v129;
    uint64_t v111 = v161;
    uint64_t v112 = v151;
    (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v129, v161, v151);
    os_signpost_id_t v113 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_signpost_id_t v113 = 134217984;
    double v164 = *(double *)(a3 + 16);
    sub_100053F70();
    swift_bridgeObjectRelease();
    os_signpost_id_t v114 = sub_100052750();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v107, v108, v114, "getTimeline", "completed %ld contacts", v113, 0xCu);
    swift_slowDealloc();

    uint64_t v115 = *(void (**)(char *, uint64_t))(v109 + 8);
    v115(v111, v112);
    (*(void (**)(char *, uint64_t))(v162 + 8))(v156, v154);
    (*(void (**)(char *, uint64_t))(v141 + 8))(v106, v157);
    return ((uint64_t (*)(char *, uint64_t))v115)(v110, v112);
  }
  else
  {
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v152 + 8))(v161, v151);
    (*(void (**)(char *, uint64_t))(v162 + 8))(v156, v154);
    return (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v106, v157);
  }
}

void *sub_10000BA34(void *a1, uint64_t a2)
{
  id v3 = [a1 identifier];
  uint64_t v4 = sub_100053D30();
  uint64_t v6 = v5;

  if (*(void *)(a2 + 16) && (uint64_t v7 = sub_100035CD4(v4, v6), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void **)(*(void *)(a2 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000BAC4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v39 = a1;
  uint64_t v7 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100052C50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v38 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100052FB0();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = *(void *)(a2 + 16);
  if (v15)
  {
    v33[0] = v10;
    uint64_t v34 = a3;
    uint64_t v35 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = v9;
    uint64_t v37 = a4;
    uint64_t v16 = a2 + 32;
    v33[1] = a2;
    swift_bridgeObjectRetain();
    uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_100016744(v16, (uint64_t)v44);
      sub_100016744((uint64_t)v44, (uint64_t)v43);
      sub_1000053FC(&qword_100064A40);
      sub_1000053FC(&qword_100064A48);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v42 = 0;
        long long v40 = 0u;
        long long v41 = 0u;
      }
      sub_100010614((uint64_t)v44);
      if (*((void *)&v41 + 1))
      {
        sub_10001672C(&v40, (uint64_t)v43);
        sub_10001672C(v43, (uint64_t)&v40);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v17 = sub_10001366C(0, *((void *)v17 + 2) + 1, 1, v17);
        }
        unint64_t v19 = *((void *)v17 + 2);
        unint64_t v18 = *((void *)v17 + 3);
        if (v19 >= v18 >> 1) {
          uint64_t v17 = sub_10001366C((char *)(v18 > 1), v19 + 1, 1, v17);
        }
        *((void *)v17 + 2) = v19 + 1;
        sub_10001672C(&v40, (uint64_t)&v17[40 * v19 + 32]);
      }
      else
      {
        sub_100006918((uint64_t)&v40, &qword_100064A50);
      }
      v16 += 40;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v9 = v36;
    a3 = v34;
    uint64_t v10 = v33[0];
  }
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v38, enum case for ContactFormatter.Style.shortName(_:), v10);
  sub_100053D80();
  v44[3] = sub_100052C70();
  v44[4] = (uint64_t)&protocol witness table for ContactFormatter;
  sub_100006974(v44);
  sub_100052C60();
  id v20 = v39;
  sub_100052F80();
  id v21 = [v20 identifier];
  uint64_t v22 = sub_100053D30();
  uint64_t v24 = v23;

  if (*(void *)(a3 + 16) && (uint64_t v25 = sub_100035CD4(v22, v24), (v26 & 1) != 0))
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)(a3 + 56);
    uint64_t v29 = sub_100053AB0();
    uint64_t v30 = *(void *)(v29 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v9, v28 + *(void *)(v30 + 72) * v27, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v9, 0, 1, v29);
  }
  else
  {
    uint64_t v31 = sub_100053AB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v9, 1, 1, v31);
  }
  swift_bridgeObjectRelease();
  return sub_1000539E0();
}

uint64_t sub_10000BF84(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v27[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100052C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100052FB0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = *a1;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ContactFormatter.Style.shortName(_:), v7);
  id v13 = v12;
  sub_100053D80();
  v27[3] = sub_100052C70();
  v27[4] = (uint64_t)&protocol witness table for ContactFormatter;
  sub_100006974(v27);
  sub_100052C60();
  sub_100052F80();
  id v14 = [v13 identifier];
  uint64_t v15 = sub_100053D30();
  uint64_t v17 = v16;

  if (*(void *)(a2 + 16) && (uint64_t v18 = sub_100035CD4(v15, v17), (v19 & 1) != 0))
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)(a2 + 56);
    uint64_t v22 = sub_100053AB0();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v6, v21 + *(void *)(v23 + 72) * v20, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v6, 0, 1, v22);
  }
  else
  {
    uint64_t v24 = sub_100053AB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
  }
  swift_bridgeObjectRelease();
  return sub_1000539E0();
}

uint64_t sub_10000C2C0@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result = (uint64_t)sub_10004F550();
  if (v5)
  {
    sub_1000162D8(a1, a1[3]);
    uint64_t v6 = sub_100052EE0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_10000C360(uint64_t a1, void **a2, void *a3)
{
  v22[1] = a1;
  uint64_t v5 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100053AB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a2;
  sub_1000162D8(a3, a3[3]);
  sub_100053950();
  uint64_t result = sub_100052EC0();
  if (v14 >> 60 != 15)
  {
    uint64_t v15 = result;
    unint64_t v16 = v14;
    sub_1000167A8(result, v14);
    sub_100053A70();
    uint64_t v17 = sub_100053AA0();
    swift_release();
    if (v17)
    {
      id v18 = [v12 identifier];
      uint64_t v19 = sub_100053D30();
      uint64_t v21 = v20;

      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_10000C5B8((uint64_t)v7, v19, v21);
      sub_100016800(v15, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return sub_100016800(v15, v16);
    }
  }
  return result;
}

uint64_t sub_10000C5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100053AB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_100006918(a1, &qword_1000646E0);
    sub_1000138A0(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_100006918((uint64_t)v10, &qword_1000646E0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_100014040((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void *sub_10000C794(void *a1, void (*a2)(void **, id *), uint64_t a3, unint64_t a4)
{
  unint64_t v14 = a1;
  uint64_t v7 = a1;
  if (a4 >> 62) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_100054040())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v10 = (a4 & 0xC000000000000001) != 0 ? (id)sub_100054000() : *(id *)(a4 + 8 * i);
      uint64_t v7 = v10;
      uint64_t v11 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v10;
      a2(&v14, &v13);
      if (v4)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return v7;
      }

      if (v11 == v8)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000C8D4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for MultipleContactsEntry(0);
  sub_1000526D0();
  id v3 = (char *)a1 + *(int *)(v2 + 32);
  uint64_t v4 = sub_100053C70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *a1 = &_swiftEmptyArrayStorage;
  *((unsigned char *)a1 + *(int *)(v2 + 24)) = 1;
  return sub_100052700();
}

uint64_t sub_10000C988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000CA3C;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000CA3C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000CB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000175D8;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000CBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_1000526E0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10000CC54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100016A1C(v2 + *(int *)(a1 + 32), a2, &qword_100064778);
}

uint64_t sub_10000CC80()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100053BA0();
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v46 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v48 = (uint64_t)&v39 - v5;
  uint64_t v6 = type metadata accessor for MultipleContactsEntryView(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100053330();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  unint64_t v16 = (char *)&v39 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v39 - v17;
  uint64_t v19 = v0 + *(int *)(v6 + 28);
  sub_100024704((uint64_t)&v39 - v17);
  char v20 = sub_100053320();
  uint64_t v45 = v10;
  uint64_t v21 = v18;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v21, v9);
  uint64_t v47 = v1;
  sub_100012DE8(v1, (uint64_t)v8, type metadata accessor for MultipleContactsEntryView);
  if ((v20 & 1) == 0)
  {
    sub_100015C90((uint64_t)v8, type metadata accessor for MultipleContactsEntryView);
    uint64_t v24 = v48;
    goto LABEL_7;
  }
  uint64_t v39 = v19;
  long long v40 = (void (*)(uint64_t, uint64_t))v22;
  long long v41 = v16;
  uint64_t v42 = v13;
  uint64_t v43 = v9;
  uint64_t v23 = (uint64_t)v8;
  uint64_t v24 = v48;
  sub_1000246C8(v48);
  uint64_t v25 = v49;
  char v26 = *(void (**)(char *, void, uint64_t))(v49 + 104);
  uint64_t v27 = v46;
  uint64_t v44 = v6;
  uint64_t v28 = v50;
  v26(v46, enum case for WidgetFamily.systemMedium(_:), v50);
  sub_100012B64(&qword_100064700, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100053DF0();
  sub_100053DF0();
  uint64_t v30 = v51;
  uint64_t v29 = v52;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
  v31(v27, v28);
  v31((char *)v24, v28);
  sub_100015C90(v23, type metadata accessor for MultipleContactsEntryView);
  if (v29 != v30)
  {
LABEL_7:
    sub_1000246C8(v24);
    sub_100053B80();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v24, v50);
    return sub_100052850();
  }
  uint64_t v32 = (uint64_t)v41;
  sub_100024704((uint64_t)v41);
  uint64_t v34 = (uint64_t)v42;
  uint64_t v33 = v43;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v42, enum case for ContentSizeCategory.accessibilityLarge(_:), v43);
  BOOL v35 = sub_100015DE4(v32, v34);
  uint64_t v36 = v34;
  uint64_t v37 = v40;
  v40(v36, v33);
  v37(v32, v33);
  if (v35) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t sub_10000D0D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100053BA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v15 - v7;
  type metadata accessor for MultipleContactsEntryView(0);
  sub_1000246C8((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for WidgetFamily.systemMedium(_:), v2);
  sub_100012B64(&qword_100064700, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100053DF0();
  sub_100053DF0();
  uint64_t v10 = v15[0];
  uint64_t v9 = v15[1];
  uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v8, v2);
  if (v9 != v10) {
    return 1;
  }
  uint64_t v12 = *(void *)(*(void *)v1 + 16);
  uint64_t v13 = 2;
  if (v12 != sub_100052850()) {
    return 1;
  }
  return v13;
}

uint64_t sub_10000D2A4()
{
  uint64_t v1 = sub_1000053FC(&qword_1000649C8);
  __chkstk_darwin(v1 - 8);
  uint64_t v37 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for PersonEntryType(0);
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100053BA0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v33 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_10000CC80();
  sub_10000D72C(v13, v12);
  uint64_t v17 = sub_10001599C(v14, v15, v16);
  swift_unknownObjectRelease();
  uint64_t v38 = v17;
  LODWORD(v17) = *((unsigned __int8 *)v0 + *(int *)(type metadata accessor for MultipleContactsEntry(0) + 24));
  type metadata accessor for MultipleContactsEntryView(0);
  sub_1000246C8((uint64_t)v11);
  sub_100053B80();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  uint64_t v34 = v6;
  uint64_t v30 = v18;
  v18((uint64_t)v11, v6);
  if (v17 == 1) {
    sub_100052850();
  }
  else {
    sub_100052860();
  }
  uint64_t v19 = sub_1000539F0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v31 = v20 + 56;
  uint64_t v32 = v21;
  v21(v5, 1, 2, v19);
  sub_1000053FC(&qword_1000649D0);
  sub_100006BF0(&qword_1000649D8, &qword_1000649D0);
  uint64_t v22 = sub_100053EE0();
  sub_100015C90((uint64_t)v5, type metadata accessor for PersonEntryType);
  swift_bridgeObjectRelease();
  uint64_t v38 = v22;
  uint64_t v23 = v33;
  sub_1000246C8(v33);
  uint64_t v24 = v34;
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 88))(v23, v34);
  if (v25 != enum case for WidgetFamily.systemSmall(_:)
    && v25 != enum case for WidgetFamily.systemMedium(_:)
    && v25 != enum case for WidgetFamily.systemLarge(_:)
    && v25 != enum case for WidgetFamily.systemExtraLarge(_:)
    && v25 != enum case for WidgetFamily.accessoryCircular(_:)
    && v25 != enum case for WidgetFamily.accessoryRectangular(_:)
    && v25 != enum case for WidgetFamily.accessoryInline(_:))
  {
    v30(v23, v24);
  }
  uint64_t v26 = (uint64_t)v37;
  v32(v37, 2, 2, v19);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v26, 0, 1, v36);
  uint64_t v27 = sub_100053EF0();
  sub_100006918(v26, &qword_1000649C8);
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_10000D72C(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_1000539F0();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D7C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v19 = sub_100053410();
  uint64_t v2 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_100064900);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000053FC(&qword_100064908);
  uint64_t v8 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000053FC(&qword_100064910);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DAB8((uint64_t)v7);
  sub_100053400();
  uint64_t v22 = v1;
  sub_1000538E0();
  sub_100012BD0();
  sub_1000536B0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v19);
  sub_100006918((uint64_t)v7, &qword_100064900);
  uint64_t KeyPath = swift_getKeyPath();
  unint64_t v16 = (uint64_t *)&v14[*(int *)(v12 + 44)];
  uint64_t *v16 = KeyPath;
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v16 + *(int *)(type metadata accessor for TimeStampModifier(0) + 20)) = 0;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v10, v20);
  sub_100016A1C((uint64_t)v14, v21, &qword_100064910);
  return sub_100006918((uint64_t)v14, &qword_100064910);
}

uint64_t sub_10000DAB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v45 = sub_1000053FC(&qword_100064968);
  __chkstk_darwin(v45);
  uint64_t v46 = (uint64_t)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for MultipleContactsEntryView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000053FC(&qword_100064950);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1000053FC(&qword_100064940) - 8;
  __chkstk_darwin(v41);
  long long v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000053FC(&qword_100064930);
  uint64_t v11 = __chkstk_darwin(v44);
  uint64_t v42 = (uint64_t)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v43 = (uint64_t)&v38 - v13;
  *(void *)uint64_t v9 = sub_100053340();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v14 = sub_1000053FC(&qword_100064970);
  sub_10000E2BC(v1, (uint64_t)&v9[*(int *)(v14 + 44)], 16.0);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100012DE8(v1, (uint64_t)v6, type metadata accessor for MultipleContactsEntryView);
  sub_100053EA0();
  uint64_t v15 = sub_100053E90();
  unint64_t v16 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  *(void *)(v17 + 24) = &protocol witness table for MainActor;
  sub_100012E54((uint64_t)v6, v17 + v16, type metadata accessor for MultipleContactsEntryView);
  sub_100012DE8(v1, (uint64_t)v6, type metadata accessor for MultipleContactsEntryView);
  uint64_t v18 = sub_100053E90();
  uint64_t v19 = (uint64_t)v40;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  *(void *)(v20 + 24) = &protocol witness table for MainActor;
  sub_100012E54((uint64_t)v6, v20 + v16, type metadata accessor for MultipleContactsEntryView);
  sub_1000053FC(&qword_100064770);
  sub_100053850();
  long long v38 = v48;
  uint64_t v21 = v49;
  LOBYTE(v18) = v50;
  sub_100016A1C((uint64_t)v9, v19, &qword_100064950);
  uint64_t v22 = v19 + *(int *)(v41 + 44);
  *(void *)uint64_t v22 = KeyPath;
  *(_OWORD *)(v22 + 8) = v38;
  *(void *)(v22 + 24) = v21;
  *(unsigned char *)(v22 + 32) = v18;
  sub_100006918((uint64_t)v9, &qword_100064950);
  unsigned __int8 v23 = sub_100053460();
  unsigned __int8 v24 = sub_100053480();
  char v25 = sub_100053470();
  sub_100053470();
  if (sub_100053470() != v23) {
    char v25 = sub_100053470();
  }
  sub_100053470();
  if (sub_100053470() != v24) {
    char v25 = sub_100053470();
  }
  sub_100052FC0();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v34 = v42;
  sub_100016A1C(v19, v42, &qword_100064940);
  uint64_t v35 = v34 + *(int *)(v44 + 36);
  *(unsigned char *)uint64_t v35 = v25;
  *(void *)(v35 + 8) = v27;
  *(void *)(v35 + 16) = v29;
  *(void *)(v35 + 24) = v31;
  *(void *)(v35 + 32) = v33;
  *(unsigned char *)(v35 + 40) = 0;
  sub_100006918(v19, &qword_100064940);
  uint64_t v36 = v43;
  sub_100006AA8(v34, v43, &qword_100064930);
  sub_100016A1C(v36, v46, &qword_100064930);
  swift_storeEnumTagMultiPayload();
  sub_100012C4C();
  sub_100012CA0();
  sub_1000533D0();
  return sub_100006918(v36, &qword_100064930);
}

uint64_t sub_10000DFE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100053B40();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for MultipleContactsEntryView(0);
  sub_1000249F4((uint64_t)v8);
  if (sub_100052A20())
  {
    uint64_t v9 = sub_100053780();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    sub_100053B20();
    char v11 = sub_100053B10();
    uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
    v12(v6, v2);
    if (v11) {
      uint64_t v13 = sub_100053710();
    }
    else {
      uint64_t v13 = sub_100053720();
    }
    uint64_t v9 = v13;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v8, v2);
  }
  *a1 = v9;
  return result;
}

uint64_t sub_10000E16C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MultipleContactsEntryView(0);
  sub_1000053FC(&qword_100064978);
  uint64_t result = sub_1000537F0();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_10000E1F0(uint64_t result)
{
  if ((*(unsigned char *)(result + 8) & 1) == 0)
  {
    type metadata accessor for MultipleContactsEntryView(0);
    sub_1000053FC(&qword_100064978);
    sub_1000537F0();
    return sub_100053800();
  }
  return result;
}

uint64_t sub_10000E2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  v26[0] = a2;
  uint64_t v5 = type metadata accessor for MultipleContactsEntryView(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = sub_1000053FC(&qword_100064980);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v26 - v13;
  uint64_t v15 = sub_10000D2A4();
  uint64_t v16 = sub_1000148D8(v15);
  swift_bridgeObjectRelease();
  v26[1] = v16;
  swift_getKeyPath();
  sub_100012DE8(a1, (uint64_t)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MultipleContactsEntryView);
  unint64_t v17 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = swift_allocObject();
  sub_100012E54((uint64_t)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17, type metadata accessor for MultipleContactsEntryView);
  *(double *)(v18 + ((v7 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_100014DB8;
  *(void *)(v19 + 24) = v18;
  sub_1000053FC(&qword_100064988);
  sub_1000053FC(&qword_100064990);
  sub_100006BF0(&qword_100064998, &qword_100064988);
  sub_100006BF0(&qword_1000649A0, &qword_100064990);
  sub_100053870();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v20(v12, v14, v8);
  uint64_t v21 = v26[0];
  *(double *)v26[0] = a3;
  *(unsigned char *)(v21 + 8) = 0;
  uint64_t v22 = v21;
  uint64_t v23 = sub_1000053FC(&qword_1000649A8);
  v20((char *)(v22 + *(int *)(v23 + 48)), v12, v8);
  unsigned __int8 v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v24)(v12, v8);
}

uint64_t sub_10000E62C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v37 = a1;
  uint64_t v39 = a3;
  uint64_t v38 = sub_100052710();
  uint64_t v6 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for MultipleContactsRowView();
  uint64_t v10 = (int *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)&v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1000053FC(&qword_1000649B0);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = &v33[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v19 = &v33[-v18];
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_10000D0D0();
  uint64_t v20 = (uint64_t *)(a2 + *(int *)(type metadata accessor for MultipleContactsEntryView(0) + 32));
  uint64_t v21 = *v20;
  char v22 = *((unsigned char *)v20 + 8);
  uint64_t v23 = v20[2];
  uint64_t v40 = v21;
  char v41 = v22;
  uint64_t v42 = v23;
  sub_1000053FC(&qword_100064978);
  sub_1000537F0();
  uint64_t v35 = v43;
  int v34 = v44;
  uint64_t v24 = type metadata accessor for MultipleContactsEntry(0);
  uint64_t v25 = v38;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, a2 + *(int *)(v24 + 28), v38);
  *uint64_t v12 = swift_getKeyPath();
  sub_1000053FC(&qword_100064590);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = (char *)v12 + v10[7];
  uint64_t v27 = enum case for Font.TextStyle.caption2(_:);
  uint64_t v28 = sub_100053530();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v26, v27, v28);
  *(uint64_t *)((char *)v12 + v10[8]) = v37;
  *(uint64_t *)((char *)v12 + v10[9]) = v36;
  uint64_t v29 = (char *)v12 + v10[10];
  *(void *)uint64_t v29 = v35;
  v29[8] = v34;
  *(uint64_t *)((char *)v12 + v10[11]) = 2;
  (*(void (**)(char *, unsigned char *, uint64_t))(v6 + 32))((char *)v12 + v10[12], v8, v25);
  sub_100012DE8((uint64_t)v12, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  *(void *)&v17[*(int *)(v14 + 44)] = 0x3FF0000000000000;
  sub_100015C90((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for MultipleContactsRowView);
  sub_100006AA8((uint64_t)v17, (uint64_t)v19, &qword_1000649B0);
  sub_100016A1C((uint64_t)v19, (uint64_t)v17, &qword_1000649B0);
  uint64_t v30 = v39;
  sub_100016A1C((uint64_t)v17, v39, &qword_1000649B0);
  uint64_t v31 = v30 + *(int *)(sub_1000053FC(&qword_1000649B8) + 48);
  *(double *)uint64_t v31 = a4;
  *(unsigned char *)(v31 + 8) = 0;
  sub_100006918((uint64_t)v19, &qword_1000649B0);
  return sub_100006918((uint64_t)v17, &qword_1000649B0);
}

uint64_t sub_10000E9E0()
{
  sub_1000053FC(&qword_100064718);
  uint64_t v0 = sub_100053BA0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100054940;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for WidgetFamily.systemMedium(_:), v0);
  v6(v5 + v2, enum case for WidgetFamily.systemLarge(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 2 * v2, enum case for WidgetFamily.systemExtraLarge(_:), v0);
  qword_100067458 = v4;
  return result;
}

ValueMetadata *type metadata accessor for MultipleContactsWidgetConfiguration()
{
  return &type metadata for MultipleContactsWidgetConfiguration;
}

uint64_t sub_10000EB28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000EB44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v41 = sub_100053B50();
  uint64_t v40 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v38 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000053FC(&qword_100064720);
  uint64_t v31 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_100064728);
  uint64_t v32 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1000053FC(&qword_100064730);
  uint64_t v33 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000053FC(&qword_100064738);
  uint64_t v36 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  int v34 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100052A10();
  uint64_t v11 = sub_100052BE0();
  uint64_t v12 = sub_100052BD0();
  uint64_t v49 = v11;
  char v50 = &protocol witness table for ContactFetcher;
  *(void *)&long long v48 = v12;
  uint64_t v46 = sub_100052730();
  uint64_t v47 = &protocol witness table for Locale;
  sub_100006974((uint64_t *)&v45);
  sub_100052720();
  sub_100052810();
  if (sub_100052800())
  {
    uint64_t v13 = sub_100052DD0();
    swift_allocObject();
    uint64_t v14 = sub_100052DC0();
    uint64_t v15 = &protocol witness table for DemoStatusProvider;
  }
  else
  {
    uint64_t v13 = sub_100052C30();
    uint64_t v14 = sub_100052C20();
    uint64_t v15 = &protocol witness table for StatusProvider;
  }
  unsigned __int8 v44 = v15;
  uint64_t v43 = v13;
  *(void *)&long long v42 = v14;
  sub_1000527F0();
  sub_100052DB0();
  swift_allocObject();
  uint64_t v16 = sub_100052DA0();
  sub_10001672C(&v48, (uint64_t)&v51);
  sub_10001672C(&v45, (uint64_t)&v55);
  sub_10001672C(&v42, (uint64_t)v56);
  uint64_t v57 = v16;
  type metadata accessor for MultipleContactsEntryView(0);
  sub_100012B64(&qword_100064740, (void (*)(uint64_t))type metadata accessor for MultipleContactsEntryView);
  sub_10000F4F4();
  sub_100053BD0();
  uint64_t v51 = sub_100053D80();
  uint64_t v52 = v17;
  uint64_t v18 = sub_100006BF0(&qword_100064750, &qword_100064720);
  unint64_t v19 = sub_1000068C4();
  sub_100053390();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v2);
  *(void *)&long long v48 = sub_100053D80();
  *((void *)&v48 + 1) = v20;
  uint64_t v51 = v2;
  uint64_t v52 = &type metadata for String;
  uint64_t v53 = v18;
  unint64_t v54 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100053350();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v5);
  if (qword_100064540 != -1) {
    swift_once();
  }
  uint64_t v51 = v5;
  uint64_t v52 = &type metadata for String;
  uint64_t v53 = OpaqueTypeConformance2;
  unint64_t v54 = v19;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v34;
  uint64_t v24 = v35;
  sub_100053360();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v24);
  uint64_t v25 = v40;
  uint64_t v26 = v38;
  uint64_t v27 = v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v38, enum case for WidgetBackgroundStyle.blur(_:), v41);
  uint64_t v51 = v24;
  uint64_t v52 = (void *)v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v37;
  sub_1000533A0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v23, v28);
}

uint64_t sub_10000F290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000053FC(&qword_100064758);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (void *)((char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for MultipleContactsEntry(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012DE8(a1, (uint64_t)v9, type metadata accessor for MultipleContactsEntry);
  *uint64_t v6 = swift_getKeyPath();
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  sub_100012E54((uint64_t)v9, a2, type metadata accessor for MultipleContactsEntry);
  uint64_t v10 = (int *)type metadata accessor for MultipleContactsEntryView(0);
  uint64_t v11 = v10[5];
  sub_100052BE0();
  *(void *)(a2 + v11) = sub_100052BD0();
  uint64_t v12 = (uint64_t *)(a2 + v10[6]);
  *uint64_t v12 = swift_getKeyPath();
  sub_1000053FC(&qword_100064590);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (uint64_t *)(a2 + v10[7]);
  *uint64_t v13 = swift_getKeyPath();
  sub_1000053FC(&qword_100064768);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = a2 + v10[8];
  v19[1] = 0;
  char v20 = 1;
  sub_1000053FC(&qword_100064770);
  sub_1000537E0();
  char v15 = v22;
  uint64_t v16 = v23;
  *(void *)uint64_t v14 = v21;
  *(unsigned char *)(v14 + 8) = v15;
  *(void *)(v14 + 16) = v16;
  sub_100006AA8((uint64_t)v6, a2 + v10[9], &qword_100064758);
  uint64_t v17 = a2 + v10[10];
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v17 = result;
  *(unsigned char *)(v17 + 8) = 0;
  return result;
}

uint64_t type metadata accessor for MultipleContactsEntryView(uint64_t a1)
{
  return sub_100014EF8(a1, (uint64_t *)&unk_100064888);
}

unint64_t sub_10000F4F4()
{
  unint64_t result = qword_100064748;
  if (!qword_100064748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064748);
  }
  return result;
}

uint64_t type metadata accessor for MultipleContactsEntry(uint64_t a1)
{
  return sub_100014EF8(a1, (uint64_t *)&unk_1000647D8);
}

uint64_t sub_10000F568()
{
  return sub_100053200();
}

uint64_t sub_10000F594()
{
  return sub_100053200();
}

uint64_t sub_10000F5C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100053190();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000F5F0()
{
  return sub_1000531A0();
}

void *sub_10000F618(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000526E0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *((unsigned char *)v7 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v14 = (char *)v7 + v13;
    char v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)v7 + v17;
    unint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100053C70();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_1000053FC(&qword_100064778);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return v7;
}

uint64_t sub_10000F834(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = sub_100053C70();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

void *sub_10000F990(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000526E0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100053C70();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = sub_1000053FC(&qword_100064778);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

void *sub_10000FB60(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100053C70();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v12)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_1000053FC(&qword_100064778);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

void *sub_10000FD8C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100053C70();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_1000053FC(&qword_100064778);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

void *sub_10000FF40(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100053C70();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v12)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_1000053FC(&qword_100064778);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_100010160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010174);
}

uint64_t sub_100010174(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1000526E0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_9;
  }
  uint64_t v14 = sub_1000053FC(&qword_100064778);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[8]];

  return v15(v17, a2, v16);
}

uint64_t sub_1000102F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010304);
}

char *sub_100010304(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1000526E0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_7;
  }
  uint64_t v14 = sub_1000053FC(&qword_100064778);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[8]];

  return (char *)v15(v17, a2, a2, v16);
}

void sub_100010480()
{
  sub_1000526E0();
  if (v0 <= 0x3F)
  {
    sub_100052710();
    if (v1 <= 0x3F)
    {
      sub_100012968(319, (unint64_t *)&unk_1000647E8, (uint64_t (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t destroy for MultipleContactsProvider(uint64_t a1)
{
  sub_100010614(a1);
  sub_100010614(a1 + 40);
  sub_100010614(a1 + 80);

  return swift_release();
}

uint64_t sub_100010614(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for MultipleContactsProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for MultipleContactsProvider(uint64_t *a1, uint64_t *a2)
{
  a1[15] = a2[15];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_1000107C8(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *int v3 = v12;
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
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
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
          *int v3 = *a2;
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

__n128 initializeWithTake for MultipleContactsProvider(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for MultipleContactsProvider(uint64_t a1, uint64_t a2)
{
  sub_100010614(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_100010614(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_100010614(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MultipleContactsProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MultipleContactsProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultipleContactsProvider()
{
  return &type metadata for MultipleContactsProvider;
}

void *sub_100010B50(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    long long v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    long long v7 = a1;
    uint64_t v8 = (int *)type metadata accessor for MultipleContactsEntry(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)v7 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1000526E0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *((unsigned char *)v7 + v8[6]) = *((unsigned char *)a2 + v8[6]);
    uint64_t v14 = v8[7];
    uint64_t v15 = (char *)v7 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = v8[8];
    uint64_t v19 = (char *)v7 + v18;
    int v20 = (char *)a2 + v18;
    uint64_t v21 = sub_100053C70();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_1000053FC(&qword_100064778);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    uint64_t v24 = a3[6];
    *(void *)((char *)v7 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v25 = (void *)((char *)v7 + v24);
    uint64_t v26 = (void *)((char *)a2 + v24);
    swift_retain();
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_100053BA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *uint64_t v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = a3[7];
    uint64_t v29 = (void *)((char *)v7 + v28);
    uint64_t v30 = (void *)((char *)a2 + v28);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    }
    else
    {
      *uint64_t v29 = *v30;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = a3[8];
    uint64_t v33 = a3[9];
    int v34 = (char *)v7 + v32;
    uint64_t v35 = (char *)a2 + v32;
    *(void *)int v34 = *(void *)v35;
    v34[8] = v35[8];
    *((void *)v34 + 2) = *((void *)v35 + 2);
    uint64_t v36 = (void *)((char *)v7 + v33);
    uint64_t v37 = (void *)((char *)a2 + v33);
    swift_retain();
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v38 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    }
    else
    {
      *uint64_t v36 = *v37;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = a3[10];
    uint64_t v40 = (char *)v7 + v39;
    uint64_t v41 = (char *)a2 + v39;
    uint64_t v42 = *(void *)v41;
    char v43 = v41[8];
    sub_100010F84(*(void *)v41, v43);
    *(void *)uint64_t v40 = v42;
    v40[8] = v43;
  }
  return v7;
}

uint64_t sub_100010F84(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100010F90(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v5 = a1 + v4[5];
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + v4[7];
  uint64_t v8 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + v4[8];
  uint64_t v10 = sub_100053C70();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_release();
  uint64_t v12 = a1 + a2[6];
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = a1 + a2[7];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100053330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v16 = a1 + a2[9];
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100053B40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  uint64_t v18 = a1 + a2[10];
  uint64_t v19 = *(void *)v18;
  char v20 = *(unsigned char *)(v18 + 8);

  return sub_100011254(v19, v20);
}

uint64_t sub_100011254(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *sub_100011260(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000526E0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *((unsigned char *)a1 + v6[6]) = *((unsigned char *)a2 + v6[6]);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = v6[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_100053C70();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_1000053FC(&qword_100064778);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  swift_retain();
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_100053BA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  }
  else
  {
    void *v23 = *v24;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = a3[7];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = sub_100053330();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
  }
  else
  {
    *uint64_t v27 = *v28;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = a3[8];
  uint64_t v31 = a3[9];
  uint64_t v32 = (char *)a1 + v30;
  uint64_t v33 = (char *)a2 + v30;
  *(void *)uint64_t v32 = *(void *)v33;
  v32[8] = v33[8];
  *((void *)v32 + 2) = *((void *)v33 + 2);
  int v34 = (void *)((char *)a1 + v31);
  uint64_t v35 = (void *)((char *)a2 + v31);
  swift_retain();
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = sub_100053B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  }
  else
  {
    *int v34 = *v35;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v37 = a3[10];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = *(void *)v39;
  char v41 = v39[8];
  sub_100010F84(*(void *)v39, v41);
  *(void *)uint64_t v38 = v40;
  v38[8] = v41;
  return a1;
}

void *sub_100011648(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *((unsigned char *)a1 + v6[6]) = *((unsigned char *)a2 + v6[6]);
  uint64_t v11 = v6[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100053C70();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    uint64_t v23 = sub_1000053FC(&qword_100064778);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_7:
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v24 = a3[6];
    uint64_t v25 = (void *)((char *)a1 + v24);
    uint64_t v26 = (void *)((char *)a2 + v24);
    sub_100006918((uint64_t)a1 + v24, &qword_100064590);
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_100053BA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *uint64_t v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = a3[7];
    uint64_t v29 = (void *)((char *)a1 + v28);
    uint64_t v30 = (void *)((char *)a2 + v28);
    sub_100006918((uint64_t)a1 + v28, &qword_100064768);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    }
    else
    {
      *uint64_t v29 = *v30;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v32 = a3[8];
  uint64_t v33 = (char *)a1 + v32;
  int v34 = (char *)a2 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  *((void *)v33 + 2) = *((void *)v34 + 2);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v36 = a3[9];
    uint64_t v37 = (void *)((char *)a1 + v36);
    uint64_t v38 = (void *)((char *)a2 + v36);
    sub_100006918((uint64_t)a1 + v36, &qword_100064760);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v39 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
    }
    else
    {
      *uint64_t v37 = *v38;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v40 = a3[10];
  char v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = *(void *)v42;
  char v44 = v42[8];
  sub_100010F84(*(void *)v42, v44);
  uint64_t v45 = *(void *)v41;
  char v46 = v41[8];
  *(void *)char v41 = v43;
  v41[8] = v44;
  sub_100011254(v45, v46);
  return a1;
}

void *sub_100011AFC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *((unsigned char *)a1 + v6[6]) = *((unsigned char *)a2 + v6[6]);
  uint64_t v11 = v6[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100053C70();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = sub_1000053FC(&qword_100064778);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v21 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  int v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_100053BA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[7];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_100053330();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  uint64_t v31 = a3[8];
  uint64_t v32 = a3[9];
  uint64_t v33 = (char *)a1 + v31;
  int v34 = (char *)a2 + v31;
  *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
  *((void *)v33 + 2) = *((void *)v34 + 2);
  uint64_t v35 = (char *)a1 + v32;
  uint64_t v36 = (char *)a2 + v32;
  uint64_t v37 = sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = sub_100053B40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  uint64_t v39 = a3[10];
  uint64_t v40 = (char *)a1 + v39;
  char v41 = (char *)a2 + v39;
  *(void *)uint64_t v40 = *(void *)v41;
  v40[8] = v41[8];
  return a1;
}

void *sub_100011EE4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000526E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *((unsigned char *)a1 + v6[6]) = *((unsigned char *)a2 + v6[6]);
  uint64_t v11 = v6[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100053C70();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    uint64_t v23 = sub_1000053FC(&qword_100064778);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_7:
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v24 = a3[6];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    sub_100006918((uint64_t)a1 + v24, &qword_100064590);
    uint64_t v27 = sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_100053BA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
    uint64_t v29 = a3[7];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    sub_100006918((uint64_t)a1 + v29, &qword_100064768);
    uint64_t v32 = sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_100053330();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v30, v31, v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
  }
  uint64_t v34 = a3[8];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  *(void *)uint64_t v35 = *(void *)v36;
  v35[8] = v36[8];
  *((void *)v35 + 2) = *((void *)v36 + 2);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v37 = a3[9];
    uint64_t v38 = (char *)a1 + v37;
    uint64_t v39 = (char *)a2 + v37;
    sub_100006918((uint64_t)a1 + v37, &qword_100064760);
    uint64_t v40 = sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v41 = sub_100053B40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 32))(v38, v39, v41);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
    }
  }
  uint64_t v42 = a3[10];
  uint64_t v43 = (char *)a1 + v42;
  char v44 = (char *)a2 + v42;
  uint64_t v45 = *(void *)v44;
  LOBYTE(v44) = v44[8];
  uint64_t v46 = *(void *)v43;
  char v47 = v43[8];
  *(void *)uint64_t v43 = v45;
  v43[8] = (char)v44;
  sub_100011254(v46, v47);
  return a1;
}

uint64_t sub_1000123A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000123B8);
}

uint64_t sub_1000123B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  uint64_t v13 = sub_1000053FC(&qword_100064598);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a3[6];
LABEL_11:
    uint64_t v10 = a1 + v15;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_12;
  }
  uint64_t v16 = sub_1000053FC(&qword_100064828);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a3[7];
    goto LABEL_11;
  }
  uint64_t v17 = sub_1000053FC(&qword_100064758);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a3[9];

  return v18(v20, a2, v19);
}

uint64_t sub_100012590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000125A4);
}

uint64_t sub_1000125A4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for MultipleContactsEntry(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_1000053FC(&qword_100064598);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_9:
    uint64_t v12 = a1 + v15;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_1000053FC(&qword_100064828);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = sub_1000053FC(&qword_100064758);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[9];

  return v18(v20, a2, a2, v19);
}

void sub_10001277C()
{
  type metadata accessor for MultipleContactsEntry(319);
  if (v0 <= 0x3F)
  {
    sub_100012968(319, (unint64_t *)&qword_100064608, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_100012968(319, (unint64_t *)&qword_100064898, (uint64_t (*)(uint64_t))&type metadata accessor for ContentSizeCategory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F)
      {
        sub_100012968(319, (unint64_t *)&qword_1000648A0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_100012968(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1000129CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012B1C()
{
  return sub_100012B64(qword_1000648E8, (void (*)(uint64_t))type metadata accessor for MultipleContactsEntry);
}

uint64_t sub_100012B64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012BAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012BC8@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000DFE8(a1);
}

unint64_t sub_100012BD0()
{
  unint64_t result = qword_100064918;
  if (!qword_100064918)
  {
    sub_100005440(&qword_100064900);
    sub_100012C4C();
    sub_100012CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064918);
  }
  return result;
}

unint64_t sub_100012C4C()
{
  unint64_t result = qword_100064920;
  if (!qword_100064920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064920);
  }
  return result;
}

unint64_t sub_100012CA0()
{
  unint64_t result = qword_100064928;
  if (!qword_100064928)
  {
    sub_100005440(&qword_100064930);
    sub_100012D1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064928);
  }
  return result;
}

unint64_t sub_100012D1C()
{
  unint64_t result = qword_100064938;
  if (!qword_100064938)
  {
    sub_100005440(&qword_100064940);
    sub_100006BF0(&qword_100064948, &qword_100064950);
    sub_100006BF0(&qword_100064958, &qword_100064960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064938);
  }
  return result;
}

uint64_t sub_100012DE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012E54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012EBC@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MultipleContactsEntryView(0);

  return sub_10000E16C(a1);
}

uint64_t sub_100012F34()
{
  unint64_t v1 = (int *)type metadata accessor for MultipleContactsEntryView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v0 + v3 + v6[5];
  uint64_t v8 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + v6[7];
  uint64_t v10 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + v3 + v6[8];
  uint64_t v12 = sub_100053C70();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_release();
  uint64_t v14 = v5 + v1[6];
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[7];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100053330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v18 = v5 + v1[9];
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_100053B40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  sub_100011254(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100013280(uint64_t a1)
{
  type metadata accessor for MultipleContactsEntryView(0);

  return sub_10000E1F0(a1);
}

char *sub_1000132F4(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000053FC(&qword_100064A68);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_100014F30(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013404(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000053FC(&qword_100064A78);
  uint64_t v10 = *(void *)(sub_1000539F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_100054030();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1000539F0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100015134(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_10001366C(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000053FC(&qword_100064A58);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100015024(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100013790(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000053FC(&qword_100064A70);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100015CF0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000138A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100035CD4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100014270();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_100053AB0();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_100013E30(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
    size_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_100053AB0();
    size_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_100013A48(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_100053AB0();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  long long v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_1000053FC(&qword_100064A60);
  int v47 = a2;
  uint64_t v8 = sub_100054060();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  char v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  size_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_100054100();
    sub_100053D50();
    uint64_t result = sub_100054110();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_100013E30(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100053FA0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_100054100();
        swift_bridgeObjectRetain();
        sub_100053D50();
        Swift::Int v9 = sub_100054110();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_100053AB0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
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
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
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

uint64_t sub_100014040(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100035CD4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100014270();
      goto LABEL_7;
    }
    sub_100013A48(v15, a4 & 1);
    uint64_t v26 = sub_100035CD4(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1000540E0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_100053AB0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_1000141C0(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000141C0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_100053AB0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_100014270()
{
  uint64_t v35 = sub_100053AB0();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000053FC(&qword_100064A60);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_100054050();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

size_t sub_100014534(uint64_t a1)
{
  uint64_t v43 = sub_1000053FC(&qword_100064698);
  uint64_t v2 = __chkstk_darwin(v43);
  long long v48 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  int v47 = (void *)((char *)v41 - v5);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v41 - v6;
  uint64_t v49 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v46 = v10;
  v41[0] = a1;
  if (v10)
  {
    uint64_t v42 = (v9 + 32) & ~v9;
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage + v42;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(type metadata accessor for PersonEntryType(0) - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    char v44 = v7;
    uint64_t v45 = v17;
    v41[1] = v9 | 7;
    unint64_t v18 = &_swiftEmptyArrayStorage;
    uint64_t v19 = v43;
    while (1)
    {
      uint64_t v21 = (uint64_t)&v48[*(int *)(v19 + 48)];
      sub_100012DE8(v16, v21, type metadata accessor for PersonEntryType);
      uint64_t v22 = (uint64_t)v47;
      uint64_t v23 = (uint64_t)v47 + *(int *)(v19 + 48);
      void *v47 = v13;
      sub_100012E54(v21, v23, type metadata accessor for PersonEntryType);
      size_t result = sub_100006AA8(v22, (uint64_t)v7, &qword_100064698);
      if (v14)
      {
        uint64_t v11 = v18;
        BOOL v20 = __OFSUB__(v14--, 1);
        if (v20) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v25 = v18[3];
        if ((uint64_t)((v25 >> 1) + 0x4000000000000000) < 0)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
        int64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v26;
        }
        sub_1000053FC(&qword_100064B28);
        uint64_t v28 = *(void *)(v49 + 72);
        uint64_t v29 = v42;
        uint64_t v11 = (void *)swift_allocObject();
        size_t result = j__malloc_size(v11);
        if (!v28) {
          goto LABEL_34;
        }
        int64_t v30 = result - v29;
        if (result - v29 == 0x8000000000000000 && v28 == -1) {
          goto LABEL_35;
        }
        uint64_t v32 = v30 / v28;
        v11[2] = v27;
        v11[3] = 2 * (v30 / v28);
        uint64_t v33 = (char *)v11 + v29;
        uint64_t v34 = v18[3] >> 1;
        uint64_t v35 = v34 * v28;
        if (v18[2])
        {
          if (v11 < v18 || v33 >= (char *)v18 + v42 + v35)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v18)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v18[2] = 0;
        }
        uint64_t v12 = &v33[v35];
        uint64_t v37 = (v32 & 0x7FFFFFFFFFFFFFFFLL) - v34;
        swift_release();
        uint64_t v19 = v43;
        BOOL v20 = __OFSUB__(v37, 1);
        uint64_t v14 = v37 - 1;
        if (v20)
        {
LABEL_27:
          __break(1u);
          break;
        }
      }
      ++v13;
      uint64_t v7 = v44;
      sub_100006AA8((uint64_t)v44, (uint64_t)v12, &qword_100064698);
      v12 += *(void *)(v49 + 72);
      v16 += v45;
      unint64_t v18 = v11;
      if (v46 == v13) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v38 = v11[3];
  if (v38 >= 2)
  {
    unint64_t v39 = v38 >> 1;
    BOOL v20 = __OFSUB__(v39, v14);
    uint64_t v40 = v39 - v14;
    if (v20) {
      goto LABEL_36;
    }
    v11[2] = v40;
  }
  return (size_t)v11;
}

uint64_t sub_1000148D8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v3 = result;
    size_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = (void *)((char *)&_swiftEmptyArrayStorage + 32);
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        size_t result = swift_bridgeObjectRetain();
        BOOL v8 = __OFSUB__(v4--, 1);
        if (v8) {
          goto LABEL_30;
        }
      }
      else
      {
        unint64_t v9 = v2[3];
        if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_31;
        }
        int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
        if (v10 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v10;
        }
        sub_1000053FC(&qword_1000649C0);
        uint64_t v12 = (void *)swift_allocObject();
        int64_t v13 = j__malloc_size(v12);
        uint64_t v14 = v13 - 32;
        if (v13 < 32) {
          uint64_t v14 = v13 - 17;
        }
        uint64_t v15 = v14 >> 4;
        v12[2] = v11;
        v12[3] = 2 * (v14 >> 4);
        uint64_t v16 = v12 + 4;
        uint64_t v17 = v2[3] >> 1;
        uint64_t v6 = &v12[2 * v17 + 4];
        uint64_t v18 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
        if (v2[2])
        {
          if (v12 != v2 || v16 >= &v2[2 * v17 + 4]) {
            memmove(v16, v2 + 4, 16 * v17);
          }
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        size_t result = swift_release();
        uint64_t v2 = v12;
        BOOL v8 = __OFSUB__(v18, 1);
        uint64_t v4 = v18 - 1;
        if (v8)
        {
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
      }
      *uint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        size_t result = swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_26:
  unint64_t v20 = v2[3];
  if (v20 >= 2)
  {
    unint64_t v21 = v20 >> 1;
    BOOL v8 = __OFSUB__(v21, v4);
    uint64_t v22 = v21 - v4;
    if (v8) {
      goto LABEL_32;
    }
    v2[2] = v22;
  }
  return (uint64_t)v2;
}

uint64_t sub_100014A68()
{
  uint64_t v1 = (int *)type metadata accessor for MultipleContactsEntryView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for MultipleContactsEntry(0);
  uint64_t v7 = v0 + v3 + v6[5];
  uint64_t v8 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + v6[7];
  uint64_t v10 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + v3 + v6[8];
  uint64_t v12 = sub_100053C70();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_release();
  uint64_t v14 = v5 + v1[6];
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[7];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100053330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v18 = v5 + v1[9];
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_100053B40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  sub_100011254(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100014DB8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MultipleContactsEntryView(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  double v7 = *(double *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10000E62C(a1, v2 + v6, a2, v7);
}

uint64_t sub_100014E6C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014EA4(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t type metadata accessor for PersonEntryType(uint64_t a1)
{
  return sub_100014EF8(a1, (uint64_t *)&unk_100064AF0);
}

uint64_t sub_100014EF8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014F30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_100015024(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1000053FC(&qword_100064A48);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_100015134(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1000539F0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

unint64_t *sub_10001528C(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3)
{
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v17 = sub_1000539F0();
  uint64_t v5 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  double v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v16 = v3;
    unint64_t v20 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000303F4(0, v8, 0);
    uint64_t v9 = v20;
    uint64_t v10 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v11 = *v10;
      id v12 = (id)*(v10 - 1);
      swift_bridgeObjectRetain();
      v18(v12, v11);
      swift_bridgeObjectRelease();

      unint64_t v20 = v9;
      unint64_t v14 = v9[2];
      unint64_t v13 = v9[3];
      if (v14 >= v13 >> 1)
      {
        sub_1000303F4(v13 > 1, v14 + 1, 1);
        uint64_t v9 = v20;
      }
      v9[2] = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v14, v7, v17);
      v10 += 2;
      --v8;
    }
    while (v8);
  }
  return v9;
}

void *sub_100015448(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a2;
  uint64_t v3 = type metadata accessor for MultipleContactsEntry(0);
  uint64_t v20 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (unint64_t **)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v6 = *(void *)(a1 + 16);
  double v7 = &_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v22 = &_swiftEmptyArrayStorage;
    sub_100030430(0, v6, 0);
    uint64_t v8 = *(void *)(sub_1000053FC(&qword_100064A38) - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v19 = *(void *)(v8 + 72);
    do
    {
      uint64_t v10 = sub_100052D20();
      uint64_t v11 = __chkstk_darwin(v10);
      *(&v18 - 2) = v21;
      id v12 = sub_10001528C(v11, (void (*)(id, uint64_t))sub_100016724, (uint64_t)(&v18 - 4));
      swift_bridgeObjectRelease();
      sub_100052D10();
      unint64_t v13 = (char *)v5 + *(int *)(v3 + 32);
      sub_100052D30();
      sub_100053930();
      sub_100052D40();
      sub_100053C60();
      uint64_t v14 = sub_100053C70();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
      *uint64_t v5 = v12;
      *((unsigned char *)v5 + *(int *)(v3 + 24)) = 0;
      sub_100052700();
      double v7 = v22;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100030430(0, v7[2] + 1, 1);
        double v7 = v22;
      }
      unint64_t v16 = v7[2];
      unint64_t v15 = v7[3];
      if (v16 >= v15 >> 1)
      {
        sub_100030430(v15 > 1, v16 + 1, 1);
        double v7 = v22;
      }
      v7[2] = v16 + 1;
      sub_100012E54((uint64_t)v5, (uint64_t)v7+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v16, type metadata accessor for MultipleContactsEntry);
      v9 += v19;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_10001576C(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v19 = a2;
  uint64_t v18 = sub_1000539F0();
  uint64_t v5 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  double v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v8) {
      return (uint64_t)v9;
    }
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = sub_1000303F4(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    uint64_t v11 = 0;
    uint64_t v9 = v21;
    v16[1] = v5 + 32;
    unint64_t v17 = a1 & 0xC000000000000001;
    while (v8 != v11)
    {
      if (v17) {
        id v12 = (id)sub_100054000();
      }
      else {
        id v12 = *(id *)(a1 + 8 * v11 + 32);
      }
      unint64_t v13 = v12;
      uint64_t v20 = v12;
      sub_10000BF84(&v20, v19);
      if (v3)
      {
        swift_release();

        return (uint64_t)v9;
      }
      uint64_t v3 = 0;

      uint64_t v21 = v9;
      unint64_t v15 = v9[2];
      unint64_t v14 = v9[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000303F4(v14 > 1, v15 + 1, 1);
        uint64_t v9 = v21;
      }
      ++v11;
      v9[2] = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15, v7, v18);
      if (v8 == v11) {
        return (uint64_t)v9;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100054040();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10001599C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v24 = a1;
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v22 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PersonEntryType(0);
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t result = __chkstk_darwin(v9 - 8);
  id v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v25 = a3 >> 1;
  uint64_t v26 = a2;
  uint64_t v13 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v14 = &_swiftEmptyArrayStorage;
  if (!v13) {
    return (uint64_t)v14;
  }
  uint64_t v27 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_10003046C(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v15 = 0;
    v21[3] = v7 + 56;
    v21[4] = v7 + 16;
    v21[1] = v3;
    v21[2] = v7 + 8;
    while (1)
    {
      uint64_t v16 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      if (v26 + v15 >= v25 || v15 >= v13) {
        goto LABEL_15;
      }
      unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
      uint64_t v18 = v22;
      v17(v22, v24 + *(void *)(v7 + 72) * (v26 + v15), v6);
      v17(v12, (uint64_t)v18, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 2, v6);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
      unint64_t v14 = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10003046C(0, v14[2] + 1, 1);
        unint64_t v14 = v27;
      }
      unint64_t v20 = v14[2];
      unint64_t v19 = v14[3];
      if (v20 >= v19 >> 1)
      {
        sub_10003046C(v19 > 1, v20 + 1, 1);
        unint64_t v14 = v27;
      }
      v14[2] = v20 + 1;
      uint64_t result = sub_100012E54((uint64_t)v12, (uint64_t)v14+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(void *)(v23 + 72) * v20, type metadata accessor for PersonEntryType);
      ++v15;
      if (v16 == v13) {
        return (uint64_t)v14;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_100015C90(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100015CF0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

BOOL sub_100015DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = sub_100053330();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a2, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = enum case for ContentSizeCategory.extraSmall(_:);
  if (v12 != enum case for ContentSizeCategory.extraSmall(_:))
  {
    if (v12 == enum case for ContentSizeCategory.small(_:))
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == enum case for ContentSizeCategory.medium(_:))
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == enum case for ContentSizeCategory.large(_:)) {
      goto LABEL_7;
    }
    if (v12 == enum case for ContentSizeCategory.extraLarge(_:))
    {
      unint64_t v13 = 4;
    }
    else if (v12 == enum case for ContentSizeCategory.extraExtraLarge(_:))
    {
      unint64_t v13 = 5;
    }
    else if (v12 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
    {
      unint64_t v13 = 6;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityMedium(_:))
    {
      unint64_t v13 = 7;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityLarge(_:))
    {
      unint64_t v13 = 8;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
    {
      unint64_t v13 = 9;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == enum case for ContentSizeCategory.small(_:))
  {
    unint64_t v16 = 1;
  }
  else if (v15 == enum case for ContentSizeCategory.medium(_:))
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != enum case for ContentSizeCategory.large(_:))
    {
      if (v15 == enum case for ContentSizeCategory.extraLarge(_:))
      {
        unint64_t v16 = 4;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.extraExtraLarge(_:))
      {
        unint64_t v16 = 5;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
      {
        unint64_t v16 = 6;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityMedium(_:))
      {
        unint64_t v16 = 7;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityLarge(_:))
      {
        unint64_t v16 = 8;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
      {
        unint64_t v16 = 9;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
      {
        unint64_t v16 = 10;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        unint64_t v16 = 11;
        return v13 < v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 < v16;
}

uint64_t sub_1000161FC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016234()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000175D8;
  return _swift_task_switch(sub_10000A38C, 0, 0);
}

void *sub_1000162D8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001631C(uint64_t a1, void **a2)
{
  return sub_10000C360(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100016338(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100016370()
{
  uint64_t v1 = sub_100053C90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 176) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_1000527A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_bridgeObjectRelease();
  sub_100010614(v0 + 24);
  sub_100010614(v0 + 64);
  sub_100010614(v0 + 104);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_100016510(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(sub_100053C90() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 176) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_1000527A0() - 8);
  return sub_10000A4A0(a1, v4, *(void *)(v2 + 16), v2 + 24, *(void *)(v2 + 152), *(void *)(v2 + 160), v2 + v6, *(void (**)(char *))(v2 + v7), *(double *)(v2 + 168), *(void *)(v2 + v7 + 8), v2 + ((v7 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)));
}

uint64_t sub_100016618(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100016624()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void *sub_10001665C(void *a1)
{
  return sub_10000BA34(a1, *(void *)(v1 + 16));
}

void *sub_100016664()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 16))();
  uint64_t v2 = sub_10000902C(v1, (void (*)(BOOL, uint64_t, uint64_t))sub_100031F80);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1000166B8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_1000166E4()
{
  unint64_t result = qword_100064A30;
  if (!qword_100064A30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100064A30);
  }
  return result;
}

uint64_t sub_100016724@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000BAC4(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_10001672C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100016744(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000167A8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100016800(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100016814(a1, a2);
  }
  return a1;
}

uint64_t sub_100016814(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001686C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000C2C0(*(void **)(v1 + 16), a1);
}

uint64_t sub_100016888()
{
  uint64_t v1 = sub_1000527A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 184) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010614(v0 + 32);
  sub_100010614(v0 + 72);
  sub_100010614(v0 + 112);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001698C(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  sub_1000527A0();
  return sub_100007D9C(a1, v4, *(void **)(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(void *)(v2 + 160), *(void (**)(void *))(v2 + 168), *(void *)(v2 + 176));
}

uint64_t sub_100016A1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000053FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100016A80(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_1000539F0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_100016BCC(uint64_t a1)
{
  uint64_t v2 = sub_1000539F0();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 2, v2);
  if (!result)
  {
    char v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_100016C9C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_100016DAC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *sub_100016F20(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_100017030(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1000171A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000171B8);
}

uint64_t sub_1000171B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000539F0();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_100017224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100017238);
}

uint64_t sub_100017238(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_1000172BC(uint64_t a1)
{
  uint64_t v2 = sub_1000539F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_100017328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000539F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

uint64_t sub_100017398()
{
  uint64_t result = sub_1000539F0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unint64_t sub_100017414()
{
  unint64_t result = qword_100064B00;
  if (!qword_100064B00)
  {
    sub_100005440(&qword_100064B08);
    sub_100017490();
    sub_100017584();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B00);
  }
  return result;
}

unint64_t sub_100017490()
{
  unint64_t result = qword_100064B10;
  if (!qword_100064B10)
  {
    sub_100005440(&qword_100064910);
    sub_100005440(&qword_100064900);
    sub_100012BD0();
    swift_getOpaqueTypeConformance2();
    sub_100012B64(&qword_100064B18, (void (*)(uint64_t))type metadata accessor for TimeStampModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B10);
  }
  return result;
}

unint64_t sub_100017584()
{
  unint64_t result = qword_100064B20;
  if (!qword_100064B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B20);
  }
  return result;
}

uint64_t sub_1000175DC(uint64_t a1, void **a2)
{
  return sub_10001631C(a1, a2);
}

void *sub_1000175F4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000526E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
    uint64_t v9 = v8[5];
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100052BC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = v8[6];
    int v14 = (char *)a1 + v13;
    int v15 = (char *)a2 + v13;
    uint64_t v16 = sub_1000539F0();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = sub_1000053FC(&qword_1000646A8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
    uint64_t v20 = v8[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = v8[9];
    int64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = sub_100053C70();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = sub_1000053FC(&qword_100064778);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    *((unsigned char *)a1 + v8[10]) = *((unsigned char *)a2 + v8[10]);
    uint64_t v30 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v31 = (void *)((char *)a1 + v30);
    uint64_t v32 = (void *)((char *)a2 + v30);
    swift_retain();
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_100053BA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    }
    else
    {
      *uint64_t v31 = *v32;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v34 = a3[7];
    uint64_t v35 = (void *)((char *)a1 + v34);
    uint64_t v36 = (void *)((char *)a2 + v34);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    }
    else
    {
      *uint64_t v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v38 = a3[8];
    unint64_t v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = *(void *)v40;
    uint64_t v42 = *((void *)v40 + 1);
    uint64_t v43 = *((void *)v40 + 2);
    uint64_t v44 = *((void *)v40 + 3);
    char v45 = v40[32];
    sub_100017AB8(*(void *)v40, v42, v43, v44, v45);
    *(void *)unint64_t v39 = v41;
    *((void *)v39 + 1) = v42;
    *((void *)v39 + 2) = v43;
    *((void *)v39 + 3) = v44;
    v39[32] = v45;
  }
  return a1;
}

uint64_t type metadata accessor for SingleContactTimelineEntry(uint64_t a1)
{
  return sub_100014EF8(a1, (uint64_t *)&unk_100064C28);
}

uint64_t sub_100017AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100017AC4(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v6 = a1 + v5[5];
  uint64_t v7 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + v5[6];
  uint64_t v9 = sub_1000539F0();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = a1 + v5[8];
  uint64_t v12 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + v5[9];
  uint64_t v14 = sub_100053C70();
  uint64_t v15 = *(void *)(v14 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  swift_release();
  uint64_t v16 = a1 + a2[6];
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100053BA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  uint64_t v18 = a1 + a2[7];
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_100053B40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  uint64_t v20 = a1 + a2[8];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *(void *)(v20 + 8);
  uint64_t v23 = *(void *)(v20 + 16);
  uint64_t v24 = *(void *)(v20 + 24);
  char v25 = *(unsigned char *)(v20 + 32);

  return sub_100017DBC(v21, v22, v23, v24, v25);
}

uint64_t sub_100017DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100017DC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_1000539F0();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_1000053FC(&qword_1000646A8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  uint64_t v18 = v7[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = v7[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_100053C70();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = sub_1000053FC(&qword_100064778);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 16))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v28 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  swift_retain();
  sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v31 = sub_100053BA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
  }
  else
  {
    *uint64_t v29 = *v30;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = a3[7];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v35 = sub_100053B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
  }
  else
  {
    *uint64_t v33 = *v34;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v36 = a3[8];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)v38;
  uint64_t v40 = *(void *)(v38 + 8);
  uint64_t v41 = *(void *)(v38 + 16);
  uint64_t v42 = *(void *)(v38 + 24);
  char v43 = *(unsigned char *)(v38 + 32);
  sub_100017AB8(*(void *)v38, v40, v41, v42, v43);
  *(void *)uint64_t v37 = v39;
  *(void *)(v37 + 8) = v40;
  *(void *)(v37 + 16) = v41;
  *(void *)(v37 + 24) = v42;
  *(unsigned char *)(v37 + 32) = v43;
  return a1;
}

uint64_t sub_10001821C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  *(unsigned char *)(a1 + v6[7]) = *(unsigned char *)(a2 + v6[7]);
  uint64_t v20 = v6[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = v6[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_100053C70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    uint64_t v32 = a3;
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v32 = a3;
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
LABEL_12:
    uint64_t v33 = sub_1000053FC(&qword_100064778);
    memcpy(v25, v26, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_13:
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  *(void *)(a1 + v32[5]) = *(void *)(a2 + v32[5]);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v34 = v32[6];
    uint64_t v35 = (void *)(a1 + v34);
    uint64_t v36 = (void *)(a2 + v34);
    sub_100006918(a1 + v34, &qword_100064590);
    sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_100053BA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    }
    else
    {
      *uint64_t v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v38 = v32[7];
    uint64_t v39 = (void *)(a1 + v38);
    uint64_t v40 = (void *)(a2 + v38);
    sub_100006918(a1 + v38, &qword_100064760);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v41 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
    }
    else
    {
      *uint64_t v39 = *v40;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v42 = v32[8];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  uint64_t v45 = *(void *)v44;
  uint64_t v46 = *(void *)(v44 + 8);
  uint64_t v47 = *(void *)(v44 + 16);
  uint64_t v48 = *(void *)(v44 + 24);
  char v49 = *(unsigned char *)(v44 + 32);
  sub_100017AB8(*(void *)v44, v46, v47, v48, v49);
  uint64_t v50 = *(void *)v43;
  uint64_t v51 = *(void *)(v43 + 8);
  uint64_t v52 = *(void *)(v43 + 16);
  uint64_t v53 = *(void *)(v43 + 24);
  char v54 = *(unsigned char *)(v43 + 32);
  *(void *)uint64_t v43 = v45;
  *(void *)(v43 + 8) = v46;
  *(void *)(v43 + 16) = v47;
  *(void *)(v43 + 24) = v48;
  *(unsigned char *)(v43 + 32) = v49;
  sub_100017DBC(v50, v51, v52, v53, v54);
  return a1;
}

uint64_t sub_100018788(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_1000539F0();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_1000053FC(&qword_1000646A8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  uint64_t v18 = v7[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = v7[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_100053C70();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = sub_1000053FC(&qword_100064778);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v28 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v29 = (void *)(a1 + v28);
  int v30 = (const void *)(a2 + v28);
  uint64_t v31 = sub_1000053FC(&qword_100064590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_100053BA0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  uint64_t v33 = a3[7];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  uint64_t v36 = sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v37 = sub_100053B40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v37 - 8) + 32))(v34, v35, v37);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
  }
  uint64_t v38 = a3[8];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  long long v41 = *(_OWORD *)(v40 + 16);
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
  *(_OWORD *)(v39 + 16) = v41;
  *(unsigned char *)(v39 + 32) = *(unsigned char *)(v40 + 32);
  return a1;
}

uint64_t sub_100018BD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  *(unsigned char *)(a1 + v6[7]) = *(unsigned char *)(a2 + v6[7]);
  uint64_t v20 = v6[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  uint64_t v24 = v6[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_100053C70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    uint64_t v32 = a3;
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v32 = a3;
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
LABEL_12:
    uint64_t v33 = sub_1000053FC(&qword_100064778);
    memcpy(v25, v26, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v25, v26, v27);
LABEL_13:
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  *(void *)(a1 + v32[5]) = *(void *)(a2 + v32[5]);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v34 = v32[6];
    uint64_t v35 = (void *)(a1 + v34);
    uint64_t v36 = (const void *)(a2 + v34);
    sub_100006918(a1 + v34, &qword_100064590);
    uint64_t v37 = sub_1000053FC(&qword_100064590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v38 = sub_100053BA0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    uint64_t v39 = v32[7];
    uint64_t v40 = (void *)(a1 + v39);
    long long v41 = (const void *)(a2 + v39);
    sub_100006918(a1 + v39, &qword_100064760);
    uint64_t v42 = sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = sub_100053B40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v40, v41, v43);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
  }
  uint64_t v44 = v32[8];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  char v47 = *(unsigned char *)(v46 + 32);
  uint64_t v48 = *(void *)v45;
  uint64_t v49 = *(void *)(v45 + 8);
  uint64_t v50 = *(void *)(v45 + 16);
  uint64_t v51 = *(void *)(v45 + 24);
  char v52 = *(unsigned char *)(v45 + 32);
  long long v53 = *(_OWORD *)(v46 + 16);
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(_OWORD *)(v45 + 16) = v53;
  *(unsigned char *)(v45 + 32) = v47;
  sub_100017DBC(v48, v49, v50, v51, v52);
  return a1;
}

uint64_t sub_10001912C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019140);
}

uint64_t sub_100019140(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = sub_1000053FC(&qword_100064598);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = sub_1000053FC(&qword_100064758);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1000192C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000192DC);
}

uint64_t sub_1000192DC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_1000053FC(&qword_100064598);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = sub_1000053FC(&qword_100064758);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[7];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for SingleContactWidgetEntryView(uint64_t a1)
{
  return sub_100014EF8(a1, qword_100064B88);
}

void sub_100019484()
{
  type metadata accessor for SingleContactTimelineEntry(319);
  if (v0 <= 0x3F)
  {
    sub_10001AE5C(319, (unint64_t *)&qword_100064608, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_10001AE5C(319, (unint64_t *)&qword_1000648A0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void *sub_1000195FC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000526E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100052BC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_1000539F0();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = sub_1000053FC(&qword_1000646A8);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v19 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_100053C70();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_1000053FC(&qword_100064778);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  }
  return a1;
}

uint64_t sub_100019920(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = sub_1000539F0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[9];
  uint64_t v13 = sub_100053C70();
  uint64_t v16 = *(void *)(v13 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v13);
  if (!result)
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
    return v15(v12, v13);
  }
  return result;
}

uint64_t sub_100019B34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = sub_100053C70();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = sub_1000053FC(&qword_100064778);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100019E08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_100053C70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 24))(v25, v26, v27);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    uint64_t v32 = sub_1000053FC(&qword_100064778);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 16))(v25, v26, v27);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
LABEL_13:
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001A1A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = sub_100053C70();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = sub_1000053FC(&qword_100064778);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001A474(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100052BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_100053C70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v25, v26, v27);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    uint64_t v32 = sub_1000053FC(&qword_100064778);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v25, v26, v27);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
LABEL_13:
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001A808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A81C);
}

uint64_t sub_10001A81C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000526E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_13:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100052BC0();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_12:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_13;
  }
  uint64_t v14 = sub_1000053FC(&qword_1000646A8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_12;
  }
  if (a2 == 254)
  {
    unsigned int v15 = *(unsigned __int8 *)(a1 + a3[7]);
    if (v15 >= 2) {
      return ((v15 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  uint64_t v17 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
  {
    uint64_t v8 = v17;
    uint64_t v12 = *(void *)(v17 - 8);
    uint64_t v13 = a3[8];
    goto LABEL_12;
  }
  uint64_t v18 = sub_1000053FC(&qword_100064778);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a3[9];

  return v19(v21, a2, v20);
}

uint64_t sub_10001AA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001AA5C);
}

uint64_t sub_10001AA5C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1000526E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_12:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100052BC0();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_11:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_12;
  }
  uint64_t result = sub_1000053FC(&qword_1000646A8);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[6];
    goto LABEL_11;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7]) = a2 + 1;
    return result;
  }
  uint64_t v17 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_11;
  }
  uint64_t v18 = sub_1000053FC(&qword_100064778);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[9];

  return v19(v21, a2, a2, v20);
}

void sub_10001AC78()
{
  sub_1000526E0();
  if (v0 <= 0x3F)
  {
    sub_100052BC0();
    if (v1 <= 0x3F)
    {
      sub_10001AE5C(319, (unint64_t *)&qword_100064C38, (uint64_t (*)(uint64_t))&type metadata accessor for PersonInfo, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F)
      {
        sub_100052710();
        if (v3 <= 0x3F)
        {
          sub_10001AE5C(319, (unint64_t *)&unk_1000647E8, (uint64_t (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_10001AE5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t *sub_10001AEC0(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v6 = type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v10)
  {
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000304A8(0, v10, 0);
    uint64_t v11 = v21;
    uint64_t v12 = *(void *)(sub_100052D00() - 8);
    uint64_t v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v18 = *(void *)(v12 + 72);
    while (1)
    {
      v19(v13);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v21 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000304A8(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v21;
      }
      v11[2] = v15 + 1;
      sub_1000261E0((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v15, type metadata accessor for SingleContactTimelineEntry);
      v13 += v18;
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_10001B0BC(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_100052770();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  sub_1000053FC(&qword_1000646E0);
  v3[11] = swift_task_alloc();
  uint64_t v5 = sub_100052E50();
  v3[12] = v5;
  v3[13] = *(void *)(v5 - 8);
  v3[14] = swift_task_alloc();
  sub_1000053FC(&qword_100064E18);
  v3[15] = swift_task_alloc();
  uint64_t v6 = sub_1000527D0();
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v7 = sub_1000527A0();
  v3[21] = v7;
  v3[22] = *(void *)(v7 - 8);
  v3[23] = swift_task_alloc();
  return _swift_task_switch(sub_10001B320, 0, 0);
}

uint64_t sub_10001B320()
{
  unint64_t v67 = v0;
  sub_100052910();
  sub_100052780();
  sub_100052910();
  unint64_t v1 = sub_1000527C0();
  os_log_type_t v2 = sub_100053F30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Snapshot requested for single contact widget", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[13];

  int64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v4, v5);
  sub_100052BA0();
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v12 = v0[15];
  if (v11)
  {
    sub_100006918(v0[15], &qword_100064E18);
LABEL_11:
    uint64_t v29 = v0 + 10;
    sub_100052760();
    int v30 = sub_100052790();
    os_signpost_type_t v31 = sub_100053F40();
    if (sub_100053F50())
    {
      uint64_t v32 = v0[10];
      uint64_t v29 = v0 + 9;
      uint64_t v33 = v0[7];
      uint64_t v34 = v0[8];
      (*(void (**)(void, uint64_t, uint64_t))(v34 + 16))(v0[9], v32, v33);
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      os_signpost_id_t v36 = sub_100052750();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, v31, v36, "getSnapshot", "no contact", v35, 2u);
      swift_slowDealloc();

      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v37(v32, v33);
    }
    else
    {
      uint64_t v38 = v0[8];

      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    }
    uint64_t v39 = *v29;
    uint64_t v41 = v0[22];
    uint64_t v40 = v0[23];
    uint64_t v42 = v0[21];
    uint64_t v43 = v0[4];
    uint64_t v44 = v0[5];
    v37(v39, v0[7]);
    sub_1000526D0();
    uint64_t v45 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
    uint64_t v46 = v43 + v45[5];
    uint64_t v47 = sub_100052BC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 16))(v46, v44, v47);
    uint64_t v48 = v43 + v45[6];
    uint64_t v49 = sub_1000539F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 1, 1, v49);
    uint64_t v50 = v43 + v45[9];
    uint64_t v51 = sub_100053C70();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 1, 1, v51);
    *(unsigned char *)(v43 + v45[7]) = 0;
    sub_100052700();
    *(unsigned char *)(v43 + v45[10]) = 0;
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v52 = (uint64_t (*)(void))v0[1];
    return v52();
  }
  uint64_t v13 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v15 = v0[12];
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 16))(v14, v0[15], v15);
  sub_100006918(v12, &qword_100064E18);
  uint64_t v16 = sub_100052E40();
  unint64_t v18 = v17;
  v0[24] = v17;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_100052E30();
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  if (!v21)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v65 = v16;
  uint64_t v22 = (void *)v0[6];
  sub_1000162D8(v22, v22[3]);
  uint64_t v23 = sub_100052EE0();
  v0[25] = v23;
  if (!v23)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v24 = v23;
  sub_100052910();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_1000527C0();
  os_log_type_t type = sub_100053F30();
  BOOL v26 = os_log_type_enabled(v25, type);
  uint64_t v27 = v0[18];
  uint64_t v64 = v0[16];
  if (v26)
  {
    log = v25;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_10002586C(v65, v18, &v66);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_10002586C(v19, v21, &v66);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, log, type, "get snapshot for single contact widget with appEntityID: %s, contactID: %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v10(v27, v64);
  uint64_t v54 = v0[23];
  uint64_t v55 = v0[11];
  uint64_t v57 = v0[5];
  unint64_t v56 = (void *)v0[6];
  sub_1000162D8(v56, v22[3]);
  sub_100052ED0();
  uint64_t v58 = (void *)swift_task_alloc();
  v0[26] = v58;
  v58[2] = v56;
  v58[3] = v24;
  v58[4] = v57;
  v58[5] = v55;
  v58[6] = v65;
  v58[7] = v18;
  v58[8] = v54;
  uint64_t v59 = (void *)swift_task_alloc();
  v0[27] = v59;
  uint64_t v60 = type metadata accessor for SingleContactTimelineEntry(0);
  *uint64_t v59 = v0;
  v59[1] = sub_10001BAD0;
  uint64_t v61 = v0[4];
  return withCheckedContinuation<A>(isolation:function:_:)(v61, 0, 0, 0xD000000000000011, 0x800000010005DC00, sub_100027134, v58, v60);
}

uint64_t sub_10001BAD0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001BC04, 0, 0);
}

uint64_t sub_10001BC04()
{
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 88);

  sub_100006918(v4, &qword_1000646E0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10001BD0C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = a8;
  uint64_t v57 = a7;
  uint64_t v56 = a6;
  uint64_t v50 = a5;
  uint64_t v49 = a4;
  uint64_t v43 = a3;
  uint64_t v45 = a1;
  uint64_t v61 = sub_1000527A0();
  uint64_t v58 = *(void *)(v61 - 8);
  uint64_t v52 = *(void *)(v58 + 64);
  __chkstk_darwin(v61);
  uint64_t v60 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000053FC(&qword_1000646E0);
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v44 = *(void *)(v46 + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v59 = (uint64_t)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100052BC0();
  uint64_t v41 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  uint64_t v42 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000053FC(&qword_100064E60);
  uint64_t v40 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016744(a2 + 80, (uint64_t)&v64);
  uint64_t v54 = v65;
  uint64_t v55 = v66;
  long long v53 = sub_1000162D8(&v64, v65);
  id v20 = [a3 identifier];
  uint64_t v48 = sub_100053D30();
  uint64_t v47 = v21;

  sub_100026AE0(a2, (uint64_t)v62);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v45, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v49, v13);
  sub_100016A1C(v50, v59, &qword_1000646E0);
  uint64_t v22 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v60, v51, v61);
  unint64_t v23 = (*(unsigned __int8 *)(v17 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v24 = (v18 + *(unsigned __int8 *)(v14 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v25 = (v15 + *(unsigned __int8 *)(v46 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  unint64_t v26 = (v44 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (*(unsigned __int8 *)(v22 + 80) + v26 + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v28 = swift_allocObject();
  long long v29 = v62[7];
  *(_OWORD *)(v28 + 112) = v62[6];
  *(_OWORD *)(v28 + 128) = v29;
  uint64_t v30 = v63;
  long long v31 = v62[3];
  *(_OWORD *)(v28 + 48) = v62[2];
  *(_OWORD *)(v28 + 64) = v31;
  long long v32 = v62[5];
  *(_OWORD *)(v28 + 80) = v62[4];
  *(_OWORD *)(v28 + 96) = v32;
  long long v33 = v62[1];
  *(_OWORD *)(v28 + 16) = v62[0];
  *(_OWORD *)(v28 + 32) = v33;
  uint64_t v34 = v43;
  *(void *)(v28 + 144) = v30;
  *(void *)(v28 + 152) = v34;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v28 + v23, v19, v40);
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v28 + v24, v42, v41);
  sub_100006AA8(v59, v28 + v25, &qword_1000646E0);
  uint64_t v35 = (void *)(v28 + v26);
  uint64_t v36 = v57;
  *uint64_t v35 = v56;
  v35[1] = v36;
  (*(void (**)(unint64_t, char *, uint64_t))(v58 + 32))(v28 + v27, v60, v61);
  id v37 = v34;
  swift_bridgeObjectRetain();
  sub_100052EF0();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100010614((uint64_t)&v64);
}

uint64_t sub_10001C294(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v111 = a8;
  uint64_t v106 = a7;
  uint64_t v112 = a6;
  uint64_t v113 = a5;
  id v90 = a4;
  LODWORD(v92) = a2;
  uint64_t v12 = sub_100052770();
  uint64_t v115 = *(void *)(v12 - 8);
  uint64_t v116 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  long long v87 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  os_signpost_id_t v114 = (char *)&v86 - v15;
  uint64_t v16 = sub_1000053FC(&qword_100064E48);
  __chkstk_darwin(v16 - 8);
  uint64_t v107 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000053FC(&qword_100064778);
  __chkstk_darwin(v18 - 8);
  os_signpost_type_t v108 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v20 - 8);
  uint64_t v99 = (uint64_t)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v22 - 8);
  os_log_t v105 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100052BC0();
  uint64_t v101 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  os_log_type_t v100 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = type metadata accessor for SingleContactTimelineEntry(0);
  __chkstk_darwin(v104);
  uint64_t v103 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100052C50();
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v95 = (char *)&v86 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_100052FB0();
  uint64_t v110 = *(void *)(v117 - 8);
  uint64_t v27 = __chkstk_darwin(v117);
  os_log_type_t v96 = (char *)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v30 = (void (*)(char *, char *, uint64_t))((char *)&v86 - v29);
  uint64_t v31 = sub_1000527D0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v86 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  id v37 = (char *)&v86 - v36;
  uint64_t v38 = sub_1000526E0();
  uint64_t v39 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v41 = (char *)&v86 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = a3;
  uint64_t v97 = v39;
  uint64_t v89 = v31;
  uint64_t v88 = v32;
  if (v92)
  {
    v124[0] = a1;
    swift_errorRetain();
    sub_1000053FC(&qword_100064A28);
    swift_willThrowTypedImpl();
    sub_100052910();
    swift_errorRetain();
    sub_1000527B0();
    sub_100016618(a1, 1);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v37, v31);
    sub_100016618(a1, 1);
    uint64_t v43 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v42 = swift_bridgeObjectRetain();
    sub_100009014(v42);
    sub_100016618(a1, 0);
    sub_1000526D0();
    uint64_t v43 = (void *)sub_100052D50();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
  }
  uint64_t v92 = a10;
  uint64_t v91 = a9;
  sub_100052910();
  id v44 = v90;
  swift_bridgeObjectRetain_n();
  id v45 = v44;
  uint64_t v46 = sub_1000527C0();
  os_log_type_t v47 = sub_100053F30();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v119 = v30;
  uint64_t v98 = v38;
  uint64_t v118 = v41;
  id v90 = v45;
  if (v48)
  {
    uint64_t v49 = swift_slowAlloc();
    v124[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v49 = 136315394;
    id v50 = [v45 identifier];
    uint64_t v51 = sub_100053D30();
    uint64_t v86 = v35;
    uint64_t v52 = v51;
    unint64_t v54 = v53;

    *(void *)&long long v123 = sub_10002586C(v52, v54, v124);
    sub_100053F70();

    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1000053FC(&qword_100064A40);
    uint64_t v55 = sub_100053E20();
    unint64_t v57 = v56;
    swift_bridgeObjectRelease();
    *(void *)&long long v123 = sub_10002586C(v55, v57, v124);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Creating snapshot for contact %s with statues %s", (uint8_t *)v49, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v30 = v119;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v88 + 8))(v86, v89);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v35, v89);
  }
  uint64_t v58 = v43[2];
  if (v58)
  {
    uint64_t v59 = (uint64_t)(v43 + 4);
    swift_bridgeObjectRetain();
    uint64_t v60 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_100016744(v59, (uint64_t)v124);
      sub_100016744((uint64_t)v124, (uint64_t)&v123);
      sub_1000053FC(&qword_100064A40);
      sub_1000053FC(&qword_100064A48);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v122 = 0;
        long long v120 = 0u;
        long long v121 = 0u;
      }
      sub_100010614((uint64_t)v124);
      if (*((void *)&v121 + 1))
      {
        sub_10001672C(&v120, (uint64_t)&v123);
        sub_10001672C(&v123, (uint64_t)&v120);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v60 = sub_10001366C(0, *((void *)v60 + 2) + 1, 1, v60);
        }
        unint64_t v62 = *((void *)v60 + 2);
        unint64_t v61 = *((void *)v60 + 3);
        if (v62 >= v61 >> 1) {
          uint64_t v60 = sub_10001366C((char *)(v61 > 1), v62 + 1, 1, v60);
        }
        *((void *)v60 + 2) = v62 + 1;
        sub_10001672C(&v120, (uint64_t)&v60[40 * v62 + 32]);
      }
      else
      {
        sub_100006918((uint64_t)&v120, &qword_100064A50);
      }
      v59 += 40;
      --v58;
    }
    while (v58);
    swift_bridgeObjectRelease_n();
    uint64_t v30 = v119;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, void, uint64_t))(v93 + 104))(v95, enum case for ContactFormatter.Style.shortName(_:), v94);
  sub_100053D80();
  v124[3] = sub_100052C70();
  v124[4] = (uint64_t)&protocol witness table for ContactFormatter;
  sub_100006974(v124);
  sub_100052C60();
  id v63 = v90;
  sub_100052F80();
  sub_1000526D0();
  uint64_t v64 = v101;
  uint64_t v65 = v100;
  uint64_t v66 = v112;
  uint64_t v67 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v100, v112, v102);
  uint64_t v68 = v110;
  (*(void (**)(char *, void, uint64_t))(v110 + 16))(v96, v30, v117);
  sub_100016A1C(v106, v99, &qword_1000646E0);
  uint64_t v69 = (uint64_t)v105;
  sub_1000539E0();
  uint64_t v70 = sub_1000539F0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v69, 0, 1, v70);
  uint64_t v71 = sub_100053C70();
  uint64_t v72 = (uint64_t)v108;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v108, 1, 1, v71);
  uint64_t v73 = (uint64_t)v107;
  sub_100052870();
  LOBYTE(v66) = sub_1000335A4(v30, v66, v73);
  sub_100006918(v73, &qword_100064E48);
  id v74 = v103;
  (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v103, v118, v98);
  uint64_t v75 = (int *)v104;
  (*(void (**)(char *, char *, uint64_t))(v64 + 32))(&v74[*(int *)(v104 + 20)], v65, v67);
  sub_100006AA8(v69, (uint64_t)&v74[v75[6]], &qword_1000646A8);
  v74[v75[7]] = 0;
  sub_100052700();
  sub_100006AA8(v72, (uint64_t)&v74[v75[9]], &qword_100064778);
  v74[v75[10]] = v66 & 1;
  sub_1000053FC(&qword_100064E60);
  sub_100053E80();
  uint64_t v76 = v114;
  sub_100052760();
  uint64_t v77 = sub_100052790();
  os_signpost_type_t v78 = sub_100053F40();
  if (sub_100053F50())
  {
    uint64_t v80 = v115;
    uint64_t v79 = v116;
    uint64_t v81 = v87;
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v87, v76, v116);
    uint64_t v82 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v82 = 0;
    os_signpost_id_t v83 = sub_100052750();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, v78, v83, "getSnapshot", "Completed", v82, 2u);
    swift_slowDealloc();

    uint64_t v84 = *(void (**)(char *, uint64_t))(v80 + 8);
    v84(v76, v79);
    (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t))(v68 + 8))(v119, v117);
    return ((uint64_t (*)(char *, uint64_t))v84)(v81, v79);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v115 + 8))(v76, v116);
    return (*(uint64_t (**)(void (*)(char *, char *, uint64_t), uint64_t))(v68 + 8))(v119, v117);
  }
}

uint64_t sub_10001D124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  sub_100053C10();
  v4[10] = swift_task_alloc();
  sub_1000053FC(&qword_100064778);
  v4[11] = swift_task_alloc();
  uint64_t v5 = sub_100052770();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  sub_1000053FC(&qword_1000646E0);
  v4[16] = swift_task_alloc();
  uint64_t v6 = sub_1000526E0();
  v4[17] = v6;
  v4[18] = *(void *)(v6 - 8);
  v4[19] = swift_task_alloc();
  sub_1000053FC(&qword_1000649E8);
  v4[20] = swift_task_alloc();
  uint64_t v7 = sub_100052E50();
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  sub_1000053FC(&qword_100064E18);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  uint64_t v8 = sub_100052BC0();
  v4[28] = v8;
  v4[29] = *(void *)(v8 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  uint64_t v9 = sub_1000527D0();
  v4[32] = v9;
  v4[33] = *(void *)(v9 - 8);
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  uint64_t v10 = sub_1000527A0();
  v4[39] = v10;
  v4[40] = *(void *)(v10 - 8);
  v4[41] = swift_task_alloc();
  return _swift_task_switch(sub_10001D51C, 0, 0);
}

uint64_t sub_10001D51C()
{
  uint64_t v140 = v0;
  sub_100052910();
  sub_100052780();
  sub_100052910();
  uint64_t v1 = sub_1000527C0();
  os_log_type_t v2 = sub_100053F30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "getTimeline requested for single contact widget", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[32];
  uint64_t v6 = v0[33];
  uint64_t v7 = v0[31];
  uint64_t v133 = v0[30];
  uint64_t v9 = v0[28];
  uint64_t v8 = v0[29];
  uint64_t v10 = v0[7];

  uint64_t v136 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v136(v4, v5);
  sub_100052910();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v11(v7, v10, v9);
  v11(v133, v10, v9);
  uint64_t v12 = sub_1000527C0();
  os_log_type_t v13 = sub_100053F30();
  uint64_t v130 = (void (*)(unint64_t, uint64_t, uint64_t))v11;
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v124 = v13;
    log = v12;
    uint64_t v14 = v0[27];
    uint64_t v16 = v0[21];
    uint64_t v15 = v0[22];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v139 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    sub_100052BA0();
    uint64_t v122 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
    int v18 = v122(v14, 1, v16);
    uint64_t v19 = v0[27];
    if (v18)
    {
      sub_100006918(v0[27], &qword_100064E18);
      unint64_t v20 = 0xE100000000000000;
      uint64_t v21 = 45;
    }
    else
    {
      uint64_t v28 = v0[22];
      uint64_t v29 = v0[23];
      uint64_t v30 = v0[21];
      (*(void (**)(uint64_t, void, uint64_t))(v28 + 16))(v29, v0[27], v30);
      sub_100006918(v19, &qword_100064E18);
      uint64_t v21 = sub_100052E20();
      unint64_t v20 = v31;
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
    }
    uint64_t v32 = v0[31];
    uint64_t v34 = v0[28];
    uint64_t v33 = v0[29];
    uint64_t v35 = v0[26];
    uint64_t v121 = v0[21];
    v0[4] = sub_10002586C(v21, v20, &v139);
    sub_100053F70();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v36(v32, v34);
    *(_WORD *)(v17 + 12) = 2080;
    sub_100052BA0();
    int v37 = v122(v35, 1, v121);
    uint64_t v38 = v0[26];
    if (v37)
    {
      sub_100006918(v0[26], &qword_100064E18);
      unint64_t v39 = 0xE100000000000000;
      uint64_t v40 = 45;
    }
    else
    {
      uint64_t v42 = v0[22];
      uint64_t v41 = v0[23];
      uint64_t v43 = v0[21];
      (*(void (**)(uint64_t, void, uint64_t))(v42 + 16))(v41, v0[26], v43);
      sub_100006918(v38, &qword_100064E18);
      uint64_t v40 = sub_100052E40();
      unint64_t v39 = v44;
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
    }
    uint64_t v45 = v0[36];
    uint64_t v46 = v0[32];
    uint64_t v47 = v0[30];
    uint64_t v48 = v0[28];
    v0[5] = sub_10002586C(v40, v39, &v139);
    sub_100053F70();
    swift_bridgeObjectRelease();
    v36(v47, v48);
    _os_log_impl((void *)&_mh_execute_header, log, v124, "SingleContactTimelineProvider person: %s, id: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v27 = v136;
    v136(v45, v46);
  }
  else
  {
    uint64_t v22 = v0[36];
    uint64_t v23 = v0[32];
    uint64_t v24 = v0[30];
    uint64_t v25 = v0[28];
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0[29] + 8);
    v26(v0[31], v25);
    v26(v24, v25);

    uint64_t v27 = v136;
    v136(v22, v23);
  }
  uint64_t v49 = v0[25];
  uint64_t v50 = v0[21];
  uint64_t v51 = v0[22];
  uint64_t v52 = v0[20];
  uint64_t v53 = sub_100053EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 1, 1, v53);
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = 0;
  *(void *)(v54 + 24) = 0;
  sub_100033ECC(v52, (uint64_t)&unk_100064E28, v54);
  swift_release();
  sub_100052BA0();
  uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
  int v56 = v55(v49, 1, v50);
  uint64_t v57 = v0[25];
  if (v56)
  {
    sub_100006918(v0[25], &qword_100064E18);
LABEL_23:
    sub_100052910();
    uint64_t v86 = sub_1000527C0();
    os_log_type_t v87 = sub_100053F10();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v88 = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Could not get contact for SingleContactTimelineProvider", v88, 2u);
      swift_slowDealloc();
    }
    uint64_t v89 = v0 + 15;
    uint64_t v90 = v0[34];
    uint64_t v91 = v0[32];

    v27(v90, v91);
    sub_100052760();
    uint64_t v92 = sub_100052790();
    os_signpost_type_t v93 = sub_100053F40();
    if (sub_100053F50())
    {
      uint64_t v89 = v0 + 14;
      uint64_t v137 = v0[15];
      uint64_t v94 = v0[12];
      uint64_t v95 = v0[13];
      (*(void (**)(void))(v95 + 16))(v0[14]);
      os_log_type_t v96 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v96 = 0;
      os_signpost_id_t v97 = sub_100052750();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, v93, v97, "getTimeline", "no contact", v96, 2u);
      swift_slowDealloc();

      uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
      v98(v137, v94);
    }
    else
    {
      uint64_t v99 = v0[13];

      uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
    }
    uint64_t v100 = v0[28];
    uint64_t v102 = v0[18];
    uint64_t v101 = v0[19];
    uint64_t v129 = v0[17];
    uint64_t v103 = v0[11];
    uint64_t v104 = v0[7];
    v98(*v89, v0[12]);
    sub_1000053FC(&qword_100064E30);
    os_log_t v105 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
    unint64_t v106 = (*(unsigned __int8 *)(*((void *)v105 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v105 - 1) + 80);
    uint64_t v107 = swift_allocObject();
    *(_OWORD *)(v107 + 16) = xmmword_100054930;
    unint64_t v108 = v107 + v106;
    sub_1000526D0();
    v130(v108 + v105[5], v104, v100);
    unint64_t v109 = v108 + v105[6];
    uint64_t v110 = sub_1000539F0();
    (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v109, 1, 1, v110);
    uint64_t v111 = sub_100053C70();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v103, 1, 1, v111);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v102 + 32))(v108, v101, v129);
    *(unsigned char *)(v108 + v105[7]) = 0;
    sub_100052700();
    sub_100006AA8(v103, v108 + v105[9], &qword_100064778);
    *(unsigned char *)(v108 + v105[10]) = 0;
    sub_100053C00();
    sub_100024E74(&qword_100064DE0, (void (*)(uint64_t))type metadata accessor for SingleContactTimelineEntry);
    sub_100053CD0();
    (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
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
    uint64_t v112 = (uint64_t (*)(void))v0[1];
    return v112();
  }
  uint64_t v59 = v0[23];
  uint64_t v58 = v0[24];
  uint64_t v61 = v0[21];
  uint64_t v60 = v0[22];
  v125 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
  v125(v59, v57, v61);
  sub_100006918(v57, &qword_100064E18);
  os_log_t loga = (os_log_t)sub_100052E40();
  unint64_t v128 = v62;
  v0[42] = v62;
  os_log_type_t type = *(void (**)(uint64_t, uint64_t))(v60 + 8);
  type(v59, v61);
  sub_100052BA0();
  int v63 = v55(v58, 1, v61);
  uint64_t v64 = v0[24];
  if (v63)
  {
    sub_100006918(v0[24], &qword_100064E18);
  }
  else
  {
    uint64_t v65 = v0[23];
    uint64_t v66 = v0[21];
    v125(v65, v0[24], v66);
    sub_100006918(v64, &qword_100064E18);
    sub_100052E40();
    type(v65, v66);
  }
  uint64_t v67 = sub_100052E30();
  unint64_t v69 = v68;
  swift_bridgeObjectRelease();
  uint64_t v27 = v136;
  if (!v69)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v70 = (void *)v0[9];
  sub_1000162D8(v70, v70[3]);
  uint64_t v71 = sub_100052EE0();
  v0[43] = v71;
  if (!v71)
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v72 = (void *)v71;
  uint64_t v134 = v67;
  uint64_t v74 = v0[18];
  uint64_t v73 = v0[19];
  uint64_t v75 = v0[17];
  uint64_t v76 = (void *)v0[9];
  sub_1000526D0();
  sub_1000526B0();
  uint64_t v78 = v77;
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
  sub_1000162D8(v76, v70[3]);
  sub_100052ED0();
  sub_100052910();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v79 = sub_1000527C0();
  os_log_type_t v80 = sub_100053F30();
  BOOL v81 = os_log_type_enabled(v79, v80);
  uint64_t v82 = v0[35];
  uint64_t v83 = v0[32];
  if (v81)
  {
    uint64_t v131 = v0[35];
    uint64_t v84 = swift_slowAlloc();
    uint64_t v139 = swift_slowAlloc();
    *(_DWORD *)uint64_t v84 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_10002586C((uint64_t)loga, v128, &v139);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v84 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_10002586C(v134, v69, &v139);
    sub_100053F70();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v79, v80, "Get timeline for single contact widget with appEntityID: %s, contactID: %s", (uint8_t *)v84, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v85 = v131;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    uint64_t v85 = v82;
  }
  v136(v85, v83);
  uint64_t v132 = v0[16];
  os_signpost_id_t v114 = (void *)v0[9];
  uint64_t v135 = v0[8];
  uint64_t v138 = v0[41];
  uint64_t v115 = v0[7];
  sub_1000162D8(v114, v70[3]);
  id v116 = [v72 identifier];
  sub_100053D30();

  sub_100052EB0();
  swift_bridgeObjectRelease();
  uint64_t v117 = (void *)swift_task_alloc();
  v0[44] = v117;
  v117[2] = v114;
  v117[3] = v72;
  v117[4] = v115;
  v117[5] = v132;
  v117[6] = loga;
  v117[7] = v128;
  v117[8] = v78;
  v117[9] = v135;
  v117[10] = v138;
  uint64_t v118 = (void *)swift_task_alloc();
  v0[45] = v118;
  uint64_t v119 = sub_1000053FC(&qword_100064E38);
  *uint64_t v118 = v0;
  v118[1] = sub_10001E4B0;
  uint64_t v120 = v0[6];
  return withCheckedContinuation<A>(isolation:function:_:)(v120, 0, 0, 0xD000000000000011, 0x800000010005DBB0, sub_100026AA8, v117, v119);
}

uint64_t sub_10001E4B0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001E5E4, 0, 0);
}

uint64_t sub_10001E5E4()
{
  uint64_t v1 = *(void *)(v0 + 128);

  sub_100006918(v1, &qword_1000646E0);
  (*(void (**)(void, void))(*(void *)(v0 + 320) + 8))(*(void *)(v0 + 328), *(void *)(v0 + 312));
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
  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001E784()
{
  return _swift_task_switch(sub_10001E7A0, 0, 0);
}

uint64_t sub_10001E7A0()
{
  v0[2] = sub_100052A00();
  v0[3] = v1;
  sub_100053EA0();
  v0[4] = sub_100053E90();
  uint64_t v3 = sub_100053E70();
  return _swift_task_switch(sub_10000A428, v3, v2);
}

uint64_t sub_10001E83C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10)
{
  uint64_t v57 = a8;
  uint64_t v65 = a7;
  uint64_t v64 = a6;
  uint64_t v53 = a5;
  uint64_t v52 = a4;
  id v67 = a3;
  uint64_t v58 = a1;
  uint64_t v59 = a10;
  uint64_t v73 = sub_1000527A0();
  uint64_t v70 = *(void *)(v73 - 8);
  uint64_t v63 = *(void *)(v70 + 64);
  __chkstk_darwin(v73);
  uint64_t v72 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1000053FC(&qword_100064E40);
  uint64_t v68 = *(void *)(v71 - 8);
  uint64_t v56 = *(void *)(v68 + 64);
  __chkstk_darwin(v71);
  unint64_t v69 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100053C90();
  uint64_t v48 = v14;
  uint64_t v66 = *(void *)(v14 - 8);
  uint64_t v51 = *(void *)(v66 + 64);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v16;
  uint64_t v17 = sub_1000053FC(&qword_1000646E0);
  uint64_t v50 = *(void *)(v17 - 8);
  uint64_t v18 = *(void *)(v50 + 64);
  __chkstk_darwin(v17 - 8);
  uint64_t v46 = (uint64_t)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100052BC0();
  uint64_t v45 = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  __chkstk_darwin(v19);
  uint64_t v47 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016744(a2 + 80, (uint64_t)&v76);
  uint64_t v61 = v77;
  uint64_t v62 = v78;
  uint64_t v60 = sub_1000162D8(&v76, v77);
  id v22 = [v67 identifier];
  uint64_t v55 = sub_100053D30();
  uint64_t v54 = v23;

  sub_100026AE0(a2, (uint64_t)v74);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v52, v19);
  sub_100016A1C(v53, (uint64_t)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1000646E0);
  uint64_t v24 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v16, v57, v14);
  uint64_t v25 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v69, v58, v71);
  uint64_t v26 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, v59, v73);
  unint64_t v27 = (*(unsigned __int8 *)(v20 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v28 = (v21 + *(unsigned __int8 *)(v50 + 80) + v27) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  unint64_t v29 = (v18 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (*(unsigned __int8 *)(v24 + 80) + v30 + 8) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v32 = (v51 + *(unsigned __int8 *)(v25 + 80) + v31) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v33 = (v56 + *(unsigned __int8 *)(v26 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v34 = swift_allocObject();
  long long v35 = v74[7];
  *(_OWORD *)(v34 + 112) = v74[6];
  *(_OWORD *)(v34 + 128) = v35;
  uint64_t v36 = v75;
  long long v37 = v74[3];
  *(_OWORD *)(v34 + 48) = v74[2];
  *(_OWORD *)(v34 + 64) = v37;
  long long v38 = v74[5];
  *(_OWORD *)(v34 + 80) = v74[4];
  *(_OWORD *)(v34 + 96) = v38;
  long long v39 = v74[1];
  *(_OWORD *)(v34 + 16) = v74[0];
  *(_OWORD *)(v34 + 32) = v39;
  id v40 = v67;
  *(void *)(v34 + 144) = v36;
  *(void *)(v34 + 152) = v40;
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v34 + v27, v47, v45);
  sub_100006AA8(v46, v34 + v28, &qword_1000646E0);
  uint64_t v41 = (void *)(v34 + v29);
  uint64_t v42 = v65;
  *uint64_t v41 = v64;
  v41[1] = v42;
  *(double *)(v34 + v30) = a9;
  (*(void (**)(unint64_t, char *, uint64_t))(v66 + 32))(v34 + v31, v49, v48);
  (*(void (**)(unint64_t, char *, uint64_t))(v68 + 32))(v34 + v32, v69, v71);
  (*(void (**)(unint64_t, char *, uint64_t))(v70 + 32))(v34 + v33, v72, v73);
  id v43 = v40;
  swift_bridgeObjectRetain();
  sub_100052EF0();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100010614((uint64_t)&v76);
}

uint64_t sub_10001EF14(void (*a1)(void, void), int a2, char *a3, void *a4, uint64_t a5, uint64_t a6, char *a7, char *a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v153 = a8;
  double v164 = a7;
  uint64_t v160 = (char *)a6;
  uint64_t v157 = a5;
  id v155 = a4;
  uint64_t v163 = a3;
  LODWORD(v169) = a2;
  v186 = a1;
  uint64_t v183 = a11;
  uint64_t v184 = a12;
  uint64_t v166 = a10;
  uint64_t v13 = sub_1000053FC(&qword_100064E48);
  __chkstk_darwin(v13 - 8);
  uint64_t v147 = (char *)&v135 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000053FC(&qword_100064778);
  __chkstk_darwin(v15 - 8);
  uint64_t v148 = (char *)&v135 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v17 - 8);
  uint64_t v144 = (uint64_t)&v135 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v19 - 8);
  uint64_t v146 = (char *)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_100052BC0();
  uint64_t v143 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  uint64_t v154 = (char *)&v135 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100052C50();
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v140 = (char *)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_100052FB0();
  uint64_t v145 = *(void *)(v161 - 8);
  uint64_t v23 = __chkstk_darwin(v161);
  uint64_t v141 = (char *)&v135 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v142 = (void (*)(char *, char *, uint64_t))((char *)&v135 - v25);
  uint64_t v168 = sub_100052770();
  uint64_t v167 = *(void *)(v168 - 8);
  uint64_t v26 = __chkstk_darwin(v168);
  v149 = (char *)&v135 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v182 = (char *)&v135 - v28;
  uint64_t v29 = sub_100052920();
  uint64_t v180 = *(void *)(v29 - 8);
  uint64_t v181 = v29;
  __chkstk_darwin(v29);
  v179 = (char *)&v135 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_100053BA0();
  uint64_t v176 = *(void *)(v178 - 8);
  __chkstk_darwin(v178);
  v174 = (char *)&v135 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = sub_100052930();
  uint64_t v175 = *(void *)(v177 - 8);
  __chkstk_darwin(v177);
  v173 = (char *)&v135 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_1000527D0();
  uint64_t v158 = *(void *)(v159 - 8);
  uint64_t v33 = __chkstk_darwin(v159);
  long long v35 = (char *)&v135 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  long long v37 = (char *)&v135 - v36;
  uint64_t v38 = sub_1000053FC(&qword_100064A08);
  uint64_t v39 = __chkstk_darwin(v38 - 8);
  uint64_t v137 = (uint64_t)&v135 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  uint64_t v136 = (char *)&v135 - v41;
  uint64_t v42 = sub_1000053FC(&qword_100064A10);
  __chkstk_darwin(v42 - 8);
  uint64_t v135 = (char *)&v135 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100053C10();
  uint64_t v152 = *(void *)(v44 - 8);
  uint64_t v45 = __chkstk_darwin(v44);
  uint64_t v162 = (char *)&v135 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v135 - v47;
  uint64_t v49 = sub_1000053FC(&qword_100064A18);
  uint64_t v50 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v52 = (char *)&v135 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_1000526E0();
  uint64_t v151 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  v185 = (char *)&v135 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1000053FC(&qword_100064E50);
  uint64_t v55 = *(char **)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v57 = (char *)&v135 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_1000053FC(&qword_100064E38);
  uint64_t v171 = *(void *)(v172 - 8);
  uint64_t v58 = __chkstk_darwin(v172);
  __chkstk_darwin(v58);
  v165 = (char *)&v135 - v59;
  uint64_t v170 = v60;
  if (v169)
  {
    uint64_t v85 = v186;
    v187[0] = (uint64_t)v186;
    swift_errorRetain();
    sub_1000053FC(&qword_100064A28);
    swift_willThrowTypedImpl();
    sub_100052910();
    swift_errorRetain();
    sub_1000527B0();
    sub_100016618((uint64_t)v85, 1);
    (*(void (**)(char *, uint64_t))(v158 + 8))(v35, v159);
    (*(void (**)(char *, void, uint64_t))(v138 + 104))(v140, enum case for ContactFormatter.Style.shortName(_:), v139);
    id v86 = v155;
    sub_100053D80();
    v187[3] = sub_100052C70();
    v187[4] = (uint64_t)&protocol witness table for ContactFormatter;
    sub_100006974(v187);
    sub_100052C60();
    os_log_type_t v87 = v142;
    sub_100052F80();
    sub_1000053FC(&qword_100064E30);
    uint64_t v88 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
    unint64_t v89 = (*(unsigned __int8 *)(*((void *)v88 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v88 - 1) + 80);
    uint64_t v90 = swift_allocObject();
    uint64_t v169 = v90;
    *(_OWORD *)(v90 + 16) = xmmword_100054930;
    unint64_t v91 = v90 + v89;
    sub_1000526D0();
    uint64_t v92 = v143;
    uint64_t v93 = v157;
    (*(void (**)(char *, uint64_t, uint64_t))(v143 + 16))(v154, v157, v156);
    uint64_t v94 = v145;
    (*(void (**)(char *, void, uint64_t))(v145 + 16))(v141, v87, v161);
    sub_100016A1C((uint64_t)v160, v144, &qword_1000646E0);
    uint64_t v95 = (uint64_t)v146;
    sub_1000539E0();
    uint64_t v96 = sub_1000539F0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v95, 0, 1, v96);
    uint64_t v97 = (uint64_t)v148;
    sub_100053970();
    uint64_t v98 = sub_100053C70();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56))(v97, 0, 1, v98);
    uint64_t v99 = (uint64_t)v147;
    sub_100052870();
    char v100 = sub_1000335A4(v87, v93, v99);
    sub_100006918(v99, &qword_100064E48);
    (*(void (**)(unint64_t, char *, uint64_t))(v151 + 32))(v91, v185, v150);
    (*(void (**)(unint64_t, char *, uint64_t))(v92 + 32))(v91 + v88[5], v154, v156);
    sub_100006AA8(v95, v91 + v88[6], &qword_1000646A8);
    *(unsigned char *)(v91 + v88[7]) = 0;
    sub_100052700();
    sub_100006AA8(v97, v91 + v88[9], &qword_100064778);
    *(unsigned char *)(v91 + v88[10]) = v100 & 1;
    sub_100053C00();
    sub_100024E74(&qword_100064DE0, (void (*)(uint64_t))type metadata accessor for SingleContactTimelineEntry);
    uint64_t v82 = v165;
    sub_100053CD0();
    sub_100016618((uint64_t)v186, 1);
    (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t))(v94 + 8))(v87, v161);
  }
  else
  {
    uint64_t v154 = v55;
    uint64_t v161 = (uint64_t)v48;
    uint64_t v169 = v44;
    uint64_t v156 = (uint64_t)v37;
    uint64_t v61 = v163;
    uint64_t v62 = v186;
    uint64_t v63 = swift_bridgeObjectRetain();
    sub_100009014(v63);
    sub_100016618((uint64_t)v62, 0);
    uint64_t v64 = v185;
    sub_1000526D0();
    sub_100052990();
    sub_100052D90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v49);
    uint64_t v65 = v151;
    v186 = *(void (**)(void, void))(v151 + 8);
    uint64_t v66 = v150;
    v186(v64, v150);
    uint64_t v67 = sub_100052D70();
    __chkstk_darwin(v67);
    uint64_t v68 = (char *)v157;
    *(&v135 - 6) = (char *)v155;
    *(&v135 - 5) = v68;
    *(&v135 - 4) = v160;
    *(&v135 - 3) = v61;
    unint64_t v69 = v153;
    *(&v135 - 2) = v164;
    *(&v135 - 1) = v69;
    uint64_t v70 = sub_10001AEC0((void (*)(uint64_t))sub_10002710C, (uint64_t)(&v135 - 8), v67);
    swift_bridgeObjectRelease();
    uint64_t v71 = (uint64_t)v136;
    double v164 = (char *)v54;
    uint64_t v163 = v57;
    sub_100052D60();
    uint64_t v72 = v137;
    sub_100016A1C(v71, v137, &qword_100064A08);
    uint64_t v73 = 1;
    int v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v72, 1, v66);
    uint64_t v75 = v64;
    uint64_t v76 = (void (*)(char *, uint64_t))v186;
    uint64_t v77 = (uint64_t)v135;
    if (v74 != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v75, v72, v66);
      sub_100053BE0();
      v76(v75, v66);
      uint64_t v73 = 0;
    }
    uint64_t v78 = v152;
    uint64_t v79 = v73;
    uint64_t v80 = v169;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v152 + 56))(v77, v79, 1, v169);
    sub_100006918(v71, &qword_100064A08);
    int v81 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v77, 1, v80);
    uint64_t v82 = v165;
    uint64_t v83 = v162;
    uint64_t v84 = v161;
    if (v81 == 1)
    {
      sub_100053BF0();
      sub_100006918(v77, &qword_100064A10);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 32))(v161, v77, v80);
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v83, v84, v80);
    type metadata accessor for SingleContactTimelineEntry(0);
    sub_100024E74(&qword_100064DE0, (void (*)(uint64_t))type metadata accessor for SingleContactTimelineEntry);
    swift_bridgeObjectRetain();
    sub_100053CD0();
    sub_1000526D0();
    sub_1000526B0();
    double v102 = v101;
    v186(v75, v66);
    uint64_t v103 = v156;
    sub_100052910();
    swift_bridgeObjectRetain();
    uint64_t v104 = sub_1000527C0();
    os_log_type_t v105 = sub_100053F30();
    BOOL v106 = os_log_type_enabled(v104, v105);
    uint64_t v107 = v159;
    uint64_t v108 = v158;
    if (v106)
    {
      uint64_t v109 = swift_slowAlloc();
      *(_DWORD *)uint64_t v109 = 134349312;
      uint64_t v110 = v70[2];
      swift_bridgeObjectRelease();
      v187[0] = v110;
      uint64_t v103 = v156;
      sub_100053F70();
      swift_bridgeObjectRelease();
      *(_WORD *)(v109 + 12) = 2048;
      *(double *)v187 = v102 - a9;
      sub_100053F70();
      _os_log_impl((void *)&_mh_execute_header, v104, v105, "Single contact timeline created with %{public}ld entries elasped %f", (uint8_t *)v109, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v111 = v164;
    uint64_t v112 = v154;
    uint64_t v113 = v163;
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v103, v107);
    (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v161, v169);
    (*((void (**)(char *, char *))v112 + 1))(v113, v111);
  }
  sub_100052980();
  uint64_t v114 = v175;
  uint64_t v115 = v173;
  uint64_t v116 = v177;
  (*(void (**)(char *, void, uint64_t))(v175 + 104))(v173, enum case for PeopleAnalytics.WidgetType.single(_:), v177);
  uint64_t v117 = v172;
  sub_100053CE0();
  swift_bridgeObjectRelease();
  uint64_t v118 = v82;
  uint64_t v119 = v174;
  sub_100053C80();
  uint64_t v120 = v179;
  sub_100053B90();
  uint64_t v121 = v119;
  uint64_t v122 = v118;
  (*(void (**)(char *, uint64_t))(v176 + 8))(v121, v178);
  sub_100052940();
  (*(void (**)(char *, uint64_t))(v180 + 8))(v120, v181);
  (*(void (**)(char *, uint64_t))(v114 + 8))(v115, v116);
  uint64_t v123 = v117;
  uint64_t v124 = v171;
  (*(void (**)(uint64_t, char *, uint64_t))(v171 + 16))(v170, v118, v123);
  sub_1000053FC(&qword_100064E40);
  sub_100053E80();
  v125 = v182;
  sub_100052760();
  uint64_t v126 = sub_100052790();
  os_signpost_type_t v127 = sub_100053F40();
  if (sub_100053F50())
  {
    uint64_t v128 = v167;
    uint64_t v129 = v149;
    uint64_t v130 = v168;
    (*(void (**)(char *, char *, uint64_t))(v167 + 16))(v149, v125, v168);
    uint64_t v131 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v131 = 0;
    os_signpost_id_t v132 = sub_100052750();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v126, v127, v132, "getTimeline", "Completed", v131, 2u);
    swift_slowDealloc();

    uint64_t v133 = *(void (**)(char *, uint64_t))(v128 + 8);
    v133(v125, v130);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v122, v123);
    return ((uint64_t (*)(char *, uint64_t))v133)(v129, v130);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v167 + 8))(v125, v168);
    return (*(uint64_t (**)(char *, uint64_t))(v124 + 8))(v118, v123);
  }
}

uint64_t sub_100020568@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v64 = a7;
  uint64_t v63 = a6;
  uint64_t v62 = a5;
  uint64_t v57 = a4;
  uint64_t v12 = sub_1000053FC(&qword_100064E48);
  __chkstk_darwin(v12 - 8);
  uint64_t v61 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000053FC(&qword_100064778);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v17 - 8);
  uint64_t v52 = (uint64_t)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v19 - 8);
  uint64_t v59 = (char *)v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100052BC0();
  uint64_t v58 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  unint64_t v69 = (char *)v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000526E0();
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v67 = (char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100052C50();
  uint64_t v48 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v50 = (char *)v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100052FB0();
  uint64_t v55 = *(void *)(v68 - 8);
  uint64_t v24 = __chkstk_darwin(v68);
  uint64_t v51 = (char *)v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v53 = (void (*)(char *, char *, uint64_t))((char *)v45 - v26);
  uint64_t v60 = a1;
  uint64_t v27 = sub_100052CF0();
  uint64_t v28 = *(void *)(v27 + 16);
  uint64_t v65 = v16;
  uint64_t v66 = a3;
  if (v28)
  {
    uint64_t v46 = a2;
    uint64_t v47 = a8;
    v45[1] = v27;
    uint64_t v29 = v27 + 32;
    uint64_t v30 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_100016744(v29, (uint64_t)v75);
      sub_100016744((uint64_t)v75, (uint64_t)&v74);
      sub_1000053FC(&qword_100064A40);
      sub_1000053FC(&qword_100064A48);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v73 = 0;
        long long v71 = 0u;
        long long v72 = 0u;
      }
      sub_100010614((uint64_t)v75);
      if (*((void *)&v72 + 1))
      {
        sub_10001672C(&v71, (uint64_t)&v74);
        sub_10001672C(&v74, (uint64_t)&v71);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v30 = sub_10001366C(0, *((void *)v30 + 2) + 1, 1, v30);
        }
        unint64_t v32 = *((void *)v30 + 2);
        unint64_t v31 = *((void *)v30 + 3);
        if (v32 >= v31 >> 1) {
          uint64_t v30 = sub_10001366C((char *)(v31 > 1), v32 + 1, 1, v30);
        }
        *((void *)v30 + 2) = v32 + 1;
        sub_10001672C(&v71, (uint64_t)&v30[40 * v32 + 32]);
      }
      else
      {
        sub_100006918((uint64_t)&v71, &qword_100064A50);
      }
      v29 += 40;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    a8 = v47;
    a3 = v66;
    a2 = v46;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v50, enum case for ContactFormatter.Style.shortName(_:), v49);
  sub_100053D80();
  v75[3] = sub_100052C70();
  v75[4] = (uint64_t)&protocol witness table for ContactFormatter;
  sub_100006974(v75);
  sub_100052C60();
  id v33 = a2;
  uint64_t v34 = v53;
  sub_100052F80();
  sub_100052CC0();
  uint64_t v35 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v69, a3, v70);
  uint64_t v36 = v55;
  (*(void (**)(char *, void, uint64_t))(v55 + 16))(v51, v34, v68);
  sub_100016A1C(v57, v52, &qword_1000646E0);
  uint64_t v37 = (uint64_t)v59;
  sub_1000539E0();
  uint64_t v38 = sub_1000539F0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
  sub_100052CD0();
  sub_100053930();
  sub_100052CE0();
  uint64_t v39 = (uint64_t)v65;
  sub_100053C60();
  uint64_t v40 = sub_100053C70();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
  uint64_t v41 = (uint64_t)v61;
  sub_100052870();
  char v42 = sub_1000335A4(v34, v66, v41);
  sub_100006918(v41, &qword_100064E48);
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 32))(a8, v67, v56);
  uint64_t v43 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(a8 + v43[5], v69, v70);
  sub_100006AA8(v37, a8 + v43[6], &qword_1000646A8);
  *(unsigned char *)(a8 + v43[7]) = 0;
  sub_100052700();
  sub_100006AA8(v39, a8 + v43[9], &qword_100064778);
  *(unsigned char *)(a8 + v43[10]) = v42 & 1;
  return (*(uint64_t (**)(void (*)(char *, char *, uint64_t), uint64_t))(v36 + 8))(v34, v68);
}

uint64_t sub_100020DF4@<X0>(uint64_t a1@<X8>)
{
  sub_1000526D0();
  uint64_t v2 = (int *)type metadata accessor for SingleContactTimelineEntry(0);
  sub_100052BB0();
  uint64_t v3 = a1 + v2[6];
  uint64_t v4 = sub_1000539F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = a1 + v2[9];
  uint64_t v6 = sub_100053C70();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(unsigned char *)(a1 + v2[7]) = 1;
  uint64_t result = sub_100052700();
  *(unsigned char *)(a1 + v2[10]) = 0;
  return result;
}

uint64_t sub_100020EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000175D8;
  return sub_10001B0BC(a1, a2);
}

uint64_t sub_100020F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000175D8;
  return sub_10001D124(a1, a2, a3);
}

uint64_t sub_100021040(uint64_t a1, uint64_t a2)
{
  return sub_100026800(a1, a2, 0x800000010005DB80);
}

uint64_t sub_100021068(uint64_t a1, uint64_t a2)
{
  return sub_100026800(a1, a2, 0x800000010005DB60);
}

uint64_t sub_100021090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000CA3C;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100021144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000175D8;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_1000211F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000526E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100021260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100016A1C(v2 + *(int *)(a1 + 36), a2, &qword_100064778);
}

uint64_t sub_10002128C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000212A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v2 = type metadata accessor for SingleContactWidgetEntryView(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v56 = (uint64_t)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000527D0();
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  __chkstk_darwin(v4);
  uint64_t v57 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000053FC(&qword_1000646A8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v49 - v10;
  uint64_t v12 = sub_100052FB0();
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v49 - v16;
  uint64_t v18 = type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v19 = *(int *)(v18 + 24);
  os_log_t v58 = v1;
  sub_100016A1C((uint64_t)v1 + v19, (uint64_t)v11, &qword_1000646A8);
  uint64_t v20 = sub_1000539F0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v22(v11, 1, v20) != 1)
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
    uint64_t v34 = v59;
    uint64_t v39 = v60;
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v60, v17, v12);
    uint64_t v40 = 0;
    uint64_t v41 = v39;
    uint64_t v33 = v12;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v41, v40, 1, v33);
  }
  uint64_t v52 = v15;
  uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
  uint64_t v23 = (uint64_t)v9;
  uint64_t v24 = v57;
  sub_100006918((uint64_t)v11, &qword_1000646A8);
  os_log_t v25 = v58;
  if (*((unsigned char *)&v58->isa + *(int *)(v18 + 28)))
  {
LABEL_8:
    uint64_t v40 = 1;
    uint64_t v34 = v59;
    uint64_t v41 = v60;
    uint64_t v33 = v12;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v41, v40, 1, v33);
  }
  sub_100052910();
  uint64_t v26 = v56;
  sub_10002613C((uint64_t)v25, v56, type metadata accessor for SingleContactWidgetEntryView);
  uint64_t v27 = sub_1000527C0();
  int v28 = sub_100053F10();
  if (!os_log_type_enabled(v27, (os_log_type_t)v28))
  {
    sub_100024668(v26, type metadata accessor for SingleContactWidgetEntryView);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v24, v55);
    goto LABEL_8;
  }
  int v50 = v28;
  os_log_t v58 = v27;
  uint64_t v29 = (uint8_t *)swift_slowAlloc();
  uint64_t v49 = swift_slowAlloc();
  uint64_t v62 = v49;
  uint64_t v51 = v29;
  *(_DWORD *)uint64_t v29 = 136315138;
  uint64_t v30 = v26 + *(int *)(v18 + 24);
  uint64_t v31 = v23;
  sub_100016A1C(v30, v23, &qword_1000646A8);
  int v32 = v53(v23, 1, v20);
  uint64_t v33 = v12;
  uint64_t v34 = v59;
  uint64_t v35 = v54;
  uint64_t v36 = v24;
  if (v32 == 1)
  {
    sub_100006918(v23, &qword_1000646A8);
    unint64_t v37 = 0xE100000000000000;
    uint64_t v38 = 45;
  }
  else
  {
    char v42 = v52;
    sub_1000539D0();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v31, v20);
    uint64_t v43 = (void *)sub_100052F90();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v42, v33);
    id v44 = [v43 identifier];

    uint64_t v38 = sub_100053D30();
    unint64_t v37 = v45;
  }
  uint64_t v46 = v51;
  uint64_t v61 = sub_10002586C(v38, v37, &v62);
  sub_100053F70();
  swift_bridgeObjectRelease();
  sub_100024668(v56, type metadata accessor for SingleContactWidgetEntryView);
  os_log_t v47 = v58;
  _os_log_impl((void *)&_mh_execute_header, v58, (os_log_type_t)v50, "contact not found for identifier: %s", v46, 0xCu);
  uint64_t v40 = 1;
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v55);
  uint64_t v41 = v60;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v41, v40, 1, v33);
}

uint64_t sub_10002187C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v293 = a1;
  uint64_t v292 = sub_1000053FC(&qword_100064C88);
  __chkstk_darwin(v292);
  v285 = (char *)&v228 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v277 = type metadata accessor for SingleContactSmallWidgetView();
  uint64_t v3 = __chkstk_darwin(v277);
  v257 = (char *)&v228 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v283 = (uint64_t)&v228 - v5;
  uint64_t v6 = sub_1000053FC(&qword_100064C90);
  uint64_t v260 = *(void *)(v6 - 8);
  uint64_t v261 = v6;
  __chkstk_darwin(v6);
  v259 = (char *)&v228 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v278 = sub_1000053FC(&qword_100064C98);
  uint64_t v8 = __chkstk_darwin(v278);
  v258 = (char *)&v228 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v262 = (uint64_t)&v228 - v10;
  uint64_t v281 = sub_1000053FC(&qword_100064CA0);
  __chkstk_darwin(v281);
  uint64_t v282 = (uint64_t)&v228 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100052E90();
  uint64_t v236 = *(void *)(v12 - 8);
  uint64_t v237 = v12;
  __chkstk_darwin(v12);
  v229 = (char *)&v228 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000053FC(&qword_100064CA8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  v235 = (char *)&v228 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v233 = (char *)&v228 - v17;
  uint64_t v253 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  __chkstk_darwin(v253);
  v238 = (char *)&v228 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000053FC(&qword_100064CB0);
  uint64_t v241 = *(void *)(v19 - 8);
  uint64_t v242 = v19;
  __chkstk_darwin(v19);
  v240 = (char *)&v228 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v239 = sub_1000053FC(&qword_100064CB8);
  __chkstk_darwin(v239);
  v244 = (char *)&v228 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = sub_1000053FC(&qword_100064CC0);
  __chkstk_darwin(v243);
  uint64_t v246 = (uint64_t)&v228 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v245 = sub_1000053FC(&qword_100064CC8);
  __chkstk_darwin(v245);
  uint64_t v248 = (uint64_t)&v228 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v279 = sub_1000053FC(&qword_100064CD0);
  uint64_t v24 = __chkstk_darwin(v279);
  uint64_t v247 = (uint64_t)&v228 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v249 = (uint64_t)&v228 - v26;
  uint64_t v284 = type metadata accessor for SingleContactWidgetEntryView(0);
  __chkstk_darwin(v284);
  uint64_t v269 = (uint64_t)&v228 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v291 = sub_1000053FC(&qword_100064CD8);
  __chkstk_darwin(v291);
  v280 = (char *)&v228 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v289 = sub_1000053FC(&qword_100064CE0);
  __chkstk_darwin(v289);
  uint64_t v290 = (uint64_t)&v228 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100053410();
  uint64_t v275 = *(void *)(v30 - 8);
  uint64_t v276 = v30;
  __chkstk_darwin(v30);
  uint64_t v274 = (uint64_t)&v228 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1000053FC(&qword_100064CE8);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v255 = (uint64_t)&v228 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v234 = (uint64_t)&v228 - v36;
  __chkstk_darwin(v35);
  uint64_t v38 = (char *)&v228 - v37;
  uint64_t v39 = sub_1000053FC(&qword_1000646A0);
  uint64_t v40 = __chkstk_darwin(v39 - 8);
  v256 = (char *)&v228 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __chkstk_darwin(v40);
  v254 = (char *)&v228 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v231 = (char *)&v228 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v232 = (char *)&v228 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  v230 = (char *)&v228 - v49;
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v250 = (uint64_t)&v228 - v51;
  uint64_t v52 = __chkstk_darwin(v50);
  v263 = (char *)&v228 - v53;
  __chkstk_darwin(v52);
  v267 = (char *)&v228 - v54;
  uint64_t v55 = sub_100052710();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = __chkstk_darwin(v55);
  v252 = (char *)&v228 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v57);
  uint64_t v60 = (char *)&v228 - v59;
  uint64_t v61 = sub_1000053FC(&qword_1000646A8);
  uint64_t v62 = __chkstk_darwin(v61 - 8);
  uint64_t v251 = (uint64_t)&v228 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v62);
  uint64_t v65 = (char *)&v228 - v64;
  uint64_t v264 = type metadata accessor for SingleContactSmallWidgetVerticalView();
  __chkstk_darwin(v264);
  uint64_t v67 = (char *)&v228 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000053FC(&qword_100064CF0);
  uint64_t v265 = *(void *)(v68 - 8);
  uint64_t v266 = v68;
  __chkstk_darwin(v68);
  uint64_t v70 = (char *)&v228 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1000053FC(&qword_100064CF8);
  uint64_t v271 = *(void *)(v71 - 8);
  uint64_t v272 = v71;
  __chkstk_darwin(v71);
  v270 = (char *)&v228 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v286 = sub_1000053FC(&qword_100064D00);
  uint64_t v73 = __chkstk_darwin(v286);
  v268 = (char *)&v228 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v73);
  uint64_t v273 = (uint64_t)&v228 - v75;
  uint64_t v288 = sub_1000053FC(&qword_100064D08);
  __chkstk_darwin(v288);
  v287 = (char *)&v228 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for SingleContactTimelineEntry(0);
  uint64_t v78 = v77;
  if (*(unsigned char *)(v1 + *(int *)(v77 + 40)) != 1)
  {
    uint64_t v275 = v56;
    uint64_t v276 = v55;
    uint64_t v274 = v1;
    if (qword_100064550 != -1) {
      swift_once();
    }
    int v84 = byte_100067460;
    uint64_t v85 = v274;
    uint64_t v86 = v269;
    sub_10002613C(v274, v269, type metadata accessor for SingleContactWidgetEntryView);
    uint64_t v87 = v276;
    uint64_t v88 = v277;
    uint64_t v89 = v275;
    if (v84 == 1)
    {
      char v90 = sub_100052B90();
      sub_100024668(v86, type metadata accessor for SingleContactWidgetEntryView);
      if (v90)
      {
        sub_100016A1C(v85 + *(int *)(v78 + 24), v251, &qword_1000646A8);
        (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v252, v85 + *(int *)(v78 + 32), v87);
        uint64_t v91 = (uint64_t)v233;
        sub_100052B60();
        uint64_t v93 = v236;
        uint64_t v92 = v237;
        uint64_t v94 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v236 + 48);
        if (v94(v91, 1, v237))
        {
          sub_100006918(v91, &qword_100064CA8);
          uint64_t v95 = sub_100052680();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v250, 1, 1, v95);
        }
        else
        {
          uint64_t v154 = v229;
          (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v229, v91, v92);
          sub_100006918(v91, &qword_100064CA8);
          sub_100052E80();
          (*(void (**)(char *, uint64_t))(v93 + 8))(v154, v92);
        }
        uint64_t v155 = v284;
        uint64_t v135 = (uint64_t)v285;
        uint64_t v156 = (uint64_t)v235;
        sub_100052B50();
        if (v94(v156, 1, v92))
        {
          sub_100006918(v156, &qword_100064CA8);
          uint64_t v157 = sub_100052680();
          uint64_t v158 = (uint64_t)v230;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v157 - 8) + 56))(v230, 1, 1, v157);
        }
        else
        {
          uint64_t v159 = v229;
          (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v229, v156, v92);
          sub_100006918(v156, &qword_100064CA8);
          uint64_t v160 = v230;
          sub_100052E80();
          (*(void (**)(char *, uint64_t))(v93 + 8))(v159, v92);
          uint64_t v158 = (uint64_t)v160;
        }
        uint64_t v161 = v274;
        uint64_t v162 = (uint64_t)v231;
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v164 = swift_getKeyPath();
        v165 = (int *)v253;
        uint64_t v166 = (uint64_t)v238;
        *(void *)&v238[*(int *)(v253 + 20)] = v164;
        sub_1000053FC(&qword_100064D80);
        swift_storeEnumTagMultiPayload();
        *(void *)uint64_t v166 = KeyPath;
        *(unsigned char *)(v166 + 8) = 0;
        sub_100006AA8(v251, v166 + v165[6], &qword_1000646A8);
        (*(void (**)(uint64_t, char *, uint64_t))(v275 + 32))(v166 + v165[7], v252, v276);
        sub_100006AA8(v250, v166 + v165[8], &qword_1000646A0);
        sub_100006AA8(v158, v166 + v165[9], &qword_1000646A0);
        *(void *)(v166 + v165[10]) = 0x3FD999999999999ALL;
        *(void *)(v166 + v165[11]) = 0x3FE0000000000000;
        *(void *)(v166 + v165[12]) = 0x3FF8000000000000;
        uint64_t v167 = v234;
        sub_1000212A8(v234);
        uint64_t v168 = sub_100052FB0();
        uint64_t v169 = *(void *)(v168 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v169 + 48))(v167, 1, v168) == 1)
        {
          sub_100006918(v167, &qword_100064CE8);
          uint64_t v170 = sub_100052680();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v170 - 8) + 56))(v162, 1, 1, v170);
        }
        else
        {
          sub_100052F60();
          (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v167, v168);
          uint64_t v171 = sub_100052680();
          uint64_t v172 = *(void *)(v171 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v172 + 48))(v162, 1, v171) != 1)
          {
            uint64_t v173 = (uint64_t)v232;
            (*(void (**)(char *, uint64_t, uint64_t))(v172 + 32))(v232, v162, v171);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v172 + 56))(v173, 0, 1, v171);
            goto LABEL_30;
          }
        }
        uint64_t v173 = (uint64_t)v232;
        sub_100052F70();
        sub_100006918(v162, &qword_1000646A0);
LABEL_30:
        sub_100024E74(&qword_100064D40, (void (*)(uint64_t))type metadata accessor for SingleContactQuickActionWidgetView);
        v174 = v240;
        sub_100053610();
        sub_100006918(v173, &qword_1000646A0);
        sub_100024668(v166, type metadata accessor for SingleContactQuickActionWidgetView);
        char v175 = sub_100053440();
        uint64_t v176 = v161 + *(int *)(v155 + 32);
        char v301 = *(unsigned char *)(v176 + 32);
        long long v177 = *(_OWORD *)(v176 + 16);
        v300[0] = *(_OWORD *)v176;
        v300[1] = v177;
        sub_100006AA8((uint64_t)v300, (uint64_t)v302, &qword_100064D18);
        sub_100024C60((uint64_t)v302, (void (*)(void, void, void, void, void))sub_100017AB8);
        sub_100024A2C();
        sub_100024C60((uint64_t)v300, (void (*)(void, void, void, void, void))sub_100017DBC);
        sub_100052FC0();
        uint64_t v179 = v178;
        uint64_t v181 = v180;
        uint64_t v183 = v182;
        uint64_t v185 = v184;
        uint64_t v187 = v241;
        uint64_t v186 = v242;
        uint64_t v188 = (uint64_t)v244;
        (*(void (**)(char *, char *, uint64_t))(v241 + 16))(v244, v174, v242);
        uint64_t v189 = v188 + *(int *)(v239 + 36);
        *(unsigned char *)uint64_t v189 = v175;
        *(void *)(v189 + 8) = v179;
        *(void *)(v189 + 16) = v181;
        *(void *)(v189 + 24) = v183;
        *(void *)(v189 + 32) = v185;
        *(unsigned char *)(v189 + 40) = 0;
        (*(void (**)(char *, uint64_t))(v187 + 8))(v174, v186);
        char v190 = sub_100053450();
        long long v191 = *(_OWORD *)(v176 + 16);
        v298[0] = *(_OWORD *)v176;
        v298[1] = v191;
        char v299 = *(unsigned char *)(v176 + 32);
        sub_100006AA8((uint64_t)v298, (uint64_t)v303, &qword_100064D18);
        sub_100024C60((uint64_t)v303, (void (*)(void, void, void, void, void))sub_100017AB8);
        sub_100024A2C();
        sub_100024C60((uint64_t)v298, (void (*)(void, void, void, void, void))sub_100017DBC);
        sub_100052FC0();
        uint64_t v193 = v192;
        uint64_t v195 = v194;
        uint64_t v197 = v196;
        uint64_t v199 = v198;
        uint64_t v200 = v246;
        sub_100016A1C(v188, v246, &qword_100064CB8);
        uint64_t v201 = v200 + *(int *)(v243 + 36);
        *(unsigned char *)uint64_t v201 = v190;
        *(void *)(v201 + 8) = v193;
        *(void *)(v201 + 16) = v195;
        *(void *)(v201 + 24) = v197;
        *(void *)(v201 + 32) = v199;
        *(unsigned char *)(v201 + 40) = 0;
        sub_100006918(v188, &qword_100064CB8);
        char v202 = sub_100053460();
        long long v203 = *(_OWORD *)(v176 + 16);
        v296[0] = *(_OWORD *)v176;
        v296[1] = v203;
        char v297 = *(unsigned char *)(v176 + 32);
        sub_100006AA8((uint64_t)v296, (uint64_t)&v304, &qword_100064D18);
        sub_100024C60((uint64_t)&v304, (void (*)(void, void, void, void, void))sub_100017AB8);
        sub_100024A2C();
        sub_100024C60((uint64_t)v296, (void (*)(void, void, void, void, void))sub_100017DBC);
        sub_100052FC0();
        uint64_t v205 = v204;
        uint64_t v207 = v206;
        uint64_t v209 = v208;
        uint64_t v211 = v210;
        uint64_t v212 = v248;
        sub_100016A1C(v200, v248, &qword_100064CC0);
        uint64_t v213 = v212 + *(int *)(v245 + 36);
        *(unsigned char *)uint64_t v213 = v202;
        *(void *)(v213 + 8) = v205;
        *(void *)(v213 + 16) = v207;
        *(void *)(v213 + 24) = v209;
        *(void *)(v213 + 32) = v211;
        *(unsigned char *)(v213 + 40) = 0;
        sub_100006918(v200, &qword_100064CC0);
        char v214 = sub_100053480();
        long long v215 = *(_OWORD *)(v176 + 16);
        v294[0] = *(_OWORD *)v176;
        v294[1] = v215;
        char v295 = *(unsigned char *)(v176 + 32);
        sub_100006AA8((uint64_t)v294, (uint64_t)v307, &qword_100064D18);
        sub_100024C60((uint64_t)v307, (void (*)(void, void, void, void, void))sub_100017AB8);
        sub_100024A2C();
        sub_100024C60((uint64_t)v294, (void (*)(void, void, void, void, void))sub_100017DBC);
        sub_100052FC0();
        uint64_t v217 = v216;
        uint64_t v219 = v218;
        uint64_t v221 = v220;
        uint64_t v223 = v222;
        uint64_t v224 = v247;
        sub_100016A1C(v212, v247, &qword_100064CC8);
        uint64_t v225 = v224 + *(int *)(v279 + 36);
        *(unsigned char *)uint64_t v225 = v214;
        *(void *)(v225 + 8) = v217;
        *(void *)(v225 + 16) = v219;
        *(void *)(v225 + 24) = v221;
        *(void *)(v225 + 32) = v223;
        *(unsigned char *)(v225 + 40) = 0;
        sub_100006918(v212, &qword_100064CC8);
        uint64_t v226 = v249;
        sub_100006AA8(v224, v249, &qword_100064CD0);
        sub_100016A1C(v226, v282, &qword_100064CD0);
        swift_storeEnumTagMultiPayload();
        sub_100024CA0();
        sub_100024EBC();
        uint64_t v107 = (uint64_t)v280;
        sub_1000533D0();
        sub_100006918(v226, &qword_100064CD0);
        goto LABEL_31;
      }
    }
    else
    {
      sub_100024668(v86, type metadata accessor for SingleContactWidgetEntryView);
    }
    sub_100016A1C(v85 + *(int *)(v78 + 24), (uint64_t)v65, &qword_1000646A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v60, v85 + *(int *)(v78 + 32), v87);
    uint64_t v99 = sub_1000539F0();
    uint64_t v100 = (uint64_t)v257;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v257, 1, 1, v99);
    sub_100024600((uint64_t)v65, v100);
    (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v100 + *(int *)(v88 + 20), v60, v87);
    sub_1000261E0(v100, v283, (uint64_t (*)(void))type metadata accessor for SingleContactSmallWidgetView);
    uint64_t v101 = v255;
    sub_1000212A8(v255);
    uint64_t v102 = sub_100052FB0();
    uint64_t v103 = *(void *)(v102 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102) == 1)
    {
      sub_100006918(v101, &qword_100064CE8);
      uint64_t v104 = sub_100052680();
      uint64_t v105 = (uint64_t)v256;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v256, 1, 1, v104);
      uint64_t v106 = v282;
      uint64_t v107 = (uint64_t)v280;
      uint64_t v108 = v284;
    }
    else
    {
      uint64_t v105 = (uint64_t)v256;
      sub_100052F60();
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v101, v102);
      uint64_t v109 = sub_100052680();
      uint64_t v110 = *(void *)(v109 - 8);
      int v111 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v110 + 48))(v105, 1, v109);
      uint64_t v106 = v282;
      uint64_t v107 = (uint64_t)v280;
      uint64_t v108 = v284;
      if (v111 != 1)
      {
        uint64_t v136 = v105;
        uint64_t v137 = v254;
        (*(void (**)(char *, uint64_t, uint64_t))(v110 + 32))(v254, v136, v109);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v110 + 56))(v137, 0, 1, v109);
        uint64_t v112 = (uint64_t)v137;
        goto LABEL_20;
      }
    }
    uint64_t v112 = (uint64_t)v254;
    sub_100052F70();
    sub_100006918(v105, &qword_1000646A0);
LABEL_20:
    sub_100024E74(&qword_100064D10, (void (*)(uint64_t))type metadata accessor for SingleContactSmallWidgetView);
    uint64_t v138 = v259;
    uint64_t v139 = v283;
    sub_100053610();
    sub_100006918(v112, &qword_1000646A0);
    sub_100024668(v139, (uint64_t (*)(void))type metadata accessor for SingleContactSmallWidgetView);
    uint64_t v140 = v85 + *(int *)(v108 + 32);
    char v306 = *(unsigned char *)(v140 + 32);
    long long v141 = *(_OWORD *)(v140 + 16);
    long long v304 = *(_OWORD *)v140;
    long long v305 = v141;
    sub_100006AA8((uint64_t)&v304, (uint64_t)v307, &qword_100064D18);
    sub_100024C60((uint64_t)v307, (void (*)(void, void, void, void, void))sub_100017AB8);
    double v142 = sub_100024A2C();
    uint64_t v144 = v143;
    uint64_t v146 = v145;
    uint64_t v148 = v147;
    sub_100024C60((uint64_t)&v304, (void (*)(void, void, void, void, void))sub_100017DBC);
    LOBYTE(v139) = sub_100053430();
    uint64_t v150 = v260;
    uint64_t v149 = v261;
    uint64_t v151 = (uint64_t)v258;
    (*(void (**)(char *, char *, uint64_t))(v260 + 16))(v258, v138, v261);
    uint64_t v152 = v151 + *(int *)(v278 + 36);
    *(unsigned char *)uint64_t v152 = v139;
    *(double *)(v152 + 8) = v142;
    *(void *)(v152 + 16) = v144;
    *(void *)(v152 + 24) = v146;
    *(void *)(v152 + 32) = v148;
    *(unsigned char *)(v152 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v150 + 8))(v138, v149);
    uint64_t v153 = v262;
    sub_100006AA8(v151, v262, &qword_100064C98);
    sub_100016A1C(v153, v106, &qword_100064C98);
    swift_storeEnumTagMultiPayload();
    sub_100024CA0();
    sub_100024EBC();
    sub_1000533D0();
    sub_100006918(v153, &qword_100064C98);
    uint64_t v135 = (uint64_t)v285;
LABEL_31:
    sub_100016A1C(v107, v290, &qword_100064CD8);
    swift_storeEnumTagMultiPayload();
    sub_100024F98();
    sub_100025FD8(&qword_100064D60, &qword_100064CD8, (void (*)(void))sub_100024CA0, (void (*)(void))sub_100024EBC);
    uint64_t v134 = (uint64_t)v287;
    sub_1000533D0();
    sub_100006918(v107, &qword_100064CD8);
    goto LABEL_32;
  }
  sub_100016A1C(v1 + *(int *)(v77 + 24), (uint64_t)v65, &qword_1000646A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v60, v1 + *(int *)(v78 + 32), v55);
  sub_10004FD7C((uint64_t)v65, (uint64_t)v60, (uint64_t)v67);
  uint64_t v79 = v1;
  sub_1000212A8((uint64_t)v38);
  uint64_t v80 = sub_100052FB0();
  uint64_t v81 = *(void *)(v80 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48))(v38, 1, v80) == 1)
  {
    sub_100006918((uint64_t)v38, &qword_100064CE8);
    uint64_t v82 = sub_100052680();
    uint64_t v83 = (uint64_t)v263;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v263, 1, 1, v82);
  }
  else
  {
    uint64_t v83 = (uint64_t)v263;
    sub_100052F60();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v38, v80);
    uint64_t v96 = sub_100052680();
    uint64_t v97 = *(void *)(v96 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v83, 1, v96) != 1)
    {
      uint64_t v98 = (uint64_t)v267;
      (*(void (**)(char *, uint64_t, uint64_t))(v97 + 32))(v267, v83, v96);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v97 + 56))(v98, 0, 1, v96);
      goto LABEL_18;
    }
  }
  uint64_t v98 = (uint64_t)v267;
  sub_100052F70();
  sub_100006918(v83, &qword_1000646A0);
LABEL_18:
  uint64_t v113 = sub_100024E74(&qword_100064D58, (void (*)(uint64_t))type metadata accessor for SingleContactSmallWidgetVerticalView);
  uint64_t v114 = v264;
  sub_100053610();
  sub_100006918(v98, &qword_1000646A0);
  sub_100024668((uint64_t)v67, (uint64_t (*)(void))type metadata accessor for SingleContactSmallWidgetVerticalView);
  uint64_t v115 = v274;
  uint64_t v116 = sub_100053400();
  __chkstk_darwin(v116);
  sub_1000538E0();
  v307[0] = v114;
  v307[1] = v113;
  swift_getOpaqueTypeConformance2();
  uint64_t v117 = v270;
  uint64_t v118 = v266;
  sub_1000536B0();
  (*(void (**)(uint64_t, uint64_t))(v275 + 8))(v115, v276);
  (*(void (**)(char *, uint64_t))(v265 + 8))(v70, v118);
  uint64_t v119 = v79 + *(int *)(v284 + 32);
  long long v120 = *(_OWORD *)(v119 + 16);
  long long v304 = *(_OWORD *)v119;
  long long v305 = v120;
  char v306 = *(unsigned char *)(v119 + 32);
  sub_100006AA8((uint64_t)&v304, (uint64_t)v307, &qword_100064D18);
  sub_100024C60((uint64_t)v307, (void (*)(void, void, void, void, void))sub_100017AB8);
  double v121 = sub_100024A2C();
  uint64_t v123 = v122;
  uint64_t v125 = v124;
  uint64_t v127 = v126;
  sub_100024C60((uint64_t)&v304, (void (*)(void, void, void, void, void))sub_100017DBC);
  char v128 = sub_100053430();
  uint64_t v130 = v271;
  uint64_t v129 = v272;
  uint64_t v131 = (uint64_t)v268;
  (*(void (**)(char *, char *, uint64_t))(v271 + 16))(v268, v117, v272);
  uint64_t v132 = v131 + *(int *)(v286 + 36);
  *(unsigned char *)uint64_t v132 = v128;
  *(double *)(v132 + 8) = v121;
  *(void *)(v132 + 16) = v123;
  *(void *)(v132 + 24) = v125;
  *(void *)(v132 + 32) = v127;
  *(unsigned char *)(v132 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v130 + 8))(v117, v129);
  uint64_t v133 = v273;
  sub_100006AA8(v131, v273, &qword_100064D00);
  sub_100016A1C(v133, v290, &qword_100064D00);
  swift_storeEnumTagMultiPayload();
  sub_100024F98();
  sub_100025FD8(&qword_100064D60, &qword_100064CD8, (void (*)(void))sub_100024CA0, (void (*)(void))sub_100024EBC);
  uint64_t v134 = (uint64_t)v287;
  sub_1000533D0();
  sub_100006918(v133, &qword_100064D00);
  uint64_t v135 = (uint64_t)v285;
LABEL_32:
  sub_100016A1C(v134, v135, &qword_100064D08);
  swift_storeEnumTagMultiPayload();
  sub_1000053FC(&qword_100064D68);
  sub_1000250C4();
  sub_1000250EC();
  sub_1000533D0();
  return sub_100006918(v134, &qword_100064D08);
}

uint64_t sub_10002387C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100053B40();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for SingleContactWidgetEntryView(0);
  sub_10002473C(&qword_100064760, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010005D920, (uint64_t)v8);
  if (sub_100052A20())
  {
    uint64_t v9 = sub_100053780();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    sub_100053B20();
    char v11 = sub_100053B10();
    uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
    v12(v6, v2);
    if (v11) {
      uint64_t v13 = sub_100053710();
    }
    else {
      uint64_t v13 = sub_100053720();
    }
    uint64_t v9 = v13;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v8, v2);
  }
  *a1 = v9;
  return result;
}

uint64_t sub_100023A34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000053FC(&qword_100064C80);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002187C((uint64_t)v4);
  sub_100016A1C((uint64_t)v4, a1, &qword_100064C80);
  return sub_100006918((uint64_t)v4, &qword_100064C80);
}

uint64_t sub_100023AD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v1 = sub_100053B50();
  uint64_t v63 = *(void *)(v1 - 8);
  uint64_t v64 = v1;
  __chkstk_darwin(v1);
  uint64_t v61 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000053FC(&qword_100064570);
  uint64_t v48 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000053FC(&qword_100064568);
  uint64_t v49 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000053FC(&qword_100064DB0);
  uint64_t v50 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1000053FC(&qword_100064DB8);
  uint64_t v53 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v51 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_1000053FC(&qword_100064DC0);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v54 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000053FC(&qword_100064DC8);
  uint64_t v59 = *(void *)(v13 - 8);
  uint64_t v60 = v13;
  __chkstk_darwin(v13);
  uint64_t v57 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100052A00();
  v47[0] = v16;
  v47[1] = v15;
  uint64_t v17 = sub_100052BE0();
  uint64_t v18 = sub_100052BD0();
  uint64_t v72 = v17;
  uint64_t v73 = &protocol witness table for ContactFetcher;
  *(void *)&long long v71 = v18;
  uint64_t v69 = sub_100052730();
  uint64_t v70 = &protocol witness table for Locale;
  sub_100006974((uint64_t *)&v68);
  sub_100052720();
  sub_100052810();
  if (sub_100052800())
  {
    uint64_t v19 = sub_100052DD0();
    swift_allocObject();
    uint64_t v20 = sub_100052DC0();
    uint64_t v21 = &protocol witness table for DemoStatusProvider;
  }
  else
  {
    uint64_t v19 = sub_100052C30();
    uint64_t v20 = sub_100052C20();
    uint64_t v21 = &protocol witness table for StatusProvider;
  }
  uint64_t v66 = v19;
  uint64_t v67 = v21;
  *(void *)&long long v65 = v20;
  sub_100052BC0();
  sub_100052DB0();
  swift_allocObject();
  uint64_t v22 = sub_100052DA0();
  sub_100052E10();
  uint64_t v23 = sub_100052E00();
  sub_10001672C(&v71, (uint64_t)&v74);
  sub_10001672C(&v68, (uint64_t)&v78);
  sub_10001672C(&v65, (uint64_t)v79);
  v79[5] = v22;
  v79[6] = v23;
  type metadata accessor for SingleContactWidgetEntryView(0);
  sub_100024E74(&qword_100064DD0, (void (*)(uint64_t))type metadata accessor for SingleContactWidgetEntryView);
  sub_10002608C();
  sub_100053C20();
  unint64_t v24 = sub_1000260E0();
  sub_1000533B0();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v5, v3);
  uint64_t v74 = v3;
  uint64_t v75 = (void *)v24;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100053380();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v8, v6);
  uint64_t v74 = sub_100053D80();
  uint64_t v75 = v26;
  *(void *)&long long v71 = v6;
  *((void *)&v71 + 1) = OpaqueTypeConformance2;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  unint64_t v28 = sub_1000068C4();
  uint64_t v30 = v51;
  uint64_t v29 = v52;
  sub_100053390();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v29);
  *(void *)&long long v71 = sub_100053D80();
  *((void *)&v71 + 1) = v31;
  uint64_t v74 = v29;
  uint64_t v75 = &type metadata for String;
  uint64_t v76 = v27;
  unint64_t v77 = v28;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v54;
  uint64_t v34 = v55;
  sub_100053350();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v30, v34);
  sub_1000053FC(&qword_100064718);
  uint64_t v35 = sub_100053BA0();
  uint64_t v36 = *(void *)(v35 - 8);
  unint64_t v37 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_100054930;
  (*(void (**)(unint64_t, void, uint64_t))(v36 + 104))(v38 + v37, enum case for WidgetFamily.systemSmall(_:), v35);
  uint64_t v74 = v34;
  uint64_t v75 = &type metadata for String;
  uint64_t v76 = v32;
  unint64_t v77 = v28;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v41 = v57;
  uint64_t v40 = v58;
  sub_100053360();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v40);
  uint64_t v43 = v63;
  uint64_t v42 = v64;
  uint64_t v44 = v61;
  (*(void (**)(char *, void, uint64_t))(v63 + 104))(v61, enum case for WidgetBackgroundStyle.blur(_:), v64);
  uint64_t v74 = v40;
  uint64_t v75 = (void *)v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v45 = v60;
  sub_1000533A0();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v41, v45);
}

uint64_t sub_1000243D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000053FC(&qword_100064758);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1000053FC(&qword_100064598);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for SingleContactTimelineEntry(0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002613C(a1, (uint64_t)v12, type metadata accessor for SingleContactTimelineEntry);
  uint64_t *v9 = swift_getKeyPath();
  sub_1000053FC(&qword_100064590);
  swift_storeEnumTagMultiPayload();
  *uint64_t v6 = swift_getKeyPath();
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000261E0((uint64_t)v12, a2, type metadata accessor for SingleContactTimelineEntry);
  uint64_t v14 = (int *)type metadata accessor for SingleContactWidgetEntryView(0);
  uint64_t v15 = v14[5];
  sub_100052BE0();
  *(void *)(a2 + v15) = sub_100052BD0();
  sub_100006AA8((uint64_t)v9, a2 + v14[6], &qword_100064598);
  uint64_t result = sub_100006AA8((uint64_t)v6, a2 + v14[7], &qword_100064758);
  uint64_t v17 = a2 + v14[8];
  *(void *)uint64_t v17 = KeyPath;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(unsigned char *)(v17 + 32) = 0;
  return result;
}

uint64_t sub_100024600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_1000646A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024668(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000246C8@<X0>(uint64_t a1@<X8>)
{
  return sub_10002473C(&qword_100064590, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_100024704@<X0>(uint64_t a1@<X8>)
{
  return sub_10002473C(&qword_100064768, (uint64_t (*)(void))&type metadata accessor for ContentSizeCategory, 0xD000000000000013, 0x800000010005DB20, a1);
}

uint64_t sub_10002473C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1000532B0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000053FC(a1);
  __chkstk_darwin();
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016A1C(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_100053F20();
    uint64_t v20 = sub_100053420();
    if (os_log_type_enabled(v20, v19))
    {
      unint64_t v24 = a4;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v25 = a5;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v27 = sub_10002586C(v26, v24, &v28);
      sub_100053F70();
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000532A0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000249F4@<X0>(uint64_t a1@<X8>)
{
  return sub_10002473C(&qword_100064760, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010005D920, a1);
}

double sub_100024A2C()
{
  uint64_t v1 = sub_1000532B0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v0[32] == 1) {
    return *(double *)v0;
  }
  swift_retain();
  os_log_type_t v6 = sub_100053F20();
  uint64_t v7 = sub_100053420();
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v10[0] = v9 + 4;
    v10[1] = sub_10002586C(0x65736E4965676445, 0xEA00000000007374, &v11);
    sub_100053F70();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000532A0();
  swift_getAtKeyPath();
  sub_100024C60((uint64_t)v0, (void (*)(void, void, void, void, void))sub_100017DBC);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return *(double *)&v11;
}

uint64_t sub_100024C60(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_100024CA0()
{
  return sub_100024CF0(&qword_100064D20, &qword_100064CD0, (void (*)(void))sub_100024CC8);
}

uint64_t sub_100024CC8()
{
  return sub_100024CF0(&qword_100064D28, &qword_100064CC8, (void (*)(void))sub_100024D70);
}

uint64_t sub_100024CF0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100024D70()
{
  return sub_100024CF0(&qword_100064D30, &qword_100064CC0, (void (*)(void))sub_100024D98);
}

unint64_t sub_100024D98()
{
  unint64_t result = qword_100064D38;
  if (!qword_100064D38)
  {
    sub_100005440(&qword_100064CB8);
    type metadata accessor for SingleContactQuickActionWidgetView(255);
    sub_100024E74(&qword_100064D40, (void (*)(uint64_t))type metadata accessor for SingleContactQuickActionWidgetView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064D38);
  }
  return result;
}

uint64_t sub_100024E74(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100024EBC()
{
  unint64_t result = qword_100064D48;
  if (!qword_100064D48)
  {
    sub_100005440(&qword_100064C98);
    type metadata accessor for SingleContactSmallWidgetView();
    sub_100024E74(&qword_100064D10, (void (*)(uint64_t))type metadata accessor for SingleContactSmallWidgetView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064D48);
  }
  return result;
}

unint64_t sub_100024F98()
{
  unint64_t result = qword_100064D50;
  if (!qword_100064D50)
  {
    sub_100005440(&qword_100064D00);
    sub_100005440(&qword_100064CF0);
    type metadata accessor for SingleContactSmallWidgetVerticalView();
    sub_100024E74(&qword_100064D58, (void (*)(uint64_t))type metadata accessor for SingleContactSmallWidgetVerticalView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064D50);
  }
  return result;
}

uint64_t sub_1000250C4()
{
  return sub_100024CF0(&qword_100064D70, &qword_100064D68, (void (*)(void))sub_100012C4C);
}

unint64_t sub_1000250EC()
{
  unint64_t result = qword_100064D78;
  if (!qword_100064D78)
  {
    sub_100005440(&qword_100064D08);
    sub_100024F98();
    sub_100025FD8(&qword_100064D60, &qword_100064CD8, (void (*)(void))sub_100024CA0, (void (*)(void))sub_100024EBC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064D78);
  }
  return result;
}

uint64_t sub_1000251A0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000532B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100053F20();
  uint64_t v9 = sub_100053420();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10002586C(1819242306, 0xE400000000000000, &v14);
    sub_100053F70();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000532A0();
  swift_getAtKeyPath();
  sub_100011254(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1000253A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10002473C(&qword_100064D80, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_1000253E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000532B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 0x100) != 0)
  {
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v12 = sub_100053F20();
    uint64_t v13 = sub_100053420();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v8;
      uint64_t v15 = (uint8_t *)v14;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v19 = v9;
      uint64_t v22 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v18 = v15 + 4;
      uint64_t v21 = sub_10002586C(0xD00000000000001ALL, 0x800000010005DB40, &v22);
      sub_100053F70();
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      uint64_t v9 = v19;
      swift_slowDealloc();
      uint64_t v8 = v20;
      swift_slowDealloc();
    }

    sub_1000532A0();
    swift_getAtKeyPath();
    sub_100026248(a1, a2, a3, a4, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v22;
  }
  return a1;
}

uint64_t sub_100025640()
{
  return sub_1000530E0();
}

uint64_t sub_100025664(uint64_t a1)
{
  uint64_t v2 = sub_100052FE0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000530F0();
}

uint64_t sub_10002572C()
{
  sub_1000531F0();
  sub_100024E74(&qword_100064D90, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_1000532C0();
  return v1;
}

uint64_t sub_1000257A8@<X0>(unsigned char *a1@<X8>)
{
  sub_1000531F0();
  sub_100024E74(&qword_100064D90, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_1000532C0();
  *a1 = v3;
  return result;
}

uint64_t sub_10002583C()
{
  return sub_1000530E0();
}

uint64_t sub_100025864@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002387C(a1);
}

uint64_t sub_10002586C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100025940(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100025AFC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100025AFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100010614((uint64_t)v12);
  return v7;
}

uint64_t sub_100025940(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100053F80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100025B58(a5, a6);
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
  uint64_t v8 = sub_100054010();
  if (!v8)
  {
    sub_100054030();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100054080();
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

uint64_t sub_100025AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100025B58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100025BF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100025DD0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100025DD0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100025BF0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100025D68(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100053FF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100054030();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100053DB0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100054080();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100054030();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100025D68(uint64_t a1, uint64_t a2)
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
  sub_1000053FC(&qword_100064D88);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100025DD0(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000053FC(&qword_100064D88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

unint64_t sub_100025F24()
{
  unint64_t result = qword_100064D98;
  if (!qword_100064D98)
  {
    sub_100005440(&qword_100064DA0);
    sub_100025FD8(&qword_100064DA8, &qword_100064C80, (void (*)(void))sub_1000250C4, (void (*)(void))sub_1000250EC);
    sub_100017584();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064D98);
  }
  return result;
}

uint64_t sub_100025FD8(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SingleContactWidgetConfiguration()
{
  return &type metadata for SingleContactWidgetConfiguration;
}

uint64_t sub_100026070()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002608C()
{
  unint64_t result = qword_100064DD8;
  if (!qword_100064DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064DD8);
  }
  return result;
}

unint64_t sub_1000260E0()
{
  unint64_t result = qword_100064578;
  if (!qword_100064578)
  {
    sub_100005440(&qword_100064570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064578);
  }
  return result;
}

uint64_t sub_10002613C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000261B0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100053230();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_1000261E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100026248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    swift_release();
  }

  return swift_release();
}

uint64_t destroy for SingleContactTimelineProvider(uint64_t a1)
{
  sub_100010614(a1);
  sub_100010614(a1 + 40);
  sub_100010614(a1 + 80);
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SingleContactTimelineProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  uint64_t v7 = *(void *)(a2 + 120);
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = v7;
  *(void *)(a1 + 128) = v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for SingleContactTimelineProvider(uint64_t *a1, uint64_t *a2)
{
  a1[15] = a2[15];
  swift_retain();
  swift_release();
  a1[16] = a2[16];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SingleContactTimelineProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for SingleContactTimelineProvider(uint64_t a1, uint64_t a2)
{
  sub_100010614(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_100010614(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_100010614(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SingleContactTimelineProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SingleContactTimelineProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SingleContactTimelineProvider()
{
  return &type metadata for SingleContactTimelineProvider;
}

uint64_t sub_1000265DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026770()
{
  return sub_100024E74(&qword_100064DE0, (void (*)(uint64_t))type metadata accessor for SingleContactTimelineEntry);
}

uint64_t sub_1000267B8()
{
  return sub_100024E74(qword_100064DE8, (void (*)(uint64_t))&type metadata accessor for SelectPerson);
}

uint64_t sub_100026800(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = sub_1000527D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100052910();
  uint64_t v8 = sub_1000527C0();
  os_log_type_t v9 = sub_100053F10();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_10002586C(0xD00000000000001FLL, a3, &v13);
    sub_100053F70();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Should not be calling the completion version of %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000269CC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026A04()
{
  unsigned __int8 v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned __int8 v1 = v0;
  v1[1] = sub_1000175D8;
  return _swift_task_switch(sub_10001E7A0, 0, 0);
}

uint64_t sub_100026AA8(uint64_t a1)
{
  return sub_10001E83C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 72), *(double *)(v1 + 64), *(void *)(v1 + 80));
}

uint64_t sub_100026AE0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100026B18()
{
  uint64_t v1 = sub_100052BC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v27 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v27 + 160) & ~v27;
  uint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(sub_1000053FC(&qword_1000646E0) - 8);
  uint64_t v24 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v23 = *(void *)(v5 + 64);
  uint64_t v28 = sub_100053C90();
  uint64_t v6 = *(void *)(v28 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v21 = *(void *)(v6 + 64);
  uint64_t v26 = sub_1000053FC(&qword_100064E40);
  uint64_t v7 = *(void *)(v26 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = *(void *)(v7 + 64);
  uint64_t v25 = sub_1000527A0();
  uint64_t v9 = *(void *)(v25 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = *(void *)(v9 + 64);
  sub_100010614(v0 + 16);
  sub_100010614(v0 + 56);
  sub_100010614(v0 + 96);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  uint64_t v11 = (v4 + v24) & ~v24;
  uint64_t v12 = sub_100053AB0();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v0 + v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0 + v11, v12);
  }
  uint64_t v14 = v27 | v24 | v22 | v8 | v10 | 7;
  unint64_t v15 = (((((v23 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v22 + 8) & ~v22;
  unint64_t v16 = (v15 + v21 + v8) & ~v8;
  unint64_t v17 = (v16 + v20 + v10) & ~v10;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v15, v28);
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v16, v26);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v17, v25);

  return _swift_deallocObject(v0, v17 + v19, v14);
}

uint64_t sub_100026ED0(void (*a1)(void, void), char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(sub_100052BC0() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_1000053FC(&qword_1000646E0) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = (*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)(sub_100053C90() - 8);
  unint64_t v13 = (v11 + *(unsigned __int8 *)(v12 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = *(void *)(v12 + 64);
  uint64_t v15 = *(void *)(sub_1000053FC(&qword_100064E40) - 8);
  unint64_t v16 = (v13 + v14 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v15 + 64);
  uint64_t v18 = *(void *)(sub_1000527A0() - 8);
  return sub_10001EF14(a1, v4, (char *)(v2 + 16), *(void **)(v2 + 152), v2 + v6, v2 + v9, *(char **)(v2 + v10), *(char **)(v2 + v10 + 8), *(double *)(v2 + v11), v2 + v13, v2 + v16, v2 + ((v16 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)));
}

uint64_t sub_10002710C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100020568(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), a2);
}

uint64_t sub_100027134(uint64_t a1)
{
  return sub_10001BD0C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_100027148()
{
  uint64_t v20 = sub_1000053FC(&qword_100064E60);
  uint64_t v1 = *(void *)(v20 - 8);
  uint64_t v23 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v2 = (v23 + 160) & ~v23;
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = sub_100052BC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v2 + v3 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = *(void *)(sub_1000053FC(&qword_1000646E0) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = (v7 + v8 + v10) & ~v10;
  uint64_t v21 = *(void *)(v9 + 64);
  uint64_t v22 = sub_1000527A0();
  uint64_t v11 = *(void *)(v22 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = *(void *)(v11 + 64);
  sub_100010614(v0 + 16);
  sub_100010614(v0 + 56);
  sub_100010614(v0 + 96);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v2, v20);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v4);
  uint64_t v13 = sub_100053AB0();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v0 + v18, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0 + v18, v13);
  }
  uint64_t v15 = v23 | v6 | v10 | v12 | 7;
  unint64_t v16 = (((v21 + v18 + 7) & 0xFFFFFFFFFFFFFFF8) + v12 + 16) & ~v12;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v0 + v16, v22);

  return _swift_deallocObject(v0, v16 + v19, v15);
}

uint64_t sub_100027460(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(sub_1000053FC(&qword_100064E60) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_100052BC0() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(sub_1000053FC(&qword_1000646E0) - 8);
  unint64_t v12 = (v9 + v10 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(sub_1000527A0() - 8);
  return sub_10001C294(a1, v4, v2 + 16, *(void **)(v2 + 152), v2 + v6, v2 + v9, v2 + v12, *(void *)(v2 + v13), *(void *)(v2 + v13 + 8), v2 + ((v13 + *(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)));
}

ValueMetadata *type metadata accessor for MetricLauncher()
{
  return &type metadata for MetricLauncher;
}

uint64_t sub_100027638()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100027654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v30 = a2;
  uint64_t v2 = sub_1000053FC(&qword_100065030);
  uint64_t v26 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v25 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000053FC(&qword_100065038);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1000053FC(&qword_100065040);
  uint64_t v6 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100053B40();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v25 - v14;
  sub_1000249F4((uint64_t)&v25 - v14);
  sub_100053B30();
  char v16 = sub_100053B10();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
  if (v16)
  {
    uint64_t v18 = sub_100006BF0(&qword_100065048, &qword_100065030);
    sub_100053600();
    uint64_t v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v5, v8, v29);
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = v2;
    uint64_t v32 = v18;
    swift_getOpaqueTypeConformance2();
    sub_1000533D0();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  }
  else
  {
    uint64_t v22 = v25;
    uint64_t v21 = v26;
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
    v23(v25, v28, v2);
    v23(v5, (uint64_t)v22, v2);
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = sub_100006BF0(&qword_100065048, &qword_100065030);
    uint64_t v31 = v2;
    uint64_t v32 = v24;
    swift_getOpaqueTypeConformance2();
    sub_1000533D0();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v22, v2);
  }
}

uint64_t sub_100027A7C()
{
  return sub_100053030();
}

uint64_t sub_100027A9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v49 = a2;
  uint64_t v2 = sub_1000053FC(&qword_100064E68);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_1000053FC(&qword_100064E70);
  __chkstk_darwin(v48);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1000053FC(&qword_100064E78);
  __chkstk_darwin(v50);
  uint64_t v43 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000528C0();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000528A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100052680();
  uint64_t v46 = *(void *)(v19 - 8);
  uint64_t v47 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v42 = (char *)&v38 - v23;
  char v24 = sub_100052BF0();
  uint64_t v25 = v51;
  if ((v24 & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v38 = v5;
  uint64_t v39 = v3;
  uint64_t v26 = v50;
  uint64_t v40 = v2;
  uint64_t v41 = v7;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for PeopleURL.PathAction.showGatheredMetrics(_:), v12);
  sub_100028E6C((uint64_t)&_swiftEmptyArrayStorage);
  sub_100029060((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v11, enum case for PeopleURL.Scheme.people(_:), v45);
  sub_100052670();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v18, 1, v47) == 1)
  {
    sub_100006918((uint64_t)v18, &qword_1000646A0);
    uint64_t v3 = v39;
    uint64_t v2 = v40;
    uint64_t v7 = v41;
    uint64_t v25 = v51;
    uint64_t v5 = v38;
LABEL_4:
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v27(v5, v25, v2);
    v27(v7, (uint64_t)v5, v2);
    swift_storeEnumTagMultiPayload();
    sub_100028268();
    sub_100006BF0(&qword_100064E88, &qword_100064E68);
    sub_1000533D0();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v30 = v46;
  uint64_t v29 = v47;
  uint64_t v31 = v42;
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v42, v18, v47);
  uint64_t v32 = sub_1000538A0();
  uint64_t v34 = v33;
  uint64_t v35 = (uint64_t)v43;
  uint64_t v36 = &v43[*(int *)(v26 + 36)];
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v22, v31, v29);
  sub_1000053FC(&qword_100064EA0);
  sub_100029254();
  sub_100053550();
  unint64_t v37 = (uint64_t *)&v36[*(int *)(sub_1000053FC(&qword_100064E98) + 36)];
  *unint64_t v37 = v32;
  v37[1] = v34;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v35, v51, v40);
  sub_100016A1C(v35, (uint64_t)v41, &qword_100064E78);
  swift_storeEnumTagMultiPayload();
  sub_100028268();
  sub_100006BF0(&qword_100064E88, &qword_100064E68);
  sub_1000533D0();
  sub_100006918(v35, &qword_100064E78);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v29);
}

double sub_1000280CC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000537A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100053790();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  uint64_t v6 = sub_1000537D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1000538E0();
  sub_100053050();
  uint64_t v7 = v12;
  char v8 = v13;
  uint64_t v9 = v14;
  char v10 = v15;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  double result = *(double *)&v16;
  *(_OWORD *)(a1 + 40) = v16;
  *(void *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 64) = 1;
  return result;
}

unint64_t sub_100028268()
{
  unint64_t result = qword_100064E80;
  if (!qword_100064E80)
  {
    sub_100005440(&qword_100064E78);
    sub_100006BF0(&qword_100064E88, &qword_100064E68);
    sub_100006BF0(&qword_100064E90, &qword_100064E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064E80);
  }
  return result;
}

uint64_t sub_10002832C()
{
  uint64_t v0 = sub_1000526E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v4 setTimeStyle:1];
  [v4 setDateStyle:0];
  uint64_t v5 = sub_100053D80();
  uint64_t v7 = v6;
  sub_1000526D0();
  Class isa = sub_1000526C0().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v9 = [v4 stringFromDate:isa];

  uint64_t v10 = sub_100053D30();
  uint64_t v12 = v11;

  v14[0] = v5;
  v14[1] = v7;
  swift_bridgeObjectRetain();
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  sub_100053DA0(v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14[0];
}

uint64_t sub_1000284D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v33[1] = a2;
  uint64_t v3 = sub_1000053FC(&qword_100065050);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000053FC(&qword_100065058);
  __chkstk_darwin(v7);
  id v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_100065060);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_1000053FC(&qword_100065068);
  uint64_t v14 = __chkstk_darwin(v13);
  long long v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v33 - v17;
  if (sub_100052C00())
  {
    *uint64_t v12 = sub_1000538C0();
    v12[1] = v19;
    uint64_t v20 = sub_1000053FC(&qword_100065088);
    sub_100028880(v33[0], (uint64_t)v12 + *(int *)(v20 + 44));
    char v21 = sub_100053430();
    sub_100052FC0();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    sub_100016A1C((uint64_t)v12, (uint64_t)v16, &qword_100065060);
    uint64_t v30 = &v16[*(int *)(v13 + 36)];
    *uint64_t v30 = v21;
    *((void *)v30 + 1) = v23;
    *((void *)v30 + 2) = v25;
    *((void *)v30 + 3) = v27;
    *((void *)v30 + 4) = v29;
    v30[40] = 0;
    sub_100006918((uint64_t)v12, &qword_100065060);
    sub_10002A640((uint64_t)v16, (uint64_t)v18);
    sub_100016A1C((uint64_t)v18, (uint64_t)v9, &qword_100065068);
    swift_storeEnumTagMultiPayload();
    sub_10002A5A0();
    sub_100006BF0(&qword_100065080, &qword_100065050);
    sub_1000533D0();
    return sub_100006918((uint64_t)v18, &qword_100065068);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v32(v6, a1, v3);
    v32(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    sub_10002A5A0();
    sub_100006BF0(&qword_100065080, &qword_100065050);
    sub_1000533D0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100028880@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v69 = a2;
  uint64_t v2 = sub_1000534F0();
  uint64_t v62 = *(void *)(v2 - 8);
  uint64_t v63 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = &v56[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000053FC(&qword_100065090);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v56[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v65 = sub_1000053FC(&qword_100065050);
  uint64_t v68 = *(void *)(v65 - 8);
  uint64_t v8 = v68;
  uint64_t v9 = __chkstk_darwin(v65);
  uint64_t v67 = &v56[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v66 = &v56[-v11];
  uint64_t v12 = *(void (**)(void))(v8 + 16);
  uint64_t v60 = v8 + 16;
  uint64_t v64 = v12;
  v12();
  *(void *)&long long v72 = sub_10002832C();
  *((void *)&v72 + 1) = v13;
  sub_1000068C4();
  uint64_t v14 = sub_1000535E0();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_100053750();
  uint64_t v19 = sub_100053590();
  uint64_t v58 = v20;
  uint64_t v59 = v21;
  char v23 = v22;
  swift_release();
  int v57 = v23 & 1;
  sub_10002A6A8(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_1000534B0();
  uint64_t v24 = sub_1000534A0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 1, 1, v24);
  sub_1000534E0();
  sub_100006918((uint64_t)v7, &qword_100065090);
  uint64_t v26 = v62;
  uint64_t v25 = v63;
  (*(void (**)(unsigned char *, void, uint64_t))(v62 + 104))(v4, enum case for Font.Leading.tight(_:), v63);
  sub_100053500();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v26 + 8))(v4, v25);
  uint64_t v27 = v58;
  LOBYTE(v26) = v57;
  uint64_t v28 = sub_1000535C0();
  uint64_t v30 = v29;
  char v32 = v31;
  uint64_t v34 = v33;
  swift_release();
  char v35 = v32 & 1;
  sub_10002A6A8(v19, v27, v26);
  swift_bridgeObjectRelease();
  uint64_t v36 = type metadata accessor for TimeStampModifier(0);
  double v37 = -8.0;
  if (*(unsigned char *)(v61 + *(int *)(v36 + 20))) {
    double v37 = 16.0;
  }
  uint64_t v82 = v28;
  uint64_t v83 = v30;
  char v84 = v35;
  uint64_t v85 = v34;
  uint64_t v86 = 0;
  double v87 = v37;
  sub_1000538E0();
  sub_10004C68C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v72, 0.0, 1, 0.0, 1);
  sub_10002A6A8(v28, v30, v35);
  swift_bridgeObjectRelease();
  uint64_t v39 = v66;
  uint64_t v38 = v67;
  uint64_t v41 = v64;
  uint64_t v40 = v65;
  ((void (*)(unsigned char *, unsigned char *, uint64_t))v64)(v67, v66, v65);
  uint64_t v42 = v69;
  ((void (*)(uint64_t, unsigned char *, uint64_t))v41)(v69, v38, v40);
  uint64_t v43 = *(int *)(sub_1000053FC(&qword_100065098) + 48);
  long long v44 = v79;
  v70[6] = v78;
  v70[7] = v79;
  long long v45 = v80;
  long long v46 = v81;
  v70[8] = v80;
  v70[9] = v81;
  long long v47 = v76;
  long long v48 = v77;
  v70[4] = v76;
  v70[5] = v77;
  long long v49 = v74;
  long long v50 = v75;
  v70[2] = v74;
  v70[3] = v75;
  long long v51 = v72;
  long long v52 = v73;
  v70[0] = v72;
  v70[1] = v73;
  uint64_t v53 = (long long *)(v42 + v43);
  v53[6] = v78;
  v53[7] = v44;
  v53[8] = v45;
  v53[9] = v46;
  v53[2] = v49;
  v53[3] = v50;
  v53[4] = v47;
  v53[5] = v48;
  *uint64_t v53 = v51;
  v53[1] = v52;
  sub_10002A6B8((uint64_t)v70);
  uint64_t v54 = *(void (**)(unsigned char *, uint64_t))(v68 + 8);
  v54(v39, v40);
  v71[6] = v78;
  v71[7] = v79;
  v71[8] = v80;
  v71[9] = v81;
  v71[2] = v74;
  v71[3] = v75;
  v71[4] = v76;
  v71[5] = v77;
  v71[0] = v72;
  v71[1] = v73;
  sub_10002A708((uint64_t)v71);
  return ((uint64_t (*)(unsigned char *, uint64_t))v54)(v38, v40);
}

unint64_t sub_100028E6C(uint64_t a1)
{
  uint64_t v2 = sub_1000053FC(&qword_100064EE0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000053FC(&qword_100064EE8);
  uint64_t v6 = sub_100054070();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100016A1C(v12, (uint64_t)v5, &qword_100064EE0);
    unint64_t result = sub_100029418((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_1000528D0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(_OWORD *)(v7[7] + 16 * v16) = *(_OWORD *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

unint64_t sub_100029060(uint64_t a1)
{
  uint64_t v2 = sub_1000053FC(&qword_100064EC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000053FC(&qword_100064EC8);
  uint64_t v6 = sub_100054070();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100016A1C(v12, (uint64_t)v5, &qword_100064EC0);
    unint64_t result = sub_100029344((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_1000528B0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

unint64_t sub_100029254()
{
  unint64_t result = qword_100064EA8;
  if (!qword_100064EA8)
  {
    sub_100005440(&qword_100064EA0);
    sub_1000292D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064EA8);
  }
  return result;
}

unint64_t sub_1000292D0()
{
  unint64_t result = qword_100064EB0;
  if (!qword_100064EB0)
  {
    sub_100005440(&qword_100064EB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064EB0);
  }
  return result;
}

unint64_t sub_100029344(uint64_t a1)
{
  sub_1000528B0();
  sub_10002968C(&qword_100064ED0, (void (*)(uint64_t))&type metadata accessor for PeopleURL.ArrayParameter);
  uint64_t v2 = sub_100053D00();
  return sub_1000294EC(a1, v2, (uint64_t (*)(void))&type metadata accessor for PeopleURL.ArrayParameter, &qword_100064ED8, (void (*)(uint64_t))&type metadata accessor for PeopleURL.ArrayParameter, (uint64_t)&protocol conformance descriptor for PeopleURL.ArrayParameter);
}

unint64_t sub_100029418(uint64_t a1)
{
  sub_1000528D0();
  sub_10002968C(&qword_100064EF0, (void (*)(uint64_t))&type metadata accessor for PeopleURL.Parameter);
  uint64_t v2 = sub_100053D00();
  return sub_1000294EC(a1, v2, (uint64_t (*)(void))&type metadata accessor for PeopleURL.Parameter, &qword_100064EF8, (void (*)(uint64_t))&type metadata accessor for PeopleURL.Parameter, (uint64_t)&protocol conformance descriptor for PeopleURL.Parameter);
}

unint64_t sub_1000294EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  char v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    char v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_10002968C(v23, v24);
      char v19 = sub_100053D10();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

uint64_t sub_10002968C(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_1000296D4(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

void *sub_1000297F4(void *a1, void *a2, uint64_t a3)
{
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100053B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_1000298C0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064760);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_1000299A4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100053B40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_100029A78(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064760);
    uint64_t v6 = sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100053B40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100029B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100029B78);
}

uint64_t sub_100029B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000053FC(&qword_100064758);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100029C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100029C60);
}

uint64_t sub_100029C60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000053FC(&qword_100064758);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata accessor for TimeStampModifier(uint64_t a1)
{
  return sub_100014EF8(a1, qword_100064F58);
}

void sub_100029D40()
{
  sub_100029DD4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100029DD4()
{
  if (!qword_1000648A0)
  {
    sub_100053B40();
    unint64_t v0 = sub_100052FF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000648A0);
    }
  }
}

uint64_t *sub_100029E2C(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(sub_1000053FC(&qword_100064760) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_100053B40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100029F38(uint64_t a1)
{
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100053B40();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100029FDC(void *a1, void *a2)
{
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100053B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10002A098(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064760);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10002A16C(void *a1, const void *a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100053B40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_10002A230(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_100006918((uint64_t)a1, &qword_100064760);
    uint64_t v4 = sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_100053B40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10002A30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A320);
}

uint64_t sub_10002A320(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100064758);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10002A390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A3A4);
}

uint64_t sub_10002A3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100064758);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for WidgetAccentModifier(uint64_t a1)
{
  return sub_100014EF8(a1, qword_100064FE8);
}

void sub_10002A438()
{
  sub_100029DD4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_10002A4C8()
{
  unint64_t result = qword_100065020;
  if (!qword_100065020)
  {
    sub_100005440(&qword_100065028);
    sub_100028268();
    sub_100006BF0(&qword_100064E88, &qword_100064E68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065020);
  }
  return result;
}

uint64_t sub_10002A568()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002A584()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002A5A0()
{
  unint64_t result = qword_100065070;
  if (!qword_100065070)
  {
    sub_100005440(&qword_100065068);
    sub_100006BF0(&qword_100065078, &qword_100065060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065070);
  }
  return result;
}

uint64_t sub_10002A640(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100065068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A6A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10002A6B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002A6F8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10002A708(uint64_t a1)
{
  return a1;
}

unint64_t sub_10002A74C()
{
  unint64_t result = qword_1000650A0;
  if (!qword_1000650A0)
  {
    sub_100005440(&qword_1000650A8);
    sub_100005440(&qword_100065030);
    sub_100006BF0(&qword_100065048, &qword_100065030);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000650A0);
  }
  return result;
}

unint64_t sub_10002A828()
{
  unint64_t result = qword_1000650B0;
  if (!qword_1000650B0)
  {
    sub_100005440(&qword_1000650B8);
    sub_10002A5A0();
    sub_100006BF0(&qword_100065080, &qword_100065050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000650B0);
  }
  return result;
}

uint64_t sub_10002A8CC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, long long *a4@<X3>, void *a5@<X4>, void *a6@<X5>, void **a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  char v31 = a3;
  char v32 = a4;
  uint64_t v14 = sub_1000053FC(&qword_1000646E8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100053AF0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  BOOL v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a7 = 0;
  uint64_t v21 = (int *)type metadata accessor for StatusAndNameView();
  uint64_t v22 = (char *)a7 + v21[12];
  *(void *)uint64_t v22 = swift_getKeyPath();
  *((void *)v22 + 1) = 0;
  v22[16] = 0;
  char v23 = (uint64_t *)((char *)a7 + v21[13]);
  uint64_t *v23 = swift_getKeyPath();
  sub_1000053FC(&qword_100064768);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = (uint64_t *)((char *)a7 + v21[14]);
  *uint64_t v24 = swift_getKeyPath();
  sub_1000053FC(&qword_100064D80);
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = (uint64_t *)((char *)a7 + v21[15]);
  *uint64_t v25 = swift_getKeyPath();
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = *a7;
  id v27 = a1;

  *a7 = a1;
  sub_100016A1C(a2, (uint64_t)v16, &qword_1000646E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_100053960();

    sub_100006918(a2, &qword_1000646E8);
    sub_100006918((uint64_t)v16, &qword_1000646E8);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)a7 + v21[5], v20, v17);
  }
  else
  {

    sub_100006918(a2, &qword_1000646E8);
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v28(v20, v16, v17);
    v28((char *)a7 + v21[5], v20, v17);
  }
  uint64_t v29 = v32;
  *(void **)((char *)a7 + v21[6]) = v31;
  *(double *)((char *)a7 + v21[7]) = a8;
  uint64_t result = sub_10001672C(v29, (uint64_t)a7 + v21[8]);
  *(void **)((char *)a7 + v21[9]) = v33;
  *(void **)((char *)a7 + v21[10]) = v34;
  *(double *)((char *)a7 + v21[11]) = a9;
  return result;
}

uint64_t type metadata accessor for StatusAndNameView()
{
  uint64_t result = qword_100065120;
  if (!qword_100065120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002AC20@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v3 = sub_1000053FC(&qword_100065190);
  __chkstk_darwin(v3 - 8);
  char v84 = (uint64_t *)((char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000053FC(&qword_100065198);
  uint64_t v102 = *(void *)(v5 - 8);
  uint64_t v103 = v5;
  __chkstk_darwin(v5);
  uint64_t v83 = (uint64_t)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100053330();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v85 = (uint64_t)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000053FC(&qword_1000651A0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v104 = (uint64_t)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v101 = (char *)&v82 - v11;
  uint64_t v12 = sub_1000534F0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1000053FC(&qword_1000651A8);
  uint64_t v16 = __chkstk_darwin(v98);
  uint64_t v100 = (uint64_t)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v97 = (char *)&v82 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v96 = (char *)&v82 - v21;
  __chkstk_darwin(v20);
  uint64_t v99 = (uint64_t)&v82 - v22;
  char v23 = *a1;
  if (*a1)
  {
    uint64_t v24 = type metadata accessor for StatusAndNameView();
    sub_1000162D8((void **)((char *)a1 + *(int *)(v24 + 32)), *(uint64_t *)((char *)a1 + *(int *)(v24 + 32) + 24));
    id v25 = v23;
    uint64_t v26 = sub_100052F10();
    uint64_t v28 = v27;
  }
  else
  {
    uint64_t v26 = sub_100053D80();
    uint64_t v28 = v29;
  }
  uint64_t v108 = v26;
  uint64_t v109 = v28;
  unint64_t v95 = sub_1000068C4();
  uint64_t v30 = sub_1000535E0();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  uint64_t v89 = type metadata accessor for StatusAndNameView();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for Font.Leading.tight(_:), v12);
  sub_100053500();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v35 = sub_1000535C0();
  uint64_t v37 = v36;
  char v39 = v38;
  swift_release();
  char v40 = v39 & 1;
  sub_10002A6A8(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_1000534D0();
  uint64_t v41 = sub_100053560();
  uint64_t v43 = v42;
  int v88 = v44;
  uint64_t v46 = v45;
  long long v47 = (int *)v89;
  sub_10002A6A8(v35, v37, v40);
  swift_bridgeObjectRelease();
  uint64_t v48 = *(uint64_t *)((char *)a1 + v47[10]);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v50 = swift_getKeyPath();
  uint64_t v93 = v41;
  uint64_t v108 = v41;
  uint64_t v109 = v43;
  uint64_t v92 = v43;
  char v51 = v88;
  char v110 = v88 & 1;
  uint64_t v94 = v46;
  uint64_t v111 = v46;
  uint64_t v112 = KeyPath;
  uint64_t v91 = KeyPath;
  uint64_t v113 = v48;
  char v114 = 0;
  uint64_t v90 = v50;
  uint64_t v115 = v50;
  char v116 = 1;
  long long v52 = *a1;
  if (*a1)
  {
    sub_1000162D8((void **)((char *)a1 + v47[8]), *(uint64_t *)((char *)a1 + v47[8] + 24));
    id v53 = v52;
    uint64_t v54 = sub_100052F10();
    uint64_t v55 = (uint64_t)a1;
    uint64_t v57 = v56;
  }
  else
  {
    uint64_t v54 = sub_100053D80();
    uint64_t v55 = (uint64_t)a1;
    uint64_t v57 = v58;
  }
  *(void *)&long long v106 = v54;
  *((void *)&v106 + 1) = v57;
  uint64_t v59 = sub_1000535E0();
  uint64_t v61 = v60;
  char v63 = v62 & 1;
  sub_1000053FC(&qword_1000651B0);
  sub_10002E01C(&qword_1000651B8, &qword_1000651B0, &qword_1000651E0, &qword_1000651E8);
  uint64_t v64 = (uint64_t)v97;
  sub_100053680();
  sub_10002A6A8(v59, v61, v63);
  swift_bridgeObjectRelease();
  sub_10002A6A8(v93, v92, v51 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000529B0();
  uint64_t v65 = (uint64_t)v96;
  sub_100053090();
  swift_bridgeObjectRelease();
  sub_100006918(v64, &qword_1000651A8);
  uint64_t v66 = v99;
  sub_100006AA8(v65, v99, &qword_1000651A8);
  sub_100053AD0();
  if (v107)
  {
    sub_10001672C(&v106, (uint64_t)&v108);
    uint64_t v67 = v85;
    sub_100024704(v85);
    char v68 = sub_100053320();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v67, v87);
    uint64_t v69 = (uint64_t)v101;
    if ((v68 & 1) == 0)
    {
      uint64_t v70 = sub_100053300();
      uint64_t v71 = (uint64_t)v84;
      *char v84 = v70;
      *(void *)(v71 + 8) = 0x4008000000000000;
      *(unsigned char *)(v71 + 16) = 0;
      uint64_t v72 = sub_1000053FC(&qword_100065200);
      sub_10002B588(v55, &v108, v71 + *(int *)(v72 + 44));
      double v73 = *(double *)(v55 + v47[11]);
      uint64_t v74 = sub_1000538E0();
      uint64_t v75 = v83;
      sub_10004C84C(0.0, 1, 0.0, 1, v73, 0, 0.0, 1, v83, 0.0, 1, 0.0, 1, v74, v76);
      sub_100006918(v71, &qword_100065190);
      sub_100006AA8(v75, v69, &qword_100065198);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v69, 0, 1, v103);
      sub_100010614((uint64_t)&v108);
      goto LABEL_13;
    }
    sub_100010614((uint64_t)&v108);
  }
  else
  {
    sub_100006918((uint64_t)&v106, &qword_1000651F0);
    uint64_t v69 = (uint64_t)v101;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56))(v69, 1, 1, v103);
LABEL_13:
  uint64_t v77 = v100;
  sub_100016A1C(v66, v100, &qword_1000651A8);
  uint64_t v78 = v104;
  sub_100016A1C(v69, v104, &qword_1000651A0);
  uint64_t v79 = v105;
  sub_100016A1C(v77, v105, &qword_1000651A8);
  uint64_t v80 = sub_1000053FC(&qword_1000651F8);
  sub_100016A1C(v78, v79 + *(int *)(v80 + 48), &qword_1000651A0);
  sub_100006918(v69, &qword_1000651A0);
  sub_100006918(v66, &qword_1000651A8);
  sub_100006918(v78, &qword_1000651A0);
  return sub_100006918(v77, &qword_1000651A8);
}

uint64_t sub_10002B588@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v5 = type metadata accessor for WidgetAccentModifier(0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v113 = (uint64_t *)((char *)&v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  uint64_t v114 = (uint64_t)&v98 - v8;
  uint64_t v116 = sub_1000053FC(&qword_100065208);
  __chkstk_darwin(v116);
  uint64_t v115 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_100065210);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v117 = (uint64_t)&v98 - v14;
  uint64_t v15 = sub_1000534F0();
  uint64_t v121 = *(void *)(v15 - 8);
  uint64_t v122 = v15;
  __chkstk_darwin(v15);
  long long v120 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_1000053FC(&qword_100065218);
  __chkstk_darwin(v107);
  uint64_t v18 = (uint64_t *)((char *)&v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_1000537B0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000053FC(&qword_100065220);
  __chkstk_darwin(v23);
  id v25 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_1000053FC(&qword_100065228);
  __chkstk_darwin(v102);
  uint64_t v104 = (uint64_t)&v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_1000053FC(&qword_100065230);
  __chkstk_darwin(v106);
  uint64_t v105 = (uint64_t)&v98 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_1000053FC(&qword_100065238);
  uint64_t v28 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v103 = (char *)&v98 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1000053FC(&qword_100065240);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v111 = (uint64_t)&v98 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v123 = (uint64_t)&v98 - v33;
  uint64_t v110 = type metadata accessor for StatusAndNameView();
  uint64_t v112 = a1;
  sub_100053AE0();
  uint64_t v118 = v13;
  uint64_t v119 = a3;
  if (!v125)
  {
    sub_100006918((uint64_t)&v124, &qword_100065248);
    goto LABEL_7;
  }
  sub_10001672C(&v124, (uint64_t)&v126);
  sub_1000162D8(&v126, v128);
  if ((sub_100053A50() & 1) == 0 || (sub_1000162D8(&v126, v128), (uint64_t v34 = sub_100053A60()) == 0))
  {
    sub_100010614((uint64_t)&v126);
LABEL_7:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v123, 1, 1, v108);
    LODWORD(v107) = enum case for Font.Leading.tight(_:);
    goto LABEL_8;
  }
  uint64_t v101 = v34;
  swift_retain();
  uint64_t v35 = sub_1000535F0();
  uint64_t v99 = v36;
  uint64_t v100 = v37;
  char v39 = v38 & 1;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, enum case for Image.Scale.small(_:), v19);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))((char *)v18 + *(int *)(v107 + 28), v22, v19);
  *uint64_t v18 = KeyPath;
  sub_100016A1C((uint64_t)v18, (uint64_t)&v25[*(int *)(v23 + 36)], &qword_100065218);
  uint64_t v41 = v99;
  *(void *)id v25 = v35;
  *((void *)v25 + 1) = v41;
  v25[16] = v39;
  *((void *)v25 + 3) = v100;
  sub_10002A6F8(v35, v41, v39);
  swift_bridgeObjectRetain();
  sub_100006918((uint64_t)v18, &qword_100065218);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  sub_10002A6A8(v35, v41, v39);
  swift_bridgeObjectRelease();
  sub_100053510();
  uint64_t v43 = v120;
  uint64_t v42 = v121;
  int v44 = *(void (**)(char *))(v121 + 104);
  LODWORD(v107) = enum case for Font.Leading.tight(_:);
  uint64_t v45 = v122;
  v44(v120);
  uint64_t v46 = sub_100053500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v45);
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = v104;
  sub_100016A1C((uint64_t)v25, v104, &qword_100065220);
  long long v49 = (uint64_t *)(v48 + *(int *)(v102 + 36));
  *long long v49 = v47;
  v49[1] = v46;
  sub_100006918((uint64_t)v25, &qword_100065220);
  sub_1000162D8(&v126, v128);
  uint64_t v50 = sub_100053A40();
  uint64_t v51 = swift_getKeyPath();
  uint64_t v52 = v105;
  sub_100016A1C(v48, v105, &qword_100065228);
  id v53 = (uint64_t *)(v52 + *(int *)(v106 + 36));
  *id v53 = v51;
  v53[1] = v50;
  sub_100006918(v48, &qword_100065228);
  sub_10002E1FC();
  uint64_t v54 = (uint64_t)v103;
  sub_1000536A0();
  swift_release();
  sub_100006918(v52, &qword_100065230);
  uint64_t v55 = v123;
  sub_100006AA8(v54, v123, &qword_100065238);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v55, 0, 1, v108);
  sub_100010614((uint64_t)&v126);
LABEL_8:
  sub_1000162D8(v109, v109[3]);
  uint64_t v126 = sub_100052A70();
  uint64_t v127 = v56;
  sub_1000068C4();
  uint64_t v57 = sub_1000535E0();
  uint64_t v59 = v58;
  char v61 = v60 & 1;
  uint64_t v126 = sub_100052A70();
  uint64_t v127 = v62;
  uint64_t v63 = sub_1000535E0();
  uint64_t v65 = v64;
  char v67 = v66 & 1;
  uint64_t v108 = sub_1000535A0();
  uint64_t v69 = v68;
  uint64_t v109 = v70;
  char v72 = v71 & 1;
  sub_10002A6A8(v63, v65, v67);
  swift_bridgeObjectRelease();
  sub_10002A6A8(v57, v59, v61);
  swift_bridgeObjectRelease();
  sub_100053510();
  uint64_t v74 = v120;
  uint64_t v73 = v121;
  uint64_t v75 = v122;
  (*(void (**)(char *, void, uint64_t))(v121 + 104))(v120, v107, v122);
  sub_100053500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v75);
  uint64_t v76 = v108;
  uint64_t v77 = sub_1000535C0();
  uint64_t v79 = v78;
  LOBYTE(v57) = v80;
  uint64_t v122 = v81;
  swift_release();
  sub_10002A6A8(v76, v69, v72);
  swift_bridgeObjectRelease();
  uint64_t v82 = *(void *)(v112 + *(int *)(v110 + 36));
  uint64_t v83 = swift_getKeyPath();
  uint64_t v84 = swift_getKeyPath();
  uint64_t v85 = swift_getKeyPath();
  uint64_t v86 = swift_getKeyPath();
  uint64_t v87 = v113;
  *uint64_t v113 = v86;
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  uint64_t v88 = (uint64_t)v87;
  uint64_t v89 = v114;
  sub_10002DDBC(v88, v114);
  uint64_t v90 = (uint64_t)v115;
  sub_10002DE20(v89, (uint64_t)&v115[*(int *)(v116 + 36)]);
  *(void *)uint64_t v90 = v77;
  *(void *)(v90 + 8) = v79;
  *(unsigned char *)(v90 + 16) = v57 & 1;
  *(void *)(v90 + 24) = v122;
  *(void *)(v90 + 32) = v83;
  *(void *)(v90 + 40) = v82;
  *(unsigned char *)(v90 + 48) = 0;
  *(void *)(v90 + 56) = v84;
  *(unsigned char *)(v90 + 64) = 1;
  *(void *)(v90 + 72) = v85;
  *(unsigned char *)(v90 + 80) = 1;
  sub_10002DE84(v89);
  sub_1000529A0();
  sub_10002DEE0();
  uint64_t v91 = (uint64_t)v118;
  sub_1000536D0();
  swift_bridgeObjectRelease();
  sub_100006918(v90, &qword_100065208);
  uint64_t v92 = v117;
  sub_100006AA8(v91, v117, &qword_100065210);
  uint64_t v93 = v123;
  uint64_t v94 = v111;
  sub_100016A1C(v123, v111, &qword_100065240);
  sub_100016A1C(v92, v91, &qword_100065210);
  uint64_t v95 = v119;
  sub_100016A1C(v94, v119, &qword_100065240);
  uint64_t v96 = sub_1000053FC(&qword_100065290);
  sub_100016A1C(v91, v95 + *(int *)(v96 + 48), &qword_100065210);
  sub_100006918(v92, &qword_100065210);
  sub_100006918(v93, &qword_100065240);
  sub_100006918(v91, &qword_100065210);
  return sub_100006918(v94, &qword_100065240);
}

uint64_t sub_10002C198@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100053340();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_1000053FC(&qword_100065188);
  return sub_10002AC20(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_10002C1E0()
{
  return sub_100053100();
}

uint64_t sub_10002C204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002DC40(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ContentSizeCategory, (uint64_t (*)(char *))&EnvironmentValues.sizeCategory.setter);
}

uint64_t sub_10002C230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100053110();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002C25C()
{
  return sub_100053120();
}

uint64_t sub_10002C288()
{
  return sub_100053100();
}

uint64_t sub_10002C2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002DC40(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ContentSizeCategory, (uint64_t (*)(char *))&EnvironmentValues.sizeCategory.setter);
}

void **sub_10002C2FC(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100053AF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[7];
    *(void **)((char *)v7 + a3[6]) = *(void **)((char *)a2 + a3[6]);
    *(void **)((char *)v7 + v14) = *(void **)((char *)a2 + v14);
    uint64_t v15 = a3[8];
    uint64_t v16 = (char *)v7 + v15;
    uint64_t v17 = (char *)a2 + v15;
    long long v18 = *(_OWORD *)((char *)a2 + v15 + 24);
    *(_OWORD *)((char *)v7 + v15 + 24) = v18;
    uint64_t v19 = v18;
    uint64_t v20 = **(void (***)(char *, char *, uint64_t))(v18 - 8);
    swift_retain();
    v20(v16, v17, v19);
    uint64_t v21 = a3[10];
    *(void **)((char *)v7 + a3[9]) = *(void **)((char *)a2 + a3[9]);
    *(void **)((char *)v7 + v21) = *(void **)((char *)a2 + v21);
    uint64_t v22 = a3[12];
    *(void **)((char *)v7 + a3[11]) = *(void **)((char *)a2 + a3[11]);
    uint64_t v23 = (char *)v7 + v22;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v22);
    uint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 8);
    LOBYTE(v19) = *((unsigned char *)a2 + v22 + 16);
    sub_10002C664(v24, v25, v19);
    *(void *)uint64_t v23 = v24;
    *((void *)v23 + 1) = v25;
    v23[16] = v19;
    uint64_t v26 = a3[13];
    uint64_t v27 = (void **)((char *)v7 + v26);
    uint64_t v28 = (void **)((char *)a2 + v26);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v29 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    }
    else
    {
      *uint64_t v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = a3[14];
    uint64_t v31 = (void **)((char *)v7 + v30);
    uint64_t v32 = (void **)((char *)a2 + v30);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    }
    else
    {
      *uint64_t v31 = *v32;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v34 = a3[15];
    uint64_t v35 = (void **)((char *)v7 + v34);
    uint64_t v36 = (void **)((char *)a2 + v34);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    }
    else
    {
      *uint64_t v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t sub_10002C664(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002C670(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_100053AF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  sub_100010614((uint64_t)a1 + a2[8]);
  sub_10002C878(*(uint64_t *)((char *)a1 + a2[12]), *(uint64_t *)((char *)a1 + a2[12] + 8), *((unsigned char *)a1 + a2[12] + 16));
  uint64_t v6 = (char *)a1 + a2[13];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100053330();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = (char *)a1 + a2[14];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_100052FE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = (char *)a1 + a2[15];
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100053B40();
    uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
    return v12(v10, v11);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10002C878(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void **sub_10002C884(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053AF0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[7];
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  *(void **)((char *)a1 + v13) = *(void **)((char *)a2 + v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  long long v17 = *(_OWORD *)((char *)a2 + v14 + 24);
  *(_OWORD *)((char *)a1 + v14 + 24) = v17;
  uint64_t v18 = v17;
  uint64_t v19 = **(void (***)(char *, char *, uint64_t))(v17 - 8);
  swift_retain();
  v19(v15, v16, v18);
  uint64_t v20 = a3[10];
  *(void **)((char *)a1 + a3[9]) = *(void **)((char *)a2 + a3[9]);
  *(void **)((char *)a1 + v20) = *(void **)((char *)a2 + v20);
  uint64_t v21 = a3[12];
  *(void **)((char *)a1 + a3[11]) = *(void **)((char *)a2 + a3[11]);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = *(uint64_t *)((char *)a2 + v21);
  uint64_t v24 = *(uint64_t *)((char *)a2 + v21 + 8);
  LOBYTE(v18) = *((unsigned char *)a2 + v21 + 16);
  sub_10002C664(v23, v24, v18);
  *(void *)uint64_t v22 = v23;
  *((void *)v22 + 1) = v24;
  v22[16] = v18;
  uint64_t v25 = a3[13];
  uint64_t v26 = (void **)((char *)a1 + v25);
  uint64_t v27 = (void **)((char *)a2 + v25);
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_100053330();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    void *v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = a3[14];
  uint64_t v30 = (void **)((char *)a1 + v29);
  uint64_t v31 = (void **)((char *)a2 + v29);
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_100052FE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  }
  else
  {
    *uint64_t v30 = *v31;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v33 = a3[15];
  uint64_t v34 = (void **)((char *)a1 + v33);
  uint64_t v35 = (void **)((char *)a2 + v33);
  sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = sub_100053B40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  }
  else
  {
    *uint64_t v34 = *v35;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_10002CB98(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  sub_1000107C8((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]));
  *(void **)((char *)a1 + a3[9]) = *(void **)((char *)a2 + a3[9]);
  *(void **)((char *)a1 + a3[10]) = *(void **)((char *)a2 + a3[10]);
  *(void **)((char *)a1 + a3[11]) = *(void **)((char *)a2 + a3[11]);
  uint64_t v13 = a3[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  char v18 = v15[16];
  sub_10002C664(*(void *)v15, v17, v18);
  uint64_t v19 = *(void *)v14;
  uint64_t v20 = *((void *)v14 + 1);
  char v21 = v14[16];
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  v14[16] = v18;
  sub_10002C878(v19, v20, v21);
  if (a1 != a2)
  {
    uint64_t v22 = a3[13];
    uint64_t v23 = (void **)((char *)a1 + v22);
    uint64_t v24 = (void **)((char *)a2 + v22);
    sub_100006918((uint64_t)a1 + v22, &qword_100064768);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      void *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = a3[14];
    uint64_t v27 = (void **)((char *)a1 + v26);
    uint64_t v28 = (void **)((char *)a2 + v26);
    sub_100006918((uint64_t)a1 + v26, &qword_100064D80);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v29 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    }
    else
    {
      *uint64_t v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = a3[15];
    uint64_t v31 = (void **)((char *)a1 + v30);
    uint64_t v32 = (void **)((char *)a2 + v30);
    sub_100006918((uint64_t)a1 + v30, &qword_100064760);
    sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_100053B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    }
    else
    {
      *uint64_t v31 = *v32;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10002CEB4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a3[9];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  long long v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  *((void *)v13 + 4) = *((void *)v14 + 4);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v16 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v17 = a3[12];
  uint64_t v18 = a3[13];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  long long v21 = *(_OWORD *)v20;
  v19[16] = v20[16];
  *(_OWORD *)uint64_t v19 = v21;
  uint64_t v22 = (char *)a1 + v18;
  uint64_t v23 = (char *)a2 + v18;
  uint64_t v24 = sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_100053330();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[14];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_100052FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  uint64_t v31 = a3[15];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = sub_1000053FC(&qword_100064760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v35 = sub_100053B40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v32, v33, v35);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  return a1;
}

void **sub_10002D184(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_release();
  uint64_t v11 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  sub_100010614((uint64_t)a1 + v11);
  *((void *)v12 + 4) = *((void *)v13 + 4);
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  uint64_t v15 = a3[10];
  *(void **)((char *)a1 + a3[9]) = *(void **)((char *)a2 + a3[9]);
  *(void **)((char *)a1 + v15) = *(void **)((char *)a2 + v15);
  uint64_t v16 = a3[12];
  *(void **)((char *)a1 + a3[11]) = *(void **)((char *)a2 + a3[11]);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  char v19 = v18[16];
  uint64_t v20 = *(void *)v17;
  uint64_t v21 = *((void *)v17 + 1);
  char v22 = v17[16];
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  v17[16] = v19;
  sub_10002C878(v20, v21, v22);
  if (a1 != a2)
  {
    uint64_t v23 = a3[13];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    sub_100006918((uint64_t)a1 + v23, &qword_100064768);
    uint64_t v26 = sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_100053330();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v24, v25, v27);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    uint64_t v28 = a3[14];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    sub_100006918((uint64_t)a1 + v28, &qword_100064D80);
    uint64_t v31 = sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_100052FE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    uint64_t v33 = a3[15];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    sub_100006918((uint64_t)a1 + v33, &qword_100064760);
    uint64_t v36 = sub_1000053FC(&qword_100064760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_100053B40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v34, v35, v37);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10002D4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002D4C8);
}

uint64_t sub_10002D4C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_11:
    long long v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v14(a1 + v9, a2, v7);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + a3[6]);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v12 = sub_1000053FC(&qword_100064828);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
    {
      uint64_t v7 = v12;
      uint64_t v8 = *(void *)(v12 - 8);
      uint64_t v9 = a3[13];
      goto LABEL_11;
    }
    uint64_t v13 = sub_1000053FC(&qword_1000650C0);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
    {
      uint64_t v7 = v13;
      uint64_t v8 = *(void *)(v13 - 8);
      uint64_t v9 = a3[14];
      goto LABEL_11;
    }
    uint64_t v15 = sub_1000053FC(&qword_100064758);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[15];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_10002D69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002D6B0);
}

uint64_t sub_10002D6B0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_100053AF0();
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    long long v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(a1 + v11, a2, a2, v9);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v12 = sub_1000053FC(&qword_100064828);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[13];
    goto LABEL_9;
  }
  uint64_t v13 = sub_1000053FC(&qword_1000650C0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[14];
    goto LABEL_9;
  }
  uint64_t v15 = sub_1000053FC(&qword_100064758);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[15];

  return v16(v18, a2, a2, v17);
}

void sub_10002D884()
{
  sub_100053AF0();
  if (v0 <= 0x3F)
  {
    sub_10002DA58(319, (unint64_t *)&qword_100064898, (void (*)(uint64_t))&type metadata accessor for ContentSizeCategory);
    if (v1 <= 0x3F)
    {
      sub_10002DA58(319, (unint64_t *)&unk_100065130, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
      if (v2 <= 0x3F)
      {
        sub_10002DA58(319, (unint64_t *)&qword_1000648A0, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_10002DA58(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100052FF0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10002DAAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002DAC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100053260();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10002DAFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100053260();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10002DB30()
{
  return sub_100053270();
}

uint64_t sub_10002DB60()
{
  return sub_100053270();
}

uint64_t sub_10002DB90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100053150();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10002DBC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100053150();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10002DBF0()
{
  return sub_100053160();
}

uint64_t sub_10002DC18()
{
  return sub_100053160();
}

uint64_t sub_10002DC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_10002DD10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100053130();
  *a1 = result;
  return result;
}

uint64_t sub_10002DD3C()
{
  return sub_100053140();
}

uint64_t sub_10002DD68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000531B0();
  *a1 = result;
  return result;
}

uint64_t sub_10002DD94()
{
  return sub_1000531C0();
}

uint64_t sub_10002DDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetAccentModifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002DE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetAccentModifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002DE84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetAccentModifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002DEE0()
{
  unint64_t result = qword_100065250;
  if (!qword_100065250)
  {
    sub_100005440(&qword_100065208);
    sub_10002DF5C();
    sub_10002E0E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065250);
  }
  return result;
}

unint64_t sub_10002DF5C()
{
  unint64_t result = qword_100065258;
  if (!qword_100065258)
  {
    sub_100005440(&qword_100065260);
    sub_10002E01C(&qword_100065268, &qword_100065270, &qword_100065278, &qword_100065280);
    sub_100006BF0(&qword_1000651E0, &qword_1000651E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065258);
  }
  return result;
}

uint64_t sub_10002E01C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    sub_10002E35C(&qword_1000651C0, &qword_1000651C8, &qword_1000651D0, &qword_1000651D8);
    sub_100006BF0(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002E0E0()
{
  unint64_t result = qword_100065288;
  if (!qword_100065288)
  {
    type metadata accessor for WidgetAccentModifier(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065288);
  }
  return result;
}

uint64_t sub_10002E138()
{
  return sub_1000530D0();
}

uint64_t sub_10002E15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10002DC40(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_10002E1A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100053130();
  *a1 = result;
  return result;
}

uint64_t sub_10002E1D0()
{
  return sub_100053140();
}

unint64_t sub_10002E1FC()
{
  unint64_t result = qword_100065298;
  if (!qword_100065298)
  {
    sub_100005440(&qword_100065230);
    sub_10002E29C();
    sub_100006BF0(&qword_1000652C8, &qword_1000652D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065298);
  }
  return result;
}

unint64_t sub_10002E29C()
{
  unint64_t result = qword_1000652A0;
  if (!qword_1000652A0)
  {
    sub_100005440(&qword_100065228);
    sub_10002E35C(&qword_1000652A8, &qword_100065220, &qword_1000652B0, &qword_100065218);
    sub_100006BF0(&qword_1000652B8, &qword_1000652C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000652A0);
  }
  return result;
}

uint64_t sub_10002E35C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    sub_100006BF0(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002E3F8()
{
  return sub_100006BF0(&qword_1000652D8, &qword_1000652E0);
}

void sub_10002E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [objc_allocWithZone((Class)TUCallProviderManager) init];
  id v8 = [v7 telephonyProvider];

  id v9 = [objc_allocWithZone((Class)TUDialRequest) initWithProvider:v8];
  id v10 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  NSString v11 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithStringValue:v11];

  id v13 = [v12 stringValue];
  sub_100053D30();

  sub_100053D90();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 3;
  }
  id v17 = objc_allocWithZone((Class)TUHandle);
  swift_bridgeObjectRetain();
  NSString v18 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithType:v16 value:v18];

  [v9 setHandle:v19];
  [v9 setVideo:0];
  v21[4] = a3;
  void v21[5] = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 1107296256;
  void v21[2] = sub_10002E698;
  v21[3] = &unk_100062858;
  uint64_t v20 = _Block_copy(v21);
  swift_retain();
  swift_release();
  [v4 launchAppForDialRequest:v9 completion:v20];
  _Block_release(v20);
}

void sub_10002E698(uint64_t a1, void *a2)
{
  char v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10002E704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10002E728()
{
  sub_1000162D8((void *)(v0 + 64), *(void *)(v0 + 88));
  uint64_t v1 = sub_100052F20();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v14 = &_swiftEmptyArrayStorage;
    sub_1000304E4(0, v2, 0);
    uint64_t v3 = v1 + 32;
    id v4 = &_swiftEmptyArrayStorage;
    do
    {
      sub_100016744(v3, (uint64_t)v13);
      sub_1000162D8(v13, v13[3]);
      uint64_t v5 = sub_100052C80();
      uint64_t v7 = v6;
      sub_100010614((uint64_t)v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000304E4(0, v4[2] + 1, 1);
        id v4 = v14;
      }
      unint64_t v9 = v4[2];
      unint64_t v8 = v4[3];
      if (v9 >= v8 >> 1)
      {
        sub_1000304E4(v8 > 1, v9 + 1, 1);
        id v4 = v14;
      }
      v4[2] = v9 + 1;
      id v10 = (char *)&v4[2 * v9];
      *((void *)v10 + 4) = v5;
      *((void *)v10 + 5) = v7;
      v3 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v4 = &_swiftEmptyArrayStorage;
  }
  uint64_t v11 = sub_100031E94((uint64_t)v4);
  swift_bridgeObjectRelease();
  return v11;
}

id sub_10002E8AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000053FC(&qword_1000653F0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100055370;
  *(void *)(v8 + 32) = a1;
  sub_100053E30();
  id v9 = objc_allocWithZone((Class)INStartCallIntent);
  sub_100031F2C(0, (unint64_t *)&qword_1000653F8);
  id v20 = a1;
  Class isa = sub_100053E10().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:isa callCapability:a2];

  if (a4)
  {
    sub_100031F2C(0, &qword_100065400);
    uint64_t v12 = sub_10002E728();
    char v13 = sub_10002EAA0(a3, a4, v12);
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      if (a2 == 2)
      {
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_100055370;
        *(void *)(v14 + 32) = v20;
        sub_100053E30();
        id v15 = objc_allocWithZone((Class)INStartVideoCallIntent);
        id v16 = v20;
        Class v17 = sub_100053E10().super.isa;
        swift_bridgeObjectRelease();
        id v18 = [v15 initWithContacts:v17];

        return v18;
      }
      else
      {

        return 0;
      }
    }
  }
  return v11;
}

uint64_t sub_10002EAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100054100();
    sub_100053D50();
    Swift::Int v6 = sub_100054110();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1000540C0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1000540C0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_10002EBD8(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(void), uint64_t a4)
{
  uint64_t v186 = a3;
  uint64_t v185 = a4;
  uint64_t v183 = a2;
  uint64_t v5 = sub_1000527D0();
  uint64_t v178 = *(void *)(v5 - 8);
  uint64_t v179 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  char v175 = (char *)&v163 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v181 = (char *)&v163 - v8;
  uint64_t v9 = sub_1000053FC(&qword_1000653C8);
  __chkstk_darwin(v9 - 8);
  uint64_t v182 = (char *)&v163 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_100052A30();
  uint64_t v168 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v167 = (char *)&v163 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000053FC(&qword_100064CE8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v165 = (uint64_t)&v163 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v164 = (uint64_t)&v163 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v174 = (uint64_t)&v163 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v171 = (uint64_t)&v163 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v180 = (uint64_t)&v163 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v166 = (uint64_t)&v163 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  long long v177 = (uint64_t *)((char *)&v163 - v26);
  __chkstk_darwin(v25);
  uint64_t v176 = (uint64_t)&v163 - v27;
  uint64_t v28 = sub_100052C40();
  uint64_t v184 = *(void (**)(char *, char *, uint64_t))(v28 - 8);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v163 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v163 - v32;
  uint64_t v34 = sub_1000053FC(&qword_1000649E8);
  __chkstk_darwin(v34 - 8);
  uint64_t v173 = (char *)&v163 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v36 - 8);
  char v38 = (char *)&v163 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100052680();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(void *)(v40 + 64);
  uint64_t v42 = __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v163 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  uint64_t v172 = (char *)&v163 - v44;
  uint64_t v45 = a1;
  if (sub_100052AE0())
  {
    uint64_t v170 = a1;
    sub_100052AD0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) != 1)
    {
      uint64_t v184 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      char v67 = v172;
      v184(v172, v38, v39);
      uint64_t v68 = sub_100053EC0();
      uint64_t v69 = (uint64_t)v173;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v173, 1, 1, v68);
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v67, v39);
      unint64_t v70 = (*(unsigned __int8 *)(v40 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
      char v71 = (char *)swift_allocObject();
      *((void *)v71 + 2) = 0;
      *((void *)v71 + 3) = 0;
      *((void *)v71 + 4) = v187;
      v184(&v71[v70], v43, v39);
      char v72 = &v71[(v41 + v70 + 7) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v73 = v185;
      *(void *)char v72 = v186;
      *((void *)v72 + 1) = v73;
      swift_retain();
      swift_retain();
      sub_100033ECC(v69, (uint64_t)&unk_1000653E0, (uint64_t)v71);
      swift_release();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v67, v39);
      return;
    }
    sub_100006918((uint64_t)v38, &qword_1000646A0);
    uint64_t v45 = v170;
  }
  sub_100052B00();
  uint64_t v46 = v184;
  (*((void (**)(char *, void, uint64_t))v184 + 13))(v31, enum case for QuickActionType.videoCall(_:), v28);
  sub_100031BC0();
  sub_100053DF0();
  sub_100053DF0();
  if (v190 == (char *)v188 && v191 == v189) {
    char v47 = 1;
  }
  else {
    char v47 = sub_1000540C0();
  }
  uint64_t v48 = (uint64_t)v183;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v49 = (void (*)(char *, uint64_t))*((void *)v46 + 1);
  v49(v31, v28);
  v49(v33, v28);
  if (v47) {
    uint64_t v50 = 2;
  }
  else {
    uint64_t v50 = 1;
  }
  sub_100052B10();
  if (v51)
  {
    id v52 = objc_allocWithZone((Class)CNPhoneNumber);
    NSString v53 = sub_100053D20();
    id v54 = [v52 initWithStringValue:v53];

    if (v54) {
      uint64_t v55 = 2;
    }
    else {
      uint64_t v55 = 1;
    }
    id v56 = objc_allocWithZone((Class)INPersonHandle);
    NSString v57 = sub_100053D20();
    swift_bridgeObjectRelease();
    id v58 = [v56 initWithValue:v57 type:v55];
    uint64_t v59 = v187;
    uint64_t v60 = (uint64_t)v182;
    goto LABEL_32;
  }
  uint64_t v61 = v176;
  sub_100031C18(v48, v176);
  uint64_t v62 = sub_100052FB0();
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v62 - 8);
  uint64_t v64 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((void *)v63 + 6);
  unsigned int v65 = v64(v61, 1, v62);
  uint64_t v183 = v64;
  uint64_t v184 = v63;
  if (v65 == 1)
  {
    sub_100006918(v61, &qword_100064CE8);
    uint64_t v59 = v187;
    uint64_t v66 = (uint64_t)v177;
    goto LABEL_24;
  }
  uint64_t v74 = v48;
  uint64_t v75 = v50;
  uint64_t v76 = v168;
  uint64_t v77 = v167;
  uint64_t v78 = v169;
  (*(void (**)(char *, void, uint64_t))(v168 + 104))(v167, enum case for HandleType.phoneNumber(_:), v169);
  uint64_t v173 = (char *)sub_100052F50();
  uint64_t v80 = v79;
  uint64_t v81 = v76;
  uint64_t v50 = v75;
  uint64_t v48 = v74;
  uint64_t v82 = (void (**)(uint64_t, uint64_t))v184;
  (*(void (**)(char *, uint64_t))(v81 + 8))(v77, v78);
  v82[1](v61, v62);
  uint64_t v59 = v187;
  uint64_t v66 = (uint64_t)v177;
  if (!v80)
  {
LABEL_24:
    sub_100052B10();
    uint64_t v89 = v88;
    sub_100031C18(v48, v66);
    if (v89)
    {
      sub_100006918(v66, &qword_100064CE8);
      id v90 = objc_allocWithZone((Class)INPersonHandle);
      uint64_t v60 = (uint64_t)v182;
    }
    else
    {
      uint64_t v91 = v166;
      sub_100031C18(v66, v166);
      if (v183(v91, 1, v62) == 1)
      {
        sub_100006918(v66, &qword_100064CE8);
        sub_100006918(v91, &qword_100064CE8);
        id v90 = objc_allocWithZone((Class)INPersonHandle);
        NSString v57 = 0;
        uint64_t v60 = (uint64_t)v182;
        goto LABEL_31;
      }
      uint64_t v92 = v168;
      uint64_t v93 = v167;
      uint64_t v94 = v169;
      (*(void (**)(char *, void, uint64_t))(v168 + 104))(v167, enum case for HandleType.email(_:), v169);
      sub_100052F50();
      uint64_t v96 = v95;
      (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v94);
      sub_100006918((uint64_t)v177, &qword_100064CE8);
      (*((void (**)(uint64_t, uint64_t))v184 + 1))(v166, v62);
      id v90 = objc_allocWithZone((Class)INPersonHandle);
      uint64_t v60 = (uint64_t)v182;
      if (!v96)
      {
        NSString v57 = 0;
        goto LABEL_31;
      }
    }
    NSString v57 = sub_100053D20();
    swift_bridgeObjectRelease();
LABEL_31:
    id v58 = [v90 initWithValue:v57 type:1];
    goto LABEL_32;
  }
  id v83 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  NSString v84 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v85 = [v83 initWithStringValue:v84];

  if (v85) {
    uint64_t v86 = 2;
  }
  else {
    uint64_t v86 = 1;
  }
  id v87 = objc_allocWithZone((Class)INPersonHandle);
  NSString v57 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v58 = [v87 initWithValue:v57 type:v86];
  uint64_t v60 = (uint64_t)v182;
LABEL_32:

  uint64_t v97 = sub_100052620();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v60, 1, 1, v97);
  id v98 = v58;
  uint64_t v99 = sub_100052AC0();
  uint64_t v101 = v100;
  uint64_t v102 = sub_100052AB0();
  uint64_t v104 = v103;
  id v105 = objc_allocWithZone((Class)INPerson);
  id v106 = sub_1000356B0(v98, v60, 0, 0, 0, v99, v101, v102, v104);
  uint64_t v107 = sub_100052B20();
  id v109 = sub_10002E8AC(v106, v50, v107, v108);
  swift_bridgeObjectRelease();
  if (v109)
  {
    uint64_t v183 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v106;
    uint64_t v110 = v181;
    sub_100052900();
    uint64_t v111 = v180;
    sub_100031C18(v48, v180);
    id v112 = v109;
    uint64_t v113 = sub_1000527C0();
    int v114 = sub_100053F30();
    BOOL v115 = os_log_type_enabled(v113, (os_log_type_t)v114);
    uint64_t v184 = (void (*)(char *, char *, uint64_t))v98;
    if (v115)
    {
      LODWORD(v176) = v114;
      uint64_t v170 = v45;
      uint64_t v116 = swift_slowAlloc();
      uint64_t v117 = (void *)swift_slowAlloc();
      uint64_t v182 = (char *)swift_slowAlloc();
      char v190 = v182;
      *(_DWORD *)uint64_t v116 = 138412546;
      uint64_t v188 = (uint64_t)v112;
      id v118 = v112;
      sub_100053F70();
      long long v177 = v117;
      *uint64_t v117 = v109;

      *(_WORD *)(v116 + 12) = 2080;
      uint64_t v119 = v171;
      sub_100031C18(v111, v171);
      uint64_t v120 = sub_100052FB0();
      uint64_t v121 = *(void *)(v120 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48))(v119, 1, v120) == 1)
      {
        sub_100006918(v119, &qword_100064CE8);
        unint64_t v122 = 0xE100000000000000;
        uint64_t v123 = 45;
      }
      else
      {
        uint64_t v123 = sub_100052F30();
        unint64_t v122 = v141;
        (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v119, v120);
      }
      os_log_type_t v142 = v176;
      uint64_t v188 = sub_10002586C(v123, v122, (uint64_t *)&v190);
      sub_100053F70();
      swift_bridgeObjectRelease();
      sub_100006918(v180, &qword_100064CE8);
      _os_log_impl((void *)&_mh_execute_header, v113, v142, "handling call intent: %@ for person: %s", (uint8_t *)v116, 0x16u);
      sub_1000053FC(&qword_1000653D0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v178 + 8))(v181, v179);
      uint64_t v139 = v185;
      uint64_t v140 = (uint64_t)v186;
    }
    else
    {

      sub_100006918(v111, &qword_100064CE8);
      (*(void (**)(char *, uint64_t))(v178 + 8))(v110, v179);
      uint64_t v139 = v185;
      uint64_t v140 = (uint64_t)v186;
    }
    uint64_t v143 = sub_100052B20();
    sub_100036AF8(v112, v143, v144, v140, v139);

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v124 = sub_100052B10();
    if (v125)
    {
      uint64_t v126 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v124;
      unint64_t v127 = v125;
      uint64_t v128 = v175;
      sub_100052900();
      uint64_t v129 = v174;
      sub_100031C18(v48, v174);
      swift_bridgeObjectRetain_n();
      uint64_t v130 = sub_1000527C0();
      int v131 = sub_100053F30();
      BOOL v132 = os_log_type_enabled(v130, (os_log_type_t)v131);
      uint64_t v183 = v126;
      uint64_t v184 = (void (*)(char *, char *, uint64_t))v98;
      if (v132)
      {
        uint64_t v133 = swift_slowAlloc();
        char v190 = (char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v133 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v188 = sub_10002586C((uint64_t)v126, v127, (uint64_t *)&v190);
        sub_100053F70();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v133 + 12) = 2080;
        uint64_t v134 = v164;
        sub_100031C18(v129, v164);
        uint64_t v135 = sub_100052FB0();
        uint64_t v136 = *(void *)(v135 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v136 + 48))(v134, 1, v135) == 1)
        {
          sub_100006918(v134, &qword_100064CE8);
          unint64_t v137 = 0xE100000000000000;
          uint64_t v138 = 45;
        }
        else
        {
          LODWORD(v182) = v131;
          id v157 = v106;
          uint64_t v158 = v134;
          uint64_t v138 = sub_100052F30();
          unint64_t v137 = v159;
          uint64_t v160 = v158;
          id v106 = v157;
          LOBYTE(v131) = (_BYTE)v182;
          (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v160, v135);
        }
        uint64_t v154 = v185;
        uint64_t v188 = sub_10002586C(v138, v137, (uint64_t *)&v190);
        sub_100053F70();
        swift_bridgeObjectRelease();
        sub_100006918(v174, &qword_100064CE8);
        _os_log_impl((void *)&_mh_execute_header, v130, (os_log_type_t)v131, "handling telephony voice call for handle: %s, person: %s", (uint8_t *)v133, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v178 + 8))(v175, v179);
        uint64_t v153 = v186;
        uint64_t v59 = v187;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_100006918(v129, &qword_100064CE8);

        (*(void (**)(char *, uint64_t))(v178 + 8))(v128, v179);
        uint64_t v154 = v185;
        uint64_t v153 = v186;
      }
      uint64_t v161 = v59[5];
      uint64_t v162 = v59[6];
      sub_1000162D8(v59 + 2, v161);
      (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), unint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v162 + 8))(v183, v127, v153, v154, v161, v162);

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v145 = v106;
      char v190 = 0;
      unint64_t v191 = 0xE000000000000000;
      sub_100053FE0(56);
      v192._object = (void *)0x800000010005DC90;
      v192._countAndFlagsBits = 0xD000000000000036;
      sub_100053DA0(v192);
      uint64_t v146 = v165;
      sub_100031C18(v48, v165);
      uint64_t v147 = sub_100052FB0();
      uint64_t v148 = *(void *)(v147 - 8);
      int v149 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v148 + 48))(v146, 1, v147);
      uint64_t v150 = (void (*)(void *))v186;
      if (v149 == 1)
      {
        sub_100006918(v146, &qword_100064CE8);
        uint64_t v151 = (void *)0xE100000000000000;
        uint64_t v152 = 45;
      }
      else
      {
        uint64_t v152 = sub_100052F30();
        uint64_t v151 = v155;
        (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v146, v147);
      }
      v193._countAndFlagsBits = v152;
      v193._object = v151;
      sub_100053DA0(v193);
      swift_bridgeObjectRelease();
      uint64_t v156 = (void *)sub_1000528E0();
      swift_bridgeObjectRelease();
      v150(v156);
    }
  }
}

uint64_t sub_10002FFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return _swift_task_switch(sub_100030008, 0, 0);
}

uint64_t sub_100030008()
{
  uint64_t v1 = v0[27];
  sub_1000053FC(&qword_1000653E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054930;
  *(void *)(inited + 32) = sub_100053D30();
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  unint64_t v4 = sub_10003428C(inited);
  uint64_t v5 = *(void **)(v1 + 104);
  sub_100052660(v6);
  uint64_t v8 = v7;
  v0[31] = v7;
  sub_1000343D8(v4);
  swift_bridgeObjectRelease();
  Class isa = sub_100053CF0().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_1000301D4;
  uint64_t v10 = swift_continuation_init();
  v0[20] = _NSConcreteStackBlock;
  v0[21] = 0x40000000;
  v0[22] = sub_1000347A0;
  v0[23] = &unk_100062840;
  v0[24] = v10;
  [v5 openSensitiveURLInBackground:v8 withOptions:isa completionHandler:v0 + 20];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000301D4()
{
  return _swift_task_switch(sub_1000302B4, 0, 0);
}

uint64_t sub_1000302B4()
{
  int64_t v2 = (void *)v0[31];
  uint64_t v1 = (void *)v0[32];
  uint64_t v3 = (void (*)(void))v0[29];
  swift_errorRelease();

  v3(0);
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100030338()
{
  sub_100010614(v0 + 16);
  swift_release();
  sub_100010614(v0 + 64);

  return _swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for CallActionHandler()
{
  return self;
}

void sub_1000303B0(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(void), uint64_t a4)
{
}

uint64_t sub_1000303D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100030524(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000303F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000306C8(a1, a2, a3, (void *)*v3, &qword_100064A78, (uint64_t (*)(void))&type metadata accessor for PersonInfo);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100030430(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000306C8(a1, a2, a3, (void *)*v3, &qword_100064A00, type metadata accessor for MultipleContactsEntry);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10003046C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000306C8(a1, a2, a3, (void *)*v3, &qword_100065420, type metadata accessor for PersonEntryType);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000304A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000306C8(a1, a2, a3, (void *)*v3, &qword_100064E30, type metadata accessor for SingleContactTimelineEntry);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000304E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100030910(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100030504(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100030A7C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100030524(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000053FC(&qword_100065428);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_1000053FC(&qword_100064A40);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_1000306C8(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000053FC(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  void v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_100030910(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000053FC(&qword_100064A68);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
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
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_100030A7C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000053FC(&qword_100065430);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[72 * v8]) {
      memmove(v12, v13, 72 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[72 * v8] || v12 >= &v13[72 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100054080();
  __break(1u);
  return result;
}

uint64_t sub_100030C08(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100054100();
  swift_bridgeObjectRetain();
  sub_100053D50();
  Swift::Int v8 = sub_100054110();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1000540C0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1000540C0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100031098(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100030DB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000053FC(&qword_100065408);
  uint64_t v3 = sub_100053FD0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100054100();
      sub_100053D50();
      uint64_t result = sub_100054110();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100031098(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100030DB8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100031234();
      goto LABEL_22;
    }
    sub_1000313E8();
  }
  uint64_t v11 = *v4;
  sub_100054100();
  sub_100053D50();
  uint64_t result = sub_100054110();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1000540C0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1000540D0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1000540C0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_100031234()
{
  uint64_t v1 = v0;
  sub_1000053FC(&qword_100065408);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100053FC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000313E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000053FC(&qword_100065408);
  uint64_t v3 = sub_100053FD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100054100();
    swift_bridgeObjectRetain();
    sub_100053D50();
    uint64_t result = sub_100054110();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_100031698()
{
  id v0 = [self sharedInstance];
  uint64_t v1 = self;
  id result = [v1 defaultWorkspace];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = sub_100031F2C(0, (unint64_t *)&qword_100065410);
    uint64_t v13 = v4;
    unint64_t v14 = &off_100062968;
    *(void *)&long long v12 = v3;
    type metadata accessor for IntentLauncher();
    uint64_t v5 = swift_allocObject();
    sub_10001672C(&v12, v5 + 16);
    id result = [v1 defaultWorkspace];
    if (result)
    {
      id v6 = result;
      id v7 = [objc_allocWithZone((Class)CNLaunchServices) init];
      uint64_t v13 = sub_100031F2C(0, &qword_100065418);
      unint64_t v14 = &off_1000627F0;
      *(void *)&long long v12 = v0;
      uint64_t v10 = v4;
      int64_t v11 = &protocol witness table for LSApplicationWorkspace;
      *(void *)&long long v9 = v6;
      type metadata accessor for CallActionHandler();
      uint64_t v8 = swift_allocObject();
      sub_10001672C(&v12, v8 + 16);
      *(void *)(v8 + 56) = v5;
      sub_10001672C(&v9, v8 + 64);
      *(void *)(v8 + 104) = v7;
      return (id)v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003181C(uint64_t a1)
{
  uint64_t v2 = sub_100052B30();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  __chkstk_darwin(v2);
  int64_t v29 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100052C40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v26 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  char v25 = (char *)&v22 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  long long v12 = (char *)&v22 - v11;
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v22 - v13;
  sub_100052B00();
  unint64_t v23 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v23(v12, enum case for QuickActionType.videoCall(_:), v4);
  sub_100031BC0();
  sub_100053DF0();
  sub_100053DF0();
  uint64_t v24 = a1;
  if (v32 == v30 && v33 == v31) {
    char v15 = 1;
  }
  else {
    char v15 = sub_1000540C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v12, v4);
  v16(v14, v4);
  uint64_t v18 = v27;
  uint64_t v17 = v28;
  BOOL v19 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, v24, v28);
  if (v15)
  {
    char v20 = 1;
  }
  else
  {
    sub_100052B00();
    v23(v26, enum case for QuickActionType.voiceCall(_:), v4);
    sub_100053DF0();
    sub_100053DF0();
    if (v32 == v30 && v33 == v31) {
      char v20 = 1;
    }
    else {
      char v20 = sub_1000540C0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16(v26, v4);
    v16(v25, v4);
    BOOL v19 = v29;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
  return v20 & 1;
}

unint64_t sub_100031BC0()
{
  unint64_t result = qword_1000653C0;
  if (!qword_1000653C0)
  {
    sub_100052C40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000653C0);
  }
  return result;
}

uint64_t sub_100031C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100064CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031C80()
{
  uint64_t v1 = sub_100052680();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100031D74()
{
  uint64_t v2 = *(void *)(sub_100052680() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_10000CA3C;
  *(_OWORD *)(v7 + 232) = v8;
  *(void *)(v7 + 216) = v5;
  *(void *)(v7 + 224) = v6;
  return _swift_task_switch(sub_100030008, 0, 0);
}

uint64_t sub_100031E94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100053ED0();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100030C08(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100031F2C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100031F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100031F78()
{
  return swift_release();
}

uint64_t sub_100031F84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100052C50();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000162D8((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_100052AC0();
  Swift::Int v7 = (void *)sub_100052EE0();
  swift_bridgeObjectRelease();
  if (v7)
  {
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ContactFormatter.Style.shortName(_:), v3);
    id v8 = v7;
    sub_100053D80();
    v14[3] = sub_100052C70();
    v14[4] = (uint64_t)&protocol witness table for ContactFormatter;
    sub_100006974(v14);
    sub_100052C60();
    sub_100052F80();

    uint64_t v9 = sub_100052FB0();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 0, 1, v9);
  }
  else
  {
    uint64_t v11 = sub_100052FB0();
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a1, 1, 1, v11);
  }
}

uint64_t sub_1000321D0(uint64_t a1)
{
  uint64_t v108 = sub_100052B30();
  uint64_t v111 = *(void *)(v108 - 8);
  uint64_t v2 = __chkstk_darwin(v108);
  uint64_t v103 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v100 = (char *)&v94 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v104 = (char *)&v94 - v7;
  uint64_t v99 = v8;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v94 - v9;
  uint64_t v110 = sub_1000527D0();
  uint64_t v112 = *(void *)(v110 - 8);
  uint64_t v11 = __chkstk_darwin(v110);
  id v98 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  id v105 = (char *)&v94 - v14;
  __chkstk_darwin(v13);
  int64_t v16 = (char *)&v94 - v15;
  uint64_t v17 = sub_1000053FC(&qword_100064CE8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v97 = (uint64_t)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v94 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v94 - v23;
  uint64_t v25 = sub_100052C40();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v94 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100052980();
  sub_100052970();
  sub_100052B00();
  sub_100052960();
  swift_release();
  int64_t v29 = v28;
  uint64_t v30 = v111;
  uint64_t v31 = v25;
  uint64_t v32 = v16;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v31);
  sub_100031F84((uint64_t)v24);
  sub_1000528F0();
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  uint64_t v34 = v10;
  uint64_t v35 = v10;
  uint64_t v36 = a1;
  uint64_t v37 = a1;
  uint64_t v38 = v108;
  uint64_t v107 = v30 + 16;
  id v106 = v33;
  ((void (*)(char *, uint64_t))v33)(v35, v37);
  uint64_t v101 = v24;
  uint64_t v39 = (uint64_t)v24;
  uint64_t v40 = (uint64_t)v22;
  uint64_t v41 = v112;
  sub_100031C18(v39, v40);
  uint64_t v42 = sub_1000527C0();
  int v43 = sub_100053F00();
  if (os_log_type_enabled(v42, (os_log_type_t)v43))
  {
    int v95 = v43;
    uint64_t v96 = v32;
    uint64_t v44 = v110;
    uint64_t v45 = v30;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v94 = swift_slowAlloc();
    *(void *)&long long v119 = v94;
    *(_DWORD *)uint64_t v46 = 136315394;
    sub_1000332A0();
    uint64_t v47 = sub_100054090();
    *(void *)&long long v116 = sub_10002586C(v47, v48, (uint64_t *)&v119);
    sub_100053F70();
    swift_bridgeObjectRelease();
    long long v49 = *(void (**)(char *, uint64_t))(v45 + 8);
    v49(v34, v38);
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v50 = v97;
    sub_100031C18(v40, v97);
    uint64_t v51 = v40;
    uint64_t v52 = sub_100052FB0();
    uint64_t v53 = *(void *)(v52 - 8);
    int v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v50, 1, v52);
    uint64_t v102 = v49;
    if (v54 == 1)
    {
      sub_100006918(v50, &qword_100064CE8);
      unint64_t v55 = 0xE100000000000000;
      uint64_t v56 = 45;
    }
    else
    {
      uint64_t v56 = sub_100052F30();
      unint64_t v55 = v59;
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v50, v52);
    }
    uint64_t v60 = v44;
    uint64_t v61 = v112;
    uint64_t v58 = v36;
    *(void *)&long long v116 = sub_10002586C(v56, v55, (uint64_t *)&v119);
    sub_100053F70();
    swift_bridgeObjectRelease();
    sub_100006918(v51, &qword_100064CE8);
    _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v95, "Attempting to handle action: %s, for person: %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    NSString v57 = *(void (**)(char *, uint64_t))(v61 + 8);
    v57(v96, v60);
  }
  else
  {
    uint64_t v102 = *(void (**)(char *, uint64_t))(v30 + 8);
    v102(v34, v38);
    sub_100006918(v40, &qword_100064CE8);

    NSString v57 = *(void (**)(char *, uint64_t))(v41 + 8);
    v57(v32, v110);
    uint64_t v58 = v36;
  }
  uint64_t v62 = *((void *)v109 + 2);
  uint64_t v63 = *(void *)(v62 + 16);
  uint64_t v64 = (uint64_t)v101;
  if (v63)
  {
    uint64_t v65 = v62 + 32;
    swift_bridgeObjectRetain();
    uint64_t v66 = v108;
    while (1)
    {
      sub_100016744(v65, (uint64_t)&v119);
      uint64_t v67 = v120;
      uint64_t v68 = v121;
      sub_1000162D8(&v119, v120);
      if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 8))(v58, v64, v67, v68)) {
        break;
      }
      sub_100010614((uint64_t)&v119);
      v65 += 40;
      if (!--v63) {
        goto LABEL_13;
      }
    }
    sub_10001672C(&v119, (uint64_t)&v116);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = v108;
LABEL_13:
    uint64_t v118 = 0;
    long long v116 = 0u;
    long long v117 = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = v105;
  unint64_t v70 = v104;
  char v71 = v103;
  if (*((void *)&v117 + 1))
  {
    sub_10001672C(&v116, (uint64_t)&v119);
    sub_1000528F0();
    sub_100016744((uint64_t)&v119, (uint64_t)v115);
    v106(v70, v58, v66);
    char v72 = sub_1000527C0();
    os_log_type_t v73 = sub_100053F00();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      uint64_t v103 = (char *)swift_slowAlloc();
      int v114 = v103;
      *(_DWORD *)uint64_t v74 = 136315394;
      sub_1000162D8(v115, v115[3]);
      swift_getDynamicType();
      uint64_t v75 = sub_100054120();
      uint64_t v113 = sub_10002586C(v75, v76, (uint64_t *)&v114);
      id v109 = v57;
      sub_100053F70();
      swift_bridgeObjectRelease();
      sub_100010614((uint64_t)v115);
      *(_WORD *)(v74 + 12) = 2080;
      sub_1000332A0();
      uint64_t v77 = sub_100054090();
      uint64_t v113 = sub_10002586C(v77, v78, (uint64_t *)&v114);
      sub_100053F70();
      swift_bridgeObjectRelease();
      uint64_t v79 = v111;
      v102(v70, v66);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Got handler: %s for action: %s", (uint8_t *)v74, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v109(v105, v110);
    }
    else
    {
      sub_100010614((uint64_t)v115);
      uint64_t v79 = v111;
      v102(v70, v66);

      v57(v69, v110);
    }
    uint64_t v88 = v120;
    uint64_t v89 = v121;
    sub_1000162D8(&v119, v120);
    id v90 = v100;
    v106(v100, v58, v66);
    unint64_t v91 = (*(unsigned __int8 *)(v79 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    uint64_t v92 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v79 + 32))(v92 + v91, v90, v66);
    (*(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v89 + 16))(v58, v64, sub_100033388, v92, v88, v89);
    swift_release();
    sub_100006918(v64, &qword_100064CE8);
    return sub_100010614((uint64_t)&v119);
  }
  else
  {
    sub_100006918((uint64_t)&v116, &qword_1000654F0);
    uint64_t v80 = v98;
    sub_1000528F0();
    v106(v71, v58, v66);
    uint64_t v81 = sub_1000527C0();
    os_log_type_t v82 = sub_100053F10();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = swift_slowAlloc();
      id v109 = v57;
      NSString v84 = v71;
      id v85 = (uint8_t *)v83;
      *(void *)&long long v119 = swift_slowAlloc();
      *(_DWORD *)id v85 = 136315138;
      sub_1000332A0();
      uint64_t v86 = sub_100054090();
      v115[0] = sub_10002586C(v86, v87, (uint64_t *)&v119);
      sub_100053F70();
      swift_bridgeObjectRelease();
      v102(v84, v66);
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "No available handler for action: %s", v85, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v109(v98, v110);
    }
    else
    {
      v102(v71, v66);

      v57(v80, v110);
    }
    return sub_100006918(v64, &qword_100064CE8);
  }
}

uint64_t sub_100032EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100052B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000527D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    swift_errorRetain();
    sub_1000528F0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = sub_1000527C0();
    os_log_type_t v14 = sub_100053F10();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v26 = v9;
      uint64_t v17 = v16;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v28 = v24;
      *(_DWORD *)uint64_t v17 = 136315394;
      sub_1000332A0();
      int v23 = v15;
      uint64_t v18 = sub_100054090();
      uint64_t v27 = sub_10002586C(v18, v19, &v28);
      uint64_t v25 = v8;
      sub_100053F70();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v20 = sub_1000540F0();
      uint64_t v27 = sub_10002586C(v20, v21, &v28);
      sub_100053F70();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v23, "Failed to handle action: %s with error: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v26 + 8))(v12, v25);
    }
    else
    {
      swift_errorRelease();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return result;
}

uint64_t sub_10003323C()
{
  swift_bridgeObjectRelease();
  sub_100010614(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for ActionLauncher()
{
  return self;
}

unint64_t sub_1000332A0()
{
  unint64_t result = qword_1000654F8;
  if (!qword_1000654F8)
  {
    sub_100052B30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000654F8);
  }
  return result;
}

uint64_t sub_1000332F8()
{
  uint64_t v1 = sub_100052B30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100033388(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100052B30() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100032EC0(a1, v4);
}

id sub_1000333F8()
{
  sub_1000053FC(&qword_100065500);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100055410;
  id result = [self defaultWorkspace];
  if (result)
  {
    id v2 = result;
    unint64_t v12 = sub_100033564();
    uint64_t v13 = &off_100062968;
    *(void *)&long long v11 = v2;
    type metadata accessor for IntentLauncher();
    uint64_t v3 = swift_allocObject();
    sub_10001672C(&v11, v3 + 16);
    id v4 = [objc_allocWithZone((Class)CNLaunchServices) init];
    uint64_t v5 = type metadata accessor for MessageActionHandler();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v3;
    *(void *)(v6 + 24) = v4;
    *(void *)(v0 + 56) = v5;
    *(void *)(v0 + 64) = &off_1000628A8;
    *(void *)(v0 + 32) = v6;
    id v7 = sub_100031698();
    *(void *)(v0 + 96) = type metadata accessor for CallActionHandler();
    *(void *)(v0 + 104) = &off_100062800;
    *(void *)(v0 + 72) = v7;
    uint64_t v8 = sub_100052BE0();
    uint64_t v9 = sub_100052BD0();
    unint64_t v12 = v8;
    uint64_t v13 = (_UNKNOWN **)&protocol witness table for ContactFetcher;
    *(void *)&long long v11 = v9;
    type metadata accessor for ActionLauncher();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v0;
    sub_10001672C(&v11, v10 + 24);
    return (id)v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100033564()
{
  unint64_t result = qword_100065410;
  if (!qword_100065410)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100065410);
  }
  return result;
}

uint64_t sub_1000335A4(void (*a1)(char *, char *, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v67 = a3;
  uint64_t v64 = a2;
  uint64_t v69 = a1;
  uint64_t v3 = sub_1000527D0();
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v54 - v7;
  uint64_t v9 = sub_1000053FC(&qword_100064E48);
  __chkstk_darwin(v9 - 8);
  long long v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100052890();
  uint64_t v68 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  int v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v54 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v21 = sub_100053AF0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_AXSPrefersHorizontalTextLayout()) {
    goto LABEL_7;
  }
  uint64_t v62 = v22;
  uint64_t v63 = v21;
  unint64_t v59 = v11;
  uint64_t v60 = v18;
  unint64_t v55 = v6;
  uint64_t v56 = v15;
  NSString v57 = v8;
  uint64_t v58 = v20;
  uint64_t v61 = v12;
  if (qword_100064548 != -1) {
    swift_once();
  }
  sub_1000162D8(qword_100065508, qword_100065520);
  uint64_t v25 = (void *)sub_100052F90();
  sub_100052F10();

  BOOL v26 = sub_100053D70(8);
  swift_bridgeObjectRelease();
  uint64_t v28 = v62;
  uint64_t v27 = v63;
  if (!v26) {
    goto LABEL_7;
  }
  sub_100052FA0();
  sub_100052DE0();
  sub_100053B00();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100053AD0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v27);
  uint64_t v29 = v61;
  uint64_t v30 = v68;
  if (v72)
  {
    sub_1000162D8(v71, v72);
    sub_100052A70();
    sub_100010614((uint64_t)v71);
    BOOL v31 = sub_100053D70(8);
    swift_bridgeObjectRelease();
    uint64_t v32 = v60;
    uint64_t v33 = v67;
    if (!v31)
    {
LABEL_7:
      char v34 = 0;
      return v34 & 1;
    }
  }
  else
  {
    sub_100006918((uint64_t)v71, &qword_1000651F0);
    uint64_t v32 = v60;
    uint64_t v33 = v67;
  }
  uint64_t v36 = (uint64_t)v59;
  sub_100033E64(v33, (uint64_t)v59);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v36, 1, v29) == 1)
  {
    sub_100006918(v36, &qword_100064E48);
    uint64_t v37 = v55;
    sub_100052910();
    swift_retain();
    uint64_t v38 = sub_1000527C0();
    os_log_type_t v39 = sub_100053F30();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 67109120;
      LOBYTE(v71[0]) = sub_100052DF0() & 1;
      LODWORD(v71[0]) = LOBYTE(v71[0]);
      sub_100053F70();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Using device language to determine vertical layout: %{BOOL}d", v40, 8u);
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v65 + 8))(v37, v66);
    char v34 = sub_100052DF0();
    return v34 & 1;
  }
  uint64_t v41 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v58, v36, v29);
  uint64_t v42 = v57;
  sub_100052910();
  uint64_t v69 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  v69(v32, v41, v29);
  int v43 = sub_1000527C0();
  os_log_type_t v44 = sub_100053F30();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = v32;
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    v71[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v47 = sub_100052880();
    uint64_t v70 = sub_10002586C(v47, v48, v71);
    sub_100053F70();
    swift_bridgeObjectRelease();
    long long v49 = *(void (**)(char *, uint64_t))(v68 + 8);
    uint64_t v50 = v45;
    uint64_t v30 = v68;
    v49(v50, v29);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Using app intent configuration to determine vertical layout, kind: %s", v46, 0xCu);
    swift_arrayDestroy();
    uint64_t v41 = v58;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v65 + 8))(v57, v66);
  }
  else
  {
    long long v49 = *(void (**)(char *, uint64_t))(v30 + 8);
    v49(v32, v29);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v42, v66);
  }
  uint64_t v51 = v56;
  v69(v56, v41, v29);
  int v52 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v51, v29);
  if (v52 == enum case for PeopleWidgetVerticalLayoutToggleKind.showVerticalLayoutToggleDT(_:))
  {
    char v53 = sub_100052B80();
LABEL_22:
    char v34 = v53;
    v49(v41, v29);
    return v34 & 1;
  }
  if (v52 == enum case for PeopleWidgetVerticalLayoutToggleKind.showVerticalLayoutToggleDF(_:))
  {
    char v53 = sub_100052B70();
    goto LABEL_22;
  }
  uint64_t result = sub_1000540B0();
  __break(1u);
  return result;
}

uint64_t sub_100033D4C()
{
  uint64_t v0 = sub_100052C50();
  __chkstk_darwin(v0);
  (*(void (**)(char *, void))(v2 + 104))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for ContactFormatter.Style.shortName(_:));
  sub_100053D80();
  qword_100065520 = sub_100052C70();
  unk_100065528 = &protocol witness table for ContactFormatter;
  sub_100006974(qword_100065508);
  return sub_100052C60();
}

uint64_t sub_100033E64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100064E48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100033ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100053EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100053EB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006918(a1, &qword_1000649E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100053E70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_100034078(uint64_t a1)
{
  uint64_t v2 = sub_1000053FC(&qword_100065628);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000053FC(&qword_100064A60);
  uint64_t v6 = sub_100054070();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100016A1C(v12, (uint64_t)v5, &qword_100065628);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_100035CEC(*v5, v15, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100035D70);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_100053AB0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
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

unint64_t sub_10003428C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000053FC(&qword_100065618);
  uint64_t v2 = sub_100054070();
  uint64_t v3 = (void *)v2;
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
    sub_100016A1C(v6, (uint64_t)&v15, &qword_100065620);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100035CEC(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100035D70);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000363C0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_1000343D8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000053FC(&qword_100065610);
    uint64_t v2 = (void *)sub_100054070();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100025AFC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000363C0(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000363C0(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000363C0(v36, v37);
    sub_1000363C0(v37, &v33);
    uint64_t result = sub_100053FB0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000363C0(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1000363D0();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000347A0(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(v3 + 64) + 40);
  *(unsigned char *)uint64_t v4 = a2;
  *(void *)(v4 + 8) = a3;
  id v5 = a3;

  return _swift_continuation_resume(v3);
}

void sub_1000347F8(uint64_t a1, void (*a2)(char *, char *, uint64_t), void (*a3)(void *), uint64_t a4)
{
  uint64_t v120 = a2;
  uint64_t v121 = a3;
  uint64_t v122 = a4;
  uint64_t v5 = sub_1000525F0();
  __chkstk_darwin(v5 - 8);
  uint64_t v112 = (char *)&v102 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100052600();
  uint64_t v113 = *(void *)(v7 - 8);
  uint64_t v114 = v7;
  __chkstk_darwin(v7);
  uint64_t v111 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000527D0();
  uint64_t v110 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  long long v117 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000053FC(&qword_1000653C8);
  __chkstk_darwin(v11 - 8);
  uint64_t v118 = (char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100052A30();
  uint64_t v108 = *(void *)(v13 - 8);
  uint64_t v109 = v13;
  __chkstk_darwin(v13);
  uint64_t v107 = (char *)&v102 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000053FC(&qword_100064CE8);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v106 = (uint64_t)&v102 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v116 = (uint64_t)&v102 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v115 = (uint64_t)&v102 - v21;
  __chkstk_darwin(v20);
  char v23 = (char *)&v102 - v22;
  uint64_t v24 = sub_1000053FC(&qword_1000649E8);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v102 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v27 - 8);
  long long v29 = (char *)&v102 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100052680();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void *)(v31 + 64);
  uint64_t v33 = __chkstk_darwin(v30);
  long long v34 = (char *)&v102 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v36 = (char *)&v102 - v35;
  if (sub_100052AE0())
  {
    id v105 = v26;
    sub_100052AD0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) != 1)
    {
      uint64_t v120 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v120(v36, v29, v30);
      uint64_t v70 = sub_100053EC0();
      uint64_t v71 = (uint64_t)v105;
      (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v105, 1, 1, v70);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v34, v36, v30);
      unint64_t v72 = (*(unsigned __int8 *)(v31 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      os_log_type_t v73 = (char *)swift_allocObject();
      *((void *)v73 + 2) = 0;
      *((void *)v73 + 3) = 0;
      uint64_t v74 = v120;
      *((void *)v73 + 4) = v119;
      v74(&v73[v72], v34, v30);
      uint64_t v75 = (void (**)(void *))&v73[(v32 + v72 + 7) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v76 = v122;
      *uint64_t v75 = v121;
      v75[1] = (void (*)(void *))v76;
      swift_retain();
      swift_retain();
      sub_100033ECC(v71, (uint64_t)&unk_1000655F8, (uint64_t)v73);
      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v36, v30);
      return;
    }
    sub_100006918((uint64_t)v29, &qword_1000646A0);
  }
  uint64_t v37 = (void (*)(char *, char *, uint64_t))v9;
  sub_100052B10();
  uint64_t v39 = v38;
  sub_100016A1C((uint64_t)v120, (uint64_t)v23, &qword_100064CE8);
  if (v39)
  {
    sub_100006918((uint64_t)v23, &qword_100064CE8);
    uint64_t v41 = (uint64_t)v121;
    uint64_t v40 = v122;
LABEL_6:
    uint64_t v42 = (uint64_t)v118;
    id v43 = objc_allocWithZone((Class)CNPhoneNumber);
    swift_bridgeObjectRetain();
    NSString v44 = sub_100053D20();
    swift_bridgeObjectRelease();
    id v45 = [v43 initWithStringValue:v44];

    if (v45) {
      uint64_t v46 = 2;
    }
    else {
      uint64_t v46 = 1;
    }
    id v47 = objc_allocWithZone((Class)INPersonHandle);
    NSString v48 = sub_100053D20();
    swift_bridgeObjectRelease();
    id v49 = [v47 initWithValue:v48 type:v46];

    uint64_t v50 = sub_100052620();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v42, 1, 1, v50);
    uint64_t v51 = sub_100052AC0();
    uint64_t v53 = v52;
    uint64_t v54 = sub_100052AB0();
    uint64_t v56 = v55;
    id v57 = objc_allocWithZone((Class)INPerson);
    id v58 = sub_1000356B0(v49, v42, 0, 0, 0, v51, v53, v54, v56);
    sub_1000053FC(&qword_1000653F0);
    uint64_t v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_100055370;
    *(void *)(v59 + 32) = v58;
    uint64_t v124 = v59;
    sub_100053E30();
    id v60 = objc_allocWithZone((Class)INSendMessageIntent);
    sub_10003607C();
    id v61 = v58;
    Class isa = sub_100053E10().super.isa;
    swift_bridgeObjectRelease();
    id v63 = [v60 initWithRecipients:isa outgoingMessageType:1 content:0 speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];

    uint64_t v64 = sub_100052B20();
    sub_100036AF8(v63, v64, v65, v41, v40);

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v104 = a1;
  uint64_t v66 = v115;
  sub_100016A1C((uint64_t)v23, v115, &qword_100064CE8);
  uint64_t v67 = sub_100052FB0();
  uint64_t v68 = *(void *)(v67 - 8);
  id v105 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  if (v105(v66, 1, v67) == 1)
  {
    sub_100006918((uint64_t)v23, &qword_100064CE8);
    sub_100006918(v66, &qword_100064CE8);
    uint64_t v69 = v37;
  }
  else
  {
    uint64_t v77 = v108;
    unint64_t v78 = *(void (**)(char *, void, uint64_t))(v108 + 104);
    uint64_t v103 = v67;
    uint64_t v79 = v68;
    uint64_t v80 = v107;
    uint64_t v81 = v109;
    v78(v107, enum case for HandleType.phoneNumber(_:), v109);
    sub_100052F50();
    uint64_t v83 = v82;
    NSString v84 = v80;
    uint64_t v68 = v79;
    uint64_t v67 = v103;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v84, v81);
    sub_100006918((uint64_t)v23, &qword_100064CE8);
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v66, v67);
    uint64_t v69 = v37;
    if (v83)
    {
      uint64_t v41 = (uint64_t)v121;
      uint64_t v40 = v122;
      goto LABEL_6;
    }
  }
  id v85 = v117;
  sub_100052900();
  uint64_t v86 = v116;
  sub_100016A1C((uint64_t)v120, v116, &qword_100064CE8);
  unint64_t v87 = sub_1000527C0();
  os_log_type_t v88 = sub_100053F10();
  if (os_log_type_enabled(v87, v88))
  {
    uint64_t v120 = v69;
    uint64_t v89 = v86;
    id v90 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    *(_DWORD *)id v90 = 136315138;
    uint64_t v91 = v89;
    uint64_t v92 = v106;
    sub_100016A1C(v91, v106, &qword_100064CE8);
    if (v105(v92, 1, v67) == 1)
    {
      sub_100006918(v92, &qword_100064CE8);
      uint64_t v93 = 0;
      unint64_t v94 = 0xE000000000000000;
    }
    else
    {
      uint64_t v95 = v92;
      uint64_t v93 = sub_100052F30();
      unint64_t v94 = v96;
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v95, v67);
    }
    uint64_t v123 = sub_10002586C(v93, v94, &v124);
    sub_100053F70();
    swift_bridgeObjectRelease();
    sub_100006918(v116, &qword_100064CE8);
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "Could not find handle for person %s", v90, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v110 + 8))(v117, v120);
  }
  else
  {
    sub_100006918(v86, &qword_100064CE8);

    (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v110 + 8))(v85, v69);
  }
  uint64_t v97 = v121;
  uint64_t v99 = v113;
  uint64_t v98 = v114;
  uint64_t v100 = v111;
  sub_1000525E0();
  sub_100035A40((uint64_t)&_swiftEmptyArrayStorage);
  sub_100036034(&qword_1000655E8, (void (*)(uint64_t))&type metadata accessor for CocoaError);
  sub_100052630();
  uint64_t v101 = (void *)sub_1000525D0();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v98);
  v97(v101);
}

uint64_t sub_100035434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return _swift_task_switch(sub_100035458, 0, 0);
}

uint64_t sub_100035458()
{
  uint64_t v1 = v0[27];
  sub_1000053FC(&qword_1000653E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100054930;
  *(void *)(inited + 32) = sub_100053D30();
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  unint64_t v4 = sub_10003428C(inited);
  uint64_t v5 = *(void **)(v1 + 24);
  sub_100052660(v6);
  uint64_t v8 = v7;
  v0[31] = v7;
  sub_1000343D8(v4);
  swift_bridgeObjectRelease();
  Class isa = sub_100053CF0().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_1000301D4;
  uint64_t v10 = swift_continuation_init();
  v0[20] = _NSConcreteStackBlock;
  v0[21] = 0x40000000;
  v0[22] = sub_1000347A0;
  v0[23] = &unk_100062910;
  v0[24] = v10;
  [v5 openSensitiveURLInBackground:v8 withOptions:isa completionHandler:v0 + 20];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100035624()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for MessageActionHandler()
{
  return self;
}

void sub_10003568C(uint64_t a1, void (*a2)(char *, char *, uint64_t), void (*a3)(void *), uint64_t a4)
{
}

id sub_1000356B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = sub_100052620();
  uint64_t v15 = *(void *)(v14 - 8);
  Class v16 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14) != 1)
  {
    Class v16 = sub_100052610();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a2, v14);
  }
  if (a4)
  {
    NSString v17 = sub_100053D20();
    swift_bridgeObjectRelease();
    uint64_t v18 = a9;
    if (a7) {
      goto LABEL_5;
    }
LABEL_8:
    NSString v19 = 0;
    if (v18) {
      goto LABEL_6;
    }
LABEL_9:
    NSString v20 = 0;
    goto LABEL_10;
  }
  NSString v17 = 0;
  uint64_t v18 = a9;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_5:
  NSString v19 = sub_100053D20();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_9;
  }
LABEL_6:
  NSString v20 = sub_100053D20();
  swift_bridgeObjectRelease();
LABEL_10:
  id v21 = [v24 initWithPersonHandle:a1 nameComponents:v16 displayName:v17 image:a5 contactIdentifier:v19 customIdentifier:v20];

  return v21;
}

uint64_t sub_10003586C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100035948;
  return v6(a1);
}

uint64_t sub_100035948()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100035A40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000053FC(&qword_100065618);
  uint64_t v2 = sub_100054070();
  uint64_t v3 = (void *)v2;
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
    sub_100016A1C(v6, (uint64_t)&v15, &qword_100065620);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100035CEC(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100035B8C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000363C0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_100035B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1000540C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1000540C0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1000540C0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100035CD4(uint64_t a1, uint64_t a2)
{
  return sub_100035CEC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100035D70);
}

uint64_t sub_100035CEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  sub_100054100();
  sub_100053D50();
  Swift::Int v5 = sub_100054110();

  return a3(a1, a2, v5);
}

unint64_t sub_100035D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000540C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000540C0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100035E54()
{
  uint64_t v0 = sub_100052C40();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)v10 - v5;
  sub_100052B00();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for QuickActionType.message(_:), v0);
  sub_100036034((unint64_t *)&qword_1000653C0, (void (*)(uint64_t))&type metadata accessor for QuickActionType);
  sub_100053DF0();
  sub_100053DF0();
  if (v10[2] == v10[0] && v10[3] == v10[1]) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000540C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t sub_100036034(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10003607C()
{
  unint64_t result = qword_1000653F8;
  if (!qword_1000653F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000653F8);
  }
  return result;
}

uint64_t sub_1000360BC()
{
  uint64_t v1 = sub_100052680();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_1000361B0()
{
  uint64_t v2 = *(void *)(sub_100052680() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_10000CA3C;
  *(_OWORD *)(v7 + 232) = v8;
  *(void *)(v7 + 216) = v5;
  *(void *)(v7 + 224) = v6;
  return _swift_task_switch(sub_100035458, 0, 0);
}

uint64_t sub_1000362D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100036308(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000CA3C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100065600 + dword_100065600);
  return v6(a1, v4);
}

_OWORD *sub_1000363C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000363D0()
{
  return swift_release();
}

uint64_t sub_1000363D8()
{
  uint64_t v0 = sub_1000053FC(&qword_100065638);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100036458()
{
  unint64_t result = qword_100065630;
  if (!qword_100065630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065630);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeScreenWidgets()
{
  return &type metadata for HomeScreenWidgets;
}

uint64_t sub_1000364BC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000364DC()
{
  unint64_t result = qword_100065640;
  if (!qword_100065640)
  {
    sub_100005440(&qword_100065648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065640);
  }
  return result;
}

ValueMetadata *type metadata accessor for NoContactsView()
{
  return &type metadata for NoContactsView;
}

uint64_t sub_100036548()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100036564@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = sub_100053790();
  uint64_t v26 = sub_100053490();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100053D80();
  sub_1000068C4();
  uint64_t v2 = sub_1000535E0();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100053750();
  uint64_t v7 = sub_100053590();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_10002A6A8(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_100053520();
  uint64_t v12 = sub_1000535C0();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_10002A6A8(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  sub_1000534D0();
  uint64_t v17 = sub_100053560();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_10002A6A8(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v27;
  *(void *)(a1 + 8) = KeyPath;
  *(void *)(a1 + 16) = v26;
  *(void *)(a1 + 24) = v17;
  *(void *)(a1 + 32) = v19;
  *(unsigned char *)(a1 + 40) = v23;
  *(void *)(a1 + 48) = v21;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10002A6F8(v17, v19, v23);
  swift_bridgeObjectRetain();
  sub_10002A6A8(v17, v19, v23);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

__n128 sub_100036794@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100053340();
  sub_100036564((uint64_t)v8);
  uint64_t v3 = v9;
  char v4 = v10;
  uint64_t v5 = v11;
  long long v7 = v8[0];
  __n128 result = (__n128)v8[1];
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0x4008000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v7;
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a1 + 56) = v3;
  *(unsigned char *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v5;
  return result;
}

uint64_t sub_1000367FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000531D0();
  *a1 = result;
  return result;
}

uint64_t sub_100036828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000531D0();
  *a1 = result;
  return result;
}

uint64_t sub_100036854()
{
  return sub_1000531E0();
}

uint64_t sub_100036880()
{
  return sub_1000531E0();
}

unint64_t sub_1000368B0()
{
  unint64_t result = qword_100065650;
  if (!qword_100065650)
  {
    sub_100005440(&qword_100065658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065650);
  }
  return result;
}

void sub_10003690C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  if (a3)
  {
    swift_bridgeObjectRetain();
    NSString v10 = sub_100053D20();
    swift_bridgeObjectRelease();
    id v8 = [self applicationProxyForIdentifier:v10];
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  void v13[4] = sub_1000372A8;
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  void v13[2] = sub_100036A5C;
  v13[3] = &unk_1000629C8;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v5 openUserActivity:a1 withApplicationProxy:v8 completionHandler:v12];
  _Block_release(v12);
}

void sub_100036A5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100036AD4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_100036AF8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_1000527D0();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v5;
  uint64_t v55 = a4;
  uint64_t v52 = v15;
  uint64_t v53 = v12;
  if (a3)
  {
    swift_bridgeObjectRetain();
    NSString v16 = sub_100053D20();
    swift_bridgeObjectRelease();
    id v17 = [self applicationProxyForIdentifier:v16];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [objc_allocWithZone((Class)INInteraction) initWithIntent:a1 response:0];
  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v20 = NSStringFromClass(ObjCClassFromMetadata);
  sub_100053D30();

  id v21 = objc_allocWithZone((Class)NSUserActivity);
  NSString v22 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v23 = [v21 initWithActivityType:v22];

  id v50 = v23;
  id v51 = v18;
  [v23 _setInteraction:v18 donate:0];
  sub_100052900();
  id v49 = v17;
  id v24 = v17;
  id v25 = a1;
  id v26 = v24;
  id v27 = v25;
  uint64_t v28 = v14;
  long long v29 = sub_1000527C0();
  os_log_type_t v30 = sub_100053F30();
  if (os_log_type_enabled(v29, v30))
  {
    id v45 = v28;
    uint64_t v46 = a5;
    uint64_t v47 = a2;
    uint64_t v48 = a3;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v56 = (uint64_t)v27;
    uint64_t v57 = v44;
    *(_DWORD *)uint64_t v31 = 138412546;
    id v33 = v27;
    sub_100053F70();
    *uint64_t v32 = v27;

    *(_WORD *)(v31 + 12) = 2080;
    if (v49)
    {
      id v34 = [v26 description];
      uint64_t v35 = sub_100053D30();
      unint64_t v37 = v36;
    }
    else
    {
      unint64_t v37 = 0xE100000000000000;
      uint64_t v35 = 45;
    }
    a3 = v48;
    uint64_t v56 = sub_10002586C(v35, v37, &v57);
    sub_100053F70();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Launching intent: %@ with application proxy: %s", (uint8_t *)v31, 0x16u);
    sub_1000053FC(&qword_1000653D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v52 + 8))(v45, v53);
    a5 = v46;
    a2 = v47;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v52 + 8))(v28, v53);
  }
  uint64_t v38 = v54[5];
  uint64_t v39 = v54[6];
  sub_1000162D8(v54 + 2, v38);
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v55;
  *(void *)(v40 + 24) = a5;
  uint64_t v41 = *(void (**)(id, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v39 + 8);
  swift_retain();
  uint64_t v42 = v50;
  v41(v50, a2, a3, sub_1000372A0, v40, v38, v39);

  return swift_release();
}

uint64_t sub_100036FA4(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_1000527D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_1000528F0();
    swift_errorRetain();
    swift_errorRetain();
    NSString v10 = sub_1000527C0();
    os_log_type_t v11 = sub_100053F10();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      id v18 = a2;
      uint64_t v13 = (uint8_t *)v12;
      uint64_t v20 = swift_slowAlloc();
      void v17[2] = a3;
      *(_DWORD *)uint64_t v13 = 136315138;
      v17[1] = v13 + 4;
      swift_getErrorValue();
      uint64_t v14 = sub_1000540F0();
      uint64_t v19 = sub_10002586C(v14, v15, &v20);
      sub_100053F70();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to launch activity: %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v18;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return a2(a1);
}

uint64_t sub_10003720C()
{
  sub_100010614(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for IntentLauncher()
{
  return self;
}

uint64_t sub_100037268()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000372A0(uint64_t a1)
{
  return sub_100036FA4(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000372A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

uint64_t sub_1000372D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000372E4()
{
  return swift_release();
}

uint64_t sub_1000372F0()
{
  sub_100052840();
  uint64_t result = sub_100052820();
  byte_100067460 = result & 1;
  return result;
}

unint64_t sub_10003734C()
{
  unint64_t result = qword_100065708;
  if (!qword_100065708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065708);
  }
  return result;
}

unint64_t sub_1000373A4()
{
  unint64_t result = qword_100065710;
  if (!qword_100065710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065710);
  }
  return result;
}

uint64_t sub_1000373F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100037414()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100037464()
{
  unint64_t result = qword_100065718;
  if (!qword_100065718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065718);
  }
  return result;
}

uint64_t sub_1000374B8()
{
  uint64_t v0 = sub_100052650();
  sub_10003BAE0(v0, qword_100067468);
  sub_10003BAA8(v0, (uint64_t)qword_100067468);
  return sub_100052640();
}

uint64_t sub_100037518(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100052680();
  v2[4] = swift_task_alloc();
  sub_1000053FC(&qword_100065758);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_100052B30();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_100037634, 0, 0);
}

uint64_t sub_100037634()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[5];
  sub_100052590();
  sub_100052AF0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100006918(v0[5], &qword_100065758);
  }
  else
  {
    uint64_t v5 = v0[7];
    uint64_t v4 = v0[8];
    uint64_t v6 = v0[6];
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 32))(v4, v0[5], v6);
    sub_1000333F8();
    sub_1000321D0(v4);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  sub_100052580();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100037774@<X0>(uint64_t a1@<X8>)
{
  if (qword_100064558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100052650();
  uint64_t v3 = sub_10003BAA8(v2, (uint64_t)qword_100067468);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100037824()
{
  return 0;
}

uint64_t sub_100037834(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000CA3C;
  return sub_100037518(a1, v4);
}

uint64_t sub_1000378D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003B79C();
  *a1 = result;
  return result;
}

uint64_t sub_1000378FC(uint64_t a1)
{
  unint64_t v2 = sub_100037464();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for URLAppIntent()
{
  return &type metadata for URLAppIntent;
}

uint64_t sub_100037948()
{
  return sub_100006BF0(&qword_100065728, &qword_100065730);
}

uint64_t sub_100037984@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v30 = sub_1000530C0();
  uint64_t v2 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_1000659C8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000053FC(&qword_1000659D0);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000053FC(&qword_1000659D8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100037CB0(v1, (uint64_t)v7);
  uint64_t v15 = sub_100053750();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100016A1C((uint64_t)v7, (uint64_t)v11, &qword_1000659C8);
  id v17 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *id v17 = KeyPath;
  v17[1] = v15;
  sub_100006918((uint64_t)v7, &qword_1000659C8);
  sub_1000530B0();
  uint64_t v18 = swift_getKeyPath();
  uint64_t v19 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  uint64_t v20 = sub_1000053FC(&qword_1000659E0);
  uint64_t v21 = v30;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v19 + *(int *)(v20 + 28), v4, v30);
  *uint64_t v19 = v18;
  sub_100016A1C((uint64_t)v11, (uint64_t)v14, &qword_1000659D0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v21);
  sub_100006918((uint64_t)v11, &qword_1000659D0);
  NSString v22 = (uint64_t *)(v29 + *(int *)(type metadata accessor for WidgetButton(0) + 24));
  uint64_t v23 = v22[1];
  uint64_t v32 = *v22;
  uint64_t v33 = v23;
  sub_1000068C4();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_1000535E0();
  uint64_t v26 = v25;
  LOBYTE(v4) = v27 & 1;
  sub_10003EDC8();
  sub_100053680();
  sub_10002A6A8(v24, v26, (char)v4);
  swift_bridgeObjectRelease();
  return sub_100006918((uint64_t)v14, &qword_1000659D8);
}

uint64_t sub_100037CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v33 = sub_1000053FC(&qword_100065A48);
  __chkstk_darwin(v33);
  uint64_t v34 = (uint64_t)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1000053FC(&qword_100065A18);
  uint64_t v31 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1000053FC(&qword_100065A28);
  uint64_t v6 = __chkstk_darwin(v32);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v30 = (uint64_t)&v30 - v9;
  uint64_t v10 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100052680();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v30 - v18;
  sub_100016A1C(a1, (uint64_t)v12, &qword_1000646A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    uint64_t v20 = sub_100006918((uint64_t)v12, &qword_1000646A0);
    __chkstk_darwin(v20);
    *(&v30 - 2) = a1;
    sub_100053820();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v22 = swift_allocObject();
    *(unsigned char *)(v22 + 16) = 1;
    uint64_t v23 = v31;
    uint64_t v24 = v35;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v8, v5, v35);
    uint64_t v25 = (uint64_t *)&v8[*(int *)(v32 + 36)];
    *uint64_t v25 = KeyPath;
    v25[1] = (uint64_t)sub_10003F164;
    void v25[2] = v22;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
    uint64_t v26 = v30;
    sub_100006AA8((uint64_t)v8, v30, &qword_100065A28);
    sub_100016A1C(v26, v34, &qword_100065A28);
    swift_storeEnumTagMultiPayload();
    sub_100006BF0(&qword_100065A10, &qword_100065A18);
    sub_10003F01C();
    sub_1000533D0();
    return sub_100006918(v26, &qword_100065A28);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    uint64_t v37 = sub_10003F17C(v17);
    __chkstk_darwin(v37);
    *(&v30 - 2) = a1;
    sub_100037464();
    sub_100053810();
    uint64_t v28 = v31;
    uint64_t v29 = v35;
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v34, v5, v35);
    swift_storeEnumTagMultiPayload();
    sub_100006BF0(&qword_100065A10, &qword_100065A18);
    sub_10003F01C();
    sub_1000533D0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v29);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

uint64_t sub_100038280@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WidgetButton(0);
  swift_bridgeObjectRetain();
  uint64_t result = sub_100053790();
  *a1 = result;
  return result;
}

id sub_1000382DC()
{
  uint64_t v1 = sub_100052FB0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  sub_100016A1C(v0 + *(int *)(v8 + 24), (uint64_t)v7, &qword_1000646A8);
  uint64_t v9 = sub_1000539F0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
  {
    sub_100006918((uint64_t)v7, &qword_1000646A8);
    Class isa = 0;
  }
  else
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    uint64_t v12 = (void *)sub_100052F90();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    Class isa = (Class)[v12 memojiMetadata];

    if (isa)
    {
      uint64_t v13 = sub_1000526A0();
      unint64_t v15 = v14;

      Class isa = sub_100052690().super.isa;
      sub_100016814(v13, v15);
    }
  }
  id v16 = [self memojiMetadataFromData:isa];

  return v16;
}

unint64_t sub_100038538()
{
  uint64_t v19 = sub_1000536F0();
  uint64_t v0 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = sub_1000382DC();
  if (!v3)
  {
    sub_1000053FC(&qword_100065890);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100054930;
    *(void *)(v16 + 32) = sub_100053720();
    uint64_t v20 = (void *)v16;
    sub_100053E30();
    return (unint64_t)v20;
  }
  uint64_t v4 = v3;
  uint64_t v20 = &_swiftEmptyArrayStorage;
  unint64_t result = (unint64_t)[v3 backgroundColorDescription];
  if (!result) {
    goto LABEL_19;
  }
  uint64_t v6 = (void *)result;
  sub_100053D30();

  id v7 = objc_allocWithZone((Class)CNMemojiBackgroundParameters);
  NSString v8 = sub_100053D20();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithColorDescription:v8];

  unint64_t result = (unint64_t)[v9 numberOfLayers];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
  if (result)
  {
    id v18 = v4;
    uint64_t v11 = 0;
    uint64_t v12 = (void (**)(char *, uint64_t, uint64_t))(v0 + 104);
    uint64_t v13 = enum case for Color.RGBColorSpace.sRGB(_:);
    do
    {
      id v15 = [v9 colorAtIndex:0 forLayer:v11];
      if (v15)
      {
        unint64_t v14 = v15;
        [v15 red];
        [v14 green];
        [v14 blue];
        [v14 alpha];
        (*v12)(v2, v13, v19);
        sub_100053770();
        sub_100053E00();
        if (v20[2] >= v20[3] >> 1) {
          sub_100053E40();
        }
        sub_100053E60();
        sub_100053E30();
      }
      else
      {
        sub_100053730();
        sub_100053E00();
        if (v20[2] >= v20[3] >> 1) {
          sub_100053E40();
        }
        sub_100053E60();
        sub_100053E30();
      }
      ++v11;
    }
    while (v10 != v11);

    return (unint64_t)v20;
  }

  return (unint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100038884()
{
  uint64_t v13 = sub_1000536F0();
  uint64_t v0 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100052FE0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v12 - v8;
  type metadata accessor for SingleContactQuickActionWidgetView(0);
  sub_1000253A4((uint64_t)v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for ColorScheme.dark(_:), v3);
  sub_100052FD0();
  unint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v10(v9, v3);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for Color.RGBColorSpace.sRGB(_:), v13);
  return sub_100053770();
}

uint64_t sub_100038AE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = sub_100053410();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  __chkstk_darwin(v2);
  uint64_t v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000533F0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  uint64_t v39 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1000053FC(&qword_100065818);
  __chkstk_darwin(v38);
  id v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_1000053FC(&qword_100065820);
  uint64_t v40 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  id v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1000053FC(&qword_100065828);
  __chkstk_darwin(v41);
  uint64_t v37 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100052FB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  uint64_t v19 = v1;
  sub_100016A1C(v1 + *(int *)(v18 + 24), (uint64_t)v17, &qword_1000646A8);
  uint64_t v20 = sub_1000539F0();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v17, 1, v20) == 1)
  {
    sub_100006918((uint64_t)v17, &qword_1000646A8);
    uint64_t v22 = v36;
    uint64_t v23 = (uint64_t)v37;
    uint64_t v25 = v34;
    uint64_t v24 = v35;
LABEL_4:
    sub_100053D80();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_1000539D0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v20);
  sub_100052F40();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v22 = v36;
  uint64_t v23 = (uint64_t)v37;
  uint64_t v25 = v34;
  uint64_t v24 = v35;
  if (!v27) {
    goto LABEL_4;
  }
LABEL_5:
  swift_bridgeObjectRelease();
  *(void *)id v7 = sub_100053340();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v28 = sub_1000053FC(&qword_100065830);
  sub_100039130(v19, (uint64_t)&v7[*(int *)(v28 + 44)]);
  uint64_t v29 = v39;
  sub_1000533E0();
  sub_100006BF0(&qword_100065838, &qword_100065818);
  sub_1000536C0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v29, v22);
  sub_100006918((uint64_t)v7, &qword_100065818);
  sub_1000538E0();
  __n128 v30 = sub_10004CA78(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v23, 0.0, 1, INFINITY, 0);
  (*(void (**)(char *, uint64_t, __n128))(v40 + 8))(v9, v25, v30);
  uint64_t v31 = v42;
  uint64_t v32 = sub_100053400();
  __chkstk_darwin(v32);
  sub_1000538E0();
  sub_1000053FC(&qword_100065840);
  sub_10003D96C();
  sub_10003DA78(&qword_100065850, &qword_100065840, (void (*)(void))sub_10003DA48);
  sub_1000536B0();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v45);
  return sub_100006918(v23, &qword_100065828);
}

uint64_t sub_100039130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v100 = a2;
  uint64_t v3 = sub_1000053FC(&qword_100065898);
  __chkstk_darwin(v3 - 8);
  uint64_t v86 = (uint64_t *)((char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000053FC(&qword_1000658A0);
  uint64_t v98 = *(void *)(v5 - 8);
  uint64_t v99 = v5;
  __chkstk_darwin(v5);
  uint64_t v85 = (uint64_t)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  __chkstk_darwin(v101);
  uint64_t v94 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000053FC(&qword_1000658A8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v97 = (uint64_t)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v96 = (char *)&v84 - v11;
  uint64_t v12 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v12 - 8);
  unint64_t v87 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000053FC(&qword_1000646A0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v84 = (uint64_t)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v91 = (uint64_t)&v84 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v84 - v19;
  uint64_t v95 = sub_1000533F0();
  uint64_t v21 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000053FC(&qword_1000658B0);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_1000053FC(&qword_1000658B8);
  uint64_t v27 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v29 = (char *)&v84 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_1000053FC(&qword_100064688);
  uint64_t v30 = __chkstk_darwin(v90);
  uint64_t v93 = (uint64_t)&v84 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v84 - v33;
  uint64_t v35 = __chkstk_darwin(v32);
  uint64_t v89 = (char *)&v84 - v36;
  __chkstk_darwin(v35);
  uint64_t v92 = (uint64_t)&v84 - v37;
  *(void *)uint64_t v26 = sub_100053340();
  *((void *)v26 + 1) = 0;
  v26[16] = 0;
  uint64_t v38 = sub_1000053FC(&qword_1000658C0);
  sub_100039B20(a1, (uint64_t)&v26[*(int *)(v38 + 44)]);
  sub_1000533E0();
  sub_100006BF0(&qword_1000658C8, &qword_1000658B0);
  sub_1000536C0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v95);
  uint64_t v39 = (uint64_t)v87;
  sub_100006918((uint64_t)v26, &qword_1000658B0);
  uint64_t v40 = *(int *)(v101 + 24);
  uint64_t v95 = a1;
  uint64_t v41 = a1 + v40;
  sub_100053990();
  uint64_t v42 = sub_100052680();
  uint64_t v43 = *(void *)(v42 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v20, 0, 1, v42);
  uint64_t v44 = sub_10004D2CC((uint64_t)v20);
  sub_100006918((uint64_t)v20, &qword_1000646A0);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v88);
  uint64_t v104 = v44;
  sub_100016A1C(v41, v39, &qword_1000646A8);
  uint64_t v45 = sub_1000539F0();
  uint64_t v46 = *(void *)(v45 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v39, 1, v45) == 1)
  {
    sub_100006918(v39, &qword_1000646A8);
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
  }
  else
  {
    uint64_t v47 = sub_1000539B0();
    unint64_t v48 = v49;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v39, v45);
  }
  uint64_t v102 = v47;
  unint64_t v103 = v48;
  sub_1000068C4();
  sub_100053690();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000529C0();
  uint64_t v50 = (uint64_t)v89;
  sub_100053090();
  swift_bridgeObjectRelease();
  sub_100006918((uint64_t)v34, &qword_100064688);
  uint64_t v51 = v92;
  sub_100006AA8(v50, v92, &qword_100064688);
  uint64_t v52 = v101;
  uint64_t v53 = v95;
  uint64_t v54 = v91;
  sub_100016A1C(v95 + *(int *)(v101 + 36), v91, &qword_1000646A0);
  uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
  int v56 = v55(v54, 1, v42);
  sub_100006918(v54, &qword_1000646A0);
  uint64_t v57 = v94;
  sub_10003E0B4(v53, v94, type metadata accessor for SingleContactQuickActionWidgetView);
  uint64_t v58 = (uint64_t)v96;
  if (v56 == 1)
  {
    uint64_t v59 = v57 + *(int *)(v52 + 32);
    uint64_t v60 = v84;
    sub_100016A1C(v59, v84, &qword_1000646A0);
    sub_10003E11C(v57, type metadata accessor for SingleContactQuickActionWidgetView);
    uint64_t v61 = 1;
    int v62 = v55(v60, 1, v42);
    sub_100006918(v60, &qword_1000646A0);
    BOOL v63 = v62 == 1;
    uint64_t v64 = v99;
    if (v63) {
      goto LABEL_10;
    }
  }
  else
  {
    sub_10003E11C(v57, type metadata accessor for SingleContactQuickActionWidgetView);
    uint64_t v64 = v99;
  }
  uint64_t v65 = sub_100053300();
  uint64_t v66 = (uint64_t)v86;
  *uint64_t v86 = v65;
  *(void *)(v66 + 8) = 0;
  *(unsigned char *)(v66 + 16) = 1;
  uint64_t v67 = sub_1000053FC(&qword_1000658D8);
  sub_10003A700(v53, v66 + *(int *)(v67 + 44));
  char v68 = sub_100053440();
  sub_100052FC0();
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v76 = v75;
  uint64_t v77 = v85;
  sub_100016A1C(v66, v85, &qword_100065898);
  uint64_t v78 = v77 + *(int *)(v64 + 36);
  *(unsigned char *)uint64_t v78 = v68;
  *(void *)(v78 + 8) = v70;
  *(void *)(v78 + 16) = v72;
  *(void *)(v78 + 24) = v74;
  *(void *)(v78 + 32) = v76;
  *(unsigned char *)(v78 + 40) = 0;
  sub_100006918(v66, &qword_100065898);
  sub_100006AA8(v77, v58, &qword_1000658A0);
  uint64_t v61 = 0;
LABEL_10:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56))(v58, v61, 1, v64);
  uint64_t v79 = v93;
  sub_100016A1C(v51, v93, &qword_100064688);
  uint64_t v80 = v97;
  sub_100016A1C(v58, v97, &qword_1000658A8);
  uint64_t v81 = v100;
  sub_100016A1C(v79, v100, &qword_100064688);
  uint64_t v82 = sub_1000053FC(&qword_1000658D0);
  sub_100016A1C(v80, v81 + *(int *)(v82 + 48), &qword_1000658A8);
  sub_100006918(v58, &qword_1000658A8);
  sub_100006918(v51, &qword_100064688);
  sub_100006918(v80, &qword_1000658A8);
  return sub_100006918(v79, &qword_100064688);
}

uint64_t sub_100039B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v106 = a2;
  uint64_t v3 = sub_100052C50();
  uint64_t v98 = *(void *)(v3 - 8);
  uint64_t v99 = v3;
  __chkstk_darwin(v3);
  uint64_t v100 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for StatusAndNameView();
  __chkstk_darwin(v5 - 8);
  unint64_t v103 = (void **)((char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v102 = sub_1000053FC(&qword_100065920);
  uint64_t v7 = __chkstk_darwin(v102);
  uint64_t v105 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v101 = (uint64_t)&v84 - v10;
  __chkstk_darwin(v9);
  uint64_t v104 = (uint64_t)&v84 - v11;
  uint64_t v88 = sub_100052710();
  uint64_t v12 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  unint64_t v87 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100052FB0();
  uint64_t v91 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v90 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000053FC(&qword_1000646A8);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v93 = (uint64_t)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v89 = (char *)&v84 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v84 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  uint64_t v28 = (char *)&v84 - v27;
  __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v84 - v29;
  uint64_t v31 = sub_1000053FC(&qword_1000646E8);
  uint64_t v32 = __chkstk_darwin(v31 - 8);
  uint64_t v95 = (char *)&v84 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v84 - v34;
  uint64_t v36 = type metadata accessor for AvatarView();
  uint64_t v37 = __chkstk_darwin(v36 - 8);
  uint64_t v97 = (uint64_t)&v84 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v86 = (char *)&v84 - v40;
  __chkstk_darwin(v39);
  uint64_t v96 = (uint64_t)&v84 - v41;
  uint64_t v85 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  uint64_t v42 = *(int *)(v85 + 24);
  uint64_t v94 = a1;
  uint64_t v109 = a1 + v42;
  sub_100016A1C(a1 + v42, (uint64_t)v30, &qword_1000646A8);
  uint64_t v43 = sub_1000539F0();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v108 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
  if (v108(v30, 1, v43) == 1)
  {
    sub_100006918((uint64_t)v30, &qword_1000646A8);
    uint64_t v45 = sub_100053AF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v35, 1, 1, v45);
  }
  else
  {
    sub_1000539C0();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v43);
    uint64_t v46 = sub_100053AF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v35, 0, 1, v46);
  }
  uint64_t v107 = v44;
  sub_100016A1C(v109, (uint64_t)v28, &qword_1000646A8);
  if (v108(v28, 1, v43) == 1)
  {
    sub_100006918((uint64_t)v28, &qword_1000646A8);
    uint64_t v47 = 0;
  }
  else
  {
    unint64_t v48 = v16;
    uint64_t v49 = v12;
    uint64_t v50 = v90;
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v28, v43);
    uint64_t v47 = sub_100052F90();
    uint64_t v51 = v50;
    uint64_t v12 = v49;
    uint64_t v16 = v48;
    (*(void (**)(char *, uint64_t))(v91 + 8))(v51, v92);
  }
  uint64_t v52 = (uint64_t)v89;
  sub_100016A1C(v109, (uint64_t)v25, &qword_1000646A8);
  if (v108(v25, 1, v43) == 1)
  {
    sub_100006918((uint64_t)v25, &qword_1000646A8);
    uint64_t v53 = sub_100053AB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v16, 1, 1, v53);
  }
  else
  {
    sub_1000539A0();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v25, v43);
  }
  uint64_t v54 = (uint64_t)v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v87, v94 + *(int *)(v85 + 28), v88);
  sub_100052BE0();
  uint64_t v55 = sub_100052BD0();
  int v56 = v86;
  sub_100045DFC((uint64_t)v35, v47, 0, 1, (uint64_t)v16, v55, 0, 1, v86, v54);
  uint64_t v57 = v96;
  sub_10003DF28((uint64_t)v56, v96, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100016A1C(v109, v52, &qword_1000646A8);
  if (v108((char *)v52, 1, v43) == 1)
  {
    sub_100006918(v52, &qword_1000646A8);
    uint64_t v58 = 0;
  }
  else
  {
    uint64_t v59 = v90;
    sub_1000539D0();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v52, v43);
    uint64_t v58 = (void *)sub_100052F90();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v59, v92);
  }
  uint64_t v60 = v93;
  sub_100016A1C(v109, v93, &qword_1000646A8);
  unsigned int v61 = v108((char *)v60, 1, v43);
  uint64_t v62 = (uint64_t)v95;
  if (v61 == 1)
  {
    sub_100006918(v60, &qword_1000646A8);
    uint64_t v63 = sub_100053AF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v62, 1, 1, v63);
  }
  else
  {
    sub_1000539C0();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v60, v43);
    uint64_t v64 = sub_100053AF0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v62, 0, 1, v64);
  }
  uint64_t v65 = (void *)sub_100053520();
  (*(void (**)(char *, void, uint64_t))(v98 + 104))(v100, enum case for ContactFormatter.Style.shortName(_:), v99);
  sub_100053D80();
  uint64_t v111 = sub_100052C70();
  uint64_t v112 = &protocol witness table for ContactFormatter;
  sub_100006974((uint64_t *)&v110);
  sub_100052C60();
  uint64_t v66 = v103;
  sub_10002A8CC(v58, v62, v65, &v110, (void *)1, (void *)1, v103, 3.0, 134.0);
  char v67 = sub_100053440();
  sub_100052FC0();
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v76 = v101;
  sub_10003E0B4((uint64_t)v66, v101, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v77 = v76 + *(int *)(v102 + 36);
  *(unsigned char *)uint64_t v77 = v67;
  *(void *)(v77 + 8) = v69;
  *(void *)(v77 + 16) = v71;
  *(void *)(v77 + 24) = v73;
  *(void *)(v77 + 32) = v75;
  *(unsigned char *)(v77 + 40) = 0;
  sub_10003E11C((uint64_t)v66, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v78 = v104;
  sub_100006AA8(v76, v104, &qword_100065920);
  uint64_t v79 = v97;
  sub_10003E0B4(v57, v97, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v80 = v105;
  sub_100016A1C(v78, v105, &qword_100065920);
  uint64_t v81 = v106;
  sub_10003E0B4(v79, v106, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v82 = sub_1000053FC(&qword_100065928);
  sub_100016A1C(v80, v81 + *(int *)(v82 + 48), &qword_100065920);
  sub_100006918(v78, &qword_100065920);
  sub_10003E11C(v57, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100006918(v80, &qword_100065920);
  return sub_10003E11C(v79, (uint64_t (*)(void))type metadata accessor for AvatarView);
}

uint64_t sub_10003A700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v118 = a2;
  uint64_t v107 = sub_1000053FC(&qword_1000658E0);
  __chkstk_darwin(v107);
  uint64_t v108 = (uint64_t)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WidgetAccentModifier(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v116 = (uint64_t *)((char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v110 = type metadata accessor for WidgetButton(0);
  uint64_t v6 = __chkstk_darwin(v110);
  uint64_t v114 = (uint64_t)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v94 - v9;
  __chkstk_darwin(v8);
  uint64_t v97 = (char *)&v94 - v11;
  uint64_t v113 = sub_1000053FC(&qword_1000658E8);
  uint64_t v12 = __chkstk_darwin(v113);
  uint64_t v112 = (char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v94 - v15;
  __chkstk_darwin(v14);
  uint64_t v96 = (char *)&v94 - v17;
  uint64_t v104 = sub_1000053FC(&qword_1000658F0);
  uint64_t v18 = __chkstk_darwin(v104);
  uint64_t v117 = (uint64_t)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v109 = (char *)&v94 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v111 = (uint64_t)&v94 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v99 = (char *)&v94 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v100 = (uint64_t)&v94 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v94 = (char *)&v94 - v29;
  __chkstk_darwin(v28);
  uint64_t v95 = (uint64_t)&v94 - v30;
  uint64_t v31 = sub_1000053FC(&qword_100065758);
  __chkstk_darwin(v31 - 8);
  uint64_t v33 = (char *)&v94 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100052B30();
  uint64_t v101 = *(void *)(v34 - 8);
  uint64_t v102 = v34;
  __chkstk_darwin(v34);
  uint64_t v98 = (char *)&v94 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v36 - 8);
  uint64_t v38 = (char *)&v94 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100052680();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v94 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41);
  uint64_t v45 = (char *)&v94 - v44;
  uint64_t v46 = sub_1000053FC(&qword_1000658F8);
  uint64_t v47 = __chkstk_darwin(v46 - 8);
  uint64_t v106 = (uint64_t)&v94 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v47);
  uint64_t v105 = (char *)&v94 - v49;
  uint64_t v103 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  uint64_t v50 = *(int *)(v103 + 36);
  uint64_t v115 = a1;
  uint64_t v51 = a1 + v50;
  sub_100016A1C(v51, (uint64_t)v38, &qword_1000646A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) == 1)
  {
    uint64_t v52 = &qword_1000646A0;
    uint64_t v53 = (uint64_t)v38;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v45, v38, v39);
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v54(v43, v45, v39);
    sub_100052AF0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v33, 1, v102) != 1)
    {
      (*(void (**)(void))(v101 + 32))();
      uint64_t v65 = (uint64_t)v97;
      v54(v97, v45, v39);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v65, 0, 1, v39);
      uint64_t v66 = sub_100052AA0();
      uint64_t v68 = v67;
      uint64_t v69 = sub_100053D80();
      uint64_t v57 = v110;
      uint64_t v70 = (uint64_t *)(v65 + *(int *)(v110 + 20));
      *uint64_t v70 = v66;
      v70[1] = v68;
      uint64_t v71 = (uint64_t *)(v65 + *(int *)(v57 + 24));
      uint64_t *v71 = v69;
      v71[1] = v72;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v55 = v116;
      uint64_t *v116 = KeyPath;
      sub_1000053FC(&qword_100064760);
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = v113;
      uint64_t v74 = (uint64_t)v96;
      sub_10003DF28((uint64_t)v55, (uint64_t)&v96[*(int *)(v113 + 36)], type metadata accessor for WidgetAccentModifier);
      sub_10003DF28(v65, v74, type metadata accessor for WidgetButton);
      sub_1000529D0();
      sub_10003DF90();
      uint64_t v75 = v94;
      sub_1000536D0();
      swift_bridgeObjectRelease();
      sub_100006918(v74, &qword_1000658E8);
      uint64_t v76 = (uint64_t)v75;
      uint64_t v77 = v95;
      sub_100006AA8(v76, v95, &qword_1000658F0);
      sub_100016A1C(v77, v108, &qword_1000658F0);
      swift_storeEnumTagMultiPayload();
      sub_10003F5D8(&qword_100065910, &qword_1000658F0, (void (*)(void))sub_10003DF90);
      uint64_t v78 = v105;
      sub_1000533D0();
      sub_100006918(v77, &qword_1000658F0);
      (*(void (**)(char *, uint64_t))(v101 + 8))(v98, v102);
      uint64_t v79 = v39;
      uint64_t v64 = (uint64_t)v78;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v45, v79);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v45, v39);
    uint64_t v52 = &qword_100065758;
    uint64_t v53 = (uint64_t)v33;
  }
  sub_100006918(v53, v52);
  uint64_t v55 = v116;
  sub_100016A1C(v51, (uint64_t)v10, &qword_1000646A0);
  uint64_t v56 = sub_100053D80();
  uint64_t v57 = v110;
  uint64_t v58 = &v10[*(int *)(v110 + 20)];
  *(void *)uint64_t v58 = 0x69662E656E6F6870;
  *((void *)v58 + 1) = 0xEA00000000006C6CLL;
  uint64_t v59 = (uint64_t *)&v10[*(int *)(v57 + 24)];
  *uint64_t v59 = v56;
  v59[1] = v60;
  uint64_t *v55 = swift_getKeyPath();
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  uint64_t v61 = v113;
  sub_10003DF28((uint64_t)v55, (uint64_t)&v16[*(int *)(v113 + 36)], type metadata accessor for WidgetAccentModifier);
  sub_10003DF28((uint64_t)v10, (uint64_t)v16, type metadata accessor for WidgetButton);
  sub_1000529D0();
  sub_10003DF90();
  uint64_t v62 = (uint64_t)v99;
  sub_1000536D0();
  swift_bridgeObjectRelease();
  sub_100006918((uint64_t)v16, &qword_1000658E8);
  uint64_t v63 = v100;
  sub_100006AA8(v62, v100, &qword_1000658F0);
  sub_100016A1C(v63, v108, &qword_1000658F0);
  swift_storeEnumTagMultiPayload();
  sub_10003F5D8(&qword_100065910, &qword_1000658F0, (void (*)(void))sub_10003DF90);
  uint64_t v64 = (uint64_t)v105;
  sub_1000533D0();
  sub_100006918(v63, &qword_1000658F0);
LABEL_7:
  uint64_t v80 = v114;
  sub_100016A1C(v115 + *(int *)(v103 + 32), v114, &qword_1000646A0);
  uint64_t v81 = sub_100053D80();
  uint64_t v82 = v80 + *(int *)(v57 + 20);
  strcpy((char *)v82, "message.fill");
  *(unsigned char *)(v82 + 13) = 0;
  *(_WORD *)(v82 + 14) = -5120;
  uint64_t v83 = (uint64_t *)(v80 + *(int *)(v57 + 24));
  *uint64_t v83 = v81;
  v83[1] = v84;
  uint64_t *v55 = swift_getKeyPath();
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  uint64_t v85 = (uint64_t)v112;
  sub_10003DF28((uint64_t)v55, (uint64_t)&v112[*(int *)(v61 + 36)], type metadata accessor for WidgetAccentModifier);
  sub_10003DF28(v80, v85, type metadata accessor for WidgetButton);
  sub_1000529E0();
  sub_10003DF90();
  uint64_t v86 = (uint64_t)v109;
  sub_1000536D0();
  swift_bridgeObjectRelease();
  sub_100006918(v85, &qword_1000658E8);
  uint64_t v87 = v111;
  sub_100006AA8(v86, v111, &qword_1000658F0);
  uint64_t v88 = v106;
  sub_100016A1C(v64, v106, &qword_1000658F8);
  uint64_t v89 = v117;
  sub_100016A1C(v87, v117, &qword_1000658F0);
  uint64_t v90 = v118;
  sub_100016A1C(v88, v118, &qword_1000658F8);
  uint64_t v91 = sub_1000053FC(&qword_100065918);
  uint64_t v92 = v90 + *(int *)(v91 + 48);
  *(void *)uint64_t v92 = 0;
  *(unsigned char *)(v92 + 8) = 1;
  sub_100016A1C(v89, v90 + *(int *)(v91 + 64), &qword_1000658F0);
  sub_100006918(v87, &qword_1000658F0);
  sub_100006918(v64, &qword_1000658F8);
  sub_100006918(v89, &qword_1000658F0);
  return sub_100006918(v88, &qword_1000658F8);
}

uint64_t sub_10003B310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for SingleContactQuickActionWidgetView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v3);
  uint64_t v22 = sub_1000053FC(&qword_100065870);
  uint64_t v7 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v9 = (char *)&KeyPath - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_100065860);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v24 = sub_100038538();
  uint64_t KeyPath = swift_getKeyPath();
  sub_10003E0B4(a1, (uint64_t)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SingleContactQuickActionWidgetView);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  sub_10003DF28((uint64_t)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for SingleContactQuickActionWidgetView);
  sub_1000053FC(&qword_100065878);
  sub_100006BF0(&qword_100065880, &qword_100065878);
  sub_10003DEAC();
  sub_100053870();
  uint64_t v16 = *(void *)(a1 + *(int *)(v4 + 56));
  uint64_t v17 = v22;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v22);
  *(void *)&v13[*(int *)(v11 + 44)] = v16;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  sub_100038884();
  uint64_t v18 = sub_100053740();
  swift_release();
  uint64_t v19 = v23;
  sub_100016A1C((uint64_t)v13, v23, &qword_100065860);
  *(void *)(v19 + *(int *)(sub_1000053FC(&qword_100065840) + 36)) = v18;
  return sub_100006918((uint64_t)v13, &qword_100065860);
}

uint64_t sub_10003B650@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)a2;
  char v6 = *(unsigned char *)(a2 + 8);
  sub_100010F84(*(void *)a2, v6);
  char v7 = sub_1000251A0(v5, v6);
  sub_100011254(v5, v6);
  if (v7)
  {
    uint64_t result = swift_retain();
  }
  else
  {
    uint64_t result = sub_100053720();
    uint64_t v4 = result;
  }
  *a3 = v4;
  return result;
}

uint64_t sub_10003B6D4(uint64_t a1)
{
  uint64_t v2 = sub_1000530C0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100053180();
}

uint64_t sub_10003B79C()
{
  uint64_t v0 = sub_1000525C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000053FC(&qword_100065738);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_100065740);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100052650();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_1000053FC(&qword_100065748);
  sub_100052640();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  uint64_t v15 = sub_100052680();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = sub_100052570();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_1000525B0();
}

uint64_t sub_10003BAA8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10003BAE0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10003BB44(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_100010F84(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (const void *)(a2 + v14);
    uint64_t v17 = sub_1000539F0();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_1000053FC(&qword_1000646A8);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    uint64_t v23 = sub_100052710();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[8];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (const void *)(a2 + v24);
    uint64_t v27 = sub_100052680();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48);
    if (v29(v26, 1, v27))
    {
      uint64_t v30 = sub_1000053FC(&qword_1000646A0);
      memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    uint64_t v31 = a3[9];
    uint64_t v32 = (void *)(a1 + v31);
    uint64_t v33 = (const void *)(a2 + v31);
    if (v29((const void *)(a2 + v31), 1, v27))
    {
      uint64_t v34 = sub_1000053FC(&qword_1000646A0);
      memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v32, v33, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v32, 0, 1, v27);
    }
    uint64_t v35 = a3[11];
    *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
    *(void *)(a1 + v35) = *(void *)(a2 + v35);
    *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  }
  return a1;
}

uint64_t sub_10003BF40(uint64_t a1, int *a2)
{
  sub_100011254(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100052FE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_1000539F0();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = sub_100052680();
  uint64_t v17 = *(void *)(v12 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  if (!v13(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v11, v12);
  }
  uint64_t v14 = a1 + a2[9];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(v14, 1, v12);
  if (!result)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8);
    return v16(v14, v12);
  }
  return result;
}

uint64_t sub_10003C1A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100010F84(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100052FE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_1000539F0();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_1000053FC(&qword_1000646A8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  uint64_t v25 = sub_100052680();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v24, 1, v25))
  {
    uint64_t v28 = sub_1000053FC(&qword_1000646A0);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 16))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (const void *)(a2 + v29);
  if (v27((const void *)(a2 + v29), 1, v25))
  {
    uint64_t v32 = sub_1000053FC(&qword_1000646A0);
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 16))(v30, v31, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v30, 0, 1, v25);
  }
  uint64_t v33 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10003C554(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100010F84(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100011254(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_100006918(a1 + v10, &qword_100064D80);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_1000539F0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
LABEL_11:
    uint64_t v22 = sub_1000053FC(&qword_1000646A8);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
LABEL_12:
  uint64_t v23 = a3[7];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = a3[8];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  uint64_t v30 = sub_100052680();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v31 + 48);
  int v33 = v32(v28, 1, v30);
  int v34 = v32(v29, 1, v30);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v31 + 8))(v28, v30);
LABEL_17:
    uint64_t v35 = sub_1000053FC(&qword_1000646A0);
    memcpy(v28, v29, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v31 + 24))(v28, v29, v30);
LABEL_18:
  uint64_t v36 = a3[9];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  int v39 = v32((void *)(a1 + v36), 1, v30);
  int v40 = v32(v38, 1, v30);
  if (!v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 24))(v37, v38, v30);
      goto LABEL_24;
    }
    (*(void (**)(void *, uint64_t))(v31 + 8))(v37, v30);
    goto LABEL_23;
  }
  if (v40)
  {
LABEL_23:
    uint64_t v41 = sub_1000053FC(&qword_1000646A0);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(void *, void *, uint64_t))(v31 + 16))(v37, v38, v30);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v37, 0, 1, v30);
LABEL_24:
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10003CA54(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100052FE0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_1000539F0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_1000053FC(&qword_1000646A8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = sub_100052680();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48);
  if (v26(v23, 1, v24))
  {
    uint64_t v27 = sub_1000053FC(&qword_1000646A0);
    memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  if (v26((const void *)(a2 + v28), 1, v24))
  {
    uint64_t v31 = sub_1000053FC(&qword_1000646A0);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 32))(v29, v30, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v29, 0, 1, v24);
  }
  uint64_t v32 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10003CE18(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100011254(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_100006918(a1 + v10, &qword_100064D80);
    uint64_t v13 = sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100052FE0();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_1000539F0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
LABEL_10:
    uint64_t v23 = sub_1000053FC(&qword_1000646A8);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(void *, char *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_11:
  uint64_t v24 = a3[7];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (uint64_t)a2 + v24;
  uint64_t v27 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  uint64_t v28 = a3[8];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_100052680();
  uint64_t v32 = *(void *)(v31 - 8);
  int v33 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33(v30, 1, v31);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v32 + 8))(v29, v31);
LABEL_16:
    uint64_t v36 = sub_1000053FC(&qword_1000646A0);
    memcpy(v29, v30, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(void *, char *, uint64_t))(v32 + 40))(v29, v30, v31);
LABEL_17:
  uint64_t v37 = a3[9];
  uint64_t v38 = (void *)(a1 + v37);
  int v39 = (char *)a2 + v37;
  int v40 = v33((void *)(a1 + v37), 1, v31);
  int v41 = v33(v39, 1, v31);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, char *, uint64_t))(v32 + 40))(v38, v39, v31);
      goto LABEL_23;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v38, v31);
    goto LABEL_22;
  }
  if (v41)
  {
LABEL_22:
    uint64_t v42 = sub_1000053FC(&qword_1000646A0);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(void *, char *, uint64_t))(v32 + 32))(v38, v39, v31);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v38, 0, 1, v31);
LABEL_23:
  uint64_t v43 = a3[11];
  *(void *)(a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
  *(void *)(a1 + v43) = *(uint64_t *)((char *)a2 + v43);
  *(void *)(a1 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
  return a1;
}

uint64_t sub_10003D318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003D32C);
}

uint64_t sub_10003D32C(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  uint64_t v8 = sub_1000053FC(&qword_1000650C0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_1000053FC(&qword_1000646A8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_11;
  }
  uint64_t v13 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_11;
  }
  uint64_t v15 = sub_1000053FC(&qword_1000646A0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[8];

  return v16(v18, a2, v17);
}

uint64_t sub_10003D4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003D508);
}

uint64_t sub_10003D508(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
    return result;
  }
  uint64_t v8 = sub_1000053FC(&qword_1000650C0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_1000053FC(&qword_1000646A8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_9;
  }
  uint64_t v13 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_9;
  }
  uint64_t v15 = sub_1000053FC(&qword_1000646A0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[8];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for SingleContactQuickActionWidgetView(uint64_t a1)
{
  return sub_100014EF8(a1, (uint64_t *)&unk_1000657B8);
}

void sub_10003D6F4()
{
  sub_10003D8E4(319, (unint64_t *)&unk_100065130, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_10003D8E4(319, (unint64_t *)&qword_100064C38, (uint64_t (*)(uint64_t))&type metadata accessor for PersonInfo, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      sub_100052710();
      if (v2 <= 0x3F)
      {
        sub_10003D8E4(319, (unint64_t *)&unk_1000657C8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_10003D8E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_10003D948()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003D964@<X0>(uint64_t a1@<X8>)
{
  return sub_10003B310(*(void *)(v1 + 16), a1);
}

unint64_t sub_10003D96C()
{
  unint64_t result = qword_100065848;
  if (!qword_100065848)
  {
    sub_100005440(&qword_100065828);
    sub_100005440(&qword_100065818);
    sub_100006BF0(&qword_100065838, &qword_100065818);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065848);
  }
  return result;
}

uint64_t sub_10003DA48()
{
  return sub_10003DA78(&qword_100065858, &qword_100065860, (void (*)(void))sub_10003DAF4);
}

uint64_t sub_10003DA78(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003DAF4()
{
  unint64_t result = qword_100065868;
  if (!qword_100065868)
  {
    sub_100005440(&qword_100065870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065868);
  }
  return result;
}

uint64_t sub_10003DB60()
{
  uint64_t v1 = (int *)type metadata accessor for SingleContactQuickActionWidgetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100011254(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  sub_1000053FC(&qword_100064D80);
  uint64_t v19 = v4;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100052FE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[6];
  uint64_t v9 = sub_1000539F0();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = v5 + v1[7];
  uint64_t v12 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v5 + v1[8];
  uint64_t v14 = sub_100052680();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (!v16(v13, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  uint64_t v17 = v5 + v1[9];
  if (!v16(v17, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
  }

  return _swift_deallocObject(v0, v3 + v19, v2 | 7);
}

uint64_t sub_10003DE2C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SingleContactQuickActionWidgetView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10003B650(a1, v6, a2);
}

unint64_t sub_10003DEAC()
{
  unint64_t result = qword_100065888;
  if (!qword_100065888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065888);
  }
  return result;
}

uint64_t type metadata accessor for WidgetButton(uint64_t a1)
{
  return sub_100014EF8(a1, qword_100065988);
}

uint64_t sub_10003DF28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10003DF90()
{
  unint64_t result = qword_100065900;
  if (!qword_100065900)
  {
    sub_100005440(&qword_1000658E8);
    sub_10003E06C(&qword_100065908, (void (*)(uint64_t))type metadata accessor for WidgetButton);
    sub_10003E06C((unint64_t *)&qword_100065288, (void (*)(uint64_t))type metadata accessor for WidgetAccentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065900);
  }
  return result;
}

uint64_t sub_10003E06C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003E0B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003E11C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10003E17C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100052680();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000053FC(&qword_1000646A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (uint64_t *)((char *)a1 + v12);
    uint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10003E318(uint64_t a1)
{
  uint64_t v2 = sub_100052680();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_10003E3F8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100052680();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  uint64_t v14 = &a1[v10];
  uint64_t v15 = &a2[v10];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_10003E544(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100052680();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_10003E71C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100052680();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_10003E84C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100052680();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10003EA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003EA18);
}

uint64_t sub_10003EA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000053FC(&qword_1000646A0);
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

uint64_t sub_10003EAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003EAF4);
}

uint64_t sub_10003EAF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000053FC(&qword_1000646A0);
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

void sub_10003EBB8()
{
  sub_10003D8E4(319, (unint64_t *)&unk_1000657C8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10003EC80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003ED2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003ED48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100053280();
  *a1 = result;
  return result;
}

uint64_t sub_10003ED74()
{
  return sub_100053290();
}

uint64_t sub_10003EDA0()
{
  return sub_100053170();
}

unint64_t sub_10003EDC8()
{
  unint64_t result = qword_1000659E8;
  if (!qword_1000659E8)
  {
    sub_100005440(&qword_1000659D8);
    sub_10003EE68();
    sub_100006BF0(&qword_100065A40, &qword_1000659E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000659E8);
  }
  return result;
}

unint64_t sub_10003EE68()
{
  unint64_t result = qword_1000659F0;
  if (!qword_1000659F0)
  {
    sub_100005440(&qword_1000659D0);
    sub_10003EF08();
    sub_100006BF0(&qword_1000652C8, &qword_1000652D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000659F0);
  }
  return result;
}

unint64_t sub_10003EF08()
{
  unint64_t result = qword_1000659F8;
  if (!qword_1000659F8)
  {
    sub_100005440(&qword_1000659C8);
    sub_10003EF7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000659F8);
  }
  return result;
}

unint64_t sub_10003EF7C()
{
  unint64_t result = qword_100065A00;
  if (!qword_100065A00)
  {
    sub_100005440(&qword_100065A08);
    sub_100006BF0(&qword_100065A10, &qword_100065A18);
    sub_10003F01C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065A00);
  }
  return result;
}

unint64_t sub_10003F01C()
{
  unint64_t result = qword_100065A20;
  if (!qword_100065A20)
  {
    sub_100005440(&qword_100065A28);
    sub_100006BF0(&qword_100065A10, &qword_100065A18);
    sub_100006BF0(&qword_100065A30, &qword_100065A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065A20);
  }
  return result;
}

uint64_t sub_10003F0E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_100038280(a1);
}

uint64_t sub_10003F0FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100053240();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10003F12C()
{
  return sub_100053250();
}

uint64_t sub_10003F154()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10003F164(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10003F17C(char *a1)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_100052680();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v31 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v30 = (char *)&v27 - v5;
  uint64_t v6 = sub_1000525C0();
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000053FC(&qword_100065738);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000053FC(&qword_100065740);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100052650();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_1000053FC(&qword_100065748);
  sub_100052640();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v14, 1, 1, v1);
  uint64_t v20 = sub_100052570();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v8, enum case for InputConnectionBehavior.default(_:), v29);
  uint64_t v21 = sub_1000525B0();
  int v22 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v23 = v30;
  uint64_t v24 = v32;
  v22(v30, v32, v1);
  v22(v31, v23, v1);
  swift_retain();
  sub_1000525A0();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v2 + 8);
  v25(v23, v1);
  swift_release();
  v25(v24, v1);
  return v21;
}

uint64_t sub_10003F59C()
{
  return sub_10003F5D8(&qword_100065A50, &qword_100065A58, (void (*)(void))sub_10003EDC8);
}

uint64_t sub_10003F5D8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    sub_10003E06C(&qword_100064690, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void **sub_10003F690(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100053AF0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    long long v15 = *(_OWORD *)((char *)a2 + v14 + 24);
    *(_OWORD *)((char *)v7 + v14 + 24) = v15;
    (**(void (***)(void))(v15 - 8))();
    uint64_t v16 = a3[7];
    uint64_t v17 = (void **)((char *)v7 + v16);
    uint64_t v18 = (void **)((char *)a2 + v16);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[8];
    uint64_t v21 = (void **)((char *)v7 + v20);
    int v22 = (void **)((char *)a2 + v20);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t sub_10003F8FC(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_100053AF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_100010614((uint64_t)a1 + a2[6]);
  uint64_t v6 = (char *)a1 + a2[7];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100053330();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = (char *)a1 + a2[8];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_100052FE0();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

void **sub_10003FA78(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053AF0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  long long v14 = *(_OWORD *)((char *)a2 + v13 + 24);
  *(_OWORD *)((char *)a1 + v13 + 24) = v14;
  (**(void (***)(void))(v14 - 8))();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void **)((char *)a1 + v15);
  uint64_t v17 = (void **)((char *)a2 + v15);
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100053330();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    void *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[8];
  uint64_t v20 = (void **)((char *)a1 + v19);
  uint64_t v21 = (void **)((char *)a2 + v19);
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_100052FE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  else
  {
    void *v20 = *v21;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_10003FC90(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  sub_1000107C8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]));
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    long long v14 = (void **)((char *)a1 + v13);
    uint64_t v15 = (void **)((char *)a2 + v13);
    sub_100006918((uint64_t)a1 + v13, &qword_100064768);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *long long v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[8];
    uint64_t v18 = (void **)((char *)a1 + v17);
    uint64_t v19 = (void **)((char *)a2 + v17);
    sub_100006918((uint64_t)a1 + v17, &qword_100064D80);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10003FE80(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  uint64_t v15 = (char *)a1 + v11;
  uint64_t v16 = (char *)a2 + v11;
  uint64_t v17 = sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100053330();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_100052FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  return a1;
}

void **sub_100040064(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  sub_100010614((uint64_t)a1 + v11);
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  if (a1 != a2)
  {
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    sub_100006918((uint64_t)a1 + v15, &qword_100064768);
    uint64_t v18 = sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_100053330();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    sub_100006918((uint64_t)a1 + v20, &qword_100064D80);
    uint64_t v23 = sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_100052FE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100040284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100040298);
}

uint64_t sub_100040298(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v13(a1 + v9, a2, v7);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + a3[6] + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v12 = sub_1000053FC(&qword_100064828);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
    {
      uint64_t v7 = v12;
      uint64_t v8 = *(void *)(v12 - 8);
      uint64_t v9 = a3[7];
      goto LABEL_9;
    }
    uint64_t v14 = sub_1000053FC(&qword_1000650C0);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + a3[8];
    return v15(v17, a2, v16);
  }
}

uint64_t sub_100040420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100040434);
}

uint64_t sub_100040434(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_100053AF0();
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(a1 + v11, a2, a2, v9);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 24) = (a2 - 1);
    return result;
  }
  uint64_t v12 = sub_1000053FC(&qword_100064828);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_7;
  }
  uint64_t v14 = sub_1000053FC(&qword_1000650C0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a4[8];

  return v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for StatusAndNameViewVertical()
{
  uint64_t result = qword_100065AB8;
  if (!qword_100065AB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100040608()
{
  sub_100053AF0();
  if (v0 <= 0x3F)
  {
    sub_100040758(319, (unint64_t *)&qword_100064898, (void (*)(uint64_t))&type metadata accessor for ContentSizeCategory);
    if (v1 <= 0x3F)
    {
      sub_100040758(319, (unint64_t *)&unk_100065130, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100040758(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100052FF0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000407AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000407C8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v136 = a2;
  uint64_t v3 = sub_1000053FC(&qword_100065B08);
  __chkstk_darwin(v3 - 8);
  uint64_t v107 = (uint64_t *)((char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000053FC(&qword_100065B10);
  uint64_t v133 = *(void *)(v5 - 8);
  uint64_t v134 = v5;
  __chkstk_darwin(v5);
  uint64_t v106 = (uint64_t)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_100053330();
  uint64_t v109 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v108 = (uint64_t)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000053FC(&qword_100065B18);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v135 = (uint64_t)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v132 = (char *)&v106 - v11;
  uint64_t v114 = sub_100053580();
  uint64_t v113 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  uint64_t v13 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_1000053FC(&qword_100065B20);
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v115 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_1000053FC(&qword_100065B28);
  __chkstk_darwin(v111);
  uint64_t v16 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_1000053FC(&qword_100065B30);
  __chkstk_darwin(v112);
  uint64_t v18 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_1000053FC(&qword_100065B38);
  __chkstk_darwin(v117);
  uint64_t v20 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_1000053FC(&qword_100065B40);
  __chkstk_darwin(v125);
  uint64_t v22 = (char *)&v106 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_1000053FC(&qword_100065B48);
  uint64_t v127 = *(void *)(v129 - 8);
  __chkstk_darwin(v129);
  uint64_t v124 = (char *)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_1000053FC(&qword_100065B50);
  uint64_t v126 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v123 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_1000053FC(&qword_100065B58);
  __chkstk_darwin(v121);
  uint64_t v26 = (char *)&v106 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_1000053FC(&qword_100065B60);
  uint64_t v27 = __chkstk_darwin(v122);
  uint64_t v131 = (uint64_t)&v106 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v120 = (uint64_t)&v106 - v30;
  __chkstk_darwin(v29);
  uint64_t v130 = (uint64_t)&v106 - v31;
  uint64_t v32 = *a1;
  uint64_t v116 = a1;
  if (v32)
  {
    uint64_t v33 = type metadata accessor for StatusAndNameViewVertical();
    sub_1000162D8((void **)((char *)a1 + *(int *)(v33 + 24)), *(uint64_t *)((char *)a1 + *(int *)(v33 + 24) + 24));
    id v34 = v32;
    uint64_t v35 = sub_100052F10();
    uint64_t v37 = v36;
  }
  else
  {
    uint64_t v35 = sub_100053D80();
    uint64_t v37 = v38;
  }
  uint64_t v139 = v35;
  uint64_t v140 = v37;
  sub_1000068C4();
  uint64_t v139 = sub_1000535E0();
  uint64_t v140 = v39;
  char v141 = v40 & 1;
  uint64_t v142 = v41;
  sub_100053570();
  uint64_t v42 = v115;
  sub_100053650();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v13, v114);
  sub_10002A6A8(v139, v140, v141);
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_100053750();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v45 = v118;
  uint64_t v46 = v119;
  (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v16, v42, v119);
  uint64_t v47 = (uint64_t *)&v16[*(int *)(v111 + 36)];
  uint64_t *v47 = KeyPath;
  v47[1] = v43;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v46);
  LOBYTE(v43) = sub_100053460();
  sub_100052FC0();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  sub_100016A1C((uint64_t)v16, (uint64_t)v18, &qword_100065B28);
  uint64_t v56 = &v18[*(int *)(v112 + 36)];
  char *v56 = v43;
  *((void *)v56 + 1) = v49;
  *((void *)v56 + 2) = v51;
  *((void *)v56 + 3) = v53;
  *((void *)v56 + 4) = v55;
  v56[40] = 0;
  sub_100006918((uint64_t)v16, &qword_100065B28);
  LOBYTE(v43) = sub_100053450();
  sub_100052FC0();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  sub_100016A1C((uint64_t)v18, (uint64_t)v20, &qword_100065B30);
  uint64_t v65 = &v20[*(int *)(v117 + 36)];
  *uint64_t v65 = v43;
  *((void *)v65 + 1) = v58;
  *((void *)v65 + 2) = v60;
  *((void *)v65 + 3) = v62;
  *((void *)v65 + 4) = v64;
  v65[40] = 0;
  sub_100006918((uint64_t)v18, &qword_100065B30);
  uint64_t v66 = sub_100053520();
  uint64_t v67 = swift_getKeyPath();
  sub_100016A1C((uint64_t)v20, (uint64_t)v22, &qword_100065B38);
  uint64_t v68 = v125;
  uint64_t v69 = (uint64_t *)&v22[*(int *)(v125 + 36)];
  *uint64_t v69 = v67;
  v69[1] = v66;
  sub_100006918((uint64_t)v20, &qword_100065B38);
  unint64_t v70 = sub_10004242C();
  uint64_t v71 = v124;
  sub_1000536E0();
  sub_100006918((uint64_t)v22, &qword_100065B40);
  sub_1000534D0();
  uint64_t v139 = v68;
  uint64_t v140 = v70;
  swift_getOpaqueTypeConformance2();
  uint64_t v72 = v123;
  uint64_t v73 = v129;
  sub_100053640();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v71, v73);
  uint64_t v74 = swift_getKeyPath();
  uint64_t v75 = v126;
  uint64_t v76 = v128;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v26, v72, v128);
  uint64_t v77 = &v26[*(int *)(v121 + 36)];
  *(void *)uint64_t v77 = v74;
  v77[8] = 1;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v76);
  uint64_t v78 = swift_getKeyPath();
  uint64_t v79 = v120;
  sub_100016A1C((uint64_t)v26, v120, &qword_100065B58);
  uint64_t v80 = v79 + *(int *)(v122 + 36);
  *(void *)uint64_t v80 = v78;
  *(void *)(v80 + 8) = 1;
  *(unsigned char *)(v80 + 16) = 0;
  sub_100006918((uint64_t)v26, &qword_100065B58);
  uint64_t v81 = v130;
  sub_100006AA8(v79, v130, &qword_100065B60);
  type metadata accessor for StatusAndNameViewVertical();
  uint64_t v82 = (uint64_t)v116;
  sub_100053AD0();
  if (v138)
  {
    sub_10001672C(&v137, (uint64_t)&v139);
    uint64_t v83 = v108;
    sub_100024704(v108);
    char v84 = sub_100053320();
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v83, v110);
    uint64_t v85 = (uint64_t)v132;
    if ((v84 & 1) == 0)
    {
      uint64_t v86 = sub_100053340();
      uint64_t v87 = (uint64_t)v107;
      *uint64_t v107 = v86;
      *(void *)(v87 + 8) = 0x4004000000000000;
      *(unsigned char *)(v87 + 16) = 0;
      uint64_t v88 = sub_1000053FC(&qword_100065B90);
      sub_1000414CC(v82, &v139, (void *)(v87 + *(int *)(v88 + 44)));
      char v89 = sub_100053450();
      sub_100052FC0();
      uint64_t v91 = v90;
      uint64_t v93 = v92;
      uint64_t v95 = v94;
      uint64_t v97 = v96;
      uint64_t v98 = v106;
      sub_100016A1C(v87, v106, &qword_100065B08);
      uint64_t v99 = v134;
      uint64_t v100 = v98 + *(int *)(v134 + 36);
      *(unsigned char *)uint64_t v100 = v89;
      *(void *)(v100 + 8) = v91;
      *(void *)(v100 + 16) = v93;
      *(void *)(v100 + 24) = v95;
      *(void *)(v100 + 32) = v97;
      *(unsigned char *)(v100 + 40) = 0;
      sub_100006918(v87, &qword_100065B08);
      sub_100006AA8(v98, v85, &qword_100065B10);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v133 + 56))(v85, 0, 1, v99);
      sub_100010614((uint64_t)&v139);
      goto LABEL_10;
    }
    sub_100010614((uint64_t)&v139);
  }
  else
  {
    sub_100006918((uint64_t)&v137, &qword_1000651F0);
    uint64_t v85 = (uint64_t)v132;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v133 + 56))(v85, 1, 1, v134);
LABEL_10:
  uint64_t v101 = v131;
  sub_100016A1C(v81, v131, &qword_100065B60);
  uint64_t v102 = v135;
  sub_100016A1C(v85, v135, &qword_100065B18);
  uint64_t v103 = v136;
  sub_100016A1C(v101, v136, &qword_100065B60);
  uint64_t v104 = sub_1000053FC(&qword_100065B88);
  sub_100016A1C(v102, v103 + *(int *)(v104 + 48), &qword_100065B18);
  sub_100006918(v85, &qword_100065B18);
  sub_100006918(v81, &qword_100065B60);
  sub_100006918(v102, &qword_100065B18);
  return sub_100006918(v101, &qword_100065B60);
}

uint64_t sub_1000414CC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v97 = a2;
  uint64_t v100 = sub_100052FE0();
  uint64_t v124 = *(void *)(v100 - 8);
  uint64_t v5 = __chkstk_darwin(v100);
  uint64_t v122 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v120 = (uint64_t)&v92 - v7;
  uint64_t v8 = sub_1000538F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v123 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_100053580();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  uint64_t v103 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1000053FC(&qword_100065B20);
  uint64_t v108 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  uint64_t v13 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_1000053FC(&qword_100065B98);
  __chkstk_darwin(v104);
  uint64_t v15 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_1000053FC(&qword_100065BA0);
  __chkstk_darwin(v110);
  uint64_t v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_1000053FC(&qword_100065BA8);
  uint64_t v111 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  uint64_t v109 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_1000053FC(&qword_100065BB0);
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v116 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_1000053FC(&qword_100065BB8);
  __chkstk_darwin(v112);
  uint64_t v107 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_1000053FC(&qword_100065BC0);
  __chkstk_darwin(v114);
  uint64_t v117 = (uint64_t)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_1000053FC(&qword_100065BC8);
  uint64_t v22 = __chkstk_darwin(v115);
  uint64_t v133 = (uint64_t)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v113 = (uint64_t)&v92 - v25;
  __chkstk_darwin(v24);
  uint64_t v132 = (uint64_t)&v92 - v26;
  uint64_t v27 = sub_1000537A0();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for StatusAndNameViewVertical();
  uint64_t v121 = a1;
  sub_100053AE0();
  uint64_t v126 = v8;
  uint64_t v125 = v9;
  uint64_t v102 = a3;
  if (!v144)
  {
    sub_100006918((uint64_t)&v142, &qword_100065248);
LABEL_7:
    uint64_t v131 = 0;
    uint64_t v96 = 0;
    uint64_t v130 = 0;
    uint64_t v129 = 0;
    uint64_t v128 = 0;
    uint64_t v137 = 0;
    uint64_t v31 = 0;
    goto LABEL_8;
  }
  sub_10001672C(&v142, (uint64_t)&v138);
  sub_1000162D8(&v138, v141);
  if ((sub_100053A50() & 1) == 0)
  {
    sub_100010614((uint64_t)&v138);
    goto LABEL_7;
  }
  sub_1000162D8(&v138, v141);
  uint64_t v31 = sub_100053A60();
  if (v31)
  {
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(v30, enum case for Image.ResizingMode.stretch(_:), v27);
    uint64_t v131 = sub_1000537D0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
    sub_1000538E0();
    sub_100053050();
    uint64_t v96 = v142;
    uint64_t v130 = BYTE8(v142);
    uint64_t v129 = v143;
    uint64_t v128 = v144;
    uint64_t v137 = v145;
    uint64_t v31 = v146;
    sub_1000162D8(&v138, v141);
    uint64_t v136 = sub_100053A40();
    uint64_t KeyPath = swift_getKeyPath();
    unsigned __int8 v32 = sub_100053460();
    sub_100052FC0();
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    swift_release();
    uint64_t v135 = v34;
    uint64_t v95 = v36;
    uint64_t v94 = v38;
    uint64_t v93 = v40;
    uint64_t v134 = v32;
    sub_100010614((uint64_t)&v138);
    goto LABEL_9;
  }
  sub_100010614((uint64_t)&v138);
  uint64_t v131 = 0;
  uint64_t v96 = 0;
  uint64_t v130 = 0;
  uint64_t v129 = 0;
  uint64_t v128 = 0;
  uint64_t v137 = 0;
LABEL_8:
  uint64_t KeyPath = 0;
  uint64_t v135 = 0;
  uint64_t v136 = 0;
  uint64_t v134 = 0;
  uint64_t v95 = 0;
  uint64_t v94 = 0;
  uint64_t v93 = 0;
LABEL_9:
  uint64_t v41 = v100;
  uint64_t v42 = v99;
  uint64_t v43 = v98;
  sub_1000162D8(v97, v97[3]);
  uint64_t v138 = sub_100052A70();
  uint64_t v139 = v44;
  sub_1000068C4();
  uint64_t v138 = sub_1000535E0();
  uint64_t v139 = v45;
  char v140 = v46 & 1;
  uint64_t v141 = v47;
  uint64_t v48 = v103;
  sub_100053570();
  sub_100053650();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v48, v106);
  sub_10002A6A8(v138, v139, v140);
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_100053510();
  uint64_t v50 = swift_getKeyPath();
  uint64_t v51 = v108;
  (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v15, v13, v43);
  uint64_t v52 = (uint64_t *)&v15[*(int *)(v104 + 36)];
  *uint64_t v52 = v50;
  v52[1] = v49;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v43);
  uint64_t v53 = sub_100053760();
  uint64_t v54 = swift_getKeyPath();
  sub_100016A1C((uint64_t)v15, (uint64_t)v17, &qword_100065B98);
  uint64_t v55 = v110;
  uint64_t v56 = (uint64_t *)&v17[*(int *)(v110 + 36)];
  uint64_t *v56 = v54;
  v56[1] = v53;
  sub_100006918((uint64_t)v15, &qword_100065B98);
  sub_1000534C0();
  unint64_t v57 = sub_1000425F4();
  uint64_t v58 = v109;
  sub_100053640();
  sub_100006918((uint64_t)v17, &qword_100065BA0);
  uint64_t v138 = v55;
  uint64_t v139 = v57;
  swift_getOpaqueTypeConformance2();
  uint64_t v59 = v116;
  sub_1000536E0();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v58, v42);
  uint64_t v60 = v120;
  sub_1000253A4(v120);
  uint64_t v61 = v124;
  uint64_t v62 = v122;
  (*(void (**)(char *, void, uint64_t))(v124 + 104))(v122, enum case for ColorScheme.dark(_:), v41);
  LOBYTE(v53) = sub_100052FD0();
  uint64_t v63 = *(void (**)(char *, uint64_t))(v61 + 8);
  v63(v62, v41);
  v63((char *)v60, v41);
  uint64_t v64 = v125;
  uint64_t v65 = (unsigned int *)&enum case for BlendMode.plusLighter(_:);
  if ((v53 & 1) == 0) {
    uint64_t v65 = (unsigned int *)&enum case for BlendMode.plusDarker(_:);
  }
  uint64_t v66 = v123;
  uint64_t v67 = v126;
  (*(void (**)(char *, void, uint64_t))(v125 + 104))(v123, *v65, v126);
  uint64_t v68 = (uint64_t)v107;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(&v107[*(int *)(v112 + 36)], v66, v67);
  uint64_t v69 = v118;
  uint64_t v70 = v119;
  (*(void (**)(uint64_t, char *, uint64_t))(v118 + 16))(v68, v59, v119);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v67);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v59, v70);
  uint64_t v71 = swift_getKeyPath();
  uint64_t v72 = v117;
  sub_100016A1C(v68, v117, &qword_100065BB8);
  uint64_t v73 = v72 + *(int *)(v114 + 36);
  *(void *)uint64_t v73 = v71;
  *(void *)(v73 + 8) = 1;
  *(unsigned char *)(v73 + 16) = 0;
  sub_100006918(v68, &qword_100065BB8);
  uint64_t v74 = swift_getKeyPath();
  uint64_t v75 = v113;
  sub_100016A1C(v72, v113, &qword_100065BC0);
  uint64_t v76 = v75 + *(int *)(v115 + 36);
  *(void *)uint64_t v76 = v74;
  *(unsigned char *)(v76 + 8) = 1;
  sub_100006918(v72, &qword_100065BC0);
  uint64_t v77 = v132;
  sub_100006AA8(v75, v132, &qword_100065BC8);
  uint64_t v78 = v77;
  uint64_t v79 = v133;
  sub_100016A1C(v78, v133, &qword_100065BC8);
  uint64_t v80 = v102;
  uint64_t v81 = v96;
  *uint64_t v102 = v131;
  v80[1] = v81;
  uint64_t v82 = v129;
  v80[2] = v130;
  v80[3] = v82;
  uint64_t v83 = v137;
  v80[4] = v128;
  v80[5] = v83;
  uint64_t v137 = v83;
  uint64_t v100 = v31;
  uint64_t v84 = KeyPath;
  v80[6] = v31;
  v80[7] = v84;
  uint64_t v85 = v135;
  uint64_t v86 = v134;
  v80[8] = v136;
  v80[9] = v86;
  uint64_t v134 = v86;
  uint64_t v87 = v95;
  v80[10] = v85;
  v80[11] = v87;
  uint64_t v88 = v93;
  v80[12] = v94;
  v80[13] = v88;
  *((unsigned char *)v80 + 112) = 0;
  uint64_t v89 = sub_1000053FC(&qword_100065BE0);
  sub_100016A1C(v79, (uint64_t)v80 + *(int *)(v89 + 48), &qword_100065BC8);
  uint64_t v90 = v131;
  sub_100042788(v131);
  sub_100006918(v132, &qword_100065BC8);
  sub_100006918(v133, &qword_100065BC8);
  return sub_1000427D8(v90);
}

uint64_t sub_1000423D0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1000532F0();
  *(void *)(a1 + 8) = 0x3FF0000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_1000053FC(&qword_100065B00);
  return sub_1000407C8(v1, a1 + *(int *)(v3 + 44));
}

unint64_t sub_10004242C()
{
  unint64_t result = qword_100065B68;
  if (!qword_100065B68)
  {
    sub_100005440(&qword_100065B40);
    sub_1000424CC();
    sub_100006BF0(&qword_1000652B8, &qword_1000652C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065B68);
  }
  return result;
}

unint64_t sub_1000424CC()
{
  unint64_t result = qword_100065B70;
  if (!qword_100065B70)
  {
    sub_100005440(&qword_100065B38);
    sub_100042548();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065B70);
  }
  return result;
}

unint64_t sub_100042548()
{
  unint64_t result = qword_100065B78;
  if (!qword_100065B78)
  {
    sub_100005440(&qword_100065B30);
    sub_1000426B4(&qword_100065B80, &qword_100065B28, &qword_1000652C8, &qword_1000652D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065B78);
  }
  return result;
}

unint64_t sub_1000425F4()
{
  unint64_t result = qword_100065BD0;
  if (!qword_100065BD0)
  {
    sub_100005440(&qword_100065BA0);
    sub_1000426B4(&qword_100065BD8, &qword_100065B98, &qword_1000652B8, &qword_1000652C0);
    sub_100006BF0(&qword_1000652C8, &qword_1000652D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065BD0);
  }
  return result;
}

uint64_t sub_1000426B4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    swift_getOpaqueTypeConformance2();
    sub_100006BF0(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100042788(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000427D8(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100042824()
{
  return sub_100006BF0(&qword_100065BE8, &qword_100065BF0);
}

uint64_t *sub_100042860(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100053AF0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v11 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    id v14 = v10;
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000429D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + *(int *)(a2 + 32);
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100053330();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100042ACC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  id v13 = v9;
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_100053330();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
  }
  else
  {
    void *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100042BEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  if (a1 != a2)
  {
    uint64_t v11 = a3[8];
    uint64_t v12 = (void *)(a1 + v11);
    id v13 = (void *)(a2 + v11);
    sub_100006918(a1 + v11, &qword_100064768);
    sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100053330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100042D34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (void *)(a1 + v8);
  id v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100053330();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100042E60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[8];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (const void *)(a2 + v10);
    sub_100006918(a1 + v10, &qword_100064768);
    uint64_t v13 = sub_1000053FC(&qword_100064768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100053330();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100042FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042FC4);
}

uint64_t sub_100042FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100053AF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = sub_1000053FC(&qword_100064828);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 32);
    return v13(v15, a2, v14);
  }
}

uint64_t sub_100043100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100043114);
}

uint64_t sub_100043114(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100053AF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  else
  {
    uint64_t v11 = sub_1000053FC(&qword_100064828);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for StatusBadgeView()
{
  uint64_t result = qword_100065C50;
  if (!qword_100065C50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100043290()
{
  sub_100053AF0();
  if (v0 <= 0x3F)
  {
    sub_100043370();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100043370()
{
  if (!qword_100064898)
  {
    sub_100053330();
    unint64_t v0 = sub_100052FF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100064898);
    }
  }
}

uint64_t sub_1000433C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000433E4()
{
  uint64_t v1 = sub_100052A60();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  long long v8 = *(_OWORD *)(v0 + 40);
  type metadata accessor for CGSize(0);
  sub_100054020();
  sub_1000162D8((void *)v0, *(void *)(v0 + 24));
  sub_100052B40();
  sub_100045DB8(&qword_100065DC8);
  v11._countAndFlagsBits = sub_100054090();
  sub_100053DA0(v11);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v5 = *(void **)(v0 + 64);
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = v6;
  v12._object = v5;
  sub_100053DA0(v12);
  swift_bridgeObjectRelease();
  sub_100053D50();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100043590()
{
  return sub_100054110();
}

Swift::Int sub_1000435D4()
{
  return sub_100054110();
}

uint64_t sub_100043614@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  *a1 = *(void *)(v1 + 56);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100043620@<X0>(void *a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, uint64_t *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D6>, double a11@<D7>)
{
  double v106 = a3;
  uint64_t v105 = a2;
  uint64_t v120 = a4;
  uint64_t v19 = sub_1000053FC(&qword_100065CE0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (double *)((char *)&v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v107 = sub_1000053FC(&qword_100065CE8);
  __chkstk_darwin(v107);
  uint64_t v23 = (char *)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_1000053FC(&qword_100065CF0);
  __chkstk_darwin(v108);
  uint64_t v111 = (uint64_t)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_1000053FC(&qword_100065CF8);
  __chkstk_darwin(v109);
  uint64_t v113 = (uint64_t)&v101 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_1000053FC(&qword_100065D00);
  __chkstk_darwin(v110);
  uint64_t v114 = (uint64_t)&v101 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_1000053FC(&qword_100065D08);
  __chkstk_darwin(v112);
  uint64_t v118 = (uint64_t)&v101 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_1000053FC(&qword_100065D10);
  __chkstk_darwin(v115);
  uint64_t v117 = (uint64_t)&v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_1000053FC(&qword_100065D18);
  __chkstk_darwin(v119);
  uint64_t v116 = (uint64_t)&v101 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100053330();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v101 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v101 - v35;
  sub_1000162D8(a1, a1[3]);
  uint64_t v37 = sub_100053A60();
  if (v37)
  {
    uint64_t v102 = v37;
    uint64_t v38 = type metadata accessor for StatusBadgeView();
    sub_100024704((uint64_t)v36);
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v34, enum case for ContentSizeCategory.accessibilityLarge(_:), v30);
    BOOL v39 = sub_100015DE4((uint64_t)v36, (uint64_t)v34);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v31 + 8);
    v40(v34, v30);
    v40(v36, v30);
    double v104 = a9;
    double v103 = a8;
    if (v39)
    {
      uint64_t v41 = *(void *)&v121;
      uint64_t v42 = *(void **)(*(void *)&v121 + *(int *)(v38 + 20));
      if (!v42)
      {
        sub_100045920();
        uint64_t v42 = 0;
      }
      double v45 = a7;
      id v47 = v42;
      uint64_t v46 = sub_100053540();
    }
    else
    {
      double v45 = a7;
      sub_1000162D8(a1, a1[3]);
      uint64_t v46 = sub_100053A20();
      uint64_t v41 = *(void *)&v121;
    }
    double v48 = v106;
    *(void *)uint64_t v21 = v105;
    v21[1] = v48;
    uint64_t v49 = sub_1000053FC(&qword_100065D20);
    sub_100043EC0(a1, v41, v102, v46, (uint64_t)v21 + *(int *)(v49 + 44));
    char v50 = sub_100053440();
    sub_100052FC0();
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    double v121 = a11;
    uint64_t v56 = v55;
    double v106 = a10;
    uint64_t v58 = v57;
    sub_100016A1C((uint64_t)v21, (uint64_t)v23, &qword_100065CE0);
    uint64_t v59 = &v23[*(int *)(v107 + 36)];
    *uint64_t v59 = v50;
    *((void *)v59 + 1) = v52;
    *((void *)v59 + 2) = v54;
    *((void *)v59 + 3) = v56;
    *((void *)v59 + 4) = v58;
    v59[40] = 0;
    sub_100006918((uint64_t)v21, &qword_100065CE0);
    char v60 = sub_100053450();
    sub_100052FC0();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v68 = v67;
    uint64_t v69 = v111;
    sub_100016A1C((uint64_t)v23, v111, &qword_100065CE8);
    uint64_t v70 = v69 + *(int *)(v108 + 36);
    *(unsigned char *)uint64_t v70 = v60;
    *(void *)(v70 + 8) = v62;
    *(void *)(v70 + 16) = v64;
    *(void *)(v70 + 24) = v66;
    *(void *)(v70 + 32) = v68;
    *(unsigned char *)(v70 + 40) = 0;
    sub_100006918((uint64_t)v23, &qword_100065CE8);
    char v71 = sub_100053460();
    double v72 = a6;
    sub_100052FC0();
    uint64_t v74 = v73;
    uint64_t v76 = v75;
    uint64_t v78 = v77;
    uint64_t v80 = v79;
    uint64_t v81 = v113;
    sub_100016A1C(v69, v113, &qword_100065CF0);
    uint64_t v82 = v81 + *(int *)(v109 + 36);
    *(unsigned char *)uint64_t v82 = v71;
    *(void *)(v82 + 8) = v74;
    *(void *)(v82 + 16) = v76;
    *(void *)(v82 + 24) = v78;
    *(void *)(v82 + 32) = v80;
    *(unsigned char *)(v82 + 40) = 0;
    sub_100006918(v69, &qword_100065CF0);
    LOBYTE(v69) = sub_100053480();
    double v83 = v103;
    sub_100052FC0();
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v92 = v114;
    sub_100016A1C(v81, v114, &qword_100065CF8);
    uint64_t v93 = v92 + *(int *)(v110 + 36);
    *(unsigned char *)uint64_t v93 = v69;
    *(void *)(v93 + 8) = v85;
    *(void *)(v93 + 16) = v87;
    *(void *)(v93 + 24) = v89;
    *(void *)(v93 + 32) = v91;
    *(unsigned char *)(v93 + 40) = 0;
    sub_100006918(v81, &qword_100065CF8);
    uint64_t v94 = v118;
    sub_100016A1C(v92, v118, &qword_100065D00);
    uint64_t v95 = (double *)(v94 + *(int *)(v112 + 36));
    *uint64_t v95 = (v83 - v72) * 0.5;
    v95[1] = (v45 - a5) * 0.5;
    sub_100006918(v92, &qword_100065D00);
    sub_1000538E0();
    sub_100053050();
    uint64_t v96 = v117;
    sub_100016A1C(v94, v117, &qword_100065D08);
    uint64_t v97 = (_OWORD *)(v96 + *(int *)(v115 + 36));
    long long v98 = v123;
    *uint64_t v97 = v122;
    v97[1] = v98;
    v97[2] = v124;
    sub_100006918(v94, &qword_100065D08);
    uint64_t v99 = v116;
    sub_100016A1C(v96, v116, &qword_100065D10);
    uint64_t v100 = (double *)(v99 + *(int *)(v119 + 36));
    double *v100 = v104;
    v100[1] = 0.0;
    sub_100006918(v96, &qword_100065D10);
    sub_100045804(&qword_100065D28, &qword_100065D18, (void (*)(void))sub_100045714);
    uint64_t v44 = sub_100053830();
    swift_release();
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t result = sub_100053830();
    uint64_t v44 = result;
  }
  uint64_t *v120 = v44;
  return result;
}

uint64_t sub_100043EC0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v75 = a4;
  uint64_t v74 = a3;
  uint64_t v8 = type metadata accessor for WidgetAccentModifier(0);
  __chkstk_darwin(v8 - 8);
  uint64_t v70 = (uint64_t *)((char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_1000053FC(&qword_100065D68);
  __chkstk_darwin(v10 - 8);
  Swift::String v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1000053FC(&qword_100065D70);
  uint64_t v68 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v58 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1000053FC(&qword_100065D78) - 8;
  __chkstk_darwin(v50);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1000053FC(&qword_100065D80) - 8;
  __chkstk_darwin(v59);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1000053FC(&qword_100065D88) - 8;
  __chkstk_darwin(v67);
  uint64_t v66 = (uint64_t)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1000053FC(&qword_100065D90) - 8;
  uint64_t v19 = __chkstk_darwin(v73);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v71 = (uint64_t)&v49 - v22;
  sub_1000162D8(a1, a1[3]);
  uint64_t v69 = sub_100053A10();
  uint64_t v23 = type metadata accessor for StatusBadgeView();
  sub_1000538E0();
  sub_100053050();
  uint64_t v65 = v76;
  int v64 = v77;
  uint64_t v63 = v78;
  int v62 = v79;
  uint64_t v61 = v80;
  uint64_t v60 = v81;
  uint64_t v24 = *(void *)(a2 + *(int *)(v23 + 28));
  sub_1000162D8(a1, a1[3]);
  sub_100053A30();
  sub_100053890();
  sub_100053910();
  sub_100053900();
  sub_100053080();
  uint64_t v56 = v82;
  long long v57 = v83;
  uint64_t v26 = v84;
  uint64_t v25 = v85;
  sub_1000538E0();
  sub_100053050();
  uint64_t v55 = v86;
  char v27 = v87;
  uint64_t v54 = v88;
  int v53 = v89;
  uint64_t v52 = v90;
  uint64_t v51 = v91;
  sub_100053B60();
  uint64_t v28 = sub_100053B70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 0, 1, v28);
  uint64_t v29 = v58;
  sub_1000537C0();
  sub_100006918((uint64_t)v12, &qword_100065D68);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = (uint64_t)v70;
  *uint64_t v70 = KeyPath;
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  sub_100045938(v31, (uint64_t)&v15[*(int *)(v50 + 44)], type metadata accessor for WidgetAccentModifier);
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v15, v29, v72);
  uint64_t v32 = swift_getKeyPath();
  sub_100016A1C((uint64_t)v15, (uint64_t)v17, &qword_100065D78);
  uint64_t v33 = (uint64_t *)&v17[*(int *)(v59 + 44)];
  uint64_t v34 = v75;
  *uint64_t v33 = v32;
  v33[1] = v34;
  swift_retain();
  sub_100006918((uint64_t)v15, &qword_100065D78);
  sub_1000162D8(a1, a1[3]);
  uint64_t v35 = sub_100053A40();
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = v66;
  sub_100016A1C((uint64_t)v17, v66, &qword_100065D80);
  uint64_t v38 = (uint64_t *)(v37 + *(int *)(v67 + 44));
  *uint64_t v38 = v36;
  v38[1] = v35;
  sub_100006918((uint64_t)v17, &qword_100065D80);
  sub_1000162D8(a1, a1[3]);
  sub_100053A00();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  sub_100016A1C(v37, (uint64_t)v21, &qword_100065D88);
  uint64_t v43 = &v21[*(int *)(v73 + 44)];
  *(void *)uint64_t v43 = v40;
  *((void *)v43 + 1) = v42;
  sub_100006918(v37, &qword_100065D88);
  uint64_t v44 = v71;
  sub_100006AA8((uint64_t)v21, v71, &qword_100065D90);
  sub_100016A1C(v44, (uint64_t)v21, &qword_100065D90);
  *(void *)a5 = v69;
  *(_WORD *)(a5 + 8) = 256;
  *(void *)(a5 + 16) = 0x4010000000000000;
  *(unsigned char *)(a5 + 24) = 0;
  *(void *)(a5 + 32) = 0x3FE3333333333333;
  *(void *)(a5 + 40) = v65;
  *(unsigned char *)(a5 + 48) = v64;
  *(void *)(a5 + 56) = v63;
  *(unsigned char *)(a5 + 64) = v62;
  uint64_t v45 = v60;
  *(void *)(a5 + 72) = v61;
  *(void *)(a5 + 80) = v45;
  *(void *)(a5 + 88) = 0;
  *(void *)(a5 + 96) = v24;
  *(void *)(a5 + 104) = v56;
  *(_OWORD *)(a5 + 112) = v57;
  *(void *)(a5 + 128) = v26;
  *(void *)(a5 + 136) = v25;
  *(_WORD *)(a5 + 144) = 256;
  *(void *)(a5 + 152) = v55;
  *(unsigned char *)(a5 + 160) = v27;
  *(void *)(a5 + 168) = v54;
  *(unsigned char *)(a5 + 176) = v53;
  uint64_t v46 = v51;
  *(void *)(a5 + 184) = v52;
  *(void *)(a5 + 192) = v46;
  uint64_t v47 = sub_1000053FC(&qword_100065D98);
  sub_100016A1C((uint64_t)v21, a5 + *(int *)(v47 + 64), &qword_100065D90);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100006918(v44, &qword_100065D90);
  sub_100006918((uint64_t)v21, &qword_100065D90);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000446F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v3 = sub_1000053FC(&qword_100065C98);
  __chkstk_darwin(v3 - 8);
  int v53 = (uint64_t *)((char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000053FC(&qword_100065CA0);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  __chkstk_darwin(v5);
  uint64_t v52 = (uint64_t)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100052710();
  uint64_t v7 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v61 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100053330();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = *(void *)(sub_100053AC0() + 16);
  swift_bridgeObjectRelease();
  type metadata accessor for StatusBadgeView();
  sub_100024704((uint64_t)v12);
  char v13 = sub_100053320();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v13) {
    sub_100053980();
  }
  else {
    sub_100053940();
  }
  double v16 = v14;
  double v17 = v15;
  uint64_t v18 = *(void *)(sub_100053AC0() + 16);
  swift_bridgeObjectRelease();
  if (v18) {
    uint64_t v19 = sub_1000538D0();
  }
  else {
    uint64_t v19 = sub_1000538E0();
  }
  uint64_t v50 = v20;
  uint64_t v51 = v19;
  uint64_t v58 = v2;
  uint64_t v21 = sub_100053AC0();
  long long v57 = &v49;
  unsigned __int8 v77 = &_swiftEmptyArrayStorage;
  sub_100030504(0, 0, 0);
  uint64_t v22 = (uint64_t)v77;
  uint64_t v23 = *(void *)(v21 + 16);
  swift_bridgeObjectRetain();
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v63 = (uint64_t)&v71 + 8;
    uint64_t v59 = (uint64_t)v76 + 8;
    uint64_t v60 = v21;
    uint64_t v25 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v26 = v21 + 40 * v23 - 8;
    while (1)
    {
      sub_100016744(v26, (uint64_t)&v65 + 8);
      *(void *)&long long v71 = v24;
      sub_10001672C((long long *)((char *)&v65 + 8), v63);
      v76[0] = v71;
      v76[1] = v72;
      v76[2] = v73;
      if (__OFSUB__(v64, (void)v71)) {
        break;
      }
      double v27 = (double)(v64 - v71) * 6.0;
      sub_100016744(v59, (uint64_t)v70);
      uint64_t v28 = v61;
      sub_100052700();
      uint64_t v29 = sub_1000526F0();
      uint64_t v31 = v30;
      (*v25)(v28, v62);
      *((void *)&v68 + 1) = v29;
      uint64_t v69 = v31;
      sub_10001672C(v70, (uint64_t)&v65);
      *((double *)&v67 + 1) = v27;
      *(void *)&long long v68 = 0;
      uint64_t v75 = v69;
      long long v71 = v65;
      long long v72 = v66;
      long long v73 = v67;
      long long v74 = v68;
      sub_100006918((uint64_t)v76, &qword_100065CA8);
      uint64_t v22 = (uint64_t)v77;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100030504(0, *(void *)(v22 + 16) + 1, 1);
        uint64_t v22 = (uint64_t)v77;
      }
      unint64_t v33 = *(void *)(v22 + 16);
      unint64_t v32 = *(void *)(v22 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_100030504(v32 > 1, v33 + 1, 1);
        uint64_t v22 = (uint64_t)v77;
      }
      ++v24;
      *(void *)(v22 + 16) = v33 + 1;
      uint64_t v34 = v22 + 72 * v33;
      *(_OWORD *)(v34 + 32) = v71;
      long long v35 = v72;
      long long v36 = v73;
      long long v37 = v74;
      *(void *)(v34 + 96) = v75;
      *(_OWORD *)(v34 + 64) = v36;
      *(_OWORD *)(v34 + 80) = v37;
      *(_OWORD *)(v34 + 48) = v35;
      v26 -= 40;
      if (v23 == v24) {
        goto LABEL_17;
      }
    }
    __break(1u);
  }
LABEL_17:
  swift_bridgeObjectRelease_n();
  uint64_t v38 = v58;
  sub_100053AE0();
  if (*((void *)&v72 + 1))
  {
    sub_10001672C(&v71, (uint64_t)&v65);
    sub_1000162D8(&v65, *((uint64_t *)&v66 + 1));
    uint64_t v39 = sub_100053A60();
    swift_release();
    if (v39)
    {
      uint64_t v40 = (uint64_t)v53;
      uint64_t v41 = v50;
      *int v53 = v51;
      *(void *)(v40 + 8) = v41;
      uint64_t v42 = sub_1000053FC(&qword_100065CB0);
      sub_100044D3C(v22, v38, &v65, (char *)(v40 + *(int *)(v42 + 44)), 0.0, 6.0, 20.0, 6.0, v16, v17);
      swift_release();
      sub_1000538E0();
      sub_100053050();
      uint64_t v43 = v52;
      sub_100016A1C(v40, v52, &qword_100065C98);
      uint64_t v44 = v55;
      uint64_t v45 = (_OWORD *)(v43 + *(int *)(v55 + 36));
      long long v46 = v72;
      *uint64_t v45 = v71;
      v45[1] = v46;
      void v45[2] = v73;
      sub_100006918(v40, &qword_100065C98);
      uint64_t v47 = v56;
      sub_100006AA8(v43, v56, &qword_100065CA0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v47, 0, 1, v44);
      return sub_100010614((uint64_t)&v65);
    }
    swift_release();
    sub_100010614((uint64_t)&v65);
  }
  else
  {
    swift_release();
    sub_100006918((uint64_t)&v71, &qword_100065248);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56))(v56, 1, 1, v55);
}

uint64_t sub_100044D3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, char *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>)
{
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  uint64_t v18 = type metadata accessor for StatusBadgeView();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000053FC(&qword_100065CB8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v41 - v27;
  uint64_t v44 = a1;
  sub_100045164(a2, (uint64_t)v21);
  unint64_t v29 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v30 = (v20 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  sub_100045938((uint64_t)v21, v31 + v29, (uint64_t (*)(void))type metadata accessor for StatusBadgeView);
  unint64_t v32 = (double *)(v31 + v30);
  *unint64_t v32 = a5;
  v32[1] = a6;
  _OWORD v32[2] = a7;
  v32[3] = a8;
  unint64_t v33 = (double *)(v31 + ((v30 + 39) & 0xFFFFFFFFFFFFFFF8));
  *unint64_t v33 = a9;
  v33[1] = a10;
  swift_bridgeObjectRetain();
  sub_1000053FC(&qword_100065CC0);
  sub_100006BF0(&qword_100065CC8, &qword_100065CC0);
  sub_1000453F4();
  sub_100053880();
  uint64_t v34 = sub_1000538E0();
  sub_100043620(v42, v34, v35, &v44, a5, a6, a7, a8, 0.0, a9, a10);
  uint64_t v36 = v44;
  long long v37 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v37(v26, v28, v22);
  uint64_t v38 = v43;
  v37(v43, v26, v22);
  *(void *)&v38[*(int *)(sub_1000053FC(&qword_100065CD8) + 48)] = v36;
  uint64_t v39 = *(void (**)(char *, uint64_t))(v23 + 8);
  swift_retain();
  v39(v28, v22);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v39)(v26, v22);
}

uint64_t sub_1000450A8@<X0>(double *a1@<X0>, void *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  double v16 = a1[5];
  uint64_t v17 = sub_1000538D0();
  uint64_t result = sub_100043620(a1, v17, v18, &v20, a3, a4, a5, a6, v16, a7, a8);
  *a2 = v20;
  return result;
}

uint64_t sub_100045164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBadgeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000451C8()
{
  uint64_t v1 = (int *)(type metadata accessor for StatusBadgeView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);

  uint64_t v6 = v0 + v3 + v1[10];
  sub_1000053FC(&qword_100064768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100053330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_100045330@<X0>(double *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for StatusBadgeView() - 8);
  unint64_t v6 = (*(void *)(v5 + 64)
      + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  double v8 = *(double *)(v2 + v6);
  double v9 = *(double *)(v2 + v6 + 8);
  double v10 = *(double *)(v2 + v6 + 16);
  double v11 = *(double *)(v2 + v6 + 24);
  double v12 = *(double *)(v2 + v7);
  double v13 = *(double *)(v2 + v7 + 8);

  return sub_1000450A8(a1, a2, v8, v9, v10, v11, v12, v13);
}

unint64_t sub_1000453F4()
{
  unint64_t result = qword_100065CD0;
  if (!qword_100065CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065CD0);
  }
  return result;
}

uint64_t sub_100045448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100052A60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  double v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  double v10 = (char *)&v21[-1] - v9;
  double v11 = *(double *)(a1 + 40);
  double v12 = *(double *)(a1 + 48);
  double v13 = *(double *)(a2 + 40);
  double v14 = *(double *)(a2 + 48);
  sub_100045D50(a1, (uint64_t)v24);
  sub_100045D50(a2, (uint64_t)v23);
  if (v11 != v13 || v12 != v14)
  {
    sub_100045D88((uint64_t)v24);
    sub_100045D88((uint64_t)v23);
    sub_100045D50(a1, (uint64_t)v22);
    sub_100045D50(a2, (uint64_t)v21);
LABEL_14:
    char v18 = 0;
    goto LABEL_15;
  }
  sub_1000162D8(v24, v24[3]);
  sub_100052B40();
  sub_1000162D8(v23, v23[3]);
  sub_100052B40();
  sub_100045DB8(&qword_100065DD0);
  sub_100053DF0();
  sub_100053DF0();
  if (v22[0] == v21[0] && v22[1] == v21[1]) {
    char v16 = 1;
  }
  else {
    char v16 = sub_1000540C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v8, v4);
  v17(v10, v4);
  sub_100045D88((uint64_t)v24);
  sub_100045D88((uint64_t)v23);
  sub_100045D50(a1, (uint64_t)v22);
  sub_100045D50(a2, (uint64_t)v21);
  if ((v16 & 1) == 0) {
    goto LABEL_14;
  }
  if (v22[7] == v21[7] && v22[8] == v21[8]) {
    char v18 = 1;
  }
  else {
    char v18 = sub_1000540C0();
  }
LABEL_15:
  sub_100045D88((uint64_t)v22);
  sub_100045D88((uint64_t)v21);
  return v18 & 1;
}

uint64_t sub_100045714()
{
  return sub_100045804(&qword_100065D30, &qword_100065D10, (void (*)(void))sub_100045744);
}

uint64_t sub_100045744()
{
  return sub_100045804(&qword_100065D38, &qword_100065D08, (void (*)(void))sub_100045774);
}

uint64_t sub_100045774()
{
  return sub_100045804(&qword_100065D40, &qword_100065D00, (void (*)(void))sub_1000457A4);
}

uint64_t sub_1000457A4()
{
  return sub_100045804(&qword_100065D48, &qword_100065CF8, (void (*)(void))sub_1000457D4);
}

uint64_t sub_1000457D4()
{
  return sub_100045804(&qword_100065D50, &qword_100065CF0, (void (*)(void))sub_100045880);
}

uint64_t sub_100045804(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100045880()
{
  unint64_t result = qword_100065D58;
  if (!qword_100065D58)
  {
    sub_100005440(&qword_100065CE8);
    sub_100006BF0(&qword_100065D60, &qword_100065CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065D58);
  }
  return result;
}

CTFontRef sub_100045920()
{
  return CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 25.0, 0);
}

uint64_t sub_100045938(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t destroy for BadgeDefinition(uint64_t a1)
{
  sub_100010614(a1);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BadgeDefinition(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for BadgeDefinition(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for BadgeDefinition(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for BadgeDefinition(uint64_t a1, uint64_t a2)
{
  sub_100010614(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BadgeDefinition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BadgeDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BadgeDefinition()
{
  return &type metadata for BadgeDefinition;
}

unint64_t sub_100045BD8()
{
  unint64_t result = qword_100065DA0;
  if (!qword_100065DA0)
  {
    sub_100005440(&qword_100065DA8);
    sub_100045C4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065DA0);
  }
  return result;
}

unint64_t sub_100045C4C()
{
  unint64_t result = qword_100065DB0;
  if (!qword_100065DB0)
  {
    sub_100005440(&qword_100065CA0);
    sub_100006BF0(&qword_100065DB8, &qword_100065C98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065DB0);
  }
  return result;
}

unint64_t sub_100045CF0()
{
  unint64_t result = qword_100065DC0;
  if (!qword_100065DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065DC0);
  }
  return result;
}

void *sub_100045D44()
{
  return &protocol witness table for String;
}

uint64_t sub_100045D50(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100045D88(uint64_t a1)
{
  return a1;
}

uint64_t sub_100045DB8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100052A60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100045DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, char *a9@<X8>, uint64_t a10)
{
  int v44 = a7;
  int v45 = a8;
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  int v41 = a4;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v46 = a10;
  uint64_t v12 = sub_1000053FC(&qword_1000646E8);
  __chkstk_darwin(v12 - 8);
  double v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100053AF0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  char v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (int *)type metadata accessor for AvatarView();
  uint64_t v38 = v19[5];
  *(void *)&a9[v38] = 0;
  uint64_t v20 = &a9[v19[6]];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;
  uint64_t v21 = (uint64_t)&a9[v19[7]];
  uint64_t v22 = sub_100053AB0();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  uint64_t v37 = v21;
  v23(v21, 1, 1, v22);
  uint64_t v24 = v19[8];
  sub_100052BE0();
  *(void *)&a9[v24] = sub_100052BD0();
  uint64_t v25 = &a9[v19[12]];
  uint64_t KeyPath = swift_getKeyPath();
  *((void *)v25 + 1) = 0;
  *((void *)v25 + 2) = 0;
  *(void *)uint64_t v25 = KeyPath;
  *((_WORD *)v25 + 12) = 0;
  uint64_t v27 = v19[13];
  sub_100053950();
  *(void *)&a9[v27] = v28;
  unint64_t v29 = &a9[v19[14]];
  *(_OWORD *)unint64_t v29 = xmmword_100055C40;
  *((_OWORD *)v29 + 1) = xmmword_100055C50;
  unint64_t v30 = (uint64_t *)&a9[v19[15]];
  *unint64_t v30 = swift_getKeyPath();
  sub_1000053FC(&qword_100064D80);
  swift_storeEnumTagMultiPayload();
  sub_100016A1C(a1, (uint64_t)v14, &qword_1000646E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_100053960();
    sub_100006918(a1, &qword_1000646E8);
    sub_100006918((uint64_t)v14, &qword_1000646E8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(a9, v18, v15);
  }
  else
  {
    sub_100006918(a1, &qword_1000646E8);
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v31(v18, v14, v15);
    v31(a9, v18, v15);
  }
  uint64_t v32 = v38;

  *(void *)&a9[v32] = v39;
  *(void *)uint64_t v20 = v40;
  v20[8] = v41 & 1;
  sub_10004920C(v42, v37);
  swift_release();
  *(void *)&a9[v24] = v43;
  a9[v19[9]] = v44 & 1;
  a9[v19[10]] = v45 & 1;
  unint64_t v33 = &a9[v19[11]];
  uint64_t v34 = sub_100052710();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v33, v46, v34);
}

uint64_t EnvironmentValues.avatarSizeBinding.getter()
{
  sub_1000461D0();
  sub_1000532C0();
  return v1;
}

unint64_t sub_1000461D0()
{
  unint64_t result = qword_100065DF8;
  if (!qword_100065DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065DF8);
  }
  return result;
}

double sub_100046224@<D0>(uint64_t a1@<X8>)
{
  sub_1000461D0();
  sub_1000532C0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100046284()
{
  return sub_1000532D0();
}

uint64_t EnvironmentValues.avatarSizeBinding.setter()
{
  return sub_1000532D0();
}

uint64_t sub_100046344()
{
  return sub_100053860();
}

uint64_t sub_10004638C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100064560 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_100065DE0;
  uint64_t v3 = qword_100065DE8;
  char v4 = byte_100065DF0;
  *(void *)a1 = qword_100065DD8;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  swift_retain();

  return swift_retain();
}

void (*EnvironmentValues.avatarSizeBinding.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[8] = v1;
  v3[9] = sub_1000461D0();
  sub_1000532C0();
  uint64_t v4 = v3[6];
  char v5 = *((unsigned char *)v3 + 56);
  *(_OWORD *)uint64_t v3 = *((_OWORD *)v3 + 2);
  v3[2] = v4;
  *((unsigned char *)v3 + 24) = v5;
  return sub_1000464AC;
}

void sub_1000464AC(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[1];
  v2[4] = **a1;
  uint64_t v4 = v2[2];
  char v5 = *((unsigned char *)v2 + 24);
  v2[5] = v3;
  v2[6] = v4;
  *((unsigned char *)v2 + 56) = v5;
  if (a2)
  {
    swift_retain();
    swift_retain();
    sub_1000532D0();
    swift_release();
    swift_release();
  }
  else
  {
    sub_1000532D0();
  }

  free(v2);
}

ValueMetadata *type metadata accessor for AvatarSizeBindingEnvironmentKey()
{
  return &type metadata for AvatarSizeBindingEnvironmentKey;
}

uint64_t type metadata accessor for AvatarView()
{
  uint64_t result = qword_100065E58;
  if (!qword_100065E58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000465C8(double a1)
{
  uint64_t v2 = sub_100052FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  double v8 = (char *)&v22 - v7;
  uint64_t v9 = sub_1000053FC(&qword_100066058);
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  double v14 = (char *)&v22 - v13;
  uint64_t v28 = 0x3FF0000000000000;
  double v29 = 0.0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  char v27 = 1;
  sub_10004B78C();
  sub_100052A80();
  uint64_t v28 = 0x3FD3333333333333;
  double v29 = 0.0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  char v27 = 1;
  sub_100052A80();
  type metadata accessor for AvatarView();
  sub_1000253A4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for ColorScheme.dark(_:), v2);
  char v15 = sub_100052FD0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v6, v2);
  v16(v8, v2);
  if (v15)
  {
    uint64_t v17 = v24;
    char v18 = *(void (**)(char *, uint64_t))(v23 + 8);
    v18(v12, v24);
    return ((uint64_t (*)(char *, uint64_t))v18)(v14, v17);
  }
  else
  {
    double v29 = a1;
    uint64_t v20 = v24;
    sub_100052A90();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v23 + 8);
    v21(v12, v20);
    return ((uint64_t (*)(char *, uint64_t))v21)(v14, v20);
  }
}

double sub_1000468D4(double a1)
{
  uint64_t v2 = sub_100052FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  double v8 = (char *)&v21 - v7;
  uint64_t v21 = sub_1000053FC(&qword_100066058);
  uint64_t v9 = *(void *)(v21 - 8);
  uint64_t v10 = __chkstk_darwin(v21);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  double v14 = (char *)&v21 - v13;
  uint64_t v25 = 0x3FF0000000000000;
  double v26 = 0.0;
  double v22 = 0.0;
  uint64_t v23 = 0;
  char v24 = 1;
  sub_10004B78C();
  sub_100052A80();
  type metadata accessor for AvatarView();
  sub_1000253A4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for ColorScheme.dark(_:), v2);
  char v15 = sub_100052FD0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v6, v2);
  v16(v8, v2);
  if (v15)
  {
    double v26 = 0.75;
    uint64_t v17 = 0x3FE4CCCCCCCCCCCDLL;
  }
  else
  {
    double v26 = 0.6;
    uint64_t v17 = 0x3FE199999999999ALL;
  }
  uint64_t v25 = v17;
  double v22 = 0.0;
  uint64_t v23 = 0;
  char v24 = 1;
  sub_100052A80();
  double v26 = a1;
  uint64_t v18 = v21;
  sub_100052A90();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v12, v18);
  v19(v14, v18);
  return v22;
}

uint64_t sub_100046BD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000053FC(&qword_100066030);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v45[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100052E70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100053AD0();
  if (!*((void *)&v56 + 1))
  {
    sub_100006918((uint64_t)&v55, &qword_1000651F0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_6;
  }
  sub_1000053FC(&qword_100066038);
  int v9 = swift_dynamicCast();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v4, v9 ^ 1u, 1, v5);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_6:
    sub_100006918((uint64_t)v4, &qword_100066030);
LABEL_7:
    long long v52 = 0u;
    long long v53 = 0u;
    char v54 = 1;
    uint64_t result = sub_1000533D0();
    long long v43 = v55;
    long long v44 = v56;
    char v41 = v57;
    goto LABEL_8;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_100052CB0();
  sub_100052CA0();
  char v10 = sub_100052C90();
  swift_release();
  if ((v10 & 1) == 0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_7;
  }
  *(void *)&long long v55 = sub_100052E60();
  *((void *)&v55 + 1) = v11;
  sub_1000068C4();
  uint64_t v12 = sub_1000535E0();
  uint64_t v14 = v13;
  uint64_t v51 = v8;
  char v16 = v15 & 1;
  sub_100053730();
  *(void *)&long long v49 = sub_100053590();
  uint64_t v48 = v17;
  char v19 = v18;
  *(void *)&long long v50 = v20;
  swift_release();
  int v46 = v19 & 1;
  sub_10002A6A8(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_100053510();
  uint64_t v21 = v49;
  uint64_t v22 = v48;
  uint64_t v23 = sub_1000535C0();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v47 = v28;
  swift_release();
  sub_10002A6A8(v21, v22, v46);
  swift_bridgeObjectRelease();
  *(void *)&long long v49 = sub_1000535B0();
  uint64_t v30 = v29;
  LODWORD(v48) = v31 & 1;
  sub_10002A6A8(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  sub_100053710();
  uint64_t v32 = v49;
  uint64_t v33 = sub_1000535D0();
  *(void *)&long long v50 = v34;
  LOBYTE(v22) = v35;
  swift_release();
  LOBYTE(v12) = v22 & 1;
  sub_10002A6A8(v32, v30, v48);
  swift_bridgeObjectRelease();
  sub_100053700();
  uint64_t v36 = v50;
  *(void *)&long long v49 = sub_1000535D0();
  uint64_t v38 = v37;
  LOBYTE(v30) = v39;
  uint64_t v48 = v40;
  swift_release();
  sub_10002A6A8(v33, v36, v12);
  swift_bridgeObjectRelease();
  *(void *)&long long v52 = v49;
  *((void *)&v52 + 1) = v38;
  *(void *)&long long v53 = v30 & 1;
  *((void *)&v53 + 1) = v48;
  char v54 = 0;
  sub_1000533D0();
  long long v49 = v56;
  long long v50 = v55;
  char v41 = v57;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v51, v5);
  long long v44 = v49;
  long long v43 = v50;
LABEL_8:
  *(_OWORD *)a1 = v43;
  *(_OWORD *)(a1 + 16) = v44;
  *(unsigned char *)(a1 + 32) = v41;
  return result;
}

double sub_1000470CC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AvatarView();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v3);
  sub_10004B5D0(v1, (uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AvatarView);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  sub_10004AD1C((uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  double v9 = *(double *)(v1 + *(int *)(v4 + 60));
  uint64_t v10 = sub_1000538E0();
  sub_10004CC64(0.0, 1, 0.0, 1, v9, 0, 0.0, 1, (uint64_t)v25, 0.0, 1, 0.0, 1, v10, v11, (uint64_t)sub_10004AD80, v8, 0x3FF0000000000000, 0,
    0);
  swift_release();
  sub_1000538E0();
  sub_100053050();
  uint64_t v12 = v20[2];
  uint64_t v13 = v22;
  char v27 = v21;
  char v26 = v23;
  long long v14 = v25[5];
  long long v15 = v25[7];
  long long v16 = v25[8];
  *(_OWORD *)(a1 + 96) = v25[6];
  *(_OWORD *)(a1 + 112) = v15;
  *(_OWORD *)(a1 + 128) = v16;
  long long v17 = v25[3];
  *(_OWORD *)(a1 + 32) = v25[2];
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = v25[4];
  *(_OWORD *)(a1 + 80) = v14;
  long long v18 = v25[1];
  *(_OWORD *)a1 = v25[0];
  *(_OWORD *)(a1 + 16) = v18;
  *(void *)(a1 + 144) = v12;
  *(unsigned char *)(a1 + 152) = v27;
  *(void *)(a1 + 160) = v13;
  *(unsigned char *)(a1 + 168) = v26;
  double result = *(double *)&v24;
  *(_OWORD *)(a1 + 176) = v24;
  return result;
}

uint64_t sub_1000472FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AvatarView();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v6);
  uint64_t v10 = sub_1000053FC(&qword_100065EC0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_1000053FC(&qword_100065EC8);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  long long v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100053060();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  *uint64_t v12 = sub_1000538B0();
  v12[1] = v21;
  uint64_t v22 = sub_1000053FC(&qword_100065ED0);
  sub_10004758C(a2, a1, (uint64_t)v12 + *(int *)(v22 + 44));
  sub_10004B5D0(a2, (uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AvatarView);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = swift_allocObject();
  sub_10004AD1C((uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  uint64_t v25 = (void *)(v24 + ((v9 + v23 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v25 = v18;
  v25[1] = v20;
  sub_100016A1C((uint64_t)v12, (uint64_t)v16, &qword_100065EC0);
  char v26 = (uint64_t (**)())&v16[*(int *)(v14 + 44)];
  char *v26 = sub_10004B058;
  v26[1] = (uint64_t (*)())v24;
  void v26[2] = 0;
  v26[3] = 0;
  sub_100006918((uint64_t)v12, &qword_100065EC0);
  char v27 = (double *)(a2 + *(int *)(v7 + 64));
  double v28 = -v27[1] - v27[3];
  double v29 = -*v27;
  sub_100016A1C((uint64_t)v16, a3, &qword_100065EC8);
  uint64_t v30 = (double *)(a3 + *(int *)(sub_1000053FC(&qword_100065ED8) + 36));
  *uint64_t v30 = v28;
  v30[1] = v29;
  return sub_100006918((uint64_t)v16, &qword_100065EC8);
}

uint64_t sub_10004758C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&long long v280 = a2;
  uint64_t v278 = a3;
  uint64_t v4 = sub_1000053FC(&qword_100065EE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v220 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v247 = sub_100052A60();
  uint64_t v243 = *(void *)(v247 - 8);
  __chkstk_darwin(v247);
  uint64_t v241 = (char *)&v220 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v239 = type metadata accessor for StatusBadgeView();
  __chkstk_darwin(v239);
  v240 = (char *)&v220 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v248 = sub_1000053FC(&qword_100065EF0);
  __chkstk_darwin(v248);
  uint64_t v245 = (uint64_t)&v220 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_100065EF8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v246 = (char *)&v220 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v244 = (char *)&v220 - v15;
  __chkstk_darwin(v14);
  uint64_t v242 = (uint64_t)&v220 - v16;
  uint64_t v17 = sub_1000053FC(&qword_100065F00);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v220 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v220 - v21;
  uint64_t v23 = sub_100052FE0();
  uint64_t v265 = *(void *)(v23 - 8);
  uint64_t v266 = v23;
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v264 = (char *)&v220 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v263 = (uint64_t)&v220 - v26;
  uint64_t v274 = sub_1000053FC(&qword_100065F08);
  __chkstk_darwin(v274);
  v268 = (char *)&v220 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100053310();
  uint64_t v237 = *(void *)(v28 - 8);
  uint64_t v238 = v28;
  __chkstk_darwin(v28);
  uint64_t v236 = (char *)&v220 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v227 = sub_1000053FC(&qword_100065F10);
  __chkstk_darwin(v227);
  uint64_t v232 = (uint64_t)&v220 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000537A0();
  uint64_t v224 = *(void *)(v31 - 8);
  uint64_t v225 = v31;
  __chkstk_darwin(v31);
  uint64_t v223 = (char *)&v220 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v226 = sub_1000053FC(&qword_100065F18);
  __chkstk_darwin(v226);
  v229 = (char *)&v220 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v231 = sub_1000053FC(&qword_100065F20);
  __chkstk_darwin(v231);
  uint64_t v228 = (uint64_t)&v220 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v272 = sub_1000053FC(&qword_100065F28);
  __chkstk_darwin(v272);
  v233 = (char *)&v220 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v273 = sub_1000053FC(&qword_100065F30);
  uint64_t v235 = *(void *)(v273 - 8);
  uint64_t v36 = __chkstk_darwin(v273);
  v230 = (char *)&v220 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v234 = (char *)&v220 - v38;
  uint64_t v39 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v39 - 8);
  uint64_t v271 = (uint64_t)&v220 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100053AB0();
  uint64_t v275 = *(void *)(v41 - 8);
  uint64_t v276 = v41;
  __chkstk_darwin(v41);
  v267 = (char *)&v220 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000053FC(&qword_100065F38);
  uint64_t v44 = __chkstk_darwin(v43 - 8);
  uint64_t v269 = (char *)&v220 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v44);
  uint64_t v277 = (char *)&v220 - v46;
  uint64_t v47 = (int *)type metadata accessor for AvatarView();
  uint64_t v48 = __chkstk_darwin(v47);
  long long v50 = (char *)&v220 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v51 = *(unsigned char *)(a1 + *(int *)(v48 + 24) + 8);
  uint64_t v281 = a1;
  sub_10004B5D0(a1, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for AvatarView);
  if (v51)
  {
    int v52 = v50[v47[10]];
    sub_10004B638((uint64_t)v50, (uint64_t (*)(void))type metadata accessor for AvatarView);
    if (v52 != 1)
    {
      uint64_t v53 = sub_1000053FC(&qword_100065F40);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v278, 1, 1, v53);
    }
  }
  else
  {
    sub_10004B638((uint64_t)v50, (uint64_t (*)(void))type metadata accessor for AvatarView);
  }
  v259 = v22;
  uint64_t v260 = v11;
  uint64_t v270 = v10;
  uint64_t v261 = v20;
  uint64_t v262 = v6;
  uint64_t v279 = sub_100053720();
  sub_100053060();
  long long v55 = (double *)(v281 + v47[14]);
  sub_100053060();
  uint64_t v221 = v55;
  sub_1000538E0();
  sub_100053050();
  LOBYTE(v55) = v328;
  uint64_t v257 = v329;
  uint64_t v258 = v327;
  char v56 = v330;
  uint64_t v255 = v332;
  uint64_t v256 = v331;
  int v254 = sub_100053460();
  sub_100052FC0();
  uint64_t v252 = v58;
  uint64_t v253 = v57;
  uint64_t v250 = v60;
  uint64_t v251 = v59;
  char v61 = sub_100053480();
  sub_100052FC0();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v249 = v66;
  uint64_t v68 = v67;
  char v310 = (char)v55;
  char v309 = v56;
  char v308 = 0;
  char v307 = 0;
  LOBYTE(v55) = sub_100053440();
  sub_100052FC0();
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v76 = v75;
  char v77 = v310;
  char v78 = v309;
  char v79 = v308;
  char v80 = v307;
  char v311 = 0;
  char v81 = sub_100053450();
  sub_100052FC0();
  *(void *)&long long v312 = v279;
  WORD4(v312) = 256;
  *(void *)&long long v313 = v258;
  *(void *)&long long v314 = v257;
  BYTE8(v314) = v78;
  *(void *)&long long v315 = v256;
  *((void *)&v315 + 1) = v255;
  LOBYTE(v316) = v254;
  *((void *)&v316 + 1) = v253;
  *(void *)&long long v317 = v252;
  *((void *)&v317 + 1) = v251;
  *(void *)&long long v318 = v250;
  BYTE8(v318) = v79;
  LOBYTE(v319) = v61;
  *((void *)&v319 + 1) = v63;
  *(void *)&long long v320 = v65;
  *((void *)&v320 + 1) = v249;
  *(void *)&long long v321 = v68;
  BYTE8(v321) = v80;
  LOBYTE(v322) = (_BYTE)v55;
  *((void *)&v322 + 1) = v70;
  *(void *)&long long v323 = v72;
  *((void *)&v323 + 1) = v74;
  *(void *)&long long v324 = v76;
  BYTE8(v324) = v311;
  LOBYTE(v325) = v81;
  *((void *)&v325 + 1) = v82;
  *(void *)&v326[0] = v83;
  *((void *)&v326[0] + 1) = v84;
  *(void *)&v326[1] = v85;
  BYTE8(v326[1]) = 0;
  uint64_t v86 = v281 + v47[7];
  BYTE8(v313) = v77;
  uint64_t v87 = v271;
  sub_100016A1C(v86, v271, &qword_1000646E0);
  uint64_t v89 = v275;
  uint64_t v88 = v276;
  int v90 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v275 + 48))(v87, 1, v276);
  uint64_t v222 = v47;
  if (v90 == 1)
  {
    sub_100006918(v87, &qword_1000646E0);
LABEL_16:
    uint64_t v158 = sub_1000538D0();
    uint64_t v276 = v159;
    uint64_t v160 = v263;
    sub_1000253A4(v263);
    uint64_t v161 = v264;
    uint64_t v162 = v265;
    uint64_t v163 = v266;
    (*(void (**)(char *, void, uint64_t))(v265 + 104))(v264, enum case for ColorScheme.dark(_:), v266);
    char v164 = sub_100052FD0();
    uint64_t v165 = *(void (**)(char *, uint64_t))(v162 + 8);
    v165(v161, v163);
    v165((char *)v160, v163);
    uint64_t v157 = v270;
    if (v164)
    {
      uint64_t v166 = 0x3FC3333333333333;
      uint64_t v167 = sub_100053730();
    }
    else
    {
      uint64_t v166 = 0x3FAEB851EB851EB8;
      uint64_t v167 = sub_100053710();
    }
    uint64_t v168 = v167;
    uint64_t v169 = v268;
    uint64_t v170 = v276;
    char v171 = sub_100053430();
    sub_100053060();
    sub_100053060();
    sub_1000538E0();
    sub_100053050();
    long long v305 = v325;
    v306[0] = v326[0];
    *(_OWORD *)((char *)v306 + 9) = *(_OWORD *)((char *)v326 + 9);
    long long v301 = v321;
    long long v302 = v322;
    long long v303 = v323;
    long long v304 = v324;
    long long v297 = v317;
    long long v298 = v318;
    long long v299 = v319;
    long long v300 = v320;
    long long v292 = v312;
    long long v293 = v313;
    long long v294 = v314;
    long long v295 = v315;
    long long v296 = v316;
    long long v172 = v325;
    long long v173 = v306[0];
    long long v174 = v323;
    *((_OWORD *)v169 + 12) = v324;
    *((_OWORD *)v169 + 13) = v172;
    long long v175 = v306[1];
    *((_OWORD *)v169 + 14) = v173;
    *((_OWORD *)v169 + 15) = v175;
    long long v176 = v301;
    long long v177 = v302;
    long long v178 = v299;
    *((_OWORD *)v169 + 8) = v300;
    *((_OWORD *)v169 + 9) = v176;
    *((_OWORD *)v169 + 10) = v177;
    *((_OWORD *)v169 + 11) = v174;
    long long v179 = v297;
    long long v180 = v298;
    long long v181 = v295;
    *((_OWORD *)v169 + 4) = v296;
    *((_OWORD *)v169 + 5) = v179;
    uint64_t v182 = v333;
    char v183 = v334;
    uint64_t v184 = v335;
    char v185 = v336;
    LOBYTE(v286[0]) = v334;
    LOBYTE(v284[0]) = v336;
    *((_OWORD *)v169 + 6) = v180;
    *((_OWORD *)v169 + 7) = v178;
    long long v186 = v293;
    *(_OWORD *)uint64_t v169 = v292;
    *((_OWORD *)v169 + 1) = v186;
    *((_OWORD *)v169 + 2) = v294;
    *((_OWORD *)v169 + 3) = v181;
    *((void *)v169 + 32) = v168;
    v169[264] = v171;
    *((void *)v169 + 34) = v166;
    *((void *)v169 + 35) = v182;
    v169[288] = v183;
    *((void *)v169 + 37) = v184;
    v169[304] = v185;
    *(_OWORD *)(v169 + 312) = v337;
    *((_WORD *)v169 + 164) = 256;
    *((void *)v169 + 42) = v158;
    *((void *)v169 + 43) = v170;
    swift_storeEnumTagMultiPayload();
    sub_10004B0E8((uint64_t)&v312);
    sub_1000053FC(&qword_100065F48);
    unint64_t v187 = sub_10004B114();
    *(void *)&long long v288 = v272;
    *((void *)&v288 + 1) = v187;
    swift_getOpaqueTypeConformance2();
    sub_10004B4FC();
    uint64_t v156 = (uint64_t)v277;
    sub_1000533D0();
    goto LABEL_20;
  }
  uint64_t v91 = v267;
  (*(void (**)(char *, uint64_t, uint64_t))(v89 + 32))(v267, v87, v88);
  uint64_t v92 = sub_100053AA0();
  if (!v92)
  {
    (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v88);
    goto LABEL_16;
  }
  uint64_t v93 = v92;
  double v94 = COERCE_DOUBLE(sub_100053A80());
  if (v95) {
    double v96 = 0.0;
  }
  else {
    double v96 = v94;
  }
  double v97 = COERCE_DOUBLE(sub_100053A90());
  LODWORD(v263) = v98;
  double v99 = 2.1 - v97;
  sub_1000465C8(v96);
  uint64_t v101 = v100;
  uint64_t v102 = sub_1000538D0();
  uint64_t v265 = v103;
  uint64_t v266 = v102;
  uint64_t v105 = v223;
  uint64_t v104 = v224;
  uint64_t v106 = v225;
  (*(void (**)(char *, void, uint64_t))(v224 + 104))(v223, enum case for Image.ResizingMode.stretch(_:), v225);
  uint64_t v271 = v93;
  uint64_t v264 = (char *)sub_1000537D0();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v106);
  uint64_t v107 = v280;
  sub_100053060();
  sub_100053060();
  sub_1000538E0();
  sub_100053050();
  char v108 = v334;
  uint64_t v256 = v333;
  uint64_t v257 = v335;
  char v109 = v336;
  if (v263) {
    double v110 = 2.1;
  }
  else {
    double v110 = v99;
  }
  uint64_t v263 = *((void *)&v337 + 1);
  uint64_t v258 = v337;
  sub_100053920();
  uint64_t v112 = v111;
  uint64_t v114 = v113;
  char v287 = v108;
  unsigned __int8 v285 = v109;
  char v283 = 1;
  double v115 = sub_1000468D4(v96);
  long long v305 = v325;
  v306[0] = v326[0];
  *(_OWORD *)((char *)v306 + 9) = *(_OWORD *)((char *)v326 + 9);
  long long v301 = v321;
  long long v302 = v322;
  long long v303 = v323;
  long long v304 = v324;
  long long v297 = v317;
  long long v298 = v318;
  long long v299 = v319;
  long long v300 = v320;
  long long v292 = v312;
  long long v293 = v313;
  long long v294 = v314;
  char v116 = v287;
  LODWORD(v255) = v285;
  char v117 = v283;
  long long v295 = v315;
  long long v296 = v316;
  sub_10004B0E8((uint64_t)&v312);
  uint64_t v118 = sub_1000538D0();
  uint64_t v120 = v119;
  uint64_t v121 = v232;
  sub_100048D04(v107, v232);
  long long v122 = (uint64_t *)(v121 + *(int *)(v227 + 36));
  *long long v122 = v118;
  v122[1] = v120;
  uint64_t v123 = (uint64_t)v229;
  sub_100016A1C(v121, (uint64_t)&v229[*(int *)(v226 + 36)], &qword_100065F10);
  long long v124 = v305;
  long long v125 = v306[0];
  long long v126 = v303;
  *(_OWORD *)(v123 + 192) = v304;
  *(_OWORD *)(v123 + 208) = v124;
  long long v127 = v306[1];
  *(_OWORD *)(v123 + 224) = v125;
  *(_OWORD *)(v123 + 240) = v127;
  long long v128 = v301;
  long long v129 = v302;
  long long v130 = v299;
  *(_OWORD *)(v123 + 128) = v300;
  *(_OWORD *)(v123 + 144) = v128;
  *(_OWORD *)(v123 + 160) = v129;
  *(_OWORD *)(v123 + 176) = v126;
  long long v131 = v297;
  long long v132 = v298;
  long long v133 = v295;
  *(_OWORD *)(v123 + 64) = v296;
  *(_OWORD *)(v123 + 80) = v131;
  *(_OWORD *)(v123 + 96) = v132;
  *(_OWORD *)(v123 + 112) = v130;
  long long v134 = v293;
  *(_OWORD *)uint64_t v123 = v292;
  *(_OWORD *)(v123 + 16) = v134;
  *(_OWORD *)(v123 + 32) = v294;
  *(_OWORD *)(v123 + 48) = v133;
  uint64_t v135 = v256;
  *(void *)(v123 + 256) = v264;
  *(void *)(v123 + 264) = v135;
  *(unsigned char *)(v123 + 272) = v116;
  *(_DWORD *)(v123 + 273) = v286[0];
  *(_DWORD *)(v123 + 276) = *(_DWORD *)((char *)v286 + 3);
  *(void *)(v123 + 280) = v257;
  *(unsigned char *)(v123 + 288) = v255;
  *(_DWORD *)(v123 + 289) = v284[0];
  *(_DWORD *)(v123 + 292) = *(_DWORD *)((char *)v284 + 3);
  uint64_t v136 = v263;
  *(void *)(v123 + 296) = v258;
  *(void *)(v123 + 304) = v136;
  *(void *)(v123 + 312) = 0;
  *(unsigned char *)(v123 + 320) = v117;
  *(_WORD *)(v123 + 321) = 0;
  *(unsigned char *)(v123 + 323) = 1;
  *(void *)(v123 + 328) = v101;
  *(double *)(v123 + 336) = v110;
  *(void *)(v123 + 344) = 0x4020000000000000;
  *(unsigned char *)(v123 + 352) = 0;
  *(_DWORD *)(v123 + 356) = *(_DWORD *)&v282[3];
  *(_DWORD *)(v123 + 353) = *(_DWORD *)v282;
  *(void *)(v123 + 360) = 0x3FEB333333333333;
  *(void *)(v123 + 368) = 0x3FEB333333333333;
  *(void *)(v123 + 376) = v112;
  *(void *)(v123 + 384) = v114;
  *(double *)(v123 + 392) = v115;
  *(_OWORD *)(v123 + 400) = xmmword_100055C60;
  uint64_t v137 = v265;
  *(void *)(v123 + 416) = v266;
  *(void *)(v123 + 424) = v137;
  sub_100006918(v121, &qword_100065F10);
  uint64_t v138 = sub_1000538A0();
  uint64_t v140 = v139;
  sub_100046BD0((uint64_t)&v288);
  long long v280 = v288;
  uint64_t v141 = v289;
  uint64_t v142 = v290;
  char v143 = v291;
  uint64_t v144 = v228;
  sub_100016A1C(v123, v228, &qword_100065F18);
  uint64_t v145 = v144 + *(int *)(v231 + 36);
  *(_OWORD *)uint64_t v145 = v280;
  *(void *)(v145 + 16) = v141;
  *(void *)(v145 + 24) = v142;
  *(unsigned char *)(v145 + 32) = v143;
  *(void *)(v145 + 40) = v138;
  *(void *)(v145 + 48) = v140;
  sub_100006918(v123, &qword_100065F18);
  sub_10004B1C0();
  uint64_t v146 = (uint64_t)v233;
  sub_1000536A0();
  sub_100006918(v144, &qword_100065F20);
  uint64_t v148 = v236;
  uint64_t v147 = v237;
  uint64_t v149 = v238;
  (*(void (**)(char *, void, uint64_t))(v237 + 104))(v236, enum case for ColorRenderingMode.nonLinear(_:), v238);
  unint64_t v150 = sub_10004B114();
  uint64_t v151 = v230;
  uint64_t v152 = v272;
  sub_100053660();
  (*(void (**)(char *, uint64_t))(v147 + 8))(v148, v149);
  sub_100006918(v146, &qword_100065F28);
  uint64_t v154 = v234;
  uint64_t v153 = v235;
  uint64_t v155 = v273;
  (*(void (**)(char *, char *, uint64_t))(v235 + 32))(v234, v151, v273);
  (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v268, v154, v155);
  swift_storeEnumTagMultiPayload();
  sub_1000053FC(&qword_100065F48);
  *(void *)&long long v288 = v152;
  *((void *)&v288 + 1) = v150;
  swift_getOpaqueTypeConformance2();
  sub_10004B4FC();
  uint64_t v156 = (uint64_t)v277;
  sub_1000533D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v153 + 8))(v154, v155);
  (*(void (**)(char *, uint64_t))(v275 + 8))(v267, v276);
  uint64_t v157 = v270;
LABEL_20:
  sub_100053AE0();
  uint64_t v189 = (uint64_t)v259;
  uint64_t v188 = v260;
  if (v290)
  {
    sub_10001672C(&v288, (uint64_t)&v292);
    sub_1000162D8(&v292, *((uint64_t *)&v293 + 1));
    if ((sub_100053A50() & 1) == 0)
    {
      uint64_t v191 = sub_100053AF0();
      uint64_t v192 = (uint64_t)v240;
      uint64_t v193 = v281;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v191 - 8) + 16))(v240, v281, v191);
      CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 25.0, 0);
      uint64_t v195 = (int *)v239;
      *(void *)(v192 + *(int *)(v239 + 20)) = UIFontForLanguage;
      *(void *)(v192 + v195[6]) = 0x4000000000000000;
      *(void *)(v192 + v195[7]) = 0x4010000000000000;
      uint64_t v196 = (uint64_t *)(v192 + v195[8]);
      *uint64_t v196 = swift_getKeyPath();
      sub_1000053FC(&qword_100064768);
      swift_storeEnumTagMultiPayload();
      double v197 = 0.0;
      if (*(unsigned char *)(v193 + v222[9])) {
        double v197 = 2.0;
      }
      double v198 = v197 - v221[1] - v221[3];
      double v199 = -v197 - *v221;
      uint64_t v200 = v245;
      sub_10004B5D0(v192, v245, (uint64_t (*)(void))type metadata accessor for StatusBadgeView);
      uint64_t v201 = (double *)(v200 + *(int *)(v248 + 36));
      *uint64_t v201 = v198;
      v201[1] = v199;
      sub_10004B638(v192, (uint64_t (*)(void))type metadata accessor for StatusBadgeView);
      sub_1000162D8(&v292, *((uint64_t *)&v293 + 1));
      char v202 = v241;
      sub_100052B40();
      uint64_t v203 = sub_100052A50();
      uint64_t v205 = v204;
      (*(void (**)(char *, uint64_t))(v243 + 8))(v202, v247);
      *(void *)&long long v288 = v203;
      *((void *)&v288 + 1) = v205;
      sub_1000068C4();
      uint64_t v206 = sub_1000535E0();
      uint64_t v208 = v207;
      char v210 = v209 & 1;
      sub_10004B698();
      uint64_t v211 = (uint64_t)v246;
      sub_100053680();
      sub_10002A6A8(v206, v208, v210);
      swift_bridgeObjectRelease();
      uint64_t v212 = v200;
      uint64_t v156 = (uint64_t)v277;
      sub_100006918(v212, &qword_100065EF0);
      sub_1000529F0();
      uint64_t v213 = (uint64_t)v244;
      uint64_t v214 = v270;
      sub_100053090();
      swift_bridgeObjectRelease();
      sub_100006918(v211, &qword_100065EF8);
      uint64_t v215 = v242;
      sub_100006AA8(v213, v242, &qword_100065EF8);
      sub_100006AA8(v215, v189, &qword_100065EF8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v188 + 56))(v189, 0, 1, v214);
      sub_100010614((uint64_t)&v292);
      uint64_t v190 = (uint64_t)v269;
      goto LABEL_28;
    }
    sub_100010614((uint64_t)&v292);
  }
  else
  {
    sub_100006918((uint64_t)&v288, &qword_100065248);
  }
  uint64_t v190 = (uint64_t)v269;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 56))(v189, 1, 1, v157);
LABEL_28:
  sub_100016A1C(v156, v190, &qword_100065F38);
  uint64_t v216 = (uint64_t)v261;
  sub_100016A1C(v189, (uint64_t)v261, &qword_100065F00);
  uint64_t v217 = (uint64_t)v262;
  sub_100016A1C(v190, (uint64_t)v262, &qword_100065F38);
  uint64_t v218 = sub_1000053FC(&qword_100066018);
  sub_100016A1C(v216, v217 + *(int *)(v218 + 48), &qword_100065F00);
  swift_release();
  sub_100006918(v189, &qword_100065F00);
  sub_100006918(v156, &qword_100065F38);
  sub_100006918(v216, &qword_100065F00);
  sub_100006918(v190, &qword_100065F38);
  uint64_t v219 = sub_1000053FC(&qword_100065F40);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v219 - 8) + 56))(v217, 0, 1, v219);
  return sub_100006AA8(v217, v278, &qword_100065EE8);
}

uint64_t sub_100048D04@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v2 = sub_1000053FC(&qword_100065D68);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000537A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000053FC(&qword_100065D70);
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000053FC(&qword_100066040);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000053FC(&qword_100066048);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v5);
  sub_1000537D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100053B60();
  uint64_t v20 = sub_100053B70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 0, 1, v20);
  sub_1000537C0();
  swift_release();
  sub_100006918((uint64_t)v4, &qword_100065D68);
  uint64_t v22 = v28;
  uint64_t v21 = v29;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v15, v11, v29);
  uint64_t v23 = &v15[*(int *)(v13 + 44)];
  *(void *)uint64_t v23 = 0;
  *((_WORD *)v23 + 4) = 1;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v21);
  sub_100053060();
  sub_100053060();
  sub_1000538E0();
  sub_100053050();
  sub_100016A1C((uint64_t)v15, (uint64_t)v19, &qword_100066040);
  uint64_t v24 = &v19[*(int *)(v17 + 44)];
  long long v25 = v33;
  *(_OWORD *)uint64_t v24 = v32;
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v34;
  sub_100006918((uint64_t)v15, &qword_100066040);
  uint64_t v26 = v31;
  sub_100016A1C((uint64_t)v19, v31, &qword_100066048);
  *(_WORD *)(v26 + *(int *)(sub_1000053FC(&qword_100066050) + 36)) = 256;
  return sub_100006918((uint64_t)v19, &qword_100066048);
}

uint64_t sub_1000490F4(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for AvatarView() + 48);
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(unsigned __int8 *)(v1 + 24);
  int v6 = *(unsigned __int8 *)(v1 + 25);
  sub_1000495B4(*(void *)v1, v3, v4, v5, *(unsigned char *)(v1 + 25));
  sub_1000253E0(v2, v3, v4, v5 | (v6 << 8));
  sub_100026248(v2, v3, v4, v5, v6);
  sub_1000053FC(&qword_100065EE0);
  sub_100053840();
  swift_release();
  return swift_release();
}

uint64_t sub_10004920C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_1000646E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *sub_100049274(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100053AF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(void *)((char *)a1 + v8) = v10;
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    *(void *)uint64_t v11 = *(void *)v12;
    v11[8] = v12[8];
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100053AB0();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    id v19 = v10;
    if (v18(v15, 1, v16))
    {
      uint64_t v20 = sub_1000053FC(&qword_1000646E0);
      memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v22 = a3[9];
    *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
    uint64_t v23 = a3[11];
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v24 = (char *)a1 + v23;
    long long v25 = (char *)a2 + v23;
    uint64_t v26 = sub_100052710();
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
    swift_retain();
    v27(v24, v25, v26);
    uint64_t v28 = a3[12];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = *(void *)v30;
    uint64_t v32 = *((void *)v30 + 1);
    uint64_t v33 = *((void *)v30 + 2);
    LOBYTE(v26) = v30[25];
    LOBYTE(v27) = v30[24];
    sub_1000495B4(*(void *)v30, v32, v33, v27, v26);
    *(void *)uint64_t v29 = v31;
    *((void *)v29 + 1) = v32;
    *((void *)v29 + 2) = v33;
    v29[24] = (char)v27;
    uint64_t v34 = a3[13];
    uint64_t v35 = a3[14];
    uint64_t v36 = *(void *)((char *)a2 + v34);
    v29[25] = v26;
    *(void *)((char *)a1 + v34) = v36;
    uint64_t v37 = (_OWORD *)((char *)a1 + v35);
    uint64_t v38 = (_OWORD *)((char *)a2 + v35);
    long long v39 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v39;
    uint64_t v40 = a3[15];
    uint64_t v41 = (void *)((char *)a1 + v40);
    uint64_t v42 = (void *)((char *)a2 + v40);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    }
    else
    {
      *uint64_t v41 = *v42;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000495B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1000495F8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + a2[7];
  uint64_t v6 = sub_100053AB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_release();
  uint64_t v8 = a1 + a2[11];
  uint64_t v9 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[12];
  sub_100026248(*(void *)v10, *(void *)(v10 + 8), *(void *)(v10 + 16), *(unsigned __int8 *)(v10 + 24), *(unsigned char *)(v10 + 25));
  uint64_t v11 = a1 + a2[15];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100052FE0();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    return v13(v11, v12);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000497E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  *(void *)uint64_t v10 = *(void *)v11;
  *(unsigned char *)(v10 + 8) = *(unsigned char *)(v11 + 8);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_100053AB0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  id v18 = v9;
  if (v17(v14, 1, v15))
  {
    uint64_t v19 = sub_1000053FC(&qword_1000646E0);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v20 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v20) = *(unsigned char *)(a2 + v20);
  uint64_t v21 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_100052710();
  long long v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_retain();
  v25(v22, v23, v24);
  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)v28;
  uint64_t v30 = *(void *)(v28 + 8);
  uint64_t v31 = *(void *)(v28 + 16);
  LOBYTE(v24) = *(unsigned char *)(v28 + 25);
  LOBYTE(v25) = *(unsigned char *)(v28 + 24);
  sub_1000495B4(*(void *)v28, v30, v31, v25, v24);
  *(void *)uint64_t v27 = v29;
  *(void *)(v27 + 8) = v30;
  *(void *)(v27 + 16) = v31;
  *(unsigned char *)(v27 + 24) = (_BYTE)v25;
  uint64_t v32 = a3[13];
  uint64_t v33 = a3[14];
  uint64_t v34 = *(void *)(a2 + v32);
  *(unsigned char *)(v27 + 25) = v24;
  *(void *)(a1 + v32) = v34;
  uint64_t v35 = (_OWORD *)(a1 + v33);
  uint64_t v36 = (_OWORD *)(a2 + v33);
  long long v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  uint64_t v38 = a3[15];
  long long v39 = (void *)(a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v41 = sub_100052FE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  }
  else
  {
    *long long v39 = *v40;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100049AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  *(unsigned char *)(v12 + 8) = *((unsigned char *)v13 + 8);
  *(void *)uint64_t v12 = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = sub_100053AB0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    uint64_t v23 = sub_1000053FC(&qword_1000646E0);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_7:
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  uint64_t v28 = a3[12];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = *(void *)v30;
  uint64_t v32 = *(void *)(v30 + 8);
  uint64_t v33 = *(void *)(v30 + 16);
  char v34 = *(unsigned char *)(v30 + 25);
  unsigned __int8 v35 = *(unsigned char *)(v30 + 24);
  sub_1000495B4(*(void *)v30, v32, v33, v35, v34);
  uint64_t v36 = *(void *)v29;
  uint64_t v37 = *(void *)(v29 + 8);
  uint64_t v38 = *(void *)(v29 + 16);
  char v39 = *(unsigned char *)(v29 + 25);
  *(void *)uint64_t v29 = v31;
  *(void *)(v29 + 8) = v32;
  *(void *)(v29 + 16) = v33;
  uint64_t v40 = *(unsigned __int8 *)(v29 + 24);
  *(unsigned char *)(v29 + 24) = v35;
  *(unsigned char *)(v29 + 25) = v34;
  sub_100026248(v36, v37, v38, v40, v39);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v41 = a3[14];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  *uint64_t v42 = *v43;
  v42[1] = v43[1];
  v42[2] = v43[2];
  v42[3] = v43[3];
  if (a1 != a2)
  {
    uint64_t v44 = a3[15];
    uint64_t v45 = (void *)(a1 + v44);
    uint64_t v46 = (void *)(a2 + v44);
    sub_100006918(a1 + v44, &qword_100064D80);
    sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v47 = sub_100052FE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
    }
    else
    {
      *uint64_t v45 = *v46;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100049E74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_100053AB0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = sub_1000053FC(&qword_1000646E0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v16 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v17 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[12];
  uint64_t v22 = a3[13];
  long long v23 = *(_OWORD *)(a2 + v21);
  long long v24 = *(_OWORD *)(a2 + v21 + 10);
  uint64_t v25 = (_OWORD *)(a1 + v21);
  *uint64_t v25 = v23;
  *(_OWORD *)((char *)v25 + 10) = v24;
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  uint64_t v26 = a3[14];
  uint64_t v27 = a3[15];
  uint64_t v28 = (_OWORD *)(a1 + v26);
  uint64_t v29 = (_OWORD *)(a2 + v26);
  long long v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = (void *)(a1 + v27);
  uint64_t v32 = (const void *)(a2 + v27);
  uint64_t v33 = sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = sub_100052FE0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 32))(v31, v32, v34);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10004A128(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v9;
  uint64_t v12 = a2 + v9;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = (void *)(a1 + v10);
  uint64_t v14 = (void *)(a2 + v10);
  uint64_t v15 = sub_100053AB0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = sub_1000053FC(&qword_1000646E0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  uint64_t v21 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v21) = *(unsigned char *)(a2 + v21);
  uint64_t v22 = a3[11];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = *(void *)(v28 + 16);
  char v30 = *(unsigned char *)(v28 + 24);
  char v31 = *(unsigned char *)(v28 + 25);
  uint64_t v32 = *(void *)v27;
  uint64_t v33 = *(void *)(v27 + 8);
  uint64_t v34 = *(void *)(v27 + 16);
  char v35 = *(unsigned char *)(v27 + 25);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(void *)(v27 + 16) = v29;
  uint64_t v36 = *(unsigned __int8 *)(v27 + 24);
  *(unsigned char *)(v27 + 24) = v30;
  *(unsigned char *)(v27 + 25) = v31;
  sub_100026248(v32, v33, v34, v36, v35);
  uint64_t v37 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v38 = (_OWORD *)(a1 + v37);
  char v39 = (_OWORD *)(a2 + v37);
  long long v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  if (a1 != a2)
  {
    uint64_t v41 = a3[15];
    uint64_t v42 = (void *)(a1 + v41);
    uint64_t v43 = (const void *)(a2 + v41);
    sub_100006918(a1 + v41, &qword_100064D80);
    uint64_t v44 = sub_1000053FC(&qword_100064D80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v45 = sub_100052FE0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v45 - 8) + 32))(v42, v43, v45);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004A494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004A4A8);
}

uint64_t sub_10004A4A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053AF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_1000053FC(&qword_1000646E0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[7];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[8]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = sub_100052710();
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[11];
      goto LABEL_11;
    }
    uint64_t v17 = sub_1000053FC(&qword_1000650C0);
    int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[15];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_10004A67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004A690);
}

uint64_t sub_10004A690(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100053AF0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_1000053FC(&qword_1000646E0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[7];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[8]) = (a2 - 1);
    return result;
  }
  uint64_t v16 = sub_100052710();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[11];
    goto LABEL_9;
  }
  uint64_t v17 = sub_1000053FC(&qword_1000650C0);
  int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[15];

  return v18(v20, a2, a2, v19);
}

void sub_10004A864()
{
  sub_100053AF0();
  if (v0 <= 0x3F)
  {
    sub_10004AA50(319, (unint64_t *)&unk_100065E68, (uint64_t (*)(uint64_t))&type metadata accessor for ContactImage, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      sub_100052710();
      if (v2 <= 0x3F)
      {
        sub_10004AA50(319, (unint64_t *)&unk_100065130, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_10004AA50(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_10004AAB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004AAD0()
{
  unint64_t v1 = (int *)type metadata accessor for AvatarView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);

  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_100053AB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_release();
  uint64_t v10 = v5 + v1[11];
  uint64_t v11 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v5 + v1[12];
  sub_100026248(*(void *)v12, *(void *)(v12 + 8), *(void *)(v12 + 16), *(unsigned __int8 *)(v12 + 24), *(unsigned char *)(v12 + 25));
  uint64_t v13 = v5 + v1[15];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_100052FE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10004AD1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AvatarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004AD80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AvatarView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000472FC(a1, v6, a2);
}

uint64_t sub_10004AE00()
{
  unint64_t v1 = (int *)type metadata accessor for AvatarView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_100053AF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);

  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_100053AB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_release();
  uint64_t v10 = v5 + v1[11];
  uint64_t v11 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v5 + v1[12];
  sub_100026248(*(void *)v12, *(void *)(v12 + 8), *(void *)(v12 + 16), *(unsigned __int8 *)(v12 + 24), *(unsigned char *)(v12 + 25));
  uint64_t v13 = v5 + v1[15];
  sub_1000053FC(&qword_100064D80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_100052FE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_10004B058()
{
  uint64_t v1 = *(void *)(type metadata accessor for AvatarView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000490F4(v2);
}

uint64_t sub_10004B0E8(uint64_t a1)
{
  return a1;
}

unint64_t sub_10004B114()
{
  unint64_t result = qword_100065F50;
  if (!qword_100065F50)
  {
    sub_100005440(&qword_100065F28);
    sub_10004B1C0();
    sub_10004B744(&qword_100064690, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065F50);
  }
  return result;
}

unint64_t sub_10004B1C0()
{
  unint64_t result = qword_100065F58;
  if (!qword_100065F58)
  {
    sub_100005440(&qword_100065F20);
    sub_10004B260();
    sub_100006BF0(&qword_100065FF0, &qword_100065FF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065F58);
  }
  return result;
}

unint64_t sub_10004B260()
{
  unint64_t result = qword_100065F60;
  if (!qword_100065F60)
  {
    sub_100005440(&qword_100065F18);
    sub_10004B300();
    sub_100006BF0(&qword_100065FE8, &qword_100065F10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065F60);
  }
  return result;
}

unint64_t sub_10004B300()
{
  unint64_t result = qword_100065F68;
  if (!qword_100065F68)
  {
    sub_100005440(&qword_100065F70);
    sub_10004B854(&qword_100065F78, &qword_100065F80, (void (*)(void))sub_10004B3CC);
    sub_100006BF0(&qword_100065FD8, &qword_100065FE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065F68);
  }
  return result;
}

uint64_t sub_10004B3CC()
{
  return sub_10004B854(&qword_100065F88, &qword_100065F90, (void (*)(void))sub_10004B3FC);
}

uint64_t sub_10004B3FC()
{
  return sub_10004B854(&qword_100065F98, &qword_100065FA0, (void (*)(void))sub_10004B42C);
}

uint64_t sub_10004B42C()
{
  return sub_10004B854(&qword_100065FA8, &qword_100065FB0, (void (*)(void))sub_10004B45C);
}

unint64_t sub_10004B45C()
{
  unint64_t result = qword_100065FB8;
  if (!qword_100065FB8)
  {
    sub_100005440(&qword_100065FC0);
    sub_100006BF0(&qword_100065FC8, &qword_100065FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065FB8);
  }
  return result;
}

unint64_t sub_10004B4FC()
{
  unint64_t result = qword_100066000;
  if (!qword_100066000)
  {
    sub_100005440(&qword_100065F48);
    sub_10004B854(&qword_100065F78, &qword_100065F80, (void (*)(void))sub_10004B3CC);
    sub_100006BF0(&qword_100066008, &qword_100066010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066000);
  }
  return result;
}

uint64_t sub_10004B5D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004B638(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10004B698()
{
  unint64_t result = qword_100066020;
  if (!qword_100066020)
  {
    sub_100005440(&qword_100065EF0);
    sub_10004B744(&qword_100066028, (void (*)(uint64_t))type metadata accessor for StatusBadgeView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066020);
  }
  return result;
}

uint64_t sub_10004B744(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10004B78C()
{
  unint64_t result = qword_100066060;
  if (!qword_100066060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066060);
  }
  return result;
}

uint64_t sub_10004B7E0()
{
  return sub_10004B854(&qword_100066068, &qword_100066070, (void (*)(void))sub_10004B824);
}

uint64_t sub_10004B824()
{
  return sub_10004B854(&qword_100066078, &qword_100066080, (void (*)(void))sub_10004B8D0);
}

uint64_t sub_10004B854(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10004B8D0()
{
  unint64_t result = qword_100066088;
  if (!qword_100066088)
  {
    sub_100005440(&qword_100066090);
    sub_100006BF0(&qword_100066098, &qword_1000660A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066088);
  }
  return result;
}

uint64_t *sub_10004B970(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1000539F0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000053FC(&qword_1000646A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_10004BB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000539F0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_100052710();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

char *sub_10004BC24(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

char *sub_10004BD88(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

char *sub_10004BF50(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A8);
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
  uint64_t v12 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_10004C0B4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_10004C27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004C290);
}

uint64_t sub_10004C290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000053FC(&qword_1000646A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100052710();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10004C38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004C3A0);
}

uint64_t sub_10004C3A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000053FC(&qword_1000646A8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100052710();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for SingleContactSmallWidgetView()
{
  uint64_t result = qword_100066100;
  if (!qword_100066100) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10004C4F4()
{
  sub_10004C5BC();
  if (v0 <= 0x3F)
  {
    sub_100052710();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10004C5BC()
{
  if (!qword_100064C38)
  {
    sub_1000539F0();
    unint64_t v0 = sub_100053F60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100064C38);
    }
  }
}

uint64_t sub_10004C614()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10004C630@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10004C8A8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100064688, &qword_100064668).n128_u64[0];
  return result;
}

uint64_t sub_10004C68C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, long long *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100053F20();
    uint64_t v23 = (void *)sub_100053420();
    sub_100052740();
  }
  sub_1000530A0();
  long long v24 = v13[1];
  long long v35 = *v13;
  long long v36 = v24;
  sub_10004EFB8((uint64_t)&v35, (uint64_t)v38);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  long long v26 = v13[2];
  a9[6] = v31;
  a9[7] = v32;
  a9[8] = v33;
  a9[9] = v34;
  a9[2] = v26;
  a9[3] = v28;
  uint64_t v37 = *((void *)&v36 + 1);
  a9[4] = v29;
  a9[5] = v30;
  sub_10004F014((uint64_t)v38);
  return sub_10004F048((uint64_t)&v37);
}

double sub_10004C84C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10004C8A8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100065190, &qword_100065198).n128_u64[0];
  return result;
}

__n128 sub_10004C8A8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
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
    sub_100053F20();
    long long v28 = (void *)sub_100053420();
    sub_100052740();

    uint64_t v19 = a17;
  }
  sub_1000530A0();
  sub_100016A1C(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(sub_1000053FC(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

__n128 sub_10004CA78@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100053F20();
    uint64_t v23 = (void *)sub_100053420();
    sub_100052740();
  }
  sub_1000530A0();
  uint64_t v24 = sub_1000053FC(&qword_100065820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  long long v25 = (_OWORD *)(a9 + *(int *)(sub_1000053FC(&qword_100065828) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *long long v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  void v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_10004CC64@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, char a20)
{
  uint64_t v21 = a16;
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
    sub_100053F20();
    __n128 v30 = (void *)sub_100053420();
    sub_100052740();

    uint64_t v21 = a16;
  }
  sub_1000530A0();
  *(void *)a9 = v21;
  *(void *)(a9 + 8) = a17;
  *(void *)(a9 + 16) = a18;
  *(unsigned char *)(a9 + 24) = a19 & 1;
  *(unsigned char *)(a9 + 25) = a20 & 1;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;

  return swift_retain();
}

double sub_10004CE4C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10004C8A8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100066180, &qword_100066188).n128_u64[0];
  return result;
}

uint64_t sub_10004CEA8(uint64_t a1)
{
  uint64_t v25 = sub_1000053FC(&qword_1000646B8);
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000053FC(&qword_100066198);
  __chkstk_darwin(v23);
  uint64_t v5 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100052680();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v22 - v13;
  sub_100016A1C(a1, (uint64_t)v7, &qword_1000646A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100006918((uint64_t)v7, &qword_1000646A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v24, v25);
    uint64_t v15 = sub_100005440(&qword_1000646B0);
    uint64_t v16 = sub_100006BF0(&qword_1000646C8, &qword_1000646B0);
    uint64_t v26 = v15;
    uint64_t v27 = v16;
    swift_getOpaqueTypeConformance2();
    return sub_100053830();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    __chkstk_darwin(v18);
    *(&v22 - 2) = v24;
    uint64_t v19 = sub_100005440(&qword_1000646B0);
    uint64_t v20 = sub_100006BF0(&qword_1000646C8, &qword_1000646B0);
    uint64_t v26 = v19;
    uint64_t v27 = v20;
    swift_getOpaqueTypeConformance2();
    sub_100053550();
    sub_100006BF0(&qword_1000661A0, &qword_100066198);
    uint64_t v17 = sub_100053830();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return v17;
}

uint64_t sub_10004D2CC(uint64_t a1)
{
  uint64_t v25 = sub_1000053FC(&qword_1000658B8);
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000053FC(&qword_100066170);
  __chkstk_darwin(v23);
  uint64_t v5 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100052680();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v22 - v13;
  sub_100016A1C(a1, (uint64_t)v7, &qword_1000646A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100006918((uint64_t)v7, &qword_1000646A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v24, v25);
    uint64_t v15 = sub_100005440(&qword_1000658B0);
    uint64_t v16 = sub_100006BF0(&qword_1000658C8, &qword_1000658B0);
    uint64_t v26 = v15;
    uint64_t v27 = v16;
    swift_getOpaqueTypeConformance2();
    return sub_100053830();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    __chkstk_darwin(v18);
    *(&v22 - 2) = v24;
    uint64_t v19 = sub_100005440(&qword_1000658B0);
    uint64_t v20 = sub_100006BF0(&qword_1000658C8, &qword_1000658B0);
    uint64_t v26 = v19;
    uint64_t v27 = v20;
    swift_getOpaqueTypeConformance2();
    sub_100053550();
    sub_100006BF0(&qword_100066178, &qword_100066170);
    uint64_t v17 = sub_100053830();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return v17;
}

uint64_t sub_10004D6F0(uint64_t a1)
{
  uint64_t v25 = sub_1000053FC(&qword_100066140);
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000053FC(&qword_100066160);
  __chkstk_darwin(v23);
  uint64_t v5 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100052680();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v22 - v13;
  sub_100016A1C(a1, (uint64_t)v7, &qword_1000646A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100006918((uint64_t)v7, &qword_1000646A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v24, v25);
    uint64_t v15 = sub_100005440(&qword_100066138);
    uint64_t v16 = sub_100006BF0(&qword_100066158, &qword_100066138);
    uint64_t v26 = v15;
    uint64_t v27 = v16;
    swift_getOpaqueTypeConformance2();
    return sub_100053830();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    uint64_t v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    __chkstk_darwin(v18);
    *(&v22 - 2) = v24;
    uint64_t v19 = sub_100005440(&qword_100066138);
    uint64_t v20 = sub_100006BF0(&qword_100066158, &qword_100066138);
    uint64_t v26 = v19;
    uint64_t v27 = v20;
    swift_getOpaqueTypeConformance2();
    sub_100053550();
    sub_100006BF0(&qword_100066168, &qword_100066160);
    uint64_t v17 = sub_100053830();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return v17;
}

uint64_t sub_10004DB14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v49 = a1;
  uint64_t v3 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v3 - 8);
  uint64_t v41 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_1000646A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1000533F0();
  uint64_t v8 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000053FC(&qword_100066138);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000053FC(&qword_100066140);
  uint64_t v14 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000053FC(&qword_100064688);
  uint64_t v17 = __chkstk_darwin(v44);
  uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v47 = (char *)&v41 - v20;
  uint64_t v21 = sub_1000053FC(&qword_100064668);
  __chkstk_darwin(v21 - 8);
  uint64_t v48 = (uint64_t)&v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1000053FC(&qword_100066148);
  __chkstk_darwin(v46);
  uint64_t v45 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = sub_100053340();
  *((void *)v13 + 1) = 0x4020000000000000;
  v13[16] = 0;
  uint64_t v24 = sub_1000053FC(&qword_100066150);
  sub_10004E178(v2, (uint64_t)&v13[*(int *)(v24 + 44)]);
  sub_1000533E0();
  sub_100006BF0(&qword_100066158, &qword_100066138);
  sub_1000536C0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v42);
  uint64_t v25 = (uint64_t)v41;
  sub_100006918((uint64_t)v13, &qword_100066138);
  sub_100053990();
  uint64_t v26 = sub_100052680();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 0, 1, v26);
  uint64_t v27 = sub_10004D6F0((uint64_t)v7);
  sub_100006918((uint64_t)v7, &qword_1000646A0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v43);
  uint64_t v52 = v27;
  sub_100016A1C(v2, v25, &qword_1000646A8);
  uint64_t v28 = sub_1000539F0();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v25, 1, v28) == 1)
  {
    sub_100006918(v25, &qword_1000646A8);
    uint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
  }
  else
  {
    uint64_t v30 = sub_1000539B0();
    unint64_t v31 = v32;
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v25, v28);
  }
  uint64_t v50 = v30;
  unint64_t v51 = v31;
  sub_1000068C4();
  sub_100053690();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000529C0();
  uint64_t v33 = (uint64_t)v47;
  sub_100053090();
  swift_bridgeObjectRelease();
  sub_100006918((uint64_t)v19, &qword_100064688);
  uint64_t v34 = sub_1000538E0();
  uint64_t v35 = v48;
  sub_10004C8A8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v48, 0.0, 1, 0.0, 1, v34, v36, &qword_100064688, &qword_100064668);
  sub_100006918(v33, &qword_100064688);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = (uint64_t)v45;
  char v39 = (uint64_t *)&v45[*(int *)(v46 + 36)];
  *char v39 = KeyPath;
  sub_1000053FC(&qword_100064760);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)v39 + *(int *)(type metadata accessor for TimeStampModifier(0) + 20)) = 1;
  sub_100006AA8(v35, v38, &qword_100064668);
  return sub_100006AA8(v38, v49, &qword_100066148);
}

uint64_t sub_10004E178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v3 = sub_100052C50();
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v87 = v3;
  __chkstk_darwin(v3);
  uint64_t v88 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for StatusAndNameView();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v91 = (uint64_t)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v89 = (void **)((char *)&v74 - v9);
  __chkstk_darwin(v8);
  uint64_t v90 = (uint64_t)&v74 - v10;
  uint64_t v77 = sub_100052710();
  uint64_t v11 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100052FB0();
  uint64_t v80 = *(void *)(v17 - 8);
  uint64_t v81 = v17;
  __chkstk_darwin(v17);
  char v79 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000053FC(&qword_1000646A8);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v82 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v74 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v75 = (uint64_t)&v74 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v74 - v28;
  __chkstk_darwin(v27);
  unint64_t v31 = (char *)&v74 - v30;
  uint64_t v32 = sub_1000053FC(&qword_1000646E8);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v83 = (char *)&v74 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v36 = (char *)&v74 - v35;
  uint64_t v37 = type metadata accessor for AvatarView();
  uint64_t v38 = __chkstk_darwin(v37 - 8);
  uint64_t v85 = (uint64_t)&v74 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v76 = (char *)&v74 - v41;
  __chkstk_darwin(v40);
  uint64_t v84 = (uint64_t)&v74 - v42;
  uint64_t v95 = a1;
  sub_100016A1C(a1, (uint64_t)v31, &qword_1000646A8);
  uint64_t v43 = sub_1000539F0();
  uint64_t v44 = *(void *)(v43 - 8);
  double v94 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
  if (v94(v31, 1, v43) == 1)
  {
    sub_100006918((uint64_t)v31, &qword_1000646A8);
    uint64_t v45 = sub_100053AF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v36, 1, 1, v45);
  }
  else
  {
    sub_1000539C0();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v43);
    uint64_t v46 = sub_100053AF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v36, 0, 1, v46);
  }
  uint64_t v93 = v44;
  sub_100016A1C(v95, (uint64_t)v29, &qword_1000646A8);
  unsigned int v47 = v94(v29, 1, v43);
  char v78 = v36;
  if (v47 == 1)
  {
    sub_100006918((uint64_t)v29, &qword_1000646A8);
    uint64_t v48 = 0;
  }
  else
  {
    uint64_t v49 = v13;
    uint64_t v50 = v79;
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v29, v43);
    uint64_t v48 = sub_100052F90();
    unint64_t v51 = v50;
    uint64_t v13 = v49;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v51, v81);
  }
  uint64_t v52 = v75;
  sub_100016A1C(v95, v75, &qword_1000646A8);
  if (v94((char *)v52, 1, v43) == 1)
  {
    sub_100006918(v52, &qword_1000646A8);
    uint64_t v53 = sub_100053AB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v16, 1, 1, v53);
  }
  else
  {
    sub_1000539A0();
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v52, v43);
  }
  uint64_t v54 = type metadata accessor for SingleContactSmallWidgetView();
  uint64_t v55 = v95;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v95 + *(int *)(v54 + 20), v77);
  sub_100052BE0();
  uint64_t v56 = sub_100052BD0();
  uint64_t v57 = v76;
  sub_100045DFC((uint64_t)v78, v48, 0, 1, (uint64_t)v16, v56, 0, 1, v76, (uint64_t)v13);
  uint64_t v58 = v84;
  sub_10004ED84((uint64_t)v57, v84, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100016A1C(v55, (uint64_t)v24, &qword_1000646A8);
  if (v94(v24, 1, v43) == 1)
  {
    sub_100006918((uint64_t)v24, &qword_1000646A8);
    uint64_t v59 = 0;
    uint64_t v60 = (uint64_t)v82;
    uint64_t v61 = v93;
  }
  else
  {
    uint64_t v62 = v79;
    sub_1000539D0();
    uint64_t v61 = v93;
    (*(void (**)(char *, uint64_t))(v93 + 8))(v24, v43);
    uint64_t v59 = (void *)sub_100052F90();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v62, v81);
    uint64_t v60 = (uint64_t)v82;
  }
  sub_100016A1C(v95, v60, &qword_1000646A8);
  if (v94((char *)v60, 1, v43) == 1)
  {
    sub_100006918(v60, &qword_1000646A8);
    uint64_t v63 = sub_100053AF0();
    uint64_t v64 = (uint64_t)v83;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v83, 1, 1, v63);
  }
  else
  {
    uint64_t v64 = (uint64_t)v83;
    sub_1000539C0();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v43);
    uint64_t v65 = sub_100053AF0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v64, 0, 1, v65);
  }
  uint64_t v66 = (void *)sub_100053520();
  (*(void (**)(char *, void, uint64_t))(v86 + 104))(v88, enum case for ContactFormatter.Style.shortName(_:), v87);
  sub_100053D80();
  uint64_t v97 = sub_100052C70();
  int v98 = &protocol witness table for ContactFormatter;
  sub_100006974((uint64_t *)&v96);
  sub_100052C60();
  uint64_t v67 = v89;
  sub_10002A8CC(v59, v64, v66, &v96, (void *)2, (void *)1, v89, 3.0, INFINITY);
  uint64_t v68 = v90;
  sub_10004ED84((uint64_t)v67, v90, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v69 = v85;
  sub_10004EDEC(v58, v85, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v70 = v91;
  sub_10004EDEC(v68, v91, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  uint64_t v71 = v92;
  sub_10004EDEC(v69, v92, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v72 = sub_1000053FC(&qword_1000646F8);
  sub_10004EDEC(v70, v71 + *(int *)(v72 + 48), (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  sub_10004EE54(v68, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  sub_10004EE54(v58, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_10004EE54(v70, (uint64_t (*)(void))type metadata accessor for StatusAndNameView);
  return sub_10004EE54(v69, (uint64_t (*)(void))type metadata accessor for AvatarView);
}

uint64_t sub_10004EC64()
{
  return sub_100053210();
}

uint64_t sub_10004EC88()
{
  return sub_100053210();
}

uint64_t sub_10004ECAC(uint64_t a1)
{
  uint64_t v2 = sub_100053B40();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100053220();
}

uint64_t sub_10004ED78@<X0>(uint64_t a1@<X8>)
{
  return sub_10004F080(&qword_100066140, a1);
}

uint64_t sub_10004ED84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004EDEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004EE54(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004EEB4@<X0>(uint64_t a1@<X8>)
{
  return sub_10004F080(&qword_1000658B8, a1);
}

unint64_t sub_10004EEC4()
{
  unint64_t result = qword_100066190;
  if (!qword_100066190)
  {
    sub_100005440(&qword_100066148);
    sub_10000679C();
    sub_10004EF70(&qword_100064B18, (void (*)(uint64_t))type metadata accessor for TimeStampModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066190);
  }
  return result;
}

uint64_t sub_10004EF70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004EFB8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10004F014(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004F048(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004F074@<X0>(uint64_t a1@<X8>)
{
  return sub_10004F080(&qword_1000646B8, a1);
}

uint64_t sub_10004F080@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = sub_1000053FC(a1);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

ValueMetadata *type metadata accessor for SingleContactWidgetNoRemote()
{
  return &type metadata for SingleContactWidgetNoRemote;
}

uint64_t sub_10004F0F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004F114()
{
  sub_1000053FC(&qword_1000661A8);
  sub_100053BC0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100054930;
  sub_100053BB0();
  sub_1000053FC(&qword_100064718);
  uint64_t v0 = sub_100053BA0();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100054930;
  (*(void (**)(unint64_t, void, uint64_t))(v1 + 104))(v3 + v2, enum case for WidgetFamily.systemSmall(_:), v0);
  sub_10004F2C4();
  sub_100053370();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unint64_t sub_10004F2C4()
{
  unint64_t result = qword_1000661B0;
  if (!qword_1000661B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000661B0);
  }
  return result;
}

uint64_t sub_10004F318()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MultipleContactsWidgetNoRemote()
{
  return &type metadata for MultipleContactsWidgetNoRemote;
}

uint64_t sub_10004F374()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004F390()
{
  sub_1000053FC(&qword_1000661A8);
  sub_100053BC0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100054930;
  sub_100053BB0();
  if (qword_100064540 != -1) {
    swift_once();
  }
  sub_10004F4B0();
  sub_100053370();

  return swift_bridgeObjectRelease();
}

unint64_t sub_10004F4B0()
{
  unint64_t result = qword_1000661B8;
  if (!qword_1000661B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000661B8);
  }
  return result;
}

uint64_t sub_10004F504()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10004F550()
{
  id v1 = [v0 id];
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = (id)sub_100053D30();
  }
  else
  {
    id v3 = [v0 identifier];
    if (v3)
    {
      uint64_t v5 = sub_100053D30();
      unint64_t v7 = v6;

      v11[0] = 124;
      v11[1] = 0xE100000000000000;
      __chkstk_darwin(v8);
      void v10[2] = v11;
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_10004F6DC(0x7FFFFFFFFFFFFFFFLL, 1, sub_10004FCDC, (uint64_t)v10, v5, v7);
      swift_bridgeObjectRelease();
      if (*(void *)(v9 + 16))
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRelease();
        id v3 = (id)sub_100053D40();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        return 0;
      }
    }
  }
  return v3;
}

uint64_t sub_10004F6DC(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_10004FB80(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_100053DD0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_100053D60();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_100053D60();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_100053DE0();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_100013790(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v27 = *((void *)v13 + 2);
  unint64_t v26 = *((void *)v13 + 3);
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_100013790((char *)(v26 > 1), v27 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v27 + 1;
  uint64_t v28 = &v13[32 * v27];
  *((void *)v28 + 4) = v45;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_100053D60();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (*((void *)v13 + 2) != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_100053DE0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_100013790(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v39 = *((void *)v13 + 2);
    unint64_t v38 = *((void *)v13 + 3);
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_100013790((char *)(v38 > 1), v39 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v39 + 1;
    uint64_t v40 = &v13[32 * v39];
    *((void *)v40 + 4) = v31;
    *((void *)v40 + 5) = v33;
    *((void *)v40 + 6) = v35;
    *((void *)v40 + 7) = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_100054030();
  __break(1u);
LABEL_42:
  uint64_t result = sub_100054030();
  __break(1u);
  return result;
}

uint64_t sub_10004FB80(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_100053DE0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(char **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_100013790(0, *((void *)v14 + 2) + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_100013790((char *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    char v18 = &v14[32 * v17];
    *((void *)v18 + 4) = v7;
    *((void *)v18 + 5) = v9;
    *((void *)v18 + 6) = v11;
    *((void *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_100054030();
  __break(1u);
  return result;
}

uint64_t sub_10004FCDC(void *a1)
{
  unint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_1000540C0() & 1;
  }
}

uint64_t sub_10004FD34()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004FD6C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004FD7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100052FB0();
  uint64_t v29 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000053FC(&qword_1000646A8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)v28 - v13;
  sub_100016A1C(a1, a3, &qword_1000646A8);
  uint64_t v15 = *(int *)(type metadata accessor for SingleContactSmallWidgetVerticalView() + 20);
  v28[1] = a3;
  uint64_t v16 = a3 + v15;
  uint64_t v17 = sub_100052710();
  uint64_t v30 = *(void *)(v17 - 8);
  uint64_t v31 = v17;
  char v18 = *(void (**)(uint64_t, uint64_t))(v30 + 16);
  uint64_t v32 = a2;
  v18(v16, a2);
  uint64_t v33 = a1;
  sub_100016A1C(a1, (uint64_t)v14, &qword_1000646A8);
  uint64_t v19 = sub_1000539F0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v14, 1, v19);
  v28[0] = v6;
  if (v22 == 1)
  {
    sub_100006918((uint64_t)v14, &qword_1000646A8);
  }
  else
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v19);
    sub_100052FA0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  }
  sub_100052840();
  sub_100052830();
  sub_100053B00();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v23 = v33;
  sub_100016A1C(v33, (uint64_t)v12, &qword_1000646A8);
  if (v21(v12, 1, v19) == 1)
  {
    sub_100006918((uint64_t)v12, &qword_1000646A8);
  }
  else
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v12, v19);
    uint64_t v24 = (void *)sub_100052F90();
    (*(void (**)(char *, void))(v29 + 8))(v8, v28[0]);
    id v25 = [v24 identifier];

    sub_100053D30();
    uint64_t v26 = sub_100053DC0();
    swift_bridgeObjectRelease();
    uint64_t v34 = v26;
    sub_100050204();
    sub_100053F90();
  }
  sub_100052980();
  sub_100052950();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
  return sub_100006918(v23, &qword_1000646A8);
}

uint64_t type metadata accessor for SingleContactSmallWidgetVerticalView()
{
  uint64_t result = qword_100066220;
  if (!qword_100066220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100050204()
{
  unint64_t result = qword_1000661C0;
  if (!qword_1000661C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000661C0);
  }
  return result;
}

uint64_t *sub_100050258(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1000539F0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000053FC(&qword_1000646A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100052710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_100053AF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_100050454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000539F0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_100052710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = sub_100053AF0();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

char *sub_100050594(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

char *sub_100050740(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

char *sub_100050950(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000053FC(&qword_1000646A8);
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
  uint64_t v12 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  return a1;
}

char *sub_100050AFC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000539F0();
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
    uint64_t v11 = sub_1000053FC(&qword_1000646A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100052710();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_100053AF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_100050D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100050D20);
}

uint64_t sub_100050D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000053FC(&qword_1000646A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100052710();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_100053AF0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_100050E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100050E84);
}

uint64_t sub_100050E84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000053FC(&qword_1000646A8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100052710();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_100053AF0();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_100050FE0()
{
  sub_10004C5BC();
  if (v0 <= 0x3F)
  {
    sub_100052710();
    if (v1 <= 0x3F)
    {
      sub_100053AF0();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_1000510E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = sub_100052710();
  uint64_t v64 = *(void *)(v3 - 8);
  uint64_t v65 = v3;
  __chkstk_darwin(v3);
  uint64_t v66 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000053FC(&qword_1000646E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v63 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100052FB0();
  uint64_t v55 = *(void *)(v7 - 8);
  uint64_t v56 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000053FC(&qword_1000646A8);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = sub_1000053FC(&qword_1000646E8);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for AvatarView();
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v62 = (uint64_t)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v59 = (char *)&v54 - v23;
  __chkstk_darwin(v22);
  uint64_t v61 = (uint64_t)&v54 - v24;
  uint64_t v25 = sub_1000053FC(&qword_100066268);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v60 = (uint64_t)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v54 - v29;
  __chkstk_darwin(v28);
  uint64_t v32 = (char *)&v54 - v31;
  *(void *)uint64_t v30 = sub_100053340();
  *((void *)v30 + 1) = 0;
  v30[16] = 1;
  uint64_t v33 = sub_1000053FC(&qword_100066270);
  sub_1000517E0(a1, &v30[*(int *)(v33 + 44)]);
  sub_100051D84((uint64_t)v30, (uint64_t)v32);
  uint64_t v58 = type metadata accessor for SingleContactSmallWidgetVerticalView();
  uint64_t v34 = a1 + *(int *)(v58 + 24);
  uint64_t v35 = sub_100053AF0();
  uint64_t v36 = *(void *)(v35 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v18, v34, v35);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v18, 0, 1, v35);
  uint64_t v37 = a1;
  sub_100016A1C(a1, (uint64_t)v15, &qword_1000646A8);
  uint64_t v38 = sub_1000539F0();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v40(v15, 1, v38) == 1)
  {
    sub_100006918((uint64_t)v15, &qword_1000646A8);
    uint64_t v57 = 0;
  }
  else
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v38);
    uint64_t v57 = sub_100052F90();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v9, v56);
  }
  sub_100016A1C(v37, (uint64_t)v13, &qword_1000646A8);
  if (v40(v13, 1, v38) == 1)
  {
    sub_100006918((uint64_t)v13, &qword_1000646A8);
    uint64_t v41 = sub_100053AB0();
    uint64_t v42 = (uint64_t)v63;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v63, 1, 1, v41);
  }
  else
  {
    uint64_t v42 = (uint64_t)v63;
    sub_1000539A0();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v38);
  }
  uint64_t v43 = v37 + *(int *)(v58 + 20);
  uint64_t v44 = (uint64_t)v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v66, v43, v65);
  sub_100052BE0();
  uint64_t v45 = sub_100052BD0();
  uint64_t v46 = v59;
  sub_100045DFC((uint64_t)v18, v57, 0, 1, v42, v45, 0, 1, v59, v44);
  uint64_t v47 = v61;
  sub_100051DFC((uint64_t)v46, v61, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v48 = v60;
  sub_100016A1C((uint64_t)v32, v60, &qword_100066268);
  uint64_t v49 = v62;
  sub_100051E64(v47, v62, (uint64_t (*)(void))type metadata accessor for AvatarView);
  uint64_t v50 = v67;
  sub_100016A1C(v48, v67, &qword_100066268);
  uint64_t v51 = sub_1000053FC(&qword_100066278);
  uint64_t v52 = v50 + *(int *)(v51 + 48);
  *(void *)uint64_t v52 = 0;
  *(unsigned char *)(v52 + 8) = 1;
  sub_100051E64(v49, v50 + *(int *)(v51 + 64), (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100051ECC(v47, (uint64_t (*)(void))type metadata accessor for AvatarView);
  sub_100006918((uint64_t)v32, &qword_100066268);
  sub_100051ECC(v49, (uint64_t (*)(void))type metadata accessor for AvatarView);
  return sub_100006918(v48, &qword_100066268);
}

uint64_t sub_1000517E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v37 = sub_100052C50();
  uint64_t v3 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v36 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100052FB0();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000053FC(&qword_1000646A8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for StatusAndNameViewVertical();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (uint64_t *)((char *)&v33 - v16);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v20 = a1;
  sub_100016A1C(a1, (uint64_t)v10, &qword_1000646A8);
  uint64_t v21 = sub_1000539F0();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v10, 1, v21) == 1)
  {
    sub_100006918((uint64_t)v10, &qword_1000646A8);
    uint64_t v23 = 0;
  }
  else
  {
    sub_1000539D0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v21);
    uint64_t v23 = sub_100052F90();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v35);
  }
  uint64_t v24 = v20 + *(int *)(type metadata accessor for SingleContactSmallWidgetVerticalView() + 24);
  uint64_t v25 = (char *)v17 + v11[5];
  uint64_t v26 = sub_100053AF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v25, v24, v26);
  *uint64_t v17 = v23;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v36, enum case for ContactFormatter.Style.shortName(_:), v37);
  uint64_t v27 = (uint64_t *)((char *)v17 + v11[6]);
  sub_100053D80();
  v27[3] = sub_100052C70();
  v27[4] = (uint64_t)&protocol witness table for ContactFormatter;
  sub_100006974(v27);
  sub_100052C60();
  uint64_t v28 = (uint64_t *)((char *)v17 + v11[7]);
  *uint64_t v28 = swift_getKeyPath();
  sub_1000053FC(&qword_100064768);
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = (uint64_t *)((char *)v17 + v11[8]);
  *uint64_t v29 = swift_getKeyPath();
  sub_1000053FC(&qword_100064D80);
  swift_storeEnumTagMultiPayload();
  sub_100051DFC((uint64_t)v17, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for StatusAndNameViewVertical);
  sub_100051E64((uint64_t)v19, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StatusAndNameViewVertical);
  uint64_t v30 = v38;
  *uint64_t v38 = 0;
  *((unsigned char *)v30 + 8) = 1;
  uint64_t v31 = sub_1000053FC(&qword_100066280);
  sub_100051E64((uint64_t)v14, (uint64_t)v30 + *(int *)(v31 + 48), (uint64_t (*)(void))type metadata accessor for StatusAndNameViewVertical);
  sub_100051ECC((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for StatusAndNameViewVertical);
  return sub_100051ECC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StatusAndNameViewVertical);
}

uint64_t sub_100051C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000053FC(&qword_100066180);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_1000532E0();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_1000053FC(&qword_100066260);
  sub_100051100(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  uint64_t v7 = sub_1000538D0();
  sub_10004CE4C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v7, v8);
  return sub_100006918((uint64_t)v5, &qword_100066180);
}

uint64_t sub_100051D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053FC(&qword_100066268);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100051DFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100051E64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100051ECC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100051F30()
{
  unint64_t result = qword_100066288;
  if (!qword_100066288)
  {
    sub_100005440(&qword_100066188);
    sub_100051FAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066288);
  }
  return result;
}

unint64_t sub_100051FAC()
{
  unint64_t result = qword_100066290;
  if (!qword_100066290)
  {
    sub_100005440(&qword_100066180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100066290);
  }
  return result;
}

uint64_t sub_100052008()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10005203C()
{
  return sub_1000521E8(1);
}

uint64_t sub_100052044(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_100067448 == -1)
  {
    if (qword_100067450) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_100067448, 0, (dispatch_function_t)sub_1000521E0);
    if (qword_100067450) {
      return _availability_version_check();
    }
  }
  if (qword_100067440 == -1)
  {
    BOOL v8 = dword_100067430 < a2;
    if (dword_100067430 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100067440, 0, (dispatch_function_t)sub_10005203C);
    BOOL v8 = dword_100067430 < a2;
    if (dword_100067430 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_100067434 > a3) {
    return 1;
  }
  return dword_100067434 >= a3 && dword_100067438 >= a4;
}

uint64_t sub_1000521E0()
{
  return sub_1000521E8(0);
}

uint64_t sub_1000521E8(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_100067450;
  if (qword_100067450) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_100067450 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_100067430, &dword_100067434, &dword_100067438);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100052520()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100052530()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100052540()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100052550()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100052570()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100052580()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100052590()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000525A0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000525B0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000525C0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000525D0()
{
  return CocoaError._nsError.getter();
}

uint64_t sub_1000525E0()
{
  return static CocoaError.Code.coderInvalidValue.getter();
}

uint64_t sub_1000525F0()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100052600()
{
  return type metadata accessor for CocoaError();
}

Class sub_100052610()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_100052620()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_100052630()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_100052640()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100052650()
{
  return type metadata accessor for LocalizedStringResource();
}

void sub_100052660(NSURL *retstr@<X8>)
{
}

uint64_t sub_100052670()
{
  return URL.init(action:params:arrayParams:scheme:)();
}

uint64_t sub_100052680()
{
  return type metadata accessor for URL();
}

NSData sub_100052690()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000526A0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000526B0()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

NSDate sub_1000526C0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000526D0()
{
  return Date.init()();
}

uint64_t sub_1000526E0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000526F0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100052700()
{
  return UUID.init()();
}

uint64_t sub_100052710()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100052720()
{
  return static Locale.current.getter();
}

uint64_t sub_100052730()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100052740()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100052750()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_100052760()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_100052770()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100052780()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_100052790()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_1000527A0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_1000527B0()
{
  return Logger.ifError(_:message:)();
}

uint64_t sub_1000527C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000527D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000527E0()
{
  return SelectPeopleIntent.people(for:)();
}

uint64_t sub_1000527F0()
{
  return type metadata accessor for SelectPeopleIntent();
}

uint64_t sub_100052800()
{
  return static PeopleDemoOverride.isContactsOverrideEnabled()();
}

uint64_t sub_100052810()
{
  return type metadata accessor for PeopleDemoOverride();
}

uint64_t sub_100052820()
{
  return static PeopleFeatureFlags.isDomainFeatureFlagEnabled(for:feature:)();
}

uint64_t sub_100052830()
{
  return static PeopleFeatureFlags.shared.getter();
}

uint64_t sub_100052840()
{
  return type metadata accessor for PeopleFeatureFlags();
}

uint64_t sub_100052850()
{
  return static PeopleWidgetConfiguration.maxContacts(forFamily:)();
}

uint64_t sub_100052860()
{
  return static PeopleWidgetConfiguration.minContacts(forFamily:)();
}

uint64_t sub_100052870()
{
  return static PeopleWidgetVerticalLayoutToggleKind.getVerticalToggleKind(from:)();
}

uint64_t sub_100052880()
{
  return PeopleWidgetVerticalLayoutToggleKind.rawValue.getter();
}

uint64_t sub_100052890()
{
  return type metadata accessor for PeopleWidgetVerticalLayoutToggleKind();
}

uint64_t sub_1000528A0()
{
  return type metadata accessor for PeopleURL.PathAction();
}

uint64_t sub_1000528B0()
{
  return type metadata accessor for PeopleURL.ArrayParameter();
}

uint64_t sub_1000528C0()
{
  return type metadata accessor for PeopleURL.Scheme();
}

uint64_t sub_1000528D0()
{
  return type metadata accessor for PeopleURL.Parameter();
}

uint64_t sub_1000528E0()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t sub_1000528F0()
{
  return static PeopleLogger.viewService.getter();
}

uint64_t sub_100052900()
{
  return static PeopleLogger.common.getter();
}

uint64_t sub_100052910()
{
  return static PeopleLogger.extension.getter();
}

uint64_t sub_100052920()
{
  return type metadata accessor for PeopleAnalytics.WidgetSize();
}

uint64_t sub_100052930()
{
  return type metadata accessor for PeopleAnalytics.WidgetType();
}

uint64_t sub_100052940()
{
  return static PeopleAnalytics.logTimelineEntries(_:entries:contacts:widgetSize:)();
}

uint64_t sub_100052950()
{
  return static PeopleAnalytics.logContactWidgetUIRenderType(_:_:)();
}

uint64_t sub_100052960()
{
  return dispatch thunk of PeopleAnalytics.sendWidgetPerformQuickAction(_:)();
}

uint64_t sub_100052970()
{
  return static PeopleAnalytics.shared.getter();
}

uint64_t sub_100052980()
{
  return type metadata accessor for PeopleAnalytics();
}

uint64_t sub_100052990()
{
  return static PeopleConstants.timelineEntryDuration.getter();
}

uint64_t sub_1000529A0()
{
  return static PeopleConstants.AccessibilityIdentifier.statusText.getter();
}

uint64_t sub_1000529B0()
{
  return static PeopleConstants.AccessibilityIdentifier.contactName.getter();
}

uint64_t sub_1000529C0()
{
  return static PeopleConstants.AccessibilityIdentifier.contactButton.getter();
}

uint64_t sub_1000529D0()
{
  return static PeopleConstants.AccessibilityIdentifier.quickActionCall.getter();
}

uint64_t sub_1000529E0()
{
  return static PeopleConstants.AccessibilityIdentifier.quickActionMessage.getter();
}

uint64_t sub_1000529F0()
{
  return static PeopleConstants.AccessibilityIdentifier.badgeIconDescription.getter();
}

uint64_t sub_100052A00()
{
  return static PeopleConstants.singleContactWidgetKind.getter();
}

uint64_t sub_100052A10()
{
  return static PeopleConstants.multipleContactsWidgetKind.getter();
}

uint64_t sub_100052A20()
{
  return static PeopleConstants.isMac.getter();
}

uint64_t sub_100052A30()
{
  return type metadata accessor for HandleType();
}

uint64_t sub_100052A40()
{
  return type metadata accessor for PersonType();
}

uint64_t sub_100052A50()
{
  return StatusType.rawValue.getter();
}

uint64_t sub_100052A60()
{
  return type metadata accessor for StatusType();
}

uint64_t sub_100052A70()
{
  return dispatch thunk of TextStatus.localizedDisplayString.getter();
}

uint64_t sub_100052A80()
{
  return LinearScale.init(from:to:validRange:)();
}

uint64_t sub_100052A90()
{
  return LinearScale.convert<A>(_:to:)();
}

uint64_t sub_100052AA0()
{
  return QuickAction.iconSystemName.getter();
}

uint64_t sub_100052AB0()
{
  return QuickAction.customIdentifier.getter();
}

uint64_t sub_100052AC0()
{
  return QuickAction.contactIdentifier.getter();
}

uint64_t sub_100052AD0()
{
  return QuickAction.standardProtocolURL.getter();
}

uint64_t sub_100052AE0()
{
  return QuickAction.useStandardProtocol.getter();
}

uint64_t sub_100052AF0()
{
  return QuickAction.init(from:)();
}

uint64_t sub_100052B00()
{
  return QuickAction.type.getter();
}

uint64_t sub_100052B10()
{
  return QuickAction.handle.getter();
}

uint64_t sub_100052B20()
{
  return QuickAction.bundleID.getter();
}

uint64_t sub_100052B30()
{
  return type metadata accessor for QuickAction();
}

uint64_t sub_100052B40()
{
  return dispatch thunk of PersonStatus.statusType.getter();
}

uint64_t sub_100052B50()
{
  return SelectPerson.callButton.getter();
}

uint64_t sub_100052B60()
{
  return SelectPerson.messageButton.getter();
}

uint64_t sub_100052B70()
{
  return SelectPerson.verticalLayoutDF.getter();
}

uint64_t sub_100052B80()
{
  return SelectPerson.verticalLayoutDT.getter();
}

uint64_t sub_100052B90()
{
  return SelectPerson.shouldShowButtons.getter();
}

uint64_t sub_100052BA0()
{
  return SelectPerson.person.getter();
}

uint64_t sub_100052BB0()
{
  return SelectPerson.init()();
}

uint64_t sub_100052BC0()
{
  return type metadata accessor for SelectPerson();
}

uint64_t sub_100052BD0()
{
  return static ContactFetcher.shared.getter();
}

uint64_t sub_100052BE0()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t sub_100052BF0()
{
  return static MetricTemplate.metricsEnabled.getter();
}

uint64_t sub_100052C00()
{
  return static MetricTemplate.displayTimeEnabled.getter();
}

uint64_t sub_100052C10()
{
  return static MetricTemplate.updateTimelineCount(for:)();
}

uint64_t sub_100052C20()
{
  return static StatusProvider.shared.getter();
}

uint64_t sub_100052C30()
{
  return type metadata accessor for StatusProvider();
}

uint64_t sub_100052C40()
{
  return type metadata accessor for QuickActionType();
}

uint64_t sub_100052C50()
{
  return type metadata accessor for ContactFormatter.Style();
}

uint64_t sub_100052C60()
{
  return ContactFormatter.init(style:fallback:)();
}

uint64_t sub_100052C70()
{
  return type metadata accessor for ContactFormatter();
}

uint64_t sub_100052C80()
{
  return dispatch thunk of ApplicationRecord.bundleIdentifier.getter();
}

uint64_t sub_100052C90()
{
  return ServerFeatureFlag.locationTriage.getter();
}

uint64_t sub_100052CA0()
{
  return static ServerFeatureFlag.shared.getter();
}

uint64_t sub_100052CB0()
{
  return type metadata accessor for ServerFeatureFlag();
}

uint64_t sub_100052CC0()
{
  return StatusPrioritizer.TimeLineEntrySingleItem.date.getter();
}

uint64_t sub_100052CD0()
{
  return StatusPrioritizer.TimeLineEntrySingleItem.score.getter();
}

uint64_t sub_100052CE0()
{
  return StatusPrioritizer.TimeLineEntrySingleItem.duration.getter();
}

uint64_t sub_100052CF0()
{
  return StatusPrioritizer.TimeLineEntrySingleItem.statuses.getter();
}

uint64_t sub_100052D00()
{
  return type metadata accessor for StatusPrioritizer.TimeLineEntrySingleItem();
}

uint64_t sub_100052D10()
{
  return StatusPrioritizer.TimeLineEntryMultipleItems.date.getter();
}

uint64_t sub_100052D20()
{
  return StatusPrioritizer.TimeLineEntryMultipleItems.items.getter();
}

uint64_t sub_100052D30()
{
  return StatusPrioritizer.TimeLineEntryMultipleItems.score.getter();
}

uint64_t sub_100052D40()
{
  return StatusPrioritizer.TimeLineEntryMultipleItems.duration.getter();
}

uint64_t sub_100052D50()
{
  return dispatch thunk of StatusPrioritizer.ranked(statuses:at:lockScreenCircular:)();
}

uint64_t sub_100052D60()
{
  return StatusPrioritizer.TimeLine.reloadDate.getter();
}

uint64_t sub_100052D70()
{
  return StatusPrioritizer.TimeLine.entries.getter();
}

uint64_t sub_100052D80()
{
  return dispatch thunk of StatusPrioritizer.timeline<A>(from:fromDate:interval:applying:lockScreenCircular:)();
}

uint64_t sub_100052D90()
{
  return dispatch thunk of StatusPrioritizer.timeline(statuses:fromDate:interval:lockScreenCircular:)();
}

uint64_t sub_100052DA0()
{
  return StatusPrioritizer.init()();
}

uint64_t sub_100052DB0()
{
  return type metadata accessor for StatusPrioritizer();
}

uint64_t sub_100052DC0()
{
  return DemoStatusProvider.init()();
}

uint64_t sub_100052DD0()
{
  return type metadata accessor for DemoStatusProvider();
}

uint64_t sub_100052DE0()
{
  return VerticalTextHelper.featureFlags.getter();
}

uint64_t sub_100052DF0()
{
  return dispatch thunk of VerticalTextHelper.isDeviceLanguageChineseOrJapanese()();
}

uint64_t sub_100052E00()
{
  return static VerticalTextHelper.shared.getter();
}

uint64_t sub_100052E10()
{
  return type metadata accessor for VerticalTextHelper();
}

uint64_t sub_100052E20()
{
  return PersonTypeAppEntity.displayString.getter();
}

uint64_t sub_100052E30()
{
  return static PersonTypeAppEntity.decodeContactID(for:)();
}

uint64_t sub_100052E40()
{
  return PersonTypeAppEntity.id.getter();
}

uint64_t sub_100052E50()
{
  return type metadata accessor for PersonTypeAppEntity();
}

uint64_t sub_100052E60()
{
  return LocationPersonStatus.formattedDateForTriage.getter();
}

uint64_t sub_100052E70()
{
  return type metadata accessor for LocationPersonStatus();
}

uint64_t sub_100052E80()
{
  return QuickActionAppHandle.url.getter();
}

uint64_t sub_100052E90()
{
  return type metadata accessor for QuickActionAppHandle();
}

uint64_t sub_100052EA0()
{
  return dispatch thunk of ContactFetcherProtocol.provideFeedbackForContactRecommendations(for:)();
}

uint64_t sub_100052EB0()
{
  return dispatch thunk of ContactFetcherProtocol.provideFeedbackForContactRecommendations(with:)();
}

uint64_t sub_100052EC0()
{
  return ContactFetcherProtocol.getContactImageData(for:size:locale:)();
}

uint64_t sub_100052ED0()
{
  return ContactFetcherProtocol.contactImage(for:locale:)();
}

uint64_t sub_100052EE0()
{
  return dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
}

uint64_t sub_100052EF0()
{
  return StatusProviderProtocol.fetchStatus(for:completion:)();
}

uint64_t sub_100052F00()
{
  return StatusProviderProtocol.fetchStatus(for:completion:)();
}

uint64_t sub_100052F10()
{
  return dispatch thunk of ContactFormatterProtocol.displayName(for:)();
}

uint64_t sub_100052F20()
{
  return dispatch thunk of IntentHandlingApplicationRegistry.applications(forIntentClass:)();
}

uint64_t sub_100052F30()
{
  return Person.description.getter();
}

uint64_t sub_100052F40()
{
  return Person.displayName.getter();
}

uint64_t sub_100052F50()
{
  return Person.preferredHandle(ofType:)();
}

uint64_t sub_100052F60()
{
  return Person.contactSearchURL.getter();
}

uint64_t sub_100052F70()
{
  return static Person.emptyContactSearchURL.getter();
}

uint64_t sub_100052F80()
{
  return Person.init(from:statuses:contactFormatter:)();
}

uint64_t sub_100052F90()
{
  return Person.contact.getter();
}

uint64_t sub_100052FA0()
{
  return Person.statuses.getter();
}

uint64_t sub_100052FB0()
{
  return type metadata accessor for Person();
}

uint64_t sub_100052FC0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100052FD0()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100052FE0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100052FF0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100053010()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100053020()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100053030()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100053040()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100053050()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100053060()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100053070()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_100053080()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_100053090()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t sub_1000530A0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000530B0()
{
  return static ButtonBorderShape.circle.getter();
}

uint64_t sub_1000530C0()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t sub_1000530D0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000530E0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000530F0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100053100()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_100053110()
{
  return EnvironmentValues.fontDefinition.getter();
}

uint64_t sub_100053120()
{
  return EnvironmentValues.fontDefinition.setter();
}

uint64_t sub_100053130()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100053140()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100053150()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_100053160()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_100053170()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_100053180()
{
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t sub_100053190()
{
  return EnvironmentValues.accessibilityEnabled.getter();
}

uint64_t sub_1000531A0()
{
  return EnvironmentValues.accessibilityEnabled.setter();
}

uint64_t sub_1000531B0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000531C0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000531D0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000531E0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000531F0()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100053200()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100053210()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100053220()
{
  return EnvironmentValues.widgetRenderingMode.setter();
}

uint64_t sub_100053230()
{
  return EnvironmentValues.widgetContentMargins.getter();
}

uint64_t sub_100053240()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100053250()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100053260()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100053270()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100053280()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_100053290()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1000532A0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000532B0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000532C0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000532D0()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000532E0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_1000532F0()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_100053300()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100053310()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t sub_100053320()
{
  return ContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_100053330()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_100053340()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100053350()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_100053360()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100053370()
{
  return WidgetConfiguration.disfavoredLocations(_:for:)();
}

uint64_t sub_100053380()
{
  return WidgetConfiguration._contentMarginsDisabled()();
}

uint64_t sub_100053390()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_1000533A0()
{
  return WidgetConfiguration.preferredBackgroundStyle(_:)();
}

uint64_t sub_1000533B0()
{
  return WidgetConfiguration.enableContentMarginsForFirstParty(_:)();
}

uint64_t sub_1000533C0()
{
  return static WidgetConfiguration._makeWidgetConfiguration(widget:inputs:)();
}

uint64_t sub_1000533D0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000533E0()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t sub_1000533F0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100053400()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100053410()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_100053420()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100053430()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100053440()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100053450()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100053460()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100053470()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_100053480()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100053490()
{
  return static Font.body.getter();
}

uint64_t sub_1000534A0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000534B0()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_1000534C0()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_1000534D0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000534E0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000534F0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_100053500()
{
  return Font.leading(_:)();
}

uint64_t sub_100053510()
{
  return static Font.caption2.getter();
}

uint64_t sub_100053520()
{
  return static Font.footnote.getter();
}

uint64_t sub_100053530()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_100053540()
{
  return Font.init(_:)();
}

uint64_t sub_100053550()
{
  return Link.init(destination:label:)();
}

uint64_t sub_100053560()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100053570()
{
  return static Text.WritingMode.verticalRightToLeft.getter();
}

uint64_t sub_100053580()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t sub_100053590()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000535A0()
{
  return Text.accessibilityLabel(_:)();
}

uint64_t sub_1000535B0()
{
  return Text.bold()();
}

uint64_t sub_1000535C0()
{
  return Text.font(_:)();
}

uint64_t sub_1000535D0()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t sub_1000535E0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000535F0()
{
  return Text.init(_:)();
}

uint64_t sub_100053600()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_100053610()
{
  return View.widgetURL(_:)();
}

uint64_t sub_100053620()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100053630()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100053640()
{
  return View.fontWeight(_:)();
}

uint64_t sub_100053650()
{
  return View.writingMode(_:)();
}

uint64_t sub_100053660()
{
  return View.drawingGroup(opaque:colorMode:)();
}

uint64_t sub_100053670()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100053680()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_100053690()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_1000536A0()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_1000536B0()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000536C0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1000536D0()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_1000536E0()
{
  return View.tracking(_:)();
}

uint64_t sub_1000536F0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_100053700()
{
  return static Color.blue.getter();
}

uint64_t sub_100053710()
{
  return static Color.black.getter();
}

uint64_t sub_100053720()
{
  return static Color.clear.getter();
}

uint64_t sub_100053730()
{
  return static Color.white.getter();
}

uint64_t sub_100053740()
{
  return Color.opacity(_:)();
}

uint64_t sub_100053750()
{
  return static Color.primary.getter();
}

uint64_t sub_100053760()
{
  return static Color.secondary.getter();
}

uint64_t sub_100053770()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_100053780()
{
  return Color.init(_:bundle:)();
}

uint64_t sub_100053790()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000537A0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000537B0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_1000537C0()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000537D0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000537E0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000537F0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100053800()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100053810()
{
  return Button.init<A>(intent:label:)();
}

uint64_t sub_100053820()
{
  return Button.init(action:label:)();
}

uint64_t sub_100053830()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_100053840()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100053850()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100053860()
{
  return static Binding.constant(_:)();
}

uint64_t sub_100053870()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100053880()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100053890()
{
  return Gradient.init(colors:)();
}

uint64_t sub_1000538A0()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1000538B0()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_1000538C0()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_1000538D0()
{
  return static Alignment.top.getter();
}

uint64_t sub_1000538E0()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000538F0()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_100053900()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_100053910()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_100053920()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_100053930()
{
  return static PeopleWidgetConstants.adjustmentForWidgetSuggester.getter();
}

uint64_t sub_100053940()
{
  return static PeopleWidgetConstants.statusBadgeSize.getter();
}

uint64_t sub_100053950()
{
  return static PeopleWidgetConstants.maxContactAvatarSize.getter();
}

uint64_t sub_100053960()
{
  return static PeopleWidgetConstants.defaultStatusForDisplay.getter();
}

uint64_t sub_100053970()
{
  return static PeopleWidgetConstants.minimumTimelineRelevance.getter();
}

uint64_t sub_100053980()
{
  return static PeopleWidgetConstants.statusBadgeAccessibilitySize.getter();
}

uint64_t sub_100053990()
{
  return static PersonInfo.urlForPerson(personInfo:)();
}

uint64_t sub_1000539A0()
{
  return PersonInfo.contactImage.getter();
}

uint64_t sub_1000539B0()
{
  return PersonInfo.textForLabel.getter();
}

uint64_t sub_1000539C0()
{
  return PersonInfo.statusForDisplay.getter();
}

uint64_t sub_1000539D0()
{
  return PersonInfo.person.getter();
}

uint64_t sub_1000539E0()
{
  return PersonInfo.init(person:contactImage:)();
}

uint64_t sub_1000539F0()
{
  return type metadata accessor for PersonInfo();
}

uint64_t sub_100053A00()
{
  return dispatch thunk of BadgeStatus.iconOffset.getter();
}

uint64_t sub_100053A10()
{
  return dispatch thunk of BadgeStatus.iconShadow.getter();
}

uint64_t sub_100053A20()
{
  return dispatch thunk of BadgeStatus.iconFontSize.getter();
}

uint64_t sub_100053A30()
{
  return dispatch thunk of BadgeStatus.iconBackground.getter();
}

uint64_t sub_100053A40()
{
  return dispatch thunk of BadgeStatus.iconForeground.getter();
}

uint64_t sub_100053A50()
{
  return dispatch thunk of BadgeStatus.useIconAsTextPrefix.getter();
}

uint64_t sub_100053A60()
{
  return dispatch thunk of BadgeStatus.icon.getter();
}

uint64_t sub_100053A70()
{
  return ContactImage.init(contactImageData:)();
}

uint64_t sub_100053A80()
{
  return ContactImage.avatarLuminance.getter();
}

uint64_t sub_100053A90()
{
  return ContactImage.avatarSaturation.getter();
}

uint64_t sub_100053AA0()
{
  return ContactImage.avatar.getter();
}

uint64_t sub_100053AB0()
{
  return type metadata accessor for ContactImage();
}

uint64_t sub_100053AC0()
{
  return PersonStatusSet.additionalBadges.getter();
}

uint64_t sub_100053AD0()
{
  return PersonStatusSet.text.getter();
}

uint64_t sub_100053AE0()
{
  return PersonStatusSet.badge.getter();
}

uint64_t sub_100053AF0()
{
  return type metadata accessor for PersonStatusSet();
}

uint64_t sub_100053B00()
{
  return static StatusCompatiblePicker.statusForDisplay(from:featureFlags:)();
}

uint64_t sub_100053B10()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100053B20()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t sub_100053B30()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100053B40()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_100053B50()
{
  return type metadata accessor for WidgetBackgroundStyle();
}

uint64_t sub_100053B60()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_100053B70()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_100053B80()
{
  return WidgetFamily.chsFamily.getter();
}

uint64_t sub_100053B90()
{
  return WidgetFamily.analyticSize.getter();
}

uint64_t sub_100053BA0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_100053BB0()
{
  return static WidgetLocation.iPhoneWidgetsOnMac.getter();
}

uint64_t sub_100053BC0()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_100053BD0()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100053BE0()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_100053BF0()
{
  return static TimelineReloadPolicy.atEnd.getter();
}

uint64_t sub_100053C00()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100053C10()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100053C20()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100053C40()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_100053C60()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_100053C70()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_100053C80()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_100053C90()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_100053CB0()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_100053CD0()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_100053CE0()
{
  return Timeline.entries.getter();
}

NSDictionary sub_100053CF0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100053D00()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100053D10()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100053D20()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100053D30()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053D40()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100053D50()
{
  return String.hash(into:)();
}

uint64_t sub_100053D60()
{
  return String.index(after:)();
}

BOOL sub_100053D70(Swift::Int maxCount)
{
  return String.isSuitableForVerticalLayout(maxCount:)(maxCount);
}

uint64_t sub_100053D80()
{
  return String.localized.getter();
}

uint64_t sub_100053D90()
{
  return String.trimToNil()().value._countAndFlagsBits;
}

void sub_100053DA0(Swift::String a1)
{
}

Swift::Int sub_100053DB0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100053DC0()
{
  return String.hashValue.getter();
}

uint64_t sub_100053DD0()
{
  return String.subscript.getter();
}

uint64_t sub_100053DE0()
{
  return String.subscript.getter();
}

uint64_t sub_100053DF0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100053E00()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100053E10()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100053E20()
{
  return Array.description.getter();
}

uint64_t sub_100053E30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100053E40()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100053E50()
{
  return Array.debugDescription.getter();
}

uint64_t sub_100053E60()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100053E70()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100053E80()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100053E90()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100053EA0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100053EB0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100053EC0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100053ED0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100053EE0()
{
  return Collection.expanded(toSize:placeholder:)();
}

uint64_t sub_100053EF0()
{
  return Collection<>.matrix(rowCount:placeholder:)();
}

uint64_t sub_100053F00()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100053F10()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100053F20()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100053F30()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100053F40()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_100053F50()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100053F60()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100053F70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100053F80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100053F90()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_100053FA0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100053FB0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100053FC0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100053FD0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_100053FE0(Swift::Int a1)
{
}

uint64_t sub_100053FF0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100054000()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100054010()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100054020()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100054030()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100054040()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100054050()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100054060()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100054070()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100054080()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100054090()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000540B0()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_1000540C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000540D0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000540E0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000540F0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100054100()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100054110()
{
  return Hasher._finalize()();
}

uint64_t sub_100054120()
{
  return _typeName(_:qualified:)();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return __AXSPrefersHorizontalTextLayout();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}