uint64_t sub_252730728()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_252730744@<Q0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  v14[0] = *v1;
  v14[1] = v3;
  long long v4 = v1[3];
  v14[2] = v1[2];
  v14[3] = v4;
  uint64_t v5 = sub_2527378C8();
  sub_25273005C(v14, v13);
  __n128 result = (__n128)v13[0];
  long long v7 = v13[1];
  long long v8 = v13[2];
  long long v9 = v13[3];
  long long v10 = v13[4];
  long long v11 = v13[5];
  long long v12 = v13[6];
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 56) = v8;
  *(_OWORD *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 88) = v10;
  *(_OWORD *)(a1 + 104) = v11;
  *(_OWORD *)(a1 + 120) = v12;
  return result;
}

uint64_t destroy for CameraErrorView()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CameraErrorView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CameraErrorView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for CameraErrorView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_release();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraErrorView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraErrorView()
{
  return &type metadata for CameraErrorView;
}

unint64_t sub_252730A60()
{
  unint64_t result = qword_269C18CA0;
  if (!qword_269C18CA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18CA0);
  }
  return result;
}

uint64_t sub_252730ABC(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_252730B2C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t NearbyAccessoriesToggle.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CB0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0[1];
  char v6 = *((unsigned char *)v0 + 16);
  uint64_t v8 = *v0;
  uint64_t v9 = v5;
  char v10 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C165A0);
  sub_252738478();
  uint64_t v8 = v11;
  uint64_t v9 = v12;
  char v10 = v13;
  sub_252738668();
  sub_252738498();
  swift_release();
  swift_release();
  swift_release();
  sub_252738418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CB8);
  sub_2526882DC(&qword_269C18CC0, &qword_269C18CB0);
  sub_2526882DC(&qword_269C18CC8, &qword_269C18CB8);
  sub_252737F08();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_252730DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_252738238();
  *a1 = result;
  return result;
}

uint64_t MicrophoneToggle.body.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252731758((uint64_t)sub_252730EB8, &qword_269C18CD0, &qword_269C18CD8, (uint64_t)&protocol conformance descriptor for CameraDetailsView<A>.TalkToggleStyle, a1);
}

uint64_t sub_252730E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C165A0);
  MEMORY[0x2533BA440](&v4, v2);
  uint64_t result = sub_252738238();
  *a1 = result;
  return result;
}

uint64_t sub_252730EB8@<X0>(uint64_t *a1@<X8>)
{
  return sub_252730E24(a1);
}

uint64_t TalkButtonToggle.init(mode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252730ED0(a1, a2);
}

uint64_t sub_252730ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TalkButtonToggle.body.getter@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  char v6 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - v7;
  v17[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CB0);
  uint64_t v9 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252738478();
  sub_252686544((uint64_t)v8, (uint64_t)v6, &qword_269C18CE0);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  sub_252730ED0((uint64_t)v6, v13 + v12);
  sub_252686544((uint64_t)v8, (uint64_t)v6, &qword_269C18CE0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  sub_252730ED0((uint64_t)v6, v14 + v12);
  sub_252738488();
  sub_252686950((uint64_t)v8, &qword_269C18CE0);
  uint64_t v18 = v1;
  sub_252738418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CD0);
  sub_2526882DC(&qword_269C18CC0, &qword_269C18CB0);
  sub_2526882DC(&qword_269C18CD8, &qword_269C18CD0);
  uint64_t v15 = v17[0];
  sub_252737F08();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v15);
}

uint64_t sub_252731258@<X0>(uint64_t *a1@<X8>)
{
  v30 = a1;
  uint64_t v1 = sub_252736A28();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D10);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D18);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v29 = (uint64_t)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = sub_252736968();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  MEMORY[0x2533BA440](v20);
  sub_252736948();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v13, *MEMORY[0x263F48678], v1);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v13, 0, 1, v1);
  uint64_t v21 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_252686544((uint64_t)v15, (uint64_t)v7, &qword_269C18D18);
  sub_252686544((uint64_t)v13, v21, &qword_269C18D18);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v22((uint64_t)v7, 1, v1) != 1)
  {
    sub_252686544((uint64_t)v7, v29, &qword_269C18D18);
    if (v22(v21, 1, v1) != 1)
    {
      v23 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v28, v21, v1);
      sub_252732AFC();
      uint64_t v24 = v29;
      sub_252738768();
      v25 = *(void (**)(char *, uint64_t))(v2 + 8);
      v25(v23, v1);
      sub_252686950((uint64_t)v13, &qword_269C18D18);
      sub_252686950((uint64_t)v15, &qword_269C18D18);
      v25((char *)v24, v1);
      sub_252686950((uint64_t)v7, &qword_269C18D18);
      goto LABEL_8;
    }
    sub_252686950((uint64_t)v13, &qword_269C18D18);
    sub_252686950((uint64_t)v15, &qword_269C18D18);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v29, v1);
    goto LABEL_6;
  }
  sub_252686950((uint64_t)v13, &qword_269C18D18);
  sub_252686950((uint64_t)v15, &qword_269C18D18);
  if (v22(v21, 1, v1) != 1)
  {
LABEL_6:
    sub_252686950((uint64_t)v7, &qword_269C18D10);
    goto LABEL_8;
  }
  sub_252686950((uint64_t)v7, &qword_269C18D18);
LABEL_8:
  uint64_t result = sub_252738238();
  uint64_t *v30 = result;
  return result;
}

uint64_t VolumeToggle.init(isMuted:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3;
  return result;
}

uint64_t VolumeToggle.body.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252731758((uint64_t)sub_2527321D0, &qword_269C18CE8, &qword_269C18CF0, (uint64_t)&protocol conformance descriptor for CameraDetailsView<A>.VolumeToggleStyle, a1);
}

uint64_t sub_252731758@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v20 = a5;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CB0);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v5[1];
  char v11 = *((unsigned char *)v5 + 16);
  uint64_t v24 = *v5;
  uint64_t v10 = v24;
  uint64_t v25 = v9;
  char v26 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C165A0);
  sub_252738478();
  uint64_t v24 = v27;
  uint64_t v25 = v28;
  char v26 = v29;
  sub_252738668();
  sub_252738498();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v21 = v10;
  uint64_t v22 = v9;
  char v23 = v11;
  sub_252738418();
  uint64_t v12 = v16;
  __swift_instantiateConcreteTypeFromMangledName(v16);
  sub_2526882DC(&qword_269C18CC0, &qword_269C18CB0);
  sub_2526882DC(v18, v12);
  uint64_t v13 = v17;
  sub_252737F08();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v13);
}

uint64_t sub_25273193C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C165A0);
  MEMORY[0x2533BA440](&v4, v2);
  uint64_t result = sub_252738238();
  *a1 = result;
  return result;
}

uint64_t sub_2527319CC@<X0>(unsigned char *a1@<X8>)
{
  v33 = a1;
  uint64_t v1 = sub_252736A28();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v31 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D10);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D18);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v32 = (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v30 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = sub_252736968();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  MEMORY[0x2533BA440](v20);
  sub_252736948();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v13, *MEMORY[0x263F48678], v1);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v13, 0, 1, v1);
  uint64_t v21 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_252686544((uint64_t)v15, (uint64_t)v7, &qword_269C18D18);
  sub_252686544((uint64_t)v13, v21, &qword_269C18D18);
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v22((uint64_t)v7, 1, v1) == 1)
  {
    sub_252686950((uint64_t)v13, &qword_269C18D18);
    sub_252686950((uint64_t)v15, &qword_269C18D18);
    int v23 = v22(v21, 1, v1);
    if (v23 == 1) {
      uint64_t v24 = &qword_269C18D18;
    }
    else {
      uint64_t v24 = &qword_269C18D10;
    }
    if (v23 == 1) {
      char v25 = -1;
    }
    else {
      char v25 = 0;
    }
  }
  else
  {
    uint64_t v26 = v32;
    sub_252686544((uint64_t)v7, v32, &qword_269C18D18);
    if (v22(v21, 1, v1) == 1)
    {
      sub_252686950((uint64_t)v13, &qword_269C18D18);
      sub_252686950((uint64_t)v15, &qword_269C18D18);
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v26, v1);
      char v25 = 0;
      uint64_t v24 = &qword_269C18D10;
    }
    else
    {
      uint64_t v27 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v31, v21, v1);
      sub_252732AFC();
      char v25 = sub_252738768();
      uint64_t v28 = *(void (**)(char *, uint64_t))(v2 + 8);
      v28(v27, v1);
      uint64_t v24 = &qword_269C18D18;
      sub_252686950((uint64_t)v13, &qword_269C18D18);
      sub_252686950((uint64_t)v15, &qword_269C18D18);
      v28((char *)v26, v1);
    }
  }
  uint64_t result = sub_252686950((uint64_t)v7, v24);
  unsigned char *v33 = v25 & 1;
  return result;
}

uint64_t sub_252731E34@<X0>(unsigned char *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);

  return sub_2527319CC(a1);
}

uint64_t sub_252731EAC(unsigned __int8 *a1)
{
  uint64_t v2 = sub_252736968();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *a1;
  uint64_t v7 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C169B0) + 48)];
  uint64_t v8 = sub_252736A28();
  uint64_t v9 = (unsigned int *)MEMORY[0x263F48678];
  if (!v6) {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F48680];
  }
  (*(void (**)(char *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v5, *v9, v8);
  uint64_t v10 = sub_252736908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F48650], v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  return sub_252738458();
}

uint64_t objectdestroyTm_12()
{
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[10];
  uint64_t v7 = sub_252736968();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_252732150(unsigned __int8 *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);

  return sub_252731EAC(a1);
}

uint64_t sub_2527321C8@<X0>(uint64_t *a1@<X8>)
{
  return sub_252731258(a1);
}

uint64_t sub_2527321D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_25273193C(a1);
}

uint64_t sub_2527321DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2527321F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252732214()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252732230()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for NearbyAccessoriesToggle()
{
  return &type metadata for NearbyAccessoriesToggle;
}

ValueMetadata *type metadata accessor for MicrophoneToggle()
{
  return &type metadata for MicrophoneToggle;
}

uint64_t *initializeBufferWithCopyOfBuffer for TalkButtonToggle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = *a2;
  *a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(v4 + 32);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_252736968();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    swift_retain();
    v11(v8, v9, v10);
  }
  return a1;
}

uint64_t destroy for TalkButtonToggle(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) + 32);
  uint64_t v3 = sub_252736968();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *initializeWithCopy for TalkButtonToggle(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_retain();
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_252736968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

void *assignWithCopy for TalkButtonToggle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_252736968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *initializeWithTake for TalkButtonToggle(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_252736968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for TalkButtonToggle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0) + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_252736968();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TalkButtonToggle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25273269C);
}

uint64_t sub_25273269C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TalkButtonToggle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252732720);
}

uint64_t sub_252732720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18CE0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TalkButtonToggle()
{
  uint64_t result = qword_269C18CF8;
  if (!qword_269C18CF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2527327E0()
{
  sub_25273286C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25273286C()
{
  if (!qword_269C18D08)
  {
    sub_252736968();
    unint64_t v0 = sub_2527384A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C18D08);
    }
  }
}

uint64_t _s7HomeUI223NearbyAccessoriesToggleVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s7HomeUI223NearbyAccessoriesToggleVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t _s7HomeUI223NearbyAccessoriesToggleVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for VolumeToggle()
{
  return &type metadata for VolumeToggle;
}

uint64_t sub_2527329C4(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE11toggleStyleyQrqd__AA06ToggleE0Rd__lFQOyAA0F0VyAA5ImageVG_7HomeUI2013CameraDetailsC0V06NearbyfE0VyAK05EmptyL19AccessoriesModifierV_GQo_HOTm(a1, &qword_269C18CB8, &qword_269C18CC8);
}

uint64_t sub_2527329EC(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE11toggleStyleyQrqd__AA06ToggleE0Rd__lFQOyAA0F0VyAA5ImageVG_7HomeUI2013CameraDetailsC0V06NearbyfE0VyAK05EmptyL19AccessoriesModifierV_GQo_HOTm(a1, &qword_269C18CD0, &qword_269C18CD8);
}

uint64_t get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE11toggleStyleyQrqd__AA06ToggleE0Rd__lFQOyAA0F0VyAA5ImageVG_7HomeUI2013CameraDetailsC0V06NearbyfE0VyAK05EmptyL19AccessoriesModifierV_GQo_HOTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252732AD4(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE11toggleStyleyQrqd__AA06ToggleE0Rd__lFQOyAA0F0VyAA5ImageVG_7HomeUI2013CameraDetailsC0V06NearbyfE0VyAK05EmptyL19AccessoriesModifierV_GQo_HOTm(a1, &qword_269C18CE8, &qword_269C18CF0);
}

unint64_t sub_252732AFC()
{
  unint64_t result = qword_269C18D20;
  if (!qword_269C18D20)
  {
    sub_252736A28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18D20);
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraClipScrubberContainer()
{
  return &type metadata for CameraClipScrubberContainer;
}

uint64_t sub_252732B70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252732B8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v1 = sub_2527384B8();
  MEMORY[0x270FA5388](v1 - 8);
  v47 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252737228();
  uint64_t v45 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  MEMORY[0x270FA5388](v3);
  v44 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D28);
  MEMORY[0x270FA5388](v41);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2527385B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D30);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D38);
  MEMORY[0x270FA5388](v43);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D40);
  MEMORY[0x270FA5388](v42);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269C16120 != -1) {
    swift_once();
  }
  uint64_t v40 = qword_269C1C010;
  swift_retain();
  uint64_t v18 = sub_252738618();
  uint64_t v38 = v19;
  uint64_t v39 = v18;
  uint64_t v20 = sub_252738198();
  sub_2527385A8();
  char v21 = sub_252737BC8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  v6[*(int *)(v41 + 36)] = v21;
  sub_252686544((uint64_t)v6, (uint64_t)v13 + *(int *)(v11 + 36), &qword_269C18D28);
  *uint64_t v13 = v20;
  swift_retain();
  sub_252686950((uint64_t)v6, &qword_269C18D28);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v44;
  uint64_t v23 = v45;
  uint64_t v25 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F184F8], v46);
  uint64_t v26 = (uint64_t *)&v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C18D48) + 36)];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C169F0);
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))((char *)v26 + *(int *)(v27 + 28), v24, v25);
  *uint64_t v26 = KeyPath;
  sub_252686544((uint64_t)v13, (uint64_t)v15, &qword_269C18D30);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  sub_252686950((uint64_t)v13, &qword_269C18D30);
  uint64_t v28 = &v15[*(int *)(v43 + 36)];
  uint64_t v29 = v38;
  *(void *)uint64_t v28 = v39;
  *((void *)v28 + 1) = v29;
  sub_252686544((uint64_t)v15, (uint64_t)&v17[*(int *)(v42 + 36)], &qword_269C18D38);
  *(void *)uint64_t v17 = v40;
  *((_WORD *)v17 + 4) = 256;
  sub_252686950((uint64_t)v15, &qword_269C18D38);
  uint64_t v30 = *MEMORY[0x263F19868];
  uint64_t v31 = sub_2527378B8();
  uint64_t v32 = (uint64_t)v47;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v47, v30, v31);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D50);
  uint64_t v34 = v48;
  uint64_t v35 = v48 + *(int *)(v33 + 36);
  sub_252733144(v32, v35);
  *(_WORD *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C17EE0) + 36)) = 256;
  sub_252686544((uint64_t)v17, v34, &qword_269C18D40);
  sub_2527331A8(v32);
  return sub_252686950((uint64_t)v17, &qword_269C18D40);
}

uint64_t sub_2527330F8()
{
  sub_2527381A8();
  uint64_t v0 = sub_2527381D8();
  uint64_t result = swift_release();
  qword_269C1C010 = v0;
  return result;
}

uint64_t sub_252733144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2527384B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2527331A8(uint64_t a1)
{
  uint64_t v2 = sub_2527384B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_252733208()
{
  unint64_t result = qword_269C18D58;
  if (!qword_269C18D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18D50);
    sub_2527332A8();
    sub_2526882DC(&qword_269C17ED8, &qword_269C17EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18D58);
  }
  return result;
}

unint64_t sub_2527332A8()
{
  unint64_t result = qword_269C18D60;
  if (!qword_269C18D60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18D40);
    sub_2526882DC(&qword_269C18D68, &qword_269C18D70);
    sub_2526882DC(&qword_269C18D78, &qword_269C18D38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18D60);
  }
  return result;
}

uint64_t CameraClipPlayerView.init(clipPlaybackManager:zoomToFill:autoPlay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 9) = a3;
  return result;
}

uint64_t CameraClipPlayerView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D80);
  MEMORY[0x270FA5388](v44);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252737AB8();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16960);
  uint64_t v35 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D88);
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D90);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D98);
  MEMORY[0x270FA5388](v43);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *v1;
  int v18 = *((unsigned __int8 *)v2 + 8);
  char v19 = *((unsigned char *)v2 + 9);
  uint64_t v42 = sub_252736F68();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  int v41 = v18;
  *(unsigned char *)(v20 + 24) = v18;
  *(unsigned char *)(v20 + 25) = v19;
  swift_retain();
  if (sub_252736E08())
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18DA8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
  }
  else
  {
    sub_2527372A8();
    sub_2527381A8();
    sub_252737AA8();
    sub_2526882DC(&qword_269C17F00, &qword_269C16960);
    sub_252733908();
    uint64_t v22 = v37;
    uint64_t v23 = v40;
    sub_252737E88();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v23);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v22);
    uint64_t v24 = v36;
    uint64_t v25 = v38;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v14, v11, v38);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18DA8);
    *(void *)&v14[*(int *)(v26 + 36)] = 0x3FC999999999999ALL;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v14, 0, 1, v26);
  }
  uint64_t v27 = sub_252738618();
  uint64_t v29 = v28;
  sub_252686544((uint64_t)v14, (uint64_t)v4, &qword_269C18D90);
  uint64_t v30 = (uint64_t *)&v4[*(int *)(v44 + 36)];
  uint64_t *v30 = v27;
  v30[1] = v29;
  sub_252686544((uint64_t)v4, (uint64_t)&v16[*(int *)(v43 + 36)], &qword_269C18D80);
  uint64_t v31 = (void *)v42;
  *(void *)uint64_t v16 = v42;
  v16[8] = v41;
  *((void *)v16 + 2) = sub_2527338D8;
  *((void *)v16 + 3) = v20;
  *((void *)v16 + 4) = 0;
  *((void *)v16 + 5) = 0;
  id v32 = v31;
  swift_retain();
  sub_252686950((uint64_t)v4, &qword_269C18D80);
  sub_252686950((uint64_t)v14, &qword_269C18D90);
  swift_release();

  return sub_252733960((uint64_t)v16, v45);
}

uint64_t sub_2527338A0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 26, 7);
}

uint64_t sub_2527338D8()
{
  if (*(unsigned char *)(v0 + 25) == 1) {
    return sub_252736F18();
  }
  return result;
}

unint64_t sub_252733908()
{
  unint64_t result = qword_269C18DA0;
  if (!qword_269C18DA0)
  {
    sub_252737AB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DA0);
  }
  return result;
}

uint64_t sub_252733960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2527339C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for CameraClipPlayerView()
{
  return swift_release();
}

uint64_t _s7HomeUI220CameraClipPlayerViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CameraClipPlayerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for CameraClipPlayerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraClipPlayerView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 10)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraClipPlayerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 10) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 10) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraClipPlayerView()
{
  return &type metadata for CameraClipPlayerView;
}

ValueMetadata *type metadata accessor for CameraClipPlayerView.Constants()
{
  return &type metadata for CameraClipPlayerView.Constants;
}

unint64_t sub_252733B8C()
{
  unint64_t result = qword_269C18DB0;
  if (!qword_269C18DB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18D98);
    sub_252733C2C();
    sub_2526882DC(&qword_269C18DD0, &qword_269C18D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DB0);
  }
  return result;
}

unint64_t sub_252733C2C()
{
  unint64_t result = qword_269C18DB8;
  if (!qword_269C18DB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18DC0);
    sub_252733CA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DB8);
  }
  return result;
}

unint64_t sub_252733CA8()
{
  unint64_t result = qword_269C18DC8;
  if (!qword_269C18DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DC8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CameraClipAVPlayerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CameraClipAVPlayerView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for CameraClipAVPlayerView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraClipAVPlayerView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraClipAVPlayerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraClipAVPlayerView()
{
  return &type metadata for CameraClipAVPlayerView;
}

ValueMetadata *type metadata accessor for DelayDisplayModifier()
{
  return &type metadata for DelayDisplayModifier;
}

uint64_t sub_252733E7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_252733E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_252737358();
  sub_252738668();
  sub_252738648();
  swift_release();
  sub_252737368();
  swift_release();
  swift_release();
  sub_252737358();
  uint64_t v4 = sub_252737348();
  swift_release();
  swift_release();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18DE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269C18DE8);
  *(void *)(a2 + *(int *)(result + 36)) = v4;
  return result;
}

id sub_252733F9C()
{
  uint64_t v1 = *v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA9C8]), sel_init);
  objc_msgSend(v2, sel_setPlayer_, v1);
  objc_msgSend(v2, sel_setModalPresentationStyle_, 0);
  objc_msgSend(v2, sel_setShowsPlaybackControls_, 0);
  objc_msgSend(v2, sel_setUpdatesNowPlayingInfoCenter_, 0);
  return v2;
}

id sub_252734028(void *a1)
{
  if (*(unsigned char *)(v1 + 8)) {
    id v2 = (void *)MEMORY[0x263EF9C78];
  }
  else {
    id v2 = (void *)MEMORY[0x263EF9C70];
  }
  return objc_msgSend(a1, sel_setVideoGravity_, *v2);
}

uint64_t sub_252734054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_252734144();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2527340B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_252734144();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25273411C()
{
}

unint64_t sub_252734144()
{
  unint64_t result = qword_269C18DD8;
  if (!qword_269C18DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DD8);
  }
  return result;
}

unint64_t sub_25273419C()
{
  unint64_t result = qword_269C18DF0;
  if (!qword_269C18DF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C18DE8);
    sub_2526882DC(&qword_269C18DF8, &qword_269C18DE0);
    sub_2526882DC(&qword_269C18E00, &qword_269C18E08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C18DF0);
  }
  return result;
}

uint64_t *sub_252734264(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v6 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v6 = a1;
    uint64_t v7 = a2[2];
    uint64_t v8 = a2[3];
    a1[1] = a2[1];
    a1[2] = v7;
    a1[3] = v8;
    uint64_t v9 = (int *)type metadata accessor for CameraClipTimelineLayout();
    uint64_t v10 = v9[6];
    __dst = (char *)v6 + v10;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_2527367C8();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
      memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    *(uint64_t *)((char *)v6 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    *(uint64_t *)((char *)v6 + v9[8]) = *(uint64_t *)((char *)a2 + v9[8]);
    uint64_t v16 = v9[9];
    uint64_t v17 = (char *)v6 + v16;
    int v18 = (char *)a2 + v16;
    v17[8] = v18[8];
    *(void *)uint64_t v17 = *(void *)v18;
    *(_OWORD *)((char *)v6 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v6;
}

uint64_t sub_252734468(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for CameraClipTimelineLayout() + 24);
  uint64_t v3 = sub_2527367C8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_252734554(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v8 = v7[6];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = sub_2527367C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  *(void *)((char *)a1 + v7[7]) = *(void *)((char *)a2 + v7[7]);
  *(void *)((char *)a1 + v7[8]) = *(void *)((char *)a2 + v7[8]);
  uint64_t v14 = v7[9];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  v15[8] = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_252734704(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2527367C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = v6[9];
  uint64_t v17 = (char *)a1 + v16;
  int v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)v18;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = v19;
  uint64_t v20 = *(int *)(a3 + 20);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  return a1;
}

uint64_t sub_252734944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v7 = v6[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2527367C8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
  *(void *)(a1 + v6[8]) = *(void *)(a2 + v6[8]);
  uint64_t v13 = v6[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v14 = *(void *)v15;
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_252734AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  uint64_t v5 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v6 = v5[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2527367C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)(a1 + v5[7]) = *(void *)(a2 + v5[7]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
  swift_bridgeObjectRelease();
  uint64_t v15 = v5[9];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_252734CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252734CE8);
}

uint64_t sub_252734CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraClipTimelineLayout();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_252734D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252734D68);
}

uint64_t sub_252734D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraClipTimelineLayout();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CameraClipTimelineHStack(uint64_t a1)
{
  return sub_25268E2B0(a1, (uint64_t *)&unk_269C18E10);
}

uint64_t sub_252734DF8()
{
  uint64_t result = type metadata accessor for CameraClipTimelineLayout();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_252734E8C(uint64_t a1)
{
  uint64_t v26 = sub_2527373E8();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252737458();
  sub_2527354E8(&qword_269C176E8, MEMORY[0x263F18AB8]);
  uint64_t v5 = sub_252738A28();
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_2526D3CD4(0, v5 & ~(v5 >> 63), 0);
    uint64_t result = sub_252738A18();
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    v25[1] = a1;
    do
    {
      uint64_t v9 = (void (*)(unsigned char *, void))sub_252738A68();
      uint64_t v10 = v26;
      (*(void (**)(char *))(v2 + 16))(v4);
      v9(v28, 0);
      sub_252737588();
      v28[0] = v11 & 1;
      char v27 = v12 & 1;
      sub_2527373C8();
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v10);
      uint64_t v6 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2526D3CD4(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v29;
      }
      unint64_t v18 = *(void *)(v6 + 16);
      unint64_t v17 = *(void *)(v6 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_2526D3CD4(v17 > 1, v18 + 1, 1);
        uint64_t v6 = v29;
      }
      *(void *)(v6 + 16) = v18 + 1;
      uint64_t v19 = v6 + 16 * v18;
      *(void *)(v19 + 32) = v14;
      *(void *)(v19 + 40) = v16;
      sub_252738A58();
      --v7;
    }
    while (v7);
  }
  uint64_t v20 = *(void *)(v6 + 16);
  if (v20)
  {
    uint64_t v21 = (double *)(v6 + 40);
    double v22 = 0.0;
    do
    {
      double v23 = *v21;
      v21 += 2;
      double v24 = v23;
      if (v22 <= v23) {
        double v22 = v24;
      }
      --v20;
    }
    while (v20);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25273514C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_252734E8C(a1);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v2 + *(int *)(type metadata accessor for CameraClipTimelineLayout() + 28));
  if (*(void *)(v6 + 16)) {
    uint64_t v7 = *(void *)(v6 + 32);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = type metadata accessor for CameraClipTimelineHStack.CacheData(0);
  uint64_t result = sub_252735550(v2, (uint64_t)a2 + *(int *)(v8 + 24));
  *a2 = v5;
  a2[1] = v7;
  return result;
}

double sub_2527351BC()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CameraClipTimelineLayout() + 28));
  if (*(void *)(v1 + 16)) {
    return *(double *)(v1 + 32);
  }
  else {
    return 0.0;
  }
}

uint64_t sub_252735204(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_252735258(a1, a2, a3, a4);
}

uint64_t sub_252735210()
{
  return sub_2527354E8(&qword_269C18E20, (void (*)(uint64_t))type metadata accessor for CameraClipTimelineHStack);
}

uint64_t sub_252735258(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v8 = sub_2527373E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252737458();
  sub_2527354E8(&qword_269C176E8, MEMORY[0x263F18AB8]);
  sub_252738A18();
  uint64_t result = sub_252738A48();
  uint64_t v14 = v20;
  uint64_t v13 = v21;
  if (v20 < v21) {
    goto LABEL_10;
  }
  if (v21 != v20)
  {
    uint64_t v15 = *(int *)(type metadata accessor for CameraClipTimelineHStack(0) + 20);
    type metadata accessor for CameraClipTimelineHStack.CacheData(0);
    uint64_t result = type metadata accessor for CameraClipTimelineLayout();
    if (v13 >= v14)
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
    while (!__OFADD__(*(void *)(v19[1] + v15), v13))
    {
      v22.origin.x = a1;
      v22.origin.y = a2;
      v22.size.width = a3;
      v22.size.height = a4;
      CGRectGetMinY(v22);
      sub_252737468();
      sub_2527386A8();
      sub_252737588();
      LOBYTE(v21) = v17 & 1;
      LOBYTE(v20) = v18 & 1;
      sub_2527373D8();
      uint64_t result = (*v16)(v11, v8);
      if (v14 == ++v13) {
        return result;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_2527354E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for CameraClipTimelineHStack.CacheData(uint64_t a1)
{
  return sub_25268E2B0(a1, qword_269C18E28);
}

uint64_t sub_252735550(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraClipTimelineLayout();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_2527355B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (uint64_t *)((char *)a1 + v5);
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v5);
    uint64_t v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *uint64_t v6 = v9;
    v6[1] = v8;
    uint64_t v10 = *((void *)v7 + 3);
    v6[2] = *((void *)v7 + 2);
    v6[3] = v10;
    uint64_t v11 = type metadata accessor for CameraClipTimelineLayout();
    uint64_t v12 = *(int *)(v11 + 24);
    double v23 = (int *)v11;
    __dst = (char *)v6 + v12;
    uint64_t v13 = &v7[v12];
    uint64_t v14 = sub_2527367C8();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
      memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    *(void *)((char *)v6 + v23[7]) = *(void *)&v7[v23[7]];
    *(void *)((char *)v6 + v23[8]) = *(void *)&v7[v23[8]];
    uint64_t v19 = v23[9];
    uint64_t v20 = (char *)v6 + v19;
    uint64_t v21 = &v7[v19];
    v20[8] = v21[8];
    *(void *)uint64_t v20 = *(void *)v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_2527357B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = v2 + *(int *)(type metadata accessor for CameraClipTimelineLayout() + 24);
  uint64_t v4 = sub_2527367C8();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

_OWORD *sub_2527358A0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v3 = *(int *)(a3 + 24);
  uint64_t v4 = (void *)((char *)a1 + v3);
  uint64_t v5 = (char *)a2 + v3;
  uint64_t v7 = *(void *)((char *)a2 + v3);
  uint64_t v6 = *(void *)((char *)a2 + v3 + 8);
  *uint64_t v4 = v7;
  v4[1] = v6;
  uint64_t v8 = *((void *)v5 + 3);
  v4[2] = *((void *)v5 + 2);
  v4[3] = v8;
  uint64_t v9 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v10 = v9[6];
  __dst = (char *)v4 + v10;
  uint64_t v11 = &v5[v10];
  uint64_t v12 = sub_2527367C8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v14(v11, 1, v12))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
  }
  *(void *)((char *)v4 + v9[7]) = *(void *)&v5[v9[7]];
  *(void *)((char *)v4 + v9[8]) = *(void *)&v5[v9[8]];
  uint64_t v16 = v9[9];
  uint64_t v17 = (char *)v4 + v16;
  uint64_t v18 = &v5[v16];
  v17[8] = v18[8];
  *(void *)uint64_t v17 = *(void *)v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_252735A4C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = *(int *)(a3 + 24);
  uint64_t v4 = (void *)((char *)a1 + v3);
  uint64_t v5 = (void *)((char *)a2 + v3);
  *(void *)((char *)a1 + v3) = *(void *)((char *)a2 + v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4[1] = v5[1];
  uint64_t v6 = v5[3];
  v4[2] = v5[2];
  v4[3] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)v4 + v8;
  uint64_t v10 = (char *)v5 + v8;
  uint64_t v11 = sub_2527367C8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)((char *)v4 + v7[7]) = *(void *)((char *)v5 + v7[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v4 + v7[8]) = *(void *)((char *)v5 + v7[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v7[9];
  uint64_t v18 = (char *)v4 + v17;
  uint64_t v19 = (char *)v5 + v17;
  uint64_t v20 = *(void *)v19;
  v18[8] = v19[8];
  *(void *)uint64_t v18 = v20;
  return a1;
}

_OWORD *sub_252735C80(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *(void *)uint64_t v5 = *(void *)((char *)a2 + v4);
  *((void *)v5 + 3) = *(void *)((char *)a2 + v4 + 24);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)((char *)a2 + v4 + 8);
  uint64_t v7 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v8 = v7[6];
  uint64_t v9 = &v5[v8];
  uint64_t v10 = &v6[v8];
  uint64_t v11 = sub_2527367C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(void *)&v5[v7[7]] = *(void *)&v6[v7[7]];
  *(void *)&v5[v7[8]] = *(void *)&v6[v7[8]];
  uint64_t v14 = v7[9];
  int v15 = &v5[v14];
  uint64_t v16 = &v6[v14];
  v15[8] = v16[8];
  *(void *)int v15 = *(void *)v16;
  return a1;
}

_OWORD *sub_252735E00(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v3 = *(int *)(a3 + 24);
  uint64_t v4 = (char *)a1 + v3;
  uint64_t v5 = (char *)a2 + v3;
  *(void *)((char *)a1 + v3) = *(void *)((char *)a2 + v3);
  swift_bridgeObjectRelease();
  *((void *)v4 + 1) = *((void *)v5 + 1);
  *((_OWORD *)v4 + 1) = *((_OWORD *)v5 + 1);
  swift_release();
  uint64_t v6 = (int *)type metadata accessor for CameraClipTimelineLayout();
  uint64_t v7 = v6[6];
  uint64_t v8 = &v4[v7];
  uint64_t v9 = &v5[v7];
  uint64_t v10 = sub_2527367C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C16CB0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void *)&v4[v6[7]] = *(void *)&v5[v6[7]];
  swift_bridgeObjectRelease();
  *(void *)&v4[v6[8]] = *(void *)&v5[v6[8]];
  swift_bridgeObjectRelease();
  uint64_t v16 = v6[9];
  uint64_t v17 = &v4[v16];
  uint64_t v18 = &v5[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  return a1;
}

uint64_t sub_25273600C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252736020);
}

uint64_t sub_252736020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 24);
  uint64_t v5 = type metadata accessor for CameraClipTimelineLayout();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t sub_252736090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2527360A4);
}

uint64_t sub_2527360A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 24);
  uint64_t v6 = type metadata accessor for CameraClipTimelineLayout();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_252736118()
{
  uint64_t result = type metadata accessor for CameraClipTimelineLayout();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2527361E8()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2527361F8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_252736208()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_252736218()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_252736228()
{
  return MEMORY[0x270EEF0B8]();
}

uint64_t sub_252736238()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_252736248()
{
  return MEMORY[0x270EEFBF8]();
}

uint64_t sub_252736258()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_252736268()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_252736278()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_252736288()
{
  return MEMORY[0x270EEFEC0]();
}

uint64_t sub_252736298()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2527362A8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2527362B8()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_2527362C8()
{
  return MEMORY[0x270EF04D0]();
}

uint64_t sub_2527362D8()
{
  return MEMORY[0x270EF04E8]();
}

uint64_t sub_2527362E8()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_2527362F8()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_252736308()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_252736318()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_252736328()
{
  return MEMORY[0x270EF05C0]();
}

uint64_t sub_252736338()
{
  return MEMORY[0x270EF05D8]();
}

uint64_t sub_252736348()
{
  return MEMORY[0x270EF05F0]();
}

uint64_t sub_252736358()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_252736368()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_252736378()
{
  return MEMORY[0x270EF0698]();
}

uint64_t sub_252736388()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_252736398()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2527363A8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2527363B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2527363C8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2527363E8()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2527363F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252736408()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_252736418()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_252736428()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252736438()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252736448()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_252736458()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_252736468()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252736478()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_252736488()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_252736498()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2527364A8()
{
  return MEMORY[0x270F3A1A0]();
}

uint64_t sub_2527364B8()
{
  return MEMORY[0x270F3A1F0]();
}

uint64_t sub_2527364C8()
{
  return MEMORY[0x270F3A1F8]();
}

uint64_t sub_2527364D8()
{
  return MEMORY[0x270F3A200]();
}

uint64_t sub_2527364E8()
{
  return MEMORY[0x270F3A208]();
}

uint64_t sub_2527364F8()
{
  return MEMORY[0x270F3A210]();
}

uint64_t sub_252736508()
{
  return MEMORY[0x270F3A218]();
}

uint64_t sub_252736518()
{
  return MEMORY[0x270F3A220]();
}

uint64_t sub_252736528()
{
  return MEMORY[0x270F3A250]();
}

uint64_t sub_252736538()
{
  return MEMORY[0x270F3A290]();
}

uint64_t sub_252736548()
{
  return MEMORY[0x270F3A298]();
}

uint64_t sub_252736558()
{
  return MEMORY[0x270F3A2A0]();
}

uint64_t sub_252736568()
{
  return MEMORY[0x270F3A2A8]();
}

uint64_t sub_252736578()
{
  return MEMORY[0x270F3A2B0]();
}

uint64_t sub_252736588()
{
  return MEMORY[0x270F3A2D0]();
}

uint64_t sub_252736598()
{
  return MEMORY[0x270F3A2F8]();
}

uint64_t sub_2527365A8()
{
  return MEMORY[0x270F3A368]();
}

uint64_t sub_2527365B8()
{
  return MEMORY[0x270F3A380]();
}

uint64_t sub_2527365C8()
{
  return MEMORY[0x270F3A390]();
}

uint64_t sub_2527365D8()
{
  return MEMORY[0x270F3A398]();
}

uint64_t sub_2527365E8()
{
  return MEMORY[0x270F3A3A0]();
}

uint64_t sub_2527365F8()
{
  return MEMORY[0x270F3A3A8]();
}

uint64_t sub_252736608()
{
  return MEMORY[0x270F3A3B0]();
}

uint64_t sub_252736618()
{
  return MEMORY[0x270F3A3B8]();
}

uint64_t sub_252736628()
{
  return MEMORY[0x270F3A3C0]();
}

uint64_t sub_252736638()
{
  return MEMORY[0x270F3A3F0]();
}

uint64_t sub_252736648()
{
  return MEMORY[0x270F3A3F8]();
}

uint64_t sub_252736658()
{
  return MEMORY[0x270F3A408]();
}

uint64_t sub_252736668()
{
  return MEMORY[0x270F3A410]();
}

uint64_t sub_252736678()
{
  return MEMORY[0x270F3A418]();
}

uint64_t sub_252736688()
{
  return MEMORY[0x270F3A420]();
}

uint64_t sub_252736698()
{
  return MEMORY[0x270F3A428]();
}

uint64_t sub_2527366A8()
{
  return MEMORY[0x270F3A430]();
}

uint64_t sub_2527366B8()
{
  return MEMORY[0x270F3A438]();
}

uint64_t sub_2527366C8()
{
  return MEMORY[0x270F3A440]();
}

uint64_t sub_2527366D8()
{
  return MEMORY[0x270F3A600]();
}

uint64_t sub_2527366E8()
{
  return MEMORY[0x270F3A668]();
}

uint64_t sub_2527366F8()
{
  return MEMORY[0x270F3A898]();
}

uint64_t sub_252736708()
{
  return MEMORY[0x270F3A8F8]();
}

uint64_t sub_252736718()
{
  return MEMORY[0x270F3A908]();
}

uint64_t sub_252736728()
{
  return MEMORY[0x270F3AF48]();
}

uint64_t sub_252736738()
{
  return MEMORY[0x270F3AF50]();
}

uint64_t sub_252736748()
{
  return MEMORY[0x270F3AF58]();
}

uint64_t sub_252736758()
{
  return MEMORY[0x270F3AF60]();
}

uint64_t sub_252736768()
{
  return MEMORY[0x270F3AF68]();
}

uint64_t sub_252736778()
{
  return MEMORY[0x270F3AF70]();
}

uint64_t sub_252736788()
{
  return MEMORY[0x270F3AF78]();
}

uint64_t sub_252736798()
{
  return MEMORY[0x270F3AF80]();
}

uint64_t sub_2527367A8()
{
  return MEMORY[0x270F3AF88]();
}

uint64_t sub_2527367B8()
{
  return MEMORY[0x270F3AF90]();
}

uint64_t sub_2527367C8()
{
  return MEMORY[0x270F3AF98]();
}

uint64_t sub_2527367D8()
{
  return MEMORY[0x270F3B128]();
}

uint64_t sub_252736808()
{
  return MEMORY[0x270F3B140]();
}

uint64_t sub_252736818()
{
  return MEMORY[0x270F3B148]();
}

uint64_t sub_252736828()
{
  return MEMORY[0x270F3B150]();
}

uint64_t sub_252736848()
{
  return MEMORY[0x270F3B160]();
}

uint64_t sub_252736858()
{
  return MEMORY[0x270F3B168]();
}

uint64_t sub_252736868()
{
  return MEMORY[0x270F3B170]();
}

uint64_t sub_252736878()
{
  return MEMORY[0x270F3B178]();
}

uint64_t sub_252736898()
{
  return MEMORY[0x270F3B188]();
}

uint64_t sub_2527368A8()
{
  return MEMORY[0x270F3B190]();
}

uint64_t sub_2527368B8()
{
  return MEMORY[0x270F3B198]();
}

uint64_t sub_2527368C8()
{
  return MEMORY[0x270F3B1A0]();
}

uint64_t sub_2527368D8()
{
  return MEMORY[0x270F3B1A8]();
}

uint64_t sub_2527368E8()
{
  return MEMORY[0x270F3B1B0]();
}

uint64_t sub_2527368F8()
{
  return MEMORY[0x270F3B1B8]();
}

uint64_t sub_252736908()
{
  return MEMORY[0x270F3B1C0]();
}

uint64_t sub_252736918()
{
  return MEMORY[0x270F3B1C8]();
}

uint64_t sub_252736928()
{
  return MEMORY[0x270F3B1D0]();
}

uint64_t sub_252736938()
{
  return MEMORY[0x270F3B1D8]();
}

uint64_t sub_252736948()
{
  return MEMORY[0x270F3B1E0]();
}

uint64_t sub_252736958()
{
  return MEMORY[0x270F3B1E8]();
}

uint64_t sub_252736968()
{
  return MEMORY[0x270F3B1F0]();
}

uint64_t sub_252736978()
{
  return MEMORY[0x270F3B1F8]();
}

uint64_t sub_252736988()
{
  return MEMORY[0x270F3B200]();
}

uint64_t sub_252736998()
{
  return MEMORY[0x270F3B208]();
}

uint64_t sub_2527369A8()
{
  return MEMORY[0x270F3B210]();
}

uint64_t sub_2527369B8()
{
  return MEMORY[0x270F3B218]();
}

uint64_t sub_2527369C8()
{
  return MEMORY[0x270F3B220]();
}

uint64_t sub_2527369D8()
{
  return MEMORY[0x270F3B228]();
}

uint64_t sub_2527369E8()
{
  return MEMORY[0x270F3B230]();
}

uint64_t sub_2527369F8()
{
  return MEMORY[0x270F3B238]();
}

uint64_t sub_252736A08()
{
  return MEMORY[0x270F3B240]();
}

uint64_t sub_252736A18()
{
  return MEMORY[0x270F3B248]();
}

uint64_t sub_252736A28()
{
  return MEMORY[0x270F3B250]();
}

uint64_t sub_252736A38()
{
  return MEMORY[0x270F3B258]();
}

uint64_t sub_252736A78()
{
  return MEMORY[0x270F3B278]();
}

uint64_t sub_252736A88()
{
  return MEMORY[0x270F3B280]();
}

uint64_t sub_252736A98()
{
  return MEMORY[0x270F3B2C8]();
}

uint64_t sub_252736AA8()
{
  return MEMORY[0x270F3B2D0]();
}

uint64_t sub_252736AB8()
{
  return MEMORY[0x270F3B2D8]();
}

uint64_t sub_252736AC8()
{
  return MEMORY[0x270F3B7A8]();
}

uint64_t sub_252736AD8()
{
  return MEMORY[0x270F3B7B0]();
}

uint64_t sub_252736AE8()
{
  return MEMORY[0x270F3B7B8]();
}

uint64_t sub_252736AF8()
{
  return MEMORY[0x270F3B7D8]();
}

uint64_t sub_252736B08()
{
  return MEMORY[0x270F3B7E0]();
}

uint64_t sub_252736B18()
{
  return MEMORY[0x270F3B7F8]();
}

uint64_t sub_252736B28()
{
  return MEMORY[0x270F3B908]();
}

uint64_t sub_252736B38()
{
  return MEMORY[0x270F3B910]();
}

uint64_t sub_252736B48()
{
  return MEMORY[0x270F3B918]();
}

uint64_t sub_252736B58()
{
  return MEMORY[0x270F3B920]();
}

uint64_t sub_252736B68()
{
  return MEMORY[0x270F3B928]();
}

uint64_t sub_252736B78()
{
  return MEMORY[0x270F3B930]();
}

uint64_t sub_252736B88()
{
  return MEMORY[0x270F3B938]();
}

uint64_t sub_252736B98()
{
  return MEMORY[0x270F3B948]();
}

uint64_t sub_252736BA8()
{
  return MEMORY[0x270F3B950]();
}

uint64_t sub_252736BB8()
{
  return MEMORY[0x270F3B958]();
}

uint64_t sub_252736BC8()
{
  return MEMORY[0x270F3B968]();
}

uint64_t sub_252736BD8()
{
  return MEMORY[0x270F3B980]();
}

uint64_t sub_252736BF8()
{
  return MEMORY[0x270F3B990]();
}

uint64_t sub_252736C08()
{
  return MEMORY[0x270F3B998]();
}

uint64_t sub_252736C18()
{
  return MEMORY[0x270F3B9A0]();
}

uint64_t sub_252736C28()
{
  return MEMORY[0x270F3B9A8]();
}

uint64_t sub_252736C38()
{
  return MEMORY[0x270F3B9B0]();
}

uint64_t sub_252736C48()
{
  return MEMORY[0x270F3B9B8]();
}

uint64_t sub_252736C68()
{
  return MEMORY[0x270F3B9C8]();
}

uint64_t sub_252736C78()
{
  return MEMORY[0x270F3B9D0]();
}

uint64_t sub_252736C88()
{
  return MEMORY[0x270F3B9D8]();
}

uint64_t sub_252736C98()
{
  return MEMORY[0x270F3BC98]();
}

uint64_t sub_252736CA8()
{
  return MEMORY[0x270F3BCA0]();
}

uint64_t sub_252736CB8()
{
  return MEMORY[0x270F3BCA8]();
}

uint64_t sub_252736CC8()
{
  return MEMORY[0x270F3BCB0]();
}

uint64_t sub_252736CD8()
{
  return MEMORY[0x270F3BCB8]();
}

uint64_t sub_252736CE8()
{
  return MEMORY[0x270F3BCC0]();
}

uint64_t sub_252736CF8()
{
  return MEMORY[0x270F3BCC8]();
}

uint64_t sub_252736D08()
{
  return MEMORY[0x270F3BCD0]();
}

uint64_t sub_252736D18()
{
  return MEMORY[0x270F3BCD8]();
}

uint64_t sub_252736D28()
{
  return MEMORY[0x270F3BCE0]();
}

uint64_t sub_252736D38()
{
  return MEMORY[0x270F3BCE8]();
}

uint64_t sub_252736D58()
{
  return MEMORY[0x270F3BCF8]();
}

uint64_t sub_252736D68()
{
  return MEMORY[0x270F3BD00]();
}

uint64_t sub_252736D78()
{
  return MEMORY[0x270F3BD08]();
}

uint64_t sub_252736D98()
{
  return MEMORY[0x270F3BD18]();
}

uint64_t sub_252736DA8()
{
  return MEMORY[0x270F3BD20]();
}

uint64_t sub_252736DB8()
{
  return MEMORY[0x270F3BD28]();
}

uint64_t sub_252736DC8()
{
  return MEMORY[0x270F3BD30]();
}

uint64_t sub_252736DD8()
{
  return MEMORY[0x270F3BD38]();
}

uint64_t sub_252736DE8()
{
  return MEMORY[0x270F3BD40]();
}

uint64_t sub_252736DF8()
{
  return MEMORY[0x270F3BD48]();
}

uint64_t sub_252736E08()
{
  return MEMORY[0x270F3BD50]();
}

uint64_t sub_252736E18()
{
  return MEMORY[0x270F3BD58]();
}

uint64_t sub_252736E28()
{
  return MEMORY[0x270F3BD60]();
}

uint64_t sub_252736E38()
{
  return MEMORY[0x270F3BD68]();
}

uint64_t sub_252736E48()
{
  return MEMORY[0x270F3BD70]();
}

uint64_t sub_252736E58()
{
  return MEMORY[0x270F3BD78]();
}

uint64_t sub_252736E68()
{
  return MEMORY[0x270F3BD80]();
}

uint64_t sub_252736E78()
{
  return MEMORY[0x270F3BD88]();
}

uint64_t sub_252736E88()
{
  return MEMORY[0x270F3BD90]();
}

uint64_t sub_252736E98()
{
  return MEMORY[0x270F3BD98]();
}

uint64_t sub_252736EA8()
{
  return MEMORY[0x270F3BDA0]();
}

uint64_t sub_252736EB8()
{
  return MEMORY[0x270F3BDA8]();
}

uint64_t sub_252736EC8()
{
  return MEMORY[0x270F3BDB0]();
}

uint64_t sub_252736ED8()
{
  return MEMORY[0x270F3BDB8]();
}

uint64_t sub_252736EF8()
{
  return MEMORY[0x270F3BDC8]();
}

uint64_t sub_252736F08()
{
  return MEMORY[0x270F3BDD0]();
}

uint64_t sub_252736F18()
{
  return MEMORY[0x270F3BDD8]();
}

uint64_t sub_252736F28()
{
  return MEMORY[0x270F3BDE0]();
}

uint64_t sub_252736F38()
{
  return MEMORY[0x270F3BDE8]();
}

uint64_t sub_252736F48()
{
  return MEMORY[0x270F3BDF0]();
}

uint64_t sub_252736F58()
{
  return MEMORY[0x270F3BDF8]();
}

uint64_t sub_252736F68()
{
  return MEMORY[0x270F3BE00]();
}

uint64_t sub_252736F78()
{
  return MEMORY[0x270F3BE08]();
}

uint64_t sub_252736F88()
{
  return MEMORY[0x270F3BE68]();
}

uint64_t sub_252736F98()
{
  return MEMORY[0x270F3BE70]();
}

uint64_t sub_252736FA8()
{
  return MEMORY[0x270F3BF00]();
}

uint64_t sub_252736FB8()
{
  return MEMORY[0x270F3BF08]();
}

uint64_t sub_252736FC8()
{
  return MEMORY[0x270F3BF10]();
}

uint64_t sub_252736FD8()
{
  return MEMORY[0x270F3BF18]();
}

uint64_t sub_252736FE8()
{
  return MEMORY[0x270F3BF20]();
}

uint64_t sub_252736FF8()
{
  return MEMORY[0x270F3BF28]();
}

uint64_t sub_252737008()
{
  return MEMORY[0x270F3BF30]();
}

uint64_t sub_252737018()
{
  return MEMORY[0x270F3BF38]();
}

uint64_t sub_252737028()
{
  return MEMORY[0x270F3BF40]();
}

uint64_t sub_252737038()
{
  return MEMORY[0x270F3BF48]();
}

uint64_t sub_252737048()
{
  return MEMORY[0x270F3BF50]();
}

uint64_t sub_252737058()
{
  return MEMORY[0x270F3A168]();
}

uint64_t sub_252737068()
{
  return MEMORY[0x270F3A170]();
}

uint64_t sub_252737078()
{
  return MEMORY[0x270F3A178]();
}

uint64_t sub_252737088()
{
  return MEMORY[0x270F3A180]();
}

uint64_t sub_252737098()
{
  return MEMORY[0x270F3A188]();
}

uint64_t sub_2527370A8()
{
  return MEMORY[0x270F07EF8]();
}

uint64_t sub_2527370B8()
{
  return MEMORY[0x270F07F00]();
}

uint64_t sub_2527370C8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2527370D8()
{
  return MEMORY[0x270F3C048]();
}

uint64_t sub_2527370E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2527370F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_252737108()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252737118()
{
  return MEMORY[0x270EE3AF8]();
}

uint64_t sub_252737128()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_252737138()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_252737148()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_252737158()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_252737168()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_252737178()
{
  return MEMORY[0x270EFEC00]();
}

uint64_t sub_252737188()
{
  return MEMORY[0x270EFEC20]();
}

uint64_t sub_252737198()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_2527371A8()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_2527371B8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2527371C8()
{
  return MEMORY[0x270EFEDD0]();
}

uint64_t sub_2527371D8()
{
  return MEMORY[0x270EFEDE0]();
}

uint64_t sub_2527371E8()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_2527371F8()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_252737208()
{
  return MEMORY[0x270F3C068]();
}

uint64_t sub_252737218()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_252737228()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_252737238()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_252737248()
{
  return MEMORY[0x270EFF0C0]();
}

uint64_t sub_252737258()
{
  return MEMORY[0x270EFF0C8]();
}

uint64_t sub_252737268()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_252737278()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_252737288()
{
  return MEMORY[0x270EFF248]();
}

uint64_t sub_252737298()
{
  return MEMORY[0x270EFF250]();
}

uint64_t sub_2527372A8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_2527372B8()
{
  return MEMORY[0x270EFF448]();
}

uint64_t sub_2527372C8()
{
  return MEMORY[0x270EFF450]();
}

uint64_t sub_2527372D8()
{
  return MEMORY[0x270EFF458]();
}

uint64_t sub_2527372E8()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_2527372F8()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_252737308()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_252737318()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_252737338()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_252737348()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_252737358()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_252737368()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_252737378()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_252737388()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_252737398()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2527373A8()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_2527373B8()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2527373C8()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_2527373D8()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_2527373E8()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_2527373F8()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_252737408()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_252737418()
{
  return MEMORY[0x270EFF920]();
}

uint64_t sub_252737428()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_252737438()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_252737448()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_252737458()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_252737468()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_252737478()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_252737488()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_252737498()
{
  return MEMORY[0x270EFFAE8]();
}

uint64_t sub_2527374A8()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_2527374B8()
{
  return MEMORY[0x270EFFC28]();
}

uint64_t sub_2527374C8()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_2527374D8()
{
  return MEMORY[0x270EFFDD8]();
}

uint64_t sub_2527374E8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2527374F8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_252737508()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_252737518()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_252737528()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_252737538()
{
  return MEMORY[0x270F00258]();
}

uint64_t sub_252737548()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_252737558()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_252737568()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_252737578()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_252737588()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_252737598()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_2527375A8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2527375B8()
{
  return MEMORY[0x270F005D0]();
}

uint64_t sub_2527375C8()
{
  return MEMORY[0x270F005D8]();
}

uint64_t sub_2527375D8()
{
  return MEMORY[0x270F005F8]();
}

uint64_t sub_2527375E8()
{
  return MEMORY[0x270F00660]();
}

uint64_t sub_2527375F8()
{
  return MEMORY[0x270F00668]();
}

uint64_t sub_252737608()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_252737618()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_252737628()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_252737638()
{
  return MEMORY[0x270F00898]();
}

uint64_t sub_252737648()
{
  return MEMORY[0x270F008A8]();
}

uint64_t sub_252737658()
{
  return MEMORY[0x270F008B8]();
}

uint64_t sub_252737668()
{
  return MEMORY[0x270F008C0]();
}

uint64_t sub_252737678()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_252737688()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_252737698()
{
  return MEMORY[0x270F00908]();
}

uint64_t sub_2527376A8()
{
  return MEMORY[0x270F00910]();
}

uint64_t sub_2527376B8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2527376C8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2527376D8()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2527376E8()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_2527376F8()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_252737708()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_252737718()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_252737728()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_252737738()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_252737748()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_252737758()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_252737768()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_252737778()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_252737788()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_252737798()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_2527377A8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_2527377B8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_2527377C8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2527377D8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2527377E8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2527377F8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_252737808()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_252737818()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_252737828()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_252737838()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_252737848()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_252737858()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_252737868()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_252737878()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_252737888()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_252737898()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2527378A8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2527378B8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2527378C8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2527378D8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2527378E8()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_2527378F8()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_252737908()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_252737918()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_252737928()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_252737938()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_252737948()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_252737958()
{
  return MEMORY[0x270F01970]();
}

uint64_t sub_252737968()
{
  return MEMORY[0x270F01978]();
}

uint64_t sub_252737978()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_252737988()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_252737998()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_2527379A8()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_2527379B8()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_2527379C8()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_2527379D8()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_2527379E8()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_2527379F8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_252737A08()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_252737A18()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_252737A28()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_252737A38()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_252737A48()
{
  return MEMORY[0x270F021F0]();
}

uint64_t sub_252737A58()
{
  return MEMORY[0x270F021F8]();
}

uint64_t sub_252737A68()
{
  return MEMORY[0x270F02200]();
}

uint64_t sub_252737A78()
{
  return MEMORY[0x270F02208]();
}

uint64_t sub_252737A88()
{
  return MEMORY[0x270F02210]();
}

uint64_t sub_252737A98()
{
  return MEMORY[0x270F02218]();
}

uint64_t sub_252737AA8()
{
  return MEMORY[0x270F02288]();
}

uint64_t sub_252737AB8()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_252737AC8()
{
  return MEMORY[0x270F022F0]();
}

uint64_t sub_252737AD8()
{
  return MEMORY[0x270F02530]();
}

uint64_t sub_252737AE8()
{
  return MEMORY[0x270F02558]();
}

uint64_t sub_252737AF8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_252737B08()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_252737B18()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_252737B38()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_252737B48()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_252737B58()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_252737B78()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_252737B88()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_252737B98()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_252737BA8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_252737BB8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_252737BC8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_252737BD8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_252737BE8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_252737BF8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_252737C08()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_252737C18()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_252737C28()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_252737C38()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_252737C48()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_252737C58()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_252737C68()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_252737C78()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_252737C88()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_252737C98()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_252737CA8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_252737CB8()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_252737CC8()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_252737CD8()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_252737CE8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_252737CF8()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_252737D08()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_252737D18()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_252737D28()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_252737D38()
{
  return MEMORY[0x270F02D40]();
}

uint64_t sub_252737D48()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_252737D58()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_252737D68()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_252737D78()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_252737D88()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_252737D98()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_252737DA8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_252737DB8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_252737DC8()
{
  return MEMORY[0x270F03020]();
}

uint64_t sub_252737DD8()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_252737DE8()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_252737DF8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_252737E08()
{
  return MEMORY[0x270F03198]();
}

uint64_t sub_252737E18()
{
  return MEMORY[0x270F031A0]();
}

uint64_t sub_252737E28()
{
  return MEMORY[0x270F03218]();
}

uint64_t sub_252737E38()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_252737E48()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_252737E58()
{
  return MEMORY[0x270F07E68]();
}

uint64_t sub_252737E68()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_252737E78()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_252737E88()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_252737E98()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_252737EA8()
{
  return MEMORY[0x270F03390]();
}

uint64_t sub_252737EB8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_252737EC8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_252737ED8()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_252737EE8()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_252737EF8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_252737F08()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_252737F18()
{
  return MEMORY[0x270F035A0]();
}

uint64_t sub_252737F28()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_252737F38()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_252737F48()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_252737F58()
{
  return MEMORY[0x270F037E0]();
}

uint64_t sub_252737F68()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_252737F78()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_252737F88()
{
  return MEMORY[0x270F038C8]();
}

uint64_t sub_252737F98()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_252737FA8()
{
  return MEMORY[0x270F03A28]();
}

uint64_t sub_252737FB8()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_252737FC8()
{
  return MEMORY[0x270F03B58]();
}

uint64_t sub_252737FD8()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_252737FE8()
{
  return MEMORY[0x270F03CF8]();
}

uint64_t sub_252737FF8()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_252738008()
{
  return MEMORY[0x270F03D98]();
}

uint64_t sub_252738018()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_252738028()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_252738038()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_252738048()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_252738058()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_252738068()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_252738078()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_252738088()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_252738098()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2527380A8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2527380B8()
{
  return MEMORY[0x270F041E0]();
}

uint64_t sub_2527380C8()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_2527380D8()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_2527380E8()
{
  return MEMORY[0x270F042A8]();
}

uint64_t sub_2527380F8()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_252738108()
{
  return MEMORY[0x270F04300]();
}

uint64_t sub_252738118()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_252738128()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_252738138()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_252738148()
{
  return MEMORY[0x270F3C070]();
}

uint64_t sub_252738158()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_252738168()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_252738178()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_252738188()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_252738198()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2527381A8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2527381B8()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2527381C8()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2527381D8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2527381E8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2527381F8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_252738208()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_252738218()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_252738228()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_252738238()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_252738248()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_252738258()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_252738268()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_252738278()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_252738288()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_252738298()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2527382A8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2527382B8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2527382E8()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_252738308()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_252738328()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_252738338()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_252738348()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_252738358()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_252738368()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_252738378()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_252738388()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_252738398()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2527383A8()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_2527383B8()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_2527383C8()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_2527383D8()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_2527383E8()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_2527383F8()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_252738408()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_252738418()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_252738428()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_252738438()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_252738448()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_252738458()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_252738468()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_252738478()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_252738488()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_252738498()
{
  return MEMORY[0x270F04B98]();
}

uint64_t sub_2527384A8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2527384B8()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_2527384C8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2527384D8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2527384E8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_2527384F8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_252738508()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_252738518()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_252738528()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_252738538()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_252738548()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_252738558()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_252738568()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_252738578()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_252738588()
{
  return MEMORY[0x270F04F68]();
}

uint64_t sub_252738598()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_2527385A8()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_2527385B8()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_2527385C8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_2527385D8()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_2527385E8()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_2527385F8()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_252738608()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_252738618()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_252738628()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_252738638()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_252738648()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_252738658()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_252738668()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_252738678()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_252738688()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_252738698()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_2527386A8()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_2527386B8()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_2527386C8()
{
  return MEMORY[0x270F053B0]();
}

uint64_t sub_2527386D8()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2527386E8()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_2527386F8()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_252738708()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_252738718()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252738728()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252738738()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_252738748()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_252738758()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_252738768()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252738778()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_252738788()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_252738798()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2527387A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2527387B8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2527387C8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2527387D8()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_2527387E8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2527387F8()
{
  return MEMORY[0x270F3C078]();
}

uint64_t sub_252738808()
{
  return MEMORY[0x270F3C098]();
}

uint64_t sub_252738818()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252738828()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_252738838()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_252738848()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_252738858()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252738868()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252738878()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_252738888()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2527388A8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2527388B8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2527388C8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2527388D8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2527388E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2527388F8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_252738908()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252738918()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_252738928()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252738948()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_252738958()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_252738968()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_252738978()
{
  return MEMORY[0x270FA1EE8]();
}

uint64_t sub_252738988()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252738998()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2527389A8()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_2527389B8()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2527389C8()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2527389D8()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_2527389E8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_252738A08()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_252738A18()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_252738A28()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_252738A38()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_252738A48()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_252738A58()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_252738A68()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_252738A78()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252738A88()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_252738A98()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252738AA8()
{
  return MEMORY[0x270EF2140]();
}

uint64_t sub_252738AB8()
{
  return MEMORY[0x270EF2150]();
}

uint64_t sub_252738AC8()
{
  return MEMORY[0x270EF2160]();
}

uint64_t sub_252738AD8()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_252738AE8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252738AF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252738B08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252738B18()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_252738B28()
{
  return MEMORY[0x270EF2450]();
}

uint64_t sub_252738B38()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_252738B48()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_252738B58()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_252738B68()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_252738B78()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252738B88()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_252738B98()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_252738BB8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_252738BC8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252738BD8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_252738BE8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252738BF8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252738C08()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252738C18()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252738C28()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252738C38()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252738C48()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252738C58()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252738C68()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252738C78()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252738C88()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252738C98()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_252738CA8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_252738CB8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252738CC8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_252738CD8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252738CE8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252738CF8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252738D08()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_252738D18()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252738D28()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252738D38()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252738D48()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252738D58()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252738D68()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252738D78()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_252738D88()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252738D98()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_252738DA8()
{
  return MEMORY[0x270FA0128]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
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

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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