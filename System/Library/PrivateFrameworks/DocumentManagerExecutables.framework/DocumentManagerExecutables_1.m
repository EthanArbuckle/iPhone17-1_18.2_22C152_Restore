void static LaunchUtils.tryOpeningInApp(applicationIdentifier:url:item:urlManagedState:requireOpenIn:alertPresenting:completionBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, void *a7, uint64_t a8, uint64_t a9)
{
  sub_22BE748DC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t static LaunchUtils.installConfigurationProfile(from:completionBlock:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  v48 = a2;
  uint64_t v49 = a3;
  aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v47 = sub_22BE92198();
  uint64_t v4 = *(void *)(v47 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v47);
  v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93148();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22BE97A30;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v44 = sub_22BDF8220();
  *(void *)(v7 + 64) = v44;
  unint64_t v42 = (unint64_t)"%@: attempting to install %@";
  *(void *)(v7 + 32) = 0xD000000000000032;
  *(void *)(v7 + 40) = 0x800000022BEA4EB0;
  uint64_t v8 = a1;
  uint64_t v9 = sub_22BE92138();
  uint64_t v41 = sub_22BDD9D50(0, &qword_268488380);
  *(void *)(v7 + 96) = v41;
  uint64_t v40 = sub_22BE75A3C(&qword_268488388, &qword_268488380);
  *(void *)(v7 + 104) = v40;
  *(void *)(v7 + 72) = v9;
  sub_22BE92588();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_22BE92128();
  uint64_t v12 = v11;
  int v45 = sub_22BE92178();
  id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_init);
  char v51 = 0;
  v13 = (void *)sub_22BE92138();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v46 = v8;
  uint64_t v15 = v8;
  uint64_t v16 = v47;
  v14((char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v47);
  unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v18 = (v5 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = &v51;
  *((void *)v19 + 3) = v10;
  *((void *)v19 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v19[v17], v6, v16);
  v20 = &v19[v18];
  v21 = v48;
  uint64_t v22 = v49;
  *(void *)v20 = v48;
  *((void *)v20 + 1) = v22;
  v23 = (void *)swift_allocObject();
  v23[2] = sub_22BE74B88;
  v23[3] = v19;
  aBlock[4] = sub_22BE74C40;
  aBlock[5] = v23;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_22BE6FF68;
  aBlock[3] = &block_descriptor_12_1;
  v24 = _Block_copy(aBlock);
  sub_22BE91C58();
  sub_22BE91C58();
  v25 = v50;
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v25, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v13, 0, aBlock, v24);
  _Block_release(v24);

  id v26 = aBlock[0];
  id v27 = aBlock[0];
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v16) {
    __break(1u);
  }
  if ((v51 & 1) == 0)
  {
    v28 = v21;
    uint64_t v47 = qword_26AEFFAC0;
    v39[3] = sub_22BE93158();
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_22BE9A3B0;
    uint64_t v30 = MEMORY[0x263F8D310];
    unint64_t v31 = v44;
    *(void *)(v29 + 56) = MEMORY[0x263F8D310];
    *(void *)(v29 + 64) = v31;
    unint64_t v32 = v42 | 0x8000000000000000;
    *(void *)(v29 + 32) = 0xD000000000000032;
    *(void *)(v29 + 40) = v32;
    uint64_t v33 = sub_22BE92138();
    uint64_t v34 = v40;
    *(void *)(v29 + 96) = v41;
    *(void *)(v29 + 104) = v34;
    *(void *)(v29 + 72) = v33;
    aBlock[0] = v26;
    id v35 = v27;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268488390);
    uint64_t v36 = sub_22BE92CF8();
    *(void *)(v29 + 136) = v30;
    *(void *)(v29 + 144) = v31;
    *(void *)(v29 + 112) = v36;
    *(void *)(v29 + 120) = v37;
    sub_22BE92588();
    v25 = v50;
    swift_bridgeObjectRelease();
    v28(0);
  }

  if (v45) {
    sub_22BE92158();
  }
  return swift_release();
}

void sub_22BE6FAEC(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  v30[2] = *(id *)MEMORY[0x263EF8340];
  *a2 = 1;
  uint64_t v10 = sub_22BE921A8();
  unint64_t v12 = v11;
  id v13 = objc_msgSend(self, sel_defaultPermission);
  v14 = (void *)sub_22BE921B8();
  uint64_t v15 = (void *)sub_22BE92C98();
  if (qword_2684868C8 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)sub_22BE92C98();
  v30[0] = 0;
  id v17 = objc_msgSend(v13, sel_queueFileDataForAcceptance_originalFileName_forBundleID_outError_, v14, v15, v16, v30);

  id v18 = v30[0];
  if (v17)
  {
    uint64_t v29 = a6;
    uint64_t v19 = sub_22BE92CD8();
    uint64_t v21 = v20;
    id v22 = v18;

    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_22BE9A3B0;
    uint64_t v24 = MEMORY[0x263F8D310];
    *(void *)(v23 + 56) = MEMORY[0x263F8D310];
    unint64_t v25 = sub_22BDF8220();
    *(void *)(v23 + 32) = 0xD000000000000032;
    *(void *)(v23 + 40) = 0x800000022BEA4EB0;
    *(void *)(v23 + 96) = v24;
    *(void *)(v23 + 104) = v25;
    *(void *)(v23 + 64) = v25;
    *(void *)(v23 + 72) = v19;
    *(void *)(v23 + 80) = v21;
    uint64_t v26 = sub_22BE92138();
    *(void *)(v23 + 136) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v23 + 144) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v23 + 112) = v26;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    v29(1);
    sub_22BE0F178(v10, v12);
  }
  else
  {
    id v27 = v30[0];
    v28 = (void *)sub_22BE92088();

    swift_willThrow();
    sub_22BE0F178(v10, v12);
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93158();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_22BE9A3B0;
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 64) = sub_22BDF8220();
    *(void *)(v7 + 32) = 0xD000000000000032;
    *(void *)(v7 + 40) = 0x800000022BEA4EB0;
    uint64_t v8 = sub_22BE92138();
    *(void *)(v7 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v7 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v7 + 72) = v8;
    uint64_t v9 = sub_22BE92078();
    *(void *)(v7 + 136) = sub_22BDD9D50(0, (unint64_t *)&unk_2684880A0);
    *(void *)(v7 + 144) = sub_22BE75A3C((unint64_t *)&qword_268488440, (unint64_t *)&unk_2684880A0);
    *(void *)(v7 + 112) = v9;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    a6(0);
  }
}

uint64_t sub_22BE6FF68(uint64_t a1)
{
  uint64_t v2 = sub_22BE92198();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_22BE92168();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void static LaunchUtils.tryOpeningInDefaultApp(_:item:requireOpenInPlace:preferQuickLook:alertPresenting:completionBlock:)(uint64_t a1, void *a2, char a3, int a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v26 = a6;
  uint64_t v13 = sub_22BE92198();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = &v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    id v25 = a2;
    sub_22BE7026C(a1, v25, a4 & 1, a3 & 1, a5, v26, a7);
    id v17 = v25;
  }
  else
  {
    id v25 = objc_msgSend(self, sel_defaultManager);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(&v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v13);
    unint64_t v18 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    int v24 = a4;
    uint64_t v19 = v18 + v15;
    uint64_t v20 = swift_allocObject();
    *(unsigned char *)(v20 + 16) = a3 & 1;
    uint64_t v21 = v26;
    *(void *)(v20 + 24) = a5;
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = a7;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v14 + 32))(v20 + v18, v16, v13);
    *(unsigned char *)(v20 + v19) = v24 & 1;
    id v22 = a5;
    sub_22BE91C58();
    _sSo13FPItemManagerC08DocumentB11ExecutablesE13doc_fetchItem3for17completionHandlery10Foundation3URLV_ySo0A0CSg_s5Error_pSgtctF_0(a1, (uint64_t)sub_22BE74D40, v20);
    swift_release();
  }
}

void sub_22BE7026C(uint64_t a1, void *a2, int a3, int a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  unint64_t v32 = a5;
  int v30 = a4;
  int v31 = a3;
  uint64_t v9 = sub_22BE92198();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(self, sel_defaultPermission);
  id v14 = objc_msgSend(v13, sel_dataOwnerStateForNode_, a2);

  id v29 = self;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = v15 + v11;
  unint64_t v17 = (v15 + v11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  unint64_t v20 = v17 + v19;
  *(void *)(v19 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v19 + v15, v12, v9);
  *(unsigned char *)(v19 + v16) = v30;
  *(void *)(v20 + 8) = v14;
  *(unsigned char *)(v20 + 16) = v31;
  id v22 = v32;
  uint64_t v21 = v33;
  *(void *)(v20 + 24) = v32;
  uint64_t v23 = (void *)(v19 + v18);
  uint64_t v24 = v34;
  void *v23 = v21;
  v23[1] = v24;
  aBlock[4] = sub_22BE76EE0;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BDDF1BC;
  aBlock[3] = &block_descriptor_45_0;
  id v25 = _Block_copy(aBlock);
  id v26 = a2;
  id v27 = v22;
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v29, sel_fetchProviderDomainForItem_cachePolicy_completionHandler_, v26, 1, v25);
  _Block_release(v25);
}

uint64_t sub_22BE704D0(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5, uint64_t a6, int a7, void *a8, uint64_t a9, uint64_t a10)
{
  v48 = a8;
  int v47 = a7;
  int v43 = a5;
  uint64_t v41 = a1;
  uint64_t v45 = a10;
  uint64_t v46 = a6;
  uint64_t v44 = a9;
  uint64_t v50 = sub_22BE92B08();
  uint64_t v53 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22BE92B58();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x270FA5388](v13);
  unint64_t v42 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22BE92198();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = sub_22BE92B18();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BDD9D50(0, (unint64_t *)&qword_26AF003E0);
  (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x263F8F060], v18);
  uint64_t v40 = sub_22BE93238();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v15);
  unint64_t v22 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v23 = (v22 + v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v24 + v22, (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  unint64_t v25 = v24 + ((v22 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  id v26 = v41;
  *(void *)unint64_t v25 = v41;
  *(unsigned char *)(v25 + 8) = v43;
  unint64_t v27 = v24 + ((v22 + v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v27 = v46;
  *(unsigned char *)(v27 + 8) = v47;
  uint64_t v28 = v48;
  *(void *)(v24 + v23) = v48;
  id v29 = (void *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v30 = v45;
  *id v29 = v44;
  v29[1] = v30;
  aBlock[4] = sub_22BE770C0;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BDD0BA8;
  aBlock[3] = &block_descriptor_51;
  int v31 = _Block_copy(aBlock);
  id v32 = v26;
  id v33 = v28;
  sub_22BE91C58();
  id v34 = a3;
  id v35 = v42;
  sub_22BE92B38();
  uint64_t v54 = MEMORY[0x263F8EE78];
  sub_22BE69870();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF002D0);
  sub_22BE048F8();
  uint64_t v37 = v49;
  uint64_t v36 = v50;
  sub_22BE934E8();
  v38 = (void *)v40;
  MEMORY[0x230F55CD0](0, v35, v37, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v36);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v52);
  return swift_release();
}

void sub_22BE7097C(void *a1, uint64_t a2, void *a3, int a4, uint64_t a5, int a6, void *a7, void (*a8)(void), uint64_t a9)
{
  int v37 = a4;
  int v38 = a6;
  uint64_t v39 = a5;
  id v35 = a7;
  uint64_t v36 = a9;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22BE92198();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a2, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  id v34 = a1;
  id v18 = sub_22BE74DF0(a1, (uint64_t)v15);
  uint64_t v20 = v19;
  sub_22BE035C8((uint64_t)v15, (uint64_t *)&unk_26AEFFB10);
  if (a3)
  {
    uint64_t v32 = (uint64_t)v18;
    id v33 = a8;
    id v21 = a3;
    id v22 = objc_msgSend(v21, sel_topLevelBundleIdentifier);
    uint64_t v31 = sub_22BE92CD8();
    uint64_t v24 = v23;

    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_22BE97A30;
    *(void *)(v25 + 56) = MEMORY[0x263F8D310];
    *(void *)(v25 + 64) = sub_22BDF8220();
    *(void *)(v25 + 32) = 0xD000000000000089;
    *(void *)(v25 + 40) = 0x800000022BEA53B0;
    uint64_t v26 = sub_22BE92138();
    *(void *)(v25 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v25 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v25 + 72) = v26;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    id v27 = v34;
    sub_22BE70DE4(v27, v39, v31, v24, v32, v20, v38 & 1, v33, v36, v37 & 1, a2, v35);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_22BE97A30;
    *(void *)(v28 + 56) = MEMORY[0x263F8D310];
    *(void *)(v28 + 64) = sub_22BDF8220();
    *(void *)(v28 + 32) = 0xD000000000000089;
    *(void *)(v28 + 40) = 0x800000022BEA53B0;
    uint64_t v29 = sub_22BE92138();
    *(void *)(v28 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v28 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v28 + 72) = v29;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    id v30 = v34;
    sub_22BE70DE4(v30, v39, 0, 0, 0, 0, v38 & 1, a8, v36, v37 & 1, a2, v35);
  }
}

uint64_t sub_22BE70DE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, void (*a8)(void), uint64_t a9, unsigned __int8 a10, uint64_t a11, void *a12)
{
  v65 = a12;
  v66 = a8;
  uint64_t v67 = a9;
  uint64_t v68 = a11;
  uint64_t v19 = sub_22BE92198();
  uint64_t v60 = *(void *)(v19 - 8);
  uint64_t v61 = v19;
  uint64_t v20 = *(void *)(v60 + 64);
  MEMORY[0x270FA5388](v19);
  id v21 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = a3;
  uint64_t v64 = a4;
  int v62 = a10;
  static LaunchUtils.launchAction(for:urlManagedState:providerBundleId:appContainerBundleId:requireOpenIn:preferQuickLook:)(a1, a2, a5, a6, a10, a7, v69);
  if (v69[0])
  {
    if (v69[0] == (id)1)
    {
      if (qword_26AF00288 != -1) {
        swift_once();
      }
      sub_22BE93148();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_22BE97A30;
      *(void *)(v22 + 56) = MEMORY[0x263F8D310];
      *(void *)(v22 + 64) = sub_22BDF8220();
      *(void *)(v22 + 32) = 0xD000000000000071;
      *(void *)(v22 + 40) = 0x800000022BEA5460;
      uint64_t v23 = sub_22BE92138();
      *(void *)(v22 + 96) = sub_22BDD9D50(0, &qword_268488380);
      *(void *)(v22 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
      *(void *)(v22 + 72) = v23;
      sub_22BE92588();
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(void))v66)(0);
    }
    else
    {
      v57 = a1;
      uint64_t v58 = a2;
      id v28 = v69[2];
      id v59 = v69[1];

      if (qword_26AF00288 != -1) {
        swift_once();
      }
      unint64_t v56 = qword_26AEFFAC0;
      int v55 = sub_22BE93148();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_22BE9A3B0;
      uint64_t v30 = MEMORY[0x263F8D310];
      *(void *)(v29 + 56) = MEMORY[0x263F8D310];
      unint64_t v31 = sub_22BDF8220();
      *(void *)(v29 + 64) = v31;
      *(void *)(v29 + 32) = 0xD000000000000071;
      *(void *)(v29 + 40) = 0x800000022BEA5460;
      uint64_t v32 = sub_22BE92138();
      *(void *)(v29 + 96) = sub_22BDD9D50(0, &qword_268488380);
      uint64_t v33 = sub_22BE75A3C(&qword_268488388, &qword_268488380);
      *(void *)(v29 + 72) = v32;
      *(void *)(v29 + 136) = v30;
      *(void *)(v29 + 144) = v31;
      id v34 = v59;
      *(void *)(v29 + 104) = v33;
      *(void *)(v29 + 112) = v34;
      uint64_t v54 = (uint64_t)v28;
      *(void *)(v29 + 120) = v28;
      swift_bridgeObjectRetain();
      sub_22BE92588();
      swift_bridgeObjectRelease();
      uint64_t v35 = v60;
      uint64_t v36 = v61;
      (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))((char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v68, v61);
      unint64_t v37 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
      unint64_t v38 = (v20 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v39 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v56 = (v40 + 15) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v41 = swift_allocObject();
      uint64_t v42 = v67;
      *(void *)(v41 + 16) = v66;
      *(void *)(v41 + 24) = v42;
      (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v41 + v37, v21, v36);
      int v43 = (void *)(v41 + v38);
      *int v43 = v34;
      uint64_t v44 = v54;
      v43[1] = v54;
      uint64_t v46 = v57;
      uint64_t v45 = v58;
      *(void *)(v41 + v39) = v57;
      *(void *)(v41 + v40) = v45;
      unint64_t v47 = v41 + v56;
      uint64_t v48 = v64;
      *(void *)unint64_t v47 = v63;
      *(void *)(v47 + 8) = v48;
      char v49 = v62 & 1;
      *(unsigned char *)(v47 + 16) = v62 & 1;
      uint64_t v50 = v65;
      *(void *)(v41 + ((v40 + 39) & 0xFFFFFFFFFFFFFFF8)) = v65;
      swift_bridgeObjectRetain();
      id v51 = v50;
      swift_bridgeObjectRetain();
      sub_22BE91C58();
      id v52 = v46;
      sub_22BE748DC((uint64_t)v59, v44, v68, v46, v45, v49, v51, (uint64_t)sub_22BE772B8, v41);
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v26 = v67;
    uint64_t v25 = v68;
    id v27 = v66;
    return static LaunchUtils.installConfigurationProfile(from:completionBlock:)(v25, v27, v26);
  }
}

void static LaunchUtils.launchAction(for:urlManagedState:providerBundleId:appContainerBundleId:requireOpenIn:preferQuickLook:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, int a5@<W6>, char a6@<W7>, void *a7@<X8>)
{
  int v68 = a5;
  v69[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB28);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_22BE925E8();
    __swift_project_value_buffer(v16, (uint64_t)qword_2684879E0);
    uint64_t v17 = sub_22BE925C8();
    os_log_type_t v18 = sub_22BE93148();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_22BDC5000, v17, v18, "WARNING: QuickLookAllDocumentsInFilesFirst enabled. Prefering to open document with Quick Look instead of handler app.", v19, 2u);
      MEMORY[0x230F57540](v19, -1, -1);
    }

    goto LABEL_34;
  }
  uint64_t v20 = sub_22BE758DC(a1, a3, a4);
  if (!v20)
  {
    id v50 = objc_msgSend(a1, sel_filename);
    uint64_t v51 = sub_22BE92CD8();
    uint64_t v53 = v52;

    id v54 = objc_msgSend(a1, sel_contentType);
    sub_22BE92438();

    uint64_t v55 = sub_22BE92568();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v15, 0, 1, v55);
    sub_22BE71DCC(v51, v53, (uint64_t)v15, a2, v68 & 1, a7);
    swift_bridgeObjectRelease();
    sub_22BE035C8((uint64_t)v15, &qword_26AEFFB28);
    return;
  }
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21)
  {
    swift_bridgeObjectRelease();
LABEL_34:
    a7[1] = 0;
    a7[2] = 0;
    *a7 = 1;
    return;
  }
  id v59 = a7;
  uint64_t v22 = v20;
  uint64_t v23 = self;
  uint64_t v24 = (void *)v23;
  if (v68) {
    uint64_t v25 = 5457241;
  }
  else {
    uint64_t v25 = 20302;
  }
  unint64_t v26 = 0xE200000000000000;
  if (v68) {
    unint64_t v26 = 0xE300000000000000;
  }
  unint64_t v65 = v26;
  uint64_t v66 = v25;
  uint64_t v58 = v22;
  uint64_t v27 = v22 + 40;
  long long v64 = xmmword_22BE99D40;
  int v62 = (void *)v23;
  unint64_t v63 = 0x800000022BEA4F20;
  uint64_t v61 = a1;
  while (1)
  {
    swift_bridgeObjectRetain();
    id v28 = a1;
    id v29 = objc_msgSend(v24, sel_defaultPermission, v58);
    uint64_t v30 = (void *)sub_22BE92C98();
    unsigned int v31 = objc_msgSend(v29, sel_canAppWithBundleIdentifier_performAction_item_, v30, 2, v28);

    if (v31) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_16:
    v27 += 16;
    if (!--v21)
    {
      swift_bridgeObjectRelease();
      a7 = v59;
      goto LABEL_34;
    }
  }
  id v32 = objc_allocWithZone(MEMORY[0x263F01878]);
  uint64_t v33 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  v69[0] = 0;
  id v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, v69);

  if (!v34)
  {
    id v48 = v69[0];
    char v49 = (void *)sub_22BE92088();

    swift_willThrow();
    goto LABEL_16;
  }
  id v35 = v69[0];
  id v36 = objc_msgSend(v34, sel_bundleIdentifier);
  if (!v36)
  {

    goto LABEL_16;
  }
  unint64_t v37 = v36;
  uint64_t v60 = sub_22BE92CD8();
  uint64_t v67 = v38;

  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93148();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v64;
  uint64_t v40 = MEMORY[0x263F8D310];
  *(void *)(v39 + 56) = MEMORY[0x263F8D310];
  unint64_t v41 = sub_22BDF8220();
  *(void *)(v39 + 64) = v41;
  *(void *)(v39 + 32) = 0xD000000000000066;
  *(void *)(v39 + 40) = v63;
  *(void *)(v39 + 96) = sub_22BDD9D50(0, &qword_2684883A0);
  uint64_t v42 = sub_22BE75A3C((unint64_t *)&unk_2684883A8, &qword_2684883A0);
  *(void *)(v39 + 72) = v34;
  *(void *)(v39 + 136) = v40;
  *(void *)(v39 + 144) = v41;
  uint64_t v43 = v66;
  *(void *)(v39 + 104) = v42;
  *(void *)(v39 + 112) = v43;
  *(void *)(v39 + 120) = v65;
  id v44 = v34;
  unsigned int v45 = objc_msgSend(v44, sel_supportsOpenInPlace);
  uint64_t v46 = 5457241;
  if (!v45) {
    uint64_t v46 = 20302;
  }
  *(void *)(v39 + 176) = v40;
  *(void *)(v39 + 184) = v41;
  unint64_t v47 = 0xE200000000000000;
  if (v45) {
    unint64_t v47 = 0xE300000000000000;
  }
  *(void *)(v39 + 152) = v46;
  *(void *)(v39 + 160) = v47;
  sub_22BE92588();
  swift_bridgeObjectRelease();
  if ((v68 & 1) != 0 && !objc_msgSend(v44, sel_supportsOpenInPlace))
  {

    swift_bridgeObjectRelease();
    a1 = v61;
    uint64_t v24 = v62;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  unint64_t v56 = v59;
  uint64_t v57 = v60;
  *id v59 = v44;
  v56[1] = v57;
  v56[2] = v67;
}

void *sub_22BE718F4(char a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, void *a12)
{
  id v59 = a7;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB28);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1) {
    return (void *)a2(1);
  }
  uint64_t v52 = a2;
  uint64_t v53 = a5;
  uint64_t v56 = a8;
  uint64_t v51 = a3;
  int v55 = a11;
  uint64_t v57 = a10;
  uint64_t v58 = a6;
  uint64_t v54 = a9;
  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93148();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v23 = swift_allocObject();
  long long v49 = xmmword_22BE9A3B0;
  *(_OWORD *)(v23 + 16) = xmmword_22BE9A3B0;
  uint64_t v24 = MEMORY[0x263F8D310];
  *(void *)(v23 + 56) = MEMORY[0x263F8D310];
  unint64_t v25 = sub_22BDF8220();
  *(void *)(v23 + 64) = v25;
  *(void *)(v23 + 32) = 0xD000000000000071;
  *(void *)(v23 + 40) = 0x800000022BEA5460;
  unint64_t v48 = 0x800000022BEA5460;
  uint64_t v26 = sub_22BE92138();
  uint64_t v47 = sub_22BDD9D50(0, &qword_268488380);
  *(void *)(v23 + 96) = v47;
  uint64_t v27 = sub_22BE75A3C(&qword_268488388, &qword_268488380);
  *(void *)(v23 + 72) = v26;
  *(void *)(v23 + 136) = v24;
  *(void *)(v23 + 144) = v25;
  uint64_t v28 = v53;
  *(void *)(v23 + 104) = v27;
  *(void *)(v23 + 112) = v28;
  *(void *)(v23 + 120) = v58;
  swift_bridgeObjectRetain();
  sub_22BE92588();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_22BE92128();
  uint64_t v31 = v30;
  id v32 = objc_msgSend(v59, sel_contentType);
  sub_22BE92438();

  uint64_t v33 = sub_22BE92568();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v21, 0, 1, v33);
  sub_22BE71DCC(v29, v31, (uint64_t)v21, v56, v55 & 1, v60);
  swift_bridgeObjectRelease();
  sub_22BE035C8((uint64_t)v21, &qword_26AEFFB28);
  id v34 = (void *)v60[0];
  uint64_t v35 = v60[1];
  uint64_t v36 = v60[2];
  if (v60[0] < 2uLL)
  {
    unint64_t v37 = v52;
LABEL_11:
    sub_22BE7739C(v34);
    return (void *)v37(0);
  }
  uint64_t v46 = (void *)v60[0];
  swift_bridgeObjectRetain();
  sub_22BE93148();
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = v49;
  uint64_t v39 = MEMORY[0x263F8D310];
  *(void *)(v38 + 56) = MEMORY[0x263F8D310];
  *(void *)(v38 + 64) = v25;
  *(void *)(v38 + 32) = 0xD000000000000071;
  *(void *)(v38 + 40) = v48;
  uint64_t v40 = sub_22BE92138();
  *(void *)(v38 + 96) = v47;
  *(void *)(v38 + 104) = v27;
  *(void *)(v38 + 72) = v40;
  *(void *)(v38 + 136) = v39;
  *(void *)(v38 + 144) = v25;
  *(void *)(v38 + 112) = v35;
  *(void *)(v38 + 120) = v36;
  swift_bridgeObjectRetain();
  sub_22BE92588();
  swift_bridgeObjectRelease();
  if (v35 == v28 && v36 == v58 || (sub_22BE938C8() & 1) != 0)
  {
    unint64_t v37 = v52;
    swift_bridgeObjectRelease();
    id v34 = v46;
    goto LABEL_11;
  }
  if (v57
    && (id v41 = objc_msgSend(self, sel_defaultPermission),
        uint64_t v42 = (void *)sub_22BE92C98(),
        uint64_t v43 = (void *)sub_22BE92C98(),
        unsigned __int8 v44 = objc_msgSend(v41, sel_canAppWithBundleIdentifier_performAction_bundleIdentifier_, v42, 1, v43), v41, v42, v43, (v44 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    v52(0);
  }
  else
  {
    sub_22BE748DC(v35, v36, a4, v59, v56, v55 & 1, a12, (uint64_t)v52, v51);
    swift_bridgeObjectRelease();
  }
  return sub_22BE7739C(v46);
}

void sub_22BE71DCC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W6>, void *a6@<X8>)
{
  int v69 = a5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB28);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v68 = (uint64_t)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v59 - v14;
  uint64_t v16 = sub_22BE92568();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = a3;
  sub_22BDDC158(a3, (uint64_t)v15, &qword_26AEFFB28);
  uint64_t v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v20 = v66(v15, 1, v16);
  v70 = a6;
  if (v20 == 1)
  {
    uint64_t v21 = v16;
    sub_22BE035C8((uint64_t)v15, &qword_26AEFFB28);
    char v22 = v69;
  }
  else
  {
    v59[0] = v17 + 48;
    v59[1] = a1;
    v59[2] = a2;
    uint64_t v60 = a4;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268488460);
    uint64_t v27 = *(void *)(v17 + 72);
    uint64_t v28 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v29 = (v28 + 32) & ~v28;
    uint64_t v64 = 4 * v27;
    uint64_t v61 = v28 | 7;
    uint64_t v62 = v26;
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_22BE99D40;
    uint64_t v63 = v29;
    uint64_t v31 = v30 + v29;
    if (qword_2684868E8 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v16, (uint64_t)qword_268488668);
    uint64_t v65 = v17;
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    v33(v31, v32, v16);
    if (qword_2684868F0 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v16, (uint64_t)qword_268488680);
    v33(v31 + v27, v34, v16);
    sub_22BE924D8();
    sub_22BE923F8();
    if (*(void *)(v30 + 16))
    {
      uint64_t v35 = v30 + v29;
      uint64_t v36 = *(void *)(v30 + 16);
      while ((sub_22BE92528() & 1) == 0)
      {
        v35 += v27;
        if (!--v36) {
          goto LABEL_13;
        }
      }
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v19, v16);
      int v55 = v70;
      void *v70 = 0;
      v55[1] = 0;
      v55[2] = 0;
      return;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v62 = swift_allocObject();
    sub_22BE924A8();
    sub_22BE924B8();
    sub_22BE92498();
    sub_22BE92448();
    sub_22BE924F8();
    sub_22BE923E8();
    sub_22BE923D8();
    if ((sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0
      || (sub_22BE92528() & 1) != 0)
    {
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v19, v16);
      unint64_t v37 = v70;
LABEL_38:
      v37[1] = 0;
      v37[2] = 0;
      *unint64_t v37 = 1;
      return;
    }
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v17 = v65;
    uint64_t v58 = v19;
    uint64_t v21 = v16;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v58, v16);
    char v22 = v69;
    a4 = v60;
  }
  uint64_t v23 = v68;
  sub_22BDDC158(v67, v68, &qword_26AEFFB28);
  uint64_t v24 = v21;
  if (v66((char *)v23, 1, v21) == 1)
  {
    sub_22BE035C8(v23, &qword_26AEFFB28);
    uint64_t v25 = 0;
  }
  else
  {
    sub_22BE923A8();
    uint64_t v25 = v38;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v23, v24);
  }
  swift_bridgeObjectRetain();
  uint64_t v39 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  if (v25)
  {
    uint64_t v40 = (void *)sub_22BE92C98();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v40 = 0;
  }
  id v41 = objc_msgSend(self, sel_documentProxyForName_type_MIMEType_isContentManaged_sourceAuditToken_, v39, v40, 0, a4 == 1, 0);

  id v42 = sub_22BE75EF4(v41, v22 & 1);
  if (!v42)
  {

LABEL_37:
    unint64_t v37 = v70;
    goto LABEL_38;
  }
  id v43 = v42;
  id v44 = v42;
  id v45 = objc_msgSend(v44, sel_bundleIdentifier);
  if (!v45)
  {

    goto LABEL_37;
  }
  uint64_t v46 = v45;
  uint64_t v47 = sub_22BE92CD8();
  uint64_t v49 = v48;

  id v50 = objc_msgSend(self, sel_mainBundle);
  id v51 = objc_msgSend(v50, sel_bundleIdentifier);

  if (v51)
  {
    uint64_t v52 = sub_22BE92CD8();
    uint64_t v54 = v53;

    if (v47 == v52 && v49 == v54)
    {
      swift_bridgeObjectRelease();

LABEL_36:
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    char v56 = sub_22BE938C8();
    swift_bridgeObjectRelease();

    if (v56) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v57 = v70;
  void *v70 = v43;
  v57[1] = v47;
  v57[2] = v49;
}

void sub_22BE72508(void *a1, void *a2, char a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, void (*a12)(void), uint64_t a13)
{
  if (a1)
  {
    id v27 = a1;
    sub_22BE70DE4(v27, a6, a7, a8, a9, a10, a11 & 1, a12, a13, a3 & 1, a4, a5);
  }
  else
  {
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_22BE9A3B0;
    uint64_t v21 = MEMORY[0x263F8D310];
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    unint64_t v22 = sub_22BDF8220();
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 32) = 0xD000000000000089;
    *(void *)(v20 + 40) = 0x800000022BEA53B0;
    uint64_t v23 = sub_22BE92138();
    *(void *)(v20 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v20 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v20 + 72) = v23;
    id v24 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268488470);
    uint64_t v25 = sub_22BE92CF8();
    *(void *)(v20 + 136) = v21;
    *(void *)(v20 + 144) = v22;
    *(void *)(v20 + 112) = v25;
    *(void *)(v20 + 120) = v26;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    a12(0);
  }
}

void sub_22BE72744(void *a1, uint64_t a2, int a3, void *a4, uint64_t a5, void *a6, uint64_t a7, int a8)
{
  uint64_t v15 = sub_22BE92198();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  if (a1)
  {
    id v41 = a1;
    sub_22BE7026C(a7, v41, a8 & 1, a3 & 1, a4, a5, (uint64_t)a6);
  }
  else
  {
    uint64_t v37 = v18;
    int v36 = a3;
    int v38 = a8;
    uint64_t v39 = a5;
    uint64_t v40 = a4;
    id v41 = a6;
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_22BE97A30;
    *(void *)(v19 + 56) = MEMORY[0x263F8D310];
    *(void *)(v19 + 64) = sub_22BDF8220();
    *(void *)(v19 + 32) = 0xD000000000000089;
    *(void *)(v19 + 40) = 0x800000022BEA53B0;
    uint64_t v34 = a7;
    uint64_t v20 = sub_22BE92138();
    *(void *)(v19 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v19 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v19 + 72) = v20;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(self, sel_defaultManager);
    uint64_t v21 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v21, a7, v37);
    unint64_t v23 = (*(unsigned __int8 *)(v16 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    unint64_t v24 = (v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = swift_allocObject();
    *(unsigned char *)(v27 + 16) = v36 & 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v27 + v23, v21, v22);
    uint64_t v28 = v40;
    uint64_t v29 = (uint64_t)v41;
    *(void *)(v27 + v24) = v40;
    *(void *)(v27 + v25) = 2;
    uint64_t v30 = (void *)(v27 + v26);
    unint64_t v31 = v27 + ((v26 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v30 = 0;
    v30[1] = 0;
    LOBYTE(v30) = v38 & 1;
    *(void *)unint64_t v31 = 0;
    *(void *)(v31 + 8) = 0;
    *(unsigned char *)(v31 + 16) = (_BYTE)v30;
    uint64_t v32 = (uint64_t *)(v27 + ((v26 + 47) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v32 = v39;
    v32[1] = v29;
    id v33 = v28;
    sub_22BE91C58();
    _sSo13FPItemManagerC08DocumentB11ExecutablesE13doc_fetchItem3for17completionHandlery10Foundation3URLV_ySo0A0CSg_s5Error_pSgtctF_0(v34, (uint64_t)sub_22BE774D8, v27);
    swift_release();
  }
}

id static LaunchUtils.bundleIdentifierOfDefaultApp(for:)(void *a1)
{
  v47[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
  id v5 = objc_msgSend(self, sel_defaultPermission);
  id v6 = objc_msgSend(v5, sel_dataOwnerStateForNode_, a1);

  uint64_t v7 = self;
  v47[0] = 0;
  id v8 = a1;
  id v9 = objc_msgSend(v7, sel_providerDomainForItem_cachePolicy_error_, v8, 3, v47);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = v47[0];

    id v12 = objc_msgSend(v10, sel_topLevelBundleIdentifier);
    sub_22BE92CD8();

    uint64_t v13 = sub_22BE92198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
    id v14 = sub_22BE74DF0(v8, (uint64_t)v4);
    uint64_t v16 = v15;

    sub_22BE035C8((uint64_t)v4, (uint64_t *)&unk_26AEFFB10);
  }
  else
  {
    id v17 = v47[0];
    uint64_t v18 = (void *)sub_22BE92088();

    swift_willThrow();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_22BE925E8();
    __swift_project_value_buffer(v19, (uint64_t)qword_2684879E0);
    id v20 = v18;
    id v21 = v18;
    uint64_t v22 = sub_22BE925C8();
    os_log_type_t v23 = sub_22BE93158();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      unint64_t v25 = (void *)swift_slowAlloc();
      v47[0] = v25;
      *(_DWORD *)unint64_t v24 = 136315138;
      swift_getErrorValue();
      uint64_t v26 = sub_22BE93988();
      uint64_t v46 = sub_22BDD8478(v26, v27, (uint64_t *)v47);
      sub_22BE93408();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22BDC5000, v22, v23, "Error fetching providerDomain %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v25, -1, -1);
      MEMORY[0x230F57540](v24, -1, -1);
    }
    else
    {
    }
    id v14 = 0;
    uint64_t v16 = 0;
  }
  static LaunchUtils.launchAction(for:urlManagedState:providerBundleId:appContainerBundleId:requireOpenIn:preferQuickLook:)(v8, (uint64_t)v6, (uint64_t)v14, v16, 1, 0, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v47[0])
  {
    if (qword_2684868C8 != -1) {
      swift_once();
    }
    id v37 = (id)qword_268488370;
    goto LABEL_38;
  }
  if (v47[0] == (id)1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684883B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22BE97A30;
    if (qword_2684868C8 != -1) {
      swift_once();
    }
    uint64_t v29 = *(void *)algn_268488378;
    *(void *)(inited + 32) = qword_268488370;
    *(void *)(inited + 40) = v29;
    *(void *)(inited + 48) = 0xD000000000000031;
    *(void *)(inited + 56) = 0x800000022BEA5020;
    uint64_t v30 = self;
    swift_bridgeObjectRetain();
    id v31 = objc_msgSend(v30, sel_mainBundle);
    id v32 = objc_msgSend(v31, sel_bundleIdentifier);

    if (v32)
    {
      uint64_t v33 = sub_22BE92CD8();
      uint64_t v35 = v34;

      uint64_t v36 = *(void *)(inited + 40);
      if (v36)
      {
LABEL_15:
        if (v35)
        {
          if (*(void *)(inited + 32) == v33 && v36 == v35 || (sub_22BE938C8() & 1) != 0) {
            goto LABEL_32;
          }
LABEL_28:
          uint64_t v44 = *(void *)(inited + 56);
          if (v44 && (*(void *)(inited + 48) == v33 && v44 == v35 || (sub_22BE938C8() & 1) != 0))
          {
LABEL_32:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_37:
            id v37 = (id)qword_268488370;
LABEL_38:
            swift_bridgeObjectRetain();
            return v37;
          }
          goto LABEL_34;
        }
        if (*(void *)(inited + 56))
        {
LABEL_34:
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
          swift_arrayDestroy();
          return 0;
        }
LABEL_36:
        swift_setDeallocating();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
        swift_arrayDestroy();
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)(inited + 40);
      if (v36) {
        goto LABEL_15;
      }
    }
    if (v35) {
      goto LABEL_28;
    }
    goto LABEL_36;
  }
  id v37 = v47[1];
  id v38 = v47[2];

  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93148();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_22BE9A3B0;
  uint64_t v40 = MEMORY[0x263F8D310];
  *(void *)(v39 + 56) = MEMORY[0x263F8D310];
  unint64_t v41 = sub_22BDF8220();
  *(void *)(v39 + 64) = v41;
  *(void *)(v39 + 32) = 0xD000000000000022;
  *(void *)(v39 + 40) = 0x800000022BEA4FF0;
  *(void *)(v39 + 96) = sub_22BDD9D50(0, (unint64_t *)&qword_26AF00490);
  uint64_t v42 = sub_22BE75A3C(&qword_26AF004A0, (unint64_t *)&qword_26AF00490);
  *(void *)(v39 + 72) = v8;
  *(void *)(v39 + 136) = v40;
  *(void *)(v39 + 144) = v41;
  *(void *)(v39 + 104) = v42;
  *(void *)(v39 + 112) = v37;
  *(void *)(v39 + 120) = v38;
  id v43 = v8;
  swift_bridgeObjectRetain();
  sub_22BE92588();
  swift_bridgeObjectRelease();
  return v37;
}

unint64_t static LaunchUtils.allOpeningApps(for:requireOpenInPlace:)(void *a1, char a2)
{
  uint64_t v3 = a1;
  uint64_t v85 = *MEMORY[0x263EF8340];
  unint64_t v83 = 0;
  id v4 = objc_msgSend(a1, sel_availableClaimBindingsForMode_error_, 0, &v83);
  id v5 = (id)v83;
  if (!v4)
  {
    id v21 = (id)v83;
    uint64_t v22 = (void *)sub_22BE92088();

    swift_willThrow();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_22BE925E8();
    __swift_project_value_buffer(v23, (uint64_t)qword_2684879E0);
    id v24 = v3;
    id v25 = v22;
    id v26 = v24;
    id v27 = v22;
    uint64_t v28 = sub_22BE925C8();
    os_log_type_t v29 = sub_22BE93158();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      id v31 = (void *)swift_slowAlloc();
      unint64_t v80 = swift_slowAlloc();
      unint64_t v83 = v80;
      *(_DWORD *)uint64_t v30 = 138412802;
      id v32 = v26;
      sub_22BE93408();
      *id v31 = v26;

      *(_WORD *)(v30 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v33 = sub_22BE93988();
      sub_22BDD8478(v33, v34, (uint64_t *)&v83);
      sub_22BE93408();
      swift_bridgeObjectRelease();

      *(_WORD *)(v30 + 22) = 2080;
      sub_22BDD8478(0xD000000000000027, 0x800000022BEA5060, (uint64_t *)&v83);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v28, v29, "error determining opening apps of %@ - claimBindings loading error: %s - %s", (uint8_t *)v30, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v31, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v80, -1, -1);
      MEMORY[0x230F57540](v30, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v6 = v4;
  sub_22BDD9D50(0, (unint64_t *)&qword_2684883C0);
  unint64_t v7 = sub_22BE92EB8();
  id v8 = v5;

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_22BE937E8();
    swift_bridgeObjectRelease();
    if (v55 <= 0) {
      goto LABEL_58;
    }
    unint64_t v83 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_22BE937E8();
    char v79 = a2;
    if (!v56)
    {
      swift_bridgeObjectRelease();
      unint64_t v16 = MEMORY[0x263F8EE78];
      goto LABEL_16;
    }
    uint64_t v9 = v56;
    if (v56 < 1)
    {
      __break(1u);
      goto LABEL_58;
    }
    uint64_t v10 = v3;
  }
  else
  {
    uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9) {
      goto LABEL_58;
    }
    char v79 = a2;
    uint64_t v10 = v3;
    unint64_t v83 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
  }
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v12 = (id)MEMORY[0x230F56140](i, v7);
    }
    else {
      id v12 = *(id *)(v7 + 8 * i + 32);
    }
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v12, sel_bundleRecord);
    self;
    uint64_t v15 = swift_dynamicCastObjCClass();

    if (v15)
    {
      MEMORY[0x230F55950]();
      if (*(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22BE92EF8();
      }
      sub_22BE92F48();
      sub_22BE92ED8();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v16 = v83;
  uint64_t v3 = v10;
LABEL_16:
  swift_bridgeObjectRelease();
  if (!(v16 >> 62))
  {
    if (*(uint64_t *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0) {
      goto LABEL_18;
    }
LABEL_58:
    swift_bridgeObjectRelease();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_22BE925E8();
    __swift_project_value_buffer(v58, (uint64_t)qword_2684879E0);
    id v59 = v3;
    uint64_t v60 = sub_22BE925C8();
    os_log_type_t v61 = sub_22BE93158();
    if (!os_log_type_enabled(v60, v61))
    {

      return 0;
    }
    uint64_t v62 = swift_slowAlloc();
    uint64_t v63 = (void *)swift_slowAlloc();
    unint64_t v64 = swift_slowAlloc();
    unint64_t v83 = v64;
    *(_DWORD *)uint64_t v62 = 138412546;
    id v65 = v59;
    sub_22BE93408();
    *uint64_t v63 = v59;

    *(_WORD *)(v62 + 12) = 2080;
    sub_22BDD8478(0xD000000000000027, 0x800000022BEA5060, (uint64_t *)&v83);
    sub_22BE93408();
    _os_log_impl(&dword_22BDC5000, v60, v61, "no apps exist to open %@ - claimBindings was empty - %s", (uint8_t *)v62, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v63, -1, -1);
LABEL_62:
    swift_arrayDestroy();
    MEMORY[0x230F57540](v64, -1, -1);
    MEMORY[0x230F57540](v62, -1, -1);

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  if (v57 <= 0) {
    goto LABEL_58;
  }
LABEL_18:
  if (v79)
  {
    unint64_t v83 = MEMORY[0x263F8EE78];
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_22BE937E8();
      swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_21:
        if (v17 < 1)
        {
          __break(1u);
          goto LABEL_74;
        }
        for (uint64_t j = 0; j != v17; ++j)
        {
          if ((v16 & 0xC000000000000001) != 0) {
            id v19 = (id)MEMORY[0x230F56140](j, v16);
          }
          else {
            id v19 = *(id *)(v16 + 8 * j + 32);
          }
          id v20 = v19;
          if (objc_msgSend(v19, sel_supportsOpenInPlace))
          {
            sub_22BE936B8();
            sub_22BE936F8();
            sub_22BE93708();
            sub_22BE936C8();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v16 = v83;
        if ((v83 & 0x8000000000000000) != 0) {
          goto LABEL_67;
        }
LABEL_43:
        if ((v16 & 0x4000000000000000) == 0)
        {
          if (*(uint64_t *)(v16 + 16) <= 0)
          {
LABEL_68:
            unint64_t v83 = 0;
            unint64_t v84 = 0xE000000000000000;
            sub_22BE93648();
            sub_22BE92D88();
            uint64_t v68 = sub_22BDD9D50(0, &qword_2684883A0);
            MEMORY[0x230F55980](v16, v68);
            sub_22BE92D88();
            swift_release();
            swift_bridgeObjectRelease();
            sub_22BE92D88();
            sub_22BE92D88();
            sub_22BE92D88();
            int64_t v70 = v83;
            unint64_t v69 = v84;
            if (qword_2684867F8 != -1) {
              swift_once();
            }
            uint64_t v71 = sub_22BE925E8();
            __swift_project_value_buffer(v71, (uint64_t)qword_2684879E0);
            id v72 = v3;
            swift_bridgeObjectRetain();
            v73 = sub_22BE925C8();
            os_log_type_t v74 = sub_22BE93158();
            if (!os_log_type_enabled(v73, v74))
            {

              swift_bridgeObjectRelease_n();
              return 0;
            }
            uint64_t v62 = swift_slowAlloc();
            log = v73;
            v75 = (void *)swift_slowAlloc();
            unint64_t v82 = swift_slowAlloc();
            unint64_t v83 = v82;
            *(_DWORD *)uint64_t v62 = 138412802;
            id v76 = v72;
            sub_22BE93408();
            v77 = v75;
            void *v75 = v72;

            *(_WORD *)(v62 + 12) = 2080;
            swift_bridgeObjectRetain();
            sub_22BDD8478(v70, v69, (uint64_t *)&v83);
            sub_22BE93408();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v62 + 22) = 2080;
            sub_22BDD8478(0xD000000000000027, 0x800000022BEA5060, (uint64_t *)&v83);
            sub_22BE93408();
            uint64_t v60 = log;
            _os_log_impl(&dword_22BDC5000, log, v74, "error determining opening apps of %@ - opening apps %s - %s", (uint8_t *)v62, 0x20u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
            swift_arrayDestroy();
            MEMORY[0x230F57540](v77, -1, -1);
            unint64_t v64 = v82;
            goto LABEL_62;
          }
LABEL_45:
          if (qword_2684867F8 == -1)
          {
LABEL_46:
            uint64_t v48 = sub_22BE925E8();
            __swift_project_value_buffer(v48, (uint64_t)qword_2684879E0);
            swift_retain_n();
            id v36 = v3;
            id v37 = sub_22BE925C8();
            os_log_type_t v38 = sub_22BE93138();
            if (os_log_type_enabled(v37, v38))
            {
              uint64_t v39 = swift_slowAlloc();
              uint64_t v40 = (void *)swift_slowAlloc();
              unint64_t v81 = swift_slowAlloc();
              unint64_t v83 = v81;
              *(_DWORD *)uint64_t v39 = 138412546;
              id v49 = v36;
              sub_22BE93408();
              *uint64_t v40 = v36;

              *(_WORD *)(v39 + 12) = 2080;
              uint64_t v50 = sub_22BDD9D50(0, &qword_2684883A0);
              uint64_t v51 = sub_22BE91C58();
              uint64_t v52 = MEMORY[0x230F55980](v51, v50);
              unint64_t v54 = v53;
              swift_release();
              sub_22BDD8478(v52, v54, (uint64_t *)&v83);
              sub_22BE93408();
              swift_release_n();
              swift_bridgeObjectRelease();
              uint64_t v47 = "determined opening apps (requireOpenInPlace = true) of %@ to be %s";
              goto LABEL_48;
            }

            swift_release_n();
LABEL_51:

            return v16;
          }
LABEL_74:
          swift_once();
          goto LABEL_46;
        }
LABEL_67:
        swift_bridgeObjectRetain();
        uint64_t v67 = sub_22BE937E8();
        swift_release();
        if (v67 <= 0) {
          goto LABEL_68;
        }
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v17) {
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v16 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_43;
  }
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_22BE925E8();
  __swift_project_value_buffer(v35, (uint64_t)qword_2684879E0);
  swift_bridgeObjectRetain_n();
  id v36 = v3;
  id v37 = sub_22BE925C8();
  os_log_type_t v38 = sub_22BE93138();
  if (!os_log_type_enabled(v37, v38))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_51;
  }
  uint64_t v39 = swift_slowAlloc();
  uint64_t v40 = (void *)swift_slowAlloc();
  unint64_t v81 = swift_slowAlloc();
  unint64_t v83 = v81;
  *(_DWORD *)uint64_t v39 = 138412546;
  id v41 = v36;
  sub_22BE93408();
  *uint64_t v40 = v36;

  *(_WORD *)(v39 + 12) = 2080;
  uint64_t v42 = sub_22BDD9D50(0, &qword_2684883A0);
  uint64_t v43 = swift_bridgeObjectRetain();
  uint64_t v44 = MEMORY[0x230F55980](v43, v42);
  unint64_t v46 = v45;
  swift_bridgeObjectRelease();
  sub_22BDD8478(v44, v46, (uint64_t *)&v83);
  sub_22BE93408();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t v47 = "determined opening apps (requireOpenInPlace = false) of %@ to be %s";
LABEL_48:
  _os_log_impl(&dword_22BDC5000, v37, v38, v47, (uint8_t *)v39, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
  swift_arrayDestroy();
  MEMORY[0x230F57540](v40, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x230F57540](v81, -1, -1);
  MEMORY[0x230F57540](v39, -1, -1);

  return v16;
}

uint64_t sub_22BE7414C(uint64_t a1)
{
  uint64_t v2 = swift_projectBox();
  swift_beginAccess();
  sub_22BE75E8C(a1, v2);
  return sub_22BE932C8();
}

id sub_22BE741AC(id *a1)
{
  id result = objc_msgSend(*a1, sel_documentsURL);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)sub_22BE92138();
    id v4 = objc_msgSend(v2, sel_fp_relationshipToItemAtURL_, v3);

    return (id)(v4 != (id)2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22BE74230()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

id sub_22BE74278(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_22BE92088();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_22BE74354(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AF00288 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26AEFFAC0;
  sub_22BE93148();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22BE9A3B0;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v9 = sub_22BDF8220();
  unint64_t v10 = v9;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 32) = 0xD000000000000032;
  *(void *)(v7 + 40) = 0x800000022BEA52C0;
  if (a1)
  {
    uint64_t v19 = sub_22BDD9D50(0, (unint64_t *)&qword_268487598);
    uint64_t v20 = sub_22BE75A3C(&qword_268488450, (unint64_t *)&qword_268487598);
    *(void *)&long long v18 = a1;
    sub_22BDE1DD4(&v18, v7 + 72);
  }
  else
  {
    *(void *)(v7 + 96) = v8;
    *(void *)(v7 + 104) = v9;
    *(void *)(v7 + 72) = 7104878;
    *(void *)(v7 + 80) = 0xE300000000000000;
  }
  sub_22BDDC158(a2, (uint64_t)v6, (uint64_t *)&unk_26AEFFB10);
  uint64_t v11 = sub_22BE92198();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    *(void *)(v7 + 136) = v8;
    *(void *)(v7 + 144) = v10;
    *(void *)(v7 + 112) = 7104878;
    *(void *)(v7 + 120) = 0xE300000000000000;
    id v13 = a1;
  }
  else
  {
    id v14 = a1;
    uint64_t v15 = sub_22BE92138();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
    uint64_t v19 = sub_22BDD9D50(0, &qword_268488380);
    uint64_t v20 = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)&long long v18 = v15;
    sub_22BDE1DD4(&v18, v7 + 112);
  }
  sub_22BE92588();
  return swift_bridgeObjectRelease();
}

void sub_22BE7462C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v42 = a3;
  uint64_t v43 = a8;
  uint64_t v44 = a2;
  uint64_t v14 = sub_22BE92198();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    uint64_t v41 = sub_22BE92138();
    uint64_t v40 = sub_22BE92C98();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v14);
    unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v36 = a9;
    unint64_t v37 = (v18 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = (v18 + v16 + 31) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v38 = a5;
    uint64_t v39 = a7;
    unint64_t v20 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v23 + v18, v17, v14);
    uint64_t v24 = v36;
    unint64_t v25 = v23 + v37;
    *(void *)unint64_t v25 = v43;
    *(void *)(v25 + 8) = v24;
    *(unsigned char *)(v25 + 16) = 1;
    id v26 = (uint64_t *)(v23 + v19);
    uint64_t v28 = v38;
    id v27 = v39;
    *id v26 = a4;
    v26[1] = v28;
    *(void *)(v23 + v20) = v42;
    *(void *)(v23 + v21) = v27;
    os_log_type_t v29 = v44;
    *(void *)(v23 + v22) = v44;
    aBlock[4] = sub_22BE6F5D0;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BE02F38;
    aBlock[3] = &block_descriptor_64;
    uint64_t v30 = _Block_copy(aBlock);
    id v31 = v29;
    sub_22BE91C58();
    swift_bridgeObjectRetain();
    id v32 = v27;
    swift_release();
    unint64_t v34 = (void *)v40;
    uint64_t v33 = (void *)v41;
    FPExtendBookmarkForDocumentURL();
    _Block_release(v30);
  }
  else
  {
    sub_22BE6D378(0, 0, 0, a1, a4, a5, v43, a9, v42, a7, v44);
  }
}

void sub_22BE748DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, void *a7, uint64_t a8, uint64_t a9)
{
  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93148();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22BE9A3B0;
  uint64_t v13 = MEMORY[0x263F8D310];
  *(void *)(v12 + 56) = MEMORY[0x263F8D310];
  unint64_t v14 = sub_22BDF8220();
  *(void *)(v12 + 64) = v14;
  *(void *)(v12 + 32) = 0xD00000000000006ELL;
  *(void *)(v12 + 40) = 0x800000022BEA5610;
  uint64_t v15 = sub_22BE92138();
  *(void *)(v12 + 96) = sub_22BDD9D50(0, &qword_268488380);
  uint64_t v16 = sub_22BE75A3C(&qword_268488388, &qword_268488380);
  *(void *)(v12 + 72) = v15;
  *(void *)(v12 + 136) = v13;
  *(void *)(v12 + 144) = v14;
  *(void *)(v12 + 104) = v16;
  *(void *)(v12 + 112) = a1;
  *(void *)(v12 + 120) = a2;
  swift_bridgeObjectRetain();
  sub_22BE92588();
  swift_bridgeObjectRelease();

  sub_22BE7462C(a3, a4, a5, a1, a2, a6 & 1, a7, a8, a9);
}

uint64_t sub_22BE74A9C()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_22BE74B88(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_22BE92198() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (unsigned char *)v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = *(void (**)(uint64_t))((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_22BE6FAEC(a1, v5, v6, v7, (uint64_t)v1 + v4, v8);
}

uint64_t sub_22BE74C30()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BE74C40()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22BE74C68()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_22BE74D40(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  int v7 = *(unsigned __int8 *)(v2 + 16);
  uint64_t v8 = *(void **)(v2 + 24);
  uint64_t v9 = *(void *)(v2 + 32);
  unint64_t v10 = *(void **)(v2 + 40);
  int v11 = *(unsigned __int8 *)(v2 + v6 + *(void *)(v5 + 64));

  sub_22BE72744(a1, a2, v7, v8, v9, v10, v2 + v6, v11);
}

id sub_22BE74DF0(void *a1, uint64_t a2)
{
  uint64_t v117 = a2;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  uint64_t v3 = MEMORY[0x270FA5388](v116);
  uint64_t v5 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v107 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  int v11 = (char *)&v107 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v107 - v12;
  uint64_t v14 = sub_22BE92198();
  uint64_t v115 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  unint64_t v20 = (char *)&v107 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v107 - v21;
  uint64_t v23 = a1;
  id v24 = objc_msgSend(a1, sel_fp_appContainerBundleIdentifier);
  if (v24)
  {
    unint64_t v25 = v24;
    uint64_t v26 = sub_22BE92CD8();

    return (id)v26;
  }
  v108 = v22;
  v109 = v11;
  v111 = v13;
  v112 = v5;
  uint64_t v113 = v14;
  v114 = v20;
  uint64_t v27 = v117;
  v107 = v8;
  v110 = v17;
  id v28 = objc_msgSend(a1, sel_itemIdentifier);
  uint64_t v29 = sub_22BE92CD8();
  uint64_t v31 = v30;
  if (v29 == sub_22BE92CD8() && v31 == v32)
  {

    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v33 = sub_22BE938C8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v33) {
    return 0;
  }
  id v35 = objc_msgSend(a1, sel_providerID);
  sub_22BE92CD8();

  uint64_t v36 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  int IsICloud = DOCDocumentSourceIdentifierIsICloud(v36);

  id v38 = objc_msgSend(v23, sel_providerID);
  uint64_t v39 = sub_22BE92CD8();
  uint64_t v41 = v40;

  if (v39 == sub_22BE92CD8() && v41 == v42)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v43 = v27;
    uint64_t v44 = v114;
  }
  else
  {
    int v45 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = v27;
    uint64_t v44 = v114;
    if (((v45 | IsICloud) & 1) == 0) {
      return 0;
    }
  }
  id v46 = objc_msgSend(v23, sel_parentItemIdentifier);
  uint64_t v47 = sub_22BE92CD8();
  uint64_t v49 = v48;
  if (v47 == sub_22BE92CD8() && v49 == v50)
  {

    swift_bridgeObjectRelease_n();
    uint64_t v51 = &selRef_isUploading;
    goto LABEL_17;
  }
  char v52 = sub_22BE938C8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v51 = &selRef_isUploading;
  if (v52)
  {
LABEL_17:
    id v53 = [v23 v51[305]];
    if (v53)
    {
      unint64_t v54 = v53;
      uint64_t v26 = sub_22BE92CD8();
      uint64_t v56 = v55;

      char v57 = sub_22BDE142C(v26, v56, qword_26DF42510);
      swift_arrayDestroy();
      if ((v57 & 1) == 0) {
        return (id)v26;
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  uint64_t v58 = v44;
  LODWORD(v116) = IsICloud;
  uint64_t v117 = swift_allocBox();
  uint64_t v60 = v59;
  uint64_t v61 = v115;
  uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v115 + 56);
  uint64_t v63 = v113;
  v62(v59, 1, 1, v113);
  uint64_t v64 = (uint64_t)v111;
  sub_22BDDC158(v43, (uint64_t)v111, (uint64_t *)&unk_26AEFFB10);
  id v65 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
  if (v65(v64, 1, v63) != 1)
  {
    id v76 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 32);
    v77 = v108;
    v76(v108, v64, v63);
    sub_22BE035C8(v60, (uint64_t *)&unk_26AEFFB10);
    v76((char *)v60, (uint64_t)v77, v63);
    v62(v60, 0, 1, v63);
    uint64_t v75 = (uint64_t)v112;
    goto LABEL_30;
  }
  sub_22BE035C8(v64, (uint64_t *)&unk_26AEFFB10);
  id v66 = objc_msgSend(v23, sel_fileURL);
  if (!v66)
  {
    uint64_t v69 = (uint64_t)v109;
    v62((uint64_t)v109, 1, 1, v113);
    goto LABEL_27;
  }
  uint64_t v67 = v66;
  uint64_t v68 = v58;
  sub_22BE92168();

  uint64_t v69 = (uint64_t)v109;
  uint64_t v70 = v113;
  (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v109, v68, v113);
  v62(v69, 0, 1, v70);
  if (v65(v69, 1, v70) == 1)
  {
LABEL_27:
    sub_22BE035C8(v69, (uint64_t *)&unk_26AEFFB10);
    dispatch_semaphore_t v78 = dispatch_semaphore_create(0);
    id v79 = objc_msgSend(self, sel_defaultManager);
    uint64_t v80 = swift_allocObject();
    *(void *)(v80 + 16) = v117;
    *(void *)(v80 + 24) = v78;
    aBlock[4] = sub_22BE75DFC;
    aBlock[5] = v80;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BE026A4;
    aBlock[3] = &block_descriptor_38_0;
    unint64_t v81 = _Block_copy(aBlock);
    sub_22BE91C58();
    unint64_t v82 = v78;
    swift_release();
    objc_msgSend(v79, sel_fetchURLForItem_completionHandler_, v23, v81);
    _Block_release(v81);

    sub_22BE932B8();
    uint64_t v75 = (uint64_t)v112;
    uint64_t v63 = v113;
    goto LABEL_30;
  }
  sub_22BE035C8(v69, (uint64_t *)&unk_26AEFFB10);
  id v71 = objc_msgSend(v23, sel_fileURL);
  if (v71)
  {
    id v72 = v71;
    uint64_t v73 = (uint64_t)v107;
    sub_22BE92168();

    uint64_t v74 = 0;
    uint64_t v75 = (uint64_t)v112;
  }
  else
  {
    uint64_t v74 = 1;
    uint64_t v75 = (uint64_t)v112;
    uint64_t v73 = (uint64_t)v107;
  }
  uint64_t v63 = v113;
  v62(v73, v74, 1, v113);
  sub_22BE75E24(v73, v60);
LABEL_30:
  swift_beginAccess();
  sub_22BDDC158(v60, v75, (uint64_t *)&unk_26AEFFB10);
  if (v65(v75, 1, v63) == 1)
  {
    sub_22BE035C8(v75, (uint64_t *)&unk_26AEFFB10);
LABEL_43:
    swift_release();
    return 0;
  }
  uint64_t v83 = v115;
  unint64_t v84 = v110;
  (*(void (**)(char *, uint64_t, uint64_t))(v115 + 32))(v110, v75, v63);
  if (v116)
  {
    uint64_t v85 = (void *)sub_22BE92138();
    id v86 = objc_msgSend(v85, sel_br_containerID);

    if (v86)
    {
      uint64_t v26 = sub_22BE92CD8();
      unint64_t v88 = v87;

      if (sub_22BE92DE8())
      {
        swift_bridgeObjectRetain();
        unint64_t v89 = sub_22BE92D58();
        uint64_t v91 = sub_22BE89C3C(v89, v26, v88, v90);
        uint64_t v93 = v92;
        uint64_t v95 = v94;
        uint64_t v97 = v96;
        swift_bridgeObjectRelease();
        uint64_t v26 = MEMORY[0x230F557E0](v91, v93, v95, v97);
        unint64_t v99 = v98;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v88 = v99;
      }
      char v100 = sub_22BDE142C(v26, v88, qword_26DF42550);
      swift_arrayDestroy();
      if (v100)
      {
        swift_bridgeObjectRelease();
        uint64_t v26 = 0;
      }
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  id result = objc_msgSend(self, sel_sharedRegistry);
  if (result)
  {
    v101 = result;
    id v102 = objc_msgSend(result, sel_listOfMonitoredApps);

    sub_22BDD9D50(0, &qword_268488458);
    unint64_t v103 = sub_22BE92EB8();

    MEMORY[0x270FA5388](v104);
    *(&v107 - 2) = v84;
    v105 = sub_22BE6C520((uint64_t (*)(id *))sub_22BE75E04, (uint64_t)(&v107 - 4), v103);
    swift_bridgeObjectRelease();
    if (v105)
    {
      id v106 = objc_msgSend(v105, sel_bundleID);
      uint64_t v26 = sub_22BE92CD8();

LABEL_41:
      (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v63);
      swift_release();
      return (id)v26;
    }
LABEL_42:
    (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v63);
    goto LABEL_43;
  }
  __break(1u);
  return result;
}

uint64_t sub_22BE758DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BE92198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  id v10 = sub_22BE74DF0(a1, (uint64_t)v8);
  uint64_t v12 = v11;
  sub_22BE035C8((uint64_t)v8, (uint64_t *)&unk_26AEFFB10);
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00518);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_22BE99770;
    *(void *)(v13 + 32) = v10;
    *(void *)(v13 + 40) = v12;
  }
  else if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00518);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_22BE99770;
    *(void *)(v13 + 32) = a2;
    *(void *)(v13 + 40) = a3;
    swift_bridgeObjectRetain();
  }
  else
  {
    return 0;
  }
  return v13;
}

uint64_t sub_22BE75A3C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22BDD9D50(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchUtils()
{
  return &type metadata for LaunchUtils;
}

uint64_t type metadata accessor for LaunchUtils.OpenAppDelegate()
{
  return self;
}

id *destroy for LaunchUtils.LaunchAction(id *result)
{
  if ((unint64_t)*result >= 0xFFFFFFFF)
  {

    return (id *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s26DocumentManagerExecutables11LaunchUtilsV12LaunchActionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    id v6 = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for LaunchUtils.LaunchAction(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (*(void *)a1 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      id v7 = v5;
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v8 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  id v6 = v5;

  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LaunchUtils.LaunchAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {

    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    return a1;
  }
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchUtils.LaunchAction(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LaunchUtils.LaunchAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_22BE75D78(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_22BE75D90(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
    result[2] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for LaunchUtils.LaunchAction()
{
  return &type metadata for LaunchUtils.LaunchAction;
}

uint64_t type metadata accessor for FPHierarchyLookup()
{
  return self;
}

uint64_t sub_22BE75DE4()
{
  return objectdestroy_34Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_22BE75DFC(uint64_t a1)
{
  return sub_22BE7414C(a1);
}

unint64_t sub_22BE75E04(id *a1)
{
  return (unint64_t)sub_22BE741AC(a1) & 1;
}

uint64_t sub_22BE75E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BE75E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

id sub_22BE75EF4(void *a1, char a2)
{
  uint64_t v3 = a1;
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F018F0];
  unint64_t v81 = 0;
  id v5 = objc_msgSend(a1, sel_availableClaimBindingsForMode_handlerRank_error_, 0, v4, &v81);
  id v6 = (id)v81;
  if (!v5)
  {
    id v33 = (id)v81;
    unint64_t v34 = (void *)sub_22BE92088();

    swift_willThrow();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_22BE925E8();
    __swift_project_value_buffer(v35, (uint64_t)qword_2684879E0);
    id v36 = v3;
    id v37 = v34;
    id v38 = v36;
    id v39 = v34;
    uint64_t v40 = sub_22BE925C8();
    os_log_type_t v41 = sub_22BE93158();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      unint64_t v79 = swift_slowAlloc();
      unint64_t v81 = v79;
      *(_DWORD *)uint64_t v42 = 138412802;
      id v44 = v38;
      sub_22BE93408();
      *uint64_t v43 = v38;

      *(_WORD *)(v42 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v45 = sub_22BE93988();
      sub_22BDD8478(v45, v46, (uint64_t *)&v81);
      sub_22BE93408();
      swift_bridgeObjectRelease();

      *(_WORD *)(v42 + 22) = 2080;
      sub_22BDD8478(0xD000000000000023, 0x800000022BEA5330, (uint64_t *)&v81);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v40, v41, "error determining owningApp of %@ - claimBindings loading error: %s - %s", (uint8_t *)v42, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v43, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v79, -1, -1);
      MEMORY[0x230F57540](v42, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v7 = v5;
  sub_22BDD9D50(0, (unint64_t *)&qword_2684883C0);
  unint64_t v8 = sub_22BE92EB8();
  id v9 = v6;

  if (!(v8 >> 62))
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
    {
      dispatch_semaphore_t v78 = v3;
      char v11 = a2;
      unint64_t v81 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    if (qword_2684867F8 == -1) {
      goto LABEL_48;
    }
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  if (v62 <= 0) {
    goto LABEL_47;
  }
  unint64_t v81 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  uint64_t v63 = sub_22BE937E8();
  if (!v63)
  {
    swift_bridgeObjectRelease();
    unint64_t v17 = MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v10 = v63;
  dispatch_semaphore_t v78 = v3;
  if (v63 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  char v11 = a2;
LABEL_5:
  for (uint64_t i = 0; i != v10; ++i)
  {
    if ((v8 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x230F56140](i, v8);
    }
    else {
      id v13 = *(id *)(v8 + 8 * i + 32);
    }
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_bundleRecord);
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();

    if (v16)
    {
      MEMORY[0x230F55950]();
      if (*(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22BE92EF8();
      }
      sub_22BE92F48();
      sub_22BE92ED8();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v17 = v81;
  a2 = v11;
  uint64_t v3 = v78;
LABEL_16:
  swift_bridgeObjectRelease();
  if (!(v17 >> 62))
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_18;
    }
LABEL_51:
    swift_bridgeObjectRelease();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v74 = sub_22BE925E8();
    __swift_project_value_buffer(v74, (uint64_t)qword_2684879E0);
    id v65 = v3;
    id v66 = sub_22BE925C8();
    os_log_type_t v67 = sub_22BE93158();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v69 = (void *)swift_slowAlloc();
      unint64_t v70 = swift_slowAlloc();
      unint64_t v81 = v70;
      *(_DWORD *)uint64_t v68 = 138412546;
      id v75 = v65;
      sub_22BE93408();
      *uint64_t v69 = v65;

      *(_WORD *)(v68 + 12) = 2080;
      sub_22BDD8478(0xD000000000000023, 0x800000022BEA5330, (uint64_t *)&v81);
      sub_22BE93408();
      id v72 = "error determining owningApp of %@ - claimBindings had no apps - %s";
      goto LABEL_55;
    }
LABEL_56:

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v73 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  if (!v73) {
    goto LABEL_51;
  }
LABEL_18:
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v18 = *(id *)(v17 + 32);
      goto LABEL_21;
    }
    __break(1u);
LABEL_61:
    swift_once();
LABEL_48:
    uint64_t v64 = sub_22BE925E8();
    __swift_project_value_buffer(v64, (uint64_t)qword_2684879E0);
    id v65 = v3;
    id v66 = sub_22BE925C8();
    os_log_type_t v67 = sub_22BE93158();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v69 = (void *)swift_slowAlloc();
      unint64_t v70 = swift_slowAlloc();
      unint64_t v81 = v70;
      *(_DWORD *)uint64_t v68 = 138412546;
      id v71 = v65;
      sub_22BE93408();
      *uint64_t v69 = v65;

      *(_WORD *)(v68 + 12) = 2080;
      sub_22BDD8478(0xD000000000000023, 0x800000022BEA5330, (uint64_t *)&v81);
      sub_22BE93408();
      id v72 = "error determining owningApp of %@ - claimBindings was empty - %s";
LABEL_55:
      _os_log_impl(&dword_22BDC5000, v66, v67, v72, (uint8_t *)v68, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v69, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v70, -1, -1);
      MEMORY[0x230F57540](v68, -1, -1);

      return 0;
    }
    goto LABEL_56;
  }
  id v18 = (id)MEMORY[0x230F56140](0, v17);
LABEL_21:
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  unsigned int v20 = objc_msgSend(v19, sel_supportsOpenInPlace);
  if ((a2 & 1) == 0)
  {
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_22BE925E8();
    __swift_project_value_buffer(v47, (uint64_t)qword_2684879E0);
    id v48 = v3;
    id v49 = v19;
    id v24 = v48;
    id v25 = v49;
    uint64_t v26 = sub_22BE925C8();
    os_log_type_t v27 = sub_22BE93138();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412546;
      unint64_t v81 = (unint64_t)v24;
      id v50 = v24;
      sub_22BE93408();
      *uint64_t v29 = v24;

      *(_WORD *)(v28 + 12) = 2112;
      unint64_t v81 = (unint64_t)v25;
      id v51 = v25;
      sub_22BE93408();
      v29[1] = v25;

      uint64_t v32 = "determined owningApp (requireOpenInPlace = false) of %@ to be %@";
      goto LABEL_36;
    }
LABEL_37:

    return v25;
  }
  if (!v20)
  {
    unint64_t v81 = 0;
    unint64_t v82 = 0xE000000000000000;
    sub_22BE93648();
    id v52 = objc_msgSend(v19, sel_description);
    sub_22BE92CD8();

    sub_22BE92D88();
    swift_bridgeObjectRelease();
    sub_22BE92D88();
    sub_22BE92D88();
    sub_22BE92D88();
    sub_22BE92D88();
    sub_22BE92D88();
    int64_t v54 = v81;
    unint64_t v53 = v82;
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_22BE925E8();
    __swift_project_value_buffer(v55, (uint64_t)qword_2684879E0);
    id v56 = v3;
    swift_bridgeObjectRetain();
    char v57 = sub_22BE925C8();
    os_log_type_t v58 = sub_22BE93158();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = swift_slowAlloc();
      log = v57;
      uint64_t v60 = (void *)swift_slowAlloc();
      unint64_t v80 = swift_slowAlloc();
      unint64_t v81 = v80;
      *(_DWORD *)uint64_t v59 = 138412802;
      id v61 = v56;
      sub_22BE93408();
      *uint64_t v60 = v56;

      *(_WORD *)(v59 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_22BDD8478(v54, v53, (uint64_t *)&v81);
      sub_22BE93408();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v59 + 22) = 2080;
      sub_22BDD8478(0xD000000000000023, 0x800000022BEA5330, (uint64_t *)&v81);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, log, v58, "error determining owningApp of %@ - owningApp %s - %s", (uint8_t *)v59, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v60, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v80, -1, -1);
      MEMORY[0x230F57540](v59, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_22BE925E8();
  __swift_project_value_buffer(v21, (uint64_t)qword_2684879E0);
  id v22 = v3;
  id v23 = v19;
  id v24 = v22;
  id v25 = v23;
  uint64_t v26 = sub_22BE925C8();
  os_log_type_t v27 = sub_22BE93138();
  if (!os_log_type_enabled(v26, v27)) {
    goto LABEL_37;
  }
  uint64_t v28 = swift_slowAlloc();
  uint64_t v29 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v28 = 138412546;
  unint64_t v81 = (unint64_t)v24;
  id v30 = v24;
  sub_22BE93408();
  *uint64_t v29 = v24;

  *(_WORD *)(v28 + 12) = 2112;
  unint64_t v81 = (unint64_t)v25;
  id v31 = v25;
  sub_22BE93408();
  v29[1] = v25;

  uint64_t v32 = "determined owningApp (requireOpenInPlace = true) of %@ to be %@";
LABEL_36:
  _os_log_impl(&dword_22BDC5000, v26, v27, v32, (uint8_t *)v28, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268486ED0);
  swift_arrayDestroy();
  MEMORY[0x230F57540](v29, -1, -1);
  MEMORY[0x230F57540](v28, -1, -1);

  return v25;
}

uint64_t sub_22BE76DE4()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (v4 + *(void *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v6 + v0;
  unint64_t v8 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v8 + 16, v5);
}

uint64_t sub_22BE76EE0(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  return sub_22BE704D0(a1, a2, *(void **)(v2 + 16), v2 + v6, *(unsigned __int8 *)(v2 + v7), *(void *)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 8), *(unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 16), *(void **)((v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 24), *(void *)(v2 + (((v7 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + (((v7 & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_22BE76FAC()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  unint64_t v7 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v6);
}

void sub_22BE770C0()
{
  uint64_t v1 = *(void *)(sub_22BE92198() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v2 + *(void *)(v1 + 64);
  sub_22BE7097C(*(void **)(v0 + 16), v0 + v2, *(void **)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(void *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(void **)(v0 + ((v3 + 39) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v0 + ((((v3 + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v3 + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_22BE77188()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

void *sub_22BE772B8(char a1)
{
  uint64_t v3 = *(void *)(sub_22BE92198() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_22BE718F4(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + v5 + 8), *(void **)(v1 + v6), *(void *)(v1 + v7), *(void *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 16), *(void **)(v1 + ((v7 + 39) & 0xFFFFFFFFFFFFFFF8)));
}

void *sub_22BE7739C(void *result)
{
  if ((unint64_t)result >= 2)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22BE773E0()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

void sub_22BE774D8(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_22BE72508(a1, a2, *(unsigned char *)(v2 + 16), v2 + v6, *(void **)(v2 + v7), *(void *)(v2 + v8), *(void *)(v2 + v9), *(void *)(v2 + v9 + 8), *(void *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 16), *(void (**)(void))(v2 + ((v9 + 47) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + ((v9 + 47) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t objectdestroy_2Tm_1()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((v4 + *(void *)(v2 + 64) + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

uint64_t sub_22BE776C8(NSObject *a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  unint64_t v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  return sub_22BE6EC48(a1, a2, v2 + v6, *(uint64_t (**)(void))(v2 + v8), *(void *)(v2 + v8 + 8), *(unsigned __int8 *)(v2 + v8 + 16), *(void *)(v2 + v9), *(void *)(v2 + v9 + 8), *(void *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2+ ((((((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22BE777B4()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (v4 + *(void *)(v2 + 64) + 31) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_22BE77878(int a1)
{
  uint64_t v3 = *(void *)(sub_22BE92198() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  unint64_t v6 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  int v7 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v8 = v1 + v4;
  uint64_t v9 = *(void *)(v1 + v6);
  unint64_t v10 = *(void *)(v1 + v6 + 8);
  char v11 = *(unsigned char *)(v1 + v6 + 16);
  uint64_t v12 = v1 + ((v5 + 31) & 0xFFFFFFFFFFFFFFF8);
  id v13 = *(uint64_t (**)(void))v12;
  uint64_t v14 = *(void *)(v12 + 8);

  return sub_22BE6DAA8(a1, v7, v8, v9, v10, v11, v13, v14);
}

uint64_t sub_22BE77930()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (((((((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

void sub_22BE77A4C(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_22BE6E7E0(a1, a2, v2 + v6, *(void *)(v2 + v7), *(void *)(v2 + v7 + 8), *(void **)(v2 + v8), *(NSObject **)(v2 + v9), *(void *)(v2 + v9 + 8), *(void *)(v2 + v10), *(void *)(v2 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + ((((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22BE77B4C()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void sub_22BE77C7C(void *a1)
{
  uint64_t v3 = *(void *)(sub_22BE92198() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_22BE6E3C0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void (**)(void))(v1 + 48), *(void *)(v1 + 56), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22BE77D4C()
{
  return objectdestroy_34Tm(MEMORY[0x263F8EEB0]);
}

uint64_t objectdestroy_34Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  return MEMORY[0x270FA0238](v1, 32, 7);
}

void sub_22BE77DAC()
{
  id v0 = (id)sub_22BE92078();
  DOCPresentAlertForError();
}

uint64_t sub_22BE77DF8()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  uint64_t v5 = (v3 + 32) & ~v3;
  unint64_t v6 = ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v5, v1);

  return MEMORY[0x270FA0238](v0, v6, v3 | 7);
}

uint64_t sub_22BE77ED8()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

void sub_22BE77FE0()
{
  uint64_t v1 = *(void *)(sub_22BE92198() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_22BE6D378(*(void *)(v0 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned char *)(v0 + 16), v0 + v2, *(void *)(v0 + v3), *(void *)(v0 + v3 + 8), *(void *)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v5), *(void **)(v0 + v6), *(void **)(v0 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22BE780FC(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_22BE92DB8();
  uint64_t v6 = a1;
  if (v5)
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    uint64_t v6 = a1;
    do
    {
      if ((v6 ^ a2) < 0x4000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      uint64_t v11 = sub_22BE933E8();
      uint64_t v13 = v12;
      uint64_t v6 = sub_22BE933D8();
      if (v7 == v11 && v8 == v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v9 = sub_22BE938C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v9 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_14:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v7 = sub_22BE92DB8();
      uint64_t v8 = v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  if ((v6 ^ a2) >= 0x4000)
  {
    sub_22BE933E8();
    sub_22BE933D8();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_22BE782E8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_22BE92DB8();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_22BE92DB8();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_22BE938C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_22BE92DB8();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_22BE92DB8();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22BE78450(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

id sub_22BE784B4()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  qword_268488490 = (uint64_t)result;
  return result;
}

uint64_t sub_22BE784E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  return MEMORY[0x230F57630](v1);
}

void (*sub_22BE78538(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x230F57630](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_22BE785C0;
}

void sub_22BE785C0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
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

uint64_t (*sub_22BE78654(void *a1))()
{
  *a1 = 1;
  return nullsub_1;
}

BOOL sub_22BE786C0()
{
  return *(void *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout) != 0;
}

uint64_t sub_22BE786D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684884A8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BE92338();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_22BE92D58();
  swift_bridgeObjectRelease();
  uint64_t v34 = v10;
  if (v14)
  {
    LOBYTE(v15) = 0;
  }
  else
  {
    uint64_t v15 = sub_22BDE142C(a1, a2, qword_26DF42590);
    swift_arrayDestroy();
  }
  uint64_t v16 = v3 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x230F57630](v16);
  if (result)
  {
    if ((v15 & 1) == 0)
    {
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t ObjectType = swift_getObjectType();
      unsigned int v20 = *(uint64_t (**)(uint64_t))(v18 + 8);
      uint64_t v33 = ObjectType;
      if (v20(v3))
      {
        uint64_t v32 = v18;
        char v21 = sub_22BDE142C(a1, a2, qword_26DF425C0);
        swift_arrayDestroy();
        if ((v21 & 1) == 0)
        {
          swift_beginAccess();
          sub_22BE92D88();
          swift_endAccess();
          uint64_t v40 = 0;
          memset(v39, 0, sizeof(v39));
          uint64_t v22 = *v13;
          uint64_t v23 = v13[1];
          swift_bridgeObjectRetain();
          sub_22BE79018(v22, v23, (uint64_t)v39, (uint64_t)v8);
          swift_bridgeObjectRelease();
          uint64_t v24 = v34;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v8, 1, v9) == 1)
          {
            sub_22BE035C8((uint64_t)v8, &qword_2684884A8);
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v12, v8, v9);
            uint64_t result = sub_22BE79B90((uint64_t)v39, (uint64_t)aBlock);
            if (!v36)
            {
              __break(1u);
              return result;
            }
            (*(void (**)(uint64_t, void *, char *, uint64_t))(v32 + 32))(v3, aBlock, v12, v33);
            (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v9);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
          }
          uint64_t v25 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout;
          objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout), sel_invalidate);
          uint64_t v26 = self;
          uint64_t v27 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v37 = sub_22BE79B88;
          uint64_t v38 = v27;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_22BE2A864;
          id v36 = &block_descriptor_23;
          uint64_t v28 = _Block_copy(aBlock);
          swift_release();
          id v29 = objc_msgSend(v26, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v28, 0.5);
          _Block_release(v28);
          id v30 = *(void **)(v3 + v25);
          *(void *)(v3 + v25) = v29;
          swift_unknownObjectRelease();

          return sub_22BE035C8((uint64_t)v39, &qword_2684884B8);
        }
      }
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_22BE78C24(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    if ((objc_msgSend(v3, sel_modifierFlags) & 0x80000) != 0
      || (objc_msgSend(v3, sel_modifierFlags) & 0x40000) != 0)
    {
    }
    else
    {
      unsigned int v4 = objc_msgSend(v3, sel_modifierFlags);

      if ((v4 & 0x100000) == 0) {
        return;
      }
    }
    *(unsigned char *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) = 1;
  }
}

void sub_22BE78CA4(uint64_t a1, void *a2)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_22BE93568() != 1) {
      return;
    }
  }
  else if (*(void *)(a1 + 16) != 1)
  {
    return;
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  id v17 = (id)sub_22BDFCE60(v4);
  swift_bridgeObjectRelease();
  if (v17)
  {
    id v5 = objc_msgSend(v17, sel_key);
    if (v5)
    {
      id v15 = v5;
      if (!a2)
      {

        uint64_t v9 = v15;
LABEL_24:

        return;
      }
      id v16 = a2;
      id v6 = objc_msgSend(v16, sel_allPresses);
      sub_22BDFF9F0();
      sub_22BE79CD0();
      uint64_t v7 = sub_22BE93048();

      if ((v7 & 0xC000000000000001) != 0) {
        uint64_t v8 = sub_22BE93568();
      }
      else {
        uint64_t v8 = *(void *)(v7 + 16);
      }
      swift_bridgeObjectRelease();
      if ((objc_msgSend(v16, sel_modifierFlags) & 0x80000) != 0
        || (objc_msgSend(v16, sel_modifierFlags) & 0x40000) != 0
        || (objc_msgSend(v16, sel_modifierFlags) & 0x100000) != 0
        || (sub_22BE78450((uint64_t)objc_msgSend(v17, sel_type), (uint64_t)&unk_26DF425F0) & 1) != 0)
      {

        uint64_t v9 = v16;
        goto LABEL_24;
      }
      if (v8 == 1)
      {
        uint64_t v10 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey;
        if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) & 1) == 0)
        {
          id v11 = objc_msgSend(v15, sel_characters);
          uint64_t v12 = sub_22BE92CD8();
          uint64_t v14 = v13;

          sub_22BE786D8(v12, v14);
          swift_bridgeObjectRelease();
        }

        *(unsigned char *)(v2 + v10) = 0;
        return;
      }
    }
    uint64_t v9 = v17;
    goto LABEL_24;
  }
}

void sub_22BE78EF0()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) = 0;
}

void sub_22BE78F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x230F57630](v2);
  if (v3)
  {
    uint64_t v4 = (char *)v3;
    id v5 = (void *)(v3 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
    swift_beginAccess();
    *id v5 = 0;
    v5[1] = 0xE000000000000000;
    swift_bridgeObjectRelease();
    id v6 = *(void **)&v4[OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout];
    *(void *)&v4[OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout] = 0;
  }
}

uint64_t sub_22BE79018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v79 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268487868);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684884A8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v5 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x230F57630](v15);
  if (v16)
  {
    uint64_t v17 = v16;
    dispatch_semaphore_t v78 = v14;
    uint64_t v18 = *(void *)(v15 + 8);
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_22BE99770;
    *(void *)(v19 + 56) = MEMORY[0x263F8D310];
    *(void *)(v19 + 64) = sub_22BDF8220();
    *(void *)(v19 + 32) = a1;
    *(void *)(v19 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_22BE92588();
    swift_bridgeObjectRelease();
    uint64_t v20 = a2;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v5, ObjectType, v18);
    if (!a1 && v20 == 0xE000000000000000 || (sub_22BE938C8() & 1) != 0)
    {
      uint64_t v23 = sub_22BE92338();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a4, 1, 1, v23);
      swift_unknownObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v74 = a4;
    uint64_t v76 = v20;
    uint64_t v25 = sub_22BE92D58();
    uint64_t v77 = v22;
    uint64_t v73 = v5;
    uint64_t v75 = v18;
    uint64_t v72 = ObjectType;
    if (v25)
    {
      uint64_t v91 = a1;
      uint64_t v92 = v76;
      id v82 = self;
      id v26 = objc_msgSend(v82, sel_currentLocale);
      sub_22BE922B8();

      uint64_t v27 = sub_22BE922D8();
      uint64_t v28 = *(void *)(v27 - 8);
      unint64_t v81 = *(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56);
      uint64_t v80 = v28 + 56;
      v81(v11, 0, 1, v27);
      sub_22BE0F59C();
      sub_22BE934A8();
      sub_22BE035C8((uint64_t)v11, &qword_268487868);
      uint64_t v29 = *(void *)(v22 + 16);
      if (v29)
      {
        uint64_t v70 = a1;
        uint64_t v71 = v17;
        uint64_t v30 = v22 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_22BDD20C4(v30, (uint64_t)&v85);
          uint64_t v31 = v86;
          uint64_t v32 = v87;
          __swift_project_boxed_opaque_existential_0(&v85, v86);
          uint64_t v83 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
          uint64_t v84 = v33;
          id v34 = objc_msgSend(v82, sel_currentLocale);
          sub_22BE922B8();

          v81(v11, 0, 1, v27);
          sub_22BE934A8();
          sub_22BE035C8((uint64_t)v11, &qword_268487868);
          swift_bridgeObjectRelease();
          LOBYTE(v34) = sub_22BE782E8();
          swift_bridgeObjectRelease();
          if (v34) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v85);
          v30 += 40;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            uint64_t v17 = v71;
            a1 = v70;
            goto LABEL_15;
          }
        }
        swift_bridgeObjectRelease();
        sub_22BDE1DD4(&v85, (uint64_t)&v88);
        swift_bridgeObjectRelease();
        uint64_t v17 = v71;
        a1 = v70;
      }
      else
      {
LABEL_15:
        uint64_t v90 = 0;
        long long v88 = 0u;
        long long v89 = 0u;
        swift_bridgeObjectRelease();
      }
      uint64_t v5 = v73;
      uint64_t v35 = v79;
      uint64_t v36 = v75;
      uint64_t v37 = v72;
      if (*((void *)&v89 + 1))
      {
        sub_22BE035C8(v79, &qword_2684884B8);
        sub_22BDE1DD4(&v88, (uint64_t)&v91);
        sub_22BDD20C4((uint64_t)&v91, v35);
        uint64_t v38 = (uint64_t)v78;
        (*(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v36 + 24))(v5, &v91, v37, v36);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v91);
        uint64_t v39 = sub_22BE92338();
        uint64_t v40 = *(void *)(v39 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) != 1)
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v41 = v74;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v74, v38, v39);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v41, 0, 1, v39);
        }
LABEL_22:
        sub_22BE035C8(v38, &qword_2684884A8);
        uint64_t v43 = a1;
        uint64_t v44 = v76;
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_22BE7A148(1, v43, v44, v45);
        uint64_t v48 = v47;
        uint64_t v50 = v49;
        uint64_t v52 = v51;
        swift_bridgeObjectRelease();
        uint64_t v53 = MEMORY[0x230F557E0](v46, v48, v50, v52);
        uint64_t v55 = v54;
        swift_bridgeObjectRelease();
        if (sub_22BE92D58())
        {
          uint64_t v71 = v17;
          uint64_t v91 = v53;
          uint64_t v92 = (uint64_t)v55;
          dispatch_semaphore_t v78 = v55;
          id v82 = self;
          id v56 = objc_msgSend(v82, sel_currentLocale);
          sub_22BE922B8();

          uint64_t v57 = sub_22BE922D8();
          uint64_t v58 = *(void *)(v57 - 8);
          unint64_t v81 = *(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56);
          uint64_t v80 = v58 + 56;
          v81(v11, 0, 1, v57);
          sub_22BE0F59C();
          sub_22BE934A8();
          sub_22BE035C8((uint64_t)v11, &qword_268487868);
          uint64_t v59 = *(void *)(v77 + 16);
          if (v59)
          {
            uint64_t v60 = v77 + 32;
            swift_bridgeObjectRetain();
            while (1)
            {
              sub_22BDD20C4(v60, (uint64_t)&v85);
              uint64_t v62 = v86;
              uint64_t v61 = v87;
              __swift_project_boxed_opaque_existential_0(&v85, v86);
              uint64_t v83 = (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8))(v62, v61);
              uint64_t v84 = v63;
              id v64 = objc_msgSend(v82, sel_currentLocale);
              sub_22BE922B8();

              v81(v11, 0, 1, v57);
              sub_22BE934A8();
              sub_22BE035C8((uint64_t)v11, &qword_268487868);
              swift_bridgeObjectRelease();
              LOBYTE(v61) = sub_22BE782E8();
              swift_bridgeObjectRelease();
              if (v61) {
                break;
              }
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v85);
              v60 += 40;
              if (!--v59)
              {
                swift_bridgeObjectRelease();
                uint64_t v5 = v73;
                goto LABEL_28;
              }
            }
            swift_bridgeObjectRelease();
            sub_22BDE1DD4(&v85, (uint64_t)&v88);
            swift_bridgeObjectRelease();
            uint64_t v5 = v73;
          }
          else
          {
LABEL_28:
            uint64_t v90 = 0;
            long long v88 = 0u;
            long long v89 = 0u;
            swift_bridgeObjectRelease();
          }
          uint64_t v66 = v74;
          uint64_t v67 = v79;
          uint64_t v68 = v75;
          if (*((void *)&v89 + 1))
          {
            sub_22BE035C8(v79, &qword_2684884B8);
            sub_22BDE1DD4(&v88, (uint64_t)&v91);
            sub_22BDD20C4((uint64_t)&v91, v67);
            (*(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v68 + 24))(v5, &v91, v72, v68);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v91);
          }
          else
          {
            sub_22BE035C8((uint64_t)&v88, &qword_2684884B8);
            uint64_t v69 = sub_22BE92338();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v66, 1, 1, v69);
          }
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v65 = sub_22BE92338();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v74, 1, 1, v65);
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        return swift_bridgeObjectRelease();
      }
      sub_22BE035C8((uint64_t)&v88, &qword_2684884B8);
    }
    uint64_t v42 = sub_22BE92338();
    uint64_t v38 = (uint64_t)v78;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v78, 1, 1, v42);
    goto LABEL_22;
  }
  uint64_t result = sub_22BE93778();
  __break(1u);
  return result;
}

uint64_t sub_22BE79B50()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22BE79B88(uint64_t a1)
{
  sub_22BE78F00(a1, v1);
}

uint64_t sub_22BE79B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684884B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id DOCTypeToFocusController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DOCTypeToFocusController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DOCTypeToFocusController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22BE79CD0()
{
  unint64_t result = qword_2684884D0;
  if (!qword_2684884D0)
  {
    sub_22BDFF9F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684884D0);
  }
  return result;
}

uint64_t sub_22BE79D28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x230F57630](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_22BE79D84(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

void sub_22BE79DE8(void *a1@<X8>)
{
  *a1 = 1;
}

uint64_t dispatch thunk of DOCTypeToFocusItem.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DOCTypeToFocusControllerDelegate.canPerformTypeToFocus(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DOCTypeToFocusControllerDelegate.items(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DOCTypeToFocusControllerDelegate.typeToFocusController(_:indexPathFor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of DOCTypeToFocusControllerDelegate.typeToFocusController(_:focusItem:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t method lookup function for DOCTypeToFocusController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCTypeToFocusController);
}

uint64_t dispatch thunk of DOCTypeToFocusController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.autocorrectionType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.autocorrectionType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.autocorrectionType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.hasText.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.isTyping.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.insertText(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.deleteBackward()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.handlePressesBegan(_:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.handlePressesChanged(_:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.handlePressesEnded(_:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of DOCTypeToFocusController.handlePressesCancelled(_:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t sub_22BE7A148(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v4 = a3;
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  a1 = sub_22BE92D58();
  if (__OFSUB__(a1, v6))
  {
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
  }
  uint64_t v7 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v7 = v5;
  }
  uint64_t v8 = v7 << 16;
  uint64_t v9 = sub_22BE92D68();
  uint64_t v11 = v8 | 0xB;
  if (((v4 >> 60) & ((v5 & 0x800000000000000) == 0)) == 0) {
    uint64_t v11 = v8 | 7;
  }
  if (v10) {
    a2 = v11;
  }
  else {
    a2 = v9;
  }
  a1 = 15;
  a3 = v5;
  a4 = v4;

  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_22BE7A214(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x230F56140](v7, a3);
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        sub_22BE91C58();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_22BE937E8();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v10 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t sub_22BE7A338()
{
  sub_22BE69F64(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_22BE7A370(uint64_t a1)
{
  uint64_t result = MEMORY[0x230F57630](v1 + 16);
  if (result)
  {
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t DOCAssertion.__allocating_init(traceInfo:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 32) = 1;
  *(void *)(result + 40) = MEMORY[0x263F8EE78];
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t DOCAssertion.init(traceInfo:)(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 32) = 1;
  *(void *)(v2 + 40) = MEMORY[0x263F8EE78];
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t DOCAssertion.deinit()
{
  if (*(unsigned char *)(v0 + 32) == 1) {
    sub_22BE7A4FC(0);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DOCAssertion.__deallocating_deinit()
{
  if (*(unsigned char *)(v0 + 32) == 1) {
    sub_22BE7A4FC(0);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_22BE7A4FC(uint64_t result)
{
  int v2 = *(unsigned __int8 *)(v1 + 32);
  *(unsigned char *)(v1 + 32) = result;
  if (v2 == 1 && (result & 1) == 0)
  {
    uint64_t v3 = v1;
    uint64_t v4 = (unint64_t *)(v1 + 40);
    swift_beginAccess();
    unint64_t v5 = *(void *)(v1 + 40);
    unint64_t v6 = MEMORY[0x263F8EE78];
    unint64_t v18 = MEMORY[0x263F8EE78];
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_22BE937E8();
      uint64_t v7 = result;
      if (result) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_5:
        if (v7 < 1)
        {
          __break(1u);
          goto LABEL_32;
        }
        for (uint64_t i = 0; i != v7; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0)
          {
            uint64_t v9 = MEMORY[0x230F56140](i, v5);
          }
          else
          {
            uint64_t v9 = *(void *)(v5 + 8 * i + 32);
            sub_22BE91C58();
          }
          uint64_t v10 = MEMORY[0x230F57630](v9 + 16);
          swift_unknownObjectRelease();
          if (v10)
          {
            sub_22BE936B8();
            sub_22BE936F8();
            sub_22BE93708();
            sub_22BE936C8();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v11 = v18;
LABEL_17:
        *uint64_t v4 = v11;
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = *v4;
        *uint64_t v4 = v6;
        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = sub_22BE937E8();
          uint64_t result = swift_bridgeObjectRelease();
          if (v13)
          {
LABEL_19:
            if (v13 >= 1)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if ((v12 & 0xC000000000000001) != 0)
                {
                  uint64_t v15 = MEMORY[0x230F56140](j, v12);
                }
                else
                {
                  uint64_t v15 = *(void *)(v12 + 8 * j + 32);
                  sub_22BE91C58();
                }
                if (MEMORY[0x230F57630](v15 + 16))
                {
                  uint64_t v16 = *(void *)(v15 + 24);
                  uint64_t ObjectType = swift_getObjectType();
                  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 8))(v3, ObjectType, v16);
                  swift_release();
                  swift_unknownObjectRelease();
                }
                else
                {
                  swift_release();
                }
              }
              return swift_bridgeObjectRelease();
            }
LABEL_32:
            __break(1u);
            return result;
          }
        }
        else
        {
          uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v13) {
            goto LABEL_19;
          }
        }
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v11 = MEMORY[0x263F8EE78];
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_22BE7A77C()
{
  return sub_22BE7A4FC(0);
}

void *DOCAssertionCollection.__allocating_init(debugName:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8EE78];
  result[5] = a1;
  result[6] = a2;
  result[2] = v9;
  result[3] = a3;
  result[4] = a4;
  return result;
}

uint64_t sub_22BE7A7E4(uint64_t a1, uint64_t a2, char a3)
{
  double v28 = *(double *)&a2;
  uint64_t v6 = sub_22BE92B08();
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BE92B58();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22BE92B78();
  uint64_t v29 = *(void *)(v12 - 8);
  uint64_t v30 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v28 - v16;
  sub_22BE7B8A4(v3, a1);
  swift_beginAccess();
  uint64_t v18 = sub_22BE91C58();
  MEMORY[0x230F55950](v18);
  if (*(void *)((*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_22BE92EF8();
  sub_22BE92F48();
  sub_22BE92ED8();
  uint64_t v19 = swift_endAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 24))(v19);
  if ((a3 & 1) == 0)
  {
    double v21 = v28;
    double v22 = v28;
    sub_22BDD27D0();
    uint64_t v23 = (void *)sub_22BE931E8();
    sub_22BE92B68();
    MEMORY[0x230F55660](v15, v22);
    uint64_t v29 = *(void *)(v29 + 8);
    uint64_t v24 = v15;
    uint64_t v25 = v30;
    ((void (*)(char *, uint64_t))v29)(v24, v30);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = a1;
    *(double *)(v26 + 24) = v21;
    aBlock[4] = sub_22BE7BB10;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BDD0BA8;
    void aBlock[3] = &block_descriptor_24;
    uint64_t v27 = _Block_copy(aBlock);
    sub_22BE91C58();
    swift_release();
    sub_22BE92B38();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22BE69870();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF002D0);
    sub_22BE048F8();
    sub_22BE934E8();
    MEMORY[0x230F55C80](v17, v11, v8, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    return ((uint64_t (*)(char *, uint64_t))v29)(v17, v25);
  }
  return result;
}

uint64_t sub_22BE7ABEC(uint64_t result)
{
  if (*(unsigned char *)(result + 32) == 1)
  {
    v6[0] = 0;
    v6[1] = 0xE000000000000000;
    sub_22BE93648();
    sub_22BE92D88();
    type metadata accessor for DOCAssertion();
    sub_22BE93758();
    sub_22BE92D88();
    sub_22BE93028();
    sub_22BE92D88();
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_22BE925E8();
    __swift_project_value_buffer(v1, (uint64_t)qword_2684879E0);
    swift_bridgeObjectRetain();
    int v2 = sub_22BE925C8();
    os_log_type_t v3 = sub_22BE93168();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      v6[0] = v5;
      *(_DWORD *)uint64_t v4 = 136315138;
      swift_bridgeObjectRetain();
      sub_22BDD8478(0, 0xE000000000000000, v6);
      sub_22BE93408();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22BDC5000, v2, v3, "WARNING: %s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v5, -1, -1);
      MEMORY[0x230F57540](v4, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return sub_22BE7A4FC(0);
  }
  return result;
}

uint64_t sub_22BE7AE74()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_22BE937E8();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = MEMORY[0x230F56140](i, v1);
    }
    else
    {
      uint64_t v6 = *(void *)(v1 + 8 * i + 32);
      sub_22BE91C58();
    }
    if (*(unsigned char *)(v6 + 32) == 1)
    {
      sub_22BE936B8();
      sub_22BE936F8();
      sub_22BE93708();
      sub_22BE936C8();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = v17;
  if (v17 < 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v7 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(v7 + 16);
    if (!v8)
    {
LABEL_28:
      swift_release();
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_29:
      sub_22BE93648();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_22BE92D88();
      swift_bridgeObjectRelease();
      sub_22BE92D88();
      MEMORY[0x230F55980](v10, MEMORY[0x263F8D310]);
      sub_22BE92D88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22BE92D88();
      return 0xD00000000000001ELL;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_22BE937E8();
  swift_release();
  if (!v8) {
    goto LABEL_28;
  }
LABEL_18:
  uint64_t result = sub_22BDFE2E8(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v2;
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        uint64_t v11 = MEMORY[0x230F56140](v9, v7);
      }
      else
      {
        uint64_t v11 = *(void *)(v7 + 8 * v9 + 32);
        sub_22BE91C58();
      }
      uint64_t v13 = *(void *)(v11 + 16);
      uint64_t v12 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      unint64_t v15 = *(void *)(v2 + 16);
      unint64_t v14 = *(void *)(v2 + 24);
      if (v15 >= v14 >> 1) {
        sub_22BDFE2E8(v14 > 1, v15 + 1, 1);
      }
      ++v9;
      *(void *)(v2 + 16) = v15 + 1;
      uint64_t v16 = v2 + 16 * v15;
      *(void *)(v16 + 32) = v13;
      *(void *)(v16 + 40) = v12;
    }
    while (v8 != v9);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_22BE7B1A4(uint64_t a1)
{
  sub_22BE7B658(v1, a1);
  swift_beginAccess();
  sub_22BE91C58();
  uint64_t v3 = sub_22BE7BD1C((uint64_t *)(v1 + 16), a1);
  uint64_t result = swift_release();
  unint64_t v5 = *(void *)(v1 + 16);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_22BE937E8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6 >= v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6 >= v3)
    {
LABEL_3:
      sub_22BE3B8B0(v3, v6);
      uint64_t v7 = swift_endAccess();
      return (*(uint64_t (**)(uint64_t))(v1 + 24))(v7);
    }
  }
  __break(1u);
  return result;
}

uint64_t DOCAssertionCollection.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22BE7B2CC()
{
  return sub_22BE7AE74();
}

uint64_t sub_22BE7B2F0(uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t v4 = (uint64_t *)v2;
  unint64_t v7 = *v2;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_22BE7A214(a1, a2, v7);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if (v3) {
    return v8;
  }
  if ((v10 & 1) == 0)
  {
    unint64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_54;
    }
    if ((unint64_t)*v4 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_22BE937E8();
      swift_bridgeObjectRelease();
      if (v11 != v26) {
        goto LABEL_6;
      }
    }
    else if (v11 != *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      unint64_t v11 = v8 + 5;
      uint64_t v28 = a2;
      while (1)
      {
        unint64_t v12 = v11 - 4;
        uint64_t v13 = *v4;
        if ((*v4 & 0xC000000000000001) != 0)
        {
          uint64_t v14 = MEMORY[0x230F56140](v11 - 4);
        }
        else
        {
          if ((v12 & 0x8000000000000000) != 0)
          {
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
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v12 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_45;
          }
          uint64_t v14 = *(void *)(v13 + 8 * v11);
          sub_22BE91C58();
        }
        uint64_t v29 = v14;
        char v15 = a1(&v29);
        swift_release();
        if ((v15 & 1) == 0) {
          break;
        }
LABEL_32:
        unint64_t v23 = v11 - 3;
        if (__OFADD__(v12, 1)) {
          goto LABEL_46;
        }
        if ((unint64_t)*v4 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_22BE937E8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v24 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v11;
        if (v23 == v24) {
          return v8;
        }
      }
      if (v12 == v8)
      {
LABEL_31:
        if (__OFADD__(v8++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      uint64_t v16 = *v4;
      if ((*v4 & 0xC000000000000001) != 0)
      {
        uint64_t v17 = MEMORY[0x230F56140](v8, *v4);
        uint64_t v16 = *v4;
        if ((*v4 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v12 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v18 = *(void *)(v16 + 8 * v11);
          sub_22BE91C58();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v8 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v17 = *(void *)(v16 + 8 * v8 + 32);
        sub_22BE91C58();
        if ((v16 & 0xC000000000000001) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v18 = MEMORY[0x230F56140](v11 - 4, v16);
      uint64_t v16 = *v4;
LABEL_20:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v4 = v16;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v16 < 0 || (v16 & 0x4000000000000000) != 0)
      {
        uint64_t v16 = sub_22BE4585C(v16);
        *uint64_t v4 = v16;
      }
      *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v18;
      swift_release();
      sub_22BE92ED8();
      uint64_t v20 = *v4;
      int v21 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v4 = v20;
      if (!v21 || v20 < 0 || (v20 & 0x4000000000000000) != 0)
      {
        uint64_t v20 = sub_22BE4585C(v20);
        *uint64_t v4 = v20;
      }
      a2 = v28;
      if ((v12 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v12 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v11) = v17;
      swift_release();
      sub_22BE92ED8();
      goto LABEL_31;
    }
    return v8;
  }
  if (!((unint64_t)*v4 >> 62)) {
    return *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_22BE7B658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a2 + 40);
  swift_beginAccess();
  unint64_t v5 = *(void *)(a2 + 40);
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_22BE937E8();
    uint64_t v6 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_14;
  }
LABEL_3:
  if (v6 < 1) {
    goto LABEL_20;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
    {
      uint64_t v9 = MEMORY[0x230F56140](i, v5);
    }
    else
    {
      uint64_t v9 = *(void *)(v5 + 8 * i + 32);
      sub_22BE91C58();
    }
    uint64_t v10 = MEMORY[0x230F57630](v9 + 16);
    swift_unknownObjectRelease();
    if (v10)
    {
      sub_22BE936B8();
      sub_22BE936F8();
      sub_22BE93708();
      sub_22BE936C8();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v16;
LABEL_15:
  *uint64_t v4 = v11;
  uint64_t v12 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v12);
  v15[2] = a1;
  v15[3] = &off_26DF48670;
  swift_beginAccess();
  uint64_t result = sub_22BE7B2F0(sub_22BE7C038, (uint64_t)v15);
  uint64_t v13 = result;
  if (*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_22BE937E8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v14 >= v13) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14 >= result)
    {
LABEL_17:
      sub_22BE3B894(v13, v14);
      return swift_endAccess();
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_22BE7B8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 40);
  swift_beginAccess();
  unint64_t v4 = *(void *)(a2 + 40);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_22BE937E8();
    uint64_t v5 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_14;
  }
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v5; ++i)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = MEMORY[0x230F56140](i, v4);
    }
    else
    {
      uint64_t v8 = *(void *)(v4 + 8 * i + 32);
      sub_22BE91C58();
    }
    uint64_t v9 = MEMORY[0x230F57630](v8 + 16);
    swift_unknownObjectRelease();
    if (v9)
    {
      sub_22BE936B8();
      sub_22BE936F8();
      sub_22BE93708();
      sub_22BE936C8();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = v13;
LABEL_15:
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  type metadata accessor for DOCAssertion.DOCWeakAssertionObserver();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v11 + 24) = &off_26DF48670;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  uint64_t v12 = sub_22BE91C58();
  MEMORY[0x230F55950](v12);
  if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_22BE92EF8();
  }
  sub_22BE92F48();
  sub_22BE92ED8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_22BE7BAD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BE7BB10()
{
  return sub_22BE7ABEC(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for DOCAssertion()
{
  return self;
}

uint64_t method lookup function for DOCAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCAssertion);
}

uint64_t dispatch thunk of DOCAssertion.__allocating_init(traceInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of DOCAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t type metadata accessor for DOCAssertion.DOCWeakAssertionObserver()
{
  return self;
}

uint64_t method lookup function for DOCAssertionCollection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCAssertionCollection);
}

uint64_t dispatch thunk of DOCAssertionCollection.__allocating_init(debugName:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of DOCAssertionCollection.add(_:autoInvalidationTimeout:)(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 136))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of DOCAssertionCollection.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_22BE7BC2C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x230F56140](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }
      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1)) {
        break;
      }
      if (++v5 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22BE937E8();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_22BE7BD1C(uint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_22BE7BC2C(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if ((unint64_t)*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_22BE937E8();
      swift_bridgeObjectRelease();
      if (v9 != v22) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        uint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000) != 0)
        {
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
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        uint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if ((unint64_t)*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_22BE937E8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v18 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v18) {
          return v6;
        }
      }
      uint64_t v19 = MEMORY[0x230F56140](i - 4);
      swift_unknownObjectRelease();
      if (v19 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }
      uint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = MEMORY[0x230F56140](v6, *a1);
        uint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v14 = *(void *)(v9 + 8 * i);
          sub_22BE91C58();
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v13 = *(void *)(v9 + 8 * v6 + 32);
        sub_22BE91C58();
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_16;
        }
      }
      uint64_t v14 = MEMORY[0x230F56140](i - 4, v9);
      uint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v9 < 0 || (v9 & 0x4000000000000000) != 0)
      {
        uint64_t v9 = sub_22BE4585C(v9);
        *a1 = v9;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;
      swift_release();
      sub_22BE92ED8();
      uint64_t v9 = *a1;
      int v16 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v16 || v9 < 0 || (v9 & 0x4000000000000000) != 0)
      {
        uint64_t v9 = sub_22BE4585C(v9);
        *a1 = v9;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v13;
      swift_release();
      sub_22BE92ED8();
      goto LABEL_30;
    }
    return v6;
  }
  unint64_t v20 = *a1;
  if (!(v20 >> 62)) {
    return *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_22BE7C038(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t result = MEMORY[0x230F57630](*a1 + 16);
  if (result)
  {
    uint64_t v4 = result;
    swift_unknownObjectRelease();
    return v4 == v2;
  }
  return result;
}

uint64_t sub_22BE7C088(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x736F64736DLL;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x736F64736DLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x7461667865;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7562856;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1936093281;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 0x7461667865) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 7562856;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1936093281) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_22BE938C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22BE7C1E0(char a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x800000022BE9F020;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x800000022BE9F050;
    }
    else {
      unint64_t v3 = 0x800000022BE9F080;
    }
    unint64_t v4 = 0xD000000000000029;
    int v5 = a2;
    if (a2)
    {
LABEL_6:
      if (v5 == 1) {
        unint64_t v2 = 0x800000022BE9F050;
      }
      else {
        unint64_t v2 = 0x800000022BE9F080;
      }
      if (v4 != 0xD000000000000029) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000025;
    unint64_t v3 = 0x800000022BE9F020;
    int v5 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  if (v4 != 0xD000000000000025)
  {
LABEL_15:
    char v6 = sub_22BE938C8();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v2) {
    goto LABEL_15;
  }
  char v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_22BE7C2DC(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000020;
  unint64_t v4 = 0x800000022BE9EE30;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x800000022BE9EE60;
      unint64_t v3 = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t v3 = 0xD000000000000024;
      int v5 = "com.apple.DocumentManager.dragFolder";
      goto LABEL_5;
    case 3:
      unint64_t v3 = 0xD00000000000001FLL;
      int v5 = "com.apple.DocumentsApp.location";
LABEL_5:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000020;
  unint64_t v7 = 0x800000022BE9EE30;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x800000022BE9EE60;
      unint64_t v6 = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t v6 = 0xD000000000000024;
      char v8 = "com.apple.DocumentManager.dragFolder";
      goto LABEL_10;
    case 3:
      unint64_t v6 = 0xD00000000000001FLL;
      char v8 = "com.apple.DocumentsApp.location";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_22BE938C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_22BE7C48C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E6F697461636F6CLL;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E6F697461636F6CLL;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1851876211;
      break;
    case 2:
      uint64_t v5 = 0x656D616E656C6966;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6C6165766572;
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1852141679;
      break;
    case 5:
      uint64_t v5 = 0x746E6F63776F6873;
      unint64_t v3 = 0xEC00000073746E65;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1851876211) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xE900000000000073;
      if (v5 != 0x656D616E656C6966) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6C6165766572) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1852141679;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xEC00000073746E65;
      if (v5 != 0x746E6F63776F6873) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_22BE938C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22BE7C688(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6F64646572616873;
    }
    else {
      uint64_t v3 = 6450547;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEF73746E656D7563;
    }
    else {
      unint64_t v4 = 0xE300000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6F64646572616873;
      }
      else {
        uint64_t v6 = 6450547;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEF73746E656D7563;
      }
      else {
        unint64_t v7 = 0xE300000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1701603686;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1701603686)
  {
LABEL_21:
    char v8 = sub_22BE938C8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22BE7C79C(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 2003789939;
    }
    else {
      uint64_t v2 = 1701079400;
    }
    unint64_t v3 = 0xE400000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 2003789939;
      }
      else {
        uint64_t v5 = 1701079400;
      }
      unint64_t v6 = 0xE400000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE600000000000000;
    uint64_t v2 = 0x656C67676F74;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE600000000000000;
  if (v2 != 0x656C67676F74)
  {
LABEL_15:
    char v7 = sub_22BE938C8();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22BE7C890(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6574707972636E65;
    }
    else {
      uint64_t v3 = 0x736E655365736163;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE900000000000064;
    }
    else {
      unint64_t v4 = 0xED00006576697469;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6574707972636E65;
      }
      else {
        uint64_t v6 = 0x736E655365736163;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE900000000000064;
      }
      else {
        unint64_t v7 = 0xED00006576697469;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1701736302;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1701736302)
  {
LABEL_21:
    char v8 = sub_22BE938C8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22BE7C9EC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701736302;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1701736302;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 1684957547;
      break;
    case 2:
      uint64_t v5 = 1702125924;
      break;
    case 3:
      uint64_t v5 = 1702521203;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7942646572616873;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 1684957547) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 1702125924) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 1702521203;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7942646572616873) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_22BE938C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22BE7CB60(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1819044198;
  }
  else {
    uint64_t v3 = 0x656B6F727473;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1819044198;
  }
  else {
    uint64_t v5 = 0x656B6F727473;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22BE938C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22BE7CBFC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x7261646E6F636573;
    }
    else {
      uint64_t v3 = 0x7972616974726574;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE900000000000079;
    }
    else {
      unint64_t v4 = 0xE800000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x7261646E6F636573;
      }
      else {
        uint64_t v6 = 0x7972616974726574;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE900000000000079;
      }
      else {
        unint64_t v7 = 0xE800000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x7972616D697270;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x7972616D697270)
  {
LABEL_21:
    char v8 = sub_22BE938C8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

DocumentManagerExecutables::DOCItemSortMode_optional __swiftcall DOCItemSortMode.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_22BE93858();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

uint64_t DOCItemSortMode.DisplayableMode.compatibleSortModes.getter()
{
  uint64_t v1 = qword_26DF42658;
  if (qword_26DF42658)
  {
    uint64_t v2 = *v0;
    uint64_t v3 = MEMORY[0x263F8EE78];
    unint64_t v4 = &byte_26DF42668;
    while (2)
    {
      int v8 = *v4++;
      char v7 = v8;
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1702125924;
      switch(v8)
      {
        case 2:
          uint64_t v10 = 1701667182;
          break;
        case 3:
          uint64_t v10 = 1936154996;
          break;
        case 4:
          uint64_t v10 = 1702521203;
          break;
        case 5:
          uint64_t v10 = 1684957547;
          break;
        case 6:
          unint64_t v9 = 0xE800000000000000;
          uint64_t v10 = 0x7942646572616873;
          break;
        default:
          break;
      }
      unint64_t v11 = 0xE400000000000000;
      uint64_t v12 = 1702125924;
      switch(v2)
      {
        case 1:
          if (v10 == 1701667182) {
            goto LABEL_22;
          }
          goto LABEL_25;
        case 2:
          if (v10 != 1936154996) {
            goto LABEL_25;
          }
          goto LABEL_22;
        case 3:
          if (v10 != 1702521203) {
            goto LABEL_25;
          }
          goto LABEL_22;
        case 4:
          uint64_t v12 = 1684957547;
          goto LABEL_21;
        case 5:
          unint64_t v11 = 0xE800000000000000;
          if (v10 != 0x7942646572616873) {
            goto LABEL_25;
          }
          goto LABEL_22;
        default:
LABEL_21:
          if (v10 != v12) {
            goto LABEL_25;
          }
LABEL_22:
          if (v9 == v11)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
LABEL_25:
            char v13 = sub_22BE938C8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v13 & 1) == 0) {
              goto LABEL_6;
            }
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_22BDFE3B0(0, *(void *)(v3 + 16) + 1, 1);
          }
          unint64_t v6 = *(void *)(v3 + 16);
          unint64_t v5 = *(void *)(v3 + 24);
          if (v6 >= v5 >> 1) {
            sub_22BDFE3B0(v5 > 1, v6 + 1, 1);
          }
          *(void *)(v3 + 16) = v6 + 1;
          *(unsigned char *)(v3 + v6 + 32) = v7;
LABEL_6:
          if (--v1) {
            continue;
          }
          return v3;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

void *static DOCItemSortMode.allCases.getter()
{
  return &unk_26DF42648;
}

DocumentManagerExecutables::DOCItemSortMode::DisplayableMode_optional __swiftcall DOCItemSortMode.DisplayableMode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_22BE93858();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t DOCItemSortMode.DisplayableMode.rawValue.getter()
{
  uint64_t result = 1702125924;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 1936154996;
      break;
    case 3:
      uint64_t result = 1702521203;
      break;
    case 4:
      uint64_t result = 1684957547;
      break;
    case 5:
      uint64_t result = 0x7942646572616873;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22BE7D124()
{
  return sub_22BE87094();
}

uint64_t sub_22BE7D12C()
{
  sub_22BE92D48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE7D1F0()
{
  return sub_22BE87214();
}

DocumentManagerExecutables::DOCItemSortMode::DisplayableMode_optional sub_22BE7D1F8(Swift::String *a1)
{
  return DOCItemSortMode.DisplayableMode.init(rawValue:)(*a1);
}

void sub_22BE7D204(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1702125924;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 1701667182;
      goto LABEL_3;
    case 2:
      *a1 = 1936154996;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 1702521203;
      a1[1] = 0xE400000000000000;
      break;
    case 4:
      *a1 = 1684957547;
      a1[1] = 0xE400000000000000;
      break;
    case 5:
      *a1 = 0x7942646572616873;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE400000000000000;
      break;
  }
}

uint64_t sub_22BE7D2C4()
{
  return sub_22BE872EC();
}

uint64_t sub_22BE7D2D0()
{
  return sub_22BE80844();
}

uint64_t sub_22BE7D2D8()
{
  return sub_22BE872EC();
}

DocumentManagerExecutables::DOCItemSortMode_optional sub_22BE7D2E0(Swift::String *a1)
{
  return DOCItemSortMode.init(rawValue:)(*a1);
}

void sub_22BE7D2EC(void *a1@<X8>)
{
  *a1 = &unk_26DF42648;
}

void DOCItemSortMode.id.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DOCItemSortDescriptor.isReversed.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

void DOCItemSortDescriptor.reversedSortDesciptors.getter(uint64_t a1@<X8>)
{
  unsigned __int8 v2 = v1[24];
  unsigned __int8 v3 = *v1;
  DOCItemSortDescriptor.init(type:isReversed:)(&v3, (v2 & 1) == 0, a1);
}

uint64_t static DOCItemSortDescriptor.== infix(_:_:)(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = a1[24];
  int v3 = *(unsigned __int8 *)(a2 + 24);
  return sub_22BDD3ED4(*a1, *(unsigned char *)a2) & ~(v2 ^ v3) & 1;
}

uint64_t static DOCItemSortDescriptor.equalIgnoringSortOption(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2) {
      return 1;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    while (1)
    {
      unint64_t v6 = 0x800000022BE9EDF0;
      unint64_t v7 = 0xD000000000000010;
      switch(*(unsigned char *)(a1 + v4 + 32))
      {
        case 1:
          unint64_t v7 = 0x646573557473616CLL;
          unint64_t v6 = 0xEC00000065746144;
          break;
        case 2:
          unint64_t v6 = 0xE400000000000000;
          unint64_t v7 = 1701667182;
          break;
        case 3:
          unint64_t v6 = 0xE400000000000000;
          unint64_t v7 = 1936154996;
          break;
        case 4:
          unint64_t v6 = 0xE400000000000000;
          unint64_t v7 = 1702521203;
          break;
        case 5:
          unint64_t v6 = 0xE400000000000000;
          unint64_t v7 = 1684957547;
          break;
        case 6:
          unint64_t v6 = 0xE800000000000000;
          unint64_t v7 = 0x7942646572616873;
          break;
        default:
          break;
      }
      unint64_t v8 = 0x800000022BE9EDF0;
      unint64_t v9 = 0xD000000000000010;
      switch(*(unsigned char *)(a2 + v4 + 32))
      {
        case 1:
          unint64_t v8 = 0xEC00000065746144;
          if (v7 == 0x646573557473616CLL) {
            goto LABEL_24;
          }
          goto LABEL_4;
        case 2:
          unint64_t v8 = 0xE400000000000000;
          if (v7 != 1701667182) {
            goto LABEL_4;
          }
          goto LABEL_24;
        case 3:
          unint64_t v8 = 0xE400000000000000;
          if (v7 != 1936154996) {
            goto LABEL_4;
          }
          goto LABEL_24;
        case 4:
          unint64_t v8 = 0xE400000000000000;
          if (v7 != 1702521203) {
            goto LABEL_4;
          }
          goto LABEL_24;
        case 5:
          unint64_t v8 = 0xE400000000000000;
          unint64_t v9 = 1684957547;
          goto LABEL_23;
        case 6:
          unint64_t v8 = 0xE800000000000000;
          if (v7 != 0x7942646572616873) {
            goto LABEL_4;
          }
          goto LABEL_24;
        default:
LABEL_23:
          if (v7 != v9) {
            goto LABEL_4;
          }
LABEL_24:
          if (v6 == v8)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
          }
          else
          {
LABEL_4:
            char v5 = sub_22BE938C8();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v5 & 1) == 0)
            {
              uint64_t v10 = 0;
              goto LABEL_30;
            }
          }
          v4 += 32;
          if (!--v2)
          {
            uint64_t v10 = 1;
LABEL_30:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v10;
          }
          break;
      }
    }
  }
  return 0;
}

uint64_t sub_22BE7D6B0(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = a1[24];
  int v3 = *(unsigned __int8 *)(a2 + 24);
  return sub_22BDD3ED4(*a1, *(unsigned char *)a2) & ~(v2 ^ v3) & 1;
}

void *sub_22BE7D6EC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684885F0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_22BE7DC3C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22BE7D7FC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684885F8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_22BE7DB30(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22BE7D90C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486F50);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      id v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_22BE7DD28(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_22BE7DA34(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268486F20);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_22BE7E290(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22BE7DB30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684878B0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22BE93838();
  __break(1u);
  return result;
}

char *sub_22BE7DC3C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_22BE93838();
  __break(1u);
  return result;
}

uint64_t sub_22BE7DD28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22BE93838();
  __break(1u);
  return result;
}

char *sub_22BE7DE20(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_22BE93838();
  __break(1u);
  return result;
}

unint64_t sub_22BE7DF0C()
{
  unint64_t result = qword_2684885B8;
  if (!qword_2684885B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684885B8);
  }
  return result;
}

unint64_t sub_22BE7DF50()
{
  unint64_t result = qword_2684885C0;
  if (!qword_2684885C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684885C0);
  }
  return result;
}

unint64_t sub_22BE7DFA8()
{
  unint64_t result = qword_2684885C8;
  if (!qword_2684885C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684885C8);
  }
  return result;
}

unint64_t sub_22BE7E000()
{
  unint64_t result = qword_2684885D0;
  if (!qword_2684885D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684885D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684885D0);
  }
  return result;
}

unint64_t sub_22BE7E060()
{
  unint64_t result = qword_2684885E0;
  if (!qword_2684885E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684885E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCItemSortMode.DisplayableMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x22BE7E1A8);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t assignWithCopy for DOCItemSortDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for DOCItemSortDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

char *sub_22BE7E290(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unsigned int v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)sub_22BE93838();
  __break(1u);
  return result;
}

unint64_t sub_22BE7E378(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268486FA0);
    int v2 = (void *)sub_22BE93828();
  }
  else
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  unsigned int v6 = &v37;
  int64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  uint64_t v11 = MEMORY[0x263F8D310];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_22BE24EB8();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22BDDBF3C(v6, v7);
    sub_22BDDBF3C(v7, v40);
    sub_22BDDBF3C(v40, &v38);
    unint64_t result = sub_22BDD5734(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      char v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      unsigned int v6 = v13;
      int64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      unint64_t result = (unint64_t)sub_22BDDBF3C(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_22BDDBF3C(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t DOCUSBRenamingErrorDomain.getter()
{
  return 0xD00000000000002BLL;
}

DocumentManagerExecutables::DOCUSBRenamingErrorCode_optional __swiftcall DOCUSBRenamingErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 2) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (rawValue == 1) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (DocumentManagerExecutables::DOCUSBRenamingErrorCode_optional)rawValue;
}

uint64_t DOCUSBRenamingErrorCode.rawValue.getter()
{
  if (*v0) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t sub_22BE7E730()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE7E780()
{
  return sub_22BE93A08();
}

uint64_t sub_22BE7E7B8()
{
  return sub_22BE93A48();
}

void *sub_22BE7E804@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 2) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 1) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_22BE7E824(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1;
  if (*v1) {
    uint64_t v2 = 2;
  }
  *a1 = v2;
}

uint64_t sub_22BE7E83C()
{
  sub_22BE93648();
  swift_bridgeObjectRelease();
  id v1 = *(id *)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_description);
  sub_22BE92CD8();

  sub_22BE92D88();
  swift_bridgeObjectRelease();
  sub_22BE92D88();
  swift_bridgeObjectRetain();
  sub_22BE92D88();
  swift_bridgeObjectRelease();
  return 0x3D656372756F73;
}

void sub_22BE7E940()
{
  id v1 = (uint64_t *)v0;
  id v2 = objc_msgSend(*(id *)(v0 + 16), sel_identifier);
  sub_22BE92CD8();

  char v3 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  uint64_t v4 = self;
  sub_22BE91C58();
  id v5 = objc_msgSend(v4, sel_sharedManager);
  if (v5)
  {
    unsigned int v6 = v5;
    id v7 = sub_22BE3C054();

    if (v7)
    {
      sub_22BE7FF24(v1[3], v1[4], v7);
      int64_t v8 = (void *)sub_22BE92C98();
      swift_bridgeObjectRelease();
      int64_t v23 = sub_22BE7FF1C;
      uint64_t v24 = v1;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v20 = 1107296256;
      unint64_t v21 = sub_22BE0469C;
      int64_t v22 = &block_descriptor_23_0;
      int64_t v9 = _Block_copy(&aBlock);
      sub_22BE91C58();
      swift_release();
      objc_msgSend(v7, sel_rename_withCompletionBlock_, v8, v9);
      _Block_release(v9);

      swift_release();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268487718);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22BE99770;
      *(void *)(inited + 32) = sub_22BE92CD8();
      *(void *)(inited + 40) = v11;
      uint64_t aBlock = 0;
      unint64_t v20 = 0xE000000000000000;
      sub_22BE93648();
      sub_22BE92D88();
      unint64_t v25 = v3;
      type metadata accessor for FPProviderDomainID(0);
      sub_22BE93758();
      *(void *)(inited + 48) = 0;
      *(void *)(inited + 56) = 0xE000000000000000;
      unint64_t v12 = sub_22BE1A79C(inited);
      sub_22BE7E378(v12);
      swift_bridgeObjectRelease();
      id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v14 = (void *)sub_22BE92C98();
      uint64_t v15 = (void *)sub_22BE92BE8();
      swift_bridgeObjectRelease();
      id v16 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 1, v15);

      uint64_t v17 = (void (*)(void, id))v1[5];
      if (v17)
      {
        sub_22BE03630(v1[5]);
        id v18 = v16;
        v17(0, v16);

        sub_22BDE0E58((uint64_t)v17);
        swift_release();
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_22BE7EC94(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = a1;
    if (qword_268486828 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_22BE925E8();
    __swift_project_value_buffer(v5, (uint64_t)qword_268487A70);
    id v6 = a1;
    id v7 = a1;
    int64_t v8 = sub_22BE925C8();
    os_log_type_t v9 = sub_22BE93158();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v23 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      sub_22BDD8478(0x286D726F66726570, 0xE900000000000029, &v23);
      sub_22BE93408();
      *(_WORD *)(v10 + 12) = 2080;
      id v12 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268487218);
      uint64_t v13 = sub_22BE92CF8();
      sub_22BDD8478(v13, v14, &v23);
      sub_22BE93408();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22BDC5000, v8, v9, "%s: Rename failed with error: %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v11, -1, -1);
      MEMORY[0x230F57540](v10, -1, -1);
    }
    else
    {
    }
    unint64_t v21 = *(void (**)(void, void *))(a2 + 40);
    if (v21)
    {
      id v22 = a1;
      sub_22BE03630((uint64_t)v21);
      v21(0, a1);

      sub_22BDE0E58((uint64_t)v21);
    }
  }
  else
  {
    if (qword_268486828 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_22BE925E8();
    __swift_project_value_buffer(v15, (uint64_t)qword_268487A70);
    id v16 = sub_22BE925C8();
    os_log_type_t v17 = sub_22BE93148();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = v19;
      *(_DWORD *)id v18 = 136315138;
      sub_22BDD8478(0x286D726F66726570, 0xE900000000000029, &v23);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v16, v17, "%s: Rename completed on disk", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v19, -1, -1);
      MEMORY[0x230F57540](v18, -1, -1);
    }

    unint64_t v20 = *(void (**)(void, void))(a2 + 40);
    if (v20)
    {
      sub_22BE91C58();
      v20(0, 0);
      sub_22BDE0E58((uint64_t)v20);
    }
  }
}

uint64_t sub_22BE7F074()
{
  swift_bridgeObjectRelease();
  sub_22BDE0E58(*(void *)(v0 + 40));

  return swift_deallocClassInstance();
}

uint64_t sub_22BE7F0BC()
{
  return sub_22BE7E83C();
}

uint64_t sub_22BE7F0E0()
{
  type metadata accessor for DOCUSBRenaming();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_22BE7FAE0();
  qword_268488600 = v0;
  return result;
}

uint64_t static DOCUSBRenaming.shared.getter()
{
  if (qword_2684868D8 != -1) {
    swift_once();
  }

  return sub_22BE91C58();
}

BOOL sub_22BE7F178()
{
  id v0 = objc_msgSend(self, sel_usbRenameErase);
  unsigned int v1 = objc_msgSend(v0, sel_isEnabled);

  if (!v1) {
    return 0;
  }
  if (qword_26AEFFE28 != -1) {
    swift_once();
  }
  uint64_t v2 = *((void *)off_26AEFFA78 + 2);
  swift_beginAccess();
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22BE937E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 < 1;
}

uint64_t sub_22BE7F278(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v15 = sub_22BE92B08();
  uint64_t v44 = *(void *)(v15 - 8);
  uint64_t v45 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v42 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_22BE92B58();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  id v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DOCUSBRenameOperation_StorageKit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a1;
  v19[3] = a2;
  v19[4] = a3;
  unint64_t v20 = (void *)swift_allocObject();
  v20[2] = v8;
  v20[3] = a2;
  v20[4] = a3;
  v20[5] = a4;
  v20[6] = a6;
  v20[7] = a7;
  v19[5] = sub_22BE7F934;
  v19[6] = v20;
  swift_bridgeObjectRetain_n();
  id v21 = a1;
  sub_22BE91C58();
  id v22 = a4;
  sub_22BE91C58();
  sub_22BDE0E58(0);
  if (qword_268486828 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_22BE925E8();
  __swift_project_value_buffer(v23, (uint64_t)qword_268487A70);
  swift_retain_n();
  uint64_t v24 = sub_22BE925C8();
  os_log_type_t v25 = sub_22BE93148();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v46 = sub_22BDD8478(0xD000000000000068, 0x800000022BEA5D70, aBlock);
    sub_22BE93408();
    *(_WORD *)(v26 + 12) = 2080;
    sub_22BE91C58();
    uint64_t v27 = sub_22BE7E83C();
    uint64_t v28 = v18;
    uint64_t v29 = v8;
    unint64_t v31 = v30;
    swift_release();
    uint64_t v46 = sub_22BDD8478(v27, v31, aBlock);
    sub_22BE93408();
    swift_release_n();
    uint64_t v8 = v29;
    id v18 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v24, v25, "%s: Adding USB Rename Operation %s", (uint8_t *)v26, 0x16u);
    uint64_t v32 = v40;
    swift_arrayDestroy();
    MEMORY[0x230F57540](v32, -1, -1);
    MEMORY[0x230F57540](v26, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  int64_t v33 = *(void **)(v8 + 16);
  aBlock[4] = (uint64_t)sub_22BE7FA84;
  aBlock[5] = (uint64_t)v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22BDD0BA8;
  void aBlock[3] = (uint64_t)&block_descriptor_25;
  uint64_t v34 = _Block_copy(aBlock);
  sub_22BE91C58();
  id v35 = v33;
  sub_22BE92B38();
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_22BDD69C4((unint64_t *)&qword_26AF002B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF002D0);
  sub_22BDD7600((unint64_t *)&qword_26AF002E0, (uint64_t *)&unk_26AF002D0);
  uint64_t v36 = v42;
  uint64_t v37 = v45;
  sub_22BE934E8();
  MEMORY[0x230F55CD0](0, v18, v36, v34);
  _Block_release(v34);
  swift_release();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v43);
  return swift_release();
}

uint64_t type metadata accessor for DOCUSBRenameOperation_StorageKit()
{
  return self;
}

void sub_22BE7F7C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  v15[5] = a5;
  void v15[6] = a6;
  v15[7] = a7;
  v15[8] = a8;
  v19[4] = sub_22BE801B0;
  v19[5] = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1107296256;
  v19[2] = sub_22BDD0BA8;
  v19[3] = &block_descriptor_29_1;
  uint64_t v16 = _Block_copy(v19);
  id v17 = a2;
  sub_22BE91C58();
  swift_bridgeObjectRetain();
  id v18 = a6;
  sub_22BE91C58();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v16);
}

uint64_t sub_22BE7F8E4()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_22BE7F934(uint64_t a1, void *a2)
{
  sub_22BE7F7C4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_22BE7F944(id a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(id))
{
  if (a1)
  {
    id v11 = a1;
    id v12 = (void *)sub_22BE92078();
    id v13 = sub_22BE801C4(a3, a4, v12);

    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = a5;
    v19[4] = sub_22BE77DAC;
    v19[5] = v14;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = sub_22BDD0BA8;
    v19[3] = &block_descriptor_35_0;
    uint64_t v15 = _Block_copy(v19);
    id v16 = v13;
    id v17 = a5;
    swift_release();
    DOCRunInMainThread();
    _Block_release(v15);
  }
  return a6(a1);
}

uint64_t DOCUSBRenaming.deinit()
{
  return v0;
}

uint64_t DOCUSBRenaming.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22BE7FAE0()
{
  uint64_t v1 = sub_22BE931B8();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_22BE931D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BE92B58();
  MEMORY[0x270FA5388](v6 - 8);
  sub_22BDD9D50(0, (unint64_t *)&qword_26AF003E0);
  sub_22BE92B48();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v2);
  v8[1] = MEMORY[0x263F8EE78];
  sub_22BDD69C4((unint64_t *)&unk_26AF003D0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF002F0);
  sub_22BDD7600((unint64_t *)&unk_26AF00300, (uint64_t *)&unk_26AF002F0);
  sub_22BE934E8();
  *(void *)(v0 + 16) = sub_22BE93228();
  return v0;
}

unint64_t sub_22BE7FD38()
{
  unint64_t result = qword_268488608;
  if (!qword_268488608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488608);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCUSBRenamingErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22BE7FE58);
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

ValueMetadata *type metadata accessor for DOCUSBRenamingErrorCode()
{
  return &type metadata for DOCUSBRenamingErrorCode;
}

uint64_t type metadata accessor for DOCUSBRenaming()
{
  return self;
}

uint64_t method lookup function for DOCUSBRenaming(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCUSBRenaming);
}

uint64_t dispatch thunk of DOCUSBRenaming.canRename.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of DOCUSBRenaming.performRename(source:newDisplayName:alertPresenting:requiresAlertPresentation:completion:finishedBlock:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

void sub_22BE7FF1C(void *a1)
{
  sub_22BE7EC94(a1, v1);
}

uint64_t sub_22BE7FF24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_22BE91EE8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a3, sel_filesystemType);
  if (!v10)
  {
    sub_22BE92CD8();
    goto LABEL_14;
  }
  id v11 = v10;
  uint64_t v12 = sub_22BE92CD8();
  uint64_t v14 = v13;

  uint64_t v15 = sub_22BE92CD8();
  if (!v14)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    sub_22BE92CD8();
    goto LABEL_15;
  }
  if (v15 == v12 && v14 == v16)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v18 = sub_22BE938C8();
  swift_bridgeObjectRelease();
  if (v18)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v22[0] = a1;
    v22[1] = a2;
    sub_22BE91EB8();
    sub_22BE0F59C();
    a1 = sub_22BE93458();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return a1;
  }
  if (sub_22BE92CD8() == v12 && v14 == v19)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  sub_22BE938C8();
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22BE80158()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22BE801B0()
{
  return sub_22BE7F944(*(id *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48), *(uint64_t (**)(id))(v0 + 56));
}

id sub_22BE801C4(uint64_t a1, uint64_t a2, void *a3)
{
  id result = (id)_DocumentManagerBundle();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v7 = result;
  sub_22BE91F78();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22BE99770;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = sub_22BDF8220();
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_22BE92CA8();
  uint64_t v39 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id result = (id)_DocumentManagerBundle();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  id v11 = result;
  uint64_t v12 = sub_22BE91F78();
  uint64_t v14 = v13;

  sub_22BE93648();
  sub_22BE92D88();
  sub_22BE92D88();
  sub_22BE92D88();
  *(void *)&v40[0] = a3;
  id v38 = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268488390);
  sub_22BE92CF8();
  sub_22BE92D88();
  swift_bridgeObjectRelease();
  sub_22BE1ACF8(MEMORY[0x263F8EE78]);
  uint64_t v15 = sub_22BE92CD8();
  uint64_t v17 = v16;
  char v18 = a3;
  uint64_t v19 = MEMORY[0x263F8D310];
  uint64_t v42 = MEMORY[0x263F8D310];
  *(void *)&long long v41 = v9;
  *((void *)&v41 + 1) = v39;
  sub_22BDDBF3C(&v41, v40);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22BE1DAF4(v40, v15, v17, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_22BE92CD8();
  uint64_t v23 = v22;
  uint64_t v42 = v19;
  *(void *)&long long v41 = v12;
  *((void *)&v41 + 1) = v14;
  sub_22BDDBF3C(&v41, v40);
  char v24 = swift_isUniquelyReferenced_nonNull_native();
  sub_22BE1DAF4(v40, v21, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_22BE92CD8();
  uint64_t v27 = v26;
  uint64_t v42 = v19;
  *(void *)&long long v41 = 0;
  *((void *)&v41 + 1) = 0xE000000000000000;
  sub_22BDDBF3C(&v41, v40);
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_22BE1DAF4(v40, v25, v27, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t v29 = sub_22BE92CD8();
    uint64_t v31 = v30;
    uint64_t v42 = sub_22BDD9D50(0, (unint64_t *)&unk_2684880A0);
    *(void *)&long long v41 = v38;
    sub_22BDDBF3C(&v41, v40);
    id v32 = v38;
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_22BE1DAF4(v40, v29, v31, v33);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v34 = objc_allocWithZone(MEMORY[0x263F087E8]);
  id v35 = (void *)sub_22BE92C98();
  uint64_t v36 = (void *)sub_22BE92BE8();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v34, sel_initWithDomain_code_userInfo_, v35, 2, v36, 0x800000022BEA5F60);

  return v37;
}

uint64_t sub_22BE80694()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BE806EC()
{
  sub_22BE92D48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE80778()
{
  sub_22BE92D48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE80844()
{
  sub_22BE92D48();

  return swift_bridgeObjectRelease();
}

uint64_t DOCItemGroupingBehavior.accessibilityIdentifierComponent.getter()
{
  uint64_t result = 1701736302;
  switch(*v0)
  {
    case 2:
      uint64_t result = 1701667182;
      break;
    case 3:
      uint64_t result = 6775156;
      break;
    case 4:
      uint64_t result = 1702521203;
      break;
    case 5:
      uint64_t result = 1684957547;
      break;
    case 6:
      uint64_t result = 0x7942646572616873;
      break;
    case 7:
      return result;
    default:
      uint64_t result = 1702125924;
      break;
  }
  return result;
}

id DOCItemGroupingBehavior.localizedName.getter()
{
  switch(*v0)
  {
    case 7:
      id v2 = (id)_DocumentManagerBundle();
      if (!v2)
      {
        __break(1u);
        JUMPOUT(0x22BE80AFCLL);
      }
      int v3 = v2;
      uint64_t v4 = sub_22BE91F78();

      id result = (id)v4;
      break;
    default:
      id result = DOCItemSortMode.DisplayableMode.localizedName.getter();
      break;
  }
  return result;
}

uint64_t DOCItemGroupingBehavior.hash(into:)()
{
  if (*v0 == 7) {
    return sub_22BE93A08();
  }
  sub_22BE93A08();
  sub_22BE92D48();

  return swift_bridgeObjectRelease();
}

uint64_t static DOCItemGroupingBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 7) {
    return v3 == 7;
  }
  if (v3 == 7) {
    return 0;
  }
  return sub_22BDD3ED4(v2, v3);
}

uint64_t DOCItemGroupingBehavior.hashValue.getter()
{
  int v1 = *v0;
  sub_22BE939F8();
  sub_22BE93A08();
  if (v1 != 7)
  {
    sub_22BE92D48();
    swift_bridgeObjectRelease();
  }
  return sub_22BE93A48();
}

uint64_t sub_22BE80DE4()
{
  int v1 = *v0;
  sub_22BE939F8();
  sub_22BE93A08();
  if (v1 != 7)
  {
    sub_22BE92D48();
    swift_bridgeObjectRelease();
  }
  return sub_22BE93A48();
}

uint64_t sub_22BE80F24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 7) {
    return v3 == 7;
  }
  if (v3 == 7) {
    return 0;
  }
  return sub_22BDD3ED4(v2, v3);
}

void DOCItemGroupingBehavior.id.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_22BE80F68()
{
  unint64_t result = qword_268488610;
  if (!qword_268488610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488610);
  }
  return result;
}

unint64_t sub_22BE80FC0()
{
  unint64_t result = qword_268488618;
  if (!qword_268488618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488618);
  }
  return result;
}

id static UIImage.doc_executablesFrameworkImage(named:)()
{
  uint64_t v0 = (void *)sub_22BE92C98();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (!v1) {
    return 0;
  }
  swift_bridgeObjectRetain();
  id v2 = v1;
  int v3 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v3, v2, 0);

  return v4;
}

void static DOCAuthenticationMechanism.current.getter(char *a1@<X8>)
{
  id v2 = (id)MobileGestalt_get_current_device();
  if (!v2) {
    goto LABEL_8;
  }
  int v3 = v2;
  if (!MobileGestalt_get_pearlIDCapability())
  {
    if (MobileGestalt_get_touchIDCapability())
    {

      char v4 = 2;
      goto LABEL_9;
    }
    char oysterCapability = MobileGestalt_get_oysterCapability();

    if (oysterCapability)
    {
      char v4 = 4;
      goto LABEL_9;
    }
LABEL_8:
    char v4 = 1;
    goto LABEL_9;
  }

  char v4 = 3;
LABEL_9:
  *a1 = v4;
}

uint64_t DOCAuthenticationMechanism.localizedDescription.getter()
{
  switch(*v0)
  {
    case 1:
      id v6 = (id)_DocumentManagerBundle();
      if (!v6) {
        goto LABEL_17;
      }
      id v2 = v6;
      break;
    case 2:
      id v3 = (id)_DocumentManagerBundle();
      if (!v3)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
        JUMPOUT(0x22BE81494);
      }
      id v2 = v3;
      break;
    case 3:
      id v4 = (id)_DocumentManagerBundle();
      if (!v4) {
        goto LABEL_14;
      }
      id v2 = v4;
      break;
    case 4:
      id v5 = (id)_DocumentManagerBundle();
      if (!v5) {
        goto LABEL_15;
      }
      id v2 = v5;
      break;
    default:
      id v1 = (id)_DocumentManagerBundle();
      if (!v1) {
        goto LABEL_16;
      }
      id v2 = v1;
      break;
  }
  uint64_t v7 = sub_22BE91F78();

  return v7;
}

BOOL static DOCAuthenticationMechanism.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DOCAuthenticationMechanism.hash(into:)()
{
  return sub_22BE93A08();
}

uint64_t DOCAuthenticationMechanism.hashValue.getter()
{
  return sub_22BE93A48();
}

void UIDevice.doc_preferredAuthenticationMechanism.getter(char *a1@<X8>)
{
  id v2 = (id)MobileGestalt_get_current_device();
  if (!v2) {
    goto LABEL_14;
  }
  id v3 = v2;
  if ((MobileGestalt_get_pearlIDCapability() & 1) == 0)
  {
    if (MobileGestalt_get_touchIDCapability())
    {

      id v9 = objc_msgSend(self, sel_currentUser);
      id v10 = objc_msgSend(v9, sel_state);

      id v11 = objc_msgSend(v10, sel_biometry);
      if (v11)
      {
        unsigned __int8 v12 = objc_msgSend(v11, sel_isEnrolled);

        if (v12)
        {
          char v8 = 2;
          goto LABEL_15;
        }
      }
    }
    else
    {
      char oysterCapability = MobileGestalt_get_oysterCapability();

      if (oysterCapability)
      {
        id v14 = objc_msgSend(self, sel_currentUser);
        id v15 = objc_msgSend(v14, sel_state);

        id v16 = objc_msgSend(v15, sel_biometry);
        if (v16)
        {
          unsigned __int8 v17 = objc_msgSend(v16, sel_isEnrolled);

          if (v17)
          {
            char v8 = 4;
            goto LABEL_15;
          }
        }
      }
    }
LABEL_14:
    char v8 = 1;
    goto LABEL_15;
  }

  id v4 = objc_msgSend(self, sel_currentUser);
  id v5 = objc_msgSend(v4, sel_state);

  id v6 = objc_msgSend(v5, sel_biometry);
  if (!v6) {
    goto LABEL_14;
  }
  unsigned __int8 v7 = objc_msgSend(v6, sel_isEnrolled);

  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
  char v8 = 3;
LABEL_15:
  *a1 = v8;
}

unint64_t sub_22BE81740()
{
  unint64_t result = qword_268488620;
  if (!qword_268488620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488620);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCAuthenticationMechanism(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x22BE81860);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCAuthenticationMechanism()
{
  return &type metadata for DOCAuthenticationMechanism;
}

id DOCOpenLocationIntentActionResolver.locationIntent.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_22BE818A0()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_22BE818D4(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_22BE81914())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22BE81968(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE819C8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22BE81A14(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22BE81A68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22BE81ABC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = *(void *)(v3 + 56);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    unsigned __int8 v7 = sub_22BE85DB8;
  }
  else
  {
    unsigned __int8 v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22BE03630(v4);
}

uint64_t sub_22BE81B50(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_22BE85D78;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 48);
  *(void *)(v7 + 48) = v6;
  *(void *)(v7 + 56) = v5;
  sub_22BE03630(v3);
  return sub_22BDE0E58(v8);
}

uint64_t sub_22BE81C0C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  sub_22BE03630(v1);
  return v1;
}

uint64_t sub_22BE81C5C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 48);
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return sub_22BDE0E58(v5);
}

uint64_t (*sub_22BE81CB0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22BE81D04@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(v3 + 72);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_22BE85D48;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22BE03630(v4);
}

uint64_t sub_22BE81D98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_22BE85D10;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 64);
  *(void *)(v7 + 64) = v6;
  *(void *)(v7 + 72) = v5;
  sub_22BE03630(v3);
  return sub_22BDE0E58(v8);
}

uint64_t sub_22BE81E54()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  sub_22BE03630(v1);
  return v1;
}

uint64_t sub_22BE81EA4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return sub_22BDE0E58(v5);
}

uint64_t (*sub_22BE81EF8())()
{
  return j__swift_endAccess;
}

uint64_t sub_22BE81F4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 88);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_22BE30DFC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22BE03630(v4);
}

uint64_t sub_22BE81FE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_22BE30DC4;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 80);
  *(void *)(v7 + 80) = v6;
  *(void *)(v7 + 88) = v5;
  sub_22BE03630(v3);
  return sub_22BDE0E58(v8);
}

uint64_t sub_22BE8209C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 80);
  sub_22BE03630(v1);
  return v1;
}

uint64_t sub_22BE820EC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return sub_22BDE0E58(v5);
}

uint64_t (*sub_22BE82140())()
{
  return j_j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.__allocating_init(with:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 24) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(void *)(v2 + 16) = a1;
  id v3 = a1;
  uint64_t v4 = sub_22BE8247C(a1);
  uint64_t v6 = v5;

  swift_beginAccess();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DOCOpenLocationIntentActionResolver.init(with:)(void *a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(void *)(v1 + 16) = a1;
  id v3 = a1;
  uint64_t v4 = sub_22BE8247C(a1);
  uint64_t v6 = v5;

  swift_beginAccess();
  *(void *)(v1 + 32) = v4;
  *(void *)(v1 + 40) = v6;
  swift_bridgeObjectRelease();
  return v1;
}

void sub_22BE822D8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = objc_msgSend(v1, sel_location);
  if (v2)
  {
    id v12 = v2;
    id v3 = objc_msgSend(v2, sel_locationType);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_22BE92CD8();
      uint64_t v7 = v6;

      if (sub_22BE92CD8() == v5 && v8 == v7)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v10 = sub_22BE938C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
        {
          id v11 = objc_msgSend(v1, sel_location);
          sub_22BE83018(v11);
LABEL_15:

          return;
        }
      }
      id v11 = objc_msgSend(v1, sel_folder);
      sub_22BE83E70(v11);
      goto LABEL_15;
    }
  }

  sub_22BE83018(0);
}

uint64_t sub_22BE8243C()
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v0 + 24) = 1;
  return result;
}

uint64_t sub_22BE8247C(void *a1)
{
  id v3 = objc_msgSend(*(id *)(v1 + 16), sel_location);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_locationType);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = sub_22BE92CD8();
      uint64_t v9 = v8;

      if (sub_22BE92CD8() == v7 && v10 == v9)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v12 = sub_22BE938C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          id v13 = objc_msgSend(a1, sel_location);
          uint64_t v14 = (uint64_t)sub_22BE82A84(v13);
LABEL_18:
          uint64_t v24 = v14;

          return v24;
        }
      }
      id v13 = objc_msgSend(a1, sel_folder);
      uint64_t v14 = sub_22BE82784(v13);
      goto LABEL_18;
    }
  }
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_22BE925E8();
  __swift_project_value_buffer(v15, (uint64_t)qword_2684879E0);
  id v16 = a1;
  unsigned __int8 v17 = sub_22BE925C8();
  os_log_type_t v18 = sub_22BE93158();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v26 = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    sub_22BDD8478(0xD000000000000011, 0x800000022BEA63B0, &v26);
    sub_22BE93408();
    *(_WORD *)(v19 + 12) = 2080;
    id v21 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268488630);
    uint64_t v22 = sub_22BE92CF8();
    sub_22BDD8478(v22, v23, &v26);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v17, v18, "%s location or locationType in intent: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v20, -1, -1);
    MEMORY[0x230F57540](v19, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_22BE82784(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BE84128(a1, (uint64_t)v4);
  uint64_t v5 = sub_22BE92198();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22BDFBCE4((uint64_t)v4);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = sub_22BE92108();
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_22BE925E8();
  __swift_project_value_buffer(v10, (uint64_t)qword_2684879E0);
  swift_bridgeObjectRetain_n();
  id v11 = sub_22BE925C8();
  os_log_type_t v12 = sub_22BE93158();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v19 = sub_22BDD8478(0xD000000000000017, 0x800000022BEA63D0, &v21);
    sub_22BE93408();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v19 = v7;
    uint64_t v20 = v8;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
    uint64_t v15 = sub_22BE92CF8();
    uint64_t v19 = sub_22BDD8478(v15, v16, &v21);
    sub_22BE93408();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v11, v12, "%s location: %s.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v14, -1, -1);
    MEMORY[0x230F57540](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v7;
}

id sub_22BE82A84(void *a1)
{
  if (!a1) {
    goto LABEL_9;
  }
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_locationType);
  if (!v2)
  {

LABEL_9:
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_22BE925E8();
    __swift_project_value_buffer(v17, (uint64_t)qword_2684879E0);
    uint64_t v18 = sub_22BE925C8();
    os_log_type_t v19 = sub_22BE93158();
    uint64_t v20 = 0xD00000000000003FLL;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v34 = sub_22BDD8478(0xD000000000000019, 0x800000022BEA6430, &v32);
      sub_22BE93408();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v34 = sub_22BDD8478(0xD00000000000003FLL, 0x800000022BEA63F0, &v32);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v18, v19, "%s location: %s.", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v22, -1, -1);
      MEMORY[0x230F57540](v21, -1, -1);
    }
    else
    {
    }
    return (id)v20;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_22BE92CD8();
  uint64_t v6 = v5;

  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22BE925E8();
  __swift_project_value_buffer(v7, (uint64_t)qword_2684879E0);
  id v8 = v1;
  uint64_t v9 = sub_22BE925C8();
  os_log_type_t v10 = sub_22BE93148();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v34 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v32 = sub_22BDD8478(0xD000000000000019, 0x800000022BEA6430, &v34);
    sub_22BE93408();
    *(_WORD *)(v11 + 12) = 2080;
    id v13 = objc_msgSend(v8, sel_identifier);
    if (v13)
    {
      uint64_t v14 = v13;
      sub_22BE92CD8();
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0;
    }
    unint64_t v33 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
    uint64_t v23 = sub_22BE92CF8();
    uint64_t v32 = sub_22BDD8478(v23, v24, &v34);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v9, v10, "%s location: %s.", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v12, -1, -1);
    MEMORY[0x230F57540](v11, -1, -1);
  }
  else
  {
  }
  if (v4 == sub_22BE92CD8() && v6 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      id v30 = objc_msgSend(v8, sel_identifier);
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v20 = sub_22BE92CD8();
      }
      else
      {

        return 0;
      }
      return (id)v20;
    }
  }
  uint64_t v32 = 0x5F7265646C6F66;
  unint64_t v33 = 0xE700000000000000;
  id result = objc_msgSend(v8, sel_identifier);
  if (result)
  {
    char v28 = result;
    sub_22BE92CD8();

    sub_22BE92D88();
    swift_bridgeObjectRelease();
    sub_22BE92D88();
    id result = objc_msgSend(v8, sel_domainIdentifier);
    if (result)
    {
      uint64_t v29 = result;
      sub_22BE92CD8();

      sub_22BE92D88();
      swift_bridgeObjectRelease();
      return (id)v32;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22BE83018(void *a1)
{
  if (a1)
  {
    id v2 = a1;
  }
  else
  {
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_22BE925E8();
    __swift_project_value_buffer(v3, (uint64_t)qword_2684879E0);
    uint64_t v4 = sub_22BE925C8();
    os_log_type_t v5 = sub_22BE93158();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(void *)&v66[0] = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      *(void *)&v65[0] = sub_22BDD8478(0xD000000000000012, 0x800000022BEA6390, (uint64_t *)v66);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v4, v5, "%s Location was nil. Falling back to Recents.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v7, -1, -1);
      MEMORY[0x230F57540](v6, -1, -1);
    }

    id v8 = (id)DOCCreateDefaultHomeScreenWidgetIntent();
    uint64_t v9 = (void *)sub_22BE92C98();
    id v10 = objc_msgSend(v8, sel_valueForKey_, v9);

    if (!v10)
    {
      __break(1u);
      return;
    }
    sub_22BE934B8();

    swift_unknownObjectRelease();
    sub_22BDDBF3C(v65, v66);
    sub_22BE85DEC();
    swift_dynamicCast();
    id v2 = v64;
  }
  uint64_t v11 = qword_2684867F8;
  id v12 = a1;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_22BE925E8();
  __swift_project_value_buffer(v13, (uint64_t)qword_2684879E0);
  id v14 = v2;
  unint64_t v15 = sub_22BE925C8();
  os_log_type_t v16 = sub_22BE93148();
  uint64_t v17 = &selRef_isUploading;
  uint64_t v18 = &selRef_isUploading;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(void *)&v65[0] = v63;
    *(_DWORD *)uint64_t v19 = 136316418;
    *(void *)&v66[0] = sub_22BDD8478(0xD000000000000012, 0x800000022BEA6390, (uint64_t *)v65);
    sub_22BE93408();
    *(_WORD *)(v19 + 12) = 2080;
    id v20 = objc_msgSend(v14, sel_identifier);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_22BE92CD8();
      uint64_t v24 = v23;
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v24 = 0;
    }
    *(void *)&v66[0] = v22;
    *((void *)&v66[0] + 1) = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
    uint64_t v25 = sub_22BE92CF8();
    *(void *)&v66[0] = sub_22BDD8478(v25, v26, (uint64_t *)v65);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    id v27 = objc_msgSend(v14, sel_displayString);
    uint64_t v28 = sub_22BE92CD8();
    unint64_t v30 = v29;

    *(void *)&v66[0] = sub_22BDD8478(v28, v30, (uint64_t *)v65);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 32) = 2080;
    id v31 = objc_msgSend(v14, sel_locationType);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = sub_22BE92CD8();
      uint64_t v35 = v34;
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v35 = 0;
    }
    *(void *)&v66[0] = v33;
    *((void *)&v66[0] + 1) = v35;
    uint64_t v36 = sub_22BE92CF8();
    *(void *)&v66[0] = sub_22BDD8478(v36, v37, (uint64_t *)v65);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 42) = 2080;
    id v38 = objc_msgSend(v14, sel_locationIdentifier);
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = sub_22BE92CD8();
      uint64_t v42 = v41;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v42 = 0;
    }
    *(void *)&v66[0] = v40;
    *((void *)&v66[0] + 1) = v42;
    uint64_t v43 = sub_22BE92CF8();
    *(void *)&v66[0] = sub_22BDD8478(v43, v44, (uint64_t *)v65);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 52) = 2080;
    id v45 = objc_msgSend(v14, sel_domainIdentifier);
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = sub_22BE92CD8();
      uint64_t v49 = v48;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v49 = 0;
    }
    *(void *)&v66[0] = v47;
    *((void *)&v66[0] + 1) = v49;
    uint64_t v50 = sub_22BE92CF8();
    *(void *)&v66[0] = sub_22BDD8478(v50, v51, (uint64_t *)v65);
    sub_22BE93408();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v15, v16, "%s id: %s display name: %s type: %s locationId: %s bundleId: %s", (uint8_t *)v19, 0x3Eu);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v63, -1, -1);
    MEMORY[0x230F57540](v19, -1, -1);

    uint64_t v18 = &selRef_isUploading;
    uint64_t v17 = &selRef_isUploading;
  }
  else
  {
  }
  id v52 = objc_msgSend(v14, v17[336], v63);
  if (!v52) {
    id v52 = (id)*MEMORY[0x263F3ACA8];
  }
  id v53 = objc_msgSend(v14, sel_identifier);
  if (v53)
  {
    int64_t v54 = v53;
    uint64_t v55 = sub_22BE92CD8();
    unint64_t v57 = v56;
  }
  else
  {
    uint64_t v55 = 0;
    unint64_t v57 = 0;
  }
  id v58 = [v14 v18[343]];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = sub_22BE92CD8();
    uint64_t v62 = v61;
  }
  else
  {
    uint64_t v60 = 0;
    uint64_t v62 = 0;
  }
  sub_22BE837A0(v52, v55, v57, v60, v62);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_22BE837A0(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t, unint64_t))
{
  uint64_t v11 = sub_22BE92CD8();
  uint64_t v13 = v12;
  if (v11 == sub_22BE92CD8() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
LABEL_15:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 48);
    if (a5)
    {
      if (a3) {
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_51;
  }
  char v16 = sub_22BE938C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_15;
  }
  uint64_t v17 = sub_22BE92CD8();
  uint64_t v19 = v18;
  if (v17 == sub_22BE92CD8() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
LABEL_20:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 48);
    if (!a5)
    {
      __break(1u);
      goto LABEL_53;
    }
    if (!a3)
    {
      __break(1u);
      goto LABEL_23;
    }
LABEL_17:
    sub_22BE91C58();
    a5(a1, a2, a3);
LABEL_18:
    sub_22BDE0E58((uint64_t)a5);
    return;
  }
  char v22 = sub_22BE938C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_20;
  }
  uint64_t v23 = sub_22BE92CD8();
  uint64_t v25 = v24;
  if (v23 == sub_22BE92CD8() && v25 == v26)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
LABEL_23:
  char v27 = sub_22BE938C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27)
  {
LABEL_24:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 64);
    if (a5)
    {
      if (a3)
      {
        sub_22BE91C58();
        ((void (*)(uint64_t, unint64_t))a5)(a2, a3);
        goto LABEL_18;
      }
      goto LABEL_54;
    }
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v28 = sub_22BE92CD8();
  uint64_t v30 = v29;
  if (v28 == sub_22BE92CD8() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:
    sub_22BE84E58();
    return;
  }
  char v32 = sub_22BE938C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32) {
    goto LABEL_31;
  }
  uint64_t v33 = sub_22BE92CD8();
  uint64_t v35 = v34;
  if (v33 != sub_22BE92CD8() || v35 != v36)
  {
    char v37 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v37) {
      goto LABEL_38;
    }
    if (qword_2684867F8 == -1)
    {
LABEL_44:
      uint64_t v38 = sub_22BE925E8();
      __swift_project_value_buffer(v38, (uint64_t)qword_2684879E0);
      swift_bridgeObjectRetain_n();
      id v39 = a1;
      swift_bridgeObjectRetain_n();
      id v52 = v39;
      uint64_t v40 = sub_22BE925C8();
      os_log_type_t v41 = sub_22BE93158();
      if (os_log_type_enabled(v40, v41))
      {
        os_log_type_t type = v41;
        uint64_t v42 = swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        uint64_t v53 = v51;
        *(_DWORD *)uint64_t v42 = 136315906;
        sub_22BDD8478(0xD000000000000032, 0x800000022BEA6330, &v53);
        sub_22BE93408();
        *(_WORD *)(v42 + 12) = 2080;
        type metadata accessor for DOCIntentLocationType(0);
        id v43 = v52;
        uint64_t v44 = sub_22BE92CF8();
        sub_22BDD8478(v44, v45, &v53);
        sub_22BE93408();

        swift_bridgeObjectRelease();
        *(_WORD *)(v42 + 22) = 2080;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
        uint64_t v46 = sub_22BE92CF8();
        sub_22BDD8478(v46, v47, &v53);
        sub_22BE93408();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v42 + 32) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v48 = sub_22BE92CF8();
        sub_22BDD8478(v48, v49, &v53);
        sub_22BE93408();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22BDC5000, v40, type, "%s type: %s identifier: %s bundle id: %s.", (uint8_t *)v42, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x230F57540](v51, -1, -1);
        MEMORY[0x230F57540](v42, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      return;
    }
LABEL_51:
    swift_once();
    goto LABEL_44;
  }
  swift_bridgeObjectRelease_n();
LABEL_38:
  if (!a3)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (!a5)
  {
LABEL_56:
    __break(1u);
    return;
  }

  sub_22BE8508C(a2, a3, a4, (unint64_t)a5);
}

void sub_22BE83E70(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22BE92198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BE84128(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_22BDFBCE4((uint64_t)v4);
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_22BE925E8();
    __swift_project_value_buffer(v9, (uint64_t)qword_2684879E0);
    id v10 = sub_22BE925C8();
    os_log_type_t v11 = sub_22BE93158();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v14 = sub_22BDD8478(0xD000000000000016, 0x800000022BEA6370, &v15);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v10, v11, "%s Folder was nil. Can not continue.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v13, -1, -1);
      MEMORY[0x230F57540](v12, -1, -1);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_22BE84948((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_22BE84128@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22BE92568();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22BE92198();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v54 - v16;
  if (a1)
  {
    uint64_t v61 = v12;
    id v60 = a1;
    id v18 = objc_msgSend(v60, sel_fileURL);
    if (!v18)
    {
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56);
      v23(v10, 1, 1, v11);
      goto LABEL_11;
    }
    uint64_t v19 = v18;
    id v58 = v17;
    uint64_t v20 = a2;
    sub_22BE92168();

    uint64_t v21 = v61;
    char v22 = *(void (**)(char *, char *, uint64_t))(v61 + 32);
    v22(v10, v15, v11);
    uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v59(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v23 = v59;
      a2 = v20;
LABEL_11:
      sub_22BDFBCE4((uint64_t)v10);
      if (qword_2684867F8 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_22BE925E8();
      __swift_project_value_buffer(v30, (uint64_t)qword_2684879E0);
      uint64_t v31 = sub_22BE925C8();
      os_log_type_t v32 = sub_22BE93158();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v63 = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        uint64_t v62 = sub_22BDD8478(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v63);
        sub_22BE93408();
        _os_log_impl(&dword_22BDC5000, v31, v32, "%s folder URL is nil. Can not proceed.", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F57540](v34, -1, -1);
        MEMORY[0x230F57540](v33, -1, -1);
      }

      uint64_t v35 = a2;
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23)(v35, 1, 1, v11);
    }
    uint64_t v55 = (void (*)(uint64_t, char *, uint64_t))v22;
    uint64_t v56 = v21 + 56;
    v22(v58, v10, v11);
    id v36 = objc_msgSend(v60, sel_typeIdentifier);
    uint64_t v57 = v20;
    if (v36)
    {
      char v37 = v36;
      uint64_t v38 = sub_22BE92CD8();
      uint64_t v40 = v39;
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v40 = 0;
    }
    sub_22BE924C8();
    uint64_t v41 = sub_22BE923A8();
    uint64_t v43 = v42;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v44 = v58;
    if (v40)
    {
      if (v38 == v41 && v40 == v43)
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v57;
        v55(v57, v44, v11);
        return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v59)(v45, 0, 1, v11);
      }
      char v46 = sub_22BE938C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v47 = v55;
      if (v46)
      {

        uint64_t v45 = v57;
        v47(v57, v44, v11);
        return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v59)(v45, 0, 1, v11);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_22BE925E8();
    __swift_project_value_buffer(v48, (uint64_t)qword_2684879E0);
    unint64_t v49 = sub_22BE925C8();
    os_log_type_t v50 = sub_22BE93158();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v23 = v59;
    if (v51)
    {
      id v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v63 = v53;
      *(_DWORD *)id v52 = 136315138;
      uint64_t v62 = sub_22BDD8478(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v63);
      sub_22BE93408();
      _os_log_impl(&dword_22BDC5000, v49, v50, "%s URL is not a folder. Can not proceed.", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v53, -1, -1);
      MEMORY[0x230F57540](v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v61 + 8))(v44, v11);
    uint64_t v35 = v57;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23)(v35, 1, 1, v11);
  }
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_22BE925E8();
  __swift_project_value_buffer(v24, (uint64_t)qword_2684879E0);
  uint64_t v25 = sub_22BE925C8();
  os_log_type_t v26 = sub_22BE93158();
  if (os_log_type_enabled(v25, v26))
  {
    char v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v63 = v28;
    *(_DWORD *)char v27 = 136315138;
    uint64_t v62 = sub_22BDD8478(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v63);
    sub_22BE93408();
    _os_log_impl(&dword_22BDC5000, v25, v26, "%s Folder was nil. Can not continue.", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v28, -1, -1);
    MEMORY[0x230F57540](v27, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a2, 1, 1, v11);
}

void sub_22BE84948(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22BE92198();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  id v7 = objc_msgSend(self, sel_defaultManager);
  uint64_t v8 = (void *)sub_22BE92138();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v2;
  aBlock[4] = sub_22BE85C2C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BDDF270;
  void aBlock[3] = &block_descriptor_16;
  uint64_t v11 = _Block_copy(aBlock);
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v7, sel_fetchItemForURL_completionHandler_, v8, v11);
  _Block_release(v11);
}

void sub_22BE84B4C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_22BE92198();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_beginAccess();
    uint64_t v11 = *(void (**)(id))(a4 + 80);
    if (v11)
    {
      id v12 = a1;
      sub_22BE03630((uint64_t)v11);
      v11(v12);
      sub_22BDE0E58((uint64_t)v11);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_22BE925E8();
    __swift_project_value_buffer(v13, (uint64_t)qword_2684879E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
    uint64_t v14 = sub_22BE925C8();
    os_log_type_t v15 = sub_22BE93158();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v20[0] = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v21 = sub_22BDD8478(0x5255656C646E6168, 0xED0000293A5F284CLL, v20);
      sub_22BE93408();
      *(_WORD *)(v16 + 12) = 2080;
      sub_22BDFBD44();
      uint64_t v18 = sub_22BE93878();
      uint64_t v21 = sub_22BDD8478(v18, v19, v20);
      sub_22BE93408();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      _os_log_impl(&dword_22BDC5000, v14, v15, "%s unable to fetch item for URL: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v17, -1, -1);
      MEMORY[0x230F57540](v16, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
}

void sub_22BE84E58()
{
  uint64_t v1 = v0;
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22BE925E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2684879E0);
  uint64_t v3 = sub_22BE925C8();
  os_log_type_t v4 = sub_22BE93148();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_22BDD8478(0xD000000000000013, 0x800000022BEA6310, aBlock);
    sub_22BE93408();
    _os_log_impl(&dword_22BDC5000, v3, v4, "%s loading Downloads collection.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v6, -1, -1);
    MEMORY[0x230F57540](v5, -1, -1);
  }

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3AB88]), sel_init);
  aBlock[4] = (uint64_t)sub_22BE85B4C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22BDDF270;
  void aBlock[3] = (uint64_t)&block_descriptor_13_0;
  uint64_t v8 = _Block_copy(aBlock);
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v7, sel_fetchDefaultDownloadsLocationItem_, v8);
  _Block_release(v8);
}

void sub_22BE8508C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_22BE925E8();
  __swift_project_value_buffer(v10, (uint64_t)qword_2684879E0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_22BE925C8();
  os_log_type_t v12 = sub_22BE93148();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v21 = v5;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    aBlock[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315650;
    sub_22BDD8478(0xD00000000000001CLL, 0x800000022BEA62F0, aBlock);
    sub_22BE93408();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_22BDD8478(a1, a2, aBlock);
    sub_22BE93408();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_22BDD8478(a3, a4, aBlock);
    sub_22BE93408();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22BDC5000, v11, v12, "%s loading folder with ID: %s domain: %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x230F57540](v14, -1, -1);
    uint64_t v15 = v13;
    uint64_t v5 = v21;
    MEMORY[0x230F57540](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v16 = (void *)sub_22BE92C98();
  uint64_t v17 = (void *)sub_22BE92C98();
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F054B8]), sel_initWithProviderDomainID_itemIdentifier_, v16, v17);

  id v19 = objc_msgSend(self, sel_defaultManager);
  aBlock[4] = (uint64_t)sub_22BE85B10;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22BDDF270;
  void aBlock[3] = (uint64_t)&block_descriptor_26;
  uint64_t v20 = _Block_copy(aBlock);
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v19, sel_fetchItemForItemID_completionHandler_, v18, v20);
  _Block_release(v20);
}

void sub_22BE85400(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, const char *a6)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t v8 = *(void (**)(id))(a3 + 80);
    if (v8)
    {
      id v9 = a1;
      sub_22BE03630((uint64_t)v8);
      v8(v9);
      sub_22BDE0E58((uint64_t)v8);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_2684867F8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_22BE925E8();
    __swift_project_value_buffer(v14, (uint64_t)qword_2684879E0);
    id v15 = a2;
    id v16 = a2;
    oslog = sub_22BE925C8();
    os_log_type_t v17 = sub_22BE93158();
    if (os_log_type_enabled(oslog, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      sub_22BDD8478(a4, a5, &v23);
      sub_22BE93408();
      *(_WORD *)(v18 + 12) = 2080;
      if (a2)
      {
        swift_getErrorValue();
        sub_22BE93988();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF002C0);
      uint64_t v20 = sub_22BE92CF8();
      sub_22BDD8478(v20, v21, &v23);
      sub_22BE93408();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22BDC5000, oslog, v17, a6, (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v19, -1, -1);
      MEMORY[0x230F57540](v18, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t DOCOpenLocationIntentActionResolver.deinit()
{
  swift_bridgeObjectRelease();
  sub_22BDE0E58(*(void *)(v0 + 48));
  sub_22BDE0E58(*(void *)(v0 + 64));
  sub_22BDE0E58(*(void *)(v0 + 80));
  return v0;
}

uint64_t DOCOpenLocationIntentActionResolver.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_22BDE0E58(*(void *)(v0 + 48));
  sub_22BDE0E58(*(void *)(v0 + 64));
  sub_22BDE0E58(*(void *)(v0 + 80));

  return swift_deallocClassInstance();
}

uint64_t sub_22BE85758@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 24);
  return result;
}

uint64_t sub_22BE857A0(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 24) = v2;
  return result;
}

uint64_t sub_22BE857E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for DOCOpenLocationIntentActionResolver()
{
  return self;
}

uint64_t method lookup function for DOCOpenLocationIntentActionResolver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCOpenLocationIntentActionResolver);
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.isCancelled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.isCancelled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.isCancelled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.locationIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.locationIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.locationIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.startResolving()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of DOCOpenLocationIntentActionResolver.cancelResolving()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

void sub_22BE85B10(void *a1, void *a2)
{
  sub_22BE85400(a1, a2, v2, 0xD00000000000001CLL, 0x800000022BEA62F0, "%s failed to get folder item: %s");
}

void sub_22BE85B4C(void *a1, void *a2)
{
  sub_22BE85400(a1, a2, v2, 0xD000000000000013, 0x800000022BEA6310, "%s failed to get downloads item: %s");
}

uint64_t sub_22BE85B88()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_22BE85C2C(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_22BE84B4C(a1, a2, v2 + v6, v7);
}

uint64_t sub_22BE85CD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BE85D10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_22BE85D48(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_22BE85D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t *, void *))(v3 + 16);
  v6[1] = a3;
  uint64_t v7 = a1;
  v6[0] = a2;
  return v4(&v7, v6);
}

uint64_t sub_22BE85DB8(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(v2 + 16))(*a1, *a2, a2[1]);
}

unint64_t sub_22BE85DEC()
{
  unint64_t result = qword_268488628;
  if (!qword_268488628)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268488628);
  }
  return result;
}

id FPItem.collaborationHighlight.getter()
{
  if (qword_26AEFFC28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v1 = (id)qword_26AEFFA60;
  id v2 = sub_22BDDA8C0(v0);

  return v2;
}

uint64_t FPItem.invitationURL.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AEFFC28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v3 = (id)qword_26AEFFA60;
  id v4 = sub_22BDDA8C0(v1);

  if (!v4) {
    goto LABEL_6;
  }
  if (objc_msgSend(v4, sel_highlightType))
  {

LABEL_6:
    uint64_t v5 = sub_22BE92198();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
  id v7 = objc_msgSend(v4, sel_slHighlight);
  id v8 = objc_msgSend(v7, sel_resourceURL);

  sub_22BE92168();
  uint64_t v9 = sub_22BE92198();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 0, 1, v9);
}

Swift::Bool __swiftcall FPItem.openInvitationIfPossible()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22BE92198();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(v0, sel_doc_isCollaborationInvitation)) {
    goto LABEL_9;
  }
  if (qword_26AEFFC28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v8 = (id)qword_26AEFFA60;
  id v9 = sub_22BDDA8C0(v0);

  if (!v9) {
    goto LABEL_7;
  }
  if (objc_msgSend(v9, sel_highlightType))
  {

LABEL_7:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
LABEL_8:
    sub_22BDFBCE4((uint64_t)v3);
LABEL_9:
    unsigned __int8 v10 = 0;
    goto LABEL_10;
  }
  id v12 = objc_msgSend(v9, sel_slHighlight);
  id v13 = objc_msgSend(v12, sel_resourceURL);

  sub_22BE92168();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  id v11 = objc_msgSend(self, sel_defaultWorkspace);
  if (!v11)
  {
    __break(1u);
    return (char)v11;
  }
  uint64_t v14 = v11;
  id v15 = (void *)sub_22BE92138();
  sub_22BE1ACF8(MEMORY[0x263F8EE78]);
  id v16 = (void *)sub_22BE92BE8();
  swift_bridgeObjectRelease();
  unsigned __int8 v10 = objc_msgSend(v14, sel_openURL_withOptions_, v15, v16);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_10:
  LOBYTE(v11) = v10;
  return (char)v11;
}

void FPItem.collaborationSenderDisplayName.getter()
{
  if (qword_26AEFFC28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v4 = (id)qword_26AEFFA60;
  id v5 = sub_22BDDA8C0(v0);

  if (!v5) {
    return;
  }
  id v6 = objc_msgSend(v5, sel_slHighlight);

  if (!v6) {
    return;
  }
  id v7 = objc_msgSend(v6, sel_attributions);
  sub_22BDD9D50(0, &qword_268488638);
  unint64_t v8 = sub_22BE92EB8();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    id v9 = (void *)sub_22BE937E8();
    swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_45;
    }
  }
  else
  {
    id v9 = *(void **)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9)
    {
LABEL_45:

      swift_bridgeObjectRelease();
      return;
    }
  }
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x230F56140](0, v8);
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    id v10 = *(id *)(v8 + 32);
  }
  id v9 = v10;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v9, sel_isGroupConversation))
  {
    id v11 = objc_msgSend(v9, sel_groupDisplayName);
    if (v11)
    {
      id v12 = v11;
LABEL_22:
      sub_22BE92CD8();

      return;
    }
  }
  if (!objc_msgSend(v9, sel_isFromMe))
  {
    id v29 = objc_msgSend(v9, sel_sender);
    id v12 = objc_msgSend(v29, sel_displayName);

    goto LABEL_22;
  }
  uint64_t v2 = &selRef_isUploading;
  id v13 = objc_msgSend(v9, sel_relatedPersons);
  uint64_t v1 = sub_22BDD9D50(0, &qword_268488640);
  unint64_t v14 = sub_22BE92EB8();

  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_16;
  }
LABEL_40:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_22BE937E8();
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  id v16 = [v9 v2[353]];
  unint64_t v17 = sub_22BE92EB8();

  if (v15 < 2)
  {
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_22BE937E8();
      swift_bridgeObjectRelease();
      if (v18)
      {
LABEL_25:
        if ((v17 & 0xC000000000000001) != 0)
        {
          id v30 = (id)MEMORY[0x230F56140](0, v17);
        }
        else
        {
          if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_49;
          }
          id v30 = *(id *)(v17 + 32);
        }
        uint64_t v31 = v30;
        swift_bridgeObjectRelease();
        id v32 = objc_msgSend(v31, sel_displayName);

        sub_22BE92CD8();
        return;
      }
    }
    else
    {
      unint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v18) {
        goto LABEL_25;
      }
    }

    swift_bridgeObjectRelease();
    return;
  }
  id v3 = v9;
  unint64_t v18 = sub_22BE869F8(v17, v3);
  swift_bridgeObjectRelease();

  if (qword_2684867F8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_22BE925E8();
  __swift_project_value_buffer(v19, (uint64_t)qword_2684879E0);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_22BE925C8();
  os_log_type_t v21 = sub_22BE93148();
  if (os_log_type_enabled(v20, v21))
  {
    char v22 = (uint8_t *)swift_slowAlloc();
    id v37 = v3;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v38 = v23;
    *(_DWORD *)char v22 = 136315138;
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x230F55980](v24, v1);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    sub_22BDD8478(v25, v27, &v38);
    sub_22BE93408();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22BDC5000, v20, v21, "xxxxxx isFromMe: relatedPersonsWithoutSender: %s", v22, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v23;
    id v3 = v37;
    MEMORY[0x230F57540](v28, -1, -1);
    MEMORY[0x230F57540](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!(v18 >> 62))
  {
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_32;
    }
    goto LABEL_44;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_22BE937E8();
  swift_bridgeObjectRelease();
  if (!v36)
  {
LABEL_44:

    goto LABEL_45;
  }
LABEL_32:
  if ((v18 & 0xC000000000000001) != 0)
  {
LABEL_49:
    id v33 = (id)MEMORY[0x230F56140](0, v18);
    goto LABEL_35;
  }
  if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v33 = *(id *)(v18 + 32);
LABEL_35:
    uint64_t v34 = v33;
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(v34, sel_displayName);

    sub_22BE92CD8();
    return;
  }
  __break(1u);
}

uint64_t sub_22BE869F8(unint64_t a1, void *a2)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x230F56140](v4, a1);
LABEL_9:
        id v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        id v8 = objc_msgSend(a2, sel_sender);
        sub_22BDD9D50(0, &qword_268488640);
        char v9 = sub_22BE93328();

        if (v9)
        {
        }
        else
        {
          sub_22BE936B8();
          sub_22BE936F8();
          sub_22BE93708();
          sub_22BE936C8();
        }
        ++v4;
        if (v7 == v3) {
          return v12;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_22BE937E8();
      if (!v3) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t UITraitCollection.doc_preferredValidatedLayoutSizeCategory(_:)@<X0>(uint64_t (*a1)(unsigned char *)@<X0>, unsigned char *a2@<X8>)
{
  id v5 = objc_msgSend(v2, sel_preferredContentSizeCategory);
  if (sub_22BE932D8())
  {
    char v6 = sub_22BE932E8();

    if (v6) {
      char v7 = 2;
    }
    else {
      char v7 = 1;
    }
  }
  else
  {

    char v7 = 0;
  }
  v14[1] = v7;
  uint64_t v8 = sub_22BE86C88();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    id v10 = (char *)(v8 + 32);
    while (1)
    {
      char v12 = *v10++;
      char v11 = v12;
      v14[0] = v12;
      if (a1(v14)) {
        break;
      }
      if (!--v9) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    char v11 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v11;
  return result;
}

BOOL DOCContentLayoutSizeCategory.isLargerThanRegularLayout.getter()
{
  return *v0 != 0;
}

uint64_t DOCContentLayoutSizeCategory.rawValue.getter()
{
  return *v0;
}

uint64_t sub_22BE86C88()
{
  if (*v0)
  {
    if (*v0 == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00508);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_22BE97A30;
      *(unsigned char *)(result + 32) = 1;
      uint64_t v2 = (unsigned char *)(result + 33);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00508);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_22BE9A3B0;
      *(_WORD *)(result + 32) = 258;
      uint64_t v2 = (unsigned char *)(result + 34);
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00508);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_22BE99770;
    uint64_t v2 = (unsigned char *)(result + 32);
  }
  *uint64_t v2 = 0;
  return result;
}

DocumentManagerExecutables::DOCContentLayoutSizeCategory_optional __swiftcall DOCContentLayoutSizeCategory.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (DocumentManagerExecutables::DOCContentLayoutSizeCategory_optional)rawValue;
}

DocumentManagerExecutables::DOCContentLayoutSizeCategory_optional sub_22BE86D4C(Swift::Int *a1)
{
  return DOCContentLayoutSizeCategory.init(rawValue:)(*a1);
}

unint64_t sub_22BE86D58()
{
  unint64_t result = qword_268488648;
  if (!qword_268488648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488648);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCContentLayoutSizeCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x22BE86E78);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_22BE86EA0()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE86F88()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE87094()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE87170()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE87214()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE872EC()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE87404()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE8750C()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE875F0()
{
  return sub_22BE93A48();
}

BOOL UTType.isClaimed(for:handlerRank:)(unsigned __int8 a1, uint64_t a2)
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  sub_22BE923A8();
  unsigned int v4 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_documentProxyForName_type_MIMEType_, 0, v4, 0);

  v15[0] = 0;
  id v6 = objc_msgSend(v5, sel_availableClaimBindingsForMode_handlerRank_error_, a1, a2, v15);
  id v7 = v15[0];
  if (v6)
  {
    uint64_t v8 = v6;
    sub_22BE8781C();
    unint64_t v9 = sub_22BE92EB8();
    id v10 = v7;

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_22BE937E8();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
    }
    return v11 != 0;
  }
  else
  {
    id v13 = v15[0];
    unint64_t v14 = (void *)sub_22BE92088();

    swift_willThrow();
    return 0;
  }
}

unint64_t sub_22BE8781C()
{
  unint64_t result = qword_2684883C0;
  if (!qword_2684883C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684883C0);
  }
  return result;
}

uint64_t URL.promisedContentType.getter()
{
  return sub_22BE897C0((uint64_t (*)(uint64_t))sub_22BE89B84);
}

uint64_t sub_22BE87898(uint64_t a1)
{
  return sub_22BDD0834(a1, qword_268488668);
}

uint64_t static UTType.docMobileConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDCFAF8(&qword_2684868E8, (uint64_t)qword_268488668, a1);
}

uint64_t sub_22BE878E0(uint64_t a1)
{
  return sub_22BDD0834(a1, qword_268488680);
}

uint64_t static UTType.docMobileProvision.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDCFAF8(&qword_2684868F0, (uint64_t)qword_268488680, a1);
}

uint64_t UTType.capitalizedSentenceLocalizedDescription.getter()
{
  uint64_t v1 = sub_22BE92428();
  if (v0)
  {
    unint64_t v2 = v0;
    swift_bridgeObjectRetain();
    sub_22BE89BA0(1, v1, v2, v3);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_22BE933C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_22BE89C3C(1uLL, v1, v2, v5);
    swift_bridgeObjectRelease();
    sub_22BE89CEC();
    swift_bridgeObjectRetain();
    sub_22BE92D78();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v4;
  }
  return v1;
}

uint64_t String.capitalizedSentence.getter(unint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_22BE89BA0(1, a1, a2, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_22BE933C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22BE89C3C(1uLL, a1, a2, v6);
  swift_bridgeObjectRelease();
  sub_22BE89CEC();
  swift_bridgeObjectRetain();
  sub_22BE92D78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22BE87B5C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268488750);
  uint64_t v0 = *(void *)(type metadata accessor for DOCDragPasteboardType() - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BE9DB80;
  unint64_t v4 = (unsigned char *)(v3 + v2);
  *unint64_t v4 = 0;
  swift_storeEnumTagMultiPayload();
  v4[v1] = 1;
  swift_storeEnumTagMultiPayload();
  v4[2 * v1] = 2;
  swift_storeEnumTagMultiPayload();
  sub_22BE92508();
  swift_storeEnumTagMultiPayload();
  sub_22BE92548();
  swift_storeEnumTagMultiPayload();
  sub_22BE923D8();
  swift_storeEnumTagMultiPayload();
  sub_22BE924E8();
  swift_storeEnumTagMultiPayload();
  sub_22BE92458();
  swift_storeEnumTagMultiPayload();
  sub_22BE92398();
  swift_storeEnumTagMultiPayload();
  sub_22BE92538();
  swift_storeEnumTagMultiPayload();
  sub_22BE92558();
  swift_storeEnumTagMultiPayload();
  sub_22BE923C8();
  uint64_t result = swift_storeEnumTagMultiPayload();
  qword_268488740 = v3;
  return result;
}

uint64_t DOCAcceptableDragPasteboardTypes.getter()
{
  if (qword_268486930 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

unint64_t DOCFPItemDragPasteboardType.typeIdentifier.getter()
{
  if (*v0) {
    return 0xD000000000000029;
  }
  else {
    return 0xD000000000000025;
  }
}

unint64_t DOCFPItemDragPasteboardType.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000029;
  }
  else {
    return 0xD000000000000025;
  }
}

DocumentManagerExecutables::DOCFPItemDragPasteboardType_optional __swiftcall DOCFPItemDragPasteboardType.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_22BE93858();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t sub_22BE87EF4(char *a1, unsigned __int8 *a2)
{
  return sub_22BE7C1E0(*a1, *a2);
}

uint64_t sub_22BE87F00()
{
  return sub_22BE87170();
}

uint64_t sub_22BE87F08()
{
  return sub_22BE806EC();
}

uint64_t sub_22BE87F10()
{
  return sub_22BE875F0();
}

DocumentManagerExecutables::DOCFPItemDragPasteboardType_optional sub_22BE87F18(Swift::String *a1)
{
  return DOCFPItemDragPasteboardType.init(rawValue:)(*a1);
}

unint64_t sub_22BE87F24@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DOCFPItemDragPasteboardType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t DOCDragPasteboardType.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB28);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BE92568();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DOCDragPasteboardType();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = a1;
  v16._object = a2;
  DOCFPItemDragPasteboardType.init(rawValue:)(v16);
  char v17 = v24;
  if (v24 != 3)
  {
    swift_bridgeObjectRelease();
    *uint64_t v15 = v17;
    uint64_t v19 = v23;
LABEL_6:
    swift_storeEnumTagMultiPayload();
    sub_22BE89D8C((uint64_t)v15, v19);
    uint64_t v20 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v19, v20, 1, v12);
  }
  sub_22BE92578();
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v19 = v23;
  if (v18 != 1)
  {
    os_log_type_t v21 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v21(v11, v7, v8);
    v21(v15, v11, v8);
    goto LABEL_6;
  }
  sub_22BE035C8((uint64_t)v7, &qword_26AEFFB28);
  uint64_t v20 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v19, v20, 1, v12);
}

unint64_t DOCDragPasteboardType.typeIdentifier.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22BE92568();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DOCDragPasteboardType();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BE89DF0(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, unsigned char *, uint64_t))(v3 + 32))(v5, v8, v2);
    uint64_t v9 = sub_22BE923A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v9 = 0xD000000000000029;
    if (!*v8) {
      return 0xD000000000000025;
    }
  }
  return v9;
}

uint64_t DOCDragPasteboardType.isFPItemFileOrLocation.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22BE92568();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v52 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  BOOL v51 = (char *)v45 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v45 - v8;
  uint64_t v10 = type metadata accessor for DOCDragPasteboardType();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v57 = (uint64_t)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v56 = (char *)v45 - v15;
  MEMORY[0x270FA5388](v14);
  char v17 = (unsigned __int8 *)v45 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268488750);
  uint64_t v18 = *(void *)(v11 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_22BE97A30;
  os_log_type_t v21 = (unsigned char *)(v20 + v19);
  *os_log_type_t v21 = 0;
  swift_storeEnumTagMultiPayload();
  uint64_t v58 = v18;
  uint64_t v59 = v21;
  v21[v18] = 1;
  swift_storeEnumTagMultiPayload();
  uint64_t v54 = (void (**)(char *, unsigned __int8 *, uint64_t))(v3 + 32);
  uint64_t v55 = (void (**)(char *, uint64_t))(v3 + 8);
  v45[1] = v20;
  swift_bridgeObjectRetain();
  int v22 = 0;
  uint64_t v23 = 0;
  unint64_t v47 = (unint64_t)"ntManager.FPItem.File";
  unint64_t v49 = 0x800000022BE9F050;
  unint64_t v50 = (unint64_t)"com.apple.icloud.applecorporate";
  unint64_t v46 = (unint64_t)"ntManager.FPItem.Location";
  unint64_t v48 = 0x800000022BE9F080;
  uint64_t v53 = v2;
  while (1)
  {
    while (1)
    {
      int v31 = v22;
      uint64_t v32 = (uint64_t)&v59[v23 * v58];
      sub_22BE89DF0(v1, (uint64_t)v17);
      if (swift_getEnumCaseMultiPayload() != 1) {
        break;
      }
      id v33 = *v54;
      (*v54)(v9, v17, v2);
      uint64_t v34 = v57;
      sub_22BE89DF0(v32, v57);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        char v24 = v52;
        v33(v52, (unsigned __int8 *)v34, v2);
        uint64_t v25 = v9;
        unint64_t v26 = v51;
        v33(v51, (unsigned __int8 *)v24, v2);
        int v27 = sub_22BE92528();
        uint64_t v2 = v53;
        int v28 = v27;
        id v29 = *v55;
        id v30 = v26;
        uint64_t v9 = v25;
        (*v55)(v30, v53);
        v29(v25, v2);
        uint64_t v23 = 1;
        int v22 = 1;
        if ((v28 | v31)) {
          goto LABEL_29;
        }
      }
      else
      {
        sub_22BE89E54(v34);
        (*v55)(v9, v2);
LABEL_8:
        uint64_t v23 = 1;
        int v22 = 1;
        if (v31)
        {
          LOBYTE(v28) = 0;
          goto LABEL_29;
        }
      }
    }
    int v35 = *v17;
    uint64_t v36 = v32;
    id v37 = v56;
    sub_22BE89DF0(v36, (uint64_t)v56);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22BE89E54((uint64_t)v37);
      goto LABEL_8;
    }
    uint64_t v38 = v1;
    if (v35)
    {
      unint64_t v39 = v35 == 1 ? v47 | 0x8000000000000000 : v46 | 0x8000000000000000;
      unint64_t v40 = 0xD000000000000029;
    }
    else
    {
      unint64_t v40 = 0xD000000000000025;
      unint64_t v39 = v50 | 0x8000000000000000;
    }
    unint64_t v41 = v49;
    if (*v37 != 1) {
      unint64_t v41 = v48;
    }
    unint64_t v42 = *v37 ? 0xD000000000000029 : 0xD000000000000025;
    unint64_t v43 = *v37 ? v41 : v50 | 0x8000000000000000;
    if (v40 == v42 && v39 == v43) {
      break;
    }
    int v28 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v22 = 1;
    uint64_t v23 = 1;
    uint64_t v1 = v38;
    uint64_t v2 = v53;
    if ((v28 | v31)) {
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease_n();
  LOBYTE(v28) = 1;
LABEL_29:
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v28 & 1;
}

Swift::Bool __swiftcall DOCDragPasteboardType.conformsToAnyOf(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22BE92568();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v52 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  BOOL v51 = (char *)v42 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)v42 - v10;
  uint64_t v11 = type metadata accessor for DOCDragPasteboardType();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v58 = (unsigned __int8 *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v42 - v15;
  MEMORY[0x270FA5388](v14);
  unint64_t v19 = (unsigned __int8 *)v42 - v18;
  uint64_t v20 = *((void *)a1._rawValue + 2);
  if (!v20) {
    return 0;
  }
  rawValue = a1._rawValue;
  int v22 = (char *)a1._rawValue
      + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  uint64_t v55 = *(void *)(v17 + 72);
  uint64_t v23 = (void (**)(char *, unsigned __int8 *, uint64_t))(v5 + 32);
  uint64_t v53 = (void (**)(char *, uint64_t))(v5 + 8);
  v42[1] = rawValue;
  swift_bridgeObjectRetain();
  unint64_t v44 = (unint64_t)"ntManager.FPItem.File";
  uint64_t v45 = v2;
  unint64_t v47 = 0x800000022BE9F050;
  unint64_t v48 = (unint64_t)"com.apple.icloud.applecorporate";
  unint64_t v43 = (unint64_t)"ntManager.FPItem.Location";
  unint64_t v46 = 0x800000022BE9F080;
  uint64_t v56 = v4;
  uint64_t v54 = (void (**)(char *, unsigned __int8 *, uint64_t))(v5 + 32);
  unint64_t v49 = v16;
  uint64_t v50 = v11;
  while (1)
  {
    sub_22BE89DF0(v2, (uint64_t)v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      char v24 = *v23;
      (*v23)(v57, v19, v4);
      sub_22BE89DF0((uint64_t)v22, (uint64_t)v58);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v25 = v57;
        unint64_t v26 = v52;
        v24(v52, v58, v4);
        uint64_t v27 = v2;
        int v28 = v51;
        v24(v51, (unsigned __int8 *)v26, v4);
        id v29 = v25;
        char v30 = sub_22BE92528();
        int v31 = *v53;
        uint64_t v32 = v28;
        uint64_t v2 = v27;
        uint64_t v16 = v49;
        (*v53)(v32, v56);
        v31(v29, v56);
        uint64_t v4 = v56;
        if (v30) {
          goto LABEL_32;
        }
      }
      else
      {
        sub_22BE89E54((uint64_t)v58);
        (*v53)(v57, v4);
      }
      goto LABEL_4;
    }
    int v33 = *v19;
    sub_22BE89DF0((uint64_t)v22, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22BE89E54((uint64_t)v16);
      goto LABEL_4;
    }
    if (v33)
    {
      unint64_t v34 = v33 == 1 ? v44 | 0x8000000000000000 : v43 | 0x8000000000000000;
      unint64_t v35 = 0xD000000000000029;
    }
    else
    {
      unint64_t v35 = 0xD000000000000025;
      unint64_t v34 = v48 | 0x8000000000000000;
    }
    unint64_t v36 = v47;
    if (*v16 != 1) {
      unint64_t v36 = v46;
    }
    unint64_t v37 = *v16 ? 0xD000000000000029 : 0xD000000000000025;
    unint64_t v38 = *v16 ? v36 : v48 | 0x8000000000000000;
    if (v35 == v37 && v34 == v38) {
      break;
    }
    char v39 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v45;
    uint64_t v4 = v56;
    if (v39) {
      goto LABEL_32;
    }
LABEL_4:
    uint64_t v23 = v54;
    v22 += v55;
    if (!--v20)
    {
      Swift::Bool v40 = 0;
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_32:
  Swift::Bool v40 = 1;
LABEL_33:
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t DOCDragPasteboardType.conforms(to:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = sub_22BE92568();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v32 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = type metadata accessor for DOCDragPasteboardType();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v32 - v18;
  MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (unsigned __int8 *)&v32 - v20;
  sub_22BE89DF0(v2, (uint64_t)&v32 - v20);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    int v25 = *v21;
    sub_22BE89DF0(v33, (uint64_t)v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22BE89E54((uint64_t)v19);
LABEL_7:
      char v23 = 0;
      return v23 & 1;
    }
    unint64_t v26 = 0x800000022BE9F020;
    if (v25)
    {
      if (v25 == 1) {
        uint64_t v27 = "com.apple.DocumentManager.FPItem.Location";
      }
      else {
        uint64_t v27 = "com.apple.DocumentManager.FPItem.Favorite";
      }
      unint64_t v29 = (unint64_t)(v27 - 32) | 0x8000000000000000;
      unint64_t v28 = 0xD000000000000029;
      if (*v19)
      {
LABEL_16:
        if (*v19 == 1) {
          char v30 = "com.apple.DocumentManager.FPItem.Location";
        }
        else {
          char v30 = "com.apple.DocumentManager.FPItem.Favorite";
        }
        unint64_t v26 = (unint64_t)(v30 - 32) | 0x8000000000000000;
        if (v28 != 0xD000000000000029) {
          goto LABEL_22;
        }
LABEL_20:
        if (v29 == v26)
        {
          swift_bridgeObjectRelease_n();
          char v23 = 1;
          return v23 & 1;
        }
LABEL_22:
        char v23 = sub_22BE938C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v23 & 1;
      }
    }
    else
    {
      unint64_t v28 = 0xD000000000000025;
      unint64_t v29 = 0x800000022BE9F020;
      if (*v19) {
        goto LABEL_16;
      }
    }
    if (v28 != 0xD000000000000025) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  int v22 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v4 + 32);
  v22(v12, v21, v3);
  sub_22BE89DF0(v33, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_22BE89E54((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
    goto LABEL_7;
  }
  v22(v7, (unsigned __int8 *)v16, v3);
  v22(v10, (unsigned __int8 *)v7, v3);
  char v23 = sub_22BE92528();
  char v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  v24(v10, v3);
  v24(v12, v3);
  return v23 & 1;
}

Swift::Bool __swiftcall String.conformsToAnyOf(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = v2;
  uint64_t v64 = v1;
  rawValue = a1._rawValue;
  uint64_t v4 = sub_22BE92568();
  id v60 = *(void (***)(char *, uint64_t))(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v48 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v65 = (char *)&v48 - v11;
  uint64_t v12 = type metadata accessor for DOCDragPasteboardType();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v48 - v18;
  MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (char *)&v48 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268488758);
  MEMORY[0x270FA5388](v22 - 8);
  char v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  DOCDragPasteboardType.init(_:)(v64, v3, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v24, 1, v12) == 1)
  {
    sub_22BE035C8((uint64_t)v24, &qword_268488758);
    return 0;
  }
  unint64_t v26 = v60;
  uint64_t v62 = (unsigned __int8 *)v21;
  uint64_t v63 = v19;
  uint64_t v59 = v16;
  uint64_t v57 = v10;
  uint64_t v27 = rawValue[2];
  if (!v27)
  {
    Swift::Bool v25 = 0;
    goto LABEL_36;
  }
  uint64_t v55 = v7;
  uint64_t v28 = (uint64_t)rawValue
      + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v64 = *(void *)(v13 + 72);
  ++v60;
  uint64_t v61 = (void (**)(char *, unsigned __int8 *, uint64_t))(v26 + 4);
  swift_bridgeObjectRetain();
  unint64_t v58 = 0xD000000000000025;
  unint64_t v49 = (unint64_t)"ntManager.FPItem.File";
  uint64_t v50 = v4;
  unint64_t v52 = 0x800000022BE9F050;
  unint64_t v53 = (unint64_t)"com.apple.icloud.applecorporate";
  unint64_t v48 = (unint64_t)"ntManager.FPItem.Location";
  unint64_t v51 = 0x800000022BE9F080;
  uint64_t v29 = (uint64_t)v59;
  char v30 = v62;
  uint64_t v31 = (uint64_t)v63;
  uint64_t v54 = v24;
  while (1)
  {
    sub_22BE89DF0((uint64_t)v24, (uint64_t)v30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = *v61;
      (*v61)(v65, v30, v4);
      sub_22BE89DF0(v28, v29);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v33 = (unsigned __int8 *)v55;
        v32(v55, (unsigned __int8 *)v29, v4);
        unint64_t v34 = v65;
        unint64_t v35 = v57;
        v32(v57, v33, v4);
        char v36 = sub_22BE92528();
        unint64_t v37 = *v60;
        unint64_t v38 = v35;
        char v39 = v34;
        char v24 = v54;
        uint64_t v29 = (uint64_t)v59;
        (*v60)(v38, v4);
        v37(v39, v4);
        char v30 = v62;
        uint64_t v31 = (uint64_t)v63;
        if (v36) {
          goto LABEL_34;
        }
      }
      else
      {
        sub_22BE89E54(v29);
        (*v60)(v65, v4);
        char v30 = v62;
      }
      goto LABEL_6;
    }
    int v40 = *v30;
    sub_22BE89DF0(v28, v31);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22BE89E54(v31);
      goto LABEL_6;
    }
    if (v40)
    {
      unint64_t v41 = v40 == 1 ? v49 | 0x8000000000000000 : v48 | 0x8000000000000000;
      unint64_t v42 = 0xD000000000000029;
    }
    else
    {
      unint64_t v42 = v58;
      unint64_t v41 = v53 | 0x8000000000000000;
    }
    unint64_t v43 = v52;
    if (*v63 != 1) {
      unint64_t v43 = v51;
    }
    unint64_t v44 = *v63 ? 0xD000000000000029 : v58;
    unint64_t v45 = *v63 ? v43 : v53 | 0x8000000000000000;
    if (v42 == v44 && v41 == v45) {
      break;
    }
    char v46 = sub_22BE938C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v50;
    uint64_t v31 = (uint64_t)v63;
    if (v46) {
      goto LABEL_34;
    }
LABEL_6:
    v28 += v64;
    if (!--v27)
    {
      Swift::Bool v25 = 0;
      goto LABEL_35;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_34:
  Swift::Bool v25 = 1;
LABEL_35:
  swift_bridgeObjectRelease();
LABEL_36:
  sub_22BE89E54((uint64_t)v24);
  return v25;
}

uint64_t URL.contentType.getter()
{
  return sub_22BE897C0((uint64_t (*)(uint64_t))sub_22BE89EB0);
}

uint64_t sub_22BE89620@<X0>(uint64_t a1@<X8>)
{
  v11[7] = a1;
  uint64_t v2 = sub_22BE91F98();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = sub_22BE92178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268488778);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22BE99770;
  uint64_t v8 = (void *)*MEMORY[0x263EFF608];
  *(void *)(inited + 32) = *MEMORY[0x263EFF608];
  id v9 = v8;
  sub_22BE10464(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_22BE92118();
  if (v1)
  {
    uint64_t result = swift_bridgeObjectRelease();
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_22BE91F88();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  return sub_22BE92158();
}

uint64_t sub_22BE897C0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22BE92568();
  uint64_t v11 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_22BE92198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v2, v5);
  char v9 = sub_22BE920D8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v9) {
    return a1(result);
  }
  __break(1u);
  return result;
}

uint64_t sub_22BE89A0C()
{
  uint64_t v1 = sub_22BE91F98();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268488778);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22BE99770;
  uint64_t v6 = (void *)*MEMORY[0x263EFF608];
  *(void *)(inited + 32) = *MEMORY[0x263EFF608];
  id v7 = v6;
  sub_22BE10464(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_22BE92148();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_22BE91F88();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_22BE89B84()
{
  return sub_22BE89A0C();
}

uint64_t sub_22BE89BA0(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_22BE92D68();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_22BE89C3C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
  }
  unint64_t v4 = a3;
  unint64_t v5 = a2;
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v7 = 11;
  }
  unint64_t v8 = v7 | (v6 << 16);
  a1 = sub_22BE92D68();
  if (a2) {
    a1 = v8;
  }
  if (4 * v6 < a1 >> 14) {
    goto LABEL_14;
  }
  a2 = v8;
  a3 = v5;
  a4 = v4;

  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

unint64_t sub_22BE89CEC()
{
  unint64_t result = qword_268488748;
  if (!qword_268488748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488748);
  }
  return result;
}

uint64_t type metadata accessor for DOCDragPasteboardType()
{
  uint64_t result = qword_268488768;
  if (!qword_268488768) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BE89D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BE89DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BE89E54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BE89EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BE89620(a1);
}

unint64_t sub_22BE89ED0()
{
  unint64_t result = qword_268488760;
  if (!qword_268488760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488760);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCFPItemDragPasteboardType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x22BE89FF0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCFPItemDragPasteboardType()
{
  return &type metadata for DOCFPItemDragPasteboardType;
}

uint64_t *initializeBufferWithCopyOfBuffer for DOCDragPasteboardType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_22BE91C58();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22BE92568();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for DOCDragPasteboardType(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_22BE92568();
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22BE92568();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22BE89E54((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22BE92568();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22BE92568();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22BE89E54((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22BE92568();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DOCDragPasteboardType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DOCDragPasteboardType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_22BE8A4F4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22BE8A504()
{
  uint64_t result = sub_22BE92568();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t String.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  if (a1 == 2)
  {
    if (qword_268486718 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487240;
  }
  else if (a1 == 1)
  {
    if (qword_268486710 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487238;
  }
  else
  {
    if (a1)
    {
      uint64_t result = sub_22BE93908();
      __break(1u);
      return result;
    }
    if (qword_268486720 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487248;
  }
  uint64_t v2 = (uint64_t *)(*v1 + OBJC_IVAR____TtC26DocumentManagerExecutables10DOCUnicode_rawValue);
  swift_beginAccess();
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  sub_22BE92D88();
  if (qword_268486728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22BE92D88();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t DOCUnicode.DOCUnicodeLayoutDirection.init(_:)(uint64_t a1)
{
  if (a1 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

unint64_t DOCUnicode.DOCUnicodeLayoutDirection.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t static DOCUnicode.layoutDirection(forUIDirection:)(uint64_t a1)
{
  if (a1 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t BidiDirectionalIsolationReturning.wrappedInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 1) {
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(2);
  }
  else {
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(1);
  }
}

uint64_t BidiDirectionalIsolationUpdating.wrapInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 1) {
    return (*(uint64_t (**)(uint64_t))(a3 + 8))(2);
  }
  else {
    return (*(uint64_t (**)(uint64_t))(a3 + 8))(1);
  }
}

uint64_t String.wrapInDirectionalIsolation(_:)(uint64_t a1)
{
  if (a1 == 2)
  {
    if (qword_268486718 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487240;
  }
  else if (a1 == 1)
  {
    if (qword_268486710 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487238;
  }
  else
  {
    if (a1)
    {
      uint64_t result = sub_22BE93908();
      __break(1u);
      return result;
    }
    if (qword_268486720 != -1) {
      swift_once();
    }
    unint64_t v1 = &qword_268487248;
  }
  uint64_t v2 = (void *)*v1;
  swift_beginAccess();
  id v3 = v2;
  swift_bridgeObjectRetain();
  sub_22BE92E08();
  sub_22BE420D0();
  sub_22BE92D98();

  swift_bridgeObjectRelease();
  if (qword_268486728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22BE92E08();
  sub_22BE92D88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE8AA44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = String.wrappedInDirectionalIsolation(_:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t NSString.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  sub_22BE92CD8();
  if (a1 == 2)
  {
    if (qword_268486718 == -1) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (a1 == 1)
  {
    if (qword_268486710 == -1) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (a1)
  {
    uint64_t result = sub_22BE93908();
    __break(1u);
    return result;
  }
  if (qword_268486720 != -1) {
LABEL_12:
  }
    swift_once();
LABEL_9:
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22BE92D88();
  if (qword_268486728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22BE92D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_22BE92C98();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_22BE8AC8C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = NSString.wrappedInDirectionalIsolation(_:)(a3);

  return v5;
}

uint64_t NSAttributedString.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089B8]), sel_init);
  if (a1 == 2)
  {
    if (qword_268486718 != -1) {
      swift_once();
    }
    id v4 = &qword_268487240;
  }
  else if (a1 == 1)
  {
    if (qword_268486710 != -1) {
      swift_once();
    }
    id v4 = &qword_268487238;
  }
  else
  {
    if (a1)
    {
      uint64_t result = sub_22BE93908();
      __break(1u);
      return result;
    }
    if (qword_268486720 != -1) {
      swift_once();
    }
    id v4 = &qword_268487248;
  }
  int v5 = (void *)*v4;
  id v6 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_beginAccess();
  id v7 = v5;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithString_, v8);

  objc_msgSend(v3, sel_appendAttributedString_, v9);
  objc_msgSend(v3, sel_appendAttributedString_, v1);
  if (qword_268486728 != -1) {
    swift_once();
  }
  char v10 = (void *)qword_268487250;
  id v11 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_beginAccess();
  id v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v11, sel_initWithString_, v13);

  objc_msgSend(v3, sel_appendAttributedString_, v14);
  return (uint64_t)v3;
}

id sub_22BE8AF90(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = NSAttributedString.wrappedInDirectionalIsolation(_:)(a3);

  return v5;
}

id sub_22BE8AFDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*v2, sel_wrappedInDirectionalIsolation_, a1);
  *a2 = result;
  return result;
}

void NSMutableAttributedString.wrapInDirectionalIsolation(_:)(uint64_t a1)
{
  if (a1 == 2)
  {
    if (qword_268486718 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_268487240;
  }
  else if (a1 == 1)
  {
    if (qword_268486710 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_268487238;
  }
  else
  {
    if (a1)
    {
      sub_22BE93908();
      __break(1u);
      return;
    }
    if (qword_268486720 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_268487248;
  }
  id v3 = (void *)*v2;
  id v4 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_beginAccess();
  id v5 = v3;
  swift_bridgeObjectRetain();
  id v6 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithString_, v6);

  objc_msgSend(v1, sel_insertAttributedString_atIndex_, v7, 0);
  if (qword_268486728 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_268487250;
  id v9 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_beginAccess();
  id v10 = v8;
  swift_bridgeObjectRetain();
  id v11 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithString_, v11);

  objc_msgSend(v1, sel_appendAttributedString_, v12);
}

unint64_t sub_22BE8B2A4()
{
  unint64_t result = qword_268488780;
  if (!qword_268488780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488780);
  }
  return result;
}

void sub_22BE8B2F8(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  NSMutableAttributedString.wrapInDirectionalIsolation(_:)(a3);
}

id sub_22BE8B34C(uint64_t a1)
{
  return objc_msgSend(*v1, sel_wrapInDirectionalIsolation_, a1);
}

ValueMetadata *type metadata accessor for DOCUnicode.DOCUnicodeLayoutDirection()
{
  return &type metadata for DOCUnicode.DOCUnicodeLayoutDirection;
}

uint64_t dispatch thunk of BidiDirectionalIsolationReturning.wrappedInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of BidiDirectionalIsolationUpdating.wrapInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t UIStackView.doc_addFlexiblySpacedArrangedSubviews(_:minSpacing:maxSpacing:)(uint64_t a1, double a2, double a3)
{
  id v6 = v4;
  unint64_t v9 = a1;
  unint64_t v10 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      id v3 = (void *)a1;
    }
    else {
      id v3 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22BE937E8();
    if (v11)
    {
LABEL_3:
      if ((v9 & 0xC000000000000001) != 0)
      {
        id v12 = (id)MEMORY[0x230F56140](0, v9);
      }
      else
      {
        if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_63;
        }
        id v12 = *(id *)(v9 + 32);
      }
      id v3 = v12;
      swift_bridgeObjectRelease();
      if (a2 < 0.0) {
        a2 = 0.0;
      }
      if (a2 > a3) {
        double v13 = a2;
      }
      else {
        double v13 = a3;
      }
      if (a3 >= 0.0) {
        double v14 = v13;
      }
      else {
        double v14 = 1.79769313e308;
      }
      id v5 = &selRef_isUploading;
      uint64_t result = (uint64_t)objc_msgSend(v6, sel_addArrangedSubview_, v3, v13);
      unint64_t v45 = MEMORY[0x263F8EE78];
      if (v11 < 0) {
        goto LABEL_78;
      }
      if (!v10)
      {
        uint64_t v16 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t result = swift_bridgeObjectRetain();
        if (!v16) {
          goto LABEL_63;
        }
LABEL_20:
        if (v16 >= v11)
        {
          if ((v9 & 0xC000000000000001) != 0 && v11 != 1)
          {
            sub_22BDD9D50(0, &qword_26AF004C8);
            uint64_t result = 1;
            do
            {
              uint64_t v17 = result + 1;
              sub_22BE93668();
              uint64_t result = v17;
            }
            while (v11 != v17);
          }
          if (v10)
          {
            swift_bridgeObjectRetain();
            sub_22BE937F8();
            uint64_t v18 = v21;
            uint64_t v19 = v22;
            unint64_t v20 = v23;
            uint64_t result = swift_bridgeObjectRelease_n();
          }
          else
          {
            uint64_t v18 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
            uint64_t v19 = 1;
            unint64_t v20 = (2 * v11) | 1;
          }
          unint64_t v24 = (v20 >> 1) - v19;
          if (v20 >> 1 == v19)
          {
            swift_unknownObjectRelease();
            unint64_t v9 = MEMORY[0x263F8EE78];
          }
          else
          {
            if ((uint64_t)(v20 >> 1) <= v19)
            {
LABEL_77:
              __break(1u);
LABEL_78:
              __break(1u);
              goto LABEL_79;
            }
            swift_unknownObjectRetain();
            Swift::Bool v25 = (id *)(v18 + 8 * v19);
            do
            {
              id v26 = *v25;
              id v27 = sub_22BE8B95C(a2, v14);
              MEMORY[0x230F55950]();
              if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_22BE92EF8();
              }
              sub_22BE92F48();
              sub_22BE92ED8();
              objc_msgSend(v6, sel_addArrangedSubview_, v27);
              objc_msgSend(v6, sel_addArrangedSubview_, v26);

              ++v25;
              --v24;
            }
            while (v24);
            swift_unknownObjectRelease_n();
            unint64_t v9 = v45;
          }
          id v5 = (char **)(v9 >> 62);
          if (!(v9 >> 62))
          {
            uint64_t v28 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
            uint64_t result = swift_bridgeObjectRetain();
            if (!v28)
            {
LABEL_66:

              return swift_bridgeObjectRelease_n();
            }
LABEL_38:
            if ((v9 & 0xC000000000000001) != 0)
            {
              id v29 = (id)MEMORY[0x230F56140](0, v9);
            }
            else
            {
              if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
LABEL_76:
                __break(1u);
                goto LABEL_77;
              }
              id v29 = *(id *)(v9 + 32);
            }
            char v30 = v29;
            swift_bridgeObjectRelease();
            if (v5)
            {
              swift_bridgeObjectRetain_n();
              uint64_t v31 = sub_22BE937E8();
              uint64_t result = swift_bridgeObjectRelease();
              if (v31 < 0)
              {
LABEL_79:
                __break(1u);
                return result;
              }
              if (v31 >= 1) {
                uint64_t v32 = 1;
              }
              else {
                uint64_t v32 = v31;
              }
              swift_bridgeObjectRetain();
              uint64_t v43 = sub_22BE937E8();
              uint64_t result = swift_bridgeObjectRelease();
              if (v43 >= v32)
              {
                swift_bridgeObjectRetain();
                uint64_t v44 = sub_22BE937E8();
                uint64_t result = swift_bridgeObjectRelease();
                if (v44 >= v31)
                {
LABEL_46:
                  if ((v9 & 0xC000000000000001) != 0 && (unint64_t)v31 >= 2)
                  {
                    sub_22BDD9D50(0, &qword_26AF004C8);
                    uint64_t v33 = v32;
                    do
                    {
                      uint64_t v34 = v33 + 1;
                      sub_22BE93668();
                      uint64_t v33 = v34;
                    }
                    while (v31 != v34);
                  }
                  if (v5)
                  {
                    swift_bridgeObjectRetain();
                    sub_22BE937F8();
                    uint64_t v35 = v37;
                    uint64_t v32 = v38;
                    unint64_t v36 = v39;
                    swift_bridgeObjectRelease_n();
                  }
                  else
                  {
                    uint64_t v35 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
                    unint64_t v36 = (2 * v31) | 1;
                  }
                  int v40 = self;
                  id v41 = v30;
                  sub_22BE8BBE8(v35, v32, v36, v41);
                  swift_unknownObjectRelease();

                  sub_22BDD9D50(0, &qword_268487268);
                  unint64_t v42 = (void *)sub_22BE92EA8();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v40, sel_activateConstraints_, v42);

                  return swift_bridgeObjectRelease();
                }
                __break(1u);
              }
            }
            else
            {
              uint64_t v31 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
              if (v31 >= 1) {
                uint64_t v32 = 1;
              }
              else {
                uint64_t v32 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              uint64_t result = swift_bridgeObjectRetain();
              if (v31 >= (unint64_t)v32) {
                goto LABEL_46;
              }
            }
            __break(1u);
            goto LABEL_76;
          }
LABEL_65:
          swift_bridgeObjectRetain();
          uint64_t result = sub_22BE937E8();
          if (!result) {
            goto LABEL_66;
          }
          goto LABEL_38;
        }
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      swift_bridgeObjectRetain();
      if (sub_22BE937E8() >= 1)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_22BE937E8();
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_20;
      }
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
  }

  return swift_bridgeObjectRelease();
}

id sub_22BE8B95C(double a1, double a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v5) = 1144750080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 0, v5);
  LODWORD(v6) = 1132068864;
  objc_msgSend(v4, sel_setContentCompressionResistancePriority_forAxis_, 0, v6);
  id v7 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00560);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22BE9D4A0;
  id v9 = objc_msgSend(v4, sel_heightAnchor);
  id v10 = objc_msgSend(v9, sel_constraintGreaterThanOrEqualToConstant_, 1.0);

  *(void *)(v8 + 32) = v10;
  id v11 = objc_msgSend(v4, sel_widthAnchor);
  id v12 = objc_msgSend(v11, sel_constraintGreaterThanOrEqualToConstant_, a1);

  *(void *)(v8 + 40) = v12;
  id v13 = objc_msgSend(v4, sel_widthAnchor);
  id v14 = objc_msgSend(v13, sel_constraintLessThanOrEqualToConstant_, a2);

  *(void *)(v8 + 48) = v14;
  sub_22BE92ED8();
  sub_22BDD9D50(0, &qword_268487268);
  uint64_t v15 = (void *)sub_22BE92EA8();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v15);

  return v4;
}

uint64_t sub_22BE8BB5C(void *a1, double a2, double a3)
{
  sub_22BDD9D50(0, &qword_26AF004C8);
  uint64_t v6 = sub_22BE92EB8();
  id v7 = a1;
  UIStackView.doc_addFlexiblySpacedArrangedSubviews(_:minSpacing:maxSpacing:)(v6, a2, a3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BE8BBE8(uint64_t result, uint64_t a2, unint64_t a3, void *a4)
{
  int64_t v14 = a3 >> 1;
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_13;
  }
  uint64_t v5 = result;
  uint64_t result = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22BE936E8();
    if (v4 < 0)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    uint64_t v7 = v5 + 8 * a2;
    while (1)
    {
      uint64_t v8 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      if (a2 + v6 >= v14 || v6 >= v4) {
        goto LABEL_12;
      }
      id v9 = *(id *)(v7 + 8 * v6);
      id v10 = objc_msgSend(v9, sel_widthAnchor);
      id v11 = objc_msgSend(a4, sel_widthAnchor);
      id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

      sub_22BE936B8();
      sub_22BE936F8();
      sub_22BE93708();
      uint64_t result = sub_22BE936C8();
      ++v6;
      if (v8 == v4) {
        return v16;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_22BE8BD58()
{
  sub_22BDD9D50(0, (unint64_t *)&qword_26AF004D0);
  uint64_t result = sub_22BE933A8();
  qword_26AEFFA80 = result;
  return result;
}

id updateLogHandler.getter()
{
  return sub_22BDCD8A4(&qword_26AEFFFB0, (void **)&qword_26AEFFA80);
}

uint64_t sub_22BE8BDF8()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE8BE3C()
{
  return sub_22BE93A08();
}

uint64_t sub_22BE8BE64()
{
  return sub_22BE93A48();
}

void sub_22BE8BEA4(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

void sub_22BE8BF08(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22BE8BF5C())()
{
  return j__swift_endAccess;
}

uint64_t sub_22BE8BFB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_22BE30DFC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_22BE03630(v4);
}

uint64_t sub_22BE8C058(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_22BE30DC4;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_22BE03630(v3);
  return sub_22BDE0E58(v8);
}

uint64_t sub_22BE8C120()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_22BE03630(*v1);
  return v2;
}

uint64_t sub_22BE8C17C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_22BDE0E58(v6);
}

uint64_t (*sub_22BE8C1DC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22BE8C238(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode] = 0;
  uint64_t v2 = &v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer;
  *(void *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer] = 0;
  uint64_t v4 = OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer;
  *(void *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer] = 0;
  uint64_t v5 = *(void **)&v1[v3];
  uint64_t v6 = v1;

  uint64_t v7 = *(void **)&v1[v4];
  type metadata accessor for DOCICloudRootNode();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_22BE8C2FC(uint64_t a1)
{
  uint64_t v2 = sub_22BE92B08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BE92B58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v33[14] = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BE92AD8();
  v33[10] = *(void *)(v9 - 8);
  v33[11] = v9;
  MEMORY[0x270FA5388](v9);
  v33[9] = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_22BE92B78();
  v33[13] = *(void *)(v34 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v34);
  v33[8] = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v33[12] = (char *)v33 - v13;
  uint64_t v14 = sub_22BE925B8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x230F57630](a1 + 16);
  if (v18)
  {
    uint64_t v19 = (char *)v18;
    v33[5] = v3;
    if (qword_268486868 != -1) {
      swift_once();
    }
    v33[2] = v7;
    v33[3] = v5;
    uint64_t v20 = sub_22BE925E8();
    v33[7] = __swift_project_value_buffer(v20, (uint64_t)qword_268487B30);
    uint64_t v21 = sub_22BE925C8();
    os_log_type_t v22 = sub_22BE93178();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_22BDC5000, v21, v22, "DOCICloudRootNode Managed: building containers...", v23, 2u);
      MEMORY[0x230F57540](v23, -1, -1);
    }
    v33[4] = v6;
    v33[6] = v2;

    sub_22BE93298();
    if (qword_26AF00228 != -1) {
      swift_once();
    }
    sub_22BE925A8();
    sub_22BE92598();
    unint64_t v24 = *(void (**)(char *, uint64_t))(v15 + 8);
    v24(v17, v14);
    Swift::Bool v25 = self;
    id v26 = objc_msgSend(v25, sel_dataSeparatedICloudDefaultContainer);
    id v27 = *(void **)&v19[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
    *(void *)&v19[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer] = v26;

    id v28 = objc_msgSend(v25, sel_dataSeparatedICloudLibrariesContainer);
    id v29 = *(void **)&v19[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer];
    *(void *)&v19[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer] = v28;

    sub_22BE93288();
    sub_22BE925A8();
    sub_22BE92598();
    v24(v17, v14);
    sub_22BDCFDD4();
    char v30 = sub_22BE925C8();
    os_log_type_t v31 = sub_22BE93178();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_22BDC5000, v30, v31, "DOCICloudRootNode Managed: finished building containers...", v32, 2u);
      MEMORY[0x230F57540](v32, -1, -1);
    }
    else
    {
    }
  }
}

void sub_22BE8CC04(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230F57630](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_22BDD7244();
  }
}

id DOCICloudRootNode.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void DOCICloudRootNode.init()()
{
}

id DOCICloudRootNode.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DOCICloudRootNode();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void DOCICloudRootNode.identifier.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_identifier);
    sub_22BE934B8();
    swift_unknownObjectRelease();
    sub_22BDDBF3C(&v7, (_OWORD *)a1);
  }
  else
  {
    id v5 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain), sel_identifier);
    type metadata accessor for FPProviderDomainID(0);
    *(void *)(a1 + 24) = v6;
    *(void *)a1 = v5;
  }
}

uint64_t DOCICloudRootNode.identifierKey.getter()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  sub_22BE934B8();
  swift_unknownObjectRelease();
  return swift_dynamicCast();
}

id DOCICloudRootNode.fpfs_fpItem.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_fpfs_fpItem);
}

uint64_t DOCICloudRootNode.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22BE92568();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = *(void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v7)
  {
    id v8 = objc_msgSend(v7, sel_contentType);
    sub_22BE92438();

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
  }
  else
  {
    return sub_22BE92478();
  }
}

uint64_t DOCICloudRootNode.typeIdentifier.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1) {
    return 0x692E63696C627570;
  }
  id v2 = objc_msgSend(v1, sel_typeIdentifier);
  uint64_t v3 = sub_22BE92CD8();

  return v3;
}

id DOCICloudRootNode.fileSize.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_fileSize);
}

id DOCICloudRootNode.childItemCount.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_childItemCount);
}

id DOCICloudRootNode.providerDomainID.getter()
{
  return sub_22BE8D1C0((SEL *)&selRef_providerDomainID, (SEL *)&selRef_identifier);
}

id DOCICloudRootNode.providerID.getter()
{
  return sub_22BE8D1C0((SEL *)&selRef_providerID, (SEL *)&selRef_providerID);
}

id sub_22BE8D1C0(SEL *a1, SEL *a2)
{
  if (*(void *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer)) {
    id v3 = [*(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer) *a1];
  }
  else {
    id v3 = [*(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain) *a2];
  }

  return v3;
}

id sub_22BE8D258(void *a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - v10;
  id v12 = a1;
  a4();

  uint64_t v13 = (void *)a5();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v13;
}

uint64_t DOCICloudRootNode.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22BE92248();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB20);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
  if (v10)
  {
    id v11 = objc_msgSend(v10, sel_creationDate);
    sub_22BE92218();

    id v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v12(v9, v6, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v9, v3);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  uint64_t v14 = (objc_class *)type metadata accessor for DOCICloudRootNode();
  v16.receiver = v1;
  v16.super_class = v14;
  id v15 = objc_msgSendSuper2(&v16, sel_creationDate);
  sub_22BE92218();

  return sub_22BE8DFAC((uint64_t)v9);
}

uint64_t DOCICloudRootNode.doc_creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDC9AE4(&qword_26AEFFB20, (SEL *)&selRef_doc_creationDate, MEMORY[0x263F07480], MEMORY[0x263F07490], a1);
}

uint64_t DOCICloudRootNode.modificationDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDC9AE4(&qword_26AEFFB20, (SEL *)&selRef_modificationDate, MEMORY[0x263F07480], MEMORY[0x263F07490], a1);
}

uint64_t DOCICloudRootNode.doc_lastUsedDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDC9AE4(&qword_26AEFFB20, (SEL *)&selRef_doc_lastUsedDate, MEMORY[0x263F07480], MEMORY[0x263F07490], a1);
}

uint64_t DOCICloudRootNode.dateForSortingByRecents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDC9AE4(&qword_26AEFFB20, (SEL *)&selRef_dateForSortingByRecents, MEMORY[0x263F07480], MEMORY[0x263F07490], a1);
}

uint64_t DOCICloudRootNode.isFolder.getter()
{
  return sub_22BE8D934((SEL *)&selRef_isFolder);
}

uint64_t DOCICloudRootNode.filename.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(v1, sel_filename);
  uint64_t v3 = sub_22BE92CD8();

  return v3;
}

id DOCICloudRootNode.isActionable.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isActionable);
}

id DOCICloudRootNode.isReadable.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isReadable);
}

id DOCICloudRootNode.isWritable.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isWritable);
}

id DOCICloudRootNode.isPending.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isPending);
}

id DOCICloudRootNode.isExternalDownloadPlaceholder.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isExternalDownloadPlaceholder);
}

uint64_t DOCICloudRootNode.isCloudItem.getter()
{
  return sub_22BE8D934((SEL *)&selRef_isCloudItem);
}

uint64_t sub_22BE8D934(SEL *a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer)) {
    return (uint64_t)[*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer) *a1];
  }
  else {
    return 1;
  }
}

id DOCICloudRootNode.isContainer.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isContainer);
}

uint64_t DOCICloudRootNode.isRootItem.getter()
{
  return 1;
}

id DOCICloudRootNode.isTrashed.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isTrashed);
}

id DOCICloudRootNode.isDownloading.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isDownloading);
}

id DOCICloudRootNode.isDownloaded.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isDownloaded);
}

id DOCICloudRootNode.downloadingProgress.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_downloadingProgress);
}

id DOCICloudRootNode.downloadingError.getter()
{
  return sub_22BE8DAE8((SEL *)&selRef_downloadingError);
}

id DOCICloudRootNode.isUploading.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isUploading);
}

id DOCICloudRootNode.isUploaded.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isUploaded);
}

id DOCICloudRootNode.uploadingProgress.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_uploadingProgress);
}

id sub_22BE8DA50(char *a1, uint64_t a2, SEL *a3)
{
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
  if (v3)
  {
    uint64_t v5 = a1;
    id v6 = [v3 *a3];

    if (v6)
    {
      uint64_t v3 = (void *)sub_22BE92078();
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

id DOCICloudRootNode.uploadingError.getter()
{
  return sub_22BE8DAE8((SEL *)&selRef_uploadingError);
}

id sub_22BE8DAE8(SEL *a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer)) {
    return [*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer) *a1];
  }
  else {
    return 0;
  }
}

id DOCICloudRootNode.copyingProgress.getter()
{
  return sub_22BE8DB44((SEL *)&selRef_copyingProgress);
}

id sub_22BE8DB44(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer) *a1];

  return v2;
}

id DOCICloudRootNode.isShared.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isShared);
}

id DOCICloudRootNode.isSharedByCurrentUser.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isSharedByCurrentUser);
}

id DOCICloudRootNode.isTopLevelSharedItem.getter()
{
  return sub_22BE8DBCC((SEL *)&selRef_isTopLevelSharedItem);
}

id sub_22BE8DBCC(SEL *a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer)) {
    return [*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer) *a1];
  }
  else {
    return 0;
  }
}

uint64_t DOCICloudRootNode.ownerNameComponents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDC9AE4(&qword_26AEFFB08, (SEL *)&selRef_ownerNameComponents, MEMORY[0x263F06A28], MEMORY[0x263F06A30], a1);
}

uint64_t DOCICloudRootNode.itemDecorations.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  id v2 = objc_msgSend(v1, sel_itemDecorations);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = v2;
  sub_22BDD9D50(0, &qword_268487118);
  uint64_t v4 = sub_22BE92EB8();

  return v4;
}

uint64_t DOCICloudRootNode.tags.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(v1, sel_tags);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  sub_22BDD9D50(0, (unint64_t *)&unk_2684880C0);
  uint64_t v4 = sub_22BE92EB8();

  return v4;
}

id DOCICloudRootNode.localizedStandardTagsCompare(node:)(uint64_t a1)
{
  return sub_22BE8DF64(a1, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

id DOCICloudRootNode._doc_fileTypeCompare(node:)(uint64_t a1)
{
  return sub_22BE8DF64(a1, (SEL *)&selRef__doc_fileTypeCompare_);
}

id sub_22BE8DF64(uint64_t a1, SEL *a2)
{
  id result = *(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (result) {
    return objc_msgSend(result, *a2, a1);
  }
  return result;
}

id sub_22BE8DF90(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id result = *(id *)(a1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (result) {
    return [result *a4];
  }
  return result;
}

uint64_t sub_22BE8DFAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEFFB20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_22BE8E00C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t method lookup function for DOCICloudRootNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DOCICloudRootNode);
}

uint64_t dispatch thunk of DOCICloudRootNode.deferredCreationNode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DOCICloudRootNode.deferredCreationNode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of DOCICloudRootNode.observerBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of DOCICloudRootNode.observerBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DOCICloudRootNode.observerBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

unint64_t sub_22BE8E198()
{
  unint64_t result = qword_2684887B0;
  if (!qword_2684887B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684887B0);
  }
  return result;
}

uint64_t sub_22BE8E1EC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22BE8E224()
{
  sub_22BE8C2FC(v0);
}

void sub_22BE8E22C()
{
  sub_22BE8CC04(v0);
}

uint64_t sub_22BE8E248()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void destroy for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for DOCICloudRootNode.ThreadSafeRootNodes(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  return a1;
}

uint64_t assignWithCopy for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  uint64_t v13 = *(void **)(a1 + 24);
  uint64_t v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  return a1;
}

uint64_t assignWithTake for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DOCICloudRootNode.DOCICloudRootNodeError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22BE8E53CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCICloudRootNode.DOCICloudRootNodeError()
{
  return &type metadata for DOCICloudRootNode.DOCICloudRootNodeError;
}

unint64_t sub_22BE8E578()
{
  unint64_t result = qword_2684887B8;
  if (!qword_2684887B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684887B8);
  }
  return result;
}

uint64_t static DOCAnalyticsAPIAbuseEvent.renameAPI(hostIdentifier:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *a3;
  *(void *)a4 = 0xD000000000000032;
  *(void *)(a4 + 8) = 0x800000022BEA0B20;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = a1;
  *(void *)(a4 + 40) = a2;
  *(unsigned char *)(a4 + 48) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t static DOCAnalyticsAPIAbuseEvent.createDocumentSPI(hostIdentifier:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *a3;
  *(void *)a4 = 0xD00000000000003ALL;
  *(void *)(a4 + 8) = 0x800000022BEA6A10;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = a1;
  *(void *)(a4 + 40) = a2;
  *(unsigned char *)(a4 + 48) = v4;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22BE8E648()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268486F28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22BE97A30;
  strcpy((char *)(inited + 32), "hostIdentifier");
  *(unsigned char *)(inited + 47) = -18;
  *(void *)(inited + 48) = sub_22BE92C98();
  *(void *)(inited + 56) = 1701869940;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = sub_22BE93078();
  return sub_22BDD4F50(inited);
}

unint64_t (*sub_22BE8E6F8())()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v1;
  void v5[2] = *(_OWORD *)(v0 + 32);
  char v6 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v0 + 32);
  *(unsigned char *)(v2 + 64) = *(unsigned char *)(v0 + 48);
  sub_22BE15F98((uint64_t)v5);
  return sub_22BE8EBCC;
}

uint64_t DOCAnalyticsAPIAbuseEvent.EventType.rawValue.getter()
{
  return *v0;
}

DocumentManagerExecutables::DOCAnalyticsAPIAbuseEvent::EventType_optional __swiftcall DOCAnalyticsAPIAbuseEvent.EventType.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *long long v1 = v2;
  return (DocumentManagerExecutables::DOCAnalyticsAPIAbuseEvent::EventType_optional)rawValue;
}

unint64_t sub_22BE8E7AC()
{
  unint64_t result = qword_2684887C0;
  if (!qword_2684887C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684887C0);
  }
  return result;
}

void *sub_22BE8E800@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t destroy for DOCAnalyticsAPIAbuseEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCAnalyticsAPIAbuseEvent()
{
  return &type metadata for DOCAnalyticsAPIAbuseEvent;
}

unsigned char *storeEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent.EventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x22BE8EB4CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCAnalyticsAPIAbuseEvent.EventType()
{
  return &type metadata for DOCAnalyticsAPIAbuseEvent.EventType;
}

uint64_t sub_22BE8EB84()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 65, 7);
}

unint64_t sub_22BE8EBCC()
{
  return sub_22BE8E648();
}

uint64_t UIScrollView.doc_isMoving.getter()
{
  if ((objc_msgSend(v0, sel_isDragging) & 1) != 0
    || (objc_msgSend(v0, sel_isDecelerating) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return (uint64_t)objc_msgSend(v0, sel_isTracking);
  }
}

id UIScrollView.doc_translateContent(dx:dy:animated:)(char a1, double a2, double a3)
{
  objc_msgSend(v3, sel_contentOffset);
  double v8 = v7 + a2;
  double v10 = v9 + a3;

  return objc_msgSend(v3, sel_setContentOffset_animated_, a1 & 1, v8, v10);
}

double static DOCUserInterfaceStateStore.retrieveDefaultSortMode(configuration:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_sharedStore);
  id v5 = objc_msgSend(v4, sel_interfaceStateForConfiguration_, a1);

  if (!v5) {
    goto LABEL_12;
  }
  id v7 = objc_msgSend(v5, sel_sortingMode);

  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = sub_22BE92BF8();

  uint64_t v9 = sub_22BE92CD8();
  if (!*(void *)(v8 + 16) || (unint64_t v11 = sub_22BDD5734(v9, v10), (v12 & 1) == 0))
  {
    memset(v20, 0, sizeof(v20));
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_22BDD854C(*(void *)(v8 + 56) + 32 * v11, (uint64_t)v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v20[1] + 1)) {
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v13 = sub_22BE92CD8();
  if (*(void *)(v8 + 16) && (unint64_t v15 = sub_22BDD5734(v13, v14), (v16 & 1) != 0)) {
    sub_22BDD854C(*(void *)(v8 + 56) + 32 * v15, (uint64_t)v20);
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v20[1] + 1))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    sub_22BDD473C((uint64_t)v20);
LABEL_12:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 24) = 0;
    *(void *)(a2 + 16) = 0;
    return result;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  char countAndFlagsBits = v19._countAndFlagsBits;
  DOCItemSortMode.init(rawValue:)(v19);
  if (LOBYTE(v20[0]) == 7) {
    goto LABEL_12;
  }
  LOBYTE(v19._countAndFlagsBits) = v20[0];
  DOCItemSortDescriptor.init(type:isReversed:)((unsigned __int8 *)&v19, countAndFlagsBits, (uint64_t)v20);
  char v18 = BYTE8(v20[1]);
  *(void *)a2 = LOBYTE(v20[0]);
  double result = *((double *)v20 + 1);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)((char *)v20 + 8);
  *(unsigned char *)(a2 + 24) = v18;
  return result;
}

void static DOCUserInterfaceStateStore.saveDefaultSortMode(_:configuration:)(unsigned char *a1, uint64_t a2)
{
  char v2 = a1[24];
  unint64_t v3 = 0x800000022BE9EDF0;
  unint64_t v4 = 0xD000000000000010;
  switch(*a1)
  {
    case 1:
      unint64_t v3 = 0xEC00000065746144;
      unint64_t v4 = 0x646573557473616CLL;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1701667182;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1936154996;
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1702521203;
      break;
    case 5:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1684957547;
      break;
    case 6:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v4 = 0x7942646572616873;
      break;
    default:
      break;
  }
  unsigned int v6 = self;
  id v7 = objc_msgSend(v6, sel_sharedStore);
  id v8 = objc_msgSend(v7, sel_interfaceStateForConfiguration_, a2);

  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268488478);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22BE97A30;
    *(void *)(inited + 32) = sub_22BE92CD8();
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = v4;
    *(void *)(inited + 56) = v3;
    *(void *)(inited + 80) = sub_22BE92CD8();
    *(void *)(inited + 88) = v11;
    *(void *)(inited + 120) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 96) = v2;
    sub_22BE1ACF8(inited);
    char v12 = (void *)sub_22BE92BE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setSortingMode_, v12);

    id v13 = objc_msgSend(v6, sel_sharedStore);
    objc_msgSend(v13, sel_updateInterfaceState_forConfiguration_, v8, a2);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void static DOCUserInterfaceStateStore.saveDefaultGroupingBehavior(_:for:configuration:)(unsigned __int8 *a1, void *a2, uint64_t a3)
{
  int v5 = *a1;
  unsigned int v6 = self;
  id v7 = objc_msgSend(v6, sel_sharedStore);
  id v8 = objc_msgSend(v7, sel_interfaceStateForConfiguration_, a3);

  if (v8)
  {
    uint64_t v9 = _sSo26DOCUserInterfaceStateStoreC26DocumentManagerExecutablesE016groupingBehaviorC10Identifier3forSSSo017DOCDocumentSourceJ0aSg_tFZ_0(a2);
    unint64_t v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268488478);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22BE99770;
    *(void *)(inited + 32) = sub_22BE92CD8();
    *(void *)(inited + 40) = v13;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = v5 != 7;
    sub_22BE1ACF8(inited);
    uint64_t v38 = v9;
    if (v5 != 7)
    {
      uint64_t v14 = MEMORY[0x263F8D310];
      uint64_t v15 = sub_22BE92CD8();
      unint64_t v16 = 0x800000022BE9EDF0;
      unint64_t v17 = 0xD000000000000010;
      uint64_t v18 = v15;
      uint64_t v20 = v19;
      switch(v5)
      {
        case 1:
          unint64_t v16 = 0xEC00000065746144;
          unint64_t v17 = 0x646573557473616CLL;
          break;
        case 2:
          unint64_t v16 = 0xE400000000000000;
          unint64_t v17 = 1701667182;
          break;
        case 3:
          unint64_t v16 = 0xE400000000000000;
          unint64_t v17 = 1936154996;
          break;
        case 4:
          unint64_t v16 = 0xE400000000000000;
          unint64_t v17 = 1702521203;
          break;
        case 5:
          unint64_t v16 = 0xE400000000000000;
          unint64_t v17 = 1684957547;
          break;
        case 6:
          unint64_t v16 = 0xE800000000000000;
          unint64_t v17 = 0x7942646572616873;
          break;
        default:
          break;
      }
      uint64_t v41 = v14;
      *(void *)&long long v40 = v17;
      *((void *)&v40 + 1) = v16;
      sub_22BDDBF3C(&v40, v39);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_22BE1DAF4(v39, v18, v20, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    id v22 = objc_msgSend(v8, sel_groupingBehaviors);
    unint64_t v23 = (void *)sub_22BE92BE8();
    swift_bridgeObjectRelease();
    unint64_t v24 = (void *)sub_22BE92C98();
    objc_msgSend(v22, sel_setValue_forKey_, v23, v24);

    if (qword_268486848 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_22BE925E8();
    __swift_project_value_buffer(v25, (uint64_t)qword_268487AD0);
    id v26 = a2;
    swift_bridgeObjectRetain();
    id v27 = sub_22BE925C8();
    id v28 = a2;
    os_log_type_t v29 = sub_22BE93148();
    if (os_log_type_enabled(v27, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(void *)&long long v40 = v37;
      *(_DWORD *)uint64_t v30 = 136315906;
      *(void *)&v39[0] = sub_22BDD8478(0xD000000000000031, 0x800000022BEA6AC0, (uint64_t *)&v40);
      sub_22BE93408();
      *(_WORD *)(v30 + 12) = 2080;
      LOBYTE(v39[0]) = v5;
      uint64_t v31 = sub_22BE92CF8();
      *(void *)&v39[0] = sub_22BDD8478(v31, v32, (uint64_t *)&v40);
      sub_22BE93408();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&v39[0] = sub_22BDD8478(v38, v11, (uint64_t *)&v40);
      sub_22BE93408();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 32) = 2080;
      *(void *)&v39[0] = v28;
      id v33 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684887D8);
      uint64_t v34 = sub_22BE92CF8();
      *(void *)&v39[0] = sub_22BDD8478(v34, v35, (uint64_t *)&v40);
      sub_22BE93408();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22BDC5000, v27, v29, "%s saving new value: \"%s\" to defaults: %s for identifier: %s", (uint8_t *)v30, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x230F57540](v37, -1, -1);
      MEMORY[0x230F57540](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v36 = objc_msgSend(v6, sel_sharedStore);
    objc_msgSend(v36, sel_updateInterfaceState_forConfiguration_, v8, a3);
  }
}

ValueMetadata *type metadata accessor for DocumentManagerExecutablesIntentsPackage()
{
  return &type metadata for DocumentManagerExecutablesIntentsPackage;
}

void static NSUserDefaults.docUserDefaults.setter(uint64_t a1)
{
  if (qword_26AF003B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v2 = (void *)qword_26AEFFAE0;
  qword_26AEFFAE0 = a1;
}

uint64_t (*static NSUserDefaults.docUserDefaults.modify())()
{
  if (qword_26AF003B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static DeepLinkLocation.filesAppURLScheme.getter()
{
  return 0x6F64646572616873;
}

uint64_t DeepLinkError.localizedStringResource.getter()
{
  uint64_t v0 = sub_22BE920A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22BE922D8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_22BE92C88();
  MEMORY[0x270FA5388](v5 - 8);
  sub_22BE92C78();
  sub_22BE922C8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_22BE920C8();
}

uint64_t static DeepLinkError.== infix(_:_:)()
{
  return 1;
}

uint64_t DeepLinkError.hash(into:)()
{
  return sub_22BE93A08();
}

uint64_t DeepLinkError.hashValue.getter()
{
  return sub_22BE93A48();
}

unint64_t sub_22BE8FAA4()
{
  unint64_t result = qword_2684887F0;
  if (!qword_2684887F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684887F0);
  }
  return result;
}

uint64_t sub_22BE8FAF8()
{
  return DeepLinkError.localizedStringResource.getter();
}

ValueMetadata *type metadata accessor for DeepLinkLocation()
{
  return &type metadata for DeepLinkLocation;
}

unsigned char *storeEnumTagSinglePayload for DeepLinkError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22BE8FBBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkError()
{
  return &type metadata for DeepLinkError;
}

uint64_t Array.prefix(upToAndIncluding:)()
{
  sub_22BE92F98();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_22BE930E8();
  return v1;
}

BOOL Array<A>.hasAny(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_22BE933B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = &v14[-v10];
  uint64_t v18 = a1;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a2;
  sub_22BE92F98();
  swift_getWitnessTable();
  sub_22BE92E48();
  BOOL v12 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 48))(v11, 1, a3) != 1;
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  return v12;
}

uint64_t sub_22BE8FE00()
{
  return sub_22BE92E88() & 1;
}

uint64_t sub_22BE8FE88()
{
  return sub_22BE8FE00() & 1;
}

uint64_t Array.enqueue(_:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_22BE92F68();
}

uint64_t Array.dequeue()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (MEMORY[0x230F55A10](*v2, v4))
  {
    swift_getWitnessTable();
    sub_22BE93108();
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v6(a2, v5, 1, v4);
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[10] = AssociatedTypeWitness;
  v6[11] = *(void *)(AssociatedTypeWitness - 8);
  v6[12] = swift_task_alloc();
  sub_22BE933B8();
  v6[13] = swift_task_alloc();
  v6[14] = *(void *)(a3 - 8);
  v6[15] = swift_task_alloc();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  v6[16] = v9;
  v6[17] = *(void *)(v9 - 8);
  v6[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22BE90238, 0, 0);
}

uint64_t sub_22BE90238()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  v0[2] = sub_22BE92BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_22BE92E28();
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_22BE933F8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v8 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(v8);
  }
  else
  {
    uint64_t v11 = (int *)v0[3];
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)v11 + *v11);
    BOOL v12 = (void *)swift_task_alloc();
    v0[19] = v12;
    *BOOL v12 = v0;
    v12[1] = sub_22BE90488;
    uint64_t v13 = v0[12];
    uint64_t v14 = v0[9];
    return v15(v14, v13);
  }
}

uint64_t sub_22BE90488()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_22BE907E0;
  }
  else
  {
    uint64_t v2 = sub_22BE905A4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22BE905A4()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  sub_22BE92F98();
  sub_22BE92F68();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_22BE933F8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v7 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v7);
  }
  else
  {
    uint64_t v10 = (int *)v0[3];
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)v10 + *v10);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[19] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_22BE90488;
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[9];
    return v14(v13, v12);
  }
}

uint64_t sub_22BE907E0()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void FPItemManager.doc_refetchItem(_:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(a1, sel_itemID);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v11[4] = sub_22BE91214;
  v11[5] = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_22BDDF270;
  v11[3] = &block_descriptor_28;
  uint64_t v9 = _Block_copy(v11);
  id v10 = a1;
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v3, sel_fetchItemForItemID_completionHandler_, v7, v9);
  _Block_release(v9);
}

void sub_22BE909D4(void *a1, uint64_t a2, void *a3, void (*a4)(void *, id))
{
  if (a1)
  {
    id v13 = a1;
    a4(a1, 0);
LABEL_7:

    return;
  }
  if (a2)
  {
    id v7 = (void *)sub_22BE92078();
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93158();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_22BE97A30;
    id v9 = objc_msgSend(a3, sel_itemID);
    *(void *)(v8 + 56) = sub_22BDD9D50(0, &qword_268488800);
    *(void *)(v8 + 64) = sub_22BE75A3C(&qword_268488808, &qword_268488800);
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 96) = sub_22BDD9D50(0, (unint64_t *)&unk_2684880A0);
    *(void *)(v8 + 104) = sub_22BE75A3C((unint64_t *)&qword_268488440, (unint64_t *)&unk_2684880A0);
    *(void *)(v8 + 72) = v7;
    id v10 = v7;
    sub_22BE92588();
    swift_bridgeObjectRelease();
    id v13 = v10;
    a4(0, v10);

    goto LABEL_7;
  }
  if (qword_26AF00288 != -1) {
    swift_once();
  }
  sub_22BE93158();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22BE99770;
  id v12 = objc_msgSend(a3, sel_itemID);
  *(void *)(v11 + 56) = sub_22BDD9D50(0, &qword_268488800);
  *(void *)(v11 + 64) = sub_22BE75A3C(&qword_268488808, &qword_268488800);
  *(void *)(v11 + 32) = v12;
  sub_22BE92588();
  swift_bridgeObjectRelease();
  a4(0, 0);
}

void sub_22BE90CEC(uint64_t a1, id a2, char a3, uint64_t a4, void (*a5)(uint64_t, id))
{
  if (a1)
  {
    id v9 = a2;
    id v10 = a2;
  }
  else
  {
    id v10 = a2;
    if (!a2)
    {
      sub_22BE92CD8();
      id v11 = objc_allocWithZone(MEMORY[0x263F087E8]);
      id v12 = (void *)sub_22BE92C98();
      swift_bridgeObjectRelease();
      id v10 = objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, 4, 0);
    }
    id v13 = a2;
    if (qword_26AF00288 != -1) {
      swift_once();
    }
    sub_22BE93158();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF00550);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_22BE9A3B0;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    unint64_t v15 = sub_22BDF8220();
    *(void *)(v14 + 64) = v15;
    *(void *)(v14 + 32) = 0xD000000000000025;
    *(void *)(v14 + 40) = 0x800000022BEA6BE0;
    uint64_t v16 = sub_22BE92138();
    *(void *)(v14 + 96) = sub_22BDD9D50(0, &qword_268488380);
    *(void *)(v14 + 104) = sub_22BE75A3C(&qword_268488388, &qword_268488380);
    *(void *)(v14 + 72) = v16;
    if (a2)
    {
      uint64_t v17 = sub_22BE92078();
      uint64_t v19 = sub_22BDD9D50(0, (unint64_t *)&unk_2684880A0);
      uint64_t v20 = sub_22BE75A3C((unint64_t *)&qword_268488440, (unint64_t *)&unk_2684880A0);
      *(void *)&long long v18 = v17;
      sub_22BDE1DD4(&v18, v14 + 112);
    }
    else
    {
      *(void *)(v14 + 136) = MEMORY[0x263F8D310];
      *(void *)(v14 + 144) = v15;
      *(void *)(v14 + 112) = 0x676E697373696D28;
      *(void *)(v14 + 120) = 0xEF29726F72726520;
    }
    sub_22BE92588();
    swift_bridgeObjectRelease();
  }
  a5(a1, v10);

  if (a3) {
    sub_22BE92158();
  }
}

void _sSo13FPItemManagerC08DocumentB11ExecutablesE13doc_fetchItem3for17completionHandlery10Foundation3URLV_ySo0A0CSg_s5Error_pSgtctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a2;
  uint64_t v5 = sub_22BE92198();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  char v8 = sub_22BE92178();
  id v9 = objc_msgSend(self, sel_defaultManager);
  id v10 = (void *)sub_22BE92138();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = v8 & 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12 + v11, (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  id v13 = (void *)(v12 + ((v7 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v13 = v16;
  v13[1] = a3;
  aBlock[4] = sub_22BE912C8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22BDDF270;
  void aBlock[3] = &block_descriptor_6_4;
  uint64_t v14 = _Block_copy(aBlock);
  sub_22BE91C58();
  swift_release();
  objc_msgSend(v9, sel_fetchItemForURL_completionHandler_, v10, v14);
  _Block_release(v14);
}

uint64_t sub_22BE911D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_22BE91214(void *a1, uint64_t a2)
{
  sub_22BE909D4(a1, a2, *(void **)(v2 + 16), *(void (**)(void *, id))(v2 + 24));
}

uint64_t sub_22BE91220()
{
  uint64_t v1 = sub_22BE92198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_22BE912C8(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_22BE92198() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  char v7 = *(unsigned char *)(v2 + 16);
  char v8 = *(void (**)(uint64_t, id))(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_22BE90CEC(a1, a2, v7, v2 + v6, v8);
}

CGSize __swiftcall CGSize.ceil()()
{
  double v2 = ceil(v0);
  double v3 = ceil(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

CGSize __swiftcall CGSize.floor()()
{
  double v2 = floor(v0);
  double v3 = floor(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

CGSize __swiftcall CGSize.rounded()()
{
  double v2 = round(v0);
  double v3 = round(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

double CGSize.doc_bySubtracting(width:height:)(double a1, double a2, double a3)
{
  return a3 - a1;
}

double static CGSize.doc_preferredSourceListIconSize(for:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF00528);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22BE9A4A0;
  double v3 = (void *)*MEMORY[0x263F83420];
  *(void *)(inited + 32) = *MEMORY[0x263F83420];
  *(void *)(inited + 40) = 0x4041000000000000;
  uint64_t v4 = (void *)*MEMORY[0x263F83418];
  *(void *)(inited + 48) = *MEMORY[0x263F83418];
  *(void *)(inited + 56) = 0x4044000000000000;
  uint64_t v5 = (void *)*MEMORY[0x263F83410];
  *(void *)(inited + 64) = *MEMORY[0x263F83410];
  *(void *)(inited + 72) = 0x4043800000000000;
  unint64_t v6 = (void *)*MEMORY[0x263F83408];
  *(void *)(inited + 80) = *MEMORY[0x263F83408];
  *(void *)(inited + 88) = 0x4046000000000000;
  char v7 = (void *)*MEMORY[0x263F83400];
  *(void *)(inited + 96) = *MEMORY[0x263F83400];
  *(void *)(inited + 104) = 0x4048800000000000;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  unint64_t v13 = sub_22BE1AE30(inited);
  id v14 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  uint64_t v15 = v14;
  if (*(void *)(v13 + 16) && (unint64_t v16 = sub_22BDFD728((uint64_t)v14), (v17 & 1) != 0))
  {
    double v18 = *(double *)(*(void *)(v13 + 56) + 8 * v16);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(self, sel_defaultMetrics);
    objc_msgSend(v19, sel_scaledValueForValue_compatibleWithTraitCollection_, a1, 29.0);
    double v18 = v20;
  }
  return v18;
}

uint64_t UIEdgeInsets.hashValue.getter()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE915B8()
{
  return sub_22BE93A48();
}

uint64_t sub_22BE91620()
{
  return UIEdgeInsets.hash(into:)();
}

uint64_t sub_22BE9162C()
{
  return sub_22BE93A48();
}

double UIEdgeInsets.verticalInsets.getter(double a1, double a2, double a3)
{
  return a1 + a3;
}

double UIEdgeInsets.horizontalInsets.getter(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

unint64_t sub_22BE916A4()
{
  unint64_t result = qword_268488810;
  if (!qword_268488810)
  {
    type metadata accessor for UIEdgeInsets(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268488810);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_22BE91B38()
{
  return MEMORY[0x270EE0998]();
}

uint64_t sub_22BE91B58()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_22BE91B68()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_22BE91B78()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_22BE91B98()
{
  return MEMORY[0x270EE0DA0]();
}

uint64_t sub_22BE91BA8()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_22BE91BB8()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_22BE91BC8()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_22BE91BD8()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_22BE91BE8()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_22BE91BF8()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_22BE91C08()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_22BE91C18()
{
  return MEMORY[0x270EE13D0]();
}

uint64_t sub_22BE91C28()
{
  return MEMORY[0x270EE13E0]();
}

uint64_t sub_22BE91C38()
{
  return MEMORY[0x270EE13F0]();
}

uint64_t sub_22BE91C48()
{
  return MEMORY[0x270EE1400]();
}

uint64_t sub_22BE91C58()
{
  return MEMORY[0x270EE1410]();
}

uint64_t sub_22BE91C68()
{
  return MEMORY[0x270EE1420]();
}

uint64_t sub_22BE91C78()
{
  return MEMORY[0x270EE1428]();
}

uint64_t sub_22BE91C88()
{
  return MEMORY[0x270EE1438]();
}

uint64_t sub_22BE91C98()
{
  return MEMORY[0x270EE1450]();
}

uint64_t sub_22BE91CA8()
{
  return MEMORY[0x270EE1458]();
}

uint64_t sub_22BE91CB8()
{
  return MEMORY[0x270EE1480]();
}

uint64_t sub_22BE91CC8()
{
  return MEMORY[0x270EE1488]();
}

uint64_t sub_22BE91CD8()
{
  return MEMORY[0x270EE1498]();
}

uint64_t sub_22BE91CE8()
{
  return MEMORY[0x270EE14A8]();
}

uint64_t sub_22BE91CF8()
{
  return MEMORY[0x270EE14C8]();
}

uint64_t sub_22BE91D08()
{
  return MEMORY[0x270EE14D8]();
}

uint64_t sub_22BE91D18()
{
  return MEMORY[0x270EE14E0]();
}

uint64_t sub_22BE91D28()
{
  return MEMORY[0x270EE14F8]();
}

uint64_t sub_22BE91D38()
{
  return MEMORY[0x270EE1500]();
}

uint64_t sub_22BE91D48()
{
  return MEMORY[0x270EE1510]();
}

uint64_t sub_22BE91D58()
{
  return MEMORY[0x270EE1518]();
}

uint64_t sub_22BE91D68()
{
  return MEMORY[0x270EE1520]();
}

uint64_t sub_22BE91D78()
{
  return MEMORY[0x270EE1530]();
}

uint64_t sub_22BE91D88()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_22BE91D98()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_22BE91DA8()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_22BE91DB8()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_22BE91DC8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_22BE91DD8()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_22BE91DE8()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_22BE91DF8()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_22BE91E08()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_22BE91E18()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_22BE91E28()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_22BE91E48()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_22BE91E68()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_22BE91E78()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_22BE91E98()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_22BE91EA8()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_22BE91EB8()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_22BE91EC8()
{
  return MEMORY[0x270EEE1B8]();
}

uint64_t sub_22BE91ED8()
{
  return MEMORY[0x270EEE248]();
}

uint64_t sub_22BE91EE8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22BE91EF8()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_22BE91F08()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_22BE91F18()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_22BE91F28()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_22BE91F38()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22BE91F48()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22BE91F58()
{
  return MEMORY[0x270EEEB88]();
}

uint64_t sub_22BE91F68()
{
  return MEMORY[0x270EEEDA0]();
}

uint64_t sub_22BE91F78()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22BE91F88()
{
  return MEMORY[0x270FA1638]();
}

uint64_t sub_22BE91F98()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_22BE91FA8()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_22BE91FB8()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_22BE91FC8()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_22BE91FD8()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_22BE91FE8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_22BE92038()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_22BE92068()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_22BE92078()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22BE92088()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22BE92098()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_22BE920A8()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_22BE920B8()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_22BE920C8()
{
  return MEMORY[0x270EEF8C8]();
}

uint64_t sub_22BE920D8()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_22BE920E8()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_22BE920F8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22BE92108()
{
  return MEMORY[0x270EEFC78]();
}

uint64_t sub_22BE92118()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_22BE92128()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_22BE92138()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22BE92148()
{
  return MEMORY[0x270EEFDD0]();
}

uint64_t sub_22BE92158()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_22BE92168()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22BE92178()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_22BE92188()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_22BE92198()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22BE921A8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_22BE921B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22BE921C8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22BE921D8()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_22BE921E8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_22BE921F8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22BE92208()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22BE92218()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22BE92228()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22BE92238()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22BE92248()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22BE92258()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22BE92268()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22BE92278()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22BE92298()
{
  return MEMORY[0x270EF0F10]();
}

uint64_t sub_22BE922A8()
{
  return MEMORY[0x270EF0F18]();
}

uint64_t sub_22BE922B8()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_22BE922C8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22BE922D8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22BE922E8()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_22BE922F8()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_22BE92308()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22BE92318()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22BE92328()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22BE92338()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_22BE92348()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_22BE92358()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_22BE92368()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_22BE92378()
{
  return MEMORY[0x270FA1658]();
}

uint64_t sub_22BE92388()
{
  return MEMORY[0x270FA1668]();
}

uint64_t sub_22BE92398()
{
  return MEMORY[0x270FA1698]();
}

uint64_t sub_22BE923A8()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_22BE923B8()
{
  return MEMORY[0x270FA16B8]();
}

uint64_t sub_22BE923C8()
{
  return MEMORY[0x270FA16F8]();
}

uint64_t sub_22BE923D8()
{
  return MEMORY[0x270FA1708]();
}

uint64_t sub_22BE923E8()
{
  return MEMORY[0x270FA1720]();
}

uint64_t sub_22BE923F8()
{
  return MEMORY[0x270FA1740]();
}

uint64_t sub_22BE92408()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_22BE92418()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_22BE92428()
{
  return MEMORY[0x270FA1780]();
}

uint64_t sub_22BE92438()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_22BE92448()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_22BE92458()
{
  return MEMORY[0x270FA17E8]();
}

uint64_t sub_22BE92468()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_22BE92478()
{
  return MEMORY[0x270FA1820]();
}

uint64_t sub_22BE92488()
{
  return MEMORY[0x270FA1838]();
}

uint64_t sub_22BE92498()
{
  return MEMORY[0x270FA1858]();
}

uint64_t sub_22BE924A8()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_22BE924B8()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_22BE924C8()
{
  return MEMORY[0x270FA1888]();
}

uint64_t sub_22BE924D8()
{
  return MEMORY[0x270FA1890]();
}

uint64_t sub_22BE924E8()
{
  return MEMORY[0x270FA18A0]();
}

uint64_t sub_22BE924F8()
{
  return MEMORY[0x270FA18B8]();
}

uint64_t sub_22BE92508()
{
  return MEMORY[0x270FA18C0]();
}

uint64_t sub_22BE92518()
{
  return MEMORY[0x270FA18D8]();
}

uint64_t sub_22BE92528()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_22BE92538()
{
  return MEMORY[0x270FA18E8]();
}

uint64_t sub_22BE92548()
{
  return MEMORY[0x270FA1908]();
}

uint64_t sub_22BE92558()
{
  return MEMORY[0x270FA1910]();
}

uint64_t sub_22BE92568()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22BE92578()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_22BE92588()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_22BE92598()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_22BE925A8()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_22BE925B8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_22BE925C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22BE925D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22BE925E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22BE925F8()
{
  return MEMORY[0x270F81A30]();
}

uint64_t sub_22BE92608()
{
  return MEMORY[0x270F81A38]();
}

uint64_t sub_22BE92618()
{
  return MEMORY[0x270F81A40]();
}

uint64_t sub_22BE92628()
{
  return MEMORY[0x270F81A48]();
}

uint64_t sub_22BE92638()
{
  return MEMORY[0x270F81A50]();
}

uint64_t sub_22BE92648()
{
  return MEMORY[0x270F81A58]();
}

uint64_t sub_22BE92658()
{
  return MEMORY[0x270F81B00]();
}

uint64_t sub_22BE92668()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_22BE92678()
{
  return MEMORY[0x270F81B20]();
}

uint64_t sub_22BE92688()
{
  return MEMORY[0x270F81B28]();
}

uint64_t sub_22BE92698()
{
  return MEMORY[0x270F81B30]();
}

uint64_t sub_22BE926A8()
{
  return MEMORY[0x270F81B38]();
}

uint64_t sub_22BE926C8()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_22BE926D8()
{
  return MEMORY[0x270F82400]();
}

uint64_t sub_22BE926E8()
{
  return MEMORY[0x270F82408]();
}

uint64_t sub_22BE926F8()
{
  return MEMORY[0x270F82410]();
}

uint64_t sub_22BE92708()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_22BE92718()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22BE92728()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22BE92738()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22BE92748()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22BE92758()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22BE92768()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_22BE92778()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_22BE92788()
{
  return MEMORY[0x270EFF0D0]();
}

uint64_t sub_22BE92798()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_22BE927A8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22BE927B8()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_22BE927C8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_22BE927D8()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_22BE927E8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_22BE927F8()
{
  return MEMORY[0x270F00A68]();
}

uint64_t sub_22BE92808()
{
  return MEMORY[0x270F00A70]();
}

uint64_t sub_22BE92818()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_22BE92828()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_22BE92838()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_22BE92848()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_22BE92858()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_22BE92868()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_22BE92878()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_22BE92888()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22BE92898()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_22BE928A8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_22BE928B8()
{
  return MEMORY[0x270F01A20]();
}

uint64_t sub_22BE928C8()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_22BE928D8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_22BE928E8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22BE928F8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_22BE92908()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_22BE92918()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_22BE92928()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_22BE92938()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22BE92948()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22BE92958()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22BE92968()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22BE92978()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_22BE92988()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_22BE92998()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22BE929A8()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_22BE929B8()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_22BE929C8()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_22BE929D8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_22BE929E8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_22BE929F8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_22BE92A08()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22BE92A18()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22BE92A28()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22BE92A38()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_22BE92A48()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_22BE92A58()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_22BE92A68()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_22BE92A78()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_22BE92A88()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22BE92A98()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_22BE92AA8()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_22BE92AB8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22BE92AC8()
{
  return MEMORY[0x270F052E8]();
}

uint64_t sub_22BE92AD8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_22BE92AE8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_22BE92AF8()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_22BE92B08()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22BE92B18()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_22BE92B28()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_22BE92B38()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22BE92B48()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_22BE92B58()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22BE92B68()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22BE92B78()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22BE92B88()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22BE92B98()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_22BE92BA8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_22BE92BB8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22BE92BC8()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_22BE92BD8()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_22BE92BE8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22BE92BF8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22BE92C08()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_22BE92C18()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_22BE92C28()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_22BE92C38()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_22BE92C48()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22BE92C58()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22BE92C68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22BE92C78()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_22BE92C88()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_22BE92C98()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22BE92CA8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22BE92CB8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22BE92CC8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22BE92CD8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22BE92CE8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22BE92CF8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22BE92D08()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22BE92D18()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_22BE92D28()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_22BE92D48()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22BE92D58()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22BE92D68()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22BE92D78()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_22BE92D88()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22BE92D98()
{
  return MEMORY[0x270F9D7A8]();
}

uint64_t sub_22BE92DB8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_22BE92DC8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22BE92DD8()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_22BE92DE8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_22BE92DF8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22BE92E08()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22BE92E28()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22BE92E38()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_22BE92E48()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_22BE92E58()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_22BE92E68()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_22BE92E78()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_22BE92E88()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_22BE92E98()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22BE92EA8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22BE92EB8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22BE92EC8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22BE92ED8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22BE92EE8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_22BE92EF8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22BE92F08()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_22BE92F18()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22BE92F28()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22BE92F38()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_22BE92F48()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22BE92F58()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22BE92F68()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22BE92F78()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_22BE92F88()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_22BE92F98()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22BE92FA8()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_22BE92FB8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_22BE92FC8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_22BE92FD8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22BE92FE8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22BE92FF8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22BE93008()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_22BE93018()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_22BE93028()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_22BE93038()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22BE93048()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22BE93058()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22BE93068()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22BE93078()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_22BE93088()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_22BE93098()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22BE930A8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22BE930B8()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_22BE930C8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22BE930D8()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_22BE930E8()
{
  return MEMORY[0x270F9E160]();
}

uint64_t sub_22BE930F8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22BE93108()
{
  return MEMORY[0x270F9E240]();
}

uint64_t sub_22BE93128()
{
  return MEMORY[0x270F82448]();
}

uint64_t sub_22BE93138()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22BE93148()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22BE93158()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22BE93168()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22BE93178()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22BE93188()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_22BE93198()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_22BE931A8()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_22BE931B8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22BE931C8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_22BE931D8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22BE931E8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22BE931F8()
{
  return MEMORY[0x270FA0D78]();
}

uint64_t sub_22BE93208()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_22BE93218()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22BE93228()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22BE93238()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_22BE93248()
{
  return MEMORY[0x270EFE0A8]();
}

uint64_t sub_22BE93258()
{
  return MEMORY[0x270F825D8]();
}

uint64_t sub_22BE93268()
{
  return MEMORY[0x270F825E0]();
}

uint64_t sub_22BE93288()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_22BE93298()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_22BE932A8()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_22BE932B8()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_22BE932C8()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_22BE932D8()
{
  return MEMORY[0x270F82688]();
}

uint64_t sub_22BE932E8()
{
  return MEMORY[0x270F82698]();
}

uint64_t sub_22BE932F8()
{
  return MEMORY[0x270FA0F88]();
}

uint64_t sub_22BE93308()
{
  return MEMORY[0x270FA0F90]();
}

uint64_t sub_22BE93318()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22BE93328()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22BE93338()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_22BE93348()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_22BE93358()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_22BE93368()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_22BE93378()
{
  return MEMORY[0x270FA2ED8]();
}

uint64_t sub_22BE93388()
{
  return MEMORY[0x270FA2EE0]();
}

uint64_t sub_22BE93398()
{
  return MEMORY[0x270FA2EF0]();
}

uint64_t sub_22BE933A8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22BE933B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22BE933C8()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_22BE933D8()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_22BE933E8()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_22BE933F8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22BE93408()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22BE93418()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22BE93428()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_22BE93438()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_22BE93448()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_22BE93458()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22BE93468()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22BE93478()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_22BE93488()
{
  return MEMORY[0x270EF2528]();
}

uint64_t sub_22BE93498()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_22BE934A8()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_22BE934B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22BE934C8()
{
  return MEMORY[0x270F9E6B0]();
}

uint64_t sub_22BE934E8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22BE934F8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22BE93508()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22BE93518()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22BE93528()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22BE93538()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_22BE93548()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22BE93558()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22BE93568()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22BE93578()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22BE93588()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22BE935A8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22BE935B8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22BE935C8()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_22BE935D8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22BE935E8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22BE935F8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22BE93608()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22BE93618()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22BE93628()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22BE93638()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22BE93648()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22BE93658()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22BE93668()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_22BE93678()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_22BE93688()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22BE93698()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22BE936A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22BE936B8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22BE936C8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22BE936D8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22BE936E8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22BE936F8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22BE93708()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22BE93718()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22BE93728()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22BE93738()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22BE93748()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_22BE93758()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22BE93768()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22BE93778()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22BE93788()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22BE93798()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_22BE937A8()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_22BE937B8()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_22BE937C8()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_22BE937D8()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_22BE937E8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22BE937F8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_22BE93808()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22BE93818()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22BE93828()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22BE93838()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22BE93858()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22BE93868()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22BE93878()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22BE93888()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_22BE93898()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_22BE938A8()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_22BE938B8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22BE938C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22BE938D8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22BE938E8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_22BE93908()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22BE93918()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_22BE93928()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_22BE93938()
{
  return MEMORY[0x270F9FB00]();
}

uint64_t sub_22BE93948()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22BE93958()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22BE93988()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22BE93998()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22BE939A8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22BE939B8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22BE939C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22BE939D8()
{
  return MEMORY[0x270EF26D8]();
}

uint64_t sub_22BE939E8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22BE939F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22BE93A08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22BE93A18()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22BE93A28()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_22BE93A38()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_22BE93A48()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22BE93A58()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x270EE4E50](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x270EE5FB8]();
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t DOCAssertWithIntenalBuildAlert()
{
  return MEMORY[0x270F26B00]();
}

uint64_t DOCCenterSizeInRect()
{
  return MEMORY[0x270F26B08]();
}

uint64_t DOCConstraintWithPriority()
{
  return MEMORY[0x270F26BB8]();
}

uint64_t DOCConstraintsToResizeWithSuperview()
{
  return MEMORY[0x270F26BC0]();
}

uint64_t DOCConstraintsToResizeWithSuperviewSafeArea()
{
  return MEMORY[0x270F26BC8]();
}

uint64_t DOCConstraintsWithPriority()
{
  return MEMORY[0x270F26BD0]();
}

uint64_t DOCCreateDefaultHomeScreenWidgetIntent()
{
  return MEMORY[0x270F26BD8]();
}

uint64_t DOCDeviceIsPad()
{
  return MEMORY[0x270F26B40]();
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x270F26B48]();
}

uint64_t DOCIsInternalBuild()
{
  return MEMORY[0x270F26B18]();
}

uint64_t DOCLocalizedDisplayName()
{
  return MEMORY[0x270F26B50]();
}

uint64_t DOCPresentAlertForError()
{
  return MEMORY[0x270F26B20]();
}

uint64_t DOCPresentAlertForErrorWithForceHandler()
{
  return MEMORY[0x270F26B28]();
}

uint64_t DOCProviderDomainIDIsExternalDevice()
{
  return MEMORY[0x270F26B68]();
}

uint64_t DOCProviderDomainIDIsRemovable()
{
  return MEMORY[0x270F26B70]();
}

uint64_t DOCProviderDomainIDIsSharedServerDomainID()
{
  return MEMORY[0x270F26B78]();
}

uint64_t DOCProviderDomainIsSharedServerDomain()
{
  return MEMORY[0x270F26B80]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x270F26B88]();
}

uint64_t DOCTagsFromFPTags()
{
  return MEMORY[0x270F26B98]();
}

uint64_t DOCUsePadIdiomForTraits()
{
  return MEMORY[0x270F26B30]();
}

uint64_t DOCUsePhoneIdiomForTraits()
{
  return MEMORY[0x270F26B38]();
}

uint64_t FPCrossDeviceItemIDForItemID()
{
  return MEMORY[0x270EEBA60]();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x270EEBAA8]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x270EEBB08]();
}

uint64_t FPItemURLForCrossDeviceItemID()
{
  return MEMORY[0x270EEBB28]();
}

uint64_t FPTagFromDOCTag()
{
  return MEMORY[0x270F26BA0]();
}

uint64_t FPTagsFromDOCTags()
{
  return MEMORY[0x270F26BA8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
}

uint64_t MobileGestalt_get_oysterCapability()
{
  return MEMORY[0x270F96178]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x270F96188]();
}

uint64_t MobileGestalt_get_touchIDCapability()
{
  return MEMORY[0x270F96198]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x270F82C10]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F82C30]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F82C50]();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x270F82C98]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x270F26BB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x270F9A4A8](cls, name, imp, types);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}