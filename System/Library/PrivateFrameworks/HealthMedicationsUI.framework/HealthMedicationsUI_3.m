void sub_1C211AE3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_1C211A588();
  v2 = *(void *)(v0 + 40);
  type metadata accessor for MedicationCompactEducationDataSource();
  swift_allocObject();
  swift_retain();
  v3 = MedicationCompactEducationDataSource.init(with:analyticsManager:)(v1, v2);
  v4 = objc_msgSend(self, sel_sharedBehavior);
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_features);

  if (!v6)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v7 = objc_msgSend(v6, sel_stanley);

  if (v7)
  {
    v8 = sub_1C211A588();
    type metadata accessor for MedicationRegularEducationDataSource();
    swift_allocObject();
    swift_retain();
    v9 = MedicationRegularEducationDataSource.init(with:analyticsManager:)(v8, v2);
    sub_1C211BE1C(0, &qword_1EA2C7658, (uint64_t (*)(uint64_t))sub_1C211B1FC, MEMORY[0x1E4FBBE00]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C214FCC0;
    *(void *)(inited + 32) = 1;
    v11 = sub_1C211C148(&qword_1EA2C7118, (void (*)(uint64_t))type metadata accessor for MedicationCompactEducationDataSource);
    v12 = sub_1C211C148(&qword_1EA2C7650, (void (*)(uint64_t))type metadata accessor for MedicationCompactEducationDataSource);
    *(void *)(inited + 40) = v3;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v12;
    *(void *)(inited + 64) = 2;
    v13 = sub_1C211C148(&qword_1EA2C4DC8, (void (*)(uint64_t))type metadata accessor for MedicationRegularEducationDataSource);
    v14 = sub_1C211C148(&qword_1EA2C7668, (void (*)(uint64_t))type metadata accessor for MedicationRegularEducationDataSource);
    *(void *)(inited + 72) = v9;
    *(void *)(inited + 80) = v13;
    *(void *)(inited + 88) = v14;
    sub_1C1F4C2F4(inited);
    swift_setDeallocating();
    sub_1C211B1FC();
    swift_retain();
    swift_retain();
    swift_arrayDestroy();
    sub_1C2148920();
    swift_allocObject();
    sub_1C2148910();
    swift_release();
    swift_release();
  }
  else
  {
    sub_1C211C148(&qword_1EA2C7650, (void (*)(uint64_t))type metadata accessor for MedicationCompactEducationDataSource);
  }
}

uint64_t sub_1C211B154()
{
  swift_release();

  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MedicationConceptDetailDataSourceProvider()
{
  return self;
}

void *sub_1C211B1D8()
{
  return sub_1C211A614();
}

void sub_1C211B1FC()
{
  if (!qword_1EA2C7660)
  {
    type metadata accessor for UIUserInterfaceSizeClass(255);
    sub_1C1F4C4E4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA2C7660);
    }
  }
}

uint64_t sub_1C211B26C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_1C1F12718(0, (unint64_t *)&qword_1EA2C4AA0);
  id v3 = *(id *)(v2 + qword_1EA2C6728);
  char v4 = sub_1C214B220();

  return v4 & 1;
}

uint64_t sub_1C211B2EC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1C2147F70();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C211B354(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  char v11 = a5 & 1;
  sub_1C1F60744();
  uint64_t v32 = *(void *)(v12 - 8);
  uint64_t v33 = v12;
  MEMORY[0x1F4188790](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C2149430();
  MEMORY[0x1F4188790](v15 - 8);
  v35[3] = &type metadata for TransientSchedule;
  v35[4] = sub_1C211C190();
  v16 = (_OWORD *)swift_allocObject();
  v35[0] = v16;
  v17 = *(void **)(a1 + 40);
  long long v18 = *(_OWORD *)(a1 + 16);
  v16[1] = *(_OWORD *)a1;
  v16[2] = v18;
  v16[3] = *(_OWORD *)(a1 + 32);
  v19 = (void *)(a6 + qword_1EA2C3890);
  void *v19 = 0xD000000000000014;
  v19[1] = 0x80000001C215FE50;
  uint64_t v20 = qword_1EA2C3898;
  swift_retain();
  sub_1C2149420();
  id v21 = objc_allocWithZone((Class)sub_1C2149460());
  *(void *)(a6 + v20) = sub_1C2149450();
  uint64_t v22 = qword_1EA2C38A0;
  *(void *)(a6 + qword_1EA2C38A0) = 0;
  uint64_t v23 = qword_1EA2C38B0;
  *(void *)(a6 + qword_1EA2C38B0) = 0;
  *(void *)(a6 + qword_1EA2C38B8) = MEMORY[0x1E4FBC870];
  sub_1C1F236D8((uint64_t)v35, a6 + qword_1EA2C3880);
  v24 = *(void **)(a6 + v22);
  *(void *)(a6 + v22) = a2;
  id v25 = a2;

  *(void *)(a6 + qword_1EA2C38A8) = a4;
  uint64_t v34 = (uint64_t)v17;
  sub_1C1F604A8();
  swift_allocObject();
  swift_retain();
  id v26 = v17;
  *(void *)(a6 + qword_1EA2C3888) = sub_1C2149EB0();
  *(unsigned char *)(a6 + qword_1EA2C3878) = v11;
  *(void *)(a6 + v23) = a3;
  swift_retain();
  swift_release();
  swift_release();
  sub_1C211BE1C(0, (unint64_t *)&qword_1EA2C2DD0, MEMORY[0x1E4F66468], MEMORY[0x1E4FBBE00]);
  sub_1C2148540();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C214FCD0;
  sub_1C2148520();
  uint64_t v27 = sub_1C2147F50();
  uint64_t v28 = *(void *)(v27 + qword_1EA2C38B0);
  if (v28)
  {
    swift_retain_n();
    uint64_t v29 = v28;
  }
  else
  {
    LOBYTE(v34) = 1;
    swift_retain_n();
    sub_1C2149EE0();
    sub_1C211C148((unint64_t *)&qword_1EA2C39A8, (void (*)(uint64_t))sub_1C1F60744);
    uint64_t v30 = v33;
    uint64_t v29 = sub_1C2149FC0();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v30);
  }
  swift_retain();
  swift_release();
  uint64_t v34 = v29;
  swift_allocObject();
  swift_weakInit();
  sub_1C209AF4C();
  sub_1C211C148((unint64_t *)&qword_1EA2C39B8, (void (*)(uint64_t))sub_1C209AF4C);
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  sub_1C1F535BC();
  swift_release();

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  return v27;
}

uint64_t sub_1C211B88C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  char v11 = a5 & 1;
  sub_1C1F60744();
  uint64_t v13 = v12;
  uint64_t v29 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C2149430();
  MEMORY[0x1F4188790](v16 - 8);
  v31[3] = sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C8C0);
  v31[4] = &protocol witness table for HKMedicationUserDomainConcept;
  v31[0] = a1;
  v17 = (void *)(a6 + qword_1EA2C3890);
  void *v17 = 0xD000000000000014;
  v17[1] = 0x80000001C215FE50;
  uint64_t v18 = qword_1EA2C3898;
  swift_retain();
  sub_1C2149420();
  id v19 = objc_allocWithZone((Class)sub_1C2149460());
  *(void *)(a6 + v18) = sub_1C2149450();
  uint64_t v20 = qword_1EA2C38A0;
  *(void *)(a6 + qword_1EA2C38A0) = 0;
  uint64_t v21 = qword_1EA2C38B0;
  *(void *)(a6 + qword_1EA2C38B0) = 0;
  *(void *)(a6 + qword_1EA2C38B8) = MEMORY[0x1E4FBC870];
  sub_1C1F236D8((uint64_t)v31, a6 + qword_1EA2C3880);
  uint64_t v22 = *(void **)(a6 + v20);
  *(void *)(a6 + v20) = a2;
  id v23 = a2;

  *(void *)(a6 + qword_1EA2C38A8) = a4;
  uint64_t v30 = 0;
  sub_1C1F604A8();
  swift_allocObject();
  swift_retain();
  *(void *)(a6 + qword_1EA2C3888) = sub_1C2149EB0();
  *(unsigned char *)(a6 + qword_1EA2C3878) = v11;
  *(void *)(a6 + v21) = a3;
  swift_retain();
  swift_release();
  swift_release();
  sub_1C211BE1C(0, (unint64_t *)&qword_1EA2C2DD0, MEMORY[0x1E4F66468], MEMORY[0x1E4FBBE00]);
  sub_1C2148540();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C214FCD0;
  sub_1C2148520();
  uint64_t v24 = sub_1C2147F50();
  uint64_t v25 = *(void *)(v24 + qword_1EA2C38B0);
  if (v25)
  {
    swift_retain_n();
    uint64_t v26 = v25;
  }
  else
  {
    LOBYTE(v30) = 1;
    swift_retain_n();
    sub_1C2149EE0();
    sub_1C211C148((unint64_t *)&qword_1EA2C39A8, (void (*)(uint64_t))sub_1C1F60744);
    uint64_t v26 = sub_1C2149FC0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v13);
  }
  swift_retain();
  swift_release();
  uint64_t v30 = v26;
  swift_allocObject();
  swift_weakInit();
  sub_1C209AF4C();
  sub_1C211C148((unint64_t *)&qword_1EA2C39B8, (void (*)(uint64_t))sub_1C209AF4C);
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  sub_1C1F535BC();
  swift_release();

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  return v24;
}

void sub_1C211BDA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_1C1F248B4(255, (unint64_t *)&qword_1EA2C2CE0);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_1C211BE1C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1C211BE80()
{
  unint64_t result = qword_1EA2C7680;
  if (!qword_1EA2C7680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C7680);
  }
  return result;
}

uint64_t sub_1C211BED4()
{
  return sub_1C2149550();
}

uint64_t sub_1C211BEE0()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C211BF18()
{
  if (!qword_1EA2C76B0)
  {
    sub_1C20C6D34();
    sub_1C211C148((unint64_t *)&qword_1EBF0C688, (void (*)(uint64_t))sub_1C20C6D34);
    unint64_t v0 = sub_1C2149D00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C76B0);
    }
  }
}

void sub_1C211BFB4()
{
  if (!qword_1EA2C76B8)
  {
    sub_1C211BF18();
    sub_1C211C148(&qword_1EA2C76C0, (void (*)(uint64_t))sub_1C211BF18);
    unint64_t v0 = sub_1C2149D50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C76B8);
    }
  }
}

void sub_1C211C048()
{
  if (!qword_1EA2C76C8)
  {
    sub_1C211BFB4();
    sub_1C1F12718(255, (unint64_t *)&qword_1EBF0CB10);
    sub_1C211C148(&qword_1EA2C76D0, (void (*)(uint64_t))sub_1C211BFB4);
    sub_1C1F43FD4();
    unint64_t v0 = sub_1C2149DF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C76C8);
    }
  }
}

uint64_t sub_1C211C114@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1C211A2E0(*a1, v2);
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C211C148(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C211C190()
{
  unint64_t result = qword_1EA2C76E0;
  if (!qword_1EA2C76E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C76E0);
  }
  return result;
}

uint64_t sub_1C211C1E4()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C211C224@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v3 = *a1;
  v5[2] = &v6;
  uint64_t result = sub_1C211A450((uint64_t (*)(id *))sub_1C211C28C, (uint64_t)v5, v3);
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C211C28C(uint64_t a1)
{
  return sub_1C211B26C(a1, *(uint64_t **)(v1 + 16)) & 1;
}

void sub_1C211C2AC(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v31 - v5;
  id v7 = objc_msgSend(v1, sel_headerView);
  id v8 = objc_msgSend(v7, sel_customIconContainerView);

  if (v8)
  {
    id v9 = objc_msgSend(objc_allocWithZone((Class)sub_1C2148EF0()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    sub_1C2148EE0();
    objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v10 = objc_msgSend(v2, sel_headerView);
    objc_msgSend(v10, sel_addSubview_, v9);

    sub_1C2138158(a1, (uint64_t)v6, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    sub_1C2148ED0();
    sub_1C2139DE8(0, (unint64_t *)&qword_1EBF0CA10, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1C21510C0;
    id v12 = objc_msgSend(v2, sel_headerView);
    id v13 = objc_msgSend(v12, sel_topAnchor);

    id v14 = objc_msgSend(v9, sel_topAnchor);
    uint64_t v15 = self;
    double v16 = 4.0;
    if ((objc_msgSend(v15, sel_hk_currentDeviceHas4InchScreen) & 1) == 0)
    {
      if (objc_msgSend(v15, sel_hk_currentDeviceHas4Point7InchScreen)) {
        double v16 = 4.0;
      }
      else {
        double v16 = 12.0;
      }
    }
    v17 = self;
    id v18 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, v16);

    *(void *)(v11 + 32) = v18;
    id v19 = objc_msgSend(v2, sel_headerView);
    id v20 = objc_msgSend(v19, sel_centerXAnchor);

    id v21 = objc_msgSend(v9, sel_centerXAnchor);
    id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

    *(void *)(v11 + 40) = v22;
    id v23 = objc_msgSend(v9, sel_heightAnchor);
    id v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, 104.0);

    *(void *)(v11 + 48) = v24;
    id v25 = objc_msgSend(v9, sel_widthAnchor);
    id v26 = objc_msgSend(v25, sel_constraintEqualToConstant_, 104.0);

    *(void *)(v11 + 56) = v26;
    v31[1] = v11;
    sub_1C214A7A0();
    sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C810);
    uint64_t v27 = (void *)sub_1C214A770();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_activateConstraints_, v27);

    uint64_t v28 = qword_1EA2C3FF8;
    uint64_t v29 = *(void **)&v2[qword_1EA2C3FF8];
    if (v29)
    {
      objc_msgSend(v29, sel_removeFromSuperview);
      uint64_t v30 = *(void **)&v2[v28];
    }
    else
    {
      uint64_t v30 = 0;
    }
    *(void *)&v2[v28] = v9;
  }
}

uint64_t sub_1C211C6E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C3458, (unint64_t *)&qword_1EA2C44C0, MEMORY[0x1E4FBB1A0]);
  sub_1C2138388();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211CB10()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  sub_1C21398AC(&qword_1EA2C7188, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211CF64()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  sub_1C21398AC(&qword_1EA2C7188, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211D3B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C3C20, (unint64_t *)&qword_1EA2C3C28, (uint64_t)&type metadata for StrengthStepResult);
  sub_1C1F73610();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211D7E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C3C20, (unint64_t *)&qword_1EA2C3C28, (uint64_t)&type metadata for StrengthStepResult);
  sub_1C1F73610();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211DC08()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, (unint64_t *)&qword_1EA2C3978, (unint64_t *)&qword_1EBF0C830, &qword_1EBF0C828, 0x1E4F66B28);
  sub_1C20EFAA0();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211E038()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v3 = (void (*)(uint64_t))MEMORY[0x1E4F66C08];
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C2CC0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  sub_1C21398AC(&qword_1EA2C4390, (unint64_t *)&qword_1EA2C2CC0, &qword_1EA2C2CA0, v3);
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  uint64_t v4 = *(void **)(v0 + v2);
  uint64_t v5 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v6 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v4)
                        + 80);
  id v7 = v4;
  v6();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v8 = *(void **)(v1 + v2);
  id v9 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v5 & *v8) + 88);
  id v10 = v8;
  v9();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211E48C()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v3 = (void (*)(uint64_t))MEMORY[0x1E4F66C80];
  sub_1C2134FB0(0, &qword_1EA2C46F0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  sub_1C21398AC((unint64_t *)&qword_1EA2C4700, &qword_1EA2C46F0, (unint64_t *)&qword_1EBF0B690, v3);
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  uint64_t v4 = *(void **)(v0 + v2);
  uint64_t v5 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v6 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v4)
                        + 80);
  id v7 = v4;
  v6();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v8 = *(void **)(v1 + v2);
  id v9 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v5 & *v8) + 88);
  id v10 = v8;
  v9();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211E8E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C6FB0, (unint64_t *)&qword_1EA2C6FB8, (uint64_t)&type metadata for MedicationNicknameNotes);
  sub_1C2139B24();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211ED08()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_1EA2C4000;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C5CB8, (unint64_t *)&qword_1EA2C3100, MEMORY[0x1E4FBB390]);
  sub_1C2139E40();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  unint64_t v3 = *(void **)(v0 + v2);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController
                        + (*MEMORY[0x1E4FBC8C8] & *v3)
                        + 80);
  uint64_t v6 = v3;
  v5();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C39B0, MEMORY[0x1E4F1AAE0]);
  sub_1C1F60808();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  id v7 = *(void **)(v1 + v2);
  id v8 = *(void (**)(void))(class metadata base offset for SpecificationStepViewController + (*v4 & *v7) + 88);
  id v9 = v7;
  v8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  swift_release();
  type metadata accessor for MedicationOnboardingFlowManager(0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  sub_1C21384E8();
  swift_retain();
  sub_1C214A0F0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1C211F130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a3 + 16);
  if (result)
  {
    id v10 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v8, type metadata accessor for MedicationOnboardingFlowManager);

    if (a2)
    {
      *((void *)&v12 + 1) = MEMORY[0x1E4FBB1A0];
      *(void *)&long long v11 = a1;
      *((void *)&v11 + 1) = a2;
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRetain();
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v11);
    sub_1C2121704((uint64_t)v8, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v11);
  }
  return result;
}

uint64_t sub_1C211F254(uint64_t a1, uint64_t a2)
{
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a2 + 16);
  if (result)
  {
    long long v11 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v9, type metadata accessor for MedicationOnboardingFlowManager);

    sub_1C2138158(a1, (uint64_t)v6, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    uint64_t v12 = type metadata accessor for FormStepResult();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v6, 1, v12) == 1)
    {
      sub_1C2121640((uint64_t)v6, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
      long long v14 = 0u;
      long long v15 = 0u;
    }
    else
    {
      *((void *)&v15 + 1) = v12;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
      sub_1C212BD30((uint64_t)v6, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    }
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v14);
    sub_1C2121704((uint64_t)v9, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v14);
  }
  return result;
}

uint64_t sub_1C211F474(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a5 + 16);
  if (result)
  {
    long long v14 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);

    if (a4 == 0xFF)
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    else
    {
      *((void *)&v17 + 1) = &type metadata for StrengthStepResult;
      uint64_t v15 = swift_allocObject();
      *(void *)&long long v16 = v15;
      *(void *)(v15 + 16) = a1;
      *(void *)(v15 + 24) = a2;
      *(void *)(v15 + 32) = a3;
      *(unsigned char *)(v15 + 40) = a4 & 1;
    }
    sub_1C1F73768(a1, a2, a3, a4);
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v16);
    sub_1C2121704((uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v16);
  }
  return result;
}

uint64_t sub_1C211F5E4(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a2 + 16);
  if (result)
  {
    uint64_t v8 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager);

    if (a1)
    {
      *((void *)&v11 + 1) = sub_1C1F12718(0, &qword_1EBF0C828);
      *(void *)&long long v10 = a1;
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    id v9 = a1;
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v10);
    sub_1C2121704((uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v10);
  }
  return result;
}

uint64_t sub_1C211F710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v4 - 8);
  v79 = (char *)v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v6 - 8);
  v77 = (char *)v60 - v7;
  uint64_t v89 = sub_1C2149390();
  uint64_t v87 = *(void *)(v89 - 8);
  MEMORY[0x1F4188790](v89);
  v88 = (char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1F3BE6C();
  uint64_t v85 = *(void *)(v9 - 8);
  uint64_t v86 = v9;
  MEMORY[0x1F4188790](v9);
  long long v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_1C2149540();
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  v74 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2134F48(0, (unint64_t *)&qword_1EA2C31E0, (unint64_t *)&qword_1EBF0C900, 0x1E4FB1618, MEMORY[0x1E4F29518]);
  uint64_t v84 = v13;
  v81 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v13 - 8);
  MEMORY[0x1F4188790](v13);
  v71 = (char *)v60 - v14;
  uint64_t v15 = (void (*)(uint64_t))MEMORY[0x1E4F66C08];
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  id v19 = (char *)v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  id v21 = (char *)v60 - v20;
  uint64_t v22 = sub_1C2148F60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v69 = (char *)v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = (char *)v60 - v26;
  uint64_t v73 = sub_1C21492D0();
  uint64_t v72 = *(void *)(v73 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](v73);
  v68 = (char *)v60 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v28);
  v70 = (char *)v60 - v30;
  uint64_t v78 = a2 + 16;
  uint64_t v31 = a1;
  sub_1C2138158(a1, (uint64_t)v21, &qword_1EA2C2CA0, v15);
  uint64_t v32 = *(unsigned int (**)(void, void, void))(v23 + 48);
  if (v32(v21, 1, v22) == 1)
  {
    sub_1C2121640((uint64_t)v21, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    uint64_t v33 = (uint64_t)v79;
    uint64_t v34 = v78;
  }
  else
  {
    v65 = v32;
    uint64_t v66 = v23 + 48;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v27, v21, v22);
    v64 = v27;
    uint64_t v35 = sub_1C2148F50();
    int64_t v36 = *(void *)(v35 + 16);
    uint64_t v67 = a1;
    if (v36)
    {
      uint64_t v61 = v23;
      uint64_t v62 = v22;
      v63 = v19;
      *(void *)&long long v90 = MEMORY[0x1E4FBC860];
      sub_1C1F70564(0, v36, 0);
      v83 = *(void (**)(char *, unint64_t, uint64_t))(v87 + 16);
      unint64_t v37 = (*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
      v60[1] = v35;
      unint64_t v38 = v35 + v37;
      uint64_t v39 = *(void *)(v87 + 72);
      v81 += 7;
      uint64_t v82 = v39;
      v87 += 16;
      v80 = (void (**)(char *, uint64_t))(v87 - 8);
      v40 = v83;
      do
      {
        v41 = v88;
        uint64_t v42 = v89;
        v40(v88, v38, v89);
        char v43 = sub_1C2149380();
        v44 = &v11[*(int *)(v86 + 48)];
        v40(v11, (unint64_t)v41, v42);
        if (v43)
        {
          sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C900);
          sub_1C214B190();
          sub_1C214A480();
          uint64_t v45 = 0;
        }
        else
        {
          uint64_t v45 = 1;
        }
        (*v81)(v44, v45, 1, v84);
        (*v80)(v88, v89);
        uint64_t v46 = v90;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C1F70564(0, *(void *)(v46 + 16) + 1, 1);
          uint64_t v46 = v90;
        }
        unint64_t v48 = *(void *)(v46 + 16);
        unint64_t v47 = *(void *)(v46 + 24);
        if (v48 >= v47 >> 1)
        {
          sub_1C1F70564(v47 > 1, v48 + 1, 1);
          uint64_t v46 = v90;
        }
        *(void *)(v46 + 16) = v48 + 1;
        sub_1C212BD30((uint64_t)v11, v46+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(void *)(v85 + 72) * v48, (uint64_t (*)(void))sub_1C1F3BE6C);
        v38 += v82;
        --v36;
      }
      while (v36);
      swift_bridgeObjectRelease();
      uint64_t v49 = (uint64_t)v77;
      id v19 = v63;
      uint64_t v22 = v62;
      uint64_t v23 = v61;
    }
    else
    {
      uint64_t v49 = (uint64_t)v77;
      swift_bridgeObjectRelease();
    }
    v50 = v64;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v69, v64, v22);
    sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C900);
    sub_1C214B180();
    sub_1C214A480();
    (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, *MEMORY[0x1E4F66CE0], v76);
    v51 = v68;
    sub_1C21492B0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v50, v22);
    uint64_t v52 = v72;
    v53 = v70;
    uint64_t v54 = v73;
    (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v70, v51, v73);
    uint64_t v34 = v78;
    swift_beginAccess();
    uint64_t v55 = MEMORY[0x1C8754850](v34);
    uint64_t v32 = v65;
    if (v55)
    {
      v56 = (void *)v55;
      (*(void (**)(uint64_t, char *, uint64_t))(v52 + 16))(v49, v53, v54);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v54);
      sub_1C211C2AC(v49);

      sub_1C2121640(v49, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
    uint64_t v33 = (uint64_t)v79;
    uint64_t v31 = v67;
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](v34);
  if (result)
  {
    v58 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, v33, type metadata accessor for MedicationOnboardingFlowManager);

    sub_1C2138158(v31, (uint64_t)v19, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v32(v19, 1, v22) == 1)
    {
      sub_1C2121640((uint64_t)v19, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
      long long v90 = 0u;
      long long v91 = 0u;
    }
    else
    {
      *((void *)&v91 + 1) = v22;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v90);
      (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_1, v19, v22);
    }
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v90);
    sub_1C2121704(v33, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v90);
  }
  return result;
}

uint64_t sub_1C212020C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v36 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void (*)(uint64_t))MEMORY[0x1E4F66C80];
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v32 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = sub_1C21492D0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  id v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  id v21 = (char *)&v32 - v20;
  uint64_t v22 = a2 + 16;
  uint64_t v35 = a1;
  sub_1C2138158(a1, (uint64_t)v14, (unint64_t *)&qword_1EBF0B690, v6);
  uint64_t v23 = *(unsigned int (**)(void, void, void))(v16 + 48);
  if (v23(v14, 1, v15) == 1)
  {
    sub_1C2121640((uint64_t)v14, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  }
  else
  {
    uint64_t v33 = v23;
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v24(v19, v14, v15);
    v24(v21, v19, v15);
    swift_beginAccess();
    uint64_t v25 = MEMORY[0x1C8754850](v22);
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, v21, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
      sub_1C211C2AC((uint64_t)v12);

      sub_1C2121640((uint64_t)v12, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    uint64_t v23 = v33;
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](v22);
  if (result)
  {
    uint64_t v28 = (void *)result;
    uint64_t v29 = v36;
    sub_1C212169C(result + qword_1EA2C3FD0, v36, type metadata accessor for MedicationOnboardingFlowManager);

    uint64_t v30 = v34;
    sub_1C2138158(v35, v34, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    if (v23(v30, 1, v15) == 1)
    {
      sub_1C2121640(v30, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
      long long v37 = 0u;
      long long v38 = 0u;
    }
    else
    {
      *((void *)&v38 + 1) = v15;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v37);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 32))(boxed_opaque_existential_1, v30, v15);
    }
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v37);
    sub_1C2121704(v29, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v37);
  }
  return result;
}

uint64_t sub_1C2120660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a5 + 16);
  if (result)
  {
    uint64_t v14 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);

    if (a2 == 1)
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    else
    {
      *((void *)&v17 + 1) = &type metadata for MedicationNicknameNotes;
      uint64_t v15 = (void *)swift_allocObject();
      *(void *)&long long v16 = v15;
      v15[2] = a1;
      v15[3] = a2;
      v15[4] = a3;
      v15[5] = a4;
    }
    sub_1C2139CCC(a1, a2);
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v16);
    sub_1C2121704((uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v16);
  }
  return result;
}

uint64_t sub_1C21207C4(char a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C8754850](a2 + 16);
  if (result)
  {
    uint64_t v8 = (void *)result;
    sub_1C212169C(result + qword_1EA2C3FD0, (uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager);

    if (a1 == 2)
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    else
    {
      *((void *)&v10 + 1) = MEMORY[0x1E4FBB390];
      LOBYTE(v9) = a1 & 1;
    }
    MedicationOnboardingFlowManager.consume(value:)((uint64_t)&v9);
    sub_1C2121704((uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager);
    return sub_1C1F4FC0C((uint64_t)&v9);
  }
  return result;
}

void MedicationOnboardingFlowManager.consume(value:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v76 = a1;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v69 - v4;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v69 - v7;
  sub_1C21388C8(0, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
  MEMORY[0x1F4188790](v9 - 8);
  v70 = (char *)&v69 - v10;
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v71 = (uint64_t)&v69 - v12;
  uint64_t v13 = sub_1C21491B0();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v72 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v69 - v19;
  uint64_t v21 = type metadata accessor for FormStepResult();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v75 = (uint64_t)&v69 - v26;
  uint64_t v27 = type metadata accessor for MedicationOnboardingFlowManager(0);
  unsigned int v28 = *(unsigned __int8 *)(v2 + *(int *)(v27 + 28));
  uint64_t v29 = v27;
  switch(v28 >> 5)
  {
    case 1u:
      sub_1C1F17FA4(v76, (uint64_t)&v81);
      if (!v84)
      {
        sub_1C1F4FC0C((uint64_t)&v81);
        goto LABEL_32;
      }
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_32:
        uint64_t v81 = 0;
        sub_1C2149E70();
        uint64_t v81 = 0;
        uint64_t v82 = 0;
        sub_1C2149E70();
        return;
      }
      uint64_t v36 = (uint64_t)v77;
      uint64_t v35 = v78;
      long long v37 = v79;
      if (v80)
      {
        if (v78)
        {
          sub_1C1F449D0((uint64_t)v77, v78, v79);
          sub_1C1F449D0(v36, v35, v37);

          uint64_t v38 = v36;
        }
        else
        {
          uint64_t v38 = 0;
        }
        uint64_t v81 = v38;
        uint64_t v82 = v35;
        sub_1C2149E70();
        swift_bridgeObjectRelease();
        if (v35)
        {
          sub_1C1F449D0(v36, v35, v37);
          swift_bridgeObjectRelease();
          id v59 = v37;
        }
        else
        {
          id v59 = 0;
        }
        uint64_t v81 = (uint64_t)v59;
        sub_1C2149E70();
        sub_1C1F44A28(v36, v35, v37, 1);
        uint64_t v60 = v36;
        uint64_t v61 = v35;
        uint64_t v62 = v37;
        char v63 = 1;
      }
      else
      {
        LOBYTE(v81) = 0;
        id v58 = v77;
        sub_1C2149E70();
        uint64_t v81 = v36;
        id v59 = v58;
        sub_1C2149E70();
        sub_1C1F44A28(v36, v35, v37, 0);
        uint64_t v60 = v36;
        uint64_t v61 = v35;
        uint64_t v62 = v37;
        char v63 = 0;
      }
      sub_1C1F44A28(v60, v61, v62, v63);

      return;
    case 2u:
      if (v28 != 64)
      {
        sub_1C1F17FA4(v76, (uint64_t)&v81);
        if (v84)
        {
          int v39 = swift_dynamicCast();
          uint64_t v40 = (uint64_t)v77;
          if (v39)
          {
            uint64_t v41 = v78;
          }
          else
          {
            uint64_t v40 = 0;
            uint64_t v41 = 0;
          }
        }
        else
        {
          sub_1C1F4FC0C((uint64_t)&v81);
          uint64_t v40 = 0;
          uint64_t v41 = 0;
        }
        uint64_t v81 = v40;
        uint64_t v82 = v41;
        sub_1C2149E70();
        swift_bridgeObjectRelease();
      }
      return;
    case 3u:
      if (v28 == 96)
      {
        sub_1C1F17FA4(v76, (uint64_t)&v81);
        if (v84)
        {
          sub_1C1F12718(0, &qword_1EBF0C828);
          if (swift_dynamicCast()) {
            id v42 = v77;
          }
          else {
            id v42 = 0;
          }
        }
        else
        {
          sub_1C1F4FC0C((uint64_t)&v81);
          id v42 = 0;
        }
        uint64_t v81 = (uint64_t)v42;
        sub_1C2149E70();
      }
      else
      {
        sub_1C1F17FA4(v76, (uint64_t)&v81);
        if (v84)
        {
          uint64_t v45 = sub_1C2148F60();
          int v46 = swift_dynamicCast();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v5, v46 ^ 1u, 1, v45);
        }
        else
        {
          sub_1C1F4FC0C((uint64_t)&v81);
          uint64_t v52 = sub_1C2148F60();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v5, 1, 1, v52);
        }
        sub_1C2149E70();
        sub_1C2121640((uint64_t)v5, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
      }
      return;
    case 4u:
      if (v28 == 128)
      {
        sub_1C1F17FA4(v76, (uint64_t)&v81);
        if (v84)
        {
          uint64_t v43 = sub_1C21492D0();
          int v44 = swift_dynamicCast();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v8, v44 ^ 1u, 1, v43);
        }
        else
        {
          sub_1C1F4FC0C((uint64_t)&v81);
          uint64_t v51 = sub_1C21492D0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v8, 1, 1, v51);
        }
        sub_1C2149E70();
        sub_1C2121640((uint64_t)v8, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
        return;
      }
      sub_1C1F17FA4(v76, (uint64_t)&v81);
      if (v84)
      {
        if (swift_dynamicCast())
        {
          uint64_t v47 = (uint64_t)v77;
          uint64_t v48 = v78;
          uint64_t v49 = v79;
          uint64_t v50 = v80;
LABEL_43:
          uint64_t v81 = v47;
          uint64_t v82 = v48;
          v83 = v49;
          uint64_t v84 = v50;
          sub_1C2149E70();
          sub_1C204FA70(v47, v48);
          return;
        }
      }
      else
      {
        sub_1C1F4FC0C((uint64_t)&v81);
      }
      uint64_t v47 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v48 = 1;
      goto LABEL_43;
    case 5u:
      return;
    default:
      sub_1C1F17FA4(v76, (uint64_t)&v81);
      if (v84)
      {
        int v30 = swift_dynamicCast();
        uint64_t v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56);
        v31(v20, v30 ^ 1u, 1, v21);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) != 1)
        {
          uint64_t v32 = v75;
          sub_1C212BD30((uint64_t)v20, v75, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          uint64_t v76 = *(int *)(v29 + 48);
          sub_1C212169C(v32, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          v31(v18, 0, 1, v21);
          sub_1C2149E70();
          sub_1C2121640((uint64_t)v18, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
          uint64_t v33 = *(int *)(v29 + 40);
          uint64_t v81 = 0;
          sub_1C2149E70();
          sub_1C212169C(v32, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v81 = 0;
            sub_1C2149E70();
            uint64_t v34 = v32;
LABEL_63:
            sub_1C2121704(v34, (uint64_t (*)(void))type metadata accessor for FormStepResult);
            return;
          }
          uint64_t v69 = v33;
          v53 = v72;
          uint64_t v54 = v73;
          uint64_t v55 = v74;
          (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v25, v74);
          uint64_t v76 = *(void *)(v54 + 16);
          ((void (*)(char *, char *, uint64_t))v76)(v18, v53, v55);
          swift_storeEnumTagMultiPayload();
          v31(v18, 0, 1, v21);
          sub_1C2149E70();
          sub_1C2121640((uint64_t)v18, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
          uint64_t v56 = v71;
          sub_1C212BB30(v71);
          uint64_t v57 = type metadata accessor for MedicationSearchItem(0);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 48))(v56, 1, v57) == 1)
          {
            sub_1C2121640(v56, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
LABEL_62:
            (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
            uint64_t v34 = v75;
            goto LABEL_63;
          }
          uint64_t v64 = (uint64_t)v70;
          ((void (*)(char *, char *, uint64_t))v76)(v70, v53, v55);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v64, 0, 1, v55);
          unint64_t v65 = sub_1C202B65C();
          sub_1C2121640(v64, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
          sub_1C2121704(v56, type metadata accessor for MedicationSearchItem);
          if (!v65) {
            goto LABEL_62;
          }
          if (v65 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v68 = sub_1C214B930();
            swift_bridgeObjectRelease();
            if (v68 == 1) {
              goto LABEL_50;
            }
          }
          else if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
          {
LABEL_50:
            if ((v65 & 0xC000000000000001) != 0)
            {
              id v66 = (id)MEMORY[0x1C8753960](0, v65);
            }
            else
            {
              if (!*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
                JUMPOUT(0x1C2121608);
              }
              id v66 = *(id *)(v65 + 32);
            }
            uint64_t v67 = v66;
            swift_bridgeObjectRelease();
            uint64_t v81 = (uint64_t)v67;
            sub_1C2149E70();

            goto LABEL_62;
          }
          swift_bridgeObjectRelease();
          goto LABEL_62;
        }
      }
      else
      {
        sub_1C1F4FC0C((uint64_t)&v81);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
      }
      sub_1C2121640((uint64_t)v20, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
      return;
  }
}

uint64_t type metadata accessor for MedicationOnboardingFlowManager(uint64_t a1)
{
  return sub_1C1F20D10(a1, (uint64_t *)&unk_1EA2C7700);
}

uint64_t sub_1C2121640(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C21388C8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C212169C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2121704(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1C2121764(char a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    uint64_t v9 = a2 + 16;
    swift_beginAccess();
    uint64_t v10 = MEMORY[0x1C8754850](v9);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      sub_1C212169C(v10 + qword_1EA2C3FD0, (uint64_t)v8, type metadata accessor for MedicationOnboardingFlowManager);

      swift_retain();
      sub_1C2121704((uint64_t)v8, type metadata accessor for MedicationOnboardingFlowManager);
      v14[0] = 1;
      sub_1C2149E70();
      swift_release();
    }
    swift_beginAccess();
    uint64_t v12 = MEMORY[0x1C8754850](v9);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      a3();
    }
  }
}

void sub_1C21218BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v6 = a2 + 16;
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x1C8754850](v6);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      type metadata accessor for MedicationOnboardingFlowManager(0);
      id v9 = a1;
      uint64_t v10 = sub_1C2148DC0();
      uint64_t v11 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      id v12 = _sSo17UIAlertControllerC19HealthMedicationsUIE27makeAlertForExsitingConcept7concept11listManager11showHandlerABSgSo9HKConceptC_0C22RecordsConceptsSupport04ListjM0CySo022HKMedicationUserDomainJ0CctFZ_0((uint64_t)v9, v10, a4, v11);
      swift_release();
      swift_release_n();
      if (v12)
      {
        objc_msgSend(v8, sel_presentViewController_animated_completion_, v12, 1, 0);

        uint64_t v8 = v9;
        id v9 = v12;
      }
    }
  }
}

uint64_t sub_1C21219E0(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v29 = (void (*)(uint64_t))MEMORY[0x1E4F28088];
  uint64_t v30 = a1;
  sub_1C21388C8(0, &qword_1EBF0C930, MEMORY[0x1E4F28088]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v24 - v3;
  unsigned int v28 = (void (*)(uint64_t))MEMORY[0x1E4F280A0];
  sub_1C21388C8(0, &qword_1EA2C7748, MEMORY[0x1E4F280A0]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v8 = sub_1C214B4B0();
  uint64_t v25 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C214AE20();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2138228();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v26 = v16;
  uint64_t v27 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = objc_msgSend(self, sel_defaultCenter);
  sub_1C214AE30();

  sub_1C214B4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  id v32 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v21 = sub_1C214B490();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  sub_1C1F12718(0, &qword_1EBF0C940);
  sub_1C2139AC8((unint64_t *)&qword_1EA2C6798, MEMORY[0x1E4F27FC8]);
  sub_1C21382F4();
  sub_1C214A050();
  sub_1C2121640((uint64_t)v4, &qword_1EBF0C930, v29);

  sub_1C2121640((uint64_t)v7, &qword_1EA2C7748, v28);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v25);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1C2139AC8(&qword_1EA2C7758, (void (*)(uint64_t))sub_1C2138228);
  uint64_t v22 = v26;
  sub_1C214A0F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v22);
  swift_beginAccess();
  sub_1C2149E20();
  swift_endAccess();
  return swift_release();
}

void sub_1C2121EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1C8754850](v2);
  if (!v3) {
    return;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = sub_1C21475D0();
  if (!v5)
  {
    long long v51 = 0u;
    long long v52 = 0u;
LABEL_14:

    sub_1C1F4FC0C((uint64_t)&v51);
    return;
  }
  uint64_t v6 = v5;
  sub_1C214A5F0();
  sub_1C214B760();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1C1F4B54C((uint64_t)v50), (v8 & 1) != 0))
  {
    sub_1C1F72C14(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v51);
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1C1F4CC04((uint64_t)v50);
  if (!*((void *)&v52 + 1)) {
    goto LABEL_14;
  }
  sub_1C1F12718(0, &qword_1EA2C7760);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  id v9 = v50[0];
  objc_msgSend(v50[0], sel_CGRectValue);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  id v18 = objc_msgSend(v4, sel_contentView);
  uint64_t v19 = sub_1C1F8EA0C();

  if (v19)
  {
    sub_1C21475C0();
    if (v50[3])
    {
      sub_1C1F12718(0, &qword_1EA2C7768);
      if (swift_dynamicCast())
      {
        id v20 = (void *)v51;
        objc_msgSend(v19, sel_bounds);
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        id v29 = objc_msgSend(v4, sel_scrollView);
        objc_msgSend(v19, sel_convertRect_toCoordinateSpace_, v29, v22, v24, v26, v28);
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;

        id v38 = objc_msgSend(v20, sel_coordinateSpace);
        id v39 = objc_msgSend(v4, sel_scrollView);
        objc_msgSend(v38, sel_convertRect_toCoordinateSpace_, v39, v11, v13, v15, v17);
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        swift_unknownObjectRelease();

        v53.origin.x = v41;
        v53.origin.y = v43;
        v53.size.width = v45;
        v53.size.height = v47;
        v57.origin.x = v31;
        v57.origin.y = v33;
        v57.size.width = v35;
        v57.size.height = v37;
        CGRect v54 = CGRectIntersection(v53, v57);
        CGFloat v48 = CGRectGetHeight(v54) * 0.5;
        id v49 = objc_msgSend(v4, sel_scrollView);
        v55.origin.x = v31;
        v55.origin.y = v33;
        v55.size.width = v35;
        v55.size.height = v37;
        CGRect v56 = CGRectOffset(v55, 0.0, v48);
        objc_msgSend(v49, sel_scrollRectToVisible_animated_, 1, v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
      }
      else
      {
      }
    }
    else
    {

      sub_1C1F4FC0C((uint64_t)v50);
    }
  }
  else
  {
LABEL_15:
  }
}

uint64_t sub_1C2122274()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73848)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C21225CC()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73928)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2122924()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D738D8)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2122C7C()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D739C8)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2122FD4()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73978)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C212332C()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73A18)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2123684()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73A68)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C21239DC()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73AB8)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2123D34()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73B08)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C212408C()
{
  uint64_t v1 = v0;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v7 = (char *)&v20 - v6;
  sub_1C2124414();
  sub_1C21252AC();
  char v8 = &v0[qword_1EA2C3FD0];
  unsigned int v9 = v8[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  unsigned int v10 = v9 >> 5;
  if (v9 != 96 && v10 == 3)
  {
    sub_1C2149E90();
    uint64_t v12 = sub_1C2148F60();
    int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    if (v13 == 1)
    {
      uint64_t v14 = sub_1C21492D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
      sub_1C211C2AC((uint64_t)v4);
      sub_1C2121640((uint64_t)v4, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    }
  }
  if (MedicationOnboardingFlowManager.isAtFinalStep.getter())
  {
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    id v15 = (id)qword_1EBF0CA18;
    swift_bridgeObjectRetain();
    sub_1C2147730();
    swift_bridgeObjectRelease();

    sub_1C2148A90();
    swift_bridgeObjectRelease();
  }
  if (sub_1C20BFC68(v9, (uint64_t)&unk_1F1D73B90)) {
    objc_msgSend(v1, sel_setShouldAdjustScrollViewInsetForKeyboard_, 1);
  }
  if (v9 != 64 && v10 == 2) {
    objc_msgSend(v1, sel_setShouldAdjustButtonTrayForKeyboard_, 1);
  }
  uint64_t v17 = *(void *)&v1[qword_1EA2C3FC8];
  uint64_t v18 = *(void *)&v1[qword_1EA2C3FC8 + 8];
  swift_bridgeObjectRetain();
  sub_1C212A354(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t MedicationOnboardingFlowManager.listManager.getter()
{
  return sub_1C2148DC0();
}

void sub_1C2124414()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.title.getter();
  if (v3)
  {
    int v4 = v2[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
    if (v4 == 128 || (v4 & 0xE0) != 0x80)
    {
      id v7 = objc_msgSend(v1, sel_navigationItem);
      sub_1C2148730();
      MedicationOnboardingFlowManager.subtitle.getter();
      id v10 = objc_msgSend(self, sel_labelColor);
      unsigned int v9 = (void *)sub_1C2148720();
      objc_msgSend(v7, sel_setTitleView_, v9, v13);
    }
    else
    {
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen_, 0);
      id v5 = objc_msgSend(v1, sel_headerView);
      LODWORD(v6) = 1036831949;
      objc_msgSend(v5, sel_setTitleHyphenationFactor_, v6);

      id v7 = objc_msgSend(v1, sel_navigationItem);
      if (qword_1EBF0CA00 != -1) {
        swift_once();
      }
      id v8 = (id)qword_1EBF0CA18;
      swift_bridgeObjectRetain();
      sub_1C2147730();
      swift_bridgeObjectRelease();

      unsigned int v9 = (void *)sub_1C214A5B0();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_setTitle_, v9, 0xE000000000000000);
    }
  }
  id v11 = objc_msgSend(v1, sel_navigationItem);
  if (qword_1EBF0CA00 != -1) {
    swift_once();
  }
  id v12 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  id v14 = (id)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setBackButtonTitle_, v14, 0xE000000000000000);
}

uint64_t MedicationOnboardingFlowManager.title.getter()
{
  uint64_t v38 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v1 = MEMORY[0x1F4188790](v38);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v1);
  id v5 = (char *)&v36 - v4;
  uint64_t v6 = sub_1C21490F0();
  uint64_t v37 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MedicationSearchItem.Source(0);
  MEMORY[0x1F4188790](v9);
  id v11 = (void **)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v12);
  id v14 = (id *)((char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for MedicationSearchItem(0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C212169C(v0, (uint64_t)v14, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      sub_1C2121704((uint64_t)v14, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      goto LABEL_6;
    case 2u:

      sub_1C20B6C78();
      uint64_t v23 = v0;
      double v24 = (char *)v14 + *(int *)(v22 + 48);
      uint64_t v25 = sub_1C2147B20();
      double v26 = v24;
      uint64_t v0 = v23;
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v26, v25);
LABEL_6:
      sub_1C212169C(v0, (uint64_t)v5, type metadata accessor for MedicationOnboardingFlowManager);
      goto LABEL_7;
    default:
      uint64_t v36 = v0;
      sub_1C212BD30((uint64_t)v14, (uint64_t)v17, type metadata accessor for MedicationSearchItem);
      sub_1C212169C((uint64_t)v17, (uint64_t)v11, type metadata accessor for MedicationSearchItem.Source);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v18 = v37;
        (*(void (**)(char *, void **, uint64_t))(v37 + 32))(v8, v11, v6);
        uint64_t v19 = sub_1C21490B0();
        uint64_t v21 = v20;
        (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
      }
      else
      {
        CGFloat v31 = *v11;
        sub_1C1F30C40();
        CGFloat v33 = (char *)v11 + *(int *)(v32 + 48);
        uint64_t v19 = sub_1C214B420();
        uint64_t v21 = v34;

        uint64_t v35 = sub_1C21491B0();
        (*(void (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8))(v33, v35);
      }
      sub_1C2121704((uint64_t)v17, type metadata accessor for MedicationSearchItem);
      sub_1C212169C(v36, (uint64_t)v5, type metadata accessor for MedicationOnboardingFlowManager);
      if (!v21)
      {
LABEL_7:
        swift_retain();
        sub_1C2149E90();
        swift_release();
        uint64_t v19 = v40;
        uint64_t v27 = v41;
        sub_1C212169C((uint64_t)v5, (uint64_t)v3, type metadata accessor for MedicationOnboardingFlowManager);
        if (!v27)
        {
          sub_1C2149E90();
          id v28 = v39;
          if (!v39)
          {
            sub_1C2121704((uint64_t)v5, type metadata accessor for MedicationOnboardingFlowManager);

            uint64_t v19 = 0;
            goto LABEL_11;
          }
          uint64_t v19 = sub_1C214B420();
        }
        sub_1C2121704((uint64_t)v5, type metadata accessor for MedicationOnboardingFlowManager);
LABEL_11:
        uint64_t v29 = (uint64_t)v3;
        goto LABEL_12;
      }
      uint64_t v29 = (uint64_t)v5;
LABEL_12:
      sub_1C2121704(v29, type metadata accessor for MedicationOnboardingFlowManager);
      return v19;
  }
}

uint64_t MedicationOnboardingFlowManager.subtitle.getter()
{
  uint64_t v0 = sub_1C21491B0();
  uint64_t v46 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for FormStepResult();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v46 - v8;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v46 - v11;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3))
  {
    sub_1C2121640((uint64_t)v12, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = v46;
    sub_1C212169C((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    sub_1C2121640((uint64_t)v12, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    sub_1C212169C((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1C214B030();
      uint64_t v14 = v16;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v2, v7, v0);
      uint64_t v13 = sub_1C2149180();
      uint64_t v14 = v17;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v2, v0);
    }
    sub_1C2121704((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FormStepResult);
  }
  uint64_t v18 = sub_1C212BD98();
  if ((v19 & 1) == 0)
  {
    double v20 = *(double *)&v18;
    sub_1C2149E90();
    uint64_t v21 = v47;
    if (v47)
    {
      id v22 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v47, v20);

      if (v22)
      {
        id v23 = objc_msgSend(self, sel_medicationDoseEventTypeForIdentifier_, *MEMORY[0x1E4F2A040]);
        if (v23)
        {
          double v24 = v23;
          sub_1C1F12718(0, &qword_1EA2C76E8);
          id v25 = objc_msgSend(v22, sel__unit);
          double v26 = (void *)sub_1C214B010();

          id v27 = objc_msgSend(v22, sel_localizedStringForType_parameters_, v24, v26);
          uint64_t v28 = sub_1C214A5F0();
          uint64_t v30 = v29;

          goto LABEL_14;
        }
      }
    }
  }
  uint64_t v28 = 0;
  uint64_t v30 = 0;
LABEL_14:
  sub_1C1FA2240();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C214FCC0;
  *(void *)(inited + 32) = v13;
  *(void *)(inited + 40) = v14;
  sub_1C2149E90();
  uint64_t v32 = v47;
  if (v47)
  {
    uint64_t v28 = sub_1C214B470();
    uint64_t v34 = v33;

    swift_bridgeObjectRelease();
    uint64_t v30 = v34;
  }
  *(void *)(inited + 48) = v28;
  *(void *)(inited + 56) = v30;
  uint64_t v35 = *(void *)(inited + 40);
  if (!v35)
  {
    uint64_t v37 = (void *)MEMORY[0x1E4FBC860];
    if (!v30) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  uint64_t v36 = *(void *)(inited + 32);
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_1C1F3AAE0(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v39 = v37[2];
  unint64_t v38 = v37[3];
  if (v39 >= v38 >> 1) {
    uint64_t v37 = sub_1C1F3AAE0((void *)(v38 > 1), v39 + 1, 1, v37);
  }
  v37[2] = v39 + 1;
  uint64_t v40 = &v37[2 * v39];
  v40[4] = v36;
  v40[5] = v35;
  uint64_t v28 = *(void *)(inited + 48);
  uint64_t v30 = *(void *)(inited + 56);
  if (v30)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v37 = sub_1C1F3AAE0(0, v37[2] + 1, 1, v37);
    }
    unint64_t v42 = v37[2];
    unint64_t v41 = v37[3];
    if (v42 >= v41 >> 1) {
      uint64_t v37 = sub_1C1F3AAE0((void *)(v41 > 1), v42 + 1, 1, v37);
    }
    v37[2] = v42 + 1;
    CGFloat v43 = &v37[2 * v42];
    v43[4] = v28;
    v43[5] = v30;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  CGFloat v47 = v37;
  sub_1C2139DE8(0, (unint64_t *)&qword_1EA2C3A40, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
  sub_1C1F64558();
  uint64_t v44 = sub_1C214A580();
  swift_bridgeObjectRelease();
  return v44;
}

void sub_1C21252AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[qword_1EA2C3FD0];
  unsigned int v3 = v2[*(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 28)];
  switch(v3 >> 5)
  {
    case 1u:
      if (v3) {
        goto LABEL_7;
      }
      break;
    case 3u:
      if (v3 != 96) {
        goto LABEL_7;
      }
      break;
    case 4u:
      if (v3 != 128)
      {
LABEL_7:
        if (!MedicationOnboardingFlowManager.isAtFinalStep.getter())
        {
          id v4 = objc_msgSend(self, sel_linkButton);
          objc_msgSend(v4, sel_addTarget_action_forControlEvents_, v1, sel_skipButtonTapped_, 64);
          if (qword_1EBF0CA00 != -1) {
            swift_once();
          }
          id v5 = (id)qword_1EBF0CA18;
          swift_bridgeObjectRetain();
          sub_1C2147730();
          swift_bridgeObjectRelease();

          uint64_t v6 = (void *)sub_1C214A5B0();
          swift_bridgeObjectRelease();
          objc_msgSend(v4, sel_setTitle_forState_, v6, 0, 0xE000000000000000);

          swift_bridgeObjectRetain();
          sub_1C214A6C0();
          id v7 = v4;
          uint64_t v8 = (void *)sub_1C214A5B0();
          swift_bridgeObjectRelease();
          objc_msgSend(v7, sel_setAccessibilityIdentifier_, v8);

          id v9 = objc_msgSend(v1, sel_buttonTray);
          objc_msgSend(v9, sel_addButton_, v7);
        }
      }
      break;
    default:
      return;
  }
}

BOOL MedicationOnboardingFlowManager.isAtFinalStep.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4F66C08];
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v17 - v4;
  char v6 = sub_1C212B8AC();
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  uint64_t v8 = sub_1C2148F60();
  char v9 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8) == 1;
  sub_1C2121640((uint64_t)v5, &qword_1EA2C2CA0, v2);
  uint64_t v10 = _s19HealthMedicationsUI17SpecificationStepO10finalSteps16shouldDisplayDDI17skipVisualizationSayACGSb_SbtFZ_0(v6 & 1, v9);
  uint64_t v11 = sub_1C212A9D8(*(unsigned __int8 *)(v1 + *(int *)(v7 + 28)), (uint64_t)v10);
  char v13 = v12;
  uint64_t v14 = *((void *)v10 + 2);
  swift_bridgeObjectRelease();
  return (v13 & 1) == 0 && v11 == v14 - 1;
}

uint64_t MedicationOnboardingFlowManager.currentShape.getter()
{
  return sub_1C2149E90();
}

id MedicationOnboardingFlowManager.currentScheduleType.getter()
{
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if (!v2) {
    return 0;
  }
  id v0 = objc_msgSend(v2, sel_scheduleType);

  return v0;
}

void sub_1C2125754()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_30;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7780, (uint64_t)v15);
  swift_release();
}

void sub_1C2125A88()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_55;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C77A8, (uint64_t)v15);
  swift_release();
}

void sub_1C2125DBC()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_80;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C77D0, (uint64_t)v15);
  swift_release();
}

void sub_1C21260F0()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_133;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7820, (uint64_t)v15);
  swift_release();
}

void sub_1C2126424()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_105;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C77F8, (uint64_t)v15);
  swift_release();
}

void sub_1C2126758()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_159;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7840, (uint64_t)v15);
  swift_release();
}

void sub_1C2126A8C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_184;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7858, (uint64_t)v15);
  swift_release();
}

void sub_1C2126DC0()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_209;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7870, (uint64_t)v15);
  swift_release();
}

void sub_1C21270F4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C1F909C0;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_234;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C7898, (uint64_t)v15);
  swift_release();
}

void sub_1C2127428()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C32D8, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)aBlock - v4;
  char v6 = &v0[qword_1EA2C3FD0];
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()((UIViewController_optional *)qword_1EA2C3FD0);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2149E90();
    id v10 = aBlock[0];
    if (aBlock[0])
    {
      unsigned int v11 = v6[*(int *)(v9 + 28)];
      if (v11 >> 5 == 3 && v11 == 96)
      {
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v1;
        *(void *)(v17 + 24) = v8;
        id v18 = objc_allocWithZone(MEMORY[0x1E4F66B68]);
        id v19 = v1;
        id v20 = v8;
        id v8 = objc_msgSend(v18, sel_init);
        uint64_t v21 = (void *)swift_allocObject();
        v21[2] = sub_1C213A414;
        v21[3] = v17;
        v21[4] = 0;
        v21[5] = 0;
        v21[6] = v19;
        v21[7] = ObjectType;
        aBlock[4] = sub_1C1F20998;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x1E4F143A8];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1C1F45FF0;
        aBlock[3] = &block_descriptor_262;
        id v22 = _Block_copy(aBlock);
        id v23 = v19;
        swift_retain();
        swift_release();
        objc_msgSend(v8, sel_checkIncompatibilityForSchedule_completion_, v10, v22);
        _Block_release(v22);

        swift_release();
        goto LABEL_6;
      }
    }
    objc_msgSend(v1, sel_showViewController_sender_, v8, v1);
LABEL_6:

    return;
  }
  sub_1C214A8A0();
  uint64_t v12 = sub_1C214A8C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_1C214A890();
  char v13 = v0;
  uint64_t v14 = sub_1C214A880();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  v15[5] = ObjectType;
  sub_1C1F86288((uint64_t)v5, (uint64_t)&unk_1EA2C78B8, (uint64_t)v15);
  swift_release();
}

void __swiftcall MedicationOnboardingFlowManager.makeNextViewControllerForStep()(UIViewController_optional *__return_ptr retstr)
{
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = &v13[-v3];
  uint64_t v5 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  id v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned __int8 v15 = *(unsigned char *)(v1 + *(int *)(v6 + 28));
  sub_1C212CCE4(&v15, (char *)&v16);
  unsigned int v9 = v16;
  if (v16 <= 0xFDu)
  {
    unsigned __int8 v14 = v16;
    sub_1C212D6EC(&v14, (uint64_t)v8);
    switch(v9 >> 5)
    {
      case 1u:
        sub_1C212E428((uint64_t)v8);
        break;
      case 2u:
        if (v9 != 64) {
          sub_1C212DC8C((uint64_t)v8);
        }
        break;
      case 3u:
        if (v9 == 96)
        {
          sub_1C212ED64((uint64_t)v8);
        }
        else
        {
          sub_1C212BB30((uint64_t)v4);
          uint64_t v10 = sub_1C2148DC0();
          id v11 = objc_allocWithZone((Class)type metadata accessor for ShapeStepViewController());
          uint64_t v12 = (void *)sub_1C1F23964((uint64_t)v4, v10);
          sub_1C2132E74(97, (uint64_t)v8, v12);
        }
        break;
      case 4u:
        if (v9 == 128) {
          sub_1C212EF34((uint64_t)v8);
        }
        else {
          sub_1C212F244((uint64_t)v8);
        }
        break;
      case 5u:
        sub_1C212F5B8((uint64_t)v8);
        break;
      default:
        sub_1C212DE88((uint64_t)v8);
        break;
    }
    sub_1C2121704((uint64_t)v8, type metadata accessor for MedicationOnboardingFlowManager);
  }
}

uint64_t sub_1C21279BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_1C21497F0();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  sub_1C214A890();
  v5[11] = sub_1C214A880();
  uint64_t v8 = sub_1C214A840();
  v5[12] = v8;
  v5[13] = v7;
  return MEMORY[0x1F4188298](sub_1C2127AB0, v8, v7);
}

uint64_t sub_1C2127AB0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 48), sel_buttonTray);
  objc_msgSend(v1, sel_showButtonsBusy);

  *(void *)(v0 + 112) = sub_1C2148E10();
  sub_1C2148E00();
  sub_1C2148DC0();
  swift_release();
  *(void *)(v0 + 120) = sub_1C2149710();
  swift_release();
  *(void *)(v0 + 128) = qword_1EA2C3FD0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1C2127BC0;
  return sub_1C21284A0();
}

uint64_t sub_1C2127BC0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_1C213A3E8;
  }
  else {
    uint64_t v5 = sub_1C213A410;
  }
  return MEMORY[0x1F4188298](v5, v4, v3);
}

uint64_t sub_1C2127CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_1C21497F0();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  sub_1C214A890();
  v5[11] = sub_1C214A880();
  uint64_t v8 = sub_1C214A840();
  v5[12] = v8;
  v5[13] = v7;
  return MEMORY[0x1F4188298](sub_1C2127DF0, v8, v7);
}

uint64_t sub_1C2127DF0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 48), sel_buttonTray);
  objc_msgSend(v1, sel_showButtonsBusy);

  *(void *)(v0 + 112) = sub_1C2148E10();
  sub_1C2148E00();
  sub_1C2148DC0();
  swift_release();
  *(void *)(v0 + 120) = sub_1C2149710();
  swift_release();
  *(void *)(v0 + 128) = qword_1EA2C3FD0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1C2127F00;
  return sub_1C21284A0();
}

uint64_t sub_1C2127F00()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_1C21281B4;
  }
  else {
    uint64_t v5 = sub_1C212803C;
  }
  return MEMORY[0x1F4188298](v5, v4, v3);
}

uint64_t sub_1C212803C()
{
  swift_release();
  sub_1C212A64C();
  sub_1C2148E00();
  sub_1C2148DB0();
  swift_release();
  sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C7C8);
  sub_1C214AC00();
  sub_1C2148D70();
  swift_allocObject();
  sub_1C2148C90();
  if ((sub_1C2148CE0() & 1) == 0)
  {
    type metadata accessor for MedicationOnboardingFlowManager(0);
    sub_1C2148CF0();
  }
  unint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[6];
  swift_release();
  sub_1C213A028(v1);
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
  id v3 = objc_msgSend(v2, sel_buttonTray);
  objc_msgSend(v3, sel_showButtonsAvailable);

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1C21281B4()
{
  double v24 = v0;
  unint64_t v1 = (void *)v0[18];
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C21497A0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1C21497E0();
  os_log_type_t v5 = sub_1C214ABD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[18];
    uint64_t v20 = v0[9];
    uint64_t v21 = v0[8];
    uint64_t v22 = v0[10];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v23 = v8;
    *(_DWORD *)uint64_t v7 = 136446722;
    uint64_t v9 = sub_1C214BC10();
    v0[2] = sub_1C1F6FD54(v9, v10, &v23);
    sub_1C214B530();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2082;
    v0[3] = sub_1C1F6FD54(0xD000000000000023, 0x80000001C21617A0, &v23);
    sub_1C214B530();
    *(_WORD *)(v7 + 22) = 2080;
    v0[4] = v6;
    id v11 = v6;
    sub_1C1F248B4(0, (unint64_t *)&qword_1EBF0C9C0);
    uint64_t v12 = sub_1C214A610();
    v0[5] = sub_1C1F6FD54(v12, v13, &v23);
    sub_1C214B530();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C1F0B000, v4, v5, "[%{public}s.%{public}s]: Failed to save medication with %s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v8, -1, -1);
    MEMORY[0x1C8754730](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  }
  else
  {
    unsigned __int8 v14 = (void *)v0[18];
    uint64_t v16 = v0[9];
    uint64_t v15 = v0[10];
    uint64_t v17 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_1C21284A0()
{
  v1[35] = v0;
  uint64_t v2 = sub_1C21497F0();
  v1[36] = v2;
  v1[37] = *(void *)(v2 - 8);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2128588, 0, 0);
}

uint64_t sub_1C2128588()
{
  type metadata accessor for MedicationOnboardingFlowManager(0);
  unint64_t v1 = (void *)sub_1C2148DA0();
  v0[42] = v1;
  v0[43] = sub_1C2148DC0();
  id v2 = MedicationOnboardingFlowManager.currentMedicationUDC.getter();
  v0[44] = v2;
  id v3 = MedicationOnboardingFlowManager.currentMedicationUDC.getter();
  sub_1C213051C((uint64_t)v3);

  id v4 = objc_msgSend(v2, sel_firstConceptIdentifier);
  v0[45] = v4;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v2, sel_propertyCollection);
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = objc_msgSend(v6, sel_properties);

      sub_1C1F12718(0, (unint64_t *)&qword_1EA2C2D08);
      sub_1C214A780();

      uint64_t v7 = (void *)sub_1C214A770();
      swift_bridgeObjectRelease();
    }
    v0[46] = v7;
    id v9 = objc_msgSend(self, sel_medicationUserDomainConceptTypeIdentifier);
    v0[47] = v9;
    v0[10] = v0;
    v0[15] = v0 + 28;
    v0[11] = sub_1C2128864;
    uint64_t v10 = swift_continuation_init();
    v0[23] = MEMORY[0x1E4F143A8];
    v0[24] = 0x40000000;
    v0[25] = sub_1C2130D50;
    v0[26] = &block_descriptor_5;
    v0[27] = v10;
    objc_msgSend(v1, sel_insertNewUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion_, v5, v7, v9, v0 + 23);
    id v11 = v0 + 10;
  }
  else
  {
    v0[2] = v0;
    v0[3] = sub_1C2128FE8;
    uint64_t v12 = swift_continuation_init();
    v0[18] = MEMORY[0x1E4F143A8];
    v0[19] = 0x40000000;
    v0[20] = sub_1C20B073C;
    v0[21] = &block_descriptor_2;
    v0[22] = v12;
    objc_msgSend(v1, sel_saveOrUpdateUserDomainConcept_completion_, v2, v0 + 18);
    id v11 = v0 + 2;
  }
  return MEMORY[0x1F41881E8](v11);
}

uint64_t sub_1C2128864()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 384) = v1;
  if (v1) {
    id v2 = sub_1C21296A8;
  }
  else {
    id v2 = sub_1C2128974;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C2128974()
{
  uint64_t v1 = (void *)v0[28];
  id v3 = (void *)v0[46];
  id v2 = (void *)v0[47];
  v0[49] = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  v0[50] = v4;

  if (v4)
  {
    uint64_t v5 = v0[43];
    uint64_t v6 = swift_task_alloc();
    v0[51] = v6;
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = v4;
    uint64_t v7 = (void *)swift_task_alloc();
    v0[52] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1C2128B28;
    uint64_t v8 = MEMORY[0x1E4FBB390];
    return MEMORY[0x1F41880D8](v0 + 60, 0, 0, 0xD00000000000001ELL, 0x80000001C216A0A0, sub_1C213A488, v6, v8);
  }
  else
  {

    return sub_1C214B910();
  }
}

uint64_t sub_1C2128B28()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2128C40, 0, 0);
}

uint64_t sub_1C2128C40()
{
  uint64_t v13 = v0;
  if ((*(unsigned char *)(v0 + 480) & 1) == 0)
  {
    sub_1C21497D0();
    uint64_t v1 = sub_1C21497E0();
    os_log_type_t v2 = sub_1C214ABD0();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void *)(v0 + 328);
    uint64_t v5 = *(void *)(v0 + 288);
    uint64_t v6 = *(void *)(v0 + 296);
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      *(void *)(v0 + 240) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v12);
      sub_1C214B530();
      _os_log_impl(&dword_1C1F0B000, v1, v2, "[%s] Failed to add medication to active list", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v8, -1, -1);
      MEMORY[0x1C8754730](v7, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  id v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v9;
  *id v9 = v0;
  v9[1] = sub_1C2128E28;
  uint64_t v10 = *(void *)(v0 + 400);
  return sub_1C2130E20(v10);
}

uint64_t sub_1C2128E28()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_1C21299E8;
  }
  else {
    os_log_type_t v2 = sub_1C2128F3C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C2128F3C()
{
  uint64_t v1 = *(void **)(v0 + 392);
  os_log_type_t v2 = *(void **)(v0 + 352);
  BOOL v3 = *(void **)(v0 + 336);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1C2128FE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 440) = v1;
  if (v1) {
    os_log_type_t v2 = sub_1C2129D1C;
  }
  else {
    os_log_type_t v2 = sub_1C21290F8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C21290F8()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 448) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 344);
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_1C21291F8;
  uint64_t v3 = MEMORY[0x1E4FBB390];
  return MEMORY[0x1F41880D8](v0 + 481, 0, 0, 0xD00000000000001ELL, 0x80000001C216A0A0, sub_1C20C0A38, v1, v3);
}

uint64_t sub_1C21291F8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2129310, 0, 0);
}

uint64_t sub_1C2129310()
{
  uint64_t v13 = v0;
  if ((*(unsigned char *)(v0 + 481) & 1) == 0)
  {
    sub_1C21497D0();
    uint64_t v1 = sub_1C21497E0();
    os_log_type_t v2 = sub_1C214ABD0();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void *)(v0 + 320);
    uint64_t v5 = *(void *)(v0 + 288);
    uint64_t v6 = *(void *)(v0 + 296);
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      *(void *)(v0 + 232) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v12);
      sub_1C214B530();
      _os_log_impl(&dword_1C1F0B000, v1, v2, "[%s] Failed to add medication to active list", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v8, -1, -1);
      MEMORY[0x1C8754730](v7, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  id v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v9;
  *id v9 = v0;
  v9[1] = sub_1C21294F8;
  uint64_t v10 = *(void *)(v0 + 352);
  return sub_1C2130E20(v10);
}

uint64_t sub_1C21294F8()
{
  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_1C212A03C;
  }
  else {
    os_log_type_t v2 = sub_1C212960C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C212960C()
{
  uint64_t v1 = (void *)v0[44];
  os_log_type_t v2 = (void *)v0[42];
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1C21296A8()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0 + 376);
  os_log_type_t v2 = *(void **)(v0 + 368);
  swift_willThrow();

  BOOL v3 = *(void **)(v0 + 384);
  sub_1C21497D0();
  id v4 = v3;
  id v5 = v3;
  uint64_t v6 = sub_1C21497E0();
  os_log_type_t v7 = sub_1C214ABD0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v20 = *(void **)(v0 + 360);
    uint64_t v21 = *(void **)(v0 + 336);
    uint64_t v22 = *(void *)(v0 + 296);
    uint64_t v23 = *(void **)(v0 + 352);
    uint64_t v24 = *(void *)(v0 + 288);
    uint64_t v25 = *(void *)(v0 + 312);
    uint64_t v8 = swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v26 = v10;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 264) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v26);
    sub_1C214B530();
    *(_WORD *)(v8 + 12) = 2112;
    id v11 = v3;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 272) = v12;
    sub_1C214B530();
    *id v9 = v12;

    _os_log_impl(&dword_1C1F0B000, v6, v7, "[%s] Failed to save ontology-backed medication with error: '%@'", (uint8_t *)v8, 0x16u);
    sub_1C2134F48(0, (unint64_t *)&qword_1EA2C3178, (unint64_t *)&qword_1EA2C4AA0, 0x1E4FBA8A8, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v10, -1, -1);
    MEMORY[0x1C8754730](v8, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v24);
  }
  else
  {
    uint64_t v13 = *(void **)(v0 + 360);
    uint64_t v14 = *(void **)(v0 + 336);
    uint64_t v15 = *(void *)(v0 + 312);
    uint64_t v16 = *(void *)(v0 + 288);
    uint64_t v17 = *(void *)(v0 + 296);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_1C21299E8()
{
  uint64_t v25 = v0;

  uint64_t v1 = *(void **)(v0 + 432);
  sub_1C21497D0();
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_1C21497E0();
  os_log_type_t v5 = sub_1C214ABD0();
  if (os_log_type_enabled(v4, v5))
  {
    id v18 = *(void **)(v0 + 360);
    id v19 = *(void **)(v0 + 336);
    uint64_t v20 = *(void *)(v0 + 296);
    uint64_t v21 = *(void **)(v0 + 352);
    uint64_t v22 = *(void *)(v0 + 288);
    uint64_t v23 = *(void *)(v0 + 312);
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v24 = v8;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 264) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v24);
    sub_1C214B530();
    *(_WORD *)(v6 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 272) = v10;
    sub_1C214B530();
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_1C1F0B000, v4, v5, "[%s] Failed to save ontology-backed medication with error: '%@'", (uint8_t *)v6, 0x16u);
    sub_1C2134F48(0, (unint64_t *)&qword_1EA2C3178, (unint64_t *)&qword_1EA2C4AA0, 0x1E4FBA8A8, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v8, -1, -1);
    MEMORY[0x1C8754730](v6, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v23, v22);
  }
  else
  {
    id v11 = *(void **)(v0 + 360);
    uint64_t v12 = *(void **)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 312);
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v15 = *(void *)(v0 + 296);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1C2129D1C()
{
  uint64_t v23 = v0;
  swift_willThrow();
  uint64_t v1 = *(void **)(v0 + 440);
  sub_1C21497D0();
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_1C21497E0();
  os_log_type_t v5 = sub_1C214ABD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v17 = *(void **)(v0 + 336);
    id v18 = *(void **)(v0 + 352);
    uint64_t v19 = *(void *)(v0 + 296);
    uint64_t v20 = *(void *)(v0 + 288);
    uint64_t v21 = *(void *)(v0 + 304);
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 256) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v22);
    sub_1C214B530();
    *(_WORD *)(v6 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 248) = v10;
    sub_1C214B530();
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_1C1F0B000, v4, v5, "[%s] Failed to save manual medication with error: '%@'", (uint8_t *)v6, 0x16u);
    sub_1C2134F48(0, (unint64_t *)&qword_1EA2C3178, (unint64_t *)&qword_1EA2C4AA0, 0x1E4FBA8A8, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v8, -1, -1);
    MEMORY[0x1C8754730](v6, -1, -1);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  }
  else
  {
    id v11 = *(void **)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 304);
    uint64_t v14 = *(void *)(v0 + 288);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_1C212A03C()
{
  uint64_t v23 = v0;
  uint64_t v1 = *(void **)(v0 + 472);
  sub_1C21497D0();
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_1C21497E0();
  os_log_type_t v5 = sub_1C214ABD0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v17 = *(void **)(v0 + 336);
    id v18 = *(void **)(v0 + 352);
    uint64_t v19 = *(void *)(v0 + 296);
    uint64_t v20 = *(void *)(v0 + 288);
    uint64_t v21 = *(void *)(v0 + 304);
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v22 = v8;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 256) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v22);
    sub_1C214B530();
    *(_WORD *)(v6 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 248) = v10;
    sub_1C214B530();
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_1C1F0B000, v4, v5, "[%s] Failed to save manual medication with error: '%@'", (uint8_t *)v6, 0x16u);
    sub_1C2134F48(0, (unint64_t *)&qword_1EA2C3178, (unint64_t *)&qword_1EA2C4AA0, 0x1E4FBA8A8, MEMORY[0x1E4FBB718]);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v7, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v8, -1, -1);
    MEMORY[0x1C8754730](v6, -1, -1);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  }
  else
  {
    id v11 = *(void **)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 304);
    uint64_t v14 = *(void *)(v0 + 288);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_1C212A354(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  id v6 = objc_msgSend(v2, sel_navigationItem);
  id v7 = objc_msgSend(v6, sel_rightBarButtonItem);

  if (v7)
  {
    swift_bridgeObjectRetain();
    sub_1C214A6C0();
    uint64_t v8 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setAccessibilityIdentifier_, v8, a1, a2);
  }
  id v9 = objc_msgSend(v3, sel_navigationItem);
  id v10 = objc_msgSend(v9, sel_backBarButtonItem);

  if (v10)
  {
    swift_bridgeObjectRetain();
    sub_1C214A6C0();
    id v11 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setAccessibilityIdentifier_, v11, a1, a2);
  }
  id v12 = objc_msgSend(v3, sel_navigationItem);
  id v13 = objc_msgSend(v12, sel_leftBarButtonItem);

  if (v13)
  {
    swift_bridgeObjectRetain();
    sub_1C214A6C0();
    uint64_t v14 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setAccessibilityIdentifier_, v14, a1, a2);
  }
  id v15 = objc_msgSend(v3, sel_editButtonItem);
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  uint64_t v16 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAccessibilityIdentifier_, v16, a1, a2);

  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  sub_1C2148A80();

  return swift_bridgeObjectRelease();
}

void sub_1C212A64C()
{
  swift_getObjectType();
  uint64_t v0 = sub_1C21497F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21497A0();
  id v4 = sub_1C21497E0();
  os_log_type_t v5 = sub_1C214ABB0();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v22[0] = v7;
    *(_DWORD *)id v6 = 136446210;
    uint64_t v8 = sub_1C214BC10();
    v21[1] = sub_1C1F6FD54(v8, v9, v22);
    sub_1C214B530();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v4, v5, "[%{public}s]: Submitting Tips Discoverability Signal", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v7, -1, -1);
    MEMORY[0x1C8754730](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v10 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v10, sel_Signals);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_source);
  sub_1C214A5F0();
  id v13 = (void *)sub_1C214A5B0();
  uint64_t v14 = MGGetStringAnswer();
  if (v14)
  {
    id v15 = (void *)v14;
    sub_1C214A5F0();

    v22[0] = 760434537;
    v22[1] = 0xE400000000000000;
    sub_1C214A6C0();

    swift_bridgeObjectRelease();
    id v16 = objc_allocWithZone(MEMORY[0x1E4F4FE08]);
    uint64_t v17 = (void *)sub_1C214A5B0();
    id v18 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    uint64_t v19 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v16, sel_initWithContentIdentifier_context_osBuild_userInfo_, v17, v18, v19, 0);

    objc_msgSend(v12, sel_sendEvent_, v20);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C212A9D8(int a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t result = 0;
    while (1)
    {
      unsigned int v5 = *(unsigned __int8 *)(a2 + 32 + result);
      switch(v5 >> 5)
      {
        case 1u:
          BOOL v6 = (v5 & 1) == 0;
          if ((a1 & 0xE0) != 0x20) {
            goto LABEL_4;
          }
          goto LABEL_9;
        case 2u:
          if (v5 == 64)
          {
            if (a1 == 64) {
              return result;
            }
          }
          else if (a1 == 65)
          {
            return result;
          }
          goto LABEL_4;
        case 3u:
          if (v5 == 96)
          {
            if (a1 == 96) {
              return result;
            }
          }
          else if (a1 == 97)
          {
            return result;
          }
          goto LABEL_4;
        case 4u:
          if (v5 == 128)
          {
            if (a1 == 128) {
              return result;
            }
          }
          else if (a1 == 129)
          {
            return result;
          }
LABEL_4:
          if (v2 == ++result) {
            return 0;
          }
          break;
        case 5u:
          if (a1 != 160) {
            goto LABEL_4;
          }
          return result;
        default:
          BOOL v6 = (v5 & 1) == 0;
          if (a1 > 0x1Fu) {
            goto LABEL_4;
          }
LABEL_9:
          if ((a1 ^ v6)) {
            return result;
          }
          goto LABEL_4;
      }
    }
  }
  return 0;
}

uint64_t MedicationOnboardingFlowManager.init(entryMode:currentStep:didShowLifeStyleFactors:analyticsContext:analyticsEntryMode:)@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v47 = a5;
  int v48 = a3;
  uint64_t v45 = a1;
  CGFloat v43 = (void (*)(uint64_t))MEMORY[0x1E4F66C80];
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v41 = (void (*)(uint64_t))MEMORY[0x1E4F66C08];
  unint64_t v42 = (char *)&v41 - v9;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v10 - 8);
  id v12 = (char *)&v41 - v11;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)&v41 - v14;
  id v16 = (void (*)(uint64_t))MEMORY[0x1E4F27990];
  sub_1C21388C8(0, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v41 - v18;
  int v44 = *a2;
  id v20 = (int *)type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v21 = v20[9];
  uint64_t v22 = sub_1C2147B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  sub_1C2134FB0(0, &qword_1EA2C76F0, &qword_1EA2C6FC0, v16);
  swift_allocObject();
  *(void *)(a6 + v21) = sub_1C2149EB0();
  uint64_t v23 = v20[10];
  *(void *)&long long v49 = 0;
  sub_1C2135094(0, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
  swift_allocObject();
  *(void *)(a6 + v23) = sub_1C2149EB0();
  uint64_t v24 = v20[11];
  LOBYTE(v49) = 0;
  sub_1C2138414(0, (unint64_t *)&qword_1EA2C2BE8, MEMORY[0x1E4F1ABB0]);
  swift_allocObject();
  *(void *)(a6 + v24) = sub_1C2149EB0();
  uint64_t v25 = v20[12];
  uint64_t v26 = type metadata accessor for FormStepResult();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v15, 1, 1, v26);
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  swift_allocObject();
  *(void *)(a6 + v25) = sub_1C2149EB0();
  uint64_t v27 = v20[13];
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C3458, (unint64_t *)&qword_1EA2C44C0, MEMORY[0x1E4FBB1A0]);
  long long v49 = 0uLL;
  swift_allocObject();
  *(void *)(a6 + v27) = sub_1C2149EB0();
  uint64_t v28 = v20[14];
  long long v49 = 0uLL;
  swift_allocObject();
  swift_retain();
  *(void *)(a6 + v28) = sub_1C2149EB0();
  uint64_t v29 = v20[15];
  *(void *)&long long v49 = 0;
  sub_1C2135094(0, (unint64_t *)&qword_1EA2C5460, &qword_1EA2C5468, (unint64_t *)&qword_1EA2C5470, 0x1E4F2B618);
  swift_allocObject();
  *(void *)(a6 + v29) = sub_1C2149EB0();
  uint64_t v30 = v20[16];
  uint64_t v31 = sub_1C2148F60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 1, 1, v31);
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C2CC0, &qword_1EA2C2CA0, v41);
  swift_allocObject();
  *(void *)(a6 + v30) = sub_1C2149EB0();
  uint64_t v32 = v20[17];
  uint64_t v33 = sub_1C21492D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v42, 1, 1, v33);
  sub_1C2134FB0(0, &qword_1EA2C46F0, (unint64_t *)&qword_1EBF0B690, v43);
  swift_allocObject();
  *(void *)(a6 + v32) = sub_1C2149EB0();
  uint64_t v34 = v20[18];
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C6FB0, (unint64_t *)&qword_1EA2C6FB8, (uint64_t)&type metadata for MedicationNicknameNotes);
  long long v49 = 0u;
  long long v50 = 0u;
  swift_allocObject();
  *(void *)(a6 + v34) = sub_1C2149EB0();
  uint64_t v35 = v20[19];
  *(void *)&long long v49 = 0;
  sub_1C2135094(0, (unint64_t *)&qword_1EA2C3978, (unint64_t *)&qword_1EBF0C830, &qword_1EBF0C828, 0x1E4F66B28);
  swift_allocObject();
  *(void *)(a6 + v35) = sub_1C2149EB0();
  uint64_t v36 = v20[20];
  sub_1C2148E10();
  *(void *)(a6 + v36) = sub_1C2148E00();
  uint64_t v37 = v45;
  sub_1C212169C(v45, a6, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  *(unsigned char *)(a6 + v20[7]) = v44;
  *(void *)(a6 + v20[5]) = v46;
  swift_retain();
  uint64_t v38 = v47;
  sub_1C2149370();
  *(void *)(a6 + v20[6]) = v38;
  *(unsigned char *)(a6 + v20[8]) = v48 & 1;
  *(void *)&long long v49 = sub_1C212B1B0();
  *((void *)&v49 + 1) = v39;
  sub_1C2149E70();
  swift_release();
  swift_release();
  sub_1C2121704(v37, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C212B1B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C21490F0();
  uint64_t v38 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MedicationSearchItem.Source(0);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (void **)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (void **)((char *)&v37 - v9);
  uint64_t v11 = type metadata accessor for MedicationSearchItem(0);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  id v16 = (char *)&v37 - v15;
  uint64_t v17 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (uint64_t *)((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C212169C(v1, (uint64_t)v19, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1C212BD30((uint64_t)v19, (uint64_t)v14, type metadata accessor for MedicationSearchItem);
      sub_1C212169C((uint64_t)v14, (uint64_t)v8, type metadata accessor for MedicationSearchItem.Source);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v26 = v38;
        (*(void (**)(char *, void **, uint64_t))(v38 + 32))(v4, v8, v2);
        uint64_t v21 = sub_1C21490B0();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
      }
      else
      {
        uint64_t v32 = *v8;
        sub_1C1F30C40();
        uint64_t v34 = (char *)v8 + *(int *)(v33 + 48);
        uint64_t v21 = sub_1C214B420();

        uint64_t v35 = sub_1C21491B0();
        (*(void (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
      }
      uint64_t v31 = (uint64_t)v14;
      goto LABEL_12;
    case 2u:
      uint64_t v22 = (void *)*v19;
      sub_1C20B6C78();
      uint64_t v24 = (char *)v19 + *(int *)(v23 + 48);
      uint64_t v21 = sub_1C214B480();

      uint64_t v25 = sub_1C2147B20();
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
      break;
    case 3u:
      uint64_t v21 = *v19;
      break;
    default:
      sub_1C212BD30((uint64_t)v19, (uint64_t)v16, type metadata accessor for MedicationSearchItem);
      sub_1C212169C((uint64_t)v16, (uint64_t)v10, type metadata accessor for MedicationSearchItem.Source);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v20 = v38;
        (*(void (**)(char *, void **, uint64_t))(v38 + 32))(v4, v10, v2);
        uint64_t v21 = sub_1C21490B0();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
      }
      else
      {
        uint64_t v27 = *v10;
        sub_1C1F30C40();
        uint64_t v29 = (char *)v10 + *(int *)(v28 + 48);
        uint64_t v21 = sub_1C214B420();

        uint64_t v30 = sub_1C21491B0();
        (*(void (**)(char *, uint64_t))(*(void *)(v30 - 8) + 8))(v29, v30);
      }
      uint64_t v31 = (uint64_t)v16;
LABEL_12:
      sub_1C2121704(v31, type metadata accessor for MedicationSearchItem);
      break;
  }
  return v21;
}

uint64_t MedicationOnboardingFlowManager.analyticsContext.getter()
{
  type metadata accessor for MedicationOnboardingFlowManager(0);

  return swift_retain();
}

uint64_t MedicationOnboardingFlowManager.analyticsContext.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 20);
  uint64_t result = swift_release();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*MedicationOnboardingFlowManager.analyticsContext.modify())()
{
  return nullsub_1;
}

uint64_t MedicationOnboardingFlowManager.analyticsEntryMode.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 24));
}

uint64_t MedicationOnboardingFlowManager.analyticsEntryMode.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for MedicationOnboardingFlowManager(0);
  *(void *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*MedicationOnboardingFlowManager.analyticsEntryMode.modify())()
{
  return nullsub_1;
}

uint64_t MedicationOnboardingFlowManager.currentStep.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for MedicationOnboardingFlowManager(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t MedicationOnboardingFlowManager.didShowLifeStyleFactors.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 32));
}

uint64_t MedicationOnboardingFlowManager.conceptPublisher.getter()
{
  type metadata accessor for MedicationOnboardingFlowManager(0);

  return swift_retain();
}

uint64_t MedicationOnboardingFlowManager.proceededManuallyPublisher.getter()
{
  type metadata accessor for MedicationOnboardingFlowManager(0);

  return swift_retain();
}

uint64_t sub_1C212B8AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2148E10();
  sub_1C2148E00();
  sub_1C2148DB0();
  swift_release();
  sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C7C8);
  sub_1C214AC00();
  sub_1C2148D70();
  swift_allocObject();
  sub_1C2148C90();
  char v5 = sub_1C2148D00();
  char v6 = sub_1C2148D50();
  unsigned __int8 v7 = sub_1C2148D20();
  sub_1C2148DC0();
  unint64_t v8 = sub_1C2149710();
  swift_release();
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C214B930();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  unsigned int v10 = objc_msgSend(self, sel_supportsOntologyBackedMedications);
  sub_1C212169C(v1, (uint64_t)v4, type metadata accessor for MedicationOnboardingFlowManager);
  if (v10 && (sub_1C2149E90(), v15))
  {

    sub_1C2121704((uint64_t)v4, type metadata accessor for MedicationOnboardingFlowManager);
    if (((v5 | v6) | v7) & 1) != 0 || (sub_1C2148CE0())
    {
      char v11 = sub_1C2148D40();
      swift_release();
      char v12 = v11 | (v9 == 0);
    }
    else
    {
      swift_release();
      char v12 = 1;
    }
  }
  else
  {
    sub_1C2121704((uint64_t)v4, type metadata accessor for MedicationOnboardingFlowManager);
    swift_release();
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_1C212BB30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v4);
  char v6 = (id *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C212169C(v2, (uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      sub_1C2121704((uint64_t)v6, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      goto LABEL_5;
    case 2u:

      sub_1C20B6C78();
      unsigned int v10 = (char *)v6 + *(int *)(v9 + 48);
      uint64_t v11 = sub_1C2147B20();
      (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
LABEL_5:
      uint64_t v12 = type metadata accessor for MedicationSearchItem(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 1, 1, v12);
      break;
    default:
      sub_1C212BD30((uint64_t)v6, a1, type metadata accessor for MedicationSearchItem);
      uint64_t v7 = type metadata accessor for MedicationSearchItem(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
      break;
  }
  return result;
}

uint64_t type metadata accessor for MedicationOnboardingFlowManager.EntryMode(uint64_t a1)
{
  return sub_1C1F20D10(a1, (uint64_t *)&unk_1EA2C7710);
}

uint64_t sub_1C212BD30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C212BD98()
{
  uint64_t v0 = sub_1C2147BB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if (v11[1])
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
    sub_1C2147B60();
    uint64_t v5 = (void *)sub_1C2147B50();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    objc_msgSend(v4, sel_setLocale_, v5);

    char v6 = (void *)sub_1C214A5B0();
    id v7 = objc_msgSend(v4, sel_numberFromString_, v6);

    if (v7)
    {
      objc_msgSend(v7, sel_doubleValue);
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();

      return v9;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

id MedicationOnboardingFlowManager.currentMedicationUDC.getter()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1C21492D0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  id v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v37 - v6;
  uint64_t v8 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v8);
  unsigned int v10 = (id *)((char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  sub_1C212169C(v1, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v41 = v2;

      sub_1C20B6C78();
      uint64_t v13 = (char *)v10 + *(int *)(v12 + 48);
      uint64_t v14 = sub_1C2147B20();
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
      goto LABEL_4;
    case 3u:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    default:
      uint64_t v41 = v2;
      sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
LABEL_4:
      type metadata accessor for MedicationOnboardingFlowManager(0);
      sub_1C2149E90();
      id v15 = v43;
      if (v43)
      {
        id v16 = self;
        id v17 = objc_msgSend(v15, sel_identifier);
        id v40 = objc_msgSend(v16, sel_appleOntologyCodingWithIdentifier_, v17);

        sub_1C2149E90();
        uint64_t v18 = v44;
        uint64_t v38 = v4;
        if (v44 == 1)
        {
          uint64_t v39 = 0;
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v20 = (uint64_t)v43;
          swift_bridgeObjectRetain();
          uint64_t v39 = v20;
          sub_1C204FA70(v20, v18);
        }
        sub_1C2149E90();
        uint64_t v21 = v44;
        if (v44 == 1)
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
        }
        else
        {
          uint64_t v24 = v45;
          uint64_t v23 = v46;
          uint64_t v25 = (uint64_t)v43;
          swift_bridgeObjectRetain();
          uint64_t v26 = v25;
          uint64_t v22 = v24;
          sub_1C204FA70(v26, v21);
        }
        sub_1C2149E90();
        uint64_t v27 = v41;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v7, 1, v42))
        {
          sub_1C2121640((uint64_t)v7, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
          uint64_t v28 = 0;
          uint64_t v29 = 0;
        }
        else
        {
          uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
          uint64_t v31 = v38;
          uint64_t v37 = v22;
          uint64_t v32 = v42;
          v30(v38, v7, v42);
          sub_1C2121640((uint64_t)v7, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
          uint64_t v28 = sub_1C2149270();
          uint64_t v29 = v33;
          uint64_t v34 = v32;
          uint64_t v22 = v37;
          (*(void (**)(char *, uint64_t))(v27 + 8))(v31, v34);
        }
        id v35 = objc_allocWithZone(MEMORY[0x1E4F66B80]);
        id v19 = sub_1C2134160(v40, v39, v18, v22, v23, v28, v29, 0);
        swift_release();
      }
      else
      {
LABEL_8:
        id v19 = sub_1C212C408(v11);
        swift_release();
      }
      return v19;
  }
}

id sub_1C212C408(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 16);
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    id v3 = *(id *)(a1 + 16);
  }
  else
  {
    id v4 = (void *)sub_1C212C488();
    swift_beginAccess();
    uint64_t v5 = *v2;
    *uint64_t v2 = v4;
    id v3 = v4;

    uint64_t v1 = 0;
  }
  id v6 = v1;
  return v3;
}

uint64_t sub_1C212C488()
{
  uint64_t v0 = sub_1C21492D0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v48 = v0;
  uint64_t v49 = v1;
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v42 - v5;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v42 - v8);
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  unsigned int v10 = v50;
  uint64_t v44 = v3;
  if (v50)
  {
    uint64_t v11 = sub_1C212BD98();
    if ((v12 & 1) == 0)
    {
      id v13 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v10, *(double *)&v11);

      goto LABEL_6;
    }
  }
  id v13 = 0;
LABEL_6:
  sub_1C2149E90();
  if (!v51)
  {

LABEL_22:
    uint64_t result = sub_1C214B910();
    __break(1u);
    return result;
  }
  uint64_t v14 = v50;
  sub_1C2149E90();
  uint64_t v15 = type metadata accessor for FormStepResult();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v9, 1, v15) == 1)
  {

    sub_1C2121640((uint64_t)v9, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    goto LABEL_22;
  }
  id v47 = v13;
  if (swift_getEnumCaseMultiPayload() != 1)
  {

    sub_1C2121704((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    goto LABEL_22;
  }
  uint64_t v16 = *v9;
  sub_1C2149E90();
  uint64_t v17 = v51;
  uint64_t v46 = v14;
  if (v51 == 1)
  {
    uint64_t v45 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v18 = (uint64_t)v50;
    swift_bridgeObjectRetain();
    uint64_t v45 = v18;
    sub_1C204FA70(v18, v17);
  }
  sub_1C2149E90();
  uint64_t v19 = v51;
  if (v51 == 1)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v20 = v52;
    uint64_t v21 = v53;
    uint64_t v22 = (uint64_t)v50;
    swift_bridgeObjectRetain();
    sub_1C204FA70(v22, v19);
  }
  sub_1C2149E90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v6, 1, v48))
  {
    sub_1C2121640((uint64_t)v6, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v25 = v48;
    uint64_t v26 = v49;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
    uint64_t v43 = v20;
    uint64_t v28 = v16;
    uint64_t v29 = v44;
    v27(v44, v6, v48);
    sub_1C2121640((uint64_t)v6, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v23 = sub_1C2149270();
    uint64_t v24 = v30;
    uint64_t v31 = v29;
    uint64_t v16 = v28;
    uint64_t v20 = v43;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v25);
  }
  uint64_t v32 = v45;
  uint64_t v33 = self;
  uint64_t v34 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v35 = v16;
  id v36 = v47;
  id v37 = objc_msgSend(v33, sel_userDomainConceptPropertyListWithFreeTextMedicationName_freeTextFormCode_freeTextStrengthQuantity_, v34, v35, v47);

  sub_1C1F12718(0, (unint64_t *)&qword_1EA2C2D08);
  uint64_t v38 = sub_1C214A780();

  id v39 = objc_allocWithZone(MEMORY[0x1E4F66B80]);
  id v40 = sub_1C2134160(0, v32, v17, v20, v21, v23, v24, v38);

  return (uint64_t)v40;
}

uint64_t static MedicationOnboardingFlowManager.makeInitialOnboardingViewController(manualEntryText:analyticsContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1C2148E10();
  swift_retain();
  sub_1C2148E00();
  sub_1C2148DB0();
  swift_release();
  sub_1C2149310();
  swift_allocObject();
  sub_1C2149300();
  sub_1C21493E0();
  sub_1C21493D0();
  if (objc_msgSend(self, sel_supportsOntologyBackedMedications))
  {
    sub_1C2148E00();
    char v12 = (void *)sub_1C2148DB0();
    swift_release();
    sub_1C2148E00();
    uint64_t v13 = sub_1C2148DC0();
    swift_release();
    id v14 = objc_allocWithZone((Class)type metadata accessor for NewMedicationOnboardingViewController());
    swift_retain();
    uint64_t v15 = NewMedicationOnboardingViewController.init(healthStore:listManager:analyticsContext:)(v12, v13, a3);
LABEL_4:
    swift_release();
    return (uint64_t)v15;
  }
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  unsigned __int8 v20 = 64;
  swift_bridgeObjectRetain();
  swift_retain();
  MedicationOnboardingFlowManager.init(entryMode:currentStep:didShowLifeStyleFactors:analyticsContext:analyticsEntryMode:)((uint64_t)v8, &v20, 0, a3, 1, (uint64_t)v11);
  MedicationOnboardingFlowManager.makeNextViewControllerForStep()(v16);
  uint64_t v15 = v17;
  uint64_t result = sub_1C2121704((uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
  if (v15) {
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C212CCE4@<X0>(unsigned __int8 *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v75 = a2;
  sub_1C21388C8(0, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
  MEMORY[0x1F4188790](v5 - 8);
  id v66 = (char *)&v63 - v6;
  uint64_t v7 = sub_1C2147B20();
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v68 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1C21491B0();
  uint64_t v67 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  uint64_t v64 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v73 = (uint64_t)&v63 - v14;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v15 - 8);
  unint64_t v65 = (char *)&v63 - v16;
  uint64_t v17 = type metadata accessor for MedicationSearchItem(0);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v72 = (uint64_t)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (void **)((char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = (void (*)(uint64_t))MEMORY[0x1E4F66C08];
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v25 = (char *)&v63 - v24;
  unsigned int v26 = *a1;
  char v27 = sub_1C212B8AC();
  uint64_t v74 = type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  uint64_t v28 = sub_1C2148F60();
  uint64_t v29 = (char *)((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v25, 1, v28) == 1);
  sub_1C2121640((uint64_t)v25, &qword_1EA2C2CA0, v22);
  uint64_t v30 = _s19HealthMedicationsUI17SpecificationStepO10finalSteps16shouldDisplayDDI17skipVisualizationSayACGSb_SbtFZ_0(v27 & 1, (char)v29);
  unint64_t v31 = *((void *)v30 + 2);
  if (!v31)
  {
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v29 = v30;
  uint64_t v33 = v30 + 32;
  unsigned int v32 = v30[32];
  unint64_t v34 = 2;
  switch(v26 >> 5)
  {
    case 1u:
      unint64_t v34 = 3;
      break;
    case 2u:
      unint64_t v34 = v26 != 64;
      break;
    case 3u:
      unint64_t v34 = 4;
      if (v26 != 96) {
        unint64_t v34 = 5;
      }
      break;
    case 4u:
      unint64_t v34 = 6;
      if (v26 != 128) {
        unint64_t v34 = 7;
      }
      break;
    case 5u:
      unint64_t v34 = 8;
      break;
    default:
      break;
  }
  unint64_t v35 = 2;
  switch(v32 >> 5)
  {
    case 1u:
      if (v34 >= 3) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 2u:
      if (v34 >= (v32 != 64)) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 3u:
      if (v32 == 96) {
        unint64_t v36 = 4;
      }
      else {
        unint64_t v36 = 5;
      }
      if (v34 >= v36) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 4u:
      if (v32 == 128) {
        unint64_t v35 = 6;
      }
      else {
        unint64_t v35 = 7;
      }
      goto LABEL_25;
    case 5u:
      if (v34 >= 8) {
        goto LABEL_29;
      }
      goto LABEL_26;
    default:
LABEL_25:
      if (v34 < v35)
      {
LABEL_26:
        sub_1C212169C(v3, (uint64_t)v21, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            swift_bridgeObjectRelease();
            sub_1C212BD30((uint64_t)v21, v72, type metadata accessor for MedicationSearchItem);
            uint64_t v42 = v73;
            sub_1C202AF58(v73);
            sub_1C2138158(v42, (uint64_t)v13, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
            uint64_t v43 = v67;
            uint64_t v44 = v69;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48))(v13, 1, v69) == 1)
            {
              uint64_t v45 = type metadata accessor for FormStepResult();
              uint64_t v46 = (uint64_t)v65;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v65, 1, 1, v45);
            }
            else
            {
              id v59 = v64;
              (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v64, v13, v44);
              uint64_t v46 = (uint64_t)v65;
              (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v65, v59, v44);
              uint64_t v60 = type metadata accessor for FormStepResult();
              swift_storeEnumTagMultiPayload();
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v46, 0, 1, v60);
              (*(void (**)(char *, uint64_t))(v43 + 8))(v59, v44);
            }
            sub_1C2121640(v73, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
            sub_1C2149E70();
            sub_1C2121640(v46, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
            uint64_t v61 = v72;
            uint64_t v62 = (void *)sub_1C202ACC0();
            uint64_t v76 = v62;
            sub_1C2149E70();

            uint64_t result = sub_1C2121704(v61, type metadata accessor for MedicationSearchItem);
            goto LABEL_47;
          case 2u:
            swift_bridgeObjectRelease();
            id v47 = *v21;
            sub_1C20B6C78();
            uint64_t v49 = (char *)v21 + *(int *)(v48 + 48);
            uint64_t v51 = v70;
            uint64_t v50 = v71;
            uint64_t v52 = v68;
            (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v68, v49, v71);
            uint64_t v53 = (uint64_t)v66;
            (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v66, v52, v50);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v53, 0, 1, v50);
            sub_1C2149E70();
            sub_1C2121640(v53, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
            uint64_t v76 = v47;
            id v54 = v47;
            sub_1C2149E70();

            uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v52, v50);
LABEL_47:
            char v41 = 96;
            goto LABEL_48;
          case 3u:
            swift_bridgeObjectRelease();
            if (qword_1EA2C2648 == -1) {
              goto LABEL_38;
            }
            goto LABEL_52;
          default:
            swift_bridgeObjectRelease();
            LOBYTE(v76) = v26;
            sub_1C212F7DC((unsigned __int8 *)&v76, v75);
            return sub_1C2121704((uint64_t)v21, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
        }
      }
LABEL_29:
      uint64_t v38 = sub_1C212A9D8(v26, (uint64_t)v30);
      if ((v39 & 1) == 0 && v38 < (uint64_t)(v31 - 1))
      {
        if (v38 + 1 < v31)
        {
          char v40 = v33[v38 + 1];
LABEL_44:
          uint64_t result = swift_bridgeObjectRelease();
          *uint64_t v75 = v40;
          return result;
        }
LABEL_51:
        __break(1u);
LABEL_52:
        swift_once();
LABEL_38:
        CGRect v55 = off_1EA2C30B0;
        uint64_t v56 = sub_1C212A9D8(v26, (uint64_t)off_1EA2C30B0);
        if ((v57 & 1) != 0 || (uint64_t v58 = v56, v56 >= v55[2] - 1))
        {
          char v40 = v29[32];
          goto LABEL_44;
        }
        uint64_t result = swift_bridgeObjectRelease();
        if (v58 < -1)
        {
          __break(1u);
        }
        else if ((unint64_t)(v58 + 1) < v55[2])
        {
          char v41 = *((unsigned char *)v55 + v58 + 33);
          goto LABEL_48;
        }
        __break(1u);
        JUMPOUT(0x1C212D6ACLL);
      }
      uint64_t result = swift_bridgeObjectRelease();
      char v41 = -2;
LABEL_48:
      *uint64_t v75 = v41;
      return result;
  }
}

uint64_t sub_1C212D6EC@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v33 = (char *)&v32 - v7;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v32 - v9;
  sub_1C21388C8(0, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v32 - v12;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v32 - v15;
  uint64_t v17 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v20 = *a1;
  if (v20 > 0x9F) {
    int v21 = 1;
  }
  else {
    int v21 = *(unsigned __int8 *)(v3 + *(int *)(type metadata accessor for MedicationOnboardingFlowManager(0) + 32));
  }
  sub_1C212169C(v3, (uint64_t)v19, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  LOBYTE(v38) = v20;
  uint64_t v22 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v23 = *(void *)(v3 + *(int *)(v22 + 20));
  uint64_t v24 = *(void *)(v3 + *(int *)(v22 + 24));
  swift_retain();
  MedicationOnboardingFlowManager.init(entryMode:currentStep:didShowLifeStyleFactors:analyticsContext:analyticsEntryMode:)((uint64_t)v19, (unsigned __int8 *)&v38, v21, v23, v24, a2);
  swift_retain();
  sub_1C2149E90();
  unint64_t v34 = v38;
  uint64_t v35 = v39;
  sub_1C2149E70();
  swift_release();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1C2149E90();
  sub_1C2149E70();
  swift_release();
  sub_1C2121640((uint64_t)v16, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  swift_retain();
  sub_1C2149E90();
  unint64_t v34 = v38;
  uint64_t v35 = v39;
  sub_1C2149E70();
  swift_release();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1C2149E90();
  uint64_t v25 = v38;
  unint64_t v34 = v38;
  sub_1C2149E70();
  swift_release();

  swift_retain();
  sub_1C2149E90();
  unsigned int v26 = v38;
  unint64_t v34 = v38;
  sub_1C2149E70();
  swift_release();

  swift_retain();
  sub_1C2149E90();
  sub_1C2149E70();
  swift_release();
  sub_1C2121640((uint64_t)v13, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
  swift_retain();
  sub_1C2149E90();
  char v27 = v38;
  unint64_t v34 = v38;
  sub_1C2149E70();
  swift_release();

  swift_retain();
  sub_1C2149E90();
  sub_1C2149E70();
  swift_release();
  sub_1C2121640((uint64_t)v10, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  swift_retain();
  uint64_t v28 = (uint64_t)v33;
  sub_1C2149E90();
  sub_1C2149E70();
  swift_release();
  sub_1C2121640(v28, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  swift_retain();
  sub_1C2149E90();
  uint64_t v29 = (uint64_t)v38;
  uint64_t v30 = v39;
  unint64_t v34 = v38;
  uint64_t v35 = v39;
  uint64_t v36 = v40;
  uint64_t v37 = v41;
  sub_1C2149E70();
  swift_release();
  sub_1C204FA70(v29, v30);
  swift_retain();
  sub_1C2149E90();
  LOBYTE(v34) = (_BYTE)v38;
  sub_1C2149E70();
  return swift_release();
}

id sub_1C212DC8C(uint64_t a1)
{
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v14 - v3;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v5 = sub_1C2148DC0();
  sub_1C2149E90();
  uint64_t v6 = v14[2];
  uint64_t v7 = v14[3];
  objc_allocWithZone((Class)type metadata accessor for ManualNameStepViewController());
  v14[0] = v6;
  v14[1] = v7;
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C3458, (unint64_t *)&qword_1EA2C44C0, MEMORY[0x1E4FBB1A0]);
  swift_allocObject();
  uint64_t v8 = sub_1C2149EB0();
  type metadata accessor for ManualNameDataSource();
  swift_allocObject();
  uint64_t v9 = sub_1C1FF2BD8(v8);
  uint64_t v10 = type metadata accessor for MedicationSearchItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  uint64_t v11 = (void *)sub_1C2134DD0((uint64_t)v4, v9, v5, &qword_1EA2C7788, (uint64_t (*)(uint64_t))type metadata accessor for ManualNameDataSource, (uint64_t)&off_1EC62F4A8, &qword_1EA2C4FF8);
  swift_release();
  swift_release();
  id v12 = sub_1C2131B4C(65, a1, v11);

  return v12;
}

id sub_1C212DE88(uint64_t a1)
{
  uint64_t v45 = a1;
  uint64_t v2 = type metadata accessor for MedicationSearchItem(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v39 = (uint64_t)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v41 = (uint64_t)v38 - v6;
  uint64_t v46 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v46);
  uint64_t v44 = (id *)((char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v38 - v9;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)v38 - v15;
  uint64_t v17 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v18 = *(int *)(v17 + 80);
  uint64_t v43 = v1;
  v38[2] = v18;
  uint64_t v19 = sub_1C2148DC0();
  uint64_t v40 = v17;
  v38[1] = *(int *)(v17 + 48);
  sub_1C2149E90();
  id v42 = objc_allocWithZone((Class)type metadata accessor for ManualFormStepViewController(0));
  unsigned int v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v21 = v2;
  v20(v10, 1, 1, v2);
  sub_1C2138158((uint64_t)v16, (uint64_t)v14, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  sub_1C2134FB0(0, (unint64_t *)&qword_1EA2C4828, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  swift_allocObject();
  uint64_t v22 = sub_1C2149EB0();
  type metadata accessor for ManaulFormsDataSource();
  swift_allocObject();
  uint64_t v23 = sub_1C20B03C0((uint64_t)v10, v22);
  uint64_t v24 = v44;
  swift_release();
  v20(v10, 1, 1, v21);
  uint64_t v25 = v45;
  unsigned int v26 = (void *)sub_1C2134B24((uint64_t)v10, (uint64_t)v23, v19, (void (*)(void))sub_1C2138E2C);
  swift_release();
  swift_release();
  uint64_t v27 = v43;
  sub_1C2121640((uint64_t)v16, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  id v28 = sub_1C2131EAC(1, v25, v26);
  sub_1C212169C(v27, (uint64_t)v24, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      sub_1C2121704((uint64_t)v24, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      id v28 = 0;
      break;
    case 2u:

      sub_1C20B6C78();
      unint64_t v31 = (char *)v24 + *(int *)(v30 + 48);
      uint64_t v32 = sub_1C2147B20();
      (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
      id v28 = 0;
      break;
    case 3u:

      swift_bridgeObjectRelease();
      break;
    default:
      uint64_t v29 = v41;
      sub_1C212BD30((uint64_t)v24, v41, type metadata accessor for MedicationSearchItem);
      sub_1C2149E90();
      if (v47 == 1)
      {
        sub_1C2121704(v29, type metadata accessor for MedicationSearchItem);
      }
      else
      {
        uint64_t v33 = v39;
        sub_1C212169C(v29, v39, type metadata accessor for MedicationSearchItem);
        uint64_t v34 = sub_1C2148DC0();
        sub_1C2149E90();
        uint64_t v35 = (void *)sub_1C1FC37D4(v33, v34, (uint64_t)v16);
        id v36 = sub_1C21321D4(0, v25, v35);

        sub_1C2121704(v29, type metadata accessor for MedicationSearchItem);
        id v28 = v36;
      }
      break;
  }
  return v28;
}

uint64_t sub_1C212E428(uint64_t a1)
{
  uint64_t v78 = a1;
  uint64_t v2 = sub_1C21497F0();
  uint64_t v74 = *(void *)(v2 - 8);
  uint64_t v75 = v2;
  MEMORY[0x1F4188790](v2);
  id v77 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C21491B0();
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v68 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v71 = (char *)&v65 - v7;
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v67 = (uint64_t)&v65 - v9;
  uint64_t v69 = type metadata accessor for MedicationSearchItem(0);
  uint64_t v76 = *(void *)(v69 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v69);
  uint64_t v66 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v65 - v12;
  uint64_t v70 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v70);
  uint64_t v15 = (id *)((char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v65 - v17;
  uint64_t v19 = type metadata accessor for FormStepResult();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v65 - v24;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v26 = v1;
  sub_1C2149E90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    uint64_t v28 = v74;
    uint64_t v27 = v75;
    sub_1C2121640((uint64_t)v18, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    uint64_t v29 = (uint64_t)v77;
    sub_1C21497A0();
    uint64_t v30 = sub_1C21497E0();
    os_log_type_t v31 = sub_1C214ABD0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v80 = (void *)v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v79 = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, (uint64_t *)&v80);
      sub_1C214B530();
      _os_log_impl(&dword_1C1F0B000, v30, v31, "[%s] Failed to create strength view controller, route form is nil!", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v33, -1, -1);
      MEMORY[0x1C8754730](v32, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v27);
    return 0;
  }
  else
  {
    uint64_t v75 = v19;
    id v77 = v23;
    uint64_t v36 = v69;
    unint64_t v65 = v13;
    uint64_t v37 = v71;
    uint64_t v38 = v72;
    uint64_t v39 = v73;
    uint64_t v40 = v78;
    sub_1C212BD30((uint64_t)v18, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    sub_1C212169C(v26, (uint64_t)v15, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    id v42 = v37;
    uint64_t v43 = v36;
    uint64_t v44 = v76;
    switch(EnumCaseMultiPayload)
    {
      case 1:
        sub_1C2121704((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
        sub_1C2121704((uint64_t)v15, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
        return 0;
      case 2:
        uint64_t v45 = v42;

        sub_1C20B6C78();
        char v47 = (char *)v15 + *(int *)(v46 + 48);
        uint64_t v48 = sub_1C2147B20();
        (*(void (**)(char *, uint64_t))(*(void *)(v48 - 8) + 8))(v47, v48);
        goto LABEL_10;
      case 3:
        swift_bridgeObjectRelease();
        uint64_t v34 = sub_1C2133B4C(v40);
        sub_1C2121704((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
        return v34;
      default:
        uint64_t v45 = v42;
        sub_1C2121704((uint64_t)v15, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
LABEL_10:
        uint64_t v49 = v67;
        sub_1C212BB30(v67);
        uint64_t v50 = v49;
        int v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v49, 1, v43);
        uint64_t v52 = v39;
        uint64_t v53 = (uint64_t)v68;
        if (v51 == 1)
        {
          sub_1C2121704((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          sub_1C2121640(v50, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
          return 0;
        }
        uint64_t v54 = (uint64_t)v65;
        sub_1C212BD30(v50, (uint64_t)v65, type metadata accessor for MedicationSearchItem);
        uint64_t v55 = (uint64_t)v77;
        sub_1C212169C((uint64_t)v25, (uint64_t)v77, (uint64_t (*)(void))type metadata accessor for FormStepResult);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_1C2121704(v55, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          uint64_t v34 = sub_1C2133B4C(v78);
          sub_1C2121704(v54, type metadata accessor for MedicationSearchItem);
          sub_1C2121704((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for FormStepResult);
        }
        else
        {
          uint64_t v56 = v54;
          char v57 = v45;
          (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v45, v55, v52);
          uint64_t v58 = v66;
          sub_1C212169C(v56, v66, type metadata accessor for MedicationSearchItem);
          uint64_t v59 = sub_1C2148DC0();
          id v77 = v25;
          uint64_t v60 = v52;
          uint64_t v61 = v59;
          sub_1C2149E90();
          uint64_t v62 = v80;
          (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v53, v57, v60);
          id v63 = objc_allocWithZone((Class)type metadata accessor for StrengthStepViewController(0));
          uint64_t v64 = (void *)sub_1C1F7380C(v58, v61, v62, v53);

          uint64_t v34 = (uint64_t)sub_1C2132824(32, v78, v64);
          (*(void (**)(char *, uint64_t))(v38 + 8))(v57, v60);
          sub_1C2121704((uint64_t)v65, type metadata accessor for MedicationSearchItem);
          sub_1C2121704((uint64_t)v77, (uint64_t (*)(void))type metadata accessor for FormStepResult);
        }
        break;
    }
  }
  return v34;
}

id sub_1C212ED64(uint64_t a1)
{
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v23 - v4;
  uint64_t v6 = type metadata accessor for MedicationSearchItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = sub_1C2148DC0();
  uint64_t v9 = *(void *)(v1 + *(int *)(v7 + 76));
  swift_retain();
  id v10 = MedicationOnboardingFlowManager.currentMedicationUDC.getter();
  sub_1C2149E90();
  uint64_t v11 = (void *)v23;
  if ((void)v23)
  {
    uint64_t v12 = (void *)sub_1C214B460();
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = MedicationOnboardingFlowManager.title.getter();
  if (v14) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v14) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = 0xE000000000000000;
  }
  uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
  *(void *)&long long v23 = v15;
  *((void *)&v23 + 1) = v16;
  uint64_t v24 = v17;
  uint64_t v25 = v18;
  id v19 = objc_allocWithZone((Class)type metadata accessor for ScheduleStepViewController());
  uint64_t v20 = (void *)sub_1C20F24A4((uint64_t)v5, v8, v9, v10, v12, &v23);
  swift_release();

  id v21 = sub_1C2132B4C(96, a1, v20);
  return v21;
}

uint64_t sub_1C212EF34(uint64_t a1)
{
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - v3;
  sub_1C21388C8(0, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = sub_1C2148F60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  unint64_t v14 = (char *)&v20 - v13;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1C2121640((uint64_t)v7, &qword_1EA2C2CA0, MEMORY[0x1E4F66C08]);
    uint64_t result = sub_1C214B910();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    sub_1C212BB30((uint64_t)v4);
    uint64_t v15 = sub_1C2148DC0();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    id v16 = objc_allocWithZone((Class)type metadata accessor for VisualizationModificationStepViewController());
    uint64_t v17 = (void *)sub_1C1F8CD68((uint64_t)v4, v15, (uint64_t)v12);
    id v18 = sub_1C213319C(128, a1, v17);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    return (uint64_t)v18;
  }
  return result;
}

id sub_1C212F244(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1;
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v31 = (uint64_t)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v26 - v6;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if ((void)v36)
  {
    id v8 = (id)v36;
    sub_1C2133E98(v8, (uint64_t)&v39);
    uint64_t v9 = v39;
    uint64_t v10 = v40;
    uint64_t v11 = v41;
    uint64_t v12 = v42;
    unint64_t v14 = v43;
    uint64_t v13 = v44;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unint64_t v14 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v27 = v13;
  v45[0] = v9;
  v45[1] = v10;
  v45[2] = v11;
  v45[3] = v12;
  v45[4] = v14;
  v45[5] = v13;
  sub_1C212BB30((uint64_t)v7);
  uint64_t v29 = sub_1C2148DC0();
  sub_1C204FCF0(v9, v10, v11, v12, v14, v13);
  sub_1C2149E90();
  long long v26 = v36;
  uint64_t v30 = v2;
  uint64_t v15 = v37;
  uint64_t v16 = v38;
  id v28 = objc_allocWithZone((Class)type metadata accessor for NicknameNotesStepViewController());
  long long v33 = v26;
  uint64_t v34 = v15;
  uint64_t v35 = v16;
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C6FB0, (unint64_t *)&qword_1EA2C6FB8, (uint64_t)&type metadata for MedicationNicknameNotes);
  swift_allocObject();
  uint64_t v17 = sub_1C2149EB0();
  type metadata accessor for NicknameAndNotesDataSource();
  swift_allocObject();
  sub_1C204FCF0(v9, v10, v11, v12, v14, v13);
  uint64_t v18 = sub_1C204DE9C(v17, v45);
  uint64_t v19 = v31;
  sub_1C2138158((uint64_t)v7, v31, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  uint64_t v20 = sub_1C2134C7C(v19, v18, v29, (void (*)(void))sub_1C2139D54, &qword_1EA2C5E48);
  uint64_t v21 = (uint64_t)v7;
  uint64_t v22 = (void *)v20;
  swift_release();
  swift_release();
  long long v23 = v27;
  sub_1C204F928(v9, v10, v11, v12, v14, v27);
  sub_1C2121640(v21, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  id v24 = sub_1C21334C4(129, v32, v22);
  sub_1C204F928(v9, v10, v11, v12, v14, v23);

  return v24;
}

id sub_1C212F5B8(uint64_t a1)
{
  uint64_t v13 = a1;
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  uint64_t v2 = MEMORY[0x1F4188790](v1 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v13 - v5;
  sub_1C212BB30((uint64_t)&v13 - v5);
  type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v7 = sub_1C2148DC0();
  objc_allocWithZone((Class)type metadata accessor for DDIStepViewController());
  sub_1C2138158((uint64_t)v6, (uint64_t)v4, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  char v14 = 1;
  sub_1C2135018(0, (unint64_t *)&qword_1EA2C5CB8, (unint64_t *)&qword_1EA2C3100, MEMORY[0x1E4FBB390]);
  swift_allocObject();
  uint64_t v8 = sub_1C2149EB0();
  type metadata accessor for DDIOnboardingDataSource();
  swift_allocObject();
  uint64_t v9 = sub_1C2043040((uint64_t)v4, v8);
  swift_release();
  sub_1C2138158((uint64_t)v6, (uint64_t)v4, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  uint64_t v10 = (void *)sub_1C2134DD0((uint64_t)v4, v9, v7, &qword_1EA2C78C0, (uint64_t (*)(uint64_t))type metadata accessor for DDIOnboardingDataSource, (uint64_t)&off_1EC630208, &qword_1EA2C5C80);
  swift_release();
  swift_release();
  sub_1C2121640((uint64_t)v6, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  id v11 = sub_1C21337EC(160, v13, v10);

  return v11;
}

uint64_t sub_1C212F7DC@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  id v77 = a2;
  uint64_t v4 = type metadata accessor for FormStepResult();
  uint64_t v71 = *(void *)(v4 - 8);
  uint64_t v72 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v76 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for MedicationOnboardingFlowManager(0);
  MEMORY[0x1F4188790](v75);
  uint64_t v74 = (uint64_t)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1C21491B0();
  uint64_t v67 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  uint64_t v66 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v68 = (uint64_t)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v73 = (char *)&v65 - v11;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v70 = (uint64_t)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char **)((char *)&v65 - v16);
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  uint64_t v20 = (char *)&v65 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v65 - v21;
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  uint64_t v24 = MEMORY[0x1F4188790](v23 - 8);
  long long v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  id v28 = (char *)&v65 - v27;
  uint64_t v29 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  MEMORY[0x1F4188790](v29);
  uint64_t v31 = (char *)&v65 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v32 = *a1;
  uint64_t v33 = v2;
  sub_1C212169C(v2, (uint64_t)v31, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = sub_1C2121704((uint64_t)v31, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  if (!EnumCaseMultiPayload)
  {
    uint64_t v36 = (uint64_t)v28;
    uint64_t v37 = (uint64_t)v73;
    unint64_t v65 = v22;
    uint64_t v38 = (uint64_t)v76;
    uint64_t v39 = v77;
    unsigned int v40 = v32 >> 5;
    if (v32 >> 5)
    {
      if (v40 != 1)
      {
        if (v40 != 2 || v32 != 64)
        {
          unsigned char *v77 = -2;
          return result;
        }
        uint64_t v41 = (uint64_t)v26;
        uint64_t v42 = v36;
        sub_1C212BB30(v36);
        uint64_t v43 = type metadata accessor for MedicationSearchItem(0);
        uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48);
        if (v44(v42, 1, v43) == 1)
        {
          uint64_t v45 = (unint64_t *)&qword_1EA2C2CC8;
          uint64_t v46 = (void (*)(uint64_t))type metadata accessor for MedicationSearchItem;
          uint64_t v47 = v42;
        }
        else
        {
          char v55 = sub_1C202AA20();
          uint64_t result = sub_1C2121704(v42, type metadata accessor for MedicationSearchItem);
          if ((v55 & 1) == 0)
          {
LABEL_31:
            *uint64_t v39 = 0;
            return result;
          }
          sub_1C212BB30(v41);
          if (v44(v41, 1, v43) == 1)
          {
            sub_1C2121640(v41, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
            uint64_t v56 = (uint64_t)v65;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v65, 1, 1, v72);
          }
          else
          {
            uint64_t v58 = v37;
            sub_1C202AF58(v37);
            sub_1C2121704(v41, type metadata accessor for MedicationSearchItem);
            uint64_t v59 = v37;
            uint64_t v60 = v68;
            sub_1C2138158(v59, v68, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
            uint64_t v61 = v67;
            uint64_t v62 = v69;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v60, 1, v69) == 1)
            {
              uint64_t v56 = (uint64_t)v65;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v65, 1, 1, v72);
            }
            else
            {
              id v63 = v66;
              (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v66, v60, v62);
              uint64_t v56 = (uint64_t)v65;
              (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v65, v63, v62);
              uint64_t v64 = v72;
              swift_storeEnumTagMultiPayload();
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56))(v56, 0, 1, v64);
              (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v62);
            }
            sub_1C2121640(v58, &qword_1EA2C58E0, MEMORY[0x1E4F66C58]);
          }
          sub_1C2149E70();
          uint64_t v45 = &qword_1EA2C4820;
          uint64_t v46 = (void (*)(uint64_t))type metadata accessor for FormStepResult;
          uint64_t v47 = v56;
        }
        uint64_t result = sub_1C2121640(v47, v45, v46);
        goto LABEL_31;
      }
      uint64_t v48 = v33;
      uint64_t v49 = v74;
      sub_1C212169C(v48, v74, type metadata accessor for MedicationOnboardingFlowManager);
      if (v32)
      {
        uint64_t result = sub_1C2121704(v49, type metadata accessor for MedicationOnboardingFlowManager);
      }
      else
      {
        sub_1C2149E90();
        char v50 = v80;
        uint64_t result = sub_1C2121704(v49, type metadata accessor for MedicationOnboardingFlowManager);
        if (v50)
        {
          uint64_t v51 = (uint64_t)v17;
          sub_1C213019C(v17);
          uint64_t v52 = v71;
          uint64_t v53 = v72;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v51, 1, v72) == 1)
          {
            sub_1C2121640(v51, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
            uint64_t v54 = v70;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v70, 1, 1, v53);
            sub_1C2149E70();
            uint64_t result = sub_1C2121640(v54, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
            *uint64_t v39 = 1;
            return result;
          }
          sub_1C212BD30(v51, v38, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          uint64_t v79 = 0;
          sub_1C2149E70();
          uint64_t v57 = v70;
          sub_1C212169C(v38, v70, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v52 + 56))(v57, 0, 1, v53);
          sub_1C2149E70();
          sub_1C2121640(v57, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
          uint64_t result = sub_1C2121704(v38, (uint64_t (*)(void))type metadata accessor for FormStepResult);
          goto LABEL_24;
        }
      }
      *uint64_t v39 = 96;
      return result;
    }
    sub_1C2149E90();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48))(v20, 1, v72);
    if (result != 1)
    {
      uint64_t result = swift_getEnumCaseMultiPayload();
      if (result != 1)
      {
        sub_1C2149E90();
        *uint64_t v39 = v78 | 0x20;
        return sub_1C2121704((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for FormStepResult);
      }
    }
LABEL_24:
    *uint64_t v39 = 33;
    return result;
  }
  unsigned char *v77 = -2;
  return result;
}

uint64_t sub_1C213019C@<X0>(void *a1@<X8>)
{
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v24 - v3;
  uint64_t v5 = sub_1C21491B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v29 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  uint64_t v8 = type metadata accessor for FormStepResult();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8) == 1)
  {
    sub_1C2121640((uint64_t)v4, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, 1, 1, v8);
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1C2121704((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, 1, 1, v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v29, v4, v5);
  uint64_t v10 = *(void *)(sub_1C214B040() + 16);
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v29, v5);
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, 1, 1, v8);
  }
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  uint64_t v27 = v8;
  id v28 = a1;
  uint64_t v24 = swift_bridgeObjectRetain();
  uint64_t v11 = v24 + 48;
  while (1)
  {
    uint64_t v12 = *(void *)(v11 - 16);
    uint64_t v13 = sub_1C214A620();
    uint64_t v15 = v14;
    swift_bridgeObjectRetain();
    sub_1C2149180();
    uint64_t v16 = sub_1C214A620();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    if (v13 == v16 && v15 == v18) {
      break;
    }
    char v20 = sub_1C214BA80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_19;
    }
    v11 += 24;
    swift_bridgeObjectRelease();
    if (!--v10)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v8 = v27;
      a1 = v28;
      uint64_t v6 = v25;
      uint64_t v5 = v26;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_19:
  swift_bridgeObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v26);
  swift_bridgeObjectRelease();
  uint64_t v23 = v27;
  uint64_t v22 = v28;
  *id v28 = v12;
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v22, 0, 1, v23);
}

uint64_t sub_1C213051C(uint64_t a1)
{
  uint64_t v54 = a1;
  uint64_t v2 = sub_1C21497F0();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C21388C8(0, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v51 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v49 = (uint64_t)v47 - v8;
  uint64_t v9 = (void (*)(uint64_t))MEMORY[0x1E4F27990];
  sub_1C21388C8(0, &qword_1EA2C6FC0, MEMORY[0x1E4F27990]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v47 - v11;
  sub_1C21388C8(0, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v50 = (uint64_t)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v47 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)v47 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)v47 - v22;
  sub_1C2148BF0();
  sub_1C2148BE0();
  uint64_t v24 = type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  char v55 = v23;
  sub_1C2148BC0();
  swift_release();
  sub_1C2121640((uint64_t)v12, &qword_1EA2C6FC0, v9);
  uint64_t v25 = *(int *)(v24 + 20);
  uint64_t v54 = v1;
  uint64_t v26 = *(void *)(v1 + v25);
  char v27 = sub_1C2149330();
  if (v27 == 2 || (char v28 = v27, v29 = sub_1C2149360(), (v30 & 1) != 0) || v29 != 4)
  {
    sub_1C21497D0();
    uint64_t v35 = sub_1C21497E0();
    os_log_type_t v36 = sub_1C214ABD0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_1C1F0B000, v35, v36, "Wasn't able to send medication analytics in save because entry point type or suggestionsFromCHR was nil.", v37, 2u);
      MEMORY[0x1C8754730](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v52 + 8))(v4, v53);
  }
  else
  {
    sub_1C2138158((uint64_t)v55, (uint64_t)v21, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
    uint64_t v31 = sub_1C2148C30();
    uint64_t v32 = *(void *)(v31 - 8);
    uint64_t v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
    int v34 = v33(v21, 1, v31);
    swift_retain();
    v47[1] = v34;
    if (v34 == 1)
    {
      sub_1C2121640((uint64_t)v21, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
      uint64_t v53 = 0;
    }
    else
    {
      uint64_t v53 = sub_1C2148C10();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v31);
    }
    sub_1C2138158((uint64_t)v55, (uint64_t)v18, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
    int v38 = v33(v18, 1, v31);
    uint64_t v48 = v26;
    if (v38 == 1)
    {
      sub_1C2121640((uint64_t)v18, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
    }
    else
    {
      sub_1C2148C00();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v31);
    }
    LODWORD(v52) = v28 & 1;
    uint64_t v39 = v50;
    sub_1C2138158((uint64_t)v55, v50, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
    if (v33((char *)v39, 1, v31) == 1)
    {
      sub_1C2121640(v39, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
    }
    else
    {
      sub_1C2148C20();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v39, v31);
    }
    uint64_t v40 = (uint64_t)v51;
    sub_1C2148DB0();
    sub_1C2149E90();
    id v41 = v56;
    if (v56)
    {
      id v42 = objc_msgSend(v56, sel_endDateTime);

      if (v42)
      {
        sub_1C2147A60();

        uint64_t v43 = sub_1C2147AC0();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v40, 0, 1, v43);
      }
      else
      {
        uint64_t v43 = sub_1C2147AC0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v40, 1, 1, v43);
      }
      uint64_t v45 = v49;
      sub_1C1F90A80(v40, v49);
      sub_1C2147AC0();
      (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v45, 1, v43);
    }
    else
    {
      uint64_t v44 = sub_1C2147AC0();
      uint64_t v45 = v49;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v49, 1, 1, v44);
    }
    sub_1C2121640(v45, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
    sub_1C2149310();
    swift_allocObject();
    sub_1C2149300();
    sub_1C21493E0();
    sub_1C21493D0();
    swift_release();
  }
  return sub_1C2121640((uint64_t)v55, &qword_1EA2C7730, MEMORY[0x1E4F66D88]);
}

uint64_t sub_1C2130D50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_1C1F248B4(0, (unint64_t *)&qword_1EBF0C9C0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return MEMORY[0x1F4188208](a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return MEMORY[0x1F4188208](a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_1C2130E20(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  uint64_t v3 = sub_1C21497F0();
  v2[20] = v3;
  v2[21] = *(void *)(v3 - 8);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2130EF0, 0, 0);
}

uint64_t sub_1C2130EF0()
{
  uint64_t v42 = v0;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  id v1 = *(id *)(v0 + 120);
  *(void *)(v0 + 192) = v1;
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_medicationIdentifier);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = sub_1C214A5F0();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    id v15 = objc_msgSend(*(id *)(v0 + 144), sel_semanticIdentifier);
    id v16 = objc_msgSend(v15, sel_stringValue);

    uint64_t v17 = sub_1C214A5F0();
    uint64_t v19 = v18;

    if (v6)
    {
      if (v4 == v17 && v6 == v19)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_21:
        id v23 = 0;
        goto LABEL_22;
      }
      char v21 = sub_1C214BA80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_21;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v0 + 144);
    sub_1C1F12718(0, &qword_1EBF0C828);
    id v1 = sub_1C21316A0(v1, v22);
    id v23 = v1;
LABEL_22:
    *(void *)(v0 + 200) = v1;
    *(void *)(v0 + 208) = v23;
    id v26 = v1;
    sub_1C21497A0();
    char v27 = sub_1C21497E0();
    os_log_type_t v28 = sub_1C214ABB0();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = *(void *)(v0 + 184);
    uint64_t v32 = *(void *)(v0 + 160);
    uint64_t v31 = *(void *)(v0 + 168);
    if (v29)
    {
      uint64_t v38 = *(void *)(v0 + 184);
      id v39 = v26;
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v41 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      *(void *)(v0 + 136) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v41);
      sub_1C214B530();
      _os_log_impl(&dword_1C1F0B000, v27, v28, "[%s] Attempting to save medication schedule", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v34, -1, -1);
      uint64_t v35 = v33;
      id v26 = v39;
      MEMORY[0x1C8754730](v35, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v38, v32);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    os_log_type_t v36 = (void *)sub_1C2148DD0();
    *(void *)(v0 + 216) = v36;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_1C213145C;
    uint64_t v37 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_1C20B073C;
    *(void *)(v0 + 104) = &block_descriptor_9;
    *(void *)(v0 + 112) = v37;
    objc_msgSend(v36, sel_saveSchedule_completion_, v26, v0 + 80);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
  sub_1C21497A0();
  id v7 = sub_1C21497E0();
  os_log_type_t v8 = sub_1C214ABD0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 160);
  if (v9)
  {
    uint64_t v40 = *(void *)(v0 + 176);
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v41 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v0 + 128) = sub_1C1F6FD54(0xD00000000000001FLL, 0x80000001C215CE40, &v41);
    sub_1C214B530();
    _os_log_impl(&dword_1C1F0B000, v7, v8, "[%s] Unable to save medication schedule. Schedule was nil.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v14, -1, -1);
    MEMORY[0x1C8754730](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v40, v12);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24();
}

uint64_t sub_1C213145C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    id v2 = sub_1C21315F8;
  }
  else {
    id v2 = sub_1C213156C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C213156C()
{
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v3 = *(void **)(v0 + 192);
  id v2 = *(void **)(v0 + 200);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1C21315F8()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v3 = (void *)v0[25];
  id v2 = (void *)v0[26];
  uint64_t v4 = (void *)v0[24];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

id sub_1C21316A0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C21497F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v43 - v11;
  sub_1C21497A0();
  id v13 = a1;
  uint64_t v14 = sub_1C21497E0();
  os_log_type_t v15 = sub_1C214ABB0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v47 = v7;
  uint64_t v48 = v6;
  uint64_t v45 = v3;
  uint64_t v46 = v10;
  if (v16)
  {
    uint64_t v44 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v50 = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v19 = sub_1C214BC10();
    uint64_t v49 = sub_1C1F6FD54(v19, v20, &v50);
    sub_1C214B530();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    id v21 = objc_msgSend(v13, sel_medicationIdentifier);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = sub_1C214A5F0();
      unint64_t v25 = v24;
    }
    else
    {
      uint64_t v23 = 0;
      unint64_t v25 = 0xE000000000000000;
    }
    uint64_t v49 = sub_1C1F6FD54(v23, v25, &v50);
    sub_1C214B530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v14, v15, "[%s] Attempting to create new schedule. Old schedule medication identifier = %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v18, -1, -1);
    MEMORY[0x1C8754730](v17, -1, -1);

    uint64_t v6 = v48;
    id v26 = *(void (**)(char *, uint64_t))(v47 + 8);
    v26(v12, v48);
    uint64_t v10 = v46;
    a2 = v44;
  }
  else
  {

    id v26 = *(void (**)(char *, uint64_t))(v7 + 8);
    v26(v12, v6);
  }
  id v27 = objc_msgSend(v13, sel_copyScheduleForMedication_, a2);
  sub_1C21497A0();
  id v28 = v27;
  BOOL v29 = sub_1C21497E0();
  os_log_type_t v30 = sub_1C214ABB0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v50 = v32;
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v33 = sub_1C214BC10();
    uint64_t v49 = sub_1C1F6FD54(v33, v34, &v50);
    sub_1C214B530();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    id v35 = objc_msgSend(v28, sel_medicationIdentifier);
    if (v35)
    {
      os_log_type_t v36 = v35;
      uint64_t v37 = sub_1C214A5F0();
      unint64_t v39 = v38;
    }
    else
    {
      uint64_t v37 = 0;
      unint64_t v39 = 0xE000000000000000;
    }
    uint64_t v49 = sub_1C1F6FD54(v37, v39, &v50);
    sub_1C214B530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v29, v30, "[%s] Created new schedule with medication identifier = %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v32, -1, -1);
    MEMORY[0x1C8754730](v31, -1, -1);

    uint64_t v40 = v46;
    uint64_t v41 = v48;
  }
  else
  {

    uint64_t v40 = v10;
    uint64_t v41 = v6;
  }
  v26(v40, v41);
  return v28;
}

id sub_1C2131B4C(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  int v7 = a1;
  uint64_t v8 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v29 - v12;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v14 - 8);
  BOOL v16 = (char *)&v29 - v15;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73870);
  if (v7 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    uint64_t v17 = SpecificationStep.headerImage.getter();
    uint64_t v29 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    uint64_t v17 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v16);
    sub_1C2121640((uint64_t)v16, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v29 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(a2, (uint64_t)v13, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v8 + 20));
  sub_1C213A37C(0, &qword_1EA2C7740, (uint64_t (*)(uint64_t))type metadata accessor for ManualNameDataSource, (uint64_t)&off_1EC62F4A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for OnboardingStepViewController);
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v13, v20, v22, v29, v19, v17, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211C6E8, (uint64_t)&unk_1F1D7AD80, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2122274);

  swift_release();
  return v27;
}

id sub_1C2131EAC(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73900);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2138C60();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211CF64, (uint64_t)&unk_1F1D7AF10, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2122924);

  swift_release();
  return v27;
}

id sub_1C21321D4(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73950);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C21389E4();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211CB10, (uint64_t)&unk_1F1D7AE48, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C21225CC);

  swift_release();
  return v27;
}

id sub_1C21324FC(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D739F0);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2139160();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211D3B8, (uint64_t)&unk_1F1D7B0C8, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2122C7C);

  swift_release();
  return v27;
}

id sub_1C2132824(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D739A0);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2138EC0();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211D7E0, (uint64_t)&unk_1F1D7AFD8, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2122FD4);

  swift_release();
  return v27;
}

id sub_1C2132B4C(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73A40);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2139464();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211DC08, (uint64_t)&unk_1F1D7B190, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C212332C);

  swift_release();
  return v27;
}

id sub_1C2132E74(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73A90);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C213963C();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211E038, (uint64_t)&unk_1F1D7B258, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2123684);

  swift_release();
  return v27;
}

id sub_1C213319C(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73AE0);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2139810();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211E48C, (uint64_t)&unk_1F1D7B320, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C21239DC);

  swift_release();
  return v27;
}

id sub_1C21334C4(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  uint64_t v29 = a2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v29 - v11;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v29 - v14;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73B30);
  if (v6 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    BOOL v16 = SpecificationStep.headerImage.getter();
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    BOOL v16 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v15);
    sub_1C2121640((uint64_t)v15, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v17 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(v29, (uint64_t)v12, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v10, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v7 + 20));
  sub_1C2139A34();
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v12, v20, v22, v17, v19, v16, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211E8E0, (uint64_t)&unk_1F1D7B3E8, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C2123D34);

  swift_release();
  return v27;
}

id sub_1C21337EC(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v31 = a3;
  int v7 = a1;
  uint64_t v8 = type metadata accessor for MedicationOnboardingFlowManager(0);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v29 - v12;
  sub_1C21388C8(0, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
  MEMORY[0x1F4188790](v14 - 8);
  BOOL v16 = (char *)&v29 - v15;
  int v30 = sub_1C20BFC68(a1, (uint64_t)&unk_1F1D73BB8);
  if (v7 == 128 || (a1 & 0xE0) != 0x80)
  {
    char v33 = a1;
    uint64_t v17 = SpecificationStep.headerImage.getter();
    uint64_t v29 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    sub_1C2149E90();
    uint64_t v17 = (void *)sub_1C1F647E8(80.0, 80.0, 1, (uint64_t)v16);
    sub_1C2121640((uint64_t)v16, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
    uint64_t v29 = MedicationOnboardingFlowManager.subtitle.getter();
    uint64_t v19 = v18;
  }
  sub_1C212169C(a2, (uint64_t)v13, type metadata accessor for MedicationOnboardingFlowManager);
  char v32 = a1;
  uint64_t v20 = SpecificationStep.title.getter();
  uint64_t v22 = v21;
  sub_1C212169C(v4, (uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
  if (v22)
  {
    sub_1C2121704((uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
  }
  else
  {
    uint64_t v20 = MedicationOnboardingFlowManager.title.getter();
    uint64_t v22 = v23;
    sub_1C2121704((uint64_t)v11, type metadata accessor for MedicationOnboardingFlowManager);
    if (!v22)
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0xE000000000000000;
    }
  }
  uint64_t v24 = *(void *)(v4 + *(int *)(v8 + 20));
  sub_1C213A37C(0, &qword_1EA2C78A8, (uint64_t (*)(uint64_t))type metadata accessor for DDIOnboardingDataSource, (uint64_t)&off_1EC630208, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for OnboardingStepViewController);
  objc_allocWithZone(v25);
  swift_retain();
  id v26 = v31;
  id v27 = sub_1C213857C(v26, (uint64_t)v13, v20, v22, v29, v19, v17, (v30 & 1) == 0, v24, (void (*)(uint64_t))sub_1C211ED08, (uint64_t)&unk_1F1D7B4D8, (uint64_t)sub_1C213835C, (void (*)(uint64_t))sub_1C212408C);

  swift_release();
  return v27;
}

uint64_t sub_1C2133B4C(uint64_t a1)
{
  sub_1C21388C8(0, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v17 - v3;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v5 - 8);
  int v7 = (void *)((char *)v17 - v6);
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  uint64_t v8 = type metadata accessor for FormStepResult();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    sub_1C2121640((uint64_t)v7, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = *v7;
      uint64_t v10 = sub_1C2148DC0();
      objc_allocWithZone((Class)type metadata accessor for ManualStrengthStepViewController(0));
      memset(v17, 0, sizeof(v17));
      char v18 = -1;
      sub_1C2135018(0, (unint64_t *)&qword_1EA2C3C20, (unint64_t *)&qword_1EA2C3C28, (uint64_t)&type metadata for StrengthStepResult);
      swift_allocObject();
      uint64_t v11 = sub_1C2149EB0();
      type metadata accessor for ManualStrengthDataSource();
      swift_allocObject();
      uint64_t v12 = sub_1C200EF48(v11, v9);
      uint64_t v13 = type metadata accessor for MedicationSearchItem(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
      uint64_t v14 = (void *)sub_1C2134C7C((uint64_t)v4, v12, v10, (void (*)(void))sub_1C21393D0, &qword_1EA2C5400);
      swift_release();
      swift_release();
      id v15 = sub_1C21324FC(33, a1, v14);

      return (uint64_t)v15;
    }
    sub_1C2121704((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FormStepResult);
  }
  uint64_t result = sub_1C214B910();
  __break(1u);
  return result;
}

id sub_1C2133E98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FormStepResult();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (uint64_t *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v24 - v9;
  sub_1C21388C8(0, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v24 - v12;
  type metadata accessor for MedicationOnboardingFlowManager(0);
  sub_1C2149E90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    sub_1C2121640((uint64_t)v13, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    uint64_t v14 = 0;
    BOOL v15 = 1;
  }
  else
  {
    sub_1C212169C((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    sub_1C2121640((uint64_t)v13, &qword_1EA2C4820, (void (*)(uint64_t))type metadata accessor for FormStepResult);
    sub_1C212169C((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for FormStepResult);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    BOOL v15 = EnumCaseMultiPayload != 1;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = *v8;
    }
    else
    {
      sub_1C2121704((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for FormStepResult);
      uint64_t v14 = 0;
    }
    sub_1C2121704((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for FormStepResult);
  }
  id v17 = MedicationOnboardingFlowManager.currentMedicationUDC.getter();
  uint64_t v18 = sub_1C214AFC0();
  char v20 = v19;

  sub_1C2149E90();
  uint64_t v21 = v25;
  if (v25)
  {
    uint64_t v22 = sub_1C214B460();
  }
  else
  {
    uint64_t v22 = 0;
  }
  id result = a1;
  *(void *)a2 = v14;
  *(unsigned char *)(a2 + 8) = v15;
  *(void *)(a2 + 16) = v18;
  *(unsigned char *)(a2 + 24) = v20 & 1;
  *(void *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = result;
  return result;
}

id sub_1C2134160(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    uint64_t v13 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (a5)
    {
LABEL_3:
      uint64_t v14 = (void *)sub_1C214A5B0();
      swift_bridgeObjectRelease();
      if (a7) {
        goto LABEL_4;
      }
LABEL_8:
      BOOL v15 = 0;
      if (a8) {
        goto LABEL_5;
      }
LABEL_9:
      BOOL v16 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v14 = 0;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_4:
  BOOL v15 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_9;
  }
LABEL_5:
  sub_1C1F12718(0, (unint64_t *)&qword_1EA2C2D08);
  BOOL v16 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();
LABEL_10:
  id v17 = objc_msgSend(v8, sel_initWithOntologyCoding_userSpecifiedName_userSpecifiedNotes_medicationVisualizationConfig_freeTextProperties_, a1, v13, v14, v15, v16);

  return v17;
}

void sub_1C21342A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1C8754850](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_1C2148AA0();
  }
}

uint64_t _s19HealthMedicationsUI31MedicationOnboardingFlowManagerV9EntryModeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C2147B20();
  uint64_t v77 = *(void *)(v4 - 8);
  uint64_t v78 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v74 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v76 = (char *)&v71 - v7;
  uint64_t v75 = (int *)type metadata accessor for MedicationSearchItem(0);
  uint64_t v8 = MEMORY[0x1F4188790](v75);
  uint64_t v73 = (uint64_t)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v72 = (uint64_t)&v71 - v10;
  uint64_t v11 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (void **)((char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  id v17 = (void **)((char *)&v71 - v16);
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  char v20 = (char *)&v71 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v71 - v21;
  sub_1C21381C4();
  uint64_t v24 = MEMORY[0x1F4188790](v23 - 8);
  id v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = (void **)&v26[*(int *)(v24 + 56)];
  sub_1C212169C(a1, (uint64_t)v26, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  sub_1C212169C(a2, (uint64_t)v27, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1C212169C((uint64_t)v26, (uint64_t)v20, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_1C2121704((uint64_t)v20, type metadata accessor for MedicationSearchItem);
        goto LABEL_29;
      }
      uint64_t v28 = (uint64_t)v27;
      uint64_t v29 = v73;
      sub_1C212BD30(v28, v73, type metadata accessor for MedicationSearchItem);
      if ((_s19HealthMedicationsUI20MedicationSearchItemV6SourceO2eeoiySbAE_AEtFZ_0((uint64_t)v20, v29) & 1) != 0
        && *(void *)&v20[v75[5]] == *(void *)(v29 + v75[5]))
      {
        if ((uint64_t v30 = v75[6],
              uint64_t v31 = *(void *)&v20[v30],
              uint64_t v32 = *(void *)&v20[v30 + 8],
              char v33 = (void *)(v29 + v30),
              v31 == *v33)
          && v32 == v33[1]
          || (sub_1C214BA80() & 1) != 0)
        {
          if ((uint64_t v34 = v75[7],
                uint64_t v35 = *(void *)&v20[v34],
                uint64_t v36 = *(void *)&v20[v34 + 8],
                uint64_t v37 = (void *)(v29 + v34),
                v35 == *v37)
            && v36 == v37[1]
            || (sub_1C214BA80() & 1) != 0)
          {
            sub_1C2121704(v29, type metadata accessor for MedicationSearchItem);
            uint64_t v38 = (uint64_t)v20;
            goto LABEL_40;
          }
        }
      }
      sub_1C2121704(v29, type metadata accessor for MedicationSearchItem);
      uint64_t v58 = (uint64_t)v20;
      goto LABEL_42;
    case 2u:
      sub_1C212169C((uint64_t)v26, (uint64_t)v17, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      unint64_t v39 = *v17;
      sub_1C20B6C78();
      uint64_t v41 = *(int *)(v40 + 48);
      uint64_t v42 = (char *)v17 + v41;
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        (*(void (**)(char *, uint64_t))(v77 + 8))((char *)v17 + v41, v78);

        goto LABEL_29;
      }
      uint64_t v43 = *v27;
      uint64_t v44 = v77;
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v77 + 32);
      uint64_t v46 = v78;
      v45(v76, v42, v78);
      uint64_t v47 = v74;
      v45(v74, (char *)v27 + v41, v46);
      sub_1C1F12718(0, (unint64_t *)&qword_1EA2C4AA0);
      char v48 = sub_1C214B220();

      if (v48)
      {
        uint64_t v49 = v76;
        char v50 = sub_1C2147AF0();
        uint64_t v51 = *(void (**)(char *, uint64_t))(v44 + 8);
        v51(v47, v46);
        v51(v49, v46);
        goto LABEL_47;
      }
      uint64_t v69 = *(void (**)(char *, uint64_t))(v44 + 8);
      v69(v47, v46);
      v69(v76, v46);
      goto LABEL_46;
    case 3u:
      sub_1C212169C((uint64_t)v26, (uint64_t)v14, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      uint64_t v53 = *v14;
      uint64_t v52 = v14[1];
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      uint64_t v54 = v27[1];
      if (!v52)
      {
        uint64_t v57 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode;
        if (!v54)
        {
LABEL_49:
          char v50 = 1;
          goto LABEL_48;
        }
LABEL_45:
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
      if (!v54) {
        goto LABEL_45;
      }
      if (v53 != *v27 || v52 != v54)
      {
        char v56 = sub_1C214BA80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v57 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode;
        if ((v56 & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_49;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_51:
      char v50 = 1;
LABEL_47:
      uint64_t v57 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode;
LABEL_48:
      sub_1C2121704((uint64_t)v26, v57);
      return v50 & 1;
    default:
      sub_1C212169C((uint64_t)v26, (uint64_t)v22, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_1C2121704((uint64_t)v22, type metadata accessor for MedicationSearchItem);
LABEL_29:
        char v50 = 0;
        uint64_t v57 = (uint64_t (*)(void))sub_1C21381C4;
        goto LABEL_48;
      }
      uint64_t v59 = (uint64_t)v27;
      uint64_t v60 = v72;
      sub_1C212BD30(v59, v72, type metadata accessor for MedicationSearchItem);
      if ((_s19HealthMedicationsUI20MedicationSearchItemV6SourceO2eeoiySbAE_AEtFZ_0((uint64_t)v22, v60) & 1) != 0
        && *(void *)&v22[v75[5]] == *(void *)(v60 + v75[5]))
      {
        if ((uint64_t v61 = v75[6],
              uint64_t v62 = *(void *)&v22[v61],
              uint64_t v63 = *(void *)&v22[v61 + 8],
              uint64_t v64 = (void *)(v60 + v61),
              v62 == *v64)
          && v63 == v64[1]
          || (sub_1C214BA80() & 1) != 0)
        {
          if ((uint64_t v65 = v75[7],
                uint64_t v66 = *(void *)&v22[v65],
                uint64_t v67 = *(void *)&v22[v65 + 8],
                uint64_t v68 = (void *)(v60 + v65),
                v66 == *v68)
            && v67 == v68[1]
            || (sub_1C214BA80() & 1) != 0)
          {
            sub_1C2121704(v60, type metadata accessor for MedicationSearchItem);
            uint64_t v38 = (uint64_t)v22;
LABEL_40:
            sub_1C2121704(v38, type metadata accessor for MedicationSearchItem);
            goto LABEL_51;
          }
        }
      }
      sub_1C2121704(v60, type metadata accessor for MedicationSearchItem);
      uint64_t v58 = (uint64_t)v22;
LABEL_42:
      sub_1C2121704(v58, type metadata accessor for MedicationSearchItem);
LABEL_46:
      char v50 = 0;
      goto LABEL_47;
  }
}

uint64_t sub_1C2134AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2134B24(a1, a2, a3, (void (*)(void))sub_1C2138BCC);
}

uint64_t sub_1C2134B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2134B24(a1, a2, a3, (void (*)(void))sub_1C21390CC);
}

uint64_t sub_1C2134B24(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = v4;
  sub_1C2138158(a1, v6 + qword_1EA2C7D08, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  a4(0);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = *(void *)(a2 + qword_1EA2C4738);
  *(void *)(v6 + qword_1EA2C4208) = v10;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = v11;
  *(void *)(v6 + qword_1EA2C4210) = a3;
  sub_1C2148820();
  sub_1C1F24848();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C214FCD0;
  uint64_t v13 = MEMORY[0x1E4F66470];
  *(void *)(v12 + 32) = a2;
  *(void *)(v12 + 40) = v13;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_1C2148850();
  uint64_t v14 = sub_1C2148AC0();
  sub_1C2121640(a1, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  return v14;
}

uint64_t sub_1C2134C7C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void *a5)
{
  uint64_t v8 = v5;
  sub_1C2138158(a1, v8 + qword_1EA2C7D08, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  a4(0);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = *(void *)(a2 + *a5);
  *(void *)(v8 + qword_1EA2C4208) = v12;
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = v13;
  *(void *)(v8 + qword_1EA2C4210) = a3;
  sub_1C2148820();
  sub_1C1F24848();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1C214FCD0;
  uint64_t v15 = MEMORY[0x1E4F66470];
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = v15;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_1C2148850();
  uint64_t v16 = sub_1C2148AC0();
  sub_1C2121640(a1, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  return v16;
}

uint64_t sub_1C2134DD0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t), uint64_t a6, void *a7)
{
  uint64_t v12 = v7;
  sub_1C2138158(a1, v12 + qword_1EA2C7D08, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  sub_1C213A37C(0, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = *(void *)(a2 + *a7);
  *(void *)(v12 + qword_1EA2C4208) = v16;
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = v17;
  *(void *)(v12 + qword_1EA2C4210) = a3;
  sub_1C2148820();
  sub_1C1F24848();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1C214FCD0;
  uint64_t v19 = MEMORY[0x1E4F66470];
  *(void *)(v18 + 32) = a2;
  *(void *)(v18 + 40) = v19;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_1C2148850();
  uint64_t v20 = sub_1C2148AC0();
  sub_1C2121640(a1, (unint64_t *)&qword_1EA2C2CC8, (void (*)(uint64_t))type metadata accessor for MedicationSearchItem);
  return v20;
}

void sub_1C2134F48(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1C1F12718(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1C2134FB0(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1C21388C8(255, a3, a4);
    unint64_t v5 = sub_1C2149EA0();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1C2135018(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_1C2139DE8(255, a3, a4, MEMORY[0x1E4FBB718]);
    unint64_t v5 = sub_1C2149EA0();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1C2135094(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  if (!*a2)
  {
    sub_1C2134F48(255, a3, a4, a5, MEMORY[0x1E4FBB718]);
    unint64_t v6 = sub_1C2149EA0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1C2135114()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

char *initializeBufferWithCopyOfBuffer for MedicationOnboardingFlowManager(char *a1, char **a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = &v7[(v5 + 16) & ~(unint64_t)v5];
  }
  else
  {
    type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_10;
        }
        goto LABEL_9;
      case 2u:
        uint64_t v8 = *a2;
        *(void *)uint64_t v4 = *a2;
        sub_1C20B6C78();
        uint64_t v10 = *(int *)(v9 + 48);
        uint64_t v11 = &v4[v10];
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_1C2147B20();
        uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        uint64_t v15 = v8;
        v14(v11, v12, v13);
        break;
      case 3u:
        uint64_t v16 = a2[1];
        *(void *)uint64_t v4 = *a2;
        *((void *)v4 + 1) = v16;
        swift_bridgeObjectRetain();
        break;
      default:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_9:
          uint64_t v17 = sub_1C21490F0();
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v17 - 8) + 16))(v4, a2, v17);
        }
        else
        {
LABEL_10:
          uint64_t v18 = *a2;
          *(void *)uint64_t v4 = *a2;
          sub_1C1F30C40();
          uint64_t v20 = *(int *)(v19 + 48);
          uint64_t v44 = &v4[v20];
          uint64_t v21 = (char *)a2 + v20;
          uint64_t v22 = sub_1C21491B0();
          uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
          uint64_t v24 = v18;
          v23(v44, v21, v22);
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v25 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void *)&v4[v25[5]] = *(char **)((char *)a2 + v25[5]);
        uint64_t v26 = v25[6];
        id v27 = &v4[v26];
        uint64_t v28 = (uint64_t *)((char *)a2 + v26);
        uint64_t v30 = *v28;
        uint64_t v29 = v28[1];
        *(void *)id v27 = v30;
        *((void *)v27 + 1) = v29;
        uint64_t v31 = v25[7];
        uint64_t v32 = &v4[v31];
        char v33 = (char **)((char *)a2 + v31);
        uint64_t v34 = v33[1];
        *(void *)uint64_t v32 = *v33;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v35 = a3[6];
    *(void *)&v4[a3[5]] = *(char **)((char *)a2 + a3[5]);
    *(void *)&v4[v35] = *(char **)((char *)a2 + v35);
    uint64_t v36 = a3[8];
    v4[a3[7]] = *((unsigned char *)a2 + a3[7]);
    v4[v36] = *((unsigned char *)a2 + v36);
    uint64_t v37 = a3[10];
    *(void *)&v4[a3[9]] = *(char **)((char *)a2 + a3[9]);
    *(void *)&v4[v37] = *(char **)((char *)a2 + v37);
    uint64_t v38 = a3[12];
    *(void *)&v4[a3[11]] = *(char **)((char *)a2 + a3[11]);
    *(void *)&v4[v38] = *(char **)((char *)a2 + v38);
    uint64_t v39 = a3[14];
    *(void *)&v4[a3[13]] = *(char **)((char *)a2 + a3[13]);
    *(void *)&v4[v39] = *(char **)((char *)a2 + v39);
    uint64_t v40 = a3[16];
    *(void *)&v4[a3[15]] = *(char **)((char *)a2 + a3[15]);
    *(void *)&v4[v40] = *(char **)((char *)a2 + v40);
    uint64_t v41 = a3[18];
    *(void *)&v4[a3[17]] = *(char **)((char *)a2 + a3[17]);
    *(void *)&v4[v41] = *(char **)((char *)a2 + v41);
    uint64_t v42 = a3[20];
    *(void *)&v4[a3[19]] = *(char **)((char *)a2 + a3[19]);
    *(void *)&v4[v42] = *(char **)((char *)a2 + v42);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for MedicationOnboardingFlowManager(id *a1)
{
  type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v2 = sub_1C21490F0();
        (*(void (**)(id *, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
      }
      else
      {

        sub_1C1F30C40();
        uint64_t v7 = (char *)a1 + *(int *)(v6 + 48);
        uint64_t v8 = sub_1C21491B0();
        (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
      }
      type metadata accessor for MedicationSearchItem(0);
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 2u:

      sub_1C20B6C78();
      uint64_t v4 = (char *)a1 + *(int *)(v3 + 48);
      uint64_t v5 = sub_1C2147B20();
      (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      break;
    case 3u:
LABEL_7:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for MedicationOnboardingFlowManager(void *a1, uint64_t a2, int *a3)
{
  type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    case 2u:
      uint64_t v6 = *(void **)a2;
      *a1 = *(void *)a2;
      sub_1C20B6C78();
      uint64_t v8 = *(int *)(v7 + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = a2 + v8;
      uint64_t v11 = sub_1C2147B20();
      uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
      id v13 = v6;
      v12(v9, v10, v11);
      break;
    case 3u:
      uint64_t v14 = *(void *)(a2 + 8);
      *a1 = *(void *)a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
      break;
    default:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_7:
        uint64_t v15 = sub_1C21490F0();
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
      }
      else
      {
LABEL_8:
        uint64_t v16 = *(void **)a2;
        *a1 = *(void *)a2;
        sub_1C1F30C40();
        uint64_t v18 = *(int *)(v17 + 48);
        uint64_t v42 = (char *)a1 + v18;
        uint64_t v19 = a2 + v18;
        uint64_t v20 = sub_1C21491B0();
        uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
        id v22 = v16;
        v21(v42, v19, v20);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v23 = (int *)type metadata accessor for MedicationSearchItem(0);
      *(void *)((char *)a1 + v23[5]) = *(void *)(a2 + v23[5]);
      uint64_t v24 = v23[6];
      uint64_t v25 = (void *)((char *)a1 + v24);
      uint64_t v26 = (uint64_t *)(a2 + v24);
      uint64_t v28 = *v26;
      uint64_t v27 = v26[1];
      *uint64_t v25 = v28;
      v25[1] = v27;
      uint64_t v29 = v23[7];
      uint64_t v30 = (void *)((char *)a1 + v29);
      uint64_t v31 = (void *)(a2 + v29);
      uint64_t v32 = v31[1];
      *uint64_t v30 = *v31;
      v30[1] = v32;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v33 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)((char *)a1 + v33) = *(void *)(a2 + v33);
  uint64_t v34 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *((unsigned char *)a1 + v34) = *(unsigned char *)(a2 + v34);
  uint64_t v35 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)((char *)a1 + v35) = *(void *)(a2 + v35);
  uint64_t v36 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)((char *)a1 + v36) = *(void *)(a2 + v36);
  uint64_t v37 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)((char *)a1 + v37) = *(void *)(a2 + v37);
  uint64_t v38 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)((char *)a1 + v38) = *(void *)(a2 + v38);
  uint64_t v39 = a3[18];
  *(void *)((char *)a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)((char *)a1 + v39) = *(void *)(a2 + v39);
  uint64_t v40 = a3[20];
  *(void *)((char *)a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)((char *)a1 + v40) = *(void *)(a2 + v40);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MedicationOnboardingFlowManager(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1C2121704((uint64_t)a1, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
    type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_9;
        }
        goto LABEL_8;
      case 2u:
        uint64_t v6 = (void *)*a2;
        *a1 = *a2;
        sub_1C20B6C78();
        uint64_t v8 = *(int *)(v7 + 48);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_1C2147B20();
        uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
        id v13 = v6;
        v12(v9, v10, v11);
        break;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      default:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_8:
          uint64_t v14 = sub_1C21490F0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        }
        else
        {
LABEL_9:
          uint64_t v15 = (void *)*a2;
          *a1 = *a2;
          sub_1C1F30C40();
          uint64_t v17 = *(int *)(v16 + 48);
          uint64_t v30 = (char *)a1 + v17;
          uint64_t v18 = (char *)a2 + v17;
          uint64_t v19 = sub_1C21491B0();
          uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
          id v21 = v15;
          v20(v30, v18, v19);
        }
        swift_storeEnumTagMultiPayload();
        id v22 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void *)((char *)a1 + v22[5]) = *(void *)((char *)a2 + v22[5]);
        uint64_t v23 = v22[6];
        uint64_t v24 = (void *)((char *)a1 + v23);
        uint64_t v25 = (void *)((char *)a2 + v23);
        void *v24 = *v25;
        v24[1] = v25[1];
        uint64_t v26 = v22[7];
        uint64_t v27 = (void *)((char *)a1 + v26);
        uint64_t v28 = (void *)((char *)a2 + v26);
        *uint64_t v27 = *v28;
        v27[1] = v28[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for MedicationOnboardingFlowManager(void *a1, void *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      *a1 = *a2;
      sub_1C20B6C78();
      uint64_t v10 = *(int *)(v9 + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_1C2147B20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      goto LABEL_13;
    case 1:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_5;
      }
      goto LABEL_10;
    case 0:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_5:
        uint64_t v8 = sub_1C21490F0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
LABEL_11:
        swift_storeEnumTagMultiPayload();
        uint64_t v19 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void *)((char *)a1 + v19[5]) = *(void *)((char *)a2 + v19[5]);
        *(_OWORD *)((char *)a1 + v19[6]) = *(_OWORD *)((char *)a2 + v19[6]);
        *(_OWORD *)((char *)a1 + v19[7]) = *(_OWORD *)((char *)a2 + v19[7]);
        goto LABEL_12;
      }
LABEL_10:
      *a1 = *a2;
      sub_1C1F30C40();
      uint64_t v15 = *(int *)(v14 + 48);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_1C21491B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      goto LABEL_11;
  }
  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
LABEL_13:
  uint64_t v20 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  uint64_t v21 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  uint64_t v22 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  uint64_t v23 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  uint64_t v24 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  uint64_t v25 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  uint64_t v26 = a3[18];
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
  uint64_t v27 = a3[20];
  *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
  *(void *)((char *)a1 + v27) = *(void *)((char *)a2 + v27);
  return a1;
}

void *assignWithTake for MedicationOnboardingFlowManager(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1C2121704((uint64_t)a1, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
    uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        *a1 = *a2;
        sub_1C20B6C78();
        uint64_t v9 = *(int *)(v8 + 48);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_1C2147B20();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
LABEL_13:
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      case 1:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_9:
          uint64_t v13 = sub_1C21490F0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
LABEL_12:
          swift_storeEnumTagMultiPayload();
          uint64_t v19 = (int *)type metadata accessor for MedicationSearchItem(0);
          *(void *)((char *)a1 + v19[5]) = *(void *)((char *)a2 + v19[5]);
          *(_OWORD *)((char *)a1 + v19[6]) = *(_OWORD *)((char *)a2 + v19[6]);
          *(_OWORD *)((char *)a1 + v19[7]) = *(_OWORD *)((char *)a2 + v19[7]);
          goto LABEL_13;
        }
LABEL_11:
        *a1 = *a2;
        sub_1C1F30C40();
        uint64_t v15 = *(int *)(v14 + 48);
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (char *)a2 + v15;
        uint64_t v18 = sub_1C21491B0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        goto LABEL_12;
      case 0:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1) {
          goto LABEL_9;
        }
        goto LABEL_11;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_14:
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_release();
  uint64_t v20 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  uint64_t v21 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  swift_release();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_release();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_release();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_release();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_release();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  swift_release();
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  swift_release();
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_release();
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  swift_release();
  *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
  swift_release();
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicationOnboardingFlowManager(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2136AF8);
}

uint64_t sub_1C2136AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
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

uint64_t storeEnumTagSinglePayload for MedicationOnboardingFlowManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2136BCC);
}

uint64_t sub_1C2136BCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(0);
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

uint64_t sub_1C2136C88()
{
  uint64_t result = type metadata accessor for MedicationOnboardingFlowManager.EntryMode(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for MedicationOnboardingFlowManager.EntryMode(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *(void *)a1 = *a2;
    a1 = &v6[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_10;
        }
        goto LABEL_9;
      case 2u:
        uint64_t v7 = *a2;
        *(void *)a1 = *a2;
        sub_1C20B6C78();
        uint64_t v9 = *(int *)(v8 + 48);
        unint64_t v10 = &a1[v9];
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_1C2147B20();
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        uint64_t v14 = v7;
        v13(v10, v11, v12);
        break;
      case 3u:
        uint64_t v15 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v15;
        swift_bridgeObjectRetain();
        break;
      default:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_9:
          uint64_t v16 = sub_1C21490F0();
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        }
        else
        {
LABEL_10:
          uint64_t v17 = *a2;
          *(void *)a1 = *a2;
          sub_1C1F30C40();
          uint64_t v19 = *(int *)(v18 + 48);
          uint64_t v20 = &a1[v19];
          uint64_t v21 = (char *)a2 + v19;
          uint64_t v22 = sub_1C21491B0();
          uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
          uint64_t v24 = v17;
          v23(v20, v21, v22);
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v25 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void *)&a1[v25[5]] = *(char **)((char *)a2 + v25[5]);
        uint64_t v26 = v25[6];
        uint64_t v27 = &a1[v26];
        uint64_t v28 = (uint64_t *)((char *)a2 + v26);
        uint64_t v30 = *v28;
        uint64_t v29 = v28[1];
        *(void *)uint64_t v27 = v30;
        *((void *)v27 + 1) = v29;
        uint64_t v31 = v25[7];
        uint64_t v32 = &a1[v31];
        uint64_t v33 = (char **)((char *)a2 + v31);
        uint64_t v34 = v33[1];
        *(void *)uint64_t v32 = *v33;
        *((void *)v32 + 1) = v34;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MedicationOnboardingFlowManager.EntryMode(id *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v3 = sub_1C21490F0();
        (*(void (**)(id *, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      }
      else
      {

        sub_1C1F30C40();
        uint64_t v9 = (char *)a1 + *(int *)(v8 + 48);
        uint64_t v10 = sub_1C21491B0();
        (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
      }
      type metadata accessor for MedicationSearchItem(0);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    case 2:

      sub_1C20B6C78();
      int v5 = (char *)a1 + *(int *)(v4 + 48);
      uint64_t v6 = sub_1C2147B20();
      uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
      uint64_t result = v7(v5, v6);
      break;
    case 3:
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for MedicationOnboardingFlowManager.EntryMode(void *a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    case 2u:
      uint64_t v4 = *(void **)a2;
      *a1 = *(void *)a2;
      sub_1C20B6C78();
      uint64_t v6 = *(int *)(v5 + 48);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = a2 + v6;
      uint64_t v9 = sub_1C2147B20();
      uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
      id v11 = v4;
      v10(v7, v8, v9);
      break;
    case 3u:
      uint64_t v12 = *(void *)(a2 + 8);
      *a1 = *(void *)a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
      break;
    default:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_7:
        uint64_t v13 = sub_1C21490F0();
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      }
      else
      {
LABEL_8:
        uint64_t v14 = *(void **)a2;
        *a1 = *(void *)a2;
        sub_1C1F30C40();
        uint64_t v16 = *(int *)(v15 + 48);
        uint64_t v17 = (char *)a1 + v16;
        uint64_t v18 = a2 + v16;
        uint64_t v19 = sub_1C21491B0();
        uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
        id v21 = v14;
        v20(v17, v18, v19);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v22 = (int *)type metadata accessor for MedicationSearchItem(0);
      *(void *)((char *)a1 + v22[5]) = *(void *)(a2 + v22[5]);
      uint64_t v23 = v22[6];
      uint64_t v24 = (void *)((char *)a1 + v23);
      uint64_t v25 = (uint64_t *)(a2 + v23);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      void *v24 = v27;
      v24[1] = v26;
      uint64_t v28 = v22[7];
      uint64_t v29 = (void *)((char *)a1 + v28);
      uint64_t v30 = (void *)(a2 + v28);
      uint64_t v31 = v30[1];
      *uint64_t v29 = *v30;
      v29[1] = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **assignWithCopy for MedicationOnboardingFlowManager.EntryMode(void **a1, void **a2)
{
  if (a1 != a2)
  {
    sub_1C2121704((uint64_t)a1, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_9;
        }
        goto LABEL_8;
      case 2u:
        uint64_t v4 = *a2;
        *a1 = *a2;
        sub_1C20B6C78();
        uint64_t v6 = *(int *)(v5 + 48);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_1C2147B20();
        uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
        id v11 = v4;
        v10(v7, v8, v9);
        break;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      default:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_8:
          uint64_t v12 = sub_1C21490F0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        }
        else
        {
LABEL_9:
          uint64_t v13 = *a2;
          *a1 = *a2;
          sub_1C1F30C40();
          uint64_t v15 = *(int *)(v14 + 48);
          uint64_t v16 = (char *)a1 + v15;
          uint64_t v17 = (char *)a2 + v15;
          uint64_t v18 = sub_1C21491B0();
          uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
          id v20 = v13;
          v19(v16, v17, v18);
        }
        swift_storeEnumTagMultiPayload();
        id v21 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void **)((char *)a1 + v21[5]) = *(void **)((char *)a2 + v21[5]);
        uint64_t v22 = v21[6];
        uint64_t v23 = (void **)((char *)a1 + v22);
        uint64_t v24 = (void **)((char *)a2 + v22);
        *uint64_t v23 = *v24;
        v23[1] = v24[1];
        uint64_t v25 = v21[7];
        uint64_t v26 = (void **)((char *)a1 + v25);
        uint64_t v27 = (void **)((char *)a2 + v25);
        *uint64_t v26 = *v27;
        v26[1] = v27[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for MedicationOnboardingFlowManager.EntryMode(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      *a1 = *a2;
      sub_1C20B6C78();
      uint64_t v9 = *(int *)(v8 + 48);
      uint64_t v10 = (char *)a1 + v9;
      id v11 = (char *)a2 + v9;
      uint64_t v12 = sub_1C2147B20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_5;
      }
      goto LABEL_10;
    case 0:
      type metadata accessor for MedicationSearchItem.Source(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_5:
        uint64_t v7 = sub_1C21490F0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
LABEL_11:
        swift_storeEnumTagMultiPayload();
        uint64_t v18 = (int *)type metadata accessor for MedicationSearchItem(0);
        *(void *)((char *)a1 + v18[5]) = *(void *)((char *)a2 + v18[5]);
        *(_OWORD *)((char *)a1 + v18[6]) = *(_OWORD *)((char *)a2 + v18[6]);
        *(_OWORD *)((char *)a1 + v18[7]) = *(_OWORD *)((char *)a2 + v18[7]);
        goto LABEL_12;
      }
LABEL_10:
      *a1 = *a2;
      sub_1C1F30C40();
      uint64_t v14 = *(int *)(v13 + 48);
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_1C21491B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
      goto LABEL_11;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithTake for MedicationOnboardingFlowManager.EntryMode(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1C2121704((uint64_t)a1, type metadata accessor for MedicationOnboardingFlowManager.EntryMode);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        *a1 = *a2;
        sub_1C20B6C78();
        uint64_t v8 = *(int *)(v7 + 48);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_1C2147B20();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
LABEL_13:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 1:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
LABEL_9:
          uint64_t v12 = sub_1C21490F0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
LABEL_12:
          swift_storeEnumTagMultiPayload();
          uint64_t v18 = (int *)type metadata accessor for MedicationSearchItem(0);
          *(void *)((char *)a1 + v18[5]) = *(void *)((char *)a2 + v18[5]);
          *(_OWORD *)((char *)a1 + v18[6]) = *(_OWORD *)((char *)a2 + v18[6]);
          *(_OWORD *)((char *)a1 + v18[7]) = *(_OWORD *)((char *)a2 + v18[7]);
          goto LABEL_13;
        }
LABEL_11:
        *a1 = *a2;
        sub_1C1F30C40();
        uint64_t v14 = *(int *)(v13 + 48);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (char *)a2 + v14;
        uint64_t v17 = sub_1C21491B0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
        goto LABEL_12;
      case 0:
        type metadata accessor for MedicationSearchItem.Source(0);
        if (swift_getEnumCaseMultiPayload() == 1) {
          goto LABEL_9;
        }
        goto LABEL_11;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1C2138074()
{
  uint64_t result = type metadata accessor for MedicationSearchItem(319);
  if (v1 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64;
    uint64_t v5 = v4;
    uint64_t result = sub_1C2147B20();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v6 = &v3;
      uint64_t v7 = &unk_1C215CEC0;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1C2138158(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1C21388C8(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_1C21381C4()
{
  if (!qword_1EA2C7738)
  {
    type metadata accessor for MedicationOnboardingFlowManager.EntryMode(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA2C7738);
    }
  }
}

void sub_1C2138228()
{
  if (!qword_1EA2C7750)
  {
    sub_1C214AE20();
    sub_1C1F12718(255, &qword_1EBF0C940);
    sub_1C2139AC8((unint64_t *)&qword_1EA2C6798, MEMORY[0x1E4F27FC8]);
    sub_1C21382F4();
    unint64_t v0 = sub_1C2149D80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7750);
    }
  }
}

unint64_t sub_1C21382F4()
{
  unint64_t result = qword_1EBF0C938;
  if (!qword_1EBF0C938)
  {
    sub_1C1F12718(255, &qword_1EBF0C940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0C938);
  }
  return result;
}

void sub_1C213835C(uint64_t a1)
{
  sub_1C2121EDC(a1, v1);
}

uint64_t sub_1C2138378(uint64_t *a1)
{
  return sub_1C211F130(*a1, a1[1], v1);
}

unint64_t sub_1C2138388()
{
  unint64_t result = qword_1EA2C3460;
  if (!qword_1EA2C3460)
  {
    sub_1C2135018(255, (unint64_t *)&qword_1EA2C3458, (unint64_t *)&qword_1EA2C44C0, MEMORY[0x1E4FBB1A0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C3460);
  }
  return result;
}

void sub_1C21383F8(uint64_t a1)
{
  sub_1C21342A0(a1, v1);
}

void sub_1C2138414(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB390], MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1C2138478(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2125754);
}

void sub_1C21384AC(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7AD80, (uint64_t)sub_1C2138560);
}

unint64_t sub_1C21384E8()
{
  unint64_t result = qword_1EA2C7770;
  if (!qword_1EA2C7770)
  {
    sub_1C2135094(255, &qword_1EA2C76F8, &qword_1EA2C3588, (unint64_t *)&qword_1EA2C6A20, 0x1E4F2ADD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EA2C7770);
  }
  return result;
}

void sub_1C2138560(uint64_t a1)
{
  sub_1C1F65A08(a1, v1);
}

id sub_1C213857C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, int a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11, uint64_t a12, void (*a13)(uint64_t))
{
  int v46 = a8;
  uint64_t v44 = a2;
  uint64_t v45 = a7;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v55 = a12;
  char v56 = a13;
  uint64_t v53 = a10;
  uint64_t v54 = a11;
  uint64_t v47 = sub_1C2148B70();
  uint64_t v15 = *(void *)(v47 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v47);
  char v48 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v42 - v18;
  id v20 = (uint64_t *)&v13[qword_1EA2C3FC8];
  uint64_t v57 = sub_1C214A5F0();
  uint64_t v58 = v21;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  uint64_t v22 = v57;
  uint64_t v23 = v58;
  uint64_t v24 = v13;
  swift_bridgeObjectRelease();
  *id v20 = v22;
  v20[1] = v23;
  uint64_t v25 = v44;
  uint64_t v26 = v45;
  *(void *)&v24[qword_1EA2C3FD8] = MEMORY[0x1E4FBC870];
  uint64_t v27 = qword_1EA2C3FE0;
  *(void *)&v24[qword_1EA2C3FE0] = 0;
  uint64_t v28 = qword_1EA2C3FE8;
  v24[qword_1EA2C3FE8] = 0;
  *(void *)&v24[qword_1EA2C3FF8] = 0;
  sub_1C212169C(v25, (uint64_t)&v24[qword_1EA2C3FD0], type metadata accessor for MedicationOnboardingFlowManager);
  char v29 = v46;
  v24[v28] = v46;
  uint64_t v30 = *(void **)&v24[v27];
  *(void *)&v24[v27] = v26;
  id v43 = v26;

  *(void *)&v24[qword_1EA2C3FF0] = a9;
  swift_retain();
  id v31 = objc_msgSend(a1, sel_traitCollection);
  id v32 = objc_msgSend(v31, sel_horizontalSizeClass);

  uint64_t v33 = v47;
  uint64_t v34 = (unsigned int *)MEMORY[0x1E4F666D8];
  if (v32 != (id)2) {
    uint64_t v34 = (unsigned int *)MEMORY[0x1E4F666E0];
  }
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v19, *v34, v47);
  *(void *)&v24[qword_1EA2C4000] = a1;
  id v35 = a1;

  if ((v29 & 1) == 0) {
    id v36 = v43;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v48, v19, v33);
  id v37 = v35;
  id v38 = (id)sub_1C2148B60();
  uint64_t v39 = sub_1C2148AA0();
  v53(v39);
  uint64_t v40 = sub_1C21219E0(v54, v55);
  v56(v40);

  sub_1C2121704(v25, type metadata accessor for MedicationOnboardingFlowManager);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v33);
  return v38;
}

void sub_1C21388C8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C214B4F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1C2138920(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C21389E4()
{
  if (!qword_1EA2C7790)
  {
    type metadata accessor for MedicationFormsDataSource();
    sub_1C2139AC8(&qword_1EA2C7798, (void (*)(uint64_t))type metadata accessor for MedicationFormsDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7790);
    }
  }
}

uint64_t sub_1C2138A78(uint64_t a1)
{
  return sub_1C211F254(a1, v1);
}

void sub_1C2138A94(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2125A88);
}

void sub_1C2138AC8(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7AE48, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2138B08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C2138BCC()
{
  if (!qword_1EA2C77B0)
  {
    type metadata accessor for MedicationFormsDataSource();
    sub_1C2139AC8(&qword_1EA2C7798, (void (*)(uint64_t))type metadata accessor for MedicationFormsDataSource);
    unint64_t v0 = type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C77B0);
    }
  }
}

void sub_1C2138C60()
{
  if (!qword_1EA2C77B8)
  {
    type metadata accessor for ManaulFormsDataSource();
    sub_1C2139AC8(&qword_1EA2C77C0, (void (*)(uint64_t))type metadata accessor for ManaulFormsDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C77B8);
    }
  }
}

void sub_1C2138CF4(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2125DBC);
}

void sub_1C2138D28(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7AF10, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2138D68(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C2138E2C()
{
  if (!qword_1EA2C77D8)
  {
    type metadata accessor for ManaulFormsDataSource();
    sub_1C2139AC8(&qword_1EA2C77C0, (void (*)(uint64_t))type metadata accessor for ManaulFormsDataSource);
    unint64_t v0 = type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C77D8);
    }
  }
}

void sub_1C2138EC0()
{
  if (!qword_1EA2C77E0)
  {
    type metadata accessor for MedicationStrengthsDataSource();
    sub_1C2139AC8(&qword_1EA2C77E8, (void (*)(uint64_t))type metadata accessor for MedicationStrengthsDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C77E0);
    }
  }
}

void sub_1C2138F54(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2126424);
}

void sub_1C2138F88(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7AFD8, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2138FC8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

uint64_t sub_1C213908C()
{
  sub_1C1F44A28(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(unsigned char *)(v0 + 40));

  return MEMORY[0x1F4186498](v0, 41, 7);
}

void sub_1C21390CC()
{
  if (!qword_1EA2C7800)
  {
    type metadata accessor for MedicationStrengthsDataSource();
    sub_1C2139AC8(&qword_1EA2C77E8, (void (*)(uint64_t))type metadata accessor for MedicationStrengthsDataSource);
    unint64_t v0 = type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7800);
    }
  }
}

void sub_1C2139160()
{
  if (!qword_1EA2C7808)
  {
    type metadata accessor for ManualStrengthDataSource();
    sub_1C2139AC8(&qword_1EA2C7810, (void (*)(uint64_t))type metadata accessor for ManualStrengthDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7808);
    }
  }
}

uint64_t sub_1C21391F4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C213922C(uint64_t a1)
{
  return sub_1C211F474(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(unsigned char *)(a1 + 24), v1);
}

void sub_1C2139258(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C21260F0);
}

void sub_1C213928C(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B0C8, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C21392CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

uint64_t sub_1C213938C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1C21393D0()
{
  if (!qword_1EA2C7828)
  {
    type metadata accessor for ManualStrengthDataSource();
    sub_1C2139AC8(&qword_1EA2C7810, (void (*)(uint64_t))type metadata accessor for ManualStrengthDataSource);
    unint64_t v0 = type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7828);
    }
  }
}

void sub_1C2139464()
{
  if (!qword_1EA2C7830)
  {
    type metadata accessor for MedicationScheduleDataSource();
    sub_1C2139AC8(&qword_1EA2C70D8, (void (*)(uint64_t))type metadata accessor for MedicationScheduleDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, &qword_1EA2C7830);
    }
  }
}

uint64_t sub_1C21394F8(void **a1)
{
  return sub_1C211F5E4(*a1, v1);
}

void sub_1C2139504(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2126758);
}

void sub_1C2139538(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B190, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2139578(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C213963C()
{
  if (!qword_1EA2C7848)
  {
    type metadata accessor for VisualizationShapeDataSource();
    sub_1C2139AC8(&qword_1EA2C2CD8, (void (*)(uint64_t))type metadata accessor for VisualizationShapeDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, &qword_1EA2C7848);
    }
  }
}

uint64_t sub_1C21396D0(uint64_t a1)
{
  return sub_1C211F710(a1, v1);
}

void sub_1C21396D8(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2126A8C);
}

void sub_1C213970C(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B258, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C213974C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C2139810()
{
  if (!qword_1EA2C7860)
  {
    type metadata accessor for VisualizationModificationDataSource();
    sub_1C2139AC8(&qword_1EA2C3FC0, (void (*)(uint64_t))type metadata accessor for VisualizationModificationDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, &qword_1EA2C7860);
    }
  }
}

uint64_t sub_1C21398A4(uint64_t a1)
{
  return sub_1C212020C(a1, v1);
}

uint64_t sub_1C21398AC(unint64_t *a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2134FB0(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C21398FC(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2126DC0);
}

void sub_1C2139930(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B320, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2139970(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C2139A34()
{
  if (!qword_1EA2C7878)
  {
    type metadata accessor for NicknameAndNotesDataSource();
    sub_1C2139AC8(&qword_1EA2C7880, (void (*)(uint64_t))type metadata accessor for NicknameAndNotesDataSource);
    unint64_t v0 = type metadata accessor for OnboardingStepViewController();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C7878);
    }
  }
}

uint64_t sub_1C2139AC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2139B10(uint64_t *a1)
{
  return sub_1C2120660(*a1, a1[1], a1[2], a1[3], v1);
}

unint64_t sub_1C2139B24()
{
  unint64_t result = qword_1EA2C7888;
  if (!qword_1EA2C7888)
  {
    sub_1C2135018(255, (unint64_t *)&qword_1EA2C6FB0, (unint64_t *)&qword_1EA2C6FB8, (uint64_t)&type metadata for MedicationNicknameNotes);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EA2C7888);
  }
  return result;
}

void sub_1C2139B94(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C21270F4);
}

void sub_1C2139BC8(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B3E8, (uint64_t)sub_1C2138560);
}

uint64_t sub_1C2139C08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F40400;
  return sub_1C2127CFC(a1, v4, v5, v7, v6);
}

uint64_t sub_1C2139CCC(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C2139D14()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C2139D54()
{
  if (!qword_1EA2C78A0)
  {
    type metadata accessor for NicknameAndNotesDataSource();
    sub_1C2139AC8(&qword_1EA2C7880, (void (*)(uint64_t))type metadata accessor for NicknameAndNotesDataSource);
    unint64_t v0 = type metadata accessor for SpecificationStepViewController.MedicationOnboardingStepObservableDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C78A0);
    }
  }
}

void sub_1C2139DE8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1C2139E34(char *a1)
{
  return sub_1C21207C4(*a1, v1);
}

unint64_t sub_1C2139E40()
{
  unint64_t result = qword_1EA2C5CC0;
  if (!qword_1EA2C5CC0)
  {
    sub_1C2135018(255, (unint64_t *)&qword_1EA2C5CB8, (unint64_t *)&qword_1EA2C3100, MEMORY[0x1E4FBB390]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C5CC0);
  }
  return result;
}

void sub_1C2139EB0(char *a1)
{
  sub_1C2121764(*a1, v1, sub_1C2127428);
}

void sub_1C2139EE4(void **a1)
{
  sub_1C21218BC(*a1, v1, (uint64_t)&unk_1F1D7B4D8, (uint64_t)sub_1C2138560);
}

uint64_t objectdestroy_21Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C2139F64(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1C1F405A0;
  return sub_1C21279BC(a1, v4, v5, v7, v6);
}

void sub_1C213A028(unint64_t a1)
{
  uint64_t v28 = sub_1C2147AC0();
  uint64_t v2 = *(void (***)(char *, uint64_t))(v28 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v28);
  uint64_t v27 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v26 = (char *)&v21 - v6;
  MEMORY[0x1F4188790](v5);
  uint64_t v25 = (char *)&v21 - v7;
  sub_1C2147E40();
  sub_1C2147E30();
  uint64_t v8 = (void *)sub_1C2147E20();
  swift_release();
  uint64_t v9 = (uint64_t)objc_msgSend(v8, sel_authorizationStatus);

  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C214B930();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
    {
LABEL_3:
      unint64_t v24 = a1 & 0xC000000000000001;
      uint64_t v22 = v9;
      uint64_t v23 = v2 + 1;
      swift_bridgeObjectRetain();
      uint64_t v9 = 4;
      uint64_t v12 = v25;
      uint64_t v11 = v26;
      uint64_t v2 = v23;
      uint64_t v13 = v28;
      while (1)
      {
        uint64_t v14 = v9 - 4;
        if (v24)
        {
          id v15 = (id)MEMORY[0x1C8753960](v9 - 4, a1);
          uint64_t v16 = v9 - 3;
          if (__OFADD__(v14, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v15 = *(id *)(a1 + 8 * v9);
          uint64_t v16 = v9 - 3;
          if (__OFADD__(v14, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        id v29 = v15;
        id v17 = objc_msgSend(v15, sel_creationDate);
        sub_1C2147A60();

        uint64_t v18 = v27;
        sub_1C2147AB0();
        sub_1C21479D0();
        uint64_t v19 = *v2;
        (*v2)(v18, v13);
        LOBYTE(v18) = sub_1C2147A20();
        v19(v11, v13);
        v19(v12, v13);

        if ((v18 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          return;
        }
        ++v9;
        if (v16 == v10)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = v22;
          break;
        }
      }
    }
  }
  if (v9 != 2)
  {
    id v20 = objc_msgSend(self, sel_defaultCenter);
    if (qword_1EA2C2668 != -1) {
      swift_once();
    }
    swift_beginAccess();
    objc_msgSend(v20, sel_postNotificationName_object_, qword_1EA2C3E68, 0);
  }
}

void sub_1C213A37C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    unint64_t v10 = a5(a1, v9, a4);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

void __swiftcall CollectionViewTextItem.init(text:)(HealthMedicationsUI::CollectionViewTextItem *__return_ptr retstr, Swift::String text)
{
  v15[1] = text._countAndFlagsBits;
  uint64_t v3 = sub_1C2147B20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CollectionViewTextCell();
  sub_1C213A654();
  uint64_t v7 = sub_1C21481D0();
  uint64_t v9 = v8;
  uint64_t v16 = 0x74497265746F6F46;
  unint64_t v17 = 0xEB000000005F6D65;
  sub_1C2147B10();
  sub_1C2147AD0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  uint64_t v10 = v16;
  uint64_t v11 = (void *)v17;
  id v12 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v13 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v14 = (objc_class *)objc_msgSend(v12, sel_initWithString_, v13);

  retstr->reuseIdentifier._countAndFlagsBits = v7;
  retstr->reuseIdentifier._object = v9;
  retstr->uniqueIdentifier._countAndFlagsBits = v10;
  retstr->uniqueIdentifier._object = v11;
  retstr->attributedText.super.isa = v14;
}

uint64_t type metadata accessor for CollectionViewTextCell()
{
  return self;
}

unint64_t sub_1C213A654()
{
  unint64_t result = qword_1EA2C3018;
  if (!qword_1EA2C3018)
  {
    type metadata accessor for CollectionViewTextCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C3018);
  }
  return result;
}

uint64_t CollectionViewTextItem.reuseIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionViewTextItem.reuseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CollectionViewTextItem.reuseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t CollectionViewTextItem.uniqueIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionViewTextItem.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*CollectionViewTextItem.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

id CollectionViewTextItem.attributedText.getter()
{
  return *(id *)(v0 + 32);
}

void __swiftcall CollectionViewTextItem.init(attributedText:)(HealthMedicationsUI::CollectionViewTextItem *__return_ptr retstr, NSAttributedString attributedText)
{
  uint64_t v4 = sub_1C2147B20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CollectionViewTextCell();
  sub_1C213A654();
  uint64_t v8 = sub_1C21481D0();
  uint64_t v10 = v9;
  uint64_t v13 = 0x74497265746F6F46;
  unint64_t v14 = 0xEB000000005F6D65;
  sub_1C2147B10();
  sub_1C2147AD0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  uint64_t v11 = v13;
  id v12 = (void *)v14;
  retstr->reuseIdentifier._countAndFlagsBits = v8;
  retstr->reuseIdentifier._object = v10;
  retstr->uniqueIdentifier._countAndFlagsBits = v11;
  retstr->uniqueIdentifier._object = v12;
  retstr->attributedText = attributedText;
}

uint64_t sub_1C213A91C(uint64_t a1, void *a2)
{
  sub_1C1F1CC94(a1, (uint64_t)v5, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell_item;
  swift_beginAccess();
  sub_1C1F32DDC((uint64_t)v5, v3);
  swift_endAccess();
  sub_1C213B484();
  return sub_1C1F1CD00((uint64_t)v5, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

uint64_t sub_1C213A9C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell_item;
  swift_beginAccess();
  return sub_1C1F1CC94(v3, a1, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

uint64_t sub_1C213AA34(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell_item;
  swift_beginAccess();
  sub_1C1F32DDC(a1, v3);
  swift_endAccess();
  sub_1C213B484();
  return sub_1C1F1CD00(a1, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

void (*sub_1C213AAC0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C213AB20;
}

void sub_1C213AB20(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1C213B484();
  }
}

id sub_1C213AB54()
{
  uint64_t v1 = OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell____lazy_storage___label;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell____lazy_storage___label);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell____lazy_storage___label);
  }
  else
  {
    id v4 = sub_1C213ABB4();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1C213ABB4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v6 = sub_1C214A5F0();
  uint64_t v7 = v1;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  id v2 = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setAccessibilityIdentifier_, v3, v6, v7);

  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_setNumberOfLines_, 0);
  objc_msgSend(v2, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v4 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28C8]);
  objc_msgSend(v2, sel_setFont_, v4);

  objc_msgSend(v2, sel_setClipsToBounds_, 0);
  objc_msgSend(v2, sel_setTextAlignment_, 1);
  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  return v2;
}

void sub_1C213AEE0()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  id v2 = sub_1C213AB54();
  objc_msgSend(v1, sel_addSubview_, v2);

  id v3 = self;
  sub_1C1F0ED28();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C21510C0;
  id v5 = sub_1C213AB54();
  id v6 = objc_msgSend(v5, sel_topAnchor);

  id v7 = objc_msgSend(v0, sel_contentView);
  id v8 = objc_msgSend(v7, sel_topAnchor);

  id v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v8, -10.0);
  *(void *)(v4 + 32) = v9;
  id v10 = sub_1C213AB54();
  id v11 = objc_msgSend(v10, sel_bottomAnchor);

  id v12 = objc_msgSend(v0, sel_contentView);
  id v13 = objc_msgSend(v12, sel_bottomAnchor);

  id v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_constant_, v13, -26.0);
  *(void *)(v4 + 40) = v14;
  id v15 = sub_1C213AB54();
  id v16 = objc_msgSend(v15, sel_leadingAnchor);

  id v17 = objc_msgSend(v0, sel_contentView);
  id v18 = objc_msgSend(v17, sel_leadingAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(void *)(v4 + 48) = v19;
  id v20 = sub_1C213AB54();
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = objc_msgSend(v0, sel_contentView);
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(void *)(v4 + 56) = v24;
  sub_1C214A7A0();
  sub_1C1F645D4();
  id v25 = (id)sub_1C214A770();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v25);
}

uint64_t sub_1C213B1E8()
{
  id v1 = v0;
  sub_1C1F1CC40(0, &qword_1EBF0C620, MEMORY[0x1E4FB0F28]);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)&v14 - v6;
  id v8 = (void *)sub_1C2149950();
  id v9 = (objc_class *)type metadata accessor for CollectionViewTextCell();
  v14.receiver = v1;
  v14.super_class = v9;
  objc_msgSendSuper2(&v14, sel__bridgedUpdateConfigurationUsingState_, v8);

  MEMORY[0x1C8752FE0]();
  uint64_t v10 = sub_1C21499D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v7, 1, v10))
  {
    id v11 = (void (*)(uint64_t))MEMORY[0x1E4FB0F28];
    sub_1C1F1CC94((uint64_t)v7, (uint64_t)v5, &qword_1EBF0C620, MEMORY[0x1E4FB0F28]);
    MEMORY[0x1C8752FF0](v5);
    return sub_1C1F1CD00((uint64_t)v7, &qword_1EBF0C620, v11);
  }
  else
  {
    id v13 = objc_msgSend(self, sel_clearColor);
    sub_1C2149990();
    return MEMORY[0x1C8752FF0](v7);
  }
}

void sub_1C213B484()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_1C21497F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell_item;
  swift_beginAccess();
  sub_1C1F1CC94(v6, (uint64_t)v17, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  if (v17[3])
  {
    sub_1C1F1CB5C();
    if (swift_dynamicCast())
    {
      id v7 = (void *)v16[4];
      id v8 = sub_1C213AB54();
      objc_msgSend(v8, sel_setAttributedText_, v7);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
  }
  else
  {
    sub_1C1F1CD00((uint64_t)v17, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  }
  sub_1C21497C0();
  id v9 = sub_1C21497E0();
  os_log_type_t v10 = sub_1C214ABD0();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v16[0] = v12;
    *(_DWORD *)id v11 = 136446210;
    v17[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v13 = sub_1C214A610();
    v17[0] = sub_1C1F6FD54(v13, v14, v16);
    sub_1C214B530();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v9, v10, "[%{public}s] item is not an CollectionViewTextItem", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v12, -1, -1);
    MEMORY[0x1C8754730](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id CollectionViewTextCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollectionViewTextCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C213B7E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC19HealthMedicationsUI22CollectionViewTextCell_item;
  swift_beginAccess();
  return sub_1C1F1CC94(v3, a2, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

void destroy for CollectionViewTextItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for CollectionViewTextItem(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  id v5 = (void *)a2[4];
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *assignWithCopy for CollectionViewTextItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[4];
  id v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for CollectionViewTextItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

ValueMetadata *type metadata accessor for CollectionViewTextItem()
{
  return &type metadata for CollectionViewTextItem;
}

uint64_t method lookup function for CollectionViewTextCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CollectionViewTextCell);
}

uint64_t dispatch thunk of CollectionViewTextCell.item.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CollectionViewTextCell.item.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CollectionViewTextCell.item.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

HealthMedicationsUI::InteractionsOnboardingEducationItem __swiftcall InteractionsOnboardingEducationItem.init(text:)(Swift::String text)
{
  object = text._object;
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  uint64_t v4 = v1;
  type metadata accessor for InteractionsOnboardingEducationCell();
  sub_1C213BB0C();
  uint64_t v5 = sub_1C21481D0();
  *uint64_t v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  v4[2] = v5;
  v4[3] = (uint64_t)v6;
  result.reuseIdentifier._object = v8;
  result.reuseIdentifier._uint64_t countAndFlagsBits = v7;
  result.text._object = v6;
  result.text._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t type metadata accessor for InteractionsOnboardingEducationCell()
{
  return self;
}

unint64_t sub_1C213BB0C()
{
  unint64_t result = qword_1EA2C5CA8;
  if (!qword_1EA2C5CA8)
  {
    type metadata accessor for InteractionsOnboardingEducationCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C5CA8);
  }
  return result;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.__allocating_init(factor:settingsManager:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v4 = sub_1C213D24C(a1, a2);
  swift_release();
  return v4;
}

uint64_t InteractionsOnboardingEducationItem.reuseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InteractionsOnboardingEducationItem.uniqueIdentifier.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t InteractionsOnboardingEducationItem.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1C214A690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C214A690();

  return swift_bridgeObjectRelease();
}

uint64_t InteractionsOnboardingEducationItem.hashValue.getter()
{
  return sub_1C214BB80();
}

uint64_t sub_1C213BD4C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1C213BDBC()
{
  return sub_1C214BB80();
}

uint64_t sub_1C213BE24()
{
  sub_1C214A690();

  return sub_1C214A690();
}

uint64_t sub_1C213BE74()
{
  return sub_1C214BB80();
}

uint64_t OnboardingLifestyleInteractionSwitchItem.baseIdentifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + qword_1EA2C78D8);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + qword_1EA2C78D8);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*OnboardingLifestyleInteractionSwitchItem.baseIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.init(factor:settingsManager:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1C213D24C(a1, a2);
  swift_release();
  return v2;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.isOn.getter()
{
  uint64_t v1 = *(void *)(v0 + qword_1EA2C78E0);
  switch(v1)
  {
    case 3:
      char v2 = sub_1C2148D20();
      return v2 & 1;
    case 2:
      char v2 = sub_1C2148D50();
      return v2 & 1;
    case 1:
      char v2 = sub_1C2148D00();
      return v2 & 1;
  }
  return 0;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.handleSwitchValueChanged(_:for:)()
{
  uint64_t v1 = *(void *)(v0 + qword_1EA2C78E0);
  switch(v1)
  {
    case 3:
      return sub_1C2148D30();
    case 2:
      return sub_1C2148D60();
    case 1:
      return sub_1C2148D10();
  }
  return result;
}

void OnboardingLifestyleInteractionSwitchItem.__allocating_init(image:text:detailText:backgroundColor:)()
{
}

void OnboardingLifestyleInteractionSwitchItem.init(image:text:detailText:backgroundColor:)()
{
}

uint64_t sub_1C213C188()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t OnboardingLifestyleInteractionSwitchItem.deinit()
{
  uint64_t v0 = _s19HealthMedicationsUI38InteractionFactorsLifestyleOptionsItemCfd_0();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t OnboardingLifestyleInteractionSwitchItem.__deallocating_deinit()
{
  _s19HealthMedicationsUI38InteractionFactorsLifestyleOptionsItemCfd_0();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1C213C27C()
{
  uint64_t v1 = *(void *)(v0 + qword_1EA2C78E0);
  switch(v1)
  {
    case 3:
      char v2 = sub_1C2148D20();
      return v2 & 1;
    case 2:
      char v2 = sub_1C2148D50();
      return v2 & 1;
    case 1:
      char v2 = sub_1C2148D00();
      return v2 & 1;
  }
  return 0;
}

uint64_t sub_1C213C300()
{
  uint64_t v1 = *(void *)(v0 + qword_1EA2C78E0);
  switch(v1)
  {
    case 3:
      return sub_1C2148D30();
    case 2:
      return sub_1C2148D60();
    case 1:
      return sub_1C2148D10();
  }
  return result;
}

uint64_t sub_1C213C384()
{
  uint64_t v1 = (uint64_t *)(*v0 + qword_1EA2C78D8);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C213C3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(*v2 + qword_1EA2C78D8);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C213C444())()
{
  return j__swift_endAccess;
}

double sub_1C213C4A4()
{
  double result = 0.0;
  xmmword_1EA2C83E0 = xmmword_1C215CFE0;
  unk_1EA2C83F0 = xmmword_1C215CFE0;
  return result;
}

uint64_t InteractionsOnboardingEducationCell.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  return sub_1C1F2116C(v3, a1);
}

uint64_t sub_1C213C510(uint64_t a1, void *a2)
{
  sub_1C1F2116C(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  sub_1C1F32DDC((uint64_t)v5, v3);
  swift_endAccess();
  sub_1C213C5F4();
  return sub_1C1F374E4((uint64_t)v5);
}

uint64_t InteractionsOnboardingEducationCell.item.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  sub_1C1F32DDC(a1, v3);
  swift_endAccess();
  sub_1C213C5F4();
  return sub_1C1F374E4(a1);
}

void sub_1C213C5F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C21497F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v6, (uint64_t)v49);
  if (!v49[3])
  {
    sub_1C1F374E4((uint64_t)v49);
LABEL_7:
    sub_1C21497A0();
    id v36 = v1;
    id v37 = sub_1C21497E0();
    os_log_type_t v38 = sub_1C214ABD0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v47 = v2;
      uint64_t v40 = (uint8_t *)v39;
      uint64_t v41 = swift_slowAlloc();
      v48[0] = v41;
      *(_DWORD *)uint64_t v40 = 136446210;
      sub_1C1F2116C(v6, (uint64_t)v49);
      sub_1C1F24488();
      uint64_t v42 = sub_1C214A630();
      v49[0] = sub_1C1F6FD54(v42, v43, v48);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v37, v38, "Incorrect view model for InteractionsOnboardingEducationItem: %{public}s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v41, -1, -1);
      MEMORY[0x1C8754730](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v47);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return;
  }
  sub_1C1F1CB5C();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v46 = v48[0];
  uint64_t v47 = v48[3];
  id v7 = objc_msgSend(v1, sel_contentView);
  id v8 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  id v9 = objc_msgSend(v1, sel_contentView);
  id v10 = sub_1C213CCF8();
  objc_msgSend(v9, sel_addSubview_, v10);

  id v45 = self;
  sub_1C1F0ED28();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1C21510C0;
  id v12 = sub_1C213CCF8();
  id v13 = objc_msgSend(v12, sel_topAnchor);

  id v14 = objc_msgSend(v1, sel_contentView);
  id v15 = objc_msgSend(v14, sel_topAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v11 + 32) = v16;
  id v17 = sub_1C213CCF8();
  id v18 = objc_msgSend(v17, sel_leadingAnchor);

  id v19 = objc_msgSend(v1, sel_contentView);
  id v20 = objc_msgSend(v19, sel_leadingAnchor);

  if (qword_1EA2C2770 != -1) {
    swift_once();
  }
  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v20, *((double *)&xmmword_1EA2C83E0 + 1));

  *(void *)(v11 + 40) = v21;
  id v22 = sub_1C213CCF8();
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v1, sel_contentView);
  id v25 = objc_msgSend(v24, sel_trailingAnchor);

  id v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v25, -*(double *)&qword_1EA2C83F8);
  *(void *)(v11 + 48) = v26;
  id v27 = sub_1C213CCF8();
  id v28 = objc_msgSend(v27, sel_bottomAnchor);

  id v29 = objc_msgSend(v1, sel_contentView);
  id v30 = objc_msgSend(v29, sel_bottomAnchor);

  id v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v30);
  *(void *)(v11 + 56) = v31;
  v49[0] = v11;
  sub_1C214A7A0();
  sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C810);
  id v32 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_activateConstraints_, v32);

  id v33 = sub_1C213CCF8();
  uint64_t v34 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setText_, v34);

  id v35 = sub_1C213CCF8();
  objc_msgSend(v35, sel_setTextAlignment_, 1);
}

void (*InteractionsOnboardingEducationCell.item.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C213CCC4;
}

void sub_1C213CCC4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1C213C5F4();
  }
}

id sub_1C213CCF8()
{
  uint64_t v1 = OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v5, sel_setNumberOfLines_, 0);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C8E0);
    uint64_t v6 = (void *)sub_1C214B0A0();
    objc_msgSend(v5, sel_setFont_, v6);

    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id InteractionsOnboardingEducationCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id InteractionsOnboardingEducationCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v10 = &v4[OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item];
  *(_OWORD *)id v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView] = 0;
  v12.receiver = v4;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
}

id InteractionsOnboardingEducationCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id InteractionsOnboardingEducationCell.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(void *)&v1[OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView] = 0;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id InteractionsOnboardingEducationCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C213D128@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  return sub_1C1F2116C(v3, a1);
}

uint64_t sub_1C213D17C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  sub_1C1F32DDC(a1, v3);
  swift_endAccess();
  sub_1C213C5F4();
  return sub_1C1F374E4(a1);
}

void (*sub_1C213D1EC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C213CCC4;
}

uint64_t sub_1C213D24C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(v2 + qword_1EA2C78D8);
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(void *)(v2 + qword_1EA2C78E8) = a2;
  *(void *)(v2 + qword_1EA2C78E0) = a1;
  uint64_t v13 = sub_1C214A5F0();
  uint64_t v14 = v5;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  uint64_t v6 = v13;
  uint64_t v7 = v14;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  LOBYTE(v13) = 0;
  HKDrugInteractionLifestyleFactor.localizedString(variant:)((uint64_t)&v13, a1);
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v13;
  uint64_t v9 = v14;
  swift_beginAccess();
  *uint64_t v4 = v8;
  v4[1] = v9;
  swift_release();
  swift_bridgeObjectRelease();
  char v12 = 0;
  HKDrugInteractionLifestyleFactor.localizedString(variant:)((uint64_t)&v12, a1);
  id v10 = objc_msgSend(self, sel_tertiarySystemGroupedBackgroundColor);
  return sub_1C21487D0();
}

unint64_t sub_1C213D3E8()
{
  unint64_t result = qword_1EA2C7900;
  if (!qword_1EA2C7900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C7900);
  }
  return result;
}

uint64_t sub_1C213D43C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  swift_beginAccess();
  return sub_1C1F2116C(v3, a2);
}

ValueMetadata *type metadata accessor for InteractionsOnboardingEducationItem()
{
  return &type metadata for InteractionsOnboardingEducationItem;
}

uint64_t type metadata accessor for OnboardingLifestyleInteractionSwitchItem()
{
  uint64_t result = qword_1EA2C7908;
  if (!qword_1EA2C7908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C213D4F4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for OnboardingLifestyleInteractionSwitchItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OnboardingLifestyleInteractionSwitchItem);
}

uint64_t dispatch thunk of OnboardingLifestyleInteractionSwitchItem.__allocating_init(factor:settingsManager:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for OnboardingLifestyleInteractionSwitchItem + v0 + 24))();
}

uint64_t sub_1C213D590()
{
  return type metadata accessor for OnboardingLifestyleInteractionSwitchItem();
}

id sub_1C213D598()
{
  uint64_t v1 = OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell____lazy_storage___historyView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell____lazy_storage___historyView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell____lazy_storage___historyView);
  }
  else
  {
    type metadata accessor for MedicationsDayHistoryView();
    id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_1C213D624()
{
  uint64_t v1 = sub_1C21497F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  id v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1F17484(0, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v34 - v6;
  sub_1C1F17484(0, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
  MEMORY[0x1F4188790](v8 - 8);
  id v10 = (char *)&v34 - v9;
  uint64_t v11 = (int *)type metadata accessor for MedicationsDayHistoryItem();
  uint64_t v12 = *((void *)v11 - 1);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)v0 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v15, (uint64_t)v36);
  if (v36[3])
  {
    sub_1C1F23804(0, (unint64_t *)&qword_1EBF0C2F0);
    int v16 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v10, v16 ^ 1u, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11) != 1)
    {
      sub_1C213E878((uint64_t)v10, (uint64_t)v14);
      id v17 = sub_1C213D598();
      id v18 = (uint64_t *)&v14[v11[5]];
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      uint64_t v21 = *(void *)&v14[v11[6]];
      id v22 = &v14[v11[9]];
      uint64_t v23 = sub_1C2147AC0();
      uint64_t v24 = *(void *)(v23 - 8);
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v7, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v7, 0, 1, v23);
      int v25 = v14[v11[10]];
      v17[OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_previousDisplayContext] = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (sub_1C203F87C(v20, v19, v21))
      {
        if (v25)
        {
          sub_1C203DA60(v20, v19, (uint64_t)v7);
          sub_1C203E7B4(v21);
LABEL_15:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          sub_1C213FB0C((uint64_t)v7, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
          return sub_1C1F92BF0((uint64_t)v14);
        }
      }
      else
      {
        if ((sub_1C203F668((uint64_t)v7) & 1) == 0) {
          goto LABEL_15;
        }
        if (v25)
        {
          sub_1C203DA60(v20, v19, (uint64_t)v7);
          goto LABEL_15;
        }
      }
      sub_1C203E108(v20, v19, (uint64_t)v7, v21);
      goto LABEL_15;
    }
  }
  else
  {
    sub_1C1F374E4((uint64_t)v36);
    (*(void (**)(char *, uint64_t, uint64_t, int *))(v12 + 56))(v10, 1, 1, v11);
  }
  sub_1C213FB0C((uint64_t)v10, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
  sub_1C21497A0();
  id v26 = v0;
  id v27 = sub_1C21497E0();
  os_log_type_t v28 = sub_1C214ABD0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v34 = v1;
    id v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v35 = v30;
    *(_DWORD *)id v29 = 136315138;
    sub_1C1F2116C(v15, (uint64_t)v36);
    sub_1C1F5236C(0, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0, MEMORY[0x1E4F66028], MEMORY[0x1E4FBB718]);
    uint64_t v31 = sub_1C214A630();
    v36[0] = sub_1C1F6FD54(v31, v32, &v35);
    sub_1C214B530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v27, v28, "Incorrect view model for MedicationsDayHistoryItem: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v30, -1, -1);
    MEMORY[0x1C8754730](v29, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v34);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

id sub_1C213DC10(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_1C2149BE0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell____lazy_storage___historyView] = 0;
  uint64_t v13 = &v4[OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item];
  uint64_t v14 = (objc_class *)type metadata accessor for MedicationsDayHistoryCell();
  *(_OWORD *)uint64_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((void *)v13 + 4) = 0;
  v25.receiver = v4;
  v25.super_class = v14;
  id v15 = objc_msgSendSuper2(&v25, sel_initWithFrame_, a1, a2, a3, a4);
  id v16 = objc_msgSend(v15, sel_contentView);
  id v17 = sub_1C213D598();
  objc_msgSend(v16, sel_addSubview_, v17);

  sub_1C2149B70();
  sub_1C2149B20();
  double v19 = v18;
  double v21 = v20;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  id v22 = sub_1C213D598();
  id v23 = objc_msgSend(v15, sel_contentView);
  objc_msgSend(v22, sel_hk_alignConstraintsWithView_insets_, v23, 12.0, v19, 12.0, v21);

  return v15;
}

uint64_t sub_1C213DEB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C21497F0();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1F17484(0, &qword_1EBF0C620, MEMORY[0x1E4FB0F28]);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v43 = (uint64_t)&v43 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v43 - v11;
  sub_1C1F17484(0, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)&v43 - v14;
  uint64_t v16 = type metadata accessor for MedicationsDayHistoryItem();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  double v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v20 = (void *)sub_1C2149950();
  double v21 = (objc_class *)type metadata accessor for MedicationsDayHistoryCell();
  v48.receiver = v1;
  v48.super_class = v21;
  objc_msgSendSuper2(&v48, sel__bridgedUpdateConfigurationUsingState_, v20);

  uint64_t v22 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v22, (uint64_t)v47);
  if (!v47[3])
  {
    sub_1C1F374E4((uint64_t)v47);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    goto LABEL_7;
  }
  sub_1C1F23804(0, (unint64_t *)&qword_1EBF0C2F0);
  int v23 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, v23 ^ 1u, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
LABEL_7:
    sub_1C213FB0C((uint64_t)v15, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
    sub_1C21497A0();
    id v28 = v1;
    id v29 = sub_1C21497E0();
    os_log_type_t v30 = sub_1C214ABD0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v46 = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      sub_1C1F2116C(v22, (uint64_t)v47);
      sub_1C1F5236C(0, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0, MEMORY[0x1E4F66028], MEMORY[0x1E4FBB718]);
      uint64_t v33 = sub_1C214A630();
      v47[0] = sub_1C1F6FD54(v33, v34, &v46);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v29, v30, "Incorrect view model for MedicationsDayHistoryItem: %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v32, -1, -1);
      MEMORY[0x1C8754730](v31, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v4, v45);
  }
  sub_1C213E878((uint64_t)v15, (uint64_t)v19);
  if (objc_msgSend(v1, sel_isHighlighted))
  {
    MEMORY[0x1C8752FE0]();
    uint64_t v24 = sub_1C21499D0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v12, 1, v24))
    {
      objc_super v25 = (void (*)(uint64_t))MEMORY[0x1E4FB0F28];
      uint64_t v26 = v43;
      sub_1C213FAA0((uint64_t)v12, v43, &qword_1EBF0C620, MEMORY[0x1E4FB0F28]);
      MEMORY[0x1C8752FF0](v26);
      sub_1C1F92BF0((uint64_t)v19);
      uint64_t v27 = (uint64_t)v12;
      return sub_1C213FB0C(v27, &qword_1EBF0C620, v25);
    }
    sub_1C1F758A4();
    sub_1C214B170();
    sub_1C2149990();
    os_log_type_t v38 = v12;
  }
  else
  {
    MEMORY[0x1C8752FE0]();
    uint64_t v36 = sub_1C21499D0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v8, 1, v36))
    {
      objc_super v25 = (void (*)(uint64_t))MEMORY[0x1E4FB0F28];
      uint64_t v37 = v43;
      sub_1C213FAA0((uint64_t)v8, v43, &qword_1EBF0C620, MEMORY[0x1E4FB0F28]);
      MEMORY[0x1C8752FF0](v37);
      sub_1C1F92BF0((uint64_t)v19);
      uint64_t v27 = (uint64_t)v8;
      return sub_1C213FB0C(v27, &qword_1EBF0C620, v25);
    }
    int v39 = v19[*(int *)(v16 + 40)];
    uint64_t v40 = self;
    uint64_t v41 = &selRef_secondarySystemBackgroundColor;
    if (!v39) {
      uint64_t v41 = &selRef_quaternarySystemFillColor;
    }
    id v42 = [v40 *v41];
    sub_1C2149990();
    os_log_type_t v38 = v8;
  }
  MEMORY[0x1C8752FF0](v38);
  return sub_1C1F92BF0((uint64_t)v19);
}

id sub_1C213E654()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationsDayHistoryCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MedicationsDayHistoryCell()
{
  return self;
}

uint64_t sub_1C213E6F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item;
  swift_beginAccess();
  return sub_1C1F2116C(v3, a1);
}

uint64_t sub_1C213E74C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item;
  swift_beginAccess();
  sub_1C1F32DDC(a1, v3);
  swift_endAccess();
  sub_1C213D624();
  return sub_1C1F374E4(a1);
}

uint64_t (*sub_1C213E7BC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C213E81C;
}

uint64_t sub_1C213E81C(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1C213D624();
  }
  return result;
}

uint64_t sub_1C213E850(uint64_t a1, void *a2)
{
  return sub_1C213E8DC(a2);
}

uint64_t sub_1C213E878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MedicationsDayHistoryItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C213E8DC(void *a1)
{
  objc_super v2 = v1;
  id v113 = a1;
  v125 = (void (*)(char *, uint64_t, uint64_t))sub_1C21497F0();
  uint64_t v123 = *((void *)v125 - 1);
  uint64_t v3 = MEMORY[0x1F4188790](v125);
  uint64_t v5 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v112 - v6;
  uint64_t v8 = sub_1C2147AC0();
  uint64_t v118 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  v115 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v114 = (char *)&v112 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v117 = (char *)&v112 - v14;
  MEMORY[0x1F4188790](v13);
  v124 = (char *)&v112 - v15;
  sub_1C1F17484(0, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v116 = (uint64_t)&v112 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  double v21 = (char *)&v112 - v20;
  MEMORY[0x1F4188790](v19);
  int v23 = (char *)&v112 - v22;
  sub_1C1F17484(0, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
  MEMORY[0x1F4188790](v24 - 8);
  uint64_t v26 = (char *)&v112 - v25;
  uint64_t v27 = type metadata accessor for MedicationsDayHistoryItem();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v119 = (uint64_t)&v112 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = (uint64_t)v2 + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v30, (uint64_t)v127);
  if (!v127[3])
  {
    sub_1C1F374E4((uint64_t)v127);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v26, 1, 1, v27);
    goto LABEL_24;
  }
  sub_1C1F23804(0, (unint64_t *)&qword_1EBF0C2F0);
  int v31 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v26, v31 ^ 1u, 1, v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
  {
LABEL_24:
    sub_1C213FB0C((uint64_t)v26, &qword_1EA2C7928, (void (*)(uint64_t))type metadata accessor for MedicationsDayHistoryItem);
    sub_1C21497A0();
    id v47 = v2;
    objc_super v48 = sub_1C21497E0();
    os_log_type_t v49 = sub_1C214ABD0();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      unint64_t v126 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      sub_1C1F2116C(v30, (uint64_t)v127);
      sub_1C1F5236C(0, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0, MEMORY[0x1E4F66028], MEMORY[0x1E4FBB718]);
      uint64_t v52 = sub_1C214A630();
      v127[0] = sub_1C1F6FD54(v52, v53, (uint64_t *)&v126);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v48, v49, "Incorrect view model for MedicationsDayHistoryItem: %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v51, -1, -1);
      MEMORY[0x1C8754730](v50, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v123 + 8))(v5, v125);
  }
  uint64_t v32 = (uint64_t)v26;
  uint64_t v33 = v119;
  sub_1C213E878(v32, v119);
  unint64_t v34 = *(void *)(v33 + *(int *)(v27 + 28));
  if (!v34)
  {
    sub_1C21497A0();
    id v55 = v2;
    char v56 = sub_1C21497E0();
    os_log_type_t v57 = sub_1C214ABD0();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      unint64_t v126 = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      sub_1C1F2116C(v30, (uint64_t)v127);
      sub_1C1F5236C(0, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0, MEMORY[0x1E4F66028], MEMORY[0x1E4FBB718]);
      uint64_t v60 = sub_1C214A630();
      v127[0] = sub_1C1F6FD54(v60, v61, (uint64_t *)&v126);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v56, v57, "doseEvents do not exist on MedicationsDayHistoryItem: %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v59, -1, -1);
      MEMORY[0x1C8754730](v58, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v123 + 8))(v7, v125);
    return sub_1C1F92BF0(v119);
  }
  uint64_t v112 = v27;
  v127[0] = MEMORY[0x1E4FBC860];
  unint64_t v126 = MEMORY[0x1E4FBC860];
  v120 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v118 + 56);
  uint64_t v121 = v118 + 56;
  v120(v23, 1, 1, v8);
  if (v34 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1C214B930();
    v122 = v23;
    uint64_t v123 = v8;
    if (v35) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v35 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v122 = v23;
    uint64_t v123 = v8;
    if (v35)
    {
LABEL_6:
      if (v35 >= 1)
      {
        uint64_t v36 = 0;
        v125 = (void (*)(char *, uint64_t, uint64_t))(v34 & 0xC000000000000001);
        while (1)
        {
          if (v125) {
            MEMORY[0x1C8753960](v36, v34);
          }
          else {
            swift_retain();
          }
          uint64_t v37 = (void *)sub_1C2148FA0();
          if (v37) {
            break;
          }
          swift_release();
LABEL_9:
          if (v35 == ++v36) {
            goto LABEL_34;
          }
        }
        id v38 = v37;
        int v39 = (void *)sub_1C2148F90();
        uint64_t v40 = v124;
        sub_1C2147A70();
        type metadata accessor for MedicationsDoseLogViewModel(0);
        swift_allocObject();
        uint64_t v41 = MedicationsDoseLogViewModel.init(medication:doseEvent:scheduleItem:logDate:dosage:index:)(v38, v39, 0, v40, v36, 1.0);
        id v42 = (void *)*((void *)v41 + 3);
        if (v42)
        {
          if (objc_msgSend(v42, sel_logOrigin) != (id)2) {
            goto LABEL_16;
          }
        }
        else if (!*((void *)v41 + 4))
        {
LABEL_16:
          uint64_t v43 = swift_retain();
          MEMORY[0x1C87528E0](v43);
          if (*(void *)((v127[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v127[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1C214A7D0();
          }
LABEL_22:
          sub_1C214A820();
          sub_1C214A7A0();
          uint64_t v45 = (void *)sub_1C2148F90();
          id v46 = objc_msgSend(v45, sel_startDate);

          sub_1C2147A60();
          swift_release();

          swift_release();
          int v23 = v122;
          sub_1C213FB0C((uint64_t)v122, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
          uint64_t v8 = v123;
          v120(v21, 0, 1, v123);
          sub_1C1F90A80((uint64_t)v21, (uint64_t)v23);
          goto LABEL_9;
        }
        uint64_t v44 = swift_retain();
        MEMORY[0x1C87528E0](v44);
        if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C214A7D0();
        }
        goto LABEL_22;
      }
      __break(1u);
      goto LABEL_57;
    }
  }
LABEL_34:
  swift_bridgeObjectRelease();
  uint64_t v62 = v116;
  sub_1C213FAA0((uint64_t)v23, v116, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  uint64_t v27 = v118;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v118 + 48))(v62, 1, v8) == 1)
  {
    uint64_t v63 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
    sub_1C213FB0C((uint64_t)v23, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C1F92BF0(v119);
    return sub_1C213FB0C(v62, &qword_1EBF0B1F0, v63);
  }
  v125 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 32);
  v125(v117, v62, v8);
  if (!(v126 >> 62))
  {
    uint64_t v64 = *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_38;
  }
LABEL_57:
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_1C214B930();
  swift_bridgeObjectRelease();
LABEL_38:
  uint64_t v65 = v127[0];
  uint64_t v66 = v127[0] >> 62;
  if (!v64)
  {
    if (v66)
    {
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_1C214B930();
      swift_bridgeObjectRelease();
      if (v111) {
        goto LABEL_41;
      }
    }
    else if (*(void *)((v127[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_41;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v117, v8);
    sub_1C213FB0C((uint64_t)v122, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1C1F92BF0(v119);
  }
LABEL_41:
  id v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v67, sel_setDateStyle_, 0);
  objc_msgSend(v67, sel_setTimeStyle_, 1);
  uint64_t v68 = (void *)sub_1C214A5B0();
  uint64_t v69 = (void *)sub_1C2147A00();
  id v70 = objc_msgSend(v67, sel_hm_localizableTimeStringKeyWithPrefix_date_, v68, v69);

  uint64_t v121 = sub_1C214A5F0();
  uint64_t v72 = v71;

  v120 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v67;
  v124 = v72;
  if (v66)
  {
    swift_bridgeObjectRetain();
    uint64_t v73 = sub_1C214B930();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v73 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  uint64_t v75 = MEMORY[0x1E4FBB1A0];
  if (v73)
  {
    v74(v114, v117, v8);
    if (qword_1EBF0CA00 != -1) {
      swift_once();
    }
    uint64_t v76 = (void *)qword_1EBF0CA18;
    sub_1C1F5236C(0, qword_1EBF0B8A0, (unint64_t *)&qword_1EBF0C9F0, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_1C214FCD0;
    uint64_t v78 = (uint64_t *)(v119 + *(int *)(v112 + 20));
    uint64_t v80 = *v78;
    uint64_t v79 = v78[1];
    *(void *)(v77 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v77 + 64) = sub_1C1F31298();
    *(void *)(v77 + 32) = v80;
    *(void *)(v77 + 40) = v79;
    id v81 = v76;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v82 = sub_1C2147730();
    uint64_t v84 = v83;
    if (*(void *)(v77 + 16))
    {
      uint64_t v82 = sub_1C214A5C0();
      uint64_t v86 = v85;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v84 = v86;
    }
    else
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    uint64_t v87 = v127[0];
    type metadata accessor for MedicationDoseLogListViewModel(0);
    uint64_t v73 = swift_allocObject();
    uint64_t v8 = v123;
    v125((char *)(v73 + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationDoseLogListViewModel_date), (uint64_t)v114, v123);
    v88 = (uint64_t *)(v73 + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationDoseLogListViewModel_title);
    uint64_t *v88 = v82;
    v88[1] = v84;
    *(void *)(v73 + 16) = v87;
    swift_bridgeObjectRetain();
    uint64_t v75 = MEMORY[0x1E4FBB1A0];
  }
  v74(v115, v117, v8);
  if (qword_1EBF0CA00 != -1) {
    swift_once();
  }
  uint64_t v89 = (void *)qword_1EBF0CA18;
  sub_1C1F5236C(0, qword_1EBF0B8A0, (unint64_t *)&qword_1EBF0C9F0, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_1C214FCD0;
  long long v91 = (uint64_t *)(v119 + *(int *)(v112 + 20));
  uint64_t v92 = *v91;
  uint64_t v93 = v91[1];
  *(void *)(v90 + 56) = v75;
  *(void *)(v90 + 64) = sub_1C1F31298();
  *(void *)(v90 + 32) = v92;
  *(void *)(v90 + 40) = v93;
  id v94 = v89;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v95 = sub_1C2147730();
  uint64_t v97 = v96;
  if (*(void *)(v90 + 16))
  {
    uint64_t v95 = sub_1C214A5C0();
    uint64_t v99 = v98;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v97 = v99;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v100 = v123;
  swift_bridgeObjectRelease();

  unint64_t v101 = v126;
  type metadata accessor for MedicationDoseLogListViewModel(0);
  uint64_t v102 = swift_allocObject();
  v125((char *)(v102 + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationDoseLogListViewModel_date), (uint64_t)v115, v100);
  v103 = (uint64_t *)(v102 + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationDoseLogListViewModel_title);
  uint64_t *v103 = v95;
  v103[1] = v97;
  *(void *)(v102 + 16) = v101;
  uint64_t v104 = v119;
  v105 = *(void **)(v119 + *(int *)(v112 + 32));
  id v106 = objc_allocWithZone((Class)type metadata accessor for MedicationsLogViewController());
  swift_retain();
  id v107 = v105;
  uint64_t v108 = swift_retain();
  v109 = (void *)MedicationsLogViewController.init(medicationDoseLogList:asNeededMedicationDoseLogList:healthStore:showRecordAll:provenance:context:)(v108, v73, v107, 0, 2, 0, 3, 0);
  id v110 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B78]), sel_initWithRootViewController_, v109);
  objc_msgSend(v110, sel_setModalPresentationStyle_, 2);
  objc_msgSend(v110, sel_setModalInPresentation_, 1);
  objc_msgSend(v113, sel_presentViewController_animated_completion_, v110, 1, 0);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v118 + 8))(v117, v100);
  sub_1C213FB0C((uint64_t)v122, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  swift_bridgeObjectRelease();
  return sub_1C1F92BF0(v104);
}

uint64_t sub_1C213FAA0(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1C1F17484(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1C213FB0C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C1F17484(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C213FB74(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  id v5 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1EBF0C820 != -1) {
    swift_once();
  }
  swift_beginAccess();
  objc_msgSend(v5, sel_postNotificationName_object_, qword_1EBF0B890, a2);

  return a3(a2);
}

id sub_1C213FC4C(uint64_t a1, void *a2)
{
  id v25 = a2;
  objc_super v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1C21411A0(0, &qword_1EA2C38F8, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = sub_1C2148F80();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27A78];
  sub_1C21411A0(0, (unint64_t *)&unk_1EA2C5130, MEMORY[0x1E4F27A78], v2);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = sub_1C2147BB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_1C2148F70();
  sub_1C21496B0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1C2141298((uint64_t)v16, (unint64_t *)&unk_1EA2C5130, v13);
  sub_1C2147860();
  swift_bridgeObjectRelease();
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v19 = result;
    sub_1C2141204((uint64_t)v8, (uint64_t)v6);
    uint64_t v20 = sub_1C2147870();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v6, 1, v20) != 1)
    {
      uint64_t v22 = (void *)sub_1C2147840();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
    }
    sub_1C1F49F60(MEMORY[0x1E4FBC860]);
    int v23 = (void *)sub_1C214A500();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_openSensitiveURL_withOptions_, v22, v23);

    objc_msgSend(v25, sel_dismissViewControllerAnimated_completion_, 1, 0);
    return (id)sub_1C2141298((uint64_t)v8, &qword_1EA2C38F8, MEMORY[0x1E4F276F0]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE46makeAlertForMedicationWithIncompatibleSchedule10deviceName9okHandler06cancelP0ABSS_yycSgAHtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EBF0CA00 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_1EBF0CA18;
  sub_1C21411A0(0, qword_1EBF0B8A0, (uint64_t (*)(uint64_t))sub_1C1FAEE38, MEMORY[0x1E4FBBE00]);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1C214FCD0;
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 64) = sub_1C1F31298();
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  id v11 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2147730();
  sub_1C214A5C0();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v12 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v13 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v13, v14, 1, 0xE000000000000000);

  id v16 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  sub_1C1F1325C(a3);
  uint64_t v18 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_1C21410C8;
  uint64_t v42 = v17;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  int v39 = sub_1C203D9F8;
  uint64_t v40 = &block_descriptor_18_1;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v20 = self;
  id v34 = objc_msgSend(v20, sel_actionWithTitle_style_handler_, v18, 0, v19, 0xE000000000000000);
  _Block_release(v19);

  id v21 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a5;
  *(void *)(v22 + 24) = a6;
  sub_1C1F1325C(a5);
  int v23 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_1C21410C8;
  uint64_t v42 = v22;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  int v39 = sub_1C203D9F8;
  uint64_t v40 = &block_descriptor_24_1;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_release();
  id v25 = objc_msgSend(v20, sel_actionWithTitle_style_handler_, v23, 0, v24, 0xE000000000000000);
  _Block_release(v24);

  id v26 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v15;
  id v28 = v15;
  uint64_t v29 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_1C2141198;
  uint64_t v42 = v27;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  int v39 = sub_1C203D9F8;
  uint64_t v40 = &block_descriptor_30_0;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_release();
  id v31 = objc_msgSend(v20, sel_actionWithTitle_style_handler_, v29, 1, v30, 0xE000000000000000);
  _Block_release(v30);

  objc_msgSend(v28, sel_addAction_, v34);
  objc_msgSend(v28, sel_addAction_, v25);
  objc_msgSend(v28, sel_addAction_, v31);

  return v28;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE27makeAlertForExsitingConcept7concept11listManager11showHandlerABSgSo9HKConceptC_0C22RecordsConceptsSupport04ListjM0CySo022HKMedicationUserDomainJ0CctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EBF0CA00 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1EBF0CA18;
  sub_1C21411A0(0, qword_1EBF0B8A0, (uint64_t (*)(uint64_t))sub_1C1FAEE38, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C214FCD0;
  id v6 = v4;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C214B480();
  uint64_t v9 = sub_1C20663EC(v7, v8);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 64) = sub_1C1F31298();
  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = v11;
  sub_1C2147730();
  if (*(void *)(v5 + 16))
  {
    sub_1C214A5C0();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v12 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v12, 0, 1, 0xE000000000000000);

  uint64_t v14 = (void *)sub_1C21496F0();
  if (!v14)
  {
    uint64_t v14 = (void *)sub_1C21496D0();
    if (!v14)
    {

      return 0;
    }
  }
  id v15 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  id v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = a3;
  v16[4] = a4;
  id v30 = v14;
  swift_retain();
  uint64_t v17 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1C214110C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C203D9F8;
  aBlock[3] = &block_descriptor_12_1;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
  _Block_release(v18);

  id v21 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v22 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 1, 0, 0xE000000000000000);

  objc_msgSend(v13, sel_addAction_, v20);
  objc_msgSend(v13, sel_addAction_, v23);
  uint64_t v24 = (void *)sub_1C21496F0();

  if (!v24)
  {
    id v25 = (void *)sub_1C21496D0();

    if (v25)
    {
      id v26 = (id)qword_1EBF0CA18;
      swift_bridgeObjectRetain();
      sub_1C2147730();
      swift_bridgeObjectRelease();

      uint64_t v27 = (void *)sub_1C214A5B0();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setMessage_, v27, 0xE000000000000000);

      return v13;
    }

    return 0;
  }

  return v13;
}

id _sSo17UIAlertControllerC19HealthMedicationsUIE31makeAlertForArchivingMedication9onConfirm0K6CancelAByyc_yycSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EBF0CA00 != -1) {
    swift_once();
  }
  id v6 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  id v7 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v8 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1, 0xE000000000000000);

  id v11 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  id v13 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_1C1F60618;
  uint64_t v30 = v12;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_1C203D9F8;
  id v28 = &block_descriptor_32;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  id v15 = self;
  id v16 = objc_msgSend(v15, sel_actionWithTitle_style_handler_, v13, 0, v14, 0xE000000000000000);
  _Block_release(v14);

  id v17 = (id)qword_1EBF0CA18;
  swift_bridgeObjectRetain();
  sub_1C2147730();
  swift_bridgeObjectRelease();

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  *(void *)(v18 + 24) = a4;
  sub_1C1F1325C(a3);
  uint64_t v19 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_1C21410C8;
  uint64_t v30 = v18;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_1C203D9F8;
  id v28 = &block_descriptor_6_0;
  id v20 = _Block_copy(&aBlock);
  swift_release();
  id v21 = objc_msgSend(v15, sel_actionWithTitle_style_handler_, v19, 1, v20, 0xE000000000000000);
  _Block_release(v20);

  objc_msgSend(v10, sel_addAction_, v16);
  objc_msgSend(v10, sel_addAction_, v21);

  return v10;
}

uint64_t sub_1C214108C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C21410CC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C214110C(uint64_t a1)
{
  return sub_1C213FB74(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t objectdestroy_2Tm_1()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2141160()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1C2141198(uint64_t a1)
{
  return sub_1C213FC4C(a1, *(void **)(v1 + 16));
}

void sub_1C21411A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1C2141204(uint64_t a1, uint64_t a2)
{
  sub_1C21411A0(0, &qword_1EA2C38F8, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2141298(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1C21411A0(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t FieldItem.init(text:placeholder:height:isEnabled:isNumeric:characterLimit:verticalAlignment:firstResponderHandler:hasClearButton:updateHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  sub_1C2147B10();
  id v20 = (int *)type metadata accessor for FieldItem();
  id v21 = (void *)(a9 + v20[5]);
  uint64_t v22 = (void *)(a9 + v20[6]);
  uint64_t v23 = a9 + v20[10];
  uint64_t v24 = (void *)(a9 + v20[14]);
  id v25 = (uint64_t *)(a9 + v20[15]);
  type metadata accessor for FieldCell();
  sub_1C214584C(&qword_1EA2C7930, v26, (void (*)(uint64_t))type metadata accessor for FieldCell);
  uint64_t result = sub_1C21481D0();
  *id v25 = result;
  v25[1] = v28;
  *id v21 = a1;
  v21[1] = a2;
  *uint64_t v22 = a3;
  v22[1] = a4;
  *(double *)(a9 + v20[7]) = a10;
  *(void *)uint64_t v23 = a7;
  *(unsigned char *)(v23 + 8) = a8 & 1;
  *(unsigned char *)(a9 + v20[9]) = a6;
  *(unsigned char *)(a9 + v20[8]) = a5;
  *(void *)(a9 + v20[12]) = a11;
  void *v24 = a12;
  v24[1] = a13;
  uint64_t v29 = (void *)(a9 + v20[13]);
  *uint64_t v29 = a15;
  v29[1] = a16;
  *(unsigned char *)(a9 + v20[11]) = a14;
  return result;
}

uint64_t type metadata accessor for FieldItem()
{
  uint64_t result = qword_1EA2C7948;
  if (!qword_1EA2C7948) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for FieldCell()
{
  return self;
}

uint64_t FieldItem.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C2147B20();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t FieldItem.text.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for FieldItem() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for FieldItem() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FieldItem.text.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.placeholder.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for FieldItem() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.placeholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for FieldItem() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FieldItem.placeholder.modify())()
{
  return nullsub_1;
}

double FieldItem.height.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for FieldItem() + 28));
}

uint64_t FieldItem.height.setter(double a1)
{
  uint64_t result = type metadata accessor for FieldItem();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*FieldItem.height.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.isEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 32));
}

uint64_t FieldItem.isEnabled.setter(char a1)
{
  uint64_t result = type metadata accessor for FieldItem();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*FieldItem.isEnabled.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.isNumeric.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 36));
}

uint64_t FieldItem.isNumeric.setter(char a1)
{
  uint64_t result = type metadata accessor for FieldItem();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*FieldItem.isNumeric.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.characterLimit.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for FieldItem() + 40));
}

uint64_t FieldItem.characterLimit.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for FieldItem();
  uint64_t v6 = v2 + *(int *)(result + 40);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*FieldItem.characterLimit.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.hasClearButton.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FieldItem() + 44));
}

uint64_t FieldItem.hasClearButton.setter(char a1)
{
  uint64_t result = type metadata accessor for FieldItem();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*FieldItem.hasClearButton.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.verticalAlignment.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for FieldItem() + 48));
}

uint64_t FieldItem.verticalAlignment.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for FieldItem();
  *(void *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*FieldItem.verticalAlignment.modify())()
{
  return nullsub_1;
}

uint64_t FieldItem.reuseIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for FieldItem() + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FieldItem.uniqueIdentifier.getter()
{
  return 0x657449646C656946;
}

double static FieldItem.defaultTextFieldHeight.getter()
{
  return 44.0;
}

uint64_t FieldItem.hash(into:)()
{
  uint64_t v1 = type metadata accessor for FieldItem();
  if (*(void *)(v0 + *(int *)(v1 + 20) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  if (*(void *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  return sub_1C214BB70();
}

uint64_t FieldItem.hashValue.getter()
{
  sub_1C214BB30();
  uint64_t v1 = type metadata accessor for FieldItem();
  if (*(void *)(v0 + *(int *)(v1 + 20) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  if (*(void *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  sub_1C214BB70();
  return sub_1C214BB80();
}

uint64_t sub_1C2141DAC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(v2 + *(int *)(a2 + 20) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  if (*(void *)(v2 + *(int *)(a2 + 24) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  return sub_1C214BB70();
}

uint64_t sub_1C2141E88(uint64_t a1, uint64_t a2)
{
  sub_1C214BB30();
  if (*(void *)(v2 + *(int *)(a2 + 20) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  if (*(void *)(v2 + *(int *)(a2 + 24) + 8))
  {
    sub_1C214BB50();
    swift_bridgeObjectRetain();
    sub_1C214A690();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C214BB50();
  }
  sub_1C214BB70();
  return sub_1C214BB80();
}

uint64_t sub_1C2141F90(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2141FC8()
{
  return 0x657449646C656946;
}

uint64_t sub_1C2142024(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

char *sub_1C2142038()
{
  uint64_t v1 = OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField];
  if (v2)
  {
    uint64_t v3 = *(char **)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField];
  }
  else
  {
    uint64_t v4 = sub_1C214209C(v0);
    uint64_t v5 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    uint64_t v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

char *sub_1C214209C(void *a1)
{
  type metadata accessor for UITextFieldWithInsets();
  uint64_t v2 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_1C214AB50();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id v11 = &v2[OBJC_IVAR____TtC19HealthMedicationsUI21UITextFieldWithInsets_insets];
  swift_beginAccess();
  *(void *)id v11 = v4;
  *((void *)v11 + 1) = v6;
  *((void *)v11 + 2) = v8;
  *((void *)v11 + 3) = v10;
  v11[32] = 0;
  uint64_t v12 = self;
  id v13 = v2;
  id v14 = objc_msgSend(v12, sel_secondarySystemBackgroundColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  objc_msgSend(v13, sel_setAdjustsFontForContentSizeCategory_, 1);
  sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C8E0);
  id v15 = v13;
  id v16 = (void *)sub_1C214B0A0();
  objc_msgSend(v15, sel_setFont_, v16);

  objc_msgSend(v15, sel_setContentVerticalAlignment_, 1);
  id v17 = v15;
  if (objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection) == (id)1) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 1;
  }
  objc_msgSend(v17, sel_setContentHorizontalAlignment_, v18);

  objc_msgSend(v17, sel_setBorderStyle_, 0);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1C2147DE0();
  id v19 = (id)*MEMORY[0x1E4F39EA8];
  sub_1C214B0D0();

  objc_msgSend(v17, sel_setDelegate_, a1);
  objc_msgSend(v17, sel_addTarget_action_forControlEvents_, a1, sel_textFieldDidChangeWithSender_, 0x20000);
  sub_1C1F0ED28();
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1C214FCB0;
  *(void *)(v20 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 5, a1, 0);
  *(void *)(v20 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, a1, sel_didTapDoneWithSender_);
  sub_1C214A7A0();
  sub_1C214AB40();
  swift_bridgeObjectRelease();
  return v17;
}

id sub_1C214239C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C2147BB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter);
  if (v7)
  {
    id v8 = *(id *)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter);
  }
  else
  {
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
    objc_msgSend(v9, sel_setNumberStyle_, 1);
    sub_1C2147B60();
    uint64_t v10 = (void *)sub_1C2147B50();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v9, sel_setLocale_, v10);

    id v11 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v9;
    id v8 = v9;

    uint64_t v7 = 0;
  }
  id v12 = v7;
  return v8;
}

char *sub_1C21424F4(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField] = 0;
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter] = 0;
  id v9 = (uint64_t *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  uint64_t v20 = sub_1C214A5F0();
  uint64_t v21 = v10;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  id v11 = v4;
  swift_bridgeObjectRelease();
  *id v9 = v20;
  v9[1] = v21;
  id v12 = &v11[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  *(_OWORD *)id v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;

  v22.receiver = v11;
  v22.super_class = (Class)type metadata accessor for FieldCell();
  id v13 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  id v14 = objc_msgSend(v13, sel_contentView);
  id v15 = sub_1C2142038();
  objc_msgSend(v14, sel_addSubview_, v15);

  id v16 = (uint64_t *)&v13[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  swift_beginAccess();
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  swift_bridgeObjectRetain();
  sub_1C2144884(v18, v17);
  swift_bridgeObjectRelease();

  return v13;
}

void sub_1C21426B8()
{
  sub_1C2146424(0, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = &v36[-v2];
  sub_1C1F0ED28();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C21544C0;
  uint64_t v5 = sub_1C2142038();
  id v6 = objc_msgSend(v5, sel_leadingAnchor);

  id v7 = objc_msgSend(v0, sel_contentView);
  id v8 = objc_msgSend(v7, sel_leadingAnchor);

  id v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v8);
  *(void *)(v4 + 32) = v9;
  uint64_t v10 = sub_1C2142038();
  id v11 = objc_msgSend(v10, sel_trailingAnchor);

  id v12 = objc_msgSend(v0, sel_contentView);
  id v13 = objc_msgSend(v12, sel_trailingAnchor);

  id v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(void *)(v4 + 40) = v14;
  id v15 = sub_1C2142038();
  id v16 = objc_msgSend(v15, sel_topAnchor);

  id v17 = objc_msgSend(v0, sel_contentView);
  id v18 = objc_msgSend(v17, sel_topAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(void *)(v4 + 48) = v19;
  uint64_t v20 = sub_1C2142038();
  id v21 = objc_msgSend(v20, sel_bottomAnchor);

  id v22 = objc_msgSend(v0, sel_contentView);
  id v23 = objc_msgSend(v22, sel_bottomAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(void *)(v4 + 56) = v24;
  id v25 = sub_1C2142038();
  id v26 = objc_msgSend(v25, sel_heightAnchor);

  uint64_t v27 = (uint64_t)v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v27, (uint64_t)v37);
  if (!v37[3])
  {
    sub_1C2146364((uint64_t)v37, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    uint64_t v32 = type metadata accessor for FieldItem();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v3, 1, 1, v32);
    goto LABEL_5;
  }
  sub_1C1F1CB5C();
  uint64_t v28 = type metadata accessor for FieldItem();
  int v29 = swift_dynamicCast();
  uint64_t v30 = *(void *)(v28 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v30 + 56))(v3, v29 ^ 1u, 1, v28);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v30 + 48))(v3, 1, v28) == 1)
  {
LABEL_5:
    sub_1C2146364((uint64_t)v3, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
    double v31 = 44.0;
    goto LABEL_6;
  }
  double v31 = *(double *)&v3[*(int *)(v28 + 28)];
  sub_1C204FA14((uint64_t)v3);
LABEL_6:
  uint64_t v33 = self;
  id v34 = objc_msgSend(v26, sel_constraintGreaterThanOrEqualToConstant_, v31);

  *(void *)(v4 + 64) = v34;
  v37[0] = v4;
  sub_1C214A7A0();
  sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C810);
  uint64_t v35 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_activateConstraints_, v35);
}

uint64_t sub_1C2142BCC()
{
  uint64_t v1 = sub_1C21497F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2146424(0, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v43 - v6;
  id v8 = (int *)type metadata accessor for FieldItem();
  uint64_t v9 = *((void *)v8 - 1);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v12, (uint64_t)v45);
  if (v45[3])
  {
    sub_1C1F1CB5C();
    int v13 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, int *))(v9 + 56))(v7, v13 ^ 1u, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v9 + 48))(v7, 1, v8) != 1)
    {
      sub_1C21463C0((uint64_t)v7, (uint64_t)v11);
      id v14 = sub_1C2142038();
      id v15 = sub_1C2142038();
      id v16 = objc_msgSend(v15, sel_constraints);

      if (!v16)
      {
        sub_1C1F12718(0, (unint64_t *)&qword_1EBF0C810);
        sub_1C214A780();
        id v16 = (id)sub_1C214A770();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v14, sel_removeConstraints_, v16);

      sub_1C21426B8();
      id v17 = sub_1C2142038();
      if (*(void *)&v11[v8[5] + 8])
      {
        swift_bridgeObjectRetain();
        id v18 = (void *)sub_1C214A5B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v18 = 0;
      }
      objc_msgSend(v17, sel_setText_, v18);

      uint64_t v27 = sub_1C2142038();
      if (*(void *)&v11[v8[6] + 8])
      {
        swift_bridgeObjectRetain();
        uint64_t v28 = (void *)sub_1C214A5B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v28 = 0;
      }
      objc_msgSend(v27, sel_setPlaceholder_, v28);

      int v29 = sub_1C2142038();
      objc_msgSend(v29, sel_setContentVerticalAlignment_, *(void *)&v11[v8[12]]);

      uint64_t v30 = sub_1C2142038();
      if (objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection) == (id)1) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 1;
      }
      objc_msgSend(v30, sel_setContentHorizontalAlignment_, v31);

      if (v11[v8[9]] == 1)
      {
        uint64_t v32 = sub_1C2142038();
        objc_msgSend(v32, sel_setKeyboardType_, 8);
      }
      if (v11[v8[11]] == 1)
      {
        uint64_t v33 = sub_1C2142038();
        objc_msgSend(v33, sel_setClearButtonMode_, 1);
      }
      id v34 = sub_1C2142038();
      objc_msgSend(v34, sel_setEnabled_, v11[v8[8]]);

      if (*(void *)&v11[v8[14]])
      {
        id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D38]), sel_initWithTarget_action_, v0, sel_didTapCell);
        objc_msgSend(v0, sel_addGestureRecognizer_, v35);

        return sub_1C204FA14((uint64_t)v11);
      }
      id v36 = objc_msgSend(v0, sel_gestureRecognizers);
      if (!v36) {
        return sub_1C204FA14((uint64_t)v11);
      }
      uint64_t v37 = v36;
      sub_1C1F12718(0, &qword_1EA2C7998);
      unint64_t v38 = sub_1C214A780();

      if (v38 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t result = sub_1C214B930();
        uint64_t v39 = result;
        if (result) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t result = swift_bridgeObjectRetain();
        if (v39)
        {
LABEL_28:
          if (v39 < 1)
          {
            __break(1u);
            return result;
          }
          for (uint64_t i = 0; i != v39; ++i)
          {
            if ((v38 & 0xC000000000000001) != 0) {
              id v41 = (id)MEMORY[0x1C8753960](i, v38);
            }
            else {
              id v41 = *(id *)(v38 + 8 * i + 32);
            }
            uint64_t v42 = v41;
            objc_msgSend(v0, sel_removeGestureRecognizer_, v41);
          }
        }
      }
      swift_bridgeObjectRelease_n();
      return sub_1C204FA14((uint64_t)v11);
    }
  }
  else
  {
    sub_1C2146364((uint64_t)v45, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    (*(void (**)(char *, uint64_t, uint64_t, int *))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1C2146364((uint64_t)v7, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  sub_1C21497A0();
  id v19 = v0;
  uint64_t v20 = sub_1C21497E0();
  os_log_type_t v21 = sub_1C214ABD0();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v43 = v1;
    uint64_t v44 = v23;
    *(_DWORD *)id v22 = 136446210;
    sub_1C1F2116C(v12, (uint64_t)v45);
    sub_1C2146424(0, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    uint64_t v24 = sub_1C214A630();
    v45[0] = sub_1C1F6FD54(v24, v25, &v44);
    sub_1C214B530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v20, v21, "Incorrect view model for FieldCell: %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v23, -1, -1);
    MEMORY[0x1C8754730](v22, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v43);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_1C2143360()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C21497F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2146424(0, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v28 - v7;
  uint64_t v9 = type metadata accessor for FieldItem();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v13, (uint64_t)v30);
  if (!v30[3])
  {
    sub_1C2146364((uint64_t)v30, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_8:
    sub_1C2146364((uint64_t)v8, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
    sub_1C21497A0();
    id v21 = v1;
    id v22 = sub_1C21497E0();
    os_log_type_t v23 = sub_1C214ABD0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v28 = v2;
      uint64_t v29 = v25;
      *(_DWORD *)uint64_t v24 = 136446210;
      sub_1C1F2116C(v13, (uint64_t)v30);
      sub_1C2146424(0, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
      uint64_t v26 = sub_1C214A630();
      v30[0] = sub_1C1F6FD54(v26, v27, &v29);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v22, v23, "Incorrect view model for FieldCell: %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v25, -1, -1);
      MEMORY[0x1C8754730](v24, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v28);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  sub_1C1F1CB5C();
  int v14 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, v14 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    goto LABEL_8;
  }
  sub_1C21463C0((uint64_t)v8, (uint64_t)v12);
  id v15 = *(uint64_t (**)(void))&v12[*(int *)(v9 + 56)];
  if (v15)
  {
    swift_retain();
    id v16 = sub_1C2142038();
    char v17 = v15();

    sub_1C1F31118((uint64_t)v15);
    if (v17)
    {
      id v18 = sub_1C2142038();
      objc_msgSend(v18, sel_setUserInteractionEnabled_, 1);

      id v19 = sub_1C2142038();
      objc_msgSend(v19, sel_becomeFirstResponder);
    }
  }
  return sub_1C204FA14((uint64_t)v12);
}

uint64_t sub_1C2143854(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = a3;
  uint64_t v5 = sub_1C21497F0();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  MEMORY[0x1F4188790](v5);
  os_log_type_t v49 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C2148150();
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v42 = (uint64_t *)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2146424(0, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v41 - v10;
  uint64_t v12 = type metadata accessor for FieldItem();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  id v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(a1, sel_text);
  if (v16)
  {
    char v17 = v16;
    sub_1C214A5F0();
  }
  id v18 = (char *)sub_1C214A5B0();
  swift_bridgeObjectRelease();
  id v19 = (void *)sub_1C214A5B0();
  id v20 = objc_msgSend(v18, sel_stringByReplacingCharactersInRange_withString_, a2, v47, v19);

  uint64_t v21 = sub_1C214A5F0();
  unint64_t v23 = v22;

  id v24 = v48;
  uint64_t v25 = &v48[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  swift_beginAccess();
  sub_1C1F2116C((uint64_t)v25, (uint64_t)v51);
  if (!v51[3])
  {
    sub_1C2146364((uint64_t)v51, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_8;
  }
  sub_1C1F1CB5C();
  int v26 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, v26 ^ 1u, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1C2146364((uint64_t)v11, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
    uint64_t v29 = v49;
    sub_1C21497A0();
    id v30 = v24;
    uint64_t v31 = sub_1C21497E0();
    os_log_type_t v32 = sub_1C214ABD0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v50 = v34;
      objc_super v48 = v18;
      *(_DWORD *)uint64_t v33 = 136446210;
      sub_1C1F2116C((uint64_t)v25, (uint64_t)v51);
      sub_1C2146424(0, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
      uint64_t v35 = sub_1C214A630();
      v51[0] = sub_1C1F6FD54(v35, v36, &v50);
      sub_1C214B530();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C1F0B000, v31, v32, "Incorrect view model for FieldCell: %{public}s", v33, 0xCu);
      char v28 = 1;
      swift_arrayDestroy();
      MEMORY[0x1C8754730](v34, -1, -1);
      MEMORY[0x1C8754730](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v46);
      return v28 & 1;
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v46);
LABEL_11:
    char v28 = 1;
    return v28 & 1;
  }
  sub_1C21463C0((uint64_t)v11, (uint64_t)v15);
  if (v15[*(int *)(v12 + 36)] != 1)
  {
    unint64_t v38 = &v15[*(int *)(v12 + 40)];
    if ((v38[8] & 1) == 0)
    {
      uint64_t v39 = *(void *)v38;
      uint64_t v40 = sub_1C214A6A0();

      swift_bridgeObjectRelease();
      sub_1C204FA14((uint64_t)v15);
      char v28 = v39 >= v40;
      return v28 & 1;
    }
    sub_1C204FA14((uint64_t)v15);
    swift_bridgeObjectRelease();

    goto LABEL_11;
  }
  unint64_t v27 = v42;
  sub_1C2143E94(v21, v23, v42);
  swift_bridgeObjectRelease();
  char v28 = sub_1C2148140();

  (*(void (**)(uint64_t *, uint64_t))(v43 + 8))(v27, v44);
  sub_1C204FA14((uint64_t)v15);
  return v28 & 1;
}

id sub_1C2143E94@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v90 = a3;
  sub_1C2146424(0, (unint64_t *)&unk_1EA2C5130, MEMORY[0x1E4F27A78]);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v82 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v79 - v8;
  uint64_t v10 = sub_1C2147BB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  id v81 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v92 = (char *)&v79 - v14;
  uint64_t v15 = sub_1C2147530();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  long long v91 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  id v20 = (char *)&v79 - v19;
  uint64_t v94 = a1;
  unint64_t v95 = a2;
  sub_1C2147520();
  unint64_t v86 = sub_1C1F40B78();
  uint64_t v21 = sub_1C214B580();
  unint64_t v23 = v22;
  id v24 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v84 = v16 + 8;
  uint64_t v85 = v15;
  v24(v20, v15);
  uint64_t v25 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0) {
    uint64_t v25 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (!v25)
  {
    uint64_t v52 = *MEMORY[0x1E4F660E0];
    uint64_t v53 = sub_1C2148150();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 104))(v90, v52, v53);
    return (id)swift_bridgeObjectRelease();
  }
  uint64_t v83 = v24;
  uint64_t v89 = v11;
  id v26 = sub_1C214239C();
  objc_msgSend(v26, sel_copy);

  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C1F12718(0, (unint64_t *)&unk_1EA2C7988);
  swift_dynamicCast();
  unint64_t v27 = v93;
  char v28 = sub_1C2142038();
  id v29 = objc_msgSend(v28, sel_textInputMode);

  uint64_t v88 = v10;
  if (v29 && (id v30 = objc_msgSend(v29, sel_primaryLanguage), v29, v30))
  {
    sub_1C214A5F0();

    swift_bridgeObjectRetain();
    sub_1C2147B30();
    uint64_t v31 = v89;
    uint64_t v80 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56);
    v80(v9, 0, 1, v88);
    uint64_t v32 = v88;
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v9, 1, v32) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v92, v9, v32);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v80 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56);
    v80(v9, 1, 1, v10);
  }
  sub_1C2147BA0();
  sub_1C2146364((uint64_t)v9, (unint64_t *)&unk_1EA2C5130, MEMORY[0x1E4F27A78]);
LABEL_10:
  id v87 = v27;
  id result = objc_msgSend(v27, sel_decimalSeparator);
  if (result)
  {
    uint64_t v34 = result;
    uint64_t v35 = sub_1C214A5F0();
    unint64_t v37 = v36;

    unint64_t v38 = v92;
    sub_1C2147B40();
    uint64_t v94 = v35;
    unint64_t v95 = v37;
    swift_bridgeObjectRetain();
    sub_1C214A6C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = v91;
    sub_1C2147510();
    swift_bridgeObjectRelease();
    uint64_t v94 = v21;
    unint64_t v95 = v23;
    uint64_t v40 = sub_1C214B580();
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = HIBYTE(v42) & 0xF;
    if ((v42 & 0x2000000000000000) == 0) {
      uint64_t v43 = v40 & 0xFFFFFFFFFFFFLL;
    }
    if (!v43)
    {

      swift_bridgeObjectRelease();
      v83(v39, v85);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v38, v88);
      uint64_t v54 = *MEMORY[0x1E4F660E0];
      uint64_t v55 = sub_1C2148150();
      return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 104))(v90, v54, v55);
    }
    uint64_t v44 = (void *)sub_1C214A5B0();
    id v45 = v87;
    id v46 = objc_msgSend(v87, sel_numberFromString_, v44);

    uint64_t v47 = v88;
    if (v46)
    {
      swift_bridgeObjectRelease();
      id v48 = v46;
      uint64_t v50 = v89;
      os_log_type_t v49 = v90;
      uint64_t v51 = v92;
    }
    else
    {
      uint64_t v51 = v92;
      char v56 = (void *)sub_1C2147B50();
      objc_msgSend(v45, sel_setLocale_, v56);

      os_log_type_t v57 = (void *)sub_1C214A5B0();
      swift_bridgeObjectRelease();
      id v58 = objc_msgSend(v45, sel_numberFromString_, v57);

      id v59 = sub_1C214239C();
      id v60 = objc_msgSend(v59, sel_locale);

      uint64_t v50 = v89;
      if (v60)
      {
        unint64_t v61 = v81;
        sub_1C2147B90();

        uint64_t v62 = v82;
        (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v82, v61, v47);
        v80(v62, 0, 1, v47);
        int v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 48))(v62, 1, v47);
        os_log_type_t v49 = v90;
        if (v63 == 1)
        {
          id v60 = 0;
        }
        else
        {
          id v60 = (id)sub_1C2147B50();
          (*(void (**)(char *, uint64_t))(v50 + 8))(v62, v47);
        }
      }
      else
      {
        v80(v82, 1, 1, v47);
        os_log_type_t v49 = v90;
      }
      id v64 = v87;
      objc_msgSend(v87, sel_setLocale_, v60);

      if (!v58)
      {

LABEL_29:
        v83(v91, v85);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v47);
        uint64_t v77 = *MEMORY[0x1E4F660D8];
        uint64_t v78 = sub_1C2148150();
        return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v78 - 8) + 104))(v49, v77, v78);
      }
      id v48 = v58;
    }
    id v65 = v46;
    id v66 = v87;
    id v67 = objc_msgSend(v87, sel_stringFromNumber_, v48);
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = v49;
      uint64_t v70 = sub_1C214A5F0();
      uint64_t v72 = v71;

      objc_msgSend(v48, sel_doubleValue);
      uint64_t v74 = v73;

      v83(v91, v85);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v47);
      uint64_t *v69 = v70;
      v69[1] = v72;
      v69[2] = v74;
      v69[3] = (uint64_t)v66;
      uint64_t v75 = *MEMORY[0x1E4F660E8];
      uint64_t v76 = sub_1C2148150();
      return (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v76 - 8) + 104))(v69, v75, v76);
    }

    goto LABEL_29;
  }
  __break(1u);
  return result;
}

void sub_1C2144884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C21497F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v8 = sub_1C2142038();
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    swift_bridgeObjectRetain();
    sub_1C214A6C0();
    uint64_t v14 = sub_1C214A5B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setAccessibilityIdentifier_, v14);

    uint64_t v9 = (void *)v14;
  }
  else
  {
    sub_1C21497A0();
    uint64_t v10 = sub_1C21497E0();
    os_log_type_t v11 = sub_1C214ABD0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1C1F0B000, v10, v11, "Unable to set automation identifiers as there is no base identifier.", v12, 2u);
      MEMORY[0x1C8754730](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1C2144ACC(void *a1)
{
  id v33 = a1;
  uint64_t v34 = sub_1C21497F0();
  uint64_t v2 = *(void *)(v34 - 8);
  MEMORY[0x1F4188790](v34);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C2148150();
  uint64_t v32 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (uint64_t *)((char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2146424(0, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for FieldItem();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1C1F2116C(v15, (uint64_t)v36);
  if (v36[3])
  {
    sub_1C1F1CB5C();
    int v16 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, v16 ^ 1u, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
    {
      sub_1C21463C0((uint64_t)v10, (uint64_t)v14);
      id v17 = objc_msgSend(v33, sel_text);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = sub_1C214A5F0();
        unint64_t v21 = v20;
      }
      else
      {
        uint64_t v19 = 0;
        unint64_t v21 = 0xE000000000000000;
      }
      if (v14[*(int *)(v11 + 36)] == 1
        && (sub_1C2143E94(v19, v21, v7),
            char v30 = sub_1C2148140(),
            (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v7, v5),
            (v30 & 1) == 0))
      {
        sub_1C204FA14((uint64_t)v14);
        return swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v31 = *(void (**)(char *, uint64_t, unint64_t))&v14[*(int *)(v11 + 52)];
        swift_retain();
        v31(v14, v19, v21);
        swift_bridgeObjectRelease();
        swift_release();
        return sub_1C204FA14((uint64_t)v14);
      }
    }
  }
  else
  {
    sub_1C2146364((uint64_t)v36, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  }
  sub_1C2146364((uint64_t)v10, &qword_1EA2C7980, (void (*)(uint64_t))type metadata accessor for FieldItem);
  sub_1C21497A0();
  id v22 = v1;
  unint64_t v23 = sub_1C21497E0();
  os_log_type_t v24 = sub_1C214ABD0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v35 = v26;
    *(_DWORD *)uint64_t v25 = 136446210;
    sub_1C1F2116C(v15, (uint64_t)v36);
    sub_1C2146424(0, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
    uint64_t v27 = sub_1C214A630();
    v36[0] = sub_1C1F6FD54(v27, v28, &v35);
    sub_1C214B530();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C1F0B000, v23, v24, "Incorrect view model for FieldCell: %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8754730](v26, -1, -1);
    MEMORY[0x1C8754730](v25, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v34);
}

id sub_1C21450A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FieldCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C214515C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  return sub_1C1F2116C(v3, a1);
}

uint64_t sub_1C21451B0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item;
  swift_beginAccess();
  sub_1C1F32DDC(a1, v3);
  swift_endAccess();
  sub_1C2142BCC();
  return sub_1C2146364(a1, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

uint64_t (*sub_1C214523C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C214529C;
}

uint64_t sub_1C214529C(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1C2142BCC();
  }
  return result;
}

void sub_1C21452D0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1C21452F4()
{
  uint64_t v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2145350(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(*v2 + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C21453B4())()
{
  return j__swift_endAccess;
}

id sub_1C2145418()
{
  return sub_1C214239C();
}

uint64_t _s19HealthMedicationsUI9FieldItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for FieldItem();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v43 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  int v16 = (char *)&v43 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  id v22 = (char *)&v43 - v21;
  uint64_t v23 = *(int *)(v20 + 20);
  os_log_type_t v24 = (void *)(a1 + v23);
  uint64_t v25 = *(void *)(a1 + v23 + 8);
  uint64_t v26 = (void *)(a2 + v23);
  uint64_t v27 = v26[1];
  if (!v25)
  {
    if (!v27)
    {
LABEL_12:
      sub_1C204F9B0(a1, (uint64_t)&v43 - v21);
      sub_1C204F9B0(a2, (uint64_t)v19);
      goto LABEL_13;
    }
LABEL_10:
    sub_1C204F9B0(a1, (uint64_t)&v43 - v21);
    sub_1C204F9B0(a2, (uint64_t)v19);
    goto LABEL_11;
  }
  if (!v27) {
    goto LABEL_10;
  }
  if (*v24 == *v26 && v25 == v27) {
    goto LABEL_12;
  }
  char v29 = sub_1C214BA80();
  sub_1C204F9B0(a1, (uint64_t)v22);
  sub_1C204F9B0(a2, (uint64_t)v19);
  if ((v29 & 1) == 0)
  {
LABEL_11:
    sub_1C204FA14((uint64_t)v19);
    sub_1C204FA14((uint64_t)v22);
LABEL_25:
    sub_1C204F9B0(a1, (uint64_t)v16);
    sub_1C204F9B0(a2, (uint64_t)v13);
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v44 = v7;
  uint64_t v30 = v4[6];
  uint64_t v31 = &v22[v30];
  uint64_t v32 = *(void *)&v22[v30 + 8];
  id v33 = &v19[v30];
  uint64_t v34 = *((void *)v33 + 1);
  if (!v32)
  {
    swift_bridgeObjectRetain();
    sub_1C204FA14((uint64_t)v19);
    sub_1C204FA14((uint64_t)v22);
    if (!v34)
    {
LABEL_30:
      sub_1C204F9B0(a1, (uint64_t)v16);
      sub_1C204F9B0(a2, (uint64_t)v13);
      uint64_t v7 = v44;
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (!v34)
  {
    swift_bridgeObjectRetain();
    sub_1C204FA14((uint64_t)v19);
    sub_1C204FA14((uint64_t)v22);
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v7 = v44;
    goto LABEL_25;
  }
  if (*(void *)v31 == *(void *)v33 && v32 == v34)
  {
    swift_bridgeObjectRetain();
    sub_1C204FA14((uint64_t)v19);
    sub_1C204FA14((uint64_t)v22);
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  char v36 = sub_1C214BA80();
  swift_bridgeObjectRetain();
  sub_1C204FA14((uint64_t)v19);
  sub_1C204FA14((uint64_t)v22);
  swift_bridgeObjectRelease();
  sub_1C204F9B0(a1, (uint64_t)v16);
  sub_1C204F9B0(a2, (uint64_t)v13);
  uint64_t v7 = v44;
  if ((v36 & 1) == 0)
  {
LABEL_26:
    sub_1C204FA14((uint64_t)v13);
    sub_1C204FA14((uint64_t)v16);
    sub_1C204F9B0(a1, (uint64_t)v10);
    sub_1C204F9B0(a2, (uint64_t)v7);
    goto LABEL_27;
  }
LABEL_31:
  double v39 = *(double *)&v16[v4[7]];
  sub_1C204FA14((uint64_t)v16);
  double v40 = *(double *)&v13[v4[7]];
  sub_1C204FA14((uint64_t)v13);
  sub_1C204F9B0(a1, (uint64_t)v10);
  sub_1C204F9B0(a2, (uint64_t)v7);
  if (v39 == v40)
  {
    char v41 = v10[v4[8]];
    sub_1C204FA14((uint64_t)v10);
    char v42 = v7[v4[8]];
    sub_1C204FA14((uint64_t)v7);
    char v37 = v41 ^ v42 ^ 1;
    return v37 & 1;
  }
LABEL_27:
  sub_1C204FA14((uint64_t)v7);
  sub_1C204FA14((uint64_t)v10);
  char v37 = 0;
  return v37 & 1;
}

uint64_t sub_1C2145800()
{
  return sub_1C214584C((unint64_t *)&unk_1EA2C7938, 255, (void (*)(uint64_t))type metadata accessor for FieldItem);
}

uint64_t sub_1C214584C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of CharacterLimitProvider.characterLimit.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void *initializeBufferWithCopyOfBuffer for FieldItem(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (void *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C2147B20();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)((char *)a1 + v9);
    uint64_t v14 = (void *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
    uint64_t v21 = a3[13];
    uint64_t v22 = a3[14];
    uint64_t v23 = (void *)((char *)a1 + v21);
    os_log_type_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = (void *)((char *)a1 + v22);
    uint64_t v27 = (char *)a2 + v22;
    uint64_t v28 = *(void *)((char *)a2 + v22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (v28)
    {
      uint64_t v29 = *((void *)v27 + 1);
      *uint64_t v26 = v28;
      v26[1] = v29;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    }
    uint64_t v31 = a3[15];
    uint64_t v32 = (void *)((char *)a1 + v31);
    id v33 = (void *)((char *)a2 + v31);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FieldItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C2147B20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(void *)(a1 + *(int *)(a2 + 56))) {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C2147B20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v20 = a3[13];
  uint64_t v21 = a3[14];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  uint64_t v26 = a2 + v21;
  uint64_t v27 = *(void *)(a2 + v21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v27)
  {
    uint64_t v28 = *(void *)(v26 + 8);
    *uint64_t v25 = v27;
    v25[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  uint64_t v29 = a3[15];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C2147B20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  *(unsigned char *)(v14 + 8) = *((unsigned char *)v15 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v17 = a3[13];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = a3[14];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)(a1 + v21);
  uint64_t v25 = *(void *)(a2 + v21);
  if (!v24)
  {
    if (v25)
    {
      uint64_t v27 = *(void *)(v23 + 8);
      *uint64_t v22 = v25;
      v22[1] = v27;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  if (!v25)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v26 = *(void *)(v23 + 8);
  *uint64_t v22 = v25;
  v22[1] = v26;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v28 = a3[15];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C2147B20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)uint64_t v10 = *(void *)v11;
  *(unsigned char *)(v10 + 8) = *(unsigned char *)(v11 + 8);
  uint64_t v12 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[1];
    void *v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for FieldItem(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C2147B20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  uint64_t v21 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  swift_release();
  uint64_t v22 = a3[14];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = a2 + v22;
  uint64_t v25 = *(void *)(a1 + v22);
  uint64_t v26 = *(void *)(a2 + v22);
  if (!v25)
  {
    if (v26)
    {
      uint64_t v28 = *(void *)(v24 + 8);
      *uint64_t v23 = v26;
      v23[1] = v28;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    goto LABEL_8;
  }
  if (!v26)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v27 = *(void *)(v24 + 8);
  *uint64_t v23 = v26;
  v23[1] = v27;
  swift_release();
LABEL_8:
  uint64_t v29 = a3[15];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FieldItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C21460FC);
}

uint64_t sub_1C21460FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2147B20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for FieldItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C21461D0);
}

uint64_t sub_1C21461D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1C2147B20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1C214628C()
{
  uint64_t result = sub_1C2147B20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C2146364(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1C2146424(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1C21463C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FieldItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1C2146424(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C214B4F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1C2146478()
{
  *(void *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter] = 0;
  unint64_t v1 = (uint64_t *)&v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_baseIdentifier];
  uint64_t v4 = sub_1C214A5F0();
  uint64_t v5 = v2;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  *unint64_t v1 = v4;
  v1[1] = v5;
  uint64_t v3 = &v0[OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;

  sub_1C214B910();
  __break(1u);
}

id MedicationListAllDataProvider.__allocating_init(displayType:profile:medication:predicate:)(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate;
  *(void *)&v9[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate] = 0;
  *(void *)&v9[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication] = a3;
  uint64_t v11 = *(void **)&v9[v10];
  *(void *)&v9[v10] = a4;
  id v12 = a3;
  id v13 = a4;

  v16.receiver = v9;
  v16.super_class = v4;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithDisplayType_profile_, a1, a2);

  return v14;
}

id MedicationListAllDataProvider.init(displayType:profile:medication:predicate:)(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate;
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate] = 0;
  *(void *)&v4[OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication] = a3;
  uint64_t v9 = *(void **)&v4[v8];
  *(void *)&v4[v8] = a4;
  id v10 = a3;
  id v11 = a4;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for MedicationListAllDataProvider();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithDisplayType_profile_, a1, a2);

  return v12;
}

uint64_t type metadata accessor for MedicationListAllDataProvider()
{
  return self;
}

id sub_1C21467D4()
{
  uint64_t v1 = v0;
  uint64_t v12 = MEMORY[0x1E4FBC860];
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v3, sel_semanticIdentifier);
    id v5 = objc_msgSend(v4, sel_stringValue);

    if (!v5)
    {
      sub_1C214A5F0();
      id v5 = (id)sub_1C214A5B0();
      swift_bridgeObjectRelease();
    }
    id v6 = objc_msgSend(self, sel_predicateForMedicationDoseEventWithMedicationIdentifier_, v5);

    MEMORY[0x1C87528E0]();
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C214A7D0();
    }
    sub_1C214A820();
    sub_1C214A7A0();
  }
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate);
  if (v7)
  {
    id v8 = v7;
    MEMORY[0x1C87528E0]();
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1C214A7D0();
    }
    sub_1C214A820();
    sub_1C214A7A0();
  }
  sub_1C1F12718(0, &qword_1EBF0B4B0);
  uint64_t v9 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v9);

  return v10;
}

uint64_t sub_1C2146A20(uint64_t a1)
{
  swift_getObjectType();
  sub_1C1F72C14(a1, (uint64_t)&v5);
  sub_1C1F12718(0, &qword_1EA2C79B0);
  if (swift_dynamicCast())
  {
    uint64_t v2 = sub_1C1F452BC();

    return v2;
  }
  else
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
    sub_1C214B7C0();
    swift_bridgeObjectRelease();
    unint64_t v5 = 0xD000000000000023;
    unint64_t v6 = 0x80000001C216CCA0;
    sub_1C214BC10();
    sub_1C214A6C0();
    swift_bridgeObjectRelease();
    sub_1C214A6C0();
    uint64_t result = sub_1C214B910();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C2146D0C()
{
  swift_getObjectType();
  uint64_t v1 = sub_1C2147D70();
  id v2 = objc_msgSend(v0, sel_objectAtIndex_forSection_, v1, sub_1C2147D80());
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v0, sel_profileName);
    if (v5)
    {
      sub_1C214A5F0();

      id v6 = v0;
      swift_unknownObjectRetain();
      id v5 = (id)sub_1C214A5B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v7 = v0;
      swift_unknownObjectRetain();
    }
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67A90]), sel_initWithSample_usingInsetStyling_profileName_delegate_, v4, 1, v5, v0);

    swift_unknownObjectRelease_n();
    return (uint64_t)v8;
  }
  else
  {
    swift_unknownObjectRelease();
    sub_1C214B7C0();
    swift_bridgeObjectRelease();
    sub_1C214BC10();
    sub_1C214A6C0();
    swift_bridgeObjectRelease();
    sub_1C214A6C0();
    uint64_t result = sub_1C214B910();
    __break(1u);
  }
  return result;
}

id MedicationListAllDataProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MedicationListAllDataProvider.init()()
{
}

id MedicationListAllDataProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationListAllDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MedicationListAllDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MedicationListAllDataProvider);
}

uint64_t dispatch thunk of MedicationListAllDataProvider.__allocating_init(displayType:profile:medication:predicate:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for NicknameNotesStepViewController()
{
  uint64_t result = qword_1EA2C79B8;
  if (!qword_1EA2C79B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C2147298()
{
  return swift_initClassMetadata2();
}

void sub_1C21472D8(unsigned char *a1@<X8>)
{
  *a1 = -127;
}

void sub_1C21472E4()
{
}

void sub_1C2147340()
{
}

id sub_1C2147370()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NicknameNotesStepViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C21473A8()
{
  return type metadata accessor for NicknameNotesStepViewController();
}

BOOL static FrequencyInterval.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t FrequencyInterval.text.getter()
{
  return sub_1C20C71E4(1);
}

unint64_t sub_1C2147400()
{
  unint64_t result = qword_1EA2C79C8;
  if (!qword_1EA2C79C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C79C8);
  }
  return result;
}

uint64_t sub_1C2147454()
{
  return sub_1C20C71E4(1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1C21474B0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C21474C0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C21474D0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C21474E0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C21474F0()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C2147500()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C2147510()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1C2147520()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1C2147530()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1C2147540()
{
  return MEMORY[0x1F41211E8]();
}

uint64_t sub_1C2147550()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1C2147560()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1C2147570()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1C2147580()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1C2147590()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C21475A0()
{
  return MEMORY[0x1F40E3508]();
}

uint64_t sub_1C21475B0()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C21475C0()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1C21475D0()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1C21475E0()
{
  return MEMORY[0x1F40E3858]();
}

uint64_t sub_1C21475F0()
{
  return MEMORY[0x1F40E3860]();
}

uint64_t sub_1C2147600()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1C2147610()
{
  return MEMORY[0x1F40E38E0]();
}

uint64_t sub_1C2147620()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1C2147630()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1C2147640()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1C2147650()
{
  return MEMORY[0x1F40E3960]();
}

uint64_t sub_1C2147660()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1C2147670()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1C2147680()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1C2147690()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1C21476A0()
{
  return MEMORY[0x1F40E39D8]();
}

uint64_t sub_1C21476B0()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1C21476C0()
{
  return MEMORY[0x1F40E3A40]();
}

uint64_t sub_1C21476D0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C21476E0()
{
  return MEMORY[0x1F40E3AE8]();
}

uint64_t sub_1C21476F0()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1C2147700()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1C2147710()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1C2147720()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1C2147730()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1C2147740()
{
  return MEMORY[0x1F40E4028]();
}

uint64_t sub_1C2147750()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1C2147760()
{
  return MEMORY[0x1F40E40C0]();
}

uint64_t sub_1C21477D0()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1C21477E0()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1C21477F0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C2147800()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C2147810()
{
  return MEMORY[0x1F40E4838]();
}

uint64_t sub_1C2147820()
{
  return MEMORY[0x1F40E4840]();
}

uint64_t sub_1C2147830()
{
  return MEMORY[0x1F411D690]();
}

uint64_t sub_1C2147840()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C2147850()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C2147860()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C2147870()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C2147880()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C2147890()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C21478A0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1C21478B0()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C21478C0()
{
  return MEMORY[0x1F40E4F10]();
}

uint64_t sub_1C21478D0()
{
  return MEMORY[0x1F40E4F18]();
}

uint64_t sub_1C21478E0()
{
  return MEMORY[0x1F40E4F30]();
}

uint64_t sub_1C21478F0()
{
  return MEMORY[0x1F40E4F38]();
}

uint64_t sub_1C2147900()
{
  return MEMORY[0x1F40E4F50]();
}

uint64_t sub_1C2147910()
{
  return MEMORY[0x1F40E4F58]();
}

uint64_t sub_1C2147920()
{
  return MEMORY[0x1F40E4F68]();
}

uint64_t sub_1C2147930()
{
  return MEMORY[0x1F40E4F78]();
}

uint64_t sub_1C2147940()
{
  return MEMORY[0x1F40E4F80]();
}

uint64_t sub_1C2147950()
{
  return MEMORY[0x1F40E4F88]();
}

uint64_t sub_1C2147960()
{
  return MEMORY[0x1F40E4FB8]();
}

uint64_t sub_1C2147970()
{
  return MEMORY[0x1F40E4FD0]();
}

uint64_t sub_1C2147980()
{
  return MEMORY[0x1F40E4FE8]();
}

uint64_t sub_1C2147990()
{
  return MEMORY[0x1F40E4FF0]();
}

uint64_t sub_1C21479A0()
{
  return MEMORY[0x1F40E5058]();
}

uint64_t sub_1C21479B0()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1C21479C0()
{
  return MEMORY[0x1F41211F0]();
}

uint64_t sub_1C21479D0()
{
  return MEMORY[0x1F411D698]();
}

uint64_t sub_1C21479E0()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1C21479F0()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C2147A00()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C2147A10()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C2147A20()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C2147A30()
{
  return MEMORY[0x1F411F3D8]();
}

uint64_t sub_1C2147A40()
{
  return MEMORY[0x1F411F3E0]();
}

uint64_t sub_1C2147A50()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C2147A60()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C2147A70()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1C2147A80()
{
  return MEMORY[0x1F40E5348]();
}

uint64_t sub_1C2147A90()
{
  return MEMORY[0x1F40E5358]();
}

uint64_t sub_1C2147AA0()
{
  return MEMORY[0x1F40E5368]();
}

uint64_t sub_1C2147AB0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C2147AC0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C2147AD0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C2147AE0()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C2147AF0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C2147B00()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C2147B10()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C2147B20()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C2147B30()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1C2147B40()
{
  return MEMORY[0x1F40E55E8]();
}

uint64_t sub_1C2147B50()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1C2147B60()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1C2147B70()
{
  return MEMORY[0x1F40E5668]();
}

uint64_t sub_1C2147B80()
{
  return MEMORY[0x1F40E5670]();
}

uint64_t sub_1C2147B90()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1C2147BA0()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1C2147BB0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C2147BC0()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1C2147BD0()
{
  return MEMORY[0x1F40E5930]();
}

uint64_t sub_1C2147BE0()
{
  return MEMORY[0x1F40E5950]();
}

uint64_t sub_1C2147BF0()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1C2147C00()
{
  return MEMORY[0x1F40E59B8]();
}

uint64_t sub_1C2147C10()
{
  return MEMORY[0x1F40E59C0]();
}

uint64_t sub_1C2147C20()
{
  return MEMORY[0x1F411EF90]();
}

uint64_t sub_1C2147C30()
{
  return MEMORY[0x1F411EF98]();
}

uint64_t sub_1C2147C40()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1C2147C50()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1C2147C60()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1C2147C70()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1C2147C80()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1C2147C90()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1C2147CA0()
{
  return MEMORY[0x1F40E5AA8]();
}

uint64_t sub_1C2147CB0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C2147CC0()
{
  return MEMORY[0x1F40E5AC8]();
}

uint64_t sub_1C2147CD0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C2147CE0()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1C2147CF0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C2147D00()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1C2147D10()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_1C2147D20()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1C2147D30()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C2147D40()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1C2147D50()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1C2147D60()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1C2147D70()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1C2147D80()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1C2147D90()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1C2147DA0()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1C2147DB0()
{
  return MEMORY[0x1F40E5F60]();
}

uint64_t sub_1C2147DC0()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1C2147DD0()
{
  return MEMORY[0x1F40E5F80]();
}

uint64_t sub_1C2147DE0()
{
  return MEMORY[0x1F411E0D0]();
}

uint64_t sub_1C2147DF0()
{
  return MEMORY[0x1F411E0D8]();
}

uint64_t sub_1C2147E00()
{
  return MEMORY[0x1F411E0E0]();
}

uint64_t sub_1C2147E10()
{
  return MEMORY[0x1F411FE40]();
}

uint64_t sub_1C2147E20()
{
  return MEMORY[0x1F411FE78]();
}

uint64_t sub_1C2147E30()
{
  return MEMORY[0x1F411FEA0]();
}

uint64_t sub_1C2147E40()
{
  return MEMORY[0x1F411FEA8]();
}

uint64_t sub_1C2147E50()
{
  return MEMORY[0x1F411FF68]();
}

uint64_t sub_1C2147E60()
{
  return MEMORY[0x1F4120038]();
}

uint64_t sub_1C2147E70()
{
  return MEMORY[0x1F4120438]();
}

uint64_t sub_1C2147E80()
{
  return MEMORY[0x1F4120938]();
}

uint64_t sub_1C2147E90()
{
  return MEMORY[0x1F4120940]();
}

uint64_t sub_1C2147EA0()
{
  return MEMORY[0x1F4120948]();
}

uint64_t sub_1C2147EB0()
{
  return MEMORY[0x1F4120E28]();
}

uint64_t sub_1C2147EC0()
{
  return MEMORY[0x1F4120E78]();
}

uint64_t sub_1C2147ED0()
{
  return MEMORY[0x1F4120B38]();
}

uint64_t sub_1C2147EE0()
{
  return MEMORY[0x1F4120BE0]();
}

uint64_t sub_1C2147EF0()
{
  return MEMORY[0x1F41211F8]();
}

uint64_t sub_1C2147F00()
{
  return MEMORY[0x1F4121200]();
}

uint64_t sub_1C2147F10()
{
  return MEMORY[0x1F4121208]();
}

uint64_t sub_1C2147F20()
{
  return MEMORY[0x1F4121210]();
}

uint64_t sub_1C2147F30()
{
  return MEMORY[0x1F4121218]();
}

uint64_t sub_1C2147F40()
{
  return MEMORY[0x1F4121220]();
}

uint64_t sub_1C2147F50()
{
  return MEMORY[0x1F4121228]();
}

uint64_t sub_1C2147F60()
{
  return MEMORY[0x1F4121230]();
}

uint64_t sub_1C2147F70()
{
  return MEMORY[0x1F4121238]();
}

uint64_t _s19HealthMedicationsUI34InteractionSeperatorLineDataSourceCfd_0()
{
  return MEMORY[0x1F4121240]();
}

uint64_t sub_1C2147F90()
{
  return MEMORY[0x1F4121248]();
}

uint64_t sub_1C2147FA0()
{
  return MEMORY[0x1F4121250]();
}

uint64_t sub_1C2147FB0()
{
  return MEMORY[0x1F4121258]();
}

uint64_t sub_1C2147FC0()
{
  return MEMORY[0x1F4121260]();
}

uint64_t sub_1C2147FD0()
{
  return MEMORY[0x1F4121268]();
}

uint64_t sub_1C2147FE0()
{
  return MEMORY[0x1F4121270]();
}

uint64_t sub_1C2147FF0()
{
  return MEMORY[0x1F4121278]();
}

uint64_t sub_1C2148000()
{
  return MEMORY[0x1F4121280]();
}

uint64_t sub_1C2148010()
{
  return MEMORY[0x1F4121288]();
}

uint64_t sub_1C2148020()
{
  return MEMORY[0x1F4121290]();
}

uint64_t sub_1C2148030()
{
  return MEMORY[0x1F4121298]();
}

uint64_t sub_1C2148040()
{
  return MEMORY[0x1F41212A0]();
}

uint64_t sub_1C2148050()
{
  return MEMORY[0x1F41212A8]();
}

uint64_t sub_1C2148060()
{
  return MEMORY[0x1F41212B0]();
}

uint64_t sub_1C2148070()
{
  return MEMORY[0x1F41212B8]();
}

uint64_t sub_1C2148080()
{
  return MEMORY[0x1F41212C0]();
}

uint64_t sub_1C2148090()
{
  return MEMORY[0x1F41212C8]();
}

uint64_t sub_1C21480A0()
{
  return MEMORY[0x1F41212D0]();
}

uint64_t sub_1C21480B0()
{
  return MEMORY[0x1F41212D8]();
}

uint64_t sub_1C21480C0()
{
  return MEMORY[0x1F41212E0]();
}

uint64_t sub_1C21480D0()
{
  return MEMORY[0x1F41212E8]();
}

uint64_t sub_1C21480E0()
{
  return MEMORY[0x1F411D818]();
}

uint64_t sub_1C21480F0()
{
  return MEMORY[0x1F411D820]();
}

uint64_t sub_1C2148100()
{
  return MEMORY[0x1F411DBD0]();
}

uint64_t sub_1C2148110()
{
  return MEMORY[0x1F411DBD8]();
}

uint64_t sub_1C2148120()
{
  return MEMORY[0x1F411DBF8]();
}

uint64_t sub_1C2148130()
{
  return MEMORY[0x1F411DC00]();
}

uint64_t sub_1C2148140()
{
  return MEMORY[0x1F411DCD8]();
}

uint64_t sub_1C2148150()
{
  return MEMORY[0x1F411DCE0]();
}

uint64_t sub_1C2148160()
{
  return MEMORY[0x1F411E130]();
}

uint64_t sub_1C2148170()
{
  return MEMORY[0x1F411E158]();
}

uint64_t sub_1C2148180()
{
  return MEMORY[0x1F411E168]();
}

uint64_t sub_1C2148190()
{
  return MEMORY[0x1F411E198]();
}

uint64_t sub_1C21481A0()
{
  return MEMORY[0x1F411E208]();
}

uint64_t sub_1C21481B0()
{
  return MEMORY[0x1F411E210]();
}

uint64_t sub_1C21481C0()
{
  return MEMORY[0x1F411E218]();
}

uint64_t sub_1C21481D0()
{
  return MEMORY[0x1F411E220]();
}

uint64_t sub_1C21481E0()
{
  return MEMORY[0x1F411E240]();
}

uint64_t sub_1C21481F0()
{
  return MEMORY[0x1F411E248]();
}

uint64_t sub_1C2148200()
{
  return MEMORY[0x1F411E250]();
}

uint64_t sub_1C2148210()
{
  return MEMORY[0x1F411E2D0]();
}

uint64_t sub_1C2148220()
{
  return MEMORY[0x1F411E2D8]();
}

uint64_t sub_1C2148230()
{
  return MEMORY[0x1F411E2F0]();
}

uint64_t sub_1C2148240()
{
  return MEMORY[0x1F411E2F8]();
}

uint64_t sub_1C2148250()
{
  return MEMORY[0x1F411E300]();
}

uint64_t sub_1C2148260()
{
  return MEMORY[0x1F411E308]();
}

uint64_t sub_1C2148270()
{
  return MEMORY[0x1F411E318]();
}

uint64_t sub_1C2148280()
{
  return MEMORY[0x1F411E320]();
}

uint64_t sub_1C2148290()
{
  return MEMORY[0x1F411E328]();
}

uint64_t sub_1C21482A0()
{
  return MEMORY[0x1F411E330]();
}

uint64_t sub_1C21482B0()
{
  return MEMORY[0x1F411E338]();
}

uint64_t sub_1C21482C0()
{
  return MEMORY[0x1F411E340]();
}

uint64_t sub_1C21482D0()
{
  return MEMORY[0x1F411E3F0]();
}

uint64_t sub_1C21482E0()
{
  return MEMORY[0x1F411E3F8]();
}

uint64_t sub_1C21482F0()
{
  return MEMORY[0x1F411E400]();
}

uint64_t sub_1C2148300()
{
  return MEMORY[0x1F411E458]();
}

uint64_t sub_1C2148310()
{
  return MEMORY[0x1F411E460]();
}

uint64_t sub_1C2148320()
{
  return MEMORY[0x1F411E488]();
}

uint64_t sub_1C2148330()
{
  return MEMORY[0x1F411E490]();
}

uint64_t sub_1C2148340()
{
  return MEMORY[0x1F411E4A0]();
}

uint64_t sub_1C2148350()
{
  return MEMORY[0x1F411E4A8]();
}

uint64_t sub_1C2148360()
{
  return MEMORY[0x1F411E4B0]();
}

uint64_t sub_1C2148370()
{
  return MEMORY[0x1F411E4B8]();
}

uint64_t sub_1C2148380()
{
  return MEMORY[0x1F411E4C8]();
}

uint64_t sub_1C2148390()
{
  return MEMORY[0x1F411E4E8]();
}

uint64_t sub_1C21483A0()
{
  return MEMORY[0x1F411E4F0]();
}

uint64_t sub_1C21483B0()
{
  return MEMORY[0x1F411E4F8]();
}

uint64_t sub_1C21483C0()
{
  return MEMORY[0x1F411E500]();
}

uint64_t sub_1C21483D0()
{
  return MEMORY[0x1F411E538]();
}

uint64_t sub_1C21483E0()
{
  return MEMORY[0x1F411E540]();
}

uint64_t sub_1C21483F0()
{
  return MEMORY[0x1F411E550]();
}

uint64_t sub_1C2148400()
{
  return MEMORY[0x1F411E560]();
}

uint64_t sub_1C2148410()
{
  return MEMORY[0x1F411E568]();
}

uint64_t sub_1C2148450()
{
  return MEMORY[0x1F411E5E8]();
}

uint64_t sub_1C2148460()
{
  return MEMORY[0x1F411E5F0]();
}

uint64_t sub_1C2148470()
{
  return MEMORY[0x1F411E638]();
}

uint64_t sub_1C2148480()
{
  return MEMORY[0x1F411E648]();
}

uint64_t sub_1C2148490()
{
  return MEMORY[0x1F411E650]();
}

uint64_t sub_1C21484A0()
{
  return MEMORY[0x1F411E658]();
}

uint64_t sub_1C21484B0()
{
  return MEMORY[0x1F411E660]();
}

uint64_t sub_1C21484C0()
{
  return MEMORY[0x1F411E668]();
}

uint64_t sub_1C21484D0()
{
  return MEMORY[0x1F411E670]();
}

uint64_t sub_1C21484E0()
{
  return MEMORY[0x1F411E680]();
}

uint64_t sub_1C21484F0()
{
  return MEMORY[0x1F411E688]();
}

uint64_t sub_1C2148500()
{
  return MEMORY[0x1F411E6C0]();
}

uint64_t sub_1C2148510()
{
  return MEMORY[0x1F411E6C8]();
}

uint64_t sub_1C2148520()
{
  return MEMORY[0x1F411E6D0]();
}

uint64_t sub_1C2148530()
{
  return MEMORY[0x1F411E6D8]();
}

uint64_t sub_1C2148540()
{
  return MEMORY[0x1F411E6E0]();
}

uint64_t sub_1C2148550()
{
  return MEMORY[0x1F411E6F8]();
}

uint64_t sub_1C2148560()
{
  return MEMORY[0x1F411E708]();
}

uint64_t sub_1C2148570()
{
  return MEMORY[0x1F411E718]();
}

uint64_t sub_1C2148580()
{
  return MEMORY[0x1F411E728]();
}

uint64_t sub_1C2148590()
{
  return MEMORY[0x1F411E730]();
}

uint64_t sub_1C21485A0()
{
  return MEMORY[0x1F411E738]();
}

uint64_t sub_1C21485B0()
{
  return MEMORY[0x1F411E740]();
}

uint64_t sub_1C21485C0()
{
  return MEMORY[0x1F411E758]();
}

uint64_t sub_1C21485D0()
{
  return MEMORY[0x1F411E760]();
}

uint64_t sub_1C21485E0()
{
  return MEMORY[0x1F411E768]();
}

uint64_t sub_1C21485F0()
{
  return MEMORY[0x1F411E778]();
}

uint64_t sub_1C2148600()
{
  return MEMORY[0x1F411E780]();
}

uint64_t sub_1C2148610()
{
  return MEMORY[0x1F411E790]();
}

uint64_t sub_1C2148620()
{
  return MEMORY[0x1F411E798]();
}

uint64_t sub_1C2148630()
{
  return MEMORY[0x1F411E7A0]();
}

uint64_t sub_1C2148640()
{
  return MEMORY[0x1F411E7B0]();
}

uint64_t sub_1C2148650()
{
  return MEMORY[0x1F411E7B8]();
}

uint64_t sub_1C2148660()
{
  return MEMORY[0x1F411E7C0]();
}

uint64_t sub_1C2148670()
{
  return MEMORY[0x1F411E7E0]();
}

uint64_t sub_1C2148680()
{
  return MEMORY[0x1F411E7E8]();
}

uint64_t sub_1C2148690()
{
  return MEMORY[0x1F411E7F0]();
}

uint64_t sub_1C21486A0()
{
  return MEMORY[0x1F411E7F8]();
}

uint64_t sub_1C21486B0()
{
  return MEMORY[0x1F411E800]();
}

uint64_t sub_1C21486C0()
{
  return MEMORY[0x1F411E808]();
}

uint64_t sub_1C21486D0()
{
  return MEMORY[0x1F411E810]();
}

uint64_t sub_1C21486E0()
{
  return MEMORY[0x1F411E818]();
}

uint64_t sub_1C21486F0()
{
  return MEMORY[0x1F411E820]();
}

uint64_t sub_1C2148700()
{
  return MEMORY[0x1F411E838]();
}

uint64_t sub_1C2148710()
{
  return MEMORY[0x1F411E840]();
}

uint64_t sub_1C2148720()
{
  return MEMORY[0x1F411E880]();
}

uint64_t sub_1C2148730()
{
  return MEMORY[0x1F411E888]();
}

uint64_t sub_1C2148740()
{
  return MEMORY[0x1F411E898]();
}

uint64_t sub_1C2148750()
{
  return MEMORY[0x1F411E8A0]();
}

uint64_t sub_1C2148760()
{
  return MEMORY[0x1F411E8A8]();
}

uint64_t sub_1C2148770()
{
  return MEMORY[0x1F411E8B8]();
}

uint64_t sub_1C2148780()
{
  return MEMORY[0x1F411E8C8]();
}

uint64_t sub_1C2148790()
{
  return MEMORY[0x1F411E8D0]();
}

uint64_t sub_1C21487A0()
{
  return MEMORY[0x1F411E8D8]();
}

uint64_t sub_1C21487B0()
{
  return MEMORY[0x1F411E8E0]();
}

uint64_t sub_1C21487C0()
{
  return MEMORY[0x1F411E938]();
}

uint64_t sub_1C21487D0()
{
  return MEMORY[0x1F411E940]();
}

uint64_t _s19HealthMedicationsUI38InteractionFactorsLifestyleOptionsItemCfd_0()
{
  return MEMORY[0x1F411E948]();
}

uint64_t sub_1C21487F0()
{
  return MEMORY[0x1F411E970]();
}

uint64_t sub_1C2148800()
{
  return MEMORY[0x1F411E980]();
}

uint64_t sub_1C2148810()
{
  return MEMORY[0x1F411E990]();
}

uint64_t sub_1C2148820()
{
  return MEMORY[0x1F411E9B0]();
}

uint64_t sub_1C2148830()
{
  return MEMORY[0x1F411E9B8]();
}

uint64_t sub_1C2148840()
{
  return MEMORY[0x1F411E9C0]();
}

uint64_t sub_1C2148850()
{
  return MEMORY[0x1F411E9C8]();
}

uint64_t sub_1C2148860()
{
  return MEMORY[0x1F411E9D0]();
}

uint64_t sub_1C2148870()
{
  return MEMORY[0x1F411E9D8]();
}

uint64_t sub_1C2148880()
{
  return MEMORY[0x1F411E9E0]();
}

uint64_t sub_1C2148890()
{
  return MEMORY[0x1F411EA00]();
}

uint64_t sub_1C21488A0()
{
  return MEMORY[0x1F411EA18]();
}

uint64_t sub_1C21488B0()
{
  return MEMORY[0x1F411EA20]();
}

uint64_t sub_1C21488C0()
{
  return MEMORY[0x1F411EA28]();
}

uint64_t sub_1C21488D0()
{
  return MEMORY[0x1F411EA30]();
}

uint64_t sub_1C21488E0()
{
  return MEMORY[0x1F411EA80]();
}

uint64_t sub_1C21488F0()
{
  return MEMORY[0x1F411EA88]();
}

uint64_t sub_1C2148900()
{
  return MEMORY[0x1F411EA90]();
}

uint64_t sub_1C2148910()
{
  return MEMORY[0x1F411EAE0]();
}

uint64_t sub_1C2148920()
{
  return MEMORY[0x1F411EAE8]();
}

uint64_t sub_1C2148930()
{
  return MEMORY[0x1F411EB38]();
}

uint64_t sub_1C2148940()
{
  return MEMORY[0x1F411EB40]();
}

uint64_t sub_1C2148950()
{
  return MEMORY[0x1F411EB48]();
}

uint64_t sub_1C2148960()
{
  return MEMORY[0x1F411EB50]();
}

uint64_t sub_1C2148970()
{
  return MEMORY[0x1F411EB70]();
}

uint64_t sub_1C2148980()
{
  return MEMORY[0x1F411EB78]();
}

uint64_t sub_1C2148990()
{
  return MEMORY[0x1F411EB80]();
}

uint64_t sub_1C21489A0()
{
  return MEMORY[0x1F411EB98]();
}

uint64_t sub_1C21489B0()
{
  return MEMORY[0x1F411EBA0]();
}

uint64_t sub_1C21489C0()
{
  return MEMORY[0x1F411EBA8]();
}

uint64_t sub_1C21489D0()
{
  return MEMORY[0x1F411EBB8]();
}

uint64_t sub_1C21489E0()
{
  return MEMORY[0x1F411EBC0]();
}

uint64_t sub_1C2148A00()
{
  return MEMORY[0x1F411EBD0]();
}

uint64_t sub_1C2148A10()
{
  return MEMORY[0x1F411EC28]();
}

uint64_t sub_1C2148A20()
{
  return MEMORY[0x1F411EC58]();
}

uint64_t sub_1C2148A30()
{
  return MEMORY[0x1F411EC60]();
}

uint64_t sub_1C2148A40()
{
  return MEMORY[0x1F411EC88]();
}

uint64_t sub_1C2148A50()
{
  return MEMORY[0x1F411EC90]();
}

uint64_t sub_1C2148A60()
{
  return MEMORY[0x1F411EC98]();
}

uint64_t sub_1C2148A70()
{
  return MEMORY[0x1F411ECA0]();
}

uint64_t sub_1C2148A80()
{
  return MEMORY[0x1F411ECC8]();
}

uint64_t sub_1C2148A90()
{
  return MEMORY[0x1F411ECD0]();
}

uint64_t sub_1C2148AA0()
{
  return MEMORY[0x1F411ECD8]();
}

uint64_t sub_1C2148AB0()
{
  return MEMORY[0x1F411ED18]();
}

uint64_t sub_1C2148AC0()
{
  return MEMORY[0x1F411ED20]();
}

uint64_t sub_1C2148AD0()
{
  return MEMORY[0x1F411ED28]();
}

uint64_t sub_1C2148AE0()
{
  return MEMORY[0x1F411ED30]();
}

uint64_t sub_1C2148AF0()
{
  return MEMORY[0x1F411ED38]();
}

uint64_t sub_1C2148B00()
{
  return MEMORY[0x1F411ED40]();
}

uint64_t sub_1C2148B10()
{
  return MEMORY[0x1F411ED48]();
}

uint64_t sub_1C2148B20()
{
  return MEMORY[0x1F411ED50]();
}

uint64_t sub_1C2148B30()
{
  return MEMORY[0x1F411ED58]();
}

uint64_t sub_1C2148B40()
{
  return MEMORY[0x1F411ED70]();
}

uint64_t sub_1C2148B50()
{
  return MEMORY[0x1F411ED78]();
}

uint64_t sub_1C2148B60()
{
  return MEMORY[0x1F411ED80]();
}

uint64_t sub_1C2148B70()
{
  return MEMORY[0x1F411ED88]();
}

uint64_t sub_1C2148B80()
{
  return MEMORY[0x1F411ED90]();
}

uint64_t sub_1C2148B90()
{
  return MEMORY[0x1F411FA80]();
}

uint64_t sub_1C2148BA0()
{
  return MEMORY[0x1F411FA88]();
}

uint64_t sub_1C2148BB0()
{
  return MEMORY[0x1F411FA90]();
}

uint64_t sub_1C2148BC0()
{
  return MEMORY[0x1F411FA98]();
}

uint64_t sub_1C2148BD0()
{
  return MEMORY[0x1F411FAA0]();
}

uint64_t sub_1C2148BE0()
{
  return MEMORY[0x1F411FAA8]();
}

uint64_t sub_1C2148BF0()
{
  return MEMORY[0x1F411FAB0]();
}

uint64_t sub_1C2148C00()
{
  return MEMORY[0x1F411FAB8]();
}

uint64_t sub_1C2148C10()
{
  return MEMORY[0x1F411FAC0]();
}

uint64_t sub_1C2148C20()
{
  return MEMORY[0x1F411FAC8]();
}

uint64_t sub_1C2148C30()
{
  return MEMORY[0x1F411FAD0]();
}

uint64_t sub_1C2148C40()
{
  return MEMORY[0x1F411FAD8]();
}

uint64_t sub_1C2148C50()
{
  return MEMORY[0x1F411FAE0]();
}

uint64_t sub_1C2148C60()
{
  return MEMORY[0x1F411FAE8]();
}

uint64_t sub_1C2148C70()
{
  return MEMORY[0x1F411FAF0]();
}

uint64_t sub_1C2148C90()
{
  return MEMORY[0x1F411F3F0]();
}

uint64_t sub_1C2148CA0()
{
  return MEMORY[0x1F411F3F8]();
}

uint64_t sub_1C2148CB0()
{
  return MEMORY[0x1F411F400]();
}

uint64_t sub_1C2148CC0()
{
  return MEMORY[0x1F411F408]();
}

uint64_t sub_1C2148CD0()
{
  return MEMORY[0x1F411F410]();
}

uint64_t sub_1C2148CE0()
{
  return MEMORY[0x1F411F418]();
}

uint64_t sub_1C2148CF0()
{
  return MEMORY[0x1F411F420]();
}

uint64_t sub_1C2148D00()
{
  return MEMORY[0x1F411F428]();
}

uint64_t sub_1C2148D10()
{
  return MEMORY[0x1F411F430]();
}

uint64_t sub_1C2148D20()
{
  return MEMORY[0x1F411F438]();
}

uint64_t sub_1C2148D30()
{
  return MEMORY[0x1F411F440]();
}

uint64_t sub_1C2148D40()
{
  return MEMORY[0x1F411F448]();
}

uint64_t sub_1C2148D50()
{
  return MEMORY[0x1F411F450]();
}

uint64_t sub_1C2148D60()
{
  return MEMORY[0x1F411F458]();
}

uint64_t sub_1C2148D70()
{
  return MEMORY[0x1F411F460]();
}

uint64_t sub_1C2148D80()
{
  return MEMORY[0x1F411F468]();
}

uint64_t sub_1C2148D90()
{
  return MEMORY[0x1F411F470]();
}

uint64_t sub_1C2148DA0()
{
  return MEMORY[0x1F411F478]();
}

uint64_t sub_1C2148DB0()
{
  return MEMORY[0x1F411F480]();
}

uint64_t sub_1C2148DC0()
{
  return MEMORY[0x1F411F488]();
}

uint64_t sub_1C2148DD0()
{
  return MEMORY[0x1F411F490]();
}

uint64_t sub_1C2148DE0()
{
  return MEMORY[0x1F411F498]();
}

uint64_t sub_1C2148DF0()
{
  return MEMORY[0x1F411F4A0]();
}

uint64_t sub_1C2148E00()
{
  return MEMORY[0x1F411F4A8]();
}

uint64_t sub_1C2148E10()
{
  return MEMORY[0x1F411F4B0]();
}

uint64_t sub_1C2148E20()
{
  return MEMORY[0x1F411F4B8]();
}

uint64_t sub_1C2148E30()
{
  return MEMORY[0x1F411F4C0]();
}

uint64_t sub_1C2148E40()
{
  return MEMORY[0x1F411F4C8]();
}

uint64_t sub_1C2148E50()
{
  return MEMORY[0x1F411F4D0]();
}

uint64_t sub_1C2148E60()
{
  return MEMORY[0x1F411F4D8]();
}

uint64_t sub_1C2148E70()
{
  return MEMORY[0x1F411F4E0]();
}

uint64_t sub_1C2148E80()
{
  return MEMORY[0x1F411F4E8]();
}

uint64_t sub_1C2148E90()
{
  return MEMORY[0x1F411F4F0]();
}

uint64_t sub_1C2148EA0()
{
  return MEMORY[0x1F411F4F8]();
}

uint64_t sub_1C2148EB0()
{
  return MEMORY[0x1F411F500]();
}

uint64_t sub_1C2148EC0()
{
  return MEMORY[0x1F411F508]();
}

uint64_t sub_1C2148ED0()
{
  return MEMORY[0x1F411F510]();
}

uint64_t sub_1C2148EE0()
{
  return MEMORY[0x1F411F518]();
}

uint64_t sub_1C2148EF0()
{
  return MEMORY[0x1F411F520]();
}

uint64_t sub_1C2148F00()
{
  return MEMORY[0x1F411F528]();
}

uint64_t sub_1C2148F10()
{
  return MEMORY[0x1F411F530]();
}

uint64_t sub_1C2148F20()
{
  return MEMORY[0x1F411F538]();
}

uint64_t sub_1C2148F30()
{
  return MEMORY[0x1F411F540]();
}

uint64_t sub_1C2148F40()
{
  return MEMORY[0x1F411F548]();
}

uint64_t sub_1C2148F50()
{
  return MEMORY[0x1F411F550]();
}

uint64_t sub_1C2148F60()
{
  return MEMORY[0x1F411F558]();
}

uint64_t sub_1C2148F70()
{
  return MEMORY[0x1F411F560]();
}

uint64_t sub_1C2148F80()
{
  return MEMORY[0x1F411F568]();
}

uint64_t sub_1C2148F90()
{
  return MEMORY[0x1F411F570]();
}

uint64_t sub_1C2148FA0()
{
  return MEMORY[0x1F411F578]();
}

uint64_t sub_1C2148FB0()
{
  return MEMORY[0x1F411F580]();
}

uint64_t sub_1C2148FC0()
{
  return MEMORY[0x1F411F588]();
}

uint64_t sub_1C2148FD0()
{
  return MEMORY[0x1F411F590]();
}

uint64_t sub_1C2148FE0()
{
  return MEMORY[0x1F411F598]();
}

uint64_t sub_1C2148FF0()
{
  return MEMORY[0x1F411F5A0]();
}

uint64_t sub_1C2149000()
{
  return MEMORY[0x1F411F5A8]();
}

uint64_t sub_1C2149010()
{
  return MEMORY[0x1F411F5B0]();
}

uint64_t sub_1C2149020()
{
  return MEMORY[0x1F411F5B8]();
}

uint64_t sub_1C2149030()
{
  return MEMORY[0x1F411F5C0]();
}

uint64_t sub_1C2149040()
{
  return MEMORY[0x1F411F5C8]();
}

uint64_t sub_1C2149050()
{
  return MEMORY[0x1F411F5D0]();
}

uint64_t sub_1C2149060()
{
  return MEMORY[0x1F411F5D8]();
}

uint64_t sub_1C2149070()
{
  return MEMORY[0x1F411F5E0]();
}

uint64_t sub_1C2149080()
{
  return MEMORY[0x1F411F5E8]();
}

uint64_t sub_1C2149090()
{
  return MEMORY[0x1F411F5F0]();
}

uint64_t sub_1C21490A0()
{
  return MEMORY[0x1F411F5F8]();
}

uint64_t sub_1C21490B0()
{
  return MEMORY[0x1F411F600]();
}

uint64_t sub_1C21490C0()
{
  return MEMORY[0x1F411F608]();
}

uint64_t sub_1C21490D0()
{
  return MEMORY[0x1F411F610]();
}

uint64_t sub_1C21490E0()
{
  return MEMORY[0x1F411F618]();
}

uint64_t sub_1C21490F0()
{
  return MEMORY[0x1F411F620]();
}

uint64_t sub_1C2149100()
{
  return MEMORY[0x1F411F628]();
}

uint64_t sub_1C2149110()
{
  return MEMORY[0x1F411F630]();
}

uint64_t sub_1C2149120()
{
  return MEMORY[0x1F411F638]();
}

uint64_t sub_1C2149130()
{
  return MEMORY[0x1F411F640]();
}

uint64_t sub_1C2149140()
{
  return MEMORY[0x1F411F648]();
}

uint64_t sub_1C2149160()
{
  return MEMORY[0x1F411F658]();
}

uint64_t sub_1C2149170()
{
  return MEMORY[0x1F411F660]();
}

uint64_t sub_1C2149180()
{
  return MEMORY[0x1F411F668]();
}

uint64_t sub_1C2149190()
{
  return MEMORY[0x1F411F670]();
}

uint64_t sub_1C21491A0()
{
  return MEMORY[0x1F411F678]();
}

uint64_t sub_1C21491B0()
{
  return MEMORY[0x1F411F680]();
}

uint64_t sub_1C21491C0()
{
  return MEMORY[0x1F411F688]();
}

uint64_t sub_1C21491D0()
{
  return MEMORY[0x1F411F690]();
}

uint64_t sub_1C21491E0()
{
  return MEMORY[0x1F411F698]();
}

uint64_t sub_1C21491F0()
{
  return MEMORY[0x1F411F6A0]();
}

uint64_t sub_1C2149200()
{
  return MEMORY[0x1F411F6A8]();
}

uint64_t sub_1C2149210()
{
  return MEMORY[0x1F411F6B0]();
}

uint64_t sub_1C2149220()
{
  return MEMORY[0x1F411F6B8]();
}

uint64_t sub_1C2149230()
{
  return MEMORY[0x1F411F6C0]();
}

uint64_t sub_1C2149240()
{
  return MEMORY[0x1F411F6C8]();
}

uint64_t sub_1C2149250()
{
  return MEMORY[0x1F411F6D0]();
}

uint64_t sub_1C2149260()
{
  return MEMORY[0x1F411F6D8]();
}

uint64_t sub_1C2149270()
{
  return MEMORY[0x1F411F6E0]();
}

uint64_t sub_1C2149280()
{
  return MEMORY[0x1F411F6E8]();
}

uint64_t sub_1C2149290()
{
  return MEMORY[0x1F411F6F0]();
}

uint64_t sub_1C21492A0()
{
  return MEMORY[0x1F411F6F8]();
}

uint64_t sub_1C21492B0()
{
  return MEMORY[0x1F411F700]();
}

uint64_t sub_1C21492C0()
{
  return MEMORY[0x1F411F708]();
}

uint64_t sub_1C21492D0()
{
  return MEMORY[0x1F411F710]();
}

uint64_t sub_1C21492E0()
{
  return MEMORY[0x1F411F718]();
}

uint64_t sub_1C21492F0()
{
  return MEMORY[0x1F411F720]();
}

uint64_t sub_1C2149300()
{
  return MEMORY[0x1F411F728]();
}

uint64_t sub_1C2149310()
{
  return MEMORY[0x1F411F730]();
}

uint64_t sub_1C2149320()
{
  return MEMORY[0x1F411F738]();
}

uint64_t sub_1C2149330()
{
  return MEMORY[0x1F411F740]();
}

uint64_t sub_1C2149340()
{
  return MEMORY[0x1F411F748]();
}

uint64_t sub_1C2149350()
{
  return MEMORY[0x1F411F750]();
}

uint64_t sub_1C2149360()
{
  return MEMORY[0x1F411F758]();
}

uint64_t sub_1C2149370()
{
  return MEMORY[0x1F411F760]();
}

uint64_t sub_1C2149380()
{
  return MEMORY[0x1F411F768]();
}

uint64_t sub_1C2149390()
{
  return MEMORY[0x1F411F770]();
}

uint64_t sub_1C21493B0()
{
  return MEMORY[0x1F411F780]();
}

uint64_t sub_1C21493C0()
{
  return MEMORY[0x1F411F788]();
}

uint64_t sub_1C21493D0()
{
  return MEMORY[0x1F411F790]();
}

uint64_t sub_1C21493E0()
{
  return MEMORY[0x1F411F798]();
}

uint64_t sub_1C21493F0()
{
  return MEMORY[0x1F411F7A0]();
}

uint64_t sub_1C2149400()
{
  return MEMORY[0x1F411F7A8]();
}

uint64_t sub_1C2149410()
{
  return MEMORY[0x1F411F7B0]();
}

uint64_t sub_1C2149420()
{
  return MEMORY[0x1F411F7B8]();
}

uint64_t sub_1C2149430()
{
  return MEMORY[0x1F411F7C0]();
}

uint64_t sub_1C2149440()
{
  return MEMORY[0x1F411F7C8]();
}

uint64_t sub_1C2149450()
{
  return MEMORY[0x1F411F7D0]();
}

uint64_t sub_1C2149460()
{
  return MEMORY[0x1F411F7D8]();
}

uint64_t sub_1C2149470()
{
  return MEMORY[0x1F411F7E0]();
}

uint64_t sub_1C2149480()
{
  return MEMORY[0x1F411F7E8]();
}

uint64_t sub_1C2149490()
{
  return MEMORY[0x1F411F7F0]();
}

uint64_t sub_1C21494A0()
{
  return MEMORY[0x1F411F7F8]();
}

uint64_t sub_1C21494B0()
{
  return MEMORY[0x1F411F800]();
}

uint64_t sub_1C21494C0()
{
  return MEMORY[0x1F411F808]();
}

uint64_t sub_1C21494D0()
{
  return MEMORY[0x1F411F810]();
}

uint64_t sub_1C21494E0()
{
  return MEMORY[0x1F411F818]();
}

uint64_t sub_1C21494F0()
{
  return MEMORY[0x1F411F820]();
}

uint64_t sub_1C2149500()
{
  return MEMORY[0x1F411F828]();
}

uint64_t sub_1C2149510()
{
  return MEMORY[0x1F411F830]();
}

uint64_t sub_1C2149520()
{
  return MEMORY[0x1F411F838]();
}

uint64_t sub_1C2149530()
{
  return MEMORY[0x1F411F840]();
}

uint64_t sub_1C2149540()
{
  return MEMORY[0x1F411F848]();
}

uint64_t sub_1C2149550()
{
  return MEMORY[0x1F411F850]();
}

uint64_t sub_1C2149560()
{
  return MEMORY[0x1F411F858]();
}

uint64_t sub_1C2149570()
{
  return MEMORY[0x1F411F860]();
}

uint64_t sub_1C2149580()
{
  return MEMORY[0x1F411F868]();
}

uint64_t sub_1C2149590()
{
  return MEMORY[0x1F411F870]();
}

uint64_t sub_1C21495A0()
{
  return MEMORY[0x1F411F878]();
}

uint64_t sub_1C21495B0()
{
  return MEMORY[0x1F411F880]();
}

uint64_t sub_1C21495C0()
{
  return MEMORY[0x1F411F888]();
}

uint64_t sub_1C21495D0()
{
  return MEMORY[0x1F411F890]();
}

uint64_t sub_1C21495E0()
{
  return MEMORY[0x1F411F898]();
}

uint64_t sub_1C21495F0()
{
  return MEMORY[0x1F411F8A0]();
}

uint64_t sub_1C2149600()
{
  return MEMORY[0x1F411F8A8]();
}

uint64_t sub_1C2149610()
{
  return MEMORY[0x1F411F8B0]();
}

uint64_t sub_1C2149620()
{
  return MEMORY[0x1F411F8B8]();
}

uint64_t sub_1C2149630()
{
  return MEMORY[0x1F411F8C0]();
}

uint64_t sub_1C2149640()
{
  return MEMORY[0x1F411F8C8]();
}

uint64_t sub_1C2149650()
{
  return MEMORY[0x1F411F8D0]();
}

uint64_t sub_1C2149660()
{
  return MEMORY[0x1F411F8D8]();
}

uint64_t sub_1C2149670()
{
  return MEMORY[0x1F411F8E0]();
}

uint64_t sub_1C2149680()
{
  return MEMORY[0x1F411F8E8]();
}

uint64_t sub_1C2149690()
{
  return MEMORY[0x1F411F8F0]();
}

uint64_t sub_1C21496A0()
{
  return MEMORY[0x1F411F8F8]();
}

uint64_t sub_1C21496B0()
{
  return MEMORY[0x1F411F900]();
}

uint64_t sub_1C21496C0()
{
  return MEMORY[0x1F4121138]();
}

uint64_t sub_1C21496D0()
{
  return MEMORY[0x1F411F908]();
}

uint64_t sub_1C21496E0()
{
  return MEMORY[0x1F411F910]();
}

uint64_t sub_1C21496F0()
{
  return MEMORY[0x1F411F918]();
}

uint64_t sub_1C2149700()
{
  return MEMORY[0x1F41212F0]();
}

uint64_t sub_1C2149710()
{
  return MEMORY[0x1F4121158]();
}

uint64_t sub_1C2149720()
{
  return MEMORY[0x1F4121170]();
}

uint64_t sub_1C2149730()
{
  return MEMORY[0x1F4121180]();
}

uint64_t sub_1C2149740()
{
  return MEMORY[0x1F41211B0]();
}

uint64_t sub_1C2149750()
{
  return MEMORY[0x1F41211B8]();
}

uint64_t sub_1C2149760()
{
  return MEMORY[0x1F41211C0]();
}

uint64_t sub_1C2149770()
{
  return MEMORY[0x1F41211C8]();
}

uint64_t sub_1C2149780()
{
  return MEMORY[0x1F41211D0]();
}

uint64_t sub_1C2149790()
{
  return MEMORY[0x1F41211D8]();
}

uint64_t sub_1C21497A0()
{
  return MEMORY[0x1F4120C00]();
}

uint64_t sub_1C21497B0()
{
  return MEMORY[0x1F4120C38]();
}

uint64_t sub_1C21497C0()
{
  return MEMORY[0x1F4120C78]();
}

uint64_t sub_1C21497D0()
{
  return MEMORY[0x1F411F920]();
}

uint64_t sub_1C21497E0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C21497F0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C2149800()
{
  return MEMORY[0x1F4165778]();
}

uint64_t sub_1C2149810()
{
  return MEMORY[0x1F41658C8]();
}

uint64_t sub_1C2149820()
{
  return MEMORY[0x1F41658D8]();
}

uint64_t sub_1C2149830()
{
  return MEMORY[0x1F41658E0]();
}

uint64_t sub_1C2149840()
{
  return MEMORY[0x1F41658E8]();
}

uint64_t sub_1C2149850()
{
  return MEMORY[0x1F41658F0]();
}

uint64_t sub_1C2149860()
{
  return MEMORY[0x1F4165900]();
}

uint64_t sub_1C2149870()
{
  return MEMORY[0x1F4165918]();
}

uint64_t sub_1C2149880()
{
  return MEMORY[0x1F4165920]();
}

uint64_t sub_1C2149890()
{
  return MEMORY[0x1F4165928]();
}

uint64_t sub_1C21498A0()
{
  return MEMORY[0x1F4165958]();
}

uint64_t sub_1C21498B0()
{
  return MEMORY[0x1F4165960]();
}

uint64_t sub_1C21498C0()
{
  return MEMORY[0x1F4165968]();
}

uint64_t sub_1C21498D0()
{
  return MEMORY[0x1F4165988]();
}

uint64_t sub_1C21498E0()
{
  return MEMORY[0x1F4165990]();
}

uint64_t sub_1C21498F0()
{
  return MEMORY[0x1F4165998]();
}

uint64_t sub_1C2149900()
{
  return MEMORY[0x1F41659A0]();
}

uint64_t sub_1C2149910()
{
  return MEMORY[0x1F41659B0]();
}

uint64_t sub_1C2149920()
{
  return MEMORY[0x1F41659B8]();
}

uint64_t sub_1C2149930()
{
  return MEMORY[0x1F41659C8]();
}

uint64_t sub_1C2149940()
{
  return MEMORY[0x1F4165BA0]();
}

uint64_t sub_1C2149950()
{
  return MEMORY[0x1F4165BF8]();
}

uint64_t sub_1C2149960()
{
  return MEMORY[0x1F4165C00]();
}

uint64_t sub_1C2149970()
{
  return MEMORY[0x1F4165C28]();
}

uint64_t sub_1C2149980()
{
  return MEMORY[0x1F4165CA0]();
}

uint64_t sub_1C2149990()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1C21499A0()
{
  return MEMORY[0x1F4165CD0]();
}

uint64_t sub_1C21499B0()
{
  return MEMORY[0x1F4165D18]();
}

uint64_t sub_1C21499C0()
{
  return MEMORY[0x1F4165D28]();
}

uint64_t sub_1C21499D0()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1C21499E0()
{
  return MEMORY[0x1F4165D58]();
}

uint64_t sub_1C21499F0()
{
  return MEMORY[0x1F4165D70]();
}

uint64_t sub_1C2149A00()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1C2149A10()
{
  return MEMORY[0x1F4165D98]();
}

uint64_t sub_1C2149A20()
{
  return MEMORY[0x1F4165DB0]();
}

uint64_t sub_1C2149A30()
{
  return MEMORY[0x1F4165DB8]();
}

uint64_t sub_1C2149A40()
{
  return MEMORY[0x1F4165DD8]();
}

uint64_t sub_1C2149A50()
{
  return MEMORY[0x1F4165DE0]();
}

uint64_t sub_1C2149A60()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1C2149A70()
{
  return MEMORY[0x1F4165DF8]();
}

uint64_t sub_1C2149A80()
{
  return MEMORY[0x1F4165E08]();
}

uint64_t sub_1C2149A90()
{
  return MEMORY[0x1F4165E20]();
}

uint64_t sub_1C2149AA0()
{
  return MEMORY[0x1F4165E28]();
}

uint64_t sub_1C2149AB0()
{
  return MEMORY[0x1F4165E30]();
}

uint64_t sub_1C2149AC0()
{
  return MEMORY[0x1F4165E78]();
}

uint64_t sub_1C2149AD0()
{
  return MEMORY[0x1F4165E88]();
}

uint64_t sub_1C2149AE0()
{
  return MEMORY[0x1F4165EA8]();
}

uint64_t sub_1C2149AF0()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1C2149B00()
{
  return MEMORY[0x1F4165EC0]();
}

uint64_t sub_1C2149B10()
{
  return MEMORY[0x1F4165EC8]();
}

uint64_t sub_1C2149B20()
{
  return MEMORY[0x1F4165ED0]();
}

uint64_t sub_1C2149B30()
{
  return MEMORY[0x1F4165ED8]();
}

uint64_t sub_1C2149B40()
{
  return MEMORY[0x1F4165EE0]();
}

uint64_t sub_1C2149B50()
{
  return MEMORY[0x1F4165EF0]();
}

uint64_t sub_1C2149B60()
{
  return MEMORY[0x1F4165F00]();
}

uint64_t sub_1C2149B70()
{
  return MEMORY[0x1F4165F20]();
}

uint64_t sub_1C2149B80()
{
  return MEMORY[0x1F4165F28]();
}

uint64_t sub_1C2149B90()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1C2149BA0()
{
  return MEMORY[0x1F4165F40]();
}

uint64_t sub_1C2149BB0()
{
  return MEMORY[0x1F4165F48]();
}

uint64_t sub_1C2149BC0()
{
  return MEMORY[0x1F4165F50]();
}

uint64_t sub_1C2149BD0()
{
  return MEMORY[0x1F4165F60]();
}

uint64_t sub_1C2149BE0()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1C2149BF0()
{
  return MEMORY[0x1F4165F78]();
}

uint64_t sub_1C2149C00()
{
  return MEMORY[0x1F4166010]();
}

uint64_t sub_1C2149C10()
{
  return MEMORY[0x1F4166018]();
}

uint64_t sub_1C2149C20()
{
  return MEMORY[0x1F4166050]();
}

uint64_t sub_1C2149C30()
{
  return MEMORY[0x1F4166070]();
}

uint64_t sub_1C2149C40()
{
  return MEMORY[0x1F4166158]();
}

uint64_t sub_1C2149C50()
{
  return MEMORY[0x1F4166160]();
}

uint64_t sub_1C2149C60()
{
  return MEMORY[0x1F4166350]();
}

uint64_t sub_1C2149C70()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1C2149C80()
{
  return MEMORY[0x1F4166428]();
}

uint64_t sub_1C2149C90()
{
  return MEMORY[0x1F4166430]();
}

uint64_t sub_1C2149CA0()
{
  return MEMORY[0x1F40D6610]();
}

uint64_t sub_1C2149CB0()
{
  return MEMORY[0x1F40D6618]();
}

uint64_t sub_1C2149CC0()
{
  return MEMORY[0x1F40D6620]();
}

uint64_t sub_1C2149CD0()
{
  return MEMORY[0x1F40D6630]();
}

uint64_t sub_1C2149CE0()
{
  return MEMORY[0x1F40D6640]();
}

uint64_t sub_1C2149CF0()
{
  return MEMORY[0x1F40D6648]();
}

uint64_t sub_1C2149D00()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1C2149D10()
{
  return MEMORY[0x1F40D6680]();
}

uint64_t sub_1C2149D20()
{
  return MEMORY[0x1F40D66A8]();
}

uint64_t sub_1C2149D30()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1C2149D40()
{
  return MEMORY[0x1F40D66D8]();
}

uint64_t sub_1C2149D50()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t sub_1C2149D60()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1C2149D70()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1C2149D80()
{
  return MEMORY[0x1F40D6770]();
}

uint64_t sub_1C2149D90()
{
  return MEMORY[0x1F40D67C0]();
}

uint64_t sub_1C2149DA0()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1C2149DB0()
{
  return MEMORY[0x1F40D6810]();
}

uint64_t sub_1C2149DC0()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1C2149DD0()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1C2149DE0()
{
  return MEMORY[0x1F40D6888]();
}

uint64_t sub_1C2149DF0()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1C2149E00()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1C2149E10()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1C2149E20()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1C2149E30()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1C2149E40()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1C2149E50()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1C2149E60()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1C2149E70()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1C2149E80()
{
  return MEMORY[0x1F40D6A48]();
}

uint64_t sub_1C2149E90()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1C2149EA0()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1C2149EB0()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C2149EC0()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1C2149ED0()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1C2149EE0()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1C2149F00()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1C2149F10()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1C2149F20()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1C2149F30()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1C2149F40()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1C2149F50()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1C2149F60()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1C2149F70()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1C2149F80()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1C2149F90()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1C2149FA0()
{
  return MEMORY[0x1F4120CC0]();
}

uint64_t sub_1C2149FB0()
{
  return MEMORY[0x1F411EDF8]();
}

uint64_t sub_1C2149FC0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C2149FD0()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1C2149FE0()
{
  return MEMORY[0x1F40D6BF8]();
}

uint64_t sub_1C2149FF0()
{
  return MEMORY[0x1F40D6C00]();
}

uint64_t sub_1C214A000()
{
  return MEMORY[0x1F40D6C08]();
}

uint64_t sub_1C214A010()
{
  return MEMORY[0x1F40D6C10]();
}

uint64_t sub_1C214A020()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1C214A030()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1C214A040()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1C214A050()
{
  return MEMORY[0x1F40D6CB0]();
}

uint64_t sub_1C214A060()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1C214A070()
{
  return MEMORY[0x1F40D6D58]();
}

uint64_t sub_1C214A080()
{
  return MEMORY[0x1F40D6D60]();
}

uint64_t sub_1C214A090()
{
  return MEMORY[0x1F40D6D68]();
}

uint64_t sub_1C214A0A0()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1C214A0B0()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1C214A0C0()
{
  return MEMORY[0x1F40D6DD0]();
}

uint64_t sub_1C214A0D0()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1C214A0E0()
{
  return MEMORY[0x1F40D6E00]();
}

uint64_t sub_1C214A0F0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C214A100()
{
  return MEMORY[0x1F40D6E20]();
}

uint64_t sub_1C214A110()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t sub_1C214A120()
{
  return MEMORY[0x1F40D6E38]();
}

uint64_t sub_1C214A130()
{
  return MEMORY[0x1F40F2398]();
}

uint64_t sub_1C214A140()
{
  return MEMORY[0x1F40F23A0]();
}

uint64_t sub_1C214A150()
{
  return MEMORY[0x1F40F23A8]();
}

uint64_t sub_1C214A160()
{
  return MEMORY[0x1F40F23C0]();
}

uint64_t sub_1C214A170()
{
  return MEMORY[0x1F40F23C8]();
}

uint64_t sub_1C214A180()
{
  return MEMORY[0x1F40F26F8]();
}

uint64_t sub_1C214A190()
{
  return MEMORY[0x1F40F2700]();
}

uint64_t sub_1C214A1A0()
{
  return MEMORY[0x1F40F2708]();
}

uint64_t sub_1C214A1B0()
{
  return MEMORY[0x1F40F8000]();
}

uint64_t sub_1C214A1C0()
{
  return MEMORY[0x1F40F81F0]();
}

uint64_t sub_1C214A1D0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1C214A1E0()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1C214A1F0()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_1C214A200()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1C214A210()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1C214A220()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1C214A230()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1C214A240()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1C214A250()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1C214A260()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1C214A270()
{
  return MEMORY[0x1F40F9E40]();
}

uint64_t sub_1C214A280()
{
  return MEMORY[0x1F40FABE0]();
}

uint64_t sub_1C214A290()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1C214A2A0()
{
  return MEMORY[0x1F40FAF08]();
}

uint64_t sub_1C214A2B0()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1C214A2C0()
{
  return MEMORY[0x1F40FAFB0]();
}

uint64_t sub_1C214A2D0()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1C214A2E0()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1C214A2F0()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1C214A300()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1C214A310()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1C214A320()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1C214A330()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1C214A340()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1C214A350()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1C214A360()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1C214A370()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1C214A380()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1C214A390()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1C214A3A0()
{
  return MEMORY[0x1F40FC8E8]();
}

uint64_t sub_1C214A3B0()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1C214A3C0()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1C214A3D0()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_1C214A3E0()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1C214A3F0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C214A400()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C214A410()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C214A420()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C214A430()
{
  return MEMORY[0x1F4121440]();
}

uint64_t sub_1C214A440()
{
  return MEMORY[0x1F4121448]();
}

uint64_t sub_1C214A450()
{
  return MEMORY[0x1F4121480]();
}

uint64_t sub_1C214A460()
{
  return MEMORY[0x1F40E7808]();
}

uint64_t sub_1C214A470()
{
  return MEMORY[0x1F40E7820]();
}

uint64_t sub_1C214A480()
{
  return MEMORY[0x1F40E7828]();
}

uint64_t sub_1C214A490()
{
  return MEMORY[0x1F40E7840]();
}

uint64_t sub_1C214A4A0()
{
  return MEMORY[0x1F40E7848]();
}

uint64_t sub_1C214A4C0()
{
  return MEMORY[0x1F40E7858]();
}

uint64_t sub_1C214A4D0()
{
  return MEMORY[0x1F40E7860]();
}

uint64_t sub_1C214A4E0()
{
  return MEMORY[0x1F40E7868]();
}

uint64_t sub_1C214A4F0()
{
  return MEMORY[0x1F40E5FD8]();
}

uint64_t sub_1C214A500()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C214A510()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C214A520()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1C214A530()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C214A540()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1C214A550()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C214A560()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C214A570()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1C214A580()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C214A590()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C214A5A0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C214A5B0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C214A5C0()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1C214A5D0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C214A5E0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C214A5F0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C214A600()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1C214A610()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C214A620()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1C214A630()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1C214A640()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1C214A650()
{
  return MEMORY[0x1F4120D30]();
}

uint64_t sub_1C214A660()
{
  return MEMORY[0x1F4120D38]();
}

uint64_t sub_1C214A670()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1C214A680()
{
  return MEMORY[0x1F411DF00]();
}

uint64_t sub_1C214A690()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C214A6A0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C214A6B0()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1C214A6C0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C214A6D0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C214A6E0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C214A6F0()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1C214A700()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C214A710()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1C214A720()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C214A730()
{
  return MEMORY[0x1F411DF18]();
}

uint64_t sub_1C214A740()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1C214A750()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C214A760()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C214A770()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C214A780()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C214A790()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C214A7A0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C214A7B0()
{
  return MEMORY[0x1F41212F8]();
}

uint64_t sub_1C214A7C0()
{
  return MEMORY[0x1F4121300]();
}

uint64_t sub_1C214A7D0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C214A7E0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C214A7F0()
{
  return MEMORY[0x1F411F928]();
}

uint64_t sub_1C214A800()
{
  return MEMORY[0x1F411F930]();
}

uint64_t sub_1C214A810()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C214A820()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C214A830()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C214A840()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C214A850()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C214A860()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1C214A880()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1C214A890()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1C214A8A0()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1C214A8B0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C214A8C0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C214A8D0()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1C214A8E0()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C214A8F0()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C214A910()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1C214A920()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1C214A930()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1C214A940()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t sub_1C214A950()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1C214A960()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1C214A970()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1C214A990()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1C214A9A0()
{
  return MEMORY[0x1F40E63B8]();
}

uint64_t sub_1C214A9B0()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1C214A9C0()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1C214A9D0()
{
  return MEMORY[0x1F4121308]();
}

uint64_t sub_1C214A9E0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C214AA10()
{
  return MEMORY[0x1F40E6408]();
}

uint64_t sub_1C214AA20()
{
  return MEMORY[0x1F40E6410]();
}

uint64_t sub_1C214AA30()
{
  return MEMORY[0x1F40E6428]();
}

uint64_t sub_1C214AA50()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C214AA60()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C214AA70()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C214AA80()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1C214AA90()
{
  return MEMORY[0x1F4184180]();
}

uint64_t sub_1C214AAA0()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C214AAB0()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1C214AAC0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C214AAD0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C214AAE0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C214AAF0()
{
  return MEMORY[0x1F4121498]();
}

uint64_t sub_1C214AB00()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C214AB10()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C214AB20()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1C214AB30()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1C214AB40()
{
  return MEMORY[0x1F411EE98]();
}

uint64_t sub_1C214AB50()
{
  return MEMORY[0x1F4121310]();
}

uint64_t sub_1C214AB60()
{
  return MEMORY[0x1F411F1A8]();
}

uint64_t sub_1C214AB70()
{
  return MEMORY[0x1F411F1E8]();
}

uint64_t sub_1C214AB80()
{
  return MEMORY[0x1F411F1F8]();
}

uint64_t sub_1C214AB90()
{
  return MEMORY[0x1F411F208]();
}

uint64_t sub_1C214ABA0()
{
  return MEMORY[0x1F411DF58]();
}

uint64_t sub_1C214ABB0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C214ABC0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C214ABD0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C214ABE0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C214ABF0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C214AC00()
{
  return MEMORY[0x1F411F938]();
}

uint64_t sub_1C214AC10()
{
  return MEMORY[0x1F411F940]();
}

uint64_t sub_1C214AC20()
{
  return MEMORY[0x1F411F948]();
}

uint64_t sub_1C214AC30()
{
  return MEMORY[0x1F411F950]();
}

uint64_t sub_1C214AC40()
{
  return MEMORY[0x1F4121318]();
}

uint64_t sub_1C214AC50()
{
  return MEMORY[0x1F41664B8]();
}

uint64_t sub_1C214AC60()
{
  return MEMORY[0x1F411F298]();
}

uint64_t sub_1C214AC70()
{
  return MEMORY[0x1F411F2A8]();
}

uint64_t sub_1C214AC80()
{
  return MEMORY[0x1F411F958]();
}

uint64_t sub_1C214AC90()
{
  return MEMORY[0x1F411F960]();
}

uint64_t sub_1C214ACA0()
{
  return MEMORY[0x1F411F968]();
}

uint64_t sub_1C214ACB0()
{
  return MEMORY[0x1F40E66A0]();
}

uint64_t sub_1C214ACC0()
{
  return MEMORY[0x1F411EEA8]();
}

uint64_t sub_1C214ACD0()
{
  return MEMORY[0x1F411EEB0]();
}

uint64_t sub_1C214ACE0()
{
  return MEMORY[0x1F411EEB8]();
}

uint64_t sub_1C214ACF0()
{
  return MEMORY[0x1F411EED8]();
}

uint64_t sub_1C214AD00()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1C214AD10()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C214AD20()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1C214AD30()
{
  return MEMORY[0x1F4187048]();
}

uint64_t sub_1C214AD40()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1C214AD50()
{
  return MEMORY[0x1F4187070]();
}

uint64_t sub_1C214AD60()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1C214AD70()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C214AD80()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1C214AD90()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C214ADA0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C214ADB0()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C214ADC0()
{
  return MEMORY[0x1F41214B0]();
}

uint64_t sub_1C214ADD0()
{
  return MEMORY[0x1F41214D0]();
}

uint64_t sub_1C214ADE0()
{
  return MEMORY[0x1F41214D8]();
}

uint64_t sub_1C214ADF0()
{
  return MEMORY[0x1F41214E0]();
}

uint64_t sub_1C214AE00()
{
  return MEMORY[0x1F4166630]();
}

uint64_t sub_1C214AE10()
{
  return MEMORY[0x1F41214E8]();
}

uint64_t sub_1C214AE20()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1C214AE30()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1C214AE40()
{
  return MEMORY[0x1F4166650]();
}

uint64_t sub_1C214AE50()
{
  return MEMORY[0x1F4166658]();
}

uint64_t sub_1C214AE60()
{
  return MEMORY[0x1F4166660]();
}

uint64_t sub_1C214AE70()
{
  return MEMORY[0x1F4166668]();
}

uint64_t sub_1C214AE80()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1C214AE90()
{
  return MEMORY[0x1F4121320]();
}

uint64_t sub_1C214AEA0()
{
  return MEMORY[0x1F4121328]();
}

uint64_t sub_1C214AEB0()
{
  return MEMORY[0x1F4121330]();
}

uint64_t sub_1C214AEC0()
{
  return MEMORY[0x1F41666C0]();
}

uint64_t sub_1C214AED0()
{
  return MEMORY[0x1F41666C8]();
}

uint64_t sub_1C214AEE0()
{
  return MEMORY[0x1F411EF08]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE7medmoji0eF10Experience29MedicationVisualizationConfigVSgvg_0()
{
  return MEMORY[0x1F411F978]();
}

uint64_t sub_1C214AF10()
{
  return MEMORY[0x1F411F980]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE20ingredientComponentsSaySSGSgvg_0()
{
  return MEMORY[0x1F411F988]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE8doseFormSSSgvg_0()
{
  return MEMORY[0x1F411F990]();
}

uint64_t sub_1C214AF40()
{
  return MEMORY[0x1F411F998]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE5titleSSvg_0()
{
  return MEMORY[0x1F411F9A0]();
}

uint64_t sub_1C214AF60()
{
  return MEMORY[0x1F411F9A8]();
}

uint64_t sub_1C214AF70()
{
  return MEMORY[0x1F411F9B0]();
}

uint64_t sub_1C214AF80()
{
  return MEMORY[0x1F411F9B8]();
}

uint64_t sub_1C214AF90()
{
  return MEMORY[0x1F411F9C0]();
}

uint64_t sub_1C214AFA0()
{
  return MEMORY[0x1F411F9C8]();
}

uint64_t sub_1C214AFB0()
{
  return MEMORY[0x1F411F9D0]();
}

uint64_t sub_1C214AFC0()
{
  return MEMORY[0x1F411F9D8]();
}

uint64_t sub_1C214AFD0()
{
  return MEMORY[0x1F411F9E0]();
}

uint64_t sub_1C214AFE0()
{
  return MEMORY[0x1F411F9E8]();
}

uint64_t _sSo29HKMedicationUserDomainConceptC19HealthMedicationsUIE8strengthSSSgvg_0()
{
  return MEMORY[0x1F411F9F0]();
}

uint64_t sub_1C214B000()
{
  return MEMORY[0x1F411F9F8]();
}

uint64_t sub_1C214B010()
{
  return MEMORY[0x1F411FA00]();
}

uint64_t sub_1C214B020()
{
  return MEMORY[0x1F411FA08]();
}

uint64_t sub_1C214B030()
{
  return MEMORY[0x1F411FA10]();
}

uint64_t sub_1C214B040()
{
  return MEMORY[0x1F411FA18]();
}

uint64_t sub_1C214B050()
{
  return MEMORY[0x1F411FA20]();
}

uint64_t sub_1C214B060()
{
  return MEMORY[0x1F4121338]();
}

uint64_t sub_1C214B070()
{
  return MEMORY[0x1F4121340]();
}

uint64_t sub_1C214B080()
{
  return MEMORY[0x1F4121500]();
}

uint64_t sub_1C214B090()
{
  return MEMORY[0x1F4121348]();
}

uint64_t sub_1C214B0A0()
{
  return MEMORY[0x1F411EF18]();
}

uint64_t sub_1C214B0B0()
{
  return MEMORY[0x1F4121350]();
}

uint64_t sub_1C214B0C0()
{
  return MEMORY[0x1F4121358]();
}

uint64_t sub_1C214B0D0()
{
  return MEMORY[0x1F411EF20]();
}

uint64_t sub_1C214B0E0()
{
  return MEMORY[0x1F411EF28]();
}

uint64_t sub_1C214B0F0()
{
  return MEMORY[0x1F411EF38]();
}

uint64_t sub_1C214B100()
{
  return MEMORY[0x1F411EF40]();
}

uint64_t sub_1C214B110()
{
  return MEMORY[0x1F411FA28]();
}

uint64_t sub_1C214B120()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1C214B130()
{
  return MEMORY[0x1F4121508]();
}

uint64_t sub_1C214B140()
{
  return MEMORY[0x1F4121360]();
}

uint64_t sub_1C214B150()
{
  return MEMORY[0x1F4121368]();
}

uint64_t sub_1C214B160()
{
  return MEMORY[0x1F411EF48]();
}

uint64_t sub_1C214B170()
{
  return MEMORY[0x1F411EF58]();
}

uint64_t sub_1C214B180()
{
  return MEMORY[0x1F411FA30]();
}

uint64_t sub_1C214B190()
{
  return MEMORY[0x1F411FA38]();
}

uint64_t sub_1C214B1A0()
{
  return MEMORY[0x1F411FA40]();
}

uint64_t sub_1C214B1B0()
{
  return MEMORY[0x1F411FA48]();
}

uint64_t sub_1C214B1C0()
{
  return MEMORY[0x1F411EF70]();
}

uint64_t sub_1C214B1D0()
{
  return MEMORY[0x1F4121370]();
}

uint64_t sub_1C214B1E0()
{
  return MEMORY[0x1F4121378]();
}

uint64_t sub_1C214B1F0()
{
  return MEMORY[0x1F411FA50]();
}

uint64_t sub_1C214B200()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1C214B210()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C214B220()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C214B230()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1C214B240()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1C214B250()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1C214B260()
{
  return MEMORY[0x1F4166850]();
}

uint64_t sub_1C214B270()
{
  return MEMORY[0x1F4166888]();
}

uint64_t sub_1C214B280()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1C214B290()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1C214B2A0()
{
  return MEMORY[0x1F41668B8]();
}

uint64_t sub_1C214B2B0()
{
  return MEMORY[0x1F41668E0]();
}

uint64_t sub_1C214B2C0()
{
  return MEMORY[0x1F41668F0]();
}

uint64_t sub_1C214B2D0()
{
  return MEMORY[0x1F41668F8]();
}

uint64_t sub_1C214B2E0()
{
  return MEMORY[0x1F4166900]();
}

uint64_t sub_1C214B2F0()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1C214B300()
{
  return MEMORY[0x1F4166930]();
}

uint64_t sub_1C214B310()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1C214B320()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1C214B330()
{
  return MEMORY[0x1F4166970]();
}

uint64_t sub_1C214B340()
{
  return MEMORY[0x1F4166988]();
}

uint64_t sub_1C214B350()
{
  return MEMORY[0x1F4166998]();
}

uint64_t sub_1C214B360()
{
  return MEMORY[0x1F41669B0]();
}

uint64_t sub_1C214B370()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1C214B380()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1C214B390()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1C214B3A0()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1C214B3B0()
{
  return MEMORY[0x1F41669F0]();
}

uint64_t sub_1C214B3C0()
{
  return MEMORY[0x1F4166A00]();
}

uint64_t sub_1C214B3D0()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1C214B3E0()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1C214B3F0()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1C214B400()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1C214B410()
{
  return MEMORY[0x1F4166A68]();
}

uint64_t sub_1C214B420()
{
  return MEMORY[0x1F4121380]();
}

uint64_t sub_1C214B430()
{
  return MEMORY[0x1F4121388]();
}

uint64_t sub_1C214B440()
{
  return MEMORY[0x1F411FA58]();
}

uint64_t sub_1C214B450()
{
  return MEMORY[0x1F411FA60]();
}

uint64_t sub_1C214B460()
{
  return MEMORY[0x1F411FA68]();
}

uint64_t sub_1C214B470()
{
  return MEMORY[0x1F411FA70]();
}

uint64_t sub_1C214B480()
{
  return MEMORY[0x1F411FA78]();
}

uint64_t sub_1C214B490()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1C214B4A0()
{
  return MEMORY[0x1F40E6AB0]();
}

uint64_t sub_1C214B4B0()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1C214B4C0()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1C214B4D0()
{
  return MEMORY[0x1F4120DE0]();
}

uint64_t sub_1C214B4E0()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1C214B4F0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C214B500()
{
  return MEMORY[0x1F4184658]();
}

uint64_t sub_1C214B510()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_1C214B520()
{
  return MEMORY[0x1F40E6B78]();
}

uint64_t sub_1C214B530()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C214B540()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C214B550()
{
  return MEMORY[0x1F40E6BD0]();
}

uint64_t sub_1C214B560()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1C214B570()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1C214B580()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1C214B590()
{
  return MEMORY[0x1F40E6CC8]();
}

uint64_t sub_1C214B5A0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C214B5B0()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1C214B5C0()
{
  return MEMORY[0x1F4184A80]();
}

uint64_t sub_1C214B5D0()
{
  return MEMORY[0x1F4184A88]();
}

uint64_t sub_1C214B5E0()
{
  return MEMORY[0x1F4184A90]();
}

uint64_t sub_1C214B5F0()
{
  return MEMORY[0x1F4184AB0]();
}

uint64_t sub_1C214B600()
{
  return MEMORY[0x1F4184AC0]();
}

uint64_t sub_1C214B610()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1C214B630()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1C214B640()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C214B650()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C214B660()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C214B670()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1C214B680()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C214B690()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1C214B6A0()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1C214B6B0()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1C214B6C0()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1C214B6D0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C214B6E0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C214B6F0()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1C214B700()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C214B710()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C214B720()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1C214B730()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1C214B740()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C214B750()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C214B760()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C214B770()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C214B780()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C214B790()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C214B7A0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C214B7B0()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1C214B7C0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C214B7D0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C214B7E0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C214B7F0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C214B800()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C214B810()
{
  return MEMORY[0x1F4184EB8]();
}

uint64_t sub_1C214B820()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C214B830()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C214B840()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C214B850()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C214B860()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C214B870()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C214B880()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C214B890()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C214B8A0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C214B8B0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C214B8C0()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1C214B8D0()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1C214B8E0()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1C214B8F0()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1C214B900()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C214B910()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C214B920()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1C214B930()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C214B940()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C214B950()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C214B960()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1C214B970()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C214B980()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1C214B990()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C214B9A0()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1C214B9B0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C214B9C0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1C214B9D0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C214B9E0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C214B9F0()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1C214BA00()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C214BA10()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C214BA20()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1C214BA30()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C214BA40()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C214BA50()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C214BA70()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C214BA80()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C214BA90()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1C214BAA0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C214BAB0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C214BAE0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C214BAF0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C214BB00()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1C214BB10()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1C214BB30()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C214BB40()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C214BB50()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C214BB60()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1C214BB70()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1C214BB80()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C214BB90()
{
  return MEMORY[0x1F4121390]();
}

uint64_t sub_1C214BBA0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C214BBB0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C214BBC0()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1C214BBF0()
{
  return MEMORY[0x1F4121518]();
}

uint64_t sub_1C214BC00()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1C214BC10()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t HKCurrentSchemaVersionForShardIdentifier()
{
  return MEMORY[0x1F40E7BC0]();
}

uint64_t HKDrugInteractionLifestyleFactorForHKConceptIdentifier()
{
  return MEMORY[0x1F411F370]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x1F41215A8]();
}

uint64_t HKMedicationDoseEventStatusToString()
{
  return MEMORY[0x1F40E7E08]();
}

uint64_t HKOntologyShardSchemaTypeForShardIdentifier()
{
  return MEMORY[0x1F40E7E98]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x1F40E7F30]();
}

uint64_t HKStringFromOntologyShardState()
{
  return MEMORY[0x1F40E8008]();
}

uint64_t HKStringFromUserDomainConceptPropertyType()
{
  return MEMORY[0x1F40E8030]();
}

uint64_t HKUIJoinAttributedStringsForLocale()
{
  return MEMORY[0x1F4121620]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1F4121628]();
}

uint64_t HKUIMidDate()
{
  return MEMORY[0x1F4121648]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x1F4121668]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1F417CEF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}