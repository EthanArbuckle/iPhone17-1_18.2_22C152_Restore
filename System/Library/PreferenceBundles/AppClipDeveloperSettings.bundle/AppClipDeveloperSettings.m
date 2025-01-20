id sub_553C(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t vars8;

  v3 = a1;
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [v3 superview];
    sub_553C(v5, a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

void sub_596C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5A38;
  block[3] = &unk_30EB0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_5A38(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 localizedFailureReason];
    id v9 = +[UIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:1];

    v4 = _CPSLocalizedString();
    id v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:&stru_30E88];
    [v9 addAction:v5];

    [*(id *)(a1 + 40) presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "cps_imageWithNormalizedOrientation");
    id v6 = objc_claimAutoreleasedReturnValue();
    Copy = CGImageCreateCopy((CGImageRef)[v6 CGImage]);

    [*(id *)(*(void *)(a1 + 40) + 184) setHeroImage:Copy];
    CGImageRelease(Copy);
    id v8 = *(void **)(a1 + 40);
    [v8 updateHeroImageSpecifier];
  }
}

void sub_5C34(id a1)
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSBundle bundleForClass:v3];
  v2 = (void *)qword_35F80;
  qword_35F80 = v1;
}

id *sub_6020(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] reloadSpecifiers];
  }
  return result;
}

uint64_t sub_6030(uint64_t a1)
{
  uint64_t v104 = a1;
  v128 = 0;
  uint64_t v127 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  id v124 = 0;
  uint64_t v121 = 0;
  uint64_t v122 = 0;
  id v120 = 0;
  uint64_t v118 = 0;
  uint64_t v119 = 0;
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  uint64_t v1 = sub_6C4C(&qword_35490);
  unint64_t v103 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  v112 = &v33[-v103];
  uint64_t v114 = sub_27AC0();
  uint64_t v110 = *(void *)(v114 - 8);
  uint64_t v111 = v114 - 8;
  uint64_t v106 = *(void *)(v110 + 64);
  unint64_t v105 = (v106 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v104);
  v107 = &v33[-v105];
  unint64_t v108 = (v106 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v2);
  v109 = &v33[-v108];
  v128 = &v33[-v108];
  uint64_t v127 = v3;
  unsigned int v113 = 1;
  sub_27AA0();
  if ((*(unsigned int (**)(unsigned char *, void, uint64_t))(v110 + 48))(v112, v113, v114) == 1)
  {
    sub_6CBC((uint64_t)v112);
LABEL_17:
    int v39 = 1;
    uint64_t v40 = sub_28170("Invalid URL.", 0xCuLL, 1);
    v42 = v28;
    uint64_t v29 = sub_28170("Diagnostics message for error case when the entered URL can not be parsed.", 0x4AuLL, v39 & 1);
    v41 = v30;
    uint64_t v43 = sub_17534(v40, v42, v29, v30);
    uint64_t v44 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v125 = v43;
    uint64_t v126 = v44;
    uint64_t v66 = v43;
    uint64_t v67 = v44;
    int v68 = 0;
    goto LABEL_18;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v110 + 32))(v109, v112, v114);
  uint64_t v131 = sub_27AB0();
  uint64_t v132 = v4;
  BOOL v102 = v4 != 0;
  BOOL v101 = v102;
  sub_6D6C();
  if (!v101)
  {
    (*(void (**)(unsigned char *, uint64_t))(v110 + 8))(v109, v114);
    goto LABEL_17;
  }
  uint64_t v92 = 0;
  unint64_t v91 = sub_6D98();
  v93 = (void *)_SWCServiceTypeAppLinks;
  id v5 = _SWCServiceTypeAppLinks;
  uint64_t v6 = sub_27AB0();
  id v8 = sub_6E00(v93, v92, v92, v6, v7);
  id v9 = v107;
  id v97 = v8;
  id v124 = v8;
  v130 = 0;
  id v96 = self;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v110 + 16))(v9, v109, v114);
  Class isa = sub_27A90().super.isa;
  v94 = *(void (**)(unsigned char *, uint64_t))(v110 + 8);
  uint64_t v95 = v110 + 8;
  v94(v107, v114);
  id v123 = v130;
  id v100 = [v96 serviceDetailsWithServiceSpecifier:v97 URLComponents:isa limit:1 error:&v123];
  id v98 = v123;
  id v10 = v123;
  id v11 = v130;
  v130 = v98;

  if (v100)
  {
    id v90 = v100;
    id v87 = v100;
    sub_6F20();
    uint64_t v86 = sub_281E0();
    swift_bridgeObjectRetain();
    v85 = &v115;
    uint64_t v115 = v86;
    uint64_t v84 = sub_6C4C(&qword_354B0);
    sub_6F88();
    sub_28270();
    sub_7084();
    v88 = v129;
    swift_bridgeObjectRelease();

    v89 = v88;
  }
  else
  {
    v36 = 0;
    id v34 = v130;
    uint64_t v35 = sub_27AE0();

    swift_willThrow();
    swift_errorRelease();
    v89 = v36;
  }
  id v83 = v89;
  if (!v89) {
    goto LABEL_15;
  }
  id v82 = v83;
  id v79 = v83;
  id v120 = v83;
  id v80 = [v83 serviceSpecifier];
  id v81 = [v80 applicationIdentifier];
  if (v81)
  {
    id v78 = v81;
    id v73 = v81;
    uint64_t v74 = sub_28140();
    uint64_t v75 = v12;

    uint64_t v76 = v74;
    uint64_t v77 = v75;
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v77 = 0;
  }
  uint64_t v71 = v77;
  uint64_t v72 = v76;
  if (!v77)
  {

LABEL_15:
    int v45 = 1;
    uint64_t v46 = sub_28170("The URL is not a Universal Link for any installed app.", 0x36uLL, 1);
    v48 = v23;
    uint64_t v24 = sub_28170("Diagnostic message for when the entered URL is not associated as a universal link with any installed application.", 0x71uLL, v45 & 1);
    v47 = v25;
    uint64_t v49 = sub_17534(v46, v48, v24, v25);
    uint64_t v50 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_6C4C((uint64_t *)&unk_355D0);
    sub_28350();
    uint64_t v51 = sub_28150();
    uint64_t v52 = v27;
    swift_bridgeObjectRelease();
    uint64_t v121 = v51;
    uint64_t v122 = v52;

    v94(v109, v114);
    uint64_t v66 = v51;
    uint64_t v67 = v52;
    int v68 = 0;
    goto LABEL_18;
  }
  uint64_t v69 = v72;
  uint64_t v70 = v71;
  uint64_t v63 = v71;
  uint64_t v57 = v72;
  uint64_t v118 = v72;
  uint64_t v119 = v71;

  int v53 = 1;
  uint64_t v54 = sub_28170("The URL is a Universal Link for the app with identifier “%@.", 0x3EuLL, 0);
  v56 = v13;
  uint64_t v14 = sub_28170("Diagnostic message for when the entered URL is able to open an installed application. First parameter is the application identifier", 0x83uLL, v53 & 1);
  v55 = v15;
  uint64_t v61 = sub_17534(v54, v56, v14, v15);
  uint64_t v62 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v59 = sub_6C4C((uint64_t *)&unk_355D0);
  uint64_t v60 = sub_28350();
  v58 = v17;
  swift_bridgeObjectRetain();
  v58[3] = &type metadata for String;
  unint64_t v18 = sub_6E60();
  uint64_t v19 = v57;
  v20 = v58;
  uint64_t v21 = v63;
  v58[4] = v18;
  void *v20 = v19;
  v20[1] = v21;
  sub_6EDC();
  uint64_t v64 = sub_28150();
  uint64_t v65 = v22;
  swift_bridgeObjectRelease();
  uint64_t v116 = v64;
  uint64_t v117 = v65;
  swift_bridgeObjectRelease();

  v94(v109, v114);
  uint64_t v66 = v64;
  uint64_t v67 = v65;
  int v68 = 1;
LABEL_18:
  int v37 = v68;
  uint64_t v38 = v67;
  return v66;
}

uint64_t sub_6C4C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_6CBC(uint64_t a1)
{
  uint64_t v3 = sub_27AC0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_6D6C()
{
}

unint64_t sub_6D98()
{
  uint64_t v2 = qword_35498;
  if (!qword_35498)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_35498);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_6E00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_70C8(a1, a2, a3, a4, a5);
}

unint64_t sub_6E60()
{
  uint64_t v2 = qword_354A0;
  if (!qword_354A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_354A0);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_6EDC()
{
}

unint64_t sub_6F20()
{
  uint64_t v2 = qword_354A8;
  if (!qword_354A8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_354A8);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_6F88()
{
  uint64_t v2 = qword_354B8;
  if (!qword_354B8)
  {
    sub_700C(&qword_354B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_354B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_700C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_7084()
{
}

void *type metadata accessor for UniversalLinkCanOpenApplicationRequirementController()
{
  return &unk_30F70;
}

id sub_70C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    NSString v9 = sub_28130();
    swift_bridgeObjectRelease();
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  if (a5)
  {
    NSString v7 = sub_28130();
    swift_bridgeObjectRelease();
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v6 = objc_msgSend(v13, "initWithServiceType:applicationIdentifier:domain:", a1, v10);

  return v6;
}

void sub_7204()
{
  void *v0 = *v0;
}

void sub_7210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  v20 = sub_771C;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v16 = sub_27B20();
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v15 = v16 - 8;
  unint64_t v12 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = (char *)&v11 - v12;
  v17 = (char *)&v11 - v12;
  uint64_t v33 = __chkstk_darwin(v13);
  uint64_t v31 = v4;
  uint64_t v32 = v5;
  id v21 = self;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v3, v13, v16);
  sub_27AF0(v6);
  id v23 = v7;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v16);
  swift_retain();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v19;
  id v10 = v20;
  *(void *)(v8 + 16) = v18;
  *(void *)(v8 + 24) = v9;
  uint64_t v29 = v10;
  uint64_t v30 = v8;
  aBlock = _NSConcreteStackBlock;
  int v25 = 1107296256;
  int v26 = 0;
  uint64_t v27 = sub_7DC4;
  v28 = &unk_310B8;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_release();
  [v21 fetchABRMetadataWithURL:v23 completion:v22];
  _Block_release(v22);
}

void sub_7428(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v20 = a1;
  uint64_t v18 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t v21 = 0;
  uint64_t v19 = sub_7FB0;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v25 = sub_280C0();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v25 - 8;
  unint64_t v14 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v24 = (char *)&v14 - v14;
  uint64_t v29 = sub_280E0();
  uint64_t v26 = *(void *)(v29 - 8);
  uint64_t v27 = v29 - 8;
  unint64_t v15 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v21);
  v28 = (char *)&v14 - v15;
  uint64_t v42 = v4;
  uint64_t v41 = v5;
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  sub_7EF8();
  id v31 = (id)sub_28290();
  id v8 = v20;
  swift_retain();
  swift_errorRetain();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = v16;
  uint64_t v11 = v17;
  uint64_t v12 = v18;
  uint64_t v13 = v19;
  v9[2] = v20;
  v9[3] = v10;
  v9[4] = v11;
  v9[5] = v12;
  int v37 = v13;
  uint64_t v38 = v9;
  aBlock = _NSConcreteStackBlock;
  int v33 = 1107296256;
  int v34 = 0;
  uint64_t v35 = sub_7CC4;
  v36 = &unk_31128;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_release();
  sub_7D14();
  sub_7D2C();
  sub_282A0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v29);
  _Block_release(v30);
}

uint64_t sub_76DC()
{
  return swift_deallocObject();
}

void sub_771C(void *a1, uint64_t a2)
{
  sub_7428(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_7728(void *a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  id v4 = a1;
  if (a1)
  {
    id v42 = [a1 clipBundleID];
    if (v42)
    {
      uint64_t v38 = sub_28140();
      uint64_t v39 = v5;

      uint64_t v40 = v38;
      uint64_t v41 = v39;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v41 = 0;
    }

    uint64_t v43 = v40;
    uint64_t v44 = v41;
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v44 = 0;
  }
  if (v44)
  {
    uint64_t v33 = sub_28170("An Advanced Experience is registered for this App Clip with bundle ID: %@", 0x49uLL, 1);
    int v34 = v6;
    uint64_t v7 = sub_28170("Diagnostics message for success obtaining an advanced experience. Parameter is bundle id of the corresponding app clip.", 0x77uLL, 1);
    sub_17534(v33, v34, v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_6C4C((uint64_t *)&unk_355D0);
    sub_28350();
    uint64_t v35 = v9;
    swift_bridgeObjectRetain();
    v35[3] = (uint64_t)&type metadata for String;
    v35[4] = sub_6E60();
    *uint64_t v35 = v43;
    v35[1] = v44;
    sub_6EDC();
    uint64_t v36 = sub_28150();
    uint64_t v37 = v10;
    swift_bridgeObjectRelease();
    swift_retain();
    swift_bridgeObjectRetain();
    a2(v36, v37, v43, v44);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_errorRetain();
    if (a4)
    {
      uint64_t v22 = sub_28170("Unable to load App Clip experiences: %@", 0x27uLL, 1);
      uint64_t v23 = v16;
      uint64_t v17 = sub_28170("Diagnostics message for when an error is encountered when determining if an advanced experience is registered.", 0x6EuLL, 1);
      sub_17534(v22, v23, v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_6C4C((uint64_t *)&unk_355D0);
      sub_28350();
      uint64_t v26 = v19;
      swift_getErrorValue();
      uint64_t v24 = sub_28360();
      uint64_t v25 = v20;
      v26[3] = (uint64_t)&type metadata for String;
      v26[4] = sub_6E60();
      *uint64_t v26 = v24;
      v26[1] = v25;
      sub_6EDC();
      uint64_t v27 = sub_28150();
      uint64_t v28 = v21;
      swift_bridgeObjectRelease();
      swift_retain();
      ((void (*)(uint64_t, uint64_t, void))a2)(v27, v28, 0);
      swift_release();
      swift_bridgeObjectRelease();
      return swift_errorRelease();
    }
    else
    {
      uint64_t v29 = sub_28170("No Advanced Experience is registered for this URL.", 0x32uLL, 1);
      uint64_t v30 = v12;
      uint64_t v13 = sub_28170("Diagnostics message for failure obtaining an advanced experience.", 0x41uLL, 1);
      uint64_t v31 = sub_17534(v29, v30, v13, v14);
      uint64_t v32 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_retain();
      ((void (*)(uint64_t, uint64_t, void))a2)(v31, v32, 0);
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_7CC4(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_7D14()
{
  return sub_280D0();
}

uint64_t sub_7D2C()
{
  return sub_28310();
}

uint64_t sub_7DC4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v3 = a2;
  id v4 = a3;
  v6(a2);
  swift_errorRelease();

  return swift_release();
}

uint64_t sub_7E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_7EC8()
{
  return swift_release();
}

void *type metadata accessor for ABREntryRequirementController()
{
  return &unk_310F0;
}

unint64_t sub_7EF8()
{
  uint64_t v2 = qword_35500;
  if (!qword_35500)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_35500);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_7F60()
{
  swift_release();
  swift_errorRelease();
  return swift_deallocObject();
}

uint64_t sub_7FB0()
{
  return sub_7728(*(void **)(v0 + 16), *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_7FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_800C()
{
  return swift_release();
}

uint64_t sub_8028(uint64_t result)
{
  uint64_t v3 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_280C0();
      uint64_t v1 = sub_281F0();
      *(void *)(v1 + 16) = v3;
      uint64_t v2 = (void *)v1;
    }
    else
    {
      swift_retain();
      uint64_t v2 = &_swiftEmptyArrayStorage;
    }
    sub_280C0();
    return (uint64_t)v2;
  }
  return result;
}

unint64_t sub_8108()
{
  uint64_t v2 = qword_35590;
  if (!qword_35590)
  {
    sub_280C0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35590);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_818C()
{
  uint64_t v2 = qword_355A0;
  if (!qword_355A0)
  {
    sub_700C(&qword_354C0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_355A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_8210(void *a1, uint64_t a2)
{
  id v72 = a1;
  uint64_t v65 = a2;
  uint64_t v81 = 0;
  uint64_t v80 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v69 = sub_27B20();
  uint64_t v67 = *(void *)(v69 - 8);
  uint64_t v68 = v69 - 8;
  unint64_t v66 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v70 = (char *)&v28 - v66;
  uint64_t v81 = __chkstk_darwin(v72);
  uint64_t v80 = v2;
  (*(void (**)(char *))(v67 + 16))((char *)&v28 - v66);
  sub_27AF0(v3);
  id v71 = v4;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v69);
  [v72 setClipURL:v71];

  if ([v72 hasValidAssociatedDomainsToLaunchAppClip])
  {
    int v56 = 1;
    uint64_t v57 = sub_28170("The URL is from an associated domain for this app clip.", 0x37uLL, 1);
    uint64_t v59 = v5;
    uint64_t v6 = sub_28170("Diagnostic message for valid associated domain", 0x2EuLL, v56 & 1);
    v58 = v7;
    uint64_t v60 = sub_17534(v57, v59, v6, v7);
    uint64_t v61 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v73 = v60;
    uint64_t v74 = v61;
    uint64_t v62 = v60;
    uint64_t v63 = v61;
    int v64 = 1;
  }
  else
  {
    int v48 = 1;
    uint64_t v78 = sub_28170("", 0, 1);
    uint64_t v79 = v9;
    id v53 = [v72 clipVerifiedAssociatedDomains];
    uint64_t v10 = sub_281E0();
    uint64_t v52 = &v77;
    uint64_t v77 = v10;
    uint64_t v50 = sub_28170(", ", 2uLL, v48 & 1);
    uint64_t v51 = v11;
    uint64_t v49 = sub_6C4C(&qword_354C8);
    sub_87E0();
    uint64_t v54 = sub_28120();
    uint64_t v55 = v12;
    swift_bridgeObjectRelease();
    sub_7084();

    uint64_t v75 = v54;
    uint64_t v76 = v55;
    if (sub_28190())
    {
      int v31 = 1;
      uint64_t v32 = sub_28170("The App Clip has no associated domains.", 0x27uLL, 1);
      int v34 = v23;
      uint64_t v24 = sub_28170("Diagnostic message for when there are no valid associated domains found for this App Clip", 0x59uLL, v31 & 1);
      uint64_t v33 = v25;
      uint64_t v35 = sub_17534(v32, v34, v24, v25);
      uint64_t v36 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v78 = v35;
      uint64_t v79 = v36;
    }
    else
    {
      int v37 = 1;
      uint64_t v38 = sub_28170("The URL does not match the associated domains for this App Clip. Valid domains are: %@.", 0x57uLL, 1);
      uint64_t v40 = v13;
      uint64_t v14 = sub_28170("Diagnostic message for when URL is not a valid associated domain. First parameter is the list of valid associated domains.", 0x7AuLL, v37 & 1);
      uint64_t v39 = v15;
      uint64_t v44 = sub_17534(v38, v40, v14, v15);
      uint64_t v45 = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_6C4C((uint64_t *)&unk_355D0);
      uint64_t v43 = sub_28350();
      uint64_t v41 = v17;
      swift_bridgeObjectRetain();
      v41[3] = (uint64_t)&type metadata for String;
      unint64_t v18 = sub_6E60();
      uint64_t v19 = v54;
      uint64_t v20 = v55;
      uint64_t v21 = v41;
      v41[4] = v18;
      *uint64_t v21 = v19;
      v21[1] = v20;
      sub_6EDC();
      uint64_t v46 = sub_28150();
      uint64_t v47 = v22;
      swift_bridgeObjectRelease();
      uint64_t v78 = v46;
      uint64_t v79 = v47;
    }
    swift_bridgeObjectRelease();
    uint64_t v28 = &v78;
    uint64_t v29 = v78;
    uint64_t v30 = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_6D6C();
    uint64_t v62 = v29;
    uint64_t v63 = v30;
    int v64 = 0;
  }
  return v62;
}

unint64_t sub_87E0()
{
  uint64_t v2 = qword_354D0;
  if (!qword_354D0)
  {
    sub_700C(&qword_354C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_354D0);
    return WitnessTable;
  }
  return v2;
}

void *type metadata accessor for AssociatedDomainsRequirementsController()
{
  return &unk_31160;
}

uint64_t sub_8878(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  char v34 = 0;
  uint64_t v2 = sub_6C4C(&qword_354D8);
  unint64_t v22 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v32 = &v17[-v22];
  uint64_t v33 = type metadata accessor for Requirement();
  uint64_t v30 = *(void *)(v33 - 8);
  uint64_t v31 = v33 - 8;
  unint64_t v24 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v23);
  uint64_t v25 = &v17[-v24];
  unint64_t v26 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v27 = &v17[-v26];
  uint64_t v39 = &v17[-v26];
  uint64_t v38 = v5;
  uint64_t v37 = v1;
  uint64_t v6 = *(void (**)(void))(*(void *)v1 + 376);
  unsigned int v29 = 2;
  v6();
  (*(void (**)(uint64_t, void))(*(void *)v28 + 352))(5, v29);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v30 + 48))(v32, 1, v33) == 1) {
    return sub_8BC0((uint64_t)v32);
  }
  uint64_t v7 = v28;
  __n128 v8 = sub_8C88((uint64_t)v32, (uint64_t)v27);
  (*(void (**)(__n128))(*(void *)v7 + 304))(v8);
  uint64_t v19 = sub_6030(v23);
  uint64_t v20 = v9;
  int v21 = v10;
  uint64_t v35 = v19;
  uint64_t v36 = v9;
  char v34 = v10 & 1;
  swift_bridgeObjectRetain();
  uint64_t v11 = v20;
  uint64_t v12 = (uint64_t *)&v27[*(int *)(v33 + 24)];
  *uint64_t v12 = v19;
  v12[1] = v11;
  swift_bridgeObjectRelease();
  if (v21) {
    int v18 = 2;
  }
  else {
    int v18 = 3;
  }
  uint64_t v13 = v27;
  uint64_t v14 = v25;
  uint64_t v15 = v28;
  v27[*(int *)(v33 + 28)] = v18;
  sub_8D4C((uint64_t)v13, (uint64_t)v14);
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v15 + 360))(2, v25);
  sub_8E38((uint64_t)v25);
  swift_bridgeObjectRelease();
  return sub_8E38((uint64_t)v27);
}

uint64_t sub_8BC0(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for Requirement();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1))
  {
    uint64_t v1 = sub_27B60();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    swift_bridgeObjectRelease();
  }
  return a1;
}

__n128 sub_8C88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a2 + v3[5]) = *(unsigned char *)(a1 + v3[5]);
  __n128 result = *(__n128 *)(a1 + v3[6]);
  *(__n128 *)(a2 + v3[6]) = result;
  *(unsigned char *)(a2 + v3[7]) = *(unsigned char *)(a1 + v3[7]);
  return result;
}

uint64_t sub_8D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  __n128 v8 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a2 + v8[5]) = *(unsigned char *)(a1 + v8[5]);
  uint64_t v3 = (void *)(a1 + v8[6]);
  uint64_t v6 = (void *)(a2 + v8[6]);
  *uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  v6[1] = v7;
  *(unsigned char *)(a2 + v8[7]) = *(unsigned char *)(a1 + v8[7]);
  return result;
}

uint64_t sub_8E38(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for Requirement();
  swift_bridgeObjectRelease();
  return a1;
}

id sub_8EB8()
{
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_webView);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_8F20(void *a1)
{
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_webView);
  swift_beginAccess();
  uint64_t v3 = *v4;
  void *v4 = a1;

  swift_endAccess();
}

uint64_t (*sub_8FA0())()
{
  return sub_900C;
}

uint64_t sub_900C()
{
  return swift_endAccess();
}

uint64_t sub_904C()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_completion);
  swift_beginAccess();
  uint64_t v3 = *v2;
  sub_90C0(*v2);
  swift_endAccess();
  return v3;
}

uint64_t sub_90C0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_90FC(uint64_t a1, uint64_t a2)
{
  sub_90C0(a1);
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_completion);
  swift_beginAccess();
  uint64_t v3 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_9198(v3);
  swift_endAccess();
  return sub_9198(a1);
}

uint64_t sub_9198(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_91D4())()
{
  return sub_900C;
}

uint64_t sub_9240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  (*(void (**)(uint64_t, uint64_t *(*)(uint64_t, uint64_t)))((char *)&stru_68.offset
                                                                             + (*v3 & swift_isaMask)))(a1, sub_9630);
  return swift_release();
}

uint64_t *sub_9330(uint64_t a1, uint64_t a2, void (*a3)(void, void, void, void), uint64_t a4)
{
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v16 = sub_28170("The Smart App Banner meta tag has the App Clip Bundle ID: %@", 0x3CuLL, 1);
    uint64_t v17 = v8;
    uint64_t v9 = sub_28170("Diagnostic message for when a bundle ID was obtained from the meta tag corresponding to the developer entered URL.", 0x72uLL, 1);
    sub_17534(v16, v17, v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_6C4C((uint64_t *)&unk_355D0);
    sub_28350();
    int v18 = v11;
    swift_bridgeObjectRetain();
    v18[3] = &type metadata for String;
    v18[4] = sub_6E60();
    *int v18 = a1;
    v18[1] = a2;
    sub_6EDC();
    uint64_t v19 = sub_28150();
    uint64_t v20 = v12;
    swift_bridgeObjectRelease();
    uint64_t v28 = v19;
    uint64_t v29 = v20;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = sub_28170("The Smart App Banner meta tag is missing the Bundle ID for an App Clip.", 0x47uLL, 1);
    unint64_t v22 = v4;
    uint64_t v5 = sub_28170("Diagnostic message for when there is no valid app clip meta tag parameter", 0x49uLL, 1);
    uint64_t v23 = sub_17534(v21, v22, v5, v6);
    uint64_t v24 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v23;
    uint64_t v29 = v24;
  }
  swift_retain();
  uint64_t v14 = v28;
  uint64_t v15 = v29;
  swift_bridgeObjectRetain();
  a3(v14, v15, a1, a2);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t result = &v28;
  sub_6D6C();
  return result;
}

uint64_t sub_95F0()
{
  return swift_deallocObject();
}

uint64_t *sub_9630(uint64_t a1, uint64_t a2)
{
  return sub_9330(a1, a2, *(void (**)(void, void, void, void))(v2 + 16), *(void *)(v2 + 24));
}

void sub_963C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = a1;
  uint64_t v41 = a2;
  uint64_t v40 = a3;
  uint64_t v31 = "Fatal error";
  uint64_t v32 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  uint64_t v33 = "AppClipDeveloperSettings/MetaTagRequirementController.swift";
  uint64_t v65 = 0;
  uint64_t v64 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v61 = 0;
  id v60 = 0;
  uint64_t v54 = 0;
  uint64_t v34 = sub_27B20();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = v34 - 8;
  unint64_t v37 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v38 = (char *)&v18 - v37;
  uint64_t v42 = sub_27A70();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  uint64_t v46 = *(void *)(v43 + 64);
  unint64_t v45 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v54);
  uint64_t v47 = (char *)&v18 - v45;
  unint64_t v48 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v18 - v48;
  uint64_t v65 = (char *)&v18 - v48;
  uint64_t v64 = v5;
  uint64_t v62 = v6;
  uint64_t v63 = v7;
  uint64_t v61 = v3;
  sub_9CA8();
  id v56 = sub_9D10();
  id v60 = v56;
  id v50 = [self nonPersistentDataStore];
  objc_msgSend(v56, "setWebsiteDataStore:");

  id v52 = (id)_SFApplicationNameForUserAgent();
  sub_28140();
  uint64_t v51 = v8;
  id v53 = sub_28130();
  swift_bridgeObjectRelease();

  [v56 setApplicationNameForUserAgent:v53];
  sub_9D40();
  double v55 = sub_B838(v54);
  id v9 = v56;
  id v10 = sub_9DA8(v56, v55, v55, v55, v55);
  uint64_t v11 = *v57;
  v58 = &swift_isaMask;
  uint64_t v12 = (*(uint64_t (**)(id))&stru_68.sectname[v11 & swift_isaMask])(v10);
  uint64_t v59 = (*(uint64_t (**)(uint64_t))((char *)&stru_20.nsects + (*v57 & *v58)))(v12);
  if (v59)
  {
    uint64_t v30 = (void *)v59;
  }
  else
  {
    sub_28340();
    __break(1u);
  }
  uint64_t v13 = v57;
  id v26 = v30;
  uint64_t v14 = v57;
  uint64_t v25 = v13;
  objc_msgSend(v26, "setNavigationDelegate:");
  swift_unknownObjectRelease();

  swift_retain();
  uint64_t v15 = *v13;
  uint64_t v28 = &swift_isaMask;
  (*(void (**)(uint64_t, uint64_t))&stru_68.segname[(v15 & swift_isaMask) + 8])(v41, v40);
  uint64_t v16 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v38, v39, v34);
  uint64_t v27 = sub_9E08();
  sub_9E10();
  uint64_t v17 = sub_27A60();
  uint64_t v29 = (*(uint64_t (**)(uint64_t))((char *)&stru_20.nsects + (*v16 & *v28)))(v17);
  if (v29)
  {
    uint64_t v24 = (void *)v29;
  }
  else
  {
    sub_28340();
    __break(1u);
  }
  id v20 = v24;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v47, v49, v42);
  Class v19 = sub_27A50();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v43 + 8);
  uint64_t v22 = v43 + 8;
  v23(v47, v42);
  id v21 = [v20 loadRequest:v19];

  v23(v49, v42);
}

unint64_t sub_9CA8()
{
  uint64_t v2 = qword_354F0;
  if (!qword_354F0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_354F0);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_9D10()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_B7AC();
}

unint64_t sub_9D40()
{
  uint64_t v2 = qword_354F8;
  if (!qword_354F8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_354F8);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_9DA8(void *a1, double a2, double a3, double a4, double a5)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_B7D0(a1, a2, a3, a4, a5);
}

uint64_t sub_9E08()
{
  return 0;
}

double sub_9E10()
{
  return 60.0;
}

void sub_9E1C(void *a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  uint64_t v15 = v2;
  sub_28170("document.getElementsByName('apple-itunes-app')[0].content", 0x39uLL, 1);
  id v7 = sub_28130();
  swift_bridgeObjectRelease();
  id v3 = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  uint64_t v13 = sub_B880;
  uint64_t v14 = v4;
  aBlock = _NSConcreteStackBlock;
  int v9 = 1107296256;
  int v10 = 0;
  uint64_t v11 = sub_AAB0;
  uint64_t v12 = &unk_311C0;
  uint64_t v6 = _Block_copy(&aBlock);
  swift_release();
  [a1 evaluateJavaScript:v7 completionHandler:v6];
  _Block_release(v6);
}

void *sub_9F60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v83 = a1;
  uint64_t v82 = a2;
  uint64_t v81 = a3;
  uint64_t v75 = 0;
  id v72 = sub_A8B4;
  uint64_t v73 = sub_BF68;
  uint64_t v123 = 0;
  uint64_t v122 = 0;
  uint64_t v121 = 0;
  uint64_t v115 = 0;
  uint64_t v116 = 0;
  uint64_t v74 = 0;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v105 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v76 = sub_280C0();
  uint64_t v77 = *(void *)(v76 - 8);
  uint64_t v78 = v76 - 8;
  unint64_t v79 = (*(void *)(v77 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v80 = (char *)&v23 - v79;
  uint64_t v84 = sub_280E0();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  unint64_t v87 = (*(void *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v83);
  v88 = (char *)&v23 - v87;
  uint64_t v123 = v3;
  uint64_t v122 = v4;
  uint64_t v121 = v5;
  sub_BC88(v3, (uint64_t)v119);
  if (v120)
  {
    uint64_t v6 = swift_dynamicCast();
    if (v6)
    {
      uint64_t v67 = v89;
      uint64_t v68 = v90;
    }
    else
    {
      uint64_t v67 = 0;
      uint64_t v68 = 0;
    }
    uint64_t v70 = v67;
    uint64_t v71 = v68;
  }
  else
  {
    uint64_t v69 = 0;
    uint64_t v6 = sub_BB7C((uint64_t)v119);
    uint64_t v70 = v69;
    uint64_t v71 = v69;
  }
  uint64_t v65 = v71;
  uint64_t v66 = v70;
  if (v71)
  {
    uint64_t v63 = v66;
    uint64_t v64 = v65;
    uint64_t v8 = v74;
    uint64_t v55 = v65;
    uint64_t v115 = v66;
    uint64_t v116 = v65;
    v112[1] = v66;
    v112[2] = v65;
    uint64_t v59 = sub_28170(",", 1uLL, 1);
    uint64_t v60 = v9;
    unint64_t v58 = sub_BD20();
    uint64_t v57 = &type metadata for String;
    uint64_t v56 = sub_A888();
    sub_A89C();
    uint64_t v61 = sub_282F0();
    swift_bridgeObjectRelease();
    v112[0] = v61;
    uint64_t v62 = sub_6C4C(&qword_355B0);
    sub_BD9C();
    uint64_t result = (void *)sub_281C0();
    if (v8)
    {
      __break(1u);
    }
    else
    {
      sub_7084();
      long long v53 = v113;
      long long v54 = v114;
      if (*((void *)&v114 + 1))
      {
        long long v51 = v53;
        long long v52 = v54;
        uint64_t v41 = *((void *)&v54 + 1);
        long long v108 = v53;
        long long v109 = v54;
        long long v106 = v53;
        long long v107 = v54;
        uint64_t v45 = sub_28170("=", 1uLL, 1);
        uint64_t v46 = v12;
        unint64_t v44 = sub_BE20();
        uint64_t v43 = &type metadata for Substring;
        uint64_t v42 = sub_A888();
        sub_A89C();
        uint64_t v47 = sub_282F0();
        swift_bridgeObjectRelease();
        uint64_t v105 = v47;
        swift_bridgeObjectRetain();
        unint64_t v48 = &v102;
        uint64_t v102 = v47;
        sub_BE9C();
        sub_28110();
        uint64_t v13 = (uint64_t)v48;
        sub_7084();
        long long v49 = v103;
        long long v50 = v104;
        if (*((void *)&v104 + 1))
        {
          long long v39 = v49;
          long long v40 = v50;
          uint64_t v35 = *((void *)&v50 + 1);
          uint64_t v36 = v50;
          uint64_t v37 = *((void *)&v49 + 1);
          uint64_t v38 = v49;
          long long v98 = v49;
          long long v99 = v50;
          if (sub_28200() == 2)
          {
            uint64_t v32 = 0;
            sub_7EF8();
            id v34 = (id)sub_28290();
            uint64_t v15 = v81;
            swift_bridgeObjectRetain();
            uint64_t v16 = (void *)swift_allocObject();
            uint64_t v17 = v38;
            uint64_t v18 = v37;
            uint64_t v19 = v36;
            id v20 = v73;
            uint64_t v21 = v35;
            v16[2] = v81;
            v16[3] = v17;
            v16[4] = v18;
            v16[5] = v19;
            v16[6] = v21;
            id v96 = v20;
            id v97 = v16;
            unint64_t v91 = _NSConcreteStackBlock;
            int v92 = 1107296256;
            int v93 = 0;
            v94 = sub_7CC4;
            uint64_t v95 = &unk_31300;
            uint64_t v33 = _Block_copy(&v91);
            swift_release();
            sub_7D14();
            sub_7D2C();
            sub_282A0();
            (*(void (**)(char *, uint64_t))(v77 + 8))(v80, v76);
            (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v84);
            _Block_release(v33);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (void *)swift_bridgeObjectRelease();
          }
          uint64_t v13 = swift_bridgeObjectRelease();
        }
        uint64_t v100 = (*(uint64_t (**)(uint64_t))&stru_68.segname[*v81 & swift_isaMask])(v13);
        uint64_t v101 = v22;
        if (v100)
        {
          uint64_t v29 = &v100;
          uint64_t v30 = (void (*)(void))v100;
          uint64_t v31 = v101;
          swift_retain();
          sub_BB34(v29);
          v30(0);
          swift_release();
        }
        else
        {
          sub_BB34(&v100);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v110 = (*(uint64_t (**)(void *))&stru_68.segname[*v81 & swift_isaMask])(v112);
        uint64_t v111 = v11;
        if (v110)
        {
          id v26 = &v110;
          uint64_t v27 = (void (*)(void))v110;
          uint64_t v28 = v111;
          swift_retain();
          sub_BB34(v26);
          v27(0);
          swift_release();
        }
        else
        {
          sub_BB34(&v110);
        }
        return (void *)swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v117 = (*(uint64_t (**)(uint64_t))&stru_68.segname[*v81 & swift_isaMask])(v6);
    uint64_t v118 = v7;
    if (v117)
    {
      uint64_t v23 = &v117;
      uint64_t v24 = (void (*)(void))v117;
      uint64_t v25 = v118;
      swift_retain();
      sub_BB34(v23);
      v24(0);
      return (void *)swift_release();
    }
    else
    {
      return sub_BB34(&v117);
    }
  }
  return result;
}

uint64_t sub_A888()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_A89C()
{
  return 1;
}

uint64_t sub_A8B4()
{
  sub_28170("app-clip-bundle-id", 0x12uLL, 1);
  sub_BE20();
  sub_BD20();
  char v1 = sub_282E0();
  sub_6D6C();
  return v1 & 1;
}

void *sub_A990(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[7] = a1;
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a5;
  v9[0] = (*(uint64_t (**)(void))&stru_68.segname[*a1 & swift_isaMask])();
  v9[1] = v5;
  if (!v9[0]) {
    return sub_BB34(v9);
  }
  uint64_t v8 = (void (*)(uint64_t))v9[0];
  swift_retain();
  sub_BB34(v9);
  uint64_t v7 = sub_281A0();
  v8(v7);
  swift_bridgeObjectRelease();
  return (void *)swift_release();
}

uint64_t sub_AAB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void (**)(void))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  if (a2)
  {
    v8[3] = swift_getObjectType();
    v8[0] = a2;
    sub_BC6C((uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  id v3 = a3;
  v6();
  swift_errorRelease();
  sub_BB7C((uint64_t)v9);
  return swift_release();
}

void sub_AC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a1;
  v10[3] = a2;
  v10[2] = a3;
  uint64_t v14 = 0;
  uint64_t v13 = sub_B92C;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v18 = sub_280C0();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  v10[0] = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v17 = (char *)v10 - v10[0];
  uint64_t v22 = sub_280E0();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v11 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v14);
  uint64_t v21 = (char *)v10 - v11;
  uint64_t v35 = v4;
  uint64_t v34 = v5;
  uint64_t v33 = v6;
  uint64_t v32 = v3;
  sub_7EF8();
  id v24 = (id)sub_28290();
  id v7 = v12;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v13;
  *(void *)(v8 + 16) = v12;
  uint64_t v30 = v9;
  uint64_t v31 = v8;
  aBlock = _NSConcreteStackBlock;
  int v26 = 1107296256;
  int v27 = 0;
  uint64_t v28 = sub_7CC4;
  uint64_t v29 = &unk_31210;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_release();
  sub_7D14();
  sub_7D2C();
  sub_282A0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  _Block_release(v23);
}

void *sub_AEC8(void *a1)
{
  v4[2] = a1;
  v4[0] = (*(uint64_t (**)(void))&stru_68.segname[*a1 & swift_isaMask])();
  v4[1] = v1;
  if (!v4[0]) {
    return sub_BB34(v4);
  }
  uint64_t v3 = (void (*)(void))v4[0];
  swift_retain();
  sub_BB34(v4);
  v3(0);
  return (void *)swift_release();
}

void sub_B02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a1;
  v10[3] = a2;
  v10[2] = a3;
  uint64_t v14 = 0;
  uint64_t v13 = sub_B92C;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v18 = sub_280C0();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  v10[0] = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v17 = (char *)v10 - v10[0];
  uint64_t v22 = sub_280E0();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v11 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v14);
  uint64_t v21 = (char *)v10 - v11;
  uint64_t v35 = v4;
  uint64_t v34 = v5;
  uint64_t v33 = v6;
  uint64_t v32 = v3;
  sub_7EF8();
  id v24 = (id)sub_28290();
  id v7 = v12;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v13;
  *(void *)(v8 + 16) = v12;
  uint64_t v30 = v9;
  uint64_t v31 = v8;
  aBlock = _NSConcreteStackBlock;
  int v26 = 1107296256;
  int v27 = 0;
  uint64_t v28 = sub_7CC4;
  uint64_t v29 = &unk_31260;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_release();
  sub_7D14();
  sub_7D2C();
  sub_282A0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  _Block_release(v23);
}

void sub_B33C(uint64_t a1)
{
  v6[1] = a1;
  uint64_t v10 = 0;
  uint64_t v9 = sub_B92C;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v14 = sub_280C0();
  uint64_t v11 = *(void *)(v14 - 8);
  uint64_t v12 = v14 - 8;
  v6[0] = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v13 = (char *)v6 - v6[0];
  uint64_t v18 = sub_280E0();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v7 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v17 = (char *)v6 - v7;
  uint64_t v29 = v2;
  uint64_t v28 = v1;
  sub_7EF8();
  id v20 = (id)sub_28290();
  id v3 = v8;
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v9;
  *(void *)(v4 + 16) = v8;
  int v26 = v5;
  uint64_t v27 = v4;
  aBlock = _NSConcreteStackBlock;
  int v22 = 1107296256;
  int v23 = 0;
  id v24 = sub_7CC4;
  uint64_t v25 = &unk_312B0;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_release();
  sub_7D14();
  sub_7D2C();
  sub_282A0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v14);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  _Block_release(v19);
}

id DeveloperDiagnosticsViewControllerFactory.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id sub_B624()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  id v8 = v0;
  *(void *)&v0[OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_webView] = 0;

  id v3 = &v0[OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_completion];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;

  v7.receiver = v8;
  v7.super_class = (Class)type metadata accessor for MetaTagRequirementController();
  id v6 = objc_msgSendSuper2(&v7, "init");
  id v4 = v6;
  id v8 = v6;

  return v6;
}

id sub_B714()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetaTagRequirementController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_B7AC()
{
  return [v0 init];
}

id sub_B7D0(void *a1, double a2, double a3, double a4, double a5)
{
  id v8 = objc_msgSend(v5, "initWithFrame:configuration:", a2, a3, a4, a5);

  return v8;
}

double sub_B838(uint64_t a1)
{
  return (double)a1;
}

uint64_t sub_B840()
{
  return swift_deallocObject();
}

void *sub_B880(uint64_t a1, uint64_t a2)
{
  return sub_9F60(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_B888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_B8D0()
{
  return swift_release();
}

uint64_t sub_B8EC()
{
  return swift_deallocObject();
}

void *sub_B92C()
{
  return sub_AEC8(*(void **)(v0 + 16));
}

uint64_t sub_B934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_B97C()
{
  return swift_release();
}

uint64_t sub_B998()
{
  return swift_deallocObject();
}

uint64_t sub_B9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_BA20()
{
  return swift_release();
}

uint64_t sub_BA3C()
{
  return swift_deallocObject();
}

uint64_t sub_BA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_BAC4()
{
  return swift_release();
}

uint64_t type metadata accessor for MetaTagRequirementController()
{
  return self;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_BB08(id *a1)
{
}

void *sub_BB34(void *a1)
{
  if (*a1) {
    swift_release();
  }
  return a1;
}

uint64_t sub_BB7C(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    sub_BBC0(a1);
  }
  return a1;
}

uint64_t sub_BBC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

__n128 sub_BC6C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_BC88(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

unint64_t sub_BD20()
{
  uint64_t v2 = qword_355A8;
  if (!qword_355A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_355A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_BD9C()
{
  uint64_t v2 = qword_355B8;
  if (!qword_355B8)
  {
    sub_700C(&qword_355B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_355B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_BE20()
{
  uint64_t v2 = qword_355C0;
  if (!qword_355C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_355C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_BE9C()
{
  uint64_t v2 = qword_355C8;
  if (!qword_355C8)
  {
    sub_700C(&qword_355B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_355C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_BF20()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void *sub_BF68()
{
  return sub_A990(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_BF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_BFC8()
{
  return swift_release();
}

uint64_t sub_BFE4(uint64_t a1)
{
  uint64_t v72 = a1;
  uint64_t v60 = 0;
  uint64_t v59 = sub_D0EC;
  long long v98 = 0;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  uint64_t v95 = 0;
  uint64_t v94 = 0;
  uint64_t v93 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  char v90 = 0;
  uint64_t v61 = sub_27B20();
  uint64_t v63 = *(void *)(v61 - 8);
  uint64_t v62 = v61 - 8;
  uint64_t v64 = v63;
  uint64_t v65 = *(void *)(v63 + 64);
  unint64_t v66 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v67 = (char *)&v44 - v66;
  uint64_t v87 = type metadata accessor for Requirement();
  uint64_t v83 = *(void *)(v87 - 8);
  uint64_t v84 = v87 - 8;
  unint64_t v68 = (*(void *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v87);
  uint64_t v69 = (uint64_t)&v44 - v68;
  unint64_t v70 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v44 - v68);
  uint64_t v71 = (uint64_t)&v44 - v70;
  long long v98 = (char *)&v44 - v70;
  unint64_t v73 = (*(void *)(*(void *)(sub_6C4C(&qword_354D8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v72);
  uint64_t v74 = (uint64_t)&v44 - v73;
  unint64_t v75 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v76 = (uint64_t)&v44 - v75;
  unint64_t v77 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v78 = (uint64_t)&v44 - v77;
  unint64_t v79 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v85 = (uint64_t)&v44 - v79;
  uint64_t v97 = v9;
  uint64_t v96 = v1;
  uint64_t v10 = *(void (**)(void))(*(void *)v1 + 376);
  unsigned int v86 = 1;
  v10();
  uint64_t v11 = v80;
  uint64_t v81 = swift_allocBox();
  uint64_t v82 = v12;
  uint64_t v95 = v12;
  (*(void (**)(void))(*(void *)v11 + 352))(v86);
  v88 = *(unsigned int (**)(uint64_t, void, uint64_t))(v83 + 48);
  uint64_t v89 = v83 + 48;
  if (v88(v85, v86, v87) == 1)
  {
    sub_8BC0(v85);
    return swift_deallocBox();
  }
  else
  {
    uint64_t v13 = v80;
    sub_8C88(v85, v82);
    uint64_t v56 = swift_allocBox();
    uint64_t v57 = v14;
    uint64_t v94 = v14;
    uint64_t v15 = *(void (**)(uint64_t))(*(void *)v13 + 352);
    unsigned int v58 = 1;
    v15(2);
    if (v88(v78, v58, v87) == 1)
    {
      sub_8BC0(v78);
      swift_deallocBox();
      return swift_release();
    }
    else
    {
      uint64_t v16 = v80;
      sub_8C88(v78, v57);
      uint64_t v53 = swift_allocBox();
      uint64_t v54 = v17;
      uint64_t v93 = v17;
      uint64_t v18 = *(void (**)(uint64_t))(*(void *)v16 + 352);
      unsigned int v55 = 1;
      v18(3);
      if (v88(v76, v55, v87) == 1)
      {
        sub_8BC0(v76);
        swift_deallocBox();
        swift_release();
        return swift_release();
      }
      else
      {
        uint64_t v19 = v80;
        __n128 v20 = sub_8C88(v76, v54);
        uint64_t v21 = *(void (**)(uint64_t, __n128))(*(void *)v19 + 352);
        unsigned int v52 = 1;
        v21(4, v20);
        if (v88(v74, v52, v87) == 1)
        {
          sub_8BC0(v74);
          swift_release();
          swift_release();
          return swift_release();
        }
        else
        {
          uint64_t v22 = v80;
          __n128 v23 = sub_8C88(v74, v71);
          (*(void (**)(__n128))(*(void *)v22 + 280))(v23);
          uint64_t v49 = sub_D900(v72);
          uint64_t v50 = v24;
          int v51 = v25;
          uint64_t v91 = v49;
          uint64_t v92 = v24;
          char v90 = v25 & 1;
          swift_bridgeObjectRetain();
          uint64_t v26 = v50;
          uint64_t v27 = (uint64_t *)(v71 + *(int *)(v87 + 24));
          *uint64_t v27 = v49;
          v27[1] = v26;
          swift_bridgeObjectRelease();
          if (v51) {
            int v48 = 2;
          }
          else {
            int v48 = 3;
          }
          uint64_t v28 = v71;
          uint64_t v29 = v80;
          uint64_t v30 = v69;
          *(unsigned char *)(v71 + *(int *)(v87 + 28)) = v48;
          sub_8D4C(v28, v30);
          (*(void (**)(uint64_t, uint64_t))(*(void *)v29 + 360))(1, v69);
          uint64_t v31 = v80;
          uint64_t v32 = sub_8E38(v69);
          (*(void (**)(uint64_t))(*(void *)v31 + 208))(v32);
          swift_retain();
          swift_retain();
          swift_retain();
          uint64_t v44 = v64;
          (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v67, v72, v61);
          swift_retain();
          unint64_t v45 = (*(unsigned __int8 *)(v44 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
          unint64_t v46 = (v45 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v33 = (void *)swift_allocObject();
          uint64_t v34 = v80;
          unint64_t v35 = v45;
          uint64_t v36 = v63;
          uint64_t v37 = v67;
          uint64_t v38 = v61;
          uint64_t v39 = v56;
          uint64_t v47 = v33;
          v33[2] = v81;
          v33[3] = v34;
          v33[4] = v39;
          (*(void (**)(char *, char *, uint64_t))(v36 + 32))((char *)v33 + v35, v37, v38);
          uint64_t v40 = (uint64_t)v59;
          uint64_t v41 = (uint64_t)v47;
          uint64_t v42 = v72;
          *(void *)((char *)v47 + v46) = v53;
          sub_7210(v42, v40, v41);
          swift_release();
          swift_bridgeObjectRelease();
          sub_8E38(v71);
          swift_release();
          swift_release();
          return swift_release();
        }
      }
    }
  }
}

uint64_t sub_C924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v75 = a1;
  uint64_t v76 = a2;
  uint64_t v63 = a3;
  uint64_t v78 = a4;
  uint64_t v64 = a5;
  uint64_t v67 = a6;
  uint64_t v68 = a7;
  uint64_t v69 = a8;
  uint64_t v70 = a9;
  uint64_t v55 = 0;
  uint64_t v54 = sub_D840;
  uint64_t v97 = 0;
  uint64_t v98 = 0;
  uint64_t v95 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  uint64_t v93 = 0;
  uint64_t v92 = 0;
  uint64_t v91 = 0;
  uint64_t v90 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v56 = sub_27B20();
  uint64_t v58 = *(void *)(v56 - 8);
  uint64_t v57 = v56 - 8;
  uint64_t v59 = v58;
  uint64_t v60 = *(void *)(v58 + 64);
  unint64_t v61 = (v60 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v62 = (char *)v34 - v61;
  uint64_t v73 = type metadata accessor for Requirement();
  unint64_t v65 = (*(void *)(*(void *)(v73 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v64);
  uint64_t v66 = (uint64_t)v34 - v65;
  uint64_t v97 = v9;
  uint64_t v98 = v10;
  uint64_t v95 = v11;
  uint64_t v96 = v12;
  uint64_t v74 = swift_projectBox();
  uint64_t v94 = v74;
  uint64_t v93 = v67;
  uint64_t v71 = swift_projectBox();
  uint64_t v92 = v71;
  uint64_t v91 = v69;
  uint64_t v72 = swift_projectBox();
  uint64_t v90 = v72;
  swift_bridgeObjectRetain();
  unint64_t v77 = &v89;
  swift_beginAccess();
  uint64_t v13 = v76;
  uint64_t v14 = (void *)(v74 + *(int *)(v73 + 24));
  *uint64_t v14 = v75;
  v14[1] = v13;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRetain();
  if (v78)
  {
    uint64_t v52 = v63;
    uint64_t v53 = v78;
    uint64_t v20 = v67;
    uint64_t v40 = v78;
    uint64_t v38 = v63;
    uint64_t v81 = v63;
    uint64_t v82 = v78;
    v34[1] = &v80;
    v34[2] = 0;
    swift_beginAccess();
    *(unsigned char *)(v74 + *(int *)(v73 + 28)) = 2;
    swift_endAccess();
    v34[3] = &v79;
    swift_beginAccess();
    sub_8D4C(v74, v66);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 360))(1, v66);
    uint64_t v21 = v67;
    uint64_t v22 = sub_8E38(v66);
    (*(void (**)(uint64_t))(*(void *)v21 + 232))(v22);
    swift_retain();
    swift_retain();
    uint64_t v35 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v62, v69, v56);
    swift_retain();
    unint64_t v36 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    unint64_t v37 = (v36 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v67;
    unint64_t v25 = v36;
    uint64_t v26 = v58;
    uint64_t v27 = v62;
    uint64_t v28 = v56;
    uint64_t v39 = v23;
    *(void *)(v23 + 16) = v68;
    *(void *)(v23 + 24) = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v23 + v25, v27, v28);
    uint64_t v29 = (uint64_t)v54;
    uint64_t v30 = v39;
    uint64_t v31 = v40;
    uint64_t v32 = v38;
    *(void *)(v39 + v37) = v70;
    sub_115EC(v32, v31, v29, v30);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = v67;
    uint64_t v41 = &v88;
    uint64_t v43 = 33;
    uint64_t v49 = 0;
    swift_beginAccess();
    *(unsigned char *)(v74 + *(int *)(v73 + 28)) = 3;
    swift_endAccess();
    uint64_t v42 = &v87;
    swift_beginAccess();
    uint64_t v16 = (unsigned char *)(v71 + *(int *)(v73 + 28));
    int v44 = 4;
    *uint64_t v16 = 4;
    swift_endAccess();
    unint64_t v45 = &v86;
    swift_beginAccess();
    *(unsigned char *)(v72 + *(int *)(v73 + 28)) = v44;
    swift_endAccess();
    unint64_t v46 = &v85;
    uint64_t v48 = 32;
    swift_beginAccess();
    sub_8D4C(v74, v66);
    swift_endAccess();
    uint64_t v17 = *(void (**)(void))(*(void *)v15 + 360);
    unsigned int v51 = 1;
    v17();
    uint64_t v18 = v67;
    sub_8E38(v66);
    uint64_t v47 = &v84;
    swift_beginAccess();
    sub_8D4C(v71, v66);
    swift_endAccess();
    (*(void (**)(void, uint64_t))(*(void *)v18 + 360))(v51, v66);
    uint64_t v19 = v67;
    sub_8E38(v66);
    uint64_t v50 = &v83;
    swift_beginAccess();
    sub_8D4C(v72, v66);
    swift_endAccess();
    (*(void (**)(void, uint64_t))(*(void *)v19 + 360))(v51, v66);
    return sub_8E38(v66);
  }
}

uint64_t sub_CFD0()
{
  uint64_t v4 = sub_27B20();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_D0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(sub_27B20() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return sub_C924(a1, a2, a3, a4, v4[2], v4[3], v4[4], (uint64_t)v4 + v5, *(uint64_t *)((char *)v4 + ((v5 + *(void *)(v11 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_D1B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  id v60 = a3;
  uint64_t v48 = a4;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  uint64_t v53 = a7;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v79 = 0;
  uint64_t v78 = 0;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  uint64_t v75 = 0;
  id v69 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  char v64 = 0;
  uint64_t v55 = type metadata accessor for Requirement();
  unint64_t v49 = (*(void *)(*(void *)(v55 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v48);
  uint64_t v50 = (uint64_t)&v24 - v49;
  uint64_t v80 = v7;
  uint64_t v81 = v8;
  uint64_t v79 = v9;
  uint64_t v56 = swift_projectBox();
  uint64_t v78 = v56;
  uint64_t v77 = v51;
  uint64_t v76 = v52;
  uint64_t v54 = swift_projectBox();
  uint64_t v75 = v54;
  swift_bridgeObjectRetain();
  uint64_t v59 = &v74;
  swift_beginAccess();
  uint64_t v10 = v58;
  uint64_t v11 = (void *)(v56 + *(int *)(v55 + 24));
  *uint64_t v11 = v57;
  v11[1] = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  id v12 = v60;
  if (v60)
  {
    id v47 = v60;
    uint64_t v16 = v51;
    uint64_t v32 = v60;
    id v69 = v60;
    uint64_t v30 = &v68;
    uint64_t v33 = 33;
    uint64_t v34 = 0;
    swift_beginAccess();
    *(unsigned char *)(v56 + *(int *)(v55 + 28)) = 2;
    swift_endAccess();
    uint64_t v31 = &v67;
    swift_beginAccess();
    sub_8D4C(v56, v50);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v16 + 360))(1, v50);
    uint64_t v17 = v51;
    uint64_t v18 = sub_8E38(v50);
    (*(void (**)(uint64_t))(*(void *)v17 + 256))(v18);
    uint64_t v35 = sub_8210(v32, v52);
    uint64_t v36 = v19;
    int v38 = v20;
    uint64_t v65 = v35;
    uint64_t v66 = v19;
    char v64 = v20 & 1;
    swift_bridgeObjectRetain();
    unint64_t v37 = &v63;
    swift_beginAccess();
    uint64_t v21 = v36;
    uint64_t v22 = (uint64_t *)(v54 + *(int *)(v55 + 24));
    *uint64_t v22 = v35;
    v22[1] = v21;
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (v38) {
      int v29 = 2;
    }
    else {
      int v29 = 3;
    }
    uint64_t v23 = v51;
    int v25 = v29;
    uint64_t v26 = &v62;
    uint64_t v27 = 0;
    swift_beginAccess();
    *(unsigned char *)(v54 + *(int *)(v55 + 28)) = v25;
    swift_endAccess();
    uint64_t v28 = &v61;
    swift_beginAccess();
    sub_8D4C(v54, v50);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v23 + 360))(1, v50);
    sub_8E38(v50);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v51;
    uint64_t v39 = &v73;
    uint64_t v40 = 33;
    uint64_t v44 = 0;
    swift_beginAccess();
    *(unsigned char *)(v56 + *(int *)(v55 + 28)) = 3;
    swift_endAccess();
    uint64_t v41 = &v72;
    swift_beginAccess();
    *(unsigned char *)(v54 + *(int *)(v55 + 28)) = 4;
    swift_endAccess();
    uint64_t v42 = &v71;
    uint64_t v43 = 32;
    swift_beginAccess();
    sub_8D4C(v56, v50);
    swift_endAccess();
    uint64_t v14 = *(void (**)(void))(*(void *)v13 + 360);
    unsigned int v46 = 1;
    v14();
    uint64_t v15 = v51;
    sub_8E38(v50);
    unint64_t v45 = &v70;
    swift_beginAccess();
    sub_8D4C(v54, v50);
    swift_endAccess();
    (*(void (**)(void, uint64_t))(*(void *)v15 + 360))(v46, v50);
    sub_8E38(v50);
  }
}

uint64_t sub_D72C()
{
  uint64_t v4 = sub_27B20();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  swift_release();
  return swift_deallocObject();
}

void sub_D840(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *(void *)(sub_27B20() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = *(void *)(v3 + ((v4 + *(void *)(v11 + 64) + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_D1B4(a1, a2, a3, v5, v6, v3 + v4, v7);
}

uint64_t sub_D900(uint64_t a1)
{
  uint64_t v67 = a1;
  uint64_t v82 = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v83 = 0;
  unint64_t v84 = 0;
  BOOL v78 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v66 = 0;
  uint64_t v70 = sub_27B20();
  uint64_t v68 = *(void *)(v70 - 8);
  uint64_t v69 = v70 - 8;
  unint64_t v65 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = &v20[-v65];
  char v71 = &v20[-v65];
  uint64_t v82 = __chkstk_darwin(v67);
  id v72 = [self encoderWithVersion:0];
  swift_getObjectType();
  char v85 = 0;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v68 + 16))(v1, v67, v70);
  sub_27AF0(v2);
  id v74 = v3;
  (*(void (**)(unsigned char *, uint64_t))(v68 + 8))(v71, v70);
  id v81 = v85;
  id v75 = [v72 encodeURL:v74 error:&v81];
  id v73 = v81;
  id v4 = v81;
  uint64_t v5 = v85;
  char v85 = v73;

  if (v75)
  {
    id v64 = v75;
    id v59 = v75;
    uint64_t v60 = sub_27B30();
    unint64_t v61 = v6;

    swift_unknownObjectRelease();
    uint64_t v62 = v60;
    unint64_t v63 = v61;
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0xF000000000000000;
    id v21 = v85;
    uint64_t v22 = sub_27AE0();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_errorRelease();
    uint64_t v62 = v23;
    unint64_t v63 = v24;
  }
  unint64_t v57 = v63;
  uint64_t v58 = v62;
  if ((v63 & 0xF000000000000000) == 0xF000000000000000)
  {
    int v27 = 1;
    uint64_t v28 = sub_28170("The URL is unable to be encoded.", 0x20uLL, 1);
    uint64_t v30 = v15;
    uint64_t v16 = sub_28170("Diagnostics message for URL unable to be encoded as App Clip Code.", 0x42uLL, v27 & 1);
    int v29 = v17;
    uint64_t v31 = sub_17534(v28, v30, v16, v17);
    uint64_t v32 = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v79 = v31;
    uint64_t v80 = v32;
    uint64_t v35 = v31;
    uint64_t v36 = v32;
    BOOL v37 = 0;
  }
  else
  {
    uint64_t v55 = v58;
    unint64_t v56 = v57;
    unint64_t v52 = v57;
    uint64_t v53 = v58;
    uint64_t v83 = v58;
    unint64_t v84 = v57;
    BOOL v54 = sub_27B40() <= 16;
    BOOL v78 = v54;
    if (v54)
    {
      int v44 = 1;
      uint64_t v45 = sub_28170("The URL fits into an App Clip Code.", 0x23uLL, 1);
      id v47 = v7;
      uint64_t v8 = sub_28170("Diagnostics message for URL encodable as App Clip Code.", 0x37uLL, v44 & 1);
      unsigned int v46 = v9;
      uint64_t v48 = sub_17534(v45, v47, v8, v9);
      uint64_t v49 = v10;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v50 = v48;
      uint64_t v51 = v49;
    }
    else
    {
      int v38 = 1;
      uint64_t v39 = sub_28170("The URL is too long to fit in an App Clip Code.", 0x2FuLL, 1);
      uint64_t v41 = v11;
      uint64_t v12 = sub_28170("Diagnostics message for URL to long to be encoded as App Clip Code.", 0x43uLL, v38 & 1);
      uint64_t v40 = v13;
      uint64_t v42 = sub_17534(v39, v41, v12, v13);
      uint64_t v43 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v50 = v42;
      uint64_t v51 = v43;
    }
    uint64_t v34 = v51;
    uint64_t v33 = v50;
    uint64_t v76 = v50;
    uint64_t v77 = v51;
    sub_DF90(v53, v52);
    uint64_t v35 = v33;
    uint64_t v36 = v34;
    BOOL v37 = v54;
  }
  BOOL v25 = v37;
  uint64_t v26 = v36;
  return v35;
}

uint64_t sub_DF90(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void *type metadata accessor for ACCRequirementsController()
{
  return &unk_31388;
}

uint64_t sub_E030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v6[1] = a1;
  swift_bridgeObjectRetain();
  v6[0] = a1;
  uint64_t v2 = sub_6C4C(&qword_35640);
  sub_E098((uint64_t)v6, v2, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_E098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[1] = a3;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v9 = a2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = a2 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  v4[2] = (char *)v4 - v4[0];
  (*(void (**)(void))(v5 + 16))();
  sub_27B80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

uint64_t sub_E188()
{
  swift_retain();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_27BC0();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_E224@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 136))(v2);
  return swift_release();
}

uint64_t sub_E2A4(uint64_t *a1, uint64_t *a2)
{
  sub_115B4(a1, &v6);
  uint64_t v4 = v6;
  uint64_t v5 = *a2;
  swift_retain();
  (*(void (**)(uint64_t))(*(void *)v5 + 144))(v4);
  return swift_release();
}

uint64_t sub_E330()
{
  return swift_bridgeObjectRelease();
}

void (*sub_E3D4(void *a1))(void (***a1)(void, void))
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v2;
  swift_retain();
  v3[5] = swift_getKeyPath();
  v3[6] = swift_getKeyPath();
  v3[7] = sub_27BB0();
  return sub_E4AC;
}

void sub_E4AC(void (***a1)(void, void))
{
  uint64_t v1 = *a1;
  v1[7](v1, 0);
  swift_release();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_E588()
{
  return swift_endAccess();
}

uint64_t sub_E5FC(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_6C4C(&qword_35650);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_6C4C(&qword_35648);
  sub_27BA0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_E740(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_6C4C(&qword_35650);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_E588();
  return sub_E848;
}

void sub_E848(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_E5FC((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_E5FC((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

id sub_E944()
{
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel_metaTagRequirementController);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_E9A4(void *a1)
{
  id v2 = a1;
  id v4 = (void **)(v1
               + OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel_metaTagRequirementController);
  swift_beginAccess();
  uint64_t v3 = *v4;
  void *v4 = a1;

  swift_endAccess();
}

uint64_t (*sub_EA14())()
{
  return sub_EA78;
}

uint64_t sub_EA78()
{
  return swift_endAccess();
}

uint64_t (*sub_EAB8())()
{
  return nullsub_2;
}

void *sub_EAD4(uint64_t a1)
{
  uint64_t v81 = a1;
  uint64_t v93 = 0;
  uint64_t v92 = 0;
  uint64_t v82 = v90;
  v90[0] = 0;
  v90[1] = 0;
  char v87 = 0;
  uint64_t v76 = type metadata accessor for Feature();
  unint64_t v74 = (*(void *)(*(void *)(v76 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v75 = (uint64_t)&v31 - v74;
  uint64_t v93 = __chkstk_darwin(v81);
  uint64_t v92 = v1;
  id v2 = *(uint64_t (**)(void))(*(void *)v1 + 152);
  uint64_t v79 = &v91;
  uint64_t v80 = (void (*)(void))v2();
  int v77 = sub_F280();
  uint64_t v78 = sub_6C4C(&qword_35640);
  sub_28220(v77 & 1);
  v80();
  swift_bridgeObjectRetain();
  uint64_t v89 = v81;
  uint64_t v83 = sub_6C4C(&qword_35658);
  sub_F298();
  sub_28280();
  while (1)
  {
    sub_6C4C(&qword_35668);
    sub_28330();
    int v72 = v88;
    if (v88 == 3) {
      break;
    }
    int v71 = v72;
    int v70 = v72;
    char v87 = v72;
    if ((_BYTE)v72)
    {
      uint64_t v24 = v73;
      if (v70 == 1)
      {
        uint64_t v67 = type metadata accessor for Requirement();
        uint64_t v66 = sub_28350();
        uint64_t v62 = v3;
        uint64_t v53 = sub_1557C();
        uint64_t v54 = v4;
        char v5 = sub_15588();
        sub_15590(1, v53, v54, v5, v62);
        uint64_t v61 = *(void *)(*(void *)(v67 - 8) + 72);
        uint64_t v55 = v62 + v61;
        uint64_t v56 = sub_1557C();
        uint64_t v57 = v6;
        char v7 = sub_15588();
        sub_15590(2, v56, v57, v7, v55);
        uint64_t v58 = v62 + 2 * v61;
        uint64_t v59 = sub_1557C();
        uint64_t v60 = v8;
        char v9 = sub_15588();
        sub_15590(3, v59, v60, v9, v58);
        uint64_t v63 = v62 + 3 * v61;
        uint64_t v64 = sub_1557C();
        uint64_t v65 = v10;
        char v11 = sub_15588();
        sub_15590(4, v64, v65, v11, v63);
        uint64_t v12 = v66;
        sub_6EDC();
        sub_14504(v70, v12, v75);
        uint64_t v13 = *(uint64_t (**)(void))(*(void *)v24 + 152);
        uint64_t v68 = &v84;
        uint64_t v69 = (void (*)(void))v13();
        sub_28210();
        v69();
      }
      else
      {
        uint64_t v35 = type metadata accessor for Requirement();
        uint64_t v34 = sub_28350();
        uint64_t v31 = v25;
        uint64_t v32 = sub_1557C();
        uint64_t v33 = v26;
        char v27 = sub_15588();
        sub_15590(5, v32, v33, v27, v31);
        uint64_t v28 = v34;
        sub_6EDC();
        sub_14504(v70, v28, v75);
        int v29 = *(uint64_t (**)(void))(*(void *)v24 + 152);
        uint64_t v36 = &v86;
        BOOL v37 = (void (*)(void))v29();
        sub_28210();
        v37();
      }
    }
    else
    {
      uint64_t v14 = v73;
      uint64_t v49 = type metadata accessor for Requirement();
      uint64_t v48 = sub_28350();
      uint64_t v44 = v15;
      uint64_t v38 = sub_1557C();
      uint64_t v39 = v16;
      char v17 = sub_15588();
      int v51 = 0;
      sub_15590(0, v38, v39, v17, v44);
      uint64_t v43 = *(void *)(*(void *)(v49 - 8) + 72);
      uint64_t v40 = v44 + v43;
      uint64_t v41 = sub_1557C();
      uint64_t v42 = v18;
      char v19 = sub_15588();
      sub_15590(2, v41, v42, v19, v40);
      uint64_t v45 = v44 + 2 * v43;
      uint64_t v46 = sub_1557C();
      uint64_t v47 = v20;
      char v21 = sub_15588();
      sub_15590(3, v46, v47, v21, v45);
      uint64_t v22 = v48;
      sub_6EDC();
      sub_14504(v70, v22, v75);
      uint64_t v23 = *(uint64_t (**)(void))(*(void *)v14 + 152);
      uint64_t v50 = &v85;
      unint64_t v52 = (void (*)(void))v23();
      sub_28210();
      v52();
    }
  }
  uint64_t result = v90;
  sub_7084();
  return result;
}

uint64_t sub_F280()
{
  return 0;
}

unint64_t sub_F298()
{
  uint64_t v2 = qword_35660;
  if (!qword_35660)
  {
    sub_700C(&qword_35658);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35660);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_F31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v15 = a3;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  char v24 = 0;
  uint64_t v4 = sub_6C4C(&qword_35670);
  unint64_t v14 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v22 = &v9[-v14];
  uint64_t v23 = sub_27B20();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v16 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v15);
  char v17 = &v9[-v16];
  uint64_t v33 = &v9[-v16];
  uint64_t v31 = v6;
  uint64_t v32 = v7;
  uint64_t v30 = v5;
  uint64_t v29 = v3;
  (*(void (**)(void))(*(void *)v3 + 328))();
  sub_27B10();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48))(v22, 1, v23) == 1) {
    return sub_F638((uint64_t)v22);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v20 + 32))(v17, v22, v23);
  swift_bridgeObjectRetain();
  uint64_t v26 = v15;
  uint64_t v13 = sub_6C4C(&qword_35658);
  sub_F298();
  sub_28280();
  while (1)
  {
    sub_6C4C(&qword_35668);
    sub_28330();
    int v12 = v25;
    if (v25 == 3) {
      break;
    }
    int v11 = v12;
    int v10 = v12;
    char v24 = v12;
    if ((_BYTE)v12)
    {
      if (v10 == 1) {
        sub_BFE4((uint64_t)v17);
      }
      else {
        sub_8878((uint64_t)v17);
      }
    }
    else
    {
      sub_1201C((uint64_t)v17);
    }
  }
  sub_7084();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v20 + 8))(v17, v23);
}

uint64_t sub_F638(uint64_t a1)
{
  uint64_t v3 = sub_27B20();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t *sub_F6E8(char a1)
{
  char v5 = a1;
  uint64_t v4 = v1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 136))();
  sub_6C4C(&qword_35640);
  sub_F860();
  sub_281C0();
  uint64_t result = &v3;
  sub_7084();
  return result;
}

BOOL sub_F7D4(uint64_t a1, char a2)
{
  uint64_t v2 = type metadata accessor for Feature();
  return sub_13768(*(unsigned char *)(a1 + *(int *)(v2 + 20)), a2);
}

BOOL sub_F834(uint64_t a1)
{
  return sub_F7D4(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_F860()
{
  uint64_t v2 = qword_35678;
  if (!qword_35678)
  {
    sub_700C(&qword_35640);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35678);
    return WitnessTable;
  }
  return v2;
}

void *sub_F8E4@<X0>(unsigned int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a3;
  unsigned int v17 = a1;
  int v19 = a2;
  uint64_t v23 = sub_F834;
  unint64_t v16 = sub_FD48;
  char v29 = 0;
  char v28 = 0;
  uint64_t v27 = 0;
  unint64_t v18 = (*(void *)(*(void *)(sub_6C4C(&qword_35680) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = (uint64_t)&v9 - v18;
  char v29 = __chkstk_darwin(v17);
  char v28 = v4;
  uint64_t v27 = v3;
  v26[1] = (*(uint64_t (**)(void))(*(void *)v3 + 136))();
  uint64_t v21 = v25;
  v25[16] = v19;
  uint64_t v22 = sub_6C4C(&qword_35640);
  sub_F860();
  sub_281C0();
  uint64_t v24 = 0;
  sub_7084();
  uint64_t v14 = type metadata accessor for Feature();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v20, 1) == 1)
  {
    sub_FBA8(v20);
    uint64_t v8 = type metadata accessor for Requirement();
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v15, 1);
  }
  else
  {
    uint64_t v5 = v24;
    uint64_t v10 = *(void *)(v20 + *(int *)(v14 + 24));
    swift_bridgeObjectRetain();
    sub_FC6C(v20);
    v26[0] = v10;
    int v11 = &v9;
    __chkstk_darwin(&v9);
    int v12 = &v9 - 4;
    *((unsigned char *)&v9 - 16) = v6;
    uint64_t v13 = sub_6C4C(&qword_35688);
    sub_FD74();
    uint64_t result = (void *)sub_281C0();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      uint64_t result = v26;
      sub_7084();
    }
  }
  return result;
}

uint64_t sub_FBA8(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for Feature();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1))
  {
    uint64_t v1 = sub_27B60();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_FC6C(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for Feature();
  swift_bridgeObjectRelease();
  return a1;
}

BOOL sub_FCE8(uint64_t a1, char a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return sub_14770(*(unsigned char *)(a1 + *(int *)(v2 + 20)), a2);
}

BOOL sub_FD48(uint64_t a1)
{
  return sub_FCE8(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_FD74()
{
  uint64_t v2 = qword_35690;
  if (!qword_35690)
  {
    sub_700C(&qword_35688);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35690);
    return WitnessTable;
  }
  return v2;
}

void *sub_FDF8(unsigned int a1, uint64_t a2)
{
  unsigned int v43 = a1;
  uint64_t v39 = a2;
  uint64_t v34 = 0;
  uint64_t v46 = sub_F834;
  uint64_t v33 = sub_104B4;
  char v61 = 0;
  uint64_t v60 = 0;
  uint64_t v59 = 0;
  uint64_t v56 = 0;
  uint64_t v52 = 0;
  unint64_t v35 = (*(void *)(*(void *)(type metadata accessor for Requirement() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(0);
  uint64_t v36 = (uint64_t)v13 - v35;
  unint64_t v37 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v38 = (uint64_t)v13 - v37;
  uint64_t v40 = type metadata accessor for Feature();
  unint64_t v41 = (*(void *)(*(void *)(v40 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v5 = __chkstk_darwin(v43);
  uint64_t v42 = (uint64_t)v13 - v41;
  char v61 = v5;
  uint64_t v60 = v6;
  uint64_t v59 = v2;
  v57[0] = (*(uint64_t (**)(void))(*(void *)v2 + 136))();
  uint64_t v44 = v48;
  v48[16] = v43;
  uint64_t v45 = sub_6C4C(&qword_35640);
  sub_103C8();
  sub_28260();
  uint64_t v47 = 0;
  uint64_t result = v57;
  sub_7084();
  uint64_t v31 = v57[1];
  if ((v58 & 1) == 0)
  {
    uint64_t v30 = v31;
    uint64_t v8 = v47;
    uint64_t v23 = v31;
    uint64_t v56 = v31;
    uint64_t v24 = (*(uint64_t (**)(void *))(*(void *)v32 + 136))(v57);
    sub_28250();
    uint64_t v25 = *(void *)(v42 + *(int *)(v40 + 24));
    swift_bridgeObjectRetain();
    uint64_t v53 = v25;
    sub_8D4C(v39, v38);
    uint64_t v26 = v13;
    unint64_t v27 = 32;
    __chkstk_darwin(v13);
    char v28 = &v13[v27 / 0xFFFFFFFFFFFFFFF8];
    v28[2] = v9;
    uint64_t v29 = sub_6C4C(&qword_35688);
    sub_104E0();
    uint64_t result = (void *)sub_28260();
    if (v8)
    {
      __break(1u);
    }
    else
    {
      sub_8E38(v38);
      sub_7084();
      sub_FC6C(v42);
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v22 = v54;
      if ((v55 & 1) == 0)
      {
        uint64_t v21 = v22;
        uint64_t v10 = v32;
        v13[1] = v22;
        uint64_t v52 = v22;
        sub_8D4C(v39, v36);
        int v11 = *(uint64_t (**)(void))(*(void *)v10 + 152);
        unint64_t v18 = &v51;
        uint64_t v20 = (uint64_t (*)(void))v11();
        unint64_t v16 = &v50;
        unsigned int v17 = (void (*)(void))sub_28240();
        uint64_t v15 = &v49;
        uint64_t v14 = (void (*)(void))sub_28240();
        sub_10564(v36, v12);
        int v19 = 0;
        v14();
        v17();
        return (void *)v20();
      }
    }
  }
  return result;
}

unint64_t sub_103C8()
{
  uint64_t v2 = qword_35698;
  if (!qword_35698)
  {
    sub_700C(&qword_35640);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35698);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_1044C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return sub_14770(*(unsigned char *)(a1 + *(int *)(v2 + 20)), *(unsigned char *)(a2 + *(int *)(v2 + 20)));
}

BOOL sub_104B4(uint64_t a1)
{
  return sub_1044C(a1, *(void *)(v1 + 16));
}

unint64_t sub_104E0()
{
  uint64_t v2 = qword_356A0;
  if (!qword_356A0)
  {
    sub_700C(&qword_35688);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_356A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10564(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 40))(a2, a1);
  uint64_t v6 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a2 + v6[5]) = *(unsigned char *)(a1 + v6[5]);
  uint64_t v3 = (void *)(a1 + v6[6]);
  uint64_t v4 = (void *)(a2 + v6[6]);
  void *v4 = *v3;
  v4[1] = v3[1];
  swift_bridgeObjectRelease();
  uint64_t result = a2;
  *(unsigned char *)(a2 + v6[7]) = *(unsigned char *)(a1 + v6[7]);
  return result;
}

void *sub_10644(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v25 = sub_10A18;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v30 = 0;
  unint64_t v18 = (*(void *)(*(void *)(type metadata accessor for Feature() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v21);
  uint64_t v19 = (uint64_t)v9 - v18;
  unint64_t v20 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v22 = (uint64_t)v9 - v20;
  uint64_t v34 = v4;
  uint64_t v33 = v1;
  v31[0] = (*(uint64_t (**)(void))(*(void *)v1 + 136))();
  sub_1095C(v21, v22);
  uint64_t v23 = &v26;
  uint64_t v27 = v22;
  uint64_t v24 = sub_6C4C(&qword_35640);
  sub_103C8();
  sub_28260();
  sub_FC6C(v22);
  uint64_t result = v31;
  sub_7084();
  uint64_t v16 = v31[1];
  if ((v32 & 1) == 0)
  {
    uint64_t v15 = v16;
    uint64_t v6 = v17;
    v9[1] = v16;
    uint64_t v30 = v16;
    sub_1095C(v21, v19);
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)v6 + 152);
    uint64_t v12 = &v29;
    uint64_t v14 = (uint64_t (*)(void))v7();
    int v11 = &v28;
    uint64_t v10 = (void (*)(void))sub_28240();
    sub_10A44(v19, v8);
    int v13 = 0;
    v10();
    return (void *)v14();
  }
  return result;
}

BOOL sub_108F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = type metadata accessor for Feature();
  return sub_13768(*(unsigned char *)(a1 + *(int *)(v2 + 20)), *(unsigned char *)(a2 + *(int *)(v2 + 20)));
}

uint64_t sub_1095C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v3 = type metadata accessor for Feature();
  *(unsigned char *)(a2 + *(int *)(v3 + 20)) = *(unsigned char *)(a1 + *(int *)(v3 + 20));
  uint64_t v7 = *(int *)(v3 + 24);
  uint64_t v8 = *(void *)(a1 + v7);
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *(void *)(a2 + v7) = v8;
  return result;
}

BOOL sub_10A18(uint64_t a1)
{
  return sub_108F4(a1, *(void *)(v1 + 16));
}

uint64_t sub_10A44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 40))(a2, a1);
  uint64_t v3 = type metadata accessor for Feature();
  *(unsigned char *)(a2 + *(int *)(v3 + 20)) = *(unsigned char *)(a1 + *(int *)(v3 + 20));
  *(void *)(a2 + *(int *)(v3 + 24)) = *(void *)(a1 + *(int *)(v3 + 24));
  swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_10AF8(unsigned int a1)
{
  unsigned int v31 = a1;
  char v49 = 0;
  uint64_t v48 = 0;
  uint64_t v47 = 0;
  char v46 = 0;
  uint64_t v45 = 0;
  uint64_t v44 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v29 = 0;
  uint64_t v18 = type metadata accessor for Requirement();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = v18 - 8;
  unint64_t v21 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v12 - v21;
  unint64_t v23 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin((char *)&v12 - v21);
  uint64_t v24 = (uint64_t)&v12 - v23;
  char v49 = (char *)&v12 - v23;
  unint64_t v25 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v26 = (uint64_t)&v12 - v25;
  uint64_t v48 = (char *)&v12 - v25;
  uint64_t v5 = sub_6C4C(&qword_354D8);
  unint64_t v27 = (*(void *)(*(void *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v5);
  uint64_t v28 = (uint64_t)&v12 - v27;
  unint64_t v30 = (*(void *)(*(void *)(sub_6C4C(&qword_35680) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v29);
  uint64_t v39 = (uint64_t)&v12 - v30;
  uint64_t v40 = type metadata accessor for Feature();
  uint64_t v37 = *(void *)(v40 - 8);
  uint64_t v38 = v40 - 8;
  uint64_t v33 = *(void *)(v37 + 64);
  unint64_t v32 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v31);
  uint64_t v34 = (uint64_t)&v12 - v32;
  unint64_t v35 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  char v7 = __chkstk_darwin(v6);
  uint64_t v36 = (uint64_t)&v12 - v35;
  uint64_t v47 = (char *)&v12 - v35;
  char v46 = v7;
  uint64_t v45 = v1;
  (*(void (**)(void))(*(void *)v1 + 344))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v39, 1, v40) == 1) {
    return sub_FBA8(v39);
  }
  sub_11000(v39, v36);
  uint64_t v44 = sub_280F0();
  uint64_t v15 = *(void *)(v36 + *(int *)(v40 + 24));
  swift_bridgeObjectRetain();
  uint64_t v41 = v15;
  uint64_t v16 = sub_6C4C(&qword_35688);
  sub_104E0();
  sub_28280();
  while (1)
  {
    sub_6C4C(&qword_356A8);
    sub_28330();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v28, 1, v18) == 1) {
      break;
    }
    sub_8C88(v28, v26);
    sub_8D4C(v26, v24);
    uint64_t v8 = (uint64_t)v22;
    uint64_t v9 = v24;
    *(unsigned char *)(v24 + *(int *)(v18 + 28)) = 1;
    sub_8D4C(v9, v8);
    sub_28210();
    sub_8E38(v24);
    sub_8E38(v26);
  }
  uint64_t v10 = v17;
  sub_7084();
  uint64_t v14 = &v44;
  uint64_t v13 = v44;
  swift_bridgeObjectRetain();
  *(void *)(v36 + *(int *)(v40 + 24)) = v13;
  swift_bridgeObjectRelease();
  sub_1095C(v36, v34);
  (*(void (**)(uint64_t))(*(void *)v10 + 368))(v34);
  sub_FC6C(v34);
  sub_7084();
  return sub_FC6C(v36);
}

uint64_t sub_11000(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = type metadata accessor for Feature();
  uint64_t result = a2;
  *(unsigned char *)(a2 + *(int *)(v3 + 20)) = *(unsigned char *)(a1 + *(int *)(v3 + 20));
  *(void *)(a2 + *(int *)(v3 + 24)) = *(void *)(a1 + *(int *)(v3 + 24));
  return result;
}

uint64_t sub_110A8()
{
  uint64_t v3 = OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel__features;
  uint64_t v1 = sub_6C4C(&qword_35648);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel_metaTagRequirementController));
  return v4;
}

uint64_t sub_11138()
{
  return swift_deallocClassInstance();
}

uint64_t sub_111A0()
{
  return sub_111DC();
}

uint64_t sub_111DC()
{
  uint64_t v16 = 0;
  uint64_t v12 = sub_6C4C(&qword_35648);
  uint64_t v8 = *(void *)(v12 - 8);
  uint64_t v9 = v12 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  uint64_t v11 = (uint64_t)&v7 - v7;
  uint64_t v16 = v0;
  uint64_t v10 = OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel__features;
  uint64_t v13 = 0;
  type metadata accessor for Feature();
  uint64_t v1 = sub_280F0();
  sub_E030(v1, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v0 + v10, v11, v12);
  uint64_t v14 = OBJC_IVAR____TtC24AppClipDeveloperSettings29DeveloperDiagnosticsViewModel_metaTagRequirementController;
  type metadata accessor for MetaTagRequirementController();
  *(void *)(v15 + v14) = DeveloperDiagnosticsViewControllerFactory.__allocating_init()();
  uint64_t v2 = ((uint64_t (*)(void))nullsub_2)();
  uint64_t v3 = nullsub_2(v2);
  uint64_t v4 = nullsub_2(v3);
  uint64_t v5 = nullsub_2(v4);
  nullsub_2(v5);
  return v15;
}

uint64_t sub_11310@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DeveloperDiagnosticsViewModel();
  uint64_t result = sub_27B70();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for DeveloperDiagnosticsViewModel()
{
  uint64_t v1 = qword_36030;
  if (!qword_36030) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_113C4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_113D0()
{
  return type metadata accessor for DeveloperDiagnosticsViewModel();
}

uint64_t sub_113EC()
{
  uint64_t updated = sub_1150C();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_1150C()
{
  uint64_t v4 = qword_356D8;
  if (!qword_356D8)
  {
    sub_700C(&qword_35640);
    unint64_t v3 = sub_27BE0();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_356D8);
      return v1;
    }
  }
  return v4;
}

void *sub_115B4(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

void sub_115EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  id v7 = self;
  swift_bridgeObjectRetain();
  id v9 = sub_28130();
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  uint64_t v15 = sub_11A44;
  uint64_t v16 = v4;
  aBlock = _NSConcreteStackBlock;
  int v11 = 1107296256;
  int v12 = 0;
  uint64_t v13 = sub_7DC4;
  uint64_t v14 = &unk_313C0;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_release();
  [v7 fetchAMPMetadataWithBundleID:v9 completion:v8];
  _Block_release(v8);
}

void sub_11750(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v20 = a1;
  uint64_t v18 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t v21 = 0;
  uint64_t v19 = sub_11FA4;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v25 = sub_280C0();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v25 - 8;
  unint64_t v14 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v24 = (char *)&v14 - v14;
  uint64_t v29 = sub_280E0();
  uint64_t v26 = *(void *)(v29 - 8);
  uint64_t v27 = v29 - 8;
  unint64_t v15 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v21);
  uint64_t v28 = (char *)&v14 - v15;
  uint64_t v42 = v4;
  uint64_t v41 = v5;
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  sub_7EF8();
  id v31 = (id)sub_28290();
  id v8 = v20;
  swift_retain();
  swift_errorRetain();
  id v9 = (void *)swift_allocObject();
  uint64_t v10 = v16;
  uint64_t v11 = v17;
  uint64_t v12 = v18;
  uint64_t v13 = v19;
  void v9[2] = v20;
  v9[3] = v10;
  void v9[4] = v11;
  v9[5] = v12;
  uint64_t v37 = v13;
  uint64_t v38 = v9;
  aBlock = _NSConcreteStackBlock;
  int v33 = 1107296256;
  int v34 = 0;
  unint64_t v35 = sub_7CC4;
  uint64_t v36 = &unk_31430;
  unint64_t v30 = _Block_copy(&aBlock);
  swift_release();
  sub_7D14();
  sub_7D2C();
  sub_282A0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v29);
  _Block_release(v30);
}

uint64_t sub_11A04()
{
  return swift_deallocObject();
}

void sub_11A44(void *a1, uint64_t a2)
{
  sub_11750(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_11A50(void *a1, void (*a2)(uint64_t, uint64_t, void *), uint64_t a3, uint64_t a4)
{
  id v4 = a1;
  if (a1)
  {
    id v38 = [a1 clipBundleID];
    if (v38)
    {
      sub_28140();
      uint64_t v36 = v5;

      uint64_t v37 = v36;
    }
    else
    {
      uint64_t v37 = 0;
    }

    uint64_t v39 = v37;
  }
  else
  {
    uint64_t v39 = 0;
  }
  if (v39)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_28170("The App Clip is available on the App Store.", 0x2BuLL, 1);
    int v33 = v6;
    uint64_t v7 = sub_28170("diagnostics message for when an app clip exists in app store.", 0x3DuLL, 1);
    uint64_t v34 = sub_17534(v32, v33, v7, v8);
    uint64_t v35 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    a2(v34, v35, a1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_errorRetain();
    if (a4)
    {
      uint64_t v21 = sub_28170("Unable to load App Store metadata: %@", 0x25uLL, 1);
      uint64_t v22 = v15;
      uint64_t v16 = sub_28170("diagnostics message for when an error is encountered while fetching App Store metadata.", 0x57uLL, 1);
      sub_17534(v21, v22, v16, v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_6C4C((uint64_t *)&unk_355D0);
      sub_28350();
      uint64_t v25 = v18;
      swift_getErrorValue();
      uint64_t v23 = sub_28360();
      uint64_t v24 = v19;
      v25[3] = (uint64_t)&type metadata for String;
      v25[4] = sub_6E60();
      uint64_t *v25 = v23;
      v25[1] = v24;
      sub_6EDC();
      uint64_t v26 = sub_28150();
      uint64_t v27 = v20;
      swift_bridgeObjectRelease();
      swift_retain();
      a2(v26, v27, 0);
      swift_release();
      swift_bridgeObjectRelease();
      return swift_errorRelease();
    }
    else
    {
      uint64_t v28 = sub_28170("The App Clip is not available on the App Store.", 0x2FuLL, 1);
      uint64_t v29 = v11;
      uint64_t v12 = sub_28170("diagnostics message for when an app clip does not exist in app store", 0x44uLL, 1);
      uint64_t v30 = sub_17534(v28, v29, v12, v13);
      uint64_t v31 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_retain();
      a2(v30, v31, 0);
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_11EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_11F24()
{
  return swift_release();
}

void *type metadata accessor for AppPublishedRequirementController()
{
  return &unk_313F8;
}

uint64_t sub_11F54()
{
  swift_release();
  swift_errorRelease();
  return swift_deallocObject();
}

uint64_t sub_11FA4()
{
  return sub_11A50(*(void **)(v0 + 16), *(void (**)(uint64_t, uint64_t, void *))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_11FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_12000()
{
  return swift_release();
}

uint64_t sub_1201C(uint64_t a1)
{
  uint64_t v46 = a1;
  uint64_t v53 = 0;
  id v38 = sub_12E14;
  uint64_t v65 = 0;
  uint64_t v64 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  uint64_t v61 = 0;
  uint64_t v39 = sub_27B20();
  uint64_t v41 = *(void *)(v39 - 8);
  uint64_t v40 = v39 - 8;
  uint64_t v42 = v41;
  uint64_t v43 = *(void *)(v41 + 64);
  unint64_t v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v39);
  uint64_t v45 = (char *)&v28 - v44;
  unint64_t v47 = (*(void *)(*(void *)(sub_6C4C(&qword_354D8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v46);
  uint64_t v48 = (uint64_t)&v28 - v47;
  unint64_t v49 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v50 = (uint64_t)&v28 - v49;
  unint64_t v51 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v57 = (uint64_t)&v28 - v51;
  uint64_t v65 = v6;
  uint64_t v64 = v1;
  uint64_t v7 = *(void (**)(void))(*(void *)v1 + 376);
  unsigned int v55 = 0;
  v7();
  uint64_t v8 = v52;
  uint64_t v58 = type metadata accessor for Requirement();
  uint64_t v54 = swift_allocBox();
  uint64_t v56 = v9;
  uint64_t v63 = v9;
  (*(void (**)(void))(*(void *)v8 + 352))(v55);
  uint64_t v10 = *(void *)(v58 - 8);
  uint64_t v59 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v60 = v10 + 48;
  if (((unsigned int (*)(uint64_t, uint64_t))v59)(v57, 1) == 1)
  {
    sub_8BC0(v57);
    return swift_deallocBox();
  }
  else
  {
    uint64_t v11 = v52;
    sub_8C88(v57, v56);
    uint64_t v36 = swift_allocBox();
    uint64_t v37 = v12;
    uint64_t v62 = v12;
    (*(void (**)(uint64_t, void))(*(void *)v11 + 352))(2, 0);
    if (v59(v50, 1, v58) == 1)
    {
      sub_8BC0(v50);
      swift_deallocBox();
      return swift_release();
    }
    else
    {
      uint64_t v13 = v52;
      sub_8C88(v50, v37);
      uint64_t v34 = swift_allocBox();
      uint64_t v35 = v14;
      uint64_t v61 = v14;
      (*(void (**)(uint64_t, void))(*(void *)v13 + 352))(3, 0);
      if (v59(v48, 1, v58) == 1)
      {
        sub_8BC0(v48);
        swift_deallocBox();
      }
      else
      {
        uint64_t v15 = v52;
        __n128 v16 = sub_8C88(v48, v35);
        uint64_t v17 = (void *)(*(uint64_t (**)(__n128))(*(void *)v15 + 184))(v16);
        id v33 = v17;
        swift_retain();
        swift_retain();
        swift_retain();
        uint64_t v29 = v42;
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v45, v46, v39);
        swift_retain();
        unint64_t v30 = (*(unsigned __int8 *)(v29 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
        unint64_t v31 = (v30 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v18 = (void *)swift_allocObject();
        uint64_t v19 = v52;
        unint64_t v20 = v30;
        uint64_t v21 = v41;
        uint64_t v22 = v45;
        uint64_t v23 = v39;
        uint64_t v24 = v36;
        uint64_t v32 = v18;
        v18[2] = v54;
        v18[3] = v19;
        v18[4] = v24;
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v18 + v20, v22, v23);
        uint64_t v25 = v38;
        uint64_t v26 = v46;
        *(void *)((char *)v32 + v31) = v34;
        (*(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t)))((char *)&stru_68.size + (*v17 & swift_isaMask)))(v26, v25);
        swift_release();

        swift_release();
      }
      swift_release();
      return swift_release();
    }
  }
}

uint64_t sub_12630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  uint64_t v64 = a3;
  uint64_t v79 = a4;
  uint64_t v65 = a5;
  uint64_t v68 = a6;
  uint64_t v69 = a7;
  uint64_t v70 = a8;
  uint64_t v71 = a9;
  uint64_t v56 = 0;
  unsigned int v55 = sub_13498;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  uint64_t v95 = 0;
  uint64_t v94 = 0;
  uint64_t v93 = 0;
  uint64_t v92 = 0;
  uint64_t v91 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v57 = sub_27B20();
  uint64_t v59 = *(void *)(v57 - 8);
  uint64_t v58 = v57 - 8;
  uint64_t v60 = v59;
  uint64_t v61 = *(void *)(v59 + 64);
  unint64_t v62 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v63 = (char *)v35 - v62;
  uint64_t v74 = type metadata accessor for Requirement();
  unint64_t v66 = (*(void *)(*(void *)(v74 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v65);
  uint64_t v67 = (uint64_t)v35 - v66;
  uint64_t v98 = v9;
  uint64_t v99 = v10;
  uint64_t v96 = v11;
  uint64_t v97 = v12;
  uint64_t v75 = swift_projectBox();
  uint64_t v95 = v75;
  uint64_t v94 = v68;
  uint64_t v72 = swift_projectBox();
  uint64_t v93 = v72;
  uint64_t v92 = v70;
  uint64_t v73 = swift_projectBox();
  uint64_t v91 = v73;
  swift_bridgeObjectRetain();
  uint64_t v78 = &v90;
  swift_beginAccess();
  uint64_t v13 = v77;
  uint64_t v14 = (void *)(v75 + *(int *)(v74 + 24));
  *uint64_t v14 = v76;
  v14[1] = v13;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRetain();
  if (v79)
  {
    uint64_t v53 = v64;
    uint64_t v54 = v79;
    uint64_t v51 = v79;
    uint64_t v52 = v64;
    uint64_t v82 = v64;
    uint64_t v83 = v79;
    char v15 = sub_28190();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = v68;
      unint64_t v44 = &v81;
      uint64_t v45 = 0;
      swift_beginAccess();
      *(unsigned char *)(v75 + *(int *)(v74 + 28)) = 2;
      swift_endAccess();
      uint64_t v46 = &v80;
      swift_beginAccess();
      sub_8D4C(v75, v67);
      swift_endAccess();
      (*(void (**)(void, uint64_t))(*(void *)v16 + 360))(0, v67);
      uint64_t v17 = v68;
      uint64_t v18 = sub_8E38(v67);
      (*(void (**)(uint64_t))(*(void *)v17 + 232))(v18);
      swift_retain();
      swift_retain();
      uint64_t v47 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v63, v70, v57);
      swift_retain();
      unint64_t v48 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
      unint64_t v49 = (v48 + v61 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v19 = swift_allocObject();
      uint64_t v20 = v68;
      unint64_t v21 = v48;
      uint64_t v22 = v59;
      uint64_t v23 = v63;
      uint64_t v24 = v57;
      uint64_t v50 = v19;
      *(void *)(v19 + 16) = v69;
      *(void *)(v19 + 24) = v20;
      (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v19 + v21, v23, v24);
      uint64_t v25 = (uint64_t)v55;
      uint64_t v26 = v50;
      uint64_t v27 = v51;
      uint64_t v28 = v52;
      *(void *)(v50 + v49) = v71;
      sub_115EC(v28, v27, v25, v26);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v30 = v68;
  v35[1] = &v89;
  v35[3] = 33;
  uint64_t v41 = 0;
  swift_beginAccess();
  *(unsigned char *)(v75 + *(int *)(v74 + 28)) = 3;
  swift_endAccess();
  v35[2] = &v88;
  swift_beginAccess();
  unint64_t v31 = (unsigned char *)(v72 + *(int *)(v74 + 28));
  int v36 = 4;
  *unint64_t v31 = 4;
  swift_endAccess();
  uint64_t v37 = &v87;
  swift_beginAccess();
  *(unsigned char *)(v73 + *(int *)(v74 + 28)) = v36;
  swift_endAccess();
  id v38 = &v86;
  uint64_t v40 = 32;
  swift_beginAccess();
  sub_8D4C(v75, v67);
  swift_endAccess();
  uint64_t v32 = *(void (**)(void))(*(void *)v30 + 360);
  unsigned int v43 = 0;
  v32();
  uint64_t v33 = v68;
  sub_8E38(v67);
  uint64_t v39 = &v85;
  swift_beginAccess();
  sub_8D4C(v72, v67);
  swift_endAccess();
  (*(void (**)(void, uint64_t))(*(void *)v33 + 360))(v43, v67);
  uint64_t v34 = v68;
  sub_8E38(v67);
  uint64_t v42 = &v84;
  swift_beginAccess();
  sub_8D4C(v73, v67);
  swift_endAccess();
  (*(void (**)(void, uint64_t))(*(void *)v34 + 360))(v43, v67);
  return sub_8E38(v67);
}

uint64_t sub_12CF8()
{
  uint64_t v4 = sub_27B20();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_12E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(sub_27B20() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return sub_12630(a1, a2, a3, a4, v4[2], v4[3], v4[4], (uint64_t)v4 + v5, *(uint64_t *)((char *)v4 + ((v5 + *(void *)(v11 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_12EDC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  id v49 = a3;
  uint64_t v37 = a4;
  uint64_t v40 = a5;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  uint64_t v65 = 0;
  uint64_t v64 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  id v55 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  char v52 = 0;
  uint64_t v44 = type metadata accessor for Requirement();
  unint64_t v38 = (*(void *)(*(void *)(v44 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v37);
  uint64_t v39 = (uint64_t)&v20 - v38;
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  uint64_t v66 = v9;
  uint64_t v45 = swift_projectBox();
  uint64_t v65 = v45;
  uint64_t v64 = v40;
  uint64_t v63 = v41;
  uint64_t v43 = swift_projectBox();
  uint64_t v62 = v43;
  swift_bridgeObjectRetain();
  unint64_t v48 = &v61;
  swift_beginAccess();
  uint64_t v10 = v47;
  uint64_t v11 = (void *)(v45 + *(int *)(v44 + 24));
  *uint64_t v11 = v46;
  v11[1] = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  id v60 = v49;
  BOOL v36 = v49 != 0;
  if (v49) {
    int v35 = 2;
  }
  else {
    int v35 = 3;
  }
  uint64_t v12 = v40;
  int v31 = v35;
  uint64_t v32 = &v59;
  uint64_t v33 = 0;
  swift_beginAccess();
  *(unsigned char *)(v45 + *(int *)(v44 + 28)) = v31;
  swift_endAccess();
  uint64_t v34 = &v58;
  swift_beginAccess();
  sub_8D4C(v45, v39);
  swift_endAccess();
  (*(void (**)(void, uint64_t))(*(void *)v12 + 360))(0, v39);
  sub_8E38(v39);
  id v13 = v49;
  if (v49)
  {
    id v30 = v49;
    uint64_t v24 = v49;
    id v55 = v49;
    (*(void (**)(id))(*(void *)v40 + 256))(v13);
    uint64_t v25 = sub_8210(v24, v41);
    uint64_t v26 = v14;
    int v28 = v15;
    uint64_t v53 = v25;
    uint64_t v54 = v14;
    char v52 = v15 & 1;
    swift_bridgeObjectRetain();
    uint64_t v27 = &v51;
    swift_beginAccess();
    uint64_t v16 = v26;
    uint64_t v17 = (uint64_t *)(v43 + *(int *)(v44 + 24));
    uint64_t *v17 = v25;
    v17[1] = v16;
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (v28) {
      int v23 = 2;
    }
    else {
      int v23 = 3;
    }
    int v21 = v23;
    uint64_t v22 = &v50;
    swift_beginAccess();
    *(unsigned char *)(v43 + *(int *)(v44 + 28)) = v21;
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = &v57;
    swift_beginAccess();
    *(unsigned char *)(v43 + *(int *)(v44 + 28)) = 4;
    swift_endAccess();
  }
  uint64_t v18 = v40;
  uint64_t v20 = &v56;
  swift_beginAccess();
  sub_8D4C(v43, v39);
  swift_endAccess();
  (*(void (**)(void, uint64_t))(*(void *)v18 + 360))(0, v39);
  return sub_8E38(v39);
}

uint64_t sub_13384()
{
  uint64_t v4 = sub_27B20();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_13498(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *(void *)(sub_27B20() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = *(void *)(v3 + ((v4 + *(void *)(v12 + 64) + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_12EDC(a1, a2, a3, v5, v6, v3 + v4, v7);
}

id sub_13558()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for BundleClass();
  id v2 = objc_msgSendSuper2(&v3, "init");
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id sub_135EC()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleClass();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_13638()
{
  return sub_13710();
}

unint64_t sub_13680()
{
  uint64_t v2 = qword_35880;
  if (!qword_35880)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_35880);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for BundleClass()
{
  return self;
}

id sub_13710()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = [(id)swift_getObjCClassFromMetadata() bundleForClass:ObjCClassFromMetadata];

  return v0;
}

BOOL sub_13768(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_1383C()
{
  return sub_28370();
}

uint64_t sub_138E8()
{
  return sub_28320();
}

unint64_t sub_13934()
{
  uint64_t v2 = qword_358B0;
  if (!qword_358B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358B0);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_139B4(char *a1, char *a2)
{
  return sub_13768(*a1, *a2);
}

uint64_t sub_139D8()
{
  return sub_138E8();
}

uint64_t sub_139F4()
{
  return sub_1383C();
}

Swift::Int sub_13A10(Swift::Int a1)
{
  return sub_28100(a1);
}

uint64_t sub_13A28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_27B60();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 16))(a1);
}

uint64_t sub_13A88()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Feature() + 20));
}

uint64_t type metadata accessor for Feature()
{
  uint64_t v1 = qword_36440;
  if (!qword_36440) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_13B24(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for Feature();
  uint64_t result = a1;
  *(unsigned char *)(v1 + *(int *)(v2 + 20)) = a1;
  return result;
}

uint64_t sub_13B5C()
{
  uint64_t v21 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Feature() + 20));
  if (v21)
  {
    if (v21 == 1)
    {
      uint64_t v14 = sub_28170("Codes and Tags", 0xEuLL, 1);
      int v15 = v4;
      uint64_t v5 = sub_28170("Title for diagnostics feature section relating to App Clip invocation via physical code or NFC.", 0x5FuLL, 1);
      uint64_t v16 = sub_17534(v14, v15, v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16;
    }
    else
    {
      uint64_t v11 = sub_28170("Universal Links", 0xFuLL, 1);
      uint64_t v12 = v7;
      uint64_t v8 = sub_28170("Title for diagnostics feature section relating to Universal Links.", 0x42uLL, 1);
      uint64_t v13 = sub_17534(v11, v12, v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  else
  {
    uint64_t v17 = sub_28170("From Your Website", 0x11uLL, 1);
    uint64_t v18 = v1;
    uint64_t v2 = sub_28170("Title for diagnostics feature section relating to App Clip presentation on web pages.", 0x55uLL, 1);
    uint64_t v19 = sub_17534(v17, v18, v2, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
}

uint64_t sub_13D6C()
{
  uint64_t v21 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Feature() + 20));
  if (v21)
  {
    if (v21 == 1)
    {
      uint64_t v14 = sub_28170("App Clip codes, QR codes, and NFC Tags", 0x26uLL, 1);
      int v15 = v4;
      uint64_t v5 = sub_28170("Description of diagnostics feture relating to App Clip invocation from physical tags", 0x54uLL, 1);
      uint64_t v16 = sub_17534(v14, v15, v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16;
    }
    else
    {
      uint64_t v11 = sub_28170("Deep links into your app", 0x18uLL, 1);
      uint64_t v12 = v7;
      uint64_t v8 = sub_28170("Description of diagnostics feture relating to Universal Links", 0x3DuLL, 1);
      uint64_t v13 = sub_17534(v11, v12, v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  else
  {
    uint64_t v17 = sub_28170("Smart App Banner and App Clip Card in Safari", 0x2CuLL, 1);
    uint64_t v18 = v1;
    uint64_t v2 = sub_28170("Description of diagnostics feture relating to App Clip presentation on web pages", 0x50uLL, 1);
    uint64_t v19 = sub_17534(v17, v18, v2, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
}

uint64_t sub_13F7C()
{
  type metadata accessor for Feature();
  swift_bridgeObjectRetain();
  sub_6C4C(&qword_35688);
  sub_FD74();
  char v4 = sub_281B0();
  sub_7084();
  if (v4)
  {
    return 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    char v2 = sub_281D0();
    sub_7084();
    if (v2)
    {
      return 1;
    }
    else
    {
      swift_bridgeObjectRetain();
      char v1 = sub_281B0();
      sub_7084();
      if (v1) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

BOOL sub_141A0(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for Requirement();
  return sub_141F4(*(unsigned char *)(a1 + *(int *)(v1 + 28)), 0);
}

BOOL sub_141F4(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

BOOL sub_1432C(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for Requirement();
  return sub_141F4(*(unsigned char *)(a1 + *(int *)(v1 + 28)), 1);
}

BOOL sub_14380(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for Requirement();
  return sub_141F4(*(unsigned char *)(a1 + *(int *)(v1 + 28)), 2);
}

uint64_t type metadata accessor for Requirement()
{
  uint64_t v1 = qword_36450;
  if (!qword_36450) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_1444C()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for Feature() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_14484(uint64_t a1)
{
  swift_bridgeObjectRetain();
  *(void *)(v1 + *(int *)(type metadata accessor for Feature() + 24)) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_144D0()
{
  return sub_28350();
}

uint64_t sub_14504@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_27B50();
  uint64_t result = type metadata accessor for Feature();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a1;
  *(void *)(a3 + *(int *)(result + 24)) = a2;
  return result;
}

uint64_t sub_14554@<X0>(uint64_t a1@<X8>)
{
  return sub_13A28(a1);
}

uint64_t sub_1456C()
{
  return sub_28370();
}

uint64_t sub_14648()
{
  return sub_28320();
}

unint64_t sub_14694()
{
  uint64_t v2 = qword_358B8;
  if (!qword_358B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358B8);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_14714(char *a1, char *a2)
{
  return sub_141F4(*a1, *a2);
}

uint64_t sub_14738()
{
  return sub_14648();
}

uint64_t sub_14754()
{
  return sub_1456C();
}

BOOL sub_14770(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_148C8()
{
  return sub_28370();
}

uint64_t sub_149B4()
{
  return sub_28320();
}

unint64_t sub_14A00()
{
  uint64_t v2 = qword_358C0;
  if (!qword_358C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358C0);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_14A80(char *a1, char *a2)
{
  return sub_14770(*a1, *a2);
}

uint64_t sub_14AA4()
{
  return sub_149B4();
}

uint64_t sub_14AC0()
{
  return sub_148C8();
}

uint64_t sub_14ADC()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Requirement() + 20));
}

uint64_t sub_14B00()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for Requirement() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_14B48(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v2 + *(int *)(type metadata accessor for Requirement() + 24));
  void *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_14BA4()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Requirement() + 28));
}

uint64_t sub_14BC8(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for Requirement();
  uint64_t result = a1;
  *(unsigned char *)(v1 + *(int *)(v2 + 28)) = a1;
  return result;
}

uint64_t sub_14C00()
{
  switch(*(unsigned char *)(v0 + *(int *)(type metadata accessor for Requirement() + 20)))
  {
    case 1:
      uint64_t v32 = sub_28170("Register Advanced Experience", 0x1CuLL, 1);
      uint64_t v33 = v4;
      uint64_t v5 = sub_28170("Title for diagnostics requirement section related to Advanced Experience registration.", 0x56uLL, 1);
      uint64_t v34 = sub_17534(v32, v33, v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v34;
      break;
    case 2:
      uint64_t v29 = sub_28170("App Clip Published on App Store", 0x1FuLL, 1);
      id v30 = v7;
      uint64_t v8 = sub_28170("Title for diagnostics requirement section related to App Clip published in App Store.", 0x55uLL, 1);
      uint64_t v31 = sub_17534(v29, v30, v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v31;
      break;
    case 3:
      uint64_t v26 = sub_28170("Associated Domains", 0x12uLL, 1);
      uint64_t v27 = v10;
      uint64_t v11 = sub_28170("Title for diagnostics requirement section related to App Clip having a valid associated domain with the entered URL.", 0x74uLL, 1);
      uint64_t v28 = sub_17534(v26, v27, v11, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v28;
      break;
    case 4:
      uint64_t v23 = sub_28170("App Clip Code", 0xDuLL, 1);
      uint64_t v24 = v13;
      uint64_t v14 = sub_28170("Title for diagnostics requirement section related to URL being able to be encoded into App Clip Code payload.", 0x6DuLL, 1);
      uint64_t v25 = sub_17534(v23, v24, v14, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v25;
      break;
    case 5:
      uint64_t v20 = sub_28170("Opens Installed Application", 0x1BuLL, 1);
      uint64_t v21 = v16;
      uint64_t v17 = sub_28170("Title for diagnostics requirement section related to entered URL being able to open an installed application via Universal Link.", 0x80uLL, 1);
      uint64_t v22 = sub_17534(v20, v21, v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v22;
      break;
    default:
      uint64_t v35 = sub_28170("Smart App Banner", 0x10uLL, 1);
      BOOL v36 = v1;
      uint64_t v2 = sub_28170("Title for diagnostics requirement section related to smart app banner meta tag on web page.", 0x5BuLL, 1);
      uint64_t v37 = sub_17534(v35, v36, v2, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v37;
      break;
  }
  return v38;
}

uint64_t sub_14FDC()
{
  switch(*(unsigned char *)(v0 + *(int *)(type metadata accessor for Requirement() + 20)))
  {
    case 1:
      uint64_t v32 = sub_28170("To support additional invocations (for example, from scanning an App Clip Code or an NFC tag), create an Advanced Experience in App Store Connect.", 0x92uLL, 1);
      uint64_t v33 = v4;
      uint64_t v5 = sub_28170("Description of the advanced experience registration requirement.", 0x40uLL, 1);
      uint64_t v34 = sub_17534(v32, v33, v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v34;
      break;
    case 2:
      uint64_t v29 = sub_28170("App Clips must be published on the App Store for invocation.", 0x3CuLL, 1);
      id v30 = v7;
      uint64_t v8 = sub_28170("Description of the app published requirement.", 0x2DuLL, 1);
      uint64_t v31 = sub_17534(v29, v30, v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v31;
      break;
    case 3:
      uint64_t v26 = sub_28170("Before launching the App Clip, the system ensures that the App Clip includes in its code signature, an Associated Domains Entitlement, which cites the invocation URL’s domain. The system also verifies that the server of the domain agrees to launch the App Clip, by citing the App Clip's application identifier within an Apple App Site Association File that it hosts.", 0x170uLL, 0);
      uint64_t v27 = v10;
      uint64_t v11 = sub_28170("Description of validated associated domain requirement.", 0x37uLL, 1);
      uint64_t v28 = sub_17534(v26, v27, v11, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v28;
      break;
    case 4:
      uint64_t v23 = sub_28170("App Clip Codes have a limited capacity to store information.", 0x3CuLL, 1);
      uint64_t v24 = v13;
      uint64_t v14 = sub_28170("Description of App Clip code requirement.", 0x29uLL, 1);
      uint64_t v25 = sub_17534(v23, v24, v14, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v25;
      break;
    case 5:
      uint64_t v20 = sub_28170("You can connect to content deep inside your app with universal links. Users open your app in a specified context, allowing them to accomplish their goals efficiently.", 0xA6uLL, 1);
      uint64_t v21 = v16;
      uint64_t v17 = sub_28170("Description of Universal Link requirement.", 0x2AuLL, 1);
      uint64_t v22 = sub_17534(v20, v21, v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v22;
      break;
    default:
      uint64_t v35 = sub_28170("If you already display a Smart App Banner on your site, add the app-clip-bundle-id=appClipBundleID attribute to the existing meta tag for the Smart App Banner, and use the bundle identifier of your App Clip for its value.", 0xDDuLL, 1);
      BOOL v36 = v1;
      uint64_t v2 = sub_28170("Decription of the meta tag requirement.", 0x27uLL, 1);
      uint64_t v37 = sub_17534(v35, v36, v2, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v37;
      break;
  }
  return v38;
}

uint64_t sub_153BC()
{
  switch(*(unsigned char *)(v0 + *(int *)(type metadata accessor for Requirement() + 20)))
  {
    case 1:
      sub_28170("https://developer.apple.com/documentation/app_clips/configuring_the_launch_experience_of_your_app_clip", 0x66uLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2:
      sub_28170("https://developer.apple.com/documentation/app_clips/distributing_your_app_clip", 0x4EuLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 3:
      sub_28170("https://developer.apple.com/documentation/app_clips/associating_your_app_clip_with_your_website", 0x5FuLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      sub_28170("https://developer.apple.com/documentation/app_clips/creating_app_clip_codes/encoding_a_url_in_an_app_clip_code", 0x6EuLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 5:
      sub_28170("https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content", 0x62uLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      sub_28170("https://developer.apple.com/documentation/app_clips/supporting_invocations_from_your_website_and_the_messages_app", 0x71uLL, 1);
      sub_27B10();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_1557C()
{
  return 0;
}

uint64_t sub_15588()
{
  return 0;
}

int *sub_15590@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  sub_27B50();
  uint64_t result = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a5 + result[5]) = a1;
  uint64_t v6 = (void *)(a5 + result[6]);
  *uint64_t v6 = a2;
  v6[1] = a3;
  *(unsigned char *)(a5 + result[7]) = a4;
  return result;
}

unint64_t sub_15604()
{
  return sub_1561C();
}

unint64_t sub_1561C()
{
  uint64_t v2 = qword_358C8;
  if (!qword_358C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1569C()
{
  return sub_156B4();
}

unint64_t sub_156B4()
{
  uint64_t v2 = qword_358D0;
  if (!qword_358D0)
  {
    sub_27B60();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_15738()
{
  return sub_15750();
}

unint64_t sub_15750()
{
  uint64_t v2 = qword_358D8;
  if (!qword_358D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_157D0()
{
  return sub_157E8();
}

unint64_t sub_157E8()
{
  uint64_t v2 = qword_358E0;
  if (!qword_358E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_358E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_15868(void *a1, void *a2, uint64_t a3)
{
  int v12 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v12 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    swift_retain();
    *a1 = v7;
    return *a1 + ((v12 + 16) & ~(unint64_t)v12);
  }
  else
  {
    uint64_t v3 = sub_27B60();
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = *(void *)((char *)a2 + v5);
    swift_bridgeObjectRetain();
    *(void *)((char *)a1 + v5) = v6;
    return (unint64_t)a1;
  }
}

uint64_t sub_159A4(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_15A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + v8) = v9;
  return result;
}

uint64_t sub_15AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = *(void *)(a2 + v7);
  swift_bridgeObjectRetain();
  *(void *)(a1 + v7) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_15B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  uint64_t result = a1;
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return result;
}

uint64_t sub_15C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_15CD8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_15D00(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_27B60();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 24)) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 24));
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t sub_15E24()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_15E4C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_27B60();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_15F44()
{
  uint64_t v2 = sub_27B60();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unsigned char *sub_16034(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_16044(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_161F4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_16438(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_16440(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for Feature.FeatureType()
{
  return &unk_31528;
}

uint64_t sub_1645C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFB) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 4) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 5;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1660C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFB)
  {
    unsigned int v5 = ((a3 + 4) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFB)
  {
    unsigned int v4 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 4;
    }
  }
  return result;
}

void *type metadata accessor for DeterminationState()
{
  return &unk_315B8;
}

uint64_t sub_16864(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFA) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 5) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 250;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 6;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_16A14(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFA)
  {
    unsigned int v5 = ((a3 + 5) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFA)
  {
    unsigned int v4 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 5;
    }
  }
  return result;
}

void *type metadata accessor for RequirementType()
{
  return &unk_31648;
}

unint64_t sub_16C6C(void *a1, void *a2, int *a3)
{
  int v13 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v13 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    swift_retain();
    *a1 = v8;
    return *a1 + ((v13 + 16) & ~(unint64_t)v13);
  }
  else
  {
    uint64_t v3 = sub_27B60();
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v4 = a3[6];
    int v6 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(void *)((char *)a2 + v4);
    uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((void *)v6 + 1) = v7;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    return (unint64_t)a1;
  }
}

uint64_t sub_16DE0(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_16E54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v4 = (void *)(a2 + a3[6]);
  uint64_t v7 = (void *)(a1 + a3[6]);
  *uint64_t v7 = *v4;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  v7[1] = v8;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

uint64_t sub_16F34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v4 = (void *)(a2 + a3[6]);
  int v6 = (void *)(a1 + a3[6]);
  *int v6 = *v4;
  uint64_t v7 = v4[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

__n128 sub_1701C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  __n128 result = *(__n128 *)(a2 + a3[6]);
  *(__n128 *)(a1 + a3[6]) = result;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

uint64_t sub_170D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v4 = (void *)(a2 + a3[6]);
  unsigned int v5 = (void *)(a1 + a3[6]);
  *unsigned int v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

uint64_t sub_171AC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_171D4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v10 = sub_27B60();
  if (a2 == *(_DWORD *)(*(void *)(v10 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 48))(a1, a2, v10);
  }
  else if (a2 == 2147483646)
  {
    int v5 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 24) + 8) < 0x100000000uLL) {
      int v5 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    }
    int v3 = v5 - 1;
    if (v5 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    __break(1u);
  }
  return v6;
}

uint64_t sub_17314()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1733C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_27B60();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 2147483646) {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_1743C()
{
  uint64_t v2 = sub_27B60();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_17534(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  v8._object = a4;
  sub_13680();
  uint64_t v10 = (objc_class *)sub_13638();
  uint64_t v4 = sub_175FC();
  v12.value._object = 0;
  v5.super.Class isa = v10;
  v13._countAndFlagsBits = v4;
  v13._object = v6;
  v8._countAndFlagsBits = (uint64_t)v8._object;
  v12.value._countAndFlagsBits = 0;
  uint64_t v11 = sub_27AD0(v9, v12, v5, v13, v8);
  swift_bridgeObjectRelease();

  return v11;
}

uint64_t sub_175FC()
{
  return sub_28170("", 0, 1);
}

uint64_t sub_17628@<X0>(uint64_t a1@<X8>)
{
  return sub_8D4C(v1, a1);
}

uint64_t sub_17648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  v12[1] = 0;
  uint64_t v20 = sub_17FA0;
  uint64_t v35 = &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>;
  char v58 = 0;
  uint64_t v57 = 0;
  unint64_t v13 = (*(void *)(*(void *)(type metadata accessor for Requirement() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v1 = (char *)v12 - v13;
  uint64_t v23 = (uint64_t)v12 - v13;
  uint64_t v2 = type metadata accessor for RequirementDetail();
  unint64_t v14 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v21 = (uint64_t)v12 - v14;
  uint64_t v33 = sub_6C4C(&qword_359F8);
  uint64_t v30 = *(void *)(v33 - 8);
  uint64_t v31 = v33 - 8;
  unint64_t v15 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v33);
  uint64_t v32 = (char *)v12 - v15;
  uint64_t v42 = sub_6C4C(&qword_35A00);
  uint64_t v36 = *(void *)(v42 - 8);
  uint64_t v37 = v42 - 8;
  unint64_t v16 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v22);
  uint64_t v40 = (uint64_t)v12 - v16;
  unint64_t v17 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v41 = (uint64_t)v12 - v17;
  char v58 = (char *)v12 - v17;
  uint64_t v57 = v5;
  sub_8D4C(v5, v6);
  uint64_t v18 = &v45;
  uint64_t v46 = v21;
  uint64_t v19 = sub_6C4C(&qword_35A08);
  sub_17FA8();
  sub_27DE0();
  sub_8E38(v21);
  sub_8D4C(v22, (uint64_t)v1);
  uint64_t v25 = sub_14C00();
  uint64_t v24 = v7;
  sub_8E38(v23);
  uint64_t v53 = sub_27E30();
  uint64_t v54 = v8;
  unsigned __int8 v55 = v9;
  uint64_t v56 = v10;
  uint64_t v26 = v53;
  uint64_t v27 = v8;
  int v28 = v9;
  uint64_t v29 = v10;
  unint64_t v34 = sub_180D8();
  uint64_t v49 = v26;
  uint64_t v50 = v27;
  char v51 = v28 & 1;
  uint64_t v52 = v29;
  sub_27ED0();
  sub_1815C(v26, v27, v28 & 1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  uint64_t v47 = v33;
  unint64_t v48 = v34;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_18AFC(v40, v42, v41);
  uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  uint64_t v43 = v36 + 8;
  v44(v40, v42);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v40, v41, v42);
  sub_18AFC(v40, v42, v38);
  v44(v40, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v44)(v41, v42);
}

uint64_t type metadata accessor for RequirementDetail()
{
  uint64_t v1 = qword_365E0;
  if (!qword_365E0) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_17BD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v22 = a1;
  uint64_t v19 = 0;
  uint64_t v23 = sub_1AA3C;
  uint64_t v50 = 0;
  uint64_t v49 = 0;
  uint64_t v2 = type metadata accessor for RequirementDetail();
  unint64_t v13 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v27 = (uint64_t)&v13 - v13;
  uint64_t v34 = sub_6C4C(&qword_35A08);
  uint64_t v28 = *(void *)(v34 - 8);
  uint64_t v29 = v34 - 8;
  unint64_t v14 = (*(void *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v22);
  uint64_t v32 = (uint64_t)&v13 - v14;
  unint64_t v15 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v33 = (uint64_t)&v13 - v15;
  uint64_t v50 = (char *)&v13 - v15;
  uint64_t v49 = v5;
  *(_DWORD *)&v21[1] = 1;
  sub_28170("Description", 0xBuLL, 1);
  uint64_t v20 = sub_27D00();
  uint64_t v16 = v6;
  int v17 = v7;
  uint64_t v18 = v8;
  sub_13680();
  sub_13638();
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  __int16 v48 = *(_WORD *)v21 & 0x100;
  uint64_t v42 = sub_27E40();
  uint64_t v43 = v9;
  char v44 = v10;
  uint64_t v45 = v11;
  uint64_t v26 = v39;
  v39[0] = v42;
  v39[1] = v9;
  char v40 = v10 & 1 & v21[1];
  uint64_t v41 = v11;
  sub_8D4C(v22, v27);
  uint64_t v24 = &v37;
  uint64_t v38 = v27;
  uint64_t v25 = sub_6C4C(&qword_35A20);
  sub_18054();
  sub_28060();
  sub_8E38(v27);
  unint64_t v31 = sub_17FA8();
  sub_18AFC(v32, v34, v33);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  uint64_t v35 = v28 + 8;
  v36(v32, v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v32, v33, v34);
  sub_18AFC(v32, v34, v30);
  v36(v32, v34);
  return ((uint64_t (*)(uint64_t, uint64_t))v36)(v33, v34);
}

uint64_t sub_17FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_17BD0(*(void *)(v1 + 16), a1);
}

unint64_t sub_17FA8()
{
  uint64_t v2 = qword_35A10;
  if (!qword_35A10)
  {
    sub_700C(&qword_35A08);
    sub_18054();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18054()
{
  uint64_t v2 = qword_35A18;
  if (!qword_35A18)
  {
    sub_700C(&qword_35A20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_180D8()
{
  uint64_t v2 = qword_35A28;
  if (!qword_35A28)
  {
    sub_700C(&qword_359F8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A28);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1815C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_181A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v77 = a1;
  uint64_t v46 = 0;
  uint64_t v33 = sub_18B60;
  id v124 = 0;
  uint64_t v123 = 0;
  uint64_t v122 = 0;
  uint64_t v121 = 0;
  uint64_t v34 = sub_6C4C(&qword_35AE0);
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = v34 - 8;
  unint64_t v37 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v34);
  uint64_t v38 = (uint64_t)&v23 - v37;
  unint64_t v39 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v23 - v37);
  uint64_t v40 = (uint64_t)&v23 - v39;
  id v124 = (char *)&v23 - v39;
  unint64_t v41 = (*(void *)(*(void *)(sub_6C4C(&qword_35670) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v46);
  uint64_t v80 = (uint64_t)&v23 - v41;
  uint64_t v82 = sub_27B20();
  uint64_t v78 = *(void *)(v82 - 8);
  uint64_t v79 = v82 - 8;
  unint64_t v42 = (*(void *)(v78 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v82);
  uint64_t v43 = (char *)&v23 - v42;
  unint64_t v44 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v23 - v42);
  uint64_t v45 = (char *)&v23 - v44;
  uint64_t v123 = (char *)&v23 - v44;
  uint64_t v47 = sub_6C4C(&qword_35AE8);
  unint64_t v48 = (*(void *)(*(void *)(v47 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v46);
  uint64_t v49 = (char *)&v23 - v48;
  unint64_t v50 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  char v51 = (char *)&v23 - v50;
  unint64_t v52 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  uint64_t v53 = (char *)&v23 - v52;
  uint64_t v122 = (char *)&v23 - v52;
  unint64_t v54 = (*(void *)(*(void *)(type metadata accessor for Requirement() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v77);
  uint64_t v72 = (uint64_t)&v23 - v54;
  unint64_t v55 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v56 = (uint64_t)&v23 - v55;
  uint64_t v121 = v10;
  sub_8D4C(v10, (uint64_t)&v23 - v55);
  uint64_t v58 = sub_14FDC();
  uint64_t v57 = v11;
  sub_8E38(v56);
  char v59 = v111;
  v111[0] = v58;
  v111[1] = v57;
  sub_BD20();
  uint64_t v107 = sub_27E50();
  uint64_t v108 = v12;
  unsigned __int8 v109 = v13;
  uint64_t v110 = v14;
  uint64_t v61 = v107;
  uint64_t v62 = v12;
  int v63 = v13;
  uint64_t v64 = v14;
  uint64_t v60 = sub_27D90();
  uint64_t v103 = v61;
  uint64_t v104 = v62;
  unsigned int v81 = 1;
  char v105 = v63 & 1;
  uint64_t v106 = v64;
  uint64_t v99 = sub_27E20();
  uint64_t v100 = v15;
  unsigned __int8 v101 = v16;
  uint64_t v102 = v17;
  uint64_t v65 = v99;
  uint64_t v66 = v15;
  int v67 = v16;
  uint64_t v68 = v17;
  swift_release();
  sub_1815C(v61, v62, v63 & 1);
  swift_bridgeObjectRelease();
  uint64_t v73 = v96;
  v96[0] = v65;
  v96[1] = v66;
  char v97 = v67 & 1 & v81;
  uint64_t v98 = v68;
  uint64_t v70 = sub_28350();
  uint64_t v69 = v18;
  *uint64_t v18 = sub_27D70();
  char v19 = sub_27D80();
  uint64_t v20 = v70;
  v69[1] = v19;
  sub_6EDC();
  uint64_t v71 = v20;
  sub_1AA44();
  sub_28300();
  sub_27F20();
  uint64_t v21 = v72;
  sub_198D0((uint64_t)v73);
  uint64_t v76 = v87;
  v87[0] = v111[2];
  v87[1] = v111[3];
  char v88 = v112 & 1 & v81;
  uint64_t v89 = v113;
  char v90 = v114;
  uint64_t v91 = v115;
  uint64_t v92 = v116;
  uint64_t v93 = v117;
  uint64_t v94 = v118;
  char v95 = v119 & 1 & v81;
  uint64_t v74 = sub_6C4C(&qword_35AF8);
  unint64_t v75 = sub_1AAC0();
  sub_18AFC((uint64_t)v76, v74, (uint64_t)v120);
  sub_198D0((uint64_t)v76);
  sub_8D4C(v77, v21);
  sub_153BC();
  if ((*(unsigned int (**)(uint64_t, void, uint64_t))(v78 + 48))(v80, v81, v82) == 1)
  {
    sub_F638(v80);
    sub_8E38(v72);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v49, 1, 1, v34);
    sub_1AB5C();
    sub_18D2C(v49, v34, v51);
    sub_1ABE0((uint64_t)v49);
    sub_1AC94(v51, v53);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v45, v80, v82);
    sub_8E38(v72);
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v43, v45, v82);
    sub_27DF0();
    unint64_t v29 = sub_1AB5C();
    sub_18AFC(v38, v34, v40);
    unint64_t v31 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    uint64_t v30 = v35 + 8;
    v31(v38, v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v38, v40, v34);
    sub_18AFC(v38, v34, (uint64_t)v49);
    v31(v38, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v49, 0, 1, v34);
    sub_18D2C(v49, v34, v51);
    sub_1ABE0((uint64_t)v49);
    sub_1AC94(v51, v53);
    v31(v40, v34);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v45, v82);
  }
  uint64_t v28 = v120;
  uint64_t v27 = v85;
  sub_1ADC0((uint64_t)v120, (uint64_t)v85);
  uint64_t v26 = v86;
  v86[0] = v27;
  sub_1AE64(v53, v51);
  v86[1] = v51;
  uint64_t v24 = v84;
  v84[0] = v74;
  v84[1] = v47;
  uint64_t v25 = v83;
  v83[0] = v75;
  v83[1] = sub_1AF90();
  sub_18D78((uint64_t)v26, 2uLL, (uint64_t)v24, v32);
  sub_1ABE0((uint64_t)v51);
  sub_198D0((uint64_t)v27);
  sub_1ABE0((uint64_t)v53);
  return sub_198D0((uint64_t)v28);
}

uint64_t sub_18AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_18B60@<X0>(uint64_t a1@<X8>)
{
  long long v23 = 0u;
  long long v24 = 0u;
  HIBYTE(v7) = 1;
  sub_28170("Show Documentation", 0x12uLL, 1);
  sub_27D00();
  sub_13680();
  sub_13638();
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __int16 v22 = v7 & 0x100;
  uint64_t v16 = sub_27E40();
  uint64_t v17 = v1;
  char v18 = v2;
  uint64_t v19 = v3;
  v13[0] = v16;
  v13[1] = v1;
  char v14 = v2 & 1;
  uint64_t v15 = v3;
  sub_18AFC((uint64_t)v13, (uint64_t)&type metadata for Text, (uint64_t)&v23);
  sub_198D0((uint64_t)v13);
  long long v5 = v23;
  char v6 = v24;
  uint64_t v8 = *((void *)&v24 + 1);
  sub_19918(v23, *((uint64_t *)&v23 + 1), v24 & 1);
  swift_bridgeObjectRetain();
  long long v10 = v5;
  char v11 = v6 & 1;
  uint64_t v12 = v8;
  sub_18AFC((uint64_t)&v10, (uint64_t)&type metadata for Text, a1);
  sub_198D0((uint64_t)&v10);
  return sub_198D0((uint64_t)&v23);
}

void *sub_18D2C@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = sub_282D0();
  return sub_1B024(a1, a3, a2, v3);
}

uint64_t *sub_18D78@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  unint64_t v26 = a2;
  uint64_t v27 = a3;
  unint64_t v28 = a3 & 0xFFFFFFFFFFFFFFFELL;
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(v27 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t v19 = &v9;
    unint64_t v20 = (8 * v26 + 15) & 0xFFFFFFFFFFFFFFF0;
    __chkstk_darwin(&v9);
    uint64_t v21 = (char *)&v9 - v20;
    for (unint64_t i = v4; ; unint64_t i = v5 + 1)
    {
      unint64_t v18 = i;
      if (i >= v26) {
        break;
      }
      unint64_t v5 = v18;
      *(void *)&v21[8 * v18] = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * v18);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v14 = TupleTypeMetadata;
  uint64_t v6 = *(void *)(*(void *)(TupleTypeMetadata - 8) + 64);
  uint64_t v15 = &v9;
  unint64_t v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(&v9);
  uint64_t v17 = (char *)&v9 - v16;
  if (v7)
  {
    for (uint64_t j = 0; ; uint64_t j = v9)
    {
      uint64_t v11 = j;
      uint64_t v12 = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * j);
      int v10 = v26 == 1 ? 0 : *(_DWORD *)(v14 + 24 + 16 * v11 + 8);
      (*(void (**)(char *, void))(*(void *)(v12 - 8) + 16))(&v17[v10], *(void *)(v25 + 8 * v11));
      uint64_t v9 = v11 + 1;
      if (v11 + 1 == v26) {
        break;
      }
    }
  }
  sub_280B0();
  return v15;
}

double sub_18FE8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_8C88(a1, a2).n128_u64[0];
  return result;
}

uint64_t sub_19004()
{
  return sub_27E60();
}

uint64_t sub_1901C()
{
  return sub_27E70();
}

uint64_t sub_19034()
{
  return sub_27EB0();
}

uint64_t sub_19050@<X0>(uint64_t a1@<X8>)
{
  return sub_17648(a1);
}

uint64_t sub_19068()
{
  type metadata accessor for DeveloperDiagnosticsViewModel();
  uint64_t v2 = sub_111A0();
  sub_28350();
  unsigned char *v0 = 0;
  sub_6EDC();
  (*(void (**)(void))(*(void *)v2 + 328))();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_19118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = &v65;
  uint64_t v22 = a1;
  uint64_t v69 = 0;
  uint64_t v68 = 0;
  int v67 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v30 = 0;
  uint64_t v23 = type metadata accessor for RequirementDetail();
  unint64_t v24 = (*(void *)(*(void *)(v23 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v23);
  uint64_t v25 = (uint64_t)&v10 - v24;
  unint64_t v26 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v24);
  uint64_t v27 = (uint64_t)&v10 - v26;
  unint64_t v28 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v26);
  uint64_t v29 = (uint64_t)&v10 - v28;
  uint64_t v69 = (char *)&v10 - v28;
  unint64_t v31 = (*(void *)(*(void *)(sub_6C4C(&qword_354D8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v30);
  uint64_t v44 = (uint64_t)&v10 - v31;
  uint64_t v45 = type metadata accessor for Requirement();
  uint64_t v42 = *(void *)(v45 - 8);
  uint64_t v43 = v45 - 8;
  unint64_t v32 = (*(void *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v33 = (uint64_t)&v10 - v32;
  unint64_t v34 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v32);
  uint64_t v35 = (uint64_t)&v10 - v34;
  uint64_t v68 = (char *)&v10 - v34;
  uint64_t v36 = sub_6C4C(&qword_35A30);
  unint64_t v37 = (*(void *)(*(void *)(v36 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v36);
  uint64_t v38 = (char *)&v10 - v37;
  unint64_t v39 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v37);
  uint64_t v40 = (char *)&v10 - v39;
  int v67 = (char *)&v10 - v39;
  uint64_t v41 = sub_19068();
  (*(void (**)(void))(*(void *)v41 + 352))(0);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v44, 1, v45) == 1)
  {
    sub_8BC0(v44);
    *(_DWORD *)&v15[1] = 1;
    sub_28170("Unavailable", 0xBuLL, 1);
    sub_27D00();
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    __int16 v64 = *(_WORD *)v15 & 0x100;
    uint64_t v58 = sub_27E40();
    uint64_t v59 = v5;
    char v60 = v6;
    uint64_t v61 = v7;
    int v10 = v55;
    v55[0] = v58;
    v55[1] = v5;
    char v56 = v6 & 1 & v15[1];
    uint64_t v57 = v7;
    uint64_t v19 = &v65;
    unint64_t v16 = &type metadata for Text;
    uint64_t v17 = &protocol witness table for Text;
    sub_18AFC((uint64_t)v55, (uint64_t)&type metadata for Text, (uint64_t)&v65);
    sub_198D0((uint64_t)v10);
    long long v11 = v65;
    int v12 = v66;
    uint64_t v13 = *((void *)&v66 + 1);
    sub_19918(v65, *((uint64_t *)&v65 + 1), v66 & 1);
    swift_bridgeObjectRetain();
    uint64_t v14 = &v49;
    long long v49 = v11;
    char v50 = v12 & 1 & v15[1];
    uint64_t v51 = v13;
    sub_18AFC((uint64_t)&v49, (uint64_t)v16, (uint64_t)v52);
    sub_198D0((uint64_t)v14);
    unint64_t v18 = v46;
    v46[0] = v52[0];
    v46[1] = v52[1];
    char v47 = v53 & 1 & v15[1];
    uint64_t v48 = v54;
    unint64_t v8 = sub_19B4C();
    sub_19A54((uint64_t)v18, v23, (uint64_t)v16, v8, (uint64_t)v17, (uint64_t)v38);
    sub_198D0((uint64_t)v18);
    sub_19BD0(v38, v40);
    sub_198D0((uint64_t)v19);
  }
  else
  {
    sub_8C88(v44, v35);
    sub_8D4C(v35, v33);
    sub_18FE8(v33, v27);
    unint64_t v20 = sub_19B4C();
    sub_18AFC(v27, v23, v29);
    sub_8E38(v27);
    sub_8D4C(v29, v25);
    sub_18AFC(v25, v23, v27);
    sub_8E38(v25);
    sub_1995C(v27, v23, (uint64_t)&type metadata for Text, v20, (uint64_t)&protocol witness table for Text, (uint64_t)v38);
    sub_8E38(v27);
    sub_19BD0(v38, v40);
    sub_8E38(v29);
    sub_8E38(v35);
  }
  sub_19D00((uint64_t)v40, (uint64_t)v38);
  sub_19EB4();
  sub_18AFC((uint64_t)v38, v36, v22);
  sub_19F54((uint64_t)v38);
  return sub_19F54((uint64_t)v40);
}

uint64_t sub_198D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_19918(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1995C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_27D30();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  int v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_27D40();
}

uint64_t sub_19A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_27D30();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  int v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_27D40();
}

unint64_t sub_19B4C()
{
  uint64_t v2 = qword_35A38;
  if (!qword_35A38)
  {
    type metadata accessor for RequirementDetail();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A38);
    return WitnessTable;
  }
  return v2;
}

char *sub_19BD0(char *a1, char *a2)
{
  uint64_t v7 = sub_6C4C(&qword_35A40);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a2, a1, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    uint64_t v2 = sub_27B60();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(a2, a1);
    uint64_t v3 = (int *)type metadata accessor for Requirement();
    a2[v3[5]] = a1[v3[5]];
    *(_OWORD *)&a2[v3[6]] = *(_OWORD *)&a1[v3[6]];
    a2[v3[7]] = a1[v3[7]];
    swift_storeEnumTagMultiPayload();
  }
  return a2;
}

uint64_t sub_19D00(uint64_t a1, uint64_t a2)
{
  sub_6C4C(&qword_35A40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void *)(a1 + 8);
    char v7 = *(unsigned char *)(a1 + 16);
    sub_19918(*(void *)a1, v6, v7 & 1);
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = v6;
    *(unsigned char *)(a2 + 16) = v7 & 1;
    uint64_t v8 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    *(void *)(a2 + 24) = v8;
  }
  else
  {
    uint64_t v2 = sub_27B60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
    uint64_t v11 = (int *)type metadata accessor for Requirement();
    *(unsigned char *)(a2 + v11[5]) = *(unsigned char *)(a1 + v11[5]);
    unint64_t v9 = (void *)(a2 + v11[6]);
    uint64_t v3 = (void *)(a1 + v11[6]);
    *unint64_t v9 = *v3;
    uint64_t v10 = v3[1];
    swift_bridgeObjectRetain();
    v9[1] = v10;
    *(unsigned char *)(a2 + v11[7]) = *(unsigned char *)(a1 + v11[7]);
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

unint64_t sub_19EB4()
{
  uint64_t v2 = qword_35A48;
  if (!qword_35A48)
  {
    sub_700C(&qword_35A30);
    sub_19B4C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A48);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_19F54(uint64_t a1)
{
  sub_6C4C(&qword_35A40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1815C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16) & 1);
  }
  else
  {
    uint64_t v1 = sub_27B60();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    type metadata accessor for Requirement();
  }
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A024@<X0>(uint64_t a1@<X8>)
{
  return sub_19118(a1);
}

uint64_t sub_1A03C()
{
  return sub_27CB0();
}

uint64_t sub_1A054()
{
  return sub_27CD0();
}

unint64_t sub_1A08C()
{
  uint64_t v2 = qword_35A50;
  if (!qword_35A50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1A10C()
{
  return sub_27CC0();
}

uint64_t sub_1A144()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1A178()
{
  return sub_1A190();
}

unint64_t sub_1A190()
{
  uint64_t v2 = qword_35A58;
  if (!qword_35A58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35A58);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1A210()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1A244(void *a1, void *a2)
{
  uint64_t v11 = (int *)type metadata accessor for Requirement();
  int v12 = *(_DWORD *)(*((void *)v11 - 1) + 80);
  if ((v12 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    swift_retain();
    *a1 = v7;
    return *a1 + ((v12 + 16) & ~(unint64_t)v12);
  }
  else
  {
    uint64_t v2 = sub_27B60();
    (*(void (**)(void *, void *))(*(void *)(v2 - 8) + 16))(a1, a2);
    *((unsigned char *)a1 + v11[5]) = *((unsigned char *)a2 + v11[5]);
    uint64_t v3 = v11[6];
    uint64_t v5 = (char *)a1 + v3;
    *(void *)((char *)a1 + v3) = *(void *)((char *)a2 + v3);
    uint64_t v6 = *(void *)((char *)a2 + v3 + 8);
    swift_bridgeObjectRetain();
    *((void *)v5 + 1) = v6;
    *((unsigned char *)a1 + v11[7]) = *((unsigned char *)a2 + v11[7]);
    return (unint64_t)a1;
  }
}

uint64_t sub_1A3C0(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for Requirement();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, a2);
  uint64_t v8 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a1 + v8[5]) = *(unsigned char *)(a2 + v8[5]);
  uint64_t v3 = v8[6];
  uint64_t v6 = a1 + v3;
  *(void *)(a1 + v3) = *(void *)(a2 + v3);
  uint64_t v7 = *(void *)(a2 + v3 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(v6 + 8) = v7;
  *(unsigned char *)(a1 + v8[7]) = *(unsigned char *)(a2 + v8[7]);
  return result;
}

uint64_t sub_1A528(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 24))(a1, a2);
  uint64_t v7 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a1 + v7[5]) = *(unsigned char *)(a2 + v7[5]);
  uint64_t v3 = v7[6];
  uint64_t v5 = a1 + v3;
  *(void *)(a1 + v3) = *(void *)(a2 + v3);
  uint64_t v6 = *(void *)(a2 + v3 + 8);
  swift_bridgeObjectRetain();
  *(void *)(v5 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  return result;
}

__n128 sub_1A61C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a1, a2);
  uint64_t v3 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a1 + v3[5]) = *(unsigned char *)(a2 + v3[5]);
  __n128 result = *(__n128 *)(a2 + v3[6]);
  *(__n128 *)(a1 + v3[6]) = result;
  *(unsigned char *)(a1 + v3[7]) = *(unsigned char *)(a2 + v3[7]);
  return result;
}

uint64_t sub_1A6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 40))(a1, a2);
  uint64_t v7 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a1 + v7[5]) = *(unsigned char *)(a2 + v7[5]);
  uint64_t v3 = v7[6];
  uint64_t v4 = (void *)(a2 + v3);
  uint64_t v5 = (void *)(a1 + v3);
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  return result;
}

uint64_t sub_1A7C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A7E8(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
}

uint64_t sub_1A848()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A870(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 56))(a1, a2);
}

uint64_t sub_1A8D4()
{
  uint64_t v2 = type metadata accessor for Requirement();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *type metadata accessor for RequirementDetail_Previews()
{
  return &unk_31668;
}

uint64_t sub_1A9BC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1AA24()
{
  return sub_19EB4();
}

uint64_t sub_1AA3C@<X0>(uint64_t a1@<X8>)
{
  return sub_181A0(*(void *)(v1 + 16), a1);
}

unint64_t sub_1AA44()
{
  uint64_t v2 = qword_35AF0;
  if (!qword_35AF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35AF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AAC0()
{
  uint64_t v2 = qword_35B00;
  if (!qword_35B00)
  {
    sub_700C(&qword_35AF8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AB5C()
{
  uint64_t v2 = qword_35B08;
  if (!qword_35B08)
  {
    sub_700C(&qword_35AE0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B08);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1ABE0(uint64_t a1)
{
  uint64_t v3 = sub_6C4C(&qword_35AE0);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *sub_1AC94(const void *a1, void *a2)
{
  uint64_t v6 = sub_6C4C(&qword_35AE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_6C4C(&qword_35AE8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_1ADC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_19918(*(void *)a1, v4, v5 & 1);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  uint64_t v7 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  *(void *)(a2 + 24) = v7;
  memcpy((void *)(a2 + 32), (const void *)(a1 + 32), 0x29uLL);
  return a2;
}

void *sub_1AE64(const void *a1, void *a2)
{
  uint64_t v6 = sub_6C4C(&qword_35AE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_6C4C(&qword_35AE8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

unint64_t sub_1AF90()
{
  uint64_t v2 = qword_35B10;
  if (!qword_35B10)
  {
    sub_700C(&qword_35AE8);
    sub_1AB5C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B10);
    return WitnessTable;
  }
  return v2;
}

void *sub_1B024(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v9 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a2, a1, a3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, a3);
  }
  return a2;
}

uint64_t static DeveloperDiagnosticsViewControllerFactory.appClipsDeveloperDiagnosticsViewController()()
{
  uint64_t v3 = 0;
  sub_1B1C4(0, (uint64_t)v4);
  sub_6C4C(&qword_35B18);
  sub_1B2CC((uint64_t)v4);
  memcpy(__dst, v4, sizeof(__dst));
  uint64_t v1 = sub_27D20();
  sub_1B398((uint64_t)v4);
  return v1;
}

uint64_t sub_1B1C4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  sub_28170("", 0, 1);
  uint64_t v10 = sub_1BB50();
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  char v13 = sub_1BD34();
  uint64_t v14 = v4;
  char v15 = sub_1BD34();
  uint64_t v16 = v5;
  uint64_t result = sub_1BF48();
  *(unsigned char *)a2 = a1 & 1;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = v13 & 1;
  *(void *)(a2 + 40) = v14;
  *(unsigned char *)(a2 + 48) = v15 & 1;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = result;
  *(void *)(a2 + 72) = v7;
  *(unsigned char *)(a2 + 80) = v8 & 1;
  return result;
}

uint64_t sub_1B2CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B358()
{
  return swift_retain();
}

uint64_t sub_1B398(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B424()
{
  return swift_release();
}

uint64_t static DeveloperDiagnosticsViewControllerFactory.universalLinksDeveloperDiagnosticsViewController()()
{
  uint64_t v3 = 0;
  sub_1B1C4(1, (uint64_t)v4);
  sub_6C4C(&qword_35B18);
  sub_1B2CC((uint64_t)v4);
  memcpy(__dst, v4, sizeof(__dst));
  uint64_t v1 = sub_27D20();
  sub_1B398((uint64_t)v4);
  return v1;
}

id DeveloperDiagnosticsViewControllerFactory.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for DeveloperDiagnosticsViewControllerFactory();
  id v2 = objc_msgSendSuper2(&v3, "init");
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id DeveloperDiagnosticsViewControllerFactory.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeveloperDiagnosticsViewControllerFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_1B664(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_1B6E8()
{
  return sub_28370();
}

uint64_t sub_1B768()
{
  return sub_28320();
}

BOOL sub_1B7C4(unsigned char *a1, unsigned char *a2)
{
  return sub_1B664(*a1 & 1, *a2 & 1);
}

uint64_t sub_1B7F0()
{
  return sub_1B768();
}

uint64_t sub_1B810()
{
  return sub_1B6E8();
}

uint64_t sub_1B830()
{
  return *v0 & 1;
}

uint64_t sub_1B83C(uint64_t result)
{
  *uint64_t v1 = result & 1;
  return result;
}

uint64_t sub_1B848()
{
  if (*v0)
  {
    uint64_t result = sub_28350();
    unsigned char *v3 = 2;
  }
  else
  {
    uint64_t result = sub_28350();
    unsigned char *v2 = 1;
    v2[1] = 0;
  }
  sub_6EDC();
  return result;
}

uint64_t sub_1B910()
{
  if (*v0) {
    sub_28170("The URL entered will be analyzed for compatibility with Universal Links invocation features.", 0x5CuLL, 1);
  }
  else {
    sub_28170("The URL entered will be analyzed for compatibility with App Clips invocation features.", 0x56uLL, 1);
  }
  sub_27D00();
  sub_13680();
  sub_13638();
  return sub_27E40();
}

uint64_t sub_1BB50()
{
  swift_bridgeObjectRetain();
  sub_27FD0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1BBE4()
{
  long long v3 = *(_OWORD *)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 24);
  sub_1C134((uint64_t)&v3);
  sub_1C134((uint64_t)&v3);
  sub_6C4C(&qword_35B28);
  sub_27FE0();
  sub_1C174();
  sub_1C1AC((uint64_t)&v3);
  return v2;
}

uint64_t sub_1BC80()
{
  long long v3 = *(_OWORD *)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 24);
  sub_1C134((uint64_t)&v3);
  sub_1C134((uint64_t)&v3);
  sub_6C4C(&qword_35B28);
  sub_28000();
  sub_1C174();
  sub_1C1AC((uint64_t)&v3);
  return v2;
}

uint64_t sub_1BD34()
{
  sub_27FD0();
  return v1 & 1;
}

long long *sub_1BD8C()
{
  long long v2 = *(_OWORD *)(v0 + 32);
  sub_1C1EC();
  sub_1C1EC();
  sub_6C4C(&qword_35B30);
  sub_27FF0();
  sub_1C218();
  uint64_t result = &v2;
  sub_1C218();
  return result;
}

long long *sub_1BE1C()
{
  long long v2 = *(_OWORD *)(v0 + 48);
  sub_1C1EC();
  sub_1C1EC();
  sub_6C4C(&qword_35B30);
  sub_27FF0();
  sub_1C218();
  uint64_t result = &v2;
  sub_1C218();
  return result;
}

uint64_t sub_1BEAC()
{
  sub_1C1EC();
  sub_1C1EC();
  sub_6C4C(&qword_35B30);
  sub_28000();
  sub_1C218();
  sub_1C218();
  return v1;
}

uint64_t sub_1BF48()
{
  swift_retain();
  type metadata accessor for DeveloperDiagnosticsViewModel();
  sub_1C244();
  uint64_t v1 = sub_27BF0();
  swift_release();
  return v1;
}

uint64_t sub_1BFD8()
{
  sub_1B358();
  type metadata accessor for DeveloperDiagnosticsViewModel();
  sub_1C244();
  uint64_t v1 = sub_27C00();
  sub_1B424();
  return v1;
}

uint64_t sub_1C060()
{
  return sub_111A0();
}

uint64_t type metadata accessor for DeveloperDiagnosticsViewControllerFactory()
{
  return self;
}

unint64_t sub_1C0B4()
{
  uint64_t v2 = qword_35B20;
  if (!qword_35B20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1C134(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1C174()
{
}

uint64_t sub_1C1AC(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1C1EC()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1C218()
{
}

unint64_t sub_1C244()
{
  uint64_t v2 = qword_35B38;
  if (!qword_35B38)
  {
    type metadata accessor for DeveloperDiagnosticsViewModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B38);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1C2C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v27 = sub_1CB00;
  uint64_t v41 = 0;
  v11[1] = 81;
  memset(__b, 0, 0x51uLL);
  memcpy(__dst, v1, 0x51uLL);
  int v12 = LOBYTE(__dst[0]);
  uint64_t v17 = __dst[1];
  uint64_t v23 = __dst[2];
  uint64_t v24 = __dst[3];
  int v13 = LOBYTE(__dst[4]);
  uint64_t v14 = __dst[5];
  int v15 = LOBYTE(__dst[6]);
  uint64_t v20 = __dst[7];
  uint64_t v21 = __dst[8];
  uint64_t v22 = __dst[9];
  int v16 = LOBYTE(__dst[10]);
  uint64_t v35 = sub_6C4C(&qword_35B40);
  uint64_t v29 = *(void *)(v35 - 8);
  uint64_t v30 = v35 - 8;
  uint64_t v19 = *(void *)(v29 + 64);
  unint64_t v18 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v17);
  uint64_t v33 = (uint64_t)v11 - v18;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v34 = (uint64_t)v11 - v4;
  uint64_t v41 = (char *)v11 - v4;
  LOBYTE(__b[0]) = v5 & 1;
  __b[1] = v3;
  __b[2] = v23;
  __b[3] = v24;
  LOBYTE(__b[4]) = v6 & 1;
  __b[5] = v7;
  LOBYTE(__b[6]) = v8 & 1;
  __b[7] = v20;
  __b[8] = v21;
  __b[9] = v22;
  LOBYTE(__b[10]) = v9 & 1;
  sub_1B2CC((uint64_t)v1);
  uint64_t v25 = &v38;
  unint64_t v39 = v1;
  uint64_t v26 = sub_6C4C(&qword_35B48);
  sub_1CB08();
  sub_27DE0();
  sub_1B398(v28);
  unint64_t v32 = sub_1E880();
  sub_18AFC(v33, v35, v34);
  unint64_t v37 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  uint64_t v36 = v29 + 8;
  v37(v33, v35);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v33, v34, v35);
  sub_18AFC(v33, v35, v31);
  v37(v33, v35);
  return ((uint64_t (*)(uint64_t, uint64_t))v37)(v34, v35);
}

uint64_t sub_1C690@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  __src = a1;
  uint64_t v37 = 0;
  uint64_t v41 = sub_1FF38;
  uint64_t v74 = 0;
  size_t __n = 81;
  memset(__b, 0, 0x51uLL);
  memcpy(__dst, __src, 0x51uLL);
  int v22 = LOBYTE(__dst[0]);
  uint64_t v27 = __dst[1];
  uint64_t v32 = __dst[2];
  uint64_t v33 = __dst[3];
  int v23 = LOBYTE(__dst[4]);
  uint64_t v24 = __dst[5];
  int v25 = LOBYTE(__dst[6]);
  uint64_t v26 = __dst[7];
  uint64_t v29 = __dst[8];
  uint64_t v30 = __dst[9];
  int v31 = LOBYTE(__dst[10]);
  uint64_t v52 = sub_6C4C(&qword_35B48);
  uint64_t v46 = *(void *)(v52 - 8);
  uint64_t v47 = v52 - 8;
  unint64_t v28 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v27);
  uint64_t v50 = (uint64_t)&v20 - v28;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v51 = (uint64_t)&v20 - v4;
  uint64_t v74 = (char *)&v20 - v4;
  *(_DWORD *)&v39[1] = 1;
  LOBYTE(__b[0]) = v5 & 1;
  __b[1] = v3;
  __b[2] = v32;
  __b[3] = v33;
  LOBYTE(__b[4]) = v6 & 1;
  __b[5] = v7;
  LOBYTE(__b[6]) = v8 & 1;
  __b[7] = v9;
  __b[8] = v29;
  __b[9] = v30;
  LOBYTE(__b[10]) = v31 & 1;
  sub_28170("URL", 3uLL, 1);
  uint64_t v38 = sub_27D00();
  uint64_t v34 = v10;
  int v35 = v11;
  uint64_t v36 = v12;
  sub_13680();
  sub_13638();
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  __int16 v72 = *(_WORD *)v39 & 0x100;
  uint64_t v66 = sub_27E40();
  uint64_t v67 = v13;
  char v68 = v14;
  uint64_t v69 = v15;
  uint64_t v44 = v63;
  v63[0] = v66;
  v63[1] = v13;
  char v64 = v14 & 1 & v39[1];
  uint64_t v65 = v15;
  uint64_t v59 = sub_1B910();
  uint64_t v60 = v16;
  char v61 = v17;
  uint64_t v62 = v18;
  uint64_t v40 = v56;
  v56[0] = v59;
  v56[1] = v16;
  char v57 = v17 & 1 & v39[1];
  uint64_t v58 = v18;
  sub_1B2CC((uint64_t)__src);
  uint64_t v42 = v55;
  void v55[2] = __src;
  uint64_t v43 = sub_6C4C(&qword_35B60);
  sub_1CBB0();
  sub_28070();
  sub_1B398((uint64_t)__src);
  unint64_t v49 = sub_1CB08();
  sub_18AFC(v50, v52, v51);
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  uint64_t v53 = v46 + 8;
  v54(v50, v52);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v50, v51, v52);
  sub_18AFC(v50, v52, v48);
  v54(v50, v52);
  return ((uint64_t (*)(uint64_t, uint64_t))v54)(v51, v52);
}

uint64_t sub_1CB00@<X0>(uint64_t a1@<X8>)
{
  return sub_1C690(*(void **)(v1 + 16), a1);
}

unint64_t sub_1CB08()
{
  uint64_t v2 = qword_35B50;
  if (!qword_35B50)
  {
    sub_700C(&qword_35B48);
    sub_1CBB0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1CBB0()
{
  uint64_t v2 = qword_35B58;
  if (!qword_35B58)
  {
    sub_700C(&qword_35B60);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B58);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1CC34@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v30 = a1;
  uint64_t v26 = sub_1FF40;
  unint64_t v39 = 0;
  v12[1] = 81;
  memset(__b, 0, 0x51uLL);
  memcpy(__dst, v30, 0x51uLL);
  int v13 = LOBYTE(__dst[0]);
  uint64_t v14 = __dst[1];
  uint64_t v24 = __dst[2];
  uint64_t v25 = __dst[3];
  int v15 = LOBYTE(__dst[4]);
  uint64_t v16 = __dst[5];
  int v17 = LOBYTE(__dst[6]);
  uint64_t v21 = __dst[7];
  uint64_t v22 = __dst[8];
  uint64_t v23 = __dst[9];
  int v18 = LOBYTE(__dst[10]);
  uint64_t v32 = sub_6C4C(&qword_35B60);
  uint64_t v20 = *(void *)(*(void *)(v32 - 8) + 64);
  unint64_t v19 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)v12 - v19;
  uint64_t v3 = __chkstk_darwin(v2);
  int v35 = (char *)v12 - v4;
  unint64_t v39 = (char *)v12 - v4;
  LOBYTE(__b[0]) = v5 & 1;
  __b[1] = v6;
  __b[2] = v24;
  __b[3] = v25;
  LOBYTE(__b[4]) = v7 & 1;
  __b[5] = v8;
  LOBYTE(__b[6]) = v9 & 1;
  __b[7] = v21;
  __b[8] = v22;
  __b[9] = v23;
  LOBYTE(__b[10]) = v10 & 1;
  sub_1B2CC(v3);
  uint64_t v27 = &v36;
  uint64_t v37 = v30;
  uint64_t v28 = sub_6C4C(&qword_35BD0);
  unint64_t v29 = sub_1FF48();
  sub_1E91C();
  sub_28030();
  sub_1B398((uint64_t)v30);
  unint64_t v33 = sub_1CBB0();
  sub_18AFC((uint64_t)v34, v32, (uint64_t)v35);
  sub_1FFCC((uint64_t)v34);
  sub_200A4(v35, v34);
  sub_18AFC((uint64_t)v34, v32, v31);
  sub_1FFCC((uint64_t)v34);
  return sub_1FFCC((uint64_t)v35);
}

uint64_t sub_1CF64@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v139 = a2;
  uint64_t v121 = a1;
  uint64_t v110 = 0;
  uint64_t v51 = &opaque type descriptor for <<opaque return type of View.keyboardType(_:)>>;
  char v57 = &opaque type descriptor for <<opaque return type of View.autocapitalization(_:)>>;
  char v68 = &opaque type descriptor for <<opaque return type of View.disableAutocorrection(_:)>>;
  uint64_t v69 = sub_202A4;
  uint64_t v78 = sub_1E4E8;
  uint64_t v89 = sub_2062C;
  uint64_t v98 = &opaque type descriptor for <<opaque return type of View.onSubmit(of:_:)>>;
  uint64_t v108 = &opaque type descriptor for <<opaque return type of View.submitLabel(_:)>>;
  uint64_t v127 = sub_1E904;
  v184 = 0;
  v183 = 0;
  uint64_t v182 = 0;
  uint64_t v133 = sub_6C4C(&qword_35BF8);
  uint64_t v130 = *(void *)(v133 - 8);
  uint64_t v131 = v133 - 8;
  unint64_t v21 = (*(void *)(v130 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v133);
  uint64_t v132 = (char *)&v20 - v21;
  uint64_t v136 = sub_6C4C(&qword_35C00);
  unint64_t v22 = (*(void *)(*(void *)(v136 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v110);
  uint64_t v141 = (uint64_t)&v20 - v22;
  unint64_t v23 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v143 = (uint64_t)&v20 - v23;
  v184 = (char *)&v20 - v23;
  uint64_t v102 = sub_27C20();
  uint64_t v99 = *(void *)(v102 - 8);
  uint64_t v100 = v102 - 8;
  unint64_t v24 = (*(void *)(v99 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v110);
  unsigned __int8 v101 = (char *)&v20 - v24;
  uint64_t v93 = sub_27CA0();
  uint64_t v90 = *(void *)(v93 - 8);
  uint64_t v91 = v93 - 8;
  unint64_t v25 = (*(void *)(v90 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v110);
  uint64_t v92 = (char *)&v20 - v25;
  uint64_t v84 = sub_282B0();
  uint64_t v81 = *(void *)(v84 - 8);
  uint64_t v82 = v84 - 8;
  unint64_t v26 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v84);
  uint64_t v83 = (char *)&v20 - v26;
  uint64_t v49 = sub_6C4C(&qword_35C08);
  uint64_t v46 = *(void *)(v49 - 8);
  uint64_t v47 = v49 - 8;
  unint64_t v27 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v20 - v27;
  uint64_t v55 = sub_6C4C(&qword_35C10);
  uint64_t v52 = *(void *)(v55 - 8);
  uint64_t v53 = v55 - 8;
  unint64_t v28 = (*(void *)(v52 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v55);
  uint64_t v54 = (char *)&v20 - v28;
  uint64_t v66 = sub_6C4C(&qword_35C18);
  uint64_t v59 = *(void *)(v66 - 8);
  uint64_t v60 = v66 - 8;
  unint64_t v29 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v66);
  char v61 = (char *)&v20 - v29;
  uint64_t v74 = sub_6C4C(&qword_35C20);
  uint64_t v72 = *(void *)(v74 - 8);
  uint64_t v73 = v74 - 8;
  unint64_t v30 = (*(void *)(v72 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v74);
  unint64_t v75 = (char *)&v20 - v30;
  uint64_t v79 = sub_6C4C(&qword_35C28);
  unint64_t v31 = (*(void *)(*(void *)(v79 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v79);
  uint64_t v85 = (uint64_t)&v20 - v31;
  uint64_t v96 = sub_6C4C(&qword_35C30);
  unint64_t v32 = (*(void *)(*(void *)(v96 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v96);
  uint64_t v95 = (uint64_t)&v20 - v32;
  uint64_t v106 = sub_6C4C(&qword_35C38);
  uint64_t v103 = *(void *)(v106 - 8);
  uint64_t v104 = v106 - 8;
  unint64_t v33 = (*(void *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v106);
  char v105 = (char *)&v20 - v33;
  uint64_t v144 = sub_6C4C(&qword_35BE8);
  uint64_t v134 = *(void *)(v144 - 8);
  uint64_t v135 = v144 - 8;
  unint64_t v34 = (*(void *)(v134 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v121);
  uint64_t v142 = (uint64_t)&v20 - v34;
  unint64_t v35 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v147 = (uint64_t)&v20 - v35;
  v183 = (char *)&v20 - v35;
  uint64_t v182 = v6;
  int v58 = 1;
  sub_28170("https://example.com", 0x13uLL, 1);
  uint64_t v45 = sub_27D00();
  uint64_t v38 = v7;
  int v39 = v8;
  uint64_t v40 = v9;
  long long v10 = *(_OWORD *)(v121 + 8);
  uint64_t v37 = &v190;
  long long v190 = v10;
  uint64_t v191 = *((void *)v121 + 3);
  sub_1C134((uint64_t)&v190);
  sub_1C134((uint64_t)v37);
  char v36 = &v176;
  long long v176 = v190;
  uint64_t v177 = v191;
  uint64_t v115 = sub_6C4C(&qword_35B28);
  sub_28000();
  sub_1C174();
  uint64_t v41 = v178;
  uint64_t v42 = v179;
  uint64_t v43 = v180;
  uint64_t v44 = v181;
  sub_1C1AC((uint64_t)v37);
  sub_1DEF4();
  unint64_t v50 = sub_201B4();
  sub_27E90();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v49);
  uint64_t v174 = v49;
  unint64_t v175 = v50;
  uint64_t v109 = 1;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_27EE0();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v55);
  uint64_t v172 = v55;
  uint64_t v173 = OpaqueTypeConformance2;
  uint64_t v67 = swift_getOpaqueTypeConformance2();
  sub_27EF0();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v66);
  long long v11 = *(_OWORD *)(v121 + 8);
  uint64_t v63 = &v188;
  long long v188 = v11;
  uint64_t v189 = *((void *)v121 + 3);
  sub_1C134((uint64_t)&v188);
  sub_1C134((uint64_t)v63);
  uint64_t v62 = &v168;
  long long v168 = v188;
  uint64_t v169 = v189;
  sub_27FE0();
  sub_1C174();
  uint64_t v64 = v170;
  uint64_t v65 = v171;
  sub_1C1AC((uint64_t)v63);
  uint64_t v71 = v167;
  v167[0] = v64;
  v167[1] = v65;
  sub_1B2CC((uint64_t)v121);
  uint64_t v86 = 97;
  uint64_t v87 = 7;
  uint64_t v70 = swift_allocObject();
  size_t v88 = 81;
  memcpy((void *)(v70 + 16), v121, 0x51uLL);
  uint64_t v165 = v66;
  uint64_t v166 = v67;
  swift_getOpaqueTypeConformance2();
  sub_27F30();
  swift_release();
  sub_6D6C();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v74);
  id v77 = [self defaultCenter];
  NSNotificationName v76 = UITextFieldTextDidBeginEditingNotification;
  uint64_t v12 = UITextFieldTextDidBeginEditingNotification;
  sub_282C0();

  unint64_t v80 = sub_202AC();
  sub_204A8();
  uint64_t v128 = 0;
  sub_27F50();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v83, v84);
  sub_2052C(v85);
  sub_1B2CC((uint64_t)v121);
  uint64_t v94 = swift_allocObject();
  memcpy((void *)(v94 + 16), v121, v88);
  unint64_t v97 = sub_20634();
  sub_1E85C();
  sub_27F40();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v92, v93);
  swift_release();
  sub_206B8(v95);
  sub_27C10();
  uint64_t v163 = v96;
  unint64_t v164 = v97;
  uint64_t v107 = swift_getOpaqueTypeConformance2();
  sub_27E80();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v101, v102);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v105, v106);
  uint64_t v161 = v106;
  uint64_t v162 = v107;
  uint64_t v137 = swift_getOpaqueTypeConformance2();
  sub_18AFC(v142, v144, v147);
  v146 = *(void (**)(uint64_t, uint64_t))(v134 + 8);
  uint64_t v145 = v134 + 8;
  v146(v142, v144);
  uint64_t v114 = *((void *)v121 + 8);
  uint64_t v112 = *((void *)v121 + 9);
  int v113 = v121[80];
  sub_1B358();
  uint64_t v111 = type metadata accessor for DeveloperDiagnosticsViewModel();
  sub_1C244();
  uint64_t v120 = sub_27C00();
  sub_1B424();
  long long v13 = *(_OWORD *)(v121 + 8);
  uint64_t v117 = &v186;
  long long v186 = v13;
  uint64_t v187 = *((void *)v121 + 3);
  sub_1C134((uint64_t)&v186);
  sub_1C134((uint64_t)v117);
  uint64_t v116 = &v157;
  long long v157 = v186;
  uint64_t v158 = v187;
  sub_27FE0();
  sub_1C174();
  uint64_t v118 = v159;
  uint64_t v119 = v160;
  sub_1C1AC((uint64_t)v117);
  uint64_t v14 = sub_2234C();
  v129 = v156;
  v156[0] = v14;
  v156[1] = v15;
  v156[2] = v16;
  v156[3] = v17;
  long long v18 = *((_OWORD *)v121 + 3);
  uint64_t v123 = &v185;
  long long v185 = v18;
  sub_1C1EC();
  sub_1C1EC();
  uint64_t v122 = &v152;
  long long v152 = v185;
  sub_6C4C(&qword_35B30);
  sub_28000();
  sub_1C218();
  uint64_t v124 = v153;
  uint64_t v125 = v154;
  int v126 = v155;
  sub_1C218();
  sub_207BC();
  sub_27C60();
  sub_20838();
  sub_27F10();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v133);
  unint64_t v138 = sub_208BC();
  sub_18AFC(v141, v136, v143);
  sub_209DC(v141);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v134 + 16))(v142, v147, v144);
  v140 = v151;
  v151[0] = v142;
  sub_20A3C(v143, v141);
  v151[1] = v141;
  v150[0] = v144;
  v150[1] = v136;
  uint64_t v148 = v137;
  unint64_t v149 = v138;
  sub_18D78((uint64_t)v140, 2uLL, (uint64_t)v150, v139);
  sub_209DC(v141);
  v146(v142, v144);
  sub_209DC(v143);
  return ((uint64_t (*)(uint64_t, uint64_t))v146)(v147, v144);
}

uint64_t sub_1DEF4()
{
  return sub_280A0();
}

long long *sub_1DF50(uint64_t *a1, uint64_t a2)
{
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  uint64_t v2 = sub_6C4C(&qword_35670);
  unint64_t v38 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  int v39 = &v9[-v38];
  unint64_t v40 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(&v9[-v38]);
  uint64_t v45 = &v9[-v40];
  uint64_t v43 = *v41;
  uint64_t v44 = v41[1];
  uint64_t v58 = v43;
  uint64_t v59 = v44;
  uint64_t v57 = v42;
  sub_27B10();
  uint64_t v46 = sub_27B20();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = v46 - 8;
  uint64_t v49 = *(uint64_t (**)(unsigned char *, uint64_t))(v47 + 48);
  uint64_t v50 = v47 + 48;
  BOOL v37 = v49(v45, 1) != 1;
  BOOL v36 = v37;
  sub_F638((uint64_t)v45);
  swift_bridgeObjectRetain();
  if (!v36)
  {
    int v15 = 0;
    goto LABEL_18;
  }
  sub_27B10();
  if (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v49)(v39, 1, v46) == 1)
  {
    sub_F638((uint64_t)v39);
  }
  else
  {
    uint64_t v34 = sub_27B00();
    uint64_t v35 = v4;
    (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v39, v46);
    if (v35)
    {
      uint64_t v32 = v34;
      uint64_t v33 = v35;
      uint64_t v27 = v35;
      uint64_t v28 = sub_28160();
      uint64_t v29 = v5;
      swift_bridgeObjectRelease();
      uint64_t v30 = v28;
      uint64_t v31 = v29;
      goto LABEL_7;
    }
  }
  uint64_t v30 = 0;
  uint64_t v31 = 0;
LABEL_7:
  uint64_t v25 = v31;
  uint64_t v24 = v30;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_28170("https", 5uLL, 1);
  uint64_t v26 = v6;
  swift_bridgeObjectRetain();
  v52[0] = v24;
  v52[1] = v25;
  uint64_t v53 = v23;
  uint64_t v54 = v26;
  if (!v25)
  {
    if (!v54)
    {
      sub_6D6C();
      int v22 = 1;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  sub_20B44(v52, v51);
  if (!v54)
  {
    sub_6D6C();
LABEL_14:
    sub_20B0C();
    int v22 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = v51[0];
  uint64_t v19 = v51[1];
  swift_bridgeObjectRetain();
  uint64_t v17 = v53;
  uint64_t v20 = v52;
  uint64_t v18 = v54;
  swift_bridgeObjectRetain();
  int v21 = sub_28180();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_6D6C();
  int v22 = v21;
LABEL_13:
  int v14 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v15 = v14;
LABEL_18:
  int v10 = v15;
  swift_bridgeObjectRelease();
  long long v7 = *(_OWORD *)(v42 + 32);
  long long v13 = &v60;
  long long v60 = v7;
  sub_1C1EC();
  sub_1C1EC();
  uint64_t v12 = &v56;
  long long v56 = v60;
  long long v11 = &v55;
  char v55 = v10 & 1;
  sub_6C4C(&qword_35B30);
  sub_27FF0();
  sub_1C218();
  uint64_t result = v13;
  sub_1C218();
  return result;
}

void sub_1E4E8(uint64_t a1)
{
  uint64_t v9 = a1;
  sub_27A80();
  if (v8)
  {
    sub_20AA4();
    if (swift_dynamicCast()) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4;
  }
  else
  {
    sub_BB7C((uint64_t)v7);
    uint64_t v5 = 0;
  }
  if (v5)
  {
    id v2 = [v5 beginningOfDocument];
    id v1 = [v5 endOfDocument];
    id v3 = objc_msgSend(v5, "textRangeFromPosition:toPosition:", v2);

    [v5 setSelectedTextRange:v3];
  }
}

long long *sub_1E67C(uint64_t a1)
{
  sub_1B358();
  type metadata accessor for DeveloperDiagnosticsViewModel();
  sub_1C244();
  uint64_t v2 = sub_27C00();
  sub_1B424();
  long long v5 = *(_OWORD *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 24);
  sub_1C134((uint64_t)&v5);
  sub_1C134((uint64_t)&v5);
  sub_6C4C(&qword_35B28);
  sub_27FE0();
  sub_1C174();
  sub_1C1AC((uint64_t)&v5);
  sub_1B848();
  (*(void (**)())(*(void *)v2 + 336))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  long long v4 = *(_OWORD *)(a1 + 48);
  sub_1C1EC();
  sub_1C1EC();
  sub_6C4C(&qword_35B30);
  sub_27FF0();
  sub_1C218();
  uint64_t result = &v4;
  sub_1C218();
  return result;
}

uint64_t sub_1E85C()
{
  return sub_27C90();
}

unint64_t sub_1E880()
{
  uint64_t v2 = qword_35B68;
  if (!qword_35B68)
  {
    sub_700C(&qword_35B40);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1E904()
{
  return nullsub_2();
}

uint64_t sub_1E91C()
{
  return sub_28090();
}

uint64_t sub_1E940@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_1C2C8(a1);
}

uint64_t sub_1E988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v10 = a1;
  long long v7 = &opaque type descriptor for <<opaque return type of View.previewInterfaceOrientation(_:)>>;
  uint64_t v9 = sub_1EB14;
  uint64_t v17 = 0;
  uint64_t v11 = sub_6C4C(&qword_35B70);
  unint64_t v5 = (*(void *)(*(void *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v13 = (uint64_t)&v4 - v5;
  unint64_t v6 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v4 - v5);
  uint64_t v14 = (uint64_t)&v4 - v6;
  uint64_t v17 = (char *)&v4 - v6;
  uint64_t v8 = sub_6C4C(&qword_35B78);
  unint64_t v2 = sub_1EE68();
  int v15 = &unk_316E0;
  unint64_t v16 = v2;
  swift_getOpaqueTypeConformance2();
  sub_27FB0();
  unint64_t v12 = sub_1EEE8();
  sub_18AFC(v13, v11, v14);
  sub_1EFBC(v13);
  sub_1F01C(v14, v13);
  sub_18AFC(v13, v11, v10);
  sub_1EFBC(v13);
  return sub_1EFBC(v14);
}

uint64_t sub_1EB14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v14 = &opaque type descriptor for <<opaque return type of View.previewInterfaceOrientation(_:)>>;
  uint64_t v27 = 0;
  uint64_t v10 = sub_27D60();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v3 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v9 = (char *)&v3 - v3;
  uint64_t v21 = sub_6C4C(&qword_35B78);
  uint64_t v15 = *(void *)(v21 - 8);
  uint64_t v16 = v21 - 8;
  unint64_t v4 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v21);
  uint64_t v19 = (uint64_t)&v3 - v4;
  unint64_t v5 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v3 - v4);
  uint64_t v20 = (uint64_t)&v3 - v5;
  uint64_t v27 = (char *)&v3 - v5;
  unint64_t v6 = v28;
  sub_1B1C4(0, (uint64_t)v28);
  uint64_t v11 = __dst;
  memcpy(__dst, v6, 0x51uLL);
  sub_27D50();
  unint64_t v13 = sub_1EE68();
  unint64_t v12 = &unk_316E0;
  sub_27F00();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v10);
  sub_1FED0();
  uint64_t v24 = v12;
  unint64_t v25 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_18AFC(v19, v21, v20);
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  uint64_t v22 = v15 + 8;
  v23(v19, v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v19, v20, v21);
  sub_18AFC(v19, v21, v17);
  v23(v19, v21);
  return ((uint64_t (*)(uint64_t, uint64_t))v23)(v20, v21);
}

unint64_t sub_1EE68()
{
  uint64_t v2 = qword_35B80;
  if (!qword_35B80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1EEE8()
{
  uint64_t v2 = qword_35B88;
  if (!qword_35B88)
  {
    sub_700C(&qword_35B70);
    sub_1EE68();
    swift_getOpaqueTypeConformance2();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B88);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1EFBC(uint64_t a1)
{
  uint64_t v1 = sub_6C4C(&qword_35B78);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_1F01C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_6C4C(&qword_35B78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1F084@<X0>(uint64_t a1@<X8>)
{
  return sub_1E988(a1);
}

uint64_t sub_1F09C()
{
  return sub_27CD0();
}

unint64_t sub_1F0D4()
{
  uint64_t v2 = qword_35B90;
  if (!qword_35B90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B90);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1F154()
{
  return sub_27CC0();
}

unint64_t sub_1F18C()
{
  return sub_1F1A4();
}

unint64_t sub_1F1A4()
{
  uint64_t v2 = qword_35B98;
  if (!qword_35B98)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35B98);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1F224()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1F258()
{
  return sub_1F270();
}

unint64_t sub_1F270()
{
  uint64_t v2 = qword_35BA0;
  if (!qword_35BA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35BA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1F2F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F324(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t sub_1F364()
{
  return sub_1B424();
}

uint64_t sub_1F3C8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2 & 1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  swift_retain();
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 56) = v6;
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  char v10 = *(unsigned char *)(a2 + 80);
  sub_1B358();
  uint64_t result = a1;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v10 & 1;
  return result;
}

uint64_t sub_1F4C8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2 & 1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  swift_retain();
  *(void *)(a1 + 24) = v4;
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32) & 1;
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48) & 1;
  uint64_t v6 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 56) = v6;
  swift_release();
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  char v10 = *(unsigned char *)(a2 + 80);
  sub_1B358();
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v10 & 1;
  sub_1B424();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1F638(void *a1, const void *a2)
{
}

uint64_t sub_1F668(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2 & 1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32) & 1;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48) & 1;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v2 = *(void *)(a2 + 72);
  char v3 = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v2;
  *(unsigned char *)(a1 + 80) = v3 & 1;
  sub_1B424();
  return a1;
}

uint64_t sub_1F764(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 81))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v3 = *(void *)(a1 + 16);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1F87C(uint64_t result, int a2, int a3)
{
  int v3 = (unsigned char *)(result + 81);
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 72) = 0;
    *(void *)(result + 64) = 0;
    *(unsigned char *)(result + 80) = 0;
    if (a3 < 0) {
      unsigned char *v3 = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      unsigned char *v3 = 0;
    }
    if (a2) {
      *(void *)(result + 16) = (a2 - 1);
    }
  }
  return result;
}

void *type metadata accessor for DeveloperDiagnosticsView()
{
  return &unk_316E0;
}

uint64_t sub_1FA68(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1FC18(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1FE5C(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_1FE68(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for DeveloperDiagnosticsView.Mode()
{
  return &unk_31788;
}

void *type metadata accessor for DeveloperDiagnosticsView_Previews()
{
  return &unk_317A8;
}

unint64_t sub_1FEA0()
{
  return sub_1E880();
}

unint64_t sub_1FEB8()
{
  return sub_1EEE8();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1FED0()
{
}

uint64_t sub_1FF38@<X0>(uint64_t a1@<X8>)
{
  return sub_1CC34(*(const void **)(v1 + 16), a1);
}

uint64_t sub_1FF40@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF64(*(char **)(v1 + 16), a1);
}

unint64_t sub_1FF48()
{
  uint64_t v2 = qword_35BD8;
  if (!qword_35BD8)
  {
    sub_700C(&qword_35BD0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35BD8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1FFCC(uint64_t a1)
{
  uint64_t v4 = *(int *)(sub_6C4C(&qword_35BE0) + 44);
  uint64_t v1 = sub_6C4C(&qword_35BE8);
  (*(void (**)(void))(*(void *)(v1 - 8) + 8))();
  uint64_t v5 = *(int *)(sub_6C4C(&qword_35BF0) + 48);
  uint64_t v2 = sub_6C4C(&qword_35BF8);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4 + v5);
  return a1;
}

char *sub_200A4(char *a1, char *a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  uint64_t v5 = *(int *)(sub_6C4C(&qword_35BE0) + 44);
  uint64_t v2 = sub_6C4C(&qword_35BE8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 16))();
  uint64_t v7 = *(int *)(sub_6C4C(&qword_35BF0) + 48);
  uint64_t v3 = sub_6C4C(&qword_35BF8);
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(&a2[v5 + v7], &a1[v5 + v7]);
  return a2;
}

unint64_t sub_201B4()
{
  uint64_t v2 = qword_35C40;
  if (!qword_35C40)
  {
    sub_700C(&qword_35C08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20238()
{
  return swift_deallocObject();
}

long long *sub_202A4(uint64_t *a1)
{
  return sub_1DF50(a1, v1 + 16);
}

unint64_t sub_202AC()
{
  uint64_t v2 = qword_35C48;
  if (!qword_35C48)
  {
    sub_700C(&qword_35C28);
    sub_700C(&qword_35C18);
    sub_700C(&qword_35C10);
    sub_700C(&qword_35C08);
    sub_201B4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_20424();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20424()
{
  uint64_t v2 = qword_35C50;
  if (!qword_35C50)
  {
    sub_700C(&qword_35C58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_204A8()
{
  uint64_t v2 = qword_35C60;
  if (!qword_35C60)
  {
    sub_282B0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C60);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2052C(uint64_t a1)
{
  uint64_t v1 = sub_6C4C(&qword_35C20);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  sub_6C4C(&qword_35C28);
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_205C0()
{
  return swift_deallocObject();
}

long long *sub_2062C()
{
  return sub_1E67C(v0 + 16);
}

unint64_t sub_20634()
{
  uint64_t v2 = qword_35C68;
  if (!qword_35C68)
  {
    sub_700C(&qword_35C30);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_206B8(uint64_t a1)
{
  uint64_t v1 = sub_6C4C(&qword_35C20);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  sub_6C4C(&qword_35C28);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = *(int *)(sub_6C4C(&qword_35C30) + 52);
  uint64_t v2 = sub_282B0();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4);
  swift_release();
  return a1;
}

unint64_t sub_207BC()
{
  uint64_t v2 = qword_35C70;
  if (!qword_35C70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20838()
{
  uint64_t v2 = qword_35C78;
  if (!qword_35C78)
  {
    sub_700C(&qword_35BF8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_208BC()
{
  uint64_t v2 = qword_35C80;
  if (!qword_35C80)
  {
    sub_700C(&qword_35C00);
    sub_20838();
    sub_20960();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_20960()
{
  uint64_t v2 = qword_35C88;
  if (!qword_35C88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35C88);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209DC(uint64_t a1)
{
  uint64_t v1 = sub_6C4C(&qword_35BF8);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_20A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_6C4C(&qword_35BF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_20AA4()
{
  uint64_t v2 = qword_35C90;
  if (!qword_35C90)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_35C90);
    return ObjCClassMetadata;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_20B0C()
{
}

void *sub_20B44(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

uint64_t sub_20B84()
{
  return sub_27C70();
}

uint64_t sub_20BCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_20C2C(uint64_t a1)
{
  swift_retain();
  *(void *)(v1 + 8) = a1;
  swift_release();
  return swift_release();
}

uint64_t sub_20C80()
{
  swift_retain();
  type metadata accessor for DeveloperDiagnosticsViewModel();
  sub_1C244();
  uint64_t v1 = sub_27C80();
  swift_release();
  return v1;
}

uint64_t sub_20D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_20D3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a5;
  uint64_t v15 = a1;
  uint64_t v20 = a2;
  uint64_t v16 = a3;
  uint64_t v21 = a4;
  uint64_t v19 = sub_21324;
  unint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v28 = sub_6C4C(&qword_35C98);
  uint64_t v22 = *(void *)(v28 - 8);
  uint64_t v23 = v28 - 8;
  uint64_t v13 = *(void *)(v22 + 64);
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v20);
  uint64_t v26 = (uint64_t)&v11 - v12;
  unint64_t v14 = v12;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v27 = (uint64_t)&v11 - v14;
  unint64_t v38 = (char *)&v11 - v14;
  *(void *)&long long v36 = v7;
  *((void *)&v36 + 1) = v6;
  *(void *)&long long v37 = v8;
  *((void *)&v37 + 1) = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v17 = &v31;
  uint64_t v32 = v15;
  uint64_t v33 = v20;
  uint64_t v34 = v16;
  uint64_t v35 = v21;
  uint64_t v18 = sub_6C4C(&qword_35CA0);
  sub_21338();
  sub_27DE0();
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v25 = sub_21F68();
  sub_18AFC(v26, v28, v27);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  uint64_t v29 = v22 + 8;
  v30(v26, v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v26, v27, v28);
  sub_18AFC(v26, v28, v24);
  v30(v26, v28);
  return ((uint64_t (*)(uint64_t, uint64_t))v30)(v27, v28);
}

uint64_t sub_20FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v35 = a5;
  uint64_t v16 = a1;
  v15[1] = a2;
  v15[2] = a3;
  v15[3] = a4;
  uint64_t v21 = sub_2145C;
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v34 = sub_6C4C(&qword_35CB8);
  uint64_t v31 = *(void *)(v34 - 8);
  uint64_t v32 = v34 - 8;
  v15[0] = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v34);
  uint64_t v33 = (char *)v15 - v15[0];
  uint64_t v36 = sub_6C4C(&qword_35CA0);
  unint64_t v17 = (*(void *)(*(void *)(v36 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v16);
  uint64_t v38 = (uint64_t)v15 - v17;
  unint64_t v18 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v39 = (uint64_t)v15 - v18;
  uint64_t v44 = (char *)v15 - v18;
  *(void *)&long long v42 = v7;
  *((void *)&v42 + 1) = v8;
  *(void *)&long long v43 = v9;
  *((void *)&v43 + 1) = v10;
  uint64_t v19 = sub_20BCC(v7, v8);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 136))(v19);
  swift_release();
  uint64_t v26 = &v41;
  uint64_t v41 = v20;
  uint64_t v22 = sub_6C4C(&qword_35640);
  uint64_t v23 = sub_6C4C(&qword_35CD8);
  unint64_t v24 = sub_22FEC();
  unint64_t v25 = sub_23070();
  sub_2319C();
  sub_2217C((uint64_t)v26, (uint64_t)v21, 0, v22);
  uint64_t v28 = sub_28350();
  uint64_t v27 = v11;
  *uint64_t v11 = sub_27D70();
  char v12 = sub_27D80();
  uint64_t v13 = v28;
  v27[1] = v12;
  sub_6EDC();
  uint64_t v29 = v13;
  sub_1AA44();
  sub_28300();
  int v30 = v40;
  sub_213D8();
  sub_27F20();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v34);
  unint64_t v37 = sub_21338();
  sub_18AFC(v38, v36, v39);
  sub_23220(v38);
  sub_23280(v39, v38);
  sub_18AFC(v38, v36, v35);
  sub_23220(v38);
  return sub_23220(v39);
}

uint64_t sub_21324@<X0>(uint64_t a1@<X8>)
{
  return sub_20FB0(v1[2], v1[3], v1[4], v1[5], a1);
}

unint64_t sub_21338()
{
  uint64_t v2 = qword_35CA8;
  if (!qword_35CA8)
  {
    sub_700C(&qword_35CA0);
    sub_213D8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_213D8()
{
  uint64_t v2 = qword_35CB0;
  if (!qword_35CB0)
  {
    sub_700C(&qword_35CB8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2145C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v10 = a1;
  uint64_t v15 = sub_23524;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v2 = type metadata accessor for Feature();
  unint64_t v9 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v16 = (uint64_t)&v8 - v9;
  uint64_t v23 = sub_6C4C(&qword_35CD8);
  uint64_t v17 = *(void *)(v23 - 8);
  uint64_t v18 = v23 - 8;
  unint64_t v11 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v10);
  uint64_t v21 = (uint64_t)&v8 - v11;
  unint64_t v12 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v22 = (uint64_t)&v8 - v12;
  uint64_t v29 = (char *)&v8 - v12;
  uint64_t v28 = v5;
  sub_1095C(v5, v6);
  uint64_t v13 = &v26;
  uint64_t v27 = v16;
  uint64_t v14 = sub_6C4C(&qword_35CF8);
  sub_23118();
  sub_28080();
  sub_FC6C(v16);
  unint64_t v20 = sub_23070();
  sub_18AFC(v21, v23, v22);
  unint64_t v25 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  uint64_t v24 = v17 + 8;
  v25(v21, v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, v22, v23);
  sub_18AFC(v21, v23, v19);
  v25(v21, v23);
  return ((uint64_t (*)(uint64_t, uint64_t))v25)(v22, v23);
}

uint64_t sub_216BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v17 = a1;
  uint64_t v19 = 0;
  uint64_t v10 = sub_2352C;
  unint64_t v20 = sub_21FEC;
  char v68 = 0;
  uint64_t v67 = 0;
  uint64_t v39 = __b;
  int v9 = 0;
  memset(__b, 0, sizeof(__b));
  uint64_t v35 = sub_6C4C(&qword_35D08);
  uint64_t v26 = *(void *)(v35 - 8);
  uint64_t v27 = v35 - 8;
  unint64_t v6 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(0);
  uint64_t v33 = (uint64_t)&v6 - v6;
  unint64_t v7 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v38 = (uint64_t)&v6 - v7;
  char v68 = (char *)&v6 - v7;
  uint64_t v16 = type metadata accessor for Feature();
  unint64_t v8 = (*(void *)(*(void *)(v16 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v17);
  uint64_t v14 = (uint64_t)&v6 - v8;
  uint64_t v67 = v4;
  uint64_t v13 = sub_27D10();
  sub_1095C(v17, v14);
  unint64_t v11 = v40;
  v40[2] = v14;
  uint64_t v12 = sub_6C4C(&qword_35D10);
  sub_23534();
  sub_28020();
  sub_FC6C(v14);
  uint64_t v15 = v45;
  v45[0] = v55;
  v45[1] = v56;
  char v46 = v57 & 1;
  uint64_t v47 = v58;
  uint64_t v48 = v59;
  char v49 = v60 & 1;
  uint64_t v50 = v61;
  uint64_t v51 = v62;
  uint64_t v52 = v63;
  char v53 = v64 & 1;
  uint64_t v54 = v65;
  uint64_t v28 = sub_6C4C(&qword_35D20);
  unint64_t v29 = sub_235B8();
  sub_18AFC((uint64_t)v15, v28, (uint64_t)v39);
  sub_2363C((uint64_t)v15);
  uint64_t v18 = *(void *)(v17 + *(int *)(v16 + 24));
  swift_bridgeObjectRetain();
  unint64_t v25 = &v44;
  uint64_t v44 = v18;
  uint64_t v21 = sub_6C4C(&qword_35688);
  uint64_t v22 = type metadata accessor for RequirementRow();
  unint64_t v23 = sub_236A8();
  unint64_t v24 = sub_2372C();
  sub_237B0();
  sub_2217C((uint64_t)v25, (uint64_t)v20, 0, v21);
  unint64_t v30 = sub_23834();
  sub_18AFC(v33, v35, v38);
  unint64_t v37 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  uint64_t v36 = v26 + 8;
  v37(v33, v35);
  uint64_t v34 = v42;
  sub_238B8((uint64_t)v39, (uint64_t)v42);
  uint64_t v32 = v43;
  v43[0] = v34;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v33, v38, v35);
  v43[1] = v33;
  v41[0] = v28;
  v41[1] = v35;
  v40[3] = v29;
  v40[4] = v30;
  sub_18D78((uint64_t)v32, 2uLL, (uint64_t)v41, v31);
  v37(v33, v35);
  sub_2363C((uint64_t)v34);
  v37(v38, v35);
  return sub_2363C((uint64_t)v39);
}

uint64_t sub_21B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v18 = a1;
  uint64_t v91 = 0;
  uint64_t v52 = v90;
  memset(v90, 0, sizeof(v90));
  uint64_t v51 = v74;
  memset(v74, 0, sizeof(v74));
  uint64_t v31 = sub_27DA0();
  uint64_t v29 = *(void *)(v31 - 8);
  uint64_t v30 = v31 - 8;
  unint64_t v17 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v31);
  uint64_t v32 = (char *)&v16 - v17;
  uint64_t v91 = a1;
  sub_13B5C();
  uint64_t v86 = sub_27E30();
  uint64_t v87 = v3;
  unsigned __int8 v88 = v4;
  uint64_t v89 = v5;
  uint64_t v20 = v86;
  uint64_t v21 = v3;
  int v22 = v4;
  uint64_t v23 = v5;
  uint64_t v19 = sub_27DD0();
  uint64_t v82 = v20;
  uint64_t v83 = v21;
  int v42 = 1;
  char v84 = v22 & 1;
  uint64_t v85 = v23;
  uint64_t v78 = sub_27E20();
  uint64_t v79 = v6;
  unsigned __int8 v80 = v7;
  uint64_t v81 = v8;
  uint64_t v24 = v78;
  uint64_t v25 = v6;
  int v26 = v7;
  uint64_t v27 = v8;
  swift_release();
  sub_1815C(v20, v21, v22 & 1);
  swift_bridgeObjectRelease();
  uint64_t v28 = v75;
  v75[0] = v24;
  v75[1] = v25;
  char v76 = v26 & 1 & v42;
  uint64_t v77 = v27;
  uint64_t v45 = &type metadata for Text;
  char v46 = &protocol witness table for Text;
  sub_18AFC((uint64_t)v75, (uint64_t)&type metadata for Text, (uint64_t)v52);
  sub_198D0((uint64_t)v28);
  sub_13D6C();
  uint64_t v70 = sub_27E30();
  uint64_t v71 = v9;
  unsigned __int8 v72 = v10;
  uint64_t v73 = v11;
  uint64_t v35 = v70;
  uint64_t v36 = v9;
  int v37 = v10;
  uint64_t v38 = v11;
  uint64_t v33 = sub_27D90();
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v32, enum case for Font.Leading.tight(_:), v31);
  uint64_t v34 = sub_27DB0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v31);
  swift_release();
  uint64_t v66 = v35;
  uint64_t v67 = v36;
  char v68 = v37 & 1 & v42;
  uint64_t v69 = v38;
  uint64_t v62 = sub_27E20();
  uint64_t v63 = v12;
  unsigned __int8 v64 = v13;
  uint64_t v65 = v14;
  uint64_t v39 = v62;
  uint64_t v40 = v12;
  int v41 = v13;
  uint64_t v43 = v14;
  swift_release();
  sub_1815C(v35, v36, v37 & 1);
  swift_bridgeObjectRelease();
  uint64_t v44 = v59;
  v59[0] = v39;
  v59[1] = v40;
  char v60 = v41 & 1 & v42;
  uint64_t v61 = v43;
  sub_18AFC((uint64_t)v59, (uint64_t)v45, (uint64_t)v51);
  sub_198D0((uint64_t)v44);
  uint64_t v50 = v57;
  sub_239C0((uint64_t)v52, (uint64_t)v57);
  uint64_t v48 = v58;
  v58[0] = v50;
  char v49 = v56;
  sub_239C0((uint64_t)v51, (uint64_t)v56);
  v58[1] = v49;
  v55[0] = v45;
  v55[1] = v45;
  char v53 = v46;
  uint64_t v54 = v46;
  sub_18D78((uint64_t)v48, 2uLL, (uint64_t)v55, v47);
  sub_198D0((uint64_t)v49);
  sub_198D0((uint64_t)v50);
  sub_198D0((uint64_t)v51);
  return sub_198D0((uint64_t)v52);
}

unint64_t sub_21F68()
{
  uint64_t v2 = qword_35CC0;
  if (!qword_35CC0)
  {
    sub_700C(&qword_35C98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v9 = a1;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  v7[1] = 0;
  unint64_t v8 = (*(void *)(*(void *)(type metadata accessor for Requirement() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v12 = (uint64_t)v7 - v8;
  uint64_t v14 = type metadata accessor for RequirementRow();
  unint64_t v10 = (*(void *)(*(void *)(v14 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v9);
  uint64_t v16 = (uint64_t)v7 - v10;
  unint64_t v11 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v17 = (uint64_t)v7 - v11;
  uint64_t v19 = (char *)v7 - v11;
  uint64_t v18 = v4;
  sub_8D4C(v4, v5);
  sub_18FE8(v12, v16);
  unint64_t v15 = sub_2372C();
  sub_18AFC(v16, v14, v17);
  sub_8E38(v16);
  sub_8D4C(v17, v16);
  sub_18AFC(v16, v14, v13);
  sub_8E38(v16);
  return sub_8E38(v17);
}

uint64_t sub_2217C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a4 - 8) + 8))(a1);
}

uint64_t sub_2234C()
{
  return sub_20B84();
}

uint64_t sub_2237C@<X0>(uint64_t a1@<X8>)
{
  return sub_20D3C(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_223A4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DeveloperDiagnosticsViewModel();
  uint64_t v7 = sub_111A0();
  sub_28350();
  *uint64_t v1 = 0;
  v1[1] = 1;
  sub_6EDC();
  (*(void (**)(void))(*(void *)v7 + 328))();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_28170("https://example.com", 0x13uLL, 1);
  *a1 = sub_2234C();
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  return swift_release();
}

uint64_t sub_224B8@<X0>(uint64_t *a1@<X8>)
{
  return sub_223A4(a1);
}

uint64_t sub_224D0()
{
  return sub_27CD0();
}

unint64_t sub_22508()
{
  uint64_t v2 = qword_35CC8;
  if (!qword_35CC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22588()
{
  return sub_27CC0();
}

uint64_t sub_225C0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_225F4()
{
  return sub_2260C();
}

unint64_t sub_2260C()
{
  uint64_t v2 = qword_35CD0;
  if (!qword_35CD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2268C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226C0()
{
  return swift_bridgeObjectRelease();
}

void *sub_226F4(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_retain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[3] = v6;
  return result;
}

void *sub_2275C(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_retain();
  a1[1] = v3;
  swift_release();
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_227DC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void *sub_227F0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22854(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 32))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_229B0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)__n128 result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 32) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 32) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for Features()
{
  return &unk_31870;
}

void *type metadata accessor for Features_Previews()
{
  return &unk_31898;
}

unint64_t sub_22BE0()
{
  return sub_21F68();
}

unint64_t sub_22BF8()
{
  return sub_207BC();
}

uint64_t sub_22C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v41 = a9;
  v21[6] = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v32 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  uint64_t v29 = a8;
  v21[4] = 0;
  uint64_t v30 = sub_234F4;
  int v37 = &protocol conformance descriptor for <> ForEach<A, B, C>;
  uint64_t v54 = a4;
  uint64_t v53 = a5;
  uint64_t v25 = *(void *)(a4 - 8);
  unsigned char v21[5] = a4 - 8;
  v21[0] = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  uint64_t v28 = (char *)v21 - v21[0];
  v21[1] = 255;
  v21[3] = swift_getAssociatedTypeWitness();
  v21[2] = &protocol requirements base descriptor for Identifiable;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v48 = v32;
  uint64_t v49 = AssociatedTypeWitness;
  uint64_t v50 = v34;
  uint64_t v51 = v35;
  uint64_t v52 = AssociatedConformanceWitness;
  uint64_t v44 = sub_28050();
  uint64_t v38 = *(void *)(v44 - 8);
  uint64_t v39 = v44 - 8;
  uint64_t v23 = *(void *)(v38 + 64);
  unint64_t v22 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = __chkstk_darwin(v28);
  uint64_t v40 = (uint64_t)v21 - v22;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)v21 - v24;
  (*(void (**)(uint64_t))(v25 + 16))(v11);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v26;
  uint64_t v14 = v29;
  uint64_t v15 = v34;
  uint64_t v16 = v35;
  uint64_t v17 = v36;
  uint64_t v18 = (void *)v12;
  uint64_t v19 = v27;
  uint64_t v31 = v18;
  v18[2] = v32;
  v18[3] = v15;
  v18[4] = v16;
  v18[5] = v17;
  v18[6] = v14;
  v18[7] = v13;
  v18[8] = v19;
  swift_retain();
  sub_28040();
  uint64_t v47 = v36;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_18AFC(v40, v44, v43);
  char v46 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  uint64_t v45 = v38 + 8;
  v46(v40, v44);
  sub_18AFC(v43, v44, v41);
  return ((uint64_t (*)(uint64_t, uint64_t))v46)(v43, v44);
}

unint64_t sub_22FEC()
{
  uint64_t v2 = qword_35CE0;
  if (!qword_35CE0)
  {
    sub_700C(&qword_35640);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23070()
{
  uint64_t v2 = qword_35CE8;
  if (!qword_35CE8)
  {
    sub_700C(&qword_35CD8);
    sub_23118();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23118()
{
  uint64_t v2 = qword_35CF0;
  if (!qword_35CF0)
  {
    sub_700C(&qword_35CF8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35CF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2319C()
{
  uint64_t v2 = qword_35D00;
  if (!qword_35D00)
  {
    type metadata accessor for Feature();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D00);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_23220(uint64_t a1)
{
  uint64_t v1 = sub_6C4C(&qword_35CB8);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_23280(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_6C4C(&qword_35CB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v3 = sub_6C4C(&qword_35CA0);
  memcpy((void *)(a2 + *(int *)(v3 + 36)), (const void *)(a1 + *(int *)(v3 + 36)), 0x29uLL);
  return a2;
}

uint64_t sub_2331C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C10(v1[7], v1[8], v1[9], v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_23350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v15 = a5;
  uint64_t v18 = a3;
  uint64_t v16 = a4;
  uint64_t v22 = a2;
  uint64_t v21 = a3;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = a3 - 8;
  uint64_t v10 = *(void *)(v12 + 64);
  unint64_t v9 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v14 = (uint64_t)&v9 - v9;
  unint64_t v11 = v9;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v17 = (uint64_t)&v9 - v11;
  v7(v6);
  sub_18AFC(v14, v18, v17);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v19 = v12 + 8;
  v20(v14, v18);
  sub_18AFC(v17, v18, v15);
  return ((uint64_t (*)(uint64_t, uint64_t))v20)(v17, v18);
}

uint64_t sub_234A4()
{
  return swift_deallocObject();
}

uint64_t sub_234F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23350(a1, v2[2], v2[3], v2[5], a2);
}

uint64_t sub_23524@<X0>(uint64_t a1@<X8>)
{
  return sub_216BC(*(void *)(v1 + 16), a1);
}

uint64_t sub_2352C@<X0>(uint64_t a1@<X8>)
{
  return sub_21B14(*(void *)(v1 + 16), a1);
}

unint64_t sub_23534()
{
  uint64_t v2 = qword_35D18;
  if (!qword_35D18)
  {
    sub_700C(&qword_35D10);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_235B8()
{
  uint64_t v2 = qword_35D28;
  if (!qword_35D28)
  {
    sub_700C(&qword_35D20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D28);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2363C(uint64_t a1)
{
  return a1;
}

unint64_t sub_236A8()
{
  uint64_t v2 = qword_35D30;
  if (!qword_35D30)
  {
    sub_700C(&qword_35688);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2372C()
{
  uint64_t v2 = qword_35D38;
  if (!qword_35D38)
  {
    type metadata accessor for RequirementRow();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_237B0()
{
  uint64_t v2 = qword_35D40;
  if (!qword_35D40)
  {
    type metadata accessor for Requirement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23834()
{
  uint64_t v2 = qword_35D48;
  if (!qword_35D48)
  {
    sub_700C(&qword_35D08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D48);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_238B8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  sub_19918(v3, v4, v5 & 1);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = v4;
  *(unsigned char *)(a2 + 40) = v5 & 1;
  uint64_t v6 = *(void *)(a1 + 48);
  swift_bridgeObjectRetain();
  *(void *)(a2 + 48) = v6;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  char v9 = *(unsigned char *)(a1 + 72);
  sub_19918(v7, v8, v9 & 1);
  *(void *)(a2 + 56) = v7;
  *(void *)(a2 + 64) = v8;
  *(unsigned char *)(a2 + 72) = v9 & 1;
  uint64_t v12 = *(void *)(a1 + 80);
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_239C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_19918(*(void *)a1, v4, v5 & 1);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  uint64_t v8 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_23A48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v81 = a1;
  uint64_t v142 = 0;
  uint64_t v141 = 0;
  uint64_t v140 = 0;
  uint64_t v82 = sub_6C4C(&qword_35D50);
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v84 = v82 - 8;
  unint64_t v85 = (*(void *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v82);
  uint64_t v86 = (uint64_t)v23 - v85;
  unint64_t v87 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v23 - v85);
  uint64_t v88 = (uint64_t)v23 - v87;
  unint64_t v89 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v23 - v87);
  uint64_t v90 = (uint64_t)v23 - v89;
  uint64_t v142 = (char *)v23 - v89;
  uint64_t v91 = sub_6C4C(&qword_35D58);
  unint64_t v92 = (*(void *)(*(void *)(v91 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v91);
  uint64_t v93 = (uint64_t)v23 - v92;
  uint64_t v94 = sub_6C4C(&qword_35D60);
  unint64_t v95 = (*(void *)(*(void *)(v94 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v94);
  uint64_t v96 = (uint64_t)v23 - v95;
  uint64_t v104 = type metadata accessor for Requirement();
  unint64_t v97 = (*(void *)(*(void *)(v104 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v104);
  uint64_t v105 = (uint64_t)v23 - v97;
  uint64_t v99 = sub_6C4C(&qword_35D68);
  unint64_t v100 = (*(void *)(*(void *)(v99 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v98);
  unsigned __int8 v101 = (char *)v23 - v100;
  unint64_t v102 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v103 = (char *)v23 - v102;
  uint64_t v141 = (char *)v23 - v102;
  uint64_t v140 = v5;
  sub_8D4C(v5, v6);
  int v106 = *(unsigned __int8 *)(v105 + *(int *)(v104 + 28));
  sub_8E38(v105);
  uint64_t v107 = v106;
  switch((char)v106)
  {
    case 1:
      sub_27C30();
      unint64_t v61 = sub_249BC();
      sub_18AFC(v88, v82, v90);
      uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
      uint64_t v66 = v83 + 8;
      v67(v88, v82);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v86, v90, v82);
      sub_18AFC(v86, v82, v88);
      v67(v86, v82);
      uint64_t v64 = sub_6C4C(&qword_35D70);
      unint64_t v65 = sub_2470C();
      sub_19A54(v88, v64, v82, v65, v61, v93);
      v67(v88, v82);
      uint64_t v62 = sub_6C4C(&qword_35DB0);
      unint64_t v63 = sub_24918();
      unint64_t v12 = sub_24A40();
      sub_1995C(v93, v91, v62, v63, v12, v96);
      sub_252F0(v93);
      unint64_t v13 = sub_24874();
      sub_1995C(v96, v94, v64, v13, v65, (uint64_t)v101);
      sub_251F0(v96);
      sub_24ADC(v101, v103);
      v67(v90, v82);
      break;
    case 2:
      sub_28170("checkmark.circle.fill", 0x15uLL, 1);
      uint64_t v14 = sub_27FC0();
      uint64_t v48 = v122;
      v122[0] = v14;
      uint64_t v47 = sub_27F70();
      sub_27EC0();
      swift_release();
      sub_246E0();
      uint64_t v49 = v121;
      v121[0] = v122[1];
      v121[1] = v122[2];
      v121[2] = v122[3];
      uint64_t v58 = sub_6C4C(&qword_35D70);
      unint64_t v59 = sub_2470C();
      char v60 = v123;
      sub_18AFC((uint64_t)v49, v58, (uint64_t)v123);
      sub_24830();
      uint64_t v50 = v123[0];
      uint64_t v51 = v123[1];
      uint64_t v52 = v123[2];
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v53 = v117;
      v117[0] = v50;
      v117[1] = v51;
      v117[2] = v52;
      sub_18AFC((uint64_t)v117, v58, (uint64_t)v118);
      sub_24830();
      uint64_t v54 = v116;
      v116[0] = v118[0];
      v116[1] = v118[1];
      v116[2] = v118[2];
      sub_1995C((uint64_t)v116, v58, v58, v59, v59, (uint64_t)v119);
      sub_24830();
      char v57 = v114;
      v114[0] = v119[0];
      v114[1] = v119[1];
      v114[2] = v119[2];
      char v115 = v120 & 1;
      uint64_t v55 = sub_6C4C(&qword_35DB0);
      unint64_t v56 = sub_24918();
      unint64_t v15 = sub_24A40();
      sub_19A54((uint64_t)v57, v91, v55, v56, v15, v96);
      sub_251B0();
      unint64_t v16 = sub_24874();
      sub_1995C(v96, v94, v58, v16, v59, (uint64_t)v101);
      sub_251F0(v96);
      sub_24ADC(v101, v103);
      sub_24830();
      break;
    case 3:
      sub_28170("exclamationmark.triangle.fill", 0x1DuLL, 1);
      uint64_t v17 = sub_27FC0();
      uint64_t v34 = v132;
      v132[0] = v17;
      uint64_t v33 = sub_27F90();
      sub_27EC0();
      swift_release();
      sub_246E0();
      uint64_t v35 = v131;
      v131[0] = v132[1];
      v131[1] = v132[2];
      v131[2] = v132[3];
      uint64_t v44 = sub_6C4C(&qword_35D70);
      unint64_t v45 = sub_2470C();
      char v46 = v133;
      sub_18AFC((uint64_t)v35, v44, (uint64_t)v133);
      sub_24830();
      uint64_t v36 = v133[0];
      uint64_t v37 = v133[1];
      uint64_t v38 = v133[2];
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v39 = v127;
      v127[0] = v36;
      v127[1] = v37;
      v127[2] = v38;
      sub_18AFC((uint64_t)v127, v44, (uint64_t)v128);
      sub_24830();
      uint64_t v40 = v126;
      v126[0] = v128[0];
      v126[1] = v128[1];
      v126[2] = v128[2];
      sub_19A54((uint64_t)v126, v44, v44, v45, v45, (uint64_t)v129);
      sub_24830();
      uint64_t v43 = v124;
      v124[0] = v129[0];
      v124[1] = v129[1];
      v124[2] = v129[2];
      char v125 = v130 & 1;
      uint64_t v41 = sub_6C4C(&qword_35DB0);
      unint64_t v42 = sub_24918();
      unint64_t v18 = sub_24A40();
      sub_19A54((uint64_t)v43, v91, v41, v42, v18, v96);
      sub_251B0();
      unint64_t v19 = sub_24874();
      sub_1995C(v96, v94, v44, v19, v45, (uint64_t)v101);
      sub_251F0(v96);
      sub_24ADC(v101, v103);
      sub_24830();
      break;
    case 4:
      sub_28170("circle", 6uLL, 1);
      uint64_t v20 = sub_27FC0();
      v23[2] = v138;
      v138[0] = v20;
      v23[1] = sub_27F80();
      sub_27EC0();
      swift_release();
      sub_246E0();
      unint64_t v24 = v137;
      v137[0] = v138[1];
      v137[1] = v138[2];
      v137[2] = v138[3];
      uint64_t v29 = sub_6C4C(&qword_35D70);
      unint64_t v30 = sub_2470C();
      uint64_t v32 = v139;
      sub_18AFC((uint64_t)v24, v29, (uint64_t)v139);
      sub_24830();
      uint64_t v25 = v139[0];
      uint64_t v26 = v139[1];
      uint64_t v27 = v139[2];
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v28 = v135;
      v135[0] = v25;
      v135[1] = v26;
      v135[2] = v27;
      sub_18AFC((uint64_t)v135, v29, (uint64_t)v136);
      sub_24830();
      uint64_t v31 = v134;
      v134[0] = v136[0];
      v134[1] = v136[1];
      v134[2] = v136[2];
      unint64_t v21 = sub_24874();
      sub_19A54((uint64_t)v31, v94, v29, v21, v30, (uint64_t)v101);
      sub_24830();
      sub_24ADC(v101, v103);
      sub_24830();
      break;
    default:
      sub_28170("circle", 6uLL, 1);
      uint64_t v7 = sub_27FC0();
      uint64_t v69 = v112;
      v112[0] = v7;
      id v8 = [self systemFillColor];
      uint64_t v68 = sub_27F60();
      sub_27EC0();
      swift_release();
      sub_246E0();
      uint64_t v70 = v111;
      v111[0] = v112[1];
      v111[1] = v112[2];
      v111[2] = v112[3];
      uint64_t v78 = sub_6C4C(&qword_35D70);
      unint64_t v79 = sub_2470C();
      unsigned __int8 v80 = v113;
      sub_18AFC((uint64_t)v70, v78, (uint64_t)v113);
      sub_24830();
      uint64_t v71 = v113[0];
      uint64_t v72 = v113[1];
      uint64_t v73 = v113[2];
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v74 = v109;
      v109[0] = v71;
      v109[1] = v72;
      v109[2] = v73;
      sub_18AFC((uint64_t)v109, v78, (uint64_t)v110);
      sub_24830();
      unint64_t v75 = v108;
      v108[0] = v110[0];
      v108[1] = v110[1];
      v108[2] = v110[2];
      unint64_t v9 = sub_249BC();
      sub_1995C((uint64_t)v75, v78, v82, v79, v9, v93);
      sub_24830();
      uint64_t v76 = sub_6C4C(&qword_35DB0);
      unint64_t v77 = sub_24918();
      unint64_t v10 = sub_24A40();
      sub_1995C(v93, v91, v76, v77, v10, v96);
      sub_252F0(v93);
      unint64_t v11 = sub_24874();
      sub_1995C(v96, v94, v78, v11, v79, (uint64_t)v101);
      sub_251F0(v96);
      sub_24ADC(v101, v103);
      sub_24830();
      break;
  }
  sub_24C88((uint64_t *)v103, (uint64_t)v101);
  sub_24F50();
  sub_18AFC((uint64_t)v101, v99, v81);
  sub_24FF4((uint64_t)v101);
  return sub_24FF4((uint64_t)v103);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_246E0()
{
}

unint64_t sub_2470C()
{
  uint64_t v2 = qword_35D78;
  if (!qword_35D78)
  {
    sub_700C(&qword_35D70);
    sub_247AC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_247AC()
{
  uint64_t v2 = qword_35D80;
  if (!qword_35D80)
  {
    sub_700C(&qword_35D88);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D80);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24830()
{
}

unint64_t sub_24874()
{
  uint64_t v2 = qword_35D90;
  if (!qword_35D90)
  {
    sub_700C(&qword_35D60);
    sub_24918();
    sub_24A40();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24918()
{
  uint64_t v2 = qword_35D98;
  if (!qword_35D98)
  {
    sub_700C(&qword_35D58);
    sub_2470C();
    sub_249BC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35D98);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_249BC()
{
  uint64_t v2 = qword_35DA0;
  if (!qword_35DA0)
  {
    sub_700C(&qword_35D50);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35DA0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24A40()
{
  uint64_t v2 = qword_35DA8;
  if (!qword_35DA8)
  {
    sub_700C(&qword_35DB0);
    sub_2470C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35DA8);
    return WitnessTable;
  }
  return v2;
}

void *sub_24ADC(const void *a1, void *a2)
{
  uint64_t v8 = sub_6C4C(&qword_35DB8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a2, a1, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v5 = sub_6C4C(&qword_35DC0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a2, a1, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      uint64_t v4 = sub_6C4C(&qword_35DC8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v2 = sub_6C4C(&qword_35D50);
        (*(void (**)(void *, const void *))(*(void *)(v2 - 8) + 32))(a2, a1);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a2, a1, *(void *)(*(void *)(v4 - 8) + 64));
      }
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a2;
}

uint64_t sub_24C88(uint64_t *a1, uint64_t a2)
{
  sub_6C4C(&qword_35DB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = *a1;
    swift_retain();
    *(void *)a2 = v4;
    uint64_t v5 = a1[1];
    swift_retain();
    *(void *)(a2 + 8) = v5;
    uint64_t v6 = a1[2];
    swift_retain();
    *(void *)(a2 + 16) = v6;
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    sub_6C4C(&qword_35DC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = *a1;
      uint64_t v8 = a1[1];
      uint64_t v9 = a1[2];
      char v10 = *((unsigned char *)a1 + 24);
      sub_24EE8();
      *(void *)a2 = v7;
      *(void *)(a2 + 8) = v8;
      *(void *)(a2 + 16) = v9;
      *(unsigned char *)(a2 + 24) = v10 & 1;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      sub_6C4C(&qword_35DC8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v2 = sub_6C4C(&qword_35D50);
        (*(void (**)(uint64_t, uint64_t *))(*(void *)(v2 - 8) + 16))(a2, a1);
      }
      else
      {
        uint64_t v11 = *a1;
        swift_retain();
        *(void *)a2 = v11;
        uint64_t v12 = a1[1];
        swift_retain();
        *(void *)(a2 + 8) = v12;
        uint64_t v13 = a1[2];
        swift_retain();
        *(void *)(a2 + 16) = v13;
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a2;
}

uint64_t sub_24EE8()
{
  return swift_retain();
}

unint64_t sub_24F50()
{
  uint64_t v2 = qword_35DD0;
  if (!qword_35DD0)
  {
    sub_700C(&qword_35D68);
    sub_24874();
    sub_2470C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35DD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_24FF4(uint64_t a1)
{
  sub_6C4C(&qword_35DB8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    goto LABEL_6;
  }
  sub_6C4C(&qword_35DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25148();
    return a1;
  }
  sub_6C4C(&qword_35DC8);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
LABEL_6:
    swift_release();
    swift_release();
    swift_release();
    return a1;
  }
  uint64_t v1 = sub_6C4C(&qword_35D50);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_25148()
{
  return swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_251B0()
{
}

uint64_t sub_251F0(uint64_t a1)
{
  sub_6C4C(&qword_35DC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25148();
  }
  else
  {
    sub_6C4C(&qword_35DC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v1 = sub_6C4C(&qword_35D50);
      (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
  }
  return a1;
}

uint64_t sub_252F0(uint64_t a1)
{
  sub_6C4C(&qword_35DC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v1 = sub_6C4C(&qword_35D50);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  return a1;
}

uint64_t sub_253A4@<X0>(uint64_t a1@<X8>)
{
  return sub_23A48(a1);
}

uint64_t sub_253BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v9 = a1;
  uint64_t v13 = 0;
  char v10 = sub_25C08;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v1 = type metadata accessor for RequirementRow();
  unint64_t v11 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v12 = (uint64_t)v7 - v11;
  uint64_t v14 = sub_6C4C(&qword_35DD8);
  unint64_t v15 = (*(void *)(*(void *)(v14 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t)v7 - v15;
  unint64_t v17 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v18 = (uint64_t)v7 - v17;
  uint64_t v26 = (char *)v7 - v17;
  uint64_t v21 = type metadata accessor for Requirement();
  unint64_t v20 = (*(void *)(*(void *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v19);
  uint64_t v22 = (uint64_t)v7 - v20;
  uint64_t v25 = v4;
  sub_8D4C(v4, (uint64_t)v7 - v20);
  int v23 = *(unsigned __int8 *)(v22 + *(int *)(v21 + 28));
  sub_8E38(v22);
  if (sub_141F4(v23, 1)) {
    uint64_t v8 = sub_27CF0();
  }
  else {
    uint64_t v8 = sub_27CE0();
  }
  void v7[2] = v8;
  uint64_t v24 = v8;
  sub_8D4C(v19, v12);
  v7[3] = v7;
  __chkstk_darwin(v7);
  v7[0] = &v7[-4];
  v7[-2] = v5;
  v7[1] = sub_6C4C(&qword_35DE0);
  sub_25C10();
  sub_28010();
  sub_8E38(v12);
  v7[4] = sub_25C94();
  sub_18AFC(v16, v14, v18);
  sub_25D18(v16);
  sub_25E0C(v18, v16);
  sub_18AFC(v16, v14, v9);
  sub_25D18(v16);
  return sub_25D18(v18);
}

uint64_t type metadata accessor for RequirementRow()
{
  uint64_t v1 = qword_36C00;
  if (!qword_36C00) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_25708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v19 = a1;
  uint64_t v14 = 0;
  unint64_t v20 = sub_27618;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  uint64_t v47 = 0;
  unint64_t v10 = (*(void *)(*(void *)(type metadata accessor for RequirementRow() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v26 = (uint64_t)&v9 - v10;
  uint64_t v23 = type metadata accessor for RequirementDetail();
  unint64_t v11 = (*(void *)(*(void *)(v23 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v23);
  uint64_t v25 = (uint64_t)&v9 - v11;
  uint64_t v36 = sub_6C4C(&qword_35E08);
  uint64_t v27 = *(void *)(v36 - 8);
  uint64_t v28 = v36 - 8;
  unint64_t v12 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v14);
  uint64_t v34 = (uint64_t)&v9 - v12;
  unint64_t v13 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v39 = (uint64_t)&v9 - v13;
  uint64_t v49 = (char *)&v9 - v13;
  unint64_t v15 = (*(void *)(*(void *)(type metadata accessor for Requirement() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v14);
  uint64_t v18 = (uint64_t)&v9 - v15;
  uint64_t v29 = type metadata accessor for StateGlyph();
  unint64_t v16 = (*(void *)(*(void *)(v29 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v19);
  uint64_t v35 = (uint64_t)&v9 - v16;
  unint64_t v17 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v40 = (uint64_t)&v9 - v17;
  uint64_t v48 = (char *)&v9 - v17;
  uint64_t v47 = v6;
  sub_8D4C(v6, v7);
  sub_18FE8(v18, v35);
  unint64_t v30 = sub_27594();
  sub_18AFC(v35, v29, v40);
  sub_8E38(v35);
  sub_8D4C(v19, v18);
  sub_18FE8(v18, v25);
  sub_8D4C(v19, v26);
  uint64_t v21 = &v41;
  uint64_t v42 = v26;
  uint64_t v22 = sub_6C4C(&qword_35F48);
  unint64_t v24 = sub_27620();
  sub_19B4C();
  sub_27C50();
  sub_8E38(v26);
  unint64_t v31 = sub_276A4();
  sub_18AFC(v34, v36, v39);
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  uint64_t v37 = v27 + 8;
  v38(v34, v36);
  sub_8D4C(v40, v35);
  uint64_t v33 = v46;
  v46[0] = v35;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v34, v39, v36);
  v46[1] = v34;
  v45[0] = v29;
  v45[1] = v36;
  unint64_t v43 = v30;
  unint64_t v44 = v31;
  sub_18D78((uint64_t)v33, 2uLL, (uint64_t)v45, v32);
  v38(v34, v36);
  sub_8E38(v35);
  v38(v39, v36);
  return sub_8E38(v40);
}

uint64_t sub_25C08@<X0>(uint64_t a1@<X8>)
{
  return sub_25708(*(void *)(v1 + 16), a1);
}

unint64_t sub_25C10()
{
  uint64_t v2 = qword_35DE8;
  if (!qword_35DE8)
  {
    sub_700C(&qword_35DE0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35DE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_25C94()
{
  uint64_t v2 = qword_35DF0;
  if (!qword_35DF0)
  {
    sub_700C(&qword_35DD8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35DF0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_25D18(uint64_t a1)
{
  uint64_t v4 = *(int *)(sub_6C4C(&qword_35DF8) + 44);
  uint64_t v1 = sub_27B60();
  (*(void (**)(void))(*(void *)(v1 - 8) + 8))();
  type metadata accessor for Requirement();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(int *)(sub_6C4C(&qword_35E00) + 48);
  uint64_t v2 = sub_6C4C(&qword_35E08);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4 + v5);
  return a1;
}

uint64_t sub_25E0C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
  uint64_t v6 = *(int *)(sub_6C4C(&qword_35DF8) + 44);
  uint64_t v2 = sub_27B60();
  uint64_t v12 = a2 + v6;
  (*(void (**)(void))(*(void *)(v2 - 8) + 16))();
  uint64_t v8 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(v12 + v8[5]) = *(unsigned char *)(a1 + v6 + v8[5]);
  uint64_t v3 = (void *)(a1 + v6 + v8[6]);
  uint64_t v9 = (void *)(a2 + v6 + v8[6]);
  *uint64_t v9 = *v3;
  uint64_t v10 = v3[1];
  swift_bridgeObjectRetain();
  v9[1] = v10;
  *(unsigned char *)(v12 + v8[7]) = *(unsigned char *)(a1 + v6 + v8[7]);
  uint64_t v11 = *(int *)(sub_6C4C(&qword_35E00) + 48);
  uint64_t v4 = sub_6C4C(&qword_35E08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2 + v6 + v11, a1 + v6 + v11);
  return a2;
}

uint64_t sub_25FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v5 = a1;
  uint64_t v3 = 0;
  uint64_t v7 = sub_27728;
  uint64_t v63 = 0;
  uint64_t v29 = __b;
  int v6 = 0;
  memset(__b, 0, sizeof(__b));
  unint64_t v4 = (*(void *)(*(void *)(type metadata accessor for RequirementRow() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (uint64_t)&v3 - v4;
  uint64_t v63 = __chkstk_darwin(v5);
  uint64_t v10 = sub_27D10();
  sub_8D4C(v5, v11);
  uint64_t v8 = v30;
  v30[2] = v11;
  uint64_t v9 = sub_6C4C(&qword_35F60);
  sub_27730();
  sub_28020();
  sub_8E38(v11);
  uint64_t v12 = v41;
  v41[0] = v51;
  v41[1] = v52;
  int v19 = 1;
  char v42 = v53 & 1;
  uint64_t v43 = v54;
  uint64_t v44 = v55;
  char v45 = v56 & 1;
  uint64_t v46 = v57;
  uint64_t v47 = v58;
  uint64_t v48 = v59;
  uint64_t v49 = v60;
  uint64_t v50 = v61;
  uint64_t v26 = sub_6C4C(&qword_35F48);
  unint64_t v27 = sub_27620();
  sub_18AFC((uint64_t)v12, v26, (uint64_t)v29);
  sub_277B4((uint64_t)v12);
  uint64_t v13 = __b[0];
  uint64_t v14 = __b[1];
  int v15 = LOBYTE(__b[2]);
  uint64_t v16 = __b[3];
  uint64_t v17 = __b[4];
  int v18 = LOBYTE(__b[5]);
  uint64_t v20 = __b[6];
  uint64_t v21 = __b[7];
  uint64_t v22 = __b[8];
  uint64_t v23 = __b[9];
  uint64_t v24 = __b[10];
  sub_19918(__b[3], __b[4], __b[5] & 1);
  swift_bridgeObjectRetain();
  sub_2783C(v21, v22, v23, v24);
  uint64_t v28 = v31;
  v31[0] = v13;
  v31[1] = v14;
  char v32 = v15 & 1 & v19;
  uint64_t v33 = v16;
  uint64_t v34 = v17;
  char v35 = v18 & 1 & v19;
  uint64_t v36 = v20;
  uint64_t v37 = v21;
  uint64_t v38 = v22;
  uint64_t v39 = v23;
  uint64_t v40 = v24;
  sub_18AFC((uint64_t)v31, v26, v25);
  sub_277B4((uint64_t)v28);
  return sub_277B4((uint64_t)v29);
}

uint64_t sub_26298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v71 = a1;
  uint64_t v130 = 0;
  uint64_t v69 = v129;
  memset(v129, 0, sizeof(v129));
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v58 = 0;
  uint64_t v59 = sub_27DA0();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = v59 - 8;
  unint64_t v62 = (*(void *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v63 = (char *)&v20 - v62;
  uint64_t v72 = type metadata accessor for Requirement();
  unint64_t v64 = (*(void *)(*(void *)(v72 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v71);
  uint64_t v74 = (uint64_t)&v20 - v64;
  unint64_t v65 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v66 = (uint64_t)&v20 - v65;
  uint64_t v130 = v4;
  sub_8D4C(v4, (uint64_t)&v20 - v65);
  uint64_t v68 = sub_14C00();
  uint64_t v67 = v5;
  sub_8E38(v66);
  uint64_t v125 = sub_27E30();
  uint64_t v126 = v6;
  char v127 = v7;
  uint64_t v128 = v8;
  uint64_t v70 = v122;
  v122[0] = v125;
  v122[1] = v6;
  char v123 = v7 & 1;
  uint64_t v124 = v8;
  sub_18AFC((uint64_t)v122, (uint64_t)&type metadata for Text, (uint64_t)v69);
  sub_198D0((uint64_t)v70);
  sub_8D4C(v71, v74);
  uint64_t v9 = (uint64_t *)(v74 + *(int *)(v72 + 24));
  uint64_t v73 = *v9;
  uint64_t v75 = v9[1];
  swift_bridgeObjectRetain();
  sub_8E38(v74);
  if (v75)
  {
    uint64_t v55 = v73;
    uint64_t v56 = v75;
    uint64_t v54 = v75;
    uint64_t v28 = v73;
    uint64_t v109 = v73;
    uint64_t v110 = v75;
    swift_bridgeObjectRetain();
    uint64_t v103 = sub_27E30();
    uint64_t v104 = v10;
    unsigned __int8 v105 = v11;
    uint64_t v106 = v12;
    uint64_t v30 = v103;
    uint64_t v31 = v10;
    int v32 = v11;
    uint64_t v33 = v12;
    uint64_t v29 = sub_27FA0();
    uint64_t v99 = v30;
    uint64_t v100 = v31;
    int v47 = 1;
    char v101 = v32 & 1;
    uint64_t v102 = v33;
    uint64_t v95 = sub_27E10();
    uint64_t v96 = v13;
    unsigned __int8 v97 = v14;
    uint64_t v98 = v15;
    uint64_t v36 = v95;
    uint64_t v37 = v13;
    int v38 = v14;
    uint64_t v39 = v15;
    swift_release();
    sub_1815C(v30, v31, v32 & 1);
    swift_bridgeObjectRelease();
    uint64_t v34 = sub_27DC0();
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v63, enum case for Font.Leading.tight(_:), v59);
    uint64_t v35 = sub_27DB0();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v59);
    swift_release();
    uint64_t v91 = v36;
    uint64_t v92 = v37;
    char v93 = v38 & 1 & v47;
    uint64_t v94 = v39;
    uint64_t v87 = sub_27E20();
    uint64_t v88 = v16;
    unsigned __int8 v89 = v17;
    uint64_t v90 = v18;
    uint64_t v40 = v87;
    uint64_t v41 = v16;
    int v42 = v17;
    uint64_t v43 = v18;
    swift_release();
    sub_1815C(v36, v37, v38 & 1);
    swift_bridgeObjectRelease();
    uint64_t v44 = v84;
    v84[0] = v40;
    v84[1] = v41;
    char v85 = v42 & 1 & v47;
    uint64_t v86 = v43;
    char v53 = &v107;
    uint64_t v50 = &type metadata for Text;
    uint64_t v51 = &protocol witness table for Text;
    sub_18AFC((uint64_t)v84, (uint64_t)&type metadata for Text, (uint64_t)&v107);
    sub_198D0((uint64_t)v44);
    long long v45 = v107;
    int v46 = v108;
    uint64_t v48 = *((void *)&v108 + 1);
    sub_19918(v107, *((uint64_t *)&v107 + 1), v108 & 1);
    swift_bridgeObjectRetain();
    uint64_t v49 = &v77;
    long long v77 = v45;
    char v78 = v46 & 1 & v47;
    uint64_t v79 = v48;
    sub_18AFC((uint64_t)&v77, (uint64_t)v50, (uint64_t)v80);
    sub_198D0((uint64_t)v49);
    uint64_t v52 = v76;
    v76[0] = v80[0];
    v76[1] = v80[1];
    v76[2] = v81 & 1;
    v76[3] = v82;
    sub_18D2C(v76, (uint64_t)v50, v83);
    sub_279F0((uint64_t)v52);
    uint64_t v118 = v83[0];
    uint64_t v119 = v83[1];
    uint64_t v120 = v83[2];
    uint64_t v121 = v83[3];
    sub_198D0((uint64_t)v53);
    swift_bridgeObjectRelease();
  }
  else
  {
    memset(v116, 0, sizeof(v116));
    sub_18D2C(v116, (uint64_t)&type metadata for Text, v117);
    uint64_t v118 = v117[0];
    uint64_t v119 = v117[1];
    uint64_t v120 = v117[2];
    uint64_t v121 = v117[3];
  }
  unint64_t v27 = v129;
  uint64_t v25 = v114;
  sub_239C0((uint64_t)v129, (uint64_t)v114);
  uint64_t v23 = v115;
  v115[0] = v25;
  uint64_t v26 = &v118;
  uint64_t v24 = v113;
  sub_278A0((uint64_t)&v118, (uint64_t)v113);
  v115[1] = v24;
  uint64_t v21 = v112;
  v112[0] = &type metadata for Text;
  v112[1] = sub_6C4C(&qword_35F70);
  uint64_t v22 = v111;
  v111[0] = &protocol witness table for Text;
  v111[1] = sub_27960();
  sub_18D78((uint64_t)v23, 2uLL, (uint64_t)v21, v57);
  sub_279F0((uint64_t)v24);
  sub_198D0((uint64_t)v25);
  sub_279F0((uint64_t)v26);
  return sub_198D0((uint64_t)v27);
}

uint64_t sub_2697C@<X0>(uint64_t a1@<X8>)
{
  return sub_253BC(a1);
}

uint64_t sub_26994@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v13 = 0;
  uint64_t v25 = sub_27C40();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v25 - 8;
  unint64_t v11 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v24 = (unint64_t *)((char *)&v11 - v11);
  uint64_t v21 = type metadata accessor for RequirementRow();
  unint64_t v12 = (*(void *)(*(void *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v21);
  uint64_t v1 = (char *)&v11 - v12;
  uint64_t v26 = (uint64_t)&v11 - v12;
  uint64_t v28 = sub_6C4C(&qword_35E10);
  unint64_t v14 = (*(void *)(*(void *)(v28 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v13);
  uint64_t v30 = (uint64_t)&v11 - v14;
  unint64_t v15 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v31 = (uint64_t)&v11 - v15;
  uint64_t v34 = (char *)&v11 - v15;
  uint64_t v4 = type metadata accessor for Requirement();
  unint64_t v16 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v20 = (uint64_t)&v11 - v16;
  unint64_t v17 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v11 - v16);
  uint64_t v32 = (uint64_t)&v11 - v17;
  uint64_t v33 = (char *)&v11 - v17;
  uint64_t v18 = sub_28170("failed description", 0x12uLL, 1);
  uint64_t v19 = v6;
  char v7 = sub_15588();
  sub_15590(0, v18, v19, v7, v32);
  sub_8D4C(v32, v20);
  sub_18FE8(v20, (uint64_t)v1);
  uint64_t v8 = v22;
  uint64_t v9 = v24;
  *uint64_t v24 = 0x4072C00000000000;
  v9[1] = 0x4051800000000000;
  (*(void (**)(void))(v8 + 104))();
  sub_2372C();
  sub_27EA0();
  (*(void (**)(void *, uint64_t))(v22 + 8))(v24, v25);
  sub_8E38(v26);
  unint64_t v29 = sub_26D00();
  sub_18AFC(v30, v28, v31);
  sub_26E28(v30);
  sub_26F00(v31, v30);
  sub_18AFC(v30, v28, v27);
  sub_26E28(v30);
  sub_26E28(v31);
  return sub_8E38(v32);
}

unint64_t sub_26D00()
{
  uint64_t v2 = qword_35E18;
  if (!qword_35E18)
  {
    sub_700C(&qword_35E10);
    sub_2372C();
    sub_26DA4();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35E18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_26DA4()
{
  uint64_t v2 = qword_35E20;
  if (!qword_35E20)
  {
    sub_700C(&qword_35E28);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35E20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_26E28(uint64_t a1)
{
  uint64_t v1 = sub_27B60();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for Requirement();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(int *)(sub_6C4C(&qword_35E10) + 36);
  uint64_t v2 = sub_27C40();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4);
  return a1;
}

uint64_t sub_26F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_27B60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v8 = (int *)type metadata accessor for Requirement();
  *(unsigned char *)(a2 + v8[5]) = *(unsigned char *)(a1 + v8[5]);
  uint64_t v3 = (void *)(a1 + v8[6]);
  uint64_t v6 = (void *)(a2 + v8[6]);
  *uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  *(unsigned char *)(a2 + v8[7]) = *(unsigned char *)(a1 + v8[7]);
  uint64_t v9 = *(int *)(sub_6C4C(&qword_35E10) + 36);
  uint64_t v4 = sub_27C40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2 + v9, a1 + v9);
  return a2;
}

uint64_t sub_2705C@<X0>(uint64_t a1@<X8>)
{
  return sub_26994(a1);
}

uint64_t sub_27074()
{
  return sub_27CD0();
}

unint64_t sub_270AC()
{
  uint64_t v2 = qword_35E30;
  if (!qword_35E30)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35E30);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2712C()
{
  return sub_27CC0();
}

uint64_t sub_27164()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_27198()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_271CC()
{
  return sub_271E4();
}

unint64_t sub_271E4()
{
  uint64_t v2 = qword_35E38;
  if (!qword_35E38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35E38);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_27264()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_27298()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_272C0(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
}

uint64_t sub_27320()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_27348(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 56))(a1, a2);
}

uint64_t type metadata accessor for StateGlyph()
{
  uint64_t v1 = qword_36BF0;
  if (!qword_36BF0) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_27424()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2744C(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
}

uint64_t sub_274AC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_274D4(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for Requirement();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 56))(a1, a2);
}

void *type metadata accessor for RequirementRow_Previews()
{
  return &unk_318E0;
}

unint64_t sub_2754C()
{
  return sub_24F50();
}

unint64_t sub_27564()
{
  return sub_25C94();
}

unint64_t sub_2757C()
{
  return sub_26D00();
}

unint64_t sub_27594()
{
  uint64_t v2 = qword_35F40;
  if (!qword_35F40)
  {
    type metadata accessor for StateGlyph();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35F40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_27618@<X0>(uint64_t a1@<X8>)
{
  return sub_25FA8(*(void *)(v1 + 16), a1);
}

unint64_t sub_27620()
{
  uint64_t v2 = qword_35F50;
  if (!qword_35F50)
  {
    sub_700C(&qword_35F48);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35F50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_276A4()
{
  uint64_t v2 = qword_35F58;
  if (!qword_35F58)
  {
    sub_700C(&qword_35E08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35F58);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_27728@<X0>(uint64_t a1@<X8>)
{
  return sub_26298(*(void *)(v1 + 16), a1);
}

unint64_t sub_27730()
{
  uint64_t v2 = qword_35F68;
  if (!qword_35F68)
  {
    sub_700C(&qword_35F60);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35F68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_277B4(uint64_t a1)
{
  if (*(void *)(a1 + 80))
  {
    sub_1815C(*(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72) & 1);
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_2783C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_19918(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_278A0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = *(void *)a1;
    uint64_t v4 = *(void *)(a1 + 8);
    char v5 = *(unsigned char *)(a1 + 16);
    sub_19918(*(void *)a1, v4, v5 & 1);
    *(void *)a2 = v3;
    *(void *)(a2 + 8) = v4;
    *(unsigned char *)(a2 + 16) = v5 & 1;
    uint64_t v6 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    *(void *)(a2 + 24) = v6;
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

unint64_t sub_27960()
{
  uint64_t v2 = qword_35F78;
  if (!qword_35F78)
  {
    sub_700C(&qword_35F70);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_35F78);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_279F0(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_1815C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16) & 1);
    swift_bridgeObjectRelease();
  }
  return a1;
}

Class sub_27A50()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_27A60()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_27A70()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_27A80()
{
  return Notification.object.getter();
}

NSURLComponents sub_27A90()
{
  return URLComponents._bridgeToObjectiveC()();
}

uint64_t sub_27AA0()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_27AB0()
{
  return URLComponents.host.getter();
}

uint64_t sub_27AC0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_27AD0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_27AE0()
{
  return _convertNSErrorToError(_:)();
}

void sub_27AF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_27B00()
{
  return URL.scheme.getter();
}

uint64_t sub_27B10()
{
  return URL.init(string:)();
}

uint64_t sub_27B20()
{
  return type metadata accessor for URL();
}

uint64_t sub_27B30()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_27B40()
{
  return Data.count.getter();
}

uint64_t sub_27B50()
{
  return UUID.init()();
}

uint64_t sub_27B60()
{
  return type metadata accessor for UUID();
}

uint64_t sub_27B70()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_27B80()
{
  return Published.init(initialValue:)();
}

uint64_t sub_27B90()
{
  return Published.projectedValue.getter();
}

uint64_t sub_27BA0()
{
  return Published.projectedValue.setter();
}

uint64_t sub_27BB0()
{
  return static Published.subscript.modify();
}

uint64_t sub_27BC0()
{
  return static Published.subscript.getter();
}

uint64_t sub_27BD0()
{
  return static Published.subscript.setter();
}

uint64_t sub_27BE0()
{
  return type metadata accessor for Published();
}

uint64_t sub_27BF0()
{
  return StateObject.init(wrappedValue:)();
}

uint64_t sub_27C00()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_27C10()
{
  return static SubmitLabel.go.getter();
}

uint64_t sub_27C20()
{
  return type metadata accessor for SubmitLabel();
}

uint64_t sub_27C30()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_27C40()
{
  return type metadata accessor for PreviewLayout();
}

uint64_t sub_27C50()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_27C60()
{
  return NavigationLink.init(destination:isActive:label:)();
}

uint64_t sub_27C70()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_27C80()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_27C90()
{
  return static SubmitTriggers.text.getter();
}

uint64_t sub_27CA0()
{
  return type metadata accessor for SubmitTriggers();
}

uint64_t sub_27CB0()
{
  return static PreviewProvider.platform.getter();
}

uint64_t sub_27CC0()
{
  return static PreviewProvider._platform.getter();
}

uint64_t sub_27CD0()
{
  return static PreviewProvider._previews.getter();
}

uint64_t sub_27CE0()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_27CF0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_27D00()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_27D10()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_27D20()
{
  return UIHostingController.__allocating_init(rootView:)();
}

uint64_t sub_27D30()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_27D40()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_27D50()
{
  return static InterfaceOrientation.portrait.getter();
}

uint64_t sub_27D60()
{
  return type metadata accessor for InterfaceOrientation();
}

uint64_t sub_27D70()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_27D80()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_27D90()
{
  return static Font.subheadline.getter();
}

uint64_t sub_27DA0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_27DB0()
{
  return Font.leading(_:)();
}

uint64_t sub_27DC0()
{
  return static Font.footnote.getter();
}

uint64_t sub_27DD0()
{
  return static Font.headline.getter();
}

uint64_t sub_27DE0()
{
  return Form.init(content:)();
}

uint64_t sub_27DF0()
{
  return Link.init(destination:label:)();
}

uint64_t sub_27E00()
{
  return List<>.init(content:)();
}

uint64_t sub_27E10()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_27E20()
{
  return Text.font(_:)();
}

uint64_t sub_27E30()
{
  return Text.init(verbatim:)();
}

uint64_t sub_27E40()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_27E50()
{
  return Text.init<A>(_:)();
}

uint64_t sub_27E60()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_27E70()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_27E80()
{
  return View.submitLabel(_:)();
}

uint64_t sub_27E90()
{
  return View.keyboardType(_:)();
}

uint64_t sub_27EA0()
{
  return View.previewLayout(_:)();
}

uint64_t sub_27EB0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_27EC0()
{
  return View.foregroundColor(_:)();
}

uint64_t sub_27ED0()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_27EE0()
{
  return View.autocapitalization(_:)();
}

uint64_t sub_27EF0()
{
  return View.disableAutocorrection(_:)();
}

uint64_t sub_27F00()
{
  return View.previewInterfaceOrientation(_:)();
}

uint64_t sub_27F10()
{
  return View.hidden()();
}

uint64_t sub_27F20()
{
  return View.padding(_:_:)();
}

uint64_t sub_27F30()
{
  return View.onChange<A>(of:perform:)();
}

uint64_t sub_27F40()
{
  return View.onSubmit(of:_:)();
}

uint64_t sub_27F50()
{
  return View.onReceive<A>(_:perform:)();
}

uint64_t sub_27F60()
{
  return Color.init(uiColor:)();
}

uint64_t sub_27F70()
{
  return static Color.green.getter();
}

uint64_t sub_27F80()
{
  return static Color.orange.getter();
}

uint64_t sub_27F90()
{
  return static Color.yellow.getter();
}

uint64_t sub_27FA0()
{
  return static Color.secondary.getter();
}

uint64_t sub_27FB0()
{
  return Group<A>.init(content:)();
}

uint64_t sub_27FC0()
{
  return Image.init(systemName:)();
}

uint64_t sub_27FD0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_27FE0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_27FF0()
{
  return State.wrappedValue.setter();
}

uint64_t sub_28000()
{
  return State.projectedValue.getter();
}

uint64_t sub_28010()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_28020()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_28030()
{
  return ZStack.init(alignment:content:)();
}

uint64_t sub_28040()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_28050()
{
  return type metadata accessor for ForEach();
}

uint64_t sub_28060()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_28070()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_28080()
{
  return Section<>.init(content:)();
}

uint64_t sub_28090()
{
  return static Alignment.center.getter();
}

uint64_t sub_280A0()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_280B0()
{
  return TupleView.init(_:)();
}

uint64_t sub_280C0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_280D0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_280E0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_280F0()
{
  return Array.init()();
}

Swift::Int sub_28100(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

uint64_t sub_28110()
{
  return BidirectionalCollection.last.getter();
}

uint64_t sub_28120()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_28130()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_28140()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_28150()
{
  return String.init(format:_:)();
}

uint64_t sub_28160()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_28170(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_28180()
{
  return static String.== infix(_:_:)();
}

uint64_t sub_28190()
{
  return String.isEmpty.getter();
}

uint64_t sub_281A0()
{
  return String.init(_:)();
}

uint64_t sub_281B0()
{
  return Sequence.allSatisfy(_:)();
}

uint64_t sub_281C0()
{
  return Sequence.first(where:)();
}

uint64_t sub_281D0()
{
  return Sequence.contains(where:)();
}

uint64_t sub_281E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_281F0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_28200()
{
  return Array.count.getter();
}

uint64_t sub_28210()
{
  return Array.append(_:)();
}

void sub_28220(Swift::Bool keepingCapacity)
{
}

uint64_t sub_28230()
{
  return type metadata accessor for Array();
}

uint64_t sub_28240()
{
  return Array.subscript.modify();
}

uint64_t sub_28250()
{
  return Array.subscript.getter();
}

uint64_t sub_28260()
{
  return Collection.firstIndex(where:)();
}

uint64_t sub_28270()
{
  return Collection.first.getter();
}

uint64_t sub_28280()
{
  return Collection<>.makeIterator()();
}

uint64_t sub_28290()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_282A0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_282B0()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_282C0()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_282D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_282E0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_282F0()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t sub_28300()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

uint64_t sub_28310()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_28320()
{
  return _hashValue<A>(for:)();
}

uint64_t sub_28330()
{
  return IndexingIterator.next()();
}

uint64_t sub_28340()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_28350()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_28360()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_28370()
{
  return Hasher.combine<A>(_:)();
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return _CGImageCreateCopy(image);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t SFKillProcessNamed()
{
  return _SFKillProcessNamed();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CPSLocalizedString()
{
  return __CPSLocalizedString();
}

uint64_t _SFApplicationNameForUserAgent()
{
  return __SFApplicationNameForUserAgent();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocBox()
{
  return _swift_deallocBox();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return _swift_getEnumTagSinglePayloadGeneric();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return _swift_storeEnumTagSinglePayloadGeneric();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend__loadOverrideSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _loadOverrideSpecifiers];
}

id objc_msgSend__setUpCardPreview(void *a1, const char *a2, ...)
{
  return _[a1 _setUpCardPreview];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
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

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allOverrides(void *a1, const char *a2, ...)
{
  return _[a1 allOverrides];
}

id objc_msgSend_appClipsDeveloperDiagnosticsViewController(void *a1, const char *a2, ...)
{
  return _[a1 appClipsDeveloperDiagnosticsViewController];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cachedCellForSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCellForSpecifierID:");
}

id objc_msgSend_canLoadObjectOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLoadObjectOfClass:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clipBundleID(void *a1, const char *a2, ...)
{
  return _[a1 clipBundleID];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cps_imageWithNormalizedOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cps_imageWithNormalizedOrientation");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heroImage(void *a1, const char *a2, ...)
{
  return _[a1 heroImage];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imagesFilter(void *a1, const char *a2, ...)
{
  return _[a1 imagesFilter];
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCGImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_insertSpecifier_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:");
}

id objc_msgSend_invocationURL(void *a1, const char *a2, ...)
{
  return _[a1 invocationURL];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _[a1 isComplete];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_itemProvider(void *a1, const char *a2, ...)
{
  return _[a1 itemProvider];
}

id objc_msgSend_loadObjectOfClass_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadObjectOfClass:completionHandler:");
}

id objc_msgSend_loadSpecifiersFromPlistName_target_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:bundle:");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _[a1 save];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setClipBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipBundleID:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissHandler:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setHeroImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeroImage:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInvocationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvocationURL:");
}

id objc_msgSend_setKeyboardDismissMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardDismissMode:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModelValue_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelValue:forSpecifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setValue_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forSpecifier:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierForOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForOverride:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_universalLinksDeveloperDiagnosticsViewController(void *a1, const char *a2, ...)
{
  return _[a1 universalLinksDeveloperDiagnosticsViewController];
}

id objc_msgSend_updateHeroImageSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 updateHeroImageSpecifier];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}