uint64_t sub_24CB9DB18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_24CB0F370(30);
  sub_24CB025F8();
  v2 = sub_24CBAAD48();
  v4 = v3;
  v6 = v5 & 1;
  sub_24CBAAC58();
  v7 = sub_24CBAAD28();
  v9 = v8;
  v11 = v10;
  swift_release();
  sub_24CB025E8(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_24CBAAF48();
  v12 = sub_24CBAACE8();
  v30 = v13;
  v31 = v12;
  v15 = v14;
  v32 = v16;
  swift_release();
  v29 = v15 & 1;
  sub_24CB025E8(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v17 = sub_24CBAAD48();
  v19 = v18;
  LOBYTE(v7) = v20 & 1;
  sub_24CBAAB48();
  sub_24CBAAB78();
  swift_release();
  v21 = sub_24CBAAD28();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  swift_release();
  sub_24CB025E8(v17, v19, v7);
  swift_bridgeObjectRelease();
  *(void *)a1 = v31;
  *(void *)(a1 + 8) = v30;
  *(unsigned char *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v32;
  *(void *)(a1 + 32) = v21;
  *(void *)(a1 + 40) = v23;
  *(unsigned char *)(a1 + 48) = v25 & 1;
  *(void *)(a1 + 56) = v27;
  sub_24CB02524(v31, v30, v29);
  swift_bridgeObjectRetain();
  sub_24CB02524(v21, v23, v25 & 1);
  swift_bridgeObjectRetain();
  sub_24CB025E8(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  sub_24CB025E8(v31, v30, v29);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CB9DD54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24CB0F370(32);
  sub_24CB025F8();
  uint64_t v4 = sub_24CBAAD48();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_24CBAAC18();
  uint64_t v9 = sub_24CBAAD28();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_24CB025E8(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_24CBAAD18();
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  uint64_t v40 = v16;
  char v37 = v17 & 1;
  sub_24CB025E8(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  sub_24CB0F370(31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698134F8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_24CBAD290;
  *(void *)(v18 + 56) = MEMORY[0x263F8D310];
  *(void *)(v18 + 64) = sub_24CB73E48();
  *(void *)(v18 + 32) = a1;
  *(void *)(v18 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_24CBAB428();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_24CBAAD48();
  uint64_t v21 = v20;
  LOBYTE(v11) = v22 & 1;
  sub_24CBAAB48();
  uint64_t v23 = sub_24CBAAD28();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_24CB025E8(v19, v21, v11);
  swift_bridgeObjectRelease();
  sub_24CBAAF48();
  uint64_t v28 = sub_24CBAACE8();
  uint64_t v30 = v29;
  LOBYTE(v11) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_24CB025E8(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  *(void *)a3 = v39;
  *(void *)(a3 + 8) = v38;
  *(unsigned char *)(a3 + 16) = v37;
  *(void *)(a3 + 24) = v40;
  *(void *)(a3 + 32) = v28;
  *(void *)(a3 + 40) = v30;
  *(unsigned char *)(a3 + 48) = v11 & 1;
  *(void *)(a3 + 56) = v33;
  sub_24CB02524(v39, v38, v37);
  swift_bridgeObjectRetain();
  sub_24CB02524(v28, v30, v11 & 1);
  swift_bridgeObjectRetain();
  sub_24CB025E8(v28, v30, v11 & 1);
  swift_bridgeObjectRelease();
  sub_24CB025E8(v39, v38, v37);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CB9E024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v52 = a2;
  v53 = a3;
  uint64_t v3 = sub_24CBAAC38();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_24CB0F370(30);
  uint64_t v55 = v7;
  unint64_t v45 = sub_24CB025F8();
  uint64_t v8 = sub_24CBAAD48();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_24CBAAB68();
  unsigned int v50 = *MEMORY[0x263F1A680];
  char v13 = *(void (**)(void))(v4 + 104);
  uint64_t v48 = v4 + 104;
  v49 = (void (*)(char *, void, uint64_t))v13;
  uint64_t v41 = v3;
  v13(v6);
  sub_24CBAAC68();
  swift_release();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v46 = v4 + 8;
  v47 = v14;
  v14(v6, v3);
  uint64_t v15 = sub_24CBAAD28();
  uint64_t v17 = v16;
  LOBYTE(v3) = v18;
  swift_release();
  sub_24CB025E8(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_24CBAAF48();
  uint64_t v19 = sub_24CBAACE8();
  uint64_t v43 = v20;
  uint64_t v44 = v19;
  uint64_t v42 = v21;
  char v23 = v22;
  swift_release();
  LOBYTE(v10) = v23 & 1;
  sub_24CB025E8(v15, v17, v3 & 1);
  swift_bridgeObjectRelease();
  uint64_t v54 = v51;
  uint64_t v55 = v52;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_24CBAAD48();
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_24CBAAC08();
  sub_24CBAAB78();
  swift_release();
  uint64_t v29 = v41;
  v49(v6, v50, v41);
  sub_24CBAAC68();
  swift_release();
  v47(v6, v29);
  uint64_t v30 = sub_24CBAAD28();
  uint64_t v32 = v31;
  LOBYTE(v29) = v33;
  uint64_t v35 = v34;
  swift_release();
  LOBYTE(v29) = v29 & 1;
  sub_24CB025E8(v24, v26, v28);
  swift_bridgeObjectRelease();
  LOBYTE(v54) = v10;
  v36 = v53;
  uint64_t v37 = v43;
  uint64_t v38 = v44;
  uint64_t v39 = v42;
  uint64_t *v53 = v44;
  v36[1] = v39;
  *((unsigned char *)v36 + 16) = v10;
  v36[3] = v37;
  v36[4] = v30;
  v36[5] = v32;
  *((unsigned char *)v36 + 48) = v29;
  v36[7] = v35;
  sub_24CB02524(v38, v39, v10);
  swift_bridgeObjectRetain();
  sub_24CB02524(v30, v32, v29);
  swift_bridgeObjectRetain();
  sub_24CB025E8(v30, v32, v29);
  swift_bridgeObjectRelease();
  sub_24CB025E8(v38, v39, v54);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CB9E394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v40[1] = a1;
  uint64_t v3 = sub_24CBAAC38();
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v45 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24CB0F370(30);
  uint64_t v49 = v5;
  v40[0] = sub_24CB025F8();
  uint64_t v6 = sub_24CBAAD48();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_24CBAAC88();
  uint64_t v11 = sub_24CBAAD28();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_24CB025E8(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_24CBAAF48();
  uint64_t v16 = sub_24CBAACE8();
  uint64_t v42 = v17;
  uint64_t v43 = v16;
  char v19 = v18;
  uint64_t v44 = v20;
  swift_release();
  int v41 = v19 & 1;
  sub_24CB025E8(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for _DDDevicePickerView();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  swift_release();
  uint64_t v21 = sub_24CBAAD48();
  uint64_t v23 = v22;
  LOBYTE(v6) = v24 & 1;
  sub_24CBAAC88();
  sub_24CBAAB78();
  swift_release();
  uint64_t v26 = v45;
  uint64_t v25 = v46;
  uint64_t v27 = v47;
  (*(void (**)(char *, void, uint64_t))(v46 + 104))(v45, *MEMORY[0x263F1A680], v47);
  sub_24CBAAC68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  uint64_t v28 = sub_24CBAAD28();
  uint64_t v30 = v29;
  LOBYTE(v25) = v31;
  uint64_t v33 = v32;
  swift_release();
  char v34 = v25 & 1;
  sub_24CB025E8(v21, v23, v6);
  swift_bridgeObjectRelease();
  char v35 = v41;
  LOBYTE(v48) = v41;
  uint64_t v37 = v42;
  uint64_t v36 = v43;
  *(void *)a2 = v43;
  *(void *)(a2 + 8) = v37;
  *(unsigned char *)(a2 + 16) = v35;
  *(void *)(a2 + 24) = v44;
  *(void *)(a2 + 32) = v28;
  *(void *)(a2 + 40) = v30;
  *(unsigned char *)(a2 + 48) = v34;
  *(void *)(a2 + 56) = v33;
  uint64_t v38 = v36;
  sub_24CB02524(v36, v37, v35);
  swift_bridgeObjectRetain();
  sub_24CB02524(v28, v30, v34);
  swift_bridgeObjectRetain();
  sub_24CB025E8(v28, v30, v34);
  swift_bridgeObjectRelease();
  sub_24CB025E8(v38, v37, v48);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CB9E704()
{
  type metadata accessor for DeviceBrowserViewModel(0);
  sub_24CBA87A8(&qword_2698154A8, (void (*)(uint64_t))type metadata accessor for DeviceBrowserViewModel);
  sub_24CBAA318();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24CB9E8F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CBAA4C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_sharedApplication);
  id v7 = objc_msgSend(v6, sel_activeInterfaceOrientation);

  BOOL IsLandscape = UIInterfaceOrientationIsLandscape((uint64_t)v7);
  int v9 = SFDeviceModelCodeGet();
  uint64_t v10 = type metadata accessor for _DDDevicePickerView();
  sub_24CB0974C((uint64_t)v5);
  LOBYTE(v6) = sub_24CBAA4B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6) {
    return 1;
  }
  if (sub_24CB957FC())
  {
    sub_24CBAA3F8();
    if (v12 > 414.0) {
      return 6;
    }
    return *(void *)(v1 + *(int *)(v10 + 76));
  }
  char v13 = v9 == 2 || IsLandscape;
  if (IsLandscape) {
    uint64_t result = 6;
  }
  else {
    uint64_t result = 3;
  }
  if ((v13 & 1) == 0) {
    return *(void *)(v1 + *(int *)(v10 + 76));
  }
  return result;
}

uint64_t sub_24CB9EAA0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_24CBAA8F8();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698157C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698157B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  double v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBAA818();
  uint64_t v22 = v2;
  char v23 = a1;
  LODWORD(v24) = 0;
  sub_24CBA87A8(&qword_269815628, MEMORY[0x263F19D28]);
  sub_24CBABBA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698157D8);
  sub_24CBA59CC(&qword_2698157E0, &qword_2698157D8, (void (*)(void))sub_24CBA5A44);
  sub_24CBAA2B8();
  uint64_t v13 = sub_24CBAB218();
  type metadata accessor for DeviceBrowserViewModel(0);
  sub_24CBA87A8(&qword_2698154A8, (void (*)(uint64_t))type metadata accessor for DeviceBrowserViewModel);
  sub_24CBAA318();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v14 = v24;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v8, v5);
  char v15 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  *char v15 = v13;
  v15[1] = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = v21;
  sub_24CB03524((uint64_t)v12, v21, &qword_2698157B8);
  uint64_t v18 = v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698156A0) + 36);
  *(void *)uint64_t v18 = KeyPath;
  *(unsigned char *)(v18 + 8) = 0;
  return sub_24CB03478((uint64_t)v12, &qword_2698157B8);
}

uint64_t sub_24CB9EE24(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815750);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815890);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698156D0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_24CB97608() == 2)
  {
    sub_24CB9F048(a3, (uint64_t)v13);
    uint64_t v14 = &qword_2698156D0;
    sub_24CB03524((uint64_t)v13, (uint64_t)v10, &qword_2698156D0);
    swift_storeEnumTagMultiPayload();
    sub_24CBA5180();
    sub_24CBA547C();
    sub_24CBAA8E8();
    uint64_t v15 = (uint64_t)v13;
  }
  else
  {
    sub_24CB9F774(a2, a3, (uint64_t)v7);
    uint64_t v14 = &qword_269815750;
    sub_24CB03524((uint64_t)v7, (uint64_t)v10, &qword_269815750);
    swift_storeEnumTagMultiPayload();
    sub_24CBA5180();
    sub_24CBA547C();
    sub_24CBAA8E8();
    uint64_t v15 = (uint64_t)v7;
  }
  return sub_24CB03478(v15, v14);
}

uint64_t sub_24CB9F048@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v57 = a2;
  uint64_t v5 = type metadata accessor for _DDDevicePickerView();
  uint64_t v55 = *(char **)(v5 - 8);
  uint64_t v6 = *((void *)v55 + 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815720);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815710);
  MEMORY[0x270FA5388](v58);
  uint64_t v56 = (uint64_t)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815700);
  MEMORY[0x270FA5388](v59);
  uint64_t v61 = (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698156F0);
  MEMORY[0x270FA5388](v60);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698156E0);
  MEMORY[0x270FA5388](v62);
  uint64_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698156D0);
  MEMORY[0x270FA5388](v64);
  uint64_t v63 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24CB9E8F4();
  sub_24CBAA3F8();
  double v20 = v19;
  uint64_t result = sub_24CB9E704();
  double v22 = (double)v18;
  double v23 = ceil((double)*(uint64_t *)(result + 16) / (double)v18);
  if ((~*(void *)&v23 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v23 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v23 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v24 = result;
  uint64_t v25 = v18;
  uint64_t v54 = v14;
  uint64_t v26 = (uint64_t)v23;
  uint64_t result = sub_24CBAB1B8();
  *(void *)uint64_t v10 = result;
  *((void *)v10 + 1) = v27;
  *((void *)v10 + 2) = 0;
  v10[24] = 1;
  *((void *)v10 + 4) = 0;
  v10[40] = 1;
  if (v26 < 0)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269815898);
  uint64_t v53 = a1;
  if (v20 <= 414.0) {
    double v28 = 16.0;
  }
  else {
    double v28 = 20.0;
  }
  uint64_t v65 = 0;
  uint64_t v66 = v26;
  swift_getKeyPath();
  sub_24CBA8814(v3, (uint64_t)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  unint64_t v29 = (v55[80] + 32) & ~(unint64_t)v55[80];
  uint64_t v55 = v16;
  unint64_t v30 = (v6 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v24;
  *(void *)(v31 + 24) = v25;
  sub_24CBA887C((uint64_t)v7, v31 + v29, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  *(double *)(v31 + v30) = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698138C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158A0);
  sub_24CB1BA8C();
  sub_24CB03084(&qword_2698158A8, &qword_2698158A0);
  sub_24CBAB0F8();
  uint64_t v32 = sub_24CBAB218();
  type metadata accessor for DeviceBrowserViewModel(0);
  sub_24CBA87A8(&qword_2698154A8, (void (*)(uint64_t))type metadata accessor for DeviceBrowserViewModel);
  sub_24CBAA318();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v33 = v65;
  uint64_t v34 = v56;
  sub_24CB03524((uint64_t)v10, v56, &qword_269815720);
  char v35 = (uint64_t *)(v34 + *(int *)(v58 + 36));
  *char v35 = v32;
  v35[1] = v33;
  sub_24CB03478((uint64_t)v10, &qword_269815720);
  uint64_t v36 = sub_24CBAB218();
  uint64_t v37 = v61;
  sub_24CB03524(v34, v61, &qword_269815710);
  uint64_t v38 = (uint64_t *)(v37 + *(int *)(v59 + 36));
  *uint64_t v38 = v36;
  v38[1] = v25;
  sub_24CB03478(v34, &qword_269815710);
  char v39 = sub_24CBAAAB8();
  uint64_t v40 = (uint64_t)v54;
  sub_24CB03524(v37, (uint64_t)v54, &qword_269815700);
  uint64_t v41 = v40 + *(int *)(v60 + 36);
  *(unsigned char *)uint64_t v41 = v39;
  *(_OWORD *)(v41 + 8) = 0u;
  *(_OWORD *)(v41 + 24) = 0u;
  *(unsigned char *)(v41 + 40) = 1;
  sub_24CB03478(v37, &qword_269815700);
  int v42 = sub_24CB97608();
  sub_24CBAA3F8();
  double v44 = v43 + sub_24CAFF7FC() * -1.75 * v22;
  if (v42 == 2) {
    uint64_t v45 = 0x4020000000000000;
  }
  else {
    uint64_t v45 = 0;
  }
  if (v42 == 2) {
    double v46 = v44;
  }
  else {
    double v46 = 0.0;
  }
  char v47 = sub_24CBAAAC8();
  uint64_t v48 = (uint64_t)v55;
  sub_24CB03524(v40, (uint64_t)v55, &qword_2698156F0);
  uint64_t v49 = v48 + *(int *)(v62 + 36);
  *(unsigned char *)uint64_t v49 = v47;
  *(void *)(v49 + 8) = v45;
  *(void *)(v49 + 16) = 0;
  *(void *)(v49 + 24) = v45;
  *(double *)(v49 + 32) = v46;
  *(unsigned char *)(v49 + 40) = 0;
  sub_24CB03478(v40, &qword_2698156F0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v51 = v63;
  sub_24CB03524(v48, v63, &qword_2698156E0);
  uint64_t v52 = v51 + *(int *)(v64 + 36);
  *(void *)uint64_t v52 = KeyPath;
  *(unsigned char *)(v52 + 8) = 0;
  sub_24CB03478(v48, &qword_2698156E0);
  return sub_24CB033C4(v51, v57, &qword_2698156D0);
}

uint64_t sub_24CB9F774@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v68 = a3;
  uint64_t v69 = a2;
  int v53 = a1;
  uint64_t v54 = sub_24CBAA8F8();
  MEMORY[0x270FA5388](v54);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698157A0);
  uint64_t v62 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v55 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815790);
  MEMORY[0x270FA5388](v57);
  uint64_t v59 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815780);
  MEMORY[0x270FA5388](v58);
  uint64_t v60 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815770);
  MEMORY[0x270FA5388](v56);
  uint64_t v66 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815760);
  MEMORY[0x270FA5388](v61);
  uint64_t v67 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815750);
  MEMORY[0x270FA5388](v64);
  uint64_t v63 = (uint64_t)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24CBAB148();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (_OWORD *)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_24CBAB158();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24CBAA4C8();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _DDDevicePickerView();
  sub_24CB0974C((uint64_t)v21);
  char v22 = sub_24CBAA4B8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (v22) {
    sub_24CBAB1B8();
  }
  else {
    sub_24CBAB188();
  }
  uint64_t v23 = sub_24CB9E8F4();
  uint64_t v52 = v23;
  *uint64_t v14 = xmmword_24CBB0130;
  (*(void (**)(_OWORD *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F1B8C8], v11);
  sub_24CBAB168();
  sub_24CBA1BA4((uint64_t)v17, v23);
  sub_24CBAA3F8();
  uint64_t v24 = sub_24CB97608();
  MEMORY[0x270FA5388](v24);
  *(&v51 - 4) = v4;
  *((unsigned char *)&v51 - 24) = v53;
  sub_24CBAA808();
  int v71 = 0;
  sub_24CBA87A8(&qword_269815628, MEMORY[0x263F19D28]);
  sub_24CBABBA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158D0);
  uint64_t v50 = sub_24CBA59CC(&qword_2698158D8, &qword_2698158D0, (void (*)(void))sub_24CBA7B3C);
  uint64_t v25 = v55;
  sub_24CBAB258();
  uint64_t v26 = sub_24CBAB218();
  type metadata accessor for DeviceBrowserViewModel(0);
  sub_24CBA87A8(&qword_2698154A8, (void (*)(uint64_t))type metadata accessor for DeviceBrowserViewModel);
  sub_24CBAA318();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v27 = v70;
  uint64_t v28 = v62;
  uint64_t v29 = (uint64_t)v59;
  uint64_t v30 = v65;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v59, v25, v65);
  uint64_t v31 = (uint64_t *)(v29 + *(int *)(v57 + 36));
  *uint64_t v31 = v26;
  v31[1] = v27;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v30);
  uint64_t v32 = sub_24CBAB218();
  uint64_t v33 = v60;
  sub_24CB03524(v29, v60, &qword_269815790);
  uint64_t v34 = (uint64_t *)(v33 + *(int *)(v58 + 36));
  uint64_t v35 = v52;
  *uint64_t v34 = v32;
  v34[1] = v35;
  sub_24CB03478(v29, &qword_269815790);
  LOBYTE(v32) = sub_24CBAAAB8();
  uint64_t v36 = v66;
  sub_24CB03524(v33, v66, &qword_269815780);
  uint64_t v37 = v36 + *(int *)(v56 + 36);
  *(unsigned char *)uint64_t v37 = v32;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  *(unsigned char *)(v37 + 40) = 1;
  sub_24CB03478(v33, &qword_269815780);
  int v38 = sub_24CB97608();
  sub_24CBAA3F8();
  double v40 = v39 + sub_24CAFF7FC() * -1.75 * (double)v35;
  if (v38 == 2) {
    uint64_t v41 = 0x4020000000000000;
  }
  else {
    uint64_t v41 = 0;
  }
  if (v38 == 2) {
    double v42 = v40;
  }
  else {
    double v42 = 0.0;
  }
  char v43 = sub_24CBAAAC8();
  uint64_t v44 = v67;
  sub_24CB03524(v36, v67, &qword_269815770);
  uint64_t v45 = v44 + *(int *)(v61 + 36);
  *(unsigned char *)uint64_t v45 = v43;
  *(void *)(v45 + 8) = v41;
  *(void *)(v45 + 16) = 0;
  *(void *)(v45 + 24) = v41;
  *(double *)(v45 + 32) = v42;
  *(unsigned char *)(v45 + 40) = 0;
  sub_24CB03478(v36, &qword_269815770);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = v63;
  sub_24CB03524(v44, v63, &qword_269815760);
  uint64_t v48 = v47 + *(int *)(v64 + 36);
  *(void *)uint64_t v48 = KeyPath;
  *(unsigned char *)(v48 + 8) = 0;
  sub_24CB03478(v44, &qword_269815760);
  return sub_24CB033C4(v47, v68, &qword_269815750);
}

uint64_t sub_24CBA0028@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v5 = sub_24CBAAC38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24CB0F370(a1 + 27);
  uint64_t v49 = v9;
  sub_24CB025F8();
  uint64_t v10 = sub_24CBAAD48();
  uint64_t v12 = v11;
  uint64_t v35 = v13;
  char v15 = v14 & 1;
  sub_24CBAAC18();
  sub_24CBAAB78();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F1A680], v5);
  sub_24CBAAC68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = sub_24CBAAD28();
  uint64_t v18 = v17;
  int v36 = v19;
  uint64_t v37 = v20;
  swift_release();
  sub_24CB025E8(v10, v12, v15);
  swift_bridgeObjectRelease();
  char v21 = sub_24CBAAAB8();
  int v22 = sub_24CB97608();
  if (v22 == 3)
  {
    uint64_t v23 = 0x4020000000000000;
    uint64_t v24 = 0x4020000000000000;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    if (v22 != 1)
    {
      uint64_t v24 = 0;
      uint64_t v23 = 0x4020000000000000;
    }
  }
  char v25 = sub_24CBAAAC8();
  char v26 = v36 & 1;
  char v41 = v36 & 1;
  char v40 = 1;
  char v39 = 0;
  *(void *)&long long v42 = v16;
  *((void *)&v42 + 1) = v18;
  LOBYTE(v43) = v36 & 1;
  uint64_t v27 = v37;
  *((void *)&v43 + 1) = v37;
  LOBYTE(v44[0]) = v21;
  *(_OWORD *)((char *)v44 + 8) = 0u;
  *(_OWORD *)((char *)&v44[1] + 8) = 0u;
  BYTE8(v44[2]) = 1;
  LOBYTE(v45) = v25;
  *((void *)&v45 + 1) = v23;
  *(void *)&v46[0] = v24;
  *((void *)&v46[0] + 1) = v23;
  *(void *)&v46[1] = v24;
  BYTE8(v46[1]) = 0;
  long long v28 = v42;
  long long v29 = v43;
  long long v30 = v44[1];
  *(_OWORD *)(a3 + 32) = v44[0];
  *(_OWORD *)(a3 + 48) = v30;
  *(_OWORD *)a3 = v28;
  *(_OWORD *)(a3 + 16) = v29;
  long long v31 = v44[2];
  long long v32 = v45;
  long long v33 = v46[0];
  *(_OWORD *)(a3 + 105) = *(_OWORD *)((char *)v46 + 9);
  *(_OWORD *)(a3 + 80) = v32;
  *(_OWORD *)(a3 + 96) = v33;
  *(_OWORD *)(a3 + 64) = v31;
  char v47 = 1;
  *(void *)(a3 + 128) = 0;
  *(unsigned char *)(a3 + 136) = 1;
  uint64_t v48 = v16;
  uint64_t v49 = v18;
  char v50 = v26;
  uint64_t v51 = v27;
  char v52 = v21;
  long long v53 = 0u;
  long long v54 = 0u;
  char v55 = 1;
  char v56 = v25;
  uint64_t v57 = v23;
  uint64_t v58 = v24;
  uint64_t v59 = v23;
  uint64_t v60 = v24;
  char v61 = 0;
  sub_24CBA4B38((uint64_t)&v42);
  return sub_24CBA4B78((uint64_t)&v48);
}

uint64_t sub_24CBA02EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _DDDevicePickerView();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t result = sub_24CB9E704();
  double v7 = ceil((double)*(uint64_t *)(result + 16) / (double)*(uint64_t *)(a1 + *(int *)(v3 + 88)));
  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = (uint64_t)v7;
  if (((uint64_t)v7 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = result;
    v12[0] = 0;
    v12[1] = (uint64_t)v7;
    swift_getKeyPath();
    sub_24CBA8814(a1, (uint64_t)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
    unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    sub_24CBA887C((uint64_t)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
    *(void *)(v11 + ((v5 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698138C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698157F0);
    sub_24CB1BA8C();
    sub_24CBA5A44();
    return sub_24CBAB0F8();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_24CBA0518(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815840);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = *a1;
  uint64_t v13 = a2;
  uint64_t v14 = v10;
  uint64_t v15 = a3;
  sub_24CBA0E94(a4, a2, v10, (uint64_t)&v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269815800);
  sub_24CBA5ACC();
  sub_24CBA5C64();
  return sub_24CBAB128();
}

uint64_t sub_24CBA0624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815830);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815820);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815810);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = type metadata accessor for _DDDevicePickerView();
  uint64_t v18 = *(void *)(a3 + *(int *)(result + 80));
  uint64_t v19 = a2 * v18;
  if ((unsigned __int128)(a2 * (__int128)v18) >> 64 != (a2 * v18) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  BOOL v20 = __OFADD__(v19, v18);
  uint64_t v21 = v19 + v18;
  if (v20)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v21 >= *(void *)(a1 + 16)) {
    uint64_t v22 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v22 = v21;
  }
  *(void *)uint64_t v10 = sub_24CBAA778();
  *((void *)v10 + 1) = 0x4034000000000000;
  v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269815870);
  sub_24CBA0900(a1, v19, v22, a3);
  char v23 = sub_24CBAAAB8();
  sub_24CBAA2A8();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_24CB03524((uint64_t)v10, (uint64_t)v13, &qword_269815830);
  long long v32 = &v13[*(int *)(v11 + 36)];
  *long long v32 = v23;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_24CB03478((uint64_t)v10, &qword_269815830);
  char v33 = sub_24CBAAAD8();
  sub_24CBAA2A8();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_24CB03524((uint64_t)v13, (uint64_t)v16, &qword_269815820);
  long long v42 = &v16[*(int *)(v14 + 36)];
  *long long v42 = v33;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_24CB03478((uint64_t)v13, &qword_269815820);
  char v43 = sub_24CBAAAE8();
  sub_24CBAA2A8();
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  sub_24CB03524((uint64_t)v16, a4, &qword_269815810);
  uint64_t v52 = a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269815800) + 36);
  *(unsigned char *)uint64_t v52 = v43;
  *(void *)(v52 + 8) = v45;
  *(void *)(v52 + 16) = v47;
  *(void *)(v52 + 24) = v49;
  *(void *)(v52 + 32) = v51;
  *(unsigned char *)(v52 + 40) = 0;
  return sub_24CB03478((uint64_t)v16, &qword_269815810);
}

uint64_t sub_24CBA0900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for _DDDevicePickerView();
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 64);
  MEMORY[0x270FA5388](v8 - 8);
  if (a3 < a2)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 < 0)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
    uint64_t v15 = sub_24CBA6580(a1, a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80)), a2, (2 * a3) | 1);
    goto LABEL_12;
  }
  unint64_t v11 = *(void *)(a1 + 16);
  if (v11 < a2 || (uint64_t)v11 < a3) {
    goto LABEL_15;
  }
  v20[0] = v10;
  sub_24CBABAC8();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  uint64_t v14 = *(void *)(v13 + 16);
  swift_release();
  if (v14 != a3 - a2) {
    goto LABEL_16;
  }
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
LABEL_12:
  swift_bridgeObjectRelease();
  v20[1] = v15;
  sub_24CBA8814(a4, (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  unint64_t v16 = (*(unsigned __int8 *)(v20[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20[0] + 80);
  uint64_t v17 = swift_allocObject();
  sub_24CBA887C((uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698141E8);
  sub_24CBA9788();
  type metadata accessor for _DDNodeView(0);
  sub_24CB03084(&qword_269815878, &qword_2698141E8);
  sub_24CBA87A8(&qword_269815880, (void (*)(uint64_t))type metadata accessor for _DDNodeView);
  sub_24CBA87A8(&qword_269815888, (void (*)(uint64_t))type metadata accessor for _DDNodeViewModel);
  return sub_24CBAB108();
}

uint64_t sub_24CBA0C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v5 = type metadata accessor for _DDDevicePickerView();
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v19 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = type metadata accessor for _DDNodeViewModel();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7 - 8);
  unint64_t v11 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - v12;
  sub_24CBA8814(a1, (uint64_t)&v19 - v12, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  char v14 = sub_24CB97608();
  sub_24CBA8814(a2, (uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA8814(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  unint64_t v15 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v16 = (v6 + *(unsigned __int8 *)(v8 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = swift_allocObject();
  sub_24CBA887C((uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v15, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA887C((uint64_t)v11, v17 + v16, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  return sub_24CAF91AC((uint64_t)v13, v14, (uint64_t)sub_24CBA6C5C, v17, v20);
}

uint64_t sub_24CBA0E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v34 = a2;
  uint64_t v36 = a4;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815868);
  MEMORY[0x270FA5388](v35);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CBAB0E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815648);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269815850);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v33 - v19;
  if (__OFSUB__(a1, 1))
  {
    __break(1u);
  }
  else if (*(void *)(v34 + 16) < 6uLL || a1 - 1 == v33)
  {
    swift_storeEnumTagMultiPayload();
    sub_24CBA5CE0();
    return sub_24CBAA8E8();
  }
  else
  {
    sub_24CBAB0D8();
    char v21 = sub_24CBAAAB8();
    sub_24CBAA2A8();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
    uint64_t v30 = &v13[*(int *)(v11 + 36)];
    *uint64_t v30 = v21;
    *((void *)v30 + 1) = v23;
    *((void *)v30 + 2) = v25;
    *((void *)v30 + 3) = v27;
    *((void *)v30 + 4) = v29;
    v30[40] = 0;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_24CBAB1A8();
    sub_24CBAA3B8();
    sub_24CB03524((uint64_t)v13, (uint64_t)v17, &qword_269815648);
    uint64_t v31 = &v17[*(int *)(v14 + 36)];
    long long v32 = v38;
    *(_OWORD *)uint64_t v31 = v37;
    *((_OWORD *)v31 + 1) = v32;
    *((_OWORD *)v31 + 2) = v39;
    sub_24CB03478((uint64_t)v13, &qword_269815648);
    sub_24CB033C4((uint64_t)v17, (uint64_t)v20, &qword_269815850);
    sub_24CB03524((uint64_t)v20, (uint64_t)v6, &qword_269815850);
    swift_storeEnumTagMultiPayload();
    sub_24CBA5CE0();
    sub_24CBAA8E8();
    return sub_24CB03478((uint64_t)v20, &qword_269815850);
  }
  return result;
}

uint64_t *sub_24CBA1224@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v7 = *result * a3;
  if ((unsigned __int128)(*result * (__int128)a3) >> 64 != v7 >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (__OFADD__(v7, a3))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v7 + a3 >= *(void *)(a2 + 16)) {
    uint64_t v11 = *(void *)(a2 + 16);
  }
  else {
    uint64_t v11 = v7 + a3;
  }
  *(void *)a5 = sub_24CBAA778();
  *(void *)(a5 + 8) = 0x4034000000000000;
  *(unsigned char *)(a5 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158B0);
  return (uint64_t *)sub_24CBA12D4(a2, v7, v11, a4, a6);
}

uint64_t sub_24CBA12D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10 = type metadata accessor for _DDDevicePickerView();
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  if (a3 < a2)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 < 0)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
    uint64_t v17 = sub_24CBA6580(a1, a1 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80)), a2, (2 * a3) | 1);
    goto LABEL_12;
  }
  unint64_t v13 = *(void *)(a1 + 16);
  if (v13 < a2 || (uint64_t)v13 < a3) {
    goto LABEL_15;
  }
  v22[0] = v12;
  sub_24CBABAC8();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  uint64_t v16 = *(void *)(v15 + 16);
  swift_release();
  if (v16 != a3 - a2) {
    goto LABEL_16;
  }
  uint64_t v17 = swift_dynamicCastClass();
  if (!v17)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
LABEL_12:
  swift_bridgeObjectRelease();
  v22[1] = v17;
  sub_24CBA8814(a4, (uint64_t)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  unint64_t v18 = (*(unsigned __int8 *)(v22[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22[0] + 80);
  uint64_t v19 = swift_allocObject();
  sub_24CBA887C((uint64_t)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  *(double *)(v19 + ((v11 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698141E8);
  sub_24CBA9788();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158B8);
  sub_24CB03084(&qword_269815878, &qword_2698141E8);
  sub_24CB03084(&qword_2698158C0, &qword_2698158B8);
  sub_24CBA87A8(&qword_269815888, (void (*)(uint64_t))type metadata accessor for _DDNodeViewModel);
  return sub_24CBAB108();
}

uint64_t sub_24CBA1628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a3;
  uint64_t v5 = type metadata accessor for _DDDevicePickerView();
  uint64_t v6 = v5 - 8;
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v43 = *(void *)(v44 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v41 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for _DDNodeViewModel();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v42 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v38 - v12;
  uint64_t v40 = (uint64_t)&v38 - v12;
  uint64_t v14 = type metadata accessor for _DDNodeView(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698158C8);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBA8814(a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  int v39 = sub_24CB97608();
  uint64_t v38 = MEMORY[0x25330B830](a2 + *(int *)(v6 + 72));
  uint64_t v21 = v41;
  sub_24CBA8814(a2, v41, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA8814(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  unint64_t v22 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  unint64_t v23 = (v43 + *(unsigned __int8 *)(v42 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v24 = swift_allocObject();
  sub_24CBA887C(v21, v24 + v22, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA887C((uint64_t)v11, v24 + v23, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  sub_24CAF91AC(v40, v39, (uint64_t)sub_24CBA6C5C, v24, (uint64_t)v16);
  LOBYTE(v21) = sub_24CBAAAE8();
  sub_24CBAA2A8();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_24CBA8814((uint64_t)v16, (uint64_t)v20, type metadata accessor for _DDNodeView);
  uint64_t v33 = &v20[*(int *)(v18 + 44)];
  *uint64_t v33 = v21;
  *((void *)v33 + 1) = v26;
  *((void *)v33 + 2) = v28;
  *((void *)v33 + 3) = v30;
  *((void *)v33 + 4) = v32;
  v33[40] = 0;
  sub_24CBA7ABC((uint64_t)v16, type metadata accessor for _DDNodeView);
  uint64_t v34 = v45;
  sub_24CB03524((uint64_t)v20, v45, &qword_2698158C8);
  uint64_t v35 = v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698158B8) + 52);
  uint64_t v36 = sub_24CBA9788();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v35, a1, v36);
  return sub_24CB03478((uint64_t)v20, &qword_2698158C8);
}

uint64_t sub_24CBA1A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698141F8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *(void *)(a2 + 56);
  v14[16] = *(unsigned char *)(a2 + 48);
  uint64_t v15 = v9;
  v14[15] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269813018);
  sub_24CBAB028();
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(a2 + *(int *)(type metadata accessor for _DDDevicePickerView() + 72));
  uint64_t v11 = sub_24CBA9788();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v8, a3, v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
  v10(v8, a1);
  return sub_24CB03478((uint64_t)v8, &qword_2698141F8);
}

uint64_t sub_24CBA1BA4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_24CBABA08();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = sub_24CBAB158();
      uint64_t v5 = sub_24CBAB518();
      *(void *)(v5 + 16) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      v8(v5 + v7, a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        unint64_t v11 = v5 + v10 + v7;
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
    }
    uint64_t v12 = sub_24CBAB158();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return v5;
  }
  return result;
}

uint64_t sub_24CBA1D4C(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for _DDDevicePickerView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = sub_24CB9E704();
  size_t v8 = sub_24CBA7664(v7);
  swift_bridgeObjectRelease();
  v13[1] = v8;
  swift_getKeyPath();
  sub_24CBA8814(a1, (uint64_t)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  sub_24CBA887C((uint64_t)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  *(double *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_24CBA800C;
  *(void *)(v11 + 24) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698158C8);
  sub_24CB03084(&qword_2698158F0, &qword_2698158E8);
  sub_24CBA87A8((unint64_t *)&qword_2698147D0, MEMORY[0x263F07508]);
  sub_24CBA7B3C();
  return sub_24CBAB0F8();
}

uint64_t sub_24CBA1FAC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for _DDDevicePickerView();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for _DDNodeViewModel();
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v34 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = type metadata accessor for _DDNodeView(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBA8814(a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  char v17 = sub_24CB97608();
  sub_24CBA8814(a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA8814(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  unint64_t v18 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  unint64_t v19 = (v6 + *(unsigned __int8 *)(v34 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v20 = swift_allocObject();
  sub_24CBA887C((uint64_t)v7, v20 + v18, (uint64_t (*)(void))type metadata accessor for _DDDevicePickerView);
  sub_24CBA887C((uint64_t)v11, v20 + v19, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
  sub_24CAF91AC((uint64_t)v13, v17, (uint64_t)sub_24CBA6C5C, v20, (uint64_t)v16);
  char v21 = sub_24CBAAAE8();
  sub_24CBAA2A8();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v30 = v36;
  sub_24CBA8814((uint64_t)v16, v36, type metadata accessor for _DDNodeView);
  uint64_t v31 = v30 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698158C8) + 36);
  *(unsigned char *)uint64_t v31 = v21;
  *(void *)(v31 + 8) = v23;
  *(void *)(v31 + 16) = v25;
  *(void *)(v31 + 24) = v27;
  *(void *)(v31 + 32) = v29;
  *(unsigned char *)(v31 + 40) = 0;
  return sub_24CBA7ABC((uint64_t)v16, type metadata accessor for _DDNodeView);
}

uint64_t sub_24CBA22E8()
{
  return sub_24CBA26C0(sub_24CB9AB48);
}

uint64_t sub_24CBA2304()
{
  return sub_24CBA26C0(sub_24CB9AC2C);
}

unint64_t sub_24CBA231C()
{
  unint64_t result = qword_2698153E8;
  if (!qword_2698153E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698153A0);
    sub_24CBA23BC();
    sub_24CB03084(&qword_269813080, &qword_269813088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698153E8);
  }
  return result;
}

unint64_t sub_24CBA23BC()
{
  unint64_t result = qword_2698153F0;
  if (!qword_2698153F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698153C8);
    sub_24CBA2438();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698153F0);
  }
  return result;
}

unint64_t sub_24CBA2438()
{
  unint64_t result = qword_2698153F8;
  if (!qword_2698153F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698153C0);
    sub_24CB03084(&qword_269815400, &qword_2698153B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698153F8);
  }
  return result;
}

unint64_t sub_24CBA24D8()
{
  unint64_t result = qword_269815408;
  if (!qword_269815408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698153D8);
    sub_24CBA2578();
    sub_24CB03084(&qword_269815418, &qword_269815420);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815408);
  }
  return result;
}

unint64_t sub_24CBA2578()
{
  unint64_t result = qword_269815410;
  if (!qword_269815410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698153D0);
    sub_24CBA23BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815410);
  }
  return result;
}

uint64_t sub_24CBA25F4()
{
  return sub_24CBA2630(&qword_269815428, &qword_2698153A8, (void (*)(void))sub_24CBA231C, (void (*)(void))sub_24CBA23BC);
}

uint64_t sub_24CBA2630(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CBA26C0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_24CBA2734()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  unint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CBA2B50(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24CB1B300;
  return sub_24CB9AE64(a1, v5, v6, v7);
}

uint64_t sub_24CBA2C3C()
{
  return sub_24CBAA5E8();
}

uint64_t sub_24CBA2C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2CDC(a1, a2, a3, a4, MEMORY[0x263F18D80], MEMORY[0x263F19318]);
}

uint64_t sub_24CBA2C8C()
{
  return sub_24CBAA588();
}

uint64_t sub_24CBA2CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2CDC(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_24CBA2CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_24CBA2DAC@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA2DC0()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA2DD4@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA2DE8()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA2DFC@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA2E10()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA2E24@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA2E38()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA2E4C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBA9988();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24CBA2ECC(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_24CBA9998();
}

uint64_t sub_24CBA2F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269813320);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CB03524(a1, (uint64_t)v9, &qword_269813320);
  return a5(v9);
}

uint64_t sub_24CBA2FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24CBAB9B8();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24CBA30E4, 0, 0);
}

uint64_t sub_24CBA30E4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24CBAB9D8();
  uint64_t v5 = sub_24CBA87A8(&qword_269815448, MEMORY[0x263F8F710]);
  sub_24CBABAF8();
  sub_24CBA87A8(&qword_269815450, MEMORY[0x263F8F6D8]);
  sub_24CBAB9E8();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24CBA3284;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24CBA3284()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CBA3440, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CBA3440()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CBA34B4@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA34DC()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA3504@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA352C()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA3554@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA357C()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA35AC()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 17) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  unint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v4 + v3 + 4, v2 | 7);
}

uint64_t sub_24CBA39C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  char v7 = *(unsigned char *)(v2 + 16);
  uint64_t v8 = v2 + v6;
  uint64_t v9 = (char *)(v2 + *(void *)(v5 + 64) + v6);
  char v10 = *v9;
  int v11 = v9[1];
  char v12 = v9[2];
  int v13 = v9[3];
  return sub_24CB98678(a1, v7, v8, v10, v11, v12, v13, a2);
}

unint64_t sub_24CBA3A7C()
{
  unint64_t result = qword_2698154E0;
  if (!qword_2698154E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698154D8);
    sub_24CB03084(&qword_2698154D0, &qword_2698154C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698154E0);
  }
  return result;
}

unint64_t sub_24CBA3B1C()
{
  unint64_t result = qword_2698154E8;
  if (!qword_2698154E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815468);
    sub_24CB03084(&qword_2698154D0, &qword_2698154C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698154B8);
    sub_24CB03084(&qword_2698154C0, &qword_2698154B8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698154E8);
  }
  return result;
}

unint64_t sub_24CBA3C1C()
{
  unint64_t result = qword_2698154F8;
  if (!qword_2698154F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815490);
    sub_24CB03084(&qword_269815500, &qword_269815508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698154F8);
  }
  return result;
}

unint64_t sub_24CBA3CB4()
{
  unint64_t result = qword_269815510;
  if (!qword_269815510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815480);
    sub_24CBA3C1C();
    sub_24CB03084(&qword_269813080, &qword_269813088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815510);
  }
  return result;
}

uint64_t sub_24CBA3D54()
{
  return sub_24CBAA688();
}

uint64_t sub_24CBA3D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2F3C(a1, a2, a3, a4, MEMORY[0x263F19448]);
}

uint64_t sub_24CBA3DA4()
{
  return sub_24CBAA648();
}

uint64_t sub_24CBA3DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2F3C(a1, a2, a3, a4, MEMORY[0x263F193D0]);
}

uint64_t sub_24CBA3DF4()
{
  return sub_24CBAA5E8();
}

uint64_t sub_24CBA3E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2CDC(a1, a2, a3, a4, MEMORY[0x263F18D80], MEMORY[0x263F19318]);
}

uint64_t sub_24CBA3E58()
{
  return sub_24CBAA588();
}

uint64_t sub_24CBA3E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CBA2CDC(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

unint64_t sub_24CBA3EBC()
{
  unint64_t result = qword_269815528;
  if (!qword_269815528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815518);
    sub_24CBA87A8(&qword_269815530, (void (*)(uint64_t))type metadata accessor for _DDDevicePickerEducationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815528);
  }
  return result;
}

uint64_t sub_24CBA3F68(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 a24,char a25,char a26,char a27)
{
  char v27 = a8;
  if (a27)
  {
    sub_24CBA42F4(a1, a2);
    return sub_24CBA430C(a3, a4, a5, a6, a7, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21,
             a22,
             a23 & 1);
  }
  else
  {
    swift_retain();
    return sub_24CBA4110(a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22,
             a23,
             a24,
             a25 & 1);
  }
}

uint64_t sub_24CBA4110(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int16 a21,char a22)
{
  if ((a22 & 1) == 0) {
    return sub_24CBA4690(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
  }
             a20,
             a21,
             (unsigned __int16)(a21 & 0x1FF) >> 8,
             (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CBA41C0,
             (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CBA4274);
  return result;
}

uint64_t sub_24CBA41C0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  if (a21)
  {
    sub_24CB02524(a1, a2, a3 & 1);
    swift_bridgeObjectRetain();
    char v23 = a19 & 1;
  }
  else
  {
    sub_24CB02524(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    a17 = a8;
    a18 = a9;
    char v23 = a10 & 1;
  }
  sub_24CB02524(a17, a18, v23);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CBA4274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  sub_24CB02524(a4, a5, a6 & 1);
  swift_bridgeObjectRetain();
  sub_24CB02524(a8, a9, a10 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CBA42F4(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_24CAFFDAC(result, a2 & 1);
  }
  return result;
}

uint64_t sub_24CBA430C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  if (a21)
  {
    sub_24CB02524(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    uint64_t v22 = a8;
    char v24 = a10 & 1;
  }
  else
  {
    sub_24CB02524(a1, a2, a3 & 1);
    swift_bridgeObjectRetain();
    uint64_t v22 = a17;
    a9 = a18;
    char v24 = a19 & 1;
  }
  sub_24CB02524(v22, a9, v24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CBA43C0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t))
{
  BYTE4(v4) = *(unsigned char *)(a1 + 211);
  LODWORD(v4) = *(unsigned __int16 *)(a1 + 208) | (*(unsigned __int8 *)(a1 + 210) << 16);
  a2(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4);
  return a1;
}

uint64_t sub_24CBA4458(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 a24,char a25,char a26,char a27)
{
  char v27 = a8;
  if (a27)
  {
    sub_24CBA4860(a1, a2);
    return sub_24CBA4878(a3, a4, a5, a6, a7, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21,
             a22,
             a23 & 1);
  }
  else
  {
    swift_release();
    return sub_24CBA45E0(a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22,
             a23,
             a24,
             a25 & 1);
  }
}

uint64_t sub_24CBA45E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int16 a21,char a22)
{
  if ((a22 & 1) == 0) {
    return sub_24CBA4690(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
  }
             a20,
             a21,
             (unsigned __int16)(a21 & 0x1FF) >> 8,
             (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CBA472C,
             (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CBA47E0);
  return result;
}

uint64_t sub_24CBA4690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,char a22,uint64_t (*a23)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t (*a24)(uint64_t, uint64_t, uint64_t))
{
  if (a22)
  {
    return a24(a1, a2, a3);
  }
  else
  {
    return a23(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  }
}

uint64_t sub_24CBA472C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  if (a21)
  {
    sub_24CB025E8(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    char v23 = a19 & 1;
  }
  else
  {
    sub_24CB025E8(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    a17 = a8;
    a18 = a9;
    char v23 = a10 & 1;
  }
  sub_24CB025E8(a17, a18, v23);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBA47E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  sub_24CB025E8(a4, a5, a6 & 1);
  swift_bridgeObjectRelease();
  sub_24CB025E8(a8, a9, a10 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBA4860(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_24CB0011C(result, a2 & 1);
  }
  return result;
}

uint64_t sub_24CBA4878(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  if (a21)
  {
    sub_24CB025E8(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    uint64_t v22 = a8;
    char v24 = a10 & 1;
  }
  else
  {
    sub_24CB025E8(a1, a2, a3 & 1);
    swift_bridgeObjectRelease();
    uint64_t v22 = a17;
    a9 = a18;
    char v24 = a19 & 1;
  }
  sub_24CB025E8(v22, a9, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBA492C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 160);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_24CBA49A0(uint64_t result)
{
  *(unsigned char *)(result + 187) = 1;
  return result;
}

uint64_t sub_24CBA49AC(uint64_t a1, void (*a2)(void, void), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t, char))
{
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  long long v18 = *(_OWORD *)(a1 + 96);
  long long v19 = *(_OWORD *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 128);
  long long v17 = *(_OWORD *)(a1 + 112);
  long long v15 = *(_OWORD *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 160);
  uint64_t v11 = *(void *)(a1 + 168);
  char v12 = *(unsigned char *)(a1 + 176);
  a2(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
  char v14 = v12;
  a3(v21, v20, v4, v5, v6, v7, v8, v9, v19, *((void *)&v19 + 1), v18, *((void *)&v18 + 1), v17, *((void *)&v17 + 1), v16, *((void *)&v16 + 1), v15, *((void *)&v15 + 1), v10,
    v11,
    v14);
  return a1;
}

uint64_t sub_24CBA4AA4(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t))
{
  BYTE4(v4) = *(unsigned char *)(a1 + 187);
  LODWORD(v4) = *(unsigned __int16 *)(a1 + 184) | (*(unsigned __int8 *)(a1 + 186) << 16);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_24CBA4B38(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CBA4B78(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CBA4BB8(uint64_t result)
{
  *(unsigned char *)(result + 162) = 1;
  return result;
}

unint64_t sub_24CBA4BC4()
{
  unint64_t result = qword_2698155B8;
  if (!qword_2698155B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698155C0);
    sub_24CB03084(&qword_269815570, &qword_269815560);
    sub_24CB03084(&qword_269815568, &qword_269815558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698155B8);
  }
  return result;
}

unint64_t sub_24CBA4C88()
{
  unint64_t result = qword_2698155C8;
  if (!qword_2698155C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698155D0);
    sub_24CB03084(&qword_269815570, &qword_269815560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698155C8);
  }
  return result;
}

uint64_t sub_24CBA4D20(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  BYTE2(v4) = *(unsigned char *)(a1 + 162);
  LOWORD(v4) = *(_WORD *)(a1 + 160);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_24CBA4D9C(uint64_t result)
{
  *(unsigned char *)(result + 187) = 0;
  return result;
}

uint64_t sub_24CBA4DA4(uint64_t a1)
{
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 88);
  long long v13 = *(_OWORD *)(a1 + 136);
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v12 = *(_OWORD *)(a1 + 152);
  uint64_t v8 = *(void *)(a1 + 168);
  uint64_t v7 = *(void *)(a1 + 176);
  __int16 v9 = *(_WORD *)(a1 + 184);
  char v10 = *(unsigned char *)(a1 + 186);
  swift_retain();
  sub_24CBA4110(v19, v18, v17, v2, v3, v4, v5, v6, v16, *((uint64_t *)&v16 + 1), v15, *((uint64_t *)&v15 + 1), v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v8,
    v7,
    v9,
    v10);
  return a1;
}

uint64_t sub_24CBA4E90(uint64_t a1)
{
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 88);
  long long v13 = *(_OWORD *)(a1 + 136);
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v12 = *(_OWORD *)(a1 + 152);
  uint64_t v8 = *(void *)(a1 + 168);
  uint64_t v7 = *(void *)(a1 + 176);
  __int16 v9 = *(_WORD *)(a1 + 184);
  char v10 = *(unsigned char *)(a1 + 186);
  swift_release();
  sub_24CBA45E0(v19, v18, v17, v2, v3, v4, v5, v6, v16, *((uint64_t *)&v16 + 1), v15, *((uint64_t *)&v15 + 1), v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v8,
    v7,
    v9,
    v10);
  return a1;
}

uint64_t sub_24CBA4F7C(uint64_t result)
{
  *(unsigned char *)(result + 161) = 1;
  return result;
}

uint64_t sub_24CBA4F88(uint64_t result)
{
  *(unsigned char *)(result + 162) = 0;
  return result;
}

uint64_t sub_24CBA4F90(uint64_t result)
{
  *(unsigned char *)(result + 160) = 1;
  return result;
}

uint64_t sub_24CBA4F9C(uint64_t result)
{
  *(unsigned char *)(result + 161) = 0;
  return result;
}

uint64_t sub_24CBA4FA4(uint64_t result)
{
  *(unsigned char *)(result + 160) = 0;
  return result;
}

uint64_t sub_24CBA4FAC@<X0>(uint64_t a1@<X8>)
{
  return sub_24CB98D48(*(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(unsigned __int8 *)(v1 + 41), *(unsigned __int8 *)(v1 + 42), *(unsigned __int8 *)(v1 + 43), a1);
}

unint64_t sub_24CBA4FC8()
{
  unint64_t result = qword_269815610;
  if (!qword_269815610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269813C08);
    sub_24CB03084(&qword_269815618, &qword_269813C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815610);
  }
  return result;
}

uint64_t sub_24CBA5070@<X0>(void *a1@<X8>)
{
  return sub_24CB504C0(a1);
}

uint64_t sub_24CBA5098()
{
  return sub_24CB50564();
}

uint64_t sub_24CBA50C0@<X0>(uint64_t a1@<X8>)
{
  return sub_24CB9902C(*(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(unsigned __int8 *)(v1 + 41), *(unsigned __int8 *)(v1 + 42), a1);
}

uint64_t sub_24CBA50D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CBA5104(uint64_t a1)
{
  return a1;
}

double sub_24CBA5130(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 7;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 177) = 0u;
  return result;
}

uint64_t sub_24CBA5170()
{
  return sub_24CB9EE24(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_24CBA5180()
{
  unint64_t result = qword_2698156C8;
  if (!qword_2698156C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698156D0);
    sub_24CBA5220();
    sub_24CB03084(&qword_269813DB8, &qword_269813DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698156C8);
  }
  return result;
}

unint64_t sub_24CBA5220()
{
  unint64_t result = qword_2698156D8;
  if (!qword_2698156D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698156E0);
    sub_24CBA529C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698156D8);
  }
  return result;
}

unint64_t sub_24CBA529C()
{
  unint64_t result = qword_2698156E8;
  if (!qword_2698156E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698156F0);
    sub_24CBA5318();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698156E8);
  }
  return result;
}

unint64_t sub_24CBA5318()
{
  unint64_t result = qword_2698156F8;
  if (!qword_2698156F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815700);
    sub_24CBA53B8();
    sub_24CB03084(&qword_269815738, &qword_269815740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698156F8);
  }
  return result;
}

unint64_t sub_24CBA53B8()
{
  unint64_t result = qword_269815708;
  if (!qword_269815708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815710);
    sub_24CB03084(&qword_269815718, &qword_269815720);
    sub_24CB03084(&qword_269815728, &qword_269815730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815708);
  }
  return result;
}

unint64_t sub_24CBA547C()
{
  unint64_t result = qword_269815748;
  if (!qword_269815748)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815750);
    sub_24CBA551C();
    sub_24CB03084(&qword_269813DB8, &qword_269813DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815748);
  }
  return result;
}

unint64_t sub_24CBA551C()
{
  unint64_t result = qword_269815758;
  if (!qword_269815758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815760);
    sub_24CBA5598();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815758);
  }
  return result;
}

unint64_t sub_24CBA5598()
{
  unint64_t result = qword_269815768;
  if (!qword_269815768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815770);
    sub_24CBA5614();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815768);
  }
  return result;
}

unint64_t sub_24CBA5614()
{
  unint64_t result = qword_269815778;
  if (!qword_269815778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815780);
    sub_24CBA56B4();
    sub_24CB03084(&qword_269815738, &qword_269815740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815778);
  }
  return result;
}

unint64_t sub_24CBA56B4()
{
  unint64_t result = qword_269815788;
  if (!qword_269815788)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815790);
    sub_24CB03084(&qword_269815798, &qword_2698157A0);
    sub_24CB03084(&qword_269815728, &qword_269815730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815788);
  }
  return result;
}

unint64_t sub_24CBA5778()
{
  unint64_t result = qword_2698157A8;
  if (!qword_2698157A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698156A0);
    sub_24CBA5818();
    sub_24CB03084(&qword_269813DB8, &qword_269813DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698157A8);
  }
  return result;
}

unint64_t sub_24CBA5818()
{
  unint64_t result = qword_2698157B0;
  if (!qword_2698157B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698157B8);
    sub_24CB03084(&qword_2698157C0, &qword_2698157C8);
    sub_24CB03084(&qword_269815728, &qword_269815730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698157B0);
  }
  return result;
}

unint64_t sub_24CBA58DC()
{
  unint64_t result = qword_2698157D0;
  if (!qword_2698157D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815690);
    sub_24CB03084(&qword_2698156B8, &qword_2698156A8);
    sub_24CBA2630(&qword_2698156C0, &qword_2698156B0, (void (*)(void))sub_24CBA5180, (void (*)(void))sub_24CBA547C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698157D0);
  }
  return result;
}

uint64_t sub_24CBA59C0()
{
  return sub_24CBA02EC(*(void *)(v0 + 16));
}

uint64_t sub_24CBA59CC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CBA5A44()
{
  unint64_t result = qword_2698157E8;
  if (!qword_2698157E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698157F0);
    sub_24CBA5ACC();
    sub_24CBA5C64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698157E8);
  }
  return result;
}

unint64_t sub_24CBA5ACC()
{
  unint64_t result = qword_2698157F8;
  if (!qword_2698157F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815800);
    sub_24CBA5B48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698157F8);
  }
  return result;
}

unint64_t sub_24CBA5B48()
{
  unint64_t result = qword_269815808;
  if (!qword_269815808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815810);
    sub_24CBA5BC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815808);
  }
  return result;
}

unint64_t sub_24CBA5BC4()
{
  unint64_t result = qword_269815818;
  if (!qword_269815818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815820);
    sub_24CB03084(&qword_269815828, &qword_269815830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815818);
  }
  return result;
}

unint64_t sub_24CBA5C64()
{
  unint64_t result = qword_269815838;
  if (!qword_269815838)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815840);
    sub_24CBA5CE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815838);
  }
  return result;
}

unint64_t sub_24CBA5CE0()
{
  unint64_t result = qword_269815848;
  if (!qword_269815848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815850);
    sub_24CBA5D5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815848);
  }
  return result;
}

unint64_t sub_24CBA5D5C()
{
  unint64_t result = qword_269815858;
  if (!qword_269815858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269815648);
    sub_24CBA87A8(&qword_269815860, MEMORY[0x263F1B7B8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269815858);
  }
  return result;
}

uint64_t sub_24CBA5E08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBAA6B8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CBA5E38()
{
  return sub_24CBAA6C8();
}

uint64_t sub_24CBA5E60()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24CBA6288(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24CBA0518(a1, v5, v1 + v4, v6);
}

uint64_t sub_24CBA6338@<X0>(uint64_t a1@<X8>)
{
  return sub_24CBA0624(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_24CBA6344(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269814D70);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 1;
  }
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * (v5 >> 5);
  uint64_t v6 = sub_24CBA7138((uint64_t)&v8, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_24CBA880C();
  if (v6 != v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

size_t sub_24CBA642C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269815910);
  uint64_t v3 = *(void *)(type metadata accessor for _DDNodeDecoration(0) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_24CBA7340(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_24CBA880C();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24CBA6580(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  if (v5 <= 0)
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      unint64_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return (uint64_t)v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269814578);
  uint64_t v8 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = _swift_stdlib_malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24CBABA68();
  __break(1u);
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CBA6BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24CBA0C40(a1, v6, a2);
}

uint64_t sub_24CBA6C60()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t *sub_24CBA7088@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  double v9 = *(double *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24CBA1224(a1, v7, v8, v2 + v6, a2, v9);
}

uint64_t sub_24CBA7138(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
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
    long long v20 = *(_OWORD *)(*(void *)(a4 + 56) + 16 * v16);
    ++v13;
    *uint64_t v11 = *(_OWORD *)(*(void *)(a4 + 48) + 16 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_retain();
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

uint64_t sub_24CBA7340(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for _DDNodeDecoration(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  int64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)&v29 - v14;
  uint64_t v34 = a4;
  uint64_t v17 = a4 + 64;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v31 = -1 << *(unsigned char *)(a4 + 32);
  if (-v31 < 64) {
    uint64_t v18 = ~(-1 << -(char)v31);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_34:
    uint64_t v28 = ~v31;
    *a1 = v34;
    a1[1] = v17;
    a1[2] = v28;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_34;
  }
  if (a3 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v30 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v32 = v17;
  int64_t v33 = (unint64_t)(63 - v31) >> 6;
  int64_t v29 = v33 - 1;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v23 = v22 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v27 = *(void *)(v9 + 72);
    sub_24CBA8814(*(void *)(v34 + 56) + v27 * v23, (uint64_t)v12, type metadata accessor for _DDNodeDecoration);
    sub_24CBA887C((uint64_t)v12, (uint64_t)v15, type metadata accessor for _DDNodeDecoration);
    uint64_t result = sub_24CBA887C((uint64_t)v15, a2, type metadata accessor for _DDNodeDecoration);
    if (v21 == a3) {
      goto LABEL_33;
    }
    a2 += v27;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v24 >= v33)
    {
      unint64_t v19 = 0;
      a3 = v21;
LABEL_33:
      a1 = v30;
      uint64_t v17 = v32;
      goto LABEL_34;
    }
    uint64_t v17 = v32;
    unint64_t v25 = *(void *)(v32 + 8 * v24);
    if (!v25) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v20 = v24;
  }
  v20 += 2;
  if (v24 + 1 >= v33)
  {
    unint64_t v19 = 0;
    int64_t v20 = v24;
LABEL_39:
    a3 = v21;
    a1 = v30;
    goto LABEL_34;
  }
  unint64_t v25 = *(void *)(v32 + 8 * v20);
  if (v25) {
    goto LABEL_14;
  }
  int64_t v26 = v24 + 2;
  if (v24 + 2 >= v33) {
    goto LABEL_36;
  }
  unint64_t v25 = *(void *)(v32 + 8 * v26);
  if (v25) {
    goto LABEL_17;
  }
  int64_t v20 = v24 + 3;
  if (v24 + 3 >= v33)
  {
    unint64_t v19 = 0;
    int64_t v20 = v24 + 2;
    goto LABEL_39;
  }
  unint64_t v25 = *(void *)(v32 + 8 * v20);
  if (v25)
  {
LABEL_14:
    int64_t v24 = v20;
    goto LABEL_18;
  }
  int64_t v26 = v24 + 4;
  if (v24 + 4 >= v33)
  {
LABEL_36:
    unint64_t v19 = 0;
    goto LABEL_39;
  }
  unint64_t v25 = *(void *)(v32 + 8 * v26);
  if (v25)
  {
LABEL_17:
    int64_t v24 = v26;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v24 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v24 >= v33)
    {
      unint64_t v19 = 0;
      int64_t v20 = v29;
      goto LABEL_39;
    }
    unint64_t v25 = *(void *)(v32 + 8 * v24);
    ++v26;
    if (v25) {
      goto LABEL_18;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

size_t sub_24CBA7664(uint64_t a1)
{
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698158F8);
  uint64_t v2 = MEMORY[0x270FA5388](v43);
  uint64_t v48 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v47 = (void *)((char *)v41 - v5);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v41 - v6;
  uint64_t v49 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  uint64_t v46 = v10;
  v41[0] = a1;
  if (v10)
  {
    uint64_t v42 = (v9 + 32) & ~v9;
    uint64_t v12 = MEMORY[0x263F8EE78] + v42;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    uint64_t v44 = v7;
    uint64_t v45 = v17;
    v41[1] = v9 | 7;
    uint64_t v18 = v11;
    uint64_t v19 = v43;
    while (1)
    {
      uint64_t v21 = (uint64_t)&v48[*(int *)(v19 + 48)];
      sub_24CBA8814(v16, v21, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
      uint64_t v22 = (uint64_t)v47;
      uint64_t v23 = (uint64_t)v47 + *(int *)(v19 + 48);
      *uint64_t v47 = v13;
      sub_24CBA887C(v21, v23, (uint64_t (*)(void))type metadata accessor for _DDNodeViewModel);
      size_t result = sub_24CB033C4(v22, (uint64_t)v7, &qword_2698158F8);
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
        __swift_instantiateConcreteTypeFromMangledName(&qword_269815900);
        uint64_t v28 = *(void *)(v49 + 72);
        uint64_t v29 = v42;
        uint64_t v11 = (void *)swift_allocObject();
        size_t result = _swift_stdlib_malloc_size(v11);
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
        int64_t v33 = (char *)v11 + v29;
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
        uint64_t v12 = (uint64_t)&v33[v35];
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
      sub_24CB033C4((uint64_t)v44, v12, &qword_2698158F8);
      v12 += *(void *)(v49 + 72);
      v16 += v45;
      uint64_t v18 = v11;
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

uint64_t sub_24CBA7A0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24CBA1628(a1, v6, a2);
}

uint64_t sub_24CBA7ABC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL UIInterfaceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t sub_24CBA7B2C()
{
  return sub_24CBA1D4C(*(void *)(v0 + 16), *(double *)(v0 + 32));
}

unint64_t sub_24CBA7B3C()
{
  unint64_t result = qword_2698158E0;
  if (!qword_2698158E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698158C8);
    sub_24CBA87A8(&qword_269815880, (void (*)(uint64_t))type metadata accessor for _DDNodeView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698158E0);
  }
  return result;
}

uint64_t objectdestroy_105Tm()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24CBA800C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24CBA1FAC(a1, v6, a2);
}

uint64_t sub_24CBA80C0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CBA80F8(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698158F8);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t objectdestroy_99Tm()
{
  uint64_t v1 = (int *)type metadata accessor for _DDDevicePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v31 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v3 = (int *)type metadata accessor for _DDNodeViewModel();
  uint64_t v4 = *(unsigned __int8 *)(*((void *)v3 - 1) + 80);
  uint64_t v30 = *(void *)(*((void *)v3 - 1) + 64);
  uint64_t v5 = v0 + ((v2 + 16) & ~v2);
  sub_24CB2BDF0();
  sub_24CB2BDF0();
  swift_release();
  uint64_t v6 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812ED8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CBAA4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CBAA928();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[9];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_24CBAA928();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  sub_24CB0011C(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v14 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269813340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_24CBAA4E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v5 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269812EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_24CBAA2E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectWeakDestroy();
  uint64_t v18 = (uint64_t *)(v5 + v1[17]);
  unint64_t v19 = v18[1];
  if (v19 >> 60 != 15) {
    sub_24CB19BD0(*v18, v19);
  }
  uint64_t v20 = v2 | v4 | 7;
  uint64_t v21 = (((v2 + 16) & ~v2) + v31 + v4) & ~v4;
  uint64_t v22 = v21 + v30;
  swift_release();
  uint64_t v23 = v0 + v21;
  uint64_t v24 = sub_24CBA9788();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v0 + v21, v24);
  uint64_t v25 = v0 + v21 + v3[5];
  sub_24CB000B8(*(void *)v25, *(void *)(v25 + 8), *(void *)(v25 + 16), *(void *)(v25 + 24), *(unsigned char *)(v25 + 32));
  swift_bridgeObjectRelease();
  uint64_t v26 = v0 + v21 + v3[7];
  uint64_t v27 = sub_24CBA9738();
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8);
  v28(v26, v27);
  v28(v23 + v3[8], v27);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v22, v20);
}

uint64_t sub_24CBA86D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for _DDDevicePickerView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for _DDNodeViewModel() - 8);
  return sub_24CBA1A34(a1, v1 + v4, v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
}

uint64_t sub_24CBA87A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CBA87F0()
{
  return swift_retain();
}

uint64_t sub_24CBA8804()
{
  return swift_retain();
}

uint64_t sub_24CBA880C()
{
  return swift_release();
}

uint64_t sub_24CBA8814(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CBA887C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CBA88E4()
{
  return sub_24CBA2630(&qword_269815918, &qword_269815920, (void (*)(void))sub_24CBA24D8, (void (*)(void))sub_24CBA25F4);
}

id sub_24CBA8B68()
{
  return sub_24CBA8E68(type metadata accessor for CNSecureFieldPickerViewController);
}

uint64_t type metadata accessor for CNSecureFieldPickerViewController()
{
  return self;
}

void sub_24CBA8BA4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25330B830](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    a3();
  }
}

id sub_24CBA8E50()
{
  return sub_24CBA8E68(type metadata accessor for FieldPickerViewController);
}

id sub_24CBA8E68(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for FieldPickerViewController()
{
  return self;
}

uint64_t destroy for FieldPickerView(id *a1)
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for FieldPickerView(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  long long v8 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v8;
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  id v5 = v3;
  id v6 = (id)v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FieldPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  long long v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FieldPickerView(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FieldPickerView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FieldPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FieldPickerView()
{
  return &type metadata for FieldPickerView;
}

id sub_24CBA91A0()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v7 = (objc_class *)type metadata accessor for FieldPickerViewController();
  long long v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_presentedContact] = v1;
  *(void *)&v8[OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_selectionFromContact] = v2;
  id v9 = &v8[OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_fieldSaveHandler];
  *(void *)id v9 = v4;
  *((void *)v9 + 1) = v3;
  uint64_t v10 = &v8[OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_dismissHandler];
  *(void *)uint64_t v10 = v6;
  *((void *)v10 + 1) = v5;
  id v11 = objc_allocWithZone((Class)type metadata accessor for CNSecureFieldPickerViewController());
  id v12 = v1;
  id v13 = v2;
  swift_retain_n();
  swift_retain_n();
  id v14 = v12;
  id v15 = v13;
  id v16 = objc_msgSend(v11, sel_initWithNameDrop_fieldSelections_, v14, v15);
  v26.receiver = v8;
  v26.super_class = v7;
  id v17 = objc_msgSendSuper2(&v26, sel_initWithRootViewController_, v16);
  objc_msgSend(v16, sel_setDelegate_, v17);
  sub_24CB0BCB4(0, (unint64_t *)&unk_2698159C0);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = v6;
  v19[4] = v5;
  swift_retain();
  uint64_t v20 = (void *)sub_24CBAB7A8();
  sub_24CB0BCB4(0, &qword_269815358);
  id v21 = v20;
  uint64_t v22 = (void *)sub_24CBAB6B8();
  objc_msgSend(v22, sel_setStyle_, 2, 0, 0, 0, sub_24CBA95F0, v19);
  id v23 = objc_msgSend(v16, sel_navigationItem);
  id v24 = v22;
  objc_msgSend(v23, sel_setRightBarButtonItem_, v24);

  swift_release();
  swift_release();
  return v17;
}

uint64_t sub_24CBA9434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CBA9524();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_24CBA9498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CBA9524();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_24CBA94FC()
{
}

unint64_t sub_24CBA9524()
{
  unint64_t result = qword_2698159B8;
  if (!qword_2698159B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698159B8);
  }
  return result;
}

uint64_t sub_24CBA9578()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CBA95B0()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24CBA95F0(uint64_t a1)
{
  sub_24CBA8BA4(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_24CBA95FC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24CBA96A8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24CBA96B8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CBA96C8()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_24CBA96D8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24CBA96E8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24CBA96F8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CBA9708()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24CBA9718()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CBA9728()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24CBA9738()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24CBA9748()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CBA9758()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24CBA9768()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24CBA9778()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CBA9788()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CBA9798()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24CBA97A8()
{
  return MEMORY[0x270F57FB0]();
}

uint64_t sub_24CBA97B8()
{
  return MEMORY[0x270F57FC0]();
}

uint64_t sub_24CBA97C8()
{
  return MEMORY[0x270F57FC8]();
}

uint64_t sub_24CBA97D8()
{
  return MEMORY[0x270F18660]();
}

uint64_t sub_24CBA97E8()
{
  return MEMORY[0x270F18668]();
}

uint64_t sub_24CBA97F8()
{
  return MEMORY[0x270F18670]();
}

uint64_t sub_24CBA9808()
{
  return MEMORY[0x270F18678]();
}

uint64_t sub_24CBA9818()
{
  return MEMORY[0x270F18680]();
}

uint64_t sub_24CBA9828()
{
  return MEMORY[0x270F25AF0]();
}

uint64_t sub_24CBA9838()
{
  return MEMORY[0x270F25AF8]();
}

uint64_t sub_24CBA9848()
{
  return MEMORY[0x270F25B00]();
}

uint64_t sub_24CBA9858()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24CBA9868()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CBA9878()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CBA9888()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CBA9898()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24CBA98A8()
{
  return MEMORY[0x270EE3858]();
}

uint64_t sub_24CBA98B8()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24CBA98C8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24CBA98D8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24CBA98E8()
{
  return MEMORY[0x270EE3C40]();
}

uint64_t sub_24CBA98F8()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_24CBA9908()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_24CBA9918()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24CBA9928()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_24CBA9938()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24CBA9948()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_24CBA9958()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24CBA9968()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24CBA9978()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24CBA9988()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24CBA9998()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24CBA99A8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24CBA99B8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_24CBA99C8()
{
  return MEMORY[0x270EE3F38]();
}

uint64_t sub_24CBA99D8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_24CBA99E8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_24CBA99F8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24CBA9A08()
{
  return MEMORY[0x270EF7108]();
}

uint64_t sub_24CBA9A18()
{
  return MEMORY[0x270EF7118]();
}

uint64_t sub_24CBA9A28()
{
  return MEMORY[0x270F631B0]();
}

uint64_t sub_24CBA9A38()
{
  return MEMORY[0x270EF7180]();
}

uint64_t sub_24CBA9A48()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_24CBA9A58()
{
  return MEMORY[0x270EF72C0]();
}

uint64_t sub_24CBA9A68()
{
  return MEMORY[0x270F631B8]();
}

uint64_t sub_24CBA9A78()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_24CBA9A88()
{
  return MEMORY[0x270EF7838]();
}

uint64_t sub_24CBA9A98()
{
  return MEMORY[0x270EF7858]();
}

uint64_t sub_24CBA9AA8()
{
  return MEMORY[0x270EF7860]();
}

uint64_t sub_24CBA9AB8()
{
  return MEMORY[0x270EF7870]();
}

uint64_t sub_24CBA9AC8()
{
  return MEMORY[0x270EF7880]();
}

uint64_t sub_24CBA9AD8()
{
  return MEMORY[0x270EF7888]();
}

uint64_t sub_24CBA9AE8()
{
  return MEMORY[0x270EF78A0]();
}

uint64_t sub_24CBA9AF8()
{
  return MEMORY[0x270EF78B0]();
}

uint64_t sub_24CBA9B08()
{
  return MEMORY[0x270EF78B8]();
}

uint64_t sub_24CBA9B18()
{
  return MEMORY[0x270EF78C0]();
}

uint64_t sub_24CBA9B28()
{
  return MEMORY[0x270F631F0]();
}

uint64_t sub_24CBA9B38()
{
  return MEMORY[0x270F631F8]();
}

uint64_t sub_24CBA9B48()
{
  return MEMORY[0x270F63200]();
}

uint64_t sub_24CBA9B58()
{
  return MEMORY[0x270F63208]();
}

uint64_t sub_24CBA9B68()
{
  return MEMORY[0x270F63210]();
}

uint64_t sub_24CBA9B78()
{
  return MEMORY[0x270F63218]();
}

uint64_t sub_24CBA9B88()
{
  return MEMORY[0x270F63230]();
}

uint64_t sub_24CBA9B98()
{
  return MEMORY[0x270F63240]();
}

uint64_t sub_24CBA9BB8()
{
  return MEMORY[0x270F63258]();
}

uint64_t sub_24CBA9BC8()
{
  return MEMORY[0x270F63260]();
}

uint64_t sub_24CBA9BD8()
{
  return MEMORY[0x270F63268]();
}

uint64_t sub_24CBA9BE8()
{
  return MEMORY[0x270F63270]();
}

uint64_t sub_24CBA9BF8()
{
  return MEMORY[0x270F63278]();
}

uint64_t sub_24CBA9C08()
{
  return MEMORY[0x270F63280]();
}

uint64_t sub_24CBA9C18()
{
  return MEMORY[0x270F63288]();
}

uint64_t sub_24CBA9C28()
{
  return MEMORY[0x270F63290]();
}

uint64_t sub_24CBA9C38()
{
  return MEMORY[0x270F63298]();
}

uint64_t sub_24CBA9C48()
{
  return MEMORY[0x270F632A0]();
}

uint64_t sub_24CBA9C58()
{
  return MEMORY[0x270F632A8]();
}

uint64_t sub_24CBA9C68()
{
  return MEMORY[0x270F632B0]();
}

uint64_t sub_24CBA9C78()
{
  return MEMORY[0x270F632B8]();
}

uint64_t sub_24CBA9C88()
{
  return MEMORY[0x270F632C0]();
}

uint64_t sub_24CBA9C98()
{
  return MEMORY[0x270F632C8]();
}

uint64_t sub_24CBA9CA8()
{
  return MEMORY[0x270F632D0]();
}

uint64_t sub_24CBA9CB8()
{
  return MEMORY[0x270F632D8]();
}

uint64_t sub_24CBA9CC8()
{
  return MEMORY[0x270F632E0]();
}

uint64_t sub_24CBA9CD8()
{
  return MEMORY[0x270F632E8]();
}

uint64_t sub_24CBA9CE8()
{
  return MEMORY[0x270F632F0]();
}

uint64_t sub_24CBA9CF8()
{
  return MEMORY[0x270F63318]();
}

uint64_t sub_24CBA9D08()
{
  return MEMORY[0x270F63320]();
}

uint64_t sub_24CBA9D18()
{
  return MEMORY[0x270F63328]();
}

uint64_t sub_24CBA9D28()
{
  return MEMORY[0x270F63330]();
}

uint64_t sub_24CBA9D38()
{
  return MEMORY[0x270F63338]();
}

uint64_t sub_24CBA9D48()
{
  return MEMORY[0x270F63340]();
}

uint64_t sub_24CBA9D68()
{
  return MEMORY[0x270F63350]();
}

uint64_t sub_24CBA9DE8()
{
  return MEMORY[0x270F63390]();
}

uint64_t sub_24CBA9DF8()
{
  return MEMORY[0x270F633D8]();
}

uint64_t sub_24CBA9E08()
{
  return MEMORY[0x270F633E0]();
}

uint64_t sub_24CBA9E18()
{
  return MEMORY[0x270F63400]();
}

uint64_t sub_24CBA9E28()
{
  return MEMORY[0x270F63410]();
}

uint64_t sub_24CBA9E38()
{
  return MEMORY[0x270F63418]();
}

uint64_t sub_24CBA9E48()
{
  return MEMORY[0x270F63420]();
}

uint64_t sub_24CBA9E58()
{
  return MEMORY[0x270F63428]();
}

uint64_t sub_24CBA9E68()
{
  return MEMORY[0x270F63430]();
}

uint64_t sub_24CBA9E78()
{
  return MEMORY[0x270F63438]();
}

uint64_t sub_24CBA9E88()
{
  return MEMORY[0x270F63440]();
}

uint64_t sub_24CBA9E98()
{
  return MEMORY[0x270F63448]();
}

uint64_t sub_24CBA9EA8()
{
  return MEMORY[0x270F63450]();
}

uint64_t sub_24CBA9EB8()
{
  return MEMORY[0x270F63458]();
}

uint64_t sub_24CBA9ED8()
{
  return MEMORY[0x270F63468]();
}

uint64_t sub_24CBA9EE8()
{
  return MEMORY[0x270F63470]();
}

uint64_t sub_24CBA9EF8()
{
  return MEMORY[0x270F63478]();
}

uint64_t sub_24CBA9F08()
{
  return MEMORY[0x270F63480]();
}

uint64_t sub_24CBA9F18()
{
  return MEMORY[0x270F63488]();
}

uint64_t sub_24CBA9F28()
{
  return MEMORY[0x270F63490]();
}

uint64_t sub_24CBA9F38()
{
  return MEMORY[0x270F634A0]();
}

uint64_t sub_24CBA9F48()
{
  return MEMORY[0x270F634A8]();
}

uint64_t sub_24CBA9F58()
{
  return MEMORY[0x270F634C0]();
}

uint64_t sub_24CBA9F68()
{
  return MEMORY[0x270F634C8]();
}

uint64_t sub_24CBA9F78()
{
  return MEMORY[0x270F634D0]();
}

uint64_t sub_24CBA9F88()
{
  return MEMORY[0x270F634D8]();
}

uint64_t sub_24CBA9F98()
{
  return MEMORY[0x270F634E0]();
}

uint64_t sub_24CBA9FA8()
{
  return MEMORY[0x270F634E8]();
}

uint64_t sub_24CBA9FB8()
{
  return MEMORY[0x270F63500]();
}

uint64_t sub_24CBA9FD8()
{
  return MEMORY[0x270F63510]();
}

uint64_t sub_24CBA9FE8()
{
  return MEMORY[0x270F63518]();
}

uint64_t sub_24CBA9FF8()
{
  return MEMORY[0x270F63520]();
}

uint64_t sub_24CBAA008()
{
  return MEMORY[0x270F63528]();
}

uint64_t sub_24CBAA018()
{
  return MEMORY[0x270F63530]();
}

uint64_t sub_24CBAA028()
{
  return MEMORY[0x270F63538]();
}

uint64_t sub_24CBAA038()
{
  return MEMORY[0x270F63540]();
}

uint64_t sub_24CBAA048()
{
  return MEMORY[0x270F63550]();
}

uint64_t sub_24CBAA058()
{
  return MEMORY[0x270F63558]();
}

uint64_t sub_24CBAA068()
{
  return MEMORY[0x270F63590]();
}

uint64_t sub_24CBAA078()
{
  return MEMORY[0x270F63598]();
}

uint64_t sub_24CBAA088()
{
  return MEMORY[0x270F635A0]();
}

uint64_t sub_24CBAA098()
{
  return MEMORY[0x270F635A8]();
}

uint64_t sub_24CBAA0A8()
{
  return MEMORY[0x270F635B0]();
}

uint64_t sub_24CBAA0B8()
{
  return MEMORY[0x270F635B8]();
}

uint64_t sub_24CBAA0D8()
{
  return MEMORY[0x270F635C8]();
}

uint64_t sub_24CBAA0E8()
{
  return MEMORY[0x270F635D0]();
}

uint64_t sub_24CBAA0F8()
{
  return MEMORY[0x270F635D8]();
}

uint64_t sub_24CBAA108()
{
  return MEMORY[0x270F635E0]();
}

uint64_t sub_24CBAA118()
{
  return MEMORY[0x270F635E8]();
}

uint64_t sub_24CBAA128()
{
  return MEMORY[0x270F635F0]();
}

uint64_t sub_24CBAA138()
{
  return MEMORY[0x270F635F8]();
}

uint64_t sub_24CBAA158()
{
  return MEMORY[0x270F63608]();
}

uint64_t sub_24CBAA168()
{
  return MEMORY[0x270F63610]();
}

uint64_t sub_24CBAA178()
{
  return MEMORY[0x270F63618]();
}

uint64_t sub_24CBAA188()
{
  return MEMORY[0x270F63620]();
}

uint64_t sub_24CBAA198()
{
  return MEMORY[0x270F63628]();
}

uint64_t sub_24CBAA1A8()
{
  return MEMORY[0x270F63630]();
}

uint64_t sub_24CBAA1B8()
{
  return MEMORY[0x270F63638]();
}

uint64_t sub_24CBAA1C8()
{
  return MEMORY[0x270F63640]();
}

uint64_t sub_24CBAA1D8()
{
  return MEMORY[0x270F63648]();
}

uint64_t sub_24CBAA1E8()
{
  return MEMORY[0x270F63650]();
}

uint64_t sub_24CBAA1F8()
{
  return MEMORY[0x270F63658]();
}

uint64_t sub_24CBAA208()
{
  return MEMORY[0x270F63660]();
}

uint64_t sub_24CBAA218()
{
  return MEMORY[0x270F63668]();
}

uint64_t sub_24CBAA228()
{
  return MEMORY[0x270F63670]();
}

uint64_t sub_24CBAA238()
{
  return MEMORY[0x270F63678]();
}

uint64_t sub_24CBAA248()
{
  return MEMORY[0x270F63680]();
}

uint64_t sub_24CBAA258()
{
  return MEMORY[0x270F63688]();
}

uint64_t sub_24CBAA268()
{
  return MEMORY[0x270F63690]();
}

uint64_t sub_24CBAA278()
{
  return MEMORY[0x270F63698]();
}

uint64_t sub_24CBAA288()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_24CBAA298()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_24CBAA2A8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24CBAA2B8()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_24CBAA2C8()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24CBAA2D8()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_24CBAA2E8()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24CBAA2F8()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_24CBAA308()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24CBAA318()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24CBAA328()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_24CBAA338()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24CBAA348()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_24CBAA358()
{
  return MEMORY[0x270EFF298]();
}

uint64_t sub_24CBAA368()
{
  return MEMORY[0x270EFF2B8]();
}

uint64_t sub_24CBAA378()
{
  return MEMORY[0x270EFF2C0]();
}

uint64_t sub_24CBAA388()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_24CBAA398()
{
  return MEMORY[0x270EFF3C8]();
}

uint64_t sub_24CBAA3A8()
{
  return MEMORY[0x270EFF588]();
}

uint64_t sub_24CBAA3B8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24CBAA3C8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24CBAA3D8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_24CBAA3E8()
{
  return MEMORY[0x270EFF698]();
}

uint64_t sub_24CBAA3F8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24CBAA408()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_24CBAA418()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_24CBAA428()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_24CBAA438()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_24CBAA448()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_24CBAA458()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_24CBAA468()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_24CBAA478()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_24CBAA488()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_24CBAA498()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_24CBAA4A8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_24CBAA4B8()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_24CBAA4C8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24CBAA4D8()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_24CBAA4E8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_24CBAA4F8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24CBAA508()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24CBAA518()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_24CBAA528()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_24CBAA538()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24CBAA548()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24CBAA558()
{
  return MEMORY[0x270F006C0]();
}

uint64_t sub_24CBAA568()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_24CBAA578()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_24CBAA588()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24CBAA598()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_24CBAA5A8()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_24CBAA5B8()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_24CBAA5C8()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_24CBAA5D8()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_24CBAA5E8()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_24CBAA5F8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24CBAA608()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24CBAA618()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_24CBAA628()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_24CBAA638()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_24CBAA648()
{
  return MEMORY[0x270F00B18]();
}

uint64_t sub_24CBAA658()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_24CBAA668()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_24CBAA678()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_24CBAA688()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_24CBAA698()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24CBAA6A8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24CBAA6B8()
{
  return MEMORY[0x270F00D28]();
}

uint64_t sub_24CBAA6C8()
{
  return MEMORY[0x270F00D30]();
}

uint64_t sub_24CBAA6D8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24CBAA6E8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24CBAA6F8()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24CBAA708()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24CBAA718()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24CBAA728()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24CBAA738()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_24CBAA748()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_24CBAA758()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24CBAA768()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24CBAA778()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24CBAA788()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24CBAA798()
{
  return MEMORY[0x270F011A8]();
}

uint64_t sub_24CBAA7A8()
{
  return MEMORY[0x270F011B0]();
}

uint64_t sub_24CBAA7B8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24CBAA7C8()
{
  return MEMORY[0x270F012E0]();
}

uint64_t sub_24CBAA7D8()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_24CBAA7E8()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_24CBAA7F8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24CBAA808()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24CBAA818()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24CBAA828()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24CBAA838()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24CBAA848()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24CBAA868()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24CBAA878()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24CBAA888()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24CBAA898()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24CBAA8A8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24CBAA8B8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24CBAA8D8()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24CBAA8E8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24CBAA8F8()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_24CBAA908()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24CBAA918()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24CBAA928()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_24CBAA938()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_24CBAA948()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_24CBAA958()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_24CBAA968()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_24CBAA978()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24CBAA988()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24CBAA998()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_24CBAA9A8()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_24CBAA9B8()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_24CBAA9C8()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_24CBAA9D8()
{
  return MEMORY[0x270F02498]();
}

uint64_t sub_24CBAA9E8()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_24CBAA9F8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24CBAAA08()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24CBAAA18()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24CBAAA38()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24CBAAA48()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24CBAAA58()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24CBAAA78()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24CBAAA88()
{
  return MEMORY[0x270F02768]();
}

uint64_t sub_24CBAAA98()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24CBAAAA8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24CBAAAB8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24CBAAAC8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24CBAAAD8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24CBAAAE8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24CBAAAF8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_24CBAAB08()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24CBAAB18()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24CBAAB28()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24CBAAB38()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_24CBAAB48()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24CBAAB58()
{
  return MEMORY[0x270F02B38]();
}

uint64_t sub_24CBAAB68()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24CBAAB78()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24CBAAB88()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_24CBAAB98()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24CBAABA8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24CBAABB8()
{
  return MEMORY[0x270F02BE0]();
}

uint64_t sub_24CBAABC8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_24CBAABD8()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_24CBAABE8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24CBAABF8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24CBAAC08()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24CBAAC18()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_24CBAAC28()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24CBAAC38()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24CBAAC48()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_24CBAAC58()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24CBAAC68()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24CBAAC78()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_24CBAAC88()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24CBAAC98()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_24CBAACA8()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_24CBAACB8()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_24CBAACC8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_24CBAACD8()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_24CBAACE8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24CBAACF8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24CBAAD08()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_24CBAAD18()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_24CBAAD28()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24CBAAD38()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24CBAAD48()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24CBAAD58()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24CBAAD68()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24CBAAD78()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_24CBAAD88()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24CBAAD98()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24CBAADA8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24CBAADB8()
{
  return MEMORY[0x270F03578]();
}

uint64_t sub_24CBAADC8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24CBAADD8()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_24CBAADE8()
{
  return MEMORY[0x270F03730]();
}

uint64_t sub_24CBAADF8()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_24CBAAE08()
{
  return MEMORY[0x270F03948]();
}

uint64_t sub_24CBAAE18()
{
  return MEMORY[0x270F03A30]();
}

uint64_t sub_24CBAAE28()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_24CBAAE38()
{
  return MEMORY[0x270F03DE0]();
}

uint64_t sub_24CBAAE48()
{
  return MEMORY[0x270F03EC0]();
}

uint64_t sub_24CBAAE58()
{
  return MEMORY[0x270F03F10]();
}

uint64_t sub_24CBAAE68()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_24CBAAE78()
{
  return MEMORY[0x270F04078]();
}

uint64_t sub_24CBAAE88()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24CBAAE98()
{
  return MEMORY[0x270F04288]();
}

uint64_t sub_24CBAAEA8()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24CBAAEB8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_24CBAAEC8()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_24CBAAED8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24CBAAEE8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24CBAAEF8()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24CBAAF08()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24CBAAF18()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24CBAAF28()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24CBAAF38()
{
  return MEMORY[0x270F04550]();
}

uint64_t sub_24CBAAF48()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24CBAAF58()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24CBAAF68()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24CBAAF78()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_24CBAAF88()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24CBAAF98()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24CBAAFA8()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24CBAAFB8()
{
  return MEMORY[0x270F046F0]();
}

uint64_t sub_24CBAAFC8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_24CBAAFD8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24CBAAFE8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24CBAAFF8()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_24CBAB008()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24CBAB018()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24CBAB028()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24CBAB038()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_24CBAB048()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24CBAB058()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_24CBAB068()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_24CBAB078()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_24CBAB088()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_24CBAB098()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_24CBAB0A8()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_24CBAB0B8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24CBAB0C8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_24CBAB0D8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_24CBAB0E8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_24CBAB0F8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24CBAB108()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24CBAB118()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24CBAB128()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_24CBAB138()
{
  return MEMORY[0x270F04E78]();
}

uint64_t sub_24CBAB148()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_24CBAB158()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_24CBAB168()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_24CBAB178()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_24CBAB188()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_24CBAB198()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_24CBAB1A8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24CBAB1B8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24CBAB1C8()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24CBAB1D8()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_24CBAB1E8()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_24CBAB1F8()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_24CBAB208()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_24CBAB218()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_24CBAB228()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_24CBAB238()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_24CBAB248()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_24CBAB258()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_24CBAB268()
{
  return MEMORY[0x270F05210]();
}

uint64_t sub_24CBAB278()
{
  return MEMORY[0x270F05220]();
}

uint64_t sub_24CBAB288()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_24CBAB298()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24CBAB2A8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24CBAB2B8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24CBAB2C8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24CBAB2D8()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24CBAB2E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24CBAB2F8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24CBAB308()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24CBAB318()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_24CBAB328()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24CBAB338()
{
  return MEMORY[0x270F63828]();
}

uint64_t sub_24CBAB358()
{
  return MEMORY[0x270F63838]();
}

uint64_t sub_24CBAB368()
{
  return MEMORY[0x270F63840]();
}

uint64_t sub_24CBAB378()
{
  return MEMORY[0x270F63848]();
}

uint64_t sub_24CBAB388()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24CBAB398()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24CBAB3A8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24CBAB3B8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24CBAB3C8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CBAB3D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CBAB3E8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_24CBAB3F8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24CBAB408()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24CBAB418()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CBAB428()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24CBAB438()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24CBAB448()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24CBAB458()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CBAB468()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24CBAB478()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24CBAB488()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CBAB498()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24CBAB4A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CBAB4B8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24CBAB4C8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24CBAB4D8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CBAB4E8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CBAB4F8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24CBAB508()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CBAB518()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CBAB528()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CBAB538()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24CBAB558()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CBAB568()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CBAB578()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24CBAB588()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CBAB598()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CBAB5A8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24CBAB5C8()
{
  return MEMORY[0x270F636A0]();
}

uint64_t sub_24CBAB5D8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24CBAB5E8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24CBAB5F8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24CBAB608()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24CBAB618()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_24CBAB628()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24CBAB638()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24CBAB648()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24CBAB658()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24CBAB668()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24CBAB678()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CBAB688()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24CBAB698()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CBAB6A8()
{
  return MEMORY[0x270F636B0]();
}

uint64_t sub_24CBAB6B8()
{
  return MEMORY[0x270F82478]();
}

uint64_t sub_24CBAB6C8()
{
  return MEMORY[0x270F25B08]();
}

uint64_t sub_24CBAB6D8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24CBAB6E8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24CBAB6F8()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_24CBAB708()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24CBAB718()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24CBAB728()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24CBAB738()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24CBAB748()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_24CBAB758()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_24CBAB768()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_24CBAB778()
{
  return MEMORY[0x270EF2150]();
}

uint64_t sub_24CBAB788()
{
  return MEMORY[0x270EF2160]();
}

uint64_t sub_24CBAB798()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24CBAB7A8()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_24CBAB7B8()
{
  return MEMORY[0x270F25B10]();
}

uint64_t sub_24CBAB7C8()
{
  return MEMORY[0x270F25B18]();
}

uint64_t sub_24CBAB7D8()
{
  return MEMORY[0x270F25B20]();
}

uint64_t sub_24CBAB7E8()
{
  return MEMORY[0x270F25B28]();
}

uint64_t sub_24CBAB7F8()
{
  return MEMORY[0x270F25B30]();
}

uint64_t sub_24CBAB808()
{
  return MEMORY[0x270F25B38]();
}

uint64_t sub_24CBAB818()
{
  return MEMORY[0x270F25B40]();
}

uint64_t sub_24CBAB828()
{
  return MEMORY[0x270F25B48]();
}

uint64_t sub_24CBAB838()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_24CBAB848()
{
  return MEMORY[0x270F636B8]();
}

uint64_t sub_24CBAB858()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CBAB868()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CBAB878()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CBAB888()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_24CBAB898()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24CBAB8A8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CBAB8C8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24CBAB8D8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CBAB8E8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24CBAB8F8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24CBAB908()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24CBAB918()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24CBAB928()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CBAB938()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CBAB948()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CBAB958()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CBAB968()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CBAB978()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CBAB988()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24CBAB998()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CBAB9A8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CBAB9B8()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24CBAB9C8()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24CBAB9D8()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24CBAB9E8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24CBAB9F8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CBABA08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CBABA18()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CBABA28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CBABA38()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CBABA48()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CBABA58()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CBABA68()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CBABA88()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CBABA98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CBABAA8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24CBABAB8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CBABAC8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_24CBABAD8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24CBABAE8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CBABAF8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24CBABB18()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24CBABB28()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CBABB38()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CBABB48()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CBABB58()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CBABB68()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CBABB78()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CBABB88()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24CBABB98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CBABBA8()
{
  return MEMORY[0x270FA00C0]();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CUNormalizeEmailAddress()
{
  return MEMORY[0x270F23F78]();
}

uint64_t CUNormalizePhoneNumber()
{
  return MEMORY[0x270F23F80]();
}

uint64_t SFDeviceModelCodeGet()
{
  return MEMORY[0x270F63700]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _DDUICoreLog()
{
  return MEMORY[0x270F25B50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t nw_endpoint_get_service_identifier()
{
  return MEMORY[0x270EF7F58]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}