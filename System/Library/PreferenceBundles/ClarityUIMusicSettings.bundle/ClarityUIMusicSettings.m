void sub_3150(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_316C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = AXLogTemp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Error attempting to authenticate to access shared albums. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _loadPlaylists];
  }
}

id sub_3790(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadSpecifiers];
}

Class sub_3CFC(uint64_t a1)
{
  sub_3D54();
  Class result = objc_getClass("APApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_C250();
  }
  qword_14EE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_3D54()
{
  v1[0] = 0;
  if (!qword_14EE8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_3E50;
    v1[4] = &unk_10AD8;
    v1[5] = v1;
    long long v2 = off_10AC0;
    uint64_t v3 = 0;
    qword_14EE8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_14EE8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_3E50()
{
  uint64_t result = _sl_dlopen();
  qword_14EE8 = result;
  return result;
}

Class sub_3EC4(uint64_t a1)
{
  sub_3D54();
  Class result = objc_getClass("APGuard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_C278();
  }
  qword_14EF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id CLCreatePrivacySpecifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 parentViewController];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    id v4 = v6;
  }
  int v7 = +[PSSpecifier emptyGroupSpecifier];
  [v7 setProperty:@"PrivacyDisplay" forKey:PSIDKey];
  [v7 setProperty:@"CLPrivacyLinkDisplayView" forKey:PSHeaderCellClassGroupKey];
  [v7 setProperty:v3 forKey:CLFPrivacyLinkBundleIdentifier];
  objc_initWeak(&location, v4);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_40D0;
  v13 = &unk_10B00;
  objc_copyWeak(&v14, &location);
  id v8 = objc_retainBlock(&v10);
  objc_msgSend(v7, "setProperty:forKey:", v8, CLFPrivacyCallbackIdentifier, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void sub_40B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_40D0(uint64_t a1, void *a2)
{
  long long v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addChildViewController:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v3 didMoveToParentViewController:v5];
}

id sub_4314(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) name];
  id v5 = [*(id *)(a1 + 32) curatorName];
  id v3 = __AXStringForVariables();

  return v3;
}

uint64_t sub_439C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_C340();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6E04(&qword_14C40);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6E04(&qword_14C48);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65AC((uint64_t)v7);
  char v14 = sub_C330();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v14) {
    uint64_t v15 = sub_C3F0();
  }
  else {
    uint64_t v15 = sub_C400();
  }
  *(void *)v10 = v15;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v16 = sub_6E04(&qword_14C50);
  sub_45BC(v2, (uint64_t)&v10[*(int *)(v16 + 44)]);
  sub_93EC(&qword_14C58, &qword_14C40);
  sub_C550();
  sub_9430((uint64_t)v10, &qword_14C40);
  return sub_89A4((uint64_t)v13, a1, &qword_14C48);
}

uint64_t sub_45BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v35 = sub_C340();
  uint64_t v3 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6E04(&qword_14C60);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v29 - v11;
  __chkstk_darwin(v10);
  char v14 = (char *)&v29 - v13;
  uint64_t v15 = sub_6E04(&qword_14C68);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v29 - v19;
  sub_494C((uint64_t)&v29 - v19);
  if (qword_14AA0 != -1) {
    swift_once();
  }
  sub_C5B0();
  sub_C310();
  uint64_t v34 = v37;
  int v33 = v38;
  uint64_t v32 = v39;
  int v31 = v40;
  uint64_t v29 = v42;
  uint64_t v30 = v41;
  uint64_t v21 = sub_C420();
  sub_65AC((uint64_t)v5);
  char v22 = sub_C330();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v35);
  *(void *)uint64_t v12 = v21;
  *((void *)v12 + 1) = 0;
  v12[16] = (v22 & 1) == 0;
  uint64_t v23 = sub_6E04(&qword_14C70);
  sub_4E08(a1, (uint64_t)&v12[*(int *)(v23 + 44)]);
  sub_89A4((uint64_t)v12, (uint64_t)v14, &qword_14C60);
  sub_948C((uint64_t)v20, (uint64_t)v18, &qword_14C68);
  sub_948C((uint64_t)v14, (uint64_t)v9, &qword_14C60);
  uint64_t v24 = v36;
  sub_948C((uint64_t)v18, v36, &qword_14C68);
  uint64_t v25 = sub_6E04(&qword_14C78);
  uint64_t v26 = v24 + *(int *)(v25 + 48);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 1;
  *(void *)(v26 + 16) = v34;
  *(unsigned char *)(v26 + 24) = v33;
  *(void *)(v26 + 32) = v32;
  *(unsigned char *)(v26 + 40) = v31;
  uint64_t v27 = v29;
  *(void *)(v26 + 48) = v30;
  *(void *)(v26 + 56) = v27;
  sub_948C((uint64_t)v9, v24 + *(int *)(v25 + 64), &qword_14C60);
  sub_9430((uint64_t)v14, &qword_14C60);
  sub_9430((uint64_t)v20, &qword_14C68);
  sub_9430((uint64_t)v9, &qword_14C60);
  return sub_9430((uint64_t)v18, &qword_14C68);
}

uint64_t sub_494C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v41 = sub_C350();
  __chkstk_darwin(v41);
  uint64_t v42 = (uint64_t *)((char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = sub_6E04(&qword_14CB8) - 8;
  __chkstk_darwin(v40);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PlaylistRow.Placeholder(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6E04(&qword_14CC0);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t (**)@<X0>(uint64_t *@<X8>))((char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_6E04(&qword_14CC8);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_6E04(&qword_14CD0) - 8;
  __chkstk_darwin(v39);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for PlaylistRow(0);
  sub_8C08(v1 + *(int *)(v38 + 24), (uint64_t)v8, type metadata accessor for PlaylistRow.Placeholder);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  sub_8B24((uint64_t)v8, v20 + v19);
  uint64_t v21 = sub_C5B0();
  uint64_t v23 = v22;
  sub_5AE4((uint64_t)v4);
  uint64_t v24 = (uint64_t *)&v4[*(int *)(v40 + 44)];
  *uint64_t v24 = v21;
  v24[1] = v23;
  uint64_t v25 = (uint64_t)v18;
  sub_948C((uint64_t)v4, (uint64_t)v12 + *(int *)(v10 + 44), &qword_14CB8);
  *uint64_t v12 = sub_8B88;
  v12[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v20;
  sub_9430((uint64_t)v4, &qword_14CB8);
  sub_948C((uint64_t)v12, (uint64_t)v16, &qword_14CC0);
  uint64_t v26 = &v16[*(int *)(v14 + 44)];
  *(void *)uint64_t v26 = 0x3FF0000000000000;
  *((_WORD *)v26 + 4) = 0;
  sub_9430((uint64_t)v12, &qword_14CC0);
  sub_C5B0();
  sub_C310();
  sub_948C((uint64_t)v16, (uint64_t)v18, &qword_14CC8);
  uint64_t v27 = &v18[*(int *)(v39 + 44)];
  long long v28 = v45;
  *(_OWORD *)uint64_t v27 = v44;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v46;
  sub_9430((uint64_t)v16, &qword_14CC8);
  if (qword_14AA8 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_152B8;
  uint64_t v30 = v42;
  int v31 = (char *)v42 + *(int *)(v41 + 20);
  uint64_t v32 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v33 = sub_C410();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v31, v32, v33);
  *uint64_t v30 = v29;
  v30[1] = v29;
  uint64_t v34 = sub_6E04(&qword_14C68);
  uint64_t v35 = v43;
  uint64_t v36 = v43 + *(int *)(v34 + 36);
  sub_8C08((uint64_t)v30, v36, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v36 + *(int *)(sub_6E04(&qword_14CD8) + 36)) = 256;
  sub_948C(v25, v35, &qword_14CD0);
  sub_8C70((uint64_t)v30);
  return sub_9430(v25, &qword_14CD0);
}

uint64_t sub_4E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v120 = a2;
  uint64_t v118 = sub_6E04(&qword_14C80);
  uint64_t v117 = *(void *)(v118 - 8);
  uint64_t v3 = __chkstk_darwin(v118);
  v109 = (char *)v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v108 = (uint64_t)v107 - v5;
  uint64_t v6 = sub_6E04(&qword_14C88);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v119 = (uint64_t)v107 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v116 = (char *)v107 - v9;
  uint64_t v123 = sub_C340();
  uint64_t v128 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  uint64_t v122 = (uint64_t)v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6E04(&qword_14C90);
  uint64_t v124 = *(void *)(v11 - 8);
  uint64_t v125 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  v121 = (char *)v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v107 - v14;
  uint64_t v110 = sub_6E04(&qword_14C98);
  v114 = *(void (***)(char *, uint64_t, __n128))(v110 - 8);
  __chkstk_darwin(v110);
  v113 = (double *)((char *)v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_6E04(&qword_14CA0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v115 = (uint64_t)v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v112 = (uint64_t)v107 - v21;
  __chkstk_darwin(v20);
  uint64_t v127 = (uint64_t)v107 - v22;
  uint64_t v23 = type metadata accessor for PlaylistRow(0);
  uint64_t v24 = *(int *)(v23 + 20);
  uint64_t v126 = a1;
  uint64_t v111 = a1 + v24;
  v129 = (void *)sub_C640();
  v130 = v25;
  v107[1] = sub_8940();
  uint64_t v26 = sub_C4D0();
  uint64_t v28 = v27;
  char v30 = v29;
  if (qword_14AB0 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_C4C0();
  uint64_t v33 = v32;
  char v35 = v34;
  sub_8994(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  if (qword_14AB8 != -1) {
    swift_once();
  }
  char v36 = v35 & 1;
  uint64_t v37 = sub_C4B0();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  char v43 = v42 & 1;
  sub_8994(v31, v33, v36);
  swift_bridgeObjectRelease();
  v129 = (void *)v37;
  v130 = (void *)v39;
  char v131 = v43;
  uint64_t v132 = v41;
  sub_C540();
  sub_8994(v37, v39, v43);
  swift_bridgeObjectRelease();
  id v44 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  [v44 lineHeight];
  double v46 = v45;

  v47 = (double *)(v126 + *(int *)(v23 + 28));
  v48 = (char *)v113;
  if (*v47 < v46 + 10.0 && qword_14AA0 != -1) {
    swift_once();
  }
  v129 = &type metadata for Text;
  v130 = &protocol witness table for Text;
  uint64_t v49 = 1;
  swift_getOpaqueTypeConformance2();
  uint64_t v50 = v125;
  sub_C530();
  v51 = *(void (***)(char *, uint64_t, __n128))(v124 + 8);
  ((void (*)(char *, uint64_t))v51)(v15, v50);
  uint64_t v52 = v122;
  sub_65AC(v122);
  char v53 = sub_C330();
  uint64_t v54 = v128 + 8;
  v55 = *(void (**)(uint64_t, uint64_t))(v128 + 8);
  v55(v52, v123);
  if (v53) {
    double v56 = v47[1];
  }
  else {
    double v56 = 0.0;
  }
  uint64_t v57 = v110;
  sub_C5B0();
  char v58 = (v53 & 1) == 0;
  uint64_t v59 = v112;
  __n128 v60 = sub_58F8(0.0, 1, 0.0, 1, 0.0, 1, v56, v58, v112, 0.0, 1, 0.0, 1);
  v114[1](v48, v57, v60);
  sub_89A4(v59, v127, &qword_14CA0);
  uint64_t v61 = sub_C620();
  if (v62)
  {
    v114 = v51;
    v113 = v47;
    uint64_t v128 = v54;
    v129 = (void *)v61;
    v130 = v62;
    uint64_t v63 = sub_C4D0();
    uint64_t v65 = v64;
    char v67 = v66;
    if (qword_14AC0 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_C4C0();
    uint64_t v70 = v69;
    char v72 = v71;
    sub_8994(v63, v65, v67 & 1);
    swift_bridgeObjectRelease();
    if (qword_14AC8 != -1) {
      swift_once();
    }
    char v73 = v72 & 1;
    uint64_t v74 = sub_C4B0();
    uint64_t v76 = v75;
    uint64_t v78 = v77;
    char v80 = v79 & 1;
    sub_8994(v68, v70, v73);
    swift_bridgeObjectRelease();
    v129 = (void *)v74;
    v130 = (void *)v76;
    char v131 = v80;
    uint64_t v132 = v78;
    sub_C540();
    sub_8994(v74, v76, v80);
    swift_bridgeObjectRelease();
    char v81 = sub_C450();
    uint64_t v82 = v122;
    sub_65AC(v122);
    char v83 = sub_C330();
    v55(v82, v123);
    uint64_t v84 = (uint64_t)v116;
    v85 = v114;
    if ((v83 & 1) != 0 && qword_14AA0 != -1) {
      swift_once();
    }
    sub_C300();
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    uint64_t v94 = v125;
    v95 = v109;
    v96 = v121;
    (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v109, v121, v125);
    uint64_t v97 = v118;
    v98 = &v95[*(int *)(v118 + 36)];
    char *v98 = v81;
    *((void *)v98 + 1) = v87;
    *((void *)v98 + 2) = v89;
    *((void *)v98 + 3) = v91;
    *((void *)v98 + 4) = v93;
    v98[40] = 0;
    ((void (*)(char *, uint64_t))v85)(v96, v94);
    uint64_t v99 = (uint64_t)v95;
    uint64_t v100 = v108;
    sub_89A4(v99, v108, &qword_14C80);
    sub_89A4(v100, v84, &qword_14C80);
    uint64_t v49 = 0;
  }
  else
  {
    uint64_t v97 = v118;
    uint64_t v84 = (uint64_t)v116;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56))(v84, v49, 1, v97);
  uint64_t v101 = v127;
  uint64_t v102 = v115;
  sub_948C(v127, v115, &qword_14CA0);
  uint64_t v103 = v119;
  sub_948C(v84, v119, &qword_14C88);
  uint64_t v104 = v120;
  sub_948C(v102, v120, &qword_14CA0);
  uint64_t v105 = sub_6E04(&qword_14CB0);
  sub_948C(v103, v104 + *(int *)(v105 + 48), &qword_14C88);
  sub_9430(v84, &qword_14C88);
  sub_9430(v101, &qword_14CA0);
  sub_9430(v103, &qword_14C88);
  return sub_9430(v102, &qword_14CA0);
}

__n128 sub_58F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_C770();
    uint64_t v23 = (void *)sub_C440();
    sub_C2F0();
  }
  sub_C360();
  uint64_t v24 = sub_6E04(&qword_14C98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_6E04(&qword_14CA0) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_5AE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_C2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6E04(&qword_14CE0);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = sub_C5F0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlaylistRow(0);
  sub_C650();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_9430((uint64_t)v10, &qword_14CE0);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v8, v14, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    sub_C2D0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
    uint64_t v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v15, 1, v2);
}

uint64_t sub_5DAC()
{
  return sub_C520();
}

uint64_t sub_5DCC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_6E04(&qword_14AD8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_C600();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_948C(v1, (uint64_t)v4, &qword_14AD8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    uint64_t v12 = 0x6F6E2E636973756DLL;
    sub_9430((uint64_t)v4, &qword_14AD8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 == enum case for Playlist.Variant.smart(_:))
    {
      uint64_t v12 = 0x7061687372616567;
    }
    else if (v13 == enum case for Playlist.Variant.genius(_:))
    {
      uint64_t v12 = 0x7375696E6567;
    }
    else if (v13 == enum case for Playlist.Variant.folder(_:))
    {
      uint64_t v12 = 0x7265646C6F66;
    }
    else
    {
      uint64_t v12 = 0x6F6E2E636973756DLL;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return v12;
}

uint64_t sub_6090@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v37 = sub_6E04(&qword_14CE8) - 8;
  __chkstk_darwin(v37);
  uint64_t v36 = (uint64_t)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_6E04(&qword_14CF0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6E04(&qword_14CF8);
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_6E04(&qword_14D00);
  __chkstk_darwin(v33);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6E04(&qword_14D08);
  __chkstk_darwin(v10 - 8);
  long long v32 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C320();
  sub_C320();
  id v12 = [self tertiarySystemFillColor];
  uint64_t v31 = sub_C590();
  sub_5DCC();
  uint64_t v13 = sub_C5A0();
  uint64_t v14 = sub_C560();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = sub_C480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 1, 1, v16);
  uint64_t v17 = sub_C4A0();
  sub_9430((uint64_t)v4, &qword_14CF0);
  uint64_t v18 = swift_getKeyPath();
  uint64_t v39 = v13;
  uint64_t v40 = KeyPath;
  uint64_t v41 = v14;
  uint64_t v42 = v18;
  uint64_t v43 = v17;
  sub_C490();
  sub_6E04(&qword_14D10);
  sub_91D8();
  sub_C500();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v20 = v34;
  uint64_t v19 = v35;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v9, v7, v35);
  *(void *)&v9[*(int *)(v33 + 36)] = 0x3FF0000000000000;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v19);
  sub_9318();
  uint64_t v21 = (uint64_t)v32;
  sub_C510();
  sub_9430((uint64_t)v9, &qword_14D00);
  uint64_t v22 = sub_C5B0();
  uint64_t v24 = v23;
  uint64_t v25 = v36;
  sub_948C(v21, v36, &qword_14D08);
  uint64_t v26 = (uint64_t *)(v25 + *(int *)(v37 + 44));
  *uint64_t v26 = v22;
  v26[1] = v24;
  uint64_t v27 = sub_6E04(&qword_14D68);
  long long v28 = v38;
  sub_948C(v25, (uint64_t)v38 + *(int *)(v27 + 36), &qword_14CE8);
  *long long v28 = v31;
  swift_retain();
  sub_9430(v25, &qword_14CE8);
  sub_9430(v21, &qword_14D08);
  return swift_release();
}

int64x2_t sub_64F8()
{
  int64x2_t result = vdupq_n_s64(0x4050000000000000uLL);
  xmmword_152A0 = (__int128)result;
  return result;
}

void sub_650C()
{
  qword_152B0 = 0x4028000000000000;
}

void sub_651C()
{
  qword_152B8 = 0x4024000000000000;
}

uint64_t sub_652C()
{
  uint64_t result = sub_C470();
  qword_152C0 = result;
  return result;
}

uint64_t sub_654C()
{
  uint64_t result = sub_C570();
  qword_152C8 = result;
  return result;
}

uint64_t sub_656C()
{
  uint64_t result = sub_C460();
  qword_152D0 = result;
  return result;
}

uint64_t sub_658C()
{
  uint64_t result = sub_C580();
  qword_152D8 = result;
  return result;
}

uint64_t sub_65AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_C3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6E04(&qword_14AD0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_948C(v2, (uint64_t)v10, &qword_14AD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_C340();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_C770();
    uint64_t v14 = sub_C440();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_8CCC(0x5463696D616E7944, 0xEF657A6953657079, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_C3D0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_6840(uint64_t a1, uint64_t a2)
{
  return sub_69AC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_6858(uint64_t a1, id *a2)
{
  uint64_t result = sub_C690();
  *a2 = 0;
  return result;
}

uint64_t sub_68D0(uint64_t a1, id *a2)
{
  char v3 = sub_C6A0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_6950@<X0>(void *a1@<X8>)
{
  sub_C6B0();
  NSString v2 = sub_C680();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_6994(uint64_t a1, uint64_t a2)
{
  return sub_69AC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_69AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_C6B0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_69F0()
{
  sub_C6B0();
  sub_C6C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_6A44()
{
  sub_C6B0();
  sub_C7F0();
  sub_C6C0();
  Swift::Int v0 = sub_C800();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_6AB8()
{
  uint64_t v0 = sub_C6B0();
  uint64_t v2 = v1;
  if (v0 == sub_C6B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_C7E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_6B44@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_C680();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_6B8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C6B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t *sub_6BB8(uint64_t *a1, uint64_t *a2, int *a3)
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
    sub_6E04(&qword_14AD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_C340();
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
    uint64_t v12 = sub_C660();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_C600();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = sub_6E04(&qword_14AD8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_6E04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6E48(uint64_t a1, uint64_t a2)
{
  sub_6E04(&qword_14AD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_C340();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_C660();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_C600();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

void *sub_6FC0(void *a1, void *a2, int *a3)
{
  sub_6E04(&qword_14AD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_C340();
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
  uint64_t v10 = sub_C660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_C600();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_6E04(&qword_14AD8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  return a1;
}

void *sub_71BC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_9430((uint64_t)a1, &qword_14AD0);
    sub_6E04(&qword_14AD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_C340();
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
  uint64_t v10 = sub_C660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_C600();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_11;
  }
  if (v18)
  {
LABEL_11:
    uint64_t v19 = sub_6E04(&qword_14AD8);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_12:
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  return a1;
}

char *sub_7444(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_6E04(&qword_14AD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_C340();
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
  uint64_t v11 = sub_C660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_C600();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_6E04(&qword_14AD8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_7648(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_9430((uint64_t)a1, &qword_14AD0);
    uint64_t v6 = sub_6E04(&qword_14AD0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_C340();
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
  uint64_t v11 = sub_C660();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_C600();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_10;
  }
  if (v19)
  {
LABEL_10:
    uint64_t v20 = sub_6E04(&qword_14AD8);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_11:
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

uint64_t sub_78C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_78DC);
}

uint64_t sub_78DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_6E04(&qword_14AE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_C660();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for PlaylistRow.Placeholder(0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t type metadata accessor for PlaylistRow.Placeholder(uint64_t a1)
{
  return sub_7BDC(a1, qword_14BE8);
}

uint64_t sub_7A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7A60);
}

uint64_t sub_7A60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_6E04(&qword_14AE0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_C660();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for PlaylistRow.Placeholder(0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for PlaylistRow(uint64_t a1)
{
  return sub_7BDC(a1, (uint64_t *)&unk_14B40);
}

uint64_t sub_7BDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_7C14()
{
  sub_7D80(319, &qword_14B50, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_C660();
    if (v1 <= 0x3F)
    {
      sub_7D80(319, (unint64_t *)&unk_14B58, (uint64_t (*)(uint64_t))&type metadata accessor for Playlist.Variant, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_7D80(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t *sub_7DE4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(sub_6E04(&qword_14AD8) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_C600();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_7F3C(uint64_t a1)
{
  uint64_t v2 = sub_C600();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_800C(void *a1, const void *a2)
{
  uint64_t v4 = sub_C600();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = sub_6E04(&qword_14AD8);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_811C(void *a1, void *a2)
{
  uint64_t v4 = sub_C600();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_6E04(&qword_14AD8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_8298(void *a1, const void *a2)
{
  uint64_t v4 = sub_C600();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = sub_6E04(&qword_14AD8);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_83A8(void *a1, void *a2)
{
  uint64_t v4 = sub_C600();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = sub_6E04(&qword_14AD8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_8524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8538);
}

uint64_t sub_8538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E04(&qword_14AD8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_85A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_85BC);
}

uint64_t sub_85BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E04(&qword_14AD8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_8630()
{
  sub_7D80(319, (unint64_t *)&unk_14B58, (uint64_t (*)(uint64_t))&type metadata accessor for Playlist.Variant, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_8700(uint64_t a1)
{
  uint64_t v2 = sub_884C(&qword_14D78, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_884C(&qword_14D80, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_87BC()
{
  return sub_884C(&qword_14C28, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_8804()
{
  return sub_884C(&qword_14C30, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_884C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_8894()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_88B0()
{
  return sub_884C(&qword_14C38, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_88F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_8940()
{
  unint64_t result = qword_14CA8;
  if (!qword_14CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14CA8);
  }
  return result;
}

uint64_t sub_8994(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_89A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6E04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_8A08()
{
  uint64_t v1 = *(void *)(type metadata accessor for PlaylistRow.Placeholder(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_C600();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_8B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlaylistRow.Placeholder(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8B88@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PlaylistRow.Placeholder(0);

  return sub_6090(a1);
}

uint64_t sub_8C08(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_8C70(uint64_t a1)
{
  uint64_t v2 = sub_C350();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_8CCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_8DA0(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_9540((uint64_t)v12, *a3);
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
      sub_9540((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_94F0((uint64_t)v12);
  return v7;
}

unint64_t sub_8DA0(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_8EA0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_C7B0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_8EA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_8F38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_903C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_903C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_8F38(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_8FD4(v2, 0);
      unint64_t result = (void *)sub_C7A0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_C6D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_8FD4(uint64_t a1, uint64_t a2)
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
  sub_6E04(&qword_14D70);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_903C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_6E04(&qword_14D70);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_9128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C390();
  *a1 = result;
  return result;
}

uint64_t sub_9154()
{
  return sub_C3A0();
}

uint64_t sub_9180@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C3B0();
  *a1 = result;
  return result;
}

uint64_t sub_91AC()
{
  return sub_C3C0();
}

unint64_t sub_91D8()
{
  unint64_t result = qword_14D18;
  if (!qword_14D18)
  {
    sub_88F8(&qword_14D10);
    sub_9278();
    sub_93EC(&qword_14D40, &qword_14D48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14D18);
  }
  return result;
}

unint64_t sub_9278()
{
  unint64_t result = qword_14D20;
  if (!qword_14D20)
  {
    sub_88F8(&qword_14D28);
    sub_93EC(&qword_14D30, &qword_14D38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14D20);
  }
  return result;
}

unint64_t sub_9318()
{
  unint64_t result = qword_14D50;
  if (!qword_14D50)
  {
    sub_88F8(&qword_14D00);
    sub_88F8(&qword_14D10);
    sub_91D8();
    swift_getOpaqueTypeConformance2();
    sub_93EC(&qword_14D58, &qword_14D60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14D50);
  }
  return result;
}

uint64_t sub_93EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_88F8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9430(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6E04(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_948C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6E04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_94F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_9540(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

__n128 sub_95A0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_95B0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_95D0(uint64_t result, int a2, int a3)
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

void sub_960C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_9658()
{
  unint64_t result = qword_14D90;
  if (!qword_14D90)
  {
    sub_88F8(&qword_14C48);
    sub_93EC(&qword_14C58, &qword_14C40);
    sub_884C(&qword_14D98, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14D90);
  }
  return result;
}

uint64_t sub_9780()
{
  v1[2] = v0;
  uint64_t v2 = sub_6E04(&qword_14DD8);
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  void v1[6] = swift_task_alloc();
  sub_6E04(&qword_14DE0);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_6E04(&qword_14DE8);
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  sub_C710();
  v1[12] = sub_C700();
  uint64_t v5 = sub_C6F0();
  v1[13] = v5;
  v1[14] = v4;
  return _swift_task_switch(sub_9928, v5, v4);
}

uint64_t sub_9928()
{
  sub_C660();
  sub_C5D0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_99E0;
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MusicLibraryRequest.response()(v2, v3);
}

uint64_t sub_99E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_9D6C;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_9B08;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_9B08()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = sub_6E04(&qword_14DF0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = v0[7];
  sub_948C(v0[8], v3, &qword_14DE0);
  uint64_t v4 = sub_6E04(&qword_14DF0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_9430(v0[7], &qword_14DE0);
  }
  else
  {
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v9 = v0[4];
    uint64_t v8 = v0[5];
    uint64_t v11 = v0[2];
    uint64_t v10 = v0[3];
    sub_C5E0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v6, v8, v10);
    id v12 = [objc_allocWithZone((Class)NSMutableArray) init];
    sub_B1E4(v6, v12);

    uint64_t v13 = *(void **)(v11 + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists);
    *(void *)(v11 + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists) = v12;

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v10);
  }
  uint64_t v15 = v0[10];
  uint64_t v14 = v0[11];
  uint64_t v16 = v0[9];
  sub_9430(v0[8], &qword_14DE0);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_9D6C()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = sub_6E04(&qword_14DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = v0[7];
  sub_948C(v0[8], v3, &qword_14DE0);
  uint64_t v4 = sub_6E04(&qword_14DF0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_9430(v0[7], &qword_14DE0);
  }
  else
  {
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v9 = v0[4];
    uint64_t v8 = v0[5];
    uint64_t v11 = v0[2];
    uint64_t v10 = v0[3];
    sub_C5E0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v6, v8, v10);
    id v12 = [objc_allocWithZone((Class)NSMutableArray) init];
    sub_B1E4(v6, v12);

    uint64_t v13 = *(void **)(v11 + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists);
    *(void *)(v11 + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists) = v12;

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v10);
  }
  uint64_t v15 = v0[10];
  uint64_t v14 = v0[11];
  uint64_t v16 = v0[9];
  sub_9430(v0[8], &qword_14DE0);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_A138(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_C710();
  v2[4] = sub_C700();
  uint64_t v4 = sub_C6F0();
  return _swift_task_switch(sub_A1D0, v4, v3);
}

uint64_t sub_A1D0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_A280;
  return sub_9780();
}

uint64_t sub_A280()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

unint64_t sub_A3B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6E04(&qword_14E18);
  uint64_t v2 = sub_C7C0();
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
    sub_948C(v6, (uint64_t)&v13, &qword_14E20);
    uint64_t v7 = v13;
    unint64_t result = sub_AFD8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_B960(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_A4EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_6E04(&qword_14AD8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_C660();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(v10, a1 + OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_playlist, v7);
  *a2 = swift_getKeyPath();
  sub_6E04(&qword_14AD0);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (int *)type metadata accessor for PlaylistRow(0);
  uint64_t v13 = v12[7];
  if (qword_14A98 != -1) {
    swift_once();
  }
  *(_OWORD *)((char *)a2 + v13) = xmmword_152A0;
  v11((char *)a2 + v12[5], (uint64_t)v10, v7);
  sub_C610();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_BEF0((uint64_t)v6, (uint64_t)a2 + v12[6]);
}

id sub_A990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CLMInterfaceHelper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CLMInterfaceHelper()
{
  return self;
}

uint64_t sub_A9F8(uint64_t a1)
{
  uint64_t v2 = sub_C340();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_C380();
}

uint64_t sub_AAC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_BF58;
  return v6();
}

uint64_t sub_AB8C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_BF58;
  return v7();
}

uint64_t sub_AC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_C730();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_C720();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_9430(a1, &qword_14E28);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_C6F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_AE04(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_AEE0;
  return v6(a1);
}

uint64_t sub_AEE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_AFD8(uint64_t a1)
{
  sub_C6B0();
  sub_C7F0();
  sub_C6C0();
  Swift::Int v2 = sub_C800();
  swift_bridgeObjectRelease();

  return sub_B06C(a1, v2);
}

unint64_t sub_B06C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_C6B0();
    uint64_t v8 = v7;
    if (v6 == sub_C6B0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_C7E0();
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
          uint64_t v13 = sub_C6B0();
          uint64_t v15 = v14;
          if (v13 == sub_C6B0() && v15 == v16) {
            break;
          }
          char v18 = sub_C7E0();
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

uint64_t sub_B1E4(uint64_t a1, void *a2)
{
  uint64_t v55 = sub_C660();
  uint64_t v49 = *(void (***)(char *, uint64_t))(v55 - 8);
  uint64_t v4 = __chkstk_darwin(v55);
  uint64_t v54 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v48 - v7;
  __chkstk_darwin(v6);
  uint64_t v59 = (char *)&v48 - v9;
  uint64_t v10 = sub_6E04(&qword_14DD8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_6E04(&qword_14DF8);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = (void (**)(char *, uint64_t))v11;
  double v56 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v57 = v11 + 16;
  v56(v13, a1, v10);
  sub_93EC(&qword_14E00, &qword_14DD8);
  char v58 = v13;
  sub_C6E0();
  char v18 = &v17[*(int *)(v15 + 44)];
  uint64_t v19 = (uint64_t)v17;
  uint64_t v20 = sub_93EC(&qword_14E08, &qword_14DD8);
  uint64_t v21 = *(void *)v18;
  sub_C740();
  if (v21 != v62[0])
  {
    uint64_t v22 = v49;
    ++v51;
    uint64_t v52 = (void (**)(char *))(v49 + 2);
    ++v49;
    uint64_t v50 = (void (**)(char *, char *, uint64_t))(v22 + 4);
    char v53 = a2;
    uint64_t v60 = v20;
    uint64_t v63 = v19;
    do
    {
      uint64_t v23 = (void (*)(uint64_t *, void))sub_C760();
      uint64_t v24 = *v52;
      uint64_t v25 = v59;
      uint64_t v26 = v55;
      (*v52)(v59);
      v23(v62, 0);
      uint64_t v27 = v58;
      v56(v58, v63, v10);
      sub_C750();
      (*v51)(v27, v10);
      long long v28 = v8;
      (*v50)(v8, v25, v26);
      long long v29 = v54;
      ((void (*)(char *, char *, uint64_t))v24)(v54, v28, v26);
      uint64_t v30 = v28;
      uint64_t v31 = (objc_class *)type metadata accessor for CLMPlaylist();
      long long v32 = (char *)objc_allocWithZone(v31);
      ((void (*)(char *, char *, uint64_t))v24)(&v32[OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_playlist], v29, v26);
      uint64_t v33 = v32;
      uint64_t v34 = sub_C630();
      uint64_t v35 = (uint64_t *)&v33[OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_musicItemID];
      *uint64_t v35 = v34;
      v35[1] = v36;
      uint64_t v37 = sub_C640();
      uint64_t v38 = (uint64_t *)&v33[OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_name];
      *uint64_t v38 = v37;
      v38[1] = v39;
      uint64_t v40 = sub_C620();
      uint64_t v41 = (uint64_t *)&v33[OBJC_IVAR____TtC22ClarityUIMusicSettings11CLMPlaylist_curatorName];
      *uint64_t v41 = v40;
      v41[1] = v42;

      v61.receiver = v33;
      v61.super_class = v31;
      uint64_t v43 = v53;
      id v44 = objc_msgSendSuper2(&v61, "init");
      double v45 = *v49;
      (*v49)(v29, v26);
      [v43 addObject:v44];

      v45(v30, v26);
      uint64_t v46 = *(void *)v18;
      sub_C740();
      uint64_t v8 = v30;
      uint64_t v19 = v63;
    }
    while (v46 != v62[0]);
  }
  return sub_9430(v19, &qword_14DF8);
}

_OWORD *sub_B960(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_B970()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_B9B0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_BA5C;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_14E30 + dword_14E30);
  return v5(v2, v3);
}

uint64_t sub_BA5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_BB54()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_BF58;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_14E40 + dword_14E40);
  return v6(v2, v3, v4);
}

uint64_t sub_BC18()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_BC58(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_BF58;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_14E50 + dword_14E50);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_BD24()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_BD5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_BA5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_14E60 + dword_14E60);
  return v6(a1, v4);
}

uint64_t sub_BE14@<X0>(uint64_t *a1@<X8>)
{
  return sub_A4EC(*(void *)(v1 + 16), a1);
}

uint64_t *sub_BE1C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_BE80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_BEC8()
{
  return sub_C370();
}

uint64_t sub_BEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E04(&qword_14AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_BFD4(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_C680();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

id sub_C070()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CLMPlaylist();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_C154()
{
  return type metadata accessor for CLMPlaylist();
}

uint64_t type metadata accessor for CLMPlaylist()
{
  uint64_t result = qword_14EC8;
  if (!qword_14EC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_C1A8()
{
  uint64_t result = sub_C660();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_C250()
{
  uint64_t v0 = abort_report_np();
  sub_C278(v0);
}

void sub_C278()
{
  abort_report_np();
  sub_C2A0(v0);
}

void sub_C2A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_C2B0()
{
  return URL.init(string:)();
}

uint64_t sub_C2C0()
{
  return type metadata accessor for URL();
}

uint64_t sub_C2D0()
{
  return ArtworkImage.init(_:)();
}

uint64_t sub_C2E0()
{
  return type metadata accessor for ArtworkImage();
}

uint64_t sub_C2F0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_C300()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_C310()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_C320()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_C330()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_C340()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_C350()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_C360()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_C370()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_C380()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_C390()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_C3A0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_C3B0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_C3C0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_C3D0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_C3E0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_C3F0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_C400()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_C410()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_C420()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_C430()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_C440()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_C450()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_C460()
{
  return static Font.subheadline.getter();
}

uint64_t sub_C470()
{
  return static Font.body.getter();
}

uint64_t sub_C480()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_C490()
{
  return static Font.Weight.light.getter();
}

uint64_t sub_C4A0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_C4B0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_C4C0()
{
  return Text.font(_:)();
}

uint64_t sub_C4D0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_C4E0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_C4F0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_C500()
{
  return View.fontWeight(_:)();
}

uint64_t sub_C510()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_C520()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_C530()
{
  return View.bodyHeadOutdent(_:)();
}

uint64_t sub_C540()
{
  return View.hyphenationFactor(_:)();
}

uint64_t sub_C550()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_C560()
{
  return static Color.accentColor.getter();
}

uint64_t sub_C570()
{
  return static Color.primary.getter();
}

uint64_t sub_C580()
{
  return static Color.secondary.getter();
}

uint64_t sub_C590()
{
  return Color.init(_:)();
}

uint64_t sub_C5A0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_C5B0()
{
  return static Alignment.center.getter();
}

uint64_t sub_C5D0()
{
  return MusicLibraryRequest.init()();
}

uint64_t sub_C5E0()
{
  return MusicLibraryResponse.items.getter();
}

uint64_t sub_C5F0()
{
  return type metadata accessor for Artwork();
}

uint64_t sub_C600()
{
  return type metadata accessor for Playlist.Variant();
}

uint64_t sub_C610()
{
  return Playlist.variant.getter();
}

uint64_t sub_C620()
{
  return Playlist.curatorName.getter();
}

uint64_t sub_C630()
{
  return Playlist.id.getter();
}

uint64_t sub_C640()
{
  return Playlist.name.getter();
}

uint64_t sub_C650()
{
  return Playlist.artwork.getter();
}

uint64_t sub_C660()
{
  return type metadata accessor for Playlist();
}

NSDictionary sub_C670()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_C680()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_C690()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_C6A0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_C6B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_C6C0()
{
  return String.hash(into:)();
}

Swift::Int sub_C6D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_C6E0()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_C6F0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_C700()
{
  return static MainActor.shared.getter();
}

uint64_t sub_C710()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_C720()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_C730()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_C740()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_C750()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_C760()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_C770()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_C780()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_C790()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_C7A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_C7B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_C7C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_C7E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_C7F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_C800()
{
  return Hasher._finalize()();
}

uint64_t AXLogTemp()
{
  return _AXLogTemp();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t __AXStringForVariables()
{
  return ___AXStringForVariables();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend__loadPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 _loadPlaylists];
}

id objc_msgSend__playlistsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _playlistsSpecifiers];
}

id objc_msgSend__showPlaylistSelectionAlert(void *a1, const char *a2, ...)
{
  return _[a1 _showPlaylistSelectionAlert];
}

id objc_msgSend__specifierForPlaylistEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierForPlaylistEntry:");
}

id objc_msgSend__tableView(void *a1, const char *a2, ...)
{
  return _[a1 _tableView];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticateForSubject_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateForSubject:completion:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 contentConfiguration];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_continueButtonEnablingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 continueButtonEnablingDelegate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_curatorName(void *a1, const char *a2, ...)
{
  return _[a1 curatorName];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didUpdateIsContinueButtonEnabledForController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateIsContinueButtonEnabledForController:");
}

id objc_msgSend_editPlaylistSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 editPlaylistSpecifier];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_interfaceHelper(void *a1, const char *a2, ...)
{
  return _[a1 interfaceHelper];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_loadPlaylistsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPlaylistsWithCompletionHandler:");
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_makePlaylistRowCellContentForPlaylistEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makePlaylistRowCellContentForPlaylistEntry:");
}

id objc_msgSend_musicItemID(void *a1, const char *a2, ...)
{
  return _[a1 musicItemID];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_playlistEntryForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistEntryForSpecifier:");
}

id objc_msgSend_playlists(void *a1, const char *a2, ...)
{
  return _[a1 playlists];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_selectedPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 selectedPlaylists];
}

id objc_msgSend_separatorInsetsWith_traitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInsetsWith:traitCollection:");
}

id objc_msgSend_setAccessibilityLabelBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabelBlock:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setEditPlaylistSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditPlaylistSpecifier:");
}

id objc_msgSend_setInterfaceHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceHelper:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setSelectedPlaylists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedPlaylists:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return _[a1 sharedGuard];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}