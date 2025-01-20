id MediaAnalysisBlastDoorInterface.__allocating_init()()
{
  objc_class *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MediaAnalysisBlastDoorInterface.init()()
{
  uint64_t v10 = sub_25594EED0();
  uint64_t v1 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25594EEC0();
  MEMORY[0x270FA5388]();
  sub_25594ECD0();
  MEMORY[0x270FA5388]();
  v9[1] = sub_25594ED20();
  v4 = (void *)*MEMORY[0x263F2B8C0];
  sub_25594CCD0(0, &qword_269EFF5F8);
  v5 = v0;
  id v6 = v4;
  sub_25594ECC0();
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_25594D48C(&qword_269EFF600, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF608);
  sub_25594BC40();
  sub_25594EF10();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v10);
  sub_25594EEE0();
  *(void *)&v5[OBJC_IVAR___IMMediaAnalysisBlastDoorInterfaceInternal_bd] = sub_25594ECE0();

  v7 = (objc_class *)type metadata accessor for MediaAnalysisBlastDoorInterface();
  v11.receiver = v5;
  v11.super_class = v7;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_25594BC40()
{
  unint64_t result = qword_269EFF610;
  if (!qword_269EFF610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269EFF608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFF610);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for MediaAnalysisBlastDoorInterface()
{
  return self;
}

uint64_t sub_25594BD2C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6572506567616D69 && a2 == 0xED00007377656976) {
    return 1;
  }
  char v5 = sub_25594EF30();
  BOOL v6 = a1 == 0x6572506F65646976 && a2 == 0xED00007377656976;
  BOOL v7 = v6;
  if ((v5 & 1) != 0 || v7) {
    return 1;
  }

  return sub_25594EF30();
}

uint64_t sub_25594BF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a3;
  uint64_t v4 = sub_25594EE00();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  BOOL v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25594EE40();
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF620);
  ((void (*)(void))MEMORY[0x270FA5388])();
  objc_super v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25594EE60();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v21 - v17;
  sub_25594EC40();
  sub_25594EE50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_25594EE30();
  sub_25594EDF0();
  sub_25594EE10();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = v26;
  sub_25594D48C(&qword_269EFF638, MEMORY[0x263F2AD48]);
  swift_retain();
  sub_25594ED00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_25594C438(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF620);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25594C498(uint64_t a1, void (*a2)(void *, void *))
{
  uint64_t v4 = sub_25594EE10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF670);
  MEMORY[0x270FA5388]();
  v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25594E560(a1, (uint64_t)v9, &qword_269EFF670);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = (void *)*v9;
    MEMORY[0x25A2914D0](*v9);
    a2(0, v10);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v5 + 32))(v7, v9, v4);
    objc_super v11 = (void *)sub_25594EDE0();
    a2(v11, 0);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_25594C660()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25594C698(uint64_t a1)
{
  sub_25594C498(a1, *(void (**)(void *, void *))(v1 + 16));
}

void sub_25594C7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_25594EC20();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_25594C828(uint64_t a1, float a2, float a3)
{
  v28[2] = a1;
  uint64_t v36 = sub_25594ED60();
  v28[0] = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  v35 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25594EE60();
  MEMORY[0x270FA5388](v6 - 8);
  v28[1] = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25594EE40();
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  MEMORY[0x270FA5388](v8);
  v30 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25594ED40();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  MEMORY[0x270FA5388](v10);
  v29 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25594EEB0();
  sub_25594CCD0(0, &qword_269EFF640);
  uint64_t v12 = (void *)sub_25594EEF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF648);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25594F3A0;
  float v39 = a2;
  char v40 = 0;
  uint64_t v14 = sub_25594EE20();
  uint64_t v16 = v15;
  uint64_t v17 = MEMORY[0x263F8D310];
  *(void *)(v13 + 56) = MEMORY[0x263F8D310];
  unint64_t v18 = sub_25594CD0C();
  *(void *)(v13 + 64) = v18;
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  float v37 = a3;
  char v38 = 0;
  uint64_t v19 = sub_25594EE20();
  *(void *)(v13 + 96) = v17;
  *(void *)(v13 + 104) = v18;
  *(void *)(v13 + 72) = v19;
  *(void *)(v13 + 80) = v20;
  sub_25594ECB0();

  swift_bridgeObjectRelease();
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (a2 >= 9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v21 = v29;
  sub_25594ED30();
  sub_25594EC40();
  uint64_t v22 = v28[3];
  sub_25594EE50();
  if (!v22)
  {
    uint64_t v23 = v30;
    sub_25594EE30();
    sub_25594D48C(&qword_269EFF658, MEMORY[0x263F2AD28]);
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    sub_25594ED10();
    uint64_t v26 = sub_25594ED50();
    (*(void (**)(char *, uint64_t))(v28[0] + 8))(v25, v24);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v34);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v32);
    return v26;
  }
LABEL_9:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25594CCD0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_25594CD0C()
{
  unint64_t result = qword_269EFF650;
  if (!qword_269EFF650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFF650);
  }
  return result;
}

uint64_t sub_25594CEE8(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a3;
  uint64_t v6 = sub_25594EC70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25594EE60();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v25 = sub_25594EE40();
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25594ED90();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    uint64_t v22 = v16;
    uint64_t v23 = v7;
    uint64_t v24 = v6;
    sub_25594ED80();
    sub_25594EC40();
    sub_25594EE50();
    sub_25594EE30();
    sub_25594EDD0();
    sub_25594EC60();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v26;
    *(void *)(v19 + 24) = a4;
    sub_25594D48C(&qword_269EFF660, MEMORY[0x263F2AD38]);
    swift_retain();
    sub_25594ECF0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v22);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_25594D2BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  uint64_t v6 = sub_25594EDD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF668);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25594E560(a1, (uint64_t)v12, &qword_269EFF668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = (void *)*v12;
    MEMORY[0x25A2914D0](*v12);
    a4(0, v13);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v7 + 32))(v9, v12, v6);
    uint64_t v14 = (void *)sub_25594EDA0();
    a4(v14, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_25594D484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25594D2BC(a1, a2, a3, *(void (**)(void *, void *))(v3 + 16));
}

uint64_t sub_25594D48C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25594D638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = a1;
  uint64_t v32 = a8;
  LODWORD(v33) = a7;
  uint64_t v30 = a6;
  int v29 = a5;
  uint64_t v28 = a4;
  uint64_t v9 = sub_25594EC70();
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25594EE60();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = sub_25594EE40();
  uint64_t v36 = *(void *)(v13 - 8);
  uint64_t v37 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_25594ED90();
  uint64_t v34 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25594EDC0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v28 - v23;
  sub_25594EDB0();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v33 = v18;
  v25(v22, v24, v18);
  sub_25594ED70();
  sub_25594EC40();
  sub_25594EE50();
  sub_25594EE30();
  sub_25594EDD0();
  sub_25594EC60();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v32;
  *(void *)(v26 + 24) = a9;
  sub_25594D48C(&qword_269EFF660, MEMORY[0x263F2AD38]);
  swift_retain();
  sub_25594ECF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v37);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v24, v33);
}

void sub_25594DA98(uint64_t a1, uint64_t a2, char a3, void (*a4)(void *, void *, void))
{
  uint64_t v7 = sub_25594EDD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF668);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25594E560(a1, (uint64_t)v13, &qword_269EFF668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = (void *)*v13;
    MEMORY[0x25A2914D0](*v13);
    a4(0, v14, a3 & 1);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v8 + 32))(v10, v13, v7);
    uint64_t v15 = (void *)sub_25594EDA0();
    a4(v15, 0, a3 & 1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_25594DC6C(uint64_t a1, uint64_t a2, char a3)
{
  sub_25594DA98(a1, a2, a3, *(void (**)(void *, void *, void))(v3 + 16));
}

void sub_25594DDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    uint64_t v6 = sub_25594EC20();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1);
}

id MediaAnalysisBlastDoorInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaAnalysisBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MediaAnalysisBlastDoorInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MediaAnalysisBlastDoorInterface);
}

uint64_t dispatch thunk of static MediaAnalysisBlastDoorInterface.supports(feature:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMetadata(forAttachmentWith:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateImagePreview(for:maxPixelDimension:scale:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMovieFrames(forAttachmentWith:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t sub_25594DFD0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25594E008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25594DDF4(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25594E010(uint64_t a1, uint64_t a2)
{
  sub_25594C7B8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_25594E018(uint64_t a1, uint64_t a2, const void *a3)
{
  v22[1] = a2;
  uint64_t v4 = sub_25594EE00();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v24 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25594EE40();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  id v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF620);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25594EE60();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v22 - v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  _Block_copy(a3);
  sub_25594EC40();
  sub_25594EE50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  sub_25594EE30();
  uint64_t v19 = v24;
  sub_25594EDF0();
  sub_25594EE10();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_25594E5C4;
  *(void *)(v20 + 24) = v18;
  sub_25594D48C(&qword_269EFF638, MEMORY[0x263F2AD48]);
  swift_retain();
  sub_25594ED00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v27);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v25);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return swift_release();
}

uint64_t sub_25594E560(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t MessageType.init(rawValue:)(unsigned __int8 a1)
{
  return sub_25594E784(a1) & 0x1FF;
}

BOOL sub_25594E608(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25594E620()
{
  return sub_25594EF50();
}

uint64_t sub_25594E650@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25594E784(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

void sub_25594E684(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PreviewType.init(rawValue:)(unsigned __int8 a1)
{
  unsigned __int8 v1 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unsigned __int8 v1 = a1;
    }
    else {
      unsigned __int8 v1 = 0;
    }
    int v2 = a1 != 1;
  }
  else
  {
    int v2 = 0;
  }
  return v1 | (v2 << 8);
}

uint64_t sub_25594E6C8()
{
  return sub_25594EF60();
}

uint64_t sub_25594E710()
{
  return sub_25594EF60();
}

char *sub_25594E754@<X0>(char *result@<X0>, char *a2@<X8>)
{
  int v2 = *result;
  if (*result) {
    char v3 = 0;
  }
  else {
    char v3 = *result;
  }
  BOOL v4 = v2 != 0;
  BOOL v5 = v2 == 1;
  if (v2 == 1) {
    char v6 = 1;
  }
  else {
    char v6 = v3;
  }
  BOOL v7 = !v5 && v4;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_25594E784(unsigned __int8 a1)
{
  int v1 = 0;
  switch(a1)
  {
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x74u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x83u:
    case 0x86u:
    case 0x87u:
    case 0x8Bu:
    case 0xAAu:
    case 0xB4u:
    case 0xB5u:
    case 0xBEu:
    case 0xC3u:
    case 0xC4u:
      return a1 | (v1 << 8);
    default:
      a1 = 0;
      int v1 = 1;
      break;
  }
  return a1 | (v1 << 8);
}

unint64_t sub_25594E960()
{
  unint64_t result = qword_269EFF678;
  if (!qword_269EFF678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFF678);
  }
  return result;
}

unint64_t sub_25594E9B8()
{
  unint64_t result = qword_269EFF680;
  if (!qword_269EFF680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFF680);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

ValueMetadata *type metadata accessor for PreviewType()
{
  return &type metadata for PreviewType;
}

uint64_t NSUserDefaults.isMessagesLockdownModeEnabled.getter()
{
  int v1 = v0;
  sub_25594ECA0();
  int v2 = (void *)sub_25594EC80();
  char v3 = MEMORY[0x25A290F90]();

  if (v3) {
    return 1;
  }
  BOOL v5 = (void *)sub_25594EE90();
  id v6 = objc_msgSend(v1, sel_objectForKey_inDomain_, v5, *MEMORY[0x263F08100]);

  if (v6)
  {
    sub_25594EF00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_25594EB58((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast()) {
      return v7;
    }
  }
  else
  {
    sub_25594EBC0((uint64_t)v9);
  }
  return 0;
}

uint64_t sub_25594EB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25594EBC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFF688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25594EC20()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25594EC30()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25594EC40()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25594EC50()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25594EC60()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25594EC70()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25594EC80()
{
  return MEMORY[0x270F47B30]();
}

uint64_t sub_25594EC90()
{
  return MEMORY[0x270F47B38]();
}

uint64_t sub_25594ECA0()
{
  return MEMORY[0x270F47B40]();
}

uint64_t sub_25594ECB0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25594ECC0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25594ECD0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25594ECE0()
{
  return MEMORY[0x270F10CB8]();
}

uint64_t sub_25594ECF0()
{
  return MEMORY[0x270F10CC0]();
}

uint64_t sub_25594ED00()
{
  return MEMORY[0x270F10CC8]();
}

uint64_t sub_25594ED10()
{
  return MEMORY[0x270F10CD8]();
}

uint64_t sub_25594ED20()
{
  return MEMORY[0x270F10CE8]();
}

uint64_t sub_25594ED30()
{
  return MEMORY[0x270F10F58]();
}

uint64_t sub_25594ED40()
{
  return MEMORY[0x270F10F60]();
}

uint64_t sub_25594ED50()
{
  return MEMORY[0x270F10F68]();
}

uint64_t sub_25594ED60()
{
  return MEMORY[0x270F10F70]();
}

uint64_t sub_25594ED70()
{
  return MEMORY[0x270F10F78]();
}

uint64_t sub_25594ED80()
{
  return MEMORY[0x270F10F80]();
}

uint64_t sub_25594ED90()
{
  return MEMORY[0x270F10F88]();
}

uint64_t sub_25594EDA0()
{
  return MEMORY[0x270F10F90]();
}

uint64_t sub_25594EDB0()
{
  return MEMORY[0x270F10F98]();
}

uint64_t sub_25594EDC0()
{
  return MEMORY[0x270F10FA0]();
}

uint64_t sub_25594EDD0()
{
  return MEMORY[0x270F10FA8]();
}

uint64_t sub_25594EDE0()
{
  return MEMORY[0x270F10FB0]();
}

uint64_t sub_25594EDF0()
{
  return MEMORY[0x270F10FB8]();
}

uint64_t sub_25594EE00()
{
  return MEMORY[0x270F10FC0]();
}

uint64_t sub_25594EE10()
{
  return MEMORY[0x270F10FC8]();
}

uint64_t sub_25594EE20()
{
  return MEMORY[0x270F119B0]();
}

uint64_t sub_25594EE30()
{
  return MEMORY[0x270F11B10]();
}

uint64_t sub_25594EE40()
{
  return MEMORY[0x270F11B20]();
}

uint64_t sub_25594EE50()
{
  return MEMORY[0x270F11B30]();
}

uint64_t sub_25594EE60()
{
  return MEMORY[0x270F11B40]();
}

uint64_t sub_25594EE70()
{
  return MEMORY[0x270F12660]();
}

uint64_t sub_25594EE80()
{
  return MEMORY[0x270F12688]();
}

uint64_t sub_25594EE90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25594EEA0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25594EEB0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25594EEC0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25594EED0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25594EEE0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25594EEF0()
{
  return MEMORY[0x270F126A0]();
}

uint64_t sub_25594EF00()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25594EF10()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25594EF20()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25594EF30()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25594EF40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25594EF50()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25594EF60()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}