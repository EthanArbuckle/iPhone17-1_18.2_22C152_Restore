uint64_t type metadata accessor for MedicationScanMultiResultsViewController()
{
  uint64_t result;

  result = qword_268264F38;
  if (!qword_268264F38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2287C29B4()
{
  uint64_t result = sub_2287FA308();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_2287C2A7C()
{
  return sub_2287C2D24(&qword_268264F20, (uint64_t (*)(uint64_t))sub_2287C2A9C);
}

void *sub_2287C2A9C(uint64_t a1)
{
  uint64_t v2 = sub_2287FB188();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2287FB1B8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v17 - v11;
  sub_2287FB1A8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F82200], v2);
  sub_2287FB148();
  v13 = (void *)sub_2287FAD38();
  id v14 = objc_msgSend(self, sel_systemImageNamed_, v13);

  sub_2287FB198();
  sub_2287C5C80(0, &qword_268265028);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v15 = (void *)sub_2287FB1C8();
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_addTarget_action_forControlEvents_, a1, sel_tapToRadarButtonTappedWithSender_, 64);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return v15;
}

id sub_2287C2D04()
{
  return sub_2287C2D24(&qword_268264F28, (uint64_t (*)(uint64_t))sub_2287C2D88);
}

id sub_2287C2D24(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    uint64_t v6 = (void *)a2(v2);
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_2287C2D88(void *a1)
{
  sub_2287C5B68();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2287FB188();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2287FB1B8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(self, sel_buttonWithType_, 1);
  objc_msgSend(v13, sel_addTarget_action_forControlEvents_, a1, sel_onClose, 64);
  sub_2287FB168();
  uint64_t v14 = *MEMORY[0x263F821F0];
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  uint64_t v20 = v5;
  v15(v8, v14, v5);
  sub_2287FB148();
  id v16 = objc_msgSend(a1, sel_traitCollection);
  id v17 = objc_msgSend(v16, sel_preferredContentSizeCategory);

  LOBYTE(v16) = sub_2287FB058();
  if (v16)
  {
    v15(v8, *MEMORY[0x263F82200], v20);
    sub_2287FB148();
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v4, 0, 1, v9);
  sub_2287FB1E8();
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v13;
}

id sub_2287C3088()
{
  uint64_t v1 = qword_268264F30;
  uint64_t v2 = *(void **)(v0 + qword_268264F30);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_268264F30);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_effectWithStyle_, 3);
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v4);

    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

char *sub_2287C314C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v37 = sub_2287FA6E8();
  uint64_t v7 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2287FA308();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[qword_2682659E0 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[qword_268264F20] = 0;
  *(void *)&v3[qword_268264F28] = 0;
  *(void *)&v3[qword_268264F30] = 0;
  *(void *)&v3[qword_268264F08] = a1;
  *(void *)&v3[qword_268264F10] = a2;
  uint64_t v35 = v11;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(&v3[qword_2682659D8], a3, v10);
  uint64_t v36 = a3;
  v14(v13, a3, v10);
  id v15 = objc_allocWithZone((Class)type metadata accessor for ScanResultSelectionViewController());
  id v16 = a1;
  id v17 = a2;
  v18 = v3;
  id v34 = v16;
  uint64_t v19 = (void *)sub_2287D2484(v16, v17, (uint64_t)v13);
  *(void *)&v18[qword_268264F18] = v19;
  id v20 = v19;

  uint64_t v21 = qword_268264EF8;
  id v22 = v20;
  if (v21 != -1) {
    swift_once();
  }
  sub_2287FA208();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F44828], v37);
  v23 = (char *)sub_2287FA6D8();
  v24 = *(void **)&v23[qword_268264F18];
  v25 = v23;
  id v26 = v24;
  sub_2287FA638();

  v27 = (void *)sub_2287FA4E8();
  swift_release();
  objc_msgSend(v27, sel_registerObserver_, v25);

  objc_msgSend(v25, sel_setModalTransitionStyle_, 2);
  objc_msgSend(v25, sel_setModalPresentationStyle_, 5);
  uint64_t result = (char *)objc_msgSend(v25, sel_view);
  if (result)
  {
    v29 = result;
    v30 = self;
    id v31 = objc_msgSend(v30, sel_clearColor);
    objc_msgSend(v29, sel_setBackgroundColor_, v31);

    id v32 = objc_msgSend(v25, sel_contentView);
    id v33 = objc_msgSend(v30, sel_clearColor);
    objc_msgSend(v32, sel_setBackgroundColor_, v33);

    objc_msgSend(v25, sel_setOverrideUserInterfaceStyle_, 2);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v10);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2287C35CC()
{
  return 2;
}

id sub_2287C35D4()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for MedicationScanMultiResultsViewController();
  objc_msgSendSuper2(&v14, sel_viewDidLoad);
  swift_unknownObjectWeakAssign();
  id result = objc_msgSend(v0, sel_view);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = sub_2287C3088();
    objc_msgSend(v2, sel_insertSubview_atIndex_, v3, 0);

    id v4 = sub_2287C3088();
    id result = objc_msgSend(v0, sel_view);
    if (result)
    {
      id v5 = result;
      objc_msgSend(result, sel_bounds);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      objc_msgSend(v4, sel_setFrame_, v7, v9, v11, v13);
      sub_2287C3E58();
      return (id)sub_2287C4408();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2287C3710(void *a1)
{
  id v1 = a1;
  sub_2287C35D4();
}

uint64_t sub_2287C3758(char *a1)
{
  sub_2287C5938();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA8E8();
  double v7 = *(void **)&a1[qword_268264F18];
  type metadata accessor for ScanResultSelectionViewController();
  sub_2287C5268(&qword_268265000, (void (*)(uint64_t))type metadata accessor for ScanResultSelectionViewController);
  double v8 = a1;
  id v9 = v7;
  sub_2287FA6C8();

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_2287C38C0(void *a1)
{
  id v1 = a1;
  sub_2287C3BCC((void (*)(void))sub_2287CDE90, "[%{public}s] Primary button pressed without a delegate");
}

uint64_t sub_2287C3928()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_2287FA7A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x22A69EDE0](&v1[qword_2682659E0]))
  {
    sub_2287CDB64(v1);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_2287FA788();
    double v7 = sub_2287FA798();
    os_log_type_t v8 = sub_2287FAF78();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v14 = v10;
      *(_DWORD *)id v9 = 136446210;
      uint64_t v11 = sub_2287FB698();
      uint64_t v13 = sub_2287F6838(v11, v12, &v14);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2287C0000, v7, v8, "[%{public}s] Secondary button pressed without a delegate", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v10, -1, -1);
      MEMORY[0x22A69ED10](v9, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_2287C3B64(void *a1)
{
  id v1 = a1;
  sub_2287C3928();
}

uint64_t sub_2287C3BAC()
{
  return sub_2287C3BCC((void (*)(void))sub_2287CDE98, "[%{public}s] Secondary button pressed without a delegate");
}

uint64_t sub_2287C3BCC(void (*a1)(void), const char *a2)
{
  uint64_t v5 = v2;
  swift_getObjectType();
  uint64_t v6 = sub_2287FA7A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x22A69EDE0](v5 + qword_2682659E0))
  {
    a1();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_2287FA788();
    uint64_t v11 = sub_2287FA798();
    os_log_type_t v12 = sub_2287FAF78();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v19 = a2;
      uint64_t v15 = v14;
      uint64_t v21 = v14;
      *(_DWORD *)uint64_t v13 = 136446210;
      uint64_t v16 = sub_2287FB698();
      uint64_t v20 = sub_2287F6838(v16, v17, &v21);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2287C0000, v11, v12, v19, v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v15, -1, -1);
      MEMORY[0x22A69ED10](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_2287C3E10(void *a1)
{
  id v1 = a1;
  sub_2287C3BAC();
}

void sub_2287C3E58()
{
  id v1 = v0;
  uint64_t v2 = sub_2287FA538();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v0, sel_view);
  if (!v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  id v8 = sub_2287C2D04();
  objc_msgSend(v7, sel_addSubview_, v8);

  sub_2287C5DB0(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v55 = v9;
  uint64_t v10 = swift_allocObject();
  long long v54 = xmmword_2287FC080;
  *(_OWORD *)(v10 + 16) = xmmword_2287FC080;
  id v11 = sub_2287C2D04();
  id v12 = objc_msgSend(v11, sel_topAnchor);

  id v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v14 = v13;
  id v15 = objc_msgSend(v13, sel_safeAreaLayoutGuide);

  id v16 = objc_msgSend(v15, sel_topAnchor);
  id v17 = objc_msgSend(v1, sel_view);
  if (!v17)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v18 = v17;
  uint64_t v56 = v2;
  objc_msgSend(v17, sel_layoutMargins);
  double v20 = v19;

  id v21 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v16, v20);
  *(void *)(v10 + 32) = v21;
  id v22 = sub_2287C2D04();
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v25 = v24;
  id v26 = objc_msgSend(v24, sel_safeAreaLayoutGuide);

  id v27 = objc_msgSend(v26, sel_trailingAnchor);
  id v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v29 = v28;
  v30 = self;
  objc_msgSend(v29, sel_layoutMargins);
  double v32 = v31;

  id v33 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v27, -v32);
  *(void *)(v10 + 40) = v33;
  uint64_t v57 = v10;
  sub_2287FAE68();
  sub_2287C5C80(0, &qword_268265020);
  id v34 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v34);

  sub_2287FA528();
  char v35 = sub_2287FA518();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v56);
  if ((v35 & 1) == 0) {
    return;
  }
  id v36 = objc_msgSend(v1, sel_view);
  if (!v36) {
    goto LABEL_17;
  }
  uint64_t v37 = v36;
  id v38 = sub_2287C2A7C();
  objc_msgSend(v37, sel_addSubview_, v38);

  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v54;
  id v40 = sub_2287C2A7C();
  id v41 = objc_msgSend(v40, sel_topAnchor);

  id v42 = objc_msgSend(v1, sel_view);
  if (!v42)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v43 = v42;
  id v44 = objc_msgSend(v42, sel_safeAreaLayoutGuide);

  id v45 = objc_msgSend(v44, sel_topAnchor);
  id v46 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v45, 16.0);

  *(void *)(v39 + 32) = v46;
  id v47 = sub_2287C2A7C();
  id v48 = objc_msgSend(v47, sel_leadingAnchor);

  id v49 = objc_msgSend(v1, sel_view);
  if (!v49)
  {
LABEL_19:
    __break(1u);
    return;
  }
  v50 = v49;
  id v51 = objc_msgSend(v49, sel_leadingAnchor);

  id v52 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v51, 16.0);
  *(void *)(v39 + 40) = v52;
  uint64_t v57 = v39;
  sub_2287FAE68();
  v53 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v53);
}

uint64_t sub_2287C4408()
{
  sub_2287C5B68();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)v36 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v36 - v8;
  sub_2287FA628();
  if (qword_268264EF8 != -1) {
    swift_once();
  }
  v36[2] = "PBS_MULTI_RESULT_SECTION_HEADER";
  sub_2287FA208();
  uint64_t v10 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  v36[1] = *MEMORY[0x263F46388];
  uint64_t v40 = sub_2287FAD68();
  uint64_t v41 = v11;
  swift_bridgeObjectRetain();
  v36[0] = "SEARCH_BY_NAME_BUTTON_TITLE";
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  id v12 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  id v38 = v0;
  id v13 = objc_msgSend(v0, sel_hxui_addPrimaryFooterButtonWithTitle_accessibilityIdentifier_, v10, v12);

  id v14 = v13;
  sub_2287FB1D8();

  uint64_t v15 = sub_2287FB1B8();
  id v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  if (!v16(v9, 1, v15))
  {
    id v17 = objc_msgSend(self, sel_tintColor);
    sub_2287FB178();
  }
  unsigned int v18 = v16(v9, 1, v15);
  uint64_t v37 = v4;
  if (!v18)
  {
    id v19 = objc_msgSend(self, sel_whiteColor);
    double v20 = (void (*)(uint64_t *, void))sub_2287FB138();
    sub_2287FA828();
    v20(&v40, 0);
  }
  id v39 = objc_msgSend(self, sel_configurationWithScale_, 1);
  if (!v16(v9, 1, v15))
  {
    id v21 = v39;
    id v22 = (void *)sub_2287FAD38();
    id v23 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v22, v21);

    sub_2287FB198();
  }
  if (!v16(v9, 1, v15)) {
    sub_2287FB158();
  }
  sub_2287C5BC0((uint64_t)v9, (uint64_t)v7);
  id v24 = v14;
  sub_2287FB1E8();

  sub_2287FA208();
  v25 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_2287FAD68();
  uint64_t v41 = v26;
  swift_bridgeObjectRetain();
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  id v27 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  id v28 = v38;
  id v29 = objc_msgSend(v38, sel_hxui_addSecondaryFooterButtonWithTitle_bold_accessibilityIdentifier_, v25, 0, v27);

  id v30 = v29;
  uint64_t v31 = (uint64_t)v37;
  sub_2287FB1D8();

  if (!v16((char *)v31, 1, v15))
  {
    id v32 = objc_msgSend(self, sel_whiteColor);
    sub_2287FB178();
  }
  sub_2287C5BC0(v31, (uint64_t)v7);
  id v33 = v30;
  sub_2287FB1E8();

  id v34 = objc_msgSend(v28, sel_buttonTray);
  objc_msgSend(v34, sel_setHidden_, 0);

  objc_msgSend(v28, sel_setOverrideUserInterfaceStyle_, 2);
  sub_2287C5C24(v31);
  return sub_2287C5C24((uint64_t)v9);
}

uint64_t *sub_2287C4A4C()
{
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_retain();
  sub_2287E09B8((uint64_t)v2);
  swift_release();
  sub_2287C59C8((uint64_t)v2, (uint64_t)v4);
  sub_2287C59C8((uint64_t)v4, (uint64_t)v5);
  if (sub_2287C5A50((uint64_t *)v5) == 1) {
    return (uint64_t *)_s25HealthMedicationsVisionUI0C10TapToRadarC19medicationsTracking14viewControllerySo06UIViewK0C_tFZ_0(v0);
  }
  v2[8] = v5[8];
  v2[9] = v5[9];
  uint64_t v3 = v6;
  v2[4] = v5[4];
  v2[5] = v5[5];
  v2[6] = v5[6];
  v2[7] = v5[7];
  v2[0] = v5[0];
  v2[1] = v5[1];
  v2[2] = v5[2];
  v2[3] = v5[3];
  _s25HealthMedicationsVisionUI0C10TapToRadarC8scanning0H7Session14viewControlleryAA08ScanningI0V_So06UIViewK0CtFZ_0((uint64_t)v2, v0);
  return sub_2287C5A68(v4);
}

uint64_t sub_2287C4B60(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_2287FB278();
  swift_unknownObjectRelease();
  sub_2287C4A4C();

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v4);
}

void sub_2287C4BC0()
{
}

void sub_2287C4BF0()
{
  uint64_t v1 = v0 + qword_2682659D8;
  uint64_t v2 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_2287C59A0(v0 + qword_2682659E0);
  uint64_t v3 = *(void **)(v0 + qword_268264F30);
}

id sub_2287C4CCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationScanMultiResultsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2287C4D04(uint64_t a1)
{
  uint64_t v2 = a1 + qword_2682659D8;
  uint64_t v3 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  sub_2287C59A0(a1 + qword_2682659E0);
  uint64_t v4 = *(void **)(a1 + qword_268264F30);
}

uint64_t sub_2287C4DE4()
{
  return type metadata accessor for MedicationScanMultiResultsViewController();
}

void type metadata accessor for HKConceptAttributeType(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for ScanResultGroupItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2287C4E58(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2287C4E78(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for HKMedicationListOnboardingAlgorithmType(uint64_t a1)
{
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for HKMedicationListOnboardingAnalyticsStepType(uint64_t a1)
{
}

void type metadata accessor for VNBarcodeSymbology(uint64_t a1)
{
}

uint64_t sub_2287C4F94(uint64_t a1, uint64_t a2)
{
  return sub_2287C5558(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2287C4FC0(uint64_t a1, id *a2)
{
  uint64_t result = sub_2287FAD48();
  *a2 = 0;
  return result;
}

uint64_t sub_2287C5038(uint64_t a1, id *a2)
{
  char v3 = sub_2287FAD58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2287C50B8@<X0>(uint64_t *a1@<X8>)
{
  sub_2287FAD68();
  uint64_t v2 = sub_2287FAD38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2287C50FC(uint64_t a1, uint64_t a2)
{
  return sub_2287C5558(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2287C511C(uint64_t a1)
{
  uint64_t v2 = sub_2287C5268(&qword_268264FE8, type metadata accessor for VNBarcodeSymbology);
  uint64_t v3 = sub_2287C5268(&qword_268264FF0, type metadata accessor for VNBarcodeSymbology);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2287C51D8()
{
  return sub_2287C5268(&qword_268264F80, type metadata accessor for VNBarcodeSymbology);
}

uint64_t sub_2287C5220()
{
  return sub_2287C5268(&qword_268264F88, type metadata accessor for VNBarcodeSymbology);
}

uint64_t sub_2287C5268(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2287C52B0(uint64_t a1)
{
  uint64_t v2 = sub_2287C5268((unint64_t *)&qword_268265068, type metadata accessor for Key);
  uint64_t v3 = sub_2287C5268(&qword_268265070, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2287C536C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2287FAD68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2287C5398(uint64_t a1)
{
  uint64_t v2 = sub_2287C5268(&qword_268264FD8, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_2287C5268(&qword_268264FE0, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2287C5454@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2287FAD38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2287C549C(uint64_t a1)
{
  uint64_t v2 = sub_2287C5268(&qword_268264FC8, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_2287C5268(&qword_268264FD0, type metadata accessor for FileProtectionType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2287C5558(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2287FAD68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2287C559C()
{
  sub_2287FAD68();
  sub_2287FADE8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287C55F0()
{
  sub_2287FAD68();
  sub_2287FB618();
  sub_2287FADE8();
  uint64_t v0 = sub_2287FB648();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2287C5664()
{
  return sub_2287C5268(&qword_268264F90, type metadata accessor for VNBarcodeSymbology);
}

uint64_t sub_2287C56AC()
{
  return sub_2287C5268(&qword_268264F98, type metadata accessor for FileAttributeKey);
}

uint64_t sub_2287C56F4()
{
  return sub_2287C5268(&qword_268264FA0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_2287C573C()
{
  return sub_2287C5268(&qword_268264FA8, type metadata accessor for FileProtectionType);
}

uint64_t sub_2287C5784()
{
  return sub_2287C5268(&qword_268264FB0, type metadata accessor for FileProtectionType);
}

uint64_t sub_2287C57CC()
{
  uint64_t v0 = sub_2287FAD68();
  uint64_t v2 = v1;
  if (v0 == sub_2287FAD68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2287FB5B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2287C5858()
{
  return sub_2287C5268(&qword_268264FB8, type metadata accessor for FileProtectionType);
}

uint64_t sub_2287C58A0()
{
  return sub_2287C5268(&qword_268264FC0, type metadata accessor for FileAttributeKey);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_2287C5938()
{
  if (!qword_268264FF8)
  {
    unint64_t v0 = sub_2287FA8F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268264FF8);
    }
  }
}

uint64_t sub_2287C59A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2287C59C8(uint64_t a1, uint64_t a2)
{
  sub_2287C5DB0(0, &qword_268265008, (uint64_t)&type metadata for ScanningSession, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C5A50(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t *sub_2287C5A68(uint64_t *a1)
{
  return a1;
}

uint64_t sub_2287C5ACC(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2287C5B68()
{
  if (!qword_268265010)
  {
    sub_2287FB1B8();
    unint64_t v0 = sub_2287FB238();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265010);
    }
  }
}

uint64_t sub_2287C5BC0(uint64_t a1, uint64_t a2)
{
  sub_2287C5B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C5C24(uint64_t a1)
{
  sub_2287C5B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287C5C80(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for CGPath(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2287C5D18(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2287C5D38(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_2287C5DB0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2287C5DFC()
{
  return sub_2287C5268(&qword_268265050, type metadata accessor for Key);
}

uint64_t sub_2287C5E44()
{
  return sub_2287C5268(&qword_268265058, type metadata accessor for Key);
}

uint64_t sub_2287C5E8C()
{
  return sub_2287C5268(&qword_268265060, type metadata accessor for Key);
}

uint64_t sub_2287C5EE4()
{
  sub_2287C5C80(0, &qword_268265290);
  uint64_t result = sub_2287FB228();
  qword_268265078 = result;
  return result;
}

id PillBottleScanningLog.getter()
{
  if (qword_268264EF0 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_268265078;
  return v0;
}

uint64_t sub_2287C5FA8()
{
  uint64_t v1 = v0 + qword_268265080;
  swift_beginAccess();
  return MEMORY[0x22A69EDE0](v1);
}

uint64_t sub_2287C5FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_268265080;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_2287C6064(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_268265080;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x22A69EDE0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_2287C60EC;
}

void sub_2287C60EC(uint64_t a1, char a2)
{
  char v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_2287C6174()
{
  uint64_t v0 = sub_2287FAC48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v26 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v3 = (uint64_t (*)(uint64_t))MEMORY[0x263F1F2F8];
  sub_2287CFFE4(0, &qword_268265088, MEMORY[0x263F1F2F8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - v5;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_2287CFFE4(0, &qword_268265090, MEMORY[0x263F1F2D0], MEMORY[0x263F8E0F8]);
  sub_2287FAC08();
  uint64_t v8 = swift_allocObject();
  long long v25 = xmmword_2287FC830;
  *(_OWORD *)(v8 + 16) = xmmword_2287FC830;
  sub_2287CF968(0, &qword_268265098, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2287FC840;
  *(void *)(v9 + 32) = 28261;
  *(void *)(v9 + 40) = 0xE200000000000000;
  uint64_t v10 = sub_2287FAC78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_2287FABE8();
  swift_bridgeObjectRelease();
  sub_2287CF518((uint64_t)v6, &qword_268265088, v3);
  sub_2287CFFE4(0, &qword_2682650A0, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, v7);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v25;
  id v12 = (void *)*MEMORY[0x263F1F0A8];
  id v13 = (void *)*MEMORY[0x263F1F0B0];
  *(void *)(v11 + 32) = *MEMORY[0x263F1F0A8];
  *(void *)(v11 + 40) = v13;
  id v14 = v12;
  id v15 = v13;
  sub_2287FABF8();
  swift_bridgeObjectRelease();
  if (*(void *)(v8 + 16)) {
    sub_2287CDFB8(v8);
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v26, *MEMORY[0x263F1F2E8], v0);
  id v16 = self;
  if (objc_msgSend(v16, sel_isAppleInternalInstall))
  {
    id v17 = objc_msgSend(self, sel_standardUserDefaults);
    sub_2287FADC8();
    unsigned int v18 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_BOOLForKey_, v18);
  }
  if (objc_msgSend(v16, sel_isAppleInternalInstall))
  {
    id v19 = objc_msgSend(self, sel_standardUserDefaults);
    sub_2287FADC8();
    double v20 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_BOOLForKey_, v20);
  }
  id v21 = objc_allocWithZone((Class)sub_2287FACE8());
  uint64_t v22 = sub_2287FAC18();
  sub_2287D050C(&qword_2682650A8, (void (*)(uint64_t))type metadata accessor for MedicationDataScannerViewController);
  swift_unknownObjectRetain();
  sub_2287FACD8();
  sub_2287D050C(&qword_2682650B0, (void (*)(uint64_t))type metadata accessor for MedicationDataScannerViewController);
  swift_unknownObjectRetain();
  sub_2287FAC88();
  sub_2287FACA8();
  sub_2287FACC8();
  return v22;
}

id sub_2287C66E0()
{
  uint64_t v1 = qword_268265138;
  uint64_t v2 = *(void **)(v0 + qword_268265138);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_268265138);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2287C6764()
{
  uint64_t v1 = qword_268265140;
  uint64_t v2 = *(void **)(v0 + qword_268265140);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_268265140);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829D8]), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id MedicationDataScannerViewController.__allocating_init(healthStore:analyticsContext:)(void *a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_2287CE318(a1, a2);

  swift_release();
  return v6;
}

id MedicationDataScannerViewController.init(healthStore:analyticsContext:)(void *a1, uint64_t a2)
{
  id v3 = sub_2287CE318(a1, a2);

  swift_release();
  return v3;
}

void sub_2287C6874(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_2287CE56C();
}

id static MedicationDataScannerViewController.supportsDataScanning.getter()
{
  id result = objc_msgSend(self, sel_sharedBehavior);
  if (result)
  {
    uint64_t v1 = result;
    unsigned __int8 v2 = objc_msgSend(result, sel_isiPad);

    if ((v2 & 1) != 0 || (sub_2287FA3B8() & 1) == 0)
    {
      return 0;
    }
    else
    {
      sub_2287FACE8();
      return (id)(sub_2287FAC38() & 1);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2287C6920(void *a1)
{
  id v1 = a1;
  id v2 = sub_2287C6764();
  objc_msgSend(v2, sel_prepare);

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  sub_2287C6C94();
}

uint64_t sub_2287C6988()
{
  sub_2287FA5A8();
  uint64_t v0 = (uint64_t (*)(void))sub_2287FA5B8();
  if ((v0() & 1) == 0) {
    return 0;
  }
  id v1 = objc_msgSend(self, sel_standardUserDefaults);
  sub_2287FADD8();
  id v2 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  unsigned int v3 = objc_msgSend(v1, sel_BOOLForKey_, v2);

  return v3 ^ 1;
}

void sub_2287C6A40()
{
  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v21, sel_viewDidLayoutSubviews);
  id v1 = sub_2287C66E0();
  id v2 = (void *)sub_2287FA568();
  unsigned int v3 = (void *)sub_2287FAC28();

  objc_msgSend(v3, sel_bounds);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
  id v12 = (void *)sub_2287FA568();
  id v13 = sub_2287C66E0();
  double v14 = sub_2287D9C34();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  double v22 = v14;
  uint64_t v23 = v16;
  uint64_t v24 = v18;
  uint64_t v25 = v20;
  char v26 = 0;
  sub_2287FAC98();
}

void sub_2287C6B48(void *a1)
{
  id v1 = a1;
  sub_2287C6A40();
}

uint64_t sub_2287C6B90(char a1)
{
  id v2 = v1;
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v8, sel_viewDidDisappear_, a1 & 1);
  uint64_t v4 = qword_2682650B8;
  uint64_t v5 = *(void *)&v2[qword_2682650B8];
  if (v5)
  {
    swift_retain();
    sub_2287FA378();
    objc_msgSend(*(id *)(v5 + 64), sel_invalidate);
    double v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;

    sub_2287FA388();
    swift_release();
  }
  *(void *)&v2[v4] = 0;
  return swift_release();
}

void sub_2287C6C40(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_2287C6B90(a3);
}

void sub_2287C6C94()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_2287FAB28();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  id v29 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F110];
  sub_2287CFFE4(0, &qword_2682651C8, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  double v6 = (char *)&v27 - v5;
  sub_2287D02F8();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  double v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287D038C();
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287CA83C();
  id v32 = *(id *)(v0 + qword_2682650D0);
  sub_2287CF4B0();
  sub_2287D050C(&qword_268265258, (void (*)(uint64_t))sub_2287CF4B0);
  sub_2287FAAE8();
  sub_2287C5C80(0, &qword_2682651E0);
  id v32 = (id)sub_2287FAFD8();
  uint64_t v17 = sub_2287FAFC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  sub_2287D050C(&qword_268265268, (void (*)(uint64_t))sub_2287D02F8);
  sub_2287CF900();
  sub_2287FAAC8();
  sub_2287CF518((uint64_t)v6, &qword_2682651C8, v27);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = ObjectType;
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = v20;
  sub_2287D050C(&qword_268265270, (void (*)(uint64_t))sub_2287D038C);
  uint64_t v21 = sub_2287FAB08();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *(void *)(v1 + qword_268265130) = v21;
  swift_release();
  double v22 = *(void **)(v1 + qword_2682650E8);
  uint64_t v24 = v29;
  uint64_t v23 = v30;
  uint64_t v25 = v31;
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x263F8F090], v31);
  char v26 = (void *)sub_2287FAFF8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  objc_msgSend(v22, sel_registerObserver_queue_, v1, v26);

  sub_2287C7414();
}

void sub_2287C7194(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = sub_2287FA7A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *a1;
  sub_2287FA788();
  uint64_t v9 = sub_2287FA798();
  os_log_type_t v10 = sub_2287FAF88();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = v4;
    uint64_t v12 = v11;
    uint64_t v13 = swift_slowAlloc();
    v22[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_2287FB698();
    uint64_t v21 = sub_2287F6838(v14, v15, v22);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 1024;
    LODWORD(v21) = v8;
    sub_2287FB248();
    _os_log_impl(&dword_2287C0000, v9, v10, "[%s] Updating primary button state to assetReady: %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v13, -1, -1);
    MEMORY[0x22A69ED10](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x22A69EDE0](a2 + 16);
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = (void *)sub_2287FA548();

    if (v18)
    {
      sub_2287FA6B8();
      if (swift_dynamicCastClass()) {
        sub_2287FA688();
      }
    }
  }
}

void sub_2287C7414()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_2287FA7A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA778();
  uint64_t v7 = sub_2287FA798();
  os_log_type_t v8 = sub_2287FAF88();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v19 = v1;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = ObjectType;
    os_log_type_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)os_log_type_t v10 = 136446210;
    uint64_t v12 = sub_2287FB698();
    uint64_t v21 = sub_2287F6838(v12, v13, aBlock);
    sub_2287FB248();
    uint64_t v1 = v19;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v7, v8, "[%{public}s] Marking vision shards as required.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v11, -1, -1);
    uint64_t v14 = v10;
    uint64_t ObjectType = v20;
    MEMORY[0x22A69ED10](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  unint64_t v15 = *(void **)(v1 + qword_2682650E8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = ObjectType;
  aBlock[4] = (uint64_t)sub_2287D0470;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2287CDAEC;
  aBlock[3] = (uint64_t)&block_descriptor_117;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_markMedsScanningShardAsRequiredWithCompletion_, v17);
  _Block_release(v17);
}

uint64_t sub_2287C76B4(int a1)
{
  uint64_t v2 = v1;
  int v46 = a1;
  sub_2287CFFE4(0, &qword_2682651C8, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  id v44 = (char *)&v38 - v4;
  sub_2287CF968(0, &qword_2682651D0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE48]);
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v38 - v6;
  sub_2287CF7C4();
  uint64_t v9 = v8;
  uint64_t v45 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2287FA768();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v48 = v12;
  uint64_t v49 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v40 = v15;
  uint64_t v41 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v18 = qword_268265128;
  if (*(void *)&v1[qword_268265128])
  {
    swift_retain();
    sub_2287FA998();
    swift_release();
  }
  uint64_t v19 = qword_2682650B8;
  uint64_t v20 = *(void *)&v1[qword_2682650B8];
  if (v20)
  {
    swift_retain();
    sub_2287FA378();
    objc_msgSend(*(id *)(v20 + 64), sel_invalidate);
    uint64_t v21 = *(void **)(v20 + 64);
    *(void *)(v20 + 64) = 0;

    sub_2287FA388();
    swift_release();
  }
  *(void *)&v1[v19] = 0;
  swift_release();
  type metadata accessor for MedicationDataScanningCoordinator();
  swift_allocObject();
  *(void *)&v1[v19] = sub_2287F16DC();
  swift_release();
  if (*(void *)&v1[v19]) {
    swift_unknownObjectWeakAssign();
  }
  if (qword_268264EF0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_268265078;
  uint64_t v23 = v1;
  sub_2287FA758();
  uint64_t v24 = *(void *)&v1[v19];
  id v47 = v17;
  if (v24)
  {
    swift_beginAccess();
    sub_2287CF968(0, &qword_2682651F8, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE58]);
    uint64_t v38 = v9;
    swift_retain();
    uint64_t v39 = v18;
    uint64_t v25 = v48;
    sub_2287FAA58();
    swift_endAccess();
    swift_release();
    sub_2287C5C80(0, &qword_2682651E0);
    *(void *)&long long v50 = sub_2287FAFD8();
    uint64_t v26 = sub_2287FAFC8();
    uint64_t v27 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v44, 1, 1, v26);
    sub_2287CF884();
    sub_2287CF900();
    uint64_t v28 = v43;
    sub_2287FAAC8();
    sub_2287CF518(v27, &qword_2682651C8, MEMORY[0x263F8F110]);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v28);
    uint64_t v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v30 = v49;
    uint64_t v31 = v41;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v41, v47, v25);
    unint64_t v32 = (*(unsigned __int8 *)(v30 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v29;
    uint64_t v34 = v25;
    uint64_t v18 = v39;
    (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v33 + v32, v31, v34);
    sub_2287D050C(&qword_268265200, (void (*)(uint64_t))sub_2287CF7C4);
    uint64_t v35 = v38;
    uint64_t v36 = sub_2287FAB08();
    swift_release();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v35);
  }
  else
  {
    uint64_t v36 = 0;
  }
  *(void *)&v2[v18] = v36;
  swift_release();
  if ((v46 & 1) != 0 && *(void *)&v2[v19])
  {
    swift_retain();
    sub_2287F1DFC(1);
    swift_getKeyPath();
    swift_getKeyPath();
    long long v50 = xmmword_2287FC850;
    char v51 = 2;
    sub_2287FAA78();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v47, v48);
}

void sub_2287C7D58(uint64_t a1, uint64_t a2, char *a3)
{
  v65 = a3;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2287CFFE4(0, &qword_268265208, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  v63 = (char *)v60 - v7;
  uint64_t v8 = sub_2287FA2D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287CFFE4(0, &qword_2682651C0, MEMORY[0x263F07508], v5);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v60 - v13;
  uint64_t v15 = sub_2287FA308();
  uint64_t v68 = *(void *)(v15 - 8);
  uint64_t v16 = *(void *)(v68 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v64 = (char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v60 - v18;
  uint64_t v20 = *(void *)(a1 + 8);
  id v66 = *(id *)a1;
  uint64_t v67 = v20;
  int v21 = *(unsigned __int8 *)(a1 + 16);
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x22A69EDE0](a2 + 16);
  if (!v22) {
    return;
  }
  uint64_t v23 = (void *)v22;
  uint64_t v24 = *(void *)(v22 + qword_2682650B8);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v14, 1, 1, v15);
    goto LABEL_12;
  }
  uint64_t v25 = v68;
  v61 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
  uint64_t v62 = v68 + 16;
  v61(v14, v24 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v14, 1, v15) == 1)
  {
LABEL_12:

    sub_2287CF518((uint64_t)v14, &qword_2682651C0, MEMORY[0x263F07508]);
    return;
  }
  v60[0] = *(void *)(v25 + 32);
  v60[1] = v25 + 32;
  ((void (*)(char *, char *, uint64_t))v60[0])(v19, v14, v15);
  uint64_t v26 = v15;
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_retain();
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2287E2B00((uint64_t)v19, 0, 1, v28, 0, 0, 1);
  swift_release();
  uint64_t v29 = v19;
  if (!v21)
  {
    id v45 = v66;
    id v46 = v66;
    sub_2287FB008();
    if (qword_268264EF0 != -1) {
      swift_once();
    }
    sub_2287FA748();
    id v47 = sub_2287C6764();
    objc_msgSend(v47, sel_notificationOccurred_, 0);

    uint64_t v48 = (void *)sub_2287FA568();
    sub_2287FAC58();

    id v49 = sub_2287C66E0();
    long long v50 = v64;
    v61(v64, (uint64_t)v29, v26);
    uint64_t v39 = v68;
    uint64_t v51 = *(unsigned __int8 *)(v68 + 80);
    v65 = v29;
    uint64_t v41 = v26;
    uint64_t v52 = (v51 + 32) & ~v51;
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = v23;
    *(void *)(v53 + 24) = v46;
    ((void (*)(uint64_t, char *, uint64_t))v60[0])(v53 + v52, v50, v41);
    uint64_t v54 = v67;
    sub_2287CFF1C(v45, v67, 0);
    id v55 = v23;
    sub_2287DA884((uint64_t)sub_2287CFEB8, v53, 0.8);

    swift_release();
    sub_2287CFF78(v45, v54, 0);

    goto LABEL_16;
  }
  if (v21 == 1)
  {
    id v30 = v66;
    swift_bridgeObjectRetain();
    sub_2287FB008();
    if (qword_268264EF0 != -1) {
      swift_once();
    }
    sub_2287FA748();
    id v31 = sub_2287C6764();
    objc_msgSend(v31, sel_notificationOccurred_, 0);

    unint64_t v32 = (void *)sub_2287FA568();
    sub_2287FAC58();

    uint64_t v33 = sub_2287FAEF8();
    uint64_t v34 = (uint64_t)v63;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v63, 1, 1, v33);
    uint64_t v35 = v64;
    v61(v64, (uint64_t)v29, v26);
    sub_2287FAED8();
    id v36 = v23;
    id v37 = v30;
    uint64_t v38 = sub_2287FAEC8();
    uint64_t v39 = v68;
    uint64_t v40 = *(unsigned __int8 *)(v68 + 80);
    v65 = v29;
    uint64_t v41 = v26;
    uint64_t v42 = (v40 + 56) & ~v40;
    uint64_t v43 = (void *)swift_allocObject();
    uint64_t v44 = MEMORY[0x263F8F500];
    v43[2] = v38;
    v43[3] = v44;
    v43[4] = v36;
    v43[5] = v37;
    v43[6] = v67;
    ((void (*)(char *, char *, uint64_t))v60[0])((char *)v43 + v42, v35, v41);
    sub_2287F14A4(v34, (uint64_t)&unk_268265218, (uint64_t)v43);

    swift_release();
LABEL_16:
    (*(void (**)(char *, uint64_t))(v39 + 8))(v65, v41);
    return;
  }
  uint64_t v56 = v68;
  switch((unint64_t)v66)
  {
    case 1uLL:
      sub_2287FB018();
      if (qword_268264EF0 != -1) {
        swift_once();
      }
      sub_2287FA748();
      sub_2287C9FB8();
      goto LABEL_28;
    case 2uLL:
      sub_2287FB028();
      if (qword_268264EF0 != -1) {
        swift_once();
      }
      sub_2287FA748();
      uint64_t v57 = (void *)sub_2287FA568();
      sub_2287FAC58();

      sub_2287FA588();
      goto LABEL_28;
    case 3uLL:
      sub_2287FB008();
      if (qword_268264EF0 != -1) {
        swift_once();
      }
      sub_2287FA748();
      id v58 = sub_2287C6764();
      objc_msgSend(v58, sel_notificationOccurred_, 2);

      v59 = (void *)sub_2287FA568();
      sub_2287FAC58();

      sub_2287CAD6C();
LABEL_28:

      (*(void (**)(char *, uint64_t))(v56 + 8))(v19, v26);
      break;
    default:
      (*(void (**)(char *, uint64_t))(v68 + 8))(v19, v26);

      break;
  }
}

uint64_t sub_2287C870C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  id v7 = a1;
  sub_2287CB6EC(a2, a3, (uint64_t)sub_2287CFFD4, v6);
  return swift_release();
}

void sub_2287C879C()
{
  id v0 = sub_2287C66E0();
  id v1 = sub_2287DA14C();
  sub_2287D7D58((void (*)(id))nullsub_1, 0, 0.0);

  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  v6[4] = sub_2287D05A0;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_2287C99E0;
  v6[3] = &block_descriptor_56;
  uint64_t v4 = _Block_copy(v6);
  id v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.0);
  _Block_release(v4);
}

uint64_t sub_2287C88CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[48] = a6;
  v7[49] = a7;
  v7[46] = a4;
  v7[47] = a5;
  uint64_t v8 = sub_2287FA308();
  v7[50] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[51] = v9;
  v7[52] = *(void *)(v9 + 64);
  v7[53] = swift_task_alloc();
  uint64_t v10 = sub_2287FAB68();
  v7[54] = v10;
  v7[55] = *(void *)(v10 - 8);
  v7[56] = swift_task_alloc();
  v7[57] = swift_task_alloc();
  uint64_t v11 = sub_2287FAB18();
  v7[58] = v11;
  v7[59] = *(void *)(v11 - 8);
  v7[60] = swift_task_alloc();
  uint64_t v12 = sub_2287FAB48();
  v7[61] = v12;
  v7[62] = *(void *)(v12 - 8);
  v7[63] = swift_task_alloc();
  uint64_t v13 = sub_2287FA2D8();
  v7[64] = v13;
  v7[65] = *(void *)(v13 - 8);
  v7[66] = swift_task_alloc();
  uint64_t v14 = sub_2287FA7A8();
  v7[67] = v14;
  v7[68] = *(void *)(v14 - 8);
  v7[69] = swift_task_alloc();
  v7[70] = swift_task_alloc();
  sub_2287FAED8();
  v7[71] = sub_2287FAEC8();
  uint64_t v16 = sub_2287FAEB8();
  v7[72] = v16;
  v7[73] = v15;
  return MEMORY[0x270FA2498](sub_2287C8BBC, v16, v15);
}

uint64_t sub_2287C8BBC()
{
  sub_2287FA778();
  id v1 = sub_2287FA798();
  os_log_type_t v2 = sub_2287FAF88();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134217984;
    v0[45] = 0x3FECCCCCC0000000;
    sub_2287FB248();
    _os_log_impl(&dword_2287C0000, v1, v2, "LCS filtering criterion: %f", v3, 0xCu);
    MEMORY[0x22A69ED10](v3, -1, -1);
  }

  uint64_t v4 = v0[70];
  uint64_t v5 = v0[68];
  uint64_t v6 = v0[67];
  uint64_t v7 = v0[47];
  uint64_t v8 = v0[46];
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v0[74] = v9;
  v0[75] = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v4, v6);
  uint64_t v10 = *(void **)(v8 + qword_2682650F0);
  uint64_t v11 = sub_2287FAF38();
  v0[76] = v11;
  v0[2] = v0;
  v0[7] = v0 + 39;
  v0[3] = sub_2287C8DE0;
  uint64_t v12 = swift_continuation_init();
  v0[28] = MEMORY[0x263EF8330];
  v0[29] = 0x40000000;
  v0[30] = sub_2287F13E8;
  v0[31] = &block_descriptor_57;
  v0[32] = v12;
  objc_msgSend(v10, sel_filter_transcripts_criterion_limit_completionHandler_, v7, v11, 10, v0 + 28, COERCE_DOUBLE(1063675494));
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2287C8DE0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 616) = v2;
  uint64_t v3 = *(void *)(v1 + 584);
  uint64_t v4 = *(void *)(v1 + 576);
  if (v2) {
    uint64_t v5 = sub_2287C9740;
  }
  else {
    uint64_t v5 = sub_2287C8F10;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2287C8F10()
{
  uint64_t v1 = (void *)v0[76];
  swift_release();
  uint64_t v2 = (void *)v0[39];

  if (qword_268264F00 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[66];
  uint64_t v4 = v0[65];
  uint64_t v5 = v0[64];
  uint64_t v6 = v0[49];
  swift_beginAccess();
  swift_retain();
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_2287E2B00(v6, v8, 0, 0, 1, 0, 1);
  swift_release();
  swift_retain();
  sub_2287E1C68(v6, v2);
  swift_release();
  id v9 = objc_msgSend(v2, sel_resolvedIds);
  sub_2287C5C80(0, &qword_268265220);
  unint64_t v10 = sub_2287FAE48();

  id v45 = v2;
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_2287C5C80(0, &qword_2682651E0);
  uint64_t v12 = (void *)sub_2287FAFD8();
  uint64_t v13 = v0[63];
  uint64_t v43 = v0[62];
  uint64_t v14 = v0[60];
  uint64_t v15 = v0[58];
  uint64_t v47 = v0[61];
  uint64_t v48 = v0[59];
  if (v11)
  {
    uint64_t v16 = v0[56];
    uint64_t v41 = v0[57];
    uint64_t v46 = v0[55];
    uint64_t v42 = v0[54];
    uint64_t v39 = v0[53];
    uint64_t v40 = v0[52];
    uint64_t v38 = v0[50];
    uint64_t v36 = v0[51];
    uint64_t v37 = v0[49];
    uint64_t v17 = (void *)v0[46];
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    v0[14] = sub_2287CFFDC;
    v0[15] = v18;
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 1107296256;
    v0[12] = sub_2287C99E0;
    v0[13] = &block_descriptor_63;
    uint64_t v19 = _Block_copy(v0 + 10);
    id v34 = v17;
    sub_2287FAB38();
    v0[40] = MEMORY[0x263F8EE78];
    sub_2287D050C(&qword_268265228, MEMORY[0x263F8F030]);
    sub_2287CFFE4(0, &qword_268265230, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    sub_2287D0048();
    sub_2287FB288();
    MEMORY[0x22A69E010](0, v13, v14, v19);
    _Block_release(v19);

    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v35(v14, v15);
    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v44(v13, v47);
    swift_release();
    unint64_t v32 = (void *)sub_2287FAFD8();
    sub_2287FAB58();
    MEMORY[0x22A69DBA0](v16, 0.1);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    v33(v16, v42);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v39, v37, v38);
    unint64_t v20 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    unint64_t v21 = (v40 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 32))(v22 + v20, v39, v38);
    *(void *)(v22 + v21) = v34;
    *(void *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8)) = v45;
    v0[27] = v22;
    v0[26] = sub_2287D018C;
    v0[22] = MEMORY[0x263EF8330];
    v0[23] = 1107296256;
    v0[24] = sub_2287C99E0;
    v0[25] = &block_descriptor_69;
    uint64_t v23 = _Block_copy(v0 + 22);
    id v24 = v34;
    id v25 = v45;
    sub_2287FAB38();
    v0[42] = MEMORY[0x263F8EE78];
    sub_2287FB288();
    MEMORY[0x22A69DFE0](v41, v13, v14, v23);
    _Block_release(v23);

    v35(v14, v15);
    v44(v13, v47);
    v33(v41, v42);
  }
  else
  {
    uint64_t v26 = (void *)v0[46];
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v26;
    v0[21] = v27;
    v0[20] = sub_2287D0224;
    v0[16] = MEMORY[0x263EF8330];
    v0[17] = 1107296256;
    v0[18] = sub_2287C99E0;
    v0[19] = &block_descriptor_75;
    uint64_t v28 = _Block_copy(v0 + 16);
    id v29 = v26;
    sub_2287FAB38();
    v0[44] = MEMORY[0x263F8EE78];
    sub_2287D050C(&qword_268265228, MEMORY[0x263F8F030]);
    sub_2287CFFE4(0, &qword_268265230, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    sub_2287D0048();
    sub_2287FB288();
    MEMORY[0x22A69E010](0, v13, v14, v28);
    _Block_release(v28);

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v13, v47);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v30 = (uint64_t (*)(void))v0[1];
  return v30();
}

uint64_t sub_2287C9740()
{
  uint64_t v22 = v0;
  uint64_t v1 = (void *)v0[77];
  uint64_t v2 = (void *)v0[76];
  swift_release();
  swift_willThrow();

  sub_2287FA778();
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2287FA798();
  os_log_type_t v6 = sub_2287FAF78();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[77];
    unint64_t v20 = (void (*)(uint64_t, uint64_t))v0[74];
    uint64_t v19 = v0[69];
    uint64_t v18 = v0[67];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_getErrorValue();
    uint64_t v10 = sub_2287FB5F8();
    v0[41] = sub_2287F6838(v10, v11, &v21);
    sub_2287FB248();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2287C0000, v5, v6, "Filtering medication results failed, error: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v9, -1, -1);
    MEMORY[0x22A69ED10](v8, -1, -1);

    v20(v19, v18);
  }
  else
  {
    uint64_t v12 = (void *)v0[77];
    uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[74];
    uint64_t v14 = v0[69];
    uint64_t v15 = v0[67];

    v13(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_2287C99E0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2287C9A24()
{
  id v0 = sub_2287C66E0();
  id v1 = sub_2287DA14C();
  sub_2287D5780((void (*)())nullsub_1, 0, 0.5);

  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  v6[4] = sub_2287D0250;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_2287C99E0;
  v6[3] = &block_descriptor_94;
  id v4 = _Block_copy(v6);
  id v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.5);
  _Block_release(v4);
}

void sub_2287C9B50(uint64_t a1, char *a2, void *a3)
{
  uint64_t v6 = sub_2287FA308();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2287FA2D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_retain();
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_2287E2B00(a1, 0, 1, 0, 1, v15, 0);
  swift_release();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  uint64_t v17 = *(void **)&a2[qword_2682650E0];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v18 = objc_allocWithZone((Class)type metadata accessor for MedicationScanMultiResultsViewController());
  uint64_t v19 = a2;
  unint64_t v20 = sub_2287C314C(v17, a3, (uint64_t)v9);
  *(void *)&v20[qword_2682659E0 + 8] = &off_26DCF7220;
  swift_unknownObjectWeakAssign();
  aBlock[4] = sub_2287D0248;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2287C99E0;
  aBlock[3] = &block_descriptor_81;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_presentViewController_animated_completion_, v20, 1, v21);
  _Block_release(v21);
  swift_release();
}

void sub_2287C9E8C()
{
  id v0 = sub_2287C66E0();
  id v1 = sub_2287DA14C();
  sub_2287D7D58((void (*)(id))nullsub_1, 0, 0.0);

  uint64_t v2 = self;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  v6[4] = sub_2287D05A0;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_2287C99E0;
  v6[3] = &block_descriptor_88;
  id v4 = _Block_copy(v6);
  id v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.0);
  _Block_release(v4);
}

void sub_2287C9FB8()
{
  uint64_t v0 = sub_2287FA7A8();
  MEMORY[0x270FA5388](v0);
  id v1 = (void *)sub_2287FA568();
  sub_2287FAC68();
}

id sub_2287CA154()
{
  id v1 = v0;
  uint64_t v25 = sub_2287FA4B8();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  id v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = &v0[qword_2682650C0];
  *(void *)id v5 = 2;
  v5[8] = 0;
  uint64_t v6 = &v0[qword_2682650C8];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  type metadata accessor for MedicationDataScannerViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v9 = (void *)sub_2287FAD38();
  id v26 = objc_msgSend(self, sel_imageNamed_inBundle_, v9, v8);

  if (qword_268264EF8 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_2287FA208();
  sub_2287FA208();
  sub_2287FA208();
  sub_2287FA5E8();
  sub_2287FA5C8();
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    uint64_t v11 = result;
    objc_msgSend(result, sel_bounds);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v27.origin.x = v13;
    v27.origin.y = v15;
    v27.size.width = v17;
    v27.size.height = v19;
    CGRectGetHeight(v27);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F441C0], v25);
    id v20 = objc_allocWithZone((Class)sub_2287FA6B8());
    uint64_t v21 = sub_2287FA698();
    sub_2287FA9D8();
    sub_2287FA688();
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v22;
    *(void *)(v23 + 24) = 2;
    swift_retain();
    sub_2287FA668();
    swift_release();

    return (id)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2287CA5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A69EDE0](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    sub_2287FA558();
  }
  swift_beginAccess();
  uint64_t v6 = (char *)MEMORY[0x22A69EDE0](v3);
  if (v6)
  {
    uint64_t v7 = &v6[qword_2682650C0];
    *(void *)uint64_t v7 = 0;
    v7[8] = 1;
  }
  swift_beginAccess();
  id v8 = (char *)MEMORY[0x22A69EDE0](v3);
  if (v8)
  {
    uint64_t v9 = &v8[qword_2682650C8];
    *(void *)uint64_t v9 = 0;
    v9[8] = 1;
  }
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x22A69EDE0](v3);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    sub_2287FA5A8();
    double v12 = (void (*)(uint64_t, uint64_t, void, void))sub_2287FA5B8();
    v12(a1, 1, 0, 0);
    id v13 = sub_2287C66E0();
    objc_msgSend(v13, sel_setAccessibilityElementsHidden_, 0);
  }
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x22A69EDE0](v3);
  if (v14)
  {
    CGFloat v15 = (void *)v14;
    sub_2287C76B4(1);
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A69EDE0](v3);
  if (result)
  {
    CGFloat v17 = (void *)result;
    double v18 = *(void **)(result + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    v18;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();

    return swift_release();
  }
  return result;
}

void sub_2287CA83C()
{
  id v0 = sub_2287C66E0();
  id v1 = (void *)sub_2287FA568();
  uint64_t v2 = (void *)sub_2287FAC28();

  objc_msgSend(v2, sel_bounds);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v0, sel_setFrame_, v4, v6, v8, v10);
  uint64_t v11 = (void *)sub_2287FA568();
  double v12 = (void *)sub_2287FAC28();

  id v13 = sub_2287C66E0();
  id v14 = (id)sub_2287FA578();
  objc_msgSend(v12, sel_insertSubview_belowSubview_, v13, v14);
}

void sub_2287CA940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2287CA960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2287CA980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2287CA9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  sub_2287FA5A8();
  double v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2287FA5B8();
  v12(a1, a2, a3, a4);
  id v13 = sub_2287C66E0();
  objc_msgSend(v13, sel_setAccessibilityElementsHidden_, a7 & 1);
}

void sub_2287CAA4C()
{
  sub_2287FA5A8();
  id v0 = (void (*)(void))sub_2287FA5B8();
  v0();
  _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0();
}

void _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_2287FA7A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA778();
  double v7 = sub_2287FA798();
  os_log_type_t v8 = sub_2287FAF88();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v20 = v3;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = ObjectType;
    double v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)double v10 = 136446210;
    uint64_t v12 = sub_2287FB698();
    uint64_t v22 = sub_2287F6838(v12, v13, aBlock);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v7, v8, "[%{public}s] Querying for ontology shard registry entries", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v11, -1, -1);
    id v14 = v10;
    uint64_t ObjectType = v21;
    MEMORY[0x22A69ED10](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  CGFloat v15 = *(void **)(v1 + qword_2682650E8);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = ObjectType;
  aBlock[4] = (uint64_t)sub_2287D0298;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2287CD694;
  aBlock[3] = (uint64_t)&block_descriptor_107;
  double v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_ontologyShardRegistryEntriesWithCompletion_, v18);
  _Block_release(v18);
}

void sub_2287CAD6C()
{
  uint64_t v21 = sub_2287FA4B8();
  uint64_t v0 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v19 = (char *)v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v2 = objc_msgSend(self, sel_configurationWithScale_, 2);
  uint64_t v3 = (void *)sub_2287FAD38();
  id v20 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v3, v2);

  id v23 = v2;
  if (qword_268264EF8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2287FA208();
  v18[0] = v5;
  v18[1] = v4;
  sub_2287FA208();
  sub_2287FA208();
  id v22 = v20;
  sub_2287FA208();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v19, *MEMORY[0x263F441C0], v21);
  id v6 = objc_allocWithZone((Class)sub_2287FA6B8());
  double v7 = (void *)sub_2287FA698();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v24;
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = 11;
  swift_retain();
  sub_2287FA668();
  swift_release();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = 11;
  v12[4] = v7;
  swift_retain();
  id v13 = v7;
  sub_2287FA678();
  swift_release();
  sub_2287FA5A8();
  id v14 = (void (*)(id, uint64_t, void, void))sub_2287FA5B8();
  v14(v13, 1, 0, 0);
  id v15 = sub_2287C66E0();
  objc_msgSend(v15, sel_setAccessibilityElementsHidden_, 1);

  uint64_t v16 = v9 + qword_2682650C0;
  *(void *)uint64_t v16 = 11;
  *(unsigned char *)(v16 + 8) = 0;
  uint64_t v17 = v9 + qword_2682650C8;
  *(void *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 8) = 1;
}

uint64_t sub_2287CB244(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (char *)MEMORY[0x22A69EDE0](v2);
  if (v3)
  {
    uint64_t v4 = &v3[qword_2682650C0];
    *(void *)uint64_t v4 = 0;
    v4[8] = 1;
  }
  swift_beginAccess();
  uint64_t v5 = (char *)MEMORY[0x22A69EDE0](v2);
  if (v5)
  {
    id v6 = &v5[qword_2682650C8];
    *(void *)id v6 = 0;
    v6[8] = 1;
  }
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x22A69EDE0](v2);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void *)(v7 + qword_2682650B8);
    swift_retain();

    if (v9)
    {
      sub_2287FA378();
      objc_msgSend(*(id *)(v9 + 64), sel_invalidate);
      uint64_t v10 = *(void **)(v9 + 64);
      *(void *)(v9 + 64) = 0;

      sub_2287FA388();
      swift_release();
    }
  }
  swift_beginAccess();
  uint64_t v11 = (char *)MEMORY[0x22A69EDE0](v2);
  if (v11)
  {
    *(void *)&v11[qword_2682650B8] = 0;

    swift_release();
  }
  swift_beginAccess();
  uint64_t v12 = (void *)MEMORY[0x22A69EDE0](v2);
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A69EDE0](v2);
  if (result)
  {
    id v15 = (void *)result;
    uint64_t v16 = *(void **)(result + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    v16;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();

    return swift_release();
  }
  return result;
}

void sub_2287CB4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x22A69EDE0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = *(void **)(v6 + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    v8;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();

    swift_release();
  }
  swift_beginAccess();
  uint64_t v9 = (char *)MEMORY[0x22A69EDE0](v5);
  if (v9)
  {
    uint64_t v10 = &v9[qword_2682650C0];
    *(void *)uint64_t v10 = 0;
    v10[8] = 1;
  }
  swift_beginAccess();
  uint64_t v11 = (char *)MEMORY[0x22A69EDE0](v5);
  if (v11)
  {
    uint64_t v12 = &v11[qword_2682650C8];
    *(void *)uint64_t v12 = 0;
    v12[8] = 1;
  }
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x22A69EDE0](v5);
  if (v13)
  {
    id v14 = (void *)v13;
    sub_2287FA5A8();
    id v15 = (void (*)(uint64_t, uint64_t, void, void))sub_2287FA5B8();
    v15(a4, 1, 0, 0);
    id v16 = sub_2287C66E0();
    objc_msgSend(v16, sel_setAccessibilityElementsHidden_, 0);
  }
  swift_beginAccess();
  uint64_t v17 = MEMORY[0x22A69EDE0](v5);
  if (v17)
  {
    double v18 = (void *)v17;
    sub_2287C76B4(1);
  }
}

uint64_t sub_2287CB6EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = a4;
  uint64_t v63 = a3;
  uint64_t v60 = a2;
  uint64_t v5 = sub_2287FA308();
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = v6;
  v61 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_2287FA7A8();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v52 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287CFFE4(0, &qword_2682651C0, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v51 - v9;
  uint64_t v11 = sub_2287FA4B8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2287FB078();
  uint64_t v57 = v16;
  uint64_t v58 = v15;
  id v62 = a1;
  uint64_t v17 = sub_2287FB088();
  if (v18) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v18) {
    unint64_t v20 = v18;
  }
  else {
    unint64_t v20 = 0xE000000000000000;
  }
  unint64_t v55 = v20;
  uint64_t v56 = v19;
  if (qword_268264EF8 != -1) {
    swift_once();
  }
  sub_2287FA208();
  sub_2287FA208();
  sub_2287FA5E8();
  sub_2287FA5D8();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F441C0], v11);
  id v21 = objc_allocWithZone((Class)sub_2287FA6B8());
  uint64_t v58 = sub_2287FA698();
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v23 = v66;
  uint64_t v22 = v67;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
  uint64_t v25 = v60;
  v24(v10, v60, v67);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v10, 0, 1, v22);
  swift_retain();
  id v26 = v62;
  id v27 = objc_msgSend(v62, sel_specificProduct);
  id v28 = objc_msgSend(v27, sel_identifier);

  sub_2287E2EB8((uint64_t)v10, 0, v28, &v69);
  swift_release();

  sub_2287CF518((uint64_t)v10, &qword_2682651C0, MEMORY[0x263F07508]);
  BOOL v68 = 0;
  if (BYTE8(v69) == 2)
  {
    id v29 = v52;
    sub_2287FA788();
    id v30 = sub_2287FA798();
    os_log_type_t v31 = sub_2287FAF78();
    if (os_log_type_enabled(v30, v31))
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl(&dword_2287C0000, v30, v31, "[MedicationsListOnboardingAnalytics] Failed to calculate algorithmType because ScanningSessionLogger returned a null value.", v32, 2u);
      MEMORY[0x22A69ED10](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v53 + 8))(v29, v54);
  }
  else
  {
    BOOL v68 = (BYTE8(v69) & 1) == 0;
  }
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = v65;
  swift_unknownObjectWeakInit();
  uint64_t v35 = v61;
  uint64_t v36 = v67;
  v24(v61, v25, v67);
  BOOL v37 = v68;
  uint64_t v38 = v66;
  unint64_t v39 = (*(unsigned __int8 *)(v66 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  uint64_t v40 = (char *)swift_allocObject();
  *((void *)v40 + 2) = v33;
  *((void *)v40 + 3) = 3;
  *((void *)v40 + 4) = v37;
  *((void *)v40 + 5) = v26;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v40[v39], v35, v36);
  swift_retain();
  id v41 = v26;
  uint64_t v42 = (void *)v58;
  sub_2287FA668();
  swift_release();
  uint64_t v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BOOL v44 = v68;
  id v45 = (void *)swift_allocObject();
  v45[2] = v43;
  v45[3] = 3;
  v45[4] = v44;
  swift_retain();
  sub_2287FA678();
  swift_release();
  sub_2287FA5A8();
  uint64_t v46 = (void (*)(void *, uint64_t, uint64_t, uint64_t))sub_2287FA5B8();
  v46(v42, 1, v63, v64);
  id v47 = sub_2287C66E0();
  objc_msgSend(v47, sel_setAccessibilityElementsHidden_, 1);

  uint64_t v48 = v34 + qword_2682650C0;
  *(void *)uint64_t v48 = 3;
  *(unsigned char *)(v48 + 8) = 0;
  uint64_t result = swift_beginAccess();
  uint64_t v50 = v34 + qword_2682650C8;
  *(void *)uint64_t v50 = v68;
  *(unsigned char *)(v50 + 8) = 0;
  return result;
}

uint64_t sub_2287CBEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v9 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A69EDE0](v9);
  if (result)
  {
    uint64_t v11 = (char *)result;
    uint64_t v12 = result + qword_2682650C0;
    *(void *)uint64_t v12 = 0;
    *(unsigned char *)(v12 + 8) = 1;
    uint64_t v13 = result + qword_2682650C8;
    *(void *)uint64_t v13 = 0;
    *(unsigned char *)(v13 + 8) = 1;
    uint64_t v14 = *(void *)(result + qword_2682650D8);
    uint64_t v15 = *(void **)(result + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    LOBYTE(v25) = 0;
    id v24 = v15;
    LOBYTE(v23) = 0;
    LOBYTE(v22) = 1;
    LOWORD(v21) = 513;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();
    uint64_t v16 = &v11[qword_268265080];
    swift_beginAccess();
    if (MEMORY[0x22A69EDE0](v16))
    {
      uint64_t v17 = *((void *)v16 + 1);
      uint64_t ObjectType = swift_getObjectType();
      id v19 = objc_msgSend(a5, sel_specificProduct, v21, 0, v22, a4, v23, v24, v25);
      unint64_t v20 = *(void (**)(char *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
      swift_retain();
      v20(v11, v19, a6, v14, 2, ObjectType, v17);

      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {

      return swift_release();
    }
  }
  return result;
}

void sub_2287CC0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = (char *)MEMORY[0x22A69EDE0](v3);
  if (v4)
  {
    uint64_t v5 = &v4[qword_2682650C0];
    *(void *)uint64_t v5 = 0;
    v5[8] = 1;
  }
  swift_beginAccess();
  uint64_t v6 = (char *)MEMORY[0x22A69EDE0](v3);
  if (v6)
  {
    uint64_t v7 = &v6[qword_2682650C8];
    *(void *)uint64_t v7 = 0;
    v7[8] = 1;
  }
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x22A69EDE0](v3);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_2287FA5A8();
    uint64_t v10 = (void (*)(uint64_t, void, void, void))sub_2287FA5B8();
    v10(a1, 0, 0, 0);
    id v11 = sub_2287C66E0();
    objc_msgSend(v11, sel_setAccessibilityElementsHidden_, 0);
  }
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x22A69EDE0](v3);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = *(void **)(v12 + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    v14;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();

    swift_release();
  }
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x22A69EDE0](v3);
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    id v17 = sub_2287C66E0();

    id v18 = sub_2287DA14C();
    sub_2287D7D58((void (*)(id))nullsub_1, 0, 0.3);

    id v19 = self;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v17;
    aBlock[4] = sub_2287CF750;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2287C99E0;
    aBlock[3] = &block_descriptor_0;
    uint64_t v21 = _Block_copy(aBlock);
    id v22 = v17;
    swift_release();
    objc_msgSend(v19, sel_animateWithDuration_animations_, v21, 0.3);
    _Block_release(v21);
  }
  swift_beginAccess();
  uint64_t v23 = MEMORY[0x22A69EDE0](v3);
  if (v23)
  {
    id v24 = (void *)v23;
    sub_2287C76B4(1);
  }
}

uint64_t sub_2287CC420(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_2287FB278();
  swift_unknownObjectRelease();
  sub_2287C4A4C();

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v4);
}

uint64_t sub_2287CC480()
{
  uint64_t v1 = v0 + qword_2682650C0;
  if ((*(unsigned char *)(v0 + qword_2682650C0 + 8) & 1) == 0)
  {
    id v2 = *(void **)(v0 + qword_2682650E0);
    sub_2287FA718();
    swift_allocObject();
    swift_retain();
    v2;
    sub_2287FA708();
    sub_2287FA738();
    sub_2287FA728();
    swift_release();
  }
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
  uint64_t v3 = v0 + qword_2682650C8;
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  uint64_t v4 = qword_2682650B8;
  uint64_t v5 = *(void *)(v0 + qword_2682650B8);
  if (v5)
  {
    swift_retain();
    sub_2287FA378();
    objc_msgSend(*(id *)(v5 + 64), sel_invalidate);
    uint64_t v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;

    sub_2287FA388();
    swift_release();
  }
  *(void *)(v0 + v4) = 0;
  swift_release();
  sub_2287FA5A8();
  uint64_t v7 = (uint64_t (*)(void))sub_2287FA5B8();
  return v7();
}

void sub_2287CC648(void *a1)
{
  id v1 = a1;
  sub_2287CC480();
}

id MedicationDataScannerViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MedicationDataScannerViewController.init()()
{
}

void sub_2287CC6F4()
{
}

void sub_2287CC724()
{
  sub_2287C59A0(v0 + qword_268265080);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  id v1 = *(void **)(v0 + qword_268265140);
}

id MedicationDataScannerViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2287CC88C(uint64_t a1)
{
  sub_2287C59A0(a1 + qword_268265080);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  objc_super v2 = *(void **)(a1 + qword_268265140);
}

uint64_t MedicationDataScannerViewController.ontologyStore(_:didImport:)(uint64_t a1, void *a2)
{
  sub_2287CF968(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287FC860;
  *(void *)(inited + 32) = a2;
  unint64_t v6 = inited;
  sub_2287FAE68();
  id v4 = a2;
  sub_2287CCA74(v6);
  return swift_bridgeObjectRelease();
}

void sub_2287CCA74(unint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_2287FA7A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v52 - v9;
  id v11 = (void *)sub_2287FA548();

  if (!v11) {
    return;
  }
  uint64_t v56 = v5;
  uint64_t v57 = v4;
  uint64_t v52 = v1;
  uint64_t v53 = v10;
  uint64_t v54 = ObjectType;
  unint64_t v55 = v8;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2287FB418();
    if (v12) {
      goto LABEL_4;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    id v45 = v55;
    sub_2287FA778();
    uint64_t v46 = sub_2287FA798();
    os_log_type_t v47 = sub_2287FAF88();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v61 = v49;
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v50 = sub_2287FB698();
      id v60 = (id)sub_2287F6838(v50, v51, &v61);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2287C0000, v46, v47, "[%{public}s] Failed to find PBS shard in registry entries.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v49, -1, -1);
      MEMORY[0x22A69ED10](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v45, v57);
    return;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v12) {
    goto LABEL_29;
  }
LABEL_4:
  unint64_t v59 = a1 & 0xC000000000000001;
  uint64_t v58 = *MEMORY[0x263F09B70];
  uint64_t v13 = 4;
  while (1)
  {
    if (v59) {
      id v14 = (id)MEMORY[0x22A69E3A0](v13 - 4, a1);
    }
    else {
      id v14 = *(id *)(a1 + 8 * v13);
    }
    uint64_t v15 = v14;
    uint64_t v16 = v13 - 3;
    if (__OFADD__(v13 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    id v17 = objc_msgSend(v14, sel_identifier, v52);
    uint64_t v18 = sub_2287FAD68();
    uint64_t v20 = v19;
    if (v18 == sub_2287FAD68() && v20 == v21)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v23 = sub_2287FB5B8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0) {
        goto LABEL_7;
      }
    }
    id v24 = objc_msgSend(v15, sel_schemaType);
    uint64_t v25 = sub_2287FAD68();
    uint64_t v27 = v26;
    if (v25 == sub_2287FAD68() && v27 == v28)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v29 = sub_2287FB5B8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0) {
        goto LABEL_7;
      }
    }
    if (objc_msgSend(v15, sel_schemaVersion) == (id)2) {
      break;
    }
LABEL_7:

    ++v13;
    if (v16 == v12) {
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v15, sel_currentVersion);
  os_log_type_t v31 = v53;
  sub_2287FA778();
  id v32 = v15;
  uint64_t v33 = sub_2287FA798();
  os_log_type_t v34 = sub_2287FAF88();
  if (os_log_type_enabled(v33, v34))
  {
    LODWORD(v58) = (uint64_t)v30 > 0;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v61 = v36;
    *(_DWORD *)uint64_t v35 = 136446978;
    unint64_t v59 = (unint64_t)v30;
    uint64_t v37 = sub_2287FB698();
    id v60 = (id)sub_2287F6838(v37, v38, &v61);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2082;
    objc_msgSend(v32, sel_availableState);
    id v39 = (id)HKStringFromOntologyShardState();
    uint64_t v40 = sub_2287FAD68();
    unint64_t v42 = v41;

    id v60 = (id)sub_2287F6838(v40, v42, &v61);
    sub_2287FB248();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 1026;
    LODWORD(v60) = v58;
    sub_2287FB248();
    *(_WORD *)(v35 + 28) = 2082;
    id v60 = objc_msgSend(v32, sel_currentVersion);
    uint64_t v43 = sub_2287FB598();
    id v60 = (id)sub_2287F6838(v43, v44, &v61);
    id v30 = (id)v59;
    sub_2287FB248();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v33, v34, "[%{public}s] Current PBS availability state: %{public}s, isImported: %{BOOL,public}d, currentVersion: %{public}s", (uint8_t *)v35, 0x26u);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v36, -1, -1);
    MEMORY[0x22A69ED10](v35, -1, -1);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v57);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v57);
  }
  LOBYTE(v61) = (uint64_t)v30 > 0;
  sub_2287FA9C8();
}

void sub_2287CD140(void *a1, uint64_t a2, void *a3, void *a4)
{
  sub_2287CF968(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287FC860;
  *(void *)(inited + 32) = a4;
  unint64_t v11 = inited;
  sub_2287FAE68();
  id v8 = a4;
  id v9 = a3;
  id v10 = a1;
  sub_2287CCA74(v11);
  swift_bridgeObjectRelease();
}

void sub_2287CD214(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0();
}

void sub_2287CD274(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_2287FA7A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x22A69EDE0](a3 + 16);
  if (v13)
  {
    id v14 = (void *)v13;
    if (a2)
    {
      id v15 = a2;
      sub_2287FA778();
      id v16 = a2;
      id v17 = a2;
      uint64_t v18 = sub_2287FA798();
      os_log_type_t v19 = sub_2287FAF78();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v36 = v34;
        *(_DWORD *)uint64_t v20 = 136446466;
        uint64_t v21 = sub_2287FB698();
        uint64_t v35 = sub_2287F6838(v21, v22, &v36);
        sub_2287FB248();
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2082;
        uint64_t v35 = (uint64_t)a2;
        id v23 = a2;
        sub_2287D02A0();
        uint64_t v24 = sub_2287FAD98();
        uint64_t v35 = sub_2287F6838(v24, v25, &v36);
        sub_2287FB248();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2287C0000, v18, v19, "[%{public}s] Failed to get ontology shard registry entries, error: %{public}s", (uint8_t *)v20, 0x16u);
        uint64_t v26 = v34;
        swift_arrayDestroy();
        MEMORY[0x22A69ED10](v26, -1, -1);
        MEMORY[0x22A69ED10](v20, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      sub_2287CCA74(MEMORY[0x263F8EE78]);
    }
    else
    {
      if (a1)
      {
        unint64_t v27 = a1;
      }
      else
      {
        sub_2287FA778();
        uint64_t v28 = sub_2287FA798();
        uint64_t v29 = sub_2287FAF78();
        if (os_log_type_enabled(v28, (os_log_type_t)v29))
        {
          id v30 = (uint8_t *)swift_slowAlloc();
          uint64_t v31 = swift_slowAlloc();
          uint64_t v36 = v31;
          *(_DWORD *)id v30 = 136446210;
          uint64_t v34 = (uint64_t)(v30 + 4);
          uint64_t v32 = sub_2287FB698();
          uint64_t v35 = sub_2287F6838(v32, v33, &v36);
          sub_2287FB248();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2287C0000, v28, (os_log_type_t)v29, "[%{public}s] Failed to get ontology shard registry entries, entries were unexpectedly nil.", v30, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A69ED10](v31, -1, -1);
          MEMORY[0x22A69ED10](v30, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        unint64_t v27 = MEMORY[0x263F8EE78];
      }
      sub_2287CCA74(v27);
    }
  }
}

uint64_t sub_2287CD694(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2287C5C80(0, &qword_268265240);
    uint64_t v4 = sub_2287FAE48();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2287CD738(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_2287FA7A8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v29 - v8;
  if (a2)
  {
    id v10 = a2;
    sub_2287FA778();
    id v11 = a2;
    id v12 = a2;
    uint64_t v13 = sub_2287FA798();
    os_log_type_t v14 = sub_2287FAF78();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v30 = v16;
      *(_DWORD *)uint64_t v15 = 136446466;
      uint64_t v17 = sub_2287FB698();
      uint64_t v29 = sub_2287F6838(v17, v18, &v30);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      uint64_t v29 = (uint64_t)a2;
      id v19 = a2;
      sub_2287D02A0();
      uint64_t v20 = sub_2287FAD98();
      uint64_t v29 = sub_2287F6838(v20, v21, &v30);
      sub_2287FB248();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2287C0000, v13, v14, "[%{public}s] Failed to mark vision shards as required, error: %{public}s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v16, -1, -1);
      MEMORY[0x22A69ED10](v15, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    sub_2287FA778();
    unint64_t v22 = sub_2287FA798();
    os_log_type_t v23 = sub_2287FAF88();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v30 = v25;
      *(_DWORD *)uint64_t v24 = 136446210;
      uint64_t v26 = sub_2287FB698();
      uint64_t v29 = sub_2287F6838(v26, v27, &v30);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2287C0000, v22, v23, "[%{public}s] Marked vision shards as required", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v25, -1, -1);
      MEMORY[0x22A69ED10](v24, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
}

void sub_2287CDAEC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2287CDB64(void *a1)
{
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  sub_2287C76B4(1);
  objc_super v2 = *(void **)(v1 + qword_2682650E0);
  sub_2287FA718();
  swift_allocObject();
  swift_retain();
  v2;
  sub_2287FA708();
  sub_2287FA738();
  sub_2287FA728();
  return swift_release();
}

uint64_t sub_2287CDC5C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 0, 0);
  uint64_t v7 = v4 + qword_268265080;
  swift_beginAccess();
  if (MEMORY[0x22A69EDE0](v7))
  {
    uint64_t v8 = *(void *)(v7 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))(v8 + 8))(v4, a2, a3, *(void *)(v4 + qword_2682650D8), 3, ObjectType, v8);
    swift_unknownObjectRelease();
  }
  id v10 = *(void **)(v4 + qword_2682650E0);
  sub_2287FA718();
  swift_allocObject();
  swift_retain();
  v10;
  sub_2287FA708();
  sub_2287FA738();
  sub_2287FA728();
  return swift_release();
}

uint64_t MedicationDataScannerViewController.dataScanner(_:didAdd:allItems:)(uint64_t a1, uint64_t a2)
{
  return sub_2287CE710(a2, "%{public}s Item added: %{sensitive}s");
}

uint64_t MedicationDataScannerViewController.dataScanner(_:didUpdate:allItems:)(uint64_t a1, uint64_t a2)
{
  return sub_2287CE710(a2, "%{public}s Item updated: %{sensitive}s");
}

uint64_t sub_2287CDE2C(uint64_t a1, uint64_t a2)
{
  return sub_2287CE710(a2, "%{public}s Item added: %{sensitive}s");
}

uint64_t sub_2287CDE50(uint64_t a1, uint64_t a2)
{
  return sub_2287CE710(a2, "%{public}s Item updated: %{sensitive}s");
}

uint64_t MedicationDataScannerViewController.dataScannerDidUpdateSceneStabilityState(_:newState:)(uint64_t a1, uint64_t a2)
{
  return sub_2287CE9CC(a2);
}

uint64_t sub_2287CDE84(uint64_t a1, uint64_t a2)
{
  return sub_2287CE9CC(a2);
}

uint64_t sub_2287CDE90()
{
  return sub_2287CDEA0();
}

uint64_t sub_2287CDE98()
{
  return sub_2287CDEA0();
}

uint64_t sub_2287CDEA0()
{
  id v1 = objc_msgSend(v0, sel_presentingViewController);
  if (v1)
  {
    objc_super v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  uint64_t v3 = *(void **)&v0[qword_2682650E0];
  sub_2287FA718();
  swift_allocObject();
  swift_retain();
  v3;
  sub_2287FA708();
  sub_2287FA738();
  sub_2287FA728();
  return swift_release();
}

uint64_t sub_2287CDFB8(uint64_t a1)
{
  uint64_t v2 = sub_2287FAC08();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_2287D0478();
    uint64_t v9 = sub_2287FB328();
    uint64_t v10 = 0;
    id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_2287D050C(&qword_268265280, MEMORY[0x263F1F2D0]);
      uint64_t v16 = sub_2287FAD08();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_2287D050C(&qword_268265288, MEMORY[0x263F1F2D0]);
          char v23 = sub_2287FAD28();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t type metadata accessor for MedicationDataScannerViewController()
{
  uint64_t result = qword_268265148;
  if (!qword_268265148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_2287CE318(void *a1, uint64_t a2)
{
  *(void *)&v2[qword_268265080 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v2[qword_2682650B8] = 0;
  uint64_t v5 = qword_2682650D0;
  char v16 = 0;
  sub_2287CF4B0();
  swift_allocObject();
  id v6 = v2;
  *(void *)&v2[v5] = sub_2287FA9F8();
  uint64_t v7 = qword_2682650F8;
  sub_2287FA3A8();
  swift_allocObject();
  *(void *)&v6[v7] = sub_2287FA398();
  uint64_t v8 = qword_268265100;
  *(void *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14040]), sel_initWithUnit_, 0);
  uint64_t v9 = MEMORY[0x263F8EE88];
  *(void *)&v6[qword_268265108] = MEMORY[0x263F8EE88];
  *(void *)&v6[qword_268265110] = v9;
  *(void *)&v6[qword_268265118] = v9;
  *(void *)&v6[qword_268265120] = 0;
  *(void *)&v6[qword_268265128] = 0;
  *(void *)&v6[qword_268265130] = 0;
  uint64_t v10 = &v6[qword_2682650C8];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v6[qword_2682650C0];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  *(void *)&v6[qword_268265138] = 0;
  *(void *)&v6[qword_268265140] = 0;
  *(void *)&v6[qword_2682650E0] = a1;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A5C8]), sel_initWithHealthStore_, a1);
  *(void *)&v6[qword_2682650E8] = v12;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F44EF0]), sel_init);
  *(void *)&v6[qword_2682650F0] = v13;
  *(void *)&v6[qword_2682650D8] = a2;
  swift_retain();

  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_2287CE52C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2287CE564(uint64_t a1)
{
  return sub_2287CA5D0(a1, *(void *)(v1 + 16));
}

void sub_2287CE56C()
{
  uint64_t v1 = v0;
  *(void *)&v0[qword_268265080 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[qword_2682650B8] = 0;
  uint64_t v2 = qword_2682650D0;
  sub_2287CF4B0();
  swift_allocObject();
  *(void *)&v0[v2] = sub_2287FA9F8();
  uint64_t v3 = qword_2682650F8;
  sub_2287FA3A8();
  swift_allocObject();
  *(void *)&v0[v3] = sub_2287FA398();
  uint64_t v4 = qword_268265100;
  *(void *)&v1[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14040]), sel_initWithUnit_, 0);
  uint64_t v5 = MEMORY[0x263F8EE88];
  *(void *)&v1[qword_268265108] = MEMORY[0x263F8EE88];
  *(void *)&v1[qword_268265110] = v5;
  *(void *)&v1[qword_268265118] = v5;
  *(void *)&v1[qword_268265120] = 0;
  *(void *)&v1[qword_268265128] = 0;
  *(void *)&v1[qword_268265130] = 0;
  id v6 = &v1[qword_2682650C8];
  *(void *)id v6 = 0;
  v6[8] = 1;
  uint64_t v7 = &v1[qword_2682650C0];
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  *(void *)&v1[qword_268265138] = 0;
  *(void *)&v1[qword_268265140] = 0;

  sub_2287FB408();
  __break(1u);
}

uint64_t sub_2287CE710(uint64_t a1, const char *a2)
{
  uint64_t v4 = v2;
  swift_getObjectType();
  uint64_t v6 = sub_2287FA7A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA778();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_2287FA798();
  os_log_type_t v11 = sub_2287FAF68();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v12 = 136446467;
    uint64_t v24 = a2;
    uint64_t v13 = sub_2287FB698();
    uint64_t v15 = sub_2287F6838(v13, v14, &v28);
    uint64_t v26 = v4;
    uint64_t v27 = v15;
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2085;
    uint64_t v16 = sub_2287FABD8();
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x22A69DE80](v17, v16);
    uint64_t v23 = v6;
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_2287F6838(v18, v20, &v28);
    uint64_t v4 = v26;
    sub_2287FB248();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v10, v11, v24, (uint8_t *)v12, 0x16u);
    uint64_t v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v21, -1, -1);
    MEMORY[0x22A69ED10](v12, -1, -1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (*(void *)(v4 + qword_2682650B8))
  {
    swift_retain();
    sub_2287F1F84(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2287CE9CC(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v2 = sub_2287FACB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v51 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v43 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v43 - v9;
  uint64_t v11 = sub_2287FA7A8();
  uint64_t v48 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA778();
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v50 = a1;
  uint64_t v15 = a1;
  uint64_t v16 = v14;
  v14(v10, (char *)v15, v2);
  uint64_t v17 = sub_2287FA798();
  os_log_type_t v18 = sub_2287FAF68();
  int v46 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    os_log_type_t v47 = v16;
    uint64_t v20 = v19;
    uint64_t v44 = swift_slowAlloc();
    uint64_t v53 = v44;
    *(_DWORD *)uint64_t v20 = 136446467;
    uint64_t v21 = sub_2287FB698();
    uint64_t v45 = v11;
    uint64_t v52 = sub_2287F6838(v21, v22, &v53);
    uint64_t v43 = v3;
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2085;
    v47(v8, v10, v2);
    uint64_t v23 = sub_2287FAD98();
    uint64_t v52 = sub_2287F6838(v23, v24, &v53);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    uint64_t v25 = v43;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v43 + 8);
    v26(v10, v2);
    _os_log_impl(&dword_2287C0000, v17, (os_log_type_t)v46, "%{public}s Camera stability updated: %{sensitive}s", (uint8_t *)v20, 0x16u);
    uint64_t v27 = v44;
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v27, -1, -1);
    uint64_t v28 = v20;
    uint64_t v16 = v47;
    MEMORY[0x22A69ED10](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v45);
  }
  else
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v3 + 8);
    v26(v10, v2);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
    uint64_t v25 = v3;
  }
  uint64_t v30 = v50;
  uint64_t v29 = v51;
  v16(v51, (char *)v50, v2);
  int v31 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v29, v2);
  int v32 = *MEMORY[0x263F1F320];
  int v33 = *MEMORY[0x263F1F318];
  uint64_t v34 = v49;
  sub_2287C66E0();
  if (v31 == v32 || v31 == v33)
  {
    if (qword_268264EF8 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_2287FA208();
    uint64_t v38 = v37;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v53 = v36;
    uint64_t v54 = v38;
    uint64_t result = sub_2287FAA78();
  }
  else
  {
    if (qword_268264EF8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_2287FA208();
    uint64_t v42 = v41;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v53 = v40;
    uint64_t v54 = v42;
    sub_2287FAA78();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v51, v2);
  }
  if (*(void *)(v34 + qword_2682650B8))
  {
    swift_retain();
    sub_2287F2CD4(v30);
    return swift_release();
  }
  return result;
}

uint64_t _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC04dataG24DidUpdateSceneLuminosity_03newN0y0C3Kit0fghI0C_SdtF_0(double a1)
{
  swift_getObjectType();
  uint64_t v2 = sub_2287FA7A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA778();
  uint64_t v6 = sub_2287FA798();
  os_log_type_t v7 = sub_2287FAF68();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v8 = 136446467;
    uint64_t v10 = sub_2287FB698();
    uint64_t v13 = sub_2287F6838(v10, v11, &v14);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2053;
    uint64_t v13 = *(void *)&a1;
    sub_2287FB248();
    _os_log_impl(&dword_2287C0000, v6, v7, "%{public}s Camera luminosity updated: %{sensitive}f", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v9, -1, -1);
    MEMORY[0x22A69ED10](v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2287CF1A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + qword_268265080;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A69EDE0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_2287CF1FC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + qword_268265080;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of MedicationDataScannerDelegate.medicationDataScanner(scanner:didRecognizeSingle:fromSession:analyticsContext:analyticsEntryMode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of MedicationDataScannerDelegate.medicationDataScannerDidFinishWithoutResult(scanner:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_2287CF288()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for MedicationDataScannerViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MedicationDataScannerViewController);
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 152))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 160))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 168))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.__allocating_init(healthStore:analyticsContext:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController + v0 + 448))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.startScanning()()
{
  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 472))();
}

uint64_t sub_2287CF4A8()
{
  return type metadata accessor for MedicationDataScannerViewController();
}

void sub_2287CF4B0()
{
  if (!qword_2682651B8)
  {
    unint64_t v0 = sub_2287FA9E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682651B8);
    }
  }
}

uint64_t sub_2287CF518(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2287CFFE4(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2287CF588()
{
  uint64_t v1 = sub_2287FA308();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2287CF65C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2287FA308() - 8);
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  os_log_type_t v7 = (void *)v1[5];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_2287CBEA0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2287CF6D4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2287CF70C(uint64_t a1)
{
  sub_2287CC0A4(a1, *(void *)(v1 + 16));
}

uint64_t sub_2287CF718()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2287CF750()
{
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2287CF770(uint64_t a1)
{
  return sub_2287CB244(a1, *(void *)(v1 + 16));
}

uint64_t sub_2287CF778()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2287CF7B8(uint64_t a1)
{
  sub_2287CB4AC(a1, v1[2], v1[3], v1[4]);
}

void sub_2287CF7C4()
{
  if (!qword_2682651D8)
  {
    sub_2287CF968(255, &qword_2682651D0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE48]);
    sub_2287C5C80(255, &qword_2682651E0);
    sub_2287CF884();
    sub_2287CF900();
    unint64_t v0 = sub_2287FA968();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682651D8);
    }
  }
}

unint64_t sub_2287CF884()
{
  unint64_t result = qword_2682651E8;
  if (!qword_2682651E8)
  {
    sub_2287CF968(255, &qword_2682651D0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE48]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682651E8);
  }
  return result;
}

unint64_t sub_2287CF900()
{
  unint64_t result = qword_2682651F0;
  if (!qword_2682651F0)
  {
    sub_2287C5C80(255, &qword_2682651E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682651F0);
  }
  return result;
}

void sub_2287CF968(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2287CF9B4()
{
  uint64_t v1 = sub_2287FA768();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2287CFA80(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2287FA768() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (char *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  sub_2287C7D58(a1, v4, v5);
}

uint64_t sub_2287CFAFC()
{
  uint64_t v1 = sub_2287FA308();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2287CFBE0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2287FA308() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *unint64_t v11 = v2;
  v11[1] = sub_2287CFCF0;
  return sub_2287C88CC(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2287CFCF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2287CFDE4()
{
  uint64_t v1 = sub_2287FA308();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2287CFEB8()
{
  uint64_t v1 = *(void *)(sub_2287FA308() - 8);
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_2287C870C(v2, v3, v4);
}

id sub_2287CFF1C(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    id v4 = result;
    return (id)swift_bridgeObjectRetain();
  }
  else if (!a3)
  {
    return result;
  }
  return result;
}

void sub_2287CFF78(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {

    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

void sub_2287CFFD4()
{
}

void sub_2287CFFDC()
{
}

void sub_2287CFFE4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_2287D0048()
{
  unint64_t result = qword_268265238;
  if (!qword_268265238)
  {
    sub_2287CFFE4(255, &qword_268265230, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265238);
  }
  return result;
}

uint64_t sub_2287D00D0()
{
  uint64_t v1 = sub_2287FA308();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

void sub_2287D018C()
{
  uint64_t v1 = *(void *)(sub_2287FA308() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(char **)(v0 + v3);
  uint64_t v5 = *(void **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  sub_2287C9B50(v0 + v2, v4, v5);
}

void sub_2287D0224()
{
}

void sub_2287D0248()
{
}

void sub_2287D0250()
{
}

uint64_t sub_2287D0260()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2287D0298(unint64_t a1, void *a2)
{
  sub_2287CD274(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_2287D02A0()
{
  unint64_t result = qword_268265248;
  if (!qword_268265248)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268265248);
  }
  return result;
}

void sub_2287D02F8()
{
  if (!qword_268265250)
  {
    sub_2287CF4B0();
    sub_2287D050C(&qword_268265258, (void (*)(uint64_t))sub_2287CF4B0);
    unint64_t v0 = sub_2287FA938();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265250);
    }
  }
}

void sub_2287D038C()
{
  if (!qword_268265260)
  {
    sub_2287D02F8();
    sub_2287C5C80(255, &qword_2682651E0);
    sub_2287D050C(&qword_268265268, (void (*)(uint64_t))sub_2287D02F8);
    sub_2287CF900();
    unint64_t v0 = sub_2287FA968();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265260);
    }
  }
}

void sub_2287D0458(unsigned __int8 *a1)
{
  sub_2287C7194(a1, *(void *)(v1 + 16));
}

uint64_t sub_2287D0460()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2287D0470(uint64_t a1, void *a2)
{
  return sub_2287CD738(a1, a2);
}

void sub_2287D0478()
{
  if (!qword_268265278)
  {
    sub_2287FAC08();
    sub_2287D050C(&qword_268265280, MEMORY[0x263F1F2D0]);
    unint64_t v0 = sub_2287FB338();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265278);
    }
  }
}

uint64_t sub_2287D050C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ScanResultSelectionViewController()
{
  uint64_t result = qword_2682652B0;
  if (!qword_2682652B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2287D061C()
{
  uint64_t result = sub_2287FA308();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_2287D06E4(char *a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  *(void *)&a1[qword_2682652A8] = 0;
  id v5 = a3;

  sub_2287FB408();
  __break(1u);
}

void sub_2287D0774()
{
  uint64_t v1 = v0 + qword_268265A08;
  uint64_t v2 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_unknownObjectWeakDestroy();
  unint64_t v3 = *(void **)(v0 + qword_2682652A8);
}

id sub_2287D0830()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_2682652A8;
  unint64_t v3 = *(void **)&v0[qword_2682652A8];
  if (v3)
  {
    id v4 = v3;
    sub_2287FA218();

    unint64_t v3 = *(void **)&v1[v2];
  }
  *(void *)&v1[v2] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ScanResultSelectionViewController();
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

id sub_2287D08A8(void *a1)
{
  id v1 = a1;
  return sub_2287D0830();
}

void sub_2287D08D0(uint64_t a1)
{
  uint64_t v2 = a1 + qword_268265A08;
  uint64_t v3 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
  swift_unknownObjectWeakDestroy();
  id v4 = *(void **)(a1 + qword_2682652A8);
}

id sub_2287D0990()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ScanResultSelectionViewController();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = result;
  objc_msgSend(result, sel_setBackgroundColor_, 0);

  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = result;
  objc_msgSend(result, sel_setClipsToBounds_, 0);

  id result = objc_msgSend(v0, sel_collectionView);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v4 = result;
  objc_msgSend(result, sel_setBackgroundColor_, 0);

  id result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    id v5 = result;
    objc_msgSend(result, sel_setClipsToBounds_, 0);

    unint64_t v7 = *(void **)&v0[qword_2682652A0];
    swift_retain();
    id v6 = v7;
    sub_2287FA9C8();

    return (id)swift_release();
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_2287D0B04(void *a1)
{
  id v1 = a1;
  sub_2287D0990();
}

void sub_2287D0B4C(void *a1)
{
  uint64_t v2 = v1;
  id v4 = (void *)sub_2287FA318();
  objc_msgSend(a1, sel_deselectItemAtIndexPath_animated_, v4, 1);

  id v5 = (void *)sub_2287FA318();
  id v9 = objc_msgSend(a1, sel_cellForItemAtIndexPath_, v5);

  if (v9)
  {
    uint64_t v6 = sub_2287FA338();
    unint64_t v7 = (void *)(v6 + 1);
    if (__OFADD__(v6, 1))
    {
      __break(1u);
    }
    else
    {
      type metadata accessor for ScanResultGroupCell();
      if (swift_dynamicCastClass())
      {
        id v8 = v9;
        sub_2287D2754(v2, v7);
      }
    }
  }
}

uint64_t sub_2287D0C4C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_2287FA348();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA328();
  id v9 = a3;
  id v10 = a1;
  sub_2287D0B4C(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_2287D0D48()
{
}

void sub_2287D0D78(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2287D0DAC()
{
  return type metadata accessor for ScanResultSelectionViewController();
}

id sub_2287D0DB8()
{
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089B8]), sel_init);
  sub_2287FB078();
  sub_2287D2374(0, &qword_2682652F0, (uint64_t (*)(uint64_t))sub_2287D2D28, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287FC830;
  id v1 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  uint64_t v2 = sub_2287C5C80(0, &qword_268265300);
  id v3 = v1;
  *(void *)(inited + 40) = sub_2287FB0D8();
  id v4 = (void *)*MEMORY[0x263F81500];
  *(void *)(inited + 64) = v2;
  *(void *)(inited + 72) = v4;
  uint64_t v5 = self;
  id v6 = v4;
  id v7 = objc_msgSend(v5, sel_systemBlackColor);
  *(void *)(inited + 104) = sub_2287C5C80(0, &qword_268265308);
  *(void *)(inited + 80) = v7;
  sub_2287DC494(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F086A0]);
  id v9 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_2287D2CD0();
  id v10 = (void *)sub_2287FACF8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithString_attributes_, v9, v10);

  id v12 = v24;
  objc_msgSend(v24, sel_appendAttributedString_, v11);
  sub_2287FB0A8();
  if (v13)
  {
    sub_2287D2B78((SEL *)&selRef_systemBlackColor);
    id v14 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v15 = (void *)sub_2287FAD38();
    uint64_t v16 = (void *)sub_2287FACF8();
    swift_bridgeObjectRelease();
    uint64_t v17 = v14;
    id v12 = v24;
    id v18 = objc_msgSend(v17, sel_initWithString_attributes_, v15, v16);

    objc_msgSend(v24, (SEL)0x26484A99BLL, v18);
    sub_2287D2B78((SEL *)&selRef_systemBlackColor);
    id v19 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v20 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)sub_2287FACF8();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v19, sel_initWithString_attributes_, v20, v21);

    objc_msgSend(v24, (SEL)0x26484A99BLL, v22);
  }

  return v12;
}

uint64_t sub_2287D1140()
{
  swift_bridgeObjectRetain();
  sub_2287FADE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2287FADE8();
  swift_bridgeObjectRelease();
  id v1 = *(id *)(v0 + 32);
  sub_2287FB128();

  sub_2287FB638();
  return sub_2287FB628();
}

uint64_t sub_2287D11EC()
{
  return sub_2287FB648();
}

uint64_t sub_2287D1230()
{
  return sub_2287FB648();
}

BOOL sub_2287D126C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_2287D2680((uint64_t)v5, (uint64_t)v7);
}

uint64_t sub_2287D12C8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2287D12F8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2287D1470()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v68 = sub_2287FA7A8();
  uint64_t v2 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  id v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2287D2374(0, &qword_2682652D8, MEMORY[0x263F81EE0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v65 = (char *)&v58 - v7;
  uint64_t v8 = sub_2287FA858();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v59 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_2287FA7B8();
  uint64_t v11 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287D2374(0, &qword_2682652E0, MEMORY[0x263F81DF8], v5);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v64 = sub_2287FA7F8();
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  id v62 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_2287FA8D8();
  uint64_t v61 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  id v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (uint64_t)v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_2287D2310(v20, (uint64_t)v73);
  if (!v74)
  {
    sub_2287D22B4((uint64_t)v73);
    goto LABEL_10;
  }
  uint64_t v58 = v9;
  sub_2287D2E00(0, &qword_2682652D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    sub_2287FA778();
    id v49 = v1;
    uint64_t v50 = sub_2287FA798();
    os_log_type_t v51 = sub_2287FAF78();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      *(void *)&long long v69 = v53;
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v54 = sub_2287FB698();
      *(void *)&v75[0] = sub_2287F6838(v54, v55, (uint64_t *)&v69);
      sub_2287FB248();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      sub_2287D2310(v20, (uint64_t)v75);
      sub_2287D2248();
      uint64_t v56 = sub_2287FAD98();
      *(void *)&v75[0] = sub_2287F6838(v56, v57, (uint64_t *)&v69);
      sub_2287FB248();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2287C0000, v50, v51, "[%s] Expected a MedicationSearchItem, but received a %s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v53, -1, -1);
      MEMORY[0x22A69ED10](v52, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v68);
  }
  uint64_t v68 = v8;
  v75[0] = v69;
  v75[1] = v70;
  v75[2] = v71;
  uint64_t v76 = v72;
  sub_2287FA8C8();
  sub_2287D0DB8();
  sub_2287FA878();
  uint64_t v21 = (void (*)(long long *, void))sub_2287FA888();
  sub_2287FA868();
  v21(&v69, 0);
  sub_2287FB098();
  if (v22)
  {
    sub_2287D2B78((SEL *)&selRef_systemGrayColor);
    id v23 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v24 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_2287D2CD0();
    uint64_t v25 = (void *)sub_2287FACF8();
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(v23, sel_initWithString_attributes_, v24, v25);

    if (v26)
    {
      id v27 = v26;
      sub_2287FA898();
      uint64_t v28 = (void (*)(long long *, void))sub_2287FA8A8();
      sub_2287FA868();
      v28(&v69, 0);
      id v29 = objc_msgSend(v1, sel_traitCollection);
      id v30 = objc_msgSend(v29, sel_preferredContentSizeCategory);

      LOBYTE(v29) = sub_2287FB058();
      if (v29)
      {
        int v31 = (void (*)(long long *, void))sub_2287FA8A8();
        sub_2287FA868();
        v31(&v69, 0);
      }
    }
  }
  sub_2287FA8B8();
  uint64_t v32 = v67;
  *((void *)&v70 + 1) = v67;
  *(void *)&long long v71 = MEMORY[0x263F81F20];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v69);
  uint64_t v34 = v61;
  (*(void (**)(uint64_t *, char *, uint64_t))(v61 + 16))(boxed_opaque_existential_1, v19, v32);
  MEMORY[0x22A69E060](&v69);
  uint64_t v35 = *MEMORY[0x263F81DF0];
  uint64_t v36 = sub_2287FA7C8();
  uint64_t v37 = *(void *)(v36 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 104))(v16, v35, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v16, 0, 1, v36);
  uint64_t v38 = self;
  id v39 = objc_msgSend(v38, sel_systemMidGrayColor);
  uint64_t v40 = v62;
  sub_2287FA7E8();
  sub_2287D2374(0, &qword_2682652E8, MEMORY[0x263F81E08], MEMORY[0x263F8E0F8]);
  sub_2287FA808();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2287FC840;
  uint64_t v41 = v60;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F81DE8], v60);
  sub_2287FA7D8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v41);
  sub_2287FB0B8();
  uint64_t v42 = v59;
  sub_2287FA838();
  id v43 = objc_msgSend(v38, sel_whiteColor);
  sub_2287FA828();
  id v44 = objc_msgSend(self, sel_effectWithStyle_, 1);
  sub_2287FA818();
  uint64_t v45 = v58;
  int v46 = v65;
  uint64_t v47 = v68;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v65, v42, v68);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v47);
  MEMORY[0x22A69E070](v46);
  sub_2287D243C((uint64_t)v75);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v47);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v40, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v19, v67);
}

id sub_2287D1F9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScanResultGroupCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScanResultGroupCell()
{
  return self;
}

uint64_t sub_2287D2004@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  return sub_2287D2310(v3, a1);
}

uint64_t sub_2287D2058(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_2287D21E4(a1, v3);
  swift_endAccess();
  sub_2287D1470();
  return sub_2287D22B4(a1);
}

uint64_t (*sub_2287D20C8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2287D2128;
}

uint64_t sub_2287D2128(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_2287D1470();
  }
  return result;
}

uint64_t sub_2287D2164()
{
  return sub_2287FA418();
}

uint64_t sub_2287D21E4(uint64_t a1, uint64_t a2)
{
  sub_2287D2248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_2287D2248()
{
  if (!qword_2682652C8)
  {
    sub_2287D2E00(255, &qword_2682652D0);
    unint64_t v0 = sub_2287FB238();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682652C8);
    }
  }
}

uint64_t sub_2287D22B4(uint64_t a1)
{
  sub_2287D2248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287D2310(uint64_t a1, uint64_t a2)
{
  sub_2287D2248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2287D2374(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2287D243C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2287D2484(void *a1, void *a2, uint64_t a3)
{
  uint64_t v7 = sub_2287FA308();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v3[qword_2682652A8] = 0;
  *(void *)&v3[qword_268265298] = a1;
  *(void *)&v3[qword_2682652A0] = a2;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(&v3[qword_268265A08], a3, v7);
  v11(v10, a3, v7);
  type metadata accessor for ScanResultSelectionDataSource();
  swift_allocObject();
  id v12 = a1;
  uint64_t v13 = v3;
  id v14 = a2;
  uint64_t v15 = sub_2287F0350(v12, v10);
  uint64_t v16 = qword_268265A10;
  *(void *)&v13[qword_268265A10] = v15;

  sub_2287FA4F8();
  sub_2287D2D94();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2287FC840;
  uint64_t v18 = MEMORY[0x263F440A0];
  *(void *)(v17 + 32) = *(void *)&v13[v16];
  *(void *)(v17 + 40) = v18;
  swift_retain();
  sub_2287FA508();
  uint64_t v19 = sub_2287FA648();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a3, v7);
  return v19;
}

BOOL sub_2287D2680(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_2287FB5B8(), BOOL result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (v8 = sub_2287FB5B8(), BOOL result = 0, (v8 & 1) != 0))
    {
      sub_2287C5C80(0, &qword_268265328);
      return (sub_2287FB118() & 1) != 0
          && *(float *)(a1 + 40) == *(float *)(a2 + 40)
          && *(void *)(a1 + 48) == *(void *)(a2 + 48);
    }
  }
  return result;
}

uint64_t sub_2287D2754(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = (void *)swift_getObjectType();
  uint64_t v7 = sub_2287FA7A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t)v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_2287D2310(v11, (uint64_t)v36);
  if (v36[3])
  {
    sub_2287D2E00(0, &qword_2682652D0);
    if (swift_dynamicCast())
    {
      v33[4] = ObjectType;
      v33[1] = a2;
      id v12 = (void *)v35[1];
      id v14 = (void *)v35[3];
      uint64_t v13 = (void *)v35[4];
      type metadata accessor for ScanResultSelectionViewController();
      uint64_t v15 = swift_dynamicCastClass();
      if (v15)
      {
        uint64_t v16 = v15;
        v33[0] = v13;
        v33[2] = v14;
        v33[3] = v12;
        uint64_t v34 = v7;
        uint64_t v17 = MEMORY[0x22A69EDE0](v15 + qword_268265A18);
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          if (MEMORY[0x22A69EDE0](v17 + qword_2682659E0))
          {
            id v19 = a1;
            id v20 = v33[0];
            id v21 = objc_msgSend(v33[0], sel_specificProduct);
            sub_2287CDC5C(v18, (uint64_t)v21, v16 + qword_268265A08);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return swift_unknownObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease();
            return swift_bridgeObjectRelease();
          }
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v7 = v34;
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_2287D22B4((uint64_t)v36);
  }
  sub_2287FA778();
  id v23 = v3;
  id v24 = sub_2287FA798();
  os_log_type_t v25 = sub_2287FAF78();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v34 = v7;
    uint64_t v27 = v26;
    uint64_t v28 = swift_slowAlloc();
    v36[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    uint64_t v29 = sub_2287FB698();
    v35[0] = sub_2287F6838(v29, v30, v36);
    sub_2287FB248();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    sub_2287D2310(v11, (uint64_t)v35);
    sub_2287D2248();
    uint64_t v31 = sub_2287FAD98();
    v35[0] = sub_2287F6838(v31, v32, v36);
    sub_2287FB248();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v24, v25, "[%s] Expected a MedicationSearchItem, but received a %s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v28, -1, -1);
    MEMORY[0x22A69ED10](v27, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v34);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

unint64_t sub_2287D2B78(SEL *a1)
{
  sub_2287D2374(0, &qword_2682652F0, (uint64_t (*)(uint64_t))sub_2287D2D28, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  uint64_t v3 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_2287FC830;
  BOOL v4 = *v3;
  *(void *)(inited + 32) = *v3;
  char v5 = self;
  uint64_t v6 = *MEMORY[0x263F835F0];
  id v7 = v4;
  id v8 = objc_msgSend(v5, sel_preferredFontForTextStyle_, v6);
  uint64_t v9 = sub_2287C5C80(0, &qword_268265300);
  *(void *)(inited + 40) = v8;
  uint64_t v10 = (void *)*MEMORY[0x263F81500];
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = v10;
  uint64_t v11 = self;
  id v12 = v10;
  id v13 = [v11 *a1];
  *(void *)(inited + 104) = sub_2287C5C80(0, &qword_268265308);
  *(void *)(inited + 80) = v13;
  return sub_2287DC494(inited);
}

unint64_t sub_2287D2CD0()
{
  unint64_t result = qword_268265068;
  if (!qword_268265068)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265068);
  }
  return result;
}

void sub_2287D2D28()
{
  if (!qword_2682652F8)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2682652F8);
    }
  }
}

void sub_2287D2D94()
{
  if (!qword_268265310)
  {
    sub_2287D2E00(255, &qword_268265318);
    unint64_t v0 = sub_2287FB5A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265310);
    }
  }
}

uint64_t sub_2287D2E00(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void destroy for ScanResultGroupItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  char v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 32);
  char v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  char v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScanResultGroupItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanResultGroupItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanResultGroupItem()
{
  return &type metadata for ScanResultGroupItem;
}

unint64_t sub_2287D30B8()
{
  unint64_t result = qword_268265320;
  if (!qword_268265320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265320);
  }
  return result;
}

uint64_t sub_2287D310C()
{
  return swift_deallocClassInstance();
}

uint64_t _s31HealthMedicationsVisionUIBundleCMa()
{
  return self;
}

id sub_2287D3140()
{
  _s31HealthMedicationsVisionUIBundleCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268265A30 = (uint64_t)result;
  return result;
}

id sub_2287D31F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationDataScannerStatusView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MedicationDataScannerStatusView()
{
  return self;
}

void sub_2287D3358()
{
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___blurView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___iconView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___detailsLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___primaryButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___secondaryButton] = 0;

  sub_2287FB408();
  __break(1u);
}

uint64_t sub_2287D3400@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_2287D47E0();
  swift_allocObject();
  id v7 = a1;
  swift_retain();
  uint64_t result = sub_2287FAA18();
  *a3 = result;
  return result;
}

void sub_2287D349C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v38 = MEMORY[0x263F8EE78];
  swift_retain();
  id v9 = objc_msgSend(a3, sel_resolvedIds);
  sub_2287C5C80(0, &qword_268265220);
  unint64_t v10 = sub_2287FAE48();

  unint64_t v11 = v10 >> 62;
  if (v10 >> 62) {
    goto LABEL_21;
  }
  if (*(uint64_t *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 10) {
    uint64_t v12 = 10;
  }
  else {
    uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0 && v12 != 0)
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = v14 + 1;
        sub_2287FB368();
        uint64_t v14 = v15;
      }
      while (v12 != v15);
    }
    if (!v11)
    {
      uint64_t v16 = 0;
      uint64_t v17 = (v10 & 0xFFFFFFFFFFFFFF8) + 32;
      if (!v12) {
        break;
      }
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    sub_2287FB428();
    uint64_t v17 = v18;
    uint64_t v16 = v19;
    unint64_t v21 = v20;
    swift_bridgeObjectRelease_n();
    uint64_t v12 = v21 >> 1;
    if (v16 == v12) {
      break;
    }
LABEL_13:
    swift_unknownObjectRetain();
    unint64_t v10 = 0;
    while (v16 < v12)
    {
      *(void *)&long long aBlock = *(void *)(v17 + 8 * v16);
      sub_2287D38E8((id *)&aBlock, &v38);
      unint64_t v11 = ++v16;
      if (v12 == v16)
      {
        swift_unknownObjectRelease_n();
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_2287FB418();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2287FB418();
    swift_bridgeObjectRelease();
    if (v30 < 0) {
      goto LABEL_30;
    }
    if (v29 >= 10) {
      uint64_t v31 = 10;
    }
    else {
      uint64_t v31 = v29;
    }
    if (v29 >= 0) {
      uint64_t v12 = v31;
    }
    else {
      uint64_t v12 = 10;
    }
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_2287FB418();
    swift_bridgeObjectRelease();
    if (v32 < v12)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      return;
    }
  }
  swift_unknownObjectRelease();
LABEL_19:
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_2287D48A0;
  *(void *)(v22 + 24) = v8;
  id v23 = objc_allocWithZone(MEMORY[0x263F44BC0]);
  sub_2287C5C80(0, &qword_2682653E0);
  swift_bridgeObjectRetain();
  id v24 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_2287D48E0;
  uint64_t v37 = v22;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v34 = sub_2287F61EC;
  uint64_t v35 = &block_descriptor_1;
  os_log_type_t v25 = _Block_copy(&aBlock);
  id v26 = objc_msgSend(v23, sel_initWithScanResult_limit_resultsHandler_, v24, 10, v25);

  _Block_release(v25);
  swift_release();
  strcpy((char *)&aBlock, "scan result: ");
  HIWORD(aBlock) = -4864;
  sub_2287D4900(0, (unint64_t *)&qword_2682653E8, &qword_2682653E0);
  id v27 = v26;
  swift_bridgeObjectRetain();
  sub_2287FADB8();
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_setDebugIdentifier_, v28);

  objc_msgSend(v27, sel_setQualityOfService_, 33);
  objc_msgSend(*(id *)(a4 + 16), sel_executeQuery_, v27);
  swift_bridgeObjectRelease();
}

uint64_t sub_2287D38E8(id *a1, void *a2)
{
  id v4 = *a1;
  id v5 = objc_msgSend(*a1, sel_subHgIds);
  sub_2287C5C80(0, &qword_2682653F0);
  unint64_t v6 = sub_2287FAE48();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v7)
  {
    id v17 = objc_msgSend(v4, sel_primaryHgId);
    objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v17);
    MEMORY[0x22A69DE50]();
    if (*(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_18:
      sub_2287FAE98();
      return sub_2287FAE68();
    }
LABEL_24:
    sub_2287FAE78();
    goto LABEL_18;
  }
  id v8 = objc_msgSend(v4, sel_subHgIds);
  unint64_t v9 = sub_2287FAE48();

  unint64_t v21 = MEMORY[0x263F8EE78];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2287FB418();
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_6:
      if (v10 >= 1)
      {
        uint64_t v19 = a2;
        uint64_t v20 = v2;
        for (uint64_t i = 0; i != v10; ++i)
        {
          if ((v9 & 0xC000000000000001) != 0) {
            id v12 = (id)MEMORY[0x22A69E3A0](i, v9);
          }
          else {
            id v12 = *(id *)(v9 + 8 * i + 32);
          }
          id v13 = v12;
          id v14 = objc_msgSend(v12, sel_hgId, v19, v20);
          id v15 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v14);

          if (v15)
          {
            MEMORY[0x22A69DE50]();
            if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2287FAE78();
            }
            sub_2287FAE98();
            sub_2287FAE68();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v16 = v21;
        goto LABEL_22;
      }
      __break(1u);
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v16 = MEMORY[0x263F8EE78];
LABEL_22:
  swift_bridgeObjectRelease();
  return sub_2287DCA8C(v16);
}

void sub_2287D3BC4(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void, void), uint64_t a5)
{
  uint64_t v9 = sub_2287FA7A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v13 = a3;
    sub_2287FA778();
    id v14 = a3;
    id v15 = a3;
    unint64_t v16 = sub_2287FA798();
    os_log_type_t v17 = sub_2287FAF78();
    if (os_log_type_enabled(v16, v17))
    {
      id v27 = a4;
      uint64_t v18 = swift_slowAlloc();
      v26[2] = a5;
      uint64_t v19 = (uint8_t *)v18;
      uint64_t v20 = swift_slowAlloc();
      uint64_t v28 = (uint64_t)a3;
      uint64_t v29 = v20;
      *(_DWORD *)uint64_t v19 = 136446210;
      v26[1] = v19 + 4;
      id v21 = a3;
      sub_2287D02A0();
      uint64_t v22 = sub_2287FAD98();
      uint64_t v28 = sub_2287F6838(v22, v23, &v29);
      sub_2287FB248();
      a4 = v27;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2287C0000, v16, v17, "Failed to fetch medication clusters using the given resolver result: %{public}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69ED10](v20, -1, -1);
      MEMORY[0x22A69ED10](v19, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    id v25 = a3;
    a4(a3, 1);
  }
  else
  {
    if (a2) {
      uint64_t v24 = a2;
    }
    else {
      uint64_t v24 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRetain();
    a4(v24, 0);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2287D3E98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = sub_2287FA308();
  uint64_t v4 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287C5C80(0, &qword_268265398);
  sub_2287D4674();
  sub_2287D4750(&qword_2682653B8, (void (*)(uint64_t))sub_2287D4674);
  unint64_t v6 = sub_2287FAE88();
  uint64_t v7 = v6;
  uint64_t v8 = v6 >> 62;
  if (!(v6 >> 62))
  {
    if (*(uint64_t *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2287FB418();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_2287FB418();
  swift_bridgeObjectRelease();
  if ((v41 & 0x8000000000000000) == 0) {
    goto LABEL_58;
  }
  __break(1u);
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2287FB418();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_2287FB418();
  swift_release();
  if ((v42 & 0x8000000000000000) == 0)
  {
    if (v22 >= 3) {
      uint64_t v43 = 3;
    }
    else {
      uint64_t v43 = v22;
    }
    if (v22 >= 0) {
      uint64_t v12 = v43;
    }
    else {
      uint64_t v12 = 3;
    }
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_2287FB418();
    swift_release();
    if (v44 >= v12) {
      goto LABEL_26;
    }
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    swift_unknownObjectRelease();
LABEL_12:
    uint64_t v7 = sub_2287E8290(v12, v1, a1, v2);
    goto LABEL_19;
  }
  while (1)
  {
    __break(1u);
LABEL_58:
    uint64_t v45 = v22 >= 3 ? 3 : v22;
    uint64_t v9 = v22 >= 0 ? v45 : 3;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_2287FB418();
    uint64_t result = swift_bridgeObjectRelease();
    if (v46 < v9) {
      break;
    }
LABEL_5:
    if ((v7 & 0xC000000000000001) != 0 && v9)
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = v10 + 1;
        sub_2287FB368();
        uint64_t v10 = v11;
      }
      while (v9 != v11);
    }
    uint64_t v48 = (void *)a1;
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_2287FB428();
      uint64_t v1 = v13;
      a1 = v14;
      unint64_t v2 = v15;
      swift_bridgeObjectRelease_n();
      if ((v2 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
      a1 = 0;
      uint64_t v12 = v7 & 0xFFFFFFFFFFFFFF8;
      uint64_t v1 = (v7 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v2 = (2 * v9) | 1;
    }
    sub_2287FB5C8();
    swift_unknownObjectRetain_n();
    uint64_t v16 = swift_dynamicCastClass();
    if (!v16)
    {
      swift_unknownObjectRelease();
      uint64_t v16 = MEMORY[0x263F8EE78];
    }
    uint64_t v17 = *(void *)(v16 + 16);
    swift_release();
    if (__OFSUB__(v2 >> 1, a1)) {
      goto LABEL_54;
    }
    if (v17 != (v2 >> 1) - a1) {
      goto LABEL_55;
    }
    uint64_t v7 = swift_dynamicCastClass();
    if (!v7)
    {
      swift_unknownObjectRelease();
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
LABEL_19:
    swift_unknownObjectRelease();
    if (v7 < 0) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = ((unint64_t)v7 >> 62) & 1;
    }
    if (v8) {
      goto LABEL_45;
    }
    if (*(uint64_t *)(v7 + 16) >= 3) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = *(void *)(v7 + 16);
    }
LABEL_26:
    if ((v7 & 0xC000000000000001) != 0 && v12)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v18 + 1;
        sub_2287FB368();
        uint64_t v18 = v19;
      }
      while (v12 != v19);
    }
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_2287FB428();
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      unint64_t v26 = v25;
      swift_release_n();
      uint64_t v12 = v26 >> 1;
      uint64_t v7 = v20;
      if (v26 >> 1 == v24) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v22 = v7 + 32;
      if (!v12)
      {
LABEL_41:
        uint64_t result = swift_unknownObjectRelease();
        id v27 = (void *)MEMORY[0x263F8EE78];
LABEL_42:
        *uint64_t v48 = v27;
        return result;
      }
    }
    uint64_t v51 = type metadata accessor for ScanResultGroupCell();
    uint64_t v8 = v12 - v24;
    if (v12 > v24)
    {
      uint64_t v50 = (void (**)(char *, uint64_t))(v4 + 8);
      v47[1] = v7;
      swift_unknownObjectRetain();
      uint64_t v49 = sub_2287D4750(&qword_2682653C0, (void (*)(uint64_t))type metadata accessor for ScanResultGroupCell);
      id v27 = (void *)MEMORY[0x263F8EE78];
      uint64_t v28 = (id *)(v22 + 8 * v24);
      do
      {
        id v29 = *v28;
        uint64_t v30 = sub_2287FA3C8();
        uint64_t v32 = v31;
        int v33 = v52;
        sub_2287FA2F8();
        uint64_t v34 = sub_2287FA2E8();
        uint64_t v36 = v35;
        (*v50)(v33, v53);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v27 = sub_2287E75D4(0, v27[2] + 1, 1, v27);
        }
        unint64_t v38 = v27[2];
        unint64_t v37 = v27[3];
        if (v38 >= v37 >> 1) {
          id v27 = sub_2287E75D4((void *)(v37 > 1), v38 + 1, 1, v27);
        }
        v27[2] = v38 + 1;
        id v39 = &v27[7 * v38];
        v39[4] = v34;
        v39[5] = v36;
        v39[6] = v30;
        v39[7] = v32;
        v39[8] = v29;
        *((_DWORD *)v39 + 18) = 0;
        v39[10] = 0;
        ++v28;
        --v8;
      }
      while (v8);
      uint64_t result = swift_unknownObjectRelease_n();
      goto LABEL_42;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2287D4464@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_clinicalProducts);
  sub_2287C5C80(0, &qword_2682653C8);
  unint64_t v4 = sub_2287FAE48();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    unint64_t v11 = MEMORY[0x263F8EE78];
LABEL_12:
    uint64_t v12 = sub_2287F97A8(v11);
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v12;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2287FB418();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_11;
  }
LABEL_3:
  unint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2287FB3C8();
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x22A69E3A0](v7, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v7 + 32);
      }
      uint64_t v9 = v8;
      ++v7;
      id v10 = objc_msgSend(v8, sel_identifier);

      sub_2287FB3A8();
      sub_2287FB3D8();
      sub_2287FB3E8();
      sub_2287FB3B8();
    }
    while (v5 != v7);
    unint64_t v11 = v13;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2287D4618()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ScanResultDataProvider()
{
  return self;
}

void sub_2287D4674()
{
  if (!qword_2682653A0)
  {
    sub_2287C5C80(255, &qword_2682653A8);
    sub_2287D46E8();
    unint64_t v0 = sub_2287FAF58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682653A0);
    }
  }
}

unint64_t sub_2287D46E8()
{
  unint64_t result = qword_2682653B0;
  if (!qword_2682653B0)
  {
    sub_2287C5C80(255, &qword_2682653A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682653B0);
  }
  return result;
}

uint64_t sub_2287D4750(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2287D4798()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2287D47D8(uint64_t a1, uint64_t a2)
{
  sub_2287D349C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

void sub_2287D47E0()
{
  if (!qword_2682653D0)
  {
    sub_2287D4900(255, &qword_2682653D8, &qword_268265398);
    sub_2287D02A0();
    unint64_t v0 = sub_2287FAA08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682653D0);
    }
  }
}

uint64_t sub_2287D4868()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287D48A0(uint64_t a1, char a2)
{
  id v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

void sub_2287D48E0(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2287D3BC4(a1, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_2287D4900(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2287C5C80(255, a3);
    unint64_t v4 = sub_2287FAEA8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2287D495C(uint64_t a1)
{
  sub_2287DB5D8(a1, (uint64_t)v31);
  CGFloat v3 = *(double *)v31;
  CGFloat v4 = *(double *)&v31[1];
  CGFloat v5 = *(double *)&v31[2];
  CGFloat v6 = *(double *)&v31[3];
  uint64_t v7 = (double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  CGFloat v8 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  CGFloat v9 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 8];
  CGFloat v10 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 16];
  CGFloat v11 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 24];
  char v12 = v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32];
  sub_2287DB5D8(a1, (uint64_t)v32);
  if (v32[32])
  {
    if (v12) {
      return;
    }
  }
  else if ((v12 & 1) == 0)
  {
    v33.origin.x = v3;
    v33.origin.y = v4;
    v33.size.width = v5;
    v33.size.height = v6;
    v34.origin.x = v8;
    v34.origin.y = v9;
    v34.size.width = v10;
    v34.size.height = v11;
    if (CGRectEqualToRect(v33, v34)) {
      return;
    }
  }
  id v13 = sub_2287D4D20();
  if ((_BYTE)v7[4])
  {
    objc_msgSend(v1, sel_bounds);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v19 = v7[2];
    double v21 = v7[3];
    double v15 = *v7;
    double v17 = v7[1];
  }
  uint64_t v22 = self;
  id v23 = objc_msgSend(v22, sel_bezierPathWithRoundedRect_cornerRadius_, v15, v17, v19, v21, 44.0);
  objc_msgSend(v1, sel_bounds);
  id v24 = objc_msgSend(v22, sel_bezierPathWithRect_);
  objc_msgSend(v23, sel_appendPath_, v24);

  id v25 = objc_msgSend(v23, sel_CGPath);
  objc_msgSend(v13, sel_setPath_, v25);

  id v26 = sub_2287D4E38();
  if ((_BYTE)v7[4])
  {
    objc_msgSend(v1, sel_bounds);
  }
  else
  {
    double v29 = v7[2];
    double v30 = v7[3];
    double v27 = *v7;
    double v28 = v7[1];
  }
  objc_msgSend(v26, sel_setFrame_, v27, v28, v29, v30);
}

id sub_2287D4B58()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_effectWithStyle_, 3);
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v4);
    objc_msgSend(v5, sel_setAlpha_, 0.0);

    CGFloat v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

char *sub_2287D4C20()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView);
  if (v2)
  {
    id v3 = *(char **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_allocWithZone((Class)type metadata accessor for MedsCompletionCheckmarkView());
    CGFloat v6 = sub_2287D8D84(80.0);
    objc_msgSend(v6, sel_sizeToFit);
    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_2287D4CAC()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2287D4D20()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
    objc_msgSend(v4, sel_setFillRule_, *MEMORY[0x263F15AC0]);
    id v5 = self;
    id v6 = v4;
    id v7 = objc_msgSend(v5, sel_whiteColor);
    id v8 = objc_msgSend(v7, sel_CGColor);

    objc_msgSend(v6, sel_setBackgroundColor_, v8);
    objc_msgSend(v6, sel_setOpaque_, 0);
    CGFloat v9 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_2287D4E38()
{
  return sub_2287D9F2C(&OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer, (uint64_t (*)(void))sub_2287DB694);
}

char *sub_2287D4E58(double a1, double a2, double a3, double a4)
{
  CGFloat v9 = &v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  *(_OWORD *)CGFloat v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_borderWidth] = 0x4018000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cornerRadius] = 0x4046000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_checkmarkDiameter] = 0x4054000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_expansionAmountForOutlineBox] = 0x402C000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_animationSquishAmount] = 0x4018000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer] = 0;
  v57.receiver = v4;
  v57.super_class = (Class)type metadata accessor for CutoutView();
  id v10 = (char *)objc_msgSendSuper2(&v57, sel_initWithFrame_, a1, a2, a3, a4);
  id v11 = sub_2287D4B58();
  objc_msgSend(v10, sel_addSubview_, v11);

  id v12 = sub_2287D4B58();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  id v13 = objc_msgSend(v10, sel_layer);
  id v14 = sub_2287D4CAC();
  objc_msgSend(v13, sel_addSublayer_, v14);

  id v15 = sub_2287D4CAC();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v15, sel_setFrame_);

  id v16 = objc_msgSend(v10, sel_layer);
  id v17 = sub_2287D4E38();
  objc_msgSend(v16, sel_addSublayer_, v17);

  id v18 = sub_2287D4E38();
  double v19 = (double *)&v10[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  if (v10[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
  {
    objc_msgSend(v10, sel_bounds);
  }
  else
  {
    double v22 = v19[2];
    double v23 = v19[3];
    double v20 = *v19;
    double v21 = v19[1];
  }
  objc_msgSend(v18, sel_setFrame_, v20, v21, v22, v23);

  id v24 = sub_2287D4CAC();
  id v25 = sub_2287D4D20();
  objc_msgSend(v24, sel_setMask_, v25);

  id v26 = sub_2287D4D20();
  if ((_BYTE)v19[4])
  {
    objc_msgSend(v10, sel_bounds);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    double v32 = v19[2];
    double v34 = v19[3];
    double v28 = *v19;
    double v30 = v19[1];
  }
  uint64_t v35 = self;
  id v36 = objc_msgSend(v35, sel_bezierPathWithRoundedRect_cornerRadius_, v28, v30, v32, v34, 44.0);
  objc_msgSend(v10, sel_bounds);
  id v37 = objc_msgSend(v35, sel_bezierPathWithRect_);
  objc_msgSend(v36, sel_appendPath_, v37);

  id v38 = objc_msgSend(v36, sel_CGPath);
  objc_msgSend(v26, sel_setPath_, v38);

  id v39 = v10;
  uint64_t v40 = sub_2287D4C20();
  objc_msgSend(v39, sel_addSubview_, v40);

  uint64_t v41 = sub_2287D4C20();
  if ((_BYTE)v19[4])
  {
    objc_msgSend(v39, sel_bounds);
  }
  else
  {
    uint64_t v44 = *((void *)v19 + 2);
    uint64_t v45 = *((void *)v19 + 3);
    double v42 = *v19;
    uint64_t v43 = *((void *)v19 + 1);
  }
  double MidX = CGRectGetMidX(*(CGRect *)&v42);
  if ((_BYTE)v19[4])
  {
    objc_msgSend(v39, sel_bounds);
  }
  else
  {
    uint64_t v49 = *((void *)v19 + 2);
    uint64_t v50 = *((void *)v19 + 3);
    double v47 = *v19;
    uint64_t v48 = *((void *)v19 + 1);
  }
  objc_msgSend(v41, sel_setCenter_, MidX + 3.0, CGRectGetMidY(*(CGRect *)&v47));

  uint64_t v51 = sub_2287D4C20();
  objc_msgSend(v51, sel_setAlpha_, 0.0);

  id v52 = sub_2287D4CAC();
  id v53 = objc_msgSend(self, sel_blackColor);
  id v54 = objc_msgSend(v53, sel_colorWithAlphaComponent_, 0.28);

  id v55 = objc_msgSend(v54, sel_CGColor);
  objc_msgSend(v52, sel_setBackgroundColor_, v55);

  return v39;
}

void sub_2287D5378()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for CutoutView();
  objc_msgSendSuper2(&v14, sel_layoutSubviews);
  id v1 = sub_2287D4B58();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  uint64_t v2 = sub_2287D4C20();
  id v3 = &v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  if (v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
  {
    objc_msgSend(v0, sel_bounds);
  }
  else
  {
    uint64_t v6 = *((void *)v3 + 2);
    uint64_t v7 = *((void *)v3 + 3);
    uint64_t v4 = *(void *)v3;
    uint64_t v5 = *((void *)v3 + 1);
  }
  double MidX = CGRectGetMidX(*(CGRect *)&v4);
  if (v3[32])
  {
    objc_msgSend(v0, sel_bounds);
  }
  else
  {
    uint64_t v11 = *((void *)v3 + 2);
    uint64_t v12 = *((void *)v3 + 3);
    uint64_t v9 = *(void *)v3;
    uint64_t v10 = *((void *)v3 + 1);
  }
  objc_msgSend(v2, sel_setCenter_, MidX + 3.0, CGRectGetMidY(*(CGRect *)&v9));

  id v13 = sub_2287D4CAC();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v13, sel_setFrame_);
}

id sub_2287D5588(void *a1, uint64_t a2, SEL *a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for CutoutView();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_2287D5654(SEL *a1, SEL *a2, double a3, double a4, double a5, double a6)
{
  id v13 = (objc_class *)type metadata accessor for CutoutView();
  v33.receiver = v6;
  v33.super_class = v13;
  objc_msgSendSuper2(&v33, *a1);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v32.receiver = v6;
  v32.super_class = v13;
  objc_msgSendSuper2(&v32, *a2, a3, a4, a5, a6);
  [v6 *a1];
  v35.origin.x = v22;
  v35.origin.y = v23;
  v35.size.width = v24;
  v35.size.height = v25;
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  if (!CGRectEqualToRect(v34, v35))
  {
    id v26 = sub_2287D4E38();
    double v27 = (double *)&v6[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if (v6[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
    {
      objc_msgSend(v6, sel_bounds);
    }
    else
    {
      double v30 = v27[2];
      double v31 = v27[3];
      double v28 = *v27;
      double v29 = v27[1];
    }
    objc_msgSend(v26, sel_setFrame_, v28, v29, v30, v31);
  }
}

void sub_2287D5780(void (*a1)(), uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  sub_2287DBB74(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2287FCD50;
  sub_2287C5C80(0, &qword_2682653E0);
  *(void *)(v8 + 32) = sub_2287FB0F8();
  *(void *)(v8 + 40) = sub_2287FB0F8();
  *(void *)(v8 + 48) = sub_2287FB0F8();
  *(void *)(v8 + 56) = sub_2287FB0F8();
  sub_2287FAE68();
  uint64_t v9 = self;
  objc_msgSend(v9, sel_begin);
  objc_msgSend(v9, sel_setAnimationDuration_, a3);
  v172 = a1;
  uint64_t v173 = a2;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  v170 = sub_2287C99E0;
  v171 = &block_descriptor_101;
  uint64_t v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_setCompletionBlock_, v10);
  _Block_release(v10);
  uint64_t v11 = (double *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  if (v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
  {
    objc_msgSend(v4, sel_bounds);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v17 = v11[2];
    double v19 = v11[3];
    double v13 = *v11;
    double v15 = v11[1];
  }
  double v20 = self;
  id v21 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v13, v15, v17, v19, 44.0);
  objc_msgSend(v4, sel_bounds);
  id v22 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v21, sel_appendPath_, v22);

  id v23 = objc_msgSend(v21, sel_CGPath);
  id v160 = v9;
  if ((_BYTE)v11[4])
  {
    objc_msgSend(v4, sel_bounds);
  }
  else
  {
    uint64_t v26 = *((void *)v11 + 2);
    uint64_t v27 = *((void *)v11 + 3);
    double v24 = *v11;
    uint64_t v25 = *((void *)v11 + 1);
  }
  CGRect v174 = CGRectInset(*(CGRect *)&v24, -14.0, -14.0);
  id v28 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v174.origin.x, v174.origin.y, v174.size.width, v174.size.height, 44.0);
  objc_msgSend(v4, sel_bounds);
  id v29 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v28, sel_appendPath_, v29);

  id v30 = objc_msgSend(v28, sel_CGPath);
  if ((_BYTE)v11[4])
  {
    objc_msgSend(v4, sel_bounds);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
  }
  else
  {
    CGFloat v36 = v11[2];
    CGFloat v38 = v11[3];
    CGFloat v32 = *v11;
    CGFloat v34 = v11[1];
  }
  v175.origin.CGFloat x = v32;
  v175.origin.CGFloat y = v34;
  v175.size.CGFloat width = v36;
  v175.size.CGFloat height = v38;
  CGFloat v39 = CGRectGetWidth(v175) * 0.5 + -0.1;
  v176.origin.CGFloat x = v32;
  v176.origin.CGFloat y = v34;
  v176.size.CGFloat width = v36;
  v176.size.CGFloat height = v38;
  CGFloat v40 = CGRectGetHeight(v176) * 0.5 + -0.1;
  v177.origin.CGFloat x = v32;
  v177.origin.CGFloat y = v34;
  v177.size.CGFloat width = v36;
  v177.size.CGFloat height = v38;
  CGRect v178 = CGRectInset(v177, v39, v40);
  id v41 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v178.origin.x, v178.origin.y, v178.size.width, v178.size.height, CGRectGetWidth(v178) * 0.5);
  objc_msgSend(v4, sel_bounds);
  id v42 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v41, sel_appendPath_, v42);

  id v43 = objc_msgSend(v41, sel_CGPath);
  uint64_t v44 = (void *)sub_2287FAD38();
  id v162 = self;
  id v45 = objc_msgSend(v162, sel_animationWithKeyPath_, v44);

  sub_2287DBB74(0, (unint64_t *)&qword_2682654F8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_2287FCD60;
  type metadata accessor for CGPath(0);
  *(void *)(v46 + 32) = v23;
  *(void *)(v46 + 56) = v47;
  *(void *)(v46 + 64) = v30;
  *(void *)(v46 + 120) = v47;
  *(void *)(v46 + 88) = v47;
  *(void *)(v46 + 96) = v43;
  id v159 = v23;
  id v48 = v30;
  id v49 = v43;
  uint64_t v50 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_setValues_, v50);

  uint64_t v51 = (void *)sub_2287FAE38();
  objc_msgSend(v45, sel_setKeyTimes_, v51);

  id v52 = sub_2287D4D20();
  v161 = v45;
  id v53 = objc_msgSend(v45, sel_values);
  if (!v53) {
    goto LABEL_53;
  }
  id v54 = v53;
  uint64_t v55 = sub_2287FAE48();

  unint64_t v56 = sub_2287EE00C(v55);
  swift_bridgeObjectRelease();
  if (v56 >> 62)
  {
    swift_bridgeObjectRetain();
    objc_super v57 = (char *)sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v57 = *(char **)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v158 = v48;
  if (v57)
  {
    uint64_t v58 = v57 - 1;
    if (__OFSUB__(v57, 1))
    {
      __break(1u);
    }
    else if ((v56 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)v58 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)v58 < *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        unint64_t v59 = (char *)*(id *)(v56 + 8 * (void)v58 + 32);
LABEL_19:
        objc_super v57 = v59;
        goto LABEL_20;
      }
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    unint64_t v59 = (char *)MEMORY[0x22A69E3A0](v58, v56);
    goto LABEL_19;
  }
LABEL_20:
  swift_bridgeObjectRelease();
  objc_msgSend(v52, sel_setPath_, v57);

  id v60 = sub_2287D4D20();
  uint64_t v61 = (void *)sub_2287FAD38();
  objc_msgSend(v60, sel_addAnimation_forKey_, v161, v61);

  id v62 = (void *)sub_2287FAD38();
  id v63 = objc_msgSend(v162, sel_animationWithKeyPath_, v62);

  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_2287FCD60;
  v157 = v49;
  if (*((unsigned char *)v11 + 32) == 1)
  {
    objc_msgSend(v4, sel_bounds);
    double v66 = v65;
    uint64_t v68 = v67;
    uint64_t v70 = v69;
    uint64_t v72 = v71;
  }
  else
  {
    uint64_t v70 = *((void *)v11 + 2);
    uint64_t v72 = *((void *)v11 + 3);
    double v66 = *v11;
    uint64_t v68 = *((void *)v11 + 1);
  }
  type metadata accessor for CGRect(0);
  uint64_t v74 = v73;
  *(void *)(v64 + 56) = v73;
  v75 = (double *)swift_allocObject();
  *(void *)(v64 + 32) = v75;
  v75[2] = v66;
  *((void *)v75 + 3) = v68;
  *((void *)v75 + 4) = v70;
  *((void *)v75 + 5) = v72;
  if ((_BYTE)v11[4])
  {
    objc_msgSend(v4, sel_bounds);
  }
  else
  {
    uint64_t v78 = *((void *)v11 + 2);
    uint64_t v79 = *((void *)v11 + 3);
    double v76 = *v11;
    uint64_t v77 = *((void *)v11 + 1);
  }
  CGRect v179 = CGRectInset(*(CGRect *)&v76, -14.0, -14.0);
  CGFloat x = v179.origin.x;
  CGFloat y = v179.origin.y;
  CGFloat width = v179.size.width;
  CGFloat height = v179.size.height;
  *(void *)(v64 + 88) = v74;
  v84 = (CGFloat *)swift_allocObject();
  *(void *)(v64 + 64) = v84;
  v84[2] = x;
  v84[3] = y;
  v84[4] = width;
  v84[5] = height;
  if ((_BYTE)v11[4])
  {
    objc_msgSend(v4, sel_bounds);
    CGFloat v86 = v85;
    CGFloat v88 = v87;
    CGFloat v90 = v89;
    CGFloat v92 = v91;
  }
  else
  {
    CGFloat v90 = v11[2];
    CGFloat v92 = v11[3];
    CGFloat v86 = *v11;
    CGFloat v88 = v11[1];
  }
  v180.origin.CGFloat x = v86;
  v180.origin.CGFloat y = v88;
  v180.size.CGFloat width = v90;
  v180.size.CGFloat height = v92;
  CGFloat v93 = CGRectGetWidth(v180) * 0.5 + -0.1;
  v181.origin.CGFloat x = v86;
  v181.origin.CGFloat y = v88;
  v181.size.CGFloat width = v90;
  v181.size.CGFloat height = v92;
  CGFloat v94 = CGRectGetHeight(v181) * 0.5 + -0.1;
  v182.origin.CGFloat x = v86;
  v182.origin.CGFloat y = v88;
  v182.size.CGFloat width = v90;
  v182.size.CGFloat height = v92;
  CGRect v183 = CGRectInset(v182, v93, v94);
  CGFloat v95 = v183.origin.x;
  CGFloat v96 = v183.origin.y;
  CGFloat v97 = v183.size.width;
  CGFloat v98 = v183.size.height;
  *(void *)(v64 + 120) = v74;
  v99 = (CGFloat *)swift_allocObject();
  *(void *)(v64 + 96) = v99;
  v99[2] = v95;
  v99[3] = v96;
  v99[4] = v97;
  v99[5] = v98;
  v100 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_setValues_, v100);

  v101 = (void *)sub_2287FAE38();
  objc_msgSend(v63, sel_setKeyTimes_, v101);

  id v102 = sub_2287D4E38();
  id v103 = objc_msgSend(v63, sel_values);
  if (!v103) {
    goto LABEL_54;
  }
  v104 = v103;
  uint64_t v105 = sub_2287FAE48();

  uint64_t v106 = *(void *)(v105 + 16);
  if (v106)
  {
    sub_2287DBBD0(v105 + 32 * v106, (uint64_t)&v167);
  }
  else
  {
    long long v167 = 0u;
    long long v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v168 + 1)) {
    goto LABEL_55;
  }
  sub_2287DBC2C(&v167, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v102, sel_setBounds_, v163, v164, v165, v166);

  id v107 = sub_2287D4E38();
  v108 = (void *)sub_2287FAD38();
  objc_msgSend(v107, sel_addAnimation_forKey_, v63, v108);

  v109 = (void *)sub_2287FAD38();
  id v110 = objc_msgSend(v162, sel_animationWithKeyPath_, v109);

  uint64_t v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = xmmword_2287FCD60;
  id v112 = sub_2287D4E38();
  objc_msgSend(v112, sel_cornerRadius);
  uint64_t v114 = v113;

  uint64_t v115 = MEMORY[0x263F8EF38];
  *(void *)(v111 + 56) = MEMORY[0x263F8EF38];
  *(void *)(v111 + 32) = v114;
  id v116 = sub_2287D4E38();
  objc_msgSend(v116, sel_cornerRadius);
  uint64_t v118 = v117;

  *(void *)(v111 + 88) = v115;
  *(void *)(v111 + 64) = v118;
  if (*((unsigned char *)v11 + 32) == 1)
  {
    objc_msgSend(v4, sel_bounds);
    CGFloat v120 = v119;
    CGFloat v122 = v121;
    CGFloat v124 = v123;
    CGFloat v126 = v125;
  }
  else
  {
    CGFloat v124 = v11[2];
    CGFloat v126 = v11[3];
    CGFloat v120 = *v11;
    CGFloat v122 = v11[1];
  }
  v184.origin.CGFloat x = v120;
  v184.origin.CGFloat y = v122;
  v184.size.CGFloat width = v124;
  v184.size.CGFloat height = v126;
  CGFloat v127 = CGRectGetWidth(v184) * 0.5 + -0.1;
  v185.origin.CGFloat x = v120;
  v185.origin.CGFloat y = v122;
  v185.size.CGFloat width = v124;
  v185.size.CGFloat height = v126;
  CGFloat v128 = CGRectGetHeight(v185) * 0.5 + -0.1;
  v186.origin.CGFloat x = v120;
  v186.origin.CGFloat y = v122;
  v186.size.CGFloat width = v124;
  v186.size.CGFloat height = v126;
  CGRect v187 = CGRectInset(v186, v127, v128);
  CGFloat v129 = CGRectGetWidth(v187);
  *(void *)(v111 + 120) = v115;
  *(CGFloat *)(v111 + 96) = v129 * 0.5;
  v130 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v110, sel_setValues_, v130);

  v131 = (void *)sub_2287FAE38();
  objc_msgSend(v110, sel_setKeyTimes_, v131);

  id v132 = sub_2287D4E38();
  id v133 = objc_msgSend(v110, sel_values);
  if (!v133) {
    goto LABEL_56;
  }
  v134 = v133;
  uint64_t v135 = sub_2287FAE48();

  uint64_t v136 = *(void *)(v135 + 16);
  if (v136)
  {
    sub_2287DBBD0(v135 + 32 * v136, (uint64_t)&v167);
  }
  else
  {
    long long v167 = 0u;
    long long v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v168 + 1)) {
    goto LABEL_57;
  }
  sub_2287DBC2C(&v167, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v132, sel_setCornerRadius_, v163);

  id v137 = sub_2287D4E38();
  v138 = (void *)sub_2287FAD38();
  objc_msgSend(v137, sel_addAnimation_forKey_, v110, v138);

  v139 = (void *)sub_2287FAD38();
  id v140 = objc_msgSend(v162, sel_animationWithKeyPath_, v139);

  uint64_t v141 = swift_allocObject();
  *(_OWORD *)(v141 + 16) = xmmword_2287FCD60;
  uint64_t v142 = MEMORY[0x263F8D5C8];
  *(void *)(v141 + 56) = MEMORY[0x263F8D5C8];
  *(_DWORD *)(v141 + 32) = 1065353216;
  *(void *)(v141 + 88) = v142;
  *(_DWORD *)(v141 + 64) = 1065353216;
  *(void *)(v141 + 120) = v142;
  *(_DWORD *)(v141 + 96) = 0;
  v143 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_setValues_, v143);

  v144 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_setKeyTimes_, v144);

  id v145 = sub_2287D4E38();
  id v146 = objc_msgSend(v140, sel_values);
  if (!v146)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v147 = v146;
  uint64_t v148 = sub_2287FAE48();

  uint64_t v149 = *(void *)(v148 + 16);
  if (v149)
  {
    sub_2287DBBD0(v148 + 32 * v149, (uint64_t)&v167);
  }
  else
  {
    long long v167 = 0u;
    long long v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v168 + 1))
  {
    sub_2287DBC2C(&v167, &aBlock);
    swift_dynamicCast();
    LODWORD(v150) = LODWORD(v163);
    objc_msgSend(v145, sel_setOpacity_, v150);

    id v151 = sub_2287D4E38();
    v152 = (void *)sub_2287FAD38();
    objc_msgSend(v151, sel_addAnimation_forKey_, v140, v152);

    v153 = self;
    uint64_t v154 = swift_allocObject();
    *(void *)(v154 + 16) = v4;
    v172 = sub_2287DBC3C;
    uint64_t v173 = v154;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    v170 = sub_2287C99E0;
    v171 = &block_descriptor_110;
    v155 = _Block_copy(&aBlock);
    v156 = v4;
    swift_release();
    objc_msgSend(v153, sel_animateWithDuration_delay_options_animations_completion_, 0, v155, 0, (a3 + a3) / 3.0, a3 / 3.0);
    _Block_release(v155);
    objc_msgSend(v160, sel_commit);

    return;
  }
LABEL_59:
  __break(1u);
}

void sub_2287D6774(uint64_t a1, uint64_t a2, double a3, CGFloat a4)
{
  objc_super v5 = v4;
  if (a4 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 10.0;
  }
  sub_2287DBB74(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2287FCD70;
  sub_2287C5C80(0, &qword_2682653E0);
  *(void *)(v11 + 32) = sub_2287FB0F8();
  *(void *)(v11 + 40) = sub_2287FB0F8();
  *(void *)(v11 + 48) = sub_2287FB0F8();
  *(void *)(v11 + 56) = sub_2287FB0F8();
  *(void *)(v11 + 64) = sub_2287FB0F8();
  *(void *)&aBlock.m11 = v11;
  sub_2287FAE68();
  double v12 = self;
  objc_msgSend(v12, sel_begin);
  objc_msgSend(v12, sel_setAnimationDuration_, a3);
  id v13 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
  objc_msgSend(v12, sel_setAnimationTimingFunction_, v13);

  double v14 = (void *)swift_allocObject();
  v14[2] = v5;
  v14[3] = a1;
  v14[4] = a2;
  *(void *)&aBlock.m21 = sub_2287DBB68;
  *(void *)&aBlock.m22 = v14;
  *(void *)&aBlock.m11 = MEMORY[0x263EF8330];
  *(void *)&aBlock.m12 = 1107296256;
  *(void *)&aBlock.m13 = sub_2287C99E0;
  *(void *)&aBlock.m14 = &block_descriptor_86;
  double v15 = _Block_copy(&aBlock);
  double v16 = v5;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_setCompletionBlock_, v15);
  _Block_release(v15);
  double v17 = (double *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  id v214 = v12;
  if (v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
  {
    objc_msgSend(v16, sel_bounds);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v23 = v17[2];
    double v25 = v17[3];
    double v19 = *v17;
    double v21 = v17[1];
  }
  uint64_t v26 = self;
  id v27 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v19, v21, v23, v25, 44.0);
  objc_msgSend(v16, sel_bounds);
  id v28 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v27, sel_appendPath_, v28);

  id v29 = objc_msgSend(v27, sel_CGPath);
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v32 = *((void *)v17 + 2);
    uint64_t v33 = *((void *)v17 + 3);
    double v30 = *v17;
    uint64_t v31 = *((void *)v17 + 1);
  }
  CGRect v223 = CGRectInset(*(CGRect *)&v30, -14.0, -14.0);
  id v34 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v223.origin.x, v223.origin.y, v223.size.width, v223.size.height, 44.0);
  objc_msgSend(v16, sel_bounds);
  id v35 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v34, sel_appendPath_, v35);

  id v36 = objc_msgSend(v34, sel_CGPath);
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v39 = *((void *)v17 + 2);
    uint64_t v40 = *((void *)v17 + 3);
    double v37 = *v17;
    uint64_t v38 = *((void *)v17 + 1);
  }
  double v41 = CGRectGetMidX(*(CGRect *)&v37) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v44 = *((void *)v17 + 2);
    uint64_t v45 = *((void *)v17 + 3);
    double v42 = *v17;
    uint64_t v43 = *((void *)v17 + 1);
  }
  v224.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v42) + -40.0;
  v224.size.CGFloat width = 80.0;
  v224.origin.CGFloat x = v41;
  v224.size.CGFloat height = 80.0;
  CGRect v225 = CGRectInset(v224, 6.0, 6.0);
  double v46 = v10 + a4;
  CGRect v226 = CGRectOffset(v225, 0.0, v10 + a4);
  id v47 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v226.origin.x, v226.origin.y, v226.size.width, v226.size.height, CGRectGetWidth(v226) * 0.5);
  objc_msgSend(v16, sel_bounds);
  id v48 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v47, sel_appendPath_, v48);

  id v49 = objc_msgSend(v47, sel_CGPath);
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v52 = *((void *)v17 + 2);
    uint64_t v53 = *((void *)v17 + 3);
    double v50 = *v17;
    uint64_t v51 = *((void *)v17 + 1);
  }
  double v54 = CGRectGetMidX(*(CGRect *)&v50) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v57 = *((void *)v17 + 2);
    uint64_t v58 = *((void *)v17 + 3);
    double v55 = *v17;
    uint64_t v56 = *((void *)v17 + 1);
  }
  v227.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v55) + -40.0;
  v227.size.CGFloat width = 80.0;
  v227.origin.CGFloat x = v54;
  v227.size.CGFloat height = 80.0;
  CGRect v228 = CGRectOffset(v227, 0.0, a4);
  id v59 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v228.origin.x, v228.origin.y, v228.size.width, v228.size.height, CGRectGetWidth(v228) * 0.5);
  objc_msgSend(v16, sel_bounds);
  id v60 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v59, sel_appendPath_, v60);

  id v61 = objc_msgSend(v59, sel_CGPath);
  id v62 = (void *)sub_2287FAD38();
  id v215 = self;
  id v63 = objc_msgSend(v215, sel_animationWithKeyPath_, v62);

  sub_2287DBB74(0, (unint64_t *)&qword_2682654F8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_2287FCD80;
  type metadata accessor for CGPath(0);
  *(void *)(v64 + 32) = v29;
  *(void *)(v64 + 56) = v65;
  *(void *)(v64 + 64) = v36;
  *(void *)(v64 + 88) = v65;
  *(void *)(v64 + 96) = v49;
  *(void *)(v64 + 152) = v65;
  *(void *)(v64 + 120) = v65;
  *(void *)(v64 + 128) = v61;
  id v213 = v29;
  id v66 = v36;
  id v212 = v49;
  id v211 = v61;
  uint64_t v67 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_setValues_, v67);

  uint64_t v68 = (void *)sub_2287FAE38();
  objc_msgSend(v63, sel_setKeyTimes_, v68);

  id v69 = sub_2287D4D20();
  id v70 = objc_msgSend(v63, sel_values);
  if (!v70) {
    goto LABEL_78;
  }
  uint64_t v71 = v70;
  uint64_t v72 = sub_2287FAE48();

  unint64_t v73 = sub_2287EE00C(v72);
  swift_bridgeObjectRelease();
  if (v73 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v74 = (char *)sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v74 = *(char **)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v210 = v66;
  if (v74)
  {
    v75 = v74 - 1;
    if (__OFSUB__(v74, 1))
    {
      __break(1u);
    }
    else if ((v73 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)v75 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)v75 < *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        double v76 = (char *)*(id *)(v73 + 8 * (void)v75 + 32);
LABEL_31:
        uint64_t v74 = v76;
        goto LABEL_32;
      }
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    double v76 = (char *)MEMORY[0x22A69E3A0](v75, v73);
    goto LABEL_31;
  }
LABEL_32:
  swift_bridgeObjectRelease();
  objc_msgSend(v69, sel_setPath_, v74);

  id v77 = sub_2287D4D20();
  uint64_t v78 = (void *)sub_2287FAD38();
  objc_msgSend(v77, sel_addAnimation_forKey_, v63, v78);

  uint64_t v79 = (void *)sub_2287FAD38();
  id v80 = objc_msgSend(v215, (SEL)0x26484AA0ELL, v79);

  uint64_t v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_2287FCD80;
  if (*((unsigned char *)v17 + 32) == 1)
  {
    objc_msgSend(v16, sel_bounds);
    double v83 = v82;
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v89 = v88;
  }
  else
  {
    uint64_t v87 = *((void *)v17 + 2);
    uint64_t v89 = *((void *)v17 + 3);
    double v83 = *v17;
    uint64_t v85 = *((void *)v17 + 1);
  }
  type metadata accessor for CGRect(0);
  uint64_t v91 = v90;
  *(void *)(v81 + 56) = v90;
  CGFloat v92 = (double *)swift_allocObject();
  *(void *)(v81 + 32) = v92;
  v92[2] = v83;
  *((void *)v92 + 3) = v85;
  *((void *)v92 + 4) = v87;
  *((void *)v92 + 5) = v89;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v95 = *((void *)v17 + 2);
    uint64_t v96 = *((void *)v17 + 3);
    double v93 = *v17;
    uint64_t v94 = *((void *)v17 + 1);
  }
  CGRect v229 = CGRectInset(*(CGRect *)&v93, -14.0, -14.0);
  CGFloat x = v229.origin.x;
  CGFloat y = v229.origin.y;
  CGFloat width = v229.size.width;
  CGFloat height = v229.size.height;
  *(void *)(v81 + 88) = v91;
  v101 = (CGFloat *)swift_allocObject();
  *(void *)(v81 + 64) = v101;
  v101[2] = x;
  v101[3] = y;
  v101[4] = width;
  v101[5] = height;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v104 = *((void *)v17 + 2);
    uint64_t v105 = *((void *)v17 + 3);
    double v102 = *v17;
    uint64_t v103 = *((void *)v17 + 1);
  }
  double v106 = CGRectGetMidX(*(CGRect *)&v102) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v109 = *((void *)v17 + 2);
    uint64_t v110 = *((void *)v17 + 3);
    double v107 = *v17;
    uint64_t v108 = *((void *)v17 + 1);
  }
  v230.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v107) + -40.0;
  v230.size.CGFloat width = 80.0;
  v230.origin.CGFloat x = v106;
  v230.size.CGFloat height = 80.0;
  CGRect v231 = CGRectInset(v230, 6.0, 6.0);
  CGRect v232 = CGRectOffset(v231, 0.0, v46);
  CGFloat v111 = v232.origin.x;
  CGFloat v112 = v232.origin.y;
  CGFloat v113 = v232.size.width;
  CGFloat v114 = v232.size.height;
  *(void *)(v81 + 120) = v91;
  uint64_t v115 = (CGFloat *)swift_allocObject();
  *(void *)(v81 + 96) = v115;
  v115[2] = v111;
  v115[3] = v112;
  v115[4] = v113;
  v115[5] = v114;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v118 = *((void *)v17 + 2);
    uint64_t v119 = *((void *)v17 + 3);
    double v116 = *v17;
    uint64_t v117 = *((void *)v17 + 1);
  }
  double v120 = CGRectGetMidX(*(CGRect *)&v116) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v123 = *((void *)v17 + 2);
    uint64_t v124 = *((void *)v17 + 3);
    double v121 = *v17;
    uint64_t v122 = *((void *)v17 + 1);
  }
  v233.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v121) + -40.0;
  v233.size.CGFloat width = 80.0;
  v233.origin.CGFloat x = v120;
  v233.size.CGFloat height = 80.0;
  CGRect v234 = CGRectOffset(v233, 0.0, a4);
  CGFloat v125 = v234.origin.x;
  CGFloat v126 = v234.origin.y;
  CGFloat v127 = v234.size.width;
  CGFloat v128 = v234.size.height;
  *(void *)(v81 + 152) = v91;
  CGFloat v129 = (CGFloat *)swift_allocObject();
  *(void *)(v81 + 128) = v129;
  v129[2] = v125;
  v129[3] = v126;
  v129[4] = v127;
  v129[5] = v128;
  v130 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v80, sel_setValues_, v130);

  v131 = (void *)sub_2287FAE38();
  objc_msgSend(v80, sel_setKeyTimes_, v131);

  id v132 = sub_2287D4E38();
  id v133 = objc_msgSend(v80, sel_values);
  if (!v133) {
    goto LABEL_79;
  }
  v134 = v133;
  uint64_t v135 = sub_2287FAE48();

  uint64_t v136 = *(void *)(v135 + 16);
  if (v136)
  {
    sub_2287DBBD0(v135 + 32 * v136, (uint64_t)&v221);
  }
  else
  {
    long long v221 = 0u;
    long long v222 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v222 + 1)) {
    goto LABEL_80;
  }
  sub_2287DBC2C(&v221, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v132, sel_setBounds_, v217, v218, v219, v220);

  id v137 = sub_2287D4E38();
  v138 = (void *)sub_2287FAD38();
  v209 = v80;
  objc_msgSend(v137, sel_addAnimation_forKey_, v80, v138);

  v139 = (void *)sub_2287FAD38();
  id v140 = objc_msgSend(v215, (SEL)0x26484AA0ELL, v139);

  uint64_t v141 = swift_allocObject();
  *(_OWORD *)(v141 + 16) = xmmword_2287FCD80;
  id v142 = sub_2287D4E38();
  objc_msgSend(v142, sel_cornerRadius);
  uint64_t v144 = v143;

  uint64_t v145 = MEMORY[0x263F8EF38];
  *(void *)(v141 + 56) = MEMORY[0x263F8EF38];
  *(void *)(v141 + 32) = v144;
  id v146 = sub_2287D4E38();
  objc_msgSend(v146, sel_cornerRadius);
  uint64_t v148 = v147;

  *(void *)(v141 + 88) = v145;
  *(void *)(v141 + 64) = v148;
  if (*((unsigned char *)v17 + 32) == 1)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v151 = *((void *)v17 + 2);
    uint64_t v152 = *((void *)v17 + 3);
    double v149 = *v17;
    uint64_t v150 = *((void *)v17 + 1);
  }
  double v153 = CGRectGetMidX(*(CGRect *)&v149) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v156 = *((void *)v17 + 2);
    uint64_t v157 = *((void *)v17 + 3);
    double v154 = *v17;
    uint64_t v155 = *((void *)v17 + 1);
  }
  v235.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v154) + -40.0;
  v235.size.CGFloat width = 80.0;
  v235.origin.CGFloat x = v153;
  v235.size.CGFloat height = 80.0;
  CGRect v236 = CGRectInset(v235, 6.0, 6.0);
  CGFloat v158 = CGRectGetWidth(v236);
  *(void *)(v141 + 120) = v145;
  *(CGFloat *)(v141 + 96) = v158 * 0.5;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v161 = *((void *)v17 + 2);
    uint64_t v162 = *((void *)v17 + 3);
    double v159 = *v17;
    uint64_t v160 = *((void *)v17 + 1);
  }
  double v163 = CGRectGetMidX(*(CGRect *)&v159) + -40.0;
  if ((_BYTE)v17[4])
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    uint64_t v166 = *((void *)v17 + 2);
    uint64_t v167 = *((void *)v17 + 3);
    double v164 = *v17;
    uint64_t v165 = *((void *)v17 + 1);
  }
  v237.origin.CGFloat y = CGRectGetMidY(*(CGRect *)&v164) + -40.0;
  v237.size.CGFloat width = 80.0;
  v237.origin.CGFloat x = v163;
  v237.size.CGFloat height = 80.0;
  CGFloat v168 = CGRectGetWidth(v237);
  *(void *)(v141 + 152) = v145;
  *(CGFloat *)(v141 + 128) = v168 * 0.5;
  v169 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_setValues_, v169);

  v170 = (void *)sub_2287FAE38();
  objc_msgSend(v140, sel_setKeyTimes_, v170);

  id v171 = sub_2287D4E38();
  id v172 = objc_msgSend(v140, sel_values);
  if (!v172) {
    goto LABEL_81;
  }
  uint64_t v173 = v172;
  uint64_t v174 = sub_2287FAE48();

  uint64_t v175 = *(void *)(v174 + 16);
  if (v175)
  {
    sub_2287DBBD0(v174 + 32 * v175, (uint64_t)&v221);
  }
  else
  {
    long long v221 = 0u;
    long long v222 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v222 + 1))
  {
    sub_2287DBC2C(&v221, &aBlock);
    swift_dynamicCast();
    objc_msgSend(v171, sel_setCornerRadius_, v217);

    id v176 = sub_2287D4E38();
    CGRect v177 = (void *)sub_2287FAD38();
    objc_msgSend(v176, (SEL)0x26484AE18, v140, v177);

    CGRect v178 = (void *)sub_2287FAD38();
    id v179 = objc_msgSend(v215, (SEL)0x26484AA0ELL, v178);

    uint64_t v180 = swift_allocObject();
    *(_OWORD *)(v180 + 16) = xmmword_2287FCD80;
    uint64_t v181 = MEMORY[0x263F8D538];
    *(void *)(v180 + 32) = 0;
    *(void *)(v180 + 88) = v181;
    *(void *)(v180 + 56) = v181;
    *(void *)(v180 + 64) = 0;
    *(void *)(v180 + 120) = v181;
    *(double *)(v180 + 96) = v46;
    *(void *)(v180 + 152) = v145;
    *(CGFloat *)(v180 + 128) = a4;
    CGRect v182 = (void *)sub_2287FAE38();
    swift_bridgeObjectRelease();
    objc_msgSend(v179, sel_setValues_, v182);

    CGRect v183 = (void *)sub_2287FAE38();
    swift_bridgeObjectRelease();
    objc_msgSend(v179, sel_setKeyTimes_, v183);

    id v184 = sub_2287D4E38();
    CATransform3DMakeTranslation(&aBlock, 0.0, a4, 0.0);
    objc_msgSend(v184, sel_setTransform_, &aBlock);

    id v185 = sub_2287D4E38();
    CGRect v186 = (void *)sub_2287FAD38();
    objc_msgSend(v185, (SEL)0x26484AE18, v179, v186);

    CGRect v187 = sub_2287D4C20();
    id v188 = objc_msgSend(v187, sel_layer);

    CATransform3DMakeTranslation(&aBlock, 0.0, a4, 0.0);
    objc_msgSend(v188, sel_setTransform_, &aBlock);

    v189 = sub_2287D4C20();
    id v190 = objc_msgSend(v189, sel_layer);

    v191 = (void *)sub_2287FAD38();
    objc_msgSend(v190, (SEL)0x26484AE18, v179, v191);

    v192 = (void *)sub_2287FAD38();
    id v193 = objc_msgSend(self, (SEL)0x26484AA0ELL, v192);

    v194 = self;
    id v195 = objc_msgSend(v194, sel_clearColor);
    id v196 = objc_msgSend(v195, sel_CGColor);

    objc_msgSend(v193, sel_setFromValue_, v196);
    id v197 = objc_msgSend(v194, sel_whiteColor);
    id v198 = objc_msgSend(v197, sel_CGColor);

    objc_msgSend(v193, sel_setToValue_, v198);
    objc_msgSend(v193, sel_setDuration_, a3 / 3.0);
    id v199 = v193;
    objc_msgSend(v199, sel_setBeginTime_, a3 * 0.5 + CACurrentMediaTime());

    objc_msgSend(v199, sel_setFillMode_, *MEMORY[0x263F15AA0]);
    id v200 = sub_2287D4E38();
    id v201 = objc_msgSend(v194, sel_whiteColor);
    id v202 = objc_msgSend(v201, sel_CGColor);

    objc_msgSend(v200, sel_setBackgroundColor_, v202);
    id v203 = sub_2287D4E38();
    v204 = (void *)sub_2287FAD38();
    objc_msgSend(v203, (SEL)0x26484AE18, v199, v204);

    objc_msgSend(v214, sel_commit);
    v205 = self;
    uint64_t v206 = swift_allocObject();
    *(void *)(v206 + 16) = v16;
    *(void *)&aBlock.m21 = sub_2287DBC3C;
    *(void *)&aBlock.m22 = v206;
    *(void *)&aBlock.m11 = MEMORY[0x263EF8330];
    *(void *)&aBlock.m12 = 1107296256;
    *(void *)&aBlock.m13 = sub_2287C99E0;
    *(void *)&aBlock.m14 = &block_descriptor_98;
    v207 = _Block_copy(&aBlock);
    v208 = v16;
    swift_release();
    objc_msgSend(v205, sel_animateWithDuration_delay_options_animations_completion_, 0, v207, 0, (a3 + a3) / 3.0, a3 / 3.0);

    _Block_release(v207);
    return;
  }
LABEL_82:
  __break(1u);
}

void sub_2287D7CCC(uint64_t a1, void *a2, uint64_t a3)
{
  objc_super v5 = sub_2287D4C20();
  objc_msgSend(v5, sel_setAlpha_, 1.0);

  uint64_t v6 = sub_2287D4C20();
  sub_2287D92D8(1, a2, a3, 1.0);
}

void sub_2287D7D58(void (*a1)(id), uint64_t a2, double a3)
{
  uint64_t v7 = self;
  objc_msgSend(v7, sel_begin);
  if (a3 <= 0.0)
  {
    objc_msgSend(v7, sel_setDisableActions_, 1);
    objc_msgSend(v7, sel_setAnimationDuration_, 0.0);
    double v17 = sub_2287D4C20();
    objc_msgSend(v17, sel_setAlpha_, 0.0);

    double v18 = sub_2287D4C20();
    objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer], sel_setStrokeEnd_, 0.0);

    id v19 = sub_2287D4D20();
    double v20 = (double *)&v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if (v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
    {
      objc_msgSend(v3, sel_bounds);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
    }
    else
    {
      double v26 = v20[2];
      double v28 = v20[3];
      double v22 = *v20;
      double v24 = v20[1];
    }
    uint64_t v57 = self;
    id v58 = objc_msgSend(v57, sel_bezierPathWithRoundedRect_cornerRadius_, v22, v24, v26, v28, 44.0);
    objc_msgSend(v3, sel_bounds);
    id v59 = objc_msgSend(v57, sel_bezierPathWithRect_);
    objc_msgSend(v58, sel_appendPath_, v59);

    id v60 = objc_msgSend(v58, sel_CGPath);
    objc_msgSend(v19, sel_setPath_, v60);

    id v61 = sub_2287D4C20();
    id v62 = objc_msgSend(v61, sel_layer);

    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v62, sel_setTransform_, &aBlock);

    id v63 = sub_2287D4E38();
    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v63, sel_setTransform_, &aBlock);

    id v64 = sub_2287D4E38();
    LODWORD(v65) = 1.0;
    objc_msgSend(v64, sel_setOpacity_, v65);

    id v66 = sub_2287D4E38();
    if ((_BYTE)v20[4])
    {
      objc_msgSend(v3, sel_bounds);
    }
    else
    {
      double v69 = v20[2];
      double v70 = v20[3];
      double v67 = *v20;
      double v68 = v20[1];
    }
    objc_msgSend(v66, sel_setFrame_, v67, v68, v69, v70);

    id v77 = sub_2287D4E38();
    objc_msgSend(v77, sel_setCornerRadius_, 44.0);

    id v78 = sub_2287D4E38();
    id v79 = objc_msgSend(self, sel_clearColor);
    id v80 = objc_msgSend(v79, sel_CGColor);

    objc_msgSend(v78, sel_setBackgroundColor_, v80);
    id v81 = sub_2287D4B58();
    objc_msgSend(v81, sel_setAlpha_, 0.0);

    id v82 = objc_msgSend(v7, sel_commit);
    if (a1) {
      a1(v82);
    }
  }
  else
  {
    objc_msgSend(v7, sel_setAnimationDuration_, a3);
    if (a1)
    {
      *(void *)&aBlock.m21 = a1;
      *(void *)&aBlock.m22 = a2;
      *(void *)&aBlock.m11 = MEMORY[0x263EF8330];
      *(void *)&aBlock.m12 = 1107296256;
      *(void *)&aBlock.m13 = sub_2287C99E0;
      *(void *)&aBlock.m14 = &block_descriptor_80;
      a1 = (void (*)(id))_Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v7, sel_setCompletionBlock_, a1);
    _Block_release(a1);
    uint64_t v8 = (double *)&v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if (v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32])
    {
      objc_msgSend(v3, sel_bounds);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      double v14 = v8[2];
      double v16 = v8[3];
      double v10 = *v8;
      double v12 = v8[1];
    }
    id v29 = self;
    id v30 = objc_msgSend(v29, sel_bezierPathWithRoundedRect_cornerRadius_, v10, v12, v14, v16, 44.0);
    objc_msgSend(v3, sel_bounds);
    id v31 = objc_msgSend(v29, sel_bezierPathWithRect_);
    objc_msgSend(v30, sel_appendPath_, v31);

    id v32 = objc_msgSend(v30, sel_CGPath);
    uint64_t v33 = (void *)sub_2287FAD38();
    id v34 = self;
    id v35 = objc_msgSend(v34, sel_animationWithKeyPath_, v33);

    id v36 = sub_2287D4D20();
    id v37 = objc_msgSend(v36, sel_path);

    objc_msgSend(v35, sel_setFromValue_, v37);
    objc_msgSend(v35, sel_setToValue_, v32);
    id v38 = sub_2287D4D20();
    uint64_t v117 = v32;
    objc_msgSend(v38, sel_setPath_, v32);

    id v39 = sub_2287D4D20();
    uint64_t v40 = (void *)sub_2287FAD38();
    objc_msgSend(v39, sel_addAnimation_forKey_, v35, v40);

    double v41 = (void *)sub_2287FAD38();
    id v42 = objc_msgSend(v34, (SEL)0x26484AA0ELL, v41);

    id v43 = sub_2287D4E38();
    id v44 = objc_msgSend(v43, sel_backgroundColor);

    objc_msgSend(v42, (SEL)0x26484AEACLL, v44);
    uint64_t v45 = self;
    id v46 = objc_msgSend(v45, sel_clearColor);
    id v47 = objc_msgSend(v46, sel_CGColor);

    objc_msgSend(v42, sel_setToValue_, v47);
    id v48 = sub_2287D4E38();
    id v49 = objc_msgSend(v45, sel_clearColor);
    id v50 = objc_msgSend(v49, sel_CGColor);

    objc_msgSend(v48, sel_setBackgroundColor_, v50);
    id v51 = sub_2287D4E38();
    uint64_t v52 = (void *)sub_2287FAD38();
    objc_msgSend(v51, sel_addAnimation_forKey_, v42, v52);

    uint64_t v53 = (void *)sub_2287FAD38();
    id v54 = objc_msgSend(v34, sel_animationWithKeyPath_, v53);

    id v55 = sub_2287D4E38();
    objc_msgSend(v55, sel_bounds);

    uint64_t v56 = (void *)sub_2287FB0C8();
    objc_msgSend(v54, sel_setFromValue_, v56);

    if (*((unsigned char *)v8 + 32) == 1) {
      objc_msgSend(v3, sel_bounds);
    }
    uint64_t v71 = (void *)sub_2287FB0C8();
    objc_msgSend(v54, sel_setToValue_, v71);

    id v72 = sub_2287D4E38();
    if ((_BYTE)v8[4])
    {
      objc_msgSend(v3, sel_bounds);
    }
    else
    {
      double v75 = v8[2];
      double v76 = v8[3];
      double v73 = *v8;
      double v74 = v8[1];
    }
    objc_msgSend(v72, sel_setBounds_, v73, v74, v75, v76);

    id v83 = sub_2287D4E38();
    uint64_t v84 = (void *)sub_2287FAD38();
    objc_msgSend(v83, (SEL)0x26484AE18, v54, v84);

    uint64_t v85 = (void *)sub_2287FAD38();
    id v86 = objc_msgSend(v34, sel_animationWithKeyPath_, v85);

    id v87 = sub_2287D4E38();
    objc_msgSend(v87, sel_cornerRadius);

    uint64_t v88 = (void *)sub_2287FA358();
    objc_msgSend(v86, sel_setFromValue_, v88);

    uint64_t v89 = (void *)sub_2287FA358();
    objc_msgSend(v86, sel_setToValue_, v89);

    id v90 = sub_2287D4E38();
    objc_msgSend(v90, sel_setCornerRadius_, 44.0);

    id v91 = sub_2287D4E38();
    CGFloat v92 = (void *)sub_2287FAD38();
    objc_msgSend(v91, (SEL)0x26484AE18, v86, v92);

    double v93 = (void *)sub_2287FAD38();
    id v94 = objc_msgSend(v34, sel_animationWithKeyPath_, v93);

    id v95 = sub_2287D4E38();
    objc_msgSend(v95, sel_opacity);

    uint64_t v96 = (void *)sub_2287FAF28();
    objc_msgSend(v94, sel_setFromValue_, v96);

    CGFloat v97 = (void *)sub_2287FA358();
    objc_msgSend(v94, sel_setToValue_, v97);

    id v98 = sub_2287D4E38();
    LODWORD(v99) = 1.0;
    objc_msgSend(v98, sel_setOpacity_, v99);

    id v100 = sub_2287D4E38();
    v101 = (void *)sub_2287FAD38();
    objc_msgSend(v100, (SEL)0x26484AE18, v94, v101);

    double v102 = (void *)sub_2287FAD38();
    id v103 = objc_msgSend(v34, sel_animationWithKeyPath_, v102);

    id v104 = sub_2287D4E38();
    objc_msgSend(v104, sel_transform);

    uint64_t v105 = (void *)sub_2287FA358();
    objc_msgSend(v103, sel_setFromValue_, v105);

    double v106 = (void *)sub_2287FA358();
    objc_msgSend(v103, sel_setToValue_, v106);

    id v107 = sub_2287D4E38();
    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v107, sel_setTransform_, &aBlock);

    id v108 = sub_2287D4E38();
    uint64_t v109 = (void *)sub_2287FAD38();
    objc_msgSend(v108, (SEL)0x26484AE18, v103, v109);

    objc_msgSend(v7, sel_commit);
    uint64_t v110 = self;
    uint64_t v111 = swift_allocObject();
    *(void *)(v111 + 16) = v3;
    *(void *)&aBlock.m21 = sub_2287DBB18;
    *(void *)&aBlock.m22 = v111;
    *(void *)&aBlock.m11 = MEMORY[0x263EF8330];
    *(void *)&aBlock.m12 = 1107296256;
    *(void *)&aBlock.m13 = sub_2287C99E0;
    *(void *)&aBlock.m14 = &block_descriptor_71;
    CGFloat v112 = _Block_copy(&aBlock);
    CGFloat v113 = v3;
    swift_release();
    uint64_t v114 = swift_allocObject();
    *(void *)(v114 + 16) = v113;
    *(void *)&aBlock.m21 = sub_2287DBB20;
    *(void *)&aBlock.m22 = v114;
    *(void *)&aBlock.m11 = MEMORY[0x263EF8330];
    *(void *)&aBlock.m12 = 1107296256;
    *(void *)&aBlock.m13 = sub_2287D8C78;
    *(void *)&aBlock.m14 = &block_descriptor_77;
    uint64_t v115 = _Block_copy(&aBlock);
    double v116 = v113;
    swift_release();
    objc_msgSend(v110, sel_animateWithDuration_animations_completion_, v112, v115, a3);
    _Block_release(v115);
    _Block_release(v112);
  }
}

void sub_2287D8B44()
{
  id v0 = sub_2287D4B58();
  objc_msgSend(v0, sel_setAlpha_, 0.0);

  id v1 = sub_2287D4C20();
  objc_msgSend(v1, sel_setAlpha_, 0.0);
}

void sub_2287D8BB8()
{
  id v0 = sub_2287D4C20();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer], sel_setStrokeEnd_, 0.0);

  id v1 = sub_2287D4C20();
  id v2 = objc_msgSend(v1, sel_layer);

  CATransform3DMakeTranslation(&v3, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTransform_, &v3);
}

uint64_t sub_2287D8C78(uint64_t a1, uint64_t a2)
{
  CATransform3D v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_2287D8CCC(uint64_t a1)
{
  return sub_2287DAFDC(a1, type metadata accessor for CutoutView);
}

uint64_t type metadata accessor for CutoutView()
{
  return self;
}

char *sub_2287D8D84(double a1)
{
  uint64_t v3 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  id v4 = objc_allocWithZone(MEMORY[0x263F15880]);
  objc_super v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  *(double *)&v5[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize] = a1;

  v36.receiver = v5;
  v36.super_class = (Class)type metadata accessor for MedsCompletionCheckmarkView();
  id v6 = objc_msgSendSuper2(&v36, sel_initWithFrame_, 0.0, 0.0, a1, a1);
  id v7 = objc_msgSend(v6, sel_layer);
  objc_msgSend(v7, sel_setCornerRadius_, a1 * 0.5);

  uint64_t v8 = self;
  double v9 = (char *)v6;
  id v10 = objc_msgSend(v8, sel_clearColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824C0]), sel_init);
  double v12 = *(double *)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize];
  objc_msgSend(v11, sel_moveToPoint_, v12 * 0.31, v12 * 0.52);
  objc_msgSend(v11, sel_addLineToPoint_, v12 * 0.44, v12 * 0.66);
  objc_msgSend(v11, sel_addLineToPoint_, v12 * 0.62, v12 * 0.34);
  objc_msgSend(v11, sel_setLineCapStyle_, 1);
  uint64_t v13 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  id v14 = *(id *)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer];
  id v15 = objc_msgSend(v11, sel_CGPath);
  objc_msgSend(v14, sel_setPath_, v15);

  double v16 = *(void **)&v9[v13];
  objc_msgSend(v16, sel_setLineWidth_, a1 * 0.1);
  objc_msgSend(v16, sel_setLineCap_, *MEMORY[0x263F15E70]);
  objc_msgSend(v16, sel_setLineJoin_, *MEMORY[0x263F15E98]);
  id v17 = v16;
  id v18 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v18, sel_bounds);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  objc_msgSend(v17, sel_setFrame_, v20, v22, v24, v26);
  id v27 = *(id *)&v9[v13];
  id v28 = objc_msgSend(v8, sel_systemBlueColor);
  id v29 = objc_msgSend(v28, sel_CGColor);

  objc_msgSend(v27, sel_setStrokeColor_, v29);
  id v30 = *(id *)&v9[v13];
  id v31 = objc_msgSend(v8, sel_clearColor);
  id v32 = objc_msgSend(v31, sel_CGColor);

  objc_msgSend(v30, sel_setBackgroundColor_, v32);
  uint64_t v33 = *(void **)&v9[v13];
  objc_msgSend(v33, sel_setFillColor_, 0);
  id v34 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v34, sel_addSublayer_, v33);

  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v9;
}

void sub_2287D92D8(char a1, void *a2, uint64_t a3, double a4)
{
  if (a1)
  {
    uint64_t v8 = self;
    objc_msgSend(v8, sel_begin);
    objc_msgSend(v8, sel_setAnimationDuration_, 0.3);
    if (a2)
    {
      v23[4] = a2;
      v23[5] = a3;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 1107296256;
      v23[2] = sub_2287C99E0;
      v23[3] = &block_descriptor_65;
      a2 = _Block_copy(v23);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v8, sel_setCompletionBlock_, a2);
    _Block_release(a2);
    id v9 = objc_allocWithZone(MEMORY[0x263F15808]);
    LODWORD(v10) = 1043928040;
    LODWORD(v11) = 1058272560;
    LODWORD(v12) = 1063980840;
    id v13 = objc_msgSend(v9, sel_initWithControlPoints__::, v10, 0.0, v11, v12);
    id v14 = (void *)sub_2287FAD38();
    id v15 = objc_msgSend(self, sel_animationWithKeyPath_, v14);

    objc_msgSend(v15, sel_setTimingFunction_, v13);
    objc_msgSend(v15, sel_setFillMode_, *MEMORY[0x263F15AA8]);
    id v16 = v15;
    id v17 = (void *)sub_2287FA358();
    objc_msgSend(v16, sel_setFromValue_, v17);

    id v18 = v16;
    double v19 = (void *)sub_2287FA358();
    objc_msgSend(v18, sel_setToValue_, v19);

    double v20 = *(void **)(v4
                   + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer);
    objc_msgSend(v20, sel_setStrokeEnd_, a4);
    double v21 = (void *)sub_2287FAD38();
    objc_msgSend(v20, sel_addAnimation_forKey_, v18, v21);

    objc_msgSend(v8, sel_commit);
  }
  else
  {
    double v22 = *(void **)(v4
                   + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer);
    objc_msgSend(v22, sel_setStrokeEnd_);
  }
}

id sub_2287D95EC()
{
  return sub_2287DAFDC(0, type metadata accessor for MedsCompletionCheckmarkView);
}

uint64_t type metadata accessor for MedsCompletionCheckmarkView()
{
  return self;
}

id sub_2287D963C()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_effectWithStyle_, 2);
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v4);

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    id v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_2287D96EC()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
    id v5 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    objc_msgSend(v4, sel_setTextAlignment_, 1);
    id v6 = self;
    sub_2287FAD68();
    id v7 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v6, sel_hk_preferredFontForTextStyle_symbolicTraits_, v7, 2);

    objc_msgSend(v4, sel_setFont_, v8);
    id v9 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_2287D9830(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_xInset] = 0x4028000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_yInset] = 0x4000000000000000;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label] = 0;
  v17.receiver = v4;
  v17.super_class = (Class)type metadata accessor for LabelWithBackground();
  id v9 = objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setClipsToBounds_, 1);
  id v10 = v9;
  id v11 = sub_2287D963C();
  objc_msgSend(v10, sel_addSubview_, v11);

  id v12 = sub_2287D963C();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  id v13 = v10;
  id v14 = sub_2287D96EC();
  objc_msgSend(v13, sel_addSubview_, v14);

  id v15 = sub_2287D96EC();
  objc_msgSend(v13, sel_bounds);
  CGRect v19 = CGRectInset(v18, 12.0, 2.0);
  objc_msgSend(v15, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

  return v13;
}

id sub_2287D9BA8()
{
  return sub_2287DAFDC(0, type metadata accessor for LabelWithBackground);
}

uint64_t type metadata accessor for LabelWithBackground()
{
  return self;
}

double sub_2287D9C34()
{
  if (objc_msgSend(self, sel_isAppleInternalInstall)
    && (id v1 = objc_msgSend(self, sel_standardUserDefaults),
        sub_2287FADC8(),
        id v2 = (void *)sub_2287FAD38(),
        swift_bridgeObjectRelease(),
        unsigned __int8 v3 = objc_msgSend(v1, sel_BOOLForKey_, v2),
        v1,
        v2,
        (v3 & 1) != 0))
  {
    objc_msgSend(v0, sel_bounds);
    return v4;
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    CGRectGetHeight(v27);
    sub_2287FA598();
    double v7 = v6;
    objc_msgSend(v0, sel_bounds);
    double v8 = CGRectGetWidth(v28) - (v7 + v7);
    id v9 = objc_msgSend(v0, sel_traitCollection);
    id v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);

    char v11 = sub_2287FB058();
    double v5 = 44.0;
    if (v11) {
      double v12 = 52.0;
    }
    else {
      double v12 = 44.0;
    }
    double v13 = v7;
    uint64_t v14 = 0x4060000000000000;
    double v15 = v8;
    CGRectGetMaxY(*(CGRect *)(&v12 - 3));
    sub_2287FA598();
    double v17 = v16;
    objc_msgSend(v0, sel_bounds);
    double v18 = CGRectGetWidth(v29) - (v17 + v17);
    id v19 = objc_msgSend(v0, sel_traitCollection);
    id v20 = objc_msgSend(v19, sel_preferredContentSizeCategory);

    char v21 = sub_2287FB058();
    if (v21) {
      double v22 = 52.0;
    }
    else {
      double v22 = 44.0;
    }
    double v23 = v17;
    uint64_t v24 = 0x4060000000000000;
    double v25 = v18;
    CGRectGetMaxY(*(CGRect *)(&v22 - 3));
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v30);
  }
  return v5;
}

uint64_t sub_2287D9E98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  return v1;
}

id sub_2287D9F0C()
{
  return sub_2287D9F2C(&OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel, (uint64_t (*)(void))sub_2287D9F8C);
}

id sub_2287D9F2C(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  double v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    double v6 = (void *)a2();
    double v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    double v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_2287D9F8C()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LabelWithBackground()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v1, sel_setCornerRadius_, 8.0);

  id v2 = sub_2287D96EC();
  objc_msgSend(v2, sel_setNumberOfLines_, 2);

  id v3 = sub_2287D96EC();
  objc_msgSend(v3, sel_setAdjustsFontSizeToFitWidth_, 1);

  if (qword_268264EF8 != -1) {
    swift_once();
  }
  sub_2287FA208();
  id v4 = sub_2287D96EC();
  id v5 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v5, 0xE000000000000000);

  id v6 = sub_2287D96EC();
  objc_msgSend(v0, sel_bounds);
  CGRect v9 = CGRectInset(v8, 12.0, 2.0);
  objc_msgSend(v6, sel_setFrame_, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);

  return v0;
}

id sub_2287DA14C()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle);
  }
  else
  {
    type metadata accessor for CutoutView();
    id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2287DA1C0(double a1, double a2, double a3, double a4)
{
  sub_2287DB1EC(0, &qword_2682654B0, MEMORY[0x263EFDE58]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  double v13 = (char *)&v48 - v12;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay_cancellables] = MEMORY[0x263F8EE88];
  uint64_t v14 = &v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title];
  uint64_t v15 = qword_268264EF8;
  double v16 = v4;
  if (v15 != -1) {
    swift_once();
  }
  v50[0] = sub_2287FA208();
  v50[1] = v17;
  sub_2287DBB74(0, &qword_2682654B8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
  sub_2287FAA48();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  *(void *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel] = 0;
  *(void *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle] = 0;

  double v18 = (objc_class *)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
  v49.receiver = v16;
  v49.super_class = v18;
  id v19 = objc_msgSendSuper2(&v49, sel_initWithFrame_, a1, a2, a3, a4);
  id v20 = self;
  id v21 = v19;
  id v22 = objc_msgSend(v20, sel_clearColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  if (!objc_msgSend(self, sel_isAppleInternalInstall)
    || (id v23 = objc_msgSend(self, sel_standardUserDefaults),
        sub_2287FADC8(),
        uint64_t v24 = (void *)sub_2287FAD38(),
        swift_bridgeObjectRelease(),
        unsigned __int8 v25 = objc_msgSend(v23, sel_BOOLForKey_, v24),
        v23,
        v24,
        (v25 & 1) == 0))
  {
    id v26 = v21;
    id v27 = sub_2287DA14C();
    objc_msgSend(v26, sel_addSubview_, v27);

    id v28 = v26;
    id v29 = sub_2287D9F0C();
    objc_msgSend(v28, sel_addSubview_, v29);

    id v30 = sub_2287D9F0C();
    sub_2287FA598();
    double v32 = v31;
    objc_msgSend(v28, sel_bounds);
    double v33 = CGRectGetWidth(v51) - (v32 + v32);
    id v34 = objc_msgSend(v28, sel_traitCollection);
    id v35 = objc_msgSend(v34, sel_preferredContentSizeCategory);

    LOBYTE(v34) = sub_2287FB058();
    if (v34) {
      double v36 = 52.0;
    }
    else {
      double v36 = 44.0;
    }
    objc_msgSend(v30, sel_setFrame_, v32, 128.0, v33, v36);

    id v37 = sub_2287DA14C();
    objc_msgSend(v28, sel_bounds);
    objc_msgSend(v37, sel_setFrame_);

    id v38 = (char *)sub_2287DA14C();
    double v39 = sub_2287D9C34();
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    id v46 = &v38[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    sub_2287DB5D8((uint64_t)&v38[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame], (uint64_t)v50);
    *(double *)id v46 = v39;
    *((void *)v46 + 1) = v41;
    *((void *)v46 + 2) = v43;
    *((void *)v46 + 3) = v45;
    v46[32] = 0;
    sub_2287D495C((uint64_t)v50);
  }
  sub_2287DAA78();

  return v21;
}

void sub_2287DA6AC()
{
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
  objc_msgSendSuper2(&v18, sel_layoutSubviews);
  id v1 = sub_2287D9F0C();
  sub_2287FA598();
  double v3 = v2;
  objc_msgSend(v0, sel_bounds);
  double v4 = CGRectGetWidth(v20) - (v3 + v3);
  id v5 = objc_msgSend(v0, sel_traitCollection);
  id v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  LOBYTE(v5) = sub_2287FB058();
  if (v5) {
    double v7 = 52.0;
  }
  else {
    double v7 = 44.0;
  }
  objc_msgSend(v1, sel_setFrame_, v3, 128.0, v4, v7);

  id v8 = sub_2287DA14C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v8, sel_setFrame_);

  uint64_t v9 = (char *)sub_2287DA14C();
  double v10 = sub_2287D9C34();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = &v9[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  sub_2287DB5D8((uint64_t)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame], (uint64_t)v19);
  *(double *)uint64_t v17 = v10;
  *((void *)v17 + 1) = v12;
  *((void *)v17 + 2) = v14;
  *((void *)v17 + 3) = v16;
  v17[32] = 0;
  sub_2287D495C((uint64_t)v19);
}

void sub_2287DA884(uint64_t a1, uint64_t a2, double a3)
{
  double v4 = v3;
  objc_msgSend(v3, sel_bounds);
  double MidY = CGRectGetMidY(v18);
  v19.origin.CGFloat x = sub_2287D9C34();
  double v9 = MidY - CGRectGetMidY(v19);
  sub_2287FA6A8();
  CGFloat v11 = v9 + v10;
  id v12 = sub_2287DA14C();
  sub_2287D6774(a1, a2, a3, v11);

  uint64_t v13 = self;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v4;
  v17[4] = sub_2287DB49C;
  v17[5] = v14;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_2287C99E0;
  v17[3] = &block_descriptor_2;
  uint64_t v15 = _Block_copy(v17);
  id v16 = v4;
  swift_release();
  objc_msgSend(v13, sel_animateWithDuration_animations_, v15, a3);
  _Block_release(v15);
}

void sub_2287DA9D0()
{
  id v0 = sub_2287D9F0C();
  objc_msgSend(v0, sel_setAlpha_, 0.0);
}

void sub_2287DAA24()
{
  id v0 = sub_2287D9F0C();
  objc_msgSend(v0, sel_setAlpha_, 1.0);
}

uint64_t sub_2287DAA78()
{
  uint64_t v17 = sub_2287FB218();
  uint64_t v0 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  double v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287DB1EC(0, &qword_2682654C0, MEMORY[0x263EFDE48]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v7 = (char *)&v15 - v6;
  sub_2287DB270();
  uint64_t v16 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  CGFloat v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_2287DB1EC(0, &qword_2682654B0, MEMORY[0x263EFDE58]);
  sub_2287FAA58();
  swift_endAccess();
  sub_2287FB208();
  id v12 = objc_msgSend(self, sel_mainRunLoop);
  id v18 = v12;
  sub_2287C5C80(0, &qword_2682654D0);
  sub_2287DB328();
  sub_2287DB39C();
  sub_2287FAAD8();

  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v17);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2287DB444();
  uint64_t v13 = v16;
  sub_2287FAB08();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v13);
  swift_beginAccess();
  sub_2287FA988();
  swift_endAccess();
  return swift_release();
}

void sub_2287DAE04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A69EDE0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = sub_2287D9F0C();
    swift_bridgeObjectRetain();
    id v7 = sub_2287D96EC();
    if (v2)
    {
      uint64_t v8 = (void *)sub_2287FAD38();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_msgSend(v7, sel_setText_, v8);

    id v9 = sub_2287D96EC();
    objc_msgSend(v6, sel_bounds);
    CGRect v18 = CGRectInset(v17, 12.0, 2.0);
    objc_msgSend(v9, sel_setFrame_, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

    id v10 = sub_2287D9F0C();
    sub_2287FA598();
    double v12 = v11;
    objc_msgSend(v5, sel_bounds);
    double v13 = CGRectGetWidth(v19) - (v12 + v12);
    id v14 = objc_msgSend(v5, sel_traitCollection);
    id v15 = objc_msgSend(v14, sel_preferredContentSizeCategory);

    LOBYTE(v14) = sub_2287FB058();
    if (v14) {
      double v16 = 52.0;
    }
    else {
      double v16 = 44.0;
    }
    objc_msgSend(v10, sel_setFrame_, v12, 128.0, v13, v16);
  }
}

id sub_2287DAFC0()
{
  return sub_2287DAFDC(0, type metadata accessor for MedicationDataScannerRegionOfInterestOverlay);
}

id sub_2287DAFDC(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2287DB0D0()
{
  return type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
}

uint64_t type metadata accessor for MedicationDataScannerRegionOfInterestOverlay()
{
  uint64_t result = qword_2682654A0;
  if (!qword_2682654A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2287DB124()
{
  sub_2287DB1EC(319, &qword_2682654B0, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2287DB1EC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_2287DBB74(255, &qword_2682654B8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_2287DB270()
{
  if (!qword_2682654C8)
  {
    sub_2287DB1EC(255, &qword_2682654C0, MEMORY[0x263EFDE48]);
    sub_2287C5C80(255, &qword_2682654D0);
    sub_2287DB328();
    sub_2287DB39C();
    unint64_t v0 = sub_2287FA958();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682654C8);
    }
  }
}

unint64_t sub_2287DB328()
{
  unint64_t result = qword_2682654D8;
  if (!qword_2682654D8)
  {
    sub_2287DB1EC(255, &qword_2682654C0, MEMORY[0x263EFDE48]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682654D8);
  }
  return result;
}

unint64_t sub_2287DB39C()
{
  unint64_t result = qword_2682654E0;
  if (!qword_2682654E0)
  {
    sub_2287C5C80(255, &qword_2682654D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682654E0);
  }
  return result;
}

uint64_t sub_2287DB404()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2287DB43C(uint64_t a1)
{
  sub_2287DAE04(a1, v1);
}

unint64_t sub_2287DB444()
{
  unint64_t result = qword_2682654E8;
  if (!qword_2682654E8)
  {
    sub_2287DB270();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682654E8);
  }
  return result;
}

void sub_2287DB49C()
{
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

double sub_2287DB4D0@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2287DB554(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_2287FAA78();
}

uint64_t sub_2287DB5D8(uint64_t a1, uint64_t a2)
{
  sub_2287DB63C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2287DB63C()
{
  if (!qword_2682654F0)
  {
    type metadata accessor for CGRect(255);
    unint64_t v0 = sub_2287FB238();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682654F0);
    }
  }
}

id sub_2287DB694()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_clearColor);
  id v3 = objc_msgSend(v2, sel_CGColor);

  objc_msgSend(v0, sel_setBackgroundColor_, v3);
  objc_msgSend(v0, sel_setBorderWidth_, 6.0);
  id v4 = objc_msgSend(v1, sel_whiteColor);
  id v5 = objc_msgSend(v4, sel_colorWithAlphaComponent_, 0.8);

  id v6 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(v0, sel_setBorderColor_, v6);

  objc_msgSend(v0, sel_setCornerRadius_, 44.0);
  objc_msgSend(v0, sel_setCornerCurve_, *MEMORY[0x263F15A20]);
  return v0;
}

void sub_2287DB7F8()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_borderWidth] = 0x4018000000000000;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cornerRadius] = 0x4046000000000000;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_checkmarkDiameter] = 0x4054000000000000;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_expansionAmountForOutlineBox] = 0x402C000000000000;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_animationSquishAmount] = 0x4018000000000000;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer] = 0;

  sub_2287FB408();
  __break(1u);
}

void sub_2287DB8FC()
{
  sub_2287DB1EC(0, &qword_2682654B0, MEMORY[0x263EFDE58]);
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v5 = (char *)v8 - v4;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay_cancellables] = MEMORY[0x263F8EE88];
  uint64_t v6 = OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title;
  if (qword_268264EF8 != -1) {
    swift_once();
  }
  v8[0] = sub_2287FA208();
  v8[1] = v7;
  sub_2287DBB74(0, &qword_2682654B8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
  sub_2287FAA48();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v0[v6], v5, v2);
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle] = 0;

  sub_2287FB408();
  __break(1u);
}

void sub_2287DBB18()
{
}

void sub_2287DBB20()
{
}

uint64_t sub_2287DBB28()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2287DBB68()
{
  sub_2287D7CCC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

void sub_2287DBB74(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2287DBBC0()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2287DBBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_2287DBC2C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_2287DBC3C()
{
}

void sub_2287DBC58(uint64_t (*a1)(void), double a2)
{
  id v3 = (id)a1();
  objc_msgSend(v3, sel_setAlpha_, a2);
}

uint64_t sub_2287DBCBC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2287DBD44()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView;
  long long v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F30700]), sel_init);
    objc_msgSend(v4, sel_setShape_, 1);
    objc_msgSend(v4, sel_setHidden_, 1);
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    long long v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2287DBDE0()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView;
  long long v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
    objc_msgSend(v4, sel_setHidden_, 1);
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    long long v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2287DBE68(double a1, double a2, double a3, double a4)
{
  v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ReticleView();
  id v9 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  id v10 = sub_2287DBD44();
  objc_msgSend(v9, sel_addSubview_, v10);

  id v11 = v9;
  id v12 = sub_2287DBDE0();
  objc_msgSend(v11, sel_addSubview_, v12);

  return v11;
}

void sub_2287DC014()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for ReticleView();
  objc_msgSendSuper2(&v9, sel_layoutSubviews);
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect) & 1) == 0)
  {
    objc_msgSend(v0, sel_bounds);
    CGFloat x = v10.origin.x;
    CGFloat y = v10.origin.y;
    CGFloat width = v10.size.width;
    CGFloat height = v10.size.height;
    double MidX = CGRectGetMidX(v10);
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    double v6 = CGRectGetMidX(v11);
    id v7 = sub_2287DBD44();
    objc_msgSend(v7, sel_setFrame_, MidX, v6, 0.0, 0.0);

    id v8 = sub_2287DBDE0();
    objc_msgSend(v8, sel_setFrame_, MidX, v6, 0.0, 0.0);
  }
}

id sub_2287DC154()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReticleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ReticleView()
{
  return self;
}

void *sub_2287DC1F8(uint64_t a1)
{
  sub_2287ED930(0, &qword_268265810, MEMORY[0x263F07508]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v6 = (char *)&v24 - v5;
  if (!*(void *)(a1 + 16))
  {
    id v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_11;
  }
  sub_2287ED430();
  id v7 = (void *)sub_2287FB458();
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return v7;
  }
  uint64_t v9 = *(int *)(v3 + 48);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v24 = a1;
  uint64_t v27 = *(void *)(v4 + 72);
  swift_retain();
  sub_2287ED56C(a1 + v10, (uint64_t)v6, &qword_268265810, MEMORY[0x263F07508]);
  unint64_t v11 = sub_2287E7C14((uint64_t)v6);
  if (v12)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    swift_release();
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  id v26 = &v6[v9];
  uint64_t v25 = sub_2287FA308();
  uint64_t v14 = *(void *)(v25 - 8);
  id v15 = *(void (**)(unint64_t, char *, uint64_t))(v14 + 32);
  uint64_t v16 = *(void *)(v14 + 72);
  uint64_t v17 = v24 + v27 + v10;
  while (1)
  {
    *(void *)((char *)v7 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v13;
    v15(v7[6] + v16 * v13, v6, v25);
    double result = memmove((void *)(v7[7] + 168 * v13), v26, 0xA8uLL);
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      break;
    }
    v7[2] = v21;
    if (!--v8) {
      goto LABEL_9;
    }
    uint64_t v22 = v17 + v27;
    sub_2287ED56C(v17, (uint64_t)v6, &qword_268265810, MEMORY[0x263F07508]);
    unint64_t v13 = sub_2287E7C14((uint64_t)v6);
    uint64_t v17 = v22;
    if (v23) {
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2287DC494(uint64_t a1)
{
  return sub_2287DC4C8(a1, (void (*)(void))sub_2287ED4CC, (unint64_t *)&qword_2682652F8, type metadata accessor for Key);
}

unint64_t sub_2287DC4C8(uint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  a2(0);
  uint64_t v7 = sub_2287FB458();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2287ED56C(v11, (uint64_t)&v18, a3, a4);
    uint64_t v12 = v18;
    unint64_t result = sub_2287E7DE4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_2287DBC2C(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    void v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

unint64_t sub_2287DC614(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2287ED99C(0, &qword_2682657E8, MEMORY[0x263F8D310], MEMORY[0x263F8DFB0]);
  uint64_t v2 = (void *)sub_2287FB458();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2287E7D6C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_2287DC758(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2287ED99C(0, &qword_268265818, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8DFB0]);
  uint64_t v2 = sub_2287FB458();
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
    sub_2287ED9F8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2287E7D6C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2287DBC2C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2287DC8A8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_2287E7848(isUniquelyReferenced_nonNull_native, v23, 1, v3, &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_2287FA278() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287DCA8C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2287FB418();
    swift_bridgeObjectRelease();
    uint64_t v5 = v20 + v3;
    if (!__OFADD__(v20, v3)) {
      goto LABEL_5;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = v4 + v3;
  if (__OFADD__(v4, v3)) {
    goto LABEL_26;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  uint64_t v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v8 = 1;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 <= v5) {
    uint64_t v10 = v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = MEMORY[0x22A69E3B0](v8, v10, 1, v6);
  swift_bridgeObjectRelease();
  *uint64_t v1 = v11;
  uint64_t v9 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
  uint64_t v12 = *(void *)(v9 + 16);
  uint64_t v13 = (*(void *)(v9 + 24) >> 1) - v12;
  uint64_t result = sub_2287EBAC0(v9 + 8 * v12 + 32, v13, a1);
  if (v15 < v3)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    sub_2287ED1FC();
    goto LABEL_20;
  }
  uint64_t v16 = v15;
  if (v15 >= 1)
  {
    uint64_t v17 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v18 = __OFADD__(v17, v15);
    uint64_t v19 = v17 + v15;
    if (v18)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
  }
  swift_bridgeObjectRelease();
  if (v16 == v13) {
    goto LABEL_28;
  }
LABEL_20:
  return sub_2287FAE68();
}

uint64_t ScanningAnalyticsWrapper.timeSinceUserLastScannedAMed.getter()
{
  return *(void *)v0;
}

uint64_t ScanningAnalyticsWrapper.didLastScanFallBackToOCR.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t ScanningAnalyticsWrapper.itemLevelRankOfMatchInOCRList.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ScanningSystemState.dataSaturated.getter()
{
  return *v0;
}

double ScanningSystemState.sessionStartTime.getter()
{
  return *(double *)(v0 + 8);
}

double ScanningSystemState.sessionEndTime.getter()
{
  return *(double *)(v0 + 16);
}

double ScanningSystemState.lastItemUpdateTime.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t ScanningSystemState.resolutionCounter.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t ScanningSystemState.filterCompleteTime.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t ScanningSystemState.filterCompleteTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 40) = result;
  *(unsigned char *)(v2 + 48) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.filterCompleteTime.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSystemState.stateChangeTime.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t ScanningSystemState.stateChangeTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 56) = result;
  *(unsigned char *)(v2 + 64) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.stateChangeTime.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSystemState.resultOnScreenTime.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t ScanningSystemState.resultOnScreenTime.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 72) = result;
  *(unsigned char *)(v2 + 80) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.resultOnScreenTime.modify())()
{
  return nullsub_1;
}

unint64_t sub_2287DCD6C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x456E6F6973736573;
      break;
    case 3:
    case 5:
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0x6168436574617473;
      break;
    default:
      unint64_t result = 0x7574615361746164;
      break;
  }
  return result;
}

unint64_t sub_2287DCE90()
{
  return sub_2287DCD6C(*v0);
}

uint64_t sub_2287DCE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2287EC4CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2287DCEC0()
{
  return 0;
}

void sub_2287DCECC(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_2287DCED8(uint64_t a1)
{
  unint64_t v2 = sub_2287DD234();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2287DCF14(uint64_t a1)
{
  unint64_t v2 = sub_2287DD234();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ScanningSystemState.encode(to:)(void *a1)
{
  sub_2287E71B0(0, &qword_268265520, (uint64_t (*)(void))sub_2287DD234, (uint64_t)&type metadata for ScanningSystemState.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v12 - v6;
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v17 = *(void *)(v1 + 40);
  uint64_t v18 = v8;
  LODWORD(v8) = *(unsigned __int8 *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  int v15 = *(unsigned __int8 *)(v1 + 64);
  int v16 = v8;
  uint64_t v13 = *(void *)(v1 + 72);
  uint64_t v14 = v9;
  v12[1] = *(unsigned __int8 *)(v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287DD234();
  sub_2287FB668();
  char v27 = 0;
  uint64_t v10 = v19;
  sub_2287FB548();
  if (!v10)
  {
    char v26 = 1;
    sub_2287FB558();
    char v25 = 2;
    sub_2287FB558();
    char v24 = 3;
    sub_2287FB558();
    char v23 = 4;
    sub_2287FB578();
    char v22 = 5;
    sub_2287FB528();
    char v21 = 6;
    sub_2287FB528();
    char v20 = 7;
    sub_2287FB528();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2287DD234()
{
  unint64_t result = qword_268265528;
  if (!qword_268265528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265528);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t ScanningSystemState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  sub_2287E71B0(0, &qword_268265530, (uint64_t (*)(void))sub_2287DD234, (uint64_t)&type metadata for ScanningSystemState.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v29 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287DD234();
  sub_2287FB658();
  if (!v2)
  {
    uint64_t v9 = v6;
    uint64_t v10 = v33;
    char v41 = 0;
    uint64_t v11 = v5;
    char v12 = sub_2287FB4C8();
    char v40 = 1;
    sub_2287FB4D8();
    uint64_t v14 = v13;
    char v39 = 2;
    sub_2287FB4D8();
    uint64_t v16 = v15;
    char v38 = 3;
    sub_2287FB4D8();
    uint64_t v18 = v17;
    char v37 = 4;
    uint64_t v32 = sub_2287FB4F8();
    char v36 = 5;
    uint64_t v20 = sub_2287FB4A8();
    int v31 = v21;
    uint64_t v22 = v20;
    char v35 = 6;
    uint64_t v23 = sub_2287FB4A8();
    HIDWORD(v29) = v24;
    uint64_t v30 = v23;
    char v34 = 7;
    uint64_t v25 = sub_2287FB4A8();
    char v26 = v8;
    char v28 = v27;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v26, v11);
    *(unsigned char *)uint64_t v10 = v12 & 1;
    *(void *)(v10 + 8) = v14;
    *(void *)(v10 + 16) = v16;
    *(void *)(v10 + 24) = v18;
    *(void *)(v10 + 32) = v32;
    *(void *)(v10 + 40) = v22;
    *(unsigned char *)(v10 + 48) = v31 & 1;
    *(void *)(v10 + 56) = v30;
    *(unsigned char *)(v10 + 64) = BYTE4(v29) & 1;
    *(void *)(v10 + 72) = v25;
    *(unsigned char *)(v10 + 80) = v28 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2287DD620@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ScanningSystemState.init(from:)(a1, a2);
}

uint64_t sub_2287DD638(void *a1)
{
  return ScanningSystemState.encode(to:)(a1);
}

uint64_t ScanningSession.allTranscripts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.usedTranscripts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.seenMRCs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.pbsResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.mrcResult.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

double ScanningSession.timestamp.getter()
{
  return *(double *)(v0 + 48);
}

uint64_t ScanningSession.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 ScanningSession.systemState.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 88);
  char v3 = *(unsigned char *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 120);
  char v5 = *(unsigned char *)(v1 + 128);
  uint64_t v6 = *(void *)(v1 + 136);
  char v7 = *(unsigned char *)(v1 + 144);
  *(unsigned char *)a1 = *(unsigned char *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 72);
  *(void *)(a1 + 24) = v2;
  __n128 result = *(__n128 *)(v1 + 96);
  *(__n128 *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = v6;
  *(unsigned char *)(a1 + 80) = v7;
  return result;
}

__n128 ScanningSession.systemState.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  char v5 = *(unsigned char *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  char v7 = *(unsigned char *)(a1 + 80);
  *(unsigned char *)(v1 + 64) = *(unsigned char *)a1;
  *(_OWORD *)(v1 + 72) = *(_OWORD *)(a1 + 8);
  *(void *)(v1 + 88) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 + 96) = result;
  *(unsigned char *)(v1 + 112) = v3;
  *(void *)(v1 + 120) = v4;
  *(unsigned char *)(v1 + 128) = v5;
  *(void *)(v1 + 136) = v6;
  *(unsigned char *)(v1 + 144) = v7;
  return result;
}

uint64_t (*ScanningSession.systemState.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.filteredResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.filteredResults.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 152) = a1;
  return result;
}

uint64_t (*ScanningSession.filteredResults.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.expandedResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.expandedResults.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 160) = a1;
  return result;
}

uint64_t (*ScanningSession.expandedResults.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.init(from:usedTranscripts:seenMRCs:pbsResults:mrcResult:attachments:systemState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned __int8 *a8@<X7>, void *a9@<X8>)
{
  uint64_t v67 = a6;
  uint64_t v68 = a7;
  uint64_t v65 = a3;
  uint64_t v66 = a5;
  uint64_t v64 = a2;
  uint64_t v63 = a1;
  double v69 = a9;
  uint64_t v58 = sub_2287FA2D8();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  id v55 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v57 = *a8;
  uint64_t v12 = *((void *)a8 + 1);
  uint64_t v13 = *((void *)a8 + 2);
  uint64_t v14 = *((void *)a8 + 3);
  uint64_t v60 = *((void *)a8 + 4);
  uint64_t v59 = *((void *)a8 + 5);
  int v54 = a8[48];
  uint64_t v61 = *((void *)a8 + 7);
  int v53 = a8[64];
  uint64_t v62 = *((void *)a8 + 9);
  int v52 = a8[80];
  if (a4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v15 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  unint64_t v71 = a4;
  if (v15)
  {
    uint64_t v17 = 0;
    uint64_t v72 = v15;
    unint64_t v73 = a4 & 0xC000000000000001;
    double v70 = (char **)(a4 + 32);
    a4 = (unint64_t)&selRef_isiPad;
    do
    {
      if (v73) {
        uint64_t v18 = (char *)MEMORY[0x22A69E3A0](v17, v71);
      }
      else {
        uint64_t v18 = v70[v17];
      }
      uint64_t v19 = v18;
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_2287FB418();
        goto LABEL_3;
      }
      id v22 = objc_msgSend(v18, sel_subHgIds);
      sub_2287C5C80(0, &qword_2682653F0);
      unint64_t v23 = sub_2287FAE48();

      double v76 = v16;
      if (v23 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_2287FB418();
        uint64_t v74 = v21;
        double v75 = v19;
        if (!v24)
        {
LABEL_23:
          char v26 = (void *)MEMORY[0x263F8EE78];
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        uint64_t v74 = v21;
        double v75 = v19;
        if (!v24) {
          goto LABEL_23;
        }
      }
      if (v24 < 1) {
        goto LABEL_31;
      }
      uint64_t v25 = 0;
      char v26 = (void *)MEMORY[0x263F8EE78];
      do
      {
        if ((v23 & 0xC000000000000001) != 0) {
          id v27 = (id)MEMORY[0x22A69E3A0](v25, v23);
        }
        else {
          id v27 = *(id *)(v23 + 8 * v25 + 32);
        }
        char v28 = v27;
        id v29 = objc_msgSend(v27, sel_hgId);
        objc_msgSend(v28, sel_jaccardSimilarity);
        int v31 = v30;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v26 = sub_2287E64FC(0, v26[2] + 1, 1, v26);
        }
        unint64_t v33 = v26[2];
        unint64_t v32 = v26[3];
        if (v33 >= v32 >> 1) {
          char v26 = sub_2287E64FC((void *)(v32 > 1), v33 + 1, 1, v26);
        }
        ++v25;
        v26[2] = v33 + 1;
        char v34 = &v26[2 * v33];
        v34[4] = v29;
        *((_DWORD *)v34 + 10) = v31;
      }
      while (v24 != v25);
LABEL_24:
      swift_bridgeObjectRelease_n();
      char v35 = v75;
      id v36 = objc_msgSend(v75, sel_primaryHgId);
      objc_msgSend(v35, sel_maxJaccardSimilarity);
      int v38 = v37;

      uint64_t v16 = v76;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = sub_2287E63B4(0, v16[2] + 1, 1, v16);
      }
      uint64_t v17 = v74;
      unint64_t v40 = v16[2];
      unint64_t v39 = v16[3];
      if (v40 >= v39 >> 1) {
        uint64_t v16 = sub_2287E63B4((void *)(v39 > 1), v40 + 1, 1, v16);
      }
      v16[2] = v40 + 1;
      char v41 = &v16[3 * v40];
      v41[4] = v36;
      *((_DWORD *)v41 + 10) = v38;
      v41[6] = v26;
    }
    while (v17 != v72);
  }
  swift_bridgeObjectRelease_n();
  uint64_t v42 = v55;
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v44 = v43;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v42, v58);
  char v82 = v54;
  char v80 = v53;
  char v78 = v52;
  id v46 = v69;
  uint64_t v47 = v64;
  *double v69 = v63;
  v46[1] = v47;
  v46[2] = v65;
  v46[3] = v16;
  uint64_t v48 = v67;
  v46[4] = v66;
  v46[5] = v48;
  v46[6] = v44;
  v46[7] = v68;
  *((unsigned char *)v46 + 64) = v57;
  *(_DWORD *)((char *)v46 + 65) = v83[0];
  *((_DWORD *)v46 + 17) = *(_DWORD *)((char *)v83 + 3);
  v46[9] = v12;
  v46[10] = v13;
  v46[11] = v14;
  uint64_t v49 = v59;
  v46[12] = v60;
  v46[13] = v49;
  *((unsigned char *)v46 + 112) = v82;
  *(_DWORD *)((char *)v46 + 113) = *(_DWORD *)v81;
  *((_DWORD *)v46 + 29) = *(_DWORD *)&v81[3];
  v46[15] = v61;
  *((unsigned char *)v46 + 128) = v80;
  *(_DWORD *)((char *)v46 + 129) = *(_DWORD *)v79;
  *((_DWORD *)v46 + 33) = *(_DWORD *)&v79[3];
  v46[17] = v62;
  *((unsigned char *)v46 + 144) = v78;
  LODWORD(v49) = *(_DWORD *)v77;
  *((_DWORD *)v46 + 37) = *(_DWORD *)&v77[3];
  *(_DWORD *)((char *)v46 + 145) = v49;
  uint64_t v50 = MEMORY[0x263F8EE78];
  v46[19] = MEMORY[0x263F8EE78];
  v46[20] = v50;
  return result;
}

uint64_t sub_2287DDD94(char a1)
{
  return *(void *)&aAlltransusedtr[8 * a1];
}

BOOL sub_2287DDDB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2287DDDC8()
{
  return sub_2287FB628();
}

uint64_t sub_2287DDDF4()
{
  return sub_2287DDD94(*v0);
}

uint64_t sub_2287DDDFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2287EC814(a1, a2);
  *a3 = result;
  return result;
}

void sub_2287DDE24(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_2287DDE30(uint64_t a1)
{
  unint64_t v2 = sub_2287E662C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2287DDE6C(uint64_t a1)
{
  unint64_t v2 = sub_2287E662C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ScanningSession.encode(to:)(void *a1)
{
  sub_2287E71B0(0, &qword_268265538, (uint64_t (*)(void))sub_2287E662C, (uint64_t)&type metadata for ScanningSession.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)&v18 - v6;
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v32 = v1[2];
  uint64_t v33 = v8;
  uint64_t v10 = v1[3];
  uint64_t v29 = v1[4];
  uint64_t v30 = v1[5];
  uint64_t v31 = v10;
  uint64_t v28 = v1[7];
  int v21 = *((unsigned __int8 *)v1 + 64);
  uint64_t v11 = v1[9];
  uint64_t v12 = v1[10];
  uint64_t v13 = v1[11];
  uint64_t v27 = v1[12];
  uint64_t v26 = v1[13];
  int v46 = *((unsigned __int8 *)v1 + 112);
  uint64_t v25 = v1[15];
  int v24 = *((unsigned __int8 *)v1 + 128);
  uint64_t v23 = v1[17];
  int v22 = *((unsigned __int8 *)v1 + 144);
  uint64_t v20 = v1[19];
  uint64_t v19 = v1[20];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E662C();
  sub_2287FB668();
  uint64_t v35 = v9;
  char v47 = 0;
  sub_2287ED8DC(0, &qword_268265548, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
  sub_2287E698C(&qword_268265550);
  uint64_t v14 = v34;
  sub_2287FB588();
  if (!v14)
  {
    uint64_t v16 = v31;
    uint64_t v15 = v32;
    uint64_t v35 = v33;
    char v47 = 1;
    sub_2287FB588();
    uint64_t v35 = v15;
    char v47 = 2;
    sub_2287FB588();
    uint64_t v35 = v16;
    char v47 = 3;
    sub_2287ED8DC(0, &qword_268265558, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8D488]);
    sub_2287E6680();
    sub_2287FB588();
    LOBYTE(v35) = 4;
    sub_2287FB518();
    LOBYTE(v35) = 5;
    sub_2287FB558();
    uint64_t v35 = v28;
    char v47 = 6;
    sub_2287ED8DC(0, &qword_268265570, MEMORY[0x263F06F78], MEMORY[0x263F8D488]);
    sub_2287E6768();
    sub_2287FB588();
    LOBYTE(v35) = v21;
    uint64_t v36 = v11;
    uint64_t v37 = v12;
    uint64_t v38 = v13;
    uint64_t v39 = v27;
    uint64_t v40 = v26;
    char v41 = v46;
    uint64_t v42 = v25;
    char v43 = v24;
    uint64_t v44 = v23;
    char v45 = v22;
    char v47 = 7;
    sub_2287E6850();
    sub_2287FB588();
    uint64_t v35 = v20;
    char v47 = 8;
    sub_2287FB588();
    uint64_t v35 = v19;
    char v47 = 9;
    sub_2287ED8DC(0, &qword_268265590, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8D488]);
    sub_2287E68A4();
    sub_2287FB588();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ScanningSession.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2287E71B0(0, &qword_2682655A8, (uint64_t (*)(void))sub_2287E662C, (uint64_t)&type metadata for ScanningSession.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v53 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = a1[3];
  double v99 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_2287E662C();
  sub_2287FB658();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = v6;
    sub_2287ED8DC(0, &qword_268265548, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    LOBYTE(v54) = 0;
    sub_2287E698C(&qword_2682655B0);
    sub_2287FB508();
    uint64_t v10 = v65;
    LOBYTE(v54) = 1;
    swift_bridgeObjectRetain();
    sub_2287FB508();
    uint64_t v51 = v10;
    uint64_t v11 = v65;
    LOBYTE(v54) = 2;
    swift_bridgeObjectRetain();
    sub_2287FB508();
    uint64_t v50 = v11;
    uint64_t v12 = v65;
    sub_2287ED8DC(0, &qword_268265558, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8D488]);
    LOBYTE(v54) = 3;
    unint64_t v13 = sub_2287E6A10();
    swift_bridgeObjectRetain();
    sub_2287FB508();
    unint64_t v47 = v13;
    uint64_t v49 = v12;
    uint64_t v14 = v65;
    LOBYTE(v65) = 4;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2287FB498();
    uint64_t v48 = v16;
    uint64_t v45 = v15;
    LOBYTE(v65) = 5;
    swift_bridgeObjectRetain();
    uint64_t v46 = 0;
    sub_2287FB4D8();
    uint64_t v18 = v17;
    sub_2287ED8DC(0, &qword_268265570, MEMORY[0x263F06F78], MEMORY[0x263F8D488]);
    LOBYTE(v54) = 6;
    sub_2287E6AF8();
    sub_2287FB508();
    uint64_t v19 = v65;
    LOBYTE(v54) = 7;
    sub_2287E6BE0();
    uint64_t v44 = v19;
    swift_bridgeObjectRetain();
    sub_2287FB508();
    uint64_t v20 = v66;
    uint64_t v21 = v67;
    uint64_t v22 = v68;
    uint64_t v40 = v70;
    uint64_t v41 = v69;
    uint64_t v42 = v72;
    uint64_t v43 = v75;
    int v38 = v71;
    int v39 = v65;
    char v97 = v71;
    int v36 = v76;
    int v37 = v73;
    unsigned __int8 v95 = v73;
    char v93 = v76;
    LOBYTE(v54) = 8;
    sub_2287FB508();
    uint64_t v23 = v65;
    sub_2287ED8DC(0, &qword_268265590, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8D488]);
    char v90 = 9;
    sub_2287E6C34();
    swift_bridgeObjectRetain();
    sub_2287FB508();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v53);
    uint64_t v24 = v91;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v54 = v51;
    *((void *)&v54 + 1) = v50;
    uint64_t v25 = v49;
    *(void *)&long long v55 = v49;
    *((void *)&v55 + 1) = v14;
    *(void *)&long long v56 = v45;
    *((void *)&v56 + 1) = v48;
    *(void *)&long long v57 = v18;
    *((void *)&v57 + 1) = v44;
    LOBYTE(v58) = v39;
    *((void *)&v58 + 1) = v20;
    *(void *)&long long v59 = v21;
    *((void *)&v59 + 1) = v22;
    *(void *)&long long v60 = v41;
    *((void *)&v60 + 1) = v40;
    LOBYTE(v61) = v38;
    *((void *)&v61 + 1) = v42;
    LOBYTE(v62) = v37;
    *((void *)&v62 + 1) = v43;
    LOBYTE(v63) = v36;
    *((void *)&v63 + 1) = v23;
    uint64_t v64 = v24;
    sub_2287E6D1C((uint64_t)&v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = v14;
    swift_bridgeObjectRelease();
    uint64_t v27 = v48;
    swift_bridgeObjectRelease();
    uint64_t v28 = v44;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v29 = v63;
    *(_OWORD *)(a2 + 128) = v62;
    *(_OWORD *)(a2 + 144) = v29;
    *(void *)(a2 + 160) = v64;
    long long v30 = v59;
    *(_OWORD *)(a2 + 64) = v58;
    *(_OWORD *)(a2 + 80) = v30;
    long long v31 = v61;
    *(_OWORD *)(a2 + 96) = v60;
    *(_OWORD *)(a2 + 112) = v31;
    long long v32 = v55;
    *(_OWORD *)a2 = v54;
    *(_OWORD *)(a2 + 16) = v32;
    long long v33 = v57;
    *(_OWORD *)(a2 + 32) = v56;
    *(_OWORD *)(a2 + 48) = v33;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
    uint64_t v65 = v51;
    uint64_t v66 = v50;
    uint64_t v67 = v25;
    uint64_t v68 = v26;
    uint64_t v69 = v45;
    uint64_t v70 = v27;
    uint64_t v71 = v18;
    uint64_t v72 = v28;
    unsigned __int8 v73 = v39;
    *(_DWORD *)uint64_t v74 = v98[0];
    *(_DWORD *)&v74[3] = *(_DWORD *)((char *)v98 + 3);
    uint64_t v75 = v20;
    uint64_t v76 = v21;
    uint64_t v77 = v22;
    uint64_t v78 = v41;
    uint64_t v79 = v40;
    char v80 = v97;
    *(_DWORD *)id v81 = *(_DWORD *)v96;
    *(_DWORD *)&v81[3] = *(_DWORD *)&v96[3];
    uint64_t v82 = v42;
    unsigned __int8 v83 = v95;
    *(_DWORD *)uint64_t v84 = *(_DWORD *)v94;
    *(_DWORD *)&v84[3] = *(_DWORD *)&v94[3];
    uint64_t v85 = v43;
    char v86 = v93;
    *(_DWORD *)id v87 = *(_DWORD *)v92;
    *(_DWORD *)&v87[3] = *(_DWORD *)&v92[3];
    uint64_t v88 = v23;
    uint64_t v89 = v24;
    return sub_2287E6DA8((uint64_t)&v65);
  }
}

unint64_t sub_2287DEE10(char a1)
{
  unint64_t result = 0xD000000000000014;
  if (!a1) {
    return 0xD000000000000013;
  }
  return result;
}

uint64_t sub_2287DEE68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ScanningSession.init(from:)(a1, a2);
}

uint64_t sub_2287DEE80(void *a1)
{
  return ScanningSession.encode(to:)(a1);
}

unint64_t sub_2287DEE98()
{
  return sub_2287DEE10(*v0);
}

uint64_t sub_2287DEEA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2287ECC68(a1, a2);
  *a3 = result;
  return result;
}

void sub_2287DEEC8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2287DEED4(uint64_t a1)
{
  unint64_t v2 = sub_2287E6E34();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2287DEF10(uint64_t a1)
{
  unint64_t v2 = sub_2287E6E34();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ClinicalProductResultGroup.encode(to:)(void *a1)
{
  sub_2287E71B0(0, &qword_2682655F0, (uint64_t (*)(void))sub_2287E6E34, (uint64_t)&type metadata for ClinicalProductResultGroup.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v12 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E6E34();
  sub_2287FB668();
  char v17 = 0;
  uint64_t v8 = v13;
  sub_2287FB578();
  if (!v8)
  {
    uint64_t v9 = v12;
    char v16 = 1;
    sub_2287FB568();
    uint64_t v15 = v9;
    char v14 = 2;
    sub_2287ED8DC(0, &qword_268265600, (uint64_t)&type metadata for SpecificProductResult, MEMORY[0x263F8D488]);
    sub_2287E6E88();
    sub_2287FB588();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ClinicalProductResultGroup.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  sub_2287E71B0(0, &qword_268265618, (uint64_t (*)(void))sub_2287E6E34, (uint64_t)&type metadata for ClinicalProductResultGroup.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E6E34();
  sub_2287FB658();
  if (!v2)
  {
    uint64_t v9 = v6;
    uint64_t v10 = v16;
    char v20 = 0;
    uint64_t v11 = sub_2287FB4F8();
    char v19 = 1;
    sub_2287FB4E8();
    int v13 = v12;
    sub_2287ED8DC(0, &qword_268265600, (uint64_t)&type metadata for SpecificProductResult, MEMORY[0x263F8D488]);
    char v17 = 2;
    sub_2287E6F70();
    sub_2287FB508();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v5);
    uint64_t v15 = v18;
    *(void *)uint64_t v10 = v11;
    *(_DWORD *)(v10 + 8) = v13;
    *(void *)(v10 + 16) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2287DF3BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClinicalProductResultGroup.init(from:)(a1, a2);
}

uint64_t sub_2287DF3D4(void *a1)
{
  return ClinicalProductResultGroup.encode(to:)(a1);
}

BOOL sub_2287DF3EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2287DF404()
{
  return sub_2287FB648();
}

uint64_t sub_2287DF44C()
{
  return sub_2287FB648();
}

unint64_t sub_2287DF490()
{
  if (*v0) {
    return 0xD000000000000011;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_2287DF4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2287ECDAC(a1, a2);
  *a3 = result;
  return result;
}

void sub_2287DF4F8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2287DF504(uint64_t a1)
{
  unint64_t v2 = sub_2287E7058();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2287DF540(uint64_t a1)
{
  unint64_t v2 = sub_2287E7058();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SpecificProductResult.encode(to:)(void *a1)
{
  sub_2287E71B0(0, &qword_268265630, (uint64_t (*)(void))sub_2287E7058, (uint64_t)&type metadata for SpecificProductResult.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v9 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E7058();
  sub_2287FB668();
  char v11 = 0;
  uint64_t v7 = v9;
  sub_2287FB578();
  if (!v7)
  {
    char v10 = 1;
    sub_2287FB568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SpecificProductResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  sub_2287E71B0(0, &qword_268265640, (uint64_t (*)(void))sub_2287E7058, (uint64_t)&type metadata for SpecificProductResult.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E7058();
  sub_2287FB658();
  if (!v2)
  {
    uint64_t v9 = v14;
    char v16 = 0;
    uint64_t v10 = sub_2287FB4F8();
    char v15 = 1;
    sub_2287FB4E8();
    int v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)uint64_t v9 = v10;
    *(_DWORD *)(v9 + 8) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2287DF904@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SpecificProductResult.init(from:)(a1, a2);
}

uint64_t sub_2287DF91C(void *a1)
{
  return SpecificProductResult.encode(to:)(a1);
}

uint64_t sub_2287DF934@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  sub_2287ED770();
  uint64_t v4 = v3;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287FC840;
  id v6 = objc_msgSend(a1, sel_specificProduct);
  id v7 = objc_msgSend(v6, sel_identifier);
  id v8 = objc_msgSend(v7, sel_numberRepresentation);

  id v9 = objc_msgSend(v8, sel_stringValue);
  uint64_t v10 = sub_2287FAD68();
  uint64_t v12 = v11;

  *(void *)(inited + 32) = v10;
  *(void *)(inited + 40) = v12;
  id v13 = objc_msgSend(a1, sel_specificProduct);
  uint64_t v14 = sub_2287FB1F8();
  uint64_t v16 = v15;

  *(void *)(inited + 48) = v14;
  *(void *)(inited + 56) = v16;
  unint64_t v68 = sub_2287DC614(inited);
  swift_bridgeObjectRetain();
  id v17 = objc_msgSend(a1, sel_tradeNameProduct);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = swift_initStackObject();
    *(_OWORD *)(v19 + 16) = xmmword_2287FC840;
    id v20 = objc_msgSend(v18, sel_identifier);
    id v21 = objc_msgSend(v20, sel_numberRepresentation);

    id v22 = objc_msgSend(v21, sel_stringValue);
    uint64_t v23 = sub_2287FAD68();
    uint64_t v25 = v24;

    *(void *)(v19 + 32) = v23;
    *(void *)(v19 + 40) = v25;
    *(void *)(v19 + 48) = sub_2287FB1F8();
    *(void *)(v19 + 56) = v26;
    unint64_t v27 = sub_2287DC614(v19);
  }
  else
  {
    unint64_t v27 = 0;
  }
  id v70 = a1;
  id v28 = objc_msgSend(a1, sel_routedDoseFormProducts);
  sub_2287C5C80(0, &qword_2682653C8);
  unint64_t v29 = sub_2287FAE48();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2287FB418();
    uint64_t v30 = result;
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  unint64_t v67 = v27;
  if (v30)
  {
    if (v30 < 1)
    {
      __break(1u);
      goto LABEL_37;
    }
    uint64_t v32 = 0;
    long long v33 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        id v34 = (id)MEMORY[0x22A69E3A0](v32, v29);
      }
      else {
        id v34 = *(id *)(v29 + 8 * v32 + 32);
      }
      uint64_t v35 = v34;
      uint64_t v36 = v4;
      uint64_t v37 = swift_initStackObject();
      *(_OWORD *)(v37 + 16) = xmmword_2287FC840;
      id v38 = objc_msgSend(v35, sel_identifier);
      id v39 = objc_msgSend(v38, sel_numberRepresentation);

      id v40 = objc_msgSend(v39, sel_stringValue);
      uint64_t v41 = sub_2287FAD68();
      uint64_t v43 = v42;

      *(void *)(v37 + 32) = v41;
      *(void *)(v37 + 40) = v43;
      *(void *)(v37 + 48) = sub_2287FB1F8();
      *(void *)(v37 + 56) = v44;
      unint64_t v45 = sub_2287DC614(v37);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        long long v33 = sub_2287E7720(0, v33[2] + 1, 1, v33);
      }
      unint64_t v47 = v33[2];
      unint64_t v46 = v33[3];
      uint64_t v4 = v36;
      if (v47 >= v46 >> 1) {
        long long v33 = sub_2287E7720((void *)(v46 > 1), v47 + 1, 1, v33);
      }
      ++v32;
      v33[2] = v47 + 1;
      v33[v47 + 4] = v45;
    }
    while (v30 != v32);
  }
  else
  {
    long long v33 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  id v48 = objc_msgSend(v70, sel_ingredientProducts);
  unint64_t v49 = sub_2287FAE48();

  if (!(v49 >> 62))
  {
    uint64_t v50 = *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v50) {
      goto LABEL_21;
    }
LABEL_34:
    uint64_t v52 = (void *)MEMORY[0x263F8EE78];
LABEL_35:

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *a2 = v68;
    a2[1] = v67;
    a2[2] = (unint64_t)v33;
    a2[3] = (unint64_t)v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2287FB418();
  uint64_t v50 = result;
  if (!result) {
    goto LABEL_34;
  }
LABEL_21:
  if (v50 >= 1)
  {
    uint64_t v51 = 0;
    unint64_t v71 = v49 & 0xC000000000000001;
    uint64_t v52 = (void *)MEMORY[0x263F8EE78];
    unint64_t v53 = v49;
    do
    {
      if (v71) {
        id v54 = (id)MEMORY[0x22A69E3A0](v51, v49);
      }
      else {
        id v54 = *(id *)(v49 + 8 * v51 + 32);
      }
      long long v55 = v54;
      uint64_t v56 = swift_initStackObject();
      *(_OWORD *)(v56 + 16) = xmmword_2287FC840;
      id v57 = objc_msgSend(v55, sel_identifier);
      id v58 = objc_msgSend(v57, sel_numberRepresentation);

      id v59 = objc_msgSend(v58, sel_stringValue);
      uint64_t v60 = sub_2287FAD68();
      uint64_t v62 = v61;

      *(void *)(v56 + 32) = v60;
      *(void *)(v56 + 40) = v62;
      *(void *)(v56 + 48) = sub_2287FB1F8();
      *(void *)(v56 + 56) = v63;
      unint64_t v64 = sub_2287DC614(v56);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v52 = sub_2287E7720(0, v52[2] + 1, 1, v52);
      }
      unint64_t v66 = v52[2];
      unint64_t v65 = v52[3];
      if (v66 >= v65 >> 1) {
        uint64_t v52 = sub_2287E7720((void *)(v65 > 1), v66 + 1, 1, v52);
      }
      ++v51;
      v52[2] = v66 + 1;
      v52[v66 + 4] = v64;
      unint64_t v49 = v53;
    }
    while (v50 != v51);
    goto LABEL_35;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_2287DFF78(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      unint64_t result = 0x6369666963657073;
      break;
  }
  return result;
}

unint64_t sub_2287E0014()
{
  return sub_2287DFF78(*v0);
}

uint64_t sub_2287E001C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2287ECFC4(a1, a2);
  *a3 = result;
  return result;
}

void sub_2287E0044(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2287E0050(uint64_t a1)
{
  unint64_t v2 = sub_2287E70AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2287E008C(uint64_t a1)
{
  unint64_t v2 = sub_2287E70AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ExpandedMedicationCluster.encode(to:)(void *a1)
{
  sub_2287E71B0(0, &qword_268265648, (uint64_t (*)(void))sub_2287E70AC, (uint64_t)&type metadata for ExpandedMedicationCluster.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v14 - v6;
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v16 = v1[2];
  uint64_t v17 = v8;
  uint64_t v15 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E70AC();
  sub_2287FB668();
  uint64_t v20 = v9;
  char v19 = 0;
  sub_2287ED99C(0, &qword_268265658, MEMORY[0x263F8D310], MEMORY[0x263F8D060]);
  sub_2287E7218(&qword_268265660);
  uint64_t v10 = v18;
  sub_2287FB588();
  if (!v10)
  {
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    uint64_t v20 = v17;
    char v19 = 1;
    sub_2287FB538();
    uint64_t v20 = v12;
    char v19 = 2;
    sub_2287ED7D8(0, &qword_268265668, MEMORY[0x263F8D488]);
    sub_2287E7100();
    sub_2287FB588();
    uint64_t v20 = v11;
    char v19 = 3;
    sub_2287FB588();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ExpandedMedicationCluster.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_2287E71B0(0, &qword_268265678, (uint64_t (*)(void))sub_2287E70AC, (uint64_t)&type metadata for ExpandedMedicationCluster.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v23 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2287E70AC();
  sub_2287FB658();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    uint64_t v9 = v6;
    id v22 = a2;
    sub_2287ED99C(0, &qword_268265658, MEMORY[0x263F8D310], MEMORY[0x263F8D060]);
    char v24 = 0;
    sub_2287E7218(&qword_268265680);
    uint64_t v10 = v23;
    sub_2287FB508();
    uint64_t v12 = v25;
    char v24 = 1;
    swift_bridgeObjectRetain();
    sub_2287FB4B8();
    uint64_t v13 = v25;
    sub_2287ED7D8(0, &qword_268265668, MEMORY[0x263F8D488]);
    char v24 = 2;
    unint64_t v14 = sub_2287E729C();
    swift_bridgeObjectRetain();
    unint64_t v21 = v14;
    sub_2287FB508();
    uint64_t v20 = v13;
    uint64_t v15 = v25;
    char v24 = 3;
    swift_bridgeObjectRetain();
    sub_2287FB508();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v16 = v25;
    swift_bridgeObjectRetain();
    uint64_t v17 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v22;
    *id v22 = v12;
    v18[1] = v17;
    void v18[2] = v15;
    v18[3] = v16;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287E07BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ExpandedMedicationCluster.init(from:)(a1, a2);
}

uint64_t sub_2287E07D4(void *a1)
{
  return ExpandedMedicationCluster.encode(to:)(a1);
}

uint64_t sub_2287E07EC()
{
  type metadata accessor for ScanningSessionLogger();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_2287E0E54(120.0);
  qword_268265518 = v0;
  return result;
}

uint64_t static ScanningSessionLogger.shared.getter()
{
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static ScanningSessionLogger.shared.setter(uint64_t a1)
{
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_268265518 = a1;
  return swift_release();
}

uint64_t (*static ScanningSessionLogger.shared.modify())()
{
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2287E09B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_2287E734C(0, &qword_268265690, (uint64_t (*)(uint64_t))sub_2287E73B0, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - v5;
  sub_2287E73B0();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v40 - v13;
  sub_2287E7420((uint64_t)v48);
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_2287FA378();
  uint64_t v16 = v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds;
  swift_beginAccess();
  uint64_t v17 = *(void *)(*(void *)v16 + 16);
  if (v17)
  {
    sub_2287E7440(*(void *)v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * (v17 - 1), (uint64_t)v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
    {
      uint64_t v42 = v15;
      uint64_t v43 = a1;
      uint64_t v18 = *(int *)(v8 + 48);
      uint64_t v19 = &v14[v18];
      uint64_t v41 = &v6[v18];
      uint64_t v20 = sub_2287FA308();
      uint64_t v21 = *(void *)(v20 - 8);
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v14, v6, v20);
      uint64_t v22 = sub_2287FA2D8();
      uint64_t v23 = *(void *)(v22 - 8);
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v19, v41, v22);
      char v24 = &v12[*(int *)(v8 + 48)];
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v12, v14, v20);
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v24, v19, v22);
      uint64_t v25 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
      swift_beginAccess();
      uint64_t v26 = *v25;
      if (*(void *)(v26 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v27 = sub_2287E7C14((uint64_t)v12);
        if (v28)
        {
          unint64_t v29 = (_OWORD *)(*(void *)(v26 + 56) + 168 * v27);
          long long v31 = v29[1];
          long long v30 = v29[2];
          v44[0] = *v29;
          v44[1] = v31;
          v44[2] = v30;
          long long v32 = v29[3];
          long long v33 = v29[4];
          long long v34 = v29[6];
          v44[5] = v29[5];
          v44[6] = v34;
          v44[3] = v32;
          v44[4] = v33;
          long long v35 = v29[7];
          long long v36 = v29[8];
          long long v37 = v29[9];
          uint64_t v45 = *((void *)v29 + 20);
          v44[8] = v36;
          v44[9] = v37;
          v44[7] = v35;
          memmove(v47, v29, 0xA8uLL);
          nullsub_1(v47);
          sub_2287E6D1C((uint64_t)v44);
          swift_bridgeObjectRelease();
          id v38 = v47;
LABEL_10:
          sub_2287C59C8((uint64_t)v38, (uint64_t)v46);
          sub_2287E7CAC((uint64_t)v14);
          (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v22);
          (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v20);
          sub_2287C59C8((uint64_t)v46, (uint64_t)v47);
          a1 = v43;
          goto LABEL_11;
        }
        swift_bridgeObjectRelease();
      }
      id v38 = v48;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v6, 1, 1, v8);
  }
  sub_2287ED264((uint64_t)v6, &qword_268265690, (uint64_t (*)(uint64_t))sub_2287E73B0);
  sub_2287C59C8((uint64_t)v48, (uint64_t)v47);
LABEL_11:
  sub_2287FA388();
  return sub_2287C59C8((uint64_t)v47, a1);
}

uint64_t sub_2287E0E54(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2287FA278();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_defaultManager);
  id v9 = objc_msgSend(v8, sel_temporaryDirectory);

  sub_2287FA258();
  sub_2287FA248();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v10 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_encoder;
  sub_2287FA1F8();
  swift_allocObject();
  *(void *)(v2 + v10) = sub_2287FA1E8();
  uint64_t v11 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock;
  sub_2287FA3A8();
  swift_allocObject();
  *(void *)(v2 + v11) = sub_2287FA398();
  *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer) = 0;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds) = MEMORY[0x263F8EE78];
  uint64_t v13 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions;
  *(void *)(v2 + v13) = sub_2287DC1F8(v12);
  *(double *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod) = a1;
  unint64_t v14 = self;
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_2287ED928;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2287E13AC;
  aBlock[3] = &block_descriptor_64;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  id v17 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v16, a1);
  _Block_release(v16);
  uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer);
  *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer) = v17;

  sub_2287E6120();
  return v2;
}

uint64_t ScanningSessionLogger.deinit()
{
  uint64_t v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer);
  if (v2) {
    objc_msgSend(v2, sel_invalidate);
  }
  uint64_t v3 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer);
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  sub_2287E6120();
  uint64_t v5 = v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_logDirectory;
  uint64_t v6 = sub_2287FA278();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScanningSessionLogger.__deallocating_deinit()
{
  ScanningSessionLogger.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2287E126C(void *a1)
{
  uint64_t v2 = sub_2287FA2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v7 = objc_msgSend(a1, sel_fireDate);
    sub_2287FA2B8();

    sub_2287FA298();
    double v9 = v8;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_2287E5530(v9);
    return swift_release();
  }
  return result;
}

void sub_2287E13AC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2287E1414@<X0>(uint64_t a1@<X8>)
{
  sub_2287E73B0();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2287FA2D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA2F8();
  sub_2287FA378();
  sub_2287FA2C8();
  uint64_t v12 = &v7[*(int *)(v4 + 56)];
  uint64_t v13 = sub_2287FA308();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a1, v13);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  unint64_t v14 = (unint64_t *)(v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds);
  swift_beginAccess();
  unint64_t v15 = *v14;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v14 = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v15 = sub_2287E7848(0, *(void *)(v15 + 16) + 1, 1, v15, &qword_2682657F0, (uint64_t (*)(uint64_t))sub_2287E73B0, (uint64_t (*)(void))sub_2287E73B0, (uint64_t (*)(void))sub_2287E73B0);
    *unint64_t v14 = v15;
  }
  unint64_t v18 = *(void *)(v15 + 16);
  unint64_t v17 = *(void *)(v15 + 24);
  if (v18 >= v17 >> 1)
  {
    unint64_t v15 = sub_2287E7848(v17 > 1, v18 + 1, 1, v15, &qword_2682657F0, (uint64_t (*)(uint64_t))sub_2287E73B0, (uint64_t (*)(void))sub_2287E73B0, (uint64_t (*)(void))sub_2287E73B0);
    *unint64_t v14 = v15;
  }
  *(void *)(v15 + 16) = v18 + 1;
  sub_2287E7D08((uint64_t)v7, v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v18);
  swift_endAccess();
  return sub_2287FA388();
}

uint64_t sub_2287E16F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, unsigned __int8 *a8)
{
  uint64_t v60 = a1;
  uint64_t v61 = a6;
  uint64_t v59 = a5;
  uint64_t v48 = a4;
  uint64_t v13 = sub_2287FA308();
  unint64_t v14 = *(char **)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v56 = *a8;
  uint64_t v17 = *((void *)a8 + 1);
  uint64_t v18 = *((void *)a8 + 2);
  uint64_t v19 = *((void *)a8 + 3);
  uint64_t v20 = *((void *)a8 + 4);
  uint64_t v54 = *((void *)a8 + 5);
  uint64_t v55 = v20;
  int v53 = a8[48];
  uint64_t v52 = *((void *)a8 + 7);
  int v51 = a8[64];
  uint64_t v50 = *((void *)a8 + 9);
  int v49 = a8[80];
  uint64_t v62 = v8;
  sub_2287FA378();
  if (a7)
  {
    id v21 = objc_msgSend(a7, sel_resolvedIds);
    sub_2287C5C80(0, &qword_268265220);
    uint64_t v22 = sub_2287FAE48();
  }
  else
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  uint64_t v57 = a2;
  uint64_t v58 = a3;
  uint64_t v23 = (unint64_t)v22 >> 62;
  if ((unint64_t)v22 >> 62)
  {
    if (v22 < 0) {
      uint64_t v27 = v22;
    }
    else {
      uint64_t v27 = v22 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    int64_t v29 = sub_2287FB418();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2287FB418();
    swift_bridgeObjectRelease();
    if (v28 < 0)
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v29 >= 10) {
      uint64_t v45 = 10;
    }
    else {
      uint64_t v45 = v29;
    }
    if (v29 >= 0) {
      uint64_t v24 = v45;
    }
    else {
      uint64_t v24 = 10;
    }
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_2287FB418();
    uint64_t result = swift_bridgeObjectRelease();
    if (v46 < v24)
    {
      __break(1u);
      return result;
    }
  }
  else if (*(uint64_t *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 10)
  {
    uint64_t v24 = 10;
  }
  else
  {
    uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((v22 & 0xC000000000000001) != 0 && v24)
  {
    sub_2287C5C80(0, &qword_268265220);
    uint64_t v25 = 0;
    do
    {
      uint64_t v26 = v25 + 1;
      sub_2287FB368();
      uint64_t v25 = v26;
    }
    while (v24 != v26);
  }
  if (v23)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2287FB428();
    uint64_t v28 = v30;
    uint64_t v23 = v31;
    int64_t v29 = v32;
    swift_bridgeObjectRelease_n();
    if (v29) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v27 = v22 & 0xFFFFFFFFFFFFFF8;
    uint64_t v28 = (v22 & 0xFFFFFFFFFFFFFF8) + 32;
    int64_t v29 = (2 * v24) | 1;
    if (v29)
    {
LABEL_17:
      unint64_t v47 = v16;
      uint64_t v16 = v14;
      unint64_t v14 = (char *)v13;
      sub_2287FB5C8();
      swift_unknownObjectRetain_n();
      uint64_t v34 = swift_dynamicCastClass();
      if (!v34)
      {
        swift_unknownObjectRelease();
        uint64_t v34 = MEMORY[0x263F8EE78];
      }
      uint64_t v35 = *(void *)(v34 + 16);
      swift_release();
      if (!__OFSUB__((unint64_t)v29 >> 1, v23))
      {
        if (v35 == ((unint64_t)v29 >> 1) - v23)
        {
          unint64_t v33 = swift_dynamicCastClass();
          unint64_t v14 = v16;
          uint64_t v16 = v47;
          if (!v33)
          {
            swift_unknownObjectRelease();
            unint64_t v33 = MEMORY[0x263F8EE78];
          }
          goto LABEL_23;
        }
        goto LABEL_39;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      swift_unknownObjectRelease();
      uint64_t v13 = (uint64_t)v14;
      unint64_t v14 = v16;
      uint64_t v16 = v47;
    }
  }
  unint64_t v33 = sub_2287E82A4(v27, v28, v23, v29, &qword_268265220);
LABEL_23:
  swift_unknownObjectRelease();
  long long v36 = self;
  unsigned __int8 v37 = objc_msgSend(v36, sel_isAppleInternalInstall);
  uint64_t v39 = v57;
  uint64_t v38 = v58;
  if (v37) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v39 = MEMORY[0x263F8EE78];
  }
  if (objc_msgSend(v36, sel_isAppleInternalInstall)) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v38 = MEMORY[0x263F8EE78];
  }
  if (objc_msgSend(v36, sel_isAppleInternalInstall))
  {
    uint64_t v40 = v48;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v40 = MEMORY[0x263F8EE78];
  }
  v64[0] = v56;
  uint64_t v65 = v17;
  uint64_t v66 = v18;
  uint64_t v67 = v19;
  uint64_t v68 = v55;
  uint64_t v69 = v54;
  char v70 = v53;
  uint64_t v71 = v52;
  char v72 = v51;
  uint64_t v73 = v50;
  char v74 = v49;
  uint64_t v41 = v61;
  swift_bridgeObjectRetain();
  ScanningSession.init(from:usedTranscripts:seenMRCs:pbsResults:mrcResult:attachments:systemState:)(v39, v38, v40, v33, v59, v41, MEMORY[0x263F8EE78], v64, v75);
  (*((void (**)(char *, uint64_t, uint64_t))v14 + 2))(v16, v60, v13);
  uint64_t v42 = (uint64_t *)(v62 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v63 = *v42;
  *uint64_t v42 = 0x8000000000000000;
  sub_2287E9424((uint64_t)v75, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
  *uint64_t v42 = v63;
  swift_bridgeObjectRelease();
  (*((void (**)(char *, uint64_t))v14 + 1))(v16, v13);
  swift_endAccess();
  return sub_2287FA388();
}

uint64_t sub_2287E1C68(uint64_t a1, void *a2)
{
  unint64_t v5 = sub_2287FA308();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v85 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_2287FA378();
  uint64_t v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  uint64_t v84 = v9;
  uint64_t v10 = *v9;
  if (*(void *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_2287E7C14(a1);
    if (v12)
    {
      uint64_t v72 = v6;
      uint64_t v67 = a1;
      uint64_t v13 = *(void *)(v10 + 56) + 168 * v11;
      long long v15 = *(_OWORD *)(v13 + 16);
      long long v14 = *(_OWORD *)(v13 + 32);
      long long v122 = *(_OWORD *)v13;
      long long v123 = v15;
      long long v124 = v14;
      long long v16 = *(_OWORD *)(v13 + 48);
      long long v17 = *(_OWORD *)(v13 + 64);
      long long v18 = *(_OWORD *)(v13 + 96);
      long long v127 = *(_OWORD *)(v13 + 80);
      long long v128 = v18;
      long long v125 = v16;
      long long v126 = v17;
      long long v19 = *(_OWORD *)(v13 + 112);
      long long v20 = *(_OWORD *)(v13 + 128);
      long long v21 = *(_OWORD *)(v13 + 144);
      uint64_t v132 = *(void *)(v13 + 160);
      long long v130 = v20;
      long long v131 = v21;
      long long v129 = v19;
      sub_2287E6D1C((uint64_t)&v122);
      swift_bridgeObjectRelease();
      long long v22 = v122;
      long long v23 = v123;
      uint64_t v75 = v124;
      long long v24 = v125;
      int v74 = v126;
      uint64_t v25 = *((void *)&v126 + 1);
      long long v26 = v127;
      uint64_t v78 = *((void *)&v128 + 1);
      uint64_t v79 = v128;
      uint64_t v80 = *((void *)&v129 + 1);
      uint64_t v81 = *((void *)&v130 + 1);
      uint64_t v27 = v132;
      int v65 = v130;
      int v66 = v129;
      char v138 = v129;
      char v136 = v130;
      int v64 = v131;
      char v134 = v131;
      uint64_t v69 = *((void *)&v124 + 1);
      swift_bridgeObjectRetain();
      uint64_t v68 = *((void *)&v24 + 1);
      swift_bridgeObjectRetain();
      uint64_t v71 = v27;
      swift_bridgeObjectRetain();
      uint64_t v77 = v22;
      swift_bridgeObjectRetain();
      uint64_t v83 = *((void *)&v22 + 1);
      swift_bridgeObjectRetain();
      uint64_t v70 = v23;
      swift_bridgeObjectRetain();
      uint64_t v76 = *((void *)&v23 + 1);
      swift_bridgeObjectRetain();
      id v28 = objc_msgSend(a2, sel_resolvedIds);
      sub_2287C5C80(0, &qword_268265220);
      unint64_t v29 = sub_2287FAE48();

      if (v29 >> 62) {
        goto LABEL_40;
      }
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      while (1)
      {
        unint64_t v82 = v5;
        uint64_t v73 = v8;
        unint64_t v87 = v29;
        if (!v30) {
          break;
        }
        uint64_t v31 = 0;
        unint64_t v89 = v29 & 0xC000000000000001;
        int64_t v32 = (void *)MEMORY[0x263F8EE78];
        unint64_t v86 = v29 + 32;
        unint64_t v88 = v30;
        while (1)
        {
          id v33 = v89 ? (id)MEMORY[0x22A69E3A0](v31, v87) : *(id *)(v86 + 8 * v31);
          unint64_t v29 = (unint64_t)v33;
          BOOL v34 = __OFADD__(v31, 1);
          uint64_t v35 = v31 + 1;
          if (v34) {
            break;
          }
          id v36 = objc_msgSend(v33, sel_subHgIds);
          sub_2287C5C80(0, &qword_2682653F0);
          unint64_t v5 = sub_2287FAE48();

          if (v5 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v37 = sub_2287FB418();
          }
          else
          {
            uint64_t v37 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
          }
          id v91 = (id)v29;
          CGFloat v92 = v32;
          uint64_t v90 = v35;
          if (v37)
          {
            if (v37 < 1) {
              goto LABEL_39;
            }
            uint64_t v38 = 0;
            uint64_t v8 = (void *)MEMORY[0x263F8EE78];
            do
            {
              if ((v5 & 0xC000000000000001) != 0) {
                id v39 = (id)MEMORY[0x22A69E3A0](v38, v5);
              }
              else {
                id v39 = *(id *)(v5 + 8 * v38 + 32);
              }
              uint64_t v40 = v39;
              id v41 = objc_msgSend(v39, sel_hgId);
              objc_msgSend(v40, sel_jaccardSimilarity);
              int v43 = v42;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v8 = sub_2287E64FC(0, v8[2] + 1, 1, v8);
              }
              unint64_t v45 = v8[2];
              unint64_t v44 = v8[3];
              if (v45 >= v44 >> 1) {
                uint64_t v8 = sub_2287E64FC((void *)(v44 > 1), v45 + 1, 1, v8);
              }
              ++v38;
              void v8[2] = v45 + 1;
              uint64_t v46 = &v8[2 * v45];
              v46[4] = v41;
              *((_DWORD *)v46 + 10) = v43;
            }
            while (v37 != v38);
          }
          else
          {
            uint64_t v8 = (void *)MEMORY[0x263F8EE78];
          }
          swift_bridgeObjectRelease_n();
          id v47 = v91;
          id v48 = objc_msgSend(v91, sel_primaryHgId);
          objc_msgSend(v47, sel_maxJaccardSimilarity);
          int v50 = v49;

          int64_t v32 = v92;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v32 = sub_2287E63B4(0, v32[2] + 1, 1, v32);
          }
          unint64_t v5 = v88;
          uint64_t v31 = v90;
          unint64_t v52 = v32[2];
          unint64_t v51 = v32[3];
          if (v52 >= v51 >> 1) {
            int64_t v32 = sub_2287E63B4((void *)(v51 > 1), v52 + 1, 1, v32);
          }
          v32[2] = v52 + 1;
          int v53 = &v32[3 * v52];
          v53[4] = v48;
          *((_DWORD *)v53 + 10) = v50;
          v53[6] = v8;
          if (v31 == v5) {
            goto LABEL_36;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain();
        uint64_t v30 = sub_2287FB418();
      }
      int64_t v32 = (void *)MEMORY[0x263F8EE78];
LABEL_36:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v54 = v72;
      (*(void (**)(uint64_t, uint64_t, unint64_t))(v72 + 16))(v85, v67, v82);
      *(void *)&long long v94 = v77;
      *((void *)&v94 + 1) = v83;
      uint64_t v55 = v69;
      uint64_t v56 = v70;
      *(void *)&long long v95 = v70;
      *((void *)&v95 + 1) = v76;
      *(void *)&long long v96 = v75;
      *((void *)&v96 + 1) = v69;
      *(void *)&long long v97 = v24;
      uint64_t v57 = v68;
      *((void *)&v97 + 1) = v68;
      LOBYTE(v98) = v74;
      *((void *)&v98 + 1) = v25;
      long long v99 = v26;
      *(void *)&long long v100 = v79;
      *((void *)&v100 + 1) = v78;
      LOBYTE(v101) = v66;
      *((void *)&v101 + 1) = v80;
      LOBYTE(v102) = v65;
      *((void *)&v102 + 1) = v81;
      LOBYTE(v103) = v64;
      *((void *)&v103 + 1) = v32;
      CGFloat v92 = v32;
      uint64_t v58 = v71;
      uint64_t v104 = v71;
      v140[4] = v98;
      v140[5] = v26;
      uint64_t v141 = v71;
      v140[8] = v102;
      v140[9] = v103;
      v140[6] = v100;
      v140[7] = v101;
      v140[2] = v96;
      v140[3] = v97;
      v140[0] = v94;
      v140[1] = v95;
      sub_2287E6D1C((uint64_t)&v94);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v59 = v84;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v93 = *v59;
      uint64_t *v59 = 0x8000000000000000;
      uint64_t v61 = v85;
      sub_2287E9424((uint64_t)v140, v85, isUniquelyReferenced_nonNull_native);
      uint64_t *v59 = v93;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, unint64_t))(v54 + 8))(v61, v82);
      swift_endAccess();
      v105[0] = v77;
      v105[1] = v83;
      v105[2] = v56;
      v105[3] = v76;
      v105[4] = v75;
      v105[5] = v55;
      v105[6] = v24;
      v105[7] = v57;
      char v106 = v74;
      *(_DWORD *)id v107 = *(_DWORD *)v139;
      *(_DWORD *)&v107[3] = *(_DWORD *)&v139[3];
      uint64_t v108 = v25;
      long long v109 = v26;
      uint64_t v110 = v79;
      uint64_t v111 = v78;
      char v112 = v138;
      *(_DWORD *)CGFloat v113 = *(_DWORD *)v137;
      *(_DWORD *)&v113[3] = *(_DWORD *)&v137[3];
      uint64_t v114 = v80;
      char v115 = v136;
      *(_DWORD *)double v116 = *(_DWORD *)v135;
      *(_DWORD *)&v116[3] = *(_DWORD *)&v135[3];
      uint64_t v117 = v81;
      char v118 = v134;
      *(_DWORD *)&v119[3] = *(_DWORD *)&v133[3];
      *(_DWORD *)uint64_t v119 = *(_DWORD *)v133;
      double v120 = v92;
      uint64_t v121 = v58;
      sub_2287E6DA8((uint64_t)v105);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return sub_2287FA388();
}

uint64_t sub_2287E24A0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2287FA308();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_2287FA378();
  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (!*(void *)(*v10 + 16)) {
    return sub_2287FA388();
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_2287E7C14(a1);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return sub_2287FA388();
  }
  uint64_t v54 = v6;
  uint64_t v51 = a1;
  uint64_t v14 = *(void *)(v11 + 56) + 168 * v12;
  long long v16 = *(_OWORD *)(v14 + 16);
  long long v15 = *(_OWORD *)(v14 + 32);
  long long v100 = *(_OWORD *)v14;
  long long v101 = v16;
  long long v102 = v15;
  long long v17 = *(_OWORD *)(v14 + 48);
  long long v18 = *(_OWORD *)(v14 + 64);
  long long v19 = *(_OWORD *)(v14 + 96);
  long long v105 = *(_OWORD *)(v14 + 80);
  long long v106 = v19;
  long long v103 = v17;
  long long v104 = v18;
  long long v20 = *(_OWORD *)(v14 + 112);
  long long v21 = *(_OWORD *)(v14 + 128);
  long long v22 = *(_OWORD *)(v14 + 144);
  uint64_t v110 = *(void *)(v14 + 160);
  long long v108 = v21;
  long long v109 = v22;
  long long v107 = v20;
  sub_2287E6D1C((uint64_t)&v100);
  swift_bridgeObjectRelease();
  uint64_t v67 = *((void *)&v100 + 1);
  uint64_t v23 = v100;
  uint64_t v25 = *((void *)&v101 + 1);
  uint64_t v24 = v101;
  uint64_t v58 = v102;
  uint64_t v26 = v103;
  int v56 = v104;
  uint64_t v27 = *((void *)&v104 + 1);
  long long v28 = v105;
  uint64_t v61 = *((void *)&v106 + 1);
  uint64_t v62 = v106;
  uint64_t v63 = *((void *)&v107 + 1);
  uint64_t v64 = *((void *)&v108 + 1);
  uint64_t v68 = *((void *)&v109 + 1);
  int v49 = v108;
  int v50 = v107;
  char v116 = v107;
  char v114 = v108;
  int v48 = v109;
  char v112 = v109;
  uint64_t v52 = *((void *)&v102 + 1);
  uint64_t v57 = *((void *)&v103 + 1);
  if ((unint64_t)a2 >> 62)
  {
    uint64_t v46 = a2 & 0xFFFFFFFFFFFFFF8;
    if (a2 < 0) {
      uint64_t v46 = a2;
    }
    *(void *)&long long v70 = v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_2287FB418();
  }
  else
  {
    *(void *)&long long v70 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = v70;
  }
  uint64_t v55 = v9;
  int v65 = v8;
  uint64_t v66 = v5;
  int v53 = v10;
  uint64_t v59 = v25;
  uint64_t v60 = v23;
  uint64_t v69 = a2;
  if (!result)
  {
    int64_t v32 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v40 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v65, v51, v66);
    *(void *)&long long v72 = v60;
    *((void *)&v72 + 1) = v67;
    *(void *)&long long v73 = v24;
    *((void *)&v73 + 1) = v59;
    uint64_t v41 = v52;
    *(void *)&long long v74 = v58;
    *((void *)&v74 + 1) = v52;
    *(void *)&long long v75 = v26;
    *((void *)&v75 + 1) = v57;
    LOBYTE(v76) = v56;
    *((void *)&v76 + 1) = v27;
    long long v77 = v28;
    *(void *)&long long v78 = v62;
    *((void *)&v78 + 1) = v61;
    LOBYTE(v79) = v50;
    *((void *)&v79 + 1) = v63;
    LOBYTE(v80) = v49;
    *((void *)&v80 + 1) = v64;
    LOBYTE(v81) = v48;
    *((void *)&v81 + 1) = v68;
    unint64_t v82 = v32;
    long long v122 = v76;
    long long v123 = v28;
    long long v128 = v32;
    long long v126 = v80;
    long long v127 = v81;
    long long v124 = v78;
    long long v125 = v79;
    long long v120 = v74;
    long long v121 = v75;
    long long v118 = v72;
    long long v119 = v73;
    sub_2287E6D1C((uint64_t)&v72);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v42 = v59;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v43 = v53;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v71 = *v43;
    uint64_t *v43 = 0x8000000000000000;
    uint64_t v45 = (uint64_t)v65;
    sub_2287E9424((uint64_t)&v118, (uint64_t)v65, isUniquelyReferenced_nonNull_native);
    uint64_t *v43 = v71;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v45, v66);
    swift_endAccess();
    v83[0] = v60;
    v83[1] = v67;
    v83[2] = v24;
    _DWORD v83[3] = v42;
    v83[4] = v58;
    v83[5] = v41;
    v83[6] = v26;
    v83[7] = v57;
    char v84 = v56;
    *(_DWORD *)uint64_t v85 = *(_DWORD *)v117;
    *(_DWORD *)&v85[3] = *(_DWORD *)&v117[3];
    uint64_t v86 = v27;
    long long v87 = v28;
    uint64_t v88 = v62;
    uint64_t v89 = v61;
    char v90 = v116;
    *(_DWORD *)id v91 = *(_DWORD *)v115;
    *(_DWORD *)&v91[3] = *(_DWORD *)&v115[3];
    uint64_t v92 = v63;
    char v93 = v114;
    *(_DWORD *)long long v94 = *(_DWORD *)v113;
    *(_DWORD *)&v94[3] = *(_DWORD *)&v113[3];
    uint64_t v95 = v64;
    char v96 = v112;
    *(_DWORD *)&v97[3] = *(_DWORD *)&v111[3];
    *(_DWORD *)long long v97 = *(_DWORD *)v111;
    uint64_t v98 = v68;
    long long v99 = v32;
    sub_2287E6DA8((uint64_t)v83);
    return sub_2287FA388();
  }
  if (result >= 1)
  {
    uint64_t v30 = 0;
    unint64_t v31 = a2 & 0xC000000000000001;
    int64_t v32 = (void *)MEMORY[0x263F8EE78];
    uint64_t v33 = v24;
    do
    {
      uint64_t v34 = result;
      if (v31) {
        id v35 = (id)MEMORY[0x22A69E3A0](v30, v69);
      }
      else {
        id v35 = *(id *)(v69 + 8 * v30 + 32);
      }
      sub_2287DF934(v35, (unint64_t *)&v118);
      long long v36 = v118;
      long long v70 = v119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v32 = sub_2287E7AE4(0, v32[2] + 1, 1, v32);
      }
      unint64_t v38 = v32[2];
      unint64_t v37 = v32[3];
      if (v38 >= v37 >> 1) {
        int64_t v32 = sub_2287E7AE4((void *)(v37 > 1), v38 + 1, 1, v32);
      }
      uint64_t result = v34;
      ++v30;
      v32[2] = v38 + 1;
      id v39 = &v32[4 * v38];
      *((_OWORD *)v39 + 2) = v36;
      *((_OWORD *)v39 + 3) = v70;
      uint64_t v24 = v33;
    }
    while (v34 != v30);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_2287E2B00(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, char a7)
{
  uint64_t v49 = a4;
  *(void *)&long long v50 = a6;
  uint64_t v48 = a2;
  uint64_t v12 = sub_2287FA308();
  uint64_t v51 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA378();
  if (objc_msgSend(self, sel_isAppleInternalInstall))
  {
    long long v15 = (uint64_t *)(v7 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
    swift_beginAccess();
    uint64_t v16 = *v15;
    if (*(void *)(*v15 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_2287E7C14(a1);
      if (v18)
      {
        uint64_t v19 = *(void *)(v16 + 56) + 168 * v17;
        long long v21 = *(_OWORD *)(v19 + 16);
        long long v20 = *(_OWORD *)(v19 + 32);
        long long v60 = *(_OWORD *)v19;
        long long v61 = v21;
        long long v62 = v20;
        long long v22 = *(_OWORD *)(v19 + 48);
        long long v23 = *(_OWORD *)(v19 + 64);
        long long v24 = *(_OWORD *)(v19 + 96);
        v64[1] = *(_OWORD *)(v19 + 80);
        long long v65 = v24;
        long long v63 = v22;
        v64[0] = v23;
        long long v25 = *(_OWORD *)(v19 + 112);
        long long v26 = *(_OWORD *)(v19 + 128);
        long long v27 = *(_OWORD *)(v19 + 144);
        *(void *)&v68[1] = *(void *)(v19 + 160);
        long long v67 = v26;
        v68[0] = v27;
        long long v66 = v25;
        sub_2287E6D1C((uint64_t)&v60);
        swift_bridgeObjectRelease();
        int v45 = LOBYTE(v64[0]);
        long long v47 = *(_OWORD *)((char *)v64 + 8);
        uint64_t v28 = *((void *)&v64[1] + 1);
        uint64_t v29 = *((void *)&v65 + 1);
        uint64_t v46 = v65;
        uint64_t v30 = v63;
        uint64_t v42 = *((void *)&v62 + 1);
        uint64_t v43 = v62;
        if ((a3 & 1) == 0) {
          uint64_t v29 = v48;
        }
        uint64_t v44 = v29;
        uint64_t v31 = *((void *)&v63 + 1);
        char v32 = a3 & v66;
        if (a5) {
          uint64_t v33 = *((void *)&v66 + 1);
        }
        else {
          uint64_t v33 = v49;
        }
        char v34 = a5 & v67;
        uint64_t v35 = v50;
        if (a7) {
          uint64_t v35 = *((void *)&v67 + 1);
        }
        uint64_t v48 = v33;
        uint64_t v49 = v35;
        char v36 = a7 & v68[0];
        unint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
        long long v40 = v61;
        long long v41 = v60;
        long long v50 = *(_OWORD *)((char *)v68 + 8);
        v37(v14, a1, v12);
        char v58 = v32 & 1;
        char v56 = v34 & 1;
        char v54 = v36 & 1;
        v69[0] = v41;
        v69[1] = v40;
        uint64_t v70 = v43;
        uint64_t v71 = v42;
        uint64_t v72 = v30;
        uint64_t v73 = v31;
        char v74 = v45;
        *(_DWORD *)long long v75 = *(_DWORD *)v59;
        *(_DWORD *)&_OWORD v75[3] = *(_DWORD *)&v59[3];
        long long v76 = v47;
        uint64_t v77 = v28;
        uint64_t v78 = v46;
        uint64_t v79 = v44;
        char v80 = v32 & 1;
        *(_DWORD *)&v81[3] = *(_DWORD *)&v57[3];
        *(_DWORD *)long long v81 = *(_DWORD *)v57;
        uint64_t v82 = v48;
        char v83 = v34 & 1;
        *(_DWORD *)&v84[3] = *(_DWORD *)&v55[3];
        *(_DWORD *)char v84 = *(_DWORD *)v55;
        uint64_t v85 = v49;
        char v86 = v36 & 1;
        *(_DWORD *)long long v87 = *(_DWORD *)v53;
        *(_DWORD *)&v87[3] = *(_DWORD *)&v53[3];
        long long v88 = v50;
        swift_beginAccess();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v52 = *v15;
        uint64_t *v15 = 0x8000000000000000;
        sub_2287E9424((uint64_t)v69, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
        uint64_t *v15 = v52;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v12);
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  return sub_2287FA388();
}

void sub_2287E2EB8(uint64_t a1@<X0>, void *a2@<X1>, id a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v51 = a4;
  uint64_t v48 = (void *)sub_2287FA2D8();
  uint64_t v7 = *(v48 - 1);
  MEMORY[0x270FA5388](v48);
  uint64_t v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287E734C(0, &qword_268265690, (uint64_t (*)(uint64_t))sub_2287E73B0, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v46 - v11;
  sub_2287E73B0();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v49 = (uint64_t)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    a3 = objc_msgSend(a2, sel_firstConceptIdentifier);
  }
  else {
    id v17 = a3;
  }
  uint64_t v18 = sub_2287FA308();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(a1, 1, v18) != 1) {
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_13:
    long long v27 = v51;
    *uint64_t v51 = xmmword_2287FCEA0;
    *((void *)v27 + 2) = 0;
    *((unsigned char *)v27 + 24) = 0;
    return;
  }
  uint64_t v20 = v50 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds;
  swift_beginAccess();
  uint64_t v21 = *(void *)(*(void *)v20 + 16);
  if (!v21)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v12, 1, 1, v14);
    goto LABEL_12;
  }
  sub_2287E7440(*(void *)v20+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * (v21 - 1), (uint64_t)v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) == 1)
  {
LABEL_12:

    sub_2287ED264((uint64_t)v12, &qword_268265690, (uint64_t (*)(uint64_t))sub_2287E73B0);
    goto LABEL_13;
  }
  uint64_t v22 = *(int *)(v14 + 48);
  uint64_t v23 = v49;
  uint64_t v24 = v49 + v22;
  long long v25 = &v12[v22];
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v49, v12, v18);
  long long v26 = v48;
  (*(void (**)(uint64_t, char *, void *))(v7 + 32))(v24, v25, v48);
  a3 = a3;
  sub_2287E09B8((uint64_t)v52);
  sub_2287C59C8((uint64_t)v52, (uint64_t)v53);
  sub_2287C59C8((uint64_t)v53, (uint64_t)v54);
  if (sub_2287C5A50(v54) == 1)
  {
    sub_2287E7CAC(v23);

LABEL_10:
    goto LABEL_13;
  }
  sub_2287FA2C8();
  sub_2287FA2A8();
  double v29 = v28;
  (*(void (**)(char *, void *))(v7 + 8))(v9, v26);
  if ((~*(void *)&v29 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v29 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v29 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    return;
  }
  uint64_t v30 = (uint64_t)v29;
  uint64_t v50 = v54[5];
  id v31 = objc_msgSend(a3, sel_numberRepresentation);
  id v32 = objc_msgSend(v31, sel_stringValue);

  uint64_t v33 = sub_2287FAD68();
  uint64_t v35 = v34;

  uint64_t v36 = v54[20];
  swift_bridgeObjectRetain();
  sub_2287C5A68(v53);
  uint64_t v37 = *(void *)(v36 + 16);
  if (!v37)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v38 = 0;
    char v42 = 1;
    goto LABEL_27;
  }
  uint64_t v47 = (uint64_t)v29;
  uint64_t v48 = a3;
  uint64_t v38 = 0;
  v46[1] = v36;
  uint64_t v39 = v36 + 56;
  while (!*(void *)(*(void *)(v39 - 24) + 16))
  {
LABEL_19:
    ++v38;
    v39 += 32;
    if (v37 == v38)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v41 = v48;

      uint64_t v38 = 0;
      char v42 = 1;
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2287E7D6C(v33, v35);
  if ((v40 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  id v43 = v48;

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v42 = 0;
LABEL_26:
  uint64_t v30 = v47;
LABEL_27:
  BOOL v44 = v50 == 0;
  sub_2287E7CAC(v49);
  int v45 = v51;
  *(void *)uint64_t v51 = v30;
  *((void *)v45 + 1) = v44;
  *((void *)v45 + 2) = v38;
  *((unsigned char *)v45 + 24) = v42;
}

void (*sub_2287E34F4(uint64_t a1))(char *, uint64_t)
{
  uint64_t v3 = v1;
  uint64_t v177 = *MEMORY[0x263EF8340];
  uint64_t v161 = (void (*)(char *, uint64_t))sub_2287FAD88();
  uint64_t v162 = (void *)*((void *)v161 - 1);
  uint64_t v5 = MEMORY[0x270FA5388](v161);
  id v137 = (char *)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v160 = (char *)&v122 - v7;
  uint64_t v8 = sub_2287FA278();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  double v149 = (char *)&v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v152 = (char *)&v122 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v135 = (char *)&v122 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  char v138 = (char *)&v122 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v151 = (char *)&v122 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  double v154 = (char *)&v122 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v156 = (char *)&v122 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  CGFloat v158 = (char *)&v122 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  double v163 = (char *)&v122 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v122 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v122 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v122 - v34;
  uint64_t v36 = *(void *)a1;
  uint64_t v164 = *(void *)(a1 + 8);
  unint64_t v159 = *(void *)(a1 + 16);
  uint64_t v157 = *(void *)(a1 + 24);
  uint64_t v136 = *(void *)(a1 + 32);
  unint64_t v140 = *(void *)(a1 + 40);
  uint64_t v139 = *(void *)(a1 + 56);
  LODWORD(v148) = *(unsigned __int8 *)(a1 + 64);
  unint64_t v37 = *(void *)(a1 + 72);
  uint64_t v38 = *(void (**)(uint64_t, void *))(a1 + 80);
  uint64_t v39 = *(void **)(a1 + 88);
  uint64_t v147 = *(uint64_t (**)())(a1 + 96);
  uint64_t v146 = *(void *)(a1 + 104);
  int v145 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v144 = *(void *)(a1 + 120);
  int v143 = *(unsigned __int8 *)(a1 + 128);
  uint64_t v142 = *(void *)(a1 + 136);
  int v141 = *(unsigned __int8 *)(a1 + 144);
  uint64_t v40 = *(void *)(a1 + 152);
  uint64_t v41 = *(void *)(a1 + 160);
  uint64_t v155 = v40;
  if (!objc_msgSend(self, sel_isAppleInternalInstall)) {
    return (void (*)(char *, uint64_t))MEMORY[0x263F8EE78];
  }
  uint64_t v131 = v41;
  char v134 = v33;
  uint64_t v153 = v9;
  uint64_t v150 = v8;
  uint64_t v133 = v2;
  sub_2287FAF18();
  sub_2287FA248();
  swift_bridgeObjectRelease();
  id v42 = objc_msgSend(self, sel_defaultManager);
  id v43 = (void *)sub_2287FA238();
  sub_2287E95F4();
  uint64_t inited = swift_initStackObject();
  int v45 = (void **)MEMORY[0x263F080A8];
  *(_OWORD *)(inited + 16) = xmmword_2287FC840;
  uint64_t v46 = *v45;
  *(void *)(inited + 32) = *v45;
  uint64_t v47 = (void *)*MEMORY[0x263F08098];
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 64) = v48;
  *(void *)(inited + 40) = v47;
  id v49 = v46;
  id v50 = v47;
  sub_2287DC4C8(inited, (void (*)(void))sub_2287ED5DC, &qword_2682656D8, type metadata accessor for FileAttributeKey);
  type metadata accessor for FileAttributeKey(0);
  sub_2287ED894(&qword_268264FD8, type metadata accessor for FileAttributeKey);
  uint64_t v51 = (void *)sub_2287FACF8();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0;
  LODWORD(inited) = objc_msgSend(v42, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v43, 1, v51, &aBlock);

  if (inited)
  {
    id v132 = v42;
    long long v130 = v30;
    id v52 = (id)aBlock;
    int v53 = v134;
    sub_2287FA248();
    uint64_t v54 = *(void *)(v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_encoder);
    uint64_t aBlock = v36;
    sub_2287ED8DC(0, &qword_268265548, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_2287E698C(&qword_268265550);
    swift_bridgeObjectRetain();
    uint64_t v55 = v133;
    uint64_t v56 = sub_2287FA1D8();
    if (v55)
    {
      swift_bridgeObjectRelease();

      char v58 = *(void (**)(char *, uint64_t))(v153 + 8);
      uint64_t v59 = v150;
      v58(v53, v150);
      v58(v35, v59);
    }
    else
    {
      unint64_t v60 = v57;
      uint64_t v133 = v54;
      long long v129 = v35;
      uint64_t v61 = v56;
      swift_bridgeObjectRelease();
      sub_2287FA288();
      uint64_t v127 = v61;
      unint64_t v128 = v60;
      sub_2287FA248();
      uint64_t aBlock = v164;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_2287FA1D8();
      uint64_t v65 = v64;
      uint64_t v66 = v62;
      swift_bridgeObjectRelease();
      sub_2287FA288();
      uint64_t v126 = v66;
      uint64_t v164 = v65;
      sub_2287FA248();
      uint64_t aBlock = v159;
      sub_2287E96CC();
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_2287FAD18();
      unint64_t v69 = v68;
      swift_bridgeObjectRelease();
      uint64_t aBlock = v67;
      unint64_t v167 = v69;
      uint64_t v70 = v160;
      sub_2287FAD78();
      unint64_t v71 = sub_2287E9748();
      sub_2287FB268();
      unint64_t v159 = v71;
      uint64_t v72 = v162 + 1;
      uint64_t v160 = (char *)v162[1];
      ((void (*)(char *, void))v160)(v70, v161);
      swift_bridgeObjectRelease();
      sub_2287FA248();
      uint64_t aBlock = v157;
      sub_2287ED8DC(0, &qword_268265558, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8D488]);
      unint64_t v74 = v73;
      unint64_t v75 = sub_2287E6680();
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_2287FA1D8();
      uint64_t v124 = v75;
      unint64_t v125 = v74;
      uint64_t v162 = v72;
      uint64_t v78 = v77;
      swift_bridgeObjectRelease();
      sub_2287FA288();
      uint64_t v157 = v76;
      sub_2287FA248();
      uint64_t aBlock = v155;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_2287FA1D8();
      unint64_t v81 = v80;
      swift_bridgeObjectRelease();
      sub_2287FA288();
      uint64_t v124 = v79;
      unint64_t v125 = v81;
      uint64_t v155 = v78;
      sub_2287FA248();
      uint64_t aBlock = v131;
      sub_2287ED8DC(0, &qword_268265590, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8D488]);
      sub_2287E68A4();
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_2287FA1D8();
      unint64_t v123 = v82;
      swift_bridgeObjectRelease();
      sub_2287FA288();
      sub_2287FA248();
      LOBYTE(aBlock) = v148;
      unint64_t v167 = v37;
      CGFloat v168 = v38;
      v169 = v39;
      v170 = v147;
      uint64_t v171 = v146;
      char v172 = v145;
      uint64_t v173 = v144;
      char v174 = v143;
      uint64_t v175 = v142;
      char v176 = v141;
      sub_2287E6850();
      uint64_t v147 = (uint64_t (*)())sub_2287FA1D8();
      unint64_t v148 = v83;
      sub_2287FA288();
      uint64_t v133 = 0;
      if (v140)
      {
        sub_2287FA248();
        uint64_t aBlock = v136;
        unint64_t v167 = v140;
        sub_2287FAD78();
        uint64_t v84 = v133;
        sub_2287FB268();
        uint64_t v133 = v84;
        if (v84)
        {
          sub_2287E9674((uint64_t)v147, v148);
          sub_2287E9674(v122, v123);
          sub_2287E9674(v124, v125);
          sub_2287E9674(v157, v155);
          sub_2287E9674(v126, v164);
          sub_2287E9674(v127, v128);

          ((void (*)(char *, void))v160)(v137, v161);
          char v58 = *(void (**)(char *, uint64_t))(v153 + 8);
          uint64_t v85 = v150;
          v58(v138, v150);
          v58(v151, v85);
          v58(v154, v85);
          v58(v156, v85);
          v58(v158, v85);
          v58(v163, v85);
          v58(v130, v85);
          v58(v134, v85);
          v58(v129, v85);
          return v58;
        }
        ((void (*)(char *, void))v160)(v137, v161);
        (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v135, v138, v150);
        uint64_t v162 = (void *)sub_2287E7848(0, 1, 1, MEMORY[0x263F8EE78], &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
        unint64_t v87 = v162[2];
        unint64_t v86 = v162[3];
        if (v87 >= v86 >> 1) {
          uint64_t v162 = (void *)sub_2287E7848(v86 > 1, v87 + 1, 1, (unint64_t)v162, &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
        }
        long long v88 = v162;
        v162[2] = v87 + 1;
        uint64_t v89 = v153;
        uint64_t v90 = v150;
        (*(void (**)(unint64_t, char *, uint64_t))(v153 + 32))((unint64_t)v88+ ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80))+ *(void *)(v89 + 72) * v87, v135, v150);
        (*(void (**)(char *, uint64_t))(v89 + 8))(v138, v90);
      }
      else
      {
        uint64_t v162 = (void *)MEMORY[0x263F8EE78];
      }
      if (*(void *)(v139 + 16))
      {
        uint64_t v91 = *(void *)(v139 + 16);
        uint64_t v160 = (char *)(v153 + 16);
        unint64_t v159 = v153 + 32;
        uint64_t v161 = (void (*)(char *, uint64_t))(v153 + 8);
        uint64_t v92 = 0;
        char v93 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
        while (1)
        {
          uint64_t v94 = *(v93 - 1);
          unint64_t v95 = *v93;
          uint64_t aBlock = 0;
          unint64_t v167 = 0xE000000000000000;
          sub_2287E979C(v94, v95);
          sub_2287FB348();
          swift_bridgeObjectRelease();
          uint64_t aBlock = 0x656D686361747461;
          unint64_t v167 = 0xEB000000005F746ELL;
          uint64_t v165 = v92;
          sub_2287FB598();
          sub_2287FAE08();
          swift_bridgeObjectRelease();
          sub_2287FAE08();
          sub_2287FA248();
          swift_bridgeObjectRelease();
          uint64_t v96 = v133;
          sub_2287FA288();
          uint64_t v133 = v96;
          if (v96) {
            break;
          }
          (*(void (**)(char *, char *, uint64_t))v160)(v149, v152, v150);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v162 = (void *)sub_2287E7848(0, v162[2] + 1, 1, (unint64_t)v162, &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
          }
          unint64_t v98 = v162[2];
          unint64_t v97 = v162[3];
          if (v98 >= v97 >> 1) {
            uint64_t v162 = (void *)sub_2287E7848(v97 > 1, v98 + 1, 1, (unint64_t)v162, &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
          }
          ++v92;
          v93 += 2;
          long long v99 = v162;
          v162[2] = v98 + 1;
          uint64_t v100 = v153;
          uint64_t v101 = v150;
          (*(void (**)(unint64_t, char *, uint64_t))(v153 + 32))((unint64_t)v99+ ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))+ *(void *)(v100 + 72) * v98, v149, v150);
          sub_2287E9674(v94, v95);
          (*(void (**)(char *, uint64_t))(v100 + 8))(v152, v101);
          if (v91 == v92)
          {
            swift_bridgeObjectRelease();
            goto LABEL_26;
          }
        }
        sub_2287E9674(v94, v95);
        sub_2287E9674((uint64_t)v147, v148);
        sub_2287E9674(v122, v123);
        sub_2287E9674(v124, v125);
        sub_2287E9674(v157, v155);
        sub_2287E9674(v126, v164);
        sub_2287E9674(v127, v128);

        char v58 = v161;
        long long v102 = *(void (**)(char *, uint64_t))v161;
        uint64_t v103 = v150;
        (*(void (**)(char *, uint64_t))v161)(v152, v150);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v102(v151, v103);
        v102(v154, v103);
        v102(v156, v103);
        v102(v158, v103);
        v102(v163, v103);
        v102(v130, v103);
        v102(v134, v103);
        v102(v129, v103);
      }
      else
      {
LABEL_26:
        uint64_t v104 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer;
        objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer), sel_invalidate, v122, v123);
        long long v105 = self;
        double v106 = *(double *)(v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod);
        uint64_t v107 = swift_allocObject();
        swift_weakInit();
        v170 = sub_2287E982C;
        uint64_t v171 = v107;
        uint64_t aBlock = MEMORY[0x263EF8330];
        unint64_t v167 = 1107296256;
        CGFloat v168 = sub_2287E13AC;
        v169 = &block_descriptor_3;
        long long v108 = _Block_copy(&aBlock);
        swift_release();
        id v109 = objc_msgSend(v105, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v108, v106);
        _Block_release(v108);
        uint64_t v110 = *(void **)(v3 + v104);
        *(void *)(v3 + v104) = v109;

        sub_2287E734C(0, &qword_2682656F8, MEMORY[0x263F06EA8], MEMORY[0x263F8E0F8]);
        uint64_t v111 = v153;
        uint64_t v112 = *(void *)(v153 + 72);
        unint64_t v113 = (*(unsigned __int8 *)(v153 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v153 + 80);
        char v114 = (_OWORD *)swift_allocObject();
        v114[1] = xmmword_2287FCEB0;
        char v115 = (char *)v114 + v113;
        char v116 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
        uint64_t v117 = v150;
        v116(v115, v134, v150);
        v116(&v115[v112], v130, v117);
        v116(&v115[2 * v112], v163, v117);
        v116(&v115[3 * v112], v158, v117);
        v116(&v115[4 * v112], v156, v117);
        long long v118 = v154;
        v116(&v115[5 * v112], v154, v117);
        long long v119 = &v115[6 * v112];
        long long v120 = v151;
        v116(v119, v151, v117);
        uint64_t aBlock = (uint64_t)v114;
        sub_2287DC8A8((uint64_t)v162);
        sub_2287E9674((uint64_t)v147, v148);
        sub_2287E9674(v122, v123);
        sub_2287E9674(v124, v125);
        sub_2287E9674(v157, v155);
        sub_2287E9674(v126, v164);
        sub_2287E9674(v127, v128);

        char v58 = (void (*)(char *, uint64_t))aBlock;
        long long v121 = *(void (**)(char *, uint64_t))(v111 + 8);
        v121(v120, v117);
        v121(v118, v117);
        v121(v156, v117);
        v121(v158, v117);
        v121(v163, v117);
        v121(v130, v117);
        v121(v134, v117);
        v121(v129, v117);
      }
    }
  }
  else
  {
    char v58 = (void (*)(char *, uint64_t))(id)aBlock;
    sub_2287FA228();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v153 + 8))(v35, v150);
  }
  return v58;
}

uint64_t sub_2287E5530(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2287FA308();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  long long v108 = (char *)v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v98 = (char *)v83 - v9;
  MEMORY[0x270FA5388](v8);
  unint64_t v86 = (char *)v83 - v10;
  sub_2287E73B0();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)v83 - v17);
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2287E734C(0, &qword_2682651C0, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  unint64_t v97 = (char *)v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v83 - v23;
  sub_2287E734C(0, &qword_268265690, (uint64_t (*)(uint64_t))sub_2287E73B0, v19);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)v83 - v26;
  v83[1] = *(void *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_2287FA378();
  uint64_t v100 = v2;
  uint64_t v28 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds);
  swift_beginAccess();
  uint64_t v29 = *v28;
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v87 = v5;
  uint64_t v107 = v24;
  if (v30)
  {
    uint64_t v106 = v30;
    uint64_t v93 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod;
    uint64_t v31 = v29 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    long long v99 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    uint64_t v96 = (unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v92 = *(void *)(v13 + 72);
    uint64_t v32 = (void (**)(void, void, void))(v5 + 16);
    uint64_t v91 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v104 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v90 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    uint64_t v89 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v83[0] = v29;
    uint64_t v33 = v31;
    swift_bridgeObjectRetain();
    unint64_t v34 = MEMORY[0x263F8EE78];
    uint64_t v85 = v4;
    uint64_t v95 = v12;
    uint64_t v35 = v16;
    uint64_t v94 = v27;
    uint64_t v84 = v32;
    uint64_t v103 = v18;
    while (1)
    {
      sub_2287E7440(v33, (uint64_t)v27);
      long long v88 = *v99;
      v88(v27, 0, 1, v12);
      if ((*v96)(v27, 1, v12) == 1) {
        break;
      }
      long long v105 = (void (*)(void, void, void))v33;
      unint64_t v109 = v34;
      sub_2287E7D08((uint64_t)v27, (uint64_t)v18);
      uint64_t v37 = *(int *)(v12 + 48);
      uint64_t v38 = &v35[v37];
      uint64_t v39 = (char *)v18 + v37;
      uint64_t v101 = (void (*)(char *, unsigned int (**)(char *, uint64_t, uint64_t), uint64_t))*v32;
      v101(v35, v18, v4);
      uint64_t v40 = sub_2287FA2D8();
      uint64_t v41 = *(void *)(v40 - 8);
      id v42 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
      long long v102 = (void (**)(char *, char *, uint64_t))v39;
      v42(v38, v39, v40);
      sub_2287FA298();
      double v44 = v43;
      uint64_t v45 = v12;
      uint64_t v46 = *(void (**)(char *, uint64_t))(v41 + 8);
      v46(v38, v40);
      (*v91)(v35, v4);
      if (*(double *)(v100 + v93) <= a1 - v44)
      {
        uint64_t v48 = &v35[*(int *)(v45 + 48)];
        v101(v35, v103, v4);
        v42(v48, (char *)v102, v40);
        uint64_t v47 = (uint64_t)v97;
        (*v104)(v97, v35, v4);
        (*v90)(v47, 0, 1, v4);
        v46(v48, v40);
      }
      else
      {
        uint64_t v47 = (uint64_t)v97;
        (*v90)((uint64_t)v97, 1, 1, v4);
      }
      unint64_t v34 = v109;
      uint64_t v18 = v103;
      sub_2287E7CAC((uint64_t)v103);
      int v49 = (*v89)(v47, 1, v4);
      uint64_t v24 = v107;
      uint64_t v27 = v94;
      if (v49 == 1)
      {
        sub_2287ED264(v47, &qword_2682651C0, MEMORY[0x263F07508]);
        uint64_t v12 = v95;
        uint64_t v36 = v105;
      }
      else
      {
        id v50 = *v104;
        uint64_t v51 = v86;
        (*v104)(v86, (char *)v47, v4);
        v50(v98, v51, v4);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v12 = v95;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v34 = sub_2287E7848(0, *(void *)(v34 + 16) + 1, 1, v34, &qword_2682657A0, MEMORY[0x263F07508], MEMORY[0x263F07508], MEMORY[0x263F07508]);
        }
        unint64_t v54 = *(void *)(v34 + 16);
        unint64_t v53 = *(void *)(v34 + 24);
        uint64_t v55 = v87;
        if (v54 >= v53 >> 1)
        {
          uint64_t v57 = sub_2287E7848(v53 > 1, v54 + 1, 1, v34, &qword_2682657A0, MEMORY[0x263F07508], MEMORY[0x263F07508], MEMORY[0x263F07508]);
          uint64_t v55 = v87;
          unint64_t v34 = v57;
        }
        *(void *)(v34 + 16) = v54 + 1;
        unint64_t v56 = v34
            + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))
            + *(void *)(v55 + 72) * v54;
        uint64_t v4 = v85;
        v50((char *)v56, v98, v85);
        uint64_t v36 = v105;
        uint64_t v32 = v84;
      }
      uint64_t v33 = (uint64_t)v36 + v92;
      if (!--v106)
      {
        v88(v27, 1, 1, v12);
        break;
      }
    }
  }
  else
  {
    char v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain();
    unint64_t v34 = MEMORY[0x263F8EE78];
    v58(v27, 1, 1, v12);
  }
  swift_bridgeObjectRelease();
  uint64_t v59 = *(void *)(v34 + 16);
  unint64_t v109 = v34;
  if (v59)
  {
    unint64_t v60 = (uint64_t *)(v100 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
    uint64_t v61 = v87 + 16;
    long long v105 = *(void (**)(void, void, void))(v87 + 16);
    unint64_t v62 = v34 + ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80));
    uint64_t v106 = *(void *)(v87 + 72);
    uint64_t v103 = (unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48);
    long long v102 = (void (**)(char *, char *, uint64_t))(v87 + 32);
    long long v63 = (void (**)(unint64_t, uint64_t))(v87 + 8);
    uint64_t v104 = (void (**)(char *, char *, uint64_t))(v87 + 56);
    uint64_t v101 = (void (*)(char *, unsigned int (**)(char *, uint64_t, uint64_t), uint64_t))((v87 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
    while (1)
    {
      uint64_t v74 = v61;
      v105(v24, v62, v4);
      unint64_t v75 = *v104;
      ((void (*)(char *, void, uint64_t, uint64_t))*v104)(v24, 0, 1, v4);
      if ((*v103)(v24, 1, v4) == 1) {
        break;
      }
      uint64_t v76 = (uint64_t)v108;
      (*v102)(v108, v24, v4);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v77 = sub_2287E7C14(v76);
      char v79 = v78;
      swift_bridgeObjectRelease();
      if (v79)
      {
        int v80 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v81 = *v60;
        uint64_t v112 = *v60;
        *unint64_t v60 = 0x8000000000000000;
        if (!v80)
        {
          sub_2287EB4A8();
          uint64_t v81 = v112;
        }
        (*v63)(*(void *)(v81 + 48) + v77 * v106, v4);
        uint64_t v64 = v112;
        uint64_t v65 = *(void *)(v112 + 56) + 168 * v77;
        long long v67 = *(_OWORD *)(v65 + 16);
        long long v66 = *(_OWORD *)(v65 + 32);
        v110[0] = *(_OWORD *)v65;
        v110[1] = v67;
        v110[2] = v66;
        long long v68 = *(_OWORD *)(v65 + 96);
        long long v70 = *(_OWORD *)(v65 + 48);
        long long v69 = *(_OWORD *)(v65 + 64);
        v110[5] = *(_OWORD *)(v65 + 80);
        v110[6] = v68;
        v110[3] = v70;
        v110[4] = v69;
        long long v72 = *(_OWORD *)(v65 + 128);
        long long v71 = *(_OWORD *)(v65 + 144);
        long long v73 = *(_OWORD *)(v65 + 112);
        uint64_t v111 = *(void *)(v65 + 160);
        v110[8] = v72;
        v110[9] = v71;
        v110[7] = v73;
        sub_2287E9108(v77, v112);
        *unint64_t v60 = v64;
        swift_bridgeObjectRelease();
        sub_2287E6DA8((uint64_t)v110);
      }
      swift_endAccess();
      (*v63)((unint64_t)v108, v4);
      v62 += v106;
      --v59;
      uint64_t v61 = v74;
      uint64_t v24 = v107;
      if (!v59)
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v75)(v107, 1, 1, v4);
        break;
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v24, 1, 1, v4);
  }
  swift_bridgeObjectRelease();
  return sub_2287FA388();
}

uint64_t sub_2287E60C8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2287E6120();
    return swift_release();
  }
  return result;
}

void sub_2287E6120()
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_2287FA7A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(self, sel_defaultManager);
  sub_2287FA268();
  uint64_t v4 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  unsigned int v5 = objc_msgSend(v15, sel_fileExistsAtPath_, v4);

  if (v5)
  {
    uint64_t v6 = (void *)sub_2287FA238();
    v16[0] = 0;
    unsigned int v7 = objc_msgSend(v15, sel_removeItemAtURL_error_, v6, v16);

    if (v7)
    {
      id v8 = v16[0];
    }
    else
    {
      id v10 = v16[0];
      uint64_t v11 = (void *)sub_2287FA228();

      swift_willThrow();
      sub_2287FA778();
      uint64_t v12 = sub_2287FA798();
      os_log_type_t v13 = sub_2287FAF78();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_2287C0000, v12, v13, "Failed to clear scanning persisted logs", v14, 2u);
        MEMORY[0x22A69ED10](v14, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
  }
  else
  {
    id v9 = v15;
  }
}

void *sub_2287E63B4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED8DC(0, &qword_268265800, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8E0F8]);
      id v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2287EC0FC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2287E64FC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED8DC(0, &qword_268265808, (uint64_t)&type metadata for SpecificProductResult, MEMORY[0x263F8E0F8]);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      os_log_type_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2287EC1F4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2287E662C()
{
  unint64_t result = qword_268265540;
  if (!qword_268265540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265540);
  }
  return result;
}

unint64_t sub_2287E6680()
{
  unint64_t result = qword_268265560;
  if (!qword_268265560)
  {
    sub_2287ED8DC(255, &qword_268265558, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8D488]);
    sub_2287E6714();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265560);
  }
  return result;
}

unint64_t sub_2287E6714()
{
  unint64_t result = qword_268265568;
  if (!qword_268265568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265568);
  }
  return result;
}

unint64_t sub_2287E6768()
{
  unint64_t result = qword_268265578;
  if (!qword_268265578)
  {
    sub_2287ED8DC(255, &qword_268265570, MEMORY[0x263F06F78], MEMORY[0x263F8D488]);
    sub_2287E67FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265578);
  }
  return result;
}

unint64_t sub_2287E67FC()
{
  unint64_t result = qword_268265580;
  if (!qword_268265580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265580);
  }
  return result;
}

unint64_t sub_2287E6850()
{
  unint64_t result = qword_268265588;
  if (!qword_268265588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265588);
  }
  return result;
}

unint64_t sub_2287E68A4()
{
  unint64_t result = qword_268265598;
  if (!qword_268265598)
  {
    sub_2287ED8DC(255, &qword_268265590, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8D488]);
    sub_2287E6938();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265598);
  }
  return result;
}

unint64_t sub_2287E6938()
{
  unint64_t result = qword_2682655A0;
  if (!qword_2682655A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655A0);
  }
  return result;
}

uint64_t sub_2287E698C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2287ED8DC(255, &qword_268265548, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2287E6A10()
{
  unint64_t result = qword_2682655B8;
  if (!qword_2682655B8)
  {
    sub_2287ED8DC(255, &qword_268265558, (uint64_t)&type metadata for ClinicalProductResultGroup, MEMORY[0x263F8D488]);
    sub_2287E6AA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655B8);
  }
  return result;
}

unint64_t sub_2287E6AA4()
{
  unint64_t result = qword_2682655C0;
  if (!qword_2682655C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655C0);
  }
  return result;
}

unint64_t sub_2287E6AF8()
{
  unint64_t result = qword_2682655C8;
  if (!qword_2682655C8)
  {
    sub_2287ED8DC(255, &qword_268265570, MEMORY[0x263F06F78], MEMORY[0x263F8D488]);
    sub_2287E6B8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655C8);
  }
  return result;
}

unint64_t sub_2287E6B8C()
{
  unint64_t result = qword_2682655D0;
  if (!qword_2682655D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655D0);
  }
  return result;
}

unint64_t sub_2287E6BE0()
{
  unint64_t result = qword_2682655D8;
  if (!qword_2682655D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655D8);
  }
  return result;
}

unint64_t sub_2287E6C34()
{
  unint64_t result = qword_2682655E0;
  if (!qword_2682655E0)
  {
    sub_2287ED8DC(255, &qword_268265590, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8D488]);
    sub_2287E6CC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655E0);
  }
  return result;
}

unint64_t sub_2287E6CC8()
{
  unint64_t result = qword_2682655E8;
  if (!qword_2682655E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655E8);
  }
  return result;
}

uint64_t sub_2287E6D1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2287E6DA8(uint64_t a1)
{
  return a1;
}

unint64_t sub_2287E6E34()
{
  unint64_t result = qword_2682655F8;
  if (!qword_2682655F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682655F8);
  }
  return result;
}

unint64_t sub_2287E6E88()
{
  unint64_t result = qword_268265608;
  if (!qword_268265608)
  {
    sub_2287ED8DC(255, &qword_268265600, (uint64_t)&type metadata for SpecificProductResult, MEMORY[0x263F8D488]);
    sub_2287E6F1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265608);
  }
  return result;
}

unint64_t sub_2287E6F1C()
{
  unint64_t result = qword_268265610;
  if (!qword_268265610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265610);
  }
  return result;
}

unint64_t sub_2287E6F70()
{
  unint64_t result = qword_268265620;
  if (!qword_268265620)
  {
    sub_2287ED8DC(255, &qword_268265600, (uint64_t)&type metadata for SpecificProductResult, MEMORY[0x263F8D488]);
    sub_2287E7004();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265620);
  }
  return result;
}

unint64_t sub_2287E7004()
{
  unint64_t result = qword_268265628;
  if (!qword_268265628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265628);
  }
  return result;
}

unint64_t sub_2287E7058()
{
  unint64_t result = qword_268265638;
  if (!qword_268265638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265638);
  }
  return result;
}

unint64_t sub_2287E70AC()
{
  unint64_t result = qword_268265650;
  if (!qword_268265650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265650);
  }
  return result;
}

unint64_t sub_2287E7100()
{
  unint64_t result = qword_268265670;
  if (!qword_268265670)
  {
    sub_2287ED7D8(255, &qword_268265668, MEMORY[0x263F8D488]);
    sub_2287E7218(&qword_268265660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265670);
  }
  return result;
}

void sub_2287E71B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t sub_2287E7218(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2287ED99C(255, &qword_268265658, MEMORY[0x263F8D310], MEMORY[0x263F8D060]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2287E729C()
{
  unint64_t result = qword_268265688;
  if (!qword_268265688)
  {
    sub_2287ED7D8(255, &qword_268265668, MEMORY[0x263F8D488]);
    sub_2287E7218(&qword_268265680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265688);
  }
  return result;
}

void sub_2287E734C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_2287E73B0()
{
  if (!qword_268265698)
  {
    sub_2287FA308();
    sub_2287FA2D8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268265698);
    }
  }
}

double sub_2287E7420(uint64_t a1)
{
  *(void *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_2287E7440(uint64_t a1, uint64_t a2)
{
  sub_2287E73B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_2287E74A4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED8DC(0, &qword_268265098, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      os_log_type_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2287EC2E0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2287E75D4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED8DC(0, &qword_268265790, (uint64_t)&type metadata for ScanResultGroupItem, MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2287EC3D4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2287E7720(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED7D8(0, &qword_2682657E0, MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      os_log_type_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2287ECE98(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2287E7848(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  if (a3)
  {
    unint64_t v12 = *(void *)(a4 + 24);
    uint64_t v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v13 = a2;
      }
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v13 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v13;
  }
  if (!v15)
  {
    uint64_t v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2287E734C(0, a5, a6, MEMORY[0x263F8E0F8]);
  uint64_t v16 = *(void *)(a7(0) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (void *)swift_allocObject();
  size_t v20 = _swift_stdlib_malloc_size(v19);
  if (!v17 || (v20 - v18 == 0x8000000000000000 ? (BOOL v21 = v17 == -1) : (BOOL v21 = 0), v21))
  {
LABEL_29:
    uint64_t result = sub_2287FB3F8();
    __break(1u);
    return result;
  }
  v19[2] = v14;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v17);
LABEL_19:
  uint64_t v22 = *(void *)(a7(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v19 + v23;
  if (a1)
  {
    if ((unint64_t)v19 < a4 || v24 >= a4 + v23 + *(void *)(v22 + 72) * v14)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v19 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2287ED2D4(0, v14, v24, a4, a8);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v19;
}

void *sub_2287E7AE4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_2287ED8DC(0, &qword_2682657C8, (uint64_t)&type metadata for ExpandedMedicationCluster, MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2287ED67C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2287E7C14(uint64_t a1)
{
  sub_2287FA308();
  sub_2287ED894(&qword_2682657A8, MEMORY[0x263F07508]);
  uint64_t v2 = sub_2287FAD08();
  return sub_2287E7E74(a1, v2);
}

uint64_t sub_2287E7CAC(uint64_t a1)
{
  sub_2287E73B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287E7D08(uint64_t a1, uint64_t a2)
{
  sub_2287E73B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2287E7D6C(uint64_t a1, uint64_t a2)
{
  sub_2287FB618();
  sub_2287FADE8();
  uint64_t v4 = sub_2287FB648();
  return sub_2287E8034(a1, a2, v4);
}

unint64_t sub_2287E7DE4(uint64_t a1)
{
  sub_2287FAD68();
  sub_2287FB618();
  sub_2287FADE8();
  uint64_t v2 = sub_2287FB648();
  swift_bridgeObjectRelease();
  return sub_2287E8118(a1, v2);
}

unint64_t sub_2287E7E74(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2287FA308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
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
    int64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_2287ED894(&qword_2682657F8, MEMORY[0x263F07508]);
      char v15 = sub_2287FAD28();
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

unint64_t sub_2287E8034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2287FB5B8() & 1) == 0)
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
      while (!v14 && (sub_2287FB5B8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2287E8118(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2287FAD68();
    uint64_t v8 = v7;
    if (v6 == sub_2287FAD68() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2287FB5B8();
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
          uint64_t v13 = sub_2287FAD68();
          uint64_t v15 = v14;
          if (v13 == sub_2287FAD68() && v15 == v16) {
            break;
          }
          char v18 = sub_2287FB5B8();
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

uint64_t sub_2287E8290(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_2287E82A4(a1, a2, a3, a4, &qword_268265398);
}

uint64_t sub_2287E82A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v6) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v10 = v6;
    if (v6 <= 0)
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
      if (v5 != a3)
      {
LABEL_7:
        if (v6 < 0) {
          goto LABEL_19;
        }
        unint64_t v14 = a2 + 8 * a3;
        if (v14 < (unint64_t)&v11[v10 + 4] && (unint64_t)(v11 + 4) < v14 + v10 * 8) {
          goto LABEL_19;
        }
        sub_2287C5C80(0, a5);
        swift_arrayInitWithCopy();
        return (uint64_t)v11;
      }
    }
    else
    {
      sub_2287ED8DC(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
      char v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v6;
      v11[3] = (2 * (v13 >> 3)) | 1;
      if (v5 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

void *sub_2287E8464(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_2287ED8DC(0, &qword_268265098, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2287EBD00((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2287ED17C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_2287E856C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_2287ED8DC(0, &qword_268265018, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_2287EBF00(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2287ED17C();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2287E867C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_2287FA308();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_2287ED430();
  int v64 = a2;
  uint64_t v10 = sub_2287FB448();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  char v58 = v2;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  unint64_t v60 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  int64_t v59 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v61 = v6 + 16;
  uint64_t v65 = (uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v63 = v9;
  uint64_t v62 = v6;
  while (1)
  {
    if (v15)
    {
      unint64_t v24 = __clz(__rbit64(v15));
      uint64_t v25 = (v15 - 1) & v15;
      unint64_t v26 = v24 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v27 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v27 >= v59) {
      break;
    }
    uint64_t v28 = v60;
    unint64_t v29 = v60[v27];
    ++v18;
    if (!v29)
    {
      int64_t v18 = v27 + 1;
      if (v27 + 1 >= v59) {
        goto LABEL_34;
      }
      unint64_t v29 = v60[v18];
      if (!v29)
      {
        int64_t v30 = v27 + 2;
        if (v30 >= v59)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v58;
          goto LABEL_36;
        }
        unint64_t v29 = v60[v30];
        if (!v29)
        {
          while (1)
          {
            int64_t v18 = v30 + 1;
            if (__OFADD__(v30, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v59) {
              goto LABEL_34;
            }
            unint64_t v29 = v60[v18];
            ++v30;
            if (v29) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v30;
      }
    }
LABEL_21:
    uint64_t v25 = (v29 - 1) & v29;
    unint64_t v26 = __clz(__rbit64(v29)) + (v18 << 6);
LABEL_22:
    int64_t v78 = v18;
    unint64_t v77 = v25;
    uint64_t v31 = *(void *)(v6 + 72);
    if (v64)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, *(void *)(v9 + 48) + v31 * v26, v5);
      uint64_t v32 = *(void *)(v9 + 56) + 168 * v26;
      long long v66 = *(_OWORD *)v32;
      long long v67 = *(_OWORD *)(v32 + 16);
      uint64_t v69 = *(void *)(v32 + 32);
      uint64_t v68 = *(void *)(v32 + 40);
      uint64_t v33 = *(void *)(v32 + 48);
      uint64_t v70 = *(void *)(v32 + 56);
      int v75 = *(unsigned __int8 *)(v32 + 64);
      uint64_t v34 = *(void *)(v32 + 72);
      uint64_t v35 = *(void *)(v32 + 80);
      uint64_t v36 = *(void *)(v32 + 88);
      uint64_t v74 = *(void *)(v32 + 96);
      uint64_t v73 = *(void *)(v32 + 104);
      char v37 = *(unsigned char *)(v32 + 112);
      uint64_t v72 = *(void *)(v32 + 120);
      char v38 = *(unsigned char *)(v32 + 128);
      uint64_t v71 = *(void *)(v32 + 136);
      uint64_t v39 = v8;
      char v40 = *(unsigned char *)(v32 + 144);
      long long v76 = *(_OWORD *)(v32 + 152);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v31 * v26, v5);
      uint64_t v41 = *(void *)(v9 + 56) + 168 * v26;
      long long v42 = *(_OWORD *)(v41 + 112);
      long long v43 = *(_OWORD *)(v41 + 128);
      long long v44 = *(_OWORD *)(v41 + 144);
      *(void *)&v92[16] = *(void *)(v41 + 160);
      long long v91 = v43;
      *(_OWORD *)uint64_t v92 = v44;
      long long v90 = v42;
      long long v45 = *(_OWORD *)(v41 + 48);
      long long v46 = *(_OWORD *)(v41 + 64);
      long long v47 = *(_OWORD *)(v41 + 96);
      long long v88 = *(_OWORD *)(v41 + 80);
      long long v89 = v47;
      long long v86 = v45;
      long long v87 = v46;
      long long v49 = *(_OWORD *)(v41 + 16);
      long long v48 = *(_OWORD *)(v41 + 32);
      v85[0] = *(_OWORD *)v41;
      v85[1] = v49;
      v85[2] = v48;
      long long v76 = *(_OWORD *)&v92[8];
      int v75 = v87;
      uint64_t v34 = *((void *)&v87 + 1);
      uint64_t v36 = *((void *)&v88 + 1);
      uint64_t v35 = v88;
      uint64_t v73 = *((void *)&v47 + 1);
      uint64_t v74 = v47;
      char v37 = v90;
      uint64_t v72 = *((void *)&v90 + 1);
      char v38 = v91;
      uint64_t v71 = *((void *)&v91 + 1);
      uint64_t v39 = v8;
      char v40 = v44;
      uint64_t v70 = *((void *)&v86 + 1);
      uint64_t v33 = v86;
      uint64_t v68 = *((void *)&v48 + 1);
      uint64_t v69 = v48;
      long long v67 = v49;
      long long v66 = v85[0];
      sub_2287E6D1C((uint64_t)v85);
    }
    sub_2287ED894(&qword_2682657A8, MEMORY[0x263F07508]);
    uint64_t v8 = v39;
    uint64_t result = sub_2287FAD08();
    uint64_t v50 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v51 = result & ~v50;
    unint64_t v52 = v51 >> 6;
    if (((-1 << v51) & ~*(void *)(v16 + 8 * (v51 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v51) & ~*(void *)(v16 + 8 * (v51 >> 6)))) | v51 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v53 = 0;
      unint64_t v54 = (unint64_t)(63 - v50) >> 6;
      do
      {
        if (++v52 == v54 && (v53 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v55 = v52 == v54;
        if (v52 == v54) {
          unint64_t v52 = 0;
        }
        v53 |= v55;
        uint64_t v56 = *(void *)(v16 + 8 * v52);
      }
      while (v56 == -1);
      unint64_t v19 = __clz(__rbit64(~v56)) + (v52 << 6);
    }
    char v84 = v37;
    char v82 = v38;
    char v80 = v40;
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = (*v65)(*(void *)(v11 + 48) + v31 * v19, v8, v5);
    uint64_t v20 = *(void *)(v11 + 56) + 168 * v19;
    long long v21 = v67;
    *(_OWORD *)uint64_t v20 = v66;
    *(_OWORD *)(v20 + 16) = v21;
    uint64_t v22 = v68;
    *(void *)(v20 + 32) = v69;
    *(void *)(v20 + 40) = v22;
    *(void *)(v20 + 48) = v33;
    *(void *)(v20 + 56) = v70;
    *(unsigned char *)(v20 + 64) = v75;
    *(_DWORD *)(v20 + 68) = *(_DWORD *)((char *)v85 + 3);
    *(_DWORD *)(v20 + 65) = v85[0];
    *(void *)(v20 + 72) = v34;
    *(void *)(v20 + 80) = v35;
    *(void *)(v20 + 88) = v36;
    uint64_t v23 = v73;
    *(void *)(v20 + 96) = v74;
    *(void *)(v20 + 104) = v23;
    *(unsigned char *)(v20 + 112) = v84;
    *(_DWORD *)(v20 + 113) = *(_DWORD *)v83;
    *(_DWORD *)(v20 + 116) = *(_DWORD *)&v83[3];
    *(void *)(v20 + 120) = v72;
    *(unsigned char *)(v20 + 128) = v82;
    *(_DWORD *)(v20 + 129) = *(_DWORD *)v81;
    *(_DWORD *)(v20 + 132) = *(_DWORD *)&v81[3];
    *(void *)(v20 + 136) = v71;
    *(unsigned char *)(v20 + 144) = v80;
    *(_DWORD *)(v20 + 148) = *(_DWORD *)&v79[3];
    *(_DWORD *)(v20 + 145) = *(_DWORD *)v79;
    *(_OWORD *)(v20 + 152) = v76;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v63;
    uint64_t v6 = v62;
    int64_t v18 = v78;
    unint64_t v15 = v77;
  }
  swift_release();
  uint64_t v3 = v58;
  uint64_t v28 = v60;
LABEL_36:
  if (v64)
  {
    uint64_t v57 = 1 << *(unsigned char *)(v9 + 32);
    if (v57 >= 64) {
      bzero(v28, ((unint64_t)(v57 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      *uint64_t v28 = -1 << v57;
    }
    *(void *)(v9 + 16) = 0;
  }
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_2287E8DFC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_2287ED184();
  char v38 = a2;
  uint64_t v6 = sub_2287FB448();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2287FB618();
    sub_2287FADE8();
    uint64_t result = sub_2287FB648();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

char *sub_2287E9108(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2287FA308();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = (char *)MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    uint64_t result = (char *)sub_2287FB298();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      int64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      unint64_t v33 = (unint64_t)(result + 1) & v12;
      uint64_t v34 = v13;
      uint64_t v14 = *(void *)(v5 + 72);
      uint64_t v35 = v5 + 16;
      uint64_t v32 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v14;
        int64_t v18 = v14 * v11;
        uint64_t v19 = v15;
        v34(v8, *(void *)(a2 + 48) + v14 * v11, v4);
        sub_2287ED894(&qword_2682657A8, MEMORY[0x263F07508]);
        uint64_t v20 = sub_2287FAD08();
        uint64_t result = (char *)(*v32)(v8, v4);
        uint64_t v15 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v33)
        {
          if (v21 >= v33 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v9 = v16;
            if (v17 * a1 < v18
              || (uint64_t v14 = v17, *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17)))
            {
              swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v14 = v17;
              uint64_t v15 = v19;
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v24 = *(void *)(a2 + 56);
            uint64_t result = (char *)(v24 + 168 * a1);
            char v25 = (char *)(v24 + 168 * v11);
            if (a1 != v11 || (a1 = v11, result >= v25 + 168))
            {
              uint64_t result = (char *)memmove(result, v25, 0xA8uLL);
              uint64_t v14 = v17;
              uint64_t v15 = v19;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v33 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
        uint64_t v14 = v17;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v15;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    unint64_t v26 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v26 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *unint64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2287E9424(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2287FA308();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_2287E7C14(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2287EB4A8();
      goto LABEL_7;
    }
    sub_2287E867C(v17, a3 & 1);
    unint64_t v23 = sub_2287E7C14(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_2287EB3BC(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2287FB5E8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 168 * v14;
  return sub_2287ED85C(a1, v21);
}

void sub_2287E95F4()
{
  if (!qword_2682656D0)
  {
    sub_2287ED930(255, &qword_2682656D8, type metadata accessor for FileAttributeKey);
    unint64_t v0 = sub_2287FB5A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682656D0);
    }
  }
}

uint64_t sub_2287E9674(uint64_t a1, unint64_t a2)
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

unint64_t sub_2287E96CC()
{
  unint64_t result = qword_2682656E0;
  if (!qword_2682656E0)
  {
    sub_2287ED8DC(255, &qword_268265548, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682656E0);
  }
  return result;
}

unint64_t sub_2287E9748()
{
  unint64_t result = qword_2682656E8;
  if (!qword_2682656E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682656E8);
  }
  return result;
}

uint64_t sub_2287E979C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2287E97F4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2287E982C()
{
  return sub_2287E60C8();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ScanningAnalyticsWrapper(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanningAnalyticsWrapper(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningAnalyticsWrapper()
{
  return &type metadata for ScanningAnalyticsWrapper;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ScanningSystemState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[81]) {
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

uint64_t storeEnumTagSinglePayload for ScanningSystemState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningSystemState()
{
  return &type metadata for ScanningSystemState;
}

uint64_t destroy for ScanningSession()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ScanningSession(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  long long v9 = *(_OWORD *)(a2 + 112);
  long long v10 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = v10;
  *(_OWORD *)(a1 + 96) = v8;
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ScanningSession(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v4 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v4;
  uint64_t v5 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v5;
  uint64_t v6 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v6;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for ScanningSession(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v5 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v5;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScanningSession(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 168)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanningSession(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 168) = 1;
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
    *(unsigned char *)(result + 168) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningSession()
{
  return &type metadata for ScanningSession;
}

uint64_t destroy for ClinicalProductResultGroup()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25HealthMedicationsVisionUI26ClinicalProductResultGroupVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClinicalProductResultGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ClinicalProductResultGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClinicalProductResultGroup(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ClinicalProductResultGroup(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ClinicalProductResultGroup()
{
  return &type metadata for ClinicalProductResultGroup;
}

uint64_t __swift_memcpy12_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpecificProductResult(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SpecificProductResult(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SpecificProductResult()
{
  return &type metadata for SpecificProductResult;
}

uint64_t destroy for ExpandedMedicationCluster()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ExpandedMedicationCluster(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ExpandedMedicationCluster(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ExpandedMedicationCluster(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpandedMedicationCluster(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExpandedMedicationCluster(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpandedMedicationCluster()
{
  return &type metadata for ExpandedMedicationCluster;
}

uint64_t sub_2287EA26C()
{
  return type metadata accessor for ScanningSessionLogger();
}

uint64_t type metadata accessor for ScanningSessionLogger()
{
  uint64_t result = qword_268265700;
  if (!qword_268265700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2287EA2C0()
{
  uint64_t result = sub_2287FA278();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ScanningSessionLogger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScanningSessionLogger);
}

uint64_t dispatch thunk of ScanningSessionLogger.latestSession.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ScanningSessionLogger.startScanningSession()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerTranscripts(forSession:allTranscripts:usedTranscripts:seenMRCs:mrcResult:resolverResult:systemState:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerFilteredResults(forSession:filteredResult:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerExpandedResults(forSession:expandedResults:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerTimeChange(forSession:filterTime:stateChangeTime:onScreenTime:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, char a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void, uint64_t, void))(*(void *)v7 + 304))(a1, a2, a3 & 1, a4, a5 & 1, a6, a7 & 1);
}

uint64_t dispatch thunk of ScanningSessionLogger.getScanningAnalyticsInfo(forSession:medication:medicationIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of ScanningSessionLogger.writeSessionToFile(session:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExpandedMedicationCluster.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExpandedMedicationCluster.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2287EA680);
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

ValueMetadata *type metadata accessor for ExpandedMedicationCluster.CodingKeys()
{
  return &type metadata for ExpandedMedicationCluster.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SpecificProductResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpecificProductResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2287EA814);
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

uint64_t sub_2287EA83C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2287EA844(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpecificProductResult.CodingKeys()
{
  return &type metadata for SpecificProductResult.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ClinicalProductResultGroup.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ClinicalProductResultGroup.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2287EA9BCLL);
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

ValueMetadata *type metadata accessor for ClinicalProductResultGroup.CodingKeys()
{
  return &type metadata for ClinicalProductResultGroup.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ScanningSession.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ScanningSession.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x2287EAB50);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

unsigned char *sub_2287EAB78(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScanningSession.CodingKeys()
{
  return &type metadata for ScanningSession.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ScanningSystemState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ScanningSystemState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2287EACECLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningSystemState.CodingKeys()
{
  return &type metadata for ScanningSystemState.CodingKeys;
}

unint64_t sub_2287EAD28()
{
  unint64_t result = qword_268265710;
  if (!qword_268265710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265710);
  }
  return result;
}

unint64_t sub_2287EAD80()
{
  unint64_t result = qword_268265718;
  if (!qword_268265718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265718);
  }
  return result;
}

unint64_t sub_2287EADD8()
{
  unint64_t result = qword_268265720;
  if (!qword_268265720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265720);
  }
  return result;
}

unint64_t sub_2287EAE30()
{
  unint64_t result = qword_268265728;
  if (!qword_268265728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265728);
  }
  return result;
}

unint64_t sub_2287EAE88()
{
  unint64_t result = qword_268265730;
  if (!qword_268265730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265730);
  }
  return result;
}

unint64_t sub_2287EAEE0()
{
  unint64_t result = qword_268265738;
  if (!qword_268265738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265738);
  }
  return result;
}

unint64_t sub_2287EAF38()
{
  unint64_t result = qword_268265740;
  if (!qword_268265740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265740);
  }
  return result;
}

unint64_t sub_2287EAF90()
{
  unint64_t result = qword_268265748;
  if (!qword_268265748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265748);
  }
  return result;
}

unint64_t sub_2287EAFE8()
{
  unint64_t result = qword_268265750;
  if (!qword_268265750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265750);
  }
  return result;
}

unint64_t sub_2287EB040()
{
  unint64_t result = qword_268265758;
  if (!qword_268265758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265758);
  }
  return result;
}

unint64_t sub_2287EB098()
{
  unint64_t result = qword_268265760;
  if (!qword_268265760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265760);
  }
  return result;
}

unint64_t sub_2287EB0F0()
{
  unint64_t result = qword_268265768;
  if (!qword_268265768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265768);
  }
  return result;
}

unint64_t sub_2287EB148()
{
  unint64_t result = qword_268265770;
  if (!qword_268265770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265770);
  }
  return result;
}

unint64_t sub_2287EB1A0()
{
  unint64_t result = qword_268265778;
  if (!qword_268265778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265778);
  }
  return result;
}

unint64_t sub_2287EB1F8()
{
  unint64_t result = qword_268265780;
  if (!qword_268265780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268265780);
  }
  return result;
}

void sub_2287EB24C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2287E7D6C(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2287EB7D8();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2287E8DFC(v15, a4 & 1);
  unint64_t v20 = sub_2287E7D6C(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_2287FB5E8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_2287EB3BC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2287FA308();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v11 = a4[7] + 168 * a1;
  long long v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 16) = v12;
  long long v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v11 + 64) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v11 + 80) = v13;
  long long v14 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v11 + 48) = v14;
  *(void *)(v11 + 160) = *(void *)(a3 + 160);
  long long v15 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v11 + 128) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v11 + 144) = v15;
  long long v16 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v11 + 96) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v11 + 112) = v16;
  uint64_t v17 = a4[2];
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    a4[2] = v19;
  }
  return result;
}

void *sub_2287EB4A8()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_2287FA308();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287ED430();
  uint64_t v6 = *v0;
  uint64_t v7 = sub_2287FB438();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v8;
    return result;
  }
  uint64_t v41 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v42 = v6 + 64;
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 64);
  int64_t v43 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v44 = v3 + 16;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v38 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v38 >= v43) {
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v42 + 8 * v38);
    ++v12;
    if (!v39)
    {
      int64_t v12 = v38 + 1;
      if (v38 + 1 >= v43) {
        goto LABEL_26;
      }
      unint64_t v39 = *(void *)(v42 + 8 * v12);
      if (!v39) {
        break;
      }
    }
LABEL_25:
    unint64_t v15 = (v39 - 1) & v39;
    unint64_t v17 = __clz(__rbit64(v39)) + (v12 << 6);
LABEL_12:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v18, v2);
    uint64_t v19 = 168 * v17;
    uint64_t v20 = *(void *)(v6 + 56) + v19;
    long long v21 = *(_OWORD *)(v20 + 48);
    long long v22 = *(_OWORD *)(v20 + 64);
    long long v23 = *(_OWORD *)(v20 + 96);
    long long v50 = *(_OWORD *)(v20 + 80);
    long long v51 = v23;
    long long v48 = v21;
    long long v49 = v22;
    long long v24 = *(_OWORD *)(v20 + 112);
    long long v25 = *(_OWORD *)(v20 + 128);
    long long v26 = *(_OWORD *)(v20 + 144);
    uint64_t v55 = *(void *)(v20 + 160);
    long long v53 = v25;
    long long v54 = v26;
    long long v52 = v24;
    long long v28 = *(_OWORD *)(v20 + 16);
    long long v27 = *(_OWORD *)(v20 + 32);
    long long v45 = *(_OWORD *)v20;
    long long v46 = v28;
    long long v47 = v27;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v18, v5, v2);
    uint64_t v29 = *(void *)(v8 + 56) + v19;
    long long v30 = v52;
    long long v31 = v53;
    long long v32 = v54;
    *(void *)(v29 + 160) = v55;
    *(_OWORD *)(v29 + 128) = v31;
    *(_OWORD *)(v29 + 144) = v32;
    *(_OWORD *)(v29 + 112) = v30;
    long long v33 = v48;
    long long v34 = v49;
    long long v35 = v51;
    *(_OWORD *)(v29 + 80) = v50;
    *(_OWORD *)(v29 + 96) = v35;
    *(_OWORD *)(v29 + 48) = v33;
    *(_OWORD *)(v29 + 64) = v34;
    long long v37 = v46;
    long long v36 = v47;
    *(_OWORD *)uint64_t v29 = v45;
    *(_OWORD *)(v29 + 16) = v37;
    *(_OWORD *)(v29 + 32) = v36;
    uint64_t result = (void *)sub_2287E6D1C((uint64_t)&v45);
  }
  int64_t v40 = v38 + 2;
  if (v40 >= v43)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v41;
    goto LABEL_28;
  }
  unint64_t v39 = *(void *)(v42 + 8 * v40);
  if (v39)
  {
    int64_t v12 = v40;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    if (v12 >= v43) {
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v42 + 8 * v12);
    ++v40;
    if (v39) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2287EB7D8()
{
  unint64_t v1 = v0;
  sub_2287ED184();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2287FB438();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    long long v21 = (void *)(*(void *)(v4 + 48) + v16);
    *long long v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*sub_2287EB988(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2287EBA38(v6, a2, a3);
  return sub_2287EB9F0;
}

void sub_2287EB9F0(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2287EBA38(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A69E3A0](a2, a3);
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
    return sub_2287EBAB8;
  }
  __break(1u);
  return result;
}

void sub_2287EBAB8(id *a1)
{
}

uint64_t sub_2287EBAC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2287FB418();
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
    uint64_t v10 = sub_2287FB418();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2287ED1FC();
        sub_2287ED894(&qword_268265798, (void (*)(uint64_t))sub_2287ED1FC);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          unint64_t v12 = sub_2287EB988(v16, i, a3);
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
    sub_2287C5C80(0, &qword_2682653E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287EBD00(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    _OWORD v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_2287EBF00(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    _OWORD v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2287EC0FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

char *sub_2287EC1F4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287EC2E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287EC3D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287EC4CC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7574615361746164 && a2 == 0xED00006465746172;
  if (v3 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002288013F0 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x456E6F6973736573 && a2 == 0xEE00656D6954646ELL || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000228801410 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000228801430 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000228801450 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6168436574617473 && a2 == 0xEF656D695465676ELL || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000228801470)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_2287FB5B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_2287EC814(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736E6172546C6C61 && a2 == 0xEE00737470697263;
  if (v3 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E61725464657375 && a2 == 0xEF73747069726373 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7343524D6E656573 && a2 == 0xE800000000000000 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C75736552736270 && a2 == 0xEA00000000007374 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C7573655263726DLL && a2 == 0xE900000000000074 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74536D6574737973 && a2 == 0xEB00000000657461 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x64657265746C6966 && a2 == 0xEF73746C75736552 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6465646E61707865 && a2 == 0xEF73746C75736552)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_2287FB5B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_2287ECC68(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000228801490 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002288014B0 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002288014D0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_2287FB5B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2287ECDAC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000002288014F0 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000228801510)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2287FB5B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2287ECE98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_2287ED99C(0, &qword_268265658, MEMORY[0x263F8D310], MEMORY[0x263F8D060]);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287ECFC4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6369666963657073 && a2 == -1192218645498990000;
  if (v3 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000228801530 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000228801550 || (sub_2287FB5B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000228801570)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2287FB5B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_2287ED17C()
{
  return swift_release();
}

void sub_2287ED184()
{
  if (!qword_268265788)
  {
    sub_2287C5C80(255, &qword_268265398);
    unint64_t v0 = sub_2287FB468();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265788);
    }
  }
}

void sub_2287ED1FC()
{
  if (!qword_2682653E8)
  {
    sub_2287C5C80(255, &qword_2682653E0);
    unint64_t v0 = sub_2287FAEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682653E8);
    }
  }
}

uint64_t sub_2287ED264(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2287E734C(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2287ED2D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

void sub_2287ED430()
{
  if (!qword_2682657B0)
  {
    sub_2287FA308();
    sub_2287ED894(&qword_2682657A8, MEMORY[0x263F07508]);
    unint64_t v0 = sub_2287FB468();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682657B0);
    }
  }
}

void sub_2287ED4CC()
{
  if (!qword_2682657B8)
  {
    type metadata accessor for Key(255);
    sub_2287ED894((unint64_t *)&qword_268265068, type metadata accessor for Key);
    unint64_t v0 = sub_2287FB468();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682657B8);
    }
  }
}

uint64_t sub_2287ED56C(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_2287ED930(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_2287ED5DC()
{
  if (!qword_2682657C0)
  {
    type metadata accessor for FileAttributeKey(255);
    sub_2287ED894(&qword_268264FD8, type metadata accessor for FileAttributeKey);
    unint64_t v0 = sub_2287FB468();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682657C0);
    }
  }
}

uint64_t sub_2287ED67C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

void sub_2287ED770()
{
  if (!qword_2682657D0)
  {
    sub_2287EDA70(255, &qword_2682657D8);
    unint64_t v0 = sub_2287FB5A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682657D0);
    }
  }
}

void sub_2287ED7D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_2287ED99C(255, &qword_268265658, MEMORY[0x263F8D310], MEMORY[0x263F8D060]);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2287ED85C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2287ED894(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2287ED8DC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2287ED928(void *a1)
{
  return sub_2287E126C(a1);
}

void sub_2287ED930(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_2287ED99C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, void, uint64_t, void))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, MEMORY[0x263F8D310], a3, MEMORY[0x263F8D320]);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2287ED9F8(uint64_t a1, uint64_t a2)
{
  sub_2287EDA70(0, &qword_268265820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2287EDA70(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t type metadata accessor for ScanResultSelectionDataSource()
{
  uint64_t result = qword_268265848;
  if (!qword_268265848) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2287EDB2C()
{
  uint64_t result = sub_2287FA308();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2287EDBF8(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  unint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v22 = sub_2287FA4D8();
  uint64_t v25 = *(void *)(v22 - 8);
  uint64_t result = MEMORY[0x270FA5388](v22);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v11 == -1) {
    return v13;
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2287EFAE8(0, v12 & ~(v12 >> 63), 0);
  if ((v12 & 0x8000000000000000) == 0)
  {
    BOOL v14 = 0;
    uint64_t v13 = v27;
    uint64_t v21 = v25 + 32;
    uint64_t v15 = a3 - 1;
    while (a4 != v15)
    {
      if (v14) {
        goto LABEL_24;
      }
      uint64_t v26 = a3;
      v23(&v26);
      if (v5)
      {
        swift_release();
        return v13;
      }
      uint64_t v5 = 0;
      unint64_t v16 = v10;
      uint64_t v27 = v13;
      unint64_t v18 = *(void *)(v13 + 16);
      unint64_t v17 = *(void *)(v13 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_2287EFAE8(v17 > 1, v18 + 1, 1);
        uint64_t v13 = v27;
      }
      *(void *)(v13 + 16) = v18 + 1;
      unint64_t v19 = v13
          + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))
          + *(void *)(v25 + 72) * v18;
      uint64_t v10 = v16;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v25 + 32))(v19, v16, v22);
      BOOL v14 = a3 == a4;
      if (a3 == a4)
      {
        a3 = 0;
      }
      else if (__OFADD__(a3++, 1))
      {
        goto LABEL_20;
      }
      if (a4 == ++v15) {
        return v13;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_2287EDE10(uint64_t a1)
{
  uint64_t v2 = sub_2287FA4D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_2287EFB08(0, v6, 0);
    uint64_t v7 = v22;
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v18 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      uint64_t v22 = v7;
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1) {
        sub_2287EFB08(v12 > 1, v13 + 1, 1);
      }
      uint64_t v20 = v2;
      uint64_t v21 = sub_2287F07E4(&qword_268265928, MEMORY[0x263F441F0]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
      v9((char *)boxed_opaque_existential_1, (uint64_t)v5, v2);
      uint64_t v15 = v22;
      *(void *)(v22 + 16) = v13 + 1;
      sub_2287EFBC4(&v19, v15 + 40 * v13 + 32);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      uint64_t v7 = v22;
      v11 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_2287EE00C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    sub_2287FB3C8();
    uint64_t v4 = a1 + 32;
    do
    {
      sub_2287DBBD0(v4, (uint64_t)&v5);
      type metadata accessor for CGPath(0);
      swift_dynamicCast();
      sub_2287FB3A8();
      sub_2287FB3D8();
      sub_2287FB3E8();
      sub_2287FB3B8();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_2287EE0E8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_2287EFB08(0, v1, 0);
    uint64_t v2 = v20;
    uint64_t v4 = (void *)(a1 + 80);
    do
    {
      uint64_t v5 = *(v4 - 5);
      uint64_t v7 = *(v4 - 4);
      uint64_t v6 = *(v4 - 3);
      uint64_t v8 = (void *)*(v4 - 2);
      int v9 = *((_DWORD *)v4 - 2);
      uint64_t v15 = *v4;
      uint64_t v16 = *(v4 - 6);
      uint64_t v20 = v2;
      unint64_t v10 = *(void *)(v2 + 16);
      unint64_t v11 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v12 = v8;
      if (v10 >= v11 >> 1)
      {
        sub_2287EFB08(v11 > 1, v10 + 1, 1);
        uint64_t v2 = v20;
      }
      v4 += 7;
      uint64_t v18 = &type metadata for ScanResultGroupItem;
      unint64_t v19 = sub_2287EFB28();
      uint64_t v13 = swift_allocObject();
      *(void *)&long long v17 = v13;
      *(void *)(v13 + 16) = v16;
      *(void *)(v13 + 24) = v5;
      *(void *)(v13 + 32) = v7;
      *(void *)(v13 + 40) = v6;
      *(void *)(v13 + 48) = v12;
      *(_DWORD *)(v13 + 56) = v9;
      *(void *)(v13 + 64) = v15;
      *(void *)(v2 + 16) = v10 + 1;
      sub_2287EFBC4(&v17, v2 + 40 * v10 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2287EE240(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_2287FA618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287F0760(0, &qword_2682652D8, MEMORY[0x263F81EE0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)v16 - v9;
  uint64_t v11 = *a1;
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  sub_2287FB348();
  swift_bridgeObjectRelease();
  strcpy((char *)v18, "FakeSearchItem");
  HIBYTE(v18[1]) = -18;
  *(void *)&v16[0] = v11;
  sub_2287FB598();
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_2287FA8D8();
  v18[3] = v12;
  v18[4] = MEMORY[0x263F81F20];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_1, a2, v12);
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  sub_2287FA848();
  uint64_t v14 = sub_2287FA858();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 0, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F446D0], v4);
  return sub_2287FA4C8();
}

uint64_t sub_2287EE4FC()
{
  sub_2287F0760(0, &qword_2682651C8, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v25 = (char *)&v22 - v2;
  sub_2287EF5F4();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287EF85C();
  uint64_t v24 = v8;
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287EF948();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v0;
  id v29 = *(id *)(v0 + qword_268265828);
  swift_allocObject();
  swift_weakInit();
  sub_2287EF6A0();
  sub_2287EF79C();
  sub_2287F07E4(&qword_268265890, (void (*)(uint64_t))sub_2287EF6A0);
  swift_retain();
  sub_2287FAA98();
  swift_release();
  swift_release();
  uint64_t v15 = sub_2287F07E4(&qword_2682658A8, (void (*)(uint64_t))sub_2287EF5F4);
  uint64_t v16 = sub_2287F07E4(&qword_2682658A0, (void (*)(uint64_t))sub_2287EF79C);
  MEMORY[0x22A69DB20](v4, v15, v16);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2287C5C80(0, &qword_2682651E0);
  id v29 = (id)sub_2287FAFD8();
  uint64_t v17 = sub_2287FAFC8();
  uint64_t v18 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v25, 1, 1, v17);
  sub_2287F07E4(&qword_2682658B8, (void (*)(uint64_t))sub_2287EF85C);
  sub_2287CF900();
  uint64_t v19 = v24;
  sub_2287FAAC8();
  sub_2287EFA54(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v19);
  swift_allocObject();
  swift_weakInit();
  sub_2287F07E4(&qword_2682658C0, (void (*)(uint64_t))sub_2287EF948);
  uint64_t v20 = v27;
  sub_2287FAB08();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v20);
  swift_beginAccess();
  sub_2287FA988();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2287EEA68@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2287F005C();
  uint64_t v5 = v4;
  uint64_t v31 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287F0140();
  uint64_t v9 = v8;
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287F01EC();
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    goto LABEL_5;
  }
  if (!v17)
  {
    uint64_t result = swift_release();
LABEL_5:
    uint64_t v26 = 0;
    goto LABEL_6;
  }
  uint64_t v29 = v14;
  uint64_t v19 = *(void *)(result + qword_268265A40);
  uint64_t v20 = swift_allocObject();
  long long v30 = a2;
  *(void *)(v20 + 16) = v17;
  *(void *)(v20 + 24) = v19;
  sub_2287D47E0();
  v27[1] = v21;
  sub_2287F07E4(&qword_2682658E0, (void (*)(uint64_t))sub_2287D47E0);
  uint64_t v28 = v13;
  id v22 = v17;
  swift_retain_n();
  id v23 = v22;
  sub_2287FAA28();
  sub_2287EF804();
  sub_2287F07E4(&qword_2682658F0, (void (*)(uint64_t))sub_2287F005C);
  swift_retain();
  sub_2287FAAB8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v5);
  sub_2287F07E4(&qword_268265910, (void (*)(uint64_t))sub_2287F0140);
  uint64_t v24 = sub_2287FAA88();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
  swift_release();

  uint64_t v34 = v24;
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_2287F0280();
  sub_2287F07E4(&qword_268265908, (void (*)(uint64_t))sub_2287F0280);
  sub_2287FAAA8();
  a2 = v30;
  swift_release();
  sub_2287F07E4(&qword_268265918, (void (*)(uint64_t))sub_2287F01EC);
  uint64_t v25 = v28;
  uint64_t v26 = sub_2287FAA88();

  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v25);
LABEL_6:
  *a2 = v26;
  return result;
}

uint64_t sub_2287EEF20(uint64_t *a1)
{
  uint64_t v2 = sub_2287FA308();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = result;
    if (qword_268264F00 != -1) {
      swift_once();
    }
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8 + qword_268265838, v2);
    uint64_t v14 = MEMORY[0x263F8EE78];
    uint64_t v9 = *(void *)(v6 + 16);
    if (v9)
    {
      uint64_t v13 = v2;
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v10 = 64;
      do
      {
        id v11 = *(id *)(v6 + v10);
        MEMORY[0x22A69DE50]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2287FAE78();
        }
        sub_2287FAE98();
        sub_2287FAE68();
        v10 += 56;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      uint64_t v2 = v13;
      uint64_t v12 = v14;
    }
    else
    {
      swift_retain();
      uint64_t v12 = MEMORY[0x263F8EE78];
    }
    sub_2287E24A0((uint64_t)v5, v12);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_2287EE0E8(v6);
    sub_2287FA498();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2287EF19C()
{
}

uint64_t sub_2287EF1CC()
{
  swift_release();

  uint64_t v1 = v0 + qword_268265838;
  uint64_t v2 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287EF278()
{
  uint64_t v0 = sub_2287FA4A8();
  swift_release();

  uint64_t v1 = v0 + qword_268265838;
  uint64_t v2 = sub_2287FA308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2287EF360()
{
  return type metadata accessor for ScanResultSelectionDataSource();
}

void *sub_2287EF368()
{
  uint64_t v0 = sub_2287FA408();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  sub_2287FA3F8();
  sub_2287FA3E8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v6, v0);
  uint64_t v8 = (void *)sub_2287FA3D8();
  v7(v4, v0);
  sub_2287FB068();
  objc_msgSend(v8, sel_setContentInsets_);
  objc_msgSend(v8, sel_setContentInsetsReference_, 1);
  return v8;
}

uint64_t sub_2287EF4AC()
{
  return sub_2287FA6F8();
}

uint64_t sub_2287EF50C()
{
  return sub_2287FAF98();
}

uint64_t sub_2287EF5AC()
{
  return sub_2287F07E4(&qword_268265858, (void (*)(uint64_t))type metadata accessor for ScanResultSelectionDataSource);
}

void sub_2287EF5F4()
{
  if (!qword_268265860)
  {
    sub_2287EF6A0();
    sub_2287EF79C();
    sub_2287F07E4(&qword_268265890, (void (*)(uint64_t))sub_2287EF6A0);
    unint64_t v0 = sub_2287FA908();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265860);
    }
  }
}

void sub_2287EF6A0()
{
  if (!qword_268265868)
  {
    sub_2287EF734(255, &qword_268265870, &qword_268265878, 0x263F44EF8, MEMORY[0x263F8D8F0]);
    unint64_t v0 = sub_2287FA9E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265868);
    }
  }
}

void sub_2287EF734(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_2287C5C80(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_2287EF79C()
{
  if (!qword_268265880)
  {
    sub_2287EF804();
    unint64_t v0 = sub_2287FA978();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265880);
    }
  }
}

void sub_2287EF804()
{
  if (!qword_268265888)
  {
    unint64_t v0 = sub_2287FAEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265888);
    }
  }
}

void sub_2287EF85C()
{
  if (!qword_268265898)
  {
    sub_2287EF79C();
    sub_2287EF5F4();
    sub_2287F07E4(&qword_2682658A0, (void (*)(uint64_t))sub_2287EF79C);
    sub_2287F07E4(&qword_2682658A8, (void (*)(uint64_t))sub_2287EF5F4);
    unint64_t v0 = sub_2287FA928();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265898);
    }
  }
}

void sub_2287EF948()
{
  if (!qword_2682658B0)
  {
    sub_2287EF85C();
    sub_2287C5C80(255, &qword_2682651E0);
    sub_2287F07E4(&qword_2682658B8, (void (*)(uint64_t))sub_2287EF85C);
    sub_2287CF900();
    unint64_t v0 = sub_2287FA968();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682658B0);
    }
  }
}

uint64_t sub_2287EFA14()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2287EFA4C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2287EEA68(a1, a2);
}

uint64_t sub_2287EFA54(uint64_t a1)
{
  sub_2287F0760(0, &qword_2682651C8, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287EFAE0(uint64_t *a1)
{
  return sub_2287EEF20(a1);
}

uint64_t sub_2287EFAE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2287EFBDC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2287EFB08(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2287EFE48(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

unint64_t sub_2287EFB28()
{
  unint64_t result = qword_2682658C8;
  if (!qword_2682658C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682658C8);
  }
  return result;
}

uint64_t sub_2287EFB7C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2287EFBC4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2287EFBDC(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2287F0760(0, &qword_268265930, MEMORY[0x263F441F0], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_2287FA4D8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2287FA4D8() - 8);
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287EFE48(char a1, int64_t a2, char a3, void *a4)
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
    sub_2287EFFF4();
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_2287F00F0(0, &qword_2682652D0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

void sub_2287EFFF4()
{
  if (!qword_2682658D0)
  {
    sub_2287F00F0(255, &qword_2682652D0);
    unint64_t v0 = sub_2287FB5A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682658D0);
    }
  }
}

void sub_2287F005C()
{
  if (!qword_2682658D8)
  {
    sub_2287D47E0();
    sub_2287F07E4(&qword_2682658E0, (void (*)(uint64_t))sub_2287D47E0);
    unint64_t v0 = sub_2287FAA38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682658D8);
    }
  }
}

uint64_t sub_2287F00F0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_2287F0140()
{
  if (!qword_2682658E8)
  {
    sub_2287F005C();
    sub_2287EF804();
    sub_2287F07E4(&qword_2682658F0, (void (*)(uint64_t))sub_2287F005C);
    unint64_t v0 = sub_2287FA948();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682658E8);
    }
  }
}

void sub_2287F01EC()
{
  if (!qword_2682658F8)
  {
    sub_2287F0280();
    sub_2287F07E4(&qword_268265908, (void (*)(uint64_t))sub_2287F0280);
    unint64_t v0 = sub_2287FA918();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682658F8);
    }
  }
}

void sub_2287F0280()
{
  if (!qword_268265900)
  {
    sub_2287EF804();
    sub_2287F00F0(255, (unint64_t *)&qword_268265248);
    unint64_t v0 = sub_2287FA978();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268265900);
    }
  }
}

uint64_t sub_2287F0300()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287F0340@<X0>(uint64_t *a1@<X8>)
{
  return sub_2287D3400(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2287F0348@<X0>(uint64_t a1@<X8>)
{
  return sub_2287D3E98(a1);
}

uint64_t sub_2287F0350(void *a1, char *a2)
{
  uint64_t v20 = a2;
  uint64_t v5 = sub_2287FA308();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2287FA8D8();
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  size_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = qword_268265828;
  v23[0] = 0;
  sub_2287EF6A0();
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v12) = sub_2287FA9F8();
  *(void *)(v2 + qword_268265840) = MEMORY[0x263F8EE88];
  *(void *)(v2 + qword_268265830) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v2 + qword_268265838, a2, v5);
  type metadata accessor for ScanResultDataProvider();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v2 + qword_268265A40) = v13;
  id v14 = a1;
  swift_release();
  sub_2287F0760(0, &qword_268265920, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  sub_2287FA478();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2287FC840;
  sub_2287FA8C8();
  unint64_t v22 = v11;
  uint64_t v15 = sub_2287EDBF8((void (*)(uint64_t *))sub_2287F07C4, (uint64_t)v21, 1, 10);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  sub_2287EDE10(v15);
  swift_bridgeObjectRelease();
  sub_2287FA468();
  v23[0] = 0;
  v23[1] = 0xE000000000000000;
  sub_2287FB348();
  swift_bridgeObjectRelease();
  strcpy((char *)v23, "MutableArray<");
  HIWORD(v23[1]) = -4864;
  sub_2287FA2F8();
  sub_2287FA2E8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v8, v5);
  sub_2287FAE08();
  swift_bridgeObjectRelease();
  sub_2287FAE08();
  uint64_t v17 = sub_2287FA488();
  swift_retain();
  sub_2287EE4FC();
  swift_release();
  v16(v20, v5);
  return v17;
}

void sub_2287F0760(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2287F07C4(uint64_t *a1)
{
  return sub_2287EE240(a1, *(void *)(v1 + 16));
}

uint64_t sub_2287F07E4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2287F0838()
{
  id v0 = objc_msgSend(self, sel_defaultWorkspace);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (void *)sub_2287FA238();
    sub_2287DC758(MEMORY[0x263F8EE78]);
    id v3 = (id)sub_2287FACF8();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_openSensitiveURL_withOptions_, v2, v3);
  }
}

uint64_t VisionTapToRadar.deinit()
{
  return v0;
}

uint64_t VisionTapToRadar.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  unint64_t v8 = (void *)sub_2287FAD38();
  uint64_t v9 = (void *)sub_2287FAD38();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1);

  size_t v11 = (void *)sub_2287FAD38();
  uint64_t v12 = self;
  id v13 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v11, 1, 0);

  objc_msgSend(v10, sel_addAction_, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a4;
  *(void *)(v14 + 24) = a5;
  swift_retain();
  uint64_t v15 = (void *)sub_2287FAD38();
  v18[4] = sub_2287F125C;
  uint64_t v18[5] = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  void v18[2] = sub_2287E13AC;
  v18[3] = &block_descriptor_4;
  uint64_t v16 = _Block_copy(v18);
  swift_release();
  id v17 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v15, 0, v16);
  _Block_release(v16);

  objc_msgSend(v10, sel_addAction_, v17);
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v10, 1, 0);
}

uint64_t _s25HealthMedicationsVisionUI0C10TapToRadarC8scanning0H7Session14viewControlleryAA08ScanningI0V_So06UIViewK0CtFZ_0(uint64_t a1, void *a2)
{
  id v23 = a2;
  uint64_t v3 = sub_2287FA278();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v24 - v8 + 32;
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v10 = *(_OWORD *)(a1 + 144);
  v24[8] = *(_OWORD *)(a1 + 128);
  v24[9] = v10;
  uint64_t v25 = *(void *)(a1 + 160);
  long long v11 = *(_OWORD *)(a1 + 80);
  v24[4] = *(_OWORD *)(a1 + 64);
  v24[5] = v11;
  long long v12 = *(_OWORD *)(a1 + 112);
  v24[6] = *(_OWORD *)(a1 + 96);
  v24[7] = v12;
  long long v13 = *(_OWORD *)(a1 + 16);
  v24[0] = *(_OWORD *)a1;
  v24[1] = v13;
  long long v14 = *(_OWORD *)(a1 + 48);
  v24[2] = *(_OWORD *)(a1 + 32);
  v24[3] = v14;
  swift_retain();
  sub_2287E34F4((uint64_t)v24);
  swift_release();
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_2287FAD38();
  id v17 = (void *)sub_2287FAD38();
  uint64_t v18 = (void *)sub_2287FAE38();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v15, sel_hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions_, 0, 1330752, v16, v17, 7, 0, 0, 2, v18, 0, 1);

  sub_2287FA258();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  unint64_t v20 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v21 + v20, v7, v3);
  _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(0xD00000000000009ALL, 0x8000000228801B20, v23, (uint64_t)sub_2287F12A0, v21);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t _s25HealthMedicationsVisionUI0C10TapToRadarC19medicationsTracking14viewControllerySo06UIViewK0C_tFZ_0(void *a1)
{
  uint64_t v2 = sub_2287FA278();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = self;
  long long v10 = (void *)sub_2287FAD38();
  long long v11 = (void *)sub_2287FAD38();
  id v12 = objc_msgSend(v9, sel_hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions_, 0, 1397974, v10, v11, 7, 0, 0, 3, 0, 0, 1);

  sub_2287FA258();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14 + v13, v6, v2);
  _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(0x10000000000000D2, 0x8000000228801900, a1, (uint64_t)sub_2287F12A0, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t type metadata accessor for VisionTapToRadar()
{
  return self;
}

uint64_t method lookup function for VisionTapToRadar(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VisionTapToRadar);
}

uint64_t sub_2287F1224()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287F125C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_2287F12A4()
{
  if (!qword_2682654F8)
  {
    unint64_t v0 = sub_2287FB5A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682654F8);
    }
  }
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v1 = sub_2287FA278();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2287F1394()
{
}

uint64_t sub_2287F13E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_2287D02A0();
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_2287F14A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287FAEF8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2287FAEE8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2287F9CA4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2287FAEB8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2287F1648(uint64_t a1, uint64_t a2)
{
  return sub_2287F95C0(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_2287F1664()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  return v1;
}

void *sub_2287F16DC()
{
  uint64_t v1 = (void *)v0;
  sub_2287F9AC0(0, &qword_2682651F8, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE58]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v24 - v5;
  uint64_t v7 = sub_2287FA2D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  sub_2287FA3A8();
  swift_allocObject();
  *(void *)(v0 + 56) = sub_2287FA398();
  *(void *)(v0 + 64) = 0;
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v12 = v11;
  unint64_t v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  *(void *)(v0 + 72) = v12;
  sub_2287FA2C8();
  sub_2287FA298();
  double v15 = v14;
  v13(v10, v7);
  *(double *)(v0 + 80) = v15 + 10.0;
  *(void *)(v0 + 88) = 0;
  *(unsigned char *)(v0 + 96) = 1;
  *(_WORD *)(v0 + 112) = 1;
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v17 = MEMORY[0x263F8EE88];
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 120) = v16;
  *(void *)(v0 + 128) = v17;
  *(void *)(v0 + 136) = v17;
  *(void *)(v0 + 144) = v17;
  *(void *)(v0 + 152) = v17;
  sub_2287FA0DC();
  swift_allocObject();
  *(void *)(v0 + 160) = sub_2287FA9A8();
  *(void *)(v0 + 168) = 0;
  *(void *)(v0 + 176) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 184) = v17;
  *(void *)(v0 + 192) = 0;
  *(void *)(v0 + 200) = 0;
  *(unsigned char *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = v16;
  uint64_t v18 = v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator__state;
  v24[1] = 0;
  v24[2] = 0;
  char v25 = 2;
  sub_2287FAA48();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v3);
  uint64_t v19 = OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId;
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_retain();
  sub_2287E1414((uint64_t)v1 + v19);
  swift_release();
  v1[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F44EF0]), sel_init);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  v1[3] = v20;
  v1[6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F44F00]), sel_init);
  type metadata accessor for ScanResultDataProvider();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  v1[4] = v21;
  id v22 = v20;
  return v1;
}

id *sub_2287F1A64()
{
  id v1 = v0[8];
  if (v1)
  {
    objc_msgSend(v1, sel_invalidate);
    id v2 = v0[8];
  }
  else
  {
    id v2 = 0;
  }
  v0[8] = 0;

  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator__state;
  sub_2287F9AC0(0, &qword_2682651F8, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId;
  uint64_t v6 = sub_2287FA308();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t sub_2287F1BE0()
{
  sub_2287F1A64();
  return swift_deallocClassInstance();
}

uint64_t sub_2287F1C38()
{
  return type metadata accessor for MedicationDataScanningCoordinator();
}

uint64_t type metadata accessor for MedicationDataScanningCoordinator()
{
  uint64_t result = qword_268265940;
  if (!qword_268265940) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2287F1C8C()
{
  sub_2287F9AC0(319, &qword_2682651F8, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_2287FA308();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_2287F1DFC(char a1)
{
  uint64_t v3 = sub_2287FA2D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA378();
  if (a1)
  {
    sub_2287FA2C8();
    sub_2287FA298();
    uint64_t v8 = v7;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    *(void *)(v1 + 88) = v8;
    *(unsigned char *)(v1 + 96) = 0;
    objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
    uint64_t v9 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0;
  }
  long long v10 = *(void **)(v1 + 64);
  if (!v10 || (objc_msgSend(v10, sel_isValid) & 1) == 0)
  {
    id v11 = objc_msgSend(self, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v1, sel_pulseTimerFiredWithTimer_, 0, 1, 0.1);
    uint64_t v12 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = v11;
  }
  return sub_2287FA388();
}

void sub_2287F1F84(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v91 = sub_2287FABC8();
  uint64_t v4 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  long long v90 = (char *)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287F9B6C();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v110 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_2287FA7A8();
  uint64_t v8 = *(void *)(v100 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v100);
  long long v89 = (char *)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v101 = (char *)v79 - v11;
  uint64_t v102 = sub_2287FABA8();
  uint64_t v12 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v103 = (char *)v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_2287FABD8();
  uint64_t v14 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v104 = (char *)v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  if (!v121)
  {
    char v16 = 0;
    goto LABEL_5;
  }
  if (v121 == 1)
  {
    char v16 = 1;
LABEL_5:
    sub_2287CFF78((void *)v119, v120, v16);
    return;
  }
  uint64_t v17 = v101;
  if (!(v119 ^ 1 | v120))
  {
    uint64_t v99 = *(void *)(a1 + 16);
    if (v99)
    {
      uint64_t v111 = (void *)(v2 + 120);
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      uint64_t v18 = v14 + 16;
      unint64_t v97 = v19;
      uint64_t v96 = a1 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
      uint64_t v95 = *(void *)(v18 + 56);
      uint64_t v94 = (uint64_t (**)(char *, uint64_t))(v18 + 72);
      int v93 = *MEMORY[0x263F1F2B0];
      long long v88 = (void (**)(char *, uint64_t))(v8 + 8);
      unint64_t v83 = (void (**)(char *, uint64_t))(v18 - 8);
      uint64_t v98 = v18;
      long long v87 = (void (**)(char *, uint64_t))(v18 + 80);
      int v86 = *MEMORY[0x263F1F2B8];
      char v82 = (void (**)(char *, char *, uint64_t))(v4 + 32);
      uint64_t v81 = (void (**)(char *, uint64_t))(v4 + 8);
      uint64_t v85 = (void (**)(char *, char *, uint64_t))(v12 + 32);
      char v84 = (void (**)(char *, uint64_t))(v12 + 8);
      v79[0] = a1;
      swift_bridgeObjectRetain();
      uint64_t v20 = 0;
      *(void *)&long long v21 = 136446210;
      long long v80 = v21;
      v79[1] = MEMORY[0x263F8EE58] + 8;
      uint64_t v107 = MEMORY[0x263F8EE60] + 8;
      uint64_t v108 = v2 + 136;
      id v23 = v104;
      uint64_t v22 = v105;
      uint64_t v109 = v2;
      while (1)
      {
        uint64_t v106 = v20;
        v97(v23, v96 + v20 * v95, v22);
        int v24 = (*v94)(v23, v22);
        if (v24 != v93)
        {
          if (v24 == v86)
          {
            uint64_t v34 = v104;
            (*v87)(v104, v105);
            (*v82)(v90, v34, v91);
            long long v35 = self;
            long long v36 = (void *)sub_2287FABB8();
            id v37 = objc_msgSend(v35, sel_parsedGTIN14CodeFromBarcodeObservation_, v36);

            if (v37)
            {
              uint64_t v38 = sub_2287FAD68();
              uint64_t v40 = v39;

              sub_2287F30E0(808, v38, v40);
              swift_bridgeObjectRelease();
            }
            (*v81)(v90, v91);
          }
          else
          {
            sub_2287FA778();
            long long v76 = sub_2287FA798();
            os_log_type_t v77 = sub_2287FAF78();
            if (os_log_type_enabled(v76, v77))
            {
              int64_t v78 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)int64_t v78 = 0;
              _os_log_impl(&dword_2287C0000, v76, v77, "Encountered unexpected recognized item", v78, 2u);
              MEMORY[0x22A69ED10](v78, -1, -1);
            }

            (*v88)(v89, v100);
            (*v83)(v104, v105);
          }
          goto LABEL_10;
        }
        (*v87)(v23, v22);
        (*v85)(v103, v23, v102);
        unint64_t v25 = sub_2287FAB88();
        uint64_t v27 = v26;
        sub_2287FA778();
        swift_bridgeObjectRetain_n();
        uint64_t v28 = sub_2287FA798();
        os_log_type_t v29 = sub_2287FAF68();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc();
          uint64_t v31 = swift_slowAlloc();
          uint64_t v122 = v31;
          *(_DWORD *)uint64_t v30 = v80;
          unint64_t v119 = v25;
          uint64_t v120 = v27;
          swift_bridgeObjectRetain();
          uint64_t v32 = sub_2287FADA8();
          *(void *)(v30 + 4) = sub_2287F6838(v32, v33, &v122);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2287C0000, v28, v29, "Received new transcript: %{public}s", (uint8_t *)v30, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A69ED10](v31, -1, -1);
          MEMORY[0x22A69ED10](v30, -1, -1);

          (*v88)(v101, v100);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*v88)(v17, v100);
        }
        uint64_t v41 = *(void **)(v2 + 48);
        uint64_t v42 = (void *)sub_2287FAD38();
        swift_bridgeObjectRelease();
        id v43 = objc_msgSend(v41, sel_parsedNDCCodeFromString_, v42);

        if (v43)
        {
          uint64_t v44 = sub_2287FAD68();
          uint64_t v46 = v45;

          sub_2287F30E0(805, v44, v46);
          swift_bridgeObjectRelease();
        }
        id v92 = (id)sub_2287FAB98();
        id v47 = objc_msgSend(v92, sel_topCandidates_, 5);
        sub_2287C5C80(0, &qword_268265988);
        unint64_t v48 = sub_2287FAE48();

        if (v48 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v49 = sub_2287FB418();
          swift_bridgeObjectRelease();
          if (v49)
          {
LABEL_23:
            if (v49 < 1)
            {
              __break(1u);
              return;
            }
            uint64_t v50 = 0;
            uint64_t v51 = *(void *)(v2 + 56);
            uint64_t v113 = v49;
            uint64_t v114 = v51;
            unint64_t v112 = v48 & 0xC000000000000001;
            do
            {
              if (v112) {
                id v53 = (id)MEMORY[0x22A69E3A0](v50, v48);
              }
              else {
                id v53 = *(id *)(v48 + 8 * v50 + 32);
              }
              long long v54 = v53;
              id v55 = objc_msgSend(v53, sel_string);
              uint64_t v56 = sub_2287FAD68();
              uint64_t v58 = v57;

              sub_2287FA378();
              swift_beginAccess();
              swift_bridgeObjectRetain();
              sub_2287F6ED0(&v122, v56, v58);
              swift_endAccess();
              swift_bridgeObjectRelease();
              int64_t v59 = (void **)v111;
              swift_beginAccess();
              unint64_t v60 = *v59;
              swift_bridgeObjectRetain();
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              uint64_t *v59 = v60;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                unint64_t v60 = sub_2287E74A4(0, v60[2] + 1, 1, v60);
                *uint64_t v111 = v60;
              }
              unint64_t v63 = v60[2];
              unint64_t v62 = v60[3];
              if (v63 >= v62 >> 1)
              {
                unint64_t v60 = sub_2287E74A4((void *)(v62 > 1), v63 + 1, 1, v60);
                *uint64_t v111 = v60;
              }
              void v60[2] = v63 + 1;
              int v64 = &v60[2 * v63];
              v64[4] = v56;
              v64[5] = v58;
              swift_endAccess();
              int v65 = *(unsigned __int8 *)(v2 + 113);
              sub_2287FA388();
              if (v65 == 1)
              {
                swift_bridgeObjectRelease();

                uint64_t v52 = v113;
              }
              else
              {
                unint64_t v66 = v48;
                uint64_t v67 = sub_2287FAEF8();
                uint64_t v68 = *(void *)(v67 - 8);
                uint64_t v69 = (uint64_t)v110;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v110, 1, 1, v67);
                uint64_t v70 = swift_allocObject();
                swift_weakInit();
                uint64_t v71 = (void *)swift_allocObject();
                v71[2] = 0;
                v71[3] = 0;
                v71[4] = v70;
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v69, 1, v67) == 1)
                {
                  sub_2287F9CA4(v69);
                }
                else
                {
                  sub_2287FAEE8();
                  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v69, v67);
                }
                unint64_t v48 = v66;
                if (v71[2])
                {
                  swift_getObjectType();
                  swift_unknownObjectRetain();
                  uint64_t v72 = sub_2287FAEB8();
                  uint64_t v74 = v73;
                  swift_unknownObjectRelease();
                }
                else
                {
                  uint64_t v72 = 0;
                  uint64_t v74 = 0;
                }
                uint64_t v75 = swift_allocObject();
                *(void *)(v75 + 16) = &unk_268265998;
                *(void *)(v75 + 24) = v71;
                if (v74 | v72)
                {
                  uint64_t v115 = 0;
                  uint64_t v116 = 0;
                  uint64_t v117 = v72;
                  uint64_t v118 = v74;
                }
                uint64_t v2 = v109;
                uint64_t v52 = v113;
                swift_task_create();
                swift_bridgeObjectRelease();

                swift_release();
              }
              ++v50;
            }
            while (v52 != v50);
          }
        }
        else
        {
          uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v49) {
            goto LABEL_23;
          }
        }

        swift_bridgeObjectRelease();
        (*v84)(v103, v102);
        uint64_t v17 = v101;
LABEL_10:
        uint64_t v22 = v105;
        uint64_t v20 = v106 + 1;
        id v23 = v104;
        if (v106 + 1 == v99)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
    }
  }
}

void sub_2287F2CD4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2287FA7A8();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_2287FACB8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  if (v30)
  {
    if (v30 == 1)
    {
      sub_2287CFF78((void *)v28, v29, 1);
    }
    else if (!(v28 ^ 1 | v29))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
      int v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
      if (v14 == *MEMORY[0x263F1F328] || v14 == *MEMORY[0x263F1F310])
      {
        sub_2287FA778();
        char v16 = sub_2287FA798();
        os_log_type_t v17 = sub_2287FAF68();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_2287C0000, v16, v17, "Stability Low", v18, 2u);
          MEMORY[0x22A69ED10](v18, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v4);
        sub_2287FA378();
        objc_msgSend(*(id *)(v2 + 64), sel_invalidate);
        uint64_t v19 = *(void **)(v2 + 64);
        *(void *)(v2 + 64) = 0;

        sub_2287FA388();
      }
      else
      {
        sub_2287FA778();
        uint64_t v20 = sub_2287FA798();
        os_log_type_t v21 = sub_2287FAF68();
        if (os_log_type_enabled(v20, v21))
        {
          id v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v23 = 0;
          _os_log_impl(&dword_2287C0000, v20, v21, "Stability Normal", v23, 2u);
          MEMORY[0x22A69ED10](v23, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v4);
        sub_2287FA378();
        int v24 = *(void **)(v2 + 64);
        if (!v24 || (objc_msgSend(v24, sel_isValid) & 1) == 0)
        {
          id v25 = objc_msgSend(self, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v2, sel_pulseTimerFiredWithTimer_, 0, 1, 0.1);
          uint64_t v26 = *(void **)(v2 + 64);
          *(void *)(v2 + 64) = v25;
        }
        sub_2287FA388();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      }
    }
  }
  else
  {
    sub_2287CFF78((void *)v28, v29, 0);
  }
}

void sub_2287F30E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v24 = a1;
  uint64_t v7 = sub_2287FA2D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA378();
  swift_beginAccess();
  uint64_t v11 = *(void *)(v3 + 144);
  swift_bridgeObjectRetain();
  char v12 = sub_2287F349C(a2, a3, v11);
  swift_bridgeObjectRelease();
  if (v12)
  {
    sub_2287FA388();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2287F6ED0(v31, a2, a3);
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_2287FA2C8();
    sub_2287FA298();
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    *(void *)(v3 + 168) = v14;
    sub_2287FA388();
    uint64_t v15 = swift_allocObject();
    swift_weakInit();
    char v16 = (void *)swift_allocObject();
    _OWORD v16[2] = v15;
    v16[3] = a2;
    v16[4] = a3;
    id v17 = objc_allocWithZone(MEMORY[0x263F44BC0]);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v18 = (void *)sub_2287FAD38();
    uint64_t v29 = sub_2287F9E54;
    char v30 = v16;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v26 = 1107296256;
    uint64_t v27 = sub_2287F61EC;
    unint64_t v28 = &block_descriptor_83;
    uint64_t v19 = _Block_copy(&aBlock);
    uint64_t v20 = v24;
    id v21 = objc_msgSend(v17, sel_initWithMachineReadableCode_codeAttributeType_resultsHandler_, v18, v24, v19);

    _Block_release(v19);
    swift_release();
    swift_release();
    unint64_t aBlock = 0;
    unint64_t v26 = 0xE000000000000000;
    id v22 = v21;
    sub_2287FB348();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD000000000000017;
    unint64_t v26 = 0x8000000228801F60;
    v31[0] = a2;
    v31[1] = a3;
    swift_bridgeObjectRetain();
    sub_2287FADB8();
    sub_2287FAE08();
    swift_bridgeObjectRelease();
    sub_2287FAE08();
    v31[0] = v20;
    type metadata accessor for HKConceptAttributeType(0);
    sub_2287FADB8();
    sub_2287FAE08();
    swift_bridgeObjectRelease();
    id v23 = (void *)sub_2287FAD38();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setDebugIdentifier_, v23);

    objc_msgSend(*(id *)(v4 + 24), sel_executeQuery_, v22);
  }
}

uint64_t sub_2287F349C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_2287FB618();
    sub_2287FADE8();
    uint64_t v6 = sub_2287FB648();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2287FB5B8() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          char v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2287FB5B8() & 1) != 0) {
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

uint64_t sub_2287F35D4(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = sub_2287FA7A8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = result;
    if (a3)
    {
      uint64_t v36 = a5;
      id v16 = a3;
      sub_2287FA778();
      id v17 = a3;
      id v18 = a3;
      uint64_t v19 = sub_2287FA798();
      os_log_type_t v20 = sub_2287FAF78();
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v37 = (uint64_t)a3;
        v38[0] = v34;
        uint64_t v35 = a6;
        *(_DWORD *)id v21 = 136315138;
        uint64_t v32 = v21 + 4;
        unint64_t v33 = v21;
        id v22 = a3;
        sub_2287D02A0();
        uint64_t v23 = sub_2287FADB8();
        uint64_t v37 = sub_2287F6838(v23, v24, v38);
        a6 = v35;
        sub_2287FB248();
        swift_bridgeObjectRelease();

        id v25 = v33;
        _os_log_impl(&dword_2287C0000, v19, v20, "Unable to look up medication using MRC: %s", v33, 0xCu);
        uint64_t v26 = v34;
        swift_arrayDestroy();
        MEMORY[0x22A69ED10](v26, -1, -1);
        MEMORY[0x22A69ED10](v25, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      a5 = v36;
    }
    swift_retain();
    sub_2287FA378();
    swift_release();
    if (a2)
    {
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t result = sub_2287FB418();
        if (result) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v27 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t result = swift_bridgeObjectRetain();
        if (v27)
        {
LABEL_10:
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v28 = (id)MEMORY[0x22A69E3A0](0, a2);
          }
          else
          {
            if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            id v28 = *(id *)(a2 + 32);
          }
          uint64_t v29 = v28;
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          id v30 = v29;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v37 = *(void *)(v15 + 176);
          *(void *)(v15 + 176) = 0x8000000000000000;
          sub_2287EB24C((uint64_t)v30, a5, a6, isUniquelyReferenced_nonNull_native);
          *(void *)(v15 + 176) = v37;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();

          goto LABEL_16;
        }
      }
      swift_bridgeObjectRelease();
    }
LABEL_16:
    *(void *)(v15 + 168) = 0;
    swift_retain();
    sub_2287FA388();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2287F39A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_2287FA7A8();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2287F3A60, 0, 0);
}

uint64_t sub_2287F3A60()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[11] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[12] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2287F3B54;
    return sub_2287F3F14();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_2287F3B54()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2287F3CD0;
  }
  else {
    uint64_t v2 = sub_2287F3C68;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2287F3C68()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2287F3CD0()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = (void *)v0[13];
  sub_2287FA778();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_2287FA798();
  os_log_type_t v6 = sub_2287FAF78();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[13];
    uint64_t v8 = v0[9];
    uint64_t v21 = v0[10];
    uint64_t v20 = v0[8];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v22 = v10;
    v0[5] = v7;
    id v11 = v7;
    sub_2287D02A0();
    uint64_t v12 = sub_2287FADB8();
    v0[6] = sub_2287F6838(v12, v13, &v22);
    sub_2287FB248();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2287C0000, v5, v6, "Unable to read transcript: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v10, -1, -1);
    MEMORY[0x22A69ED10](v9, -1, -1);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v21, v20);
  }
  else
  {
    uint64_t v14 = (void *)v0[13];
    uint64_t v15 = v1[10];
    uint64_t v16 = v1[8];
    uint64_t v17 = v1[9];
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  }
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v1[1];
  return v18();
}

uint64_t sub_2287F3F14()
{
  v1[31] = v0;
  uint64_t v2 = sub_2287FA2D8();
  v1[32] = v2;
  v1[33] = *(void *)(v2 - 8);
  v1[34] = swift_task_alloc();
  uint64_t v3 = sub_2287FA7A8();
  v1[35] = v3;
  v1[36] = *(void *)(v3 - 8);
  v1[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2287F4030, 0, 0);
}

uint64_t sub_2287F4030()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0 + 31;
  v0[38] = *(void *)(v0[31] + 56);
  sub_2287FA378();
  swift_beginAccess();
  uint64_t v2 = sub_2287F4AB8();
  uint64_t v4 = v3;
  v0[39] = v2;
  v0[40] = v3;
  swift_endAccess();
  if (!v4)
  {
LABEL_5:
    sub_2287FA388();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  if (sub_2287FADF8() < 4 || (uint64_t v5 = *v1, (*(unsigned char *)(*v1 + 96) & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v0[41] = *(void *)(v5 + 88);
  *(unsigned char *)(v5 + 113) = 1;
  sub_2287FA388();
  sub_2287FA778();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_2287FA798();
  os_log_type_t v9 = sub_2287FAF68();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v0[36];
  uint64_t v11 = v0[37];
  uint64_t v13 = v0[35];
  if (v10)
  {
    uint64_t v21 = v0[35];
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v14 = 136446210;
    v0[27] = v2;
    v0[28] = v4;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2287FADA8();
    v0[30] = sub_2287F6838(v15, v16, &v22);
    sub_2287FB248();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2287C0000, v8, v9, "Processing new transcript: %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v20, -1, -1);
    MEMORY[0x22A69ED10](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  uint64_t v17 = *(void **)(v0[31] + 40);
  uint64_t v18 = sub_2287FAD38();
  v0[42] = v18;
  v0[2] = v0;
  v0[7] = v0 + 29;
  v0[3] = sub_2287F43D8;
  uint64_t v19 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2287F13E8;
  v0[13] = &block_descriptor;
  v0[14] = v19;
  objc_msgSend(v17, sel_resolveMedicationsUsing_resultLimit_completionHandler_, v18, 10, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2287F43D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2287F49BC;
  }
  else
  {
    uint64_t v2 = sub_2287F44F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2287F44F0()
{
  uint64_t v25 = v0;
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v22 = *(void *)(v0 + 312);
  uint64_t v23 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 256);
  os_log_type_t v6 = *(void **)(v0 + 232);
  *(void *)(v0 + 352) = v6;

  sub_2287F4EBC(v6);
  id v7 = objc_msgSend(v6, sel_usedNgrams);
  uint64_t v8 = sub_2287FAE48();

  uint64_t v9 = sub_2287F98FC(v8);
  swift_bridgeObjectRelease();
  sub_2287FA378();
  sub_2287FA2C8();
  sub_2287FA298();
  double v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  *(double *)(v5 + 104) = v11;
  *(unsigned char *)(v5 + 112) = 0;
  swift_beginAccess();
  sub_2287F6ED0(&v24, v22, v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(void *)(*(void *)(v5 + 184) + 16) <= *(void *)(v9 + 16) >> 3)
  {
    uint64_t v24 = v9;
    swift_bridgeObjectRetain();
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_2287F86B0(v14);
    swift_bridgeObjectRelease();
    uint64_t v13 = v24;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = sub_2287F8858(v12, v9);
    swift_bridgeObjectRelease();
  }
  double v15 = v11 - *(double *)(v0 + 328);
  swift_beginAccess();
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_2287F4B2C(v16);
  swift_endAccess();
  if (v15 <= 2.0)
  {
    uint64_t v17 = *(void *)(v9 + 16);
  }
  else
  {
    uint64_t v17 = *(void *)(v9 + 16);
    if (*(uint64_t *)(*(void *)(v0 + 248) + 200) >= 6)
    {
      if (!v17 || (uint64_t v18 = *(void *)(v13 + 16), (double)v18 / (double)v17 < 0.1))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(unsigned char *)(*(void *)(v0 + 248) + 208) = 1;
        goto LABEL_17;
      }
      goto LABEL_12;
    }
  }
  if (!v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v18 = *(void *)(v13 + 16);
LABEL_12:
  swift_bridgeObjectRelease();
  if (v18 == v17)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)(v9 + 16);
    swift_bridgeObjectRelease();
    if ((double)v18 / (double)v19 > 0.9) {
      sub_2287F4CAC();
    }
  }
LABEL_17:
  *(unsigned char *)(*(void *)(v0 + 248) + 113) = 0;
  sub_2287FA388();
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_2287F4830;
  return sub_2287F3F14();
}

uint64_t sub_2287F4830()
{
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2287F4A40;
  }
  else {
    uint64_t v2 = sub_2287F4944;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2287F4944()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2287F49BC()
{
  uint64_t v1 = *(void **)(v0 + 336);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2287F4A40()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2287F4AB8()
{
  uint64_t v1 = *(void **)v0;
  if (!*(void *)(*(void *)v0 + 16)) {
    return 0;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v3 = v1[2];
    if (v3)
    {
LABEL_4:
      uint64_t v4 = v3 - 1;
      uint64_t result = v1[2 * v4 + 4];
      v1[2] = v4;
      *(void *)uint64_t v0 = v1;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2287F95AC(v1);
    uint64_t v1 = (void *)result;
    uint64_t v3 = *(void *)(result + 16);
    if (v3) {
      goto LABEL_4;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2287F4B2C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    double v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_2287F6ED0(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_2287F4CAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2287FA2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2287F9B6C();
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(unsigned char *)(v1 + 208) = 0;
  *(void *)(v1 + 200) = 0;
  swift_beginAccess();
  *(void *)(v1 + 120) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v1 + 184) = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_2287FAEF8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  double v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  swift_retain();
  sub_2287F14A4((uint64_t)v8, (uint64_t)&unk_268265970, (uint64_t)v10);
  swift_release();
  sub_2287FA2C8();
  sub_2287FA298();
  uint64_t v12 = v11;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 88) = v12;
  *(unsigned char *)(v1 + 96) = 0;
  return result;
}

uint64_t sub_2287F4EBC(void *a1)
{
  sub_2287FA378();
  uint64_t v3 = *(void *)(v1 + 200);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + 200) = v5;
    if (!*(void *)(v1 + 192))
    {
      *(void *)(v1 + 192) = a1;
      id v11 = a1;
      return sub_2287FA388();
    }
    id v6 = objc_msgSend(a1, sel_resolvedIds);
    sub_2287C5C80(0, &qword_268265220);
    unint64_t v7 = sub_2287FAE48();

    if (!(v7 >> 62))
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2287FB418();
  swift_bridgeObjectRelease();
LABEL_5:
  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = *(void **)(v1 + 192);
    *(void *)(v1 + 192) = a1;
    id v10 = a1;
  }
  return sub_2287FA388();
}

uint64_t sub_2287F4FC4(char a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_2287FA308();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2287FA2D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v1 + 56);
  sub_2287FA378();
  sub_2287FA2C8();
  sub_2287FA298();
  double v16 = v15;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_beginAccess();
  uint64_t v17 = swift_bridgeObjectRetain();
  unint64_t v18 = (unint64_t)sub_2287E856C(v17);
  swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) != 0 || (v18 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)sub_2287FB418();
    swift_release();
    if (v19)
    {
LABEL_4:
      if ((v18 & 0xC000000000000001) != 0)
      {
        id v20 = (id)MEMORY[0x22A69E3A0](0, v18);
      }
      else
      {
        if (!*(void *)(v18 + 16))
        {
          __break(1u);
LABEL_23:
          swift_once();
LABEL_14:
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v4 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v6);
          swift_beginAccess();
          swift_retain();
          uint64_t v22 = swift_bridgeObjectRetain();
          uint64_t v36 = sub_2287E8464(v22);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          uint64_t v23 = swift_bridgeObjectRetain();
          uint64_t v24 = sub_2287E8464(v23);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          uint64_t v35 = v6;
          uint64_t v25 = swift_bridgeObjectRetain();
          uint64_t v26 = sub_2287E8464(v25);
          swift_bridgeObjectRelease();
          id v27 = objc_msgSend(v19, sel_specificProduct);
          id v28 = objc_msgSend(v27, sel_identifier);

          id v29 = objc_msgSend(v28, sel_numberRepresentation);
          id v30 = objc_msgSend(v29, sel_stringValue);

          uint64_t v31 = sub_2287FAD68();
          uint64_t v33 = v32;

          LOBYTE(v40) = v38;
          double v41 = v2;
          double v42 = v16;
          double v43 = v3;
          uint64_t v44 = v37;
          uint64_t v45 = 0;
          char v46 = 1;
          uint64_t v47 = 0;
          char v48 = 1;
          uint64_t v49 = 0;
          char v50 = 1;
          sub_2287E16F0((uint64_t)v9, (uint64_t)v36, (uint64_t)v24, (uint64_t)v26, v31, v33, 0, (unsigned __int8 *)&v40);
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v35);
          swift_getKeyPath();
          swift_getKeyPath();
          uint64_t v40 = v19;
          double v41 = 0.0;
          LOBYTE(v42) = 0;
          swift_retain();
          sub_2287FAA78();
          return sub_2287FA388();
        }
        id v20 = *(id *)(v18 + 32);
      }
      uint64_t v19 = v20;
      swift_release();
      uint64_t v39 = v14;
      objc_msgSend(*(id *)(v4 + 64), sel_invalidate);
      uint64_t v21 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = 0;

      int v38 = *(unsigned __int8 *)(v4 + 208);
      if (*(unsigned char *)(v4 + 96)) {
        double v2 = 0.0;
      }
      else {
        double v2 = *(double *)(v4 + 88);
      }
      if (*(unsigned char *)(v4 + 112)) {
        double v3 = 0.0;
      }
      else {
        double v3 = *(double *)(v4 + 104);
      }
      uint64_t v37 = *(void *)(v4 + 200);
      if (qword_268264F00 == -1) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v19 = *(void **)(v18 + 16);
    if (v19) {
      goto LABEL_4;
    }
  }
  swift_release();
  if ((a1 & 1) != 0 || *(unsigned char *)(v4 + 208) == 1 && v16 - *(double *)(v4 + 168) >= 0.5) {
    sub_2287F5558(v16);
  }
  return sub_2287FA388();
}

uint64_t sub_2287F5558(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2287FA308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  uint64_t v8 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;

  int v28 = *(unsigned __int8 *)(v1 + 208);
  if (*(unsigned char *)(v1 + 96)) {
    double v9 = 0.0;
  }
  else {
    double v9 = *(double *)(v1 + 88);
  }
  if (*(unsigned char *)(v1 + 112)) {
    double v10 = 0.0;
  }
  else {
    double v10 = *(double *)(v1 + 104);
  }
  uint64_t v11 = *(void *)(v1 + 200);
  if (qword_268264F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v4);
  swift_beginAccess();
  swift_retain();
  uint64_t v12 = swift_bridgeObjectRetain();
  int64_t v13 = sub_2287E8464(v12);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  double v15 = sub_2287E8464(v14);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_2287E8464(v16);
  swift_bridgeObjectRelease();
  unint64_t v18 = *(void **)(v1 + 192);
  LOBYTE(v29) = v28;
  *((double *)&v29 + 1) = v9;
  double v30 = a1;
  double v31 = v10;
  uint64_t v32 = v11;
  uint64_t v33 = 0;
  char v34 = 1;
  uint64_t v35 = 0;
  char v36 = 1;
  uint64_t v37 = 0;
  char v38 = 1;
  id v19 = v18;
  sub_2287E16F0((uint64_t)v7, (uint64_t)v13, (uint64_t)v15, (uint64_t)v17, 0, 0, v18, (unsigned __int8 *)&v29);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v20 = *(void **)(v1 + 192);
  if (!v20) {
    goto LABEL_15;
  }
  id v21 = v20;
  id v22 = objc_msgSend(v21, sel_resolvedIds);
  sub_2287C5C80(0, &qword_268265220);
  unint64_t v23 = sub_2287FAE48();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v24)
  {

LABEL_15:
    swift_getKeyPath();
    swift_getKeyPath();
    long long v29 = xmmword_2287FD880;
    LOBYTE(v30) = 2;
    swift_retain();
    return sub_2287FAA78();
  }
  uint64_t v25 = *(void *)(v2 + 128);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v29 = v20;
  *((void *)&v29 + 1) = v25;
  LOBYTE(v30) = 1;
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2287FAA78();
}

uint64_t sub_2287F59A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  uint64_t v5 = sub_2287FA7A8();
  uint64_t v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2287F5A64, 0, 0);
}

uint64_t sub_2287F5A64()
{
  uint64_t v1 = *(void **)(v0[20] + 40);
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_2287F5B64;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2287F5F10;
  v0[13] = &block_descriptor_76;
  v0[14] = v2;
  objc_msgSend(v1, sel_resetResolverWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2287F5B64()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_2287F5CD4;
  }
  else {
    uint64_t v2 = sub_2287F5C74;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2287F5C74()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2287F5CD4()
{
  id v21 = v0;
  uint64_t v1 = (void *)v0[24];
  swift_willThrow();
  sub_2287FA778();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2287FA798();
  os_log_type_t v5 = sub_2287FAF78();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[24];
    uint64_t v17 = v0[22];
    uint64_t v18 = v0[21];
    uint64_t v19 = v0[23];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_2287FB5F8();
    v0[19] = sub_2287F6838(v9, v10, &v20);
    sub_2287FB248();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2287C0000, v4, v5, "Failed to reset resolver, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69ED10](v8, -1, -1);
    MEMORY[0x22A69ED10](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    uint64_t v12 = v0[23];
    uint64_t v11 = (void *)v0[24];
    uint64_t v13 = v0[21];
    uint64_t v14 = v0[22];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  swift_task_dealloc();
  double v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_2287F5F10(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_2287D02A0();
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

void destroy for MedicationDataScanningCoordinatorState(uint64_t a1)
{
}

uint64_t _s25HealthMedicationsVisionUI38MedicationDataScanningCoordinatorStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2287CFF1C(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MedicationDataScanningCoordinatorState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2287CFF1C(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2287CFF78(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MedicationDataScanningCoordinatorState(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2287CFF78(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicationDataScanningCoordinatorState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicationDataScanningCoordinatorState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2287F61AC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_2287F61C4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MedicationDataScanningCoordinatorState()
{
  return &type metadata for MedicationDataScanningCoordinatorState;
}

uint64_t sub_2287F61EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_2287C5C80(0, &qword_268265398);
    uint64_t v5 = sub_2287FAE48();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2287F62A4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    double v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_2287FB618();
    swift_bridgeObjectRetain();
    sub_2287FADE8();
    uint64_t v18 = sub_2287FB648();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2287FB5B8() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_2287FB5B8() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    __n128 result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

double sub_2287F6548@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287FAA68();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2287F65D0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CFF1C(v1, v2, v3);
  swift_retain();
  return sub_2287FAA78();
}

uint64_t sub_2287F6664(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *char v4 = v2;
  v4[1] = sub_2287F6740;
  return v6(a1);
}

uint64_t sub_2287F6740()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2287F6838(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2287F690C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2287DBBD0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2287DBBD0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2287F690C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2287FB258();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2287F6AC8(a5, a6);
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
  uint64_t v8 = sub_2287FB398();
  if (!v8)
  {
    sub_2287FB3F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2287FB478();
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

uint64_t sub_2287F6AC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2287F6B60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2287F6D60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2287F6D60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2287F6B60(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2287F6CD8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2287FB358();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2287FB3F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2287FAE18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2287FB478();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2287FB3F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2287F6CD8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_2287F9AC0(0, &qword_268265958, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2287F6D60(char a1, int64_t a2, char a3, char *a4)
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
    sub_2287F9AC0(0, &qword_268265958, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_2287FB478();
  __break(1u);
  return result;
}

uint64_t sub_2287F6ED0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2287FB618();
  swift_bridgeObjectRetain();
  sub_2287FADE8();
  uint64_t v8 = sub_2287FB648();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2287FB5B8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      if (v19 || (sub_2287FB5B8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2287F7B10(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2287F7080(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_2287FB2D8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2287C5C80(0, &qword_2682653A8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_2287FB2C8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_2287F7320(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_2287F77F0();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_2287F7A8C((uint64_t)v8, v22);
    *unint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2287FB108();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_2287C5C80(0, &qword_2682653A8);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_2287FB118();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_2287FB118();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_2287F7CAC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2287F7320(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_2287FA068();
    uint64_t v2 = sub_2287FB318();
    uint64_t v14 = v2;
    sub_2287FB2B8();
    if (sub_2287FB2E8())
    {
      sub_2287C5C80(0, &qword_2682653A8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_2287F77F0();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_2287FB108();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_2287FB2E8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_2287F7514()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2287F9B0C();
  uint64_t v3 = sub_2287FB308();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v30 = (void *)(v2 + 56);
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
                  void *v30 = -1 << v29;
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
      sub_2287FB618();
      sub_2287FADE8();
      uint64_t result = sub_2287FB648();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2287F77F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2287FA068();
  uint64_t v3 = sub_2287FB308();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_2287FB108();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_2287F7A8C(uint64_t a1, uint64_t a2)
{
  sub_2287FB108();
  unint64_t result = sub_2287FB2A8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_2287F7B10(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2287F7514();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_2287F7E34();
      goto LABEL_22;
    }
    sub_2287F818C();
  }
  uint64_t v11 = *v4;
  sub_2287FB618();
  sub_2287FADE8();
  unint64_t result = sub_2287FB648();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_2287FB5B8(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_2287FB5D8();
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
          unint64_t result = sub_2287FB5B8();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void sub_2287F7CAC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2287F77F0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2287F7FE4();
      goto LABEL_14;
    }
    sub_2287F8438();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_2287FB108();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_2287C5C80(0, &qword_2682653A8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_2287FB118();

    if (v12)
    {
LABEL_13:
      sub_2287FB5D8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_2287FB118();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_2287F7E34()
{
  uint64_t v1 = v0;
  sub_2287F9B0C();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2287FB2F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_2287F7FE4()
{
  uint64_t v1 = v0;
  sub_2287FA068();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2287FB2F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2287F818C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2287F9B0C();
  uint64_t v3 = sub_2287FB308();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2287FB618();
    swift_bridgeObjectRetain();
    sub_2287FADE8();
    uint64_t result = sub_2287FB648();
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
    void *v13 = v20;
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

uint64_t sub_2287F8438()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2287FA068();
  uint64_t v3 = sub_2287FB308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_2287FB108();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2287F86B0(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    int64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_2287F8CC8(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_2287F8858(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_2287ED17C();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_2287FB618();
      swift_bridgeObjectRetain();
      sub_2287FADE8();
      uint64_t v19 = sub_2287FB648();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    char v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_2287FB5B8() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_2287FB5B8() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_2287F8E58((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_2287ED17C();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_2287F8E58((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_2287ED17C();
      MEMORY[0x22A69ED10](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_2287F8CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_2287FB618();
  swift_bridgeObjectRetain();
  sub_2287FADE8();
  uint64_t v6 = sub_2287FB648();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_2287FB5B8() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_2287FB5B8() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2287F7E34();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_2287F93E4(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2287F8E58(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_2287F9150(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_2287FB618();
        swift_bridgeObjectRetain();
        sub_2287FADE8();
        uint64_t v22 = sub_2287FB648();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_2287FB5B8() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          char v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_2287FB5B8() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_2287F9150(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_2287F9B0C();
  uint64_t result = sub_2287FB328();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_2287FB618();
    swift_bridgeObjectRetain();
    sub_2287FADE8();
    uint64_t result = sub_2287FB648();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_2287F93E4(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2287FB298();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2287FB618();
        swift_bridgeObjectRetain();
        sub_2287FADE8();
        uint64_t v10 = sub_2287FB648();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _OWORD *v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void *sub_2287F95AC(void *a1)
{
  return sub_2287E74A4(0, a1[2], 0, a1);
}

uint64_t sub_2287F95C0(void *a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, char a6)
{
  if (!a3)
  {
    if (!a6)
    {
      sub_2287C5C80(0, &qword_268265328);
      sub_2287CFF1C(a1, a2, 0);
      sub_2287CFF1C((id)a4, a5, 0);
      char v14 = sub_2287FB118();
      sub_2287CFF78((void *)a4, a5, 0);
      sub_2287CFF78(a1, a2, 0);
      return v14 & 1;
    }
    return 0;
  }
  if (a3 == 1)
  {
    if (a6 == 1)
    {
      sub_2287C5C80(0, &qword_268265328);
      id v10 = a1;
      id v11 = (id)a4;
      char v12 = sub_2287FB118();

      if (v12)
      {
        return sub_2287F62A4(a2, a5);
      }
    }
    return 0;
  }
  switch((unint64_t)a1)
  {
    case 1uLL:
      if (a6 != 2 || a4 != 1) {
        return 0;
      }
      goto LABEL_23;
    case 2uLL:
      if (a6 != 2 || a4 != 2) {
        return 0;
      }
      goto LABEL_23;
    case 3uLL:
      if (a6 != 2 || a4 != 3) {
        return 0;
      }
LABEL_23:
      if (!a5) {
        goto LABEL_24;
      }
      return 0;
    default:
      if (a6 != 2 || a5 | a4) {
        return 0;
      }
LABEL_24:
      uint64_t result = 1;
      break;
  }
  return result;
}

uint64_t sub_2287F97A8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2287FB418();
    swift_bridgeObjectRelease();
  }
  sub_2287C5C80(0, &qword_2682653A8);
  sub_2287D46E8();
  uint64_t result = sub_2287FAF48();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2287FB418();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unint64_t v6 = (void *)MEMORY[0x22A69E3A0](i, a1);
        sub_2287F7080(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_2287F7080(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2287F98FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2287FAF48();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2287F6ED0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2287F9994()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2287FA2D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287FA2C8();
  sub_2287FA298();
  double v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2287FA378();
  double v9 = *(double *)(v1 + 80);
  double v8 = *(double *)(v1 + 88);
  char v10 = *(unsigned char *)(v1 + 96);
  double v11 = v7 - *(double *)(v1 + 72);
  uint64_t result = sub_2287FA388();
  if (v11 > 2.0)
  {
    if (v7 >= v9) {
      char v13 = 1;
    }
    else {
      char v13 = v10;
    }
    if (v7 - v8 >= 5.0) {
      char v14 = 1;
    }
    else {
      char v14 = v13;
    }
    return sub_2287F4FC4(v14);
  }
  return result;
}

void sub_2287F9AC0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2287F9B0C()
{
  if (!qword_268265960)
  {
    unint64_t v0 = sub_2287FB338();
    if (!v1) {
      atomic_store(v0, &qword_268265960);
    }
  }
}

void sub_2287F9B6C()
{
  if (!qword_268265208)
  {
    sub_2287FAEF8();
    unint64_t v0 = sub_2287FB238();
    if (!v1) {
      atomic_store(v0, &qword_268265208);
    }
  }
}

uint64_t sub_2287F9BC4()
{
  return objectdestroyTm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_2287F9BF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  double v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *double v7 = v2;
  v7[1] = sub_2287CFCF0;
  return sub_2287F59A4(a1, v4, v5, v6);
}

uint64_t sub_2287F9CA4(uint64_t a1)
{
  sub_2287F9B6C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287F9D00()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2287F9D38(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2287FA1AC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268265978 + dword_268265978);
  return v6(a1, v4);
}

uint64_t sub_2287F9DF0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2287F9E28()
{
  return objectdestroyTm(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_2287F9E54(uint64_t a1, unint64_t a2, void *a3)
{
  return sub_2287F35D4(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_2287F9E78()
{
  return objectdestroyTm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t objectdestroyTm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 32));
  return MEMORY[0x270FA0238](v2, 40, 7);
}

uint64_t sub_2287F9EFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  double v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *double v7 = v2;
  v7[1] = sub_2287FA1AC;
  return sub_2287F39A0(a1, v4, v5, v6);
}

uint64_t sub_2287F9FB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2287CFCF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268265978 + dword_268265978);
  return v6(a1, v4);
}

void sub_2287FA068()
{
  if (!qword_2682659A8)
  {
    sub_2287C5C80(255, &qword_2682653A8);
    sub_2287D46E8();
    unint64_t v0 = sub_2287FB338();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682659A8);
    }
  }
}

void sub_2287FA0DC()
{
  if (!qword_2682659B0)
  {
    sub_2287FA144();
    unint64_t v0 = sub_2287FA9B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2682659B0);
    }
  }
}

void sub_2287FA144()
{
  if (!qword_2682659B8)
  {
    type metadata accessor for HKConceptAttributeType(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2682659B8);
    }
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2287FA1D8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2287FA1E8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2287FA1F8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2287FA208()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2287FA218()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_2287FA228()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2287FA238()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2287FA248()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2287FA258()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2287FA268()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2287FA278()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2287FA288()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2287FA298()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_2287FA2A8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2287FA2B8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2287FA2C8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2287FA2D8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2287FA2E8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2287FA2F8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2287FA308()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2287FA318()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_2287FA328()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_2287FA338()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_2287FA348()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_2287FA358()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_2287FA368()
{
  return MEMORY[0x270F32640]();
}

uint64_t sub_2287FA378()
{
  return MEMORY[0x270F36280]();
}

uint64_t sub_2287FA388()
{
  return MEMORY[0x270F36288]();
}

uint64_t sub_2287FA398()
{
  return MEMORY[0x270F36290]();
}

uint64_t sub_2287FA3A8()
{
  return MEMORY[0x270F36298]();
}

uint64_t sub_2287FA3B8()
{
  return MEMORY[0x270F32228]();
}

uint64_t sub_2287FA3C8()
{
  return MEMORY[0x270F32BE8]();
}

uint64_t sub_2287FA3D8()
{
  return MEMORY[0x270F33118]();
}

uint64_t sub_2287FA3E8()
{
  return MEMORY[0x270F33128]();
}

uint64_t sub_2287FA3F8()
{
  return MEMORY[0x270F33178]();
}

uint64_t sub_2287FA408()
{
  return MEMORY[0x270F331B0]();
}

uint64_t sub_2287FA418()
{
  return MEMORY[0x270F333C8]();
}

uint64_t sub_2287FA428()
{
  return MEMORY[0x270F333D0]();
}

uint64_t sub_2287FA438()
{
  return MEMORY[0x270F333D8]();
}

uint64_t sub_2287FA448()
{
  return MEMORY[0x270F333E0]();
}

uint64_t sub_2287FA458()
{
  return MEMORY[0x270F333E8]();
}

uint64_t sub_2287FA468()
{
  return MEMORY[0x270F33530]();
}

uint64_t sub_2287FA478()
{
  return MEMORY[0x270F33538]();
}

uint64_t sub_2287FA488()
{
  return MEMORY[0x270F33630]();
}

uint64_t sub_2287FA498()
{
  return MEMORY[0x270F33650]();
}

uint64_t sub_2287FA4A8()
{
  return MEMORY[0x270F336B8]();
}

uint64_t sub_2287FA4B8()
{
  return MEMORY[0x270F338B8]();
}

uint64_t sub_2287FA4C8()
{
  return MEMORY[0x270F338F0]();
}

uint64_t sub_2287FA4D8()
{
  return MEMORY[0x270F33900]();
}

uint64_t sub_2287FA4E8()
{
  return MEMORY[0x270F33C18]();
}

uint64_t sub_2287FA4F8()
{
  return MEMORY[0x270F33C50]();
}

uint64_t sub_2287FA508()
{
  return MEMORY[0x270F33C68]();
}

uint64_t sub_2287FA518()
{
  return MEMORY[0x270F33F88]();
}

uint64_t sub_2287FA528()
{
  return MEMORY[0x270F33F90]();
}

uint64_t sub_2287FA538()
{
  return MEMORY[0x270F33F98]();
}

uint64_t sub_2287FA548()
{
  return MEMORY[0x270F34240]();
}

uint64_t sub_2287FA558()
{
  return MEMORY[0x270F34248]();
}

uint64_t sub_2287FA568()
{
  return MEMORY[0x270F34250]();
}

uint64_t sub_2287FA578()
{
  return MEMORY[0x270F34258]();
}

uint64_t sub_2287FA588()
{
  return MEMORY[0x270F34260]();
}

uint64_t sub_2287FA598()
{
  return MEMORY[0x270F34268]();
}

uint64_t sub_2287FA5A8()
{
  return MEMORY[0x270F34270]();
}

uint64_t sub_2287FA5B8()
{
  return MEMORY[0x270F34278]();
}

uint64_t sub_2287FA5C8()
{
  return MEMORY[0x270F34280]();
}

uint64_t sub_2287FA5D8()
{
  return MEMORY[0x270F34288]();
}

uint64_t sub_2287FA5E8()
{
  return MEMORY[0x270F34290]();
}

uint64_t sub_2287FA5F8()
{
  return MEMORY[0x270F34650]();
}

uint64_t sub_2287FA608()
{
  return MEMORY[0x270F34740]();
}

uint64_t sub_2287FA618()
{
  return MEMORY[0x270F34778]();
}

uint64_t sub_2287FA628()
{
  return MEMORY[0x270F34850]();
}

uint64_t sub_2287FA638()
{
  return MEMORY[0x270F34968]();
}

uint64_t sub_2287FA648()
{
  return MEMORY[0x270F34970]();
}

uint64_t sub_2287FA658()
{
  return MEMORY[0x270F34998]();
}

uint64_t sub_2287FA668()
{
  return MEMORY[0x270F34A78]();
}

uint64_t sub_2287FA678()
{
  return MEMORY[0x270F34A80]();
}

uint64_t sub_2287FA688()
{
  return MEMORY[0x270F34A88]();
}

uint64_t sub_2287FA698()
{
  return MEMORY[0x270F34A90]();
}

uint64_t sub_2287FA6A8()
{
  return MEMORY[0x270F34A98]();
}

uint64_t sub_2287FA6B8()
{
  return MEMORY[0x270F34AA0]();
}

uint64_t sub_2287FA6C8()
{
  return MEMORY[0x270F34AA8]();
}

uint64_t sub_2287FA6D8()
{
  return MEMORY[0x270F34AD0]();
}

uint64_t sub_2287FA6E8()
{
  return MEMORY[0x270F34AD8]();
}

uint64_t sub_2287FA6F8()
{
  return MEMORY[0x270F34B08]();
}

uint64_t sub_2287FA708()
{
  return MEMORY[0x270F35530]();
}

uint64_t sub_2287FA718()
{
  return MEMORY[0x270F35538]();
}

uint64_t sub_2287FA728()
{
  return MEMORY[0x270F35580]();
}

uint64_t sub_2287FA738()
{
  return MEMORY[0x270F35588]();
}

uint64_t sub_2287FA748()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2287FA758()
{
  return MEMORY[0x270FA2CB8]();
}

uint64_t sub_2287FA768()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2287FA778()
{
  return MEMORY[0x270F36E48]();
}

uint64_t sub_2287FA788()
{
  return MEMORY[0x270F356A0]();
}

uint64_t sub_2287FA798()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2287FA7A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2287FA7B8()
{
  return MEMORY[0x270F81960]();
}

uint64_t sub_2287FA7C8()
{
  return MEMORY[0x270F81978]();
}

uint64_t sub_2287FA7D8()
{
  return MEMORY[0x270F81990]();
}

uint64_t sub_2287FA7E8()
{
  return MEMORY[0x270F819A8]();
}

uint64_t sub_2287FA7F8()
{
  return MEMORY[0x270F819B0]();
}

uint64_t sub_2287FA808()
{
  return MEMORY[0x270F819D0]();
}

uint64_t sub_2287FA818()
{
  return MEMORY[0x270F81CB8]();
}

uint64_t sub_2287FA828()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_2287FA838()
{
  return MEMORY[0x270F81CD8]();
}

uint64_t sub_2287FA848()
{
  return MEMORY[0x270F81CF8]();
}

uint64_t sub_2287FA858()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_2287FA868()
{
  return MEMORY[0x270F81D90]();
}

uint64_t sub_2287FA878()
{
  return MEMORY[0x270F81DE8]();
}

uint64_t sub_2287FA888()
{
  return MEMORY[0x270F81DF0]();
}

uint64_t sub_2287FA898()
{
  return MEMORY[0x270F81E48]();
}

uint64_t sub_2287FA8A8()
{
  return MEMORY[0x270F81E50]();
}

uint64_t sub_2287FA8B8()
{
  return MEMORY[0x270F81E70]();
}

uint64_t sub_2287FA8C8()
{
  return MEMORY[0x270F81ED8]();
}

uint64_t sub_2287FA8D8()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_2287FA8E8()
{
  return MEMORY[0x270F82040]();
}

uint64_t sub_2287FA8F8()
{
  return MEMORY[0x270F82068]();
}

uint64_t sub_2287FA908()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_2287FA918()
{
  return MEMORY[0x270EE38E0]();
}

uint64_t sub_2287FA928()
{
  return MEMORY[0x270EE3908]();
}

uint64_t sub_2287FA938()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_2287FA948()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_2287FA958()
{
  return MEMORY[0x270EE3A98]();
}

uint64_t sub_2287FA968()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_2287FA978()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_2287FA988()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2287FA998()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_2287FA9A8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_2287FA9B8()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_2287FA9C8()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_2287FA9D8()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_2287FA9E8()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_2287FA9F8()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_2287FAA08()
{
  return MEMORY[0x270EE3D68]();
}

uint64_t sub_2287FAA18()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_2287FAA28()
{
  return MEMORY[0x270EE3D98]();
}

uint64_t sub_2287FAA38()
{
  return MEMORY[0x270EE3DA0]();
}

uint64_t sub_2287FAA48()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2287FAA58()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2287FAA68()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2287FAA78()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2287FAA88()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_2287FAA98()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_2287FAAA8()
{
  return MEMORY[0x270EE3E38]();
}

uint64_t sub_2287FAAB8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_2287FAAC8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_2287FAAD8()
{
  return MEMORY[0x270EE3FA0]();
}

uint64_t sub_2287FAAE8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_2287FAAF8()
{
  return MEMORY[0x270EE3FE0]();
}

uint64_t sub_2287FAB08()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2287FAB18()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2287FAB28()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2287FAB38()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2287FAB48()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2287FAB58()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2287FAB68()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2287FAB78()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2287FAB88()
{
  return MEMORY[0x270F069D0]();
}

uint64_t sub_2287FAB98()
{
  return MEMORY[0x270F069D8]();
}

uint64_t sub_2287FABA8()
{
  return MEMORY[0x270F069E0]();
}

uint64_t sub_2287FABB8()
{
  return MEMORY[0x270F06A18]();
}

uint64_t sub_2287FABC8()
{
  return MEMORY[0x270F06A28]();
}

uint64_t sub_2287FABD8()
{
  return MEMORY[0x270F06A30]();
}

uint64_t sub_2287FABE8()
{
  return MEMORY[0x270F06A70]();
}

uint64_t sub_2287FABF8()
{
  return MEMORY[0x270F06A78]();
}

uint64_t sub_2287FAC08()
{
  return MEMORY[0x270F06A80]();
}

uint64_t sub_2287FAC18()
{
  return MEMORY[0x270F06A88]();
}

uint64_t sub_2287FAC28()
{
  return MEMORY[0x270F06A90]();
}

uint64_t sub_2287FAC38()
{
  return MEMORY[0x270F06AA0]();
}

uint64_t sub_2287FAC48()
{
  return MEMORY[0x270F06AA8]();
}

uint64_t sub_2287FAC58()
{
  return MEMORY[0x270F06AB0]();
}

uint64_t sub_2287FAC68()
{
  return MEMORY[0x270F06AB8]();
}

uint64_t sub_2287FAC78()
{
  return MEMORY[0x270F06AC0]();
}

uint64_t sub_2287FAC88()
{
  return MEMORY[0x270F06AC8]();
}

uint64_t sub_2287FAC98()
{
  return MEMORY[0x270F06AD0]();
}

uint64_t sub_2287FACA8()
{
  return MEMORY[0x270F06AD8]();
}

uint64_t sub_2287FACB8()
{
  return MEMORY[0x270F06AE8]();
}

uint64_t sub_2287FACC8()
{
  return MEMORY[0x270F06AF0]();
}

uint64_t sub_2287FACD8()
{
  return MEMORY[0x270F06AF8]();
}

uint64_t sub_2287FACE8()
{
  return MEMORY[0x270F06B00]();
}

uint64_t sub_2287FACF8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2287FAD08()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2287FAD18()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2287FAD28()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2287FAD38()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2287FAD48()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2287FAD58()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2287FAD68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2287FAD78()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2287FAD88()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2287FAD98()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2287FADA8()
{
  return MEMORY[0x270F36F20]();
}

uint64_t sub_2287FADB8()
{
  return MEMORY[0x270F36F28]();
}

uint64_t sub_2287FADC8()
{
  return MEMORY[0x270F356D0]();
}

uint64_t sub_2287FADD8()
{
  return MEMORY[0x270F356D8]();
}

uint64_t sub_2287FADE8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2287FADF8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2287FAE08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2287FAE18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2287FAE28()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2287FAE38()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2287FAE48()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2287FAE58()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2287FAE68()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2287FAE78()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2287FAE88()
{
  return MEMORY[0x270F356E8]();
}

uint64_t sub_2287FAE98()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2287FAEA8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2287FAEB8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2287FAEC8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2287FAED8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2287FAEE8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2287FAEF8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2287FAF08()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2287FAF18()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_2287FAF28()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_2287FAF38()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2287FAF48()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2287FAF58()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2287FAF68()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2287FAF78()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2287FAF88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2287FAF98()
{
  return MEMORY[0x270F34D40]();
}

uint64_t sub_2287FAFA8()
{
  return MEMORY[0x270F34D50]();
}

uint64_t sub_2287FAFB8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2287FAFC8()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_2287FAFD8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2287FAFE8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2287FAFF8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2287FB008()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2287FB018()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2287FB028()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2287FB038()
{
  return MEMORY[0x270F82658]();
}

uint64_t sub_2287FB048()
{
  return MEMORY[0x270F82670]();
}

uint64_t sub_2287FB058()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_2287FB068()
{
  return MEMORY[0x270F37D30]();
}

uint64_t sub_2287FB078()
{
  return MEMORY[0x270F35710]();
}

uint64_t sub_2287FB088()
{
  return MEMORY[0x270F35718]();
}

uint64_t sub_2287FB098()
{
  return MEMORY[0x270F35720]();
}

uint64_t sub_2287FB0A8()
{
  return MEMORY[0x270F35728]();
}

uint64_t sub_2287FB0B8()
{
  return MEMORY[0x270F826D0]();
}

uint64_t sub_2287FB0C8()
{
  return MEMORY[0x270EF2070]();
}

uint64_t sub_2287FB0D8()
{
  return MEMORY[0x270F34E68]();
}

uint64_t sub_2287FB0E8()
{
  return MEMORY[0x270F34E70]();
}

uint64_t sub_2287FB0F8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_2287FB108()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2287FB118()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2287FB128()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2287FB138()
{
  return MEMORY[0x270F82980]();
}

uint64_t sub_2287FB148()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_2287FB158()
{
  return MEMORY[0x270F82A10]();
}

uint64_t sub_2287FB168()
{
  return MEMORY[0x270F34EC8]();
}

uint64_t sub_2287FB178()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_2287FB188()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_2287FB198()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_2287FB1A8()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_2287FB1B8()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_2287FB1C8()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_2287FB1D8()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_2287FB1E8()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_2287FB1F8()
{
  return MEMORY[0x270F357B0]();
}

uint64_t sub_2287FB208()
{
  return MEMORY[0x270EF2320]();
}

uint64_t sub_2287FB218()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_2287FB228()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2287FB238()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2287FB248()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2287FB258()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2287FB268()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_2287FB278()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2287FB288()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2287FB298()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2287FB2A8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2287FB2B8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2287FB2C8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2287FB2D8()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2287FB2E8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2287FB2F8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2287FB308()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2287FB318()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2287FB328()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2287FB338()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_2287FB348()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2287FB358()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2287FB368()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2287FB378()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2287FB388()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2287FB398()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2287FB3A8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2287FB3B8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2287FB3C8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2287FB3D8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2287FB3E8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2287FB3F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2287FB408()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2287FB418()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2287FB428()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2287FB438()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2287FB448()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2287FB458()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2287FB468()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_2287FB478()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2287FB498()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2287FB4A8()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_2287FB4B8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2287FB4C8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2287FB4D8()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2287FB4E8()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_2287FB4F8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2287FB508()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2287FB518()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2287FB528()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_2287FB538()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2287FB548()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2287FB558()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2287FB568()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_2287FB578()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2287FB588()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2287FB598()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2287FB5A8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2287FB5B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2287FB5C8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2287FB5D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2287FB5E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2287FB5F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2287FB608()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2287FB618()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2287FB628()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2287FB638()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2287FB648()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2287FB658()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2287FB668()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2287FB698()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

uint64_t HKStringFromOntologyShardState()
{
  return MEMORY[0x270EF3870]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}